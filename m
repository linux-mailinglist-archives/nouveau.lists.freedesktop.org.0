Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960C79FEEA
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6578A10E544;
	Thu, 14 Sep 2023 08:48:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE010E54F
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:25 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-58c92a2c52dso7580927b3.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681304; x=1695286104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q74ANLvuvsdHWV5BY7o+qnhqLlLyGRIjlYDd8ZyD0E=;
 b=a6hCLcjj0RAyl4yMTb5or5rjjTURWCz6kCVfBYMXw7DeUWL/bm3rN7VrwAqXMpL/U/
 kDODcMjFW5KOngEqtg9Rnbuz3UFOXHmIw/5mNfsCJVLdwgh5OgpQRp8210AMZ/ptvb0/
 3jGk72Tautb6xD61uj64n1K20Lb9g6zAeX64wCXBSYHLG4QUZ4Qk9xc1vTXdZx9R61KE
 ZnwUagfNUiBxrkEhHVbKeZDD9atjP1H3fvBCv7dZNa4R+Tl50Xa9G+rwjJveTm7raKZc
 IxOYrtxZAL2QF0skyrhX0tuvslcFAWoRdxANwbrw7lqXPZ/grKlCmfbKYH1WQXhOg4vI
 iLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681304; x=1695286104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Q74ANLvuvsdHWV5BY7o+qnhqLlLyGRIjlYDd8ZyD0E=;
 b=ilLQBinHe9qFUm5OGC7F1D8VSlAEisMGqsPwNyb4p4SaTy59QBzLZwcLQsE8sO8N4+
 MG3Pq0GAFZ9I2XxdW+yiYsHi1FO4QrDPjplEHVLKwugNaDc/NwFMaslbGBI+pn2ws8pi
 BuS2eBEQlkf+noM/v2VcoZIR+YdYWSU+9HwoF1WnND0+QcN2BSuV1Y8AfmbMnglfFhcI
 1vDOXg+NRabY9ymbcxCeTuq6TXLdL3WQvWzooRUq85pJ7MCRxf3G2wX8aFLRjfXZbRHc
 z1RMT+YfdDPRHRZWCz4znac/M3ND1qlzhQqoK0Woh+mMNDmffncUOtRx71GRz7fLq+QJ
 J4Yg==
X-Gm-Message-State: AOJu0Ywo07ZN6oh/Q/EvlHI1V5GDiBXP49xAgMqQiepMLNUBRmp3maOU
 gA6p4+HDlnF/lacwad699OwzZxkA6LA=
X-Google-Smtp-Source: AGHT+IGcY5trFQwrUfCN++yh2KJNCR4NP8YROUqw4SQyhytseoaqcnEvfm3vFX9IEPTnWge2L46z0g==
X-Received: by 2002:a0d:db0c:0:b0:589:b3c6:95ff with SMTP id
 d12-20020a0ddb0c000000b00589b3c695ffmr5469034ywe.36.1694681303785; 
 Thu, 14 Sep 2023 01:48:23 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:23 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:20 +1000
Message-ID: <20230914084624.2299765-41-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 39/44] drm/nouveau/kms/nv50-: create heads based
 on nvkm head mask
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

No need to go poking HW directly, and probably shouldn't on GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c1dd7106518..3d9a312838bf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2694,13 +2694,12 @@ nv50_display_destroy(struct drm_device *dev)
 int
 nv50_display_create(struct drm_device *dev)
 {
-	struct nvif_device *device = &nouveau_drm(dev)->client.device;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct dcb_table *dcb = &drm->vbios.dcb;
 	struct drm_connector *connector, *tmp;
 	struct nv50_disp *disp;
 	struct dcb_output *dcbe;
-	int crtcs, ret, i;
+	int ret, i;
 	bool has_mst = nv50_has_mst(drm);
 
 	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
@@ -2778,20 +2777,9 @@ nv50_display_create(struct drm_device *dev)
 	}
 
 	/* create crtc objects to represent the hw heads */
-	if (disp->disp->object.oclass >= GV100_DISP)
-		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
-	else
-	if (disp->disp->object.oclass >= GF110_DISP)
-		crtcs = nvif_rd32(&device->object, 0x612004) & 0xf;
-	else
-		crtcs = 0x3;
-
-	for (i = 0; i < fls(crtcs); i++) {
+	for_each_set_bit(i, &disp->disp->head_mask, sizeof(disp->disp->head_mask) * 8) {
 		struct nv50_head *head;
 
-		if (!(crtcs & (1 << i)))
-			continue;
-
 		head = nv50_head_create(dev, i);
 		if (IS_ERR(head)) {
 			ret = PTR_ERR(head);
@@ -2816,7 +2804,7 @@ nv50_display_create(struct drm_device *dev)
 			 * Once these issues are closed, this should be
 			 * removed
 			 */
-			head->msto->encoder.possible_crtcs = crtcs;
+			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
 		}
 	}
 
-- 
2.41.0

