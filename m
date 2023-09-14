Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8879FEDA
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABD310E53D;
	Thu, 14 Sep 2023 08:48:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BF710E542
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:58 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fac16ee5fso623998b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681278; x=1695286078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukbTL7NBprQhMQzKq+rZTfC2XDKARkAMuhhLaRbeZA0=;
 b=ICOR4bK28/6g1vVC6IYdnovpBDdssLZWxX+rmbvgU/YFkcYKMkzhCc3NlEBIXD8Q4X
 oWX3He7R+X52JuEdnFZRVuTrIINaWsMJxWsER6YsTyaCXDUUjEYfJqMvLTnik3nf/uuz
 KK2o2zh9JsHV1kXqmfMDS9UfsQmu3OL3ZK8mJAih7JzywToVSl8GUEui80wRpAeVln8T
 rZItSsFrdWq8hjsC9PKNL02FdZtZ6IsAh74dHiPw11fW+9/+aPh57M/Jhvxd2DqOydXe
 lZJo0BGQYhrE7NvEsochnzp/lzOKl7/oGc3lshkgzPvrQ0C4OZMywK7DnFfneQWEodvz
 Cplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681278; x=1695286078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ukbTL7NBprQhMQzKq+rZTfC2XDKARkAMuhhLaRbeZA0=;
 b=YT8tXEXx48q9NWQLiqFdDR20uQ7kotNVSGZSVDPSOP2jIfaLhPPQrW+Qp6FCDRaxb4
 asUAwTXPsNuqTGWjqusxTjkt8c4VjJq+1m9fZPD7/IK0x8iUreE+ls+yWO2Po2J8gPED
 /Oj6X+Pg5cU/0lcZljvLGuoCkUE2MJS8Z58ImIzGXT/7/9ud9xThv44sDphb+649d028
 4SsDelo4UkgjA3zxoZS+u9IFzMgKift/ds38NQ+ZSTavoWMHm2LHUMcUupWHc8xzrJAn
 XW7wM7/K1iqerCSO93QURxx4HUh5k3bksdsuDTTK+9/jOxeHDGyD9FAJDL2+kls3QSjL
 ViBQ==
X-Gm-Message-State: AOJu0Yy1fToENlqGjyPHDlFLxO6uF1JGlhV/kRnAjZe8q42rj6VInk5t
 a1s5fZUBllAwJ7SRZ8xDubv+ImaVZ0s=
X-Google-Smtp-Source: AGHT+IGkJAKwhWKb9SdK1wI2QWIapWDcgw/hQ1TPgetHyDZPWL3iqEq4fFzbWONj3EB7jfi2rZeJDA==
X-Received: by 2002:a05:6a00:13aa:b0:68e:2822:fb36 with SMTP id
 t42-20020a056a0013aa00b0068e2822fb36mr6672048pfg.8.1694681277811; 
 Thu, 14 Sep 2023 01:47:57 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:57 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:08 +1000
Message-ID: <20230914084624.2299765-29-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 27/44] drm/nouveau/disp: add dp aux xfer method
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 32 +++++++++----------
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 +++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 12 ++-----
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  1 -
 drivers/gpu/drm/nouveau/nvif/outp.c           | 24 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 14 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 27 +++++++++++++---
 9 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a574b4315ac2..d52735cd9d38 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1702,14 +1702,13 @@ nv50_sor_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	nvif_outp_dtor(&nv_encoder->outp);
-
 	nv50_mstm_del(&nv_encoder->dp.mstm);
 	drm_encoder_cleanup(encoder);
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
 		mutex_destroy(&nv_encoder->dp.hpd_irq_lock);
 
+	nvif_outp_dtor(&nv_encoder->outp);
 	kfree(encoder);
 }
 
@@ -1762,22 +1761,22 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
-		struct nvkm_i2c_aux *aux =
-			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
-
 		mutex_init(&nv_encoder->dp.hpd_irq_lock);
 
-		if (aux) {
-			if (disp->disp->object.oclass < GF110_DISP) {
-				/* HW has no support for address-only
-				 * transactions, so we're required to
-				 * use custom I2C-over-AUX code.
-				 */
-				nv_encoder->i2c = &aux->i2c;
-			} else {
-				nv_encoder->i2c = &nv_connector->aux.ddc;
-			}
-			nv_encoder->aux = aux;
+		if (disp->disp->object.oclass < GF110_DISP) {
+			/* HW has no support for address-only
+			 * transactions, so we're required to
+			 * use custom I2C-over-AUX code.
+			 */
+			struct nvkm_i2c_aux *aux;
+
+			aux = nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
+			if (!aux)
+				return -EINVAL;
+
+			nv_encoder->i2c = &aux->i2c;
+		} else {
+			nv_encoder->i2c = &nv_connector->aux.ddc;
 		}
 
 		if (nv_connector->type != DCB_CONNECTOR_eDP &&
@@ -1925,7 +1924,6 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 	}
 
 	nv_encoder->i2c = ddc;
-	nv_encoder->aux = aux;
 
 	mutex_init(&nv_encoder->dp.hpd_irq_lock);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index ee4cec541a90..94f1e55b0ce6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -32,6 +32,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_HDA_ELD       0x61
 
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
+#define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RETRAIN    0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
@@ -182,6 +183,17 @@ union nvif_outp_dp_aux_pwr_args {
 	} v0;
 };
 
+union nvif_outp_dp_aux_xfer_args {
+	struct nvif_outp_dp_aux_xfer_v0 {
+		__u8  version;
+		__u8  pad01;
+		__u8  type;
+		__u8  size;
+		__u32 addr;
+		__u8  data[16];
+	} v0;
+};
+
 union nvif_outp_dp_retrain_args {
 	struct nvif_outp_dp_retrain_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 0ddaec9416ee..dd4dd0e2a7a1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -56,7 +56,9 @@ int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet,
 
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
+
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
+int nvif_outp_dp_aux_xfer(struct nvif_outp *, u8 type, u8 *size, u32 addr, u8 *data);
 int nvif_outp_dp_retrain(struct nvif_outp *);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b95ec49935fe..c2929ad64b60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1226,23 +1226,17 @@ nouveau_connector_aux_xfer(struct drm_dp_aux *obj, struct drm_dp_aux_msg *msg)
 	struct nouveau_connector *nv_connector =
 		container_of(obj, typeof(*nv_connector), aux);
 	struct nouveau_encoder *nv_encoder;
-	struct nvkm_i2c_aux *aux;
 	u8 size = msg->size;
 	int ret;
 
 	nv_encoder = find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
-	if (!nv_encoder || !(aux = nv_encoder->aux))
+	if (!nv_encoder)
 		return -ENODEV;
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
-	ret = nvkm_i2c_aux_acquire(aux);
-	if (ret)
-		return ret;
-
-	ret = nvkm_i2c_aux_xfer(aux, false, msg->request, msg->address,
-				msg->buffer, &size);
-	nvkm_i2c_aux_release(aux);
+	ret = nvif_outp_dp_aux_xfer(&nv_encoder->outp,
+				    msg->request, &size, msg->address, msg->buffer);
 	if (ret >= 0) {
 		msg->reply = ret;
 		return size;
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index b3a9415ba879..aacdf2814aba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -52,7 +52,6 @@ struct nouveau_encoder {
 	struct nouveau_connector *conn;
 
 	struct i2c_adapter *i2c;
-	struct nvkm_i2c_aux *aux;
 
 	/* different to drm_encoder.crtc, this reflects what's
 	 * actually programmed on the hw, not the proposed crtc */
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index dbb0986f0555..df6e89379982 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -76,6 +76,30 @@ nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 	return ret;
 }
 
+int
+nvif_outp_dp_aux_xfer(struct nvif_outp *outp, u8 type, u8 *psize, u32 addr, u8 *data)
+{
+	struct nvif_outp_dp_aux_xfer_v0 args;
+	u8 size = *psize;
+	int ret;
+
+	args.version = 0;
+	args.type = type;
+	args.size = size;
+	args.addr = addr;
+	memcpy(args.data, data, size);
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_AUX_XFER, &args, sizeof(args));
+	NVIF_DEBUG(&outp->object, "[DP_AUX_XFER type:%d size:%d addr:%05x] %d size:%d (ret: %d)",
+		   args.type, size, args.addr, ret, args.size, ret);
+	if (ret < 0)
+		return ret;
+
+	*psize = args.size;
+
+	memcpy(data, args.data, size);
+	return ret;
+}
+
 int
 nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 99fe7ef07a44..49fbb32f5022 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,19 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *size)
+{
+	int ret = nvkm_i2c_aux_acquire(outp->dp.aux);
+
+	if (ret)
+		return ret;
+
+	ret = nvkm_i2c_aux_xfer(outp->dp.aux, false, type, addr, data, size);
+	nvkm_i2c_aux_release(outp->dp.aux);
+	return ret;
+}
+
 static int
 nvkm_dp_aux_pwr(struct nvkm_outp *outp, bool pu)
 {
@@ -823,6 +836,7 @@ nvkm_dp_func = {
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
 	.dp.aux_pwr = nvkm_dp_aux_pwr,
+	.dp.aux_xfer = nvkm_dp_aux_xfer,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 513794a278a9..a2391b224ea4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -107,6 +107,7 @@ struct nvkm_outp_func {
 
 	struct {
 		int (*aux_pwr)(struct nvkm_outp *, bool pu);
+		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 6ca364e953bd..cd92db9028a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -25,6 +25,8 @@
 #include "head.h"
 #include "ior.h"
 
+#include <subdev/i2c.h>
+
 #include <nvif/if0012.h>
 
 static int
@@ -68,6 +70,20 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_aux_xfer(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_aux_xfer_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->dp.aux_xfer)
+		return -EINVAL;
+
+	return outp->func->dp.aux_xfer(outp, args->v0.type, args->v0.addr,
+					     args->v0.data, &args->v0.size);
+}
+
 static int
 nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -429,7 +445,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
+nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
@@ -440,11 +456,13 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
 	default:
 		break;
 	}
 
-	return 1;
+	*invalid = true;
+	return 0;
 }
 
 static int
@@ -452,12 +470,13 @@ nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvkm_outp *outp = nvkm_uoutp(object);
 	struct nvkm_disp *disp = outp->disp;
+	bool invalid = false;
 	int ret;
 
 	mutex_lock(&disp->super.mutex);
 
-	ret = nvkm_uoutp_mthd_noacquire(outp, mthd, argv, argc);
-	if (ret <= 0)
+	ret = nvkm_uoutp_mthd_noacquire(outp, mthd, argv, argc, &invalid);
+	if (!invalid)
 		goto done;
 
 	if (outp->ior)
-- 
2.41.0

