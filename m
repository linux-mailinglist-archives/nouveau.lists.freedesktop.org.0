Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB69364DE9
	for <lists+nouveau@lfdr.de>; Tue, 20 Apr 2021 00:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8F6E442;
	Mon, 19 Apr 2021 22:55:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A5E6E442
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 22:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618872944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXvOa2vhLxgteuwROnjXnJNpH30+jnf9gvFzYDgEgi8=;
 b=iY9BBvw5PFomrD8P+j7IaJAMViPST7eEsGW5sP6vGKLOlR8hhxXs0yNzz29JT4lDI9AgHQ
 ZRM6cpch1xz2lQhXf2eo8uHaz5Kf7UXE/TU+GAxxLzS6ci8J7Q9sjXDSr051qsM/JXCEoJ
 Gw2AVTxwOrMlYInCBBbynFH0CcE1eos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-t7lRGv6PMXia-qAM3eMBaw-1; Mon, 19 Apr 2021 18:55:42 -0400
X-MC-Unique: t7lRGv6PMXia-qAM3eMBaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CAB281744F;
 Mon, 19 Apr 2021 22:55:40 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B795C1CF;
 Mon, 19 Apr 2021 22:55:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 19 Apr 2021 18:55:04 -0400
Message-Id: <20210419225523.184856-3-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Nouveau] [PATCH v3 02/20] drm/dp: Add __no_check to
 drm_dp_aux_register()
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

Since we're about to make it so that drm_dp_aux_init() can fail (and thus -
should have it's return value checked) - we should require that callers of
drm_dp_aux_register() also check it's return value since drm_dp_aux_init()
can be called from there.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/drm/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1e85c2021f2f..e44b0ee7b85e 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -2010,7 +2010,7 @@ bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
-int drm_dp_aux_register(struct drm_dp_aux *aux);
+__must_check int drm_dp_aux_register(struct drm_dp_aux *aux);
 void drm_dp_aux_unregister(struct drm_dp_aux *aux);
 
 int drm_dp_start_crc(struct drm_dp_aux *aux, struct drm_crtc *crtc);
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
