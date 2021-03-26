Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244734B06F
	for <lists+nouveau@lfdr.de>; Fri, 26 Mar 2021 21:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0436F4AE;
	Fri, 26 Mar 2021 20:39:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D43D6F4A4
 for <nouveau@lists.freedesktop.org>; Fri, 26 Mar 2021 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GuSp+6Dad1IrBYORQVnsopE6L7aJrtAfcCsZYrHPlk=;
 b=CERxw3HtoJSieYn3SsDZ6+rs+ILEVpnPGYut5249viALrGNhLIvz62Z+1NX8riERnN8Glj
 POQRhq3nTu+fd8r9YAsXkQR4dzVIWepu9srnE52ivyXxwyvMT4jG8D0wrTnkExyin8h1eq
 7qPj9XkSvPlmdzjoPDJLW3GOAQ3Vd3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-F0hfDLIfN8-0Q5XRZFAqLw-1; Fri, 26 Mar 2021 16:39:36 -0400
X-MC-Unique: F0hfDLIfN8-0Q5XRZFAqLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236D61009E33;
 Fri, 26 Mar 2021 20:39:33 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E41695DAA5;
 Fri, 26 Mar 2021 20:39:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Fri, 26 Mar 2021 16:37:57 -0400
Message-Id: <20210326203807.105754-11-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [PATCH v2 10/20] drm/dp: Always print aux channel name in
 logs
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
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since we're about to convert everything in drm_dp_helper.c over to using
drm_dbg_*(), let's also make our logging more consistent in drm_dp_helper.c
while we're at it to ensure that we always print the name of the AUX
channel in question.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f0029b8cb558..54e19d7b9c51 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -139,8 +139,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					 DP_TRAINING_AUX_RD_MASK;
 
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
-			      rd_interval);
+		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
+			      aux->name, rd_interval);
 
 	if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
 		rd_interval = 100;
@@ -155,8 +155,8 @@ static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 						 unsigned long rd_interval)
 {
 	if (rd_interval > 4)
-		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
-			      rd_interval);
+		DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
+			      aux->name, rd_interval);
 
 	if (rd_interval == 0)
 		rd_interval = 400;
@@ -2774,7 +2774,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 	if (ret < 0)
 		return ret;
 	if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
-		DRM_DEBUG_KMS("PCON in Autonomous mode, can't enable FRL\n");
+		DRM_DEBUG_KMS("%s: PCON in Autonomous mode, can't enable FRL\n", aux->name);
 		return -EINVAL;
 	}
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
@@ -2869,7 +2869,8 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
 			num_error = 0;
 		}
 
-		DRM_ERROR("More than %d errors since the last read for lane %d", num_error, i);
+		DRM_ERROR("%s: More than %d errors since the last read for lane %d",
+			  aux->name, num_error, i);
 	}
 }
 EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
