Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE39CBAFAC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ECC10ECAB;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=atolcd.com header.i=@atolcd.com header.b="NXYtGvQK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E2110E36D
 for <nouveau@lists.freedesktop.org>; Sun, 13 Oct 2024 09:49:43 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca6603aso3811091a12.1
 for <nouveau@lists.freedesktop.org>; Sun, 13 Oct 2024 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atolcd.com; s=google; t=1728812982; x=1729417782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ0+mj45+mG+VoCFU/wDOZqLFpzVRmMKrAIIZ0itCLM=;
 b=NXYtGvQKfK7JtRwqD963QP0YKhbOqJZcyTLp2WJTF9dwJ6xJTikuf+n/nl29iSxYKk
 329CJLyohg1QGqwLQ6jTvc+s7BoorhFhlpBvNR/uLFx8xHZ61CZfPyRKdmJJzsVuVNlt
 G9Ian9U3+S6Zh4vWyAhPT+RY8aFfM0tYGdRpphxZdMHrY2DWAKEXINCKu5mN2RmqByQr
 uBEj0a8wsOp1gHzjQrKclZ3hQPIBU2hoNQWKImk4dCZLVH89mimChcZVSj1GO6xjJ5LT
 5ie8Qn5jJ1xS3oj8ahv7AS7bmuOc/NZJqdmHqLCiyfESYBpGSovQrqZXA46y4/8JQJ1t
 Lm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728812982; x=1729417782;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQ0+mj45+mG+VoCFU/wDOZqLFpzVRmMKrAIIZ0itCLM=;
 b=imjnbkgka0St7bTACK6CJBOBU/TgSsA3LqPQ4xNJ5AN8JiB44X3y5ct0jS0eEeRpe3
 1Cv5s7Uc+qAxYdZcTOiZ8cPb34h5UqBUlia6/bFAx+iWZJjIqE5XIQ8+N7cXxlLb2hpg
 Hd5aRmnb/afs1XkYggJ9SqXrCb6BY0+KPP40apC0MvqTyYyPwMCVZk5JOlpZSTfeavfR
 9CAdDdMQbZiSgVzNuXidgOi1G34bwy/9a0jga+uZMEa7PKVmLKb29bq7o9seL7GMIl1o
 QWi1plYjIeRpnR0wso/vkM+Zu5XD87KoZ9RvLPf2C/BvSO1jApm1cFbNIV0Bqrdtg8cY
 5BVQ==
X-Gm-Message-State: AOJu0Yy+C8os9t7vIf4gS86Qn5FBtgX8PGKs+wVfmTm+5e1tERZPoBLk
 ecMv/hqRndQX0G9zfuOq07K71UVUXjsLmY+LVjolTjuo7O8UIg29cTkUL4vyeIR/FQPS59rbiEX
 kii65j3/alO/Gf7yfnXpvge5iTNLPahKmsi45Z/YWnENefJPijhY=
X-Google-Smtp-Source: AGHT+IH+664K9b4hiWyQC9Whlob+1TBanVa8Sw/SmRKBXxvO+eHx5E6vFmkr2NdGmbPf8/JbexpivlCnPFJxiOdf0xs=
X-Received: by 2002:a17:907:7f91:b0:a99:f975:2e6 with SMTP id
 a640c23a62f3a-a99f9750410mr273947666b.35.1728812981757; Sun, 13 Oct 2024
 02:49:41 -0700 (PDT)
MIME-Version: 1.0
From: Quentin Aymard <qay@atolcd.com>
Date: Sun, 13 Oct 2024 11:49:31 +0200
Message-ID: <CAMHCqJ05Kwpru5wAkLdaikgutyp0KFi02bXx+Y=s+Wz3UHMc3g@mail.gmail.com>
Subject: Nouveau bug with electron ?
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

Hi,

Since a few days I am unable to start any application using
electron/chromium on my laptop. I am using Debian Testing, kernel
6.10.11-amd64. So far, I've tried quite a variety of apps :
zulip-desktop, signal-desktop, VS Code / Codium, Biwarden Directory
Connector, discord, etc, all are failing with the same symptoms : on
app startup, the window is displayed blank, then crash.

I was able to find this trace in logs (this was a zulip startup but
all other tested app generate very similar output) :

qay kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
qay kernel: #PF: supervisor read access in kernel mode
qay kernel: #PF: error_code(0x0000) - not-present page
qay kernel: PGD 0 P4D 0
qay kernel: Oops: Oops: 0000 [#3] PREEMPT SMP PTI
qay kernel: CPU: 11 PID: 35515 Comm: zulip Tainted: G      D
6.10.11-amd64 #1  Debian 6.10.11-1
qay kernel: Hardware name: Dell Inc. XPS 15 9570/0D0T05, BIOS 1.31.0 03/13/=
2023
qay kernel: RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
qay kernel: Code: 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc cc cc cc 66 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44
00 00 <48> 8b 07 48 8b 40 58 48 85 c0 74 06 ff e0 cc 66 90 cc 31 c0 c3
cc
qay kernel: RSP: 0018:ffffa9f206d0fcd8 EFLAGS: 00010246
qay kernel: RAX: ffff95c9c0f2c000 RBX: ffffa9f206d0fdb0 RCX: ffff95c9d4e6c8=
00
qay kernel: RDX: ffff95cb9df26800 RSI: ffff95c9c237c0c8 RDI: 00000000000000=
00
qay kernel: RBP: ffff95cade908600 R08: 000000000000000d R09: 00000000000000=
00
qay kernel: R10: 0000000000000010 R11: 0000000000000000 R12: ffffffffc0e190=
b0
qay kernel: R13: ffffa9f206d0fdb0 R14: ffff95c9d62ba800 R15: 00000000000000=
10
qay kernel: FS:  00007f1d1a272240(0000) GS:ffff95cd2c780000(0000)
knlGS:0000000000000000
qay kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
qay kernel: CR2: 0000000000000000 CR3: 000000020ac94006 CR4: 00000000003706=
f0
qay kernel: Call Trace:
qay kernel:  <TASK>
qay kernel:  ? __die+0x23/0x70
qay kernel:  ? page_fault_oops+0x173/0x5a0
qay kernel:  ? exc_page_fault+0x7e/0x180
qay kernel:  ? asm_exc_page_fault+0x26/0x30
qay kernel:  ? __pfx_nouveau_abi16_ioctl_getparam+0x10/0x10 [nouveau]
qay kernel:  ? nvkm_gr_units+0x9/0x30 [nouveau]
qay kernel:  ? tomoyo_init_request_info+0x99/0xc0
qay kernel:  nouveau_abi16_ioctl_getparam+0x298/0x340 [nouveau]
qay kernel:  ? drm_dev_enter+0x1d/0x60 [drm]
qay kernel:  drm_ioctl_kernel+0xb2/0x110 [drm]
qay kernel:  drm_ioctl+0x274/0x4e0 [drm]
qay kernel:  ? __pfx_nouveau_abi16_ioctl_getparam+0x10/0x10 [nouveau]
qay kernel:  nouveau_drm_ioctl+0x5a/0xb0 [nouveau]
qay kernel:  __x64_sys_ioctl+0x94/0xd0
qay kernel:  do_syscall_64+0x82/0x190
qay kernel:  ? do_syscall_64+0x8e/0x190
qay kernel:  ? syscall_exit_to_user_mode+0x77/0x210
qay kernel:  ? do_syscall_64+0x8e/0x190
qay kernel:  ? exc_page_fault+0x7e/0x180
qay kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
qay kernel: RIP: 0033:0x7f1d25c654bb
qay kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00
00
qay kernel: RSP: 002b:00007ffe016d3000 EFLAGS: 00000246
ORIG_RAX:0000000000000010
qay kernel: RAX: ffffffffffffffda RBX: 00002d940005d200 RCX: 00007f1d25c654=
bb
qay kernel: RDX: 00007ffe016d30b0 RSI: 00000000c0106440 RDI: 00000000000000=
13
qay kernel: RBP: 00007ffe016d30b0 R08: 0000000000001c8c R09: 00001028087c00=
00
qay kernel: R10: 000000000000007c R11: 0000000000000246 R12: 00000000c01064=
40
qay kernel: R13: 0000000000000013 R14: 00002d9400030be0 R15: 00000000000000=
07
qay kernel:  </TASK>
qay kernel: Modules linked in: tls uinput xt_nat xt_tcpudp veth
wireguard libchacha20poly1305 chacha_x86_64 poly1305_x86_64
curve25519_x86_64 libcurve25519_generic libchacha ip6_udp_tunnel
udp_tunnel snd_seq_dummy snd_hrtimer snd_seq snd_seq_device
typec_displayport xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat
bridge stp llc nf_conntrack_netlink nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat nf_tables
libcrc32c overlay ccm algif_aead crypto_null des3_ede_x86_64
des_generic libdes md4 qrtr rfcomm cmac algif_hash algif_skcipher
af_alg bnep binfmt_misc nls_ascii nls_cp437 vfat snd_sof_pci_intel_cnl
fat snd_sof_intel_hda_generic soundwire_intel
soundwire_generic_allocation soundwire_cadence
snd_sof_intel_hda_common snd_sof_intel_hda_mlink snd_sof_intel_hda
snd_sof_pci snd_sof_xtensa_dsp intel_uncore_frequency
intel_uncore_frequency_common snd_sof snd_sof_utils soundwire_bus
snd_soc_avs snd_hda_codec_hdmi snd_soc_hda_codec snd_soc_skl
snd_soc_hdac_hda x86_pkg_temp_thermal
qay kernel:  snd_hda_ext_core ath10k_pci intel_powerclamp
snd_soc_sst_ipc snd_soc_sst_dsp coretemp snd_soc_acpi_intel_match
ath10k_core snd_soc_acpi kvm_intel snd_ctl_led snd_soc_core
snd_hda_codec_realtek ath snd_hda_codec_generic mac80211 snd_compress
snd_pcm_dmaengine dell_laptop kvm snd_hda_scodec_component mei_wdt
mei_pxp mei_hdcp intel_rapl_msr btusb snd_hda_intel uvcvideo
snd_intel_dspcfg btrtl snd_intel_sdw_acpi btintel snd_hda_codec
videobuf2_vmalloc btbcm rapl uvc libarc4 btmtk videobuf2_memops
intel_cstate dell_wmi dell_smm_hwmon videobuf2_v4l2 intel_uncore
cfg80211 dell_smbios bluetooth videodev snd_hda_core dcdbas pcspkr
snd_hwdep dell_wmi_sysman snd_pcm firmware_attributes_class
intel_wmi_thunderbolt dell_wmi_descriptor videobuf2_common wmi_bmof
iTCO_wdt processor_thermal_device_pci_legacy ee1004 snd_timer mc
processor_thermal_device intel_pmc_bxt processor_thermal_wt_hint snd
cdc_acm iTCO_vendor_support watchdog processor_thermal_rfim soundcore
rfkill processor_thermal_rapl ucsi_acpi mei_me typec_ucsi
qay kernel:  intel_rapl_common processor_thermal_wt_req
processor_thermal_power_floor typec mei processor_thermal_mbox
intel_soc_dts_iosf roles intel_pch_thermal int3403_thermal
int340x_thermal_zone intel_pmc_core intel_vsec dell_smo8800
int3400_thermal intel_hid pmt_telemetry ac pmt_class acpi_thermal_rel
acpi_pad sparse_keymap joydev evdev serio_raw pkcs8_key_parser msr
parport_pc ppdev lp parport efi_pstore configfs nfnetlink efivarfs
ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic
dm_crypt dm_mod hid_logitech_hidpp hid_logitech_dj r8153_ecm cdc_ether
usbnet r8152 mii libphy usbhid i915 nouveau drm_gpuvm hid_multitouch
drm_exec hid_generic gpu_sched drm_buddy i2c_algo_bit
drm_display_helper ahci nvme libahci crc32_pclmul crc32c_intel
nvme_core cec t10_pi libata rc_core drm_ttm_helper
crc64_rocksoft_generic ttm i2c_hid_acpi rtsx_pci_sdmmc crc64_rocksoft
i2c_hid ghash_clmulni_intel xhci_pci crc_t10dif drm_kms_helper
scsi_mod xhci_hcd mmc_core hid crct10dif_generic intel_lpss_pci
crct10dif_pclmul
qay kernel:  i2c_i801 sha512_ssse3 intel_lpss crc64 psmouse
thunderbolt drm sha256_ssse3 usbcore mxm_wmi sha1_ssse3 rtsx_pci
i2c_smbus crct10dif_common video idma64 scsi_common usb_common battery
wmi button aesni_intel crypto_simd cryptd
qay kernel: CR2: 0000000000000000
qay kernel: ---[ end trace 0000000000000000 ]---
qay kernel: i915 0000:00:02.0: [drm] *ERROR* Atomic update failure on
pipe A (start=3D83087 end=3D83091) time 73381 us, min 1073, max 1079,
scanline start 1140, end 457
qay kernel: i915 0000:00:02.0: [drm] *ERROR* Atomic update failure on
pipe A (start=3D83099 end=3D83103) time 72413 us, min 1073, max 1079,
scanline start 1135, end 386
qay kernel: RIP: 0010:nvkm_gr_units+0x9/0x30 [nouveau]
qay kernel: Code: 74 06 ff e0 cc 66 90 cc 31 c0 c3 cc cc cc cc 66 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44
00 00 <48> 8b 07 48 8b 40 58 48 85 c0 74 06 ff e0 cc 66 90 cc 31 c0 c3
cc
qay kernel: RSP: 0018:ffffa9f2173c39f0 EFLAGS: 00010246
qay kernel: RAX: ffff95c9c0f2c000 RBX: ffffa9f2173c3ac8 RCX: ffff95c9d4e6c8=
00
qay kernel: RDX: ffff95ca412f9400 RSI: ffff95c9c237c0c8 RDI: 00000000000000=
00
qay kernel: RBP: ffff95caefb36000 R08: 000000000000000d R09: 00000000000000=
00
qay kernel: R10: 0000000000000010 R11: 0000000000000000 R12: ffffffffc0e190=
b0
qay kernel: R13: ffffa9f2173c3ac8 R14: ffff95c9d62ba800 R15: 00000000000000=
10
qay kernel: FS:  00007f1d1a272240(0000) GS:ffff95cd2c780000(0000)
knlGS:0000000000000000
qay kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
qay kernel: CR2: 0000000000000000 CR3: 000000020ac94006 CR4: 00000000003706=
f0
qay kernel: note: zulip[35515] exited with irqs disabled

I can't find a lot of useful informations on the internet, but ended
up stumbling upon this Github issue
:https://github.com/Murmele/Gittyup/issues/783#issuecomment-2232940229.
Author seems to have encountered a very similar issue (albeit on
flatpak apps) and blaming it on Nouveau, which I'm also using.

Is this mailing list the appropriate reporting channel ? I'm happy to
add any required information or set a proper bug report on any
relevant platform as needed.

Thanks.

--=20
Quentin AYMARD
P=C3=B4le SecOps
DSI/RSSI Adjoint
q.aymard@atolcd.com - 03 45 58 26 19
Gevrey-Chambertin / Dijon / Besan=C3=A7on / Paris / Lyon
