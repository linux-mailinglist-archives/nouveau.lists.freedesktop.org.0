Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0CCAF4FD
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 09:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B08010E4C8;
	Tue,  9 Dec 2025 08:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.b="GZYxzge5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556510E4C0
 for <nouveau@lists.freedesktop.org>; Tue,  9 Dec 2025 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1765269524; x=1765874324; i=efault@gmx.de;
 bh=k3BnLJZ9Cw66QaY4VbEsMocevyj/TJ20B0ez+R7ChsE=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GZYxzge5rS1f7CqBjylOp9lqfLU6D9+3Cdk6eerBF++iBJd5RA9u0EGQoW5+Wnxy
 n/bs8CKZg7Vl8rBOwjmOUoTdf0BsMv54KXINby8WzXf0vnEBIOSykeTXrKeg7nkAD
 YUn7LAHbudGzvF8ZPzaSuxzdaHXMqnEDIE0rHVN9WTiEhRHCTniM4dnf4A11dTeNP
 CJjn1C9NQe5f9TTiRPEeLGOYAIna6Wuhoz6sMZbGX1yExwfpmLBa7d++i3g7AJivQ
 5nKVsI1maeygIx49g34A3fbAWiUy8ajO7tHhINBCEUnJzJMfVmWjYMAVMQg1GE8QI
 C7aktkbw/xPN94RTHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.71]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUnz-1wH27R1YQD-015Wwv; Tue, 09
 Dec 2025 09:38:44 +0100
Message-ID: <dbd16cb10f0b3d7747491796e41305ed0cea5a3b.camel@gmx.de>
Subject: Re: nouveau: endless drm_WARN_ON(state->checked) spew beginning at
 6.19 merge window
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau	 <nouveau@lists.freedesktop.org>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?=	 <ville.syrjala@linux.intel.com>
Date: Tue, 09 Dec 2025 09:38:43 +0100
In-Reply-To: <1515cc8a9fcb4abbf86c88ce99ff8900ec19f499.camel@gmx.de>
References: <1515cc8a9fcb4abbf86c88ce99ff8900ec19f499.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:ALbjNJZ4+WIOX5uG7RyApNlbj/dIuntbKto5wupHbcxX4Sufn3K
 c/kWUsAL9ScFplGJbMX2Et8QhQ+fjxE1TonPhXikshY3wEKDXO95Xrh7wFcgaQ7k27dNN7W
 iPtogiHKf/OcnbH8WGSbd8i3RBHkhRUZaS3HJk4b/bhBAvmDCC1vN3aGPvCoVIjdxWOT+Hn
 68gvukF6eD33x50GM7+zA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/ToTWd6Bid8=;jro751DJbQdpiImbXRoEV24uCcA
 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
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

CC

On Sat, 2025-12-06 at 10:04 +0100, Mike Galbraith wrote:
> Greetings,
>=20
> GM204 equipped box began spewing the below endlessly, reproducer is..
> boot box.
>=20
> [=C2=A0=C2=A0 44.953586] nouveau 0000:01:00.0: [drm] drm_WARN_ON(state->c=
hecked)
> [=C2=A0=C2=A0 44.953588] WARNING: drivers/gpu/drm/drm_atomic.c:373 at 0x0=
, CPU#3: kwin_wayland/2217
> [=C2=A0=C2=A0 44.953592] Modules linked in: af_packet nft_fib_inet nft_fi=
b_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 n=
ft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag=
_ipv4 bridge stp llc iscsi_ibft iscsi_boot_sysfs rfkill nf_tables binfmt_mi=
sc nls_iso8859_1 nls_cp437 usblp joydev snd_hda_codec_alc882 snd_hda_codec_=
realtek_lib snd_hda_codec_generic snd_hda_codec_hdmi intel_rapl_msr intel_r=
apl_common x86_pkg_temp_thermal snd_hda_intel intel_powerclamp snd_intel_ds=
pcfg coretemp snd_hda_codec kvm_intel r8169 snd_hwdep snd_hda_core iTCO_wdt=
 realtek intel_pmc_bxt at24 regmap_i2c iTCO_vendor_support mdio_devres mei_=
hdcp snd_pcm libphy snd_timer kvm snd i2c_i801 lpc_ich mei_me irqbypass pcs=
pkr i2c_smbus mdio_bus soundcore mei mfd_core thermal fan intel_smartconnec=
t uas usb_storage nfsd auth_rpcgss nfs_acl lockd grace sch_fq_codel sunrpc =
fuse dm_mod configfs nfnetlink dmi_sysfs nouveau hid_generic usbhid drm_ttm=
_helper ttm drm_client_lib gpu_sched i2c_algo_bit drm_gpuvm drm_exec
> [=C2=A0=C2=A0 44.953639]=C2=A0 drm_display_helper drm_kms_helper xhci_pci=
 drm ehci_pci xhci_hcd ehci_hcd ahci video libahci ghash_clmulni_intel usbc=
ore wmi libata button usb_common sd_mod scsi_dh_emc scsi_dh_rdac scsi_dh_al=
ua sg scsi_mod scsi_common vfat fat ext4 crc16 mbcache jbd2 loop msr efivar=
fs autofs4 aesni_intel gf128mul
> [=C2=A0=C2=A0 44.953659] CPU: 3 UID: 1000 PID: 2217 Comm: kwin_wayland Kd=
ump: loaded Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.18.0.g3af870ae-master=
 #4 PREEMPT(lazy)=20
> [=C2=A0=C2=A0 44.953662] Tainted: [W]=3DWARN
> [=C2=A0=C2=A0 44.953663] Hardware name: MEDION MS-7848/MS-7848, BIOS M784=
8W08.20C 09/23/2013
> [=C2=A0=C2=A0 44.953665] RIP: 0010:drm_atomic_get_crtc_state+0x152/0x170 =
[drm]
> [=C2=A0=C2=A0 44.953698] Code: 04 48 8b 7f 08 4c 8b 6f 50 4d 85 ed 75 03 =
4c 8b 2f e8 22 ff 37 e1 48 89 c6 48 8d 3d 18 5b 17 00 48 c7 c1 50 91 71 a0 =
4c 89 ea <67> 48 0f b9 3a 8b 95 90 00 00 00 e9 d6 fe ff ff 48 c7 c0 f4 ff f=
f
> [=C2=A0=C2=A0 44.953700] RSP: 0018:ffff888140797ad8 EFLAGS: 00010282
> [=C2=A0=C2=A0 44.953703] RAX: ffffffffa0ae90f1 RBX: ffff888238fbea80 RCX:=
 ffffffffa0719150
> [=C2=A0=C2=A0 44.953704] RDX: ffff888100e4d740 RSI: ffffffffa0ae90f1 RDI:=
 ffffffffa06cd040
> [=C2=A0=C2=A0 44.953705] RBP: ffff888100d07010 R08: 00000000000000c0 R09:=
 0000000000000000
> [=C2=A0=C2=A0 44.953706] R10: ffff888140797b00 R11: 0000000001000000 R12:=
 0000000000000000
> [=C2=A0=C2=A0 44.953708] R13: ffff888100e4d740 R14: ffff8881093d1038 R15:=
 ffff888238fbea80
> [=C2=A0=C2=A0 44.953709] FS:=C2=A0 00007fc3cf8efb00(0000) GS:ffff88849c2d=
8000(0000) knlGS:0000000000000000
> [=C2=A0=C2=A0 44.953711] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> [=C2=A0=C2=A0 44.953712] CR2: 00007fc3a7700000 CR3: 0000000163103005 CR4:=
 00000000001726f0
> [=C2=A0=C2=A0 44.953713] Call Trace:
> [=C2=A0=C2=A0 44.953715]=C2=A0 <TASK>
> [=C2=A0=C2=A0 44.953718]=C2=A0 nv50_wndw_prepare_fb+0xac/0x120 [nouveau]
> [=C2=A0=C2=A0 44.953801]=C2=A0 drm_atomic_helper_prepare_planes.part.0+0x=
2a/0x1b0 [drm_kms_helper]
> [=C2=A0=C2=A0 44.953815]=C2=A0 nv50_disp_atomic_commit.part.0+0x7d/0x1b0 =
[nouveau]
> [=C2=A0=C2=A0 44.953876]=C2=A0 drm_atomic_commit+0x9e/0xb0 [drm]
> [=C2=A0=C2=A0 44.953895]=C2=A0 ? drm_plane_create_color_pipeline_property=
.cold+0x24/0x24 [drm]
> [=C2=A0=C2=A0 44.953916]=C2=A0 drm_atomic_helper_update_plane+0xf1/0x150 =
[drm_kms_helper]
> [=C2=A0=C2=A0 44.953924]=C2=A0 drm_mode_cursor_universal+0xe7/0x270 [drm]
> [=C2=A0=C2=A0 44.953948]=C2=A0 drm_mode_cursor_common.part.0+0x94/0x1b0 [=
drm]
> [=C2=A0=C2=A0 44.953968]=C2=A0 ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
> [=C2=A0=C2=A0 44.953986]=C2=A0 drm_ioctl_kernel+0x7f/0xe0 [drm]
> [=C2=A0=C2=A0 44.954008]=C2=A0 drm_ioctl+0x1ea/0x470 [drm]
> [=C2=A0=C2=A0 44.954027]=C2=A0 ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
> [=C2=A0=C2=A0 44.954047]=C2=A0 nouveau_drm_ioctl+0x56/0xb0 [nouveau]
> [=C2=A0=C2=A0 44.954110]=C2=A0 __x64_sys_ioctl+0x7a/0xc0
> [=C2=A0=C2=A0 44.954114]=C2=A0 do_syscall_64+0x61/0xfc0
> [=C2=A0=C2=A0 44.954118]=C2=A0 entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [=C2=A0=C2=A0 44.954121] RIP: 0033:0x7fc3d351453f
> [=C2=A0=C2=A0 44.954122] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 =
04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 =
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 0=
0
> [=C2=A0=C2=A0 44.954124] RSP: 002b:00007ffd4ea49ba0 EFLAGS: 00000246 ORIG=
_RAX: 0000000000000010
> [=C2=A0=C2=A0 44.954126] RAX: ffffffffffffffda RBX: 00005569076a4010 RCX:=
 00007fc3d351453f
> [=C2=A0=C2=A0 44.954127] RDX: 00007ffd4ea49c60 RSI: 00000000c02464bb RDI:=
 0000000000000013
> [=C2=A0=C2=A0 44.954128] RBP: 00007ffd4ea49c60 R08: 00007fc3d7328010 R09:=
 0000000000000000
> [=C2=A0=C2=A0 44.954130] R10: 00007fc3d7328000 R11: 0000000000000246 R12:=
 00000000c02464bb
> [=C2=A0=C2=A0 44.954131] R13: 0000000000000013 R14: 0000556908538f00 R15:=
 0000556907846250
> [=C2=A0=C2=A0 44.954133]=C2=A0 </TASK>
