Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2E64B8B
	for <lists+nouveau@lfdr.de>; Wed, 10 Jul 2019 19:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAFD8977A;
	Wed, 10 Jul 2019 17:39:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C9BB89823
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jul 2019 17:39:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 79FB672167; Wed, 10 Jul 2019 17:39:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 10 Jul 2019 17:39:12 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: have-backtrace
X-Bugzilla-Severity: minor
X-Bugzilla-Who: power.cyan@openmail.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110955-8800-bLFFaRZqMc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110955-8800@http.bugs.freedesktop.org/>
References: <bug-110955-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110955] Mesa 18.2.8 implementation error: Invalid
 GLSL version in shading_language_version()
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
Content-Type: multipart/mixed; boundary="===============0325900133=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0325900133==
Content-Type: multipart/alternative; boundary="15627803521.2bA55.25428"
Content-Transfer-Encoding: 7bit


--15627803521.2bA55.25428
Date: Wed, 10 Jul 2019 17:39:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110955

--- Comment #7 from power.cyan@openmail.cc ---
Created attachment 144755
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144755&action=3Dedit
Patched with just the latest suggested patch.

Tried without getstring.patch instead used the latest suggested patch for
context.patch. It error out to, the output is attached.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15627803521.2bA55.25428
Date: Wed, 10 Jul 2019 17:39:12 +0000
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
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955">bug 11095=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
power.cyan&#64;openmail.cc" title=3D"power.cyan&#64;openmail.cc">power.cyan=
&#64;openmail.cc</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144755=
" name=3D"attach_144755" title=3D"Patched with just the latest suggested pa=
tch.">attachment 144755</a> <a href=3D"attachment.cgi?id=3D144755&amp;actio=
n=3Dedit" title=3D"Patched with just the latest suggested patch.">[details]=
</a></span>
Patched with just the latest suggested patch.

Tried without getstring.patch instead used the latest suggested patch for
context.patch. It error out to, the output is attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627803521.2bA55.25428--

--===============0325900133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0325900133==--
