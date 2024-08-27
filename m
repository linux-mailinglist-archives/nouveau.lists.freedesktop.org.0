Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F10CBA9F3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7211410EA2F;
	Sat, 13 Dec 2025 12:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmx.com header.i=cletusstubbs@gmx.com header.b="UiXcuPDb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C960E10E046
 for <nouveau@lists.freedesktop.org>; Tue, 27 Aug 2024 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1724784399; x=1725389199; i=cletusstubbs@gmx.com;
 bh=LuOsER3uaj6xTLRnXHPqOSXvOTD+67IT6oz3FHEjiEE=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
 from:message-id:mime-version:reply-to:subject:to;
 b=UiXcuPDbI5CaO2MdrJ9wVY0ujRsceDPSCYS439ZxirTkdFq9Xrh80+Y8TvGTDeqc
 CBPrbadj5X/f4Al4j/LO4NUr2Qg8a/JphMJju807Krv396o0op99r3TrZ1yVINGjB
 asK8tD4BXdPFilrQJtODrIpGrqVIo2CKCEBIoTLaIhQd8jWNT/C641jqPBBiEO1T8
 dDAZfdecRhvQwUTbzT68ADElZ3Ylulya5jpvLeiZTBP9Vqt9fkjj5m8H1wHUbN1Ck
 KHsQPHcgNRFk26gxFFZtHGnzB6c0Ta+RmJJ7gm6l/RSwRu8iUQvSd0O0NtYG5IakA
 DBePcv1YL36w3CCQBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [185.207.249.217] ([185.207.249.217]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Tue, 27 Aug
 2024 20:46:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-d721522d-3522-4cf2-87b4-03eedc2ed51d-1724784399354@3c-app-mailcom-bs13>
From: cletus stubbs <cletusstubbs@gmx.com>
To: nouveau@lists.freedesktop.org
Subject: nouveau
Content-Type: multipart/mixed;
 boundary=kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46
Date: Tue, 27 Aug 2024 20:46:39 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:MyFmsY+JYb3UrK2dH36SdjH58r9AXCbniPAg7+tsR3le4aKZBljiv9KLxYBJBwAIhIbPo
 c/WbxrWalYvbKSREmsHqAgv73UP/9tM+rGKiWPltFfnPGDrnLbhuOYDoePXhvEaFH4Ri4OCIZHda
 jXuB7lg92PPjvevwWTAZ0b9vk4ymyYDFDwcnrdt9TXux0aDN1Kw3wZJlP71i6Lj4KXWVoGsj0Q9D
 74dY+1W4JjNd4HU3ouArFKGvatdNumaR/Nb2WpaFs0tU3LmJ1KZam5akb38mBLeLwrMMEMHNNrQ/
 Rs=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L2Uzjq7esDE=;tC66YjIYDaCvIbnuSYitDpliEAd
 lswUPcy+hlLoeN6meQ+9AvP5O0oowgRecAdD+cUU220JnjMnxgTNcgw0Poxodtb9SHDXkzKqG
 K7q5jL3HOIXyDHx5hfBvLuYIm+wIxxJpDE+zhNqq198ArQAJoqE8AX15V9+rFAzqxY6v8sSiu
 XxlQxaXKqkW43tB0XhUWhia9Pb1lIAXM5ZBRW67mgRQ+rbGsu73Xo80phJ3FmcozypSFQHOjY
 qyowFywjs/ggmrTRTwlpUAHIHXjaavCzheTqCkCp+gAsSXOs03XEie/+m5jvO4PF/OYlGQyOw
 1wlxtFNO4gVguObaEcSU76hXFfA/XeAri7RqSFN9q/5loHQhttw4b6Aeyq8xLXnEhErJszI+7
 hLEfqnQPIKyLoIB8c319Fcdmwm3+bEzZSvbptyXA0K9BbphYbpbKg2SCU3L4QccXDzshwxcHO
 NAeOlGLoRgNoPAa99R34MFPRCfzi6t/f50nKePuZEYqcyA3xdnDCd9eldtEEPucKsEX4FvBT8
 QQFoEqEuhvKbKV81jXprQmAhEtSMUtyzCVSgtOvzKolgy7HdlhSHQRPdfELZSPUAQPbFokict
 KTi5jhbF2klxFBJ+A1WOw8CS/+0PlR000tJsnoVsVSWRt44dCHSA8eEMvsY1MP04rApsURd9/
 t3sjSJhvHGZH94+kLZFSOlNP5RCwTG2RqhARnTIXVQ==
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div><span style="font-size:18px;">Hello,</span></div>

<div>&nbsp;</div>

<div><span style="font-size:18px;">I have loss of functionality: see screen shot - move to and copy to don&#39;t do anything.</span></div>

<div><span style="font-size:18px;">Very long boot times.</span></div>

<div><span style="font-size:18px;">You see from the logs what system I have.</span></div>

<div>&nbsp;</div>

<div><span style="font-size:18px;">assistance please,</span></div>

<div>&nbsp;</div>

<div><span style="font-size:18px;">the_whistler</span></div></div></body></html>
--kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46
Content-Type: text/plain
Content-Disposition: attachment; filename=kernel_log.txt
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.10.6-200.fc40.x86_64 (mockbuild@f1069ead281=
040288cd8d3761ad1265a) (gcc (GCC) 14.2.1 20240801 (Red Hat 14.2.1-1), GNU =
ld version 2.41-37.fc40) #1 SMP PREEMPT_DYNAMIC Mon Aug 19 14:09:30 UTC 20=
24
[    0.000000] Command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6-200.fc=
40.x86_64 root=3DUUID=3D59545c18-3923-4411-9c12-245ab6cee067 ro rootflags=
=3Dsubvol=3Droot rd.luks.uuid=3Dluks-49436d43-a842-4f89-a4aa-93ea838ffd01 =
rhgb quiet
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kerne=
l split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usab=
le
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000004cd14fff] usab=
le
[    0.000000] BIOS-e820: [mem 0x000000004cd15000-0x0000000050d10fff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000050d11000-0x0000000051571fff] ACPI=
 NVS
[    0.000000] BIOS-e820: [mem 0x0000000051572000-0x00000000517fefff] ACPI=
 data
[    0.000000] BIOS-e820: [mem 0x00000000517ff000-0x00000000517fffff] usab=
le
[    0.000000] BIOS-e820: [mem 0x0000000051800000-0x00000000561fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000056a00000-0x00000000607fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000c0000000-0x00000000cfffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000f9800000-0x00000000f9ffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed7ffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000089f7fffff] usab=
le
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x47003018-0x47012057] usable =3D=3D> usa=
ble
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009e=
fff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000047003=
017] usable
[    0.000000] reserve setup_data: [mem 0x0000000047003018-0x0000000047012=
057] usable
[    0.000000] reserve setup_data: [mem 0x0000000047012058-0x000000004cd14=
fff] usable
[    0.000000] reserve setup_data: [mem 0x000000004cd15000-0x0000000050d10=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000050d11000-0x0000000051571=
fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000051572000-0x00000000517fe=
fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000517ff000-0x00000000517ff=
fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000051800000-0x00000000561ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000056a00000-0x00000000607ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000c0000000-0x00000000cffff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f9800000-0x00000000f9fff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed20000-0x00000000fed7f=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000fffff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000089f7ff=
fff] usable
[    0.000000] efi: EFI v2.7 by Dell
[    0.000000] efi: ACPI=3D0x517fe000 ACPI 2.0=3D0x517fe014 SMBIOS=3D0x4d5=
a6000 TPMFinalLog=3D0x5147b000 ESRT=3D0x4d53e718 MEMATTR=3D0x470e2018 MOKv=
ar=3D0x4d5a5000 RNG=3D0x5173e018 TPMEventLog=3D0x47013018
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem102: MMIO range=3D[0xc0000000-0xcfffffff] (2=
56MB) from e820 map
[    0.000000] e820: remove [mem 0xc0000000-0xcfffffff] reserved
[    0.000000] efi: Remove mem103: MMIO range=3D[0xf9800000-0xf9ffffff] (8=
MB) from e820 map
[    0.000000] e820: remove [mem 0xf9800000-0xf9ffffff] reserved
[    0.000000] efi: Remove mem105: MMIO range=3D[0xff000000-0xffffffff] (1=
6MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.4 present.
[    0.000000] DMI: Dell Inc. Precision 3571/07K1M2, BIOS 1.25.0 07/12/202=
4
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 2700.000 MHz processor
[    0.000000] tsc: Detected 2688.000 MHz TSC
[    0.000005] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> res=
erved
[    0.000006] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000010] last_pfn =3D 0x89f800 max_arch_pfn =3D 0x400000000
[    0.000013] MTRR map: 5 entries (3 fixed + 2 variable; max 23), built f=
rom 10 variable MTRRs
[    0.000015] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- W=
T
[    0.000412] last_pfn =3D 0x51800 max_arch_pfn =3D 0x400000000
[    0.005094] esrt: Reserving ESRT space from 0x000000004d53e718 to 0x000=
000004d53e778.
[    0.005103] Using GB pages for direct mapping
[    0.005104] Incomplete global flushes, disabling PCID
[    0.005268] secureboot: Secure boot disabled
[    0.005268] RAMDISK: [mem 0x35005000-0x39c3afff]
[    0.005272] ACPI: Early table checksum verification disabled
[    0.005274] ACPI: RSDP 0x00000000517FE014 000024 (v02 DELL  )
[    0.005277] ACPI: XSDT 0x0000000051753188 00012C (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005281] ACPI: FACP 0x00000000517EE000 000114 (v06 DELL   Dell Inc 0=
0000002      01000013)
[    0.005284] ACPI: DSDT 0x0000000051777000 0734DE (v02 DELL   Dell Inc 0=
0000002      01000013)
[    0.005286] ACPI: FACS 0x00000000514BB000 000040
[    0.005288] ACPI: SSDT 0x00000000517FC000 00038C (v02 PmaxDv Pmax_Dev 0=
0000001 INTL 20200717)
[    0.005290] ACPI: SSDT 0x00000000517F6000 005C55 (v02 CpuRef CpuSsdt  0=
0003000 INTL 20200717)
[    0.005292] ACPI: SSDT 0x00000000517EF000 0066EB (v02 DptfTb DptfTabl 0=
0001000 INTL 20200717)
[    0.005294] ACPI: HPET 0x00000000517ED000 000038 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005296] ACPI: APIC 0x00000000517EC000 0001DC (v05 DELL   Dell Inc 0=
0000002      01000013)
[    0.005298] ACPI: MCFG 0x00000000517EB000 00003C (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005300] ACPI: SSDT 0x0000000051775000 001446 (v02 DELL   DellRtd3 0=
0001000 INTL 20200717)
[    0.005302] ACPI: SSDT 0x000000005176F000 00132D (v02 INTEL  IgfxSsdt 0=
0003000 INTL 20200717)
[    0.005304] ACPI: SSDT 0x0000000051761000 00D39F (v02 INTEL  TcssSsdt 0=
0001000 INTL 20200717)
[    0.005305] ACPI: NHLT 0x0000000051760000 0002F1 (v00 DELL   Dell Inc 0=
0000002      01000013)
[    0.005307] ACPI: SSDT 0x000000005175E000 00107C (v02 DELL   UsbCTabl 0=
0001000 INTL 20200717)
[    0.005309] ACPI: LPIT 0x000000005175D000 0000CC (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005311] ACPI: WSMT 0x000000005175C000 000028 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005313] ACPI: SSDT 0x000000005175B000 000B44 (v02 DELL   PtidDevc 0=
0001000 INTL 20200717)
[    0.005315] ACPI: SSDT 0x0000000051758000 002357 (v02 DELL   TbtTypeC 0=
0000000 INTL 20200717)
[    0.005317] ACPI: DBGP 0x0000000051757000 000034 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005318] ACPI: DBG2 0x0000000051756000 000054 (v00 DELL   Dell Inc 0=
0000002      01000013)
[    0.005320] ACPI: BOOT 0x0000000051755000 000028 (v01 DELL   CBX3     0=
0000002      01000013)
[    0.005322] ACPI: MSDM 0x0000000051754000 000055 (v03 DELL   CBX3     0=
6222004 AMI  00010013)
[    0.005324] ACPI: SSDT 0x00000000517FD000 00060E (v02 DELL   Tpm2Tabl 0=
0001000 INTL 20200717)
[    0.005326] ACPI: TPM2 0x0000000051752000 00004C (v04 DELL   Dell Inc 0=
0000002      01000013)
[    0.005328] ACPI: DMAR 0x0000000051751000 000088 (v02 INTEL  Dell Inc 0=
0000002      01000013)
[    0.005330] ACPI: SSDT 0x0000000051748000 0087EC (v02 DELL   NvdTable 0=
0001000 INTL 20200717)
[    0.005332] ACPI: SSDT 0x0000000051774000 000ECD (v02 DELL   xh_Dell_ 0=
0000000 INTL 20200717)
[    0.005334] ACPI: SSDT 0x0000000051744000 003AEA (v02 SocGpe SocGpe   0=
0003000 INTL 20200717)
[    0.005336] ACPI: SSDT 0x0000000051740000 0039DA (v02 SocCmn SocCmn   0=
0003000 INTL 20200717)
[    0.005338] ACPI: SSDT 0x0000000051773000 000144 (v02 Intel  ADebTabl 0=
0001000 INTL 20200717)
[    0.005340] ACPI: UEFI 0x0000000051432000 00063A (v01 INTEL  RstVmdE  0=
0000000 INTL 00000000)
[    0.005342] ACPI: UEFI 0x0000000051431000 00005C (v01 INTEL  RstVmdV  0=
0000000 INTL 00000000)
[    0.005344] ACPI: PHAT 0x0000000051772000 0005AD (v01 DELL   Dell Inc 0=
0000005 MSFT 0100000D)
[    0.005346] ACPI: BGRT 0x0000000051771000 000038 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005347] ACPI: FPDT 0x000000005173F000 000034 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005349] ACPI: Reserving FACP table memory at [mem 0x517ee000-0x517e=
e113]
[    0.005350] ACPI: Reserving DSDT table memory at [mem 0x51777000-0x517e=
a4dd]
[    0.005351] ACPI: Reserving FACS table memory at [mem 0x514bb000-0x514b=
b03f]
[    0.005351] ACPI: Reserving SSDT table memory at [mem 0x517fc000-0x517f=
c38b]
[    0.005352] ACPI: Reserving SSDT table memory at [mem 0x517f6000-0x517f=
bc54]
[    0.005352] ACPI: Reserving SSDT table memory at [mem 0x517ef000-0x517f=
56ea]
[    0.005353] ACPI: Reserving HPET table memory at [mem 0x517ed000-0x517e=
d037]
[    0.005353] ACPI: Reserving APIC table memory at [mem 0x517ec000-0x517e=
c1db]
[    0.005354] ACPI: Reserving MCFG table memory at [mem 0x517eb000-0x517e=
b03b]
[    0.005354] ACPI: Reserving SSDT table memory at [mem 0x51775000-0x5177=
6445]
[    0.005355] ACPI: Reserving SSDT table memory at [mem 0x5176f000-0x5177=
032c]
[    0.005355] ACPI: Reserving SSDT table memory at [mem 0x51761000-0x5176=
e39e]
[    0.005356] ACPI: Reserving NHLT table memory at [mem 0x51760000-0x5176=
02f0]
[    0.005356] ACPI: Reserving SSDT table memory at [mem 0x5175e000-0x5175=
f07b]
[    0.005357] ACPI: Reserving LPIT table memory at [mem 0x5175d000-0x5175=
d0cb]
[    0.005357] ACPI: Reserving WSMT table memory at [mem 0x5175c000-0x5175=
c027]
[    0.005358] ACPI: Reserving SSDT table memory at [mem 0x5175b000-0x5175=
bb43]
[    0.005358] ACPI: Reserving SSDT table memory at [mem 0x51758000-0x5175=
a356]
[    0.005359] ACPI: Reserving DBGP table memory at [mem 0x51757000-0x5175=
7033]
[    0.005359] ACPI: Reserving DBG2 table memory at [mem 0x51756000-0x5175=
6053]
[    0.005360] ACPI: Reserving BOOT table memory at [mem 0x51755000-0x5175=
5027]
[    0.005360] ACPI: Reserving MSDM table memory at [mem 0x51754000-0x5175=
4054]
[    0.005361] ACPI: Reserving SSDT table memory at [mem 0x517fd000-0x517f=
d60d]
[    0.005361] ACPI: Reserving TPM2 table memory at [mem 0x51752000-0x5175=
204b]
[    0.005362] ACPI: Reserving DMAR table memory at [mem 0x51751000-0x5175=
1087]
[    0.005362] ACPI: Reserving SSDT table memory at [mem 0x51748000-0x5175=
07eb]
[    0.005363] ACPI: Reserving SSDT table memory at [mem 0x51774000-0x5177=
4ecc]
[    0.005363] ACPI: Reserving SSDT table memory at [mem 0x51744000-0x5174=
7ae9]
[    0.005364] ACPI: Reserving SSDT table memory at [mem 0x51740000-0x5174=
39d9]
[    0.005364] ACPI: Reserving SSDT table memory at [mem 0x51773000-0x5177=
3143]
[    0.005365] ACPI: Reserving UEFI table memory at [mem 0x51432000-0x5143=
2639]
[    0.005365] ACPI: Reserving UEFI table memory at [mem 0x51431000-0x5143=
105b]
[    0.005366] ACPI: Reserving PHAT table memory at [mem 0x51772000-0x5177=
25ac]
[    0.005366] ACPI: Reserving BGRT table memory at [mem 0x51771000-0x5177=
1037]
[    0.005367] ACPI: Reserving FPDT table memory at [mem 0x5173f000-0x5173=
f033]
[    0.005730] No NUMA configuration found
[    0.005730] Faking a node at [mem 0x0000000000000000-0x000000089f7fffff=
]
[    0.005734] NODE_DATA(0) allocated [mem 0x89f7d5000-0x89f7fffff]
[    0.005862] Zone ranges:
[    0.005862]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005863]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005864]   Normal   [mem 0x0000000100000000-0x000000089f7fffff]
[    0.005865]   Device   empty
[    0.005866] Movable zone start for each node
[    0.005867] Early memory node ranges
[    0.005867]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005868]   node   0: [mem 0x0000000000100000-0x000000004cd14fff]
[    0.005869]   node   0: [mem 0x00000000517ff000-0x00000000517fffff]
[    0.005869]   node   0: [mem 0x0000000100000000-0x000000089f7fffff]
[    0.005871] Initmem setup node 0 [mem 0x0000000000001000-0x000000089f7f=
ffff]
[    0.005875] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005893] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007382] On node 0, zone DMA32: 19178 pages in unavailable ranges
[    0.043567] On node 0, zone Normal: 26624 pages in unavailable ranges
[    0.043580] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.043637] Reserving Intel graphics memory at [mem 0x5c800000-0x607fff=
ff]
[    0.044491] ACPI: PM-Timer IO Port: 0x1808
[    0.044497] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.044498] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.044500] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.044500] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.044502] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.044502] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.044505] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.044505] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.044507] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.044589] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0=
-119
[    0.044591] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.044592] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.044595] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.044596] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.044601] e820: update [mem 0x4708e000-0x470dffff] usable =3D=3D> res=
erved
[    0.044607] TSC deadline timer available
[    0.044609] CPU topo: Max. logical packages:   1
[    0.044609] CPU topo: Max. logical dies:       1
[    0.044610] CPU topo: Max. dies per package:   1
[    0.044611] CPU topo: Max. threads per core:   2
[    0.044612] CPU topo: Num. cores per package:    14
[    0.044612] CPU topo: Num. threads per package:  20
[    0.044613] CPU topo: Allowing 20 present CPUs plus 0 hotplug CPUs
[    0.044621] PM: hibernation: Registered nosave memory: [mem 0x00000000-=
0x00000fff]
[    0.044622] PM: hibernation: Registered nosave memory: [mem 0x0009f000-=
0x000fffff]
[    0.044623] PM: hibernation: Registered nosave memory: [mem 0x47003000-=
0x47003fff]
[    0.044624] PM: hibernation: Registered nosave memory: [mem 0x47012000-=
0x47012fff]
[    0.044625] PM: hibernation: Registered nosave memory: [mem 0x4708e000-=
0x470dffff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x4cd15000-=
0x50d10fff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x50d11000-=
0x51571fff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x51572000-=
0x517fefff]
[    0.044627] PM: hibernation: Registered nosave memory: [mem 0x51800000-=
0x561fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x56200000-=
0x569fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x56a00000-=
0x607fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x60800000-=
0xfed1ffff]
[    0.044629] PM: hibernation: Registered nosave memory: [mem 0xfed20000-=
0xfed7ffff]
[    0.044629] PM: hibernation: Registered nosave memory: [mem 0xfed80000-=
0xffffffff]
[    0.044630] [mem 0x60800000-0xfed1ffff] available for PCI devices
[    0.044631] Booting paravirtualized kernel on bare hardware
[    0.044632] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.049057] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:20 nr_cpu_ids:20=
 nr_node_ids:1
[    0.049928] percpu: Embedded 87 pages/cpu s233472 r8192 d114688 u524288
[    0.049932] pcpu-alloc: s233472 r8192 d114688 u524288 alloc=3D1*2097152
[    0.049934] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07
[    0.049937] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15
[    0.049940] pcpu-alloc: [0] 16 17 18 19
[    0.049950] Kernel command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6=
-200.fc40.x86_64 root=3DUUID=3D59545c18-3923-4411-9c12-245ab6cee067 ro roo=
tflags=3Dsubvol=3Droot rd.luks.uuid=3Dluks-49436d43-a842-4f89-a4aa-93ea838=
ffd01 rhgb quiet
[    0.049992] Unknown kernel command line parameters "rhgb BOOT_IMAGE=3D(=
hd1,gpt2)/vmlinuz-6.10.6-200.fc40.x86_64", will be passed to user space.
[    0.052098] Dentry cache hash table entries: 4194304 (order: 13, 335544=
32 bytes, linear)
[    0.053142] Inode-cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.053274] Fallback order for Node 0: 0
[    0.053277] Built 1 zonelists, mobility grouping on.  Total pages: 8307=
892
[    0.053277] Policy zone: Normal
[    0.053431] mem auto-init: stack:all(zero), heap alloc:on, heap free:of=
f
[    0.053438] software IO TLB: area num 32.
[    0.101689] Memory: 32316672K/33231568K available (20480K kernel code, =
4314K rwdata, 15296K rodata, 4720K init, 5284K bss, 914636K reserved, 0K c=
ma-reserved)
[    0.102302] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D20,=
 Nodes=3D1
[    0.102334] ftrace: allocating 55666 entries in 218 pages
[    0.107456] ftrace: allocated 218 pages with 5 groups
[    0.108004] Dynamic Preempt: voluntary
[    0.108070] rcu: Preemptible hierarchical RCU implementation.
[    0.108071] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_id=
s=3D20.
[    0.108072] 	Trampoline variant of Tasks RCU enabled.
[    0.108072] 	Rude variant of Tasks RCU enabled.
[    0.108073] 	Tracing variant of Tasks RCU enabled.
[    0.108073] rcu: RCU calculated value of scheduler-enlistment delay is =
100 jiffies.
[    0.108074] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D20
[    0.108083] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adju=
st=3D1.
[    0.108085] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.108086] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_c=
b_adjust=3D1.
[    0.110595] NR_IRQS: 524544, nr_irqs: 2216, preallocated irqs: 16
[    0.110967] rcu: srcu_init: Setting srcu_struct sizes based on contenti=
on.
[    0.111416] kfence: initialized - using 2097152 bytes for 255 objects a=
t 0x(____ptrval____)-0x(____ptrval____)
[    0.111450] Console: colour dummy device 80x25
[    0.111452] printk: legacy console [tty0] enabled
[    0.111481] ACPI: Core revision 20240322
[    0.111719] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.111720] APIC: Switch to symmetric I/O mode setup
[    0.111721] DMAR: Host address width 39
[    0.111722] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.111727] DMAR: dmar0: reg_base_addr fed90000 ver 4:0 cap 1c0000c4066=
0462 ecap 29a00f0505e
[    0.111728] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.111731] DMAR: dmar1: reg_base_addr fed91000 ver 5:0 cap d2008c40660=
462 ecap f050da
[    0.111733] DMAR: RMRR base: 0x0000005c000000 end: 0x000000607fffff
[    0.111735] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.111736] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.111737] DMAR-IR: Queued invalidation will be enabled to support x2a=
pic and Intr-remapping.
[    0.115674] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.115676] x2apic enabled
[    0.115747] APIC: Switched APIC routing to: cluster x2apic
[    0.127097] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles=
: 0x26bef67878b, max_idle_ns: 440795293631 ns
[    0.127103] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 5376.00 BogoMIPS (lpj=3D2688000)
[    0.127154] CPU0: Thermal monitoring enabled (TM1)
[    0.127155] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.127267] CET detected: Indirect Branch Tracking enabled
[    0.127268] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.127269] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.127271] process: using mwait in idle threads
[    0.127273] Spectre V1 : Mitigation: usercopy/swapgs barriers and __use=
r pointer sanitization
[    0.127275] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.127276] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RS=
B on context switch
[    0.127276] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL=
 on VMEXIT
[    0.127278] Spectre V2 : mitigation: Enabling conditional Indirect Bran=
ch Prediction Barrier
[    0.127279] Speculative Store Bypass: Mitigation: Speculative Store Byp=
ass disabled via prctl
[    0.127279] Register File Data Sampling: Mitigation: Clear Register Fil=
e
[    0.127288] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poin=
t registers'
[    0.127289] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.127289] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.127290] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys U=
ser registers'
[    0.127290] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User=
 registers'
[    0.127291] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.127292] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.127292] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.127293] x86/fpu: Enabled xstate features 0xa07, context size is 856=
 bytes, using 'compacted' format.
[    0.128101] Freeing SMP alternatives memory: 48K
[    0.128101] pid_max: default: 32768 minimum: 301
[    0.128101] LSM: initializing lsm=3Dlockdown,capability,yama,selinux,bp=
f,landlock,ima,evm
[    0.128101] Yama: becoming mindful.
[    0.128101] SELinux:  Initializing.
[    0.128101] LSM support for eBPF active
[    0.128101] landlock: Up and running.
[    0.128101] Mount-cache hash table entries: 65536 (order: 7, 524288 byt=
es, linear)
[    0.128101] Mountpoint-cache hash table entries: 65536 (order: 7, 52428=
8 bytes, linear)
[    0.128101] smpboot: CPU0: 12th Gen Intel(R) Core(TM) i7-12700H (family=
: 0x6, model: 0x9a, stepping: 0x3)
[    0.128101] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-bas=
eline,  AnyThread deprecated, Alderlake Hybrid events, 32-deep LBR, full-w=
idth counters, Intel PMU driver.
[    0.128101] core: cpu_core PMU driver:
[    0.128101] ... version:                5
[    0.128101] ... bit width:              48
[    0.128101] ... generic registers:      8
[    0.128101] ... value mask:             0000ffffffffffff
[    0.128101] ... max period:             00007fffffffffff
[    0.128101] ... fixed-purpose events:   4
[    0.128101] ... event mask:             0001000f000000ff
[    0.128101] signal: max sigframe size: 3632
[    0.128101] Estimated ratio of average max frequency by base frequency =
(times 1024): 1668
[    0.128101] rcu: Hierarchical SRCU implementation.
[    0.128101] rcu: 	Max phase no-delay instances is 400.
[    0.128101] NMI watchdog: Enabled. Permanently consumes one hw-PMU coun=
ter.
[    0.128181] smp: Bringing up secondary CPUs ...
[    0.128236] smpboot: x86: Booting SMP configuration:
[    0.128236] .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #13 #14 =
#15 #16 #17 #18 #19
[    0.016758] core: cpu_atom PMU driver: PEBS-via-PT
[    0.016758] ... version:                5
[    0.016758] ... bit width:              48
[    0.016758] ... generic registers:      6
[    0.016758] ... value mask:             0000ffffffffffff
[    0.016758] ... max period:             00007fffffffffff
[    0.016758] ... fixed-purpose events:   3
[    0.016758] ... event mask:             000000070000003f
[    0.133168]   #1  #3  #5  #7  #9 #11
[    0.136161] smp: Brought up 1 node, 20 CPUs
[    0.136161] smpboot: Total of 20 processors activated (107520.00 BogoMI=
PS)
[    0.138155] devtmpfs: initialized
[    0.138155] x86/mm: Memory block size: 128MB
[    0.139726] ACPI: PM: Registering ACPI NVS region [mem 0x50d11000-0x515=
71fff] (8785920 bytes)
[    0.139726] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 1911260446275000 ns
[    0.139726] futex hash table entries: 8192 (order: 7, 524288 bytes, lin=
ear)
[    0.139726] pinctrl core: initialized pinctrl subsystem
[    0.140102] PM: RTC time: 18:24:29, date: 2024-08-27
[    0.140456] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.140787] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloc=
ations
[    0.141048] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
[    0.141324] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
[    0.141334] audit: initializing netlink subsys (disabled)
[    0.141375] audit: type=3D2000 audit(1724783069.014:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[    0.141375] thermal_sys: Registered thermal governor 'fair_share'
[    0.141375] thermal_sys: Registered thermal governor 'bang_bang'
[    0.141375] thermal_sys: Registered thermal governor 'step_wise'
[    0.141375] thermal_sys: Registered thermal governor 'user_space'
[    0.141376] cpuidle: using governor menu
[    0.141376] Simple Boot Flag at 0x47 set to 0x80
[    0.141376] ACPI FADT declares the system doesn't support PCIe ASPM, so=
 disable it
[    0.141376] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.141376] PCI: ECAM [mem 0xc0000000-0xce0fffff] (base 0xc0000000) for=
 domain 0000 [bus 00-e0]
[    0.141376] PCI: Using configuration type 1 for base access
[    0.142134] kprobes: kprobe jump-optimization is enabled. All kprobes a=
re optimized if possible.
[    0.143122] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pag=
es
[    0.143124] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.143125] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pag=
es
[    0.143126] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.143175] Demotion targets for Node 0: null
[    0.144113] cryptd: max_cpu_qlen set to 1000
[    0.144145] raid6: skipped pq benchmark and selected avx2x4
[    0.144145] raid6: using avx2x2 recovery algorithm
[    0.144204] ACPI: Added _OSI(Module Device)
[    0.144205] ACPI: Added _OSI(Processor Device)
[    0.144206] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.144206] ACPI: Added _OSI(Processor Aggregator Device)
[    0.227916] ACPI: 16 ACPI AML tables successfully acquired and loaded
[    0.262644] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.262646] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.263791] ACPI: Dynamic OEM Table Load:
[    0.263801] ACPI: SSDT 0xFFFF92FE8306F000 000394 (v02 PmRef  Cpu0Cst  0=
0003001 INTL 20200717)
[    0.264727] ACPI: Dynamic OEM Table Load:
[    0.264733] ACPI: SSDT 0xFFFF92FE83054000 000626 (v02 PmRef  Cpu0Ist  0=
0003000 INTL 20200717)
[    0.265656] ACPI: Dynamic OEM Table Load:
[    0.265661] ACPI: SSDT 0xFFFF92FE83168000 0001AB (v02 PmRef  Cpu0Psd  0=
0003000 INTL 20200717)
[    0.266524] ACPI: Dynamic OEM Table Load:
[    0.266529] ACPI: SSDT 0xFFFF92FE83054800 0004D4 (v02 PmRef  Cpu0Hwp  0=
0003000 INTL 20200717)
[    0.267684] ACPI: Dynamic OEM Table Load:
[    0.267697] ACPI: SSDT 0xFFFF92FE831A8000 001BAF (v02 PmRef  ApIst    0=
0003000 INTL 20200717)
[    0.269011] ACPI: Dynamic OEM Table Load:
[    0.269017] ACPI: SSDT 0xFFFF92FE831AE000 001038 (v02 PmRef  ApHwp    0=
0003000 INTL 20200717)
[    0.270202] ACPI: Dynamic OEM Table Load:
[    0.270208] ACPI: SSDT 0xFFFF92FE831AC000 001349 (v02 PmRef  ApPsd    0=
0003000 INTL 20200717)
[    0.271453] ACPI: Dynamic OEM Table Load:
[    0.271459] ACPI: SSDT 0xFFFF92FE831BA000 000FBB (v02 PmRef  ApCst    0=
0003000 INTL 20200717)
[    0.277386] ACPI: _OSC evaluated successfully for all CPUs
[    0.277466] ACPI: EC: EC started
[    0.277467] ACPI: EC: interrupt blocked
[    0.281258] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.281261] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC used to handle tra=
nsactions
[    0.281262] ACPI: Interpreter enabled
[    0.281316] ACPI: PM: (supports S0 S4 S5)
[    0.281317] ACPI: Using IOAPIC for interrupt routing
[    0.282453] PCI: Using host bridge windows from ACPI; if necessary, use=
 "pci=3Dnocrs" and report a bug
[    0.282454] PCI: Ignoring E820 reservations for host bridge windows
[    0.283544] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.284459] ACPI: \_SB_.PC00.PEG0.PG00: New power resource
[    0.284928] ACPI: \_SB_.PC00.PEG1.PG01: New power resource
[    0.285675] ACPI: \_SB_.PC00.PEG2.PG02: New power resource
[    0.288451] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.294692] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.295305] ACPI: \_SB_.PC00.RP02.PXP5: New power resource
[    0.295849] ACPI: \_SB_.PC00.RP02.PXSX.MRST: New power resource
[    0.295863] ACPI: \_SB_.PC00.RP02.PXSX.DRST: New power resource
[    0.313248] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.313308] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.313359] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.538960] ACPI: \PIN_: New power resource
[    0.539221] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-e0])
[    0.539228] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Clo=
ckPM Segments MSI EDR HPX-Type3]
[    0.540101] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.543033] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHot=
plug PME PCIeCapability LTR DPC]
[    0.543035] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using =
BIOS configuration
[    0.547234] PCI host bridge to bus 0000:00
[    0.547236] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 windo=
w]
[    0.547238] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff windo=
w]
[    0.547239] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bff=
ff window]
[    0.547240] pci_bus 0000:00: root bus resource [mem 0x60800000-0xbfffff=
ff window]
[    0.547241] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x7fff=
ffffff window]
[    0.547243] pci_bus 0000:00: root bus resource [bus 00-e0]
[    0.547453] pci 0000:00:00.0: [8086:4641] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.547700] pci 0000:00:01.0: [8086:460d] type 01 class 0x060400 PCIe R=
oot Port
[    0.547716] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.547719] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    0.547721] pci 0000:00:01.0:   bridge window [mem 0x90000000-0x90fffff=
f]
[    0.547727] pci 0000:00:01.0:   bridge window [mem 0x6000000000-0x6011f=
fffff 64bit pref]
[    0.547778] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.547802] pci 0000:00:01.0: PTM enabled (root), 4ns granularity
[    0.548400] pci 0000:00:02.0: [8086:46a6] type 00 class 0x030000 PCIe R=
oot Complex Integrated Endpoint
[    0.548408] pci 0000:00:02.0: BAR 0 [mem 0x6074000000-0x6074ffffff 64bi=
t]
[    0.548414] pci 0000:00:02.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bi=
t pref]
[    0.548417] pci 0000:00:02.0: BAR 4 [io  0x4000-0x403f]
[    0.548434] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.548437] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x=
000c0000-0x000dffff]
[    0.548462] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit=
]
[    0.548463] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit=
]: contains BAR 0 for 7 VFs
[    0.548469] pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0x1fffffff 64bit=
 pref]
[    0.548471] pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0xdfffffff 64bit=
 pref]: contains BAR 2 for 7 VFs
[    0.548583] pci 0000:00:04.0: [8086:461d] type 00 class 0x118000 conven=
tional PCI endpoint
[    0.548596] pci 0000:00:04.0: BAR 0 [mem 0x6075240000-0x607525ffff 64bi=
t]
[    0.548847] pci 0000:00:06.0: [8086:09ab] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.549403] pci 0000:00:07.0: [8086:466e] type 01 class 0x060400 PCIe R=
oot Port
[    0.549420] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.549424] pci 0000:00:07.0:   bridge window [mem 0x7a000000-0x8fdffff=
f]
[    0.549431] pci 0000:00:07.0:   bridge window [mem 0x6020000000-0x6041f=
fffff 64bit pref]
[    0.549455] pci 0000:00:07.0: Overriding RP PIO Log Size to 4
[    0.549522] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.549547] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.550308] pci 0000:00:07.1: [8086:463f] type 01 class 0x060400 PCIe R=
oot Port
[    0.550325] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.550329] pci 0000:00:07.1:   bridge window [mem 0x64000000-0x79dffff=
f]
[    0.550336] pci 0000:00:07.1:   bridge window [mem 0x6050000000-0x6071f=
fffff 64bit pref]
[    0.550360] pci 0000:00:07.1: Overriding RP PIO Log Size to 4
[    0.550423] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.550449] pci 0000:00:07.1: PTM enabled (root), 4ns granularity
[    0.551272] pci 0000:00:08.0: [8086:464f] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.551281] pci 0000:00:08.0: BAR 0 [mem 0x60752a2000-0x60752a2fff 64bi=
t]
[    0.551434] pci 0000:00:0d.0: [8086:461e] type 00 class 0x0c0330 conven=
tional PCI endpoint
[    0.551444] pci 0000:00:0d.0: BAR 0 [mem 0x6075280000-0x607528ffff 64bi=
t]
[    0.551490] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.551906] pci 0000:00:0d.2: [8086:463e] type 00 class 0x0c0340 conven=
tional PCI endpoint
[    0.551916] pci 0000:00:0d.2: BAR 0 [mem 0x6075200000-0x607523ffff 64bi=
t]
[    0.551922] pci 0000:00:0d.2: BAR 2 [mem 0x60752a1000-0x60752a1fff 64bi=
t]
[    0.551955] pci 0000:00:0d.2: supports D1 D2
[    0.551955] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.552152] pci 0000:00:0e.0: [8086:467f] type 00 class 0x010400 PCIe R=
oot Complex Integrated Endpoint
[    0.552165] pci 0000:00:0e.0: BAR 0 [mem 0x6072000000-0x6073ffffff 64bi=
t]
[    0.552171] pci 0000:00:0e.0: BAR 2 [mem 0x62000000-0x63ffffff]
[    0.552185] pci 0000:00:0e.0: BAR 4 [mem 0x6075100000-0x60751fffff 64bi=
t]
[    0.552542] pci 0000:00:12.0: [8086:51fc] type 00 class 0x070000 conven=
tional PCI endpoint
[    0.552566] pci 0000:00:12.0: BAR 0 [mem 0x6075270000-0x607527ffff 64bi=
t]
[    0.552652] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.553001] pci 0000:00:14.0: [8086:51ed] type 00 class 0x0c0330 conven=
tional PCI endpoint
[    0.553025] pci 0000:00:14.0: BAR 0 [mem 0x6075260000-0x607526ffff 64bi=
t]
[    0.553123] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.553574] pci 0000:00:14.2: [8086:51ef] type 00 class 0x050000 conven=
tional PCI endpoint
[    0.553597] pci 0000:00:14.2: BAR 0 [mem 0x6075298000-0x607529bfff 64bi=
t]
[    0.553610] pci 0000:00:14.2: BAR 2 [mem 0x60752a0000-0x60752a0fff 64bi=
t]
[    0.553833] pci 0000:00:14.3: [8086:51f0] type 00 class 0x028000 PCIe R=
oot Complex Integrated Endpoint
[    0.553896] pci 0000:00:14.3: BAR 0 [mem 0x6075294000-0x6075297fff 64bi=
t]
[    0.554045] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.554850] pci 0000:00:15.0: [8086:51e8] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.555539] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.560150] pci 0000:00:15.1: [8086:51e9] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.560881] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.564061] pci 0000:00:16.0: [8086:51e0] type 00 class 0x078000 conven=
tional PCI endpoint
[    0.564086] pci 0000:00:16.0: BAR 0 [mem 0x607529d000-0x607529dfff 64bi=
t]
[    0.564180] pci 0000:00:16.0: PME# supported from D3hot
[    0.564507] pci 0000:00:17.0: [8086:09ab] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.564962] pci 0000:00:1f.0: [8086:5182] type 00 class 0x060100 conven=
tional PCI endpoint
[    0.565347] pci 0000:00:1f.3: [8086:51c8] type 00 class 0x040380 conven=
tional PCI endpoint
[    0.565407] pci 0000:00:1f.3: BAR 0 [mem 0x6075290000-0x6075293fff 64bi=
t]
[    0.565482] pci 0000:00:1f.3: BAR 4 [mem 0x6075000000-0x60750fffff 64bi=
t]
[    0.565637] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.565968] pci 0000:00:1f.4: [8086:51a3] type 00 class 0x0c0500 conven=
tional PCI endpoint
[    0.565997] pci 0000:00:1f.4: BAR 0 [mem 0x607529c000-0x607529c0ff 64bi=
t]
[    0.566023] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.566300] pci 0000:00:1f.5: [8086:51a4] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.566322] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.566496] pci 0000:00:1f.6: [8086:1a1e] type 00 class 0x020000 conven=
tional PCI endpoint
[    0.566542] pci 0000:00:1f.6: BAR 0 [mem 0x91080000-0x9109ffff]
[    0.566769] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.567035] pci 0000:01:00.0: [10de:1fb6] type 00 class 0x030200 PCIe E=
ndpoint
[    0.567047] pci 0000:01:00.0: BAR 0 [mem 0x90000000-0x90ffffff]
[    0.567057] pci 0000:01:00.0: BAR 1 [mem 0x6000000000-0x600fffffff 64bi=
t pref]
[    0.567067] pci 0000:01:00.0: BAR 3 [mem 0x6010000000-0x6011ffffff 64bi=
t pref]
[    0.567073] pci 0000:01:00.0: BAR 5 [io  0x3000-0x307f]
[    0.567080] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]
[    0.567139] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.567219] pci 0000:01:00.0: 126.024 Gb/s available PCIe bandwidth, li=
mited by 16.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 252.048 Gb/s w=
ith 16.0 GT/s PCIe x16 link)
[    0.567372] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.567406] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.567438] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.571423] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x7f=
)
[    0.959234] Low-power S0 idle used by default for system suspend
[    0.968295] ACPI: EC: interrupt unblocked
[    0.968297] ACPI: EC: event unblocked
[    0.968314] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.968315] ACPI: EC: GPE=3D0x6e
[    0.968316] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC initialization com=
plete
[    0.968318] ACPI: \_SB_.PC00.LPCB.ECDV: EC: Used to handle transactions=
 and events
[    0.968397] iommu: Default domain type: Translated
[    0.968397] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.968397] SCSI subsystem initialized
[    0.968397] libata version 3.00 loaded.
[    0.968397] ACPI: bus type USB registered
[    0.968397] usbcore: registered new interface driver usbfs
[    0.968397] usbcore: registered new interface driver hub
[    0.968397] usbcore: registered new device driver usb
[    0.968397] pps_core: LinuxPPS API ver. 1 registered
[    0.968397] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
 Giometti <giometti@linux.it>
[    0.968397] PTP clock support registered
[    0.968397] EDAC MC: Ver: 3.0.0
[    0.969123] efivars: Registered efivars operations
[    0.969384] NetLabel: Initializing
[    0.969386] NetLabel:  domain hash size =3D 128
[    0.969386] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.969408] NetLabel:  unlabeled traffic allowed by default
[    0.969412] mctp: management component transport protocol core
[    0.969413] NET: Registered PF_MCTP protocol family
[    0.969417] PCI: Using ACPI for IRQ routing
[    1.019557] PCI: pci_cache_line_size set to 64 bytes
[    1.019772] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't =
claim; no compatible bridge window
[    1.019941] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    1.019943] e820: reserve RAM buffer [mem 0x47003018-0x47ffffff]
[    1.019944] e820: reserve RAM buffer [mem 0x4708e000-0x47ffffff]
[    1.019945] e820: reserve RAM buffer [mem 0x4cd15000-0x4fffffff]
[    1.019945] e820: reserve RAM buffer [mem 0x51800000-0x53ffffff]
[    1.019946] e820: reserve RAM buffer [mem 0x89f800000-0x89fffffff]
[    1.020163] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    1.020163] pci 0000:00:02.0: vgaarb: bridge control possible
[    1.020163] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+me=
m,owns=3Dio+mem,locks=3Dnone
[    1.020163] vgaarb: loaded
[    1.020169] clocksource: Switched to clocksource tsc-early
[    1.020541] VFS: Disk quotas dquot_6.6.0
[    1.020548] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byt=
es)
[    1.020610] pnp: PnP ACPI init
[    1.020799] system 00:00: [io  0x0680-0x069f] has been reserved
[    1.020801] system 00:00: [io  0x164e-0x164f] has been reserved
[    1.020904] system 00:02: [io  0x1854-0x1857] has been reserved
[    1.021866] pnp 00:05: disabling [mem 0xc0000000-0xcfffffff] because it=
 overlaps 0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
[    1.021890] system 00:05: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    1.021892] system 00:05: [mem 0xfeda0000-0xfeda0fff] has been reserved
[    1.021894] system 00:05: [mem 0xfeda1000-0xfeda1fff] has been reserved
[    1.021895] system 00:05: [mem 0xfed20000-0xfed7ffff] could not be rese=
rved
[    1.021896] system 00:05: [mem 0xfed90000-0xfed93fff] could not be rese=
rved
[    1.021898] system 00:05: [mem 0xfed45000-0xfed8ffff] could not be rese=
rved
[    1.021899] system 00:05: [mem 0xfee00000-0xfeefffff] has been reserved
[    1.022889] system 00:06: [io  0x2000-0x20fe] has been reserved
[    1.026539] pnp: PnP ACPI: found 8 devices
[    1.032109] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, =
max_idle_ns: 2085701024 ns
[    1.032162] NET: Registered PF_INET protocol family
[    1.032408] IP idents hash table entries: 262144 (order: 9, 2097152 byt=
es, linear)
[    1.046356] tcp_listen_portaddr_hash hash table entries: 16384 (order: =
6, 262144 bytes, linear)
[    1.046386] Table-perturb hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
[    1.046608] TCP established hash table entries: 262144 (order: 9, 20971=
52 bytes, linear)
[    1.047013] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes=
, linear)
[    1.047121] TCP: Hash tables configured (established 262144 bind 65536)
[    1.047234] MPTCP token hash table entries: 32768 (order: 7, 786432 byt=
es, linear)
[    1.047315] UDP hash table entries: 16384 (order: 7, 524288 bytes, line=
ar)
[    1.047386] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes,=
 linear)
[    1.047463] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.047470] NET: Registered PF_XDP protocol family
[    1.047473] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]: can=
't claim; no compatible bridge window
[    1.047477] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus=
 02-39] add_size 1000
[    1.047479] pci 0000:00:07.1: bridge window [io  0x1000-0x0fff] to [bus=
 3a-71] add_size 1000
[    1.047488] pci 0000:00:02.0: VF BAR 2 [mem 0x4020000000-0x40ffffffff 6=
4bit pref]: assigned
[    1.047492] pci 0000:00:02.0: VF BAR 0 [mem 0x4010000000-0x4016ffffff 6=
4bit]: assigned
[    1.047495] pci 0000:00:07.0: bridge window [io  0x5000-0x5fff]: assign=
ed
[    1.047496] pci 0000:00:07.1: bridge window [io  0x6000-0x6fff]: assign=
ed
[    1.047498] pci 0000:00:15.0: BAR 0 [mem 0x4017000000-0x4017000fff 64bi=
t]: assigned
[    1.047861] pci 0000:00:15.1: BAR 0 [mem 0x4017001000-0x4017001fff 64bi=
t]: assigned
[    1.048202] pci 0000:00:1f.5: BAR 0 [mem 0x60800000-0x60800fff]: assign=
ed
[    1.048219] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: can't ass=
ign; no space
[    1.048220] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: failed to=
 assign
[    1.048222] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.048223] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    1.048226] pci 0000:00:01.0:   bridge window [mem 0x90000000-0x90fffff=
f]
[    1.048228] pci 0000:00:01.0:   bridge window [mem 0x6000000000-0x6011f=
fffff 64bit pref]
[    1.048232] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    1.048234] pci 0000:00:07.0:   bridge window [io  0x5000-0x5fff]
[    1.048236] pci 0000:00:07.0:   bridge window [mem 0x7a000000-0x8fdffff=
f]
[    1.048238] pci 0000:00:07.0:   bridge window [mem 0x6020000000-0x6041f=
fffff 64bit pref]
[    1.048242] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    1.048243] pci 0000:00:07.1:   bridge window [io  0x6000-0x6fff]
[    1.048246] pci 0000:00:07.1:   bridge window [mem 0x64000000-0x79dffff=
f]
[    1.048248] pci 0000:00:07.1:   bridge window [mem 0x6050000000-0x6071f=
fffff 64bit pref]
[    1.048253] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.048254] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.048255] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff wind=
ow]
[    1.048256] pci_bus 0000:00: resource 7 [mem 0x60800000-0xbfffffff wind=
ow]
[    1.048257] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x7fffffffff =
window]
[    1.048259] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    1.048260] pci_bus 0000:01: resource 1 [mem 0x90000000-0x90ffffff]
[    1.048261] pci_bus 0000:01: resource 2 [mem 0x6000000000-0x6011ffffff =
64bit pref]
[    1.048262] pci_bus 0000:02: resource 0 [io  0x5000-0x5fff]
[    1.048263] pci_bus 0000:02: resource 1 [mem 0x7a000000-0x8fdfffff]
[    1.048264] pci_bus 0000:02: resource 2 [mem 0x6020000000-0x6041ffffff =
64bit pref]
[    1.048265] pci_bus 0000:3a: resource 0 [io  0x6000-0x6fff]
[    1.048266] pci_bus 0000:3a: resource 1 [mem 0x64000000-0x79dfffff]
[    1.048267] pci_bus 0000:3a: resource 2 [mem 0x6050000000-0x6071ffffff =
64bit pref]
[    1.048921] PCI: CLS 0 bytes, default 64
[    1.049004] DMAR: Intel-IOMMU force enabled due to platform opt in
[    1.049010] DMAR: No ATSR found
[    1.049010] DMAR: No SATC found
[    1.049011] DMAR: IOMMU feature fl1gp_support inconsistent
[    1.049012] DMAR: IOMMU feature pgsel_inv inconsistent
[    1.049013] DMAR: IOMMU feature nwfs inconsistent
[    1.049014] DMAR: IOMMU feature dit inconsistent
[    1.049014] DMAR: IOMMU feature sc_support inconsistent
[    1.049015] DMAR: IOMMU feature dev_iotlb_support inconsistent
[    1.049016] DMAR: dmar0: Using Queued invalidation
[    1.049019] DMAR: dmar1: Using Queued invalidation
[    1.049038] Trying to unpack rootfs image as initramfs...
[    1.049219] pci 0000:00:02.0: Adding to iommu group 0
[    1.049251] pci 0000:00:00.0: Adding to iommu group 1
[    1.049261] pci 0000:00:01.0: Adding to iommu group 2
[    1.049267] pci 0000:00:04.0: Adding to iommu group 3
[    1.049276] pci 0000:00:06.0: Adding to iommu group 4
[    1.049285] pci 0000:00:07.0: Adding to iommu group 5
[    1.049293] pci 0000:00:07.1: Adding to iommu group 6
[    1.049301] pci 0000:00:08.0: Adding to iommu group 7
[    1.049312] pci 0000:00:0d.0: Adding to iommu group 8
[    1.049318] pci 0000:00:0d.2: Adding to iommu group 8
[    1.049326] pci 0000:00:0e.0: Adding to iommu group 9
[    1.049335] pci 0000:00:12.0: Adding to iommu group 10
[    1.049347] pci 0000:00:14.0: Adding to iommu group 11
[    1.049354] pci 0000:00:14.2: Adding to iommu group 11
[    1.049361] pci 0000:00:14.3: Adding to iommu group 12
[    1.049373] pci 0000:00:15.0: Adding to iommu group 13
[    1.049379] pci 0000:00:15.1: Adding to iommu group 13
[    1.049388] pci 0000:00:16.0: Adding to iommu group 14
[    1.049397] pci 0000:00:17.0: Adding to iommu group 15
[    1.049418] pci 0000:00:1f.0: Adding to iommu group 16
[    1.049425] pci 0000:00:1f.3: Adding to iommu group 16
[    1.049432] pci 0000:00:1f.4: Adding to iommu group 16
[    1.049441] pci 0000:00:1f.5: Adding to iommu group 16
[    1.049448] pci 0000:00:1f.6: Adding to iommu group 16
[    1.049457] pci 0000:01:00.0: Adding to iommu group 17
[    1.049547] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    1.049548] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.049548] software IO TLB: mapped [mem 0x000000003dcb6000-0x000000004=
1cb6000] (64MB)
[    1.049587] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26=
bef67878b, max_idle_ns: 440795293631 ns
[    1.049643] clocksource: Switched to clocksource tsc
[    1.055127] Initialise system trusted keyrings
[    1.055138] Key type blacklist registered
[    1.055177] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    1.055189] zbud: loaded
[    1.055587] integrity: Platform Keyring initialized
[    1.055590] integrity: Machine keyring initialized
[    1.064420] NET: Registered PF_ALG protocol family
[    1.064422] xor: automatically using best checksumming function   avx
[    1.064424] Key type asymmetric registered
[    1.064424] Asymmetric key parser 'x509' registered
[    1.380504] Freeing initrd memory: 78040K
[    1.383988] Block layer SCSI generic (bsg) driver version 0.4 loaded (m=
ajor 245)
[    1.384020] io scheduler mq-deadline registered
[    1.384021] io scheduler kyber registered
[    1.384028] io scheduler bfq registered
[    1.385528] atomic64_test: passed for x86-64 platform with CX8 and with=
 SSE
[    1.385970] pcieport 0000:00:01.0: PME: Signaling with IRQ 122
[    1.386148] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    1.386163] pcieport 0000:00:07.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.386446] pcieport 0000:00:07.1: PME: Signaling with IRQ 124
[    1.386460] pcieport 0000:00:07.1: pciehp: Slot #4 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.386595] shpchp: Standard Hot Plug PCI Controller Driver version: 0.=
4
[    1.388411] ACPI: AC: AC Adapter [AC] (on-line)
[    1.388461] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C=
0D:00/input/input0
[    1.388493] ACPI: button: Lid Switch [LID0]
[    1.388516] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP=
0C0C:00/input/input1
[    1.388581] ACPI: button: Power Button [PBTN]
[    1.388602] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP=
0C0E:00/input/input2
[    1.388617] ACPI: button: Sleep Button [SBTN]
[    1.391744] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.393131] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    1.393556] hpet_acpi_add: no address or irqs in _CRS
[    1.393594] Non-volatile memory driver v1.3
[    1.393598] Linux agpgart interface v0.103
[    1.395720] tpm_tis NTC0702:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    1.418964] ACPI: battery: Slot [BAT0] (battery present)
[    1.502130] ACPI: bus type drm_connector registered
[    1.517924] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    1.539979] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    1.550226] ahci 0000:00:0e.0: version 3.0
[    1.550238] ahci 0000:00:0e.0: probe with driver ahci failed with error=
 -22
[    1.550461] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.550485] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus=
 number 1
[    1.551548] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x=
120 quirks 0x0000000200009810
[    1.551777] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.551817] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus=
 number 2
[    1.551819] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced Super=
Speed
[    1.551948] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.551950] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.551951] usb usb1: Product: xHCI Host Controller
[    1.551952] usb usb1: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.551953] usb usb1: SerialNumber: 0000:00:0d.0
[    1.552073] hub 1-0:1.0: USB hub found
[    1.552092] hub 1-0:1.0: 1 port detected
[    1.552292] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.552294] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.552295] usb usb2: Product: xHCI Host Controller
[    1.552296] usb usb2: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.552297] usb usb2: SerialNumber: 0000:00:0d.0
[    1.552356] hub 2-0:1.0: USB hub found
[    1.552365] hub 2-0:1.0: 2 ports detected
[    1.552718] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.552744] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus=
 number 3
[    1.554073] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x=
120 quirks 0x0000100200009810
[    1.554489] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.554545] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus=
 number 4
[    1.554547] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced Super=
Speed
[    1.554606] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.554607] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.554608] usb usb3: Product: xHCI Host Controller
[    1.554609] usb usb3: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.554610] usb usb3: SerialNumber: 0000:00:14.0
[    1.554684] hub 3-0:1.0: USB hub found
[    1.554718] hub 3-0:1.0: 12 ports detected
[    1.555988] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.555990] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.555991] usb usb4: Product: xHCI Host Controller
[    1.555992] usb usb4: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.555993] usb usb4: SerialNumber: 0000:00:14.0
[    1.556088] hub 4-0:1.0: USB hub found
[    1.556115] hub 4-0:1.0: 4 ports detected
[    1.556564] usbcore: registered new interface driver usbserial_generic
[    1.556568] usbserial: USB Serial support registered for generic
[    1.556595] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at =
0x60,0x64 irq 1,12
[    1.557055] i8042: Warning: Keylock active
[    1.559371] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.559375] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.559471] mousedev: PS/2 mouse device common for all mice
[    1.559598] rtc_cmos 00:01: RTC can wake from S4
[    1.561342] rtc_cmos 00:01: registered as rtc0
[    1.561691] rtc_cmos 00:01: setting system clock to 2024-08-27T18:24:30=
 UTC (1724783070)
[    1.561726] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvra=
m
[    1.562974] input: AT Translated Set 2 keyboard as /devices/platform/i8=
042/serio0/input/input3
[    1.563470] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.=
 Duplicate IMA measurements will not be recorded in the IMA log.
[    1.563479] device-mapper: uevent: version 1.0.3
[    1.563523] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised=
: dm-devel@lists.linux.dev
[    1.563627] intel_pstate: Intel P-state driver initializing
[    1.566000] intel_pstate: HWP enabled
[    1.566373] [drm] Initialized simpledrm 1.0.0 20200625 for simple-frame=
buffer.0 on minor 0
[    1.567580] fbcon: Deferring console take-over
[    1.567582] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpled=
rmdrmfb frame buffer device
[    1.567680] hid: raw HID events driver (C) Jiri Kosina
[    1.567699] usbcore: registered new interface driver usbhid
[    1.567699] usbhid: USB HID core driver
[    1.567808] drop_monitor: Initializing network drop monitor service
[    1.567921] Initializing XFRM netlink socket
[    1.567940] NET: Registered PF_INET6 protocol family
[    1.570960] Segment Routing with IPv6
[    1.570961] RPL Segment Routing with IPv6
[    1.570964] In-situ OAM (IOAM) with IPv6
[    1.570982] mip6: Mobile IPv6
[    1.570984] NET: Registered PF_PACKET protocol family
[    1.572735] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.573696] microcode: Current revision: 0x00000434
[    1.574581] IPI shorthand broadcast: enabled
[    1.574584] AVX2 version of gcm_enc/dec engaged.
[    1.575626] AES CTR mode by8 optimization enabled
[    1.576792] sched_clock: Marking stable (1561000459, 15758213)->(161161=
1518, -34852846)
[    1.576950] Timer migration: 2 hierarchy levels; 8 children per group; =
2 crossnode level
[    1.577127] registered taskstats version 1
[    1.577402] Loading compiled-in X.509 certificates
[    1.585727] Loaded X.509 cert 'Fedora kernel signing key: f9cbd582e5889=
bb21bd43994ed8eb88a8fb191cd'
[    1.590918] Loaded X.509 cert 'Fedora IMA CA: a8a00c31663f853f9c6ff2564=
872e378af026b28'
[    1.593125] Demotion targets for Node 0: null
[    1.593127] page_owner is disabled
[    1.593405] Key type .fscrypt registered
[    1.593406] Key type fscrypt-provisioning registered
[    1.594183] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    1.594200] Key type big_key registered
[    1.594206] Key type trusted registered
[    1.625231] Key type encrypted registered
[    1.625323] Loading compiled-in module X.509 certificates
[    1.625743] Loaded X.509 cert 'Fedora kernel signing key: f9cbd582e5889=
bb21bd43994ed8eb88a8fb191cd'
[    1.625746] ima: Allocated hash algorithm: sha256
[    1.683603] ima: No architecture policies found
[    1.683675] evm: Initialising EVM extended attributes:
[    1.683678] evm: security.selinux
[    1.683681] evm: security.SMACK64 (disabled)
[    1.683683] evm: security.SMACK64EXEC (disabled)
[    1.683685] evm: security.SMACK64TRANSMUTE (disabled)
[    1.683686] evm: security.SMACK64MMAP (disabled)
[    1.683688] evm: security.apparmor (disabled)
[    1.683690] evm: security.ima
[    1.683691] evm: security.capability
[    1.683693] evm: HMAC attrs: 0x1
[    1.762586] alg: No test for 842 (842-scomp)
[    1.762626] alg: No test for 842 (842-generic)
[    1.794875] usb 3-3: new low-speed USB device number 2 using xhci_hcd
[    1.833093] PM:   Magic number: 4:327:444
[    1.835786] RAS: Correctable Errors collector initialized.
[    1.842012] clk: Disabling unused clocks
[    1.842014] PM: genpd: Disabling unused power domains
[    1.846686] Freeing unused decrypted memory: 2028K
[    1.847510] Freeing unused kernel image (initmem) memory: 4720K
[    1.847525] Write protecting the kernel read-only data: 36864k
[    1.848425] Freeing unused kernel image (rodata/data gap) memory: 1088K
[    1.853282] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.853287] Run /init as init process
[    1.853288]   with arguments:
[    1.853289]     /init
[    1.853289]     rhgb
[    1.853290]   with environment:
[    1.853290]     HOME=3D/
[    1.853291]     TERM=3Dlinux
[    1.853291]     BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6-200.fc40.x86_64
[    1.867045] systemd[1]: systemd 255.10-3.fc40 running in system mode (+=
PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSS=
L +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP=
 +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB=
 +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunifi=
ed)
[    1.867050] systemd[1]: Detected architecture x86-64.
[    1.867052] systemd[1]: Running in initrd.
[    1.867158] systemd[1]: No hostname configured, using default hostname.
[    1.867191] systemd[1]: Hostname set to <fedora>.
[    1.932431] usb 3-3: New USB device found, idVendor=3D045e, idProduct=
=3D0040, bcdDevice=3D 3.00
[    1.932434] usb 3-3: New USB device strings: Mfr=3D1, Product=3D3, Seri=
alNumber=3D0
[    1.932434] usb 3-3: Product: Microsoft 3-Button Mouse with IntelliEye(=
TM)
[    1.932435] usb 3-3: Manufacturer: Microsoft
[    1.935738] input: Microsoft Microsoft 3-Button Mouse with IntelliEye(T=
M) as /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0/0003:045E:0040.000=
1/input/input6
[    1.936093] hid-generic 0003:045E:0040.0001: input,hidraw0: USB HID v1.=
10 Mouse [Microsoft Microsoft 3-Button Mouse with IntelliEye(TM)] on usb-0=
000:00:14.0-3/input0
[    1.939498] systemd[1]: Queued start job for default target initrd.targ=
et.
[    1.956091] systemd[1]: Created slice system-systemd\x2dcryptsetup.slic=
e - Slice /system/systemd-cryptsetup.
[    1.956197] systemd[1]: Expecting device dev-disk-by\x2duuid-49436d43\x=
2da842\x2d4f89\x2da4aa\x2d93ea838ffd01.device - /dev/disk/by-uuid/49436d43=
-a842-4f89-a4aa-93ea838ffd01...
[    1.956208] systemd[1]: Expecting device dev-disk-by\x2duuid-59545c18\x=
2d3923\x2d4411\x2d9c12\x2d245ab6cee067.device - /dev/disk/by-uuid/59545c18=
-3923-4411-9c12-245ab6cee067...
[    1.956239] systemd[1]: Reached target initrd-usr-fs.target - Initrd /u=
sr File System.
[    1.956272] systemd[1]: Reached target slices.target - Slice Units.
[    1.956295] systemd[1]: Reached target swap.target - Swaps.
[    1.956316] systemd[1]: Reached target timers.target - Timer Units.
[    1.956474] systemd[1]: Listening on systemd-journald-dev-log.socket - =
Journal Socket (/dev/log).
[    1.956620] systemd[1]: Listening on systemd-journald.socket - Journal =
Socket.
[    1.956781] systemd[1]: Listening on systemd-udevd-control.socket - ude=
v Control Socket.
[    1.956897] systemd[1]: Listening on systemd-udevd-kernel.socket - udev=
 Kernel Socket.
[    1.956921] systemd[1]: Reached target sockets.target - Socket Units.
[    1.958027] systemd[1]: Starting kmod-static-nodes.service - Create Lis=
t of Static Device Nodes...
[    1.958083] systemd[1]: memstrack.service - Memstrack Anylazing Service=
 was skipped because no trigger condition checks were met.
[    1.960267] systemd[1]: Starting systemd-journald.service - Journal Ser=
vice...
[    1.961157] systemd[1]: Starting systemd-modules-load.service - Load Ke=
rnel Modules...
[    1.961192] systemd[1]: systemd-pcrphase-initrd.service - TPM2 PCR Barr=
ier (initrd) was skipped because of an unmet condition check (ConditionSec=
urity=3Dmeasured-uki).
[    1.961966] systemd[1]: Starting systemd-vconsole-setup.service - Virtu=
al Console Setup...
[    1.963155] systemd[1]: Finished kmod-static-nodes.service - Create Lis=
t of Static Device Nodes.
[    1.963778] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully...
[    1.968572] systemd-journald[382]: Collecting audit messages is disable=
d.
[    1.974549] fuse: init (API version 7.40)
[    1.976628] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully.
[    1.977169] systemd[1]: Starting systemd-sysusers.service - Create Syst=
em Users...
[    1.977842] systemd[1]: Finished systemd-modules-load.service - Load Ke=
rnel Modules.
[    1.978372] systemd[1]: Starting systemd-sysctl.service - Apply Kernel =
Variables...
[    1.982386] systemd[1]: Finished systemd-sysctl.service - Apply Kernel =
Variables.
[    1.983394] systemd[1]: Started systemd-journald.service - Journal Serv=
ice.
[    2.050894] usb 3-6: new high-speed USB device number 3 using xhci_hcd
[    2.193353] usb 3-6: New USB device found, idVendor=3D0c45, idProduct=
=3D673c, bcdDevice=3D13.15
[    2.193360] usb 3-6: New USB device strings: Mfr=3D2, Product=3D1, Seri=
alNumber=3D0
[    2.193363] usb 3-6: Product: Integrated_Webcam_FHD
[    2.193364] usb 3-6: Manufacturer: CN08981J8LG00273B027A00
[    2.296175] wmi_bus wmi_bus-PNP0C14:02: [Firmware Bug]: WQBC data block=
 query control method not found
[    2.305619] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1=
/input/input5
[    2.309517] vmd 0000:00:0e.0: PCI host bridge to bus 10000:e0
[    2.309523] pci_bus 10000:e0: root bus resource [bus e0-ff]
[    2.309526] pci_bus 10000:e0: root bus resource [mem 0x62000000-0x63fff=
fff]
[    2.309527] pci_bus 10000:e0: root bus resource [mem 0x6075102000-0x607=
51fffff 64bit]
[    2.309554] pci 10000:e0:06.0: [8086:464d] type 01 class 0x060400 PCIe =
Root Port
[    2.309570] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.309574] pci 10000:e0:06.0:   bridge window [io  0x0000-0x0fff]
[    2.309577] pci 10000:e0:06.0:   bridge window [mem 0x62100000-0x621fff=
ff]
[    2.309617] pci 10000:e0:06.0: PME# supported from D0 D3hot D3cold
[    2.309641] pci 10000:e0:06.0: PTM enabled (root), 4ns granularity
[    2.309768] pci 10000:e0:06.0: Adding to iommu group 9
[    2.309798] pci 10000:e0:06.2: [8086:463d] type 01 class 0x060400 PCIe =
Root Port
[    2.309812] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.309816] pci 10000:e0:06.2:   bridge window [io  0x0000-0x0fff]
[    2.309818] pci 10000:e0:06.2:   bridge window [mem 0x62200000-0x622fff=
ff]
[    2.309856] pci 10000:e0:06.2: PME# supported from D0 D3hot D3cold
[    2.309878] pci 10000:e0:06.2: PTM enabled (root), 4ns granularity
[    2.309986] pci 10000:e0:06.2: Adding to iommu group 9
[    2.310013] pci 10000:e0:17.0: [8086:51d3] type 00 class 0x010601 conve=
ntional PCI endpoint
[    2.310031] pci 10000:e0:17.0: BAR 0 [mem 0x00000000-0x00001fff]
[    2.310047] pci 10000:e0:17.0: BAR 1 [mem 0x00000000-0x000000ff]
[    2.310059] pci 10000:e0:17.0: BAR 2 [io  0x0000-0x0007]
[    2.310072] pci 10000:e0:17.0: BAR 3 [io  0x0000-0x0003]
[    2.310085] pci 10000:e0:17.0: BAR 4 [io  0x0000-0x001f]
[    2.310098] pci 10000:e0:17.0: BAR 5 [mem 0x62000000-0x620007ff]
[    2.310143] pci 10000:e0:17.0: PME# supported from D3hot
[    2.310206] pci 10000:e0:17.0: Adding to iommu group 9
[    2.310215] pci 10000:e0:06.0: Primary bus is hard wired to 0
[    2.310263] pci 10000:e1:00.0: [144d:a80a] type 00 class 0x010802 PCIe =
Endpoint
[    2.310281] pci 10000:e1:00.0: BAR 0 [mem 0x62100000-0x62103fff 64bit]
[    2.310539] pci 10000:e1:00.0: Adding to iommu group 9
[    2.310569] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.310575] pci 10000:e0:06.2: Primary bus is hard wired to 0
[    2.311025] pci 10000:e2:00.0: [15b7:5030] type 00 class 0x010802 PCIe =
Endpoint
[    2.311041] pci 10000:e2:00.0: BAR 0 [mem 0x62200000-0x62203fff 64bit]
[    2.311281] pci 10000:e2:00.0: Adding to iommu group 9
[    2.311309] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.311316] pci 10000:e0:06.0: Primary bus is hard wired to 0
[    2.311320] pci 10000:e0:06.2: Primary bus is hard wired to 0
[    2.466997] input: VEN_0488:00 0488:1042 Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/inp=
ut/input7
[    2.467434] input: VEN_0488:00 0488:1042 Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/=
input/input8
[    2.467912] hid-generic 0018:0488:1042.0002: input,hidraw1: I2C HID v1.=
00 Mouse [VEN_0488:00 0488:1042] on i2c-VEN_0488:00
[    2.540182] input: VEN_0488:00 0488:1042 Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/inp=
ut/input10
[    2.540413] input: VEN_0488:00 0488:1042 Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/=
input/input11
[    2.540658] hid-multitouch 0018:0488:1042.0002: input,hidraw1: I2C HID =
v1.00 Mouse [VEN_0488:00 0488:1042] on i2c-VEN_0488:00
[    2.583032] pci 10000:e0:06.0: bridge window [mem 0x62000000-0x620fffff=
]: assigned
[    2.583037] pci 10000:e0:06.2: bridge window [mem 0x62100000-0x621fffff=
]: assigned
[    2.583039] pci 10000:e0:17.0: BAR 0 [mem 0x62200000-0x62201fff]: assig=
ned
[    2.583057] pci 10000:e0:06.0: bridge window [io  size 0x1000]: can't a=
ssign; no space
[    2.583058] pci 10000:e0:06.0: bridge window [io  size 0x1000]: failed =
to assign
[    2.583059] pci 10000:e0:06.2: bridge window [io  size 0x1000]: can't a=
ssign; no space
[    2.583060] pci 10000:e0:06.2: bridge window [io  size 0x1000]: failed =
to assign
[    2.583061] pci 10000:e0:17.0: BAR 5 [mem 0x62202000-0x622027ff]: assig=
ned
[    2.583084] pci 10000:e0:17.0: BAR 1 [mem 0x62202800-0x622028ff]: assig=
ned
[    2.583089] pci 10000:e0:17.0: BAR 4 [io  size 0x0020]: can't assign; n=
o space
[    2.583090] pci 10000:e0:17.0: BAR 4 [io  size 0x0020]: failed to assig=
n
[    2.583091] pci 10000:e0:17.0: BAR 2 [io  size 0x0008]: can't assign; n=
o space
[    2.583091] pci 10000:e0:17.0: BAR 2 [io  size 0x0008]: failed to assig=
n
[    2.583092] pci 10000:e0:17.0: BAR 3 [io  size 0x0004]: can't assign; n=
o space
[    2.583093] pci 10000:e0:17.0: BAR 3 [io  size 0x0004]: failed to assig=
n
[    2.583095] pci 10000:e1:00.0: BAR 0 [mem 0x62000000-0x62003fff 64bit]:=
 assigned
[    2.583103] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.583106] pci 10000:e0:06.0:   bridge window [mem 0x62000000-0x620fff=
ff]
[    2.583112] pci 10000:e2:00.0: BAR 0 [mem 0x62100000-0x62103fff 64bit]:=
 assigned
[    2.583119] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.583121] pci 10000:e0:06.2:   bridge window [mem 0x62100000-0x621fff=
ff]
[    2.583130] pci 10000:e1:00.0: can't override BIOS ASPM; OS doesn't hav=
e ASPM control
[    2.583136] pci 10000:e1:00.0: VMD: Default LTR value set by driver
[    2.583140] pci 10000:e2:00.0: can't override BIOS ASPM; OS doesn't hav=
e ASPM control
[    2.583143] pci 10000:e2:00.0: VMD: Default LTR value set by driver
[    2.583165] pcieport 10000:e0:06.0: can't derive routing for PCI INT D
[    2.583167] pcieport 10000:e0:06.0: PCI INT D: no GSI
[    2.583234] pcieport 10000:e0:06.0: PME: Signaling with IRQ 161
[    2.583302] pcieport 10000:e0:06.2: can't derive routing for PCI INT B
[    2.583304] pcieport 10000:e0:06.2: PCI INT B: no GSI
[    2.583338] pcieport 10000:e0:06.2: PME: Signaling with IRQ 162
[    2.583424] ahci 10000:e0:17.0: can't derive routing for PCI INT A
[    2.583426] ahci 10000:e0:17.0: PCI INT A: no GSI
[    2.583562] ahci 10000:e0:17.0: AHCI vers 0001.0301, 32 command slots, =
6 Gbps, SATA mode
[    2.583564] ahci 10000:e0:17.0: 0/1 ports implemented (port mask 0x0)
[    2.583565] ahci 10000:e0:17.0: flags: 64bit ncq sntf pm clo only pio s=
lum part deso sadm sds
[    2.583946] scsi host0: ahci
[    2.584010] ata1: DUMMY
[    2.584042] vmd 0000:00:0e.0: Bound to PCI domain 10000
[    2.730104] ACPI Warning: \_SB.PC00.PEG1.PEGP._DSM: Argument #4 type mi=
smatch - Found [Buffer], ACPI requires [Package] (20240322/nsarguments-61)
[    2.730170] pci 0000:01:00.0: optimus capabilities: enabled, status dyn=
amic power, hda bios codec supported
[    2.730195] VGA switcheroo: detected Optimus DSM method \_SB_.PC00.PEG1=
.PEGP handle
[    2.730195] nouveau: detected PR support, will not use DSM
[    2.730549] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
[    2.933821] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.935136] nvme nvme0: pci function 10000:e1:00.0
[    2.935143] pcieport 10000:e0:06.0: can't derive routing for PCI INT A
[    2.935143] nvme nvme1: pci function 10000:e2:00.0
[    2.935145] nvme 10000:e1:00.0: PCI INT A: not connected
[    2.935151] pcieport 10000:e0:06.2: can't derive routing for PCI INT A
[    2.935153] nvme 10000:e2:00.0: PCI INT A: no GSI
[    2.937257] nvme nvme0: D3 entry latency set to 10 seconds
[    2.941288] nvme nvme0: 18/0/0 default/read/poll queues
[    2.944036]  nvme0n1: p1
[    2.951099] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.951153] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.951523] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    2.955006] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915=
/adlp_dmc.bin (v2.20)
[    2.963068] nvme nvme1: 18/0/0 default/read/poll queues
[    2.966856]  nvme1n1: p1 p2 p3
[    3.022826] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/adlp_guc_70=
.bin version 70.29.2
[    3.022830] i915 0000:00:02.0: [drm] GT0: HuC firmware i915/tgl_huc.bin=
 version 7.9.3
[    3.037268] i915 0000:00:02.0: [drm] GT0: HuC: authenticated for all wo=
rkloads
[    3.037977] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    3.037979] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    3.038654] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    3.039710] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected =
content support initialized
[    3.051144] [drm] Initialized i915 1.6.0 20230929 for 0000:00:02.0 on m=
inor 1
[    3.051364] ACPI: video: Video Device [PEGP] (multi-head: no  rom: yes =
 post: no)
[    3.051384] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A0=
8:00/device:03/LNXVIDEO:00/input/input13
[    3.054671] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no =
 post: no)
[    3.057164] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A0=
8:00/LNXVIDEO:01/input/input14
[    3.062962] fbcon: i915drmfb (fb0) is primary device
[    3.062963] fbcon: Deferring console take-over
[    3.062964] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.141529] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: =
enum_devices_done OK, num_hid_devices=3D2
[    3.146606] nouveau 0000:01:00.0: bios: version 90.17.8d.40.48
[    3.151570] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2=
.00 Device [hid-ishtp 8087:0AC2] on
[    3.160891] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2=
.00 Device [hid-ishtp 8087:0AC2] on
[    3.238414] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID=
 v2.00 Device [hid-ishtp 8087:0AC2] on
[    3.239181] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID=
 v2.00 Device [hid-ishtp 8087:0AC2] on
[    4.454610] vga_switcheroo: enabled
[    4.454786] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    4.454789] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    4.514916] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    4.515215] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 o=
n minor 0
[    4.517993] nouveau 0000:01:00.0: [drm] No compatible format found
[    4.517994] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   14.017829] BTRFS: device label fedora devid 1 transid 3688 /dev/mapper=
/luks-49436d43-a842-4f89-a4aa-93ea838ffd01 (253:0) scanned by mount (1106)
[   14.018359] BTRFS info (device dm-0): first mount of filesystem 59545c1=
8-3923-4411-9c12-245ab6cee067
[   14.018396] BTRFS info (device dm-0): using crc32c (crc32c-intel) check=
sum algorithm
[   14.018405] BTRFS info (device dm-0): using free-space-tree
[   14.154797] systemd-journald[382]: Received SIGTERM from PID 1 (systemd=
).
[   14.205083] audit: type=3D1404 audit(1724783083.143:2): enforcing=3D1 o=
ld_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D1 old-enable=
d=3D1 lsm=3Dselinux res=3D1
[   14.239652] SELinux:  policy capability network_peer_controls=3D1
[   14.239654] SELinux:  policy capability open_perms=3D1
[   14.239655] SELinux:  policy capability extended_socket_class=3D1
[   14.239655] SELinux:  policy capability always_check_network=3D0
[   14.239656] SELinux:  policy capability cgroup_seclabel=3D1
[   14.239656] SELinux:  policy capability nnp_nosuid_transition=3D1
[   14.239656] SELinux:  policy capability genfs_seclabel_symlinks=3D1
[   14.239657] SELinux:  policy capability ioctl_skip_cloexec=3D0
[   14.239657] SELinux:  policy capability userspace_initial_context=3D0
[   14.268438] audit: type=3D1403 audit(1724783083.206:3): auid=3D42949672=
95 ses=3D4294967295 lsm=3Dselinux res=3D1
[   14.268884] systemd[1]: Successfully loaded SELinux policy in 64.229ms.
[   14.286387] systemd[1]: Relabeled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 14.043ms.
[   14.289727] systemd[1]: systemd 255.10-3.fc40 running in system mode (+=
PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSS=
L +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP=
 +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB=
 +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunifi=
ed)
[   14.289730] systemd[1]: Detected architecture x86-64.
[   14.291376] systemd[1]: Hostname set to <juicefast>.
[   14.370302] systemd[1]: bpf-lsm: LSM BPF program attached
[   14.491283] zram: Added device: zram0
[   14.591130] systemd[1]: systemd-ask-password-plymouth.service: Deactiva=
ted successfully.
[   14.591266] systemd[1]: initrd-switch-root.service: Deactivated success=
fully.
[   14.591314] systemd[1]: Stopped initrd-switch-root.service - Switch Roo=
t.
[   14.592056] systemd[1]: systemd-journald.service: Scheduled restart job=
, restart counter is at 1.
[   14.592330] systemd[1]: Created slice machine.slice - Virtual Machine a=
nd Container Slice.
[   14.592557] systemd[1]: Created slice system-getty.slice - Slice /syste=
m/getty.
[   14.592754] systemd[1]: Created slice system-systemd\x2dfsck.slice - Sl=
ice /system/systemd-fsck.
[   14.592953] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.s=
lice - Slice /system/systemd-zram-setup.
[   14.593091] systemd[1]: Created slice user.slice - User and Session Sli=
ce.
[   14.593105] systemd[1]: systemd-ask-password-console.path - Dispatch Pa=
ssword Requests to Console Directory Watch was skipped because of an unmet=
 condition check (ConditionPathExists=3D!/run/plymouth/pid).
[   14.593198] systemd[1]: Started systemd-ask-password-wall.path - Forwar=
d Password Requests to Wall Directory Watch.
[   14.593500] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automo=
unt - Arbitrary Executable File Formats File System Automount Point.
[   14.593515] systemd[1]: Expecting device dev-disk-by\x2duuid-082f08c2\x=
2dfaa7\x2d432e\x2dbbb2\x2ddb65ef31d4ea.device - /dev/disk/by-uuid/082f08c2=
-faa7-432e-bbb2-db65ef31d4ea...
[   14.593524] systemd[1]: Expecting device dev-disk-by\x2duuid-3C4D\x2d6E=
99.device - /dev/disk/by-uuid/3C4D-6E99...
[   14.593534] systemd[1]: Expecting device dev-zram0.device - /dev/zram0.=
..
[   14.593548] systemd[1]: Reached target blockdev@dev-mapper-luks\x2d4943=
6d43\x2da842\x2d4f89\x2da4aa\x2d93ea838ffd01.target - Block Device Prepara=
tion for /dev/mapper/luks-49436d43-a842-4f89-a4aa-93ea838ffd01.
[   14.593560] systemd[1]: Reached target cryptsetup.target - Local Encryp=
ted Volumes.
[   14.593572] systemd[1]: Reached target getty.target - Login Prompts.
[   14.593586] systemd[1]: Stopped target initrd-switch-root.target - Swit=
ch Root.
[   14.593597] systemd[1]: Stopped target initrd-fs.target - Initrd File S=
ystems.
[   14.593606] systemd[1]: Stopped target initrd-root-fs.target - Initrd R=
oot File System.
[   14.593617] systemd[1]: Reached target integritysetup.target - Local In=
tegrity Protected Volumes.
[   14.593650] systemd[1]: Reached target slices.target - Slice Units.
[   14.593669] systemd[1]: Reached target veritysetup.target - Local Verit=
y Protected Volumes.
[   14.593977] systemd[1]: Listening on dm-event.socket - Device-mapper ev=
ent daemon FIFOs.
[   14.594716] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll d=
aemon socket.
[   14.595490] systemd[1]: Listening on systemd-coredump.socket - Process =
Core Dump Socket.
[   14.595556] systemd[1]: Listening on systemd-initctl.socket - initctl C=
ompatibility Named Pipe.
[   14.595857] systemd[1]: Listening on systemd-journald-audit.socket - Jo=
urnal Audit Socket.
[   14.596045] systemd[1]: Listening on systemd-oomd.socket - Userspace Ou=
t-Of-Memory (OOM) Killer Socket.
[   14.596081] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension (=
Varlink) was skipped because of an unmet condition check (ConditionSecurit=
y=3Dmeasured-uki).
[   14.596606] systemd[1]: Listening on systemd-udevd-control.socket - ude=
v Control Socket.
[   14.596729] systemd[1]: Listening on systemd-udevd-kernel.socket - udev=
 Kernel Socket.
[   14.596984] systemd[1]: Listening on systemd-userdbd.socket - User Data=
base Manager Socket.
[   14.620023] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File =
System...
[   14.621468] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue=
 File System...
[   14.622308] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug =
File System...
[   14.622889] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trac=
e File System...
[   14.623000] systemd[1]: auth-rpcgss-module.service - Kernel Module supp=
orting RPCSEC_GSS was skipped because of an unmet condition check (Conditi=
onPathExists=3D/etc/krb5.keytab).
[   14.623384] systemd[1]: iscsi-starter.service was skipped because of an=
 unmet condition check (ConditionDirectoryNotEmpty=3D/var/lib/iscsi/nodes)=
.
[   14.623944] systemd[1]: Starting kmod-static-nodes.service - Create Lis=
t of Static Device Nodes...
[   14.624544] systemd[1]: Starting lvm2-monitor.service - Monitoring of L=
VM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   14.625084] systemd[1]: Starting modprobe@configfs.service - Load Kerne=
l Module configfs...
[   14.625677] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel =
Module dm_mod...
[   14.626380] systemd[1]: Starting modprobe@drm.service - Load Kernel Mod=
ule drm...
[   14.626900] systemd[1]: Starting modprobe@efi_pstore.service - Load Ker=
nel Module efi_pstore...
[   14.627525] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mo=
dule fuse...
[   14.628194] systemd[1]: Starting modprobe@loop.service - Load Kernel Mo=
dule loop...
[   14.628270] systemd[1]: plymouth-switch-root.service: Deactivated succe=
ssfully.
[   14.628324] systemd[1]: Stopped plymouth-switch-root.service - Plymouth=
 switch root service.
[   14.628518] systemd[1]: systemd-fsck-root.service: Deactivated successf=
ully.
[   14.628534] systemd[1]: Stopped systemd-fsck-root.service - File System=
 Check on Root Device.
[   14.630158] systemd[1]: Starting systemd-journald.service - Journal Ser=
vice...
[   14.630735] systemd[1]: Starting systemd-modules-load.service - Load Ke=
rnel Modules...
[   14.631217] systemd[1]: Starting systemd-network-generator.service - Ge=
nerate network units from Kernel command line...
[   14.631238] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine I=
D Measurement was skipped because of an unmet condition check (ConditionSe=
curity=3Dmeasured-uki).
[   14.631733] systemd[1]: Starting systemd-remount-fs.service - Remount R=
oot and Kernel File Systems...
[   14.631864] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Set=
up (Early) was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
[   14.632953] systemd[1]: Starting systemd-udev-trigger.service - Coldplu=
g All udev Devices...
[   14.633788] loop: module loaded
[   14.634194] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File S=
ystem.
[   14.634311] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue =
File System.
[   14.634381] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug F=
ile System.
[   14.634445] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace=
 File System.
[   14.634739] systemd[1]: Finished kmod-static-nodes.service - Create Lis=
t of Static Device Nodes.
[   14.634963] systemd[1]: modprobe@configfs.service: Deactivated successf=
ully.
[   14.635070] systemd[1]: Finished modprobe@configfs.service - Load Kerne=
l Module configfs.
[   14.635252] systemd[1]: modprobe@dm_mod.service: Deactivated successful=
ly.
[   14.635345] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel =
Module dm_mod.
[   14.635514] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   14.635610] systemd[1]: Finished modprobe@drm.service - Load Kernel Mod=
ule drm.
[   14.635750] systemd[1]: modprobe@efi_pstore.service: Deactivated succes=
sfully.
[   14.635828] systemd[1]: Finished modprobe@efi_pstore.service - Load Ker=
nel Module efi_pstore.
[   14.635940] systemd[1]: modprobe@fuse.service: Deactivated successfully=
.
[   14.635998] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mo=
dule fuse.
[   14.636109] systemd[1]: modprobe@loop.service: Deactivated successfully=
.
[   14.636169] systemd[1]: Finished modprobe@loop.service - Load Kernel Mo=
dule loop.
[   14.636948] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE C=
ontrol File System...
[   14.637017] systemd[1]: systemd-repart.service - Repartition Root Disk =
was skipped because no trigger condition checks were met.
[   14.637878] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully...
[   14.638053] BTRFS info (device dm-0 state M): use zstd compression, lev=
el 1
[   14.638929] systemd[1]: Finished systemd-modules-load.service - Load Ke=
rnel Modules.
[   14.639133] systemd[1]: Finished systemd-network-generator.service - Ge=
nerate network units from Kernel command line.
[   14.639239] systemd[1]: Finished systemd-remount-fs.service - Remount R=
oot and Kernel File Systems.
[   14.639328] systemd[1]: iscsi-onboot.service - Special handling of earl=
y boot iSCSI sessions was skipped because of an unmet condition check (Con=
ditionDirectoryNotEmpty=3D/sys/class/iscsi_session).
[   14.639613] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware =
Database was skipped because of an unmet condition check (ConditionNeedsUp=
date=3D/etc).
[   14.639644] systemd[1]: systemd-pstore.service - Platform Persistent St=
orage Archival was skipped because of an unmet condition check (ConditionD=
irectoryNotEmpty=3D/sys/fs/pstore).
[   14.640248] systemd[1]: Starting systemd-random-seed.service - Load/Sav=
e OS Random Seed...
[   14.640825] systemd[1]: Starting systemd-sysctl.service - Apply Kernel =
Variables...
[   14.640866] systemd[1]: systemd-tpm2-setup.service - TPM2 SRK Setup was=
 skipped because of an unmet condition check (ConditionSecurity=3Dmeasured=
-uki).
[   14.641410] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE Co=
ntrol File System.
[   14.641742] systemd-journald[1214]: Collecting audit messages is enable=
d.
[   14.643899] systemd[1]: Started systemd-journald.service - Journal Serv=
ice.
[   14.644044] audit: type=3D1130 audit(1724783083.582:4): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.664355] audit: type=3D1130 audit(1724783083.602:5): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-random-seed comm=3D"systemd" exe=3D"/usr/lib/systemd/sy=
stemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.665019] systemd-journald[1214]: Received client request to flush ru=
ntime journal.
[   14.665491] audit: type=3D1334 audit(1724783083.603:6): prog-id=3D41 op=
=3DLOAD
[   14.665495] audit: type=3D1334 audit(1724783083.603:7): prog-id=3D42 op=
=3DLOAD
[   14.665497] audit: type=3D1334 audit(1724783083.603:8): prog-id=3D43 op=
=3DLOAD
[   14.666727] audit: type=3D1130 audit(1724783083.604:9): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.672006] systemd-journald[1214]: /var/log/journal/22eefcbae62e456490=
34b9fa7cc627d0/system.journal: Journal file uses a different sequence numb=
er ID, rotating.
[   14.672009] systemd-journald[1214]: Rotating system journal.
[   14.672106] audit: type=3D1130 audit(1724783083.610:10): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 ms=
g=3D'unit=3Dlvm2-monitor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.681574] audit: type=3D1130 audit(1724783083.619:11): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 ms=
g=3D'unit=3Dsystemd-userdbd comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.794859] BTRFS info: devid 1 device path /dev/mapper/luks-49436d43-a=
842-4f89-a4aa-93ea838ffd01 changed to /dev/dm-0 scanned by (udev-worker) (=
1288)
[   14.795713] BTRFS info: devid 1 device path /dev/dm-0 changed to /dev/m=
apper/luks-49436d43-a842-4f89-a4aa-93ea838ffd01 scanned by (udev-worker) (=
1288)
[   14.806005] zram0: detected capacity change from 0 to 16777216
[   14.827201] Consider using thermal netlink events interface
[   14.832888] input: Intel HID events as /devices/platform/INTC1070:00/in=
put/input15
[   14.835893] intel-hid INTC1070:00: platform supports 5 button array
[   14.838245] input: Intel HID 5 button array as /devices/platform/INTC10=
70:00/input/input16
[   14.841471] intel_pmc_core INT33A1:00:  initialized
[   14.861616] resource: resource sanity check: requesting [mem 0x00000000=
fedc0000-0x00000000fedcffff], which spans more than pnp 00:05 [mem 0xfedc0=
000-0xfedc7fff]
[   14.861622] caller igen6_probe+0x2f6/0x800 [igen6_edac] mapping multipl=
e BARs
[   14.862299] EDAC MC0: Giving out device to module igen6_edac controller=
 Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   14.866173] EDAC MC1: Giving out device to module igen6_edac controller=
 Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   14.866204] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[   14.866206] EDAC igen6 MC1: ADDR 0x7fffffffe0
[   14.866208] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[   14.866209] EDAC igen6 MC0: ADDR 0x7fffffffe0
[   14.866247] EDAC igen6: v2.5.1
[   14.878331] mc: Linux media interface: v0.10
[   14.879200] Adding 8388604k swap on /dev/zram0.  Priority:100 extents:1=
 across:8388604k SSDsc
[   14.879226] ACPI: battery: new extension: Dell DDV Battery Extension
[   14.879237] input: PC Speaker as /devices/platform/pcspkr/input/input17
[   14.882876] e1000e: Intel(R) PRO/1000 Network Driver
[   14.882878] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[   14.882904] e1000e 0000:00:1f.6: enabling device (0000 -> 0002)
[   14.883303] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) s=
et to dynamic conservative mode
[   14.888956] idma64 idma64.0: Found Intel integrated DMA 64-bit
[   14.889061] ACPI: bus type thunderbolt registered
[   14.895013] videodev: Linux video capture interface: v2.00
[   14.901332] idma64 idma64.1: Found Intel integrated DMA 64-bit
[   14.943010] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 65536=
0 ms ovfl timer
[   14.943013] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   14.943014] RAPL PMU: hw unit of domain package 2^-14 Joules
[   14.943015] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   14.943016] RAPL PMU: hw unit of domain psys 2^-14 Joules
[   14.969579] input: Dell Privacy Driver as /devices/platform/PNP0C14:02/=
wmi_bus/wmi_bus-PNP0C14:02/6932965F-1671-4CEB-B988-D3AB0A901919/input/inpu=
t18
[   14.969808] input: Dell WMI hotkeys as /devices/platform/PNP0C14:02/wmi=
_bus/wmi_bus-PNP0C14:02/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input19
[   15.056168] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[   15.058818] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[   15.059117] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   15.059168] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   15.069942] i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present=
 on SMBus but its address is unknown, skipping registration
[   15.069947] i2c i2c-14: Memory type 0x22 not supported yet, not instant=
iating SPD
[   15.102280] intel_rapl_msr: PL4 support detected.
[   15.107239] intel_rapl_common: Found RAPL domain package
[   15.107242] intel_rapl_common: Found RAPL domain core
[   15.107243] intel_rapl_common: Found RAPL domain uncore
[   15.107245] intel_rapl_common: Found RAPL domain psys
[   15.107374] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registere=
d PHC clock
[   15.107861] dell_laptop: Using i8042 filter function for receiving even=
ts
[   15.192508] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) c8=
:4b:d6:74:32:58
[   15.192512] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connect=
ion
[   15.192706] e1000e 0000:00:1f.6 eth0: MAC: 15, PHY: 12, PBA No: FFFFFF-=
0FF
[   15.213442] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
[   15.216162] iTCO_vendor_support: vendor-support=3D0
[   15.216578] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04:=
 bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
[   15.243153] cfg80211: Loading compiled-in X.509 certificates for regula=
tory database
[   15.243234] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D=
6, TCOBASE=3D0x0400)
[   15.243196] mei_pxp 0000:00:16.0-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: =
bound 0000:00:02.0 (ops i915_pxp_tee_component_ops [i915])
[   15.243579] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   15.243744] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db=
18c600'
[   15.244450] usb 3-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:=
673c)
[   15.244643] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 000=
2)
[   15.244895] intel_rapl_common: Found RAPL domain package
[   15.245670] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayou=
t=3D0)
[   15.253044] usb 3-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:=
673c)
[   15.254861] Creating 1 MTD partitions on "0000:00:1f.5":
[   15.254864] 0x000000000000-0x000002000000 : "BIOS"
[   15.257325] usbcore: registered new interface driver uvcvideo
[   15.259635] Creating 1 MTD partitions on "0000:00:1f.5-chip1":
[   15.259640] 0x000000000000-0x000001000000 : "BIOS1"
[   15.271338] intel_tcc_cooling: TCC Offset locked
[   15.277723] Intel(R) Wireless WiFi driver for Linux
[   15.278024] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   15.284416] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x80=
400 wfpm id 0x80000020
[   15.284469] iwlwifi 0000:00:14.3: PCI dev 51f0/4090, rev=3D0x370, rfid=
=3D0x2010d000
[   15.312048] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[   15.312290] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_au=
dio_component_bind_ops [i915])
[   15.363359] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.=
0.2.42
[   15.364119] iwlwifi 0000:00:14.3: loaded firmware version 89.202a2f7b.0=
 so-a0-gf-a0-89.ucode op_mode iwlmvm
[   15.427639] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3204: =
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   15.427643] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[   15.427644] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0=
/0x0/0x0/0x0)
[   15.427646] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[   15.427647] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   15.427648] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
[   15.427649] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x1=
a
[   15.427650] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[   15.549549] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0=
000:00:1f.3/sound/card0/input20
[   15.549594] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input21
[   15.549619] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input22
[   15.549652] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input23
[   15.549675] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input24
[   15.557672] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160M=
Hz, REV=3D0x370
[   15.570061] iwlwifi 0000:00:14.3: WRT: Invalid buffer destination
[   15.662116] EXT4-fs (nvme1n1p2): mounted filesystem 082f08c2-faa7-432e-=
bbb2-db65ef31d4ea r/w with ordered data mode. Quota mode: none.
[   15.732650] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
[   15.732710] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[   15.732757] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   15.732819] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
[   15.732829] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   15.735470] iwlwifi 0000:00:14.3: loaded PNVM version 35148b80
[   15.751088] iwlwifi 0000:00:14.3: Detected RF GF, rfid=3D0x2010d000
[   15.822520] iwlwifi 0000:00:14.3: base HW address: 8c:17:59:de:0b:16
[   15.846377] iwlwifi 0000:00:14.3 wlp0s20f3: renamed from wlan0
[   15.910066] RPC: Registered named UNIX socket transport module.
[   15.910068] RPC: Registered udp transport module.
[   15.910068] RPC: Registered tcp transport module.
[   15.910069] RPC: Registered tcp-with-tls transport module.
[   15.910069] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   16.025199] block nvme1n1: No UUID available providing old NGUID
[   16.120851] NET: Registered PF_QIPCRTR protocol family
[   16.834341] iwlwifi 0000:00:14.3: RF_KILL bit toggled to disable radio.
[   16.834353] iwlwifi 0000:00:14.3: reporting RF_KILL (radio disabled)
[   20.136709] nouveau 0000:01:00.0: gsp: mmu fault queued
[   20.137717] nouveau 0000:01:00.0: gsp: rc engn:0000000b chid:8 type:31 =
scope:1 part:233
[   20.137738] nouveau 0000:01:00.0: fifo:bd207ad:0001:0008:[(udev-worker)=
[544]] errored - disabling channel
[   20.137752] nouveau 0000:01:00.0: DRM: channel 8 killed!
[   20.138451] nouveau 0000:01:00.0: gsp: mmu fault queued
[   20.139443] nouveau 0000:01:00.0: gsp: rc engn:00000001 chid:0 type:31 =
scope:1 part:233
[   20.139458] nouveau 0000:01:00.0: fifo:000000:0000:0000:[(udev-worker)[=
544]] errored - disabling channel
[   20.139467] nouveau 0000:01:00.0: DRM: channel 0 killed!
[   25.086292] nouveau 0000:01:00.0: gsp: rc engn:00000001 chid:0 type:31 =
scope:1 part:233
[   56.664784] rfkill: input handler disabled
[   97.586090] systemd-journald[1214]: /var/log/journal/22eefcbae62e456490=
34b9fa7cc627d0/user-1000.journal: Journal file uses a different sequence n=
umber ID, rotating.
[   97.924688] rfkill: input handler enabled
[  131.238299] rfkill: input handler disabled
[  199.681258] bridge: filtering via arp/ip/ip6tables is no longer availab=
le by default. Update your scripts to load br_netfilter if you need this.
[  205.650365] iwlwifi 0000:00:14.3: RF_KILL bit toggled to enable radio.
[  205.650374] iwlwifi 0000:00:14.3: reporting RF_KILL (radio enabled)
[  205.662821] iwlwifi 0000:00:14.3: WRT: Invalid buffer destination
[  205.819927] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
[  205.819972] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[  205.820024] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
[  205.820077] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[  205.821219] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[  205.919443] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, wi=
th index: 1
[  209.264024] wlp0s20f3: authenticate with f0:9f:c2:de:24:1d (local addre=
ss=3Dee:89:07:ec:0b:03)
[  209.265135] wlp0s20f3: send auth to f0:9f:c2:de:24:1d (try 1/3)
[  209.312458] wlp0s20f3: authenticated
[  209.313426] wlp0s20f3: associate with f0:9f:c2:de:24:1d (try 1/3)
[  209.317462] wlp0s20f3: RX AssocResp from f0:9f:c2:de:24:1d (capab=3D0x1=
501 status=3D0 aid=3D6)
[  209.329077] wlp0s20f3: associated
[  209.339091] wlp0s20f3: Limiting TX power to 21 (24 - 3) dBm as advertis=
ed by f0:9f:c2:de:24:1d
[  213.476111] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com fo=
r information.
[  213.476116] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jaso=
n@zx2c4.com>. All Rights Reserved.
[  270.982944] BTRFS: device label Samsung devid 1 transid 5344 /dev/nvme0=
n1p1 (259:1) scanned by pool-udisksd (5499)
[  270.983474] BTRFS info (device nvme0n1p1): first mount of filesystem 7f=
1597b2-f31f-4083-b98c-e928c88178b8
[  270.983516] BTRFS info (device nvme0n1p1): using crc32c (crc32c-intel) =
checksum algorithm
[  270.983524] BTRFS info (device nvme0n1p1): using free-space-tree

--kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=log_buf_len-1M
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.10.6-200.fc40.x86_64 (mockbuild@f1069ead281=
040288cd8d3761ad1265a) (gcc (GCC) 14.2.1 20240801 (Red Hat 14.2.1-1), GNU =
ld version 2.41-37.fc40) #1 SMP PREEMPT_DYNAMIC Mon Aug 19 14:09:30 UTC 20=
24
[    0.000000] Command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6-200.fc=
40.x86_64 root=3DUUID=3D59545c18-3923-4411-9c12-245ab6cee067 ro rootflags=
=3Dsubvol=3Droot rd.luks.uuid=3Dluks-49436d43-a842-4f89-a4aa-93ea838ffd01 =
rhgb quiet
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kerne=
l split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usab=
le
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000004cd14fff] usab=
le
[    0.000000] BIOS-e820: [mem 0x000000004cd15000-0x0000000050d10fff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000050d11000-0x0000000051571fff] ACPI=
 NVS
[    0.000000] BIOS-e820: [mem 0x0000000051572000-0x00000000517fefff] ACPI=
 data
[    0.000000] BIOS-e820: [mem 0x00000000517ff000-0x00000000517fffff] usab=
le
[    0.000000] BIOS-e820: [mem 0x0000000051800000-0x00000000561fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000056a00000-0x00000000607fffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000c0000000-0x00000000cfffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000f9800000-0x00000000f9ffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed7ffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] rese=
rved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000089f7fffff] usab=
le
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x47003018-0x47012057] usable =3D=3D> usa=
ble
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009e=
fff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000047003=
017] usable
[    0.000000] reserve setup_data: [mem 0x0000000047003018-0x0000000047012=
057] usable
[    0.000000] reserve setup_data: [mem 0x0000000047012058-0x000000004cd14=
fff] usable
[    0.000000] reserve setup_data: [mem 0x000000004cd15000-0x0000000050d10=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000050d11000-0x0000000051571=
fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000051572000-0x00000000517fe=
fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000517ff000-0x00000000517ff=
fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000051800000-0x00000000561ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000056a00000-0x00000000607ff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000c0000000-0x00000000cffff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f9800000-0x00000000f9fff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed20000-0x00000000fed7f=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000fffff=
fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000089f7ff=
fff] usable
[    0.000000] efi: EFI v2.7 by Dell
[    0.000000] efi: ACPI=3D0x517fe000 ACPI 2.0=3D0x517fe014 SMBIOS=3D0x4d5=
a6000 TPMFinalLog=3D0x5147b000 ESRT=3D0x4d53e718 MEMATTR=3D0x470e2018 MOKv=
ar=3D0x4d5a5000 RNG=3D0x5173e018 TPMEventLog=3D0x47013018
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem102: MMIO range=3D[0xc0000000-0xcfffffff] (2=
56MB) from e820 map
[    0.000000] e820: remove [mem 0xc0000000-0xcfffffff] reserved
[    0.000000] efi: Remove mem103: MMIO range=3D[0xf9800000-0xf9ffffff] (8=
MB) from e820 map
[    0.000000] e820: remove [mem 0xf9800000-0xf9ffffff] reserved
[    0.000000] efi: Remove mem105: MMIO range=3D[0xff000000-0xffffffff] (1=
6MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.4 present.
[    0.000000] DMI: Dell Inc. Precision 3571/07K1M2, BIOS 1.25.0 07/12/202=
4
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 2700.000 MHz processor
[    0.000000] tsc: Detected 2688.000 MHz TSC
[    0.000005] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> res=
erved
[    0.000006] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000010] last_pfn =3D 0x89f800 max_arch_pfn =3D 0x400000000
[    0.000013] MTRR map: 5 entries (3 fixed + 2 variable; max 23), built f=
rom 10 variable MTRRs
[    0.000015] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- W=
T
[    0.000412] last_pfn =3D 0x51800 max_arch_pfn =3D 0x400000000
[    0.005094] esrt: Reserving ESRT space from 0x000000004d53e718 to 0x000=
000004d53e778.
[    0.005103] Using GB pages for direct mapping
[    0.005104] Incomplete global flushes, disabling PCID
[    0.005268] secureboot: Secure boot disabled
[    0.005268] RAMDISK: [mem 0x35005000-0x39c3afff]
[    0.005272] ACPI: Early table checksum verification disabled
[    0.005274] ACPI: RSDP 0x00000000517FE014 000024 (v02 DELL  )
[    0.005277] ACPI: XSDT 0x0000000051753188 00012C (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005281] ACPI: FACP 0x00000000517EE000 000114 (v06 DELL   Dell Inc 0=
0000002      01000013)
[    0.005284] ACPI: DSDT 0x0000000051777000 0734DE (v02 DELL   Dell Inc 0=
0000002      01000013)
[    0.005286] ACPI: FACS 0x00000000514BB000 000040
[    0.005288] ACPI: SSDT 0x00000000517FC000 00038C (v02 PmaxDv Pmax_Dev 0=
0000001 INTL 20200717)
[    0.005290] ACPI: SSDT 0x00000000517F6000 005C55 (v02 CpuRef CpuSsdt  0=
0003000 INTL 20200717)
[    0.005292] ACPI: SSDT 0x00000000517EF000 0066EB (v02 DptfTb DptfTabl 0=
0001000 INTL 20200717)
[    0.005294] ACPI: HPET 0x00000000517ED000 000038 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005296] ACPI: APIC 0x00000000517EC000 0001DC (v05 DELL   Dell Inc 0=
0000002      01000013)
[    0.005298] ACPI: MCFG 0x00000000517EB000 00003C (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005300] ACPI: SSDT 0x0000000051775000 001446 (v02 DELL   DellRtd3 0=
0001000 INTL 20200717)
[    0.005302] ACPI: SSDT 0x000000005176F000 00132D (v02 INTEL  IgfxSsdt 0=
0003000 INTL 20200717)
[    0.005304] ACPI: SSDT 0x0000000051761000 00D39F (v02 INTEL  TcssSsdt 0=
0001000 INTL 20200717)
[    0.005305] ACPI: NHLT 0x0000000051760000 0002F1 (v00 DELL   Dell Inc 0=
0000002      01000013)
[    0.005307] ACPI: SSDT 0x000000005175E000 00107C (v02 DELL   UsbCTabl 0=
0001000 INTL 20200717)
[    0.005309] ACPI: LPIT 0x000000005175D000 0000CC (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005311] ACPI: WSMT 0x000000005175C000 000028 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005313] ACPI: SSDT 0x000000005175B000 000B44 (v02 DELL   PtidDevc 0=
0001000 INTL 20200717)
[    0.005315] ACPI: SSDT 0x0000000051758000 002357 (v02 DELL   TbtTypeC 0=
0000000 INTL 20200717)
[    0.005317] ACPI: DBGP 0x0000000051757000 000034 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005318] ACPI: DBG2 0x0000000051756000 000054 (v00 DELL   Dell Inc 0=
0000002      01000013)
[    0.005320] ACPI: BOOT 0x0000000051755000 000028 (v01 DELL   CBX3     0=
0000002      01000013)
[    0.005322] ACPI: MSDM 0x0000000051754000 000055 (v03 DELL   CBX3     0=
6222004 AMI  00010013)
[    0.005324] ACPI: SSDT 0x00000000517FD000 00060E (v02 DELL   Tpm2Tabl 0=
0001000 INTL 20200717)
[    0.005326] ACPI: TPM2 0x0000000051752000 00004C (v04 DELL   Dell Inc 0=
0000002      01000013)
[    0.005328] ACPI: DMAR 0x0000000051751000 000088 (v02 INTEL  Dell Inc 0=
0000002      01000013)
[    0.005330] ACPI: SSDT 0x0000000051748000 0087EC (v02 DELL   NvdTable 0=
0001000 INTL 20200717)
[    0.005332] ACPI: SSDT 0x0000000051774000 000ECD (v02 DELL   xh_Dell_ 0=
0000000 INTL 20200717)
[    0.005334] ACPI: SSDT 0x0000000051744000 003AEA (v02 SocGpe SocGpe   0=
0003000 INTL 20200717)
[    0.005336] ACPI: SSDT 0x0000000051740000 0039DA (v02 SocCmn SocCmn   0=
0003000 INTL 20200717)
[    0.005338] ACPI: SSDT 0x0000000051773000 000144 (v02 Intel  ADebTabl 0=
0001000 INTL 20200717)
[    0.005340] ACPI: UEFI 0x0000000051432000 00063A (v01 INTEL  RstVmdE  0=
0000000 INTL 00000000)
[    0.005342] ACPI: UEFI 0x0000000051431000 00005C (v01 INTEL  RstVmdV  0=
0000000 INTL 00000000)
[    0.005344] ACPI: PHAT 0x0000000051772000 0005AD (v01 DELL   Dell Inc 0=
0000005 MSFT 0100000D)
[    0.005346] ACPI: BGRT 0x0000000051771000 000038 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005347] ACPI: FPDT 0x000000005173F000 000034 (v01 DELL   Dell Inc 0=
0000002      01000013)
[    0.005349] ACPI: Reserving FACP table memory at [mem 0x517ee000-0x517e=
e113]
[    0.005350] ACPI: Reserving DSDT table memory at [mem 0x51777000-0x517e=
a4dd]
[    0.005351] ACPI: Reserving FACS table memory at [mem 0x514bb000-0x514b=
b03f]
[    0.005351] ACPI: Reserving SSDT table memory at [mem 0x517fc000-0x517f=
c38b]
[    0.005352] ACPI: Reserving SSDT table memory at [mem 0x517f6000-0x517f=
bc54]
[    0.005352] ACPI: Reserving SSDT table memory at [mem 0x517ef000-0x517f=
56ea]
[    0.005353] ACPI: Reserving HPET table memory at [mem 0x517ed000-0x517e=
d037]
[    0.005353] ACPI: Reserving APIC table memory at [mem 0x517ec000-0x517e=
c1db]
[    0.005354] ACPI: Reserving MCFG table memory at [mem 0x517eb000-0x517e=
b03b]
[    0.005354] ACPI: Reserving SSDT table memory at [mem 0x51775000-0x5177=
6445]
[    0.005355] ACPI: Reserving SSDT table memory at [mem 0x5176f000-0x5177=
032c]
[    0.005355] ACPI: Reserving SSDT table memory at [mem 0x51761000-0x5176=
e39e]
[    0.005356] ACPI: Reserving NHLT table memory at [mem 0x51760000-0x5176=
02f0]
[    0.005356] ACPI: Reserving SSDT table memory at [mem 0x5175e000-0x5175=
f07b]
[    0.005357] ACPI: Reserving LPIT table memory at [mem 0x5175d000-0x5175=
d0cb]
[    0.005357] ACPI: Reserving WSMT table memory at [mem 0x5175c000-0x5175=
c027]
[    0.005358] ACPI: Reserving SSDT table memory at [mem 0x5175b000-0x5175=
bb43]
[    0.005358] ACPI: Reserving SSDT table memory at [mem 0x51758000-0x5175=
a356]
[    0.005359] ACPI: Reserving DBGP table memory at [mem 0x51757000-0x5175=
7033]
[    0.005359] ACPI: Reserving DBG2 table memory at [mem 0x51756000-0x5175=
6053]
[    0.005360] ACPI: Reserving BOOT table memory at [mem 0x51755000-0x5175=
5027]
[    0.005360] ACPI: Reserving MSDM table memory at [mem 0x51754000-0x5175=
4054]
[    0.005361] ACPI: Reserving SSDT table memory at [mem 0x517fd000-0x517f=
d60d]
[    0.005361] ACPI: Reserving TPM2 table memory at [mem 0x51752000-0x5175=
204b]
[    0.005362] ACPI: Reserving DMAR table memory at [mem 0x51751000-0x5175=
1087]
[    0.005362] ACPI: Reserving SSDT table memory at [mem 0x51748000-0x5175=
07eb]
[    0.005363] ACPI: Reserving SSDT table memory at [mem 0x51774000-0x5177=
4ecc]
[    0.005363] ACPI: Reserving SSDT table memory at [mem 0x51744000-0x5174=
7ae9]
[    0.005364] ACPI: Reserving SSDT table memory at [mem 0x51740000-0x5174=
39d9]
[    0.005364] ACPI: Reserving SSDT table memory at [mem 0x51773000-0x5177=
3143]
[    0.005365] ACPI: Reserving UEFI table memory at [mem 0x51432000-0x5143=
2639]
[    0.005365] ACPI: Reserving UEFI table memory at [mem 0x51431000-0x5143=
105b]
[    0.005366] ACPI: Reserving PHAT table memory at [mem 0x51772000-0x5177=
25ac]
[    0.005366] ACPI: Reserving BGRT table memory at [mem 0x51771000-0x5177=
1037]
[    0.005367] ACPI: Reserving FPDT table memory at [mem 0x5173f000-0x5173=
f033]
[    0.005730] No NUMA configuration found
[    0.005730] Faking a node at [mem 0x0000000000000000-0x000000089f7fffff=
]
[    0.005734] NODE_DATA(0) allocated [mem 0x89f7d5000-0x89f7fffff]
[    0.005862] Zone ranges:
[    0.005862]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005863]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005864]   Normal   [mem 0x0000000100000000-0x000000089f7fffff]
[    0.005865]   Device   empty
[    0.005866] Movable zone start for each node
[    0.005867] Early memory node ranges
[    0.005867]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005868]   node   0: [mem 0x0000000000100000-0x000000004cd14fff]
[    0.005869]   node   0: [mem 0x00000000517ff000-0x00000000517fffff]
[    0.005869]   node   0: [mem 0x0000000100000000-0x000000089f7fffff]
[    0.005871] Initmem setup node 0 [mem 0x0000000000001000-0x000000089f7f=
ffff]
[    0.005875] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005893] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007382] On node 0, zone DMA32: 19178 pages in unavailable ranges
[    0.043567] On node 0, zone Normal: 26624 pages in unavailable ranges
[    0.043580] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.043637] Reserving Intel graphics memory at [mem 0x5c800000-0x607fff=
ff]
[    0.044491] ACPI: PM-Timer IO Port: 0x1808
[    0.044497] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.044498] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.044499] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.044500] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.044500] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.044501] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.044502] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.044502] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.044503] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.044504] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.044505] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.044505] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.044506] ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.044507] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.044589] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0=
-119
[    0.044591] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.044592] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.044595] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.044596] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.044601] e820: update [mem 0x4708e000-0x470dffff] usable =3D=3D> res=
erved
[    0.044607] TSC deadline timer available
[    0.044609] CPU topo: Max. logical packages:   1
[    0.044609] CPU topo: Max. logical dies:       1
[    0.044610] CPU topo: Max. dies per package:   1
[    0.044611] CPU topo: Max. threads per core:   2
[    0.044612] CPU topo: Num. cores per package:    14
[    0.044612] CPU topo: Num. threads per package:  20
[    0.044613] CPU topo: Allowing 20 present CPUs plus 0 hotplug CPUs
[    0.044621] PM: hibernation: Registered nosave memory: [mem 0x00000000-=
0x00000fff]
[    0.044622] PM: hibernation: Registered nosave memory: [mem 0x0009f000-=
0x000fffff]
[    0.044623] PM: hibernation: Registered nosave memory: [mem 0x47003000-=
0x47003fff]
[    0.044624] PM: hibernation: Registered nosave memory: [mem 0x47012000-=
0x47012fff]
[    0.044625] PM: hibernation: Registered nosave memory: [mem 0x4708e000-=
0x470dffff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x4cd15000-=
0x50d10fff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x50d11000-=
0x51571fff]
[    0.044626] PM: hibernation: Registered nosave memory: [mem 0x51572000-=
0x517fefff]
[    0.044627] PM: hibernation: Registered nosave memory: [mem 0x51800000-=
0x561fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x56200000-=
0x569fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x56a00000-=
0x607fffff]
[    0.044628] PM: hibernation: Registered nosave memory: [mem 0x60800000-=
0xfed1ffff]
[    0.044629] PM: hibernation: Registered nosave memory: [mem 0xfed20000-=
0xfed7ffff]
[    0.044629] PM: hibernation: Registered nosave memory: [mem 0xfed80000-=
0xffffffff]
[    0.044630] [mem 0x60800000-0xfed1ffff] available for PCI devices
[    0.044631] Booting paravirtualized kernel on bare hardware
[    0.044632] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.049057] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:20 nr_cpu_ids:20=
 nr_node_ids:1
[    0.049928] percpu: Embedded 87 pages/cpu s233472 r8192 d114688 u524288
[    0.049932] pcpu-alloc: s233472 r8192 d114688 u524288 alloc=3D1*2097152
[    0.049934] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07
[    0.049937] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15
[    0.049940] pcpu-alloc: [0] 16 17 18 19
[    0.049950] Kernel command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6=
-200.fc40.x86_64 root=3DUUID=3D59545c18-3923-4411-9c12-245ab6cee067 ro roo=
tflags=3Dsubvol=3Droot rd.luks.uuid=3Dluks-49436d43-a842-4f89-a4aa-93ea838=
ffd01 rhgb quiet
[    0.049992] Unknown kernel command line parameters "rhgb BOOT_IMAGE=3D(=
hd1,gpt2)/vmlinuz-6.10.6-200.fc40.x86_64", will be passed to user space.
[    0.052098] Dentry cache hash table entries: 4194304 (order: 13, 335544=
32 bytes, linear)
[    0.053142] Inode-cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.053274] Fallback order for Node 0: 0
[    0.053277] Built 1 zonelists, mobility grouping on.  Total pages: 8307=
892
[    0.053277] Policy zone: Normal
[    0.053431] mem auto-init: stack:all(zero), heap alloc:on, heap free:of=
f
[    0.053438] software IO TLB: area num 32.
[    0.101689] Memory: 32316672K/33231568K available (20480K kernel code, =
4314K rwdata, 15296K rodata, 4720K init, 5284K bss, 914636K reserved, 0K c=
ma-reserved)
[    0.102302] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D20,=
 Nodes=3D1
[    0.102334] ftrace: allocating 55666 entries in 218 pages
[    0.107456] ftrace: allocated 218 pages with 5 groups
[    0.108004] Dynamic Preempt: voluntary
[    0.108070] rcu: Preemptible hierarchical RCU implementation.
[    0.108071] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_id=
s=3D20.
[    0.108072] 	Trampoline variant of Tasks RCU enabled.
[    0.108072] 	Rude variant of Tasks RCU enabled.
[    0.108073] 	Tracing variant of Tasks RCU enabled.
[    0.108073] rcu: RCU calculated value of scheduler-enlistment delay is =
100 jiffies.
[    0.108074] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D20
[    0.108083] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adju=
st=3D1.
[    0.108085] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.108086] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_c=
b_adjust=3D1.
[    0.110595] NR_IRQS: 524544, nr_irqs: 2216, preallocated irqs: 16
[    0.110967] rcu: srcu_init: Setting srcu_struct sizes based on contenti=
on.
[    0.111416] kfence: initialized - using 2097152 bytes for 255 objects a=
t 0x(____ptrval____)-0x(____ptrval____)
[    0.111450] Console: colour dummy device 80x25
[    0.111452] printk: legacy console [tty0] enabled
[    0.111481] ACPI: Core revision 20240322
[    0.111719] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.111720] APIC: Switch to symmetric I/O mode setup
[    0.111721] DMAR: Host address width 39
[    0.111722] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.111727] DMAR: dmar0: reg_base_addr fed90000 ver 4:0 cap 1c0000c4066=
0462 ecap 29a00f0505e
[    0.111728] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.111731] DMAR: dmar1: reg_base_addr fed91000 ver 5:0 cap d2008c40660=
462 ecap f050da
[    0.111733] DMAR: RMRR base: 0x0000005c000000 end: 0x000000607fffff
[    0.111735] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.111736] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.111737] DMAR-IR: Queued invalidation will be enabled to support x2a=
pic and Intr-remapping.
[    0.115674] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.115676] x2apic enabled
[    0.115747] APIC: Switched APIC routing to: cluster x2apic
[    0.127097] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles=
: 0x26bef67878b, max_idle_ns: 440795293631 ns
[    0.127103] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 5376.00 BogoMIPS (lpj=3D2688000)
[    0.127154] CPU0: Thermal monitoring enabled (TM1)
[    0.127155] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.127267] CET detected: Indirect Branch Tracking enabled
[    0.127268] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.127269] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.127271] process: using mwait in idle threads
[    0.127273] Spectre V1 : Mitigation: usercopy/swapgs barriers and __use=
r pointer sanitization
[    0.127275] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.127276] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RS=
B on context switch
[    0.127276] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL=
 on VMEXIT
[    0.127278] Spectre V2 : mitigation: Enabling conditional Indirect Bran=
ch Prediction Barrier
[    0.127279] Speculative Store Bypass: Mitigation: Speculative Store Byp=
ass disabled via prctl
[    0.127279] Register File Data Sampling: Mitigation: Clear Register Fil=
e
[    0.127288] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poin=
t registers'
[    0.127289] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.127289] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.127290] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys U=
ser registers'
[    0.127290] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User=
 registers'
[    0.127291] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.127292] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.127292] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.127293] x86/fpu: Enabled xstate features 0xa07, context size is 856=
 bytes, using 'compacted' format.
[    0.128101] Freeing SMP alternatives memory: 48K
[    0.128101] pid_max: default: 32768 minimum: 301
[    0.128101] LSM: initializing lsm=3Dlockdown,capability,yama,selinux,bp=
f,landlock,ima,evm
[    0.128101] Yama: becoming mindful.
[    0.128101] SELinux:  Initializing.
[    0.128101] LSM support for eBPF active
[    0.128101] landlock: Up and running.
[    0.128101] Mount-cache hash table entries: 65536 (order: 7, 524288 byt=
es, linear)
[    0.128101] Mountpoint-cache hash table entries: 65536 (order: 7, 52428=
8 bytes, linear)
[    0.128101] smpboot: CPU0: 12th Gen Intel(R) Core(TM) i7-12700H (family=
: 0x6, model: 0x9a, stepping: 0x3)
[    0.128101] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-bas=
eline,  AnyThread deprecated, Alderlake Hybrid events, 32-deep LBR, full-w=
idth counters, Intel PMU driver.
[    0.128101] core: cpu_core PMU driver:
[    0.128101] ... version:                5
[    0.128101] ... bit width:              48
[    0.128101] ... generic registers:      8
[    0.128101] ... value mask:             0000ffffffffffff
[    0.128101] ... max period:             00007fffffffffff
[    0.128101] ... fixed-purpose events:   4
[    0.128101] ... event mask:             0001000f000000ff
[    0.128101] signal: max sigframe size: 3632
[    0.128101] Estimated ratio of average max frequency by base frequency =
(times 1024): 1668
[    0.128101] rcu: Hierarchical SRCU implementation.
[    0.128101] rcu: 	Max phase no-delay instances is 400.
[    0.128101] NMI watchdog: Enabled. Permanently consumes one hw-PMU coun=
ter.
[    0.128181] smp: Bringing up secondary CPUs ...
[    0.128236] smpboot: x86: Booting SMP configuration:
[    0.128236] .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #13 #14 =
#15 #16 #17 #18 #19
[    0.016758] core: cpu_atom PMU driver: PEBS-via-PT
[    0.016758] ... version:                5
[    0.016758] ... bit width:              48
[    0.016758] ... generic registers:      6
[    0.016758] ... value mask:             0000ffffffffffff
[    0.016758] ... max period:             00007fffffffffff
[    0.016758] ... fixed-purpose events:   3
[    0.016758] ... event mask:             000000070000003f
[    0.133168]   #1  #3  #5  #7  #9 #11
[    0.136161] smp: Brought up 1 node, 20 CPUs
[    0.136161] smpboot: Total of 20 processors activated (107520.00 BogoMI=
PS)
[    0.138155] devtmpfs: initialized
[    0.138155] x86/mm: Memory block size: 128MB
[    0.139726] ACPI: PM: Registering ACPI NVS region [mem 0x50d11000-0x515=
71fff] (8785920 bytes)
[    0.139726] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 1911260446275000 ns
[    0.139726] futex hash table entries: 8192 (order: 7, 524288 bytes, lin=
ear)
[    0.139726] pinctrl core: initialized pinctrl subsystem
[    0.140102] PM: RTC time: 18:24:29, date: 2024-08-27
[    0.140456] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.140787] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloc=
ations
[    0.141048] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
[    0.141324] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
[    0.141334] audit: initializing netlink subsys (disabled)
[    0.141375] audit: type=3D2000 audit(1724783069.014:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[    0.141375] thermal_sys: Registered thermal governor 'fair_share'
[    0.141375] thermal_sys: Registered thermal governor 'bang_bang'
[    0.141375] thermal_sys: Registered thermal governor 'step_wise'
[    0.141375] thermal_sys: Registered thermal governor 'user_space'
[    0.141376] cpuidle: using governor menu
[    0.141376] Simple Boot Flag at 0x47 set to 0x80
[    0.141376] ACPI FADT declares the system doesn't support PCIe ASPM, so=
 disable it
[    0.141376] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.141376] PCI: ECAM [mem 0xc0000000-0xce0fffff] (base 0xc0000000) for=
 domain 0000 [bus 00-e0]
[    0.141376] PCI: Using configuration type 1 for base access
[    0.142134] kprobes: kprobe jump-optimization is enabled. All kprobes a=
re optimized if possible.
[    0.143122] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pag=
es
[    0.143124] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.143125] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pag=
es
[    0.143126] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.143175] Demotion targets for Node 0: null
[    0.144113] cryptd: max_cpu_qlen set to 1000
[    0.144145] raid6: skipped pq benchmark and selected avx2x4
[    0.144145] raid6: using avx2x2 recovery algorithm
[    0.144204] ACPI: Added _OSI(Module Device)
[    0.144205] ACPI: Added _OSI(Processor Device)
[    0.144206] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.144206] ACPI: Added _OSI(Processor Aggregator Device)
[    0.227916] ACPI: 16 ACPI AML tables successfully acquired and loaded
[    0.262644] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.262646] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.263791] ACPI: Dynamic OEM Table Load:
[    0.263801] ACPI: SSDT 0xFFFF92FE8306F000 000394 (v02 PmRef  Cpu0Cst  0=
0003001 INTL 20200717)
[    0.264727] ACPI: Dynamic OEM Table Load:
[    0.264733] ACPI: SSDT 0xFFFF92FE83054000 000626 (v02 PmRef  Cpu0Ist  0=
0003000 INTL 20200717)
[    0.265656] ACPI: Dynamic OEM Table Load:
[    0.265661] ACPI: SSDT 0xFFFF92FE83168000 0001AB (v02 PmRef  Cpu0Psd  0=
0003000 INTL 20200717)
[    0.266524] ACPI: Dynamic OEM Table Load:
[    0.266529] ACPI: SSDT 0xFFFF92FE83054800 0004D4 (v02 PmRef  Cpu0Hwp  0=
0003000 INTL 20200717)
[    0.267684] ACPI: Dynamic OEM Table Load:
[    0.267697] ACPI: SSDT 0xFFFF92FE831A8000 001BAF (v02 PmRef  ApIst    0=
0003000 INTL 20200717)
[    0.269011] ACPI: Dynamic OEM Table Load:
[    0.269017] ACPI: SSDT 0xFFFF92FE831AE000 001038 (v02 PmRef  ApHwp    0=
0003000 INTL 20200717)
[    0.270202] ACPI: Dynamic OEM Table Load:
[    0.270208] ACPI: SSDT 0xFFFF92FE831AC000 001349 (v02 PmRef  ApPsd    0=
0003000 INTL 20200717)
[    0.271453] ACPI: Dynamic OEM Table Load:
[    0.271459] ACPI: SSDT 0xFFFF92FE831BA000 000FBB (v02 PmRef  ApCst    0=
0003000 INTL 20200717)
[    0.277386] ACPI: _OSC evaluated successfully for all CPUs
[    0.277466] ACPI: EC: EC started
[    0.277467] ACPI: EC: interrupt blocked
[    0.281258] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.281261] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC used to handle tra=
nsactions
[    0.281262] ACPI: Interpreter enabled
[    0.281316] ACPI: PM: (supports S0 S4 S5)
[    0.281317] ACPI: Using IOAPIC for interrupt routing
[    0.282453] PCI: Using host bridge windows from ACPI; if necessary, use=
 "pci=3Dnocrs" and report a bug
[    0.282454] PCI: Ignoring E820 reservations for host bridge windows
[    0.283544] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.284459] ACPI: \_SB_.PC00.PEG0.PG00: New power resource
[    0.284928] ACPI: \_SB_.PC00.PEG1.PG01: New power resource
[    0.285675] ACPI: \_SB_.PC00.PEG2.PG02: New power resource
[    0.288451] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.294692] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.295305] ACPI: \_SB_.PC00.RP02.PXP5: New power resource
[    0.295849] ACPI: \_SB_.PC00.RP02.PXSX.MRST: New power resource
[    0.295863] ACPI: \_SB_.PC00.RP02.PXSX.DRST: New power resource
[    0.313248] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.313308] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.313359] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.538960] ACPI: \PIN_: New power resource
[    0.539221] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-e0])
[    0.539228] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Clo=
ckPM Segments MSI EDR HPX-Type3]
[    0.540101] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.543033] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHot=
plug PME PCIeCapability LTR DPC]
[    0.543035] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using =
BIOS configuration
[    0.547234] PCI host bridge to bus 0000:00
[    0.547236] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 windo=
w]
[    0.547238] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff windo=
w]
[    0.547239] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bff=
ff window]
[    0.547240] pci_bus 0000:00: root bus resource [mem 0x60800000-0xbfffff=
ff window]
[    0.547241] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x7fff=
ffffff window]
[    0.547243] pci_bus 0000:00: root bus resource [bus 00-e0]
[    0.547453] pci 0000:00:00.0: [8086:4641] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.547700] pci 0000:00:01.0: [8086:460d] type 01 class 0x060400 PCIe R=
oot Port
[    0.547716] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.547719] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    0.547721] pci 0000:00:01.0:   bridge window [mem 0x90000000-0x90fffff=
f]
[    0.547727] pci 0000:00:01.0:   bridge window [mem 0x6000000000-0x6011f=
fffff 64bit pref]
[    0.547778] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.547802] pci 0000:00:01.0: PTM enabled (root), 4ns granularity
[    0.548400] pci 0000:00:02.0: [8086:46a6] type 00 class 0x030000 PCIe R=
oot Complex Integrated Endpoint
[    0.548408] pci 0000:00:02.0: BAR 0 [mem 0x6074000000-0x6074ffffff 64bi=
t]
[    0.548414] pci 0000:00:02.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bi=
t pref]
[    0.548417] pci 0000:00:02.0: BAR 4 [io  0x4000-0x403f]
[    0.548434] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.548437] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x=
000c0000-0x000dffff]
[    0.548462] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit=
]
[    0.548463] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit=
]: contains BAR 0 for 7 VFs
[    0.548469] pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0x1fffffff 64bit=
 pref]
[    0.548471] pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0xdfffffff 64bit=
 pref]: contains BAR 2 for 7 VFs
[    0.548583] pci 0000:00:04.0: [8086:461d] type 00 class 0x118000 conven=
tional PCI endpoint
[    0.548596] pci 0000:00:04.0: BAR 0 [mem 0x6075240000-0x607525ffff 64bi=
t]
[    0.548847] pci 0000:00:06.0: [8086:09ab] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.549403] pci 0000:00:07.0: [8086:466e] type 01 class 0x060400 PCIe R=
oot Port
[    0.549420] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.549424] pci 0000:00:07.0:   bridge window [mem 0x7a000000-0x8fdffff=
f]
[    0.549431] pci 0000:00:07.0:   bridge window [mem 0x6020000000-0x6041f=
fffff 64bit pref]
[    0.549455] pci 0000:00:07.0: Overriding RP PIO Log Size to 4
[    0.549522] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.549547] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.550308] pci 0000:00:07.1: [8086:463f] type 01 class 0x060400 PCIe R=
oot Port
[    0.550325] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.550329] pci 0000:00:07.1:   bridge window [mem 0x64000000-0x79dffff=
f]
[    0.550336] pci 0000:00:07.1:   bridge window [mem 0x6050000000-0x6071f=
fffff 64bit pref]
[    0.550360] pci 0000:00:07.1: Overriding RP PIO Log Size to 4
[    0.550423] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.550449] pci 0000:00:07.1: PTM enabled (root), 4ns granularity
[    0.551272] pci 0000:00:08.0: [8086:464f] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.551281] pci 0000:00:08.0: BAR 0 [mem 0x60752a2000-0x60752a2fff 64bi=
t]
[    0.551434] pci 0000:00:0d.0: [8086:461e] type 00 class 0x0c0330 conven=
tional PCI endpoint
[    0.551444] pci 0000:00:0d.0: BAR 0 [mem 0x6075280000-0x607528ffff 64bi=
t]
[    0.551490] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.551906] pci 0000:00:0d.2: [8086:463e] type 00 class 0x0c0340 conven=
tional PCI endpoint
[    0.551916] pci 0000:00:0d.2: BAR 0 [mem 0x6075200000-0x607523ffff 64bi=
t]
[    0.551922] pci 0000:00:0d.2: BAR 2 [mem 0x60752a1000-0x60752a1fff 64bi=
t]
[    0.551955] pci 0000:00:0d.2: supports D1 D2
[    0.551955] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.552152] pci 0000:00:0e.0: [8086:467f] type 00 class 0x010400 PCIe R=
oot Complex Integrated Endpoint
[    0.552165] pci 0000:00:0e.0: BAR 0 [mem 0x6072000000-0x6073ffffff 64bi=
t]
[    0.552171] pci 0000:00:0e.0: BAR 2 [mem 0x62000000-0x63ffffff]
[    0.552185] pci 0000:00:0e.0: BAR 4 [mem 0x6075100000-0x60751fffff 64bi=
t]
[    0.552542] pci 0000:00:12.0: [8086:51fc] type 00 class 0x070000 conven=
tional PCI endpoint
[    0.552566] pci 0000:00:12.0: BAR 0 [mem 0x6075270000-0x607527ffff 64bi=
t]
[    0.552652] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.553001] pci 0000:00:14.0: [8086:51ed] type 00 class 0x0c0330 conven=
tional PCI endpoint
[    0.553025] pci 0000:00:14.0: BAR 0 [mem 0x6075260000-0x607526ffff 64bi=
t]
[    0.553123] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.553574] pci 0000:00:14.2: [8086:51ef] type 00 class 0x050000 conven=
tional PCI endpoint
[    0.553597] pci 0000:00:14.2: BAR 0 [mem 0x6075298000-0x607529bfff 64bi=
t]
[    0.553610] pci 0000:00:14.2: BAR 2 [mem 0x60752a0000-0x60752a0fff 64bi=
t]
[    0.553833] pci 0000:00:14.3: [8086:51f0] type 00 class 0x028000 PCIe R=
oot Complex Integrated Endpoint
[    0.553896] pci 0000:00:14.3: BAR 0 [mem 0x6075294000-0x6075297fff 64bi=
t]
[    0.554045] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.554850] pci 0000:00:15.0: [8086:51e8] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.555539] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.560150] pci 0000:00:15.1: [8086:51e9] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.560881] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.564061] pci 0000:00:16.0: [8086:51e0] type 00 class 0x078000 conven=
tional PCI endpoint
[    0.564086] pci 0000:00:16.0: BAR 0 [mem 0x607529d000-0x607529dfff 64bi=
t]
[    0.564180] pci 0000:00:16.0: PME# supported from D3hot
[    0.564507] pci 0000:00:17.0: [8086:09ab] type 00 class 0x088000 conven=
tional PCI endpoint
[    0.564962] pci 0000:00:1f.0: [8086:5182] type 00 class 0x060100 conven=
tional PCI endpoint
[    0.565347] pci 0000:00:1f.3: [8086:51c8] type 00 class 0x040380 conven=
tional PCI endpoint
[    0.565407] pci 0000:00:1f.3: BAR 0 [mem 0x6075290000-0x6075293fff 64bi=
t]
[    0.565482] pci 0000:00:1f.3: BAR 4 [mem 0x6075000000-0x60750fffff 64bi=
t]
[    0.565637] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.565968] pci 0000:00:1f.4: [8086:51a3] type 00 class 0x0c0500 conven=
tional PCI endpoint
[    0.565997] pci 0000:00:1f.4: BAR 0 [mem 0x607529c000-0x607529c0ff 64bi=
t]
[    0.566023] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.566300] pci 0000:00:1f.5: [8086:51a4] type 00 class 0x0c8000 conven=
tional PCI endpoint
[    0.566322] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.566496] pci 0000:00:1f.6: [8086:1a1e] type 00 class 0x020000 conven=
tional PCI endpoint
[    0.566542] pci 0000:00:1f.6: BAR 0 [mem 0x91080000-0x9109ffff]
[    0.566769] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.567035] pci 0000:01:00.0: [10de:1fb6] type 00 class 0x030200 PCIe E=
ndpoint
[    0.567047] pci 0000:01:00.0: BAR 0 [mem 0x90000000-0x90ffffff]
[    0.567057] pci 0000:01:00.0: BAR 1 [mem 0x6000000000-0x600fffffff 64bi=
t pref]
[    0.567067] pci 0000:01:00.0: BAR 3 [mem 0x6010000000-0x6011ffffff 64bi=
t pref]
[    0.567073] pci 0000:01:00.0: BAR 5 [io  0x3000-0x307f]
[    0.567080] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]
[    0.567139] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.567219] pci 0000:01:00.0: 126.024 Gb/s available PCIe bandwidth, li=
mited by 16.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 252.048 Gb/s w=
ith 16.0 GT/s PCIe x16 link)
[    0.567372] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.567406] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.567438] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.571423] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x7f=
)
[    0.959234] Low-power S0 idle used by default for system suspend
[    0.968295] ACPI: EC: interrupt unblocked
[    0.968297] ACPI: EC: event unblocked
[    0.968314] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.968315] ACPI: EC: GPE=3D0x6e
[    0.968316] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC initialization com=
plete
[    0.968318] ACPI: \_SB_.PC00.LPCB.ECDV: EC: Used to handle transactions=
 and events
[    0.968397] iommu: Default domain type: Translated
[    0.968397] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.968397] SCSI subsystem initialized
[    0.968397] libata version 3.00 loaded.
[    0.968397] ACPI: bus type USB registered
[    0.968397] usbcore: registered new interface driver usbfs
[    0.968397] usbcore: registered new interface driver hub
[    0.968397] usbcore: registered new device driver usb
[    0.968397] pps_core: LinuxPPS API ver. 1 registered
[    0.968397] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
 Giometti <giometti@linux.it>
[    0.968397] PTP clock support registered
[    0.968397] EDAC MC: Ver: 3.0.0
[    0.969123] efivars: Registered efivars operations
[    0.969384] NetLabel: Initializing
[    0.969386] NetLabel:  domain hash size =3D 128
[    0.969386] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.969408] NetLabel:  unlabeled traffic allowed by default
[    0.969412] mctp: management component transport protocol core
[    0.969413] NET: Registered PF_MCTP protocol family
[    0.969417] PCI: Using ACPI for IRQ routing
[    1.019557] PCI: pci_cache_line_size set to 64 bytes
[    1.019772] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't =
claim; no compatible bridge window
[    1.019941] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    1.019943] e820: reserve RAM buffer [mem 0x47003018-0x47ffffff]
[    1.019944] e820: reserve RAM buffer [mem 0x4708e000-0x47ffffff]
[    1.019945] e820: reserve RAM buffer [mem 0x4cd15000-0x4fffffff]
[    1.019945] e820: reserve RAM buffer [mem 0x51800000-0x53ffffff]
[    1.019946] e820: reserve RAM buffer [mem 0x89f800000-0x89fffffff]
[    1.020163] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    1.020163] pci 0000:00:02.0: vgaarb: bridge control possible
[    1.020163] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+me=
m,owns=3Dio+mem,locks=3Dnone
[    1.020163] vgaarb: loaded
[    1.020169] clocksource: Switched to clocksource tsc-early
[    1.020541] VFS: Disk quotas dquot_6.6.0
[    1.020548] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byt=
es)
[    1.020610] pnp: PnP ACPI init
[    1.020799] system 00:00: [io  0x0680-0x069f] has been reserved
[    1.020801] system 00:00: [io  0x164e-0x164f] has been reserved
[    1.020904] system 00:02: [io  0x1854-0x1857] has been reserved
[    1.021866] pnp 00:05: disabling [mem 0xc0000000-0xcfffffff] because it=
 overlaps 0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
[    1.021890] system 00:05: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    1.021892] system 00:05: [mem 0xfeda0000-0xfeda0fff] has been reserved
[    1.021894] system 00:05: [mem 0xfeda1000-0xfeda1fff] has been reserved
[    1.021895] system 00:05: [mem 0xfed20000-0xfed7ffff] could not be rese=
rved
[    1.021896] system 00:05: [mem 0xfed90000-0xfed93fff] could not be rese=
rved
[    1.021898] system 00:05: [mem 0xfed45000-0xfed8ffff] could not be rese=
rved
[    1.021899] system 00:05: [mem 0xfee00000-0xfeefffff] has been reserved
[    1.022889] system 00:06: [io  0x2000-0x20fe] has been reserved
[    1.026539] pnp: PnP ACPI: found 8 devices
[    1.032109] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, =
max_idle_ns: 2085701024 ns
[    1.032162] NET: Registered PF_INET protocol family
[    1.032408] IP idents hash table entries: 262144 (order: 9, 2097152 byt=
es, linear)
[    1.046356] tcp_listen_portaddr_hash hash table entries: 16384 (order: =
6, 262144 bytes, linear)
[    1.046386] Table-perturb hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
[    1.046608] TCP established hash table entries: 262144 (order: 9, 20971=
52 bytes, linear)
[    1.047013] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes=
, linear)
[    1.047121] TCP: Hash tables configured (established 262144 bind 65536)
[    1.047234] MPTCP token hash table entries: 32768 (order: 7, 786432 byt=
es, linear)
[    1.047315] UDP hash table entries: 16384 (order: 7, 524288 bytes, line=
ar)
[    1.047386] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes,=
 linear)
[    1.047463] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.047470] NET: Registered PF_XDP protocol family
[    1.047473] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]: can=
't claim; no compatible bridge window
[    1.047477] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus=
 02-39] add_size 1000
[    1.047479] pci 0000:00:07.1: bridge window [io  0x1000-0x0fff] to [bus=
 3a-71] add_size 1000
[    1.047488] pci 0000:00:02.0: VF BAR 2 [mem 0x4020000000-0x40ffffffff 6=
4bit pref]: assigned
[    1.047492] pci 0000:00:02.0: VF BAR 0 [mem 0x4010000000-0x4016ffffff 6=
4bit]: assigned
[    1.047495] pci 0000:00:07.0: bridge window [io  0x5000-0x5fff]: assign=
ed
[    1.047496] pci 0000:00:07.1: bridge window [io  0x6000-0x6fff]: assign=
ed
[    1.047498] pci 0000:00:15.0: BAR 0 [mem 0x4017000000-0x4017000fff 64bi=
t]: assigned
[    1.047861] pci 0000:00:15.1: BAR 0 [mem 0x4017001000-0x4017001fff 64bi=
t]: assigned
[    1.048202] pci 0000:00:1f.5: BAR 0 [mem 0x60800000-0x60800fff]: assign=
ed
[    1.048219] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: can't ass=
ign; no space
[    1.048220] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: failed to=
 assign
[    1.048222] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.048223] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    1.048226] pci 0000:00:01.0:   bridge window [mem 0x90000000-0x90fffff=
f]
[    1.048228] pci 0000:00:01.0:   bridge window [mem 0x6000000000-0x6011f=
fffff 64bit pref]
[    1.048232] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    1.048234] pci 0000:00:07.0:   bridge window [io  0x5000-0x5fff]
[    1.048236] pci 0000:00:07.0:   bridge window [mem 0x7a000000-0x8fdffff=
f]
[    1.048238] pci 0000:00:07.0:   bridge window [mem 0x6020000000-0x6041f=
fffff 64bit pref]
[    1.048242] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    1.048243] pci 0000:00:07.1:   bridge window [io  0x6000-0x6fff]
[    1.048246] pci 0000:00:07.1:   bridge window [mem 0x64000000-0x79dffff=
f]
[    1.048248] pci 0000:00:07.1:   bridge window [mem 0x6050000000-0x6071f=
fffff 64bit pref]
[    1.048253] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.048254] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.048255] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff wind=
ow]
[    1.048256] pci_bus 0000:00: resource 7 [mem 0x60800000-0xbfffffff wind=
ow]
[    1.048257] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x7fffffffff =
window]
[    1.048259] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    1.048260] pci_bus 0000:01: resource 1 [mem 0x90000000-0x90ffffff]
[    1.048261] pci_bus 0000:01: resource 2 [mem 0x6000000000-0x6011ffffff =
64bit pref]
[    1.048262] pci_bus 0000:02: resource 0 [io  0x5000-0x5fff]
[    1.048263] pci_bus 0000:02: resource 1 [mem 0x7a000000-0x8fdfffff]
[    1.048264] pci_bus 0000:02: resource 2 [mem 0x6020000000-0x6041ffffff =
64bit pref]
[    1.048265] pci_bus 0000:3a: resource 0 [io  0x6000-0x6fff]
[    1.048266] pci_bus 0000:3a: resource 1 [mem 0x64000000-0x79dfffff]
[    1.048267] pci_bus 0000:3a: resource 2 [mem 0x6050000000-0x6071ffffff =
64bit pref]
[    1.048921] PCI: CLS 0 bytes, default 64
[    1.049004] DMAR: Intel-IOMMU force enabled due to platform opt in
[    1.049010] DMAR: No ATSR found
[    1.049010] DMAR: No SATC found
[    1.049011] DMAR: IOMMU feature fl1gp_support inconsistent
[    1.049012] DMAR: IOMMU feature pgsel_inv inconsistent
[    1.049013] DMAR: IOMMU feature nwfs inconsistent
[    1.049014] DMAR: IOMMU feature dit inconsistent
[    1.049014] DMAR: IOMMU feature sc_support inconsistent
[    1.049015] DMAR: IOMMU feature dev_iotlb_support inconsistent
[    1.049016] DMAR: dmar0: Using Queued invalidation
[    1.049019] DMAR: dmar1: Using Queued invalidation
[    1.049038] Trying to unpack rootfs image as initramfs...
[    1.049219] pci 0000:00:02.0: Adding to iommu group 0
[    1.049251] pci 0000:00:00.0: Adding to iommu group 1
[    1.049261] pci 0000:00:01.0: Adding to iommu group 2
[    1.049267] pci 0000:00:04.0: Adding to iommu group 3
[    1.049276] pci 0000:00:06.0: Adding to iommu group 4
[    1.049285] pci 0000:00:07.0: Adding to iommu group 5
[    1.049293] pci 0000:00:07.1: Adding to iommu group 6
[    1.049301] pci 0000:00:08.0: Adding to iommu group 7
[    1.049312] pci 0000:00:0d.0: Adding to iommu group 8
[    1.049318] pci 0000:00:0d.2: Adding to iommu group 8
[    1.049326] pci 0000:00:0e.0: Adding to iommu group 9
[    1.049335] pci 0000:00:12.0: Adding to iommu group 10
[    1.049347] pci 0000:00:14.0: Adding to iommu group 11
[    1.049354] pci 0000:00:14.2: Adding to iommu group 11
[    1.049361] pci 0000:00:14.3: Adding to iommu group 12
[    1.049373] pci 0000:00:15.0: Adding to iommu group 13
[    1.049379] pci 0000:00:15.1: Adding to iommu group 13
[    1.049388] pci 0000:00:16.0: Adding to iommu group 14
[    1.049397] pci 0000:00:17.0: Adding to iommu group 15
[    1.049418] pci 0000:00:1f.0: Adding to iommu group 16
[    1.049425] pci 0000:00:1f.3: Adding to iommu group 16
[    1.049432] pci 0000:00:1f.4: Adding to iommu group 16
[    1.049441] pci 0000:00:1f.5: Adding to iommu group 16
[    1.049448] pci 0000:00:1f.6: Adding to iommu group 16
[    1.049457] pci 0000:01:00.0: Adding to iommu group 17
[    1.049547] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    1.049548] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.049548] software IO TLB: mapped [mem 0x000000003dcb6000-0x000000004=
1cb6000] (64MB)
[    1.049587] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26=
bef67878b, max_idle_ns: 440795293631 ns
[    1.049643] clocksource: Switched to clocksource tsc
[    1.055127] Initialise system trusted keyrings
[    1.055138] Key type blacklist registered
[    1.055177] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    1.055189] zbud: loaded
[    1.055587] integrity: Platform Keyring initialized
[    1.055590] integrity: Machine keyring initialized
[    1.064420] NET: Registered PF_ALG protocol family
[    1.064422] xor: automatically using best checksumming function   avx
[    1.064424] Key type asymmetric registered
[    1.064424] Asymmetric key parser 'x509' registered
[    1.380504] Freeing initrd memory: 78040K
[    1.383988] Block layer SCSI generic (bsg) driver version 0.4 loaded (m=
ajor 245)
[    1.384020] io scheduler mq-deadline registered
[    1.384021] io scheduler kyber registered
[    1.384028] io scheduler bfq registered
[    1.385528] atomic64_test: passed for x86-64 platform with CX8 and with=
 SSE
[    1.385970] pcieport 0000:00:01.0: PME: Signaling with IRQ 122
[    1.386148] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    1.386163] pcieport 0000:00:07.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.386446] pcieport 0000:00:07.1: PME: Signaling with IRQ 124
[    1.386460] pcieport 0000:00:07.1: pciehp: Slot #4 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.386595] shpchp: Standard Hot Plug PCI Controller Driver version: 0.=
4
[    1.388411] ACPI: AC: AC Adapter [AC] (on-line)
[    1.388461] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C=
0D:00/input/input0
[    1.388493] ACPI: button: Lid Switch [LID0]
[    1.388516] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP=
0C0C:00/input/input1
[    1.388581] ACPI: button: Power Button [PBTN]
[    1.388602] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP=
0C0E:00/input/input2
[    1.388617] ACPI: button: Sleep Button [SBTN]
[    1.391744] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.393131] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    1.393556] hpet_acpi_add: no address or irqs in _CRS
[    1.393594] Non-volatile memory driver v1.3
[    1.393598] Linux agpgart interface v0.103
[    1.395720] tpm_tis NTC0702:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    1.418964] ACPI: battery: Slot [BAT0] (battery present)
[    1.502130] ACPI: bus type drm_connector registered
[    1.517924] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    1.539979] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    1.550226] ahci 0000:00:0e.0: version 3.0
[    1.550238] ahci 0000:00:0e.0: probe with driver ahci failed with error=
 -22
[    1.550461] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.550485] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus=
 number 1
[    1.551548] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x=
120 quirks 0x0000000200009810
[    1.551777] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.551817] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus=
 number 2
[    1.551819] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced Super=
Speed
[    1.551948] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.551950] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.551951] usb usb1: Product: xHCI Host Controller
[    1.551952] usb usb1: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.551953] usb usb1: SerialNumber: 0000:00:0d.0
[    1.552073] hub 1-0:1.0: USB hub found
[    1.552092] hub 1-0:1.0: 1 port detected
[    1.552292] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.552294] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.552295] usb usb2: Product: xHCI Host Controller
[    1.552296] usb usb2: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.552297] usb usb2: SerialNumber: 0000:00:0d.0
[    1.552356] hub 2-0:1.0: USB hub found
[    1.552365] hub 2-0:1.0: 2 ports detected
[    1.552718] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.552744] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus=
 number 3
[    1.554073] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x=
120 quirks 0x0000100200009810
[    1.554489] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.554545] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus=
 number 4
[    1.554547] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced Super=
Speed
[    1.554606] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.554607] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.554608] usb usb3: Product: xHCI Host Controller
[    1.554609] usb usb3: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.554610] usb usb3: SerialNumber: 0000:00:14.0
[    1.554684] hub 3-0:1.0: USB hub found
[    1.554718] hub 3-0:1.0: 12 ports detected
[    1.555988] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.555990] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    1.555991] usb usb4: Product: xHCI Host Controller
[    1.555992] usb usb4: Manufacturer: Linux 6.10.6-200.fc40.x86_64 xhci-h=
cd
[    1.555993] usb usb4: SerialNumber: 0000:00:14.0
[    1.556088] hub 4-0:1.0: USB hub found
[    1.556115] hub 4-0:1.0: 4 ports detected
[    1.556564] usbcore: registered new interface driver usbserial_generic
[    1.556568] usbserial: USB Serial support registered for generic
[    1.556595] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at =
0x60,0x64 irq 1,12
[    1.557055] i8042: Warning: Keylock active
[    1.559371] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.559375] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.559471] mousedev: PS/2 mouse device common for all mice
[    1.559598] rtc_cmos 00:01: RTC can wake from S4
[    1.561342] rtc_cmos 00:01: registered as rtc0
[    1.561691] rtc_cmos 00:01: setting system clock to 2024-08-27T18:24:30=
 UTC (1724783070)
[    1.561726] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvra=
m
[    1.562974] input: AT Translated Set 2 keyboard as /devices/platform/i8=
042/serio0/input/input3
[    1.563470] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.=
 Duplicate IMA measurements will not be recorded in the IMA log.
[    1.563479] device-mapper: uevent: version 1.0.3
[    1.563523] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised=
: dm-devel@lists.linux.dev
[    1.563627] intel_pstate: Intel P-state driver initializing
[    1.566000] intel_pstate: HWP enabled
[    1.566373] [drm] Initialized simpledrm 1.0.0 20200625 for simple-frame=
buffer.0 on minor 0
[    1.567580] fbcon: Deferring console take-over
[    1.567582] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpled=
rmdrmfb frame buffer device
[    1.567680] hid: raw HID events driver (C) Jiri Kosina
[    1.567699] usbcore: registered new interface driver usbhid
[    1.567699] usbhid: USB HID core driver
[    1.567808] drop_monitor: Initializing network drop monitor service
[    1.567921] Initializing XFRM netlink socket
[    1.567940] NET: Registered PF_INET6 protocol family
[    1.570960] Segment Routing with IPv6
[    1.570961] RPL Segment Routing with IPv6
[    1.570964] In-situ OAM (IOAM) with IPv6
[    1.570982] mip6: Mobile IPv6
[    1.570984] NET: Registered PF_PACKET protocol family
[    1.572735] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.573696] microcode: Current revision: 0x00000434
[    1.574581] IPI shorthand broadcast: enabled
[    1.574584] AVX2 version of gcm_enc/dec engaged.
[    1.575626] AES CTR mode by8 optimization enabled
[    1.576792] sched_clock: Marking stable (1561000459, 15758213)->(161161=
1518, -34852846)
[    1.576950] Timer migration: 2 hierarchy levels; 8 children per group; =
2 crossnode level
[    1.577127] registered taskstats version 1
[    1.577402] Loading compiled-in X.509 certificates
[    1.585727] Loaded X.509 cert 'Fedora kernel signing key: f9cbd582e5889=
bb21bd43994ed8eb88a8fb191cd'
[    1.590918] Loaded X.509 cert 'Fedora IMA CA: a8a00c31663f853f9c6ff2564=
872e378af026b28'
[    1.593125] Demotion targets for Node 0: null
[    1.593127] page_owner is disabled
[    1.593405] Key type .fscrypt registered
[    1.593406] Key type fscrypt-provisioning registered
[    1.594183] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    1.594200] Key type big_key registered
[    1.594206] Key type trusted registered
[    1.625231] Key type encrypted registered
[    1.625323] Loading compiled-in module X.509 certificates
[    1.625743] Loaded X.509 cert 'Fedora kernel signing key: f9cbd582e5889=
bb21bd43994ed8eb88a8fb191cd'
[    1.625746] ima: Allocated hash algorithm: sha256
[    1.683603] ima: No architecture policies found
[    1.683675] evm: Initialising EVM extended attributes:
[    1.683678] evm: security.selinux
[    1.683681] evm: security.SMACK64 (disabled)
[    1.683683] evm: security.SMACK64EXEC (disabled)
[    1.683685] evm: security.SMACK64TRANSMUTE (disabled)
[    1.683686] evm: security.SMACK64MMAP (disabled)
[    1.683688] evm: security.apparmor (disabled)
[    1.683690] evm: security.ima
[    1.683691] evm: security.capability
[    1.683693] evm: HMAC attrs: 0x1
[    1.762586] alg: No test for 842 (842-scomp)
[    1.762626] alg: No test for 842 (842-generic)
[    1.794875] usb 3-3: new low-speed USB device number 2 using xhci_hcd
[    1.833093] PM:   Magic number: 4:327:444
[    1.835786] RAS: Correctable Errors collector initialized.
[    1.842012] clk: Disabling unused clocks
[    1.842014] PM: genpd: Disabling unused power domains
[    1.846686] Freeing unused decrypted memory: 2028K
[    1.847510] Freeing unused kernel image (initmem) memory: 4720K
[    1.847525] Write protecting the kernel read-only data: 36864k
[    1.848425] Freeing unused kernel image (rodata/data gap) memory: 1088K
[    1.853282] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.853287] Run /init as init process
[    1.853288]   with arguments:
[    1.853289]     /init
[    1.853289]     rhgb
[    1.853290]   with environment:
[    1.853290]     HOME=3D/
[    1.853291]     TERM=3Dlinux
[    1.853291]     BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-6.10.6-200.fc40.x86_64
[    1.867045] systemd[1]: systemd 255.10-3.fc40 running in system mode (+=
PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSS=
L +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP=
 +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB=
 +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunifi=
ed)
[    1.867050] systemd[1]: Detected architecture x86-64.
[    1.867052] systemd[1]: Running in initrd.
[    1.867158] systemd[1]: No hostname configured, using default hostname.
[    1.867191] systemd[1]: Hostname set to <fedora>.
[    1.932431] usb 3-3: New USB device found, idVendor=3D045e, idProduct=
=3D0040, bcdDevice=3D 3.00
[    1.932434] usb 3-3: New USB device strings: Mfr=3D1, Product=3D3, Seri=
alNumber=3D0
[    1.932434] usb 3-3: Product: Microsoft 3-Button Mouse with IntelliEye(=
TM)
[    1.932435] usb 3-3: Manufacturer: Microsoft
[    1.935738] input: Microsoft Microsoft 3-Button Mouse with IntelliEye(T=
M) as /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0/0003:045E:0040.000=
1/input/input6
[    1.936093] hid-generic 0003:045E:0040.0001: input,hidraw0: USB HID v1.=
10 Mouse [Microsoft Microsoft 3-Button Mouse with IntelliEye(TM)] on usb-0=
000:00:14.0-3/input0
[    1.939498] systemd[1]: Queued start job for default target initrd.targ=
et.
[    1.956091] systemd[1]: Created slice system-systemd\x2dcryptsetup.slic=
e - Slice /system/systemd-cryptsetup.
[    1.956197] systemd[1]: Expecting device dev-disk-by\x2duuid-49436d43\x=
2da842\x2d4f89\x2da4aa\x2d93ea838ffd01.device - /dev/disk/by-uuid/49436d43=
-a842-4f89-a4aa-93ea838ffd01...
[    1.956208] systemd[1]: Expecting device dev-disk-by\x2duuid-59545c18\x=
2d3923\x2d4411\x2d9c12\x2d245ab6cee067.device - /dev/disk/by-uuid/59545c18=
-3923-4411-9c12-245ab6cee067...
[    1.956239] systemd[1]: Reached target initrd-usr-fs.target - Initrd /u=
sr File System.
[    1.956272] systemd[1]: Reached target slices.target - Slice Units.
[    1.956295] systemd[1]: Reached target swap.target - Swaps.
[    1.956316] systemd[1]: Reached target timers.target - Timer Units.
[    1.956474] systemd[1]: Listening on systemd-journald-dev-log.socket - =
Journal Socket (/dev/log).
[    1.956620] systemd[1]: Listening on systemd-journald.socket - Journal =
Socket.
[    1.956781] systemd[1]: Listening on systemd-udevd-control.socket - ude=
v Control Socket.
[    1.956897] systemd[1]: Listening on systemd-udevd-kernel.socket - udev=
 Kernel Socket.
[    1.956921] systemd[1]: Reached target sockets.target - Socket Units.
[    1.958027] systemd[1]: Starting kmod-static-nodes.service - Create Lis=
t of Static Device Nodes...
[    1.958083] systemd[1]: memstrack.service - Memstrack Anylazing Service=
 was skipped because no trigger condition checks were met.
[    1.960267] systemd[1]: Starting systemd-journald.service - Journal Ser=
vice...
[    1.961157] systemd[1]: Starting systemd-modules-load.service - Load Ke=
rnel Modules...
[    1.961192] systemd[1]: systemd-pcrphase-initrd.service - TPM2 PCR Barr=
ier (initrd) was skipped because of an unmet condition check (ConditionSec=
urity=3Dmeasured-uki).
[    1.961966] systemd[1]: Starting systemd-vconsole-setup.service - Virtu=
al Console Setup...
[    1.963155] systemd[1]: Finished kmod-static-nodes.service - Create Lis=
t of Static Device Nodes.
[    1.963778] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully...
[    1.968572] systemd-journald[382]: Collecting audit messages is disable=
d.
[    1.974549] fuse: init (API version 7.40)
[    1.976628] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully.
[    1.977169] systemd[1]: Starting systemd-sysusers.service - Create Syst=
em Users...
[    1.977842] systemd[1]: Finished systemd-modules-load.service - Load Ke=
rnel Modules.
[    1.978372] systemd[1]: Starting systemd-sysctl.service - Apply Kernel =
Variables...
[    1.982386] systemd[1]: Finished systemd-sysctl.service - Apply Kernel =
Variables.
[    1.983394] systemd[1]: Started systemd-journald.service - Journal Serv=
ice.
[    2.050894] usb 3-6: new high-speed USB device number 3 using xhci_hcd
[    2.193353] usb 3-6: New USB device found, idVendor=3D0c45, idProduct=
=3D673c, bcdDevice=3D13.15
[    2.193360] usb 3-6: New USB device strings: Mfr=3D2, Product=3D1, Seri=
alNumber=3D0
[    2.193363] usb 3-6: Product: Integrated_Webcam_FHD
[    2.193364] usb 3-6: Manufacturer: CN08981J8LG00273B027A00
[    2.296175] wmi_bus wmi_bus-PNP0C14:02: [Firmware Bug]: WQBC data block=
 query control method not found
[    2.305619] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1=
/input/input5
[    2.309517] vmd 0000:00:0e.0: PCI host bridge to bus 10000:e0
[    2.309523] pci_bus 10000:e0: root bus resource [bus e0-ff]
[    2.309526] pci_bus 10000:e0: root bus resource [mem 0x62000000-0x63fff=
fff]
[    2.309527] pci_bus 10000:e0: root bus resource [mem 0x6075102000-0x607=
51fffff 64bit]
[    2.309554] pci 10000:e0:06.0: [8086:464d] type 01 class 0x060400 PCIe =
Root Port
[    2.309570] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.309574] pci 10000:e0:06.0:   bridge window [io  0x0000-0x0fff]
[    2.309577] pci 10000:e0:06.0:   bridge window [mem 0x62100000-0x621fff=
ff]
[    2.309617] pci 10000:e0:06.0: PME# supported from D0 D3hot D3cold
[    2.309641] pci 10000:e0:06.0: PTM enabled (root), 4ns granularity
[    2.309768] pci 10000:e0:06.0: Adding to iommu group 9
[    2.309798] pci 10000:e0:06.2: [8086:463d] type 01 class 0x060400 PCIe =
Root Port
[    2.309812] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.309816] pci 10000:e0:06.2:   bridge window [io  0x0000-0x0fff]
[    2.309818] pci 10000:e0:06.2:   bridge window [mem 0x62200000-0x622fff=
ff]
[    2.309856] pci 10000:e0:06.2: PME# supported from D0 D3hot D3cold
[    2.309878] pci 10000:e0:06.2: PTM enabled (root), 4ns granularity
[    2.309986] pci 10000:e0:06.2: Adding to iommu group 9
[    2.310013] pci 10000:e0:17.0: [8086:51d3] type 00 class 0x010601 conve=
ntional PCI endpoint
[    2.310031] pci 10000:e0:17.0: BAR 0 [mem 0x00000000-0x00001fff]
[    2.310047] pci 10000:e0:17.0: BAR 1 [mem 0x00000000-0x000000ff]
[    2.310059] pci 10000:e0:17.0: BAR 2 [io  0x0000-0x0007]
[    2.310072] pci 10000:e0:17.0: BAR 3 [io  0x0000-0x0003]
[    2.310085] pci 10000:e0:17.0: BAR 4 [io  0x0000-0x001f]
[    2.310098] pci 10000:e0:17.0: BAR 5 [mem 0x62000000-0x620007ff]
[    2.310143] pci 10000:e0:17.0: PME# supported from D3hot
[    2.310206] pci 10000:e0:17.0: Adding to iommu group 9
[    2.310215] pci 10000:e0:06.0: Primary bus is hard wired to 0
[    2.310263] pci 10000:e1:00.0: [144d:a80a] type 00 class 0x010802 PCIe =
Endpoint
[    2.310281] pci 10000:e1:00.0: BAR 0 [mem 0x62100000-0x62103fff 64bit]
[    2.310539] pci 10000:e1:00.0: Adding to iommu group 9
[    2.310569] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.310575] pci 10000:e0:06.2: Primary bus is hard wired to 0
[    2.311025] pci 10000:e2:00.0: [15b7:5030] type 00 class 0x010802 PCIe =
Endpoint
[    2.311041] pci 10000:e2:00.0: BAR 0 [mem 0x62200000-0x62203fff 64bit]
[    2.311281] pci 10000:e2:00.0: Adding to iommu group 9
[    2.311309] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.311316] pci 10000:e0:06.0: Primary bus is hard wired to 0
[    2.311320] pci 10000:e0:06.2: Primary bus is hard wired to 0
[    2.466997] input: VEN_0488:00 0488:1042 Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/inp=
ut/input7
[    2.467434] input: VEN_0488:00 0488:1042 Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/=
input/input8
[    2.467912] hid-generic 0018:0488:1042.0002: input,hidraw1: I2C HID v1.=
00 Mouse [VEN_0488:00 0488:1042] on i2c-VEN_0488:00
[    2.540182] input: VEN_0488:00 0488:1042 Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/inp=
ut/input10
[    2.540413] input: VEN_0488:00 0488:1042 Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-1/i2c-VEN_0488:00/0018:0488:1042.0002/=
input/input11
[    2.540658] hid-multitouch 0018:0488:1042.0002: input,hidraw1: I2C HID =
v1.00 Mouse [VEN_0488:00 0488:1042] on i2c-VEN_0488:00
[    2.583032] pci 10000:e0:06.0: bridge window [mem 0x62000000-0x620fffff=
]: assigned
[    2.583037] pci 10000:e0:06.2: bridge window [mem 0x62100000-0x621fffff=
]: assigned
[    2.583039] pci 10000:e0:17.0: BAR 0 [mem 0x62200000-0x62201fff]: assig=
ned
[    2.583057] pci 10000:e0:06.0: bridge window [io  size 0x1000]: can't a=
ssign; no space
[    2.583058] pci 10000:e0:06.0: bridge window [io  size 0x1000]: failed =
to assign
[    2.583059] pci 10000:e0:06.2: bridge window [io  size 0x1000]: can't a=
ssign; no space
[    2.583060] pci 10000:e0:06.2: bridge window [io  size 0x1000]: failed =
to assign
[    2.583061] pci 10000:e0:17.0: BAR 5 [mem 0x62202000-0x622027ff]: assig=
ned
[    2.583084] pci 10000:e0:17.0: BAR 1 [mem 0x62202800-0x622028ff]: assig=
ned
[    2.583089] pci 10000:e0:17.0: BAR 4 [io  size 0x0020]: can't assign; n=
o space
[    2.583090] pci 10000:e0:17.0: BAR 4 [io  size 0x0020]: failed to assig=
n
[    2.583091] pci 10000:e0:17.0: BAR 2 [io  size 0x0008]: can't assign; n=
o space
[    2.583091] pci 10000:e0:17.0: BAR 2 [io  size 0x0008]: failed to assig=
n
[    2.583092] pci 10000:e0:17.0: BAR 3 [io  size 0x0004]: can't assign; n=
o space
[    2.583093] pci 10000:e0:17.0: BAR 3 [io  size 0x0004]: failed to assig=
n
[    2.583095] pci 10000:e1:00.0: BAR 0 [mem 0x62000000-0x62003fff 64bit]:=
 assigned
[    2.583103] pci 10000:e0:06.0: PCI bridge to [bus e1]
[    2.583106] pci 10000:e0:06.0:   bridge window [mem 0x62000000-0x620fff=
ff]
[    2.583112] pci 10000:e2:00.0: BAR 0 [mem 0x62100000-0x62103fff 64bit]:=
 assigned
[    2.583119] pci 10000:e0:06.2: PCI bridge to [bus e2]
[    2.583121] pci 10000:e0:06.2:   bridge window [mem 0x62100000-0x621fff=
ff]
[    2.583130] pci 10000:e1:00.0: can't override BIOS ASPM; OS doesn't hav=
e ASPM control
[    2.583136] pci 10000:e1:00.0: VMD: Default LTR value set by driver
[    2.583140] pci 10000:e2:00.0: can't override BIOS ASPM; OS doesn't hav=
e ASPM control
[    2.583143] pci 10000:e2:00.0: VMD: Default LTR value set by driver
[    2.583165] pcieport 10000:e0:06.0: can't derive routing for PCI INT D
[    2.583167] pcieport 10000:e0:06.0: PCI INT D: no GSI
[    2.583234] pcieport 10000:e0:06.0: PME: Signaling with IRQ 161
[    2.583302] pcieport 10000:e0:06.2: can't derive routing for PCI INT B
[    2.583304] pcieport 10000:e0:06.2: PCI INT B: no GSI
[    2.583338] pcieport 10000:e0:06.2: PME: Signaling with IRQ 162
[    2.583424] ahci 10000:e0:17.0: can't derive routing for PCI INT A
[    2.583426] ahci 10000:e0:17.0: PCI INT A: no GSI
[    2.583562] ahci 10000:e0:17.0: AHCI vers 0001.0301, 32 command slots, =
6 Gbps, SATA mode
[    2.583564] ahci 10000:e0:17.0: 0/1 ports implemented (port mask 0x0)
[    2.583565] ahci 10000:e0:17.0: flags: 64bit ncq sntf pm clo only pio s=
lum part deso sadm sds
[    2.583946] scsi host0: ahci
[    2.584010] ata1: DUMMY
[    2.584042] vmd 0000:00:0e.0: Bound to PCI domain 10000
[    2.730104] ACPI Warning: \_SB.PC00.PEG1.PEGP._DSM: Argument #4 type mi=
smatch - Found [Buffer], ACPI requires [Package] (20240322/nsarguments-61)
[    2.730170] pci 0000:01:00.0: optimus capabilities: enabled, status dyn=
amic power, hda bios codec supported
[    2.730195] VGA switcheroo: detected Optimus DSM method \_SB_.PC00.PEG1=
.PEGP handle
[    2.730195] nouveau: detected PR support, will not use DSM
[    2.730549] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
[    2.933821] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.935136] nvme nvme0: pci function 10000:e1:00.0
[    2.935143] pcieport 10000:e0:06.0: can't derive routing for PCI INT A
[    2.935143] nvme nvme1: pci function 10000:e2:00.0
[    2.935145] nvme 10000:e1:00.0: PCI INT A: not connected
[    2.935151] pcieport 10000:e0:06.2: can't derive routing for PCI INT A
[    2.935153] nvme 10000:e2:00.0: PCI INT A: no GSI
[    2.937257] nvme nvme0: D3 entry latency set to 10 seconds
[    2.941288] nvme nvme0: 18/0/0 default/read/poll queues
[    2.944036]  nvme0n1: p1
[    2.951099] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.951153] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.951523] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    2.955006] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915=
/adlp_dmc.bin (v2.20)
[    2.963068] nvme nvme1: 18/0/0 default/read/poll queues
[    2.966856]  nvme1n1: p1 p2 p3
[    3.022826] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/adlp_guc_70=
.bin version 70.29.2
[    3.022830] i915 0000:00:02.0: [drm] GT0: HuC firmware i915/tgl_huc.bin=
 version 7.9.3
[    3.037268] i915 0000:00:02.0: [drm] GT0: HuC: authenticated for all wo=
rkloads
[    3.037977] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    3.037979] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    3.038654] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    3.039710] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected =
content support initialized
[    3.051144] [drm] Initialized i915 1.6.0 20230929 for 0000:00:02.0 on m=
inor 1
[    3.051364] ACPI: video: Video Device [PEGP] (multi-head: no  rom: yes =
 post: no)
[    3.051384] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A0=
8:00/device:03/LNXVIDEO:00/input/input13
[    3.054671] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no =
 post: no)
[    3.057164] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A0=
8:00/LNXVIDEO:01/input/input14
[    3.062962] fbcon: i915drmfb (fb0) is primary device
[    3.062963] fbcon: Deferring console take-over
[    3.062964] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.141529] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: =
enum_devices_done OK, num_hid_devices=3D2
[    3.146606] nouveau 0000:01:00.0: bios: version 90.17.8d.40.48
[    3.151570] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2=
.00 Device [hid-ishtp 8087:0AC2] on
[    3.160891] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2=
.00 Device [hid-ishtp 8087:0AC2] on
[    3.238414] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID=
 v2.00 Device [hid-ishtp 8087:0AC2] on
[    3.239181] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID=
 v2.00 Device [hid-ishtp 8087:0AC2] on
[    4.454610] vga_switcheroo: enabled
[    4.454786] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    4.454789] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    4.514916] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    4.515215] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 o=
n minor 0
[    4.517993] nouveau 0000:01:00.0: [drm] No compatible format found
[    4.517994] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   14.017829] BTRFS: device label fedora devid 1 transid 3688 /dev/mapper=
/luks-49436d43-a842-4f89-a4aa-93ea838ffd01 (253:0) scanned by mount (1106)
[   14.018359] BTRFS info (device dm-0): first mount of filesystem 59545c1=
8-3923-4411-9c12-245ab6cee067
[   14.018396] BTRFS info (device dm-0): using crc32c (crc32c-intel) check=
sum algorithm
[   14.018405] BTRFS info (device dm-0): using free-space-tree
[   14.154797] systemd-journald[382]: Received SIGTERM from PID 1 (systemd=
).
[   14.205083] audit: type=3D1404 audit(1724783083.143:2): enforcing=3D1 o=
ld_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D1 old-enable=
d=3D1 lsm=3Dselinux res=3D1
[   14.239652] SELinux:  policy capability network_peer_controls=3D1
[   14.239654] SELinux:  policy capability open_perms=3D1
[   14.239655] SELinux:  policy capability extended_socket_class=3D1
[   14.239655] SELinux:  policy capability always_check_network=3D0
[   14.239656] SELinux:  policy capability cgroup_seclabel=3D1
[   14.239656] SELinux:  policy capability nnp_nosuid_transition=3D1
[   14.239656] SELinux:  policy capability genfs_seclabel_symlinks=3D1
[   14.239657] SELinux:  policy capability ioctl_skip_cloexec=3D0
[   14.239657] SELinux:  policy capability userspace_initial_context=3D0
[   14.268438] audit: type=3D1403 audit(1724783083.206:3): auid=3D42949672=
95 ses=3D4294967295 lsm=3Dselinux res=3D1
[   14.268884] systemd[1]: Successfully loaded SELinux policy in 64.229ms.
[   14.286387] systemd[1]: Relabeled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 14.043ms.
[   14.289727] systemd[1]: systemd 255.10-3.fc40 running in system mode (+=
PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSS=
L +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP=
 +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB=
 +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunifi=
ed)
[   14.289730] systemd[1]: Detected architecture x86-64.
[   14.291376] systemd[1]: Hostname set to <juicefast>.
[   14.370302] systemd[1]: bpf-lsm: LSM BPF program attached
[   14.491283] zram: Added device: zram0
[   14.591130] systemd[1]: systemd-ask-password-plymouth.service: Deactiva=
ted successfully.
[   14.591266] systemd[1]: initrd-switch-root.service: Deactivated success=
fully.
[   14.591314] systemd[1]: Stopped initrd-switch-root.service - Switch Roo=
t.
[   14.592056] systemd[1]: systemd-journald.service: Scheduled restart job=
, restart counter is at 1.
[   14.592330] systemd[1]: Created slice machine.slice - Virtual Machine a=
nd Container Slice.
[   14.592557] systemd[1]: Created slice system-getty.slice - Slice /syste=
m/getty.
[   14.592754] systemd[1]: Created slice system-systemd\x2dfsck.slice - Sl=
ice /system/systemd-fsck.
[   14.592953] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.s=
lice - Slice /system/systemd-zram-setup.
[   14.593091] systemd[1]: Created slice user.slice - User and Session Sli=
ce.
[   14.593105] systemd[1]: systemd-ask-password-console.path - Dispatch Pa=
ssword Requests to Console Directory Watch was skipped because of an unmet=
 condition check (ConditionPathExists=3D!/run/plymouth/pid).
[   14.593198] systemd[1]: Started systemd-ask-password-wall.path - Forwar=
d Password Requests to Wall Directory Watch.
[   14.593500] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automo=
unt - Arbitrary Executable File Formats File System Automount Point.
[   14.593515] systemd[1]: Expecting device dev-disk-by\x2duuid-082f08c2\x=
2dfaa7\x2d432e\x2dbbb2\x2ddb65ef31d4ea.device - /dev/disk/by-uuid/082f08c2=
-faa7-432e-bbb2-db65ef31d4ea...
[   14.593524] systemd[1]: Expecting device dev-disk-by\x2duuid-3C4D\x2d6E=
99.device - /dev/disk/by-uuid/3C4D-6E99...
[   14.593534] systemd[1]: Expecting device dev-zram0.device - /dev/zram0.=
..
[   14.593548] systemd[1]: Reached target blockdev@dev-mapper-luks\x2d4943=
6d43\x2da842\x2d4f89\x2da4aa\x2d93ea838ffd01.target - Block Device Prepara=
tion for /dev/mapper/luks-49436d43-a842-4f89-a4aa-93ea838ffd01.
[   14.593560] systemd[1]: Reached target cryptsetup.target - Local Encryp=
ted Volumes.
[   14.593572] systemd[1]: Reached target getty.target - Login Prompts.
[   14.593586] systemd[1]: Stopped target initrd-switch-root.target - Swit=
ch Root.
[   14.593597] systemd[1]: Stopped target initrd-fs.target - Initrd File S=
ystems.
[   14.593606] systemd[1]: Stopped target initrd-root-fs.target - Initrd R=
oot File System.
[   14.593617] systemd[1]: Reached target integritysetup.target - Local In=
tegrity Protected Volumes.
[   14.593650] systemd[1]: Reached target slices.target - Slice Units.
[   14.593669] systemd[1]: Reached target veritysetup.target - Local Verit=
y Protected Volumes.
[   14.593977] systemd[1]: Listening on dm-event.socket - Device-mapper ev=
ent daemon FIFOs.
[   14.594716] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll d=
aemon socket.
[   14.595490] systemd[1]: Listening on systemd-coredump.socket - Process =
Core Dump Socket.
[   14.595556] systemd[1]: Listening on systemd-initctl.socket - initctl C=
ompatibility Named Pipe.
[   14.595857] systemd[1]: Listening on systemd-journald-audit.socket - Jo=
urnal Audit Socket.
[   14.596045] systemd[1]: Listening on systemd-oomd.socket - Userspace Ou=
t-Of-Memory (OOM) Killer Socket.
[   14.596081] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension (=
Varlink) was skipped because of an unmet condition check (ConditionSecurit=
y=3Dmeasured-uki).
[   14.596606] systemd[1]: Listening on systemd-udevd-control.socket - ude=
v Control Socket.
[   14.596729] systemd[1]: Listening on systemd-udevd-kernel.socket - udev=
 Kernel Socket.
[   14.596984] systemd[1]: Listening on systemd-userdbd.socket - User Data=
base Manager Socket.
[   14.620023] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File =
System...
[   14.621468] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue=
 File System...
[   14.622308] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug =
File System...
[   14.622889] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trac=
e File System...
[   14.623000] systemd[1]: auth-rpcgss-module.service - Kernel Module supp=
orting RPCSEC_GSS was skipped because of an unmet condition check (Conditi=
onPathExists=3D/etc/krb5.keytab).
[   14.623384] systemd[1]: iscsi-starter.service was skipped because of an=
 unmet condition check (ConditionDirectoryNotEmpty=3D/var/lib/iscsi/nodes)=
.
[   14.623944] systemd[1]: Starting kmod-static-nodes.service - Create Lis=
t of Static Device Nodes...
[   14.624544] systemd[1]: Starting lvm2-monitor.service - Monitoring of L=
VM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   14.625084] systemd[1]: Starting modprobe@configfs.service - Load Kerne=
l Module configfs...
[   14.625677] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel =
Module dm_mod...
[   14.626380] systemd[1]: Starting modprobe@drm.service - Load Kernel Mod=
ule drm...
[   14.626900] systemd[1]: Starting modprobe@efi_pstore.service - Load Ker=
nel Module efi_pstore...
[   14.627525] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mo=
dule fuse...
[   14.628194] systemd[1]: Starting modprobe@loop.service - Load Kernel Mo=
dule loop...
[   14.628270] systemd[1]: plymouth-switch-root.service: Deactivated succe=
ssfully.
[   14.628324] systemd[1]: Stopped plymouth-switch-root.service - Plymouth=
 switch root service.
[   14.628518] systemd[1]: systemd-fsck-root.service: Deactivated successf=
ully.
[   14.628534] systemd[1]: Stopped systemd-fsck-root.service - File System=
 Check on Root Device.
[   14.630158] systemd[1]: Starting systemd-journald.service - Journal Ser=
vice...
[   14.630735] systemd[1]: Starting systemd-modules-load.service - Load Ke=
rnel Modules...
[   14.631217] systemd[1]: Starting systemd-network-generator.service - Ge=
nerate network units from Kernel command line...
[   14.631238] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine I=
D Measurement was skipped because of an unmet condition check (ConditionSe=
curity=3Dmeasured-uki).
[   14.631733] systemd[1]: Starting systemd-remount-fs.service - Remount R=
oot and Kernel File Systems...
[   14.631864] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Set=
up (Early) was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
[   14.632953] systemd[1]: Starting systemd-udev-trigger.service - Coldplu=
g All udev Devices...
[   14.633788] loop: module loaded
[   14.634194] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File S=
ystem.
[   14.634311] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue =
File System.
[   14.634381] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug F=
ile System.
[   14.634445] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace=
 File System.
[   14.634739] systemd[1]: Finished kmod-static-nodes.service - Create Lis=
t of Static Device Nodes.
[   14.634963] systemd[1]: modprobe@configfs.service: Deactivated successf=
ully.
[   14.635070] systemd[1]: Finished modprobe@configfs.service - Load Kerne=
l Module configfs.
[   14.635252] systemd[1]: modprobe@dm_mod.service: Deactivated successful=
ly.
[   14.635345] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel =
Module dm_mod.
[   14.635514] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   14.635610] systemd[1]: Finished modprobe@drm.service - Load Kernel Mod=
ule drm.
[   14.635750] systemd[1]: modprobe@efi_pstore.service: Deactivated succes=
sfully.
[   14.635828] systemd[1]: Finished modprobe@efi_pstore.service - Load Ker=
nel Module efi_pstore.
[   14.635940] systemd[1]: modprobe@fuse.service: Deactivated successfully=
.
[   14.635998] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mo=
dule fuse.
[   14.636109] systemd[1]: modprobe@loop.service: Deactivated successfully=
.
[   14.636169] systemd[1]: Finished modprobe@loop.service - Load Kernel Mo=
dule loop.
[   14.636948] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE C=
ontrol File System...
[   14.637017] systemd[1]: systemd-repart.service - Repartition Root Disk =
was skipped because no trigger condition checks were met.
[   14.637878] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servi=
ce - Create Static Device Nodes in /dev gracefully...
[   14.638053] BTRFS info (device dm-0 state M): use zstd compression, lev=
el 1
[   14.638929] systemd[1]: Finished systemd-modules-load.service - Load Ke=
rnel Modules.
[   14.639133] systemd[1]: Finished systemd-network-generator.service - Ge=
nerate network units from Kernel command line.
[   14.639239] systemd[1]: Finished systemd-remount-fs.service - Remount R=
oot and Kernel File Systems.
[   14.639328] systemd[1]: iscsi-onboot.service - Special handling of earl=
y boot iSCSI sessions was skipped because of an unmet condition check (Con=
ditionDirectoryNotEmpty=3D/sys/class/iscsi_session).
[   14.639613] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware =
Database was skipped because of an unmet condition check (ConditionNeedsUp=
date=3D/etc).
[   14.639644] systemd[1]: systemd-pstore.service - Platform Persistent St=
orage Archival was skipped because of an unmet condition check (ConditionD=
irectoryNotEmpty=3D/sys/fs/pstore).
[   14.640248] systemd[1]: Starting systemd-random-seed.service - Load/Sav=
e OS Random Seed...
[   14.640825] systemd[1]: Starting systemd-sysctl.service - Apply Kernel =
Variables...
[   14.640866] systemd[1]: systemd-tpm2-setup.service - TPM2 SRK Setup was=
 skipped because of an unmet condition check (ConditionSecurity=3Dmeasured=
-uki).
[   14.641410] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE Co=
ntrol File System.
[   14.641742] systemd-journald[1214]: Collecting audit messages is enable=
d.
[   14.643899] systemd[1]: Started systemd-journald.service - Journal Serv=
ice.
[   14.644044] audit: type=3D1130 audit(1724783083.582:4): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.664355] audit: type=3D1130 audit(1724783083.602:5): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-random-seed comm=3D"systemd" exe=3D"/usr/lib/systemd/sy=
stemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.665019] systemd-journald[1214]: Received client request to flush ru=
ntime journal.
[   14.665491] audit: type=3D1334 audit(1724783083.603:6): prog-id=3D41 op=
=3DLOAD
[   14.665495] audit: type=3D1334 audit(1724783083.603:7): prog-id=3D42 op=
=3DLOAD
[   14.665497] audit: type=3D1334 audit(1724783083.603:8): prog-id=3D43 op=
=3DLOAD
[   14.666727] audit: type=3D1130 audit(1724783083.604:9): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.672006] systemd-journald[1214]: /var/log/journal/22eefcbae62e456490=
34b9fa7cc627d0/system.journal: Journal file uses a different sequence numb=
er ID, rotating.
[   14.672009] systemd-journald[1214]: Rotating system journal.
[   14.672106] audit: type=3D1130 audit(1724783083.610:10): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 ms=
g=3D'unit=3Dlvm2-monitor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.681574] audit: type=3D1130 audit(1724783083.619:11): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 ms=
g=3D'unit=3Dsystemd-userdbd comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.794859] BTRFS info: devid 1 device path /dev/mapper/luks-49436d43-a=
842-4f89-a4aa-93ea838ffd01 changed to /dev/dm-0 scanned by (udev-worker) (=
1288)
[   14.795713] BTRFS info: devid 1 device path /dev/dm-0 changed to /dev/m=
apper/luks-49436d43-a842-4f89-a4aa-93ea838ffd01 scanned by (udev-worker) (=
1288)
[   14.806005] zram0: detected capacity change from 0 to 16777216
[   14.827201] Consider using thermal netlink events interface
[   14.832888] input: Intel HID events as /devices/platform/INTC1070:00/in=
put/input15
[   14.835893] intel-hid INTC1070:00: platform supports 5 button array
[   14.838245] input: Intel HID 5 button array as /devices/platform/INTC10=
70:00/input/input16
[   14.841471] intel_pmc_core INT33A1:00:  initialized
[   14.861616] resource: resource sanity check: requesting [mem 0x00000000=
fedc0000-0x00000000fedcffff], which spans more than pnp 00:05 [mem 0xfedc0=
000-0xfedc7fff]
[   14.861622] caller igen6_probe+0x2f6/0x800 [igen6_edac] mapping multipl=
e BARs
[   14.862299] EDAC MC0: Giving out device to module igen6_edac controller=
 Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   14.866173] EDAC MC1: Giving out device to module igen6_edac controller=
 Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   14.866204] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[   14.866206] EDAC igen6 MC1: ADDR 0x7fffffffe0
[   14.866208] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[   14.866209] EDAC igen6 MC0: ADDR 0x7fffffffe0
[   14.866247] EDAC igen6: v2.5.1
[   14.878331] mc: Linux media interface: v0.10
[   14.879200] Adding 8388604k swap on /dev/zram0.  Priority:100 extents:1=
 across:8388604k SSDsc
[   14.879226] ACPI: battery: new extension: Dell DDV Battery Extension
[   14.879237] input: PC Speaker as /devices/platform/pcspkr/input/input17
[   14.882876] e1000e: Intel(R) PRO/1000 Network Driver
[   14.882878] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[   14.882904] e1000e 0000:00:1f.6: enabling device (0000 -> 0002)
[   14.883303] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) s=
et to dynamic conservative mode
[   14.888956] idma64 idma64.0: Found Intel integrated DMA 64-bit
[   14.889061] ACPI: bus type thunderbolt registered
[   14.895013] videodev: Linux video capture interface: v2.00
[   14.901332] idma64 idma64.1: Found Intel integrated DMA 64-bit
[   14.943010] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 65536=
0 ms ovfl timer
[   14.943013] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   14.943014] RAPL PMU: hw unit of domain package 2^-14 Joules
[   14.943015] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   14.943016] RAPL PMU: hw unit of domain psys 2^-14 Joules
[   14.969579] input: Dell Privacy Driver as /devices/platform/PNP0C14:02/=
wmi_bus/wmi_bus-PNP0C14:02/6932965F-1671-4CEB-B988-D3AB0A901919/input/inpu=
t18
[   14.969808] input: Dell WMI hotkeys as /devices/platform/PNP0C14:02/wmi=
_bus/wmi_bus-PNP0C14:02/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input19
[   15.056168] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[   15.058818] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[   15.059117] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   15.059168] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   15.069942] i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present=
 on SMBus but its address is unknown, skipping registration
[   15.069947] i2c i2c-14: Memory type 0x22 not supported yet, not instant=
iating SPD
[   15.102280] intel_rapl_msr: PL4 support detected.
[   15.107239] intel_rapl_common: Found RAPL domain package
[   15.107242] intel_rapl_common: Found RAPL domain core
[   15.107243] intel_rapl_common: Found RAPL domain uncore
[   15.107245] intel_rapl_common: Found RAPL domain psys
[   15.107374] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registere=
d PHC clock
[   15.107861] dell_laptop: Using i8042 filter function for receiving even=
ts
[   15.192508] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) c8=
:4b:d6:74:32:58
[   15.192512] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connect=
ion
[   15.192706] e1000e 0000:00:1f.6 eth0: MAC: 15, PHY: 12, PBA No: FFFFFF-=
0FF
[   15.213442] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
[   15.216162] iTCO_vendor_support: vendor-support=3D0
[   15.216578] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04:=
 bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
[   15.243153] cfg80211: Loading compiled-in X.509 certificates for regula=
tory database
[   15.243234] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D=
6, TCOBASE=3D0x0400)
[   15.243196] mei_pxp 0000:00:16.0-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: =
bound 0000:00:02.0 (ops i915_pxp_tee_component_ops [i915])
[   15.243579] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   15.243744] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db=
18c600'
[   15.244450] usb 3-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:=
673c)
[   15.244643] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 000=
2)
[   15.244895] intel_rapl_common: Found RAPL domain package
[   15.245670] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayou=
t=3D0)
[   15.253044] usb 3-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:=
673c)
[   15.254861] Creating 1 MTD partitions on "0000:00:1f.5":
[   15.254864] 0x000000000000-0x000002000000 : "BIOS"
[   15.257325] usbcore: registered new interface driver uvcvideo
[   15.259635] Creating 1 MTD partitions on "0000:00:1f.5-chip1":
[   15.259640] 0x000000000000-0x000001000000 : "BIOS1"
[   15.271338] intel_tcc_cooling: TCC Offset locked
[   15.277723] Intel(R) Wireless WiFi driver for Linux
[   15.278024] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   15.284416] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x80=
400 wfpm id 0x80000020
[   15.284469] iwlwifi 0000:00:14.3: PCI dev 51f0/4090, rev=3D0x370, rfid=
=3D0x2010d000
[   15.312048] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[   15.312290] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_au=
dio_component_bind_ops [i915])
[   15.363359] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.=
0.2.42
[   15.364119] iwlwifi 0000:00:14.3: loaded firmware version 89.202a2f7b.0=
 so-a0-gf-a0-89.ucode op_mode iwlmvm
[   15.427639] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3204: =
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   15.427643] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[   15.427644] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0=
/0x0/0x0/0x0)
[   15.427646] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[   15.427647] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   15.427648] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
[   15.427649] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x1=
a
[   15.427650] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[   15.549549] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0=
000:00:1f.3/sound/card0/input20
[   15.549594] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input21
[   15.549619] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input22
[   15.549652] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input23
[   15.549675] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input24
[   15.557672] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160M=
Hz, REV=3D0x370
[   15.570061] iwlwifi 0000:00:14.3: WRT: Invalid buffer destination
[   15.662116] EXT4-fs (nvme1n1p2): mounted filesystem 082f08c2-faa7-432e-=
bbb2-db65ef31d4ea r/w with ordered data mode. Quota mode: none.
[   15.732650] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
[   15.732710] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[   15.732757] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   15.732819] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
[   15.732829] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   15.735470] iwlwifi 0000:00:14.3: loaded PNVM version 35148b80
[   15.751088] iwlwifi 0000:00:14.3: Detected RF GF, rfid=3D0x2010d000
[   15.822520] iwlwifi 0000:00:14.3: base HW address: 8c:17:59:de:0b:16
[   15.846377] iwlwifi 0000:00:14.3 wlp0s20f3: renamed from wlan0
[   15.910066] RPC: Registered named UNIX socket transport module.
[   15.910068] RPC: Registered udp transport module.
[   15.910068] RPC: Registered tcp transport module.
[   15.910069] RPC: Registered tcp-with-tls transport module.
[   15.910069] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   16.025199] block nvme1n1: No UUID available providing old NGUID
[   16.120851] NET: Registered PF_QIPCRTR protocol family
[   16.834341] iwlwifi 0000:00:14.3: RF_KILL bit toggled to disable radio.
[   16.834353] iwlwifi 0000:00:14.3: reporting RF_KILL (radio disabled)
[   20.136709] nouveau 0000:01:00.0: gsp: mmu fault queued
[   20.137717] nouveau 0000:01:00.0: gsp: rc engn:0000000b chid:8 type:31 =
scope:1 part:233
[   20.137738] nouveau 0000:01:00.0: fifo:bd207ad:0001:0008:[(udev-worker)=
[544]] errored - disabling channel
[   20.137752] nouveau 0000:01:00.0: DRM: channel 8 killed!
[   20.138451] nouveau 0000:01:00.0: gsp: mmu fault queued
[   20.139443] nouveau 0000:01:00.0: gsp: rc engn:00000001 chid:0 type:31 =
scope:1 part:233
[   20.139458] nouveau 0000:01:00.0: fifo:000000:0000:0000:[(udev-worker)[=
544]] errored - disabling channel
[   20.139467] nouveau 0000:01:00.0: DRM: channel 0 killed!
[   25.086292] nouveau 0000:01:00.0: gsp: rc engn:00000001 chid:0 type:31 =
scope:1 part:233
[   56.664784] rfkill: input handler disabled
[   97.586090] systemd-journald[1214]: /var/log/journal/22eefcbae62e456490=
34b9fa7cc627d0/user-1000.journal: Journal file uses a different sequence n=
umber ID, rotating.
[   97.924688] rfkill: input handler enabled
[  131.238299] rfkill: input handler disabled
[  199.681258] bridge: filtering via arp/ip/ip6tables is no longer availab=
le by default. Update your scripts to load br_netfilter if you need this.
[  205.650365] iwlwifi 0000:00:14.3: RF_KILL bit toggled to enable radio.
[  205.650374] iwlwifi 0000:00:14.3: reporting RF_KILL (radio enabled)
[  205.662821] iwlwifi 0000:00:14.3: WRT: Invalid buffer destination
[  205.819927] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
[  205.819972] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[  205.820024] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
[  205.820077] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[  205.821219] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[  205.919443] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, wi=
th index: 1
[  209.264024] wlp0s20f3: authenticate with f0:9f:c2:de:24:1d (local addre=
ss=3Dee:89:07:ec:0b:03)
[  209.265135] wlp0s20f3: send auth to f0:9f:c2:de:24:1d (try 1/3)
[  209.312458] wlp0s20f3: authenticated
[  209.313426] wlp0s20f3: associate with f0:9f:c2:de:24:1d (try 1/3)
[  209.317462] wlp0s20f3: RX AssocResp from f0:9f:c2:de:24:1d (capab=3D0x1=
501 status=3D0 aid=3D6)
[  209.329077] wlp0s20f3: associated
[  209.339091] wlp0s20f3: Limiting TX power to 21 (24 - 3) dBm as advertis=
ed by f0:9f:c2:de:24:1d
[  213.476111] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com fo=
r information.
[  213.476116] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jaso=
n@zx2c4.com>. All Rights Reserved.
[  270.982944] BTRFS: device label Samsung devid 1 transid 5344 /dev/nvme0=
n1p1 (259:1) scanned by pool-udisksd (5499)
[  270.983474] BTRFS info (device nvme0n1p1): first mount of filesystem 7f=
1597b2-f31f-4083-b98c-e928c88178b8
[  270.983516] BTRFS info (device nvme0n1p1): using crc32c (crc32c-intel) =
checksum algorithm
[  270.983524] BTRFS info (device nvme0n1p1): using free-space-tree

--kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46
Content-Type: image/png
Content-Disposition: attachment; filename="Screenshot from 2024-08-27
 12-30-46.png"
Content-Transfer-Encoding: base64

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
wpgxY7h79y7h4eFERkZy5coVhg0bVuh1i7tPSkniiI2NZd68edSqVYt58+YpCbiZ+VgHB4dCr2Nv
by/vBUJUcY9lfbLmzZszZMgQcnJymDdvHt9++y23b99Gp9MRFxfHhg0bmDdvHlqtFmdnZ7mZSQUw
f6tSt25d1Go1ly5dwsXFhTp16ig/NjY2SrvAwEDmzZunfHNS2Lr04snm5ubG559/TsOGDbl58ybT
pk0rt5sVlSdzAv/gwQPs7e3/khNbK5urqys8HDE3J+/mb+4e5YOdm5sbKpWKO3fuYG9vj6urq/Lz
KDf2q8h6+Li4OL744gusrKyU10DzxM9Tp04pZUxnzpyxSPTJVRe/adMm1Go1bdq0UbZt2LABg8FA
p06dSh1T7tfw4uK4dOkSWq2WDh060KpVK1xcXCy+WTd/CxAaGqqcw1zOlfd68l4gRNVV6M2eytuM
GTPg4XKT69evZ/369Rb7VSoVbm5upKSk8Nprr/Hpp58+Uq2k+C8XFxcSEhJYu3YtY8aMYeDAgeze
vZvZs2fTt29fEhMTyczMZMGCBVy7do0FCxbQuXNnnJ2d2bdvHzxcFUP8NZkTefOI/LRp06rUiLwk
8I+Hu7s7tWvXJjY2lp07d1KjRg1u3LiBlZXVI9WdOzo64u/vr5R3NGrUiIyMDHQ6XZnnlfAwiS/P
0svly5ej0Wi4c+cOUVFRGAwGpk6dSoMGDQDw8/Ojffv2nDlzhmnTptGoUSNOnDiBjY2NRZloixYt
cHFx4fTp0zzzzDPY29tjb29Pw4YN+f3333F0dCz1t0h5X8OLi8P84Wbv3r3wcCKyTqdTzle/fn1a
tGjB77//zowZM6hfvz4nT560uKa8FwhR9T22BYatrKyYNWsWvXv35ocffuDChQukpqbi4uJCQEAA
Q4cOxdvbm9dff52bN29KIl+O/v73v7NixQp+/vlnOnTowMyZM/H09OS3337ju+++w9vbmyZNmmAy
mTAajdStW5fjx4+TmZmJp6cnc+bM4ZlnnqnsblQ5f4WJrWZVNZGXBP7x6tu3L6dOnSImJoZbt27h
5eVFp06dlFH6surSpQtOTk5cuXKFyMhInJ2dldXIyiItLQ2dTleuf58HDx7EysoKb29vAgMDGTNm
jJLAm7399tusXr2a06dPExoaSrNmzZg6dapFfbtaraZTp04EBwdblJ0EBgZy9epVi1r2ksr7Gl5c
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
v9G9e3cmTpzIpUtlv8eOj48Pvr6+Fje7PHnyJIGBgTz77LMcP37c4kZ6YWFhj5xMq9VqatSoUWQb
Ozs7VCqVUqWQ9/W0vJ8HgPHjx6PT6di5cycmk4mVK1fyyiuv4OLiUqLjDQYDWq2W+Pj4Ul134MCB
REdHc/bsWYvt69evZ9SoUfm+zfP29mbq1Kl8+umnnD59mgMHDvDmm2+W6pqlJUn8QzNnzqR9+/a8
8847TJ06lYyMDD788MNHWhVj7NixjB49mpUrVzJ48GBeffVV/vzzz3KNWwjxXwMGDKBmzZp88803
JT5mxYoVhISEsHTpUr799ltUKhXR0dEWbeLi4njzzTfZtWsXLVq04M0330Sn0zFhwgT+9re/0bdv
X06fPs2bb75J9+7dCQsLU46NjIxEp9NZvOGfPXuW2rVrU7duXerUqcOSJUvYtm0bgwYN4t1331XK
Cgs6Pw+T+59++on333+fLVu20L9/f4uyvcLiLSkbGxsaNmyoxPHJJ59w69YtNmzYwKZNm4iLi2PF
ihUWx4SGhrJw4UJ+/PFHfHx8GD9+PAkJCSxbtoyNGzcSGxtLUFCQ0n716tUcOHCAxYsXs3HjRmxs
bJg2bZpFnCEhIfzzn//M14/09HTmzZvH4MGD2bt3L59++mmRo12//vqrskBBly5dOHr0aL7nY8mS
JfTv3581a9bwzDPPlLjfuel0OrKysix+zIlWSfpb2hiee+45jh07ZpHMHTlyREk4SxJ/QdfM7ebN
m8qCDgU5d+4czZo1g4elK6mpqRYJN4Cvry8ZGRmFfgDKfQ4zo9HI/fv3CQkJYcmSJYwbN07Z5+3t
jZWVVZmSwx07dtCvX78C66AftU+7d+9mzpw57Nixg4CAAGbMmPFI32Z16tSJiIgI5fHJkyfp0qUL
7du3Jzs7m4sXLwJw/fp1cnJyaNmypdK2oL/Fgu4DZBYfH8+ePXsYOnRogftNJhNxcXGsXLmS4cOH
F1mOVt7Pg62tLbNnz2b16tX8+OOPpKenM3LkyBIf36JFCxo2bMiUKVNYv349iYmJJTrOzs6OsWPH
WozGJyYmcujQIUaMGFHgMS+//DKOjo7MmTOHGTNm4OXlVeI4y6JSk3jzVxG56+ALY25T1P94eS1Y
sKDASa08/GTt7++vPLaxsWHmzJls2bKF7du3889//tPiWkFBQfTv39+i/f79+/H29la2tW/fni1b
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
M+Tn59OuXbti+4iKimLixIkMGDCA//znP05B8vnz54mOji63HeUp65wffvhhrFYr69atA+C9996j
efPm3HPPPWW2rTCLxUJubq7To/B8NEuWLGHPnj288cYbrF69usxc99KOuXz5crZt28brr7/O6tWr
MRqNTJkyxen1WLhwIYMGDWLFihW0b9++0q9TSdLT0/npp59o166dmuO+Y8cO0tLSGDNmDA8++CDp
6ens2rULgIiICDp37kzLli158sknne7GlGfHjh20bt2akSNHOgXpcXFx9O3bl4cffpigoCC++eab
azLfj9SEr3l1MoivKW+++SbDhg1j2LBhjBgxgmnTpqkXn9oye/Zstm3bdtX2b7FYGDZsGAkJCVft
GELAlfJgufmVDwDKk5tvQebnFFfLxYsXAfDx8SlxvZubG56enqSkpKjLRo0aRVhYGAEBAcycORMf
Hx+2bt1KdnY2GzZs4JFHHsHX15eAgACmTJnCjh07nPY5ePBgWrVqha+vLxMmTODSpUsldlR17dqV
Q4cOYbfbyc/P55dffiEyMhKj0UhkZKQa2P3888906tSpUnniAEOHDqVNmzbltqMs5Z2zwWBgzpw5
xMTEsHv3br799lteeOGFSh1j/fr13HHHHU4Px+em2Wxm3bp1PP/887Ro0YLg4GBmzZpVqf2bzWZW
r17NnDlzuPXWWwkJCWHevHlkZ2ezc+dOdbspU6Zwzz330Lx582oNij18+DCLFi1i0aJFrFy5kuDg
YDUYN5vNHD16lMjISNzc3HB3d6dbt26cPn26ysdz6Nq1K23atMHPz89pUGyrVq0ICAjAzc2NTp06
kZOTw+XLl6t9PHHt1cl0mpo0cOBAHnroIaxWK+fPn+fHH39k9uzZTJ8+vdgtOCFExWg0GvR6Pb+e
SqJdM3/cTDWT15mdm8/RM8nojZ5SK1hcFf7+VyasSkhIwMPDo9h6s9lMVlYWISEhJT5fq9USFhZG
XFwccXFxKIrC7Nmz1b9Xq9VKdnZ2qccPDg7G1dWVnJycYusiIiLIycnhr7/+IiEhgVatWqlt7NWr
F2vWrGHq1KlO+fBVVVY7ylKRc+7QoQN33XUXTz31FHPnzlVf84oaO3YsTz31VInrzp07h6IoTgNX
K+v8+fNYrVanfbi6utKuXTv+/vtvdVnRdKuqat++PT179sRut/Pxxx87XdvS0tKw2+18/fXX6nJF
UTCbzdU+bkWq2Xh6emIwGKp0R0bUvhs+iDcYDGpuoqenJ61bt8bf358VK1bQoUOHWiklJsR1T6PB
aHQhI9fAtgN/YTbnY1eUKs+uqUEDGg0mkyvunt54upjUiUCEqEne3t54eXlx+PDhEidOO3r0KFqt
ltDQ0FL3odPpMJlMaoC9atWqEidnK01pX1BdXV0JDw/n4MGDxMXF0b17d3Vdjx49mD9/PhcuXODg
wYPMmDGjwserbDvKUtFzbtiw4VUp62ixWHBMUFm4ik9lOEpO2mw2p30YjcarMtBUq9Wqd00iIiLY
vXs3HTp0wGg0ql8UxowZU+nKP5KeIm74IL4k9957L19//TU///wzvXv3RlEU/vWvf7F9+3bS09Np
1aoVjzzyCAEBASxatAhFUdReAYvFwqOPPkrv3r0ZP348AHl5eURFRfHOO+/wxhtv0KVLF/bv3098
fDxBQUFMnjyZ1q1LntK8rGNbrVY+/vhjDhw4wKVLl/Dz8+OBBx6gV69e6vNtNhtr165l165d5OTk
0LFjR6f9Hz58mE8//ZT4+Hh8fHzo1q0bDz300FV9fcWNT6vVYjS64OnljcnV9Uod4+p+oBT07huN
LhiNLlX+gBaiPCNHjiQ2NpbBgwc7deQoisLy5csZNWqUU/BZtGf92LFjTJw4kaCgINzc3Ni5cyf3
3XdfjbTNkVJz4sQJFixYoC739vYmLCyMFStW4OXlVeqdAgdHbfGaVpFz/vvvv/noo4+YMWMGr732
Gp06dXK661GdtjkGch4+fJhOnTpV+HmFj1l4H507d4aC//vjx49z//33V7ltFdGmTRv27dvHkSNH
6Ny5M56enhiNRs6cOVPqOA0KPusLMxgMpKamlvllU9z4bspPSYPBQOPGjblw4QIA69atY+/evTzz
zDMsXLgQo9HIiy++iNVqJSIigqNHj6rP/f3337FarepocceyBg0aEBh4pTrHkSNHeOyxx3j33Xdp
3rw5CxcuLPWiVdax9Xo9QUFBREdH8/bbb9OnTx/eeecdtd0U1PQ9fPgwzz77LAsXLnS6/ZeVlcVr
r71Gv379eP/993n22WeJjIy8Kq+puHFoK9g7p9XpMLqYcHf3xMvLBy9v3+o9vHxwd/fE6GJCW8lc
XyEqY9y4cXh4eDBhwgR27dpFcnIyhw4dYvr06WRkZDBp0iSn7ZcvX87OnTtJS0tj+fLl5OTk0Ldv
X/R6PePHj2fJkiXs378fRVFITEzk+PHjVW5bZGQkP/30E/n5+TRr1sxpXc+ePfn666/LvY4HBgZy
+PBhLl68SG5ubpXbUpLyzllRFObNm8f48eN56KGHuO2225zqzFekbSUNbHWkl7i5uTFkyBBeeeUV
jh07RmpqKh988EGlXkfm4CcAACAASURBVA83NzeGDh3Kq6++yvHjx0lNTWXhwoX4+vpe9c9InU5H
x44dOXToEBaLBa1WS8eOHfnpp584e/YsdrudzMxMEhMT1ed4eHhw/vx5MjIy1LSX4OBgjh49SkZG
BpmZmfz2229Xtd2ibqoTQXxsbCwrV64sMTcvJyeHlStX8vHHH9foMX19fdU3xMaNG5kyZQqNGzcm
MDCQ6dOnk5OTw88//8ztt99OVlaWOvjn8OHD3H///aSlpanB9K+//urUA967d2+aNm2Kl5cXw4YN
Iy0tTR1MVVh5x6Ygpz80NJTAwECGDx9OQEAAJ0+eVJ//7bffqpOVBAQEOH34pKamYrVa6dixI+7u
7oSGhnLrrbfW6OsobjyuhorfYtdqtWh1OnR6fY08tDqd9MCLq87NzY1Vq1bRs2dP3n33XYYPH86i
RYu47bbb+Oijj/D09HTavnPnzrz99tvcd999/Pbbb8TExGAwGACYOHEiEyZMYMGCBfTq1YtHH32U
P/74o8pta9GiBW5ubk6pNA69evVCUZRy8+EHDx5MWFgYo0aNYs6cOVVuS2nKOufVq1eTk5PDgw8+
CAXFHL777jv1M60ibStpYKujdKJjnxEREcyYMUO9s+zoXS9JScd85pln6NatG7NmzWL06NFkZmby
zjvvXJOxOI6qQkeOHAGgS5cuREREsGPHDpYtW8bnn39OUlKSun3r1q0JDg7m448/5ttvvwXgjjvu
wN3dnY8//pgvvvgCT0/PSg90Ftc/TUJCgt2RX2a327HZbNhsNqxWK1arFZvNRmZmJi1btiwx/yo1
NbXajVi5ciUXL14kICCAsWPHqt/aZ8yYwZo1a0hKSiIoKIiHH364Uvt988038fHxKfF5L774IhER
EXTo0IGnnnqKtWvXOgUPL730Ei1btmTEiBHMnTuXLl26MGjQIP7nf/6H5557jo8//pjWrVszZMgQ
nn76aSZMmEC7du2YPXs2d911F/369VP3NXbsWObNm0fz5s2d1p87d67cY2dkZLBr1y7++OMPMjMz
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
9ddLXKfRaHjooYd46KGHSlwfGxtbbNnOnTvLPN7mzZtLXN64cWMOHDhQ7jFcXFycAp+KtKN79+5s
2bLFaf29997Lvffe67Rs4sSJTJw4scz2i5vb4sWLOXjwIK+++ipt27alSZMm6rq9e/cSHR1NQEAA
y5cv59lnn+Wbb76hf//+vPbaayiKonbU/vjjjzzwwANO+y7t2rx8+XJ2797N66+/jqurK2+//TZT
pkzhiy++UL9wO8TGxrJ582bmz59P/fr1OXz4sNoRUdbnQuFzeO655wgICOC9994jOjqab775htzc
XGbNmsVTTz3FnXfeSXJystMX4Iq0ceHChcycOZOZM2eWOnv55s2b6dmzJ9S1EpOOgUuPPfYY//zn
P50ejz76KACHDx+u1D7/+usv/vOf/5S47tNPP62BVv9X9+7dufXWW2t0n0LUXW7o9fUBL4xGf2w2
dzQab+x2T2w2d8xmVwwGP7RaH6zWemRl6cjO1mOzuaPV+qDT+WK3e2K3e2CzGcjPzyc/P18dtFQV
DzzwAL/++it//vknFPRi33vvvcXSMSpaGrCk/Tdr1oyQkBAefvhhgoOD1drdhZ07dw673V5qGcPC
1q9fzx133OH02LZtG1SxHGJF2mo2m1m3bh3PP/88LVq0IDg4mFmzZhXbx913302LFi3w9fVl3Lhx
2O12xo0bR3BwMKGhodx7772VGnCanJyM1WqlR48eeHp60qxZszJ7rD///HMGDBjA/fffX+FjCCFq
V2BgIGPGjCEoKIjff//dad3dd9+tllsdP348qampxMfH0717d3Jzc9VrVGpqKidOnFCD1bKYzWZW
r17NnDlzuPXWWwkJCWHevHlkZ2cX+8Jss9n48MMPee6552jdujUBAQHcdddduLq6VrtkbFnXt4q2
ccqUKdxzzz00b968xIG7ubm57Nq1i169ekFdq07jmCGvpG8fjhw9xzYV5ePjw5o1a9SZ7RzOnTvH
r7/+WqN1qqV3QtyMLBYLdrsdg8GAVqvFYrGg0+nw9vZWU0AqO1g1Obl4UFoRHh4ePPDAA3z00Udq
78i6deuKbVeV0oAAaWlpbNmyhV9++YXLly+TmppaYk+yn58fFFxnykurGDt2LE899VSJ66pTDrGs
tp47dw5FUZwGoZanadOmAE49S7fcckulShTecsstREREMGrUKLp3787QoUPp1KlTqduPGDGCRx99
lPT09AofQwhRuxYuXEheXh5paWll3mkrXObUxcWFO+64g127dhEWFsbu3bvp0qVLhdIRz58/j9Vq
dbqeubq60q5dO/7+++9i2+bk5JR4Xa5uydg2bdoQERHByJEj6dGjB/fddx+dO3euVBuLpk0W5chI
adWqFbm5uXUriL8a7rzzTjZv3sxvv/3mdLt53bp13HfffepU1Q4jR47k2WefVcvQ/fnnn8yYMYNv
v/0WCibZ+Oijj/j777+pX78+PXv2ZPLkyQBMmzaNIUOGOOWAffHFF/z73/8mLS2NNm3aMH36dBo0
aHCNzl6Iqyc/P5/c3Fz19qejSo3dbicrK4v09HTcPb0x22y4urgAGnJzc65Ur9Hp0GlBU1B323HB
1Ov1+Pr6VrknHmDMmDHcd9996PV6+vbtqwbChVWlNGBOTg4TJkygX79+PPLIIzRo0KDUVAxvb298
fX3Zu3dvlXOjqUY5xPLaarFYUBRF/T+rqsqWKNRqtSxdupSDBw/y9ddfEx0dTceOHZ2qsAghrm+j
Ro2iWbNmzJkzp9xtC19D+vfvT0xMDNOmTWPHjh3079+/Qsdz3L11pG06GI3GYuNbHLOEF07bcahu
yVitVsuyZcvU69szzzxDREQEb7zxRqXaWJYtW7aoA+upa+k0V4OLiwvDhw9nzZo16rKUlBR2795d
LNevPJmZmbz44osMHDiQtWvXMn/+/BLL2TmsW7eOrVu38uyzz/L+++/Tv39/vL0rX3VDiLrI3d0d
Ly8v9eEoKenm5oaPjw/+/v4YPbyo5xuAzt0bo4cXnv4NcPcPwtMvkIDABgQFBREYGEhAQAABAQGV
unCWxtfXl3vvvZfNmzcTFRVV4jaFSwOWpXCZvt9//5309HSefPJJmjZtqk5QVZqHHnqIVatWcf78
+WqczX/LIRbtDSqtHGJF2uq421nZ9MSqKKnUYceOHXnxxRf54IMP+PHHH0lKSrrq7aiq2NhYhg4d
WtvNEOK60ahRI1xdXSv9Jb979+5cvHiRM2fOcPjw4TJTaQpfV0q6nimKwvHjx4ulOIeEhKAoSrE0
HyrxuVCejh07MnfuXD788EP1+laZNpYmMzOTvXv3smzZMg4cOMCBAwdu/CCegsE5x48f5/Tp01CQ
gzpw4MBKl5y7dOkSVquVLl264OHhQZMmTWjZsmWJ29psNtasWcOMGTNo0aIFfn5+9OnT56aenEDc
WFJTU0lOTiY5OZn4+HjOnz9PYmIiFy9eJDExkeTkZFLPx5H81wlS/v6TC6d+5+wfvxH/+y/EnTjK
id+Pc+zYMX7//XeOHj3Kn3/+yeXLl2ukbY888gjvvfdeqRP2FC4NuH//fhRFITExkePHj6vbBAYG
cvjwYS5evEhubi5+fn5kZWXx+eefk5aWxubNm9Xc+5KMHTuW1q1b89BDD/HZZ59x+vRpzp49y+bN
m50+JBwDWws/zGazun7cuHF4eHgwYcIEdu3aRXJyMocOHWL69OkllkOkIJ2nrLa6ubkxZMgQXnnl
FY4dO0ZqaioffPBBlV7rshR9DTMyMti4cSNJSUnk5eVx6NAhXF1dS+3csFqtmM1mLJaqVSwSQlx7
6enp/PDDD2rMVVFGo5GePXuycOFCOnToUGq6c9HripubG0OHDuXVV1/l+PHjpKamsnDhQnx9fYul
Unt5edGnTx9ee+014uLiyMnJYefOneTk5FToc6EsRa9vBw8eVK9vlWljaX744Qe8vLyIiIhQl9Vq
Os2JEyfYvn07iYmJJfbAlbe+otzd3bn33ntZu3Yt06dPZ+vWrVX6wAoNDSU8PJxJkyYRGRnJoEGD
Sp390fHHVbQmtBA3CkfJLZvNpl5sHdVpHDOzGgwGFEXBarWqqRt6vR673Y7NZkOv16PT6bDZbFdq
zBdUrakuLy+vcmdmLa80YEll+p588kliYmJYtmwZnTt3LvPiq9freffdd1m3bh3fffcdy5YtQ6vV
0rRpU4YNG6Zut379etavX+/03MIztla2HCIFVUzKa+vs2bN58803mTFjBgaDgSFDhpRaDaGqir6G
Tz/9NNu3b2fp0qVkZWXRuHFjXn31VYxGY4n/9xs2bOBf//oXNpuN3377rUbbJoS4Op544gk6derk
FGxWVP/+/Zk1a1aZc1+UdG1+5plnWLx4MbNmzVI7W995550S7wb84x//YOHChUyePBmLxUKLFi1o
3rw5bm5u1SoZm5mZyQ8//MCSJUvIysqiSZMmvPbaa+o1ujJtLMmWLVu46667nNJxNAkJCXZHbqTj
g9Vms2G1WrFardhsNjIzM2nZsmWNfcAC/PHHH6xevbrEdf/85z/LXV8RL730Eo0aNSIqKoq0tDSi
oqLo3r07RqNRHUg2cuRIXnjhBbXEZHk58QC//PILW7ZsYffu3YSHh6t/bIVz4k+cOMH06dP597//
Xay8kRBVlZaWVmJu9LVisVg4deoUrVu35sKFC+Tl5eHm5qYG6IqioNfr1aDcaDTi4uKCxWLBYrGg
0WjUvHnHzK2OC5JjxlZvb28SE5NIT7/MLbfcIu+fG0TRzw/H74V/lvY5lJ6eLpW/hLhOnDp1Ci8v
L/R6vdpR4yg7wSzaZwAAIABJREFUXHgMVNGfFEzON2rUKL7//vsaLTxyo6q1nvjt27dDwcDTyMhI
9u3bx9atWyu8vrJ8fHwYOHAgX331lTpRQElMJhNnz54tsxevffv2tG/fnpEjRzJ58mRSUlLUahQO
QUFBKIrCyZMnqzWwTYi6ytvbW+1NLxycUygw02g0aDQatSdCo9E4bePosXcsl4nchBDi5rVjxw46
d+4sAXwF1VoQ76hrHBkZidFoJDIykq1bt6ozwJW3virGjRvHHXfcQcOGDUvd5rbbbmPTpk107doV
jUbj1AOfmZnJTz/9REREBB4eHvzyyy+lTgnu6elJjx49WLx4Mc8//zx+fn4cOXKE8PDwCk2BLURd
5ygf5hhg5AjmdTodZrMZrVbrlNvtUHiiJ41Gg81mw2Aw4OHhgYeHh8wCKYQQN6nvvvuO4cOH13Yz
rhu19mnp7+/PuXPn2Lt3L127dmXv3r0AavnF8tZXhaenZ7kzsz766KMsWLCASZMm4efnx8CBA9Xb
+VlZWezatYsVK1aQnZ1No0aNePHFF0stD/T000+zdOlSZs6cicVioVmzZjRt2lSCeHFDqFevHi7u
XigGEwadFsVuR7GDxpyDqzkPbUEvvONWqaO8FgUpNI60CcetVrvdrtacF0IIcXOJj4/nzz//VCcy
EuWrtZz4U6dOsWrVKqd9ajQaxo0bR4sWLUpcT8GUuzJYVNys6lJOfEZGBrl5eeRbLHh5euHm5ood
LTqNHYqkzBRWNA+ycHqNVqtFp9NJTvwNSHLihbg5VCcnvqTfRelqrSf+1ltvZdy4cfzwww8kJycT
EBBA37591QClpPV9+vSRAF6IOsRmteKi15OXk41itaiTCFHQU5+bm4vFYsHFxcWpKo3NZlPz4O12
u/pvFxcXfHx8avu0hBBCiDqvVpNPW7RoUWZQXt56IUTtKRyIO+p5OwJ1vV5Pdna2Ojudoijk5ORg
sVjUnnVFUTAYDGi1WqxWq5p6U1IevRBCCCGcyQgyIUSV6HQ6TCYTZrMZFxcXNR3G0bvuuG2q0WjQ
6/Xqto5ylIV74V1dXXFxcVFrzwshhBCibBLECyGqJDc3l5SUFHWiHqvVisViUSdvcnNzIy8vT+19
1+v1ai+7wWBQc6C1Wq0a8NevX5/69evX9qkJIYQQdZ4E8UKISnGkx/j7+1O/fn2nHvjCg1Udkzgp
iqL2yDuCfUcpSooMeHQE9DabtZbOTgghhLg+SBAvhKgUV1dXzp8/T3BwcIVquheeIpqCNJzS2Gw2
0tPTSUhIICAgQKoUiHLFxcXVdhOEuCk1bty4tptw05MgXghRYVqtFm9vb44fP86RI0ecqtFUl6O3
3sXFhYCAALy9vYt9ARCiKAkkhBA3KwnihRAVptVqMZlM3HLLLfj6+tZ4JRmNRoPBYMDHxwej0Sg9
8UIIIUQpJIgXQlSYo9KMr68v3t7eNdYLX5hjwqfCk4IIIYQQwpkE8UKISnEE1zU5g3NRjtQaIYQQ
QpRMgnghRKVJkC2EEELULhk1JoQQQgghxHVGgnghhBBCCCGuMxLECyGEEEIIcZ2RIF4IIYQQQojr
jATxQgghhBBCXGckiBdCCCGEEOI6I0G8EEIIIYQQ1xkJ4oUQQgghhLjOSBAvhBBCCCHEdUaCeCGE
EEIIIa4zEsQLIYQQQghxndHXdgOEEEKI2rBt2zY2btzIyZMnycrKIjQ0lGHDhjFs2LByn2s2m1EU
BZPJdE3aKm4MJ0+e5NixY6SkpGA2m/H29qZdu3a0a9cOq9UKgF5ffmj26aef0q5dO9q2bVvh427e
vJlx48bh7e2tLv/tt9/Yt28fUVFRuLi4VOPMRG2QIF4IIcRNZ968eRw8eJApU6YwY8YMLBYLf/zx
B+7u7hV6/ooVK4iPj+fll1++6m0VN4atW7dy7tw5unbtSs+ePbHZbCQlJanB8/79+0lPT2fQoEE1
fuzmzZtz7Ngxtm/fzv333w9Abm4uP/30E/369ZMA/jolQbwQQoibypYtWzhw4ABr166lXr166vIW
LVrUarvEjevEiRPEx8czbtw4jEajutzf3/+ataFv377ExsZy+vRpmjVrxq5duwgODqZ58+bXrA2i
ZtVqEG+z2fj+++85cuQImZmZZW7r6elJeHg4/fr1Q6fTXbM2CiGEuLHExMTw2GOPOQXwRd111138
3//9H507dwbg999/Z9KkSezZs4fY2Fg+/PBDKEjJGTZsGNHR0des/eL6s2/fPrp27eoUwBd24MAB
9u/fDwWpL23btqVv3758+umnhIeHc/z4cRITExkyZAihoaGlHufMmTPs27ePsWPHFlvn6elJZGQk
O3bswGAwcOrUKcaNG1eDZymutVoN4rdt28auXbsqtG1GRgY7d+5Eo9EwYMCACj3npZdeYvv27VCQ
YxYSEsLgwYO577770GqvjOmdNGkSAwYMYPTo0eXuz2w2Y7fb5baTEEJcp/Ly8oiPj6ddu3ZV3kdU
VBTZ2dmSTiMqxGq1kpaWRlBQUKnb/D97dx5f45n/f/x1liwnyCZim9j3WiK0tNRWS9XW6hRV1Fja
DKPDfBVV37F89Tst+pupirWqMSjafqtM1VImglpatXQoiiYiBJFIIvtZfn+QU4ckYokk8n4+Hnmc
c+77Ovf1uaPN+Zzr/tzX1bJlS7KysnItp4mIiKB9+/a0b9/epZ49Nw6HA4fDkef+kJAQjh8/zrp1
62jXrh3lypW7hzOS4qJIk/hDhw4B8PrrrxMUFJRv25iYGBYtWsTBgwcLnMQD9OrVixEjRpCRkcEP
P/zAvHnzyMjIcH5LbdOmDXXq1CnQsVauXMn58+d5++23C9y/iIgUH+fOncPhcODn51fUoUgpcfXq
VQAsFss9vf/JJ5+kUaNGee632+1kZWXBTTdcZ2RkAGA0Gl1G/41GIzVr1iQ+Pv6OeZcUf0WaxCcn
JwMU6D+knDY57ykod3d3ypQpQ5kyZejWrRvXrl1j1apVziR+2LBh9xS7iIiUPAEBAXAjmc8vMRJ5
UHLKtpKSku5pNqM7zVYTHx/PqlWrXLYtXLgQgJo1a9KnTx/n9qSkJA4dOkT16tX59ttv6devHwaD
4a5jkuKhWN3YumTJEgwGAyNGjCi0Pho3bkxSUhLp6elYLBZGjx5Nz549XS5fffHFF3z99dckJibS
qFEjxowZw44dO5z/k0RGRtKjRw/eeOMN+vXrx6RJkwgJCQHg5MmTjB07lo0bNwIwevRoXnjhBbZs
2cLPP//MtGnTaNGiBdnZ2SxbtoyIiAiysrJo06YNoaGhzm/q33//PZ988glRUVGUL1+edu3aFerv
RUSkNPD19cXf3589e/YoiZeHwmKx4OXlRVRUFBUrVnzgxw8MDGTs2LEAnD59mr179/LKK6/k2nbb
tm089thjPPnkk4SHh3PkyBGaNWv2wGOSh6NYJfEP49tgQkIC/v7+eV7WWrNmDdu3b2fSpEn4+/vz
008/4evrS//+/UlLS7uncpqwsDBCQ0MJDQ2latWqzm1XrlwhLCwMm83GrFmzWLJkCW+88QYpKSlM
nTqVP/7xj3To0IErV66QmZn5QM5fRKS0GzRoEB999BHPPvus82/yrSwWC7/++qvzxtbc5MzrLXIn
ISEh7N+/nwYNGuDj45NnO5vNVmgx/Pzzz8THx9OjRw88PDzo0KED3377LbVq1VJtfAlVrFZsHTFi
RKGNNttsNk6dOsXSpUvp169fnm1WrVrF2LFjqVevHgEBAXTs2PG+F/MYOnQo3bp1o1atWnh4eJCW
lsbGjRsZPHgwfn5+BAQEMHToUHbv3g3AlStXsFqttGrVinLlylGjRg3q169/XzGIiMh1AwcOpGHD
hgwaNIi1a9dy+vRpzp49y6ZNm4iMjASgWbNmfPXVV1y4cIG4uDi+/PJLl2NUrFiRgwcPcuHCBdLT
04voTKSkCAkJITAwkFWrVnH48GGuXLlCYmIix48f58yZMwCUK1eO2NhYkpOTyc7Ozvd4np6euZYX
m0ymXCffyMjIIDIyknbt2jn316tXj8qVK7N9+/YHdp7ycBWrkfibXb16lc8//5y+ffvi7+9/z8f5
4osv+OKLLzAYDFSqVInf//739OrVK9e2OX+MH/RcwbdOKRUTE4Pdbmf69OnOqw9Wq5W0tDQAqlWr
RnBwMMOHD6d169Z0797dWa4jUpRyZj640wwID4LBYHD5EXlQzGYzCxYsYM2aNWzdupX58+djNBqp
VauWc7XWP//5z0yfPp1+/fpRoUIFevfu7fK3vEePHuzevZv+/fvTokUL/v73vxfhGUlxZzQaefHF
Fzl06BAnT55k9+7dGI1G/P39adq0KQANGzYkKiqKf/7zn/zud79zqWW/VUhICNu2bePKlSsuOU2N
GjWoUaPGbe0jIyPx9/enQYMGLts7derEP//5T06cOKHBwhKoWCXx27dv59KlS7Rt25Y1a9aQmJjI
smXLGDZs2D3PJJAzO42bm1ue87PmSE1NhRt3ehfmXPQ5KwLOmzcv1/MyGo3MmjWLw4cPs3nzZqZN
m0ZwcDAzZswotJhE7sThcGCz2cjKyuRhpdQOwN3dA5PJpEReHiij0cjLL7/Myy+/nOt+f39/Pvjg
A5dtQ4cOdT738PDg/fffL/Q45dFhMBho3rw5zZs3z3W/2Wy+bZAxr/8+q1evflcTc3Tt2jXX7T4+
PvzpT38q8HGkeCk25TTbt29n+/bt/Oc//2HhwoUkJiYCkJiY6FxU417kzE5zpwQeoHLlytjtdn75
5Zc829xaA+np6cnZs2fvKqaKFStisVjYs2dPvu2aNWvGhAkTmDt3Lt999x3x8fF31Y/Ig+RwOK7f
m1HII/C3dEpmZmahj/qLiIiUNMVmJD6/hDZnvtPC5u3tTdu2bZk7dy5vv/02AQEBHDp0iODgYCwW
CxUqVODrr7/m4sWL+Pj44OnpyWOPPcY333zDk08+icFgcM5Kkx+z2cyAAQNYunQplSpVIjg4mCtX
rpCQkED9+vVJSUlh9+7dtGzZknLlynH48GE8PT3x9vZ+KL8HkdzkJPEWz+v1lNf+0RPr6d1g8sJh
9AKTFxjL3PTcC8eNR2cboxeY8m6D8Xo79ypl8evqg8FgICMj877vSxEREXnUFGkS7+3tTXJyMjEx
MXec8SVntLuwE9n/+q//IiwsjHHjxpGdnU3t2rWpVasWFouFrl27sn//fkaMGEGzZs2YOXMmr732
GrNnz2b48OEEBATw7LPP4ubmdsd+Bg4ciLu7O/PmzePSpUv4+fnRv39/6tevz7Vr19i5cydLly4l
NTWVoKAgpk6dWqCrCSKFxeFw3LgSdT2Jzz62E4PZDoaM6xf1DEbAiAEDDoPh+nODEceNfQZufp57
m+sXB41kXTAC12dwsFqtdxyJnzx5MmfOnOHTTz/NtezmxIkTvPLKKyxevPih3F+Ss+BKYXz5mDx5
MgEBAfzlL3+5bV/Lli355JNPaNy48QPpq7DOw263s3r1ajZt2uScRvf3v//9bZMOnDp1ivnz5/Pz
zz+zd+/eBxqDiEhJV6RJfHBwMJGRkSxatKjA77mbD+CCTAUZFhbm8rpcuXJMmjQp17bu7u631aX7
+fndtuz2gAED8jx+DoPBwEsvvcRLL710277KlSvzzjvv3DF2kYfNJZm23qjGM2ReT9BvSsKdCbnB
4LLP5bkzec+rTS595uPUqVPs2rWLp59++rZ9y5YtewBnX3BLly4lJibmtr8NJU1hncfWrVv54Ycf
GDNmDJUrV2bfvn289957lC9fnk6dOsGNxZj+8pe/8MorrzBy5MgH2r+IyKOgSJP4Z555BoBDhw7d
cSVWb29vQkJC6Nix40OKTkTyZTXiMIDB4ABDxm9JeW6j6zdG3TEYMdhvGZ13JvUGl/ffLX9/f5Yt
W3ZbEn/27Fl+/PFHzYNcjHTp0sV5o53D4eCFF17gwIED7Nq1y5nEr127lieffJIXX3yRpKSkIo5Y
RKT4KdIk3mQy0bVr1zzvmhaR4sthNWIwgAMHBoMdDOnXy2RyTdB/G3UHg2v5zW0lN4Yb7e5Oz549
Wb9+PQcPHnSZ/SE8PJz+/fuzdu1al/Z2u53w8HA2bNhAYmKi80byKlWqADBkyBA6duxIREQEZ86c
ISgoiAkTJhAcHAzAd999x8KFCzlz5gwBAQF07tyZP/3pTyxfvtx5M/62bdvo27cvEydOJDs7m/nz
57N161YyMzPp0KED48aNw8vLy9nfgAED+Ne//sV//vMfZs+eTatWre7r36hbt278z//8j3PBop9/
/pnhw4fz3Xff3fEcC/M8jEbjbVdY/P39XW7ej4iIYMKECfd1/iIij7JiMzuNiJQwVqPzx2E1gtUB
9gwM9nSwp994ngE3flyf/9Ymz5+75OnpycCBA11KZy5dusS///3vXMvWFi9ezLZt25g1axYrVqzA
3d2d0NBQl0VW9uzZw1tvvcVXX31F48aNnUlscnIy48ePp3fv3mzcuJH333/fOYI8ZMgQhg0bRpcu
Xdi3bx8TJ04EYPbs2URHR7N8+XJWrlxJbGwsH374oUtMc+bMoXv37ixdujTfpdCzs7NJT0+/7ede
5HWOD+M8bnbkyBEaNmwIQGZmJlevXnV+oRIRkdspiReRe+NM3nMSeRPYbDcl4tcT9SpzduDTczhG
d1MuSf31Nrkm+/fgpZde4siRI5w8eRKAFStW0Lt379tuiM/KymLFihVMnjyZOnXqULVqVaZPn05q
aqpzxU5uLOjToEED/P39GTp0KFeuXCEmJobLly9jtVpp27Yt3t7e1K5dm0aNGuUZV2pqKuvWrWPk
yJH4+/sTGBhIaGgoERERLu1CQ0Pp1asXdevWzfdm0s8++4ynn376tp97kdc5PozzyBEZGUl0dDS9
e/cGICEhAYAyZcrc0zmJiJQGxWaKSREpWRxW0/VyGsNvVTIOgwODIRuDIeO3Ehk3D8p2egWvVj1J
2bqKa3u24rDnVRNvuOeaeG7cmP7SSy/xySefMHHiRP71r3+xZs2a29rFxsZitVpdVi+0WCw0adKE
qKioXI9dpUoVLBYLaWlpNGrUiJYtW9KvXz/atm3L888/7yxZyU10dDR2u50JEya4rNKcs8BcjtyW
S8/NwIED85yd5n7cfI65edDnAXD58mX+9re/MW7cOMqWLYvD4XB+6UpOTsbHx+e+zklE5FGlJF5E
7o3VeCNpz6mLBwyO6yXvhozbZpkxlvHB5/k/4tnwCS5/9E4+NfHGe6qJz/Hyyy/z/PPPYzab6dSp
ExUqVLitTc7UiTabDaPxtxjd3d3znco1J3E1Go3Mnz+fAwcOsGHDBt58801atmyZ5wqeOTfVhoeH
4+/vf8/n9jDktzLugz6PrKwsJk6cSKtWrejVqxd2ux1ujMB7eXlx7tw5goKC7rsfEZFHkcppROTe
3FRKc3NpjbPEJqdM5ua3XInl2s7Pb6qJv70u/n7Kabhxg2Tv3r3ZtGkTQ4YMybVNTmJ48OBB5za7
3c6xY8eoU6dOgftq0aIF06ZN4+OPP2bHjh1cunTpt3O9aXXnypUr4+Xl5VKq8zBYLBZ+/fXX+zpG
YZ2HzWbjrbfewmKxMHny5Nv2t23blu3bt993PyIijyol8SJyT25L2m9N5G2G60k64MhMI+XruVx+
pw8ZP22/5UbX9BtJ/f3d2HqzkSNHsnDhQqpVq5brfi8vL/r06cO7777LsWPHSEhIYM6cOfj7+9O6
des7Hj85OZn169dz6dIlMjIyOHDgABaLBV9fXwAqVqzIwYMHuXDhAunp6ZjNZl599VXmzZvH/v37
sdvtXLx4kWPHjt2xrwkTJrB8+fJ7+C1As2bN+Oqrr7hw4QJxcXF8+eWXd/X+B3keEydOdJ6H3W7n
r3/9K7GxsUyfPh2bzea8OTdn1pr+/fuzZ88e1q5dy5UrV+7p/EVEHmUqpxGRe5NvOY3jRq28jZQv
p5G2+1Ns11LA5IXBWCafaSjvryY+h4+Pzx0XhnvzzTeZO3cu48ePx2q10qpVKz788MN8y0lypKSk
sH37dubNm8e1a9eoUaMG7733nrMUp0ePHuzevZv+/fvTokUL/v73vzNs2DA8PDyYPXs2cXFx+Pv7
8+qrr+Z7Q6zdbic2NpbAwMB7+C3An//8Z6ZPn06/fv2oUKECvXv3vquVnx/0eeSUNu3cuZOtW7cC
8Nxzz7m0/b//+z8qVKhA3bp1ee+991iyZAnLly9n37599/Q7EBF5VBni4uIcdrsdu92Ow+HAZrNh
s9mwWq1YrVZsNhspKSnUr1+/wCsnikjhSExMpG7dukXSt9Vq5cqVK3iXKwtA/FP1wM2Gwc0ObjYw
2zG42cDtt0fnfpM7DqMXmLzAeP3HYSpz/bnJy2Wf48ZjwJvjAUhOuUb58uUxmzXmUJLd+vmR8/rm
x7w+h5KSku6qzElEis6pU6fw8fHBbDZjNpsxmUyYTCYMBgNGo9E5UHLrY46CDKTIdfpUFJF7cn2x
J8dvq7bCbyPzhltG5sl0GXX/bbEnQ94LQ4mIiEielMSLyL25uZzGcL0Q5vZymhuPOK7PWONM0F1n
pcG5SutvZTYiIiKSNyXxInJvrEbXpB1cR+ZvGpG/XjNvB0P6TdNI5jECn5PMi4iISJ6UxIvIPbm7
cprfbnTFnI4BAw6DIfd54p0lNyIiIpIXfVKKyD1xf/zJW6aUzGfeeNvNz203TSWZ/tt88jfNE2+u
XKWoT09ERKRY00i8iBSYwWDAZrNhMpnwDV9U6P3ZbDbNVCAiIpILJfEiUiAGgwGz2Uz8lSuU9/cv
9Ckfs7OzSUhMxNvbR4m8FIpt27axfv16fvnlF65du0a1atXo27cvffv2LerQ5BH1yy+/cPToUeLj
48nKysLX15cmTZrQpEkT5+rIBfnb+umnn9KkSRMaN278QGOQkkVJvIgUiMFgwMPDA7PZjeizMWRk
ZGC32wulL6PRiKenJ76+vnh4eCiJlwdu+vTpHDhwgNDQUMaOHUt2djbHjx+nbNmyRR2aPKK2bNnC
uXPnePLJJ2nXrh02m41Lly7h4eEBwP79+0lKSqJ79+5FFoOULEriRaRAcpJ4Pz8/vLy8sFqthbYA
XM6ov6enJ+7u7kri5YHavHkzP/zwA6tXr6ZMmTLO7fXq1SvSuOTRdeLECWJiYhg8eLDLqsk5qxiX
lhjkwVISLyIFYjAYMJlMWCwWPD09C30FZ4PB4PIj8qAsWrSI119/3SWBv5Xdbic8PJwNGzaQmJhI
s2bNmDBhAlWqXL/pesiQITz33HNs2bKFU6dOUbNmTSZOnEijRo146623sFgs/PWvf3UeLzw8nCNH
jvD+++8/lHOU4mXv3r08+eSTLsnzzX744Qf2798PN8pdGjduTKdOnfj0008JDg7m2LFjXLx4kZ49
e1KtWrU8+zlz5gx79+5l4MCBdx2DlDxK4kWkwJRQS0mXkZFBTEzMHet/Fy9ezK5du5g1axYWi4UP
PviA0NBQvvjiC9zc3ABYv349kyZNolKlSvzzn/9k1KhRbNiwgS5duvDuu+9it9sxGq9PArdjxw5e
eumlh3KOUrxYrVYSExOpXLlynm1atmxJVlZWruU0ERERtG/fnvbt2+Pr65tvXw6HI9cBloLEICWP
ppgUEZFS49y5czgcDvz8/PJsk5WVxYoVK5g8eTJ16tShatWqTJ8+ndTUVCIjI53t+vfvT9OmTQkM
DGTcuHH4+fmxZcsW2rRpQ3p6OkePHgUgISGBEydO0K5du4dyjlK8XL16FQCLxXJP73/yySdp1KgR
AQEBud70arfbycjIICMjg6ysrNteP4gYpHjSSLyIiJQaAQEBcCOZb9SoUa5tYmNjsVqtNGjQwLnN
YrHQpEkToqKicn2P0WikadOmREdH4+HhwdNPP83OnTtp0qQJu3btolWrVvmW78ijK+ffPSkpCU9P
z7t+/51mq4mPj2fVqlUu2xYuXAhAzZo16dOnz33HIMWTkngRESk1fH198ff3Z8+ePXkm8TmjmTab
zVkOA+Du7p5vPbHJZHImSF26dGHhwoWMGjWKiIgIOnfuXAhnIyWBxWLBy8uLqKgoKlas+MCPHxgY
yNixYwE4ffo0e/fu5ZVXXnmoMUjRUDmNiIiUKoMGDSI8PJzY2Nhc9wcFBQFw8OBB5za73c6xY8eo
U6eOc1tqaqrL+44ePUrt2rUBaNOmDRcuXODMmTMcPHhQpTSlXEhICAcOHCApKSnfdjabrchjkJJD
SbyIiJQqAwcOpGHDhgwaNIi1a9dy+vRpzp49y6ZNm4iMjMTLy4s+ffrw7rvvcuzYMRISEpgzZw7+
/v60bt3aeZzFixcTGRlJYmIiixcvJi0tjU6dOsGNUft27doxZ84cmjdvrvnnS7mQkBACAwNZtWoV
hw8f5sqVKyQmJnL8+HHOnDkDQLly5YiNjSU5OZns7Ox8j+fp6UlycvJt200mU55zvhckBilZTOPH
j592893MOc/tdjt2ux2Hw0FWVpazjrCkmDRpEvv27ct19GPmzJkcP36cFi1aMHz4cNLT0/Nc9Swr
K4tu3brRuXNnypUr9xAiF8lbRkYG5cuXL+owRApFXp9DmZmZ+Pv7P7B+jEYjPXr0wNPTk23btrFs
2TK++uorLly4QO3atalbty6tW7fm/PnzLFq0iLVr11KhQgVmzpzpLJf58ssvqV+/Pt988w0ff/wx
BoOB9957z2X2EJPJxLJlyxg+fDh169Z9YPFLyWMwGGjYsCFms5lffvmF/fv3c+zYMZKTkwkICCAg
IIDy5ctz8eJFdu7cycWLF2nQoAH/+c9/qFixIoGBgS7H8/Ly4vvvv+fcuXPUr1/fud3X1zfPMrGC
xPAgJCQk4OnpidFodPm5dcrgWx9vjlMKptjUxNtsNr799lsOHTpESkpKrm28vb0JDg7mmWeewWQy
5Xu8Dh3noHobAAAgAElEQVQ6MH/+fLKzs53TgXEjKd+3bx9z5syBG5c8b748KiIijz6j0cjLL7/M
yy+/nOt+d3d3xo8fz/jx4/M8Rps2bZg1a1ae+2vWrInZbFYpjcCN5LR58+Y0b9481/1ms5levXq5
bMvrv8/q1aszbNiwBx6DlCxFVk4zY8YMoqOjna+3bdvGzp0780zgAZKTk4mMjGT79u13PH6bNm3I
ysri8OHDLtt//PFHfHx8nN9chw0bRsuWLe/rXERERG4VERHBE088oVIaESkURTYSnzMP79ChQ6la
tSqHDh0C4PXXX3feVHSrmJgYFi1axMGDB+nSpUu+xy9XrhwhISHs3r3bJUnftWsX7du3d74ePXo0
PXv2dC6uYLPZ+OSTT9i+fTtpaWm0atXK5bjZ2dksW7aMiIgIsrKyaNOmDaGhoc65V+12O2vWrGHz
5s1cvXqVxx57jDFjxlCpUiUAvv/+ez755BOioqIoX7487dq1Y8SIEff8exQRkeJpy5YtvPjii0Ud
hog8oor0xtb09HQ++eQTzp8/77xBI68E/uZ9ud3MkZuOHTvy3XffOess7XY7e/bscUnib7V06VK+
//57ZsyYwYIFC26bTzUsLIyYmBjCwsJYuHAhFy5cYMmSJc79y5cvJzIykqlTp7JgwQLnJdns7GxS
UlKYOnUqzz77LKtXr2bGjBk8/fTTBToXEREpOWJiYjh58mS+nzciIvejyGenSU9PJzw8vFCO/dRT
T5GSksKJEycA+Omnn/Dy8qJevXq5ts/KymLdunWMGzeO2rVrU6lSJUaNGuXcn5aWxsaNGxk8eDB+
fn4EBAQwdOhQdu/e7Xz/Z599xtixY6lZsyaVK1dm4sSJpKWlsWfPHq5cuYLVaqVVq1aUK1eOGjVq
uNyQIiIiJcPy5cvp06dPnvuDgoLYv3//A70hV0TkZsXixtZb59p9UMqUKUOLFi3YvXs3DRo0YOfO
nXTo0CHP9hcuXMBut+c5i0BMTAx2u53p06c77562Wq2kpaUBEBcXh81mc3m/p6cnDRs2JCYmhrZt
2xIcHMzw4cNp3bo13bt3JyQk5IGft4iIiIg82opFEu/j41Noiw906NCBlStXMnz4cHbv3s3MmTPz
bJudne2c0uzmVfpy5NycNG/ePPz8/G7bn98qf25ubhiNRmbNmsXhw4fZvHkz06ZNIzg4mBkzZjyw
8xURERGRR1+Rl9OULVuWP/zhD4V2/Keeeoq4uDi2bduGu7u7czW93FStWhVulN3kpmLFilgsFvbs
2VPg99vtdk6cOEHNmjWd25o1a8aECROYO3cu3333HfHx8fd8fiIiIiJS+hRpEl+mTBmGDRtGQEAA
3t7ecKNkJS9nz56FG/PFF5TFYuGJJ55gwYIFd7zByGKx0LVrVz744AOOHz9OYmIiK1ascO43m80M
GDCApUuX8uOPP2K327l8+bKz5t5isdC9e3fmzp3LiRMnSExMJCwsDD8/P1q2bElKSgqbNm0iPj6e
zMxMDh8+jKen512dj4iIiIhIkZXTWCwWhgwZ4lyFLDg4mMjISBYtWnTH995tHXn79u3ZtWtXvvXw
OcaMGcOCBQuYMmUKZrOZrl27OkfYubFct7u7O/PmzePSpUv4+fnRv39/5w2qo0ePZsmSJUydOhWb
zUZISAh/+9vfMBgMXLt2jZ07d7J06VJSU1MJCgpi6tSpuLu739X5iIiIiEjpZoiLi3Pk1IE7HA5s
Nhs2mw2r1YrVasVms5GSkkL9+vWdUzUWBpvNxrZt2zh06FCeU0h6e3sTEhJCx44d77hiq8ijKDEx
Ucu3S4l06+dHzuubH/P6HEpKStLK2iIlxKlTp/Dx8cFsNmM2mzGZTJhMJgwGA0aj0TkxyK2POW59
LXkrFje2AphMJrp27UrXrl2LOhQRESmB0tPTyczMxGq1FnUoIo8Us9mMh4eHc2FLKR6KTRIvIiJy
L3KuGCt5FykcOVfFMjMzKVeunKohiokin51GRETkfiiBF3k4rFYrKSkpRR2G3KAkXkRESqz09HQl
8CIPkdVqJT09vajDECXxIiJSkmVmZhZ1CCKljv6/Kx6UxIuISImlUXiRh0//3xUPSuJFREREREoY
JfEiIiIiIiWMkngRERERkRJGSbyIiIiISAmjJF5EREqVd955h5EjR+JwOHLdf+rUKTp37syRI0ce
emxZWVma+UNECkRJvIiIlDq//vor+/bty3Xfp59++tDjybFy5UrmzJlTZP2LSMmhJF5EREodPz8/
Vq1addv2c+fOceTIEcqWLVskcYmIFJSSeBERKXW6du1KbGwsP/30k8v2NWvW8Pzzz+Pu7u6y3W63
8+mnnzJ06FCef/553n77beLi4uBGec6to+erV69m2rRpAGRnZ7N48WIGDhzI73//e/7+97/nuuLl
mjVrWLVqFREREXTr1o25c+fesW8RKb2UxIuISKnj4eHBiy++6DIaHx8fz65du+jdu/dt7ZcvX05k
ZCRTp05lwYIFuLu7M378eLKzs+nYsSN79+7Fbrc72+/evZsOHToAEBYWRkxMDGFhYSxcuJALFy6w
ZMmS2/ro378/AwcOpEOHDmzevJk33njjjn2LSOmlJF5EREql3r17c+zYMU6fPg3AZ599xrPPPku5
cuVc2mVlZfHZZ58xduxYatasSeXKlZk4cSJpaWns2bOHxx9/HKvVyvHjxwFISEggKiqKJ598krS0
NDZu3MjgwYPx8/MjICCAoUOHsnv37gLFeKe+RaT0Mhd1ACIiIkWhbNmy9O7dm9WrVzNmzBi2bNnC
Rx99dFu7uLg4bDYbdevWdW7z9PSkYcOGxMTE0K5dO9q2bct3331Ho0aN2LNnD61bt8bDw4MTJ05g
t9uZPn06BoMBbixZn5aWVqAY79S3iJReSuJFRKTU6tu3L0OGDMFkMvH0009Tvnz529pkZWVht9ux
2WwYjb9dwHZ3d8fNzQ2ATp06MW/ePEaMGMHu3bvp1asX3PiiADBv3jz8/PzuOr6C9C0ipZPKaURE
pNTy8/Pj2WefZfv27fTr1y/XNlWrVgVwuQnWbrdz4sQJatasCUBwcDDXrl3j1KlT/PLLL7Ro0QKA
ihUrYrFY7qr0xWq13lXfIlI6KYkXEZFSbfDgwcyZM4ff/e53ue63WCx0796duXPncuLECRITEwkL
C8PPz4+WLVsCYDQaadeuHXPnzqVVq1bO2W3MZjMDBgxg6dKl/Pjjj9jtdi5fvsyJEydy7atChQr8
9NNPXLx4kYyMjAL1fezYMd544w3OnTvnPM6ePXsYO3YsycnJzm0bN25kwoQJLl8SRKTkUjmNiIiU
at7e3jRt2jTfNqNHj2bJkiVMnToVm81GSEgIf/vb35x17gDPPPMM69atY/DgwS7vHThwIO7u7syb
N49Lly7h5+dH//79qV+//m39dO3alf379zNixAiaNWvGzJkz79j3tWvXiIuLc6mzT0pKIi4ujqys
LOe2q1evOmvszWZ9/IuUdIa4uDiH3W7HbrfjcDiw2WzYbDasVitWqxWbzUZKSgr169fPc4lqEXk4
EhMTXW5wEykpbv38yHl982Nen0NJSUnUqVMn1+PGx8c/hOhF5FYBAQG5bj916hQ+Pj6YzWbMZjMm
kwmTyYTBYMBoNDq/fN76mOPW15I3ldOIiIiIiJQwSuJFREREREqYYlMUl5iYyLp164iOjnbedGM2
m6lRowYvvPACPj4+RR2iiIiIiEixUGxG4r/88ktOnz7tcte81Wrl1KlTfPXVV0Uam4iIiIhIcVJs
RuLPnj0LwNtvv43FYoEbd9y/++67REVF3fXxXn31VWJjY/Pcv2zZMoKCgu4j4tyNHj2anj170r17
9wd+bBERERERijKJX7JkCdHR0bdtf+edd27blpWVxZQpU5yva9SowYgRI/I9/sKFC7Hb7QB88cUX
/Pjjjy7HzvmiICIiJZfZbNa85yIPmaYoLR6K7F+hsKcQujlJd3d3x2QyUaZMmULtU0REHi4PDw8l
8SIPmYeHR1GHIEWZxOeMpOeMsM+cOTPf9gVtdzdGjx7NCy+8wJYtW/j555+ZNm0aTZs25aOPPmLv
3r1cvnyZwMBABg0aROfOnZ3v+/777/nkk0+IioqifPnytGvXzuXKwKFDh/j666+JioqiatWqjBkz
hsaNGz+wuEVE5DqLxUJmZqYSeZGHxGw2q5qhmCh210OOHDniXDnv5ueFJSwsjNDQUEJDQ6latSpu
bm5UrVqV6dOn4+HhQUREBLNmzaJ+/foEBQWRkpLC1KlT+eMf/0iHDh24cuUKmZmZLse8cOECY8aM
ITAwkPDwcGbMmMHKlStxc3Mr1HMRESmNypUrR0pKihJ5kUJmNpspV65cUYchNxSb2WlyrF27Ntfn
hWXo0KF069aNWrVqOS8P9e7dmxo1alC5cmVefvllKlWqxIkTJwC4cuUKVquVVq1aUa5cOWrUqHHb
0tndu3enfv36+Pn5MWDAABISEjh//nyhn4uISGlkMpnw9fWlTJkyqtUVKQRms5kyZcrg6+uLyWQq
6nDkhlL/187d3f22bVevXuXf//43R48eJSkpicTERDIyMgCoVq0awcHBDB8+nNatW9O9e3dCQkLy
PH6lSpXw9PQkLS2tUM9DRKS0s1gsuswvIqVGsRuJL2rp6emMGTOG+Ph4Bg8ezIwZM6hVq5Zzv9Fo
ZNasWcycORM3NzemTZvGX//613yPWdg38YqIiIhI6VLqR+JvdfLkSZKTkxk5cqRzW25JeLNmzWjW
rBn9+vVjxIgRxMfHExAQ8JCjFREREZHSSCPxt/D39yc1NZUNGzZw9epVtm/fzunTp537U1JS2LRp
E/Hx8WRmZnL48GE8PT3x9vYu0rhFREREpPQodiPx/fr1y/X5wxIUFMTIkSMJDw/n448/JiQkhJYt
Wzr3X7t2jZ07d7J06VJSU1MJCgpi6tSpudbWi4iIiIgUBkNcXJzDbrdjt9txOBzYbDZsNhtWqxWr
1YrNZiMlJYX69evjcDgeeADvvfceKSkpjBw5kurVq+faJjo6miVLluDt7c2ECRMeeAwiJUViYiJ1
69Yt6jBE7tqtnx85r29+zOtzKCkpiTp16hRJ3CJyd06dOoWPjw9msxmz2YzJZMJkMmEwGDAajc4S
5Vsfc+g+woIr8pH44OBgdu7cyZIlSwrUVkRERESktCvyJP6ZZ54B4PDhwyQnJ+faxtvbm+DgYGdb
EREREZHSrMiTeLPZTLdu3ejWrVtRhyIiIiIiUiJodhoRERERkRKmyEfiRUREisK2bdtYv349v/zy
C9euXaNatWr07duXvn37PrQYsrKysNvteHp6PrQ+ReTRoCReRERKnenTp3PgwAFCQ0MZO3Ys2dnZ
HD9+nLJlyz7UOJYuXUpMTAz/+7//+1D7FZGST0m8iIiUKps3b+aHH35g9erVlClTxrm9Xr16RRqX
iMjdUE28iIiUKosWLeL11193SeBvZbfbWbZsGX379qVjx46MHTuW8+fPO/cPGTKE1atXM2zYMNq1
a8err77KsWPHAHjrrbeYMWOGy/HCw8P5r//6L5dty5cv5+OPP2br1q20atWK9957r0B9i4igJF5E
REqTjIwMYmJiaNKkSb7tFi9ezLZt25g1axYrVqzA3d2d0NBQsrOznW3Wr1/P2LFj+fzzz2natCmj
Ro0iJSWFLl26sGvXLux2u7Ptjh076Ny5s0sfQ4YMYdiwYXTp0oV9+/YxceLEAvctIqIkXkRESo1z
587hcDjw8/PLs01WVhYrVqxg8uTJ1KlTh6pVqzJ9+nRSU1OJjIx0tuvfvz9NmzYlMDCQcePG4efn
x5YtW2jTpg3p6ekcPXoUgISEBE6cOEG7du3uGF9B+xYRURIvIiKlRkBAANxI5vMSGxuL1WqlQYMG
zm0Wi4UmTZoQFRWV63uMRiNNmzYlOjoaDw8Pnn76aXbu3AnArl27aNWqVb7lO/fTt4iUTkriRUSk
1PD19cXf3589e/bk2SZn2kebzeay3d3dHXd39zzfZzKZnFNFdunShR07dgAQERFxWynNg+5bREof
JfEiIlKqDBo0iPDwcGJjY3PdHxQUBMDBgwed2+x2O8eOHaNOnTrObampqS7vO3r0KLVr1wagTZs2
XLhwgTNnznDw4MF8S2msVutd9y0ioiReRERKlYEDB9KwYUMGDRrE2rVrOX36NGfPnmXTpk1ERkbi
5eVFnz59ePfddzl27BgJCQnMmTMHf39/Wrdu7TzO4sWLiYyMJDExkcWLF5OWlkanTp3gxsh5u3bt
mDNnDs2bN89z/vmKFSty8OBBLly4QHp6eoH6PnLkCMOGDePs2bPO40RGRjJixAiSkpKc29atW8eo
UaNcviSIyKNDSbyIiJQqZrOZBQsW8Nprr7F161aGDx/O0KFD+fzzz7l27RoAb775Jk899RTjx49n
wIABpKSk8OGHH2IwGJzHeeKJJ/jggw94/vnn+emnn1i0aBFubm7O/V26dGH//v35ltL06NGDpk2b
0r9/fyZPnlygvlNSUoiNjXW5EnD16lXOnz9PZmamc1tCQgLnz59XEi/yiDLExcU57HY7drsdh8OB
zWbDZrNhtVqxWq3YbDZSUlKoX78+DoejqOMVKdUSExOpW7duUYchctdu/fzIeX3zY16fQ0lJScWu
lGTIkCG8+OKL9OnTJ882Z8+epV+/fnz77bcPfSVYkaJy6tQpfHx8MJvNmM1mTCYTJpMJg8GA0Wh0
fhm99THHra8lbxqJFxERKQQRERE88cQTSuBFpFAoiRcRESkEW7ZsoWPHjkUdhog8opTEi4iIPGAx
MTGcPHmS9u3bF3UoIvKIMhd1ACIiIiXN8uXL890fFBTE/v37H1o8IlL63HcSHxMT82AiEREXOfNF
i4iIiNzqvpN4JRoiIiIiIg+XauJFREREREoYJfEiIiIiIiWMkngRERERkRJGSbyIiIiISAmjJF5E
REREpIRREi8iIiIiUsIoiRcRERERKWGUxIuIiIiIlDBK4kVEREREShgl8SIiIiIiJYy5qAMQERG5
V9HR0UUdgkipVL169aIOodRTEi8iIiWWEgkRKa1UTiMiIiIiUsIoiRcRERERKWGUxIuIiIiIlDBK
4kVERERESpgiu7HVZrPx7bffcujQIVJSUlz2Va1alSFDhlCmTJmiCk9EREREpNgqsiR+27Zt7Ny5
M9d9sbGxfPzxxwwbNuyBJPI7duxg06ZN/Prrr1y7do3AwEAef/xxhg4disViuefjjh49mp49e9K9
e/f7jlFEREREpKCKLIk/dOgQAK+//jpBQUHO7ampqXz88cdcvHiRv/3tby7v8fb2Jjg4mGeeeQaT
yXTHPhwOB++88w6nT59myJAh1KlTBzc3N86fP89PP/2Eh4dHIZyZiIiIiEjhKrIkPjk5GYBFixbd
1XsiIyMxGAx06dLlju3/9a9/cebMGRYtWoS7u7tze6VKlQgJCbnHyEVEREREilaRL/Y0c+bMArc9
e/Ysixcv5uDBgwVK4leuXMmoUaNcEvhbZWdn89FHH7F3714uX75MYGAggwYNonPnzs42o0eP5oUX
XmDLli38/PPPTJs2jRYtWgCwb98+PvvsMy5fvkzDhg154403+N3vfleg49psNpYtW8b27dvJyMjg
6aef5vDhw/zv//4vVapUITs7m2XLlhEREUFWVhZt2rQhNDT0vkqARERERKTkK1Gz01SrVg1uGsXP
T0pKCvHx8dSrVy/fdm5ublStWpXp06ezdOlSunXrxqxZs4iJiXFpFxYWxjPPPMMHH3xA48aNndvj
4+P57//+b5YsWYKvry9/+ctfyMzMLNBxP/roI3744Qf+53/+h/nz52MwGDh37pxLnzExMYSFhbFw
4UIuXLjAkiVL7up3JiIiIiKPnhKVxN+N+Ph4ADw9PZ3bli9fTufOnZ0//+///T8AevfuTY0aNahc
uTIvv/wylSpV4sSJEy7HGzp0KN26daNWrVoutfQ9evSgZs2aVKpUifHjx2MwGNixY8cdj5uVlcVX
X33FuHHjqF27NpUqVWLUqFHO46alpbFx40YGDx6Mn58fAQEBDB06lN27dxfyb05EREREirsiL6cp
LJUqVQLg/Pnz+Pr6AjBgwABefPFFAD788ENn26tXr/Lvf/+bo0ePkpSURGJiIhkZGS7Hy68k5+Y2
TZo04ezZs3c87oULF7Db7dStWzfXY8XExGC325k+fToGgwEAq9VKWlraPf5GRERERORR8cgm8RaL
hUqVKrFnzx4aNWoEN5LsnGQ85zE9PZ0xY8bQrl07Bg8eTGBgIJMmTbrnfs1mM25ubnc8rtVqxW63
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
epXz58+71NonJCRw/vx5rFYrZrPSgNLizJkzztVclyxZ4rJv2LBheHt7F1Fkcq+KbMVWEbl7WrFV
SqritGKriBQerdj68KicRkRERESkhFESLyIiIiJSwiiJFxEREREpYZTEi4iIiIiUMEriRURERERK
GHJDX4oAACAASURBVCXxIiIiIiIljJJ4EREREZESRkm8iIiIiEgJoyReRERERKSEURIvIiIiIlLC
mO/3ADExMQ8mEhFxERQUVNQhiIiISDF130m8Eg0RERERkYdL5TQiIiIiIiWMkngRERERkRJGSbyI
iIiISAmjJF5EREREpIRREi8iIiIiUsIoiRcRERERKWGUxIuIiIiIlDBK4kVERERESpj7XuxJRESk
JNq2bRvr16/nl19+4dq1a1SrVo2+ffvSt2/fog5NROSOlMSLiEipM336dA4cOEBoaChjx44lOzub
48ePU7Zs2aIOTUSkQJTEi4hIqbJ582Z++OEHVq9eTZkyZZzb69WrV6RxiYjcDSXxIiJSqixatIjX
X3/dJYG/ld1uJzw8nA0bNpCYmEizZs2YMGECVapUAWDIkCG0b9+eHTt2EBUVRa1atZg0aRI//vgj
69atIy4ujscff5wpU6bg5+fnfM9zzz3Hli1bOHXqFDVr1mTixIk0atTIuX/AgAH861//4j//+Q+z
Z8+mVatWZGdnM3/+fLZu3UpmZiYdOnRg3LhxeHl5AfDdd9+xcOFCzpw5Q0BAAJ07d+ZPf/rTHfeJ
SMmmG1tFRKTUyMjIICYmhiZNmuTbbvHixWzbto1Zs2axYsUK3N3dCQ0NJTs729lm//79TJkyhXXr
1lG1alUGDx5MXFwc//jHP1ixYgXnzp0jLCzM5bjr169n7NixfP755zRt2pRRo0aRkpLi3D9nzhy6
d+/O0qVLadasGQCzZ88mOjqa5cuXs3LlSmJjY/nwww8BSE5OZvz48fTu3ZuNGzfy/vvv06lTpzvu
E5GST0m8iIiUGufOncPhcDhHx3OTlZXFihUrmDx5MnXq1KFq1apMnz6d1NRUIiMjne2ee+456tWr
h7+/P4MHD8bhcDB48GCqVKlCtWrV6N27N4cOHXI5dv/+/WnatCmBgYGMGzcOPz8/tmzZ4twfGhpK
r169qFu3Lp6enqSmprJu3TpGjhyJv78/gYGBhIaGEhERAcDly5exWq20bdsWb29vateu7RzZz2+f
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
RU5ErkJggg==
--kenitram-5a4c420e-58bc-48ba-8598-037fd301ba46--

