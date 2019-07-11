Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C51C65957
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890D89A14;
	Thu, 11 Jul 2019 14:49:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFBB489A14
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:49:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A7B8F72167; Thu, 11 Jul 2019 14:49:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 14:49:30 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: conde.philippe@skynet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111110-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111110] New: Nvidia quadro + nouveau : second
 terminal wake up but doesn't more display
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
Content-Type: multipart/mixed; boundary="===============1521472813=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1521472813==
Content-Type: multipart/alternative; boundary="15628565700.08CEAE.22107"
Content-Transfer-Encoding: 7bit


--15628565700.08CEAE.22107
Date: Thu, 11 Jul 2019 14:49:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111110

            Bug ID: 111110
           Summary: Nvidia quadro + nouveau : second terminal wake up but
                    doesn't more display
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: conde.philippe@skynet.be
        QA Contact: nouveau@lists.freedesktop.org

Created attachment 144764
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144764&action=3Dedit
output of dmesg

I have a OpenSUSE tumbleweed system with a nvidia quadro K4200 on which 2
screens are connected=20
- one on the DVI port
- the second on the display port 1 (DP1)
the two screens use resolution 1920*1080 and are defined as a  virtual scre=
en
of 3480*1080.
I use nouveau as driver; DE is KDE

This worked form years without problem. After installation of snapshot 2019=
0708
I rebooted and the second screen doesn't more display anything.

in journalctl I find this error
Jul 11 08:30:04 hpprol2 kernel: nouveau 0000:0a:00.0: disp: outp 03:0006:0f=
42:
training failed

The second screens wake up on some action (boot, starting xorg, login etc..=
.)
but after some seconds display " Display port: no signal"

As requested by OpenSUSE support I installed the last kernel , Mesa et
xf86-video-nouveau

rpm -qa Mesa*
Mesa-libGL1-19.1.2-977.1.x86_64
Mesa-KHR-devel-19.1.2-977.1.x86_64
Mesa-libGL-devel-19.1.2-977.1.x86_64
Mesa-gallium-32bit-19.1.2-977.1.x86_64
Mesa-libGL1-32bit-19.1.2-977.1.x86_64
Mesa-libGLESv2-2-19.1.1-223.1.x86_64
Mesa-libva-19.1.1-223.1.x86_64
Mesa-19.1.2-977.1.x86_64
Mesa-dri-19.1.2-977.1.x86_64
Mesa-libglapi0-19.1.1-223.1.x86_64
Mesa-libEGL1-19.1.2-977.1.x86_64
Mesa-gallium-19.1.2-977.1.x86_64
Mesa-demo-x-8.4.0-1.6.x86_64
Mesa-dri-nouveau-19.1.2-977.1.x86_64
Mesa-dri-32bit-19.1.2-977.1.x86_64
Mesa-libEGL1-32bit-19.1.1-223.1.x86_64
Mesa-32bit-19.1.2-977.1.x86_64
Mesa-libEGL-devel-19.1.2-977.1.x86_64
Mesa-libglapi0-32bit-19.1.1-223.1.x86_64

uname -a
Linux hpprol2 5.2.0-2.gfd43abf-default #1 SMP Thu Jul 11 05:19:05 UTC 2019
(fd43abf) x86_64 x86_64 x86_64 GNU/Linux

rpm -qa xf86-video-nouveau
xf86-video-nouveau-1.0.15-40.11.x86_64

The problem remains. I attach here the output of dmesg.

See also https://bugzilla.opensuse.org/show_bug.cgi?id=3D1141041

Regards
Philippe Cond=C3=A9

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15628565700.08CEAE.22107
Date: Thu, 11 Jul 2019 14:49:30 +0000
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
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110">111110</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia quadro + nouveau : second terminal wake up but doesn't=
 more display
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>conde.philippe&#64;skynet.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144764=
" name=3D"attach_144764" title=3D"output of dmesg">attachment 144764</a> <a=
 href=3D"attachment.cgi?id=3D144764&amp;action=3Dedit" title=3D"output of d=
mesg">[details]</a></span>
output of dmesg

I have a OpenSUSE tumbleweed system with a nvidia quadro K4200 on which 2
screens are connected=20
- one on the DVI port
- the second on the display port 1 (DP1)
the two screens use resolution 1920*1080 and are defined as a  virtual scre=
en
of 3480*1080.
I use nouveau as driver; DE is KDE

This worked form years without problem. After installation of snapshot 2019=
0708
I rebooted and the second screen doesn't more display anything.

in journalctl I find this error
Jul 11 08:30:04 hpprol2 kernel: nouveau 0000:0a:00.0: disp: outp 03:0006:0f=
42:
training failed

The second screens wake up on some action (boot, starting xorg, login etc..=
.)
but after some seconds display &quot; Display port: no signal&quot;

As requested by OpenSUSE support I installed the last kernel , Mesa et
xf86-video-nouveau

rpm -qa Mesa*
Mesa-libGL1-19.1.2-977.1.x86_64
Mesa-KHR-devel-19.1.2-977.1.x86_64
Mesa-libGL-devel-19.1.2-977.1.x86_64
Mesa-gallium-32bit-19.1.2-977.1.x86_64
Mesa-libGL1-32bit-19.1.2-977.1.x86_64
Mesa-libGLESv2-2-19.1.1-223.1.x86_64
Mesa-libva-19.1.1-223.1.x86_64
Mesa-19.1.2-977.1.x86_64
Mesa-dri-19.1.2-977.1.x86_64
Mesa-libglapi0-19.1.1-223.1.x86_64
Mesa-libEGL1-19.1.2-977.1.x86_64
Mesa-gallium-19.1.2-977.1.x86_64
Mesa-demo-x-8.4.0-1.6.x86_64
Mesa-dri-nouveau-19.1.2-977.1.x86_64
Mesa-dri-32bit-19.1.2-977.1.x86_64
Mesa-libEGL1-32bit-19.1.1-223.1.x86_64
Mesa-32bit-19.1.2-977.1.x86_64
Mesa-libEGL-devel-19.1.2-977.1.x86_64
Mesa-libglapi0-32bit-19.1.1-223.1.x86_64

uname -a
Linux hpprol2 5.2.0-2.gfd43abf-default #1 SMP Thu Jul 11 05:19:05 UTC 2019
(fd43abf) x86_64 x86_64 x86_64 GNU/Linux

rpm -qa xf86-video-nouveau
xf86-video-nouveau-1.0.15-40.11.x86_64

The problem remains. I attach here the output of dmesg.

See also <a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1141041=
">https://bugzilla.opensuse.org/show_bug.cgi?id=3D1141041</a>

Regards
Philippe Cond=C3=A9</pre>
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

--15628565700.08CEAE.22107--

--===============1521472813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1521472813==--
