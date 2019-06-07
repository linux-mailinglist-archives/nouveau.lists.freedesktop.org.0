Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFE38776
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2019 11:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B08289CF2;
	Fri,  7 Jun 2019 09:58:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 263EF89C55
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2019 09:58:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1C43872167; Fri,  7 Jun 2019 09:58:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 07 Jun 2019 09:58:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mszpak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110830-8800-im8sZFXxsh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110830-8800@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
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
Content-Type: multipart/mixed; boundary="===============0288449433=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0288449433==
Content-Type: multipart/alternative; boundary="15599015140.D794F49.10433"
Content-Transfer-Encoding: 7bit


--15599015140.D794F49.10433
Date: Fri, 7 Jun 2019 09:58:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #3 from Marcin Zajaczkowski <mszpak@wp.pl> ---
I managed to build 5.2.0-0.rc3.git2.1.fc30.x86_64 on Fedora 30 and boot with
overridden NvChipset (0x167). The nouveau module is loaded, the card is vis=
ible
by vgaswitcheroo, but I cannot switch to it (nor force to turn it on).

> # lsmod | grep nouveau
> nouveau              2293760  1
> ttm                   122880  1 nouveau
> i2c_algo_bit           16384  2 i915,nouveau
> drm_kms_helper        225280  2 i915,nouveau
> mxm_wmi                16384  1 nouveau
> drm                   577536  15 drm_kms_helper,i915,ttm,nouveau
> video                  53248  2 i915,nouveau
> wmi                    36864  4 intel_wmi_thunderbolt,wmi_bmof,mxm_wmi,no=
uveau

> # cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:IGD:+:Pwr:0000:00:02.0
> 1:DIS: :DynPwr:0000:01:00.0
> 2:DIS-Audio: :DynOff:0000:01:00.1

On:
> echo ON > /sys/kernel/debug/vgaswitcheroo/switch

there is no effect. On:

> echo DIS > /sys/kernel/debug/vgaswitcheroo/switch

I see an error in the system logs:
> kernel: vga_switcheroo: client 0 refused switch

The initialization logs on boot:
> kernel: MXM: GUID detected in BIOS
> kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch - Fo=
und [Buffer], ACPI requires [Package] (20190509/nsargume>
> kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch=
 - Found [Buffer], ACPI requires [Package] (20190509/nsa>
> kernel: pci 0000:01:00.0: optimus capabilities: enabled, status dynamic p=
ower, hda bios codec supported
> kernel: VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP =
handle
> kernel: nouveau: detected PR support, will not use DSM
> kernel: nouveau 0000:01:00.0: enabling device (0106 -> 0107)
> kernel: checking generic (90000000 7e9000) vs hw (a0000000 10000000)
> kernel: checking generic (90000000 7e9000) vs hw (b0000000 2000000)
> kernel: nouveau 0000:01:00.0: CHIPSET OVERRIDE: 168000a1 -> 167000a1
> kernel: nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
> kernel: nvme nvme0: missing or invalid SUBNQN field.
> kernel: nvme nvme0: Shutdown timeout set to 8 seconds
> kernel: nvme nvme0: 12/0/0 default/read/poll queues
> kernel: checking generic (90000000 7e9000) vs hw (90000000 10000000)
> kernel: fb0: switching to inteldrmfb from EFI VGA
> kernel: Console: switching to colour dummy device 80x25
> kernel: i915 0000:00:02.0: vgaarb: deactivate vga console
> kernel: nouveau 0000:01:00.0: bios: version 90.16.26.00.11
> kernel: nouveau 0000:01:00.0: fb: 6144 MiB GDDR6
> kernel:  nvme0n1: p1 p2 p3
> kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> kernel: [drm] Driver supports precise vblank timestamp query.
> kernel: i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+m=
em,decodes=3Dnone:owns=3Dio+mem
> kernel: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.=
4)
> systemd-udevd[578]: Using default interface naming scheme 'v240'.
> kernel: vga_switcheroo: enabled
> kernel: [TTM] Zone  kernel: Available graphics memory: 8042942 KiB
> kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
> kernel: [TTM] Initializing pool allocator
> kernel: [TTM] Initializing DMA pool allocator
> kernel: nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
> kernel: nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> kernel: nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> kernel: nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> kernel: nouveau 0000:01:00.0: DRM: DCB version 4.1
> kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 02002f52 00020010
> kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 04814f76 04600010
> kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 04814f72 00020010
> kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
> kernel: nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
> kernel: nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
> kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> kernel: [drm] Driver supports precise vblank timestamp query.
> kernel: [drm] Initialized i915 1.6.0 20190417 for 0000:00:02.0 on minor 0
> kernel: [drm] Cannot find any crtc or sizes
> kernel: ACPI: Video Device [PEGP] (multi-head: no  rom: yes  post: no)
> kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/d=
evice:00/LNXVIDEO:00/input/input12
> kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on mino=
r 1
> kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
> kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/L=
NXVIDEO:01/input/input13
> kernel: fbcon: i915drmfb (fb0) is primary device
> kernel: Console: switching to colour frame buffer device 240x67
> kernel: [drm] Cannot find any crtc or sizes
> kernel: i915 0000:00:02.0: fb0: i915drmfb frame buffer device
> kernel: psmouse serio2: synaptics: queried max coordinates: x [..5658], y=
 [..4722]
> kernel: [drm] Cannot find any crtc or sizes

There are also no reported providers in xrandr:
> $ xrandr --listproviders
> Providers: number: 0

I don't know if it is related to the chipset itself or to my laptop
configuration. The same situation is with with 0x167 and 0x162.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599015140.D794F49.10433
Date: Fri, 7 Jun 2019 09:58:34 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>I managed to build 5.2.0-0.rc3.git2.1.fc30.x86_64 on Fedora 30=
 and boot with
overridden NvChipset (0x167). The nouveau module is loaded, the card is vis=
ible
by vgaswitcheroo, but I cannot switch to it (nor force to turn it on).

<span class=3D"quote">&gt; # lsmod | grep nouveau
&gt; nouveau              2293760  1
&gt; ttm                   122880  1 nouveau
&gt; i2c_algo_bit           16384  2 i915,nouveau
&gt; drm_kms_helper        225280  2 i915,nouveau
&gt; mxm_wmi                16384  1 nouveau
&gt; drm                   577536  15 drm_kms_helper,i915,ttm,nouveau
&gt; video                  53248  2 i915,nouveau
&gt; wmi                    36864  4 intel_wmi_thunderbolt,wmi_bmof,mxm_wmi=
,nouveau</span >

<span class=3D"quote">&gt; # cat /sys/kernel/debug/vgaswitcheroo/switch
&gt; 0:IGD:+:Pwr:0000:00:02.0
&gt; 1:DIS: :DynPwr:0000:01:00.0
&gt; 2:DIS-Audio: :DynOff:0000:01:00.1</span >

On:
<span class=3D"quote">&gt; echo ON &gt; /sys/kernel/debug/vgaswitcheroo/swi=
tch</span >

there is no effect. On:

<span class=3D"quote">&gt; echo DIS &gt; /sys/kernel/debug/vgaswitcheroo/sw=
itch</span >

I see an error in the system logs:
<span class=3D"quote">&gt; kernel: vga_switcheroo: client 0 refused switch<=
/span >

The initialization logs on boot:
<span class=3D"quote">&gt; kernel: MXM: GUID detected in BIOS
&gt; kernel: ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -=
 Found [Buffer], ACPI requires [Package] (20190509/nsargume&gt;
&gt; kernel: ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type misma=
tch - Found [Buffer], ACPI requires [Package] (20190509/nsa&gt;
&gt; kernel: pci 0000:01:00.0: optimus capabilities: enabled, status dynami=
c power, hda bios codec supported
&gt; kernel: VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PE=
GP handle
&gt; kernel: nouveau: detected PR support, will not use DSM
&gt; kernel: nouveau 0000:01:00.0: enabling device (0106 -&gt; 0107)
&gt; kernel: checking generic (90000000 7e9000) vs hw (a0000000 10000000)
&gt; kernel: checking generic (90000000 7e9000) vs hw (b0000000 2000000)
&gt; kernel: nouveau 0000:01:00.0: CHIPSET OVERRIDE: 168000a1 -&gt; 167000a1
&gt; kernel: nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
&gt; kernel: nvme nvme0: missing or invalid SUBNQN field.
&gt; kernel: nvme nvme0: Shutdown timeout set to 8 seconds
&gt; kernel: nvme nvme0: 12/0/0 default/read/poll queues
&gt; kernel: checking generic (90000000 7e9000) vs hw (90000000 10000000)
&gt; kernel: fb0: switching to inteldrmfb from EFI VGA
&gt; kernel: Console: switching to colour dummy device 80x25
&gt; kernel: i915 0000:00:02.0: vgaarb: deactivate vga console
&gt; kernel: nouveau 0000:01:00.0: bios: version 90.16.26.00.11
&gt; kernel: nouveau 0000:01:00.0: fb: 6144 MiB GDDR6
&gt; kernel:  nvme0n1: p1 p2 p3
&gt; kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
&gt; kernel: [drm] Driver supports precise vblank timestamp query.
&gt; kernel: i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Di=
o+mem,decodes=3Dnone:owns=3Dio+mem
&gt; kernel: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (=
v1.4)
&gt; systemd-udevd[578]: Using default interface naming scheme 'v240'.
&gt; kernel: vga_switcheroo: enabled
&gt; kernel: [TTM] Zone  kernel: Available graphics memory: 8042942 KiB
&gt; kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
&gt; kernel: [TTM] Initializing pool allocator
&gt; kernel: [TTM] Initializing DMA pool allocator
&gt; kernel: nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
&gt; kernel: nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
&gt; kernel: nouveau 0000:01:00.0: DRM: BIT table 'A' not found
&gt; kernel: nouveau 0000:01:00.0: DRM: BIT table 'L' not found
&gt; kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB version 4.1
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 02002f52 00020010
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 04814f76 04600010
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 04814f72 00020010
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
&gt; kernel: nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
&gt; kernel: nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
&gt; kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
&gt; kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
&gt; kernel: [drm] Driver supports precise vblank timestamp query.
&gt; kernel: [drm] Initialized i915 1.6.0 20190417 for 0000:00:02.0 on mino=
r 0
&gt; kernel: [drm] Cannot find any crtc or sizes
&gt; kernel: ACPI: Video Device [PEGP] (multi-head: no  rom: yes  post: no)
&gt; kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:0=
0/device:00/LNXVIDEO:00/input/input12
&gt; kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on m=
inor 1
&gt; kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
&gt; kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:0=
0/LNXVIDEO:01/input/input13
&gt; kernel: fbcon: i915drmfb (fb0) is primary device
&gt; kernel: Console: switching to colour frame buffer device 240x67
&gt; kernel: [drm] Cannot find any crtc or sizes
&gt; kernel: i915 0000:00:02.0: fb0: i915drmfb frame buffer device
&gt; kernel: psmouse serio2: synaptics: queried max coordinates: x [..5658]=
, y [..4722]
&gt; kernel: [drm] Cannot find any crtc or sizes</span >

There are also no reported providers in xrandr:
<span class=3D"quote">&gt; $ xrandr --listproviders
&gt; Providers: number: 0</span >

I don't know if it is related to the chipset itself or to my laptop
configuration. The same situation is with with 0x167 and 0x162.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599015140.D794F49.10433--

--===============0288449433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0288449433==--
