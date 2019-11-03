Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F62DED195
	for <lists+nouveau@lfdr.de>; Sun,  3 Nov 2019 04:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B66E062;
	Sun,  3 Nov 2019 03:24:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18EB56E550
 for <nouveau@lists.freedesktop.org>; Sun,  3 Nov 2019 03:24:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 166D8720E2; Sun,  3 Nov 2019 03:24:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 03 Nov 2019 03:24:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: stratus@tuta.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112201-8800-nMCLUElqYe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112201-8800@http.bugs.freedesktop.org/>
References: <bug-112201-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112201] Syscall param ioctl(generic) points to
 uninitialised byte(s)
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
Content-Type: multipart/mixed; boundary="===============0797414822=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0797414822==
Content-Type: multipart/alternative; boundary="15727514951.Aa7fF6fB3.10119"
Content-Transfer-Encoding: 7bit


--15727514951.Aa7fF6fB3.10119
Date: Sun, 3 Nov 2019 03:24:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112201

--- Comment #2 from stratus@tuta.io ---
So this is not causing any problems, I suppose it's controlling the hardwar=
e by
reading/writing to memory addresses provided by the kernel, and valgrind is
giving a false positive, thank you for your rapid answer explaining things.=
 I
can look at some other things instead then.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15727514951.Aa7fF6fB3.10119
Date: Sun, 3 Nov 2019 03:24:55 +0000
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
   title=3D"NEW - Syscall param ioctl(generic) points to uninitialised byte=
(s)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112201#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Syscall param ioctl(generic) points to uninitialised byte=
(s)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112201">bug 11220=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stratus&#64;tuta.io" title=3D"stratus&#64;tuta.io">stratus&#64;tuta.io</a>
</span></b>
        <pre>So this is not causing any problems, I suppose it's controllin=
g the hardware by
reading/writing to memory addresses provided by the kernel, and valgrind is
giving a false positive, thank you for your rapid answer explaining things.=
 I
can look at some other things instead then.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15727514951.Aa7fF6fB3.10119--

--===============0797414822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0797414822==--
