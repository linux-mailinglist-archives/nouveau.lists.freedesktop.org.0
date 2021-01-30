Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D730997F
	for <lists+nouveau@lfdr.de>; Sun, 31 Jan 2021 01:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07246E114;
	Sun, 31 Jan 2021 00:43:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from buxtehude.debian.org (buxtehude.debian.org
 [IPv6:2607:f8f0:614:1::1274:39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0836E054
 for <nouveau@lists.freedesktop.org>; Sat, 30 Jan 2021 14:45:09 +0000 (UTC)
Received: from debbugs by buxtehude.debian.org with local (Exim 4.92)
 (envelope-from <debbugs@buxtehude.debian.org>)
 id 1l5rUo-0007Ly-Vk; Sat, 30 Jan 2021 14:45:06 +0000
X-Loop: owner@bugs.debian.org
Resent-From: Anand Kumria <akumria@gmail.com>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: akumria@gmail.com, nouveau@lists.freedesktop.org,
 Debian Kernel Team <debian-kernel@lists.debian.org>
X-Loop: owner@bugs.debian.org
Resent-Date: Sat, 30 Jan 2021 14:45:05 +0000
Resent-Message-ID: <handler.973876.B973876.161201769826282@bugs.debian.org>
X-Debian-PR-Message: followup 973876
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: 
References: <160466646186.3020.2291691508260226524.reportbug@lano-work.andritz.com>
X-Debian-PR-Source: linux
Received: via spool by 973876-submit@bugs.debian.org id=B973876.161201769826282
 (code B ref 973876); Sat, 30 Jan 2021 14:45:05 +0000
Received: (at 973876) by bugs.debian.org; 30 Jan 2021 14:41:38 +0000
X-Spam-Checker-Version: SpamAssassin 3.4.2-bugs.debian.org_2005_01_02
 (2018-09-13) on buxtehude.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=4.0 tests=BAYES_00,DIGITS_LETTERS,
 DKIM_ADSP_CUSTOM_MED,FORGED_GMAIL_RCVD,FOURLA,FREEMAIL_FROM,
 FVGT_m_MULTI_ODD,GMAIL,HAS_PACKAGE,KHOP_HELO_FCRDNS,MD5_SHA1_SUM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_SOFTFAIL,SPOOFED_FREEMAIL,
 SPOOF_GMAIL_MID,TXREP,WORD_WITHOUT_VOWELS,XMAILER_REPORTBUG
 autolearn=ham autolearn_force=no
 version=3.4.2-bugs.debian.org_2005_01_02
X-Spam-Bayes: score:0.0000 Tokens: new, 377; hammy, 150; neutral, 2915; spammy,
 0. spammytokens: hammytokens:0.000-+--followup-for,
 0.000-+--followupfor, 0.000-+--FollowupFor, 0.000-+--Followup-For,
 0.000-+--H*M:reportbug
Received: from eth1822.nsw.adsl.internode.on.net ([150.101.200.29]:46602
 helo=pushan.kumria.com)
 by buxtehude.debian.org with esmtp (Exim 4.92)
 (envelope-from <akumria@gmail.com>) id 1l5rRQ-0006pc-Ra
 for 973876@bugs.debian.org; Sat, 30 Jan 2021 14:41:38 +0000
MIME-Version: 1.0
From: Anand Kumria <akumria@gmail.com>
To: Debian Bug Tracking System <973876@bugs.debian.org>
Message-ID: <161201769165.1479.15151582073795937185.reportbug@pushan.kumria.com>
X-Mailer: reportbug 7.9.0
Date: Sun, 31 Jan 2021 01:41:31 +1100
X-Mailman-Approved-At: Sun, 31 Jan 2021 00:43:41 +0000
Subject: [Nouveau] Bug#973876: nouveau: nv50_dmac_wait kernel stack trace
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
Reply-To: Anand Kumria <akumria@gmail.com>, 973876@bugs.debian.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Package: src:linux
Version: 5.10.9-1
Followup-For: Bug #973876
X-Debbugs-Cc: akumria@gmail.com, nouveau@lists.freedesktop.org

Hi,

I am relibably able to trigger a kernel stack trace by visting a webpage with a
video in Firefox 86b3 and then "popping out" the video.

The webpage happens to be
https://abc.net.au/news/2021-01-29/what-are-executive-orders-biden-trump/13097838

That said, this has also occurred when *no* video was playing at all. It just happens
to be occur *everytime* I visit the above webpage.

When this first started happening I was unsure what was causing the hang. I
have run memtester and it believes that all system memory is fine. I happened
to see a flurry of messages during one of these hangs which said 'nouveau'
before the system became unresponsive.

I looked around https://nouveau.freedesktop.org and suspected it might be
because I have an old card (GeForce GT 220) and maybe it is not supported
anymore. I discovered that the video features of the card require firmware to
work -- so I followed the process outlined on https://nouveau.freedesktop.org/VideoAcceleration.html
to extract the required firmware.

The below stack trace is what I received when I booted with the firmware all
installed and visited the webpage above. I was fortunate that I was able to
switch to a console and execute a reboot.

I am happy to assist in debugging this further if necessary.

Thanks,
Anand

-- Package-specific info:
** Version:
Linux version 5.10.0-2-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1) #1 SMP Debian 5.10.9-1 (2021-01-20)

** Command line:
BOOT_IMAGE=/boot/vmlinuz-5.10.0-2-amd64 root=UUID=d0a8c377-99f3-4f84-a489-d8f046c3cbe0 ro quiet

** Not tainted

** Kernel log:

-- Journal begins at Wed 2021-01-27 21:21:14 AEDT, ends at Sun 2021-01-31 01:18:06 AEDT. --
Jan 31 00:48:46 pushan kernel: microcode: microcode updated early to revision 0xa, date = 2018-05-08
Jan 31 00:48:46 pushan kernel: Linux version 5.10.0-2-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1) #1 SMP Debian 5.10.9-1 (2021-01-20)
Jan 31 00:48:46 pushan kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-2-amd64 root=UUID=d0a8c377-99f3-4f84-a489-d8f046c3cbe0 ro quiet
Jan 31 00:48:46 pushan kernel: Disabled fast string operations
Jan 31 00:48:46 pushan kernel: x86/fpu: x87 FPU will use FXSAVE
Jan 31 00:48:46 pushan kernel: BIOS-provided physical RAM map:
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009dbff] usable
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x000000000009dc00-0x000000000009ffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000000e4000-0x00000000000fffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x0000000000100000-0x00000000bd47ffff] usable
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000bd480000-0x00000000bd48dfff] ACPI data
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000bd48e000-0x00000000bd4cffff] ACPI NVS
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000bd4d0000-0x00000000bd4dffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000bd4ed000-0x00000000bdffffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000fed20000-0x00000000fed3ffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x00000000ffb00000-0x00000000ffffffff] reserved
Jan 31 00:48:46 pushan kernel: BIOS-e820: [mem 0x0000000100000000-0x000000023fffffff] usable
Jan 31 00:48:46 pushan kernel: NX (Execute Disable) protection: active
Jan 31 00:48:46 pushan kernel: SMBIOS 2.6 present.
Jan 31 00:48:46 pushan kernel: DMI: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:48:46 pushan kernel: tsc: Fast TSC calibration using PIT
Jan 31 00:48:46 pushan kernel: tsc: Detected 2925.803 MHz processor
Jan 31 00:48:46 pushan kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Jan 31 00:48:46 pushan kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
Jan 31 00:48:46 pushan kernel: last_pfn = 0x240000 max_arch_pfn = 0x400000000
Jan 31 00:48:46 pushan kernel: MTRR default type: uncachable
Jan 31 00:48:46 pushan kernel: MTRR fixed ranges enabled:
Jan 31 00:48:46 pushan kernel:   00000-9FFFF write-back
Jan 31 00:48:46 pushan kernel:   A0000-BFFFF uncachable
Jan 31 00:48:46 pushan kernel:   C0000-CFFFF write-protect
Jan 31 00:48:46 pushan kernel:   D0000-DFFFF uncachable
Jan 31 00:48:46 pushan kernel:   E0000-E7FFF write-through
Jan 31 00:48:46 pushan kernel:   E8000-FFFFF write-protect
Jan 31 00:48:46 pushan kernel: MTRR variable ranges enabled:
Jan 31 00:48:46 pushan kernel:   0 base 000000000 mask E00000000 write-back
Jan 31 00:48:46 pushan kernel:   1 base 200000000 mask FC0000000 write-back
Jan 31 00:48:46 pushan kernel:   2 base 0C0000000 mask FC0000000 uncachable
Jan 31 00:48:46 pushan kernel:   3 base 0BE000000 mask FFE000000 uncachable
Jan 31 00:48:46 pushan kernel:   4 disabled
Jan 31 00:48:46 pushan kernel:   5 disabled
Jan 31 00:48:46 pushan kernel:   6 disabled
Jan 31 00:48:46 pushan kernel:   7 disabled
Jan 31 00:48:46 pushan kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
Jan 31 00:48:46 pushan kernel: e820: update [mem 0xbe000000-0xffffffff] usable ==> reserved
Jan 31 00:48:46 pushan kernel: last_pfn = 0xbd480 max_arch_pfn = 0x400000000
Jan 31 00:48:46 pushan kernel: found SMP MP-table at [mem 0x000ff780-0x000ff78f]
Jan 31 00:48:46 pushan kernel: RAMDISK: [mem 0x3125d000-0x34925fff]
Jan 31 00:48:46 pushan kernel: ACPI: Early table checksum verification disabled
Jan 31 00:48:46 pushan kernel: ACPI: RSDP 0x00000000000FA480 000014 (v00 ACPIAM)
Jan 31 00:48:46 pushan kernel: ACPI: RSDT 0x00000000BD480000 000050 (v01 ACRSYS ACRPRDCT 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: FACP 0x00000000BD480200 000084 (v01 ACRSYS FACP1519 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: DSDT 0x00000000BD4805E0 0074BC (v01 1AEIL  1AEIL012 00000012 INTL 20051117)
Jan 31 00:48:46 pushan kernel: ACPI: FACS 0x00000000BD48E000 000040
Jan 31 00:48:46 pushan kernel: ACPI: APIC 0x00000000BD480390 00008C (v01 ACRSYS APIC1519 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: MCFG 0x00000000BD480420 00003C (v01 ACRSYS OEMMCFG  20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: SLIC 0x00000000BD480460 000176 (v01 ACRSYS ACRPRDCT 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: OEMB 0x00000000BD48E040 000072 (v01 ACRSYS OEMB1519 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: HPET 0x00000000BD48A5E0 000038 (v01 ACRSYS OEMHPET  20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: ASF! 0x00000000BD48A620 000099 (v32 LEGEND I865PASF 00000001 INTL 20051117)
Jan 31 00:48:46 pushan kernel: ACPI: DMAR 0x00000000BD48E0C0 000090 (v01 AMI    OEMDMAR  00000001 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: TCPA 0x00000000BD48A6C0 000032 (v01 ACRSYS TBLOEMID 00000001 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: AWMI 0x00000000BD49F770 000236 (v01 ACRSYS OEMB1519 20100527 MSFT 00000097)
Jan 31 00:48:46 pushan kernel: ACPI: SSDT 0x00000000BD4A2690 000363 (v01 DpgPmm CpuPm    00000012 INTL 20051117)
Jan 31 00:48:46 pushan kernel: ACPI: Local APIC address 0xfee00000
Jan 31 00:48:46 pushan kernel: No NUMA configuration found
Jan 31 00:48:46 pushan kernel: Faking a node at [mem 0x0000000000000000-0x000000023fffffff]
Jan 31 00:48:46 pushan kernel: NODE_DATA(0) allocated [mem 0x23ffd2000-0x23fffbfff]
Jan 31 00:48:46 pushan kernel: Zone ranges:
Jan 31 00:48:46 pushan kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Jan 31 00:48:46 pushan kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Jan 31 00:48:46 pushan kernel:   Normal   [mem 0x0000000100000000-0x000000023fffffff]
Jan 31 00:48:46 pushan kernel:   Device   empty
Jan 31 00:48:46 pushan kernel: Movable zone start for each node
Jan 31 00:48:46 pushan kernel: Early memory node ranges
Jan 31 00:48:46 pushan kernel:   node   0: [mem 0x0000000000001000-0x000000000009cfff]
Jan 31 00:48:46 pushan kernel:   node   0: [mem 0x0000000000100000-0x00000000bd47ffff]
Jan 31 00:48:46 pushan kernel:   node   0: [mem 0x0000000100000000-0x000000023fffffff]
Jan 31 00:48:46 pushan kernel: Zeroed struct page in unavailable ranges: 11236 pages
Jan 31 00:48:46 pushan kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000023fffffff]
Jan 31 00:48:46 pushan kernel: On node 0 totalpages: 2085916
Jan 31 00:48:46 pushan kernel:   DMA zone: 64 pages used for memmap
Jan 31 00:48:46 pushan kernel:   DMA zone: 21 pages reserved
Jan 31 00:48:46 pushan kernel:   DMA zone: 3996 pages, LIFO batch:0
Jan 31 00:48:46 pushan kernel:   DMA32 zone: 12050 pages used for memmap
Jan 31 00:48:46 pushan kernel:   DMA32 zone: 771200 pages, LIFO batch:63
Jan 31 00:48:46 pushan kernel:   Normal zone: 20480 pages used for memmap
Jan 31 00:48:46 pushan kernel:   Normal zone: 1310720 pages, LIFO batch:63
Jan 31 00:48:46 pushan kernel: ACPI: PM-Timer IO Port: 0x808
Jan 31 00:48:46 pushan kernel: ACPI: Local APIC address 0xfee00000
Jan 31 00:48:46 pushan kernel: IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
Jan 31 00:48:46 pushan kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Jan 31 00:48:46 pushan kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
Jan 31 00:48:46 pushan kernel: ACPI: IRQ0 used by override.
Jan 31 00:48:46 pushan kernel: ACPI: IRQ9 used by override.
Jan 31 00:48:46 pushan kernel: Using ACPI (MADT) for SMP configuration information
Jan 31 00:48:46 pushan kernel: ACPI: HPET id: 0x8086a701 base: 0xfed00000
Jan 31 00:48:46 pushan kernel: smpboot: Allowing 8 CPUs, 0 hotplug CPUs
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000e3fff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0x000e4000-0x000fffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbd480000-0xbd48dfff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbd48e000-0xbd4cffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbd4d0000-0xbd4dffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbd4e0000-0xbd4ecfff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbd4ed000-0xbdffffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xfed1ffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed3ffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfedfffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffafffff]
Jan 31 00:48:46 pushan kernel: PM: hibernation: Registered nosave memory: [mem 0xffb00000-0xffffffff]
Jan 31 00:48:46 pushan kernel: [mem 0xbe000000-0xfed1ffff] available for PCI devices
Jan 31 00:48:46 pushan kernel: Booting paravirtualized kernel on bare hardware
Jan 31 00:48:46 pushan kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Jan 31 00:48:46 pushan kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
Jan 31 00:48:46 pushan kernel: percpu: Embedded 54 pages/cpu s183960 r8192 d29032 u262144
Jan 31 00:48:46 pushan kernel: pcpu-alloc: s183960 r8192 d29032 u262144 alloc=1*2097152
Jan 31 00:48:46 pushan kernel: pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
Jan 31 00:48:46 pushan kernel: Built 1 zonelists, mobility grouping on.  Total pages: 2053301
Jan 31 00:48:46 pushan kernel: Policy zone: Normal
Jan 31 00:48:46 pushan kernel: Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.10.0-2-amd64 root=UUID=d0a8c377-99f3-4f84-a489-d8f046c3cbe0 ro quiet
Jan 31 00:48:46 pushan kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Jan 31 00:48:46 pushan kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
Jan 31 00:48:46 pushan kernel: mem auto-init: stack:off, heap alloc:on, heap free:off
Jan 31 00:48:46 pushan kernel: Memory: 3109876K/8343664K available (12295K kernel code, 2543K rwdata, 7512K rodata, 2388K init, 1672K bss, 300268K reserved, 0K cma-reserved)
Jan 31 00:48:46 pushan kernel: random: get_random_u64 called from __kmem_cache_create+0x2e/0x550 with crng_init=0
Jan 31 00:48:46 pushan kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
Jan 31 00:48:46 pushan kernel: Kernel/User page tables isolation: enabled
Jan 31 00:48:46 pushan kernel: ftrace: allocating 36107 entries in 142 pages
Jan 31 00:48:46 pushan kernel: ftrace: allocated 142 pages with 4 groups
Jan 31 00:48:46 pushan kernel: rcu: Hierarchical RCU implementation.
Jan 31 00:48:46 pushan kernel: rcu:         RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
Jan 31 00:48:46 pushan kernel:         Rude variant of Tasks RCU enabled.
Jan 31 00:48:46 pushan kernel:         Tracing variant of Tasks RCU enabled.
Jan 31 00:48:46 pushan kernel: rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
Jan 31 00:48:46 pushan kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
Jan 31 00:48:46 pushan kernel: NR_IRQS: 524544, nr_irqs: 488, preallocated irqs: 16
Jan 31 00:48:46 pushan kernel: Console: colour VGA+ 80x25
Jan 31 00:48:46 pushan kernel: printk: console [tty0] enabled
Jan 31 00:48:46 pushan kernel: ACPI: Core revision 20200925
Jan 31 00:48:46 pushan kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
Jan 31 00:48:46 pushan kernel: APIC: Switch to symmetric I/O mode setup
Jan 31 00:48:46 pushan kernel: DMAR: Host address width 36
Jan 31 00:48:46 pushan kernel: DMAR: DRHD base: 0x000000fed90000 flags: 0x1
Jan 31 00:48:46 pushan kernel: DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap c90780106f0462 ecap f020e2
Jan 31 00:48:46 pushan kernel: DMAR: RMRR base: 0x000000000e4000 end: 0x000000000e6fff
Jan 31 00:48:46 pushan kernel: DMAR: RMRR base: 0x000000bd4ed000 end: 0x000000bd4fffff
Jan 31 00:48:46 pushan kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Jan 31 00:48:46 pushan kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2a2c7a752d4, max_idle_ns: 440795335963 ns
Jan 31 00:48:46 pushan kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 5851.60 BogoMIPS (lpj=11703212)
Jan 31 00:48:46 pushan kernel: pid_max: default: 32768 minimum: 301
Jan 31 00:48:46 pushan kernel: LSM: Security Framework initializing
Jan 31 00:48:46 pushan kernel: Yama: disabled by default; enable with sysctl kernel.yama.*
Jan 31 00:48:46 pushan kernel: AppArmor: AppArmor initialized
Jan 31 00:48:46 pushan kernel: TOMOYO Linux initialized
Jan 31 00:48:46 pushan kernel: Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jan 31 00:48:46 pushan kernel: Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jan 31 00:48:46 pushan kernel: Disabled fast string operations
Jan 31 00:48:46 pushan kernel: mce: CPU0: Thermal monitoring enabled (TM1)
Jan 31 00:48:46 pushan kernel: Last level iTLB entries: 4KB 512, 2MB 7, 4MB 7
Jan 31 00:48:46 pushan kernel: Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
Jan 31 00:48:46 pushan kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Jan 31 00:48:46 pushan kernel: Spectre V2 : Mitigation: Full generic retpoline
Jan 31 00:48:46 pushan kernel: Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Jan 31 00:48:46 pushan kernel: Spectre V2 : Enabling Restricted Speculation for firmware calls
Jan 31 00:48:46 pushan kernel: Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Jan 31 00:48:46 pushan kernel: Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
Jan 31 00:48:46 pushan kernel: Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
Jan 31 00:48:46 pushan kernel: MDS: Vulnerable: Clear CPU buffers attempted, no microcode
Jan 31 00:48:46 pushan kernel: Freeing SMP alternatives memory: 32K
Jan 31 00:48:46 pushan kernel: smpboot: CPU0: Intel(R) Core(TM) i7 CPU         870  @ 2.93GHz (family: 0x6, model: 0x1e, stepping: 0x5)
Jan 31 00:48:46 pushan kernel: Performance Events: PEBS fmt1+, Nehalem events, 16-deep LBR, Intel PMU driver.
Jan 31 00:48:46 pushan kernel: core: CPU erratum AAJ80 worked around
Jan 31 00:48:46 pushan kernel: core: CPUID marked event: 'bus cycles' unavailable
Jan 31 00:48:46 pushan kernel: ... version:                3
Jan 31 00:48:46 pushan kernel: ... bit width:              48
Jan 31 00:48:46 pushan kernel: ... generic registers:      4
Jan 31 00:48:46 pushan kernel: ... value mask:             0000ffffffffffff
Jan 31 00:48:46 pushan kernel: ... max period:             000000007fffffff
Jan 31 00:48:46 pushan kernel: ... fixed-purpose events:   3
Jan 31 00:48:46 pushan kernel: ... event mask:             000000070000000f
Jan 31 00:48:46 pushan kernel: rcu: Hierarchical SRCU implementation.
Jan 31 00:48:46 pushan kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Jan 31 00:48:46 pushan kernel: smp: Bringing up secondary CPUs ...
Jan 31 00:48:46 pushan kernel: x86: Booting SMP configuration:
Jan 31 00:48:46 pushan kernel: .... node  #0, CPUs:      #1 #2 #3 #4
Jan 31 00:48:46 pushan kernel: MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
Jan 31 00:48:46 pushan kernel:  #5 #6 #7
Jan 31 00:48:46 pushan kernel: smp: Brought up 1 node, 8 CPUs
Jan 31 00:48:46 pushan kernel: smpboot: Max logical packages: 1
Jan 31 00:48:46 pushan kernel: smpboot: Total of 8 processors activated (46812.84 BogoMIPS)
Jan 31 00:48:46 pushan kernel: node 0 deferred pages initialised in 12ms
Jan 31 00:48:46 pushan kernel: devtmpfs: initialized
Jan 31 00:48:46 pushan kernel: x86/mm: Memory block size: 128MB
Jan 31 00:48:46 pushan kernel: PM: Registering ACPI NVS region [mem 0xbd48e000-0xbd4cffff] (270336 bytes)
Jan 31 00:48:46 pushan kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Jan 31 00:48:46 pushan kernel: futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
Jan 31 00:48:46 pushan kernel: pinctrl core: initialized pinctrl subsystem
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 16
Jan 31 00:48:46 pushan kernel: audit: initializing netlink subsys (disabled)
Jan 31 00:48:46 pushan kernel: audit: type=2000 audit(1612054119.164:1): state=initialized audit_enabled=0 res=1
Jan 31 00:48:46 pushan kernel: thermal_sys: Registered thermal governor 'fair_share'
Jan 31 00:48:46 pushan kernel: thermal_sys: Registered thermal governor 'bang_bang'
Jan 31 00:48:46 pushan kernel: thermal_sys: Registered thermal governor 'step_wise'
Jan 31 00:48:46 pushan kernel: thermal_sys: Registered thermal governor 'user_space'
Jan 31 00:48:46 pushan kernel: thermal_sys: Registered thermal governor 'power_allocator'
Jan 31 00:48:46 pushan kernel: cpuidle: using governor ladder
Jan 31 00:48:46 pushan kernel: cpuidle: using governor menu
Jan 31 00:48:46 pushan kernel: ACPI: bus type PCI registered
Jan 31 00:48:46 pushan kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Jan 31 00:48:46 pushan kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Jan 31 00:48:46 pushan kernel: PCI: not using MMCONFIG
Jan 31 00:48:46 pushan kernel: PCI: Using configuration type 1 for base access
Jan 31 00:48:46 pushan kernel: HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Module Device)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Processor Device)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Processor Aggregator Device)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Linux-Dell-Video)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Jan 31 00:48:46 pushan kernel: ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
Jan 31 00:48:46 pushan kernel: ACPI: 2 ACPI AML tables successfully acquired and loaded
Jan 31 00:48:46 pushan kernel: ACPI: Dynamic OEM Table Load:
Jan 31 00:48:46 pushan kernel: ACPI: SSDT 0xFFFF9C0000B08000 00265C (v01 DpgPmm P001Ist  00000011 INTL 20051117)
Jan 31 00:48:46 pushan kernel: ACPI: Dynamic OEM Table Load:
Jan 31 00:48:46 pushan kernel: ACPI: SSDT 0xFFFF9C00008BA800 000678 (v01 PmRef  P001Cst  00003001 INTL 20051117)
Jan 31 00:48:46 pushan kernel: ACPI: Interpreter enabled
Jan 31 00:48:46 pushan kernel: ACPI: (supports S0 S3 S4 S5)
Jan 31 00:48:46 pushan kernel: ACPI: Using IOAPIC for interrupt routing
Jan 31 00:48:46 pushan kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Jan 31 00:48:46 pushan kernel: PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
Jan 31 00:48:46 pushan kernel: pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
Jan 31 00:48:46 pushan kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Jan 31 00:48:46 pushan kernel: ACPI: Enabled 15 GPEs in block 00 to 3F
Jan 31 00:48:46 pushan kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Jan 31 00:48:46 pushan kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
Jan 31 00:48:46 pushan kernel: acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME LTR]
Jan 31 00:48:46 pushan kernel: acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
Jan 31 00:48:46 pushan kernel: PCI host bridge to bus 0000:00
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000dffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [mem 0xbe000000-0xdfffffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfed8ffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:00.0: [8086:d131] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: [8086:d138] type 01 class 0x060400
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: enabling Extended Tags
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.0: [8086:d155] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.1: [8086:d156] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.2: [8086:d157] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.3: [8086:d158] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:10.0: [8086:d150] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:10.1: [8086:d151] type 00 class 0x088000
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.0: [8086:3b64] type 00 class 0x078000
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.0: reg 0x10: [mem 0xfaefe000-0xfaefe00f 64bit]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: [8086:3b66] type 00 class 0x010185
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: reg 0x10: [io  0xdc00-0xdc07]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: reg 0x14: [io  0xd880-0xd883]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: reg 0x18: [io  0xd800-0xd807]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: reg 0x1c: [io  0xd480-0xd483]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: reg 0x20: [io  0xd400-0xd40f]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.3: [8086:3b67] type 00 class 0x070002
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.3: reg 0x10: [io  0xd080-0xd087]
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.3: reg 0x14: [mem 0xfaefc000-0xfaefcfff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: [8086:10ef] type 00 class 0x020000
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: reg 0x10: [mem 0xfaec0000-0xfaedffff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: reg 0x14: [mem 0xfaefa000-0xfaefafff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: reg 0x18: [io  0xd000-0xd01f]
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:1a.0: [8086:3b3c] type 00 class 0x0c0320
Jan 31 00:48:46 pushan kernel: pci 0000:00:1a.0: reg 0x10: [mem 0xfaef8000-0xfaef83ff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:1b.0: [8086:3b56] type 00 class 0x040300
Jan 31 00:48:46 pushan kernel: pci 0000:00:1b.0: reg 0x10: [mem 0xfaef4000-0xfaef7fff 64bit]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:1d.0: [8086:3b34] type 00 class 0x0c0320
Jan 31 00:48:46 pushan kernel: pci 0000:00:1d.0: reg 0x10: [mem 0xfaef2000-0xfaef23ff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.0: [8086:3b0a] type 00 class 0x060100
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: [8086:3b22] type 00 class 0x010601
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x10: [io  0xcc00-0xcc07]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x14: [io  0xc880-0xc883]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x18: [io  0xc800-0xc807]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x1c: [io  0xc480-0xc483]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x20: [io  0xc400-0xc41f]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: reg 0x24: [mem 0xfaef0000-0xfaef07ff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: PME# supported from D3hot
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.3: [8086:3b30] type 00 class 0x0c0500
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.3: reg 0x10: [mem 0xfaeee000-0xfaeee0ff 64bit]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.3: reg 0x20: [io  0x0400-0x041f]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: [10de:0ca5] type 00 class 0x030000
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: reg 0x10: [mem 0xfb000000-0xfbffffff]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit pref]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: reg 0x1c: [mem 0xce000000-0xcfffffff 64bit pref]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: reg 0x24: [io  0xec00-0xec7f]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: reg 0x30: [mem 0xfaf80000-0xfaffffff pref]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: enabling Extended Tags
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.1: [10de:0be4] type 00 class 0x040300
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.1: reg 0x10: [mem 0xfaf7c000-0xfaf7ffff]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.1: enabling Extended Tags
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: PCI bridge to [bus 01]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [io  0xe000-0xefff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [mem 0xfaf00000-0xfbffffff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [mem 0xce000000-0xdfffffff 64bit pref]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: extended config space not accessible
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0: PCI bridge to [bus 02] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7 window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [mem 0x000d0000-0x000dffff window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [mem 0xbe000000-0xdfffffff window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0:   bridge window [mem 0xf0000000-0xfed8ffff window] (subtractive decode)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 6 7 *10 11 12 14 15)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs *5)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 6 7 10 *11 12 14 15)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 6 7 10 *11 12 14 15)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 6 7 10 11 12 14 *15)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 6 7 10 11 12 14 15) *0, disabled.
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 6 7 10 11 12 *14 15)
Jan 31 00:48:46 pushan kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 6 7 *10 11 12 14 15)
Jan 31 00:48:46 pushan kernel: iommu: Default domain type: Translated 
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: vgaarb: setting as boot VGA device
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: vgaarb: bridge control possible
Jan 31 00:48:46 pushan kernel: vgaarb: loaded
Jan 31 00:48:46 pushan kernel: EDAC MC: Ver: 3.0.0
Jan 31 00:48:46 pushan kernel: NetLabel: Initializing
Jan 31 00:48:46 pushan kernel: NetLabel:  domain hash size = 128
Jan 31 00:48:46 pushan kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
Jan 31 00:48:46 pushan kernel: NetLabel:  unlabeled traffic allowed by default
Jan 31 00:48:46 pushan kernel: PCI: Using ACPI for IRQ routing
Jan 31 00:48:46 pushan kernel: PCI: Discovered peer bus ff
Jan 31 00:48:46 pushan kernel: PCI: root bus ff: using default resources
Jan 31 00:48:46 pushan kernel: PCI: Probing PCI hardware (bus ff)
Jan 31 00:48:46 pushan kernel: PCI host bridge to bus 0000:ff
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: root bus resource [io  0x0000-0xffff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: root bus resource [mem 0x00000000-0xfffffffff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: No busn resource found for root bus, will use [bus ff-ff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: busn_res: can not insert [bus ff] under domain [bus 00-ff] (conflicts with (null) [bus 00-ff])
Jan 31 00:48:46 pushan kernel: pci 0000:ff:00.0: [8086:2c51] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:00.1: [8086:2c81] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:02.0: [8086:2c90] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:02.1: [8086:2c91] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.0: [8086:2c98] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.1: [8086:2c99] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.4: [8086:2c9c] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.0: [8086:2ca0] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.1: [8086:2ca1] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.2: [8086:2ca2] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.3: [8086:2ca3] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.0: [8086:2ca8] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.1: [8086:2ca9] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.2: [8086:2caa] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.3: [8086:2cab] type 00 class 0x060000
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: busn_res: [bus ff] end is updated to ff
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: busn_res: can not insert [bus ff] under domain [bus 00-ff] (conflicts with (null) [bus 00-ff])
Jan 31 00:48:46 pushan kernel: PCI: pci_cache_line_size set to 64 bytes
Jan 31 00:48:46 pushan kernel: e820: reserve RAM buffer [mem 0x0009dc00-0x0009ffff]
Jan 31 00:48:46 pushan kernel: e820: reserve RAM buffer [mem 0xbd480000-0xbfffffff]
Jan 31 00:48:46 pushan kernel: hpet: 8 channels of 5 reserved for per-cpu timers
Jan 31 00:48:46 pushan kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 24, 25, 26, 27, 28
Jan 31 00:48:46 pushan kernel: hpet0: 8 comparators, 64-bit 14.318180 MHz counter
Jan 31 00:48:46 pushan kernel: clocksource: Switched to clocksource tsc-early
Jan 31 00:48:46 pushan kernel: VFS: Disk quotas dquot_6.6.0
Jan 31 00:48:46 pushan kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Jan 31 00:48:46 pushan kernel: AppArmor: AppArmor Filesystem Enabled
Jan 31 00:48:46 pushan kernel: pnp: PnP ACPI init
Jan 31 00:48:46 pushan kernel: system 00:00: [mem 0xfc000000-0xfcffffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:00: [mem 0xfd000000-0xfdffffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:00: [mem 0xfe000000-0xfebfffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:00: [mem 0xfed14000-0xfed19fff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:02: [dma 0 disabled]
Jan 31 00:48:46 pushan kernel: pnp 00:02: Plug and Play ACPI device, IDs PNP0501 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:03: [dma 0 disabled]
Jan 31 00:48:46 pushan kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0501 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:04: [dma 0 disabled]
Jan 31 00:48:46 pushan kernel: pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0f03 PNP0f13 (active)
Jan 31 00:48:46 pushan kernel: system 00:06: [io  0x0a00-0x0a0f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:06: [io  0x0a10-0x0a1f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:06: [io  0x0a20-0x0a2f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:06: [io  0x0a30-0x0a3f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
Jan 31 00:48:46 pushan kernel: system 00:07: [io  0x04d0-0x04d1] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: [io  0x0800-0x087f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: [io  0x0500-0x057f] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: [mem 0xfed1c000-0xfed1ffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: [mem 0xfed45000-0xfed8ffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
Jan 31 00:48:46 pushan kernel: system 00:08: [mem 0xffc00000-0xffefffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
Jan 31 00:48:46 pushan kernel: system 00:09: [mem 0xfec00000-0xfec00fff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:09: [mem 0xfee00000-0xfee00fff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
Jan 31 00:48:46 pushan kernel: pnp 00:0a: Plug and Play ACPI device, IDs PNP0c31 (active)
Jan 31 00:48:46 pushan kernel: system 00:0b: [mem 0xe0000000-0xefffffff] has been reserved
Jan 31 00:48:46 pushan kernel: system 00:0b: Plug and Play ACPI device, IDs PNP0c02 (active)
Jan 31 00:48:46 pushan kernel: system 00:0c: [mem 0x00000000-0x0009ffff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:0c: [mem 0x000c0000-0x000cffff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:0c: [mem 0x000e0000-0x000fffff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:0c: [mem 0x00100000-0xbdffffff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:0c: [mem 0xfed90000-0xffffffff] could not be reserved
Jan 31 00:48:46 pushan kernel: system 00:0c: Plug and Play ACPI device, IDs PNP0c01 (active)
Jan 31 00:48:46 pushan kernel: pnp: PnP ACPI: found 13 devices
Jan 31 00:48:46 pushan kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 2
Jan 31 00:48:46 pushan kernel: tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
Jan 31 00:48:46 pushan kernel: TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
Jan 31 00:48:46 pushan kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Jan 31 00:48:46 pushan kernel: TCP: Hash tables configured (established 65536 bind 65536)
Jan 31 00:48:46 pushan kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jan 31 00:48:46 pushan kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 1
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 44
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: PCI bridge to [bus 01]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [io  0xe000-0xefff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [mem 0xfaf00000-0xfbffffff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0:   bridge window [mem 0xce000000-0xdfffffff 64bit pref]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0: PCI bridge to [bus 02]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 7 [mem 0x000d0000-0x000dffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 8 [mem 0xbe000000-0xdfffffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfed8ffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:01: resource 1 [mem 0xfaf00000-0xfbffffff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:01: resource 2 [mem 0xce000000-0xdfffffff 64bit pref]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 4 [io  0x0000-0x0cf7 window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 5 [io  0x0d00-0xffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 6 [mem 0x000a0000-0x000bffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 7 [mem 0x000d0000-0x000dffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 8 [mem 0xbe000000-0xdfffffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:02: resource 9 [mem 0xf0000000-0xfed8ffff window]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: resource 4 [io  0x0000-0xffff]
Jan 31 00:48:46 pushan kernel: pci_bus 0000:ff: resource 5 [mem 0x00000000-0xfffffffff]
Jan 31 00:48:46 pushan kernel: pci 0000:00:1a.0: quirk_usb_early_handoff+0x0/0x700 took 30607 usecs
Jan 31 00:48:46 pushan kernel: pci 0000:00:1d.0: quirk_usb_early_handoff+0x0/0x700 took 27325 usecs
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
Jan 31 00:48:46 pushan kernel: PCI: CLS 32 bytes, default 64
Jan 31 00:48:46 pushan kernel: Trying to unpack rootfs image as initramfs...
Jan 31 00:48:46 pushan kernel: random: fast init done
Jan 31 00:48:46 pushan kernel: Freeing initrd memory: 56100K
Jan 31 00:48:46 pushan kernel: DMAR: No ATSR found
Jan 31 00:48:46 pushan kernel: DMAR: dmar0: Using Queued invalidation
Jan 31 00:48:46 pushan kernel: pci 0000:00:00.0: Adding to iommu group 0
Jan 31 00:48:46 pushan kernel: pci 0000:00:03.0: Adding to iommu group 1
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.0: Adding to iommu group 2
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.1: Adding to iommu group 3
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.2: Adding to iommu group 4
Jan 31 00:48:46 pushan kernel: pci 0000:00:08.3: Adding to iommu group 5
Jan 31 00:48:46 pushan kernel: pci 0000:00:10.0: Adding to iommu group 6
Jan 31 00:48:46 pushan kernel: pci 0000:00:10.1: Adding to iommu group 6
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.0: Adding to iommu group 7
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.2: Adding to iommu group 7
Jan 31 00:48:46 pushan kernel: pci 0000:00:16.3: Adding to iommu group 7
Jan 31 00:48:46 pushan kernel: pci 0000:00:19.0: Adding to iommu group 8
Jan 31 00:48:46 pushan kernel: pci 0000:00:1a.0: Adding to iommu group 9
Jan 31 00:48:46 pushan kernel: pci 0000:00:1b.0: Adding to iommu group 10
Jan 31 00:48:46 pushan kernel: pci 0000:00:1d.0: Adding to iommu group 11
Jan 31 00:48:46 pushan kernel: pci 0000:00:1e.0: Adding to iommu group 12
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.0: Adding to iommu group 13
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.2: Adding to iommu group 13
Jan 31 00:48:46 pushan kernel: pci 0000:00:1f.3: Adding to iommu group 13
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.0: Adding to iommu group 14
Jan 31 00:48:46 pushan kernel: pci 0000:01:00.1: Adding to iommu group 14
Jan 31 00:48:46 pushan kernel: pci 0000:ff:00.0: Adding to iommu group 15
Jan 31 00:48:46 pushan kernel: pci 0000:ff:00.1: Adding to iommu group 15
Jan 31 00:48:46 pushan kernel: pci 0000:ff:02.0: Adding to iommu group 16
Jan 31 00:48:46 pushan kernel: pci 0000:ff:02.1: Adding to iommu group 16
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.0: Adding to iommu group 17
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.1: Adding to iommu group 17
Jan 31 00:48:46 pushan kernel: pci 0000:ff:03.4: Adding to iommu group 17
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.0: Adding to iommu group 18
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.1: Adding to iommu group 18
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.2: Adding to iommu group 18
Jan 31 00:48:46 pushan kernel: pci 0000:ff:04.3: Adding to iommu group 18
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.0: Adding to iommu group 19
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.1: Adding to iommu group 19
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.2: Adding to iommu group 19
Jan 31 00:48:46 pushan kernel: pci 0000:ff:05.3: Adding to iommu group 19
Jan 31 00:48:46 pushan kernel: DMAR: Intel(R) Virtualization Technology for Directed I/O
Jan 31 00:48:46 pushan kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
Jan 31 00:48:46 pushan kernel: software IO TLB: mapped [mem 0x00000000b9480000-0x00000000bd480000] (64MB)
Jan 31 00:48:46 pushan kernel: Initialise system trusted keyrings
Jan 31 00:48:46 pushan kernel: Key type blacklist registered
Jan 31 00:48:46 pushan kernel: workingset: timestamp_bits=36 max_order=21 bucket_order=0
Jan 31 00:48:46 pushan kernel: zbud: loaded
Jan 31 00:48:46 pushan kernel: integrity: Platform Keyring initialized
Jan 31 00:48:46 pushan kernel: Key type asymmetric registered
Jan 31 00:48:46 pushan kernel: Asymmetric key parser 'x509' registered
Jan 31 00:48:46 pushan kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
Jan 31 00:48:46 pushan kernel: io scheduler mq-deadline registered
Jan 31 00:48:46 pushan kernel: pcieport 0000:00:03.0: AER: enabled with IRQ 30
Jan 31 00:48:46 pushan kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Jan 31 00:48:46 pushan kernel: intel_idle: Please enable MWAIT in BIOS SETUP
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P001: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P002: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P003: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P004: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P005: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P006: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P007: Found 3 idle states
Jan 31 00:48:46 pushan kernel: ACPI: \_PR_.P008: Found 3 idle states
Jan 31 00:48:46 pushan kernel: thermal LNXTHERM:00: registered as thermal_zone0
Jan 31 00:48:46 pushan kernel: ACPI: Thermal Zone [THRM] (30 C)
Jan 31 00:48:46 pushan kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Jan 31 00:48:46 pushan kernel: 00:02: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
Jan 31 00:48:46 pushan kernel: 00:03: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
Jan 31 00:48:46 pushan kernel: 0000:00:16.3: ttyS2 at I/O 0xd080 (irq = 17, base_baud = 115200) is a 16550A
Jan 31 00:48:46 pushan kernel: Linux agpgart interface v0.103
Jan 31 00:48:46 pushan kernel: AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
Jan 31 00:48:46 pushan kernel: AMD-Vi: AMD IOMMUv2 functionality not available on this system
Jan 31 00:48:46 pushan kernel: i8042: PNP: PS/2 Controller [PNP0f03:PS2M] at 0x60,0x64 irq 12
Jan 31 00:48:46 pushan kernel: i8042: PNP: PS/2 controller doesn't have KBD irq; using default 1
Jan 31 00:48:46 pushan kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Jan 31 00:48:46 pushan kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Jan 31 00:48:46 pushan kernel: mousedev: PS/2 mouse device common for all mice
Jan 31 00:48:46 pushan kernel: rtc_cmos 00:01: RTC can wake from S4
Jan 31 00:48:46 pushan kernel: rtc_cmos 00:01: registered as rtc0
Jan 31 00:48:46 pushan kernel: rtc_cmos 00:01: setting system clock to 2021-01-31T00:48:40 UTC (1612054120)
Jan 31 00:48:46 pushan kernel: rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
Jan 31 00:48:46 pushan kernel: intel_pstate: CPU model not supported
Jan 31 00:48:46 pushan kernel: ledtrig-cpu: registered to indicate activity on CPUs
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 10
Jan 31 00:48:46 pushan kernel: Segment Routing with IPv6
Jan 31 00:48:46 pushan kernel: mip6: Mobile IPv6
Jan 31 00:48:46 pushan kernel: NET: Registered protocol family 17
Jan 31 00:48:46 pushan kernel: mpls_gso: MPLS GSO support
Jan 31 00:48:46 pushan kernel: microcode: sig=0x106e5, pf=0x2, revision=0xa
Jan 31 00:48:46 pushan kernel: microcode: Microcode Update Driver: v2.2.
Jan 31 00:48:46 pushan kernel: IPI shorthand broadcast: enabled
Jan 31 00:48:46 pushan kernel: sched_clock: Marking stable (1427172833, 4505821)->(1434787044, -3108390)
Jan 31 00:48:46 pushan kernel: registered taskstats version 1
Jan 31 00:48:46 pushan kernel: Loading compiled-in X.509 certificates
Jan 31 00:48:46 pushan kernel: Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
Jan 31 00:48:46 pushan kernel: Loaded X.509 cert 'Debian Secure Boot Signer 2020: 00b55eb3b9'
Jan 31 00:48:46 pushan kernel: zswap: loaded using pool lzo/zbud
Jan 31 00:48:46 pushan kernel: Key type ._fscrypt registered
Jan 31 00:48:46 pushan kernel: Key type .fscrypt registered
Jan 31 00:48:46 pushan kernel: Key type fscrypt-provisioning registered
Jan 31 00:48:46 pushan kernel: AppArmor: AppArmor sha1 policy hashing enabled
Jan 31 00:48:46 pushan kernel: Freeing unused kernel image (initmem) memory: 2388K
Jan 31 00:48:46 pushan kernel: Write protecting the kernel read-only data: 22528k
Jan 31 00:48:46 pushan kernel: Freeing unused kernel image (text/rodata gap) memory: 2040K
Jan 31 00:48:46 pushan kernel: Freeing unused kernel image (rodata/data gap) memory: 680K
Jan 31 00:48:46 pushan kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
Jan 31 00:48:46 pushan kernel: x86/mm: Checking user space page tables
Jan 31 00:48:46 pushan kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
Jan 31 00:48:46 pushan kernel: Run /init as init process
Jan 31 00:48:46 pushan kernel:   with arguments:
Jan 31 00:48:46 pushan kernel:     /init
Jan 31 00:48:46 pushan kernel:   with environment:
Jan 31 00:48:46 pushan kernel:     HOME=/
Jan 31 00:48:46 pushan kernel:     TERM=linux
Jan 31 00:48:46 pushan kernel:     BOOT_IMAGE=/boot/vmlinuz-5.10.0-2-amd64
Jan 31 00:48:46 pushan kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2
Jan 31 00:48:46 pushan kernel: ACPI: Power Button [PWRB]
Jan 31 00:48:46 pushan kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
Jan 31 00:48:46 pushan kernel: pps_core: LinuxPPS API ver. 1 registered
Jan 31 00:48:46 pushan kernel: pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Jan 31 00:48:46 pushan kernel: PTP clock support registered
Jan 31 00:48:46 pushan kernel: ACPI Warning: SystemIO range 0x0000000000000828-0x000000000000082F conflicts with OpRegion 0x0000000000000800-0x000000000000084F (\PMRG) (20200925/utaddress-204)
Jan 31 00:48:46 pushan kernel: ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Jan 31 00:48:46 pushan kernel: lpc_ich: Resource conflict(s) found affecting gpio_ich
Jan 31 00:48:46 pushan kernel: i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
Jan 31 00:48:46 pushan kernel: i2c i2c-0: 4/4 memory slots populated (from DMI)
Jan 31 00:48:46 pushan kernel: i2c i2c-0: Successfully instantiated SPD at 0x50
Jan 31 00:48:46 pushan kernel: i2c i2c-0: Successfully instantiated SPD at 0x51
Jan 31 00:48:46 pushan kernel: i2c i2c-0: Successfully instantiated SPD at 0x52
Jan 31 00:48:46 pushan kernel: i2c i2c-0: Successfully instantiated SPD at 0x53
Jan 31 00:48:46 pushan kernel: SCSI subsystem initialized
Jan 31 00:48:46 pushan kernel: ACPI: Power Button [PWRF]
Jan 31 00:48:46 pushan kernel: e1000e: Intel(R) PRO/1000 Network Driver
Jan 31 00:48:46 pushan kernel: e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
Jan 31 00:48:46 pushan kernel: e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
Jan 31 00:48:46 pushan kernel: ACPI: bus type USB registered
Jan 31 00:48:46 pushan kernel: usbcore: registered new interface driver usbfs
Jan 31 00:48:46 pushan kernel: usbcore: registered new interface driver hub
Jan 31 00:48:46 pushan kernel: usbcore: registered new device driver usb
Jan 31 00:48:46 pushan kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Jan 31 00:48:46 pushan kernel: ehci-pci: EHCI PCI platform driver
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: EHCI Host Controller
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: debug port 2
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: cache line size of 32 is not supported
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: irq 16, io mem 0xfaef8000
Jan 31 00:48:46 pushan kernel: libata version 3.00 loaded.
Jan 31 00:48:46 pushan kernel: scsi host0: ata_generic
Jan 31 00:48:46 pushan kernel: scsi host1: ata_generic
Jan 31 00:48:46 pushan kernel: ata1: PATA max UDMA/100 cmd 0xdc00 ctl 0xd880 bmdma 0xd400 irq 18
Jan 31 00:48:46 pushan kernel: ata2: PATA max UDMA/100 cmd 0xd800 ctl 0xd480 bmdma 0xd408 irq 18
Jan 31 00:48:46 pushan kernel: ahci 0000:00:1f.2: version 3.0
Jan 31 00:48:46 pushan kernel: ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
Jan 31 00:48:46 pushan kernel: ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 3 Gbps 0x3f impl SATA mode
Jan 31 00:48:46 pushan kernel: ahci 0000:00:1f.2: flags: 64bit ncq sntf stag pm led clo pio slum part ems sxs apst 
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
Jan 31 00:48:46 pushan kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Jan 31 00:48:46 pushan kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jan 31 00:48:46 pushan kernel: usb usb1: Product: EHCI Host Controller
Jan 31 00:48:46 pushan kernel: usb usb1: Manufacturer: Linux 5.10.0-2-amd64 ehci_hcd
Jan 31 00:48:46 pushan kernel: usb usb1: SerialNumber: 0000:00:1a.0
Jan 31 00:48:46 pushan kernel: hub 1-0:1.0: USB hub found
Jan 31 00:48:46 pushan kernel: hub 1-0:1.0: 3 ports detected
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: EHCI Host Controller
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: debug port 2
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: cache line size of 32 is not supported
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: irq 23, io mem 0xfaef2000
Jan 31 00:48:46 pushan kernel: ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
Jan 31 00:48:46 pushan kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
Jan 31 00:48:46 pushan kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jan 31 00:48:46 pushan kernel: usb usb2: Product: EHCI Host Controller
Jan 31 00:48:46 pushan kernel: usb usb2: Manufacturer: Linux 5.10.0-2-amd64 ehci_hcd
Jan 31 00:48:46 pushan kernel: usb usb2: SerialNumber: 0000:00:1d.0
Jan 31 00:48:46 pushan kernel: hub 2-0:1.0: USB hub found
Jan 31 00:48:46 pushan kernel: hub 2-0:1.0: 3 ports detected
Jan 31 00:48:46 pushan kernel: scsi host2: ahci
Jan 31 00:48:46 pushan kernel: scsi host3: ahci
Jan 31 00:48:46 pushan kernel: scsi host4: ahci
Jan 31 00:48:46 pushan kernel: scsi host5: ahci
Jan 31 00:48:46 pushan kernel: scsi host6: ahci
Jan 31 00:48:46 pushan kernel: scsi host7: ahci
Jan 31 00:48:46 pushan kernel: ata3: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0100 irq 32
Jan 31 00:48:46 pushan kernel: ata4: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0180 irq 32
Jan 31 00:48:46 pushan kernel: ata5: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0200 irq 32
Jan 31 00:48:46 pushan kernel: ata6: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0280 irq 32
Jan 31 00:48:46 pushan kernel: ata7: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0300 irq 32
Jan 31 00:48:46 pushan kernel: ata8: SATA max UDMA/133 abar m2048@0xfaef0000 port 0xfaef0380 irq 32
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga console
Jan 31 00:48:46 pushan kernel: Console: switching to colour dummy device 80x25
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: NVIDIA GT215 (0a3280a2)
Jan 31 00:48:46 pushan kernel: e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 10:78:d2:7b:af:dc
Jan 31 00:48:46 pushan kernel: e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
Jan 31 00:48:46 pushan kernel: e1000e 0000:00:19.0 eth0: MAC: 9, PHY: 9, PBA No: FFFFFF-0FF
Jan 31 00:48:46 pushan kernel: e1000e 0000:00:19.0 enp0s25: renamed from eth0
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: bios: version 70.15.4e.00.00
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: fb: 1024 MiB DDR2
Jan 31 00:48:46 pushan kernel: usb 1-1: new high-speed USB device number 2 using ehci-pci
Jan 31 00:48:46 pushan kernel: usb 2-1: new high-speed USB device number 2 using ehci-pci
Jan 31 00:48:46 pushan kernel: ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
Jan 31 00:48:46 pushan kernel: ata3.00: ATA-8: ST3320418AS, CC46, max UDMA/133
Jan 31 00:48:46 pushan kernel: ata3.00: 625142448 sectors, multi 0: LBA48 NCQ (depth 32)
Jan 31 00:48:46 pushan kernel: ata3.00: configured for UDMA/133
Jan 31 00:48:46 pushan kernel: scsi 2:0:0:0: Direct-Access     ATA      ST3320418AS      CC46 PQ: 0 ANSI: 5
Jan 31 00:48:46 pushan kernel: usb 1-1: New USB device found, idVendor=8087, idProduct=0020, bcdDevice= 0.00
Jan 31 00:48:46 pushan kernel: usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
Jan 31 00:48:46 pushan kernel: hub 1-1:1.0: USB hub found
Jan 31 00:48:46 pushan kernel: hub 1-1:1.0: 6 ports detected
Jan 31 00:48:46 pushan kernel: usb 2-1: New USB device found, idVendor=8087, idProduct=0020, bcdDevice= 0.00
Jan 31 00:48:46 pushan kernel: usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
Jan 31 00:48:46 pushan kernel: hub 2-1:1.0: USB hub found
Jan 31 00:48:46 pushan kernel: hub 2-1:1.0: 8 ports detected
Jan 31 00:48:46 pushan kernel: tsc: Refined TSC clocksource calibration: 2925.999 MHz
Jan 31 00:48:46 pushan kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2a2d33743a4, max_idle_ns: 440795298620 ns
Jan 31 00:48:46 pushan kernel: clocksource: Switched to clocksource tsc
Jan 31 00:48:46 pushan kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Jan 31 00:48:46 pushan kernel: ata4.00: ATAPI: HL-DT-ST DVDRAM GH22NS50, TN02, max UDMA/100
Jan 31 00:48:46 pushan kernel: ata4.00: configured for UDMA/100
Jan 31 00:48:46 pushan kernel: scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH22NS50  TN02 PQ: 0 ANSI: 5
Jan 31 00:48:46 pushan kernel: usb 1-1.3: new full-speed USB device number 3 using ehci-pci
Jan 31 00:48:46 pushan kernel: usb 2-1.3: new low-speed USB device number 3 using ehci-pci
Jan 31 00:48:46 pushan kernel: usb 2-1.3: New USB device found, idVendor=0461, idProduct=0010, bcdDevice= 1.04
Jan 31 00:48:46 pushan kernel: usb 2-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Jan 31 00:48:46 pushan kernel: usb 2-1.3: Product: USB Keyboard
Jan 31 00:48:46 pushan kernel: usb 2-1.3: Manufacturer: NOVATEK
Jan 31 00:48:46 pushan kernel: hid: raw HID events driver (C) Jiri Kosina
Jan 31 00:48:46 pushan kernel: usbcore: registered new interface driver usbhid
Jan 31 00:48:46 pushan kernel: usbhid: USB HID core driver
Jan 31 00:48:46 pushan kernel: input: NOVATEK USB Keyboard as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.3/2-1.3:1.0/0003:0461:0010.0001/input/input5
Jan 31 00:48:46 pushan kernel: usb 2-1.6: new low-speed USB device number 4 using ehci-pci
Jan 31 00:48:46 pushan kernel: hid-generic 0003:0461:0010.0001: input,hidraw0: USB HID v1.10 Keyboard [NOVATEK USB Keyboard] on usb-0000:00:1d.0-1.3/input0
Jan 31 00:48:46 pushan kernel: input: NOVATEK USB Keyboard System Control as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.3/2-1.3:1.1/0003:0461:0010.0002/input/input6
Jan 31 00:48:46 pushan kernel: input: NOVATEK USB Keyboard Consumer Control as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.3/2-1.3:1.1/0003:0461:0010.0002/input/input7
Jan 31 00:48:46 pushan kernel: hid-generic 0003:0461:0010.0002: input,hidraw1: USB HID v1.10 Device [NOVATEK USB Keyboard] on usb-0000:00:1d.0-1.3/input1
Jan 31 00:48:46 pushan kernel: ata5: SATA link down (SStatus 0 SControl 300)
Jan 31 00:48:46 pushan kernel: usb 1-1.3: New USB device found, idVendor=046d, idProduct=0a38, bcdDevice= 1.15
Jan 31 00:48:46 pushan kernel: usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Jan 31 00:48:46 pushan kernel: usb 1-1.3: Product: Logitech USB Headset H340
Jan 31 00:48:46 pushan kernel: usb 1-1.3: Manufacturer: Logitech Inc.
Jan 31 00:48:46 pushan kernel: usb 2-1.6: New USB device found, idVendor=17ef, idProduct=600e, bcdDevice= 1.00
Jan 31 00:48:46 pushan kernel: usb 2-1.6: New USB device strings: Mfr=0, Product=2, SerialNumber=0
Jan 31 00:48:46 pushan kernel: usb 2-1.6: Product: Lenovo Optical Mouse
Jan 31 00:48:46 pushan kernel: input: Lenovo Optical Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.6/2-1.6:1.0/0003:17EF:600E.0003/input/input8
Jan 31 00:48:46 pushan kernel: hid-generic 0003:17EF:600E.0003: input,hidraw2: USB HID v1.11 Mouse [Lenovo Optical Mouse] on usb-0000:00:1d.0-1.6/input0
Jan 31 00:48:46 pushan kernel: input: Logitech Inc. Logitech USB Headset H340 Consumer Control as /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.3/1-1.3:1.3/0003:046D:0A38.0004/input/input9
Jan 31 00:48:46 pushan kernel: input: Logitech Inc. Logitech USB Headset H340 as /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.3/1-1.3:1.3/0003:046D:0A38.0004/input/input10
Jan 31 00:48:46 pushan kernel: hid-generic 0003:046D:0A38.0004: input,hiddev0,hidraw3: USB HID v1.11 Device [Logitech Inc. Logitech USB Headset H340] on usb-0000:00:1a.0-1.3/input3
Jan 31 00:48:46 pushan kernel: ata6: SATA link down (SStatus 0 SControl 300)
Jan 31 00:48:46 pushan kernel: [TTM] Zone  kernel: Available graphics memory: 4052318 KiB
Jan 31 00:48:46 pushan kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
Jan 31 00:48:46 pushan kernel: [TTM] Initializing pool allocator
Jan 31 00:48:46 pushan kernel: [TTM] Initializing DMA pool allocator
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 02800300 00000000
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 01800302 00020030
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 01032310 00000000
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02021362 00020010
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002161
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00000200
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x70000, bo (____ptrval____)
Jan 31 00:48:46 pushan kernel: fbcon: nouveaudrmfb (fb0) is primary device
Jan 31 00:48:46 pushan kernel: ata7: SATA link down (SStatus 0 SControl 300)
Jan 31 00:48:46 pushan kernel: Console: switching to colour frame buffer device 240x67
Jan 31 00:48:46 pushan kernel: nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
Jan 31 00:48:46 pushan kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
Jan 31 00:48:46 pushan kernel: ata8: SATA link down (SStatus 0 SControl 300)
Jan 31 00:48:46 pushan kernel: sr 3:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
Jan 31 00:48:46 pushan kernel: cdrom: Uniform CD-ROM driver Revision: 3.20
Jan 31 00:48:46 pushan kernel: sd 2:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
Jan 31 00:48:46 pushan kernel: sd 2:0:0:0: [sda] Write Protect is off
Jan 31 00:48:46 pushan kernel: sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
Jan 31 00:48:46 pushan kernel: sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jan 31 00:48:46 pushan kernel: sr 3:0:0:0: Attached scsi CD-ROM sr0
Jan 31 00:48:46 pushan kernel:  sda: sda1 sda2 sda3 < sda5 sda6 >
Jan 31 00:48:46 pushan kernel: sd 2:0:0:0: [sda] Attached SCSI disk
Jan 31 00:48:46 pushan kernel: EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
Jan 31 00:48:46 pushan kernel: Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
Jan 31 00:48:46 pushan kernel: random: crng init done
Jan 31 00:48:46 pushan systemd[1]: RTC configured in localtime, applying delta of 660 minutes to system time.
Jan 31 00:48:46 pushan systemd[1]: Inserted module 'autofs4'
Jan 31 00:48:46 pushan systemd[1]: systemd 247.2-5 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
Jan 31 00:48:46 pushan systemd[1]: Detected architecture x86-64.
Jan 31 00:48:46 pushan systemd[1]: Set hostname to <pushan>.
Jan 31 00:48:46 pushan systemd[1]: /lib/systemd/system/plymouth-start.service:16: Unit configured to use KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update your service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.
Jan 31 00:48:46 pushan systemd[1]: Queued start job for default target Graphical Interface.
Jan 31 00:48:46 pushan systemd[1]: Created slice system-getty.slice.
Jan 31 00:48:46 pushan systemd[1]: Created slice system-modprobe.slice.
Jan 31 00:48:46 pushan systemd[1]: Created slice User and Session Slice.
Jan 31 00:48:46 pushan systemd[1]: Started Forward Password Requests to Wall Directory Watch.
Jan 31 00:48:46 pushan systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
Jan 31 00:48:46 pushan systemd[1]: Reached target User and Group Name Lookups.
Jan 31 00:48:46 pushan systemd[1]: Reached target Remote File Systems.
Jan 31 00:48:46 pushan systemd[1]: Reached target Slices.
Jan 31 00:48:46 pushan systemd[1]: Listening on Syslog Socket.
Jan 31 00:48:46 pushan systemd[1]: Listening on fsck to fsckd communication Socket.
Jan 31 00:48:46 pushan systemd[1]: Listening on initctl Compatibility Named Pipe.
Jan 31 00:48:46 pushan systemd[1]: Listening on Journal Audit Socket.
Jan 31 00:48:46 pushan systemd[1]: Listening on Journal Socket (/dev/log).
Jan 31 00:48:46 pushan systemd[1]: Listening on Journal Socket.
Jan 31 00:48:46 pushan systemd[1]: Listening on udev Control Socket.
Jan 31 00:48:46 pushan systemd[1]: Listening on udev Kernel Socket.
Jan 31 00:48:46 pushan systemd[1]: Mounting Huge Pages File System...
Jan 31 00:48:46 pushan systemd[1]: Mounting POSIX Message Queue File System...
Jan 31 00:48:46 pushan systemd[1]: Mounting Kernel Debug File System...
Jan 31 00:48:46 pushan systemd[1]: Mounting Kernel Trace File System...
Jan 31 00:48:46 pushan systemd[1]: Starting Set the console keyboard layout...
Jan 31 00:48:46 pushan systemd[1]: Starting Create list of static device nodes for the current kernel...
Jan 31 00:48:46 pushan systemd[1]: Starting Load Kernel Module configfs...
Jan 31 00:48:46 pushan systemd[1]: Starting Load Kernel Module drm...
Jan 31 00:48:46 pushan systemd[1]: Starting Load Kernel Module fuse...
Jan 31 00:48:46 pushan systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
Jan 31 00:48:46 pushan systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
Jan 31 00:48:46 pushan systemd[1]: Starting Journal Service...
Jan 31 00:48:46 pushan systemd[1]: Starting Load Kernel Modules...
Jan 31 00:48:46 pushan systemd[1]: Starting Remount Root and Kernel File Systems...
Jan 31 00:48:46 pushan systemd[1]: Starting Coldplug All udev Devices...
Jan 31 00:48:46 pushan systemd[1]: modprobe@drm.service: Succeeded.
Jan 31 00:48:46 pushan systemd[1]: Finished Load Kernel Module drm.
Jan 31 00:48:46 pushan systemd[1]: Finished Create list of static device nodes for the current kernel.
Jan 31 00:48:46 pushan systemd[1]: modprobe@configfs.service: Succeeded.
Jan 31 00:48:46 pushan systemd[1]: Finished Load Kernel Module configfs.
Jan 31 00:48:46 pushan systemd[1]: Mounting Kernel Configuration File System...
Jan 31 00:48:46 pushan kernel: fuse: init (API version 7.32)
Jan 31 00:48:46 pushan systemd[1]: modprobe@fuse.service: Succeeded.
Jan 31 00:48:46 pushan systemd[1]: Finished Load Kernel Module fuse.
Jan 31 00:48:46 pushan systemd[1]: Mounting FUSE Control File System...
Jan 31 00:48:46 pushan systemd[1]: Finished Coldplug All udev Devices.
Jan 31 00:48:46 pushan systemd[1]: Starting Helper to synchronize boot up for ifupdown...
Jan 31 00:48:46 pushan systemd[1]: Started Journal Service.
Jan 31 00:48:46 pushan kernel: EXT4-fs (sda5): re-mounted. Opts: user_xattr,errors=remount-ro
Jan 31 00:48:48 pushan kernel: Adding 65532k swap on /swapfile.  Priority:-2 extents:1 across:65532k FS
Jan 31 00:48:49 pushan kernel: tpm_tis 00:0a: 1.2 TPM (device-id 0x0, rev-id 78)
Jan 31 00:48:49 pushan kernel: input: PC Speaker as /devices/platform/pcspkr/input/input11
Jan 31 00:48:49 pushan kernel: at24 0-0050: supply vcc not found, using dummy regulator
Jan 31 00:48:49 pushan kernel: at24 0-0050: 256 byte spd EEPROM, read-only
Jan 31 00:48:49 pushan kernel: at24 0-0051: supply vcc not found, using dummy regulator
Jan 31 00:48:49 pushan kernel: at24 0-0051: 256 byte spd EEPROM, read-only
Jan 31 00:48:49 pushan kernel: at24 0-0052: supply vcc not found, using dummy regulator
Jan 31 00:48:49 pushan kernel: at24 0-0052: 256 byte spd EEPROM, read-only
Jan 31 00:48:49 pushan kernel: at24 0-0053: supply vcc not found, using dummy regulator
Jan 31 00:48:49 pushan kernel: at24 0-0053: 256 byte spd EEPROM, read-only
Jan 31 00:48:49 pushan kernel: sd 2:0:0:0: Attached scsi generic sg0 type 0
Jan 31 00:48:49 pushan kernel: sr 3:0:0:0: Attached scsi generic sg1 type 5
Jan 31 00:48:49 pushan kernel: EDAC MC0: Giving out device to module i7core_edac.c controller i7 core #0: DEV 0000:ff:03.0 (INTERRUPT)
Jan 31 00:48:49 pushan kernel: EDAC PCI0: Giving out device to module i7core_edac controller EDAC PCI controller: DEV 0000:ff:03.0 (POLLED)
Jan 31 00:48:49 pushan kernel: EDAC i7core: Driver loaded, 1 memory controller(s) found.
Jan 31 00:48:49 pushan kernel: parport_pc 00:04: reported by Plug and Play ACPI
Jan 31 00:48:49 pushan kernel: parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
Jan 31 00:48:49 pushan kernel: iTCO_vendor_support: vendor-support=0
Jan 31 00:48:49 pushan kernel: iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
Jan 31 00:48:49 pushan kernel: iTCO_wdt: Found a Q57 TCO device (Version=2, TCOBASE=0x0860)
Jan 31 00:48:49 pushan kernel: iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
Jan 31 00:48:49 pushan kernel: ppdev: user-space parallel port driver
Jan 31 00:48:49 pushan kernel: kvm: VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL does not work properly. Using workaround
Jan 31 00:48:50 pushan kernel: mc: Linux media interface: v0.10
Jan 31 00:48:50 pushan kernel: snd_hda_intel 0000:01:00.1: Disabling MSI
Jan 31 00:48:50 pushan kernel: snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
Jan 31 00:48:50 pushan kernel: input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.0/0000:01:00.1/sound/card2/input12
Jan 31 00:48:50 pushan kernel: input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.0/0000:01:00.1/sound/card2/input13
Jan 31 00:48:50 pushan kernel: input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.0/0000:01:00.1/sound/card2/input14
Jan 31 00:48:50 pushan kernel: input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.0/0000:01:00.1/sound/card2/input15
Jan 31 00:48:50 pushan kernel: usbcore: registered new interface driver snd-usb-audio
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC662 rev1: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=1 (0x15/0x0/0x0/0x0/0x0)
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:    inputs:
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
Jan 31 00:48:50 pushan kernel: snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
Jan 31 00:48:50 pushan kernel: input: HDA Intel MID Front Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input16
Jan 31 00:48:50 pushan kernel: input: HDA Intel MID Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input17
Jan 31 00:48:50 pushan kernel: input: HDA Intel MID Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input18
Jan 31 00:48:50 pushan kernel: input: HDA Intel MID Line Out as /devices/pci0000:00/0000:00:1b.0/sound/card0/input19
Jan 31 00:48:50 pushan kernel: input: HDA Intel MID Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input20
Jan 31 00:48:51 pushan kernel: SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
Jan 31 00:48:51 pushan kernel: XFS (sda6): Mounting V5 Filesystem
Jan 31 00:48:51 pushan kernel: XFS (sda6): Ending clean mount
Jan 31 00:48:51 pushan kernel: xfs filesystem being mounted at /home supports timestamps until 2038 (0x7fffffff)
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.465:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=479 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.465:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=478 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.465:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=477 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.469:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oopslash" pid=480 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.469:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=475 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.469:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=475 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.489:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=481 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.489:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=481 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.489:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=481 comm="apparmor_parser"
Jan 31 00:48:52 pushan kernel: audit: type=1400 audit(1612014532.633:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/evince" pid=482 comm="apparmor_parser"
Jan 31 00:49:00 pushan kernel: e1000e 0000:00:19.0 enp0s25: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx
Jan 31 00:49:00 pushan kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp0s25: link becomes ready
Jan 31 00:49:08 pushan kernel: nouveau 0000:01:00.0: firmware: direct-loading firmware nouveau/nva3_fuc084
Jan 31 00:49:16 pushan kernel: rfkill: input handler disabled
Jan 31 00:49:27 pushan kernel: rfkill: input handler enabled
Jan 31 00:49:31 pushan kernel: rfkill: input handler disabled
Jan 31 00:49:32 pushan kernel: nouveau 0000:01:00.0: firmware: direct-loading firmware nouveau/nva3_fuc084
Jan 31 00:52:43 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:45 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:47 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:49 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:52 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:54 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:56 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:52:58 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:00 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:02 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:04 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:06 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:08 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:10 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:12 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:14 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:16 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:18 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:20 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:22 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:24 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:26 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:28 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:30 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:32 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:34 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:36 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:38 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:40 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:42 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:44 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:46 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:48 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:50 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:52 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:54 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:56 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:53:58 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:00 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:02 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:04 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:06 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:08 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:10 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:12 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:14 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:16 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:18 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:20 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:22 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:24 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:26 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:28 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:30 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:32 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:34 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:36 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:38 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:40 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:42 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:42 pushan kernel: WARNING: CPU: 6 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:42 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:42 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:42 pushan kernel: CPU: 6 PID: 56 Comm: kworker/u16:5 Not tainted 5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:42 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:42 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:42 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:42 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:42 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:42 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:54:42 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:42 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000556a114260
Jan 31 00:54:42 pushan kernel: R10: 0000000000000000 R11: 000000556a114260 R12: 00000000fffffffb
Jan 31 00:54:42 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:42 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:54:42 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:42 pushan kernel: CR2: 00007f6a89859000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:42 pushan kernel: Call Trace:
Jan 31 00:54:42 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:54:42 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:54:42 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:54:42 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:42 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:42 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:42 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:42 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:42 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:42 pushan kernel: ---[ end trace 874284bba13215d0 ]---
Jan 31 00:54:44 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:44 pushan kernel: WARNING: CPU: 6 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:44 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:44 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:44 pushan kernel: CPU: 6 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:44 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:44 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:44 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:44 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:44 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:44 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:54:44 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:44 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000055e14bde20
Jan 31 00:54:44 pushan kernel: R10: 0000000000000000 R11: 00000055e14bde20 R12: 00000000fffffffb
Jan 31 00:54:44 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:44 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:54:44 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:44 pushan kernel: CR2: 00007f6a89859000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:44 pushan kernel: Call Trace:
Jan 31 00:54:44 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:54:44 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:54:44 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:54:44 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:44 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:44 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:44 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:44 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:44 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:44 pushan kernel: ---[ end trace 874284bba13215d1 ]---
Jan 31 00:54:46 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:48 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:48 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:48 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:48 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:48 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:48 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:48 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:48 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:48 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:48 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:48 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:54:48 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:48 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000056d0678c40
Jan 31 00:54:48 pushan kernel: R10: 0000000000000000 R11: 00000056d0678c40 R12: 00000000fffffffb
Jan 31 00:54:48 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:48 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:54:48 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:48 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:48 pushan kernel: Call Trace:
Jan 31 00:54:48 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:54:48 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:54:48 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:54:48 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:48 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:48 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:48 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:48 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:48 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:48 pushan kernel: ---[ end trace 874284bba13215d2 ]---
Jan 31 00:54:50 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:50 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:50 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:50 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:50 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:50 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:50 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:50 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:50 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:50 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:50 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:54:50 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:50 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005747a1e800
Jan 31 00:54:50 pushan kernel: R10: 0000000000000000 R11: 0000005747a1e800 R12: 00000000fffffffb
Jan 31 00:54:50 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:50 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:54:50 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:50 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:50 pushan kernel: Call Trace:
Jan 31 00:54:50 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:54:50 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:54:50 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:54:50 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:50 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:50 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:50 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:50 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:50 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:50 pushan kernel: ---[ end trace 874284bba13215d3 ]---
Jan 31 00:54:52 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:52 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:52 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:52 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:52 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:52 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:52 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:52 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:52 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:52 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:52 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:54:52 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:52 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000057bedb8700
Jan 31 00:54:52 pushan kernel: R10: 0000000000000000 R11: 00000057bedb8700 R12: 00000000fffffffb
Jan 31 00:54:52 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:52 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:54:52 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:52 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:52 pushan kernel: Call Trace:
Jan 31 00:54:52 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:54:52 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:54:52 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:54:52 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:52 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:52 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:52 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:52 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:52 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:52 pushan kernel: ---[ end trace 874284bba13215d4 ]---
Jan 31 00:54:54 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:54:56 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:56 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:56 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:56 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:56 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:56 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:56 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:56 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:56 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:56 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:56 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:54:56 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:56 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000058ae38cb80
Jan 31 00:54:56 pushan kernel: R10: 0000000000000000 R11: 00000058ae38cb80 R12: 00000000fffffffb
Jan 31 00:54:56 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:56 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:54:56 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:56 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:56 pushan kernel: Call Trace:
Jan 31 00:54:56 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:54:56 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:54:56 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:54:56 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:56 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:56 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:56 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:56 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:56 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:56 pushan kernel: ---[ end trace 874284bba13215d5 ]---
Jan 31 00:54:58 pushan kernel: ------------[ cut here ]------------
Jan 31 00:54:58 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:58 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:54:58 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:54:58 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:54:58 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:54:58 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:54:58 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:54:58 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:54:58 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:54:58 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:54:58 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:54:58 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005925735b80
Jan 31 00:54:58 pushan kernel: R10: 0000000000000000 R11: 0000005925735b80 R12: 00000000fffffffb
Jan 31 00:54:58 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:54:58 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:54:58 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:54:58 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:54:58 pushan kernel: Call Trace:
Jan 31 00:54:58 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:54:58 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:54:58 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:54:58 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:54:58 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:54:58 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:54:58 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:54:58 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:54:58 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:54:58 pushan kernel: ---[ end trace 874284bba13215d6 ]---
Jan 31 00:55:00 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:00 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:00 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:00 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:00 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:00 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:00 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:00 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:00 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:00 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:00 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:00 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:00 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000599cad9120
Jan 31 00:55:00 pushan kernel: R10: 0000000000000000 R11: 000000599cad9120 R12: 00000000fffffffb
Jan 31 00:55:00 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:00 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:00 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:00 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:00 pushan kernel: Call Trace:
Jan 31 00:55:00 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:00 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:00 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:00 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:00 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:00 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:00 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:00 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:00 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:00 pushan kernel: ---[ end trace 874284bba13215d7 ]---
Jan 31 00:55:02 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:04 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:04 pushan kernel: WARNING: CPU: 2 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:04 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:04 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:04 pushan kernel: CPU: 2 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:04 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:04 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:04 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:04 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:04 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:04 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:04 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:04 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005a8c287620
Jan 31 00:55:04 pushan kernel: R10: 0000000000000000 R11: 0000005a8c287620 R12: 00000000fffffffb
Jan 31 00:55:04 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:04 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c80000(0000) knlGS:0000000000000000
Jan 31 00:55:04 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:04 pushan kernel: CR2: 00007f6a897d8000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:04 pushan kernel: Call Trace:
Jan 31 00:55:04 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:04 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:04 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:04 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:04 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:04 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:04 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:04 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:04 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:04 pushan kernel: ---[ end trace 874284bba13215d8 ]---
Jan 31 00:55:06 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:06 pushan kernel: WARNING: CPU: 2 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:06 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:06 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:06 pushan kernel: CPU: 2 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:06 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:06 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:06 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:06 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:06 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:06 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:06 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:06 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005b0362a4a0
Jan 31 00:55:06 pushan kernel: R10: 0000000000000000 R11: 0000005b0362a4a0 R12: 00000000fffffffb
Jan 31 00:55:06 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:06 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c80000(0000) knlGS:0000000000000000
Jan 31 00:55:06 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:06 pushan kernel: CR2: 00007f6a897d8000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:06 pushan kernel: Call Trace:
Jan 31 00:55:06 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:06 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:06 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:06 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:06 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:06 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:06 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:06 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:06 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:06 pushan kernel: ---[ end trace 874284bba13215d9 ]---
Jan 31 00:55:08 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:08 pushan kernel: WARNING: CPU: 2 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:08 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:08 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:08 pushan kernel: CPU: 2 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:08 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:08 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:08 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:08 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:08 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:08 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:08 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:08 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005b7a9c3b00
Jan 31 00:55:08 pushan kernel: R10: 0000000000000000 R11: 0000005b7a9c3b00 R12: 00000000fffffffb
Jan 31 00:55:08 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:08 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c80000(0000) knlGS:0000000000000000
Jan 31 00:55:08 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:08 pushan kernel: CR2: 00007f6a897d8000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:08 pushan kernel: Call Trace:
Jan 31 00:55:08 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:08 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:08 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:08 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:08 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:08 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:08 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:08 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:08 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:08 pushan kernel: ---[ end trace 874284bba13215da ]---
Jan 31 00:55:10 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:12 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:12 pushan kernel: WARNING: CPU: 6 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:12 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:12 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:12 pushan kernel: CPU: 6 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:12 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:12 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:12 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:12 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:12 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:12 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:12 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:12 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005c69ef7280
Jan 31 00:55:12 pushan kernel: R10: 0000000000000000 R11: 0000005c69ef7280 R12: 00000000fffffffb
Jan 31 00:55:12 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:12 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:55:12 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:12 pushan kernel: CR2: 00007f6a91420000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:12 pushan kernel: Call Trace:
Jan 31 00:55:12 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:12 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:12 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:12 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:12 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:12 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:12 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:12 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:12 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:12 pushan kernel: ---[ end trace 874284bba13215db ]---
Jan 31 00:55:14 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:14 pushan kernel: WARNING: CPU: 6 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:14 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:14 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:14 pushan kernel: CPU: 6 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:14 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:14 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:14 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:14 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:14 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:14 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:14 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:14 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005ce129b0e0
Jan 31 00:55:14 pushan kernel: R10: 0000000000000000 R11: 0000005ce129b0e0 R12: 00000000fffffffb
Jan 31 00:55:14 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:14 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:55:14 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:14 pushan kernel: CR2: 00007f6a91420000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:14 pushan kernel: Call Trace:
Jan 31 00:55:14 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:14 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:14 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:14 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:14 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:14 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:14 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:14 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:14 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:14 pushan kernel: ---[ end trace 874284bba13215dc ]---
Jan 31 00:55:16 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:16 pushan kernel: WARNING: CPU: 6 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:16 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:16 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:16 pushan kernel: CPU: 6 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:16 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:16 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:16 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:16 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:16 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:16 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:16 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:16 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005d58634ba0
Jan 31 00:55:16 pushan kernel: R10: 0000000000000000 R11: 0000005d58634ba0 R12: 00000000fffffffb
Jan 31 00:55:16 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:16 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:55:16 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:16 pushan kernel: CR2: 00007f6a91420000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:16 pushan kernel: Call Trace:
Jan 31 00:55:16 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:16 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:16 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:16 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:16 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:16 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:16 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:16 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:16 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:16 pushan kernel: ---[ end trace 874284bba13215dd ]---
Jan 31 00:55:18 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:20 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:20 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:20 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:20 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:20 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:20 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:20 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:20 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:20 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:20 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:20 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:20 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:20 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005e47c841c0
Jan 31 00:55:20 pushan kernel: R10: 0000000000000000 R11: 0000005e47c841c0 R12: 00000000fffffffb
Jan 31 00:55:20 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:20 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:20 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:20 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:20 pushan kernel: Call Trace:
Jan 31 00:55:20 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:20 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:20 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:20 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:20 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:20 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:20 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:20 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:20 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:20 pushan kernel: ---[ end trace 874284bba13215de ]---
Jan 31 00:55:22 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:22 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:22 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:22 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:22 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:22 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:22 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:22 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:22 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:22 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:22 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:22 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:22 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005ebf02db00
Jan 31 00:55:22 pushan kernel: R10: 0000000000000000 R11: 0000005ebf02db00 R12: 00000000fffffffb
Jan 31 00:55:22 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:22 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:22 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:22 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:22 pushan kernel: Call Trace:
Jan 31 00:55:22 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:22 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:22 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:22 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:22 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:22 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:22 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:22 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:22 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:22 pushan kernel: ---[ end trace 874284bba13215df ]---
Jan 31 00:55:24 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:24 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:24 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:24 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:24 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:24 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:24 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:24 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:24 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:24 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:24 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:24 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:24 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000005f363c76e0
Jan 31 00:55:24 pushan kernel: R10: 0000000000000000 R11: 0000005f363c76e0 R12: 00000000fffffffb
Jan 31 00:55:24 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:24 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:24 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:24 pushan kernel: CR2: 00007f6aa52f2138 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:24 pushan kernel: Call Trace:
Jan 31 00:55:24 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:24 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:24 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:24 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:24 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:24 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:24 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:24 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:24 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:24 pushan kernel: ---[ end trace 874284bba13215e0 ]---
Jan 31 00:55:32 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:32 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:32 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:32 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:32 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:32 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:32 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:32 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:32 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:32 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:32 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:32 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000060268e4500
Jan 31 00:55:32 pushan kernel: R10: 0000000000000000 R11: 00000060268e4500 R12: 00000000fffffffb
Jan 31 00:55:32 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:32 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:32 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:32 pushan kernel: CR2: 00007f438efbb010 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:32 pushan kernel: Call Trace:
Jan 31 00:55:32 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:32 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:32 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:32 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:32 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:32 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:32 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:32 pushan kernel: ---[ end trace 874284bba13215e1 ]---
Jan 31 00:55:32 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:32 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:32 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:32 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:32 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:32 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:32 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:32 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:32 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:32 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:32 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000609dc8b300
Jan 31 00:55:32 pushan kernel: R10: 0000000000000000 R11: 000000609dc8b300 R12: 00000000fffffffb
Jan 31 00:55:32 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:32 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:32 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:32 pushan kernel: CR2: 00007f438efbb010 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:32 pushan kernel: Call Trace:
Jan 31 00:55:32 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:32 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:32 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:32 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:32 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:32 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:32 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:32 pushan kernel: ---[ end trace 874284bba13215e2 ]---
Jan 31 00:55:32 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:32 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:32 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:32 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:32 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:32 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:32 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:32 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:32 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:32 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:32 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:32 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006115024720
Jan 31 00:55:32 pushan kernel: R10: 0000000000000000 R11: 0000006115024720 R12: 00000000fffffffb
Jan 31 00:55:32 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:32 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:32 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:32 pushan kernel: CR2: 00007f438efbb010 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:32 pushan kernel: Call Trace:
Jan 31 00:55:32 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:32 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:32 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:32 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:32 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:32 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:32 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:32 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:32 pushan kernel: ---[ end trace 874284bba13215e3 ]---
Jan 31 00:55:34 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:36 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:36 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:36 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:36 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:36 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:36 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:36 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:36 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:36 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:36 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:36 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:36 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:36 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000062045bdfc0
Jan 31 00:55:36 pushan kernel: R10: 0000000000000000 R11: 00000062045bdfc0 R12: 00000000fffffffb
Jan 31 00:55:36 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:36 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:36 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:36 pushan kernel: CR2: 00007f438de96460 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:36 pushan kernel: Call Trace:
Jan 31 00:55:36 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:36 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:36 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:36 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:36 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:36 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:36 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:36 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:36 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:36 pushan kernel: ---[ end trace 874284bba13215e4 ]---
Jan 31 00:55:38 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:38 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:38 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:38 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:38 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:38 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:38 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:38 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:38 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:38 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:38 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:38 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:38 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000627b962680
Jan 31 00:55:38 pushan kernel: R10: 0000000000000000 R11: 000000627b962680 R12: 00000000fffffffb
Jan 31 00:55:38 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:38 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:38 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:38 pushan kernel: CR2: 00007f438de96460 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:38 pushan kernel: Call Trace:
Jan 31 00:55:38 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:38 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:38 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:38 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:38 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:38 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:38 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:38 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:38 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:38 pushan kernel: ---[ end trace 874284bba13215e5 ]---
Jan 31 00:55:40 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:40 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:40 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:40 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:40 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:40 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:40 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:40 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:40 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:40 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:40 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:40 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:40 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000062f2cfd880
Jan 31 00:55:40 pushan kernel: R10: 0000000000000000 R11: 00000062f2cfd880 R12: 00000000fffffffb
Jan 31 00:55:40 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:40 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:40 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:40 pushan kernel: CR2: 00007f438de96460 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:40 pushan kernel: Call Trace:
Jan 31 00:55:40 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:40 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:40 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:40 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:40 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:40 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:40 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:40 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:40 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:40 pushan kernel: ---[ end trace 874284bba13215e6 ]---
Jan 31 00:55:42 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:44 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:44 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:44 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:44 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:44 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:44 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:44 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:44 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:44 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:44 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:44 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:44 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:44 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000063e23d20e0
Jan 31 00:55:44 pushan kernel: R10: 0000000000000000 R11: 00000063e23d20e0 R12: 00000000fffffffb
Jan 31 00:55:44 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:44 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:44 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:44 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:44 pushan kernel: Call Trace:
Jan 31 00:55:44 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:44 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:44 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:44 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:44 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:44 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:44 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:44 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:44 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:44 pushan kernel: ---[ end trace 874284bba13215e7 ]---
Jan 31 00:55:46 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:46 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:46 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:46 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:46 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:46 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:46 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:46 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:46 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:46 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:46 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:46 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:46 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006459774ea0
Jan 31 00:55:46 pushan kernel: R10: 0000000000000000 R11: 0000006459774ea0 R12: 00000000fffffffb
Jan 31 00:55:46 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:46 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:46 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:46 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:46 pushan kernel: Call Trace:
Jan 31 00:55:46 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:46 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:46 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:46 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:46 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:46 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:46 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:46 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:46 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:46 pushan kernel: ---[ end trace 874284bba13215e8 ]---
Jan 31 00:55:48 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:48 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:48 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:48 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:48 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:48 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:48 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:48 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:48 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:48 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:48 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:48 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:48 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000064d0b15520
Jan 31 00:55:48 pushan kernel: R10: 0000000000000000 R11: 00000064d0b15520 R12: 00000000fffffffb
Jan 31 00:55:48 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:48 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:48 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:48 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:48 pushan kernel: Call Trace:
Jan 31 00:55:48 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:48 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:48 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:48 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:48 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:48 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:48 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:48 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:48 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:48 pushan kernel: ---[ end trace 874284bba13215e9 ]---
Jan 31 00:55:50 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:55:52 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:52 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:52 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:52 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:52 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:52 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:52 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:52 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:52 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:52 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:52 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:55:52 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:52 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000065c00fd760
Jan 31 00:55:52 pushan kernel: R10: 0000000000000000 R11: 00000065c00fd760 R12: 00000000fffffffb
Jan 31 00:55:52 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:52 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:52 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:52 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:52 pushan kernel: Call Trace:
Jan 31 00:55:52 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:55:52 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:55:52 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:52 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:52 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:52 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:52 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:52 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:52 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:52 pushan kernel: ---[ end trace 874284bba13215ea ]---
Jan 31 00:55:54 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:54 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:54 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:54 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:54 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:54 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:54 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:54 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:54 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:54 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:54 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:55:54 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:54 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000066374c3180
Jan 31 00:55:54 pushan kernel: R10: 0000000000000000 R11: 00000066374c3180 R12: 00000000fffffffb
Jan 31 00:55:54 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:54 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:54 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:54 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:54 pushan kernel: Call Trace:
Jan 31 00:55:54 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:55:54 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:55:54 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:55:54 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:54 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:54 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:54 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:54 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:54 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:54 pushan kernel: ---[ end trace 874284bba13215eb ]---
Jan 31 00:55:56 pushan kernel: ------------[ cut here ]------------
Jan 31 00:55:56 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:56 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:55:56 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:55:56 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:55:56 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:55:56 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:55:56 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:55:56 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:55:56 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:55:56 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:55:56 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:55:56 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000066ae8669e0
Jan 31 00:55:56 pushan kernel: R10: 0000000000000000 R11: 00000066ae8669e0 R12: 00000000fffffffb
Jan 31 00:55:56 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:55:56 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:55:56 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:55:56 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:55:56 pushan kernel: Call Trace:
Jan 31 00:55:56 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:55:56 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:55:56 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:55:56 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:55:56 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:55:56 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:55:56 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:55:56 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:55:56 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:55:56 pushan kernel: ---[ end trace 874284bba13215ec ]---
Jan 31 00:55:58 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:00 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:00 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:00 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:00 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:00 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:00 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:00 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:00 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:00 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:00 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:00 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:00 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:00 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000679de434e0
Jan 31 00:56:00 pushan kernel: R10: 0000000000000000 R11: 000000679de434e0 R12: 00000000fffffffb
Jan 31 00:56:00 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:00 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:56:00 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:00 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:00 pushan kernel: Call Trace:
Jan 31 00:56:00 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:00 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:00 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:00 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:00 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:00 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:00 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:00 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:00 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:00 pushan kernel: ---[ end trace 874284bba13215ed ]---
Jan 31 00:56:02 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:02 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:02 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:02 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:02 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:02 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:02 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:02 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:02 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:02 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:02 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:02 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:02 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000068151ec8e0
Jan 31 00:56:02 pushan kernel: R10: 0000000000000000 R11: 00000068151ec8e0 R12: 00000000fffffffb
Jan 31 00:56:02 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:02 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:56:02 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:02 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:02 pushan kernel: Call Trace:
Jan 31 00:56:02 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:02 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:02 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:02 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:02 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:02 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:02 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:02 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:02 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:02 pushan kernel: ---[ end trace 874284bba13215ee ]---
Jan 31 00:56:04 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:04 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:04 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:04 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:04 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:04 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:04 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:04 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:04 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:04 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:04 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:04 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:04 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000688c587820
Jan 31 00:56:04 pushan kernel: R10: 0000000000000000 R11: 000000688c587820 R12: 00000000fffffffb
Jan 31 00:56:04 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:04 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:56:04 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:04 pushan kernel: CR2: 00007f438e0e3e30 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:04 pushan kernel: Call Trace:
Jan 31 00:56:04 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:04 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:04 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:04 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:04 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:04 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:04 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:04 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:04 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:04 pushan kernel: ---[ end trace 874284bba13215ef ]---
Jan 31 00:56:06 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:08 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:08 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:08 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:08 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:08 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:08 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:08 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:08 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:08 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:08 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:08 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:08 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:08 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000697bbc5460
Jan 31 00:56:08 pushan kernel: R10: 0000000000000000 R11: 000000697bbc5460 R12: 00000000fffffffb
Jan 31 00:56:08 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:08 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:08 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:08 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:08 pushan kernel: Call Trace:
Jan 31 00:56:08 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:08 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:08 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:08 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:08 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:08 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:08 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:08 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:08 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:08 pushan kernel: ---[ end trace 874284bba13215f0 ]---
Jan 31 00:56:10 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:10 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:10 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:10 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:10 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:10 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:10 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:10 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:10 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:10 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:10 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:10 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:10 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000069f2f69320
Jan 31 00:56:10 pushan kernel: R10: 0000000000000000 R11: 00000069f2f69320 R12: 00000000fffffffb
Jan 31 00:56:10 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:10 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:10 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:10 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:10 pushan kernel: Call Trace:
Jan 31 00:56:10 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:10 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:10 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:10 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:10 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:10 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:10 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:10 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:10 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:10 pushan kernel: ---[ end trace 874284bba13215f1 ]---
Jan 31 00:56:12 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:12 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:12 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:12 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:12 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:12 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:12 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:12 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:12 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:12 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:12 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:12 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:12 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006a6a30d6a0
Jan 31 00:56:12 pushan kernel: R10: 0000000000000000 R11: 0000006a6a30d6a0 R12: 00000000fffffffb
Jan 31 00:56:12 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:12 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:12 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:12 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:12 pushan kernel: Call Trace:
Jan 31 00:56:12 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:12 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:12 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:12 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:12 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:12 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:12 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:12 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:12 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:12 pushan kernel: ---[ end trace 874284bba13215f2 ]---
Jan 31 00:56:14 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:16 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:16 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:16 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:16 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:16 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:16 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:16 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:16 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:16 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:16 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:16 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:16 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:16 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006b599b7940
Jan 31 00:56:16 pushan kernel: R10: 0000000000000000 R11: 0000006b599b7940 R12: 00000000fffffffb
Jan 31 00:56:16 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:16 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:16 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:16 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:16 pushan kernel: Call Trace:
Jan 31 00:56:16 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:16 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:16 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:16 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:16 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:16 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:16 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:16 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:16 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:16 pushan kernel: ---[ end trace 874284bba13215f3 ]---
Jan 31 00:56:18 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:18 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:18 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:18 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:18 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:18 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:18 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:18 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:18 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:18 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:18 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:18 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:18 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006bd0d5b8a0
Jan 31 00:56:18 pushan kernel: R10: 0000000000000000 R11: 0000006bd0d5b8a0 R12: 00000000fffffffb
Jan 31 00:56:18 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:18 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:18 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:18 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:18 pushan kernel: Call Trace:
Jan 31 00:56:18 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:18 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:18 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:18 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:18 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:18 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:18 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:18 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:18 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:18 pushan kernel: ---[ end trace 874284bba13215f4 ]---
Jan 31 00:56:20 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:20 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:20 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:20 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:20 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:20 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:20 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:20 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:20 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:20 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:20 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:20 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:20 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006c480f9840
Jan 31 00:56:20 pushan kernel: R10: 0000000000000000 R11: 0000006c480f9840 R12: 00000000fffffffb
Jan 31 00:56:20 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:20 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:20 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:20 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:20 pushan kernel: Call Trace:
Jan 31 00:56:20 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:20 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:20 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:20 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:20 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:20 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:20 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:20 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:20 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:20 pushan kernel: ---[ end trace 874284bba13215f5 ]---
Jan 31 00:56:22 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:24 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:24 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:24 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:24 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:24 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:24 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:24 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:24 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:24 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:24 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:24 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:24 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:24 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006d37744de0
Jan 31 00:56:24 pushan kernel: R10: 0000000000000000 R11: 0000006d37744de0 R12: 00000000fffffffb
Jan 31 00:56:24 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:24 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:24 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:24 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:24 pushan kernel: Call Trace:
Jan 31 00:56:24 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:24 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:24 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:24 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:24 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:24 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:24 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:24 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:24 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:24 pushan kernel: ---[ end trace 874284bba13215f6 ]---
Jan 31 00:56:26 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:26 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:26 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:26 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:26 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:26 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:26 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:26 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:26 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:26 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:26 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:26 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:26 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006daeae8600
Jan 31 00:56:26 pushan kernel: R10: 0000000000000000 R11: 0000006daeae8600 R12: 00000000fffffffb
Jan 31 00:56:26 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:26 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:26 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:26 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:26 pushan kernel: Call Trace:
Jan 31 00:56:26 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:26 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:26 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:26 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:26 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:26 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:26 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:26 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:26 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:26 pushan kernel: ---[ end trace 874284bba13215f7 ]---
Jan 31 00:56:28 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:28 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:28 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:28 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:28 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:28 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:28 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:28 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:28 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:28 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:28 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:28 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:28 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006e25e83260
Jan 31 00:56:28 pushan kernel: R10: 0000000000000000 R11: 0000006e25e83260 R12: 00000000fffffffb
Jan 31 00:56:28 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:28 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:28 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:28 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:28 pushan kernel: Call Trace:
Jan 31 00:56:28 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:28 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:28 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:28 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:28 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:28 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:28 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:28 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:28 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:28 pushan kernel: ---[ end trace 874284bba13215f8 ]---
Jan 31 00:56:30 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:32 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:32 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:32 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:32 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:32 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:32 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:32 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:32 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:32 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:32 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:32 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:32 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:32 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006f153392c0
Jan 31 00:56:32 pushan kernel: R10: 0000000000000000 R11: 0000006f153392c0 R12: 00000000fffffffb
Jan 31 00:56:32 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:32 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:32 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:32 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:32 pushan kernel: Call Trace:
Jan 31 00:56:32 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:32 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:32 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:32 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:32 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:32 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:32 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:32 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:32 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:32 pushan kernel: ---[ end trace 874284bba13215f9 ]---
Jan 31 00:56:34 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:34 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:34 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:34 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:34 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:34 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:34 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:34 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:34 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:34 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:34 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:34 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:34 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000006f8c70b680
Jan 31 00:56:34 pushan kernel: R10: 0000000000000000 R11: 0000006f8c70b680 R12: 00000000fffffffb
Jan 31 00:56:34 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:34 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:34 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:34 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:34 pushan kernel: Call Trace:
Jan 31 00:56:34 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:34 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:34 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:34 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:34 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:34 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:34 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:34 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:34 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:34 pushan kernel: ---[ end trace 874284bba13215fa ]---
Jan 31 00:56:36 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:36 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:36 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:36 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:36 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:36 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:36 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:36 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:36 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:36 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:36 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:36 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:36 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007003aad180
Jan 31 00:56:36 pushan kernel: R10: 0000000000000000 R11: 0000007003aad180 R12: 00000000fffffffb
Jan 31 00:56:36 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:36 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:36 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:36 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:36 pushan kernel: Call Trace:
Jan 31 00:56:36 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:36 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:36 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:36 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:36 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:36 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:36 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:36 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:36 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:36 pushan kernel: ---[ end trace 874284bba13215fb ]---
Jan 31 00:56:38 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:40 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:40 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:40 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:40 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:40 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:40 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:40 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:40 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:40 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:40 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:40 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:40 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:40 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000070f305ed40
Jan 31 00:56:40 pushan kernel: R10: 0000000000000000 R11: 00000070f305ed40 R12: 00000000fffffffb
Jan 31 00:56:40 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:40 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:40 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:40 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:40 pushan kernel: Call Trace:
Jan 31 00:56:40 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:40 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:40 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:40 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:40 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:40 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:40 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:40 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:40 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:40 pushan kernel: ---[ end trace 874284bba13215fc ]---
Jan 31 00:56:42 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:42 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:42 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:42 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:42 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:42 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:42 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:42 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:42 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:42 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:42 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:42 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:42 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000716a4026e0
Jan 31 00:56:42 pushan kernel: R10: 0000000000000000 R11: 000000716a4026e0 R12: 00000000fffffffb
Jan 31 00:56:42 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:42 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:42 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:42 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:42 pushan kernel: Call Trace:
Jan 31 00:56:42 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:42 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:42 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:42 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:42 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:42 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:42 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:42 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:42 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:42 pushan kernel: ---[ end trace 874284bba13215fd ]---
Jan 31 00:56:44 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:44 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:44 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:44 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:44 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:44 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:44 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:44 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:44 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:44 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:44 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:44 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:44 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000071e179e160
Jan 31 00:56:44 pushan kernel: R10: 0000000000000000 R11: 00000071e179e160 R12: 00000000fffffffb
Jan 31 00:56:44 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:44 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:44 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:44 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:44 pushan kernel: Call Trace:
Jan 31 00:56:44 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:44 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:44 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:44 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:44 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:44 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:44 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:44 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:44 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:44 pushan kernel: ---[ end trace 874284bba13215fe ]---
Jan 31 00:56:46 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:48 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:48 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:48 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:48 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:48 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:48 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:48 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:48 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:48 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:48 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:48 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:48 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:48 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000072d0d47b80
Jan 31 00:56:48 pushan kernel: R10: 0000000000000000 R11: 00000072d0d47b80 R12: 00000000fffffffb
Jan 31 00:56:48 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:48 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:48 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:48 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:48 pushan kernel: Call Trace:
Jan 31 00:56:48 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:48 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:48 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:48 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:48 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:48 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:48 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:48 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:48 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:48 pushan kernel: ---[ end trace 874284bba13215ff ]---
Jan 31 00:56:50 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:50 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:50 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:50 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:50 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:50 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:50 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:50 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:50 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:50 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:50 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:50 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:50 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000073480eb500
Jan 31 00:56:50 pushan kernel: R10: 0000000000000000 R11: 00000073480eb500 R12: 00000000fffffffb
Jan 31 00:56:50 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:50 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:50 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:50 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:50 pushan kernel: Call Trace:
Jan 31 00:56:50 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:50 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:50 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:50 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:50 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:50 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:50 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:50 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:50 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:50 pushan kernel: ---[ end trace 874284bba1321600 ]---
Jan 31 00:56:52 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:52 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:52 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:52 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:52 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:52 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:52 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:52 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:52 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:52 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:52 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:56:52 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:52 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000073bf488e80
Jan 31 00:56:52 pushan kernel: R10: 0000000000000000 R11: 00000073bf488e80 R12: 00000000fffffffb
Jan 31 00:56:52 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:52 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:52 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:52 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:52 pushan kernel: Call Trace:
Jan 31 00:56:52 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:56:52 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:56:52 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:56:52 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:52 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:52 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:52 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:52 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:52 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:52 pushan kernel: ---[ end trace 874284bba1321601 ]---
Jan 31 00:56:54 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:56:56 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:56 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:56 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:56 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:56 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:56 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:56 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:56 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:56 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:56 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:56 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:56:56 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:56 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000074aeb223a0
Jan 31 00:56:56 pushan kernel: R10: 0000000000000000 R11: 00000074aeb223a0 R12: 00000000fffffffb
Jan 31 00:56:56 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:56 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:56 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:56 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:56 pushan kernel: Call Trace:
Jan 31 00:56:56 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:56:56 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:56:56 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:56 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:56 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:56 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:56 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:56 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:56 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:56 pushan kernel: ---[ end trace 874284bba1321602 ]---
Jan 31 00:56:58 pushan kernel: ------------[ cut here ]------------
Jan 31 00:56:58 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:58 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:56:58 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:56:58 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:56:58 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:56:58 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:56:58 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:56:58 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:56:58 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:56:58 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:56:58 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:56:58 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007525ec6c40
Jan 31 00:56:58 pushan kernel: R10: 0000000000000000 R11: 0000007525ec6c40 R12: 00000000fffffffb
Jan 31 00:56:58 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:56:58 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:56:58 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:56:58 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:56:58 pushan kernel: Call Trace:
Jan 31 00:56:58 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:56:58 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:56:58 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:56:58 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:56:58 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:56:58 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:56:58 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:56:58 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:56:58 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:56:58 pushan kernel: ---[ end trace 874284bba1321603 ]---
Jan 31 00:57:00 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:00 pushan kernel: WARNING: CPU: 1 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:00 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:00 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:00 pushan kernel: CPU: 1 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:00 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:00 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:00 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:00 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:00 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:00 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:00 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:00 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000759d263500
Jan 31 00:57:00 pushan kernel: R10: 0000000000000000 R11: 000000759d263500 R12: 00000000fffffffb
Jan 31 00:57:00 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:00 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c40000(0000) knlGS:0000000000000000
Jan 31 00:57:00 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:00 pushan kernel: CR2: 00007fa55c5df6f4 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:00 pushan kernel: Call Trace:
Jan 31 00:57:00 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:00 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:00 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:00 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:00 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:00 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:00 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:00 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:00 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:00 pushan kernel: ---[ end trace 874284bba1321604 ]---
Jan 31 00:57:02 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:04 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:04 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:04 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:04 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:04 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:04 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:04 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:04 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:04 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:04 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:04 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:04 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:04 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000768c8406a0
Jan 31 00:57:04 pushan kernel: R10: 0000000000000000 R11: 000000768c8406a0 R12: 00000000fffffffb
Jan 31 00:57:04 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:04 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:04 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:04 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:04 pushan kernel: Call Trace:
Jan 31 00:57:04 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:04 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:04 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:04 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:04 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:04 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:04 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:04 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:04 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:04 pushan kernel: ---[ end trace 874284bba1321605 ]---
Jan 31 00:57:06 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:06 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:06 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:06 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:06 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:06 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:06 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:06 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:06 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:06 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:06 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:06 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:06 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007703be9920
Jan 31 00:57:06 pushan kernel: R10: 0000000000000000 R11: 0000007703be9920 R12: 00000000fffffffb
Jan 31 00:57:06 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:06 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:06 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:06 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:06 pushan kernel: Call Trace:
Jan 31 00:57:06 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:06 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:06 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:06 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:06 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:06 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:06 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:06 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:06 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:06 pushan kernel: ---[ end trace 874284bba1321606 ]---
Jan 31 00:57:08 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:08 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:08 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:08 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:08 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:08 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:08 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:08 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:08 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:08 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:08 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:08 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:08 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000777af854a0
Jan 31 00:57:08 pushan kernel: R10: 0000000000000000 R11: 000000777af854a0 R12: 00000000fffffffb
Jan 31 00:57:08 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:08 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:08 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:08 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:08 pushan kernel: Call Trace:
Jan 31 00:57:08 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:08 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:08 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:08 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:08 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:08 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:08 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:08 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:08 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:08 pushan kernel: ---[ end trace 874284bba1321607 ]---
Jan 31 00:57:10 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:12 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:12 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:12 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:12 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:12 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:12 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:12 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:12 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:12 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:12 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:12 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:12 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:12 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 000000786a679d40
Jan 31 00:57:12 pushan kernel: R10: 0000000000000000 R11: 000000786a679d40 R12: 00000000fffffffb
Jan 31 00:57:12 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:12 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:12 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:12 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:12 pushan kernel: Call Trace:
Jan 31 00:57:12 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:12 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:12 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:12 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:12 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:12 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:12 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:12 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:12 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:12 pushan kernel: ---[ end trace 874284bba1321608 ]---
Jan 31 00:57:14 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:14 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:14 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:14 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:14 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:14 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:14 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:14 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:14 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:14 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:14 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:14 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:14 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 00000078e1a1d320
Jan 31 00:57:14 pushan kernel: R10: 0000000000000000 R11: 00000078e1a1d320 R12: 00000000fffffffb
Jan 31 00:57:14 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:14 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:14 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:14 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:14 pushan kernel: Call Trace:
Jan 31 00:57:14 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:14 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:14 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:14 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:14 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:14 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:14 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:14 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:14 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:14 pushan kernel: ---[ end trace 874284bba1321609 ]---
Jan 31 00:57:16 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:16 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:16 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:16 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:16 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:16 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:16 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:16 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:16 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:16 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:16 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:16 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:16 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007958db8120
Jan 31 00:57:16 pushan kernel: R10: 0000000000000000 R11: 0000007958db8120 R12: 00000000fffffffb
Jan 31 00:57:16 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:16 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:16 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:16 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:16 pushan kernel: Call Trace:
Jan 31 00:57:16 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:16 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:16 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:16 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:16 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:16 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:16 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:16 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:16 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:16 pushan kernel: ---[ end trace 874284bba132160a ]---
Jan 31 00:57:18 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:20 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:20 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:20 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:20 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:20 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:20 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:20 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:20 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:20 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:20 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:20 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:20 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:20 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007a483b1c20
Jan 31 00:57:20 pushan kernel: R10: 0000000000000000 R11: 0000007a483b1c20 R12: 00000000fffffffb
Jan 31 00:57:20 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:20 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:20 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:20 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:20 pushan kernel: Call Trace:
Jan 31 00:57:20 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:20 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:20 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:20 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:20 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:20 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:20 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:20 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:20 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:20 pushan kernel: ---[ end trace 874284bba132160b ]---
Jan 31 00:57:22 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:22 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:22 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:22 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:22 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:22 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:22 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:22 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:22 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:22 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:22 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:22 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:22 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007abf754aa0
Jan 31 00:57:22 pushan kernel: R10: 0000000000000000 R11: 0000007abf754aa0 R12: 00000000fffffffb
Jan 31 00:57:22 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:22 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:22 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:22 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:22 pushan kernel: Call Trace:
Jan 31 00:57:22 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:22 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:22 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:22 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:22 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:22 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:22 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:22 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:22 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:22 pushan kernel: ---[ end trace 874284bba132160c ]---
Jan 31 00:57:24 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:24 pushan kernel: WARNING: CPU: 7 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:24 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:24 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:24 pushan kernel: CPU: 7 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:24 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:24 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:24 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:24 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:24 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:24 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:24 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:24 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007b36af3b20
Jan 31 00:57:24 pushan kernel: R10: 0000000000000000 R11: 0000007b36af3b20 R12: 00000000fffffffb
Jan 31 00:57:24 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:24 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137dc0000(0000) knlGS:0000000000000000
Jan 31 00:57:24 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:24 pushan kernel: CR2: 00007fed2c324000 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:24 pushan kernel: Call Trace:
Jan 31 00:57:24 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:24 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:24 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:24 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:24 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:24 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:24 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:24 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:24 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:24 pushan kernel: ---[ end trace 874284bba132160d ]---
Jan 31 00:57:26 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:28 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:28 pushan kernel: WARNING: CPU: 0 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:28 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:28 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:28 pushan kernel: CPU: 0 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:28 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:28 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:28 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:28 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:28 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:28 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:28 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:28 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007c25fd1ba0
Jan 31 00:57:28 pushan kernel: R10: 0000000000000000 R11: 0000007c25fd1ba0 R12: 00000000fffffffb
Jan 31 00:57:28 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:28 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c00000(0000) knlGS:0000000000000000
Jan 31 00:57:28 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:28 pushan kernel: CR2: 00007f438e13af80 CR3: 00000001afe0a000 CR4: 00000000000006f0
Jan 31 00:57:28 pushan kernel: Call Trace:
Jan 31 00:57:28 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:28 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:28 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:28 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:28 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:28 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:28 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:28 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:28 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:28 pushan kernel: ---[ end trace 874284bba132160e ]---
Jan 31 00:57:30 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:30 pushan kernel: WARNING: CPU: 0 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:30 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:30 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:30 pushan kernel: CPU: 0 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:30 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:30 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:30 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:30 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:30 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:30 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:30 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:30 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007c9d376be0
Jan 31 00:57:30 pushan kernel: R10: 0000000000000000 R11: 0000007c9d376be0 R12: 00000000fffffffb
Jan 31 00:57:30 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:30 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c00000(0000) knlGS:0000000000000000
Jan 31 00:57:30 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:30 pushan kernel: CR2: 00007f438e13af80 CR3: 00000001afe0a000 CR4: 00000000000006f0
Jan 31 00:57:30 pushan kernel: Call Trace:
Jan 31 00:57:30 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:30 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:30 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:30 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:30 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:30 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:30 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:30 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:30 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:30 pushan kernel: ---[ end trace 874284bba132160f ]---
Jan 31 00:57:32 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:32 pushan kernel: WARNING: CPU: 0 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:32 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:32 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:32 pushan kernel: CPU: 0 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:32 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:32 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:32 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:32 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:32 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:32 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:32 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:32 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007d14711180
Jan 31 00:57:32 pushan kernel: R10: 0000000000000000 R11: 0000007d14711180 R12: 00000000fffffffb
Jan 31 00:57:32 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:32 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137c00000(0000) knlGS:0000000000000000
Jan 31 00:57:32 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:32 pushan kernel: CR2: 00007f438e13af80 CR3: 00000001afe0a000 CR4: 00000000000006f0
Jan 31 00:57:32 pushan kernel: Call Trace:
Jan 31 00:57:32 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:32 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:32 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:32 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:32 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:32 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:32 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:32 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:32 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:32 pushan kernel: ---[ end trace 874284bba1321610 ]---
Jan 31 00:57:34 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:36 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:36 pushan kernel: WARNING: CPU: 4 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:36 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:36 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:36 pushan kernel: CPU: 4 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:36 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:36 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:36 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:36 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:36 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:36 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:36 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:36 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007e03cb7820
Jan 31 00:57:36 pushan kernel: R10: 0000000000000000 R11: 0000007e03cb7820 R12: 00000000fffffffb
Jan 31 00:57:36 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:36 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d00000(0000) knlGS:0000000000000000
Jan 31 00:57:36 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:36 pushan kernel: CR2: 00007f3f07370030 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:36 pushan kernel: Call Trace:
Jan 31 00:57:36 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:36 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:36 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:36 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:36 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:36 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:36 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:36 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:36 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:36 pushan kernel: ---[ end trace 874284bba1321611 ]---
Jan 31 00:57:38 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:38 pushan kernel: WARNING: CPU: 4 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:38 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:38 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:38 pushan kernel: CPU: 4 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:38 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:38 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:38 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:38 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:38 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:38 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:38 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:38 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007e7b060860
Jan 31 00:57:38 pushan kernel: R10: 0000000000000000 R11: 0000007e7b060860 R12: 00000000fffffffb
Jan 31 00:57:38 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:38 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d00000(0000) knlGS:0000000000000000
Jan 31 00:57:38 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:38 pushan kernel: CR2: 00007f3f07370030 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:38 pushan kernel: Call Trace:
Jan 31 00:57:38 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:38 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:38 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:38 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:38 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:38 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:38 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:38 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:38 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:38 pushan kernel: ---[ end trace 874284bba1321612 ]---
Jan 31 00:57:40 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:40 pushan kernel: WARNING: CPU: 4 PID: 56 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:40 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:40 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:40 pushan kernel: CPU: 4 PID: 56 Comm: kworker/u16:5 Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:40 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:40 pushan kernel: Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Jan 31 00:57:40 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:40 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:40 pushan kernel: RSP: 0018:ffffc0258022fd60 EFLAGS: 00010282
Jan 31 00:57:40 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:40 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc0258022fc90 RDI: ffffc0258022fd30
Jan 31 00:57:40 pushan kernel: RBP: ffffc0258022fd60 R08: 0000000000000000 R09: 0000007ef23fcd00
Jan 31 00:57:40 pushan kernel: R10: 0000000000000000 R11: 0000007ef23fcd00 R12: 00000000fffffffb
Jan 31 00:57:40 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: 0000000000000000
Jan 31 00:57:40 pushan kernel: FS:  0000000000000000(0000) GS:ffff9c0137d00000(0000) knlGS:0000000000000000
Jan 31 00:57:40 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:40 pushan kernel: CR2: 00007f3f07370030 CR3: 00000001afe0a000 CR4: 00000000000006e0
Jan 31 00:57:40 pushan kernel: Call Trace:
Jan 31 00:57:40 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:40 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:40 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:40 pushan kernel:  process_one_work+0x1b6/0x350
Jan 31 00:57:40 pushan kernel:  worker_thread+0x53/0x3e0
Jan 31 00:57:40 pushan kernel:  ? process_one_work+0x350/0x350
Jan 31 00:57:40 pushan kernel:  kthread+0x11b/0x140
Jan 31 00:57:40 pushan kernel:  ? __kthread_bind_mask+0x60/0x60
Jan 31 00:57:40 pushan kernel:  ret_from_fork+0x22/0x30
Jan 31 00:57:40 pushan kernel: ---[ end trace 874284bba1321613 ]---
Jan 31 00:57:42 pushan kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Jan 31 00:57:44 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:44 pushan kernel: WARNING: CPU: 6 PID: 497 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:44 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:44 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:44 pushan kernel: CPU: 6 PID: 497 Comm: systemd-logind Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:44 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:44 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:44 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:44 pushan kernel: RSP: 0018:ffffc025806878d8 EFLAGS: 00010282
Jan 31 00:57:44 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000003 RCX: 0000000000000000
Jan 31 00:57:44 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc02580687808 RDI: ffffc025806878a8
Jan 31 00:57:44 pushan kernel: RBP: ffffc025806878d8 R08: 0000000000000000 R09: 0000007fe14ad040
Jan 31 00:57:44 pushan kernel: R10: 0000000000000000 R11: 0000007fe14ad040 R12: 00000000fffffffb
Jan 31 00:57:44 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: ffff9c00002f2008
Jan 31 00:57:44 pushan kernel: FS:  00007f08cc49e980(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:57:44 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:44 pushan kernel: CR2: 00007f51d9a4e000 CR3: 000000011163c000 CR4: 00000000000006e0
Jan 31 00:57:44 pushan kernel: Call Trace:
Jan 31 00:57:44 pushan kernel:  base507c_ntfy_set+0x2f/0x90 [nouveau]
Jan 31 00:57:44 pushan kernel:  nv50_wndw_flush_set+0x68/0x1c0 [nouveau]
Jan 31 00:57:44 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:44 pushan kernel:  ? wait_for_completion_interruptible+0x20/0x40
Jan 31 00:57:44 pushan kernel:  nv50_disp_atomic_commit+0x17d/0x1a0 [nouveau]
Jan 31 00:57:44 pushan kernel:  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
Jan 31 00:57:44 pushan kernel:  drm_client_modeset_commit_locked+0x56/0x150 [drm]
Jan 31 00:57:44 pushan kernel:  drm_fb_helper_set_par+0x75/0xd0 [drm_kms_helper]
Jan 31 00:57:44 pushan kernel:  fb_set_var+0x183/0x350
Jan 31 00:57:44 pushan kernel:  ? check_preempt_curr+0x29/0x60
Jan 31 00:57:44 pushan kernel:  fbcon_blank+0x17b/0x280
Jan 31 00:57:44 pushan kernel:  do_unblank_screen+0xaa/0x150
Jan 31 00:57:44 pushan kernel:  complete_change_console+0x54/0x130
Jan 31 00:57:44 pushan kernel:  vt_ioctl+0xad5/0x1520
Jan 31 00:57:44 pushan kernel:  tty_ioctl+0x395/0x910
Jan 31 00:57:44 pushan kernel:  __x64_sys_ioctl+0x83/0xb0
Jan 31 00:57:44 pushan kernel:  do_syscall_64+0x33/0x80
Jan 31 00:57:44 pushan kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jan 31 00:57:44 pushan kernel: RIP: 0033:0x7f08ccd7ecc7
Jan 31 00:57:44 pushan kernel: Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
Jan 31 00:57:44 pushan kernel: RSP: 002b:00007ffd06530df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Jan 31 00:57:44 pushan kernel: RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f08ccd7ecc7
Jan 31 00:57:44 pushan kernel: RDX: 0000000000000001 RSI: 0000000000005605 RDI: 000000000000001c
Jan 31 00:57:44 pushan kernel: RBP: 000000000000001c R08: 0000000000000000 R09: 0000000000000000
Jan 31 00:57:44 pushan kernel: R10: 00007ffd06530de0 R11: 0000000000000246 R12: 00007ffd06530e78
Jan 31 00:57:44 pushan kernel: R13: 000055e7396a0090 R14: 0000000000000106 R15: 0000000000000000
Jan 31 00:57:44 pushan kernel: ---[ end trace 874284bba1321614 ]---
Jan 31 00:57:46 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:46 pushan kernel: WARNING: CPU: 6 PID: 497 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:46 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:46 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:46 pushan kernel: CPU: 6 PID: 497 Comm: systemd-logind Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:46 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:46 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:46 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:46 pushan kernel: RSP: 0018:ffffc025806878d8 EFLAGS: 00010282
Jan 31 00:57:46 pushan kernel: RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
Jan 31 00:57:46 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc02580687808 RDI: ffffc025806878a8
Jan 31 00:57:46 pushan kernel: RBP: ffffc025806878d8 R08: 0000000000000000 R09: 000000805885ed00
Jan 31 00:57:46 pushan kernel: R10: 0000000000000000 R11: 000000805885ed00 R12: 00000000fffffffb
Jan 31 00:57:46 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: ffff9c00002f2008
Jan 31 00:57:46 pushan kernel: FS:  00007f08cc49e980(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:57:46 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:46 pushan kernel: CR2: 00007f51d9a4e000 CR3: 000000011163c000 CR4: 00000000000006e0
Jan 31 00:57:46 pushan kernel: Call Trace:
Jan 31 00:57:46 pushan kernel:  base827c_image_set+0x2f/0x1d0 [nouveau]
Jan 31 00:57:46 pushan kernel:  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
Jan 31 00:57:46 pushan kernel:  nv50_disp_atomic_commit_tail+0x4eb/0x7d0 [nouveau]
Jan 31 00:57:46 pushan kernel:  ? wait_for_completion_interruptible+0x20/0x40
Jan 31 00:57:46 pushan kernel:  nv50_disp_atomic_commit+0x17d/0x1a0 [nouveau]
Jan 31 00:57:46 pushan kernel:  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
Jan 31 00:57:46 pushan kernel:  drm_client_modeset_commit_locked+0x56/0x150 [drm]
Jan 31 00:57:46 pushan kernel:  drm_fb_helper_set_par+0x75/0xd0 [drm_kms_helper]
Jan 31 00:57:46 pushan kernel:  fb_set_var+0x183/0x350
Jan 31 00:57:46 pushan kernel:  ? check_preempt_curr+0x29/0x60
Jan 31 00:57:46 pushan kernel:  fbcon_blank+0x17b/0x280
Jan 31 00:57:46 pushan kernel:  do_unblank_screen+0xaa/0x150
Jan 31 00:57:46 pushan kernel:  complete_change_console+0x54/0x130
Jan 31 00:57:46 pushan kernel:  vt_ioctl+0xad5/0x1520
Jan 31 00:57:46 pushan kernel:  tty_ioctl+0x395/0x910
Jan 31 00:57:46 pushan kernel:  __x64_sys_ioctl+0x83/0xb0
Jan 31 00:57:46 pushan kernel:  do_syscall_64+0x33/0x80
Jan 31 00:57:46 pushan kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jan 31 00:57:46 pushan kernel: RIP: 0033:0x7f08ccd7ecc7
Jan 31 00:57:46 pushan kernel: Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
Jan 31 00:57:46 pushan kernel: RSP: 002b:00007ffd06530df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Jan 31 00:57:46 pushan kernel: RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f08ccd7ecc7
Jan 31 00:57:46 pushan kernel: RDX: 0000000000000001 RSI: 0000000000005605 RDI: 000000000000001c
Jan 31 00:57:46 pushan kernel: RBP: 000000000000001c R08: 0000000000000000 R09: 0000000000000000
Jan 31 00:57:46 pushan kernel: R10: 00007ffd06530de0 R11: 0000000000000246 R12: 00007ffd06530e78
Jan 31 00:57:46 pushan kernel: R13: 000055e7396a0090 R14: 0000000000000106 R15: 0000000000000000
Jan 31 00:57:46 pushan kernel: ---[ end trace 874284bba1321615 ]---
Jan 31 00:57:48 pushan kernel: ------------[ cut here ]------------
Jan 31 00:57:48 pushan kernel: WARNING: CPU: 6 PID: 497 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:48 pushan kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq rfkill xfs libcrc32c snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_usb_audio snd_intel_dspcfg soundwire_intel soundwire_generic_allocation snd_usbmidi_lib snd_rawmidi snd_soc_core snd_seq_device snd_compress mc soundwire_cadence snd_hda_codec coretemp snd_hda_core snd_hwdep kvm_intel soundwire_bus snd_pcm kvm snd_timer ppdev iTCO_wdt evdev snd irqbypass intel_pmc_bxt mei_wdt mei_me soundcore iTCO_vendor_support parport_pc intel_cstate watchdog i7core_edac parport sg mei intel_uncore at24 serio_raw pcspkr acpi_cpufreq tpm_tis tpm_tis_core tpm rng_core msr fuse configfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_common hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper ahci libahci ata_generic psmouse cec ehci_pci libata ehci_hcd drm usbcore 
 e1000e scsi_mod
Jan 31 00:57:48 pushan kernel:  crc32c_intel i2c_i801 i2c_smbus lpc_ich ptp pps_core usb_common wmi button
Jan 31 00:57:48 pushan kernel: CPU: 6 PID: 497 Comm: systemd-logind Tainted: G        W         5.10.0-2-amd64 #1 Debian 5.10.9-1
Jan 31 00:57:48 pushan kernel: Hardware name: Acer Veriton S680G      /Veriton M680G, BIOS P01-A4         05/27/2010
Jan 31 00:57:48 pushan kernel: RIP: 0010:nv50_dmac_wait+0x1e1/0x230 [nouveau]
Jan 31 00:57:48 pushan kernel: Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
Jan 31 00:57:48 pushan kernel: RSP: 0018:ffffc025806878d8 EFLAGS: 00010282
Jan 31 00:57:48 pushan kernel: RAX: ffffffffffffff92 RBX: 0000000000000002 RCX: 0000000000000000
Jan 31 00:57:48 pushan kernel: RDX: ffffffffffffff92 RSI: ffffc02580687808 RDI: ffffc025806878a8
Jan 31 00:57:48 pushan kernel: RBP: ffffc025806878d8 R08: 0000000000000000 R09: 00000080cfc02480
Jan 31 00:57:48 pushan kernel: R10: 0000000000000000 R11: 00000080cfc02480 R12: 00000000fffffffb
Jan 31 00:57:48 pushan kernel: R13: ffff9c00002f5b68 R14: ffff9c00002f5ba8 R15: ffff9c00002f2008
Jan 31 00:57:48 pushan kernel: FS:  00007f08cc49e980(0000) GS:ffff9c0137d80000(0000) knlGS:0000000000000000
Jan 31 00:57:48 pushan kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 31 00:57:48 pushan kernel: CR2: 00007f51d9a4e000 CR3: 000000011163c000 CR4: 00000000000006e0
Jan 31 00:57:48 pushan kernel: Call Trace:
Jan 31 00:57:48 pushan kernel:  base507c_update+0x30/0x70 [nouveau]
Jan 31 00:57:48 pushan kernel:  nv50_disp_atomic_commit_wndw+0x5a/0x70 [nouveau]
Jan 31 00:57:48 pushan kernel:  nv50_disp_atomic_commit_tail+0x509/0x7d0 [nouveau]
Jan 31 00:57:48 pushan kernel:  ? wait_for_completion_interruptible+0x20/0x40
Jan 31 00:57:48 pushan kernel:  nv50_disp_atomic_commit+0x17d/0x1a0 [nouveau]
Jan 31 00:57:48 pushan kernel:  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
Jan 31 00:57:48 pushan kernel:  drm_client_modeset_commit_locked+0x56/0x150 [drm]
Jan 31 00:57:48 pushan kernel:  drm_fb_helper_set_par+0x75/0xd0 [drm_kms_helper]
Jan 31 00:57:48 pushan kernel:  fb_set_var+0x183/0x350
Jan 31 00:57:48 pushan kernel:  ? check_preempt_curr+0x29/0x60
Jan 31 00:57:48 pushan kernel:  fbcon_blank+0x17b/0x280
Jan 31 00:57:48 pushan kernel:  do_unblank_screen+0xaa/0x150
Jan 31 00:57:48 pushan kernel:  complete_change_console+0x54/0x130
Jan 31 00:57:48 pushan kernel:  vt_ioctl+0xad5/0x1520
Jan 31 00:57:48 pushan kernel:  tty_ioctl+0x395/0x910
Jan 31 00:57:48 pushan kernel:  __x64_sys_ioctl+0x83/0xb0
Jan 31 00:57:48 pushan kernel:  do_syscall_64+0x33/0x80
Jan 31 00:57:48 pushan kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jan 31 00:57:48 pushan kernel: RIP: 0033:0x7f08ccd7ecc7
Jan 31 00:57:48 pushan kernel: Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
Jan 31 00:57:48 pushan kernel: RSP: 002b:00007ffd06530df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Jan 31 00:57:48 pushan kernel: RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f08ccd7ecc7
Jan 31 00:57:48 pushan kernel: RDX: 0000000000000001 RSI: 0000000000005605 RDI: 000000000000001c
Jan 31 00:57:48 pushan kernel: RBP: 000000000000001c R08: 0000000000000000 R09: 0000000000000000
Jan 31 00:57:48 pushan kernel: R10: 00007ffd06530de0 R11: 0000000000000246 R12: 00007ffd06530e78
Jan 31 00:57:48 pushan kernel: R13: 000055e7396a0090 R14: 0000000000000106 R15: 0000000000000000
Jan 31 00:57:48 pushan kernel: ---[ end trace 874284bba1321616 ]---
Jan 31 00:57:49 pushan kernel: rfkill: input handler enabled
Jan 31 00:57:49 pushan kernel: rfkill: input handler disabled
Jan 31 00:57:55 pushan kernel: rfkill: input handler enabled
Jan 31 00:57:59 pushan kernel: XFS (sda6): Unmounting Filesystem
Jan 31 00:57:59 pushan systemd-shutdown[1]: Syncing filesystems and block devices.
Jan 31 00:58:00 pushan systemd-shutdown[1]: Sending SIGTERM to remaining processes...

** Model information
sys_vendor: Acer
product_name: Veriton S680G      
product_version: 
chassis_vendor: Acer
chassis_version: 
bios_vendor: Acer
bios_version: P01-A4        
board_vendor: Acer
board_name: Veriton M680G
board_version: 

** Loaded modules:
snd_seq_dummy
snd_hrtimer
snd_seq
rfkill
xfs
libcrc32c
snd_hda_codec_realtek
snd_hda_codec_generic
ledtrig_audio
snd_hda_codec_hdmi
snd_hda_intel
snd_intel_dspcfg
soundwire_intel
snd_usb_audio
soundwire_generic_allocation
snd_soc_core
coretemp
snd_compress
soundwire_cadence
snd_usbmidi_lib
snd_hda_codec
snd_rawmidi
snd_hda_core
snd_seq_device
snd_hwdep
kvm_intel
mc
soundwire_bus
snd_pcm
kvm
snd_timer
mei_wdt
iTCO_wdt
snd
irqbypass
soundcore
mei_me
intel_pmc_bxt
iTCO_vendor_support
mei
ppdev
at24
watchdog
intel_cstate
intel_uncore
i7core_edac
sg
serio_raw
pcspkr
tpm_tis
tpm_tis_core
tpm
evdev
rng_core
acpi_cpufreq
parport_pc
parport
fuse
msr
configfs
ip_tables
x_tables
autofs4
ext4
crc16
mbcache
jbd2
crc32c_generic
sd_mod
t10_pi
crc_t10dif
crct10dif_generic
sr_mod
cdrom
crct10dif_common
hid_generic
usbhid
hid
nouveau
mxm_wmi
video
i2c_algo_bit
ttm
drm_kms_helper
ahci
libahci
cec
ata_generic
libata
drm
psmouse
ehci_pci
ehci_hcd
e1000e
usbcore
scsi_mod
crc32c_intel
lpc_ich
i2c_i801
ptp
i2c_smbus
usb_common
pps_core
wmi
button

** PCI devices:
00:00.0 Host bridge [0600]: Intel Corporation Core Processor DMI [8086:d131] (rev 11)
	Subsystem: Acer Incorporated [ALI] Core Processor DMI [1025:0290]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 0
	Capabilities: <access denied>

00:03.0 PCI bridge [0604]: Intel Corporation Core Processor PCI Express Root Port 1 [8086:d138] (rev 11) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 30
	IOMMU group: 1
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 0000e000-0000efff [size=4K]
	Memory behind bridge: faf00000-fbffffff [size=17M]
	Prefetchable memory behind bridge: 00000000ce000000-00000000dfffffff [size=288M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA+ VGA16+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:08.0 System peripheral [0880]: Intel Corporation Core Processor System Management Registers [8086:d155] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 2
	Capabilities: <access denied>

00:08.1 System peripheral [0880]: Intel Corporation Core Processor Semaphore and Scratchpad Registers [8086:d156] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 3
	Capabilities: <access denied>

00:08.2 System peripheral [0880]: Intel Corporation Core Processor System Control and Status Registers [8086:d157] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 4
	Capabilities: <access denied>

00:08.3 System peripheral [0880]: Intel Corporation Core Processor Miscellaneous Registers [8086:d158] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 5

00:10.0 System peripheral [0880]: Intel Corporation Core Processor QPI Link [8086:d150] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 6

00:10.1 System peripheral [0880]: Intel Corporation Core Processor QPI Routing and Protocol Registers [8086:d151] (rev 11)
	Subsystem: Device [0025:0090]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 6

00:16.0 Communication controller [0780]: Intel Corporation 5 Series/3400 Series Chipset HECI Controller [8086:3b64] (rev 06)
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset HECI Controller [1025:0290]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 34
	IOMMU group: 7
	Region 0: Memory at faefe000 (64-bit, non-prefetchable) [size=16]
	Capabilities: <access denied>
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:16.2 IDE interface [0101]: Intel Corporation 5 Series/3400 Series Chipset PT IDER Controller [8086:3b66] (rev 06) (prog-if 85 [PCI native mode-only controller, supports bus mastering])
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset PT IDER Controller [1025:0290]
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin C routed to IRQ 18
	IOMMU group: 7
	Region 0: I/O ports at dc00 [size=8]
	Region 1: I/O ports at d880 [size=4]
	Region 2: I/O ports at d800 [size=8]
	Region 3: I/O ports at d480 [size=4]
	Region 4: I/O ports at d400 [size=16]
	Capabilities: <access denied>
	Kernel driver in use: ata_generic
	Kernel modules: ata_generic

00:16.3 Serial controller [0700]: Intel Corporation 5 Series/3400 Series Chipset KT Controller [8086:3b67] (rev 06) (prog-if 02 [16550])
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset KT Controller [1025:0290]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin B routed to IRQ 17
	IOMMU group: 7
	Region 0: I/O ports at d080 [size=8]
	Region 1: Memory at faefc000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: serial

00:19.0 Ethernet controller [0200]: Intel Corporation 82578DM Gigabit Network Connection [8086:10ef] (rev 06)
	Subsystem: Acer Incorporated [ALI] 82578DM Gigabit Network Connection [1025:8000]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 31
	IOMMU group: 8
	Region 0: Memory at faec0000 (32-bit, non-prefetchable) [size=128K]
	Region 1: Memory at faefa000 (32-bit, non-prefetchable) [size=4K]
	Region 2: I/O ports at d000 [size=32]
	Capabilities: <access denied>
	Kernel driver in use: e1000e
	Kernel modules: e1000e

00:1a.0 USB controller [0c03]: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [8086:3b3c] (rev 06) (prog-if 20 [EHCI])
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [1025:0290]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 9
	Region 0: Memory at faef8000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: <access denied>
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:1b.0 Audio device [0403]: Intel Corporation 5 Series/3400 Series Chipset High Definition Audio [8086:3b56] (rev 06)
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset High Definition Audio [1025:0290]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 35
	IOMMU group: 10
	Region 0: Memory at faef4000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1d.0 USB controller [0c03]: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [8086:3b34] (rev 06) (prog-if 20 [EHCI])
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [1025:0290]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 23
	IOMMU group: 11
	Region 0: Memory at faef2000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: <access denied>
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev a6) (prog-if 01 [Subtractive decode])
	Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 12
	Bus: primary=00, secondary=02, subordinate=02, sec-latency=32
	I/O behind bridge: [disabled]
	Memory behind bridge: [disabled]
	Prefetchable memory behind bridge: [disabled]
	Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>

00:1f.0 ISA bridge [0601]: Intel Corporation Q57 Chipset LPC Interface Controller [8086:3b0a] (rev 06)
	Subsystem: Acer Incorporated [ALI] Q57 Chipset LPC Interface Controller [1025:0290]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 13
	Capabilities: <access denied>
	Kernel driver in use: lpc_ich
	Kernel modules: lpc_ich

00:1f.2 SATA controller [0106]: Intel Corporation 5 Series/3400 Series Chipset 6 port SATA AHCI Controller [8086:3b22] (rev 06) (prog-if 01 [AHCI 1.0])
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset 6 port SATA AHCI Controller [1025:0290]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin B routed to IRQ 32
	IOMMU group: 13
	Region 0: I/O ports at cc00 [size=8]
	Region 1: I/O ports at c880 [size=4]
	Region 2: I/O ports at c800 [size=8]
	Region 3: I/O ports at c480 [size=4]
	Region 4: I/O ports at c400 [size=32]
	Region 5: Memory at faef0000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: <access denied>
	Kernel driver in use: ahci
	Kernel modules: ahci

00:1f.3 SMBus [0c05]: Intel Corporation 5 Series/3400 Series Chipset SMBus Controller [8086:3b30] (rev 06)
	Subsystem: Acer Incorporated [ALI] 5 Series/3400 Series Chipset SMBus Controller [1025:0290]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin C routed to IRQ 18
	IOMMU group: 13
	Region 0: Memory at faeee000 (64-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at 0400 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT215 [GeForce GT 220] [10de:0ca5] (rev a2) (prog-if 00 [VGA controller])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 33
	IOMMU group: 14
	Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
	Region 3: Memory at ce000000 (64-bit, prefetchable) [size=32M]
	Region 5: I/O ports at ec00 [size=128]
	Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: nouveau
	Kernel modules: nouveau

01:00.1 Audio device [0403]: NVIDIA Corporation High Definition Audio Controller [10de:0be4] (rev a1)
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin B routed to IRQ 17
	IOMMU group: 14
	Region 0: Memory at faf7c000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

ff:00.0 Host bridge [0600]: Intel Corporation Core Processor QuickPath Architecture Generic Non-Core Registers [8086:2c51] (rev 04)
	Subsystem: Intel Corporation Core Processor QuickPath Architecture Generic Non-Core Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 15

ff:00.1 Host bridge [0600]: Intel Corporation Core Processor QuickPath Architecture System Address Decoder [8086:2c81] (rev 04)
	Subsystem: Intel Corporation Core Processor QuickPath Architecture System Address Decoder [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 15

ff:02.0 Host bridge [0600]: Intel Corporation Core Processor QPI Link 0 [8086:2c90] (rev 04)
	Subsystem: Intel Corporation Core Processor QPI Link 0 [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 16
	Kernel driver in use: i7core_edac
	Kernel modules: i7core_edac

ff:02.1 Host bridge [0600]: Intel Corporation Core Processor QPI Physical 0 [8086:2c91] (rev 04)
	Subsystem: Intel Corporation Core Processor QPI Physical 0 [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 16

ff:03.0 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller [8086:2c98] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 17

ff:03.1 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Target Address Decoder [8086:2c99] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Target Address Decoder [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 17

ff:03.4 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Test Registers [8086:2c9c] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Test Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 17

ff:04.0 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Control Registers [8086:2ca0] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Control Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 18

ff:04.1 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Address Registers [8086:2ca1] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Address Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 18

ff:04.2 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Rank Registers [8086:2ca2] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Rank Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 18

ff:04.3 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Thermal Control Registers [8086:2ca3] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 0 Thermal Control Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 18

ff:05.0 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Control Registers [8086:2ca8] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Control Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 19

ff:05.1 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Address Registers [8086:2ca9] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Address Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 19

ff:05.2 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Rank Registers [8086:2caa] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Rank Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 19

ff:05.3 Host bridge [0600]: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Thermal Control Registers [8086:2cab] (rev 04)
	Subsystem: Intel Corporation Core Processor Integrated Memory Controller Channel 1 Thermal Control Registers [8086:8086]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 19


** USB devices:
Bus 002 Device 023: ID 17ef:600e Lenovo Optical Mouse
Bus 002 Device 003: ID 0461:0010 Primax Electronics, Ltd HP PR1101U / Primax PMX-KPR1101U Keyboard
Bus 002 Device 002: ID 8087:0020 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 003: ID 046d:0a38 Logitech, Inc. Headset H340
Bus 001 Device 002: ID 8087:0020 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub


-- System Information:
Debian Release: bullseye/sid
  APT prefers stable-updates
  APT policy: (500, 'stable-updates'), (500, 'testing'), (500, 'stable')
Architecture: amd64 (x86_64)

Kernel: Linux 5.10.0-2-amd64 (SMP w/8 CPU threads)
Locale: LANG=en_AU.UTF-8, LC_CTYPE=en_AU.UTF-8 (charmap=UTF-8), LANGUAGE=en_AU:en
Shell: /bin/sh linked to /usr/bin/dash
Init: systemd (via /run/systemd/system)
LSM: AppArmor: enabled

Versions of packages linux-image-5.10.0-2-amd64 depends on:
ii  initramfs-tools [linux-initramfs-tool]  0.139
ii  kmod                                    28-1
ii  linux-base                              4.6

Versions of packages linux-image-5.10.0-2-amd64 recommends:
ii  apparmor             2.13.6-7
ii  firmware-linux-free  20200122-1

Versions of packages linux-image-5.10.0-2-amd64 suggests:
pn  debian-kernel-handbook  <none>
ii  grub-pc                 2.04-12
pn  linux-doc-5.10          <none>

Versions of packages linux-image-5.10.0-2-amd64 is related to:
ii  firmware-amd-graphics     20190114-2
pn  firmware-atheros          <none>
pn  firmware-bnx2             <none>
pn  firmware-bnx2x            <none>
pn  firmware-brcm80211        <none>
pn  firmware-cavium           <none>
pn  firmware-intel-sound      <none>
pn  firmware-intelwimax       <none>
pn  firmware-ipw2x00          <none>
pn  firmware-ivtv             <none>
pn  firmware-iwlwifi          <none>
pn  firmware-libertas         <none>
ii  firmware-linux-nonfree    20190114-2
ii  firmware-misc-nonfree     20190114-2
pn  firmware-myricom          <none>
pn  firmware-netxen           <none>
pn  firmware-qlogic           <none>
pn  firmware-realtek          <none>
pn  firmware-samsung          <none>
pn  firmware-siano            <none>
pn  firmware-ti-connectivity  <none>
pn  xen-hypervisor            <none>

-- no debconf information
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
