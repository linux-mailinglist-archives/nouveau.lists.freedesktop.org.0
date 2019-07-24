Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1372FF4
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 15:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1D6E4FE;
	Wed, 24 Jul 2019 13:33:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CC2B6E4FE
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 13:33:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8963172167; Wed, 24 Jul 2019 13:33:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 24 Jul 2019 13:33:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a9016009@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact op_sys assigned_to
Message-ID: <bug-88801-8800-UgEx727gHk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-88801-8800@http.bugs.freedesktop.org/>
References: <bug-88801-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 88801] Xorg segfaults while playing a video on
 kaffeine causing immediate logout
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
Content-Type: multipart/mixed; boundary="===============1580203951=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1580203951==
Content-Type: multipart/alternative; boundary="15639752114.dA9dFCA6.11796"
Content-Transfer-Encoding: 7bit


--15639752114.dA9dFCA6.11796
Date: Wed, 24 Jul 2019 13:33:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88801

Andre Klapper <a9016009@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|dabangg9875@gmail.com       |xorg-team@lists.x.org
                 OS|Windows (All)               |Linux (All)
           Assignee|dabangg9875@gmail.com       |nouveau@lists.freedesktop.o
                   |                            |rg

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15639752114.dA9dFCA6.11796
Date: Wed, 24 Jul 2019 13:33:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:a9016009&=
#64;gmx.de" title=3D"Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <span clas=
s=3D"fn">Andre Klapper</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg segfaults while playing a video on kaffeine causing =
immediate logout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88801">bug 88801<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>dabangg9875&#64;gmail.com
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">OS</td>
           <td>Windows (All)
           </td>
           <td>Linux (All)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dabangg9875&#64;gmail.com
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15639752114.dA9dFCA6.11796--

--===============1580203951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1580203951==--
