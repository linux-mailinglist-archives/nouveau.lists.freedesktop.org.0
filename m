Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED692A5C64
	for <lists+nouveau@lfdr.de>; Wed,  4 Nov 2020 02:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8CC6F3D6;
	Wed,  4 Nov 2020 01:51:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AEB6EC80;
 Tue,  3 Nov 2020 10:43:33 +0000 (UTC)
Message-Id: <20201103095857.078043987@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ut1GkVw4OXMSCtChDMtmqVv6FlrafPsAPVPH5qh/+W4=;
 b=qxeKab/jnzonAYIBxQj7C+lU1MXIOtv9AUxIqLZgMNOheS1/C1ppYtMhiRGWGILT0p9BRX
 pgQSNcMXtj2Uc5P/cIyFA85cG3zt2PWv30XyG8pKoOND+ze18oEqwDagKsMk4iFbkxn6w3
 nHjpZ+/5f9nyGALGAnCDWfSOLvmz6+kVq3EXJm/nem1WmvK7IfNuhg+QYUzzvNXpCI5JCV
 /zpQKKIRbeU1LpPLNe05AoFKzjsDBQG2wAWha8c2KiRVj55HfMkJaQutHQqfH87MuhQYm+
 dvAy7X7H2pEzrttiZjmlLL/Ut6jFrU2e2uklduyXACJvrBvG+GDZzRfAbFAKGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ut1GkVw4OXMSCtChDMtmqVv6FlrafPsAPVPH5qh/+W4=;
 b=sa3bXF2K349r2Sx437G+viH7NII4z1vmSjqFyQiLWboorIUK0oCNgpdHH/H8Y0GgaZiyhO
 PJb8yq1jh8Mfa0Dw==
Date: Tue, 03 Nov 2020 10:27:17 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 01:51:10 +0000
Subject: [Nouveau] [patch V3 05/37] asm-generic: Provide kmap_size.h
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

kmap_types.h is a misnomer because the old atomic MAP based array does not
exist anymore and the whole indirection of architectures including
kmap_types.h is inconinstent and does not allow to provide guard page
debugging for this misfeature.

Add a common header file which defines the mapping stack size for all
architectures. Will be used when converting architectures over to a
generic kmap_local/atomic implementation.

The array size is chosen with the following constraints in mind:

    - The deepest nest level in one context is 3 according to code
      inspection.

    - The worst case nesting for the upcoming reemptible version would be:

      2 maps in task context and a fault inside
      2 maps in the fault handler
      3 maps in softirq
      2 maps in interrupt

So a total of 16 is sufficient and probably overestimated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 include/asm-generic/Kbuild      |    1 +
 include/asm-generic/kmap_size.h |   12 ++++++++++++
 2 files changed, 13 insertions(+)

--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -31,6 +31,7 @@ mandatory-y += irq_regs.h
 mandatory-y += irq_work.h
 mandatory-y += kdebug.h
 mandatory-y += kmap_types.h
+mandatory-y += kmap_size.h
 mandatory-y += kprobes.h
 mandatory-y += linkage.h
 mandatory-y += local.h
--- /dev/null
+++ b/include/asm-generic/kmap_size.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_KMAP_SIZE_H
+#define _ASM_GENERIC_KMAP_SIZE_H
+
+/* For debug this provides guard pages between the maps */
+#ifdef CONFIG_DEBUG_HIGHMEM
+# define KM_MAX_IDX	33
+#else
+# define KM_MAX_IDX	16
+#endif
+
+#endif

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
