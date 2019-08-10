Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918288B92
	for <lists+nouveau@lfdr.de>; Sat, 10 Aug 2019 15:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1126E3F4;
	Sat, 10 Aug 2019 13:23:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 925BD6E3EE
 for <nouveau@lists.freedesktop.org>; Sat, 10 Aug 2019 13:23:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8B60772167; Sat, 10 Aug 2019 13:23:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 10 Aug 2019 13:23:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tothsoft@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107016-8800-5Y4QmERiVC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107016-8800@http.bugs.freedesktop.org/>
References: <bug-107016-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 107016] Gpio error only from kernel higher as 4.x
 (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
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
Content-Type: multipart/mixed; boundary="===============1583286546=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1583286546==
Content-Type: multipart/alternative; boundary="15654434012.93A1bc.31229"
Content-Transfer-Encoding: 7bit


--15654434012.93A1bc.31229
Date: Sat, 10 Aug 2019 13:23:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

--- Comment #24 from atirage21 <tothsoft@gmail.com> ---
It is possible solve this issue with gk107 on base new publicated documenta=
tion
from nvidia for gk 104 ?=20

Also i saw error in envytools in row for gk107:  NVE7 [GK107]: ?:?:2:1


https://github.com/mharsch/envytools/commit/b70216fcf3d268995d7f9aa275db3a3=
59c6a80bd

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15654434012.93A1bc.31229
Date: Sat, 10 Aug 2019 13:23:21 +0000
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
   title=3D"REOPENED - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016">bug 10701=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tothsoft&#64;gmail.com" title=3D"atirage21 &lt;tothsoft&#64;gmail.com&gt;">=
 <span class=3D"fn">atirage21</span></a>
</span></b>
        <pre>It is possible solve this issue with gk107 on base new publica=
ted documentation
from nvidia for gk 104 ?=20

Also i saw error in envytools in row for gk107:  NVE7 [GK107]: ?:?:2:1


<a href=3D"https://github.com/mharsch/envytools/commit/b70216fcf3d268995d7f=
9aa275db3a359c6a80bd">https://github.com/mharsch/envytools/commit/b70216fcf=
3d268995d7f9aa275db3a359c6a80bd</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15654434012.93A1bc.31229--

--===============1583286546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1583286546==--
