Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A47898D0
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2019 10:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C2B89DBF;
	Mon, 12 Aug 2019 08:39:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7394989DBF
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2019 08:39:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6AC1372167; Mon, 12 Aug 2019 08:39:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 12 Aug 2019 08:39:24 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: conde.philippe@skynet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111110-8800-1fRSUcGRQl@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111110-8800@http.bugs.freedesktop.org/>
References: <bug-111110-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111110] Nvidia quadro + nouveau : second terminal
 wake up but doesn't more display
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
Content-Type: multipart/mixed; boundary="===============1440115224=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1440115224==
Content-Type: multipart/alternative; boundary="15655991640.3e04C4.9827"
Content-Transfer-Encoding: 7bit


--15655991640.3e04C4.9827
Date: Mon, 12 Aug 2019 08:39:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111110

--- Comment #8 from Philippe Cond=C3=A9 <conde.philippe@skynet.be> ---
(In reply to Ilia Mirkin from comment #6)
> What was a working kernel, and what's a non-working kernel?
>=20
> The most effective way to determine the problematic change is to do a git
> bisect between those two kernels.

I think that it is not the kernel because when I saw the problem I rebooted=
 the
preceding kernel and the problem was then also present.
On july, 10 I installed.a snapshot with a lot of component. looking in the
zypper log in see that the kernel:
Old =3D 5.1.15-1.1
New =3D 5.1.16-1.2

libdrm-nouveau2=20
Old: 2.4.98-1.3 (installed on 2019-06-17) =3D=3D> no probelm
New: 2.4.99-1.1  =3D=3D> problem is present=20

I never did a bisect. I'll try to find some info about this but no sure if I
can do it.

Regards
Philippe

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15655991640.3e04C4.9827
Date: Mon, 12 Aug 2019 08:39:24 +0000
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
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110">bug 11111=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
110#c6">comment #6</a>)
<span class=3D"quote">&gt; What was a working kernel, and what's a non-work=
ing kernel?
&gt;=20
&gt; The most effective way to determine the problematic change is to do a =
git
&gt; bisect between those two kernels.</span >

I think that it is not the kernel because when I saw the problem I rebooted=
 the
preceding kernel and the problem was then also present.
On july, 10 I installed.a snapshot with a lot of component. looking in the
zypper log in see that the kernel:
Old =3D 5.1.15-1.1
New =3D 5.1.16-1.2

libdrm-nouveau2=20
Old: 2.4.98-1.3 (installed on 2019-06-17) =3D=3D&gt; no probelm
New: 2.4.99-1.1  =3D=3D&gt; problem is present=20

I never did a bisect. I'll try to find some info about this but no sure if I
can do it.

Regards
Philippe</pre>
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

--15655991640.3e04C4.9827--

--===============1440115224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1440115224==--
