Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA4354F79
	for <lists+nouveau@lfdr.de>; Tue,  6 Apr 2021 11:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEDB6E303;
	Tue,  6 Apr 2021 09:09:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9906E0AC;
 Tue,  6 Apr 2021 09:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 579A1B308;
 Tue,  6 Apr 2021 09:09:06 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Date: Tue,  6 Apr 2021 11:08:56 +0200
Message-Id: <20210406090903.7019-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406090903.7019-1-tzimmermann@suse.de>
References: <20210406090903.7019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 1/8] drm/ttm: Don't override vm_ops callbacks,
 if set
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
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Drivers may want to set their own callbacks for a VM area. Only set
TTM's callbacks if the vm_ops field is clear.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b31b18058965..bf4a213bc66c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -534,7 +534,12 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *bdev,
 
 static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_struct *vma)
 {
-	vma->vm_ops = &ttm_bo_vm_ops;
+	/*
+	 * Drivers may want to override the vm_ops field. Otherwise we
+	 * use TTM's default callbacks.
+	 */
+	if (!vma->vm_ops)
+		vma->vm_ops = &ttm_bo_vm_ops;
 
 	/*
 	 * Note: We're transferring the bo reference to
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
