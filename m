Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA47127CA9
	for <lists+nouveau@lfdr.de>; Fri, 20 Dec 2019 15:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A526EC44;
	Fri, 20 Dec 2019 14:30:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1311F6EC40;
 Fri, 20 Dec 2019 14:30:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C1972467F;
 Fri, 20 Dec 2019 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852243;
 bh=5mVpZ9FcZ3pkB88cYT4vSTMhg5zWu9cNzkuS12khLxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MAMty7DdAhAIwQEz+rYWEdMaGFXBO6M+6dO147Wq4gFPJzlbUdhJrQG2+P0GlKiGj
 wWdBX4SX1633Ua7wyb4PDkMFbREAdi6ULPxJVAUfkJDt8NsjTRcu+fn9YCvPkhUif4
 Pf602RCC3UF0K6oECv5R9wey0X5uBWH3HQoxYM0Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 20 Dec 2019 09:29:38 -0500
Message-Id: <20191220142954.9500-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 36/52] drm/nouveau: Move the
 declaration of struct nouveau_conn_atom up a bit
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 37a68eab4cd92b507c9e8afd760fdc18e4fecac6 ]

Place the declaration of struct nouveau_conn_atom above that of
struct nouveau_connector. This commit makes no changes to the moved
block what so ever, it just moves it up a bit.

This is a preparation patch to fix some issues with connector handling
on pre nv50 displays (which do not use atomic modesetting).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.h | 110 ++++++++++----------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index f43a8d63aef86..de95884208848 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -29,6 +29,7 @@
 
 #include <nvif/notify.h>
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_dp_helper.h>
@@ -44,6 +45,60 @@ struct dcb_output;
 struct nouveau_backlight;
 #endif
 
+#define nouveau_conn_atom(p)                                                   \
+	container_of((p), struct nouveau_conn_atom, state)
+
+struct nouveau_conn_atom {
+	struct drm_connector_state state;
+
+	struct {
+		/* The enum values specifically defined here match nv50/gf119
+		 * hw values, and the code relies on this.
+		 */
+		enum {
+			DITHERING_MODE_OFF = 0x00,
+			DITHERING_MODE_ON = 0x01,
+			DITHERING_MODE_DYNAMIC2X2 = 0x10 | DITHERING_MODE_ON,
+			DITHERING_MODE_STATIC2X2 = 0x18 | DITHERING_MODE_ON,
+			DITHERING_MODE_TEMPORAL = 0x20 | DITHERING_MODE_ON,
+			DITHERING_MODE_AUTO
+		} mode;
+		enum {
+			DITHERING_DEPTH_6BPC = 0x00,
+			DITHERING_DEPTH_8BPC = 0x02,
+			DITHERING_DEPTH_AUTO
+		} depth;
+	} dither;
+
+	struct {
+		int mode;	/* DRM_MODE_SCALE_* */
+		struct {
+			enum {
+				UNDERSCAN_OFF,
+				UNDERSCAN_ON,
+				UNDERSCAN_AUTO,
+			} mode;
+			u32 hborder;
+			u32 vborder;
+		} underscan;
+		bool full;
+	} scaler;
+
+	struct {
+		int color_vibrance;
+		int vibrant_hue;
+	} procamp;
+
+	union {
+		struct {
+			bool dither:1;
+			bool scaler:1;
+			bool procamp:1;
+		};
+		u8 mask;
+	} set;
+};
+
 struct nouveau_connector {
 	struct drm_connector base;
 	enum dcb_connector_type type;
@@ -121,61 +176,6 @@ extern int nouveau_ignorelid;
 extern int nouveau_duallink;
 extern int nouveau_hdmimhz;
 
-#include <drm/drm_crtc.h>
-#define nouveau_conn_atom(p)                                                   \
-	container_of((p), struct nouveau_conn_atom, state)
-
-struct nouveau_conn_atom {
-	struct drm_connector_state state;
-
-	struct {
-		/* The enum values specifically defined here match nv50/gf119
-		 * hw values, and the code relies on this.
-		 */
-		enum {
-			DITHERING_MODE_OFF = 0x00,
-			DITHERING_MODE_ON = 0x01,
-			DITHERING_MODE_DYNAMIC2X2 = 0x10 | DITHERING_MODE_ON,
-			DITHERING_MODE_STATIC2X2 = 0x18 | DITHERING_MODE_ON,
-			DITHERING_MODE_TEMPORAL = 0x20 | DITHERING_MODE_ON,
-			DITHERING_MODE_AUTO
-		} mode;
-		enum {
-			DITHERING_DEPTH_6BPC = 0x00,
-			DITHERING_DEPTH_8BPC = 0x02,
-			DITHERING_DEPTH_AUTO
-		} depth;
-	} dither;
-
-	struct {
-		int mode;	/* DRM_MODE_SCALE_* */
-		struct {
-			enum {
-				UNDERSCAN_OFF,
-				UNDERSCAN_ON,
-				UNDERSCAN_AUTO,
-			} mode;
-			u32 hborder;
-			u32 vborder;
-		} underscan;
-		bool full;
-	} scaler;
-
-	struct {
-		int color_vibrance;
-		int vibrant_hue;
-	} procamp;
-
-	union {
-		struct {
-			bool dither:1;
-			bool scaler:1;
-			bool procamp:1;
-		};
-		u8 mask;
-	} set;
-};
-
 void nouveau_conn_attach_properties(struct drm_connector *);
 void nouveau_conn_reset(struct drm_connector *);
 struct drm_connector_state *
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
