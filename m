Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD23E02D5
	for <lists+nouveau@lfdr.de>; Wed,  4 Aug 2021 16:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525106E9DE;
	Wed,  4 Aug 2021 14:11:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566C6E9DE
 for <nouveau@lists.freedesktop.org>; Wed,  4 Aug 2021 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628086258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDjxvCXPaN+5/k0w+fY3Yqj54cOWLInWRCxwK9/1kSg=;
 b=IMANi2S5/ZEh9aSc3mmS1fewPcOGkJA4c39KdC2VJrPRHw9AT0Qv4RSYDiJgLWnhJEzPEN
 7XZiSXkIWLW2EL13FqBpch6ylrkC9G+alVRhCgbiHAKPnCjFyIMwgIr8COf5PP5ynvRYy9
 aUtOlzSjSbknuiCBacAK0ReKLgKiDZY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-aDUlRR39PDGWoc1huUMkOQ-1; Wed, 04 Aug 2021 10:10:57 -0400
X-MC-Unique: aDUlRR39PDGWoc1huUMkOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso865117wrs.22
 for <nouveau@lists.freedesktop.org>; Wed, 04 Aug 2021 07:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDjxvCXPaN+5/k0w+fY3Yqj54cOWLInWRCxwK9/1kSg=;
 b=dVM5Vu71Smov/43NE114Rrtpc4t223a0PAMNwX/rEVvMF00pcCiH1HMW/0VbZ5Haeg
 e+WnG5naHqL3IwQaaW3kbs2vNirSxQ0rxjH5QiMRfqLEYB67lv56OhMPOKYblBrNr6DO
 upPUD2mOTXXvwc2W+vHRzym0OC0C2Q1lgNDcpqn/HmN3Z1Lyf3J3RhoSrD6NJ0QU9L4Z
 1vsS42aDG98C7j2FJWshdWyyiUN3+h1Q5ocVHtIccD5g+VGfNT6/ZsXQ699lKOy9NGcW
 89m+Oe4bZ/JOKR7H3zVJ6VSz21tjvgb5DUx6hDbBhZ3oX7016lsCMH4EnerSsemkVb/O
 SzNQ==
X-Gm-Message-State: AOAM530wrdJ+BO8SyCKnY1kBG/hUg3j3ZxMy7VT7K5lSg9DqsuL69qlN
 o/wL2ve1YYyIf3lvyoIY8SkRAjbF27c2q0V6lfV5FJqSj8kElZWUflG9JvmVoNlV6SKS17zLMwF
 b6g2+7ARjTmhZWrxUsczFAxvsGA==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr28240822wmj.100.1628086255320; 
 Wed, 04 Aug 2021 07:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv/BscaEU9xSkgsqbKKdLLWxpw8zS8J8c7lgfIoTdZVleH/nu5P0+UGoxW5ZzSsXcTq5LHQw==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr28240785wmj.100.1628086255032; 
 Wed, 04 Aug 2021 07:10:55 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id j140sm2484098wmj.37.2021.08.04.07.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:10:54 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Wed,  4 Aug 2021 16:10:49 +0200
Message-Id: <20210804141049.499767-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Subject: [Nouveau] [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
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

playing around a little bit with this, I think the original "select
BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
drivers selecting and others depending on it. We could of course convert
everything over to depend, and break those cycling dependency issues with
this.

Anyway this change on top of my initial patch is enough to make Kconfig
happy and has the advantage of not having to mess with the deps of nouveau
too much.

Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig    | 2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig   | 2 +-
 drivers/gpu/drm/gud/Kconfig       | 2 +-
 drivers/gpu/drm/nouveau/Kconfig   | 2 +-
 drivers/platform/x86/Kconfig      | 4 ++--
 drivers/staging/olpc_dcon/Kconfig | 2 +-
 drivers/usb/misc/Kconfig          | 2 +-
 drivers/video/fbdev/Kconfig       | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..dc68532ede38 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -173,9 +173,9 @@ config DRM_NXP_PTN3460
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_PANEL
 	select DRM_KMS_HELPER
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  Parade eDP-LVDS bridge chip driver.
 
diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index d7dd8ba90e3a..79bfd7e6f6dc 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -2,7 +2,7 @@
 config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
 	depends on DRM && OF && ARM && COMMON_CLK
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
index 1c8601bf4d91..91a118928af7 100644
--- a/drivers/gpu/drm/gud/Kconfig
+++ b/drivers/gpu/drm/gud/Kconfig
@@ -3,10 +3,10 @@
 config DRM_GUD
 	tristate "GUD USB Display"
 	depends on DRM && USB
+	depends on BACKLIGHT_CLASS_DEVICE
 	select LZ4_COMPRESS
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  This is a DRM display driver for GUD USB Displays or display
 	  adapters.
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 2e159b0ea7fb..afb3eede8e2b 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -2,12 +2,12 @@
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM && PCI && MMU
+	depends on BACKLIGHT_CLASS_DEVICE
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
-	select BACKLIGHT_CLASS_DEVICE
 	select ACPI_VIDEO if ACPI && X86 && INPUT
 	select X86_PLATFORM_DEVICES if ACPI && X86
 	select ACPI_WMI if ACPI && X86
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7d385c3b2239..278368985fb2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -838,7 +838,7 @@ config SAMSUNG_LAPTOP
 config SAMSUNG_Q10
 	tristate "Samsung Q10 Extras"
 	depends on ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  This driver provides support for backlight control on Samsung Q10
 	  and related laptops, including Dell Latitude X200.
@@ -935,7 +935,7 @@ config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on ACPI && INPUT
 	depends on RFKILL || RFKILL=n
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Support for Intel Classmate PC ACPI devices, including some
 	  keys as input device, backlight device, tablet and accelerometer
diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
index d1a0dea09ef0..a9f36538d7ab 100644
--- a/drivers/staging/olpc_dcon/Kconfig
+++ b/drivers/staging/olpc_dcon/Kconfig
@@ -4,7 +4,7 @@ config FB_OLPC_DCON
 	depends on OLPC && FB
 	depends on I2C
 	depends on GPIO_CS5535 && ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  In order to support very low power operation, the XO laptop uses a
 	  secondary Display CONtroller, or DCON.  This secondary controller
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 8f1144359012..6f769a1616f0 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -132,7 +132,7 @@ config USB_FTDI_ELAN
 
 config USB_APPLEDISPLAY
 	tristate "Apple Cinema Display support"
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to control the backlight of Apple Cinema
 	  Displays over USB. This driver provides a sysfs interface.
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d33c5cd684c0..b4d5837b61de 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -187,7 +187,7 @@ config FB_MACMODES
 config FB_BACKLIGHT
 	tristate
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
-- 
2.31.1

