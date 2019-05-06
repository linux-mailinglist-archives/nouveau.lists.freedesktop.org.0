Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD7152D9
	for <lists+nouveau@lfdr.de>; Mon,  6 May 2019 19:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE889B51;
	Mon,  6 May 2019 17:36:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A60D489B38
 for <nouveau@lists.freedesktop.org>; Mon,  6 May 2019 17:36:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A2FC57215A; Mon,  6 May 2019 17:36:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 06 May 2019 17:36:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: libreoffice.org@marc.ngoe.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-Tdzx2Rmr37@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1058245485=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1058245485==
Content-Type: multipart/alternative; boundary="15571641695.d262e90.2480"
Content-Transfer-Encoding: 7bit


--15571641695.d262e90.2480
Date: Mon, 6 May 2019 17:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #31 from Marc Burkhardt <libreoffice.org@marc.ngoe.de> ---
Hi Ilia,

by offering a $100 for this the intention was to just get this thing sorted=
 out
from the nouveau guys _prior_ to any "my game X still doesn't work with
nouveau" bug. I don't want to lean out toooo far out of the window, but I t=
hink
this actually is a gregression, too. Not just a bug. Nevertheless, I know
developers earn much more than that, I'm a developer myself.

I cannot share your expression "The best way to get a good experience is to
avoid doing things which break nouveau". What experience is this if you use=
 a
product that you know has a bug and you try to avoid it? Someday you change=
 the
product. But I do not want this. I want the bug to be sorted out, offering =
my
spare time, some bucks for you to have a night out and nothing more.

I use enlightenment desktop on top of modesetting driver with
"nouveau.noaccel=3D0 nouveau.nofbaccel=3D1 nouveau.modeset=3D1 nouveau.runp=
m=3D0
nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3Dtrace nouveau.config=3DNvPm=
ShowAll=3Dtrue"
applied. I see no reason to just _not_ use the features the driver offers. =
And
when they do not work: either fix them or get rid of them.

I'm also absolutely not into heavy 3D, hevay OpenGL or whatever-usage. I ju=
st
use a modern and advanced desktop environment (Enlightenment, git) on recent
"stable" hardware (ThinkPad P50). Not trying to _force_ nouveau to go down.

If your answer really is to "not stress" the driver with a usual workload,
avoid stuff "with the letters G and K" or whatever... oh dear. Cannot imagi=
ne
how I start to argue over this for _my_ work with _my_ boss...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571641695.d262e90.2480
Date: Mon, 6 May 2019 17:36:09 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
libreoffice.org&#64;marc.ngoe.de" title=3D"Marc Burkhardt &lt;libreoffice.o=
rg&#64;marc.ngoe.de&gt;"> <span class=3D"fn">Marc Burkhardt</span></a>
</span></b>
        <pre>Hi Ilia,

by offering a $100 for this the intention was to just get this thing sorted=
 out
from the nouveau guys _prior_ to any &quot;my game X still doesn't work with
nouveau&quot; bug. I don't want to lean out toooo far out of the window, bu=
t I think
this actually is a gregression, too. Not just a bug. Nevertheless, I know
developers earn much more than that, I'm a developer myself.

I cannot share your expression &quot;The best way to get a good experience =
is to
avoid doing things which break nouveau&quot;. What experience is this if yo=
u use a
product that you know has a bug and you try to avoid it? Someday you change=
 the
product. But I do not want this. I want the bug to be sorted out, offering =
my
spare time, some bucks for you to have a night out and nothing more.

I use enlightenment desktop on top of modesetting driver with
&quot;nouveau.noaccel=3D0 nouveau.nofbaccel=3D1 nouveau.modeset=3D1 nouveau=
.runpm=3D0
nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3Dtrace nouveau.config=3DNvPm=
ShowAll=3Dtrue&quot;
applied. I see no reason to just _not_ use the features the driver offers. =
And
when they do not work: either fix them or get rid of them.

I'm also absolutely not into heavy 3D, hevay OpenGL or whatever-usage. I ju=
st
use a modern and advanced desktop environment (Enlightenment, git) on recent
&quot;stable&quot; hardware (ThinkPad P50). Not trying to _force_ nouveau t=
o go down.

If your answer really is to &quot;not stress&quot; the driver with a usual =
workload,
avoid stuff &quot;with the letters G and K&quot; or whatever... oh dear. Ca=
nnot imagine
how I start to argue over this for _my_ work with _my_ boss...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571641695.d262e90.2480--

--===============1058245485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1058245485==--
