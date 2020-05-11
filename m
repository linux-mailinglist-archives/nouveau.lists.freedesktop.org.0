Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4A1CE859
	for <lists+nouveau@lfdr.de>; Tue, 12 May 2020 00:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2483B6E5D2;
	Mon, 11 May 2020 22:42:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3C56E5CF
 for <nouveau@lists.freedesktop.org>; Mon, 11 May 2020 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlyNHDl8KxH4zPVWg9+orgF6JTxBo0YxYPLLcH1FDlI=;
 b=D2fGBRmoBaAq4kwkJYaZiMqDjQlvqevdNbWrh7S8Z+vgPrVlItdNfHTAwPei8zSwnTCb7k
 wNqy1T71Is/41Ij5ijVI9n5QsDJHgdgyfHZAXwyXb3zdmOuP9T6DmkDp+m6yEFto8DBG16
 qsz7+i5wiH0pnsL6DEn2U2ZXt36Mswk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-qXaCobmkOVqb1Amk44Hg5A-1; Mon, 11 May 2020 18:42:44 -0400
X-MC-Unique: qXaCobmkOVqb1Amk44Hg5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 221A8107ACCA;
 Mon, 11 May 2020 22:42:43 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E730D78480;
 Mon, 11 May 2020 22:42:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 11 May 2020 18:41:27 -0400
Message-Id: <20200511224148.598468-6-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH v3 5/5] drm/nouveau/kms/nv50-: Share DP SST
 mode_valid() handling with MST
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Currently, the nv50_mstc_mode_valid() function is happy to take any and
all modes, even the ones we can't actually support sometimes like
interlaced modes.

Luckily, the only difference between the mode validation that needs to
be performed for MST vs. SST is that eventually we'll need to check the
minimum PBN against the MSTB's full PBN capabilities (remember-we don't
care about the current bw state here). Otherwise, all of the other code
can be shared.

So, we move all of the common mode validation in
nouveau_connector_mode_valid() into a separate helper,
nv50_dp_mode_valid(), and use that from both nv50_mstc_mode_valid() and
nouveau_connector_mode_valid(). Note that we allow for returning the
calculated clock that nv50_dp_mode_valid() came up with, since we'll
eventually want to use that for PBN calculation in
nv50_mstc_mode_valid().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  9 +++-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 46 ++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  5 +++
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 31 ++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++
 5 files changed, 75 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c49a6c47c66f..f3a77267ff09 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1052,7 +1052,14 @@ static enum drm_mode_status
 nv50_mstc_mode_valid(struct drm_connector *connector,
 		     struct drm_display_mode *mode)
 {
-	return MODE_OK;
+	struct nv50_mstc *mstc = nv50_mstc(connector);
+	struct nouveau_encoder *outp = mstc->mstm->outp;
+
+	/* TODO: calculate the PBN from the dotclock and validate against the
+	 * MSTB's max possible PBN
+	 */
+
+	return nv50_dp_mode_valid(connector, outp, mode, NULL);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 6dae00da5d7e..1b383ae0248f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -38,6 +38,7 @@
 #include "nouveau_reg.h"
 #include "nouveau_drv.h"
 #include "dispnv04/hw.h"
+#include "dispnv50/disp.h"
 #include "nouveau_acpi.h"
 
 #include "nouveau_display.h"
@@ -1033,6 +1034,29 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 		return 112000 * duallink_scale;
 }
 
+enum drm_mode_status
+nouveau_conn_mode_clock_valid(const struct drm_display_mode *mode,
+			      const unsigned min_clock,
+			      const unsigned max_clock,
+			      unsigned int *clock_out)
+{
+	unsigned int clock = mode->clock;
+
+	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) ==
+	    DRM_MODE_FLAG_3D_FRAME_PACKING)
+		clock *= 2;
+
+	if (clock < min_clock)
+		return MODE_CLOCK_LOW;
+	if (clock > max_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (clock_out)
+		*clock_out = clock;
+
+	return MODE_OK;
+}
+
 static enum drm_mode_status
 nouveau_connector_mode_valid(struct drm_connector *connector,
 			     struct drm_display_mode *mode)
@@ -1041,7 +1065,6 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
 	unsigned min_clock = 25000, max_clock = min_clock;
-	unsigned clock = mode->clock;
 
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_LVDS:
@@ -1064,29 +1087,14 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	case DCB_OUTPUT_TV:
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
-		if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
-		    !nv_encoder->caps.dp_interlace)
-			return MODE_NO_INTERLACE;
-
-		max_clock  = nv_encoder->dp.link_nr;
-		max_clock *= nv_encoder->dp.link_bw;
-		clock = clock * (connector->display_info.bpc * 3) / 10;
-		break;
+		return nv50_dp_mode_valid(connector, nv_encoder, mode, NULL);
 	default:
 		BUG();
 		return MODE_BAD;
 	}
 
-	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) == DRM_MODE_FLAG_3D_FRAME_PACKING)
-		clock *= 2;
-
-	if (clock < min_clock)
-		return MODE_CLOCK_LOW;
-
-	if (clock > max_clock)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
+					     NULL);
 }
 
 static struct drm_encoder *
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index de84fb4708c7..9e062c7adec8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -195,6 +195,11 @@ int nouveau_conn_atomic_get_property(struct drm_connector *,
 				     const struct drm_connector_state *,
 				     struct drm_property *, u64 *);
 struct drm_display_mode *nouveau_conn_native_mode(struct drm_connector *);
+enum drm_mode_status
+nouveau_conn_mode_clock_valid(const struct drm_display_mode *,
+			      const unsigned min_clock,
+			      const unsigned max_clock,
+			      unsigned *clock);
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 extern int nouveau_backlight_init(struct drm_connector *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 2674f1587457..8a0f7994e1ae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -98,3 +98,34 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 		return NOUVEAU_DP_SST;
 	return ret;
 }
+
+/* TODO:
+ * - Use the minimum possible BPC here, once we add support for the max bpc
+ *   property.
+ * - Validate the mode against downstream port caps (see
+ *   drm_dp_downstream_max_clock())
+ * - Validate against the DP caps advertised by the GPU (we don't check these
+ *   yet)
+ */
+enum drm_mode_status
+nv50_dp_mode_valid(struct drm_connector *connector,
+		   struct nouveau_encoder *outp,
+		   const struct drm_display_mode *mode,
+		   unsigned *out_clock)
+{
+	const unsigned min_clock = 25000;
+	unsigned max_clock, clock;
+	enum drm_mode_status ret;
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
+		return MODE_NO_INTERLACE;
+
+	max_clock = outp->dp.link_nr * outp->dp.link_bw;
+	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
+
+	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
+					    &clock);
+	if (out_clock)
+		*out_clock = clock;
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 3217f587eceb..de51733b0476 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -104,6 +104,10 @@ enum nouveau_dp_status {
 };
 
 int nouveau_dp_detect(struct nouveau_encoder *);
+enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
+					struct nouveau_encoder *,
+					const struct drm_display_mode *,
+					unsigned *clock);
 
 struct nouveau_connector *
 nouveau_encoder_connector_get(struct nouveau_encoder *encoder);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
