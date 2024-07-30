Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104A9422CF
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2024 00:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8A510E35A;
	Tue, 30 Jul 2024 22:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xxdL98+v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52F10E59A
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jul 2024 22:25:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE2F9CE10CA;
 Tue, 30 Jul 2024 22:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F5C4AF0B;
 Tue, 30 Jul 2024 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1722378326;
 bh=CAXc59kovpfAyb1WoSdQ1pSUWTz66MK9TMoxGDU1Pfc=;
 h=Date:To:From:Subject:From;
 b=xxdL98+v3c+LcXnEdSp8lSYKVMYkEwqd6ZlT10/pu6+N2VPgTHXQg428EZbLtU/nu
 g9yipl/Pgr+YlqJuthqQgZuNTkhwLZlMfHgyU3FWjxuKkPeqxjryCI6eek4lasa1OE
 o70Mp7lWQ8M98RYARv7zHuMvfGw2WMlUgD1Ydklc=
Date: Tue, 30 Jul 2024 15:25:25 -0700
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
Subject: + locking-ww_mutex-test-add-module_description.patch added to
 mm-nonmm-unstable branch
Message-Id: <20240730222526.317F5C4AF0B@smtp.kernel.org>
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


The patch titled
     Subject: locking/ww_mutex/test: add MODULE_DESCRIPTION()
has been added to the -mm mm-nonmm-unstable branch.  Its filename is
     locking-ww_mutex-test-add-module_description.patch

This patch will shortly appear at
     https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/locking-ww_mutex-test-add-module_description.patch

This patch will later appear in the mm-nonmm-unstable branch at
    git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next via the mm-everything
branch at git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
and is updated there every 2-3 working days

------------------------------------------------------
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: locking/ww_mutex/test: add MODULE_DESCRIPTION()
Date: Tue, 30 Jul 2024 07:43:22 -0700

Fix the 'make W=1' warning:
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o

Link: https://lkml.kernel.org/r/20240730-module_description_orphans-v1-5-7094088076c8@quicinc.com
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Waiman Long <longman@redhat.com>
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 kernel/locking/test-ww_mutex.c |    1 +
 1 file changed, 1 insertion(+)

--- a/kernel/locking/test-ww_mutex.c~locking-ww_mutex-test-add-module_description
+++ a/kernel/locking/test-ww_mutex.c
@@ -697,3 +697,4 @@ module_exit(test_ww_mutex_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("API test facility for ww_mutexes");
_

Patches currently in -mm which might be from quic_jjohnson@quicinc.com are

lib-test_objpool-add-missing-module_description-macro.patch
crypto-arm-xor-add-missing-module_description-macro.patch
x86-mm-add-testmmiotrace-module_description.patch
cpufreq-powerpc-add-missing-module_description-macros.patch
fsi-add-missing-module_description-macros.patch
locking-ww_mutex-test-add-module_description.patch

