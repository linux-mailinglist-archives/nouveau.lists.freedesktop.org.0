Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51E3D4314
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 00:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657716FD0B;
	Fri, 23 Jul 2021 22:46:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1200B6FD0B
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627080398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RiCWPDLq/IwjIj91kkA7Pcr42xwKm/fhjaL1ZW3wKCE=;
 b=i/u9KJI4NZCQVq3YfU19/U26GsxCjtN7T0tNOoC+0MC5qv9BcpFZY0lgvJ0SlPiJ+taYEB
 ZeTehJ9SoXR464Z0yS+HIUhlnKATEl8ptWS/AUXgm2ld5Uwr0FXbAV6ekQ7PbRa0wZDaAM
 AjaEF44Wzm+uLFgtti+faSaric6W6pg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-xU-ocWXhMq2lQmGwMSYMjg-1; Fri, 23 Jul 2021 18:46:34 -0400
X-MC-Unique: xU-ocWXhMq2lQmGwMSYMjg-1
Received: by mail-qv1-f70.google.com with SMTP id
 hf7-20020a0562140e87b02902dc988b8675so2786329qvb.3
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 15:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiCWPDLq/IwjIj91kkA7Pcr42xwKm/fhjaL1ZW3wKCE=;
 b=e6xlf6xK5YULkZM4TZ+IfK+csO3w9FzQ/w3RriyageUq90ku+guokIrjfC1qhhWHWb
 zyijwBV7zAW31F8epWXR++fulBNjQBviF+rCSEBoIGr+LXu+lzFPnCqY9eyCdQF5uElg
 SgJ/cG9JEEqlLNGt16qB9BOw/O1OdlrkDU/t29WlHAXzt0yXUCwalUSQ/WGfb+MAk1u2
 o2IQ49rzdIKcpAa/197d9MpywJ5OjqI/pCOCSKOT+27eI8KUV/mba8lzJN0wZc+Lunlq
 xmNhpI+fvyypPsa32r2xtKKbwqfnC2/kH3kfNQf22NhNenrG+hkJEouhKZ2GzA4gC+/U
 UCBQ==
X-Gm-Message-State: AOAM531NKkGXEsMbGAihOZUsc1mvE6dEdPxfYRa0R1qeg9I4zXWYfmm9
 4r7aRyIiOTEIHZWkYv0z927uhS2vhvuf8nB5bAWZxcvFPM3h0Tb65vLNZBGPHUh8d6hxgCHQofv
 H3fBcDYk+lzo4msgLXJDL0VD6aQ==
X-Received: by 2002:a05:620a:1242:: with SMTP id
 a2mr6809434qkl.443.1627080394299; 
 Fri, 23 Jul 2021 15:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9opdH/xj/91JB/lCrSTujZ8qm/Lf4qAgq6FcaqUeEky+BnrkB+7w88P4OSpPcjO9aAxJF9A==
X-Received: by 2002:a05:620a:1242:: with SMTP id
 a2mr6809411qkl.443.1627080394059; 
 Fri, 23 Jul 2021 15:46:34 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id f13sm1536040qkk.29.2021.07.23.15.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:46:33 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 24 Jul 2021 00:46:17 +0200
Message-Id: <20210723224617.3088886-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] nouveau: make backlight support non optional
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
Cc: Arnd Bergmann <arnd@kernel.org>, nouveau@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In the past this only led to compilation issues. Also the small amount of
extra .text shouldn't really matter compared to the entire nouveau driver
anyway.

Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/Kbuild              |  2 +-
 drivers/gpu/drm/nouveau/Kconfig             | 13 ++---------
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ----
 drivers/gpu/drm/nouveau/nouveau_connector.h | 24 ---------------------
 4 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 60586fb8275e..f6957e7ad807 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -49,7 +49,7 @@ nouveau-y += nouveau_ttm.o
 nouveau-y += nouveau_vmm.o
 
 # DRM - modesetting
-nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
+nouveau-y += nouveau_backlight.o
 nouveau-y += nouveau_bios.o
 nouveau-y += nouveau_connector.o
 nouveau-y += nouveau_display.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 9436310d0854..2e159b0ea7fb 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -7,14 +7,13 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
-	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
-	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
+	select BACKLIGHT_CLASS_DEVICE
+	select ACPI_VIDEO if ACPI && X86 && INPUT
 	select X86_PLATFORM_DEVICES if ACPI && X86
 	select ACPI_WMI if ACPI && X86
 	select MXM_WMI if ACPI && X86
 	select POWER_SUPPLY
 	# Similar to i915, we need to select ACPI_VIDEO and it's dependencies
-	select BACKLIGHT_CLASS_DEVICE if ACPI && X86
 	select INPUT if ACPI && X86
 	select THERMAL if ACPI && X86
 	select ACPI_VIDEO if ACPI && X86
@@ -85,14 +84,6 @@ config NOUVEAU_DEBUG_PUSH
 	  Say Y here if you want to enable verbose push buffer debug output
 	  and sanity checks.
 
-config DRM_NOUVEAU_BACKLIGHT
-	bool "Support for backlight control"
-	depends on DRM_NOUVEAU
-	default y
-	help
-	  Say Y here if you want to control the backlight of your display
-	  (e.g. a laptop panel).
-
 config DRM_NOUVEAU_SVM
 	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
 	depends on DEVICE_PRIVATE
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 093e1f7163b3..b30fd0f4a541 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1712,9 +1712,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector;
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight;
-#endif
 	struct nvbios *bios = &drm->vbios;
 	bool hda = false;
 	u8 proto = NV507D_SOR_SET_CONTROL_PROTOCOL_CUSTOM;
@@ -1790,12 +1788,10 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
 			drm_edp_backlight_enable(&nv_connector->aux, &backlight->edp_info,
 						 (u16)backlight->dev->props.brightness);
-#endif
 
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 40f90e353540..88ed64efe9e9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -45,7 +45,6 @@
 struct nvkm_i2c_port;
 struct dcb_output;
 
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 struct nouveau_backlight {
 	struct backlight_device *dev;
 
@@ -54,7 +53,6 @@ struct nouveau_backlight {
 
 	int id;
 };
-#endif
 
 #define nouveau_conn_atom(p)                                                   \
 	container_of((p), struct nouveau_conn_atom, state)
@@ -133,9 +131,7 @@ struct nouveau_connector {
 	struct nouveau_encoder *detected_encoder;
 	struct edid *edid;
 	struct drm_display_mode *native_mode;
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight;
-#endif
 	/*
 	 * Our connector property code expects a nouveau_conn_atom struct
 	 * even on pre-nv50 where we do not support atomic. This embedded
@@ -220,29 +216,9 @@ nouveau_conn_mode_clock_valid(const struct drm_display_mode *,
 			      const unsigned max_clock,
 			      unsigned *clock);
 
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 extern int nouveau_backlight_init(struct drm_connector *);
 extern void nouveau_backlight_fini(struct drm_connector *);
 extern void nouveau_backlight_ctor(void);
 extern void nouveau_backlight_dtor(void);
-#else
-static inline int
-nouveau_backlight_init(struct drm_connector *connector)
-{
-	return 0;
-}
-
-static inline void
-nouveau_backlight_fini(struct drm_connector *connector) {
-}
-
-static inline void
-nouveau_backlight_ctor(void) {
-}
-
-static inline void
-nouveau_backlight_dtor(void) {
-}
-#endif
 
 #endif /* __NOUVEAU_CONNECTOR_H__ */
-- 
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
