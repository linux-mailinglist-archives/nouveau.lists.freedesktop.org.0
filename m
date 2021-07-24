Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611323D4AEA
	for <lists+nouveau@lfdr.de>; Sun, 25 Jul 2021 03:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B48272CCD;
	Sun, 25 Jul 2021 01:58:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8A6E16D
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627158471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q/1snXio7orhyt4GADMoDog5tLPSL6yylMx5qgvWHcw=;
 b=TUyT6Ydlgg/M8eNpPXjaSjLfGa7liEpVCvD4XR6bZsMGKQ4cWVxYDWj1K3g1ScPByqTG3S
 8doiAD8RbSKhsr8zJw2n3Hp6OrdW0DHdeRR5d5l7p2I8VddL2YYzfbga6MfMlBxsEGY+/Y
 DwX1RjnWz3r6Au6fH0H1kBa8JntANJ0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-LYtcDPkWMwyXcC3f02CYBA-1; Sat, 24 Jul 2021 16:27:47 -0400
X-MC-Unique: LYtcDPkWMwyXcC3f02CYBA-1
Received: by mail-qk1-f198.google.com with SMTP id
 p123-20020a378d810000b02903ad5730c883so4528252qkd.22
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/1snXio7orhyt4GADMoDog5tLPSL6yylMx5qgvWHcw=;
 b=JeYPcxjafvdHlf5TP3ALzM/e+bMpNf/sVaGTvdchCMvZ9k5OTiYELbP23ocnnkEmjI
 pdrihvejBlSSkMNLXhPUc4b14RdydeCOnMh6wmn4V7nJ3trlJbU71VqeYmVdMEaBvpJg
 uBKtz16dcfCoM5O/WiMa/p0viK4WgX9wcDelSJlLvzyTJOcdrRX7Dgp1xyJ9xoY71+zt
 BAuGCh4+y6ShtMZjMe9Tujko3/9GXQxF4MI7l7yr4xYR+vvRd43yD/+0Ip3PHJSXuJUj
 bizaQqykFm0dSjYOAbOzFfeFHkJb6WLAutwXCd2TLMsbsdinVyJH5GxWWgnRafSiRS9u
 Kiwg==
X-Gm-Message-State: AOAM530r++1GUYk4UImq4O3wpm/uRV9tbAg2+U74PjizCvSf5eMK50nx
 o2AvMV7MynYTbaCxFjmMYIxAKK53Gy3U9eBYA9cVXf6aKLT0bBq4REcWPdjiKiha25fSElCgOxp
 RajEBhkBKvZX9tiymHcwjk/kMxQ==
X-Received: by 2002:a37:f50d:: with SMTP id l13mr10711210qkk.298.1627158467401; 
 Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi6hIhq+NVUhVPqnbgHKJ7z9VSQvET+rT1MdV2KhuXvUks5lvzfgQYu10UOdSyzb83grMAEQ==
X-Received: by 2002:a37:f50d:: with SMTP id l13mr10711196qkk.298.1627158467186; 
 Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id h68sm16650148qkf.126.2021.07.24.13.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:27:46 -0700 (PDT)
From: trix@redhat.com
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com,
 nikola.cornij@amd.com, ville.syrjala@linux.intel.com
Date: Sat, 24 Jul 2021 13:27:31 -0700
Message-Id: <20210724202731.3949331-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Sun, 25 Jul 2021 01:58:10 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: use DRM_NOUVEAU_BACKLIGHT
 consistently
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

A build error when DRM_NOUVEAU_BACKLIGHT is not defined
disp.c:1665:52: error: 'struct nouveau_connector' has no
  member named 'backlight'

Use ifdef's similar to elsewhere in disp.c to conditionally
use the new backlight support.

Move scope of drm to where it is used, inside the backlight error
reporting.

Remove shadow ret decl.

Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 093e1f7163b31..6e957041edfb5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1659,23 +1659,28 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight = nv_connector->backlight;
+#endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
 	u8 pwr;
 
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
 		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
-		if (ret < 0)
+		if (ret < 0) {
+			struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
 				 nv_connector->base.base.id, nv_connector->base.name, ret);
+		}
 	}
+#endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+		ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
 		if (ret == 0) {
 			pwr &= ~DP_SET_POWER_MASK;
-- 
2.26.3

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
