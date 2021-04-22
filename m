Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A373685B8
	for <lists+nouveau@lfdr.de>; Thu, 22 Apr 2021 19:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCD96E560;
	Thu, 22 Apr 2021 17:20:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5106EA3E
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 08:15:44 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id p2so16840226pgh.4
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3ItV5y5XoEhSqi+d51HdmwBWLH2Hb4UsI3M8OVWu24=;
 b=Cisfd6jfRp7ZntllQG9J21QpT0tbDCUmO7Sd4z/S5YfmrCvvZiaBUR0BPZFuQ5hvd/
 gxJhZ2pu34BRLPXqvLavDRaBXVqLQLA1W1/STuSvpHuqa+BPpv9DUpeEZVvPd4m/EZM3
 aXG1VDvl65ykf2+uaD2EnhVf7WefQlXtPpuHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3ItV5y5XoEhSqi+d51HdmwBWLH2Hb4UsI3M8OVWu24=;
 b=Btaj87qYr5UFnVkix9+l1HTZ3VIZjh6SeZKaZgLVWxLqie9N98KOBnnTR8sRucNplk
 QPQbQ1KS9cP8TxhRt9Mt5Ste6e87Si6t6UNm3/p4vN+S57CYBwgzi5E5MApfiZBVWrdX
 im+zu6rFiyr+LvjCLdn7wC8SzJzoMRFTEo92GAP+wIq9aAUqCJK711HphcBYTp1E/LzF
 JIS9iyMiDLBrmwnoQjGOGYdGb9chost2Y/qMguG8yFG1Ex7QqyXUqt4+ZEgFl57pr6WJ
 ihKP/27YSkfqJ9G4yi5h0V2nRaAkmMP8Y3igMZsZptBEbcn7cN2/tvRqP9a1rdUy2MC+
 MT7w==
X-Gm-Message-State: AOAM530I+AUzVZG3J3NkhSbp4ZXlDQHTGeOuK0waRyp3hGPF1SvkF7oD
 Sz309caWDaNRM5Mvlpvdiy0ZQA==
X-Google-Smtp-Source: ABdhPJxkEqOgBe8WdlOJ16Imv3NTakOO84xcsb4CT6RBz2bwANEVo+9MWgQ4ffM3wlaap5K1DgM+6A==
X-Received: by 2002:a63:4106:: with SMTP id o6mr2436897pga.104.1619079344334; 
 Thu, 22 Apr 2021 01:15:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id n48sm1357349pfv.130.2021.04.22.01.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:15:43 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 22 Apr 2021 16:14:55 +0800
Message-Id: <20210422081508.3942748-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Apr 2021 17:20:12 +0000
Subject: [Nouveau] [PATCH v5 03/16] swiotlb: Refactor swiotlb_create_debugfs
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

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 3f1adee35097..57a9adb920bf 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -660,18 +660,24 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs(struct io_tlb_mem *mem, const char *name,
+				   struct dentry *node)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
 	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
+		return;
+
+	mem->debugfs = debugfs_create_dir(name, node);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	swiotlb_create_debugfs(io_tlb_default_mem, "swiotlb", NULL);
+
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
