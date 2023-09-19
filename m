Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12C7A6E4D
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023810E40F;
	Tue, 19 Sep 2023 22:07:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAF110E40B
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDlxZXlw0JV4U7Nw4IyuZ8EJ56qCOFrt9bf6Gmbwdp4=;
 b=I+LmIE9dGdlVSHR2IK0JpOZmkExNAdRo9efkRY8Et8o2vMX79oP7nMaqWAUp+XaK+c9r2Q
 xPW52zbiv1xOZifuADoXyAlI6O6dtmJKT6Jk8FtMrhZGhcL6LG2wIXAQql/tuFw4IV1X2w
 NKZbhx2+J4GitU3bOTjLGm1E9nhTIj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-mDCDAfWCMuSuLJotFf7nBA-1; Tue, 19 Sep 2023 18:07:35 -0400
X-MC-Unique: mDCDAfWCMuSuLJotFf7nBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D738039C8;
 Tue, 19 Sep 2023 22:07:35 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB68E40C2064;
 Tue, 19 Sep 2023 22:07:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:34 -0400
Message-ID: <20230919220442.202488-40-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 39/44] drm/nouveau/kms/nv50-: create heads
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
Cc: open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

No need to go poking HW directly, and probably shouldn't on GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d6de5ee89d543..2134502ec04e2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2692,13 +2692,12 @@ nv50_display_destroy(struct drm_device *dev)
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
@@ -2776,20 +2775,9 @@ nv50_display_create(struct drm_device *dev)
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
@@ -2814,7 +2802,7 @@ nv50_display_create(struct drm_device *dev)
 			 * Once these issues are closed, this should be
 			 * removed
 			 */
-			head->msto->encoder.possible_crtcs = crtcs;
+			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
 		}
 	}
 
-- 
2.41.0

