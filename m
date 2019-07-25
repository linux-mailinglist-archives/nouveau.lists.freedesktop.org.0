Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58175739
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 20:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EE16E818;
	Thu, 25 Jul 2019 18:50:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD8B96E818
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jul 2019 18:50:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CA4B672167; Thu, 25 Jul 2019 18:50:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 25 Jul 2019 18:50:19 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111218-8800-52z1V8GeWi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111218-8800@http.bugs.freedesktop.org/>
References: <bug-111218-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111218] Segmentation fault in
 nv50_ir::NVC0LegalizeSSA::handleDIV when dividing result of textureSize
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
Content-Type: multipart/mixed; boundary="===============0910278823=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0910278823==
Content-Type: multipart/alternative; boundary="15640806181.5ba6E1c9B.8092"
Content-Transfer-Encoding: 7bit


--15640806181.5ba6E1c9B.8092
Date: Thu, 25 Jul 2019 18:50:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111218

--- Comment #1 from Ilia Mirkin <imirkin@alum.mit.edu> ---
I suspect that the issue is that cell is 0 (perhaps it's in a loop that's
unrolled). This is fixed by
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D7493fbf032f5bcbf4c48187=
bc089c9a34f04a1d5

Note that this will only happen in debug mesa builds.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15640806181.5ba6E1c9B.8092
Date: Thu, 25 Jul 2019 18:50:18 +0000
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
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218">bug 11121=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I suspect that the issue is that cell is 0 (perhaps it's in a =
loop that's
unrolled). This is fixed by
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D7493fbf032f5=
bcbf4c48187bc089c9a34f04a1d5">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D7493fbf032f5bcbf4c48187bc089c9a34f04a1d5</a>

Note that this will only happen in debug mesa builds.</pre>
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

--15640806181.5ba6E1c9B.8092--

--===============0910278823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0910278823==--
