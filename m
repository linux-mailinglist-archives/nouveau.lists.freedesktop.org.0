Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9325B248
	for <lists+nouveau@lfdr.de>; Wed,  2 Sep 2020 18:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3044D6E947;
	Wed,  2 Sep 2020 16:58:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD576E948
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 16:58:36 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4fcf2e0003>; Wed, 02 Sep 2020 09:58:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 02 Sep 2020 09:58:36 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 02 Sep 2020 09:58:36 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 16:58:35 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Sep 2020 16:58:35 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4fcf3b0005>; Wed, 02 Sep 2020 09:58:35 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 2 Sep 2020 09:58:25 -0700
Message-ID: <20200902165830.5367-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902165830.5367-1-rcampbell@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599065902; bh=oATABFM4AEF4PG+JY10uewS8j4geL66qhQa5ZF2kPD8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=B77jHf3y79/2XEe/LYHBFYAuS7tNokE/fPkCaOiD2Zzy/OfnFzHxs8qES48AKO200
 AFdxhEIGisWoadUewWILipVMHr8CChvUPlE7/bE3g908d1bNfESUMYGblvJsKruIOZ
 E8DH3bdqqhleXqqcRXIajrrf5dfd3+jeSzTtO55EtCP2ja+Ptjyb8uE62VWXaeWxY/
 YifNhlvTBxLDaoCskQThXbxSKHv9rlNuTU4whUznLptJsH+NL0w0tnR7XjF1wbtdFt
 +jStmy9f267ONZ/jgCJlXupvNqXFuDsKMEOHnHvYdpdnAUPiRtG+8nwipElzH+T27t
 NTP5Yp3jPxpjQ==
Subject: [Nouveau] [PATCH v2 2/7] mm/migrate: move migrate_vma_collect_skip()
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Move the definition of migrate_vma_collect_skip() to make it callable
by migrate_vma_collect_hole(). This helps make the next patch easier
to read.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 mm/migrate.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 4f89360d9e77..ce16ed3deab6 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2254,6 +2254,21 @@ int migrate_misplaced_transhuge_page(struct mm_struct *mm,
 #endif /* CONFIG_NUMA */
 
 #ifdef CONFIG_DEVICE_PRIVATE
+static int migrate_vma_collect_skip(unsigned long start,
+				    unsigned long end,
+				    struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		migrate->dst[migrate->npages] = 0;
+		migrate->src[migrate->npages++] = 0;
+	}
+
+	return 0;
+}
+
 static int migrate_vma_collect_hole(unsigned long start,
 				    unsigned long end,
 				    __always_unused int depth,
@@ -2282,21 +2297,6 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
-static int migrate_vma_collect_skip(unsigned long start,
-				    unsigned long end,
-				    struct mm_walk *walk)
-{
-	struct migrate_vma *migrate = walk->private;
-	unsigned long addr;
-
-	for (addr = start; addr < end; addr += PAGE_SIZE) {
-		migrate->dst[migrate->npages] = 0;
-		migrate->src[migrate->npages++] = 0;
-	}
-
-	return 0;
-}
-
 static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long start,
 				   unsigned long end,
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
