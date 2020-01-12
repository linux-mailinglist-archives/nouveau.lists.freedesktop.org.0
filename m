Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA219138CBD
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2020 09:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449BA89F53;
	Mon, 13 Jan 2020 08:19:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Sun, 12 Jan 2020 23:21:08 UTC
Received: from black.elm.relay.mailchannels.net
 (black.elm.relay.mailchannels.net [23.83.212.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553D89E3F
 for <nouveau@lists.freedesktop.org>; Sun, 12 Jan 2020 23:21:08 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|joshua@azariah.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 5ABE86A162D
 for <nouveau@lists.freedesktop.org>; Sun, 12 Jan 2020 23:02:11 +0000 (UTC)
Received: from pdx1-sub0-mail-a85.g.dreamhost.com
 (100-96-87-46.trex.outbound.svc.cluster.local [100.96.87.46])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id B36E46A138F
 for <nouveau@lists.freedesktop.org>; Sun, 12 Jan 2020 23:02:10 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|joshua@azariah.com
Received: from pdx1-sub0-mail-a85.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.5); Sun, 12 Jan 2020 23:02:11 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|joshua@azariah.com
X-MailChannels-Auth-Id: dreamhost
X-Whimsical-Cold: 778269dd67cacbd1_1578870131194_701556770
X-MC-Loop-Signature: 1578870131194:1287556400
X-MC-Ingress-Time: 1578870131194
Received: from pdx1-sub0-mail-a85.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a85.g.dreamhost.com (Postfix) with ESMTP id 6047580B65
 for <nouveau@lists.freedesktop.org>; Sun, 12 Jan 2020 15:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=azariah.com; h=from:to
 :subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=azariah.com; bh=lRYwtGJOLYASTgeXYv
 XY9c9etyI=; b=Bu0OqdRm+JbM9b2I4PMd3o3tNl7YW/rsRMRKXAr+w3Bpb2NWUB
 lmxy2cUwIItmpY+92NaXZgocpD9iBMhq0UT0z6sAdplBWqKIsTNqKSxbxSE58Fqn
 W14WAdhBLqYGPQypZnkcaBtqIKlTow5HORjSeGjhTnKiPl+4dpjwO8UtA=
Received: from hosanna.localnet (216-67-98-32.static.acsalaska.net
 [216.67.98.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: joshua@azariah.com)
 by pdx1-sub0-mail-a85.g.dreamhost.com (Postfix) with ESMTPSA id 5E12980B72
 for <nouveau@lists.freedesktop.org>; Sun, 12 Jan 2020 15:02:01 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a85
From: "Joshua J. Kugler" <joshua@azariah.com>
To: nouveau@lists.freedesktop.org
Date: Sun, 12 Jan 2020 14:02:00 -0900
Message-ID: <18822946.zTA3u1jjGg@hosanna>
Organization: Azariah Enterprises
X-Face: "i;
 .9?eoq[n1J]7NP093Nf-le\(f:apL[8Qcc^@FG*Lx!`q`1/iCg7oGU/gv&"yx=8K|o: 8e=hQB,0w,`~p}'#>'NF8L3xcI>;
 ?O-ABM#&^UN@Vh{4ktY],7O]OhEyW8tjIdHtN<G<q`
 Ha]]!@7D)vzKnV!!*{Y>`(&+f>TErbn'9J)'=2RU+3I_OdR)P_I/Bl+l@5)o5,KV}BKhi;
 DzH7ih^d}V6{2aa8qe&)\B}h; \Tje;
 [6E4K1Gu-M`>WM7-}cZ'&n(`nk.!coGBc<WTQO.# ?~JA)i#GH)W(jZRI<p]Il-NRMeEX+X/MTW8?T
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart23245552.m5J86HpEY5"
Content-Transfer-Encoding: 7Bit
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 0
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkohggtgfgsehmuferredttddvnecuhfhrohhmpedflfhoshhhuhgrucflrdcumfhughhlvghrfdcuoehjohhshhhurgesrgiirghrihgrhhdrtghomheqnecuffhomhgrihhnpehmihhtrdgvughunecukfhppedvudeirdeijedrleekrdefvdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghlohephhhoshgrnhhnrgdrlhhotggrlhhnvghtpdhinhgvthepvdduiedrieejrdelkedrfedvpdhrvghtuhhrnhdqphgrthhhpedflfhoshhhuhgrucflrdcumfhughhlvghrfdcuoehjohhshhhurgesrgiirghrihgrhhdrtghomheqpdhmrghilhhfrhhomhepjhhoshhhuhgrsegriigrrhhirghhrdgtohhmpdhnrhgtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Mailman-Approved-At: Mon, 13 Jan 2020 08:19:47 +0000
Subject: [Nouveau] Display broken after resume from suspend
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

This is a multi-part message in MIME format.

--nextPart23245552.m5J86HpEY5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Howdy! I've been doing a lot of troubleshooting, and haven't arrived at a 
solution yet.

Kernel log attached. VBIOS also attached.
Ubuntu 19.10

$ uname -a
Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46 UTC 2019 
x86_64 x86_64 x86_64 GNU/Linux
$ dpkg -l|grep nouveau
ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1                        
amd64        Userspace interface to nouveau-specific kernel DRM services -- 
runtime
ii  xserver-xorg-video-nouveau                 1:1.0.16-1                             
amd64        X.Org X server -- Nouveau display driver
$ lspci |grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (rev 
a2)

This is a Dell Latitude E6510, so not exactly bleeding edge. :)

The system boots just fine, and I can use the laptop without issue. Goes to 
sleep just fine. When I resume from sleep, the display is black, and will not 
come to life (the back light is on, though).  I can ssh in, and run all kinds 
of commands; restart the display manager does *not* bring it back to life.

Any tips would be greatly appreciated.

j

-- 
Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
Azariah Enterprises - Programming and Website Design
PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a
--nextPart23245552.m5J86HpEY5
Content-Disposition: attachment; filename="kernel-2020-01-12.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="kernel-2020-01-12.txt"

[    0.000000] microcode: microcode updated early to revision 0x11, date =
=3D 2018-05-08
[    0.000000] Linux version 5.3.0-26-generic (buildd@lgw01-amd64-013) (gcc=
 version 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2)) #28-Ubuntu SMP Wed Dec 18 =
05:37:46 UTC 2019 (Ubuntu 5.3.0-26.28-generic 5.3.13)
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-5.3.0-26-generic root=3D=
/dev/mapper/vgubuntu-root ro quiet splash vt.handoff=3D7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai =20
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000963ff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000096400-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cf65efff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cf65f000-0x00000000cf67efff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000cf67f000-0x00000000cf76efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000cf76f000-0x00000000cfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed13fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed18000-0x00000000fed19fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff800000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000022fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.6 present.
[    0.000000] DMI: Dell Inc. Latitude E6510/0N5KHN, BIOS A04 07/08/2010
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2527.034 MHz processor
[    0.002919] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.002920] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.002926] last_pfn =3D 0x230000 max_arch_pfn =3D 0x400000000
[    0.002931] MTRR default type: uncachable
[    0.002932] MTRR fixed ranges enabled:
[    0.002933]   00000-9FFFF write-back
[    0.002934]   A0000-BFFFF uncachable
[    0.002935]   C0000-FFFFF write-protect
[    0.002935] MTRR variable ranges enabled:
[    0.002937]   0 base 000000000 mask F80000000 write-back
[    0.002938]   1 base 080000000 mask FC0000000 write-back
[    0.002939]   2 base 0C0000000 mask FF0000000 write-back
[    0.002939]   3 base 100000000 mask F00000000 write-back
[    0.002940]   4 base 200000000 mask FC0000000 write-back
[    0.002941]   5 base 230000000 mask FF0000000 uncachable
[    0.002942]   6 disabled
[    0.002942]   7 disabled
[    0.003537] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.003690] total RAM covered: 8192M
[    0.004410] Found optimal setting for mtrr clean up
[    0.004412]  gran_size: 64K 	chunk_size: 64K 	num_reg: 6  	lose cover RA=
M: 0G
[    0.004861] e820: update [mem 0xd0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.004867] last_pfn =3D 0xcf65f max_arch_pfn =3D 0x400000000
[    0.007191] found SMP MP-table at [mem 0x000f22d0-0x000f22df]
[    0.007279] check: Scanning 1 areas for low memory corruption
[    0.007287] BRK [0x90601000, 0x90601fff] PGTABLE
[    0.007290] BRK [0x90602000, 0x90602fff] PGTABLE
[    0.007291] BRK [0x90603000, 0x90603fff] PGTABLE
[    0.007352] BRK [0x90604000, 0x90604fff] PGTABLE
[    0.007353] BRK [0x90605000, 0x90605fff] PGTABLE
[    0.007740] BRK [0x90606000, 0x90606fff] PGTABLE
[    0.007755] BRK [0x90607000, 0x90607fff] PGTABLE
[    0.007771] BRK [0x90608000, 0x90608fff] PGTABLE
[    0.007786] BRK [0x90609000, 0x90609fff] PGTABLE
[    0.007836] RAMDISK: [mem 0x2e5bd000-0x332d5fff]
[    0.007846] ACPI: Early table checksum verification disabled
[    0.007851] ACPI: RSDP 0x00000000000FE300 000024 (v02 DELL  )
[    0.007855] ACPI: XSDT 0x00000000CF67DE18 00006C (v01 DELL   E2       06=
222004 MSFT 00010013)
[    0.007862] ACPI: FACP 0x00000000CF75FC18 0000F4 (v04 DELL   E2       06=
222004 MSFT 00010013)
[    0.007869] ACPI: DSDT 0x00000000CF73E018 00A5A2 (v01 DELL   E2       00=
001001 INTL 20080729)
[    0.007872] ACPI: FACS 0x00000000CF76BF40 000040
[    0.007875] ACPI: FACS 0x00000000CF76ED40 000040
[    0.007878] ACPI: APIC 0x00000000CF67CF18 00008C (v02 DELL   E2       06=
222004 MSFT 00010013)
[    0.007882] ACPI: TCPA 0x00000000CF76DD18 000032 (v02                 00=
000000      00000000)
[    0.007885] ACPI: MCFG 0x00000000CF76DC98 00003C (v01 A M I  GMCH945. 06=
222004 MSFT 00000097)
[    0.007889] ACPI: HPET 0x00000000CF76DC18 000038 (v01 DELL   E2       00=
000001 ASL  00000061)
[    0.007892] ACPI: BOOT 0x00000000CF76DB98 000028 (v01 DELL   E2       06=
222004 AMI  00010013)
[    0.007895] ACPI: SLIC 0x00000000CF766818 000176 (v03 DELL   E2       06=
222004 MSFT 00010013)
[    0.007899] ACPI: SSDT 0x00000000CF74D018 0009F1 (v01 PmRef  CpuPm    00=
003000 INTL 20080729)
[    0.007902] ACPI: DMAR 0x00000000CF75FF18 000080 (v01 INTEL  CP_DALE  00=
000001 INTL 00000001)
[    0.007914] ACPI: Local APIC address 0xfee00000
[    0.008038] No NUMA configuration found
[    0.008039] Faking a node at [mem 0x0000000000000000-0x000000022fffffff]
[    0.008050] NODE_DATA(0) allocated [mem 0x22ffd1000-0x22fffbfff]
[    0.008353] Zone ranges:
[    0.008353]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.008355]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.008356]   Normal   [mem 0x0000000100000000-0x000000022fffffff]
[    0.008357]   Device   empty
[    0.008357] Movable zone start for each node
[    0.008360] Early memory node ranges
[    0.008361]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.008362]   node   0: [mem 0x0000000000100000-0x00000000cf65efff]
[    0.008363]   node   0: [mem 0x0000000100000000-0x000000022fffffff]
[    0.008396] Zeroed struct page in unavailable ranges: 2572 pages
[    0.008397] Initmem setup node 0 [mem 0x0000000000001000-0x000000022ffff=
fff]
[    0.008399] On node 0 totalpages: 2094580
[    0.008400]   DMA zone: 64 pages used for memmap
[    0.008400]   DMA zone: 21 pages reserved
[    0.008401]   DMA zone: 3989 pages, LIFO batch:0
[    0.008467]   DMA32 zone: 13210 pages used for memmap
[    0.008468]   DMA32 zone: 845407 pages, LIFO batch:63
[    0.022875]   Normal zone: 19456 pages used for memmap
[    0.022877]   Normal zone: 1245184 pages, LIFO batch:63
[    0.042467] ACPI: PM-Timer IO Port: 0x408
[    0.042470] ACPI: Local APIC address 0xfee00000
[    0.042493] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
23
[    0.042496] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.042498] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.042500] ACPI: IRQ0 used by override.
[    0.042501] ACPI: IRQ9 used by override.
[    0.042503] Using ACPI (MADT) for SMP configuration information
[    0.042505] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.042511] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
[    0.042530] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.042532] PM: Registered nosave memory: [mem 0x00096000-0x00096fff]
[    0.042532] PM: Registered nosave memory: [mem 0x00097000-0x0009ffff]
[    0.042533] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.042533] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.042535] PM: Registered nosave memory: [mem 0xcf65f000-0xcf67efff]
[    0.042535] PM: Registered nosave memory: [mem 0xcf67f000-0xcf76efff]
[    0.042536] PM: Registered nosave memory: [mem 0xcf76f000-0xcfffffff]
[    0.042537] PM: Registered nosave memory: [mem 0xd0000000-0xf7ffffff]
[    0.042537] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.042538] PM: Registered nosave memory: [mem 0xfc000000-0xfebfffff]
[    0.042538] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.042539] PM: Registered nosave memory: [mem 0xfec01000-0xfed0ffff]
[    0.042539] PM: Registered nosave memory: [mem 0xfed10000-0xfed13fff]
[    0.042540] PM: Registered nosave memory: [mem 0xfed14000-0xfed17fff]
[    0.042540] PM: Registered nosave memory: [mem 0xfed18000-0xfed19fff]
[    0.042541] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
[    0.042542] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.042542] PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
[    0.042543] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.042543] PM: Registered nosave memory: [mem 0xfee01000-0xff7fffff]
[    0.042544] PM: Registered nosave memory: [mem 0xff800000-0xffffffff]
[    0.042546] [mem 0xd0000000-0xf7ffffff] available for PCI devices
[    0.042547] Booting paravirtualized kernel on bare hardware
[    0.042551] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.042557] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.042996] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u262144
[    0.043002] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=3D1*2097152
[    0.043003] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.043037] Built 1 zonelists, mobility grouping on.  Total pages: 20618=
29
[    0.043038] Policy zone: Normal
[    0.043040] Kernel command line: BOOT_IMAGE=3D/vmlinuz-5.3.0-26-generic =
root=3D/dev/mapper/vgubuntu-root ro quiet splash vt.handoff=3D7
[    0.044386] Dentry cache hash table entries: 1048576 (order: 11, 8388608=
 bytes, linear)
[    0.045009] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes, linear)
[    0.045104] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.054940] Calgary: detecting Calgary via BIOS EBDA area
[    0.054943] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.087425] Memory: 8055004K/8378320K available (14339K kernel code, 238=
8K rwdata, 4728K rodata, 2668K init, 5056K bss, 323316K reserved, 0K cma-re=
served)
[    0.087436] random: get_random_u64 called from kmem_cache_open+0x2d/0x41=
0 with crng_init=3D0
[    0.087630] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.087646] Kernel/User page tables isolation: enabled
[    0.087667] ftrace: allocating 43225 entries in 169 pages
[    0.106883] rcu: Hierarchical RCU implementation.
[    0.106886] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D8.
[    0.106887] 	Tasks RCU enabled.
[    0.106888] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.106889] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.110980] NR_IRQS: 524544, nr_irqs: 488, preallocated irqs: 16
[    0.111334] vt handoff: transparent VT on vt#7
[    0.111343] Console: colour dummy device 80x25
[    0.111351] printk: console [tty0] enabled
[    0.111371] ACPI: Core revision 20190703
[    0.111499] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484882848 ns
[    0.111520] APIC: Switch to symmetric I/O mode setup
[    0.111522] DMAR: Host address width 36
[    0.111524] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.111529] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap c9008020e302=
72 ecap 1000
[    0.111529] DMAR: DRHD base: 0x000000fed93000 flags: 0x1
[    0.111532] DMAR: dmar1: reg_base_addr fed93000 ver 1:0 cap c90080206302=
72 ecap 1000
[    0.111533] DMAR: RMRR base: 0x000000cf7d7000 end: 0x000000cf7e6fff
[    0.112027] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
[    0.131519] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x246cfbc0430, max_idle_ns: 440795247827 ns
[    0.131524] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5054.06 BogoMIPS (lpj=3D10108136)
[    0.131527] pid_max: default: 32768 minimum: 301
[    0.131561] LSM: Security Framework initializing
[    0.131573] Yama: becoming mindful.
[    0.131625] AppArmor: AppArmor initialized
[    0.131688] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.131711] Mountpoint-cache hash table entries: 16384 (order: 5, 131072=
 bytes, linear)
[    0.131907] *** VALIDATE proc ***
[    0.131973] *** VALIDATE cgroup1 ***
[    0.131975] *** VALIDATE cgroup2 ***
[    0.132038] process: using mwait in idle threads
[    0.132042] Last level iTLB entries: 4KB 512, 2MB 7, 4MB 7
[    0.132043] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
[    0.132046] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.132047] Spectre V2 : Mitigation: Full generic retpoline
[    0.132048] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.132048] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.132050] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.132050] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    0.132052] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.132055] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.132220] Freeing SMP alternatives memory: 36K
[    0.244929] smpboot: CPU0: Intel(R) Core(TM) i5 CPU       M 540  @ 2.53G=
Hz (family: 0x6, model: 0x25, stepping: 0x2)
[    0.245053] Performance Events: PEBS fmt1+, Westmere events, 16-deep LBR=
, Intel PMU driver.
[    0.245059] core: CPUID marked event: 'bus cycles' unavailable
[    0.245061] ... version:                3
[    0.245061] ... bit width:              48
[    0.245062] ... generic registers:      4
[    0.245062] ... value mask:             0000ffffffffffff
[    0.245063] ... max period:             000000007fffffff
[    0.245063] ... fixed-purpose events:   3
[    0.245064] ... event mask:             000000070000000f
[    0.245109] rcu: Hierarchical SRCU implementation.
[    0.246223] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.246339] smp: Bringing up secondary CPUs ...
[    0.246471] x86: Booting SMP configuration:
[    0.246472] .... node  #0, CPUs:      #1 #2
[    0.249931] MDS CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more de=
tails.
[    0.249931]  #3
[    0.253708] smp: Brought up 1 node, 4 CPUs
[    0.253708] smpboot: Max logical packages: 2
[    0.253708] smpboot: Total of 4 processors activated (20216.27 BogoMIPS)
[    0.255957] devtmpfs: initialized
[    0.255957] x86/mm: Memory block size: 128MB
[    0.256426] PM: Registering ACPI NVS region [mem 0xcf67f000-0xcf76efff] =
(983040 bytes)
[    0.256426] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.256426] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    0.256426] pinctrl core: initialized pinctrl subsystem
[    0.256426] PM: RTC time: 21:05:02, date: 2020-01-12
[    0.256426] NET: Registered protocol family 16
[    0.256426] audit: initializing netlink subsys (disabled)
[    0.256426] audit: type=3D2000 audit(1578863102.144:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.256426] EISA bus registered
[    0.256426] cpuidle: using governor ladder
[    0.256426] cpuidle: using governor menu
[    0.256426] Simple Boot Flag at 0xf1 set to 0x1
[    0.256426] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.256426] ACPI: bus type PCI registered
[    0.256426] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.256426] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000=
=2D0xfbffffff] (base 0xf8000000)
[    0.256426] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.256426] PCI: Using configuration type 1 for base access
[    0.260152] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.260152] ACPI: Added _OSI(Module Device)
[    0.260152] ACPI: Added _OSI(Processor Device)
[    0.260152] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.260152] ACPI: Added _OSI(Processor Aggregator Device)
[    0.260152] ACPI: Added _OSI(Linux-Dell-Video)
[    0.260152] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.260152] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.271243] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.271895] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.280061] ACPI: Dynamic OEM Table Load:
[    0.280067] ACPI: SSDT 0xFFFF9F99A61E3800 000432 (v01 PmRef  Cpu0Ist  00=
003000 INTL 20080729)
[    0.281106] ACPI: Dynamic OEM Table Load:
[    0.281111] ACPI: SSDT 0xFFFF9F99A6962000 000891 (v01 PmRef  Cpu0Cst  00=
003001 INTL 20080729)
[    0.284636] ACPI: Dynamic OEM Table Load:
[    0.284640] ACPI: SSDT 0xFFFF9F99A61FFC00 000303 (v01 PmRef  ApIst    00=
003000 INTL 20080729)
[    0.285453] ACPI: Dynamic OEM Table Load:
[    0.285457] ACPI: SSDT 0xFFFF9F99A63D1C00 000119 (v01 PmRef  ApCst    00=
003000 INTL 20080729)
[    0.287090] ACPI: EC: EC started
[    0.287091] ACPI: EC: interrupt blocked
[    0.288691] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as first EC
[    0.288693] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x10, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.288694] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions
[    0.288694] ACPI: Interpreter enabled
[    0.288719] ACPI: (supports S0 S3 S4 S5)
[    0.288721] ACPI: Using IOAPIC for interrupt routing
[    0.288757] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.289043] ACPI: Enabled 7 GPEs in block 00 to 3F
[    0.308048] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
[    0.308055] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.308116] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
[    0.308973] PCI host bridge to bus 0000:00
[    0.308975] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.308976] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.308977] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.308979] pci_bus 0000:00: root bus resource [mem 0xd0000000-0xfeaffff=
f window]
[    0.308980] pci_bus 0000:00: root bus resource [bus 00-3e]
[    0.308991] pci 0000:00:00.0: [8086:0044] type 00 class 0x060000
[    0.309014] pci 0000:00:00.0: DMAR: BIOS has allocated no shadow GTT; di=
sabling IOMMU for graphics
[    0.309108] pci 0000:00:01.0: [8086:0045] type 01 class 0x060400
[    0.309149] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.309285] pci 0000:00:19.0: [8086:10ea] type 00 class 0x020000
[    0.309312] pci 0000:00:19.0: reg 0x10: [mem 0xe9600000-0xe961ffff]
[    0.309323] pci 0000:00:19.0: reg 0x14: [mem 0xe9680000-0xe9680fff]
[    0.309333] pci 0000:00:19.0: reg 0x18: [io  0x8040-0x805f]
[    0.309418] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.309525] pci 0000:00:1a.0: [8086:3b3c] type 00 class 0x0c0320
[    0.309551] pci 0000:00:1a.0: reg 0x10: [mem 0xe9670000-0xe96703ff]
[    0.309652] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.309762] pci 0000:00:1b.0: [8086:3b56] type 00 class 0x040300
[    0.309792] pci 0000:00:1b.0: reg 0x10: [mem 0xe9660000-0xe9663fff 64bit]
[    0.309902] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.310017] pci 0000:00:1c.0: [8086:3b42] type 01 class 0x060400
[    0.310140] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.310256] pci 0000:00:1c.1: [8086:3b44] type 01 class 0x060400
[    0.310379] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.310495] pci 0000:00:1c.2: [8086:3b46] type 01 class 0x060400
[    0.310617] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.310735] pci 0000:00:1c.3: [8086:3b48] type 01 class 0x060400
[    0.310857] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.310982] pci 0000:00:1d.0: [8086:3b34] type 00 class 0x0c0320
[    0.311008] pci 0000:00:1d.0: reg 0x10: [mem 0xe9650000-0xe96503ff]
[    0.311109] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.311229] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.311410] pci 0000:00:1f.0: [8086:3b07] type 00 class 0x060100
[    0.311621] pci 0000:00:1f.2: [8086:282a] type 00 class 0x010400
[    0.311649] pci 0000:00:1f.2: reg 0x10: [io  0x8090-0x8097]
[    0.311660] pci 0000:00:1f.2: reg 0x14: [io  0x8080-0x8083]
[    0.311670] pci 0000:00:1f.2: reg 0x18: [io  0x8070-0x8077]
[    0.311680] pci 0000:00:1f.2: reg 0x1c: [io  0x8060-0x8063]
[    0.311690] pci 0000:00:1f.2: reg 0x20: [io  0x8020-0x803f]
[    0.311700] pci 0000:00:1f.2: reg 0x24: [mem 0xe9640000-0xe96407ff]
[    0.311761] pci 0000:00:1f.2: PME# supported from D3hot
[    0.311865] pci 0000:00:1f.3: [8086:3b30] type 00 class 0x0c0500
[    0.311891] pci 0000:00:1f.3: reg 0x10: [mem 0xe9630000-0xe96300ff 64bit]
[    0.311920] pci 0000:00:1f.3: reg 0x20: [io  0x8000-0x801f]
[    0.312042] pci 0000:00:1f.6: [8086:3b32] type 00 class 0x118000
[    0.312072] pci 0000:00:1f.6: reg 0x10: [mem 0xe9620000-0xe9620fff 64bit]
[    0.312287] pci 0000:01:00.0: [10de:0a6c] type 00 class 0x030000
[    0.312302] pci 0000:01:00.0: reg 0x10: [mem 0xe2000000-0xe2ffffff]
[    0.312311] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    0.312319] pci 0000:01:00.0: reg 0x1c: [mem 0xe0000000-0xe1ffffff 64bit=
 pref]
[    0.312325] pci 0000:01:00.0: reg 0x24: [io  0x7000-0x707f]
[    0.312330] pci 0000:01:00.0: reg 0x30: [mem 0xe3000000-0xe307ffff pref]
[    0.312335] pci 0000:01:00.0: enabling Extended Tags
[    0.312390] pci 0000:01:00.0: 32.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s x16 link at 0000:00:01.0 (capable of 64.000 Gb/s with 5 GT/=
s x16 link)
[    0.312518] pci 0000:01:00.1: [10de:0be3] type 00 class 0x040300
[    0.312531] pci 0000:01:00.1: reg 0x10: [mem 0xe3080000-0xe3083fff]
[    0.312563] pci 0000:01:00.1: enabling Extended Tags
[    0.312656] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.312658] pci 0000:00:01.0:   bridge window [io  0x7000-0x7fff]
[    0.312660] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xe30fffff]
[    0.312730] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.312734] pci 0000:00:1c.0:   bridge window [io  0x6000-0x6fff]
[    0.312738] pci 0000:00:1c.0:   bridge window [mem 0xe8200000-0xe95fffff]
[    0.312866] pci 0000:03:00.0: [14e4:4727] type 00 class 0x028000
[    0.312938] pci 0000:03:00.0: reg 0x10: [mem 0xe6e00000-0xe6e03fff 64bit]
[    0.313051] pci 0000:03:00.0: enabling Extended Tags
[    0.313219] pci 0000:03:00.0: supports D1 D2
[    0.313220] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.313431] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.313435] pci 0000:00:1c.1:   bridge window [io  0x5000-0x5fff]
[    0.313439] pci 0000:00:1c.1:   bridge window [mem 0xe6e00000-0xe81fffff]
[    0.313574] pci 0000:04:00.0: [1180:e476] type 02 class 0x060700
[    0.313610] pci 0000:04:00.0: reg 0x10: [mem 0xe5940000-0xe5940fff]
[    0.313698] pci 0000:04:00.0: supports D1 D2
[    0.313699] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.313843] pci 0000:04:00.1: [1180:e822] type 00 class 0x080501
[    0.313881] pci 0000:04:00.1: reg 0x10: [mem 0xe5930000-0xe59300ff]
[    0.314056] pci 0000:04:00.1: supports D1 D2
[    0.314057] pci 0000:04:00.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.314198] pci 0000:04:00.4: [1180:e832] type 00 class 0x0c0010
[    0.314234] pci 0000:04:00.4: reg 0x10: [mem 0xe5900000-0xe59007ff]
[    0.314337] pci 0000:04:00.4: Enabling fixed DMA alias to 00.0
[    0.314438] pci 0000:04:00.4: supports D1 D2
[    0.314439] pci 0000:04:00.4: PME# supported from D0 D1 D2 D3hot D3cold
[    0.314620] pci 0000:00:1c.2: PCI bridge to [bus 04-05]
[    0.314624] pci 0000:00:1c.2:   bridge window [io  0x2000-0x3fff]
[    0.314628] pci 0000:00:1c.2:   bridge window [mem 0xe3100000-0xe59fffff]
[    0.314700] pci_bus 0000:05: extended config space not accessible
[    0.314718] pci_bus 0000:05: busn_res: [bus 05] end can not be updated t=
o 08
[    0.314724] pci 0000:00:1c.2: bridge has subordinate 05 but max busn 08
[    0.314812] acpiphp: Slot [1] registered
[    0.314818] pci 0000:00:1c.3: PCI bridge to [bus 06-0b]
[    0.314822] pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
[    0.314826] pci 0000:00:1c.3:   bridge window [mem 0xe5a00000-0xe6dfffff]
[    0.314855] pci_bus 0000:0c: extended config space not accessible
[    0.314911] pci 0000:00:1e.0: PCI bridge to [bus 0c] (subtractive decode)
[    0.314922] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7 window]=
 (subtractive decode)
[    0.314924] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window]=
 (subtractive decode)
[    0.314925] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff=
 window] (subtractive decode)
[    0.314926] pci 0000:00:1e.0:   bridge window [mem 0xd0000000-0xfeafffff=
 window] (subtractive decode)
[    0.316784] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 10 12 14 1=
5) *11
[    0.316870] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 7 *11 12 14 =
15)
[    0.316955] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 *10 12 14 =
15)
[    0.317043] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *10
[    0.317128] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 *5 6 7 10 12 14 =
15)
[    0.317212] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *0, disabled.
[    0.317297] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 *3 4 5 6 7 10 12 14 =
15)
[    0.317380] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *0, disabled.
[    0.318590] ACPI: PCI Root Bridge [CPBG] (domain 0000 [bus 3f])
[    0.318595] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.318704] PCI host bridge to bus 0000:3f
[    0.318706] pci_bus 0000:3f: root bus resource [bus 3f]
[    0.318713] pci 0000:3f:00.0: [8086:2c62] type 00 class 0x060000
[    0.318759] pci 0000:3f:00.1: [8086:2d01] type 00 class 0x060000
[    0.318810] pci 0000:3f:02.0: [8086:2d10] type 00 class 0x060000
[    0.318852] pci 0000:3f:02.1: [8086:2d11] type 00 class 0x060000
[    0.318893] pci 0000:3f:02.2: [8086:2d12] type 00 class 0x060000
[    0.318939] pci 0000:3f:02.3: [8086:2d13] type 00 class 0x060000
[    0.322670] ACPI: EC: interrupt unblocked
[    0.322681] ACPI: EC: event unblocked
[    0.322688] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x10, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.322690] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions and events
[    0.322774] SCSI subsystem initialized
[    0.322774] libata version 3.00 loaded.
[    0.322774] pci 0000:01:00.0: vgaarb: setting as boot VGA device
[    0.322774] pci 0000:01:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.322774] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.322774] vgaarb: loaded
[    0.322774] ACPI: bus type USB registered
[    0.322774] usbcore: registered new interface driver usbfs
[    0.322774] usbcore: registered new interface driver hub
[    0.322774] usbcore: registered new device driver usb
[    0.322774] pps_core: LinuxPPS API ver. 1 registered
[    0.322774] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.322774] PTP clock support registered
[    0.322774] EDAC MC: Ver: 3.0.0
[    0.322774] PCI: Using ACPI for IRQ routing
[    0.322774] PCI: pci_cache_line_size set to 64 bytes
[    0.322774] e820: reserve RAM buffer [mem 0x00096400-0x0009ffff]
[    0.322774] e820: reserve RAM buffer [mem 0xcf65f000-0xcfffffff]
[    0.323522] NetLabel: Initializing
[    0.323522] NetLabel:  domain hash size =3D 128
[    0.323522] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.323522] NetLabel:  unlabeled traffic allowed by default
[    0.324494] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.324500] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.327542] clocksource: Switched to clocksource tsc-early
[    0.342789] VFS: Disk quotas dquot_6.6.0
[    0.342814] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.342853] *** VALIDATE hugetlbfs ***
[    0.342953] AppArmor: AppArmor Filesystem Enabled
[    0.342993] pnp: PnP ACPI init
[    0.343300] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.343307] system 00:00: Plug and Play ACPI device, IDs PNP0103 PNP0c01=
 (active)
[    0.343369] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.343371] system 00:01: [io  0x1000-0x1003] has been reserved
[    0.343372] system 00:01: [io  0x1004-0x1013] has been reserved
[    0.343373] system 00:01: [io  0xffff] has been reserved
[    0.343375] system 00:01: [io  0x0400-0x047f] has been reserved
[    0.343376] system 00:01: [io  0x0500-0x057f] has been reserved
[    0.343377] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.343381] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.343410] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.343437] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.344714] pnp 00:04: Plug and Play ACPI device, IDs PNP0401 (disabled)
[    0.344740] pnp 00:05: Plug and Play ACPI device, IDs DLL040b PNP0f13 (a=
ctive)
[    0.345074] system 00:06: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.345076] system 00:06: [mem 0xfed10000-0xfed13fff] has been reserved
[    0.345077] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.345079] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.345080] system 00:06: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.345081] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.345083] system 00:06: [mem 0xfeb00000-0xfeb03fff] has been reserved
[    0.345084] system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.345086] system 00:06: [mem 0xff000000-0xffffffff] could not be reser=
ved
[    0.345087] system 00:06: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.345088] system 00:06: [mem 0xe96c0000-0xe96c0fff] has been reserved
[    0.345093] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.351054] pnp: PnP ACPI: found 7 devices
[    0.352768] thermal_sys: Registered thermal governor 'fair_share'
[    0.352769] thermal_sys: Registered thermal governor 'bang_bang'
[    0.352770] thermal_sys: Registered thermal governor 'step_wise'
[    0.352770] thermal_sys: Registered thermal governor 'user_space'
[    0.352771] thermal_sys: Registered thermal governor 'power_allocator'
[    0.357276] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.357318] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 02] add_size 200000 add_align 100000
[    0.357321] pci 0000:00:1c.1: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 03] add_size 200000 add_align 100000
[    0.357333] pci 0000:00:1c.2: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 04-05] add_size 200000 add_align 100000
[    0.357335] pci 0000:00:1c.3: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 06-0b] add_size 200000 add_align 100000
[    0.357348] pci 0000:00:1c.0: BAR 15: assigned [mem 0xe9700000-0xe98ffff=
f 64bit pref]
[    0.357351] pci 0000:00:1c.1: BAR 15: assigned [mem 0xe9900000-0xe9affff=
f 64bit pref]
[    0.357354] pci 0000:00:1c.2: BAR 15: assigned [mem 0xe9b00000-0xe9cffff=
f 64bit pref]
[    0.357357] pci 0000:00:1c.3: BAR 15: assigned [mem 0xe9d00000-0xe9effff=
f 64bit pref]
[    0.357361] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.357363] pci 0000:00:01.0:   bridge window [io  0x7000-0x7fff]
[    0.357365] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xe30fffff]
[    0.357369] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.357372] pci 0000:00:1c.0:   bridge window [io  0x6000-0x6fff]
[    0.357377] pci 0000:00:1c.0:   bridge window [mem 0xe8200000-0xe95fffff]
[    0.357381] pci 0000:00:1c.0:   bridge window [mem 0xe9700000-0xe98fffff=
 64bit pref]
[    0.357388] pci 0000:00:1c.1: PCI bridge to [bus 03]
[    0.357391] pci 0000:00:1c.1:   bridge window [io  0x5000-0x5fff]
[    0.357396] pci 0000:00:1c.1:   bridge window [mem 0xe6e00000-0xe81fffff]
[    0.357400] pci 0000:00:1c.1:   bridge window [mem 0xe9900000-0xe9afffff=
 64bit pref]
[    0.357409] pci 0000:04:00.0: BAR 15: no space for [mem size 0x04000000 =
pref]
[    0.357411] pci 0000:04:00.0: BAR 15: failed to assign [mem size 0x04000=
000 pref]
[    0.357412] pci 0000:04:00.0: BAR 16: no space for [mem size 0x04000000]
[    0.357413] pci 0000:04:00.0: BAR 16: failed to assign [mem size 0x04000=
000]
[    0.357415] pci 0000:04:00.0: BAR 13: assigned [io  0x2000-0x20ff]
[    0.357416] pci 0000:04:00.0: BAR 14: assigned [io  0x2400-0x24ff]
[    0.357418] pci 0000:04:00.0: BAR 16: no space for [mem size 0x04000000]
[    0.357420] pci 0000:04:00.0: BAR 16: failed to assign [mem size 0x04000=
000]
[    0.357421] pci 0000:04:00.0: BAR 15: no space for [mem size 0x04000000 =
pref]
[    0.357422] pci 0000:04:00.0: BAR 15: failed to assign [mem size 0x04000=
000 pref]
[    0.357424] pci 0000:04:00.0: CardBus bridge to [bus 05]
[    0.357425] pci 0000:04:00.0:   bridge window [io  0x2000-0x20ff]
[    0.357431] pci 0000:04:00.0:   bridge window [io  0x2400-0x24ff]
[    0.357436] pci 0000:00:1c.2: PCI bridge to [bus 04-05]
[    0.357439] pci 0000:00:1c.2:   bridge window [io  0x2000-0x3fff]
[    0.357444] pci 0000:00:1c.2:   bridge window [mem 0xe3100000-0xe59fffff]
[    0.357448] pci 0000:00:1c.2:   bridge window [mem 0xe9b00000-0xe9cfffff=
 64bit pref]
[    0.357454] pci 0000:00:1c.3: PCI bridge to [bus 06-0b]
[    0.357457] pci 0000:00:1c.3:   bridge window [io  0x4000-0x4fff]
[    0.357462] pci 0000:00:1c.3:   bridge window [mem 0xe5a00000-0xe6dfffff]
[    0.357466] pci 0000:00:1c.3:   bridge window [mem 0xe9d00000-0xe9efffff=
 64bit pref]
[    0.357474] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[    0.357487] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.357489] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.357490] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.357491] pci_bus 0000:00: resource 7 [mem 0xd0000000-0xfeafffff windo=
w]
[    0.357492] pci_bus 0000:01: resource 0 [io  0x7000-0x7fff]
[    0.357493] pci_bus 0000:01: resource 1 [mem 0xd0000000-0xe30fffff]
[    0.357495] pci_bus 0000:02: resource 0 [io  0x6000-0x6fff]
[    0.357496] pci_bus 0000:02: resource 1 [mem 0xe8200000-0xe95fffff]
[    0.357497] pci_bus 0000:02: resource 2 [mem 0xe9700000-0xe98fffff 64bit=
 pref]
[    0.357498] pci_bus 0000:03: resource 0 [io  0x5000-0x5fff]
[    0.357499] pci_bus 0000:03: resource 1 [mem 0xe6e00000-0xe81fffff]
[    0.357500] pci_bus 0000:03: resource 2 [mem 0xe9900000-0xe9afffff 64bit=
 pref]
[    0.357501] pci_bus 0000:04: resource 0 [io  0x2000-0x3fff]
[    0.357502] pci_bus 0000:04: resource 1 [mem 0xe3100000-0xe59fffff]
[    0.357503] pci_bus 0000:04: resource 2 [mem 0xe9b00000-0xe9cfffff 64bit=
 pref]
[    0.357505] pci_bus 0000:05: resource 0 [io  0x2000-0x20ff]
[    0.357506] pci_bus 0000:05: resource 1 [io  0x2400-0x24ff]
[    0.357507] pci_bus 0000:06: resource 0 [io  0x4000-0x4fff]
[    0.357508] pci_bus 0000:06: resource 1 [mem 0xe5a00000-0xe6dfffff]
[    0.357509] pci_bus 0000:06: resource 2 [mem 0xe9d00000-0xe9efffff 64bit=
 pref]
[    0.357511] pci_bus 0000:0c: resource 4 [io  0x0000-0x0cf7 window]
[    0.357512] pci_bus 0000:0c: resource 5 [io  0x0d00-0xffff window]
[    0.357513] pci_bus 0000:0c: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.357514] pci_bus 0000:0c: resource 7 [mem 0xd0000000-0xfeafffff windo=
w]
[    0.357640] NET: Registered protocol family 2
[    0.357816] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4,=
 65536 bytes, linear)
[    0.357919] TCP established hash table entries: 65536 (order: 7, 524288 =
bytes, linear)
[    0.358210] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    0.358476] TCP: Hash tables configured (established 65536 bind 65536)
[    0.358546] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.358616] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, l=
inear)
[    0.358772] NET: Registered protocol family 1
[    0.358778] NET: Registered protocol family 44
[    0.359443] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.359455] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    0.359523] PCI: CLS 64 bytes, default 64
[    0.359624] Trying to unpack rootfs image as initramfs...
[    0.625304] Freeing initrd memory: 78948K
[    0.640217] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.640221] software IO TLB: mapped [mem 0xcb65f000-0xcf65f000] (64MB)
[    0.640408] check: Scanning for low memory corruption every 60 seconds
[    0.642811] Initialise system trusted keyrings
[    0.642823] Key type blacklist registered
[    0.642859] workingset: timestamp_bits=3D36 max_order=3D21 bucket_order=
=3D0
[    0.644310] zbud: loaded
[    0.644727] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.644893] fuse: init (API version 7.31)
[    0.645025] Platform Keyring initialized
[    0.650444] Key type asymmetric registered
[    0.650446] Asymmetric key parser 'x509' registered
[    0.650466] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 244)
[    0.650523] io scheduler mq-deadline registered
[    0.651900] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.651973] vesafb: mode is 640x480x32, linelength=3D2560, pages=3D0
[    0.651974] vesafb: scrolling: redraw
[    0.651975] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.651992] vesafb: framebuffer at 0xe1000000, mapped to 0x(____ptrval__=
__), using 1216k, total 1216k
[    0.652050] fbcon: Deferring console take-over
[    0.652051] fb0: VESA VGA frame buffer device
[    0.652064] intel_idle: MWAIT substates: 0x1120
[    0.652065] intel_idle: v0.4.1 model 0x25
[    0.652281] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.654838] ACPI: AC Adapter [AC] (on-line)
[    0.654963] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input0
[    0.655057] ACPI: Lid Switch [LID]
[    0.655155] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[    0.655203] ACPI: Power Button [PBTN]
[    0.655292] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[    0.655310] ACPI: Sleep Button [SBTN]
[    0.655387] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input3
[    0.655409] ACPI: Power Button [PWRF]
[    0.656617] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.663785] Linux agpgart interface v0.103
[    0.670164] loop: module loaded
[    0.670807] libphy: Fixed MDIO Bus: probed
[    0.670810] tun: Universal TUN/TAP device driver, 1.6
[    0.671012] PPP generic driver version 2.4.2
[    0.671341] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.671345] ehci-pci: EHCI PCI platform driver
[    0.674594] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    0.674606] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus =
number 1
[    0.674626] ehci-pci 0000:00:1a.0: debug port 2
[    0.678574] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    0.678602] ehci-pci 0000:00:1a.0: irq 16, io mem 0xe9670000
[    0.697742] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    0.697831] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    0.697834] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.697837] usb usb1: Product: EHCI Host Controller
[    0.697839] usb usb1: Manufacturer: Linux 5.3.0-26-generic ehci_hcd
[    0.697841] usb usb1: SerialNumber: 0000:00:1a.0
[    0.698146] hub 1-0:1.0: USB hub found
[    0.698167] hub 1-0:1.0: 3 ports detected
[    0.700930] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    0.700939] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus =
number 2
[    0.700955] ehci-pci 0000:00:1d.0: debug port 2
[    0.704909] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    0.704932] ehci-pci 0000:00:1d.0: irq 17, io mem 0xe9650000
[    0.721677] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    0.721826] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    0.721829] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.721831] usb usb2: Product: EHCI Host Controller
[    0.721833] usb usb2: Manufacturer: Linux 5.3.0-26-generic ehci_hcd
[    0.721835] usb usb2: SerialNumber: 0000:00:1d.0
[    0.722131] hub 2-0:1.0: USB hub found
[    0.722146] hub 2-0:1.0: 3 ports detected
[    0.722379] ehci-platform: EHCI generic platform driver
[    0.722398] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.722403] ohci-pci: OHCI PCI platform driver
[    0.722419] ohci-platform: OHCI generic platform driver
[    0.722429] uhci_hcd: USB Universal Host Controller Interface driver
[    0.722529] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    0.722936] i8042: Warning: Keylock active
[    0.724270] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.724281] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.724788] mousedev: PS/2 mouse device common for all mice
[    0.725728] rtc_cmos 00:02: RTC can wake from S4
[    0.726057] rtc_cmos 00:02: registered as rtc0
[    0.726096] rtc_cmos 00:02: alarms up to one year, y3k, 242 bytes nvram,=
 hpet irqs
[    0.726110] i2c /dev entries driver
[    0.726303] device-mapper: uevent: version 1.0.3
[    0.726454] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input4
[    0.726568] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised:=
 dm-devel@redhat.com
[    0.726698] platform eisa.0: Probing EISA bus 0
[    0.726702] platform eisa.0: EISA: Cannot allocate resource for mainboard
[    0.726705] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.726707] platform eisa.0: Cannot allocate resource for EISA slot 2
[    0.726709] platform eisa.0: Cannot allocate resource for EISA slot 3
[    0.726712] platform eisa.0: Cannot allocate resource for EISA slot 4
[    0.726714] platform eisa.0: Cannot allocate resource for EISA slot 5
[    0.726716] platform eisa.0: Cannot allocate resource for EISA slot 6
[    0.726719] platform eisa.0: Cannot allocate resource for EISA slot 7
[    0.726721] platform eisa.0: Cannot allocate resource for EISA slot 8
[    0.726723] platform eisa.0: EISA: Detected 0 cards
[    0.726728] intel_pstate: CPU model not supported
[    0.726831] ledtrig-cpu: registered to indicate activity on CPUs
[    0.727337] NET: Registered protocol family 10
[    0.745679] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.747362] Segment Routing with IPv6
[    0.747395] NET: Registered protocol family 17
[    0.747464] Key type dns_resolver registered
[    0.747833] RAS: Correctable Errors collector initialized.
[    0.747964] microcode: sig=3D0x20652, pf=3D0x10, revision=3D0x11
[    0.748216] microcode: Microcode Update Driver: v2.2.
[    0.748241] sched_clock: Marking stable (747945681, 247942)->(751091188,=
 -2897565)
[    0.748506] registered taskstats version 1
[    0.748523] Loading compiled-in X.509 certificates
[    0.748634] battery: ACPI: Battery Slot [BAT1] (battery absent)
[    0.751086] Loaded X.509 cert 'Build time autogenerated kernel key: a633=
ebf44975be9861a24233b58eb29a160a1563'
[    0.751134] zswap: loaded using pool lzo/zbud
[    0.760893] Key type big_key registered
[    0.765342] Key type encrypted registered
[    0.765350] AppArmor: AppArmor sha1 policy hashing enabled
[    0.765358] ima: No TPM chip found, activating TPM-bypass!
[    0.765364] ima: Allocated hash algorithm: sha1
[    0.765374] No architecture policies found
[    0.765382] evm: Initialising EVM extended attributes:
[    0.765383] evm: security.selinux
[    0.765384] evm: security.SMACK64
[    0.765384] evm: security.SMACK64EXEC
[    0.765384] evm: security.SMACK64TRANSMUTE
[    0.765385] evm: security.SMACK64MMAP
[    0.765385] evm: security.apparmor
[    0.765386] evm: security.ima
[    0.765386] evm: security.capability
[    0.765387] evm: HMAC attrs: 0x1
[    0.765981] PM:   Magic number: 4:611:95
[    0.766143] rtc_cmos 00:02: setting system clock to 2020-01-12T21:05:02 =
UTC (1578863102)
[    0.769320] Freeing unused decrypted memory: 2040K
[    0.769991] Freeing unused kernel image memory: 2668K
[    0.782135] Write protecting the kernel read-only data: 22528k
[    0.783099] Freeing unused kernel image memory: 2008K
[    0.783569] Freeing unused kernel image memory: 1416K
[    0.795391] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.795476] x86/mm: Checking user space page tables
[    0.807008] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.807011] Run /init as init process
[    0.902799] ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
[    0.936410] acpi device:02: registered as cooling_device4
[    0.937187] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:00/LNXVIDEO:00/input/input6
[    0.938633] wmi_bus wmi_bus-PNP0C14:00: WQBC data block query control me=
thod not found
[    0.944606] ACPI Warning: SystemIO range 0x0000000000000428-0x0000000000=
00042F conflicts with OpRegion 0x0000000000000400-0x000000000000047F (\PMIO=
) (20190703/utaddress-204)
[    0.944615] ACPI: If an ACPI driver is available for this device, you sh=
ould use it instead of the native driver
[    0.944618] ACPI Warning: SystemIO range 0x0000000000000540-0x0000000000=
00054F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO=
) (20190703/utaddress-204)
[    0.944622] ACPI: If an ACPI driver is available for this device, you sh=
ould use it instead of the native driver
[    0.944623] ACPI Warning: SystemIO range 0x0000000000000530-0x0000000000=
00053F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO=
) (20190703/utaddress-204)
[    0.944627] ACPI: If an ACPI driver is available for this device, you sh=
ould use it instead of the native driver
[    0.944628] ACPI Warning: SystemIO range 0x0000000000000500-0x0000000000=
00052F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO=
) (20190703/utaddress-204)
[    0.944632] ACPI: If an ACPI driver is available for this device, you sh=
ould use it instead of the native driver
[    0.944632] lpc_ich: Resource conflict(s) found affecting gpio_ich
[    0.944714] sdhci: Secure Digital Host Controller Interface driver
[    0.944715] sdhci: Copyright(c) Pierre Ossman
[    0.944848] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.944849] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.945131] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) se=
t to dynamic conservative mode
[    0.951369] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    0.965127] i801_smbus 0000:00:1f.3: Accelerometer lis3lv02d is present =
on SMBus but its address is unknown, skipping registration
[    0.972905] sdhci-pci 0000:04:00.1: SDHCI controller found [1180:e822] (=
rev 3)
[    0.973176] mmc0 bounce up to 128 segments into one, max segment size 65=
536 bytes
[    0.973594] ahci 0000:00:1f.2: version 3.0
[    0.973955] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 3 Gbps 0x=
33 impl RAID mode
[    0.973959] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum=
 part ems sxs apst=20
[    0.977511] cryptd: max_cpu_qlen set to 1000
[    0.979047] mmc0: SDHCI controller on PCI [0000:04:00.1] using DMA
[    0.993619] SSE version of gcm_enc/dec engaged.
[    1.020831] scsi host0: ahci
[    1.021256] scsi host1: ahci
[    1.021614] scsi host2: ahci
[    1.021808] scsi host3: ahci
[    1.022171] scsi host4: ahci
[    1.024162] scsi host5: ahci
[    1.024262] ata1: SATA max UDMA/133 abar m2048@0xe9640000 port 0xe964010=
0 irq 30
[    1.024266] ata2: SATA max UDMA/133 abar m2048@0xe9640000 port 0xe964018=
0 irq 30
[    1.024267] ata3: DUMMY
[    1.024268] ata4: DUMMY
[    1.024271] ata5: SATA max UDMA/133 abar m2048@0xe9640000 port 0xe964030=
0 irq 30
[    1.024274] ata6: SATA max UDMA/133 abar m2048@0xe9640000 port 0xe964038=
0 irq 30
[    1.034309] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.041346] ACPI Warning: \_SB.PCI0.AGP.VID._DSM: Argument #4 type misma=
tch - Found [Buffer], ACPI requires [Package] (20190703/nsarguments-59)
[    1.041422] ACPI: \_SB_.PCI0.AGP_.VID_: failed to evaluate _DSM
[    1.041710] checking generic (e1000000 130000) vs hw (d0000000 10000000)
[    1.041711] checking generic (e1000000 130000) vs hw (e0000000 2000000)
[    1.041712] fb0: switching to nouveaufb from VESA VGA
[    1.041927] nouveau 0000:01:00.0: NVIDIA GT218 (0a8600b1)
[    1.046138] firewire_ohci 0000:04:00.4: added OHCI v1.0 device as card 0=
, 4 IR + 4 IT contexts, quirks 0x11
[    1.061543] nouveau 0000:01:00.0: bios: version 70.18.53.00.02
[    1.061680] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    1.062942] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[    1.154945] [TTM] Zone  kernel: Available graphics memory: 4071060 KiB
[    1.154949] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    1.154950] [TTM] Initializing pool allocator
[    1.154962] [TTM] Initializing DMA pool allocator
[    1.155012] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[    1.155013] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.155018] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.155019] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    1.155021] nouveau 0000:01:00.0: DRM: DCB outp 00: 048003b6 0f220014
[    1.155022] nouveau 0000:01:00.0: DRM: DCB outp 01: 02033300 00000000
[    1.155024] nouveau 0000:01:00.0: DRM: DCB outp 02: 028113a6 0f220010
[    1.155025] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011362 00020010
[    1.155026] nouveau 0000:01:00.0: DRM: DCB outp 04: 088223c6 0f220010
[    1.155027] nouveau 0000:01:00.0: DRM: DCB outp 05: 08022382 00020010
[    1.155028] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002047
[    1.155029] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[    1.155031] nouveau 0000:01:00.0: DRM: DCB conn 02: 00410246
[    1.155032] nouveau 0000:01:00.0: DRM: DCB conn 03: 00000300
[    1.157564] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    1.192100] usb 1-1: New USB device found, idVendor=3D8087, idProduct=3D=
0020, bcdDevice=3D 0.00
[    1.192101] usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    1.192429] hub 1-1:1.0: USB hub found
[    1.192510] hub 1-1:1.0: 6 ports detected
[    1.199141] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 00:=
26:b9:ef:57:ae
[    1.199143] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connecti=
on
[    1.199198] e1000e 0000:00:19.0 eth0: MAC: 9, PHY: 10, PBA No: 2041FF-0FF
[    1.200162] e1000e 0000:00:19.0 eno1: renamed from eth0
[    1.212373] usb 2-1: New USB device found, idVendor=3D8087, idProduct=3D=
0020, bcdDevice=3D 0.00
[    1.212376] usb 2-1: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    1.212729] hub 2-1:1.0: USB hub found
[    1.212784] hub 2-1:1.0: 8 ports detected
[    1.338759] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.338793] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.338887] ata5: SATA link down (SStatus 0 SControl 300)
[    1.338920] ata6: SATA link down (SStatus 0 SControl 300)
[    1.339692] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[    1.340098] ata1.00: ATA-9: SanDisk SSD PLUS 240GB, UF4500RL, max UDMA/1=
33
[    1.340102] ata1.00: 468877312 sectors, multi 1: LBA48 NCQ (depth 32)
[    1.342514] ata2.00: ATAPI: HL-DT-ST DVD+/-RW GU40N, A101, max UDMA/133
[    1.345769] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[    1.346079] ata1.00: configured for UDMA/133
[    1.346370] ata2.00: configured for UDMA/133
[    1.346373] scsi 0:0:0:0: Direct-Access     ATA      SanDisk SSD PLUS 00=
RL PQ: 0 ANSI: 5
[    1.346589] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.346704] sd 0:0:0:0: [sda] 468877312 512-byte logical blocks: (240 GB=
/224 GiB)
[    1.346719] sd 0:0:0:0: [sda] Write Protect is off
[    1.346721] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.346745] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    1.347725]  sda: sda1 sda2 < sda5 >
[    1.348176] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.349504] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVD+-RW GU40N    A1=
01 PQ: 0 ANSI: 5
[    1.410592] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd=
/rw xa/form2 cdda tray
[    1.410594] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.410954] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    1.411031] sr 1:0:0:0: Attached scsi generic sg1 type 5
[    1.427268] random: fast init done
[    1.464327] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.465037] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.465040] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.483596] usb 1-1.4: new high-speed USB device number 3 using ehci-pci
[    1.484915] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.484916] [drm] Driver supports precise vblank timestamp query.
[    1.505649] usb 2-1.8: new full-speed USB device number 3 using ehci-pci
[    1.547732] firewire_core 0000:04:00.4: created device fw0: GUID 04cada6=
1364fc000, S400
[    1.623405] usb 1-1.4: New USB device found, idVendor=3D05ca, idProduct=
=3D1814, bcdDevice=3D 3.31
[    1.623407] usb 1-1.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    1.623408] usb 1-1.4: Product: Laptop_Integrated_Webcam_3M
[    1.623409] usb 1-1.4: Manufacturer: CN06YWTK7248707607PD
[    1.632071] nouveau 0000:01:00.0: DRM: allocated 1366x768 fb: 0x70000, b=
o (____ptrval____)
[    1.632275] fbcon: nouveaudrmfb (fb0) is primary device
[    1.632277] fbcon: Deferring console take-over
[    1.632282] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
[    1.647604] tsc: Refined TSC clocksource calibration: 2527.004 MHz
[    1.647618] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x246=
cdf3ec4c, max_idle_ns: 440795206158 ns
[    1.647666] clocksource: Switched to clocksource tsc
[    1.652186] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on=
 minor 0
[    1.671074] usb 2-1.8: New USB device found, idVendor=3D0a5c, idProduct=
=3D5800, bcdDevice=3D 1.01
[    1.671079] usb 2-1.8: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    1.671082] usb 2-1.8: Product: 5880
[    1.671084] usb 2-1.8: Manufacturer: Broadcom Corp
[    1.671087] usb 2-1.8: SerialNumber: 0123456789ABCD
[    1.671353] usb 2-1.8: config 0 descriptor??
[    2.376862] input: AlpsPS/2 ALPS DualPoint Stick as /devices/platform/i8=
042/serio1/input/input8
[    2.389834] input: AlpsPS/2 ALPS DualPoint TouchPad as /devices/platform=
/i8042/serio1/input/input7
[    6.318328] random: crng init done
[    6.318331] random: 6 urandom warning(s) missed due to ratelimiting
[    9.390620] EXT4-fs (dm-1): mounted filesystem with ordered data mode. O=
pts: (null)
[    9.698372] systemd[1]: Inserted module 'autofs4'
[    9.725317] systemd[1]: systemd 242 running in system mode. (+PAM +AUDIT=
 +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNU=
TLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default=
=2Dhierarchy=3Dhybrid)
[    9.743794] systemd[1]: Detected architecture x86-64.
[    9.745731] systemd[1]: Set hostname to <joyful>.
[    9.747218] systemd[1]: Failed to bump fs.file-max, ignoring: Invalid ar=
gument
[    9.916428] systemd[1]: /lib/systemd/system/dbus.socket:4: ListenStream=
=3D references a path below legacy directory /var/run/, updating /var/run/d=
bus/system_bus_socket =E2=86=92 /run/dbus/system_bus_socket; please update =
the unit file accordingly.
[   10.036164] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[   10.037079] systemd[1]: Created slice system-systemd\x2dcryptsetup.slice.
[   10.037332] systemd[1]: Created slice User and Session Slice.
[   10.037477] systemd[1]: Listening on udev Control Socket.
[   10.037492] systemd[1]: Reached target Slices.
[   10.067688] EXT4-fs (dm-1): re-mounted. Opts: errors=3Dremount-ro
[   10.107024] lp: driver loaded but no devices found
[   10.125108] ppdev: user-space parallel port driver
[   10.129595] parport_pc 00:04: [io  0x0378-0x037b]
[   10.129701] parport_pc 00:04: [irq 5]
[   10.132668] parport_pc 00:04: activated
[   10.132671] parport_pc 00:04: reported by Plug and Play ACPI
[   10.564843] systemd-journald[537]: Received request to flush runtime jou=
rnal from PID 1
[   10.666023] fbcon: Taking over console
[   10.673140] Console: switching to colour frame buffer device 170x48
[   10.796115] yenta_cardbus 0000:04:00.0: CardBus bridge found [1028:040b]
[   10.796153] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[   10.796156] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[   10.796162] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[   10.796169] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[   10.796175] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[   10.843674] intel ips 0000:00:1f.6: CPU TDP doesn't match expected value=
 (found 25, expected 29)
[   10.843980] intel ips 0000:00:1f.6: failed to get i915 symbols, graphics=
 turbo disabled until i915 loads
[   10.851488] intel ips 0000:00:1f.6: IPS driver initialized, MCP temp lim=
it 90
[   10.867279] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   10.874402] dcdbas dcdbas: Dell Systems Management Base Driver (version =
5.6.0-3.3)
[   10.878677] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   10.894223] dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492: WMI SMBIOS=
 userspace interface not supported(0), try upgrading to a newer BIOS
[   10.914640] input: Dell WMI hotkeys as /devices/platform/PNP0C14:00/wmi_=
bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input9
[   10.932592] yenta_cardbus 0000:04:00.0: ISA IRQ mask 0x0000, PCI irq 18
[   10.932597] yenta_cardbus 0000:04:00.0: Socket status: 30000006
[   10.932605] yenta_cardbus 0000:04:00.0: pcmcia: parent PCI bridge window=
: [io  0x2000-0x3fff]
[   10.932608] yenta_cardbus 0000:04:00.0: pcmcia: parent PCI bridge window=
: [mem 0xe3100000-0xe59fffff]
[   10.932611] pcmcia_socket pcmcia_socket0: cs: memory probe 0xe3100000-0x=
e59fffff:
[   10.932618]  excluding 0xe3100000-0xe4d2ffff 0xe5770000-0xe59fffff
[   10.932624] yenta_cardbus 0000:04:00.0: pcmcia: parent PCI bridge window=
: [mem 0xe9b00000-0xe9cfffff 64bit pref]
[   10.932626] pcmcia_socket pcmcia_socket0: cs: memory probe 0xe9b00000-0x=
e9cfffff:
[   10.932631]  excluding 0xe9b00000-0xe9cfffff
[   10.985669] wl: loading out-of-tree module taints kernel.
[   10.985675] wl: module license 'MIXED/Proprietary' taints kernel.
[   10.985676] Disabling lock debugging due to kernel taint
[   11.001237] wl: module verification failed: signature and/or required ke=
y missing - tainting kernel
[   11.018273] mc: Linux media interface: v0.10
[   11.087667] videodev: Linux video capture interface: v2.00
[   11.240933] uvcvideo: Found UVC 1.00 device Laptop_Integrated_Webcam_3M =
(05ca:1814)
[   11.241245] kvm: VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL does not work proper=
ly. Using workaround
[   11.242041] wlan0: Broadcom BCM4727 802.11 Hybrid Wireless Controller 6.=
30.223.271 (r587334)

[   11.246196] uvcvideo 1-1.4:1.0: Entity type for entity Extension 4 was n=
ot initialized!
[   11.246200] uvcvideo 1-1.4:1.0: Entity type for entity Extension 3 was n=
ot initialized!
[   11.246202] uvcvideo 1-1.4:1.0: Entity type for entity Processing 2 was =
not initialized!
[   11.246204] uvcvideo 1-1.4:1.0: Entity type for entity Camera 1 was not =
initialized!
[   11.246381] input: Laptop_Integrated_Webcam_3M: In as /devices/pci0000:0=
0/0000:00:1a.0/usb1/1-1/1-1.4/1-1.4:1.0/input/input10
[   11.246557] usbcore: registered new interface driver uvcvideo
[   11.246558] USB Video Class driver (1.1.1)
[   11.283643] dell_laptop: Using i8042 filter function for receiving events
[   11.379277] wl 0000:03:00.0 wlp3s0: renamed from wlan0
[   11.470600] snd_hda_intel 0000:01:00.1: Disabling MSI
[   11.470610] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio clie=
nt
[   11.489950] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0f=
ffff:
[   11.489959]  excluding 0xc0000-0xfffff
[   11.489982] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0x=
a0ffffff:
[   11.489987]  excluding 0xa0000000-0xa0ffffff
[   11.490009] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x=
60ffffff:
[   11.490014]  excluding 0x60000000-0x60ffffff
[   11.491192] snd_hda_codec_idt hdaudioC0D0: autoconfig for 92HD81B1C5: li=
ne_outs=3D1 (0xe/0x0/0x0/0x0/0x0) type:line
[   11.491196] snd_hda_codec_idt hdaudioC0D0:    speaker_outs=3D1 (0xd/0x0/=
0x0/0x0/0x0)
[   11.491198] snd_hda_codec_idt hdaudioC0D0:    hp_outs=3D1 (0xb/0x0/0x0/0=
x0/0x0)
[   11.491200] snd_hda_codec_idt hdaudioC0D0:    mono: mono_out=3D0x0
[   11.491201] snd_hda_codec_idt hdaudioC0D0:    inputs:
[   11.491204] snd_hda_codec_idt hdaudioC0D0:      Dock Mic=3D0xf
[   11.491206] snd_hda_codec_idt hdaudioC0D0:      Internal Mic=3D0x11
[   11.491207] snd_hda_codec_idt hdaudioC0D0:      Mic=3D0xa
[   12.091682] Adding 1003516k swap on /dev/mapper/vgubuntu-swap_1.  Priori=
ty:-2 extents:1 across:1003516k SSFS
[   12.268098] EXT4-fs (sda1): mounted filesystem with ordered data mode. O=
pts: (null)
[   12.329682] audit: type=3D1400 audit(1578863114.057:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-s=
enddoc" pid=3D916 comm=3D"apparmor_parser"
[   12.331469] audit: type=3D1400 audit(1578863114.057:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin/ipp=
usbxd" pid=3D918 comm=3D"apparmor_parser"
[   12.335164] audit: type=3D1400 audit(1578863114.061:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/snap=
d/snap-confine" pid=3D919 comm=3D"apparmor_parser"
[   12.335170] audit: type=3D1400 audit(1578863114.061:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/snap=
d/snap-confine//mount-namespace-capture-helper" pid=3D919 comm=3D"apparmor_=
parser"
[   12.347719] audit: type=3D1400 audit(1578863114.073:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/man"=
 pid=3D922 comm=3D"apparmor_parser"
[   12.347726] audit: type=3D1400 audit(1578863114.073:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter" p=
id=3D922 comm=3D"apparmor_parser"
[   12.347730] audit: type=3D1400 audit(1578863114.073:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" pi=
d=3D922 comm=3D"apparmor_parser"
[   12.352120] audit: type=3D1400 audit(1578863114.081:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/ligh=
tdm/lightdm-guest-session" pid=3D917 comm=3D"apparmor_parser"
[   12.352126] audit: type=3D1400 audit(1578863114.081:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/lig=
htdm/lightdm-guest-session//chromium" pid=3D917 comm=3D"apparmor_parser"
[   12.354042] audit: type=3D1400 audit(1578863114.081:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/cup=
s/backend/cups-pdf" pid=3D923 comm=3D"apparmor_parser"
[   12.540863] input: HDA Intel MID Dock Mic as /devices/pci0000:00/0000:00=
:1b.0/sound/card0/input13
[   12.540974] input: HDA Intel MID Mic as /devices/pci0000:00/0000:00:1b.0=
/sound/card0/input14
[   12.541069] input: HDA Intel MID Dock Line Out as /devices/pci0000:00/00=
00:00:1b.0/sound/card0/input15
[   12.541165] input: HDA Intel MID Headphone as /devices/pci0000:00/0000:0=
0:1b.0/sound/card0/input16
[   12.740250] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input11
[   12.740335] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input12
[   12.740431] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input17
[   12.741087] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input18
[   15.340518] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[  252.563326] rfkill: input handler disabled
[  424.942501] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[  424.942503] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[  424.942504] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[  461.398193] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[  835.140608] rfkill: input handler enabled
[  848.458373] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[  848.670811] PM: suspend entry (deep)
[  848.768976] Filesystems sync: 0.098 seconds
[  848.769301] Freezing user space processes ... (elapsed 0.002 seconds) do=
ne.
[  848.771350] OOM killer disabled.
[  848.771351] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[  848.772740] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[  848.790642] e1000e: EEE TX LPI TIMER: 00000000
[  848.808195] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  848.808287] sd 0:0:0:0: [sda] Stopping disk
[ 1292.523818] ACPI: EC: interrupt blocked
[ 1292.542561] ACPI: Preparing to enter system sleep state S3
[ 1292.547247] ACPI: EC: event blocked
[ 1292.547247] ACPI: EC: EC stopped
[ 1292.547248] PM: Saving platform NVS memory
[ 1292.548056] Disabling non-boot CPUs ...
[ 1292.548472] IRQ 31: no longer affine to CPU1
[ 1292.549502] smpboot: CPU 1 is now offline
[ 1292.553519] IRQ 17: no longer affine to CPU2
[ 1292.554771] smpboot: CPU 2 is now offline
[ 1292.558919] IRQ 16: no longer affine to CPU3
[ 1292.558929] IRQ 18: no longer affine to CPU3
[ 1292.559949] smpboot: CPU 3 is now offline
[ 1292.564571] ACPI: Low-level resume complete
[ 1292.564641] ACPI: EC: EC started
[ 1292.564641] PM: Restoring platform NVS memory
[ 1292.565829] Enabling non-boot CPUs ...
[ 1292.565904] x86: Booting SMP configuration:
[ 1292.565905] smpboot: Booting Node 0 Processor 1 APIC 0x4
[ 1292.566076] microcode: sig=3D0x20652, pf=3D0x10, revision=3D0x9
[ 1292.566463] microcode: updated to revision 0x11, date =3D 2018-05-08
[ 1292.569061] CPU1 is up
[ 1292.569109] smpboot: Booting Node 0 Processor 2 APIC 0x1
[ 1292.569291] microcode: sig=3D0x20652, pf=3D0x10, revision=3D0x11
[ 1292.571968] CPU2 is up
[ 1292.572021] smpboot: Booting Node 0 Processor 3 APIC 0x5
[ 1292.574820] CPU3 is up
[ 1292.577215] ACPI: Waking up from system sleep state S3
[ 1292.585322] ACPI: EC: interrupt unblocked
[ 1292.624283] ACPI: EC: event unblocked
[ 1292.636551] sd 0:0:0:0: [sda] Starting disk
[ 1292.693447] nouveau 0000:01:00.0: devinit: 0x00005ea9[0]: script needs O=
R link
[ 1292.871561] usb 1-1.4: reset high-speed USB device number 3 using ehci-p=
ci
[ 1292.981995] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1292.982761] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 1292.982965] ata5: SATA link down (SStatus 0 SControl 300)
[ 1292.983001] ata6: SATA link down (SStatus 0 SControl 300)
[ 1293.200197] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[ 1293.202659] ata2.00: configured for UDMA/133
[ 1293.213833] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[ 1293.214045] ata1.00: configured for UDMA/133
[ 1293.231530] firewire_core 0000:04:00.4: rediscovered device fw0
[ 1293.622308] ACPI: button: The lid device is not compliant to SW_LID.
[ 1293.636443] OOM killer enabled.
[ 1293.636444] Restarting tasks ...=20
[ 1293.636616] pci_bus 0000:01: Allocating resources
[ 1293.636631] pcieport 0000:00:01.0: bridge window [mem 0x00100000-0x000ff=
fff 64bit pref] to [bus 01] add_size 200000 add_align 100000
[ 1293.636645] pcieport 0000:00:01.0: BAR 15: assigned [mem 0xe9f00000-0xea=
0fffff 64bit pref]
[ 1293.636652] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.636654] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.636660] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.636666] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.636672] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.636678] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.636766] pci_bus 0000:0c: Allocating resources
[ 1293.636769] pci 0000:00:1e.0: bridge window [io  0x1000-0x0fff] to [bus =
0c] add_size 1000
[ 1293.636772] pci 0000:00:1e.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 0c] add_size 200000 add_align 100000
[ 1293.636774] pci 0000:00:1e.0: bridge window [mem 0x00100000-0x000fffff] =
to [bus 0c] add_size 200000 add_align 100000
[ 1293.636779] pci 0000:00:1e.0: BAR 14: assigned [mem 0xea100000-0xea2ffff=
f]
[ 1293.636784] pci 0000:00:1e.0: BAR 15: assigned [mem 0xea300000-0xea4ffff=
f 64bit pref]
[ 1293.636788] pci 0000:00:1e.0: BAR 13: assigned [io  0x9000-0x9fff]
[ 1293.636792] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.636793] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.636799] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.636806] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.636812] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.636819] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.636823] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.636829] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.636834] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.655728] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.655733] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.655740] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.655746] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.655752] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.655760] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.655764] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.655770] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.655774] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.655821] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.655823] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.655829] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.655835] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.655841] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.655847] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.655851] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.655856] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.655861] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.656129] pci_bus 0000:05: busn_res: [bus 05] end is updated to 05
[ 1293.656155] pci_bus 0000:02: Allocating resources
[ 1293.656166] pci_bus 0000:03: Allocating resources
[ 1293.656182] pci_bus 0000:04: Allocating resources
[ 1293.656208] pci_bus 0000:06: Allocating resources
[ 1293.656215] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.656217] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.656223] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.656229] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.656235] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.656242] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.656245] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.656251] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.656256] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.656299] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.656301] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.656308] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.656314] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.656320] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.656327] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.656330] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.656335] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.656340] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.656461] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.656463] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.656469] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.656475] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.656482] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.656488] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.656491] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.656497] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.656502] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.656592] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 1293.656594] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 1293.656600] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 1293.656607] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 1293.656613] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 1293.656619] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 1293.656623] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 1293.656628] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 1293.656633] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 1293.658932] done.
[ 1293.682327] acpi PNP0401:00: Already enumerated
[ 1293.700428] acpi PNP0501:00: Still not present
[ 1293.844070] video LNXVIDEO:00: Restoring backlight state
[ 1293.844091] PM: suspend exit
[ 1293.952413] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link rate uns=
upported by sink
[ 1293.955810] nouveau 0000:01:00.0: disp: outp 00:0006:0344: training fail=
ed
[ 1294.043905] e1000e: eno1 NIC Link is Down
[ 1294.065384] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[ 1295.015537] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 1869.582012] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[ 3659.368792] perf: interrupt took too long (2533 > 2500), lowering kernel=
=2Eperf_event_max_sample_rate to 78750
[ 4620.908451] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[ 4706.847486] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 press=
ed
[ 4707.061111] PM: suspend entry (deep)
[ 4707.080782] Filesystems sync: 0.019 seconds
[ 4707.081107] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[ 4707.083097] OOM killer disabled.
[ 4707.083098] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[ 4707.084631] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[ 4707.100719] e1000e: EEE TX LPI TIMER: 00000000
[ 4707.117785] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 4707.117902] sd 0:0:0:0: [sda] Stopping disk
[ 5090.517455] ACPI: EC: interrupt blocked
[ 5090.536221] ACPI: Preparing to enter system sleep state S3
[ 5090.541262] ACPI: EC: event blocked
[ 5090.541263] ACPI: EC: EC stopped
[ 5090.541263] PM: Saving platform NVS memory
[ 5090.542120] Disabling non-boot CPUs ...
[ 5090.542549] IRQ 31: no longer affine to CPU1
[ 5090.543565] smpboot: CPU 1 is now offline
[ 5090.546559] IRQ 17: no longer affine to CPU2
[ 5090.547788] smpboot: CPU 2 is now offline
[ 5090.551549] smpboot: CPU 3 is now offline
[ 5090.554728] ACPI: Low-level resume complete
[ 5090.554797] ACPI: EC: EC started
[ 5090.554798] PM: Restoring platform NVS memory
[ 5090.555993] Enabling non-boot CPUs ...
[ 5090.556070] x86: Booting SMP configuration:
[ 5090.556071] smpboot: Booting Node 0 Processor 1 APIC 0x4
[ 5090.556243] microcode: sig=3D0x20652, pf=3D0x10, revision=3D0x9
[ 5090.559298] CPU1 is up
[ 5090.559346] smpboot: Booting Node 0 Processor 2 APIC 0x1
[ 5090.559527] microcode: sig=3D0x20652, pf=3D0x10, revision=3D0x11
[ 5090.562182] CPU2 is up
[ 5090.562234] smpboot: Booting Node 0 Processor 3 APIC 0x5
[ 5090.565021] CPU3 is up
[ 5090.567419] ACPI: Waking up from system sleep state S3
[ 5090.575065] ACPI: EC: interrupt unblocked
[ 5090.613647] ACPI: EC: event unblocked
[ 5090.621119] sd 0:0:0:0: [sda] Starting disk
[ 5090.702835] nouveau 0000:01:00.0: devinit: 0x00005ea9[0]: script needs O=
R link
[ 5090.861187] usb 1-1.4: reset high-speed USB device number 3 using ehci-p=
ci
[ 5090.962335] ata6: SATA link down (SStatus 0 SControl 300)
[ 5090.964284] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 5090.964317] ata5: SATA link down (SStatus 0 SControl 300)
[ 5090.964352] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 5091.225135] firewire_core 0000:04:00.4: rediscovered device fw0
[ 5091.258826] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[ 5091.261328] ata2.00: configured for UDMA/133
[ 5091.270337] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[ 5091.270599] ata1.00: configured for UDMA/133
[ 5091.637990] OOM killer enabled.
[ 5091.637991] Restarting tasks ...=20
[ 5091.638186] pci_bus 0000:01: Allocating resources
[ 5091.638239] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.638241] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.638248] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.638254] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.638260] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.638301] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.638305] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.638311] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.638315] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.638520] pci_bus 0000:0c: Allocating resources
[ 5091.638526] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.638528] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.638540] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.638552] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.638588] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.638602] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.638606] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.638642] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.638651] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.662806] done.
[ 5091.848450] video LNXVIDEO:00: Restoring backlight state
[ 5091.848492] PM: suspend exit
[ 5091.849009] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.849012] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.849019] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.849027] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.849033] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.849040] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.849044] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.849051] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.849055] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.849146] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.849149] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.849160] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.849171] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.849185] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.849198] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.849204] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.849222] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.849232] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.849537] pci_bus 0000:05: busn_res: [bus 05] end is updated to 05
[ 5091.849582] pci_bus 0000:02: Allocating resources
[ 5091.849605] pci_bus 0000:03: Allocating resources
[ 5091.849635] pci_bus 0000:04: Allocating resources
[ 5091.849696] pci_bus 0000:06: Allocating resources
[ 5091.849702] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.849704] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.849713] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.849723] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.849738] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.849750] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.849753] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.849760] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.849765] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.849806] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.849807] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.849813] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.849820] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.849826] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.849832] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.849835] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.849841] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.849846] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.849953] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.849955] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.849961] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.849967] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.849973] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.849980] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.849983] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.849989] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.849993] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.850071] yenta_cardbus 0000:04:00.0: CardBus bridge to [bus 05]
[ 5091.850073] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2000-0x20=
ff]
[ 5091.850081] yenta_cardbus 0000:04:00.0:   bridge window [io  0x2400-0x24=
ff]
[ 5091.850096] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe3100000-=
0xe44fffff pref]
[ 5091.850105] yenta_cardbus 0000:04:00.0:   bridge window [mem 0xe4800000-=
0xe4bfffff]
[ 5091.850123] pci 0000:00:1e.0: PCI bridge to [bus 0c]
[ 5091.850127] pci 0000:00:1e.0:   bridge window [io  0x9000-0x9fff]
[ 5091.850139] pci 0000:00:1e.0:   bridge window [mem 0xea100000-0xea2fffff]
[ 5091.850147] pci 0000:00:1e.0:   bridge window [mem 0xea300000-0xea4fffff=
 64bit pref]
[ 5091.860121] acpi PNP0401:00: Already enumerated
[ 5091.866509] acpi PNP0501:00: Still not present
[ 5091.980272] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link rate uns=
upported by sink
[ 5091.983637] nouveau 0000:01:00.0: disp: outp 00:0006:0344: training fail=
ed
[ 5092.065488] e1000e: eno1 NIC Link is Down
[ 5092.115715] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 press=
ed
[ 5093.038461] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready

--nextPart23245552.m5J86HpEY5
Content-Disposition: attachment; filename="vbios.rom"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream; name="vbios.rom"

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
AAAAAA8AAAAAAAAADwAAAAAAAAAPAAAAAAAAAA8AAAAAAAAADwAAAAAAAAAPAAAAAAAAAA8AAAAA
AAAADwAAAAAAAAAPAAAAAAAAAEAFDwRSAAAABQEAAAUDAAAFAAAA/wAAAP8FAAAFBgEABQcDAAUI
BQAFCQcABQANAAYBDwAGAhEABgMTAAYAAAD/QAQIAQ8PDw8PDw8PQAYbBPtS4AQAIOEHAHDi/wBw
4wEAIeQAACTlBQAg5gYAIecaACDoIwAK6f8AcOr/AHDr/wBw7P8AcO3/AHDu/wBw71EAcPD/AHDx
/wBw8v8AcPMIAHD0/wBw9f8AcPb/AHD3/wBw4P8AcOD/AADg/wAAQAQDAgVTTFNjU0AHEAQAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAQAcEBAAAAAAAAAAAAAAAAAAAAAAAAABABwQEAAAAAAAAAAAAAAAAAAAAAAAAAEAMAADw
AAAADwAAAEEFBAIAAAAAAAAAAABABQQEAAKYAACQoBAA/wAAAP8AAABABRAEAEcgAABGERAARgJB
AAADAAD/BAAA/wUAAP8GAAD/AAAA/wAAAP8AAAD/AAAA/wAAAP8AAAD/AAAA/wAAAP8AAAAQBBIF
Hz4+Pj4fPj4+Ph8+Pj4+Hz4+Pj4fPj4+Ph8+Pj4+Hz4+Pj4fPj4+Ph8+Pj4+Hz4+Pj4fPj4+Ph8+
Pj4+Hz4+Pj4fPj4+Ph8+Pj4+Hz4+Pj4fPj4+Ph8+Pj4+EgDPAwUBXVRmVAAAAACPUWFUW0BRcQAA
ZVRxcUAHAhAANCEAAAABAQIBAwEEAQUBBgAHAAgACQEKAQsBDAENAA4BD1uiVVgMwGFABQACBgEA
AAAAAAAAAPhKDwD4ygEAW/hVWzVWcVuiVVgMwGFABQACBgEAAAAAAAAAAPhKDwD4ygEAW/hVWzVW
cVvNVVgMwGFABQACBgEAAAAAAAAgAIjIDwCIyAEAW/hVWzVWcVvNVVgMwGFABQACBgEAAAAAAAAg
APhKDwCIyAEAW/hVWzVWcVuiVVgMwGFABQACBgEAAAAAAAAAAPBKDwDwygEAW/hVcVuiVVgMwGFA
BQACBgEAAAAAAAAAAPBKDwDwygEAW/hVcVvNVVgMwGFABQACBgEAAAAAAAAgAIjIDwAAyAEAW/hV
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
AgErEQQDADMABAYAggMKAp9ad1uXWsBbzFvYWwAAEQACAAEVBAIAAhoIBAADIhEEAQAaAAQBASAG
BAECJw0EAgAiAAQCASsRBAMAMwAEW6FbOgANbuThAAD8////AQAAAHEGAMQDAQJ6XqpeuF4IABpd
Hl0JABpdHl0AAKpdAACyWwYARAMKAp9ad1uXWsBbzFvYWwAAFgAAAAEaCgAAAiEWAgADLC4GAQAh
AAABASgPAgECMB8GAgAtAAECATYXBgMAQwAGBgCEAwoCn1p3W5dawFvMW9hbAAARAAIAARUEAgAC
GggEAAMiEQQBABoABAEBIAYEAQInDQQCACIABAIBKxEEAwAzAARboVs6AA1u5OEAAPz///8CAAAA
cQYAyAMBAnpeql64XggA1l3aXQkA1l3aXQAAZl4AALJbBgBIAwoCn1p3W5dawFvMW9hbAAARAAIA
ARUEAgACGggEAAMiEQQBABoABAEBIAYEAQInDQQCACIABAIBKxEEAwAzAAQGAIgDCgKfWndbl1rA
W8xb2FsAABEAAgABFQQCAAIaCAQAAyIRBAEAGgAEAQEgBgQBAicNBAIAIgAEAgErEQQDADMABFuh
WzoADW7k4QAA/P///wMAAABxOgAseoDAYUCMCgAAeoTAYUCMCgDAbgDhAAD///f/AAAAAG5AwWFg
/v///wEAAABxbuDBYUDy//9/CAAAgHFxcToBKG4s6AAA9////wAAAABuMOgAAP///38AAAAAbizo
AAD7////AAAAAHI6AihurOgAAPf///8AAAAAbrDoAAD///9/AAAAAG6s6AAA+////wAAAABycToB
KG4s6AAA9////wgAAABuLOgAAPv///8EAAAAbjDoAAD///9/AAAAgHI6AihurOgAAPf///8IAAAA
bqzoAAD7////BAAAAG6w6AAA////fwAAAIBycVhAwGFAEDIQAAAAoEAAAIBAAACAQAAAgEAAAIBA
AACAQAAAgEAAACAAAMiQAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAABxZlBmU2ZRZlJmVr5BUorB
sQT24QPwZi6LFGaLymb3wgABAAB0VWaB4QAAAP9mwekYZoP5BnURgOIPZrkCIAAAZrv8D///6xdm
geIAHgAAZsHqCWa5AcAAAGa7/D///2YzwLBQ9uJmvgDlAABmA/Dof+hmI8NmC8HoW+hmXmZaZllm
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
+P//AAAAAG4AU2EA+Pj//wAAAABugENhAPjw//8AAAAAboBLYQD48P//AAAAAG6AU2EA+PD//wAA
AABxNwAQEAAYD9QDi/BfBEBhAAD/////AAAAAIQBYQAAAAAAegCfYQAJAAAAU48Adg1NgNQBgIZy
cXoAQWEAAAEAEHoASWEAAAEAEHF6oEEAADEBBgBxeoBBAABAIQAAeoRBAABAIQAAeqRBAAAxAQYA
cXq8QQAAQQEcAHFuoEEAAP/O//8AMQAAcW6kQQAA/87//wAxAABxbrxBAAD/z///ACAAAHFT8ABR
oKEIAgAAUaChGAIAAFKIv0BSigAAcVMwEFMxAFOqAHGMbhAiAgD+////AAAAAHoAAgAAAAAAADMU
bgAAAAD/////AAAAADZuhBAAAP/3//8ACAAAekAVAAABAAHzlkAVAAAQAQBAFQAA//8A/xB1Em5A
FQAA/////wAAAABybkAVAAD/////AAAAAG5AwAAA/+//zwAQACB6AAIAABPx899uECICAP7///8B
AAAAjVsUbm4I4QAAd////4gAAABuAOMAAP/8//8AAwAAWIAEAgACbQAAAAIAAAB6wAQCAGsAAAB6
2AQCAGgAAAB64AQCAGUAAAB6HAQCAGUAAABYDAECAAYJAAAAAAAAAABmAAAAAAAAgVR2ADACAABY
dAACAAIkQCAAAAAQAViUAAIAAgAAAAAAAAAAbvThAAAAAAAAEQAAAHpMAAIACyIHRHokBAIAAgAA
AI56HOEAAAEAAAB6IOEAAAAAAANuAOEAAP////8AAAAAegQAAgDpABEAdRB6FJAIACDgAAB6GJAI
ACDtQCE4ehSQCAAMAAAAehiQCAAU4OAgcm6MgQgA/v//DwEAANBufJAIAAAA//8PDwAAeoyECACM
ABgBblyECAD///9vAAAAkG5YgQgA//v//wAEAABuPIEIAP///w8AAABgblCBCAB/////AAAAAG6I
gAgA/////wAAAABuiKAIAPz///8DAAAAegiQCAAQSAAAbhCGCAD+////AQAAAG4wFQAA/////wAA
AAB6IJIAABIEAAB6AJIAAAQIAAB6EJIAAHECAABuABAQAP////8AAACAbgwQEAD/////AAAAgFus
bnqM4QAAAAABAG4g6AAA7f///xAAAABuoOgAAO3///8QAAAAbiBCAADt////EAAAAHQKAFYF/3JW
B/9ybiDoAADu////AQAAAG6g6AAA7v///wEAAAB6MOgAAAEHZoB6sOgAAAEfGYB6AEcAAAAAAIB6
GEAAAADQABBWBv9yVgj/cm4g6AAA+////wQAAABuoOgAAPv///8EAAAAbiDoAADn////EAAAAG6g
6AAA5////xAAAABuLOgAAPf///8AAAAAbjDoAAD///9/AAAAAG4s6AAA+////wAAAABurOgAAPf/
//8AAAAAbrDoAAD///9/AAAAAG6s6AAA+////wAAAAB6mEEAADEBHAB6kEEAADEBHABb9m56ZEEA
ADEBAgB6YEEAADEBBgB6aEEAACEBBgBbAG96tEEAADEBDgBbHG9umEEAAP/P//8AMAAAbpBBAAD/
z///ADAAAFsmb25kQQAA/87//wAxAABuYEEAAP/O//8AMQAAbmhBAAD/zv//ADEAAFs0b260QQAA
/8///wAwAABbQm9uAEIAAPf///8IAAAAbiBCAAD3////CAAAAG4AQAAA9////wgAAAB6IEEAADEw
BgB6JEEAADEwBgB6KEEAACEwBgB6QEEAAAABHAB6REEAAAABHABb425bznN6RMAAAAAAAAB6OBUA
ABERAQBxcm4kQQAA/87//wAxAAB6JEIAAAUUAgBuIEIAAO7///8BAAAAVgn/cm4gQgAA+////wQA
AABuIEIAAOf///8QAAAAbmRBAAD+/v//AAAAAHJxjxAHEAAEAYAAAACAAAAAgAAAAIAAAACAAAAA
gAAAAIAAAACAAAAAjxgHEAAEAndeBUB3XgVAd18FQHdfBUB3XgVAd14FQHdfBUB3XwVAd04EQHdO
BEB3TwRAd08EQHdPBEB3TgRAd08EQHdPBECPIAcQAAQBzMzMzMzMzMwAAAAAAAAAAMzMzMzMzMzM
AAAAAAAAAACPIBERAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPgBMRAAQBAAAA
gAAAAIAFBQCACgoAgAAAAIAAAACABQUAgAoKAICPoAgQAAQBzgwAh84MAIefPgCHnz4Ah84MAIfO
DACHnz4Ah58+AIePgBERAAQBAAAAAAAAAAB3d3d3d3d3dwAAAAAAAAAAd3d3d3d3d3ePABARAAQB
AAAAAAAAAAB3d3d3d3d3dwAAAAAAAAAAd3d3d3d3d3ePgA0QAAQBAAAAAAAAAACqqqqqqqqqqgAA
AAAAAAAAqqqqqqqqqqqP3AkQAAQBAAAAAAAAAAAAAAAACgAKCgAAAAAAAAAAAAAAAAoACgqP5AkQ
AAQBAAAAAAAAAAAAAAAACgAKCgAAAAAAAAAAAAAAAAoACgqPAAkQAAQBDw8PDw8PDw8PDw8PDw8P
Dw8PDw8PDw8PDw8PDw8PDw+PIAkQAAQBDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw+P
QAkQAAQBAACAgAAAgIAAAICAAACAgAAAgIAAAICAAACAgAAAgICPIAoQAAQBAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAACPQAoQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AACPYAoQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPgAoQAAQBAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPoAoQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAACPwAoQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPABQRACAGAAAAAAAA
AAAAAAAAAAsLAAAAAAAAAAAAAAkOAAAJDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAj8ANEAAEAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAj6AF
EAAEAiAgIAAgICAAICAgACAgIACPj48AICAgADc3MQA3Ny0AAAAAAAAAAAAQEAAAEBAAABAQAAAA
AAAAEBAAABAQAACPBPgQAAQBAAAAgAAAAIAEAGCABADAgAMAAgAAAACABADwgAQA8ICPPAUQAAQB
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPYAcQAAQBIiIiIiIiIiIAAAAAAAAAACIi
IiIiIiIiMzMzMzMzMzOPgAcQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAd3d3dzMzMzOPoAcQ
AAQBIiIiIiIiIiIzMzMzMzMzMyIiIiIiIiIiMzMzMzMzMzOPwAcQAAQBAAAAAAAAAAAzMzMzMzMz
MwAAAAAAAAAAMzMzMzMzMzOP4AcQAAQBIiIiIiIiIiIiIiIiAAAAACIiIiIiIiIiIiIiIiIiIiKP
AAgQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAmZmZmaqqqqqPIAgQAAQBERERERERERERERER
ERERERERERERERERERERERERERGPQAgQAAQBAAAAAAAAAAAREREREREREQAAAAAAAAAAEREREQAA
AACPYAgQAAQBERERERERERERERERERERERERERERERERERERERERERGPgAgQAAQBAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPFAcQAAQBEQAAABEAAAABAADwAQAA8BEAAAARAAAAAQAA
8AEAAPB6AAcQAAAAAAB6QAcQAAAAAAh6oA0QABAAAACPBBERAAQBfw4AAH8OAAD/CQAA/wkAAP8J
AAB/DgAA/wkAAP8JAAB6wBARAAEYAAB64BARAACQCYCPABERAAQBAAACTAAAAkwAAAAIAAAACAAA
AAgAAAJMAAAACAAAAAh6TAIQAIAAAA+P4BERAAQBAwMAAgMDAAIEBAACBAQAAgMDAAIDAwACBAQA
AgQEAAKPVAIQAAQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABuAAUQAAH/8P/+AAoA
bgAMEAD7////AAAAAI8gAhAABAsAAAAAAAAAABUtDwcVLQ8HIy0ZCgAAAAAWLRAHFi0QBwUBAAEF
AQABBQsDDgULAw4ICwISBQEAAQUNBQ4FDQUOAAAA/wAAAP8HBwQFBwcEBQYDCQQAAAD/BwcGBQcH
BgX//////////wURLTYFES02BhIvOf////8FES02BREtNgAAAAAAAAAACgoDEgoKAxK/DAAAAAAA
AAoKBBMKCgQTAAYAAAAGAAAHDActBwwHLQgMCDUABgAABwwHLQcMBy1QBloAUAZaAFAGYABQBmAA
VgV/AFAGWgBQBmAAUAZgAAICBgQCAgYEAgISCwICEgsCAgYEAgIGBAICBQYCAgUGAAcdEQAHHREA
Bx0RAAcdEQAHHREABx0RAAYdEQAGHRG/DAAAvwwAAJ8BAACfAQAAvwwAAL8MAACfAQAAnwEAAA9g
yAAPYMgACjEAAgoxAAIPYMgAD2DIAAUxAAIFMQACj1gCEAAIAgACQAAAAkAAAAJAAAACQAAAAkAA
AAJAAAACQAAAAkAAAFDDAABQwwAAUMMAAFDDAABQwwAAUMMAAFDDAABQwwBuaAIQAP///P8AAAMA
dQ1uaAIQAP///88AAAAQco8AAhAABAEAMCIAADAiAAAgIgAAICIAADAiAAAwIgAAICIAACAiAI8E
AhAABAEgoFUBIKBVASCgVQEgoFUBIKBVASCgVQEgoGYBIKBmAY9QAhAABAEBAAAAAQAAAAEAAAAB
AAAAAQAAAAEAAAABAAAAAQAAAHosEgAAAQAAAG7MCBAA9////wgAAABu4AgQAP///38AAAAAbswI
EAD3////CAAAAFYM/3J64AoQAAAAAAB66AoQAAAAAAB68AoQAAAAAAB0oA9vAXoYAhAAAAAAAXTI
AHocAhAAAQAAAHoYAhAAAAEAAXT0AXqAABAAIBAAAHpABBAACwBQgHrYAhAAAQAAAHoYAhAAAQEA
AY/gAhAABAEYACAAGAAgAIgAIACIACAAGAAgABgAIACIACAAiAAgAI/kAhAABAEAADAAAAAwAAAA
MAAAADAAAAAwAAAAMAAAADAAAAAwAI/EAhAABAEAABAAAAAQAAIAEAACABAABAAQAAAAEAACABAA
AgAQAG8Aj8ACEAAEAUAfAABAHwAAIBcAACAXAABgGwAAQB8AACAXAAAgFwAAdQ6P6AIQAAQBGAAg
ABgAIACIACAAiAAgABgAIAAYACAAiAAgAIgAIACP7AIQAAQBAAAwAAAAMAAAADAAAAAwAAAAMAAA
ADAAAAAwAAAAMACPzAIQAAQBAAAQAAAAEAACABAAAgAQAAQAEAAAABAAAgAQAAIAEACPyAIQAAQB
QB8AAEAfAAAgFwAAIBcAAGAbAABAHwAAIBcAACAXAABydQ9uCOEAAP////8AAAAAcnrYAhAAAQAA
AHpkAhAAAQAAAHToA28BdOgDehACEAAAAAAAelwCEAAAAACAbhhAAAD/P///AMAAAHToA3FxesAI
EACTAgqdW1BvegDiAAA8EAMAW2pvcVt5YHToA1vKf28AMwpvATZvAG8BbwF6EAIQAAEAAIBuEAcQ
AP/9//8AAgAAbgQOEAB/AOD/gEwGAG4IDhAA//8f8AAAAAtuAAIQAP/3//8ACAAAbgAGEAD/////
AEAAAGNb4mxudAYQAAAA//8EBAAAblgVAAD8////AwAAAHqIFQAAAQAAAG5gAAIA///AAAAABAB6
gAACADYHDBBuGAACAP////8AAAAAbkyBCAD/////AAAAAHpUgQgAIHEAAHoAIAgAAgAAAFvSbW7k
4QAA/P///wAAAABuhBAAAP/3//8AAAAAcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFx
cXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFx
cXFxcXFxcXFxcXFxW+htcRAEBQGobwkAwAABAgMEBQYHCAkKCwwNDg8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjX0L
XFTV9vA+j3kwPGZQRFIEMiIDmQyLLFHJB5paDpA8C7TslNWthBmtro9DownnqHVvlo/0ZmVlarcR
DQFLBg8K2kOgl2kPBB9LBwGzAAHnfGufwUf33v/v94Wzz95rrb322mvvvfbaj3Mim3pKrIvJKv1S
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
C8l0A+i2BwvJdQaDxxCD5/C4AAiNNlrauVIE6J8HjTas3rk8BeiVB2Hp00cHAAsAEwAjAEMAgwAD
AAUACQARACEAQQCBAAEBAQIBBAEIARABIAFAEBESAAgHCQYKBQsEDAMNAg4BDwAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUFFXi/qK0TLb
NopNATjKcwKKyjaKPdPrNog9ivsy2zY6TQF1LIrqKumsgP0IdgiK34r4gO0IrLEIKs02iE0B6wbQ
6NHb/s2A/QB39TaIBesENihNAbEQKsrT64vXX1lYw1BWV4vyM8A2iEQBNogENoxECDaJfAqBxxMA
Nol8DIHHNAA2iXwOgcc+ATaJfBCBx1oCNol8El9eWMNVi+yDxP5QUVfHRv7//zPAM8lRsQHoTf/R
4AvDWdHhJosdR0eB4/9/UCvBO9h2DAP4A/gmix2JXv7rBgP7A/sDy1iLXv6D+/90yF9ZWIvlXcNV
i+yDxP5QU1JXtwFmM8C6AIAmiRVHR9HgVjPSiVb+Jjo8dQkmiRVAR0f/Rv5CRjvRdeyL94tW/ivy
K/KD7gImCRRe/sc433bGX1pbWIvlXcNQU1FXBrkTAIv6No5FCDaLfQoywCaIBUfi+ov6NotNAjPA
UIvYLg+2h1TkUbED6JL+WYv6Not9CgP4JogdWEDi4VaL+jaLdQo2i30MuRMAswfoW/9eB19ZW1jD
UFNRVwbonf+5PgGL+jaORQg2i30OVzLAJogFR+L6i/o2i00ENgNNBl8y5FGwAVeL+jaLfQy5EwDo
yP5fgPsQdQ6xAugi/oDDA4rDitzrKID7EXUOsQPoD/6AwwOKwzLb6xWA+xJ1DrEH6Pz9gMMLisMy
2+sCiuNZJogdR0n+yArAdfULyXWkVov6NotNBDaLRQY2i3UONot9ELMP6LX+A/GL+jaLfRKLyLMP
6Kb+XgdfWVtYw1BTUVcGi/o2i00ENo5FCDaLfRDoOP4HX4H7AAF1A+mfAIH7AAEPhpMAVzPAgfsd
AXUFuAIB6zKB+wkBcweLwy3+AOsli8uB6QUBwekCi8HB4AIFBQEr2NPji/nR5y6LhSzkA8PoTP0D
wwaL+jaLTQY2jkUINot9EujT/QeD+wRzA0PrJFCLy4PpAtHpi8HR4IPAAivY0+OL+dHnLouFOOQD
w+gO/QPYWF+LyFcr+yaKBV8miAVH4vMz2+sEJogdR4H7AAEPhTv/WVtYw1WL7IPE7FBTUVIGi98G
v2fkjMiOwI1W7Ogt/QeL+7EB6MT8U/7B6L78g/sCdAXoEC7rJLEF6K/8gcMBAYle8Oil/EOJXvL+
yeic/IPDBIle7ugr/ujd/lsL23TCB1pZW1iL5V3DwwAAAIgAiQAUAQsAARFZARABAg8AAF0EEAEA
AACAiQQQAZYFAAIJABIBEEgAAIMAQAA2BwwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAP//////////////////////////////////////////////////////////////
/0hXRUH/////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////7w==


--nextPart23245552.m5J86HpEY5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--nextPart23245552.m5J86HpEY5--



