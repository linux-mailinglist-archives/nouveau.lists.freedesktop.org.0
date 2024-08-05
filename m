Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D379473BD
	for <lists+nouveau@lfdr.de>; Mon,  5 Aug 2024 05:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0669510E104;
	Mon,  5 Aug 2024 03:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W/NVVsoM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310C210E104
 for <nouveau@lists.freedesktop.org>; Mon,  5 Aug 2024 03:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9B33ACE0959;
 Mon,  5 Aug 2024 03:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7211C32786;
 Mon,  5 Aug 2024 03:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1722827576;
 bh=fL6kVrZuUpokxNIXzA+h4iqOL8yD1MEsRZCH+ntcBkw=;
 h=Date:To:From:Subject:From;
 b=W/NVVsoMWgGs/Y4cS6GGqhBNLnlDgL6hcgSy5LUTRM8CB/KRcFfXW7e+WllZMxATR
 DJR6pAhBGCI6lEs638aeOIwvomKzsNj7k2YAva5tZ0w21769r8gq8Csrov1CrVVgx/
 5Hzh5bLAGN/4E0j1WL0jbUUMcbwiqcU6o2Q9d9dc=
Date: Sun, 04 Aug 2024 20:12:56 -0700
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
Subject: [merged] cpufreq-powerpc-add-missing-module_description-macros.patch
 removed from -mm tree
Message-Id: <20240805031256.C7211C32786@smtp.kernel.org>
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
     Subject: cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
has been removed from the -mm tree.  Its filename was
     cpufreq-powerpc-add-missing-module_description-macros.patch

This patch was dropped because it was merged into mainline or a subsystem tree

------------------------------------------------------
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
Date: Tue, 30 Jul 2024 07:43:20 -0700

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all files
which have a MODULE_LICENSE().

This includes three additional files which, although they did not produce
a warning with the powerpc allmodconfig configuration, may cause this
warning with specific options enabled in the kernel configuration.

Link: https://lkml.kernel.org/r/20240730-module_description_orphans-v1-3-7094088076c8@quicinc.com
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nouveau <nouveau@lists.freedesktop.org>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Steven Rostedt (Google) <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Waiman Long <longman@redhat.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/cpufreq/maple-cpufreq.c   |    1 +
 drivers/cpufreq/pasemi-cpufreq.c  |    1 +
 drivers/cpufreq/pmac64-cpufreq.c  |    1 +
 drivers/cpufreq/powernv-cpufreq.c |    1 +
 drivers/cpufreq/ppc_cbe_cpufreq.c |    1 +
 5 files changed, 5 insertions(+)

--- a/drivers/cpufreq/maple-cpufreq.c~cpufreq-powerpc-add-missing-module_description-macros
+++ a/drivers/cpufreq/maple-cpufreq.c
@@ -238,4 +238,5 @@ bail_noprops:
 module_init(maple_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for Maple 970FX/970MP boards");
 MODULE_LICENSE("GPL");
--- a/drivers/cpufreq/pasemi-cpufreq.c~cpufreq-powerpc-add-missing-module_description-macros
+++ a/drivers/cpufreq/pasemi-cpufreq.c
@@ -269,5 +269,6 @@ static void __exit pas_cpufreq_exit(void
 module_init(pas_cpufreq_init);
 module_exit(pas_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for PA Semi PWRficient");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Egor Martovetsky <egor@pasemi.com>, Olof Johansson <olof@lixom.net>");
--- a/drivers/cpufreq/pmac64-cpufreq.c~cpufreq-powerpc-add-missing-module_description-macros
+++ a/drivers/cpufreq/pmac64-cpufreq.c
@@ -671,4 +671,5 @@ static int __init g5_cpufreq_init(void)
 module_init(g5_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for SMU & 970FX based G5 Macs");
 MODULE_LICENSE("GPL");
--- a/drivers/cpufreq/powernv-cpufreq.c~cpufreq-powerpc-add-missing-module_description-macros
+++ a/drivers/cpufreq/powernv-cpufreq.c
@@ -1160,5 +1160,6 @@ static void __exit powernv_cpufreq_exit(
 }
 module_exit(powernv_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for IBM/OpenPOWER powernv systems");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vaidyanathan Srinivasan <svaidy at linux.vnet.ibm.com>");
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c~cpufreq-powerpc-add-missing-module_description-macros
+++ a/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -168,5 +168,6 @@ static void __exit cbe_cpufreq_exit(void
 module_init(cbe_cpufreq_init);
 module_exit(cbe_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for Cell BE processors");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
_

Patches currently in -mm which might be from quic_jjohnson@quicinc.com are

lib-test_objpool-add-missing-module_description-macro.patch
crypto-arm-xor-add-missing-module_description-macro.patch
x86-mm-add-testmmiotrace-module_description.patch
locking-ww_mutex-test-add-module_description.patch

