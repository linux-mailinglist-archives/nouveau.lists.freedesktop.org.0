Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514C905E67
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2024 00:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77510E92E;
	Wed, 12 Jun 2024 22:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="efq4N2OJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8F810E92E
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:49 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f44b441b08so3656845ad.0
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231088; x=1718835888;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aR6S2QVtzFM/jxymlLuEpObYuJIES6ks6qhmMWCUZhU=;
 b=efq4N2OJeqXbR9yADwA5WKDs8oMAajqVjFopRZb+nA2RTz/USJyZXC70CeagpVwIrn
 RwcXb/EX+yDY8wa9nhrfODhjqmtlKiNKCQyYn0JheHrd4CTyUxDtzEh3E70RukoR+Fxb
 Pt+lRxrhzC16DCeK7Rdqmcc5G5viaTP7Vqg7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231088; x=1718835888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aR6S2QVtzFM/jxymlLuEpObYuJIES6ks6qhmMWCUZhU=;
 b=vCMRiOPzOJSv8rSe05xuJwUk63plz5uq/XEJ2W4y5dpAVwQo87zdM91FFzFt7g3I1w
 +B5ZT3ViBhIlcH5eVftpRhvL+zLI2JP0mk9fYdFZ/SJdHMihgNet6fQ8EJ2hIVrVa5+F
 AreZaneqx1RyF1SYhdrslAlyJaf072s1BqlbjYUZMNSKU4DTjB8QLoilltURyYKFK/4r
 X7+s0itgSxGqr+zIQYUD3StvI3NN+95Vmv7HR4OPdMfRsTUvFLj38Xa8DLWY0W8pkMj5
 7jkzVsUMJ3/eFOcLC7O8F66gwC3DoPigxydkO+Tgrt4kRj0Bo8JcfvsDJ4l6pAfAsL6X
 JvqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPXbcZn+CbSqUM/kMhWq9MtBo/HEBXyILB6svfRaH+XH/cP64eqWDpo+a8KVOpW3GggqB4BVBqG56uxZf6sb1XhS8RrO4r++shV2OXoA==
X-Gm-Message-State: AOJu0Yy4oygRMfsEvSG1XIUnJDg07WctOIOt9IWNcTOym+oyv2o0Vo5N
 +xWP8rH+8xSrzAUngCzXJLlQFgmvBayRb1w3ZtCLWGTqEY0maDeFie+ylWNMiw==
X-Google-Smtp-Source: AGHT+IHKCE/3t+anxzcGR/vWhd2u/e5A1hvjZyotl4hoC22LuX9W+2G5IFPLfxJ6lZv8cQy/absvjg==
X-Received: by 2002:a17:902:e844:b0:1f6:225e:67a1 with SMTP id
 d9443c01a7336-1f83b70eaa3mr34942835ad.56.1718231088645; 
 Wed, 12 Jun 2024 15:24:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/nouveau: Call drm_atomic_helper_shutdown() or
 equiv at shutdown time
Date: Wed, 12 Jun 2024 15:23:42 -0700
Message-ID: <20240612152336.v2.2.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() (or
drm_helper_force_disable_all() if not using atomic) at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested. I made my best guess about
how to fit this into the existing code. If someone wishes a different
style, please yell.

(no changes since v1)

 drivers/gpu/drm/nouveau/nouveau_display.c  |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h  |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h      |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c |  6 ++++++
 5 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d4725a968827..15da55c382f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -645,6 +645,15 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
 	disp->fini(dev, runtime, suspend);
 }
 
+void
+nouveau_display_shutdown(struct drm_device *dev)
+{
+	if (drm_drv_uses_atomic_modeset(dev))
+		drm_atomic_helper_shutdown(dev);
+	else
+		drm_helper_force_disable_all(dev);
+}
+
 static void
 nouveau_display_create_properties(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 2ab2ddb1eadf..9df62e833cda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -47,6 +47,7 @@ void nouveau_display_destroy(struct drm_device *dev);
 int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
 void nouveau_display_hpd_resume(struct drm_device *dev);
 void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
+void nouveau_display_shutdown(struct drm_device *dev);
 int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
 int  nouveau_display_vblank_enable(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309..b41154c9b9cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -894,6 +894,18 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+void
+nouveau_drm_device_shutdown(struct drm_device *dev)
+{
+	nouveau_display_shutdown(dev);
+}
+
+static void
+nouveau_drm_shutdown(struct pci_dev *pdev)
+{
+	nouveau_drm_device_shutdown(pci_get_drvdata(pdev));
+}
+
 static int
 nouveau_do_suspend(struct drm_device *dev, bool runtime)
 {
@@ -1361,6 +1373,7 @@ nouveau_drm_pci_driver = {
 	.id_table = nouveau_drm_pci_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
+	.shutdown = nouveau_drm_shutdown,
 	.driver.pm = &nouveau_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 25fca98a20bc..78a91686006b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -327,6 +327,7 @@ struct drm_device *
 nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
 			       struct platform_device *, struct nvkm_device **);
 void nouveau_drm_device_remove(struct drm_device *dev);
+void nouveau_drm_device_shutdown(struct drm_device *dev);
 
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index bf2dc7567ea4..511f3a0c6ee9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -49,6 +49,11 @@ static void nouveau_platform_remove(struct platform_device *pdev)
 	nouveau_drm_device_remove(dev);
 }
 
+static void nouveau_platform_shutdown(struct platform_device *pdev)
+{
+	nouveau_drm_device_shutdown(platform_get_drvdata(pdev));
+}
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct nvkm_device_tegra_func gk20a_platform_data = {
 	.iommu_bit = 34,
@@ -93,4 +98,5 @@ struct platform_driver nouveau_platform_driver = {
 	},
 	.probe = nouveau_platform_probe,
 	.remove_new = nouveau_platform_remove,
+	.shutdown = nouveau_platform_shutdown,
 };
-- 
2.45.2.505.gda0bf45e8d-goog

