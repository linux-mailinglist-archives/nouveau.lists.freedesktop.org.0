Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3197A5397
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2D10E0F5;
	Mon, 18 Sep 2023 20:14:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E2610E2EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:53 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso36040385ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068092; x=1695672892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/EP929fMCFsE+bNNAu35y0rZzp86ju9iUxMEHSTvtw=;
 b=aL407Blc2J7aTIW9Iq4oUjoVYYxgOl1scfPqcjPoyeWduGEalntAZN3C/5mNKZH5i9
 eaiqnPtSmIdiM0RgCHSnRO++QvB2xroiURVpI3bAikwO96X9D+syzRoL9Y2HsgW/0d4f
 ku+vuB4dKiMbilbjG0SOpJNRGAgM7VeK6vEGzh3+JQn8yTk+C7SUMjS+njjQD6NFSVH1
 e5bC10HjhtRUzEYNP3Wm7huSDGiJnJvUmn1v5oEsXT7MklKdya5jBuNp6KuR9E/YsDV6
 SJvMJKLvXcu3XfmlMLeh80+/fAgBFO1ig/L8T2PbLw84xAC/yPG/JgSaXGGrPqNtfL8A
 aCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068092; x=1695672892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/EP929fMCFsE+bNNAu35y0rZzp86ju9iUxMEHSTvtw=;
 b=DGUapCaIN3cEnUvzcQBn80Eg+wYhtonqaHuEz/JWb+0EC/rn8bfRHOu41M4lE6Rbki
 jEPdJnVMRFmZHAIsqlplSU9IuF5zxT43z0jsvEfHvNcmk6BzPYOlzA15tZT2sm7V5nwD
 3c7AN4KJYk5spO6i3+N+rhzgqjOXD7HVT9D0fhMo0yYdiPmvQ3B62WloS7PhybZ3AYKq
 DJXtnnz0eFTz4OSUVyJ20WfRIYRieckL+SXp4CL3+7p8rsMIN5d+f7pqY3/Yt/J8VBtc
 ucRoUB215hUHuvzgXdUqUBwzfjazN0T620/kJ8jIpeZUZklgq7WgNyrAKyb9/wFUV/Xd
 n0RA==
X-Gm-Message-State: AOJu0Yy4G0/DqxpaOu8X7hbWLtvPhxQEZhWRpU1sSstxZpvCjuvbD0QV
 QCIxo38QnAsR4V+h9DDRw8BegNHCio0=
X-Google-Smtp-Source: AGHT+IFnV979iWog3/9enjbA1qzt8CcDg2qKym889dLPp0gXtpW/6+a7Xx9CHVlN+9qccYABrKdUSA==
X-Received: by 2002:a17:902:cecb:b0:1b9:f7dc:b4f6 with SMTP id
 d11-20020a170902cecb00b001b9f7dcb4f6mr9033428plg.44.1695068092569; 
 Mon, 18 Sep 2023 13:14:52 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:52 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:33 +1000
Message-ID: <20230918201404.3765-14-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 13/44] drm/nouveau/disp: add acquire_sor/pior()
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

