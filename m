Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0F8AA407
	for <lists+nouveau@lfdr.de>; Thu, 18 Apr 2024 22:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B545A112FE0;
	Thu, 18 Apr 2024 20:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ASDNjfBt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716201125D6
 for <nouveau@lists.freedesktop.org>; Thu, 18 Apr 2024 20:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713472065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=79F8kGNvKDtV9O8XGCFbmKH19v1WbaaaMchxIPgfwEw=;
 b=ASDNjfBtCvuW9z4txE9qGe01dl8VJwNJEYVHafeE0LXhnzUFHUwlm1OEGsIzdHEKf3+avb
 YunM93UU0X3+1UietA4AhyDPGdq0UAOWARb7q9Ogx7e3jeTszZHW3Cfmr4pohtnbUMjCme
 nFi2U2rey1yvOVq9lbbjHpoMHKYN7To=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-Pt-yy5tON_CIHBaTeqz_WA-1; Thu, 18 Apr 2024 16:27:43 -0400
X-MC-Unique: Pt-yy5tON_CIHBaTeqz_WA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-437b753e4e2so5201371cf.2
 for <nouveau@lists.freedesktop.org>; Thu, 18 Apr 2024 13:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713472063; x=1714076863;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :autocrypt:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=79F8kGNvKDtV9O8XGCFbmKH19v1WbaaaMchxIPgfwEw=;
 b=DdLfQayVMSFNPhbZTSXpgw3Vwtx1zxz2p8RLiul5dY6aOu42vO3zvL7cnLuLNaGBZN
 bBJTyjAgX0vjjG21otgs8Rabi8Gm4JXzqHThKmuvcRLbRyolcKLrfiinX6fQ35WFZoCK
 106nFA9IDOt4pJCmmcNivTkrQ05h+6tdR+SIbi4Lhr9sy+zXCzGGs1ePsQy0kNnuMUrf
 XBlPolm0odKAFENnaK1yKrOa+o/HYOhjIUdQZwZEpPsdGeXq/Fb9wC3FKOGaMQ9UN/MI
 PmeaJtVuEfj9byCtXRCbucH5zFRB3cKt0HEDf4mpoeSM4J7X83T/VVSDqXYfr0Alsbeu
 lAPQ==
X-Gm-Message-State: AOJu0YwvdOP9D0A1E4pTBNwciCYZTfTwbbzGm0VH+8XzXqLTVZTxkmfr
 20hu9Gv9b7Q7fkxLWoq669qkL5Mv1I6jXn5yVy+L2Frthstb5xxPSmOK8p0z63e9HZWgqmIo50a
 pjophBiy5bw2HwxPOfI87WrJn4DrEuuH+GXHDO3++zAm59dHSxcWW6qJ/SukAZ24=
X-Received: by 2002:ac8:5e49:0:b0:432:e65e:bacc with SMTP id
 i9-20020ac85e49000000b00432e65ebaccmr160688qtx.58.1713472062327; 
 Thu, 18 Apr 2024 13:27:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjWlywn0V33wEp/rXkQwqIh+JPjiBvI3kwe8FI+sJfCS17SKFEgrhp+85kzXGxGNb2bEVfUw==
X-Received: by 2002:ac8:5e49:0:b0:432:e65e:bacc with SMTP id
 i9-20020ac85e49000000b00432e65ebaccmr160664qtx.58.1713472061780; 
 Thu, 18 Apr 2024 13:27:41 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 p9-20020ac84089000000b00437a996ca44sm619968qtl.21.2024.04.18.13.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 13:27:41 -0700 (PDT)
Message-ID: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
Subject: Issues with trying to boot falcons from sgt memory + Possible
 firmware SG_DEBUG fix?
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, 
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Date: Thu, 18 Apr 2024 16:27:40 -0400
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
Organization: Red Hat Inc.
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

So - first some context here for Ben and anyone else who hasn't been
following. A little while ago I got a Slimbook Executive 16 with a
Nvidia RTX 4060 in it, and I've unfortunately been running into a kind
of annoying issue. Currently this laptop only has 16 gigs of ram, and
as it turns out - this can easily lead the system to having pretty
heavy memory fragmentation once it starts swapping pages out.

Normally this wouldn't matter, but I unfortunately discovered that when
we're runtime suspending the GPU in Nouveau - we actually appear to
allocate some of the memory we use for migrating using
dma_alloc_coherent. This starts to fail on my system once memory
fragmentation goes up like so:

  kworker/18:0: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
  nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
  CPU: 18 PID: 287012 Comm: kworker/18:0 Not tainted
  6.8.4-200.ChopperV1.fc39.x86_64 #1
  Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
  Workqueue: pm pm_runtime_work
  Call Trace:
   <TASK>
   dump_stack_lvl+0x47/0x60
   warn_alloc+0x165/0x1e0
   ? __alloc_pages_direct_compact+0x1ad/0x2b0
   __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
   __alloc_pages+0x32d/0x350
   __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
   dma_direct_alloc+0x70/0x280
   nvkm_gsp_radix3_sg+0x5e/0x130 [nouveau]
   r535_gsp_fini+0x1d4/0x350 [nouveau]
   nvkm_subdev_fini+0x67/0x150 [nouveau]
   nvkm_device_fini+0x95/0x1e0 [nouveau]
   nvkm_udevice_fini+0x53/0x70 [nouveau]
   nvkm_object_fini+0xb9/0x240 [nouveau]
   nvkm_object_fini+0x75/0x240 [nouveau]
   nouveau_do_suspend+0xf5/0x280 [nouveau]
   nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
   pci_pm_runtime_suspend+0x67/0x1e0
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   __rpm_callback+0x41/0x170
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   rpm_callback+0x5d/0x70
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   rpm_suspend+0x120/0x6a0
   pm_runtime_work+0x98/0xb0
   process_one_work+0x171/0x340
   worker_thread+0x27b/0x3a0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xe5/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x31/0x50
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1b/0x30

  nouveau 0000:01:00.0: gsp: suspend failed, -12
  nouveau: DRM-master:00000000:00000080: suspend failed with -12
  nouveau 0000:01:00.0: can't suspend (nouveau_pmops_runtime_suspend
  [nouveau] returned -12)

Keep in mind, I don't dive into memory management related stuff like
this very often! But I'd very much like to know how to help out
anywhere around the driver, including outside of my usual domains, so
I've been trying to write up a patch for this. The original suggestion
for a fix that Dave Airlie had given me was (unless I misunderstood,
which isn't unlikely) to try to see if we could get nvkm_gsp_mem_ctor()
to start allocating memory with vmalloc() and map that onto the GPU
using the SG helpers instead. So - I gave a shot at writing up a patch
for doing that:

https://gitlab.freedesktop.org/lyudess/linux/-/commit/b5a41ac2bd948979815d2=
62d8d20b4f3333f9c26

As you can probably guess - the patch does not really seem to work, and
I've been trying to figure out why. There's already a couple of issues
I'm aware of: the most glaring one being that as Timur pointed out, a
lot of GSP hardware expects contiguous memory allocations - but
according to them the allocation that's specifically failing should be
small enough that it'd be allocated in a contiguous page anyway:

   [    9.429884] Lyude:r535_gsp_init:2186: (mbox1) =3D=3D 0
   [    9.429898] Lyude:r535_gsp_init:2186: (mbox0) =3D=3D dbdfe000
   [    9.491300] ------------[ cut here ]------------
   [    9.491308] WARNING: CPU: 5 PID: 921 at drivers/gpu/drm/nouveau/nvkm/=
subdev/gsp/r535.c:1713 r535_gsp_init+0x75e/0x7c0 [nouveau]
   [    9.491533] Modules linked in: nouveau(+) rfkill binfmt_misc vfat fat=
 snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_h=
da_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep wmi_bm=
of ppdev snd_hda_core drm_ttm_helper intel_rapl_msr snd_seq ttm snd_seq_dev=
ice snd_pcm video gpu_sched snd_timer i2c_algo_bit drm_gpuvm drm_exec intel=
_rapl_common mxm_wmi rapl snd drm_display_helper acpi_cpufreq soundcore k10=
temp i2c_piix4 parport_pc wmi parport gpio_amdpt gpio_generic loop dm_multi=
path nfnetlink zram crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmu=
lni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 r8169 rea=
ltek sha1_ssse3 ccp w83627hf_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_=
tables ip_tables fuse
   [    9.491670] CPU: 5 PID: 921 Comm: (udev-worker) Not tainted 6.9.0-rc3=
Lyude-Test+ #22
   [    9.491681] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BI=
OS 1.I0 01/22/2019
   [    9.491690] RIP: 0010:r535_gsp_init+0x75e/0x7c0 [nouveau]
   [    9.491885] Code: 8b 83 10 0d 00 00 48 89 ef 41 bf e4 ff ff ff 48 8b =
40 18 48 8b 80 48 0f 00 00 48 8b 40 28 e8 b9 5e 89 ee 0f 0b e9 73 f9 ff ff =
<0f> 0b 41 bf fb ff ff ff e9 5a f9 ff ff 41 89 ef 0f 0b e9 5c f9 ff
   [    9.491905] RSP: 0018:ffffb271c175f748 EFLAGS: 00010246
   [    9.491914] RAX: 0000000000000000 RBX: ffffa098e192f000 RCX: ffffa098=
ca2768c8
   [    9.491922] RDX: ffffa098e191d400 RSI: ffffb271cc110080 RDI: ffffb271=
cc111388
   [    9.491930] RBP: 00000000dbdfe000 R08: 0000000000000003 R09: 00000000=
00000000
   [    9.491938] R10: 0000000000000000 R11: ffffa098ca276828 R12: ffffa098=
e192f008
   [    9.491946] R13: 000000022b906452 R14: ffffa098e192f008 R15: 00000000=
00000000
   [    9.491956] FS:  00007f4de98cc980(0000) GS:ffffa099c4a80000(0000) knl=
GS:0000000000000000
   [    9.491966] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
   [    9.491974] CR2: 00007f7bd8d18ea0 CR3: 0000000104e58000 CR4: 00000000=
003506f0
   [    9.491989] Call Trace:
   [    9.491996]  <TASK>
   [    9.492002]  ? __warn+0x80/0x120
   [    9.492012]  ? r535_gsp_init+0x75e/0x7c0 [nouveau]
   [    9.492200]  ? report_bug+0x164/0x190
   [    9.492211]  ? handle_bug+0x3c/0x80
   [    9.492218]  ? exc_invalid_op+0x17/0x70
   [    9.492227]  ? asm_exc_invalid_op+0x1a/0x20
   [    9.492241]  ? r535_gsp_init+0x75e/0x7c0 [nouveau]
   [    9.492429]  ? r535_gsp_init+0x18e/0x7c0 [nouveau]
   [    9.492616]  ? srso_return_thunk+0x5/0x5f
   [    9.492626]  nvkm_subdev_init_+0x48/0x130 [nouveau]
   [    9.492802]  ? srso_return_thunk+0x5/0x5f
   [    9.492810]  nvkm_subdev_init+0x44/0x90 [nouveau]
   [    9.492988]  nvkm_device_init+0x166/0x2e0 [nouveau]
   [    9.493189]  nvkm_udevice_init+0x47/0x70 [nouveau]
   [    9.493391]  nvkm_object_init+0x41/0x1c0 [nouveau]
   [    9.493567]  nvkm_ioctl_new+0x16a/0x290 [nouveau]
   [    9.493740]  ? __pfx_nvkm_client_child_new+0x10/0x10 [nouveau]
   [    9.493912]  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau]
   [    9.494121]  nvkm_ioctl+0x10e/0x250 [nouveau]
   [    9.494288]  nvif_object_ctor+0x112/0x190 [nouveau]
   [    9.494456]  nvif_device_ctor+0x23/0x60 [nouveau]
   [    9.494625]  nouveau_cli_init+0x164/0x5d0 [nouveau]
   [    9.494820]  nouveau_drm_device_init+0x97/0xe00 [nouveau]
   [    9.495022]  ? srso_return_thunk+0x5/0x5f
   [    9.495030]  ? pci_bus_read_config_word+0x4d/0x90
   [    9.495039]  ? srso_return_thunk+0x5/0x5f
   [    9.495047]  ? pci_update_current_state+0x72/0xb0
   [    9.495059]  nouveau_drm_probe+0x12c/0x280 [nouveau]
   [    9.495245]  ? srso_return_thunk+0x5/0x5f
   [    9.495254]  local_pci_probe+0x45/0xa0
   [    9.495263]  pci_device_probe+0xc7/0x240
   [    9.495272]  really_probe+0xd6/0x390
   [    9.495282]  ? __pfx___driver_attach+0x10/0x10
   [    9.495290]  __driver_probe_device+0x78/0x150
   [    9.495301]  driver_probe_device+0x1f/0x90
   [    9.495308]  __driver_attach+0xd2/0x1c0
   [    9.495316]  bus_for_each_dev+0x88/0xd0
   [    9.495325]  bus_add_driver+0x116/0x220
   [    9.495334]  driver_register+0x59/0x100
   [    9.495342]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
   [    9.495512]  do_one_initcall+0x5b/0x320
   [    9.495524]  do_init_module+0x60/0x240
   [    9.495536]  init_module_from_file+0x86/0xc0
   [    9.495550]  idempotent_init_module+0x120/0x2b0
   [    9.495562]  __x64_sys_finit_module+0x5e/0xb0
   [    9.495571]  do_syscall_64+0x88/0x170
   [    9.495581]  ? srso_return_thunk+0x5/0x5f
   [    9.495589]  ? syscall_exit_to_user_mode_prepare+0x15d/0x190
   [    9.495600]  ? srso_return_thunk+0x5/0x5f
   [    9.495607]  ? syscall_exit_to_user_mode+0x60/0x210
   [    9.495615]  ? srso_return_thunk+0x5/0x5f
   [    9.495622]  ? do_syscall_64+0x95/0x170
   [    9.495630]  ? srso_return_thunk+0x5/0x5f
   [    9.495636]  ? do_syscall_64+0x95/0x170
   [    9.495644]  ? srso_return_thunk+0x5/0x5f
   [    9.495653]  entry_SYSCALL_64_after_hwframe+0x71/0x79
   [    9.495663] RIP: 0033:0x7f4de9b2919d
   [    9.495680] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa =
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 =
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b cc 0c 00 f7 d8 64 89 01 48
   [    9.495697] RSP: 002b:00007ffc56bfe468 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000139
   [    9.495707] RAX: ffffffffffffffda RBX: 00005644a0432350 RCX: 00007f4d=
e9b2919d
   [    9.495717] RDX: 0000000000000000 RSI: 00005644a042ef30 RDI: 00000000=
00000031
   [    9.495726] RBP: 00007ffc56bfe520 R08: 00007f4de9bf6b20 R09: 00007ffc=
56bfe4b0
   [    9.495734] R10: 00005644a04346a0 R11: 0000000000000246 R12: 00005644=
a042ef30
   [    9.495742] R13: 0000000000020000 R14: 00005644a0432d10 R15: 00005644=
a0434660
   [    9.495754]  </TASK>
   [    9.495759] ---[ end trace 0000000000000000 ]---
   [    9.495778] ------------[ cut here ]------------
   [    9.495784] WARNING: CPU: 5 PID: 921 at drivers/gpu/drm/nouveau/nvkm/=
subdev/gsp/r535.c:2187 r535_gsp_init+0xc5/0x7c0 [nouveau]
   [    9.495981] Modules linked in: nouveau(+) rfkill binfmt_misc vfat fat=
 snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_h=
da_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep wmi_bm=
of ppdev snd_hda_core drm_ttm_helper intel_rapl_msr snd_seq ttm snd_seq_dev=
ice snd_pcm video gpu_sched snd_timer i2c_algo_bit drm_gpuvm drm_exec intel=
_rapl_common mxm_wmi rapl snd drm_display_helper acpi_cpufreq soundcore k10=
temp i2c_piix4 parport_pc wmi parport gpio_amdpt gpio_generic loop dm_multi=
path nfnetlink zram crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmu=
lni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 r8169 rea=
ltek sha1_ssse3 ccp w83627hf_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_=
tables ip_tables fuse
   [    9.496112] CPU: 5 PID: 921 Comm: (udev-worker) Tainted: G        W  =
        6.9.0-rc3Lyude-Test+ #22
   [    9.496123] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BI=
OS 1.I0 01/22/2019
   [    9.496132] RIP: 0010:r535_gsp_init+0xc5/0x7c0 [nouveau]
   [    9.496317] Code: 24 18 4c 8d 63 08 89 6c 24 14 4c 89 e6 6a 00 4c 8d =
44 24 20 48 8d 4c 24 1c e8 b7 c3 fa ff 5f 41 89 c7 85 c0 0f 84 97 00 00 00 =
<0f> 0b 48 83 bb 20 0a 00 00 00 75 37 48 8b 44 24 20 65 48 2b 04 25
   [    9.496333] RSP: 0018:ffffb271c175f748 EFLAGS: 00010246
   [    9.496341] RAX: 0000000000000000 RBX: ffffa098e192f000 RCX: ffffa098=
ca2768c8
   [    9.496351] RDX: ffffa098e191d400 RSI: ffffb271cc110080 RDI: ffffb271=
cc111388
   [    9.496360] RBP: 00000000dbdfe000 R08: 0000000000000003 R09: 00000000=
00000000
   [    9.496368] R10: 0000000000000000 R11: ffffa098ca276828 R12: ffffa098=
e192f008
   [    9.496375] R13: 000000022b906452 R14: ffffa098e192f008 R15: 00000000=
fffffffb
   [    9.496383] FS:  00007f4de98cc980(0000) GS:ffffa099c4a80000(0000) knl=
GS:0000000000000000
   [    9.496393] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
   [    9.496400] CR2: 00007f7bd8d18ea0 CR3: 0000000104e58000 CR4: 00000000=
003506f0
   [    9.496410] Call Trace:
   [    9.496416]  <TASK>
   [    9.496422]  ? __warn+0x80/0x120
   [    9.496429]  ? r535_gsp_init+0xc5/0x7c0 [nouveau]
   [    9.496622]  ? report_bug+0x164/0x190
   [    9.496631]  ? handle_bug+0x3c/0x80
   [    9.496638]  ? exc_invalid_op+0x17/0x70
   [    9.496647]  ? asm_exc_invalid_op+0x1a/0x20
   [    9.496660]  ? r535_gsp_init+0xc5/0x7c0 [nouveau]
   [    9.496851]  ? r535_gsp_init+0x18e/0x7c0 [nouveau]
   [    9.497044]  ? srso_return_thunk+0x5/0x5f
   [    9.497055]  nvkm_subdev_init_+0x48/0x130 [nouveau]
   [    9.497227]  ? srso_return_thunk+0x5/0x5f
   [    9.497236]  nvkm_subdev_init+0x44/0x90 [nouveau]
   [    9.497405]  nvkm_device_init+0x166/0x2e0 [nouveau]
   [    9.497608]  nvkm_udevice_init+0x47/0x70 [nouveau]
   [    9.497808]  nvkm_object_init+0x41/0x1c0 [nouveau]
   [    9.497983]  nvkm_ioctl_new+0x16a/0x290 [nouveau]
   [    9.498154]  ? __pfx_nvkm_client_child_new+0x10/0x10 [nouveau]
   [    9.498326]  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau]
   [    9.498531]  nvkm_ioctl+0x10e/0x250 [nouveau]
   [    9.498702]  nvif_object_ctor+0x112/0x190 [nouveau]
   [    9.498873]  nvif_device_ctor+0x23/0x60 [nouveau]
   [    9.499049]  nouveau_cli_init+0x164/0x5d0 [nouveau]
   [    9.499244]  nouveau_drm_device_init+0x97/0xe00 [nouveau]
   [    9.499430]  ? srso_return_thunk+0x5/0x5f
   [    9.499437]  ? pci_bus_read_config_word+0x4d/0x90
   [    9.499445]  ? srso_return_thunk+0x5/0x5f
   [    9.499452]  ? pci_update_current_state+0x72/0xb0
   [    9.499461]  nouveau_drm_probe+0x12c/0x280 [nouveau]
   [    9.499657]  ? srso_return_thunk+0x5/0x5f
   [    9.499666]  local_pci_probe+0x45/0xa0
   [    9.499674]  pci_device_probe+0xc7/0x240
   [    9.499683]  really_probe+0xd6/0x390
   [    9.499692]  ? __pfx___driver_attach+0x10/0x10
   [    9.499699]  __driver_probe_device+0x78/0x150
   [    9.499709]  driver_probe_device+0x1f/0x90
   [    9.499718]  __driver_attach+0xd2/0x1c0
   [    9.499726]  bus_for_each_dev+0x88/0xd0
   [    9.499735]  bus_add_driver+0x116/0x220
   [    9.499744]  driver_register+0x59/0x100
   [    9.499751]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
   [    9.499915]  do_one_initcall+0x5b/0x320
   [    9.499926]  do_init_module+0x60/0x240
   [    9.499934]  init_module_from_file+0x86/0xc0
   [    9.499948]  idempotent_init_module+0x120/0x2b0
   [    9.499962]  __x64_sys_finit_module+0x5e/0xb0
   [    9.499971]  do_syscall_64+0x88/0x170
   [    9.499987]  ? srso_return_thunk+0x5/0x5f
   [    9.499996]  ? syscall_exit_to_user_mode_prepare+0x15d/0x190
   [    9.500004]  ? srso_return_thunk+0x5/0x5f
   [    9.500011]  ? syscall_exit_to_user_mode+0x60/0x210
   [    9.500019]  ? srso_return_thunk+0x5/0x5f
   [    9.500026]  ? do_syscall_64+0x95/0x170
   [    9.500034]  ? srso_return_thunk+0x5/0x5f
   [    9.500041]  ? do_syscall_64+0x95/0x170
   [    9.500050]  ? srso_return_thunk+0x5/0x5f
   [    9.500058]  entry_SYSCALL_64_after_hwframe+0x71/0x79
   [    9.500067] RIP: 0033:0x7f4de9b2919d
   [    9.500075] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa =
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 =
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b cc 0c 00 f7 d8 64 89 01 48
   [    9.500091] RSP: 002b:00007ffc56bfe468 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000139
   [    9.500103] RAX: ffffffffffffffda RBX: 00005644a0432350 RCX: 00007f4d=
e9b2919d
   [    9.500112] RDX: 0000000000000000 RSI: 00005644a042ef30 RDI: 00000000=
00000031
   [    9.500121] RBP: 00007ffc56bfe520 R08: 00007f4de9bf6b20 R09: 00007ffc=
56bfe4b0
   [    9.500128] R10: 00005644a04346a0 R11: 0000000000000246 R12: 00005644=
a042ef30
   [    9.500136] R13: 0000000000020000 R14: 00005644a0432d10 R15: 00005644=
a0434660
   [    9.500149]  </TASK>
   [    9.500154] ---[ end trace 0000000000000000 ]---
   [    9.500162] nouveau 0000:1f:00.0: gsp: init failed, -5
   [    9.500189] nouveau 0000:1f:00.0: init failed with -5
   [    9.500196] nouveau: DRM-master:00000000:00000080: init failed with -=
5
   [    9.500207] nouveau 0000:1f:00.0: DRM-master: Device allocation faile=
d: -5
   [    9.502661] nouveau 0000:1f:00.0: probe with driver nouveau failed wi=
th error -5
  =20
  =20
Which brings me to the second part - TImur had me enable CONFIG_SG_DEBUG, w=
hich quickly hit a different issue:

   [    8.992320] RIP: 0010:sg_init_one (/home/lyudess/Projects/linux/workt=
rees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) =
/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:=
143 (discriminator 1))
   [ 8.992331] Code: 71 93 37 01 83 e1 03 f6 c3 03 75 20 a8 01 75 1e 48 09 =
cb 41 89 54 24 08 49 89 1c 24 41 89 6c 24 0c 5b 5d 41 5c e9 7b 94 7d 00 <0f=
> 0b 0f 0b 0f 0b 48 8b 05 5e ae 9f 01 eb b2 66 66 2e 0f 1f 84 00=20
   [    8.992428] Call Trace:
   [    8.992433]  <TASK>
   [    8.992439] ? die (/home/lyudess/Projects/linux/worktrees/nouveau-aux=
-fixes/arch/x86/kernel/dumpstack.c:421 /home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/kernel/dumpstack.c:434 /home/lyudess/Projects=
/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/dumpstack.c:447)
   [    8.992448] ? do_trap (/home/lyudess/Projects/linux/worktrees/nouveau=
-aux-fixes/arch/x86/kernel/traps.c:114 /home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/kernel/traps.c:155)
   [    8.992455] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nou=
veau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/ly=
udess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (dis=
criminator 1))
   [    8.992464] ? do_error_trap (/home/lyudess/Projects/linux/worktrees/n=
ouveau-aux-fixes/./arch/x86/include/asm/traps.h:58 /home/lyudess/Projects/l=
inux/worktrees/nouveau-aux-fixes/arch/x86/kernel/traps.c:176)
   [    8.992472] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nou=
veau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/ly=
udess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (dis=
criminator 1))
   [    8.992481] ? exc_invalid_op (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/arch/x86/kernel/traps.c:267)
   [    8.992489] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nou=
veau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/ly=
udess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (dis=
criminator 1))
   [    8.992496] ? asm_exc_invalid_op (/home/lyudess/Projects/linux/worktr=
ees/nouveau-aux-fixes/./arch/x86/include/asm/idtentry.h:621)
   [    8.992509] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nou=
veau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/ly=
udess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (dis=
criminator 1))
   [    8.992518] nvkm_firmware_ctor (/home/lyudess/Projects/linux/worktree=
s/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/firmware.c:249) nouve=
au
   [    8.992722] nvkm_falcon_fw_ctor (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c:199) nouveau
   [    8.992898] ga102_gsp_booter_ctor (/home/lyudess/Projects/linux/workt=
rees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:62) =
nouveau
   [    8.993095] r535_gsp_oneinit (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2309) nouv=
eau
   [    8.993292] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.993302] ? kmem_cache_alloc_lru (/home/lyudess/Projects/linux/work=
trees/nouveau-aux-fixes/mm/slub.c:3748 (discriminator 2) /home/lyudess/Proj=
ects/linux/worktrees/nouveau-aux-fixes/mm/slub.c:3827 (discriminator 2) /ho=
me/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/mm/slub.c:3864 (discr=
iminator 2))
   [    8.993311] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.993317] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.993324] ? ktime_get (/home/lyudess/Projects/linux/worktrees/nouve=
au-aux-fixes/kernel/time/timekeeping.c:292 /home/lyudess/Projects/linux/wor=
ktrees/nouveau-aux-fixes/kernel/time/timekeeping.c:388 /home/lyudess/Projec=
ts/linux/worktrees/nouveau-aux-fixes/kernel/time/timekeeping.c:848)
   [    8.993334] nvkm_subdev_oneinit_ (/home/lyudess/Projects/linux/worktr=
ees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:113) nouve=
au
   [    8.993510] nvkm_subdev_init_ (/home/lyudess/Projects/linux/worktrees=
/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:139) nouveau
   [    8.993685] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.993693] nvkm_subdev_init (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:170) nouveau
   [    8.993867] nvkm_device_init (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:3023) n=
ouveau
   [    8.994079] nvkm_udevice_init (/home/lyudess/Projects/linux/worktrees=
/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c:295) n=
ouveau
   [    8.994281] nvkm_object_init (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/object.c:245) nouveau
   [    8.994457] nvkm_ioctl_new (/home/lyudess/Projects/linux/worktrees/no=
uveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:149) nouveau
   [    8.994630] ? __pfx_nvkm_client_child_new (/home/lyudess/Projects/lin=
ux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/client.c:1=
25) nouveau
   [    8.994803] ? __pfx_nvkm_udevice_new (/home/lyudess/Projects/linux/wo=
rktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c=
:386) nouveau
   [    8.995013] nvkm_ioctl (/home/lyudess/Projects/linux/worktrees/nouvea=
u-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:354 /home/lyudess/Pro=
jects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/i=
octl.c:376) nouveau
   [    8.995187] nvif_object_ctor (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/object.c:298 (discriminator =
1)) nouveau
   [    8.995356] nvif_device_ctor (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/device.c:56) nouveau
   [    8.995524] nouveau_cli_init (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:270) nouveau
   [    8.995721] nouveau_drm_device_init (/home/lyudess/Projects/linux/wor=
ktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:602) nouveau
   [    8.995915] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.995923] ? pci_bus_read_config_word (/home/lyudess/Projects/linux/=
worktrees/nouveau-aux-fixes/drivers/pci/access.c:67 (discriminator 1))
   [    8.995932] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.995939] ? pci_update_current_state (/home/lyudess/Projects/linux/=
worktrees/nouveau-aux-fixes/drivers/pci/pci.c:1195 /home/lyudess/Projects/l=
inux/worktrees/nouveau-aux-fixes/drivers/pci/pci.c:1187)
   [    8.995949] nouveau_drm_probe (/home/lyudess/Projects/linux/worktrees=
/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:841) nouveau
   [    8.996145] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.996154] local_pci_probe (/home/lyudess/Projects/linux/worktrees/n=
ouveau-aux-fixes/drivers/pci/pci-driver.c:325)
   [    8.996163] pci_device_probe (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/pci/pci-driver.c:392 (discriminator 1) /home/lyud=
ess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci-driver.c:417=
 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes=
/drivers/pci/pci-driver.c:451 (discriminator 1))
   [    8.996174] really_probe (/home/lyudess/Projects/linux/worktrees/nouv=
eau-aux-fixes/drivers/base/dd.c:578 /home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/base/dd.c:656)
   [    8.996185] ? __pfx___driver_attach (/home/lyudess/Projects/linux/wor=
ktrees/nouveau-aux-fixes/drivers/base/dd.c:1155)
   [    8.996192] __driver_probe_device (/home/lyudess/Projects/linux/workt=
rees/nouveau-aux-fixes/drivers/base/dd.c:798)
   [    8.996201] driver_probe_device (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/drivers/base/dd.c:828)
   [    8.996209] __driver_attach (/home/lyudess/Projects/linux/worktrees/n=
ouveau-aux-fixes/drivers/base/dd.c:1215)
   [    8.996217] bus_for_each_dev (/home/lyudess/Projects/linux/worktrees/=
nouveau-aux-fixes/drivers/base/bus.c:368)
   [    8.996228] bus_add_driver (/home/lyudess/Projects/linux/worktrees/no=
uveau-aux-fixes/drivers/base/bus.c:673)
   [    8.996238] driver_register (/home/lyudess/Projects/linux/worktrees/n=
ouveau-aux-fixes/drivers/base/driver.c:246)
   [    8.996246] ? __pfx_nouveau_drm_init (/home/lyudess/Projects/linux/wo=
rktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/object.c:32) nouveau
   [    8.996415] do_one_initcall (/home/lyudess/Projects/linux/worktrees/n=
ouveau-aux-fixes/init/main.c:1238)
   [    8.996428] do_init_module (/home/lyudess/Projects/linux/worktrees/no=
uveau-aux-fixes/kernel/module/main.c:2538)
   [    8.996437] init_module_from_file (/home/lyudess/Projects/linux/workt=
rees/nouveau-aux-fixes/kernel/module/main.c:3168)
   [    8.996450] idempotent_init_module (/home/lyudess/Projects/linux/work=
trees/nouveau-aux-fixes/./include/linux/spinlock.h:351 /home/lyudess/Projec=
ts/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3131 /home/lyudes=
s/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3185)
   [    8.996462] __x64_sys_finit_module (/home/lyudess/Projects/linux/work=
trees/nouveau-aux-fixes/./include/linux/file.h:47 /home/lyudess/Projects/li=
nux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3207 /home/lyudess/Pro=
jects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3189 /home/lyu=
dess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3189)
   [    8.996473] do_syscall_64 (/home/lyudess/Projects/linux/worktrees/nou=
veau-aux-fixes/arch/x86/entry/common.c:52 (discriminator 1) /home/lyudess/P=
rojects/linux/worktrees/nouveau-aux-fixes/arch/x86/entry/common.c:83 (discr=
iminator 1))
   [    8.996482] ? srso_return_thunk (/home/lyudess/Projects/linux/worktre=
es/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
   [    8.996490] entry_SYSCALL_64_after_hwframe (/home/lyudess/Projects/li=
nux/worktrees/nouveau-aux-fixes/arch/x86/entry/entry_64.S:129)
   [    8.996499] RIP: 0033:0x7fd12f52919d

I think timur actually mentioned this bug to you previously, but in
hopes of getting something more useful out of SG_DEBUG I dug into this
problem a  bit and ended up with what I believe is an actually correct
patch:

https://gitlab.freedesktop.org/lyudess/linux/-/commit/485f1fb62ddd4b42b6084=
8eeb48206fef4376161

...unfortunately, fixing that issue on my system did not get SG_DEBUG
to give me any useful info.

Anyway - that brings me to ask 1: do you have any idea what might be
going on with the falcon boot issue I mentioned, or if I might just be
doing something wrong/silly with how I'm setting up memory in
nvkm_gsp_mem_ctor()?

And 2: if you have the time does that patch look correct? I'm happy to
submit it :)

Also 3: welcome back again :)

