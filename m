Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1A4464E4
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786D06E903;
	Fri,  5 Nov 2021 14:25:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5B6F95E
 for <nouveau@lists.freedesktop.org>; Thu,  4 Nov 2021 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636042048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp4sNn+O3QK0o9X+MsyKXmRFXRMcaZyVfOFlA57meXQ=;
 b=MDg5ITYNczwvsbVdkcQZlRl2f214rWYIFbUl0rmsET0QqyPNUHI272goPzoD+ssxi0AgM/
 U8bIAytO6bpp5MJHMzionK7Iaw8+kkM7aDl6VWtW4UAGo6TNK9GNKJo8g53CVwG9bn7YZy
 8OvqcFTGVc3JhQP7wyZpWnHsh0DxZdY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-CAKmSMTkMKuWfNMy8BXOqw-1; Thu, 04 Nov 2021 12:07:27 -0400
X-MC-Unique: CAKmSMTkMKuWfNMy8BXOqw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1164487wrj.20
 for <nouveau@lists.freedesktop.org>; Thu, 04 Nov 2021 09:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp4sNn+O3QK0o9X+MsyKXmRFXRMcaZyVfOFlA57meXQ=;
 b=2IAt6mCw1M5yOSZfiyZm2SHLpZ40IAs1DHXtDwmWz3gssLmZ0Sqb8akvSd/hyoIk0X
 TiWKeU7CXJac/VzgLNbdaOFU834JRG4G9MU1mEfGA4VO1XesJph27eWb+M79mdMjOc6z
 C1qj5+mtbbwFn31yqo4b0cy24rTkibNrfmLv3UcF+/vmh1CLH2p+xE8I6G9lw54hI+h9
 1h7zLZtnCAodz2UAIhaIHh+sVB/G4GXRQ2OBdRiNDfZhWmeud2/JLQo3OK0ZC6rQy0RK
 0xMAMXMaj9M7B9jjJNKQi3MAUIFiay1uJrVCff6tb9k+KhGQ3MgQqOE9lkbJd8JGoCPc
 PE2A==
X-Gm-Message-State: AOAM533593ijhl8kp5cynoTwjk/YqB4zG1KDBtZMPVIifVBFtBJBmz8U
 VFsFHm9+s49qlm4Cvzm25FzOWRqg2pH75rZZLQ4pXX1m7j6AisM6aIJ7HufFQNhzAIo6PazNCPz
 fLQ2MdYUd7moSBKsiMT/uUgluEA==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr5656601wri.137.1636042045762; 
 Thu, 04 Nov 2021 09:07:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2D96/u/DqbZhFn9DEXeF98uSRyz3bMzldccdQRGuatzxCOhGots4E9UM72B9+TB+K1qgReg==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr5656545wri.137.1636042045515; 
 Thu, 04 Nov 2021 09:07:25 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l18sm5877863wrt.81.2021.11.04.09.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:07:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Nov 2021 17:07:06 +0100
Message-Id: <20211104160707.1407052-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104160707.1407052-1-javierm@redhat.com>
References: <20211104160707.1407052-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:38 +0000
Subject: [Nouveau] [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if
 drivers should be enabled
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
Cc: David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some DRM drivers check the vgacon_text_force() function return value as an
indication on whether they should be allowed to be enabled or not.

This function returns true if the nomodeset kernel command line parameter
was set. But there may be other conditions besides this to determine if a
driver should be enabled.

Let's add a drm_drv_enabled() helper function to encapsulate that logic so
can be later extended if needed, without having to modify all the drivers.

Also, while being there do some cleanup. The vgacon_text_force() function
is guarded by CONFIG_VGA_CONSOLE and there's no need for callers to do it.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Squash patch to add drm_drv_enabled() and make drivers use it.
- Make the drivers changes before moving nomodeset logic to DRM.
- Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
- Remove debug and error messages in drivers.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  7 +++----
 drivers/gpu/drm/ast/ast_drv.c           |  7 +++++--
 drivers/gpu/drm/drm_drv.c               | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c      |  6 +++++-
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  7 +++++--
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 ++++-
 drivers/gpu/drm/qxl/qxl_drv.c           |  7 +++++--
 drivers/gpu/drm/radeon/radeon_drv.c     |  6 ++++--
 drivers/gpu/drm/tiny/bochs.c            |  7 +++++--
 drivers/gpu/drm/tiny/cirrus.c           |  8 ++++++--
 drivers/gpu/drm/vboxvideo/vbox_drv.c    |  9 +++++----
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  5 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  5 +++--
 include/drm/drm_drv.h                   |  1 +
 14 files changed, 74 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c718fb5f3f8a..7fde40d06181 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2514,10 +2514,9 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (vgacon_text_force()) {
-		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
-		return -EINVAL;
-	}
+	r = drm_drv_enabled(&amdgpu_kms_driver)
+	if (r)
+		return r;
 
 	r = amdgpu_sync_init();
 	if (r)
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 86d5cd7b6318..802063279b86 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -233,8 +233,11 @@ static struct pci_driver ast_pci_driver = {
 
 static int __init ast_init(void)
 {
-	if (vgacon_text_force() && ast_modeset == -1)
-		return -EINVAL;
+	int ret;
+
+	ret = drm_drv_enabled(&ast_driver);
+	if (ret && ast_modeset == -1)
+		return ret;
 
 	if (ast_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..3fb567d62881 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -975,6 +975,26 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
 }
 EXPORT_SYMBOL(drm_dev_set_unique);
 
+/**
+ * drm_drv_enabled - Checks if a DRM driver can be enabled
+ * @driver: DRM driver to check
+ *
+ * Checks whether a DRM driver can be enabled or not. This may be the case
+ * if the "nomodeset" kernel command line parameter is used.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_drv_enabled(const struct drm_driver *driver)
+{
+	if (vgacon_text_force()) {
+		DRM_INFO("%s driver is disabled\n", driver->name);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_drv_enabled);
+
 /*
  * DRM Core
  * The DRM core module initializes all global DRM objects and makes them
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index ab2295dd4500..45cb3e540eff 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -18,9 +18,12 @@
 #include "i915_selftest.h"
 #include "i915_vma.h"
 
+static const struct drm_driver driver;
+
 static int i915_check_nomodeset(void)
 {
 	bool use_kms = true;
+	int ret;
 
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
@@ -31,7 +34,8 @@ static int i915_check_nomodeset(void)
 	if (i915_modparams.modeset == 0)
 		use_kms = false;
 
-	if (vgacon_text_force() && i915_modparams.modeset == -1)
+	ret = drm_drv_enabled(&driver);
+	if (ret && i915_modparams.modeset == -1)
 		use_kms = false;
 
 	if (!use_kms) {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 6b9243713b3c..2a581094ba2b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -378,8 +378,11 @@ static struct pci_driver mgag200_pci_driver = {
 
 static int __init mgag200_init(void)
 {
-	if (vgacon_text_force() && mgag200_modeset == -1)
-		return -EINVAL;
+	int ret;
+
+	ret = drm_drv_enabled(&mgag200_driver);
+	if (ret && mgag200_modeset == -1)
+		return ret;
 
 	if (mgag200_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1f828c9f691c..8844d3602d87 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1316,13 +1316,16 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 static int __init
 nouveau_drm_init(void)
 {
+	int ret;
+
 	driver_pci = driver_stub;
 	driver_platform = driver_stub;
 
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
-		if (vgacon_text_force())
+		ret = drm_drv_enabled(&driver_stub);
+		if (ret)
 			nouveau_modeset = 0;
 	}
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index fc47b0deb021..3ac2ef2bf545 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -295,8 +295,11 @@ static struct drm_driver qxl_driver = {
 
 static int __init qxl_init(void)
 {
-	if (vgacon_text_force() && qxl_modeset == -1)
-		return -EINVAL;
+	int ret;
+
+	ret = drm_drv_enabled(&qxl_driver);
+	if (ret && qxl_modeset == -1)
+		return ret;
 
 	if (qxl_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index b74cebca1f89..56d688c04346 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -637,8 +637,10 @@ static struct pci_driver radeon_kms_pci_driver = {
 
 static int __init radeon_module_init(void)
 {
-	if (vgacon_text_force() && radeon_modeset == -1) {
-		DRM_INFO("VGACON disable radeon kernel modesetting.\n");
+	int ret;
+
+	ret = drm_drv_enabled(&kms_driver)
+	if (ret && radeon_modeset == -1) {
 		radeon_modeset = 0;
 	}
 
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 2ce3bd903b70..ee6b1ff9128b 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -719,8 +719,11 @@ static struct pci_driver bochs_pci_driver = {
 
 static int __init bochs_init(void)
 {
-	if (vgacon_text_force() && bochs_modeset == -1)
-		return -EINVAL;
+	int ret;
+
+	ret = drm_drv_enabled(&bochs_driver);
+	if (ret && bochs_modeset == -1)
+		return ret;
 
 	if (bochs_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4611ec408506..4706c5bc3067 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -636,8 +636,12 @@ static struct pci_driver cirrus_pci_driver = {
 
 static int __init cirrus_init(void)
 {
-	if (vgacon_text_force())
-		return -EINVAL;
+	int ret;
+
+	ret = drm_drv_enabled(&cirrus_driver);
+	if (ret)
+		return ret;
+
 	return pci_register_driver(&cirrus_pci_driver);
 }
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index a6c81af37345..e4377c37cf33 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -193,10 +193,11 @@ static const struct drm_driver driver = {
 
 static int __init vbox_init(void)
 {
-#ifdef CONFIG_VGA_CONSOLE
-	if (vgacon_text_force() && vbox_modeset == -1)
-		return -EINVAL;
-#endif
+	int ret;
+
+	ret = drm_drv_enabled(&driver);
+	if (ret && vbox_modeset == -1)
+		return ret;
 
 	if (vbox_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 749db18dcfa2..28200dfba2d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -104,8 +104,9 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	struct drm_device *dev;
 	int ret;
 
-	if (vgacon_text_force() && virtio_gpu_modeset == -1)
-		return -EINVAL;
+	ret = drm_drv_enabled(&driver);
+	if (ret && virtio_gpu_modeset == -1)
+		return ret;
 
 	if (virtio_gpu_modeset == 0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index ab9a1750e1df..05e9949293d5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1651,8 +1651,9 @@ static int __init vmwgfx_init(void)
 {
 	int ret;
 
-	if (vgacon_text_force())
-		return -EINVAL;
+	ret = drm_drv_enabled(&driver);
+	if (ret)
+		return ret;
 
 	ret = pci_register_driver(&vmw_pci_driver);
 	if (ret)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..77abfc7e078b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -598,5 +598,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 
 int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
+int drm_drv_enabled(const struct drm_driver *driver);
 
 #endif
-- 
2.33.1

