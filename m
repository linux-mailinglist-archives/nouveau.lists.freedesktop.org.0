Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D81127C4
	for <lists+nouveau@lfdr.de>; Wed,  4 Dec 2019 10:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F57A72A62;
	Wed,  4 Dec 2019 09:37:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A150F72A5F
 for <nouveau@lists.freedesktop.org>; Wed,  4 Dec 2019 09:37:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9E0A7720E2; Wed,  4 Dec 2019 09:37:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 04 Dec 2019 09:37:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-105687-8800-BJ8WTsatXc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105687-8800@http.bugs.freedesktop.org/>
References: <bug-105687-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 105687] BUG: unable to handle kernel NULL pointer
 dereference at 0000000000000ca0
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
Content-Type: multipart/mixed; boundary="===============0630695504=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0630695504==
Content-Type: multipart/alternative; boundary="15754522371.6b0E12.28722"
Content-Transfer-Encoding: 7bit


--15754522371.6b0E12.28722
Date: Wed, 4 Dec 2019 09:37:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105687

Martin Peres <martin.peres@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |MOVED
             Status|NEW                         |RESOLVED

--- Comment #7 from Martin Peres <martin.peres@free.fr> ---
-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/415.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15754522371.6b0E12.28722
Date: Wed, 4 Dec 2019 09:37:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - BUG: unable to handle kernel NULL pointer dere=
ference at 0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687">bug 10568=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>MOVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - BUG: unable to handle kernel NULL pointer dere=
ference at 0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - BUG: unable to handle kernel NULL pointer dere=
ference at 0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687">bug 10568=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>-- GitLab Migration Automatic Message --

This bug has been migrated to freedesktop.org's GitLab instance and has been
closed from further activity.

You can subscribe and participate further through the new bug through this =
link
to our GitLab instance:
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/is=
sues/415">https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/iss=
ues/415</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15754522371.6b0E12.28722--

--===============0630695504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0630695504==--
