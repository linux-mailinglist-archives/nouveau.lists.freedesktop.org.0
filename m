Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2DC15B7
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2019 16:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258D76E30F;
	Sun, 29 Sep 2019 14:14:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B7C96E301
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2019 14:14:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 07CCA72162; Sun, 29 Sep 2019 14:14:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 29 Sep 2019 14:14:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111853-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111853] New: nouveau kernel module won't load (not
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
Content-Type: multipart/mixed; boundary="===============0139479409=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0139479409==
Content-Type: multipart/alternative; boundary="15697664751.B5FF.792"
Content-Transfer-Encoding: 7bit


--15697664751.B5FF.792
Date: Sun, 29 Sep 2019 14:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

            Bug ID: 111853
           Summary: nouveau kernel module won't load (not available) on
                    Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID:
                    10de:0426
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: mrmazda@earthlink.net
        QA Contact: xorg-team@lists.x.org

Created attachment 145577
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145577&action=3Dedit
dmesg using vanilla 5.2.14 and acpi=3Doff on openSUSE Tumbleweed

Original summary:
nouveau won't load (not available) on Sony laptop with NVIDIA G86M [GeForce
8400M GT] ID: 10de:0426=20

This is mostly copied from https://bugzilla.kernel.org/show_bug.cgi?id=3D20=
4851

This errant behavior is similarly exhibited by openSUSE Tumbleweed, 15.0, 1=
3.1
and 12.2; Linuxmint 19.0 live installation media; Knoppix 8.2 and 8.6 live
media; antiX 17.4. Using vanilla kernel 5.2.14 on Tumbleweed doesn't help.

Actual behavior:
1-nouveau kernel module doesn't load
2-ttys limited to 1024x768 mode
3-X runs only with VESA or FBDEV drivers and limited to 1024x768 mode
4-/dev/dri/card0 is absent
5-hwinfo reports HDTV display supports maximum VESA 1024x768 mode
6-GeForce 8400M gfx reported by lspci is not found by Xorg
7-[drm] Failed to open DRM device for pci:0000:01:00.0: -19
8-hwinfo improperly detects display
9-laptop locks up (requires poweroff reset) unless cmdline includes acpi=3D=
off
10-/sys/kernel/debug/dri/ is empty

Expected behavior:
1-ttys use display's native 1920x1080 mode
2-X uses modesetting DDX or nouveau DDX and native 1920x1080 mode

# inxi -GxxSMaz
System:    Host: vaio Kernel: 5.2.11-1-default x86_64 bits: 64 compiler: gc=
c v:
9.2.1=20
           parameters: root=3D/dev/sda9 ipv6.disable=3D1 net.ifnames=3D0 no=
resume
mitigations=3Dauto consoleblank=3D0=20
           drm.debug=3D0x1e log_buf_len=3D1M acpi=3Doff vga=3D791 video=3D1=
280x720@60
video=3D1024x768@60 video=3D1440x900@60 3 acpi=3Doff=20
           Console: tty 3 dm: N/A Distro: openSUSE Tumbleweed 20190907=20
Machine:   Type: Laptop System: Sony product: VGN-AR730E v: C3LR1E11 serial:
<filter> Chassis: type: 10 serial: N/A=20
           Mobo: Sony model: VAIO serial: N/A BIOS: Phoenix v: R2090J8 date:
02/26/2008=20
Graphics:  Device-1: NVIDIA G86M [GeForce 8400M GT] vendor: Sony driver: N/A
bus ID: 01:00.0 chip ID: 10de:0426=20
           Display: server: X.org 1.20.5 driver: nouveau,vesa unloaded:
fbdev,modesetting alternate: nv,nvidia tty: 128x48=20
           Message: Advanced graphics data unavailable in console for root.=
=20
# lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1)
# lspci -vv -d 10de:0426
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Sony Corporation Device 9016
        Physical Slot: 1
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at ce000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at cc000000 (64-bit, non-prefetchable) [size=3D32M]
        Region 5: I/O ports at 2000 [size=3D128]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512=
ns,
L1 <4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled- CommCl=
k+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Kernel modules: nouveau
# dmesg | grep veau
# journalctl -b | grep veau
# lsmod | grep veau
# lsmod | grep video
uvcvideo              118784  0
videobuf2_vmalloc      20480  1 uvcvideo
videobuf2_memops       20480  1 videobuf2_vmalloc
video                  53248  0
videobuf2_v4l2         28672  1 uvcvideo
videobuf2_common       57344  2 videobuf2_v4l2,uvcvideo
videodev              233472  3 videobuf2_v4l2,uvcvideo,videobuf2_common
media                  57344  4
videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
usbcore               303104  5 ehci_pci,usbhid,uvcvideo,ehci_hcd,uhci_hcd
# modprobe nouveau
modprobe: ERROR: could not insert 'nouveau': No such device
# hwinfo --monitor
31: None 00.0: 10000 Monitor
  [Created at fb.71]
  Unique ID: rdCR.EY_qmtb9YY0
  Hardware Class: monitor
  Model: "Generic Monitor"
  Vendor: "Generic"
  Device: "Monitor"
  Resolution: 1024x768@76Hz
  Year of Manufacture: 0
  Week of Manufacture: 0
  Driver Info #0:
    Max. Resolution: 1024x768
    Vert. Sync Range: 50-90 Hz
    Hor. Sync Range: 31-61 kHz
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
# hwinfo --gfxcard
16: PCI 100.0: 0300 VGA compatible controller (VGA)
  [Created at pci.386]
  Unique ID: VCu0.3ZIBFiHqnhE
  Parent ID: vSkL.__4Fox8chd3
  SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: "nVidia GeForce 8400M GT"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x0426 "GeForce 8400M GT"
  SubVendor: pci 0x104d "Sony Corporation"
  SubDevice: pci 0x9016=20
  Revision: 0xa1
  Memory Range: 0xce000000-0xceffffff (rw,non-prefetchable)
  Memory Range: 0xd0000000-0xdfffffff (ro,non-prefetchable)
  Memory Range: 0xcc000000-0xcdffffff (rw,non-prefetchable)
  I/O Ports: 0x2000-0x2fff (rw)
  Memory Range: 0x000c0000-0x000dffff (rw,non-prefetchable,disabled)
  IRQ: 5 (no events)
  I/O Ports: 0x3c0-0x3df (rw)
  Module Alias: "pci:v000010DEd00000426sv0000104Dsd00009016bc03sc00i00"
  Driver Info #0:
    XFree86 v4 Server Module: nv
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #12 (PCI bridge)
Primary display adapter: #16
# egrep 'dri|ailed|veau' /var/log/Xorg.0.log | grep -v 't driver'
[  2155.322] (II) Scanning /etc/X11/xorg_pci_ids directory for additional P=
CI
ID's supported by the drivers
[  2155.322] (=3D=3D) Matched nvidia as autoconfigured driver 0
[  2155.322] (=3D=3D) Matched nouveau as autoconfigured driver 1
[  2155.322] (=3D=3D) Matched nv as autoconfigured driver 2
[  2155.322] (=3D=3D) Matched modesetting as autoconfigured driver 3
[  2155.322] (=3D=3D) Matched fbdev as autoconfigured driver 4
[  2155.322] (=3D=3D) Matched vesa as autoconfigured driver 5
[  2155.322] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[  2155.322] (EE) Failed to load module "nvidia" (module does not exist, 0)
[  2155.322] (II) LoadModule: "nouveau"
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[  2155.323] (II) Module nouveau: vendor=3D"X.Org Foundation"
[  2155.323] (EE) Failed to load module "nv" (module does not exist, 0)
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[  2155.324] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[  2155.324] (II) NOUVEAU driver=20
[  2155.324] (II) NOUVEAU driver for NVIDIA chipset families :
[  2155.324] (II) FBDEV: driver for framebuffer: fbdev
[  2155.324] (II) VESA: driver for VESA chipsets: vesa
[  2155.535] (EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -19
[  2155.536] (EE) open /dev/dri/card0: No such file or directory
[  2155.536] (EE) open /dev/dri/card0: No such file or directory
[  2156.135] (II) VESA(0): VESA VBE DDC read failed
[  2156.135] (II) VESA(0): VESA VBE PanelID read failed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15697664751.B5FF.792
Date: Sun, 29 Sep 2019 14:14:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853">111853</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau kernel module won't load (not available) on Sony lapt=
op with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mrmazda&#64;earthlink.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145577=
" name=3D"attach_145577" title=3D"dmesg using vanilla 5.2.14 and acpi=3Doff=
 on openSUSE Tumbleweed">attachment 145577</a> <a href=3D"attachment.cgi?id=
=3D145577&amp;action=3Dedit" title=3D"dmesg using vanilla 5.2.14 and acpi=
=3Doff on openSUSE Tumbleweed">[details]</a></span>
dmesg using vanilla 5.2.14 and acpi=3Doff on openSUSE Tumbleweed

Original summary:
nouveau won't load (not available) on Sony laptop with NVIDIA G86M [GeForce
8400M GT] ID: 10de:0426=20

This is mostly copied from <a href=3D"https://bugzilla.kernel.org/show_bug.=
cgi?id=3D204851">https://bugzilla.kernel.org/show_bug.cgi?id=3D204851</a>

This errant behavior is similarly exhibited by openSUSE Tumbleweed, 15.0, 1=
3.1
and 12.2; Linuxmint 19.0 live installation media; Knoppix 8.2 and 8.6 live
media; antiX 17.4. Using vanilla kernel 5.2.14 on Tumbleweed doesn't help.

Actual behavior:
1-nouveau kernel module doesn't load
2-ttys limited to 1024x768 mode
3-X runs only with VESA or FBDEV drivers and limited to 1024x768 mode
4-/dev/dri/card0 is absent
5-hwinfo reports HDTV display supports maximum VESA 1024x768 mode
6-GeForce 8400M gfx reported by lspci is not found by Xorg
7-[drm] Failed to open DRM device for pci:0000:01:00.0: -19
8-hwinfo improperly detects display
9-laptop locks up (requires poweroff reset) unless cmdline includes acpi=3D=
off
10-/sys/kernel/debug/dri/ is empty

Expected behavior:
1-ttys use display's native 1920x1080 mode
2-X uses modesetting DDX or nouveau DDX and native 1920x1080 mode

# inxi -GxxSMaz
System:    Host: vaio Kernel: 5.2.11-1-default x86_64 bits: 64 compiler: gc=
c v:
9.2.1=20
           parameters: root=3D/dev/sda9 ipv6.disable=3D1 net.ifnames=3D0 no=
resume
mitigations=3Dauto consoleblank=3D0=20
           drm.debug=3D0x1e log_buf_len=3D1M acpi=3Doff vga=3D791 video=3D1=
280x720&#64;60
video=3D1024x768&#64;60 video=3D1440x900&#64;60 3 acpi=3Doff=20
           Console: tty 3 dm: N/A Distro: openSUSE Tumbleweed 20190907=20
Machine:   Type: Laptop System: Sony product: VGN-AR730E v: C3LR1E11 serial:
&lt;filter&gt; Chassis: type: 10 serial: N/A=20
           Mobo: Sony model: VAIO serial: N/A BIOS: Phoenix v: R2090J8 date:
02/26/2008=20
Graphics:  Device-1: NVIDIA G86M [GeForce 8400M GT] vendor: Sony driver: N/A
bus ID: 01:00.0 chip ID: 10de:0426=20
           Display: server: X.org 1.20.5 driver: nouveau,vesa unloaded:
fbdev,modesetting alternate: nv,nvidia tty: 128x48=20
           Message: Advanced graphics data unavailable in console for root.=
=20
# lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1)
# lspci -vv -d 10de:0426
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Sony Corporation Device 9016
        Physical Slot: 1
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at ce000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at cc000000 (64-bit, non-prefetchable) [size=3D32M]
        Region 5: I/O ports at 2000 [size=3D128]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;=
512ns,
L1 &lt;4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;512ns, L1 &lt;4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled- CommCl=
k+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Kernel modules: nouveau
# dmesg | grep veau
# journalctl -b | grep veau
# lsmod | grep veau
# lsmod | grep video
uvcvideo              118784  0
videobuf2_vmalloc      20480  1 uvcvideo
videobuf2_memops       20480  1 videobuf2_vmalloc
video                  53248  0
videobuf2_v4l2         28672  1 uvcvideo
videobuf2_common       57344  2 videobuf2_v4l2,uvcvideo
videodev              233472  3 videobuf2_v4l2,uvcvideo,videobuf2_common
media                  57344  4
videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
usbcore               303104  5 ehci_pci,usbhid,uvcvideo,ehci_hcd,uhci_hcd
# modprobe nouveau
modprobe: ERROR: could not insert 'nouveau': No such device
# hwinfo --monitor
31: None 00.0: 10000 Monitor
  [Created at fb.71]
  Unique ID: rdCR.EY_qmtb9YY0
  Hardware Class: monitor
  Model: &quot;Generic Monitor&quot;
  Vendor: &quot;Generic&quot;
  Device: &quot;Monitor&quot;
  Resolution: 1024x768&#64;76Hz
  Year of Manufacture: 0
  Week of Manufacture: 0
  Driver Info #0:
    Max. Resolution: 1024x768
    Vert. Sync Range: 50-90 Hz
    Hor. Sync Range: 31-61 kHz
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
# hwinfo --gfxcard
16: PCI 100.0: 0300 VGA compatible controller (VGA)
  [Created at pci.386]
  Unique ID: VCu0.3ZIBFiHqnhE
  Parent ID: vSkL.__4Fox8chd3
  SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: &quot;nVidia GeForce 8400M GT&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x0426 &quot;GeForce 8400M GT&quot;
  SubVendor: pci 0x104d &quot;Sony Corporation&quot;
  SubDevice: pci 0x9016=20
  Revision: 0xa1
  Memory Range: 0xce000000-0xceffffff (rw,non-prefetchable)
  Memory Range: 0xd0000000-0xdfffffff (ro,non-prefetchable)
  Memory Range: 0xcc000000-0xcdffffff (rw,non-prefetchable)
  I/O Ports: 0x2000-0x2fff (rw)
  Memory Range: 0x000c0000-0x000dffff (rw,non-prefetchable,disabled)
  IRQ: 5 (no events)
  I/O Ports: 0x3c0-0x3df (rw)
  Module Alias: &quot;pci:v000010DEd00000426sv0000104Dsd00009016bc03sc00i00=
&quot;
  Driver Info #0:
    XFree86 v4 Server Module: nv
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #12 (PCI bridge)
Primary display adapter: #16
# egrep 'dri|ailed|veau' /var/log/Xorg.0.log | grep -v 't driver'
[  2155.322] (II) Scanning /etc/X11/xorg_pci_ids directory for additional P=
CI
ID's supported by the drivers
[  2155.322] (=3D=3D) Matched nvidia as autoconfigured driver 0
[  2155.322] (=3D=3D) Matched nouveau as autoconfigured driver 1
[  2155.322] (=3D=3D) Matched nv as autoconfigured driver 2
[  2155.322] (=3D=3D) Matched modesetting as autoconfigured driver 3
[  2155.322] (=3D=3D) Matched fbdev as autoconfigured driver 4
[  2155.322] (=3D=3D) Matched vesa as autoconfigured driver 5
[  2155.322] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[  2155.322] (EE) Failed to load module &quot;nvidia&quot; (module does not=
 exist, 0)
[  2155.322] (II) LoadModule: &quot;nouveau&quot;
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[  2155.323] (II) Module nouveau: vendor=3D&quot;X.Org Foundation&quot;
[  2155.323] (EE) Failed to load module &quot;nv&quot; (module does not exi=
st, 0)
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[  2155.323] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[  2155.324] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[  2155.324] (II) NOUVEAU driver=20
[  2155.324] (II) NOUVEAU driver for NVIDIA chipset families :
[  2155.324] (II) FBDEV: driver for framebuffer: fbdev
[  2155.324] (II) VESA: driver for VESA chipsets: vesa
[  2155.535] (EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -19
[  2155.536] (EE) open /dev/dri/card0: No such file or directory
[  2155.536] (EE) open /dev/dri/card0: No such file or directory
[  2156.135] (II) VESA(0): VESA VBE DDC read failed
[  2156.135] (II) VESA(0): VESA VBE PanelID read failed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15697664751.B5FF.792--

--===============0139479409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0139479409==--
