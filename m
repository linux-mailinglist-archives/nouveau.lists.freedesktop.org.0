Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9F36210B
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 15:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB4F6EA97;
	Fri, 16 Apr 2021 13:31:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052066EA3D;
 Fri, 16 Apr 2021 13:31:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 878A6B121;
 Fri, 16 Apr 2021 13:31:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Date: Fri, 16 Apr 2021 15:31:43 +0200
Message-Id: <20210416133146.24825-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416133146.24825-1-tzimmermann@suse.de>
References: <20210416133146.24825-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 4/7] drm/nouveau: Implement mmap as GEM object
 function
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The GEM object function is provided by GEM TTM helpers. Nouveau's
implementation of verify_access is unused and has been removed. Access
permissions are validated by the DRM helpers.

As a side effect, nouveau_ttm_vm_ops and nouveau_ttm_fault() are now
implemented in nouveau's GEM code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 10 ------
 drivers/gpu/drm/nouveau/nouveau_drm.c |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c | 36 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 49 ---------------------------
 drivers/gpu/drm/nouveau/nouveau_ttm.h |  1 -
 5 files changed, 38 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3e09df0472ce..bc67cbccc83b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1051,15 +1051,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	return ret;
 }
 
-static int
-nouveau_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct nouveau_bo *nvbo = nouveau_bo(bo);
-
-	return drm_vma_node_verify_access(&nvbo->bo.base.vma_node,
-					  filp->private_data);
-}
-
 static void
 nouveau_ttm_io_mem_free_locked(struct nouveau_drm *drm,
 			       struct ttm_resource *reg)
@@ -1332,7 +1323,6 @@ struct ttm_device_funcs nouveau_bo_driver = {
 	.evict_flags = nouveau_bo_evict_flags,
 	.delete_mem_notify = nouveau_bo_delete_mem_notify,
 	.move = nouveau_bo_move,
-	.verify_access = nouveau_bo_verify_access,
 	.io_mem_reserve = &nouveau_ttm_io_mem_reserve,
 	.io_mem_free = &nouveau_ttm_io_mem_free,
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 3204fc0a90d2..a616cf4573b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1179,7 +1179,7 @@ nouveau_driver_fops = {
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = nouveau_drm_ioctl,
-	.mmap = nouveau_ttm_mmap,
+	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 #if defined(CONFIG_COMPAT)
@@ -1212,6 +1212,7 @@ driver_stub = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c88cbb85f101..71dfac820c4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -39,6 +39,40 @@
 #include <nvif/class.h>
 #include <nvif/push206e.h>
 
+static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	pgprot_t prot;
+	vm_fault_t ret;
+
+	ret = ttm_bo_vm_reserve(bo, vmf);
+	if (ret)
+		return ret;
+
+	ret = nouveau_ttm_fault_reserve_notify(bo);
+	if (ret)
+		goto error_unlock;
+
+	nouveau_bo_del_io_reserve_lru(bo);
+	prot = vm_get_page_prot(vma->vm_flags);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	nouveau_bo_add_io_reserve_lru(bo);
+	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+		return ret;
+
+error_unlock:
+	dma_resv_unlock(bo->base.resv);
+	return ret;
+}
+
+static const struct vm_operations_struct nouveau_ttm_vm_ops = {
+	.fault = nouveau_ttm_fault,
+	.open = ttm_bo_vm_open,
+	.close = ttm_bo_vm_close,
+	.access = ttm_bo_vm_access
+};
+
 void
 nouveau_gem_object_del(struct drm_gem_object *gem)
 {
@@ -180,6 +214,8 @@ const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
 	.get_sg_table = nouveau_gem_prime_get_sg_table,
 	.vmap = drm_gem_ttm_vmap,
 	.vunmap = drm_gem_ttm_vunmap,
+	.mmap = drm_gem_ttm_mmap,
+	.vm_ops = &nouveau_ttm_vm_ops,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index b81ae90b8449..e511a26379da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -127,55 +127,6 @@ const struct ttm_resource_manager_func nv04_gart_manager = {
 	.free = nouveau_manager_del,
 };
 
-static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	pgprot_t prot;
-	vm_fault_t ret;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	ret = nouveau_ttm_fault_reserve_notify(bo);
-	if (ret)
-		goto error_unlock;
-
-	nouveau_bo_del_io_reserve_lru(bo);
-	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
-	nouveau_bo_add_io_reserve_lru(bo);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-error_unlock:
-	dma_resv_unlock(bo->base.resv);
-	return ret;
-}
-
-static const struct vm_operations_struct nouveau_ttm_vm_ops = {
-	.fault = nouveau_ttm_fault,
-	.open = ttm_bo_vm_open,
-	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
-};
-
-int
-nouveau_ttm_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct nouveau_drm *drm = nouveau_drm(file_priv->minor->dev);
-	int ret;
-
-	ret = ttm_bo_mmap(filp, vma, &drm->ttm.bdev);
-	if (ret)
-		return ret;
-
-	vma->vm_ops = &nouveau_ttm_vm_ops;
-	return 0;
-}
-
 static int
 nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.h b/drivers/gpu/drm/nouveau/nouveau_ttm.h
index dbf6dc238efd..2f0efda7ccdb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.h
@@ -17,7 +17,6 @@ struct ttm_tt *nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo,
 
 int  nouveau_ttm_init(struct nouveau_drm *drm);
 void nouveau_ttm_fini(struct nouveau_drm *drm);
-int  nouveau_ttm_mmap(struct file *, struct vm_area_struct *);
 
 int  nouveau_ttm_global_init(struct nouveau_drm *);
 void nouveau_ttm_global_release(struct nouveau_drm *);
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
