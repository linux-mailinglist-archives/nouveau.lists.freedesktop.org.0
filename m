Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EF38207B
	for <lists+nouveau@lfdr.de>; Sun, 16 May 2021 20:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9746E20E;
	Sun, 16 May 2021 18:59:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232A96E846;
 Sun, 16 May 2021 18:59:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3011FB136;
 Sun, 16 May 2021 18:59:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, bskeggs@redhat.com
Date: Sun, 16 May 2021 20:59:35 +0200
Message-Id: <20210516185937.5644-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516185937.5644-1-tzimmermann@suse.de>
References: <20210516185937.5644-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 1/3] drm/i915: Don't include drm_legacy.h
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

i915 does not use DRM legacy code. Remove the rsp include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 1 -
 drivers/gpu/drm/i915/i915_drv.h          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 81dc2bf59bc3..51a05e62875d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -8,7 +8,6 @@
 #include <linux/shmem_fs.h>
 #include <linux/swap.h>
 
-#include <drm/drm.h> /* for drm_legacy.h! */
 #include <drm/drm_cache.h>
 
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 61308ce19059..bcc6f0133150 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -51,7 +51,6 @@
 #include <linux/xarray.h>
 
 #include <drm/intel-gtt.h>
-#include <drm/drm_legacy.h> /* for struct drm_dma_handle */
 #include <drm/drm_gem.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_cache.h>
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
