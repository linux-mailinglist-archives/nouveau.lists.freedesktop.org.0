Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94858D0DC
	for <lists+nouveau@lfdr.de>; Tue,  9 Aug 2022 01:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A07ADDA5;
	Mon,  8 Aug 2022 23:55:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509A18A978
 for <nouveau@lists.freedesktop.org>; Mon,  8 Aug 2022 23:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lwx8PaWh6vygwU1UFyt3KfAFGt9fHxhNC+ENd2udmJQ=;
 b=MhEO0vtfQQLdYagnwgC4qxX2+2uMWhC2oYAf6hc7bRnSHR+UvjxjO2dzlBtW44bbPJGPE5
 RH/MQxJNTjXCaABDqjkkhz0ylv2hLWh39AaEZjIx2nreWZSh+WV+Pgljb7XoPDeHHcwxq6
 Mf15jAIxjtXq1mrOkYKkFS2y8g1oZAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-qwG6YdUkPqGXCsLRpEDo_A-1; Mon, 08 Aug 2022 19:55:09 -0400
X-MC-Unique: qwG6YdUkPqGXCsLRpEDo_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD7618A6522;
 Mon,  8 Aug 2022 23:55:08 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E099DC15BA1;
 Mon,  8 Aug 2022 23:55:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Mon,  8 Aug 2022 19:51:59 -0400
Message-Id: <20220808235203.123892-15-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Nouveau] [RFC v2 14/18] drm/display/dp_mst: Drop all ports from
 topology on CSNs before queueing link address work
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
Cc: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We want to start cutting down on all of the places that we use port
validation, so that ports may be removed from the topology as quickly as
possible to minimize the number of errors we run into as a result of being
out of sync with the current topology status. This isn't a very typical
scenario and I don't think I've ever even run into it - but since the next
commit is going to make some changes to payload updates depending on their
hotplug status I think it's a probably good idea to take precautions.

Let's do this with CSNs by moving some code around so that we only queue
link address probing work at the end of handling all CSNs - allowing us to
make sure we drop as many topology references as we can beforehand.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 97e8f8a83ed4..a5460cadf2c8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2509,7 +2509,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 	return ret;
 }
 
-static void
+static int
 drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 			    struct drm_dp_connection_status_notify *conn_stat)
 {
@@ -2522,7 +2522,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 
 	port = drm_dp_get_port(mstb, conn_stat->port_number);
 	if (!port)
-		return;
+		return 0;
 
 	if (port->connector) {
 		if (!port->input && conn_stat->input_port) {
@@ -2575,8 +2575,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 
 out:
 	drm_dp_mst_topology_put_port(port);
-	if (dowork)
-		queue_work(system_long_wq, &mstb->mgr->work);
+	return dowork;
 }
 
 static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
@@ -4060,7 +4059,7 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	struct drm_dp_mst_branch *mstb = NULL;
 	struct drm_dp_sideband_msg_req_body *msg = &up_req->msg;
 	struct drm_dp_sideband_msg_hdr *hdr = &up_req->hdr;
-	bool hotplug = false;
+	bool hotplug = false, dowork = false;
 
 	if (hdr->broadcast) {
 		const u8 *guid = NULL;
@@ -4083,11 +4082,14 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* TODO: Add missing handler for DP_RESOURCE_STATUS_NOTIFY events */
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
-		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
+		dowork = drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
 		hotplug = true;
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
+
+	if (dowork)
+		queue_work(system_long_wq, &mgr->work);
 	return hotplug;
 }
 
-- 
2.37.1

