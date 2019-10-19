Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1CDD9C8
	for <lists+nouveau@lfdr.de>; Sat, 19 Oct 2019 19:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29206896E7;
	Sat, 19 Oct 2019 17:35:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0022689668
 for <nouveau@lists.freedesktop.org>; Sat, 19 Oct 2019 17:35:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EC60C720E2; Sat, 19 Oct 2019 17:35:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 19 Oct 2019 17:35:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: dooby.dave@virgin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-112070-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112070] New: H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
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
Content-Type: multipart/mixed; boundary="===============1306156838=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1306156838==
Content-Type: multipart/alternative; boundary="15715065390.D086Ba6B.32578"
Content-Transfer-Encoding: 7bit


--15715065390.D086Ba6B.32578
Date: Sat, 19 Oct 2019 17:35:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

            Bug ID: 112070
           Summary: H/W Acceleration sufficiently buggy on Debian to hard
                    lock machine GeForce 7600 GO
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: other
            Status: NEW
          Severity: critical
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: dooby.dave@virgin.net
        QA Contact: xorg-team@lists.x.org

Created attachment 145774
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145774&action=3Dedit
logs

So. I have big problems with nouveau driver or implementation of nouveau dr=
iver
(by Debian). I emailed debian-x@lists.debian.org team but have heard nothing
back.

Straight out the box, some graphical features do not work / are buggy / mig=
ht
hang the system - depending on which DE you use and what eye-candy it has
enabled by default. XFCE/LXQT appear unaffected yet KDE Plasma is producing
many graphical anomalies/artefacts and gdm did hang.

In every DE and version of Debian since Jessie, 360 degree videos (in brows=
er)
just display noise. This behaviour changes when using the proprietary 304xx
nvidia driver, but the videos still do not function properly - though you do
now see the correct video patchwork the 360deg video is generated from.

In trying to exercise this problem, I discovered glxgears works fine, yet
glmark2 will always crash with a segmentation fault between tests 2 and 3. =
With
nvidia driver installed, glmark2 fails to start at all and gives this :-


libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
** GLX does not support GLX_EXT_swap_control or GLX_MESA_swap_control!
X Error of failed request: BadValue (integer parameter out of range for
operation)
Major opcode of failed request: 155 (GLX)
Minor opcode of failed request: 24 (X_GLXCreateNewContext)
Value in failed request: 0x0
Serial number of failed request: 39
Current serial number in output stream: 40


Might be worth noting that after installation of the proprietary driver apt=
 was
reporting:-

ldconfig: /usr/lib/x86_64-linux-gnu/libGL.so.1 is not a symbolic link


I had a brief fling with Piglit. It crashed however. And when trying to use
valgrind it looked like it was going to take over a day.

Attached are a Xorg.0.log (should module "nv" be being loaded?) and a dmesg
output - both from a Debian Stretch install. I have concurrent installs of
Buster and Wheezy I can fire up if it will help.=20

The issue might not exist (or is different) in Wheezy. The 360 degree videos
after a fresh install look like the other releases after the proprietary dr=
iver
has been installed, ie I can see the patchwork video rather than just noise.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715065390.D086Ba6B.32578
Date: Sat, 19 Oct 2019 17:35:39 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">112070</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>H/W Acceleration sufficiently buggy on Debian to hard lock ma=
chine GeForce 7600 GO
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
          <td>other
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
          <td>dooby.dave&#64;virgin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145774=
" name=3D"attach_145774" title=3D"logs">attachment 145774</a> <a href=3D"at=
tachment.cgi?id=3D145774&amp;action=3Dedit" title=3D"logs">[details]</a></s=
pan>
logs

So. I have big problems with nouveau driver or implementation of nouveau dr=
iver
(by Debian). I emailed <a href=3D"mailto:debian-x&#64;lists.debian.org">deb=
ian-x&#64;lists.debian.org</a> team but have heard nothing
back.

Straight out the box, some graphical features do not work / are buggy / mig=
ht
hang the system - depending on which DE you use and what eye-candy it has
enabled by default. XFCE/LXQT appear unaffected yet KDE Plasma is producing
many graphical anomalies/artefacts and gdm did hang.

In every DE and version of Debian since Jessie, 360 degree videos (in brows=
er)
just display noise. This behaviour changes when using the proprietary 304xx
nvidia driver, but the videos still do not function properly - though you do
now see the correct video patchwork the 360deg video is generated from.

In trying to exercise this problem, I discovered glxgears works fine, yet
glmark2 will always crash with a segmentation fault between tests 2 and 3. =
With
nvidia driver installed, glmark2 fails to start at all and gives this :-


libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
** GLX does not support GLX_EXT_swap_control or GLX_MESA_swap_control!
X Error of failed request: BadValue (integer parameter out of range for
operation)
Major opcode of failed request: 155 (GLX)
Minor opcode of failed request: 24 (X_GLXCreateNewContext)
Value in failed request: 0x0
Serial number of failed request: 39
Current serial number in output stream: 40


Might be worth noting that after installation of the proprietary driver apt=
 was
reporting:-

ldconfig: /usr/lib/x86_64-linux-gnu/libGL.so.1 is not a symbolic link


I had a brief fling with Piglit. It crashed however. And when trying to use
valgrind it looked like it was going to take over a day.

Attached are a Xorg.0.log (should module &quot;nv&quot; be being loaded?) a=
nd a dmesg
output - both from a Debian Stretch install. I have concurrent installs of
Buster and Wheezy I can fire up if it will help.=20

The issue might not exist (or is different) in Wheezy. The 360 degree videos
after a fresh install look like the other releases after the proprietary dr=
iver
has been installed, ie I can see the patchwork video rather than just noise=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715065390.D086Ba6B.32578--

--===============1306156838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1306156838==--
