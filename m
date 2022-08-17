Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A85976F7
	for <lists+nouveau@lfdr.de>; Wed, 17 Aug 2022 21:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F37A53C2;
	Wed, 17 Aug 2022 19:41:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B360A5339
 for <nouveau@lists.freedesktop.org>; Wed, 17 Aug 2022 19:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRkEWxEO8DrSLjzrrLiKcOrYhMxWHkW7Qi7UVUSsLqo=;
 b=BlfN3+Edhrp+zfbX6B1c22/SbLjU0RRkiEkdB4nBZqbA2dmG54DX3fWMyz5yZd++34IunZ
 D0HiAsJPdXhp19/tu8Oz5ETlTvvpiN7k657CWr0NRQeOOX6iZkjRlxbAUtx0VsF2UZCelv
 Nm6GoOIRZWtci8NQIF8/VL3bddupv7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-WeTt46ojOsa886CMCTJ_Bg-1; Wed, 17 Aug 2022 15:40:48 -0400
X-MC-Unique: WeTt46ojOsa886CMCTJ_Bg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7C2185A7BA;
 Wed, 17 Aug 2022 19:40:47 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1DE492C3B;
 Wed, 17 Aug 2022 19:40:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Wed, 17 Aug 2022 15:38:44 -0400
Message-Id: <20220817193847.557945-16-lyude@redhat.com>
In-Reply-To: <20220817193847.557945-1-lyude@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Nouveau] [RFC v4 15/17] drm/display/dp_mst: Maintain time slot
 allocations when deleting payloads
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
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Currently, we set drm_dp_atomic_payload->time_slots to 0 in order to
indicate that we're about to delete a payload in the current atomic state.
Since we're going to be dropping all of the legacy code for handling the
payload table however, we need to be able to ensure that we still keep
track of the current time slot allocations for each payload so we can reuse
this info when asking the root MST hub to delete payloads. We'll also be
using it to recalculate the start slots of each VC.

So, let's keep track of the intent of a payload in drm_dp_atomic_payload by
adding ->delete, which we set whenever we're planning on deleting a payload
during the current atomic commit.

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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 14 +++++++-------
 include/drm/display/drm_dp_mst_helper.h       |  5 ++++-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a5460cadf2c8..c4073d733c59 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4407,7 +4407,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 		 * releasing and allocating the same timeslot allocation,
 		 * which is an error
 		 */
-		if (WARN_ON(!prev_slots)) {
+		if (drm_WARN_ON(mgr->dev, payload->delete)) {
 			drm_err(mgr->dev,
 				"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
 				port);
@@ -4512,10 +4512,10 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	}
 
 	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
-	if (payload->time_slots) {
+	if (!payload->delete) {
 		drm_dp_mst_put_port_malloc(port);
-		payload->time_slots = 0;
 		payload->pbn = 0;
+		payload->delete = true;
 	}
 
 	return 0;
@@ -5239,7 +5239,7 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *obj)
 
 	list_for_each_entry(pos, &old_state->payloads, next) {
 		/* Prune leftover freed timeslot allocations */
-		if (!pos->time_slots)
+		if (pos->delete)
 			continue;
 
 		payload = kmemdup(pos, sizeof(*payload), GFP_KERNEL);
@@ -5271,8 +5271,8 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 	int i;
 
 	list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
-		/* We only keep references to ports with non-zero VCPIs */
-		if (pos->time_slots)
+		/* We only keep references to ports with active payloads */
+		if (!pos->delete)
 			drm_dp_mst_put_port_malloc(pos->port);
 		kfree(pos);
 	}
@@ -5400,7 +5400,7 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
 
 	list_for_each_entry(payload, &mst_state->payloads, next) {
 		/* Releasing payloads is always OK-even if the port is gone */
-		if (!payload->time_slots) {
+		if (payload->delete) {
 			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] releases all time slots\n",
 				       payload->port);
 			continue;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index b9c361b242ea..8b847836a0b4 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -560,8 +560,11 @@ struct drm_dp_mst_atomic_payload {
 	int time_slots;
 	/** @pbn: The payload bandwidth for this payload */
 	int pbn;
+
+	/** @delete: Whether or not we intend to delete this payload during this atomic commit */
+	bool delete : 1;
 	/** @dsc_enabled: Whether or not this payload has DSC enabled */
-	bool dsc_enabled;
+	bool dsc_enabled : 1;
 
 	/** @next: The list node for this payload */
 	struct list_head next;
-- 
2.37.1

