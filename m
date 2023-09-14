Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046879FEC8
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABC10E531;
	Thu, 14 Sep 2023 08:47:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505E10E531
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-573ccec985dso538232a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681243; x=1695286043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D87fSjHM4u5cZbJ5wIQEQV/5UsF2hcdX5C+sovvZbzc=;
 b=CC5BISHPjglKAUUHMts2SErOAfUvqGwZY3GbPW0DJeCOPllVGTGsb9G+fO6oe4eOPB
 L4xVHvBx7LerpnJAWDg0YpWYvVizgehKxbWeHiOSbNe+ZMCJqZpl9v6AwbN/gphZZM10
 UthHdu3ZASzlQgAOlTAFHNHFHXTdq2S045WC9q2HhRcQyqJ11H2fXuMBdZ6WlpUjJwVx
 wot5rJ9pGmvk2tp1I9loUFn843MTiOftvUCWanIfijchQvUibw3gNtIlFyl8DKMgDB9j
 VZFQ3ac1np9S/LqZqQZh2mktapeNQuCilCtEF0y+Ern6/Kao4YFspw8xCMQEmW+YcKev
 53cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681243; x=1695286043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D87fSjHM4u5cZbJ5wIQEQV/5UsF2hcdX5C+sovvZbzc=;
 b=rzm45ifCfE6u8MMUoQvq5yqufYEH++tMsJE03urVT+opg3o19uYNXxi6IPuaBPSmpq
 StXQ+CZGr9EafWyChxuGqpQuo40wf8dgIXib9sTw4ffcbgT8HNSvWAbJzN1I4sp3gV91
 oWUR/WANYw3CrdcrZZZcb9CIfR1/hwmDpyAQtLiryTMXTXwmFGqo3vprFGm0qHXaTO1E
 pjNQvII3Sc6tjio1/8h80pFSLGlsfwhzvGVI5yKgUqEm7bwu6jsAwE2pv84haMonsgb9
 Jm0N4HDpNsEQB87VfpaNKRXsQN/Dy0kgalC/8NPrr8/6dacuQoYLYZpKUUAWqSkI1gVx
 xyYQ==
X-Gm-Message-State: AOJu0YyKe6Uw4W+2zafjuoEeCwmNW1a85PNN9ek/SEN3U7U2BzmjZvSA
 Uxn1i1amroL1276MuFZSHL8yNHa6SMA=
X-Google-Smtp-Source: AGHT+IFBL2J9Crk3tOX84+mv2kWQV47+8PZfcz2wCKA4l5iDTWkSK+pztM6OBcz6oJkr4CLSTho/Cg==
X-Received: by 2002:a05:6a20:3218:b0:148:6063:3273 with SMTP id
 hl24-20020a056a20321800b0014860633273mr3792800pzc.29.1694681242655; 
 Thu, 14 Sep 2023 01:47:22 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:22 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:52 +1000
Message-ID: <20230914084624.2299765-13-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 11/44] drm/nouveau/disp: shuffle to make upcoming
 diffs prettier
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

