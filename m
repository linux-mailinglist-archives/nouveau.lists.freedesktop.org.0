Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF4747F1
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 09:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAD56E630;
	Thu, 25 Jul 2019 07:16:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C7716E630
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jul 2019 07:16:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3025972167; Thu, 25 Jul 2019 07:16:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 25 Jul 2019 07:16:35 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] New: VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============1849684757=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1849684757==
Content-Type: multipart/alternative; boundary="15640389950.644edf.23820"
Content-Transfer-Encoding: 7bit


--15640389950.644edf.23820
Date: Thu, 25 Jul 2019 07:16:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

            Bug ID: 111213
           Summary: VA-API nouveau SIGSEGV and asserts
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: liewkj@yahoo.com
        QA Contact: nouveau@lists.freedesktop.org

Tested hardware: Geforce 9300 mGPU (NVAC), GT730-GK208B (NV106)
VA-API apps: gstreamer-vaapi, Chromium-vaapi-bin(AUR)
OS: ArchLinux x86_64 kernel 5.2.2-arch1-1-ARCH
GUI: GNOME/Wayland using nouveau

- vainfo & vdpauinfo SIGSEV due to NULL pointer
ArchLinux discussion thread
https://bbs.archlinux.org/viewtopic.php?id=3D247466

- h264 video decode failed with assertion and tendency to crash GNOME/GUI
Test h264 clip:
$ youtube-dl -f mp4 https://www.youtube.com/watch?v=3DazvR__GRQic
Gstreamer command line
$ gst-launch-1.0 playbin uri=3Dfile:///path/to/MP4
or
$ gst-launch-1.0 filesrc location=3D/path/to/MP4 ! qtdemux ! vaapidecodebin=
 !
vaapisink

Use enhanced-h264ify plugin on Chromium to playback the same h264 video clip
from YouTube.com
Geforce 9300 mGPU - video played as garbage, browser may crash
GT730 - fallback to FFmpegVideoDecoder after asserts
ve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
romium/chromium --type=3Dgpu-process
--field-trial-handle=3D7734813049068668419,17986421265460211344,131072
--disable-breakpad
--gpu-preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAg=
AAAAAAAAA
--service-request-channel-token=3D7551475798706255496:
../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nve4_compute.c:396:
nve4_compute_validate_constbufs: Assertion `i > 0' failed.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15640389950.644edf.23820
Date: Thu, 25 Jul 2019 07:16:35 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">111213</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>VA-API nouveau SIGSEGV and asserts
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
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
          <td>liewkj&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Tested hardware: Geforce 9300 mGPU (NVAC), GT730-GK208B (NV106)
VA-API apps: gstreamer-vaapi, Chromium-vaapi-bin(AUR)
OS: ArchLinux x86_64 kernel 5.2.2-arch1-1-ARCH
GUI: GNOME/Wayland using nouveau

- vainfo &amp; vdpauinfo SIGSEV due to NULL pointer
ArchLinux discussion thread
<a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D247466">https://bbs=
.archlinux.org/viewtopic.php?id=3D247466</a>

- h264 video decode failed with assertion and tendency to crash GNOME/GUI
Test h264 clip:
$ youtube-dl -f mp4 <a href=3D"https://www.youtube.com/watch?v=3DazvR__GRQi=
c">https://www.youtube.com/watch?v=3DazvR__GRQic</a>
Gstreamer command line
$ gst-launch-1.0 playbin uri=3Dfile:///path/to/MP4
or
$ gst-launch-1.0 filesrc location=3D/path/to/MP4 ! qtdemux ! vaapidecodebin=
 !
vaapisink

Use enhanced-h264ify plugin on Chromium to playback the same h264 video clip
from YouTube.com
Geforce 9300 mGPU - video played as garbage, browser may crash
GT730 - fallback to FFmpegVideoDecoder after asserts
ve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
romium/chromium --type=3Dgpu-process
--field-trial-handle=3D7734813049068668419,17986421265460211344,131072
--disable-breakpad
--gpu-preferences=3DKAAAAAAAAAAgAACgAQAAAAAAAAAAAGAAAAAAAAAAAAAIAAAAAAAAAAg=
AAAAAAAAA
--service-request-channel-token=3D7551475798706255496:
../mesa-19.1.3/src/gallium/drivers/nouveau/nvc0/nve4_compute.c:396:
nve4_compute_validate_constbufs: Assertion `i &gt; 0' failed.</pre>
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

--15640389950.644edf.23820--

--===============1849684757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1849684757==--
