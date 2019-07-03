Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4885EC33
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 21:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018696E1B5;
	Wed,  3 Jul 2019 19:06:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CAAE6E1B7
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 19:05:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 99B2D72167; Wed,  3 Jul 2019 19:05:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 19:05:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111044-8800-4CVvONTqQn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111044-8800@http.bugs.freedesktop.org/>
References: <bug-111044-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111044] Resume up from suspend sometimes freezes
 system (Optimus/Nouveau)
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
Content-Type: multipart/mixed; boundary="===============0194137637=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0194137637==
Content-Type: multipart/alternative; boundary="15621807592.DD4Af71d.1584"
Content-Transfer-Encoding: 7bit


--15621807592.DD4Af71d.1584
Date: Wed, 3 Jul 2019 19:05:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

--- Comment #8 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to JM9 from comment #7)
> ok, thanks. This is what it looks like with all the monitors connected:
>=20
> /sys/class/drm/card0-eDP-1/status:connected
> /sys/class/drm/card0-VGA-1/status:connected
> /sys/class/drm/card1-DP-1/status:connected
> /sys/class/drm/card1-DP-2/status:disconnected
> /sys/class/drm/card1-DP-3/status:connected

OK, so this looks like all the DP ports are on the nvidia chip, while the
internal screen (eDP-1) is on the intel chip.

On resume, is the internal screen messed up? If so, this is an intel issue =
(or
at least intel-involved).

Also, what display system are you using? Xorg, or a wayland compositor (if =
so,
which one)?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621807592.DD4Af71d.1584
Date: Wed, 3 Jul 2019 19:05:59 +0000
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
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to JM9 from <a href=3D"show_bug.cgi?id=3D111044#c7">=
comment #7</a>)
<span class=3D"quote">&gt; ok, thanks. This is what it looks like with all =
the monitors connected:
&gt;=20
&gt; /sys/class/drm/card0-eDP-1/status:connected
&gt; /sys/class/drm/card0-VGA-1/status:connected
&gt; /sys/class/drm/card1-DP-1/status:connected
&gt; /sys/class/drm/card1-DP-2/status:disconnected
&gt; /sys/class/drm/card1-DP-3/status:connected</span >

OK, so this looks like all the DP ports are on the nvidia chip, while the
internal screen (eDP-1) is on the intel chip.

On resume, is the internal screen messed up? If so, this is an intel issue =
(or
at least intel-involved).

Also, what display system are you using? Xorg, or a wayland compositor (if =
so,
which one)?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621807592.DD4Af71d.1584--

--===============0194137637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0194137637==--
