Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D13699F7
	for <lists+nouveau@lfdr.de>; Fri, 23 Apr 2021 20:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3F06EC2D;
	Fri, 23 Apr 2021 18:43:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332286E419
 for <nouveau@lists.freedesktop.org>; Fri, 23 Apr 2021 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbvW0sHUrSQgdNgApZtJxVL8Alg9TlauSif4ZCTHwuI=;
 b=JtjsiK3r1V1Sl01pDNtDh7zGRAdlkQ1JkdIfLiKxoY+iJzupwT5NJVWMujsRQ/0k4hG2gz
 7AhtIoduxG7DnL/k7EceuTybeDs3Cg3lpZM80uH1dQhQm2TduCkAyPdoiafoUfJwDMk7r0
 NTQPLDMw5t9PTu8EDhsL/x5hcLrT5Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-NGnOOgGWOPmnwlvN6Rsvpg-1; Fri, 23 Apr 2021 14:43:40 -0400
X-MC-Unique: NGnOOgGWOPmnwlvN6Rsvpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB9E80D6AC;
 Fri, 23 Apr 2021 18:43:38 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8C916090F;
 Fri, 23 Apr 2021 18:43:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 23 Apr 2021 14:42:54 -0400
Message-Id: <20210423184309.207645-3-lyude@redhat.com>
In-Reply-To: <20210423184309.207645-1-lyude@redhat.com>
References: <20210423184309.207645-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH v4 02/17] drm/nouveau/kms/nv50-: Move AUX adapter
 reg to connector late register/early unregister
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

Since AUX adapters on nouveau have their respective DRM connectors as
parents, we need to make sure that we register then after their connectors.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 25 ++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 61e6d7412505..c04044be3d32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -401,7 +401,6 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	drm_connector_cleanup(connector);
 	if (nv_connector->aux.transfer) {
 		drm_dp_cec_unregister_connector(&nv_connector->aux);
-		drm_dp_aux_unregister(&nv_connector->aux);
 		kfree(nv_connector->aux.name);
 	}
 	kfree(connector);
@@ -905,13 +904,29 @@ nouveau_connector_late_register(struct drm_connector *connector)
 	int ret;
 
 	ret = nouveau_backlight_init(connector);
+	if (ret)
+		return ret;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		ret = drm_dp_aux_register(&nouveau_connector(connector)->aux);
+		if (ret)
+			goto backlight_fini;
+	}
+
+	return 0;
+backlight_fini:
+	nouveau_backlight_fini(connector);
 	return ret;
 }
 
 static void
 nouveau_connector_early_unregister(struct drm_connector *connector)
 {
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		drm_dp_aux_unregister(&nouveau_connector(connector)->aux);
+
 	nouveau_backlight_fini(connector);
 }
 
@@ -1343,14 +1358,14 @@ nouveau_connector_create(struct drm_device *dev,
 		snprintf(aux_name, sizeof(aux_name), "sor-%04x-%04x",
 			 dcbe->hasht, dcbe->hashm);
 		nv_connector->aux.name = kstrdup(aux_name, GFP_KERNEL);
-		ret = drm_dp_aux_register(&nv_connector->aux);
+		drm_dp_aux_init(&nv_connector->aux);
 		if (ret) {
-			NV_ERROR(drm, "failed to register aux channel\n");
+			NV_ERROR(drm, "Failed to init AUX adapter for sor-%04x-%04x: %d\n",
+				 dcbe->hasht, dcbe->hashm, ret);
 			kfree(nv_connector);
 			return ERR_PTR(ret);
 		}
-		funcs = &nouveau_connector_funcs;
-		break;
+		fallthrough;
 	default:
 		funcs = &nouveau_connector_funcs;
 		break;
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
