Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD0879FEDE
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA02810E535;
	Thu, 14 Sep 2023 08:48:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6639010E541
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:07 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fb98745c1so526175b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681286; x=1695286086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+prGWlAocWj8c2bVtp0nxdfJObYtKN2g4ycdvBMwsiM=;
 b=bYHaYuSfvbPip6vvRMVD6kIktsLsclS48Dk4pkCi7qOHpGryjco+INjSN8Iivwgq9r
 IACMWWSaCDqivaAtrUiSRmb2HnZ2FUkwiAacyU0aHhEwE2ZDPV3A/lkmVwaSw60xDUVm
 tMQ6A1gcswz6IZb/yvkDxRiaDFLxGZhYMLMhwY10magoFqNOB4+9tiGvi+48y5H1PnD5
 RoyYg4WWXsFuj2AGMDayg5dqwXh6G3/NoO4xJ7VDzIWghNMoJvAbTKCXst968vsLssrq
 Toj4Mso/56opDCUiVW+/+yuYoZkV043XOPwCI1anaXPSc4qBSrZMwcAqJWtPjEE4Q2b8
 SXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681286; x=1695286086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+prGWlAocWj8c2bVtp0nxdfJObYtKN2g4ycdvBMwsiM=;
 b=RnaWf66pbuyNovPVR8LZebIduoKLsPE18NGj+2uL9t0OtIpKcsDr68bUR8bW3WFHMq
 aGVzP6wLdZILNDTVcqivpqnq6TD5p6Huokus2/JMp9SpNNF4F9avh0pOmSRWvKz+PC+J
 6vCDY444GPXh1dBnD9q6Fvm72CiEY4HukODiQle0w+PUXcm8tDj6F0nnEKNz2+J1BhI+
 5p/aB8jZZGEyz+Dk3YlhCxo2bN0OSg0+HuzWfRt9QXZqBdIawEh2jFgp69Fb+gmj7CXQ
 Q81cYss7bYVd+fZ3e/RaDsGPcgxAEKAk6cOmgUBm6ooTk0rxAoTsJ4oSEMFxepmAOwyC
 /FLw==
X-Gm-Message-State: AOJu0Yy/bzekHcYum9GV9dXsOljYpPiLzc8Sv+kODsuIfR4403jITO8g
 JoOdMF/+QM6t9v1dCl6/lQnX44OeAa4=
X-Google-Smtp-Source: AGHT+IGLn8zFbB6TAR+qwdNb/qZd/ZkcPMTyyZXjBpsZ8bBm/nzAD13eKtojG10WQk6/ZdSlZYTUVw==
X-Received: by 2002:a05:6a00:cc4:b0:68e:43ed:d30b with SMTP id
 b4-20020a056a000cc400b0068e43edd30bmr5012738pfv.21.1694681286483; 
 Thu, 14 Sep 2023 01:48:06 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:06 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:12 +1000
Message-ID: <20230914084624.2299765-33-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 31/44] drm/nouveau/kms/nv50-: fixup sink D3 before
 tearing down link
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

- fixes bug preventing this on SST
- implement for MST

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 13 +++----------
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  1 +
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d52320965b50..be4c45fd3999 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1298,6 +1298,7 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
 	}
 
 	if (mstm->disabled) {
+		nouveau_dp_power_down(mstm->outp);
 		nvif_outp_release(&mstm->outp->outp);
 		mstm->disabled = false;
 	}
@@ -1549,7 +1550,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 #endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
-	u8 pwr;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
@@ -1566,15 +1566,8 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		nv_encoder->hdmi.enabled = false;
 	}
 
-	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-		ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
-
-		if (ret == 0) {
-			pwr &= ~DP_SET_POWER_MASK;
-			pwr |=  DP_SET_POWER_D3;
-			drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
-		}
-	}
+	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
+		nouveau_dp_power_down(nv_encoder);
 
 	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
 	nv50_audio_disable(encoder, nv_crtc);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index f26769bca195..1c0b992fe241 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -284,6 +284,21 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	return ret;
 }
 
+void
+nouveau_dp_power_down(struct nouveau_encoder *outp)
+{
+	struct drm_dp_aux *aux = &outp->conn->aux;
+	int ret;
+	u8 pwr;
+
+	ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+	if (ret == 1) {
+		pwr &= ~DP_SET_POWER_MASK;
+		pwr |=  DP_SET_POWER_D3;
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
+	}
+}
+
 bool
 nouveau_dp_link_check(struct nouveau_connector *nv_connector)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 123d0ecf5f58..ed31db58176c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -155,6 +155,7 @@ enum nouveau_dp_status {
 };
 
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
+void nouveau_dp_power_down(struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);
 enum drm_mode_status nv50_dp_mode_valid(struct nouveau_encoder *,
-- 
2.41.0

