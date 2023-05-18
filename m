Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB56F7082FE
	for <lists+nouveau@lfdr.de>; Thu, 18 May 2023 15:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD05210E0B6;
	Thu, 18 May 2023 13:43:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28C890D2
 for <nouveau@lists.freedesktop.org>; Thu, 18 May 2023 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=05AyJy/WnduYw6cv5NEmxDHJJYQdGW0Vqnw+CujW2f0=; b=YCm6+nCfk/tqJs7qLv0fLb0i6p
 rh6YUXDVTuctprWr6BzRIVl5659Y51hsG50TV0qeGB/0lKu4HFOpG4FGQ2JEFosMgtSoOG1Ow82Uz
 T9PjamZA1bYNoiR5YkTkBWsX5NhqcUyOh6poOma8ugLkFknBvmIaPStma9KpMTsBbUcJJGJj2GKOM
 m4FKMYO7r8cwQykZilTii7odYMouDxqaidikNF/yF3CHzf5J2OZ+NbaaCrMe+2WSAAYCfKSuT1EoI
 IoZGn66ql9UNMrCi9szQ7Xcw0aE6fgi6+RqZgIv8hKUVhPl2kjaVw0wt5trZqQLvqFJegnCIvf3F9
 Xml1tTcw==;
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduI-00D6RW-0C; Thu, 18 May 2023 13:43:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Date: Thu, 18 May 2023 15:42:51 +0200
Message-Id: <20230518134253.909623-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove the dangerous late initialization of xen-swiotlb in
pci_xen_swiotlb_init_late and instead just always initialize
xen-swiotlb in the boot code if CONFIG_XEN_PCIDEV_FRONTEND is enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/xen/swiotlb-xen.h |  6 ------
 arch/x86/kernel/pci-dma.c              | 25 +++----------------------
 drivers/pci/xen-pcifront.c             |  6 ------
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 77a2d19cc9909e..abde0f44df57dc 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -2,12 +2,6 @@
 #ifndef _ASM_X86_SWIOTLB_XEN_H
 #define _ASM_X86_SWIOTLB_XEN_H
 
-#ifdef CONFIG_SWIOTLB_XEN
-extern int pci_xen_swiotlb_init_late(void);
-#else
-static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
-#endif
-
 int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
 int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				unsigned int address_bits,
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index f887b08ac5ffe4..c4a7ead9eb674e 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -81,27 +81,6 @@ static void __init pci_xen_swiotlb_init(void)
 	if (IS_ENABLED(CONFIG_PCI))
 		pci_request_acs();
 }
-
-int pci_xen_swiotlb_init_late(void)
-{
-	if (dma_ops == &xen_swiotlb_dma_ops)
-		return 0;
-
-	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
-		int rc = swiotlb_init_late(swiotlb_size_or_default(),
-					   GFP_KERNEL, xen_swiotlb_fixup);
-		if (rc < 0)
-			return rc;
-	}
-
-	/* XXX: this switches the dma ops under live devices! */
-	dma_ops = &xen_swiotlb_dma_ops;
-	if (IS_ENABLED(CONFIG_PCI))
-		pci_request_acs();
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
 #else
 static inline void __init pci_xen_swiotlb_init(void)
 {
@@ -111,7 +90,9 @@ static inline void __init pci_xen_swiotlb_init(void)
 void __init pci_iommu_alloc(void)
 {
 	if (xen_pv_domain()) {
-		if (xen_initial_domain() || x86_swiotlb_enable)
+		if (xen_initial_domain() ||
+		    IS_ENABLED(CONFIG_XEN_PCIDEV_FRONTEND) ||
+		    x86_swiotlb_enable)
 			pci_xen_swiotlb_init();
 		return;
 	}
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index 83c0ab50676dff..11636634ae512f 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -22,7 +22,6 @@
 #include <linux/bitops.h>
 #include <linux/time.h>
 #include <linux/ktime.h>
-#include <linux/swiotlb.h>
 #include <xen/platform_pci.h>
 
 #include <asm/xen/swiotlb-xen.h>
@@ -669,11 +668,6 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !is_swiotlb_active(&pdev->xdev->dev)) {
-		err = pci_xen_swiotlb_init_late();
-		if (err)
-			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
-	}
 	return err;
 }
 
-- 
2.39.2

