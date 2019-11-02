Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4FECF85
	for <lists+nouveau@lfdr.de>; Sat,  2 Nov 2019 16:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E396E6E4AF;
	Sat,  2 Nov 2019 15:40:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E6516E4CD
 for <nouveau@lists.freedesktop.org>; Sat,  2 Nov 2019 15:40:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B35A720E2; Sat,  2 Nov 2019 15:40:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 02 Nov 2019 15:40:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrey+freedesktop@psyduck.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100228-8800-oESJu8Qhrx@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1522317133=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1522317133==
Content-Type: multipart/alternative; boundary="15727092060.bbE4f9.9242"
Content-Transfer-Encoding: 7bit


--15727092060.bbE4f9.9242
Date: Sat, 2 Nov 2019 15:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #44 from Andrey Melentyev <andrey+freedesktop@psyduck.se> ---
Got some time to test runpm_fixes branch by Karol Herbst:
https://github.com/karolherbst/linux/commits/runpm_fixes

Applying the two latest commits bbb0b9a16c86fc54fe296df73000da3fba4e91b6 and
749a9c843f646ceac39e14601b64e5bbf202a47c from this branch to kernel version
5.3.8 allows me to use nouveau on Thinkpad X1 Extreme Gen 1 laptop with GP1=
07M
[GeForce GTX 1050 Ti Mobile] (rev a1)

What works

- Offloading with DRI_PRIME
- Reverse PRIME: HDMI port wired to the NVIDIA GPU works
- Power management (see note below)
- Suspend and resume

I was testing under X11 with modesetting DDX for both iGPU and dGPU. Haven't
tried Wayland or any sort of video decoding acceleration.

Power management

After loading nouveau module, idle dGPU doesn't power down, albeit power
control is set to "auto" for both the GPU and its audio device via sysfs. T=
his
can be worked around by setting the power to on and then back to auto:

echo -n "on" >/sys/bus/pci/devices/0000:01:00.1/power/control && echo -n "a=
uto"
>/sys/bus/pci/devices/0000:01:00.1/power/control

Once the idle audio device and GPU itself are powered down correctly, I get
power usage similar (same?) to when bbswitch is used.

Not sure if https://bugzilla.kernel.org/show_bug.cgi?id=3D156341 is relevant
here.

Thanks Karol and everyone involved, hope to see it mainlined eventually.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15727092060.bbE4f9.9242
Date: Sat, 2 Nov 2019 15:40:06 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c44">Comme=
nt # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey+freedesktop&#64;psyduck.se" title=3D"Andrey Melentyev &lt;andrey+fre=
edesktop&#64;psyduck.se&gt;"> <span class=3D"fn">Andrey Melentyev</span></a>
</span></b>
        <pre>Got some time to test runpm_fixes branch by Karol Herbst:
<a href=3D"https://github.com/karolherbst/linux/commits/runpm_fixes">https:=
//github.com/karolherbst/linux/commits/runpm_fixes</a>

Applying the two latest commits bbb0b9a16c86fc54fe296df73000da3fba4e91b6 and
749a9c843f646ceac39e14601b64e5bbf202a47c from this branch to kernel version
5.3.8 allows me to use nouveau on Thinkpad X1 Extreme Gen 1 laptop with GP1=
07M
[GeForce GTX 1050 Ti Mobile] (rev a1)

What works

- Offloading with DRI_PRIME
- Reverse PRIME: HDMI port wired to the NVIDIA GPU works
- Power management (see note below)
- Suspend and resume

I was testing under X11 with modesetting DDX for both iGPU and dGPU. Haven't
tried Wayland or any sort of video decoding acceleration.

Power management

After loading nouveau module, idle dGPU doesn't power down, albeit power
control is set to &quot;auto&quot; for both the GPU and its audio device vi=
a sysfs. This
can be worked around by setting the power to on and then back to auto:

echo -n &quot;on&quot; &gt;/sys/bus/pci/devices/0000:01:00.1/power/control =
&amp;&amp; echo -n &quot;auto&quot;
<span class=3D"quote">&gt;/sys/bus/pci/devices/0000:01:00.1/power/control</=
span >

Once the idle audio device and GPU itself are powered down correctly, I get
power usage similar (same?) to when bbswitch is used.

Not sure if <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D156341=
">https://bugzilla.kernel.org/show_bug.cgi?id=3D156341</a> is relevant
here.

Thanks Karol and everyone involved, hope to see it mainlined eventually.</p=
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

--15727092060.bbE4f9.9242--

--===============1522317133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1522317133==--
