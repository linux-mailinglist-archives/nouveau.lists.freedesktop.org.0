Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79679FEDF
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F5610E541;
	Thu, 14 Sep 2023 08:48:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9610E541
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:10 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bf04263dc8so409308a34.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681289; x=1695286089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+C/Z7eQjeWc5NhPpLlTBq84rIeqsXdJ3BgntFqIwrA=;
 b=qWKINLO6qeiF5VyPmjUDn6+S7EqjYhZu7bUDeMY5A2LajdotEeFG5bN/MfilO3q8bx
 hKQ+//m9/3ghy7VpBM6o9xVF+JEywE7YaGUJduRymXiK4CpmblIPJLEYrwkVk7wT8efZ
 AawdYPOab0SputOsrrw1G+bEfD+3Cj03e8+CLvWCCbH6SrvoSpJ5vgAvFw/MRS0PT2P+
 g9yYxKznsNKPnq5x+J+5rc96Ia+WwdDfgLW5Ue+90h/kPU4EfNRZxfKJ2MBE/8G8TqcY
 TteiZKZr0pq3PIm0nsXvCWrJ3xJW1C/d1RLd7sajq44aVynbtFqy3hqd6uzKm6jMFRPq
 Fxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681289; x=1695286089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+C/Z7eQjeWc5NhPpLlTBq84rIeqsXdJ3BgntFqIwrA=;
 b=VdgDEw+d0zi36o9msDXRGZmWDLBBUU6NaO/Ii6ROt951Kxvj6zwAJSGWnQ4dk32v63
 ZSvwyAV/9BQsqmgoDqPlJzs4rW5ivVVgtpkDqivhn5iAWtOi/tC9A4mp1BGgUdu4TRT5
 LV1NlLv9VPPL3FBnr9LkVhRCvAlTm6Voo/vREGUrYNJK6Gldi2VPUdGkWVz+zyeHx7+m
 Nx0ez9kr+uK8K5KHqBUo4ZqR2YAoyk4rYW9BmGILnLUdEUqSBc1hP6JAa2NCtb8O6ID+
 /jYN7F84GjAbsWTm+XpfA9Qx3+XKgOOiwFwSYD4qfo/y35+x4wts0+w/E9/S/dUWy/Op
 ueWA==
X-Gm-Message-State: AOJu0YwHdA/+kQk1Z3hXU7nUdUz/0yLm5OoSugjTshyNvJx219kOUqlC
 ZH0qsL6hSvwXdx65ILvh+TBzIjANwnU=
X-Google-Smtp-Source: AGHT+IE2ify4/bmJjX2X7XCwo4jL82TbV08z0xzP64PYHO51RMMddVUgzY7ffjG2x0fB9GhN8CKMfA==
X-Received: by 2002:a05:6830:1250:b0:6b7:1fcd:1e22 with SMTP id
 s16-20020a056830125000b006b71fcd1e22mr5180120otp.29.1694681288689; 
 Thu, 14 Sep 2023 01:48:08 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:08 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:13 +1000
Message-ID: <20230914084624.2299765-34-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 32/44] drm/nouveau/disp: add dp train method
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

- passes DPCD information from DRM to NVKM
- removes NVKM's own sink caps handling
- link still trained from supervisor, more patches to come

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   6 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  25 ++--
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   7 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  75 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |   7 ++
 drivers/gpu/drm/nouveau/nvif/outp.c           |  38 +++---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 118 +++---------------
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  41 +++---
 9 files changed, 143 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index be4c45fd3999..9cce1323338b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1036,7 +1036,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 
 	if (!mstm->links++) {
 		nvif_outp_acquire_sor(&mstm->outp->outp, false /*TODO: MST audio... */);
-		nvif_outp_acquire_dp(&mstm->outp->outp, mstm->outp->dp.dpcd, 0, 0, false, true);
+		nouveau_dp_train(mstm->outp, true, 0, 0);
 	}
 
 	if (mstm->outp->outp.or.link & 1)
@@ -1659,7 +1659,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		nvif_outp_lvds(&nv_encoder->outp, lvds_dual, lvds_8bpc);
 		break;
 	case DCB_OUTPUT_DP:
-		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, hda, false);
+		nouveau_dp_train(nv_encoder, false, mode->clock, asyh->or.bpc);
 		depth = nv50_dp_bpc_to_depth(asyh->or.bpc);
 
 		if (nv_encoder->outp.or.link & 1)
@@ -1850,7 +1850,7 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		break;
 	case DCB_OUTPUT_DP:
 		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
-		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
+		nouveau_dp_train(nv_encoder, false, asyh->state.adjusted_mode.clock, 6);
 		break;
 	default:
 		BUG();
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index ddc8e3d85823..14972b942be7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -34,7 +34,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
 #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RATES      0x72
-#define NVIF_OUTP_V0_DP_RETRAIN    0x73
+#define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -71,7 +71,6 @@ union nvif_outp_acquire_args {
 #define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
 #define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
 #define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
-#define NVIF_OUTP_ACQUIRE_V0_DP      0x04
 		__u8 type;
 		__u8 or;
 		__u8 link;
@@ -80,14 +79,6 @@ union nvif_outp_acquire_args {
 			struct {
 				__u8 hda;
 			} sor;
-			struct {
-				__u8 link_nr; /* 0 = highest possible. */
-				__u8 link_bw; /* 0 = highest possible, DP BW code otherwise. */
-				__u8 hda;
-				__u8 mst;
-				__u8 pad04[4];
-				__u8 dpcd[DP_RECEIVER_CAP_SIZE];
-			} dp;
 		};
 	} v0;
 };
@@ -207,9 +198,17 @@ union nvif_outp_dp_rates_args {
 	} v0;
 };
 
-union nvif_outp_dp_retrain_args {
-	struct nvif_outp_dp_retrain_vn {
-	} vn;
+union nvif_outp_dp_train_args {
+	struct nvif_outp_dp_train_v0 {
+		__u8  version;
+		__u8  retrain;
+		__u8  mst;
+		__u8  lttprs;
+		__u8  post_lt_adj;
+		__u8  link_nr;
+		__u32 link_bw;
+		__u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	} v0;
 };
 
 union nvif_outp_dp_mst_vcpi_args {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 596d543acd30..9a78483e0289 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -31,8 +31,6 @@ int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_dac(struct nvif_outp *);
 int nvif_outp_acquire_sor(struct nvif_outp *, bool hda);
 int nvif_outp_acquire_pior(struct nvif_outp *);
-int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-			 int link_nr, int link_bw, bool hda, bool mst);
 int nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out);
 int nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out);
 int nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out);
@@ -66,8 +64,9 @@ struct nvif_outp_dp_rate {
 };
 
 int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int rate_nr);
-
-int nvif_outp_dp_retrain(struct nvif_outp *);
+int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
+		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
+		       bool retrain);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 1c0b992fe241..9280daf32534 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,8 +79,21 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr > 0)
-			outp->dp.lttpr.nr = nr;
+		if (nr) {
+			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
+						DP_PHY_REPEATER_MODE_TRANSPARENT);
+
+			if (nr > 0) {
+				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
+							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
+				if (ret != 1) {
+					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
+								DP_PHY_REPEATER_MODE_TRANSPARENT);
+				} else {
+					outp->dp.lttpr.nr = nr;
+				}
+			}
+		}
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);
@@ -291,23 +304,71 @@ nouveau_dp_power_down(struct nouveau_encoder *outp)
 	int ret;
 	u8 pwr;
 
+	mutex_lock(&outp->dp.hpd_irq_lock);
+
 	ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 	if (ret == 1) {
 		pwr &= ~DP_SET_POWER_MASK;
 		pwr |=  DP_SET_POWER_D3;
 		drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
 	}
+
+	outp->dp.lt.nr = 0;
+	mutex_unlock(&outp->dp.hpd_irq_lock);
+}
+
+static bool
+nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
+{
+	int ret;
+
+	ret = nvif_outp_dp_train(&outp->outp, outp->dp.dpcd,
+					      outp->dp.lttpr.nr,
+					      outp->dp.lt.nr,
+					      outp->dp.lt.bw,
+					      outp->dp.lt.mst,
+					      false,
+					      retrain);
+
+	return ret == 0;
 }
 
 bool
-nouveau_dp_link_check(struct nouveau_connector *nv_connector)
+nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
 {
-	struct nouveau_encoder *nv_encoder = find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
+	bool ret;
 
-	if (!nv_encoder || nv_encoder->outp.or.id < 0)
-		return true;
+	mutex_lock(&outp->dp.hpd_irq_lock);
+
+	outp->dp.lt.nr = outp->dp.link_nr;
+	outp->dp.lt.bw = 0;
+	outp->dp.lt.mst = mst;
+	ret = nouveau_dp_train_link(outp, false);
+
+	mutex_unlock(&outp->dp.hpd_irq_lock);
+	return ret;
+}
+
+static bool
+nouveau_dp_link_check_locked(struct nouveau_encoder *outp)
+{
+	return nouveau_dp_train_link(outp, true);
+}
+
+bool
+nouveau_dp_link_check(struct nouveau_connector *nv_connector)
+{
+	struct nouveau_encoder *outp = nv_connector->dp_encoder;
+	bool link_ok = true;
+
+	if (outp) {
+		mutex_lock(&outp->dp.hpd_irq_lock);
+		if (outp->dp.lt.nr)
+			link_ok = nouveau_dp_link_check_locked(outp);
+		mutex_unlock(&outp->dp.hpd_irq_lock);
+	}
 
-	return nvif_outp_dp_retrain(&nv_encoder->outp) == 0;
+	return link_ok;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index ed31db58176c..333042fc493f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -89,6 +89,12 @@ struct nouveau_encoder {
 			int link_nr;
 			int link_bw;
 
+			struct {
+				bool mst;
+				u8   nr;
+				u32  bw;
+			} lt;
+
 			/* Protects DP state that needs to be accessed outside
 			 * connector reprobing contexts
 			 */
@@ -155,6 +161,7 @@ enum nouveau_dp_status {
 };
 
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
+bool nouveau_dp_train(struct nouveau_encoder *, bool mst, u32 khz, u8 bpc);
 void nouveau_dp_power_down(struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 050d5cd303ad..7ffd57d82f89 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -47,32 +47,26 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 }
 
 int
-nvif_outp_dp_retrain(struct nvif_outp *outp)
+nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
+		   u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
 {
-	int ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_RETRAIN, NULL, 0);
-	NVIF_ERRON(ret, &outp->object, "[DP_RETRAIN]");
-	return ret;
-}
-
-static inline int nvif_outp_acquire(struct nvif_outp *, u8, struct nvif_outp_acquire_v0 *);
-
-int
-nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-		     int link_nr, int link_bw, bool hda, bool mst)
-{
-	struct nvif_outp_acquire_v0 args;
+	struct nvif_outp_dp_train_v0 args;
 	int ret;
 
-	args.dp.link_nr = link_nr;
-	args.dp.link_bw = link_bw;
-	args.dp.hda = hda;
-	args.dp.mst = mst;
-	memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
-
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DP, &args);
+	args.version = 0;
+	args.retrain = retrain;
+	args.mst = mst;
+	args.lttprs = lttprs;
+	args.post_lt_adj = post_lt_adj;
+	args.link_nr = link_nr;
+	args.link_bw = link_bw;
+	memcpy(args.dpcd, dpcd, sizeof(args.dpcd));
+
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_TRAIN, &args, sizeof(args));
 	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:DP link_nr:%d link_bw:%02x hda:%d mst:%d] or:%d link:%d",
-		   args.dp.link_nr, args.dp.link_bw, args.dp.hda, args.dp.mst, args.or, args.link);
+		   "[DP_TRAIN retrain:%d mst:%d lttprs:%d post_lt_adj:%d nr:%d bw:%d]",
+		   args.retrain, args.mst, args.lttprs, args.post_lt_adj, args.link_nr,
+		   args.link_bw);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index af0f81a2834b..b59cd2d4550f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -303,26 +303,13 @@ nvkm_dp_train_link(struct nvkm_outp *outp, int rate)
 	struct lt_state lt = {
 		.outp = outp,
 		.pc2 = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_TPS3_SUPPORTED,
+		.repeaters = outp->dp.lttprs,
 	};
-	u8 sink[2], data;
+	u8 sink[2];
 	int ret;
 
 	OUTP_DBG(outp, "training %dx%02x", ior->dp.nr, ior->dp.bw);
 
-	/* Select LTTPR non-transparent mode if we have a valid configuration,
-	 * use transparent mode otherwise.
-	 */
-	if (outp->dp.lttpr[0] >= 0x14) {
-		data = DPCD_LTTPR_MODE_TRANSPARENT;
-		nvkm_wraux(outp->dp.aux, DPCD_LTTPR_MODE, &data, sizeof(data));
-
-		if (outp->dp.lttprs) {
-			data = DPCD_LTTPR_MODE_NON_TRANSPARENT;
-			nvkm_wraux(outp->dp.aux, DPCD_LTTPR_MODE, &data, sizeof(data));
-			lt.repeaters = outp->dp.lttprs;
-		}
-	}
-
 	/* Set desired link configuration on the sink. */
 	sink[0] = (outp->dp.rate[rate].dpcd < 0) ? ior->dp.bw : 0;
 	sink[1] = ior->dp.nr;
@@ -467,6 +454,19 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
 	}
 }
 
+static int
+nvkm_dp_train_(struct nvkm_outp *outp, bool retrain)
+{
+	if (retrain) {
+		if (!atomic_read(&outp->dp.lt.done))
+			return 0;
+
+		return outp->func->acquire(outp);
+	}
+
+	return 0;
+}
+
 static int
 nvkm_dp_train(struct nvkm_outp *outp, u32 dataKBps)
 {
@@ -501,19 +501,6 @@ nvkm_dp_train(struct nvkm_outp *outp, u32 dataKBps)
 	OUTP_DBG(outp, "training");
 	nvkm_dp_train_init(outp);
 
-	/* Validate and train at configuration requested (if any) on ACQUIRE. */
-	if (outp->dp.lt.nr) {
-		for (nr = outp->dp.links; ret < 0 && nr; nr >>= 1) {
-			for (rate = 0; nr == outp->dp.lt.nr && rate < outp->dp.rates; rate++) {
-				if (outp->dp.rate[rate].rate / 27000 == outp->dp.lt.bw) {
-					ior->dp.bw = outp->dp.rate[rate].rate / 27000;
-					ior->dp.nr = nr;
-					ret = nvkm_dp_train_links(outp, rate);
-				}
-			}
-		}
-	}
-
 	/* Otherwise, loop through all valid link configurations that support the data rate. */
 	for (nr = outp->dp.links; ret < 0 && nr; nr >>= 1) {
 		for (rate = 0; ret < 0 && rate < outp->dp.rates; rate++) {
@@ -615,50 +602,6 @@ nvkm_dp_acquire(struct nvkm_outp *outp)
 	return ret;
 }
 
-/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()
- * converted to work inside nvkm. This is a temporary holdover until we start
- * passing the drm_dp_aux device through NVKM
- */
-static int
-nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
-{
-	struct nvkm_i2c_aux *aux = outp->dp.aux;
-	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
-	int ret;
-
-	ret = nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_RECEIVER_CAP_SIZE);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * Prior to DP1.3 the bit represented by
-	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
-	 * If it is set DP_DPCD_REV at 0000h could be at a value less than
-	 * the true capability of the panel. The only way to check is to
-	 * then compare 0000h and 2200h.
-	 */
-	if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
-	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
-		return 0;
-
-	ret = nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd_ext));
-	if (ret < 0)
-		return ret;
-
-	if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
-		OUTP_DBG(outp, "Extended DPCD rev less than base DPCD rev (%d > %d)\n",
-			 outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
-		return 0;
-	}
-
-	if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
-		return 0;
-
-	memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
-
-	return 0;
-}
-
 void
 nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 {
@@ -690,36 +633,6 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 		OUTP_DBG(outp, "aux power -> always");
 		nvkm_i2c_aux_monitor(aux, true);
 		outp->dp.aux_pwr = true;
-
-		/* Detect any LTTPRs before reading DPCD receiver caps. */
-		if (!nvkm_rdaux(aux, DPCD_LTTPR_REV, outp->dp.lttpr, sizeof(outp->dp.lttpr)) &&
-		    outp->dp.lttpr[0] >= 0x14 && outp->dp.lttpr[2]) {
-			switch (outp->dp.lttpr[2]) {
-			case 0x80: outp->dp.lttprs = 1; break;
-			case 0x40: outp->dp.lttprs = 2; break;
-			case 0x20: outp->dp.lttprs = 3; break;
-			case 0x10: outp->dp.lttprs = 4; break;
-			case 0x08: outp->dp.lttprs = 5; break;
-			case 0x04: outp->dp.lttprs = 6; break;
-			case 0x02: outp->dp.lttprs = 7; break;
-			case 0x01: outp->dp.lttprs = 8; break;
-			default:
-				/* Unknown LTTPR count, we'll switch to transparent mode. */
-				WARN_ON(1);
-				outp->dp.lttprs = 0;
-				break;
-			}
-		} else {
-			/* No LTTPR support, or zero LTTPR count - don't touch it at all. */
-			memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lttpr));
-		}
-
-		if (!nvkm_dp_read_dpcd_caps(outp)) {
-			outp->dp.links = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_MAX_LANE_COUNT;
-			outp->dp.links = min(outp->dp.links, outp->info.dpconf.link_nr);
-			if (outp->dp.lttprs && outp->dp.lttpr[4])
-				outp->dp.links = min_t(int, outp->dp.links, outp->dp.lttpr[4]);
-		}
 	} else
 	if (!auxpwr && outp->dp.aux_pwr) {
 		OUTP_DBG(outp, "aux power -> demand");
@@ -771,6 +684,7 @@ nvkm_dp_func = {
 	.bl.set = nvkm_outp_bl_set,
 	.dp.aux_pwr = nvkm_dp_aux_pwr,
 	.dp.aux_xfer = nvkm_dp_aux_xfer,
+	.dp.train = nvkm_dp_train_,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 5cef5933e7f2..5ac4cf596bc3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -58,6 +58,7 @@ struct nvkm_outp {
 				u8 nr;
 				u8 bw;
 				bool mst;
+				bool post_adj;
 			} lt;
 		} dp;
 	};
@@ -109,6 +110,7 @@ struct nvkm_outp_func {
 		int (*aux_pwr)(struct nvkm_outp *, bool pu);
 		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
 		int (*rates)(struct nvkm_outp *);
+		int (*train)(struct nvkm_outp *, bool retrain);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index fd756e4599da..16a1536d13aa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -46,28 +46,26 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_retrain(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
 {
-	union nvif_outp_dp_retrain_args *args = argv;
+	union nvif_outp_dp_train_args *args = argv;
 
-	if (argc != sizeof(args->vn))
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
+	if (!outp->func->dp.train)
+		return -EINVAL;
 
-	if (!atomic_read(&outp->dp.lt.done))
-		return 0;
-
-	return outp->func->acquire(outp);
-}
+	if (!args->v0.retrain) {
+		memcpy(outp->dp.dpcd, args->v0.dpcd, sizeof(outp->dp.dpcd));
+		outp->dp.lttprs = args->v0.lttprs;
+		outp->dp.links = args->v0.link_nr;
+		outp->dp.lt.nr = 0;
+		outp->dp.lt.bw = 0;
+		outp->dp.lt.mst = args->v0.mst;
+		outp->dp.lt.post_adj = args->v0.post_lt_adj;
+	}
 
-static int
-nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
-			   u8 link_nr, u8 link_bw, bool hda, bool mst)
-{
-	memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
-	outp->dp.lt.nr = link_nr;
-	outp->dp.lt.bw = link_bw;
-	outp->dp.lt.mst = mst;
-	return 0;
+	return outp->func->dp.train(outp, args->v0.retrain);
 }
 
 static int
@@ -304,13 +302,6 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	case NVIF_OUTP_ACQUIRE_V0_SOR:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
 		break;
-	case NVIF_OUTP_ACQUIRE_V0_DP:
-		ret = nvkm_uoutp_mthd_acquire_dp(outp, args->v0.dp.dpcd,
-						       args->v0.dp.link_nr,
-						       args->v0.dp.link_bw,
-						       args->v0.dp.hda != 0,
-						       args->v0.dp.mst != 0);
-		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -458,7 +449,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
-	case NVIF_OUTP_V0_DP_RETRAIN   : return nvkm_uoutp_mthd_dp_retrain   (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

