Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE97A53E9
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0110E317;
	Mon, 18 Sep 2023 20:22:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515FB10E311
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:31 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68fdd6011f2so3682700b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068550; x=1695673350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLJN0hXRhcX+X6Kt1aMP5iExXYosFBVg15gQ1e3NlS4=;
 b=A99XZURm8OHXfydv4XiB3WVAxJ4vo0o01W2rn6aLAORlUbUuG+P+CmgVZYRL2JyxEC
 oaB1Wz7eitKf2+FmiQevgfhQWpll5mzd4MzkWYkIxqLjjBC2F4rUgAdoPhTeGbA6yiUj
 qjUtYx2XSHoKNI+R9xG+wOPZc3SCTwhWQ8Z4AK5D/EJzZZhISDy45FFWEBP8AnWTphnV
 HBl7tFnA/5bLpijKTUK+Wa7cViUhtzaUn4+TlmGaVkpXO38tkfjFLBGwcln+EHgpbLf+
 u8JYEPjleTbm6p5L0t73fGokrv7yieWTNSAAXePFPG8Wp8AglecVtA/Z3c79QZhdABMc
 K7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068550; x=1695673350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLJN0hXRhcX+X6Kt1aMP5iExXYosFBVg15gQ1e3NlS4=;
 b=fEBnhmfuxDbEw+mWRxIRigGY1lnVVfMjG6rMHmq5VLVsMCy8hzdw2R//EuN+i4Vxn2
 J2ln/tIIjD4KvmAog3SFuDuiHAVGGp6KZkIZqHpSwac1AXBai+c/YBop0b6gxHUtlx2N
 Hxj/qXwqT03R+YjXkMqfyblQ0Cgmk5i6MfB+tDoftSX5teGyiT9GBHZsR/dUe2jOtLia
 C+lff3tr9UyPGSDPw+SdxWQypkSoZUq07PZ6JGUZt6txageI9juUfeUTAHyOyRWtKllk
 oDt7a/4R00qEHA8je2SXgQ8P6ep8tEt0jJQLXVynAGn5kK+CpFgb5U5c8Q2J3RsEz1RQ
 D14Q==
X-Gm-Message-State: AOJu0Yxg3Erp0t6KBJTEZetskdH3zOaxH6sxu1bxBehDjMOZTMQYm8MA
 CT5wBVZlcmJgwcVjW1mA50K9+ymkbVE=
X-Google-Smtp-Source: AGHT+IHMAuiosRtVDu9ph1+zEBIC9JzU1Z7OImtUjhQUrGhYQNh9bKdoawzWlXZ+shN/C2I9R24o/w==
X-Received: by 2002:a05:6a00:2308:b0:68b:c562:da65 with SMTP id
 h8-20020a056a00230800b0068bc562da65mr10484285pfh.26.1695068550384; 
 Mon, 18 Sep 2023 13:22:30 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:29 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:17 +1000
Message-ID: <20230918202149.4343-13-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 12/44] drm/nouveau/gpio/tu102-: prepare for GSP-RM
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

- disable GPIO completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c
index 4a96f926b66d..4dbffae21ddc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static void
 ga102_gpio_reset(struct nvkm_gpio *gpio, u8 match)
 {
@@ -115,5 +117,8 @@ int
 ga102_gpio_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_gpio **pgpio)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_gpio_new_(&ga102_gpio, device, type, inst, pgpio);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
index c0e4cdb45520..5f7063d5579b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static void
 gk104_gpio_intr_stat(struct nvkm_gpio *gpio, u32 *hi, u32 *lo)
 {
@@ -71,5 +73,8 @@ int
 gk104_gpio_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_gpio **pgpio)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_gpio_new_(&gk104_gpio, device, type, inst, pgpio);
 }
-- 
2.41.0

