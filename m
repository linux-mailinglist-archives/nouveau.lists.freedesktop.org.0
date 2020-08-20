Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765024C5A6
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 20:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129116E3F3;
	Thu, 20 Aug 2020 18:36:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2846E6E3F3
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfLxCMnsO7JIC/eaKaw8p9wTENERe+wpNdDpM58At2g=;
 b=RQBGoi+GpaWUPQYY43vxBqcBqALgNIzX0ZpDCEFOXZXAXCnqsWF3QudQhsorPjKm6nz4FJ
 /NntBGJCmecoTqX4tzW3ePSV0A6PAUDiA4WENxmoI5TakWKTBjB8lxnuUVBL4itO35WjEa
 tThsPGtxQZ5J1AFnB5L0qv8CBvfLjMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-KB-dH9DdNdWoEqpta9TcZA-1; Thu, 20 Aug 2020 14:30:30 -0400
X-MC-Unique: KB-dH9DdNdWoEqpta9TcZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8EC81005E73;
 Thu, 20 Aug 2020 18:30:28 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6885DA74;
 Thu, 20 Aug 2020 18:30:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Thu, 20 Aug 2020 14:29:54 -0400
Message-Id: <20200820183012.288794-3-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v2 02/20] drm/nouveau/kms/nv50-: Remove open-coded
 drm_dp_read_desc()
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Noticed this while going through our DP code - we use an open-coded
version of drm_dp_read_desc() instead of just using the helper, so
change that. This will also let us use quirks in the future if we end up
needing them.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 30 +++++++--------------
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++-
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025a4bfe8..e12957e6faa7c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -435,7 +435,8 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 
 		switch (nv_encoder->dcb->type) {
 		case DCB_OUTPUT_DP:
-			ret = nouveau_dp_detect(nv_encoder);
+			ret = nouveau_dp_detect(nouveau_connector(connector),
+						nv_encoder);
 			if (ret == NOUVEAU_DP_MST)
 				return NULL;
 			else if (ret == NOUVEAU_DP_SST)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index ee778ddc95fae..c4e9c21d4dd2b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,27 +36,9 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
-static void
-nouveau_dp_probe_oui(struct drm_device *dev, struct nvkm_i2c_aux *aux, u8 *dpcd)
-{
-	struct nouveau_drm *drm = nouveau_drm(dev);
-	u8 buf[3];
-
-	if (!(dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_OUI_SUPPORT))
-		return;
-
-	if (!nvkm_rdaux(aux, DP_SINK_OUI, buf, 3))
-		NV_DEBUG(drm, "Sink OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-	if (!nvkm_rdaux(aux, DP_BRANCH_OUI, buf, 3))
-		NV_DEBUG(drm, "Branch OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-}
-
 int
-nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
+nouveau_dp_detect(struct nouveau_connector *nv_connector,
+		  struct nouveau_encoder *nv_encoder)
 {
 	struct drm_device *dev = nv_encoder->base.base.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -89,7 +71,13 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	NV_DEBUG(drm, "maximum: %dx%d\n",
 		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
-	nouveau_dp_probe_oui(dev, aux, dpcd);
+	ret = drm_dp_read_desc(&nv_connector->aux, &nv_encoder->dp.desc,
+			       drm_dp_is_branch(dpcd));
+	if (ret) {
+		NV_ERROR(drm, "Failed to read DP descriptor on %s: %d\n",
+			 nv_connector->base.name, ret);
+		return ret;
+	}
 
 	ret = nv50_mstm_detect(nv_encoder->dp.mstm, dpcd, nouveau_mst);
 	if (ret == 1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index a72c412ac8b14..6424cdcb4913f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -33,6 +33,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include "dispnv04/disp.h"
 struct nv50_head_atom;
+struct nouveau_connector;
 
 #define NV_DPMS_CLEARED 0x80
 
@@ -64,6 +65,7 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+			struct drm_dp_desc desc;
 		} dp;
 	};
 
@@ -104,7 +106,7 @@ enum nouveau_dp_status {
 	NOUVEAU_DP_MST,
 };
 
-int nouveau_dp_detect(struct nouveau_encoder *);
+int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
 enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					struct nouveau_encoder *,
 					const struct drm_display_mode *,
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
