Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E554DE9
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 13:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1236E0E5;
	Tue, 25 Jun 2019 11:45:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0ED676E0E6
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 11:45:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B8EF72167; Tue, 25 Jun 2019 11:45:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 11:45:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110993-8800-5VkdT3KlF5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110993-8800@http.bugs.freedesktop.org/>
References: <bug-110993-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110993] GP107GLM [Quadro P1000 Mobile]: frequent
 failure to initialize displays on Thunderbolt dock
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
Content-Type: multipart/mixed; boundary="===============0045852658=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0045852658==
Content-Type: multipart/alternative; boundary="15614631510.f8Cea0.30688"
Content-Transfer-Encoding: 7bit


--15614631510.f8Cea0.30688
Date: Tue, 25 Jun 2019 11:45:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110993

--- Comment #1 from Markus Wanner <markus@bluegap.ch> ---
Created attachment 144633
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144633&action=3Dedit
test run 1 - annotated kern.log

Starting condition: dock already attached, but no monitors plugged into the
dock or the laptop.  Using nouveau without runpm_fixes.

The attached log is collected from /var/log/kern.log via ssh, so as to pres=
erve
most of the data even in case of a crash.  I annotated it with actions
performed and observations made at the following points in time:

Jun 21 10:32:37 calaton kernel: [   71.352739]: login
Jun 21 10:33:30 calaton kernel: [  124.428250]: plug in HDMI cable into lap=
top
directly

Observation after a couple of seconds: works, proper image shown on the Len=
ovo
display.  The grep command yields:

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

Jun 21 10:34:59 calaton kernel: [  213.433544]: pull out HDMI cable - all f=
ine
Jun 21 10:35:45 calaton kernel: [  259.672821]: plug HDMI cable into dock -=
 not
recognized, display lights up, but goes back into standby
Jun 21 10:36:57 calaton kernel: [  331.284818]: plug Dell (DP) into dock - =
not
recognized, display lights up, but goes back into standby
Jun 21 10:37:22 calaton kernel: [  356.470787]: pull HDMI cable out of dock=
 -
no change, display lights up, but goes back into standby
Jun 21 10:38:42 calaton kernel: [  436.169622]: plug HDMI cable into laptop=
 -
recognized
Jun 21 10:39:00 calaton kernel: [  453.731368]: unplug the Dock - no change,
Levovo on HDMI and internal display remain active.
Jun 21 10:40:10 calaton kernel: [  524.314909]: re-plug the Dock - Dell not
recognized
Jun 21 10:41:10 calaton kernel: [  584.005627]: pull HDMI cable from the la=
ptop
Jun 21 10:41:31 calaton kernel: [  604.833610]: plug HDMI cable into dock -
neither Dell nor Lenovo recognized
Jun 21 10:42:32 calaton kernel: [  665.790854]: pull the Dock
Jun 21 10:42:47 calaton kernel: [  681.020228]: plug the Dock again
Jun 21 10:44:05 calaton kernel: [  759.618299]: crash, laptop fully
unresponsive to keyboard, mouse or network inputs

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614631510.f8Cea0.30688
Date: Tue, 25 Jun 2019 11:45:51 +0000
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
   title=3D"NEW - GP107GLM [Quadro P1000 Mobile]: frequent failure to initi=
alize displays on Thunderbolt dock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110993#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GP107GLM [Quadro P1000 Mobile]: frequent failure to initi=
alize displays on Thunderbolt dock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110993">bug 11099=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
markus&#64;bluegap.ch" title=3D"Markus Wanner &lt;markus&#64;bluegap.ch&gt;=
"> <span class=3D"fn">Markus Wanner</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144633=
" name=3D"attach_144633" title=3D"test run 1 - annotated kern.log">attachme=
nt 144633</a> <a href=3D"attachment.cgi?id=3D144633&amp;action=3Dedit" titl=
e=3D"test run 1 - annotated kern.log">[details]</a></span>
test run 1 - annotated kern.log

Starting condition: dock already attached, but no monitors plugged into the
dock or the laptop.  Using nouveau without runpm_fixes.

The attached log is collected from /var/log/kern.log via ssh, so as to pres=
erve
most of the data even in case of a crash.  I annotated it with actions
performed and observations made at the following points in time:

Jun 21 10:32:37 calaton kernel: [   71.352739]: login
Jun 21 10:33:30 calaton kernel: [  124.428250]: plug in HDMI cable into lap=
top
directly

Observation after a couple of seconds: works, proper image shown on the Len=
ovo
display.  The grep command yields:

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

Jun 21 10:34:59 calaton kernel: [  213.433544]: pull out HDMI cable - all f=
ine
Jun 21 10:35:45 calaton kernel: [  259.672821]: plug HDMI cable into dock -=
 not
recognized, display lights up, but goes back into standby
Jun 21 10:36:57 calaton kernel: [  331.284818]: plug Dell (DP) into dock - =
not
recognized, display lights up, but goes back into standby
Jun 21 10:37:22 calaton kernel: [  356.470787]: pull HDMI cable out of dock=
 -
no change, display lights up, but goes back into standby
Jun 21 10:38:42 calaton kernel: [  436.169622]: plug HDMI cable into laptop=
 -
recognized
Jun 21 10:39:00 calaton kernel: [  453.731368]: unplug the Dock - no change,
Levovo on HDMI and internal display remain active.
Jun 21 10:40:10 calaton kernel: [  524.314909]: re-plug the Dock - Dell not
recognized
Jun 21 10:41:10 calaton kernel: [  584.005627]: pull HDMI cable from the la=
ptop
Jun 21 10:41:31 calaton kernel: [  604.833610]: plug HDMI cable into dock -
neither Dell nor Lenovo recognized
Jun 21 10:42:32 calaton kernel: [  665.790854]: pull the Dock
Jun 21 10:42:47 calaton kernel: [  681.020228]: plug the Dock again
Jun 21 10:44:05 calaton kernel: [  759.618299]: crash, laptop fully
unresponsive to keyboard, mouse or network inputs</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614631510.f8Cea0.30688--

--===============0045852658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0045852658==--
