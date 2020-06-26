Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3C20BAE6
	for <lists+nouveau@lfdr.de>; Fri, 26 Jun 2020 23:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A984E6E4BA;
	Fri, 26 Jun 2020 21:04:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E06E4BA
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2020 21:04:01 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef662610004>; Fri, 26 Jun 2020 14:02:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 14:04:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 26 Jun 2020 14:04:00 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 21:03:50 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 26 Jun 2020 21:03:50 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef662b50003>; Fri, 26 Jun 2020 14:03:50 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 26 Jun 2020 14:03:37 -0700
Message-ID: <20200626210337.20089-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593205345; bh=mwwOsKu36dXm+0p8ULHDS3ICUwuV7kITaXbla/zbTUs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=qC41cWrlv5PLn22RgQchoeWC/KvVD5wmV1a7t8JeJOo6zUvnssFr7pXleVBMzGzm6
 FmE7WXJdhKnagu2W3vJaEbwnaYKvp+evh3PvFFUSEuXaRrXW58v49YhOzW1S2in/Q6
 pcw6AA8JaGpFUey4GJIfrQqElaCvMqoVTrb4teax6DZII/+Y//8gSCSnZvxPgWNv2M
 sOBKATauOQGiSYnaUcngMLMGiKH4Df1aFOvKhLzJf9DxgNXnTjhAgCsbf+15jptEnX
 rfsXBPuSNzmPuRuK+Wxpe7HFDGIDwOoQ/HEfCfzOHkD6BBuqBdTpP6xOVpmO1OPdDk
 X4ZvL2s4Rj0rA==
Subject: [Nouveau] [PATCH v2] nouveau: fix page fault on device private
 memory
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, stable@vger.kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben
 Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
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
Cc: stable@vger.kernel.org
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
---

This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
It doesn't depend on any of the other nouveau/HMM changes I have
recently posted.

Resending to include stable@vger.org and adding Jason's reviewed-by.

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
