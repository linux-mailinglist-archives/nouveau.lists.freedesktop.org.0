Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB177D8D
	for <lists+nouveau@lfdr.de>; Sun, 28 Jul 2019 05:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A456E8B3;
	Sun, 28 Jul 2019 03:30:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1D606E8B3
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2019 03:30:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C38AF72167; Sun, 28 Jul 2019 03:30:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 28 Jul 2019 03:30:21 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111213-8800-1QN6f8Ys6R@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============1405259735=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1405259735==
Content-Type: multipart/alternative; boundary="15642846210.2e010C.10152"
Content-Transfer-Encoding: 7bit


--15642846210.2e010C.10152
Date: Sun, 28 Jul 2019 03:30:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #9 from KJ Liew <liewkj@yahoo.com> ---
Created attachment 144895
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144895&action=3Dedit
vdpau_dmesg

$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium
file:///path/to/h264.mp4

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15642846210.2e010C.10152
Date: Sun, 28 Jul 2019 03:30:21 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144895=
" name=3D"attach_144895" title=3D"vdpau_dmesg">attachment 144895</a> <a hre=
f=3D"attachment.cgi?id=3D144895&amp;action=3Dedit" title=3D"vdpau_dmesg">[d=
etails]</a></span>
vdpau_dmesg

$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium
file:///path/to/h264.mp4</pre>
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

--15642846210.2e010C.10152--

--===============1405259735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1405259735==--
