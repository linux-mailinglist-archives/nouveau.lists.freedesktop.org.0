Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28992527BF
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 08:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6F76E0E8;
	Wed, 26 Aug 2020 06:51:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C016E0E8;
 Wed, 26 Aug 2020 06:51:07 +0000 (UTC)
IronPort-SDR: 0kGWv+pL/Dx1B8Th2bpfJLuZXqe+xckJDEpx25U7dVyGWycTyrYWI7Mhy3nCk8ntqpwQNpTGVF
 YfMCLXu5D+fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="241060118"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="241060118"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:51:06 -0700
IronPort-SDR: eXA2Ctxuxef8Y/HzVNr8uk48VKITpz9iZqE34/VujwQgdQLyL+LL4hjDx6E6tURLH4+egcMXl3
 UJAUAqrElIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="323079234"
Received: from unknown (HELO jeevan.iind.intel.com) ([10.223.74.85])
 by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2020 23:51:03 -0700
From: Jeevan B <jeevan.b@intel.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Sun, 16 Aug 2020 12:21:45 +0530
Message-Id: <1597560705-13897-1-git-send-email-jeevan.b@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587732655-17544-3-git-send-email-jeevan.b@intel.com>
References: <1587732655-17544-3-git-send-email-jeevan.b@intel.com>
Subject: [Nouveau] [v3] drm/nouveau: utilize subconnector property for DP
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
Cc: jani.nikula@intel.com, Oleg Vasilev <oleg.vasilev@intel.com>,
 maarten.lankhorst@linux.intel.com, Jeevan B <jeevan.b@intel.com>,
 uma.shankar@intel.com, bskeggs@redhat.com, airlied@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Oleg Vasilev <oleg.vasilev@intel.com>

Since DP-specific information is stored in driver's structures, every
driver needs to implement subconnector property by itself.

v2: rebase

v3: renamed a function call

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c        |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025..955afed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -654,6 +654,17 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
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
 
@@ -1390,6 +1401,8 @@ nouveau_connector_create(struct drm_device *dev,
 			kfree(nv_connector);
 			return ERR_PTR(ret);
 		}
+
+		drm_connector_attach_dp_subconnector_property(connector);
 		funcs = &nouveau_connector_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8a0f799..3eff884 100644
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
index a72c412..49b5c10 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -64,6 +64,7 @@ struct nouveau_encoder {
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
