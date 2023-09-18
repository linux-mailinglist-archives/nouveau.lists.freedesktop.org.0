Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB57A53AA
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02F10E2F6;
	Mon, 18 Sep 2023 20:15:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7399B10E2FB
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:37 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c43166b7e5so32111375ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068136; x=1695672936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCwQrrWehKceZ772r9BuFv4x0Ot6Zo5GQJ19ONaqPRw=;
 b=E43wdXM+jImDlin6BD4sQiz1KN02Zo/Yis8jWOoWbS52crfm648M0qVlu+paKUS/j9
 joXRq3PH781+rZDV99yC2qOOfQQHf2GjALKJ6fQg+bElG55uKZHN636shQ4u0LrGBqfD
 KlcgTGkKXKWKr4mk8HjpFXSnvedJ6DopngSQGRgxZI7yuffu8ODqQV5IzdQQBFYbapzC
 pb5YUzZUDqNkUGR3WBO7kZsMFIOwjg6ZrgOATuwoAzhtHk/9iUBRl8syH7azlqP+ektz
 QO7XKPKDH6NtOZTiKREVRaMsqFXLHHj23A5DK+/il2XXhILGqL+Z7EZaB5LBvyOGx8Y3
 0zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068136; x=1695672936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCwQrrWehKceZ772r9BuFv4x0Ot6Zo5GQJ19ONaqPRw=;
 b=ayvpKmUEW0Rt5u+UrMa2S/gFEJVmbNzJJ7mDT3Ddy+z/Y1nUUOxzjBRd1b+CKCMLtO
 mG14iuqqLCtTUkKFofVY6sZ1Ip+xVm4fCZ4/BFCIrqKfvnIOgvK1bzxjl2DMQdXCz9oc
 aKoWj/pNYUeJS42+MnZmmSn2T+1uKgUyFOvA+ChlQjCd5QY44bgMqyfmuuFvLioAE2zQ
 NovxDavBgdwyuJNXTtZS3dJk3cTbCPo6mAlP4+QKeb/KT3XcvEfu+1GDcL0b5d4r4iaO
 tYNOR6THV8xDq+a3pZ5YOmin07brKgf8ziR1eCtEAtTmIXoOKAroR6Dp1zPKrQo2taV6
 nl9g==
X-Gm-Message-State: AOJu0YxBYT8jUc2nrPpeK567m4uI9cuNPj/gSvD0AwK/E3IwdS2+vKcf
 JQ0uw+qQmokhBM2cDXXOtcg9wRBnWGU=
X-Google-Smtp-Source: AGHT+IGIqCFBMZCJDVdzSpjxagBTcVrMB91XnJYjHb2s7od5UAuaIhZWksIcGhaKynfy5nqOVzwOIA==
X-Received: by 2002:a17:902:b60f:b0:1bc:671d:6d31 with SMTP id
 b15-20020a170902b60f00b001bc671d6d31mr9716554pls.3.1695068136600; 
 Mon, 18 Sep 2023 13:15:36 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:36 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:51 +1000
Message-ID: <20230918201404.3765-32-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 31/44] drm/nouveau/kms/nv50-: fixup sink D3
 before tearing down link
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

