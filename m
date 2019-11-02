Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADDFECDD6
	for <lists+nouveau@lfdr.de>; Sat,  2 Nov 2019 10:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2E6E39C;
	Sat,  2 Nov 2019 09:02:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C33C6E39E
 for <nouveau@lists.freedesktop.org>; Sat,  2 Nov 2019 09:02:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7878D720E2; Sat,  2 Nov 2019 09:02:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 02 Nov 2019 09:02:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: lucien@wellernet.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-112197-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112197] New: Black screen after resume
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
Content-Type: multipart/mixed; boundary="===============1536048370=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1536048370==
Content-Type: multipart/alternative; boundary="15726853302.ACD2bF4FA.31396"
Content-Transfer-Encoding: 7bit


--15726853302.ACD2bF4FA.31396
Date: Sat, 2 Nov 2019 09:02:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112197

            Bug ID: 112197
           Summary: Black screen after resume
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: lucien@wellernet.ch
        QA Contact: xorg-team@lists.x.org

Created attachment 145875
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145875&action=3Dedit
dmesg dump after suspend/resume

My Lenovo X1 extreme with Nvidia GeForce GTX 1050 Ti Mobile graphic card wo=
rks
fine with nouveau driver. But if system is suspended to RAM or goes in
hibernation, graphic card fails leaving screen blank. But I still able to l=
ogin
into machine with ssh.

With OEM Nvidia driver everything work fine, but this is not an option for =
my,
as a have a USB docking station with DisplayLink not supporting OEM driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726853302.ACD2bF4FA.31396
Date: Sat, 2 Nov 2019 09:02:10 +0000
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
   title=3D"NEW - Black screen after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112197">112197</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Black screen after resume
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
          <td>critical
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
          <td>lucien&#64;wellernet.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145875=
" name=3D"attach_145875" title=3D"dmesg dump after suspend/resume">attachme=
nt 145875</a> <a href=3D"attachment.cgi?id=3D145875&amp;action=3Dedit" titl=
e=3D"dmesg dump after suspend/resume">[details]</a></span>
dmesg dump after suspend/resume

My Lenovo X1 extreme with Nvidia GeForce GTX 1050 Ti Mobile graphic card wo=
rks
fine with nouveau driver. But if system is suspended to RAM or goes in
hibernation, graphic card fails leaving screen blank. But I still able to l=
ogin
into machine with ssh.

With OEM Nvidia driver everything work fine, but this is not an option for =
my,
as a have a USB docking station with DisplayLink not supporting OEM driver.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726853302.ACD2bF4FA.31396--

--===============1536048370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1536048370==--
