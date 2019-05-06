Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE41523A
	for <lists+nouveau@lfdr.de>; Mon,  6 May 2019 19:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6389A7A;
	Mon,  6 May 2019 17:05:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD3AB89AB6
 for <nouveau@lists.freedesktop.org>; Mon,  6 May 2019 17:05:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C9D607215A; Mon,  6 May 2019 17:05:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 06 May 2019 17:05:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-8kSgiLgKrq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
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
Content-Type: multipart/mixed; boundary="===============0456223655=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0456223655==
Content-Type: multipart/alternative; boundary="155716230312.FE17aA6F.30036"
Content-Transfer-Encoding: 7bit


--155716230312.FE17aA6F.30036
Date: Mon, 6 May 2019 17:05:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #30 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Marc Burkhardt from comment #29)
> I'm pretty happy to run my machines without the "BLOB" and would happily
> keep it this way. But this is a showstopper. A showstopper that has not
> gotten the right attention for a long time now.

The best way to get a good experience is to avoid doing things which break
nouveau. If you don't need the 3d acceleration, just remove nouveau_dri.so.=
 You
still get the X-based acceleration (via xf86-video-nouveau, not the GL-based
modesetting driver), but no OpenGL. This gets you a fairly rock-solid
experience.

Unfortunately software whose name starts with the letters G and K has come =
to
depend on OpenGL for even the most basic tasks without much care about driv=
er
support for this in the past couple of years. I generally avoid those, and =
do
just fine. (While I do run GL-using applications on occasion, I don't do it=
 all
the time, or many of them.)

While your offer for $100 is well-meaning and appreciated, the reality is t=
hat
the capable developers either work for free in their spare time (at which p=
oint
accepting $100 is probably more trouble than it's worth), or need stable
full-time jobs (so a lot more 0's are needed on that offer).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--155716230312.FE17aA6F.30036
Date: Mon, 6 May 2019 17:05:03 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Marc Burkhardt from <a href=3D"show_bug.cgi?id=3D=
100567#c29">comment #29</a>)
<span class=3D"quote">&gt; I'm pretty happy to run my machines without the =
&quot;BLOB&quot; and would happily
&gt; keep it this way. But this is a showstopper. A showstopper that has not
&gt; gotten the right attention for a long time now.</span >

The best way to get a good experience is to avoid doing things which break
nouveau. If you don't need the 3d acceleration, just remove nouveau_dri.so.=
 You
still get the X-based acceleration (via xf86-video-nouveau, not the GL-based
modesetting driver), but no OpenGL. This gets you a fairly rock-solid
experience.

Unfortunately software whose name starts with the letters G and K has come =
to
depend on OpenGL for even the most basic tasks without much care about driv=
er
support for this in the past couple of years. I generally avoid those, and =
do
just fine. (While I do run GL-using applications on occasion, I don't do it=
 all
the time, or many of them.)

While your offer for $100 is well-meaning and appreciated, the reality is t=
hat
the capable developers either work for free in their spare time (at which p=
oint
accepting $100 is probably more trouble than it's worth), or need stable
full-time jobs (so a lot more 0's are needed on that offer).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--155716230312.FE17aA6F.30036--

--===============0456223655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0456223655==--
