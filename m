Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47740105F1
	for <lists+nouveau@lfdr.de>; Wed,  1 May 2019 09:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D97F890FF;
	Wed,  1 May 2019 07:52:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2D890FF
 for <nouveau@lists.freedesktop.org>; Wed,  1 May 2019 07:52:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7200C7215A; Wed,  1 May 2019 07:52:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 01 May 2019 07:52:23 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Linuxfreak@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110572-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110572] New: System Crash: nouveau 0000:08:00.0: gr:
 PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu
 invalidate timeout
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
Content-Type: multipart/mixed; boundary="===============1589930099=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1589930099==
Content-Type: multipart/alternative; boundary="15566971430.Dab5.4861"
Content-Transfer-Encoding: 7bit


--15566971430.Dab5.4861
Date: Wed, 1 May 2019 07:52:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

            Bug ID: 110572
           Summary: System Crash: nouveau 0000:08:00.0: gr: PGRAPH TLB
                    flush idle timeout fail and nouveau 0000:08:00.0: mmu:
                    ce0 mmu invalidate timeout
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: Linuxfreak@gmx.at
        QA Contact: nouveau@lists.freedesktop.org

Hi,

The system is freezing regulary. This was introduced with kernel 5.0.9 and
nouveau.

regards LF

Graphics:
Device-1: NVIDIA GT215 [GeForce GT 240] driver: nouveau v: kernel bus ID:
08:00.0 Display: x11 server: X.Org 1.20.4 driver: nouveau unloaded: modeset=
ting
resolution: 1920x1080~60Hz OpenGL: renderer: NVA3 v: 3.3 Mesa 19.0.3 direct
render: Yes=20


System:
Host:  Kernel: 5.0.9-2-MANJARO x86_64 bits: 64 compiler: gcc v: 8.3.0 Deskt=
op:
Xfce 4.13.3git-UNKNOWN Distro: Manjaro Linux=20


glxinfo | grep OpenGL:
OpenGL vendor string: nouveau
OpenGL renderer string: NVA3
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.0.3
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.3 (Compatibility Profile) Mesa 19.0.3
OpenGL shading language version string: 3.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 19.0.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

 mhwd -l
> 0000:08:00.0 (0300:10de:0ca3) Display controller nVidia Corporation:
---------------------------------------------------------------------------=
-----
                  NAME               VERSION          FREEDRIVER           =
TYPE
---------------------------------------------------------------------------=
-----
    video-nvidia-340xx            2018.08.09               false           =
 PCI
           video-linux            2018.05.04                true           =
 PCI
            video-vesa            2017.03.12                true           =
 PCI


mhwd -l -d
---------------------------------------------------------------------------=
-----
> PCI Device: /devices/pci0000:00/0000:00:01.0/0000:08:00.0 (0300:10de:0ca3)
  Display controller nVidia Corporation GT215 [GeForce GT 240]
---------------------------------------------------------------------------=
-----
  > INSTALLED:

   NAME:        video-linux
   ATTACHED:    PCI
   VERSION:     2018.05.04
   INFO:        Standard open source drivers.
   PRIORITY:    2
   FREEDRIVER:  true
   DEPENDS:     -
   CONFLICTS:   -
   CLASSIDS:    0300 0380 0302=20
   VENDORIDS:   1002 8086 10de=20


more testing info see:
https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgraph-tlb-flu=
sh-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate-timeout/85=
154



journalctl -p 3

Mai 01 08:24:46  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 01 08:25:31  colord-sane[478]: io/hpmud/pp.c 627: unable to read device=
-id
ret=3D-1
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS ffffffff [=
BUSY
DISPATCH UNK2 UNK3 UNK4 UNK5 M2MF UNK7 CTXPROG VFETCH CCACHE_PREGEOM
STRMOUT_VATTR_POSTGEOM VCLIP RATTR>
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: fffffff=
f []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: fffffff=
f []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15566971430.Dab5.4861
Date: Wed, 1 May 2019 07:52:23 +0000
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
   title=3D"NEW - System Crash: nouveau 0000:08:00.0: gr: PGRAPH TLB flush =
idle timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">110572</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System Crash: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle=
 timeout fail and nouveau 0000:08:00.0: mmu: ce0 mmu invalidate timeout
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
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
          <td>Linuxfreak&#64;gmx.at
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

The system is freezing regulary. This was introduced with kernel 5.0.9 and
nouveau.

regards LF

Graphics:
Device-1: NVIDIA GT215 [GeForce GT 240] driver: nouveau v: kernel bus ID:
08:00.0 Display: x11 server: X.Org 1.20.4 driver: nouveau unloaded: modeset=
ting
resolution: 1920x1080~60Hz OpenGL: renderer: NVA3 v: 3.3 Mesa 19.0.3 direct
render: Yes=20


System:
Host:  Kernel: 5.0.9-2-MANJARO x86_64 bits: 64 compiler: gcc v: 8.3.0 Deskt=
op:
Xfce 4.13.3git-UNKNOWN Distro: Manjaro Linux=20


glxinfo | grep OpenGL:
OpenGL vendor string: nouveau
OpenGL renderer string: NVA3
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.0.3
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.3 (Compatibility Profile) Mesa 19.0.3
OpenGL shading language version string: 3.30
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 19.0.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

 mhwd -l
<span class=3D"quote">&gt; 0000:08:00.0 (0300:10de:0ca3) Display controller=
 nVidia Corporation:</span >
---------------------------------------------------------------------------=
-----
                  NAME               VERSION          FREEDRIVER           =
TYPE
---------------------------------------------------------------------------=
-----
    video-nvidia-340xx            2018.08.09               false           =
 PCI
           video-linux            2018.05.04                true           =
 PCI
            video-vesa            2017.03.12                true           =
 PCI


mhwd -l -d
---------------------------------------------------------------------------=
-----
<span class=3D"quote">&gt; PCI Device: /devices/pci0000:00/0000:00:01.0/000=
0:08:00.0 (0300:10de:0ca3)</span >
  Display controller nVidia Corporation GT215 [GeForce GT 240]
---------------------------------------------------------------------------=
-----
  &gt; INSTALLED:

   NAME:        video-linux
   ATTACHED:    PCI
   VERSION:     2018.05.04
   INFO:        Standard open source drivers.
   PRIORITY:    2
   FREEDRIVER:  true
   DEPENDS:     -
   CONFLICTS:   -
   CLASSIDS:    0300 0380 0302=20
   VENDORIDS:   1002 8086 10de=20


more testing info see:
<a href=3D"https://forum.manjaro.org/t/system-crash-nouveau-000000-0-gr-pgr=
aph-tlb-flush-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-invalidate=
-timeout/85154">https://forum.manjaro.org/t/system-crash-nouveau-000000-0-g=
r-pgraph-tlb-flush-idle-timeout-fail-and-nouveau-000000-0-mmu-ce0-mmu-inval=
idate-timeout/85154</a>



journalctl -p 3

Mai 01 08:24:46  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 01 08:25:31  colord-sane[478]: io/hpmud/pp.c 627: unable to read device=
-id
ret=3D-1
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:35  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:41  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:47  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00001 [=
BUSY
TPC_PROP TPC_TEX TPC_MP]
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 01 08:47:57  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS ffffffff [=
BUSY
DISPATCH UNK2 UNK3 UNK4 UNK5 M2MF UNK7 CTXPROG VFETCH CCACHE_PREGEOM
STRMOUT_VATTR_POSTGEOM VCLIP RATTR&gt;
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: fffffff=
f []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: fffffff=
f []
Mai 01 08:48:00  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566971430.Dab5.4861--

--===============1589930099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1589930099==--
