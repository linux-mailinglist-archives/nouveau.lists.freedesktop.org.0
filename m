Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F32CDA9D
	for <lists+nouveau@lfdr.de>; Thu,  3 Dec 2020 17:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EEA893A8;
	Thu,  3 Dec 2020 16:04:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 454 seconds by postgrey-1.36 at gabe;
 Wed, 02 Dec 2020 10:59:31 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD7C89C21
 for <nouveau@lists.freedesktop.org>; Wed,  2 Dec 2020 10:59:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f161b005f182bceb5dadd19.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f16:1b00:5f18:2bce:b5da:dd19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A796A1EC04D6;
 Wed,  2 Dec 2020 11:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606906313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCvmqz8CoZq8pnjQANShOi9MwQYcJ7ld7P2w87zbPO4=;
 b=SYcPUSRwAoXqHioFIH20Xlk7LxypFroUmKzV6E/VY+hlhTU9DaChi8NBC/gr7GiipYoU5i
 qZ926Z4MTK9Udn18p5sQYG7AKIOrbioF44BNiBOe6AQbVFhmaLo29ht4wmC+LbYD61OBHO
 /A9ybfvjuvexVasO+xLLcyM9VAo9WQU=
Date: Wed, 2 Dec 2020 11:51:53 +0100
From: Borislav Petkov <bp@alien8.de>
To: Capek Pavel <Pavel.Capek@vscht.cz>, nouveau@lists.freedesktop.org
Message-ID: <20201202105153.GB2951@zn.tnic>
References: <db851eb475244b27815576e7ee61c208@vscht.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db851eb475244b27815576e7ee61c208@vscht.cz>
X-Mailman-Approved-At: Thu, 03 Dec 2020 16:04:45 +0000
Subject: Re: [Nouveau] problem with tainted kernels in Fedora 32
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
Cc: "x86@kernel.org" <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

+ nouveau@lists.freedesktop.org

On Wed, Dec 02, 2020 at 10:32:57AM +0000, Capek Pavel wrote:
> Dear kernel maintainers,
> 
> After upgrading Fedora from 31 to 32 I try to deal with frequent and substantial slowing down of the OS. The computer does not react at random when I move a mouse or I type some characters. After some time, e.g., 30 minutes, the OS recovers and is ready to interact with a user. Since the problem cannot be reported by means of standard links, I write you directly. The malfunction seems to be related to the graphical card and error messages after each start, see the attachment. The computer is equipped with two CPU Xeon E5-2687W 3.1 20M 1600 8C, 48GB RAM and NVIDIA Quadro 600 1GB GFX. Is there any chance to get rid of this malfunction? The use of the last kernel from Fedora 31 has a limited life-time.
> 

I've added the nouveau people to Cc for the nouveau splat at the end.

The taint happens because mcelog does write an MSR but that is going to
be fixed and is not related to your issue. To verify, you can disable
mcelog and reboot - it should not change how it fails.

Leaving in the rest for the newly CCed.

HTH.

> Thank you for helping me,
> Pavel Capek
> Prague

> [    0.000000] microcode: microcode updated early to revision 0x71a, date = 2020-03-24
> [    0.000000] Linux version 5.9.10-100.fc32.x86_64 (mockbuild@bkernel01.iad2.fedoraproject.org) (gcc (GCC) 10.2.1 20201016 (Red Hat 10.2.1-6), GNU ld version 2.34-6.fc32) #1 SMP Mon Nov 23 18:12:36 UTC 2020
> [    0.000000] Command line: BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.9.10-100.fc32.x86_64 root=/dev/mapper/fedora_111--a77c--01-root ro rd.lvm.lv=fedora_111-a77c-01/root rd.lvm.lv=fedora_111-a77c-01/swap rhgb quiet
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cb712fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000cb713000-0x00000000cb714fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cb715000-0x00000000cb7bdfff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cb7be000-0x00000000cba08fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cba09000-0x00000000cba85fff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000cba86000-0x00000000cba8efff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cba8f000-0x00000000cba90fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000cba91000-0x00000000cba9cfff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cba9d000-0x00000000cbaaffff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cbab0000-0x00000000cbb37fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cbb38000-0x00000000cbb3ffff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cbb40000-0x00000000cbb52fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000cbb53000-0x00000000cbd55fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cbd56000-0x00000000cbffffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000c2fffffff] usable
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] e820: update [mem 0x037da018-0x037e3057] usable ==> usable
> [    0.000000] e820: update [mem 0x037da018-0x037e3057] usable ==> usable
> [    0.000000] e820: update [mem 0x037e4018-0x037ed057] usable ==> usable
> [    0.000000] e820: update [mem 0x037e4018-0x037ed057] usable ==> usable
> [    0.000000] e820: update [mem 0x037f3018-0x037ff457] usable ==> usable
> [    0.000000] e820: update [mem 0x037f3018-0x037ff457] usable ==> usable
> [    0.000000] e820: update [mem 0x03a97018-0x03ab0257] usable ==> usable
> [    0.000000] e820: update [mem 0x03a97018-0x03ab0257] usable ==> usable
> [    0.000000] e820: update [mem 0x03ab1018-0x03ac7657] usable ==> usable
> [    0.000000] e820: update [mem 0x03ab1018-0x03ac7657] usable ==> usable
> [    0.000000] e820: update [mem 0x03853018-0x03862057] usable ==> usable
> [    0.000000] e820: update [mem 0x03853018-0x03862057] usable ==> usable
> [    0.000000] extended physical RAM map:
> [    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000000100000-0x00000000037da017] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037da018-0x00000000037e3057] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037e3058-0x00000000037e4017] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037e4018-0x00000000037ed057] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037ed058-0x00000000037f3017] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037f3018-0x00000000037ff457] usable
> [    0.000000] reserve setup_data: [mem 0x00000000037ff458-0x0000000003853017] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003853018-0x0000000003862057] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003862058-0x0000000003a97017] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003a97018-0x0000000003ab0257] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003ab0258-0x0000000003ab1017] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003ab1018-0x0000000003ac7657] usable
> [    0.000000] reserve setup_data: [mem 0x0000000003ac7658-0x00000000cb712fff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000cb713000-0x00000000cb714fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cb715000-0x00000000cb7bdfff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000cb7be000-0x00000000cba08fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cba09000-0x00000000cba85fff] ACPI data
> [    0.000000] reserve setup_data: [mem 0x00000000cba86000-0x00000000cba8efff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cba8f000-0x00000000cba90fff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000cba91000-0x00000000cba9cfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cba9d000-0x00000000cbaaffff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000cbab0000-0x00000000cbb37fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cbb38000-0x00000000cbb3ffff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000cbb40000-0x00000000cbb52fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000cbb53000-0x00000000cbd55fff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000cbd56000-0x00000000cbffffff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000100000000-0x0000000c2fffffff] usable
> [    0.000000] efi: EFI v2.10 by American Megatrends
> [    0.000000] efi: ACPI 2.0=0xcba09000 SMBIOS=0xcbb51998 ACPI=0xcba09000 
> [    0.000000] secureboot: Secure boot disabled
> [    0.000000] SMBIOS 2.7 present.
> [    0.000000] DMI: Hewlett-Packard HP Z820 Workstation/158B, BIOS J63 v01.14 07/17/2012
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 3092.663 MHz processor
> [    0.001129] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.001130] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.001137] last_pfn = 0xc30000 max_arch_pfn = 0x400000000
> [    0.001141] MTRR default type: write-back
> [    0.001142] MTRR fixed ranges enabled:
> [    0.001142]   00000-9FFFF write-back
> [    0.001143]   A0000-BFFFF uncachable
> [    0.001144]   C0000-D7FFF write-protect
> [    0.001144]   D8000-E9FFF uncachable
> [    0.001145]   EA000-FFFFF write-protect
> [    0.001145] MTRR variable ranges enabled:
> [    0.001146]   0 base 0000CC000000 mask 3FFFFC000000 uncachable
> [    0.001147]   1 base 0000D0000000 mask 3FFFF0000000 uncachable
> [    0.001148]   2 base 0000E0000000 mask 3FFFE0000000 uncachable
> [    0.001148]   3 base 000C30000000 mask 3FFFF0000000 uncachable
> [    0.001149]   4 disabled
> [    0.001149]   5 disabled
> [    0.001150]   6 disabled
> [    0.001150]   7 disabled
> [    0.001150]   8 disabled
> [    0.001151]   9 disabled
> [    0.001421] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> [    0.001542] last_pfn = 0xcc000 max_arch_pfn = 0x400000000
> [    0.005812] found SMP MP-table at [mem 0x000f49f0-0x000f49ff]
> [    0.005863] Using GB pages for direct mapping
> [    0.006347] secureboot: Secure boot disabled
> [    0.006348] RAMDISK: [mem 0x5bbb3000-0x5dba7fff]
> [    0.006355] ACPI: Early table checksum verification disabled
> [    0.006358] ACPI: RSDP 0x00000000CBA09000 000024 (v02 HPQOEM)
> [    0.006360] ACPI: XSDT 0x00000000CBA09078 00006C (v01 HPQOEM SLIC-WKS 01072009 AMI  00010013)
> [    0.006365] ACPI: FACP 0x00000000CBA118E0 0000F4 (v04 HPQOEM SLIC-WKS 01072009 AMI  00010013)
> [    0.006369] ACPI: DSDT 0x00000000CBA09170 008770 (v02 HPQOEM SLIC-WKS 00000114 INTL 20051117)
> [    0.006372] ACPI: FACS 0x00000000CBB3DF80 000040
> [    0.006374] ACPI: APIC 0x00000000CBA119D8 00016A (v03 HPQOEM SLIC-WKS 01072009 AMI  00010013)
> [    0.006376] ACPI: MCFG 0x00000000CBA11B48 00003C (v01 HPQOEM OEMMCFG. 01072009 MSFT 00000097)
> [    0.006378] ACPI: SRAT 0x00000000CBA11B88 0004B0 (v01 A M I  AMI SRAT 00000001 AMI. 00000000)
> [    0.006380] ACPI: SLIT 0x00000000CBA12038 000030 (v01 A M I  AMI SLIT 00000000 AMI. 00000000)
> [    0.006382] ACPI: HPET 0x00000000CBA12068 000038 (v01 HPQOEM SLIC-WKS 01072009 AMI. 00000004)
> [    0.006384] ACPI: ASF! 0x00000000CBA120A0 0000A0 (v32 INTEL   HCG     00000001 TFSM 000F4240)
> [    0.006387] ACPI: SSDT 0x00000000CBA12140 005913 (v01 COMPAQ WMI      00000001 MSFT 03000001)
> [    0.006389] ACPI: SSDT 0x00000000CBA17A58 06E284 (v02 INTEL  CpuPm    00004000 INTL 20051117)
> [    0.006396] ACPI: Local APIC address 0xfee00000
> [    0.006422] SRAT: PXM 0 -> APIC 0x00 -> Node 0
> [    0.006422] SRAT: PXM 0 -> APIC 0x01 -> Node 0
> [    0.006423] SRAT: PXM 0 -> APIC 0x02 -> Node 0
> [    0.006423] SRAT: PXM 0 -> APIC 0x03 -> Node 0
> [    0.006424] SRAT: PXM 0 -> APIC 0x04 -> Node 0
> [    0.006424] SRAT: PXM 0 -> APIC 0x05 -> Node 0
> [    0.006425] SRAT: PXM 0 -> APIC 0x06 -> Node 0
> [    0.006425] SRAT: PXM 0 -> APIC 0x07 -> Node 0
> [    0.006426] SRAT: PXM 0 -> APIC 0x08 -> Node 0
> [    0.006426] SRAT: PXM 0 -> APIC 0x09 -> Node 0
> [    0.006426] SRAT: PXM 0 -> APIC 0x0a -> Node 0
> [    0.006427] SRAT: PXM 0 -> APIC 0x0b -> Node 0
> [    0.006427] SRAT: PXM 0 -> APIC 0x0c -> Node 0
> [    0.006428] SRAT: PXM 0 -> APIC 0x0d -> Node 0
> [    0.006428] SRAT: PXM 0 -> APIC 0x0e -> Node 0
> [    0.006429] SRAT: PXM 0 -> APIC 0x0f -> Node 0
> [    0.006429] SRAT: PXM 1 -> APIC 0x20 -> Node 1
> [    0.006430] SRAT: PXM 1 -> APIC 0x21 -> Node 1
> [    0.006430] SRAT: PXM 1 -> APIC 0x22 -> Node 1
> [    0.006431] SRAT: PXM 1 -> APIC 0x23 -> Node 1
> [    0.006431] SRAT: PXM 1 -> APIC 0x24 -> Node 1
> [    0.006432] SRAT: PXM 1 -> APIC 0x25 -> Node 1
> [    0.006432] SRAT: PXM 1 -> APIC 0x26 -> Node 1
> [    0.006432] SRAT: PXM 1 -> APIC 0x27 -> Node 1
> [    0.006433] SRAT: PXM 1 -> APIC 0x28 -> Node 1
> [    0.006433] SRAT: PXM 1 -> APIC 0x29 -> Node 1
> [    0.006434] SRAT: PXM 1 -> APIC 0x2a -> Node 1
> [    0.006434] SRAT: PXM 1 -> APIC 0x2b -> Node 1
> [    0.006435] SRAT: PXM 1 -> APIC 0x2c -> Node 1
> [    0.006435] SRAT: PXM 1 -> APIC 0x2d -> Node 1
> [    0.006435] SRAT: PXM 1 -> APIC 0x2e -> Node 1
> [    0.006436] SRAT: PXM 1 -> APIC 0x2f -> Node 1
> [    0.006439] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0xcfffffff]
> [    0.006439] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x62fffffff]
> [    0.006440] ACPI: SRAT: Node 1 PXM 1 [mem 0x630000000-0xc2fffffff]
> [    0.006445] NUMA: Initialized distance table, cnt=2
> [    0.006447] NUMA: Node 0 [mem 0x00000000-0xcfffffff] + [mem 0x100000000-0x62fffffff] -> [mem 0x00000000-0x62fffffff]
> [    0.006456] NODE_DATA(0) allocated [mem 0x62ffd5000-0x62fffffff]
> [    0.006482] NODE_DATA(1) allocated [mem 0xc2ffd4000-0xc2fffefff]
> [    0.112062] Zone ranges:
> [    0.112064]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.112066]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.112066]   Normal   [mem 0x0000000100000000-0x0000000c2fffffff]
> [    0.112067]   Device   empty
> [    0.112068] Movable zone start for each node
> [    0.112071] Early memory node ranges
> [    0.112071]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
> [    0.112072]   node   0: [mem 0x0000000000100000-0x00000000cb712fff]
> [    0.112073]   node   0: [mem 0x00000000cba8f000-0x00000000cba90fff]
> [    0.112074]   node   0: [mem 0x00000000cbd56000-0x00000000cbffffff]
> [    0.112074]   node   0: [mem 0x0000000100000000-0x000000062fffffff]
> [    0.112077]   node   1: [mem 0x0000000630000000-0x0000000c2fffffff]
> [    0.112251] Zeroed struct page in unavailable ranges: 18082 pages
> [    0.112252] Initmem setup node 0 [mem 0x0000000000001000-0x000000062fffffff]
> [    0.112253] On node 0 totalpages: 6273374
> [    0.112254]   DMA zone: 64 pages used for memmap
> [    0.112254]   DMA zone: 56 pages reserved
> [    0.112255]   DMA zone: 3999 pages, LIFO batch:0
> [    0.112284]   DMA32 zone: 12967 pages used for memmap
> [    0.112285]   DMA32 zone: 829887 pages, LIFO batch:63
> [    0.117598]   Normal zone: 84992 pages used for memmap
> [    0.117600]   Normal zone: 5439488 pages, LIFO batch:63
> [    0.152843] Initmem setup node 1 [mem 0x0000000630000000-0x0000000c2fffffff]
> [    0.152846] On node 1 totalpages: 6291456
> [    0.152847]   Normal zone: 98304 pages used for memmap
> [    0.152847]   Normal zone: 6291456 pages, LIFO batch:63
> [    0.219343] ACPI: PM-Timer IO Port: 0x408
> [    0.219346] ACPI: Local APIC address 0xfee00000
> [    0.219356] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
> [    0.219366] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
> [    0.219369] IOAPIC[1]: apic_id 2, version 32, address 0xfec01000, GSI 24-47
> [    0.219373] IOAPIC[2]: apic_id 3, version 32, address 0xfec40000, GSI 48-71
> [    0.219375] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.219376] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.219377] ACPI: IRQ0 used by override.
> [    0.219378] ACPI: IRQ9 used by override.
> [    0.219380] Using ACPI (MADT) for SMP configuration information
> [    0.219381] ACPI: HPET id: 0x8086a701 base: 0xfed00000
> [    0.219386] TSC deadline timer available
> [    0.219387] smpboot: Allowing 32 CPUs, 0 hotplug CPUs
> [    0.219416] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.219417] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
> [    0.219419] PM: hibernation: Registered nosave memory: [mem 0x037da000-0x037dafff]
> [    0.219421] PM: hibernation: Registered nosave memory: [mem 0x037e3000-0x037e3fff]
> [    0.219421] PM: hibernation: Registered nosave memory: [mem 0x037e4000-0x037e4fff]
> [    0.219423] PM: hibernation: Registered nosave memory: [mem 0x037ed000-0x037edfff]
> [    0.219425] PM: hibernation: Registered nosave memory: [mem 0x037f3000-0x037f3fff]
> [    0.219426] PM: hibernation: Registered nosave memory: [mem 0x037ff000-0x037fffff]
> [    0.219428] PM: hibernation: Registered nosave memory: [mem 0x03853000-0x03853fff]
> [    0.219429] PM: hibernation: Registered nosave memory: [mem 0x03862000-0x03862fff]
> [    0.219431] PM: hibernation: Registered nosave memory: [mem 0x03a97000-0x03a97fff]
> [    0.219432] PM: hibernation: Registered nosave memory: [mem 0x03ab0000-0x03ab0fff]
> [    0.219433] PM: hibernation: Registered nosave memory: [mem 0x03ab1000-0x03ab1fff]
> [    0.219434] PM: hibernation: Registered nosave memory: [mem 0x03ac7000-0x03ac7fff]
> [    0.219436] PM: hibernation: Registered nosave memory: [mem 0xcb713000-0xcb714fff]
> [    0.219436] PM: hibernation: Registered nosave memory: [mem 0xcb715000-0xcb7bdfff]
> [    0.219437] PM: hibernation: Registered nosave memory: [mem 0xcb7be000-0xcba08fff]
> [    0.219437] PM: hibernation: Registered nosave memory: [mem 0xcba09000-0xcba85fff]
> [    0.219438] PM: hibernation: Registered nosave memory: [mem 0xcba86000-0xcba8efff]
> [    0.219440] PM: hibernation: Registered nosave memory: [mem 0xcba91000-0xcba9cfff]
> [    0.219440] PM: hibernation: Registered nosave memory: [mem 0xcba9d000-0xcbaaffff]
> [    0.219440] PM: hibernation: Registered nosave memory: [mem 0xcbab0000-0xcbb37fff]
> [    0.219441] PM: hibernation: Registered nosave memory: [mem 0xcbb38000-0xcbb3ffff]
> [    0.219441] PM: hibernation: Registered nosave memory: [mem 0xcbb40000-0xcbb52fff]
> [    0.219442] PM: hibernation: Registered nosave memory: [mem 0xcbb53000-0xcbd55fff]
> [    0.219443] PM: hibernation: Registered nosave memory: [mem 0xcc000000-0xefffffff]
> [    0.219444] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
> [    0.219444] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfed1bfff]
> [    0.219445] PM: hibernation: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
> [    0.219445] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfeffffff]
> [    0.219446] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
> [    0.219447] [mem 0xcc000000-0xefffffff] available for PCI devices
> [    0.219449] Booting paravirtualized kernel on bare hardware
> [    0.219452] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.224532] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:2
> [    0.226208] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u262144
> [    0.226215] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152
> [    0.226216] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 16 17 18 19 20 21 22 23 
> [    0.226220] pcpu-alloc: [1] 08 09 10 11 12 13 14 15 [1] 24 25 26 27 28 29 30 31 
> [    0.226265] Built 2 zonelists, mobility grouping on.  Total pages: 12368447
> [    0.226266] Policy zone: Normal
> [    0.226267] Kernel command line: BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.9.10-100.fc32.x86_64 root=/dev/mapper/fedora_111--a77c--01-root ro rd.lvm.lv=fedora_111-a77c-01/root rd.lvm.lv=fedora_111-a77c-01/swap rhgb quiet
> [    0.226645] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.374497] Memory: 49267464K/50259320K available (14339K kernel code, 2518K rwdata, 8760K rodata, 2516K init, 4580K bss, 991596K reserved, 0K cma-reserved)
> [    0.374505] random: get_random_u64 called from __kmem_cache_create+0x2e/0x550 with crng_init=0
> [    0.374806] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=2
> [    0.374825] Kernel/User page tables isolation: enabled
> [    0.374858] ftrace: allocating 44229 entries in 173 pages
> [    0.388682] ftrace: allocated 173 pages with 5 groups
> [    0.389034] rcu: Hierarchical RCU implementation.
> [    0.389035] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=32.
> [    0.389036] 	Trampoline variant of Tasks RCU enabled.
> [    0.389036] 	Rude variant of Tasks RCU enabled.
> [    0.389037] 	Tracing variant of Tasks RCU enabled.
> [    0.389037] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [    0.389038] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
> [    0.392266] NR_IRQS: 524544, nr_irqs: 1496, preallocated irqs: 16
> [    0.392575] Console: colour dummy device 80x25
> [    0.392580] printk: console [tty0] enabled
> [    0.392628] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
> [    0.392631] ACPI: Core revision 20200717
> [    0.393044] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
> [    0.393054] APIC: Switch to symmetric I/O mode setup
> [    0.393172] x2apic: IRQ remapping doesn't support X2APIC mode
> [    0.393244] Switched APIC routing to physical flat.
> [    0.393818] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.398058] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2c9434b7b47, max_idle_ns: 440795358401 ns
> [    0.398061] Calibrating delay loop (skipped), value calculated using timer frequency.. 6185.32 BogoMIPS (lpj=3092663)
> [    0.398062] pid_max: default: 32768 minimum: 301
> [    0.400843] LSM: Security Framework initializing
> [    0.400853] Yama: becoming mindful.
> [    0.400878] SELinux:  Initializing.
> [    0.411023] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, vmalloc)
> [    0.416050] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, vmalloc)
> [    0.416256] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, vmalloc)
> [    0.416419] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, vmalloc)
> [    0.416855] mce: CPU0: Thermal monitoring enabled (TM1)
> [    0.416884] process: using mwait in idle threads
> [    0.416886] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
> [    0.416887] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
> [    0.416891] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    0.416892] Spectre V2 : Mitigation: Full generic retpoline
> [    0.416893] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    0.416893] Spectre V2 : Enabling Restricted Speculation for firmware calls
> [    0.416894] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    0.416895] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
> [    0.416896] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
> [    0.416898] MDS: Mitigation: Clear CPU buffers
> [    0.417096] Freeing SMP alternatives memory: 40K
> [    0.419184] smpboot: CPU0: Intel(R) Xeon(R) CPU E5-2687W 0 @ 3.10GHz (family: 0x6, model: 0x2d, stepping: 0x7)
> [    0.419347] Performance Events: PEBS fmt1+, SandyBridge events, 16-deep LBR, full-width counters, Intel PMU driver.
> [    0.419354] ... version:                3
> [    0.419354] ... bit width:              48
> [    0.419355] ... generic registers:      4
> [    0.419355] ... value mask:             0000ffffffffffff
> [    0.419356] ... max period:             00007fffffffffff
> [    0.419356] ... fixed-purpose events:   3
> [    0.419357] ... event mask:             000000070000000f
> [    0.419409] rcu: Hierarchical SRCU implementation.
> [    0.421317] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
> [    0.421763] smp: Bringing up secondary CPUs ...
> [    0.421874] x86: Booting SMP configuration:
> [    0.421875] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
> [    0.438264] .... node  #1, CPUs:    #8
> [    0.001557] smpboot: CPU 8 Converting physical 0 to logical die 1
> [    0.502213]   #9 #10 #11 #12 #13 #14 #15
> [    0.523218] .... node  #0, CPUs:   #16
> [    0.525209] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
> [    0.525244]  #17 #18 #19 #20 #21 #22 #23
> [    0.532248] .... node  #1, CPUs:   #24 #25 #26 #27 #28 #29 #30 #31
> [    0.548207] smp: Brought up 2 nodes, 32 CPUs
> [    0.548207] smpboot: Max logical packages: 2
> [    0.548207] smpboot: Total of 32 processors activated (198041.40 BogoMIPS)
> [    0.551678] devtmpfs: initialized
> [    0.551678] x86/mm: Memory block size: 128MB
> [    0.555301] PM: Registering ACPI NVS region [mem 0xcb715000-0xcb7bdfff] (692224 bytes)
> [    0.555301] PM: Registering ACPI NVS region [mem 0xcba9d000-0xcbaaffff] (77824 bytes)
> [    0.555301] PM: Registering ACPI NVS region [mem 0xcbb38000-0xcbb3ffff] (32768 bytes)
> [    0.555301] PM: Registering ACPI NVS region [mem 0xcbb53000-0xcbd55fff] (2109440 bytes)
> [    0.555305] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.555305] futex hash table entries: 8192 (order: 7, 524288 bytes, vmalloc)
> [    0.556236] xor: automatically using best checksumming function   avx       
> [    0.556241] pinctrl core: initialized pinctrl subsystem
> [    0.556373] PM: RTC time: 09:08:55, date: 2020-11-26
> [    0.556579] NET: Registered protocol family 16
> [    0.556710] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
> [    0.556724] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.556736] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.556745] audit: initializing netlink subsys (disabled)
> [    0.556759] audit: type=2000 audit(1606381735.163:1): state=initialized audit_enabled=0 res=1
> [    0.556759] thermal_sys: Registered thermal governor 'fair_share'
> [    0.556759] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.556759] thermal_sys: Registered thermal governor 'step_wise'
> [    0.556759] thermal_sys: Registered thermal governor 'user_space'
> [    0.557105] cpuidle: using governor menu
> [    0.557238] ACPI: bus type PCI registered
> [    0.557240] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.557360] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
> [    0.557363] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
> [    0.557382] PCI: Using configuration type 1 for base access
> [    0.557418] core: PMU erratum BJ122, BV98, HSD29 worked around, HT is on
> [    0.558917] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> [    0.561219] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.561219] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.719076] cryptd: max_cpu_qlen set to 1000
> [    0.722606] alg: No test for 842 (842-generic)
> [    0.722606] alg: No test for 842 (842-scomp)
> [    0.726182] raid6: skip pq benchmark and using algorithm sse2x4
> [    0.726182] raid6: using ssse3x2 recovery algorithm
> [    0.726182] ipmi:dmi: Base address is zero, assuming no IPMI interface
> [    0.726249] ACPI: Added _OSI(Module Device)
> [    0.726250] ACPI: Added _OSI(Processor Device)
> [    0.726250] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.726251] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.726252] ACPI: Added _OSI(Linux-Dell-Video)
> [    0.726252] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    0.726253] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    0.776372] ACPI: 3 ACPI AML tables successfully acquired and loaded
> [    0.787482] ACPI: Interpreter enabled
> [    0.787496] ACPI: (supports S0 S3 S4 S5)
> [    0.787497] ACPI: Using IOAPIC for interrupt routing
> [    0.787522] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.787792] ACPI: Enabled 5 GPEs in block 00 to 3F
> [    0.788834] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.797174] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3f])
> [    0.797178] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.797294] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug PCIeCapability LTR DPC]
> [    0.797348] acpi PNP0A08:00: _OSC: not requesting control; platform does not support [PCIeCapability]
> [    0.797349] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
> [    0.797350] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplug PME AER]
> [    0.797351] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
> [    0.797649] PCI host bridge to bus 0000:00
> [    0.797650] pci_bus 0000:00: Unknown NUMA node; performance will be reduced
> [    0.797652] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [    0.797653] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.797653] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [    0.797654] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    0.797655] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
> [    0.797656] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
> [    0.797657] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xefffffff window]
> [    0.797658] pci_bus 0000:00: root bus resource [mem 0x3c0000000000-0x3c007fffffff window]
> [    0.797659] pci_bus 0000:00: root bus resource [bus 00-3f]
> [    0.797681] pci 0000:00:00.0: [8086:3c00] type 00 class 0x060000
> [    0.797746] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
> [    0.797844] pci 0000:00:01.0: [8086:3c02] type 01 class 0x060400
> [    0.797920] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
> [    0.798044] pci 0000:00:01.1: [8086:3c03] type 01 class 0x060400
> [    0.798121] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
> [    0.798243] pci 0000:00:02.0: [8086:3c04] type 01 class 0x060400
> [    0.798319] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
> [    0.798437] pci 0000:00:03.0: [8086:3c08] type 01 class 0x060400
> [    0.798468] pci 0000:00:03.0: enabling Extended Tags
> [    0.798516] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
> [    0.798626] pci 0000:00:05.0: [8086:3c28] type 00 class 0x088000
> [    0.798759] pci 0000:00:05.2: [8086:3c2a] type 00 class 0x088000
> [    0.798874] pci 0000:00:05.4: [8086:3c2c] type 00 class 0x080020
> [    0.798885] pci 0000:00:05.4: reg 0x10: [mem 0xef646000-0xef646fff]
> [    0.799001] pci 0000:00:11.0: [8086:1d3e] type 01 class 0x060400
> [    0.799104] pci 0000:00:11.0: PME# supported from D0 D3hot D3cold
> [    0.799227] pci 0000:00:16.0: [8086:1d3a] type 00 class 0x078000
> [    0.799245] pci 0000:00:16.0: reg 0x10: [mem 0xef645000-0xef64500f 64bit]
> [    0.799315] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
> [    0.799383] pci 0000:00:16.2: [8086:1d3c] type 00 class 0x010185
> [    0.799397] pci 0000:00:16.2: reg 0x10: [io  0xe0b0-0xe0b7]
> [    0.799406] pci 0000:00:16.2: reg 0x14: [io  0xe0a0-0xe0a3]
> [    0.799413] pci 0000:00:16.2: reg 0x18: [io  0xe090-0xe097]
> [    0.799421] pci 0000:00:16.2: reg 0x1c: [io  0xe080-0xe083]
> [    0.799429] pci 0000:00:16.2: reg 0x20: [io  0xe070-0xe07f]
> [    0.799534] pci 0000:00:16.3: [8086:1d3d] type 00 class 0x070002
> [    0.799548] pci 0000:00:16.3: reg 0x10: [io  0xe060-0xe067]
> [    0.799556] pci 0000:00:16.3: reg 0x14: [mem 0xef644000-0xef644fff]
> [    0.799687] pci 0000:00:19.0: [8086:1502] type 00 class 0x020000
> [    0.799699] pci 0000:00:19.0: reg 0x10: [mem 0xef600000-0xef61ffff]
> [    0.799706] pci 0000:00:19.0: reg 0x14: [mem 0xef649000-0xef649fff]
> [    0.799713] pci 0000:00:19.0: reg 0x18: [io  0xe040-0xe05f]
> [    0.799767] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
> [    0.799856] pci 0000:00:1a.0: [8086:1d2d] type 00 class 0x0c0320
> [    0.799871] pci 0000:00:1a.0: reg 0x10: [mem 0xef64b000-0xef64b3ff]
> [    0.799948] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
> [    0.800031] pci 0000:00:1b.0: [8086:1d20] type 00 class 0x040300
> [    0.800045] pci 0000:00:1b.0: reg 0x10: [mem 0xef640000-0xef643fff 64bit]
> [    0.800107] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
> [    0.800183] pci 0000:00:1c.0: [8086:1d12] type 01 class 0x060400
> [    0.800266] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
> [    0.800374] pci 0000:00:1c.5: [8086:1d18] type 01 class 0x060400
> [    0.800512] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
> [    0.800622] pci 0000:00:1c.6: [8086:1d14] type 01 class 0x060400
> [    0.800703] pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
> [    0.800800] pci 0000:00:1d.0: [8086:1d26] type 00 class 0x0c0320
> [    0.800814] pci 0000:00:1d.0: reg 0x10: [mem 0xef64a000-0xef64a3ff]
> [    0.800892] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> [    0.800971] pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
> [    0.801098] pci 0000:00:1f.0: [8086:1d41] type 00 class 0x060100
> [    0.801267] pci 0000:00:1f.2: [8086:2826] type 00 class 0x010400
> [    0.801278] pci 0000:00:1f.2: reg 0x10: [io  0xe0f0-0xe0f7]
> [    0.801284] pci 0000:00:1f.2: reg 0x14: [io  0xe0e0-0xe0e3]
> [    0.801291] pci 0000:00:1f.2: reg 0x18: [io  0xe0d0-0xe0d7]
> [    0.801297] pci 0000:00:1f.2: reg 0x1c: [io  0xe0c0-0xe0c3]
> [    0.801303] pci 0000:00:1f.2: reg 0x20: [io  0xe020-0xe03f]
> [    0.801309] pci 0000:00:1f.2: reg 0x24: [mem 0xef648000-0xef6487ff]
> [    0.801346] pci 0000:00:1f.2: PME# supported from D3hot
> [    0.801419] pci 0000:00:1f.3: [8086:1d22] type 00 class 0x0c0500
> [    0.801434] pci 0000:00:1f.3: reg 0x10: [mem 0xef647000-0xef6470ff 64bit]
> [    0.801453] pci 0000:00:1f.3: reg 0x20: [io  0xe000-0xe01f]
> [    0.801572] pci 0000:02:00.0: [1000:0086] type 00 class 0x010700
> [    0.801581] pci 0000:02:00.0: reg 0x10: [io  0xc000-0xc0ff]
> [    0.801588] pci 0000:02:00.0: reg 0x14: [mem 0xef240000-0xef24ffff 64bit]
> [    0.801595] pci 0000:02:00.0: reg 0x1c: [mem 0xef200000-0xef23ffff 64bit]
> [    0.801604] pci 0000:02:00.0: reg 0x30: [mem 0xef100000-0xef1fffff pref]
> [    0.801609] pci 0000:02:00.0: enabling Extended Tags
> [    0.801646] pci 0000:02:00.0: supports D1 D2
> [    0.801670] pci 0000:02:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:00:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [    0.801707] pci 0000:00:01.0: PCI bridge to [bus 02]
> [    0.801709] pci 0000:00:01.0:   bridge window [io  0xc000-0xcfff]
> [    0.801712] pci 0000:00:01.0:   bridge window [mem 0xef100000-0xef2fffff]
> [    0.801759] pci 0000:00:01.1: PCI bridge to [bus 03]
> [    0.801807] pci 0000:00:02.0: PCI bridge to [bus 06]
> [    0.801861] pci 0000:05:00.0: [10de:0df8] type 00 class 0x030000
> [    0.801870] pci 0000:05:00.0: reg 0x10: [mem 0xee000000-0xeeffffff]
> [    0.801877] pci 0000:05:00.0: reg 0x14: [mem 0xe0000000-0xe7ffffff 64bit pref]
> [    0.801885] pci 0000:05:00.0: reg 0x1c: [mem 0xe8000000-0xe9ffffff 64bit pref]
> [    0.801890] pci 0000:05:00.0: reg 0x24: [io  0xa000-0xa07f]
> [    0.801895] pci 0000:05:00.0: reg 0x30: [mem 0xef000000-0xef07ffff pref]
> [    0.801899] pci 0000:05:00.0: enabling Extended Tags
> [    0.801907] pci 0000:05:00.0: BAR 3: assigned to efifb
> [    0.802003] pci 0000:05:00.1: [10de:0bea] type 00 class 0x040300
> [    0.802011] pci 0000:05:00.1: reg 0x10: [mem 0xef080000-0xef083fff]
> [    0.802039] pci 0000:05:00.1: enabling Extended Tags
> [    0.802115] pci 0000:00:03.0: PCI bridge to [bus 05]
> [    0.802117] pci 0000:00:03.0:   bridge window [io  0xa000-0xafff]
> [    0.802120] pci 0000:00:03.0:   bridge window [mem 0xee000000-0xef0fffff]
> [    0.802124] pci 0000:00:03.0:   bridge window [mem 0xe0000000-0xe9ffffff 64bit pref]
> [    0.802191] pci 0000:04:00.0: [8086:1d6b] type 00 class 0x010700
> [    0.802211] pci 0000:04:00.0: reg 0x10: [mem 0xea87c000-0xea87ffff 64bit pref]
> [    0.802224] pci 0000:04:00.0: reg 0x18: [mem 0xea400000-0xea7fffff 64bit pref]
> [    0.802233] pci 0000:04:00.0: reg 0x20: [io  0xb000-0xb0ff]
> [    0.802256] pci 0000:04:00.0: enabling Extended Tags
> [    0.802348] pci 0000:04:00.0: reg 0x164: [mem 0xea800000-0xea803fff 64bit pref]
> [    0.802349] pci 0000:04:00.0: VF(n) BAR0 space: [mem 0xea800000-0xea87bfff 64bit pref] (contains BAR0 for 31 VFs)
> [    0.802575] pci 0000:00:11.0: PCI bridge to [bus 04]
> [    0.802579] pci 0000:00:11.0:   bridge window [io  0xb000-0xbfff]
> [    0.802587] pci 0000:00:11.0:   bridge window [mem 0xea400000-0xea8fffff 64bit pref]
> [    0.802668] pci 0000:01:00.0: [8086:10d3] type 00 class 0x020000
> [    0.802701] pci 0000:01:00.0: reg 0x10: [mem 0xef500000-0xef51ffff]
> [    0.802737] pci 0000:01:00.0: reg 0x18: [io  0xd000-0xd01f]
> [    0.802755] pci 0000:01:00.0: reg 0x1c: [mem 0xef520000-0xef523fff]
> [    0.802930] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> [    0.803100] pci 0000:00:1c.0: PCI bridge to [bus 01]
> [    0.803103] pci 0000:00:1c.0:   bridge window [io  0xd000-0xdfff]
> [    0.803106] pci 0000:00:1c.0:   bridge window [mem 0xef500000-0xef5fffff]
> [    0.803179] pci 0000:00:1c.5: PCI bridge to [bus 07]
> [    0.803257] pci 0000:08:00.0: [104c:8241] type 00 class 0x0c0330
> [    0.803285] pci 0000:08:00.0: reg 0x10: [mem 0xef400000-0xef40ffff 64bit]
> [    0.803304] pci 0000:08:00.0: reg 0x18: [mem 0xef410000-0xef411fff 64bit]
> [    0.803422] pci 0000:08:00.0: supports D1 D2
> [    0.803423] pci 0000:08:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.803563] pci 0000:00:1c.6: PCI bridge to [bus 08]
> [    0.803568] pci 0000:00:1c.6:   bridge window [mem 0xef400000-0xef4fffff]
> [    0.803590] pci_bus 0000:09: extended config space not accessible
> [    0.803620] pci 0000:09:01.0: [11c1:5811] type 00 class 0x0c0010
> [    0.803633] pci 0000:09:01.0: reg 0x10: [mem 0xef300000-0xef300fff]
> [    0.803690] pci 0000:09:01.0: supports D1 D2
> [    0.803691] pci 0000:09:01.0: PME# supported from D0 D1 D2 D3hot
> [    0.803762] pci 0000:00:1e.0: PCI bridge to [bus 09] (subtractive decode)
> [    0.803766] pci 0000:00:1e.0:   bridge window [mem 0xef300000-0xef3fffff]
> [    0.803771] pci 0000:00:1e.0:   bridge window [io  0x0000-0x03af window] (subtractive decode)
> [    0.803772] pci 0000:00:1e.0:   bridge window [io  0x03e0-0x0cf7 window] (subtractive decode)
> [    0.803773] pci 0000:00:1e.0:   bridge window [io  0x03b0-0x03df window] (subtractive decode)
> [    0.803774] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
> [    0.803775] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
> [    0.803776] pci 0000:00:1e.0:   bridge window [mem 0x000c0000-0x000dffff window] (subtractive decode)
> [    0.803776] pci 0000:00:1e.0:   bridge window [mem 0xe0000000-0xefffffff window] (subtractive decode)
> [    0.803777] pci 0000:00:1e.0:   bridge window [mem 0x3c0000000000-0x3c007fffffff window] (subtractive decode)
> [    0.804279] ACPI: PCI Root Bridge [PCI1] (domain 0000 [bus 40-ff])
> [    0.804282] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.804397] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplug PCIeCapability LTR DPC]
> [    0.804450] acpi PNP0A08:01: _OSC: not requesting control; platform does not support [PCIeCapability]
> [    0.804452] acpi PNP0A08:01: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
> [    0.804453] acpi PNP0A08:01: _OSC: platform willing to grant [PCIeHotplug PME AER]
> [    0.804453] acpi PNP0A08:01: _OSC failed (AE_SUPPORT); disabling ASPM
> [    0.804459] acpi PNP0A08:01: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-7f] only partially covers this bridge
> [    0.804636] PCI host bridge to bus 0000:40
> [    0.804637] pci_bus 0000:40: Unknown NUMA node; performance will be reduced
> [    0.804638] pci_bus 0000:40: root bus resource [io  0x0000-0x03af window]
> [    0.804639] pci_bus 0000:40: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.804640] pci_bus 0000:40: root bus resource [mem 0x000c0000-0x000dffff window]
> [    0.804641] pci_bus 0000:40: root bus resource [mem 0xdc000000-0xdfffffff window]
> [    0.804642] pci_bus 0000:40: root bus resource [mem 0x3c0080000000-0x3c00ffffffff window]
> [    0.804642] pci_bus 0000:40: root bus resource [bus 40-ff]
> [    0.804667] pci 0000:40:02.0: [8086:3c04] type 01 class 0x060400
> [    0.804753] pci 0000:40:02.0: PME# supported from D0 D3hot D3cold
> [    0.804871] pci 0000:40:03.0: [8086:3c08] type 01 class 0x060400
> [    0.804905] pci 0000:40:03.0: enabling Extended Tags
> [    0.804959] pci 0000:40:03.0: PME# supported from D0 D3hot D3cold
> [    0.805067] pci 0000:40:05.0: [8086:3c28] type 00 class 0x088000
> [    0.805174] pci 0000:40:05.2: [8086:3c2a] type 00 class 0x088000
> [    0.805277] pci 0000:40:05.4: [8086:3c2c] type 00 class 0x080020
> [    0.805288] pci 0000:40:05.4: reg 0x10: [mem 0xdff20000-0xdff20fff]
> [    0.805427] pci 0000:40:02.0: PCI bridge to [bus 42]
> [    0.805475] pci 0000:40:03.0: PCI bridge to [bus 43]
> [    0.805575] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
> [    0.805615] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 *5 6 7 10 11 12 14 15)
> [    0.805654] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 *10 11 12 14 15)
> [    0.805693] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
> [    0.805732] ACPI: PCI Interrupt Link [LNKE] (IRQs *3 4 5 6 7 10 11 12 14 15)
> [    0.805770] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 *5 6 7 10 11 12 14 15)
> [    0.805809] ACPI: PCI Interrupt Link [LNKG] (IRQs *3 4 5 6 7 10 11 12 14 15)
> [    0.805847] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 *10 11 12 14 15)
> [    0.808078] iommu: Default domain type: Translated 
> [    0.808093] pci 0000:05:00.0: vgaarb: setting as boot VGA device
> [    0.808093] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.808093] pci 0000:05:00.0: vgaarb: bridge control possible
> [    0.808093] vgaarb: loaded
> [    0.808206] SCSI subsystem initialized
> [    0.808246] libata version 3.00 loaded.
> [    0.808246] ACPI: bus type USB registered
> [    0.808246] usbcore: registered new interface driver usbfs
> [    0.808246] usbcore: registered new interface driver hub
> [    0.808246] usbcore: registered new device driver usb
> [    0.808246] pps_core: LinuxPPS API ver. 1 registered
> [    0.808246] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.808246] PTP clock support registered
> [    0.808289] EDAC MC: Ver: 3.0.0
> [    0.809085] Registered efivars operations
> [    0.809211] NetLabel: Initializing
> [    0.809211] NetLabel:  domain hash size = 128
> [    0.809212] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.809225] NetLabel:  unlabeled traffic allowed by default
> [    0.809226] PCI: Using ACPI for IRQ routing
> [    0.809836] PCI: Discovered peer bus 3f
> [    0.809836] PCI: root bus 3f: using default resources
> [    0.809836] PCI: Probing PCI hardware (bus 3f)
> [    0.809836] PCI host bridge to bus 0000:3f
> [    0.809836] pci_bus 0000:3f: Unknown NUMA node; performance will be reduced
> [    0.809836] pci_bus 0000:3f: root bus resource [io  0x0000-0xffff]
> [    0.809836] pci_bus 0000:3f: root bus resource [mem 0x00000000-0x3fffffffffff]
> [    0.809836] pci_bus 0000:3f: No busn resource found for root bus, will use [bus 3f-ff]
> [    0.809836] pci_bus 0000:3f: busn_res: can not insert [bus 3f-ff] under domain [bus 00-ff] (conflicts with (null) [bus 00-3f])
> [    0.809836] pci 0000:3f:08.0: [8086:3c80] type 00 class 0x088000
> [    0.809836] pci 0000:3f:08.3: [8086:3c83] type 00 class 0x088000
> [    0.809863] pci 0000:3f:08.4: [8086:3c84] type 00 class 0x088000
> [    0.809926] pci 0000:3f:09.0: [8086:3c90] type 00 class 0x088000
> [    0.809972] pci 0000:3f:09.3: [8086:3c93] type 00 class 0x088000
> [    0.810029] pci 0000:3f:09.4: [8086:3c94] type 00 class 0x088000
> [    0.810093] pci 0000:3f:0a.0: [8086:3cc0] type 00 class 0x088000
> [    0.810132] pci 0000:3f:0a.1: [8086:3cc1] type 00 class 0x088000
> [    0.810170] pci 0000:3f:0a.2: [8086:3cc2] type 00 class 0x088000
> [    0.810207] pci 0000:3f:0a.3: [8086:3cd0] type 00 class 0x088000
> [    0.810247] pci 0000:3f:0b.0: [8086:3ce0] type 00 class 0x088000
> [    0.810283] pci 0000:3f:0b.3: [8086:3ce3] type 00 class 0x088000
> [    0.810323] pci 0000:3f:0c.0: [8086:3ce8] type 00 class 0x088000
> [    0.810359] pci 0000:3f:0c.1: [8086:3ce8] type 00 class 0x088000
> [    0.810395] pci 0000:3f:0c.2: [8086:3ce8] type 00 class 0x088000
> [    0.810435] pci 0000:3f:0c.3: [8086:3ce8] type 00 class 0x088000
> [    0.810472] pci 0000:3f:0c.6: [8086:3cf4] type 00 class 0x088000
> [    0.810508] pci 0000:3f:0c.7: [8086:3cf6] type 00 class 0x088000
> [    0.810544] pci 0000:3f:0d.0: [8086:3ce8] type 00 class 0x088000
> [    0.810581] pci 0000:3f:0d.1: [8086:3ce8] type 00 class 0x088000
> [    0.810618] pci 0000:3f:0d.2: [8086:3ce8] type 00 class 0x088000
> [    0.810654] pci 0000:3f:0d.3: [8086:3ce8] type 00 class 0x088000
> [    0.810691] pci 0000:3f:0d.6: [8086:3cf5] type 00 class 0x088000
> [    0.810731] pci 0000:3f:0e.0: [8086:3ca0] type 00 class 0x088000
> [    0.810769] pci 0000:3f:0e.1: [8086:3c46] type 00 class 0x110100
> [    0.810813] pci 0000:3f:0f.0: [8086:3ca8] type 00 class 0x088000
> [    0.810867] pci 0000:3f:0f.1: [8086:3c71] type 00 class 0x088000
> [    0.810919] pci 0000:3f:0f.2: [8086:3caa] type 00 class 0x088000
> [    0.810971] pci 0000:3f:0f.3: [8086:3cab] type 00 class 0x088000
> [    0.811026] pci 0000:3f:0f.4: [8086:3cac] type 00 class 0x088000
> [    0.811081] pci 0000:3f:0f.5: [8086:3cad] type 00 class 0x088000
> [    0.811131] pci 0000:3f:0f.6: [8086:3cae] type 00 class 0x088000
> [    0.811174] pci 0000:3f:10.0: [8086:3cb0] type 00 class 0x088000
> [    0.811227] pci 0000:3f:10.1: [8086:3cb1] type 00 class 0x088000
> [    0.811281] pci 0000:3f:10.2: [8086:3cb2] type 00 class 0x088000
> [    0.811333] pci 0000:3f:10.3: [8086:3cb3] type 00 class 0x088000
> [    0.811393] pci 0000:3f:10.4: [8086:3cb4] type 00 class 0x088000
> [    0.811447] pci 0000:3f:10.5: [8086:3cb5] type 00 class 0x088000
> [    0.811500] pci 0000:3f:10.6: [8086:3cb6] type 00 class 0x088000
> [    0.811552] pci 0000:3f:10.7: [8086:3cb7] type 00 class 0x088000
> [    0.811602] pci 0000:3f:11.0: [8086:3cb8] type 00 class 0x088000
> [    0.811646] pci 0000:3f:13.0: [8086:3ce4] type 00 class 0x088000
> [    0.811685] pci 0000:3f:13.1: [8086:3c43] type 00 class 0x110100
> [    0.811723] pci 0000:3f:13.4: [8086:3ce6] type 00 class 0x110100
> [    0.811760] pci 0000:3f:13.5: [8086:3c44] type 00 class 0x110100
> [    0.811797] pci 0000:3f:13.6: [8086:3c45] type 00 class 0x088000
> [    0.811840] pci_bus 0000:3f: busn_res: [bus 3f-ff] end is updated to 3f
> [    0.811842] pci_bus 0000:3f: busn_res: can not insert [bus 3f] under domain [bus 00-ff] (conflicts with (null) [bus 00-3f])
> [    0.812495] PCI: Discovered peer bus 7f
> [    0.812495] PCI: root bus 7f: using default resources
> [    0.812496] PCI: Probing PCI hardware (bus 7f)
> [    0.812515] PCI host bridge to bus 0000:7f
> [    0.812516] pci_bus 0000:7f: Unknown NUMA node; performance will be reduced
> [    0.812517] pci_bus 0000:7f: root bus resource [io  0x0000-0xffff]
> [    0.812518] pci_bus 0000:7f: root bus resource [mem 0x00000000-0x3fffffffffff]
> [    0.812519] pci_bus 0000:7f: No busn resource found for root bus, will use [bus 7f-ff]
> [    0.812520] pci_bus 0000:7f: busn_res: can not insert [bus 7f-ff] under domain [bus 00-ff] (conflicts with (null) [bus 40-ff])
> [    0.812529] pci 0000:7f:08.0: [8086:3c80] type 00 class 0x088000
> [    0.812587] pci 0000:7f:08.3: [8086:3c83] type 00 class 0x088000
> [    0.812656] pci 0000:7f:08.4: [8086:3c84] type 00 class 0x088000
> [    0.812729] pci 0000:7f:09.0: [8086:3c90] type 00 class 0x088000
> [    0.812784] pci 0000:7f:09.3: [8086:3c93] type 00 class 0x088000
> [    0.812857] pci 0000:7f:09.4: [8086:3c94] type 00 class 0x088000
> [    0.812927] pci 0000:7f:0a.0: [8086:3cc0] type 00 class 0x088000
> [    0.812978] pci 0000:7f:0a.1: [8086:3cc1] type 00 class 0x088000
> [    0.813023] pci 0000:7f:0a.2: [8086:3cc2] type 00 class 0x088000
> [    0.813069] pci 0000:7f:0a.3: [8086:3cd0] type 00 class 0x088000
> [    0.813116] pci 0000:7f:0b.0: [8086:3ce0] type 00 class 0x088000
> [    0.813161] pci 0000:7f:0b.3: [8086:3ce3] type 00 class 0x088000
> [    0.813207] pci 0000:7f:0c.0: [8086:3ce8] type 00 class 0x088000
> [    0.813250] pci 0000:7f:0c.1: [8086:3ce8] type 00 class 0x088000
> [    0.813293] pci 0000:7f:0c.2: [8086:3ce8] type 00 class 0x088000
> [    0.813342] pci 0000:7f:0c.3: [8086:3ce8] type 00 class 0x088000
> [    0.813386] pci 0000:7f:0c.6: [8086:3cf4] type 00 class 0x088000
> [    0.813429] pci 0000:7f:0c.7: [8086:3cf6] type 00 class 0x088000
> [    0.813472] pci 0000:7f:0d.0: [8086:3ce8] type 00 class 0x088000
> [    0.813515] pci 0000:7f:0d.1: [8086:3ce8] type 00 class 0x088000
> [    0.813559] pci 0000:7f:0d.2: [8086:3ce8] type 00 class 0x088000
> [    0.813602] pci 0000:7f:0d.3: [8086:3ce8] type 00 class 0x088000
> [    0.813645] pci 0000:7f:0d.6: [8086:3cf5] type 00 class 0x088000
> [    0.813689] pci 0000:7f:0e.0: [8086:3ca0] type 00 class 0x088000
> [    0.813738] pci 0000:7f:0e.1: [8086:3c46] type 00 class 0x110100
> [    0.813794] pci 0000:7f:0f.0: [8086:3ca8] type 00 class 0x088000
> [    0.813857] pci 0000:7f:0f.1: [8086:3c71] type 00 class 0x088000
> [    0.813924] pci 0000:7f:0f.2: [8086:3caa] type 00 class 0x088000
> [    0.813988] pci 0000:7f:0f.3: [8086:3cab] type 00 class 0x088000
> [    0.814052] pci 0000:7f:0f.4: [8086:3cac] type 00 class 0x088000
> [    0.814117] pci 0000:7f:0f.5: [8086:3cad] type 00 class 0x088000
> [    0.814179] pci 0000:7f:0f.6: [8086:3cae] type 00 class 0x088000
> [    0.814228] pci 0000:7f:10.0: [8086:3cb0] type 00 class 0x088000
> [    0.814293] pci 0000:7f:10.1: [8086:3cb1] type 00 class 0x088000
> [    0.814358] pci 0000:7f:10.2: [8086:3cb2] type 00 class 0x088000
> [    0.814422] pci 0000:7f:10.3: [8086:3cb3] type 00 class 0x088000
> [    0.814486] pci 0000:7f:10.4: [8086:3cb4] type 00 class 0x088000
> [    0.814550] pci 0000:7f:10.5: [8086:3cb5] type 00 class 0x088000
> [    0.814616] pci 0000:7f:10.6: [8086:3cb6] type 00 class 0x088000
> [    0.814695] pci 0000:7f:10.7: [8086:3cb7] type 00 class 0x088000
> [    0.814762] pci 0000:7f:11.0: [8086:3cb8] type 00 class 0x088000
> [    0.814817] pci 0000:7f:13.0: [8086:3ce4] type 00 class 0x088000
> [    0.814862] pci 0000:7f:13.1: [8086:3c43] type 00 class 0x110100
> [    0.814907] pci 0000:7f:13.4: [8086:3ce6] type 00 class 0x110100
> [    0.814955] pci 0000:7f:13.5: [8086:3c44] type 00 class 0x110100
> [    0.815001] pci 0000:7f:13.6: [8086:3c45] type 00 class 0x088000
> [    0.815053] pci_bus 0000:7f: busn_res: [bus 7f-ff] end is updated to 7f
> [    0.815055] pci_bus 0000:7f: busn_res: can not insert [bus 7f] under domain [bus 00-ff] (conflicts with (null) [bus 40-ff])
> [    0.815066] PCI: pci_cache_line_size set to 64 bytes
> [    0.815222] e820: reserve RAM buffer [mem 0x037da018-0x03ffffff]
> [    0.815224] e820: reserve RAM buffer [mem 0x037e4018-0x03ffffff]
> [    0.815224] e820: reserve RAM buffer [mem 0x037f3018-0x03ffffff]
> [    0.815225] e820: reserve RAM buffer [mem 0x03853018-0x03ffffff]
> [    0.815226] e820: reserve RAM buffer [mem 0x03a97018-0x03ffffff]
> [    0.815227] e820: reserve RAM buffer [mem 0x03ab1018-0x03ffffff]
> [    0.815228] e820: reserve RAM buffer [mem 0xcb713000-0xcbffffff]
> [    0.815229] e820: reserve RAM buffer [mem 0xcba91000-0xcbffffff]
> [    0.816118] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
> [    0.816121] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
> [    0.818136] clocksource: Switched to clocksource tsc-early
> [    0.842556] VFS: Disk quotas dquot_6.6.0
> [    0.842591] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.842676] pnp: PnP ACPI init
> [    0.842807] system 00:00: [mem 0xfc000000-0xfcffffff window] has been reserved
> [    0.842809] system 00:00: [mem 0xfd000000-0xfdffffff window] has been reserved
> [    0.842810] system 00:00: [mem 0xfe000000-0xfeafffff window] has been reserved
> [    0.842811] system 00:00: [mem 0xfeb00000-0xfebfffff window] has been reserved
> [    0.842813] system 00:00: [mem 0xfed00400-0xfed3ffff window] could not be reserved
> [    0.842814] system 00:00: [mem 0xfed45000-0xfedfffff window] has been reserved
> [    0.842815] system 00:00: [mem 0xeffff000-0xefffffff window] has been reserved
> [    0.842821] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
> [    0.842980] system 00:01: [io  0x0620-0x063f] has been reserved
> [    0.842981] system 00:01: [io  0x0610-0x061f] has been reserved
> [    0.842984] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
> [    0.843025] pnp 00:02: Plug and Play ACPI device, IDs PNP0303 PNP030b (active)
> [    0.843059] pnp 00:03: Plug and Play ACPI device, IDs PNP0f03 PNP0f13 (active)
> [    0.843091] pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.843183] system 00:05: [io  0x04d0-0x04d1] has been reserved
> [    0.843187] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
> [    0.843329] pnp 00:06: [dma 0 disabled]
> [    0.843348] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.843522] system 00:07: [io  0x0400-0x0453] has been reserved
> [    0.843524] system 00:07: [io  0x0458-0x047f] has been reserved
> [    0.843525] system 00:07: [io  0x1180-0x119f] has been reserved
> [    0.843526] system 00:07: [io  0x0500-0x057f] has been reserved
> [    0.843528] system 00:07: [mem 0xfed1c000-0xfed1ffff] has been reserved
> [    0.843529] system 00:07: [mem 0xfec00000-0xfecfffff] could not be reserved
> [    0.843530] system 00:07: [mem 0xfed08000-0xfed08fff] has been reserved
> [    0.843531] system 00:07: [mem 0xff000000-0xffffffff] has been reserved
> [    0.843535] system 00:07: Plug and Play ACPI device, IDs PNP0c01 (active)
> [    0.843627] system 00:08: [io  0x0454-0x0457] has been reserved
> [    0.843631] system 00:08: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
> [    0.844131] system 00:09: [mem 0xfed40000-0xfed44fff] has been reserved
> [    0.844135] system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
> [    0.844137] pnp: PnP ACPI: found 10 devices
> [    0.849889] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [    0.849969] NET: Registered protocol family 2
> [    0.850319] tcp_listen_portaddr_hash hash table entries: 32768 (order: 7, 524288 bytes, vmalloc)
> [    0.850572] TCP established hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc)
> [    0.851245] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, vmalloc)
> [    0.851375] TCP: Hash tables configured (established 524288 bind 65536)
> [    0.851857] MPTCP token hash table entries: 65536 (order: 8, 1572864 bytes, vmalloc)
> [    0.852121] UDP hash table entries: 32768 (order: 8, 1048576 bytes, vmalloc)
> [    0.852309] UDP-Lite hash table entries: 32768 (order: 8, 1048576 bytes, vmalloc)
> [    0.852583] NET: Registered protocol family 1
> [    0.852588] NET: Registered protocol family 44
> [    0.852610] pci 0000:00:01.0: PCI bridge to [bus 02]
> [    0.852613] pci 0000:00:01.0:   bridge window [io  0xc000-0xcfff]
> [    0.852617] pci 0000:00:01.0:   bridge window [mem 0xef100000-0xef2fffff]
> [    0.852623] pci 0000:00:01.1: PCI bridge to [bus 03]
> [    0.852631] pci 0000:00:02.0: PCI bridge to [bus 06]
> [    0.852639] pci 0000:00:03.0: PCI bridge to [bus 05]
> [    0.852640] pci 0000:00:03.0:   bridge window [io  0xa000-0xafff]
> [    0.852643] pci 0000:00:03.0:   bridge window [mem 0xee000000-0xef0fffff]
> [    0.852646] pci 0000:00:03.0:   bridge window [mem 0xe0000000-0xe9ffffff 64bit pref]
> [    0.852650] pci 0000:00:11.0: PCI bridge to [bus 04]
> [    0.852652] pci 0000:00:11.0:   bridge window [io  0xb000-0xbfff]
> [    0.852659] pci 0000:00:11.0:   bridge window [mem 0xea400000-0xea8fffff 64bit pref]
> [    0.852665] pci 0000:00:1c.0: PCI bridge to [bus 01]
> [    0.852667] pci 0000:00:1c.0:   bridge window [io  0xd000-0xdfff]
> [    0.852671] pci 0000:00:1c.0:   bridge window [mem 0xef500000-0xef5fffff]
> [    0.852677] pci 0000:00:1c.5: PCI bridge to [bus 07]
> [    0.852694] pci 0000:00:1c.6: PCI bridge to [bus 08]
> [    0.852697] pci 0000:00:1c.6:   bridge window [mem 0xef400000-0xef4fffff]
> [    0.852704] pci 0000:00:1e.0: PCI bridge to [bus 09]
> [    0.852707] pci 0000:00:1e.0:   bridge window [mem 0xef300000-0xef3fffff]
> [    0.852714] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [    0.852715] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.852716] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [    0.852717] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [    0.852718] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
> [    0.852718] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
> [    0.852719] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xefffffff window]
> [    0.852720] pci_bus 0000:00: resource 11 [mem 0x3c0000000000-0x3c007fffffff window]
> [    0.852721] pci_bus 0000:02: resource 0 [io  0xc000-0xcfff]
> [    0.852722] pci_bus 0000:02: resource 1 [mem 0xef100000-0xef2fffff]
> [    0.852723] pci_bus 0000:05: resource 0 [io  0xa000-0xafff]
> [    0.852724] pci_bus 0000:05: resource 1 [mem 0xee000000-0xef0fffff]
> [    0.852725] pci_bus 0000:05: resource 2 [mem 0xe0000000-0xe9ffffff 64bit pref]
> [    0.852726] pci_bus 0000:04: resource 0 [io  0xb000-0xbfff]
> [    0.852726] pci_bus 0000:04: resource 2 [mem 0xea400000-0xea8fffff 64bit pref]
> [    0.852727] pci_bus 0000:01: resource 0 [io  0xd000-0xdfff]
> [    0.852728] pci_bus 0000:01: resource 1 [mem 0xef500000-0xef5fffff]
> [    0.852729] pci_bus 0000:08: resource 1 [mem 0xef400000-0xef4fffff]
> [    0.852730] pci_bus 0000:09: resource 1 [mem 0xef300000-0xef3fffff]
> [    0.852731] pci_bus 0000:09: resource 4 [io  0x0000-0x03af window]
> [    0.852732] pci_bus 0000:09: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.852733] pci_bus 0000:09: resource 6 [io  0x03b0-0x03df window]
> [    0.852733] pci_bus 0000:09: resource 7 [io  0x0d00-0xffff window]
> [    0.852734] pci_bus 0000:09: resource 8 [mem 0x000a0000-0x000bffff window]
> [    0.852735] pci_bus 0000:09: resource 9 [mem 0x000c0000-0x000dffff window]
> [    0.852736] pci_bus 0000:09: resource 10 [mem 0xe0000000-0xefffffff window]
> [    0.852737] pci_bus 0000:09: resource 11 [mem 0x3c0000000000-0x3c007fffffff window]
> [    0.852780] pci 0000:40:02.0: PCI bridge to [bus 42]
> [    0.852789] pci 0000:40:03.0: PCI bridge to [bus 43]
> [    0.852798] pci_bus 0000:40: resource 4 [io  0x0000-0x03af window]
> [    0.852799] pci_bus 0000:40: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.852799] pci_bus 0000:40: resource 6 [mem 0x000c0000-0x000dffff window]
> [    0.852800] pci_bus 0000:40: resource 7 [mem 0xdc000000-0xdfffffff window]
> [    0.852801] pci_bus 0000:40: resource 8 [mem 0x3c0080000000-0x3c00ffffffff window]
> [    0.852811] pci_bus 0000:3f: resource 4 [io  0x0000-0xffff]
> [    0.852812] pci_bus 0000:3f: resource 5 [mem 0x00000000-0x3fffffffffff]
> [    0.852820] pci_bus 0000:7f: resource 4 [io  0x0000-0xffff]
> [    0.852821] pci_bus 0000:7f: resource 5 [mem 0x00000000-0x3fffffffffff]
> [    0.852836] pci 0000:00:05.0: disabled boot interrupts on device [8086:3c28]
> [    0.877176] pci 0000:00:1a.0: quirk_usb_early_handoff+0x0/0x670 took 23748 usecs
> [    0.901169] pci 0000:00:1d.0: quirk_usb_early_handoff+0x0/0x670 took 23416 usecs
> [    0.901190] pci 0000:05:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
> [    0.901216] pci 0000:05:00.1: D0 power state depends on 0000:05:00.0
> [    0.901350] pci 0000:40:05.0: disabled boot interrupts on device [8086:3c28]
> [    0.901473] PCI: CLS 64 bytes, default 64
> [    0.901527] Trying to unpack rootfs image as initramfs...
> [    1.333757] Freeing initrd memory: 32724K
> [    1.333789] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    1.333791] software IO TLB: mapped [mem 0xc7713000-0xcb713000] (64MB)
> [    1.338000] Initialise system trusted keyrings
> [    1.338011] Key type blacklist registered
> [    1.338100] workingset: timestamp_bits=36 max_order=24 bucket_order=0
> [    1.339458] zbud: loaded
> [    1.340219] integrity: Platform Keyring initialized
> [    1.349553] NET: Registered protocol family 38
> [    1.349556] Key type asymmetric registered
> [    1.349557] Asymmetric key parser 'x509' registered
> [    1.349564] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [    1.349673] io scheduler mq-deadline registered
> [    1.349674] io scheduler kyber registered
> [    1.349711] io scheduler bfq registered
> [    1.350108] atomic64_test: passed for x86-64 platform with CX8 and with SSE
> [    1.351815] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    1.351844] efifb: probing for efifb
> [    1.351857] efifb: No BGRT, not showing boot graphics
> [    1.351858] efifb: framebuffer at 0xe9000000, using 1876k, total 1875k
> [    1.351859] efifb: mode is 800x600x32, linelength=3200, pages=1
> [    1.351859] efifb: scrolling: redraw
> [    1.351860] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> [    1.351913] fbcon: Deferring console take-over
> [    1.351914] fb0: EFI VGA frame buffer device
> [    1.351930] intel_idle: MWAIT substates: 0x21120
> [    1.351996] Monitor-Mwait will be used to enter C-1 state
> [    1.352002] Monitor-Mwait will be used to enter C-2 state
> [    1.352007] Monitor-Mwait will be used to enter C-3 state
> [    1.352011] ACPI: \_SB_.SCK0.CP00: Found 3 idle states
> [    1.352013] intel_idle: v0.5.1 model 0x2D
> [    1.353515] intel_idle: Local APIC timer is reliable in all C-states
> [    1.353672] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [    1.353722] ACPI: Power Button [PWRB]
> [    1.353761] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> [    1.353782] ACPI: Power Button [PWRF]
> [    1.388502] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    1.388600] 00:06: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [    1.391252] 0000:00:16.3: ttyS4 at I/O 0xe060 (irq = 17, base_baud = 115200) is a 16550A
> [    1.391639] Non-volatile memory driver v1.3
> [    1.391687] Linux agpgart interface v0.103
> [    1.395363] ahci 0000:00:1f.2: version 3.0
> [    1.395521] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x1 impl RAID mode
> [    1.395523] ahci 0000:00:1f.2: flags: 64bit ncq sntf led clo pio ems sxs apst 
> [    1.396039] scsi host0: ahci
> [    1.396414] scsi host1: ahci
> [    1.396647] scsi host2: ahci
> [    1.396852] scsi host3: ahci
> [    1.396986] scsi host4: ahci
> [    1.397161] scsi host5: ahci
> [    1.397221] ata1: SATA max UDMA/133 abar m2048@0xef648000 port 0xef648100 irq 39
> [    1.397221] ata2: DUMMY
> [    1.397222] ata3: DUMMY
> [    1.397222] ata4: DUMMY
> [    1.397223] ata5: DUMMY
> [    1.397223] ata6: DUMMY
> [    1.397463] libphy: Fixed MDIO Bus: probed
> [    1.397680] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.397686] ehci-pci: EHCI PCI platform driver
> [    1.397900] ehci-pci 0000:00:1a.0: EHCI Host Controller
> [    1.397935] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 1
> [    1.397946] ehci-pci 0000:00:1a.0: debug port 2
> [    1.401871] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
> [    1.401889] ehci-pci 0000:00:1a.0: irq 16, io mem 0xef64b000
> [    1.409147] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
> [    1.409217] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
> [    1.409219] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.409220] usb usb1: Product: EHCI Host Controller
> [    1.409228] usb usb1: Manufacturer: Linux 5.9.10-100.fc32.x86_64 ehci_hcd
> [    1.409229] usb usb1: SerialNumber: 0000:00:1a.0
> [    1.409461] hub 1-0:1.0: USB hub found
> [    1.409469] hub 1-0:1.0: 3 ports detected
> [    1.409721] ehci-pci 0000:00:1d.0: EHCI Host Controller
> [    1.409782] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 2
> [    1.409792] ehci-pci 0000:00:1d.0: debug port 2
> [    1.413680] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
> [    1.413691] ehci-pci 0000:00:1d.0: irq 23, io mem 0xef64a000
> [    1.421134] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
> [    1.421200] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
> [    1.421201] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.421202] usb usb2: Product: EHCI Host Controller
> [    1.421203] usb usb2: Manufacturer: Linux 5.9.10-100.fc32.x86_64 ehci_hcd
> [    1.421203] usb usb2: SerialNumber: 0000:00:1d.0
> [    1.421413] hub 2-0:1.0: USB hub found
> [    1.421419] hub 2-0:1.0: 3 ports detected
> [    1.421572] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.421577] ohci-pci: OHCI PCI platform driver
> [    1.421594] uhci_hcd: USB Universal Host Controller Interface driver
> [    1.421681] xhci_hcd 0000:08:00.0: xHCI Host Controller
> [    1.421751] xhci_hcd 0000:08:00.0: new USB bus registered, assigned bus number 3
> [    1.421889] xhci_hcd 0000:08:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004004000
> [    1.422203] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
> [    1.422205] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.422205] usb usb3: Product: xHCI Host Controller
> [    1.422206] usb usb3: Manufacturer: Linux 5.9.10-100.fc32.x86_64 xhci-hcd
> [    1.422207] usb usb3: SerialNumber: 0000:08:00.0
> [    1.422413] hub 3-0:1.0: USB hub found
> [    1.422426] hub 3-0:1.0: 4 ports detected
> [    1.422580] xhci_hcd 0000:08:00.0: xHCI Host Controller
> [    1.422644] xhci_hcd 0000:08:00.0: new USB bus registered, assigned bus number 4
> [    1.422647] xhci_hcd 0000:08:00.0: Host supports USB 3.0 SuperSpeed
> [    1.422663] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
> [    1.422681] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.09
> [    1.422682] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    1.422683] usb usb4: Product: xHCI Host Controller
> [    1.422683] usb usb4: Manufacturer: Linux 5.9.10-100.fc32.x86_64 xhci-hcd
> [    1.422684] usb usb4: SerialNumber: 0000:08:00.0
> [    1.422759] hub 4-0:1.0: USB hub found
> [    1.422770] hub 4-0:1.0: 4 ports detected
> [    1.422916] usbcore: registered new interface driver usbserial_generic
> [    1.422920] usbserial: USB Serial support registered for generic
> [    1.422965] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
> [    1.425814] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    1.425820] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    1.425964] mousedev: PS/2 mouse device common for all mice
> [    1.426090] rtc_cmos 00:04: RTC can wake from S4
> [    1.426336] rtc_cmos 00:04: registered as rtc0
> [    1.426431] rtc_cmos 00:04: setting system clock to 2020-11-26T09:08:56 UTC (1606381736)
> [    1.426433] rtc_cmos 00:04: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    1.426511] device-mapper: uevent: version 1.0.3
> [    1.426577] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
> [    1.426755] intel_pstate: Intel P-state driver initializing
> [    1.429012] hid: raw HID events driver (C) Jiri Kosina
> [    1.429044] usbcore: registered new interface driver usbhid
> [    1.429045] usbhid: USB HID core driver
> [    1.429222] drop_monitor: Initializing network drop monitor service
> [    1.429311] Initializing XFRM netlink socket
> [    1.429461] NET: Registered protocol family 10
> [    1.435601] Segment Routing with IPv6
> [    1.435602] RPL Segment Routing with IPv6
> [    1.435623] mip6: Mobile IPv6
> [    1.435625] NET: Registered protocol family 17
> [    1.441472] microcode: sig=0x206d7, pf=0x1, revision=0x71a
> [    1.442626] microcode: Microcode Update Driver: v2.2.
> [    1.442630] IPI shorthand broadcast: enabled
> [    1.442638] AVX version of gcm_enc/dec engaged.
> [    1.442639] AES CTR mode by8 optimization enabled
> [    1.467439] sched_clock: Marking stable (1466872780, 557235)->(1556480395, -89050380)
> [    1.467868] registered taskstats version 1
> [    1.467878] Loading compiled-in X.509 certificates
> [    1.469203] Loaded X.509 cert 'Fedora kernel signing key: e6432c647b775e5b3fb0e10e30b57f9aaca62f3b'
> [    1.469262] zswap: loaded using pool lzo/zbud
> [    1.469999] Key type ._fscrypt registered
> [    1.470001] Key type .fscrypt registered
> [    1.470002] Key type fscrypt-provisioning registered
> [    1.470555] Btrfs loaded, crc32c=crc32c-generic
> [    1.473905] Key type encrypted registered
> [    1.474574] ima: No TPM chip found, activating TPM-bypass!
> [    1.474581] ima: Allocated hash algorithm: sha256
> [    1.474590] ima: No architecture policies found
> [    1.475732] PM:   Magic number: 12:4:122
> [    1.475831] pci 0000:7f:0f.3: hash matches
> [    1.475924] acpi LNXSYBUS:00: hash matches
> [    1.475978] memory memory267: hash matches
> [    1.476162] RAS: Correctable Errors collector initialized.
> [    1.686354] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [    1.688865] ata1.00: ATAPI: hp      DVD A  DH16ACSHR, JHG6, max UDMA/100
> [    1.689978] ata1.00: configured for UDMA/100
> [    1.697022] scsi 0:0:0:0: CD-ROM            hp       DVD A  DH16ACSHR JHG6 PQ: 0 ANSI: 5
> [    1.706136] usb 1-1: new high-speed USB device number 2 using ehci-pci
> [    1.722131] usb 2-1: new high-speed USB device number 2 using ehci-pci
> [    1.739208] sr 0:0:0:0: [sr0] scsi3-mmc drive: 40x/40x writer dvd-ram cd/rw xa/form2 cdda tray
> [    1.739212] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    1.740352] sr 0:0:0:0: Attached scsi CD-ROM sr0
> [    1.740558] sr 0:0:0:0: Attached scsi generic sg0 type 5
> [    1.744136] Freeing unused decrypted memory: 2040K
> [    1.745554] Freeing unused kernel image (initmem) memory: 2516K
> [    1.748128] Write protecting the kernel read-only data: 26624k
> [    1.749813] Freeing unused kernel image (text/rodata gap) memory: 2044K
> [    1.750863] Freeing unused kernel image (rodata/data gap) memory: 1480K
> [    1.834635] usb 1-1: New USB device found, idVendor=8087, idProduct=0024, bcdDevice= 0.00
> [    1.834639] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.834997] hub 1-1:1.0: USB hub found
> [    1.835074] hub 1-1:1.0: 6 ports detected
> [    1.836868] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    1.836871] rodata_test: all tests were successful
> [    1.836872] x86/mm: Checking user space page tables
> [    1.850753] usb 2-1: New USB device found, idVendor=8087, idProduct=0024, bcdDevice= 0.00
> [    1.850755] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.851209] hub 2-1:1.0: USB hub found
> [    1.851404] hub 2-1:1.0: 8 ports detected
> [    1.881128] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    1.881133] Run /init as init process
> [    1.881134]   with arguments:
> [    1.881135]     /init
> [    1.881135]     rhgb
> [    1.881136]   with environment:
> [    1.881137]     HOME=/
> [    1.881137]     TERM=linux
> [    1.881137]     BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.9.10-100.fc32.x86_64
> [    1.922844] systemd[1]: systemd v245.8-2.fc32 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
> [    1.935251] systemd[1]: Detected architecture x86-64.
> [    1.935257] systemd[1]: Running in initial RAM disk.
> [    1.935302] systemd[1]: Set hostname to <111-A77c-01>.
> [    2.042429] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.042452] systemd[1]: Reached target Local File Systems.
> [    2.042541] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.042554] systemd[1]: Reached target Slices.
> [    2.042576] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.042587] systemd[1]: Reached target Swap.
> [    2.042611] systemd[1]: Reached target Timers.
> [    2.042872] systemd[1]: Listening on Journal Audit Socket.
> [    2.043035] systemd[1]: Listening on Journal Socket (/dev/log).
> [    2.043233] systemd[1]: Listening on Journal Socket.
> [    2.043392] systemd[1]: Listening on udev Control Socket.
> [    2.043506] systemd[1]: Listening on udev Kernel Socket.
> [    2.043538] systemd[1]: Reached target Sockets.
> [    2.046463] systemd[1]: Starting Create list of static device nodes for the current kernel...
> [    2.047506] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
> [    2.050172] systemd[1]: Starting Journal Service...
> [    2.051325] systemd[1]: Starting Load Kernel Modules...
> [    2.052350] systemd[1]: Starting Setup Virtual Console...
> [    2.053057] systemd[1]: Finished Create list of static device nodes for the current kernel.
> [    2.054124] systemd[1]: Starting Create Static Device Nodes in /dev...
> [    2.060677] systemd[1]: Finished Create Static Device Nodes in /dev.
> [    2.105207] fuse: init (API version 7.31)
> [    2.106400] systemd[1]: Finished Load Kernel Modules.
> [    2.106468] audit: type=1130 audit(1606381737.179:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.107373] systemd[1]: Starting Apply Kernel Variables...
> [    2.113907] systemd[1]: Finished Apply Kernel Variables.
> [    2.114009] audit: type=1130 audit(1606381737.186:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.114406] systemd[1]: Finished Setup Virtual Console.
> [    2.114501] audit: type=1130 audit(1606381737.187:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.114556] systemd[1]: Condition check resulted in dracut ask for additional cmdline parameters being skipped.
> [    2.115372] systemd[1]: Starting dracut cmdline hook...
> [    2.128117] usb 2-1.5: new low-speed USB device number 3 using ehci-pci
> [    2.147612] systemd[1]: Started Journal Service.
> [    2.147753] audit: type=1130 audit(1606381737.220:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.157303] audit: type=1130 audit(1606381737.230:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.208692] audit: type=1130 audit(1606381737.281:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.216137] usb 2-1.5: New USB device found, idVendor=03f0, idProduct=0324, bcdDevice= 1.04
> [    2.216140] usb 2-1.5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    2.216141] usb 2-1.5: Product: HP Basic USB Keyboard
> [    2.216143] usb 2-1.5: Manufacturer: Lite-On Technology Corp.
> [    2.221154] input: Lite-On Technology Corp. HP Basic USB Keyboard as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:03F0:0324.0001/input/input5
> [    2.236473] audit: type=1130 audit(1606381737.309:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [    2.236981] audit: type=1334 audit(1606381737.309:9): prog-id=6 op=LOAD
> [    2.237144] audit: type=1334 audit(1606381737.310:10): prog-id=7 op=LOAD
> [    2.273384] hid-generic 0003:03F0:0324.0001: input,hidraw0: USB HID v1.10 Keyboard [Lite-On Technology Corp. HP Basic USB Keyboard] on usb-0000:00:1d.0-1.5/input0
> [    2.337076] usb 2-1.6: new low-speed USB device number 4 using ehci-pci
> [    2.344076] tsc: Refined TSC clocksource calibration: 3092.547 MHz
> [    2.344092] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2c93c7126a4, max_idle_ns: 440795248184 ns
> [    2.344162] clocksource: Switched to clocksource tsc
> [    2.422316] usb 2-1.6: New USB device found, idVendor=03f0, idProduct=094a, bcdDevice= 1.00
> [    2.422320] usb 2-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    2.422323] usb 2-1.6: Product: HP USB Optical Mouse
> [    2.422325] usb 2-1.6: Manufacturer: PixArt
> [    2.425290] input: PixArt HP USB Optical Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.6/2-1.6:1.0/0003:03F0:094A.0002/input/input6
> [    2.425524] hid-generic 0003:03F0:094A.0002: input,hidraw1: USB HID v1.11 Mouse [PixArt HP USB Optical Mouse] on usb-0000:00:1d.0-1.6/input0
> [    2.432754] scsi host6: ata_generic
> [    2.432964] scsi host7: ata_generic
> [    2.433015] ata7: PATA max UDMA/100 cmd 0xe0b0 ctl 0xe0a0 bmdma 0xe070 irq 18
> [    2.433015] ata8: PATA max UDMA/100 cmd 0xe090 ctl 0xe080 bmdma 0xe078 irq 18
> [    2.441556] e1000e: Intel(R) PRO/1000 Network Driver
> [    2.441557] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    2.441769] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> [    2.443388] firewire_ohci 0000:09:01.0: enabling device (0100 -> 0102)
> [    2.448407] isci: Intel(R) C600 SAS Controller Driver - version 1.2.0
> [    2.448429] isci 0000:04:00.0: driver configured for rev: 5 silicon
> [    2.448540] isci 0000:04:00.0: Unable to obtain EFI var data for OEM parms
> [    2.448550] isci 0000:04:00.0: OEM parameter table found in OROM
> [    2.448552] isci 0000:04:00.0: OEM SAS parameters (version: 1.1) loaded (platform)
> [    2.448749] isci 0000:04:00.0: SCU controller 0: phy 3-0 cables: {short, short, short, short}
> [    2.451030] scsi host8: isci
> [    2.457679] mpt3sas version 34.100.00.00 loaded
> [    2.457792] mpt3sas 0000:02:00.0: can't disable ASPM; OS doesn't have ASPM control
> [    2.457995] mpt2sas_cm0: 64 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (49366236 kB)
> [    2.489081] usb 2-1.7: new low-speed USB device number 5 using ehci-pci
> [    2.495116] firewire_ohci 0000:09:01.0: added OHCI v1.0 device as card 0, 8 IR + 8 IT contexts, quirks 0x0
> [    2.512075] mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> [    2.512082] mpt2sas_cm0: MSI-X vectors supported: 16
> [    2.512083] 	 no of cores: 32, max_msix_vectors: -1
> [    2.512083] mpt2sas_cm0:  0 8
> [    2.512296] mpt2sas_cm0: High IOPs queues : disabled
> [    2.512297] mpt2sas0-msix0: PCI-MSI-X enabled: IRQ 51
> [    2.512297] mpt2sas0-msix1: PCI-MSI-X enabled: IRQ 52
> [    2.512298] mpt2sas0-msix2: PCI-MSI-X enabled: IRQ 53
> [    2.512298] mpt2sas0-msix3: PCI-MSI-X enabled: IRQ 54
> [    2.512299] mpt2sas0-msix4: PCI-MSI-X enabled: IRQ 55
> [    2.512299] mpt2sas0-msix5: PCI-MSI-X enabled: IRQ 56
> [    2.512300] mpt2sas0-msix6: PCI-MSI-X enabled: IRQ 57
> [    2.512300] mpt2sas0-msix7: PCI-MSI-X enabled: IRQ 58
> [    2.512302] mpt2sas_cm0: iomem(0x00000000ef240000), mapped(0x(____ptrval____)), size(65536)
> [    2.512303] mpt2sas_cm0: ioport(0x000000000000c000), size(256)
> [    2.526109] e1000e 0000:00:19.0 0000:00:19.0 (uninitialized): registered PHC clock
> [    2.566586] mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
> [    2.566588] mpt2sas_cm0: sending diag reset !!
> [    2.574691] usb 2-1.7: New USB device found, idVendor=0764, idProduct=0501, bcdDevice= 0.01
> [    2.574693] usb 2-1.7: New USB device strings: Mfr=3, Product=1, SerialNumber=0
> [    2.574694] usb 2-1.7: Product: Value2200E
> [    2.574695] usb 2-1.7: Manufacturer: CPS
> [    2.603873] hid-generic 0003:0764:0501.0003: hiddev96,hidraw2: USB HID v1.10 Device [CPS Value2200E] on usb-0000:00:1d.0-1.7/input0
> [    2.609797] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 2c:41:38:4f:5b:45
> [    2.609798] e1000e 0000:00:19.0 eth0: Intel(R) PRO/1000 Network Connection
> [    2.609833] e1000e 0000:00:19.0 eth0: MAC: 10, PHY: 11, PBA No: 0100FF-0FF
> [    2.610051] e1000e 0000:01:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
> [    2.653137] e1000e 0000:01:00.0 0000:01:00.0 (uninitialized): registered PHC clock
> [    2.668081] usb 2-1.8: new high-speed USB device number 6 using ehci-pci
> [    2.672171] checking generic (e9000000 1d5000) vs hw (ee000000 1000000)
> [    2.672172] checking generic (e9000000 1d5000) vs hw (e0000000 8000000)
> [    2.672173] checking generic (e9000000 1d5000) vs hw (e8000000 2000000)
> [    2.672174] fb0: switching to nouveaufb from EFI VGA
> [    2.672364] nouveau 0000:05:00.0: vgaarb: deactivate vga console
> [    2.672403] nouveau 0000:05:00.0: NVIDIA GF108 (0c1c00a1)
> [    2.698546] e1000e 0000:01:00.0 eth1: (PCI Express:2.5GT/s:Width x1) 2c:41:38:4f:5b:44
> [    2.698548] e1000e 0000:01:00.0 eth1: Intel(R) PRO/1000 Network Connection
> [    2.698638] e1000e 0000:01:00.0 eth1: MAC: 3, PHY: 8, PBA No: FFFFFF-0FF
> [    2.700711] e1000e 0000:00:19.0 eno1: renamed from eth0
> [    2.746445] usb 2-1.8: New USB device found, idVendor=03f0, idProduct=2514, bcdDevice= 0.00
> [    2.746447] usb 2-1.8: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    2.746695] hub 2-1.8:1.0: USB hub found
> [    2.746766] hub 2-1.8:1.0: 4 ports detected
> [    2.798567] nouveau 0000:05:00.0: bios: version 70.08.88.00.07
> [    2.799094] nouveau 0000:05:00.0: fb: 1024 MiB DDR3
> [    2.838228] e1000e 0000:01:00.0 enp1s0: renamed from eth1
> [    3.000235] firewire_core 0000:09:01.0: created device fw0: GUID 0060b000008b7f8e, S400
> [    3.429438] random: crng init done
> [    3.429439] random: 7 urandom warning(s) missed due to ratelimiting
> [    3.479692] [TTM] Zone  kernel: Available graphics memory: 24683118 KiB
> [    3.479693] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
> [    3.479694] [TTM] Initializing pool allocator
> [    3.479699] [TTM] Initializing DMA pool allocator
> [    3.479714] nouveau 0000:05:00.0: DRM: VRAM: 1024 MiB
> [    3.479715] nouveau 0000:05:00.0: DRM: GART: 1048576 MiB
> [    3.479717] nouveau 0000:05:00.0: DRM: TMDS table version 2.0
> [    3.479718] nouveau 0000:05:00.0: DRM: DCB version 4.0
> [    3.479719] nouveau 0000:05:00.0: DRM: DCB outp 00: 02000300 00000000
> [    3.479720] nouveau 0000:05:00.0: DRM: DCB outp 01: 01000302 00020030
> [    3.479721] nouveau 0000:05:00.0: DRM: DCB outp 02: 028113a6 0f220010
> [    3.479722] nouveau 0000:05:00.0: DRM: DCB outp 03: 02011362 00020010
> [    3.479723] nouveau 0000:05:00.0: DRM: DCB conn 00: 00001030
> [    3.479723] nouveau 0000:05:00.0: DRM: DCB conn 01: 00010146
> [    3.480477] nouveau 0000:05:00.0: DRM: MM: using COPY0 for buffer copies
> [    3.524998] nouveau 0000:05:00.0: DRM: allocated 1920x1200 fb: 0x60000, bo 00000000f5625c59
> [    3.539753] fbcon: nouveaudrmfb (fb0) is primary device
> [    3.539753] fbcon: Deferring console take-over
> [    3.539755] nouveau 0000:05:00.0: [drm] fb0: nouveaudrmfb frame buffer device
> [    3.550342] [drm] Initialized nouveau 1.3.1 20120801 for 0000:05:00.0 on minor 0
> [    3.628200] mpt2sas_cm0: diag reset: SUCCESS
> [    3.661304] mpt2sas_cm0: scatter gather: sge_in_main_msg(1), sge_per_chain(9), sge_per_io(128), chains_per_io(15)
> [    3.661436] mpt2sas_cm0: request pool(0x0000000064c9cc5b) - dma(0x60b400000): depth(3200), frame_size(128), pool_size(400 kB)
> [    3.669700] mpt2sas_cm0: sense pool(0x00000000046fd73b)- dma(0x60b200000): depth(2939),element_size(96), pool_size(275 kB)
> [    3.669756] mpt2sas_cm0: config page(0x000000003931e9f1) - dma(0x60b1ef000): size(512)
> [    3.669756] mpt2sas_cm0: Allocated physical memory: size(1869 kB)
> [    3.669757] mpt2sas_cm0: Current Controller Queue Depth(2936),Max Controller Queue Depth(3072)
> [    3.669757] mpt2sas_cm0: Scatter Gather Elements per IO(128)
> [    3.714312] mpt2sas_cm0: overriding NVDATA EEDPTagMode setting
> [    3.714692] mpt2sas_cm0: LSISAS2308: FWVersion(12.00.02.00), ChipRevision(0x03), BiosVersion(07.23.02.00)
> [    3.714693] mpt2sas_cm0: Protocol=(Initiator), Capabilities=(Raid,TLR,EEDP,Snapshot Buffer,Diag Trace Buffer,Task Set Full,NCQ)
> [    3.714738] scsi host9: Fusion MPT SAS Host
> [    3.715753] mpt2sas_cm0: sending port enable !!
> [    5.248263] mpt2sas_cm0: host_add: handle(0x0001), sas_addr(0x5001438016a792fd), phys(8)
> [   11.383130] mpt2sas_cm0: port enable: SUCCESS
> [   11.385184] scsi 9:0:0:0: Direct-Access     ATA      ST1000DM003-1ER1 HP51 PQ: 0 ANSI: 6
> [   11.385195] scsi 9:0:0:0: SATA: handle(0x0009), sas_addr(0x4433221100000000), phy(0), device_name(0x5000c50080842202)
> [   11.385198] scsi 9:0:0:0: enclosure logical id (0x5001438016a792fd), slot(0) 
> [   11.385419] scsi 9:0:0:0: atapi(n), ncq(y), asyn_notify(n), smart(y), fua(y), sw_preserve(y)
> [   11.385426] scsi 9:0:0:0: qdepth(32), tagged(1), scsi_level(7), cmd_que(1)
> [   11.387841]  end_device-9:0: add: handle(0x0009), sas_addr(0x4433221100000000)
> [   11.388344] sd 9:0:0:0: Attached scsi generic sg1 type 0
> [   11.390080] sd 9:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [   11.390084] sd 9:0:0:0: [sda] 4096-byte physical blocks
> [   11.442167] sd 9:0:0:0: [sda] Write Protect is off
> [   11.442172] sd 9:0:0:0: [sda] Mode Sense: 7f 00 00 08
> [   11.443006] sd 9:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [   11.530329]  sda: sda1 sda2 sda3
> [   11.602230] sd 9:0:0:0: [sda] Attached SCSI disk
> [   12.462019] kauditd_printk_skb: 3 callbacks suppressed
> [   12.462021] audit: type=1130 audit(1606381747.533:14): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   12.555741] audit: type=1130 audit(1606381747.627:15): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-fsck-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   12.577952] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null)
> [   12.605057] audit: type=1334 audit(1606381747.676:16): prog-id=7 op=UNLOAD
> [   12.605102] audit: type=1334 audit(1606381747.676:17): prog-id=6 op=UNLOAD
> [   12.606098] audit: type=1334 audit(1606381747.678:18): prog-id=5 op=UNLOAD
> [   12.606102] audit: type=1334 audit(1606381747.678:19): prog-id=4 op=UNLOAD
> [   12.606498] audit: type=1334 audit(1606381747.678:20): prog-id=3 op=UNLOAD
> [   12.762507] audit: type=1334 audit(1606381747.834:21): prog-id=8 op=LOAD
> [   12.763082] audit: type=1334 audit(1606381747.835:22): prog-id=9 op=LOAD
> [   12.763233] audit: type=1334 audit(1606381747.835:23): prog-id=10 op=LOAD
> [   13.116994] systemd-journald[404]: Received SIGTERM from PID 1 (systemd).
> [   14.481624] SELinux:  Permission watch in class filesystem not defined in policy.
> [   14.481627] SELinux:  Permission watch in class file not defined in policy.
> [   14.481628] SELinux:  Permission watch_mount in class file not defined in policy.
> [   14.481629] SELinux:  Permission watch_sb in class file not defined in policy.
> [   14.481629] SELinux:  Permission watch_with_perm in class file not defined in policy.
> [   14.481630] SELinux:  Permission watch_reads in class file not defined in policy.
> [   14.481632] SELinux:  Permission watch in class dir not defined in policy.
> [   14.481632] SELinux:  Permission watch_mount in class dir not defined in policy.
> [   14.481633] SELinux:  Permission watch_sb in class dir not defined in policy.
> [   14.481633] SELinux:  Permission watch_with_perm in class dir not defined in policy.
> [   14.481634] SELinux:  Permission watch_reads in class dir not defined in policy.
> [   14.481636] SELinux:  Permission watch in class lnk_file not defined in policy.
> [   14.481636] SELinux:  Permission watch_mount in class lnk_file not defined in policy.
> [   14.481637] SELinux:  Permission watch_sb in class lnk_file not defined in policy.
> [   14.481638] SELinux:  Permission watch_with_perm in class lnk_file not defined in policy.
> [   14.481638] SELinux:  Permission watch_reads in class lnk_file not defined in policy.
> [   14.481639] SELinux:  Permission watch in class chr_file not defined in policy.
> [   14.481640] SELinux:  Permission watch_mount in class chr_file not defined in policy.
> [   14.481640] SELinux:  Permission watch_sb in class chr_file not defined in policy.
> [   14.481641] SELinux:  Permission watch_with_perm in class chr_file not defined in policy.
> [   14.481641] SELinux:  Permission watch_reads in class chr_file not defined in policy.
> [   14.481642] SELinux:  Permission watch in class blk_file not defined in policy.
> [   14.481643] SELinux:  Permission watch_mount in class blk_file not defined in policy.
> [   14.481643] SELinux:  Permission watch_sb in class blk_file not defined in policy.
> [   14.481644] SELinux:  Permission watch_with_perm in class blk_file not defined in policy.
> [   14.481644] SELinux:  Permission watch_reads in class blk_file not defined in policy.
> [   14.481646] SELinux:  Permission watch in class sock_file not defined in policy.
> [   14.481646] SELinux:  Permission watch_mount in class sock_file not defined in policy.
> [   14.481647] SELinux:  Permission watch_sb in class sock_file not defined in policy.
> [   14.481647] SELinux:  Permission watch_with_perm in class sock_file not defined in policy.
> [   14.481648] SELinux:  Permission watch_reads in class sock_file not defined in policy.
> [   14.481649] SELinux:  Permission watch in class fifo_file not defined in policy.
> [   14.481649] SELinux:  Permission watch_mount in class fifo_file not defined in policy.
> [   14.481650] SELinux:  Permission watch_sb in class fifo_file not defined in policy.
> [   14.481650] SELinux:  Permission watch_with_perm in class fifo_file not defined in policy.
> [   14.481651] SELinux:  Permission watch_reads in class fifo_file not defined in policy.
> [   14.481679] SELinux:  Permission perfmon in class capability2 not defined in policy.
> [   14.481680] SELinux:  Permission bpf in class capability2 not defined in policy.
> [   14.481680] SELinux:  Permission checkpoint_restore in class capability2 not defined in policy.
> [   14.481685] SELinux:  Permission perfmon in class cap2_userns not defined in policy.
> [   14.481685] SELinux:  Permission bpf in class cap2_userns not defined in policy.
> [   14.481686] SELinux:  Permission checkpoint_restore in class cap2_userns not defined in policy.
> [   14.481707] SELinux:  Class perf_event not defined in policy.
> [   14.481708] SELinux:  Class lockdown not defined in policy.
> [   14.481708] SELinux: the above unknown classes and permissions will be allowed
> [   14.481713] SELinux:  policy capability network_peer_controls=1
> [   14.481713] SELinux:  policy capability open_perms=1
> [   14.481714] SELinux:  policy capability extended_socket_class=1
> [   14.481714] SELinux:  policy capability always_check_network=0
> [   14.481715] SELinux:  policy capability cgroup_seclabel=1
> [   14.481715] SELinux:  policy capability nnp_nosuid_transition=1
> [   14.481716] SELinux:  policy capability genfs_seclabel_symlinks=0
> [   14.508066] systemd[1]: Successfully loaded SELinux policy in 304.193ms.
> [   14.952148] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup in 76.696ms.
> [   15.010129] systemd[1]: systemd v245.8-2.fc32 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
> [   15.023270] systemd[1]: Detected architecture x86-64.
> [   15.035732] systemd[1]: Set hostname to <111-A77c-01>.
> [   17.352191] systemd[1]: initrd-switch-root.service: Succeeded.
> [   17.352366] systemd[1]: Stopped Switch Root.
> [   17.352836] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
> [   17.353199] systemd[1]: Created slice Virtual Machine and Container Slice.
> [   17.353551] systemd[1]: Created slice system-getty.slice.
> [   17.353870] systemd[1]: Created slice system-modprobe.slice.
> [   17.354189] systemd[1]: Created slice system-systemd\x2dfsck.slice.
> [   17.354550] systemd[1]: Created slice User and Session Slice.
> [   17.354589] systemd[1]: Condition check resulted in Dispatch Password Requests to Console Directory Watch being skipped.
> [   17.354696] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> [   17.355164] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
> [   17.355211] systemd[1]: Reached target Login Prompts.
> [   17.355243] systemd[1]: Stopped target Switch Root.
> [   17.355272] systemd[1]: Stopped target Initrd File Systems.
> [   17.355295] systemd[1]: Stopped target Initrd Root File System.
> [   17.355342] systemd[1]: Reached target Slices.
> [   17.355840] systemd[1]: Listening on Device-mapper event daemon FIFOs.
> [   17.356708] systemd[1]: Listening on LVM2 poll daemon socket.
> [   17.358026] systemd[1]: Listening on Process Core Dump Socket.
> [   17.358179] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [   17.358683] systemd[1]: Listening on udev Control Socket.
> [   17.358949] systemd[1]: Listening on udev Kernel Socket.
> [   17.359266] systemd[1]: Listening on User Database Manager Socket.
> [   17.360043] systemd[1]: Activating swap /dev/mapper/fedora_111--a77c--01-swap...
> [   17.361179] systemd[1]: Mounting Huge Pages File System...
> [   17.362320] systemd[1]: Mounting POSIX Message Queue File System...
> [   17.363426] systemd[1]: Mounting Kernel Debug File System...
> [   17.364534] systemd[1]: Mounting Kernel Trace File System...
> [   17.364691] systemd[1]: Condition check resulted in Kernel Module supporting RPCSEC_GSS being skipped.
> [   17.365707] systemd[1]: Starting Create list of static device nodes for the current kernel...
> [   17.367161] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
> [   17.367254] systemd[1]: Condition check resulted in Load Kernel Module drm being skipped.
> [   17.368210] systemd[1]: Starting Preprocess NFS configuration convertion...
> [   17.368428] systemd[1]: plymouth-switch-root.service: Succeeded.
> [   17.368610] systemd[1]: Stopped Plymouth switch root service.
> [   17.428271] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
> [   17.428433] systemd[1]: Stopped Journal Service.
> [   17.432350] systemd[1]: Starting Journal Service...
> [   17.448281] systemd[1]: Starting Load Kernel Modules...
> [   17.449223] systemd[1]: Starting Remount Root and Kernel File Systems...
> [   17.450201] systemd[1]: Starting Repartition Root Disk...
> [   17.451155] systemd[1]: Starting udev Coldplug all Devices...
> [   17.452188] systemd[1]: sysroot.mount: Succeeded.
> [   17.452991] systemd[1]: Mounted Huge Pages File System.
> [   17.453188] systemd[1]: Mounted POSIX Message Queue File System.
> [   17.453379] systemd[1]: Mounted Kernel Debug File System.
> [   17.453538] systemd[1]: Mounted Kernel Trace File System.
> [   17.453996] systemd[1]: Finished Create list of static device nodes for the current kernel.
> [   17.454427] systemd[1]: nfs-convert.service: Succeeded.
> [   17.454591] systemd[1]: Finished Preprocess NFS configuration convertion.
> [   17.489076] Adding 24764412k swap on /dev/mapper/fedora_111--a77c--01-swap.  Priority:-2 extents:1 across:24764412k FS
> [   17.492561] systemd[1]: Activated swap /dev/mapper/fedora_111--a77c--01-swap.
> [   17.493652] systemd[1]: Reached target Swap.
> [   17.532802] systemd[1]: tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
> [   17.534150] systemd[1]: Mounting Temporary Directory (/tmp)...
> [   17.534813] systemd[1]: Finished Repartition Root Disk.
> [   17.534957] kauditd_printk_skb: 51 callbacks suppressed
> [   17.534959] audit: type=1130 audit(1606381752.606:75): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-repart comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.537650] systemd[1]: Mounted Temporary Directory (/tmp).
> [   17.558430] audit: type=1305 audit(1606381752.630:76): op=set audit_enabled=1 old=1 auid=4294967295 ses=4294967295 subj=system_u:system_r:syslogd_t:s0 res=1
> [   17.565010] systemd[1]: Started Journal Service.
> [   17.565183] audit: type=1130 audit(1606381752.637:77): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.570541] EXT4-fs (dm-0): re-mounted. Opts: (null)
> [   17.572109] audit: type=1130 audit(1606381752.643:78): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-remount-fs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.626426] systemd-journald[814]: Received client request to flush runtime journal.
> [   17.712713] audit: type=1130 audit(1606381752.784:79): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.807015] audit: type=1130 audit(1606381752.878:80): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-sysusers comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.838322] audit: type=1130 audit(1606381752.910:81): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=readonly-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   17.872327] audit: type=1130 audit(1606381752.944:82): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   18.141215] audit: type=1130 audit(1606381753.213:83): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   18.330846] audit: type=1130 audit(1606381753.402:84): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-random-seed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   21.340967] input: PC Speaker as /devices/platform/pcspkr/input/input7
> [   21.341772] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
> [   21.342542] i2c i2c-13: 16/16 memory slots populated (from DMI)
> [   21.342544] i2c i2c-13: Systems with more than 4 memory slots not supported yet, not instantiating SPD
> [   21.658266] input: HP WMI hotkeys as /devices/virtual/input/input8
> [   22.008955] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 163840 ms ovfl timer
> [   22.008958] RAPL PMU: hw unit of domain pp0-core 2^-16 Joules
> [   22.008960] RAPL PMU: hw unit of domain package 2^-16 Joules
> [   22.008961] RAPL PMU: hw unit of domain dram 2^-16 Joules
> [   22.058793] iTCO_vendor_support: vendor-support=0
> [   22.934806] kauditd_printk_skb: 5 callbacks suppressed
> [   22.934808] audit: type=1130 audit(1606381758.006:90): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   22.942612] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [   22.942691] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
> [   22.955572] audit: type=1130 audit(1606381758.027:91): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=lvm2-pvscan@8:3 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   23.082765] EDAC sbridge: Seeking for: PCI ID 8086:3ca0
> [   23.082816] EDAC sbridge: Seeking for: PCI ID 8086:3ca0
> [   23.082847] EDAC sbridge: Seeking for: PCI ID 8086:3ca0
> [   23.082860] EDAC sbridge: Seeking for: PCI ID 8086:3ca8
> [   23.082877] EDAC sbridge: Seeking for: PCI ID 8086:3ca8
> [   23.082892] EDAC sbridge: Seeking for: PCI ID 8086:3ca8
> [   23.082898] EDAC sbridge: Seeking for: PCI ID 8086:3c71
> [   23.082915] EDAC sbridge: Seeking for: PCI ID 8086:3c71
> [   23.082929] EDAC sbridge: Seeking for: PCI ID 8086:3c71
> [   23.082935] EDAC sbridge: Seeking for: PCI ID 8086:3caa
> [   23.082952] EDAC sbridge: Seeking for: PCI ID 8086:3caa
> [   23.082965] EDAC sbridge: Seeking for: PCI ID 8086:3caa
> [   23.082971] EDAC sbridge: Seeking for: PCI ID 8086:3cab
> [   23.082988] EDAC sbridge: Seeking for: PCI ID 8086:3cab
> [   23.083002] EDAC sbridge: Seeking for: PCI ID 8086:3cab
> [   23.083008] EDAC sbridge: Seeking for: PCI ID 8086:3cac
> [   23.083025] EDAC sbridge: Seeking for: PCI ID 8086:3cac
> [   23.083039] EDAC sbridge: Seeking for: PCI ID 8086:3cac
> [   23.083044] EDAC sbridge: Seeking for: PCI ID 8086:3cad
> [   23.083074] EDAC sbridge: Seeking for: PCI ID 8086:3cad
> [   23.083088] EDAC sbridge: Seeking for: PCI ID 8086:3cad
> [   23.083094] EDAC sbridge: Seeking for: PCI ID 8086:3cb8
> [   23.083113] EDAC sbridge: Seeking for: PCI ID 8086:3cb8
> [   23.083127] EDAC sbridge: Seeking for: PCI ID 8086:3cb8
> [   23.083131] EDAC sbridge: Seeking for: PCI ID 8086:3cf4
> [   23.083146] EDAC sbridge: Seeking for: PCI ID 8086:3cf4
> [   23.083159] EDAC sbridge: Seeking for: PCI ID 8086:3cf4
> [   23.083167] EDAC sbridge: Seeking for: PCI ID 8086:3cf6
> [   23.083182] EDAC sbridge: Seeking for: PCI ID 8086:3cf6
> [   23.083195] EDAC sbridge: Seeking for: PCI ID 8086:3cf6
> [   23.083203] EDAC sbridge: Seeking for: PCI ID 8086:3cf5
> [   23.083219] EDAC sbridge: Seeking for: PCI ID 8086:3cf5
> [   23.083232] EDAC sbridge: Seeking for: PCI ID 8086:3cf5
> [   23.083702] EDAC MC0: Giving out device to module sb_edac controller Sandy Bridge SrcID#0_Ha#0: DEV 0000:3f:0e.0 (INTERRUPT)
> [   23.084104] EDAC MC1: Giving out device to module sb_edac controller Sandy Bridge SrcID#1_Ha#0: DEV 0000:7f:0e.0 (INTERRUPT)
> [   23.084106] EDAC sbridge:  Ver: 1.1.2 
> [   23.320769] intel_rapl_common: Found RAPL domain package
> [   23.320771] intel_rapl_common: Found RAPL domain core
> [   23.320774] intel_rapl_common: Found RAPL domain dram
> [   23.320781] intel_rapl_common: RAPL package-0 domain package locked by BIOS
> [   23.321075] intel_rapl_common: Found RAPL domain package
> [   23.321076] intel_rapl_common: Found RAPL domain core
> [   23.321079] intel_rapl_common: Found RAPL domain dram
> [   23.321082] intel_rapl_common: RAPL package-1 domain package locked by BIOS
> [   23.541276] snd_hda_intel 0000:00:1b.0: enabling device (0100 -> 0102)
> [   23.541963] snd_hda_intel 0000:05:00.1: Disabling MSI
> [   23.541978] snd_hda_intel 0000:05:00.1: Handle vga_switcheroo audio client
> [   23.630702] snd_hda_codec_realtek hdaudioC0D0: ALC262: SKU not ready 0x411111f0
> [   23.631079] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC262: line_outs=1 (0x15/0x0/0x0/0x0/0x0) type:line
> [   23.631080] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=1 (0x16/0x0/0x0/0x0/0x0)
> [   23.631082] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [   23.631082] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
> [   23.631083] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> [   23.631085] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
> [   23.631086] snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
> [   23.631087] snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
> [   23.643683] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> [   23.643808] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> [   23.643913] input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input12
> [   23.644034] input: HDA Intel PCH Line Out as /devices/pci0000:00/0000:00:1b.0/sound/card0/input13
> [   23.644137] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input14
> [   23.652707] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.0/0000:05:00.1/sound/card1/input9
> [   23.652825] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.0/0000:05:00.1/sound/card1/input15
> [   23.652946] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.0/0000:05:00.1/sound/card1/input16
> [   23.653013] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.0/0000:05:00.1/sound/card1/input17
> [   24.796589] audit: type=1130 audit(1606381759.868:92): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-udev-settle comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   25.651895] audit: type=1130 audit(1606381760.723:93): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=dmraid-activation comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   25.651903] audit: type=1131 audit(1606381760.723:94): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=dmraid-activation comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   25.766126] audit: type=1130 audit(1606381760.837:95): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   26.148660] audit: type=1130 audit(1606381761.220:96): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-fsck@dev-mapper-fedora_111\x2d\x2da77c\x2d\x2d01\x2dhome comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   26.284224] audit: type=1130 audit(1606381761.356:97): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-fsck@dev-disk-by\x2duuid-EDD1\x2d873C comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   26.402100] EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts: (null)
> [   26.544175] audit: type=1130 audit(1606381761.615:98): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-fsck@dev-disk-by\x2duuid-60e33e7b\x2de3d7\x2d45d3\x2dbc6f\x2dd9c7ba95add9 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   26.650055] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
> [   26.904362] audit: type=1130 audit(1606381761.976:99): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=dracut-shutdown comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> [   27.660429] RPC: Registered named UNIX socket transport module.
> [   27.660430] RPC: Registered udp transport module.
> [   27.660431] RPC: Registered tcp transport module.
> [   27.660431] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [   28.563918] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564040] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564118] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564243] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564404] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564478] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564550] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564593] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564679] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   28.564760] msr: Write to unrecognized MSR 0x17f by mcelog
>                Please report to x86@kernel.org
> [   53.691925] e1000e 0000:01:00.0 enp1s0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
> [   53.692277] IPv6: ADDRCONF(NETDEV_CHANGE): enp1s0: link becomes ready
> [   60.951176] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
> [   60.974265] tun: Universal TUN/TAP device driver, 1.6
> [   60.975809] virbr0: port 1(virbr0-nic) entered blocking state
> [   60.975819] virbr0: port 1(virbr0-nic) entered disabled state
> [   60.975947] device virbr0-nic entered promiscuous mode
> [   62.148199] virbr0: port 1(virbr0-nic) entered blocking state
> [   62.148205] virbr0: port 1(virbr0-nic) entered listening state
> [   62.345876] virbr0: port 1(virbr0-nic) entered disabled state
> [   77.399489] rfkill: input handler disabled
> [  137.277457] rfkill: input handler enabled
> [  143.869888] rfkill: input handler disabled
> [ 8543.839298] nf_conntrack: default automatic helper assignment has been turned off for security reasons and CT-based  firewall rule not found. Use the iptables CT target to attach helpers instead.
> [14314.955644] usb 1-1.3: new high-speed USB device number 3 using ehci-pci
> [14317.422736] usb 1-1.3: New USB device found, idVendor=048d, idProduct=1176, bcdDevice= 1.00
> [14317.422740] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [14317.422742] usb 1-1.3: Product: USB Mass Storage Device
> [14317.422745] usb 1-1.3: Manufacturer: Generic
> [14317.469736] usb-storage 1-1.3:1.0: USB Mass Storage device detected
> [14317.470350] scsi host10: usb-storage 1-1.3:1.0
> [14317.470468] usbcore: registered new interface driver usb-storage
> [14317.474395] usbcore: registered new interface driver uas
> [14318.509245] scsi 10:0:0:0: Direct-Access     Generic  USB Flash Disk   0.00 PQ: 0 ANSI: 6
> [14318.510112] sd 10:0:0:0: Attached scsi generic sg2 type 0
> [14318.511218] sd 10:0:0:0: [sdb] 7866368 512-byte logical blocks: (4.03 GB/3.75 GiB)
> [14318.512242] sd 10:0:0:0: [sdb] Write Protect is off
> [14318.512245] sd 10:0:0:0: [sdb] Mode Sense: 23 00 00 00
> [14318.513140] sd 10:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [14318.538438]  sdb: sdb1
> [14318.567721] sd 10:0:0:0: [sdb] Attached SCSI removable disk
> [14740.026438] sdb: detected capacity change from 4027580416 to 0
> [14742.450369] usb 1-1.3: USB disconnect, device number 3
> [17129.173458] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17131.176617] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17133.180108] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17135.183681] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17137.195942] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17139.199367] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17141.202520] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17143.205711] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17145.218811] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17147.804375] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17149.807326] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17151.810509] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17153.823238] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17156.675706] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17158.679813] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17160.684907] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17162.702845] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17164.719714] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17167.387534] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17169.396251] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17171.405342] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17176.379214] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17178.515309] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17180.585299] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17182.634142] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17184.667422] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17186.688186] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17188.712380] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17190.735226] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17192.761116] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17194.792991] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17196.796232] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17198.830449] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17200.853382] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17202.866480] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17204.883632] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17206.911377] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17208.941002] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17210.953682] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17212.957474] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17215.570160] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17217.571565] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17219.573488] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17221.574754] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17223.575350] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17225.579461] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17227.587544] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17229.604889] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17231.621423] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17233.627241] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17236.371615] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17238.374868] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17240.377734] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17242.425395] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17244.432754] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17246.450518] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17248.485881] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17251.518948] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17254.538716] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17257.539481] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17259.542973] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17261.550632] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17263.613634] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17266.631974] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17269.666047] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17272.686136] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17275.720884] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17278.742044] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17281.775345] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17284.678546] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17286.686256] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17288.699110] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17290.849070] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17293.869447] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17296.903565] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17299.903611] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17301.907280] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17303.914945] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17305.962612] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17308.997593] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17312.015864] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17315.051090] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17318.069803] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17321.106148] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17324.124482] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17327.160701] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17330.180175] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17333.214565] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17336.215279] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17338.218826] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17340.222245] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17342.251193] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17344.258400] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17346.277532] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17348.296437] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17351.310838] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17353.318497] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17355.333148] nouveau 0000:05:00.0: DRM: base-0: timeout
> [17357.384533] ------------[ cut here ]------------
> [17357.384583] WARNING: CPU: 30 PID: 6457 at drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1bd/0x210 [nouveau]
> [17357.384584] Modules linked in: uas usb_storage uinput xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp tun bridge stp llc nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter sunrpc vfat fat snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_hda_codec mei_hdcp snd_hda_core intel_rapl_msr snd_hwdep intel_rapl_common snd_seq snd_seq_device snd_pcm sb_edac x86_pkg_temp_thermal intel_powerclamp iTCO_wdt coretemp kvm_intel mei_wdt kvm intel_pmc_bxt snd_timer irqbypass iTCO_vendor_suppo
 rt snd rapl
> [17357.384604]  hp_wmi sparse_keymap intel_cstate rfkill soundcore lpc_ich mei_me mei intel_uncore wmi_bmof i2c_i801 pcspkr i2c_smbus ip_tables nouveau video mxm_wmi i2c_algo_bit drm_kms_helper cec ttm crct10dif_pclmul crc32_pclmul crc32c_intel mpt3sas isci drm ghash_clmulni_intel firewire_ohci firewire_core e1000e serio_raw libsas crc_itu_t raid_class ata_generic scsi_transport_sas pata_acpi wmi fuse
> [17357.384619] CPU: 30 PID: 6457 Comm: kworker/u66:2 Tainted: G S                5.9.10-100.fc32.x86_64 #1
> [17357.384619] Hardware name: Hewlett-Packard HP Z820 Workstation/158B, BIOS J63 v01.14 07/17/2012
> [17357.384649] Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
> [17357.384677] RIP: 0010:nv50_dmac_wait+0x1bd/0x210 [nouveau]
> [17357.384679] Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 28 fd ff ff e9 8a fe ff ff <0f> 0b 48 83 c4 28 b8 92 ff ff ff 5b 5d 41 5c 41 5d 41 5e c3 49 8b
> [17357.384680] RSP: 0018:ffffa6c690afbd70 EFLAGS: 00010282
> [17357.384681] RAX: ffffffffffffff92 RBX: 000000000000000d RCX: 0000000000000000
> [17357.384681] RDX: ffffffffffffff92 RSI: ffffa6c690afbcb8 RDI: ffffa6c690afbd58
> [17357.384682] RBP: ffffa6c690afbd70 R08: 0000000000000000 R09: ffffa6c690afbc88
> [17357.384682] R10: 0000000000000030 R11: 00000000000010d0 R12: 00000000fffffffb
> [17357.384683] R13: ffff977b4bdbeb68 R14: ffff977b4bdbeba8 R15: 0000000000000000
> [17357.384684] FS:  0000000000000000(0000) GS:ffff977b57d80000(0000) knlGS:0000000000000000
> [17357.384685] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [17357.384686] CR2: 00007f53c6211000 CR3: 0000000190a0e006 CR4: 00000000000606e0
> [17357.384687] Call Trace:
> [17357.384718]  base827c_image_set+0x2f/0x1d0 [nouveau]
> [17357.384745]  nv50_wndw_flush_set+0x89/0x1c0 [nouveau]
> [17357.384771]  nv50_disp_atomic_commit_tail+0x4cd/0x790 [nouveau]
> [17357.384777]  ? __switch_to+0x7f/0x470
> [17357.384781]  process_one_work+0x1b4/0x370
> [17357.384783]  worker_thread+0x53/0x3e0
> [17357.384785]  ? process_one_work+0x370/0x370
> [17357.384786]  kthread+0x11b/0x140
> [17357.384788]  ? __kthread_bind_mask+0x60/0x60
> [17357.384792]  ret_from_fork+0x22/0x30
> [17357.384794] ---[ end trace e541bd9c23b8e8ec ]---
> 


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
