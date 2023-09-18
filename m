Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F657A53EC
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246CF10E31F;
	Mon, 18 Sep 2023 20:22:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDE410E31B
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:37 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fe2470d81so4568171b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068557; x=1695673357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBG++VnOSkMskJhdromdxm717v1JiGMa3XbDlHhLbso=;
 b=JndpmS6uScQ60h/b4zX8g7Jx7nkCZ9l+418RoYQK0uDuXh1kVz9EviGyQZh/h4b77j
 V9PLwaENAkN092KwEURFPPgxvWStFHTeaqZGxbaURZnZ9rwuLFfTHCmASHWEK8TFbZNY
 BL3MSvUFwPrfkA0KzwnQQ6iCF5XOKtE5ZadqjgZWlajxXbUTYfCIOa9W7kWhXscmzYmM
 Yo7sP3DZp+kLFQcGEIjfdrV5nP7E3fwfNDgMKRmCa+6U3jTCWZ8kxA1wDN1ho2stkDYl
 35bFnWt3dlQ9ZaqawUJqu65v/p/+DaQ9l2Z0ovCAhoKyCZxg/CSNBw/tq3yEI67s0jO6
 AYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068557; x=1695673357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBG++VnOSkMskJhdromdxm717v1JiGMa3XbDlHhLbso=;
 b=YAYoOS/mQ1DF1AS5IoAe7Bn5DVSGG/+ryoR1sr0RQqb57BMH0f3RJQfzgbstRrKPYH
 RwfgqKwT9koDA3EddgUjMrm/Hoydor2Bg85gseTiwbqVqqjT5/S3HmdnLfWkygTsp0ov
 wjcfyrUeqONQTuWsfOw0aN+ohxm4n/Tz0NX73cltF94U+qB0+kGHfqyu7zCiUQlQlAZE
 F9IcAv1a4+gZ4GrXF35w0MJMtT75JAlqMpj1FGPZBddyUZEVubVU4XNFcapzwU5k13AZ
 8eWYD3LhIehbjLk8vOMl+bTKmMDopVf9124pNrDxlBzrjzC/NRj6Ou/MpioDG3E1vT5D
 nTxA==
X-Gm-Message-State: AOJu0YwwgZwb7/ure7B/g2rtqsLEI4PZzZqgA4SRn7eP59ulzYJb6vyx
 6600sDW51ionIBCVUHQjob/Dkr6CLHg=
X-Google-Smtp-Source: AGHT+IG8Q0xSQwPhhNRnHoZUVA51zIqE5VuiEDfICCLPEA/4uETLWoqc5t/rfiq+xrR7uKFlX5wzVg==
X-Received: by 2002:a05:6a20:4304:b0:134:30a8:9df5 with SMTP id
 h4-20020a056a20430400b0013430a89df5mr12964834pzk.43.1695068556852; 
 Mon, 18 Sep 2023 13:22:36 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:36 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:20 +1000
Message-ID: <20230918202149.4343-16-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 15/44] drm/nouveau/ltc/tu102-: prepare for GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- disable LTC completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c
index 159d9f8c95f3..951f01e3032a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static void
 ga102_ltc_zbc_clear_color(struct nvkm_ltc *ltc, int i, const u32 color[4])
 {
@@ -53,5 +55,8 @@ int
 ga102_ltc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_ltc **pltc)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_ltc_new_(&ga102_ltc, device, type, inst, pltc);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c
index 265a05fd5f6b..053302ecb0a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 void
 gp102_ltc_zbc_clear_stencil(struct nvkm_ltc *ltc, int i, const u32 stencil)
 {
@@ -49,5 +51,8 @@ int
 gp102_ltc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_ltc **pltc)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_ltc_new_(&gp102_ltc, device, type, inst, pltc);
 }
-- 
2.41.0

