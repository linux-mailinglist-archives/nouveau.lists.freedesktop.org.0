Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E965758CB9
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 06:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CDF10E101;
	Wed, 19 Jul 2023 04:41:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E55D10E0FA
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 04:41:17 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bb1baf55f5so38717925ad.0
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jul 2023 21:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689741676; x=1692333676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmDxeFemyn1OSTHzP25E+hPbQYk1zRbRGkryNbwOYOc=;
 b=RCfrsmlHseYqhR1g4zw63Rexms0CNPHiPwECWBhXjOph+upSk0YoVchAzvAmX2WUY1
 C6Z3SCrLjNU5D1aRW+30zxZsji6tEDzGA4ptan/6H2nUkO4Ib7vEPMkOm64nMg7MdRUm
 JH1iKI6VBalXbBXbv+jPdXx8HQhNN+rEFoN9imUY5brwbTmcK+OX42DkKoEcOgZEPJMd
 JlfO1pDx9wjc7KP1A880nYKw9E1mAo/WxTnJESfLTCEti0Nf387bTD6fTx56yzlWpokh
 yeVHw3YLDZNyj687PzPKa9mUJtEBre5+iWT0BWVAZ/9b0x5VjjiVGtXEcfJ88Khmd1je
 rjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689741676; x=1692333676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmDxeFemyn1OSTHzP25E+hPbQYk1zRbRGkryNbwOYOc=;
 b=lg8nSbeEc4aXRBWMhvf4hfyEncU3EC3yOnRZgCdKmoECWyrurISy83U4fhDNnfkPwK
 RvJyAPgT4ePCUsGeIb6f9tsrqcF2WbbXVgkiwgGbh5djMbgrlhyDV4M5iSqAJBKNxMKc
 5CgwvISDe9rsHlkY/7r3VjJJAtVxTujLtwNnjMZTju6xQNEoSHikuUMelc+xk6MyB4kQ
 YhDxDDckZB36FccIHpikK1hj7dE6zyWluprGSCCStN+vfNhmHcCDCdRxjkUVFbDyV6jO
 lMXrkQ7E1lqD4VrXQztodqNU2WOt9gffpPBYqi6xarb8cvtrN1+MYiRobQfan99aPmvY
 KPAA==
X-Gm-Message-State: ABy/qLa6rYeq07OAU/7S3t0E1QyyN0mZULEsGCpyysTWayakBW/BD2PW
 mr6xjf/APSj0DGrw6KON+rJy9IwZiG4=
X-Google-Smtp-Source: APBJJlG96pP+8CtbdrdTS8drsuh2OgsE9hRJhnAbBxvUH5e5oy7A4taucBz4xhffgxxPwqATydS1Cw==
X-Received: by 2002:a17:902:868a:b0:1b8:1335:b775 with SMTP id
 g10-20020a170902868a00b001b81335b775mr15293149plo.0.1689741675919; 
 Tue, 18 Jul 2023 21:41:15 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ji2-20020a170903324200b001b53be3d942sm2740930plb.232.2023.07.18.21.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 21:41:15 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 19 Jul 2023 14:40:51 +1000
Message-ID: <20230719044051.6975-3-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719044051.6975-1-skeggsb@gmail.com>
References: <20230719044051.6975-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 3/3] drm/nouveau/kms/nv50-: init hpd_irq_lock for
 PIOR DP
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

Fixes OOPS on boards with ANX9805 DP encoders.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 42e1665ba11a..1ecd3d63b108 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1873,6 +1873,8 @@ nv50_pior_destroy(struct drm_encoder *encoder)
 	nvif_outp_dtor(&nv_encoder->outp);
 
 	drm_encoder_cleanup(encoder);
+
+	mutex_destroy(&nv_encoder->dp.hpd_irq_lock);
 	kfree(encoder);
 }
 
@@ -1917,6 +1919,8 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	nv_encoder->i2c = ddc;
 	nv_encoder->aux = aux;
 
+	mutex_init(&nv_encoder->dp.hpd_irq_lock);
+
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-- 
2.41.0

