Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AEB358586
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 16:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73F56EB17;
	Thu,  8 Apr 2021 14:01:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0E6EB10;
 Thu,  8 Apr 2021 14:01:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0DC2B112;
 Thu,  8 Apr 2021 14:01:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Date: Thu,  8 Apr 2021 16:01:39 +0200
Message-Id: <20210408140139.27731-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408140139.27731-1-tzimmermann@suse.de>
References: <20210408140139.27731-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 4/4] drm/qxl: Use drm_gem_ttm_dumb_map_offset()
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

Qxl now uses drm_gem_ttm_dumb_map_offset() to implement struct
drm_driver.dumb_map_offset.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/qxl/qxl_drv.c    |  3 ++-
 drivers/gpu/drm/qxl/qxl_drv.h    |  3 ---
 drivers/gpu/drm/qxl/qxl_dumb.c   | 17 -----------------
 drivers/gpu/drm/qxl/qxl_ioctl.c  |  4 ++--
 drivers/gpu/drm/qxl/qxl_object.h |  5 -----
 5 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1864467f1063..db92eec07d96 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
@@ -271,7 +272,7 @@ static struct drm_driver qxl_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
 	.dumb_create = qxl_mode_dumb_create,
-	.dumb_map_offset = qxl_mode_dumb_mmap,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = qxl_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 6dd57cfb2e7c..20a0f3ab84ad 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -330,9 +330,6 @@ void qxl_bo_force_delete(struct qxl_device *qdev);
 int qxl_mode_dumb_create(struct drm_file *file_priv,
 			 struct drm_device *dev,
 			 struct drm_mode_create_dumb *args);
-int qxl_mode_dumb_mmap(struct drm_file *filp,
-		       struct drm_device *dev,
-		       uint32_t handle, uint64_t *offset_p);
 
 /* qxl ttm */
 int qxl_ttm_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 48a58ba1db96..a635d9fdf8ac 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -69,20 +69,3 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	args->handle = handle;
 	return 0;
 }
-
-int qxl_mode_dumb_mmap(struct drm_file *file_priv,
-		       struct drm_device *dev,
-		       uint32_t handle, uint64_t *offset_p)
-{
-	struct drm_gem_object *gobj;
-	struct qxl_bo *qobj;
-
-	BUG_ON(!offset_p);
-	gobj = drm_gem_object_lookup(file_priv, handle);
-	if (gobj == NULL)
-		return -ENOENT;
-	qobj = gem_to_qxl_bo(gobj);
-	*offset_p = qxl_bo_mmap_offset(qobj);
-	drm_gem_object_put(gobj);
-	return 0;
-}
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index b6075f452b9e..38aabcbe2238 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -67,8 +67,8 @@ static int qxl_map_ioctl(struct drm_device *dev, void *data,
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_map *qxl_map = data;
 
-	return qxl_mode_dumb_mmap(file_priv, &qdev->ddev, qxl_map->handle,
-				  &qxl_map->offset);
+	return drm_gem_ttm_dumb_map_offset(file_priv, &qdev->ddev, qxl_map->handle,
+					   &qxl_map->offset);
 }
 
 struct qxl_reloc_info {
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index ee9c29de4d3d..cee4b52b75dd 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -53,11 +53,6 @@ static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 	return bo->tbo.base.size;
 }
 
-static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
-{
-	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
-}
-
 extern int qxl_bo_create(struct qxl_device *qdev,
 			 unsigned long size,
 			 bool kernel, bool pinned, u32 domain,
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
