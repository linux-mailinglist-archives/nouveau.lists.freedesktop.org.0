Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D9C1124
	for <lists+nouveau@lfdr.de>; Sat, 28 Sep 2019 17:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4156E141;
	Sat, 28 Sep 2019 15:14:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 555816E16D
 for <nouveau@lists.freedesktop.org>; Sat, 28 Sep 2019 15:14:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5206672162; Sat, 28 Sep 2019 15:14:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 28 Sep 2019 15:14:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: prymoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-jIq9qJ3whh@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1200963770=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1200963770==
Content-Type: multipart/alternative; boundary="15696836955.81DaEFFcf.11536"
Content-Transfer-Encoding: 7bit


--15696836955.81DaEFFcf.11536
Date: Sat, 28 Sep 2019 15:14:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #87 from Przemys=C5=82aw Kopa <prymoo@gmail.com> ---
(In reply to Lukas Wunner from comment #86)
> Please provide the output of "grep .
> /sys/bus/pci/devices/0000:01:00.1/power/*" after echoing "auto" to its
> "control" file.

Here it is:
/sys/bus/pci/devices/0000:01:00.1/power/async:enabled
grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=C5=82=
=C4=85d
wej=C5=9Bcia/wyj=C5=9Bcia // translates to: "Input/output error"
/sys/bus/pci/devices/0000:01:00.1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:105383
/sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
/sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:6695
/sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
/sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696836955.81DaEFFcf.11536
Date: Sat, 28 Sep 2019 15:14:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c87">Commen=
t # 87</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
prymoo&#64;gmail.com" title=3D"Przemys=C5=82aw Kopa &lt;prymoo&#64;gmail.co=
m&gt;"> <span class=3D"fn">Przemys=C5=82aw Kopa</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href=3D"show_bug.cgi?id=3D75=
985#c86">comment #86</a>)
<span class=3D"quote">&gt; Please provide the output of &quot;grep .
&gt; /sys/bus/pci/devices/0000:01:00.1/power/*&quot; after echoing &quot;au=
to&quot; to its
&gt; &quot;control&quot; file.</span >

Here it is:
/sys/bus/pci/devices/0000:01:00.1/power/async:enabled
grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=C5=82=
=C4=85d
wej=C5=9Bcia/wyj=C5=9Bcia // translates to: &quot;Input/output error&quot;
/sys/bus/pci/devices/0000:01:00.1/power/control:auto
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
/sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:105383
/sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
/sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
/sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:6695
/sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
/sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696836955.81DaEFFcf.11536--

--===============1200963770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1200963770==--
