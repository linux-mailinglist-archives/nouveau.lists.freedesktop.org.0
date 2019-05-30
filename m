Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711330173
	for <lists+nouveau@lfdr.de>; Thu, 30 May 2019 20:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A506E3DA;
	Thu, 30 May 2019 18:04:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6281C6E3D3
 for <nouveau@lists.freedesktop.org>; Thu, 30 May 2019 18:04:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5EBFA72167; Thu, 30 May 2019 18:04:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 30 May 2019 18:04:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110797-8800-Y0BcyaF8WT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110797-8800@http.bugs.freedesktop.org/>
References: <bug-110797-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110797] No video if nomodeset is not set with GTX 460
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
Content-Type: multipart/mixed; boundary="===============0901633250=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0901633250==
Content-Type: multipart/alternative; boundary="15592394961.21fdd.11530"
Content-Transfer-Encoding: 7bit


--15592394961.21fdd.11530
Date: Thu, 30 May 2019 18:04:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110797

--- Comment #12 from Ilia Mirkin <imirkin@alum.mit.edu> ---
So... a pretty orderly init...

[    3.909830] nouveau 0000:01:00.0: NVIDIA GF104 (0c4200a1)
[    4.070350] nouveau 0000:01:00.0: bios: version 70.04.11.00.01
[    6.154050] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
[    6.229767] [TTM] Zone  kernel: Available graphics memory: 4059620 kiB
[    6.229770] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    6.229772] [TTM] Initializing pool allocator
[    6.229781] [TTM] Initializing DMA pool allocator
[    6.229806] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    6.229808] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.229814] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.229817] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.229821] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000000
[    6.229826] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00020030
[    6.229827] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011380 00000000
[    6.229829] nouveau 0000:01:00.0: DRM: DCB outp 03: 08011382 00020030
[    6.229830] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022362 00020010
[    6.229831] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    6.229832] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010130
[    6.229833] nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261

... and then ... BAM

[    6.230590] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
13b154 [ IBUS ]
[    6.230765] WARNING: CPU: 2 PID: 482 at
drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c:191 nvkm_outp_init+0x181/0x=
220
[nouveau]
[    6.230765] Modules linked in: nouveau(+) raid0 hid_logitech_hidpp(+) vi=
deo
mxm_wmi wmi i2c_algo_bit drm_kms_helper ttm drm crc32c_intel broadcom
bcm_phy_lib serio_raw tg3 firewire_ohci uas usb_storage firewire_core
hid_logitech_dj crc_itu_t
[    6.230774] CPU: 2 PID: 482 Comm: systemd-udevd Not tainted
5.0.17-300.fc30.x86_64 #1
[    6.230775] Hardware name: Dell Inc. Studio XPS 8100/0G3HR7, BIOS A05
07/08/2010
[    6.230822] RIP: 0010:nvkm_outp_init+0x181/0x220 [nouveau]
[    6.230823] Code: e8 48 83 c4 18 e9 78 ff ff ff 0f b6 4d 25 ba ff ff ff =
ff
0f bc d1 31 c9 83 78 10 01 75 03 8b 4d 2c 89 4c 24 04 e9 fc fe ff ff <0f> 0=
b e9
51 ff ff ff 48 8b 45 08 83 78 48 03 0f 86 43 ff ff ff 8b
[    6.230824] RSP: 0018:ffffb854013ab7e0 EFLAGS: 00010246
[    6.230825] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
ffff8ee26b64b070
[    6.230825] RDX: 00000000ffffffff RSI: 0000000000000000 RDI:
ffff8ee26b64b070
[    6.230826] RBP: ffff8ee26f0d7480 R08: ffff8ee270354380 R09:
ffff8ee277003c80
[    6.230827] R10: 00000000d8000001 R11: 00000000d8000001 R12:
ffff8ee26b64b008
[    6.230827] R13: ffff8ee26f9d9800 R14: ffff8ee26b64b010 R15:
ffff8ee26ac21400
[    6.230828] FS:  00007fa18da06940(0000) GS:ffff8ee277680000(0000)
knlGS:0000000000000000
[    6.230829] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.230830] CR2: 00007fa18eacf020 CR3: 000000022fdac000 CR4:
00000000000006e0
[    6.230831] Call Trace:
[    6.230880]  nvkm_disp_init+0x54/0xd0 [nouveau]
[    6.230917]  nvkm_engine_init+0xaa/0x1e0 [nouveau]
[    6.230955]  nvkm_subdev_init+0xb5/0x200 [nouveau]
[    6.230993]  nvkm_engine_ref.part.0+0x3f/0x60 [nouveau]
[    6.231030]  nvkm_ioctl_new+0x121/0x200 [nouveau]
[    6.231077]  ? nvkm_udevice_map+0x50/0x50 [nouveau]
[    6.231114]  nvkm_ioctl+0xde/0x180 [nouveau]
[    6.231150]  nvif_object_init+0xdb/0x140 [nouveau]
[    6.231186]  nvif_disp_ctor+0x69/0x150 [nouveau]
[    6.231234]  nouveau_display_create+0x2d8/0x620 [nouveau]
[    6.231282]  nouveau_drm_device_init+0x15f/0x810 [nouveau]
[    6.231286]  ? pci_bus_read_config_word+0x49/0x70
[    6.231333]  nouveau_drm_probe+0x1f2/0x2e0 [nouveau]
[    6.231336]  local_pci_probe+0x43/0x90

I don't think I've seen anything of the sort. Something in the display
initialization logic gets immensely upset after getting a MMIO write fault.

Is there anything esp awkward about this GPU that would differentiate it fr=
om a
run-of-the-mill desktop GPU that a random person might have?

The PCI ID is just "GF104 [GeForce GTX 460 OEM]" which doesn't seem too cra=
zy.
And I don't see any PCI-ish errors about 01:00.0 (like unassigned resources=
 or
whatnot).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592394961.21fdd.11530
Date: Thu, 30 May 2019 18:04:56 +0000
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
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - No video if nomodeset is not set with GTX 460"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110797">bug 11079=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>So... a pretty orderly init...

[    3.909830] nouveau 0000:01:00.0: NVIDIA GF104 (0c4200a1)
[    4.070350] nouveau 0000:01:00.0: bios: version 70.04.11.00.01
[    6.154050] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
[    6.229767] [TTM] Zone  kernel: Available graphics memory: 4059620 kiB
[    6.229770] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    6.229772] [TTM] Initializing pool allocator
[    6.229781] [TTM] Initializing DMA pool allocator
[    6.229806] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    6.229808] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.229814] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.229817] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.229821] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000000
[    6.229826] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00020030
[    6.229827] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011380 00000000
[    6.229829] nouveau 0000:01:00.0: DRM: DCB outp 03: 08011382 00020030
[    6.229830] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022362 00020010
[    6.229831] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    6.229832] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010130
[    6.229833] nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261

... and then ... BAM

[    6.230590] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
13b154 [ IBUS ]
[    6.230765] WARNING: CPU: 2 PID: 482 at
drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c:191 nvkm_outp_init+0x181/0x=
220
[nouveau]
[    6.230765] Modules linked in: nouveau(+) raid0 hid_logitech_hidpp(+) vi=
deo
mxm_wmi wmi i2c_algo_bit drm_kms_helper ttm drm crc32c_intel broadcom
bcm_phy_lib serio_raw tg3 firewire_ohci uas usb_storage firewire_core
hid_logitech_dj crc_itu_t
[    6.230774] CPU: 2 PID: 482 Comm: systemd-udevd Not tainted
5.0.17-300.fc30.x86_64 #1
[    6.230775] Hardware name: Dell Inc. Studio XPS 8100/0G3HR7, BIOS A05
07/08/2010
[    6.230822] RIP: 0010:nvkm_outp_init+0x181/0x220 [nouveau]
[    6.230823] Code: e8 48 83 c4 18 e9 78 ff ff ff 0f b6 4d 25 ba ff ff ff =
ff
0f bc d1 31 c9 83 78 10 01 75 03 8b 4d 2c 89 4c 24 04 e9 fc fe ff ff &lt;0f=
&gt; 0b e9
51 ff ff ff 48 8b 45 08 83 78 48 03 0f 86 43 ff ff ff 8b
[    6.230824] RSP: 0018:ffffb854013ab7e0 EFLAGS: 00010246
[    6.230825] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
ffff8ee26b64b070
[    6.230825] RDX: 00000000ffffffff RSI: 0000000000000000 RDI:
ffff8ee26b64b070
[    6.230826] RBP: ffff8ee26f0d7480 R08: ffff8ee270354380 R09:
ffff8ee277003c80
[    6.230827] R10: 00000000d8000001 R11: 00000000d8000001 R12:
ffff8ee26b64b008
[    6.230827] R13: ffff8ee26f9d9800 R14: ffff8ee26b64b010 R15:
ffff8ee26ac21400
[    6.230828] FS:  00007fa18da06940(0000) GS:ffff8ee277680000(0000)
knlGS:0000000000000000
[    6.230829] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.230830] CR2: 00007fa18eacf020 CR3: 000000022fdac000 CR4:
00000000000006e0
[    6.230831] Call Trace:
[    6.230880]  nvkm_disp_init+0x54/0xd0 [nouveau]
[    6.230917]  nvkm_engine_init+0xaa/0x1e0 [nouveau]
[    6.230955]  nvkm_subdev_init+0xb5/0x200 [nouveau]
[    6.230993]  nvkm_engine_ref.part.0+0x3f/0x60 [nouveau]
[    6.231030]  nvkm_ioctl_new+0x121/0x200 [nouveau]
[    6.231077]  ? nvkm_udevice_map+0x50/0x50 [nouveau]
[    6.231114]  nvkm_ioctl+0xde/0x180 [nouveau]
[    6.231150]  nvif_object_init+0xdb/0x140 [nouveau]
[    6.231186]  nvif_disp_ctor+0x69/0x150 [nouveau]
[    6.231234]  nouveau_display_create+0x2d8/0x620 [nouveau]
[    6.231282]  nouveau_drm_device_init+0x15f/0x810 [nouveau]
[    6.231286]  ? pci_bus_read_config_word+0x49/0x70
[    6.231333]  nouveau_drm_probe+0x1f2/0x2e0 [nouveau]
[    6.231336]  local_pci_probe+0x43/0x90

I don't think I've seen anything of the sort. Something in the display
initialization logic gets immensely upset after getting a MMIO write fault.

Is there anything esp awkward about this GPU that would differentiate it fr=
om a
run-of-the-mill desktop GPU that a random person might have?

The PCI ID is just &quot;GF104 [GeForce GTX 460 OEM]&quot; which doesn't se=
em too crazy.
And I don't see any PCI-ish errors about 01:00.0 (like unassigned resources=
 or
whatnot).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592394961.21fdd.11530--

--===============0901633250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0901633250==--
