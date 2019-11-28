Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4010CCB2
	for <lists+nouveau@lfdr.de>; Thu, 28 Nov 2019 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0796E860;
	Thu, 28 Nov 2019 16:22:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F3A26E861
 for <nouveau@lists.freedesktop.org>; Thu, 28 Nov 2019 16:21:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2B433720E2; Thu, 28 Nov 2019 16:21:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 28 Nov 2019 16:21:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugs.freedesktop.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-103721-8800-T11wSfEfRn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-103721-8800@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 103721] [GM107] Frequent freezes with nouveau on
 Thinkpad P50
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
Content-Type: multipart/mixed; boundary="===============2137816859=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2137816859==
Content-Type: multipart/alternative; boundary="15749581191.b2060bA4.23505"
Content-Transfer-Encoding: 7bit


--15749581191.b2060bA4.23505
Date: Thu, 28 Nov 2019 16:21:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #16 from Paul Menzel <pmenzel+bugs.freedesktop.org@molgen.mpg.d=
e> ---
With GF108 and Linux 4.19.57:

```
$ more /proc/version=20
Linux version 4.19.57.mx64.286 (root@x) (gcc version 7.3.0 (GCC)) #1=20
SMP Wed Aug 14 16:16:03 CEST 2019
$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v2/3rd Gen Core
processor DRAM Controller [8086:0150] (rev 09)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v2/3rd Gen Core
processor PCI Express Root Port [8086:0151] (rev 09)
00:14.0 USB controller [0c03]: Intel Corporation 7 Series/C210 Series Chips=
et
Family USB xHCI Host Controller [8086:1e31] (rev 04)
00:16.0 Communication controller [0780]: Intel Corporation 7 Series/C216
Chipset Family MEI Controller #1 [8086:1e3a] (rev 04)
00:19.0 Ethernet controller [0200]: Intel Corporation 82579LM Gigabit Netwo=
rk
Connection (Lewisville) [8086:1502] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Fami=
ly
USB Enhanced Host Controller #2 [8086:1e2d] (rev 04)
00:1b.0 Audio device [0403]: Intel Corporation 7 Series/C216 Chipset Family
High Definition Audio Controller [8086:1e20] (rev 04)
00:1d.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Fami=
ly
USB Enhanced Host Controller #1 [8086:1e26] (rev 04)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (=
rev
a4)
00:1f.0 ISA bridge [0601]: Intel Corporation Q77 Express Chipset LPC Contro=
ller
[8086:1e47] (rev 04)
00:1f.2 SATA controller [0106]: Intel Corporation 7 Series/C210 Series Chip=
set
Family 6-port SATA Controller [AHCI mode] [8086:1e02] (rev 04)
00:1f.3 SMBus [0c05]: Intel Corporation 7 Series/C216 Chipset Family SMBus
Controller [8086:1e22] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GL [Quadro
600] [10de:0df8] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GF108 High Definition Audio
Controller [10de:0bea] (rev a1)
$ dmesg | grep nouv
[   23.062660] nouveau 0000:01:00.0: NVIDIA GF108 (0c1c00a1)
[   23.197326] nouveau 0000:01:00.0: bios: version 70.08.c1.00.02
[   23.197919] nouveau 0000:01:00.0: fb: 1024 MiB DDR3
[   23.867419] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[   23.867420] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   23.867422] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   23.867423] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   23.867424] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000000
[   23.867425] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00020030
[   23.867426] nouveau 0000:01:00.0: DRM: DCB outp 02: 028113a6 0f220010
[   23.867427] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011362 00020010
[   23.867428] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   23.867428] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   23.869194] nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[   23.960640] nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb: 0x60000, =
bo
00000000f1f70e52
[   23.961989] fbcon: nouveaufb (fb0) is primary device
[   24.147092] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   24.152963] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[175084.868585] nouveau 0000:01:00.0: rstudio[7618]: Unknown handle 0x00000=
04e
[175084.868588] nouveau 0000:01:00.0: rstudio[7618]: validate_init
[175084.868589] nouveau 0000:01:00.0: rstudio[7618]: validate: -2
[175084.869400] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[7618]] subc 0 mthd 0000 data 00000000
[175084.869420] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a58 data 80000708
[175084.869431] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a5c data 20050004
[175084.869439] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a60 data 00000000
[175084.869448] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a64 data 00013060
[175084.869460] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a68 data 00000089
[175084.869469] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a6c data 00000002
[175084.869478] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a70 data 00000000
[175084.869487] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a74 data 20010586
[175084.869498] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a78 data 00000005
[175084.869508] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a7c data 6002057c
[175084.869517] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a80 data 00010000
[175084.869526] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a84 data 00030002
[175084.869537] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a88 data 80000585
[175084.869546] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a8c data 200308e0
[175084.869556] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a90 data 00010000
[175084.869566] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a94 data 00000000
[175084.869577] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a98 data 002e0000
[175084.869591] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a9c data a01508e3
[175084.869600] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa0 data 00000000
[175084.869609] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa4 data 3ada740e
[175084.869623] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa8 data 00000000
[175084.869634] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aac data 00000000
[175084.869645] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab0 data 00000000
[175084.869656] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab4 data 00000000
[175084.869668] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab8 data bb1548e5
[175084.869679] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1abc data 00000000
[175084.869690] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac0 data 00000000
[175084.869701] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac4 data 00000000
[175084.869712] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac8 data 00000000
[175084.869723] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1acc data 00000000
[175084.869734] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad0 data 00000000
[175084.869745] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad4 data bf800000
[175084.869756] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad8 data 3f800000
[175084.869767] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1adc data 00000000
[175084.869778] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae0 data 3f800000
[175084.869789] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae4 data 00000000
[175084.869800] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae8 data 00000000
[175084.869811] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aec data 00000000
[175084.869822] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af0 data 00000000
[175084.869833] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af4 data 60010921
[175084.869844] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af8 data 00001601
[175084.869855] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1afc data 20030700
[175084.869866] nouveau 0000:01:00.0: fifo: PBDMA0: 00840000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b00 data 00001010
[175084.869877] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b04 data 00000000
[175084.869888] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b08 data 00b8fb00
[175084.869899] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b0c data 200207c0
[175084.869910] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b58 data 20030704
[175084.869921] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b5c data 00001004
[175084.869931] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b60 data 00000000
[175084.869941] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b64 data 00b8fb40
[175084.869959] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b68 data 200207c2
[175084.869968] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b6c data 00000000
[175084.869977] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b70 data 00b8fb5b
[175084.869986] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b74 data 80000708
[175084.869995] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b78 data 20010586
[175084.870004] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b7c data 00000005
[175084.870013] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b80 data 6002057c
[175084.870022] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b84 data 00010000
[175084.870031] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b88 data 00030002
[175084.870040] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b8c data 80000585
[175084.870049] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b90 data 200308e0
[175084.870058] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b94 data 00010000
[175084.870067] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b98 data 00000000
[175084.870076] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b9c data 002e0000
[175084.870086] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba0 data a01508e3
[175084.870097] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba4 data 00000000
[175084.870108] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba8 data 3ada740e
[175084.870119] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bac data 00000000
[175084.870130] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb0 data 00000000
[175084.870140] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb4 data 00000000
[175084.870151] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb8 data 00000000
[175084.870162] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bbc data bb1548e5
[175084.870173] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc0 data 00000000
[175084.870184] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc4 data 00000000
[175084.870195] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc8 data 00000000
[175084.870206] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bcc data 00000000
[175084.870217] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd0 data 00000000
[175084.870227] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd4 data 00000000
[175084.870238] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd8 data bf800000
[175084.870249] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bdc data 3f800000
[175084.870260] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be0 data 00000000
[175084.870271] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be4 data 3f800000
[175084.870282] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be8 data 00000000
[175084.870293] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bec data 00000000
[175084.870304] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf0 data 00000000
[175084.870315] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf4 data 00000000
[175084.870326] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf8 data 60010921
[175084.870337] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bfc data 00001801
[175084.870348] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c00 data 20030700
[175084.870359] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c04 data 00001010
[175084.870370] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c08 data 00000000
[175084.870381] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c0c data 00b8fc00
[185602.382314] nouveau 0000:01:00.0: rstudio[7618]: Unknown handle 0x00000=
06d
[185602.382316] nouveau 0000:01:00.0: rstudio[7618]: validate_init
[185602.382317] nouveau 0000:01:00.0: rstudio[7618]: validate: -2
[187614.960528] nouveau 0000:01:00.0: rstudio[26208]: Unknown handle 0x0000=
006d
[187614.960531] nouveau 0000:01:00.0: rstudio[26208]: validate_init
[187614.960532] nouveau 0000:01:00.0: rstudio[26208]: validate: -2
[187614.984569] rstudio[26208]: segfault at 980 ip 00007f87e686bd06 sp
00007fff621725b0 error 6 in libdrm_nouveau.so.2.0.0[7f87e6869000+4000]
[187614.992463] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 0 mthd 001c data 00000002
[187614.992490] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 0 mthd 0020 data 00000000
[187614.992507] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 3 mthd 3000 data 00000c8c
[187642.745766] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.745776] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.746459] nouveau 0000:01:00.0: rstudio[31631]: Unknown handle 0x0000=
0089
[187642.746461] nouveau 0000:01:00.0: rstudio[31631]: validate_init
[187642.746461] nouveau 0000:01:00.0: rstudio[31631]: validate: -2
[187642.748811] nouveau 0000:01:00.0: rstudio[31631]: Unknown handle 0x0000=
008c
[187642.748812] nouveau 0000:01:00.0: rstudio[31631]: validate_init
[187642.748813] nouveau 0000:01:00.0: rstudio[31631]: validate: -2
[187642.759243] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.759336] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 6 [003fa78000 rstudio[31631]] subc 0 class 9197 mthd =
1334
data 20050004
[187668.616105] nouveau 0000:01:00.0: rstudio[31631]: failed to idle channe=
l 6
[rstudio[31631]]
[187683.615824] nouveau 0000:01:00.0: rstudio[31631]: failed to idle channe=
l 6
[rstudio[31631]]
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15749581191.b2060bA4.23505
Date: Thu, 28 Nov 2019 16:21:59 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmenzel+bugs.freedesktop.org&#64;molgen.mpg.de" title=3D"Paul Menzel &lt;pm=
enzel+bugs.freedesktop.org&#64;molgen.mpg.de&gt;"> <span class=3D"fn">Paul =
Menzel</span></a>
</span></b>
        <pre>With GF108 and Linux 4.19.57:

```
$ more /proc/version=20
Linux version 4.19.57.mx64.286 (root&#64;x) (gcc version 7.3.0 (GCC)) #1=20
SMP Wed Aug 14 16:16:03 CEST 2019
$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v2/3rd Gen Core
processor DRAM Controller [8086:0150] (rev 09)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v2/3rd Gen Core
processor PCI Express Root Port [8086:0151] (rev 09)
00:14.0 USB controller [0c03]: Intel Corporation 7 Series/C210 Series Chips=
et
Family USB xHCI Host Controller [8086:1e31] (rev 04)
00:16.0 Communication controller [0780]: Intel Corporation 7 Series/C216
Chipset Family MEI Controller #1 [8086:1e3a] (rev 04)
00:19.0 Ethernet controller [0200]: Intel Corporation 82579LM Gigabit Netwo=
rk
Connection (Lewisville) [8086:1502] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Fami=
ly
USB Enhanced Host Controller #2 [8086:1e2d] (rev 04)
00:1b.0 Audio device [0403]: Intel Corporation 7 Series/C216 Chipset Family
High Definition Audio Controller [8086:1e20] (rev 04)
00:1d.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Fami=
ly
USB Enhanced Host Controller #1 [8086:1e26] (rev 04)
00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (=
rev
a4)
00:1f.0 ISA bridge [0601]: Intel Corporation Q77 Express Chipset LPC Contro=
ller
[8086:1e47] (rev 04)
00:1f.2 SATA controller [0106]: Intel Corporation 7 Series/C210 Series Chip=
set
Family 6-port SATA Controller [AHCI mode] [8086:1e02] (rev 04)
00:1f.3 SMBus [0c05]: Intel Corporation 7 Series/C216 Chipset Family SMBus
Controller [8086:1e22] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GL [Quadro
600] [10de:0df8] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GF108 High Definition Audio
Controller [10de:0bea] (rev a1)
$ dmesg | grep nouv
[   23.062660] nouveau 0000:01:00.0: NVIDIA GF108 (0c1c00a1)
[   23.197326] nouveau 0000:01:00.0: bios: version 70.08.c1.00.02
[   23.197919] nouveau 0000:01:00.0: fb: 1024 MiB DDR3
[   23.867419] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[   23.867420] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   23.867422] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   23.867423] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   23.867424] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000000
[   23.867425] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00020030
[   23.867426] nouveau 0000:01:00.0: DRM: DCB outp 02: 028113a6 0f220010
[   23.867427] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011362 00020010
[   23.867428] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   23.867428] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   23.869194] nouveau 0000:01:00.0: DRM: MM: using COPY0 for buffer copies
[   23.960640] nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb: 0x60000, =
bo
00000000f1f70e52
[   23.961989] fbcon: nouveaufb (fb0) is primary device
[   24.147092] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   24.152963] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[175084.868585] nouveau 0000:01:00.0: rstudio[7618]: Unknown handle 0x00000=
04e
[175084.868588] nouveau 0000:01:00.0: rstudio[7618]: validate_init
[175084.868589] nouveau 0000:01:00.0: rstudio[7618]: validate: -2
[175084.869400] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[7618]] subc 0 mthd 0000 data 00000000
[175084.869420] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a58 data 80000708
[175084.869431] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a5c data 20050004
[175084.869439] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a60 data 00000000
[175084.869448] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a64 data 00013060
[175084.869460] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a68 data 00000089
[175084.869469] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a6c data 00000002
[175084.869478] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a70 data 00000000
[175084.869487] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a74 data 20010586
[175084.869498] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a78 data 00000005
[175084.869508] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a7c data 6002057c
[175084.869517] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a80 data 00010000
[175084.869526] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a84 data 00030002
[175084.869537] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a88 data 80000585
[175084.869546] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a8c data 200308e0
[175084.869556] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a90 data 00010000
[175084.869566] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a94 data 00000000
[175084.869577] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a98 data 002e0000
[175084.869591] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1a9c data a01508e3
[175084.869600] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa0 data 00000000
[175084.869609] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa4 data 3ada740e
[175084.869623] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aa8 data 00000000
[175084.869634] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aac data 00000000
[175084.869645] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab0 data 00000000
[175084.869656] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab4 data 00000000
[175084.869668] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ab8 data bb1548e5
[175084.869679] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1abc data 00000000
[175084.869690] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac0 data 00000000
[175084.869701] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac4 data 00000000
[175084.869712] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ac8 data 00000000
[175084.869723] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1acc data 00000000
[175084.869734] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad0 data 00000000
[175084.869745] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad4 data bf800000
[175084.869756] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ad8 data 3f800000
[175084.869767] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1adc data 00000000
[175084.869778] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae0 data 3f800000
[175084.869789] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae4 data 00000000
[175084.869800] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ae8 data 00000000
[175084.869811] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1aec data 00000000
[175084.869822] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af0 data 00000000
[175084.869833] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af4 data 60010921
[175084.869844] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1af8 data 00001601
[175084.869855] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1afc data 20030700
[175084.869866] nouveau 0000:01:00.0: fifo: PBDMA0: 00840000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b00 data 00001010
[175084.869877] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b04 data 00000000
[175084.869888] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b08 data 00b8fb00
[175084.869899] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b0c data 200207c0
[175084.869910] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b58 data 20030704
[175084.869921] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b5c data 00001004
[175084.869931] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b60 data 00000000
[175084.869941] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b64 data 00b8fb40
[175084.869959] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b68 data 200207c2
[175084.869968] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b6c data 00000000
[175084.869977] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b70 data 00b8fb5b
[175084.869986] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b74 data 80000708
[175084.869995] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b78 data 20010586
[175084.870004] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b7c data 00000005
[175084.870013] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b80 data 6002057c
[175084.870022] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b84 data 00010000
[175084.870031] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b88 data 00030002
[175084.870040] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b8c data 80000585
[175084.870049] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b90 data 200308e0
[175084.870058] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b94 data 00010000
[175084.870067] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b98 data 00000000
[175084.870076] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1b9c data 002e0000
[175084.870086] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba0 data a01508e3
[175084.870097] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba4 data 00000000
[175084.870108] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1ba8 data 3ada740e
[175084.870119] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bac data 00000000
[175084.870130] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb0 data 00000000
[175084.870140] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb4 data 00000000
[175084.870151] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bb8 data 00000000
[175084.870162] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bbc data bb1548e5
[175084.870173] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc0 data 00000000
[175084.870184] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc4 data 00000000
[175084.870195] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bc8 data 00000000
[175084.870206] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bcc data 00000000
[175084.870217] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd0 data 00000000
[175084.870227] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd4 data 00000000
[175084.870238] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bd8 data bf800000
[175084.870249] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bdc data 3f800000
[175084.870260] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be0 data 00000000
[175084.870271] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be4 data 3f800000
[175084.870282] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1be8 data 00000000
[175084.870293] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bec data 00000000
[175084.870304] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf0 data 00000000
[175084.870315] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf4 data 00000000
[175084.870326] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bf8 data 60010921
[175084.870337] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1bfc data 00001801
[175084.870348] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c00 data 20030700
[175084.870359] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c04 data 00001010
[175084.870370] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c08 data 00000000
[175084.870381] nouveau 0000:01:00.0: fifo: PBDMA0: 00800000 [EMPTY_SUBC] c=
h 6
[003fa78000 rstudio[7618]] subc 7 mthd 1c0c data 00b8fc00
[185602.382314] nouveau 0000:01:00.0: rstudio[7618]: Unknown handle 0x00000=
06d
[185602.382316] nouveau 0000:01:00.0: rstudio[7618]: validate_init
[185602.382317] nouveau 0000:01:00.0: rstudio[7618]: validate: -2
[187614.960528] nouveau 0000:01:00.0: rstudio[26208]: Unknown handle 0x0000=
006d
[187614.960531] nouveau 0000:01:00.0: rstudio[26208]: validate_init
[187614.960532] nouveau 0000:01:00.0: rstudio[26208]: validate: -2
[187614.984569] rstudio[26208]: segfault at 980 ip 00007f87e686bd06 sp
00007fff621725b0 error 6 in libdrm_nouveau.so.2.0.0[7f87e6869000+4000]
[187614.992463] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 0 mthd 001c data 00000002
[187614.992490] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 0 mthd 0020 data 00000000
[187614.992507] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[26208]] subc 3 mthd 3000 data 00000c8c
[187642.745766] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.745776] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.746459] nouveau 0000:01:00.0: rstudio[31631]: Unknown handle 0x0000=
0089
[187642.746461] nouveau 0000:01:00.0: rstudio[31631]: validate_init
[187642.746461] nouveau 0000:01:00.0: rstudio[31631]: validate: -2
[187642.748811] nouveau 0000:01:00.0: rstudio[31631]: Unknown handle 0x0000=
008c
[187642.748812] nouveau 0000:01:00.0: rstudio[31631]: validate_init
[187642.748813] nouveau 0000:01:00.0: rstudio[31631]: validate: -2
[187642.759243] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 6
[003fa78000 rstudio[31631]] subc 0 mthd 0000 data 00000000
[187642.759336] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 6 [003fa78000 rstudio[31631]] subc 0 class 9197 mthd =
1334
data 20050004
[187668.616105] nouveau 0000:01:00.0: rstudio[31631]: failed to idle channe=
l 6
[rstudio[31631]]
[187683.615824] nouveau 0000:01:00.0: rstudio[31631]: failed to idle channe=
l 6
[rstudio[31631]]
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15749581191.b2060bA4.23505--

--===============2137816859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2137816859==--
