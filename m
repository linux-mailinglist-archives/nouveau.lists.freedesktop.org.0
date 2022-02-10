Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164474B0704
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3710E744;
	Thu, 10 Feb 2022 07:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3CA10E744;
 Thu, 10 Feb 2022 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TSWyCw4vTztBPyo8GxLIqXsPXAE8x+o+jpACo+bXu6c=; b=oSmCihDDzwnQJJ4E4o39wq3Slx
 52mHicQDU0zSXwx43YEq6IOz4IYt60RdsycENj8zZcAFvw8I7lRVXAulr0ZVd0YxpqNmwWWniKMQV
 bNVbMzo497280gAcXnC/zNLrxgEEpn6bJy0O9WPDsKBIFUk/w6eVbcuiM3sjtODw6Y9peBipr0Mye
 v5ppQ2i/idgT48OCGURSTG3U/h2mBknI1m4Gev2Ak2hMWguXHxrHctLnIv6QJhVQHU6vZST/DhSMX
 w+9CJkncRUNbaE+WvBvriDiscnYI2sxtK98paCB+Wrdgn8rBmSYKXptI41qNjGRZOr6ku1AQOW3My
 +qccZulA==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3sx-002rw3-Fx; Thu, 10 Feb 2022 07:29:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:11 +0100
Message-Id: <20220210072828.2930359-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 10/27] mm: refactor check_and_migrate_movable_pages
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove up to two levels of indentation by using continue statements
and move variables to local scope where possible.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 81 ++++++++++++++++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a9d4d724aef749..37d6c24ca71225 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1868,72 +1868,79 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 					    struct page **pages,
 					    unsigned int gup_flags)
 {
-	unsigned long i;
-	unsigned long isolation_error_count = 0;
-	bool drain_allow = true;
-	LIST_HEAD(movable_page_list);
-	long ret = 0;
+	unsigned long isolation_error_count = 0, i;
 	struct page *prev_head = NULL;
-	struct page *head;
-	struct migration_target_control mtc = {
-		.nid = NUMA_NO_NODE,
-		.gfp_mask = GFP_USER | __GFP_NOWARN,
-	};
+	LIST_HEAD(movable_page_list);
+	bool drain_allow = true;
+	int ret = 0;
 
 	for (i = 0; i < nr_pages; i++) {
-		head = compound_head(pages[i]);
+		struct page *head = compound_head(pages[i]);
+
 		if (head == prev_head)
 			continue;
 		prev_head = head;
+
+		if (is_pinnable_page(head))
+			continue;
+
 		/*
-		 * If we get a movable page, since we are going to be pinning
-		 * these entries, try to move them out if possible.
+		 * Try to move out any movable page before pinning the range.
 		 */
-		if (!is_pinnable_page(head)) {
-			if (PageHuge(head)) {
-				if (!isolate_huge_page(head, &movable_page_list))
-					isolation_error_count++;
-			} else {
-				if (!PageLRU(head) && drain_allow) {
-					lru_add_drain_all();
-					drain_allow = false;
-				}
+		if (PageHuge(head)) {
+			if (!isolate_huge_page(head, &movable_page_list))
+				isolation_error_count++;
+			continue;
+		}
 
-				if (isolate_lru_page(head)) {
-					isolation_error_count++;
-					continue;
-				}
-				list_add_tail(&head->lru, &movable_page_list);
-				mod_node_page_state(page_pgdat(head),
-						    NR_ISOLATED_ANON +
-						    page_is_file_lru(head),
-						    thp_nr_pages(head));
-			}
+		if (!PageLRU(head) && drain_allow) {
+			lru_add_drain_all();
+			drain_allow = false;
+		}
+
+		if (isolate_lru_page(head)) {
+			isolation_error_count++;
+			continue;
 		}
+		list_add_tail(&head->lru, &movable_page_list);
+		mod_node_page_state(page_pgdat(head),
+				    NR_ISOLATED_ANON + page_is_file_lru(head),
+				    thp_nr_pages(head));
 	}
 
+	if (!list_empty(&movable_page_list) || isolation_error_count)
+		goto unpin_pages;
+
 	/*
 	 * If list is empty, and no isolation errors, means that all pages are
 	 * in the correct zone.
 	 */
-	if (list_empty(&movable_page_list) && !isolation_error_count)
-		return nr_pages;
+	return nr_pages;
 
+unpin_pages:
 	if (gup_flags & FOLL_PIN) {
 		unpin_user_pages(pages, nr_pages);
 	} else {
 		for (i = 0; i < nr_pages; i++)
 			put_page(pages[i]);
 	}
+
 	if (!list_empty(&movable_page_list)) {
+		struct migration_target_control mtc = {
+			.nid = NUMA_NO_NODE,
+			.gfp_mask = GFP_USER | __GFP_NOWARN,
+		};
+
 		ret = migrate_pages(&movable_page_list, alloc_migration_target,
 				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
 				    MR_LONGTERM_PIN, NULL);
-		if (ret && !list_empty(&movable_page_list))
-			putback_movable_pages(&movable_page_list);
+		if (ret > 0) /* number of pages not migrated */
+			ret = -ENOMEM;
 	}
 
-	return ret > 0 ? -ENOMEM : ret;
+	if (ret && !list_empty(&movable_page_list))
+		putback_movable_pages(&movable_page_list);
+	return ret;
 }
 #else
 static long check_and_migrate_movable_pages(unsigned long nr_pages,
-- 
2.30.2

