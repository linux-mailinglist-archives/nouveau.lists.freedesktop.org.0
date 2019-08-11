Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32599893C8
	for <lists+nouveau@lfdr.de>; Sun, 11 Aug 2019 22:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89B86E3B0;
	Sun, 11 Aug 2019 20:53:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEDBA6E3B0
 for <nouveau@lists.freedesktop.org>; Sun, 11 Aug 2019 20:53:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DB26672167; Sun, 11 Aug 2019 20:53:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 11 Aug 2019 20:53:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111371-8800-PJHQI95V68@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111371-8800@http.bugs.freedesktop.org/>
References: <bug-111371-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111371] [NV04] bios OOB on kernel driver
 initialization
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
Content-Type: multipart/mixed; boundary="===============0245282209=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0245282209==
Content-Type: multipart/alternative; boundary="15655568341.1e2CEc.21938"
Content-Transfer-Encoding: 7bit


--15655568341.1e2CEc.21938
Date: Sun, 11 Aug 2019 20:53:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #9 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Jorge Natz from comment #6)
> When I try to use nvagetbios without arguments, it gives me this message:

Congratulations on having such an old card. Esp one that still works, and a
motherboard you can plug it into. From the PRAMIN data, we can see that it's

16MB Diamond Viper TNT AGP Video Card

(which you probably knew already). So nvbios is (mostly) OK with this:

~/src/envytools/nvbios/nvbios pramin.bios=20
warning: No strap specified
BIOS size 0x8000 [orig: 0x10000], 1 valid parts:

BIOS part 0 at 0x0 size 0x8000 [init: 0x8800]. Sig:
PCIR [rev 0x00]:
PCI device: 0x10de:0x0020, class 0x030000
Code type 0x00, rev 0x0001
PCIR indicator: 0x80

BIOS type: NV04

Subsystem id: 0x1092:0x5802

BMP 0x00.01 at 0x2df2

Bios version 0x30.2e.8e.7e

(note the straps thing is unrelated to this).

No tables at all decoded by nvbios though. I think that was semi-common tho=
ugh
in those days. And the PCIR signature really is at 0x3b6f.

It's weird since the bytes "PCIR" are definitely there in the dumps at 0x3b=
6f,
however the driver clearly sees a 0 instead of 0x52494350. Oh, that's becau=
se
it thinks they're out-of-bounds... which in turn looks like it's because we
only pre-fetch the first 4K. To make this work, we'd have to fetch the first
16K. Annoying.

OK, so a super-quick workaround is to change

drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:shadow_image

                if (!shadow_fetch(bios, mthd, offset + 0x1000)) {

to

                if (!shadow_fetch(bios, mthd, offset + 0x4000)) {

This isn't generally OK - I don't know that all VBIOS's are even that large,
but it's OK for these methods.

Ben - what do you think an appropriate workaround is for something like thi=
s?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655568341.1e2CEc.21938
Date: Sun, 11 Aug 2019 20:53:54 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jorge Natz from <a href=3D"show_bug.cgi?id=3D1113=
71#c6">comment #6</a>)
<span class=3D"quote">&gt; When I try to use nvagetbios without arguments, =
it gives me this message:</span >

Congratulations on having such an old card. Esp one that still works, and a
motherboard you can plug it into. From the PRAMIN data, we can see that it's

16MB Diamond Viper TNT AGP Video Card

(which you probably knew already). So nvbios is (mostly) OK with this:

~/src/envytools/nvbios/nvbios pramin.bios=20
warning: No strap specified
BIOS size 0x8000 [orig: 0x10000], 1 valid parts:

BIOS part 0 at 0x0 size 0x8000 [init: 0x8800]. Sig:
PCIR [rev 0x00]:
PCI device: 0x10de:0x0020, class 0x030000
Code type 0x00, rev 0x0001
PCIR indicator: 0x80

BIOS type: NV04

Subsystem id: 0x1092:0x5802

BMP 0x00.01 at 0x2df2

Bios version 0x30.2e.8e.7e

(note the straps thing is unrelated to this).

No tables at all decoded by nvbios though. I think that was semi-common tho=
ugh
in those days. And the PCIR signature really is at 0x3b6f.

It's weird since the bytes &quot;PCIR&quot; are definitely there in the dum=
ps at 0x3b6f,
however the driver clearly sees a 0 instead of 0x52494350. Oh, that's becau=
se
it thinks they're out-of-bounds... which in turn looks like it's because we
only pre-fetch the first 4K. To make this work, we'd have to fetch the first
16K. Annoying.

OK, so a super-quick workaround is to change

drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:shadow_image

                if (!shadow_fetch(bios, mthd, offset + 0x1000)) {

to

                if (!shadow_fetch(bios, mthd, offset + 0x4000)) {

This isn't generally OK - I don't know that all VBIOS's are even that large,
but it's OK for these methods.

Ben - what do you think an appropriate workaround is for something like thi=
s?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655568341.1e2CEc.21938--

--===============0245282209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0245282209==--
