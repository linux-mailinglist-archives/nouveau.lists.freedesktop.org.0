Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261159E50
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 17:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8196E93F;
	Fri, 28 Jun 2019 15:01:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D12A56E93F
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 15:01:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C864472167; Fri, 28 Jun 2019 15:01:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 28 Jun 2019 15:01:07 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: have-backtrace
X-Bugzilla-Severity: minor
X-Bugzilla-Who: emil.l.velikov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110955-8800-LsJGPSHHvH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110955-8800@http.bugs.freedesktop.org/>
References: <bug-110955-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110955] Mesa 18.2.8 implementation error: Invalid
 GLSL version in shading_language_version()
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
Content-Type: multipart/mixed; boundary="===============1189255090=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1189255090==
Content-Type: multipart/alternative; boundary="15617340670.91fFe2.3711"
Content-Transfer-Encoding: 7bit


--15617340670.91fFe2.3711
Date: Fri, 28 Jun 2019 15:01:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110955

Emil Velikov <emil.l.velikov@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |emil.l.velikov@gmail.com

--- Comment #3 from Emil Velikov <emil.l.velikov@gmail.com> ---
Created attachment 144675
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144675&action=3Dedit
Print GL profile and unknown GLSL version.

Forgot the more constructive parts:
 - please attach (plain-text) the output of glxinfo
 - if you can build mesa - what's the output of wine with the attached patch

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15617340670.91fFe2.3711
Date: Fri, 28 Jun 2019 15:01:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:emil.l.ve=
likov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;gmail.com=
&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955">bug 11095=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>emil.l.velikov&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955">bug 11095=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144675=
" name=3D"attach_144675" title=3D"Print GL profile and unknown GLSL version=
.">attachment 144675</a> <a href=3D"attachment.cgi?id=3D144675&amp;action=
=3Dedit" title=3D"Print GL profile and unknown GLSL version.">[details]</a>=
</span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D110955&amp;attachm=
ent=3D144675'>[review]</a>
Print GL profile and unknown GLSL version.

Forgot the more constructive parts:
 - please attach (plain-text) the output of glxinfo
 - if you can build mesa - what's the output of wine with the attached patc=
h</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15617340670.91fFe2.3711--

--===============1189255090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1189255090==--
