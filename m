Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E8584BD
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 16:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6388C11;
	Thu, 27 Jun 2019 14:46:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 902BA88C11
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jun 2019 14:46:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 889C372167; Thu, 27 Jun 2019 14:46:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 27 Jun 2019 14:46:00 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abelbriggs1@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111006-8800-IdtN3cnWS5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111006-8800@http.bugs.freedesktop.org/>
References: <bug-111006-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111006] Adding a uniform-dependent if-statement in
 shader renders a different image
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
Content-Type: multipart/mixed; boundary="===============1201711023=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1201711023==
Content-Type: multipart/alternative; boundary="15616467600.2Ce4B7.17895"
Content-Transfer-Encoding: 7bit


--15616467600.2Ce4B7.17895
Date: Thu, 27 Jun 2019 14:46:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111006

--- Comment #4 from Abel Briggs <abelbriggs1@hotmail.com> ---
If you're referring to the Meson(In reply to Paul from comment #2)
> Hi Abel.
>=20
> Could you provide your configure command, please?

If you mean the Meson configure command, the only things I changed from the
default is that I enabled ASAN with -Db_sanitize=3Daddress and I set the pr=
efix
to be a different location(along with the libdrm I compiled) so I wouldn't =
mess
up my normal graphics stack. I compiled with gcc 8.3.0.

I'm not sure of any other configure commands you may mean, so please let me
know if this isn't what you're looking for.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15616467600.2Ce4B7.17895
Date: Thu, 27 Jun 2019 14:46:00 +0000
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
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006">bug 11100=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
abelbriggs1&#64;hotmail.com" title=3D"Abel Briggs &lt;abelbriggs1&#64;hotma=
il.com&gt;"> <span class=3D"fn">Abel Briggs</span></a>
</span></b>
        <pre>If you're referring to the Meson(In reply to Paul from <a href=
=3D"show_bug.cgi?id=3D111006#c2">comment #2</a>)
<span class=3D"quote">&gt; Hi Abel.
&gt;=20
&gt; Could you provide your configure command, please?</span >

If you mean the Meson configure command, the only things I changed from the
default is that I enabled ASAN with -Db_sanitize=3Daddress and I set the pr=
efix
to be a different location(along with the libdrm I compiled) so I wouldn't =
mess
up my normal graphics stack. I compiled with gcc 8.3.0.

I'm not sure of any other configure commands you may mean, so please let me
know if this isn't what you're looking for.</pre>
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

--15616467600.2Ce4B7.17895--

--===============1201711023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1201711023==--
