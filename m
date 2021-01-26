Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DB304A57
	for <lists+nouveau@lfdr.de>; Tue, 26 Jan 2021 21:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B546E441;
	Tue, 26 Jan 2021 20:43:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F666E441
 for <nouveau@lists.freedesktop.org>; Tue, 26 Jan 2021 20:43:01 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x21so36486894iog.10
 for <nouveau@lists.freedesktop.org>; Tue, 26 Jan 2021 12:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LgLCMPu0nJSE6y2uvne+k9X2RC5VVtHf4sEsitOn5Ug=;
 b=dVW7dXZTd/2x4+nSd0rtwO6lj3K6GdlloBBMPHVf0ok5awUsjeTUfI63/6w43Z8wLz
 wT0mCaF4eNTlp/CHrPWQX88vayfhFQG/6l8GWfVwJHjQkCgz0cV/iEenp3I3w5k3CCPj
 Ew3ZOmXTTUTUyks+xnfDkWTGFHefEq4CEDTAPNfEMiwWDhdpszH93x9ifFk6DtkdxzDW
 7m5M6kIaJ9qxv82cNNuLEUPLs+48Ph1sMJld+YmLeZNJuAqHDMPyCfWvzj7jSy+OHq/s
 K/dbwDgO/GYSMHdn4KDzIhO6vg4i4z/XJyEGhieyajdCuHphhaNfZcBpeNXkYPY4aGur
 JPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LgLCMPu0nJSE6y2uvne+k9X2RC5VVtHf4sEsitOn5Ug=;
 b=mihyqR7lVx2ordwbix00YiihhoBYhp/f7nJw5LYAjSVT2r1Z0kUBspRJp2YK4dPSxY
 LICK8yGwKE9btpZdx3VlMFZdE3nCaYaOzinUi9KExmwGRi+knTVmMKVNpdaivSJTbgei
 mVrOwY0KvJYzY8Fz265AUIR2DFLO+Ck7QYA5TjXMJKN4quIUoB6JGwOziAeLdomFQISj
 aZdzCuXf10MM1bJ9AhD/qd3CDVQCabs4HeLF68IcSpgLjeVc9sg3/Hv0dUIE2Gkmt8cy
 E3aFxXKNOq/l4pkjjW9RoV6azZRE18wRj644MrUGV70xPbmYDOtC3tywW9lOCgpBBVuS
 v5Lg==
X-Gm-Message-State: AOAM531/UMmaNkzmlvtGuJ0E69dcenXRNbtbzXvaKrIjCmEvI8EH4Zfw
 fDkOG0docoFeRh3RX+fiTUOqjWljGhJ7lzFnZm0x2+H7c58=
X-Google-Smtp-Source: ABdhPJy1W6Pd9qXCDBmdTVEN0580qu+5pFTDOEfUuWPAumkjRAfGlT70A6Hsa0TxDzmyi0Tf58OW+1FTHdCZOjFb/4c=
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr5563496ioc.177.1611693781018; 
 Tue, 26 Jan 2021 12:43:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4f:f349:0:0:0:0:0 with HTTP; Tue, 26 Jan 2021 12:43:00
 -0800 (PST)
From: Adam Sulmicki <sulmicki@gmail.com>
Date: Tue, 26 Jan 2021 21:43:00 +0100
Message-ID: <CAGfBNB_897OFjiT6TiJCYinHh7maSuqr6iLpUw4sFgxOAxYgUA@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] dmesg errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello,

I'm getting following messages from nouveau from dmesg during boot.
Should I be concerned or is this normal ?
System :
Dell Optiplex 760
NVIDIA Quadro 2000
AOC Q32279VWFD8

[    6.199615] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    6.206519] Console: switching to colour dummy device 80x25
[    6.206905] nouveau 0000:01:00.0: NVIDIA GF106 (0c3c00a1)
[    6.347687] nouveau 0000:01:00.0: bios: version 70.06.41.00.06
[    6.477645] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
[    7.325627] [TTM] Zone  kernel: Available graphics memory: 1926926 KiB
[    7.325638] [TTM] Initializing pool allocator
[    7.325652] [TTM] Initializing DMA pool allocator
[    7.325685] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    7.325692] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    7.325701] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    7.325708] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    7.325715] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000000
[    7.325723] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00020030
[    7.325730] nouveau 0000:01:00.0: DRM: DCB outp 02: 048113b6 0f220010
[    7.325738] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011372 00020010
[    7.325745] nouveau 0000:01:00.0: DRM: DCB outp 04: 028223a6 0f220010
[    7.325752] nouveau 0000:01:00.0: DRM: DCB outp 05: 02022362 00020010
[    7.325759] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    7.325766] nouveau 0000:01:00.0: DRM: DCB conn 01: 00820146
[    7.325772] nouveau 0000:01:00.0: DRM: DCB conn 02: 00410246
[    7.326686] nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[    7.454864] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb:
0x60000, bo 00000000e8527e3a
[    7.467701] fbcon: nouveaudrmfb (fb0) is primary device
[    7.575847] Console: switching to colour frame buffer device 320x90
[    7.579874] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[    7.593362] [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0


[  114.930202] ------------[ cut here ]------------
[  114.930212] DMA-API: nouveau 0000:01:00.0: device driver tries to
sync DMA memory it has not allocated [device
address=0x0000000040e12000] [size=4096 bytes]
[  114.930230] WARNING: CPU: 0 PID: 1243 at kernel/dma/debug.c:1099
check_sync+0x1e9/0x730
[  114.930232] Modules linked in: xt_CHECKSUM tun bridge stp llc ccm
nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
xt_MASQUERADE nft_fib_inet nft_fib_ipv4 xt_state xt_conntrack
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv6 nft_reject
ipt_REJECT nft_ct nf_reject_ipv4 nft_chain_nat nf_tables nf_nat_h323
nf_conntrack_h323 nf_nat_pptp ebtable_nat nf_conntrack_pptp
ebtable_broute ip6table_nat nf_nat_tftp nf_conntrack_tftp nf_nat_sip
ip6table_mangle nf_conntrack_sip ip6table_raw nf_nat_irc
nf_conntrack_irc ip6table_security nf_nat_ftp nf_conntrack_ftp
iptable_mangle iptable_raw iptable_nat nf_nat iptable_security
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
sunrpc snd_hda_codec_analog snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg soundwire_intel
soundwire_generic_allocation zd1211rw snd_soc_core snd_compress
snd_pcm_dmaengine soundwire_cadence snd_hda_codec
[  114.930316]  mac80211 snd_hda_core ac97_bus snd_hwdep snd_seq
coretemp cfg80211 kvm_intel snd_seq_device snd_pcm gpio_ich kvm rfkill
ppdev snd_timer libarc4 iTCO_wdt snd pcspkr intel_pmc_bxt
iTCO_vendor_support mei_wdt parport_pc soundcore mei_me wmi_bmof
parport at24 mei dell_wmi sparse_keymap dell_smbios dcdbas lpc_ich
dell_wmi_descriptor irqbypass pktcdvd i2c_i801 i2c_smbus acpi_cpufreq
zram ip_tables dm_thin_pool dm_persistent_data dm_bio_prison nouveau
mxm_wmi i2c_algo_bit video ttm drm_kms_helper cec serio_raw drm e1000e
ata_generic pata_acpi wmi fuse
[  114.930390] CPU: 0 PID: 1243 Comm: Xwayland Not tainted
5.10.9-201.fc33.x86_64+debug #1
[  114.930392] Hardware name: Dell Inc. OptiPlex 760
/0M858N, BIOS A16 08/06/2013
[  114.930396] RIP: 0010:check_sync+0x1e9/0x730
[  114.930401] Code: 89 54 24 08 e8 48 d9 72 00 4c 8b 54 24 08 48 89
c6 49 89 e8 4c 89 f1 4c 89 ea 48 c7 c7 a8 02 5d 98 4c 89 14 24 e8 b4
f5 b2 00 <0f> 0b 4c 8b 14 24 8b 05 5b 31 ee 01 85 c0 0f 84 96 04 00 00
48 83
[  114.930404] RSP: 0018:ffffa9fa02c63ae0 EFLAGS: 00010082
[  114.930407] RAX: 0000000000000090 RBX: ffffa9fa02c63b40 RCX: ffff9878931db238
[  114.930409] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff9878931db230
[  114.930412] RBP: 0000000000001000 R08: 0000000000000000 R09: ffffa9fa02c63918
[  114.930414] R10: ffffa9fa02c63910 R11: ffffffff98d63d08 R12: ffffffff9a5afbe0
[  114.930417] R13: ffff98788162fa60 R14: 0000000040e12000 R15: 0000000040e12000
[  114.930420] FS:  00007fcaf32d3a80(0000) GS:ffff987893000000(0000)
knlGS:0000000000000000
[  114.930423] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  114.930425] CR2: 000055f807730f70 CR3: 00000000365a0000 CR4: 00000000000006f0
[  114.930427] Call Trace:
[  114.930439]  debug_dma_sync_single_for_device+0x51/0x60
[  114.930454]  ? ttm_bo_validate+0x4c/0x1a0 [ttm]
[  114.930459]  ? dma_resv_reserve_shared+0x191/0x330
[  114.930463]  ? lock_release+0x1cb/0x3e0
[  114.930548]  nouveau_bo_sync_for_device+0x53/0x70 [nouveau]
[  114.930599]  nouveau_bo_validate+0x58/0x70 [nouveau]
[  114.930649]  nouveau_gem_ioctl_pushbuf+0x734/0x1500 [nouveau]
[  114.930703]  ? nouveau_gem_ioctl_new+0xd0/0xd0 [nouveau]
[  114.930746]  drm_ioctl_kernel+0x8c/0xe0 [drm]
[  114.930766]  drm_ioctl+0x20f/0x3a0 [drm]
[  114.930815]  ? nouveau_gem_ioctl_new+0xd0/0xd0 [nouveau]
[  114.930821]  ? trace_hardirqs_on+0x1b/0xd0
[  114.930870]  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
[  114.930876]  __x64_sys_ioctl+0x83/0xb0
[  114.930881]  do_syscall_64+0x33/0x40
[  114.930886]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  114.930890] RIP: 0033:0x7fcaf3b2b38b
[  114.930894] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c
ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d bd ba 0c 00 f7 d8 64 89
01 48
[  114.930896] RSP: 002b:00007ffc8d9acbd8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  114.930900] RAX: ffffffffffffffda RBX: 00007ffc8d9acc40 RCX: 00007fcaf3b2b38b
[  114.930902] RDX: 00007ffc8d9acc40 RSI: 00000000c0406481 RDI: 000000000000000e
[  114.930905] RBP: 00000000c0406481 R08: 000055f80771d330 R09: 000055f807730f68
[  114.930907] R10: 000055f808038470 R11: 0000000000000246 R12: 000055f80771ff60
[  114.930909] R13: 000000000000000e R14: 000055f80771d070 R15: 000055f80771d330
[  114.930916] irq event stamp: 0
[  114.930919] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[  114.930923] hardirqs last disabled at (0): [<ffffffff970d9b08>]
copy_process+0x718/0x1cc0
[  114.930926] softirqs last  enabled at (0): [<ffffffff970d9b08>]
copy_process+0x718/0x1cc0
[  114.930929] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  114.930931] ---[ end trace cc44c6c67bc5646c ]---
[  122.191193] rfkill: input handler enabled
[  125.110052] nouveau 0000:01:00.0: fifo: read fault at 0000248000
engine 05 [BAR3] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on
channel -1 [003fdf8000 unknown]
[  135.296857] nouveau 0000:01:00.0: fifo: read fault at 0000234000
engine 05 [BAR3] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on
channel -1 [003fdf8000 unknown]
[  149.945527] nouveau 0000:01:00.0: fifo: read fault at 0000232000
engine 05 [BAR3] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on
channel -1 [003fdf8000 unknown]
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
