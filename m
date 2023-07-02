Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437D74CE35
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A0310E1E9;
	Mon, 10 Jul 2023 07:23:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out-36.mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31B710E16C
 for <nouveau@lists.freedesktop.org>; Sun,  2 Jul 2023 18:28:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1688322507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btfhp53flz2znRJhVRVROxzr2+xJwf5jWKVzzdMQNCg=;
 b=oQKi6ID1afguP4x/ojsnsDHQmXUzv98pprbJoD3+O0SU3KQeHD02lyeKnjI1XcQu3Pa5Yo
 KBMOMm5Ccwy6HtziwaVhZWyGV851AaNElUo1AcDBeEGL5hD9ef1eODvu1u4mvhKyY0fEBW
 O5N2ZIaf//ItxdDMSQ/3hAiJPgHsTbs=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Date: Mon,  3 Jul 2023 02:27:42 +0800
Message-Id: <20230702182744.755467-5-sui.jingfeng@linux.dev>
In-Reply-To: <20230702182744.755467-1-sui.jingfeng@linux.dev>
References: <20230702182744.755467-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH v2 4/6] drm/radeon: Implement the is_boot_device
 callback function
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Christian Konig <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

[why]

The vga_is_firmware_default() defined in drivers/pci/vgaarb.c is
arch-dependent, it's a dummy on non-x86 architectures currently.
This made VGAARB lost an important condition for the arbitration.
It could still be wrong even if we remove the #ifdef and #endif guards.
because the PCI bar will move (resource re-allocation).

[how]

The device that owns the firmware framebuffer should be the default boot
device. This patch adds an arch-independent function to enforce this rule.
The vgaarb subsystem will call back to radeon_is_boot_device() function
when drm/radeon is successfully bound to a radeon GPU device.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/radeon/radeon_device.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 71f2ff39d6a1..afb49000830c 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -34,6 +34,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/vgaarb.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
@@ -1263,6 +1264,15 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.can_switch = radeon_switcheroo_can_switch,
 };
 
+static bool radeon_is_boot_device(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct radeon_device *rdev = dev->dev_private;
+	struct radeon_mc *gmc = &rdev->mc;
+
+	return drm_aperture_contain_firmware_fb(gmc->aper_base, gmc->aper_size);
+}
+
 /**
  * radeon_device_init - initialize the driver
  *
@@ -1425,7 +1435,7 @@ int radeon_device_init(struct radeon_device *rdev,
 	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
-	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
+	vga_client_register(rdev->pdev, radeon_vga_set_decode, radeon_is_boot_device);
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-- 
2.25.1

