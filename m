Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90F910E83
	for <lists+nouveau@lfdr.de>; Wed,  1 May 2019 23:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E1F890BF;
	Wed,  1 May 2019 21:20:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D63FA890BF
 for <nouveau@lists.freedesktop.org>; Wed,  1 May 2019 21:20:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CD15F7215A; Wed,  1 May 2019 21:20:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 01 May 2019 21:20:37 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wixbisce@guerrillamail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110576-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110576] New: Screen flickering in nouveau while
 browsing websites
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
Content-Type: multipart/mixed; boundary="===============0682612620=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0682612620==
Content-Type: multipart/alternative; boundary="15567456370.8Ec23678.21864"
Content-Transfer-Encoding: 7bit


--15567456370.8Ec23678.21864
Date: Wed, 1 May 2019 21:20:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110576

            Bug ID: 110576
           Summary: Screen flickering in nouveau while browsing websites
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: wixbisce@guerrillamail.com
        QA Contact: nouveau@lists.freedesktop.org

I have a strange flickering issue i reported and asked if this flickering i=
ssue
is related to the other issue i reported:
https://bugzilla.freedesktop.org/show_bug.cgi?id=3D110500

I did not get any answer if the issue is related to the other issue i had a=
nd
if i should report a separate bug.

Thus i report it here because the system is nearly unusable. The system hav=
e to
switch from Windows to Linux as soon as possible. It cant be switched over
because of this flickering issue.

How i get this screen flickering:
When i boot up the system it first works fine. To get into the flickering m=
ode,
i have to fast scroll up/down some websites. When the system then starts
flickering the system is unusable. The whole webbrowser jumps around. When i
open a terminal the whole terminal is flickering around. Sometimes it does =
not
flicker but it also does not update. When i then move the terminal window it
flickers around and i can see the new terminal text.

I have to reboot the computer to get it in a working state again.

I dont have any issues reported in dmesg or in the xorg logfile.

OS used: Kubuntu 18.04 LTS.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15567456370.8Ec23678.21864
Date: Wed, 1 May 2019 21:20:37 +0000
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
   title=3D"NEW - Screen flickering in nouveau while browsing websites"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110576">110576</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen flickering in nouveau while browsing websites
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
          <td>major
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
          <td>wixbisce&#64;guerrillamail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a strange flickering issue i reported and asked if this=
 flickering issue
is related to the other issue i reported:
<a href=3D"https://bugzilla.freedesktop.org/show_bug.cgi?id=3D110500">https=
://bugzilla.freedesktop.org/show_bug.cgi?id=3D110500</a>

I did not get any answer if the issue is related to the other issue i had a=
nd
if i should report a separate bug.

Thus i report it here because the system is nearly unusable. The system hav=
e to
switch from Windows to Linux as soon as possible. It cant be switched over
because of this flickering issue.

How i get this screen flickering:
When i boot up the system it first works fine. To get into the flickering m=
ode,
i have to fast scroll up/down some websites. When the system then starts
flickering the system is unusable. The whole webbrowser jumps around. When i
open a terminal the whole terminal is flickering around. Sometimes it does =
not
flicker but it also does not update. When i then move the terminal window it
flickers around and i can see the new terminal text.

I have to reboot the computer to get it in a working state again.

I dont have any issues reported in dmesg or in the xorg logfile.

OS used: Kubuntu 18.04 LTS.</pre>
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

--15567456370.8Ec23678.21864--

--===============0682612620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0682612620==--
