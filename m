Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93724C5B0
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 20:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6BA6EA14;
	Thu, 20 Aug 2020 18:38:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Thu, 20 Aug 2020 18:36:06 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3436E3D0
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LI7MeCR/d9B3rebts7XCX9cGQMTRQt7Fy4cwAHJQI/A=;
 b=cA7WDf4iOSh+sknyR+dzlguQmXFPzIjGa3Cyy5az6dA6ttovH9axtbXZhePKnWQBAPgJrj
 ijvEBdbdTlTVnewll8cLE97wI+NTzEDnmpPWbS95n1vcR1IE/DzWgq4hziyNUIUSsYF9oP
 Naq5IvlLxRutQrFFTI1EtZ5h4mhUA9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-mEpFT5dYPC-az_43QwxcSg-1; Thu, 20 Aug 2020 14:31:17 -0400
X-MC-Unique: mEpFT5dYPC-az_43QwxcSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B1A801AEE;
 Thu, 20 Aug 2020 18:31:14 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96AD45DA78;
 Thu, 20 Aug 2020 18:31:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Thu, 20 Aug 2020 14:30:08 -0400
Message-Id: <20200820183012.288794-17-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Thu, 20 Aug 2020 18:38:16 +0000
Subject: [Nouveau] [RFC v2 16/20] drm/i915/dp: Extract
 drm_dp_get_sink_count()
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

And of course, we'll also need to read the sink count from other drivers
as well if we're checking whether or not it's supported. So, let's
extract the code for this into another helper.

v2:
* Fix drm_dp_dpcd_readb() ret check
* Add back comment and move back sink_count assignment in intel_dp_get_dpcd()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_helper.c         | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++------
 include/drm/drm_dp_helper.h             |  1 +
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 863e0babc1903..67ad05eb05b7e 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -736,6 +736,28 @@ bool drm_dp_has_sink_count(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_dp_has_sink_count);
 
+/**
+ * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
+ * @aux: The DP AUX channel to use
+ *
+ * Returns: The current sink count reported by @aux, or a negative error code
+ * otherwise.
+ */
+int drm_dp_get_sink_count(struct drm_dp_aux *aux)
+{
+	u8 count;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	return DP_GET_SINK_COUNT(count);
+}
+EXPORT_SYMBOL(drm_dp_get_sink_count);
+
 /*
  * I2C-over-AUX implementation
  */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35a4779a442e2..4337321a3be4f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
 static bool
 intel_dp_get_dpcd(struct intel_dp *intel_dp)
 {
+	int ret;
+
 	if (!intel_dp_read_dpcd(intel_dp))
 		return false;
 
@@ -4664,11 +4666,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 	}
 
 	if (intel_dp_has_sink_count(intel_dp)) {
-		u8 count;
-		ssize_t r;
-
-		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
-		if (r < 1)
+		ret = drm_dp_get_sink_count(&intel_dp->aux);
+		if (ret < 0)
 			return false;
 
 		/*
@@ -4676,7 +4675,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		 * a member variable in intel_dp will track any changes
 		 * between short pulse interrupts.
 		 */
-		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
+		intel_dp->sink_count = ret;
 
 		/*
 		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index a1413a531eaf4..0c141fc81aaa8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1635,6 +1635,7 @@ struct drm_dp_desc;
 bool drm_dp_has_sink_count(struct drm_connector *connector,
 			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   const struct drm_dp_desc *desc);
+int drm_dp_get_sink_count(struct drm_dp_aux *aux);
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
