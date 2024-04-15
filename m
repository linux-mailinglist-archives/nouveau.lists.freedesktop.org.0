Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14548A4B17
	for <lists+nouveau@lfdr.de>; Mon, 15 Apr 2024 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0054F1123C6;
	Mon, 15 Apr 2024 09:06:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31E31123C6;
 Mon, 15 Apr 2024 09:06:35 +0000 (UTC)
Message-ID: <b3121ea0-b0b1-4688-a533-7e19f6838c54@dakr.org>
Date: Mon, 15 Apr 2024 11:06:24 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau: fix instmem race condition around ptr stores
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240411011510.2546857-1-airlied@gmail.com>
Content-Language: en-US
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20240411011510.2546857-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 4/11/24 03:15, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Running a lot of VK CTS in parallel against nouveau, once every
> few hours you might see something like this crash.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000008
> PGD 8000000114e6e067 P4D 8000000114e6e067 PUD 109046067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 7 PID: 53891 Comm: deqp-vk Not tainted 6.8.0-rc6+ #27
> Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PRO WIFI/Z390 I AORUS PRO WIFI-CF, BIOS F8 11/05/2021
> RIP: 0010:gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
> Code: c7 48 01 c8 49 89 45 58 85 d2 0f 84 95 00 00 00 41 0f b7 46 12 49 8b 7e 08 89 da 42 8d 2c f8 48 8b 47 08 41 83 c7 01 48 89 ee <48> 8b 40 08 ff d0 0f 1f 00 49 8b 7e 08 48 89 d9 48 8d 75 04 48 c1
> RSP: 0000:ffffac20c5857838 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: 00000000004d8001 RCX: 0000000000000001
> RDX: 00000000004d8001 RSI: 00000000000006d8 RDI: ffffa07afe332180
> RBP: 00000000000006d8 R08: ffffac20c5857ad0 R09: 0000000000ffff10
> R10: 0000000000000001 R11: ffffa07af27e2de0 R12: 000000000000001c
> R13: ffffac20c5857ad0 R14: ffffa07a96fe9040 R15: 000000000000001c
> FS:  00007fe395eed7c0(0000) GS:ffffa07e2c980000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000008 CR3: 000000011febe001 CR4: 00000000003706f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
> 
> ...
> 
>   ? gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
>   ? gp100_vmm_pgt_mem+0x37/0x180 [nouveau]
>   nvkm_vmm_iter+0x351/0xa20 [nouveau]
>   ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>   ? __lock_acquire+0x3ed/0x2170
>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>   nvkm_vmm_ptes_get_map+0xc2/0x100 [nouveau]
>   ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>   nvkm_vmm_map_locked+0x224/0x3a0 [nouveau]
> 
> Adding any sort of useful debug usually makes it go away, so I hand
> wrote the function in a line, and debugged the asm.
> 
> Every so often pt->memory->ptrs is NULL. This ptrs ptr is set in
> the nv50_instobj_acquire called from nvkm_kmap.
> 
> If Thread A and Thread B both get to nv50_instobj_acquire around
> the same time, and Thread A hits the refcount_set line, and in
> lockstep thread B succeeds at refcount_inc_not_zero, there is a
> chance the ptrs value won't have been stored since refcount_set
> is unordered. Force a memory barrier here, I picked smp_mb, since
> we want it on all CPUs and it's write followed by a read.
> 
> v2: use paired smp_rmb/smp_wmb.
> 
> Cc: linux-stable
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Added a "Fixes:" tag and applied to drm-misc-fixes.

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> index a7f3fc342d87..dd5b5a17ece0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> @@ -222,8 +222,11 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
>   	void __iomem *map = NULL;
>   
>   	/* Already mapped? */
> -	if (refcount_inc_not_zero(&iobj->maps))
> +	if (refcount_inc_not_zero(&iobj->maps)) {
> +		/* read barrier match the wmb on refcount set */
> +		smp_rmb();
>   		return iobj->map;
> +	}
>   
>   	/* Take the lock, and re-check that another thread hasn't
>   	 * already mapped the object in the meantime.
> @@ -250,6 +253,8 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
>   			iobj->base.memory.ptrs = &nv50_instobj_fast;
>   		else
>   			iobj->base.memory.ptrs = &nv50_instobj_slow;
> +		/* barrier to ensure the ptrs are written before refcount is set */
> +		smp_wmb();
>   		refcount_set(&iobj->maps, 1);
>   	}
>   
