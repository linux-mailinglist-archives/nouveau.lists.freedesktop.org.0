Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA477B93D
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2019 07:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024E46E67D;
	Wed, 31 Jul 2019 05:49:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66E2C6E67D
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2019 05:49:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 63BCE72167; Wed, 31 Jul 2019 05:49:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 31 Jul 2019 05:49:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-98386-8800-2WEtz5upZT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-98386-8800@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
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
Content-Type: multipart/mixed; boundary="===============1709885178=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1709885178==
Content-Type: multipart/alternative; boundary="15645521504.Ea7eb9c.13893"
Content-Transfer-Encoding: 7bit


--15645521504.Ea7eb9c.13893
Date: Wed, 31 Jul 2019 05:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #27 from tojestzart <penteljapan@o2.pl> ---
kubuntu 19.04
ASUS K56CB-XO100H
persist
nouveau 0000:01:00.0: bus: MMIO write of 8000001f FAULT at 6013d4 [ IBUS ]
lsd@lsd-K56CB:~/q2jump/src$ lspci -nnk | grep -iA2 vga=20
00:02.0 VGA compatible controller [0300]: Intel Corporation 3rd Gen Core
processor Graphics Controller [8086:0166] (rev 09)
        Subsystem: ASUSTeK Computer Inc. 3rd Gen Core processor Graphics
Controller [1043:1587]
        Kernel driver in use: i915
lsd@lsd-K56CB:~/q2jump/src$ inxi -Gx
Graphics:  Device-1: Intel 3rd Gen Core processor Graphics vendor: ASUSTeK
driver: i915 v: kernel bus ID: 00:02.0=20
           Device-2: NVIDIA GK107M [GeForce GT 740M] vendor: ASUSTeK driver:
nouveau v: kernel bus ID: 01:00.0=20
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded:
fbdev,vesa resolution: 1366x768~60Hz=20
           OpenGL: renderer: Mesa DRI Intel Ivybridge Mobile v: 4.2 Mesa 19=
.0.2
direct render: Yes=20
lsd@lsd-K56CB:~/q2jump/src$

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645521504.Ea7eb9c.13893
Date: Wed, 31 Jul 2019 05:49:10 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
penteljapan&#64;o2.pl" title=3D"tojestzart &lt;penteljapan&#64;o2.pl&gt;"> =
<span class=3D"fn">tojestzart</span></a>
</span></b>
        <pre>kubuntu 19.04
ASUS K56CB-XO100H
persist
nouveau 0000:01:00.0: bus: MMIO write of 8000001f FAULT at 6013d4 [ IBUS ]
lsd&#64;lsd-K56CB:~/q2jump/src$ lspci -nnk | grep -iA2 vga=20
00:02.0 VGA compatible controller [0300]: Intel Corporation 3rd Gen Core
processor Graphics Controller [8086:0166] (rev 09)
        Subsystem: ASUSTeK Computer Inc. 3rd Gen Core processor Graphics
Controller [1043:1587]
        Kernel driver in use: i915
lsd&#64;lsd-K56CB:~/q2jump/src$ inxi -Gx
Graphics:  Device-1: Intel 3rd Gen Core processor Graphics vendor: ASUSTeK
driver: i915 v: kernel bus ID: 00:02.0=20
           Device-2: NVIDIA GK107M [GeForce GT 740M] vendor: ASUSTeK driver:
nouveau v: kernel bus ID: 01:00.0=20
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded:
fbdev,vesa resolution: 1366x768~60Hz=20
           OpenGL: renderer: Mesa DRI Intel Ivybridge Mobile v: 4.2 Mesa 19=
.0.2
direct render: Yes=20
lsd&#64;lsd-K56CB:~/q2jump/src$</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645521504.Ea7eb9c.13893--

--===============1709885178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1709885178==--
