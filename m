Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E860D554B8
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 18:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B256E172;
	Tue, 25 Jun 2019 16:40:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E33DD6E175
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 16:39:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E038072167; Tue, 25 Jun 2019 16:39:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 16:40:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sjon@hortensius.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110996-8800-0hRCl0UOyQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110996-8800@http.bugs.freedesktop.org/>
References: <bug-110996-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110996] swaywm (wayland) crashes when turning off
 monitors through dpms
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
Content-Type: multipart/mixed; boundary="===============0813009700=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0813009700==
Content-Type: multipart/alternative; boundary="15614807991.D7e67.20469"
Content-Transfer-Encoding: 7bit


--15614807991.D7e67.20469
Date: Tue, 25 Jun 2019 16:39:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110996

--- Comment #2 from Sjon <sjon@hortensius.net> ---
Created attachment 144636
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144636&action=3Dedit
filtered kernel messages with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

I'm not sure what caused the 'core notifier timeout' messages to start - but
there was at least half an hour between that error and the actual crash. I'=
ll
attach the requested log - it's huge and doesn't show the same hang. The
problem did occur, my monitors turned off and my machine needed a reboot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614807991.D7e67.20469
Date: Tue, 25 Jun 2019 16:39:59 +0000
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
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996">bug 11099=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sjon&#64;hortensius.net" title=3D"Sjon &lt;sjon&#64;hortensius.net&gt;"> <s=
pan class=3D"fn">Sjon</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144636=
" name=3D"attach_144636" title=3D"filtered kernel messages with drm.debug=
=3D0x14 nouveau.debug=3Ddisp=3Dtrace">attachment 144636</a> <a href=3D"atta=
chment.cgi?id=3D144636&amp;action=3Dedit" title=3D"filtered kernel messages=
 with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace">[details]</a></span>
filtered kernel messages with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

I'm not sure what caused the 'core notifier timeout' messages to start - but
there was at least half an hour between that error and the actual crash. I'=
ll
attach the requested log - it's huge and doesn't show the same hang. The
problem did occur, my monitors turned off and my machine needed a reboot</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614807991.D7e67.20469--

--===============0813009700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0813009700==--
