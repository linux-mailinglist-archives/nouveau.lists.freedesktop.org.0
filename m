Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CE62794EE
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DEF6ED7D;
	Fri, 25 Sep 2020 23:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7850B6ED37
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 20:44:52 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6e56930000>; Fri, 25 Sep 2020 13:44:03 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 20:44:48 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 25 Sep 2020 20:44:48 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <kvm-ppc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 25 Sep 2020 13:44:41 -0700
Message-ID: <20200925204442.31348-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925204442.31348-1-rcampbell@nvidia.com>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601066643; bh=4UbYfQo9AxoYDYhHzSM52zo+QqA5U/JvLsALQgToAcw=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=ppmFHJw0FcvTTLsqEzpQGv1+HRZOAwtVEIxm0dWqH7qfJliBWPFv0mr0+bEjH9zMw
 27oZK0wp+klIF1aR8bjlS0PCzsozHz0RU7MoXCOJoKJMskpwWXSYldy1pORDmvC6R6
 nwaNeCE1ezdMPk1zip1/0XO+Y98S809xcq0vKiH1bot2OZ/NB/eLGflsWUFgvZXkC9
 YCqnNcLDseWWA7vraoWncwMoTeSoOBhEK7AuZ8NEMrgLd7zwRTsmFjoPT1sSduX3aj
 aJXHU048cE+Gn7/oz0w8gMVrcgsNwJMIen9Fpp2fqb9izIrKOoovFISrkv3h1lyN0d
 xtnrv3qv5fzZg==
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: [Nouveau] [PATCH 1/2] ext4/xfs: add page refcount helper
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

There are several places where ZONE_DEVICE struct pages assume a reference
count == 1 means the page is idle and free. Instead of open coding this,
add a helper function to hide this detail.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 fs/dax.c            | 8 ++++----
 fs/ext4/inode.c     | 2 +-
 fs/xfs/xfs_file.c   | 2 +-
 include/linux/dax.h | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 994ab66a9907..8eddbcc0e149 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_layout_is_idle_page(page))
 			return page;
 	}
 	return NULL;
@@ -560,11 +560,11 @@ static void *grab_mapping_entry(struct xa_state *xas,
 
 /**
  * dax_layout_busy_page - find first pinned page in @mapping
- * @mapping: address space to scan for a page with ref count > 1
+ * @mapping: address space to scan for a page with ref count > 0
  *
  * DAX requires ZONE_DEVICE mapped pages. These pages are never
  * 'onlined' to the page allocator so they are considered idle when
- * page->count == 1. A filesystem uses this interface to determine if
+ * page->count == 0. A filesystem uses this interface to determine if
  * any page in the mapping is busy, i.e. for DMA, or other
  * get_user_pages() usages.
  *
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bf596467c234..d9f8ad55523a 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3927,7 +3927,7 @@ int ext4_break_layouts(struct inode *inode)
 			return 0;
 
 		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
+				dax_layout_is_idle_page(page),
 				TASK_INTERRUPTIBLE, 0, 0,
 				ext4_wait_dax_page(ei));
 	} while (error == 0);
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index a29f78a663ca..29ab96541bc1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -750,7 +750,7 @@ xfs_break_dax_layouts(
 
 	*retry = true;
 	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
+			dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
 			0, 0, xfs_wait_dax_page(inode));
 }
 
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 43b39ab9de1a..3f78ed78d1d6 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -238,4 +238,9 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_layout_is_idle_page(struct page *page)
+{
+	return page_ref_count(page) <= 1;
+}
+
 #endif
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
