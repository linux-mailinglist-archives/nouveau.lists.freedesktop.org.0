Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA8153CDD
	for <lists+nouveau@lfdr.de>; Thu,  6 Feb 2020 03:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8486E291;
	Thu,  6 Feb 2020 02:05:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1733 seconds by postgrey-1.36 at gabe;
 Wed, 05 Feb 2020 15:03:32 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C46F5FD
 for <nouveau@lists.freedesktop.org>; Wed,  5 Feb 2020 15:03:32 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1izLlB-0003IJ-Ob; Wed, 05 Feb 2020 15:34:33 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Date: Wed,  5 Feb 2020 15:34:26 +0100
Message-Id: <20200205143426.2592512-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 02:05:25 +0000
Subject: [Nouveau] [PATCH] x86/mm/kmmio: Use this_cpu_ptr() instead
 get_cpu_var() for kmmio_ctx
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Both call sites, that access kmmio_ctx, access kmmio_ctx with interrupts
disabled. There is no need to use get_cpu_var() which additionally
disables preemption.

Use this_cpu_ptr() to access the kmmio_ctx variable of the current CPU.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/mm/kmmio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 49d7814b59a9b..9994353fb75de 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -260,7 +260,7 @@ int kmmio_handler(struct pt_regs *regs, unsigned long addr)
 		goto no_kmmio;
 	}
 
-	ctx = &get_cpu_var(kmmio_ctx);
+	ctx = this_cpu_ptr(&kmmio_ctx);
 	if (ctx->active) {
 		if (page_base == ctx->addr) {
 			/*
@@ -285,7 +285,7 @@ int kmmio_handler(struct pt_regs *regs, unsigned long addr)
 			pr_emerg("previous hit was at 0x%08lx.\n", ctx->addr);
 			disarm_kmmio_fault_page(faultpage);
 		}
-		goto no_kmmio_ctx;
+		goto no_kmmio;
 	}
 	ctx->active++;
 
@@ -314,11 +314,8 @@ int kmmio_handler(struct pt_regs *regs, unsigned long addr)
 	 * the user should drop to single cpu before tracing.
 	 */
 
-	put_cpu_var(kmmio_ctx);
 	return 1; /* fault handled */
 
-no_kmmio_ctx:
-	put_cpu_var(kmmio_ctx);
 no_kmmio:
 	rcu_read_unlock();
 	preempt_enable_no_resched();
@@ -333,7 +330,7 @@ int kmmio_handler(struct pt_regs *regs, unsigned long addr)
 static int post_kmmio_handler(unsigned long condition, struct pt_regs *regs)
 {
 	int ret = 0;
-	struct kmmio_context *ctx = &get_cpu_var(kmmio_ctx);
+	struct kmmio_context *ctx = this_cpu_ptr(&kmmio_ctx);
 
 	if (!ctx->active) {
 		/*
@@ -371,7 +368,6 @@ static int post_kmmio_handler(unsigned long condition, struct pt_regs *regs)
 	if (!(regs->flags & X86_EFLAGS_TF))
 		ret = 1;
 out:
-	put_cpu_var(kmmio_ctx);
 	return ret;
 }
 
-- 
2.25.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
