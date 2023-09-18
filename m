Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3F7A53ED
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9880310E318;
	Mon, 18 Sep 2023 20:22:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0282310E31E
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:40 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso4207311b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068559; x=1695673359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9pkCc9/TTVa18Uyd5e4RwUi2R2oAZ0EvFa55jBUwz8=;
 b=UArm6zVBQc2ra8YjPXGyA/AiRiqT7JpWSHl7dyOFc1XUSvkw1y7goVuToG9utL+S9T
 PIl8PzYP7RVqS+jU8OGw52qAofpaKrE0W1LCt6L/rG4uOTJZALQaJUB/i4LZ33olbSEq
 MjzJ7Gn9TqQftgYr8VsPekJbsOZRuztNDoOHe0CUE55mk76kHJwfTD84DvDhJkh0U5bZ
 pLB9Gj1SE7u31V+G8DgrAnliYMn6LWZ+7eb8Y2q3zDMdAFReyCzLAyyb+hMOZ8g/ElXv
 fRm9hlNXQe9c1MYpfcjTo/p1c0LeSp0d+LPab/i86kawY88B91rZq1XdzfnQpqZba3/1
 q/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068559; x=1695673359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9pkCc9/TTVa18Uyd5e4RwUi2R2oAZ0EvFa55jBUwz8=;
 b=TSGRCCLtcWXS3i08ikz4Uczy9kiAPmB20Jt8qZQpS8Ksqkf1/vIIGBklmaZvT+lfgC
 TASI1YPCumqS5dPprbGRsrLuggoALEo7mNIc6NPk4zGIpUuYASjf0jwR6iLpilTxM1zE
 ldME94Ofocv5oIYB32uFVT1mjj32+vjUW2lgSzpUuMEv60PS5CCRKIsHVDyrR1XDxWNG
 Wtz8QSxmmxE7TJQfx3iZeufqmHO1/UZOSZzFyKUljqU0xGeoKAz0hncdD5QNRjt2csCo
 C0QXcZBY5WsY/pDH+SNbsz6Gh/1SVchoOSMSDwOQDxb5CmkvNsQXihnhOc8N6KSi17it
 cU3g==
X-Gm-Message-State: AOJu0Yy3o8OhcEP0CObqa9R5I7vEUuNOx9Fo9TSvzpwl+3FcYtX2rHmZ
 tQiZGfe4aNgmn+kwHV/izAGwMCzv0jo=
X-Google-Smtp-Source: AGHT+IGHy1cM+Q6HLBTkJ9yKfVbgC2uILJfjFApcH2TX3XCSC9eigjwe65+3TfRjXJAkdl/28UoPCA==
X-Received: by 2002:a05:6a00:2283:b0:690:25fb:bac1 with SMTP id
 f3-20020a056a00228300b0069025fbbac1mr10403915pfe.18.1695068559014; 
 Mon, 18 Sep 2023 13:22:39 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:38 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:21 +1000
Message-ID: <20230918202149.4343-17-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 16/44] drm/nouveau/mc/tu102-: prepare for GSP-RM
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

- disable MC completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
index 5d28d30d09d5..65e9f04972dc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static void
 ga100_mc_device_disable(struct nvkm_mc *mc, u32 mask)
 {
@@ -72,5 +74,8 @@ ga100_mc = {
 int
 ga100_mc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_mc **pmc)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_mc_new_(&ga100_mc, device, type, inst, pmc);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c
index eb2ab03f4360..05d2fa95e05e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 const struct nvkm_intr_data
 gp100_mc_intrs[] = {
 	{ NVKM_ENGINE_DISP    , 0, 0, 0x04000000, true },
@@ -98,5 +100,8 @@ gp100_mc = {
 int
 gp100_mc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_mc **pmc)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_mc_new_(&gp100_mc, device, type, inst, pmc);
 }
-- 
2.41.0

