Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6D2848F
	for <lists+nouveau@lfdr.de>; Thu, 23 May 2019 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4196E03F;
	Thu, 23 May 2019 17:10:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C750E89F08
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 17:10:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C3ECB72167; Thu, 23 May 2019 17:10:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 23 May 2019 17:10:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dominik@greysector.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110748-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110748] New: [NVC1] [optimus] fifo: read fault at
 0000000000 engine 00 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]
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
Content-Type: multipart/mixed; boundary="===============0768321203=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0768321203==
Content-Type: multipart/alternative; boundary="15586314110.bbc6d95.19034"
Content-Transfer-Encoding: 7bit


--15586314110.bbc6d95.19034
Date: Thu, 23 May 2019 17:10:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110748

            Bug ID: 110748
           Summary: [NVC1] [optimus] fifo: read fault at 0000000000 engine
                    00 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: dominik@greysector.net
        QA Contact: xorg-team@lists.x.org

When trying to play a video using mpv with VDPAU hardware acceleration on a
GF108M/GeForce GT 525M (second GPU in Optimus configuration on this machine=
):

DRI_PRIME=3D1 mpv -vo=3Dgpu --hwdec=3Dvdpau any_h264_video.mp4

Xorg starts using 100% of one core and the following can be seen in the log=
s:

May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: read fault at 0000000000
engine 00 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT] on channel 2
[003fc12000 Xorg[2935]]
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: gr engine fault on chan=
nel
2, recovering...
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00800000
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: ------------[ cut here ]------------
May 21 14:41:25 kernel: nouveau 0000:01:00.0: timeout
May 21 14:41:25 kernel: WARNING: CPU: 0 PID: 5655 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 21 14:41:25 kernel: Modules linked in: nouveau mxm_wmi ttm sunrpc fuse
snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops
snd_hda_codec_realtek arc4 videobuf2_v4l2 snd_hda_codec_generic intel_rapl
videobuf2_common snd_hd>
May 21 14:41:25 kernel: CPU: 0 PID: 5655 Comm: mpv Not tainted
5.0.16-300.fc30.x86_64 #1
May 21 14:41:25 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 21 14:41:25 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 21 14:41:25 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 b7 71 e0 48 89 ea 48 c7 c7 62 19 04 c1 48 89 c6 e8 1f 9a 1c =
e0
<0f> 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 ce
May 21 14:41:25 kernel: RSP: 0018:ffffbad7025dfc78 EFLAGS: 00010286
May 21 14:41:25 kernel: RAX: 0000000000000000 RBX: ffffa034f1a0e000 RCX:
0000000000000006
May 21 14:41:25 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffffa035ba2168c0
May 21 14:41:25 kernel: RBP: ffffa035b8f8df10 R08: 0000000000000001 R09:
00000000000012e7
May 21 14:41:25 kernel: R10: 000000000003bc20 R11: 0000000000000003 R12:
0000000000000250
May 21 14:41:25 kernel: R13: ffffa035a3bebc00 R14: ffffa0351beac600 R15:
ffffa035a3bebc28
May 21 14:41:25 kernel: FS:  00007f4949f3af00(0000) GS:ffffa035ba200000(000=
0)
knlGS:0000000000000000
May 21 14:41:25 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 21 14:41:25 kernel: CR2: 00007fd899fcf700 CR3: 0000000072bc2001 CR4:
00000000000606f0
May 21 14:41:25 kernel: Call Trace:
May 21 14:41:25 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 21 14:41:25 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 21 14:41:25 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 21 14:41:25 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 21 14:41:25 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 21 14:41:25 kernel:  ? nvkm_ioctl+0x71/0x180 [nouveau]
May 21 14:41:25 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 21 14:41:25 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 21 14:41:25 kernel:  do_vfs_ioctl+0x405/0x660
May 21 14:41:25 kernel:  ksys_ioctl+0x5e/0x90
May 21 14:41:25 kernel:  __x64_sys_ioctl+0x16/0x20
May 21 14:41:25 kernel:  do_syscall_64+0x5b/0x170
May 21 14:41:25 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 21 14:41:25 kernel: RIP: 0033:0x7f494f39f03b
May 21 14:41:25 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 21 14:41:25 kernel: RSP: 002b:00007ffeba992ae8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 21 14:41:25 kernel: RAX: ffffffffffffffda RBX: 00007ffeba992b30 RCX:
00007f494f39f03b
May 21 14:41:25 kernel: RDX: 00007ffeba992b30 RSI: 00000000c0186447 RDI:
0000000000000010
May 21 14:41:25 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 21 14:41:25 kernel: R10: 000055983dd90bb0 R11: 0000000000000246 R12:
0000000000000003
May 21 14:41:25 kernel: R13: 0000000000000010 R14: 000055983db62db8 R15:
000055983db62db8
May 21 14:41:25 kernel: ---[ end trace c64308a1ea709e8f ]---
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: channel 4 [mpv/vo[5662]]
kick timeout
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau: mpv/vo[5662]:00000000:0000906f: detach msp=
dec
failed, -110
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:27 kernel: ------------[ cut here ]------------
May 21 14:41:27 kernel: nouveau 0000:01:00.0: timeout
May 21 14:41:27 kernel: WARNING: CPU: 2 PID: 5655 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 21 14:41:27 kernel: Modules linked in: nouveau mxm_wmi ttm sunrpc fuse
snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops
snd_hda_codec_realtek arc4 videobuf2_v4l2 snd_hda_codec_generic intel_rapl
videobuf2_common snd_hd>
May 21 14:41:27 kernel: CPU: 2 PID: 5655 Comm: mpv Tainted: G        W=20=
=20=20=20=20=20=20=20
5.0.16-300.fc30.x86_64 #1
May 21 14:41:27 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 21 14:41:27 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 21 14:41:27 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 b7 71 e0 48 89 ea 48 c7 c7 62 19 04 c1 48 89 c6 e8 1f 9a 1c =
e0
<0f> 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 ce
May 21 14:41:27 kernel: RSP: 0018:ffffbad7025dfc78 EFLAGS: 00010286
May 21 14:41:27 kernel: RAX: 0000000000000000 RBX: ffffa034f1a0e000 RCX:
0000000000000006
May 21 14:41:27 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffffa035ba2968c0
May 21 14:41:27 kernel: RBP: ffffa035b8f8df10 R08: 0000000000000001 R09:
000000000000192d
May 21 14:41:27 kernel: R10: 0000000000026020 R11: 0000000000000003 R12:
0000000000000260
May 21 14:41:27 kernel: R13: ffffa035a3bebc00 R14: ffffa0351beac600 R15:
ffffa035a3bebc28
May 21 14:41:27 kernel: FS:  00007f4949f3af00(0000) GS:ffffa035ba280000(000=
0)
knlGS:0000000000000000
May 21 14:41:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 21 14:41:27 kernel: CR2: 00007fd89c139000 CR3: 0000000072bc2002 CR4:
00000000000606e0
May 21 14:41:27 kernel: Call Trace:
May 21 14:41:27 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 21 14:41:27 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 21 14:41:27 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 21 14:41:27 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 21 14:41:27 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 21 14:41:27 kernel:  ? nvkm_ioctl+0x71/0x180 [nouveau]
May 21 14:41:27 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 21 14:41:27 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 21 14:41:27 kernel:  do_vfs_ioctl+0x405/0x660
May 21 14:41:27 kernel:  ksys_ioctl+0x5e/0x90
May 21 14:41:27 kernel:  __x64_sys_ioctl+0x16/0x20
May 21 14:41:27 kernel:  do_syscall_64+0x5b/0x170
May 21 14:41:27 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 21 14:41:27 kernel: RIP: 0033:0x7f494f39f03b
May 21 14:41:27 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 21 14:41:27 kernel: RSP: 002b:00007ffeba992ae8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 21 14:41:27 kernel: RAX: ffffffffffffffda RBX: 00007ffeba992b30 RCX:
00007f494f39f03b
May 21 14:41:27 kernel: RDX: 00007ffeba992b30 RSI: 00000000c0186447 RDI:
0000000000000010
May 21 14:41:27 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 21 14:41:27 kernel: R10: 000055983dd90bb0 R11: 0000000000000246 R12:
0000000000000003
May 21 14:41:27 kernel: R13: 0000000000000010 R14: 000055983db62db8 R15:
000055983db62db8
May 21 14:41:27 kernel: ---[ end trace c64308a1ea709e90 ]---
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: channel 4 [mpv/vo[5662]]
kick timeout
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:27 kernel: nouveau: mpv/vo[5662]:00000000:0000906f: detach msp=
pp
failed, -110
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
and so on.

Machine can be gracefully shut down, though it takes a while. Other than th=
at
it becomes almost unusable due to high CPU usage by Xorg.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586314110.bbc6d95.19034
Date: Thu, 23 May 2019 17:10:11 +0000
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
   title=3D"NEW - [NVC1] [optimus] fifo: read fault at 0000000000 engine 00=
 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110748">110748</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC1] [optimus] fifo: read fault at 0000000000 engine 00 [PG=
RAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]
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
          <td>dominik&#64;greysector.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When trying to play a video using mpv with VDPAU hardware acce=
leration on a
GF108M/GeForce GT 525M (second GPU in Optimus configuration on this machine=
):

DRI_PRIME=3D1 mpv -vo=3Dgpu --hwdec=3Dvdpau any_h264_video.mp4

Xorg starts using 100% of one core and the following can be seen in the log=
s:

May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: read fault at 0000000000
engine 00 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT] on channel 2
[003fc12000 Xorg[2935]]
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: gr engine fault on chan=
nel
2, recovering...
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00800000
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:21 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: ------------[ cut here ]------------
May 21 14:41:25 kernel: nouveau 0000:01:00.0: timeout
May 21 14:41:25 kernel: WARNING: CPU: 0 PID: 5655 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 21 14:41:25 kernel: Modules linked in: nouveau mxm_wmi ttm sunrpc fuse
snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops
snd_hda_codec_realtek arc4 videobuf2_v4l2 snd_hda_codec_generic intel_rapl
videobuf2_common snd_hd&gt;
May 21 14:41:25 kernel: CPU: 0 PID: 5655 Comm: mpv Not tainted
5.0.16-300.fc30.x86_64 #1
May 21 14:41:25 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 21 14:41:25 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 21 14:41:25 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 b7 71 e0 48 89 ea 48 c7 c7 62 19 04 c1 48 89 c6 e8 1f 9a 1c =
e0
&lt;0f&gt; 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 ce
May 21 14:41:25 kernel: RSP: 0018:ffffbad7025dfc78 EFLAGS: 00010286
May 21 14:41:25 kernel: RAX: 0000000000000000 RBX: ffffa034f1a0e000 RCX:
0000000000000006
May 21 14:41:25 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffffa035ba2168c0
May 21 14:41:25 kernel: RBP: ffffa035b8f8df10 R08: 0000000000000001 R09:
00000000000012e7
May 21 14:41:25 kernel: R10: 000000000003bc20 R11: 0000000000000003 R12:
0000000000000250
May 21 14:41:25 kernel: R13: ffffa035a3bebc00 R14: ffffa0351beac600 R15:
ffffa035a3bebc28
May 21 14:41:25 kernel: FS:  00007f4949f3af00(0000) GS:ffffa035ba200000(000=
0)
knlGS:0000000000000000
May 21 14:41:25 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 21 14:41:25 kernel: CR2: 00007fd899fcf700 CR3: 0000000072bc2001 CR4:
00000000000606f0
May 21 14:41:25 kernel: Call Trace:
May 21 14:41:25 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 21 14:41:25 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 21 14:41:25 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 21 14:41:25 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 21 14:41:25 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 21 14:41:25 kernel:  ? nvkm_ioctl+0x71/0x180 [nouveau]
May 21 14:41:25 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 21 14:41:25 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 21 14:41:25 kernel:  do_vfs_ioctl+0x405/0x660
May 21 14:41:25 kernel:  ksys_ioctl+0x5e/0x90
May 21 14:41:25 kernel:  __x64_sys_ioctl+0x16/0x20
May 21 14:41:25 kernel:  do_syscall_64+0x5b/0x170
May 21 14:41:25 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 21 14:41:25 kernel: RIP: 0033:0x7f494f39f03b
May 21 14:41:25 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 21 14:41:25 kernel: RSP: 002b:00007ffeba992ae8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 21 14:41:25 kernel: RAX: ffffffffffffffda RBX: 00007ffeba992b30 RCX:
00007f494f39f03b
May 21 14:41:25 kernel: RDX: 00007ffeba992b30 RSI: 00000000c0186447 RDI:
0000000000000010
May 21 14:41:25 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 21 14:41:25 kernel: R10: 000055983dd90bb0 R11: 0000000000000246 R12:
0000000000000003
May 21 14:41:25 kernel: R13: 0000000000000010 R14: 000055983db62db8 R15:
000055983db62db8
May 21 14:41:25 kernel: ---[ end trace c64308a1ea709e8f ]---
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: channel 4 [mpv/vo[5662]]
kick timeout
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau: mpv/vo[5662]:00000000:0000906f: detach msp=
dec
failed, -110
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 21 14:41:25 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:27 kernel: ------------[ cut here ]------------
May 21 14:41:27 kernel: nouveau 0000:01:00.0: timeout
May 21 14:41:27 kernel: WARNING: CPU: 2 PID: 5655 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 21 14:41:27 kernel: Modules linked in: nouveau mxm_wmi ttm sunrpc fuse
snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops
snd_hda_codec_realtek arc4 videobuf2_v4l2 snd_hda_codec_generic intel_rapl
videobuf2_common snd_hd&gt;
May 21 14:41:27 kernel: CPU: 2 PID: 5655 Comm: mpv Tainted: G        W=20=
=20=20=20=20=20=20=20
5.0.16-300.fc30.x86_64 #1
May 21 14:41:27 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 21 14:41:27 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 21 14:41:27 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 b7 71 e0 48 89 ea 48 c7 c7 62 19 04 c1 48 89 c6 e8 1f 9a 1c =
e0
&lt;0f&gt; 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 ce
May 21 14:41:27 kernel: RSP: 0018:ffffbad7025dfc78 EFLAGS: 00010286
May 21 14:41:27 kernel: RAX: 0000000000000000 RBX: ffffa034f1a0e000 RCX:
0000000000000006
May 21 14:41:27 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffffa035ba2968c0
May 21 14:41:27 kernel: RBP: ffffa035b8f8df10 R08: 0000000000000001 R09:
000000000000192d
May 21 14:41:27 kernel: R10: 0000000000026020 R11: 0000000000000003 R12:
0000000000000260
May 21 14:41:27 kernel: R13: ffffa035a3bebc00 R14: ffffa0351beac600 R15:
ffffa035a3bebc28
May 21 14:41:27 kernel: FS:  00007f4949f3af00(0000) GS:ffffa035ba280000(000=
0)
knlGS:0000000000000000
May 21 14:41:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 21 14:41:27 kernel: CR2: 00007fd89c139000 CR3: 0000000072bc2002 CR4:
00000000000606e0
May 21 14:41:27 kernel: Call Trace:
May 21 14:41:27 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 21 14:41:27 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 21 14:41:27 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 21 14:41:27 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 21 14:41:27 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 21 14:41:27 kernel:  ? nvkm_ioctl+0x71/0x180 [nouveau]
May 21 14:41:27 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 21 14:41:27 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 21 14:41:27 kernel:  do_vfs_ioctl+0x405/0x660
May 21 14:41:27 kernel:  ksys_ioctl+0x5e/0x90
May 21 14:41:27 kernel:  __x64_sys_ioctl+0x16/0x20
May 21 14:41:27 kernel:  do_syscall_64+0x5b/0x170
May 21 14:41:27 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 21 14:41:27 kernel: RIP: 0033:0x7f494f39f03b
May 21 14:41:27 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 21 14:41:27 kernel: RSP: 002b:00007ffeba992ae8 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 21 14:41:27 kernel: RAX: ffffffffffffffda RBX: 00007ffeba992b30 RCX:
00007f494f39f03b
May 21 14:41:27 kernel: RDX: 00007ffeba992b30 RSI: 00000000c0186447 RDI:
0000000000000010
May 21 14:41:27 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 21 14:41:27 kernel: R10: 000055983dd90bb0 R11: 0000000000000246 R12:
0000000000000003
May 21 14:41:27 kernel: R13: 0000000000000010 R14: 000055983db62db8 R15:
000055983db62db8
May 21 14:41:27 kernel: ---[ end trace c64308a1ea709e90 ]---
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: channel 4 [mpv/vo[5662]]
kick timeout
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
May 21 14:41:27 kernel: nouveau: mpv/vo[5662]:00000000:0000906f: detach msp=
pp
failed, -110
May 21 14:41:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00010000: 00000002
[...]
and so on.

Machine can be gracefully shut down, though it takes a while. Other than th=
at
it becomes almost unusable due to high CPU usage by Xorg.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586314110.bbc6d95.19034--

--===============0768321203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0768321203==--
