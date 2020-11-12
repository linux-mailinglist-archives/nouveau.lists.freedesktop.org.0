Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD362B1435
	for <lists+nouveau@lfdr.de>; Fri, 13 Nov 2020 03:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E716E2C8;
	Fri, 13 Nov 2020 02:17:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00E46E3DA
 for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c16so6438367wmd.2
 for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=voWmA7JwfKGhDZMYWPZkZRLYOBpcwZ/fXqx90N9cMjo=;
 b=FOMvItAJ0Md9/XJuA8i3NbOckDk4OyHY1Ktg8z5bTbeyfc0VUbHX3JR6E5RjZjjOLM
 g8zu3Vbo3kidmyTmmILO+V6dNh/L5YGOcUSc1YNvp0u6MHND/MEYT8en0ADTe0yAmeaC
 YZHfPlZQ8MWUb2GiOtxikAMibM+p9fBEBBns6wi6v2IyzstBnvQRx7TOhF4T3DOibaMv
 mxb70HHdB+MFALg6+/9scGOQ2zDf4CkH0FMfqzn2Ihthew/b3VMySshovs1+V2DcsbfZ
 X5cAZmUaEG175AvGHinOFF6+L+O0UAVoTkh3GpCDODnM47mTc94g2g3YpDVwT0vQlqtf
 ZRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=voWmA7JwfKGhDZMYWPZkZRLYOBpcwZ/fXqx90N9cMjo=;
 b=O3EED9Twe8acuGh/VK2A7FnaIjvowWhqBbmTKQitsjaFIoInIJI3lrNFtZc5ATutpQ
 sGpjNAg72vE44qmFGhZHwDk0XNh/QiiQ8RPdwcGEjPpYDd7neaqdCG680FJWEq8GoqfN
 E06h2O/Efqux/Itr7QquSJrgQs/k1TyMqjEAHIJrx5NFI2MGO9AbtBTom7x7zlQ8ztrD
 rIoyssqFarV5ZCbN3H3YAPNR85re90Sm16ZN3Kcz8SVpob0quFx2jxbPZpxGN5OaKqzy
 HotC1utbQ+BdfyQRqA0UF3Y4qZxwmHLdMaU5tkg3B04MomdKDsvrpY42DesLevPd/aY3
 B46g==
X-Gm-Message-State: AOAM5338RMSxHHuRzP6Wv5AAtaKHNPpTv96VMT6Vthk9387WJazfx2g4
 49eymJaeGO/7TqS9VEmgqQ3Hxw==
X-Google-Smtp-Source: ABdhPJxgbkTD7w7l2/8P+0kdyuR2XtxgVvHmCxnBUy2gdjJyRwAkK9kAMbwjjejY5ibuuX3ZTC5D0w==
X-Received: by 2002:a05:600c:2285:: with SMTP id
 5mr1047874wmf.149.1605207702385; 
 Thu, 12 Nov 2020 11:01:42 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 12 Nov 2020 19:00:33 +0000
Message-Id: <20201112190039.2785914-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 02:17:36 +0000
Subject: [Nouveau] [PATCH 24/30] drm/nouveau/nvkm/core/firmware: Fix
 formatting, provide missing param description
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

... and demote non-conformant kernel-doc header.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'subdev' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fwname' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'ver' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:106: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_put'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 8b25367917ca0..ca1f8463cff51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -58,9 +58,10 @@ nvkm_firmware_load_blob(const struct nvkm_subdev *subdev, const char *base,
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
- * @subdev	subdevice that will use that firmware
- * @fwname	name of firmware file to load
- * @fw		firmware structure to load to
+ * @subdev:	subdevice that will use that firmware
+ * @fwname:	name of firmware file to load
+ * @ver:	firmware version to load
+ * @fw:		firmware structure to load to
  *
  * Use this function to load firmware files in the form nvidia/chip/fwname.bin.
  * Firmware files released by NVIDIA will always follow this format.
@@ -98,7 +99,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
 	return -ENOENT;
 }
 
-/**
+/*
  * nvkm_firmware_put - release firmware loaded with nvkm_firmware_get
  */
 void
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
