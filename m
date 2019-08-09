Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24D880FC
	for <lists+nouveau@lfdr.de>; Fri,  9 Aug 2019 19:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD06A6EE6A;
	Fri,  9 Aug 2019 17:12:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E30176EE6C
 for <nouveau@lists.freedesktop.org>; Fri,  9 Aug 2019 17:12:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFC3172167; Fri,  9 Aug 2019 17:12:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 09 Aug 2019 17:12:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: auxsvr@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108857-8800-WKp4SLorWf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108857-8800@http.bugs.freedesktop.org/>
References: <bug-108857-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 108857] display becomes unresponsive and keyboard
 input fails
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2110022451=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2110022451==
Content-Type: multipart/alternative; boundary="15653707771.eE9de4A.29426"
Content-Transfer-Encoding: 7bit


--15653707771.eE9de4A.29426
Date: Fri, 9 Aug 2019 17:12:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108857

--- Comment #9 from auxsvr@gmail.com ---
Similar issue on linux 5.1.16, using a GeForce 6600:

Aug 09 19:50:32 kernel: nouveau 0000:01:00.0: timeout
Aug 09 19:50:32 kernel: WARNING: CPU: 0 PID: 4369 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.c:88 nv41_vmm_flush+0xbc/0x=
c0
[nouveau]
Aug 09 19:50:32 kernel: Modules linked in: i2c_dev nouveau mxm_wmi wmi video
ttm drm_kms_helper drm fb_sys_fops syscopyarea sysfillrect sysimgblt
i2c_algo_bit af_packet xt_recent xt_comment arptabl
e_filter arp_tables ipt_REJECT nf_reject_ipv4 xt_addrtype br_netfilter
xt_physdev iptable_nat xt_mark iptable_mangle xt_tcpudp xt_CT iptable_raw
xt_multiport xt_conntrack nfnetlink_log xt_NFLOG nf_
log_ipv4 nf_log_common xt_LOG nf_conntrack_sane nf_conntrack_netlink nfnetl=
ink
nf_nat_tftp nf_nat_snmp_basic nf_conntrack_snmp nf_nat_sip nf_nat_pptp
nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda
 nf_nat nf_conntrack_tftp nf_conntrack_sip nf_conntrack_pptp
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp ts_kmp nf_conntrack_amanda nf_conntra
ck nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ip_tables x_tables bpfilter
bridge stp llc hwmon_vid xfs joydev snd_hda_codec_realtek snd_hda_codec_gen=
eric
ledtrig_audio snd_hda_intel snd_hda_codec
 iTCO_wdt iTCO_vendor_support
Aug 09 19:50:32 kernel:  snd_hda_core snd_hwdep snd_pcm_oss snd_pcm kvm_int=
el
kvm irqbypass snd_seq snd_seq_device snd_timer pcspkr i2c_i801 snd_mixer_oss
snd asus_atk0110 via_rhine mii atl1e sound
core lpc_ich pcc_cpufreq acpi_cpufreq arc4 ppp_mppe hid_generic usbhid btrfs
libcrc32c xor ata_generic raid6_pq serio_raw sr_mod cdrom firewire_ohci
firewire_core crc_itu_t pata_marvell ehci_pci uh
ci_hcd ehci_hcd usbcore button fan thermal dm_mirror dm_region_hash dm_log
l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunnel pppox coretemp ms=
r sg
ppp_generic slhc nbd dm_multipath dm_mod s
csi_dh_rdac scsi_dh_emc scsi_dh_alua lp parport fuse
Aug 09 19:50:32 kernel: CPU: 0 PID: 4369 Comm: chrome Tainted: G        W=
=20=20=20=20=20=20
  5.1.16-1-default #1 openSUSE Tumbleweed (unreleased)
Aug 09 19:50:32 kernel: Hardware name: System manufacturer P5QC/P5QC, BIOS =
2103
   04/27/2009
Aug 09 19:50:32 kernel: RIP: 0010:nv41_vmm_flush+0xbc/0xc0 [nouveau]
Aug 09 19:50:32 kernel: Code: 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 04 =
4c
8b 67 10 e8 e6 90 a5 f0 4c 89 e2 48 c7 c7 d8 8a d2 c0 48 89 c6 e8 e3 21 4d =
f0
<0f> 0b eb a9 66 66 66 66 90 ff 74 24 18=20
49 89 cb 40 0f b6 ce 48 89
Aug 09 19:50:32 kernel: RSP: 0018:ffffa825832af650 EFLAGS: 00010282
Aug 09 19:50:32 kernel: RAX: 000000000000001d RBX: ffff9b50e2a58c00 RCX:
0000000000000006
Aug 09 19:50:32 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff9b50e7a16a50
Aug 09 19:50:32 kernel: RBP: ffff9b50e288c820 R08: 0000000000000451 R09:
0000000000000001
Aug 09 19:50:32 kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9b4fdeed32c0
Aug 09 19:50:32 kernel: R13: ffff9b50e1604220 R14: 0000000000000000 R15:
ffff9b50b9ac2100
Aug 09 19:50:32 kernel: FS:  00007f1b5b6a8b40(0000) GS:ffff9b50e7a00000(000=
0)
knlGS:0000000000000000
Aug 09 19:50:32 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 09 19:50:32 kernel: CR2: 00007f1b4060a010 CR3: 000000012bc50000 CR4:
00000000000406f0
Aug 09 19:50:32 kernel: Call Trace:
Aug 09 19:50:32 kernel:  nvkm_vmm_iter.constprop.0+0x307/0x790 [nouveau]
Aug 09 19:50:32 kernel:  ? kmem_cache_alloc_trace+0x22c/0x240
Aug 09 19:50:32 kernel:  ? nvkm_mem_new_type+0x280/0x2d0 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_vmm_map+0x136/0x360 [nouveau]
Aug 09 19:50:32 kernel:  ? nv04_vmm_new+0xd0/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_mem_map_dma+0x48/0x50 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_uvmm_mthd+0x657/0x770 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
Aug 09 19:50:32 kernel:  nvif_object_mthd+0x104/0x130 [nouveau]
Aug 09 19:50:32 kernel:  ? cap_inode_getsecurity+0x200/0x200
Aug 09 19:50:32 kernel:  nvif_vmm_map+0x115/0x130 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_mem_host+0xf9/0x190 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_mem_map+0x79/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  nv04_sgdma_bind+0x3e/0x60 [nouveau]
Aug 09 19:50:32 kernel:  ttm_tt_bind+0x32/0x60 [ttm]
Aug 09 19:50:32 kernel:  ttm_bo_handle_move_mem+0x25f/0x4f0 [ttm]
Aug 09 19:50:32 kernel:  ? add_hole+0xe6/0x120 [drm]
Aug 09 19:50:32 kernel:  ttm_bo_validate+0xf1/0x110 [ttm]
Aug 09 19:50:32 kernel:  ? drm_vma_offset_add+0x46/0x50 [drm]
Aug 09 19:50:32 kernel:  ttm_bo_init_reserved+0x32b/0x390 [ttm]
Aug 09 19:50:32 kernel:  ttm_bo_init+0x57/0xc0 [ttm]
Aug 09 19:50:32 kernel:  ? nv10_bo_put_tile_region+0x50/0x50 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_bo_new+0x3e9/0x580 [nouveau]
Aug 09 19:50:32 kernel:  ? nv10_bo_put_tile_region+0x50/0x50 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_gem_new+0x44/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_gem_ioctl_new+0x43/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  drm_ioctl_kernel+0x86/0xd0 [drm]
Aug 09 19:50:32 kernel:  drm_ioctl+0x1f7/0x390 [drm]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  ? do_fault+0x38c/0x640
Aug 09 19:50:32 kernel:  nouveau_drm_ioctl+0x63/0xb0 [nouveau]
Aug 09 19:50:32 kernel:  do_vfs_ioctl+0x447/0x640
Aug 09 19:50:32 kernel:  ? handle_mm_fault+0xf4/0x240
Aug 09 19:50:32 kernel:  ksys_ioctl+0x5e/0x90
Aug 09 19:50:32 kernel:  __x64_sys_ioctl+0x16/0x20
Aug 09 19:50:32 kernel:  do_syscall_64+0x60/0x120
Aug 09 19:50:32 kernel:  entry_SYSCALL_64_after_hwframe+0x49/0xbe
Aug 09 19:50:32 kernel: RIP: 0033:0x7f1b54fae587
Aug 09 19:50:32 kernel: Code: b3 66 90 48 8b 05 11 49 2c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e1 48 2c 00 f7 d8 64 89 01 48
Aug 09 19:50:32 kernel: RSP: 002b:00007ffe59ffc1a8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
Aug 09 19:50:32 kernel: RAX: ffffffffffffffda RBX: 00001f1c14d21000 RCX:
00007f1b54fae587
Aug 09 19:50:32 kernel: RDX: 00007ffe59ffc200 RSI: 00000000c0306480 RDI:
0000000000000010
Aug 09 19:50:32 kernel: RBP: 00007ffe59ffc200 R08: 0000000000000004 R09:
00001f1c157b67e0
Aug 09 19:50:32 kernel: R10: 00001f1c15e42400 R11: 0000000000000246 R12:
00000000c0306480
Aug 09 19:50:32 kernel: R13: 0000000000000010 R14: 00001f1c157b67e0 R15:
00001f1c137a5840
Aug 09 19:50:32 kernel: ---[ end trace 56ed1836d01f756f ]---

Certain actions reproduce it fairly often. It has occurred playing video,
opening marble and scrolling in Chrome.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653707771.eE9de4A.29426
Date: Fri, 9 Aug 2019 17:12:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857">bug 10885=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
auxsvr&#64;gmail.com" title=3D"auxsvr&#64;gmail.com">auxsvr&#64;gmail.com</=
a>
</span></b>
        <pre>Similar issue on linux 5.1.16, using a GeForce 6600:

Aug 09 19:50:32 kernel: nouveau 0000:01:00.0: timeout
Aug 09 19:50:32 kernel: WARNING: CPU: 0 PID: 4369 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.c:88 nv41_vmm_flush+0xbc/0x=
c0
[nouveau]
Aug 09 19:50:32 kernel: Modules linked in: i2c_dev nouveau mxm_wmi wmi video
ttm drm_kms_helper drm fb_sys_fops syscopyarea sysfillrect sysimgblt
i2c_algo_bit af_packet xt_recent xt_comment arptabl
e_filter arp_tables ipt_REJECT nf_reject_ipv4 xt_addrtype br_netfilter
xt_physdev iptable_nat xt_mark iptable_mangle xt_tcpudp xt_CT iptable_raw
xt_multiport xt_conntrack nfnetlink_log xt_NFLOG nf_
log_ipv4 nf_log_common xt_LOG nf_conntrack_sane nf_conntrack_netlink nfnetl=
ink
nf_nat_tftp nf_nat_snmp_basic nf_conntrack_snmp nf_nat_sip nf_nat_pptp
nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda
 nf_nat nf_conntrack_tftp nf_conntrack_sip nf_conntrack_pptp
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp ts_kmp nf_conntrack_amanda nf_conntra
ck nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ip_tables x_tables bpfilter
bridge stp llc hwmon_vid xfs joydev snd_hda_codec_realtek snd_hda_codec_gen=
eric
ledtrig_audio snd_hda_intel snd_hda_codec
 iTCO_wdt iTCO_vendor_support
Aug 09 19:50:32 kernel:  snd_hda_core snd_hwdep snd_pcm_oss snd_pcm kvm_int=
el
kvm irqbypass snd_seq snd_seq_device snd_timer pcspkr i2c_i801 snd_mixer_oss
snd asus_atk0110 via_rhine mii atl1e sound
core lpc_ich pcc_cpufreq acpi_cpufreq arc4 ppp_mppe hid_generic usbhid btrfs
libcrc32c xor ata_generic raid6_pq serio_raw sr_mod cdrom firewire_ohci
firewire_core crc_itu_t pata_marvell ehci_pci uh
ci_hcd ehci_hcd usbcore button fan thermal dm_mirror dm_region_hash dm_log
l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunnel pppox coretemp ms=
r sg
ppp_generic slhc nbd dm_multipath dm_mod s
csi_dh_rdac scsi_dh_emc scsi_dh_alua lp parport fuse
Aug 09 19:50:32 kernel: CPU: 0 PID: 4369 Comm: chrome Tainted: G        W=
=20=20=20=20=20=20
  5.1.16-1-default #1 openSUSE Tumbleweed (unreleased)
Aug 09 19:50:32 kernel: Hardware name: System manufacturer P5QC/P5QC, BIOS =
2103
   04/27/2009
Aug 09 19:50:32 kernel: RIP: 0010:nv41_vmm_flush+0xbc/0xc0 [nouveau]
Aug 09 19:50:32 kernel: Code: 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 04 =
4c
8b 67 10 e8 e6 90 a5 f0 4c 89 e2 48 c7 c7 d8 8a d2 c0 48 89 c6 e8 e3 21 4d =
f0
&lt;0f&gt; 0b eb a9 66 66 66 66 90 ff 74 24 18=20
49 89 cb 40 0f b6 ce 48 89
Aug 09 19:50:32 kernel: RSP: 0018:ffffa825832af650 EFLAGS: 00010282
Aug 09 19:50:32 kernel: RAX: 000000000000001d RBX: ffff9b50e2a58c00 RCX:
0000000000000006
Aug 09 19:50:32 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff9b50e7a16a50
Aug 09 19:50:32 kernel: RBP: ffff9b50e288c820 R08: 0000000000000451 R09:
0000000000000001
Aug 09 19:50:32 kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9b4fdeed32c0
Aug 09 19:50:32 kernel: R13: ffff9b50e1604220 R14: 0000000000000000 R15:
ffff9b50b9ac2100
Aug 09 19:50:32 kernel: FS:  00007f1b5b6a8b40(0000) GS:ffff9b50e7a00000(000=
0)
knlGS:0000000000000000
Aug 09 19:50:32 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 09 19:50:32 kernel: CR2: 00007f1b4060a010 CR3: 000000012bc50000 CR4:
00000000000406f0
Aug 09 19:50:32 kernel: Call Trace:
Aug 09 19:50:32 kernel:  nvkm_vmm_iter.constprop.0+0x307/0x790 [nouveau]
Aug 09 19:50:32 kernel:  ? kmem_cache_alloc_trace+0x22c/0x240
Aug 09 19:50:32 kernel:  ? nvkm_mem_new_type+0x280/0x2d0 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_vmm_map+0x136/0x360 [nouveau]
Aug 09 19:50:32 kernel:  ? nv04_vmm_new+0xd0/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_mem_map_dma+0x48/0x50 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_uvmm_mthd+0x657/0x770 [nouveau]
Aug 09 19:50:32 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
Aug 09 19:50:32 kernel:  nvif_object_mthd+0x104/0x130 [nouveau]
Aug 09 19:50:32 kernel:  ? cap_inode_getsecurity+0x200/0x200
Aug 09 19:50:32 kernel:  nvif_vmm_map+0x115/0x130 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_mem_host+0xf9/0x190 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_mem_map+0x79/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  nv04_sgdma_bind+0x3e/0x60 [nouveau]
Aug 09 19:50:32 kernel:  ttm_tt_bind+0x32/0x60 [ttm]
Aug 09 19:50:32 kernel:  ttm_bo_handle_move_mem+0x25f/0x4f0 [ttm]
Aug 09 19:50:32 kernel:  ? add_hole+0xe6/0x120 [drm]
Aug 09 19:50:32 kernel:  ttm_bo_validate+0xf1/0x110 [ttm]
Aug 09 19:50:32 kernel:  ? drm_vma_offset_add+0x46/0x50 [drm]
Aug 09 19:50:32 kernel:  ttm_bo_init_reserved+0x32b/0x390 [ttm]
Aug 09 19:50:32 kernel:  ttm_bo_init+0x57/0xc0 [ttm]
Aug 09 19:50:32 kernel:  ? nv10_bo_put_tile_region+0x50/0x50 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_bo_new+0x3e9/0x580 [nouveau]
Aug 09 19:50:32 kernel:  ? nv10_bo_put_tile_region+0x50/0x50 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_gem_new+0x44/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  nouveau_gem_ioctl_new+0x43/0xd0 [nouveau]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  drm_ioctl_kernel+0x86/0xd0 [drm]
Aug 09 19:50:32 kernel:  drm_ioctl+0x1f7/0x390 [drm]
Aug 09 19:50:32 kernel:  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
Aug 09 19:50:32 kernel:  ? do_fault+0x38c/0x640
Aug 09 19:50:32 kernel:  nouveau_drm_ioctl+0x63/0xb0 [nouveau]
Aug 09 19:50:32 kernel:  do_vfs_ioctl+0x447/0x640
Aug 09 19:50:32 kernel:  ? handle_mm_fault+0xf4/0x240
Aug 09 19:50:32 kernel:  ksys_ioctl+0x5e/0x90
Aug 09 19:50:32 kernel:  __x64_sys_ioctl+0x16/0x20
Aug 09 19:50:32 kernel:  do_syscall_64+0x60/0x120
Aug 09 19:50:32 kernel:  entry_SYSCALL_64_after_hwframe+0x49/0xbe
Aug 09 19:50:32 kernel: RIP: 0033:0x7f1b54fae587
Aug 09 19:50:32 kernel: Code: b3 66 90 48 8b 05 11 49 2c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d e1 48 2c 00 f7 d8 64 89 01 48
Aug 09 19:50:32 kernel: RSP: 002b:00007ffe59ffc1a8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
Aug 09 19:50:32 kernel: RAX: ffffffffffffffda RBX: 00001f1c14d21000 RCX:
00007f1b54fae587
Aug 09 19:50:32 kernel: RDX: 00007ffe59ffc200 RSI: 00000000c0306480 RDI:
0000000000000010
Aug 09 19:50:32 kernel: RBP: 00007ffe59ffc200 R08: 0000000000000004 R09:
00001f1c157b67e0
Aug 09 19:50:32 kernel: R10: 00001f1c15e42400 R11: 0000000000000246 R12:
00000000c0306480
Aug 09 19:50:32 kernel: R13: 0000000000000010 R14: 00001f1c157b67e0 R15:
00001f1c137a5840
Aug 09 19:50:32 kernel: ---[ end trace 56ed1836d01f756f ]---

Certain actions reproduce it fairly often. It has occurred playing video,
opening marble and scrolling in Chrome.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653707771.eE9de4A.29426--

--===============2110022451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2110022451==--
