Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10341C8853
	for <lists+nouveau@lfdr.de>; Wed,  2 Oct 2019 14:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540F16E96C;
	Wed,  2 Oct 2019 12:24:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54F7E6E969
 for <nouveau@lists.freedesktop.org>; Wed,  2 Oct 2019 12:24:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5171372162; Wed,  2 Oct 2019 12:24:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 02 Oct 2019 12:24:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-EViFxxuLkK@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0237234027=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0237234027==
Content-Type: multipart/alternative; boundary="15700190925.E65dAdA8.21169"
Content-Transfer-Encoding: 7bit


--15700190925.E65dAdA8.21169
Date: Wed, 2 Oct 2019 12:24:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #97 from Lukas Wunner <lukas@wunner.de> ---
(In reply to Przemys=C5=82aw Kopa from comment #87)
> (In reply to Lukas Wunner from comment #86)
> > Please provide the output of "grep .
> > /sys/bus/pci/devices/0000:01:00.1/power/*" after echoing "auto" to its
> > "control" file.
>=20
> Here it is:
> /sys/bus/pci/devices/0000:01:00.1/power/async:enabled
> grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=C5=
=82=C4=85d
> wej=C5=9Bcia/wyj=C5=9Bcia // translates to: "Input/output error"
> /sys/bus/pci/devices/0000:01:00.1/power/control:auto
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:105383
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:6695
> /sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
> /sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled

Okay, there are no child devices keeping the HDA awake and no runtime PM
references are held on the HDA device either.  Why doesn't it runtime suspe=
nd?=20
Chances are that the ->runtime_idle hook returns -EBUSY for some reason.  W=
e've
had issues like this in the past, see bug #106597 and #106957.

I'm attaching a debug patch (the same that I've created for the other two b=
ug
reports, but rebased on v5.3).  Would you be able to apply it to your kerne=
l,
recompile, reboot, then attach the dmesg output to this bugzilla entry here?

You can add "log_buf_len=3D10M ignore_loglevel" to the command line to ensu=
re
that dmesg isn't truncated and contains all debug output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700190925.E65dAdA8.21169
Date: Wed, 2 Oct 2019 12:24:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c97">Commen=
t # 97</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Przemys=C5=82aw Kopa from <a href=3D"show_bug.cgi=
?id=3D75985#c87">comment #87</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c86">comment #86</a>)
&gt; &gt; Please provide the output of &quot;grep .
&gt; &gt; /sys/bus/pci/devices/0000:01:00.1/power/*&quot; after echoing &qu=
ot;auto&quot; to its
&gt; &gt; &quot;control&quot; file.
&gt;=20
&gt; Here it is:
&gt; /sys/bus/pci/devices/0000:01:00.1/power/async:enabled
&gt; grep: /sys/bus/pci/devices/0000:01:00.1/power/autosuspend_delay_ms: B=
=C5=82=C4=85d
&gt; wej=C5=9Bcia/wyj=C5=9Bcia // translates to: &quot;Input/output error&q=
uot;
&gt; /sys/bus/pci/devices/0000:01:00.1/power/control:auto
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_active_kids:0
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_active_time:105383
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_enabled:enabled
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_status:active
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_suspended_time:6695
&gt; /sys/bus/pci/devices/0000:01:00.1/power/runtime_usage:0
&gt; /sys/bus/pci/devices/0000:01:00.1/power/wakeup:disabled</span >

Okay, there are no child devices keeping the HDA awake and no runtime PM
references are held on the HDA device either.  Why doesn't it runtime suspe=
nd?=20
Chances are that the -&gt;runtime_idle hook returns -EBUSY for some reason.=
  We've
had issues like this in the past, see <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [vga_switcheroo] commit 07f4f97d7b4bf325d9f558=
c5b58230387e4e57e0 breaks dpm on Alienware 15R3"
   href=3D"show_bug.cgi?id=3D106597">bug #106597</a> and #106957.

I'm attaching a debug patch (the same that I've created for the other two b=
ug
reports, but rebased on v5.3).  Would you be able to apply it to your kerne=
l,
recompile, reboot, then attach the dmesg output to this bugzilla entry here?

You can add &quot;log_buf_len=3D10M ignore_loglevel&quot; to the command li=
ne to ensure
that dmesg isn't truncated and contains all debug output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700190925.E65dAdA8.21169--

--===============0237234027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0237234027==--
