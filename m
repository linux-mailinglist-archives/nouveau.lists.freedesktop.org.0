Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23246376
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 17:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150389A8C;
	Fri, 14 Jun 2019 15:56:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C99689A74
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2019 15:56:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 292D772167; Fri, 14 Jun 2019 15:56:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 14 Jun 2019 15:56:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110830-8800-u4wFnFIFJD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1741935115=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1741935115==
Content-Type: multipart/alternative; boundary="15605277962.493cd90eb.17019"
Content-Transfer-Encoding: 7bit


--15605277962.493cd90eb.17019
Date: Fri, 14 Jun 2019 15:56:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #11 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Marcin Zajaczkowski from comment #10)
> (In reply to Ilia Mirkin from comment #9)
> > xrandr --setprovideroutputsource 1 0
> >=20
> > which should allow you to drive on your NVIDIA GPU's outputs by configu=
ring
> > them in xrandr.
>=20
> In lxqt (with Openbox) after that command and "xrandr --output HDMI-1-2
> --auto --right-of eDP-1" the external monitor is turned on and I see a mo=
use
> cursor there, but no window is rendered.
>=20
> In Gnome 3 (with xorg) the external monitor is detected automatically, but
> the effect is the same - black screen with a mouse cursor.

I've seen a bunch of reports of this recently. It's not any issue with nouv=
eau
kernel component itself, I think it's an Xorg issue. Try using a redirecting
compositor. Or not using one. Or using modesetting ddx. Or using nouveau dd=
x.

The lack of acceleration on TU* might also be playing into this. Not sure.

>=20
> Can it be related to the fact that NVidia providers reports only "Sink
> Output", but not offloading?
>=20
> > This should also be possible with a Wayland compositor, however the
> > specifics will vary by compositor. Xwayland has no ability to control s=
creen
> > setup.
>=20
> In Wayland the external monitor works out-of-box in Gnome 3. However, I h=
ave
> problem with bringing it to live with Xorg server (some tools I use don't
> like Wayland). Is it possible to force LXQT or Gnome 3 (on xorg) to render
> also on the external screen?
>=20
> I've read about some issues with Windows Manager and "offloading", but
> though it only applies to OpenGL-based output with PRIME=3D1.

Offloading is usually meant as "perform rendering on secondary GPU, display=
 on
primary GPU". This is what something like DRI_PRIME controls (i.e. which GPU
performs rendering for a particular application).

You want the inverse -- you want your primary GPU to generate images to be
displayed on a secondary GPUs outputs. In Xorg this is referred to as "reve=
rse
PRIME".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605277962.493cd90eb.17019
Date: Fri, 14 Jun 2019 15:56:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marcin Zajaczkowski from <a href=3D"show_bug.cgi?=
id=3D110830#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D110830#c9">comment #9</a>)
&gt; &gt; xrandr --setprovideroutputsource 1 0
&gt; &gt;=20
&gt; &gt; which should allow you to drive on your NVIDIA GPU's outputs by c=
onfiguring
&gt; &gt; them in xrandr.
&gt;=20
&gt; In lxqt (with Openbox) after that command and &quot;xrandr --output HD=
MI-1-2
&gt; --auto --right-of eDP-1&quot; the external monitor is turned on and I =
see a mouse
&gt; cursor there, but no window is rendered.
&gt;=20
&gt; In Gnome 3 (with xorg) the external monitor is detected automatically,=
 but
&gt; the effect is the same - black screen with a mouse cursor.</span >

I've seen a bunch of reports of this recently. It's not any issue with nouv=
eau
kernel component itself, I think it's an Xorg issue. Try using a redirecting
compositor. Or not using one. Or using modesetting ddx. Or using nouveau dd=
x.

The lack of acceleration on TU* might also be playing into this. Not sure.

<span class=3D"quote">&gt;=20
&gt; Can it be related to the fact that NVidia providers reports only &quot=
;Sink
&gt; Output&quot;, but not offloading?
&gt;=20
&gt; &gt; This should also be possible with a Wayland compositor, however t=
he
&gt; &gt; specifics will vary by compositor. Xwayland has no ability to con=
trol screen
&gt; &gt; setup.
&gt;=20
&gt; In Wayland the external monitor works out-of-box in Gnome 3. However, =
I have
&gt; problem with bringing it to live with Xorg server (some tools I use do=
n't
&gt; like Wayland). Is it possible to force LXQT or Gnome 3 (on xorg) to re=
nder
&gt; also on the external screen?
&gt;=20
&gt; I've read about some issues with Windows Manager and &quot;offloading&=
quot;, but
&gt; though it only applies to OpenGL-based output with PRIME=3D1.</span >

Offloading is usually meant as &quot;perform rendering on secondary GPU, di=
splay on
primary GPU&quot;. This is what something like DRI_PRIME controls (i.e. whi=
ch GPU
performs rendering for a particular application).

You want the inverse -- you want your primary GPU to generate images to be
displayed on a secondary GPUs outputs. In Xorg this is referred to as &quot=
;reverse
PRIME&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605277962.493cd90eb.17019--

--===============1741935115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1741935115==--
