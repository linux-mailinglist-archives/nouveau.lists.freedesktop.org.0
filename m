Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F83C06A1
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2019 15:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179396E25D;
	Fri, 27 Sep 2019 13:48:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E46636E24E
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 13:48:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E1D2272162; Fri, 27 Sep 2019 13:48:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 27 Sep 2019 13:48:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: jesaenh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111843-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111843] New: Resume fails after suspend with nouveau
 and Gtx 1050 ti
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
Content-Type: multipart/mixed; boundary="===============2024294343=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2024294343==
Content-Type: multipart/alternative; boundary="15695921041.DceCE8de.32712"
Content-Transfer-Encoding: 7bit


--15695921041.DceCE8de.32712
Date: Fri, 27 Sep 2019 13:48:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111843

            Bug ID: 111843
           Summary: Resume fails after suspend with nouveau and Gtx 1050
                    ti
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: jesaenh@gmail.com
        QA Contact: xorg-team@lists.x.org

My system is  Opensuse tumbleweed updated (kernel 5.2.XX) with Kde (5.16).

This problems happens with nouveau (not with nvidia driver). Ift I resume a=
fter
suspend, Screen is not activated. I got this log in dmesg (via ssh):





[  469.931682] WARNING: CPU: 2 PID: 2178 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:221
gf100_vmm_invalidate+0x1a6/0x1c0 [nouveau]
[  469.931683] Modules linked in: cmac rfcomm af_packet libcrc32c vmnet(OE)
vmw_vsock_vmci_transport vsock vmw_vmci ip_set hid_logitech_hidpp nfnetlink
joydev vmmon(OE) scsi_transport_iscsi x_tables bpfilter intel_rapl snd_seq =
bnep
snd_seq_device snd_hda_codec_hdmi hid_logitech_dj x86_pkg_temp_thermal
intel_powerclamp kvm_intel iTCO_wdt kvm iTCO_vendor_support mei_hdcp irqbyp=
ass
hid_generic ppdev crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_i=
ntel
msr coretemp e1000e snd_hda_codec_realtek aes_x86_64 crypto_simd
snd_hda_codec_generic cryptd ptp i2c_i801 glue_helper pps_core ledtrig_audio
pcspkr snd_hda_intel snd_hda_codec btusb btrtl btbcm snd_hda_core btintel
snd_hwdep bluetooth snd_pcm snd_timer snd uas mei_me ecdh_generic rfkill
usb_storage pcc_cpufreq ecc usbhid usblp soundcore ipmi_devintf mei thermal=
 fan
parport_pc parport acpi_pad nls_iso8859_1 fuse nls_cp437 vfat fat
ipmi_msghandler nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops
[  469.931696]  xhci_pci ttm xhci_hcd crc32c_intel drm usbcore video button=
 sg
dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs [last
unloaded: ip_tables]
[  469.931700] CPU: 2 PID: 2178 Comm: kwin_x11 Tainted: P        W  OE=20=
=20=20=20
5.2.14-1-default #1 openSUSE Tumbleweed (unreleased)
[  469.931700] Hardware name: Gigabyte Technology Co., Ltd.
Z270M-D3H/Z270M-D3H-CF, BIOS F8b 01/10/2018
[  469.931718] RIP: 0010:gf100_vmm_invalidate+0x1a6/0x1c0 [nouveau]
[  469.931719] Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 85 ed 75 03 4c 8b =
2f
e8 0c 9d d3 d1 4c 89 ea 48 c7 c7 1e d0 89 c0 48 89 c6 e8 19 20 76 d1 <0f> 0=
b e9
6d ff ff ff e8 1e 1d 76 d1 66 66 2e 0f 1f 84 00 00 00 00
[  469.931719] RSP: 0018:ffffaeea439bf570 EFLAGS: 00010282
[  469.931720] RAX: 0000000000000000 RBX: ffff9dee56cee400 RCX:
0000000000000006
[  469.931720] RDX: 0000000000000007 RSI: 0000000000000086 RDI:
ffff9dee9ea99a10
[  469.931721] RBP: 0000000000000001 R08: 0000000000001c4f R09:
0000000000000001
[  469.931721] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9dee962dc420
[  469.931721] R13: ffff9dee9e6f6110 R14: ffff9dee56c9d7c0 R15:
ffff9deddae1a2a0
[  469.931722] FS:  00007f2e72aa5880(0000) GS:ffff9dee9ea80000(0000)
knlGS:0000000000000000
[  469.931722] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  469.931723] CR2: 000055dc891692d0 CR3: 00000003cdf80002 CR4:
00000000003606e0
[  469.931723] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  469.931724] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  469.931724] Call Trace:
[  469.931740]  nvkm_vmm_iter.constprop.0+0x34b/0x810 [nouveau]
[  469.931756]  ? nvkm_vmm_sparse_unref_ptes+0x70/0x70 [nouveau]
[  469.931772]  ? gp100_vmm_join+0x20/0x20 [nouveau]
[  469.931787]  ? gf100_vmm_invalidate+0x122/0x1c0 [nouveau]
[  469.931803]  nvkm_vmm_ptes_get_map+0x2e/0x70 [nouveau]
[  469.931818]  ? nvkm_vmm_sparse_unref_ptes+0x70/0x70 [nouveau]
[  469.931833]  ? gp100_vmm_join+0x20/0x20 [nouveau]
[  469.931848]  nvkm_vmm_map+0x1cf/0x360 [nouveau]
[  469.931863]  nvkm_mem_map_dma+0x56/0x80 [nouveau]
[  469.931878]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[  469.931888]  nvkm_ioctl+0xde/0x180 [nouveau]
[  469.931903]  ? nvkm_uvmm_mthd+0x17f/0x780 [nouveau]
[  469.931912]  nvif_object_mthd+0x104/0x130 [nouveau]
[  469.931921]  ? nvif_object_mthd+0x117/0x130 [nouveau]
[  469.931929]  nvif_vmm_map+0x115/0x130 [nouveau]
[  469.931949]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[  469.931969]  nouveau_bo_move_m2mf.constprop.0+0x113/0x200 [nouveau]
[  469.931989]  nouveau_bo_move+0xa5/0x430 [nouveau]
[  469.932008]  ? nouveau_vma_map+0x44/0x70 [nouveau]
[  469.932011]  ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[  469.932013]  ttm_bo_validate+0x11b/0x130 [ttm]
[  469.932032]  nouveau_bo_validate+0x59/0x90 [nouveau]
[  469.932051]  nouveau_gem_ioctl_pushbuf+0x323/0xbd0 [nouveau]
[  469.932069]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  469.932076]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  469.932081]  drm_ioctl+0x1f7/0x390 [drm]
[  469.932099]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  469.932101]  ? try_to_wake_up+0x53/0x5f0
[  469.932120]  nouveau_drm_ioctl+0x63/0xb0 [nouveau]
[  469.932122]  do_vfs_ioctl+0x40e/0x670
[  469.932124]  ? do_futex+0x157/0x1d0
[  469.932124]  ksys_ioctl+0x5e/0x90
[  469.932126]  ? trace_hardirqs_off_thunk+0x1a/0x2e
[  469.932127]  __x64_sys_ioctl+0x16/0x20
[  469.932128]  do_syscall_64+0x6e/0x1e0
[  469.932129]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  469.932130] RIP: 0033:0x7f2e77a977c7
[  469.932130] Code: 00 00 90 48 8b 05 d1 86 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a1 86 0c 00 f7 d8 64 89 01 48
[  469.932131] RSP: 002b:00007ffc0c650ed8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  469.932131] RAX: ffffffffffffffda RBX: 00007ffc0c650f40 RCX:
00007f2e77a977c7
[  469.932132] RDX: 00007ffc0c650f40 RSI: 00000000c0406481 RDI:
0000000000000014
[  469.932132] RBP: 00000000c0406481 R08: 0000556220b378e0 R09:
000055622075a390
[  469.932133] R10: 00005562208d0e98 R11: 0000000000000246 R12:
0000556220af85c0
[  469.932133] R13: 0000000000000014 R14: 00005562207450c0 R15:
000055622075a390
[  469.932134] ---[ end trace 8a79010dd231cb3c ]---




PD. Motherboard is Gigabyte Z270-D3H with BIOS updated F8d

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695921041.DceCE8de.32712
Date: Fri, 27 Sep 2019 13:48:24 +0000
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
   title=3D"NEW - Resume fails after suspend with nouveau and Gtx 1050 ti"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111843">111843</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Resume fails after suspend with nouveau and Gtx 1050 ti
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jesaenh&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>My system is  Opensuse tumbleweed updated (kernel 5.2.XX) with=
 Kde (5.16).

This problems happens with nouveau (not with nvidia driver). Ift I resume a=
fter
suspend, Screen is not activated. I got this log in dmesg (via ssh):





[  469.931682] WARNING: CPU: 2 PID: 2178 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:221
gf100_vmm_invalidate+0x1a6/0x1c0 [nouveau]
[  469.931683] Modules linked in: cmac rfcomm af_packet libcrc32c vmnet(OE)
vmw_vsock_vmci_transport vsock vmw_vmci ip_set hid_logitech_hidpp nfnetlink
joydev vmmon(OE) scsi_transport_iscsi x_tables bpfilter intel_rapl snd_seq =
bnep
snd_seq_device snd_hda_codec_hdmi hid_logitech_dj x86_pkg_temp_thermal
intel_powerclamp kvm_intel iTCO_wdt kvm iTCO_vendor_support mei_hdcp irqbyp=
ass
hid_generic ppdev crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_i=
ntel
msr coretemp e1000e snd_hda_codec_realtek aes_x86_64 crypto_simd
snd_hda_codec_generic cryptd ptp i2c_i801 glue_helper pps_core ledtrig_audio
pcspkr snd_hda_intel snd_hda_codec btusb btrtl btbcm snd_hda_core btintel
snd_hwdep bluetooth snd_pcm snd_timer snd uas mei_me ecdh_generic rfkill
usb_storage pcc_cpufreq ecc usbhid usblp soundcore ipmi_devintf mei thermal=
 fan
parport_pc parport acpi_pad nls_iso8859_1 fuse nls_cp437 vfat fat
ipmi_msghandler nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper syscopyarea
sysfillrect sysimgblt fb_sys_fops
[  469.931696]  xhci_pci ttm xhci_hcd crc32c_intel drm usbcore video button=
 sg
dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs [last
unloaded: ip_tables]
[  469.931700] CPU: 2 PID: 2178 Comm: kwin_x11 Tainted: P        W  OE=20=
=20=20=20
5.2.14-1-default #1 openSUSE Tumbleweed (unreleased)
[  469.931700] Hardware name: Gigabyte Technology Co., Ltd.
Z270M-D3H/Z270M-D3H-CF, BIOS F8b 01/10/2018
[  469.931718] RIP: 0010:gf100_vmm_invalidate+0x1a6/0x1c0 [nouveau]
[  469.931719] Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 85 ed 75 03 4c 8b =
2f
e8 0c 9d d3 d1 4c 89 ea 48 c7 c7 1e d0 89 c0 48 89 c6 e8 19 20 76 d1 &lt;0f=
&gt; 0b e9
6d ff ff ff e8 1e 1d 76 d1 66 66 2e 0f 1f 84 00 00 00 00
[  469.931719] RSP: 0018:ffffaeea439bf570 EFLAGS: 00010282
[  469.931720] RAX: 0000000000000000 RBX: ffff9dee56cee400 RCX:
0000000000000006
[  469.931720] RDX: 0000000000000007 RSI: 0000000000000086 RDI:
ffff9dee9ea99a10
[  469.931721] RBP: 0000000000000001 R08: 0000000000001c4f R09:
0000000000000001
[  469.931721] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9dee962dc420
[  469.931721] R13: ffff9dee9e6f6110 R14: ffff9dee56c9d7c0 R15:
ffff9deddae1a2a0
[  469.931722] FS:  00007f2e72aa5880(0000) GS:ffff9dee9ea80000(0000)
knlGS:0000000000000000
[  469.931722] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  469.931723] CR2: 000055dc891692d0 CR3: 00000003cdf80002 CR4:
00000000003606e0
[  469.931723] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  469.931724] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  469.931724] Call Trace:
[  469.931740]  nvkm_vmm_iter.constprop.0+0x34b/0x810 [nouveau]
[  469.931756]  ? nvkm_vmm_sparse_unref_ptes+0x70/0x70 [nouveau]
[  469.931772]  ? gp100_vmm_join+0x20/0x20 [nouveau]
[  469.931787]  ? gf100_vmm_invalidate+0x122/0x1c0 [nouveau]
[  469.931803]  nvkm_vmm_ptes_get_map+0x2e/0x70 [nouveau]
[  469.931818]  ? nvkm_vmm_sparse_unref_ptes+0x70/0x70 [nouveau]
[  469.931833]  ? gp100_vmm_join+0x20/0x20 [nouveau]
[  469.931848]  nvkm_vmm_map+0x1cf/0x360 [nouveau]
[  469.931863]  nvkm_mem_map_dma+0x56/0x80 [nouveau]
[  469.931878]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[  469.931888]  nvkm_ioctl+0xde/0x180 [nouveau]
[  469.931903]  ? nvkm_uvmm_mthd+0x17f/0x780 [nouveau]
[  469.931912]  nvif_object_mthd+0x104/0x130 [nouveau]
[  469.931921]  ? nvif_object_mthd+0x117/0x130 [nouveau]
[  469.931929]  nvif_vmm_map+0x115/0x130 [nouveau]
[  469.931949]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[  469.931969]  nouveau_bo_move_m2mf.constprop.0+0x113/0x200 [nouveau]
[  469.931989]  nouveau_bo_move+0xa5/0x430 [nouveau]
[  469.932008]  ? nouveau_vma_map+0x44/0x70 [nouveau]
[  469.932011]  ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[  469.932013]  ttm_bo_validate+0x11b/0x130 [ttm]
[  469.932032]  nouveau_bo_validate+0x59/0x90 [nouveau]
[  469.932051]  nouveau_gem_ioctl_pushbuf+0x323/0xbd0 [nouveau]
[  469.932069]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  469.932076]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  469.932081]  drm_ioctl+0x1f7/0x390 [drm]
[  469.932099]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  469.932101]  ? try_to_wake_up+0x53/0x5f0
[  469.932120]  nouveau_drm_ioctl+0x63/0xb0 [nouveau]
[  469.932122]  do_vfs_ioctl+0x40e/0x670
[  469.932124]  ? do_futex+0x157/0x1d0
[  469.932124]  ksys_ioctl+0x5e/0x90
[  469.932126]  ? trace_hardirqs_off_thunk+0x1a/0x2e
[  469.932127]  __x64_sys_ioctl+0x16/0x20
[  469.932128]  do_syscall_64+0x6e/0x1e0
[  469.932129]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  469.932130] RIP: 0033:0x7f2e77a977c7
[  469.932130] Code: 00 00 90 48 8b 05 d1 86 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a1 86 0c 00 f7 d8 64 89 01 48
[  469.932131] RSP: 002b:00007ffc0c650ed8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  469.932131] RAX: ffffffffffffffda RBX: 00007ffc0c650f40 RCX:
00007f2e77a977c7
[  469.932132] RDX: 00007ffc0c650f40 RSI: 00000000c0406481 RDI:
0000000000000014
[  469.932132] RBP: 00000000c0406481 R08: 0000556220b378e0 R09:
000055622075a390
[  469.932133] R10: 00005562208d0e98 R11: 0000000000000246 R12:
0000556220af85c0
[  469.932133] R13: 0000000000000014 R14: 00005562207450c0 R15:
000055622075a390
[  469.932134] ---[ end trace 8a79010dd231cb3c ]---




PD. Motherboard is Gigabyte Z270-D3H with BIOS updated F8d</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695921041.DceCE8de.32712--

--===============2024294343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2024294343==--
