Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BDB33A2B2
	for <lists+nouveau@lfdr.de>; Sun, 14 Mar 2021 05:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA186E200;
	Sun, 14 Mar 2021 04:48:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A356E200
 for <nouveau@lists.freedesktop.org>; Sun, 14 Mar 2021 04:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615697314;
 bh=EgqnkS7m3UKPjyjwR+ZA0BNF2sN0HKjOx6uwgzuvpYQ=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=G3CB6BCdxoQqK+t2aCwNUb7hA7XZFMHsQ0x5aqzpWA78rAOX5v0sRwhFjCdVZcWJF
 B0Q5gCGSj9ijEJO40spjlvk56jOXCCgWlFYnnBICgRQhPeoh840leKZ29pePz/DInw
 zQJA2T9ZexCDVwrnBOjVEruD9PEn1MmWFFvP99YQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.221.149.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1m7qu91Hd5-00nRBK; Sun, 14
 Mar 2021 05:48:34 +0100
Message-ID: <95c41bb3988882c202a2b7d6802f7528682e26b1.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun, 14 Mar 2021 05:48:33 +0100
In-Reply-To: <987bd1ca15545ca896c4e1c115e89a1bba0ad306.camel@gmx.de>
References: <987bd1ca15545ca896c4e1c115e89a1bba0ad306.camel@gmx.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:4KEOnbqbXiIXZH/7AkhGScp4LjGGQMJ7PhnfyWtD1pte1wAbAkL
 Nzwpgpqh4bI1/6HSL84Ji2NcOE80ntGoyInKI/3+pu3cIz++0h0+u2PW9Ci9rNKWMFrJPo/
 UyL6/2NNowOMDpLU1dEDPJ4Q5kXW/PTqyhOdJPBGhAmVHjFUX76LxeqsICUBtL69K+NHz2M
 KJx/56Lv3OOcxMOk1+lKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c99cILIeD2g=:dnQSWeMkOPINT1n1yJGMps
 sLCdDI9XgP2Odpx/VpAR4zLC93TRa7WQulHFUFyuooPQLx4Ni0jV+c8zSn7K1hD4kn1QsQII+
 BDiFfiHwlPw+b5M0/90p4J20ro9rAzwDoC1q+ae63GmHXEiwTjFGm9w/XymdCTN7x7VO7OVLX
 aWeYdQz8mQsH3x8snxJzVAJgihWB2RLktks/0GSvf5F6ocpQKTLcD+13x2h65Ae9/XWKKganc
 bTV4nEKvmFkV7+6qNUtzte+2hmK8cs1bo9lVFY5VmXM7n5UVtB9m7ZGtcP0WZsabxIRNUSTSF
 65Yd2pF+g2IsNFAD7CQc2X7nGh4iRNAY4SZf9eGKbTtAR3kRC0J95Kf5Pfk6iemNUxIa8ym7z
 5sruc6pGQRqKzTRihy/MXo8ZKPgImyUGYhEt2L6FvpmW3ZskmAHLNyrT7obgw8w8W39AnQf5T
 c3UpwzbwtgwbamR/Li/XGZn6FA6OrfJwB9B/Dp8uOWf3NybBZMZ6gIDCullngc/NQPryg0v1f
 lsDbFCJND7oZkaedkdIZ2QimV7paqPmqJGsHoxCnPRFC72u5XwzZjI+KuPPo06GeFHfU28e8W
 cJTaso/O/9PQi4lJHqfYEnzWhSIC4XW3S4XLlbBlhHstAserCX9Xzb6b6C38h4+uvJJgg63c4
 MlPeOF8Ci3E3nsNfCh7vXqMBw+MzQ//+nbhQUsehIuTyx0k4C6YamyPi5h30PZxunBYqQu60j
 7cgBGZtuMIEB2gBoM4qFYWQvW7LEtAK3UaiE41S4WWQQ+Se8Bn1E3XevgZvIakbvt96i42cdq
 65b0oKih6GVhCuqnqbEAjAhbO3FdVgmCZLfCwKDfY+NvxkleelKrJuu0iR5/0B0SPTAIgBcBS
 Fq8ytnFqutKn2JQaF6xA==
Subject: [Nouveau] [bisected] Re: nouveau: lockdep cli->mutex vs
 reservation_ww_class_mutex deadlock report
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This little bugger bisected to...

	b73cd1e2ebfc "drm/ttm: stop destroying pinned ghost object"

...and (the second time around) was confirmed on the spot.  However,
while the fingered commit still reverts cleanly, doing so at HEAD does
not make lockdep return to happy camper state (leading to bisection
#2), ie the fingered commit is only the beginning of nouveau's 5.12
cycle lockdep woes.

homer:..kernel/linux-master # quilt applied|grep revert
patches/revert-drm-ttm-Remove-pinned-bos-from-LRU-in-ttm_bo_move_to_lru_tail-v2.patch
patches/revert-drm-ttm-cleanup-LRU-handling-further.patch
patches/revert-drm-ttm-use-pin_count-more-extensively.patch
patches/revert-drm-ttm-stop-destroying-pinned-ghost-object.patch

That still ain't enough to appease lockdep at HEAD.  I'm not going to
muck about with it beyond that, since this looks a whole lot like yet
another example of "fixing stuff exposes other busted stuff".

On Wed, 2021-03-10 at 10:58 +0100, Mike Galbraith wrote:
> [   29.966927] ======================================================
> [   29.966929] WARNING: possible circular locking dependency detected
> [   29.966932] 5.12.0.g05a59d7-master #2 Tainted: G        W   E
> [   29.966934] ------------------------------------------------------
> [   29.966937] X/2145 is trying to acquire lock:
> [   29.966939] ffff888120714518 (&cli->mutex){+.+.}-{3:3}, at: nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.967002]
>                but task is already holding lock:
> [   29.967004] ffff888123c201a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: nouveau_bo_pin+0x2b/0x310 [nouveau]
> [   29.967053]
>                which lock already depends on the new lock.
>
> [   29.967056]
>                the existing dependency chain (in reverse order) is:
> [   29.967058]
>                -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [   29.967063]        __ww_mutex_lock.constprop.16+0xbe/0x10d0
> [   29.967069]        nouveau_bo_pin+0x2b/0x310 [nouveau]
> [   29.967112]        nouveau_channel_prep+0x106/0x2e0 [nouveau]
> [   29.967151]        nouveau_channel_new+0x4f/0x760 [nouveau]
> [   29.967188]        nouveau_abi16_ioctl_channel_alloc+0xdf/0x350 [nouveau]
> [   29.967223]        drm_ioctl_kernel+0x91/0xe0 [drm]
> [   29.967245]        drm_ioctl+0x2db/0x380 [drm]
> [   29.967259]        nouveau_drm_ioctl+0x56/0xb0 [nouveau]
> [   29.967303]        __x64_sys_ioctl+0x76/0xb0
> [   29.967307]        do_syscall_64+0x33/0x40
> [   29.967310]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   29.967314]
>                -> #0 (&cli->mutex){+.+.}-{3:3}:
> [   29.967318]        __lock_acquire+0x1494/0x1ac0
> [   29.967322]        lock_acquire+0x23e/0x3b0
> [   29.967325]        __mutex_lock+0x95/0x9d0
> [   29.967330]        nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.967377]        ttm_bo_handle_move_mem+0x79/0x130 [ttm]
> [   29.967384]        ttm_bo_validate+0x156/0x1b0 [ttm]
> [   29.967390]        nouveau_bo_validate+0x48/0x70 [nouveau]
> [   29.967438]        nouveau_bo_pin+0x1de/0x310 [nouveau]
> [   29.967487]        nv50_wndw_prepare_fb+0x53/0x4d0 [nouveau]
> [   29.967531]        drm_atomic_helper_prepare_planes+0x8a/0x110 [drm_kms_helper]
> [   29.967547]        nv50_disp_atomic_commit+0xa9/0x1b0 [nouveau]
> [   29.967593]        drm_atomic_helper_update_plane+0x10a/0x150 [drm_kms_helper]
> [   29.967606]        drm_mode_cursor_universal+0x10b/0x220 [drm]
> [   29.967627]        drm_mode_cursor_common+0x190/0x200 [drm]
> [   29.967648]        drm_mode_cursor_ioctl+0x3d/0x50 [drm]
> [   29.967669]        drm_ioctl_kernel+0x91/0xe0 [drm]
> [   29.967684]        drm_ioctl+0x2db/0x380 [drm]
> [   29.967699]        nouveau_drm_ioctl+0x56/0xb0 [nouveau]
> [   29.967748]        __x64_sys_ioctl+0x76/0xb0
> [   29.967752]        do_syscall_64+0x33/0x40
> [   29.967756]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   29.967760]
>                other info that might help us debug this:
>
> [   29.967764]  Possible unsafe locking scenario:
>
> [   29.967767]        CPU0                    CPU1
> [   29.967770]        ----                    ----
> [   29.967772]   lock(reservation_ww_class_mutex);
> [   29.967776]                                lock(&cli->mutex);
> [   29.967779]                                lock(reservation_ww_class_mutex);
> [   29.967783]   lock(&cli->mutex);
> [   29.967786]
>                 *** DEADLOCK ***
>
> [   29.967790] 3 locks held by X/2145:
> [   29.967792]  #0: ffff88810365bcf8 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_cursor_common+0x87/0x200 [drm]
> [   29.967817]  #1: ffff888108d9e098 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0xc3/0xe0 [drm]
> [   29.967841]  #2: ffff888123c201a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: nouveau_bo_pin+0x2b/0x310 [nouveau]
> [   29.967896]
>                stack backtrace:
> [   29.967899] CPU: 6 PID: 2145 Comm: X Kdump: loaded Tainted: G        W   E     5.12.0.g05a59d7-master #2
> [   29.967904] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
> [   29.967908] Call Trace:
> [   29.967911]  dump_stack+0x6d/0x89
> [   29.967915]  check_noncircular+0xe7/0x100
> [   29.967919]  ? nvkm_vram_map+0x48/0x50 [nouveau]
> [   29.967959]  ? __lock_acquire+0x1494/0x1ac0
> [   29.967963]  __lock_acquire+0x1494/0x1ac0
> [   29.967967]  lock_acquire+0x23e/0x3b0
> [   29.967971]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.968020]  __mutex_lock+0x95/0x9d0
> [   29.968024]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.968070]  ? nvif_vmm_map+0xf4/0x110 [nouveau]
> [   29.968093]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.968137]  ? lock_release+0x160/0x280
> [   29.968141]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.968184]  nouveau_bo_move+0x11f/0x980 [nouveau]
> [   29.968226]  ? up_write+0x17/0x130
> [   29.968229]  ? unmap_mapping_pages+0x53/0x110
> [   29.968234]  ttm_bo_handle_move_mem+0x79/0x130 [ttm]
> [   29.968240]  ttm_bo_validate+0x156/0x1b0 [ttm]
> [   29.968247]  nouveau_bo_validate+0x48/0x70 [nouveau]
> [   29.968289]  nouveau_bo_pin+0x1de/0x310 [nouveau]
> [   29.968330]  nv50_wndw_prepare_fb+0x53/0x4d0 [nouveau]
> [   29.968372]  drm_atomic_helper_prepare_planes+0x8a/0x110 [drm_kms_helper]
> [   29.968384]  ? lockdep_init_map_type+0x58/0x240
> [   29.968388]  nv50_disp_atomic_commit+0xa9/0x1b0 [nouveau]
> [   29.968430]  drm_atomic_helper_update_plane+0x10a/0x150 [drm_kms_helper]
> [   29.968442]  drm_mode_cursor_universal+0x10b/0x220 [drm]
> [   29.968463]  ? lock_is_held_type+0xdd/0x130
> [   29.968468]  drm_mode_cursor_common+0x190/0x200 [drm]
> [   29.968486]  ? drm_mode_setplane+0x190/0x190 [drm]
> [   29.968502]  drm_mode_cursor_ioctl+0x3d/0x50 [drm]
> [   29.968518]  drm_ioctl_kernel+0x91/0xe0 [drm]
> [   29.968533]  drm_ioctl+0x2db/0x380 [drm]
> [   29.968548]  ? drm_mode_setplane+0x190/0x190 [drm]
> [   29.968570]  ? _raw_spin_unlock_irqrestore+0x30/0x60
> [   29.968574]  ? lockdep_hardirqs_on+0x79/0x100
> [   29.968578]  ? _raw_spin_unlock_irqrestore+0x3b/0x60
> [   29.968582]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
> [   29.968632]  __x64_sys_ioctl+0x76/0xb0
> [   29.968636]  ? lockdep_hardirqs_on+0x79/0x100
> [   29.968640]  do_syscall_64+0x33/0x40
> [   29.968644]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   29.968648] RIP: 0033:0x7f1ccfb4e9e7
> [   29.968652] Code: b3 66 90 48 8b 05 b1 14 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 14 2c 00 f7 d8 64 89 01 48
> [   29.968659] RSP: 002b:00007ffca9596058 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   29.968663] RAX: ffffffffffffffda RBX: 000055da9d0c6470 RCX: 00007f1ccfb4e9e7
> [   29.968667] RDX: 00007ffca9596090 RSI: 00000000c01c64a3 RDI: 000000000000000e
> [   29.968670] RBP: 00007ffca9596090 R08: 0000000000000040 R09: 000055da9d0f6310
> [   29.968674] R10: 0000000000000093 R11: 0000000000000246 R12: 00000000c01c64a3
> [   29.968677] R13: 000000000000000e R14: 0000000000000000 R15: 0000000000000000
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
