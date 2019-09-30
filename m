Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B503DC1C60
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2019 09:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB066E3D0;
	Mon, 30 Sep 2019 07:54:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F1AB6E3D0
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 07:54:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0CDA072162; Mon, 30 Sep 2019 07:54:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 30 Sep 2019 07:54:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mrmazda@earthlink.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111853-8800-EIcep54GGV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111853-8800@http.bugs.freedesktop.org/>
References: <bug-111853-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
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
Content-Type: multipart/mixed; boundary="===============1380174935=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1380174935==
Content-Type: multipart/alternative; boundary="15698300681.Ab50.31687"
Content-Transfer-Encoding: 7bit


--15698300681.Ab50.31687
Date: Mon, 30 Sep 2019 07:54:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

--- Comment #6 from Felix Miata <mrmazda@earthlink.net> ---
(In reply to Ilia Mirkin from comment #5)
> The only thing I can think of is the vesafb usage. However I thought there
> was a mechanism for us to kick out such a driver. But perhaps not, and
> perhaps it broke somehow. Can you try not booting with video=3D?=20
That results in use of 80x25 text mode that is corrupted, random letters get
shifted by one character from what they should have been, e.g. "t" drawn wh=
ere
"s" should be, or "d" drawn where "c" should be, and many clearly wrong
characters, such as 15-30% of a screen full of "!!". The BIOS logo also has
vertical lines through the SONY image, and the !! pairs appear on the other=
wise
black screen between BIOS splash and GFX Grub menu, and plain text mode Gru=
b.

> Also, perhaps something's VERY wrong with the device, s.t. something fails
> very early in nouveau's attempts -- try loading nouveau with

> debug=3Dtrace (or, if putting into the kernel cmdline, nouveau.debug=3Dtr=
ace)

> which should spam the kernel log pretty hard.
It didn't, 331 bytes less than that of comment 4, only two lines containing
"veau", both included on Kernel command line.

This laptop isn't mine. It belongs to my church. It came to me to repair
because of video corruption in Windows 7 that appeared only after warmup. I
took out its HD and put in my SSD to facilitate troubleshooting after having
the same trouble with Knoppix as is happening in openSUSE, and taking a long
time to boot each time from Knoppix DVD.

I quickly decided the Windows video corruption seemed to be nothing but
overheating, so I've been running it most of the time with a 4" fan blowing=
 on
its bottom after having blown through its airways with compressed air when I
first got it. Without the 4" fan, I can't tell if the heat coming from the =
vent
is simply radiation, or from its fan.

In 1024x768 VESA mode (with vga=3D) the video output doesn't get corrupted =
either
on vttys or in Xorg. When I plug in a display to its HDMI port, the external
display wakes up only to report "no HDMI signal", which it repeats going in=
to
or out of Xorg.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698300681.Ab50.31687
Date: Mon, 30 Sep 2019 07:54:28 +0000
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
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853">bug 11185=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrmazda&#64;earthlink.net" title=3D"Felix Miata &lt;mrmazda&#64;earthlink.n=
et&gt;"> <span class=3D"fn">Felix Miata</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
853#c5">comment #5</a>)
<span class=3D"quote">&gt; The only thing I can think of is the vesafb usag=
e. However I thought there
&gt; was a mechanism for us to kick out such a driver. But perhaps not, and
&gt; perhaps it broke somehow. Can you try not booting with video=3D? </spa=
n >
That results in use of 80x25 text mode that is corrupted, random letters get
shifted by one character from what they should have been, e.g. &quot;t&quot=
; drawn where
&quot;s&quot; should be, or &quot;d&quot; drawn where &quot;c&quot; should =
be, and many clearly wrong
characters, such as 15-30% of a screen full of &quot;!!&quot;. The BIOS log=
o also has
vertical lines through the SONY image, and the !! pairs appear on the other=
wise
black screen between BIOS splash and GFX Grub menu, and plain text mode Gru=
b.

<span class=3D"quote">&gt; Also, perhaps something's VERY wrong with the de=
vice, s.t. something fails
&gt; very early in nouveau's attempts -- try loading nouveau with</span >

<span class=3D"quote">&gt; debug=3Dtrace (or, if putting into the kernel cm=
dline, nouveau.debug=3Dtrace)</span >

<span class=3D"quote">&gt; which should spam the kernel log pretty hard.</s=
pan >
It didn't, 331 bytes less than that of <a href=3D"show_bug.cgi?id=3D111853#=
c4">comment 4</a>, only two lines containing
&quot;veau&quot;, both included on Kernel command line.

This laptop isn't mine. It belongs to my church. It came to me to repair
because of video corruption in Windows 7 that appeared only after warmup. I
took out its HD and put in my SSD to facilitate troubleshooting after having
the same trouble with Knoppix as is happening in openSUSE, and taking a long
time to boot each time from Knoppix DVD.

I quickly decided the Windows video corruption seemed to be nothing but
overheating, so I've been running it most of the time with a 4&quot; fan bl=
owing on
its bottom after having blown through its airways with compressed air when I
first got it. Without the 4&quot; fan, I can't tell if the heat coming from=
 the vent
is simply radiation, or from its fan.

In 1024x768 VESA mode (with vga=3D) the video output doesn't get corrupted =
either
on vttys or in Xorg. When I plug in a display to its HDMI port, the external
display wakes up only to report &quot;no HDMI signal&quot;, which it repeat=
s going into
or out of Xorg.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698300681.Ab50.31687--

--===============1380174935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1380174935==--
