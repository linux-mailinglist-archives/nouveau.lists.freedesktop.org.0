Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10623B510C
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064B6E150;
	Sun, 27 Jun 2021 03:34:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C996EA47;
 Thu, 24 Jun 2021 07:29:25 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0752C21988;
 Thu, 24 Jun 2021 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=nmIPqslFnX0Q80pdl86tf/ccQHTD1qXZsv4FKeiVGQ9IRRJxlLhagX7pxTlWyuquo0luD8
 Y+yxCDiJS4aeG4Zy6HC0+Z8XbTzeV/i+7UpD8QoWiBZUnFCgN0PCysS1rlMIzQ1CvHfwPd
 uBLM+l0Ri8muTKu8yIbga7XmmG+jxSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=4K5huN0VkhXvJqoObl1xqjkuOwsgHQq6A6n84t0A84IVQS58zLUjUZrDpXSMqUjQ/Qj+U9
 My1vXx7mqxhEBrBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D5B5D11C9B;
 Thu, 24 Jun 2021 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=GXB3NT/hiSOvWGqH7SX1jWLCRIQsgSuCL9ZUMVM43hZtusQyoXnRYqMFYrFUwS06LB+rZw
 /9bo2QzCoJsoALwtQzu3T3mbsshlB9DDYVZ2gneICHT2rX7jVJlMpTJ+lrJxWiNMz0I0jt
 XvmFgm1jIDwBF8dHUaZb0mFaHSaagPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=s5ZiQAcpHVYNWTd+aExwSUDXm69sEq82qW7VdS9TIIEAlhuWm4ovd82h6Of8oFUTT/TDcK
 fPsEbmXK94XTchBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YJc+M1I01GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Date: Thu, 24 Jun 2021 09:28:52 +0200
Message-Id: <20210624072916.27703-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: [Nouveau] [PATCH v3 03/27] drm/radeon: Track IRQ state in local
 device state
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct radeon_device.irq.installed. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/radeon/radeon_fence.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 0d8ef2368adf..7ec581363e23 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -288,7 +288,7 @@ static void radeon_fence_check_lockup(struct work_struct *work)
 		return;
 	}
 
-	if (fence_drv->delayed_irq && rdev->ddev->irq_enabled) {
+	if (fence_drv->delayed_irq && rdev->irq.installed) {
 		unsigned long irqflags;
 
 		fence_drv->delayed_irq = false;
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 84d0b1a3355f..a36ce826d0c0 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -357,7 +357,7 @@ void radeon_irq_kms_sw_irq_get(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.ring_int[ring]) == 1) {
@@ -396,7 +396,7 @@ void radeon_irq_kms_sw_irq_put(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.ring_int[ring])) {
@@ -422,7 +422,7 @@ void radeon_irq_kms_pflip_irq_get(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.pflip[crtc]) == 1) {
@@ -448,7 +448,7 @@ void radeon_irq_kms_pflip_irq_put(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.pflip[crtc])) {
@@ -470,7 +470,7 @@ void radeon_irq_kms_enable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -492,7 +492,7 @@ void radeon_irq_kms_disable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -514,7 +514,7 @@ void radeon_irq_kms_enable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -537,7 +537,7 @@ void radeon_irq_kms_disable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
-- 
2.32.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
