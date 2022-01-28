Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6E4A01A7
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 21:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAF810E4D7;
	Fri, 28 Jan 2022 20:10:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743C112380;
 Fri, 28 Jan 2022 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358978; x=1674894978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdEBKEgCbzDLgcRVHEuyBIgwVSj/xSLV6fZSXsJ5tNA=;
 b=AtP2tp2y6zGd1j6OlOwZTrgL6jMiXZGakSl9wvGv0gEshoYuYHcuC5/3
 1MCqNcL2XTraVaJK5OJVXA1u5P9C+3uqSz8qoj62cNirqcjfmHBcmS2IS
 zcjKrlHvRKtsYaYAFWvRVUnoZ2U7vO6Dcr0PFo1uRkY0g/p3lv9Mb4ecR
 ZB/piDfi2XUGwrUBoGFZBwVU9NLQkGWiK42vA6ZELq5plw4k2HpZLeTDc
 YH1e+L9TehaTn8fDvgwzlOLREMILAnUYHytxKXyfc+jNmXJeM8Ypgij48
 BDRGH4dxG1SzkuF7ja6NJAqtFrDhTaiZm9nwa8Pxv678991t2ebAdxgKc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="333430485"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="333430485"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788750"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 00:36:20 -0800
Message-Id: <20220128083626.3012259-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 20:10:03 +0000
Subject: [Nouveau] [PATCH 08/14] drm/msm: Replace dma-buf-map with iosys-map
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
Cc: airlied@linux.ie, christian.koenig@amd.com, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in msm.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/msm/msm_drv.h       | 4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..ae52412d529a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -309,8 +309,8 @@ void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
-int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index fc94e061d6a7..e8f1b7a2ca9c 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -22,19 +22,19 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
 }
 
-int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	void *vaddr;
 
 	vaddr = msm_gem_get_vaddr(obj);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
-	dma_buf_map_set_vaddr(map, vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
 
-void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	msm_gem_put_vaddr(obj);
 }
-- 
2.35.0

