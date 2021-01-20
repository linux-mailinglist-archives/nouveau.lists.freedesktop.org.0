Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7A2FC68D
	for <lists+nouveau@lfdr.de>; Wed, 20 Jan 2021 02:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC186E14B;
	Wed, 20 Jan 2021 01:27:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E476F6E14B;
 Wed, 20 Jan 2021 01:27:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E009523428;
 Wed, 20 Jan 2021 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106055;
 bh=0vaSpt8UTfCAODmVo1G0Aj3+/qvjp3OxCQURV5qPFAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TlRetnLxyhAVGNxWnccnyWlk3kjrz3iJ3pkhkHkKPwF9a5HmM/hLKugkoPv3d7DzH
 ZYn7xQKdftTAauc93FRwjYh+HbKMYC4Dt7HLM4ClQoxKcwZVR17hgjxdYTSa3GeOJD
 6pUdccF3QhFjsUZh20uQ9lZ4F8XRIkQ0SZugEDI1A5gEkqLMRAC0KI/VY5AK/2+4l2
 e3bpQzxyf56piyxJk9yPCDaCgh/j2GTv87vK+dkB6DSWy9qTd1TwJ6G59CB7fhveME
 Sf+uqH4pTyua0zH8f/UQUJSyRMyFTZZ8wECP4SePbY8tKk6ny7M3Foq8duPk/mIlyT
 80UNxwL2x2vAg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 19 Jan 2021 20:27:00 -0500
Message-Id: <20210120012704.770095-23-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 23/26] drm/nouveau/privring: ack
 interrupts the same way as RM
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

[ Upstream commit e05e06cd34f5311f677294a08b609acfbc315236 ]

Whatever it is that we were doing before doesn't work on Ampere.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c | 10 +++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c
index d80dbc8f09b20..55a4ea4393c62 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "priv.h"
+#include <subdev/timer.h>
 
 static void
 gf100_ibus_intr_hub(struct nvkm_subdev *ibus, int i)
@@ -31,7 +32,6 @@ gf100_ibus_intr_hub(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x122124 + (i * 0x0400));
 	u32 stat = nvkm_rd32(device, 0x122128 + (i * 0x0400));
 	nvkm_debug(ibus, "HUB%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x122128 + (i * 0x0400), 0x00000200, 0x00000000);
 }
 
 static void
@@ -42,7 +42,6 @@ gf100_ibus_intr_rop(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x124124 + (i * 0x0400));
 	u32 stat = nvkm_rd32(device, 0x124128 + (i * 0x0400));
 	nvkm_debug(ibus, "ROP%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x124128 + (i * 0x0400), 0x00000200, 0x00000000);
 }
 
 static void
@@ -53,7 +52,6 @@ gf100_ibus_intr_gpc(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x128124 + (i * 0x0400));
 	u32 stat = nvkm_rd32(device, 0x128128 + (i * 0x0400));
 	nvkm_debug(ibus, "GPC%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x128128 + (i * 0x0400), 0x00000200, 0x00000000);
 }
 
 void
@@ -90,6 +88,12 @@ gf100_ibus_intr(struct nvkm_subdev *ibus)
 			intr1 &= ~stat;
 		}
 	}
+
+	nvkm_mask(device, 0x121c4c, 0x0000003f, 0x00000002);
+	nvkm_msec(device, 2000,
+		if (!(nvkm_rd32(device, 0x121c4c) & 0x0000003f))
+			break;
+	);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c
index 9025ed1bd2a99..4caf3ef087e1d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "priv.h"
+#include <subdev/timer.h>
 
 static void
 gk104_ibus_intr_hub(struct nvkm_subdev *ibus, int i)
@@ -31,7 +32,6 @@ gk104_ibus_intr_hub(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x122124 + (i * 0x0800));
 	u32 stat = nvkm_rd32(device, 0x122128 + (i * 0x0800));
 	nvkm_debug(ibus, "HUB%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x122128 + (i * 0x0800), 0x00000200, 0x00000000);
 }
 
 static void
@@ -42,7 +42,6 @@ gk104_ibus_intr_rop(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x124124 + (i * 0x0800));
 	u32 stat = nvkm_rd32(device, 0x124128 + (i * 0x0800));
 	nvkm_debug(ibus, "ROP%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x124128 + (i * 0x0800), 0x00000200, 0x00000000);
 }
 
 static void
@@ -53,7 +52,6 @@ gk104_ibus_intr_gpc(struct nvkm_subdev *ibus, int i)
 	u32 data = nvkm_rd32(device, 0x128124 + (i * 0x0800));
 	u32 stat = nvkm_rd32(device, 0x128128 + (i * 0x0800));
 	nvkm_debug(ibus, "GPC%d: %06x %08x (%08x)\n", i, addr, data, stat);
-	nvkm_mask(device, 0x128128 + (i * 0x0800), 0x00000200, 0x00000000);
 }
 
 void
@@ -90,6 +88,12 @@ gk104_ibus_intr(struct nvkm_subdev *ibus)
 			intr1 &= ~stat;
 		}
 	}
+
+	nvkm_mask(device, 0x12004c, 0x0000003f, 0x00000002);
+	nvkm_msec(device, 2000,
+		if (!(nvkm_rd32(device, 0x12004c) & 0x0000003f))
+			break;
+	);
 }
 
 static int
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
