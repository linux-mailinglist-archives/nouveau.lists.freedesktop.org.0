Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183261C4CC7
	for <lists+nouveau@lfdr.de>; Tue,  5 May 2020 05:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C886E11F;
	Tue,  5 May 2020 03:59:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0C96E11F
 for <nouveau@lists.freedesktop.org>; Tue,  5 May 2020 03:59:35 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id j1so153621vkc.2
 for <nouveau@lists.freedesktop.org>; Mon, 04 May 2020 20:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RAFZlmuFMOZy1hH4FWr2oKGRPwtgs3uGEcfPfcrt+IM=;
 b=crrHXb/9uTCHbpitQFTCfez6MTnJ5PBiIfJRT5hURjTUrY7s0YzKZCyt4g1iWLSF0W
 kv+WkBTFKbfodNYdr4MX2ApBFpIcVOLNk9DfDPYv9iedAKOt6SkRIU35gF+B2xLeOQbD
 eYV2Pw9HLWswuqfHA54U/n8Jl09iVhcwpucRUoPkuO+ue6qsHdkyBXxJ8PgdsUwTWeIk
 uGRfALOEUlSv7w+0iN7rrbcZjSx7vESg9wGhNFWBgrvU36WfaxugKz/f0Rg7pVlhUjAc
 kBoePu5IuTtjzPCmzd1VyhRNPPC9fD3Z3WTwe7p+qbYwujVPLwupOZ2abMTuFlE/D9WF
 hYJw==
X-Gm-Message-State: AGi0PuYoAYiL/zx0zblhPHFwd8UrpQD30XV2X4HrLvsvFvW+3eZpe6Ts
 wXyMzGPmYcabVhkQzWe/imcs5T3u5qva3JLO/94=
X-Google-Smtp-Source: APiQypInRhYE498VXC0MGqMNkKiV6oBhN47qbvvDyX8UqnugxpMfRPsGUKdWzqmRe2j9V9bLdD4T3l3AleEPMjHfzkA=
X-Received: by 2002:a1f:cd06:: with SMTP id d6mr857946vkg.94.1588651174382;
 Mon, 04 May 2020 20:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
In-Reply-To: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 4 May 2020 23:59:23 -0400
Message-ID: <CAKb7UvguvnBnauKhcc4CPoZE=vRzj46JWKQDND=MBJZ89p13vg@mail.gmail.com>
To: Alberto Sentieri <22t@tripolho.com>
Subject: Re: [Nouveau] problems with NVS310
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The warning you included happens when we're trying to execute a VBIOS
script as part of DP training. Can you include your vbios? It should
be available at /sys/kernel/debug/dri/0/vbios.rom

Also, can you confirm how your monitors are connected to the card (and
e.g. what resolution they are, anything else "funny" about them)?

Finally, this warning might not have anything to do with the hang. It
doesn't sound like you're changing modes or plugging/unplugging
monitors when this happens... anyways, I guess GNOME3 and Firefox are
both making much heavier use of 3d accel, which provides more
opportunities for things to go wrong. However the log you provided
does not appear to be an indication of that.

Cheers,

  -ilia

On Mon, May 4, 2020 at 11:47 PM Alberto Sentieri <22t@tripolho.com> wrote:
>
> I have a Nvidia NVS310 installed in my Linux computer for a few years.
> It works well with the Nvidia driver, and not so well with the Linux
> nouveau driver. The Nvidia NVS310 has never worked well with Linux. In
> the beginning (many years ago) I decided to install Nvidia proprietary
> drivers, but every kernel upgrade would require an additional effort to
> have the driver working. That was enough for me to try the standard
> non-proprietary driver again.
>
> Lately, with Debian stretch (and Mate), things got sort of stable with
> the nouveau driver, and I was getting one frozen screen every few
> months, which was kind of acceptable. A couple of weeks ago I upgrade to
> Debian buster (GNOME3) and the nightmare is back: I get a frozen screen
> at leas once a day. A simple F11 pressed on Firefox could cause the
> freeze, but there other things, which I could not determine, that also
> cause the freeze. The freeze is only a graphic freeze, I mean, I can ssh
> into the machine from my laptop, stop all services and shut it down, or
> restart it. But I could not figure out a way of restarting the video
> without a reboot. And every freeze usually means losing something, and
> losing many minutes.
>
> Any suggestions?
>
> Here is dmesg in one of the freezes:
>
> [23664.639186] WARNING: CPU: 3 PID: 7223 at
> drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:172
> init_rdauxr+0xf4/0x130 [nouveau]
> [23664.639187] Modules linked in: nfnetlink cfg80211 fuse rfcomm arc4
> md4 sha512_ssse3 sha512_generic nls_utf8 cifs ccm dns_resolver fscache
> 8021q garp mrp bridge stp llc vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE)
> cmac bnep intel_rapl snd_hda_codec_hdmi btusb btrtl btbcm
> x86_pkg_temp_thermal btintel intel_powerclamp bluetooth nls_ascii
> nls_cp437 coretemp vfat fat kvm_intel jitterentropy_rng kvm
> snd_hda_codec_realtek snd_hda_codec_generic drbg irqbypass
> crct10dif_pclmul ansi_cprng crc32_pclmul snd_hda_intel
> ghash_clmulni_intel joydev ecdh_generic snd_hda_codec intel_cstate
> snd_hda_core efi_pstore snd_hwdep snd_pcm eeepc_wmi asus_wmi snd_timer
> intel_uncore mei_me pcc_cpufreq snd sparse_keymap iTCO_wdt mei
> intel_rapl_perf rfkill efivars wmi_bmof pcspkr soundcore sg
> iTCO_vendor_support evdev firewire_sbp2
> [23664.639207]  parport_pc ppdev lp parport efivarfs ip_tables x_tables
> autofs4 ext4 crc16 mbcache jbd2 crc32c_generic fscrypto ecb
> hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid sr_mod cdrom
> sd_mod nouveau crc32c_intel video i2c_algo_bit mxm_wmi xhci_pci ttm ahci
> xhci_hcd libahci drm_kms_helper ehci_pci aesni_intel ehci_hcd libata
> aes_x86_64 drm crypto_simd usbcore cryptd e1000e glue_helper scsi_mod
> firewire_ohci i2c_i801 firewire_core lpc_ich mfd_core crc_itu_t
> usb_common wmi button
> [23664.639224] CPU: 3 PID: 7223 Comm: kworker/u24:1 Tainted: G
> OE     4.19.0-8-amd64 #1 Debian 4.19.98-1+deb10u1
> [23664.639225] Hardware name: System manufacturer System Product
> Name/P9X79, BIOS 4502 10/15/2013
> [23664.639254] Workqueue: nvkm-disp gf119_disp_super [nouveau]
> [23664.639275] RIP: 0010:init_rdauxr+0xf4/0x130 [nouveau]
> [23664.639276] Code: e1 48 89 ef ba 09 00 00 00 be 01 00 00 00 e8 e3 9c
> 03 00 85 c0 75 27 80 7c 24 0f 01 74 0e 48 c7 c7 10 bf 8e c0 e8 7a b9 b8
> dc <0f> 0b 48 89 ef e8 12 9a 03 00 0f b6 44 24 0e e9 39 ff ff ff 48 89
> [23664.639277] RSP: 0018:ffffa53483adfc08 EFLAGS: 00010246
> [23664.639279] RAX: 0000000000000024 RBX: ffffa53483adfc90 RCX:
> 0000000000000000
> [23664.639280] RDX: 0000000000000000 RSI: ffff9a2bff8d66b8 RDI:
> ffff9a2bff8d66b8
> [23664.639281] RBP: ffff9a2bfb86e800 R08: 0000000000000571 R09:
> 0000000000000007
> [23664.639282] R10: 0000000000000000 R11: ffffffff9e7f46ed R12:
> 0000000000000102
> [23664.639283] R13: ffff9a2bfbbb3b00 R14: 0000000000000020 R15:
> 00000000000000df
> [23664.639284] FS:  0000000000000000(0000) GS:ffff9a2bff8c0000(0000)
> knlGS:0000000000000000
> [23664.639285] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [23664.639286] CR2: 00007f9acaa452c4 CR3: 0000000633e0a002 CR4:
> 00000000000606e0
> [23664.639287] Call Trace:
> [23664.639310]  init_auxch+0xf6/0x180 [nouveau]
> [23664.639331]  nvbios_exec+0x45/0xd0 [nouveau]
> [23664.639359]  nvkm_dp_train_init+0x12e/0x170 [nouveau]
> [23664.639386]  nvkm_dp_acquire+0x1a6/0xcb0 [nouveau]
> [23664.639390]  ? update_blocked_averages+0x77b/0x950
> [23664.639394]  ? __switch_to_asm+0x41/0x70
> [23664.639395]  ? __switch_to_asm+0x41/0x70
> [23664.639397]  ? syscall_return_via_sysret+0x14/0x83
> [23664.639399]  ? __switch_to_asm+0x35/0x70
> [23664.639400]  ? __switch_to_asm+0x41/0x70
> [23664.639402]  ? __switch_to_asm+0x35/0x70
> [23664.639404]  ? __switch_to_asm+0x41/0x70
> [23664.639405]  ? __switch_to_asm+0x35/0x70
> [23664.639407]  ? __switch_to_asm+0x41/0x70
> [23664.639409]  ? __switch_to_asm+0x35/0x70
> [23664.639410]  ? __switch_to_asm+0x41/0x70
> [23664.639412]  ? __switch_to_asm+0x35/0x70
> [23664.639414]  ? __switch_to_asm+0x41/0x70
> [23664.639440]  nv50_disp_super_2_2+0x70/0x4a0 [nouveau]
> [23664.639443]  ? __switch_to_asm+0x35/0x70
> [23664.639444]  ? __switch_to_asm+0x41/0x70
> [23664.639446]  ? __switch_to_asm+0x35/0x70
> [23664.639448]  ? __switch_to_asm+0x41/0x70
> [23664.639449]  ? __switch_to_asm+0x35/0x70
> [23664.639451]  ? __switch_to_asm+0x41/0x70
> [23664.639477]  gf119_disp_super+0x17e/0x2d0 [nouveau]
> [23664.639480]  process_one_work+0x1a7/0x3a0
> [23664.639482]  worker_thread+0x30/0x390
> [23664.639484]  ? create_worker+0x1a0/0x1a0
> [23664.639486]  kthread+0x112/0x130
> [23664.639487]  ? kthread_bind+0x30/0x30
> [23664.639489]  ret_from_fork+0x35/0x40
> [23664.639491] ---[ end trace 4492926f317372bc ]---
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
