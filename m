Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FEA1A92C
	for <lists+nouveau@lfdr.de>; Sat, 11 May 2019 21:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A033289A7A;
	Sat, 11 May 2019 19:09:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 315C189A7A
 for <nouveau@lists.freedesktop.org>; Sat, 11 May 2019 19:09:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 250B5721CD; Sat, 11 May 2019 19:09:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 11 May 2019 19:09:19 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: Linuxfreak@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110572-8800-qOjZqRViwW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110572-8800@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110572] Regularly System Crash: (ca. 1 hour) nouveau
 0000:08:00.0: gr: PGRAPH TLB flush idle timeout fail and nouveau
 0000:08:00.0: mmu: ce0 mmu invalidate timeout
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
Content-Type: multipart/mixed; boundary="===============1714828738=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1714828738==
Content-Type: multipart/alternative; boundary="15576017590.dbd19168.25716"
Content-Transfer-Encoding: 7bit


--15576017590.dbd19168.25716
Date: Sat, 11 May 2019 19:09:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #7 from Linux Freak <Linuxfreak@gmx.at> ---
THE BASIC QUESTIONS
6) The version i use:

The version:

pacman -Si xf86-video-nouveau

Repository      : extra
Name            : xf86-video-nouveau
Version         : 1.0.16-1
Description     : Open Source 3D acceleration driver for nVidia cards
Architecture    : x86_64
URL             : https://nouveau.freedesktop.org/
Licenses        : GPL
Groups          : xorg-drivers
Provides        : None
Depends On      : libsystemd  mesa
Optional Deps   : None
Conflicts With  : xorg-server<1.20  X-ABI-VIDEODRV_VERSION<24=20
X-ABI-VIDEODRV_VERSION>=3D25
Replaces        : None
Download Size   : 84.94 KiB
Installed Size  : 259.00 KiB
Packager        : Andreas Radke <andyrtrNOSPAMarchlinux.org>
Build Date      : Tue Jan 29 17:13:41 2019
Validated By    : MD5 Sum  SHA-256 Sum  Signature

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15576017590.dbd19168.25716
Date: Sat, 11 May 2019 19:09:19 +0000
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
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">bug 11057=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Linuxfreak&#64;gmx.at" title=3D"Linux Freak &lt;Linuxfreak&#64;gmx.at&gt;">=
 <span class=3D"fn">Linux Freak</span></a>
</span></b>
        <pre>THE BASIC QUESTIONS
6) The version i use:

The version:

pacman -Si xf86-video-nouveau

Repository      : extra
Name            : xf86-video-nouveau
Version         : 1.0.16-1
Description     : Open Source 3D acceleration driver for nVidia cards
Architecture    : x86_64
URL             : <a href=3D"https://nouveau.freedesktop.org/">https://nouv=
eau.freedesktop.org/</a>
Licenses        : GPL
Groups          : xorg-drivers
Provides        : None
Depends On      : libsystemd  mesa
Optional Deps   : None
Conflicts With  : xorg-server&lt;1.20  X-ABI-VIDEODRV_VERSION&lt;24=20
X-ABI-VIDEODRV_VERSION&gt;=3D25
Replaces        : None
Download Size   : 84.94 KiB
Installed Size  : 259.00 KiB
Packager        : Andreas Radke &lt;andyrtrNOSPAMarchlinux.org&gt;
Build Date      : Tue Jan 29 17:13:41 2019
Validated By    : MD5 Sum  SHA-256 Sum  Signature</pre>
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

--15576017590.dbd19168.25716--

--===============1714828738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1714828738==--
