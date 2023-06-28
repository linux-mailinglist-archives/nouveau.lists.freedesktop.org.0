Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E2741AB5
	for <lists+nouveau@lfdr.de>; Wed, 28 Jun 2023 23:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E9910E3D1;
	Wed, 28 Jun 2023 21:23:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4DF10E397
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687987376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fP84djK5erd2GrrGFYuKnbHCuXvHXjeqzaJ4gXaZwiY=;
 b=ZNw578iToXhS8R0iXbKZePNvpuDfvvME3cKvSMt04ZzMJ5l8VCcZwNoL0U3wyd8WDmwdCY
 Bf9Py+L4jRtKcHa32kdSG5G3EJ4nBD4wMfxFUQppghFoWTSqbsi2UGbxq5n0y46lt+/Hwy
 nC8QLlvDTm3Q31oucmmR1sNllJwvsTc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-xNa7ccUgNAKG5BzowEsUAQ-1; Wed, 28 Jun 2023 17:22:54 -0400
X-MC-Unique: xNa7ccUgNAKG5BzowEsUAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313ecc94e23so713f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 14:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987374; x=1690579374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fP84djK5erd2GrrGFYuKnbHCuXvHXjeqzaJ4gXaZwiY=;
 b=G5IquchuePNLqE87BoCTBJnJ9JLKHPR+7jxG00gi2j9NfwYzOVu4xESosSx1/45VET
 xJjzbjdTPmidb1brIpUN96ictRLKqF/icxx0QWSeJh4o0RTT1WXCcgqhOemoi7o6LmUO
 B71dCYdLYz2pkjhD8vpeFYrCyFUVB8eRF7bMhOsIN+z4+JEtWASeg1qTfU4VS2CPLECB
 j4VkBoSZHssQok6ER5sU7JIpnrHXLSgUG3r0FvukRccSOwJkfeulr4ZX25bEZR13lxR7
 B9ZgQcyGYtXCwyimWx4LOC/9KY1ps8G6OTAaKV+5gJ319t8NJn37UgR1VSWCCtZemKTl
 LkTg==
X-Gm-Message-State: AC+VfDwOQO1t9MrlxhVZ1tjXygRkryksQQ/r5HpDAjIwve6LeKOgam9d
 d3AEfsdYAtN3xDJTtchzYTez3lo4px/v/piyzBZTTmWtaiKP7yfusp1dCapJbUWm8B2jDhaaBt4
 IGT4wvvYfo+OOtjvTBGJ46LPmSQ==
X-Received: by 2002:a05:6000:151:b0:314:a77:b6c0 with SMTP id
 r17-20020a056000015100b003140a77b6c0mr2925788wrx.1.1687987373885; 
 Wed, 28 Jun 2023 14:22:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dTARVZLT46r+M/QXdzbg3Pfto134Vfy7ETRKzO1nDBcz+HGLvTECmnUAAxcjTyp3OM3kxvg==
X-Received: by 2002:a05:6000:151:b0:314:a77:b6c0 with SMTP id
 r17-20020a056000015100b003140a77b6c0mr2925773wrx.1.1687987373643; 
 Wed, 28 Jun 2023 14:22:53 -0700 (PDT)
Received: from kherbst.pingu ([95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm14294323wrl.72.2023.06.28.14.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:22:52 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 28 Jun 2023 23:22:48 +0200
Message-ID: <20230628212248.3798605-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628212248.3798605-1-kherbst@redhat.com>
References: <20230628212248.3798605-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 3/3] drm/nouveau/disp: verify mode on atomic_check
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We have to verify the selected mode as Userspace might request one which
we can't configure the GPU for.

X with the modesetting DDX is adding a bunch of modes, some so far outside
of hardware limits that things simply break.

Sadly we can't fix X this way as on start it sticks to one mode and
ignores any error and there is really nothing we can do about this, but at
least this way we won't let the GPU run into any errors caused by a non
supported display mode.

However this does prevent X from switching to such a mode, which to be
fair is an improvement as well.

Seen on one of my Tesla GPUs with a connected 4K display.

Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/199
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # v6.1+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22c42a5e184d..edf490c1490c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1114,6 +1114,25 @@ nouveau_connector_atomic_check(struct drm_connector *connector, struct drm_atomi
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
+	/* As we can get any random mode from Userspace, we have to make sure the to be set mode
+	 * is valid and does not violate hardware constraints as we rely on it being sane.
+	 */
+	if (conn_state->crtc) {
+		struct drm_crtc_state *crtc_state =
+			drm_atomic_get_crtc_state(state, conn_state->crtc);
+
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		if (crtc_state->enable && (crtc_state->mode_changed ||
+					   crtc_state->connectors_changed)) {
+			struct drm_display_mode *mode = &crtc_state->mode;
+
+			if (connector->helper_private->mode_valid(connector, mode) != MODE_OK)
+				return -EINVAL;
+		}
+	}
+
 	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->dev)))
 		return 0;
 
-- 
2.41.0

