Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE672388
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 02:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211DF6E41F;
	Wed, 24 Jul 2019 00:53:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 932E46E419
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 00:53:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8FDD872168; Wed, 24 Jul 2019 00:53:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 24 Jul 2019 00:53:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: josef.lar@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-101778-8800-R6BeZCi16Q@http.bugs.freedesktop.org/>
In-Reply-To: <bug-101778-8800@http.bugs.freedesktop.org/>
References: <bug-101778-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 101778] Kernel Error on Lenovo P51 when setting
 graphics to hybrid (Nvidia Optimus with intel+nvidia)
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
Content-Type: multipart/mixed; boundary="===============0240302540=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0240302540==
Content-Type: multipart/alternative; boundary="15639296031.50e3d2.30475"
Content-Transfer-Encoding: 7bit


--15639296031.50e3d2.30475
Date: Wed, 24 Jul 2019 00:53:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101778

Josef Larsson <josef.lar@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEEDINFO                    |RESOLVED

--- Comment #11 from Josef Larsson <josef.lar@gmail.com> ---
Yes, this is fixed now. Running Gnome on Wayland with an external monitor
connected to the DP port on the docking station without instabilities.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15639296031.50e3d2.30475
Date: Wed, 24 Jul 2019 00:53:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:josef.lar=
&#64;gmail.com" title=3D"Josef Larsson &lt;josef.lar&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Josef Larsson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel Error on Lenovo P51 when setting graphi=
cs to hybrid (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778">bug 10177=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel Error on Lenovo P51 when setting graphi=
cs to hybrid (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel Error on Lenovo P51 when setting graphi=
cs to hybrid (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778">bug 10177=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
josef.lar&#64;gmail.com" title=3D"Josef Larsson &lt;josef.lar&#64;gmail.com=
&gt;"> <span class=3D"fn">Josef Larsson</span></a>
</span></b>
        <pre>Yes, this is fixed now. Running Gnome on Wayland with an exter=
nal monitor
connected to the DP port on the docking station without instabilities.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15639296031.50e3d2.30475--

--===============0240302540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0240302540==--
