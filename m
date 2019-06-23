Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0344FE0C
	for <lists+nouveau@lfdr.de>; Sun, 23 Jun 2019 22:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563A5898C7;
	Sun, 23 Jun 2019 20:50:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A007898C7
 for <nouveau@lists.freedesktop.org>; Sun, 23 Jun 2019 20:50:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6FC6672167; Sun, 23 Jun 2019 20:50:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 23 Jun 2019 20:50:45 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ak@axet.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110973-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110973] New: GeForce GT 750M Mac Edition backlight
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
Content-Type: multipart/mixed; boundary="===============0751753988=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0751753988==
Content-Type: multipart/alternative; boundary="15613230460.cbd4.24039"
Content-Transfer-Encoding: 7bit


--15613230460.cbd4.24039
Date: Sun, 23 Jun 2019 20:50:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110973

            Bug ID: 110973
           Summary: GeForce GT 750M Mac Edition backlight
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: ak@axet.ru
        QA Contact: nouveau@lists.freedesktop.org

Created attachment 144616
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144616&action=3Dedit
sudo acpidump -o acpidump.txt

Hello!

I notice when laptop display went off, it keep backlight on.

Technically speaking this:

# xset dpms force off

only set screen to black, without turning off LCD backlight.

My kernel has "acpi_backlight=3Dvendor" which enables backlight control from
function keys and gnome recognize those actions by displaying popup with
current brightness level.

Everything seems works fine, I've been able to turn display off using:

# echo 0 > /sys/devices/pnp0/00:03/backlight/gmux_backlight/brightness

But still no luck with 'xset'.

axet@axet-laptop:~$ ls -al /sys/class/backlight/
total 0
drwxr-xr-x  2 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 .
drwxr-xr-x 67 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 ..
lrwxrwxrwx  1 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 gmux_backlight ->
../../devices/pnp0/00:03/backlight/gmux_backlight
axet@axet-laptop:~$



Maybe related: https://bugs.freedesktop.org/show_bug.cgi?id=3D106869

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15613230460.cbd4.24039
Date: Sun, 23 Jun 2019 20:50:46 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition backlight"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110973">110973</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GeForce GT 750M Mac Edition backlight
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
          <td>ak&#64;axet.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144616=
" name=3D"attach_144616" title=3D"sudo acpidump -o acpidump.txt">attachment=
 144616</a> <a href=3D"attachment.cgi?id=3D144616&amp;action=3Dedit" title=
=3D"sudo acpidump -o acpidump.txt">[details]</a></span>
sudo acpidump -o acpidump.txt

Hello!

I notice when laptop display went off, it keep backlight on.

Technically speaking this:

# xset dpms force off

only set screen to black, without turning off LCD backlight.

My kernel has &quot;acpi_backlight=3Dvendor&quot; which enables backlight c=
ontrol from
function keys and gnome recognize those actions by displaying popup with
current brightness level.

Everything seems works fine, I've been able to turn display off using:

# echo 0 &gt; /sys/devices/pnp0/00:03/backlight/gmux_backlight/brightness

But still no luck with 'xset'.

axet&#64;axet-laptop:~$ ls -al /sys/class/backlight/
total 0
drwxr-xr-x  2 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 .
drwxr-xr-x 67 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 ..
lrwxrwxrwx  1 root root 0 =D0=B8=D1=8E=D0=BD 23 23:13 gmux_backlight -&gt;
../../devices/pnp0/00:03/backlight/gmux_backlight
axet&#64;axet-laptop:~$



Maybe related: <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight does not work on a MacBookAir3,2"
   href=3D"show_bug.cgi?id=3D106869">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D106869</a></pre>
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

--15613230460.cbd4.24039--

--===============0751753988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0751753988==--
