Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E420B6EC
	for <lists+nouveau@lfdr.de>; Fri, 26 Jun 2020 19:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5296ECEB;
	Fri, 26 Jun 2020 17:26:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D3B6ECEC
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2020 17:26:41 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef62fc40000>; Fri, 26 Jun 2020 10:26:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 10:26:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 10:26:41 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 17:26:31 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 26 Jun 2020 17:26:31 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef62fc60001>; Fri, 26 Jun 2020 10:26:30 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 26 Jun 2020 10:26:26 -0700
Message-ID: <20200626172626.19207-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593192388; bh=+jL8198tCi4VPutVCs4yXHE2/yX1fXK0+ZzD5egdp4w=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=dSKhZ+J1Nn3Eb0LX95a8mp/H26NjdofgeBJOetygGbQkKjHzbZyrwmqEC8ErmvCS1
 eUA99lTXoBFGkmL6xDJtRRF94rW9DzYwnDhvi4TFwLxXXyAzWwALy8yhk4EGhbY3Bb
 dM9eAML6m8QPXetN/JpnNXJ3EIjbnTy2qTQJLk6Ka8GKBkmNtDgc4SYKdvITcbD4X4
 27HWfqCOadM0ADG566k+W7W+V9Cn9hKHfOc1FjWdWzTJhJHZ6EnyT9phhQSJ/zhc8c
 UgmzTQaANl52Mx1odNDsQazX9USnqk2tgx9XzVzMHFfoy9dyAoo6ZojlUjoPAGFykl
 zbNqgCRLeM0Yw==
Subject: [Nouveau] [PATCH] nouveau: fix page fault on device private memory
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
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

If system memory is migrated to device private memory and no GPU MMU
page table entry exists, the GPU will fault and call hmm_range_fault()
to get the PFN for the page. Since the .dev_private_owner pointer in
struct hmm_range is not set, hmm_range_fault returns an error which
results in the GPU program stopping with a fatal fault.
Fix this by setting .dev_private_owner appropriately.

Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_range_fault()")
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
It doesn't depend on any of the other nouveau/HMM changes I have
recently posted.

 drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index ba9f9359c30e..6586d9d39874 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -562,6 +562,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		.end = notifier->notifier.interval_tree.last + 1,
 		.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
 		.hmm_pfns = hmm_pfns,
+		.dev_private_owner = drm->dev,
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
 	int ret;
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
