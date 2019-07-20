Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A56EFA1
	for <lists+nouveau@lfdr.de>; Sat, 20 Jul 2019 16:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48776E8C0;
	Sat, 20 Jul 2019 14:15:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A59736E8BE
 for <nouveau@lists.freedesktop.org>; Sat, 20 Jul 2019 14:15:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9FE9472167; Sat, 20 Jul 2019 14:15:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 20 Jul 2019 14:15:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: hgcoin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-107829-8800-x0VIHRj8LS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107829-8800@http.bugs.freedesktop.org/>
References: <bug-107829-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 107829] nouveau crash/freeze [MULTIPLE_WARP_ERRORS]
 warp 3f0009 [ILLEGAL_INSTR_ENCODING]
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
Content-Type: multipart/mixed; boundary="===============0980548812=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0980548812==
Content-Type: multipart/alternative; boundary="15636321224.8e4C1.24963"
Content-Transfer-Encoding: 7bit


--15636321224.8e4C1.24963
Date: Sat, 20 Jul 2019 14:15:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107829

--- Comment #12 from Harry Coin <hgcoin@gmail.com> ---
Created attachment 144827
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144827&action=3Dedit
Syslog with nouveau events leading to hard lock

Attached is a /var/log/syslog snip showing many events leading to the hard
lock, followed by a trimmed reboot trace showing the nouveau configuration.
Kernel is generic Linux ceo1homenx 5.2.0-8-generic #9-Ubuntu SMP Mon Jul 8
13:07:27 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

Context is:  a development system left for the night, crashed after perhaps=
 10
hours of idleness.  System is not a server for anything, not running any vm=
s.=20
Running apps of note was an email client and web browser, otherwise just ba=
sic
KDE.  Compositor was off.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15636321224.8e4C1.24963
Date: Sat, 20 Jul 2019 14:15:22 +0000
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
   title=3D"NEW - nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [=
ILLEGAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [=
ILLEGAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829">bug 10782=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hgcoin&#64;gmail.com" title=3D"Harry Coin &lt;hgcoin&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Harry Coin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144827=
" name=3D"attach_144827" title=3D"Syslog with nouveau events leading to har=
d lock">attachment 144827</a> <a href=3D"attachment.cgi?id=3D144827&amp;act=
ion=3Dedit" title=3D"Syslog with nouveau events leading to hard lock">[deta=
ils]</a></span>
Syslog with nouveau events leading to hard lock

Attached is a /var/log/syslog snip showing many events leading to the hard
lock, followed by a trimmed reboot trace showing the nouveau configuration.
Kernel is generic Linux ceo1homenx 5.2.0-8-generic #9-Ubuntu SMP Mon Jul 8
13:07:27 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

Context is:  a development system left for the night, crashed after perhaps=
 10
hours of idleness.  System is not a server for anything, not running any vm=
s.=20
Running apps of note was an email client and web browser, otherwise just ba=
sic
KDE.  Compositor was off.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15636321224.8e4C1.24963--

--===============0980548812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0980548812==--
