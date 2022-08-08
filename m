Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3A58D0C8
	for <lists+nouveau@lfdr.de>; Tue,  9 Aug 2022 01:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B197C12B9BF;
	Mon,  8 Aug 2022 23:55:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898D12B3B3
 for <nouveau@lists.freedesktop.org>; Mon,  8 Aug 2022 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arx/gNMaBWSMzIFnbDvjSVEfRTMKGfLtAKbqa9ATj4s=;
 b=HusVwXay1rnnH0xywt28zbj/6KXODwfT9omGNJS+ZW+wYAtmanlcLeX7kYYQAE//Wv+Wya
 BrdUe1mTY/FL+rixg5yMI+AEsmyji+Zoc6v9o8eKkdVajxTS6F6507apW0vvYAQBnfpUfp
 heceSV9fVwZ/0kas79DMuSViKxWftiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-YoePtqdhNU-HVCsUWM1OVA-1; Mon, 08 Aug 2022 19:54:48 -0400
X-MC-Unique: YoePtqdhNU-HVCsUWM1OVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E908318A6523;
 Mon,  8 Aug 2022 23:54:46 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B14AFC15BA1;
 Mon,  8 Aug 2022 23:54:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Mon,  8 Aug 2022 19:51:54 -0400
Message-Id: <20220808235203.123892-10-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Nouveau] [RFC v2 09/18] drm/display/dp_mst: Don't open code
 modeset checks for releasing time slots
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
Cc: David Airlie <airlied@linux.ie>, Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Hangyu Hua <hbh25y@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Luo Jiaxing <luojiaxing@huawei.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, hersen wu <hersenxs.wu@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 He Ying <heying24@huawei.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I'm not sure why, but at the time I originally wrote the find/release time
slot helpers I thought we should avoid keeping modeset tracking out of the
MST helpers. In retrospect though there's no actual good reason to do
this, and the logic has ended up being identical across all the drivers
using the helpers. Also, it needs to be fixed anyway so we don't break
things when going atomic-only with MST.

So, let's just move this code into drm_dp_atomic_release_time_slots() and
stop open coding it.

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
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 29 +++----------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 21 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 24 +--------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 21 --------------
 4 files changed, 23 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 655d63b20b33..7a0d6cfa77f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -447,34 +447,13 @@ dm_dp_mst_detect(struct drm_connector *connector,
 }
 
 static int dm_dp_mst_atomic_check(struct drm_connector *connector,
-				struct drm_atomic_state *state)
+				  struct drm_atomic_state *state)
 {
-	struct drm_connector_state *new_conn_state =
-			drm_atomic_get_new_connector_state(state, connector);
-	struct drm_connector_state *old_conn_state =
-			drm_atomic_get_old_connector_state(state, connector);
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct drm_crtc_state *new_crtc_state;
-	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_port *mst_port;
+	struct drm_dp_mst_topology_mgr *mst_mgr = &aconnector->mst_port->mst_mgr;
+	struct drm_dp_mst_port *mst_port = aconnector->port;
 
-	mst_port = aconnector->port;
-	mst_mgr = &aconnector->mst_port->mst_mgr;
-
-	if (!old_conn_state->crtc)
-		return 0;
-
-	if (new_conn_state->crtc) {
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
-		if (!new_crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(new_crtc_state) ||
-		    new_crtc_state->enable)
-			return 0;
-		}
-
-	return drm_dp_atomic_release_time_slots(state,
-						mst_mgr,
-						mst_port);
+	return drm_dp_atomic_release_time_slots(state, mst_mgr, mst_port);
 }
 
 static const struct drm_connector_helper_funcs dm_dp_mst_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index d701e5b819b8..aa6dcd9ff6a5 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4473,14 +4473,29 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_mst_atomic_payload *payload;
-	struct drm_connector_state *conn_state;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
+	if (!old_conn_state->crtc)
+		return 0;
+
+	/* If the CRTC isn't disabled by this state, don't release it's payload */
+	new_conn_state = drm_atomic_get_new_connector_state(state, port->connector);
+	if (new_conn_state->crtc) {
+		struct drm_crtc_state *crtc_state =
+			drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+
+		if (!crtc_state ||
+		    !drm_atomic_crtc_needs_modeset(crtc_state) ||
+		    crtc_state->enable)
+			return 0;
+	}
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
-	conn_state = drm_atomic_get_old_connector_state(state, port->connector);
-	topology_state->pending_crtc_mask |= drm_crtc_mask(conn_state->crtc);
+	topology_state->pending_crtc_mask |= drm_crtc_mask(old_conn_state->crtc);
 
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (WARN_ON(!payload)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1cebbc51d8fa..1b067cd73261 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -308,13 +308,10 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 			  struct drm_atomic_state *_state)
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
-	struct drm_connector_state *new_conn_state =
-		drm_atomic_get_new_connector_state(&state->base, connector);
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(&state->base, connector);
 	struct intel_connector *intel_connector =
 		to_intel_connector(connector);
-	struct drm_crtc *new_crtc = new_conn_state->crtc;
 	struct drm_dp_mst_topology_mgr *mgr;
 	int ret;
 
@@ -326,27 +323,8 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	if (!old_conn_state->crtc)
-		return 0;
-
-	/* We only want to free VCPI if this state disables the CRTC on this
-	 * connector
-	 */
-	if (new_crtc) {
-		struct intel_crtc *crtc = to_intel_crtc(new_crtc);
-		struct intel_crtc_state *crtc_state =
-			intel_atomic_get_new_crtc_state(state, crtc);
-
-		if (!crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(&crtc_state->uapi) ||
-		    crtc_state->uapi.enable)
-			return 0;
-	}
-
 	mgr = &enc_to_mst(to_intel_encoder(old_conn_state->best_encoder))->primary->dp.mst_mgr;
-	ret = drm_dp_atomic_release_time_slots(&state->base, mgr, intel_connector->port);
-
-	return ret;
+	return drm_dp_atomic_release_time_slots(&state->base, mgr, intel_connector->port);
 }
 
 static void clear_act_sent(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c55af5d78ea2..5669c8d747d7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1255,27 +1255,6 @@ nv50_mstc_atomic_check(struct drm_connector *connector,
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct drm_dp_mst_topology_mgr *mgr = &mstc->mstm->mgr;
-	struct drm_connector_state *new_conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_connector_state *old_conn_state =
-		drm_atomic_get_old_connector_state(state, connector);
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *new_crtc = new_conn_state->crtc;
-
-	if (!old_conn_state->crtc)
-		return 0;
-
-	/* We only want to free VCPI if this state disables the CRTC on this
-	 * connector
-	 */
-	if (new_crtc) {
-		crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
-
-		if (!crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(crtc_state) ||
-		    crtc_state->enable)
-			return 0;
-	}
 
 	return drm_dp_atomic_release_time_slots(state, mgr, mstc->port);
 }
-- 
2.37.1

