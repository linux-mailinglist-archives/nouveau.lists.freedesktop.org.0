Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E193CB69D0
	for <lists+nouveau@lfdr.de>; Wed, 18 Sep 2019 19:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EBE6F619;
	Wed, 18 Sep 2019 17:46:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A96C06F613
 for <nouveau@lists.freedesktop.org>; Wed, 18 Sep 2019 17:46:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A5DA172167; Wed, 18 Sep 2019 17:46:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 18 Sep 2019 17:46:03 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: dep_changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gitlab-migration@fdo.invalid
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-108651-8800-SBXLsfnrjl@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108651-8800@http.bugs.freedesktop.org/>
References: <bug-108651-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 108651] Screen flickering when using compositor with
 OpenGL backend
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
Content-Type: multipart/mixed; boundary="===============1340882163=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1340882163==
Content-Type: multipart/alternative; boundary="15688287623.EC699560.28238"
Content-Transfer-Encoding: 7bit


--15688287623.EC699560.28238
Date: Wed, 18 Sep 2019 17:46:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108651
Bug 108651 depends on bug 108705, which changed state.

Bug 108705 Summary: GLX with DRI2 doesn't work properly when xcb is owning =
the event queue
https://bugs.freedesktop.org/show_bug.cgi?id=3D108705

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15688287623.EC699560.28238
Date: Wed, 18 Sep 2019 17:46:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651">Bug 10865=
1</a>
          depends on
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - GLX with DRI2 doesn't work properly when xcb i=
s owning the event queue"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108705">bug 10870=
5</a>,
          which changed state.
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>MOVED
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688287623.EC699560.28238--

--===============1340882163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1340882163==--
