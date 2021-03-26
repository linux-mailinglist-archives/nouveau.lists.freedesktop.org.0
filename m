Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B834B048
	for <lists+nouveau@lfdr.de>; Fri, 26 Mar 2021 21:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE596F48E;
	Fri, 26 Mar 2021 20:38:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43016F48C
 for <nouveau@lists.freedesktop.org>; Fri, 26 Mar 2021 20:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmQT4kwkBj3zkjU+qDLCL9oi03TPHerNpdb0ii5Rrwc=;
 b=Jk9sOjF/RhuCbtFlF//162jw9X2kC8TXGbMPofAXgef9IsVUberE6z2iKvfogDbhibFfI4
 OM3Si8rh7M8ee8d+FTVjgLcqAybvsEcIKTBef31e5RVv7LTCNY1qkkdIOnNvAzunFbEgo0
 +uefj7uSP607PXIsBBPqPHurfZ8G2po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-JvV-qrv2PGCDRJp_AcojTQ-1; Fri, 26 Mar 2021 16:38:34 -0400
X-MC-Unique: JvV-qrv2PGCDRJp_AcojTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 724A91009E33;
 Fri, 26 Mar 2021 20:38:31 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B15525DAA5;
 Fri, 26 Mar 2021 20:38:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Fri, 26 Mar 2021 16:37:50 -0400
Message-Id: <20210326203807.105754-4-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [PATCH v2 03/20] drm/bridge/cdns-mhdp8546: Register DP
 aux channel with userspace
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Andrzej Hajda <a.hajda@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Just adds some missing calls to
drm_dp_aux_register()/drm_dp_aux_unregister() for when we attach/detach the
bridge.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 989a05bc8197..d966a33743b5 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1674,10 +1674,14 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
+	ret = drm_dp_aux_register(&mhdp->aux);
+	if (ret < 0)
+		return ret;
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = cdns_mhdp_connector_init(mhdp);
 		if (ret)
-			return ret;
+			goto aux_unregister;
 	}
 
 	spin_lock(&mhdp->start_lock);
@@ -1693,6 +1697,9 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	return 0;
+aux_unregister:
+	drm_dp_aux_unregister(&mhdp->aux);
+	return ret;
 }
 
 static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
@@ -2025,6 +2032,8 @@ static void cdns_mhdp_detach(struct drm_bridge *bridge)
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
+	drm_dp_aux_unregister(&mhdp->aux);
+
 	spin_lock(&mhdp->start_lock);
 
 	mhdp->bridge_attached = false;
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
