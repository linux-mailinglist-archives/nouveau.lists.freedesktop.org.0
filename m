Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC531440B
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 00:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED736EA3C;
	Mon,  8 Feb 2021 23:39:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D516EA3A
 for <nouveau@lists.freedesktop.org>; Mon,  8 Feb 2021 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612827566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhBX8GM+m/DtD9FKlAWyWCTWmDeNh7x5vL1LH8zHnJ0=;
 b=aATXOHnXiOWW10v2um2rV7tWlf4se/oQWO8sQPTVK4G1QCfIcV60NLUtvqBGaxmddrcUlh
 vlJKjSWa9TgppUrHg1Vns5U25klmFnH7tPjK2zKDxLsGSXUGLwOx6DicL4REWFE2MLCf64
 slYV9PAXg5QATmso0fXIbLCDpq1EI/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-RPSy_GTIPN2eHqN7tlktyA-1; Mon, 08 Feb 2021 18:39:22 -0500
X-MC-Unique: RPSy_GTIPN2eHqN7tlktyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD90107ACC7;
 Mon,  8 Feb 2021 23:39:20 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-219.rdu2.redhat.com
 [10.10.114.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0996608DB;
 Mon,  8 Feb 2021 23:39:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Mon,  8 Feb 2021 18:38:55 -0500
Message-Id: <20210208233902.1289693-6-lyude@redhat.com>
In-Reply-To: <20210208233902.1289693-1-lyude@redhat.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [RFC v4 05/11] drm/i915/dpcd_bl: Cleanup
 intel_dp_aux_vesa_enable_backlight() a bit
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Get rid of the extraneous switch case in here, and just open code
edp_backlight_mode as we only ever use it once.

v4:
* Check that backlight mode is DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD, not
  DP_EDP_BACKLIGHT_CONTROL_MODE_MASK - imirkin

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c37ccc8538cb..57218faed4a3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -382,7 +382,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_panel *panel = &connector->panel;
-	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
+	u8 dpcd_buf, new_dpcd_buf;
 	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux,
@@ -393,12 +393,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	}
 
 	new_dpcd_buf = dpcd_buf;
-	edp_backlight_mode = dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 
-	switch (edp_backlight_mode) {
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PWM:
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET:
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
+	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
@@ -406,13 +402,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 				       pwmgen_bit_count) != 1)
 			drm_dbg_kms(&i915->drm,
 				    "Failed to write aux pwmgen bit count\n");
-
-		break;
-
-	/* Do nothing when it is already DPCD mode */
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD:
-	default:
-		break;
 	}
 
 	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
