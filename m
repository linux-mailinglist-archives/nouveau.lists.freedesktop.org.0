Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2221A72
	for <lists+nouveau@lfdr.de>; Fri, 17 May 2019 17:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37D1898EA;
	Fri, 17 May 2019 15:19:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59265898EA
 for <nouveau@lists.freedesktop.org>; Fri, 17 May 2019 15:19:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4FE3872167; Fri, 17 May 2019 15:19:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 17 May 2019 15:19:50 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: timo.wiren@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108500-8800-Abpzj7UxBC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108500-8800@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
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
Content-Type: multipart/mixed; boundary="===============0449964652=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0449964652==
Content-Type: multipart/alternative; boundary="15581063900.ab1D43b.11786"
Content-Transfer-Encoding: 7bit


--15581063900.ab1D43b.11786
Date: Fri, 17 May 2019 15:19:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #12 from Timo Wiren <timo.wiren@gmail.com> ---
(In reply to Ilia Mirkin from comment #11)

> Timo - are you up to sending a change to fix the above in the kernel? If
> not, I can do it.

Well, I have never submitted a patch to the kernel before, but this is a go=
od
opportunity to learn the process :-). I'll try to make it happen in a few d=
ays.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15581063900.ab1D43b.11786
Date: Fri, 17 May 2019 15:19:50 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
timo.wiren&#64;gmail.com" title=3D"Timo Wiren &lt;timo.wiren&#64;gmail.com&=
gt;"> <span class=3D"fn">Timo Wiren</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D108=
500#c11">comment #11</a>)

<span class=3D"quote">&gt; Timo - are you up to sending a change to fix the=
 above in the kernel? If
&gt; not, I can do it.</span >

Well, I have never submitted a patch to the kernel before, but this is a go=
od
opportunity to learn the process :-). I'll try to make it happen in a few d=
ays.</pre>
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

--15581063900.ab1D43b.11786--

--===============0449964652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0449964652==--
