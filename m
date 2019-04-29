Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CFE595
	for <lists+nouveau@lfdr.de>; Mon, 29 Apr 2019 16:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02AD89307;
	Mon, 29 Apr 2019 14:58:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9CDA89309
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2019 14:58:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C6A1E72155; Mon, 29 Apr 2019 14:58:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 29 Apr 2019 14:58:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pcdavid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100423-8800-1mI6XpgCev@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100423-8800@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
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
Content-Type: multipart/mixed; boundary="===============1652490644=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1652490644==
Content-Type: multipart/alternative; boundary="15565498802.66E4E.24028"
Content-Transfer-Encoding: 7bit


--15565498802.66E4E.24028
Date: Mon, 29 Apr 2019 14:58:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #29 from Pierre-Charles David <pcdavid@gmail.com> ---
FWIW, I also get this one (022554), along with two others (10ac08 and 6013d=
4).

The machine is an ASUS UX501V with an Intel HD Graphics 530 + NVIDIA GTX 96=
0M
(more details below). I'm running an up to date Debian 9.9 with a
4.19.28-2~bpo9+1 kernel (from stretch-backports). It is usually plugged to =
an
external screen though HDMI (32" AOC Q3277PQU at 2560=C3=971440).

% cat /proc/version
Linux version 4.19.0-0.bpo.4-amd64 (debian-kernel@lists.debian.org) (gcc
version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Debian 4.19.28-2~bp=
o9+1
(2019-03-27)

% lspci
00:00.0 Host bridge: Intel Corporation Skylake Host Bridge/DRAM Registers (=
rev
07)
00:01.0 PCI bridge: Intel Corporation Skylake PCIe Controller (x16) (rev 07)
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 0=
6)
00:04.0 Signal processing controller: Intel Corporation Skylake Processor
Thermal Subsystem (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-H The=
rmal
subsystem (rev 31)
00:15.0 Signal processing controller: Intel Corporation Sunrise Point-H Ser=
ial
IO I2C Controller #0 (rev 31)
00:15.1 Signal processing controller: Intel Corporation Sunrise Point-H Ser=
ial
IO I2C Controller #1 (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA Controller
[AHCI mode] (rev 31)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #2
(rev f1)
00:1c.2 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #3
(rev f1)
00:1c.4 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #5
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)
02:00.0 Unassigned class [ff00]: Alcor Micro Device 6621
03:00.0 Network controller: Intel Corporation Wireless 7265 (rev 59)

Details on the NVIDIA card:

01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)
        Subsystem: ASUSTeK Computer Inc. GM107M [GeForce GTX 960M]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 127
        Region 0: Memory at dc000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at dd000000 [disabled] [size=3D512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau, nvidia_current_drm, nvidia_current


% journalctl -b --no-hostname -o short-monotonic | grep nouveau
[   25.822549] kernel: nouveau: detected PR support, will not use DSM
[   25.822749] kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[   25.889243] kernel: nouveau 0000:01:00.0: bios: version 82.07.94.00.1a
[   26.462330] kernel: nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   26.462343] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 022554 [ IBUS ]
[   26.474851] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 10ac08 [ IBUS ]
[   27.774265] kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   27.774266] kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   27.774269] kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS table inv=
alid
[   27.774271] kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
[   27.774883] kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
[   27.774892] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1
                       NVRM: nouveau, rivafb, nvidiafb or rivatv=20
                       NVRM: nouveau, rivafb, nvidiafb or rivatv=20
[   76.402068] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 6013d4 [ IBUS ]
[   76.984544] /usr/lib/gdm3/gdm-x-session[1519]: (II) modeset(G0): [DRI2]=
=20=20
DRI driver: nouveau
[   76.984544] /usr/lib/gdm3/gdm-x-session[1519]: (II) modeset(G0): [DRI2]=
=20=20
VDPAU driver: nouveau
[   83.346751] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 6013d4 [ IBUS ]

The last line is repeated hundreds of times.

It may be related, but am not sure: right after a boot, the graphics (e.g.
GNOME Shell animations) are fast and smooth, but after a while (I think it's
related to the machine going to sleep, and/or the screen being locked), it
seems to go to a fallback non-accelerated mode. It's still usable, but even
moving a simple terminal window is slow. Strangely, even in this degraded m=
ode,
scrolling full-screen pages is still smooth in Firefox, as is e.g. watching
videos.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565498802.66E4E.24028
Date: Mon, 29 Apr 2019 14:58:00 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pcdavid&#64;gmail.com" title=3D"Pierre-Charles David &lt;pcdavid&#64;gmail.=
com&gt;"> <span class=3D"fn">Pierre-Charles David</span></a>
</span></b>
        <pre>FWIW, I also get this one (022554), along with two others (10a=
c08 and 6013d4).

The machine is an ASUS UX501V with an Intel HD Graphics 530 + NVIDIA GTX 96=
0M
(more details below). I'm running an up to date Debian 9.9 with a
4.19.28-2~bpo9+1 kernel (from stretch-backports). It is usually plugged to =
an
external screen though HDMI (32&quot; AOC Q3277PQU at 2560=C3=971440).

% cat /proc/version
Linux version 4.19.0-0.bpo.4-amd64 (<a href=3D"mailto:debian-kernel&#64;lis=
ts.debian.org">debian-kernel&#64;lists.debian.org</a>) (gcc
version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Debian 4.19.28-2~bp=
o9+1
(2019-03-27)

% lspci
00:00.0 Host bridge: Intel Corporation Skylake Host Bridge/DRAM Registers (=
rev
07)
00:01.0 PCI bridge: Intel Corporation Skylake PCIe Controller (x16) (rev 07)
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 0=
6)
00:04.0 Signal processing controller: Intel Corporation Skylake Processor
Thermal Subsystem (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-H The=
rmal
subsystem (rev 31)
00:15.0 Signal processing controller: Intel Corporation Sunrise Point-H Ser=
ial
IO I2C Controller #0 (rev 31)
00:15.1 Signal processing controller: Intel Corporation Sunrise Point-H Ser=
ial
IO I2C Controller #1 (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA Controller
[AHCI mode] (rev 31)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #2
(rev f1)
00:1c.2 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #3
(rev f1)
00:1c.4 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #5
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)
02:00.0 Unassigned class [ff00]: Alcor Micro Device 6621
03:00.0 Network controller: Intel Corporation Wireless 7265 (rev 59)

Details on the NVIDIA card:

01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)
        Subsystem: ASUSTeK Computer Inc. GM107M [GeForce GTX 960M]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 127
        Region 0: Memory at dc000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at dd000000 [disabled] [size=3D512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau, nvidia_current_drm, nvidia_current


% journalctl -b --no-hostname -o short-monotonic | grep nouveau
[   25.822549] kernel: nouveau: detected PR support, will not use DSM
[   25.822749] kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[   25.889243] kernel: nouveau 0000:01:00.0: bios: version 82.07.94.00.1a
[   26.462330] kernel: nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   26.462343] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 022554 [ IBUS ]
[   26.474851] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 10ac08 [ IBUS ]
[   27.774265] kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   27.774266] kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   27.774269] kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS table inv=
alid
[   27.774271] kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
[   27.774883] kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
[   27.774892] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1
                       NVRM: nouveau, rivafb, nvidiafb or rivatv=20
                       NVRM: nouveau, rivafb, nvidiafb or rivatv=20
[   76.402068] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 6013d4 [ IBUS ]
[   76.984544] /usr/lib/gdm3/gdm-x-session[1519]: (II) modeset(G0): [DRI2]=
=20=20
DRI driver: nouveau
[   76.984544] /usr/lib/gdm3/gdm-x-session[1519]: (II) modeset(G0): [DRI2]=
=20=20
VDPAU driver: nouveau
[   83.346751] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 6013d4 [ IBUS ]

The last line is repeated hundreds of times.

It may be related, but am not sure: right after a boot, the graphics (e.g.
GNOME Shell animations) are fast and smooth, but after a while (I think it's
related to the machine going to sleep, and/or the screen being locked), it
seems to go to a fallback non-accelerated mode. It's still usable, but even
moving a simple terminal window is slow. Strangely, even in this degraded m=
ode,
scrolling full-screen pages is still smooth in Firefox, as is e.g. watching
videos.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565498802.66E4E.24028--

--===============1652490644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1652490644==--
