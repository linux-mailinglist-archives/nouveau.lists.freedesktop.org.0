Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD8CB6DE4
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 19:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACC110E84E;
	Thu, 11 Dec 2025 18:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gP/L8NXE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08BC10E87A
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765476474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7irhg/JwAW5/F1aTbRfW04m9593znXbFECl/NNZdaE=;
 b=gP/L8NXETgrsEisBlEaO8jQfagMXuIa0Pw/48vqvIi0sxtvqToNgXQojMx255vYAFuIT9k
 zmpjcz/BN945yIE/wT7+Dn3+tr9mEfspqsZly2WuJSiS0cBYpZvg1A9b9fX+U9nbwKOHLD
 2SEIccolZ/uvl0WKTaMZZ437tqENvCw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-UjuOMw7ENiOGkOR94fqLpQ-1; Thu, 11 Dec 2025 13:07:43 -0500
X-MC-Unique: UjuOMw7ENiOGkOR94fqLpQ-1
X-Mimecast-MFC-AGG-ID: UjuOMw7ENiOGkOR94fqLpQ_1765476462
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-343bf6ded5cso618524a91.0
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 10:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765476462; x=1766081262;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O7irhg/JwAW5/F1aTbRfW04m9593znXbFECl/NNZdaE=;
 b=L8COTojcjywtP+7Zvd6PhMRWn9cgK74SnPgl06ahBCjCnmw38hy3DDRpmMCnZ+XL6J
 qYE0wXcVzx9tfUtAaXw94aNuBcaRYEWf4/aY2js4TIc+vy6DoyPL8+erRNwJkQgq7YDh
 k3bJIbFSDYuw9mmELV1xMViueA3fKMjazJu5cPPb1+pbajXP62ppzOgtwMBUdU/yrEPH
 +kIRlYkuetp6UxqbeXiJ5BD4MgPrJaquWfVDmSqrL5ZtSqEbp6qaGomYVQ4xkeBjEIqY
 b2qYKW8ON2LjfBA6aNED+FqS9Dn6xy9EZy+jT31rvb3M9gG4MW/LEiVLbb8rWjTrvflj
 UODA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh0ViAKvmDK17mqbdfqcl0vI7ZGlDWRuq99w2pJS30e1K0aa/uJU7nv3fo95puvnpFcxWSjZHX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcx2HRCXGiJ5kbK72q4qmysJtSA3RfGaw1ha3fsndoLXzM2C3X
 xUrjTRzKjExZndDAqbC7p1kll/uCCCvzjFKjghSsL8eQ5Wg6k8WOpMGAvujIO/SFjES8T3Q7NzA
 sVD9pFhrKD5nNs+hkMKBWbHAHOnOhUain/HJ0p5h72op7jv5fgOThUX3ndW8r+R3H3b09JyEdT6
 g=
X-Gm-Gg: AY/fxX7r741kfrOF5okm+mNXtNGYcbxpA+BRzXXAaNsa9efOYYAkc9AxFL8btdwKsPO
 aoZu2Vs3cf4aIC78QU4wHrUhxzHhRaKzGsjcTZNE14/4/x7UAZvPY7mO5uHP9GoYiBeCfX97Hli
 Z+5F7aB9541e8zs/vDf5HVBAy6J5YwAk53CY1FpdG1rMZmR0RR+W6flIx/zMBkv+F2ASo2CQsuF
 Yqmt4ajgupuZdVYAcz3R/lWq3ftPQfIaVT7qvWf856PQch0Cn84JZVetGQtvQZwcBifuNNwzkzn
 MuwfLBR0QQYatFAvcKLVP52UQHNSQTReAzUN7UIwwVN6PIEWIpt003n95v2cGjPO2Xt837k3xII
 x3RMqgSND3EvdAUZ9sq40PemiqnHHjMfIuygAeBaA+b7YohGQXXQ0Lbc=
X-Received: by 2002:a17:90b:3e4c:b0:34a:8c77:d386 with SMTP id
 98e67ed59e1d1-34a8c77d70dmr3987193a91.9.1765476462186; 
 Thu, 11 Dec 2025 10:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELiQGhJH0gktf4xurL+5qfd46HuxTMS3qJeDhGcKDf7m/Dud2gzHsF0CHIlKO2OQBV0M+Nww==
X-Received: by 2002:a17:90b:3e4c:b0:34a:8c77:d386 with SMTP id
 98e67ed59e1d1-34a8c77d70dmr3987165a91.9.1765476461726; 
 Thu, 11 Dec 2025 10:07:41 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a9283819dsm2526919a91.4.2025.12.11.10.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:07:41 -0800 (PST)
Message-ID: <282972afc7d20facacedc0a81810daff1bbaa885.camel@redhat.com>
Subject: Re: nouveau: endless drm_WARN_ON(state->checked) spew beginning at
 6.19 merge window
From: lyude@redhat.com
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, nouveau
 <nouveau@lists.freedesktop.org>,  Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=	
 <ville.syrjala@linux.intel.com>
Date: Thu, 11 Dec 2025 13:07:36 -0500
In-Reply-To: <dbd16cb10f0b3d7747491796e41305ed0cea5a3b.camel@gmx.de>
References: <1515cc8a9fcb4abbf86c88ce99ff8900ec19f499.camel@gmx.de>
 <dbd16cb10f0b3d7747491796e41305ed0cea5a3b.camel@gmx.de>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6UOXH_wnOaakGpwAyAhSg0frnjhr1SOs9yuJGE7iWOw_1765476462
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

Yep - I'm going to be sending out a respin of the patch that fixes this
issue today

On Tue, 2025-12-09 at 09:38 +0100, Mike Galbraith wrote:
> CC
>=20
> On Sat, 2025-12-06 at 10:04 +0100, Mike Galbraith wrote:
> > Greetings,
> >=20
> > GM204 equipped box began spewing the below endlessly, reproducer
> > is..
> > boot box.
> >=20
> > [=C2=A0=C2=A0 44.953586] nouveau 0000:01:00.0: [drm] drm_WARN_ON(state-
> > >checked)
> > [=C2=A0=C2=A0 44.953588] WARNING: drivers/gpu/drm/drm_atomic.c:373 at 0=
x0,
> > CPU#3: kwin_wayland/2217
> > [=C2=A0=C2=A0 44.953592] Modules linked in: af_packet nft_fib_inet
> > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
> > nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc iscsi_ibft
> > iscsi_boot_sysfs rfkill nf_tables binfmt_misc nls_iso8859_1
> > nls_cp437 usblp joydev snd_hda_codec_alc882
> > snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_codec_hdmi
> > intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal snd_hda_intel
> > intel_powerclamp snd_intel_dspcfg coretemp snd_hda_codec kvm_intel
> > r8169 snd_hwdep snd_hda_core iTCO_wdt realtek intel_pmc_bxt at24
> > regmap_i2c iTCO_vendor_support mdio_devres mei_hdcp snd_pcm libphy
> > snd_timer kvm snd i2c_i801 lpc_ich mei_me irqbypass pcspkr
> > i2c_smbus mdio_bus soundcore mei mfd_core thermal fan
> > intel_smartconnect uas usb_storage nfsd auth_rpcgss nfs_acl lockd
> > grace sch_fq_codel sunrpc fuse dm_mod configfs nfnetlink dmi_sysfs
> > nouveau hid_generic usbhid drm_ttm_helper ttm drm_client_lib
> > gpu_sched i2c_algo_bit drm_gpuvm drm_exec
> > [=C2=A0=C2=A0 44.953639]=C2=A0 drm_display_helper drm_kms_helper xhci_p=
ci drm
> > ehci_pci xhci_hcd ehci_hcd ahci video libahci ghash_clmulni_intel
> > usbcore wmi libata button usb_common sd_mod scsi_dh_emc
> > scsi_dh_rdac scsi_dh_alua sg scsi_mod scsi_common vfat fat ext4
> > crc16 mbcache jbd2 loop msr efivarfs autofs4 aesni_intel gf128mul
> > [=C2=A0=C2=A0 44.953659] CPU: 3 UID: 1000 PID: 2217 Comm: kwin_wayland =
Kdump:
> > loaded Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.18.0.g3af870ae-master=
 #4
> > PREEMPT(lazy)=20
> > [=C2=A0=C2=A0 44.953662] Tainted: [W]=3DWARN
> > [=C2=A0=C2=A0 44.953663] Hardware name: MEDION MS-7848/MS-7848, BIOS
> > M7848W08.20C 09/23/2013
> > [=C2=A0=C2=A0 44.953665] RIP: 0010:drm_atomic_get_crtc_state+0x152/0x17=
0
> > [drm]
> > [=C2=A0=C2=A0 44.953698] Code: 04 48 8b 7f 08 4c 8b 6f 50 4d 85 ed 75 0=
3 4c
> > 8b 2f e8 22 ff 37 e1 48 89 c6 48 8d 3d 18 5b 17 00 48 c7 c1 50 91
> > 71 a0 4c 89 ea <67> 48 0f b9 3a 8b 95 90 00 00 00 e9 d6 fe ff ff 48
> > c7 c0 f4 ff ff
> > [=C2=A0=C2=A0 44.953700] RSP: 0018:ffff888140797ad8 EFLAGS: 00010282
> > [=C2=A0=C2=A0 44.953703] RAX: ffffffffa0ae90f1 RBX: ffff888238fbea80 RC=
X:
> > ffffffffa0719150
> > [=C2=A0=C2=A0 44.953704] RDX: ffff888100e4d740 RSI: ffffffffa0ae90f1 RD=
I:
> > ffffffffa06cd040
> > [=C2=A0=C2=A0 44.953705] RBP: ffff888100d07010 R08: 00000000000000c0 R0=
9:
> > 0000000000000000
> > [=C2=A0=C2=A0 44.953706] R10: ffff888140797b00 R11: 0000000001000000 R1=
2:
> > 0000000000000000
> > [=C2=A0=C2=A0 44.953708] R13: ffff888100e4d740 R14: ffff8881093d1038 R1=
5:
> > ffff888238fbea80
> > [=C2=A0=C2=A0 44.953709] FS:=C2=A0 00007fc3cf8efb00(0000)
> > GS:ffff88849c2d8000(0000) knlGS:0000000000000000
> > [=C2=A0=C2=A0 44.953711] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > [=C2=A0=C2=A0 44.953712] CR2: 00007fc3a7700000 CR3: 0000000163103005 CR=
4:
> > 00000000001726f0
> > [=C2=A0=C2=A0 44.953713] Call Trace:
> > [=C2=A0=C2=A0 44.953715]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 44.953718]=C2=A0 nv50_wndw_prepare_fb+0xac/0x120 [nouveau=
]
> > [=C2=A0=C2=A0 44.953801]=C2=A0 drm_atomic_helper_prepare_planes.part.0+=
0x2a/0x1b0
> > [drm_kms_helper]
> > [=C2=A0=C2=A0 44.953815]=C2=A0 nv50_disp_atomic_commit.part.0+0x7d/0x1b=
0 [nouveau]
> > [=C2=A0=C2=A0 44.953876]=C2=A0 drm_atomic_commit+0x9e/0xb0 [drm]
> > [=C2=A0=C2=A0 44.953895]=C2=A0 ?
> > drm_plane_create_color_pipeline_property.cold+0x24/0x24 [drm]
> > [=C2=A0=C2=A0 44.953916]=C2=A0 drm_atomic_helper_update_plane+0xf1/0x15=
0
> > [drm_kms_helper]
> > [=C2=A0=C2=A0 44.953924]=C2=A0 drm_mode_cursor_universal+0xe7/0x270 [dr=
m]
> > [=C2=A0=C2=A0 44.953948]=C2=A0 drm_mode_cursor_common.part.0+0x94/0x1b0=
 [drm]
> > [=C2=A0=C2=A0 44.953968]=C2=A0 ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
> > [=C2=A0=C2=A0 44.953986]=C2=A0 drm_ioctl_kernel+0x7f/0xe0 [drm]
> > [=C2=A0=C2=A0 44.954008]=C2=A0 drm_ioctl+0x1ea/0x470 [drm]
> > [=C2=A0=C2=A0 44.954027]=C2=A0 ? drm_mode_cursor_ioctl+0x80/0x80 [drm]
> > [=C2=A0=C2=A0 44.954047]=C2=A0 nouveau_drm_ioctl+0x56/0xb0 [nouveau]
> > [=C2=A0=C2=A0 44.954110]=C2=A0 __x64_sys_ioctl+0x7a/0xc0
> > [=C2=A0=C2=A0 44.954114]=C2=A0 do_syscall_64+0x61/0xfc0
> > [=C2=A0=C2=A0 44.954118]=C2=A0 entry_SYSCALL_64_after_hwframe+0x4b/0x53
> > [=C2=A0=C2=A0 44.954121] RIP: 0033:0x7fc3d351453f
> > [=C2=A0=C2=A0 44.954122] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c=
7 04
> > 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10
> > 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b
> > 04 25 28 00 00
> > [=C2=A0=C2=A0 44.954124] RSP: 002b:00007ffd4ea49ba0 EFLAGS: 00000246
> > ORIG_RAX: 0000000000000010
> > [=C2=A0=C2=A0 44.954126] RAX: ffffffffffffffda RBX: 00005569076a4010 RC=
X:
> > 00007fc3d351453f
> > [=C2=A0=C2=A0 44.954127] RDX: 00007ffd4ea49c60 RSI: 00000000c02464bb RD=
I:
> > 0000000000000013
> > [=C2=A0=C2=A0 44.954128] RBP: 00007ffd4ea49c60 R08: 00007fc3d7328010 R0=
9:
> > 0000000000000000
> > [=C2=A0=C2=A0 44.954130] R10: 00007fc3d7328000 R11: 0000000000000246 R1=
2:
> > 00000000c02464bb
> > [=C2=A0=C2=A0 44.954131] R13: 0000000000000013 R14: 0000556908538f00 R1=
5:
> > 0000556907846250
> > [=C2=A0=C2=A0 44.954133]=C2=A0 </TASK>

