Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F84204485
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 01:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07226E190;
	Mon, 22 Jun 2020 23:39:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18DB6E190
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 23:39:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef140f80000>; Mon, 22 Jun 2020 16:38:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 16:39:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 16:39:17 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 23:39:10 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 22 Jun 2020 23:39:10 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef1411d0002>; Mon, 22 Jun 2020 16:39:10 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 22 Jun 2020 16:38:54 -0700
Message-ID: <20200622233854.10889-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622233854.10889-1-rcampbell@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592869112; bh=vetzRo7qSf24kubQfQzsa30v77hzL/+08nUTQBbHTVs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=GTVTaiiBw4ZCJCU4mDu19iR01bCY5Gq94MAsbMgkNT9yEliD0vup723+rKDRiR8dV
 WkhEFJjx9CYtHuus9iaqaIe0rVyw+s0AcU8b8asiOJORKisIlP/e090i2ZlwxdhpOh
 g6Dj8A9gm7fXKmdU/g9HyrSEQHw032LWLP0N2Inl2Fq+GIZXR+MxkoXEacDknLJ3SR
 hrYfA3DTesIpvtNRWIkvaTvgW+//cs9ntZNhv9S4HL1a0nnHUoCD9ZI+8CQc/7Y9tF
 kqzhv6Sxy/rTIFkd7iewBiz2YOKeH0qDqm9Y9ZJ440P7/vqTcNGmZQK/oUsm0NPgFD
 eveHHM97QKIVA==
Subject: [Nouveau] [RESEND PATCH 3/3] nouveau: make nvkm_vmm_ctor() and
 nvkm_mmu_ptp_get() static
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

The functions nvkm_vmm_ctor() and nvkm_mmu_ptp_get() are not called outside
of the file defining them so make them static.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h  | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index ee11ccaf0563..de91e9a26172 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -61,7 +61,7 @@ nvkm_mmu_ptp_put(struct nvkm_mmu *mmu, bool force, struct nvkm_mmu_pt *pt)
 	kfree(pt);
 }
 
-struct nvkm_mmu_pt *
+static struct nvkm_mmu_pt *
 nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
 {
 	struct nvkm_mmu_pt *pt;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 199f94e15c5f..67b00dcef4b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1030,7 +1030,7 @@ nvkm_vmm_ctor_managed(struct nvkm_vmm *vmm, u64 addr, u64 size)
 	return 0;
 }
 
-int
+static int
 nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 	      u32 pd_header, bool managed, u64 addr, u64 size,
 	      struct lock_class_key *key, const char *name,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index d3f8f916d0db..a2b179568970 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -163,9 +163,6 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
 		  u32 pd_header, bool managed, u64 addr, u64 size,
 		  struct lock_class_key *, const char *name,
 		  struct nvkm_vmm **);
-int nvkm_vmm_ctor(const struct nvkm_vmm_func *, struct nvkm_mmu *,
-		  u32 pd_header, bool managed, u64 addr, u64 size,
-		  struct lock_class_key *, const char *name, struct nvkm_vmm *);
 struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
 struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
 				     u64 addr, u64 size);
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
