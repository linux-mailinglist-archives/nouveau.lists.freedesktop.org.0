Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58F79FEE4
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DF410E545;
	Thu, 14 Sep 2023 08:48:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F910E544
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:12 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-59b8f5b6c0aso7835967b3.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681291; x=1695286091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+b5n/2bTD1yfPbdZU0vBjOCgRPrm4CtHbe1/oPQqfvw=;
 b=LnuChOHDXOQ8nwY+jhYe/BzAvg0h61qFR3z6SpcY0xX8FxkzWJgweN5RiskRn0QY0A
 4X9PUV5Xo4l04+Wdx3uH2c2SQbeCd5r4GiTlMTqm43qMIbB44iLhdX8jx6ojAwqS910V
 masmpQPs23ZF5p5pz5gVvFFUMWyCj1A7MvfzbqLne7fIOsuH2R/4A8fGwi5+clIs2GSA
 XZ1ee1uEZP7/4Ok60S3GrSQThdj5vKX4JeGNg2QqiLAJYB9DRJgyFLA8JB3BzoGsZ9D+
 p954Q0C5eEn8pImDwsG6O7bwNo3JqaF0BgfVEV1kQ4PrslQ0OmdQwWyJlpCMyzgYYRp1
 LzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681291; x=1695286091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+b5n/2bTD1yfPbdZU0vBjOCgRPrm4CtHbe1/oPQqfvw=;
 b=eN051QQUbUUEgHXdaqbgxqkON3MjLMddwyzL9ygCqEG6AXXEMcw68odbA1ffzyv1Vg
 dflt0oay25GyjqUpw3/Nfb3DcoVBoq/MMNtXlDBksn8QxMGRIWrFAMI4RwgJZpc+pIdh
 XCfMvWlz9dffmAImlAIIj+q6jsawXtQ1TZVvTzKfu+rkcs1feAqg7MrvRWF8gb1nvNdQ
 QQQjhGdUiC5WUnq/P9kkBOfuDMr+D1ffmiyp13ZMWaNmw35RH9AQFtXweEdBOvWe54yD
 K/Q/zjyv3p9GiLjcYrZlxjYPPdvnupy+bBmg+drLNuxrxQGC7AvOjE1xGn/DZhElchT/
 4aIQ==
X-Gm-Message-State: AOJu0Yx/MbCvDuzfX1ZfjHT1S+nyFVgv/OC6E9xfCn4leUx3zt2zhPw3
 B0DfJtRWhm/TvZ2PZlLf43ru5GxDj78=
X-Google-Smtp-Source: AGHT+IEB1pYWJdBqnma9IKsOhFJzmuVrxJKUERGVQMbE3v2rWYPg4F2KSWptDpiivClvndBk0EFf6A==
X-Received: by 2002:a0d:e8c1:0:b0:584:33c:31f2 with SMTP id
 r184-20020a0de8c1000000b00584033c31f2mr5270613ywe.17.1694681290875; 
 Thu, 14 Sep 2023 01:48:10 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:10 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:14 +1000
Message-ID: <20230914084624.2299765-35-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 33/44] drm/nouveau/disp: move link training out of
 supervisor
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

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  50 ++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 137 +++---------------
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |  13 --
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  18 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   7 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  13 +-
 6 files changed, 91 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 9280daf32534..cd03c29c1063 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -336,15 +336,44 @@ nouveau_dp_train_link(struct nouveau_encoder *outp, bool retrain)
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
@@ -352,6 +381,17 @@ nouveau_dp_train(struct nouveau_encoder *outp, bool mst, u32 khz, u8 bpc)
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
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index b59cd2d4550f..6f08ff8b1fba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -455,71 +455,44 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
 }
 
 static int
-nvkm_dp_train_(struct nvkm_outp *outp, bool retrain)
+nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 {
-	if (retrain) {
-		if (!atomic_read(&outp->dp.lt.done))
-			return 0;
+	struct nvkm_ior *ior = outp->ior;
+	int ret, rate;
 
-		return outp->func->acquire(outp);
+	for (rate = 0; rate < outp->dp.rates; rate++) {
+		if (outp->dp.rate[rate].rate == (retrain ? ior->dp.bw : outp->dp.lt.bw) * 27000)
+			break;
 	}
 
-	return 0;
-}
-
-static int
-nvkm_dp_train(struct nvkm_outp *outp, u32 dataKBps)
-{
-	struct nvkm_ior *ior = outp->ior;
-	int ret = -EINVAL, nr, rate;
-	u8  pwr;
+	if (WARN_ON(rate == outp->dp.rates))
+		return -EINVAL;
 
 	/* Retraining link?  Skip source configuration, it can mess up the active modeset. */
-	if (atomic_read(&outp->dp.lt.done)) {
-		for (rate = 0; rate < outp->dp.rates; rate++) {
-			if (outp->dp.rate[rate].rate == ior->dp.bw * 27000)
-				return nvkm_dp_train_link(outp, ret);
-		}
-		WARN_ON(1);
-		return -EINVAL;
+	if (retrain) {
+		mutex_lock(&outp->dp.mutex);
+		ret = nvkm_dp_train_link(outp, rate);
+		mutex_unlock(&outp->dp.mutex);
+		return ret;
 	}
 
-	/* Ensure sink is not in a low-power state. */
-	if (!nvkm_rdaux(outp->dp.aux, DPCD_SC00, &pwr, 1)) {
-		if ((pwr & DPCD_SC00_SET_POWER) != DPCD_SC00_SET_POWER_D0) {
-			pwr &= ~DPCD_SC00_SET_POWER;
-			pwr |=  DPCD_SC00_SET_POWER_D0;
-			nvkm_wraux(outp->dp.aux, DPCD_SC00, &pwr, 1);
-		}
-	}
+	mutex_lock(&outp->dp.mutex);
+	OUTP_DBG(outp, "training");
 
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
 
@@ -537,69 +510,10 @@ nvkm_dp_disable(struct nvkm_outp *outp, struct nvkm_ior *ior)
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
@@ -638,7 +552,6 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
 		OUTP_DBG(outp, "aux power -> demand");
 		nvkm_i2c_aux_monitor(aux, false);
 		outp->dp.aux_pwr = false;
-		atomic_set(&outp->dp.lt.done, 0);
 
 		/* Restore eDP panel GPIO to its prior state if we changed it, as
 		 * it could potentially interfere with other outputs.
@@ -677,14 +590,13 @@ nvkm_dp_func = {
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
 };
 
 int
@@ -723,6 +635,5 @@ nvkm_dp_new(struct nvkm_disp *disp, int index, struct dcb_output *dcbE, struct n
 	OUTP_DBG(outp, "bios dp %02x %02x %02x %02x", outp->dp.version, hdr, cnt, len);
 
 	mutex_init(&outp->dp.mutex);
-	atomic_set(&outp->dp.lt.done, 0);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 948a46f3a1bd..e9d0a9b715d4 100644
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
index 28ec7b378513..f1a3e623bb22 100644
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
index 5ac4cf596bc3..014b95b0f561 100644
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
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 16a1536d13aa..a256b35ce79c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -58,9 +58,8 @@ nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
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
@@ -279,7 +278,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (!outp->ior)
 		return -EINVAL;
 
-	nvkm_outp_release(outp);
+	outp->func->release(outp);
 	return 0;
 }
 
@@ -297,10 +296,10 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
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
@@ -310,8 +309,6 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (ret)
 		return ret;
 
-	nvkm_outp_route(outp->disp);
-
 	args->v0.or = outp->ior->id;
 	args->v0.link = outp->ior->asy.link;
 	return 0;
-- 
2.41.0

