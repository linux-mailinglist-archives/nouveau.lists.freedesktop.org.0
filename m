Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0A7A539A
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BDB10E2E0;
	Mon, 18 Sep 2023 20:15:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C345010E2EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:00 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c4194f7635so30639955ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068100; x=1695672900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xm7MalA/Hl0IL8mYSfHKvrHbLA9j4A/NHUNDFtutCDQ=;
 b=gMXPzQDUi1XzF1qWEAvQNEJhbRobYbGCz0igQDuGs0TaVgrP+lCx/4SYHeKIzDGJbG
 de7ba4S9nGBTVxvYeeQQ4EQaDuCJRdsFGb0909GMSrRwKk2iOQePewfsvt8ZmVR+60r5
 oBxpK5SZWojU+slUtP61tf2aMLiiRZniHS7Kle2l26Mbk6WpBy058uTBNncIyftKFQwK
 ZzcI44aq0vO+0FJ1w1L5AYee32mgJKPQ7xP92YOFxtH1Z8S7qmCzwt/TG6c94u2us3xe
 TCC8q3IbjfKqmPzz3Xol/1GZl1Uqft632DIxHvzb3WbMFusdxMftP1XBBB7jCrI/OUxv
 dIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068100; x=1695672900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xm7MalA/Hl0IL8mYSfHKvrHbLA9j4A/NHUNDFtutCDQ=;
 b=J/QJRyVi/eXsCvKiQ+DNsjo8d8P7uWSeEgntBXaFSq8BaYBNZHtFTv/mV940gvRlSH
 Mg6DU8yGyOz7SY7338oiA/QEmFKMBaluCqah4vibFmwipcfH0SqdiA7om9lMS+iwJo+/
 uLITfnlbUT1RCzjVFTRmELo0343+ASekhpFM6/4NGA3Qwcs5UBBB/fWViNg9mv1/m+gL
 8Afh+sP+xGLnWS+AO2Hh9lNS57Szl1dcDbLQvBm1IVksZWDDXXSqPg+IZ/X7Gaz0VphS
 yEbgnR7eI1htoK1rJdH184ydeTkkrsGUdPGHme7AOPXf2WiLNWmb2VOgPpyjwnz5S9Oi
 ixzw==
X-Gm-Message-State: AOJu0YxsOnQujwPYwUVSpNapFVd9twBifcM6I1IeTLZ4hLrL5OvC7CHH
 NYseiQtSRvGRK1cFIS4KoyQO2bSRt6o=
X-Google-Smtp-Source: AGHT+IHSiyXWWYX2aYd3dTMujrlGN7nMCJOXXhiF8heHGPZyWl4hM+U3ugYk/CqIFcETZRyNgbR3XQ==
X-Received: by 2002:a17:903:22c3:b0:1c4:1cd3:8068 with SMTP id
 y3-20020a17090322c300b001c41cd38068mr808625plg.5.1695068099886; 
 Mon, 18 Sep 2023 13:14:59 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:59 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:36 +1000
Message-ID: <20230918201404.3765-17-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 16/44] drm/nouveau/kms/nv50-: remove
 nv_encoder.audio.connector
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- use nv_encoder.conn instead, outp->conn never changes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 4 +---
 drivers/gpu/drm/nouveau/nouveau_encoder.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1123d25be77d..165bc6a0d563 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -611,7 +611,7 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 			continue; /* TODO */
 
 		nv_encoder = nouveau_encoder(encoder);
-		nv_connector = nouveau_connector(nv_encoder->audio.connector);
+		nv_connector = nv_encoder->conn;
 		nv_crtc = nouveau_crtc(nv_encoder->crtc);
 
 		if (!nv_crtc || nv_encoder->outp.or.id != port || nv_crtc->index != dev_id)
@@ -723,7 +723,6 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 	mutex_lock(&drm->audio.lock);
 	if (nv_encoder->audio.enabled) {
 		nv_encoder->audio.enabled = false;
-		nv_encoder->audio.connector = NULL;
 		nvif_outp_hda_eld(&nv_encoder->outp, nv_crtc->index, NULL, 0);
 	}
 	mutex_unlock(&drm->audio.lock);
@@ -748,7 +747,6 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	nvif_outp_hda_eld(&nv_encoder->outp, nv_crtc->index, nv_connector->base.eld,
 			  drm_eld_size(nv_connector->base.eld));
 	nv_encoder->audio.enabled = true;
-	nv_encoder->audio.connector = &nv_connector->base;
 
 	mutex_unlock(&drm->audio.lock);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index b1554ad9d929..ea8ef10e71aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -62,7 +62,6 @@ struct nouveau_encoder {
 	/* Protected by nouveau_drm.audio.lock */
 	struct {
 		bool enabled;
-		struct drm_connector *connector;
 	} audio;
 
 	struct drm_display_mode mode;
-- 
2.41.0

