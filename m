Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548957FC09
	for <lists+nouveau@lfdr.de>; Mon, 25 Jul 2022 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B738FD16;
	Mon, 25 Jul 2022 09:09:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458DD8FD16
 for <nouveau@lists.freedesktop.org>; Mon, 25 Jul 2022 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658740153;
 bh=2+2kUXLBFn//p08/fIvfTp1XUHQMA4Mhdkx4i6vAGOk=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=XLib1/ccXYt4/nwfyrmSJm1o3PNZofhK732uZM9ef8fwLHXFUMlEsWF3AabOfS/7Y
 vMV9ua9ytEbrJVAJkKZHuUV4b3rSGErewH/TbTuABhM+4YEm3MCT18/X1miT3QArls
 lF/tCzgULxWs3vcanvSnOmFX9XyWszfK0uvd6P7c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.178] ([178.115.55.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1oOjm32buC-008tpe for
 <nouveau@lists.freedesktop.org>; Mon, 25 Jul 2022 11:09:12 +0200
Content-Type: multipart/mixed; boundary="------------8LSdYNpeD3lgkwk65qzJKWSW"
Message-ID: <65b19894-6683-8c2f-83b7-8625b2d81717@gmx.net>
Date: Mon, 25 Jul 2022 11:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
From: Linux User #330250 <linuxuser330250@gmx.net>
X-Provags-ID: V03:K1:R9dFgvBUDqbUuoB362BqJp7ZMXTrBYPeWq+OhGoZGQQuABcJrWk
 HyzmMw3cNGEq3MZK/DPZqZKSEfEnct4nnJxq91hTLHkR0QSooaJmW+FOF7wcVM8LL6PUcd/
 xok8RR6PDl4THt340pRaOz/OUlNn1bDiO6VuKzDe/ej/4ZHip9nyoWy0bSpB3PH60AFesTp
 HEgKpBZExMyqjnVr+Abpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UXfp1jOdaN0=:O41s9227vfLD6/w/Depnvs
 7koZEK3LGVCIMAnlRV1hJC5Rg7RUMed2pviCLp461b9033ea65aDw05627DxV4uAhw11XUHaj
 oFuzYhd/zcj3h9is4RQICIgtWyG6C3IxCiEi52XYEtu568EM95hY8KRqCCwvvlEUgNONf2iwq
 8l0EhBrRa37OePGYnedJrH1k8998Qy4XcXc8wVhgOrPNB1CRjIIVFDKt4Jfm43pYIeavSwTq8
 0ljUofpgltE59bCTtpBC8KMbhcvuqXfMwXVg7l7NGjRGMrgf6Gd6IndP6nz+mm4X8sPNZ9SaJ
 2pVUQIbVhnMfrll5wvaPcWNzA54YxcxMH46Y/tfm3BPm1JTobXc7xddSkDEahnWqUi1GiH2F4
 hHPHrKyflabmG21+bERILASWtDrQX+uSXlG8Ehb9eeBkho2fOjzUi6K12XmNW8jN9TqwsRnE1
 RBBgnzzswFB/nPPfiNQRkuaPXRueTOUwj7ys4MeItIn4qDzMBfVRTmrwi8CO3BqLovT/QtCpZ
 5+h07hv6HDcLvfDdhC/cZu1+Pj6RUjKtvmrAL/CLZAptx2RRleUm5u4DrimGg/Z3UHVO1wxer
 IgkLJrIokN/bUqdxaeIKsf1AslLKHv4KXe6itgZNY5AyWuGMHsBecu9EeFPiqqXzrsRBTI+97
 cfMxZQV68jc3lPnAEIDmviTUz7GWr0u8rPGlXZI9stCvRLMQn1c4cJclEpmxLs6p5i8r5tweK
 2Wvd8svVgXZ0xt92kHWdRbjWihkTV51BvaN0eh9i1xItIvUUB86bgUf8pnjg+ZNJdJpsXsNxr
 lFh35Av438bVthzGFncZp9enO2AyGuvJa1K8Rj4RXo7Whiu3a75Eocgn21Dm7lDp8DYt3ZkgW
 L/hdkjvgICAMi9X3+wp/Okwswk6/qYdNLZA1dIxKSS8YjMDoHPE1PG/OO6mXKLYZG4+PfcSDx
 6+q8AyQ9rfZSwerA0tuvIbJQ2fr1dZQZWhDfGfouBnmTRYrs5cyi0Z9TrWsW1OoBVHVmyYJ6e
 ZGVzC3vjnDy8bbj3toVyWjADkXhYjvLXQqmS7t4dB6hN8vZqVxJWIeWqYoj1tcmI0tLVhwrnX
 SM2KnOLgUmjdUpm0s2Jq+/neB/wsyDKAkTYyGMUchJBduSPRZS1WiVrMA==
Subject: [Nouveau] nouveau failing on logoff: 1. can't change power state
 from D3cold to D0; 2. init and DRM failed with error -16
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

This is a multi-part message in MIME format.
--------------8LSdYNpeD3lgkwk65qzJKWSW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi!

My hardware:
Lenovo Legion 5 Pro 16ACH6H with hybrid graphics:
* the respective output of "lspci -nn -k":
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA104M
[GeForce RTX 3070 Mobile / Max-Q] [10de:24dd] (rev a1)
         Subsystem: Lenovo GA104M [GeForce RTX 3070 Mobile / Max-Q]
[17aa:3a4f]
         Kernel driver in use: nouveau
         Kernel modules: nouveau
06:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne [1002:1638] (rev c5)
         Subsystem: Lenovo Cezanne [17aa:3a4f]
         Kernel driver in use: amdgpu
* the respective parts of /var/log/Xorg.0.log:
(--) PCI: (1@0:0:0) 10de:24dd:17aa:3a4f rev 161, Mem @
0xd0000000/16777216, 0xfa00000000/8589934592, 0xfc00000000/33554432, I/O
@ 0x00003000/128, BIOS @ 0x????????/524288
(--) PCI:*(6@0:0:0) 1002:1638:17aa:3a4f rev 197, Mem @
0xfc10000000/268435456, 0xfc20000000/2097152, 0xd1500000/524288, I/O @
0x00001000/256


My software:
Gentoo Linux (kernel 5.18.14 currently) =E2=80=93 I'm attaching my .config=
...



My configuration and system use:
I use the laptop with the amdgpu driver on Linux, and with the Nvidia
graphics card for gaming on Windows.

I compiled the bbswitch module in order to disable the nvidia card when
running Linux, but bbswitch doesn't load. I suspect the nvidia card is
constantly powered on, which unnecessarily drains the battery.

I just recently added the nouveau driver and the Linux kernel ability
for hybrid graphics. Gladly amdgpu remains as the primary output, even
with nouveau loaded.

1. On logon, no error is logged in the kernel ringbuffer (dmesg).
2. Every time I terminate X.org-X11, the nouveau driver fails with a
kernel oups.


I retrieved the following dmesg snippet when I switched the user (logged
in as an additional user, hereby starting a second SDDM and then
X.org-X11 session). So, the error also appears when another X server is
started (and the first one suspended?). BUT there is NO error when I
switch to another virtual text terminal (Ctrl+Alt+F1...F12)!


* dmesg output:
...
[ 6176.462281] nouveau 0000:01:00.0: can't change power state from
D3cold to D0 (config space inaccessible)
[ 6176.462326] nouveau 0000:01:00.0: can't change power state from
D3cold to D0 (config space inaccessible)
[ 6176.524082] nouveau 0000:01:00.0: can't change power state from
D3cold to D0 (config space inaccessible)
[ 6176.527798] nouveau 0000:01:00.0: timer: stalled at ffffffffffffffff
[ 6176.527799] ------------[ cut here ]------------
[ 6176.527800] nouveau 0000:01:00.0: timeout
[ 6176.527810] WARNING: CPU: 5 PID: 38637 at
drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35
g84_bar_flush+0xf9/0x110 [nouveau]
[ 6176.527829] Modules linked in: nf_tables nfnetlink btusb btrtl
cdc_ether btbcm btintel usbnet btmtk bluetooth r8152 mii nouveau xt_hl
ip6t_rt ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_syslog xt_limit
xt_addrtype xt_tcpudp xt_conntrack ip6table_filter ip6_tables
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat
nf_conntrack_ftp nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
iptable_filter ip_tables x_tables bpfilter sch_fq_codel fuse
[ 6176.527847] CPU: 5 PID: 38637 Comm: X Tainted: G                T
5.18.14-gentoo-TPP #1
[ 6176.527850] Hardware name: LENOVO 82JQ/LNVNB161216, BIOS GKCN54WW
05/05/2022
[ 6176.527850] RIP: 0010:g84_bar_flush+0xf9/0x110 [nouveau]
[ 6176.527864] Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 85 ed 75 03 4c
8b 2f e8 e9 07 78 fc 4c 89 ea 48 c7 c7 1c 60 68 c0 48 89 c6 e8 be 11 df
fc <0f> 0b eb a8 e8 ae 32 e9 fc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
[ 6176.527865] RSP: 0018:ffffaefa4327f830 EFLAGS: 00010046
[ 6176.527866] RAX: 0000000000000000 RBX: ffff940670d2d400 RCX:
0000000000000000
[ 6176.527867] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[ 6176.527868] RBP: ffff940600bda898 R08: 0000000000000000 R09:
0000000000000000
[ 6176.527868] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000246
[ 6176.527869] R13: ffff9406102e71a0 R14: 0000000000000000 R15:
0000059e15832fd7
[ 6176.527870] FS:  00007fe84b0f6980(0000) GS:ffff940c11d40000(0000)
knlGS:0000000000000000
[ 6176.527871] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 6176.527871] CR2: 000056472358a439 CR3: 0000000181e78000 CR4:
0000000000750ee0
[ 6176.527872] PKRU: 55555554
[ 6176.527873] Call Trace:
[ 6176.527875]  <TASK>
[ 6176.527876]  nv50_instobj_release+0x2f/0xc0 [nouveau]
[ 6176.527896]  nvkm_instobj_load+0x4a/0xb0 [nouveau]
[ 6176.527910]  nvkm_instmem_init+0x2b/0x80 [nouveau]
[ 6176.527923]  nvkm_subdev_init+0x9b/0xf0 [nouveau]
[ 6176.527937]  ? ktime_get+0x3b/0xb0
[ 6176.527940]  nvkm_device_init+0x12a/0x1d0 [nouveau]
[ 6176.527961]  nvkm_udevice_init+0x48/0x70 [nouveau]
[ 6176.527975]  nvkm_object_init+0x3d/0x130 [nouveau]
[ 6176.527989]  nvkm_object_init+0x72/0x130 [nouveau]
[ 6176.528002]  nvkm_object_init+0x72/0x130 [nouveau]
[ 6176.528014]  nouveau_do_resume+0x26/0xd0 [nouveau]
[ 6176.528033]  nouveau_pmops_runtime_resume+0x80/0x160 [nouveau]
[ 6176.528048]  pci_pm_runtime_resume+0xa5/0xd0
[ 6176.528051]  ? pci_pm_freeze_noirq+0x120/0x120
[ 6176.528052]  __rpm_callback+0x35/0x120
[ 6176.528055]  ? pci_pm_freeze_noirq+0x120/0x120
[ 6176.528056]  rpm_callback+0x6a/0x80
[ 6176.528057]  rpm_resume+0x50b/0x790
[ 6176.528058]  __pm_runtime_resume+0x49/0x80
[ 6176.528059]  nouveau_drm_open+0x70/0x1f0 [nouveau]
[ 6176.528072]  drm_file_alloc+0x198/0x270
[ 6176.528075]  drm_open+0xde/0x270
[ 6176.528076]  drm_stub_open+0xc2/0x160
[ 6176.528078]  chrdev_open+0xd2/0x230
[ 6176.528080]  ? cdev_device_add+0xa0/0xa0
[ 6176.528081]  do_dentry_open+0x160/0x3c0
[ 6176.528083]  path_openat+0xd23/0x1270
[ 6176.528085]  do_filp_open+0xa1/0x160
[ 6176.528087]  do_sys_openat2+0xc3/0x190
[ 6176.528089]  __x64_sys_openat+0x54/0xa0
[ 6176.528090]  do_syscall_64+0x60/0x90
[ 6176.528093]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[ 6176.528095] RIP: 0033:0x7fe84b8c5f99
[ 6176.528097] Code: 41 00 3d 00 00 41 00 74 58 64 8b 04 25 18 00 00 00
85 c0 75 7c 41 89 da 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f
05 <48> 3d 00 f0 ff ff 0f 87 9b 00 00 00 48 8b 54 24 28 64 48 2b 14 25
[ 6176.528097] RSP: 002b:00007ffd41adef40 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[ 6176.528099] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007fe84b8c5f99
[ 6176.528099] RDX: 0000000000080002 RSI: 000056299fbd3ad0 RDI:
00000000ffffff9c
[ 6176.528100] RBP: 000056299fbd3ad0 R08: 0000000000000000 R09:
0000000000000000
[ 6176.528100] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000080002
[ 6176.528101] R13: 000056299fbd3ad0 R14: 000056299fbd3ad0 R15:
000056299fbd21e0
[ 6176.528102]  </TASK>
[ 6176.528102] ---[ end trace 0000000000000000 ]---
[ 6176.531387] nouveau 0000:01:00.0: timer: stalled at ffffffffffffffff
[ 6176.531388] ------------[ cut here ]------------
...

The "cut here" parts are repeated 54 times (giving 55 almost identical
"stalled timers", and ending with (the 55th stall):

[ 6176.883137] ---[ end trace 0000000000000000 ]---
[ 6176.883162] nouveau 0000:01:00.0: timer: stalled at ffffffffffffffff
[ 6176.883164] ------------[ cut here ]------------
[ 6176.883164] nouveau 0000:01:00.0: timeout
[ 6176.883170] WARNING: CPU: 5 PID: 38637 at
drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c:42
tu102_disp_init+0x543/0x560 [nouveau]
[ 6176.883186] Modules linked in: nf_tables nfnetlink btusb btrtl
cdc_ether btbcm btintel usbnet btmtk bluetooth r8152 mii nouveau xt_hl
ip6t_rt ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_syslog xt_limit
xt_addrtype xt_tcpudp xt_conntrack ip6table_filter ip6_tables
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat
nf_conntrack_ftp nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
iptable_filter ip_tables x_tables bpfilter sch_fq_codel fuse
[ 6176.883195] CPU: 5 PID: 38637 Comm: X Tainted: G        W       T
5.18.14-gentoo-TPP #1
[ 6176.883196] Hardware name: LENOVO 82JQ/LNVNB161216, BIOS GKCN54WW
05/05/2022
[ 6176.883196] RIP: 0010:tu102_disp_init+0x543/0x560 [nouveau]
[ 6176.883210] Code: 24 20 48 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4
74 20 e8 af 2f 71 fc 4c 89 e2 48 c7 c7 1f b7 68 c0 48 89 c6 e8 84 39 d8
fc <0f> 0b b8 f0 ff ff ff eb 92 4c 8b 27 eb db e8 6a 5a e2 fc 66 2e 0f
[ 6176.883211] RSP: 0018:ffffaefa4327f828 EFLAGS: 00010246
[ 6176.883212] RAX: 0000000000000000 RBX: ffff940670d2d400 RCX:
0000000000000000
[ 6176.883212] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[ 6176.883213] RBP: ffff9406e0c4a810 R08: 0000000000000000 R09:
0000000000000000
[ 6176.883213] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff9406102e71a0
[ 6176.883214] R13: ffff9406e0c4a810 R14: 0000000000000000 R15:
0000059e15832fd7
[ 6176.883214] FS:  00007fe84b0f6980(0000) GS:ffff940c11d40000(0000)
knlGS:0000000000000000
[ 6176.883215] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 6176.883216] CR2: 000056472358a439 CR3: 0000000181e78000 CR4:
0000000000750ee0
[ 6176.883217] PKRU: 55555554
[ 6176.883217] Call Trace:
[ 6176.883218]  <TASK>
[ 6176.883218]  nvkm_disp_init+0x7c/0xf0 [nouveau]
[ 6176.883232]  nvkm_engine_init+0xb2/0x130 [nouveau]
[ 6176.883244]  nvkm_subdev_init+0x9b/0xf0 [nouveau]
[ 6176.883257]  ? ktime_get+0x3b/0xb0
[ 6176.883258]  nvkm_device_init+0x12a/0x1d0 [nouveau]
[ 6176.883271]  nvkm_udevice_init+0x48/0x70 [nouveau]
[ 6176.883285]  nvkm_object_init+0x3d/0x130 [nouveau]
[ 6176.883297]  nvkm_object_init+0x72/0x130 [nouveau]
[ 6176.883309]  nvkm_object_init+0x72/0x130 [nouveau]
[ 6176.883322]  nouveau_do_resume+0x26/0xd0 [nouveau]
[ 6176.883335]  nouveau_pmops_runtime_resume+0x80/0x160 [nouveau]
[ 6176.883348]  pci_pm_runtime_resume+0xa5/0xd0
[ 6176.883350]  ? pci_pm_freeze_noirq+0x120/0x120
[ 6176.883351]  __rpm_callback+0x35/0x120
[ 6176.883352]  ? pci_pm_freeze_noirq+0x120/0x120
[ 6176.883353]  rpm_callback+0x6a/0x80
[ 6176.883354]  rpm_resume+0x50b/0x790
[ 6176.883355]  __pm_runtime_resume+0x49/0x80
[ 6176.883356]  nouveau_drm_open+0x70/0x1f0 [nouveau]
[ 6176.883369]  drm_file_alloc+0x198/0x270
[ 6176.883370]  drm_open+0xde/0x270
[ 6176.883371]  drm_stub_open+0xc2/0x160
[ 6176.883372]  chrdev_open+0xd2/0x230
[ 6176.883374]  ? cdev_device_add+0xa0/0xa0
[ 6176.883375]  do_dentry_open+0x160/0x3c0
[ 6176.883376]  path_openat+0xd23/0x1270
[ 6176.883377]  do_filp_open+0xa1/0x160
[ 6176.883379]  do_sys_openat2+0xc3/0x190
[ 6176.883380]  __x64_sys_openat+0x54/0xa0
[ 6176.883381]  do_syscall_64+0x60/0x90
[ 6176.883382]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[ 6176.883384] RIP: 0033:0x7fe84b8c5f99
[ 6176.883384] Code: 41 00 3d 00 00 41 00 74 58 64 8b 04 25 18 00 00 00
85 c0 75 7c 41 89 da 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f
05 <48> 3d 00 f0 ff ff 0f 87 9b 00 00 00 48 8b 54 24 28 64 48 2b 14 25
[ 6176.883385] RSP: 002b:00007ffd41adef40 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[ 6176.883386] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007fe84b8c5f99
[ 6176.883386] RDX: 0000000000080002 RSI: 000056299fbd3ad0 RDI:
00000000ffffff9c
[ 6176.883387] RBP: 000056299fbd3ad0 R08: 0000000000000000 R09:
0000000000000000
[ 6176.883388] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000080002
[ 6176.883388] R13: 000056299fbd3ad0 R14: 000056299fbd3ad0 R15:
000056299fbd21e0
[ 6176.883389]  </TASK>
[ 6176.883389] ---[ end trace 0000000000000000 ]---
[ 6176.883391] nouveau 0000:01:00.0: disp: init failed, -16
[ 6176.883451] nouveau 0000:01:00.0: init failed with -16
[ 6176.883453] nouveau: X[4313]:00000000:00000080: init failed with -16
[ 6176.883454] nouveau: DRM-master:00000000:00000000: init failed with -16
[ 6176.883455] nouveau: DRM-master:00000000:00000000: init failed with -16
[ 6176.883457] nouveau 0000:01:00.0: DRM: Client resume failed with
error: -16
[ 6176.883458] nouveau 0000:01:00.0: DRM: resume failed with: -16


The final error seems to be "error -16" for both the nouveau init and
the DRM client.


Selected dmesg output during boot-up, before the issue occurs:
...
pci 0000:01:00.0: [10de:24dd] type 00 class 0x030000
pci 0000:01:00.0: reg 0x10: [mem 0xd0000000-0xd0ffffff]
pci 0000:01:00.0: reg 0x14: [mem 0xfa00000000-0xfbffffffff 64bit pref]
pci 0000:01:00.0: reg 0x1c: [mem 0xfc00000000-0xfc01ffffff 64bit pref]
pci 0000:01:00.0: reg 0x24: [io  0x3000-0x307f]
pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pref]
pci 0000:01:00.0: PME# supported from D0 D3hot
pci 0000:01:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0
GT/s PCIe x8 link at 0000:00:01.1 (capable of 252.048 Gb/s with 16.0
GT/s PCIe x16 link)
pci 0000:01:00.1: [10de:228b] type 00 class 0x040300
pci 0000:01:00.1: reg 0x10: [mem 0xd1000000-0xd1003fff]
...
pci 0000:06:00.0: [1002:1638] type 00 class 0x030000
pci 0000:06:00.0: reg 0x10: [mem 0xfc10000000-0xfc1fffffff 64bit pref]
pci 0000:06:00.0: reg 0x18: [mem 0xfc20000000-0xfc201fffff 64bit pref]
pci 0000:06:00.0: reg 0x20: [io  0x1000-0x10ff]
pci 0000:06:00.0: reg 0x24: [mem 0xd1500000-0xd157ffff]
pci 0000:06:00.0: enabling Extended Tags
pci 0000:06:00.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:06:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0
GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s with 16.0
GT/s PCIe x16 link)
pci 0000:06:00.2: [1022:15df] type 00 class 0x108000
pci 0000:06:00.2: reg 0x18: [mem 0xd1400000-0xd14fffff]
pci 0000:06:00.2: reg 0x24: [mem 0xd15c8000-0xd15c9fff]
pci 0000:06:00.2: enabling Extended Tags
pci 0000:06:00.3: [1022:1639] type 00 class 0x0c0330
pci 0000:06:00.3: reg 0x10: [mem 0xd1200000-0xd12fffff 64bit]
pci 0000:06:00.3: enabling Extended Tags
pci 0000:06:00.3: PME# supported from D0 D3hot D3cold
pci 0000:06:00.4: [1022:1639] type 00 class 0x0c0330
pci 0000:06:00.4: reg 0x10: [mem 0xd1300000-0xd13fffff 64bit]
pci 0000:06:00.4: enabling Extended Tags
pci 0000:06:00.4: PME# supported from D0 D3hot D3cold
pci 0000:06:00.5: [1022:15e2] type 00 class 0x048000
pci 0000:06:00.5: reg 0x10: [mem 0xd1580000-0xd15bffff]
pci 0000:06:00.5: enabling Extended Tags
pci 0000:06:00.5: PME# supported from D0 D3hot D3cold
pci 0000:06:00.6: [1022:15e3] type 00 class 0x040300
pci 0000:06:00.6: reg 0x10: [mem 0xd15c0000-0xd15c7fff]
pci 0000:06:00.6: enabling Extended Tags
pci 0000:06:00.6: PME# supported from D0 D3hot D3cold
...
pci 0000:01:00.0: vgaarb: setting as boot VGA device
pci 0000:01:00.0: vgaarb: bridge control possible
pci 0000:01:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
pci 0000:06:00.0: vgaarb: setting as boot VGA device (overriding previous)
pci 0000:06:00.0: vgaarb: bridge control possible
pci 0000:06:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
vgaarb: loaded
...
pci 0000:01:00.0: can't claim BAR 6 [mem 0xfff80000-0xffffffff pref]: no
compatible bridge window
pci 0000:01:00.0: BAR 6: assigned [mem 0xd1080000-0xd10fffff pref]
...
pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
pci 0000:06:00.3: extending delay after power-on from D3hot to 20 msec
pci 0000:06:00.3: quirk_usb_early_handoff+0x0/0x740 took 265756 usecs
pci 0000:06:00.4: extending delay after power-on from D3hot to 20 msec
pci 0000:06:00.4: quirk_usb_early_handoff+0x0/0x740 took 16372 usecs
...
pci 0000:01:00.0: Adding to iommu group 10
pci 0000:01:00.1: Adding to iommu group 10
...
pci 0000:06:00.0: Adding to iommu group 7
pci 0000:06:00.2: Adding to iommu group 7
pci 0000:06:00.3: Adding to iommu group 7
pci 0000:06:00.4: Adding to iommu group 7
pci 0000:06:00.5: Adding to iommu group 7
pci 0000:06:00.6: Adding to iommu group 7
...
ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
...
Linux agpgart interface v0.103
...
[drm] amdgpu kernel modesetting enabled.
amdgpu: vga_switcheroo: detected switching method
\_SB_.PCI0.GP17.VGA_.ATPX handle
ATPX version 1, functions 0x00000001
ATPX Hybrid Graphics
amdgpu: Virtual CRAT table created for CPU
amdgpu: Topology: Add CPU node
amdgpu 0000:06:00.0: vgaarb: deactivate vga console
amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
[drm] initializing kernel modesetting (RENOIR 0x1002:0x1638
0x17AA:0x3A4F 0xC5).
amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
[drm] register mmio base: 0xD1500000
[drm] register mmio size: 524288
[drm] add ip block number 0 <soc15_common>
[drm] add ip block number 1 <gmc_v9_0>
[drm] add ip block number 2 <vega10_ih>
[drm] add ip block number 3 <psp>
[drm] add ip block number 4 <smu>
[drm] add ip block number 5 <dm>
[drm] add ip block number 6 <gfx_v9_0>
[drm] add ip block number 7 <sdma_v4_0>
[drm] add ip block number 8 <vcn_v2_0>
[drm] add ip block number 9 <jpeg_v2_0>
amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
amdgpu: ATOM BIOS: 113-CEZANNE-018
Loading firmware: amdgpu/green_sardine_sdma.bin
[drm] VCN decode is enabled in VM mode
[drm] VCN encode is enabled in VM mode
[drm] JPEG decode is enabled in VM mode
amdgpu 0000:06:00.0: amdgpu: PCIE atomic ops is not supported
amdgpu 0000:06:00.0: amdgpu: MODE2 reset
[drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size
is 9-bit
amdgpu 0000:06:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 -
0x000000F4FFFFFFFF (4096M used)
amdgpu 0000:06:00.0: amdgpu: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
amdgpu 0000:06:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[drm] Detected VRAM RAM=3D4096M, BAR=3D4096M
[drm] RAM width 128bits DDR4
[drm] amdgpu: 4096M of VRAM memory ready
[drm] amdgpu: 4096M of GTT memory ready.
[drm] GART: num cpu pages 262144, num gpu pages 262144
[drm] PCIE GART of 1024M enabled.
[drm] PTB located at 0x000000F400FA0000
Loading firmware: amdgpu/green_sardine_asd.bin
Loading firmware: amdgpu/green_sardine_ta.bin
amdgpu 0000:06:00.0: amdgpu: PSP runtime database doesn't exist
Loading firmware: amdgpu/green_sardine_dmcub.bin
[drm] Loading DMUB firmware via PSP: version=3D0x01010020
Loading firmware: amdgpu/green_sardine_pfp.bin
Loading firmware: amdgpu/green_sardine_me.bin
Loading firmware: amdgpu/green_sardine_ce.bin
Loading firmware: amdgpu/green_sardine_rlc.bin
Loading firmware: amdgpu/green_sardine_mec.bin
Loading firmware: amdgpu/green_sardine_vcn.bin
[drm] Found VCN firmware Version ENC: 1.17 DEC: 5 VEP: 0 Revision: 2
amdgpu 0000:06:00.0: amdgpu: Will use PSP to load VCN firmware
[drm] reserve 0x400000 from 0xf4ff800000 for PSP TMR
amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is not available
amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is not available
amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is
not available
amdgpu 0000:06:00.0: amdgpu: SMU is initialized successfully!
[drm] Display Core initialized with v3.2.177!
[drm] DMUB hardware initialized: version=3D0x01010020
[drm] kiq ring mec 2 pipe 1 q 0
[drm] VCN decode and encode initialized successfully(under DPG Mode).
[drm] JPEG decode initialized successfully.
kfd kfd: amdgpu: Allocated 3969056 bytes on gart
amdgpu: HMM registered 4096MB device memory
amdgpu: SRAT table not found
amdgpu: Virtual CRAT table created for GPU
amdgpu: Topology: Add dGPU node [0x1638:0x1002]
kfd kfd: amdgpu: added device 1002:1638
amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8,
active_cu_number 8
amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 1
amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 1
amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 1
amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 1
amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 1
[drm] Initialized amdgpu 3.46.0 20150101 for 0000:06:00.0 on minor 0
fbcon: amdgpudrmfb (fb0) is primary device
[drm] DSC precompute is not needed.
Console: switching to colour frame buffer device 320x100
amdgpu 0000:06:00.0: [drm] fb0: amdgpudrmfb frame buffer device
...
input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input14
Loading compiled-in X.509 certificates
input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input15
Key type ._fscrypt registered
input: HDA NVidia HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input16
Key type .fscrypt registered
input: HDA NVidia HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input17
Key type fscrypt-provisioning registered
input: HDA NVidia HDMI/DP,pcm=3D10 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input18
Btrfs loaded, crc32c=3Dcrc32c-intel, zoned=3Dno, fsverity=3Dno
input: HDA NVidia HDMI/DP,pcm=3D11 as
/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0/input19
usb 1-1.1.1: new full-speed USB device number 7 using xhci_hcd
...
ALSA device list:
   #0: HDA NVidia at 0xd1000000 irq 113
...

...(at this point systemd takes the lead and the modules, including
nouveau, are loaded)...


...
ACPI Warning: \_SB.PCI0.GPP0.PEGP._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20211217/nsarguments-61)
pci 0000:01:00.0: optimus capabilities: enabled, status dynamic power,
hda bios codec supported
VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.GPP0.PEGP handle
nouveau 0000:01:00.0: enabling device (0000 -> 0003)
nouveau 0000:01:00.0: NVIDIA GA104 (b74000a1)
nouveau 0000:01:00.0: bios: version 94.04.3f.00.c4
Loading firmware: nvidia/ga104/nvdec/scrubber.bin
nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
...
nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04610020
nouveau 0000:01:00.0: DRM: DCB outp 01: 01811f36 04600010
nouveau 0000:01:00.0: DRM: DCB outp 02: 01811f32 00020010
nouveau 0000:01:00.0: DRM: DCB outp 03: 01022f46 04600020
nouveau 0000:01:00.0: DRM: DCB outp 04: 01022f42 00020020
nouveau 0000:01:00.0: DRM: DCB outp 05: 02033f52 00020010
nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
nouveau 0000:01:00.0: DRM: DCB conn 01: 00001146
nouveau 0000:01:00.0: DRM: DCB conn 02: 00002246
nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
...
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
...
nouveau 0000:01:00.0: vgaarb: changed VGA decodes:
olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
amdgpu 0000:06:00.0: vgaarb: changed VGA decodes:
olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone
...


At this point, SDDM gets started and I login as my primary user without
any other faults.

I included nouveau in the hopes of being able to completely power-down
the nvidia card. bbswitch isn't loading "modprobe bbswitch":

modprobe: ERROR: could not insert 'bbswitch': No such device


The error doesn't affect the stability of my system though, but it
taints the kernel.


I would be happy to help and to test stuff that you though at me, it
should be fairly easy to do this on Gentoo Linux.


Thanks!
Linux User #330250

--------------8LSdYNpeD3lgkwk65qzJKWSW
Content-Type: application/x-xz; name=".config.xz"
Content-Disposition: attachment; filename=".config.xz"
Content-Transfer-Encoding: base64

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

--------------8LSdYNpeD3lgkwk65qzJKWSW--
