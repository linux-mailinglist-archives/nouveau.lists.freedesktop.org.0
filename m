Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39425370D
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 20:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03906EAD5;
	Wed, 26 Aug 2020 18:27:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C073B6EAC2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVbdMjzuMT7GlfrRLZim06mhhhbx6k49tlW+apxKSCw=;
 b=WNwyE/i81TVc5tTXEYlxRtqUIBhAwVEmb2c+Ml4LRpCzf7N97OHvFaEJpRtfgn0HYY587c
 dScgD8kIuOSStGsZiwH+DWE0lAt2yvY1P2R3nzzs5D00VwcKFHu8D1ORl9MowvU+ztr867
 OM/t4rWNal42MZNBVtNKBWGe+hOcrOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-nZZa-m5xMza8AIApvW410w-1; Wed, 26 Aug 2020 14:26:00 -0400
X-MC-Unique: nZZa-m5xMza8AIApvW410w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A171189E60E;
 Wed, 26 Aug 2020 18:25:58 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFAE10021AA;
 Wed, 26 Aug 2020 18:25:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 26 Aug 2020 14:24:51 -0400
Message-Id: <20200826182456.322681-16-lyude@redhat.com>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Wed, 26 Aug 2020 18:27:01 +0000
Subject: [Nouveau] [PATCH v5 15/20] drm/i915/dp: Extract
 drm_dp_read_sink_count_cap()
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since other drivers are also going to need to be aware of the sink count
in order to do proper dongle detection, we might as well steal i915's
DP_SINK_COUNT helpers and move them into DRM helpers so that other
dirvers can use them as well.

Note that this also starts using intel_dp_has_sink_count() in
intel_dp_detect_dpcd(), which is a functional change.

v5:
* Change name from drm_dp_has_sink_count() to
  drm_dp_read_sink_count_cap()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_helper.c         | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++++---------
 include/drm/drm_dp_helper.h             |  8 +++++++-
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f3643894ad951..65ff21ae0c271 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -726,6 +726,28 @@ void drm_dp_set_subconnector_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_dp_set_subconnector_property);
 
+/**
+ * drm_dp_read_sink_count_cap() - Check whether a given connector has a valid sink
+ * count
+ * @connector: The DRM connector to check
+ * @dpcd: A cached copy of the connector's DPCD RX capabilities
+ * @desc: A cached copy of the connector's DP descriptor
+ *
+ * Returns: %True if the (e)DP connector has a valid sink count that should
+ * be probed, %false otherwise.
+ */
+bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				const struct drm_dp_desc *desc)
+{
+	/* Some eDP panels don't set a valid value for the sink count */
+	return connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
+		dpcd[DP_DPCD_REV] >= DP_DPCD_REV_11 &&
+		dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT &&
+		!drm_dp_has_quirk(desc, 0, DP_DPCD_QUIRK_NO_SINK_COUNT);
+}
+EXPORT_SYMBOL(drm_dp_read_sink_count_cap);
+
 /*
  * I2C-over-AUX implementation
  */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9c4b806af8c79..38318ae935f88 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4634,6 +4634,16 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	return true;
 }
 
+static bool
+intel_dp_has_sink_count(struct intel_dp *intel_dp)
+{
+	if (!intel_dp->attached_connector)
+		return false;
+
+	return drm_dp_read_sink_count_cap(&intel_dp->attached_connector->base,
+					  intel_dp->dpcd,
+					  &intel_dp->desc);
+}
 
 static bool
 intel_dp_get_dpcd(struct intel_dp *intel_dp)
@@ -4653,13 +4663,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		intel_dp_set_common_rates(intel_dp);
 	}
 
-	/*
-	 * Some eDP panels do not set a valid value for sink count, that is why
-	 * it don't care about read it here and in intel_edp_init_dpcd().
-	 */
-	if (!intel_dp_is_edp(intel_dp) &&
-	    !drm_dp_has_quirk(&intel_dp->desc, 0,
-			      DP_DPCD_QUIRK_NO_SINK_COUNT)) {
+	if (intel_dp_has_sink_count(intel_dp)) {
 		u8 count;
 		ssize_t r;
 
@@ -5939,9 +5943,8 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 		return connector_status_connected;
 
 	/* If we're HPD-aware, SINK_COUNT changes dynamically */
-	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
+	if (intel_dp_has_sink_count(intel_dp) &&
 	    intel_dp->downstream_ports[0] & DP_DS_PORT_HPD) {
-
 		return intel_dp->sink_count ?
 		connector_status_connected : connector_status_disconnected;
 	}
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b8716b200666f..4c56ce4dc54fc 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1631,6 +1631,11 @@ void drm_dp_set_subconnector_property(struct drm_connector *connector,
 				      const u8 *dpcd,
 				      const u8 port_cap[4]);
 
+struct drm_dp_desc;
+bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				const struct drm_dp_desc *desc);
+
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
 int drm_dp_aux_register(struct drm_dp_aux *aux);
@@ -1689,7 +1694,8 @@ enum drm_dp_quirk {
 	 * @DP_DPCD_QUIRK_NO_SINK_COUNT:
 	 *
 	 * The device does not set SINK_COUNT to a non-zero value.
-	 * The driver should ignore SINK_COUNT during detection.
+	 * The driver should ignore SINK_COUNT during detection. Note that
+	 * drm_dp_read_sink_count_cap() automatically checks for this quirk.
 	 */
 	DP_DPCD_QUIRK_NO_SINK_COUNT,
 	/**
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
