Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F49741AB0
	for <lists+nouveau@lfdr.de>; Wed, 28 Jun 2023 23:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCC510E3A0;
	Wed, 28 Jun 2023 21:22:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0110E184
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687987374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L25XPrE4POZxEhhk2/19p0p2PCDX/k5AJ4PHMsFVmoI=;
 b=cuZx/Dv52EUymnMghQKSucoC8CKNcCfN00IppHh/gk1g/dzopbERfA0+EDfyzSoP88b6l4
 ezT2Jo5u7VTFnavdEKyQXvCV61bBvpO27T+NUV2aSNhQJxvZqqbET4rVs2DmjJYPldi7J/
 HG9E7x1uHWh8vxWjwUC4doAV4JV+GO4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-hzDjo-p_MOaa1f_ybWgM0Q-1; Wed, 28 Jun 2023 17:22:52 -0400
X-MC-Unique: hzDjo-p_MOaa1f_ybWgM0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313e34ec6e8so597f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 14:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987372; x=1690579372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L25XPrE4POZxEhhk2/19p0p2PCDX/k5AJ4PHMsFVmoI=;
 b=JzBEEnlSOx5p8M3gnJQZEQMq+hF78xj4+HOBFBFOREqklh2TFvlX/G3nIC6kHvTJKI
 6ILNpUqWdCBvkvJbHOCIDQdBIpoN7rDlneQ6Y0S+sHLTCqdyJ5Zv2QYl1zAhITK6dumY
 7rqXgeDMBhp76LAkp1lg3/oEZlku0o+Wxw4Qoo0vmVWk/lHGXIa4gQSZ9ErgTd9G5qAl
 Za1k5ljQ3SnJZP20y4c8G0y2EoFmwHcIjYF9iiM4LR8Bm23NxcLYEbEpxxyGjn1n1wyc
 lztPxyCHoltA1YYEKvg7hrnihaPYLMUl9DLYUNzn4wLIN7hLFi8fsAYsi5pqC7wKSNjw
 mUcg==
X-Gm-Message-State: AC+VfDyp0s+SrePZmA8kWB95zTXQTeYG6dvSAeyTmweXs2cFh8XJlBJ2
 nm5cjVEHAXCvTJ7Jp1GFgFcBlz0I5+DKb04deK4mTLapQ+0qgbJYsop/5xVNF62RxK1uAovGFTW
 fzPTkXI4Y96i4X8FCB8i4qndGIg==
X-Received: by 2002:adf:f990:0:b0:313:edaa:24f3 with SMTP id
 f16-20020adff990000000b00313edaa24f3mr9337091wrr.5.1687987371821; 
 Wed, 28 Jun 2023 14:22:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HubsUmqIJhwm4B7AbWuPZejQ5/Mr/9PKWcvbTsxn13ECBZOSCiJ2Y0q/28ms0yNC5JG/oVw==
X-Received: by 2002:adf:f990:0:b0:313:edaa:24f3 with SMTP id
 f16-20020adff990000000b00313edaa24f3mr9337087wrr.5.1687987371669; 
 Wed, 28 Jun 2023 14:22:51 -0700 (PDT)
Received: from kherbst.pingu ([95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm14294323wrl.72.2023.06.28.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:22:50 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 28 Jun 2023 23:22:47 +0200
Message-ID: <20230628212248.3798605-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628212248.3798605-1-kherbst@redhat.com>
References: <20230628212248.3798605-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 2/3] drm/nouveau/disp: drop unused argument in
 nv50_dp_mode_valid
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 3 +--
 drivers/gpu/drm/nouveau/nouveau_encoder.h   | 3 +--
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1637e08b548c..6221eaaad1b7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1127,7 +1127,7 @@ nv50_mstc_mode_valid(struct drm_connector *connector,
 	 * MSTB's max possible PBN
 	 */
 
-	return nv50_dp_mode_valid(connector, outp, mode, NULL);
+	return nv50_dp_mode_valid(outp, mode, NULL);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f75c6f09dd2a..22c42a5e184d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1079,7 +1079,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	case DCB_OUTPUT_TV:
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
-		return nv50_dp_mode_valid(connector, nv_encoder, mode, NULL);
+		return nv50_dp_mode_valid(nv_encoder, mode, NULL);
 	default:
 		BUG();
 		return MODE_BAD;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index d49b4875fc3c..6a4980b2d4d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -267,8 +267,7 @@ nouveau_dp_irq(struct work_struct *work)
  *   yet)
  */
 enum drm_mode_status
-nv50_dp_mode_valid(struct drm_connector *connector,
-		   struct nouveau_encoder *outp,
+nv50_dp_mode_valid(struct nouveau_encoder *outp,
 		   const struct drm_display_mode *mode,
 		   unsigned *out_clock)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 70c1ad6c4d9d..bcba1a14cfab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -143,8 +143,7 @@ enum nouveau_dp_status {
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);
-enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
-					struct nouveau_encoder *,
+enum drm_mode_status nv50_dp_mode_valid(struct nouveau_encoder *,
 					const struct drm_display_mode *,
 					unsigned *clock);
 
-- 
2.41.0

