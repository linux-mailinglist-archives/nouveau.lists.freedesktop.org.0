Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527EC3200BB
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 22:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9826EC6B;
	Fri, 19 Feb 2021 21:55:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30336EC62
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 21:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jq+w4MFM+0QozA89jfy3oxMfMQxsJ6LpFMVzurL6whE=;
 b=X8xtfUt1HCen/2SARbLW14Gs7TarAB9v8/zg1ctIbOoTp2w0Uje9IXnoprcsKUowMjQt3K
 Q3SrUQU6yMdBt9Sf4fkxOeYQsdn50dWJvYpgiH748jdvg5WsjL2jZNG3/XKNgHg5M9KKr5
 DYT1uhPSOe2lOwcp0etO78QlnbEjJoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-9n8zAtl6OACJCfCCSY6BgA-1; Fri, 19 Feb 2021 16:55:14 -0500
X-MC-Unique: 9n8zAtl6OACJCfCCSY6BgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A136EC1A0;
 Fri, 19 Feb 2021 21:55:11 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6DEC6A03C;
 Fri, 19 Feb 2021 21:55:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 19 Feb 2021 16:53:15 -0500
Message-Id: <20210219215326.2227596-20-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH 19/30] drm/dp: Pass drm_dp_aux to
 drm_dp_link_train_clock_recovery_delay()
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
 Oleg Vasilev <oleg.vasilev@intel.com>, Tanmay Shah <tanmay@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Michal Simek <michal.simek@xilinx.com>, Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, open list <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

So that we can start using drm_dbg_*() in
drm_dp_link_train_clock_recovery_delay().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c              | 2 +-
 drivers/gpu/drm/drm_dp_helper.c                       | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                      | 2 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                    | 2 +-
 drivers/gpu/drm/radeon/atombios_dp.c                  | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      | 2 +-
 include/drm/drm_dp_helper.h                           | 4 +++-
 8 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 6d35da65e09f..4468f9d6b4dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -611,7 +611,7 @@ amdgpu_atombios_dp_link_train_cr(struct amdgpu_atombios_dp_link_train_info *dp_i
 	dp_info->tries = 0;
 	voltage = 0xff;
 	while (1) {
-		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
+		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
 						 dp_info->link_status) <= 0) {
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 194e0c273809..ce08eb3bface 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -132,7 +132,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
 
-void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
+					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
 					 DP_TRAINING_AUX_RD_MASK;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 892d7db7d94f..222073d46bdb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -441,7 +441,7 @@ static void intel_dp_link_training_clock_recovery_delay(struct intel_dp *intel_d
 							enum drm_dp_phy dp_phy)
 {
 	if (dp_phy == DP_PHY_DPRX)
-		drm_dp_link_train_clock_recovery_delay(intel_dp->dpcd);
+		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
 	else
 		drm_dp_lttpr_link_train_clock_recovery_delay();
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 36b39c381b3f..2501a6b326a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1103,7 +1103,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 	tries = 0;
 	old_v_level = ctrl->link->phy_params.v_level;
 	for (tries = 0; tries < maximum_retries; tries++) {
-		drm_dp_link_train_clock_recovery_delay(ctrl->panel->dpcd);
+		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
 
 		ret = dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 57af3d8b6699..6501598448b4 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -608,7 +608,7 @@ static int edp_start_link_train_1(struct edp_ctrl *ctrl)
 	tries = 0;
 	old_v_level = ctrl->v_level;
 	while (1) {
-		drm_dp_link_train_clock_recovery_delay(ctrl->dpcd);
+		drm_dp_link_train_clock_recovery_delay(ctrl->drm_aux, ctrl->dpcd);
 
 		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
 		if (rlen < DP_LINK_STATUS_SIZE) {
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index c50c504bad50..299b9d8da376 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -680,7 +680,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
 	dp_info->tries = 0;
 	voltage = 0xff;
 	while (1) {
-		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
+		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
 						 dp_info->link_status) <= 0) {
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 8272eee03adc..5cc295d8ba9f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -713,7 +713,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
 		if (ret)
 			return ret;
 
-		drm_dp_link_train_clock_recovery_delay(dp->dpcd);
+		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 		if (ret < 0)
 			return ret;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 45ec74862212..e4681665231e 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -29,6 +29,7 @@
 #include <drm/drm_connector.h>
 
 struct drm_device;
+struct drm_dp_aux;
 
 /*
  * Unless otherwise noted, all values are from the DP 1.1a spec.  Note that
@@ -1475,7 +1476,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 #define DP_LTTPR_COMMON_CAP_SIZE	8
 #define DP_LTTPR_PHY_CAP_SIZE		3
 
-void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
+					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 void drm_dp_lttpr_link_train_clock_recovery_delay(void);
 void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
