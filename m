Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 742574C934
	for <lists+nouveau@lfdr.de>; Thu, 20 Jun 2019 10:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFAC6E560;
	Thu, 20 Jun 2019 08:16:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A85606E55A
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jun 2019 08:16:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A54D072167; Thu, 20 Jun 2019 08:16:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 20 Jun 2019 08:16:41 +0000
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
Message-ID: <bug-75985-8800-Ga3e5NYPYw@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1480666761=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1480666761==
Content-Type: multipart/alternative; boundary="15610186015.c7D5e3.25955"
Content-Transfer-Encoding: 7bit


--15610186015.c7D5e3.25955
Date: Thu, 20 Jun 2019 08:16:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #78 from Lukas Wunner <lukas@wunner.de> ---
(In reply to Daniel Drake from comment #77)
> MLTF presumably means multifunction and it's exactly the bit we've been
> working with. But I haven't yet managed to get _PS0 to run this code. I g=
et
> to the GGIV(0x01080001) call, but it returns 0, so the bit doesn't get se=
t.
>=20
> I tried understanding what GGIV() does but nothing is clear there. It ends
> up reading bit 1 from physical memory address 0xfdac0408 which is under:
> pci_bus 0000:00: resource 21 [mem 0xfd000000-0xfe7fffff window]
> and I can't immediately spot any ACPI code that writes to that address.

GGIV is a method name used by many vendors to read a GPIO pin. "Get GPIO In=
put
Value" or something like that.

Quite likely the GPIO pin in question is attached to HPD of an HDMI or DP p=
ort.
So if an external display is attached, GGIV(0x01080001) should return 1 and=
 the
HDA is exposed, else it's hidden.

If the GPIO pin in question is on the PCH then you can download the spec for
the PCH from Intel's website to verify that the MMIO space at 0x01080001 is=
 a
GPIO block. The GPIO pin could also be on the Nvidia card itself, in that c=
ase
physical address 0x01080001 would belong to a resource of the GPU's PCI dev=
ice.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15610186015.c7D5e3.25955
Date: Thu, 20 Jun 2019 08:16:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c78">Commen=
t # 78</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D75=
985#c77">comment #77</a>)
<span class=3D"quote">&gt; MLTF presumably means multifunction and it's exa=
ctly the bit we've been
&gt; working with. But I haven't yet managed to get _PS0 to run this code. =
I get
&gt; to the GGIV(0x01080001) call, but it returns 0, so the bit doesn't get=
 set.
&gt;=20
&gt; I tried understanding what GGIV() does but nothing is clear there. It =
ends
&gt; up reading bit 1 from physical memory address 0xfdac0408 which is unde=
r:
&gt; pci_bus 0000:00: resource 21 [mem 0xfd000000-0xfe7fffff window]
&gt; and I can't immediately spot any ACPI code that writes to that address=
.</span >

GGIV is a method name used by many vendors to read a GPIO pin. &quot;Get GP=
IO Input
Value&quot; or something like that.

Quite likely the GPIO pin in question is attached to HPD of an HDMI or DP p=
ort.
So if an external display is attached, GGIV(0x01080001) should return 1 and=
 the
HDA is exposed, else it's hidden.

If the GPIO pin in question is on the PCH then you can download the spec for
the PCH from Intel's website to verify that the MMIO space at 0x01080001 is=
 a
GPIO block. The GPIO pin could also be on the Nvidia card itself, in that c=
ase
physical address 0x01080001 would belong to a resource of the GPU's PCI dev=
ice.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15610186015.c7D5e3.25955--

--===============1480666761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1480666761==--
