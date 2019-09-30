Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A602C20F8
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2019 14:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ACD6E405;
	Mon, 30 Sep 2019 12:54:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9701E6E405
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 12:54:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9386072162; Mon, 30 Sep 2019 12:54:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 30 Sep 2019 12:54:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: alain.prignet@u-pem.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111868-8800-jKXKZFtITN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111868-8800@http.bugs.freedesktop.org/>
References: <bug-111868-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111868] xorg with nouveau crash when starting
 mate-session in debian 10
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
Content-Type: multipart/mixed; boundary="===============1890163620=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1890163620==
Content-Type: multipart/alternative; boundary="15698480410.9C4dfa1.19707"
Content-Transfer-Encoding: 7bit


--15698480410.9C4dfa1.19707
Date: Mon, 30 Sep 2019 12:54:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111868

--- Comment #2 from alain.prignet@u-pem.fr ---
Thanks for your answer.

Sorry, I give you this "pastebin" since I'm away from my computer.
This log has a Riva TNT2, but mine a Geforce 2. But they gives the
"same" backtrace.

I will give you the two log files (mate-session and xfce4-session)
from my computer in few days.

gdb is difficult for me, I will need help. I'm not sure if I need two
computers since I can still use the computer in console mode after the
crash. The crash does not freeze the computer : with lightdm, I get
the infinite connect loop.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698480410.9C4dfa1.19707
Date: Mon, 30 Sep 2019 12:54:01 +0000
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
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868">bug 11186=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alain.prignet&#64;u-pem.fr" title=3D"alain.prignet&#64;u-pem.fr">alain.prig=
net&#64;u-pem.fr</a>
</span></b>
        <pre>Thanks for your answer.

Sorry, I give you this &quot;pastebin&quot; since I'm away from my computer.
This log has a Riva TNT2, but mine a Geforce 2. But they gives the
&quot;same&quot; backtrace.

I will give you the two log files (mate-session and xfce4-session)
from my computer in few days.

gdb is difficult for me, I will need help. I'm not sure if I need two
computers since I can still use the computer in console mode after the
crash. The crash does not freeze the computer : with lightdm, I get
the infinite connect loop.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698480410.9C4dfa1.19707--

--===============1890163620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1890163620==--
