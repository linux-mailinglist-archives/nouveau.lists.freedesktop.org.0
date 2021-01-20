Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833CC2FC693
	for <lists+nouveau@lfdr.de>; Wed, 20 Jan 2021 02:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74646E872;
	Wed, 20 Jan 2021 01:27:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BABF6E14F;
 Wed, 20 Jan 2021 01:27:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 593E023110;
 Wed, 20 Jan 2021 01:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106058;
 bh=5WUoD5zwsd4RXHHGhCQkpJlGUZLtx2s2ZRLAwnOOOLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SuTTLznrU/TEuXuKo3pW8hCkiFcFrmsh4iuHNiLOEBhyG+OzaMdHgoAtXSaF6405v
 rfYiRCSpVfJ6bL5i1nyuvjj+n4HRjQV+Tdof6HZjwTPU8IK2Zb2KziooOQjzKloNXA
 AbnKiHoRfgGLBoCfq47Qn6nkd5OE91BQ55x8OOgP9vp//r/8aFpP6MMlxbQbIHw/EJ
 2wBTbDHPLlp46aevLTmtIds/JMo7rUK3B0QtZU7zZzF31MgJV+NpyZ//nnI2pBLVmM
 TTXRig5Xj/xyHJ5E9m/98vL9dfMdtNPWA3ffsrQduy2dH00PyT9hDLGUBzmg7iSmVj
 co8u5eMz7BMpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 19 Jan 2021 20:27:02 -0500
Message-Id: <20210120012704.770095-25-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 25/26] drm/nouveau/mmu: fix vram heap
 sizing
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit add42781ad76c5ae65127bf13852a4c6b2f08849 ]

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index ee11ccaf0563c..cb51e248cb41b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -316,9 +316,9 @@ nvkm_mmu_vram(struct nvkm_mmu *mmu)
 {
 	struct nvkm_device *device = mmu->subdev.device;
 	struct nvkm_mm *mm = &device->fb->ram->vram;
-	const u32 sizeN = nvkm_mm_heap_size(mm, NVKM_RAM_MM_NORMAL);
-	const u32 sizeU = nvkm_mm_heap_size(mm, NVKM_RAM_MM_NOMAP);
-	const u32 sizeM = nvkm_mm_heap_size(mm, NVKM_RAM_MM_MIXED);
+	const u64 sizeN = nvkm_mm_heap_size(mm, NVKM_RAM_MM_NORMAL);
+	const u64 sizeU = nvkm_mm_heap_size(mm, NVKM_RAM_MM_NOMAP);
+	const u64 sizeM = nvkm_mm_heap_size(mm, NVKM_RAM_MM_MIXED);
 	u8 type = NVKM_MEM_KIND * !!mmu->func->kind;
 	u8 heap = NVKM_MEM_VRAM;
 	int heapM, heapN, heapU;
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
