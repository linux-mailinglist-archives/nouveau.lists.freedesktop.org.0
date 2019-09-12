Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1919B1682
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2019 00:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15766EE5A;
	Thu, 12 Sep 2019 22:57:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4D7F6EE57
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 22:57:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ADBD572168; Thu, 12 Sep 2019 22:57:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 12 Sep 2019 22:57:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111642-8800-jzIGIy3xfo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111642-8800@http.bugs.freedesktop.org/>
References: <bug-111642-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111642] NV43 GeForce 6600 Nouveau is not stable on
 legacy hardware
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
Content-Type: multipart/mixed; boundary="===============1908225037=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1908225037==
Content-Type: multipart/alternative; boundary="15683290701.d6CcB.26884"
Content-Transfer-Encoding: 7bit


--15683290701.d6CcB.26884
Date: Thu, 12 Sep 2019 22:57:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111642

--- Comment #15 from Ilia Mirkin <imirkin@alum.mit.edu> ---
Your desktop environment could be trying to add the second GPU's outputs an=
d/or
trying to use it for render offload. Neither will work well with nv4x
generation GPUs. I can believe that the set_domain stuff is failing because=
 of
that. I hadn't considered that option.

The timeout is bad - that means something hung. Probably the messages before
that would be more interesting than after. The first error tends to be the =
most
useful one.

What desktop environment are you using, if any?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683290701.d6CcB.26884
Date: Thu, 12 Sep 2019 22:57:50 +0000
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
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642">bug 11164=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Your desktop environment could be trying to add the second GPU=
's outputs and/or
trying to use it for render offload. Neither will work well with nv4x
generation GPUs. I can believe that the set_domain stuff is failing because=
 of
that. I hadn't considered that option.

The timeout is bad - that means something hung. Probably the messages before
that would be more interesting than after. The first error tends to be the =
most
useful one.

What desktop environment are you using, if any?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683290701.d6CcB.26884--

--===============1908225037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1908225037==--
