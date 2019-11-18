Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1EEFFCC7
	for <lists+nouveau@lfdr.de>; Mon, 18 Nov 2019 02:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F546E154;
	Mon, 18 Nov 2019 01:14:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14ECB6E0EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Nov 2019 01:14:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 11BE2720E2; Mon, 18 Nov 2019 01:14:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 18 Nov 2019 01:14:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mst@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108873-8800-xrzdYWfYE1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108873-8800@http.bugs.freedesktop.org/>
References: <bug-108873-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 108873] nouveau/Quadro P2000 Mobile: runpm causing
 ACPI errors, lockups
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
Content-Type: multipart/mixed; boundary="===============1247586766=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1247586766==
Content-Type: multipart/alternative; boundary="15740396480.1a3Aa7e.11989"
Content-Transfer-Encoding: 7bit


--15740396480.1a3Aa7e.11989
Date: Mon, 18 Nov 2019 01:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108873

--- Comment #4 from mst@redhat.com ---
just to clarify, without noaccel=3D1,
I see lots of timeout warnings, all around this line:
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:224
gf100_vmm_invalidate+0x1c9/0x1e0 [nouveau]

and then things like xrandr seem to hang.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15740396480.1a3Aa7e.11989
Date: Mon, 18 Nov 2019 01:14:08 +0000
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
   title=3D"NEW - nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, l=
ockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108873#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau/Quadro P2000 Mobile: runpm causing ACPI errors, l=
ockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108873">bug 10887=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mst&#64;redhat.com" title=3D"mst&#64;redhat.com">mst&#64;redhat.com</a>
</span></b>
        <pre>just to clarify, without noaccel=3D1,
I see lots of timeout warnings, all around this line:
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:224
gf100_vmm_invalidate+0x1c9/0x1e0 [nouveau]

and then things like xrandr seem to hang.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15740396480.1a3Aa7e.11989--

--===============1247586766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1247586766==--
