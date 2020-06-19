Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9A201D74
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2446ECCD;
	Fri, 19 Jun 2020 21:57:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275F6EC1B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:07 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed344e0001>; Fri, 19 Jun 2020 14:55:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ab0002>; Fri, 19 Jun 2020 14:56:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:36 -0700
Message-ID: <20200619215649.32297-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603726; bh=ZfcMxwlEjaJ9jud4ZrslX8wzG6hxoVtsjt+UlX695yk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=mU9KnbzYIJxSfATGWHX9y6ZjjtDaywPixJ52o6MZeR6UGLlSiA1jlzu0XdSndhmPX
 iLpZb5OIKOq2tiNtGx2SA7+0C6IXXZAD9shfBEEKghxsY2VL2xNOEJ0jqCewxzd/9X
 BCEh4wzqf0r0kmc30QRvHFpcqe5YieRlMbBU1FpfSHDcf4CPVruyHz5ekH/aWtYHjS
 D/qYlmwKed8ltDQ+TmlI6p5lpb94ZcowbE7lH9kwSfM6QNDrxbl2lT9YB+2ea0oUMj
 nb1L/Bp2dHaJvaVln1/zPWYM1OSW5yuZj8HHjh3QHpnBLEgFzBA9f4B8q0OfmY9P5f
 T2eg4bo3r5Umg==
Subject: [Nouveau] [PATCH 03/16] nouveau: fix mixed normal and device
 private page migration
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

The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
migrate memory in the given address range to device private memory. The
source pages might already have been migrated to device private memory.
In that case, the source struct page is not checked to see if it is
a device private page and incorrectly computes the GPU's physical
address of local memory leading to data corruption.
Fix this by checking the source struct page and computing the correct
physical address.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index cc9993837508..f6a806ba3caa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -540,6 +540,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
+	if (spage && is_device_private_page(spage)) {
+		paddr = nouveau_dmem_page_addr(spage);
+		*dma_addr = DMA_MAPPING_ERROR;
+		goto done;
+	}
+
 	dpage = nouveau_dmem_page_alloc_locked(drm);
 	if (!dpage)
 		goto out;
@@ -560,6 +566,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 			goto out_free_page;
 	}
 
+done:
 	*pfn = NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
@@ -615,6 +622,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.src_owner	= drm->dev,
 	};
 	unsigned long i;
 	u64 *pfns;
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
