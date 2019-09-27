Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086AC01D1
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2019 11:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EEB6EEC4;
	Fri, 27 Sep 2019 09:09:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E98F56EEC6
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 09:09:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E6E0172162; Fri, 27 Sep 2019 09:09:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 27 Sep 2019 09:09:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brianclinkenbeard@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111841-8800-5mO6MK0Ti9@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111841-8800@http.bugs.freedesktop.org/>
References: <bug-111841-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111841] Setting gamma or color temperature on GK104
 causes horizontal artifacts / flickering
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
Content-Type: multipart/mixed; boundary="===============1509428153=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1509428153==
Content-Type: multipart/alternative; boundary="15695753632.a1Df86B2.12941"
Content-Transfer-Encoding: 7bit


--15695753632.a1Df86B2.12941
Date: Fri, 27 Sep 2019 09:09:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111841

--- Comment #1 from Brian Clinkenbeard <brianclinkenbeard@protonmail.com> -=
--
Also note that this flickering is not similar to the flickering that occurs
when using nouveau without a compositor or vsync, and occurs on a static
screen.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695753632.a1Df86B2.12941
Date: Fri, 27 Sep 2019 09:09:23 +0000
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
   title=3D"NEW - Setting gamma or color temperature on GK104 causes horizo=
ntal artifacts / flickering"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111841#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Setting gamma or color temperature on GK104 causes horizo=
ntal artifacts / flickering"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111841">bug 11184=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brianclinkenbeard&#64;protonmail.com" title=3D"Brian Clinkenbeard &lt;brian=
clinkenbeard&#64;protonmail.com&gt;"> <span class=3D"fn">Brian Clinkenbeard=
</span></a>
</span></b>
        <pre>Also note that this flickering is not similar to the flickerin=
g that occurs
when using nouveau without a compositor or vsync, and occurs on a static
screen.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695753632.a1Df86B2.12941--

--===============1509428153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1509428153==--
