Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4D758CB7
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 06:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C367E10E0F3;
	Wed, 19 Jul 2023 04:41:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9010E0F3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 04:41:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b8bbcfd89aso38353655ad.1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jul 2023 21:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689741672; x=1692333672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFJjSHu+NQ89RAHFANcr2ueFzvnJqbes+CL/7Vnga1I=;
 b=rOJfGLCJSE6iqceyqE2puj86UNchslOBdhuDX3rqzAQJzniqe/aTtkdxW9h7mRAnx5
 oxtOJKMyfx2a/Dgush/DZp2/9bkYt7SaLph0YAvUo4v6QS/jBBRgzHGhlVoVcFRXDcup
 qLJNbYxaK3DwfSWA6TXnNOpgJQi6Ui7mGXhMFYhyuVgMTevxu5H9fL60zpKYsqyUjG9E
 9G8k6ccpYO/euEW93uJNx5kqDgS9iFocvjKC455HFo4FNmFwoLYRp5j9lR2+YbPSqRLt
 eeVkdEhgmbGghclChi4Ba3qFVeC3xNczZKlrWW3dR98oOqlfIl2xYuWR4ztjJr80LACO
 d7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689741672; x=1692333672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFJjSHu+NQ89RAHFANcr2ueFzvnJqbes+CL/7Vnga1I=;
 b=YoLolUH9mFdsBP5IgtC7WWFjgX98TtZ21nlTRD0WVz7KsR/iMUfb06Mk66mDEA6G7G
 unzEfeBDR8SyUrnADUQvULvMQrjXWiPPZAPgDSh3lr1LHZ94nLRastzdakYmi4AFxGlE
 n2/qvJmDaYmJooD+cUwZUFI5bjBqXTfi3Vvef6UOX6Eupw7V64HNck1EIfb97fEYN6nE
 xY+3OeD/60FeUzxvOXEkhRx6HLbCKUxBD0qzDn7GB0NpzfPEYG3U/4V8i0VfD4KvaxdD
 pv56zdE3UhLA611qF7qjs/oqPU3cJBUAHggvUBEM7ifxkW4il3QliCSj6sFQs6MCWzTF
 2SMg==
X-Gm-Message-State: ABy/qLYXd260w3XObpFbi048/TZQ0wMWoNfYlaXsuqABKixM9NXfvpgT
 2jiSQSNdZDKbk/SXIXg9y54uGPPdZds=
X-Google-Smtp-Source: APBJJlF66TzRMuuIEKYfiwOjOOF4xtrm7U/G97lqshfb/NFE2+7VCZp4E62wLToRHnJEP1gAB6vSPw==
X-Received: by 2002:a17:902:e54b:b0:1b9:ebf4:5d2 with SMTP id
 n11-20020a170902e54b00b001b9ebf405d2mr15732057plf.33.1689741671688; 
 Tue, 18 Jul 2023 21:41:11 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ji2-20020a170903324200b001b53be3d942sm2740930plb.232.2023.07.18.21.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 21:41:11 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 19 Jul 2023 14:40:49 +1000
Message-ID: <20230719044051.6975-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 1/3] drm/nouveau/i2c: fix number of aux event slots
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

This was completely bogus before, using maximum DCB device index rather
than maximum AUX ID to size the buffer that stores event refcounts.

*Pretty* unlikely to have been an actual problem on most configurations,
that is, unless you've got one of the rare boards that have off-chip DP.

There, it'll likely crash.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c    | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h
index 40a1065ae626..ef441dfdea09 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h
@@ -16,7 +16,7 @@ struct nvkm_i2c_bus {
 	const struct nvkm_i2c_bus_func *func;
 	struct nvkm_i2c_pad *pad;
 #define NVKM_I2C_BUS_CCB(n) /* 'n' is ccb index */                           (n)
-#define NVKM_I2C_BUS_EXT(n) /* 'n' is dcb external encoder type */ ((n) + 0x100)
+#define NVKM_I2C_BUS_EXT(n) /* 'n' is dcb external encoder type */  ((n) + 0x10)
 #define NVKM_I2C_BUS_PRI /* ccb primary comm. port */                        -1
 #define NVKM_I2C_BUS_SEC /* ccb secondary comm. port */                      -2
 	int id;
@@ -38,7 +38,7 @@ struct nvkm_i2c_aux {
 	const struct nvkm_i2c_aux_func *func;
 	struct nvkm_i2c_pad *pad;
 #define NVKM_I2C_AUX_CCB(n) /* 'n' is ccb index */                           (n)
-#define NVKM_I2C_AUX_EXT(n) /* 'n' is dcb external encoder type */ ((n) + 0x100)
+#define NVKM_I2C_AUX_EXT(n) /* 'n' is dcb external encoder type */  ((n) + 0x10)
 	int id;
 
 	struct mutex mutex;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
index 976539de4220..731b2f68d3db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -260,10 +260,11 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, struct nvkm_device *device,
 {
 	struct nvkm_bios *bios = device->bios;
 	struct nvkm_i2c *i2c;
+	struct nvkm_i2c_aux *aux;
 	struct dcb_i2c_entry ccbE;
 	struct dcb_output dcbE;
 	u8 ver, hdr;
-	int ret, i;
+	int ret, i, ids;
 
 	if (!(i2c = *pi2c = kzalloc(sizeof(*i2c), GFP_KERNEL)))
 		return -ENOMEM;
@@ -406,5 +407,11 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, struct nvkm_device *device,
 		}
 	}
 
-	return nvkm_event_init(&nvkm_i2c_intr_func, &i2c->subdev, 4, i, &i2c->event);
+	ids = 0;
+	list_for_each_entry(aux, &i2c->aux, head)
+		ids = max(ids, aux->id + 1);
+	if (!ids)
+		return 0;
+
+	return nvkm_event_init(&nvkm_i2c_intr_func, &i2c->subdev, 4, ids, &i2c->event);
 }
-- 
2.41.0

