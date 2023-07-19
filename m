Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFB758CB8
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 06:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2D610E0FA;
	Wed, 19 Jul 2023 04:41:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131AE10E0FA
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 04:41:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2633fe9b6c0so274203a91.1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jul 2023 21:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689741674; x=1692333674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXiwQbFGeZPKnMc/2mtNfvQTusq2q54vT6J+mtO4ZpI=;
 b=deMMVD3EPBjxiCUQg9NLZHUsHYz2GWhewdLLctQ58nj6JYKYd/O0obFfjwiqYlTiq4
 Toznz9jFVGIsL0ndwG4H8zrtOFH1WiozTwvbDEmHTmdeYaUkXiwXfemjkb2RzXXQRdS6
 YlivkJzELpjH65Yog4pb8LwWH1so0t795rUUXlZUoYppnpXcVYASFa92vzi30DZe2v0Y
 iRMn6DceYJMKvzxKIDkJBaH2fN6Vk8sK5pk3sIzsITQiU4y5jHCG9PaEp0AAxmj/o4Sr
 QJeZguMGTc5nlFaxVrsCbMkQ10SE5OO892PRIjs5MdBwWz4STG4hfX2MXeY5y9kYJLVR
 R/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689741674; x=1692333674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXiwQbFGeZPKnMc/2mtNfvQTusq2q54vT6J+mtO4ZpI=;
 b=JqS40RdnZuIDh6WuB7i9dU4oICEluL8TcIKhNdwlX1PRqO5QF4qwI3vZpdNF9r2WJR
 lriEYvrV6gdh8hEqErkBhEzzq4/c5d8+rfKmUOmcn35jVY+keaooFAhLWsh817CGGUn4
 Gy6RfcsHVbC+lY32fg5xmwU9Nq0/E9BTsOAzCPjpE7ieSQs+mqNI0IMJKMnXqX6valMl
 7f0mFiJvX0wT13Bm5ZxvlstqXojimLdpg7XvfVGUr/jTTH+VTuswtl9wj4qm8BloDxBQ
 +qvwcxMd7FMJQFxTcwTFkkxC5texZTLK4pKmQ40p92Aa0kzCaJYA0OHDMcj8daeuf5U3
 ERgQ==
X-Gm-Message-State: ABy/qLZgdY/PfBHcQAoUQTFYUIXEcTIkahlUGcCfuvzTR2apGUORT9ef
 CU/7QOZHXFsPE8tx/EJl1L6zg6eQrVc=
X-Google-Smtp-Source: APBJJlED3MBd9P0Egx4wdDQQ2kf3U4kxF+niFB2TaS2xetD9w1j4mfPcQX4skP62w/F4ePI/CuorPw==
X-Received: by 2002:a17:90a:644f:b0:263:1f1c:ef49 with SMTP id
 y15-20020a17090a644f00b002631f1cef49mr1496869pjm.13.1689741673836; 
 Tue, 18 Jul 2023 21:41:13 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ji2-20020a170903324200b001b53be3d942sm2740930plb.232.2023.07.18.21.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 21:41:13 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 19 Jul 2023 14:40:50 +1000
Message-ID: <20230719044051.6975-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719044051.6975-1-skeggsb@gmail.com>
References: <20230719044051.6975-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 2/3] drm/nouveau/disp: PIOR DP uses GPIO for HPD,
 not PMGR AUX interrupts
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

Fixes crash on boards with ANX9805 TMDS/DP encoders.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index dad942be6679..46b057fe1412 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -81,20 +81,29 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 		return -ENOSYS;
 
 	list_for_each_entry(outp, &conn->disp->outps, head) {
-		if (outp->info.connector == conn->index && outp->dp.aux) {
-			if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_I2C_PLUG;
-			if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
-			if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_I2C_IRQ;
+		if (outp->info.connector == conn->index)
+			break;
+	}
 
-			return nvkm_uevent_add(uevent, &device->i2c->event, outp->dp.aux->id, bits,
-					       nvkm_uconn_uevent_aux);
-		}
+	if (&outp->head == &conn->disp->outps)
+		return -EINVAL;
+
+	if (outp->dp.aux && !outp->info.location) {
+		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_I2C_PLUG;
+		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
+		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_I2C_IRQ;
+
+		return nvkm_uevent_add(uevent, &device->i2c->event, outp->dp.aux->id, bits,
+				       nvkm_uconn_uevent_aux);
 	}
 
 	if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_GPIO_HI;
 	if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
-	if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ)
-		return -EINVAL;
+	if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
+		/* TODO: support DP IRQ on ANX9805 and remove this hack. */
+		if (!outp->info.location)
+			return -EINVAL;
+	}
 
 	return nvkm_uevent_add(uevent, &device->gpio->event, conn->info.hpd, bits,
 			       nvkm_uconn_uevent_gpio);
-- 
2.41.0

