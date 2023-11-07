Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C87E4D8C
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 00:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41D10E182;
	Tue,  7 Nov 2023 23:40:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A710E182;
 Tue,  7 Nov 2023 23:40:35 +0000 (UTC)
Message-ID: <ea475561-781a-49b7-9946-f1848dd5861f@dakr.org>
Date: Wed, 8 Nov 2023 00:40:25 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <20231107053255.2257079-1-airlied@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20231107053255.2257079-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: use an rwlock for the event lock.
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/23 06:32, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This allows it to break the following circular locking dependency.
> 
> Aug 10 07:01:29 dg1test kernel: ======================================================
> Aug 10 07:01:29 dg1test kernel: WARNING: possible circular locking dependency detected
> Aug 10 07:01:29 dg1test kernel: 6.4.0-rc7+ #10 Not tainted
> Aug 10 07:01:29 dg1test kernel: ------------------------------------------------------
> Aug 10 07:01:29 dg1test kernel: wireplumber/2236 is trying to acquire lock:
> Aug 10 07:01:29 dg1test kernel: ffff8fca5320da18 (&fctx->lock){-...}-{2:2}, at: nouveau_fence_wait_uevent_handler+0x2b/0x100 [nouveau]
> Aug 10 07:01:29 dg1test kernel:
>                                  but task is already holding lock:
> Aug 10 07:01:29 dg1test kernel: ffff8fca41208610 (&event->list_lock#2){-...}-{2:2}, at: nvkm_event_ntfy+0x50/0xf0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:
>                                  which lock already depends on the new lock.
> Aug 10 07:01:29 dg1test kernel:
>                                  the existing dependency chain (in reverse order) is:
> Aug 10 07:01:29 dg1test kernel:
>                                  -> #3 (&event->list_lock#2){-...}-{2:2}:
> Aug 10 07:01:29 dg1test kernel:        _raw_spin_lock_irqsave+0x4b/0x70
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy+0x50/0xf0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        ga100_fifo_nonstall_intr+0x24/0x30 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_intr+0x12c/0x240 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __handle_irq_event_percpu+0x88/0x240
> Aug 10 07:01:29 dg1test kernel:        handle_irq_event+0x38/0x80
> Aug 10 07:01:29 dg1test kernel:        handle_edge_irq+0xa3/0x240
> Aug 10 07:01:29 dg1test kernel:        __common_interrupt+0x72/0x160
> Aug 10 07:01:29 dg1test kernel:        common_interrupt+0x60/0xe0
> Aug 10 07:01:29 dg1test kernel:        asm_common_interrupt+0x26/0x40
> Aug 10 07:01:29 dg1test kernel:
>                                  -> #2 (&device->intr.lock){-...}-{2:2}:
> Aug 10 07:01:29 dg1test kernel:        _raw_spin_lock_irqsave+0x4b/0x70
> Aug 10 07:01:29 dg1test kernel:        nvkm_inth_allow+0x2c/0x80 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy_state+0x181/0x250 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy_allow+0x63/0xd0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_uevent_mthd+0x4d/0x70 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_ioctl+0x10b/0x250 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvif_object_mthd+0xa8/0x1f0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvif_event_allow+0x2a/0xa0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nouveau_fence_enable_signaling+0x78/0x80 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __dma_fence_enable_signaling+0x5e/0x100
> Aug 10 07:01:29 dg1test kernel:        dma_fence_add_callback+0x4b/0xd0
> Aug 10 07:01:29 dg1test kernel:        nouveau_cli_work_queue+0xae/0x110 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nouveau_gem_object_close+0x1d1/0x2a0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        drm_gem_handle_delete+0x70/0xe0 [drm]
> Aug 10 07:01:29 dg1test kernel:        drm_ioctl_kernel+0xa5/0x150 [drm]
> Aug 10 07:01:29 dg1test kernel:        drm_ioctl+0x256/0x490 [drm]
> Aug 10 07:01:29 dg1test kernel:        nouveau_drm_ioctl+0x5a/0xb0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __x64_sys_ioctl+0x91/0xd0
> Aug 10 07:01:29 dg1test kernel:        do_syscall_64+0x3c/0x90
> Aug 10 07:01:29 dg1test kernel:        entry_SYSCALL_64_after_hwframe+0x72/0xdc
> Aug 10 07:01:29 dg1test kernel:
>                                  -> #1 (&event->refs_lock#4){....}-{2:2}:
> Aug 10 07:01:29 dg1test kernel:        _raw_spin_lock_irqsave+0x4b/0x70
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy_state+0x37/0x250 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy_allow+0x63/0xd0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_uevent_mthd+0x4d/0x70 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_ioctl+0x10b/0x250 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvif_object_mthd+0xa8/0x1f0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvif_event_allow+0x2a/0xa0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nouveau_fence_enable_signaling+0x78/0x80 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __dma_fence_enable_signaling+0x5e/0x100
> Aug 10 07:01:29 dg1test kernel:        dma_fence_add_callback+0x4b/0xd0
> Aug 10 07:01:29 dg1test kernel:        nouveau_cli_work_queue+0xae/0x110 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nouveau_gem_object_close+0x1d1/0x2a0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        drm_gem_handle_delete+0x70/0xe0 [drm]
> Aug 10 07:01:29 dg1test kernel:        drm_ioctl_kernel+0xa5/0x150 [drm]
> Aug 10 07:01:29 dg1test kernel:        drm_ioctl+0x256/0x490 [drm]
> Aug 10 07:01:29 dg1test kernel:        nouveau_drm_ioctl+0x5a/0xb0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __x64_sys_ioctl+0x91/0xd0
> Aug 10 07:01:29 dg1test kernel:        do_syscall_64+0x3c/0x90
> Aug 10 07:01:29 dg1test kernel:        entry_SYSCALL_64_after_hwframe+0x72/0xdc
> Aug 10 07:01:29 dg1test kernel:
>                                  -> #0 (&fctx->lock){-...}-{2:2}:
> Aug 10 07:01:29 dg1test kernel:        __lock_acquire+0x14e3/0x2240
> Aug 10 07:01:29 dg1test kernel:        lock_acquire+0xc8/0x2a0
> Aug 10 07:01:29 dg1test kernel:        _raw_spin_lock_irqsave+0x4b/0x70
> Aug 10 07:01:29 dg1test kernel:        nouveau_fence_wait_uevent_handler+0x2b/0x100 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_client_event+0xf/0x20 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_event_ntfy+0x9b/0xf0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        ga100_fifo_nonstall_intr+0x24/0x30 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        nvkm_intr+0x12c/0x240 [nouveau]
> Aug 10 07:01:29 dg1test kernel:        __handle_irq_event_percpu+0x88/0x240
> Aug 10 07:01:29 dg1test kernel:        handle_irq_event+0x38/0x80
> Aug 10 07:01:29 dg1test kernel:        handle_edge_irq+0xa3/0x240
> Aug 10 07:01:29 dg1test kernel:        __common_interrupt+0x72/0x160
> Aug 10 07:01:29 dg1test kernel:        common_interrupt+0x60/0xe0
> Aug 10 07:01:29 dg1test kernel:        asm_common_interrupt+0x26/0x40
> Aug 10 07:01:29 dg1test kernel:
>                                  other info that might help us debug this:
> Aug 10 07:01:29 dg1test kernel: Chain exists of:
>                                    &fctx->lock --> &device->intr.lock --> &event->list_lock#2
> Aug 10 07:01:29 dg1test kernel:  Possible unsafe locking scenario:
> Aug 10 07:01:29 dg1test kernel:        CPU0                    CPU1
> Aug 10 07:01:29 dg1test kernel:        ----                    ----
> Aug 10 07:01:29 dg1test kernel:   lock(&event->list_lock#2);
> Aug 10 07:01:29 dg1test kernel:                                lock(&device->intr.lock);
> Aug 10 07:01:29 dg1test kernel:                                lock(&event->list_lock#2);
> Aug 10 07:01:29 dg1test kernel:   lock(&fctx->lock);
> Aug 10 07:01:29 dg1test kernel:
>                                   *** DEADLOCK ***
> Aug 10 07:01:29 dg1test kernel: 2 locks held by wireplumber/2236:
> Aug 10 07:01:29 dg1test kernel:  #0: ffff8fca53177bf8 (&device->intr.lock){-...}-{2:2}, at: nvkm_intr+0x29/0x240 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  #1: ffff8fca41208610 (&event->list_lock#2){-...}-{2:2}, at: nvkm_event_ntfy+0x50/0xf0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:
>                                  stack backtrace:
> Aug 10 07:01:29 dg1test kernel: CPU: 6 PID: 2236 Comm: wireplumber Not tainted 6.4.0-rc7+ #10
> Aug 10 07:01:29 dg1test kernel: Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PRO WIFI/Z390 I AORUS PRO WIFI-CF, BIOS F8 11/05/2021
> Aug 10 07:01:29 dg1test kernel: Call Trace:
> Aug 10 07:01:29 dg1test kernel:  <TASK>
> Aug 10 07:01:29 dg1test kernel:  dump_stack_lvl+0x5b/0x90
> Aug 10 07:01:29 dg1test kernel:  check_noncircular+0xe2/0x110
> Aug 10 07:01:29 dg1test kernel:  __lock_acquire+0x14e3/0x2240
> Aug 10 07:01:29 dg1test kernel:  lock_acquire+0xc8/0x2a0
> Aug 10 07:01:29 dg1test kernel:  ? nouveau_fence_wait_uevent_handler+0x2b/0x100 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  ? lock_acquire+0xc8/0x2a0
> Aug 10 07:01:29 dg1test kernel:  _raw_spin_lock_irqsave+0x4b/0x70
> Aug 10 07:01:29 dg1test kernel:  ? nouveau_fence_wait_uevent_handler+0x2b/0x100 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  nouveau_fence_wait_uevent_handler+0x2b/0x100 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  nvkm_client_event+0xf/0x20 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  nvkm_event_ntfy+0x9b/0xf0 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  ga100_fifo_nonstall_intr+0x24/0x30 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  nvkm_intr+0x12c/0x240 [nouveau]
> Aug 10 07:01:29 dg1test kernel:  __handle_irq_event_percpu+0x88/0x240
> Aug 10 07:01:29 dg1test kernel:  handle_irq_event+0x38/0x80
> Aug 10 07:01:29 dg1test kernel:  handle_edge_irq+0xa3/0x240
> Aug 10 07:01:29 dg1test kernel:  __common_interrupt+0x72/0x160
> Aug 10 07:01:29 dg1test kernel:  common_interrupt+0x60/0xe0
> Aug 10 07:01:29 dg1test kernel:  asm_common_interrupt+0x26/0x40
> Aug 10 07:01:29 dg1test kernel: RIP: 0033:0x7fb66174d700
> Aug 10 07:01:29 dg1test kernel: Code: c1 e2 05 29 ca 8d 0c 10 0f be 07 84 c0 75 eb 89 c8 c3 0f 1f 84 00 00 00 00 00 f3 0f 1e fa e9 d7 0f fc ff 0f 1f 80 00 00 00 00 <f3> 0f 1e fa e9 c7 0f fc>
> Aug 10 07:01:29 dg1test kernel: RSP: 002b:00007ffdd3c48438 EFLAGS: 00000206
> Aug 10 07:01:29 dg1test kernel: RAX: 000055bb758763c0 RBX: 000055bb758752c0 RCX: 00000000000028b0
> Aug 10 07:01:29 dg1test kernel: RDX: 000055bb758752c0 RSI: 000055bb75887490 RDI: 000055bb75862950
> Aug 10 07:01:29 dg1test kernel: RBP: 00007ffdd3c48490 R08: 000055bb75873b10 R09: 0000000000000001
> Aug 10 07:01:29 dg1test kernel: R10: 0000000000000004 R11: 000055bb7587f000 R12: 000055bb75887490
> Aug 10 07:01:29 dg1test kernel: R13: 000055bb757f6280 R14: 000055bb758875c0 R15: 000055bb757f6280
> Aug 10 07:01:29 dg1test kernel:  </TASK>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Tested-by: Danilo Krummrich <dakr@redhat.com>

and

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/include/nvkm/core/event.h |  4 ++--
>   drivers/gpu/drm/nouveau/nvkm/core/event.c         | 12 ++++++------
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
> index 82b267c11147..460459af272d 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
> @@ -14,7 +14,7 @@ struct nvkm_event {
>   	int index_nr;
>   
>   	spinlock_t refs_lock;
> -	spinlock_t list_lock;
> +	rwlock_t list_lock;
>   	int *refs;
>   
>   	struct list_head ntfy;
> @@ -38,7 +38,7 @@ nvkm_event_init(const struct nvkm_event_func *func, struct nvkm_subdev *subdev,
>   		int types_nr, int index_nr, struct nvkm_event *event)
>   {
>   	spin_lock_init(&event->refs_lock);
> -	spin_lock_init(&event->list_lock);
> +	rwlock_init(&event->list_lock);
>   	return __nvkm_event_init(func, subdev, types_nr, index_nr, event);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/event.c b/drivers/gpu/drm/nouveau/nvkm/core/event.c
> index a6c877135598..61fed7792e41 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/event.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/event.c
> @@ -81,17 +81,17 @@ nvkm_event_ntfy_state(struct nvkm_event_ntfy *ntfy)
>   static void
>   nvkm_event_ntfy_remove(struct nvkm_event_ntfy *ntfy)
>   {
> -	spin_lock_irq(&ntfy->event->list_lock);
> +	write_lock_irq(&ntfy->event->list_lock);
>   	list_del_init(&ntfy->head);
> -	spin_unlock_irq(&ntfy->event->list_lock);
> +	write_unlock_irq(&ntfy->event->list_lock);
>   }
>   
>   static void
>   nvkm_event_ntfy_insert(struct nvkm_event_ntfy *ntfy)
>   {
> -	spin_lock_irq(&ntfy->event->list_lock);
> +	write_lock_irq(&ntfy->event->list_lock);
>   	list_add_tail(&ntfy->head, &ntfy->event->ntfy);
> -	spin_unlock_irq(&ntfy->event->list_lock);
> +	write_unlock_irq(&ntfy->event->list_lock);
>   }
>   
>   static void
> @@ -176,7 +176,7 @@ nvkm_event_ntfy(struct nvkm_event *event, int id, u32 bits)
>   		return;
>   
>   	nvkm_trace(event->subdev, "event: ntfy %08x on %d\n", bits, id);
> -	spin_lock_irqsave(&event->list_lock, flags);
> +	read_lock_irqsave(&event->list_lock, flags);
>   
>   	list_for_each_entry_safe(ntfy, ntmp, &event->ntfy, head) {
>   		if (ntfy->id == id && ntfy->bits & bits) {
> @@ -185,7 +185,7 @@ nvkm_event_ntfy(struct nvkm_event *event, int id, u32 bits)
>   		}
>   	}
>   
> -	spin_unlock_irqrestore(&event->list_lock, flags);
> +	read_unlock_irqrestore(&event->list_lock, flags);
>   }
>   
>   void
