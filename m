Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B64ED94
	for <lists+nouveau@lfdr.de>; Fri, 21 Jun 2019 19:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8B86E8FE;
	Fri, 21 Jun 2019 17:11:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A86136E8FE
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jun 2019 17:11:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A03E372167; Fri, 21 Jun 2019 17:11:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 21 Jun 2019 17:11:04 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: power.cyan@openmail.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110955-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110955] New: Mesa 18.2.8 implementation error:
 Invalid GLSL version in shading_language_version()
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
Content-Type: multipart/mixed; boundary="===============0798747309=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0798747309==
Content-Type: multipart/alternative; boundary="15611370640.0B858e790.7036"
Content-Transfer-Encoding: 7bit


--15611370640.0B858e790.7036
Date: Fri, 21 Jun 2019 17:11:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110955

            Bug ID: 110955
           Summary: Mesa 18.2.8 implementation error: Invalid GLSL version
                    in shading_language_version()
           Product: Mesa
           Version: 18.2
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: power.cyan@openmail.cc
        QA Contact: nouveau@lists.freedesktop.org

Created attachment 144606
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144606&action=3Dedit
Wine output from trying to run windemic.exe, it happens also with
LauncherFallour.exe. It dosen't seems to be a wine issue if I run in 64-bit
machine with same OS(Xubuntu 18.04) it works.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15611370640.0B858e790.7036
Date: Fri, 21 Jun 2019 17:11:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955">110955</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 18.2.8 implementation error: Invalid GLSL version in sha=
ding_language_version()
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>power.cyan&#64;openmail.cc
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144606=
" name=3D"attach_144606" title=3D"Wine output from trying to run windemic.e=
xe, it happens also with LauncherFallour.exe. It dosen't seems to be a wine=
 issue if I run in 64-bit machine with same OS(Xubuntu 18.04) it works.">at=
tachment 144606</a> <a href=3D"attachment.cgi?id=3D144606&amp;action=3Dedit=
" title=3D"Wine output from trying to run windemic.exe, it happens also wit=
h LauncherFallour.exe. It dosen't seems to be a wine issue if I run in 64-b=
it machine with same OS(Xubuntu 18.04) it works.">[details]</a></span>
Wine output from trying to run windemic.exe, it happens also with
LauncherFallour.exe. It dosen't seems to be a wine issue if I run in 64-bit
machine with same OS(Xubuntu 18.04) it works.</pre>
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

--15611370640.0B858e790.7036--

--===============0798747309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0798747309==--
