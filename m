Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067D1C07AE
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 22:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B886E440;
	Thu, 30 Apr 2020 20:18:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607686E43D;
 Thu, 30 Apr 2020 20:18:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 18so421512pfx.6;
 Thu, 30 Apr 2020 13:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=c6sNQQbXXpU5p2FuijRbtB6WLWnnDlNaexeMBmOH9os=;
 b=AMJF0mMZCNk2Aie4LhGSvy4Yz8R7SHPXqoWRRSAOz3mGEvgEKilOJKxXS8id9b2bLa
 2TyI2vxvVgmfLzZzo8yTylejyILFUMIFiNpKAwEkh6axdilQdDkAym/zL0CQ+2qToaHn
 jWW6pZ6IKhzrPaHUBgDNIUwUXRUUprx17V4yYEY+N7nMd3q0kpczZIhDXs75wgAdroEz
 mv1MzrdBgMJb6BO2IaCTX99B60dnOEuJRnkas1LLa4xluStvlTqZHJik6SDh/mHJONZY
 q9whWQRov+7VO3rosvRJji6yxbZPfqnNSzh6agjnYFJuxq8gNzk8rxi1GRWU4vW/Z+8d
 EYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=c6sNQQbXXpU5p2FuijRbtB6WLWnnDlNaexeMBmOH9os=;
 b=srtvIZsvWmB1N6QunXAk3YgE1puoYvfT08SGtfySg1kPqXN4zPOgbT7x8CRDIPQ2PI
 0qtKprNQOdg+PLb97yrodDpeyo9/sAwMEoXD7mL+PuVx9VrP7pYG6YgNZSyDq2ak5WHj
 wkxUgbO8jixeFKLVZBgLUDJW/OFuEH3olkEcN3kgRJnCI9QdeN4Ag/IA8hPpEUlX8icz
 meOIAhCDufnfEamzFYbG3d5HrbHsdwfCz3Zs2bm5IIARsU9FVkF1Wsw0nnkTVUcCVgA5
 1biky9Y8dwDqj5XD1qYY7eP3llu+kOP14XZBe4flYUlf9DbMiiSjTWZ/kogd4oMeorPB
 2LAw==
X-Gm-Message-State: AGi0PuYPE3PGtt7oEUjE1wDBuDqBs9Yvk49JObPVs7sLf26m2bydbkr4
 m3DL5371UuK8umflSax8wD3HOTZsEDQ=
X-Google-Smtp-Source: APiQypKPGdVlOsYhKcq1mKI7cuDudA78+0Dqfc8fvIvzCBbopM81voaAfO9uBe+SDndiAY1gpae/Sg==
X-Received: by 2002:a63:5907:: with SMTP id n7mr652937pgb.439.1588277936882;
 Thu, 30 Apr 2020 13:18:56 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.43.171])
 by smtp.gmail.com with ESMTPSA id 14sm523310pjd.36.2020.04.30.13.18.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:18:55 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, tzimmermann@suse.de,
 alexander.deucher@amd.com, lyude@redhat.com, sam@ravnborg.org
Date: Fri,  1 May 2020 01:56:53 +0530
Message-Id: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv04: Remove dead code
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
Cc: nouveau@lists.freedesktop.org, inux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

These are dead code since 3.10. If there is no plan to use
it further, these can be removed forever.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 1f08de4..ad0ef7d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -269,31 +269,11 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 		horizStart = horizTotal - 5;
 		horizEnd = horizTotal - 2;
 		horizBlankEnd = horizTotal + 4;
-#if 0
-		if (dev->overlayAdaptor && drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
-			/* This reportedly works around some video overlay bandwidth problems */
-			horizTotal += 2;
-#endif
 	}
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		vertTotal |= 1;
 
-#if 0
-	ErrorF("horizDisplay: 0x%X \n", horizDisplay);
-	ErrorF("horizStart: 0x%X \n", horizStart);
-	ErrorF("horizEnd: 0x%X \n", horizEnd);
-	ErrorF("horizTotal: 0x%X \n", horizTotal);
-	ErrorF("horizBlankStart: 0x%X \n", horizBlankStart);
-	ErrorF("horizBlankEnd: 0x%X \n", horizBlankEnd);
-	ErrorF("vertDisplay: 0x%X \n", vertDisplay);
-	ErrorF("vertStart: 0x%X \n", vertStart);
-	ErrorF("vertEnd: 0x%X \n", vertEnd);
-	ErrorF("vertTotal: 0x%X \n", vertTotal);
-	ErrorF("vertBlankStart: 0x%X \n", vertBlankStart);
-	ErrorF("vertBlankEnd: 0x%X \n", vertBlankEnd);
-#endif
-
 	/*
 	* compute correct Hsync & Vsync polarity
 	*/
@@ -492,14 +472,6 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	/* Except for rare conditions I2C is enabled on the primary crtc */
 	if (nv_crtc->index == 0)
 		regp->crtc_eng_ctrl |= NV_CRTC_FSEL_I2C;
-#if 0
-	/* Set overlay to desired crtc. */
-	if (dev->overlayAdaptor) {
-		NVPortPrivPtr pPriv = GET_OVERLAY_PRIVATE(dev);
-		if (pPriv->overlayCRTC == nv_crtc->index)
-			regp->crtc_eng_ctrl |= NV_CRTC_FSEL_OVERLAY;
-	}
-#endif
 
 	/* ADDRESS_SPACE_PNVM is the same as setting HCUR_ASI */
 	regp->cursor_cfg = NV_PCRTC_CURSOR_CONFIG_CUR_LINES_64 |
-- 
1.9.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
