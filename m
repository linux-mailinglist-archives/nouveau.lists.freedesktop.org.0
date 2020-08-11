Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585224227C
	for <lists+nouveau@lfdr.de>; Wed, 12 Aug 2020 00:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAC16E229;
	Tue, 11 Aug 2020 22:27:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CC96E80B
 for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2020 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMicxGW/RWYOCGNYew16lhzXat6qw3oglr/TR8xX5uI=;
 b=L5jzGkwD2YH1hkCDRFh94zdNTZWBOvQ+KpznoftgrpESsTxXlnNUt52gVSPtPTlS8Z3Epc
 sN1I5l7rrigtxEdyy3QnoGp1CGOyi7UjhoLOiRO0hlzJzxl8uvqDcc6QB7eMH5vVcAmr+D
 nFOab3mBJNQyB9lWXBCAzSbUlqZ32us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-NYYeg9NwMve1FcfIz0j-UQ-1; Tue, 11 Aug 2020 16:06:33 -0400
X-MC-Unique: NYYeg9NwMve1FcfIz0j-UQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE53800479;
 Tue, 11 Aug 2020 20:06:31 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1664F5D9D7;
 Tue, 11 Aug 2020 20:06:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Tue, 11 Aug 2020 16:04:50 -0400
Message-Id: <20200811200457.134743-14-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Tue, 11 Aug 2020 22:27:08 +0000
Subject: [Nouveau] [RFC 13/20] drm/i915/dp: Extract
 drm_dp_downstream_read_info()
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
 open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We're going to be doing the same probing process in nouveau for
determining downstream DP port capabilities, so let's deduplicate the
work by moving i915's code for handling this into a shared helper:
drm_dp_downstream_read_info().

Note that when we do this, we also do make some functional changes while
we're at it:
* We always clear the downstream port info before trying to read it,
  just to make things easier for the caller
* We skip reading downstream port info if the DPCD indicates that we
  don't support downstream port info
* We only read as many bytes as needed for the reported number of
  downstream ports, no sense in reading the whole thing every time

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c         | 32 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++---------
 include/drm/drm_dp_helper.h             |  3 +++
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4c21cf69dad5a..9703b33599c3b 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -423,6 +423,38 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
 
+/**
+ * drm_dp_downstream_read_info() - read DPCD downstream port info if available
+ * @aux: DisplayPort AUX channel
+ * @dpcd: A cached copy of the port's DPCD
+ * @downstream_ports: buffer to store the downstream port info in
+ *
+ * Returns: 0 if either the downstream port info was read successfully or
+ * there was no downstream info to read, or a negative error code otherwise.
+ */
+int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS])
+{
+	int ret;
+	u8 len;
+
+	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
+
+	/* No downstream info to read */
+	if (!drm_dp_is_branch(dpcd) ||
+	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
+	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
+		return 0;
+
+	len = (dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_PORT_COUNT_MASK) * 4;
+	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports,
+			       len);
+
+	return ret == len ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_downstream_read_info);
+
 /**
  * drm_dp_downstream_max_clock() - extract branch device max
  *                                 pixel rate for legacy VGA
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1e29d3a012856..984e49194ca31 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4685,18 +4685,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 			return false;
 	}
 
-	if (!drm_dp_is_branch(intel_dp->dpcd))
-		return true; /* native DP sink */
-
-	if (intel_dp->dpcd[DP_DPCD_REV] == 0x10)
-		return true; /* no per-port downstream info */
-
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DOWNSTREAM_PORT_0,
-			     intel_dp->downstream_ports,
-			     DP_MAX_DOWNSTREAM_PORTS) < 0)
-		return false; /* downstream port status fetch failed */
-
-	return true;
+	return drm_dp_downstream_read_info(&intel_dp->aux, intel_dp->dpcd,
+					   intel_dp->downstream_ports) == 0;
 }
 
 static bool
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 5c28199248626..1349f16564ace 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1613,6 +1613,9 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 				    u8 real_edid_checksum);
 
+int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
+				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
+				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS]);
 int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				const u8 port_cap[4]);
 int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
