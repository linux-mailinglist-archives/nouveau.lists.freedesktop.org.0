Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1A2FDE0
	for <lists+nouveau@lfdr.de>; Thu, 30 May 2019 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F98A6E15C;
	Thu, 30 May 2019 14:32:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8915D6E15C
 for <nouveau@lists.freedesktop.org>; Thu, 30 May 2019 14:32:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F15272167; Thu, 30 May 2019 14:32:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 30 May 2019 14:32:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: newbytee@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110797-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110797] New: No video if nomodeset is not set with
 GTX 460
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
Content-Type: multipart/mixed; boundary="===============0542355916=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0542355916==
Content-Type: multipart/alternative; boundary="15592267680.aADF2bfC6.20372"
Content-Transfer-Encoding: 7bit


--15592267680.aADF2bfC6.20372
Date: Thu, 30 May 2019 14:32:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110797

            Bug ID: 110797
           Summary: No video if nomodeset is not set with GTX 460
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: newbytee@protonmail.com
        QA Contact: xorg-team@lists.x.org

Greetings!

I have a PC (Dell XPS 8100) with an i7 870 and a GTX 460. No parts have been
changed from its factory state aside from CMOS battery. I attempted to inst=
all
Fedora 30 on it very recently, and what I soon noticed was that unless I ad=
ded
the nomodeset kernel parameter the monitor would say "No signal" soon after
boot. With nomodeset enabled it boots as normal and everything works, except
the things that usually do not work when nomodeset is set.

Note that this occurs both with nouveau and NVIDIA's proprietary driver,
however the GPU works in Windows 10 so I do not believe that this is a hard=
ware
fault. I have also made sure to verify that I am using the latest BIOS
available for the motherboard.

Regards, Newbyte.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592267680.aADF2bfC6.20372
Date: Thu, 30 May 2019 14:32:48 +0000
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
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797">110797</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No video if nomodeset is not set with GTX 460
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
          <td>newbytee&#64;protonmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Greetings!

I have a PC (Dell XPS 8100) with an i7 870 and a GTX 460. No parts have been
changed from its factory state aside from CMOS battery. I attempted to inst=
all
Fedora 30 on it very recently, and what I soon noticed was that unless I ad=
ded
the nomodeset kernel parameter the monitor would say &quot;No signal&quot; =
soon after
boot. With nomodeset enabled it boots as normal and everything works, except
the things that usually do not work when nomodeset is set.

Note that this occurs both with nouveau and NVIDIA's proprietary driver,
however the GPU works in Windows 10 so I do not believe that this is a hard=
ware
fault. I have also made sure to verify that I am using the latest BIOS
available for the motherboard.

Regards, Newbyte.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592267680.aADF2bfC6.20372--

--===============0542355916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0542355916==--
