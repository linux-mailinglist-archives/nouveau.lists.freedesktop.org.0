Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6787915722
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 03:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40F89C3F;
	Tue,  7 May 2019 01:02:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEA5589C3F
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 01:02:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB1EA7215A; Tue,  7 May 2019 01:02:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 07 May 2019 01:02:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110631-8800-j99A69pweV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110631-8800@http.bugs.freedesktop.org/>
References: <bug-110631-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110631] EDID confusion with LG 4K TV as monitor
 running X rather than wayland
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
Content-Type: multipart/mixed; boundary="===============1235212217=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1235212217==
Content-Type: multipart/alternative; boundary="15571909281.E3E01f.10934"
Content-Transfer-Encoding: 7bit


--15571909281.E3E01f.10934
Date: Tue, 7 May 2019 01:02:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110631

--- Comment #1 from Ilia Mirkin <imirkin@alum.mit.edu> ---
FWIW I have a LG C7P which I tested with a GM206 and GP107. Slightly differ=
ent
than your setup, but comparable.

I used this setup for bringup of HDMI 2.0 support, available in kernel 4.20.
HDMI 2.0 is required for 4k@60 over HDMI.

Looking at those logs, you appear to be using modeset instead of
xf86-video-nouveau (note how it says "modeset" instead of "NOUVEAU"). The l=
ogs
make it look like modeset is trying to use a 3840x2160 594MHz mode. This
requires HDMI 2.0 to work (and should have been filtered out, but nonethele=
ss
is the modeline presented).

I'd recommend (a) using xf86-video-nouveau [RH has made local changes to th=
is
driver to not load, but I believe this to be a very bad idea, you can overr=
ide
with an xorg.conf iirc], and (b) updating to a 4.20+ kernel so that you get
HDMI 2.0 to work to get access to the higher refresh rates.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571909281.E3E01f.10934
Date: Tue, 7 May 2019 01:02:08 +0000
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
   title=3D"NEW - EDID confusion with LG 4K TV as monitor running X rather =
than wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110631#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - EDID confusion with LG 4K TV as monitor running X rather =
than wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110631">bug 11063=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FWIW I have a LG C7P which I tested with a GM206 and GP107. Sl=
ightly different
than your setup, but comparable.

I used this setup for bringup of HDMI 2.0 support, available in kernel 4.20.
HDMI 2.0 is required for 4k&#64;60 over HDMI.

Looking at those logs, you appear to be using modeset instead of
xf86-video-nouveau (note how it says &quot;modeset&quot; instead of &quot;N=
OUVEAU&quot;). The logs
make it look like modeset is trying to use a 3840x2160 594MHz mode. This
requires HDMI 2.0 to work (and should have been filtered out, but nonethele=
ss
is the modeline presented).

I'd recommend (a) using xf86-video-nouveau [RH has made local changes to th=
is
driver to not load, but I believe this to be a very bad idea, you can overr=
ide
with an xorg.conf iirc], and (b) updating to a 4.20+ kernel so that you get
HDMI 2.0 to work to get access to the higher refresh rates.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571909281.E3E01f.10934--

--===============1235212217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1235212217==--
