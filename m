Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A769065D
	for <lists+nouveau@lfdr.de>; Thu,  9 Feb 2023 12:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFBB10E156;
	Thu,  9 Feb 2023 11:16:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37010E156;
 Thu,  9 Feb 2023 11:16:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FFD3B81FF4;
 Thu,  9 Feb 2023 11:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BDAC433D2;
 Thu,  9 Feb 2023 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941394;
 bh=fmwrvlSnzYMpOU6Bb/kbeD5NAHZC6hAf1LWtjxppyh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fe7a0eF2Z/4f9pzwCIURmjMK00WA6oNYBctLOZ2rUVv8emKe66aOp34YibkHvI5sp
 jsqZ6GQ/SSaeUPNv/TMIIKhVPt03ZxGNSGbk+wgbdS3nTxK5mohThnmdzPavPYog3r
 PnQ32mRW3UAdJQrRwyp0RPPBQ9GPEgA2TIgK+ahG4CnNZmaTjXHU3xgjXkEv0RCmiM
 BZ2a84SOY3MM/mLd5PC5aaay3x+SME3B6aE4sbtawjytIdyLFHGkNk7TDFuAjI7NPj
 6FjOQG5KN6nNx8kHeLf5tPqyIdrPOIANzOm8lC7KGZmsuNSX37QLkHzOhFZErBSZc3
 sjeeNOsVkVLkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Feb 2023 06:14:41 -0500
Message-Id: <20230209111459.1891941-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH AUTOSEL 6.1 22/38] drm/nouveau/devinit/tu102-:
 wait for GFW_BOOT_PROGRESS == COMPLETED
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit d22915d22ded21fd5b24b60d174775789f173997 ]

Starting from Turing, the driver is no longer responsible for initiating
DEVINIT when required as the GPU started loading a FW image from ROM and
executing DEVINIT itself after power-on.

However - we apparently still need to wait for it to complete.

This should correct some issues with runpm on some systems, where we get
control of the HW before it's been fully reinitialised after resume from
suspend.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230130223715.1831509-1-bskeggs@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/nouveau/nvkm/subdev/devinit/tu102.c   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 634f64f88fc8b..81a1ad2c88a7e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -65,10 +65,33 @@ tu102_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 	return ret;
 }
 
+static int
+tu102_devinit_wait(struct nvkm_device *device)
+{
+	unsigned timeout = 50 + 2000;
+
+	do {
+		if (nvkm_rd32(device, 0x118128) & 0x00000001) {
+			if ((nvkm_rd32(device, 0x118234) & 0x000000ff) == 0xff)
+				return 0;
+		}
+
+		usleep_range(1000, 2000);
+	} while (timeout--);
+
+	return -ETIMEDOUT;
+}
+
 int
 tu102_devinit_post(struct nvkm_devinit *base, bool post)
 {
 	struct nv50_devinit *init = nv50_devinit(base);
+	int ret;
+
+	ret = tu102_devinit_wait(init->base.subdev.device);
+	if (ret)
+		return ret;
+
 	gm200_devinit_preos(init, post);
 	return 0;
 }
-- 
2.39.0

