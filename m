Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DC8A6A3
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2019 20:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88EE6E5C4;
	Mon, 12 Aug 2019 18:52:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF9816E5CB
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2019 18:52:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DB97172167; Mon, 12 Aug 2019 18:52:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 12 Aug 2019 18:52:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dirbaio@dirbaio.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100228-8800-EufYNOkfqc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100228-8800@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
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
Content-Type: multipart/mixed; boundary="===============1742347518=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1742347518==
Content-Type: multipart/alternative; boundary="156563597510.f663cFc10.9676"
Content-Transfer-Encoding: 7bit


--156563597510.f663cFc10.9676
Date: Mon, 12 Aug 2019 18:52:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #43 from Dario Nieuwenhuis <dirbaio@dirbaio.net> ---
Hello,

I'm also affected by this bug.

Hardware:
- Lenovo ThinkPad x1 Extreme i7-8850H, 32gb, 4k screen
- It has hybrid graphics (nvidia optimus) with:
    - Integrated graphics: Intel UHD 630
    - Discrete graphics: NVIDIA Corporation GP107M [GeForce GTX 1050 Ti Mob=
ile]
(rev a1)
- DMI: LENOVO 20MFCTO1WW/20MFCTO1WW, BIOS N2EET41W (1.23 ) 07/03/2019
- UEFI firmware is up to date.

Software:
- Arch Linux
- Both Linux 5.2.8.arch1-1 and self-built 4d352dbd (latest on branch linux-=
5.3
on https://github.com/skeggsb/linux/ at the time of writing)
- mesa 19.1.4-1
- linux-firmware 20190717.bf13a71-1
- I'm trying to use wayland, not xorg (to get support for different DPI on
different monitors). (xorg doesn't work either anyway)

Now, here is the interesting thing: in the BIOS you can select between hybr=
id
and integrated graphics:

Integrated graphics:
- Both the intel and the nvidia are enabled (both show up in lspci)
- Laptop screen is wired to the intel
- HDMI, USB C is wired to the nvidia
- The laptop screen is usable with the intel driver.
- nouveau doesn't work due to this bug -> there's no way to get the hdmi/us=
bc
working :(
- Great battery life when shutting down the nvidia with bbswitch.

BUT, with discrete graphics:
- Only nvidia is enabled (intel doesn't even show up in lspci)
- Laptop screen is wired to the nvidia
- HDMI, USB C is wired to the nvidia
- Nouveau works perfectly!! Both laptop screen and externals.
- BUT battery life is terrible (because you can't turn off the nvidia on the
go)

Conclusion: this bug is somehow related to nvidia optimus. It ONLY occurs in
hybrid graphics mode.

Sad thing is I'm forced to choose between bad battery life, or inability to=
 use
external monitors, which makes this laptop very unusable :(

I've attached logs for both the discrete graphics mode (everything works) a=
nd
hybrid graphics mode (nouveau crashes with this bug).

What can I test next that would help fix this? I'd REALLY love to help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--156563597510.f663cFc10.9676
Date: Mon, 12 Aug 2019 18:52:55 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c43">Comme=
nt # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dirbaio&#64;dirbaio.net" title=3D"Dario Nieuwenhuis &lt;dirbaio&#64;dirbaio=
.net&gt;"> <span class=3D"fn">Dario Nieuwenhuis</span></a>
</span></b>
        <pre>Hello,

I'm also affected by this bug.

Hardware:
- Lenovo ThinkPad x1 Extreme i7-8850H, 32gb, 4k screen
- It has hybrid graphics (nvidia optimus) with:
    - Integrated graphics: Intel UHD 630
    - Discrete graphics: NVIDIA Corporation GP107M [GeForce GTX 1050 Ti Mob=
ile]
(rev a1)
- DMI: LENOVO 20MFCTO1WW/20MFCTO1WW, BIOS N2EET41W (1.23 ) 07/03/2019
- UEFI firmware is up to date.

Software:
- Arch Linux
- Both Linux 5.2.8.arch1-1 and self-built 4d352dbd (latest on branch linux-=
5.3
on <a href=3D"https://github.com/skeggsb/linux/">https://github.com/skeggsb=
/linux/</a> at the time of writing)
- mesa 19.1.4-1
- linux-firmware 20190717.bf13a71-1
- I'm trying to use wayland, not xorg (to get support for different DPI on
different monitors). (xorg doesn't work either anyway)

Now, here is the interesting thing: in the BIOS you can select between hybr=
id
and integrated graphics:

Integrated graphics:
- Both the intel and the nvidia are enabled (both show up in lspci)
- Laptop screen is wired to the intel
- HDMI, USB C is wired to the nvidia
- The laptop screen is usable with the intel driver.
- nouveau doesn't work due to this bug -&gt; there's no way to get the hdmi=
/usbc
working :(
- Great battery life when shutting down the nvidia with bbswitch.

BUT, with discrete graphics:
- Only nvidia is enabled (intel doesn't even show up in lspci)
- Laptop screen is wired to the nvidia
- HDMI, USB C is wired to the nvidia
- Nouveau works perfectly!! Both laptop screen and externals.
- BUT battery life is terrible (because you can't turn off the nvidia on the
go)

Conclusion: this bug is somehow related to nvidia optimus. It ONLY occurs in
hybrid graphics mode.

Sad thing is I'm forced to choose between bad battery life, or inability to=
 use
external monitors, which makes this laptop very unusable :(

I've attached logs for both the discrete graphics mode (everything works) a=
nd
hybrid graphics mode (nouveau crashes with this bug).

What can I test next that would help fix this? I'd REALLY love to help.</pr=
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

--156563597510.f663cFc10.9676--

--===============1742347518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1742347518==--
