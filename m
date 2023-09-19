Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF37A6E45
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27510E403;
	Tue, 19 Sep 2023 22:07:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211F410E403
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFieiXbaBTjfuTiZca2mPcFhbLUov1B8cBzL+moIOfI=;
 b=dJSyCSDYWCf0lKWVsiYO07DMbxfOkLqXDw0n0CQKqUAIBYF9Ygl22oS1W6BRfrzHuiAfto
 CrUZP5Vqs74hE4hgKbT1JhUNdJedFraxg92G2h7AqlSX6xTcokbBM7s5G/Ki9SDuMjq52/
 ciJNxO3YtldIsVj//mXVcdGD788XHUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-u6ZPMQjhPmGjAgPc6Tpi0Q-1; Tue, 19 Sep 2023 18:07:36 -0400
X-MC-Unique: u6ZPMQjhPmGjAgPc6Tpi0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69C32800883;
 Tue, 19 Sep 2023 22:07:36 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0920A40C2064;
 Tue, 19 Sep 2023 22:07:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:35 -0400
Message-ID: <20230919220442.202488-41-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 40/44] drm/nouveau/kms/nv50-: create heads
 after outps/conns
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

- output info will be used later to determine MST support

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 64 ++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2134502ec04e2..26d59346703e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2774,38 +2774,6 @@ nv50_display_create(struct drm_device *dev)
 		dev->mode_config.cursor_height = 64;
 	}
 
-	/* create crtc objects to represent the hw heads */
-	for_each_set_bit(i, &disp->disp->head_mask, sizeof(disp->disp->head_mask) * 8) {
-		struct nv50_head *head;
-
-		head = nv50_head_create(dev, i);
-		if (IS_ERR(head)) {
-			ret = PTR_ERR(head);
-			goto out;
-		}
-
-		if (has_mst) {
-			head->msto = nv50_msto_new(dev, head, i);
-			if (IS_ERR(head->msto)) {
-				ret = PTR_ERR(head->msto);
-				head->msto = NULL;
-				goto out;
-			}
-
-			/*
-			 * FIXME: This is a hack to workaround the following
-			 * issues:
-			 *
-			 * https://gitlab.gnome.org/GNOME/mutter/issues/759
-			 * https://gitlab.freedesktop.org/xorg/xserver/merge_requests/277
-			 *
-			 * Once these issues are closed, this should be
-			 * removed
-			 */
-			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
-		}
-	}
-
 	/* create encoder/connector objects based on VBIOS DCB table */
 	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
 		struct nouveau_encoder *outp;
@@ -2868,6 +2836,38 @@ nv50_display_create(struct drm_device *dev)
 		connector->funcs->destroy(connector);
 	}
 
+	/* create crtc objects to represent the hw heads */
+	for_each_set_bit(i, &disp->disp->head_mask, sizeof(disp->disp->head_mask) * 8) {
+		struct nv50_head *head;
+
+		head = nv50_head_create(dev, i);
+		if (IS_ERR(head)) {
+			ret = PTR_ERR(head);
+			goto out;
+		}
+
+		if (has_mst) {
+			head->msto = nv50_msto_new(dev, head, i);
+			if (IS_ERR(head->msto)) {
+				ret = PTR_ERR(head->msto);
+				head->msto = NULL;
+				goto out;
+			}
+
+			/*
+			 * FIXME: This is a hack to workaround the following
+			 * issues:
+			 *
+			 * https://gitlab.gnome.org/GNOME/mutter/issues/759
+			 * https://gitlab.freedesktop.org/xorg/xserver/merge_requests/277
+			 *
+			 * Once these issues are closed, this should be
+			 * removed
+			 */
+			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
+		}
+	}
+
 	/* Disable vblank irqs aggressively for power-saving, safe on nv50+ */
 	dev->vblank_disable_immediate = true;
 
-- 
2.41.0

