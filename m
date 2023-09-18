Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80257A53B7
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E61110E305;
	Mon, 18 Sep 2023 20:15:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3410E303
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:56 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fbbb953cfso4356536b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068156; x=1695672956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2WI8bpPP3l2hyFMNLnPHjn4mfGdUiRQmbqSwbztb3Q=;
 b=DX6GEiZf/+wf2wi1lHPpUTN6/T8i/GTih9ta7dXyhGtR82RSx0csy54ldliExieQ2Y
 E++++roYUOmYE0j+ohcE1A9Mo2LGfN6T9yduNqAKBLepz/5a6jjjykF81z0OdOiqokUk
 +f0X6Ie/YN2DyrQEjU/LSBxxohcfXiwmacVWvBxdHUnSuGBngSXJbQ/MIYB23UJlhz4p
 xbwA/BjsCDrAYktKnPRyPsyY76Z9ZcKJJg4Pr1HZ9wt7wF8lt5cdumFOYTO2lGI7wuAa
 xPbU+e9B3twPmeuJQcbkj2j6jboY0VdELFmm1BMGHlLRdOH8QXC58doWVG4z0sHHliNd
 KV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068156; x=1695672956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2WI8bpPP3l2hyFMNLnPHjn4mfGdUiRQmbqSwbztb3Q=;
 b=GpZBFztxx4dMPkbvORUtrzHbEInNhPlji+ZNUZyWX6xuA1oci1m/zezEjrQS0ku+/g
 fVsqEAPcNcwP7xveGF8sqgacLQmpTnm/i7SIfTu2P36kxxakpRM922pvY76omIcNlzlX
 Ws6orpB2rz+bZEkViFad7bsYQfaEIXlCh9dB+CSMOGjTca16BYKBBVMXwunNgrvimxwV
 VDcqVWnioecKMW3uoEZi1+hK6yaYfskc/JWSb3BB6RAXjj6tb9G/2JfJzKAQ+A3+qkLq
 tF7c7lUNyhx4I51xjBakfF3XCLylriVbK53ToQ+xo3+y8g/MRHGfFA6BbaBgcbgorCmq
 fYEA==
X-Gm-Message-State: AOJu0YwuMRP/JANvwu6EJg8jt1rS6pFlIxdeGPpvnX92cAYfGYvmMz/d
 ylRL4p3lIQnvOzdUIHSg+029oxTTgys=
X-Google-Smtp-Source: AGHT+IEPbcly70GuMXotbTinqMJ3BJG6kBHgIC3AcVJ+ulZzhBziIesI8rEdQztRUzLsxGhQrk5Oaw==
X-Received: by 2002:a17:902:ac88:b0:1c3:d9ed:d16e with SMTP id
 h8-20020a170902ac8800b001c3d9edd16emr10931830plr.39.1695068155796; 
 Mon, 18 Sep 2023 13:15:55 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:55 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:59 +1000
Message-ID: <20230918201404.3765-40-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 39/44] drm/nouveau/kms/nv50-: create heads
 based on nvkm head mask
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

