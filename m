Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A498CBAF1C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A68E10EC55;
	Sat, 13 Dec 2025 12:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltswyZap";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997610E1A9
 for <nouveau@lists.freedesktop.org>; Tue, 18 Mar 2025 18:23:48 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-549b159c84cso5890644e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 18 Mar 2025 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742322227; x=1742927027; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pFKYBJkHqX0hzbT4PFFc5FvHM64HyiGYTbKxeJ0wjJ8=;
 b=ltswyZapTx7iS8HerCPfyBIv1AYkRkHs7X98jMWMyCEk1dPh8WsINOVzNYYGdtOgEx
 Lm241gvCfOu3u7E2y3vrbm5YooA+o3On81jFnH+EIiWzxnjDPJeGJwBebhxtKVwUZRVZ
 PdJCKo0LG5LqEadPpfsQ9gEGRQQhoe4y1fqVaAHti3pkYtyB9TpxXMf7yxM9t08CDSRu
 KigHYridvhsGJegb2BeqK5jGFj+DRTBUawqY8qHsiELSc4fffKLSrEqKWL0K9VpoiieW
 0nSOUQirB+6S93Xa7G8LT8ZJ4cqUtLaYXPjxZHjWRrJNO/fowj3Kknn1+zE0DZ90Jk/h
 zDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742322227; x=1742927027;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFKYBJkHqX0hzbT4PFFc5FvHM64HyiGYTbKxeJ0wjJ8=;
 b=NM1u7Y7GcGYMuC9cqtqacf8vpLXgcrtTtlzC/GIVPIUco6nK0U8jW8x38AxqSy17Wr
 FbZLEf01AzUSPdfIbt2WyBST0j1mejss/afgskSEFcOKCh/3qkbJtLanE51zgaW7G3q3
 Gd0w3JZQcTEg7SD3YpO3SReJDj+2JAo4M4K6Vqv+0lnONVxSBjEPG0yCT0STbycM/8PC
 WGXqZOLbRpt0Rc3GA4YvZpnygW9yBgsCUvY91jus0UXQ7Pkkw5Nw96mWWCKxAYNsoMde
 t5jJEusurg8Cyon0cF9GYs8MLU1Y5Z9V0D2RtA+eCOA5+53US3jET6HQiT563qulRm6C
 wa3g==
X-Gm-Message-State: AOJu0Yx/b4GYPWdjEV78C7fUInOSBOWBr1SX9LXXFpC/O8WR3b+O7RO4
 pj1Up0PLqI/nAgZFI1WnYC21QabdkDAuB/m3CPcQCcH68xmm9PhGgdC+CEEUfJjhakiG1G4QMrm
 KU6UN/NrsFQ24tUZEJjBN4ukQ8A==
X-Gm-Gg: ASbGncvPj0fhAQlAT+M24j8/boD2B2ekwkC+XihbQC2xI+kp99MvjntjsTnvcM0AyLx
 wu1VAN5LTsF00BablV4T1in9ChxFl9J1jSoM3F5/5fGxjGpIvX9bdz/2hB+MVYXHvTGD/BCzxxO
 qTMqrKdCtp0JFVKw49Ej2Jqf5pVfnsD0ap3Rmv1g==
X-Google-Smtp-Source: AGHT+IFN4VJtOVCiYfy6bKBUtdI9o9AX9cjJI17v/ZeplxH++yLd8iXtCcPFYOjXISvJLgWyyW3KyOs1cz1vojgB3zg=
X-Received: by 2002:a05:6512:e9c:b0:549:7354:e4d1 with SMTP id
 2adb3069b0e04-54ac9cb591fmr44541e87.38.1742322226520; Tue, 18 Mar 2025
 11:23:46 -0700 (PDT)
MIME-Version: 1.0
From: Naveen Kumar P <naveenkumar.parna@gmail.com>
Date: Tue, 18 Mar 2025 23:53:34 +0530
X-Gm-Features: AQ5f1JoazGVw-lIjZ1PX_D9zioJEAGaKuRn-Prk2rQrfjHadNi3e9Q-_2xKGMCM
Message-ID: <CAMciSVXGcF=mT0UgU8cNTLiDTUovOYSL=cX95b9Wr1u3UwWNWQ@mail.gmail.com>
Subject: Debugging PCIe Configuration Space Using mmiotrace
To: rostedt@goodmis.org, mhiramat@kernel.org, karolherbst@gmail.com, 
 ppaalanen@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org, 
 Peter Zijlstra <peterz@infradead.org>
Cc: nouveau@lists.freedesktop.org, 
 Naveen Kumar P <naveenkumar.parna@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Hi all,

I am currently debugging an issue on an x86 machine running the latest
Linux kernel, involving a PCIe device whose memory is mapped via BAR0.
I am encountering unexpected behavior when reading its PCI
configuration space using lspci, and I am seeking guidance on whether
mmiotrace can help diagnose the problem.

Issue Summary:
Expected Behavior After Boot:
lspci -xxx -s 01:00.0 correctly displays valid PCI configuration space
values, including a properly mapped BAR0.

$ sudo lspci -xxx -s 01:00.0 | grep "10:"
10: 00 00 40 b0 00 00 00 00 00 00 00 00 00 00 00 00


Unexpected Behavior After Uptime:
After a few days, reading the PCI configuration space (lspci -xxx -s
01:00.0) sometimes returns all 0xffs for the entire config space.
dmesg does not log any relevant errors.

$ sudo lspci -xxx -s 01:00.0
01:00.0 RAM memory: PLDA Device 5555 (rev ff)
00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff


After Subsequent Reads:
Re-running lspci -xxx -s 01:00.0 restores non-0xff values, but BAR0
gets reset to zero.

$ sudo lspci -xxx -s 01:00.0
01:00.0 RAM memory: PLDA Device 5555
00: 56 15 55 55 00 00 10 00 00 00 00 05 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 00 00
40: 01 48 03 00 08 00 00 00 05 60 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 10 00 02 00 c2 8f 00 00 10 28 01 00 21 f4 03 00
70: 00 00 21 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00
90: 20 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

This suggests that some function or driver is resetting BAR0 during or
after a failed config space read.


mmiotrace Setup & Results:
I have enabled mmiotrace and verified it is active:
# cat /sys/kernel/tracing/available_tracers
hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop

# cat current_tracer
mmiotrace

However, trace_pipe and trace logs remain empty even after reproducing
the issue:

# cat trace_pipe
VERSION 20070824
PCIDEV 0000 80860f00 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 iosf_mbi_pci
PCIDEV 0010 80860f31 61 b0000000 0 a0000008 0 e081 0 c0002 400000 0
10000000 0 8 0 20000 i915
PCIDEV 0098 80860f23 5b e071 e061 e051 e041 e021 b0b17000 0 8 4 8 4 20
800 0 ahci
PCIDEV 00a0 80860f35 5a b0b00004 0 0 0 0 0 0 10000 0 0 0 0 0 0 xhci_hcd
PCIDEV 00b8 80860f50 17 b0b16000 b0b15000 0 0 0 0 0 1000 1000 0 0 0 0
0 sdhci-pci
PCIDEV 00d0 80860f18 62 b0900000 b0800000 0 0 0 0 0 100000 100000 0 0
0 0 0 mei_txe
PCIDEV 00d8 80860f04 16 b0b10004 0 0 0 0 0 0 4000 0 0 0 0 0 0 snd_hda_intel
PCIDEV 00e0 80860f48 57 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
PCIDEV 00e2 80860f4c 58 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
PCIDEV 00e3 80860f4e 59 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
PCIDEV 00f8 80860f1c 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 lpc_ich
PCIDEV 00fb 80860f12 12 b0b14000 0 0 0 e001 0 0 20 0 0 0 20 0 0 i801_smbus
PCIDEV 0100 15565555 b b0400000 0 0 0 0 0 0 400000 0 0 0 0 0 0
PCIDEV 0300 80861533 13 b0a00000 0 d001 b0a80000 0 0 0 80000 0 20 4000 0 0 0 igb

cat trace
# tracer: mmiotrace
#
# entries-in-buffer/entries-written: 0/0   #P:1
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |


Request for Assistance:
Can mmiotrace help determine the root cause of why reading the PCI
configuration space results in all 0xffs?

Is there a way to determine what function or driver is clearing BAR0
when the values are restored?

If mmiotrace is suitable for this, how can I properly capture the
relevant trace data to analyze this issue?

Any insights or suggestions would be greatly appreciated. Please let
me know if you
need more details.

Best regards,
Naveen
