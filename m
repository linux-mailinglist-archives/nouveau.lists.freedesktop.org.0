Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAE23F892
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355C6E23D;
	Sat,  8 Aug 2020 19:18:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Mon, 27 Jul 2020 11:07:07 UTC
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD3889C9C
 for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2020 11:07:07 +0000 (UTC)
Date: Mon, 27 Jul 2020 10:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595847546;
 bh=C2Tls7XnBwple+6sZaY3/0Um8GkV6jUDMiMGjv8ExNw=;
 h=Date:To:From:Reply-To:Subject:From;
 b=b81+BI01ZU6l5OR+kHzB/wbxC/oE16YmOjvkfaAcCl0Yc5GvLRmvzFJ/nHICX5puh
 MIOqb7aKuwwEfveAo4i+H1XFdwuoTO9hunCmiSsrG191+QOkv8CIQzwoAP61V8VxC8
 j/qSDatZXOl8HS7kFOfYzgqhl5B8AOp07eAJhq3s=
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
From: Studio_IKN <iknstudio@protonmail.com>
Message-ID: <TB7aP_CBiaV1xQxQXLcElMwJFbZSEyuDynYXmxQmCbVp0EmY_I12EQxlqb8pFc3GoKNhRAJgMnfldyQQFu36-xqu0pyDIXkkIJ44R_FaXiQ=@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: add config NvForceGpioReset
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
Reply-To: Studio_IKN <iknstudio@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some OEMs manage to mess up their VBIOS such that GPIO isn't initialized
correctly at boot time.  The NVIDIA proprietary driver seems to initialize
GPIO unconditionally at boot.  Nouveau doesn't because it assumes GPIO is
set up correctly.  This patch adds a new config option, NvForceGpio, which
allow users with broken VBIOS to force a GPIO reset at boot time.  This
issue seems to be rare enough to not warrant a DMI override.
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c     | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c    | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
index 1a39e52e09e3..842d16e93b40 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h
@@ -9,6 +9,7 @@ struct nvkm_devinit {
 	struct nvkm_subdev subdev;
 	bool post;
 	bool force_post;
+	bool force_gpio_reset;
 };

 u32 nvkm_devinit_mmio(struct nvkm_devinit *, u32 addr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 5b90c2a1bf3d..1b7535805e71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2836,6 +2836,11 @@ nvkm_device_preinit(struct nvkm_device *device)
 	if (ret)
 		goto fail;

+	if (device->devinit->force_gpio_reset) {
+		struct nvkm_gpio *gpio = device->devinit->subdev.device->gpio;
+		nvkm_gpio_reset(gpio, DCB_GPIO_UNUSED);
+	}
+
 	time = ktime_to_us(ktime_get()) - time;
 	nvdev_trace(device, "preinit completed in %lldus\n", time);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
index 4756019ddf3f..ddec3c16150f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c
@@ -133,4 +133,6 @@ nvkm_devinit_ctor(const struct nvkm_devinit_func *func,
 	nvkm_subdev_ctor(&nvkm_devinit, device, index, &init->subdev);
 	init->func = func;
 	init->force_post = nvkm_boolopt(device->cfgopt, "NvForcePost", false);
+	init->force_gpio_reset = nvkm_boolopt(
+		device->cfgopt, "NvForceGpioReset", false);
 }
--
2.27.0


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
