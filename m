Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B97156DD
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 02:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA3689C28;
	Tue,  7 May 2019 00:16:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34AA089C25
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 00:16:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 314C47215A; Tue,  7 May 2019 00:16:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 07 May 2019 00:16:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: horsley1953@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110631-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110631] New: EDID confusion with LG 4K TV as monitor
 running X rather than wayland
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
Content-Type: multipart/mixed; boundary="===============0358434531=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0358434531==
Content-Type: multipart/alternative; boundary="15571881611.31e4Bd.2977"
Content-Transfer-Encoding: 7bit


--15571881611.31e4Bd.2977
Date: Tue, 7 May 2019 00:16:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110631

            Bug ID: 110631
           Summary: EDID confusion with LG 4K TV as monitor running X
                    rather than wayland
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: horsley1953@gmail.com
        QA Contact: xorg-team@lists.x.org

Starting with fedora 28 and going through fedora 30, the nouveau driver
produces a bad signal when trying to display X on my LG OLEDB6P 4K televisi=
on.

Weirdly, with what is presumably the same driver, it displays a full UHD
resolution when running wayland rather than X. (I really don't understand w=
hy
something as low level as the video timing would be different between wayla=
nd
and X, but if someone does know, they probably know where the bug is too :-=
).

This isn't restricted to fedora either. I've just been testing a multi-boot=
 USB
stick, and the drivers on the ubuntu 19.04 live CD and the System Rescue CD
6.0.3 produce the same "bad signal" errors on this monitor.

For details (like X log files) see:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1575391

and=20

https://bugzilla.redhat.com/show_bug.cgi?id=3D1648608

If I add nomodeset and forcevesa kernel parameters, I can boot and see (low=
er
resolution) video rather than a black screen.

Switching to the nvidia binary drivers makes the display work properly agai=
n.

Booting the USB stick on different systems with more conventional resolution
monitors, nouveau works fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571881611.31e4Bd.2977
Date: Tue, 7 May 2019 00:16:01 +0000
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
   title=3D"NEW - EDID confusion with LG 4K TV as monitor running X rather =
than wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110631">110631</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>EDID confusion with LG 4K TV as monitor running X rather than=
 wayland
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
          <td>horsley1953&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Starting with fedora 28 and going through fedora 30, the nouve=
au driver
produces a bad signal when trying to display X on my LG OLEDB6P 4K televisi=
on.

Weirdly, with what is presumably the same driver, it displays a full UHD
resolution when running wayland rather than X. (I really don't understand w=
hy
something as low level as the video timing would be different between wayla=
nd
and X, but if someone does know, they probably know where the bug is too :-=
).

This isn't restricted to fedora either. I've just been testing a multi-boot=
 USB
stick, and the drivers on the ubuntu 19.04 live CD and the System Rescue CD
6.0.3 produce the same &quot;bad signal&quot; errors on this monitor.

For details (like X log files) see:

<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1575391">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1575391</a>

and=20

<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1648608">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1648608</a>

If I add nomodeset and forcevesa kernel parameters, I can boot and see (low=
er
resolution) video rather than a black screen.

Switching to the nvidia binary drivers makes the display work properly agai=
n.

Booting the USB stick on different systems with more conventional resolution
monitors, nouveau works fine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571881611.31e4Bd.2977--

--===============0358434531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0358434531==--
