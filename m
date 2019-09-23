Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CA12B2D8
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D06E120;
	Fri, 27 Dec 2019 08:14:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05D891F2;
 Mon, 23 Sep 2019 15:50:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D06020835;
 Mon, 23 Sep 2019 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569253808;
 bh=a/gnp0VA43q9tw8vxlsMsjkP9jypIqy2k1SvccaheYU=;
 h=From:To:Cc:Subject:Date:From;
 b=bPQYcEFIvxg2tJ8VOXDkany+/p5qbWPIVaEMsk5bLaFy05XP0ZCkEdTGVN2mbLSEw
 vS5Of4Mlv3hzBkDxqzu0apHXHhplWRlPBDjTPQtqJFYn1M53Kyw6cF3iR2UOIUGLob
 s/ODlBe8DHnmg8aOKaltmArUNfPYLWGQNIPSAI0Y=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jiri Kosina <trivial@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Date: Mon, 23 Sep 2019 17:49:32 +0200
Message-Id: <20190923154932.6807-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH trivial] gpu: Fix Kconfig indentation
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
    $ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/Kconfig                  |  10 +-
 drivers/gpu/drm/amd/display/Kconfig      |  20 ++--
 drivers/gpu/drm/bridge/Kconfig           |   8 +-
 drivers/gpu/drm/i915/Kconfig             |  12 +-
 drivers/gpu/drm/i915/Kconfig.debug       | 144 +++++++++++------------
 drivers/gpu/drm/lima/Kconfig             |   2 +-
 drivers/gpu/drm/mgag200/Kconfig          |   8 +-
 drivers/gpu/drm/nouveau/Kconfig          |   2 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig |   6 +-
 drivers/gpu/drm/omapdrm/dss/Kconfig      |  12 +-
 drivers/gpu/drm/rockchip/Kconfig         |   8 +-
 drivers/gpu/drm/udl/Kconfig              |   2 +-
 drivers/gpu/vga/Kconfig                  |   2 +-
 13 files changed, 118 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e67c194c2aca..7cb6e4eb99e8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -207,8 +207,8 @@ config DRM_RADEON
 	tristate "ATI Radeon"
 	depends on DRM && PCI && MMU
 	select FW_LOADER
-        select DRM_KMS_HELPER
-        select DRM_TTM
+	select DRM_KMS_HELPER
+	select DRM_TTM
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
@@ -226,9 +226,9 @@ config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM && PCI && MMU
 	select FW_LOADER
-        select DRM_KMS_HELPER
+	select DRM_KMS_HELPER
 	select DRM_SCHED
-        select DRM_TTM
+	select DRM_TTM
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
@@ -266,7 +266,7 @@ config DRM_VKMS
 	  If M is selected the module will be called vkms.
 
 config DRM_ATI_PCIGART
-        bool
+	bool
 
 source "drivers/gpu/drm/exynos/Kconfig"
 
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 71991a28a775..0a35cb8e803a 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -23,16 +23,16 @@ config DRM_AMD_DC_DCN2_0
 	depends on DRM_AMD_DC && X86
 	depends on DRM_AMD_DC_DCN1_0
 	help
-	    Choose this option if you want to have
-	    Navi support for display engine
+	  Choose this option if you want to have
+	  Navi support for display engine
 
 config DRM_AMD_DC_DCN2_1
-        bool "DCN 2.1 family"
-        depends on DRM_AMD_DC && X86
-        depends on DRM_AMD_DC_DCN2_0
-        help
-            Choose this option if you want to have
-            Renoir support for display engine
+	bool "DCN 2.1 family"
+	depends on DRM_AMD_DC && X86
+	depends on DRM_AMD_DC_DCN2_0
+	help
+	  Choose this option if you want to have
+	  Renoir support for display engine
 
 config DRM_AMD_DC_DSC_SUPPORT
 	bool "DSC support"
@@ -41,8 +41,8 @@ config DRM_AMD_DC_DSC_SUPPORT
 	depends on DRM_AMD_DC_DCN1_0
 	depends on DRM_AMD_DC_DCN2_0
 	help
-	    Choose this option if you want to have
-	    Dynamic Stream Compression support
+	  Choose this option if you want to have
+	  Dynamic Stream Compression support
 
 config DEBUG_KERNEL_DC
 	bool "Enable kgdb break in DC"
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 1cc9f502c1f2..a5aa7ec16000 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -60,10 +60,10 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	---help---
-          This is a driver for the display bridges of
-          GE B850v3 that convert dual channel LVDS
-          to DP++. This is used with the i.MX6 imx-ldb
-          driver. You are likely to say N here.
+	  This is a driver for the display bridges of
+	  GE B850v3 that convert dual channel LVDS
+	  to DP++. This is used with the i.MX6 imx-ldb
+	  driver. You are likely to say N here.
 
 config DRM_NXP_PTN3460
 	tristate "NXP PTN3460 DP/LVDS bridge"
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 0d21402945ab..3c6d57df262d 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -76,7 +76,7 @@ config DRM_I915_CAPTURE_ERROR
 	  This option enables capturing the GPU state when a hang is detected.
 	  This information is vital for triaging hangs and assists in debugging.
 	  Please report any hang to
-            https://bugs.freedesktop.org/enter_bug.cgi?product=DRI
+	    https://bugs.freedesktop.org/enter_bug.cgi?product=DRI
 	  for triaging.
 
 	  If in doubt, say "Y".
@@ -105,11 +105,11 @@ config DRM_I915_USERPTR
 	  If in doubt, say "Y".
 
 config DRM_I915_GVT
-        bool "Enable Intel GVT-g graphics virtualization host support"
-        depends on DRM_I915
-        depends on 64BIT
-        default n
-        help
+	bool "Enable Intel GVT-g graphics virtualization host support"
+	depends on DRM_I915
+	depends on 64BIT
+	default n
+	help
 	  Choose this option if you want to enable Intel GVT-g graphics
 	  virtualization technology host support with integrated graphics.
 	  With GVT-g, it's possible to have one integrated graphics
diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 00786a142ff0..eea79125b3ea 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -1,34 +1,34 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_I915_WERROR
-        bool "Force GCC to throw an error instead of a warning when compiling"
-        # As this may inadvertently break the build, only allow the user
-        # to shoot oneself in the foot iff they aim really hard
-        depends on EXPERT
-        # We use the dependency on !COMPILE_TEST to not be enabled in
-        # allmodconfig or allyesconfig configurations
-        depends on !COMPILE_TEST
+	bool "Force GCC to throw an error instead of a warning when compiling"
+	# As this may inadvertently break the build, only allow the user
+	# to shoot oneself in the foot iff they aim really hard
+	depends on EXPERT
+	# We use the dependency on !COMPILE_TEST to not be enabled in
+	# allmodconfig or allyesconfig configurations
+	depends on !COMPILE_TEST
 	select HEADER_TEST
-        default n
-        help
-          Add -Werror to the build flags for (and only for) i915.ko.
-          Do not enable this unless you are writing code for the i915.ko module.
+	default n
+	help
+	  Add -Werror to the build flags for (and only for) i915.ko.
+	  Do not enable this unless you are writing code for the i915.ko module.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_DEBUG
-        bool "Enable additional driver debugging"
-        depends on DRM_I915
-        select DEBUG_FS
-        select PREEMPT_COUNT
-        select REFCOUNT_FULL
-        select I2C_CHARDEV
-        select STACKDEPOT
-        select DRM_DP_AUX_CHARDEV
-        select X86_MSR # used by igt/pm_rpm
-        select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
-        select DRM_DEBUG_MM if DRM=y
+	bool "Enable additional driver debugging"
+	depends on DRM_I915
+	select DEBUG_FS
+	select PREEMPT_COUNT
+	select REFCOUNT_FULL
+	select I2C_CHARDEV
+	select STACKDEPOT
+	select DRM_DP_AUX_CHARDEV
+	select X86_MSR # used by igt/pm_rpm
+	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
+	select DRM_DEBUG_MM if DRM=y
 	select DRM_DEBUG_SELFTEST
 	select DMABUF_SELFTESTS
 	select SW_SYNC # signaling validation framework (igt/syncobj*)
@@ -36,14 +36,14 @@ config DRM_I915_DEBUG
 	select DRM_I915_SELFTEST
 	select DRM_I915_DEBUG_RUNTIME_PM
 	select DRM_I915_DEBUG_MMIO
-        default n
-        help
-          Choose this option to turn on extra driver debugging that may affect
-          performance but will catch some internal issues.
+	default n
+	help
+	  Choose this option to turn on extra driver debugging that may affect
+	  performance but will catch some internal issues.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_DEBUG_MMIO
 	bool "Always insert extra checks around mmio access by default"
@@ -59,16 +59,16 @@ config DRM_I915_DEBUG_MMIO
 	  If in doubt, say "N".
 
 config DRM_I915_DEBUG_GEM
-        bool "Insert extra checks into the GEM internals"
-        default n
-        depends on DRM_I915_WERROR
-        help
-          Enable extra sanity checks (including BUGs) along the GEM driver
-          paths that may slow the system down and if hit hang the machine.
+	bool "Insert extra checks into the GEM internals"
+	default n
+	depends on DRM_I915_WERROR
+	help
+	  Enable extra sanity checks (including BUGs) along the GEM driver
+	  paths that may slow the system down and if hit hang the machine.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_ERRLOG_GEM
 	bool "Insert extra logging (very verbose) for common GEM errors"
@@ -111,41 +111,41 @@ config DRM_I915_TRACE_GTT
 	  If in doubt, say "N".
 
 config DRM_I915_SW_FENCE_DEBUG_OBJECTS
-        bool "Enable additional driver debugging for fence objects"
-        depends on DRM_I915
-        select DEBUG_OBJECTS
-        default n
-        help
-          Choose this option to turn on extra driver debugging that may affect
-          performance but will catch some internal issues.
+	bool "Enable additional driver debugging for fence objects"
+	depends on DRM_I915
+	select DEBUG_OBJECTS
+	default n
+	help
+	  Choose this option to turn on extra driver debugging that may affect
+	  performance but will catch some internal issues.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_SW_FENCE_CHECK_DAG
-        bool "Enable additional driver debugging for detecting dependency cycles"
-        depends on DRM_I915
-        default n
-        help
-          Choose this option to turn on extra driver debugging that may affect
-          performance but will catch some internal issues.
+	bool "Enable additional driver debugging for detecting dependency cycles"
+	depends on DRM_I915
+	default n
+	help
+	  Choose this option to turn on extra driver debugging that may affect
+	  performance but will catch some internal issues.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_DEBUG_GUC
-        bool "Enable additional driver debugging for GuC"
-        depends on DRM_I915
-        default n
-        help
-          Choose this option to turn on extra driver debugging that may affect
-          performance but will help resolve GuC related issues.
+	bool "Enable additional driver debugging for GuC"
+	depends on DRM_I915
+	default n
+	help
+	  Choose this option to turn on extra driver debugging that may affect
+	  performance but will help resolve GuC related issues.
 
-          Recommended for driver developers only.
+	  Recommended for driver developers only.
 
-          If in doubt, say "N".
+	  If in doubt, say "N".
 
 config DRM_I915_SELFTEST
 	bool "Enable selftests upon driver load"
@@ -178,15 +178,15 @@ config DRM_I915_SELFTEST_BROKEN
 	  If in doubt, say "N".
 
 config DRM_I915_LOW_LEVEL_TRACEPOINTS
-        bool "Enable low level request tracing events"
-        depends on DRM_I915
-        default n
-        help
-          Choose this option to turn on low level request tracing events.
-          This provides the ability to precisely monitor engine utilisation
-          and also analyze the request dependency resolving timeline.
-
-          If in doubt, say "N".
+	bool "Enable low level request tracing events"
+	depends on DRM_I915
+	default n
+	help
+	  Choose this option to turn on low level request tracing events.
+	  This provides the ability to precisely monitor engine utilisation
+	  and also analyze the request dependency resolving timeline.
+
+	  If in doubt, say "N".
 
 config DRM_I915_DEBUG_VBLANK_EVADE
 	bool "Enable extra debug warnings for vblank evasion"
diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index bb4ddc6bb0a6..652af7f50ea9 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -10,4 +10,4 @@ config DRM_LIMA
        depends on OF
        select DRM_SCHED
        help
-         DRM driver for ARM Mali 400/450 GPUs.
+	 DRM driver for ARM Mali 400/450 GPUs.
diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 76fee0fbdcae..4b31ef376abc 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -6,8 +6,8 @@ config DRM_MGAG200
 	select DRM_VRAM_HELPER
 	help
 	 This is a KMS driver for the MGA G200 server chips, it
-         does not support the original MGA G200 or any of the desktop
-         chips. It requires 0.3.0 of the modesetting userspace driver,
-         and a version of mga driver that will fail on KMS enabled
-         devices.
+	 does not support the original MGA G200 or any of the desktop
+	 chips. It requires 0.3.0 of the modesetting userspace driver,
+	 and a version of mga driver that will fail on KMS enabled
+	 devices.
 
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 3558df043592..9c990266e876 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -2,7 +2,7 @@
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM && PCI && MMU
-        select FW_LOADER
+	select FW_LOADER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
index 240dda102845..b562a8cd61bf 100644
--- a/drivers/gpu/drm/omapdrm/displays/Kconfig
+++ b/drivers/gpu/drm/omapdrm/displays/Kconfig
@@ -8,18 +8,18 @@ config DRM_OMAP_ENCODER_OPA362
 	  through a GPIO.
 
 config DRM_OMAP_ENCODER_TPD12S015
-        tristate "TPD12S015 HDMI ESD protection and level shifter"
+	tristate "TPD12S015 HDMI ESD protection and level shifter"
 	help
 	  Driver for TPD12S015, which offers HDMI ESD protection and level
 	  shifting.
 
 config DRM_OMAP_CONNECTOR_HDMI
-        tristate "HDMI Connector"
+	tristate "HDMI Connector"
 	help
 	  Driver for a generic HDMI connector.
 
 config DRM_OMAP_CONNECTOR_ANALOG_TV
-        tristate "Analog TV Connector"
+	tristate "Analog TV Connector"
 	help
 	  Driver for a generic analog TV connector.
 
diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
index 956f23e1452d..72ae79c0c9b4 100644
--- a/drivers/gpu/drm/omapdrm/dss/Kconfig
+++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
@@ -6,12 +6,12 @@ config OMAP_DSS_BASE
 	tristate
 
 menuconfig OMAP2_DSS
-        tristate "OMAP2+ Display Subsystem support"
+	tristate "OMAP2+ Display Subsystem support"
 	select OMAP_DSS_BASE
 	select VIDEOMODE_HELPERS
 	select OMAP2_DSS_INIT
 	select HDMI
-        help
+	help
 	  OMAP2+ Display Subsystem support.
 
 if OMAP2_DSS
@@ -52,7 +52,7 @@ config OMAP2_DSS_DPI
 
 config OMAP2_DSS_VENC
 	bool "VENC support"
-        default y
+	default y
 	help
 	  OMAP Video Encoder support for S-Video and composite TV-out.
 
@@ -61,7 +61,7 @@ config OMAP2_DSS_HDMI_COMMON
 
 config OMAP4_DSS_HDMI
 	bool "HDMI support for OMAP4"
-        default y
+	default y
 	select OMAP2_DSS_HDMI_COMMON
 	help
 	  HDMI support for OMAP4 based SoCs.
@@ -85,7 +85,7 @@ config OMAP5_DSS_HDMI
 
 config OMAP2_DSS_SDI
 	bool "SDI support"
-        default n
+	default n
 	help
 	  SDI (Serial Display Interface) support.
 
@@ -94,7 +94,7 @@ config OMAP2_DSS_SDI
 
 config OMAP2_DSS_DSI
 	bool "DSI support"
-        default n
+	default n
 	help
 	  MIPI DSI (Display Serial Interface) support.
 
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 6f4222f8beeb..1670a5cae3c7 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -28,17 +28,17 @@ config ROCKCHIP_ANALOGIX_DP
 	  on RK3288 or RK3399 based SoC, you should select this option.
 
 config ROCKCHIP_CDN_DP
-        bool "Rockchip cdn DP"
+	bool "Rockchip cdn DP"
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
-        help
+	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
 	  RK3399 based SoC, you should select this
 	  option.
 
 config ROCKCHIP_DW_HDMI
-        bool "Rockchip specific extensions for Synopsys DW HDMI"
-        help
+	bool "Rockchip specific extensions for Synopsys DW HDMI"
+	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Synopsys DesignWare HDMI driver. If you want to
 	  enable HDMI on RK3288 or RK3399 based SoC, you should select
diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
index b4d179b87f01..b13aa33990f3 100644
--- a/drivers/gpu/drm/udl/Kconfig
+++ b/drivers/gpu/drm/udl/Kconfig
@@ -8,4 +8,4 @@ config DRM_UDL
 	select DRM_KMS_HELPER
 	help
 	  This is a KMS driver for the USB displaylink video adapters.
-          Say M/Y to add support for these devices via drm/kms interfaces.
+	  Say M/Y to add support for these devices via drm/kms interfaces.
diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
index c8c770b05ed9..1ad4c4ef0b5e 100644
--- a/drivers/gpu/vga/Kconfig
+++ b/drivers/gpu/vga/Kconfig
@@ -28,6 +28,6 @@ config VGA_SWITCHEROO
 	help
 	  Many laptops released in 2008/9/10 have two GPUs with a multiplexer
 	  to switch between them. This adds support for dynamic switching when
-          X isn't running and delayed switching until the next logoff. This
+	  X isn't running and delayed switching until the next logoff. This
 	  feature is called hybrid graphics, ATI PowerXpress, and Nvidia
 	  HybridPower.
-- 
2.17.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
