Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797879FECA
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5EC10E530;
	Thu, 14 Sep 2023 08:47:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337CF10E536
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:28 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-69002ef0104so535062b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681247; x=1695286047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/2kDT+NNHS9BvIgH4vtJFKaIhrtrU+t+EJcinn4gBo=;
 b=rmHdL8aYRUjemZQUDj04o2qNd+3R2EmldEfa7SBtVMrLcmDwimGRBlhiohiFEojKip
 lxufNrMRDcR5D6z+Uwia38o5XLlL5fgNzNM2dtFs3iHvJRmAO0RHmp2wO/i6CuwHV7TN
 PfV59PIVsp6OQ2obdbTfpmpQKyUTHSLG0NzEHfoU+mNLgw8smFuo2B4eQa93dWS8bnfO
 fc9D5kd2xbt7Wbj6HQzYkO9WkdPaU+pCixpD64ZXPZzYJtL9EUElTJvmbpfea4y9JZFl
 VwBPrhnhGmdIhUNPvmabwQJzy57A6YOtBnGNyge4pMU9c+v2YY9eX9VKlnd6kwORi/Km
 oy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681247; x=1695286047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/2kDT+NNHS9BvIgH4vtJFKaIhrtrU+t+EJcinn4gBo=;
 b=MLLF527PWsIZBgEe28zlFpmqEk695Rr2SPZvvYR9lL8LAxUT6pXyNYx9+bxbTj5r3A
 DysKQEQlS2O48QzYQn1JglrrC5XWkygll48SW9KgPFaF1xm1Ft4e/qOAI5n/RkfL+60a
 AOFEra4d2WgHwY5ceX24PHEKbWGjdAs/fw1aSmJw/r7OTsTl3W1yQJAMIMdpHcQrrWVO
 d0R5LJnbge5MwAkQbeY5Ffxyye5J7yHyMt8Dt2Ejscj6TOpgzvsNvM2d6RcNBpQWAQzm
 MLEziC3nEzeBBoseoD1tcG3RV93DG8tVvDaL5H9kcQFlbzey8JJgzlbmZ7RIezj1tM5X
 Gg6Q==
X-Gm-Message-State: AOJu0YzjcOlPWj0tejPvbOLyYAx7seivv2vyfanvt9HtOTyO+2buqkde
 haXQDlfoMiYbPVXGREp8dLN0UyQmUQA=
X-Google-Smtp-Source: AGHT+IE0clDCiNJcxWaqdB569epyuj+TI0BPQVvADQs2U34Y0vipfN3W4cXO6O+VNqG+OjtSETSiFQ==
X-Received: by 2002:a05:6a20:5481:b0:13d:8876:4c97 with SMTP id
 i1-20020a056a20548100b0013d88764c97mr5804606pzk.16.1694681246997; 
 Thu, 14 Sep 2023 01:47:26 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:26 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:54 +1000
Message-ID: <20230914084624.2299765-15-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 13/44] drm/nouveau/disp: add acquire_sor/pior()
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
- avoid re-acquiring acquired output, will matter when enforced later
- sor/pior done at same time due to shared tmds/dp handling

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 15 ++++++----
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  7 ++++-
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nvif/outp.c           | 24 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 28 ++++++-------------
 5 files changed, 50 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9339971aa90b..4c54c46bb451 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1032,7 +1032,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		return;
 
 	if (!mstm->links++) {
-		/*XXX: MST audio. */
+		nvif_outp_acquire_sor(&mstm->outp->outp, false /*TODO: MST audio... */);
 		nvif_outp_acquire_dp(&mstm->outp->outp, mstm->outp->dp.dpcd, 0, 0, false, true);
 	}
 
@@ -1600,15 +1600,17 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
+	    nv_encoder->dcb->type != DCB_OUTPUT_LVDS &&
 	    drm_detect_monitor_audio(nv_connector->edid))
 		hda = true;
 
+	if (!nvif_outp_acquired(outp))
+		nvif_outp_acquire_sor(outp, hda);
+
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
-		if (disp->disp->object.oclass == NV50_DISP ||
-		    !drm_detect_hdmi_monitor(nv_connector->edid))
-			nvif_outp_acquire_tmds(outp, nv_crtc->index, false, 0, 0, 0, false);
-		else
+		if (disp->disp->object.oclass != NV50_DISP &&
+		    drm_detect_hdmi_monitor(nv_connector->edid))
 			nv50_hdmi_enable(encoder, nv_crtc, nv_connector, state, mode, hda);
 
 		if (nv_encoder->outp.or.link & 1) {
@@ -1848,6 +1850,9 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	default: asyh->or.depth = NV837D_PIOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT; break;
 	}
 
+	if (!nvif_outp_acquired(&nv_encoder->outp))
+		nvif_outp_acquire_pior(&nv_encoder->outp);
+
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_TMDS:
 		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index d139d070c0bc..57bc4b2f2b17 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -60,7 +60,9 @@ union nvif_outp_acquire_args {
 	struct nvif_outp_acquire_v0 {
 		__u8 version;
 #define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
-#define NVIF_OUTP_ACQUIRE_V0_TMDS    0x02
+#define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
+#define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
+#define NVIF_OUTP_ACQUIRE_V0_TMDS    0x05
 #define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
 		__u8 type;
@@ -68,6 +70,9 @@ union nvif_outp_acquire_args {
 		__u8 link;
 		__u8 pad04[4];
 		union {
+			struct {
+				__u8 hda;
+			} sor;
 			struct {
 				__u8 head;
 				__u8 hdmi;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index c6d8823ef782..a9090424dbf7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -29,6 +29,8 @@ int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_dac(struct nvif_outp *);
+int nvif_outp_acquire_sor(struct nvif_outp *, bool hda);
+int nvif_outp_acquire_pior(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 41c4de40895f..81dbda52117e 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -187,6 +187,30 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 type, struct nvif_outp_acquire_v0 *
 	return 0;
 }
 
+int
+nvif_outp_acquire_pior(struct nvif_outp *outp)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_PIOR, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE PIOR] or:%d", args.or);
+	return ret;
+}
+
+int
+nvif_outp_acquire_sor(struct nvif_outp *outp, bool hda)
+{
+	struct nvif_outp_acquire_v0 args;
+	int ret;
+
+	args.sor.hda = hda;
+
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_SOR, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE SOR] or:%d link:%d", args.or, args.link);
+	return ret;
+}
+
 int
 nvif_outp_acquire_dac(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 73c6227446fb..d71bc188047e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -61,12 +61,6 @@ static int
 nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			   u8 link_nr, u8 link_bw, bool hda, bool mst)
 {
-	int ret;
-
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
-	if (ret)
-		return ret;
-
 	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
 	outp->dp.lt.nr = link_nr;
 	outp->dp.lt.bw = link_bw;
@@ -146,25 +140,16 @@ static int
 nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_max_ac_packet,
 			     u8 hdmi_rekey, u8 hdmi_scdc, u8 hdmi_hda)
 {
-	struct nvkm_ior *ior;
-	int ret;
+	struct nvkm_ior *ior = outp->ior;
 
 	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
 		return -EINVAL;
 
-	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
-	if (ret)
-		return ret;
-
-	ior = outp->ior;
-
 	if (hdmi) {
 		if (!ior->func->hdmi ||
 		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
-		    (hdmi_scdc && !ior->func->hdmi->scdc)) {
-			nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+		    (hdmi_scdc && !ior->func->hdmi->scdc))
 			return -EINVAL;
-		}
 
 		ior->func->hdmi->ctrl(ior, head, hdmi, hdmi_max_ac_packet, hdmi_rekey);
 		if (ior->func->hdmi->scdc)
@@ -182,8 +167,7 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 
 	outp->lvds.dual = dual;
 	outp->lvds.bpc8 = bpc8;
-
-	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
+	return 0;
 }
 
 static int
@@ -214,13 +198,17 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
-	if (outp->ior)
+	if (outp->ior && args->v0.type <= NVIF_OUTP_ACQUIRE_V0_PIOR)
 		return -EBUSY;
 
 	switch (args->v0.type) {
 	case NVIF_OUTP_ACQUIRE_V0_DAC:
+	case NVIF_OUTP_ACQUIRE_V0_PIOR:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
+	case NVIF_OUTP_ACQUIRE_V0_SOR:
+		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
+		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
 		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
 							 args->v0.tmds.hdmi,
-- 
2.41.0

