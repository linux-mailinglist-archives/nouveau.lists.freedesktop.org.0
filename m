Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188997A53F0
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFCD10E321;
	Mon, 18 Sep 2023 20:22:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5022910E320
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:46 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fe39555a0so4554504b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068565; x=1695673365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tODmmT8R+GWvtCSBwKVEwinuJj6qS+uFqPEuJpSEV+s=;
 b=QHzoy+G0z0X3JgtT3pvfz5PZY9lqaqNoRecb4EmevJLzDpyKwz0pO3worJBgQ75fs+
 F1Yn6A6K6TKKfybo8KfdJB4BW8gsMEDL9Qo5T/SEUYBJDCXfoLKLbEvDzS+k4tHKPgzf
 Tdl/oMq4WrCwVIU3iuNkgv7AxDb75QAhchtI2oIzV/mq8ScX9bnrdZSn8J9A9njwRNZm
 ePpmlheNB2GmjiZmYfWNa3QDI3bNmuGyGIr1iTSpnr5oNzuPrGUlcYoGr3JSjjxBlRyv
 9biT/YPi0yEkIk9wuqYBQZEcPsjt/bWi5+ZqMP1UQIxAg3dnBGg3TJ96WQAFvtKdETB3
 XvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068565; x=1695673365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tODmmT8R+GWvtCSBwKVEwinuJj6qS+uFqPEuJpSEV+s=;
 b=YOOqxRlWxkVNoYStBvZ7VuqZxkqsWbgMcazAyAVwoxbeSevIxs/vWt0qKL2Mb8ITVD
 a2fSbaFLx/7Fpbnt2ydSm29tyjCkYdF0euSDWVMiueny5ZymbJz5Z3svQCqK911GyUs8
 p5vt2GTtsGjaYhVI+EGy8EYAiVgAd3ZLZ37ODj9A4zToADvgtAZnwgTc0cd44xM/ndWy
 ipoFwVEZcmGBa73vlzptjPa0JQidH0Xhfug80knbLUdg8xfkh4dzEahYpC962aSNDoic
 OqRJNRxHEbz+l3qGy02QoyF3r6T1mJG6TalDlz8cn+De/EmnDz1CdP4xy/GxMu19JqHD
 7S7g==
X-Gm-Message-State: AOJu0Yz50XCOMGPCKWoQL+kooxM8UofHzT7JegBbZszs+KFcyVrhaWMs
 Gfs7iKKs3ymTsxx1+rewnle83QoymyM=
X-Google-Smtp-Source: AGHT+IGEJy+MfpzRKKCXBrqqIXXYSXcEIidiCwY4sNxalWqtkmR0Q1n6d2h2dteEnVZHF4CHwBcT4A==
X-Received: by 2002:a05:6a20:958d:b0:152:375d:ceea with SMTP id
 iu13-20020a056a20958d00b00152375dceeamr12352411pzb.15.1695068565462; 
 Mon, 18 Sep 2023 13:22:45 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:45 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:24 +1000
Message-ID: <20230918202149.4343-20-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 19/44] drm/nouveau/privring/tu102-: prepare for
 GSP-RM
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

- disable PRIVRING completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c
index b4eaf6db36d7..b4530073bfdc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static const struct nvkm_subdev_func
 gm200_privring = {
 	.intr = gk104_privring_intr,
@@ -32,5 +34,8 @@ int
 gm200_privring_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		   struct nvkm_subdev **pprivring)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_subdev_new_(&gm200_privring, device, type, inst, pprivring);
 }
-- 
2.41.0

