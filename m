Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410E28D9F
	for <lists+nouveau@lfdr.de>; Fri, 24 May 2019 01:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5463B89FC8;
	Thu, 23 May 2019 23:09:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CEA36E083
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 23:09:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 87009721A2; Thu, 23 May 2019 23:09:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 23 May 2019 23:09:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110748-8800-9HWflwOegC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110748-8800@http.bugs.freedesktop.org/>
References: <bug-110748-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110748] [NVC1] [optimus] fifo: read fault at
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
Content-Type: multipart/mixed; boundary="===============0380698919=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0380698919==
Content-Type: multipart/alternative; boundary="15586529452.4c4B7aD2b.4659"
Content-Transfer-Encoding: 7bit


--15586529452.4c4B7aD2b.4659
Date: Thu, 23 May 2019 23:09:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110748

--- Comment #2 from Dominik 'Rathann' Mierzejewski <dominik@greysector.net>=
 ---
(In reply to Ilia Mirkin from comment #1)
> Is there a -vo=3Dvdpau? If so, that's likely to work better. I suspect vo=
=3Dgpu
> becomes GL, and GL + vdpau in separate threads =3D disaster.

Thanks for the tip, but with --vo=3Dvdpau, it's still misbehaving, only a b=
it
different. It displays garbage instead of correct picture in the video wind=
ow
and then times out:

May 23 22:55:37 kernel: Asynchronous wait on fence nouveau:Xorg[849]:b73fb5=
50
timed out (hint:submit_notify+0x0/0x54 [i915])
May 23 22:55:38 kernel: nouveau 0000:01:00.0: mpv/vo[2433]: failed to idle
channel 4 [mpv/vo[2433]]
May 23 22:55:48 kernel: Asynchronous wait on fence nouveau:Xorg[849]:b73fb5=
51
timed out (hint:submit_notify+0x0/0x54 [i915])
May 23 22:55:53 kernel: nouveau 0000:01:00.0: mpv/vo[2433]: failed to idle
channel 4 [mpv/vo[2433]]
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 23 22:55:57 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:58:10 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 4 [mpv/vo[2619]]
May 23 22:58:25 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 4 [mpv/vo[2619]]
May 23 22:58:27 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:58:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b
May 23 22:59:28 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 22:59:28 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:02 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:02 kernel: ------------[ cut here ]------------
May 23 23:01:02 kernel: nouveau 0000:01:00.0: timeout
May 23 23:01:02 kernel: WARNING: CPU: 1 PID: 2619 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 23 23:01:02 kernel: Modules linked in: sunrpc fuse uvcvideo arc4
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 iwldvm videobuf2_common
snd_hda_codec_hdmi mac80211 videodev snd_hda_codec_realtek media
snd_hda_codec_generic snd_hd>
May 23 23:01:02 kernel: CPU: 1 PID: 2619 Comm: mpv/vo Not tainted
5.0.16-300.fc30.x86_64 #1
May 23 23:01:02 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 23 23:01:02 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 23 23:01:02 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 47 fe d8 48 89 ea 48 c7 c7 62 89 77 c0 48 89 c6 e8 1f 2a a9 =
d8
<0f> 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 5e
May 23 23:01:02 kernel: RSP: 0018:ffffbc5588733c78 EFLAGS: 00010286
May 23 23:01:02 kernel: RAX: 0000000000000000 RBX: ffff90b43623c000 RCX:
0000000000000006
May 23 23:01:02 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff90b43a4568c0
May 23 23:01:02 kernel: RBP: ffff90b43938dec0 R08: 0000000000000001 R09:
0000000000000628
May 23 23:01:02 kernel: R10: 0000000000025628 R11: 0000000000000003 R12:
0000000000000210
May 23 23:01:02 kernel: R13: ffff90b4328f8000 R14: ffff90b433463480 R15:
ffff90b4328f8028
May 23 23:01:02 kernel: FS:  00007f383e522700(0000) GS:ffff90b43a440000(000=
0)
knlGS:0000000000000000
May 23 23:01:02 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 23 23:01:02 kernel: CR2: 00007ffb9c3ce810 CR3: 000000010c14a003 CR4:
00000000000606e0
May 23 23:01:02 kernel: Call Trace:
May 23 23:01:02 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 23 23:01:02 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 23 23:01:02 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 23 23:01:02 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 23 23:01:02 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 23 23:01:02 kernel:  ? current_time+0x31/0x80
May 23 23:01:02 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 23 23:01:02 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 23 23:01:02 kernel:  do_vfs_ioctl+0x405/0x660
May 23 23:01:02 kernel:  ? __fput+0x154/0x220
May 23 23:01:02 kernel:  ksys_ioctl+0x5e/0x90
May 23 23:01:02 kernel:  __x64_sys_ioctl+0x16/0x20
May 23 23:01:02 kernel:  do_syscall_64+0x5b/0x170
May 23 23:01:02 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 23 23:01:02 kernel: RIP: 0033:0x7f384636b03b
May 23 23:01:02 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 23 23:01:02 kernel: RSP: 002b:00007f383e521448 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 23 23:01:02 kernel: RAX: ffffffffffffffda RBX: 00007f383e521490 RCX:
00007f384636b03b
May 23 23:01:02 kernel: RDX: 00007f383e521490 RSI: 00000000c0186447 RDI:
0000000000000010
May 23 23:01:02 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 23 23:01:02 kernel: R10: 00007f3828317288 R11: 0000000000000246 R12:
00007f3828360b20
May 23 23:01:02 kernel: R13: 0000000000000010 R14: 000055d8fb40ac18 R15:
000055d8fc826d44
May 23 23:01:02 kernel: ---[ end trace ee9484a5eb356969 ]---
May 23 23:01:02 kernel: nouveau 0000:01:00.0: fifo: channel 3 [mpv/vo[2619]]
kick timeout
May 23 23:01:02 kernel: nouveau: mpv/vo[2619]:00000000:0000906f: detach gr
failed, -110
May 23 23:01:02 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:04 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:04 kernel: ------------[ cut here ]------------
May 23 23:01:04 kernel: nouveau 0000:01:00.0: timeout
May 23 23:01:04 kernel: WARNING: CPU: 0 PID: 2619 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 23 23:01:04 kernel: Modules linked in: sunrpc fuse uvcvideo arc4
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 iwldvm videobuf2_common
snd_hda_codec_hdmi mac80211 videodev snd_hda_codec_realtek media
snd_hda_codec_generic snd_hd>
May 23 23:01:04 kernel: CPU: 0 PID: 2619 Comm: mpv/vo Tainted: G        W=
=20=20=20=20=20=20
  5.0.16-300.fc30.x86_64 #1
May 23 23:01:04 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 23 23:01:04 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 23 23:01:04 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 47 fe d8 48 89 ea 48 c7 c7 62 89 77 c0 48 89 c6 e8 1f 2a a9 =
d8
<0f> 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 5e
May 23 23:01:04 kernel: RSP: 0018:ffffbc5588733c78 EFLAGS: 00010286
May 23 23:01:04 kernel: RAX: 0000000000000000 RBX: ffff90b43623c000 RCX:
0000000000000006
May 23 23:01:04 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff90b43a4168c0
May 23 23:01:04 kernel: RBP: ffff90b43938dec0 R08: 0000000000000001 R09:
000000000000065d
May 23 23:01:04 kernel: R10: 0000000000026a40 R11: 0000000000000003 R12:
0000000000000000
May 23 23:01:04 kernel: R13: ffff90b4328f8000 R14: ffff90b433463480 R15:
ffff90b4328f8028
May 23 23:01:04 kernel: FS:  00007f383e522700(0000) GS:ffff90b43a400000(000=
0)
knlGS:0000000000000000
May 23 23:01:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 23 23:01:04 kernel: CR2: 00007ffb9c267dc0 CR3: 000000010c14a001 CR4:
00000000000606f0
May 23 23:01:04 kernel: Call Trace:
May 23 23:01:04 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 23 23:01:04 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 23 23:01:04 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 23 23:01:04 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 23 23:01:04 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 23 23:01:04 kernel:  ? current_time+0x31/0x80
May 23 23:01:04 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 23 23:01:04 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 23 23:01:04 kernel:  do_vfs_ioctl+0x405/0x660
May 23 23:01:04 kernel:  ? __fput+0x154/0x220
May 23 23:01:04 kernel:  ksys_ioctl+0x5e/0x90
May 23 23:01:04 kernel:  __x64_sys_ioctl+0x16/0x20
May 23 23:01:04 kernel:  do_syscall_64+0x5b/0x170
May 23 23:01:04 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 23 23:01:04 kernel: RIP: 0033:0x7f384636b03b
May 23 23:01:04 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 23 23:01:04 kernel: RSP: 002b:00007f383e521448 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 23 23:01:04 kernel: RAX: ffffffffffffffda RBX: 00007f383e521490 RCX:
00007f384636b03b
May 23 23:01:04 kernel: RDX: 00007f383e521490 RSI: 00000000c0186447 RDI:
0000000000000010
May 23 23:01:04 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 23 23:01:04 kernel: R10: 00007f3828317288 R11: 0000000000000246 R12:
00007f3828360b20
May 23 23:01:04 kernel: R13: 0000000000000010 R14: 000055d8fb40ac18 R15:
000055d8fc826d44
May 23 23:01:04 kernel: ---[ end trace ee9484a5eb35696a ]---
May 23 23:01:04 kernel: nouveau 0000:01:00.0: fifo: channel 3 [mpv/vo[2619]]
kick timeout
May 23 23:01:04 kernel: nouveau: mpv/vo[2619]:00000000:0000906f: detach sw
failed, -110
May 23 23:01:04 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:19 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:19 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 3 [mpv/vo[2619]]
May 23 23:01:19 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:34 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:34 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 3 [mpv/vo[2619]]
May 23 23:01:34 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 23:01:37 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]

I will try mplayer next.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586529452.4c4B7aD2b.4659
Date: Thu, 23 May 2019 23:09:05 +0000
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
   title=3D"NEW - [NVC1] [optimus] fifo: read fault at 0000000000 engine 00=
 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110748#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] [optimus] fifo: read fault at 0000000000 engine 00=
 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110748">bug 11074=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dominik&#64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dom=
inik&#64;greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzeje=
wski</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D110=
748#c1">comment #1</a>)
<span class=3D"quote">&gt; Is there a -vo=3Dvdpau? If so, that's likely to =
work better. I suspect vo=3Dgpu
&gt; becomes GL, and GL + vdpau in separate threads =3D disaster.</span >

Thanks for the tip, but with --vo=3Dvdpau, it's still misbehaving, only a b=
it
different. It displays garbage instead of correct picture in the video wind=
ow
and then times out:

May 23 22:55:37 kernel: Asynchronous wait on fence nouveau:Xorg[849]:b73fb5=
50
timed out (hint:submit_notify+0x0/0x54 [i915])
May 23 22:55:38 kernel: nouveau 0000:01:00.0: mpv/vo[2433]: failed to idle
channel 4 [mpv/vo[2433]]
May 23 22:55:48 kernel: Asynchronous wait on fence nouveau:Xorg[849]:b73fb5=
51
timed out (hint:submit_notify+0x0/0x54 [i915])
May 23 22:55:53 kernel: nouveau 0000:01:00.0: mpv/vo[2433]: failed to idle
channel 4 [mpv/vo[2433]]
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b
May 23 22:55:55 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 23 22:55:57 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:58:10 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 4 [mpv/vo[2619]]
May 23 22:58:25 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 4 [mpv/vo[2619]]
May 23 22:58:27 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 22:58:27 kernel: nouveau 0000:01:00.0: fifo: INTR 00000001: 0000000b
May 23 22:59:28 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 22:59:28 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:02 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:02 kernel: ------------[ cut here ]------------
May 23 23:01:02 kernel: nouveau 0000:01:00.0: timeout
May 23 23:01:02 kernel: WARNING: CPU: 1 PID: 2619 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 23 23:01:02 kernel: Modules linked in: sunrpc fuse uvcvideo arc4
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 iwldvm videobuf2_common
snd_hda_codec_hdmi mac80211 videodev snd_hda_codec_realtek media
snd_hda_codec_generic snd_hd&gt;
May 23 23:01:02 kernel: CPU: 1 PID: 2619 Comm: mpv/vo Not tainted
5.0.16-300.fc30.x86_64 #1
May 23 23:01:02 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 23 23:01:02 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 23 23:01:02 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 47 fe d8 48 89 ea 48 c7 c7 62 89 77 c0 48 89 c6 e8 1f 2a a9 =
d8
&lt;0f&gt; 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 5e
May 23 23:01:02 kernel: RSP: 0018:ffffbc5588733c78 EFLAGS: 00010286
May 23 23:01:02 kernel: RAX: 0000000000000000 RBX: ffff90b43623c000 RCX:
0000000000000006
May 23 23:01:02 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff90b43a4568c0
May 23 23:01:02 kernel: RBP: ffff90b43938dec0 R08: 0000000000000001 R09:
0000000000000628
May 23 23:01:02 kernel: R10: 0000000000025628 R11: 0000000000000003 R12:
0000000000000210
May 23 23:01:02 kernel: R13: ffff90b4328f8000 R14: ffff90b433463480 R15:
ffff90b4328f8028
May 23 23:01:02 kernel: FS:  00007f383e522700(0000) GS:ffff90b43a440000(000=
0)
knlGS:0000000000000000
May 23 23:01:02 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 23 23:01:02 kernel: CR2: 00007ffb9c3ce810 CR3: 000000010c14a003 CR4:
00000000000606e0
May 23 23:01:02 kernel: Call Trace:
May 23 23:01:02 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 23 23:01:02 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 23 23:01:02 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 23 23:01:02 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 23 23:01:02 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 23 23:01:02 kernel:  ? current_time+0x31/0x80
May 23 23:01:02 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 23 23:01:02 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 23 23:01:02 kernel:  do_vfs_ioctl+0x405/0x660
May 23 23:01:02 kernel:  ? __fput+0x154/0x220
May 23 23:01:02 kernel:  ksys_ioctl+0x5e/0x90
May 23 23:01:02 kernel:  __x64_sys_ioctl+0x16/0x20
May 23 23:01:02 kernel:  do_syscall_64+0x5b/0x170
May 23 23:01:02 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 23 23:01:02 kernel: RIP: 0033:0x7f384636b03b
May 23 23:01:02 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 23 23:01:02 kernel: RSP: 002b:00007f383e521448 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 23 23:01:02 kernel: RAX: ffffffffffffffda RBX: 00007f383e521490 RCX:
00007f384636b03b
May 23 23:01:02 kernel: RDX: 00007f383e521490 RSI: 00000000c0186447 RDI:
0000000000000010
May 23 23:01:02 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 23 23:01:02 kernel: R10: 00007f3828317288 R11: 0000000000000246 R12:
00007f3828360b20
May 23 23:01:02 kernel: R13: 0000000000000010 R14: 000055d8fb40ac18 R15:
000055d8fc826d44
May 23 23:01:02 kernel: ---[ end trace ee9484a5eb356969 ]---
May 23 23:01:02 kernel: nouveau 0000:01:00.0: fifo: channel 3 [mpv/vo[2619]]
kick timeout
May 23 23:01:02 kernel: nouveau: mpv/vo[2619]:00000000:0000906f: detach gr
failed, -110
May 23 23:01:02 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:04 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:04 kernel: ------------[ cut here ]------------
May 23 23:01:04 kernel: nouveau 0000:01:00.0: timeout
May 23 23:01:04 kernel: WARNING: CPU: 0 PID: 2619 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:82
gf100_fifo_gpfifo_engine_fini+0x160/0x1c0 [nouveau]
May 23 23:01:04 kernel: Modules linked in: sunrpc fuse uvcvideo arc4
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 iwldvm videobuf2_common
snd_hda_codec_hdmi mac80211 videodev snd_hda_codec_realtek media
snd_hda_codec_generic snd_hd&gt;
May 23 23:01:04 kernel: CPU: 0 PID: 2619 Comm: mpv/vo Tainted: G        W=
=20=20=20=20=20=20
  5.0.16-300.fc30.x86_64 #1
May 23 23:01:04 kernel: Hardware name: Dell Inc.          Dell System XPS
L502X/0YR8NN, BIOS A06 07/20/2011
May 23 23:01:04 kernel: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x160/0x1c0
[nouveau]
May 23 23:01:04 kernel: Code: 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 04 =
48
8b 6f 10 e8 62 47 fe d8 48 89 ea 48 c7 c7 62 89 77 c0 48 89 c6 e8 1f 2a a9 =
d8
&lt;0f&gt; 0b 41 8b 45 48 85 c0 75 1e 4c 89 ff 41 bd 92 ff ff ff e8 f8 5e
May 23 23:01:04 kernel: RSP: 0018:ffffbc5588733c78 EFLAGS: 00010286
May 23 23:01:04 kernel: RAX: 0000000000000000 RBX: ffff90b43623c000 RCX:
0000000000000006
May 23 23:01:04 kernel: RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff90b43a4168c0
May 23 23:01:04 kernel: RBP: ffff90b43938dec0 R08: 0000000000000001 R09:
000000000000065d
May 23 23:01:04 kernel: R10: 0000000000026a40 R11: 0000000000000003 R12:
0000000000000000
May 23 23:01:04 kernel: R13: ffff90b4328f8000 R14: ffff90b433463480 R15:
ffff90b4328f8028
May 23 23:01:04 kernel: FS:  00007f383e522700(0000) GS:ffff90b43a400000(000=
0)
knlGS:0000000000000000
May 23 23:01:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 23 23:01:04 kernel: CR2: 00007ffb9c267dc0 CR3: 000000010c14a001 CR4:
00000000000606f0
May 23 23:01:04 kernel: Call Trace:
May 23 23:01:04 kernel:  nvkm_fifo_chan_child_fini+0x62/0xe0 [nouveau]
May 23 23:01:04 kernel:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
May 23 23:01:04 kernel:  nvkm_object_fini+0xbc/0x150 [nouveau]
May 23 23:01:04 kernel:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
May 23 23:01:04 kernel:  nvkm_ioctl+0xde/0x180 [nouveau]
May 23 23:01:04 kernel:  ? current_time+0x31/0x80
May 23 23:01:04 kernel:  usif_ioctl+0x33d/0x700 [nouveau]
May 23 23:01:04 kernel:  nouveau_drm_ioctl+0xa8/0xb0 [nouveau]
May 23 23:01:04 kernel:  do_vfs_ioctl+0x405/0x660
May 23 23:01:04 kernel:  ? __fput+0x154/0x220
May 23 23:01:04 kernel:  ksys_ioctl+0x5e/0x90
May 23 23:01:04 kernel:  __x64_sys_ioctl+0x16/0x20
May 23 23:01:04 kernel:  do_syscall_64+0x5b/0x170
May 23 23:01:04 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 23 23:01:04 kernel: RIP: 0033:0x7f384636b03b
May 23 23:01:04 kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 01 48
May 23 23:01:04 kernel: RSP: 002b:00007f383e521448 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
May 23 23:01:04 kernel: RAX: ffffffffffffffda RBX: 00007f383e521490 RCX:
00007f384636b03b
May 23 23:01:04 kernel: RDX: 00007f383e521490 RSI: 00000000c0186447 RDI:
0000000000000010
May 23 23:01:04 kernel: RBP: 00000000c0186447 R08: 0000000000000000 R09:
0000000000000007
May 23 23:01:04 kernel: R10: 00007f3828317288 R11: 0000000000000246 R12:
00007f3828360b20
May 23 23:01:04 kernel: R13: 0000000000000010 R14: 000055d8fb40ac18 R15:
000055d8fc826d44
May 23 23:01:04 kernel: ---[ end trace ee9484a5eb35696a ]---
May 23 23:01:04 kernel: nouveau 0000:01:00.0: fifo: channel 3 [mpv/vo[2619]]
kick timeout
May 23 23:01:04 kernel: nouveau: mpv/vo[2619]:00000000:0000906f: detach sw
failed, -110
May 23 23:01:04 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:19 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:19 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 3 [mpv/vo[2619]]
May 23 23:01:19 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]
May 23 23:01:34 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:34 kernel: nouveau 0000:01:00.0: mpv/vo[2619]: failed to idle
channel 3 [mpv/vo[2619]]
May 23 23:01:34 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:35 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
May 23 23:01:36 kernel: nouveau 0000:01:00.0: fifo: runlist update timeout
May 23 23:01:37 kernel: nouveau 0000:01:00.0: Xorg[849]: nv50cal_space: -16
[...]

I will try mplayer next.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586529452.4c4B7aD2b.4659--

--===============0380698919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0380698919==--
