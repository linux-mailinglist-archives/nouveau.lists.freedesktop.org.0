Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D897818D
	for <lists+nouveau@lfdr.de>; Sun, 28 Jul 2019 22:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3889B00;
	Sun, 28 Jul 2019 20:35:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2B3589AC6
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2019 20:35:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A5F0872167; Sun, 28 Jul 2019 20:35:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 28 Jul 2019 20:35:22 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thiago.frmoraes@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111242-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111242] New: Device driver tries to sync DMA memory
 it has not allocated
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
Content-Type: multipart/mixed; boundary="===============1681454211=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1681454211==
Content-Type: multipart/alternative; boundary="15643461220.184c9b.8895"
Content-Transfer-Encoding: 7bit


--15643461220.184c9b.8895
Date: Sun, 28 Jul 2019 20:35:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111242

            Bug ID: 111242
           Summary: Device driver tries to sync DMA memory it has not
                    allocated
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: thiago.frmoraes@outlook.com
        QA Contact: nouveau@lists.freedesktop.org

Hardware: GeForce GTX 960 (rev a1) - NV126
OS: Fedora Silverblue 31 (Rawhide)
DE: Gnome-Shell 3.33.4

$ journalctl -b -t kernel

jul 28 17:16:25 localhost.localdomain kernel: ------------[ cut here
]------------
jul 28 17:16:25 localhost.localdomain kernel: DMA-API: nouveau 0000:01:00.0:
device driver tries to sync DMA memory it has not allocated [device
address=3D0x00000001d1e12000] [size=3D4096 bytes]
jul 28 17:16:25 localhost.localdomain kernel: WARNING: CPU: 6 PID: 1166 at
kernel/dma/debug.c:1147 check_sync+0x139/0x660
jul 28 17:16:25 localhost.localdomain kernel: Modules linked in:
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_n=
at
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc vfat fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp
snd_hda_codec_realtek snd_hda_codec_hdmi coretemp snd_hda_codec_generic
ledtrig_audio kvm_intel snd_hda_intel snd_hda_codec kvm snd_hda_core irqbyp=
ass
snd_hwdep joydev xpad snd_seq ff_memless snd_seq_device snd_pcm intel_cstate
iTCO_wdt iTCO_vendor_support intel_uncore gpio_ich snd_timer mei_me e1000e =
snd
intel_rapl_perf mei soundcore i2c_i801 lpc_ich nouveau crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel mxm_wmi wmi video i2c_algo_bit
drm_kms_helper
jul 28 17:16:25 localhost.localdomain kernel:  serio_raw ttm drm firewire_o=
hci
firewire_core crc_itu_t fuse
jul 28 17:16:25 localhost.localdomain kernel: CPU: 6 PID: 1166 Comm: Xwayla=
nd
Not tainted 5.3.0-0.rc1.git3.1.fc31.x86_64 #1
jul 28 17:16:25 localhost.localdomain kernel: Hardware name:  /DP67DE, BIOS
BAP6710H.86A.0083.2018.1025.1520 10/25/2018
jul 28 17:16:25 localhost.localdomain kernel: RIP: 0010:check_sync+0x139/0x=
660
jul 28 17:16:25 localhost.localdomain kernel: Code: 04 4d 8b 65 00 4c 89 ef=
 4c
89 04 24 e8 e0 36 5a 00 4c 8b 04 24 48 89 c6 4c 89 f9 4c 89 e2 48 c7 c7 18 =
af
32 bd e8 bf c3 f5 ff <0f> 0b 8b 05 6f 43 79 01 85 c0 0f 84 64 04 00 00 48 8=
3 c4
28 4c 89
jul 28 17:16:25 localhost.localdomain kernel: RSP: 0018:ffffaa2380767a10
EFLAGS: 00010082
jul 28 17:16:25 localhost.localdomain kernel: RAX: 0000000000000000 RBX:
ffffaa2380767a70 RCX: 0000000000000006
jul 28 17:16:25 localhost.localdomain kernel: RDX: 0000000000000007 RSI:
0000000000000000 RDI: ffff8d58171d9d80
jul 28 17:16:25 localhost.localdomain kernel: RBP: ffffffffbeda8c50 R08:
0000000000000001 R09: 0000000000000000
jul 28 17:16:25 localhost.localdomain kernel: R10: 0000000000000001 R11:
0000000000000000 R12: ffff8d5813f16400
jul 28 17:16:25 localhost.localdomain kernel: R13: ffff8d5813f740b0 R14:
0000000000000282 R15: 00000001d1e12000
jul 28 17:16:25 localhost.localdomain kernel: FS:  00007ff54b47ea80(0000)
GS:ffff8d5817000000(0000) knlGS:0000000000000000
jul 28 17:16:25 localhost.localdomain kernel: CS:  0010 DS: 0000 ES: 0000 C=
R0:
0000000080050033
jul 28 17:16:25 localhost.localdomain kernel: CR2: 00005619b5cd2770 CR3:
00000001e3c18002 CR4: 00000000000606e0
jul 28 17:16:25 localhost.localdomain kernel: Call Trace:
jul 28 17:16:25 localhost.localdomain kernel:  ?
_raw_spin_unlock_irqrestore+0x4b/0x60
jul 28 17:16:25 localhost.localdomain kernel:=20
debug_dma_sync_single_for_device+0x7b/0x90
jul 28 17:16:25 localhost.localdomain kernel:  ? find_held_lock+0x32/0x90
jul 28 17:16:25 localhost.localdomain kernel:  ? sched_clock+0x5/0x10
jul 28 17:16:25 localhost.localdomain kernel:  ? sched_clock_cpu+0xc/0xc0
jul 28 17:16:25 localhost.localdomain kernel:=20
nouveau_bo_sync_for_device+0x80/0xc0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  nouveau_bo_validate+0x68/0x90
[nouveau]
jul 28 17:16:25 localhost.localdomain kernel:=20
nouveau_gem_ioctl_pushbuf+0x84a/0x1500 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ? drm_ioctl_kernel+0xaa/0xf0
[drm]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  drm_ioctl_kernel+0xaa/0xf0 [=
drm]
jul 28 17:16:25 localhost.localdomain kernel:  drm_ioctl+0x208/0x390 [drm]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ? lockdep_hardirqs_on+0xf0/0=
x180
jul 28 17:16:25 localhost.localdomain kernel:  nouveau_drm_ioctl+0x63/0xb0
[nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  do_vfs_ioctl+0x411/0x750
jul 28 17:16:25 localhost.localdomain kernel:  ksys_ioctl+0x5e/0x90
jul 28 17:16:25 localhost.localdomain kernel:  __x64_sys_ioctl+0x16/0x20
jul 28 17:16:25 localhost.localdomain kernel:  do_syscall_64+0x5c/0xb0
jul 28 17:16:25 localhost.localdomain kernel:=20
entry_SYSCALL_64_after_hwframe+0x49/0xbe
jul 28 17:16:25 localhost.localdomain kernel: RIP: 0033:0x7ff54bbbd07b
jul 28 17:16:25 localhost.localdomain kernel: Code: 0f 1e fa 48 8b 05 0d 9e=
 0c
00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e =
fa
b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d dd 9d 0c 00 f7 d=
8 64
89 01 48
jul 28 17:16:25 localhost.localdomain kernel: RSP: 002b:00007ffc8545bf28
EFLAGS: 00000246 ORIG_RAX: 0000000000000010
jul 28 17:16:25 localhost.localdomain kernel: RAX: ffffffffffffffda RBX:
00007ffc8545bf90 RCX: 00007ff54bbbd07b
jul 28 17:16:25 localhost.localdomain kernel: RDX: 00007ffc8545bf90 RSI:
00000000c0406481 RDI: 000000000000000d
jul 28 17:16:25 localhost.localdomain kernel: RBP: 00000000c0406481 R08:
0000000000000000 R09: 00005619b5ccb768
jul 28 17:16:25 localhost.localdomain kernel: R10: 0000000000000040 R11:
0000000000000246 R12: 00005619b5cc1760
jul 28 17:16:25 localhost.localdomain kernel: R13: 000000000000000d R14:
00005619b5cbfb50 R15: 00005619b5cbeee0
jul 28 17:16:25 localhost.localdomain kernel: irq event stamp: 292584
jul 28 17:16:25 localhost.localdomain kernel: hardirqs last  enabled at
(292583): [<ffffffffbcb2198b>] _raw_spin_unlock_irqrestore+0x4b/0x60
jul 28 17:16:25 localhost.localdomain kernel: hardirqs last disabled at
(292584): [<ffffffffbcb22133>] _raw_spin_lock_irqsave+0x23/0x83
jul 28 17:16:25 localhost.localdomain kernel: softirqs last  enabled at
(291436): [<ffffffffbce0035d>] __do_softirq+0x35d/0x45d
jul 28 17:16:25 localhost.localdomain kernel: softirqs last disabled at
(291429): [<ffffffffbc0f1e27>] irq_exit+0xf7/0x100
jul 28 17:16:25 localhost.localdomain kernel: ---[ end trace 5bb423357b9e51=
75
]---

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15643461220.184c9b.8895
Date: Sun, 28 Jul 2019 20:35:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Device driver tries to sync DMA memory it has not allocat=
ed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111242">111242</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Device driver tries to sync DMA memory it has not allocated
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>thiago.frmoraes&#64;outlook.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hardware: GeForce GTX 960 (rev a1) - NV126
OS: Fedora Silverblue 31 (Rawhide)
DE: Gnome-Shell 3.33.4

$ journalctl -b -t kernel

jul 28 17:16:25 localhost.localdomain kernel: ------------[ cut here
]------------
jul 28 17:16:25 localhost.localdomain kernel: DMA-API: nouveau 0000:01:00.0:
device driver tries to sync DMA memory it has not allocated [device
address=3D0x00000001d1e12000] [size=3D4096 bytes]
jul 28 17:16:25 localhost.localdomain kernel: WARNING: CPU: 6 PID: 1166 at
kernel/dma/debug.c:1147 check_sync+0x139/0x660
jul 28 17:16:25 localhost.localdomain kernel: Modules linked in:
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_n=
at
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc vfat fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp
snd_hda_codec_realtek snd_hda_codec_hdmi coretemp snd_hda_codec_generic
ledtrig_audio kvm_intel snd_hda_intel snd_hda_codec kvm snd_hda_core irqbyp=
ass
snd_hwdep joydev xpad snd_seq ff_memless snd_seq_device snd_pcm intel_cstate
iTCO_wdt iTCO_vendor_support intel_uncore gpio_ich snd_timer mei_me e1000e =
snd
intel_rapl_perf mei soundcore i2c_i801 lpc_ich nouveau crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel mxm_wmi wmi video i2c_algo_bit
drm_kms_helper
jul 28 17:16:25 localhost.localdomain kernel:  serio_raw ttm drm firewire_o=
hci
firewire_core crc_itu_t fuse
jul 28 17:16:25 localhost.localdomain kernel: CPU: 6 PID: 1166 Comm: Xwayla=
nd
Not tainted 5.3.0-0.rc1.git3.1.fc31.x86_64 #1
jul 28 17:16:25 localhost.localdomain kernel: Hardware name:  /DP67DE, BIOS
BAP6710H.86A.0083.2018.1025.1520 10/25/2018
jul 28 17:16:25 localhost.localdomain kernel: RIP: 0010:check_sync+0x139/0x=
660
jul 28 17:16:25 localhost.localdomain kernel: Code: 04 4d 8b 65 00 4c 89 ef=
 4c
89 04 24 e8 e0 36 5a 00 4c 8b 04 24 48 89 c6 4c 89 f9 4c 89 e2 48 c7 c7 18 =
af
32 bd e8 bf c3 f5 ff &lt;0f&gt; 0b 8b 05 6f 43 79 01 85 c0 0f 84 64 04 00 0=
0 48 83 c4
28 4c 89
jul 28 17:16:25 localhost.localdomain kernel: RSP: 0018:ffffaa2380767a10
EFLAGS: 00010082
jul 28 17:16:25 localhost.localdomain kernel: RAX: 0000000000000000 RBX:
ffffaa2380767a70 RCX: 0000000000000006
jul 28 17:16:25 localhost.localdomain kernel: RDX: 0000000000000007 RSI:
0000000000000000 RDI: ffff8d58171d9d80
jul 28 17:16:25 localhost.localdomain kernel: RBP: ffffffffbeda8c50 R08:
0000000000000001 R09: 0000000000000000
jul 28 17:16:25 localhost.localdomain kernel: R10: 0000000000000001 R11:
0000000000000000 R12: ffff8d5813f16400
jul 28 17:16:25 localhost.localdomain kernel: R13: ffff8d5813f740b0 R14:
0000000000000282 R15: 00000001d1e12000
jul 28 17:16:25 localhost.localdomain kernel: FS:  00007ff54b47ea80(0000)
GS:ffff8d5817000000(0000) knlGS:0000000000000000
jul 28 17:16:25 localhost.localdomain kernel: CS:  0010 DS: 0000 ES: 0000 C=
R0:
0000000080050033
jul 28 17:16:25 localhost.localdomain kernel: CR2: 00005619b5cd2770 CR3:
00000001e3c18002 CR4: 00000000000606e0
jul 28 17:16:25 localhost.localdomain kernel: Call Trace:
jul 28 17:16:25 localhost.localdomain kernel:  ?
_raw_spin_unlock_irqrestore+0x4b/0x60
jul 28 17:16:25 localhost.localdomain kernel:=20
debug_dma_sync_single_for_device+0x7b/0x90
jul 28 17:16:25 localhost.localdomain kernel:  ? find_held_lock+0x32/0x90
jul 28 17:16:25 localhost.localdomain kernel:  ? sched_clock+0x5/0x10
jul 28 17:16:25 localhost.localdomain kernel:  ? sched_clock_cpu+0xc/0xc0
jul 28 17:16:25 localhost.localdomain kernel:=20
nouveau_bo_sync_for_device+0x80/0xc0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  nouveau_bo_validate+0x68/0x90
[nouveau]
jul 28 17:16:25 localhost.localdomain kernel:=20
nouveau_gem_ioctl_pushbuf+0x84a/0x1500 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ? drm_ioctl_kernel+0xaa/0xf0
[drm]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  drm_ioctl_kernel+0xaa/0xf0 [=
drm]
jul 28 17:16:25 localhost.localdomain kernel:  drm_ioctl+0x208/0x390 [drm]
jul 28 17:16:25 localhost.localdomain kernel:  ?
nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  ? lockdep_hardirqs_on+0xf0/0=
x180
jul 28 17:16:25 localhost.localdomain kernel:  nouveau_drm_ioctl+0x63/0xb0
[nouveau]
jul 28 17:16:25 localhost.localdomain kernel:  do_vfs_ioctl+0x411/0x750
jul 28 17:16:25 localhost.localdomain kernel:  ksys_ioctl+0x5e/0x90
jul 28 17:16:25 localhost.localdomain kernel:  __x64_sys_ioctl+0x16/0x20
jul 28 17:16:25 localhost.localdomain kernel:  do_syscall_64+0x5c/0xb0
jul 28 17:16:25 localhost.localdomain kernel:=20
entry_SYSCALL_64_after_hwframe+0x49/0xbe
jul 28 17:16:25 localhost.localdomain kernel: RIP: 0033:0x7ff54bbbd07b
jul 28 17:16:25 localhost.localdomain kernel: Code: 0f 1e fa 48 8b 05 0d 9e=
 0c
00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e =
fa
b8 10 00 00 00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d dd 9d 0c 0=
0 f7 d8 64
89 01 48
jul 28 17:16:25 localhost.localdomain kernel: RSP: 002b:00007ffc8545bf28
EFLAGS: 00000246 ORIG_RAX: 0000000000000010
jul 28 17:16:25 localhost.localdomain kernel: RAX: ffffffffffffffda RBX:
00007ffc8545bf90 RCX: 00007ff54bbbd07b
jul 28 17:16:25 localhost.localdomain kernel: RDX: 00007ffc8545bf90 RSI:
00000000c0406481 RDI: 000000000000000d
jul 28 17:16:25 localhost.localdomain kernel: RBP: 00000000c0406481 R08:
0000000000000000 R09: 00005619b5ccb768
jul 28 17:16:25 localhost.localdomain kernel: R10: 0000000000000040 R11:
0000000000000246 R12: 00005619b5cc1760
jul 28 17:16:25 localhost.localdomain kernel: R13: 000000000000000d R14:
00005619b5cbfb50 R15: 00005619b5cbeee0
jul 28 17:16:25 localhost.localdomain kernel: irq event stamp: 292584
jul 28 17:16:25 localhost.localdomain kernel: hardirqs last  enabled at
(292583): [&lt;ffffffffbcb2198b&gt;] _raw_spin_unlock_irqrestore+0x4b/0x60
jul 28 17:16:25 localhost.localdomain kernel: hardirqs last disabled at
(292584): [&lt;ffffffffbcb22133&gt;] _raw_spin_lock_irqsave+0x23/0x83
jul 28 17:16:25 localhost.localdomain kernel: softirqs last  enabled at
(291436): [&lt;ffffffffbce0035d&gt;] __do_softirq+0x35d/0x45d
jul 28 17:16:25 localhost.localdomain kernel: softirqs last disabled at
(291429): [&lt;ffffffffbc0f1e27&gt;] irq_exit+0xf7/0x100
jul 28 17:16:25 localhost.localdomain kernel: ---[ end trace 5bb423357b9e51=
75
]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15643461220.184c9b.8895--

--===============1681454211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1681454211==--
