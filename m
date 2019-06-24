Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30285062E
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 11:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33F89A62;
	Mon, 24 Jun 2019 09:56:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E571F89A60
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2019 09:56:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E274772167; Mon, 24 Jun 2019 09:56:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 24 Jun 2019 09:56:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dan@reactivated.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-zor389w3TL@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0968679350=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0968679350==
Content-Type: multipart/alternative; boundary="15613701639.Ba3b030.22867"
Content-Transfer-Encoding: 7bit


--15613701639.Ba3b030.22867
Date: Mon, 24 Jun 2019 09:56:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #79 from Daniel Drake <dan@reactivated.net> ---
Thanks, you're right, the value changes based on HDMI connector status.

So for this platform, \_SB.PCI0.PEG0 has a PG00 PowerResource that will set=
 the
magic bit in _ON, and likewise \_SB.PCI0.PEG0.PEGP has a _PS0 that will set=
 the
bit too.

This all sounds like it should set the appropriate state at boot time, but I
wouldn't expect these methods to be called when the HDMI connector is
hotplugged. And I can't see any linkage to anything more dynamic like _DSM.

Indeed booting Linux with HDMI already connected, the HDMI audio PCI device
appears. Same on Windows, testing without the nvidia driver installed.

I used the Clover UEFI bootloader to boot windows with a custom DSDT, modif=
ied
the GGIV() function to always return zero (disconnected) for this GPIO. Then
booting Windows with HDMI connected, the PCI device no longer appears.

Then I installed the Nvidia windows driver. Connecting HDMI either at boot =
or
later, the HDMI audio device appears on the PCI bus.

Conclusion: The nvidia windows driver directly controls the magic bit here,
triggering a PCI bus rescan too, without relying on ACPI.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15613701639.Ba3b030.22867
Date: Mon, 24 Jun 2019 09:56:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c79">Commen=
t # 79</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Thanks, you're right, the value changes based on HDMI connecto=
r status.

So for this platform, \_SB.PCI0.PEG0 has a PG00 PowerResource that will set=
 the
magic bit in _ON, and likewise \_SB.PCI0.PEG0.PEGP has a _PS0 that will set=
 the
bit too.

This all sounds like it should set the appropriate state at boot time, but I
wouldn't expect these methods to be called when the HDMI connector is
hotplugged. And I can't see any linkage to anything more dynamic like _DSM.

Indeed booting Linux with HDMI already connected, the HDMI audio PCI device
appears. Same on Windows, testing without the nvidia driver installed.

I used the Clover UEFI bootloader to boot windows with a custom DSDT, modif=
ied
the GGIV() function to always return zero (disconnected) for this GPIO. Then
booting Windows with HDMI connected, the PCI device no longer appears.

Then I installed the Nvidia windows driver. Connecting HDMI either at boot =
or
later, the HDMI audio device appears on the PCI bus.

Conclusion: The nvidia windows driver directly controls the magic bit here,
triggering a PCI bus rescan too, without relying on ACPI.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15613701639.Ba3b030.22867--

--===============0968679350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0968679350==--
