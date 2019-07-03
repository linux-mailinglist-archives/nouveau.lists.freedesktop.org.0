Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DAE5ECCD
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 21:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AD76E1C0;
	Wed,  3 Jul 2019 19:35:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A66E76E1C0
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 19:35:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A381C72167; Wed,  3 Jul 2019 19:35:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 19:35:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/intel
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: chris@chris-wilson.co.uk
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to qa_contact component
Message-ID: <bug-111044-8800-U6zpwm63DU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111044-8800@http.bugs.freedesktop.org/>
References: <bug-111044-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111044] Resume up from suspend sometimes freezes
 system (Optimus/Nouveau)
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
Content-Type: multipart/mixed; boundary="===============1939577797=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1939577797==
Content-Type: multipart/alternative; boundary="15621825353.75cbE.9278"
Content-Transfer-Encoding: 7bit


--15621825353.75cbE.9278
Date: Wed, 3 Jul 2019 19:35:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

JM9 <jhnmlkvch9@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|nouveau@lists.freedesktop.o |chris@chris-wilson.co.uk
                   |rg                          |
         QA Contact|xorg-team@lists.x.org       |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
          Component|Driver/nouveau              |Driver/intel

--- Comment #10 from JM9 <jhnmlkvch9@gmail.com> ---
ok, changing component to Driver/intel.

I'm using xf86-video-intel-git 1:2.99.917+863+g6afed33b-2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621825353.75cbE.9278
Date: Wed, 3 Jul 2019 19:35:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jhnmlkvch=
9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <span clas=
s=3D"fn">JM9</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>chris&#64;chris-wilson.co.uk
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Driver/nouveau
           </td>
           <td>Driver/intel
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jhnmlkvch9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <=
span class=3D"fn">JM9</span></a>
</span></b>
        <pre>ok, changing component to Driver/intel.

I'm using xf86-video-intel-git 1:2.99.917+863+g6afed33b-2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621825353.75cbE.9278--

--===============1939577797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1939577797==--
