Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FB54CB5
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 12:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948B26E0D0;
	Tue, 25 Jun 2019 10:51:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E6476E0D3
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 10:51:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7BA2772167; Tue, 25 Jun 2019 10:51:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 10:51:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: markus@bluegap.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110993-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110993] New: GP107GLM [Quadro P1000 Mobile]:
 frequent failure to initialize displays on Thunderbolt dock
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
Content-Type: multipart/mixed; boundary="===============1022817006=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1022817006==
Content-Type: multipart/alternative; boundary="15614598711.A666b24F.21670"
Content-Transfer-Encoding: 7bit


--15614598711.A666b24F.21670
Date: Tue, 25 Jun 2019 10:51:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110993

            Bug ID: 110993
           Summary: GP107GLM [Quadro P1000 Mobile]: frequent failure to
                    initialize displays on Thunderbolt dock
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: markus@bluegap.ch
        QA Contact: xorg-team@lists.x.org

When connecting to the Thunderbolt 3 Dock, the monitors attached to it more
often remain black rather than showing a proper image.  Sometimes the Laptop
freezes entirely, other times just one of the two comes up, most of the tim=
e,
they remain black and eventually enter standby.

I'm using a Lenovo P1 featuring a Quadro P1000 Mobile GPU.  An integrated G=
PU
is wired to the internal display as eDP-1.  The Nvidia card exposes an HDMI
port on the laptop.  Plugging a monitor there directly usually works.  Vie =
the
docking station, I get another 3 ports controlled by the Nvidia GPU.  These=
 are
either HDMI or DisplayPort.  I have two monitors for experimentation, a Dell
one and a Lenovo one.

I'm running a Linux 5.2-rc5 kernel and the nouveau driver compiled from a
current checkout of the git repo of Ben Skeggs
(https://github.com/skeggsb/nouveau/tree/f91e915b6a12c281aed4401a869881f293=
b72d4e).
 Most of the time, I'm running with the runpm_fixes of Karol Herbst (that is
the last five revisions from
https://github.com/karolherbst/nouveau/tree/runpm_fixes).

The output of `grep . /sys/class/drm/card*-*/status` after a start w/o the =
dock
or any display attached is:

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

I'll provide further details of what I did together with the corresponding
kernel logs with tracing enabled in follow-up comments and attachments.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614598711.A666b24F.21670
Date: Tue, 25 Jun 2019 10:51:11 +0000
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
   title=3D"NEW - GP107GLM [Quadro P1000 Mobile]: frequent failure to initi=
alize displays on Thunderbolt dock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110993">110993</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GP107GLM [Quadro P1000 Mobile]: frequent failure to initializ=
e displays on Thunderbolt dock
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>markus&#64;bluegap.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When connecting to the Thunderbolt 3 Dock, the monitors attach=
ed to it more
often remain black rather than showing a proper image.  Sometimes the Laptop
freezes entirely, other times just one of the two comes up, most of the tim=
e,
they remain black and eventually enter standby.

I'm using a Lenovo P1 featuring a Quadro P1000 Mobile GPU.  An integrated G=
PU
is wired to the internal display as eDP-1.  The Nvidia card exposes an HDMI
port on the laptop.  Plugging a monitor there directly usually works.  Vie =
the
docking station, I get another 3 ports controlled by the Nvidia GPU.  These=
 are
either HDMI or DisplayPort.  I have two monitors for experimentation, a Dell
one and a Lenovo one.

I'm running a Linux 5.2-rc5 kernel and the nouveau driver compiled from a
current checkout of the git repo of Ben Skeggs
(<a href=3D"https://github.com/skeggsb/nouveau/tree/f91e915b6a12c281aed4401=
a869881f293b72d4e">https://github.com/skeggsb/nouveau/tree/f91e915b6a12c281=
aed4401a869881f293b72d4e</a>).
 Most of the time, I'm running with the runpm_fixes of Karol Herbst (that is
the last five revisions from
<a href=3D"https://github.com/karolherbst/nouveau/tree/runpm_fixes">https:/=
/github.com/karolherbst/nouveau/tree/runpm_fixes</a>).

The output of `grep . /sys/class/drm/card*-*/status` after a start w/o the =
dock
or any display attached is:

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

I'll provide further details of what I did together with the corresponding
kernel logs with tracing enabled in follow-up comments and attachments.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614598711.A666b24F.21670--

--===============1022817006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1022817006==--
