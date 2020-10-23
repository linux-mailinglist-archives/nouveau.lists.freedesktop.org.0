Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4390296E3F
	for <lists+nouveau@lfdr.de>; Fri, 23 Oct 2020 14:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001ED6E2D8;
	Fri, 23 Oct 2020 12:13:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Fri, 23 Oct 2020 12:13:13 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096E26E2D8
 for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2020 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1603455189;
 bh=buFmFBI5bWfKQwj2dncf//GIACTmfqOHWf+jzAc/KY8=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=FQSxoLdsD1NvgXNqBDp4WWra0sRydEgD2La6wjuDsZE18FrF7DMKM88v5ILk9e5JS
 hu33jDFPz8idhbjHE2wQK3hKp2VKs3dhsjPo52iYymLYToFMOpGR1UoYTIoZrukWx7
 v4X3Y7aIGi3noYo/3kt8GEuwvgkYgiMCFKIh2yu0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.221.151.75]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbG2-1kEfeG2xWg-00scLR; Fri, 23
 Oct 2020 14:07:14 +0200
Message-ID: <e4bf2fe3c5d2fdeded9b3d873a08094dbf145bf9.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Fri, 23 Oct 2020 14:07:13 +0200
In-Reply-To: <20201023090108.5lunh4vqfpkllmap@linutronix.de>
References: <20201021125324.ualpvrxvzyie6d7d@linutronix.de>
 <a23a826af7c108ea5651e73b8fbae5e653f16e86.camel@gmx.de>
 <20201023090108.5lunh4vqfpkllmap@linutronix.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:pEyd8jNNKABKe5H+htY5zWV2AedmCWj/EeFT0rpBfxQnmEIm51w
 pgtvMG6c0+DfeRY5CjQ4gH7LWTGY6hQpP6NYWF35ZITlSulKs+S+VWcwDBsnru8CwIAyuD/
 DxtH4myxsPCm4XCSEUwVd28+X+wa/8SddC3Qh77cRX+aCSiCWNluWxRdHW0F2i4GMtAyEJI
 +BiT0AF00/Gz41gs5jnpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Oz3rjCiZcI=:IigJ087S05e7u3X7pwI2Lq
 LVZ4EExg0tn8KnwzxQYVTe9So3UapfuQmxRch46cnDyXCCqm67GvewfRbZzGs1JqvdWw8b12t
 ERxODhUZwhV1/NXOmZDCqJBMqKkydAP/CmAKuTqE65leo1PZGVVaMrnuK+l1LsBBggKOpC8Jr
 85QUNOMamzx3EBXZSkhxu+g2VAHFxlpXN0mnQSMaMT+C9D1/B8XwjnrpM4tqdliPhUgfdkWFG
 6atmZUOc/VY/STUyhpfb3daOU2xqcknMKWyM2tzPGCGBt6PXS3ldTVLod8aWrc7Iz47qOAgB2
 JBxrdkKtbfKKap4VhrVukjbPkPZJOEecEn1MNX6f4QDHsvDvL7Gj0EXJAKJQliuv4TCCg8NmF
 BY9OFhZW9IEJ4FfLuyI8/E7yJVyKNapVV36nCknZ0H5yjPKfrUuoqtnTrtC6o0EVi5F8kJlvI
 8Kmx9oWHZki9RpRnos680Hhdnm0sTtvy0RtrUu3PIE5/bqjUCjUkc2v0qursJpD8uUhpjMoIB
 GIMMyrfPc54hHKNgBDydq3TEw5qiSbllEmwDTQ14/Zh9bJ4Jrw/p6LKQgKSZUE5I8bZc8TvXA
 qjIZap+MYDc0WHwonWVrIQjuuPXLVY55Jjq4r9LOEGyyLWxWBubHssV2Rzhc4yJbmJs4jVLOQ
 zfs477dQH1V3GMEk7sHBi70VHFYbWuVA2qAJbj8snvNE9KP2No4eYNJXcKp0k3lH3YO3+ZsIK
 XwiZyuoxdfEsnoSwUJnbYx70iinrjW46BAgkRdedDRSYrVU1MwBbZq+K/xgG5NVN+KJJJfXBp
 u2BAcbnAhhyeZBldCnUZzXGoqWsBr++Nd204S6w+owu7e2Ml00o8iyheifcZCCcHrcRr+3Bxa
 YjpGUozUiPbOS/MJFXMg==
Subject: Re: [Nouveau] kvm+nouveau induced lockdep  gripe
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
Cc: linux-rt-users <linux-rt-users@vger.kernel.org>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 2020-10-23 at 11:01 +0200, Sebastian Andrzej Siewior wrote:
> On 2020-10-22 07:28:20 [+0200], Mike Galbraith wrote:
> > I've only as yet seen nouveau lockdep gripage when firing up one of my
> > full distro KVM's.
>
> Could you please check !RT with the `threadirqs' command line option? I
> don't think RT is doing here anything different (except for having
> threaded interrupts enabled by default).

Yup, you are correct, RT is innocent.


[   70.135201] ======================================================
[   70.135206] WARNING: possible circular locking dependency detected
[   70.135211] 5.9.0.gf989335-master #1 Tainted: G            E
[   70.135216] ------------------------------------------------------
[   70.135220] libvirtd/1838 is trying to acquire lock:
[   70.135225] ffff983590c2d5a8 (&mm->mmap_lock#2){++++}-{3:3}, at: mpol_rebind_mm+0x1e/0x50
[   70.135239]
               but task is already holding lock:
[   70.135244] ffffffff8a585410 (&cpuset_rwsem){++++}-{0:0}, at: cpuset_attach+0x38/0x390
[   70.135256]
               which lock already depends on the new lock.

[   70.135261]
               the existing dependency chain (in reverse order) is:
[   70.135266]
               -> #3 (&cpuset_rwsem){++++}-{0:0}:
[   70.135275]        cpuset_read_lock+0x39/0xd0
[   70.135282]        __sched_setscheduler+0x456/0xa90
[   70.135287]        _sched_setscheduler+0x69/0x70
[   70.135292]        __kthread_create_on_node+0x114/0x170
[   70.135297]        kthread_create_on_node+0x37/0x40
[   70.135306]        setup_irq_thread+0x37/0x90
[   70.135312]        __setup_irq+0x4e0/0x7c0
[   70.135318]        request_threaded_irq+0xf8/0x160
[   70.135371]        nvkm_pci_oneinit+0x4c/0x70 [nouveau]
[   70.135399]        nvkm_subdev_init+0x60/0x1e0 [nouveau]
[   70.135449]        nvkm_device_init+0x10b/0x240 [nouveau]
[   70.135506]        nvkm_udevice_init+0x49/0x70 [nouveau]
[   70.135531]        nvkm_object_init+0x3d/0x180 [nouveau]
[   70.135555]        nvkm_ioctl_new+0x1a1/0x260 [nouveau]
[   70.135578]        nvkm_ioctl+0x10a/0x240 [nouveau]
[   70.135600]        nvif_object_ctor+0xeb/0x150 [nouveau]
[   70.135622]        nvif_device_ctor+0x1f/0x60 [nouveau]
[   70.135668]        nouveau_cli_init+0x1ac/0x590 [nouveau]
[   70.135711]        nouveau_drm_device_init+0x68/0x800 [nouveau]
[   70.135753]        nouveau_drm_probe+0xfb/0x200 [nouveau]
[   70.135761]        local_pci_probe+0x42/0x90
[   70.135767]        pci_device_probe+0xe7/0x1a0
[   70.135773]        really_probe+0xf7/0x4d0
[   70.135779]        driver_probe_device+0x5d/0x140
[   70.135785]        device_driver_attach+0x4f/0x60
[   70.135790]        __driver_attach+0xa4/0x140
[   70.135796]        bus_for_each_dev+0x67/0x90
[   70.135801]        bus_add_driver+0x18c/0x230
[   70.135807]        driver_register+0x5b/0xf0
[   70.135813]        do_one_initcall+0x54/0x2f0
[   70.135819]        do_init_module+0x5b/0x21b
[   70.135825]        load_module+0x1e40/0x2370
[   70.135830]        __do_sys_finit_module+0x98/0xe0
[   70.135836]        do_syscall_64+0x33/0x40
[   70.135842]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   70.135847]
               -> #2 (&device->mutex){+.+.}-{3:3}:
[   70.135857]        __mutex_lock+0x90/0x9c0
[   70.135902]        nvkm_udevice_fini+0x23/0x70 [nouveau]
[   70.135927]        nvkm_object_fini+0xb8/0x210 [nouveau]
[   70.135951]        nvkm_object_fini+0x73/0x210 [nouveau]
[   70.135974]        nvkm_ioctl_del+0x7e/0xa0 [nouveau]
[   70.135997]        nvkm_ioctl+0x10a/0x240 [nouveau]
[   70.136019]        nvif_object_dtor+0x4a/0x60 [nouveau]
[   70.136040]        nvif_client_dtor+0xe/0x40 [nouveau]
[   70.136085]        nouveau_cli_fini+0x7a/0x90 [nouveau]
[   70.136128]        nouveau_drm_postclose+0xaa/0xe0 [nouveau]
[   70.136150]        drm_file_free.part.7+0x273/0x2c0 [drm]
[   70.136165]        drm_release+0x6e/0xf0 [drm]
[   70.136171]        __fput+0xb2/0x260
[   70.136177]        task_work_run+0x73/0xc0
[   70.136183]        exit_to_user_mode_prepare+0x1a5/0x1d0
[   70.136189]        syscall_exit_to_user_mode+0x46/0x2a0
[   70.136195]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   70.136200]
               -> #1 (&cli->lock){+.+.}-{3:3}:
[   70.136209]        __mutex_lock+0x90/0x9c0
[   70.136252]        nouveau_mem_fini+0x4c/0x70 [nouveau]
[   70.136294]        nouveau_sgdma_destroy+0x20/0x50 [nouveau]
[   70.136302]        ttm_bo_cleanup_memtype_use+0x3e/0x60 [ttm]
[   70.136310]        ttm_bo_release+0x29c/0x600 [ttm]
[   70.136317]        ttm_bo_vm_close+0x15/0x30 [ttm]
[   70.136324]        remove_vma+0x3e/0x70
[   70.136329]        __do_munmap+0x2b7/0x4f0
[   70.136333]        __vm_munmap+0x5b/0xa0
[   70.136338]        __x64_sys_munmap+0x27/0x30
[   70.136343]        do_syscall_64+0x33/0x40
[   70.136349]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   70.136354]
               -> #0 (&mm->mmap_lock#2){++++}-{3:3}:
[   70.136365]        __lock_acquire+0x149d/0x1a70
[   70.136371]        lock_acquire+0x1a7/0x3b0
[   70.136376]        down_write+0x38/0x70
[   70.136382]        mpol_rebind_mm+0x1e/0x50
[   70.136387]        cpuset_attach+0x229/0x390
[   70.136393]        cgroup_migrate_execute+0x46d/0x490
[   70.136398]        cgroup_attach_task+0x20c/0x3b0
[   70.136404]        __cgroup1_procs_write.constprop.21+0xf3/0x150
[   70.136411]        cgroup_file_write+0x64/0x210
[   70.136416]        kernfs_fop_write+0x117/0x1b0
[   70.136422]        vfs_write+0xe8/0x240
[   70.136427]        ksys_write+0x87/0xc0
[   70.136432]        do_syscall_64+0x33/0x40
[   70.136438]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   70.136443]
               other info that might help us debug this:

[   70.136450] Chain exists of:
                 &mm->mmap_lock#2 --> &device->mutex --> &cpuset_rwsem

[   70.136463]  Possible unsafe locking scenario:

[   70.136469]        CPU0                    CPU1
[   70.136473]        ----                    ----
[   70.136477]   lock(&cpuset_rwsem);
[   70.136483]                                lock(&device->mutex);
[   70.136489]                                lock(&cpuset_rwsem);
[   70.136495]   lock(&mm->mmap_lock#2);
[   70.136501]
                *** DEADLOCK ***

[   70.136508] 6 locks held by libvirtd/1838:
[   70.136512]  #0: ffff98359eb27af0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x45/0x50
[   70.136524]  #1: ffff983591a58460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x1aa/0x240
[   70.136535]  #2: ffff9835bbf50488 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write+0xe2/0x1b0
[   70.136545]  #3: ffffffff8a581848 (cgroup_mutex){+.+.}-{3:3}, at: cgroup_kn_lock_live+0xea/0x1d0
[   70.136556]  #4: ffffffff8a5816b0 (cgroup_threadgroup_rwsem){++++}-{0:0}, at: cgroup_procs_write_start+0x6e/0x200
[   70.136567]  #5: ffffffff8a585410 (&cpuset_rwsem){++++}-{0:0}, at: cpuset_attach+0x38/0x390
[   70.136579]
               stack backtrace:
[   70.136585] CPU: 2 PID: 1838 Comm: libvirtd Kdump: loaded Tainted: G            E     5.9.0.gf989335-master #1
[   70.136592] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
[   70.136598] Call Trace:
[   70.136605]  dump_stack+0x77/0x97
[   70.136611]  check_noncircular+0xe7/0x100
[   70.136618]  ? stack_trace_save+0x3b/0x50
[   70.136626]  ? __lock_acquire+0x149d/0x1a70
[   70.136631]  __lock_acquire+0x149d/0x1a70
[   70.136640]  lock_acquire+0x1a7/0x3b0
[   70.136645]  ? mpol_rebind_mm+0x1e/0x50
[   70.136652]  down_write+0x38/0x70
[   70.136657]  ? mpol_rebind_mm+0x1e/0x50
[   70.136663]  mpol_rebind_mm+0x1e/0x50
[   70.136669]  cpuset_attach+0x229/0x390
[   70.136675]  cgroup_migrate_execute+0x46d/0x490
[   70.136681]  ? _raw_spin_unlock_irq+0x2f/0x50
[   70.136688]  cgroup_attach_task+0x20c/0x3b0
[   70.136702]  ? __cgroup1_procs_write.constprop.21+0xf3/0x150
[   70.136712]  __cgroup1_procs_write.constprop.21+0xf3/0x150
[   70.136722]  cgroup_file_write+0x64/0x210
[   70.136728]  kernfs_fop_write+0x117/0x1b0
[   70.136735]  vfs_write+0xe8/0x240
[   70.136741]  ksys_write+0x87/0xc0
[   70.136746]  ? lockdep_hardirqs_on+0x85/0x110
[   70.136752]  do_syscall_64+0x33/0x40
[   70.136758]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   70.136764] RIP: 0033:0x7efc17533deb
[   70.136770] Code: 53 48 89 d5 48 89 f3 48 83 ec 18 48 89 7c 24 08 e8 5a fd ff ff 48 89 ea 41 89 c0 48 89 de 48 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 90 fd ff ff 48
[   70.136781] RSP: 002b:00007efc0d66b2f0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
[   70.136788] RAX: ffffffffffffffda RBX: 00007efbf80500f0 RCX: 00007efc17533deb
[   70.136794] RDX: 0000000000000004 RSI: 00007efbf80500f0 RDI: 000000000000001f
[   70.136799] RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
[   70.136805] R10: 0000000000000000 R11: 0000000000000293 R12: 00007efbf80500f0
[   70.136811] R13: 0000000000000000 R14: 000000000000001f R15: 0000000000000214

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
