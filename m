Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D60201D6E
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B146ECC2;
	Fri, 19 Jun 2020 21:57:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C414C6EC32
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:07 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed344d0004>; Fri, 19 Jun 2020 14:55:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ab0007>; Fri, 19 Jun 2020 14:56:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:40 -0700
Message-ID: <20200619215649.32297-8-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603726; bh=vetzRo7qSf24kubQfQzsa30v77hzL/+08nUTQBbHTVs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=UfBNFDTqpG5MyhwNmVPckGozBY3eduVobrHTvFSHzyUchJXE1jzsUsYTg1hoTlaD4
 N6TVbW7Af+vTudjECcSaQxhxJPLtNw4+ZiAg/PPCbkOQiS514ZRZ2razSWXAUkUMwR
 eNgTs0O5k5RMgLDUldfjkfu5SrgXXsfmJeacD0HguVM5WDuny80+PFyCItFqfCXd2H
 Xx58fJdk9X3nC/mvvgX/jExp7MX02zjIFarAcORC7FxHstDGD3N0zkazDkZUmEZVwU
 nb702At2tthf3I9JHJNghdj/tbARcCKKALlaoPvHKSGMUYbSsnmyrNrzG0VXTcmIJs
 68rQdoK4If0Nw==
Subject: [Nouveau] [PATCH 07/16] nouveau: make nvkm_vmm_ctor() and
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
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
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
