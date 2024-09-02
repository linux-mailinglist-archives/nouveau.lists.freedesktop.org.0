Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31762967E41
	for <lists+nouveau@lfdr.de>; Mon,  2 Sep 2024 05:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC6E10E1EA;
	Mon,  2 Sep 2024 03:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GIDMeB3O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7835910E1E8
 for <nouveau@lists.freedesktop.org>; Mon,  2 Sep 2024 03:46:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F9D5A41651;
 Mon,  2 Sep 2024 03:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42093C4CEC2;
 Mon,  2 Sep 2024 03:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1725248797;
 bh=ZkeoSaw2uvuQOvAEyFDtBvl4oxD4SwcBCuYgVgPrQFA=;
 h=Date:To:From:Subject:From;
 b=GIDMeB3OOOsPgDIXZG1nJHZwzYBfvI0bBMmHOUr8tUlH5cl8gG7xDOEC7yQtcYyOA
 rb5UCSON/6g1LJORmPvPBDTcRlwitpCqylBlk9b/IFAa3xxXOnKZg0G5NWGX5uusoH
 C9Twxxpw0FBVD/WY/rFTJ+Pfk/EouzNtlbcvn2H0=
Date: Sun, 01 Sep 2024 20:46:36 -0700
To: mm-commits@vger.kernel.org, will@kernel.org, viresh.kumar@linaro.org,
 tglx@linutronix.de, rostedt@goodmis.org, rafael@kernel.org,
 ppaalanen@gmail.com, peterz@infradead.org, npiggin@gmail.com,
 nouveau@lists.freedesktop.org, naveen@kernel.org, mpe@ellerman.id.au,
 mingo@redhat.com, mhiramat@kernel.org, mcoquelin.stm32@gmail.com,
 luto@kernel.org, longman@redhat.com, linux@armlinux.org.uk,
 karolherbst@gmail.com, joel@jms.id.au, jk@ozlabs.org, hpa@zytor.com,
 gregkh@linuxfoundation.org, eajames@linux.ibm.com, dave.hansen@linux.intel.com,
 christophe.leroy@csgroup.eu, bp@alien8.de, boqun.feng@gmail.com, arnd@arndb.de,
 andrew@codeconstruct.com.au, alistair@popple.id.au,
 alexandre.torgue@foss.st.com, quic_jjohnson@quicinc.com,
 akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Subject: [merged mm-nonmm-stable]
 crypto-arm-xor-add-missing-module_description-macro.patch removed from -mm
 tree
Message-Id: <20240902034637.42093C4CEC2@smtp.kernel.org>
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


The quilt patch titled
     Subject: crypto: arm/xor - add missing MODULE_DESCRIPTION() macro
has been removed from the -mm tree.  Its filename was
     crypto-arm-xor-add-missing-module_description-macro.patch

This patch was dropped because it was merged into the mm-nonmm-stable branch
of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

------------------------------------------------------
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: crypto: arm/xor - add missing MODULE_DESCRIPTION() macro
Date: Tue, 30 Jul 2024 07:43:18 -0700

Patch series "treewide: add missing MODULE_DESCRIPTION() macros".

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1.

Recently, multiple developers have been eradicating these warnings
treewide, and I personally submitted almost 300 patches over the past few
months.  Almost all of my patches landed by 6.11-rc1, either by being
merged in a 6.10-rc or by being merged in the 6.11 merge window.  However,
a few of my patches did not land.


This patch (of 5):

With ARCH=arm and CONFIG_KERNEL_MODE_NEON=y, make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/lib/xor-neon.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Link: https://lkml.kernel.org/r/20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com
Link: https://lkml.kernel.org/r/20240730-module_description_orphans-v1-1-7094088076c8@quicinc.com
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alistar Popple <alistair@popple.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jeremy Kerr <jk@ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Karol Herbst <karolherbst@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nouveau <nouveau@lists.freedesktop.org>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Steven Rostedt (Google) <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/arm/lib/xor-neon.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm/lib/xor-neon.c~crypto-arm-xor-add-missing-module_description-macro
+++ a/arch/arm/lib/xor-neon.c
@@ -8,6 +8,7 @@
 #include <linux/raid/xor.h>
 #include <linux/module.h>
 
+MODULE_DESCRIPTION("NEON accelerated XOR implementation");
 MODULE_LICENSE("GPL");
 
 #ifndef __ARM_NEON__
_

Patches currently in -mm which might be from quic_jjohnson@quicinc.com are


