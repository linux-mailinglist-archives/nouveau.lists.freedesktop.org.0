Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26713200EA
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 22:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010FC6ECA4;
	Fri, 19 Feb 2021 21:56:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964F6EC9B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3I1NUQpx3Wc3O5/j4qHRY20ZNlERJCG7G42uQPjtsww=;
 b=By/fUPFWftbY1hPRALRCE3cyLKF20h5PEeT835/iPXBw66PYoQQyQamln3C6PGQSy0YUGq
 EGja7fohPyHqx3QvyyIWXvIDd19ttzm3rmlVdN8lnQoLyoukddToUfGa6JxFY98ffBw6XI
 WW23CabNVv5KlAc+aQF0li/jiOccngA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-cRYLgGW7NfC4H1kHIzcKRA-1; Fri, 19 Feb 2021 16:55:57 -0500
X-MC-Unique: cRYLgGW7NfC4H1kHIzcKRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5FB18A08BE;
 Fri, 19 Feb 2021 21:55:55 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 833676A03C;
 Fri, 19 Feb 2021 21:55:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 19 Feb 2021 16:53:26 -0500
Message-Id: <20210219215326.2227596-31-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH 30/30] drm/dp_mst: Convert drm_dp_mst_topology.c
 to drm_err()/drm_dbg*()
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

And finally, convert all of the code in drm_dp_mst_topology.c over to using
drm_err() and drm_dbg*(). Note that this refactor would have been a lot
more complicated to have tried writing a coccinelle script for, so this
whole thing was done by hand.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 369 +++++++++++++-------------
 1 file changed, 187 insertions(+), 182 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index fb66df39e0bb..f66232954689 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -286,7 +286,8 @@ static void drm_dp_encode_sideband_msg_hdr(struct drm_dp_sideband_msg_hdr *hdr,
 	*len = idx;
 }
 
-static bool drm_dp_decode_sideband_msg_hdr(struct drm_dp_sideband_msg_hdr *hdr,
+static bool drm_dp_decode_sideband_msg_hdr(const struct drm_dp_mst_topology_mgr *mgr,
+					   struct drm_dp_sideband_msg_hdr *hdr,
 					   u8 *buf, int buflen, u8 *hdrlen)
 {
 	u8 crc4;
@@ -303,7 +304,7 @@ static bool drm_dp_decode_sideband_msg_hdr(struct drm_dp_sideband_msg_hdr *hdr,
 	crc4 = drm_dp_msg_header_crc4(buf, (len * 2) - 1);
 
 	if ((crc4 & 0xf) != (buf[len - 1] & 0xf)) {
-		DRM_DEBUG_KMS("crc4 mismatch 0x%x 0x%x\n", crc4, buf[len - 1]);
+		drm_dbg_kms(mgr->dev, "crc4 mismatch 0x%x 0x%x\n", crc4, buf[len - 1]);
 		return false;
 	}
 
@@ -789,7 +790,8 @@ static bool drm_dp_sideband_append_payload(struct drm_dp_sideband_msg_rx *msg,
 	return true;
 }
 
-static bool drm_dp_sideband_parse_link_address(struct drm_dp_sideband_msg_rx *raw,
+static bool drm_dp_sideband_parse_link_address(const struct drm_dp_mst_topology_mgr *mgr,
+					       struct drm_dp_sideband_msg_rx *raw,
 					       struct drm_dp_sideband_msg_reply_body *repmsg)
 {
 	int idx = 1;
@@ -1014,7 +1016,8 @@ drm_dp_sideband_parse_query_stream_enc_status(
 	return true;
 }
 
-static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
+static bool drm_dp_sideband_parse_reply(const struct drm_dp_mst_topology_mgr *mgr,
+					struct drm_dp_sideband_msg_rx *raw,
 					struct drm_dp_sideband_msg_reply_body *msg)
 {
 	memset(msg, 0, sizeof(*msg));
@@ -1030,7 +1033,7 @@ static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
 
 	switch (msg->req_type) {
 	case DP_LINK_ADDRESS:
-		return drm_dp_sideband_parse_link_address(raw, msg);
+		return drm_dp_sideband_parse_link_address(mgr, raw, msg);
 	case DP_QUERY_PAYLOAD:
 		return drm_dp_sideband_parse_query_payload_ack(raw, msg);
 	case DP_REMOTE_DPCD_READ:
@@ -1053,14 +1056,16 @@ static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
 	case DP_QUERY_STREAM_ENC_STATUS:
 		return drm_dp_sideband_parse_query_stream_enc_status(raw, msg);
 	default:
-		DRM_ERROR("Got unknown reply 0x%02x (%s)\n", msg->req_type,
-			  drm_dp_mst_req_type_str(msg->req_type));
+		drm_err(mgr->dev, "Got unknown reply 0x%02x (%s)\n",
+			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
 		return false;
 	}
 }
 
-static bool drm_dp_sideband_parse_connection_status_notify(struct drm_dp_sideband_msg_rx *raw,
-							   struct drm_dp_sideband_msg_req_body *msg)
+static bool
+drm_dp_sideband_parse_connection_status_notify(const struct drm_dp_mst_topology_mgr *mgr,
+					       struct drm_dp_sideband_msg_rx *raw,
+					       struct drm_dp_sideband_msg_req_body *msg)
 {
 	int idx = 1;
 
@@ -1082,12 +1087,14 @@ static bool drm_dp_sideband_parse_connection_status_notify(struct drm_dp_sideban
 	idx++;
 	return true;
 fail_len:
-	DRM_DEBUG_KMS("connection status reply parse length fail %d %d\n", idx, raw->curlen);
+	drm_dbg_kms(mgr->dev, "connection status reply parse length fail %d %d\n",
+		    idx, raw->curlen);
 	return false;
 }
 
-static bool drm_dp_sideband_parse_resource_status_notify(struct drm_dp_sideband_msg_rx *raw,
-							   struct drm_dp_sideband_msg_req_body *msg)
+static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst_topology_mgr *mgr,
+							 struct drm_dp_sideband_msg_rx *raw,
+							 struct drm_dp_sideband_msg_req_body *msg)
 {
 	int idx = 1;
 
@@ -1105,11 +1112,12 @@ static bool drm_dp_sideband_parse_resource_status_notify(struct drm_dp_sideband_
 	idx++;
 	return true;
 fail_len:
-	DRM_DEBUG_KMS("resource status reply parse length fail %d %d\n", idx, raw->curlen);
+	drm_dbg_kms(mgr->dev, "resource status reply parse length fail %d %d\n", idx, raw->curlen);
 	return false;
 }
 
-static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
+static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
+				      struct drm_dp_sideband_msg_rx *raw,
 				      struct drm_dp_sideband_msg_req_body *msg)
 {
 	memset(msg, 0, sizeof(*msg));
@@ -1117,12 +1125,12 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
 
 	switch (msg->req_type) {
 	case DP_CONNECTION_STATUS_NOTIFY:
-		return drm_dp_sideband_parse_connection_status_notify(raw, msg);
+		return drm_dp_sideband_parse_connection_status_notify(mgr, raw, msg);
 	case DP_RESOURCE_STATUS_NOTIFY:
-		return drm_dp_sideband_parse_resource_status_notify(raw, msg);
+		return drm_dp_sideband_parse_resource_status_notify(mgr, raw, msg);
 	default:
-		DRM_ERROR("Got unknown request 0x%02x (%s)\n", msg->req_type,
-			  drm_dp_mst_req_type_str(msg->req_type));
+		drm_err(mgr->dev, "Got unknown request 0x%02x (%s)\n",
+			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
 		return false;
 	}
 }
@@ -1231,14 +1239,14 @@ static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *mgr,
 	ret = find_first_zero_bit(&mgr->payload_mask, mgr->max_payloads + 1);
 	if (ret > mgr->max_payloads) {
 		ret = -EINVAL;
-		DRM_DEBUG_KMS("out of payload ids %d\n", ret);
+		drm_dbg_kms(mgr->dev, "out of payload ids %d\n", ret);
 		goto out_unlock;
 	}
 
 	vcpi_ret = find_first_zero_bit(&mgr->vcpi_mask, mgr->max_payloads + 1);
 	if (vcpi_ret > mgr->max_payloads) {
 		ret = -EINVAL;
-		DRM_DEBUG_KMS("out of vcpi ids %d\n", ret);
+		drm_dbg_kms(mgr->dev, "out of vcpi ids %d\n", ret);
 		goto out_unlock;
 	}
 
@@ -1260,7 +1268,7 @@ static void drm_dp_mst_put_payload_id(struct drm_dp_mst_topology_mgr *mgr,
 		return;
 
 	mutex_lock(&mgr->payload_lock);
-	DRM_DEBUG_KMS("putting payload %d\n", vcpi);
+	drm_dbg_kms(mgr->dev, "putting payload %d\n", vcpi);
 	clear_bit(vcpi - 1, &mgr->vcpi_mask);
 
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -1330,7 +1338,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 			goto out;
 		}
 	} else {
-		DRM_DEBUG_KMS("timedout msg send %p %d %d\n", txmsg, txmsg->state, txmsg->seqno);
+		drm_dbg_kms(mgr->dev, "timedout msg send %p %d %d\n",
+			    txmsg, txmsg->state, txmsg->seqno);
 
 		/* dump some state */
 		ret = -EIO;
@@ -1484,7 +1493,7 @@ static void
 drm_dp_mst_get_mstb_malloc(struct drm_dp_mst_branch *mstb)
 {
 	kref_get(&mstb->malloc_kref);
-	DRM_DEBUG("mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref));
+	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref));
 }
 
 /**
@@ -1501,7 +1510,7 @@ drm_dp_mst_get_mstb_malloc(struct drm_dp_mst_branch *mstb)
 static void
 drm_dp_mst_put_mstb_malloc(struct drm_dp_mst_branch *mstb)
 {
-	DRM_DEBUG("mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref) - 1);
+	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->malloc_kref) - 1);
 	kref_put(&mstb->malloc_kref, drm_dp_free_mst_branch_device);
 }
 
@@ -1535,7 +1544,7 @@ void
 drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port)
 {
 	kref_get(&port->malloc_kref);
-	DRM_DEBUG("port %p (%d)\n", port, kref_read(&port->malloc_kref));
+	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->malloc_kref));
 }
 EXPORT_SYMBOL(drm_dp_mst_get_port_malloc);
 
@@ -1552,7 +1561,7 @@ EXPORT_SYMBOL(drm_dp_mst_get_port_malloc);
 void
 drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port)
 {
-	DRM_DEBUG("port %p (%d)\n", port, kref_read(&port->malloc_kref) - 1);
+	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->malloc_kref) - 1);
 	kref_put(&port->malloc_kref, drm_dp_free_mst_port);
 }
 EXPORT_SYMBOL(drm_dp_mst_put_port_malloc);
@@ -1777,8 +1786,7 @@ drm_dp_mst_topology_try_get_mstb(struct drm_dp_mst_branch *mstb)
 	topology_ref_history_lock(mstb->mgr);
 	ret = kref_get_unless_zero(&mstb->topology_kref);
 	if (ret) {
-		DRM_DEBUG("mstb %p (%d)\n",
-			  mstb, kref_read(&mstb->topology_kref));
+		drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref));
 		save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_GET);
 	}
 
@@ -1808,7 +1816,7 @@ static void drm_dp_mst_topology_get_mstb(struct drm_dp_mst_branch *mstb)
 	save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_GET);
 	WARN_ON(kref_read(&mstb->topology_kref) == 0);
 	kref_get(&mstb->topology_kref);
-	DRM_DEBUG("mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref));
+	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref));
 
 	topology_ref_history_unlock(mstb->mgr);
 }
@@ -1830,8 +1838,7 @@ drm_dp_mst_topology_put_mstb(struct drm_dp_mst_branch *mstb)
 {
 	topology_ref_history_lock(mstb->mgr);
 
-	DRM_DEBUG("mstb %p (%d)\n",
-		  mstb, kref_read(&mstb->topology_kref) - 1);
+	drm_dbg(mstb->mgr->dev, "mstb %p (%d)\n", mstb, kref_read(&mstb->topology_kref) - 1);
 	save_mstb_topology_ref(mstb, DRM_DP_MST_TOPOLOGY_REF_PUT);
 
 	topology_ref_history_unlock(mstb->mgr);
@@ -1894,8 +1901,7 @@ drm_dp_mst_topology_try_get_port(struct drm_dp_mst_port *port)
 	topology_ref_history_lock(port->mgr);
 	ret = kref_get_unless_zero(&port->topology_kref);
 	if (ret) {
-		DRM_DEBUG("port %p (%d)\n",
-			  port, kref_read(&port->topology_kref));
+		drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref));
 		save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_GET);
 	}
 
@@ -1922,7 +1928,7 @@ static void drm_dp_mst_topology_get_port(struct drm_dp_mst_port *port)
 
 	WARN_ON(kref_read(&port->topology_kref) == 0);
 	kref_get(&port->topology_kref);
-	DRM_DEBUG("port %p (%d)\n", port, kref_read(&port->topology_kref));
+	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref));
 	save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_GET);
 
 	topology_ref_history_unlock(port->mgr);
@@ -1943,8 +1949,7 @@ static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
 {
 	topology_ref_history_lock(port->mgr);
 
-	DRM_DEBUG("port %p (%d)\n",
-		  port, kref_read(&port->topology_kref) - 1);
+	drm_dbg(port->mgr->dev, "port %p (%d)\n", port, kref_read(&port->topology_kref) - 1);
 	save_port_topology_ref(port, DRM_DP_MST_TOPOLOGY_REF_PUT);
 
 	topology_ref_history_unlock(port->mgr);
@@ -2129,8 +2134,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 			mstb = drm_dp_add_mst_branch_device(lct, rad);
 			if (!mstb) {
 				ret = -ENOMEM;
-				DRM_ERROR("Failed to create MSTB for port %p",
-					  port);
+				drm_err(mgr->dev, "Failed to create MSTB for port %p", port);
 				goto out;
 			}
 
@@ -2260,8 +2264,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
-	DRM_DEBUG_KMS("registering %s remote bus for %s\n",
-		      port->aux.name, connector->kdev->kobj.name);
+	drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
+		    port->aux.name, connector->kdev->kobj.name);
 
 	port->aux.dev = connector->kdev;
 	return drm_dp_aux_register_devnode(&port->aux);
@@ -2280,8 +2284,8 @@ EXPORT_SYMBOL(drm_dp_mst_connector_late_register);
 void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 					   struct drm_dp_mst_port *port)
 {
-	DRM_DEBUG_KMS("unregistering %s remote bus for %s\n",
-		      port->aux.name, connector->kdev->kobj.name);
+	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
+		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
@@ -2311,7 +2315,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	return;
 
 error:
-	DRM_ERROR("Failed to create connector for port %p: %d\n", port, ret);
+	drm_err(mgr->dev, "Failed to create connector for port %p: %d\n", port, ret);
 }
 
 /*
@@ -2451,8 +2455,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 	if (ret == 1) {
 		send_link_addr = true;
 	} else if (ret < 0) {
-		DRM_ERROR("Failed to change PDT on port %p: %d\n",
-			  port, ret);
+		drm_err(dev, "Failed to change PDT on port %p: %d\n", port, ret);
 		goto fail;
 	}
 
@@ -2547,8 +2550,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 	if (ret == 1) {
 		dowork = true;
 	} else if (ret < 0) {
-		DRM_ERROR("Failed to change PDT for port %p: %d\n",
-			  port, ret);
+		drm_err(mgr->dev, "Failed to change PDT for port %p: %d\n", port, ret);
 		dowork = false;
 	}
 
@@ -2607,7 +2609,9 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
 			if (port->port_num == port_num) {
 				mstb = port->mstb;
 				if (!mstb) {
-					DRM_ERROR("failed to lookup MSTB with lct %d, rad %02x\n", lct, rad[0]);
+					drm_err(mgr->dev,
+						"failed to lookup MSTB with lct %d, rad %02x\n",
+						lct, rad[0]);
 					goto out;
 				}
 
@@ -2743,7 +2747,7 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 	 * things work again.
 	 */
 	if (clear_payload_id_table) {
-		DRM_DEBUG_KMS("Clearing payload ID table\n");
+		drm_dbg_kms(dev, "Clearing payload ID table\n");
 		drm_dp_send_clear_payload_id_table(mgr, mstb);
 	}
 
@@ -2805,7 +2809,7 @@ static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
 				retries++;
 				goto retry;
 			}
-			DRM_DEBUG_KMS("failed to dpcd write %d %d\n", tosend, ret);
+			drm_dbg_kms(mgr->dev, "failed to dpcd write %d %d\n", tosend, ret);
 
 			return -EIO;
 		}
@@ -2912,7 +2916,7 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
 				 struct drm_dp_sideband_msg_tx, next);
 	ret = process_single_tx_qlock(mgr, txmsg, false);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
+		drm_dbg_kms(mgr->dev, "failed to send msg in q %d\n", ret);
 		list_del(&txmsg->next);
 		txmsg->state = DRM_DP_SIDEBAND_TX_TIMEOUT;
 		wake_up_all(&mgr->tx_waitq);
@@ -2937,24 +2941,26 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 }
 
 static void
-drm_dp_dump_link_address(struct drm_dp_link_address_ack_reply *reply)
+drm_dp_dump_link_address(const struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_link_address_ack_reply *reply)
 {
 	struct drm_dp_link_addr_reply_port *port_reply;
 	int i;
 
 	for (i = 0; i < reply->nports; i++) {
 		port_reply = &reply->ports[i];
-		DRM_DEBUG_KMS("port %d: input %d, pdt: %d, pn: %d, dpcd_rev: %02x, mcs: %d, ddps: %d, ldps %d, sdp %d/%d\n",
-			      i,
-			      port_reply->input_port,
-			      port_reply->peer_device_type,
-			      port_reply->port_number,
-			      port_reply->dpcd_revision,
-			      port_reply->mcs,
-			      port_reply->ddps,
-			      port_reply->legacy_device_plug_status,
-			      port_reply->num_sdp_streams,
-			      port_reply->num_sdp_stream_sinks);
+		drm_dbg_kms(mgr->dev,
+			    "port %d: input %d, pdt: %d, pn: %d, dpcd_rev: %02x, mcs: %d, ddps: %d, ldps %d, sdp %d/%d\n",
+			    i,
+			    port_reply->input_port,
+			    port_reply->peer_device_type,
+			    port_reply->port_number,
+			    port_reply->dpcd_revision,
+			    port_reply->mcs,
+			    port_reply->ddps,
+			    port_reply->legacy_device_plug_status,
+			    port_reply->num_sdp_streams,
+			    port_reply->num_sdp_stream_sinks);
 	}
 }
 
@@ -2980,26 +2986,25 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	/* FIXME: Actually do some real error handling here */
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret <= 0) {
-		DRM_ERROR("Sending link address failed with %d\n", ret);
+		drm_err(mgr->dev, "Sending link address failed with %d\n", ret);
 		goto out;
 	}
 	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-		DRM_ERROR("link address NAK received\n");
+		drm_err(mgr->dev, "link address NAK received\n");
 		ret = -EIO;
 		goto out;
 	}
 
 	reply = &txmsg->reply.u.link_addr;
-	DRM_DEBUG_KMS("link address reply: %d\n", reply->nports);
-	drm_dp_dump_link_address(reply);
+	drm_dbg_kms(mgr->dev, "link address reply: %d\n", reply->nports);
+	drm_dp_dump_link_address(mgr, reply);
 
 	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
 	if (ret) {
 		char buf[64];
 
 		drm_dp_mst_rad_to_str(mstb->rad, mstb->lct, buf, sizeof(buf));
-		DRM_ERROR("GUID check on %s failed: %d\n",
-			  buf, ret);
+		drm_err(mgr->dev, "GUID check on %s failed: %d\n", buf, ret);
 		goto out;
 	}
 
@@ -3023,8 +3028,8 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 		if (port_mask & BIT(port->port_num))
 			continue;
 
-		DRM_DEBUG_KMS("port %d was not in link address, removing\n",
-			      port->port_num);
+		drm_dbg_kms(mgr->dev, "port %d was not in link address, removing\n",
+			    port->port_num);
 		list_del(&port->next);
 		drm_dp_mst_topology_put_port(port);
 		changed = true;
@@ -3056,7 +3061,7 @@ drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
-		DRM_DEBUG_KMS("clear payload table id nak received\n");
+		drm_dbg_kms(mgr->dev, "clear payload table id nak received\n");
 
 	kfree(txmsg);
 }
@@ -3085,15 +3090,15 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 		path_res = &txmsg->reply.u.path_resources;
 
 		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-			DRM_DEBUG_KMS("enum path resources nak received\n");
+			drm_dbg_kms(mgr->dev, "enum path resources nak received\n");
 		} else {
 			if (port->port_num != path_res->port_number)
 				DRM_ERROR("got incorrect port in response\n");
 
-			DRM_DEBUG_KMS("enum path resources %d: %d %d\n",
-				      path_res->port_number,
-				      path_res->full_payload_bw_number,
-				      path_res->avail_payload_bw_number);
+			drm_dbg_kms(mgr->dev, "enum path resources %d: %d %d\n",
+				    path_res->port_number,
+				    path_res->full_payload_bw_number,
+				    path_res->avail_payload_bw_number);
 
 			/*
 			 * If something changed, make sure we send a
@@ -3339,7 +3344,7 @@ static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
 					int id,
 					struct drm_dp_payload *payload)
 {
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(mgr->dev, "\n");
 	/* it's okay for these to fail */
 	if (port) {
 		drm_dp_payload_send_msg(mgr, port, id, 0);
@@ -3445,7 +3450,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 			continue;
 		}
 
-		DRM_DEBUG_KMS("removing payload %d\n", i);
+		drm_dbg_kms(mgr->dev, "removing payload %d\n", i);
 		for (j = i; j < mgr->max_payloads - 1; j++) {
 			mgr->payloads[j] = mgr->payloads[j + 1];
 			mgr->proposed_vcpis[j] = mgr->proposed_vcpis[j + 1];
@@ -3492,7 +3497,7 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
 
 		port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
 
-		DRM_DEBUG_KMS("payload %d %d\n", i, mgr->payloads[i].payload_state);
+		drm_dbg_kms(mgr->dev, "payload %d %d\n", i, mgr->payloads[i].payload_state);
 		if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL) {
 			ret = drm_dp_create_payload_step2(mgr, port, mgr->proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
 		} else if (mgr->payloads[i].payload_state == DP_PAYLOAD_DELETE_LOCAL) {
@@ -3537,8 +3542,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* DPCD read should never be NACKed */
 	if (txmsg->reply.reply_type == 1) {
-		DRM_ERROR("mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
-			  mstb, port->port_num, offset, size);
+		drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
+			mstb, port->port_num, offset, size);
 		ret = -EIO;
 		goto fail_free;
 	}
@@ -3644,8 +3649,8 @@ int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count)
 {
 	if (link_rate == 0 || link_lane_count == 0)
-		DRM_DEBUG_KMS("invalid link rate/lane count: (%d / %d)\n",
-			      link_rate, link_lane_count);
+		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
+			    link_rate, link_lane_count);
 
 	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
 	return link_rate * link_lane_count / 54000;
@@ -3702,7 +3707,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		/* get dpcd info */
 		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
 		if (ret != DP_RECEIVER_CAP_SIZE) {
-			DRM_DEBUG_KMS("failed to read DPCD\n");
+			drm_dbg_kms(mgr->dev, "failed to read DPCD\n");
 			goto out_unlock;
 		}
 
@@ -3837,7 +3842,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
 			       DP_RECEIVER_CAP_SIZE);
 	if (ret != DP_RECEIVER_CAP_SIZE) {
-		DRM_DEBUG_KMS("dpcd read failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
@@ -3846,20 +3851,20 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 				 DP_UP_REQ_EN |
 				 DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("mst write failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	/* Some hubs forget their guids after they resume */
 	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
 	if (ret != 16) {
-		DRM_DEBUG_KMS("dpcd read failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	ret = drm_dp_check_mstb_guid(mgr->mst_primary, guid);
 	if (ret) {
-		DRM_DEBUG_KMS("check mstb failed - undocked during suspend?\n");
+		drm_dbg_kms(mgr->dev, "check mstb failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
@@ -3872,7 +3877,8 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	mutex_unlock(&mgr->lock);
 
 	if (sync) {
-		DRM_DEBUG_KMS("Waiting for link probe work to finish re-syncing topology...\n");
+		drm_dbg_kms(mgr->dev,
+			    "Waiting for link probe work to finish re-syncing topology...\n");
 		flush_work(&mgr->work);
 	}
 
@@ -3905,15 +3911,15 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
 	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
 	if (ret != len) {
-		DRM_DEBUG_KMS("failed to read DPCD down rep %d %d\n", len, ret);
+		drm_dbg_kms(mgr->dev, "failed to read DPCD down rep %d %d\n", len, ret);
 		return false;
 	}
 
-	ret = drm_dp_decode_sideband_msg_hdr(&hdr, replyblock, len, &hdrlen);
+	ret = drm_dp_decode_sideband_msg_hdr(mgr, &hdr, replyblock, len, &hdrlen);
 	if (ret == false) {
 		print_hex_dump(KERN_DEBUG, "failed hdr", DUMP_PREFIX_NONE, 16,
 			       1, replyblock, len, false);
-		DRM_DEBUG_KMS("ERROR: failed header\n");
+		drm_dbg_kms(mgr->dev, "ERROR: failed header\n");
 		return false;
 	}
 
@@ -3921,22 +3927,20 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		/* Caller is responsible for giving back this reference */
 		*mstb = drm_dp_get_mst_branch_device(mgr, hdr.lct, hdr.rad);
 		if (!*mstb) {
-			DRM_DEBUG_KMS("Got MST reply from unknown device %d\n",
-				      hdr.lct);
+			drm_dbg_kms(mgr->dev, "Got MST reply from unknown device %d\n", hdr.lct);
 			return false;
 		}
 	}
 
 	if (!drm_dp_sideband_msg_set_header(msg, &hdr, hdrlen)) {
-		DRM_DEBUG_KMS("sideband msg set header failed %d\n",
-			      replyblock[0]);
+		drm_dbg_kms(mgr->dev, "sideband msg set header failed %d\n", replyblock[0]);
 		return false;
 	}
 
 	replylen = min(msg->curchunk_len, (u8)(len - hdrlen));
 	ret = drm_dp_sideband_append_payload(msg, replyblock + hdrlen, replylen);
 	if (!ret) {
-		DRM_DEBUG_KMS("sideband msg build failed %d\n", replyblock[0]);
+		drm_dbg_kms(mgr->dev, "sideband msg build failed %d\n", replyblock[0]);
 		return false;
 	}
 
@@ -3947,14 +3951,14 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		ret = drm_dp_dpcd_read(mgr->aux, basereg + curreply,
 				    replyblock, len);
 		if (ret != len) {
-			DRM_DEBUG_KMS("failed to read a chunk (len %d, ret %d)\n",
-				      len, ret);
+			drm_dbg_kms(mgr->dev, "failed to read a chunk (len %d, ret %d)\n",
+				    len, ret);
 			return false;
 		}
 
 		ret = drm_dp_sideband_append_payload(msg, replyblock, len);
 		if (!ret) {
-			DRM_DEBUG_KMS("failed to build sideband msg\n");
+			drm_dbg_kms(mgr->dev, "failed to build sideband msg\n");
 			return false;
 		}
 
@@ -3988,21 +3992,21 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 		struct drm_dp_sideband_msg_hdr *hdr;
 
 		hdr = &msg->initial_hdr;
-		DRM_DEBUG_KMS("Got MST reply with no msg %p %d %d %02x %02x\n",
-			      mstb, hdr->seqno, hdr->lct, hdr->rad[0],
-			      msg->msg[0]);
+		drm_dbg_kms(mgr->dev, "Got MST reply with no msg %p %d %d %02x %02x\n",
+			    mstb, hdr->seqno, hdr->lct, hdr->rad[0], msg->msg[0]);
 		goto out_clear_reply;
 	}
 
-	drm_dp_sideband_parse_reply(msg, &txmsg->reply);
+	drm_dp_sideband_parse_reply(mgr, msg, &txmsg->reply);
 
 	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-		DRM_DEBUG_KMS("Got NAK reply: req 0x%02x (%s), reason 0x%02x (%s), nak data 0x%02x\n",
-			      txmsg->reply.req_type,
-			      drm_dp_mst_req_type_str(txmsg->reply.req_type),
-			      txmsg->reply.u.nak.reason,
-			      drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
-			      txmsg->reply.u.nak.nak_data);
+		drm_dbg_kms(mgr->dev,
+			    "Got NAK reply: req 0x%02x (%s), reason 0x%02x (%s), nak data 0x%02x\n",
+			    txmsg->reply.req_type,
+			    drm_dp_mst_req_type_str(txmsg->reply.req_type),
+			    txmsg->reply.u.nak.reason,
+			    drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
+			    txmsg->reply.u.nak.nak_data);
 	}
 
 	memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
@@ -4050,8 +4054,7 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	if (!mstb) {
-		DRM_DEBUG_KMS("Got MST reply from unknown device %d\n",
-			      hdr->lct);
+		drm_dbg_kms(mgr->dev, "Got MST reply from unknown device %d\n", hdr->lct);
 		return false;
 	}
 
@@ -4107,17 +4110,17 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 
 	up_req = kzalloc(sizeof(*up_req), GFP_KERNEL);
 	if (!up_req) {
-		DRM_ERROR("Not enough memory to process MST up req\n");
+		drm_err(mgr->dev, "Not enough memory to process MST up req\n");
 		return -ENOMEM;
 	}
 	INIT_LIST_HEAD(&up_req->next);
 
-	drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
+	drm_dp_sideband_parse_req(mgr, &mgr->up_req_recv, &up_req->msg);
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
 	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
-		DRM_DEBUG_KMS("Received unknown up req type, ignoring: %x\n",
-			      up_req->msg.req_type);
+		drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
+			    up_req->msg.req_type);
 		kfree(up_req);
 		goto out;
 	}
@@ -4129,20 +4132,20 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		const struct drm_dp_connection_status_notify *conn_stat =
 			&up_req->msg.u.conn_stat;
 
-		DRM_DEBUG_KMS("Got CSN: pn: %d ldps:%d ddps: %d mcs: %d ip: %d pdt: %d\n",
-			      conn_stat->port_number,
-			      conn_stat->legacy_device_plug_status,
-			      conn_stat->displayport_device_plug_status,
-			      conn_stat->message_capability_status,
-			      conn_stat->input_port,
-			      conn_stat->peer_device_type);
+		drm_dbg_kms(mgr->dev, "Got CSN: pn: %d ldps:%d ddps: %d mcs: %d ip: %d pdt: %d\n",
+			    conn_stat->port_number,
+			    conn_stat->legacy_device_plug_status,
+			    conn_stat->displayport_device_plug_status,
+			    conn_stat->message_capability_status,
+			    conn_stat->input_port,
+			    conn_stat->peer_device_type);
 	} else if (up_req->msg.req_type == DP_RESOURCE_STATUS_NOTIFY) {
 		const struct drm_dp_resource_status_notify *res_stat =
 			&up_req->msg.u.resource_stat;
 
-		DRM_DEBUG_KMS("Got RSN: pn: %d avail_pbn %d\n",
-			      res_stat->port_number,
-			      res_stat->available_pbn);
+		drm_dbg_kms(mgr->dev, "Got RSN: pn: %d avail_pbn %d\n",
+			    res_stat->port_number,
+			    res_stat->available_pbn);
 	}
 
 	up_req->hdr = mgr->up_req_recv.initial_hdr;
@@ -4382,8 +4385,9 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 			 * which is an error
 			 */
 			if (WARN_ON(!prev_slots)) {
-				DRM_ERROR("cannot allocate and release VCPI on [MST PORT:%p] in the same state\n",
-					  port);
+				drm_err(mgr->dev,
+					"cannot allocate and release VCPI on [MST PORT:%p] in the same state\n",
+					port);
 				return -EINVAL;
 			}
 
@@ -4400,12 +4404,12 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 
 	req_slots = DIV_ROUND_UP(pbn, pbn_div);
 
-	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
-			 port->connector->base.id, port->connector->name,
-			 port, prev_slots, req_slots);
-	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
-			 port->connector->base.id, port->connector->name,
-			 port, prev_bw, pbn);
+	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
+		       port->connector->base.id, port->connector->name,
+		       port, prev_slots, req_slots);
+	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
+		       port->connector->base.id, port->connector->name,
+		       port, prev_bw, pbn);
 
 	/* Add the new allocation to the state */
 	if (!vcpi) {
@@ -4469,12 +4473,12 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 		}
 	}
 	if (WARN_ON(!found)) {
-		DRM_ERROR("no VCPI for [MST PORT:%p] found in mst state %p\n",
-			  port, &topology_state->base);
+		drm_err(mgr->dev, "no VCPI for [MST PORT:%p] found in mst state %p\n",
+			port, &topology_state->base);
 		return -EINVAL;
 	}
 
-	DRM_DEBUG_ATOMIC("[MST PORT:%p] VCPI %d -> 0\n", port, pos->vcpi);
+	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] VCPI %d -> 0\n", port, pos->vcpi);
 	if (pos->vcpi) {
 		drm_dp_mst_put_port_malloc(port);
 		pos->vcpi = 0;
@@ -4505,8 +4509,9 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 		return false;
 
 	if (port->vcpi.vcpi > 0) {
-		DRM_DEBUG_KMS("payload: vcpi %d already allocated for pbn %d - requested pbn %d\n",
-			      port->vcpi.vcpi, port->vcpi.pbn, pbn);
+		drm_dbg_kms(mgr->dev,
+			    "payload: vcpi %d already allocated for pbn %d - requested pbn %d\n",
+			    port->vcpi.vcpi, port->vcpi.pbn, pbn);
 		if (pbn == port->vcpi.pbn) {
 			drm_dp_mst_topology_put_port(port);
 			return true;
@@ -4515,13 +4520,12 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		DRM_DEBUG_KMS("failed to init vcpi slots=%d max=63 ret=%d\n",
-			      DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
+			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
 	}
-	DRM_DEBUG_KMS("initing vcpi for pbn=%d slots=%d\n",
-		      pbn, port->vcpi.num_slots);
+	drm_dbg_kms(mgr->dev, "initing vcpi for pbn=%d slots=%d\n", pbn, port->vcpi.num_slots);
 
 	/* Keep port allocated until its payload has been removed */
 	drm_dp_mst_get_port_malloc(port);
@@ -4603,14 +4607,14 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_dpcd_write(mgr->aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
 	if (ret != 3) {
-		DRM_DEBUG_KMS("failed to write payload allocation %d\n", ret);
+		drm_dbg_kms(mgr->dev, "failed to write payload allocation %d\n", ret);
 		goto fail;
 	}
 
 retry:
 	ret = drm_dp_dpcd_readb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("failed to read payload table status %d\n", ret);
+		drm_dbg_kms(mgr->dev, "failed to read payload table status %d\n", ret);
 		goto fail;
 	}
 
@@ -4620,7 +4624,8 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 			usleep_range(10000, 20000);
 			goto retry;
 		}
-		DRM_DEBUG_KMS("status not set after read payload table status %d\n", status);
+		drm_dbg_kms(mgr->dev, "status not set after read payload table status %d\n",
+			    status);
 		ret = -EINVAL;
 		goto fail;
 	}
@@ -4667,16 +4672,15 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
 				 200, timeout_ms * USEC_PER_MSEC);
 	if (ret < 0 && status >= 0) {
-		DRM_ERROR("Failed to get ACT after %dms, last status: %02x\n",
-			  timeout_ms, status);
+		drm_err(mgr->dev, "Failed to get ACT after %dms, last status: %02x\n",
+			timeout_ms, status);
 		return -EINVAL;
 	} else if (status < 0) {
 		/*
 		 * Failure here isn't unexpected - the hub may have
 		 * just been unplugged
 		 */
-		DRM_DEBUG_KMS("Failed to read payload table status: %d\n",
-			      status);
+		drm_dbg_kms(mgr->dev, "Failed to read payload table status: %d\n", status);
 		return status;
 	}
 
@@ -5079,12 +5083,10 @@ drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 		return 0;
 
 	if (mstb->port_parent)
-		DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] Checking bandwidth limits on [MSTB:%p]\n",
-				 mstb->port_parent->parent, mstb->port_parent,
-				 mstb);
+		drm_dbg_atomic(mstb->mgr->dev, "[MSTB:%p] [MST PORT:%p] Checking bandwidth limits on [MSTB:%p]\n",
+			       mstb->port_parent->parent, mstb->port_parent, mstb);
 	else
-		DRM_DEBUG_ATOMIC("[MSTB:%p] Checking bandwidth limits\n",
-				 mstb);
+		drm_dbg_atomic(mstb->mgr->dev, "[MSTB:%p] Checking bandwidth limits\n", mstb);
 
 	list_for_each_entry(port, &mstb->ports, next) {
 		ret = drm_dp_mst_atomic_check_port_bw_limit(port, state);
@@ -5142,14 +5144,14 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 	}
 
 	if (pbn_used > port->full_pbn) {
-		DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] required PBN of %d exceeds port limit of %d\n",
-				 port->parent, port, pbn_used,
-				 port->full_pbn);
+		drm_dbg_atomic(port->mgr->dev,
+			       "[MSTB:%p] [MST PORT:%p] required PBN of %d exceeds port limit of %d\n",
+			       port->parent, port, pbn_used, port->full_pbn);
 		return -ENOSPC;
 	}
 
-	DRM_DEBUG_ATOMIC("[MSTB:%p] [MST PORT:%p] uses %d out of %d PBN\n",
-			 port->parent, port, pbn_used, port->full_pbn);
+	drm_dbg_atomic(port->mgr->dev, "[MSTB:%p] [MST PORT:%p] uses %d out of %d PBN\n",
+		       port->parent, port, pbn_used, port->full_pbn);
 
 	return pbn_used;
 }
@@ -5164,31 +5166,31 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
 		if (!vcpi->vcpi) {
-			DRM_DEBUG_ATOMIC("[MST PORT:%p] releases all VCPI slots\n",
-					 vcpi->port);
+			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] releases all VCPI slots\n",
+				       vcpi->port);
 			continue;
 		}
 
-		DRM_DEBUG_ATOMIC("[MST PORT:%p] requires %d vcpi slots\n",
-				 vcpi->port, vcpi->vcpi);
+		drm_dbg_atomic(mgr->dev, "[MST PORT:%p] requires %d vcpi slots\n",
+			       vcpi->port, vcpi->vcpi);
 
 		avail_slots -= vcpi->vcpi;
 		if (avail_slots < 0) {
-			DRM_DEBUG_ATOMIC("[MST PORT:%p] not enough VCPI slots in mst state %p (avail=%d)\n",
-					 vcpi->port, mst_state,
-					 avail_slots + vcpi->vcpi);
+			drm_dbg_atomic(mgr->dev,
+				       "[MST PORT:%p] not enough VCPI slots in mst state %p (avail=%d)\n",
+				       vcpi->port, mst_state, avail_slots + vcpi->vcpi);
 			return -ENOSPC;
 		}
 
 		if (++payload_count > mgr->max_payloads) {
-			DRM_DEBUG_ATOMIC("[MST MGR:%p] state %p has too many payloads (max=%d)\n",
-					 mgr, mst_state, mgr->max_payloads);
+			drm_dbg_atomic(mgr->dev,
+				       "[MST MGR:%p] state %p has too many payloads (max=%d)\n",
+				       mgr, mst_state, mgr->max_payloads);
 			return -EINVAL;
 		}
 	}
-	DRM_DEBUG_ATOMIC("[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-			 mgr, mst_state, avail_slots,
-			 63 - avail_slots);
+	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
+		       mgr, mst_state, avail_slots, 63 - avail_slots);
 
 	return 0;
 }
@@ -5245,8 +5247,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
 
-		DRM_DEBUG_ATOMIC("[MST MGR:%p] Setting mode_changed flag on CRTC %p\n",
-				 mgr, crtc);
+		drm_dbg_atomic(mgr->dev, "[MST MGR:%p] Setting mode_changed flag on CRTC %p\n",
+			       mgr, crtc);
 
 		crtc_state->mode_changed = true;
 	}
@@ -5291,21 +5293,24 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 	}
 
 	if (!found) {
-		DRM_DEBUG_ATOMIC("[MST PORT:%p] Couldn't find VCPI allocation in mst state %p\n",
-				 port, mst_state);
+		drm_dbg_atomic(state->dev,
+			       "[MST PORT:%p] Couldn't find VCPI allocation in mst state %p\n",
+			       port, mst_state);
 		return -EINVAL;
 	}
 
 	if (pos->dsc_enabled == enable) {
-		DRM_DEBUG_ATOMIC("[MST PORT:%p] DSC flag is already set to %d, returning %d VCPI slots\n",
-				 port, enable, pos->vcpi);
+		drm_dbg_atomic(state->dev,
+			       "[MST PORT:%p] DSC flag is already set to %d, returning %d VCPI slots\n",
+			       port, enable, pos->vcpi);
 		vcpi = pos->vcpi;
 	}
 
 	if (enable) {
 		vcpi = drm_dp_atomic_find_vcpi_slots(state, port->mgr, port, pbn, pbn_div);
-		DRM_DEBUG_ATOMIC("[MST PORT:%p] Enabling DSC flag, reallocating %d VCPI slots on the port\n",
-				 port, vcpi);
+		drm_dbg_atomic(state->dev,
+			       "[MST PORT:%p] Enabling DSC flag, reallocating %d VCPI slots on the port\n",
+			       port, vcpi);
 		if (vcpi < 0)
 			return -EINVAL;
 	}
@@ -5652,7 +5657,7 @@ static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter,
 	} else if (remote_i2c_write_ok(msgs, num)) {
 		ret = drm_dp_mst_i2c_write(mstb, port, msgs, num);
 	} else {
-		DRM_DEBUG_KMS("Unsupported I2C transaction for MST device\n");
+		drm_dbg_kms(mgr->dev, "Unsupported I2C transaction for MST device\n");
 		ret = -EIO;
 	}
 
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
