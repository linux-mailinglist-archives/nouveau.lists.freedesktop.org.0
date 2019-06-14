Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A812246BC5
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 23:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157289939;
	Fri, 14 Jun 2019 21:19:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E1948995F
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2019 21:19:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 78CDE72167; Fri, 14 Jun 2019 21:19:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 14 Jun 2019 21:19:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mszpak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110830-8800-KKYpamPkN3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110830-8800@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
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
Content-Type: multipart/mixed; boundary="===============0650763090=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0650763090==
Content-Type: multipart/alternative; boundary="15605471813.3B6A.6557"
Content-Transfer-Encoding: 7bit


--15605471813.3B6A.6557
Date: Fri, 14 Jun 2019 21:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #12 from Marcin Zajaczkowski <mszpak@wp.pl> ---
Thanks for your explanations.

In the meantime, I've tried (recommended) KWin with LXQT (both XRender nad
OpenGL), but with no effects. I will try to explore it at the Xorg/Window
Manager side (or stick to Wayland for awhile)...

However, I have one more question about the nouveau driver itself. I tried =
to
switch from the "modesetting" driver to intel/nouveau in the xorg
configuration. However, trying to define 'Driver "nouveau"' I end up with t=
he
error that device 167 is not known. I've seen you commit from January [1]. =
Is
it just needed to add a new entry for my GTX 1660 in nv_driver.c? Anyway, do
you think using nouveau_drv.so instead of "modesetting" can change anything?

[1] -
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3D2376d1=
ebf2d9a96bc2ebf21d53a9f9841ce5c15b

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605471813.3B6A.6557
Date: Fri, 14 Jun 2019 21:19:41 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>Thanks for your explanations.

In the meantime, I've tried (recommended) KWin with LXQT (both XRender nad
OpenGL), but with no effects. I will try to explore it at the Xorg/Window
Manager side (or stick to Wayland for awhile)...

However, I have one more question about the nouveau driver itself. I tried =
to
switch from the &quot;modesetting&quot; driver to intel/nouveau in the xorg
configuration. However, trying to define 'Driver &quot;nouveau&quot;' I end=
 up with the
error that device 167 is not known. I've seen you commit from January [1]. =
Is
it just needed to add a new entry for my GTX 1660 in nv_driver.c? Anyway, do
you think using nouveau_drv.so instead of &quot;modesetting&quot; can chang=
e anything?

[1] -
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?=
id=3D2376d1ebf2d9a96bc2ebf21d53a9f9841ce5c15b">https://cgit.freedesktop.org=
/nouveau/xf86-video-nouveau/commit/?id=3D2376d1ebf2d9a96bc2ebf21d53a9f9841c=
e5c15b</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605471813.3B6A.6557--

--===============0650763090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0650763090==--
