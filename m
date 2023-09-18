Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971AB7A53F7
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96810E32B;
	Mon, 18 Sep 2023 20:23:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D21A10E326
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:01 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-690bc3f8326so459580b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068580; x=1695673380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3nJx0m3yllVUKjX4MIap7RCIfuX5YCSqrVLaj2qjwM=;
 b=nTCtDYb5J60En3GdXSs7I3CO6uhSi8Ecmm+dB62z8LOEDQxGnCTmVG2f8Ruxnka5e0
 0ki+JDcNrBXUOlvC6fNv9Q2c/fDFmQ3e2k1ApsLjwk/hHrpYh6xY/CG/2MEaTcNOsXmz
 NACZleuFp67YpFdZN7LPld09LIGXpQkWmfncJufhUEbLTSL/XBYfgTpOmFOA+8IiHbVB
 UojWIswLLutRM8CHtn8LU1zA60BMH1n7QTWO8wxfd2rGpqzuWlI4EcAKz1Q0epUa0SaZ
 I0aElNURnA5jJvSdu4nr8dBnezj2mjdjSJcgCbBHrDdJBIlJgifTKboIJ8wPpOav/5Oa
 rehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068580; x=1695673380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3nJx0m3yllVUKjX4MIap7RCIfuX5YCSqrVLaj2qjwM=;
 b=P7tcHEoZjy+VNtzSw6xkiFkby+SPO/9u8R7QL+tIm1/+UnbZtY1g9u3ZLdpsgPtuqy
 6JPxIdMdVxIlnfnPWzcHmwCzxpCaE2SrQt+Mnh0j2SSS6/pOFfdvt5Rl+9YrP9gGBBGG
 cxJ8nPE/2az23+JPjNtx4bu+TZb43Lx0zcbWXebl/yRorqRRLNpn5YmtA4IXdlSXDamF
 o6HY2YwFeV2mtW5700/LfNyz8ovA3+f+CgTQiAhP9D8KwNe7EzZ5ySO342udxsZIp9wn
 b2MFovjluEYG4h7yEtoNwXfV2MZjJF5fgBYXvKTpDi9pNodC4ecIDwbeJl9JTXnBTh0k
 z35w==
X-Gm-Message-State: AOJu0YzuVah2h3scsrVP5cK/nidd6zPJyXqDoUfKYUPUz8+rM4U+qkm2
 BkJsdIeqGt34H/bIAkvgQdauUiGfcN0=
X-Google-Smtp-Source: AGHT+IFSiHxPK/KRL8z57pHwpF/EbrK/XZLgPMcKc2lOpJHjagkREJplPG8Z8+zPo8g5rjXx5hcnFg==
X-Received: by 2002:a05:6a21:999c:b0:15b:95ef:fee6 with SMTP id
 ve28-20020a056a21999c00b0015b95effee6mr3920992pzb.14.1695068580546; 
 Mon, 18 Sep 2023 13:23:00 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:00 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:31 +1000
Message-ID: <20230918202149.4343-27-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 26/44] drm/nouveau/gr/tu102-: prepare for GSP-RM
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
- make init() optional

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c  | 6 +++++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 5 +++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
index 0096ad401b15..f5e68f09df76 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
@@ -160,7 +160,11 @@ static int
 nvkm_gr_init(struct nvkm_engine *engine)
 {
 	struct nvkm_gr *gr = nvkm_gr(engine);
-	return gr->func->init(gr);
+
+	if (gr->func->init)
+		return gr->func->init(gr);
+
+	return 0;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index 00cd70abad67..2b51f1d0c281 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -23,6 +23,7 @@
 #include "ctxgf100.h"
 
 #include <core/firmware.h>
+#include <subdev/gsp.h>
 #include <subdev/acr.h>
 #include <subdev/timer.h>
 #include <subdev/vfn.h>
@@ -350,5 +351,8 @@ ga102_gr_fwif[] = {
 int
 ga102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return gf100_gr_new_(ga102_gr_fwif, device, type, inst, pgr);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index a7775aa18541..bda8054c6b59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -22,6 +22,8 @@
 #include "gf100.h"
 #include "ctxgf100.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 void
@@ -216,5 +218,8 @@ tu102_gr_fwif[] = {
 int
 tu102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return gf100_gr_new_(tu102_gr_fwif, device, type, inst, pgr);
 }
-- 
2.41.0

