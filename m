Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0F29FB6A
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 03:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BF36E937;
	Fri, 30 Oct 2020 02:37:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173156E937
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 02:37:02 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b7c580001>; Thu, 29 Oct 2020 19:37:12 -0700
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 02:37:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Date: Fri, 30 Oct 2020 13:36:41 +1100
Message-ID: <20201030023645.10114-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030023645.10114-1-apopple@nvidia.com>
References: <20201030023645.10114-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604025432; bh=FETdOrQN+IAj7+DkO4BCcs43/+LuQnv8axAob2kFIv0=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=lFz9fxabFt6W29XSbP5PCLAyCduu1YyhpKicZ1+WccmbGmeXU4FtnvMcaGhE9DX/+
 CKQRfqwnH/WtpYLMTcj6m3vdjVAIAeZJPM+eTv6+ay3nKJ+70bMmJvPWixhaP6zcxH
 3RE6FC2ltMn3ulYtZuFXu3o/KCcPSiKkp7zPJqfrDbNZ8yz6jaQVSI8G4SsjjzQhps
 AJfmNw5D2+fQvxj3CD/bMQdM9OTe5CmhZbrjsXCqPyJEgvvWIYg5VsKITOxySZoe3h
 CIF8KvgqkzjZ6a6nH54GHhihvXPJKzU94TBcO4F9rjGDUvPjsUTUPJs7ZS4pqNI5+T
 /RGhvZjq4Q/Pg==
Subject: [Nouveau] [PATCH 1/5] drm/nouveau: Fix MMU fault interrupts on
 Turing
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

Turing reports MMU fault interrupts via new top level interrupt
registers. The old PMC MMU interrupt vector is not used by the HW. This
means we can remap the new top-level MMU interrupt to the exisiting PMC
MMU bit which simplifies the implementation until all interrupts are
moved over to using the new top level registers.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/fault/tu102.c |  21 +++-
 .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    | 107 +++++++++++++++++-
 2 files changed, 122 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
index 45a6a68b9f48..f080051b0c65 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
@@ -22,6 +22,7 @@
 #include "priv.h"
 
 #include <core/memory.h>
+#include <subdev/mc.h>
 #include <subdev/mmu.h>
 #include <engine/fifo.h>
 
@@ -34,6 +35,9 @@ tu102_fault_buffer_intr(struct nvkm_fault_buffer *buffer, bool enable)
 	 *     which don't appear to actually work anymore, but newer
 	 *     versions of RM don't appear to touch anything at all..
 	 */
+	struct nvkm_device *device = buffer->fault->subdev.device;
+
+	nvkm_mc_intr_mask(device, NVKM_SUBDEV_FAULT, enable);
 }
 
 static void
@@ -41,6 +45,11 @@ tu102_fault_buffer_fini(struct nvkm_fault_buffer *buffer)
 {
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	const u32 foff = buffer->id * 0x20;
+
+	/* Disable the fault interrupts */
+	nvkm_wr32(device, 0xb81408, 0x1);
+	nvkm_wr32(device, 0xb81410, 0x10);
+
 	nvkm_mask(device, 0xb83010 + foff, 0x80000000, 0x00000000);
 }
 
@@ -50,6 +59,10 @@ tu102_fault_buffer_init(struct nvkm_fault_buffer *buffer)
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	const u32 foff = buffer->id * 0x20;
 
+	/* Enable the fault interrupts */
+	nvkm_wr32(device, 0xb81208, 0x1);
+	nvkm_wr32(device, 0xb81210, 0x10);
+
 	nvkm_mask(device, 0xb83010 + foff, 0xc0000000, 0x40000000);
 	nvkm_wr32(device, 0xb83004 + foff, upper_32_bits(buffer->addr));
 	nvkm_wr32(device, 0xb83000 + foff, lower_32_bits(buffer->addr));
@@ -109,14 +122,20 @@ tu102_fault_intr(struct nvkm_fault *fault)
 	}
 
 	if (stat & 0x00000200) {
+		/* Clear the associated interrupt flag */
+		nvkm_wr32(device, 0xb81010, 0x10);
+
 		if (fault->buffer[0]) {
 			nvkm_event_send(&fault->event, 1, 0, NULL, 0);
 			stat &= ~0x00000200;
 		}
 	}
 
-	/*XXX: guess, can't confirm until we get fw... */
+	/* Replayable MMU fault */
 	if (stat & 0x00000100) {
+		/* Clear the associated interrupt flag */
+		nvkm_wr32(device, 0xb81008, 0x1);
+
 		if (fault->buffer[1]) {
 			nvkm_event_send(&fault->event, 1, 1, NULL, 0);
 			stat &= ~0x00000100;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
index d098c44a4fcb..cda924d56a2a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -19,13 +19,93 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#define tu102_mc(p) container_of((p), struct tu102_mc, base)
 #include "priv.h"
 
+struct tu102_mc {
+	struct nvkm_mc base;
+	spinlock_t lock;
+	bool intr;
+	u32 mask;
+};
+
+static void
+tu102_mc_intr_update(struct tu102_mc *mc)
+{
+	struct nvkm_device *device = mc->base.subdev.device;
+	u32 mask = mc->intr ? mc->mask : 0, i;
+
+	for (i = 0; i < 2; i++) {
+		nvkm_wr32(device, 0x000180 + (i * 0x04), ~mask);
+		nvkm_wr32(device, 0x000160 + (i * 0x04),  mask);
+	}
+
+	if (mask & 0x00000200)
+		nvkm_wr32(device, 0xb81608, 0x6);
+	else
+		nvkm_wr32(device, 0xb81610, 0x6);
+}
+
+void
+tu102_mc_intr_unarm(struct nvkm_mc *base)
+{
+	struct tu102_mc *mc = tu102_mc(base);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mc->lock, flags);
+	mc->intr = false;
+	tu102_mc_intr_update(mc);
+	spin_unlock_irqrestore(&mc->lock, flags);
+}
+
+void
+tu102_mc_intr_rearm(struct nvkm_mc *base)
+{
+	struct tu102_mc *mc = tu102_mc(base);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mc->lock, flags);
+	mc->intr = true;
+	tu102_mc_intr_update(mc);
+	spin_unlock_irqrestore(&mc->lock, flags);
+}
+
+void
+tu102_mc_intr_mask(struct nvkm_mc *base, u32 mask, u32 intr)
+{
+	struct tu102_mc *mc = tu102_mc(base);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mc->lock, flags);
+	mc->mask = (mc->mask & ~mask) | intr;
+	tu102_mc_intr_update(mc);
+	spin_unlock_irqrestore(&mc->lock, flags);
+}
+
+static u32
+tu102_mc_intr_stat(struct nvkm_mc *mc)
+{
+	struct nvkm_device *device = mc->subdev.device;
+	u32 intr0 = nvkm_rd32(device, 0x000100);
+	u32 intr1 = nvkm_rd32(device, 0x000104);
+	u32 intr_top = nvkm_rd32(device, 0xb81600);
+
+	/* Turing and above route the MMU fault interrupts via a different
+	 * interrupt tree with different control registers. For the moment remap
+	 * them back to the old PMC vector.
+	 */
+	if (intr_top & 0x00000006)
+		intr0 |= 0x00000200;
+
+	return intr0 | intr1;
+}
+
 static void
 tu102_mc_intr_hack(struct nvkm_mc *mc, bool *handled)
 {
 	struct nvkm_device *device = mc->subdev.device;
 	u32 stat = nvkm_rd32(device, 0xb81010);
+
 	if (stat & 0x00000050) {
 		struct nvkm_subdev *subdev =
 			nvkm_device_subdev(device, NVKM_SUBDEV_FAULT);
@@ -40,16 +120,33 @@ static const struct nvkm_mc_func
 tu102_mc = {
 	.init = nv50_mc_init,
 	.intr = gp100_mc_intr,
-	.intr_unarm = gp100_mc_intr_unarm,
-	.intr_rearm = gp100_mc_intr_rearm,
-	.intr_mask = gp100_mc_intr_mask,
-	.intr_stat = gf100_mc_intr_stat,
+	.intr_unarm = tu102_mc_intr_unarm,
+	.intr_rearm = tu102_mc_intr_rearm,
+	.intr_mask = tu102_mc_intr_mask,
+	.intr_stat = tu102_mc_intr_stat,
 	.intr_hack = tu102_mc_intr_hack,
 	.reset = gk104_mc_reset,
 };
 
+int
+tu102_mc_new_(const struct nvkm_mc_func *func, struct nvkm_device *device,
+	      int index, struct nvkm_mc **pmc)
+{
+	struct tu102_mc *mc;
+
+	if (!(mc = kzalloc(sizeof(*mc), GFP_KERNEL)))
+		return -ENOMEM;
+	nvkm_mc_ctor(func, device, index, &mc->base);
+	*pmc = &mc->base;
+
+	spin_lock_init(&mc->lock);
+	mc->intr = false;
+	mc->mask = 0x7fffffff;
+	return 0;
+}
+
 int
 tu102_mc_new(struct nvkm_device *device, int index, struct nvkm_mc **pmc)
 {
-	return gp100_mc_new_(&tu102_mc, device, index, pmc);
+	return tu102_mc_new_(&tu102_mc, device, index, pmc);
 }
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
