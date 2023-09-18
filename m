Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E47A53F4
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7B10E325;
	Mon, 18 Sep 2023 20:22:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C72D10E325
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-565334377d0so4047110a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068574; x=1695673374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+GwL34UY3LMOuiijNWiWYqgdtGcgymMT45lfWo9WBA=;
 b=DiSnhE5hrqYTLtwmG/sm2wOYCXW3lNxwsXNgohSEXu0thHlYPi0LOOmm7dFH+LuApM
 bYRi5mfGiY4H3aBv2pVgW8cooRV9u7VeJ1SRraJmYJ6eYUazw2wRH4plNb5mwzuOC3gr
 kUZKJ+VfKCxtFy/Sr8DCEO5yf89bnH/KF6tPwA9DNnlCg9PAG9UBxlV38hTPXcrn13BU
 8oiIQ39qfPhg3xnilAv39QSJl+ZMzZykfUb8OR0vmBw5vk093l6oF7zmI7pRMeobZKpK
 REbOSdzydyB44O/rsVc7On2ofc1rkbWYOWWt8I0sPxgmLnjc6FSXs3e6Nzp0BRhE4arz
 OArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068574; x=1695673374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+GwL34UY3LMOuiijNWiWYqgdtGcgymMT45lfWo9WBA=;
 b=t80WE5l66DG7dd2UuY/PggtHcCpxDvbMOYGx7fBLQD23kxNX4Hc6yblrF3dm++QsGH
 9MsLJFjJpEDhnmKPs6SRFDAQSfpO8wRT0k+ScRM1Igh+9g0ThCQQ+iW7t0mfgMww+vyK
 pihqI+vRzn2U/M2OxBi0RqK7R4NOij3JpCYT6XIoDDNsFLhMeOmGd8y+TwImTfAtmiFM
 qBT0RgPcBuX95ENzWRsjCI/hB7r4DMs2WSIaegoKMAQpw3pIGQJBE7sYCTu2053HKjlT
 6To3VW3XzUnMUaQIzSg+ha0Z1c5Lh46e6GXCK6SI/1IOefkakfeavLToCDPf08BNNKEj
 aB6Q==
X-Gm-Message-State: AOJu0Yy1Fig+HYa6wa/6TDD3WeYbRhmqY5IxDw7FLdNWUKwkgrk1sCOh
 XUdq1L8gJ7HJGfqAnZnIrzFwLfk7+BM=
X-Google-Smtp-Source: AGHT+IGRYM4fbLYsrpUvNP5KibDPXYLV0v6NYHEBcTNgpWiS7trgwZtK75430MRTuxS7XP+xBFei2A==
X-Received: by 2002:a05:6a21:498a:b0:159:ee0f:b9e9 with SMTP id
 ax10-20020a056a21498a00b00159ee0fb9e9mr10406587pzc.53.1695068574094; 
 Mon, 18 Sep 2023 13:22:54 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:53 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:28 +1000
Message-ID: <20230918202149.4343-24-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 23/44] drm/nouveau/ce/tu102-: prepare for GSP-RM
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

- (temporarily) disable if GSP-RM detected, will be added later

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
index 315a69f7fdd1..1c0c60138706 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
@@ -21,6 +21,7 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
 #include <subdev/vfn.h>
 
 #include <nvif/class.h>
@@ -88,5 +89,8 @@ int
 ga100_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_engine_new_(&ga100_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
index 461b73c7e2e0..9359c5e7aa3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 static const struct nvkm_engine_func
@@ -41,5 +43,8 @@ int
 ga102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_engine_new_(&ga102_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
index 9563c0175142..67d0545cf902 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 static const struct nvkm_engine_func
@@ -37,5 +39,8 @@ int
 tu102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_engine_new_(&tu102_ce, device, type, inst, true, pengine);
 }
-- 
2.41.0

