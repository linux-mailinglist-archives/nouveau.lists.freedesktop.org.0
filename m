Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F4FEC9A
	for <lists+nouveau@lfdr.de>; Sat, 16 Nov 2019 15:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236436E1AA;
	Sat, 16 Nov 2019 14:12:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 048DA8828E
 for <nouveau@lists.freedesktop.org>; Sat, 16 Nov 2019 14:12:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 01B96720E2; Sat, 16 Nov 2019 14:12:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 16 Nov 2019 14:12:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ynvich@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100228-8800-fkD9INwCop@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100228-8800@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
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
Content-Type: multipart/mixed; boundary="===============1021821056=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1021821056==
Content-Type: multipart/alternative; boundary="157391354415.ed8Ef5fE1.25689"
Content-Transfer-Encoding: 7bit


--157391354415.ed8Ef5fE1.25689
Date: Sat, 16 Nov 2019 14:12:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #45 from Sergey Yanovich <ynvich@gmail.com> ---
(In reply to Lo=C3=AFc Yhuel from comment #27)
> No change with the new firmwares on Dell Inspiron Gaming 7567.

> No issue when booting with nouveau.noaccel=3D1.

The issue affects Dell G5 15 5587 as well. Ubuntu 19.04 is nearly unusable =
on
it with default settings. "nouveau.noaccel=3D1" helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157391354415.ed8Ef5fE1.25689
Date: Sat, 16 Nov 2019 14:12:24 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c45">Comme=
nt # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ynvich&#64;gmail.com" title=3D"Sergey Yanovich &lt;ynvich&#64;gmail.com&gt;=
"> <span class=3D"fn">Sergey Yanovich</span></a>
</span></b>
        <pre>(In reply to Lo=C3=AFc Yhuel from <a href=3D"show_bug.cgi?id=
=3D100228#c27">comment #27</a>)
<span class=3D"quote">&gt; No change with the new firmwares on Dell Inspiro=
n Gaming 7567.</span >

<span class=3D"quote">&gt; No issue when booting with nouveau.noaccel=3D1.<=
/span >

The issue affects Dell G5 15 5587 as well. Ubuntu 19.04 is nearly unusable =
on
it with default settings. &quot;nouveau.noaccel=3D1&quot; helps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157391354415.ed8Ef5fE1.25689--

--===============1021821056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1021821056==--
