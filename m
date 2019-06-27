Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77757D2B
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 09:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0A66E804;
	Thu, 27 Jun 2019 07:30:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8ACB6E5DE
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jun 2019 07:30:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E0ED072167; Thu, 27 Jun 2019 07:30:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 27 Jun 2019 07:30:19 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to qa_contact component
Message-ID: <bug-111006-8800-LoJkbWEjJ7@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0508048830=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0508048830==
Content-Type: multipart/alternative; boundary="15616206180.eC899.1474"
Content-Transfer-Encoding: 7bit


--15616206180.eC899.1474
Date: Thu, 27 Jun 2019 07:30:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111006

Michel D=C3=A4nzer <michel@daenzer.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|mesa-dev@lists.freedesktop. |nouveau@lists.freedesktop.o
                   |org                         |rg
         QA Contact|intel-3d-bugs@lists.freedes |nouveau@lists.freedesktop.o
                   |ktop.org                    |rg
          Component|glsl-compiler               |Drivers/DRI/nouveau

--- Comment #1 from Michel D=C3=A4nzer <michel@daenzer.net> ---
Can't reproduce with radeonsi or llvmpipe/softpipe =3D> seems to be a nouve=
au
issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15616206180.eC899.1474
Date: Thu, 27 Jun 2019 07:30:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006">bug 11100=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-3d-bugs&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>glsl-compiler
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006">bug 11100=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>Can't reproduce with radeonsi or llvmpipe/softpipe =3D&gt; see=
ms to be a nouveau
issue.</pre>
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

--15616206180.eC899.1474--

--===============0508048830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0508048830==--
