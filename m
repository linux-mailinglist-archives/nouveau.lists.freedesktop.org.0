Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99633200D7
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 22:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65906EC84;
	Fri, 19 Feb 2021 21:55:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8FB6EC87
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdCEVrNr625LnXV09WjZH3+wo1iYGAOq1QCVeyfX8Y8=;
 b=h24hIXMIV/9o1nlSNJXI1vbXlODSOclywUEwTVmFybqAD+J5yygDaQ4EBWzJ5c1XKcDXXr
 7P7UyvjwxLc/wwRHbPeyu4ZKywNSigTK+iulO+PTKQVQUOPa4YZQd+/2E4osQcGpjB+fw3
 2gsTpT2iH1fDmSWRASjuuuu3Z+wXXxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ZaV8NOMDOEygj2Enk7mGAg-1; Fri, 19 Feb 2021 16:55:43 -0500
X-MC-Unique: ZaV8NOMDOEygj2Enk7mGAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B48080196E;
 Fri, 19 Feb 2021 21:55:41 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D996A03C;
 Fri, 19 Feb 2021 21:55:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 19 Feb 2021 16:53:21 -0500
Message-Id: <20210219215326.2227596-26-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH 25/30] drm/dp_dual_mode: Pass drm_device to
 drm_dp_dual_mode_get_tmds_output()
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

Another function to pass drm_device * down to so we can start using the
drm_dbg_*() in the DRM DP helpers.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_dual_mode_helper.c | 5 +++--
 include/drm/drm_dp_dual_mode_helper.h     | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index 4a26b3e1f78f..c9c2952bcad2 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_max_tmds_clock);
 
 /**
  * drm_dp_dual_mode_get_tmds_output - Get the state of the TMDS output buffers in the DP dual mode adaptor
+ * @dev: &drm_device to use
  * @type: DP dual mode adaptor type
  * @adapter: I2C adapter for the DDC bus
  * @enabled: current state of the TMDS output buffers
@@ -310,8 +311,8 @@ EXPORT_SYMBOL(drm_dp_dual_mode_max_tmds_clock);
  * Returns:
  * 0 on success, negative error code on failure
  */
-int drm_dp_dual_mode_get_tmds_output(enum drm_dp_dual_mode_type type,
-				     struct i2c_adapter *adapter,
+int drm_dp_dual_mode_get_tmds_output(const struct drm_device *dev,
+				     enum drm_dp_dual_mode_type type, struct i2c_adapter *adapter,
 				     bool *enabled)
 {
 	uint8_t tmds_oen;
diff --git a/include/drm/drm_dp_dual_mode_helper.h b/include/drm/drm_dp_dual_mode_helper.h
index aabf9c951380..01eec9ff5962 100644
--- a/include/drm/drm_dp_dual_mode_helper.h
+++ b/include/drm/drm_dp_dual_mode_helper.h
@@ -108,7 +108,7 @@ enum drm_dp_dual_mode_type
 drm_dp_dual_mode_detect(const struct drm_device *dev, struct i2c_adapter *adapter);
 int drm_dp_dual_mode_max_tmds_clock(const struct drm_device *dev, enum drm_dp_dual_mode_type type,
 				    struct i2c_adapter *adapter);
-int drm_dp_dual_mode_get_tmds_output(enum drm_dp_dual_mode_type type,
+int drm_dp_dual_mode_get_tmds_output(const struct drm_device *dev, enum drm_dp_dual_mode_type type,
 				     struct i2c_adapter *adapter, bool *enabled);
 int drm_dp_dual_mode_set_tmds_output(const struct drm_device *dev, enum drm_dp_dual_mode_type type,
 				     struct i2c_adapter *adapter, bool enable);
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
