Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356593685B6
	for <lists+nouveau@lfdr.de>; Thu, 22 Apr 2021 19:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583856E53C;
	Thu, 22 Apr 2021 17:20:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DF16EA48
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 08:17:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso532375pjn.3
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dv7BLYV1dR+Hv57QLEgOJn93z8PrIpEIV140lV4wljE=;
 b=IdEuGFWq6cEdkZ99mO2O27ki8GvfvMVey9yj/f47UHE3vV5lhpTNk16uhFdJSP1n3B
 e3lgr2Cg6K2DAQ3JgU6kTkPT93Wu21DPWa7PhBDty1/ouU1J2xZ4l5HgS7tneVxVJskn
 ggwToHKnOSn0M/meAOXM7m/Hj9WegBMauCF14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dv7BLYV1dR+Hv57QLEgOJn93z8PrIpEIV140lV4wljE=;
 b=WxPTAdgRU8Nq4l9qAebWR8HmfCgekzPhgp7ZFhHQtmJ2+wvcG2qfyIBdLDHSQO95O7
 iU1iWedgV5bX0YfvZfIg0nNA/kJTQ6fRXvcaCYjTV3eNcCm7S3QjVzu4+Uog+Xntz6nA
 9poGmE+n68awtL4sMBP8rNj3h+IzO62X0tGqrb3FHMisAWQu/HDjLCjvpdRDyQzc/LPu
 TXY2KLvt9RyvdV63bwaPeatlq7ngxf3BJl71DMSHCZNlrnVNu63AweZxm0S0g6CHgqXy
 dY8sLt/K37r5HFcXaGiHONfmoNPkRZXmAhEbvcAkTA2Qj0+N285GxY7E7aFdPjmfEEi3
 YMXA==
X-Gm-Message-State: AOAM532w2u+MBgSyQp/khEyJeCBKzHblxKp2xGv8K4x5v2QJgHCEh/M3
 6MojWfObZHq9nSoDNxuBt0Hz+A==
X-Google-Smtp-Source: ABdhPJxH7QpKxqdeO++v+i4smXOVuua/tATF0bVY4hpXQGaE+c1js3wqW4RuCXVBVjJRbCJn8Tis9w==
X-Received: by 2002:a17:90b:1b4a:: with SMTP id
 nv10mr2560415pjb.153.1619079438373; 
 Thu, 22 Apr 2021 01:17:18 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id x83sm1370623pfc.219.2021.04.22.01.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:17:18 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 22 Apr 2021 16:15:06 +0800
Message-Id: <20210422081508.3942748-15-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Apr 2021 17:20:12 +0000
Subject: [Nouveau] [PATCH v5 14/16] dma-direct: Allocate memory from
 restricted DMA pool if available
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 Robin Murphy <robin.murphy@arm.com>, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The restricted DMA pool is preferred if available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/direct.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a27f0510fcc..29523d2a9845 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -78,6 +78,10 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 static void __dma_direct_free_pages(struct device *dev, struct page *page,
 				    size_t size)
 {
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (swiotlb_free(dev, page, size))
+		return;
+#endif
 	dma_free_contiguous(dev, page, size);
 }
 
@@ -92,7 +96,17 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					   &phys_limit);
-	page = dma_alloc_contiguous(dev, size, gfp);
+
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	page = swiotlb_alloc(dev, size);
+	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
+		__dma_direct_free_pages(dev, page, size);
+		page = NULL;
+	}
+#endif
+
+	if (!page)
+		page = dma_alloc_contiguous(dev, size, gfp);
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 		dma_free_contiguous(dev, page, size);
 		page = NULL;
@@ -148,7 +162,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		gfp |= __GFP_NOWARN;
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
 		page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
 		if (!page)
 			return NULL;
@@ -161,8 +175,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	}
 
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !dev_is_dma_coherent(dev))
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
+	    !is_dev_swiotlb_force(dev))
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 
 	/*
@@ -172,7 +186,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    !gfpflags_allow_blocking(gfp) &&
 	    (force_dma_unencrypted(dev) ||
-	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
+	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	      !dev_is_dma_coherent(dev))) &&
+	    !is_dev_swiotlb_force(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	/* we always manually zero the memory once we are done */
@@ -253,15 +269,15 @@ void dma_direct_free(struct device *dev, size_t size,
 	unsigned int page_order = get_order(size);
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
 	}
 
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !dev_is_dma_coherent(dev)) {
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
+	    !is_dev_swiotlb_force(dev)) {
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
 		return;
 	}
@@ -289,7 +305,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	void *ret;
 
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
-	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
+	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
+	    !is_dev_swiotlb_force(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	page = __dma_direct_alloc_pages(dev, size, gfp);
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
