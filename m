Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5238708EF
	for <lists+nouveau@lfdr.de>; Mon,  4 Mar 2024 19:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8AF112409;
	Mon,  4 Mar 2024 18:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="xDI7j03w";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UUDIF0mr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Mon, 04 Mar 2024 18:01:31 UTC
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB91112409;
 Mon,  4 Mar 2024 18:01:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E513011400F3;
 Mon,  4 Mar 2024 12:55:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Mar 2024 12:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1709574927; x=1709661327; bh=gD1THqT0zP
 RzvO9ud1VKCM+jcKNUokl0CnokuCSdG1s=; b=xDI7j03woFcHHeLw/+c4QzL3yj
 wgdNWyKNzABjWvUPNr6jziPUF9tpFAf/+0dIvQ88GyQ7B761MZgNXlUgor3I+vbR
 wGpwYj7UFEKNUh3RjZ1otxGXYkSJ6TZjBidqwTSUTljmCXx33/gEW0xIXXEaK/PA
 kQ7T1do4PCegI4I/tvy3646J7ljBwXE6cg8XgeeXgR4wTLGKEli7/lHsNBiEm5qR
 3id2i8mU8Qyy7Wt9wn67CqFJODcVEwGTYQSVXGJu31gV4gwKvWpoqXJorhnua9SL
 UTrKEdkSrUuyTBbyyxBZBFAnYCRopepsUvu47OtCw4JP26vovT42ECxefykg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709574927; x=1709661327; bh=gD1THqT0zPRzvO9ud1VKCM+jcKNU
 okl0CnokuCSdG1s=; b=UUDIF0mrol8Rxt6uvSdLykmGMQy8pqWd29S+NAzeLkBC
 zfnC2GvMOUc8OrnMNcZu+tmQFuRLkFm+sMqLh8EsyOMjHMz7OeHnBd7eMuhtvG/z
 Grle0uLCWxmo4YI7EAUIPVyWeXBQDwzJW5DFgcrbx3UbEooQMc5nwGMe95oql/yb
 Rw3Mj3tQvgW5x5ZS1OSNKTbiHJ2NQewzKsk9rR9O6yZqqqwQYK0XygC13XVq5iNj
 iNkKWSSPJspiT9jgeUGz2iJ+qtg6It1wVdcaa6ef+FRTkdy+Gb8DYhwzEx26lFPK
 8vr0kQiEhh3F18DNYq2vc7bedfbQRJKvi3dKeQExVQ==
X-ME-Sender: <xms:DwvmZZg6rhRA5RL229IRgEPGPla82VrEe1cSvmAgEszp5VZ_4DI94A>
 <xme:DwvmZeCe6XLyyefIA9GCGgM-bHNaJvdeGXKh7ADl0G0iUEStoWQQOZClDcFTBgFxi
 nag_aIg4v-CQQ>
X-ME-Received: <xmr:DwvmZZE9FoC_UiFY-whyNifm-ohpAoyyWF884SCUXijytpSajdscJjzaWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepffekje
 ffieetueeljeeileetleekgeffjedvtddtueffvdegledukeeihfegkefhnecuffhomhgr
 ihhnpehgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:DwvmZeToV0kwYmD9Ml6RjI_izyXw9an0Hca90glDyAIYp9ezhPOrjQ>
 <xmx:DwvmZWzFHtzZXrynvZOgpeTebmh6gSVfan7FjtnNV5FAezrofJDImA>
 <xmx:DwvmZU6z74a_JZYRZyrftDAm9Bxg83TTx_WtMHeQQxlO-RB0YQL4uQ>
 <xmx:DwvmZRrlwxYvm7w4x5UJv30QGViBGQBT3Eng1ebGLBbU3_w0GOt5eg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Mar 2024 12:55:15 -0500 (EST)
Date: Mon, 4 Mar 2024 18:55:08 +0100
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH stable v6.7] drm/nouveau: don't fini scheduler before
 entity flush
Message-ID: <2024030448-basin-grit-b550@gregkh>
References: <20240304170158.4206-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304170158.4206-1-dakr@redhat.com>
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

On Mon, Mar 04, 2024 at 06:01:46PM +0100, Danilo Krummrich wrote:
> This bug is present in v6.7 only, since the scheduler design has been
> re-worked in v6.8.
> 
> Client scheduler entities must be flushed before an associated GPU
> scheduler is teared down. Otherwise the entitiy might still hold a
> pointer to the scheduler's runqueue which is freed at scheduler tear
> down already.
> 
> [  305.224293] ==================================================================
> [  305.224297] BUG: KASAN: slab-use-after-free in drm_sched_entity_flush+0x6c4/0x7b0 [gpu_sched]
> [  305.224310] Read of size 8 at addr ffff8881440a8f48 by task rmmod/4436
> 
> [  305.224317] CPU: 10 PID: 4436 Comm: rmmod Tainted: G     U             6.7.6-100.fc38.x86_64+debug #1
> [  305.224321] Hardware name: Dell Inc. Precision 7550/01PXFR, BIOS 1.27.0 11/08/2023
> [  305.224324] Call Trace:
> [  305.224327]  <TASK>
> [  305.224329]  dump_stack_lvl+0x76/0xd0
> [  305.224336]  print_report+0xcf/0x670
> [  305.224342]  ? drm_sched_entity_flush+0x6c4/0x7b0 [gpu_sched]
> [  305.224352]  ? __virt_addr_valid+0x215/0x410
> [  305.224359]  ? drm_sched_entity_flush+0x6c4/0x7b0 [gpu_sched]
> [  305.224368]  kasan_report+0xa6/0xe0
> [  305.224373]  ? drm_sched_entity_flush+0x6c4/0x7b0 [gpu_sched]
> [  305.224385]  drm_sched_entity_flush+0x6c4/0x7b0 [gpu_sched]
> [  305.224395]  ? __pfx_drm_sched_entity_flush+0x10/0x10 [gpu_sched]
> [  305.224406]  ? rcu_is_watching+0x15/0xb0
> [  305.224413]  drm_sched_entity_destroy+0x17/0x20 [gpu_sched]
> [  305.224422]  nouveau_cli_fini+0x6c/0x120 [nouveau]
> [  305.224658]  nouveau_drm_device_fini+0x2ac/0x490 [nouveau]
> [  305.224871]  nouveau_drm_remove+0x18e/0x220 [nouveau]
> [  305.225082]  ? __pfx_nouveau_drm_remove+0x10/0x10 [nouveau]
> [  305.225290]  ? rcu_is_watching+0x15/0xb0
> [  305.225295]  ? _raw_spin_unlock_irqrestore+0x66/0x80
> [  305.225299]  ? trace_hardirqs_on+0x16/0x100
> [  305.225304]  ? _raw_spin_unlock_irqrestore+0x4f/0x80
> [  305.225310]  pci_device_remove+0xa3/0x1d0
> [  305.225316]  device_release_driver_internal+0x379/0x540
> [  305.225322]  driver_detach+0xc5/0x180
> [  305.225327]  bus_remove_driver+0x11e/0x2a0
> [  305.225333]  pci_unregister_driver+0x2a/0x250
> [  305.225339]  nouveau_drm_exit+0x1f/0x970 [nouveau]
> [  305.225548]  __do_sys_delete_module+0x350/0x580
> [  305.225554]  ? __pfx___do_sys_delete_module+0x10/0x10
> [  305.225562]  ? syscall_enter_from_user_mode+0x26/0x90
> [  305.225567]  ? rcu_is_watching+0x15/0xb0
> [  305.225571]  ? syscall_enter_from_user_mode+0x26/0x90
> [  305.225575]  ? trace_hardirqs_on+0x16/0x100
> [  305.225580]  do_syscall_64+0x61/0xe0
> [  305.225584]  ? rcu_is_watching+0x15/0xb0
> [  305.225587]  ? syscall_exit_to_user_mode+0x1f/0x50
> [  305.225592]  ? trace_hardirqs_on_prepare+0xe3/0x100
> [  305.225596]  ? do_syscall_64+0x70/0xe0
> [  305.225600]  ? trace_hardirqs_on_prepare+0xe3/0x100
> [  305.225604]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [  305.225609] RIP: 0033:0x7f6148f3592b
> [  305.225650] Code: 73 01 c3 48 8b 0d dd 04 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ad 04 0c 00 f7 d8 64 89 01 48
> [  305.225653] RSP: 002b:00007ffe89986f08 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
> [  305.225659] RAX: ffffffffffffffda RBX: 000055cbb036e900 RCX: 00007f6148f3592b
> [  305.225662] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000055cbb036e968
> [  305.225664] RBP: 00007ffe89986f30 R08: 1999999999999999 R09: 0000000000000000
> [  305.225667] R10: 00007f6148fa6ac0 R11: 0000000000000206 R12: 0000000000000000
> [  305.225670] R13: 00007ffe89987190 R14: 000055cbb036e900 R15: 0000000000000000
> [  305.225678]  </TASK>
> 
> [  305.225683] Allocated by task 484:
> [  305.225685]  kasan_save_stack+0x33/0x60
> [  305.225690]  kasan_set_track+0x25/0x30
> [  305.225693]  __kasan_kmalloc+0x8f/0xa0
> [  305.225696]  drm_sched_init+0x3c7/0xce0 [gpu_sched]
> [  305.225705]  nouveau_sched_init+0xd2/0x110 [nouveau]
> [  305.225913]  nouveau_drm_device_init+0x130/0x3290 [nouveau]
> [  305.226121]  nouveau_drm_probe+0x1ab/0x6b0 [nouveau]
> [  305.226329]  local_pci_probe+0xda/0x190
> [  305.226333]  pci_device_probe+0x23a/0x780
> [  305.226337]  really_probe+0x3df/0xb80
> [  305.226341]  __driver_probe_device+0x18c/0x450
> [  305.226345]  driver_probe_device+0x4a/0x120
> [  305.226348]  __driver_attach+0x1e5/0x4a0
> [  305.226351]  bus_for_each_dev+0x106/0x190
> [  305.226355]  bus_add_driver+0x2a1/0x570
> [  305.226358]  driver_register+0x134/0x460
> [  305.226361]  do_one_initcall+0xd3/0x430
> [  305.226366]  do_init_module+0x238/0x770
> [  305.226370]  load_module+0x5581/0x6f10
> [  305.226374]  __do_sys_init_module+0x1f2/0x220
> [  305.226377]  do_syscall_64+0x61/0xe0
> [  305.226381]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> 
> [  305.226387] Freed by task 4436:
> [  305.226389]  kasan_save_stack+0x33/0x60
> [  305.226392]  kasan_set_track+0x25/0x30
> [  305.226396]  kasan_save_free_info+0x2b/0x50
> [  305.226399]  __kasan_slab_free+0x10b/0x1a0
> [  305.226402]  slab_free_freelist_hook+0x12b/0x1e0
> [  305.226406]  __kmem_cache_free+0xd4/0x1d0
> [  305.226410]  drm_sched_fini+0x178/0x320 [gpu_sched]
> [  305.226418]  nouveau_drm_device_fini+0x2a0/0x490 [nouveau]
> [  305.226624]  nouveau_drm_remove+0x18e/0x220 [nouveau]
> [  305.226832]  pci_device_remove+0xa3/0x1d0
> [  305.226836]  device_release_driver_internal+0x379/0x540
> [  305.226840]  driver_detach+0xc5/0x180
> [  305.226843]  bus_remove_driver+0x11e/0x2a0
> [  305.226847]  pci_unregister_driver+0x2a/0x250
> [  305.226850]  nouveau_drm_exit+0x1f/0x970 [nouveau]
> [  305.227056]  __do_sys_delete_module+0x350/0x580
> [  305.227060]  do_syscall_64+0x61/0xe0
> [  305.227064]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> 
> [  305.227070] The buggy address belongs to the object at ffff8881440a8f00
>                 which belongs to the cache kmalloc-128 of size 128
> [  305.227073] The buggy address is located 72 bytes inside of
>                 freed 128-byte region [ffff8881440a8f00, ffff8881440a8f80)
> 
> [  305.227078] The buggy address belongs to the physical page:
> [  305.227081] page:00000000627efa0a refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1440a8
> [  305.227085] head:00000000627efa0a order:1 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [  305.227088] flags: 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
> [  305.227093] page_type: 0xffffffff()
> [  305.227097] raw: 0017ffffc0000840 ffff8881000428c0 ffffea0005b33500 dead000000000002
> [  305.227100] raw: 0000000000000000 0000000000200020 00000001ffffffff 0000000000000000
> [  305.227102] page dumped because: kasan: bad access detected
> 
> [  305.227106] Memory state around the buggy address:
> [  305.227109]  ffff8881440a8e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [  305.227112]  ffff8881440a8e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [  305.227114] >ffff8881440a8f00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  305.227117]                                               ^
> [  305.227120]  ffff8881440a8f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [  305.227122]  ffff8881440a9000: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
> [  305.227125] ==================================================================
> 
> Cc: <stable@vger.kernel.org> # v6.7 only
> Reported-by: Karol Herbst <kherbst@redhat.com>
> Closes: https://gist.githubusercontent.com/karolherbst/a20eb0f937a06ed6aabe2ac2ca3d11b5/raw/9cd8b1dc5894872d0eeebbee3dd0fdd28bb576bc/gistfile1.txt
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")

You say 6.7 only, but this commit is in 6.6, so why not 6.6 also?

thanks,

greg k-h
