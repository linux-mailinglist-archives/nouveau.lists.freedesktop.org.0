Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2E74CE37
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA30310E1E3;
	Mon, 10 Jul 2023 07:23:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jun 2023 11:08:38 UTC
Received: from out-3.mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B510E451
 for <nouveau@lists.freedesktop.org>; Fri, 30 Jun 2023 11:08:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1688122987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VT31crvj/hSyen+1yeJunQKIe6CJXCWJLM4jAJyVsI=;
 b=baipea9BUYs+P0aSm1rKe8ypQy05pAEnnX7yI+xyO3DhMiuV88ZCgKuCedMWIPlu3wl0ii
 sidhXI/6FlI7dKPOv9whb+Z5DbTB4LHG7HmNOGxpJ8Gb61ZM+dJPIagjFPFg3w4wuSHtRv
 FVowlwMUWuFeVO9zZjqa4KX7snhvraM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 30 Jun 2023 19:02:42 +0800
Message-Id: <20230630110243.141671-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230630110243.141671-1-sui.jingfeng@linux.dev>
References: <20230630110243.141671-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH v1 3/4] drm/amdgpu: Implement the is_boot_device
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
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-fbdev@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>, dri-devel@lists.freedesktop.org,
 Bokun Zhang <Bokun.Zhang@amd.com>, linux-pci@vger.kernel.org,
 Likun Gao <Likun.Gao@amd.com>, Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
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
The vgaarb subsystem will call back to amdgpu_is_boot_device() function
when drm/amdgpu is successfully bound to an AMDGPU device.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
CC: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c5bdf6eff29e..2f54250f9d58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3673,6 +3673,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
+static bool amdgpu_is_boot_device(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_gmc *gmc = &adev->gmc;
+
+	return drm_aperture_contain_firmware_fb(gmc->aper_base, gmc->aper_size);
+}
+
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -4082,7 +4091,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
+		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode,
+				    amdgpu_is_boot_device);
 
 	px = amdgpu_device_supports_px(ddev);
 
-- 
2.25.1

