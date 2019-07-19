Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0616E08F
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2019 07:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7DF6E574;
	Fri, 19 Jul 2019 05:25:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 307816E574
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2019 05:25:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2D23472167; Fri, 19 Jul 2019 05:25:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 19 Jul 2019 05:25:38 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: karolherbst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111007-8800-32OaZ2Wwwt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111007-8800@http.bugs.freedesktop.org/>
References: <bug-111007-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111007] Blender crash when opening material tab GTX
 750Ti -- NV117 (GM107)
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
Content-Type: multipart/mixed; boundary="===============0159032334=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0159032334==
Content-Type: multipart/alternative; boundary="15635139381.ba5AAdef.18979"
Content-Transfer-Encoding: 7bit


--15635139381.ba5AAdef.18979
Date: Fri, 19 Jul 2019 05:25:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111007

--- Comment #7 from Karol Herbst <karolherbst@gmail.com> ---
(In reply to joinlaw from comment #6)
> Created attachment 144811 [details]
> This is an apitrace file for blender 2.8 rc1
>=20
> This bug appear when using evee realtime rendering engine which is OpenGL
> 3.0+
> application and seems that is require a lot of GPU power or maybe some
> OpenGL 3.0+
> functionality in broken in Nouveau.
>=20
> any way here is the trace file.

replaying this trace crashes glretrace. Can you verify that replaying the t=
race
works for you? And what version were you using to record it?

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15635139381.ba5AAdef.18979
Date: Fri, 19 Jul 2019 05:25:38 +0000
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
   title=3D"NEW - Blender crash when opening material tab GTX 750Ti -- NV11=
7 (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111007#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blender crash when opening material tab GTX 750Ti -- NV11=
7 (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111007">bug 11100=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to joinlaw from <a href=3D"show_bug.cgi?id=3D111007#=
c6">comment #6</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144811" name=3D"attach_144811" title=3D"This is an apitrace file fo=
r blender 2.8 rc1">attachment 144811</a> <a href=3D"attachment.cgi?id=3D144=
811&amp;action=3Dedit" title=3D"This is an apitrace file for blender 2.8 rc=
1">[details]</a></span>
&gt; This is an apitrace file for blender 2.8 rc1
&gt;=20
&gt; This bug appear when using evee realtime rendering engine which is Ope=
nGL
&gt; 3.0+
&gt; application and seems that is require a lot of GPU power or maybe some
&gt; OpenGL 3.0+
&gt; functionality in broken in Nouveau.
&gt;=20
&gt; any way here is the trace file.</span >

replaying this trace crashes glretrace. Can you verify that replaying the t=
race
works for you? And what version were you using to record it?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15635139381.ba5AAdef.18979--

--===============0159032334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0159032334==--
