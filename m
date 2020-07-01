Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0942921165A
	for <lists+nouveau@lfdr.de>; Thu,  2 Jul 2020 00:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C426EA10;
	Wed,  1 Jul 2020 22:54:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994676EA11
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2020 22:54:16 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efd13b40000>; Wed, 01 Jul 2020 15:52:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 01 Jul 2020 15:54:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 01 Jul 2020 15:54:16 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 22:54:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 1 Jul 2020 22:54:06 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5efd140d0004>; Wed, 01 Jul 2020 15:54:06 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 1 Jul 2020 15:53:52 -0700
Message-ID: <20200701225352.9649-6-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701225352.9649-1-rcampbell@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593643956; bh=UL+bKmwqRdPEbqM2DAzkFsHMUp8NkFT28XTM8su6HPs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=iCjwNcVg7bkn/my+AxsLEl8MhQESiDTQPBs3PLFh2F40Nc/cXrK8c3tmadkRomcIE
 D7ltu2olJDS9P8HASUKewPs5SBsFA3PYTp+DT616AuomF7Tx//09pTgE8yZzFdryYk
 aqdkso4Rl3YUGTzj4Ndf4FgBDAQKqsABk5Knpg6FBb0YYhNcucpJ16wHePWDwEotOo
 ZIW0XTifi4pkKuin//VSry09hlWEmzt/cLQoUXFAoOO8k9RvvxHz6pMFNaJPe9jQxP
 biTGEKAZPI7nrxeCVsnNCO09M5GT+FLtSrHKxx0dGNGIKjuISD7RNk0P0952GHn5nM
 dxedWuEOm5DbQ==
Subject: [Nouveau] [PATCH v3 5/5] hmm: add tests for hmm_pfn_to_map_order()
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
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add a sanity test for hmm_range_fault() returning the page mapping size
order.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 lib/test_hmm.c                         |  4 ++
 lib/test_hmm_uapi.h                    |  4 ++
 tools/testing/selftests/vm/hmm-tests.c | 76 ++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index a2a82262b97b..9aa577afc269 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -766,6 +766,10 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 		*perm |= HMM_DMIRROR_PROT_WRITE;
 	else
 		*perm |= HMM_DMIRROR_PROT_READ;
+	if (hmm_pfn_to_map_order(entry) + PAGE_SHIFT == PMD_SHIFT)
+		*perm |= HMM_DMIRROR_PROT_PMD;
+	else if (hmm_pfn_to_map_order(entry) + PAGE_SHIFT == PUD_SHIFT)
+		*perm |= HMM_DMIRROR_PROT_PUD;
 }
 
 static bool dmirror_snapshot_invalidate(struct mmu_interval_notifier *mni,
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 67b3b2e6ff5d..670b4ef2a5b6 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -40,6 +40,8 @@ struct hmm_dmirror_cmd {
  * HMM_DMIRROR_PROT_NONE: unpopulated PTE or PTE with no access
  * HMM_DMIRROR_PROT_READ: read-only PTE
  * HMM_DMIRROR_PROT_WRITE: read/write PTE
+ * HMM_DMIRROR_PROT_PMD: PMD sized page is fully mapped by same permissions
+ * HMM_DMIRROR_PROT_PUD: PUD sized page is fully mapped by same permissions
  * HMM_DMIRROR_PROT_ZERO: special read-only zero page
  * HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL: Migrated device private page on the
  *					device the ioctl() is made
@@ -51,6 +53,8 @@ enum {
 	HMM_DMIRROR_PROT_NONE			= 0x00,
 	HMM_DMIRROR_PROT_READ			= 0x01,
 	HMM_DMIRROR_PROT_WRITE			= 0x02,
+	HMM_DMIRROR_PROT_PMD			= 0x04,
+	HMM_DMIRROR_PROT_PUD			= 0x08,
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 79db22604019..b533dd08da1d 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1291,6 +1291,82 @@ TEST_F(hmm2, snapshot)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Test the hmm_range_fault() HMM_PFN_PMD flag for large pages that
+ * should be mapped by a large page table entry.
+ */
+TEST_F(hmm, compound)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	unsigned char *m;
+	int ret;
+	long pagesizes[4];
+	int n, idx;
+	unsigned long i;
+
+	/* Skip test if we can't allocate a hugetlbfs page. */
+
+	n = gethugepagesizes(pagesizes, 4);
+	if (n <= 0)
+		return;
+	for (idx = 0; --n > 0; ) {
+		if (pagesizes[n] < pagesizes[idx])
+			idx = n;
+	}
+	size = ALIGN(TWOMEG, pagesizes[idx]);
+	npages = size >> self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->ptr = get_hugepage_region(size, GHR_STRICT);
+	if (buffer->ptr == NULL) {
+		free(buffer);
+		return;
+	}
+
+	buffer->size = size;
+	buffer->mirror = malloc(npages);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Initialize the pages the device will snapshot in buffer->ptr. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device snapshotting CPU pagetables. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device saw. */
+	m = buffer->mirror;
+	for (i = 0; i < npages; ++i)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE |
+				HMM_DMIRROR_PROT_PMD);
+
+	/* Make the region read-only. */
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device snapshotting CPU pagetables. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device saw. */
+	m = buffer->mirror;
+	for (i = 0; i < npages; ++i)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_READ |
+				HMM_DMIRROR_PROT_PMD);
+
+	free_hugepage_region(buffer->ptr);
+	buffer->ptr = NULL;
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Test two devices reading the same memory (double mapped).
  */
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
