Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89EDDABF
	for <lists+nouveau@lfdr.de>; Sat, 19 Oct 2019 21:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9329689CDD;
	Sat, 19 Oct 2019 19:44:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E86A989CAF
 for <nouveau@lists.freedesktop.org>; Sat, 19 Oct 2019 19:44:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DF82B720E2; Sat, 19 Oct 2019 19:44:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 19 Oct 2019 19:44:17 +0000
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
Message-ID: <bug-112070-8800-FEYeQNVTjG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0778258740=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0778258740==
Content-Type: multipart/alternative; boundary="15715142560.ca1B.22019"
Content-Transfer-Encoding: 7bit


--15715142560.ca1B.22019
Date: Sat, 19 Oct 2019 19:44:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #8 from Doobz <dooby.dave@virgin.net> ---
(In reply to Ilia Mirkin from comment #7)
> (In reply to Doobz from comment #6)
> > (In reply to Ilia Mirkin from comment #5)
> > > (In reply to Doobz from comment #4)
> > > > It is a feature that used to work on the hardware, and now doesn't,=
 and I
> > > > have a hunch the reason for the proprietary driver not installing p=
roperly
> > > > is related.
> > >=20
> > > Sorry, I have no idea what a 360 degree video is. Can you tell me mor=
e about
> > > how one might go about reproducing the issue?
> >=20
> > Videos you can rotate the viewing direction with the mouse while they p=
lay.
> > Search 360 video on YouTube.
>=20
> How are you playing these back? Chrome blacklists nouveau for accel, I do=
ubt
> the nv4b you have provides high enough GL for firefox to do anything too
> useful...

Just with the default browser. Firefox and maybe Iceweael.

I have a laptop with a GF 8200 gpu, and it does not exhibit this bug. I don=
't
believe it has any h/w acceleration enabled tbh and didn't display a desktop
after trying to install the 340xx driver, but that's probably a subject for=
 a
different bug report.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715142560.ca1B.22019
Date: Sat, 19 Oct 2019 19:44:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c8">Commen=
t # 8</a>
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
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D112=
070#c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Doobz from <a href=3D"show_bug.cgi?=
id=3D112070#c6">comment #6</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D112070=
#c5">comment #5</a>)
&gt; &gt; &gt; (In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#=
c4">comment #4</a>)
&gt; &gt; &gt; &gt; It is a feature that used to work on the hardware, and =
now doesn't, and I
&gt; &gt; &gt; &gt; have a hunch the reason for the proprietary driver not =
installing properly
&gt; &gt; &gt; &gt; is related.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Sorry, I have no idea what a 360 degree video is. Can you te=
ll me more about
&gt; &gt; &gt; how one might go about reproducing the issue?
&gt; &gt;=20
&gt; &gt; Videos you can rotate the viewing direction with the mouse while =
they play.
&gt; &gt; Search 360 video on YouTube.
&gt;=20
&gt; How are you playing these back? Chrome blacklists nouveau for accel, I=
 doubt
&gt; the nv4b you have provides high enough GL for firefox to do anything t=
oo
&gt; useful...</span >

Just with the default browser. Firefox and maybe Iceweael.

I have a laptop with a GF 8200 gpu, and it does not exhibit this bug. I don=
't
believe it has any h/w acceleration enabled tbh and didn't display a desktop
after trying to install the 340xx driver, but that's probably a subject for=
 a
different bug report.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715142560.ca1B.22019--

--===============0778258740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0778258740==--
