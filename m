Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47A8938A
	for <lists+nouveau@lfdr.de>; Sun, 11 Aug 2019 22:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F0F6E3AC;
	Sun, 11 Aug 2019 20:11:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CA666E3A0
 for <nouveau@lists.freedesktop.org>; Sun, 11 Aug 2019 20:11:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 493AF72167; Sun, 11 Aug 2019 20:11:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 11 Aug 2019 20:11:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jorgenatzdev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111371-8800-RhXWBmg0Cm@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1872170177=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1872170177==
Content-Type: multipart/alternative; boundary="15655543181.C3BBE4.15515"
Content-Transfer-Encoding: 7bit


--15655543181.C3BBE4.15515
Date: Sun, 11 Aug 2019 20:11:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #6 from Jorge Natz <jorgenatzdev@gmail.com> ---
Sorry about the long wait time, compile takes a while on my machine.

When I try to use nvagetbios without arguments, it gives me this message:

No extraction method specified (using -s extraction_method). Autodetecting.
Attempt to extract the vbios from card 0 (nv04) using PRAMIN.
Invalid checksum. Broken vbios or broken retrieval method?
Attempt to extract the vbios from card 0 (nv04) using PROM.
Invalid checksum. Broken vbios or broken retrieval method?
Autodetection failed, aborting.

Therefore I did two runs, one which specified -s prom, the other which
specified -s pramin.

However, on both of these runs, it gave the message:

Attempt to extract the vbios from card 0 (nv04) using <PROM/PRAMIN>.
Invalid checksum. Broken vbios or broken retrieval method?
0xff


Thank you for spending you time in dealing with this issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655543181.C3BBE4.15515
Date: Sun, 11 Aug 2019 20:11:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jorgenatzdev&#64;gmail.com" title=3D"Jorge Natz &lt;jorgenatzdev&#64;gmail.=
com&gt;"> <span class=3D"fn">Jorge Natz</span></a>
</span></b>
        <pre>Sorry about the long wait time, compile takes a while on my ma=
chine.

When I try to use nvagetbios without arguments, it gives me this message:

No extraction method specified (using -s extraction_method). Autodetecting.
Attempt to extract the vbios from card 0 (nv04) using PRAMIN.
Invalid checksum. Broken vbios or broken retrieval method?
Attempt to extract the vbios from card 0 (nv04) using PROM.
Invalid checksum. Broken vbios or broken retrieval method?
Autodetection failed, aborting.

Therefore I did two runs, one which specified -s prom, the other which
specified -s pramin.

However, on both of these runs, it gave the message:

Attempt to extract the vbios from card 0 (nv04) using &lt;PROM/PRAMIN&gt;.
Invalid checksum. Broken vbios or broken retrieval method?
0xff


Thank you for spending you time in dealing with this issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655543181.C3BBE4.15515--

--===============1872170177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1872170177==--
