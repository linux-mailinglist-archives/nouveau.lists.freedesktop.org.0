Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD6B1B8364
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF06EBA6;
	Sat, 25 Apr 2020 02:52:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A1C6E934
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 12:17:01 +0000 (UTC)
IronPort-SDR: qkUww+SPDVAIXQJC82SBBenCQ1p17wL4JqujiipD3TKlYGgSJCVkjCCjvjwtBcaRqktV+DTetO
 iYIuVhLT//Ww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 05:17:01 -0700
IronPort-SDR: uaxTZ1/A1xpcoI4LzKsYYH7mBL7ug48f46m0U1C3k1IOsgZcXQncaX6lWHwXNGrNCamosYPAtU
 F3BLWiJzQ0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; d="scan'208";a="422697504"
Received: from unknown (HELO jeevan-desktop.iind.intel.com) ([10.223.74.85])
 by orsmga005.jf.intel.com with ESMTP; 01 Apr 2020 05:16:59 -0700
From: Jeevan B <jeevan.b@intel.com>
To: uma.shankar@intel.com
Date: Wed,  1 Apr 2020 17:42:26 +0530
Message-Id: <1585743148-31205-3-git-send-email-jeevan.b@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585743148-31205-1-git-send-email-jeevan.b@intel.com>
References: <1585743148-31205-1-git-send-email-jeevan.b@intel.com>
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: [Nouveau] [PATCH 3/5] drm/nouveau: utilize subconnector property
 for DP
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
Cc: Jeevan B <jeevan.b@intel.com>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since DP-specific information is stored in driver's structures, every
driver needs to implement subconnector property by itself.

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20190829114854.1539-5-oleg.vasilev@intel.com
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c        |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 9a9a7f5..6464e48 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -648,6 +648,17 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		enum drm_mode_subconnector subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+
+		if (conn_status == connector_status_connected && nv_encoder)
+			subconnector = nv_encoder->dp.subconnector;
+		drm_object_property_set_value(&connector->base,
+			connector->dev->mode_config.dp_subconnector_property,
+			subconnector);
+	}
+
 	return conn_status;
 }
 
@@ -1373,6 +1384,8 @@ nouveau_connector_create(struct drm_device *dev,
 			kfree(nv_connector);
 			return ERR_PTR(ret);
 		}
+
+		drm_mode_add_dp_subconnector_property(connector);
 		funcs = &nouveau_connector_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 2674f15..85eac85 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -62,6 +62,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_i2c_aux *aux;
 	u8 dpcd[8];
+	u8 port_cap[DP_MAX_DOWNSTREAM_PORTS] = {};
 	int ret;
 
 	aux = nv_encoder->aux;
@@ -72,6 +73,14 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	if (ret)
 		return ret;
 
+	if (dpcd[DP_DPCD_REV] > 0x10) {
+		ret = nvkm_rdaux(aux, DP_DOWNSTREAM_PORT_0,
+				 port_cap, DP_MAX_DOWNSTREAM_PORTS);
+		if (ret)
+			memset(port_cap, 0, DP_MAX_DOWNSTREAM_PORTS);
+	}
+	nv_encoder->dp.subconnector = drm_dp_subconnector_type(dpcd, port_cap);
+
 	nv_encoder->dp.link_bw = 27000 * dpcd[1];
 	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 3517f92..e17971a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -63,6 +63,7 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+			enum drm_mode_subconnector subconnector;
 		} dp;
 	};
 
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
