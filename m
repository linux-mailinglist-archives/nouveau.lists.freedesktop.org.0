Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C2375F0F
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2019 08:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99AB6E88A;
	Fri, 26 Jul 2019 06:29:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C3686E88A
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2019 06:29:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 825FE72167; Fri, 26 Jul 2019 06:29:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 26 Jul 2019 06:29:11 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mmgrqnv@jadamspam.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111218-8800-RZKQEkx6eq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111218-8800@http.bugs.freedesktop.org/>
References: <bug-111218-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111218] Segmentation fault in
 nv50_ir::NVC0LegalizeSSA::handleDIV when dividing result of textureSize
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
Content-Type: multipart/mixed; boundary="===============1959134541=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1959134541==
Content-Type: multipart/alternative; boundary="15641225510.BE8aF58a1.11829"
Content-Transfer-Encoding: 7bit


--15641225510.BE8aF58a1.11829
Date: Fri, 26 Jul 2019 06:29:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111218

--- Comment #4 from mmgrqnv@jadamspam.pl ---
I'm trying to build from source, but I can't get meson to produce the
nouveau_dri.so library. The documentation says:

  If you built the DRI hardware drivers, you'll also see the DRI drivers:
    -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i915_dri.so
    -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i965_dri.so
    -rwxr-xr-x   1 brian users 11849858 Jul 21 12:12 r200_dri.so
    -rwxr-xr-x   1 brian users 11757388 Jul 21 12:12 radeon_dri.so

... but that is not what I am seeing, the only libraries I get are:

  $ find . -iname "*dri*.so"=20
  ./builddir/src/mesa/drivers/dri/libmesa_dri_drivers.so
  ./builddir/src/gallium/targets/dri/libgallium_dri.so

I tried:

  $ meson configure builddir/ -Ddri-drivers=3Dnouveau -Dgallium-drivers=3Dn=
ouveau

but that does not help.
Could you please point me somewhere that explains how to get the nouveau_dr=
i.so
library?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15641225510.BE8aF58a1.11829
Date: Fri, 26 Jul 2019 06:29:11 +0000
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
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218">bug 11121=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mmgrqnv&#64;jadamspam.pl" title=3D"mmgrqnv&#64;jadamspam.pl">mmgrqnv&#64;ja=
damspam.pl</a>
</span></b>
        <pre>I'm trying to build from source, but I can't get meson to prod=
uce the
nouveau_dri.so library. The documentation says:

  If you built the DRI hardware drivers, you'll also see the DRI drivers:
    -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i915_dri.so
    -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i965_dri.so
    -rwxr-xr-x   1 brian users 11849858 Jul 21 12:12 r200_dri.so
    -rwxr-xr-x   1 brian users 11757388 Jul 21 12:12 radeon_dri.so

... but that is not what I am seeing, the only libraries I get are:

  $ find . -iname &quot;*dri*.so&quot;=20
  ./builddir/src/mesa/drivers/dri/libmesa_dri_drivers.so
  ./builddir/src/gallium/targets/dri/libgallium_dri.so

I tried:

  $ meson configure builddir/ -Ddri-drivers=3Dnouveau -Dgallium-drivers=3Dn=
ouveau

but that does not help.
Could you please point me somewhere that explains how to get the nouveau_dr=
i.so
library?</pre>
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

--15641225510.BE8aF58a1.11829--

--===============1959134541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1959134541==--
