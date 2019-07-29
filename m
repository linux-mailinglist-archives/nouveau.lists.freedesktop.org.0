Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023679C96
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 01:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4AC89DB4;
	Mon, 29 Jul 2019 23:00:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 659F489DB4
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 23:00:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5D0E772167; Mon, 29 Jul 2019 23:00:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 29 Jul 2019 23:00:08 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111213-8800-e35998L9xt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============0229418626=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0229418626==
Content-Type: multipart/alternative; boundary="15644412080.Eb108b.2715"
Content-Transfer-Encoding: 7bit


--15644412080.Eb108b.2715
Date: Mon, 29 Jul 2019 23:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #12 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to KJ Liew from comment #11)
> $ LIBVA_DRIVER_NAME=3Dnouveau chromium
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !

This means someone's trying to use an image format (i.e.
ARB_shader_image_load_store image) that's not supported by the backend. Gue=
ss
it works OK on AMD, so they just use it... sigh. Looks like it just takes t=
he
fb's format and sticks it into an image. That's definitely not generically =
OK.

Maybe the compute pipeline just needs to check if it's running on radeonsi,
since it's not a generic gallium API usage.

Just noticed that mpv supports VA-API -- I'll try using that to test it lat=
er.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15644412080.Eb108b.2715
Date: Mon, 29 Jul 2019 23:00:08 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to KJ Liew from <a href=3D"show_bug.cgi?id=3D111213#=
c11">comment #11</a>)
<span class=3D"quote">&gt; $ LIBVA_DRIVER_NAME=3Dnouveau chromium
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !</span >

This means someone's trying to use an image format (i.e.
ARB_shader_image_load_store image) that's not supported by the backend. Gue=
ss
it works OK on AMD, so they just use it... sigh. Looks like it just takes t=
he
fb's format and sticks it into an image. That's definitely not generically =
OK.

Maybe the compute pipeline just needs to check if it's running on radeonsi,
since it's not a generic gallium API usage.

Just noticed that mpv supports VA-API -- I'll try using that to test it lat=
er.</pre>
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

--15644412080.Eb108b.2715--

--===============0229418626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0229418626==--
