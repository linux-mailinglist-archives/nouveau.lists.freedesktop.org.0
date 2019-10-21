Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC9DF5CA
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 21:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664FB6E228;
	Mon, 21 Oct 2019 19:16:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAD3C6E221
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 19:16:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A3521720E2; Mon, 21 Oct 2019 19:16:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 21 Oct 2019 19:16:01 +0000
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
Message-ID: <bug-112070-8800-pHe1Htj5n0@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0547513342=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0547513342==
Content-Type: multipart/alternative; boundary="15716853610.15ADc.20321"
Content-Transfer-Encoding: 7bit


--15716853610.15ADc.20321
Date: Mon, 21 Oct 2019 19:16:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #17 from Doobz <dooby.dave@virgin.net> ---
(In reply to Ilia Mirkin from comment #16)
> (In reply to Doobz from comment #15)
> > Quick update:-
> >=20
> > glmark2 runs fine on geforce 8200 laptop
>=20
> G80+ support for nouveau is markedly better than pre-G80 (aka GeForce 8000
> is the cutoff). The hardware changed substantially for DX10, and has litt=
le
> in common with its DX9 predecessors.
>=20
> >=20
> > But on the geforce 7100 (NV63) desktop it produces segmentation fault at
> > same point as on my 7600GO laptop.
> >=20
> > I can try to upgrade from mesa 18.3.6 to 19.2.1-1 if you think it's wor=
th
> > doing.
>=20
> Depending on the issue, it may or may not be worth it. Is there a backtra=
ce
> from the crash?

Are backtraces (only) produced if "core dumped" is reported? If so then
probably not..

Can look into getting one if it's possible.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716853610.15ADc.20321
Date: Mon, 21 Oct 2019 19:16:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c17">Comme=
nt # 17</a>
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
070#c16">comment #16</a>)
<span class=3D"quote">&gt; (In reply to Doobz from <a href=3D"show_bug.cgi?=
id=3D112070#c15">comment #15</a>)
&gt; &gt; Quick update:-
&gt; &gt;=20
&gt; &gt; glmark2 runs fine on geforce 8200 laptop
&gt;=20
&gt; G80+ support for nouveau is markedly better than pre-G80 (aka GeForce =
8000
&gt; is the cutoff). The hardware changed substantially for DX10, and has l=
ittle
&gt; in common with its DX9 predecessors.
&gt;=20
&gt; &gt;=20
&gt; &gt; But on the geforce 7100 (NV63) desktop it produces segmentation f=
ault at
&gt; &gt; same point as on my 7600GO laptop.
&gt; &gt;=20
&gt; &gt; I can try to upgrade from mesa 18.3.6 to 19.2.1-1 if you think it=
's worth
&gt; &gt; doing.
&gt;=20
&gt; Depending on the issue, it may or may not be worth it. Is there a back=
trace
&gt; from the crash?</span >

Are backtraces (only) produced if &quot;core dumped&quot; is reported? If s=
o then
probably not..

Can look into getting one if it's possible.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716853610.15ADc.20321--

--===============0547513342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0547513342==--
