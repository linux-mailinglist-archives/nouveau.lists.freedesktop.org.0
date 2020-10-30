Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0929FB6E
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 03:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F656E947;
	Fri, 30 Oct 2020 02:37:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F96E947
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 02:37:10 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b7c580000>; Thu, 29 Oct 2020 19:37:12 -0700
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 02:37:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Date: Fri, 30 Oct 2020 13:36:44 +1100
Message-ID: <20201030023645.10114-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030023645.10114-1-apopple@nvidia.com>
References: <20201030023645.10114-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604025432; bh=kZD3FE2/ITWTXUQyTpw1uF7NyzvUJvQmrjpkx//FWCg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=dpZjigENrCXg6yxhmZx/JPRUuWGCk4DtyXmx1CoXO3b4be8UaMvfy2wI+OCQd1mlB
 sYE5aF+2eaf89jyWno/y3TBUBeflWnu7CSRHgPecT2rwVVPQQu3kuvHDcPmwXLRfxk
 VWAYTxSF6IieaZjVV9zDdc9Df5O8N9dR+T34XqNP91RQ+SRGhEmqw6vihJoPof2aXc
 HE8tkr+p7R5/nEPAf2cJMLP+sN0FVxkI4dMzKwQLtRaCft1QmxVEz9Rx9SAcTnRpPd
 czekwssxHd+bqRryDtbnBE8hiaZZrub/skgGjuDkNVqU+074uz2PRVLKbDyOZLW+85
 8yVze0+K0mw9Q==
Subject: [Nouveau] [PATCH 4/5] drm/nouveau: FIFO interrupt fixes for Turing
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

Some of the low level FIFO interrupt status bits have changed for
Turing. Update the handling of these to match the hardware.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 78 +++----------------
 1 file changed, 9 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 2924381a6b3c..f2f20a25182f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -393,40 +393,21 @@ tu102_fifo_fault(struct nvkm_fifo *base, struct nvkm_fault_data *info)
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
 }
 
-static const struct nvkm_enum
-tu102_fifo_sched_reason[] = {
-	{ 0x0a, "CTXSW_TIMEOUT" },
-	{}
-};
-
 static void
-tu102_fifo_intr_sched_ctxsw(struct gk104_fifo *fifo)
+tu102_fifo_intr_ctxsw_timeout(struct gk104_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->base.engine.subdev.device;
-	unsigned long flags, engm = 0;
+	unsigned long flags, engm;
 	u32 engn;
 
-	/* We need to ACK the SCHED_ERROR here, and prevent it reasserting,
-	 * as MMU_FAULT cannot be triggered while it's pending.
-	 */
 	spin_lock_irqsave(&fifo->base.lock, flags);
-	nvkm_mask(device, 0x002140, 0x00000100, 0x00000000);
-	nvkm_wr32(device, 0x002100, 0x00000100);
 
-	for (engn = 0; engn < fifo->engine_nr; engn++) {
-		struct gk104_fifo_engine_status status;
+	engm = nvkm_rd32(device, 0x2a30);
+	nvkm_wr32(device, 0x2a30, engm);
 
-		gk104_fifo_engine_status(fifo, engn, &status);
-		if (!status.busy || !status.chsw)
-			continue;
-
-		engm |= BIT(engn);
-	}
-
-	for_each_set_bit(engn, &engm, fifo->engine_nr)
+	for_each_set_bit(engn, &engm, 32)
 		tu102_fifo_recover_engn(fifo, engn);
 
-	nvkm_mask(device, 0x002140, 0x00000100, 0x00000100);
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
 }
 
@@ -437,18 +418,8 @@ tu102_fifo_intr_sched(struct gk104_fifo *fifo)
 	struct nvkm_device *device = subdev->device;
 	u32 intr = nvkm_rd32(device, 0x00254c);
 	u32 code = intr & 0x000000ff;
-	const struct nvkm_enum *en =
-		nvkm_enum_find(tu102_fifo_sched_reason, code);
-
-	nvkm_error(subdev, "SCHED_ERROR %02x [%s]\n", code, en ? en->name : "");
 
-	switch (code) {
-	case 0x0a:
-		tu102_fifo_intr_sched_ctxsw(fifo);
-		break;
-	default:
-		break;
-	}
+	nvkm_error(subdev, "SCHED_ERROR %02x\n", code);
 }
 
 static void
@@ -466,10 +437,9 @@ tu102_fifo_intr(struct nvkm_fifo *base)
 		stat &= ~0x00000001;
 	}
 
-	if (stat & 0x00000010) {
-		nvkm_error(subdev, "PIO_ERROR\n");
-		nvkm_wr32(device, 0x002100, 0x00000010);
-		stat &= ~0x00000010;
+	if (stat & 0x00000002) {
+		tu102_fifo_intr_ctxsw_timeout(fifo);
+		stat &= ~0x00000002;
 	}
 
 	if (stat & 0x00000100) {
@@ -484,36 +454,6 @@ tu102_fifo_intr(struct nvkm_fifo *base)
 		stat &= ~0x00010000;
 	}
 
-	if (stat & 0x00800000) {
-		nvkm_error(subdev, "FB_FLUSH_TIMEOUT\n");
-		nvkm_wr32(device, 0x002100, 0x00800000);
-		stat &= ~0x00800000;
-	}
-
-	if (stat & 0x01000000) {
-		nvkm_error(subdev, "LB_ERROR\n");
-		nvkm_wr32(device, 0x002100, 0x01000000);
-		stat &= ~0x01000000;
-	}
-
-	if (stat & 0x08000000) {
-		gk104_fifo_intr_dropped_fault(fifo);
-		nvkm_wr32(device, 0x002100, 0x08000000);
-		stat &= ~0x08000000;
-	}
-
-	if (stat & 0x10000000) {
-		u32 mask = nvkm_rd32(device, 0x00259c);
-
-		while (mask) {
-			u32 unit = __ffs(mask);
-			fifo->func->intr.fault(&fifo->base, unit);
-			nvkm_wr32(device, 0x00259c, (1 << unit));
-			mask &= ~(1 << unit);
-		}
-		stat &= ~0x10000000;
-	}
-
 	if (stat & 0x20000000) {
 		u32 mask = nvkm_rd32(device, 0x0025a0);
 
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
