Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A03685BE
	for <lists+nouveau@lfdr.de>; Thu, 22 Apr 2021 19:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C9C6E566;
	Thu, 22 Apr 2021 17:20:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546B96EA3D
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 08:15:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id o16so9525060plg.5
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KeK8DSQdHPnfBsnYoJml8hxFMiJru7O0NA4XbeWzkSY=;
 b=AsZrZqJIimVAtGXMRVsWcKrsorVck1XgLTh3pHNLrWSxkdDRnGm7t6TqpM5ldf6xB7
 mC86KkbKnwzlnS/clKnP6s/9uO1XB8opjFqiCDh6A7+1mZw2SFs1IwNU2LHHphHOt6QY
 p2b9YBU51p/mzY9rCQjA96SJjLr18SEsXNgpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeK8DSQdHPnfBsnYoJml8hxFMiJru7O0NA4XbeWzkSY=;
 b=hgRrpOab6YSmalJdxmKUc/Tj8P6khiRx5oqIWkquEx4mXCRreX/P7CS1gHJf/PY9uq
 mnSnBCSQ1pcxJbwfe0kf6H+PqrYWZIafrrbdrUZWrjUoBKGt41WLl6eFDW3AsxaUH6oL
 MY+0Yr0GUc2SpU/Dn3/PGv37BaD8B7VmU/9sclibsveJ1+RZfNe8VbDv3i3nd5rXt3ue
 9EtsQMx4cdMMF3ONxY6t5SVqpu30Q0yWjvY/bMW5xWXNwOiPrm9wfwz8/jb3fsuc3t4P
 07CJeFKjjcy8Hyb0ker6/gUjBUxuuh2WpmMYp4pVVgA9U9Y3rphGVauAPXngDvqObUcq
 5big==
X-Gm-Message-State: AOAM530WTTBYdhsQHRmAvt7NL+yU6H2NrH2eib8FwfOJG1SK/1UrVmwF
 1pVqBy4LwUFtNURUV6DAtd4K2A==
X-Google-Smtp-Source: ABdhPJx3x6k3UuJoTeVgHgSVZk2TSCFARKLuNRut1DwuLYspzTDGMvJMpDB6O5YCyQkIwGCuRKmyJg==
X-Received: by 2002:a17:90b:298:: with SMTP id
 az24mr2746175pjb.123.1619079327035; 
 Thu, 22 Apr 2021 01:15:27 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id o30sm1546049pgc.55.2021.04.22.01.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:15:26 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 22 Apr 2021 16:14:53 +0800
Message-Id: <20210422081508.3942748-2-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Apr 2021 17:20:11 +0000
Subject: [Nouveau] [PATCH v5 01/16] swiotlb: Fix the type of index
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

Fix the type of index from unsigned int to int since find_slots() might
return -1.

Fixes: 0774983bc923 ("swiotlb: refactor swiotlb_tbl_map_single")
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0a5b6f7e75bc..8635a57f88e9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -499,7 +499,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
-	unsigned int index, i;
+	unsigned int i;
+	int index;
 	phys_addr_t tlb_addr;
 
 	if (!mem)
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
