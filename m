Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F31540FCF
	for <lists+nouveau@lfdr.de>; Tue,  7 Jun 2022 21:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB91C10F641;
	Tue,  7 Jun 2022 19:13:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C975E10F63C
 for <nouveau@lists.freedesktop.org>; Tue,  7 Jun 2022 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654629195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg8yBeGSpujFygwxJkzWzOm3xQkMe4291lxPHo3F32k=;
 b=K7aAuhzOw3eYmZ8SFByV1r/j0NCUhqDY4Fb39fxMDU6/OpVLUfOso6DzrK3qni+nYonbQM
 SaV0N3zH8PYkq2vSKbO0amd3UwcGXeff+oxoySygDdPtCo2igV/l+p0i9A0JintD9lrI8H
 BQJ2fEfdSvvPJw5CQ+ljea00UxVeBR8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-OpJeuyOkPzCxxg239vDSeQ-1; Tue, 07 Jun 2022 15:13:12 -0400
X-MC-Unique: OpJeuyOkPzCxxg239vDSeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A7222999B56;
 Tue,  7 Jun 2022 19:11:46 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91FDE412CA4C;
 Tue,  7 Jun 2022 19:11:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  7 Jun 2022 15:07:04 -0400
Message-Id: <20220607190715.1331124-8-lyude@redhat.com>
In-Reply-To: <20220607190715.1331124-1-lyude@redhat.com>
References: <20220607190715.1331124-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Nouveau] [RFC 07/18] drm/display/dp_mst: Add helper for finding
 payloads in atomic MST state
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

We already open-code this quite often, and will be iterating through
payloads even more once we've moved all of the payload tracking into the
atomic state. So, let's add a helper for doing this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 109 ++++++++----------
 1 file changed, 45 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ec52f91b1f0e..0bc2c7a90c37 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -1737,6 +1737,19 @@ drm_dp_mst_dump_port_topology_history(struct drm_dp_mst_port *port) {}
 #define save_port_topology_ref(port, type)
 #endif
 
+static struct drm_dp_mst_atomic_payload *
+drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
+				 struct drm_dp_mst_port *port)
+{
+	struct drm_dp_mst_atomic_payload *payload;
+
+	list_for_each_entry(payload, &state->payloads, next)
+		if (payload->port == port)
+			return payload;
+
+	return NULL;
+}
+
 static void drm_dp_destroy_mst_branch_device(struct kref *kref)
 {
 	struct drm_dp_mst_branch *mstb =
@@ -4381,39 +4394,31 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 				  int pbn_div)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_mst_atomic_payload *pos, *payload = NULL;
-	int prev_slots, prev_bw, req_slots;
+	struct drm_dp_mst_atomic_payload *payload = NULL;
+	int prev_slots = 0, prev_bw = 0, req_slots;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
 	/* Find the current allocation for this port, if any */
-	list_for_each_entry(pos, &topology_state->payloads, next) {
-		if (pos->port == port) {
-			payload = pos;
-			prev_slots = payload->time_slots;
-			prev_bw = payload->pbn;
-
-			/*
-			 * This should never happen, unless the driver tries
-			 * releasing and allocating the same timeslot allocation,
-			 * which is an error
-			 */
-			if (WARN_ON(!prev_slots)) {
-				drm_err(mgr->dev,
-					"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
-					port);
-				return -EINVAL;
-			}
+	payload = drm_atomic_get_mst_payload_state(topology_state, port);
+	if (payload) {
+		prev_slots = payload->time_slots;
+		prev_bw = payload->pbn;
 
-			break;
+		/*
+		 * This should never happen, unless the driver tries
+		 * releasing and allocating the same timeslot allocation,
+		 * which is an error
+		 */
+		if (WARN_ON(!prev_slots)) {
+			drm_err(mgr->dev,
+				"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
+				port);
+			return -EINVAL;
 		}
 	}
-	if (!payload) {
-		prev_slots = 0;
-		prev_bw = 0;
-	}
 
 	if (pbn_div <= 0)
 		pbn_div = mgr->pbn_div;
@@ -4474,30 +4479,24 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 				     struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_mst_atomic_payload *pos;
-	bool found = false;
+	struct drm_dp_mst_atomic_payload *payload;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
-	list_for_each_entry(pos, &topology_state->payloads, next) {
-		if (pos->port == port) {
-			found = true;
-			break;
-		}
-	}
-	if (WARN_ON(!found)) {
+	payload = drm_atomic_get_mst_payload_state(topology_state, port);
+	if (WARN_ON(!payload)) {
 		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\n",
 			port, &topology_state->base);
 		return -EINVAL;
 	}
 
-	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, pos->time_slots);
-	if (pos->time_slots) {
+	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
+	if (payload->time_slots) {
 		drm_dp_mst_put_port_malloc(port);
-		pos->time_slots = 0;
-		pos->pbn = 0;
+		payload->time_slots = 0;
+		payload->pbn = 0;
 	}
 
 	return 0;
@@ -5194,18 +5193,8 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 		return 0;
 
 	if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
-		bool found = false;
-
-		list_for_each_entry(payload, &state->payloads, next) {
-			if (payload->port != port)
-				continue;
-			if (!payload->pbn)
-				return 0;
-
-			found = true;
-			break;
-		}
-		if (!found)
+		payload = drm_atomic_get_mst_payload_state(state, port);
+		if (!payload)
 			return 0;
 
 		/*
@@ -5360,34 +5349,26 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 				 bool enable)
 {
 	struct drm_dp_mst_topology_state *mst_state;
-	struct drm_dp_mst_atomic_payload *pos;
-	bool found = false;
+	struct drm_dp_mst_atomic_payload *payload;
 	int time_slots = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, port->mgr);
-
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
 
-	list_for_each_entry(pos, &mst_state->payloads, next) {
-		if (pos->port == port) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
+	payload = drm_atomic_get_mst_payload_state(mst_state, port);
+	if (!payload) {
 		drm_dbg_atomic(state->dev,
 			       "[MST PORT:%p] Couldn't find payload in mst state %p\n",
 			       port, mst_state);
 		return -EINVAL;
 	}
 
-	if (pos->dsc_enabled == enable) {
+	if (payload->dsc_enabled == enable) {
 		drm_dbg_atomic(state->dev,
 			       "[MST PORT:%p] DSC flag is already set to %d, returning %d time slots\n",
-			       port, enable, pos->time_slots);
-		time_slots = pos->time_slots;
+			       port, enable, payload->time_slots);
+		time_slots = payload->time_slots;
 	}
 
 	if (enable) {
@@ -5399,7 +5380,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 			return -EINVAL;
 	}
 
-	pos->dsc_enabled = enable;
+	payload->dsc_enabled = enable;
 
 	return time_slots;
 }
-- 
2.35.3

