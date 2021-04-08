Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB55358589
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 16:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE296EB22;
	Thu,  8 Apr 2021 14:01:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976E6EB0F;
 Thu,  8 Apr 2021 14:01:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A06FB08C;
 Thu,  8 Apr 2021 14:01:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Date: Thu,  8 Apr 2021 16:01:38 +0200
Message-Id: <20210408140139.27731-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408140139.27731-1-tzimmermann@suse.de>
References: <20210408140139.27731-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 3/4] drm/nouveau: Use
 drm_gem_ttm_dumb_map_offset()
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>,
 spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Nouveau now uses drm_gem_ttm_dumb_map_offset() to implement
struct drm_driver.dumb_map_offset.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 18 ------------------
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 --
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  3 ++-
 3 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index dac02c7be54d..14101bd2a0ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -838,21 +838,3 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	drm_gem_object_put(&bo->bo.base);
 	return ret;
 }
-
-int
-nouveau_display_dumb_map_offset(struct drm_file *file_priv,
-				struct drm_device *dev,
-				uint32_t handle, uint64_t *poffset)
-{
-	struct drm_gem_object *gem;
-
-	gem = drm_gem_object_lookup(file_priv, handle);
-	if (gem) {
-		struct nouveau_bo *bo = nouveau_gem_object(gem);
-		*poffset = drm_vma_node_offset_addr(&bo->bo.base.vma_node);
-		drm_gem_object_put(gem);
-		return 0;
-	}
-
-	return -ENOENT;
-}
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 616c43427059..2ab2ddb1eadf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -58,8 +58,6 @@ bool nouveau_display_scanoutpos(struct drm_crtc *crtc,
 
 int  nouveau_display_dumb_create(struct drm_file *, struct drm_device *,
 				 struct drm_mode_create_dumb *args);
-int  nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
-				     u32 handle, u64 *offset);
 
 void nouveau_hdmi_mode_set(struct drm_encoder *, struct drm_display_mode *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 885815ea917f..9766218a99ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -31,6 +31,7 @@
 #include <linux/mmu_notifier.h>
 
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
 
@@ -1212,7 +1213,7 @@ driver_stub = {
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
 
 	.dumb_create = nouveau_display_dumb_create,
-	.dumb_map_offset = nouveau_display_dumb_map_offset,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
