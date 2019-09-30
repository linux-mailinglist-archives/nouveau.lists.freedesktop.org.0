Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F4064C203F
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2019 13:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96F6E3D3;
	Mon, 30 Sep 2019 11:57:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E1EE6E3CB
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 11:57:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6ACBE72162; Mon, 30 Sep 2019 11:57:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 30 Sep 2019 11:57:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: alain.prignet@u-pem.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111868-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111868] New: xorg with nouveau crash when starting
 mate-session in debian 10
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
Content-Type: multipart/mixed; boundary="===============1171630443=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1171630443==
Content-Type: multipart/alternative; boundary="15698446231.2a84C562f.9265"
Content-Transfer-Encoding: 7bit


--15698446231.2a84C562f.9265
Date: Mon, 30 Sep 2019 11:57:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111868

            Bug ID: 111868
           Summary: xorg with nouveau crash when starting mate-session in
                    debian 10
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: alain.prignet@u-pem.fr
        QA Contact: xorg-team@lists.x.org

Created attachment 145592
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145592&action=3Dedit
xorg.0.log with xorg backtrace

Geforce 2 since debian 10 crash when starting mate-session (but not with
xfce4-session or showing gdm3 or lightdm).

I have also downgrade xorg-server-core to debian 9 and I get the same crash.
All was working with debian 9 (and 4.9 kernel).

I have tried 4.19 and 4.9 kernel : both crash.

If I launch mate-session from command line in a xfce4-session, mate-session
works.

The backtrace of Xorg.0.log is the same as
https://termbin.com/7avc
I put it in attachment since I have not the non working computer with me. L=
ater
I will give a working Xorg.0.log (with xfce4) and the non working (with mat=
e).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698446231.2a84C562f.9265
Date: Mon, 30 Sep 2019 11:57:03 +0000
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
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868">111868</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg with nouveau crash when starting mate-session in debian =
10
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alain.prignet&#64;u-pem.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145592=
" name=3D"attach_145592" title=3D"xorg.0.log with xorg backtrace">attachmen=
t 145592</a> <a href=3D"attachment.cgi?id=3D145592&amp;action=3Dedit" title=
=3D"xorg.0.log with xorg backtrace">[details]</a></span>
xorg.0.log with xorg backtrace

Geforce 2 since debian 10 crash when starting mate-session (but not with
xfce4-session or showing gdm3 or lightdm).

I have also downgrade xorg-server-core to debian 9 and I get the same crash.
All was working with debian 9 (and 4.9 kernel).

I have tried 4.19 and 4.9 kernel : both crash.

If I launch mate-session from command line in a xfce4-session, mate-session
works.

The backtrace of Xorg.0.log is the same as
<a href=3D"https://termbin.com/7avc">https://termbin.com/7avc</a>
I put it in attachment since I have not the non working computer with me. L=
ater
I will give a working Xorg.0.log (with xfce4) and the non working (with mat=
e).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698446231.2a84C562f.9265--

--===============1171630443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1171630443==--
