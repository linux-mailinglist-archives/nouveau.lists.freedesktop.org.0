Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928A3B5144
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1536E1A4;
	Sun, 27 Jun 2021 03:35:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF046EB0D;
 Thu, 24 Jun 2021 07:29:53 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E33D81FD77;
 Thu, 24 Jun 2021 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
 b=YHbsYD9p+bR0uyKVRlWKL7gixAmsOAVdW3wtlLhS5nu3XbEDXj9frOuZFuUwJEmEprkYAj
 Cl21IRU9CifWm68RBXLz8pCUbcoAJt430Mi3d4BW53YCJRAvg7RLSQTzQuDnjWmC1qozYj
 Y1OchqzOD52KmIm7Hyzs/UOTIjwNPx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
 b=Y+GdS68vcT++xVhwvqlndc5VxZQOlTU+GaXn6vjS11qt9JJg2NXXabEOF8WSQTchM67qJ9
 AQux3yAarLBMdeAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BAB3511C9B;
 Thu, 24 Jun 2021 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
 b=YHbsYD9p+bR0uyKVRlWKL7gixAmsOAVdW3wtlLhS5nu3XbEDXj9frOuZFuUwJEmEprkYAj
 Cl21IRU9CifWm68RBXLz8pCUbcoAJt430Mi3d4BW53YCJRAvg7RLSQTzQuDnjWmC1qozYj
 Y1OchqzOD52KmIm7Hyzs/UOTIjwNPx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n83/+9s2T5Nzubb+gy66mf0gKEocr9OM5q295e9qPfs=;
 b=Y+GdS68vcT++xVhwvqlndc5VxZQOlTU+GaXn6vjS11qt9JJg2NXXabEOF8WSQTchM67qJ9
 AQux3yAarLBMdeAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id QHW0LG401GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:50 +0000
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
Date: Thu, 24 Jun 2021 09:29:16 +0200
Message-Id: <20210624072916.27703-28-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: [Nouveau] [PATCH v3 27/27] drm/zte: Don't set struct
 drm_device.irq_enabled
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

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in zte.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/zte/zx_drm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index 5506336594e2..064056503ebb 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -75,12 +75,6 @@ static int zx_drm_bind(struct device *dev)
 		goto out_unbind;
 	}
 
-	/*
-	 * We will manage irq handler on our own.  In this case, irq_enabled
-	 * need to be true for using vblank core support.
-	 */
-	drm->irq_enabled = true;
-
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
-- 
2.32.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
