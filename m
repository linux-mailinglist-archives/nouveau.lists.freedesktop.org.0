Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BE446878
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 19:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFF06EC9F;
	Fri,  5 Nov 2021 18:34:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2896EC9F
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636137272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zTpBMvFXVwp0cVfmRszlrLDuyQaiT/zVOksqphYoeg=;
 b=ZFkHhi7Jq9QYasVHIqCu/3vXmDh6fG6YzXJLgx5zEgkXzYcwbermeZaUgrqKMGFrM/xB01
 2rrrMLQH8O+yQxXtnnAutXGWLmHVR3LyHSGZcQdj+gDRg1xC/h+djvir95biJqVYAwQYig
 s7Xy0nvppzJUOwK1+FyyfDIFipCuXdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-UfKaqCuwOPWibbIvzcbeAQ-1; Fri, 05 Nov 2021 14:34:29 -0400
X-MC-Unique: UfKaqCuwOPWibbIvzcbeAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E053E1006AA2;
 Fri,  5 Nov 2021 18:34:27 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.16.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5B735FC13;
 Fri,  5 Nov 2021 18:34:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Fri,  5 Nov 2021 14:33:42 -0400
Message-Id: <20211105183342.130810-6-lyude@redhat.com>
In-Reply-To: <20211105183342.130810-1-lyude@redhat.com>
References: <20211105183342.130810-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Nouveau] [PATCH v5 5/5] drm/i915: Clarify probing order in
 intel_dp_aux_init_backlight_funcs()
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hooray! We've managed to hit enough bugs upstream that I've been able to
come up with a pretty solid explanation for how backlight controls are
actually supposed to be detected and used these days. As well, having the
rest of the PWM bits in VESA's backlight interface implemented seems to
have fixed all of the problematic brightness controls laptop panels that
we've hit so far.

So, let's actually document this instead of just calling the laptop panels
liars. As well, I would like to formally apologize to all of the laptop
panels I called liars. I'm sorry laptop panels, hopefully you can all
forgive me and we can move past this~

Signed-off-by: Lyude Paul <lyude@redhat.com>
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 96fe3eaba44a..8b9c925c4c16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -456,11 +456,17 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	}
 
 	/*
-	 * A lot of eDP panels in the wild will report supporting both the
-	 * Intel proprietary backlight control interface, and the VESA
-	 * backlight control interface. Many of these panels are liars though,
-	 * and will only work with the Intel interface. So, always probe for
-	 * that first.
+	 * Since Intel has their own backlight control interface, the majority of machines out there
+	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
+	 * the VESA interface. However, other GPUs (such as Nvidia's) will always use the VESA
+	 * interface. This means that there's quite a number of panels out there that will advertise
+	 * support for both interfaces, primarily systems with Intel/Nvidia hybrid GPU setups.
+	 *
+	 * There's a catch to this though: on many panels that advertise support for both
+	 * interfaces, the VESA backlight interface will stop working once we've programmed the
+	 * panel with Intel's OUI - which is also required for us to be able to detect Intel's
+	 * backlight interface at all. This means that the only sensible way for us to detect both
+	 * interfaces is to probe for Intel's first, and VESA's second.
 	 */
 	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
 		drm_dbg_kms(dev, "Using Intel proprietary eDP backlight controls\n");
-- 
2.31.1

