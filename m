Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53F552F6
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 17:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65736E143;
	Tue, 25 Jun 2019 15:09:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C2EB6E13D
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 15:09:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3342D72167; Tue, 25 Jun 2019 15:09:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 15:09:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sjon@hortensius.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110996-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110996] New: swaywm (wayland) crashes when turning
 off monitors through dpms
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
Content-Type: multipart/mixed; boundary="===============1946325793=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1946325793==
Content-Type: multipart/alternative; boundary="15614753950.33d8BF.32237"
Content-Transfer-Encoding: 7bit


--15614753950.33d8BF.32237
Date: Tue, 25 Jun 2019 15:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110996

            Bug ID: 110996
           Summary: swaywm (wayland) crashes when turning off monitors
                    through dpms
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: sjon@hortensius.net
        QA Contact: xorg-team@lists.x.org

My wayland setup always crashes when powering my 2 DP monitors down through
dpms. Afterwards I can't get the monitors to power on (through ssh) - only =
fix
is a reboot.
This is a GTX 1080 Ti btw

nouveau 0000:01:00.0: NVIDIA GP102 (132000a1)
nouveau 0000:01:00.0: bios: version 86.02.39.00.3d
nouveau 0000:01:00.0: fb: 11264 MiB GDDR5X
[TTM] Zone  kernel: Available graphics memory: 16407230 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:01:00.0: DRM: VRAM: 11264 MiB
nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 00020030
nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 00020020
nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 00020010
nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020020
nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600010
nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020010
nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
nouveau 0000:01:00.0: DRM: DCB conn 03: 00020361
nouveau 0000:01:00.0: DRM: DCB conn 04: 00010446
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1

...

nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616e18 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616d48 [ IBUS ]
nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616618 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616618 [ IBUS ]
nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout

..repeated for ~ an hour, unknown cause...

BUG: unable to handle kernel paging request at ffffaa2b3e7f6000
#PF error: [WRITE]
PGD 80ed39067 P4D 80ed39067 PUD 0=20
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 7 PID: 728 Comm: sway Tainted: G           OE     5.1.14-arch1-1-ARCH =
#1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z77 Extreme4, =
BIOS
P2.90 07/11/2013
RIP: 0010:evo_wait+0x5a/0x130 [nouveau]
Code: 00 00 c1 eb 02 4c 89 f7 e8 b3 64 c2 d5 89 da 44 01 e3 48 8d 04 95 00 =
00
00 00 81 fb f7 03 00 00 0f 86 86 00 00 00 48 8b 45 70 <c7> 04 90 00 00 00 2=
0 f6
45 58 01 74 09 48 8b 7d 28 e8 50 e2 ff ff
RSP: 0018:ffffaa2a838cbae0 EFLAGS: 00010212
RAX: ffffaa2a83a05000 RBX: 000000002eb7c402 RCX: ffff8ecc7dc1b000
RDX: 000000002eb7c400 RSI: 0000000000000002 RDI: ffff8ecc7a84ec10
RBP: ffff8ecc7a84eb48 R08: 0000000000000000 R09: 0000000000000004
R10: ffff8ecc8ec03980 R11: ffff8ecc8933f600 R12: 0000000000000002
R13: ffff8ecc893be350 R14: ffff8ecc7a84ec10 R15: ffff8ecc893be000
FS:  00007fe98e9c53c0(0000) GS:ffff8ecc8f1c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffaa2b3e7f6000 CR3: 00000007e4196004 CR4: 00000000000606e0
Call Trace:
 base507c_update+0x20/0x70 [nouveau]
 nv50_disp_atomic_commit_wndw.isra.0+0x5e/0x80 [nouveau]
 nv50_disp_atomic_commit_tail+0x4bb/0x6c0 [nouveau]
 nv50_disp_atomic_commit+0x16d/0x1f0 [nouveau]
 drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
 drm_mode_obj_set_property_ioctl+0x159/0x2b0 [drm]
 ? drm_connector_set_obj_prop+0x90/0x90 [drm]
 drm_connector_property_set_ioctl+0x39/0x60 [drm]
 drm_ioctl_kernel+0xb0/0xf0 [drm]
 drm_ioctl+0x233/0x400 [drm]
 ? drm_connector_set_obj_prop+0x90/0x90 [drm]
 ? unix_stream_recvmsg+0x53/0x70
 ? unix_state_double_unlock+0x40/0x40
 nouveau_drm_ioctl+0x63/0xb0 [nouveau]
 do_vfs_ioctl+0x40c/0x670
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x5b/0x190
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fe99088804b
Code: 0f 1e fa 48 8b 05 45 8e 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff =
ff
c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 15 8e 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc2148a5f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055fafaabcc00 RCX: 00007fe99088804b
RDX: 00007ffc2148a630 RSI: 00000000c01064ab RDI: 0000000000000009
RBP: 00007ffc2148a630 R08: 000055fafb0fd9d0 R09: 000055fafb0fd9a0
R10: 0000000000000007 R11: 0000000000000246 R12: 00000000c01064ab
R13: 0000000000000009 R14: 000055fafaabf670 R15: 000055fafaabf674
Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd
grace fscache nct6775 hwmon_vid sunrpc snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio intel_rapl x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm irqbypass snd_hda_codec_hdmi i915
nls_iso8859_1 nouveau nls_cp437 vfat fat crct1 scsi_mod xhci_hcd ehci_pci
ehci_hcd bna
CR2: ffffaa2b3e7f6000
---[ end trace 48fbd0db141b831f ]---
RIP: 0010:evo_wait+0x5a/0x130 [nouveau]
Code: 00 00 c1 eb 02 4c 89 f7 e8 b3 64 c2 d5 89 da 44 01 e3 48 8d 04 95 00 =
00
00 00 81 fb f7 03 00 00 0f 86 86 00 00 00 48 8b 45 70 <c7> 04 90 00 00 00 2=
0 f6
45 58 01 74 09 48 8b 7d 28 e8 50 e2 ff ff
RSP: 0018:ffffaa2a838cbae0 EFLAGS: 00010212
RAX: ffffaa2a83a05000 RBX: 000000002eb7c402 RCX: ffff8ecc7dc1b000
RDX: 000000002eb7c400 RSI: 0000000000000002 RDI: ffff8ecc7a84ec10
RBP: ffff8ecc7a84eb48 R08: 0000000000000000 R09: 0000000000000004
R10: ffff8ecc8ec03980 R11: ffff8ecc8933f600 R12: 0000000000000002
R13: ffff8ecc893be350 R14: ffff8ecc7a84ec10 R15: ffff8ecc893be000
FS:  00007fe98e9c53c0(0000) GS:ffff8ecc8f1c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffaa2b3e7f6000 CR3: 00000007e4196004 CR4: 00000000000606e0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614753950.33d8BF.32237
Date: Tue, 25 Jun 2019 15:09:55 +0000
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
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996">110996</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>swaywm (wayland) crashes when turning off monitors through dp=
ms
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
          <td>x86 (IA32)
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>sjon&#64;hortensius.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>My wayland setup always crashes when powering my 2 DP monitors=
 down through
dpms. Afterwards I can't get the monitors to power on (through ssh) - only =
fix
is a reboot.
This is a GTX 1080 Ti btw

nouveau 0000:01:00.0: NVIDIA GP102 (132000a1)
nouveau 0000:01:00.0: bios: version 86.02.39.00.3d
nouveau 0000:01:00.0: fb: 11264 MiB GDDR5X
[TTM] Zone  kernel: Available graphics memory: 16407230 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:01:00.0: DRM: VRAM: 11264 MiB
nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 00020030
nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 00020020
nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 00020010
nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020020
nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600010
nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020010
nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
nouveau 0000:01:00.0: DRM: DCB conn 03: 00020361
nouveau 0000:01:00.0: DRM: DCB conn 04: 00010446
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1

...

nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616e18 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616d48 [ IBUS ]
nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616618 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 616618 [ IBUS ]
nouveau 0000:01:00.0: DRM: core notifier timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout
nouveau 0000:01:00.0: DRM: base-1: timeout
nouveau 0000:01:00.0: DRM: base-0: timeout

..repeated for ~ an hour, unknown cause...

BUG: unable to handle kernel paging request at ffffaa2b3e7f6000
#PF error: [WRITE]
PGD 80ed39067 P4D 80ed39067 PUD 0=20
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 7 PID: 728 Comm: sway Tainted: G           OE     5.1.14-arch1-1-ARCH =
#1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z77 Extreme4, =
BIOS
P2.90 07/11/2013
RIP: 0010:evo_wait+0x5a/0x130 [nouveau]
Code: 00 00 c1 eb 02 4c 89 f7 e8 b3 64 c2 d5 89 da 44 01 e3 48 8d 04 95 00 =
00
00 00 81 fb f7 03 00 00 0f 86 86 00 00 00 48 8b 45 70 &lt;c7&gt; 04 90 00 0=
0 00 20 f6
45 58 01 74 09 48 8b 7d 28 e8 50 e2 ff ff
RSP: 0018:ffffaa2a838cbae0 EFLAGS: 00010212
RAX: ffffaa2a83a05000 RBX: 000000002eb7c402 RCX: ffff8ecc7dc1b000
RDX: 000000002eb7c400 RSI: 0000000000000002 RDI: ffff8ecc7a84ec10
RBP: ffff8ecc7a84eb48 R08: 0000000000000000 R09: 0000000000000004
R10: ffff8ecc8ec03980 R11: ffff8ecc8933f600 R12: 0000000000000002
R13: ffff8ecc893be350 R14: ffff8ecc7a84ec10 R15: ffff8ecc893be000
FS:  00007fe98e9c53c0(0000) GS:ffff8ecc8f1c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffaa2b3e7f6000 CR3: 00000007e4196004 CR4: 00000000000606e0
Call Trace:
 base507c_update+0x20/0x70 [nouveau]
 nv50_disp_atomic_commit_wndw.isra.0+0x5e/0x80 [nouveau]
 nv50_disp_atomic_commit_tail+0x4bb/0x6c0 [nouveau]
 nv50_disp_atomic_commit+0x16d/0x1f0 [nouveau]
 drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
 drm_mode_obj_set_property_ioctl+0x159/0x2b0 [drm]
 ? drm_connector_set_obj_prop+0x90/0x90 [drm]
 drm_connector_property_set_ioctl+0x39/0x60 [drm]
 drm_ioctl_kernel+0xb0/0xf0 [drm]
 drm_ioctl+0x233/0x400 [drm]
 ? drm_connector_set_obj_prop+0x90/0x90 [drm]
 ? unix_stream_recvmsg+0x53/0x70
 ? unix_state_double_unlock+0x40/0x40
 nouveau_drm_ioctl+0x63/0xb0 [nouveau]
 do_vfs_ioctl+0x40c/0x670
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x5b/0x190
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fe99088804b
Code: 0f 1e fa 48 8b 05 45 8e 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff =
ff
c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48&gt; 3d 01 f0 f=
f ff 73 01
c3 48 8b 0d 15 8e 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc2148a5f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055fafaabcc00 RCX: 00007fe99088804b
RDX: 00007ffc2148a630 RSI: 00000000c01064ab RDI: 0000000000000009
RBP: 00007ffc2148a630 R08: 000055fafb0fd9d0 R09: 000055fafb0fd9a0
R10: 0000000000000007 R11: 0000000000000246 R12: 00000000c01064ab
R13: 0000000000000009 R14: 000055fafaabf670 R15: 000055fafaabf674
Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd
grace fscache nct6775 hwmon_vid sunrpc snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio intel_rapl x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm irqbypass snd_hda_codec_hdmi i915
nls_iso8859_1 nouveau nls_cp437 vfat fat crct1 scsi_mod xhci_hcd ehci_pci
ehci_hcd bna
CR2: ffffaa2b3e7f6000
---[ end trace 48fbd0db141b831f ]---
RIP: 0010:evo_wait+0x5a/0x130 [nouveau]
Code: 00 00 c1 eb 02 4c 89 f7 e8 b3 64 c2 d5 89 da 44 01 e3 48 8d 04 95 00 =
00
00 00 81 fb f7 03 00 00 0f 86 86 00 00 00 48 8b 45 70 &lt;c7&gt; 04 90 00 0=
0 00 20 f6
45 58 01 74 09 48 8b 7d 28 e8 50 e2 ff ff
RSP: 0018:ffffaa2a838cbae0 EFLAGS: 00010212
RAX: ffffaa2a83a05000 RBX: 000000002eb7c402 RCX: ffff8ecc7dc1b000
RDX: 000000002eb7c400 RSI: 0000000000000002 RDI: ffff8ecc7a84ec10
RBP: ffff8ecc7a84eb48 R08: 0000000000000000 R09: 0000000000000004
R10: ffff8ecc8ec03980 R11: ffff8ecc8933f600 R12: 0000000000000002
R13: ffff8ecc893be350 R14: ffff8ecc7a84ec10 R15: ffff8ecc893be000
FS:  00007fe98e9c53c0(0000) GS:ffff8ecc8f1c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffaa2b3e7f6000 CR3: 00000007e4196004 CR4: 00000000000606e0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614753950.33d8BF.32237--

--===============1946325793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1946325793==--
