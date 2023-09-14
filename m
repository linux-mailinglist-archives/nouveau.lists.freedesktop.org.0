Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75F79FEDB
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E5810E538;
	Thu, 14 Sep 2023 08:48:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4F10E53F
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:01 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so630503b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681280; x=1695286080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rATJA//i6S93W+D3tIL9VUoy7PEARXOl3A6MIdObfA=;
 b=kqa7wLFsZ7bAya6ju8jsk3aDGKmUiMI3jKhG5DpzK6fKGtDJ+Xb2t6P5PITwE9VH7G
 an4gfwB1aCOqQYNSBYV+LwF2/TpJLUUG3sAkQHUR6SZzuWSYXAgzBOdNjfxB39JqnJKW
 Ua9mqC+fZbufjGsDrmeDyw4kwFzWlWA+bELHPVig2G+jJuHHqoLCMuLPyW7WvtAcKi7a
 e2FrbExcfzTy/RFXzbH6kZPPJ5MeY8++WHVuwxwTBBGXA9Oe6Ux/+cCuvKPI1jLsPyys
 C3AbWFzABJDoRjjMddR4o/2FIHyo0gjS+qbdUDf8hnId8+GlAsVPEtNNKFQN9Tex8Ue7
 tuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681280; x=1695286080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rATJA//i6S93W+D3tIL9VUoy7PEARXOl3A6MIdObfA=;
 b=ev3Tl1IqvBSjt7mmj2faMves+Zm5l9EuiHusPtLdZp+R95C29Ixsv2m+7W1aq9LYTS
 +naTpkG4yflN5ISBiEwfKtRmkXhi0weMm8rN/TJLKCTEZg1XYyo4UHHWmV5OuKeIO7i8
 ile5I3WmgDo0U58GD1IEiTOXrqqJAmTsGIYJc9MAoAmzaEFlRsnRZgQc3Impp1gVfaQC
 i0xv8FOCvuDcCZMhIjEWCzX6zQYCPIoRs8D9CONqERU2uA2KPy8zpu7ElJNbxtzB+wVH
 hoTAYqtDUogUy7q8lcC7qSFX1G0w7pT0dvcA/dETKlEYqNG32G4YQxN7rxvGcESYcb0h
 I65w==
X-Gm-Message-State: AOJu0Yxd/xA75v/j7O3R9P9Rqh07k9Un9FO4ml2chmel8UZ9E1N8BpVX
 ra90iXyhXo6DGfMXie9PaByFB0L6QeE=
X-Google-Smtp-Source: AGHT+IGrfz+8k9xv34y3fvoYJBd7B5z/zW7yqyhWIVJEc+6969UzpqzsioXgcAiJ9OLoEpqaV3bLwQ==
X-Received: by 2002:a05:6a00:238c:b0:68e:36b1:3d7f with SMTP id
 f12-20020a056a00238c00b0068e36b13d7fmr5682900pfc.18.1694681280023; 
 Thu, 14 Sep 2023 01:48:00 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:59 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:09 +1000
Message-ID: <20230914084624.2299765-30-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 28/44] drm/nouveau/disp: add dp rates method
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

- moves building of link rates table from NVKM to DRM
- preparing to move link training out of supervisor

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  13 ++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   8 +
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 143 ++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  12 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           |  21 +++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  66 --------
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  24 +++
 8 files changed, 189 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 94f1e55b0ce6..ddc8e3d85823 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -33,6 +33,7 @@ union nvif_outp_args {
 
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
 #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
+#define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_RETRAIN    0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
@@ -194,6 +195,18 @@ union nvif_outp_dp_aux_xfer_args {
 	} v0;
 };
 
+union nvif_outp_dp_rates_args {
+	struct nvif_outp_dp_rates_v0 {
+		__u8  version;
+		__u8  pad01[6];
+		__u8  rates;
+		struct {
+			__s8  dpcd;
+			__u32 rate;
+		} rate[8];
+	} v0;
+};
+
 union nvif_outp_dp_retrain_args {
 	struct nvif_outp_dp_retrain_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index dd4dd0e2a7a1..596d543acd30 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -59,6 +59,14 @@ int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
 int nvif_outp_dp_aux_xfer(struct nvif_outp *, u8 type, u8 *size, u32 addr, u8 *data);
+
+struct nvif_outp_dp_rate {
+	int dpcd; /* -1 for non-indexed rates */
+	u32 rate;
+};
+
+int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int rate_nr);
+
 int nvif_outp_dp_retrain(struct nvif_outp *);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 01aa9b9c74a2..f26769bca195 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -42,6 +42,21 @@ nouveau_dp_has_sink_count(struct drm_connector *connector,
 	return drm_dp_read_sink_count_cap(connector, outp->dp.dpcd, &outp->dp.desc);
 }
 
+static bool
+nouveau_dp_probe_lttpr(struct nouveau_encoder *outp)
+{
+	u8 rev, size = sizeof(rev);
+	int ret;
+
+	ret = nvif_outp_dp_aux_xfer(&outp->outp, DP_AUX_NATIVE_READ, &size,
+				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
+				    &rev);
+	if (ret || size < sizeof(rev) || rev < 0x14)
+		return false;
+
+	return true;
+}
+
 static enum drm_connector_status
 nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		      struct nouveau_encoder *outp)
@@ -53,10 +68,99 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	int ret;
 	u8 *dpcd = outp->dp.dpcd;
 
+	outp->dp.lttpr.nr = 0;
+	outp->dp.rate_nr  = 0;
+	outp->dp.link_nr  = 0;
+	outp->dp.link_bw  = 0;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
+	    nouveau_dp_probe_lttpr(outp) &&
+	    !drm_dp_read_dpcd_caps(aux, dpcd) &&
+	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
+		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
+
+		if (nr > 0)
+			outp->dp.lttpr.nr = nr;
+	}
+
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);
 	if (ret < 0)
 		goto out;
 
+	outp->dp.link_nr = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
+	if (outp->dcb->dpconf.link_nr < outp->dp.link_nr)
+		outp->dp.link_nr = outp->dcb->dpconf.link_nr;
+
+	if (outp->dp.lttpr.nr) {
+		int links = drm_dp_lttpr_max_lane_count(outp->dp.lttpr.caps);
+
+		if (links && links < outp->dp.link_nr)
+			outp->dp.link_nr = links;
+	}
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP && dpcd[DP_DPCD_REV] >= 0x13) {
+		__le16 rates[DP_MAX_SUPPORTED_RATES];
+
+		ret = drm_dp_dpcd_read(aux, DP_SUPPORTED_LINK_RATES, rates, sizeof(rates));
+		if (ret == sizeof(rates)) {
+			for (int i = 0; i < ARRAY_SIZE(rates); i++) {
+				u32 rate = (le16_to_cpu(rates[i]) * 200) / 10;
+				int j;
+
+				if (!rate)
+					break;
+
+				for (j = 0; j < outp->dp.rate_nr; j++) {
+					if (rate > outp->dp.rate[j].rate) {
+						for (int k = outp->dp.rate_nr; k > j; k--)
+							outp->dp.rate[k] = outp->dp.rate[k - 1];
+						break;
+					}
+				}
+
+				outp->dp.rate[j].dpcd = i;
+				outp->dp.rate[j].rate = rate;
+				outp->dp.rate_nr++;
+			}
+		}
+	}
+
+	if (!outp->dp.rate_nr) {
+		const u32 rates[] = { 810000, 540000, 270000, 162000 };
+		u32 max_rate = dpcd[DP_MAX_LINK_RATE] * 27000;
+
+		if (outp->dp.lttpr.nr) {
+			int rate = drm_dp_lttpr_max_link_rate(outp->dp.lttpr.caps);
+
+			if (rate && rate < max_rate)
+				max_rate = rate;
+		}
+
+		max_rate = min_t(int, max_rate, outp->dcb->dpconf.link_bw);
+
+		for (int i = 0; i < ARRAY_SIZE(rates); i++) {
+			if (rates[i] <= max_rate) {
+				outp->dp.rate[outp->dp.rate_nr].dpcd = -1;
+				outp->dp.rate[outp->dp.rate_nr].rate = rates[i];
+				outp->dp.rate_nr++;
+			}
+		}
+
+		if (WARN_ON(!outp->dp.rate_nr))
+			goto out;
+	}
+
+	ret = nvif_outp_dp_rates(&outp->outp, outp->dp.rate, outp->dp.rate_nr);
+	if (ret)
+		goto out;
+
+	for (int i = 0; i < outp->dp.rate_nr; i++) {
+		u32 link_bw = outp->dp.rate[i].rate;
+
+		if (link_bw > outp->dp.link_bw)
+			outp->dp.link_bw = link_bw;
+	}
+
 	ret = drm_dp_read_desc(aux, &outp->dp.desc, drm_dp_is_branch(dpcd));
 	if (ret < 0)
 		goto out;
@@ -151,39 +255,14 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 		goto out;
 	}
 
-	nv_encoder->dp.link_bw = 27000 * dpcd[DP_MAX_LINK_RATE];
-	nv_encoder->dp.link_nr =
-		dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
-
-	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP && dpcd[DP_DPCD_REV] >= 0x13) {
-		struct drm_dp_aux *aux = &nv_connector->aux;
-		int ret, i;
-		u8 sink_rates[16];
-
-		ret = drm_dp_dpcd_read(aux, DP_SUPPORTED_LINK_RATES, sink_rates, sizeof(sink_rates));
-		if (ret == sizeof(sink_rates)) {
-			for (i = 0; i < ARRAY_SIZE(sink_rates); i += 2) {
-				int val = ((sink_rates[i + 1] << 8) | sink_rates[i]) * 200 / 10;
-				if (val && (i == 0 || val > nv_encoder->dp.link_bw))
-					nv_encoder->dp.link_bw = val;
-			}
-		}
-	}
-
-	NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
-		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw,
-		 dpcd[DP_DPCD_REV]);
-	NV_DEBUG(drm, "encoder: %dx%d\n",
-		 nv_encoder->dcb->dpconf.link_nr,
-		 nv_encoder->dcb->dpconf.link_bw);
-
-	if (nv_encoder->dcb->dpconf.link_nr < nv_encoder->dp.link_nr)
-		nv_encoder->dp.link_nr = nv_encoder->dcb->dpconf.link_nr;
-	if (nv_encoder->dcb->dpconf.link_bw < nv_encoder->dp.link_bw)
-		nv_encoder->dp.link_bw = nv_encoder->dcb->dpconf.link_bw;
+	NV_DEBUG(drm, "sink dpcd version: 0x%02x\n", dpcd[DP_DPCD_REV]);
+	for (int i = 0; i < nv_encoder->dp.rate_nr; i++)
+		NV_DEBUG(drm, "sink rate %d: %d\n", i, nv_encoder->dp.rate[i].rate);
 
-	NV_DEBUG(drm, "maximum: %dx%d\n",
-		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
+	NV_DEBUG(drm, "encoder: %dx%d\n", nv_encoder->dcb->dpconf.link_nr,
+					  nv_encoder->dcb->dpconf.link_bw);
+	NV_DEBUG(drm, "maximum: %dx%d\n", nv_encoder->dp.link_nr,
+					  nv_encoder->dp.link_bw);
 
 	if (mstm && mstm->can_mst) {
 		ret = nv50_mstm_detect(nv_encoder);
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index aacdf2814aba..123d0ecf5f58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -75,6 +75,17 @@ struct nouveau_encoder {
 
 		struct {
 			struct nv50_mstm *mstm;
+
+			struct {
+				u8 caps[DP_LTTPR_COMMON_CAP_SIZE];
+				u8 nr;
+			} lttpr;
+
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+			struct nvif_outp_dp_rate rate[8];
+			int rate_nr;
+
 			int link_nr;
 			int link_bw;
 
@@ -83,7 +94,6 @@ struct nouveau_encoder {
 			 */
 			struct mutex hpd_irq_lock;
 
-			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 			u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 			struct drm_dp_desc desc;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index df6e89379982..050d5cd303ad 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -76,6 +76,27 @@ nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 	return ret;
 }
 
+int
+nvif_outp_dp_rates(struct nvif_outp *outp, struct nvif_outp_dp_rate *rate, int rate_nr)
+{
+	struct nvif_outp_dp_rates_v0 args;
+	int ret;
+
+	if (rate_nr > ARRAY_SIZE(args.rate))
+		return -EINVAL;
+
+	args.version = 0;
+	args.rates = rate_nr;
+	for (int i = 0; i < args.rates; i++, rate++) {
+		args.rate[i].dpcd = rate->dpcd;
+		args.rate[i].rate = rate->rate;
+	}
+
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_RATES, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_RATES rates:%d]", args.rates);
+	return ret;
+}
+
 int
 nvif_outp_dp_aux_xfer(struct nvif_outp *outp, u8 type, u8 *psize, u32 addr, u8 *data)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 49fbb32f5022..af0f81a2834b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -615,48 +615,6 @@ nvkm_dp_acquire(struct nvkm_outp *outp)
 	return ret;
 }
 
-static bool
-nvkm_dp_enable_supported_link_rates(struct nvkm_outp *outp)
-{
-	u8 sink_rates[DPCD_RC10_SUPPORTED_LINK_RATES__SIZE];
-	int i, j, k;
-
-	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
-	    outp->dp.dpcd[DPCD_RC00_DPCD_REV] < 0x13 ||
-	    nvkm_rdaux(outp->dp.aux, DPCD_RC10_SUPPORTED_LINK_RATES(0),
-		       sink_rates, sizeof(sink_rates)))
-		return false;
-
-	for (i = 0; i < ARRAY_SIZE(sink_rates); i += 2) {
-		const u32 rate = ((sink_rates[i + 1] << 8) | sink_rates[i]) * 200 / 10;
-
-		if (!rate || WARN_ON(outp->dp.rates == ARRAY_SIZE(outp->dp.rate)))
-			break;
-
-		if (rate > outp->info.dpconf.link_bw * 27000) {
-			OUTP_DBG(outp, "rate %d !outp", rate);
-			continue;
-		}
-
-		for (j = 0; j < outp->dp.rates; j++) {
-			if (rate > outp->dp.rate[j].rate) {
-				for (k = outp->dp.rates; k > j; k--)
-					outp->dp.rate[k] = outp->dp.rate[k - 1];
-				break;
-			}
-		}
-
-		outp->dp.rate[j].dpcd = i / 2;
-		outp->dp.rate[j].rate = rate;
-		outp->dp.rates++;
-	}
-
-	for (i = 0; i < outp->dp.rates; i++)
-		OUTP_DBG(outp, "link_rate[%d] = %d", outp->dp.rate[i].dpcd, outp->dp.rate[i].rate);
-
-	return outp->dp.rates != 0;
-}
-
 /* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()
  * converted to work inside nvkm. This is a temporary holdover until we start
  * passing the drm_dp_aux device through NVKM
@@ -757,34 +715,10 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 		}
 
 		if (!nvkm_dp_read_dpcd_caps(outp)) {
-			const u8 rates[] = { 0x1e, 0x14, 0x0a, 0x06, 0 };
-			const u8 *rate;
-			int rate_max;
-
-			outp->dp.rates = 0;
 			outp->dp.links = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_MAX_LANE_COUNT;
 			outp->dp.links = min(outp->dp.links, outp->info.dpconf.link_nr);
 			if (outp->dp.lttprs && outp->dp.lttpr[4])
 				outp->dp.links = min_t(int, outp->dp.links, outp->dp.lttpr[4]);
-
-			rate_max = outp->dp.dpcd[DPCD_RC01_MAX_LINK_RATE];
-			rate_max = min(rate_max, outp->info.dpconf.link_bw);
-			if (outp->dp.lttprs && outp->dp.lttpr[1])
-				rate_max = min_t(int, rate_max, outp->dp.lttpr[1]);
-
-			if (!nvkm_dp_enable_supported_link_rates(outp)) {
-				for (rate = rates; *rate; rate++) {
-					if (*rate > rate_max)
-						continue;
-
-					if (WARN_ON(outp->dp.rates == ARRAY_SIZE(outp->dp.rate)))
-						break;
-
-					outp->dp.rate[outp->dp.rates].dpcd = -1;
-					outp->dp.rate[outp->dp.rates].rate = *rate * 27000;
-					outp->dp.rates++;
-				}
-			}
 		}
 	} else
 	if (!auxpwr && outp->dp.aux_pwr) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index a2391b224ea4..5cef5933e7f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -108,6 +108,7 @@ struct nvkm_outp_func {
 	struct {
 		int (*aux_pwr)(struct nvkm_outp *, bool pu);
 		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
+		int (*rates)(struct nvkm_outp *);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index cd92db9028a3..fd756e4599da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -70,6 +70,29 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_rates(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_rates_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (args->v0.rates > ARRAY_SIZE(outp->dp.rate))
+		return -EINVAL;
+
+	for (int i = 0; i < args->v0.rates; i++) {
+		outp->dp.rate[i].dpcd = args->v0.rate[i].dpcd;
+		outp->dp.rate[i].rate = args->v0.rate[i].rate;
+	}
+
+	outp->dp.rates = args->v0.rates;
+
+	if (outp->func->dp.rates)
+		outp->func->dp.rates(outp);
+
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_dp_aux_xfer(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -457,6 +480,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
+	case NVIF_OUTP_V0_DP_RATES   : return nvkm_uoutp_mthd_dp_rates   (outp, argv, argc);
 	default:
 		break;
 	}
-- 
2.41.0

