Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A121A70A
	for <lists+nouveau@lfdr.de>; Sat, 11 May 2019 09:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE168929A;
	Sat, 11 May 2019 07:15:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE6EB8929A
 for <nouveau@lists.freedesktop.org>; Sat, 11 May 2019 07:15:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B4CD07215A; Sat, 11 May 2019 07:15:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 11 May 2019 07:15:20 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ak@axet.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110660-8800-6ZJciPgeXW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110660-8800@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
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
Content-Type: multipart/mixed; boundary="===============0218873520=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0218873520==
Content-Type: multipart/alternative; boundary="15575589190.7ffb.18305"
Content-Transfer-Encoding: 7bit


--15575589190.7ffb.18305
Date: Sat, 11 May 2019 07:15:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #25 from Alexey Kuznetsov <ak@axet.ru> ---
axet@axet-laptop:~/Downloads$ grep . /sys/class/drm/card*-*/modes
/sys/class/drm/card0-eDP-1/modes:2880x1800
/sys/class/drm/card0-eDP-1/modes:1920x1200
/sys/class/drm/card0-eDP-1/modes:1920x1080
/sys/class/drm/card0-eDP-1/modes:1600x1200
/sys/class/drm/card0-eDP-1/modes:1680x1050
/sys/class/drm/card0-eDP-1/modes:1400x1050
/sys/class/drm/card0-eDP-1/modes:1280x1024
/sys/class/drm/card0-eDP-1/modes:1280x960
/sys/class/drm/card0-eDP-1/modes:1152x864
/sys/class/drm/card0-eDP-1/modes:1024x768
/sys/class/drm/card0-eDP-1/modes:800x600
/sys/class/drm/card0-eDP-1/modes:640x480
/sys/class/drm/card0-eDP-1/modes:720x400
/sys/class/drm/card0-eDP-1/modes:640x400
/sys/class/drm/card0-eDP-1/modes:640x350
axet@axet-laptop:~/Downloads$=20


Also, "Full aspect" cut display from left and right on following resolution=
s:

1920x1080
720x400
640x350

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15575589190.7ffb.18305
Date: Sat, 11 May 2019 07:15:19 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ak&#64;axet.ru" title=3D"Alexey Kuznetsov &lt;ak&#64;axet.ru&gt;"> <span cl=
ass=3D"fn">Alexey Kuznetsov</span></a>
</span></b>
        <pre>axet&#64;axet-laptop:~/Downloads$ grep . /sys/class/drm/card*-=
*/modes
/sys/class/drm/card0-eDP-1/modes:2880x1800
/sys/class/drm/card0-eDP-1/modes:1920x1200
/sys/class/drm/card0-eDP-1/modes:1920x1080
/sys/class/drm/card0-eDP-1/modes:1600x1200
/sys/class/drm/card0-eDP-1/modes:1680x1050
/sys/class/drm/card0-eDP-1/modes:1400x1050
/sys/class/drm/card0-eDP-1/modes:1280x1024
/sys/class/drm/card0-eDP-1/modes:1280x960
/sys/class/drm/card0-eDP-1/modes:1152x864
/sys/class/drm/card0-eDP-1/modes:1024x768
/sys/class/drm/card0-eDP-1/modes:800x600
/sys/class/drm/card0-eDP-1/modes:640x480
/sys/class/drm/card0-eDP-1/modes:720x400
/sys/class/drm/card0-eDP-1/modes:640x400
/sys/class/drm/card0-eDP-1/modes:640x350
axet&#64;axet-laptop:~/Downloads$=20


Also, &quot;Full aspect&quot; cut display from left and right on following =
resolutions:

1920x1080
720x400
640x350</pre>
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

--15575589190.7ffb.18305--

--===============0218873520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0218873520==--
