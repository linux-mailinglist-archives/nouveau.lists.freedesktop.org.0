Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D64B0712
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8210E737;
	Thu, 10 Feb 2022 07:29:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CA810E737;
 Thu, 10 Feb 2022 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zGyKKbpob2jKuUoVhg21xS0brp0ZuvbpPYxyQsLpvrY=; b=iJGuHG0f0lD7DoQncmPS2ParR5
 KxCks+Bp5nJENeFnI4VlZU9TuxI3ve9mj03FG6U7WpDS92xIoLF7uKO6UFMuXnHvzmdmocQW3BDy+
 493NiErvPKBDX7e4tdCzX6+mKgsc9YcD8xxsiq26BWP/+hAuRU5GAvnE1Ona+4KghRp8m58WECJCE
 wpxIn0by2WrZttMVtHFMFk4CwasYSLanhvoWdHa/JPPo+H3E+k7Z6njMlEnvzPeDjjEctHSRHiX/g
 lCS6jqLsBWkXhw6wOT3p4S0KafLAs/9eWHggPdIRwc2tFevhnT6M2jVXY0TmUVm+Hb4tv7LeyXms+
 c3GmYNRw==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3tH-002s8p-Jo; Thu, 10 Feb 2022 07:29:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:18 +0100
Message-Id: <20220210072828.2930359-18-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 17/27] mm/gup: fail get_user_pages for LONGTERM
 dev coherent type
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
Cc: Alex Sierra <alex.sierra@amd.com>, nvdimm@lists.linux.dev,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Avoid long term pinning for Coherent device type pages. This could
interfere with their own device memory manager. For now, we are just
returning error for PIN_LONGTERM Coherent device type pages. Eventually,
these type of pages will get migrated to system memory, once the device
migration pages support is added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
[hch: rebased on previous cleanups, split the two checks]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 37d6c24ca71225..39b23ad39a7bde 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1881,6 +1881,19 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_head = head;
 
+		/*
+		 * Device private pages will get faulted in during gup so it
+		 * shouldn't be possible to see one here.
+		 */
+		if (WARN_ON_ONCE(is_device_private_page(head))) {
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+		if (is_device_coherent_page(head)) {
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
 		if (is_pinnable_page(head))
 			continue;
 
@@ -1925,7 +1938,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			put_page(pages[i]);
 	}
 
-	if (!list_empty(&movable_page_list)) {
+	if (!ret && !list_empty(&movable_page_list)) {
 		struct migration_target_control mtc = {
 			.nid = NUMA_NO_NODE,
 			.gfp_mask = GFP_USER | __GFP_NOWARN,
-- 
2.30.2

