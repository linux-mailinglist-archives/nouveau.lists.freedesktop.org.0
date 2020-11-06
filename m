Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FCA2A8B97
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 01:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8D16E883;
	Fri,  6 Nov 2020 00:52:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA486E883
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 00:52:05 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa49e330002>; Thu, 05 Nov 2020 16:52:03 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 00:51:59 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 00:51:59 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 5 Nov 2020 16:51:43 -0800
Message-ID: <20201106005147.20113-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201106005147.20113-1-rcampbell@nvidia.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604623923; bh=c83dvEU/mNjvQk5n1A2ZnS0Sp2WfXEWJ2edrH1gpMns=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=nYe9/jFxdlLp29PUkK4HpOkntA6n5ED8ryHK5XbwUn+CnvdVFi/TVh2/u/bLVBTLT
 QOYpEEx2Mb0H+tLHRT0UoqvExGSDYi/x0rDMIunDuBVjDymLKY5oipbbtn/Z6BFbUR
 lUmWDwbu+iL4Ls29LM094GkxEqYGbyXY/eBX0+5RRKGRaFGKodTb+JqQ5bUaalXCDc
 cpFgmBKpp+wEmu6QjXCHeNdK0sEC3/Sbrhr7qf4hZqg1E4U8KZp7Pu9YVAdsAdxeCI
 x4FBmXyCayDbSdNxohCtD+QNdp4UcB9e1TYIwqxJRTgncr9+T56iuihU561CEYmQ+G
 2su1h0YLDJ37A==
Subject: [Nouveau] [PATCH v3 2/6] mm/migrate: move migrate_vma_collect_skip()
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
 Alistair Popple <apopple@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
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
index c1585ec29827..665516319b66 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2253,6 +2253,21 @@ int migrate_misplaced_transhuge_page(struct mm_struct *mm,
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
@@ -2281,21 +2296,6 @@ static int migrate_vma_collect_hole(unsigned long start,
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
