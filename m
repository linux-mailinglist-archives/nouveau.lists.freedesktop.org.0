Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77731350F3
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2020 02:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921C76E369;
	Thu,  9 Jan 2020 01:21:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jan 2020 01:21:50 UTC
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756896E369
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2020 01:21:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e167eed0000>; Wed, 08 Jan 2020 17:16:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 08 Jan 2020 17:16:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 08 Jan 2020 17:16:47 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 01:16:46 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 01:16:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 Jan 2020 01:16:43 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e167efb0001>; Wed, 08 Jan 2020 17:16:43 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Date: Wed, 8 Jan 2020 17:16:40 -0800
Message-ID: <20200109011640.19678-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578532590; bh=vzNovjZnxdaCOlDKQcaTKY73ccFnBZEBPKvDaOtITjY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=NLKFjP5H+QWytCCjSbP0FG/IR9rJUC6KIU1LwAoOj+h0UrX3xE+q3BctjN1lCf0yV
 sODa0064sCpb8XRnVoQDzK8gi5pVzDKgASKbINq8FkIuMtGloMnVosATVS2E+xzgCm
 Hyj5U51G/moaMbKBDBCxqHN5HnUkkbl54ZWZlTdnEW2EsPx2X134izdH0pFtCC6DAr
 5tdh0Q3rFRqTGCsu07fSluH/70DNvEcTRNvU2fU0rrUSEFR09P2rwz6Aa+yf/erAjN
 t0m0qzGsw/K/+LvguliQB1SsGP0LLxyTNsTdJZGvWFt6Q76dgfEhNRgk/PLLlv1yjW
 y5tEhbN6LFOrg==
Subject: [Nouveau] [BUG] nouveau lockdep splat
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I hit this while testing HMM with nouveau on linux-5.5-rc5.
I'm not a lockdep expert but my understanding of this is that an
invalidation callback could potentially call kzalloc(GFP_KERNEL)
which could cause another invalidation and recursively deadlock.
Looking at the drivers/gpu/drm/nouveau/nvkm/ layer, I do see a
number of places where GFP_KERNEL is used for allocations and I
don't see an easy way to avoid that.

The big question is how to fix it.

[   98.381122] ======================================================
[   98.387361] WARNING: possible circular locking dependency detected
[   98.393645] 5.5.0-rc5+ #194 Not tainted
[   98.397561] ------------------------------------------------------
[   98.403810] test-file-priva/6909 is trying to acquire lock:
[   98.409442] ffff888753e39a80 (&vmm->mutex#3){+.+.}, at: nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.418064] 
[   98.418064] but task is already holding lock:
[   98.423915] ffff888759cdc9b0 (&svmm->mutex){+.+.}, at: nouveau_svmm_invalidate_range_start+0x71/0x110 [nouveau]
[   98.434142] 
[   98.434142] which lock already depends on the new lock.
[   98.434142] 
[   98.442408] 
[   98.442408] the existing dependency chain (in reverse order) is:
[   98.449899] 
[   98.449899] -> #3 (&svmm->mutex){+.+.}:
[   98.455249]        __mutex_lock+0x134/0xc70
[   98.459526]        nouveau_svmm_invalidate_range_start+0x71/0x110 [nouveau]
[   98.466593]        __mmu_notifier_invalidate_range_start+0x25c/0x320
[   98.473031]        unmap_vmas+0x10c/0x200
[   98.477130]        unmap_region+0x1a4/0x240
[   98.481410]        __do_munmap+0x3e0/0x750
[   98.485535]        __vm_munmap+0xbc/0x130
[   98.489599]        __x64_sys_munmap+0x3c/0x50
[   98.493951]        do_syscall_64+0x68/0x280
[   98.498162]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   98.503778] 
[   98.503778] -> #2 (mmu_notifier_invalidate_range_start){+.+.}:
[   98.511084]        __mmu_notifier_register+0x8c/0x320
[   98.516206]        nouveau_svmm_init+0x1ef/0x280 [nouveau]
[   98.521714]        drm_ioctl_kernel+0x14d/0x1a0
[   98.526277]        drm_ioctl+0x308/0x525
[   98.530279]        nouveau_drm_ioctl+0x9a/0x100 [nouveau]
[   98.535692]        do_vfs_ioctl+0x137/0xa30
[   98.539884]        ksys_ioctl+0x60/0x90
[   98.543724]        __x64_sys_ioctl+0x3d/0x50
[   98.548031]        do_syscall_64+0x68/0x280
[   98.552243]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   98.557823] 
[   98.557823] -> #1 (fs_reclaim){+.+.}:
[   98.562973]        fs_reclaim_acquire.part.101+0x29/0x30
[   98.568312]        kmem_cache_alloc_trace+0x3f/0x350
[   98.573356]        nvkm_vma_tail+0x70/0x150 [nouveau]
[   98.578488]        nvkm_vmm_get_locked+0x42e/0x740 [nouveau]
[   98.584217]        nvkm_uvmm_mthd+0x6de/0xbe0 [nouveau]
[   98.589521]        nvkm_ioctl+0x18b/0x2c0 [nouveau]
[   98.594470]        nvif_object_mthd+0x18b/0x1b0 [nouveau]
[   98.599938]        nvif_vmm_get+0x124/0x170 [nouveau]
[   98.605083]        nouveau_vma_new+0x356/0x3e0 [nouveau]
[   98.610473]        nouveau_channel_prep+0x387/0x4a0 [nouveau]
[   98.616296]        nouveau_channel_new+0xf7/0xcd0 [nouveau]
[   98.621973]        nouveau_drm_device_init+0x4a8/0xaf0 [nouveau]
[   98.628058]        nouveau_drm_probe+0x3e9/0x430 [nouveau]
[   98.633563]        local_pci_probe+0x74/0xb0
[   98.637836]        work_for_cpu_fn+0x29/0x40
[   98.642126]        process_one_work+0x4ee/0xa40
[   98.646674]        worker_thread+0x36c/0x5c0
[   98.650956]        kthread+0x1d4/0x200
[   98.654709]        ret_from_fork+0x3a/0x50
[   98.658816] 
[   98.658816] -> #0 (&vmm->mutex#3){+.+.}:
[   98.664226]        __lock_acquire+0x1696/0x21a0
[   98.668775]        lock_acquire+0xf3/0x200
[   98.672883]        __mutex_lock+0x134/0xc70
[   98.677149]        nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.682455]        nvkm_ioctl+0x18b/0x2c0 [nouveau]
[   98.687396]        nvif_object_mthd+0x18b/0x1b0 [nouveau]
[   98.692894]        nouveau_svmm_invalidate.isra.3.part.4+0xc4/0x120 [nouveau]
[   98.700113]        nouveau_svmm_invalidate_range_start+0xe4/0x110 [nouveau]
[   98.707118]        __mmu_notifier_invalidate_range_start+0x25c/0x320
[   98.713486]        unmap_vmas+0x10c/0x200
[   98.717500]        unmap_region+0x1a4/0x240
[   98.721721]        __do_munmap+0x3e0/0x750
[   98.725836]        __vm_munmap+0xbc/0x130
[   98.729849]        __x64_sys_munmap+0x3c/0x50
[   98.734236]        do_syscall_64+0x68/0x280
[   98.738447]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   98.744035] 
[   98.744035] other info that might help us debug this:
[   98.744035] 
[   98.752061] Chain exists of:
[   98.752061]   &vmm->mutex#3 --> mmu_notifier_invalidate_range_start --> &svmm->mutex
[   98.752061] 
[   98.764194]  Possible unsafe locking scenario:
[   98.764194] 
[   98.770141]        CPU0                    CPU1
[   98.774691]        ----                    ----
[   98.779232]   lock(&svmm->mutex);
[   98.782549]                                lock(mmu_notifier_invalidate_range_start);
[   98.790385]                                lock(&svmm->mutex);
[   98.796244]   lock(&vmm->mutex#3);
[   98.799667] 
[   98.799667]  *** DEADLOCK ***
[   98.799667] 
[   98.805613] 4 locks held by test-file-priva/6909:
[   98.810336]  #0: ffff8886f900e2d8 (&mm->mmap_sem#2){++++}, at: __do_munmap+0x6e6/0x750
[   98.818273]  #1: ffffffff837d5940 (mmu_notifier_invalidate_range_start){+.+.}, at: unmap_vmas+0x5/0x200
[   98.827686]  #2: ffffffff837d5f48 (srcu){....}, at: __mmu_notifier_invalidate_range_start+0x192/0x320
[   98.836942]  #3: ffff888759cdc9b0 (&svmm->mutex){+.+.}, at: nouveau_svmm_invalidate_range_start+0x71/0x110 [nouveau]
[   98.847594] 
[   98.847594] stack backtrace:
[   98.851955] CPU: 8 PID: 6909 Comm: test-file-priva Not tainted 5.5.0-rc5+ #194
[   98.859206] Hardware name: ASUS X299-A/PRIME X299-A, BIOS 1401 05/21/2018
[   98.866030] Call Trace:
[   98.868493]  dump_stack+0x96/0xe0
[   98.871835]  check_noncircular+0x2a0/0x2e0
[   98.875954]  ? print_circular_bug.isra.36+0x100/0x100
[   98.881022]  ? deref_stack_reg+0x8d/0xd0
[   98.884958]  ? rcu_read_lock_held_common+0x3e/0x90
[   98.889784]  ? stack_access_ok+0x35/0x80
[   98.893727]  ? mark_lock+0xac/0x9f0
[   98.897221]  ? rcu_read_lock_sched_held+0x5f/0xd0
[   98.901962]  __lock_acquire+0x1696/0x21a0
[   98.906001]  ? ftrace_caller_op_ptr+0xe/0xe
[   98.910204]  ? register_lock_class+0x8b0/0x8b0
[   98.914684]  ? stack_access_ok+0x35/0x80
[   98.918608]  ? unwind_next_frame+0x7ee/0x8b0
[   98.922873]  ? lock_acquire+0x37/0x200
[   98.926627]  lock_acquire+0xf3/0x200
[   98.930286]  ? nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.935190]  __mutex_lock+0x134/0xc70
[   98.938926]  ? nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.943893]  ? nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.948787]  ? mutex_lock_io_nested+0xbc0/0xbc0
[   98.953357]  ? stack_trace_save+0x8a/0xb0
[   98.957385]  ? stack_trace_consume_entry+0x80/0x80
[   98.962187]  ? mark_lock+0xac/0x9f0
[   98.965751]  ? nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.970651]  ? lockdep_hardirqs_on+0x190/0x280
[   98.975171]  nvkm_uvmm_mthd+0x4d5/0xbe0 [nouveau]
[   98.979892]  ? trace_hardirqs_on_thunk+0x1a/0x1c
[   98.984601]  ? nvkm_uvmm_dtor+0x20/0x20 [nouveau]
[   98.989322]  ? retint_kernel+0x10/0x10
[   98.993146]  ? nvkm_ioctl_mthd+0x94/0xe0 [nouveau]
[   98.998001]  nvkm_ioctl+0x18b/0x2c0 [nouveau]
[   99.002372]  ? lock_acquire+0x10f/0x200
[   99.006268]  ? nvif_object_ioctl+0x94/0xd0 [nouveau]
[   99.011311]  nvif_object_mthd+0x18b/0x1b0 [nouveau]
[   99.016268]  ? nvif_object_wr+0x140/0x140 [nouveau]
[   99.021144]  ? __mutex_lock+0x353/0xc70
[   99.024976]  ? mutex_lock_io_nested+0xbc0/0xbc0
[   99.029602]  nouveau_svmm_invalidate.isra.3.part.4+0xc4/0x120 [nouveau]
[   99.036311]  ? nouveau_svm_range_invalidate+0x90/0x90 [nouveau]
[   99.042336]  nouveau_svmm_invalidate_range_start+0xe4/0x110 [nouveau]
[   99.048878]  ? nouveau_svmm_invalidate.isra.3.part.4+0x120/0x120 [nouveau]
[   99.055752]  __mmu_notifier_invalidate_range_start+0x25c/0x320
[   99.061594]  unmap_vmas+0x10c/0x200
[   99.065111]  ? zap_vma_ptes+0x60/0x60
[   99.068794]  ? __do_munmap+0x6e6/0x750
[   99.072567]  unmap_region+0x1a4/0x240
[   99.076250]  ? init_admin_reserve+0x70/0x70
[   99.080442]  ? lock_acquire+0xf3/0x200
[   99.084196]  ? down_write_nested+0x150/0x150
[   99.088495]  ? __vma_rb_erase+0x399/0x5f0
[   99.092534]  __do_munmap+0x3e0/0x750
[   99.096111]  __vm_munmap+0xbc/0x130
[   99.099614]  ? __do_munmap+0x750/0x750
[   99.103377]  ? trace_hardirqs_off_caller+0x43/0x130
[   99.108272]  __x64_sys_munmap+0x3c/0x50
[   99.112128]  do_syscall_64+0x68/0x280
[   99.115812]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   99.120890] RIP: 0033:0x7f525873817b
[   99.124479] Code: ff ff 0f 1f 44 00 00 48 8b 15 09 7d 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff e9 6f ff ff ff f3 0f 1e fa b8 0b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d dd 7c 0c 00 f7 d8 64 89 01 48
[   99.143327] RSP: 002b:00007ffd64c0ea08 EFLAGS: 00000202 ORIG_RAX: 000000000000000b
[   99.150929] RAX: ffffffffffffffda RBX: 00007f52500d4010 RCX: 00007f525873817b
[   99.158087] RDX: 00007f52500f4000 RSI: 0000000000024000 RDI: 00007f52500d4000
[   99.165253] RBP: 0000000001dbcc10 R08: 0000000001d9c1e0 R09: 0000000000000007
[   99.172422] R10: 0000000001d9d640 R11: 0000000000000202 R12: 0000000001d9af30
[   99.179590] R13: 0000000001dbcc10 R14: 0000000001d96eb0 R15: 0000000001d96ea0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
