Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D6640E3
	for <lists+nouveau@lfdr.de>; Wed, 10 Jul 2019 08:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23069894FF;
	Wed, 10 Jul 2019 06:04:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 492DE894FF
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jul 2019 06:04:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 400EB72167; Wed, 10 Jul 2019 06:04:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 10 Jul 2019 06:04:05 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paulo@matos-sorge.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111098-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111098] New: xf16-video-nouveau 1.0.16-1 arch fails
 to resume from blank
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
Content-Type: multipart/mixed; boundary="===============0723746145=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0723746145==
Content-Type: multipart/alternative; boundary="15627386460.09fD5F.25142"
Content-Transfer-Encoding: 7bit


--15627386460.09fD5F.25142
Date: Wed, 10 Jul 2019 06:04:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111098

            Bug ID: 111098
           Summary: xf16-video-nouveau 1.0.16-1 arch fails to resume from
                    blank
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: paulo@matos-sorge.com
        QA Contact: nouveau@lists.freedesktop.org

I have a GM206 video (GTX950) card and moved from the official drivers to
nouveau to try them out. It fails to resume from a blank screen. I am on a =
dual
head setup.=20

The card (from lspci -vv) is:
02:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: eVga.com. Corp. GM206 [GeForce GTX 950]
        Physical Slot: 4
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 32
        NUMA node: 0
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at fb000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee00338  Data: 0000
        Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM not supported
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (downgraded), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Via message
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                         AtomicOpsCtl: ReqEn-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
                        Status: NegoPending- InProgress-
        Capabilities: [258 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
L1_PM_Substates+
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-

                L1SubCtl2:
        Capabilities: [128 v1] Power Budgeting <?>
        Capabilities: [420 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 <?>
        Capabilities: [900 v1] Secondary PCI Express <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

The xorg config I have for dual head is at xorg.conf.d/20-nouveau.conf:
# the right one
Section "Monitor"
          Identifier   "LG1"
          # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75=
 MHz
          Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
2168 2237 -hsync +vsync
          Option "PreferredMode" "3840x2160_60.00"
EndSection

# the left one
Section "Monitor"
          Identifier   "LG2"
          # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75=
 MHz
          Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
2168 2237 -hsync +vsync
          Option "PreferredMode" "3840x2160_60.00"
          Option "RightOf" "LG1"
          Option "Rotate" "right"
EndSection

Section "Device"
    Identifier "nvidia card"
    Driver "nouveau"
    Option  "DP-2" "LG1"
    Option  "DP-3" "LG2"
EndSection

Section "Screen"
    Identifier "screen1"
    Monitor "LG1"
    DefaultDepth 24
      SubSection "Display"
       Depth      24
       Virtual 2560 2048
      EndSubSection
    Device "nvidia card"
EndSection

Section "ServerLayout"
    Identifier "layout1"
    Screen "screen1"
EndSection

This config is not necessarily correct (virtual is not properly setup) but =
it
should cause any crashes.=20

journalctl -xb | grep nouveau:
Jul 09 18:20:29 andromeda kernel: fb0: switching to nouveaufb from EFI VGA
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: NVIDIA GM206 (12602=
0a1)
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: bios: version
84.06.2f.00.7e
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: fb: 2048 MiB GDDR5
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO write of
80000028 FAULT at 10eb14 [ IBUS ]
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: GART: 1048576 =
MiB
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: TMDS table ver=
sion
2.0
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB version 4.1
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 00:
01000f02 00020030
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 01:
02000f00 00000000
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 02:
02811f76 04400020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 03:
02011f72 00020020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 04:
04822f86 04400010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 05:
04022f82 00020010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 06:
04833f96 04400020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 07:
04033f92 00020020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 08:
02044f62 00020010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 15:
01df5ff8 00000000
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 00:
00001030
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 01:
00020146
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 02:
01000246
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 03:
02000346
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 04:
00010461
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 05:
00000570
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: MM: using COPY=
 for
buffer copies
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: failed to crea=
te
encoder 1/8/0: -19
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: Virtual-1 has =
no
encoders, removing
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: allocated
3840x2160 fb: 0xa0000, bo 00000000169f715a
Jul 09 18:20:29 andromeda kernel: fbcon: nouveaufb (fb0) is primary device
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: fb0: nouveaufb frame
buffer device
Jul 09 18:20:29 andromeda kernel: [drm] Initialized nouveau 1.3.1 20120801 =
for
0000:02:00.0 on minor 0
Jul 09 18:50:27 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:29 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeout
Jul 09 18:50:29 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:31 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: DRM: base-1: timeout
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690500 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 6900c0 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 18:50:44 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:46 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeout
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: DRM: base-1: timeout
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690500 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690400 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61cdbc [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690100 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690000 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61c5bc [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:09 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 20:43:11 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeout

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15627386460.09fD5F.25142
Date: Wed, 10 Jul 2019 06:04:06 +0000
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
   title=3D"NEW - xf16-video-nouveau 1.0.16-1 arch fails to resume from bla=
nk"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111098">111098</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xf16-video-nouveau 1.0.16-1 arch fails to resume from blank
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>paulo&#64;matos-sorge.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a GM206 video (GTX950) card and moved from the official=
 drivers to
nouveau to try them out. It fails to resume from a blank screen. I am on a =
dual
head setup.=20

The card (from lspci -vv) is:
02:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: eVga.com. Corp. GM206 [GeForce GTX 950]
        Physical Slot: 4
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 32
        NUMA node: 0
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at fb000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee00338  Data: 0000
        Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM not supported
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (downgraded), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Via message
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                         AtomicOpsCtl: ReqEn-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
                        Status: NegoPending- InProgress-
        Capabilities: [258 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
L1_PM_Substates+
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-

                L1SubCtl2:
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Capabilities: [420 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 &lt;?&gt;
        Capabilities: [900 v1] Secondary PCI Express &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

The xorg config I have for dual head is at xorg.conf.d/20-nouveau.conf:
# the right one
Section &quot;Monitor&quot;
          Identifier   &quot;LG1&quot;
          # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75=
 MHz
          Modeline &quot;3840x2160_60.00&quot;  712.75  3840 4160 4576 5312=
  2160 2163
2168 2237 -hsync +vsync
          Option &quot;PreferredMode&quot; &quot;3840x2160_60.00&quot;
EndSection

# the left one
Section &quot;Monitor&quot;
          Identifier   &quot;LG2&quot;
          # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75=
 MHz
          Modeline &quot;3840x2160_60.00&quot;  712.75  3840 4160 4576 5312=
  2160 2163
2168 2237 -hsync +vsync
          Option &quot;PreferredMode&quot; &quot;3840x2160_60.00&quot;
          Option &quot;RightOf&quot; &quot;LG1&quot;
          Option &quot;Rotate&quot; &quot;right&quot;
EndSection

Section &quot;Device&quot;
    Identifier &quot;nvidia card&quot;
    Driver &quot;nouveau&quot;
    Option  &quot;DP-2&quot; &quot;LG1&quot;
    Option  &quot;DP-3&quot; &quot;LG2&quot;
EndSection

Section &quot;Screen&quot;
    Identifier &quot;screen1&quot;
    Monitor &quot;LG1&quot;
    DefaultDepth 24
      SubSection &quot;Display&quot;
       Depth      24
       Virtual 2560 2048
      EndSubSection
    Device &quot;nvidia card&quot;
EndSection

Section &quot;ServerLayout&quot;
    Identifier &quot;layout1&quot;
    Screen &quot;screen1&quot;
EndSection

This config is not necessarily correct (virtual is not properly setup) but =
it
should cause any crashes.=20

journalctl -xb | grep nouveau:
Jul 09 18:20:29 andromeda kernel: fb0: switching to nouveaufb from EFI VGA
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: NVIDIA GM206 (12602=
0a1)
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: bios: version
84.06.2f.00.7e
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: fb: 2048 MiB GDDR5
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO write of
80000028 FAULT at 10eb14 [ IBUS ]
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: VRAM: 2048 MiB
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: GART: 1048576 =
MiB
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: TMDS table ver=
sion
2.0
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB version 4.1
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 00:
01000f02 00020030
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 01:
02000f00 00000000
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 02:
02811f76 04400020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 03:
02011f72 00020020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 04:
04822f86 04400010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 05:
04022f82 00020010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 06:
04833f96 04400020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 07:
04033f92 00020020
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 08:
02044f62 00020010
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB outp 15:
01df5ff8 00000000
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 00:
00001030
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 01:
00020146
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 02:
01000246
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 03:
02000346
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 04:
00010461
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: DCB conn 05:
00000570
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: MM: using COPY=
 for
buffer copies
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: failed to crea=
te
encoder 1/8/0: -19
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: Virtual-1 has =
no
encoders, removing
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: DRM: allocated
3840x2160 fb: 0xa0000, bo 00000000169f715a
Jul 09 18:20:29 andromeda kernel: fbcon: nouveaufb (fb0) is primary device
Jul 09 18:20:29 andromeda kernel: nouveau 0000:02:00.0: fb0: nouveaufb frame
buffer device
Jul 09 18:20:29 andromeda kernel: [drm] Initialized nouveau 1.3.1 20120801 =
for
0000:02:00.0 on minor 0
Jul 09 18:50:27 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:29 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeout
Jul 09 18:50:29 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:31 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: DRM: base-1: timeout
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:33 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690500 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 6900c0 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 18:50:42 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 18:50:44 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 18:50:46 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeout
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: DRM: base-1: timeout
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 18:50:48 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61a804 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616e18 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690500 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690400 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61cdbc [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690100 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 690000 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 61c5bc [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:07 andromeda kernel: nouveau 0000:02:00.0: bus: MMIO read of
00000000 FAULT at 616618 [ IBUS ]
Jul 09 20:43:09 andromeda kernel: nouveau 0000:02:00.0: DRM: core notifier
timeout
Jul 09 20:43:11 andromeda kernel: nouveau 0000:02:00.0: DRM: base-0: timeou=
t</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15627386460.09fD5F.25142--

--===============0723746145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0723746145==--
