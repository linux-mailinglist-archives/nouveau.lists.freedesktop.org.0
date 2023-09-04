Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E4791DEF
	for <lists+nouveau@lfdr.de>; Mon,  4 Sep 2023 21:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F710E3EB;
	Mon,  4 Sep 2023 19:57:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out-213.mta1.migadu.com (out-213.mta1.migadu.com
 [95.215.58.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3693510E3E6
 for <nouveau@lists.freedesktop.org>; Mon,  4 Sep 2023 19:57:44 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693857462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kmuyy5d8TjfKPYFKMrpKxMdJxlBIiyPktdk9/3dqaTc=;
 b=MRbIL1ezV+MLDlrq8FrN2e2iqKWOCBSzCMXu00ItCM4BykmOR85mcBF+KstvvBGs6g1CU3
 mO/B8rdGeNOFX1B78Vqej0MqiBxruE4A0+Vuxx2Pu/ErmZJgbG1UNtUYiHBqabuPRdixNg
 0+mVRFLiH5Q5VIHnOltwIszhLHFeGRg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue,  5 Sep 2023 03:57:18 +0800
Message-Id: <20230904195724.633404-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Subject: [Nouveau] [RFC,
 drm-misc-next v4 3/9] drm/radeon: Implement .be_primary() callback
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

On a machine with multiple GPUs, a Linux user has no control over which one
is primary at boot time. This patch tries to solve the mentioned problem by
implementing the .be_primary() callback. Pass radeon.modeset=10 on the
kernel cmd line if you really want the device bound by radeon to be the
primary video adapter, no matter what VGAARB say.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/radeon/radeon_device.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 71f2ff39d6a1..b661cd3a8dc2 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1263,6 +1263,14 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
 	.can_switch = radeon_switcheroo_can_switch,
 };
 
+static bool radeon_want_to_be_primary(struct pci_dev *pdev)
+{
+	if (radeon_modeset == 10)
+		return true;
+
+	return false;
+}
+
 /**
  * radeon_device_init - initialize the driver
  *
@@ -1425,7 +1433,7 @@ int radeon_device_init(struct radeon_device *rdev,
 	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
-	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
+	vga_client_register(rdev->pdev, radeon_vga_set_decode, radeon_want_to_be_primary);
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-- 
2.34.1

