Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D0CDDF65
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 18:11:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C238411BF95;
	Thu, 25 Dec 2025 17:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ayyhxi39";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E38C944037;
	Thu, 25 Dec 2025 17:03:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766682223;
 b=bY+cD5pkejk+Vr5ojePIPzhG/K4C2nUwacqfi03JLyDXXMc5f97ePEmMb/8CoD1pa2T0l
 X/m+cuOJtK5b0ayRkSP+doEsPjXq9ufUcISdW61OuIYZiGpKabuDilClt0urEhdmRNBJEOu
 arBR7hsEvF3dVKVak/pYL73++Ac9aO+ktDILM6jy2P9dMZ/u+raGE32c7hy3WwcKPMHjOhl
 QmGQxw/Pix9jiXgYI6yhOLlL4hyHSjVJZBPk34sULcvgnYb2tB8weNBdH7iHGfCnAwqUEPv
 pjGdbpWEeaBTJhpMZIOBaLZZrhYA/pAZk3+19K5rBEbVHMconmJJHKn32T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766682223; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=suWHoCdjES5o4GWEkjKVrlTNOfdwujoGI0MclaECRlk=;
 b=LFGlYMBRGoJlj/a3mbPHOokHDvVFh+agjLWAsjSXepIUxPwG2ZFHm0RgqvdwzrVRWsBaZ
 PmOQeen6V8kE5T+kChVkINKtJOZ00hkw2lc0zgYkjEOKlfGOS33FiKgvLYR27RPcwB9C22k
 Jpptiqbren5ZZWiBU8AAsvPCSgCcKB34J+QfxXY4+BF5aWfzRmmSnQe6Y+w3oSTm21GWO1l
 zS1q0q1KOLKc7SHStCQ/oUvymGpfzYe8DNBKh7RTjeHPtbp6g8PhhqmrUgSHAkpz5+f0Mdr
 UQr3WhhcFwajVjRUSofhEVyt0v8RTx+N40x3eobE7ZykCjNwHNURCR29/HGg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 377FB44C4E
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 19:51:30 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8910E09D
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 19:59:14 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-88a2ad13c24so58890316d6.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 24 Dec 2025 11:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766606353; x=1767211153;
 darn=lists.freedesktop.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=suWHoCdjES5o4GWEkjKVrlTNOfdwujoGI0MclaECRlk=;
        b=Ayyhxi39Jo3nJI4twlKdH2IjxLQO/1SDco9tvsTBR0/uFIbeL7H/jGq1jf6nau8lnh
         Cg5C/6K+yhFUAorRJxBlXZ3x+iZMvZlIoAn0KVRsV4jmmbR2J0kHDKSwKh7cR0ULr3CA
         uoMZ0ZzwmBpIkaPT8W5v4/UwNqRLb/HcxdHSWM1Sa/daRMI19cv+WlLOT8KTtIkvaok6
         qEhrFfZ4esTLTmbBOTlSH6mjHBoUc3apBmIMWb5b9v6pMvtQ+TfEhgNmxGKI2XwGzJrP
         nS/irkhAwZjSBlg7bNeJZKwCRhFG4+Z2wyD4TRp21ggUgPynig6ez/osUNKSr7ml6RkO
         KZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766606353; x=1767211153;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suWHoCdjES5o4GWEkjKVrlTNOfdwujoGI0MclaECRlk=;
        b=afcrPgeIwuEZMUplJTX1LmpGLCQ/+45+zHM85XgzBqs2e5TZRpHowTXx7zXQsGGWxf
         fgLDSAelo4/M1ORbFaSNUt8w9B/YdZvt5qZNIXai82EvufGupgnoVvP5y5kIP3Yxz6lt
         sXKyz6+Y3oOenoA6CZeJrPMg9iWz392NMoLqZqbxBmoO7YrSkl97r5BEc9Q3YrVS0VJd
         MtRMoQqiBBub+ePD5xDFuS/jpbfDZ6X4x3UGvn+GD7rhSujkK5lMnFuwl9hOQngo39tZ
         iYYOZUamq+YL4PqgU0/uZSTLFFJ4IbCmkS/1ACbzNcuInMckWarlvUQCtKbwxLe9ue6T
         nTZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyn9+xemo1SVsMmyNcoeWBEdv9ZECQfzfa7xKsljriSQ39xoCwUwiRFmr6PKJEn0AnU8cdCLli@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdNjB1N7MnL5IvNMGI5mt9m1GnPEut4ABLQtJg360GYnQ7PssT
	eIMpn5Psxbf44x6zwattWGPaMUtXiSg8owfm49/TjIQ6oBQGKJRPqgiBYKRzs7msdjgWiMLWTLo
	C1FxK3/ZTi/bMxClWMykYYB5AdjJEU7s=
X-Gm-Gg: AY/fxX4hJJRDkM33dW82luNrnp+Km9vZqobXOmweTh6p7KihkNb6AXzmrRK2f5Rc2qA
	tYfap+NKleyV4CcoJF+LDAyXv2058GLkRlCjCwKacYnc/K9XDGmvocJUC+5G9ET+i2F5NP1/aeT
	pIyxB9JUEil7OIpSpve5dfyUSBQAGlP7EwniklCf91fr+RhkrkSilkTkkpTc1UVt4qi4rja0i4+
	AV+impQi0or/Ndv7qbpInOGtNUlA2daCxw+YSL7nbTAmXC32xi7/idiH7pi74pTlF8BkBohfmf5
	Pi7j2nwy1BkmfEP/DATsm13oZ3VYOvMMshO985PJ6224Q0ISESCOFKachwQiUT2/yfzGRaB7UxM
	3lOtrKvgaqRX7fJxikoJQ0I/bpJJ8kY4gDlLTWOgwkMzuCsMr05rTS50NdXFy
X-Google-Smtp-Source: 
 AGHT+IHfCwHjKpq8B5d2cyOzWcyvnq2tt5eboEpwn9ZY7qdyGeLdVLLo3Jho0y1o836vVE9y+uFXlsJoearAj0wRCLM=
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id
 6a1803df08f44-88fcaa1aecbmr184313216d6.32.1766606353470; Wed, 24 Dec 2025
 11:59:13 -0800 (PST)
MIME-Version: 1.0
From: Steve French <smfrench@gmail.com>
Date: Wed, 24 Dec 2025 13:59:02 -0600
X-Gm-Features: AQt7F2oXcnv96Cgf1Gx1spIHuWR7s-nnxt45R2cfxdKNyVZzWOMUqpbGH0ZF6sg
Message-ID: 
 <CAH2r5muA=vzdVeK=-6Du7NdbeWs5xyxZt7AYYKKLoaGNHPW6Ng@mail.gmail.com>
Subject: Nouveau driver warn on most xfstests in current mainline (6.19-rc2)
To: LKML <linux-kernel@vger.kernel.org>, robdclark@gmail.com,
	Daniel Vetter <daniel.vetter@ffwll.ch>, nouveau@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>, "M: Danilo Krummrich" <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: smfrench@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 5HR4FZU33QWHBFZQGJPTWW655LG6XBVO
X-Message-ID-Hash: 5HR4FZU33QWHBFZQGJPTWW655LG6XBVO
X-Mailman-Approved-At: Thu, 25 Dec 2025 17:03:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5HR4FZU33QWHBFZQGJPTWW655LG6XBVO/>
Archived-At: 
 <https://lore.freedesktop.org/CAH2r5muA=vzdVeK=-6Du7NdbeWs5xyxZt7AYYKKLoaGNHPW6Ng@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

WARN_ON in drivers/gpu/drm/drm_atomic.c

struct drm_crtc_state *drm_atomic_get_crtc_state(struct drm_atomic_state *state,
                          struct drm_crtc *crtc)
{
        int ret, index = drm_crtc_index(crtc);
        struct drm_crtc_state *crtc_state;

        WARN_ON(!state->acquire_ctx);
        drm_WARN_ON(state->dev, state->checked);


I don't see this on my other laptop (presumably because it isn't using
the Nouveau driver) but do see it repeatedly on my older laptop when
running most xfstests, causing most xfstests to fail.

[  303.098179] ------------[ cut here ]------------
[  303.098183] nouveau 0000:01:00.0: [drm] drm_WARN_ON(state->checked)
[  303.098188] WARNING: drivers/gpu/drm/drm_atomic.c:373 at
drm_atomic_get_crtc_state+0x17b/0x1b0, CPU#5: KMS thread/2513
[  303.098203] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device
xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo
xt_addrtype nft_compat nf_tables cifs nls_ucs2_utils rdma_cm iw_cm
ib_cm ib_core cachefiles cifs_md4 netfs vxlan ip6_udp_tunnel
udp_tunnel overlay qrtr algif_hash algif_skcipher af_alg bnep
sch_fq_codel binfmt_misc intel_uncore_frequency
intel_uncore_frequency_common snd_sof_pci_intel_cnl intel_tcc_cooling
snd_sof_intel_hda_generic x86_pkg_temp_thermal soundwire_intel
intel_powerclamp iwlmvm snd_sof_intel_hda_sdw_bpt
snd_sof_intel_hda_common elan_i2c btusb cmdlinepart snd_soc_hdac_hda
btmtk snd_sof_intel_hda_mlink spi_nor btrtl snd_sof_intel_hda
soundwire_cadence btbcm snd_sof_pci snd_sof_xtensa_dsp btintel
coretemp nls_iso8859_1 mei_hdcp mei_pxp ee1004 mtd intel_rapl_msr
think_lmi mac80211 snd_sof snd_sof_utils snd_soc_acpi_intel_match
nouveau
[  303.098414]  snd_soc_acpi_intel_sdca_quirks
soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi
soundwire_bus kvm_intel snd_ctl_led snd_soc_sdca snd_hda_codec_alc269
snd_hda_scodec_component libarc4 crc8 snd_hda_codec_realtek_lib kvm
snd_soc_avs snd_hda_codec_nvhdmi snd_hda_codec_generic iwlwifi
snd_hda_codec_hdmi snd_soc_hda_codec snd_hda_intel snd_hda_ext_core
uvcvideo snd_hda_codec snd_soc_core
processor_thermal_device_pci_legacy snd_hda_core
processor_thermal_device videobuf2_vmalloc irqbypass
processor_thermal_wt_hint uvc platform_temperature_control
snd_compress ghash_clmulni_intel videobuf2_memops snd_intel_dspcfg
processor_thermal_soc_slider aesni_intel ac97_bus videobuf2_v4l2
processor_thermal_rfim snd_intel_sdw_acpi rapl snd_hwdep
snd_pcm_dmaengine videobuf2_common processor_thermal_rapl cfg80211
intel_cstate bluetooth firmware_attributes_class wmi_bmof
intel_wmi_thunderbolt videodev snd_pcm intel_rapl_common i2c_i801
mei_me nvidiafb i2c_smbus processor_thermal_wt_req spi_intel_pci
i2c_mux spi_intel
[  303.098580]  mei mc processor_thermal_power_floor
processor_thermal_mbox vgastate snd_timer fb_ddc intel_soc_dts_iosf
intel_pch_thermal intel_pmc_core thinkpad_acpi int3403_thermal
pmt_telemetry nvram int340x_thermal_zone pmt_discovery pmt_class
intel_pmc_ssram_telemetry int3400_thermal acpi_pad acpi_thermal_rel
intel_vsec joydev input_leds mac_hid serio_raw nfsd mxm_wmi drm_gpuvm
gpu_sched drm_ttm_helper auth_rpcgss ttm nfs_acl drm_exec lockd
drm_display_helper grace cec rc_core i2c_algo_bit sunrpc msr
parport_pc ppdev lp parport nvme_fabrics efi_pstore nfnetlink
dmi_sysfs ip_tables x_tables autofs4 xfs btrfs blake2b libblake2b
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor raid6_pq raid1 raid0 linear ucsi_acpi wacom typec_ucsi
hid_microsoft ff_memless typec hid_generic rtsx_pci_sdmmc nvme 8250_dw
e1000e thunderbolt nvme_core usbhid psmouse rtsx_pci hid snd
nvme_keyring nvme_auth intel_lpss_pci hkdf intel_lpss idma64 soundcore
platform_profile video sparse_keymap wmi pinctrl_cannonlake
[  303.098833] CPU: 5 UID: 1000 PID: 2513 Comm: KMS thread Tainted: G
      W           6.19.0-rc2+ #77 PREEMPT(voluntary)
[  303.098845] Tainted: [W]=WARN
[  303.098849] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[  303.098854] RIP: 0010:drm_atomic_get_crtc_state+0x185/0x1b0
[  303.098863] Code: 04 48 8b 7f 08 4c 8b 77 50 4d 85 f6 75 03 4c 8b
37 e8 ff 3e 07 00 48 89 c6 48 8d 3d 15 24 5d 01 48 c7 c1 a8 7b b4 94
4c 89 f2 <67> 48 0f b9 3a 41 8b 94 24 90 00 00 00 e9 a2 fe ff ff 48 c7
c0 f4
[  303.098870] RSP: 0018:ffffceb241ac7920 EFLAGS: 00010246
[  303.098878] RAX: ffffffffc227c10e RBX: ffff88aecbba3900 RCX: ffffffff94b47ba8
[  303.098884] RDX: ffff88a742985430 RSI: ffffffffc227c10e RDI: ffffffff952b6070
[  303.098889] RBP: ffffceb241ac7948 R08: 0000000000000000 R09: 0000000000000000
[  303.098894] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88aec75fd010
[  303.098898] R13: 0000000000000000 R14: ffff88a742985430 R15: 0000000000000002
[  303.098903] FS:  00007176c72066c0(0000) GS:ffff88af018e1000(0000)
knlGS:0000000000000000
[  303.098910] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  303.098916] CR2: 000009ec01590000 CR3: 000000088791e005 CR4: 00000000003726f0
[  303.098922] Call Trace:
[  303.098926]  <TASK>
[  303.098933]  nv50_wndw_prepare_fb+0xd3/0x370 [nouveau]
[  303.099332]  ? drm_atomic_helper_setup_commit+0x752/0x7c0
[  303.099346]  drm_atomic_helper_prepare_planes+0x7c/0x230
[  303.099357]  nv50_disp_atomic_commit+0xad/0x1d0 [nouveau]
[  303.099748]  drm_atomic_commit+0xaf/0xf0
[  303.099758]  ? __pfx___drm_printfn_info+0x10/0x10
[  303.099773]  drm_atomic_helper_update_plane+0xfc/0x180
[  303.099785]  __setplane_atomic+0xcb/0x140
[  303.099798]  drm_mode_cursor_universal+0x13d/0x2a0
[  303.099816]  drm_mode_cursor_common+0x10e/0x250
[  303.099829]  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
[  303.099839]  drm_mode_cursor_ioctl+0x47/0x70
[  303.099850]  drm_ioctl_kernel+0xb7/0x110
[  303.099862]  drm_ioctl+0x2ec/0x5b0
[  303.099870]  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
[  303.099890]  nouveau_drm_ioctl+0x5d/0xd0 [nouveau]
[  303.100308]  __x64_sys_ioctl+0xa5/0x100
[  303.100321]  x64_sys_call+0x1243/0x26b0
[  303.100332]  do_syscall_64+0x81/0x500
[  303.100340]  ? x64_sys_call+0x11b9/0x26b0
[  303.100350]  ? do_syscall_64+0xbf/0x500
[  303.100359]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  303.100366] RIP: 0033:0x7176ef924e1d
[  303.100374] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
00 00
[  303.100381] RSP: 002b:00007176c7204b20 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  303.100390] RAX: ffffffffffffffda RBX: 00007176c002a100 RCX: 00007176ef924e1d
[  303.100396] RDX: 00007176c7204bb0 RSI: 00000000c01c64a3 RDI: 000000000000000c
[  303.100401] RBP: 00007176c7204b70 R08: 0000000000000100 R09: 0000000000000014
[  303.100407] R10: 0000000000000110 R11: 0000000000000246 R12: 00007176c7204bb0
[  303.100412] R13: 00000000c01c64a3 R14: 000000000000000c R15: 00007176c0029c00
[  303.100426]  </TASK>
[  303.100430] ---[ end trace 0000000000000000 ]---
-- 
Thanks,

Steve
