Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC84CC2CBB
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 13:34:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED510E91B;
	Tue, 16 Dec 2025 12:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=chead.ca header.i=@chead.ca header.b="LtxzFdpt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0E96B455AE;
	Tue, 16 Dec 2025 12:27:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765888040;
 b=k8HBRFPy4R1heJ2n1/Y3xhyN++EBgbVs9fNuMIP4sOfn1U2m0bq2apVd7bsQSuC2xgU7y
 q/XQB8wGUzbGLS/EiwLH5bvQAVsjOQSBbisLC1LfXAr14KnGUTYnuYFgp2vpMT+UvQrOZEm
 il5n2W+sBd1ImcT4m+V2kF6EMMwpASTGk80kfxGOFAv8g3ulLHAVaaSQJOWAxemQjN/WKbU
 Nzqnn08CwCD3IbDhSIIE1mjLlW25EZUOKKERLyZ5CQaUXpXacQVCedUTgC+7gq2+QjjLHIF
 f67h1B7GMEnYH9/3Pw+fadLYJ8P9Hb8MSBY66HgS9OAeQQpX37THw41MWESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765888040; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0J8AnFAs9lXgUVn6tNPKS6hkgVYfK+0aY6lOmg0+hzc=;
 b=Oc4YmwQiv/ldDNX1pZ3q73L5WCfGh4SPrBRq6J06xDob6/lDgdqjs7goPoAFZExoRu9pi
 sIFIJ8aAnt0lcG0nUkkwR5dosnALtUjeYSeFX24k7bwakzjlvniH8piDHjT1RhOnBQlAb6N
 jVeiRJHiPZLd0M/Dz7QUGgbEocNsC9OpVkCabiIhRZz3MJVtZYPFodQwHUBseFUQo86jCee
 GW00zZk4eSiElshDn7e8P+n14aAokwJXEKxZmi6TuA+kwpxQc4fjqVVwGC4HIhPGOCzWZDl
 1S7qjXjZjpBFBwR15YUJtoE01l7Ibm9qAJCY7n6eAd4MoLVvJZMa74FhE5Ew==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=chead.ca;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=chead.ca
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=chead.ca;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=chead.ca policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 205FE43E08
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 02:42:56 +0000 (UTC)
X-Greylist: delayed 754 seconds by postgrey-1.36 at gabe;
 Tue, 16 Dec 2025 02:50:21 UTC
Received: from lovelace.chead.ca (lovelace.chead.ca [162.223.226.168])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25A1010E64F
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 02:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chead.ca;
	s=lovelace20250308; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:
	Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0J8AnFAs9lXgUVn6tNPKS6hkgVYfK+0aY6lOmg0+hzc=; b=LtxzFdpt2JBGBH7JEPpkgCL6ks
	Dmkom5RPngoC59fDj0ZQqKmY6rlK9Yp2AQZQxZFlIlWxhKGO2312uGpd5EaFl6P7Hc0cGwflhfjfk
	bdO2p50B+Fm7sDN9cx2AHpmfUOTqijskMSUk4RYt02LByj/Xx56FI+gv0JCKF9sHoNhY=;
Received: from [2605:1700:10aa:6600:a6dd:982e:d5e7:fe3d]
 (helo=amdahl.home.chead.ca)
	by lovelace.chead.ca with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <bugs@chead.ca>)
	id 1vVL8q-000000029iy-2eOs
	for nouveau@lists.freedesktop.org;
	Mon, 15 Dec 2025 18:50:24 -0800
Date: Mon, 15 Dec 2025 18:50:17 -0800
From: Christopher Head <bugs@chead.ca>
To: nouveau@lists.freedesktop.org
Subject: MMIO read fault, screen turns off at boot with GTX 750 on kernel
 6.12.58
Message-ID: <20251215185017.08bc34d4@amdahl.home.chead.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/th79N.9wPHAR4=TgqfPsIdY";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-MailFrom: bugs@chead.ca
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: NK3XGYLAKXJZMOAFGFRHIMZJZY7KBJ4S
X-Message-ID-Hash: NK3XGYLAKXJZMOAFGFRHIMZJZY7KBJ4S
X-Mailman-Approved-At: Tue, 16 Dec 2025 12:27:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NK3XGYLAKXJZMOAFGFRHIMZJZY7KBJ4S/>
Archived-At: 
 <https://lore.freedesktop.org/20251215185017.08bc34d4@amdahl.home.chead.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--Sig_/th79N.9wPHAR4=TgqfPsIdY
Content-Type: multipart/mixed; boundary="MP_/c3OHXRZ7FLjFhPZc6e/er0/"

--MP_/c3OHXRZ7FLjFhPZc6e/er0/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
I=E2=80=99m running kernel 6.12.58 (Gentoo sources, but I can try the vanil=
la
unpatched ones if you think that would make any difference), trying to
use Nouveau. The machine boots EFI, and using SYSFB_SIMPLEFB +
DRM_SIMPLEDRM + DRM_FBDEV_EMULATION + FRAMEBUFFER_CONSOLE, everything
is fine. However, when adding DRM_NOUVEAU, when Nouveau initializes
during kernel startup, the screen turns off (DPMS-style off, not just
blank) and there are errors in the kernel log, especially the following
lines look suspicious:

* MMIO read of 00000000 FAULT at 3e6684 [ PRIVRING ]
* drm: DDC responded, but no EDID for HDMI-A-1
* [drm] Cannot find any crtc or sizes

The log is attached as   =E2=80=9Clog.txt=E2=80=9D (journalctl -ocat, built=
 with
spam-level Nouveau logging, and DEBUG_MMU + DEBUG_PUSH).

=E2=80=9Clspci -s1:0.0 -vvvnn=E2=80=9D attached as =E2=80=9Cgpu.txt=E2=80=
=9D. The GPU has three
outputs, a VGA, a DVI, and an HDMI. One screen is attached to the DVI
port and has a native resolution of 1440=C3=97900; the other two outputs are
unconnected.

Config attached as =E2=80=9Cconfig.txt=E2=80=9D.

The machine boots using EFI, so begins with an EFI framebuffer before
handing off to whatever kernel driver is in use (whether simpledrm or
nouveau).

Does anyone have any ideas?

Thanks!
--=20
Christopher Head

--MP_/c3OHXRZ7FLjFhPZc6e/er0/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=gpu.txt

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107 [GeForce=
 GTX 750] [10de:1381] (rev a2) (prog-if 00 [VGA controller])
	Subsystem: ASUSTeK Computer Inc. Device [1043:84ad]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
	Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
	Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
	Region 5: I/O ports at e000 [size=3D128]
	Expansion ROM at 000c0000 [disabled] [size=3D128K]
	Capabilities: [60] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [78] Express (v2) Legacy Endpoint, IntMsgNum 0
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <5=
12ns, L1 <4us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x16
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via message, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- Equaliz=
ationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
	Capabilities: [100 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
			Status:	NegoPending- InProgress-
	Capabilities: [250 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Capabilities: [258 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D255us PortTPowerOnTime=3D10us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
		L1SubCtl2: T_PwrOn=3D10us
	Capabilities: [128 v1] Power Budgeting <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=3D1 Len=
=3D024 <?>
	Capabilities: [900 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0


--MP_/c3OHXRZ7FLjFhPZc6e/er0/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=log.txt

Journal started
Runtime Journal (/run/log/journal/9719b589addb4d698f35ee67da8669f9) is 8M, =
max 319.5M, 311.5M free.
Missed 1283 kernel messages
nouveau 0000:01:00.0: i2c: pad 0103: -> off
nouveau 0000:01:00.0: i2c: pad 0104: fini
nouveau 0000:01:00.0: i2c: pad 0104: -> off
nouveau 0000:01:00.0: i2c: pad 0105: fini
nouveau 0000:01:00.0: i2c: pad 0105: -> off
nouveau 0000:01:00.0: i2c: pad 0000: fini
nouveau 0000:01:00.0: i2c: pad 0000: -> off
nouveau 0000:01:00.0: i2c: pad 0001: fini
nouveau 0000:01:00.0: i2c: pad 0001: -> off
nouveau 0000:01:00.0: i2c: pad 0002: fini
nouveau 0000:01:00.0: i2c: pad 0002: -> off
nouveau 0000:01:00.0: i2c: pad 0003: fini
nouveau 0000:01:00.0: i2c: pad 0003: -> off
nouveau 0000:01:00.0: i2c: pad 010e: fini
nouveau 0000:01:00.0: i2c: pad 010e: -> off
nouveau 0000:01:00.0: i2c: reset completed in 67us
nouveau 0000:01:00.0: gpio: reset running...
nouveau 0000:01:00.0: gpio: reset completed in 9us
nouveau 0000:01:00.0: privring: reset running...
nouveau 0000:01:00.0: privring: reset completed in 0us
nouveau 0000:01:00.0: devinit: reset running...
nouveau 0000:01:00.0: devinit: reset completed in 1us
nouveau 0000:01:00.0: bios: reset running...
nouveau 0000:01:00.0: bios: reset completed in 0us
nouveau 0000:01:00.0: pci: reset running...
nouveau 0000:01:00.0: pci: reset completed in 1us
nouveau 0000:01:00.0: top: reset running...
nouveau 0000:01:00.0: top: reset completed in 0us
nouveau 0000:01:00.0: fini completed in 198us...
nouveau 0000:01:00.0: init running...
nouveau 0000:01:00.0: mc: intr 0/04000000 requested by disp
nouveau 0000:01:00.0: mc: intr 0/40000000 requested by privring
nouveau 0000:01:00.0: mc: intr 0/10000000 requested by bus
nouveau 0000:01:00.0: mc: intr 0/08002000 requested by fb
nouveau 0000:01:00.0: mc: intr 0/02000000 requested by ltc
nouveau 0000:01:00.0: mc: intr 0/01000000 requested by pmu
nouveau 0000:01:00.0: mc: intr 0/00200000 requested by gpio
nouveau 0000:01:00.0: mc: intr 0/00200000 requested by i2c
nouveau 0000:01:00.0: mc: intr 0/00100000 requested by timer
nouveau 0000:01:00.0: mc: intr 0/00040000 requested by therm
nouveau 0000:01:00.0: mc: intr 0/00000020 requested by ce0
nouveau 0000:01:00.0: mc: intr 0/00000080 requested by ce2
nouveau 0000:01:00.0: mc: intr 0/00020000 requested by nvdec0
nouveau 0000:01:00.0: mc: intr 0/00010000 requested by nvenc0
nouveau 0000:01:00.0: top: init running...
nouveau 0000:01:00.0: top: init completed in 0us
nouveau 0000:01:00.0: pci: init running...
nouveau 0000:01:00.0: pci: one-time init running...
nouveau 0000:01:00.0: pci: pcie max speed: 5.0GT/s
nouveau 0000:01:00.0: pci: one-time init completed in 3us
nouveau 0000:01:00.0: pci: adjusting cap to max speed
nouveau 0000:01:00.0: pci: adjusting lnkctl to max speed
nouveau 0000:01:00.0: pci: init completed in 19us
nouveau 0000:01:00.0: bios: init running...
nouveau 0000:01:00.0: bios: init completed in 0us
nouveau 0000:01:00.0: devinit: init running...
nouveau 0000:01:00.0: devinit: init completed in 0us
nouveau 0000:01:00.0: privring: init running...
nouveau 0000:01:00.0: privring: init completed in 4us
nouveau 0000:01:00.0: gpio: init running...
nouveau 0000:01:00.0: gpio: init completed in 6us
nouveau 0000:01:00.0: i2c: init running...
nouveau 0000:01:00.0: i2c: pad 0100: init
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: i2c: pad 0101: init
nouveau 0000:01:00.0: i2c: pad 0101: -> off
nouveau 0000:01:00.0: i2c: pad 0102: init
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: pad 0103: init
nouveau 0000:01:00.0: i2c: pad 0103: -> off
nouveau 0000:01:00.0: i2c: pad 0104: init
nouveau 0000:01:00.0: i2c: pad 0104: -> off
nouveau 0000:01:00.0: i2c: pad 0105: init
nouveau 0000:01:00.0: i2c: pad 0105: -> off
nouveau 0000:01:00.0: i2c: pad 0000: init
nouveau 0000:01:00.0: i2c: pad 0000: -> off
nouveau 0000:01:00.0: i2c: pad 0001: init
nouveau 0000:01:00.0: i2c: pad 0001: -> off
nouveau 0000:01:00.0: i2c: pad 0002: init
nouveau 0000:01:00.0: i2c: pad 0002: -> off
nouveau 0000:01:00.0: i2c: pad 0003: init
nouveau 0000:01:00.0: i2c: pad 0003: -> off
nouveau 0000:01:00.0: i2c: pad 010e: init
nouveau 0000:01:00.0: i2c: pad 010e: -> off
nouveau 0000:01:00.0: i2c: bus 0000: init
nouveau 0000:01:00.0: i2c: bus 0001: init
nouveau 0000:01:00.0: i2c: bus 0002: init
nouveau 0000:01:00.0: i2c: bus 0005: init
nouveau 0000:01:00.0: i2c: bus 0006: init
nouveau 0000:01:00.0: i2c: bus 0007: init
nouveau 0000:01:00.0: i2c: bus 0008: init
nouveau 0000:01:00.0: i2c: bus 0009: init
nouveau 0000:01:00.0: i2c: aux 000a: init
nouveau 0000:01:00.0: i2c: aux 000b: init
nouveau 0000:01:00.0: i2c: aux 000c: init
nouveau 0000:01:00.0: i2c: aux 000d: init
nouveau 0000:01:00.0: i2c: init completed in 63us
nouveau 0000:01:00.0: fuse: init running...
nouveau 0000:01:00.0: fuse: init completed in 0us
nouveau 0000:01:00.0: mxm: init running...
nouveau 0000:01:00.0: mxm: init completed in 0us
nouveau 0000:01:00.0: mc: init running...
nouveau 0000:01:00.0: mc: init completed in 0us
nouveau 0000:01:00.0: bus: init running...
nouveau 0000:01:00.0: bus: init completed in 0us
nouveau 0000:01:00.0: timer: init running...
nouveau 0000:01:00.0: timer: time low        : 1f3db369
nouveau 0000:01:00.0: timer: time high       : 00000000
nouveau 0000:01:00.0: timer: init completed in 4us
nouveau 0000:01:00.0: imem: init running...
nouveau 0000:01:00.0: imem: one-time init running...
nouveau 0000:01:00.0: imem: one-time init completed in 0us
nouveau 0000:01:00.0: imem: init completed in 4us
nouveau 0000:01:00.0: fb: init running...
nouveau 0000:01:00.0: fb: one-time init running...
nouveau 0000:01:00.0: fb: 2 FBP(s)
nouveau 0000:01:00.0: fb: FBP 0:  512 MiB, 1 LTC(s)
nouveau 0000:01:00.0: fb: FBP 1:  512 MiB, 1 LTC(s)
nouveau 0000:01:00.0: fb: Lower: 1024 MiB @ 0000000000
nouveau 0000:01:00.0: fb: Upper:    0 MiB @ 1020000000
nouveau 0000:01:00.0: fb: Total: 1024 MiB
nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
nouveau 0000:01:00.0: imem: new 00020000 00001000 1: 003fee0000 0000020000
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 3e6684 [ PRIVRING=
 ]
nouveau 0000:01:00.0: imem: new 00020000 00001000 1: 003fec0000 0000020000
nouveau 0000:01:00.0: fb: one-time init completed in 3836us
nouveau 0000:01:00.0: fb: 0x0000d98e[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e67c] 0x04 0x01
nouveau 0000:01:00.0: fb: 0x0000d995[0]: 	R[0x11e67c] =3D {
nouveau 0000:01:00.0: fb: 0x0000d995[0]: 		0xfff10000 *
nouveau 0000:01:00.0: fb: 0x0000d999[0]: 		0xfff10000
nouveau 0000:01:00.0: fb: 0x0000d99d[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9a1[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9a5[0]: 		0xfff10000
nouveau 0000:01:00.0: fb: 0x0000d9a9[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9ad[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9b1[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9b5[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9b9[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9bd[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9c1[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9c5[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9c9[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9cd[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9d1[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000d9d5[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000d9d5[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e708] 0x04 0x01
nouveau 0000:01:00.0: fb: 0x0000d9dc[0]: 	R[0x11e708] =3D {
nouveau 0000:01:00.0: fb: 0x0000d9dc[0]: 		0x00030002 *
nouveau 0000:01:00.0: fb: 0x0000d9e0[0]: 		0x00030002
nouveau 0000:01:00.0: fb: 0x0000d9e4[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000d9e8[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000d9ec[0]: 		0x00030002
nouveau 0000:01:00.0: fb: 0x0000d9f0[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000d9f4[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000d9f8[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000d9fc[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da00[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da04[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da08[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da0c[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da10[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da14[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da18[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000da1c[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000da1c[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e6a0] 0x04 0x06
nouveau 0000:01:00.0: fb: 0x0000da23[0]: 	R[0x11e6a0] =3D {
nouveau 0000:01:00.0: fb: 0x0000da23[0]: 		0x02020202 *
nouveau 0000:01:00.0: fb: 0x0000da27[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da2b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da2f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da33[0]: 		0x02020202
nouveau 0000:01:00.0: fb: 0x0000da37[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da3b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da3f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da43[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da47[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da4b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da4f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da53[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da57[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da5b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da5f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da63[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000da63[0]: 	R[0x11e6a4] =3D {
nouveau 0000:01:00.0: fb: 0x0000da63[0]: 		0x02020202 *
nouveau 0000:01:00.0: fb: 0x0000da67[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da6b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da6f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da73[0]: 		0x02020202
nouveau 0000:01:00.0: fb: 0x0000da77[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da7b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da7f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da83[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da87[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da8b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da8f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da93[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da97[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da9b[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000da9f[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000daa3[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000daa3[0]: 	R[0x11e6a8] =3D {
nouveau 0000:01:00.0: fb: 0x0000daa3[0]: 		0x00000000 *
nouveau 0000:01:00.0: fb: 0x0000daa7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daab[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daaf[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dab3[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dab7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dabb[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dabf[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dac3[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dac7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dacb[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dacf[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dad3[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dad7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dadb[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dadf[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dae3[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dae3[0]: 	R[0x11e6ac] =3D {
nouveau 0000:01:00.0: fb: 0x0000dae3[0]: 		0x00000000 *
nouveau 0000:01:00.0: fb: 0x0000dae7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daeb[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daef[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daf3[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000daf7[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dafb[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000daff[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db03[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000db07[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db0b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db0f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db13[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db17[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db1b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db1f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db23[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000db23[0]: 	R[0x11e6b0] =3D {
nouveau 0000:01:00.0: fb: 0x0000db23[0]: 		0x05050505 *
nouveau 0000:01:00.0: fb: 0x0000db27[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db2b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db2f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db33[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000db37[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db3b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db3f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db43[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000db47[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db4b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db4f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db53[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db57[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db5b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db5f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db63[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000db63[0]: 	R[0x11e6b4] =3D {
nouveau 0000:01:00.0: fb: 0x0000db63[0]: 		0x05050505 *
nouveau 0000:01:00.0: fb: 0x0000db67[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db6b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db6f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db73[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000db77[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db7b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db7f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db83[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000db87[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db8b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db8f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db93[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db97[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db9b[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000db9f[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dba3[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dba3[0]: DONE
nouveau 0000:01:00.0: fb: 0x0000dba4[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e67c] 0x04 0x01
nouveau 0000:01:00.0: fb: 0x0000dbab[0]: 	R[0x11e67c] =3D {
nouveau 0000:01:00.0: fb: 0x0000dbab[0]: 		0xfff00000 *
nouveau 0000:01:00.0: fb: 0x0000dbaf[0]: 		0xfff00000
nouveau 0000:01:00.0: fb: 0x0000dbb3[0]: 		0xfff00000
nouveau 0000:01:00.0: fb: 0x0000dbb7[0]: 		0xfff10000
nouveau 0000:01:00.0: fb: 0x0000dbbb[0]: 		0xfff00000
nouveau 0000:01:00.0: fb: 0x0000dbbf[0]: 		0xfff10000
nouveau 0000:01:00.0: fb: 0x0000dbc3[0]: 		0xfff00000
nouveau 0000:01:00.0: fb: 0x0000dbc7[0]: 		0xfff10000
nouveau 0000:01:00.0: fb: 0x0000dbcb[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbcf[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbd3[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbd7[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbdb[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbdf[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbe3[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbe7[0]: 		0x00510000
nouveau 0000:01:00.0: fb: 0x0000dbeb[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dbeb[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e708] 0x04 0x01
nouveau 0000:01:00.0: fb: 0x0000dbf2[0]: 	R[0x11e708] =3D {
nouveau 0000:01:00.0: fb: 0x0000dbf2[0]: 		0x00030440 *
nouveau 0000:01:00.0: fb: 0x0000dbf6[0]: 		0x00030442
nouveau 0000:01:00.0: fb: 0x0000dbfa[0]: 		0x00030442
nouveau 0000:01:00.0: fb: 0x0000dbfe[0]: 		0x00030000
nouveau 0000:01:00.0: fb: 0x0000dc02[0]: 		0x00030442
nouveau 0000:01:00.0: fb: 0x0000dc06[0]: 		0x00030440
nouveau 0000:01:00.0: fb: 0x0000dc0a[0]: 		0x00030442
nouveau 0000:01:00.0: fb: 0x0000dc0e[0]: 		0x00030441
nouveau 0000:01:00.0: fb: 0x0000dc12[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc16[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc1a[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc1e[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc22[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc26[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc2a[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc2e[0]: 		0x00020000
nouveau 0000:01:00.0: fb: 0x0000dc32[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dc32[0]: RAM_RESTRICT_ZM_REG_GROUP	R[0x0011=
e6a0] 0x04 0x06
nouveau 0000:01:00.0: fb: 0x0000dc39[0]: 	R[0x11e6a0] =3D {
nouveau 0000:01:00.0: fb: 0x0000dc39[0]: 		0x0c0c0c0c *
nouveau 0000:01:00.0: fb: 0x0000dc3d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc41[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc45[0]: 		0x06060606
nouveau 0000:01:00.0: fb: 0x0000dc49[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc4d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc51[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc55[0]: 		0x04040404
nouveau 0000:01:00.0: fb: 0x0000dc59[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc5d[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc61[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc65[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc69[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc6d[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc71[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc75[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc79[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dc79[0]: 	R[0x11e6a4] =3D {
nouveau 0000:01:00.0: fb: 0x0000dc79[0]: 		0x0c0c0c0c *
nouveau 0000:01:00.0: fb: 0x0000dc7d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc81[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc85[0]: 		0x06060606
nouveau 0000:01:00.0: fb: 0x0000dc89[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc8d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc91[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dc95[0]: 		0x04040404
nouveau 0000:01:00.0: fb: 0x0000dc99[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dc9d[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dca1[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dca5[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dca9[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dcad[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dcb1[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dcb5[0]: 		0x07070707
nouveau 0000:01:00.0: fb: 0x0000dcb9[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dcb9[0]: 	R[0x11e6a8] =3D {
nouveau 0000:01:00.0: fb: 0x0000dcb9[0]: 		0x08080808 *
nouveau 0000:01:00.0: fb: 0x0000dcbd[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dcc1[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dcc5[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dcc9[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dccd[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dcd1[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dcd5[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dcd9[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dcdd[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dce1[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dce5[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dce9[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dced[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dcf1[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dcf5[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dcf9[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dcf9[0]: 	R[0x11e6ac] =3D {
nouveau 0000:01:00.0: fb: 0x0000dcf9[0]: 		0x08080808 *
nouveau 0000:01:00.0: fb: 0x0000dcfd[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd01[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd05[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dd09[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd0d[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dd11[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd15[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dd19[0]: 		0x0f0f0f0f
nouveau 0000:01:00.0: fb: 0x0000dd1d[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd21[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd25[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd29[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd2d[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd31[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd35[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd39[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dd39[0]: 	R[0x11e6b0] =3D {
nouveau 0000:01:00.0: fb: 0x0000dd39[0]: 		0x0a0a0a0a *
nouveau 0000:01:00.0: fb: 0x0000dd3d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd41[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd45[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000dd49[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd4d[0]: 		0x08080808
nouveau 0000:01:00.0: fb: 0x0000dd51[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd55[0]: 		0x0a0a0a0a
nouveau 0000:01:00.0: fb: 0x0000dd59[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000dd5d[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd61[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd65[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd69[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd6d[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd71[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd75[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dd79[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000dd79[0]: 	R[0x11e6b4] =3D {
nouveau 0000:01:00.0: fb: 0x0000dd79[0]: 		0x100e0e0e *
nouveau 0000:01:00.0: fb: 0x0000dd7d[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd81[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd85[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000dd89[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd8d[0]: 		0x08080808
nouveau 0000:01:00.0: fb: 0x0000dd91[0]: 		0x00000000
nouveau 0000:01:00.0: fb: 0x0000dd95[0]: 		0x0a0a0a0a
nouveau 0000:01:00.0: fb: 0x0000dd99[0]: 		0x05050505
nouveau 0000:01:00.0: fb: 0x0000dd9d[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dda1[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dda5[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000dda9[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000ddad[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000ddb1[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000ddb5[0]: 		0x01010101
nouveau 0000:01:00.0: fb: 0x0000ddb9[0]: 	}
nouveau 0000:01:00.0: fb: 0x0000ddb9[0]: DONE
nouveau 0000:01:00.0: fb: init completed in 4581us
nouveau 0000:01:00.0: ltc: init running...
nouveau 0000:01:00.0: ltc: one-time init running...
nouveau 0000:01:00.0: ltc: one-time init completed in 4us
nouveau 0000:01:00.0: ltc: init completed in 38us
nouveau 0000:01:00.0: mmu: init running...
nouveau 0000:01:00.0: mmu: one-time init running...
nouveau 0000:01:00.0: mmu: one-time init completed in 1us
nouveau 0000:01:00.0: mmu: init completed in 4us
nouveau 0000:01:00.0: bar: init running...
nouveau 0000:01:00.0: bar: one-time init running...
nouveau 0000:01:00.0: imem: new 00001000 00000000 0: 003fdf8000 0000001000
nouveau 0000:01:00.0: imem: new 00010000 00001000 1: 003fde8000 0000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:00000: ref: 0000000000000000 0000000=
002000000 12 8192 PTEs
nouveau 0000:01:00.0: imem: new 00040000 00001000 1: 003fda8000 0000040000
nouveau 0000:01:00.0: mmu: bar2: 00000:xxxxx: PDE write SPT
nouveau 0000:01:00.0: mmu: bar2: 00000:02000: flush: 0
nouveau 0000:01:00.0: mmu: bar2: 00000:00000: bootstrap: 0000000000000000 0=
000000002000000 12 8192 PTEs
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000040000
nouveau 0000:01:00.0: mmu: bar2: 00000:00000: ref + map: 0000000000000000 0=
000000000040000 12 64 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00040: flush: 1
nouveau 0000:01:00.0: imem: new 00001000 00000000 0: 003fda7000 0000001000
nouveau 0000:01:00.0: imem: new 00010000 00001000 1: 003fd97000 0000010000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:00040: ref + map: 0000000000040000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00050: flush: 1
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000001000
nouveau 0000:01:00.0: mmu: bar2: 00000:00050: ref + map: 0000000000050000 0=
000000000001000 12 1 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00051: flush: 1
nouveau 0000:01:00.0: bar: one-time init completed in 4866us
nouveau 0000:01:00.0: bar: init completed in 4872us
nouveau 0000:01:00.0: pmu: init running...
nouveau 0000:01:00.0: pmu: init completed in 135us
nouveau 0000:01:00.0: volt: init running...
nouveau 0000:01:00.0: volt: one-time init running...
nouveau 0000:01:00.0: volt: speedo 6fb
nouveau 0000:01:00.0: volt: one-time init completed in 3us
nouveau 0000:01:00.0: volt: current voltage: 1006250uv
nouveau 0000:01:00.0: volt: init completed in 10us
nouveau 0000:01:00.0: iccsense: init running...
nouveau 0000:01:00.0: iccsense: one-time init running...
nouveau 0000:01:00.0: iccsense: one-time init completed in 2us
nouveau 0000:01:00.0: iccsense: init completed in 6us
nouveau 0000:01:00.0: therm: init running...
nouveau 0000:01:00.0: therm: one-time init running...
nouveau 0000:01:00.0: i2c: bus 0002: probing monitoring devices
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: 40ms delay instead of 10ms
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: 40ms delay instead of 10ms
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: 40ms delay instead of 10ms
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: acquire
nouveau 0000:01:00.0: i2c: pad 0102: acquire
nouveau 0000:01:00.0: i2c: pad 0102: -> i2c
nouveau 0000:01:00.0: i2c: bus 0002: release
nouveau 0000:01:00.0: i2c: pad 0102: release
nouveau 0000:01:00.0: i2c: pad 0102: -> off
nouveau 0000:01:00.0: i2c: bus 0002: no devices found.
nouveau 0000:01:00.0: therm: FAN control: PWM
nouveau 0000:01:00.0: therm: fan management: automatic
nouveau 0000:01:00.0: therm: FAN target request: 30%
nouveau 0000:01:00.0: therm: FAN target: 30
nouveau 0000:01:00.0: therm: FAN update: 33
nouveau 0000:01:00.0: therm: internal sensor: yes
nouveau 0000:01:00.0: therm: one-time init completed in 639468us
nouveau 0000:01:00.0: therm: programmed thresholds [ 90(3), 95(3), 105(5), =
135(5) ]
nouveau 0000:01:00.0: therm: init completed in 659495us
nouveau 0000:01:00.0: clk: init running...
nouveau 0000:01:00.0: clk: 00:      27000 KHz
nouveau 0000:01:00.0: clk: 01:     100000 KHz
nouveau 0000:01:00.0: clk: 13:     810000 KHz
nouveau 0000:01:00.0: clk: 17:     810000 KHz
nouveau 0000:01:00.0: clk: 14:      27000 KHz
nouveau 0000:01:00.0: clk: 12:     405000 KHz
nouveau 0000:01:00.0: clk: 16:     810000 KHz
nouveau 0000:01:00.0: clk: 15:     648000 KHz
nouveau 0000:01:00.0: clk: 1b:    1620000 KHz
nouveau 0000:01:00.0: clk: 19:     324000 KHz
nouveau 0000:01:00.0: clk: --: core 405 MHz memory 810 MHz=20
nouveau 0000:01:00.0: clk: P -1 PWR 1 U(AC) -1 U(DC) -1 A 1 T 90=C2=B0C D 0
nouveau 0000:01:00.0: clk: -> -1
nouveau 0000:01:00.0: clk: init completed in 89us
nouveau 0000:01:00.0: ce0: init skipped, no users
nouveau 0000:01:00.0: ce2: init skipped, no users
nouveau 0000:01:00.0: disp: init skipped, no users
nouveau 0000:01:00.0: dma: init skipped, no users
nouveau 0000:01:00.0: fifo: init skipped, no users
nouveau 0000:01:00.0: gr: init skipped, no users
nouveau 0000:01:00.0: nvdec0: init skipped, no users
nouveau 0000:01:00.0: nvenc0: init skipped, no users
nouveau 0000:01:00.0: sw: init skipped, no users
nouveau 0000:01:00.0: init completed in 669453us
nouveau: drm:00000000:00000080: init children...
nouveau: drm:00000000:00000080: init completed in 670028us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 136
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner 00
nouveau: drm:00000000:00000080: ioctl: mthd size 112
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000080: ioctl: device mthd 00000000
nouveau: drm:00000000:00000080: ioctl: device info size 104
nouveau: drm:00000000:00000080: ioctl: device info vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201b360=
70 owner 00
nouveau: drm:00000000:00000080: ioctl: map size 24
nouveau: drm:00000000:00000080: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b360=
70 owner 00
nouveau: drm:00000000:00000080: ioctl: sclass size 8
nouveau: drm:00000000:00000080: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b360=
70 owner 00
nouveau: drm:00000000:00000080: ioctl: sclass size 72
nouveau: drm:00000000:00000080: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 62
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b360=
70 owner 00
nouveau: drm:00000000:00000080: ioctl: new size 38
nouveau: drm:00000000:00000080: ioctl: new vers 0 handle 00000000 class 800=
09009 object ffff976201b36160
nouveau: drm:00000000:80009009: init running...
nouveau: drm:00000000:80009009: init children...
nouveau: drm:00000000:80009009: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: sclass size 8
nouveau: drm:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: sclass size 24
nouveau: drm:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 24
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 24
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 19
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 292
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b361=
60 owner ff
nouveau: drm:00000000:80009009: ioctl: mthd size 268
nouveau: drm:00000000:80009009: ioctl: mthd vers 0 mthd 02
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object 00000000000000=
00 owner 00
nouveau: drm:00000000:00000000: ioctl: new size 72
nouveau: drm:00000000:00000000: ioctl: new vers 0 handle 00000000 class 000=
00000 object ffff976201b361c0
nouveau: drm:00000000:00000000: init running...
nouveau: drm:00000000:00000000: init children...
nouveau: drm:00000000:00000000: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object 00000000000000=
00 owner 00
nouveau: drm:00000000:00000000: ioctl: new size 32
nouveau: drm:00000000:00000000: ioctl: new vers 0 handle 00000000 class 000=
00080 object ffff976201b36228
nouveau: DRM:00000000:00000080: init running...
nouveau: DRM:00000000:00000080: init children...
nouveau: DRM:00000000:00000080: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 136
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: mthd size 112
nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 00
nouveau: DRM:00000000:00000080: ioctl: device mthd 00000000
nouveau: DRM:00000000:00000080: ioctl: device info size 104
nouveau: DRM:00000000:00000080: ioctl: device info vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 62
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: new size 38
nouveau: DRM:00000000:00000080: ioctl: new vers 0 handle 00000000 class 800=
09009 object ffff976201b36318
nouveau: DRM:00000000:80009009: init running...
nouveau: DRM:00000000:80009009: init children...
nouveau: DRM:00000000:80009009: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: sclass size 8
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: sclass size 24
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 24
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 24
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 19
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 292
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: mthd size 268
nouveau: DRM:00000000:80009009: ioctl: mthd vers 0 mthd 02
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: sclass size 8
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: sclass size 24
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900d object ffff976201b36380
nouveau 0000:01:00.0: imem: new 00010000 00001000 1: 003fd87000 0000010000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:00051: ref + map: 0000000000051000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00061: flush: 1
nouveau: DRM:00000000:8000900d: init running...
nouveau: DRM:00000000:8000900d: init children...
nouveau: DRM:00000000:8000900d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner d7
nouveau: DRM:00000000:8000900d: ioctl: mthd size 16
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner d7
nouveau: DRM:00000000:8000900d: ioctl: mthd size 16
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner ff
nouveau: DRM:00000000:80009009: ioctl: sclass size 8
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: sclass size 24
nouveau: DRM:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: drm: VRAM: 1024 MiB
nouveau 0000:01:00.0: drm: GART: 1048576 MiB
nouveau 0000:01:00.0: drm: TMDS table version 2.0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: mthd size 48
nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 00
nouveau: DRM:00000000:00000080: ioctl: device mthd 00000000
nouveau: DRM:00000000:00000080: ioctl: device info size 40
nouveau: DRM:00000000:00000080: ioctl: device info vers 1 count 2
nouveau 0000:01:00.0: fifo: one-time init running...
nouveau 0000:01:00.0: fifo:000003: engn 3.0[sec2] not found
nouveau 0000:01:00.0: fifo:000000: chan:000000
nouveau 0000:01:00.0: fifo:000000:15[      sw]:=20
nouveau 0000:01:00.0: fifo:000000:00[      gr]:=20
nouveau 0000:01:00.0: fifo:000000:05[     ce2]:=20
nouveau 0000:01:00.0: fifo:000004: chan:000000
nouveau 0000:01:00.0: fifo:000004:04[     ce0]:=20
nouveau 0000:01:00.0: fifo:000001: chan:000000
nouveau 0000:01:00.0: fifo:000001:01[  nvdec0]:=20
nouveau 0000:01:00.0: fifo:000003: chan:000000
nouveau 0000:01:00.0: fifo:000002: chan:000000
nouveau 0000:01:00.0: fifo:000002:02[  nvenc0]:=20
nouveau 0000:01:00.0: mc: intr 0/00000100 requested by fifo
nouveau 0000:01:00.0: imem: new 00100000 00000000 1: 003fc87000 0000100000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000100000
nouveau 0000:01:00.0: mmu: bar2: 00000:00061: ref + map: 0000000000061000 0=
000000000100000 12 256 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00161: flush: 1
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000100000
nouveau 0000:01:00.0: mmu: bar1: 00000:00000: ref + map: 0000000000000000 0=
000000000100000 12 256 PTEs
nouveau 0000:01:00.0: imem: new 00040000 00001000 1: 003fc47000 0000040000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000040000
nouveau 0000:01:00.0: mmu: bar2: 00000:00161: ref + map: 0000000000161000 0=
000000000040000 12 64 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:001a1: flush: 1
nouveau 0000:01:00.0: mmu: bar1: 00000:xxxxx: PDE write SPT
nouveau 0000:01:00.0: mmu: bar1: 00000:00100: flush: 0
nouveau 0000:01:00.0: fifo: one-time init completed in 344us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 8
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 72
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 82
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 58
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200c0ec60
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 51
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200c0ec=
60 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 27
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000008000
nouveau 0000:01:00.0: mmu: bar1: 00000:00100: ref + map: 0000000000100000 0=
000000000008000 12 8 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00108: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 1080
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b362=
28 owner c1
nouveau: DRM:00000000:00000080: ioctl: mthd size 1056
nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 00
nouveau: DRM:00000000:00000080: ioctl: device mthd 00000000
nouveau: DRM:00000000:00000080: ioctl: device info size 1048
nouveau: DRM:00000000:00000080: ioctl: device info vers 1 count 65
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 8
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 72
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 104
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 80
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200c0ed60
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner 00
nouveau: DRM:00000000:8000900d: ioctl: mthd size 32
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 01
nouveau 0000:01:00.0: mmu: user: getref 0 mapref 0 sparse 0 shift: 12 align=
: 0 size: 0000000000012000
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 77
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner 00
nouveau: DRM:00000000:8000900d: ioctl: mthd size 53
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 03
nouveau 0000:01:00.0: mmu: user: 00000:00001: ref + map: 0000000000001000 0=
000000000012000 12 18 PTEs
nouveau 0000:01:00.0: imem: new 00040000 00001000 1: 003fc07000 0000040000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000040000
nouveau 0000:01:00.0: mmu: bar2: 00000:001a1: ref + map: 00000000001a1000 0=
000000000040000 12 64 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:001e1: flush: 1
nouveau 0000:01:00.0: mmu: user: 00000:xxxxx: PDE write SPT
nouveau 0000:01:00.0: mmu: user: 00000:00013: flush: 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 160
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: new size 136
nouveau: DRM:00000000:00000080: ioctl: new vers 0 handle 00000000 class 000=
0a16f object ffff97620091da38
nouveau 0000:01:00.0: fifo: init running...
nouveau 0000:01:00.0: fifo: init completed in 2us
nouveau 0000:01:00.0: imem: new 00001000 00001000 1: 003fc06000 0000001000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000001000
nouveau 0000:01:00.0: mmu: bar2: 00000:001e1: ref + map: 00000000001e1000 0=
000000000001000 12 1 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:001e2: flush: 1
nouveau: DRM:00000000:0000a16f: init running...
nouveau 0000:01:00.0: fifo:000000:0000:0000: allow 1
nouveau 0000:01:00.0: fifo:000000:0000:0000: insert
nouveau 0000:01:00.0: fifo:000000: RAMRL: update cgrps:1 chans:1
nouveau 0000:01:00.0: imem: new 00010000 00000000 0: 003fbf6000 0000010000
nouveau 0000:01:00.0: fifo:000000: RAMRL: update start:00000000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:001e2: ref + map: 00000000001e2000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:001f2: flush: 1
nouveau 0000:01:00.0: fifo:000000:0000:0000: RAMRL+00000000: [swapper/0[1]]
nouveau 0000:01:00.0: fifo:000000: RAMRL: commit start:00000000 count:1
nouveau: DRM:00000000:0000a16f: init children...
nouveau: DRM:00000000:0000a16f: init completed in 41us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: map size 24
nouveau: DRM:00000000:0000a16f: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 66
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 42
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 00000000 class 800=
0000e object ffff97620091daa8
nouveau 0000:01:00.0: fifo: event: ntfy add 00000000 on 1 wait:0
nouveau: DRM:00000000:8000000e: init running...
nouveau: DRM:00000000:8000000e: init children...
nouveau: DRM:00000000:8000000e: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091da=
a8 owner ff
nouveau: DRM:00000000:8000000e: ioctl: mthd size 8
nouveau: DRM:00000000:8000000e: ioctl: mthd vers 0 mthd 00
nouveau 0000:01:00.0: fifo: event: ntfy allow 00000001 on 0
nouveau 0000:01:00.0: fifo: event: ntfy state changed
nouveau 0000:01:00.0: fifo: event: incr 00000001 on 0
nouveau 0000:01:00.0: fifo: event: allowing 0 on 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 66
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 42
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 00000000 class 800=
0000e object ffff976200c0ef98
nouveau 0000:01:00.0: fifo: event: ntfy add 00000000 on 1 wait:0
nouveau: DRM:00000000:8000000e: init running...
nouveau: DRM:00000000:8000000e: init children...
nouveau: DRM:00000000:8000000e: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner ff
nouveau: DRM:00000000:8000900d: ioctl: mthd size 32
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 01
nouveau 0000:01:00.0: mmu: user: getref 0 mapref 0 sparse 0 shift: 12 align=
: 0 size: 0000000000008000
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 77
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner 00
nouveau: DRM:00000000:8000900d: ioctl: mthd size 53
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 03
nouveau 0000:01:00.0: mmu: user: 00000:00013: ref + map: 0000000000013000 0=
000000000008000 12 8 PTEs
nouveau 0000:01:00.0: mmu: user: 00000:0001b: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 8
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 72
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 104
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 80
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200bebb60
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner 00
nouveau: DRM:00000000:8000900d: ioctl: mthd size 32
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 01
nouveau 0000:01:00.0: mmu: user: getref 0 mapref 0 sparse 0 shift: 12 align=
: 0 size: 0000000000012000
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 77
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b363=
80 owner 00
nouveau: DRM:00000000:8000900d: ioctl: mthd size 53
nouveau: DRM:00000000:8000900d: ioctl: mthd vers 0 mthd 03
nouveau 0000:01:00.0: mmu: user: 00000:0001b: ref + map: 000000000001b000 0=
000000000012000 12 18 PTEs
nouveau 0000:01:00.0: mmu: user: 00000:0002d: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 160
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: new size 136
nouveau: DRM:00000000:00000080: ioctl: new vers 0 handle 00000000 class 000=
0a16f object ffff97620091e238
nouveau 0000:01:00.0: imem: new 00001000 00001000 1: 003fbf5000 0000001000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000001000
nouveau 0000:01:00.0: mmu: bar2: 00000:001f2: ref + map: 00000000001f2000 0=
000000000001000 12 1 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:001f3: flush: 1
nouveau: DRM:00000000:0000a16f: init running...
nouveau 0000:01:00.0: fifo:000004:0001:0001: allow 1
nouveau 0000:01:00.0: fifo:000004:0001:0001: insert
nouveau 0000:01:00.0: fifo:000004: RAMRL: update cgrps:1 chans:1
nouveau 0000:01:00.0: imem: new 00010000 00000000 0: 003fbe5000 0000010000
nouveau 0000:01:00.0: fifo:000004: RAMRL: update start:00000000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:001f3: ref + map: 00000000001f3000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00203: flush: 1
nouveau 0000:01:00.0: fifo:000004:0001:0001: RAMRL+00000000: [swapper/0[1]]
nouveau 0000:01:00.0: fifo:000004: RAMRL: commit start:00000000 count:1
nouveau: DRM:00000000:0000a16f: init children...
nouveau: DRM:00000000:0000a16f: init completed in 38us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: map size 24
nouveau: DRM:00000000:0000a16f: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 66
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 42
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 00000001 class 800=
0000e object ffff97620091e2a8
nouveau 0000:01:00.0: fifo: event: ntfy add 00000001 on 1 wait:0
nouveau: DRM:00000001:8000000e: init running...
nouveau: DRM:00000001:8000000e: init children...
nouveau: DRM:00000001:8000000e: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091e2=
a8 owner ff
nouveau: DRM:00000001:8000000e: ioctl: mthd size 8
nouveau: DRM:00000001:8000000e: ioctl: mthd vers 0 mthd 00
nouveau 0000:01:00.0: fifo: event: ntfy allow 00000001 on 1
nouveau 0000:01:00.0: fifo: event: ntfy state changed
nouveau 0000:01:00.0: fifo: event: incr 00000001 on 1
nouveau 0000:01:00.0: fifo: event: allowing 0 on 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 66
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 42
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 00040001 class 800=
0000e object ffff976200c17198
nouveau 0000:01:00.0: fifo: event: ntfy add 00000004 on 1 wait:0
nouveau: DRM:00040001:8000000e: init running...
nouveau: DRM:00040001:8000000e: init children...
nouveau: DRM:00040001:8000000e: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c7b5 class 000=
0c7b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c7b5 class 000=
0c7b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c6b5 class 000=
0c6b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c6b5 class 000=
0c6b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c5b5 class 000=
0c5b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c5b5 class 000=
0c5b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c3b5 class 000=
0c3b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c3b5 class 000=
0c3b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c1b5 class 000=
0c1b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c1b5 class 000=
0c1b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004c0b5 class 000=
0c0b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091da=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0000c0b5 class 000=
0c0b5 object ffff976201b36db8
nouveau: drm:00000000:00000000: ioctl: return -22
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620091e2=
38 owner 00
nouveau: DRM:00000000:0000a16f: ioctl: new size 32
nouveau: DRM:00000000:0000a16f: ioctl: new vers 0 handle 0004b0b5 class 000=
0b0b5 object ffff976201b36db8
nouveau 0000:01:00.0: ce0: init running...
nouveau 0000:01:00.0: ce0: one-time init running...
nouveau 0000:01:00.0: ce0: one-time init completed in 0us
nouveau 0000:01:00.0: ce0: init completed in 4us
nouveau 0000:01:00.0: fifo:000004:0001: ctor ectx 4[ce0]
nouveau 0000:01:00.0: fifo:000004:0001: ctor vctx 4[ce0]
nouveau 0000:01:00.0: fifo:000004:0001:0001: ctor cctx 4[ce0]
nouveau: DRM:0004b0b5:0000b0b5: init running...
nouveau: DRM:0004b0b5:0000b0b5: init children...
nouveau: DRM:0004b0b5:0000b0b5: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 8
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: sclass size 72
nouveau: DRM:00000000:00000080: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b362=
28 owner 00
nouveau: DRM:00000000:00000080: ioctl: new size 48
nouveau: DRM:00000000:00000080: ioctl: new vers 0 handle 00000000 class 000=
09470 object ffff976200c14ce0
nouveau 0000:01:00.0: disp: init running...
nouveau 0000:01:00.0: disp: one-time init running...
nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
nouveau 0000:01:00.0: disp: head-0: ctor
nouveau 0000:01:00.0: disp: head-1: ctor
nouveau 0000:01:00.0: disp: head-2: ctor
nouveau 0000:01:00.0: disp: head-3: ctor
nouveau 0000:01:00.0: disp:    DAC(s): 4 (02)
nouveau 0000:01:00.0: disp: DAC-1: ctor
nouveau 0000:01:00.0: disp:    SOR(s): 8 (0f)
nouveau 0000:01:00.0: disp: SOR-0: ctor
nouveau 0000:01:00.0: disp: SOR-1: ctor
nouveau 0000:01:00.0: disp: SOR-2: ctor
nouveau 0000:01:00.0: disp: SOR-3: ctor
nouveau 0000:01:00.0: imem: new 00010000 00010000 0: 003fbd0000 0000010000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:00203: ref + map: 0000000000203000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00213: flush: 1
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: type 00 loc 0 or 2 link 0 co=
n 0 edid 0 bus 0 head f
nouveau 0000:01:00.0: disp: outp 01:0002:0fc1: type 02 loc 0 or 1 link 3 co=
n 1 edid 1 bus 1 head f
nouveau 0000:01:00.0: disp: outp 02:0002:0f42: type 02 loc 0 or 2 link 1 co=
n 2 edid 6 bus 2 head f
nouveau 0000:01:00.0: disp: conn 00:0000: type 00 loc 0 hpd 00 dp 0 di 0 sr=
 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 01:0131: type 31 loc 1 hpd 04 dp 0 di 0 sr=
 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 02:0261: type 61 loc 2 hpd 08 dp 0 di 0 sr=
 0 lcdid 0
nouveau 0000:01:00.0: disp: one-time init completed in 93us
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: no heads (0 0 0)
nouveau 0000:01:00.0: disp: outp 01:0002:0fc1: on SOR-0 link 1
nouveau 0000:01:00.0: disp: outp 02:0002:0f42: no heads (0 3 2)
nouveau 0000:01:00.0: disp: init completed in 173us
nouveau: DRM:00000000:00009470: init running...
nouveau: DRM:00000000:00009470: init children...
nouveau: DRM:00000000:00009470: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 82
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 58
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200c17260
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 51
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200c172=
60 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 27
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000001000
nouveau 0000:01:00.0: mmu: bar1: 00000:00108: ref + map: 0000000000108000 0=
000000000001000 12 1 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00109: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b16a58
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b16a=
58 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0947d object ffff976200b16a08
nouveau: DRM:00000000:0000947d: init running...
nouveau: DRM:00000000:0000947d: init children...
nouveau: DRM:00000000:0000947d: init completed in 98us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b16a=
08 owner 00
nouveau: DRM:00000000:0000947d: ioctl: map size 24
nouveau: DRM:00000000:0000947d: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b16a=
08 owner 00
nouveau: DRM:00000000:0000947d: ioctl: new size 56
nouveau: DRM:00000000:0000947d: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976200b16ac8
nouveau 0000:01:00.0: dma: init running...
nouveau 0000:01:00.0: dma: one-time init running...
nouveau 0000:01:00.0: dma: one-time init completed in 0us
nouveau 0000:01:00.0: dma: init completed in 3us
nouveau: DRM:00000000:0000947d: ioctl: create dma size 24
nouveau: DRM:00000000:0000947d: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000947d: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b16a=
08 owner 00
nouveau: DRM:00000000:0000947d: ioctl: new size 56
nouveau: DRM:00000000:0000947d: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976200b16b00
nouveau: DRM:00000000:0000947d: ioctl: create dma size 24
nouveau: DRM:00000000:0000947d: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000947d: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 800=
00012 object ffff97620091eca0
nouveau: DRM:00000000:80000012: init running...
nouveau: DRM:00000000:80000012: init children...
nouveau: DRM:00000000:80000012: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 65
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 41
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 800=
00011 object ffff976201b30878
nouveau: DRM:00000000:80000011: init running...
nouveau: DRM:00000000:80000011: init children...
nouveau: DRM:00000000:80000011: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b308=
78 owner 00
nouveau: DRM:00000000:80000011: ioctl: new size 48
nouveau: DRM:00000000:80000011: ioctl: new vers 0 handle 00000000 class 800=
0000e object ffff976201b308c0
nouveau: drm:00000000:00000000: ioctl: return -38
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000001 class 800=
00012 object ffff97620091f0a0
nouveau: DRM:00000001:80000012: init running...
nouveau: DRM:00000001:80000012: init children...
nouveau: DRM:00000001:80000012: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 65
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 41
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000001 class 800=
00011 object ffff97620029a878
nouveau: DRM:00000001:80000011: init running...
nouveau: DRM:00000001:80000011: init children...
nouveau: DRM:00000001:80000011: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620029a8=
78 owner 00
nouveau: DRM:00000001:80000011: ioctl: new size 48
nouveau: DRM:00000001:80000011: ioctl: new vers 0 handle 00000001 class 800=
0000e object ffff97620029a8c0
nouveau 0000:01:00.0: gpio: event: ntfy add 0000000e on 3 wait:1
nouveau: DRM:00000001:8000000e: init running...
nouveau: DRM:00000001:8000000e: init children...
nouveau: DRM:00000001:8000000e: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000002 class 800=
00012 object ffff97620091f4a0
nouveau: DRM:00000002:80000012: init running...
nouveau: DRM:00000002:80000012: init children...
nouveau: DRM:00000002:80000012: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 65
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 41
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000002 class 800=
00011 object ffff97620029e878
nouveau: DRM:00000002:80000011: init running...
nouveau: DRM:00000002:80000011: init children...
nouveau: DRM:00000002:80000011: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff97620029e8=
78 owner 00
nouveau: DRM:00000002:80000011: ioctl: new size 48
nouveau: DRM:00000002:80000011: ioctl: new vers 0 handle 00000002 class 800=
0000e object ffff97620029e8c0
nouveau 0000:01:00.0: gpio: event: ntfy add 0000000f on 3 wait:1
nouveau: DRM:00000002:8000000e: init running...
nouveau: DRM:00000002:8000000e: init children...
nouveau: DRM:00000002:8000000e: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9d580
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9d5=
80 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00109: ref + map: 0000000000109000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0010c: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9d5d0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9d5=
d0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0010c: ref + map: 000000000010c000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0010f: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9d670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9d6=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0927c object ffff976200b9d620
nouveau: DRM:00000000:0000927c: init running...
nouveau: DRM:00000000:0000927c: init children...
nouveau: DRM:00000000:0000927c: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9d6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: map size 24
nouveau: DRM:00000000:0000927c: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b9d6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976200b9d6e0
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b9d6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976200b9d718
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9e670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9e6=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917e object ffff976200b9e620
nouveau: DRM:00000000:0000917e: init running...
nouveau: DRM:00000000:0000917e: init children...
nouveau: DRM:00000000:0000917e: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9e6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: map size 24
nouveau: DRM:00000000:0000917e: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b9e6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976200b9e6e0
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b9e6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976200b9e718
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917b object ffff976200b9e760
nouveau: DRM:00000000:0000917b: init running...
nouveau: DRM:00000000:0000917b: init children...
nouveau: DRM:00000000:0000917b: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9e7=
60 owner 00
nouveau: DRM:00000000:0000917b: ioctl: map size 24
nouveau: DRM:00000000:0000917b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917a object ffff976200b9f760
nouveau: DRM:00000000:0000917a: init running...
nouveau: DRM:00000000:0000917a: init children...
nouveau: DRM:00000000:0000917a: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9f7=
60 owner 00
nouveau: DRM:00000000:0000917a: ioctl: map size 24
nouveau: DRM:00000000:0000917a: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9c770
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9c7=
70 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0010f: ref + map: 000000000010f000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00112: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976200b9c7c0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976200b9c7=
c0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00112: ref + map: 0000000000112000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00115: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 40
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 800=
00013 object ffff976200b9c678
nouveau: DRM:00000000:80000013: init running...
nouveau: DRM:00000000:80000013: init children...
nouveau: DRM:00000000:80000013: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200b9c6=
78 owner 00
nouveau: DRM:00000000:80000013: ioctl: new size 40
nouveau: DRM:00000000:80000013: ioctl: new vers 0 handle 00000000 class 800=
0000e object ffff976200b9c6b8
nouveau 0000:01:00.0: disp: event: ntfy add 00000000 on 1 wait:0
nouveau: DRM:00000000:8000000e: init running...
nouveau: DRM:00000000:8000000e: init children...
nouveau: DRM:00000000:8000000e: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ac9580
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac95=
80 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00115: ref + map: 0000000000115000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00118: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ac95d0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac95=
d0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00118: ref + map: 0000000000118000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0011b: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ac9670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac96=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0927c object ffff976201ac9620
nouveau: DRM:00000000:0000927c: init running...
nouveau: DRM:00000000:0000927c: init children...
nouveau: DRM:00000000:0000927c: init completed in 8us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac96=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: map size 24
nouveau: DRM:00000000:0000927c: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ac96=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201ac96e0
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ac96=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201ac9718
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201aca670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201aca6=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917e object ffff976201aca620
nouveau: DRM:00000000:0000917e: init running...
nouveau: DRM:00000000:0000917e: init children...
nouveau: DRM:00000000:0000917e: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201aca6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: map size 24
nouveau: DRM:00000000:0000917e: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201aca6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201aca6e0
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201aca6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201aca718
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917b object ffff976201aca760
nouveau: DRM:00000000:0000917b: init running...
nouveau: DRM:00000000:0000917b: init children...
nouveau: DRM:00000000:0000917b: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201aca7=
60 owner 00
nouveau: DRM:00000000:0000917b: ioctl: map size 24
nouveau: DRM:00000000:0000917b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917a object ffff976201acb760
nouveau: DRM:00000000:0000917a: init running...
nouveau: DRM:00000000:0000917a: init children...
nouveau: DRM:00000000:0000917a: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acb7=
60 owner 00
nouveau: DRM:00000000:0000917a: ioctl: map size 24
nouveau: DRM:00000000:0000917a: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ac8770
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac87=
70 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0011b: ref + map: 000000000011b000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0011e: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ac87c0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ac87=
c0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0011e: ref + map: 000000000011e000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00121: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 40
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000001 class 800=
00013 object ffff976201ac8678
nouveau: DRM:00000001:80000013: init running...
nouveau: DRM:00000001:80000013: init children...
nouveau: DRM:00000001:80000013: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ac86=
78 owner 00
nouveau: DRM:00000001:80000013: ioctl: new size 40
nouveau: DRM:00000001:80000013: ioctl: new vers 0 handle 00000001 class 800=
0000e object ffff976201ac86b8
nouveau 0000:01:00.0: disp: event: ntfy add 00000001 on 1 wait:0
nouveau: DRM:00000001:8000000e: init running...
nouveau: DRM:00000001:8000000e: init children...
nouveau: DRM:00000001:8000000e: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201acd580
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acd5=
80 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00121: ref + map: 0000000000121000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00124: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201acd5d0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acd5=
d0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00124: ref + map: 0000000000124000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00127: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201acd670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acd6=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0927c object ffff976201acd620
nouveau: DRM:00000000:0000927c: init running...
nouveau: DRM:00000000:0000927c: init children...
nouveau: DRM:00000000:0000927c: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acd6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: map size 24
nouveau: DRM:00000000:0000927c: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201acd6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201acd6e0
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201acd6=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201acd718
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ace670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ace6=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917e object ffff976201ace620
nouveau: DRM:00000000:0000917e: init running...
nouveau: DRM:00000000:0000917e: init children...
nouveau: DRM:00000000:0000917e: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ace6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: map size 24
nouveau: DRM:00000000:0000917e: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ace6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201ace6e0
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ace6=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201ace718
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917b object ffff976201ace760
nouveau: DRM:00000000:0000917b: init running...
nouveau: DRM:00000000:0000917b: init children...
nouveau: DRM:00000000:0000917b: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ace7=
60 owner 00
nouveau: DRM:00000000:0000917b: ioctl: map size 24
nouveau: DRM:00000000:0000917b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917a object ffff976201acf760
nouveau: DRM:00000000:0000917a: init running...
nouveau: DRM:00000000:0000917a: init children...
nouveau: DRM:00000000:0000917a: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acf7=
60 owner 00
nouveau: DRM:00000000:0000917a: ioctl: map size 24
nouveau: DRM:00000000:0000917a: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201acc770
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acc7=
70 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00127: ref + map: 0000000000127000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0012a: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201acc7c0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201acc7=
c0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0012a: ref + map: 000000000012a000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:0012d: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 40
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000002 class 800=
00013 object ffff976201acc678
nouveau: DRM:00000002:80000013: init running...
nouveau: DRM:00000002:80000013: init children...
nouveau: DRM:00000002:80000013: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201acc6=
78 owner 00
nouveau: DRM:00000002:80000013: ioctl: new size 40
nouveau: DRM:00000002:80000013: ioctl: new vers 0 handle 00000002 class 800=
0000e object ffff976201acc6b8
nouveau 0000:01:00.0: disp: event: ntfy add 00000002 on 1 wait:0
nouveau: DRM:00000002:8000000e: init running...
nouveau: DRM:00000002:8000000e: init children...
nouveau: DRM:00000002:8000000e: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad1580
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad15=
80 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:0012d: ref + map: 000000000012d000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00130: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad15d0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad15=
d0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00130: ref + map: 0000000000130000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00133: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad1670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad16=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0927c object ffff976201ad1620
nouveau: DRM:00000000:0000927c: init running...
nouveau: DRM:00000000:0000927c: init children...
nouveau: DRM:00000000:0000927c: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad16=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: map size 24
nouveau: DRM:00000000:0000927c: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ad16=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201ad16e0
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ad16=
20 owner 00
nouveau: DRM:00000000:0000927c: ioctl: new size 56
nouveau: DRM:00000000:0000927c: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201ad1718
nouveau: DRM:00000000:0000927c: ioctl: create dma size 24
nouveau: DRM:00000000:0000927c: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000927c: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b361=
60 owner 00
nouveau: drm:00000000:80009009: ioctl: new size 56
nouveau: drm:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad2670
nouveau: drm:00000000:8000900b: init running...
nouveau: drm:00000000:8000900b: init children...
nouveau: drm:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad26=
70 owner 00
nouveau: drm:00000000:8000900b: ioctl: map size 24
nouveau: drm:00000000:8000900b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917e object ffff976201ad2620
nouveau: DRM:00000000:0000917e: init running...
nouveau: DRM:00000000:0000917e: init children...
nouveau: DRM:00000000:0000917e: init completed in 6us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad26=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: map size 24
nouveau: DRM:00000000:0000917e: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ad26=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000000 class 000=
0003d object ffff976201ad26e0
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000048000 limit 0000000000048fff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000000:0000003d: init running...
nouveau: DRM:f0000000:0000003d: init children...
nouveau: DRM:f0000000:0000003d: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ad26=
20 owner 00
nouveau: DRM:00000000:0000917e: ioctl: new size 56
nouveau: DRM:00000000:0000917e: ioctl: new vers 0 handle f0000001 class 000=
0003d object ffff976201ad2718
nouveau: DRM:00000000:0000917e: ioctl: create dma size 24
nouveau: DRM:00000000:0000917e: ioctl: create dma vers 0 target 1 access 3 =
start 0000000000000000 limit 000000003fffffff
nouveau: DRM:00000000:0000917e: ioctl: create gf119 dma size 0
nouveau: DRM:f0000001:0000003d: init running...
nouveau: DRM:f0000001:0000003d: init children...
nouveau: DRM:f0000001:0000003d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917b object ffff976201ad2760
nouveau: DRM:00000000:0000917b: init running...
nouveau: DRM:00000000:0000917b: init children...
nouveau: DRM:00000000:0000917b: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad27=
60 owner 00
nouveau: DRM:00000000:0000917b: ioctl: map size 24
nouveau: DRM:00000000:0000917b: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 8
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: sclass size 72
nouveau: DRM:00000000:00009470: ioctl: sclass vers 0 count 8
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 72
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 48
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000000 class 000=
0917a object ffff976201ad3760
nouveau: DRM:00000000:0000917a: init running...
nouveau: DRM:00000000:0000917a: init children...
nouveau: DRM:00000000:0000917a: init completed in 3us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad37=
60 owner 00
nouveau: DRM:00000000:0000917a: ioctl: map size 24
nouveau: DRM:00000000:0000917a: ioctl: map vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad0770
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad07=
70 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00133: ref + map: 0000000000133000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00136: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201b363=
18 owner 00
nouveau: DRM:00000000:80009009: ioctl: new size 56
nouveau: DRM:00000000:80009009: ioctl: new vers 0 handle 00000000 class 800=
0900b object ffff976201ad07c0
nouveau: DRM:00000000:8000900b: init running...
nouveau: DRM:00000000:8000900b: init children...
nouveau: DRM:00000000:8000900b: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 07 object ffff976201ad07=
c0 owner 00
nouveau: DRM:00000000:8000900b: ioctl: map size 24
nouveau: DRM:00000000:8000900b: ioctl: map vers 0
nouveau 0000:01:00.0: mmu: bar1: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000003000
nouveau 0000:01:00.0: mmu: bar1: 00000:00136: ref + map: 0000000000136000 0=
000000000003000 12 3 PTEs
nouveau 0000:01:00.0: mmu: bar1: 00000:00139: flush: 1
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976200c14c=
e0 owner 00
nouveau: DRM:00000000:00009470: ioctl: new size 40
nouveau: DRM:00000000:00009470: ioctl: new vers 0 handle 00000003 class 800=
00013 object ffff976201ad0678
nouveau: DRM:00000003:80000013: init running...
nouveau: DRM:00000003:80000013: init children...
nouveau: DRM:00000003:80000013: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 64
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201ad06=
78 owner 00
nouveau: DRM:00000003:80000013: ioctl: new size 40
nouveau: DRM:00000003:80000013: ioctl: new vers 0 handle 00000003 class 800=
0000e object ffff976201ad06b8
nouveau 0000:01:00.0: disp: event: ntfy add 00000003 on 1 wait:0
nouveau: DRM:00000003:8000000e: init running...
nouveau: DRM:00000003:8000000e: init children...
nouveau: DRM:00000003:8000000e: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620029a8=
c0 owner ff
nouveau: DRM:00000001:8000000e: ioctl: mthd size 8
nouveau: DRM:00000001:8000000e: ioctl: mthd vers 0 mthd 00
nouveau 0000:01:00.0: gpio: event: ntfy allow 00000003 on 14
nouveau 0000:01:00.0: gpio: event: ntfy state changed
nouveau 0000:01:00.0: gpio: event: incr 00000003 on 14
nouveau 0000:01:00.0: gpio: event: allowing 0 on 14
nouveau 0000:01:00.0: gpio: event: allowing 1 on 14
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620029e8=
c0 owner ff
nouveau: DRM:00000002:8000000e: ioctl: mthd size 8
nouveau: DRM:00000002:8000000e: ioctl: mthd vers 0 mthd 00
nouveau 0000:01:00.0: gpio: event: ntfy allow 00000003 on 15
nouveau 0000:01:00.0: gpio: event: ntfy state changed
nouveau 0000:01:00.0: gpio: event: incr 00000003 on 15
nouveau 0000:01:00.0: gpio: event: allowing 0 on 15
nouveau 0000:01:00.0: gpio: event: allowing 1 on 15
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 38
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 14
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 10
nouveau: drm:00000000:00000000: ioctl: return -19
nouveau: drm:00000000:00000000: ioctl: size 38
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f0=
a0 owner ff
nouveau: DRM:00000001:80000012: ioctl: mthd size 14
nouveau: DRM:00000001:80000012: ioctl: mthd vers 0 mthd 10
nouveau 0000:01:00.0: disp: outp 01:0002:0fc1: inherit 00 |=3D 02 000000002=
754001d
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 38
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f4=
a0 owner ff
nouveau: DRM:00000002:80000012: ioctl: mthd size 14
nouveau: DRM:00000002:80000012: ioctl: mthd vers 0 mthd 10
nouveau: drm:00000000:00000000: ioctl: return -19
[drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
nouveau: drm:00000000:00000000: ioctl: size 96
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object 00000000000000=
00 owner 65
nouveau: drm:00000000:00000000: ioctl: new size 72
nouveau: drm:00000000:00000000: ioctl: new vers 0 handle 00000000 class 000=
00000 object ffff976201af8800
nouveau: drm:00000000:00000000: init running...
nouveau: drm:00000000:00000000: init children...
nouveau: drm:00000000:00000000: init completed in 1us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 56
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object 00000000000000=
00 owner 65
nouveau: drm:00000000:00000000: ioctl: new size 32
nouveau: drm:00000000:00000000: ioctl: new vers 0 handle 00000000 class 000=
00080 object ffff976201af8868
nouveau: swapper/0[1]:00000000:00000080: init running...
nouveau: swapper/0[1]:00000000:00000080: init children...
nouveau: swapper/0[1]:00000000:00000080: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 136
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af88=
68 owner 00
nouveau: swapper/0[1]:00000000:00000080: ioctl: mthd size 112
nouveau: swapper/0[1]:00000000:00000080: ioctl: mthd vers 0 mthd 00
nouveau: swapper/0[1]:00000000:00000080: ioctl: device mthd 00000000
nouveau: swapper/0[1]:00000000:00000080: ioctl: device info size 104
nouveau: swapper/0[1]:00000000:00000080: ioctl: device info vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 62
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201af88=
68 owner 65
nouveau: swapper/0[1]:00000000:00000080: ioctl: new size 38
nouveau: swapper/0[1]:00000000:00000080: ioctl: new vers 0 handle 00000000 =
class 80009009 object ffff976201af8958
nouveau: swapper/0[1]:00000000:80009009: init running...
nouveau: swapper/0[1]:00000000:80009009: init children...
nouveau: swapper/0[1]:00000000:80009009: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner 00
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 8
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner 65
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 24
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 24
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 24
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 43
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 19
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 292
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
58 owner 00
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd size 268
nouveau: swapper/0[1]:00000000:80009009: ioctl: mthd vers 0 mthd 02
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 8
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner 65
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 24
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 80
nouveau: drm:00000000:00000000: ioctl: vers 0 type 02 object ffff976201af89=
58 owner 65
nouveau: swapper/0[1]:00000000:80009009: ioctl: new size 56
nouveau: swapper/0[1]:00000000:80009009: ioctl: new vers 0 handle 00000000 =
class 8000900d object ffff976201af89c0
nouveau 0000:01:00.0: imem: new 00010000 00001000 1: 003fbc0000 0000010000
nouveau 0000:01:00.0: mmu: bar2: getref 0 mapref 1 sparse 0 shift: 12 align=
: 0 size: 0000000000010000
nouveau 0000:01:00.0: mmu: bar2: 00000:00213: ref + map: 0000000000213000 0=
000000000010000 12 16 PTEs
nouveau 0000:01:00.0: mmu: bar2: 00000:00223: flush: 1
nouveau: swapper/0[1]:00000000:8000900d: init running...
nouveau: swapper/0[1]:00000000:8000900d: init children...
nouveau: swapper/0[1]:00000000:8000900d: init completed in 2us
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
c0 owner d7
nouveau: swapper/0[1]:00000000:8000900d: ioctl: mthd size 16
nouveau: swapper/0[1]:00000000:8000900d: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201af89=
c0 owner d7
nouveau: swapper/0[1]:00000000:8000900d: ioctl: mthd size 16
nouveau: swapper/0[1]:00000000:8000900d: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner ff
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 8
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 01 object ffff976201af89=
58 owner 00
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass size 24
nouveau: swapper/0[1]:00000000:80009009: ioctl: sclass vers 0 count 2
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 16
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 20
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: acquire 00 |=3D 01 000000000=
0000000
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: release 01 &=3D fffffffe 000=
000002162270c
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f0=
a0 owner ff
nouveau: DRM:00000001:80000012: ioctl: mthd size 10
nouveau: DRM:00000001:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f4=
a0 owner ff
nouveau: DRM:00000002:80000012: ioctl: mthd size 10
nouveau: DRM:00000002:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0006: acquire
nouveau 0000:01:00.0: i2c: pad 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0000: -> i2c
nouveau 0000:01:00.0: i2c: bus 0006: release
nouveau 0000:01:00.0: i2c: pad 0000: release
nouveau 0000:01:00.0: i2c: pad 0000: -> off
nouveau 0000:01:00.0: drm: DDC responded, but no EDID for HDMI-A-1
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 1
nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 2
nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 3
nouveau 0000:01:00.0: disp: supervisor 1
nouveau 0000:01:00.0: disp: head-0: 00011100
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
nouveau 0000:01:00.0: disp: Core:
nouveau 0000:01:00.0: disp: 	0080: 00000000             =20
nouveau 0000:01:00.0: disp: 	0084: 00000000 -> 80000000
nouveau 0000:01:00.0: disp: 	0088: 00000000 -> f0000000
nouveau 0000:01:00.0: disp: Core - DAC 0:
nouveau 0000:01:00.0: disp: 	0180: 00000000             =20
nouveau 0000:01:00.0: disp: 	0184: 00000000             =20
nouveau 0000:01:00.0: disp: 	0188: 00000000             =20
nouveau 0000:01:00.0: disp: 	0190: 00000000             =20
nouveau 0000:01:00.0: disp: Core - DAC 1:
nouveau 0000:01:00.0: disp: 	01a0: 00000000             =20
nouveau 0000:01:00.0: disp: 	01a4: 00000000             =20
nouveau 0000:01:00.0: disp: 	01a8: 00000000             =20
nouveau 0000:01:00.0: disp: 	01b0: 00000000             =20
nouveau 0000:01:00.0: disp: Core - DAC 2:
nouveau 0000:01:00.0: disp: 	01c0: 00000000             =20
nouveau 0000:01:00.0: disp: 	01c4: 00000000             =20
nouveau 0000:01:00.0: disp: 	01c8: 00000000             =20
nouveau 0000:01:00.0: disp: 	01d0: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 0:
nouveau 0000:01:00.0: disp: 	0200: 00000101 -> 00000000
nouveau 0000:01:00.0: disp: 	0204: 00000000             =20
nouveau 0000:01:00.0: disp: 	0208: 00000000             =20
nouveau 0000:01:00.0: disp: 	0210: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 1:
nouveau 0000:01:00.0: disp: 	0220: 00000000             =20
nouveau 0000:01:00.0: disp: 	0224: 00000000             =20
nouveau 0000:01:00.0: disp: 	0228: 00000000             =20
nouveau 0000:01:00.0: disp: 	0230: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 2:
nouveau 0000:01:00.0: disp: 	0240: 00000000             =20
nouveau 0000:01:00.0: disp: 	0244: 00000000             =20
nouveau 0000:01:00.0: disp: 	0248: 00000000             =20
nouveau 0000:01:00.0: disp: 	0250: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 3:
nouveau 0000:01:00.0: disp: 	0260: 00000000             =20
nouveau 0000:01:00.0: disp: 	0264: 00000000             =20
nouveau 0000:01:00.0: disp: 	0268: 00000000             =20
nouveau 0000:01:00.0: disp: 	0270: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 4:
nouveau 0000:01:00.0: disp: 	0280: 00000000             =20
nouveau 0000:01:00.0: disp: 	0284: 00000000             =20
nouveau 0000:01:00.0: disp: 	0288: 00000000             =20
nouveau 0000:01:00.0: disp: 	0290: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 5:
nouveau 0000:01:00.0: disp: 	02a0: 00000000             =20
nouveau 0000:01:00.0: disp: 	02a4: 00000000             =20
nouveau 0000:01:00.0: disp: 	02a8: 00000000             =20
nouveau 0000:01:00.0: disp: 	02b0: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 6:
nouveau 0000:01:00.0: disp: 	02c0: 00000000             =20
nouveau 0000:01:00.0: disp: 	02c4: 00000000             =20
nouveau 0000:01:00.0: disp: 	02c8: 00000000             =20
nouveau 0000:01:00.0: disp: 	02d0: 00000000             =20
nouveau 0000:01:00.0: disp: Core - SOR 7:
nouveau 0000:01:00.0: disp: 	02e0: 00000000             =20
nouveau 0000:01:00.0: disp: 	02e4: 00000000             =20
nouveau 0000:01:00.0: disp: 	02e8: 00000000             =20
nouveau 0000:01:00.0: disp: 	02f0: 00000000             =20
nouveau 0000:01:00.0: disp: Core - PIOR 0:
nouveau 0000:01:00.0: disp: 	0300: 00000000             =20
nouveau 0000:01:00.0: disp: 	0304: 00000000             =20
nouveau 0000:01:00.0: disp: 	0308: 00000000             =20
nouveau 0000:01:00.0: disp: 	0310: 00000000             =20
nouveau 0000:01:00.0: disp: Core - PIOR 1:
nouveau 0000:01:00.0: disp: 	0320: 00000000             =20
nouveau 0000:01:00.0: disp: 	0324: 00000000             =20
nouveau 0000:01:00.0: disp: 	0328: 00000000             =20
nouveau 0000:01:00.0: disp: 	0330: 00000000             =20
nouveau 0000:01:00.0: disp: Core - PIOR 2:
nouveau 0000:01:00.0: disp: 	0340: 00000000             =20
nouveau 0000:01:00.0: disp: 	0344: 00000000             =20
nouveau 0000:01:00.0: disp: 	0348: 00000000             =20
nouveau 0000:01:00.0: disp: 	0350: 00000000             =20
nouveau 0000:01:00.0: disp: Core - PIOR 3:
nouveau 0000:01:00.0: disp: 	0360: 00000000             =20
nouveau 0000:01:00.0: disp: 	0364: 00000000             =20
nouveau 0000:01:00.0: disp: 	0368: 00000000             =20
nouveau 0000:01:00.0: disp: 	0370: 00000000             =20
nouveau 0000:01:00.0: disp: Core - HEAD 0:
nouveau 0000:01:00.0: disp: 	0400: 00000000             =20
nouveau 0000:01:00.0: disp: 	0404: 00000008 -> 00000000
nouveau 0000:01:00.0: disp: 	0408: 21ec4000             =20
nouveau 0000:01:00.0: disp: 	040c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0410: 00000000             =20
nouveau 0000:01:00.0: disp: 	0414: 03a60770 -> 00050008
nouveau 0000:01:00.0: disp: 	0418: 00050097 -> 00000001
nouveau 0000:01:00.0: disp: 	041c: 001e017f -> 00010003
nouveau 0000:01:00.0: disp: 	0420: 03a2071f -> 00030004
nouveau 0000:01:00.0: disp: 	0424: 01f10575 -> 00000001
nouveau 0000:01:00.0: disp: 	0428: 00000000             =20
nouveau 0000:01:00.0: disp: 	042c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0430: ffffff40             =20
nouveau 0000:01:00.0: disp: 	0434: 00000000             =20
nouveau 0000:01:00.0: disp: 	0438: 00000000             =20
nouveau 0000:01:00.0: disp: 	0440: 00000000             =20
nouveau 0000:01:00.0: disp: 	0444: 00000000             =20
nouveau 0000:01:00.0: disp: 	0448: 00000000             =20
nouveau 0000:01:00.0: disp: 	044c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0450: 06590fa0 -> 00000000
nouveau 0000:01:00.0: disp: 	0454: 01200000 -> 00000000
nouveau 0000:01:00.0: disp: 	0458: 00000000             =20
nouveau 0000:01:00.0: disp: 	045c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0460: 00000000             =20
nouveau 0000:01:00.0: disp: 	0468: 00000000             =20
nouveau 0000:01:00.0: disp: 	046c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0470: 0000e900             =20
nouveau 0000:01:00.0: disp: 	0474: 00000000             =20
nouveau 0000:01:00.0: disp: 	047c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0480: 20000000             =20
nouveau 0000:01:00.0: disp: 	0484: 00000000             =20
nouveau 0000:01:00.0: disp: 	0488: 00000000             =20
nouveau 0000:01:00.0: disp: 	048c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0490: 00000000             =20
nouveau 0000:01:00.0: disp: 	0494: 00000000             =20
nouveau 0000:01:00.0: disp: 	0498: 00040000             =20
nouveau 0000:01:00.0: disp: 	04a0: 00000000             =20
nouveau 0000:01:00.0: disp: 	04b0: 00000000             =20
nouveau 0000:01:00.0: disp: 	04b8: 00000000             =20
nouveau 0000:01:00.0: disp: 	04bc: 00000000             =20
nouveau 0000:01:00.0: disp: 	04c0: 038405a0 -> 00000000
nouveau 0000:01:00.0: disp: 	04c4: 00000000             =20
nouveau 0000:01:00.0: disp: 	04c8: 00000000             =20
nouveau 0000:01:00.0: disp: 	04d0: 00110300             =20
nouveau 0000:01:00.0: disp: 	04d4: 00001100             =20
nouveau 0000:01:00.0: disp: 	04e0: 00000000             =20
nouveau 0000:01:00.0: disp: 	04e4: 00000000             =20
nouveau 0000:01:00.0: disp: 	04e8: 00000000             =20
nouveau 0000:01:00.0: disp: 	04ec: 00000000             =20
nouveau 0000:01:00.0: disp: 	04f0: 00010000             =20
nouveau 0000:01:00.0: disp: 	04f4: 00000000             =20
nouveau 0000:01:00.0: disp: 	04f8: 00000000             =20
nouveau 0000:01:00.0: disp: 	04fc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0500: 00000000             =20
nouveau 0000:01:00.0: disp: 	0504: 00010000             =20
nouveau 0000:01:00.0: disp: 	0508: 00000000             =20
nouveau 0000:01:00.0: disp: 	050c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0510: 00000000             =20
nouveau 0000:01:00.0: disp: 	0514: 00000000             =20
nouveau 0000:01:00.0: disp: 	0518: 00010000             =20
nouveau 0000:01:00.0: disp: 	051c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0520: 00000000             =20
nouveau 0000:01:00.0: disp: 	0524: 00000000             =20
nouveau 0000:01:00.0: disp: 	052c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0530: 00000000             =20
nouveau 0000:01:00.0: disp: 	054c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0550: 00000000             =20
nouveau 0000:01:00.0: disp: 	0554: 00000000             =20
nouveau 0000:01:00.0: disp: 	0558: 00000000             =20
nouveau 0000:01:00.0: disp: 	055c: 00000002             =20
nouveau 0000:01:00.0: disp: Core - HEAD 1:
nouveau 0000:01:00.0: disp: 	0700: 00000000             =20
nouveau 0000:01:00.0: disp: 	0704: 00000000             =20
nouveau 0000:01:00.0: disp: 	0708: 21ec4000             =20
nouveau 0000:01:00.0: disp: 	070c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0710: 00000000             =20
nouveau 0000:01:00.0: disp: 	0714: 00050008             =20
nouveau 0000:01:00.0: disp: 	0718: 00000001             =20
nouveau 0000:01:00.0: disp: 	071c: 00010003             =20
nouveau 0000:01:00.0: disp: 	0720: 00030004             =20
nouveau 0000:01:00.0: disp: 	0724: 00000001             =20
nouveau 0000:01:00.0: disp: 	0728: 00000000             =20
nouveau 0000:01:00.0: disp: 	072c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0730: ffffff40             =20
nouveau 0000:01:00.0: disp: 	0734: 00000000             =20
nouveau 0000:01:00.0: disp: 	0738: 00000000             =20
nouveau 0000:01:00.0: disp: 	0740: 00000000             =20
nouveau 0000:01:00.0: disp: 	0744: 00000000             =20
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau 0000:01:00.0: disp: 	0748: 00000000             =20
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau 0000:01:00.0: disp: 	074c: 00000000             =20
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau 0000:01:00.0: disp: 	0750: 00000000             =20
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau 0000:01:00.0: disp: 	0754: 00000000             =20
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau 0000:01:00.0: disp: 	0758: 00000000             =20
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau 0000:01:00.0: disp: 	075c: 00000000             =20
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: disp: 	0760: 00000000             =20
nouveau 0000:01:00.0: disp: 	0768: 00000000             =20
nouveau 0000:01:00.0: disp: 	076c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0770: 0000e900             =20
nouveau 0000:01:00.0: disp: 	0774: 00000000             =20
nouveau 0000:01:00.0: disp: 	077c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0780: 20000000             =20
nouveau 0000:01:00.0: disp: 	0784: 00000000             =20
nouveau 0000:01:00.0: disp: 	0788: 00000000             =20
nouveau 0000:01:00.0: disp: 	078c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0790: 00000000             =20
nouveau 0000:01:00.0: disp: 	0794: 00000000             =20
nouveau 0000:01:00.0: disp: 	0798: 00040000             =20
nouveau 0000:01:00.0: disp: 	07a0: 00000000             =20
nouveau 0000:01:00.0: disp: 	07b0: 00000000             =20
nouveau 0000:01:00.0: disp: 	07b8: 00000000             =20
nouveau 0000:01:00.0: disp: 	07bc: 00000000             =20
nouveau 0000:01:00.0: disp: 	07c0: 00000000             =20
nouveau 0000:01:00.0: disp: 	07c4: 00000000             =20
nouveau 0000:01:00.0: disp: 	07c8: 00000000             =20
nouveau 0000:01:00.0: disp: 	07d0: 00110300             =20
nouveau 0000:01:00.0: disp: 	07d4: 00001100             =20
nouveau 0000:01:00.0: disp: 	07e0: 00000000             =20
nouveau 0000:01:00.0: disp: 	07e4: 00000000             =20
nouveau 0000:01:00.0: disp: 	07e8: 00000000             =20
nouveau 0000:01:00.0: disp: 	07ec: 00000000             =20
nouveau 0000:01:00.0: disp: 	07f0: 00010000             =20
nouveau 0000:01:00.0: disp: 	07f4: 00000000             =20
nouveau 0000:01:00.0: disp: 	07f8: 00000000             =20
nouveau 0000:01:00.0: disp: 	07fc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0800: 00000000             =20
nouveau 0000:01:00.0: disp: 	0804: 00010000             =20
nouveau 0000:01:00.0: disp: 	0808: 00000000             =20
nouveau 0000:01:00.0: disp: 	080c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0810: 00000000             =20
nouveau 0000:01:00.0: disp: 	0814: 00000000             =20
nouveau 0000:01:00.0: disp: 	0818: 00010000             =20
nouveau 0000:01:00.0: disp: 	081c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0820: 00000000             =20
nouveau 0000:01:00.0: disp: 	0824: 00000000             =20
nouveau 0000:01:00.0: disp: 	082c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0830: 00000000             =20
nouveau 0000:01:00.0: disp: 	084c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0850: 00000000             =20
nouveau 0000:01:00.0: disp: 	0854: 00000000             =20
nouveau 0000:01:00.0: disp: 	0858: 00000000             =20
nouveau 0000:01:00.0: disp: 	085c: 00000001             =20
nouveau 0000:01:00.0: disp: Core - HEAD 2:
nouveau 0000:01:00.0: disp: 	0a00: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a04: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a08: 21ec4000             =20
nouveau 0000:01:00.0: disp: 	0a0c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a10: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a14: 00050008             =20
nouveau 0000:01:00.0: disp: 	0a18: 00000001             =20
nouveau 0000:01:00.0: disp: 	0a1c: 00010003             =20
nouveau 0000:01:00.0: disp: 	0a20: 00030004             =20
nouveau 0000:01:00.0: disp: 	0a24: 00000001             =20
nouveau 0000:01:00.0: disp: 	0a28: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a2c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a30: ffffff40             =20
nouveau 0000:01:00.0: disp: 	0a34: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a38: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a40: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a44: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a48: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a4c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a50: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a54: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a58: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a5c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a60: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a68: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a6c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a70: 0000e900             =20
nouveau 0000:01:00.0: disp: 	0a74: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a7c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a80: 20000000             =20
nouveau 0000:01:00.0: disp: 	0a84: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a88: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a8c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a90: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a94: 00000000             =20
nouveau 0000:01:00.0: disp: 	0a98: 00040000             =20
nouveau 0000:01:00.0: disp: 	0aa0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ab0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ab8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0abc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ac0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ac4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ac8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ad0: 00110300             =20
nouveau 0000:01:00.0: disp: 	0ad4: 00001100             =20
nouveau 0000:01:00.0: disp: 	0ae0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ae4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0ae8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0aec: 00000000             =20
nouveau 0000:01:00.0: disp: 	0af0: 00010000             =20
nouveau 0000:01:00.0: disp: 	0af4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0af8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0afc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b00: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b04: 00010000             =20
nouveau 0000:01:00.0: disp: 	0b08: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b0c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b10: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b14: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b18: 00010000             =20
nouveau 0000:01:00.0: disp: 	0b1c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b20: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b24: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b2c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b30: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b4c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b50: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b54: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b58: 00000000             =20
nouveau 0000:01:00.0: disp: 	0b5c: 00000001             =20
nouveau 0000:01:00.0: disp: Core - HEAD 3:
nouveau 0000:01:00.0: disp: 	0d00: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d04: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d08: 21ec4000             =20
nouveau 0000:01:00.0: disp: 	0d0c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d10: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d14: 00050008             =20
nouveau 0000:01:00.0: disp: 	0d18: 00000001             =20
nouveau 0000:01:00.0: disp: 	0d1c: 00010003             =20
nouveau 0000:01:00.0: disp: 	0d20: 00030004             =20
nouveau 0000:01:00.0: disp: 	0d24: 00000001             =20
nouveau 0000:01:00.0: disp: 	0d28: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d2c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d30: ffffff40             =20
nouveau 0000:01:00.0: disp: 	0d34: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d38: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d40: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d44: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d48: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d4c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d50: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d54: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d58: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d5c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d60: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d68: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d6c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d70: 0000e900             =20
nouveau 0000:01:00.0: disp: 	0d74: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d7c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d80: 20000000             =20
nouveau 0000:01:00.0: disp: 	0d84: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d88: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d8c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d90: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d94: 00000000             =20
nouveau 0000:01:00.0: disp: 	0d98: 00040000             =20
nouveau 0000:01:00.0: disp: 	0da0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0db0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0db8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dbc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dc0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dc4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dc8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dd0: 00110300             =20
nouveau 0000:01:00.0: disp: 	0dd4: 00001100             =20
nouveau 0000:01:00.0: disp: 	0de0: 00000000             =20
nouveau 0000:01:00.0: disp: 	0de4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0de8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dec: 00000000             =20
nouveau 0000:01:00.0: disp: 	0df0: 00010000             =20
nouveau 0000:01:00.0: disp: 	0df4: 00000000             =20
nouveau 0000:01:00.0: disp: 	0df8: 00000000             =20
nouveau 0000:01:00.0: disp: 	0dfc: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e00: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e04: 00010000             =20
nouveau 0000:01:00.0: disp: 	0e08: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e0c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e10: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e14: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e18: 00010000             =20
nouveau 0000:01:00.0: disp: 	0e1c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e20: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e24: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e2c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e30: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e4c: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e50: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e54: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e58: 00000000             =20
nouveau 0000:01:00.0: disp: 	0e5c: 00000001             =20
nouveau 0000:01:00.0: disp: head-0: supervisor 1.0
nouveau 0000:01:00.0: disp: head-0: on SOR-0
nouveau 0000:01:00.0: disp: 0x000059a8[0]: DONE
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
nouveau 0000:01:00.0: disp: supervisor 2
nouveau 0000:01:00.0: disp: head-0: 00011100
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
nouveau 0000:01:00.0: disp: head-0: supervisor 2.0
nouveau 0000:01:00.0: disp: head-0: on SOR-0
nouveau 0000:01:00.0: disp: 0x000059a9[0]: NV_REG	R[0x4061c00c] &=3D 0xffff=
fffe |=3D 0x00000001
nouveau 0000:01:00.0: disp: 0x000059b6[0]: NV_REG	R[0x4061c014] &=3D 0xff3f=
ffff |=3D 0x00c00000
nouveau 0000:01:00.0: disp: 0x000059c3[0]: DONE
nouveau 0000:01:00.0: disp: head-0: supervisor 2.1 - 0 khz
nouveau 0000:01:00.0: disp: head-0: supervisor 2.2
nouveau 0000:01:00.0: disp: head-0: nothing to attach
nouveau 0000:01:00.0: disp: supervisor 3
nouveau 0000:01:00.0: disp: head-0: 00011100
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
nouveau 0000:01:00.0: disp: head-0: supervisor 3.0
nouveau 0000:01:00.0: disp: head-0: nothing to attach
nouveau: drm:00000000:00000000: ioctl: size 48
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff976201b360=
70 owner ff
nouveau: drm:00000000:00000080: ioctl: mthd size 24
nouveau: drm:00000000:00000080: ioctl: mthd vers 0 mthd 01
nouveau: drm:00000000:00000080: ioctl: device mthd 00000001
nouveau: drm:00000000:00000080: ioctl: device time size 16
nouveau: drm:00000000:00000080: ioctl: device time vers 0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 32
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f0=
a0 owner 00
nouveau: DRM:00000001:80000012: ioctl: mthd size 8
nouveau: DRM:00000001:80000012: ioctl: mthd vers 0 mthd 12
nouveau 0000:01:00.0: disp: outp 01:0002:0fc1: release 02 &=3D fffffffd 000=
000002754001d
nouveau 0000:01:00.0: disp: outp 01:0002:0fc1: release SOR-0
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
loop: module loaded
ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042F conflict=
s with OpRegion 0x0000000000000400-0x000000000000047F (\PMIO) (20240827/uta=
ddress-204)
ACPI: OSL: Resource conflict; ACPI support missing from driver?
ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054F conflict=
s with OpRegion 0x0000000000000500-0x000000000000057F (\_SB.PCI0.LPCB.GPBX)=
 (20240827/utaddress-204)
ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054F conflict=
s with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20240827/uta=
ddress-204)
ACPI: OSL: Resource conflict; ACPI support missing from driver?
ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053F conflict=
s with OpRegion 0x0000000000000500-0x000000000000057F (\_SB.PCI0.LPCB.GPBX)=
 (20240827/utaddress-204)
ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053F conflict=
s with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20240827/uta=
ddress-204)
ACPI: OSL: Resource conflict; ACPI support missing from driver?
ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052F conflict=
s with OpRegion 0x0000000000000500-0x000000000000057F (\_SB.PCI0.LPCB.GPBX)=
 (20240827/utaddress-204)
ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052F conflict=
s with OpRegion 0x0000000000000500-0x000000000000050F (\_GPE.GPIO) (2024082=
7/utaddress-204)
ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052F conflict=
s with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20240827/uta=
ddress-204)
ACPI: OSL: Resource conflict; ACPI support missing from driver?
lpc_ich: Resource conflict(s) found affecting gpio_ich
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 16
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 20
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: acquire 00 |=3D 01 000000000=
0000000
ahci 0000:00:1f.2: version 3.0
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: release 01 &=3D fffffffe 000=
000002162270c
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f0=
a0 owner ff
nouveau: DRM:00000001:80000012: ioctl: mthd size 10
nouveau: DRM:00000001:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f4=
a0 owner ff
nouveau: DRM:00000002:80000012: ioctl: mthd size 10
nouveau: DRM:00000002:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0006: acquire
nouveau 0000:01:00.0: i2c: pad 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0000: -> i2c
ahci 0000:00:1f.2: AHCI vers 0001.0300, 32 command slots, 6 Gbps, SATA mode
ahci 0000:00:1f.2: 3/6 ports implemented (port mask 0x7)
ahci 0000:00:1f.2: flags: 64bit ncq led clo pio slum part ems apst=20
nouveau 0000:01:00.0: i2c: bus 0006: release
nouveau 0000:01:00.0: i2c: pad 0000: release
nouveau 0000:01:00.0: i2c: pad 0000: -> off
nouveau 0000:01:00.0: drm: DDC responded, but no EDID for HDMI-A-1
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau: drm:00000000:00000000: ioctl: size 40
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 16
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 20
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: acquire 00 |=3D 01 000000000=
0000000
scsi host0: ahci
scsi host1: ahci
scsi host2: ahci
scsi host3: ahci
scsi host4: ahci
scsi host5: ahci
ata1: SATA max UDMA/133 abar m2048@0xf7306000 port 0xf7306100 irq 27 lpm-po=
l 3
ata2: SATA max UDMA/133 abar m2048@0xf7306000 port 0xf7306180 irq 27 lpm-po=
l 3
ata3: SATA max UDMA/133 abar m2048@0xf7306000 port 0xf7306200 irq 27 lpm-po=
l 3
ata4: DUMMY
ata5: DUMMY
ata6: DUMMY
r8169 0000:06:00.0: can't disable ASPM; OS doesn't have ASPM control
nouveau 0000:01:00.0: disp: outp 00:0000:0f02: release 01 &=3D fffffffe 000=
000002162270c
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f0=
a0 owner ff
nouveau: DRM:00000001:80000012: ioctl: mthd size 10
nouveau: DRM:00000001:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091f4=
a0 owner ff
nouveau: DRM:00000002:80000012: ioctl: mthd size 10
nouveau: DRM:00000002:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0006: acquire
nouveau 0000:01:00.0: i2c: pad 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0000: -> i2c
nouveau 0000:01:00.0: i2c: bus 0006: release
nouveau 0000:01:00.0: i2c: pad 0000: release
nouveau 0000:01:00.0: i2c: pad 0000: -> off
nouveau 0000:01:00.0: drm: DDC responded, but no EDID for HDMI-A-1
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
r8169 0000:06:00.0 eth0: RTL8168e/8111e, f4:6d:04:d2:62:8e, XID 2c2, IRQ 28
r8169 0000:06:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksummin=
g: ko]
rt2800pci 0000:03:00.0: enabling device (0100 -> 0102)
ieee80211 phy0: rt2x00_set_rt: Info - RT chipset 2872, rev 0202 detected
ieee80211 phy0: rt2x00_set_rf: Info - RF chipset 0003 detected
ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
xhci_hcd 0000:07:00.0: xHCI Host Controller
xhci_hcd 0000:07:00.0: new USB bus registered, assigned bus number 1
xhci_hcd 0000:07:00.0: hcc params 0x0200f180 hci version 0x96 quirks 0x0000=
000000080010
xhci_hcd 0000:07:00.0: xHCI Host Controller
xhci_hcd 0000:07:00.0: new USB bus registered, assigned bus number 2
ehci-pci 0000:00:1a.0: EHCI Host Controller
xhci_hcd 0000:07:00.0: Host supports USB 3.0 SuperSpeed
ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 3
ehci-pci 0000:00:1a.0: debug port 2
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
usbcore: registered new interface driver uas
usbcore: registered new interface driver usb-storage
i8042: PNP: No PS/2 controller found.
i8042: Probing ports directly.
ehci-pci 0000:00:1a.0: irq 23, io mem 0xf7308000
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
input: PC Speaker as /devices/platform/pcspkr/input/input2
rtc_cmos 00:02: RTC can wake from S4
rtc_cmos 00:02: registered as rtc0
rtc_cmos 00:02: setting system clock to 2025-12-15T18:11:55 UTC (1765822315)
rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
i2c_dev: i2c /dev entries driver
i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
iTCO_wdt iTCO_wdt.0.auto: Found a Cougar Point TCO device (Version=3D2, TCO=
BASE=3D0x0460)
iTCO_wdt iTCO_wdt.0.auto: initialized. heartbeat=3D30 sec (nowayout=3D0)
intel_pstate: Intel P-state driver initializing
Relocating firmware framebuffer to offset 0x0000000001000000[d] within [mem=
 0xf0000000-0xf1ffffff flags 0x14220c]
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
i2c i2c-12: Successfully instantiated SPD at 0x51
snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
snd_hda_intel 0000:01:00.1: Disabling MSI
NET: Registered PF_INET6 protocol family
i2c i2c-12: Successfully instantiated SPD at 0x53
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
NET: Registered PF_PACKET protocol family
ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
microcode: Current revision: 0x00000028
IPI shorthand broadcast: enabled
AES CTR mode by8 optimization enabled
sched_clock: Marking stable (1303229805, 270948)->(1314889164, -11388411)
Loading compiled-in X.509 certificates
Btrfs loaded, zoned=3Dno, fsverity=3Dno
cfg80211: Loading compiled-in X.509 certificates for regulatory database
ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ehci-pci 0000:00:1d.0: EHCI Host Controller
ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 4
ehci-pci 0000:00:1d.0: debug port 2
ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7307000
snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC887-VD: line_outs=3D4 =
(0x14/0x15/0x16/0x17/0x0) type:line
snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
snd_hda_codec_realtek hdaudioC0D0:    dig-out=3D0x11/0x1e
snd_hda_codec_realtek hdaudioC0D0:    inputs:
snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=3D0x18
snd_hda_codec_realtek hdaudioC0D0:      Front Mic=3D0x19
snd_hda_codec_realtek hdaudioC0D0:      Line=3D0x1a
snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops 0xffffffffb2535af0)
input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/0000:00:01.0/0000:=
01:00.1/sound/card1/input4
input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/0000:00:01.0/0000:=
01:00.1/sound/card1/input5
input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/0000:00:01.0/0000:=
01:00.1/sound/card1/input6
input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/0000:00:01.0/0000:=
01:00.1/sound/card1/input7
ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/car=
d0/input8
input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/i=
nput9
input: HDA Intel PCH Line Out Front as /devices/pci0000:00/0000:00:1b.0/sou=
nd/card0/input10
input: HDA Intel PCH Line Out Surround as /devices/pci0000:00/0000:00:1b.0/=
sound/card0/input11
input: HDA Intel PCH Line Out CLFE as /devices/pci0000:00/0000:00:1b.0/soun=
d/card0/input12
input: HDA Intel PCH Line Out Side as /devices/pci0000:00/0000:00:1b.0/soun=
d/card0/input13
tsc: Refined TSC clocksource calibration: 3010.131 MHz
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b63a7ce1bd, max_i=
dle_ns: 440795222940 ns
clocksource: Switched to clocksource tsc
Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
ALSA device list:
  #0: HDA Intel PCH at 0xf7300000 irq 34
  #1: HDA NVidia at 0xf7080000 irq 17
ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT1._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT1._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata2.00: supports DRM functions and may not be fully accessible
ata2.00: ATA-10: CT500MX500SSD1, M3CR023, max UDMA/133
ata2.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT0._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT0._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata1.00: ATA-8: WDC WD5000AAKX-00U6AA0, 15.01H15, max UDMA/133
ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 32), AA
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT2._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT2._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata3.00: ATAPI: ATAPI   DVD A  DH16AASH, SA15, max UDMA/100
ata2.00: Features: Trust Dev-Sleep
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT1._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT1._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata2.00: supports DRM functions and may not be fully accessible
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT2._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT2._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata3.00: configured for UDMA/100
ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.SAT0.SPT0._GTF.D=
SSP], AE_NOT_FOUND (20240827/psargs-332)
ACPI Error: Aborting method \_SB.PCI0.SAT0.SPT0._GTF due to previous error =
(AE_NOT_FOUND) (20240827/psparse-529)
ata1.00: configured for UDMA/133
ata2.00: configured for UDMA/133
scsi 0:0:0:0: Direct-Access     ATA      WDC WD5000AAKX-0 1H15 PQ: 0 ANSI: 5
sd 0:0:0:0: Attached scsi generic sg0 type 0
sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
scsi 1:0:0:0: Direct-Access     ATA      CT500MX500SSD1   023  PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
sd 1:0:0:0: Attached scsi generic sg1 type 0
sd 1:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
sd 1:0:0:0: [sdb] 4096-byte physical blocks
sd 1:0:0:0: [sdb] Write Protect is off
sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
scsi 2:0:0:0: CD-ROM            ATAPI    DVD A  DH16AASH  SA15 PQ: 0 ANSI: 5
usb 3-1: new high-speed USB device number 2 using ehci-pci
 sdb: sdb1 sdb2 sdb3
sd 1:0:0:0: [sdb] Attached SCSI disk
sr 2:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cd=
da tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 2:0:0:0: Attached scsi CD-ROM sr0
sr 2:0:0:0: Attached scsi generic sg2 type 5
 sda: sda1 sda2 sda3 sda4
sd 0:0:0:0: [sda] Attached SCSI disk
Freeing unused kernel image (initmem) memory: 1356K
Write protecting the kernel read-only data: 18432k
Freeing unused kernel image (rodata/data gap) memory: 568K
Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=3D/
    TERM=3Dlinux
usb 4-1: new high-speed USB device number 2 using ehci-pci
hub 3-1:1.0: USB hub found
hub 3-1:1.0: 6 ports detected
hub 4-1:1.0: USB hub found
hub 4-1:1.0: 8 ports detected
Successfully made /usr/ read-only.
systemd 257.10 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA =
+IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID -CURL +ELFUTILS -=
FIDO2 +IDN2 -IDN -IPTC -KMOD -LIBCRYPTSETUP -LIBCRYPTSETUP_PLUGINS +LIBFDIS=
K +PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 +LZ4 -XZ -ZLIB +ZSTD -BP=
F_FRAMEWORK -BTF -XKBCOMMON +UTMP -SYSVINIT +LIBARCHIVE)
Detected architecture x86-64.
Running in initrd.
Queued start job for default target Initrd Default Target.
Created slice Slice /system/systemd-fsck.
Started Dispatch Password Requests to Console Directory Watch.
Expecting device /dev/disk/by-uuid/655D-13A2...
Expecting device /dev/disk/by-uuid/b7fcf10a-962f-4491-accc-d775612ad6d0...
Expecting device /dev/gpt-auto-root...
Reached target Initrd /usr File System.
Reached target Path Units.
Reached target Slice Units.
Reached target Swaps.
Reached target Timer Units.
Listening on Journal Socket (/dev/log).
Listening on Journal Sockets.
Listening on udev Control Socket.
Listening on udev Kernel Socket.
Reached target Socket Units.
Starting Journal Service...
Starting Apply Kernel Variables...
Starting Create Static Device Nodes in /dev gracefully...
Starting Virtual Console Setup...
Finished Apply Kernel Variables.
Finished Virtual Console Setup.
Starting dracut ask for additional cmdline parameters...
Finished Create Static Device Nodes in /dev gracefully.
Starting Create Static Device Nodes in /dev...
Collecting audit messages is disabled.
Finished dracut ask for additional cmdline parameters.
Starting dracut cmdline hook...
Finished Create Static Device Nodes in /dev.
Reached target Preparation for Local File Systems.
Reached target Local File Systems.
Finished dracut cmdline hook.
Starting dracut pre-udev hook...
usb 4-1.2: new low-speed USB device number 3 using ehci-pci
Finished dracut pre-udev hook.
Starting Rule-based Manager for Device Events and Files...
Started Rule-based Manager for Device Events and Files.
dracut pre-trigger hook was skipped because no trigger condition checks wer=
e met.
Starting Coldplug All udev Devices...
input: Logitech USB Receiver as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4=
-1.2/4-1.2:1.0/0003:046D:C502.0001/input/input15
Finished Coldplug All udev Devices.
Starting dracut initqueue hook...
hid-generic 0003:046D:C502.0001: input,hidraw0: USB HID v1.10 Keyboard [Log=
itech USB Receiver] on usb-0000:00:1d.0-1.2/input0
input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:1d.0/usb4=
/4-1/4-1.2/4-1.2:1.1/0003:046D:C502.0002/input/input16
nouveau 0000:01:00.0: therm: FAN target request: 30%
nouveau 0000:01:00.0: therm: FAN update: 30
input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:0=
0:1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:046D:C502.0002/input/input17
input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:=
1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:046D:C502.0002/input/input18
hid-generic 0003:046D:C502.0002: input,hidraw1: USB HID v1.10 Mouse [Logite=
ch USB Receiver] on usb-0000:00:1d.0-1.2/input1
Found device CT500MX500SSD1 1.
Found device CT500MX500SSD1 2.
Found device CT500MX500SSD1 2.
Reached target Initrd Root Device.
systemd-vconsole-setup.service: Deactivated successfully.
Stopped Virtual Console Setup.
Stopping Virtual Console Setup...
Starting Virtual Console Setup...
Couldn't write '1' to 'kernel/sysrq', ignoring: No such file or directory
Using default interface naming scheme 'v257'.
Started Journal Service.
Using kernel command line parameters:  root=3DUUID=3Db7fcf10a-962f-4491-acc=
c-d775612ad6d0 rootfstype=3Dbtrfs rootflags=3Drw,relatime,ssd,discard=3Dasy=
nc,space_cache=3Dv2,subvolid=3D256,subvol=3D/root,subvol=3Droot   bootconfig
Starting Create System Files and Directories...
Finished Virtual Console Setup.
usb 4-1.3: new low-speed USB device number 4 using ehci-pci
/usr/lib/tmpfiles.d/var.conf:14: Duplicate line for path "/var/log", ignori=
ng.
Finished Create System Files and Directories.
Reached target System Initialization.
Reached target Basic System.
input: Logitech Optical USB Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/=
4-1/4-1.3/4-1.3:1.0/0003:046D:C016.0003/input/input19
hid-generic 0003:046D:C016.0003: input,hidraw2: USB HID v1.10 Mouse [Logite=
ch Optical USB Mouse] on usb-0000:00:1d.0-1.3/input0
Finished dracut initqueue hook.
Reached target Preparation for Remote File Systems.
Reached target Remote File Systems.
dracut pre-mount hook was skipped because no trigger condition checks were =
met.
Starting File System Check on /dev/disk/by-uuid/b7fcf10a-962f-4491-accc-d77=
5612ad6d0...
Finished File System Check on /dev/disk/by-uuid/b7fcf10a-962f-4491-accc-d77=
5612ad6d0.
Mounting /sysroot...
BTRFS: device fsid b7fcf10a-962f-4491-accc-d775612ad6d0 devid 1 transid 168=
1 /dev/sdb2 (8:18) scanned by mount (345)
BTRFS info (device sdb2): first mount of filesystem b7fcf10a-962f-4491-accc=
-d775612ad6d0
BTRFS info (device sdb2): using crc32c (crc32c-intel) checksum algorithm
BTRFS info (device sdb2): enabling ssd optimizations
BTRFS info (device sdb2): turning on async discard
BTRFS info (device sdb2): enabling free space tree
Mounted /sysroot.
Reached target Initrd Root File System.
Starting Mountpoints Configured in the Real Root...
initrd-parse-etc.service: Deactivated successfully.
Finished Mountpoints Configured in the Real Root.
Reached target Initrd File Systems.
Reached target Initrd Default Target.
dracut mount hook was skipped because no trigger condition checks were met.
dracut pre-pivot and cleanup hook was skipped because no trigger condition =
checks were met.
Starting Cleaning Up and Shutting Down Daemons...
Stopped target Initrd Default Target.
Stopped target Basic System.
Stopped target Initrd Root Device.
Stopped target Initrd /usr File System.
Stopped target Path Units.
systemd-ask-password-console.path: Deactivated successfully.
Stopped Dispatch Password Requests to Console Directory Watch.
Stopped target Remote File Systems.
Stopped target Preparation for Remote File Systems.
Stopped target Slice Units.
Stopped target Socket Units.
Stopped target System Initialization.
Stopped target Swaps.
Stopped target Timer Units.
dracut-initqueue.service: Deactivated successfully.
Stopped dracut initqueue hook.
systemd-sysctl.service: Deactivated successfully.
Stopped Apply Kernel Variables.
systemd-tmpfiles-setup.service: Deactivated successfully.
Stopped Create System Files and Directories.
Stopped target Local File Systems.
Stopped target Preparation for Local File Systems.
systemd-udev-trigger.service: Deactivated successfully.
Stopped Coldplug All udev Devices.
Stopping Rule-based Manager for Device Events and Files...
initrd-cleanup.service: Deactivated successfully.
Finished Cleaning Up and Shutting Down Daemons.
systemd-udevd.service: Deactivated successfully.
Stopped Rule-based Manager for Device Events and Files.
systemd-udevd-control.socket: Deactivated successfully.
Closed udev Control Socket.
systemd-udevd-kernel.socket: Deactivated successfully.
Closed udev Kernel Socket.
dracut-pre-udev.service: Deactivated successfully.
Stopped dracut pre-udev hook.
dracut-cmdline.service: Deactivated successfully.
Stopped dracut cmdline hook.
dracut-cmdline-ask.service: Deactivated successfully.
Stopped dracut ask for additional cmdline parameters.
Starting Cleanup udev Database...
systemd-tmpfiles-setup-dev.service: Deactivated successfully.
Stopped Create Static Device Nodes in /dev.
systemd-tmpfiles-setup-dev-early.service: Deactivated successfully.
Stopped Create Static Device Nodes in /dev gracefully.
systemd-vconsole-setup.service: Deactivated successfully.
Stopped Virtual Console Setup.
initrd-udevadm-cleanup-db.service: Deactivated successfully.
Finished Cleanup udev Database.
Reached target Switch Root.
Starting Switch Root...
Switching root.
Journal stopped
Journal started
Runtime Journal (/run/log/journal/9719b589addb4d698f35ee67da8669f9) is 8M, =
max 319.5M, 311.5M free.
Received SIGTERM from PID 1 (systemd).
RTC configured in localtime, applying delta of -480 minutes to system time.
systemd 257.10 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA =
+IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID -CURL +ELFUTILS -=
FIDO2 +IDN2 -IDN -IPTC -KMOD -LIBCRYPTSETUP -LIBCRYPTSETUP_PLUGINS +LIBFDIS=
K +PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 +LZ4 -XZ -ZLIB +ZSTD -BP=
F_FRAMEWORK -BTF -XKBCOMMON +UTMP -SYSVINIT +LIBARCHIVE)
Detected architecture x86-64.
nouveau 0000:01:00.0: therm: FAN target request: 30%
initrd-switch-root.service: Deactivated successfully.
Stopped Switch Root.
systemd-journald.service: Scheduled restart job, restart counter is at 1.
Created slice Slice /system/getty.
Created slice Slice /system/modprobe.
Created slice Slice /system/wpa_supplicant.
Created slice User and Session Slice.
Started Dispatch Password Requests to Console Directory Watch.
Started Forward Password Requests to Wall Directory Watch.
Arbitrary Executable File Formats File System Automount Point was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/proc/sys/fs/binf=
mt_misc).
Expecting device /dev/disk/by-diskseq/2-part3...
Expecting device /dev/disk/by-uuid/655D-13A2...
Expecting device /dev/disk/by-uuid/70F8D643F8D6076E...
Expecting device /dev/disk/by-uuid/b7fcf10a-962f-4491-accc-d775612ad6d0...
Expecting device /sys/subsystem/net/devices/wlp3s0...
Stopped target Switch Root.
Stopped target Initrd File Systems.
Stopped target Initrd Root File System.
Reached target Path Units.
Reached target Remote File Systems.
Reached target Slice Units.
Listening on Process Core Dump Socket.
Listening on Credential Encryption/Decryption.
Journal Audit Socket was skipped because of an unmet condition check (Condi=
tionSecurity=3Daudit).
Listening on DDI File System Mounter Socket.
Listening on Network Service Netlink Socket.
Listening on Namespace Resource Manager Socket.
Listening on udev Control Socket.
Listening on udev Kernel Socket.
Listening on User Database Manager Socket.
Huge Pages File System was skipped because of an unmet condition check (Con=
ditionPathExists=3D/sys/kernel/mm/hugepages).
Mounting POSIX Message Queue File System...
Kernel Debug File System was skipped because of an unmet condition check (C=
onditionPathExists=3D/sys/kernel/debug).
Kernel Trace File System was skipped because of an unmet condition check (C=
onditionPathExists=3D/sys/kernel/tracing).
Starting Load Kernel Module configfs...
Starting Load Kernel Module dm_mod...
Starting Load Kernel Module drm...
Starting Load Kernel Module efi_pstore...
Starting Load Kernel Module fuse...
Starting Load Kernel Module loop...
File System Check on Root Device was skipped because of an unmet condition =
check (ConditionPathIsReadWrite=3D!/).
Clear Stale Hibernate Storage Info was skipped because of an unmet conditio=
n check (ConditionPathExists=3D/sys/firmware/efi/efivars/HibernateLocation-=
8cf2644b-4b0b-428f-9387-6d876050dc67).
Starting Journal Service...
Starting Generate network units from Kernel command line...
Starting Remount Root and Kernel File Systems...
Starting Apply Kernel Variables...
Starting Create Static Device Nodes in /dev gracefully...
Starting Load udev Rules from Credentials...
Starting Coldplug All udev Devices...
Mounted POSIX Message Queue File System.
modprobe@configfs.service: Deactivated successfully.
Finished Load Kernel Module configfs.
modprobe@dm_mod.service: Deactivated successfully.
Finished Load Kernel Module dm_mod.
modprobe@drm.service: Deactivated successfully.
Finished Load Kernel Module drm.
modprobe@efi_pstore.service: Deactivated successfully.
Finished Load Kernel Module efi_pstore.
modprobe@fuse.service: Deactivated successfully.
Finished Load Kernel Module fuse.
modprobe@loop.service: Deactivated successfully.
Finished Load Kernel Module loop.
FUSE Control File System was skipped because of an unmet condition check (C=
onditionPathExists=3D/sys/fs/fuse/connections).
Kernel Configuration File System was skipped because of an unmet condition =
check (ConditionPathExists=3D/sys/kernel/config).
Repartition Root Disk was skipped because no trigger condition checks were =
met.
Finished Generate network units from Kernel command line.
Reached target Preparation for Network.
Collecting audit messages is disabled.
Finished Load udev Rules from Credentials.
/dev/kmsg buffer overrun, some messages lost.
Finished Remount Root and Kernel File Systems.
Finished Apply Kernel Variables.
Rebuild Hardware Database was skipped because of an unmet condition check (=
ConditionNeedsUpdate=3D/etc).
Platform Persistent Storage Archival was skipped because of an unmet condit=
ion check (ConditionDirectoryNotEmpty=3D/sys/fs/pstore).
Starting Load/Save OS Random Seed...
Starting Namespace Resource Manager...
Starting User Database Manager...
Queued start job for default target Graphical Interface.
systemd-journald.service: Deactivated successfully.
Couldn't write '1' to 'kernel/sysrq', ignoring: No such file or directory
Started Journal Service.
Starting Flush Journal to Persistent Storage...
Finished Load/Save OS Random Seed.
Time spent on flushing to /var/log/journal/9719b589addb4d698f35ee67da8669f9=
 is 175.816ms for 3793 entries.
System Journal (/var/log/journal/9719b589addb4d698f35ee67da8669f9) is 115.3=
M, max 4G, 3.8G free.
Received client request to flush runtime journal.
/var/log/journal/9719b589addb4d698f35ee67da8669f9/system.journal: Realtime =
clock jumped backwards relative to last journal entry, rotating.
Rotating system journal.
r8169 0000:06:00.0 enp6s0: renamed from eth0
rt2800pci 0000:03:00.0 wlp3s0: renamed from wlan0
Not setting up BPF subsystem, as functionality has been disabled at compile=
 time.
Started Namespace Resource Manager.
Started User Database Manager.
Finished Create Static Device Nodes in /dev gracefully.
Create System Users was skipped because no trigger condition checks were me=
t.
Starting Network Name Resolution...
Starting Network Time Synchronization...
Starting Create Static Device Nodes in /dev...
Finished Coldplug All udev Devices.
The system is configured to read the RTC time in the local time zone. This =
mode cannot be fully supported. All system time to RTC updates are disabled.
Started Network Time Synchronization.
Reached target System Time Set.
Finished Create Static Device Nodes in /dev.
Reached target Preparation for Local File Systems.
Starting Rule-based Manager for Device Events and Files...
Positive Trust Anchors:
. IN DS 20326 8 2 e06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c=
7f8ec8d
. IN DS 38696 8 2 683d2d0acb8c9b712a1948b27f741219298d0a450d612c483af444a4c=
0fb2b16
Negative trust anchors: home.arpa 10.in-addr.arpa 16.172.in-addr.arpa 17.17=
2.in-addr.arpa 18.172.in-addr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa =
21.172.in-addr.arpa 22.172.in-addr.arpa 23.172.in-addr.arpa 24.172.in-addr.=
arpa 25.172.in-addr.arpa 26.172.in-addr.arpa 27.172.in-addr.arpa 28.172.in-=
addr.arpa 29.172.in-addr.arpa 30.172.in-addr.arpa 31.172.in-addr.arpa 170.0=
.0.192.in-addr.arpa 171.0.0.192.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.a=
rpa ipv4only.arpa resolver.arpa corp home internal intranet lan local priva=
te test
Using system hostname 'cicero.home.chead.ca'.
Started Network Name Resolution.
Reached target Host and Network Name Lookups.
Using default interface naming scheme 'v257'.
Started Rule-based Manager for Device Events and Files.
Starting Network Configuration...
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
lo: Link UP
lo: Gained carrier
Started Network Configuration.
Starting Enable Persistent Storage in systemd-networkd...
wlan0: Interface name change detected, renamed to wlp3s0.
Finished Flush Journal to Persistent Storage.
Finished Enable Persistent Storage in systemd-networkd.
Reached target Sound Card.
Found device CT500MX500SSD1 1.
Condition check resulted in CT500MX500SSD1 3 being skipped.
Activating swap Swap Partition...
Found device CT500MX500SSD1 2.
Adding 33554428k swap on /dev/sdb3.  Priority:-2 extents:1 across:33554428k=
 SS
Activated swap Swap Partition.
Reached target Swaps.
Condition check resulted in /sys/devices/virtual/misc/rfkill being skipped.
Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
Starting Load/Save RF Kill Switch Status...
enp6s0: Configuring with /etc/systemd/network/lan.network.
Found device RT2790 Wireless 802.11n 1T/2R PCIe.
RTL8211DN Gigabit Ethernet r8169-0-600:00: attached PHY driver (mii_bus:phy=
_addr=3Dr8169-0-600:00, irq=3DMAC)
Starting Virtual Console Setup...
Started Load/Save RF Kill Switch Status.
Finished Virtual Console Setup.
wlp3s0: Configuring with /etc/systemd/network/lan.network.
ieee80211 phy0: rt2x00lib_request_firmware: Info - Loading firmware file 'r=
t2860.bin'
ieee80211 phy0: rt2x00lib_request_firmware: Info - Firmware detected - vers=
ion: 0.40
r8169 0000:06:00.0 enp6s0: Link is Down
enp6s0: Link UP
wlp3s0: Link UP
nouveau 0000:01:00.0: therm: FAN target request: 30%
Mounting /efi...
Mounting /media/btrfs...
tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
Mounting Temporary Directory /tmp...
Mounting /var/cache/repos...
Virtual Machine and Container Storage (Compatibility) was skipped because o=
f an unmet condition check (ConditionPathExists=3D/var/lib/machines.raw).
Reached target Containers.
Condition check resulted in WDC_WD5000AAKX-00U6AA0 Basic\x20data\x20partiti=
on being skipped.
Mounting /media/windows...
Mounted /efi.
Mounted /media/btrfs.
Mounted Temporary Directory /tmp.
Mounted /var/cache/repos.
Reached target Local File Systems.
Listening on Boot Entries Service Socket.
Listening on System Extension Image Management.
Set Up Additional Binary Formats was skipped because of an unmet condition =
check (ConditionPathIsMountPoint=3D/proc/sys/fs/binfmt_misc).
Starting Update Boot Loader Random Seed...
Starting Automatic Boot Loader Update...
Merge System Configuration Images into /etc/ was skipped because no trigger=
 condition checks were met.
Merge System Extension Images into /usr/ and /opt/ was skipped because no t=
rigger condition checks were met.
Starting Create System Files and Directories...
Finished Automatic Boot Loader Update.
Random seed file /efi/loader/random-seed successfully refreshed (32 bytes).
Finished Update Boot Loader Random Seed.
Finished Create System Files and Directories.
Rebuild Dynamic Linker Cache was skipped because no trigger condition check=
s were met.
First Boot Wizard was skipped because of an unmet condition check (Conditio=
nFirstBoot=3Dyes).
First Boot Complete was skipped because of an unmet condition check (Condit=
ionFirstBoot=3Dyes).
Rebuild Journal Catalog was skipped because of an unmet condition check (Co=
nditionNeedsUpdate=3D/var).
Save Transient machine-id to Disk was skipped because of an unmet condition=
 check (ConditionPathIsMountPoint=3D/etc/machine-id).
Update is Completed was skipped because no trigger condition checks were me=
t.
Starting Record System Boot/Shutdown in UTMP...
Finished Record System Boot/Shutdown in UTMP.
Reached target System Initialization.
Started Python Dynamic DNS Updater.
Started Daily Cleanup of Temporary Directories.
Reached target Timer Units.
Listening on D-Bus System Message Bus Socket.
Listening on OpenSSH Server Socket (systemd-ssh-generator, AF_UNIX Local).
Listening on OpenSSH Server Socket.
Listening on Hostname Service Socket.
Reached target Socket Units.
Reached target Basic System.
Starting D-Bus System Message Bus...
Starting Restore /run/initramfs on shutdown...
Starting User Login Management...
Started WPA supplicant daemon (for interface wlp3s0).
Reached target Network.
Starting Permit User Sessions...
Finished Restore /run/initramfs on shutdown.
Starting Wait for Network to be Configured...
Finished Permit User Sessions.
Started Getty on tty1.
Reached target Login Prompts.
Successfully initialized wpa_supplicant
Failed to drop supplementary groups: Operation not permitted
Started D-Bus System Message Bus.
New seat seat0.
wlp3s0: CTRL-EVENT-REGDOM-CHANGE init=3DUSER type=3DCOUNTRY alpha2=3DCA
Watching system buttons on /dev/input/event1 (Power Button)
Watching system buttons on /dev/input/event0 (Power Button)
Watching system buttons on /dev/input/event13 (Logitech USB Receiver)
Watching system buttons on /dev/input/event16 (Logitech USB Receiver System=
 Control)
Started User Login Management.
Reached target Multi-User System.
Reached target Graphical Interface.
Mounted /media/windows.
nouveau 0000:01:00.0: therm: FAN target request: 30%
wlp3s0: SME: Trying to authenticate with 9c:1e:95:b7:b2:02 (SSID=3D'ch824pq=
g' freq=3D2462 MHz)
wlp3s0: authenticate with 9c:1e:95:b7:b2:02 (local address=3D70:71:bc:13:29=
:0a)
wlp3s0: send auth to 9c:1e:95:b7:b2:02 (try 1/3)
wlp3s0: Trying to associate with 9c:1e:95:b7:b2:02 (SSID=3D'ch824pqg' freq=
=3D2462 MHz)
wlp3s0: authenticated
wlp3s0: associate with 9c:1e:95:b7:b2:02 (try 1/3)
wlp3s0: RX AssocResp from 9c:1e:95:b7:b2:02 (capab=3D0x1411 status=3D0 aid=
=3D1)
wlp3s0: associated
wlp3s0: Connected WiFi access point: ch824pqg (9c:1e:95:b7:b2:02)
wlp3s0: Associated with 9c:1e:95:b7:b2:02
wlp3s0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=3D0
wlp3s0: CTRL-EVENT-REGDOM-CHANGE init=3DCOUNTRY_IE type=3DCOUNTRY alpha2=3D=
CA
wlp3s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 9c:1e:95:b7:b=
2:02
nouveau 0000:01:00.0: therm: FAN target request: 30%
wlp3s0: WPA: Key negotiation completed with 9c:1e:95:b7:b2:02 [PTK=3DCCMP G=
TK=3DCCMP]
wlp3s0: CTRL-EVENT-CONNECTED - Connection to 9c:1e:95:b7:b2:02 completed [i=
d=3D0 id_str=3D]
wlp3s0: Gained carrier
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 30%
nouveau 0000:01:00.0: therm: FAN target: 30
nouveau 0000:01:00.0: therm: FAN update: 30
wlp3s0: Gained IPv6LL
Network configuration changed, trying to establish connection.
systemd-rfkill.service: Deactivated successfully.
nouveau 0000:01:00.0: therm: FAN target request: 30%
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
wlp3s0: DHCPv4 address 192.168.1.67/24, gateway 192.168.1.254 acquired from=
 192.168.1.254
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
Network configuration changed, trying to establish connection.
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
Network configuration changed, trying to establish connection.
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 30%
nouveau 0000:01:00.0: therm: FAN target: 30
nouveau 0000:01:00.0: therm: FAN update: 30
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 30%
nouveau 0000:01:00.0: therm: FAN target: 30
nouveau 0000:01:00.0: therm: FAN update: 30
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
Created slice Slice /system/sshd.
Started OpenSSH per-connection server daemon ([2605:1700:10aa:6600:a6dd:982=
e:d5e7:fe3d]:57970).
Accepted publickey for chead from 2605:1700:10aa:6600:a6dd:982e:d5e7:fe3d p=
ort 57970 ssh2: ED25519 SHA256:BGweSpHSWc/3uahcZ+ODrfsmRTYGJ9bQS3/5D1KjGX4
pam_unix(sshd:session): session opened for user chead(uid=3D1000) by (uid=
=3D0)
New session c1 of user chead.
Created slice User Slice of UID 1000.
Starting User Runtime Directory /run/user/1000...
Finished User Runtime Directory /run/user/1000.
Starting User Manager for UID 1000...
pam_unix(systemd-user:session): session opened for user chead(uid=3D1000) b=
y (uid=3D0)
New session c2 of user chead.
Queued start job for default target Main User Target.
Created slice User Application Slice.
Reached target Paths.
Reached target Timers.
Starting D-Bus User Message Bus Socket...
Listening on D-Bus User Message Bus Socket.
Reached target Sockets.
Reached target Basic System.
Reached target Main User Target.
Startup finished in 173ms.
Started User Manager for UID 1000.
Started Session c1 of User chead.
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 32%
Clock change detected. Flushing caches.
Contacted time server [2606:4700:f1::1]:123 (2.gentoo.pool.ntp.org).
Initial clock synchronization to Mon 2025-12-15 18:12:38.141675 PST.
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target: 34
nouveau 0000:01:00.0: therm: FAN update: 34
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target: 34
nouveau 0000:01:00.0: therm: FAN update: 34
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target: 34
nouveau 0000:01:00.0: therm: FAN update: 34
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target: 34
nouveau 0000:01:00.0: therm: FAN update: 34
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 32%
nouveau 0000:01:00.0: therm: FAN target: 32
nouveau 0000:01:00.0: therm: FAN update: 32
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target: 34
nouveau 0000:01:00.0: therm: FAN update: 34
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner ff
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
Timeout occurred while waiting for network connectivity.
systemd-networkd-wait-online.service: Main process exited, code=3Dexited, s=
tatus=3D1/FAILURE
systemd-networkd-wait-online.service: Failed with result 'exit-code'.
Failed to start Wait for Network to be Configured.
Reached target Network is Online.
Starting Python Dynamic DNS Updater...
nouveau 0000:01:00.0: therm: FAN target request: 34%
Using degraded feature set UDP+EDNS0 instead of UDP+EDNS0+DO for DNS server=
 75.153.171.68.
Server 75.153.171.68 does not support DNSSEC, downgrading to non-DNSSEC mod=
e.
Updating DNS record for cicero.home.chead.ca. to {'ipv6': [IPv6Address('200=
1:569:7bcd:300:7271:bcff:fe13:290a')]}.
pydyndns.service: Deactivated successfully.
Finished Python Dynamic DNS Updater.
Startup finished in 1.509s (kernel) + 1.621s (initrd) + 2min 2.299s (usersp=
ace) =3D 2min 5.430s.
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau: drm:00000000:00000000: ioctl: size 34
nouveau: drm:00000000:00000000: ioctl: vers 0 type 04 object ffff97620091ec=
a0 owner 00
nouveau: DRM:00000000:80000012: ioctl: mthd size 10
nouveau: DRM:00000000:80000012: ioctl: mthd vers 0 mthd 00
nouveau: drm:00000000:00000000: ioctl: return 0
nouveau 0000:01:00.0: i2c: bus 0000: acquire
nouveau 0000:01:00.0: i2c: pad 0100: acquire
nouveau 0000:01:00.0: i2c: pad 0100: -> i2c
nouveau 0000:01:00.0: i2c: bus 0000: release
nouveau 0000:01:00.0: i2c: pad 0100: release
nouveau 0000:01:00.0: i2c: pad 0100: -> off
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%
nouveau 0000:01:00.0: therm: FAN target request: 34%

--MP_/c3OHXRZ7FLjFhPZc6e/er0/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=config.txt

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86 6.12.58-gentoo Kernel Configuration
#
CONFIG_CC_VERSION_TEXT=3D"gcc (Gentoo 15.2.1_p20251122 p3) 15.2.1 20251122"
CONFIG_CC_IS_GCC=3Dy
CONFIG_GCC_VERSION=3D150201
CONFIG_CLANG_VERSION=3D0
CONFIG_AS_IS_GNU=3Dy
CONFIG_AS_VERSION=3D24501
CONFIG_LD_IS_BFD=3Dy
CONFIG_LD_VERSION=3D24501
CONFIG_LLD_VERSION=3D0
CONFIG_RUSTC_VERSION=3D108900
CONFIG_RUSTC_LLVM_VERSION=3D200107
CONFIG_CC_CAN_LINK=3Dy
CONFIG_CC_CAN_LINK_STATIC=3Dy
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy
CONFIG_TOOLS_SUPPORT_RELR=3Dy
CONFIG_CC_HAS_ASM_INLINE=3Dy
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
CONFIG_CC_HAS_COUNTED_BY=3Dy
CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY=3Dy
CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES=3Dy
CONFIG_PAHOLE_VERSION=3D0
CONFIG_IRQ_WORK=3Dy
CONFIG_BUILDTIME_TABLE_SORT=3Dy
CONFIG_THREAD_INFO_IN_TASK=3Dy

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=3D32
# CONFIG_COMPILE_TEST is not set
CONFIG_WERROR=3Dy
CONFIG_LOCALVERSION=3D""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=3D""
CONFIG_HAVE_KERNEL_GZIP=3Dy
CONFIG_HAVE_KERNEL_BZIP2=3Dy
CONFIG_HAVE_KERNEL_LZMA=3Dy
CONFIG_HAVE_KERNEL_XZ=3Dy
CONFIG_HAVE_KERNEL_LZO=3Dy
CONFIG_HAVE_KERNEL_LZ4=3Dy
CONFIG_HAVE_KERNEL_ZSTD=3Dy
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_KERNEL_ZSTD=3Dy
CONFIG_DEFAULT_INIT=3D""
CONFIG_DEFAULT_HOSTNAME=3D"cicero.home.chead.ca"
CONFIG_SYSVIPC=3Dy
CONFIG_SYSVIPC_SYSCTL=3Dy
CONFIG_POSIX_MQUEUE=3Dy
CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=3Dy
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=3Dy
CONFIG_GENERIC_IRQ_SHOW=3Dy
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
CONFIG_GENERIC_PENDING_IRQ=3Dy
CONFIG_GENERIC_IRQ_MIGRATION=3Dy
CONFIG_HARDIRQS_SW_RESEND=3Dy
CONFIG_IRQ_DOMAIN=3Dy
CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
CONFIG_GENERIC_MSI_IRQ=3Dy
CONFIG_IRQ_MSI_IOMMU=3Dy
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
CONFIG_IRQ_FORCED_THREADING=3Dy
CONFIG_SPARSE_IRQ=3Dy
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
CONFIG_GENERIC_TIME_VSYSCALL=3Dy
CONFIG_GENERIC_CLOCKEVENTS=3Dy
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE=3Dy
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
CONFIG_GENERIC_CMOS_UPDATE=3Dy
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
CONFIG_CONTEXT_TRACKING=3Dy
CONFIG_CONTEXT_TRACKING_IDLE=3Dy

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=3Dy
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=3Dy
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=3D125
# end of Timers subsystem

CONFIG_BPF=3Dy
CONFIG_HAVE_EBPF_JIT=3Dy
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=3Dy
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=3Dy
# CONFIG_PREEMPT is not set
# CONFIG_PREEMPT_DYNAMIC is not set
CONFIG_SCHED_CORE=3Dy

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=3Dy
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=3Dy
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=3Dy
CONFIG_TASKS_RCU_GENERIC=3Dy
CONFIG_NEED_TASKS_RCU=3Dy
CONFIG_TASKS_TRACE_RCU=3Dy
CONFIG_RCU_STALL_COMMON=3Dy
CONFIG_RCU_NEED_SEGCBLIST=3Dy
# end of RCU Subsystem

CONFIG_IKCONFIG=3Dy
CONFIG_IKCONFIG_PROC=3Dy
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=3D18
CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
CONFIG_CC_HAS_INT128=3Dy
CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
CONFIG_GCC10_NO_ARRAY_BOUNDS=3Dy
CONFIG_CC_NO_ARRAY_BOUNDS=3Dy
CONFIG_GCC_NO_STRINGOP_OVERFLOW=3Dy
CONFIG_CC_NO_STRINGOP_OVERFLOW=3Dy
CONFIG_ARCH_SUPPORTS_INT128=3Dy
CONFIG_CGROUPS=3Dy
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=3Dy
CONFIG_GROUP_SCHED_WEIGHT=3Dy
CONFIG_FAIR_GROUP_SCHED=3Dy
# CONFIG_CFS_BANDWIDTH is not set
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=3Dy
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
CONFIG_CGROUP_BPF=3Dy
# CONFIG_CGROUP_MISC is not set
CONFIG_SOCK_CGROUP_DATA=3Dy
CONFIG_NAMESPACES=3Dy
CONFIG_UTS_NS=3Dy
# CONFIG_TIME_NS is not set
CONFIG_IPC_NS=3Dy
CONFIG_USER_NS=3Dy
CONFIG_PID_NS=3Dy
CONFIG_NET_NS=3Dy
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=3Dy
CONFIG_RELAY=3Dy
CONFIG_BLK_DEV_INITRD=3Dy
CONFIG_INITRAMFS_SOURCE=3D""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=3Dy
CONFIG_BOOT_CONFIG=3Dy
# CONFIG_BOOT_CONFIG_FORCE is not set
CONFIG_BOOT_CONFIG_EMBED=3Dy
CONFIG_BOOT_CONFIG_EMBED_FILE=3D"/etc/boot.conf"
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=3Dy
CONFIG_LD_ORPHAN_WARN_LEVEL=3D"error"
CONFIG_SYSCTL=3Dy
CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=3Dy
CONFIG_SGETMASK_SYSCALL=3Dy
CONFIG_SYSFS_SYSCALL=3Dy
CONFIG_FHANDLE=3Dy
CONFIG_POSIX_TIMERS=3Dy
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_ELF_CORE=3Dy
CONFIG_PCSPKR_PLATFORM=3Dy
CONFIG_FUTEX=3Dy
CONFIG_FUTEX_PI=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SIGNALFD=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_EVENTFD=3Dy
CONFIG_SHMEM=3Dy
CONFIG_AIO=3Dy
CONFIG_IO_URING=3Dy
CONFIG_ADVISE_SYSCALLS=3Dy
CONFIG_MEMBARRIER=3Dy
CONFIG_KCMP=3Dy
CONFIG_RSEQ=3Dy
CONFIG_CACHESTAT_SYSCALL=3Dy
CONFIG_KALLSYMS=3Dy
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
CONFIG_HAVE_PERF_EVENTS=3Dy

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=3Dy
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
# CONFIG_PROFILING is not set

#
# Kexec and crash features
#
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# end of Kexec and crash features
# end of General setup

CONFIG_64BIT=3Dy
CONFIG_X86_64=3Dy
CONFIG_X86=3Dy
CONFIG_INSTRUCTION_DECODER=3Dy
CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=3Dy
CONFIG_STACKTRACE_SUPPORT=3Dy
CONFIG_MMU=3Dy
CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
CONFIG_GENERIC_ISA_DMA=3Dy
CONFIG_GENERIC_BUG=3Dy
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
CONFIG_ARCH_HAS_CPU_RELAX=3Dy
CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
CONFIG_AUDIT_ARCH=3Dy
CONFIG_HAVE_INTEL_TXT=3Dy
CONFIG_X86_64_SMP=3Dy
CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
CONFIG_FIX_EARLYCON_MEM=3Dy
CONFIG_PGTABLE_LEVELS=3D4
CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy

#
# Processor type and features
#
CONFIG_SMP=3Dy
# CONFIG_X86_MPPARSE is not set
# CONFIG_X86_CPU_RESCTRL is not set
# CONFIG_X86_FRED is not set
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=3Dy
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
CONFIG_SCHED_OMIT_FRAME_POINTER=3Dy
# CONFIG_HYPERVISOR_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
CONFIG_MCORE2=3Dy
# CONFIG_MATOM is not set
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
CONFIG_X86_L1_CACHE_SHIFT=3D6
CONFIG_X86_INTEL_USERCOPY=3Dy
CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
CONFIG_X86_P6_NOP=3Dy
CONFIG_X86_TSC=3Dy
CONFIG_X86_HAVE_PAE=3Dy
CONFIG_X86_CMPXCHG64=3Dy
CONFIG_X86_CMOV=3Dy
CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
CONFIG_X86_DEBUGCTLMSR=3Dy
CONFIG_IA32_FEAT_CTL=3Dy
CONFIG_X86_VMX_FEATURE_NAMES=3Dy
CONFIG_CPU_SUP_INTEL=3Dy
CONFIG_CPU_SUP_AMD=3Dy
CONFIG_CPU_SUP_HYGON=3Dy
CONFIG_CPU_SUP_CENTAUR=3Dy
CONFIG_CPU_SUP_ZHAOXIN=3Dy
CONFIG_HPET_TIMER=3Dy
CONFIG_HPET_EMULATE_RTC=3Dy
CONFIG_DMI=3Dy
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=3Dy
CONFIG_NR_CPUS_RANGE_BEGIN=3D2
CONFIG_NR_CPUS_RANGE_END=3D512
CONFIG_NR_CPUS_DEFAULT=3D64
CONFIG_NR_CPUS=3D4
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=3Dy
CONFIG_SCHED_MC=3Dy
# CONFIG_SCHED_MC_PRIO is not set
CONFIG_X86_LOCAL_APIC=3Dy
CONFIG_ACPI_MADT_WAKEUP=3Dy
CONFIG_X86_IO_APIC=3Dy
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=3Dy
# CONFIG_X86_MCELOG_LEGACY is not set
CONFIG_X86_MCE_INTEL=3Dy
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=3Dy

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
# CONFIG_PERF_EVENTS_INTEL_RAPL is not set
CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=3Dy
CONFIG_X86_ESPFIX64=3Dy
CONFIG_X86_VSYSCALL_EMULATION=3Dy
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_MICROCODE=3Dy
# CONFIG_MICROCODE_LATE_LOADING is not set
CONFIG_X86_MSR=3Dy
CONFIG_X86_CPUID=3Dy
# CONFIG_X86_5LEVEL is not set
CONFIG_X86_DIRECT_GBPAGES=3Dy
# CONFIG_AMD_MEM_ENCRYPT is not set
# CONFIG_NUMA is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
CONFIG_MTRR=3Dy
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=3Dy
CONFIG_X86_UMIP=3Dy
CONFIG_CC_HAS_IBT=3Dy
# CONFIG_X86_KERNEL_IBT is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
CONFIG_ARCH_PKEY_BITS=3D4
CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_USER_SHADOW_STACK is not set
CONFIG_EFI=3Dy
CONFIG_EFI_STUB=3Dy
# CONFIG_EFI_HANDOVER_PROTOCOL is not set
# CONFIG_EFI_MIXED is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=3Dy
CONFIG_HZ=3D1000
CONFIG_SCHED_HRTICK=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_FILE=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_SIG=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_SIG_FORCE=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG=3Dy
CONFIG_ARCH_SUPPORTS_KEXEC_JUMP=3Dy
CONFIG_ARCH_SUPPORTS_CRASH_DUMP=3Dy
CONFIG_ARCH_DEFAULT_CRASH_DUMP=3Dy
CONFIG_ARCH_SUPPORTS_CRASH_HOTPLUG=3Dy
CONFIG_PHYSICAL_START=3D0x1000000
CONFIG_RELOCATABLE=3Dy
CONFIG_RANDOMIZE_BASE=3Dy
CONFIG_X86_NEED_RELOCS=3Dy
CONFIG_PHYSICAL_ALIGN=3D0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
CONFIG_RANDOMIZE_MEMORY=3Dy
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0x0
CONFIG_HOTPLUG_CPU=3Dy
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
CONFIG_LEGACY_VSYSCALL_NONE=3Dy
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=3Dy
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=3Dy
# end of Processor type and features

CONFIG_CC_HAS_NAMED_AS=3Dy
CONFIG_CC_HAS_NAMED_AS_FIXED_SANITIZERS=3Dy
CONFIG_USE_X86_SEG_SUPPORT=3Dy
CONFIG_CC_HAS_SLS=3Dy
CONFIG_CC_HAS_RETURN_THUNK=3Dy
CONFIG_CC_HAS_ENTRY_PADDING=3Dy
CONFIG_FUNCTION_PADDING_CFI=3D11
CONFIG_FUNCTION_PADDING_BYTES=3D16
CONFIG_HAVE_CALL_THUNKS=3Dy
CONFIG_CPU_MITIGATIONS=3Dy
CONFIG_MITIGATION_PAGE_TABLE_ISOLATION=3Dy
CONFIG_MITIGATION_RETPOLINE=3Dy
CONFIG_MITIGATION_RETHUNK=3Dy
# CONFIG_MITIGATION_UNRET_ENTRY is not set
# CONFIG_MITIGATION_CALL_DEPTH_TRACKING is not set
# CONFIG_MITIGATION_IBPB_ENTRY is not set
# CONFIG_MITIGATION_IBRS_ENTRY is not set
# CONFIG_MITIGATION_SRSO is not set
# CONFIG_MITIGATION_SLS is not set
# CONFIG_MITIGATION_GDS is not set
# CONFIG_MITIGATION_RFDS is not set
# CONFIG_MITIGATION_SPECTRE_BHI is not set
CONFIG_MITIGATION_MDS=3Dy
# CONFIG_MITIGATION_TAA is not set
CONFIG_MITIGATION_MMIO_STALE_DATA=3Dy
CONFIG_MITIGATION_L1TF=3Dy
# CONFIG_MITIGATION_RETBLEED is not set
CONFIG_MITIGATION_SPECTRE_V1=3Dy
CONFIG_MITIGATION_SPECTRE_V2=3Dy
# CONFIG_MITIGATION_SRBDS is not set
CONFIG_MITIGATION_SSB=3Dy
# CONFIG_MITIGATION_ITS is not set
# CONFIG_MITIGATION_TSA is not set
CONFIG_ARCH_HAS_ADD_PAGES=3Dy

#
# Power management and ACPI options
#
CONFIG_SUSPEND=3Dy
CONFIG_SUSPEND_FREEZER=3Dy
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=3Dy
CONFIG_PM_SLEEP_SMP=3Dy
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=3Dy
# CONFIG_PM_DEBUG is not set
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=3Dy
CONFIG_ACPI=3Dy
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
CONFIG_ACPI_THERMAL_LIB=3Dy
# CONFIG_ACPI_DEBUGGER is not set
# CONFIG_ACPI_SPCR_TABLE is not set
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=3Dy
CONFIG_ACPI_SLEEP=3Dy
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=3Dy
CONFIG_ACPI_BATTERY=3Dy
CONFIG_ACPI_BUTTON=3Dy
CONFIG_ACPI_VIDEO=3Dy
CONFIG_ACPI_FAN=3Dy
CONFIG_ACPI_TAD=3Dy
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=3Dy
CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
CONFIG_ACPI_PROCESSOR_IDLE=3Dy
CONFIG_ACPI_PROCESSOR=3Dy
CONFIG_ACPI_HOTPLUG_CPU=3Dy
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=3Dy
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
# CONFIG_ACPI_TABLE_UPGRADE is not set
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=3Dy
CONFIG_ACPI_CONTAINER=3Dy
CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
CONFIG_ACPI_BGRT=3Dy
CONFIG_ACPI_NHLT=3Dy
# CONFIG_ACPI_NFIT is not set
CONFIG_HAVE_ACPI_APEI=3Dy
CONFIG_HAVE_ACPI_APEI_NMI=3Dy
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=3Dy
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_PRMT is not set
CONFIG_X86_PM_TIMER=3Dy

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=3Dy
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=3Dy
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
CONFIG_X86_ACPI_CPUFREQ=3Dy
# CONFIG_X86_ACPI_CPUFREQ_CPB is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_P4_CLOCKMOD is not set

#
# shared options
#
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=3Dy
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=3Dy
# CONFIG_CPU_IDLE_GOV_TEO is not set
# end of CPU Idle

CONFIG_INTEL_IDLE=3Dy
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=3Dy
CONFIG_PCI_MMCONFIG=3Dy
CONFIG_MMCONF_FAM10H=3Dy
CONFIG_ISA_DMA_API=3Dy
CONFIG_AMD_NB=3Dy
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# CONFIG_X86_X32_ABI is not set
# end of Binary Emulations

# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=3Dy
CONFIG_AS_SHA1_NI=3Dy
CONFIG_AS_SHA256_NI=3Dy
CONFIG_AS_TPAUSE=3Dy
CONFIG_AS_GFNI=3Dy
CONFIG_AS_VAES=3Dy
CONFIG_AS_VPCLMULQDQ=3Dy
CONFIG_AS_WRUSS=3Dy
CONFIG_ARCH_CONFIGURES_CPU_MITIGATIONS=3Dy

#
# General architecture-dependent options
#
CONFIG_HOTPLUG_SMT=3Dy
CONFIG_HOTPLUG_CORE_SYNC=3Dy
CONFIG_HOTPLUG_CORE_SYNC_DEAD=3Dy
CONFIG_HOTPLUG_CORE_SYNC_FULL=3Dy
CONFIG_HOTPLUG_SPLIT_STARTUP=3Dy
CONFIG_HOTPLUG_PARALLEL=3Dy
CONFIG_GENERIC_ENTRY=3Dy
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=3Dy
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
CONFIG_HAVE_IOREMAP_PROT=3Dy
CONFIG_HAVE_KPROBES=3Dy
CONFIG_HAVE_KRETPROBES=3Dy
CONFIG_HAVE_OPTPROBES=3Dy
CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
CONFIG_HAVE_NMI=3Dy
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
CONFIG_ARCH_HAS_SET_MEMORY=3Dy
CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
CONFIG_ARCH_HAS_CPU_FINALIZE_INIT=3Dy
CONFIG_ARCH_HAS_CPU_PASID=3Dy
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
CONFIG_ARCH_WANTS_NO_INSTR=3Dy
CONFIG_HAVE_ASM_MODVERSIONS=3Dy
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
CONFIG_HAVE_RSEQ=3Dy
CONFIG_HAVE_RUST=3Dy
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
CONFIG_HAVE_HW_BREAKPOINT=3Dy
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
CONFIG_HAVE_PERF_REGS=3Dy
CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
CONFIG_MMU_GATHER_MERGE_VMAS=3Dy
CONFIG_MMU_LAZY_TLB_REFCOUNT=3Dy
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES=3Dy
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=3Dy
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
CONFIG_HAVE_ARCH_SECCOMP=3Dy
CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
CONFIG_SECCOMP=3Dy
CONFIG_SECCOMP_FILTER=3Dy
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=3Dy
CONFIG_HAVE_STACKPROTECTOR=3Dy
CONFIG_STACKPROTECTOR=3Dy
CONFIG_STACKPROTECTOR_STRONG=3Dy
CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
CONFIG_LTO_NONE=3Dy
CONFIG_ARCH_SUPPORTS_CFI_CLANG=3Dy
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
CONFIG_HAVE_CONTEXT_TRACKING_USER=3Dy
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=3Dy
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
CONFIG_HAVE_MOVE_PUD=3Dy
CONFIG_HAVE_MOVE_PMD=3Dy
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
CONFIG_HAVE_ARCH_HUGE_VMALLOC=3Dy
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
CONFIG_ARCH_WANT_PMD_MKWRITE=3Dy
CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
CONFIG_MODULES_USE_ELF_RELA=3Dy
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
CONFIG_SOFTIRQ_ON_OWN_STACK=3Dy
CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
CONFIG_HAVE_EXIT_THREAD=3Dy
CONFIG_ARCH_MMAP_RND_BITS=3D28
CONFIG_HAVE_PAGE_SIZE_4KB=3Dy
CONFIG_PAGE_SIZE_4KB=3Dy
CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
CONFIG_PAGE_SHIFT=3D12
CONFIG_HAVE_OBJTOOL=3Dy
CONFIG_HAVE_JUMP_LABEL_HACK=3Dy
CONFIG_HAVE_NOINSTR_HACK=3Dy
CONFIG_HAVE_NOINSTR_VALIDATION=3Dy
CONFIG_HAVE_UACCESS_VALIDATION=3Dy
CONFIG_HAVE_STACK_VALIDATION=3Dy
CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_ARCH_SUPPORTS_RT=3Dy
CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
CONFIG_VMAP_STACK=3Dy
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
CONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
CONFIG_STRICT_KERNEL_RWX=3Dy
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
CONFIG_HAVE_STATIC_CALL=3Dy
CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=3Dy
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=3Dy
CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
CONFIG_DYNAMIC_SIGFRAME=3Dy
CONFIG_ARCH_HAS_HW_PTE_YOUNG=3Dy
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=3Dy
CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=3Dy

#
# GCOV-based kernel profiling
#
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=3Dy
# CONFIG_GCC_PLUGINS is not set
CONFIG_FUNCTION_ALIGNMENT_4B=3Dy
CONFIG_FUNCTION_ALIGNMENT_16B=3Dy
CONFIG_FUNCTION_ALIGNMENT=3D16
CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT=3Dy
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=3Dy
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=3Dy
# CONFIG_MODULES is not set
CONFIG_BLOCK=3Dy
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_CGROUP_PUNT_BIO=3Dy
CONFIG_BLK_DEV_BSG_COMMON=3Dy
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_WRITE_MOUNTED is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy
CONFIG_EFI_PARTITION=3Dy
# end of Partition Types

CONFIG_BLK_MQ_PCI=3Dy
CONFIG_BLK_PM=3Dy

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
# CONFIG_MQ_IOSCHED_KYBER is not set
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=3Dy
CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
CONFIG_INLINE_READ_UNLOCK=3Dy
CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
CONFIG_INLINE_WRITE_UNLOCK=3Dy
CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
CONFIG_LOCK_SPIN_ON_OWNER=3Dy
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
CONFIG_QUEUED_SPINLOCKS=3Dy
CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
CONFIG_QUEUED_RWLOCKS=3Dy
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
CONFIG_FREEZER=3Dy

#
# Executable file formats
#
CONFIG_BINFMT_ELF=3Dy
CONFIG_ELFCORE=3Dy
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
CONFIG_BINFMT_SCRIPT=3Dy
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=3Dy
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=3Dy
# CONFIG_ZSWAP is not set

#
# Slab allocator options
#
CONFIG_SLUB=3Dy
CONFIG_SLAB_MERGE_DEFAULT=3Dy
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLAB_BUCKETS is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=3Dy
# CONFIG_RANDOM_KMALLOC_CACHES is not set
# end of Slab allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=3Dy
CONFIG_SPARSEMEM_EXTREME=3Dy
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
CONFIG_SPARSEMEM_VMEMMAP=3Dy
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=3Dy
CONFIG_ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP=3Dy
CONFIG_HAVE_GUP_FAST=3Dy
CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
CONFIG_SPLIT_PTE_PTLOCKS=3Dy
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
CONFIG_SPLIT_PMD_PTLOCKS=3Dy
CONFIG_COMPACTION=3Dy
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=3D1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=3Dy
CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
CONFIG_PCP_BATCH_SCALE_MAX=3D5
CONFIG_PHYS_ADDR_T_64BIT=3Dy
CONFIG_MMU_NOTIFIER=3Dy
CONFIG_KSM=3Dy
CONFIG_DEFAULT_MMAP_MIN_ADDR=3D65536
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
# CONFIG_MEMORY_FAILURE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
CONFIG_ARCH_WANTS_THP_SWAP=3Dy
CONFIG_TRANSPARENT_HUGEPAGE=3Dy
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
# CONFIG_TRANSPARENT_HUGEPAGE_NEVER is not set
CONFIG_THP_SWAP=3Dy
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_PGTABLE_HAS_HUGE_LEAVES=3Dy
CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP=3Dy
CONFIG_ARCH_SUPPORTS_PMD_PFNMAP=3Dy
CONFIG_ARCH_SUPPORTS_PUD_PFNMAP=3Dy
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=3Dy
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=3Dy
CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
CONFIG_ZONE_DMA=3Dy
CONFIG_ZONE_DMA32=3Dy
CONFIG_ARCH_USES_PG_ARCH_2=3Dy
CONFIG_VM_EVENT_COUNTERS=3Dy
# CONFIG_PERCPU_STATS is not set

#
# GUP_TEST needs to have DEBUG_FS enabled
#
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
CONFIG_MEMFD_CREATE=3Dy
CONFIG_SECRETMEM=3Dy
# CONFIG_ANON_VMA_NAME is not set
CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
CONFIG_USERFAULTFD=3Dy
CONFIG_PTE_MARKER_UFFD_WP=3Dy
CONFIG_LRU_GEN=3Dy
CONFIG_LRU_GEN_ENABLED=3Dy
# CONFIG_LRU_GEN_STATS is not set
CONFIG_LRU_GEN_WALKS_MMU=3Dy
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=3Dy
CONFIG_PER_VMA_LOCK=3Dy
CONFIG_LOCK_MM_AND_FIND_VMA=3Dy
CONFIG_IOMMU_MM_DATA=3Dy

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=3Dy
CONFIG_NET_INGRESS=3Dy
CONFIG_NET_EGRESS=3Dy
CONFIG_NET_XGRESS=3Dy
CONFIG_NET_DEVMEM=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
CONFIG_PACKET_DIAG=3Dy
CONFIG_UNIX=3Dy
CONFIG_AF_UNIX_OOB=3Dy
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=3Dy
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=3D16
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_DEFAULT_TCP_CONG=3D"cubic"
# CONFIG_TCP_AO is not set
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=3Dy
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
# CONFIG_IPV6_SIT is not set
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
CONFIG_NETLINK_DIAG=3Dy
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=3Dy
CONFIG_MAX_SKB_FRAGS=3D17
CONFIG_RPS=3Dy
# CONFIG_RFS_ACCEL is not set
CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
CONFIG_XPS=3Dy
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=3Dy
# CONFIG_BQL is not set
# CONFIG_BPF_STREAM_PARSER is not set
# CONFIG_NET_FLOW_LIMIT is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=3Dy
CONFIG_CFG80211=3Dy
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
CONFIG_CFG80211_DEFAULT_PS=3Dy
CONFIG_CFG80211_CRDA_SUPPORT=3Dy
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=3Dy
CONFIG_MAC80211_HAS_RC=3Dy
CONFIG_MAC80211_RC_MINSTREL=3Dy
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
# CONFIG_MAC80211_MESH is not set
# CONFIG_MAC80211_LEDS is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
CONFIG_RFKILL=3Dy
CONFIG_RFKILL_LEDS=3Dy
CONFIG_RFKILL_INPUT=3Dy
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SELFTESTS=3Dy
CONFIG_NET_SOCK_MSG=3Dy
CONFIG_PAGE_POOL=3Dy
# CONFIG_PAGE_POOL_STATS is not set
# CONFIG_FAILOVER is not set
CONFIG_ETHTOOL_NETLINK=3Dy

#
# Device Drivers
#
CONFIG_HAVE_PCI=3Dy
CONFIG_GENERIC_PCI_IOMAP=3Dy
CONFIG_PCI=3Dy
CONFIG_PCI_DOMAINS=3Dy
CONFIG_PCIEPORTBUS=3Dy
# CONFIG_HOTPLUG_PCI_PCIE is not set
CONFIG_PCIEAER=3Dy
# CONFIG_PCIEAER_INJECT is not set
# CONFIG_PCIE_ECRC is not set
CONFIG_PCIEASPM=3Dy
CONFIG_PCIEASPM_DEFAULT=3Dy
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=3Dy
# CONFIG_PCIE_DPC is not set
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=3Dy
CONFIG_PCI_QUIRKS=3Dy
# CONFIG_PCI_STUB is not set
CONFIG_PCI_ATS=3Dy
CONFIG_PCI_LOCKLESS_CONFIG=3Dy
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_NPEM is not set
CONFIG_PCI_PRI=3Dy
CONFIG_PCI_PASID=3Dy
CONFIG_PCI_LABEL=3Dy
CONFIG_VGA_ARB=3Dy
CONFIG_VGA_ARB_MAX_GPUS=3D1
CONFIG_HOTPLUG_PCI=3Dy
# CONFIG_HOTPLUG_PCI_ACPI is not set
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
# CONFIG_VMD is not set

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_DW_PLAT_HOST is not set
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers

#
# PLDA-based PCIe controllers
#
# end of PLDA-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=3Dy
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_DEVTMPFS_SAFE=3Dy
CONFIG_STANDALONE=3Dy
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy

#
# Firmware loader
#
CONFIG_FW_LOADER=3Dy
CONFIG_EXTRA_FIRMWARE=3D""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=3Dy
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=3Dy
CONFIG_GENERIC_CPU_DEVICES=3Dy
CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
CONFIG_REGMAP=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Cache Drivers
#
# end of Cache Drivers

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=3Dy
CONFIG_DMIID=3Dy
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_SYSFB=3Dy
CONFIG_SYSFB_SIMPLEFB=3Dy
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=3Dy
CONFIG_EFI_DXE_MEM_ATTRIBUTES=3Dy
CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
CONFIG_EFI_DISABLE_PCI_DMA=3Dy
# CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is not set
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

#
# Qualcomm firmware drivers
#
# end of Qualcomm firmware drivers

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
# CONFIG_PARPORT is not set
CONFIG_PNP=3Dy
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=3Dy
CONFIG_BLK_DEV=3Dy
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=3Dy
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=3Dy
CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=3Dy
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=3Dy
CONFIG_INTEL_MEI_ME=3Dy
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
# CONFIG_PVPANIC is not set
# CONFIG_KEBA_CP500 is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=3Dy
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=3Dy
CONFIG_SCSI=3Dy
CONFIG_SCSI_DMA=3Dy
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dy
# CONFIG_CHR_DEV_ST is not set
CONFIG_BLK_DEV_SR=3Dy
CONFIG_CHR_DEV_SG=3Dy
CONFIG_BLK_DEV_BSG=3Dy
# CONFIG_CHR_DEV_SCH is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=3Dy
CONFIG_SATA_HOST=3Dy
CONFIG_PATA_TIMINGS=3Dy
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=3Dy
CONFIG_ATA_ACPI=3Dy
# CONFIG_SATA_ZPODD is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=3Dy
CONFIG_SATA_MOBILE_LPM_POLICY=3D3
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=3Dy
# CONFIG_NET_CORE is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=3Dy
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
# CONFIG_NET_VENDOR_AMAZON is not set
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ASIX is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_CX_ECAT is not set
# CONFIG_NET_VENDOR_BROADCOM is not set
# CONFIG_NET_VENDOR_CADENCE is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CISCO is not set
# CONFIG_NET_VENDOR_CORTINA is not set
# CONFIG_NET_VENDOR_DAVICOM is not set
# CONFIG_DNET is not set
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_ENGLEDER is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
# CONFIG_NET_VENDOR_FUNGIBLE is not set
# CONFIG_NET_VENDOR_GOOGLE is not set
# CONFIG_NET_VENDOR_HUAWEI is not set
# CONFIG_NET_VENDOR_INTEL is not set
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_LITEX is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_META is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
# CONFIG_NET_VENDOR_MICROSEMI is not set
# CONFIG_NET_VENDOR_MICROSOFT is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NI is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETERION is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
# CONFIG_NET_VENDOR_PENSANDO is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=3Dy
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=3Dy
# CONFIG_RTASE is not set
# CONFIG_NET_VENDOR_RENESAS is not set
# CONFIG_NET_VENDOR_ROCKER is not set
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VERTEXCOM is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WANGXUN is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_XILINX is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PHYLIB=3Dy
CONFIG_SWPHY=3Dy
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=3Dy

#
# MII PHY device drivers
#
# CONFIG_AIR_EN8811H_PHY is not set
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88Q2XXX_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_T1S_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QCA83XX_PHY is not set
# CONFIG_QCA808X_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=3Dy
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_DP83TG720_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_MDIO_DEVICE=3Dy
CONFIG_MDIO_BUS=3Dy
CONFIG_FWNODE_MDIO=3Dy
CONFIG_ACPI_MDIO=3Dy
CONFIG_MDIO_DEVRES=3Dy
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# CONFIG_PCS_XPCS is not set
# end of PCS device drivers

# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_USB_NET_DRIVERS is not set
CONFIG_WLAN=3Dy
# CONFIG_WLAN_VENDOR_ADMTEK is not set
# CONFIG_WLAN_VENDOR_ATH is not set
# CONFIG_WLAN_VENDOR_ATMEL is not set
# CONFIG_WLAN_VENDOR_BROADCOM is not set
# CONFIG_WLAN_VENDOR_INTEL is not set
# CONFIG_WLAN_VENDOR_INTERSIL is not set
# CONFIG_WLAN_VENDOR_MARVELL is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
# CONFIG_WLAN_VENDOR_MICROCHIP is not set
# CONFIG_WLAN_VENDOR_PURELIFI is not set
CONFIG_WLAN_VENDOR_RALINK=3Dy
CONFIG_RT2X00=3Dy
# CONFIG_RT2400PCI is not set
# CONFIG_RT2500PCI is not set
# CONFIG_RT61PCI is not set
CONFIG_RT2800PCI=3Dy
# CONFIG_RT2800PCI_RT33XX is not set
# CONFIG_RT2800PCI_RT35XX is not set
# CONFIG_RT2800PCI_RT53XX is not set
# CONFIG_RT2800PCI_RT3290 is not set
# CONFIG_RT2500USB is not set
# CONFIG_RT73USB is not set
# CONFIG_RT2800USB is not set
CONFIG_RT2800_LIB=3Dy
CONFIG_RT2800_LIB_MMIO=3Dy
CONFIG_RT2X00_LIB_MMIO=3Dy
CONFIG_RT2X00_LIB_PCI=3Dy
CONFIG_RT2X00_LIB=3Dy
CONFIG_RT2X00_LIB_FIRMWARE=3Dy
CONFIG_RT2X00_LIB_CRYPTO=3Dy
CONFIG_RT2X00_LIB_LEDS=3Dy
# CONFIG_RT2X00_DEBUG is not set
# CONFIG_WLAN_VENDOR_REALTEK is not set
# CONFIG_WLAN_VENDOR_RSI is not set
# CONFIG_WLAN_VENDOR_SILABS is not set
# CONFIG_WLAN_VENDOR_ST is not set
# CONFIG_WLAN_VENDOR_TI is not set
# CONFIG_WLAN_VENDOR_ZYDAS is not set
# CONFIG_WLAN_VENDOR_QUANTENNA is not set
# CONFIG_MAC80211_HWSIM is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NET_FAILOVER is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=3Dy
CONFIG_INPUT_LEDS=3Dy
CONFIG_INPUT_FF_MEMLESS=3Dy
CONFIG_INPUT_SPARSEKMAP=3Dy
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=3Dy

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=3Dy
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=3Dy
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=3Dy
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=3Dy
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_PCSPKR=3Dy
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_APANEL is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
# CONFIG_INPUT_UINPUT is not set
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_IQS7222 is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=3Dy
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
CONFIG_SERIO_I8042=3Dy
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=3Dy
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=3Dy
CONFIG_VT=3Dy
CONFIG_CONSOLE_TRANSLATIONS=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_VT_CONSOLE_SLEEP=3Dy
CONFIG_VT_HW_CONSOLE_BINDING=3Dy
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# end of Serial drivers

# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=3Dy
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=3Dy
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=3Dy
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
# CONFIG_DEVPORT is not set
CONFIG_HPET=3Dy
# CONFIG_HPET_MMAP is not set
# CONFIG_HANGCHECK_TIMER is not set
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=3Dy
CONFIG_ACPI_I2C_OPREGION=3Dy
CONFIG_I2C_BOARDINFO=3Dy
CONFIG_I2C_CHARDEV=3Dy
# CONFIG_I2C_MUX is not set
CONFIG_I2C_HELPER_AUTO=3Dy
CONFIG_I2C_SMBUS=3Dy
CONFIG_I2C_ALGOBIT=3Dy

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=3Dy
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set
# CONFIG_I2C_ZHAOXIN is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_DESIGNWARE_CORE is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
# CONFIG_GPIOLIB is not set
# CONFIG_W1 is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SEQUENCING is not set
CONFIG_POWER_SUPPLY=3Dy
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=3Dy
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1720X is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
# CONFIG_FUEL_GAUGE_MM8013 is not set
CONFIG_HWMON=3Dy
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_ASUS_ROG_RYUJIN is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
# CONFIG_SENSORS_APPLESMC is not set
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_CHIPCAP2 is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DELL_SMM is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_FSCHMD is not set
# CONFIG_SENSORS_FTSTEUTATES is not set
# CONFIG_SENSORS_GIGABYTE_WATERFORCE is not set
# CONFIG_SENSORS_GL518SM is not set
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
# CONFIG_SENSORS_HS3001 is not set
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWERZ is not set
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LENOVO_EC is not set
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2991 is not set
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4260 is not set
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_LTC4282 is not set
# CONFIG_SENSORS_MAX127 is not set
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_MAX31827 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NCT6683 is not set
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_KRAKEN3 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_PT5161L is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_DME1737 is not set
# CONFIG_SENSORS_EMC1403 is not set
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_ADC128D818 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_SPD5118 is not set
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
# CONFIG_SENSORS_VIA_CPUTEMP is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83773G is not set
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=3Dy
CONFIG_SENSORS_ATK0110=3Dy
CONFIG_SENSORS_ASUS_WMI=3Dy
# CONFIG_SENSORS_ASUS_EC is not set
# CONFIG_SENSORS_HP_WMI is not set
CONFIG_THERMAL=3Dy
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
CONFIG_THERMAL_HWMON=3Dy
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=3Dy
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=3Dy
CONFIG_INTEL_TCC=3Dy
CONFIG_X86_PKG_TEMP_THERMAL=3Dy
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=3Dy
CONFIG_WATCHDOG_CORE=3Dy
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_LENOVO_SE10_WDT is not set
CONFIG_WDAT_WDT=3Dy
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_IBMASR is not set
# CONFIG_WAFER_WDT is not set
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
CONFIG_ITCO_WDT=3Dy
# CONFIG_ITCO_VENDOR_SUPPORT is not set
# CONFIG_IT8712F_WDT is not set
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
# CONFIG_NV_TCO is not set
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
# CONFIG_SMSC_SCH311X_WDT is not set
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83877F_WDT is not set
# CONFIG_W83977F_WDT is not set
# CONFIG_MACHZ_WDT is not set
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
# CONFIG_INTEL_MEI_WDT is not set
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=3Dy
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=3Dy
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=3Dy
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CS42L43_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
CONFIG_LPC_ICH=3Dy
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77541 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS6594_I2C is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_CS40L50_I2C is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
# CONFIG_RC_CORE is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=3Dy
CONFIG_SCREEN_INFO=3Dy
CONFIG_VIDEO=3Dy
# CONFIG_AUXDISPLAY is not set
# CONFIG_AGP is not set
CONFIG_DRM=3Dy
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KMS_HELPER=3Dy
CONFIG_DRM_DRAW=3Dy
CONFIG_DRM_PANIC=3Dy
CONFIG_DRM_PANIC_FOREGROUND_COLOR=3D0xffffff
CONFIG_DRM_PANIC_BACKGROUND_COLOR=3D0x000000
CONFIG_DRM_PANIC_SCREEN=3D"kmsg"
CONFIG_DRM_CLIENT_SELECTION=3Dy
CONFIG_DRM_CLIENT_SETUP=3Dy
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_DRM_FBDEV_OVERALLOC=3D100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=3Dy
# CONFIG_DRM_DISPLAY_DP_AUX_CEC is not set
# CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV is not set
CONFIG_DRM_DISPLAY_DP_HELPER=3Dy
CONFIG_DRM_DISPLAY_HDMI_HELPER=3Dy
CONFIG_DRM_TTM=3Dy
CONFIG_DRM_EXEC=3Dy
CONFIG_DRM_GPUVM=3Dy
CONFIG_DRM_TTM_HELPER=3Dy
CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
CONFIG_DRM_SCHED=3Dy

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=3Dy
CONFIG_DRM_I2C_SIL164=3Dy
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
CONFIG_DRM_NOUVEAU=3Dy
CONFIG_NOUVEAU_DEBUG=3D7
CONFIG_NOUVEAU_DEBUG_DEFAULT=3D7
CONFIG_NOUVEAU_DEBUG_MMU=3Dy
CONFIG_NOUVEAU_DEBUG_PUSH=3Dy
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
# CONFIG_DRM_NOUVEAU_GSP_DEFAULT is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_XE is not set
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
CONFIG_DRM_PANEL=3Dy

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=3Dy
CONFIG_DRM_PANEL_BRIDGE=3Dy

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_GM12U320 is not set
CONFIG_DRM_SIMPLEDRM=3Dy
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy

#
# Frame buffer Devices
#
# CONFIG_FB is not set
CONFIG_FB_CORE=3Dy
# CONFIG_FB_DEVICE is not set
CONFIG_FB_SYS_FILLRECT=3Dy
CONFIG_FB_SYS_COPYAREA=3Dy
CONFIG_FB_SYS_IMAGEBLIT=3Dy
CONFIG_FB_SYSMEM_FOPS=3Dy
CONFIG_FB_DEFERRED_IO=3Dy
CONFIG_FB_SYSMEM_HELPERS=3Dy
CONFIG_FB_SYSMEM_HELPERS_DEFERRED=3Dy
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
# CONFIG_BACKLIGHT_KTD2801 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3509 is not set
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=3Dy

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
CONFIG_DUMMY_CONSOLE_ROWS=3D25
CONFIG_FRAMEBUFFER_CONSOLE=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=3Dy
CONFIG_SND=3Dy
CONFIG_SND_TIMER=3Dy
CONFIG_SND_PCM=3Dy
CONFIG_SND_SEQ_DEVICE=3Dy
CONFIG_SND_JACK=3Dy
CONFIG_SND_JACK_INPUT_DEV=3Dy
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=3Dy
CONFIG_SND_HRTIMER=3Dy
CONFIG_SND_DYNAMIC_MINORS=3Dy
CONFIG_SND_MAX_CARDS=3D32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=3Dy
# CONFIG_SND_VERBOSE_PROCFS is not set
CONFIG_SND_CTL_FAST_LOOKUP=3Dy
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
# CONFIG_SND_UTIMER is not set
CONFIG_SND_VMASTER=3Dy
CONFIG_SND_DMA_SGBUF=3Dy
CONFIG_SND_CTL_LED=3Dy
CONFIG_SND_SEQUENCER=3Dy
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
# CONFIG_SND_SEQ_UMP is not set
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=3Dy
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=3Dy
CONFIG_SND_HDA_GENERIC_LEDS=3Dy
CONFIG_SND_HDA_INTEL=3Dy
# CONFIG_SND_HDA_HWDEP is not set
# CONFIG_SND_HDA_RECONFIG is not set
# CONFIG_SND_HDA_INPUT_BEEP is not set
# CONFIG_SND_HDA_PATCH_LOADER is not set
CONFIG_SND_HDA_SCODEC_COMPONENT=3Dy
CONFIG_SND_HDA_CODEC_REALTEK=3Dy
# CONFIG_SND_HDA_CODEC_ANALOG is not set
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
# CONFIG_SND_HDA_CODEC_VIA is not set
CONFIG_SND_HDA_CODEC_HDMI=3Dy
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
# CONFIG_SND_HDA_CODEC_CS8409 is not set
# CONFIG_SND_HDA_CODEC_CONEXANT is not set
# CONFIG_SND_HDA_CODEC_SENARYTECH is not set
# CONFIG_SND_HDA_CODEC_CA0110 is not set
# CONFIG_SND_HDA_CODEC_CA0132 is not set
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=3Dy
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=3D1
# CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
# CONFIG_SND_HDA_CTL_DEV_ID is not set
# end of HD-Audio

CONFIG_SND_HDA_CORE=3Dy
CONFIG_SND_HDA_COMPONENT=3Dy
CONFIG_SND_HDA_PREALLOC_SIZE=3D0
CONFIG_SND_INTEL_NHLT=3Dy
CONFIG_SND_INTEL_DSP_CONFIG=3Dy
CONFIG_SND_INTEL_SOUNDWIRE_ACPI=3Dy
# CONFIG_SND_USB is not set
# CONFIG_SND_SOC is not set
# CONFIG_SND_X86 is not set
CONFIG_HID_SUPPORT=3Dy
CONFIG_HID=3Dy
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=3Dy
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=3Dy

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_FT260 is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GOOGLE_STADIA_FF is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LETSKETCH is not set
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_UNIVERSAL_PIDFF is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_WINWING is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=3Dy
CONFIG_HID_PID=3Dy
CONFIG_USB_HIDDEV=3Dy
# end of USB HID support

# CONFIG_I2C_HID is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_COMMON=3Dy
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB=3Dy
CONFIG_USB_PCI=3Dy
# CONFIG_USB_PCI_AMD is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=3Dy
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=3D2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=3D1
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=3Dy
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=3Dy
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=3Dy
# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
CONFIG_USB_EHCI_PCI=3Dy
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
# CONFIG_USB_UHCI_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=3Dy
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
CONFIG_USB_UAS=3Dy

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_LJCA is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=3Dy
CONFIG_LEDS_CLASS=3Dy
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
# CONFIG_LEDS_AW200XX is not set
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_PCA995X is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THI=
NGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_MLXCPLD is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=3Dy
# CONFIG_LEDS_TRIGGER_TIMER is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_TTY is not set
# CONFIG_LEDS_TRIGGER_INPUT_EVENTS is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=3Dy
CONFIG_EDAC_SUPPORT=3Dy
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=3Dy
CONFIG_RTC_MC146818_LIB=3Dy
CONFIG_RTC_CLASS=3Dy
CONFIG_RTC_HCTOSYS=3Dy
CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
CONFIG_RTC_SYSTOHC=3Dy
CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=3Dy

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=3Dy
CONFIG_RTC_INTF_PROC=3Dy
CONFIG_RTC_INTF_DEV=3Dy
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
# CONFIG_RTC_DRV_DS1307 is not set
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_RS5C372 is not set
# CONFIG_RTC_DRV_ISL1208 is not set
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
# CONFIG_RTC_DRV_RX8111 is not set
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD2405AL is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=3Dy

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=3Dy
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_RP5C01 is not set

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=3Dy
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_X86_PLATFORM_DEVICES=3Dy
CONFIG_ACPI_WMI=3Dy
# CONFIG_WMI_BMOF is not set
# CONFIG_HUAWEI_WMI is not set
CONFIG_MXM_WMI=3Dy
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK is not set
# CONFIG_ACERHDF is not set
# CONFIG_ACER_WIRELESS is not set
# CONFIG_ACER_WMI is not set
# CONFIG_AMD_PMC is not set
# CONFIG_AMD_HSMP is not set
# CONFIG_AMD_WBRF is not set
# CONFIG_ADV_SWBUTTON is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_WMI is not set
# CONFIG_EEEPC_LAPTOP is not set
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
# CONFIG_AMILO_RFKILL is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
# CONFIG_IDEAPAD_LAPTOP is not set
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
# CONFIG_INTEL_WMI_THUNDERBOLT is not set

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_OAKTRAIL is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_VSEC is not set
# CONFIG_ACPI_QUICKSTART is not set
# CONFIG_MSI_EC is not set
# CONFIG_MSI_LAPTOP is not set
# CONFIG_MSI_WMI is not set
# CONFIG_MSI_WMI_PLATFORM is not set
# CONFIG_SAMSUNG_LAPTOP is not set
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_COMPAL_LAPTOP is not set
# CONFIG_LG_LAPTOP is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_SONY_LAPTOP is not set
# CONFIG_SYSTEM76_ACPI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INSPUR_PLATFORM_PROFILE is not set
# CONFIG_LENOVO_WMI_CAMERA is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=3Dy
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=3Dy
CONFIG_I8253_LOCK=3Dy
CONFIG_CLKBLD_I8253=3Dy
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=3Dy
CONFIG_IOMMU_API=3Dy
CONFIG_IOMMU_SUPPORT=3Dy

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=3Dy
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=3Dy
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=3Dy
CONFIG_IOMMU_SVA=3Dy
CONFIG_IOMMU_IOPF=3Dy
CONFIG_AMD_IOMMU=3Dy
CONFIG_DMAR_TABLE=3Dy
CONFIG_INTEL_IOMMU=3Dy
# CONFIG_INTEL_IOMMU_SVM is not set
CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=3Dy
CONFIG_INTEL_IOMMU_PERF_EVENTS=3Dy
# CONFIG_IOMMUFD is not set
# CONFIG_IRQ_REMAP is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#

#
# Amlogic PM Domains
#
# end of Amlogic PM Domains

#
# Broadcom PM Domains
#
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# end of i.MX PM Domains

#
# Qualcomm PM Domains
#
# end of Qualcomm PM Domains
# end of PM Domains

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_DWC_PCIE_PMU is not set
# end of Performance monitor support

CONFIG_RAS=3Dy
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=3Dy
CONFIG_NVMEM_SYSFS=3Dy
# CONFIG_NVMEM_LAYOUTS is not set
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=3Dy
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=3Dy
CONFIG_BUFFER_HEAD=3Dy
CONFIG_LEGACY_DIRECT_IO=3Dy
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
CONFIG_BTRFS_FS=3Dy
CONFIG_BTRFS_FS_POSIX_ACL=3Dy
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
# CONFIG_BCACHEFS_FS is not set
CONFIG_FS_POSIX_ACL=3Dy
CONFIG_EXPORTFS=3Dy
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=3Dy
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=3Dy
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=3Dy
CONFIG_FANOTIFY=3Dy
# CONFIG_QUOTA is not set
CONFIG_AUTOFS_FS=3Dy
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=3Dy
CONFIG_JOLIET=3Dy
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=3Dy
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=3Dy
CONFIG_MSDOS_FS=3Dy
CONFIG_VFAT_FS=3Dy
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=3Dy
CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
CONFIG_NTFS3_FS=3Dy
# CONFIG_NTFS3_64BIT_CLUSTER is not set
# CONFIG_NTFS3_LZX_XPRESS is not set
# CONFIG_NTFS3_FS_POSIX_ACL is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=3Dy
CONFIG_PROC_PAGE_MONITOR=3Dy
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=3Dy
CONFIG_KERNFS=3Dy
CONFIG_SYSFS=3Dy
CONFIG_TMPFS=3Dy
CONFIG_TMPFS_POSIX_ACL=3Dy
CONFIG_TMPFS_XATTR=3Dy
# CONFIG_TMPFS_INODE64 is not set
# CONFIG_TMPFS_QUOTA is not set
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
# CONFIG_CONFIGFS_FS is not set
CONFIG_EFIVAR_FS=3Dy
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"utf8"
CONFIG_NLS_CODEPAGE_437=3Dy
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=3Dy
CONFIG_NLS_ISO8859_1=3Dy
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=3Dy
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=3Dy
# end of File systems

#
# Security options
#
CONFIG_KEYS=3Dy
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_PROC_MEM_ALWAYS_FORCE=3Dy
# CONFIG_PROC_MEM_FORCE_PTRACE is not set
# CONFIG_PROC_MEM_NO_FORCE is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
# CONFIG_INTEL_TXT is not set
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_DEFAULT_SECURITY_DAC=3Dy

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=3Dy
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=3Dy
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=3Dy
CONFIG_INIT_STACK_NONE=3Dy
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=3Dy
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

#
# Hardening of kernel data structures
#
# CONFIG_LIST_HARDENED is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Hardening of kernel data structures

CONFIG_RANDSTRUCT_NONE=3Dy
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=3Dy
CONFIG_CRYPTO=3Dy

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=3Dy
CONFIG_CRYPTO_ALGAPI2=3Dy
CONFIG_CRYPTO_AEAD=3Dy
CONFIG_CRYPTO_AEAD2=3Dy
CONFIG_CRYPTO_SIG=3Dy
CONFIG_CRYPTO_SIG2=3Dy
CONFIG_CRYPTO_SKCIPHER=3Dy
CONFIG_CRYPTO_SKCIPHER2=3Dy
CONFIG_CRYPTO_HASH=3Dy
CONFIG_CRYPTO_HASH2=3Dy
CONFIG_CRYPTO_RNG2=3Dy
CONFIG_CRYPTO_AKCIPHER2=3Dy
CONFIG_CRYPTO_AKCIPHER=3Dy
CONFIG_CRYPTO_KPP2=3Dy
CONFIG_CRYPTO_ACOMP2=3Dy
CONFIG_CRYPTO_MANAGER=3Dy
CONFIG_CRYPTO_MANAGER2=3Dy
# CONFIG_CRYPTO_USER is not set
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_NULL=3Dy
CONFIG_CRYPTO_NULL2=3Dy
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=3Dy
# CONFIG_CRYPTO_AUTHENC is not set
CONFIG_CRYPTO_SIMD=3Dy
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=3Dy
# CONFIG_CRYPTO_DH is not set
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=3Dy
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4_GENERIC is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_ARC4 is not set
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_CBC is not set
CONFIG_CRYPTO_CTR=3Dy
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=3Dy
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=3Dy
CONFIG_CRYPTO_GCM=3Dy
# CONFIG_CRYPTO_SEQIV is not set
# CONFIG_CRYPTO_ECHAINIV is not set
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=3Dy
CONFIG_CRYPTO_CMAC=3Dy
CONFIG_CRYPTO_GHASH=3Dy
CONFIG_CRYPTO_HMAC=3Dy
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_SHA1 is not set
CONFIG_CRYPTO_SHA256=3Dy
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
# CONFIG_CRYPTO_VMAC is not set
# CONFIG_CRYPTO_WP512 is not set
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=3Dy
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=3Dy
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_CRCT10DIF is not set
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=3Dy
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
# CONFIG_CRYPTO_DRBG_MENU is not set
# CONFIG_CRYPTO_JITTERENTROPY is not set
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=3Dy
CONFIG_CRYPTO_USER_API_HASH=3Dy
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=3Dy

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=3Dy
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
# CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
# CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_TWOFISH_X86_64 is not set
# CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
CONFIG_CRYPTO_BLAKE2S_X86=3Dy
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_SHA1_SSSE3 is not set
CONFIG_CRYPTO_SHA256_SSSE3=3Dy
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
CONFIG_CRYPTO_CRC32C_INTEL=3Dy
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
CONFIG_X509_CERTIFICATE_PARSER=3Dy
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=3Dy
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
CONFIG_SYSTEM_TRUSTED_KEYS=3D""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=3Dy

#
# Library routines
#
CONFIG_RAID6_PQ=3Dy
# CONFIG_RAID6_PQ_BENCHMARK is not set
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=3Dy
CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
CONFIG_GENERIC_STRNLEN_USER=3Dy
CONFIG_GENERIC_NET_UTILS=3Dy
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_GENERIC_IOMAP=3Dy
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=3Dy
CONFIG_CRYPTO_LIB_AES=3Dy
CONFIG_CRYPTO_LIB_ARC4=3Dy
CONFIG_CRYPTO_LIB_GF128MUL=3Dy
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=3Dy
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=3Dy
CONFIG_CRYPTO_LIB_SHA256=3Dy
# end of Crypto library routines

CONFIG_CRC_CCITT=3Dy
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=3Dy
CONFIG_CRC32=3Dy
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=3Dy
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=3Dy
# CONFIG_CRC8 is not set
CONFIG_XXHASH=3Dy
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dy
CONFIG_LZO_COMPRESS=3Dy
CONFIG_LZO_DECOMPRESS=3Dy
CONFIG_ZSTD_COMMON=3Dy
CONFIG_ZSTD_COMPRESS=3Dy
CONFIG_ZSTD_DECOMPRESS=3Dy
# CONFIG_XZ_DEC is not set
CONFIG_DECOMPRESS_ZSTD=3Dy
CONFIG_GENERIC_ALLOCATOR=3Dy
CONFIG_INTERVAL_TREE=3Dy
CONFIG_XARRAY_MULTI=3Dy
CONFIG_ASSOCIATIVE_ARRAY=3Dy
CONFIG_HAS_IOMEM=3Dy
CONFIG_HAS_IOPORT=3Dy
CONFIG_HAS_IOPORT_MAP=3Dy
CONFIG_HAS_DMA=3Dy
CONFIG_DMA_OPS_HELPERS=3Dy
CONFIG_NEED_SG_DMA_FLAGS=3Dy
CONFIG_NEED_SG_DMA_LENGTH=3Dy
CONFIG_NEED_DMA_MAP_STATE=3Dy
CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
CONFIG_SWIOTLB=3Dy
# CONFIG_SWIOTLB_DYNAMIC is not set
CONFIG_DMA_NEED_SYNC=3Dy
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=3Dy
CONFIG_CHECK_SIGNATURE=3Dy
CONFIG_GLOB=3Dy
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=3Dy
CONFIG_CLZ_TAB=3Dy
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=3Dy
CONFIG_DIMLIB=3Dy
CONFIG_OID_REGISTRY=3Dy
CONFIG_UCS2_STRING=3Dy
CONFIG_HAVE_GENERIC_VDSO=3Dy
CONFIG_GENERIC_GETTIMEOFDAY=3Dy
CONFIG_GENERIC_VDSO_TIME_NS=3Dy
CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT=3Dy
CONFIG_VDSO_GETRANDOM=3Dy
CONFIG_FONT_SUPPORT=3Dy
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=3Dy
CONFIG_FONT_8x16=3Dy
CONFIG_SG_POOL=3Dy
CONFIG_ARCH_HAS_PMEM_API=3Dy
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=3Dy
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
CONFIG_ARCH_HAS_COPY_MC=3Dy
CONFIG_ARCH_STACKWALK=3Dy
CONFIG_STACKDEPOT=3Dy
CONFIG_STACKDEPOT_MAX_FRAMES=3D64
CONFIG_SBITMAP=3Dy
# CONFIG_LWQ_TEST is not set
# end of Library routines

CONFIG_FIRMWARE_TABLE=3Dy

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=3Dy
# end of printk and dmesg options

# CONFIG_DEBUG_KERNEL is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_ULEB128=3Dy
CONFIG_FRAME_WARN=3D2048
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
# CONFIG_DEBUG_SECTION_MISMATCH is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
CONFIG_OBJTOOL=3Dy
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_FS is not set
CONFIG_HAVE_ARCH_KGDB=3Dy
CONFIG_ARCH_HAS_UBSAN=3Dy
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=3Dy
CONFIG_HAVE_KCSAN_COMPILER=3Dy
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
CONFIG_SLUB_DEBUG=3Dy
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=3Dy
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=3Dy
CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
# CONFIG_PER_VMA_LOCK_STATS is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
CONFIG_DEBUG_MEMORY_INIT=3Dy
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
# CONFIG_MEM_ALLOC_PROFILING is not set
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
CONFIG_CC_HAS_KASAN_SW_TAGS=3Dy
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=3Dy
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=3Dy
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=3D0
CONFIG_PANIC_TIMEOUT=3D0
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=3Dy
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set

#
# Debug kernel data structures
#
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=3D0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# end of RCU Debugging

CONFIG_USER_STACKTRACE_SUPPORT=3Dy
CONFIG_HAVE_RETHOOK=3Dy
CONFIG_HAVE_FUNCTION_TRACER=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=3Dy
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
CONFIG_HAVE_FENTRY=3Dy
CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=3Dy
CONFIG_HAVE_C_RECORDMCOUNT=3Dy
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=3Dy
CONFIG_TRACING_SUPPORT=3Dy
# CONFIG_FTRACE is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy

#
# x86 Debugging
#
# CONFIG_X86_VERBOSE_BOOTUP is not set
CONFIG_EARLY_PRINTK=3Dy
# CONFIG_EARLY_PRINTK_DBGP is not set
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
# CONFIG_EFI_PGT_DUMP is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=3Dy
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=3Dy
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_ARCH_HAS_KCOV=3Dy
CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=3Dy
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Gentoo Linux
#
CONFIG_GENTOO_LINUX=3Dy
CONFIG_GENTOO_LINUX_UDEV=3Dy
CONFIG_GENTOO_LINUX_PORTAGE=3Dy

#
# Support for init systems, system and service managers
#
# CONFIG_GENTOO_LINUX_INIT_SCRIPT is not set
CONFIG_GENTOO_LINUX_INIT_SYSTEMD=3Dy
# end of Support for init systems, system and service managers

# CONFIG_GENTOO_KERNEL_SELF_PROTECTION is not set
# CONFIG_GENTOO_PRINT_FIRMWARE_INFO is not set
# end of Gentoo Linux

--MP_/c3OHXRZ7FLjFhPZc6e/er0/--

--Sig_/th79N.9wPHAR4=TgqfPsIdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iJEEARYKADkWIQQrBr++0IKNmWetZ2KFkteoWVvCXwUCaUDI6RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQhZLXqFlbwl/vVQD9G6Cjenl8yiMmBeSxZI/6
6wuXy03C4pNMLxuB7tE3ef8BAJIorlkbJEajCdBcPKS6fM1rj4T/diEydJqlEErA
C/sG
=H5/c
-----END PGP SIGNATURE-----

--Sig_/th79N.9wPHAR4=TgqfPsIdY--
