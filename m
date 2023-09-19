Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB1C7A6E39
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECC310E3FB;
	Tue, 19 Sep 2023 22:07:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FDE10E3FE
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yjnxfFvckEYAA2qBlohCNJ997BS4tPHFSvsjsrS6Xo=;
 b=AatiqOrqsDkuihXj0N5fT9fGudZK00MUdD3CBFwplFnJVDeTq/AfFHuwXix1ODxp0ewXY3
 Cmw3yVXhF2ovBet6YnfGiWOPW6KZKuVjPOrU0B/gcvkAzxd9pFAkG9MjAULF5W162Gq/xt
 toedQT3HvFd8v3eXMJiS0AY2jR8n3No=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-N5eiKs4qMt6oM9kaSS9aNw-1; Tue, 19 Sep 2023 18:07:15 -0400
X-MC-Unique: N5eiKs4qMt6oM9kaSS9aNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 246F8185A790;
 Tue, 19 Sep 2023 22:07:15 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD64740C2064;
 Tue, 19 Sep 2023 22:07:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:28 -0400
Message-ID: <20230919220442.202488-34-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 33/44] drm/nouveau/disp: move link training out
 of supervisor
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
Cc: Kees Cook <keescook@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  11 ++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   1 +
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 122 ++++++++++++++-
 drivers/gpu/drm/nouveau/nvif/outp.c           |  16 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 148 +++++-------------
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |  13 --
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  18 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   8 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  27 +++-
 9 files changed, 218 insertions(+), 146 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 14972b942be7e..00ce0a46c152b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -35,6 +35,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
+#define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -211,6 +212,16 @@ union nvif_outp_dp_train_args {
 	} v0;
 };
 
+union nvif_outp_dp_drive_args {
+	struct nvif_outp_dp_drive_v0 {
+		__u8  version;
+		__u8  pad01[2];
+		__u8  lanes;
+		__u8  pe[4];
+		__u8  vs[4];
+	} v0;
+};
+
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 9a78483e0289d..b4f97fabecbdc 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -67,6 +67,7 @@ int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int r
 int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
 		       bool retrain);
+int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 9280daf325341..7de7707ec6a89 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -320,15 +320,83 @@ nouveau_dp_power_down(struct nouveau_encoder *outp)
 static bool
 nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
 {
-	int ret;
+	struct drm_dp_aux *aux = &outp->conn->aux;
+	bool post_lt = false;
+	int ret, retries = 0;
+
+	if ( (outp->dp.dpcd[DP_MAX_LANE_COUNT] & 0x20) &&
+	    !(outp->dp.dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED))
+	    post_lt = true;
 
+retry:
 	ret = nvif_outp_dp_train(&outp->outp, outp->dp.dpcd,
 					      outp->dp.lttpr.nr,
 					      outp->dp.lt.nr,
 					      outp->dp.lt.bw,
 					      outp->dp.lt.mst,
-					      false,
+					      post_lt,
 					      retrain);
+	if (ret)
+		return false;
+
+	if (post_lt) {
+		u8 stat[DP_LINK_STATUS_SIZE];
+		u8 prev[2];
+		u8 time = 0, adjusts = 0, tmp;
+
+		ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
+		if (ret)
+			return false;
+
+		for (;;) {
+			if (!drm_dp_channel_eq_ok(stat, outp->dp.lt.nr)) {
+				ret = 1;
+				break;
+			}
+
+			if (!(stat[2] & 0x02))
+				break;
+
+			msleep(5);
+			time += 5;
+
+			memcpy(prev, &stat[4], sizeof(prev));
+			ret = drm_dp_dpcd_read_phy_link_status(aux, DP_PHY_DPRX, stat);
+			if (ret)
+				break;
+
+			if (!memcmp(prev, &stat[4], sizeof(prev))) {
+				if (time > 200)
+					break;
+			} else {
+				u8 pe[4], vs[4];
+
+				if (adjusts++ == 6)
+					break;
+
+				for (int i = 0; i < outp->dp.lt.nr; i++) {
+					pe[i] = drm_dp_get_adjust_request_pre_emphasis(stat, i) >>
+							DP_TRAIN_PRE_EMPHASIS_SHIFT;
+					vs[i] = drm_dp_get_adjust_request_voltage(stat, i) >>
+							DP_TRAIN_VOLTAGE_SWING_SHIFT;
+				}
+
+				ret = nvif_outp_dp_drive(&outp->outp, outp->dp.lt.nr, pe, vs);
+				if (ret)
+					break;
+
+				time = 0;
+			}
+		}
+
+		if (drm_dp_dpcd_readb(aux, DP_LANE_COUNT_SET, &tmp) == 1) {
+			tmp &= ~0x20;
+			drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, tmp);
+		}
+	}
+
+	if (ret == 1 && retries++ < 3)
+		goto retry;
 
 	return ret == 0;
 }
@@ -336,15 +404,44 @@ nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
 bool
 nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
 {
-	bool ret;
+	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
+	struct drm_dp_aux *aux = &outp->conn->aux;
+	u32 min_rate;
+	u8 pwr;
+	bool ret = true;
+
+	if (mst)
+		min_rate = outp->dp.link_nr * outp->dp.rate[0].rate;
+	else
+		min_rate = DIV_ROUND_UP(khz * bpc * 3, 8);
+
+	NV_DEBUG(drm, "%s link training (mst:%d min_rate:%d)\n",
+		 outp->base.base.name, mst, min_rate);
 
 	mutex_lock(&outp->dp.hpd_irq_lock);
 
-	outp->dp.lt.nr = outp->dp.link_nr;
-	outp->dp.lt.bw = 0;
-	outp->dp.lt.mst = mst;
-	ret = nouveau_dp_train_link(outp, false);
+	if (drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr) == 1) {
+		if ((pwr & DP_SET_POWER_MASK) != DP_SET_POWER_D0) {
+			pwr &= ~DP_SET_POWER_MASK;
+			pwr |=  DP_SET_POWER_D0;
+			drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
+		}
+	}
+
+	for (int nr = outp->dp.link_nr; nr; nr >>= 1) {
+		for (int rate = 0; rate < outp->dp.rate_nr; rate++) {
+			if (outp->dp.rate[rate].rate * nr >= min_rate) {
+				outp->dp.lt.nr = nr;
+				outp->dp.lt.bw = outp->dp.rate[rate].rate;
+				outp->dp.lt.mst = mst;
+				if (nouveau_dp_train_link(outp, false))
+					goto done;
+			}
+		}
+	}
 
+	ret = false;
+done:
 	mutex_unlock(&outp->dp.hpd_irq_lock);
 	return ret;
 }
@@ -352,6 +449,17 @@ nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
 static bool
 nouveau_dp_link_check_locked(struct nouveau_encoder *outp)
 {
+	u8 link_status[DP_LINK_STATUS_SIZE];
+
+	if (!outp || !outp->dp.lt.nr)
+		return true;
+
+	if (drm_dp_dpcd_read_phy_link_status(&outp->conn->aux, DP_PHY_DPRX, link_status) < 0)
+		return false;
+
+	if (drm_dp_channel_eq_ok(link_status, outp->dp.lt.nr))
+		return true;
+
 	return nouveau_dp_train_link(outp, true);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7ffd57d82f89f..5fe5523587e6a 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -46,6 +46,22 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 	return ret;
 }
 
+int
+nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
+{
+	struct nvif_outp_dp_drive_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.lanes   = link_nr;
+	memcpy(args.pe, pe, sizeof(args.pe));
+	memcpy(args.vs, vs, sizeof(args.vs));
+
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_DRIVE, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_DRIVE lanes:%d]", args.lanes);
+	return ret;
+}
+
 int
 nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
 		   u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index b59cd2d4550f5..77a91d42b977a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -315,6 +315,8 @@ nvkm_dp_train_link(struct nvkm_outp *outp, int rate)
 	sink[1] = ior->dp.nr;
 	if (ior->dp.ef)
 		sink[1] |= DPCD_LC01_ENHANCED_FRAME_EN;
+	if (outp->dp.lt.post_adj)
+		sink[1] |= 0x20;
 
 	ret = nvkm_wraux(outp->dp.aux, DPCD_LC00_LINK_BW_SET, sink, 2);
 	if (ret)
@@ -455,71 +457,58 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
 }
 
 static int
-nvkm_dp_train_(struct nvkm_outp *outp, bool retrain)
+nvkm_dp_drive(struct nvkm_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
 {
-	if (retrain) {
-		if (!atomic_read(&outp->dp.lt.done))
-			return 0;
-
-		return outp->func->acquire(outp);
-	}
+	struct lt_state lt = {
+		.outp = outp,
+		.stat[4] = (pe[0] << 2) | (vs[0] << 0) |
+			   (pe[1] << 6) | (vs[1] << 4),
+		.stat[5] = (pe[2] << 2) | (vs[2] << 0) |
+			   (pe[3] << 6) | (vs[3] << 4),
+	};
 
-	return 0;
+	return nvkm_dp_train_drive(&lt, false);
 }
 
 static int
-nvkm_dp_train(struct nvkm_outp *outp, u32 dataKBps)
+nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 {
 	struct nvkm_ior *ior = outp->ior;
-	int ret = -EINVAL, nr, rate;
-	u8  pwr;
+	int ret, rate;
 
-	/* Retraining link?  Skip source configuration, it can mess up the active modeset. */
-	if (atomic_read(&outp->dp.lt.done)) {
-		for (rate = 0; rate < outp->dp.rates; rate++) {
-			if (outp->dp.rate[rate].rate == ior->dp.bw * 27000)
-				return nvkm_dp_train_link(outp, ret);
-		}
-		WARN_ON(1);
-		return -EINVAL;
+	for (rate = 0; rate < outp->dp.rates; rate++) {
+		if (outp->dp.rate[rate].rate == (retrain ? ior->dp.bw : outp->dp.lt.bw) * 27000)
+			break;
 	}
 
-	/* Ensure sink is not in a low-power state. */
-	if (!nvkm_rdaux(outp->dp.aux, DPCD_SC00, &pwr, 1)) {
-		if ((pwr & DPCD_SC00_SET_POWER) != DPCD_SC00_SET_POWER_D0) {
-			pwr &= ~DPCD_SC00_SET_POWER;
-			pwr |=  DPCD_SC00_SET_POWER_D0;
-			nvkm_wraux(outp->dp.aux, DPCD_SC00, &pwr, 1);
-		}
+	if (WARN_ON(rate == outp->dp.rates))
+		return -EINVAL;
+
+	/* Retraining link?  Skip source configuration, it can mess up the active modeset. */
+	if (retrain) {
+		mutex_lock(&outp->dp.mutex);
+		ret = nvkm_dp_train_link(outp, rate);
+		mutex_unlock(&outp->dp.mutex);
+		return ret;
 	}
 
+	mutex_lock(&outp->dp.mutex);
+	OUTP_DBG(outp, "training");
+
 	ior->dp.mst = outp->dp.lt.mst;
 	ior->dp.ef = outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP;
-	ior->dp.nr = 0;
+	ior->dp.bw = outp->dp.lt.bw;
+	ior->dp.nr = outp->dp.lt.nr;
 
-	/* Link training. */
-	OUTP_DBG(outp, "training");
 	nvkm_dp_train_init(outp);
-
-	/* Otherwise, loop through all valid link configurations that support the data rate. */
-	for (nr = outp->dp.links; ret < 0 && nr; nr >>= 1) {
-		for (rate = 0; ret < 0 && rate < outp->dp.rates; rate++) {
-			if (outp->dp.rate[rate].rate * nr >= dataKBps || WARN_ON(!ior->dp.nr)) {
-				/* Program selected link configuration. */
-				ior->dp.bw = outp->dp.rate[rate].rate / 27000;
-				ior->dp.nr = nr;
-				ret = nvkm_dp_train_links(outp, rate);
-			}
-		}
-	}
-
-	/* Finish up. */
+	ret = nvkm_dp_train_links(outp, rate);
 	nvkm_dp_train_fini(outp);
 	if (ret < 0)
 		OUTP_ERR(outp, "training failed");
 	else
 		OUTP_DBG(outp, "training done");
-	atomic_set(&outp->dp.lt.done, 1);
+
+	mutex_unlock(&outp->dp.mutex);
 	return ret;
 }
 
@@ -537,69 +526,10 @@ nvkm_dp_disable(struct nvkm_outp *outp, struct nvkm_ior *ior)
 static void
 nvkm_dp_release(struct nvkm_outp *outp)
 {
-	/* Prevent link from being retrained if sink sends an IRQ. */
-	atomic_set(&outp->dp.lt.done, 0);
 	outp->ior->dp.nr = 0;
-}
-
-static int
-nvkm_dp_acquire(struct nvkm_outp *outp)
-{
-	struct nvkm_ior *ior = outp->ior;
-	struct nvkm_head *head;
-	bool retrain = true;
-	u32 datakbps = 0;
-	u32 dataKBps;
-	u32 linkKBps;
-	u8  stat[3];
-	int ret, i;
-
-	mutex_lock(&outp->dp.mutex);
-
-	/* Check that link configuration meets current requirements. */
-	list_for_each_entry(head, &outp->disp->heads, head) {
-		if (ior->asy.head & (1 << head->id)) {
-			u32 khz = (head->asy.hz >> ior->asy.rgdiv) / 1000;
-			datakbps += khz * head->asy.or.depth;
-		}
-	}
+	nvkm_dp_disable(outp, outp->ior);
 
-	linkKBps = ior->dp.bw * 27000 * ior->dp.nr;
-	dataKBps = DIV_ROUND_UP(datakbps, 8);
-	OUTP_DBG(outp, "data %d KB/s link %d KB/s mst %d->%d",
-		 dataKBps, linkKBps, ior->dp.mst, outp->dp.lt.mst);
-	if (linkKBps < dataKBps || ior->dp.mst != outp->dp.lt.mst) {
-		OUTP_DBG(outp, "link requirements changed");
-		goto done;
-	}
-
-	/* Check that link is still trained. */
-	ret = nvkm_rdaux(outp->dp.aux, DPCD_LS02, stat, 3);
-	if (ret) {
-		OUTP_DBG(outp, "failed to read link status, assuming no sink");
-		goto done;
-	}
-
-	if (stat[2] & DPCD_LS04_INTERLANE_ALIGN_DONE) {
-		for (i = 0; i < ior->dp.nr; i++) {
-			u8 lane = (stat[i >> 1] >> ((i & 1) * 4)) & 0x0f;
-			if (!(lane & DPCD_LS02_LANE0_CR_DONE) ||
-			    !(lane & DPCD_LS02_LANE0_CHANNEL_EQ_DONE) ||
-			    !(lane & DPCD_LS02_LANE0_SYMBOL_LOCKED)) {
-				OUTP_DBG(outp, "lane %d not equalised", lane);
-				goto done;
-			}
-		}
-		retrain = false;
-	} else {
-		OUTP_DBG(outp, "no inter-lane alignment");
-	}
-
-done:
-	if (retrain || !atomic_read(&outp->dp.lt.done))
-		ret = nvkm_dp_train(outp, dataKBps);
-	mutex_unlock(&outp->dp.mutex);
-	return ret;
+	nvkm_outp_release(outp);
 }
 
 void
@@ -638,7 +568,6 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 		OUTP_DBG(outp, "aux power -> demand");
 		nvkm_i2c_aux_monitor(aux, false);
 		outp->dp.aux_pwr = false;
-		atomic_set(&outp->dp.lt.done, 0);
 
 		/* Restore eDP panel GPIO to its prior state if we changed it, as
 		 * it could potentially interfere with other outputs.
@@ -677,14 +606,14 @@ nvkm_dp_func = {
 	.fini = nvkm_dp_fini,
 	.detect = nvkm_outp_detect,
 	.inherit = nvkm_outp_inherit,
-	.acquire = nvkm_dp_acquire,
+	.acquire = nvkm_outp_acquire,
 	.release = nvkm_dp_release,
-	.disable = nvkm_dp_disable,
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
 	.dp.aux_pwr = nvkm_dp_aux_pwr,
 	.dp.aux_xfer = nvkm_dp_aux_xfer,
-	.dp.train = nvkm_dp_train_,
+	.dp.train = nvkm_dp_train,
+	.dp.drive = nvkm_dp_drive,
 };
 
 int
@@ -723,6 +652,5 @@ nvkm_dp_new(struct nvkm_disp *disp, int index, struct dcb_output *dcbE, struct n
 	OUTP_DBG(outp, "bios dp %02x %02x %02x %02x", outp->dp.version, hdr, cnt, len);
 
 	mutex_init(&outp->dp.mutex);
-	atomic_set(&outp->dp.lt.done, 0);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 948a46f3a1bdf..e9d0a9b715d47 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1286,10 +1286,6 @@ nv50_disp_super_2_2(struct nvkm_disp *disp, struct nvkm_head *head)
 		ior->asy.link      = outp->lvds.dual ? 3 : 1;
 	}
 
-	/* Handle any link training, etc. */
-	if (outp && outp->func->acquire)
-		outp->func->acquire(outp);
-
 	/* Execute OnInt2 IED script. */
 	nv50_disp_super_ied_on(head, ior, 0, khz);
 
@@ -1319,7 +1315,6 @@ nv50_disp_super_2_1(struct nvkm_disp *disp, struct nvkm_head *head)
 void
 nv50_disp_super_2_0(struct nvkm_disp *disp, struct nvkm_head *head)
 {
-	struct nvkm_outp *outp;
 	struct nvkm_ior *ior;
 
 	/* Determine which OR, if any, we're detaching from the head. */
@@ -1330,14 +1325,6 @@ nv50_disp_super_2_0(struct nvkm_disp *disp, struct nvkm_head *head)
 
 	/* Execute OffInt2 IED script. */
 	nv50_disp_super_ied_off(head, ior, 2);
-
-	/* If we're shutting down the OR's only active head, execute
-	 * the output path's disable function.
-	 */
-	if (ior->arm.head == (1 << head->id)) {
-		if ((outp = ior->arm.outp) && outp->func->disable)
-			outp->func->disable(outp, ior);
-	}
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 28ec7b3785130..f1a3e623bb222 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -31,7 +31,7 @@
 #include <subdev/gpio.h>
 #include <subdev/i2c.h>
 
-void
+static void
 nvkm_outp_route(struct nvkm_disp *disp)
 {
 	struct nvkm_outp *outp;
@@ -96,8 +96,6 @@ nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 	if (ior) {
 		outp->acquired &= ~user;
 		if (!outp->acquired) {
-			if (outp->func->release && outp->ior)
-				outp->func->release(outp);
 			outp->ior->asy.outp = NULL;
 			outp->ior = NULL;
 		}
@@ -277,6 +275,18 @@ nvkm_outp_release(struct nvkm_outp *outp)
 	nvkm_outp_route(outp->disp);
 }
 
+int
+nvkm_outp_acquire(struct nvkm_outp *outp, bool hda)
+{
+	int ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
+
+	if (ret)
+		return ret;
+
+	nvkm_outp_route(outp->disp);
+	return 0;
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
@@ -412,6 +422,8 @@ static const struct nvkm_outp_func
 nvkm_outp = {
 	.detect = nvkm_outp_detect,
 	.inherit = nvkm_outp_inherit,
+	.acquire = nvkm_outp_acquire,
+	.release = nvkm_outp_release,
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 5ac4cf596bc39..cda17941de89a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -50,11 +50,9 @@ struct nvkm_outp {
 				u32 rate;
 			} rate[8];
 			int rates;
-			int links;
 
 			struct mutex mutex;
 			struct {
-				atomic_t done;
 				u8 nr;
 				u8 bw;
 				bool mst;
@@ -79,11 +77,11 @@ void nvkm_outp_fini(struct nvkm_outp *);
 int nvkm_outp_detect(struct nvkm_outp *);
 
 struct nvkm_ior *nvkm_outp_inherit(struct nvkm_outp *);
+int nvkm_outp_acquire(struct nvkm_outp *, bool hda);
 int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
 int nvkm_outp_acquire_ior(struct nvkm_outp *, u8 user, struct nvkm_ior *);
 void nvkm_outp_release(struct nvkm_outp *);
 void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
-void nvkm_outp_route(struct nvkm_disp *);
 
 int nvkm_outp_bl_get(struct nvkm_outp *);
 int nvkm_outp_bl_set(struct nvkm_outp *, int level);
@@ -97,9 +95,8 @@ struct nvkm_outp_func {
 	int (*edid_get)(struct nvkm_outp *, u8 *data, u16 *size);
 
 	struct nvkm_ior *(*inherit)(struct nvkm_outp *);
-	int (*acquire)(struct nvkm_outp *);
+	int (*acquire)(struct nvkm_outp *, bool hda);
 	void (*release)(struct nvkm_outp *);
-	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
 
 	struct {
 		int (*get)(struct nvkm_outp *);
@@ -111,6 +108,7 @@ struct nvkm_outp_func {
 		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
 		int (*rates)(struct nvkm_outp *);
 		int (*train)(struct nvkm_outp *, bool retrain);
+		int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 16a1536d13aaf..b634e76c2a9ba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -45,6 +45,19 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_drive_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->dp.drive)
+		return -EINVAL;
+
+	return outp->func->dp.drive(outp, args->v0.lanes, args->v0.pe, args->v0.vs);
+}
+
 static int
 nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -58,9 +71,8 @@ nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (!args->v0.retrain) {
 		memcpy(outp->dp.dpcd, args->v0.dpcd, sizeof(outp->dp.dpcd));
 		outp->dp.lttprs = args->v0.lttprs;
-		outp->dp.links = args->v0.link_nr;
-		outp->dp.lt.nr = 0;
-		outp->dp.lt.bw = 0;
+		outp->dp.lt.nr = args->v0.link_nr;
+		outp->dp.lt.bw = args->v0.link_bw / 27000;
 		outp->dp.lt.mst = args->v0.mst;
 		outp->dp.lt.post_adj = args->v0.post_lt_adj;
 	}
@@ -279,7 +291,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (!outp->ior)
 		return -EINVAL;
 
-	nvkm_outp_release(outp);
+	outp->func->release(outp);
 	return 0;
 }
 
@@ -297,10 +309,10 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	switch (args->v0.type) {
 	case NVIF_OUTP_ACQUIRE_V0_DAC:
 	case NVIF_OUTP_ACQUIRE_V0_PIOR:
-		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
+		ret = outp->func->acquire(outp, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_SOR:
-		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
+		ret = outp->func->acquire(outp, args->v0.sor.hda);
 		break;
 	default:
 		ret = -EINVAL;
@@ -310,8 +322,6 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (ret)
 		return ret;
 
-	nvkm_outp_route(outp->disp);
-
 	args->v0.or = outp->ior->id;
 	args->v0.link = outp->ior->asy.link;
 	return 0;
@@ -450,6 +460,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

