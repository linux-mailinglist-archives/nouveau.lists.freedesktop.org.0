Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7970A84
	for <lists+nouveau@lfdr.de>; Mon, 22 Jul 2019 22:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4483289E5B;
	Mon, 22 Jul 2019 20:20:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 239ED89E5B
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jul 2019 20:19:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2010172167; Mon, 22 Jul 2019 20:19:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 22 Jul 2019 20:19:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jpolowin@sympatico.ca
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-48zIzWWJfD@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110714-8800@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110714] Xorg crashes randomly because of memory leak
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
Content-Type: multipart/mixed; boundary="===============0297175735=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0297175735==
Content-Type: multipart/alternative; boundary="15638267991.Ffa8AEdc5.28551"
Content-Transfer-Encoding: 7bit


--15638267991.Ffa8AEdc5.28551
Date: Mon, 22 Jul 2019 20:19:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #15 from Joel Polowin <jpolowin@sympatico.ca> ---
FWIW, I'm seeing the same symptoms -- I found this report while searching f=
or
info about what was going on.  The only notable apps running, so far as I'm
aware, are VirtualBox and Firefox (along with various terminal and file
windows).
I use OpenOffice, but infrequently.  I definitely didn't have any documents
open at the time of the most recent crash.

I'm running 5.1.15-300.fc30.x86_64 .  I'm willing to send info if it will h=
elp,
but I must warn you that I'm anything but a power user -- I'd need some
coaching
to find files.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638267991.Ffa8AEdc5.28551
Date: Mon, 22 Jul 2019 20:19:59 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jpolowin&#64;sympatico.ca" title=3D"Joel Polowin &lt;jpolowin&#64;sympatico=
.ca&gt;"> <span class=3D"fn">Joel Polowin</span></a>
</span></b>
        <pre>FWIW, I'm seeing the same symptoms -- I found this report whil=
e searching for
info about what was going on.  The only notable apps running, so far as I'm
aware, are VirtualBox and Firefox (along with various terminal and file
windows).
I use OpenOffice, but infrequently.  I definitely didn't have any documents
open at the time of the most recent crash.

I'm running 5.1.15-300.fc30.x86_64 .  I'm willing to send info if it will h=
elp,
but I must warn you that I'm anything but a power user -- I'd need some
coaching
to find files.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638267991.Ffa8AEdc5.28551--

--===============0297175735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0297175735==--
