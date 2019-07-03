Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A35D896
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 02:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD566E0B9;
	Wed,  3 Jul 2019 00:16:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 935BD6E0B6
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 00:16:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8A05672168; Wed,  3 Jul 2019 00:16:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 00:16:11 +0000
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
Message-ID: <bug-111044-8800-qFee1XdYye@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1839446590=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1839446590==
Content-Type: multipart/alternative; boundary="15621129711.c612E.9775"
Content-Transfer-Encoding: 7bit


--15621129711.c612E.9775
Date: Wed, 3 Jul 2019 00:16:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

--- Comment #2 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to JM9 from comment #0)
> I'm on an Optimus laptop. Every time, I resume from suspend, I get this
> message and the resume succeeds.=20
>=20
> tmp tpm0: tpm_try_transmit: send(): error -5

This is related to the TPM driver - Trusted Platform Module. No clue what i=
t's
for. Intel ME interactions perhaps?

>=20
> However, sometimes, I get this following messages and the system freezes:
>=20
> nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: link rate unsupported by =
sink
> nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: training failed
>=20
> Not sure if this is relevant, but I also have a external multi-monitor se=
tup.

Is the system actually frozen, or just the display is down? I suspect
disconnecting and reconnecting would "fix" the issue in such a situation.
Unfortunately I can't help much more than that, but perhaps someone else can
suggest something.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621129711.c612E.9775
Date: Wed, 3 Jul 2019 00:16:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c2">Commen=
t # 2</a>
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
        <pre>(In reply to JM9 from <a href=3D"show_bug.cgi?id=3D111044#c0">=
comment #0</a>)
<span class=3D"quote">&gt; I'm on an Optimus laptop. Every time, I resume f=
rom suspend, I get this
&gt; message and the resume succeeds.=20
&gt;=20
&gt; tmp tpm0: tpm_try_transmit: send(): error -5</span >

This is related to the TPM driver - Trusted Platform Module. No clue what i=
t's
for. Intel ME interactions perhaps?

<span class=3D"quote">&gt;=20
&gt; However, sometimes, I get this following messages and the system freez=
es:
&gt;=20
&gt; nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: link rate unsupported =
by sink
&gt; nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: training failed
&gt;=20
&gt; Not sure if this is relevant, but I also have a external multi-monitor=
 setup.</span >

Is the system actually frozen, or just the display is down? I suspect
disconnecting and reconnecting would &quot;fix&quot; the issue in such a si=
tuation.
Unfortunately I can't help much more than that, but perhaps someone else can
suggest something.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621129711.c612E.9775--

--===============1839446590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1839446590==--
