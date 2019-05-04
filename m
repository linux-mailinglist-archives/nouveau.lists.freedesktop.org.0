Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E113B48
	for <lists+nouveau@lfdr.de>; Sat,  4 May 2019 19:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B04789327;
	Sat,  4 May 2019 17:14:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5961789327
 for <nouveau@lists.freedesktop.org>; Sat,  4 May 2019 17:14:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4F18D7215A; Sat,  4 May 2019 17:14:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 04 May 2019 17:14:38 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: karolherbst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110500-8800-dYVdeQAHpU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110500-8800@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
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
Content-Type: multipart/mixed; boundary="===============0393959503=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0393959503==
Content-Type: multipart/alternative; boundary="15569900780.82dA43.32314"
Content-Transfer-Encoding: 7bit


--15569900780.82dA43.32314
Date: Sat, 4 May 2019 17:14:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #9 from Karol Herbst <karolherbst@gmail.com> ---
(In reply to wixbisce@guerrillamail.com from comment #7)
> I talked with a developer. I get told, that when a driver provide a
> functionality, that functionality should be working. They should be able =
to
> rely on a normal, expected functionality.
>=20

I don't see how that is a Nouveau issue except somebody shows otherwise. Su=
re
Nouveau should be able to handle out of memory situations better, but the i=
ssue
here is, that glamor crashes. This is nothing Nouveau could prevent.

Anyway, ignoring that out of memory issue for now. It's not even proven that
the crash actually resulted from this out of memory error (even though it is
likely). Glamor tries to workaround it, but fails.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15569900780.82dA43.32314
Date: Sat, 4 May 2019 17:14:38 +0000
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
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:wixbisce&#64;guerrillamail.com"=
>wixbisce&#64;guerrillamail.com</a> from <a href=3D"show_bug.cgi?id=3D11050=
0#c7">comment #7</a>)
<span class=3D"quote">&gt; I talked with a developer. I get told, that when=
 a driver provide a
&gt; functionality, that functionality should be working. They should be ab=
le to
&gt; rely on a normal, expected functionality.
&gt; </span >

I don't see how that is a Nouveau issue except somebody shows otherwise. Su=
re
Nouveau should be able to handle out of memory situations better, but the i=
ssue
here is, that glamor crashes. This is nothing Nouveau could prevent.

Anyway, ignoring that out of memory issue for now. It's not even proven that
the crash actually resulted from this out of memory error (even though it is
likely). Glamor tries to workaround it, but fails.</pre>
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

--15569900780.82dA43.32314--

--===============0393959503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0393959503==--
