Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAC25211F
	for <lists+nouveau@lfdr.de>; Tue, 25 Aug 2020 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567566E99C;
	Tue, 25 Aug 2020 19:51:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721B6E998
 for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2020 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjOACk7+sj9DOgLuw8r03ZTGhj9N7xxOv/mPD0g7leg=;
 b=K3beaExiuGSF/iG+EH7m4sIXN1r9UHNiHSEzVMMc8tAy21Dwo3N1H0OeAZHejB4S4DU6cq
 G1BtCWri/FkQYjsjC5RMktIG8JP3QkJfBP/cZLHIwyGniVqy7lonfOU7WCS+euWJfYP2ax
 YFbmMbQRc50iHgElnKSJoSOReU/LBrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-QU7l26KmMSyEh_jOWaA2_A-1; Tue, 25 Aug 2020 15:51:18 -0400
X-MC-Unique: QU7l26KmMSyEh_jOWaA2_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260BA80EF8C;
 Tue, 25 Aug 2020 19:51:17 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694DC5D9D3;
 Tue, 25 Aug 2020 19:51:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Tue, 25 Aug 2020 15:50:18 -0400
Message-Id: <20200825195027.74681-12-lyude@redhat.com>
In-Reply-To: <20200825195027.74681-1-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v4 11/20] drm/nouveau/kms: Move
 drm_dp_cec_unset_edid() into nouveau_connector_detect()
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

For whatever reason we currently unset the EDID for DP CEC support when
responding to the connector being unplugged, instead of just doing it in
nouveau_connector_detect() where we set the CEC EDID. This isn't really
needed and could even potentially cause us to forget to unset the EDID
if the connector is removed without a corresponding hpd event, so let's
fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b90591114faaf..4a29f691c08e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -633,10 +633,11 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 			conn_status = connector_status_connected;
 			goto out;
 		}
-
 	}
 
  out:
+	if (!nv_connector->edid)
+		drm_dp_cec_unset_edid(&nv_connector->aux);
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
@@ -1174,8 +1175,6 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 		return NVIF_NOTIFY_DROP;
 	}
 
-	if (!plugged)
-		drm_dp_cec_unset_edid(&nv_connector->aux);
 	NV_DEBUG(drm, "%splugged %s\n", plugged ? "" : "un", name);
 
 	drm_helper_hpd_irq_event(connector->dev);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
