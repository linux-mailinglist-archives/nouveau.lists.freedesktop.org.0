Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC051B8361
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8C6EB98;
	Sat, 25 Apr 2020 02:52:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9E6E19B
 for <nouveau@lists.freedesktop.org>; Wed, 22 Apr 2020 01:52:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BED61045;
 Tue, 21 Apr 2020 18:52:42 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB6B43F73D;
 Tue, 21 Apr 2020 18:52:35 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Date: Wed, 22 Apr 2020 07:22:06 +0530
Message-Id: <1587520326-10099-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587520326-10099-1-git-send-email-anshuman.khandual@arm.com>
References: <1587520326-10099-1-git-send-email-anshuman.khandual@arm.com>
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: [Nouveau] [PATCH V2 2/2] mm/thp: Rename pmd_mknotpresent() as
 pmd_mkinvalid()
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
Cc: x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, nouveau@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

pmd_present() is expected to test positive after pmdp_mknotpresent() as the
PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
implies that given PMD entry is just invalidated from MMU perspective while
still holding on to pmd_page() referred valid huge page thus also clearing
pmd_present() test. This creates the following situation which is counter
intuitive.

[pmd_present(pmd_mknotpresent(pmd)) = true]

This renames pmd_mknotpresent() as pmd_mkinvalid() reflecting the helper's
functionality more accurately while changing the above mentioned situation
as follows. This does not create any functional change.

[pmd_present(pmd_mkinvalid(pmd)) = true]

This is not applicable for platforms that define own pmdp_invalidate() via
__HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
discussion here.

https://patchwork.kernel.org/patch/11019637/

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: nouveau@lists.freedesktop.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arc/include/asm/hugepage.h       | 2 +-
 arch/arm/include/asm/pgtable-3level.h | 2 +-
 arch/arm64/include/asm/pgtable.h      | 2 +-
 arch/mips/include/asm/pgtable.h       | 2 +-
 arch/x86/include/asm/pgtable.h        | 2 +-
 arch/x86/mm/kmmio.c                   | 2 +-
 mm/pgtable-generic.c                  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/hugepage.h b/arch/arc/include/asm/hugepage.h
index 30ac40fed2c5..4eef17c5c1da 100644
--- a/arch/arc/include/asm/hugepage.h
+++ b/arch/arc/include/asm/hugepage.h
@@ -26,7 +26,7 @@ static inline pmd_t pte_pmd(pte_t pte)
 #define pmd_mkold(pmd)		pte_pmd(pte_mkold(pmd_pte(pmd)))
 #define pmd_mkyoung(pmd)	pte_pmd(pte_mkyoung(pmd_pte(pmd)))
 #define pmd_mkhuge(pmd)		pte_pmd(pte_mkhuge(pmd_pte(pmd)))
-#define pmd_mknotpresent(pmd)	pte_pmd(pte_mknotpresent(pmd_pte(pmd)))
+#define pmd_mkinvalid(pmd)	pte_pmd(pte_mknotpresent(pmd_pte(pmd)))
 #define pmd_mkclean(pmd)	pte_pmd(pte_mkclean(pmd_pte(pmd)))
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 36805f94939e..1933aed9f68d 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -221,7 +221,7 @@ PMD_BIT_FUNC(mkyoung,   |= PMD_SECT_AF);
 #define pmdp_establish generic_pmdp_establish
 
 /* represent a notpresent pmd by faulting entry, this is used by pmdp_invalidate */
-static inline pmd_t pmd_mknotpresent(pmd_t pmd)
+static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
 	return __pmd(pmd_val(pmd) & ~L_PMD_SECT_VALID);
 }
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 538c85e62f86..9a68bbce26d0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -366,7 +366,7 @@ static inline int pmd_protnone(pmd_t pmd)
 #define pmd_mkclean(pmd)	pte_pmd(pte_mkclean(pmd_pte(pmd)))
 #define pmd_mkdirty(pmd)	pte_pmd(pte_mkdirty(pmd_pte(pmd)))
 #define pmd_mkyoung(pmd)	pte_pmd(pte_mkyoung(pmd_pte(pmd)))
-#define pmd_mknotpresent(pmd)	(__pmd(pmd_val(pmd) & ~PMD_SECT_VALID))
+#define pmd_mkinvalid(pmd)	(__pmd(pmd_val(pmd) & ~PMD_SECT_VALID))
 
 #define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
 
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f1801e7a4b15..bfbab6652e20 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -631,7 +631,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pmd;
 }
 
-static inline pmd_t pmd_mknotpresent(pmd_t pmd)
+static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
 	pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY);
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 4d02e64af1b3..f51d8997ed00 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -624,7 +624,7 @@ static inline pud_t pfn_pud(unsigned long page_nr, pgprot_t pgprot)
 	return __pud(pfn | check_pgprot(pgprot));
 }
 
-static inline pmd_t pmd_mknotpresent(pmd_t pmd)
+static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
 	return pfn_pmd(pmd_pfn(pmd),
 		      __pgprot(pmd_flags(pmd) & ~(_PAGE_PRESENT|_PAGE_PROTNONE)));
diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 9994353fb75d..22bae5828c3d 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -130,7 +130,7 @@ static void clear_pmd_presence(pmd_t *pmd, bool clear, pmdval_t *old)
 	pmdval_t v = pmd_val(*pmd);
 	if (clear) {
 		*old = v;
-		new_pmd = pmd_mknotpresent(*pmd);
+		new_pmd = pmd_mkinvalid(*pmd);
 	} else {
 		/* Presume this has been called with clear==true previously */
 		new_pmd = __pmd(*old);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 3d7c01e76efc..d18f0e1b6792 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -194,7 +194,7 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		     pmd_t *pmdp)
 {
-	pmd_t old = pmdp_establish(vma, address, pmdp, pmd_mknotpresent(*pmdp));
+	pmd_t old = pmdp_establish(vma, address, pmdp, pmd_mkinvalid(*pmdp));
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
 	return old;
 }
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
