Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24D201D6D
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6670D6ECAA;
	Fri, 19 Jun 2020 21:57:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFCC6EC4C
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed344e0003>; Fri, 19 Jun 2020 14:55:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ab0006>; Fri, 19 Jun 2020 14:56:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:39 -0700
Message-ID: <20200619215649.32297-7-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603726; bh=WFEHCal/gCxROdrgkDzRDfE196T9tyXmpg2D/HYI1XY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=KXI6tObJ5oTpDCSapDH+P+HDDS1sHlEs6IY8U+F8yA+CNTh3TGWL08aSrGrVJDdEk
 4+hhQ7CeAcfhYZPA1V12+m0twUBVV1/dQJNz87q+KFer73+2p9OvPiszT3nHnSqyy0
 71alAOAQCO5Ayi3dQPAx+ja+ZGPkhoaw+JRo8Fc/QOqX9TvpJgu8gvO9Rh1Pfw1ZFH
 Ryl7MZncUdy2sq5NLByALPlQUU8cL7A12pk+/YgpgY9FnQH9+4Kyg5c+8IWoWue1jO
 MAvqIY0JcKxx+vn+MVEie4P2D8VVJiXgOop00f7tI6m6ax852mLbrY53XPUBS0Gbn2
 VSsAMh+L63vXQ==
Subject: [Nouveau] [PATCH 06/16] mm/hmm: test mixed normal and device
 private migrations
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add a test to check that migrating a range of addresses with mixed
device private pages and normal anonymous pages are all migrated.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 lib/test_hmm.c                         | 22 +++++++++++++++++-----
 tools/testing/selftests/vm/hmm-tests.c | 18 ++++++++++++++----
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index f7c2b51a7a9d..50bdf041770a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -588,12 +588,24 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		/*
 		 * Don't migrate device private pages from our own driver or
-		 * others. For our own we would do a device private memory copy
-		 * not a migration and for others, we would need to fault the
-		 * other device's page into system memory first.
+		 * others. Other device's private pages are skipped because
+		 * the src_owner field won't match. The migrate_vma_setup()
+		 * will have invalidated our page tables for our own device
+		 * private pages as part of isolating and locking the pages.
+		 * In this case, repopulate our page table.
 		 */
-		if (spage && is_zone_device_page(spage))
+		if (spage && is_zone_device_page(spage)) {
+			unsigned long pfn = addr >> PAGE_SHIFT;
+			void *entry;
+
+			mutex_lock(&dmirror->mutex);
+			entry = spage->zone_device_data;
+			if (*src & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+			mutex_unlock(&dmirror->mutex);
 			continue;
+		}
 
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
@@ -703,7 +715,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst = dst_pfns;
 		args.start = addr;
 		args.end = next;
-		args.src_owner = NULL;
+		args.src_owner = dmirror->mdevice;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index bdfa95ac9a7d..e2a36783e99d 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -881,8 +881,9 @@ TEST_F(hmm, migrate)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory.
+ * Migrate anonymous memory to device private memory and fault some of it back
+ * to system memory, then try migrating the resulting mix of system and device
+ * private memory to the device.
  */
 TEST_F(hmm, migrate_fault)
 {
@@ -924,8 +925,17 @@ TEST_F(hmm, migrate_fault)
 	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
 
-	/* Fault pages back to system memory and check them. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+	/* Fault half the pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Migrate memory to the device again. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
 
 	hmm_buffer_free(buffer);
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
