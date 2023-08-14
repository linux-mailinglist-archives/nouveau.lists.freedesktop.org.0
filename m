Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB977BBFD
	for <lists+nouveau@lfdr.de>; Mon, 14 Aug 2023 16:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E8410E218;
	Mon, 14 Aug 2023 14:49:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9570D10E218
 for <nouveau@lists.freedesktop.org>; Mon, 14 Aug 2023 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692024577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lLr1fKQOmjiaD4LHyCW/7ka5sjk7zv0No4ICWghVhgc=;
 b=g2vM79PmuQNj9MWFl7M+hCx+M5okOm4XepMPXstArYyn4D4XuzkzlEoyaVGskQ6mTMBRU9
 +FL9bAC0tB6jqzceBsruOuc2ROI9irOC5hJ4NldKWoYA5K2uWzk04G67OJUXk8M9kvrBtH
 8gVWn4tc6fovRccWpPMqmykMCEFEvGQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-HKbhj2XKPpa2X-XPhRGlIA-1; Mon, 14 Aug 2023 10:49:36 -0400
X-MC-Unique: HKbhj2XKPpa2X-XPhRGlIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe4f8a557dso11724385e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 14 Aug 2023 07:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692024575; x=1692629375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLr1fKQOmjiaD4LHyCW/7ka5sjk7zv0No4ICWghVhgc=;
 b=GDgYLSbtSzn6CaXtz5ABnMId6X7HME14pf0Nfbi3OVgIij/GRSPgVhmwNAN5gPqw6r
 iqsex/FXr1WxEc6Gd+XMmJ2qNh7S1ICvJcQZpyYMEiEVcDm3Nbewo0OYTZ8/t2TjQcfX
 Yzi41CASyx27paMc02oB4dBt1AAT2bP95AMDE3YhkEfLuBG4250dOALSUREVZCwVzxcH
 moE8JCavoZ1wRBgNNurTE+XJBpUCGsjizAR94Dei/XJmM/M+LSxzrKeM56PA5rKxdeCm
 iuUuUBnWv0m3VPmp/7r4gfTYe4vGTKzgMaJvcE3EZ/taecuZLELclYDJfIX3Qo4icrAW
 vR0w==
X-Gm-Message-State: AOJu0YyrJDDq9GS/pAol6lSRg1TsDds2Mc3Mm49vVj9mrvMTk/NSlzKC
 MX54Fu9z1CWrvMscDynLKeoNc0VzNpJHhCMNuYXOSpoUAPLSS8Uus0kCR4V3Y5H5I3+38Rv1Bon
 UcULsCEOgpAmJc3AuZztv+/o1bA==
X-Received: by 2002:a05:600c:5111:b0:3fe:5228:b78c with SMTP id
 o17-20020a05600c511100b003fe5228b78cmr9591557wms.1.1692024575518; 
 Mon, 14 Aug 2023 07:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1tdiW9HZTOV/fGkyYi3rJqI/IoMOtWccUH8Xg17/48IA+MNHERlSrq0NBJk1Sk2qPt4rsUA==
X-Received: by 2002:a05:600c:5111:b0:3fe:5228:b78c with SMTP id
 o17-20020a05600c511100b003fe5228b78cmr9591538wms.1.1692024575076; 
 Mon, 14 Aug 2023 07:49:35 -0700 (PDT)
Received: from kherbst.pingu.com ([31.17.16.107])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c210a00b003fc02e8ea68sm17373094wml.13.2023.08.14.07.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 07:49:34 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 16:49:32 +0200
Message-ID: <20230814144933.3956959-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We can't simply free the connector after calling drm_connector_init on it.
We need to clean up the drm side first.

It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
fixes a memory corruption in error handling related to that commit.

Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local/
Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index a2e0033e8a260..622f6eb9a8bfd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1408,8 +1408,7 @@ nouveau_connector_create(struct drm_device *dev,
 		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
 				     &nv_connector->conn);
 		if (ret) {
-			kfree(nv_connector);
-			return ERR_PTR(ret);
+			goto drm_conn_err;
 		}
 
 		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
@@ -1426,8 +1425,7 @@ nouveau_connector_create(struct drm_device *dev,
 			if (ret) {
 				nvif_event_dtor(&nv_connector->hpd);
 				nvif_conn_dtor(&nv_connector->conn);
-				kfree(nv_connector);
-				return ERR_PTR(ret);
+				goto drm_conn_err;
 			}
 		}
 	}
@@ -1475,4 +1473,9 @@ nouveau_connector_create(struct drm_device *dev,
 
 	drm_connector_register(connector);
 	return connector;
+
+drm_conn_err:
+	drm_connector_cleanup(connector);
+	kfree(nv_connector);
+	return ERR_PTR(ret);
 }
-- 
2.41.0

