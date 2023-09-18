Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4A7A53F2
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6732610E31E;
	Mon, 18 Sep 2023 20:22:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77F410E322
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:50 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690bccb0d8aso342197b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068570; x=1695673370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHkA9su4dBVsDsE50XTpLogd3hLNtSrbpgnCo5LJNIk=;
 b=ZNncVuNd9zBgjzjndUXeg2LbPZV2I7dJM4Ot+J9S2Pg8yHW35pAxCE1c5M6+KQsLfd
 Ezu7pJsGxIs4k70A4MQJOfbtCyp4Uy6/bUihn/fbI+bmVvZzMeiuSG9n1uDexnXatcOV
 S2axsfNDSOO2T2gTacZ6DHf8qoFLi9anFL6g/qF6O+PYP8cQyFjuVWGGRBevKUPwK6Px
 qr7i0dQ6OsWALbirCnktCnFp0+Jnev3bpb0scPGxD+zClomYFBn7TTcQH3rxV4sCmc7C
 qqIhBNwAKi4ok8MS0gNjyj4mlCZz6uwTB7xkQhok4GBKqaOGLgmxSBxQWIXNAkJ6Gbg/
 TvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068570; x=1695673370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UHkA9su4dBVsDsE50XTpLogd3hLNtSrbpgnCo5LJNIk=;
 b=GIxkpWj8CSQ5fKryAYNJOBt+2V1bt6FW1JIlFVl6xLacha66t67Y+0AOW7Xmxnx756
 DiFlTvFvvOYHKsNwjI3oYnNIA9iqCeN2j+iNPpADL6Bp4MrDkrS06Dt+eINnWJkoaWsH
 ziRUntQkrOWJkIOrm9RsBaY+PVZrsR+CyDfHNtz/y6rEKihNX+95JcJdu/mv9Z4A6URr
 wqjJuFzls67g4N2Jtc17uX/Evk1HTE9Q9JL+J8fO1h190/UfZHXBRatk/koraJYkqQ1z
 UwMThOGoBQHWj4TztzzWnwFHzHohbqHLqmpf0Ppqt/oZfZonrpFF9Flnk7KPAmaFAaEs
 qisQ==
X-Gm-Message-State: AOJu0YykoaFlHggtpz7vElcK2mYli5pUZ1PualF8Y9DMHkWkyHgbZa86
 JcqKv1H3xAR3+c0PlQickrpCN2+PUdQ=
X-Google-Smtp-Source: AGHT+IGuadnqmgXgGaOcpg1cugAmUTmwMP4wX8TRty7L2ktGGgjno/xVhXr7SFiBXGa0GqYjw1sZTA==
X-Received: by 2002:aa7:88cd:0:b0:68f:c9df:2ccb with SMTP id
 k13-20020aa788cd000000b0068fc9df2ccbmr9956606pff.1.1695068569760; 
 Mon, 18 Sep 2023 13:22:49 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:49 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:26 +1000
Message-ID: <20230918202149.4343-22-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 21/44] drm/nouveau/top/tu102-: prepare for GSP-RM
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

- disable TOP completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c | 5 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
index 4fa6e2f19bfe..129eabb8b9e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static int
 ga100_top_parse(struct nvkm_top *top)
 {
@@ -104,5 +106,8 @@ int
 ga100_top_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_top **ptop)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_top_new_(&ga100_top, device, type, inst, ptop);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
index 0f1675e57256..da55dac8c286 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static int
 gk104_top_parse(struct nvkm_top *top)
 {
@@ -115,5 +117,8 @@ int
 gk104_top_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_top **ptop)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_top_new_(&gk104_top, device, type, inst, ptop);
 }
-- 
2.41.0

