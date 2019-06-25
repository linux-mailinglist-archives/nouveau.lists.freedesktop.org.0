Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087452698
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 10:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0994D6E098;
	Tue, 25 Jun 2019 08:28:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D471F6E098
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 08:28:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CBFE872167; Tue, 25 Jun 2019 08:28:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 08:28:17 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: praiogriff@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110988-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110988] New: [NV49] Graphical issues on KDE desktop
 with GeForce 7950 GX2
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
Content-Type: multipart/mixed; boundary="===============0434138849=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0434138849==
Content-Type: multipart/alternative; boundary="15614512970.4d4D4f.30311"
Content-Transfer-Encoding: 7bit


--15614512970.4d4D4f.30311
Date: Tue, 25 Jun 2019 08:28:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110988

            Bug ID: 110988
           Summary: [NV49] Graphical issues on KDE desktop with GeForce
                    7950 GX2
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: praiogriff@gmail.com
        QA Contact: nouveau@lists.freedesktop.org

SUMMARY
Since I did a new installation of openSUSE tumbleweed on 29th March 2019, I
have severe graphical issues on my desktop:
https://abload.de/image.php?img=3Ddesktop3w4ks2.png
https://abload.de/image.php?img=3Ddesktop4myjjn.png
https://abload.de/image.php?img=3Ddesktop5xwk6d.png
https://abload.de/image.php?img=3Ddesktop6k8jb2.png

Before this new installation, everything was fine. Unfortunately, I don't k=
now
which version the old driver had. I didn't expect such a problem so I didn't
pay attention for it. The old system was installed round about one year ago.
There the driver was locked and never updated.

Problems now appear as soon as the desktop is fully loaded.
Games like 0 A.D. or Supertux seem not to be affected or only at a lesser
extent.

STEPS TO REPRODUCE
1. installation
2. booting system

OBSERVED RESULT
- KDE-Menu is semi-transparent (see second picture:
https://abload.de/image.php?img=3Ddesktop4myjjn.png )
- Icon titles are overlapped with colored blocks (see third picture in the
upper line: https://abload.de/image.php?img=3Ddesktop5xwk6d.png )
- Program windows are overlapped with colored fields (see fourth picture:
https://abload.de/image.php?img=3Ddesktop6k8jb2.png )

EXPECTED RESULT
- Clear desktop presentation

SOFTWARE/OS VERSIONS
Linux/KDE Plasma: Kernel 5.1.7-1, openSUSE tumbleweed 64-bit (current versi=
on)
(available in About System)
KDE Plasma Version: 5.16.0
KDE Frameworks Version: 5.58.0
Qt Version: 5.12.3

MY HARDWARE/DRIVER:
Motherboard: Asus P5N32-E SLI Plus
CPU: Intel Core2 Duo E8200 @ 2,66GHz
RAM: 4 GiB
Graphics card: [NV49] Gigabyte Nvidia GeForce 7950 GX2 with 2x 512 GDDR3
Graphics Driver: nouveau=20
Graphics Renderer: NV49
OpenGL Version: 2.1 Mesa 19.0.5

ADDITIONAL INFORMATION
There are no problems when booting Windows XP. So I exclude defective hardw=
are.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15614512970.4d4D4f.30311
Date: Tue, 25 Jun 2019 08:28:17 +0000
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
   title=3D"NEW - [NV49] Graphical issues on KDE desktop with GeForce 7950 =
GX2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110988">110988</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV49] Graphical issues on KDE desktop with GeForce 7950 GX2
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
          <td>normal
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
          <td>praiogriff&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>SUMMARY
Since I did a new installation of openSUSE tumbleweed on 29th March 2019, I
have severe graphical issues on my desktop:
<a href=3D"https://abload.de/image.php?img=3Ddesktop3w4ks2.png">https://abl=
oad.de/image.php?img=3Ddesktop3w4ks2.png</a>
<a href=3D"https://abload.de/image.php?img=3Ddesktop4myjjn.png">https://abl=
oad.de/image.php?img=3Ddesktop4myjjn.png</a>
<a href=3D"https://abload.de/image.php?img=3Ddesktop5xwk6d.png">https://abl=
oad.de/image.php?img=3Ddesktop5xwk6d.png</a>
<a href=3D"https://abload.de/image.php?img=3Ddesktop6k8jb2.png">https://abl=
oad.de/image.php?img=3Ddesktop6k8jb2.png</a>

Before this new installation, everything was fine. Unfortunately, I don't k=
now
which version the old driver had. I didn't expect such a problem so I didn't
pay attention for it. The old system was installed round about one year ago.
There the driver was locked and never updated.

Problems now appear as soon as the desktop is fully loaded.
Games like 0 A.D. or Supertux seem not to be affected or only at a lesser
extent.

STEPS TO REPRODUCE
1. installation
2. booting system

OBSERVED RESULT
- KDE-Menu is semi-transparent (see second picture:
<a href=3D"https://abload.de/image.php?img=3Ddesktop4myjjn.png">https://abl=
oad.de/image.php?img=3Ddesktop4myjjn.png</a> )
- Icon titles are overlapped with colored blocks (see third picture in the
upper line: <a href=3D"https://abload.de/image.php?img=3Ddesktop5xwk6d.png"=
>https://abload.de/image.php?img=3Ddesktop5xwk6d.png</a> )
- Program windows are overlapped with colored fields (see fourth picture:
<a href=3D"https://abload.de/image.php?img=3Ddesktop6k8jb2.png">https://abl=
oad.de/image.php?img=3Ddesktop6k8jb2.png</a> )

EXPECTED RESULT
- Clear desktop presentation

SOFTWARE/OS VERSIONS
Linux/KDE Plasma: Kernel 5.1.7-1, openSUSE tumbleweed 64-bit (current versi=
on)
(available in About System)
KDE Plasma Version: 5.16.0
KDE Frameworks Version: 5.58.0
Qt Version: 5.12.3

MY HARDWARE/DRIVER:
Motherboard: Asus P5N32-E SLI Plus
CPU: Intel Core2 Duo E8200 &#64; 2,66GHz
RAM: 4 GiB
Graphics card: [NV49] Gigabyte Nvidia GeForce 7950 GX2 with 2x 512 GDDR3
Graphics Driver: nouveau=20
Graphics Renderer: NV49
OpenGL Version: 2.1 Mesa 19.0.5

ADDITIONAL INFORMATION
There are no problems when booting Windows XP. So I exclude defective hardw=
are.</pre>
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

--15614512970.4d4D4f.30311--

--===============0434138849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0434138849==--
