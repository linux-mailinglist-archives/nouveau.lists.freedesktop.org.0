Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C548D7A5394
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E6010E2EA;
	Mon, 18 Sep 2023 20:14:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B737B10E2E0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:48 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c44c0f9138so19945835ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068088; x=1695672888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkJ1RB56yWAiAGdtk1FSuo4XvWk6OAq/czLpa1HejBE=;
 b=koiHz+ZXWAJibxCL+DjfCovQqb7puPjdYU1UbmUseVxKUhKAF2RJzskFFBfQFYwbl0
 O5EbgPICPFglIF+0p6WdOi/6ZKTqSeQZ4wTVHwWv4LprxhNH4O4lmoU8on9DFtAA0Seg
 NHea1VNBFopfAqYBtrSF2Y2OHA5PNuyZQVuskZptvZ2VXYwD/LwYJvelbkPMiIc6Gr6L
 kK3uISEr7P2Y2kfprja0kB6unuZg/IMp46BEJf7mRghigF+IqxjlRZ7uJnJfFrsavAVU
 bTv57ztPM9JvRbrBncfWkBZN/oD18hSte/IEaONCQkspZ8avjQl26yo/8rNfx3ZbaxH0
 drVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068088; x=1695672888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkJ1RB56yWAiAGdtk1FSuo4XvWk6OAq/czLpa1HejBE=;
 b=jiO/dFGcWeqbtF8a5qrMZTyoG0yRGA1/9GETrcGmj6JD9eLuPgOzz91Td3IyF91DLy
 3lWBArlFl3kKvuScF37j+1L2DJfBATdXgJUS5CQVoOxqgb0Rx7Y70jpGOlc3vGH0pJ18
 8ua/QckGBsaJI3aEzX4aNwwRWiOSruojiCuI45qQIIFHoeE7oKMOZzZa2IuUDOPSbnAP
 sNEyioPdyRHZ5t4I0HfKoPV9GNS6B3fogipEMOI0zqjDuJcxJTwpMg+3ZxExjHgtwLea
 QrTPyjT1KbFAtnquUUd7Yj64bSQZPmc2cdU8Xo1jYIgAUZOUHVAeWx662O1neIGST3nf
 Z46Q==
X-Gm-Message-State: AOJu0YyoURHiYc2DTxM6JKes4fVBG+tXc2PV3tAkaYZt9MAKEcQLSfX7
 Zy5Zo4b1T5RmLKS2y7yKyN1j7A1oIsY=
X-Google-Smtp-Source: AGHT+IH/TFbn7W1mQEbjCrdV/2h5sLcCOH1K0eH4Ck+xMOpl2R3wDka0yUYZQLCF/oPfrLvigXCDAw==
X-Received: by 2002:a17:902:dac1:b0:1c3:6667:5ff1 with SMTP id
 q1-20020a170902dac100b001c366675ff1mr10909508plx.27.1695068087721; 
 Mon, 18 Sep 2023 13:14:47 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:47 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:31 +1000
Message-ID: <20230918201404.3765-12-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 11/44] drm/nouveau/disp: shuffle to make
 upcoming diffs prettier
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

- preparing to move protocol-specific args out of acquire() again
- no code changes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvif/outp.c           | 106 +++++++++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  74 ++++++------
 2 files changed, 91 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 795658f0c920..eecccfc17c1c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -54,6 +54,28 @@ nvif_outp_dp_retrain(struct nvif_outp *outp)
 	return ret;
 }
 
+static inline int nvif_outp_acquire(struct nvif_outp *, u8, struct nvif_outp_acquire_v0 *);
+
+int
+nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
+		     int link_nr, int link_bw, bool hda, bool mst)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	args.dp.link_nr = link_nr;
+	args.dp.link_bw = link_bw;
+	args.dp.hda = hda;
+	args.dp.mst = mst;
+	memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DP, &args);
+	NVIF_ERRON(ret, &outp->object,
+		   "[ACQUIRE proto:DP link_nr:%d link_bw:%02x hda:%d mst:%d] or:%d link:%d",
+		   args.dp.link_nr, args.dp.link_bw, args.dp.hda, args.dp.mst, args.or, args.link);
+	return ret;
+}
+
 int
 nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 {
@@ -101,48 +123,26 @@ nvif_outp_infoframe(struct nvif_outp *outp, u8 type, struct nvif_outp_infoframe_
 	return ret;
 }
 
-void
-nvif_outp_release(struct nvif_outp *outp)
-{
-	int ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_RELEASE, NULL, 0);
-	NVIF_ERRON(ret, &outp->object, "[RELEASE]");
-	outp->or.id = -1;
-}
-
-static inline int
-nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
-{
-	int ret;
-
-	args->version = 0;
-	args->proto = proto;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
-	if (ret)
-		return ret;
-
-	outp->or.id = args->or;
-	outp->or.link = args->link;
-	return 0;
-}
-
 int
-nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-		     int link_nr, int link_bw, bool hda, bool mst)
+nvif_outp_acquire_tmds(struct nvif_outp *outp, int head,
+		       bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda)
 {
 	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	args.dp.link_nr = link_nr;
-	args.dp.link_bw = link_bw;
-	args.dp.hda = hda;
-	args.dp.mst = mst;
-	memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
+	args.tmds.head = head;
+	args.tmds.hdmi = hdmi;
+	args.tmds.hdmi_max_ac_packet = max_ac_packet;
+	args.tmds.hdmi_rekey = rekey;
+	args.tmds.hdmi_scdc = scdc;
+	args.tmds.hdmi_hda = hda;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DP, &args);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_TMDS, &args);
 	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:DP link_nr:%d link_bw:%02x hda:%d mst:%d] or:%d link:%d",
-		   args.dp.link_nr, args.dp.link_bw, args.dp.hda, args.dp.mst, args.or, args.link);
+		   "[ACQUIRE proto:TMDS head:%d hdmi:%d max_ac_packet:%d rekey:%d scdc:%d hda:%d]"
+		   " or:%d link:%d", args.tmds.head, args.tmds.hdmi, args.tmds.hdmi_max_ac_packet,
+		   args.tmds.hdmi_rekey, args.tmds.hdmi_scdc, args.tmds.hdmi_hda,
+		   args.or, args.link);
 	return ret;
 }
 
@@ -162,27 +162,29 @@ nvif_outp_acquire_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 	return ret;
 }
 
-int
-nvif_outp_acquire_tmds(struct nvif_outp *outp, int head,
-		       bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda)
+void
+nvif_outp_release(struct nvif_outp *outp)
+{
+	int ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_RELEASE, NULL, 0);
+	NVIF_ERRON(ret, &outp->object, "[RELEASE]");
+	outp->or.id = -1;
+}
+
+static inline int
+nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
 {
-	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	args.tmds.head = head;
-	args.tmds.hdmi = hdmi;
-	args.tmds.hdmi_max_ac_packet = max_ac_packet;
-	args.tmds.hdmi_rekey = rekey;
-	args.tmds.hdmi_scdc = scdc;
-	args.tmds.hdmi_hda = hda;
+	args->version = 0;
+	args->proto = proto;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_TMDS, &args);
-	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:TMDS head:%d hdmi:%d max_ac_packet:%d rekey:%d scdc:%d hda:%d]"
-		   " or:%d link:%d", args.tmds.head, args.tmds.hdmi, args.tmds.hdmi_max_ac_packet,
-		   args.tmds.hdmi_rekey, args.tmds.hdmi_scdc, args.tmds.hdmi_hda,
-		   args.or, args.link);
-	return ret;
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
+	if (ret)
+		return ret;
+
+	outp->or.id = args->or;
+	outp->or.link = args->link;
+	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 31b76f17fa70..d56a87ae5b26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -57,6 +57,23 @@ nvkm_uoutp_mthd_dp_retrain(struct nvkm_outp *outp, void *argv, u32 argc)
 	return outp->func->acquire(outp);
 }
 
+static int
+nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
+			   u8 link_nr, u8 link_bw, bool hda, bool mst)
+{
+	int ret;
+
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
+	if (ret)
+		return ret;
+
+	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
+	outp->dp.lt.nr = link_nr;
+	outp->dp.lt.bw = link_bw;
+	outp->dp.lt.mst = mst;
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -125,43 +142,6 @@ nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
 	return -EINVAL;
 }
 
-static int
-nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
-{
-	struct nvkm_head *head = outp->asy.head;
-	struct nvkm_ior *ior = outp->ior;
-	union nvif_outp_release_args *args = argv;
-
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-
-	if (ior->func->hdmi && head) {
-		ior->func->hdmi->infoframe_avi(ior, head->id, NULL, 0);
-		ior->func->hdmi->infoframe_vsi(ior, head->id, NULL, 0);
-		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
-	}
-
-	nvkm_outp_release(outp);
-	return 0;
-}
-
-static int
-nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-			   u8 link_nr, u8 link_bw, bool hda, bool mst)
-{
-	int ret;
-
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
-	if (ret)
-		return ret;
-
-	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
-	outp->dp.lt.nr = link_nr;
-	outp->dp.lt.bw = link_bw;
-	outp->dp.lt.mst = mst;
-	return 0;
-}
-
 static int
 nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_max_ac_packet,
 			     u8 hdmi_rekey, u8 hdmi_scdc, u8 hdmi_hda)
@@ -206,6 +186,26 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 }
 
+static int
+nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	struct nvkm_head *head = outp->asy.head;
+	struct nvkm_ior *ior = outp->ior;
+	union nvif_outp_release_args *args = argv;
+
+	if (argc != sizeof(args->vn))
+		return -ENOSYS;
+
+	if (ior->func->hdmi && head) {
+		ior->func->hdmi->infoframe_avi(ior, head->id, NULL, 0);
+		ior->func->hdmi->infoframe_vsi(ior, head->id, NULL, 0);
+		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
+	}
+
+	nvkm_outp_release(outp);
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 {
-- 
2.41.0

