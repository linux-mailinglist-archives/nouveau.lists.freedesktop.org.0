Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D812B31C
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928966E37C;
	Fri, 27 Dec 2019 08:14:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Sun, 24 Nov 2019 17:23:13 UTC
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu
 [IPv6:2a01:4f8:c17:3977::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA6A89ECB;
 Sun, 24 Nov 2019 17:23:13 +0000 (UTC)
Received: from neptune (unknown [IPv6:2a06:4944:bfe:5600:f6:5d6d:40bd:1038])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id 6D2B6103DD60B;
 Sun, 24 Nov 2019 18:10:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
 t=1574615409; x=1574701809;
 bh=RSApybNarNfdjvKyMqeTRTfrWvj05nzabYqxCrwHrsI=;
 h=Date:From:To:Cc:Subject;
 b=fEBI1SNpXK41RjDGUeMhM0ZGXjvdJAqBCcwNtCUy9ar1Q2xRBSsVeUC4y7eLcXj18
 egk5xWyFJ1gbNiIACMFC0HgrFKlBn6LGS6uc9R31nlyMPIcjGz9VLC4e/4L74MqwmS
 KmpWTBJ/cN0oyFS9l7plRzcBbM90o2bLsCH8ppms=
Date: Sun, 24 Nov 2019 18:15:03 +0100
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: nouveau@lists.freedesktop.org
Message-ID: <20191124181441.488d3841@neptune>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] nouveau on NV04 calling illegal method 02fc under fbcon
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

Trying a new kernel on old [NV04] system I get tons of 
  nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040
    [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0
    [DRM] subc 3 class 004a mthd 02fc data 00000003
errors when operating on console.

As I updated from 4.3 kernel, a bisect does not feel like the best start.

What is that 02fc method which fbcon is probably triggering as
hardware-acceleration on nouveau side.

Thanks,
Bruno



Below, a grep for nouveau on kernel log:

Nov 24 18:27:27 zeus kernel: Kernel command line: BOOT_IMAGE=5.3.12 ro root=802 slub_debug=FZP nouveau.runpm=1 nouveau.debug=debug console=ttyS0,115200 nouveau.agpmode=0
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: NVIDIA NV04 (20044001)
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: trying PRAMIN...
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b030041) unknown
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: 00000000: type 00, 32768 bytes
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: scored 4
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: trying PROM...
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: 00000000: ROM signature (0000) unknown
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: image 0 invalid
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: scored 0
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: trying ACPI...
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: using image from PRAMIN
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b030041) unknown
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b030041) unknown
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: BMP version 1.1
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: version 02.04.19.00.00
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: DCB table not found
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: i2c: ccb 00: type 00 drive 3f sense 3e share ff auxch cb
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: DCB table not found
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: i2c: ccb 01: type 00 drive 37 sense 36 share ff auxch cb
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: DCB table not found
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: bios: DCB table not found
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: disp: head-0: ctor
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: disp: head-1: ctor
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000080: init running...
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: putting AGP V2 device into 0x mode
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: unknown input clock freq
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: input frequency : 0Hz
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: numerator       : 00000001
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: denominator     : 00000001
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: timer frequency : 0Hz
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: time low        : 87dbe4df
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: tmr: time high       : 00000000
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: fb: 16 MiB SDRAM
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: clk: --:   
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000080: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000080: init completed in 80915us
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:80000009: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:80000009: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:80000009: init completed in 6315us
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:8000000d: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:8000000d: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:8000000d: init completed in 6319us
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000000: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000000: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM-master:00000000:00000000: init completed in 6317us
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000080: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000080: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000080: init completed in 5713us
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:80000009: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:80000009: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:80000009: init completed in 5664us
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:8000000d: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:8000000d: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:8000000d: init completed in 5663us
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: DRM: VRAM: 15 MiB
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: DRM: GART: 64 MiB
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: DRM: BMP version 1.1
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: i2c: bus 0000: probing TV encoders
Nov 24 18:27:27 zeus kernel: nouveau 0000:01:00.0: i2c: bus 0000: no devices found.
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: init children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: init completed in 5751us
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: fini children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: fini running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: fini completed in 5622us
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: destroy children...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: destroy running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: destroy completed in 5892us...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: init running...
Nov 24 18:27:27 zeus kernel: nouveau: DRM:00000000:00000002: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000002: init completed in 5709us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:0000006b: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:0000006b: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:0000006b: init completed in 5665us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000002:0000003d: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000002:0000003d: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000002:0000003d: init completed in 5666us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000003:0000003d: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000003:0000003d: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000003:0000003d: init completed in 5712us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000006e:fffffffc: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init completed in 5710us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000006e:fffffffc: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000006e:fffffffc: init completed in 23391us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:55550000:fffffffc: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:55550000:fffffffc: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:55550000:fffffffc: init completed in 5714us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000006:0000003d: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000006:0000003d: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:80000006:0000003d: init completed in 5665us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000039:00000039: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000000: init completed in 5705us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000039:00000039: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000039:00000039: init completed in 23339us
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: bios: DCB table not found
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000046: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000046: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:00000046: init completed in 5664us
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: DRM: Saving VGA fonts
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:ffffffff: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:ffffffff: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000000:ffffffff: init completed in 5711us
Nov 24 18:27:28 zeus kernel: nouveau: DRM-master:00000000:00000000: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM-master:00000000:00000000: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM-master:00000000:00000000: init completed in 6320us
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:00000080: init running...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:00000080: init children...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:00000080: init completed in 6320us
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:80000009: init running...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:80000009: init children...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:80000009: init completed in 6320us
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:8000000d: init running...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:8000000d: init children...
Nov 24 18:27:28 zeus kernel: nouveau: swapper[1]:00000000:8000000d: init completed in 6317us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000062:00000042: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000062:00000042: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000062:00000042: init completed in 5719us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000019:00000019: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000019:00000019: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000019:00000019: init completed in 5712us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000043:00000043: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000043:00000043: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000043:00000043: init completed in 5667us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000044:00000044: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000044:00000044: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:00000044:00000044: init completed in 5667us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000004a:0000004a: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000004a:0000004a: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000004a:0000004a: init completed in 5712us
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000005f:0000005f: init running...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000005f:0000005f: init children...
Nov 24 18:27:28 zeus kernel: nouveau: DRM:0000005f:0000005f: init completed in 5712us
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 2 class 005f mthd 019c data 000018a6
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 2 class 005f mthd 02fc data 00000003
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 0198 data 000018a6
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 0188 data 000018a9
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 018c data 000018a8
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo (ptrval)
Nov 24 18:27:28 zeus kernel: fbcon: nouveaudrmfb (fb0) is primary device
Nov 24 18:27:28 zeus kernel: nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
Nov 24 18:27:28 zeus kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
Nov 24 18:28:10 zeus kernel: nouveau 0000:01:00.0: gr: intr 00000001 [NOTIFY] nsource 00000040 [ILLEGAL_MTHD] nstatus 00004000 [PROTECTION_FAULT] ch 0 [DRM] subc 3 class 004a mthd 02fc data 00000003
...
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
