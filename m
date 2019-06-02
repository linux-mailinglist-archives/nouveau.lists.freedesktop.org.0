Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654A3258D
	for <lists+nouveau@lfdr.de>; Mon,  3 Jun 2019 00:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C789A86;
	Sun,  2 Jun 2019 22:29:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD91D8997E
 for <nouveau@lists.freedesktop.org>; Sun,  2 Jun 2019 22:29:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D81C472167; Sun,  2 Jun 2019 22:29:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 02 Jun 2019 22:29:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonasz@mac.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-cnAmQkmyLm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-75985-8800@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
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
Content-Type: multipart/mixed; boundary="===============1510386027=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1510386027==
Content-Type: multipart/alternative; boundary="15595145460.04b7bd78.26830"
Content-Transfer-Encoding: 7bit


--15595145460.04b7bd78.26830
Date: Sun, 2 Jun 2019 22:29:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #75 from jonasz@mac.com ---
Hi guys,

I have a dell t7610 centOS installation with two K6000 gpus with the latest
available firmware installed. These gpus have two DisplayPorts and two DVI
ports each.

There is no hdmi sound coming from any of the displayports, video is ok but=
 no
sound at all when using the latest NVIDIA available drivers. I did get sound
when previously using nouveau.

I have spent the last couple of days trying and testing things that I have
found over the web. FiR example
https://download.nvidia.com/XFree86/gpu-hdmi-audio-document/ Besides quite a
few crashes and reinstalls, still no=20

Could this patch be used in my situation?

Thanks in advance,

Regards

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595145460.04b7bd78.26830
Date: Sun, 2 Jun 2019 22:29:06 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c75">Commen=
t # 75</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jonasz&#64;mac.com" title=3D"jonasz&#64;mac.com">jonasz&#64;mac.com</a>
</span></b>
        <pre>Hi guys,

I have a dell t7610 centOS installation with two K6000 gpus with the latest
available firmware installed. These gpus have two DisplayPorts and two DVI
ports each.

There is no hdmi sound coming from any of the displayports, video is ok but=
 no
sound at all when using the latest NVIDIA available drivers. I did get sound
when previously using nouveau.

I have spent the last couple of days trying and testing things that I have
found over the web. FiR example
<a href=3D"https://download.nvidia.com/XFree86/gpu-hdmi-audio-document/">ht=
tps://download.nvidia.com/XFree86/gpu-hdmi-audio-document/</a> Besides quit=
e a
few crashes and reinstalls, still no=20

Could this patch be used in my situation?

Thanks in advance,

Regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595145460.04b7bd78.26830--

--===============1510386027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1510386027==--
