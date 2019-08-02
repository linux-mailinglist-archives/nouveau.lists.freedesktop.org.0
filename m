Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05D8019B
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2019 22:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77D66ECCF;
	Fri,  2 Aug 2019 20:15:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 320FF6E02A
 for <nouveau@lists.freedesktop.org>; Fri,  2 Aug 2019 20:15:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2807B72167; Fri,  2 Aug 2019 20:15:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 02 Aug 2019 20:15:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre.morrow@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100228-8800-ysVlH20h0g@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100228-8800@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
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
Content-Type: multipart/mixed; boundary="===============1073549831=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1073549831==
Content-Type: multipart/alternative; boundary="15647769250.C17De.26493"
Content-Transfer-Encoding: 7bit


--15647769250.C17De.26493
Date: Fri, 2 Aug 2019 20:15:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #40 from Pierre Moreau <pierre.morrow@free.fr> ---
(In reply to Pacho Ramos from comment #39)
> (In reply to Pacho Ramos from comment #38)
> > "nouveau.modeset=3D0 i915.modeset=3D1" solves the problem for me, thank=
s a lot!
> > :D
>=20
> But, then, nouveau is not listed by:
> $ xrandr --listproviders
>=20
> Then, it is still not usable :(

Setting `nouveau.modeset=3D0` effectively disables the Nouveau driver (i.e.=
 it
will get loaded but will do nothing), which is why it doesn=E2=80=99t get l=
isted by
`xrandr --listproviders`.


(In reply to Markus Wanner from comment #35)
> Created attachment 144355 [details]
> GP107GLM - kernel log

FYI, you mistakenly uploaded twice the lspci output. :-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647769250.C17De.26493
Date: Fri, 2 Aug 2019 20:15:25 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c40">Comme=
nt # 40</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Pacho Ramos from <a href=3D"show_bug.cgi?id=3D100=
228#c39">comment #39</a>)
<span class=3D"quote">&gt; (In reply to Pacho Ramos from <a href=3D"show_bu=
g.cgi?id=3D100228#c38">comment #38</a>)
&gt; &gt; &quot;nouveau.modeset=3D0 i915.modeset=3D1&quot; solves the probl=
em for me, thanks a lot!
&gt; &gt; :D
&gt;=20
&gt; But, then, nouveau is not listed by:
&gt; $ xrandr --listproviders
&gt;=20
&gt; Then, it is still not usable :(</span >

Setting `nouveau.modeset=3D0` effectively disables the Nouveau driver (i.e.=
 it
will get loaded but will do nothing), which is why it doesn=E2=80=99t get l=
isted by
`xrandr --listproviders`.


(In reply to Markus Wanner from <a href=3D"show_bug.cgi?id=3D100228#c35">co=
mment #35</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144355" name=3D"attach_144355" title=3D"GP107GLM - kernel log">atta=
chment 144355</a> <a href=3D"attachment.cgi?id=3D144355&amp;action=3Dedit" =
title=3D"GP107GLM - kernel log">[details]</a></span>
&gt; GP107GLM - kernel log</span >

FYI, you mistakenly uploaded twice the lspci output. :-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15647769250.C17De.26493--

--===============1073549831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1073549831==--
