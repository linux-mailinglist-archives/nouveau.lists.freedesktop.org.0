Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A6541133
	for <lists+nouveau@lfdr.de>; Tue,  7 Jun 2022 21:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366B10E891;
	Tue,  7 Jun 2022 19:34:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A6010E891
 for <nouveau@lists.freedesktop.org>; Tue,  7 Jun 2022 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654630477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzPfLQqqrOOrtPSbwWM44VdH1zcU6PIWuEvhTsmS8xA=;
 b=MvZ9jWAfU1hRRqbkTLILoQfQhqrUhSZjNOOKILXrYIGm9MyngjIcQLLIfvY9p7dsX7xElT
 /S6Kmz3EeisSHaovFxxdU2NO6GbIs2h3pdOIXj6MeiLUw3MVHoSglpNAbfid/iXG/X2bjr
 6kTY4hlv4zkwkKsd356XAVep+weetzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-XXJsXSB2OnO9ZoOoodX3nQ-1; Tue, 07 Jun 2022 15:34:33 -0400
X-MC-Unique: XXJsXSB2OnO9ZoOoodX3nQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD7DD18019F9;
 Tue,  7 Jun 2022 19:33:02 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0301D2BB9C88;
 Tue,  7 Jun 2022 19:32:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  7 Jun 2022 15:29:21 -0400
Message-Id: <20220607192933.1333228-7-lyude@redhat.com>
In-Reply-To: <20220607192933.1333228-1-lyude@redhat.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Nouveau] [RESEND RFC 06/18] drm/display/dp_mst: Add some missing
 kdocs for atomic MST structs
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

Since we're about to start adding some stuff here, we may as well fill in
any missing documentation that we forgot to write.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 include/drm/display/drm_dp_mst_helper.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 8ab4f14f2344..eb0ea578b227 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -542,19 +542,43 @@ struct drm_dp_payload {
 
 #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
 
+/**
+ * struct drm_dp_mst_atomic_payload - Atomic state struct for an MST payload
+ *
+ * The primary atomic state structure for a given MST payload. Stores information like current
+ * bandwidth allocation, intended action for this payload, etc.
+ */
 struct drm_dp_mst_atomic_payload {
+	/** @port: The MST port assigned to this payload */
 	struct drm_dp_mst_port *port;
+	/** @time_slots: The number of timeslots allocated to this payload */
 	int time_slots;
+	/** @pbn: The payload bandwidth for this payload */
 	int pbn;
+	/** @dsc_enabled: Whether or not this payload has DSC enabled */
 	bool dsc_enabled;
+
+	/** @next: The list node for this payload */
 	struct list_head next;
 };
 
+/**
+ * struct drm_dp_mst_topology_state - DisplayPort MST topology atomic state
+ *
+ * This struct represents the atomic state of the toplevel DisplayPort MST manager
+ */
 struct drm_dp_mst_topology_state {
+	/** @base: Base private state for atomic */
 	struct drm_private_state base;
+
+	/** @payloads: The list of payloads being created/destroyed in this state */
 	struct list_head payloads;
+	/** @mgr: The topology manager */
 	struct drm_dp_mst_topology_mgr *mgr;
+
+	/** @total_avail_slots: The total number of slots this topology can handle (63 or 64) */
 	u8 total_avail_slots;
+	/** @start_slot: The first usable time slot in this topology (1 or 0) */
 	u8 start_slot;
 };
 
-- 
2.35.3

