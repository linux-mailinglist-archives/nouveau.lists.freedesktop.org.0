Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD048A6F5
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2019 21:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09EF89444;
	Mon, 12 Aug 2019 19:18:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6844D89444
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2019 19:18:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F3FB72167; Mon, 12 Aug 2019 19:18:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 12 Aug 2019 19:18:18 +0000
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
Message-ID: <bug-111371-8800-MqliLl3xj3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111371-8800@http.bugs.freedesktop.org/>
References: <bug-111371-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111371] [NV04] bios OOB on kernel driver
 initialization
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
Content-Type: multipart/mixed; boundary="===============0224761037=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0224761037==
Content-Type: multipart/alternative; boundary="15656374980.53823E.15346"
Content-Transfer-Encoding: 7bit


--15656374980.53823E.15346
Date: Mon, 12 Aug 2019 19:18:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #20 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Jorge Natz from comment #19)
> Given that I know nearly nothing about DRM/VBIOS internals, I am most lik=
ely
> completely wrong, but would the function fabricate_dcb_encoder_table in
> drivers/gpu/drm/nouveau/nouveau_bios.c be what you were mentioning earlie=
r?

Yes, that's exactly it. Of course, it's in our OTHER bios parser, not the o=
ne
in nvkm. Because you can't have too much of a good thing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656374980.53823E.15346
Date: Mon, 12 Aug 2019 19:18:18 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jorge Natz from <a href=3D"show_bug.cgi?id=3D1113=
71#c19">comment #19</a>)
<span class=3D"quote">&gt; Given that I know nearly nothing about DRM/VBIOS=
 internals, I am most likely
&gt; completely wrong, but would the function fabricate_dcb_encoder_table in
&gt; drivers/gpu/drm/nouveau/nouveau_bios.c be what you were mentioning ear=
lier?</span >

Yes, that's exactly it. Of course, it's in our OTHER bios parser, not the o=
ne
in nvkm. Because you can't have too much of a good thing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656374980.53823E.15346--

--===============0224761037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0224761037==--
