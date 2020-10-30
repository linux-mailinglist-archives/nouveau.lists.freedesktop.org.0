Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0629FB6B
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 03:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D916E93F;
	Fri, 30 Oct 2020 02:37:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562C6E93F
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 02:37:07 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b7c570000>; Thu, 29 Oct 2020 19:37:11 -0700
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 02:37:03 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Date: Fri, 30 Oct 2020 13:36:42 +1100
Message-ID: <20201030023645.10114-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030023645.10114-1-apopple@nvidia.com>
References: <20201030023645.10114-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604025431; bh=iA0tFGDnpbiQP/EY2auPrMKvOlG7phowhI2w1gEO8dI=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=PrSiXWaYY9XHl33Ph3lc1WHxBtx1D4lvU15pp7bx1+ivUHtVi/MZVxTTTrC4Qg9aY
 M+QjVSDkGUgmSJPhZiPe06KBEwGU/EQv8x7ZGq1JqYkdAXK7qszWJnxNqHc/Ef72Ok
 Zc+o7zkwcC+MzaQbY945mpX6d1ThoH7nrd0hRe5vNNePJN38ur6uWUboUCOYzWZlA8
 BKGug7KxlS3HotzDjHEGdtY+Wt1/fY4cD4SqMdiDMzl9qWG8tkc9vKR+amJxCoaW5s
 m5uTPQeTCXzqws8SU6sLeXtOzF2gsMRTnU+M7O7+cAIUG5fcj7EaxiOTQ174taE2NA
 ovg+/2Vi4rkew==
Subject: [Nouveau] [PATCH 2/5] drm/nouveau: Remove Turing interrupt hack
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
Cc: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is no longer needed now that tu102_mc_intr_stat has been updated to
look at the correct top-level interrupt bits.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c  |  3 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h  |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c | 16 ----------------
 3 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
index 0e57ab2a709f..09f669ac6630 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
@@ -108,9 +108,6 @@ nvkm_mc_intr(struct nvkm_device *device, bool *handled)
 	if (stat)
 		nvkm_error(&mc->subdev, "intr %08x\n", stat);
 	*handled = intr != 0;
-
-	if (mc->func->intr_hack)
-		mc->func->intr_hack(mc, handled);
 }
 
 static u32
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
index 4aab753a6040..0d01b2c419ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
@@ -26,7 +26,6 @@ struct nvkm_mc_func {
 	void (*intr_mask)(struct nvkm_mc *, u32 mask, u32 stat);
 	/* retrieve pending interrupt mask (NV_PMC_INTR) */
 	u32 (*intr_stat)(struct nvkm_mc *);
-	void (*intr_hack)(struct nvkm_mc *, bool *handled);
 	const struct nvkm_mc_map *reset;
 	void (*unk260)(struct nvkm_mc *, u32);
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
index cda924d56a2a..af0afd1ad6ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -100,21 +100,6 @@ tu102_mc_intr_stat(struct nvkm_mc *mc)
 	return intr0 | intr1;
 }
 
-static void
-tu102_mc_intr_hack(struct nvkm_mc *mc, bool *handled)
-{
-	struct nvkm_device *device = mc->subdev.device;
-	u32 stat = nvkm_rd32(device, 0xb81010);
-
-	if (stat & 0x00000050) {
-		struct nvkm_subdev *subdev =
-			nvkm_device_subdev(device, NVKM_SUBDEV_FAULT);
-		nvkm_wr32(device, 0xb81010, stat & 0x00000050);
-		if (subdev)
-			nvkm_subdev_intr(subdev);
-		*handled = true;
-	}
-}
 
 static const struct nvkm_mc_func
 tu102_mc = {
@@ -124,7 +109,6 @@ tu102_mc = {
 	.intr_rearm = tu102_mc_intr_rearm,
 	.intr_mask = tu102_mc_intr_mask,
 	.intr_stat = tu102_mc_intr_stat,
-	.intr_hack = tu102_mc_intr_hack,
 	.reset = gk104_mc_reset,
 };
 
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
