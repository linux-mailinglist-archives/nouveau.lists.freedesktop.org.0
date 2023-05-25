Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9F710204
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC29E10E6AF;
	Thu, 25 May 2023 00:31:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6C10E6AB
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:37 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5289ce6be53so324567a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974696; x=1687566696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEnszCGChXcI15HdfcuriQbGxm8cnPEL24NMuwSsOXY=;
 b=Os4z/5Qt04RF6wIAmEYxvc+lFT0QLY2PP3viKU0WoJkP0N+ib0HMQcbMybA9oLsofT
 AV17QJRVqyV8IYe2cDz9rbDlXWe7DPUUDGdmlczGVT5nXTVkW0kqemgn3sWi6OCs8OqS
 eTUqJKWyhqbtldIyceCQN2ADqDmlm0/0POcs6Luu0kze6WMvAVHwuClO7ClGCyhBXSir
 hKO2Ual97DgRohVBUbzVWomCcZpu1e/ASsrPF20MHFVJw+dRmKjsx5tpmPMzl3bK/qoU
 cltZJRzq9Xmhnzv/Qz2eALMgYzBZdXvo+UjkFCVOD6Gn3e4FrgEtXOEOjG85iBv78cDj
 uQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974696; x=1687566696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yEnszCGChXcI15HdfcuriQbGxm8cnPEL24NMuwSsOXY=;
 b=NxEAJMkLNhB6iRxiHqQjxxoXhW+ryvDSdsflTYf7FvliK082Ht9TIlvjb6Ws4A0gO4
 mcNco0SmdUH8uI9lpPRm4jrEhJbrhQfMhtzZ7QJR7TGZ9eTUd3fdmhH+JDb5AVNYQ01E
 t4P03h50mQ638jcl0/9SnJjcbtxo3Pqf/APfJ3FMU+l2luBhhh5tQmYWQmWrlhGmIDpN
 41etppS0igsm+g4gO8zVRSOpdvYraVll2P+SWJgybKB1ZFc8eAHoA3CvPpXMuHnNPU47
 rLrOtnJgrftAHZ74eNl+Aa4eWTl+uCPrjoGMKzfmzp845vfiRnVR5EOcZ2iMldwebStu
 rLWA==
X-Gm-Message-State: AC+VfDyC3EY1/cNyi/hIJDrIakyuVjIeiyGGvCr3j5ck+taIuLj4lWJv
 st5G/mV3/8gOMeY3lVXaro0yyjJyqWY=
X-Google-Smtp-Source: ACHHUZ7DdbqvfPWHpkwjnkjB0y9YuJlDB1XVK+Xw8fMqf2sLpmF+JHWFwhy5nxnRdckd6TiiEeRJbQ==
X-Received: by 2002:a17:902:e84d:b0:1ac:820e:c34a with SMTP id
 t13-20020a170902e84d00b001ac820ec34amr1306134plg.0.1684974696437; 
 Wed, 24 May 2023 17:31:36 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:36 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:06 +1000
Message-Id: <20230525003106.3853741-10-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 10/10] drm/nouveau/kms: don't call
 drm_dp_cec_set_edid() on TMDS
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

RM complains very loudly at the aux transaction attempts.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 086b66b60d91..4c0cb32f6f2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -619,7 +619,10 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 
 		nouveau_connector_set_encoder(connector, nv_encoder);
 		conn_status = connector_status_connected;
-		drm_dp_cec_set_edid(&nv_connector->aux, nv_connector->edid);
+
+		if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
+			drm_dp_cec_set_edid(&nv_connector->aux, nv_connector->edid);
+
 		goto out;
 	} else {
 		nouveau_connector_set_edid(nv_connector, NULL);
-- 
2.40.1

