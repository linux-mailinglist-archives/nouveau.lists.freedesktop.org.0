Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78AF3B5120
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6C6E194;
	Sun, 27 Jun 2021 03:34:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C056ECFF;
 Fri, 25 Jun 2021 08:22:33 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABB6721C27;
 Fri, 25 Jun 2021 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k21ytxdwuagnYHB/6ETN2rcU6BM9To9c9USq7vW8NO4=;
 b=WjnW94upPPZHpHnFsyF604UfvoBQhWeejRU0Prlex6LqdFTqSCBnHbQ5dRr8fIL6Ep3aKu
 Q02BKKNbJkdYu2MfMpHNNdtHl55kNqvjkaZADAy/JYDCOQRH5P+2uCi1jqoRZR2zRdckIE
 1CH5hTkruWM9tCXHK1kBkl47yvBoKLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k21ytxdwuagnYHB/6ETN2rcU6BM9To9c9USq7vW8NO4=;
 b=O/Clv2y4xq6/nquduOgRV2lycZpEHtF5WoP/nMI/G83GThrUuKcuEiQaACZ76yyj57tkCx
 1ChsAbsuZoRkezAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 84F6311A97;
 Fri, 25 Jun 2021 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k21ytxdwuagnYHB/6ETN2rcU6BM9To9c9USq7vW8NO4=;
 b=WjnW94upPPZHpHnFsyF604UfvoBQhWeejRU0Prlex6LqdFTqSCBnHbQ5dRr8fIL6Ep3aKu
 Q02BKKNbJkdYu2MfMpHNNdtHl55kNqvjkaZADAy/JYDCOQRH5P+2uCi1jqoRZR2zRdckIE
 1CH5hTkruWM9tCXHK1kBkl47yvBoKLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k21ytxdwuagnYHB/6ETN2rcU6BM9To9c9USq7vW8NO4=;
 b=O/Clv2y4xq6/nquduOgRV2lycZpEHtF5WoP/nMI/G83GThrUuKcuEiQaACZ76yyj57tkCx
 1ChsAbsuZoRkezAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GM6aH0aS1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:30 +0000
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
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Date: Fri, 25 Jun 2021 10:22:01 +0200
Message-Id: <20210625082222.3845-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:45 +0000
Subject: [Nouveau] [PATCH v4 06/27] drm/i915: Track IRQ state in local
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
Cc: linux-samsung-soc@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct drm_i915_private.irq_enabled. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 ++
 drivers/gpu/drm/i915/i915_irq.c | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 01e11fe38642..48c1835bd54b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1134,6 +1134,8 @@ struct drm_i915_private {
 	/* For i915gm/i945gm vblank irq workaround */
 	u8 vblank_enabled;
 
+	bool irq_enabled;
+
 	/* perform PHY state sanity checks? */
 	bool chv_phy_assert[2];
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index a11bdb667241..987211f21761 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4488,14 +4488,14 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
 	 */
 	dev_priv->runtime_pm.irqs_enabled = true;
 
-	dev_priv->drm.irq_enabled = true;
+	dev_priv->irq_enabled = true;
 
 	intel_irq_reset(dev_priv);
 
 	ret = request_irq(irq, intel_irq_handler(dev_priv),
 			  IRQF_SHARED, DRIVER_NAME, dev_priv);
 	if (ret < 0) {
-		dev_priv->drm.irq_enabled = false;
+		dev_priv->irq_enabled = false;
 		return ret;
 	}
 
@@ -4521,10 +4521,10 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 	 * intel_modeset_driver_remove() calling us out of sequence.
 	 * Would be nice if it didn't do that...
 	 */
-	if (!dev_priv->drm.irq_enabled)
+	if (!dev_priv->irq_enabled)
 		return;
 
-	dev_priv->drm.irq_enabled = false;
+	dev_priv->irq_enabled = false;
 
 	intel_irq_reset(dev_priv);
 
-- 
2.32.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
