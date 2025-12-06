Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83BCAA32A
	for <lists+nouveau@lfdr.de>; Sat, 06 Dec 2025 10:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03010E2AA;
	Sat,  6 Dec 2025 09:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.b="nBPtTMt1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Sat, 06 Dec 2025 09:09:35 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356410E2C9
 for <nouveau@lists.freedesktop.org>; Sat,  6 Dec 2025 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1765012171; x=1765616971; i=efault@gmx.de;
 bh=1frAXqR7H+A6suX3VXpHFW5Zd5fw2S+O38mIhVqR9OE=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:
 Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nBPtTMt1Xz32CZKd4tPIg2H3ZwGPQ5D+ofSWHf0rQTwlntmPu2RMxuILELULNCVl
 o0Pxtphvd5XMY3hytzwxC/kJP0djLISJI6f3d1/bbVg0S2DPmyL5pbz51DD+nNeG1
 QZMTCfZxDEbiYn1uusdi6e9NOF4zObdcMM9Qw8PF/S/Vc4KoXKIz+AUCYHxOCCr00
 CcPGvG7HUw8hMg0FKktErySOVC3SrW3M20bCpxPr5rUD8ICisXqiwQ5NeFJSeuVls
 Yu3VldrkLJ/CA76lvbwsYUN5xALkNh/FkjROtG20AIZqSJoskJAq2XfuNWG6XJ6fN
 ctn21WHeH3sLR1jh4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.108]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEUzA-1vGDdc2EXK-006NTM; Sat, 06
 Dec 2025 10:04:06 +0100
Message-ID: <1515cc8a9fcb4abbf86c88ce99ff8900ec19f499.camel@gmx.de>
Subject: nouveau: endless drm_WARN_ON(state->checked) spew beginning at 6.19
 merge window
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau	 <nouveau@lists.freedesktop.org>
Date: Sat, 06 Dec 2025 10:04:05 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:3qTM15n0Uu3+A0/CPq1uwvD1xpBFRD2uea6U5cuscRIkkyXvyUr
 jSTyX7fizEFIim/Zr2+NEeCoLXzDWpOTwenbpBf1LCLFWyoy+BKZuFJ/09MnxgQ+SZTG27O
 9vj3oMB+TqAvP+ujaaxvD3Z9+D88dU/+5w07lvH37koaVqkMcz1kvS3R7mBvBFl4nlFFGJD
 PIpQxTmIrsEiH7A+f6yYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V5GZF+iYf5c=;bV5rxdFvU6LA+AJq5KPeG7o/JK3
 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
 QXs2W4N1Xxl1YfHSPNE/WxGG9jnYko3xM6cF9x
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

Greetings,

GM204 equipped box began spewing the below endlessly, reproducer is..
boot box.

[   44.953586] nouveau 0000:01:00.0: [drm] drm_WARN_ON(state->checked)
[   44.953588] WARNING: drivers/gpu/drm/drm_atomic.c:373 at 0x0, CPU#3: kwi=
n_wayland/2217
[   44.953592] Modules linked in: af_packet nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge=
 stp llc iscsi_ibft iscsi_boot_sysfs rfkill nf_tables binfmt_misc nls_iso88=
59_1 nls_cp437 usblp joydev snd_hda_codec_alc882 snd_hda_codec_realtek_lib =
snd_hda_codec_generic snd_hda_codec_hdmi intel_rapl_msr intel_rapl_common x=
86_pkg_temp_thermal snd_hda_intel intel_powerclamp snd_intel_dspcfg coretem=
p snd_hda_codec kvm_intel r8169 snd_hwdep snd_hda_core iTCO_wdt realtek int=
el_pmc_bxt at24 regmap_i2c iTCO_vendor_support mdio_devres mei_hdcp snd_pcm=
 libphy snd_timer kvm snd i2c_i801 lpc_ich mei_me irqbypass pcspkr i2c_smbu=
s mdio_bus soundcore mei mfd_core thermal fan intel_smartconnect uas usb_st=
orage nfsd auth_rpcgss nfs_acl lockd grace sch_fq_codel sunrpc fuse dm_mod =
configfs nfnetlink dmi_sysfs nouveau hid_generic usbhid drm_ttm_helper ttm =
drm_client_lib gpu_sched i2c_algo_bit drm_gpuvm drm_exec
[   44.953639]  drm_display_helper drm_kms_helper xhci_pci drm ehci_pci xhc=
i_hcd ehci_hcd ahci video libahci ghash_clmulni_intel usbcore wmi libata bu=
tton usb_common sd_mod scsi_dh_emc scsi_dh_rdac scsi_dh_alua sg scsi_mod sc=
si_common vfat fat ext4 crc16 mbcache jbd2 loop msr efivarfs autofs4 aesni_=
intel gf128mul
[   44.953659] CPU: 3 UID: 1000 PID: 2217 Comm: kwin_wayland Kdump: loaded =
Tainted: G        W           6.18.0.g3af870ae-master #4 PREEMPT(lazy)=20
[   44.953662] Tainted: [W]=3DWARN
[   44.953663] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[   44.953665] RIP: 0010:drm_atomic_get_crtc_state+0x152/0x170 [drm]
[   44.953698] Code: 04 48 8b 7f 08 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 =
22 ff 37 e1 48 89 c6 48 8d 3d 18 5b 17 00 48 c7 c1 50 91 71 a0 4c 89 ea <67=
> 48 0f b9 3a 8b 95 90 00 00 00 e9 d6 fe ff ff 48 c7 c0 f4 ff ff
[   44.953700] RSP: 0018:ffff888140797ad8 EFLAGS: 00010282
[   44.953703] RAX: ffffffffa0ae90f1 RBX: ffff888238fbea80 RCX: ffffffffa07=
19150
[   44.953704] RDX: ffff888100e4d740 RSI: ffffffffa0ae90f1 RDI: ffffffffa06=
cd040
[   44.953705] RBP: ffff888100d07010 R08: 00000000000000c0 R09: 00000000000=
00000
[   44.953706] R10: ffff888140797b00 R11: 0000000001000000 R12: 00000000000=
00000
[   44.953708] R13: ffff888100e4d740 R14: ffff8881093d1038 R15: ffff888238f=
bea80
[   44.953709] FS:  00007fc3cf8efb00(0000) GS:ffff88849c2d8000(0000) knlGS:=
0000000000000000
[   44.953711] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.953712] CR2: 00007fc3a7700000 CR3: 0000000163103005 CR4: 00000000001=
726f0
[   44.953713] Call Trace:
[   44.953715]  <TASK>
[   44.953718]  nv50_wndw_prepare_fb+0xac/0x120 [nouveau]
[   44.953801]  drm_atomic_helper_prepare_planes.part.0+0x2a/0x1b0 [drm_kms=
_helper]
[   44.953815]  nv50_disp_atomic_commit.part.0+0x7d/0x1b0 [nouveau]
[   44.953876]  drm_atomic_commit+0x9e/0xb0 [drm]
[   44.953895]  ? drm_plane_create_color_pipeline_property.cold+0x24/0x24 [=
drm]
[   44.953916]  drm_atomic_helper_update_plane+0xf1/0x150 [drm_kms_helper]
[   44.953924]  drm_mode_cursor_universal+0xe7/0x270 [drm]
[   44.953948]  drm_mode_cursor_common.part.0+0x94/0x1b0 [drm]
[   44.953968]  ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
[   44.953986]  drm_ioctl_kernel+0x7f/0xe0 [drm]
[   44.954008]  drm_ioctl+0x1ea/0x470 [drm]
[   44.954027]  ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
[   44.954047]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
[   44.954110]  __x64_sys_ioctl+0x7a/0xc0
[   44.954114]  do_syscall_64+0x61/0xfc0
[   44.954118]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   44.954121] RIP: 0033:0x7fc3d351453f
[   44.954122] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   44.954124] RSP: 002b:00007ffd4ea49ba0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[   44.954126] RAX: ffffffffffffffda RBX: 00005569076a4010 RCX: 00007fc3d35=
1453f
[   44.954127] RDX: 00007ffd4ea49c60 RSI: 00000000c02464bb RDI: 00000000000=
00013
[   44.954128] RBP: 00007ffd4ea49c60 R08: 00007fc3d7328010 R09: 00000000000=
00000
[   44.954130] R10: 00007fc3d7328000 R11: 0000000000000246 R12: 00000000c02=
464bb
[   44.954131] R13: 0000000000000013 R14: 0000556908538f00 R15: 00005569078=
46250
[   44.954133]  </TASK>
