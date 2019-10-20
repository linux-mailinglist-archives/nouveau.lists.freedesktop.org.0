Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCCDDEA0
	for <lists+nouveau@lfdr.de>; Sun, 20 Oct 2019 15:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783E489B0D;
	Sun, 20 Oct 2019 13:33:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED5E489B20
 for <nouveau@lists.freedesktop.org>; Sun, 20 Oct 2019 13:33:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EA0C1720E2; Sun, 20 Oct 2019 13:33:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 20 Oct 2019 13:33:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: dooby.dave@virgin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112070-8800-BrosJJL5zX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112070-8800@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
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
Content-Type: multipart/mixed; boundary="===============1386150866=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1386150866==
Content-Type: multipart/alternative; boundary="15715784112.11ADCaB0.22086"
Content-Transfer-Encoding: 7bit


--15715784112.11ADCaB0.22086
Date: Sun, 20 Oct 2019 13:33:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #9 from Doobz <dooby.dave@virgin.net> ---
So I went ahead and installed Sabayon. Same behaviour - garbled 360 degree
videos in Firefox.

I did try flipping layers.acceleration.disabled =3D true in about:config bu=
t it
made no difference.


Does nouveau need any firmware for my card? I thought it didn't, but looking
here it appears it might.
https://nouveau.freedesktop.org/wiki/VideoAcceleration/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715784112.11ADCaB0.22086
Date: Sun, 20 Oct 2019 13:33:31 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>So I went ahead and installed Sabayon. Same behaviour - garble=
d 360 degree
videos in Firefox.

I did try flipping layers.acceleration.disabled =3D true in about:config bu=
t it
made no difference.


Does nouveau need any firmware for my card? I thought it didn't, but looking
here it appears it might.
<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/">https:/=
/nouveau.freedesktop.org/wiki/VideoAcceleration/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715784112.11ADCaB0.22086--

--===============1386150866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1386150866==--
