Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4E7A5390
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22C10E2E1;
	Mon, 18 Sep 2023 20:14:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5810E2E6
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:43 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c46b30a1ceso16971335ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068083; x=1695672883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5IJtjGIX6b4MlPfGH5iqUZu2dMVg0TzqADCTq+e5kk=;
 b=Ru7WaR0OZPskHD+RyImXmiOLzMkQ3If2Dx5jRm5iwQ82ojMWDJRC/FCxiLSpLUFYLx
 KdEbxsHD58OYDLy4KwBzFfew8VlTZlABOrnf+Pd6OScfLWZGMosHZv9WhyyUQH3vdBvj
 EmQFiAUDxo+LnKkOs71bbXEOdi8hAevmSRXM5m0w0IWSI39oFMIto5R31Kp8mUaSxkgk
 YTkkOF7BaKF+H622aAzx9mTZ+xJSXRdvwb8k4d+ZNbVI0mC3HfIiwmhdVzWwr/T4PBT6
 2VIX3PAdoJIHFn9n1Ua+app/1bdFCgUemHhc2kQypMWfvVoYOP/QyW8nkX4J+/22urky
 4Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068083; x=1695672883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5IJtjGIX6b4MlPfGH5iqUZu2dMVg0TzqADCTq+e5kk=;
 b=gCNnC8ngw9SIxEQ9B3WYyif/zkjxgq6n7zyrMp7OjaSHqn6mZIfrOfWBe3H5nwQJzb
 EnuV3nnzjYRcxSQxcovPekDNOqYW8Mw0MHqd/MHAG8BGaHAVWh8tDfI7FWnjGPa0BxuU
 Y+8+bLBrWSW061LmAa20yro296ZBdDJT3347N/FXdjUVT+6iFd0KGmaifJAXF0ogpXJr
 9mMLiehAhhBPwnEvwg94mh1+FFvqArrgW2+L7vw6+q+usx7VbQCoanSIt/2ePRjsFhDK
 boezkcghVhwhzwHMVuMs37K4e2vpdkT8oL9e0Xcqg+I9zPP0C7rLFSlsJounYBWEMhxS
 Ft0Q==
X-Gm-Message-State: AOJu0Yxud/9mqRf5BTNb6+Tta3MRtWgnaNXrwqZUwWrKg9DgV0Y9vJ07
 1blbXdHnIG5557DvkathC3hmXL+ZeqM=
X-Google-Smtp-Source: AGHT+IF5nSUkKY1AcUiz6Ut/7kiD59gFKknBfLIfvZiXNmDYhdO1A9hppRk1fM898EeiINHQQlEsgA==
X-Received: by 2002:a17:903:2283:b0:1b9:e81f:fb08 with SMTP id
 b3-20020a170903228300b001b9e81ffb08mr11538950plh.55.1695068082752; 
 Mon, 18 Sep 2023 13:14:42 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:42 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:29 +1000
Message-ID: <20230918201404.3765-10-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 09/44] drm/nouveau/disp: rename internal output
 acquire/release functions
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

These will be made static later in the patch series, after the code that
uses them has been cleaned up in preparation for GSP-RM support.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  |  5 +++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 16 ++++++++--------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index fb061144438d..3ed93df475fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -89,7 +89,7 @@ nvkm_outp_xlat(struct nvkm_outp *outp, enum nvkm_ior_type *type)
 }
 
 void
-nvkm_outp_release(struct nvkm_outp *outp, u8 user)
+nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 {
 	struct nvkm_ior *ior = outp->ior;
 	OUTP_TRACE(outp, "release %02x &= %02x %p", outp->acquired, ~user, ior);
@@ -142,7 +142,7 @@ nvkm_outp_acquire_hda(struct nvkm_outp *outp, enum nvkm_ior_type type,
 }
 
 int
-nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
+nvkm_outp_acquire_or(struct nvkm_outp *outp, u8 user, bool hda)
 {
 	struct nvkm_ior *ior = outp->ior;
 	enum nvkm_ior_proto proto;
@@ -234,6 +234,12 @@ nvkm_outp_detect(struct nvkm_outp *outp)
 	return ret;
 }
 
+void
+nvkm_outp_release(struct nvkm_outp *outp)
+{
+	nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 1cd70868f225..76d83fb9c6e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -77,8 +77,9 @@ void nvkm_outp_fini(struct nvkm_outp *);
 
 int nvkm_outp_detect(struct nvkm_outp *);
 
-int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
-void nvkm_outp_release(struct nvkm_outp *, u8 user);
+int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
+void nvkm_outp_release(struct nvkm_outp *);
+void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
 
 struct nvkm_outp_func {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 0c4ffa3ffb28..828db77af242 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -141,7 +141,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
 	}
 
-	nvkm_outp_release(outp, NVKM_OUTP_USER);
+	nvkm_outp_release(outp);
 	return 0;
 }
 
@@ -151,7 +151,7 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 {
 	int ret;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
 	if (ret)
 		return ret;
 
@@ -172,7 +172,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
 		return -EINVAL;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
 	if (ret)
 		return ret;
 
@@ -182,7 +182,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 		if (!ior->func->hdmi ||
 		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
 		    (hdmi_scdc && !ior->func->hdmi->scdc)) {
-			nvkm_outp_release(outp, NVKM_OUTP_USER);
+			nvkm_outp_release_or(outp, NVKM_OUTP_USER);
 			return -EINVAL;
 		}
 
@@ -203,7 +203,7 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	outp->lvds.dual = dual;
 	outp->lvds.bpc8 = bpc8;
 
-	return nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 }
 
 static int
@@ -219,7 +219,7 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	switch (args->v0.proto) {
 	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
-		ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
 		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
@@ -261,7 +261,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_PRIV, false);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
 	if (ret == 0) {
 		if (outp->ior->func->sense) {
 			ret = outp->ior->func->sense(outp->ior, args->v0.data);
@@ -269,7 +269,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 		} else {
 			ret = -EINVAL;
 		}
-		nvkm_outp_release(outp, NVKM_OUTP_PRIV);
+		nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
 	}
 
 	return ret;
-- 
2.41.0

