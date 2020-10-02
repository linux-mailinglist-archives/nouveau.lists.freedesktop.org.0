Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D450C281FBF
	for <lists+nouveau@lfdr.de>; Sat,  3 Oct 2020 02:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365FC6EA1A;
	Sat,  3 Oct 2020 00:21:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF426E9C3
 for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2020 18:46:36 +0000 (UTC)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dann.frazier@canonical.com>) id 1kOQ4h-0006Gf-2o
 for nouveau@lists.freedesktop.org; Fri, 02 Oct 2020 18:46:35 +0000
Received: by mail-wm1-f71.google.com with SMTP id 73so777843wma.5
 for <nouveau@lists.freedesktop.org>; Fri, 02 Oct 2020 11:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Jf3n0rPRFEpE5/OYrnQZaCFvLpESoMlzuwuIBP6WRrE=;
 b=HY0CSgeBHqKVVvjxHguN8nxSfjM4RE+vB5S5yRT/EzoFKjljLLODlEPcByYJ9VgQsV
 sISoRDlSEoMyND9g4iZUUpjYNeETkNFfTIBMJwbdlYYWJ3sIRkXX5OFLYwDXRXdUi9HY
 t+oBdZspI/iMMOey4ntm9B7W8s7o6HXje5blprpS4tSaG5Jza/W70RZjk+vpwBGCMvQw
 044KUbeW53hq9L/+rpepINNOND3sGXwZwZXM1cisaZecGEAUwPmfxBLwhdtUSZEtbRg+
 jDf1SMyeScdNOSC1sXQa39vwC1CY9jJNsUkGHmIZA6tAoK+5qXlKByotQeYbOwZg9C1s
 90zQ==
X-Gm-Message-State: AOAM530LHt8EpfhAlpY51z3tkJQcgVZ0P+pnRXDYsaemd6RnVIgrTCik
 Jy+Xf8L3A8wWoo5Nejwz6bk4lcVHvdcmWOsByhbpJn6hWF6orkvpUrdIzwaR3Qxcub3iHk/L3tO
 oCSwOpVQOP/VPY6ABODQUkrf8OB1j0C+MOpUek4IyhEt6tnQ6CywhB5P9vPA=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr4284961wrm.147.1601664393337; 
 Fri, 02 Oct 2020 11:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4OwAgfjdglWIPEZpDVm8zed3uvcZDxqpRrJIeWF6USRobt9OTJN7EULVK4GFWvR7O0gUgknWyoeDkVl1Mzos=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr4284938wrm.147.1601664392995; 
 Fri, 02 Oct 2020 11:46:32 -0700 (PDT)
MIME-Version: 1.0
From: dann frazier <dann.frazier@canonical.com>
Date: Fri, 2 Oct 2020 12:46:22 -0600
Message-ID: <CALdTtntb20W92Z=HS1K8Upj7+9Yu4f2MP=F0GcFXhX-3_N4bdg@mail.gmail.com>
To: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Sat, 03 Oct 2020 00:21:43 +0000
Subject: [Nouveau] 5.9-rc7 oops in nvkm_udevice_info() w/ GA100
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

hey,
  I'm seeing an Oops when nouveau loads (see below). I've verified
that this is because both device->chip and device->name are NULL prior
to the strncpy()s at the end of nvkm_udevice_info(). Bisect shows that
this started happening after:

commit 24d5ff40a732633dceab68c6559ba723784f4a68
Author: Karol Herbst <kherbst@redhat.com>
Date: Tue Apr 28 18:54:02 2020 +0200

    drm/nouveau/device: rework mmio mapping code to get rid of second map

    Fixes warnings on GPUs with smaller a smaller mmio region like vGPUs.

    Signed-off-by: Karol Herbst <kherbst@redhat.com>
    Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

[ 213.131657] nouveau 0000:07:00.0: unknown chipset (170000a1)
[ 213.138547] nouveau 0000:07:00.0: unknown chipset (170000a1)
[ 213.144938] BUG: kernel NULL pointer dereference, address: 0000000000000000
[ 213.152704] #PF: supervisor read access in kernel mode
[ 213.158433] #PF: error_code(0x0000) - not-present page
[ 213.164162] PGD 0 P4D 0
[ 213.166985] Oops: 0000 [#1] SMP NOPTI
[ 213.171068] CPU: 32 PID: 206 Comm: kworker/32:0 Not tainted 5.9.0-rc7+ #1
[ 213.178639] Hardware name: NVIDIA DGXA100
920-23687-2530-000/DGXA100, BIOS 0.25 06/30/2020
[ 213.187866] Workqueue: events work_for_cpu_fn
[ 213.192761] RIP: 0010:nvkm_udevice_mthd+0x1ed/0x7d0 [nouveau]
[ 213.199170] Code: 10 49 89 47 08 4d 85 c9 74 10 48 85 c0 74 0b 41 8b
51 70 48 29 d0 49 89 47 10 49 8b 86 c0 00 00 00 49 8d 7f 18 ba 10 00
00 00 <48> 8b 30 e8 6b 91 89 c0 49 8b 76 28 49 8d 7f 28 ba 40 00 00 00
e8
[ 213.220121] RSP: 0018:ffffae0619d47b48 EFLAGS: 00010246
[ 213.225948] RAX: 0000000000000000 RBX: ffff9cefab819580 RCX: 00000000000000c6
[ 213.233907] RDX: 0000000000000010 RSI: 0000000000000000 RDI: ffff9cef988f0578
[ 213.241864] RBP: ffffae0619d47b80 R08: 0000000000000000 R09: 0000000000000000
[ 213.249813] R10: 0000000000000088 R11: 0000000001320122 R12: 0000000000000000
[ 213.257762] R13: 0000000000000068 R14: ffff9cef6107c400 R15: ffff9cef988f0560
[ 213.265721] FS: 0000000000000000(0000) GS:ffff9cefce000000(0000)
knlGS:0000000000000000
[ 213.274747] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 213.281153] CR2: 0000000000000000 CR3: 0000007f3019c000 CR4: 0000000000350ee0
[ 213.289104] Call Trace:
[ 213.291854] ? nvkm_object_insert+0x6f/0x80 [nouveau]
[ 213.297509] nvkm_object_mthd+0x1a/0x30 [nouveau]
[ 213.302773] nvkm_ioctl_mthd+0x65/0x70 [nouveau]
[ 213.307940] nvkm_ioctl+0xf0/0x190 [nouveau]
[ 213.312735] nvkm_client_ioctl+0x12/0x20 [nouveau]
[ 213.318097] nvif_object_ioctl+0x4f/0x60 [nouveau]
[ 213.323460] nvif_object_mthd+0x9f/0x150 [nouveau]
[ 213.328822] ? nvif_object_ctor+0x14b/0x1d0 [nouveau]
[ 213.334473] nvif_device_ctor+0x61/0x70 [nouveau]
[ 213.339749] nouveau_cli_init+0x1a3/0x460 [nouveau]
[ 213.345215] ? nouveau_drm_device_init+0x3e/0x780 [nouveau]
[ 213.351454] nouveau_drm_device_init+0x77/0x780 [nouveau]
[ 213.357479] ? pci_read_config_word+0x27/0x40
[ 213.362337] ? pci_enable_device_flags+0x14f/0x170
[ 213.367705] nouveau_drm_probe+0x132/0x1f0 [nouveau]
[ 213.373241] local_pci_probe+0x48/0x80
[ 213.377419] work_for_cpu_fn+0x1a/0x30
[ 213.381598] process_one_work+0x1e8/0x3b0
[ 213.386068] worker_thread+0x53/0x420
[ 213.390149] kthread+0x12f/0x150
[ 213.393745] ? process_one_work+0x3b0/0x3b0
[ 213.398406] ? __kthread_bind_mask+0x70/0x70
[ 213.403169] ret_from_fork+0x22/0x30
[ 213.407153] Modules linked in: nouveau(+) mxm_wmi wmi video
nls_iso8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua
amd64_edac_mod edac_mce_amd amd_energy kvm_amd kvm rapl efi_pstore
ipmi_ssif input_leds cdc_ether usbnet mii ccp k10temp acpi_ipmi
ipmi_si ipmi_devintf ipmi_msghandler mac_hid sch_fq_codel ip_tables
x_tables autofs4 btrfs blake2b_generic raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor
raid6_pq libcrc32c raid1 raid0 multipath linear mlx5_ib ses enclosure
hid_generic usbhid uas hid usb_storage ib_uverbs ib_core
crct10dif_pclmul crc32_pclmul ast ghash_clmulni_intel drm_vram_helper
aesni_intel drm_ttm_helper crypto_simd ttm cryptd drm_kms_helper
glue_helper syscopyarea sysfillrect sysimgblt mlx5_core fb_sys_fops
pci_hyperv_intf igb cec mpt3sas dca rc_core raid_class nvme tls
i2c_algo_bit scsi_transport_sas drm mlxfw xhci_pci nvme_core
xhci_pci_renesas i2c_piix4
[ 213.497060] CR2: 0000000000000000
[ 213.500755] ---[ end trace eed3a19f1f25ca74 ]---
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
