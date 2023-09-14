Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41E79FECD
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C1110E532;
	Thu, 14 Sep 2023 08:47:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4383D10E532
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:34 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fbd5cd0ceso549144b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681253; x=1695286053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x69MFXJ/YWDFVPwS7EWZlVo8qU4z6fFGR64jnyhhy+M=;
 b=BU7HbItj8tVUzQM4vqIm3yAeWM5J+0CHf7l8lmI4/O2GZgU+b3oOWRTtUy4Ds6h+ka
 /O5XWGeyeZFplShThA2WZuyED6CF+eEgrQGX/IueQVgMlsJHDHqWQjf5I9ufnEtsMHOw
 K4uffAXzzhkEvu1m5CHyR9oV0vhfkog/WAbcyA7/16CRI1YuCFd3YPAy/0z/lOfXYRsH
 MTLOu/ypo4PwPD0KcKsz+gQ/Xv7a1nKqQCwlplWumBpwICj3+yWNP8Q8wkS7rSxANtqV
 Ia9hKYwbaezeOvDvOCB8FrVJE0PnB0zTdp3fNoF/CYLnbbuM0oic9jcXNnrbbBivntAY
 LppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681253; x=1695286053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x69MFXJ/YWDFVPwS7EWZlVo8qU4z6fFGR64jnyhhy+M=;
 b=jt15+MFAVYxAHlMe1T8gEyxAgzIpyxS2NnxRRIdrcZjiKjtNyUqwsWdTh7qwOnszLi
 ggoOjan2jDwYIz8jY6YZlspnNTFR/IRMWMVFw3mMq0iqiuejHlRgNsp8Nwt2h/WvHE8Q
 s7P8oTL9LYa1HCMaNFexdfQ2EwL9+dmrIGF5zJVbJf8+FLPZwW5v+Y5XSbPNxq+1g33k
 swv16VvknPDD4lEzeUplRiSLH8ReUH0gPnxaMLg3WFzJALKsZGQyVXMmyGUnyiEssadJ
 TvQniY5aB8jHte+tuTyuNW0WIIJbmLMm6gqkqiu5PyRrwOcvpZjxjz2VkoTtQh/FM92r
 hGag==
X-Gm-Message-State: AOJu0YwXv8bRtjK+x1keUWba/Ix4z2r+sKJO9BGJvKHQtHT2CljnRpAA
 t01m7SvSwb7WhFy0Dj1nlxY0v4Adw/4=
X-Google-Smtp-Source: AGHT+IGL0GCUKgos4Bu8lj+y9MHVlecC9YUtmsjRdjKM1FpOWE044KTZdUmgh1A7Wrz5kNklEmX01w==
X-Received: by 2002:a05:6a00:a90:b0:68e:45df:4648 with SMTP id
 b16-20020a056a000a9000b0068e45df4648mr5464504pfl.23.1694681253400; 
 Thu, 14 Sep 2023 01:47:33 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:32 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:57 +1000
Message-ID: <20230914084624.2299765-18-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 16/44] drm/nouveau/kms/nv50-: remove
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

