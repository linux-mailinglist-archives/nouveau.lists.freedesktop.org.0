Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB7F362111
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 15:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24E96EB0A;
	Fri, 16 Apr 2021 13:31:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE966EA75;
 Fri, 16 Apr 2021 13:31:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91C97B12E;
 Fri, 16 Apr 2021 13:31:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Date: Fri, 16 Apr 2021 15:31:45 +0200
Message-Id: <20210416133146.24825-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416133146.24825-1-tzimmermann@suse.de>
References: <20210416133146.24825-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 6/7] drm/vmwgfx: Inline vmw_verify_access()
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

Vmwgfx is the only user of the TTM's verify_access callback. Inline
the call and avoid the indirection through the function pointer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 ---------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   | 7 ++-----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2dc031fe4a90..a079734f9d68 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -658,14 +658,6 @@ static void vmw_evict_flags(struct ttm_buffer_object *bo,
 	*placement = vmw_sys_placement;
 }
 
-static int vmw_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct ttm_object_file *tfile =
-		vmw_fpriv((struct drm_file *)filp->private_data)->tfile;
-
-	return vmw_user_bo_verify_access(bo, tfile);
-}
-
 static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
 {
 	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
@@ -768,7 +760,6 @@ struct ttm_device_funcs vmw_bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
 	.move = vmw_move,
-	.verify_access = vmw_verify_access,
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index c8b6543b4e39..e6b1f98ec99f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -67,6 +67,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
+	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct ttm_device *bdev = &dev_priv->bdev;
 	struct ttm_buffer_object *bo;
 	int ret;
@@ -78,11 +79,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (unlikely(!bo))
 		return -EINVAL;
 
-	if (unlikely(!bo->bdev->funcs->verify_access)) {
-		ret = -EPERM;
-		goto out_unref;
-	}
-	ret = bo->bdev->funcs->verify_access(bo, filp);
+	ret = vmw_user_bo_verify_access(bo, tfile);
 	if (unlikely(ret != 0))
 		goto out_unref;
 
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
