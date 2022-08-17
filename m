Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50E5976A9
	for <lists+nouveau@lfdr.de>; Wed, 17 Aug 2022 21:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB125A52C3;
	Wed, 17 Aug 2022 19:39:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3D5A521E
 for <nouveau@lists.freedesktop.org>; Wed, 17 Aug 2022 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYOgf+nym4/Pj7sSYUYK9NZR7cCZXRMoFwQ8QFqYGQA=;
 b=g4YXhv3+eI0uhq/4AGFiDT1kStGWoShaDlprvD7peZbaFZ4ehtH3rtpPgQiQQ1YFBfonC4
 RcgUNJqjI1NVXprTbS620xdjMY+yQzNPTRz2x8UZbWokEvhOnSDj/7RoQpSkLHzMvho9uQ
 3ai7tn0f3WGGG2La9MSFZ36bQ7eMPTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-SqZpRkzgOkuRNHX8tsPDzg-1; Wed, 17 Aug 2022 15:39:14 -0400
X-MC-Unique: SqZpRkzgOkuRNHX8tsPDzg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14797811E84;
 Wed, 17 Aug 2022 19:39:13 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE2A6492CA4;
 Wed, 17 Aug 2022 19:39:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Wed, 17 Aug 2022 15:38:30 -0400
Message-Id: <20220817193847.557945-2-lyude@redhat.com>
In-Reply-To: <20220817193847.557945-1-lyude@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Nouveau] [RFC v4 01/17] drm/amdgpu/dc/mst: Rename
 dp_mst_stream_allocation(_table)
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Wenjing Liu <wenjing.liu@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Alex Hung <alex.hung@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 "Shen, George" <George.Shen@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, jinzh <jinzh@github.amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Just to make this more clear to outside contributors that these are
DC-specific structs, as this also threw me into a loop a number of times
before I figured out the purpose of this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c         | 10 +++++-----
 drivers/gpu/drm/amd/display/dc/dm_helpers.h           |  4 ++--
 .../gpu/drm/amd/display/include/link_service_types.h  | 11 ++++++++---
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index a0154a5f7183..3aa385860eea 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -153,9 +153,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	return result;
 }
 
-static void get_payload_table(
-		struct amdgpu_dm_connector *aconnector,
-		struct dp_mst_stream_allocation_table *proposed_table)
+static void get_payload_table(struct amdgpu_dm_connector *aconnector,
+			      struct dc_dp_mst_stream_allocation_table *proposed_table)
 {
 	int i;
 	struct drm_dp_mst_topology_mgr *mst_mgr =
@@ -177,7 +176,7 @@ static void get_payload_table(
 			mst_mgr->payloads[i].payload_state ==
 					DP_PAYLOAD_REMOTE) {
 
-			struct dp_mst_stream_allocation *sa =
+			struct dc_dp_mst_stream_allocation *sa =
 					&proposed_table->stream_allocations[
 						proposed_table->stream_count];
 
@@ -201,7 +200,7 @@ void dm_helpers_dp_update_branch_info(
 bool dm_helpers_dp_mst_write_payload_allocation_table(
 		struct dc_context *ctx,
 		const struct dc_stream_state *stream,
-		struct dp_mst_stream_allocation_table *proposed_table,
+		struct dc_dp_mst_stream_allocation_table *proposed_table,
 		bool enable)
 {
 	struct amdgpu_dm_connector *aconnector;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 9e51338441d0..e01424fb02ba 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3516,7 +3516,7 @@ static void update_mst_stream_alloc_table(
 	struct dc_link *link,
 	struct stream_encoder *stream_enc,
 	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
-	const struct dp_mst_stream_allocation_table *proposed_table)
+	const struct dc_dp_mst_stream_allocation_table *proposed_table)
 {
 	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
 	struct link_mst_stream_allocation *dc_alloc;
@@ -3679,7 +3679,7 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
@@ -3784,7 +3784,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
@@ -3873,7 +3873,7 @@ enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
 	struct fixed31_32 pbn_per_slot;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
 	enum act_return_status ret;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
@@ -3957,7 +3957,7 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
-	struct dp_mst_stream_allocation_table proposed_table = {0};
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	int i;
 	bool mst_mode = (link->type == dc_connection_mst_branch);
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index fb6a2d7b6470..8173f4b80424 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -33,7 +33,7 @@
 #include "dc_types.h"
 #include "dc.h"
 
-struct dp_mst_stream_allocation_table;
+struct dc_dp_mst_stream_allocation_table;
 struct aux_payload;
 enum aux_return_code_type;
 
@@ -77,7 +77,7 @@ void dm_helpers_dp_update_branch_info(
 bool dm_helpers_dp_mst_write_payload_allocation_table(
 		struct dc_context *ctx,
 		const struct dc_stream_state *stream,
-		struct dp_mst_stream_allocation_table *proposed_table,
+		struct dc_dp_mst_stream_allocation_table *proposed_table,
 		bool enable);
 
 /*
diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
index 79fabc51c991..f75ed6f8fcb8 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -246,8 +246,13 @@ union dpcd_training_lane_set {
 };
 
 
+/* AMD's copy of various payload data for MST. We have two copies of the payload table (one in DRM,
+ * one in DC) since DRM's MST helpers can't be accessed here. This stream allocation table should
+ * _ONLY_ be filled out from DM and then passed to DC, do NOT use these for _any_ kind of atomic
+ * state calculations in DM, or you will break something.
+ */
 /* DP MST stream allocation (payload bandwidth number) */
-struct dp_mst_stream_allocation {
+struct dc_dp_mst_stream_allocation {
 	uint8_t vcp_id;
 	/* number of slots required for the DP stream in
 	 * transport packet */
@@ -255,11 +260,11 @@ struct dp_mst_stream_allocation {
 };
 
 /* DP MST stream allocation table */
-struct dp_mst_stream_allocation_table {
+struct dc_dp_mst_stream_allocation_table {
 	/* number of DP video streams */
 	int stream_count;
 	/* array of stream allocations */
-	struct dp_mst_stream_allocation stream_allocations[MAX_CONTROLLER_NUM];
+	struct dc_dp_mst_stream_allocation stream_allocations[MAX_CONTROLLER_NUM];
 };
 
 #endif /*__DAL_LINK_SERVICE_TYPES_H__*/
-- 
2.37.1

