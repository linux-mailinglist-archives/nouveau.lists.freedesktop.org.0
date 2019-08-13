Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35378C42F
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 00:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE23F6E0DE;
	Tue, 13 Aug 2019 22:17:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59A9A6E107
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 22:17:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 55FFB7215A; Tue, 13 Aug 2019 22:17:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 13 Aug 2019 22:17:17 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111213-8800-MEbqnHX4t2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============1273795762=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1273795762==
Content-Type: multipart/alternative; boundary="15657346371.0cB67e8b.29280"
Content-Transfer-Encoding: 7bit


--15657346371.0cB67e8b.29280
Date: Tue, 13 Aug 2019 22:17:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #17 from KJ Liew <liewkj@yahoo.com> ---
On GeForce 9400, mpv works with both VA-API and VDPAU. This is on GNOME/Xor=
g, I
can't checkout GNOME/Wayland on this machine.

Linux 5.2.8-arch1-1-ARCH
local/libva-mesa-driver 19.1.4-1
local/mesa 19.1.4-1
local/mesa-vdpau 19.1.4-1

$ lspci | grep VGA
04:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400] (r=
ev
b1)

$ mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vaapi).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vaapi] 1280x720 vaapi[nv12]
AV: 00:00:24 / 00:02:03 (20%) A-V:  0.000

$ mpv --hwdec=3Dvdpau -vo=3Dvdpau /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
AV: 00:00:16 / 00:02:03 (13%) A-V:  0.000

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15657346371.0cB67e8b.29280
Date: Tue, 13 Aug 2019 22:17:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>On GeForce 9400, mpv works with both VA-API and VDPAU. This is=
 on GNOME/Xorg, I
can't checkout GNOME/Wayland on this machine.

Linux 5.2.8-arch1-1-ARCH
local/libva-mesa-driver 19.1.4-1
local/mesa 19.1.4-1
local/mesa-vdpau 19.1.4-1

$ lspci | grep VGA
04:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400] (r=
ev
b1)

$ mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vaapi).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vaapi] 1280x720 vaapi[nv12]
AV: 00:00:24 / 00:02:03 (20%) A-V:  0.000

$ mpv --hwdec=3Dvdpau -vo=3Dvdpau /path/to/MP4
Playing: /path/to/MP4
 (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
Using hardware decoding (vdpau).
AO: [pulse] 44100Hz stereo 2ch float
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
AV: 00:00:16 / 00:02:03 (13%) A-V:  0.000</pre>
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

--15657346371.0cB67e8b.29280--

--===============1273795762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1273795762==--
