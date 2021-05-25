Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDC3904BA
	for <lists+nouveau@lfdr.de>; Tue, 25 May 2021 17:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495C76EA56;
	Tue, 25 May 2021 15:11:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6836EA47;
 Tue, 25 May 2021 15:11:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621955459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRNsfjIPBSxN+hNIIxuJoDMfD7pJZldFBp2rwH/0mg4=;
 b=0VhIcxrGGcB2iOZ4eEvaxwnzhdV5lgt9xHnITn+XpZh3xInIvQQTGea8OmJKHzLmz1hMNI
 nfVFqyGklL7fZOehMtO1iIutC1JnxLvTftHpxbyW/glUz2DYDgatliXxvw2dcwvp6sbvyH
 DU4om/C/8WkyN6DpSDkc3qFoeo332gY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621955459;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRNsfjIPBSxN+hNIIxuJoDMfD7pJZldFBp2rwH/0mg4=;
 b=5kbyCaIhTy7Lyz3Dap3PhZGVgabgbyIJZQIbIx9cTaTQCmPa8EmkIRR+JTfvVHCjJuFL7R
 Jp+IF6g8DXKGLTAA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9DE5AEEE;
 Tue, 25 May 2021 15:10:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Date: Tue, 25 May 2021 17:10:53 +0200
Message-Id: <20210525151055.8174-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
References: <20210525151055.8174-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into
 vmwgfx driver
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

The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline
the code. The internal helper ttm_bo_vm_lookup() is now also part of
vmwgfx as vmw_bo_vm_lookup().

v2:
	* replace pr_err() with drm_err() (Zack)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 ++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index cb9975889e2f..c8b6543b4e39 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -27,6 +27,32 @@
 
 #include "vmwgfx_drv.h"
 
+static struct ttm_buffer_object *vmw_bo_vm_lookup(struct ttm_device *bdev,
+						  unsigned long offset,
+						  unsigned long pages)
+{
+	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
+	struct drm_device *drm = &dev_priv->drm;
+	struct drm_vma_offset_node *node;
+	struct ttm_buffer_object *bo = NULL;
+
+	drm_vma_offset_lock_lookup(bdev->vma_manager);
+
+	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
+	if (likely(node)) {
+		bo = container_of(node, struct ttm_buffer_object,
+				  base.vma_node);
+		bo = ttm_bo_get_unless_zero(bo);
+	}
+
+	drm_vma_offset_unlock_lookup(bdev->vma_manager);
+
+	if (!bo)
+		drm_err(drm, "Could not find buffer object to map\n");
+
+	return bo;
+}
+
 int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	static const struct vm_operations_struct vmw_vm_ops = {
@@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
-	int ret = ttm_bo_mmap(filp, vma, &dev_priv->bdev);
+	struct ttm_device *bdev = &dev_priv->bdev;
+	struct ttm_buffer_object *bo;
+	int ret;
+
+	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
+		return -EINVAL;
+
+	bo = vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_pages(vma));
+	if (unlikely(!bo))
+		return -EINVAL;
 
-	if (ret)
-		return ret;
+	if (unlikely(!bo->bdev->funcs->verify_access)) {
+		ret = -EPERM;
+		goto out_unref;
+	}
+	ret = bo->bdev->funcs->verify_access(bo, filp);
+	if (unlikely(ret != 0))
+		goto out_unref;
+
+	ret = ttm_bo_mmap_obj(vma, bo);
+	if (unlikely(ret != 0))
+		goto out_unref;
 
 	vma->vm_ops = &vmw_vm_ops;
 
@@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (!is_cow_mapping(vma->vm_flags))
 		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
 
+	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
+
 	return 0;
+
+out_unref:
+	ttm_bo_put(bo);
+	return ret;
 }
 
 /* struct vmw_validation_mem callback */
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
