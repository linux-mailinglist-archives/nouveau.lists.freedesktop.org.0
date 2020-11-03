Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025F62A5C4B
	for <lists+nouveau@lfdr.de>; Wed,  4 Nov 2020 02:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11FD6F3A1;
	Wed,  4 Nov 2020 01:51:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FD26EC7C;
 Tue,  3 Nov 2020 10:43:33 +0000 (UTC)
Message-Id: <20201103095857.681196473@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=9zfWJBESkC89ZM3wXi9RpcYi0kqs7Y++H87KJDM1PsA=;
 b=FM+6iGu/X6o10mq/FtDQCiRN7zTRF3r0s7Ss+igapV9ttM5H7pYB9Wje8MGF3i4YSPxAhK
 25KKcscHcfgXak4e88H/ht4KlbCfLV+0zHOakSsxZy5/qBn7n2qUPGEJXY392Q1xlELmJo
 NblwLDaZEYb14PR5t1vVPqhWlETKeRLogBWSuEdl+nicahgGjme8XOjFq5RonDKoVE8y3N
 wzDbheHIZNB47+lThJbtB6qAeeRtyiUKkaoGgv+wOchAPMwUg1W4ue/fJgRLfbfX4eu5kI
 HEdlHJNf7HxB2vsO8pVfZinxI+Fmi8cfatioLdXGdXxAnzKppg7jyhwAaFAASA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=9zfWJBESkC89ZM3wXi9RpcYi0kqs7Y++H87KJDM1PsA=;
 b=QWVzJVj2VvqtXcIZwtvJwhwpHQqxRIV9wytN6gScTp4DI1FqFOrSCxUaik507DE6SqoDSo
 C5jxssGHP4ej70Cg==
Date: Tue, 03 Nov 2020 10:27:23 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 01:51:10 +0000
Subject: [Nouveau] [patch V3 11/37] csky/mm/highmem: Switch to generic kmap
 atomic
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

No reason having the same code in every architecture.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-csky@vger.kernel.org
---
V3: Does not compile with gcc 10
---
 arch/csky/Kconfig               |    1 
 arch/csky/include/asm/fixmap.h  |    4 +-
 arch/csky/include/asm/highmem.h |    6 ++-
 arch/csky/mm/highmem.c          |   75 ----------------------------------------
 4 files changed, 8 insertions(+), 78 deletions(-)

--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -286,6 +286,7 @@ config NR_CPUS
 config HIGHMEM
 	bool "High Memory Support"
 	depends on !CPU_CK610
+	select KMAP_LOCAL
 	default y
 
 config FORCE_MAX_ZONEORDER
--- a/arch/csky/include/asm/fixmap.h
+++ b/arch/csky/include/asm/fixmap.h
@@ -8,7 +8,7 @@
 #include <asm/memory.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_types.h>
+#include <asm/kmap_size.h>
 #endif
 
 enum fixed_addresses {
@@ -17,7 +17,7 @@ enum fixed_addresses {
 #endif
 #ifdef CONFIG_HIGHMEM
 	FIX_KMAP_BEGIN,
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_TYPE_NR * NR_CPUS) - 1,
+	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
 #endif
 	__end_of_fixed_addresses
 };
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -9,7 +9,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/uaccess.h>
-#include <asm/kmap_types.h>
+#include <asm/kmap_size.h>
 #include <asm/cache.h>
 
 /* undef for production */
@@ -32,10 +32,12 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic_pfn(unsigned long pfn);
 
 #define flush_cache_kmaps() do {} while (0)
 
+#define arch_kmap_local_post_map(vaddr, pteval)	kmap_flush_tlb(vaddr)
+#define arch_kmap_local_post_unmap(vaddr)	kmap_flush_tlb(vaddr)
+
 extern void kmap_init(void);
 
 #endif /* __KERNEL__ */
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -9,8 +9,6 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 
-static pte_t *kmap_pte;
-
 unsigned long highstart_pfn, highend_pfn;
 
 void kmap_flush_tlb(unsigned long addr)
@@ -19,67 +17,7 @@ void kmap_flush_tlb(unsigned long addr)
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
 
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte - idx)));
-#endif
-	set_pte(kmap_pte-idx, mk_pte(page, prot));
-	flush_tlb_one((unsigned long)vaddr);
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int idx;
-
-	if (vaddr < FIXADDR_START)
-		return;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	idx = KM_TYPE_NR*smp_processor_id() + kmap_atomic_idx();
-
-	BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-
-	pte_clear(&init_mm, vaddr, kmap_pte - idx);
-	flush_tlb_one(vaddr);
-#else
-	(void) idx; /* to kill a warning */
-#endif
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
-
-/*
- * This is the same as kmap_atomic() but can map memory that doesn't
- * have a struct page associated with it.
- */
-void *kmap_atomic_pfn(unsigned long pfn)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	pagefault_disable();
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
-	flush_tlb_one(vaddr);
-
-	return (void *) vaddr;
-}
-
-static void __init kmap_pages_init(void)
+void __init kmap_init(void)
 {
 	unsigned long vaddr;
 	pgd_t *pgd;
@@ -96,14 +34,3 @@ static void __init kmap_pages_init(void)
 	pte = pte_offset_kernel(pmd, vaddr);
 	pkmap_page_table = pte;
 }
-
-void __init kmap_init(void)
-{
-	unsigned long vaddr;
-
-	kmap_pages_init();
-
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN);
-
-	kmap_pte = pte_offset_kernel((pmd_t *)pgd_offset_k(vaddr), vaddr);
-}

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
