Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288367A53BB
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98B10E309;
	Mon, 18 Sep 2023 20:16:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F710E302
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:16:06 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c09673b006so35916905ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068165; x=1695672965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rei6UDS+vZo8VRhw7ogaa8a34fUWCKMXNbyx4SHNb48=;
 b=MTtLzKljx9kGGXLs4I16BfBLWrbFaOVHFO4el/ecsfS5mNYSU0PrJwHwDjPiz+Kga2
 hVaK6AF+Sjw2QL5T4kPGf4j7yvg73YWFatyspX9C7WCd2Jb0nO/YIk4QkRGgfRBldLxu
 li+WUb6+5own7oCY46OZ2poSIjt7oj1q5GQj76ykI/t3Wy5KJ8LoII+amFYzDjUGwmeu
 jtbEAEGpkbrFXJPwn5otf3EFwMIy5SwI/0doAt7b6yOT7T2QhoK8v8TSXHHuqXMpSk3a
 HzxPTqdSgPuHAyFntHb0ghRZL8a1D1gnPfNtJBTNygK7kcokoPG1LmdBQNv2qUsq6+LO
 J3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068165; x=1695672965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rei6UDS+vZo8VRhw7ogaa8a34fUWCKMXNbyx4SHNb48=;
 b=tEeiQd1FaNEZCCl/X1E/+RAHD8urMriGYHCc90MxRsTFGOms1f2HhJ+EaAiZytSzvE
 DkUTR1kZ55GM9BwUxeQejPR8IifAcYIHgr31SI40sUzr7be3d2hwZ/5nmdtVqaGZfo7x
 uwLbJJ8EnRPumOMpBjWmscVrKouV+yrOVdT4YYhO97fY7i1Utdj0svbMZ6rVgQG0CAtn
 0A1vg4txxkyvvSdlyj6hiA2GPQQ30oRObhB6iO6/16kMUhh/XN8rdhWhtiGK4MmMfsk2
 YWEXvntYApfzYmf9Fur4eI/ZNPGQEJd5o/w+m1JvTspDGEv/xZlr7Zb/hJIQhhgWJtj0
 MrPA==
X-Gm-Message-State: AOJu0YxhZ1IPYUPs14rotid9eZpRHFbslyA4mnZu353m0dWLqFR8rQMo
 7KDdFB2lM3OMEvBmgImHVQrXuAlYALk=
X-Google-Smtp-Source: AGHT+IH17wFm9m0qImr0ZeSndL1IYANFb2fks+TMQ4STDMeiD1yOzcf9ggvoqB+TpnGlVWTBdcQ22Q==
X-Received: by 2002:a17:903:1c4:b0:1c0:ee60:470a with SMTP id
 e4-20020a17090301c400b001c0ee60470amr10015268plh.66.1695068165517; 
 Mon, 18 Sep 2023 13:16:05 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:16:05 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:14:03 +1000
Message-ID: <20230918201404.3765-44-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 43/44] drm/nouveau/kms/nv50-: create outputs
 based on nvkm info
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 97 ++++++++++---------
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  2 -
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 31 +++++-
 drivers/gpu/drm/nouveau/include/nvif/outp.h   | 40 ++++++++
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 44 +++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  5 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 50 ++++++++++
 9 files changed, 223 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 642b6bcde121..57b6864fb9d0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -66,8 +66,6 @@
 #include "nouveau_fence.h"
 #include "nv50_display.h"
 
-#include <subdev/bios/dp.h>
-
 /******************************************************************************
  * EVO channel
  *****************************************************************************/
@@ -1702,7 +1700,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	}
 
 	if (head->func->display_id)
-		head->func->display_id(head, BIT(nv_encoder->dcb->id));
+		head->func->display_id(head, BIT(nv_encoder->outp.id));
 
 	nv_encoder->update(nv_encoder, nv_crtc->index, asyh, proto, depth);
 }
@@ -1734,16 +1732,6 @@ nv50_sor_func = {
 	.destroy = nv50_sor_destroy,
 };
 
-bool nv50_has_mst(struct nouveau_drm *drm)
-{
-	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
-	u32 data;
-	u8 ver, hdr, cnt, len;
-
-	data = nvbios_dp_table(bios, &ver, &hdr, &cnt, &len);
-	return data && ver >= 0x40 && (nvbios_rd08(bios, data + 0x08) & 0x04);
-}
-
 static int
 nv50_sor_create(struct nouveau_encoder *nv_encoder)
 {
@@ -1796,15 +1784,15 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 			nv_encoder->i2c = &nv_connector->aux.ddc;
 		}
 
-		if (nv_connector->type != DCB_CONNECTOR_eDP &&
-		    nv50_has_mst(drm)) {
+		if (nv_connector->type != DCB_CONNECTOR_eDP && nv_encoder->outp.info.dp.mst) {
 			ret = nv50_mstm_new(nv_encoder, &nv_connector->aux,
 					    16, nv_connector->base.base.id,
 					    &nv_encoder->dp.mstm);
 			if (ret)
 				return ret;
 		}
-	} else {
+	} else
+	if (nv_encoder->outp.info.ddc != NVIF_OUTP_DDC_INVALID) {
 		struct nvkm_i2c_bus *bus =
 			nvkm_i2c_bus_find(i2c, dcbe->i2c_index);
 		if (bus)
@@ -1927,12 +1915,12 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 
 	switch (dcbe->type) {
 	case DCB_OUTPUT_TMDS:
-		bus  = nvkm_i2c_bus_find(i2c, NVKM_I2C_BUS_EXT(dcbe->extdev));
+		bus  = nvkm_i2c_bus_find(i2c, nv_encoder->outp.info.ddc);
 		ddc  = bus ? &bus->i2c : NULL;
 		type = DRM_MODE_ENCODER_TMDS;
 		break;
 	case DCB_OUTPUT_DP:
-		aux  = nvkm_i2c_aux_find(i2c, NVKM_I2C_AUX_EXT(dcbe->extdev));
+		aux  = nvkm_i2c_aux_find(i2c, nv_encoder->outp.info.dp.aux);
 		ddc  = aux ? &aux->i2c : NULL;
 		type = DRM_MODE_ENCODER_TMDS;
 		break;
@@ -2695,12 +2683,10 @@ int
 nv50_display_create(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct dcb_table *dcb = &drm->vbios.dcb;
 	struct drm_connector *connector, *tmp;
 	struct nv50_disp *disp;
-	struct dcb_output *dcbe;
 	int ret, i;
-	bool has_mst = nv50_has_mst(drm);
+	bool has_mst = false;
 
 	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
 	if (!disp)
@@ -2777,54 +2763,75 @@ nv50_display_create(struct drm_device *dev)
 	}
 
 	/* create encoder/connector objects based on VBIOS DCB table */
-	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
+	for_each_set_bit(i, &disp->disp->outp_mask, sizeof(disp->disp->outp_mask) * 8) {
 		struct nouveau_encoder *outp;
 
 		outp = kzalloc(sizeof(*outp), GFP_KERNEL);
 		if (!outp)
 			break;
 
-		ret = nvif_outp_ctor(disp->disp, "kmsOutp", dcbe->id, &outp->outp);
+		ret = nvif_outp_ctor(disp->disp, "kmsOutp", i, &outp->outp);
 		if (ret) {
 			kfree(outp);
 			continue;
 		}
 
-		connector = nouveau_connector_create(dev, dcbe->connector);
+		connector = nouveau_connector_create(dev, outp->outp.info.conn);
 		if (IS_ERR(connector)) {
 			nvif_outp_dtor(&outp->outp);
 			kfree(outp);
 			continue;
 		}
 
-		outp->base.base.possible_crtcs = dcbe->heads;
+		outp->base.base.possible_crtcs = outp->outp.info.heads;
 		outp->base.base.possible_clones = 0;
-		outp->dcb = dcbe;
 		outp->conn = nouveau_connector(connector);
 
-		if (dcbe->location == DCB_LOC_ON_CHIP) {
-			switch (dcbe->type) {
-			case DCB_OUTPUT_TMDS:
-			case DCB_OUTPUT_LVDS:
-			case DCB_OUTPUT_DP:
-				ret = nv50_sor_create(outp);
-				break;
-			case DCB_OUTPUT_ANALOG:
-				ret = nv50_dac_create(outp);
-				break;
-			default:
-				ret = -ENODEV;
-				break;
-			}
-		} else {
-			ret = nv50_pior_create(outp);
+		outp->dcb = kzalloc(sizeof(*outp->dcb), GFP_KERNEL);
+		if (!outp->dcb)
+			break;
+
+		switch (outp->outp.info.proto) {
+		case NVIF_OUTP_RGB_CRT:
+			outp->dcb->type = DCB_OUTPUT_ANALOG;
+			outp->dcb->crtconf.maxfreq = outp->outp.info.rgb_crt.freq_max;
+			break;
+		case NVIF_OUTP_TMDS:
+			outp->dcb->type = DCB_OUTPUT_TMDS;
+			outp->dcb->duallink_possible = outp->outp.info.tmds.dual;
+			break;
+		case NVIF_OUTP_LVDS:
+			outp->dcb->type = DCB_OUTPUT_LVDS;
+			outp->dcb->lvdsconf.use_acpi_for_edid = outp->outp.info.lvds.acpi_edid;
+			break;
+		case NVIF_OUTP_DP:
+			outp->dcb->type = DCB_OUTPUT_DP;
+			outp->dcb->dpconf.link_nr = outp->outp.info.dp.link_nr;
+			outp->dcb->dpconf.link_bw = outp->outp.info.dp.link_bw;
+			if (outp->outp.info.dp.mst)
+				has_mst = true;
+			break;
+		default:
+			WARN_ON(1);
+			continue;
+		}
+
+		outp->dcb->heads = outp->outp.info.heads;
+		outp->dcb->connector = outp->outp.info.conn;
+		outp->dcb->i2c_index = outp->outp.info.ddc;
+
+		switch (outp->outp.info.type) {
+		case NVIF_OUTP_DAC : ret = nv50_dac_create(outp); break;
+		case NVIF_OUTP_SOR : ret = nv50_sor_create(outp); break;
+		case NVIF_OUTP_PIOR: ret = nv50_pior_create(outp); break;
+		default:
+			WARN_ON(1);
+			continue;
 		}
 
 		if (ret) {
 			NV_WARN(drm, "failed to create encoder %d/%d/%d: %d\n",
-				     dcbe->location, dcbe->type,
-				     ffs(dcbe->or) - 1, ret);
-			ret = 0;
+				i, outp->outp.info.type, outp->outp.info.proto, ret);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 1e5601223c75..5508a7cfd492 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -108,8 +108,6 @@ void nv50_dmac_destroy(struct nv50_dmac *);
  */
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 
-bool nv50_has_mst(struct nouveau_drm *drm);
-
 u32 *evo_wait(struct nv50_dmac *, int nr);
 void evo_kick(u32 *, struct nv50_dmac *);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 502f342e0d77..bde9bfae8d11 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -8,7 +8,36 @@ union nvif_outp_args {
 	struct nvif_outp_v0 {
 		__u8 version;
 		__u8 id;	/* DCB device index. */
-		__u8 pad02[6];
+#define NVIF_OUTP_V0_TYPE_DAC  0x00
+#define NVIF_OUTP_V0_TYPE_SOR  0x01
+#define NVIF_OUTP_V0_TYPE_PIOR 0x02
+		__u8 type;
+#define NVIF_OUTP_V0_PROTO_RGB_CRT 0x00
+#define NVIF_OUTP_V0_PROTO_TMDS    0x01
+#define NVIF_OUTP_V0_PROTO_LVDS    0x02
+#define NVIF_OUTP_V0_PROTO_DP      0x03
+	        __u8 proto;
+	        __u8 heads;
+	        __u8 ddc;
+	        __u8 conn;
+		union {
+			struct {
+				__u32 freq_max;
+			} rgb_crt;
+			struct {
+				__u8  dual;
+			} tmds;
+			struct {
+				__u8  acpi_edid;
+			} lvds;
+			struct {
+				__u8  aux;
+				__u8  mst;
+				__u8  increased_wm;
+				__u8  link_nr;
+				__u32 link_bw;
+			} dp;
+		};
 	} v0;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 2d86838ed559..bc122a5ba7df 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -8,6 +8,46 @@ struct nvif_disp;
 
 struct nvif_outp {
 	struct nvif_object object;
+	u32 id;
+
+	struct {
+		enum {
+			NVIF_OUTP_DAC,
+			NVIF_OUTP_SOR,
+			NVIF_OUTP_PIOR,
+		} type;
+
+		enum {
+			NVIF_OUTP_RGB_CRT,
+			NVIF_OUTP_TMDS,
+			NVIF_OUTP_LVDS,
+			NVIF_OUTP_DP,
+		} proto;
+
+		u8 heads;
+#define NVIF_OUTP_DDC_INVALID 0xff
+		u8 ddc;
+		u8 conn;
+
+		union {
+			struct {
+				u32 freq_max;
+			} rgb_crt;
+			struct {
+				bool dual;
+			} tmds;
+			struct {
+				bool acpi_edid;
+			} lvds;
+			struct {
+				u8   aux;
+				bool mst;
+				bool increased_wm;
+				u8   link_nr;
+				u32  link_bw;
+			} dp;
+		};
+	} info;
 
 	struct {
 		int id;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index bd55c3bd0957..856b3ef5edb8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1135,7 +1135,7 @@ nouveau_connector_atomic_check(struct drm_connector *connector, struct drm_atomi
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
-	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->dev)))
+	if (!nv_conn->dp_encoder || !nv_conn->dp_encoder->dp.mstm)
 		return 0;
 
 	return drm_dp_mst_root_conn_atomic_check(conn_state, &nv_conn->dp_encoder->dp.mstm->mgr);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 97e5855c2cf5..5d3190c05250 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -511,6 +511,50 @@ nvif_outp_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_out
 	if (ret)
 		return ret;
 
+	outp->id = args.id;
+
+	switch (args.type) {
+	case NVIF_OUTP_V0_TYPE_DAC : outp->info.type = NVIF_OUTP_DAC; break;
+	case NVIF_OUTP_V0_TYPE_SOR : outp->info.type = NVIF_OUTP_SOR; break;
+	case NVIF_OUTP_V0_TYPE_PIOR: outp->info.type = NVIF_OUTP_PIOR; break;
+		break;
+	default:
+		WARN_ON(1);
+		nvif_outp_dtor(outp);
+		return -EINVAL;
+	}
+
+	switch (args.proto) {
+	case NVIF_OUTP_V0_PROTO_RGB_CRT:
+		outp->info.proto = NVIF_OUTP_RGB_CRT;
+		outp->info.rgb_crt.freq_max = args.rgb_crt.freq_max;
+		break;
+	case NVIF_OUTP_V0_PROTO_TMDS:
+		outp->info.proto = NVIF_OUTP_TMDS;
+		outp->info.tmds.dual = args.tmds.dual;
+		break;
+	case NVIF_OUTP_V0_PROTO_LVDS:
+		outp->info.proto = NVIF_OUTP_LVDS;
+		outp->info.lvds.acpi_edid = args.lvds.acpi_edid;
+		break;
+	case NVIF_OUTP_V0_PROTO_DP:
+		outp->info.proto = NVIF_OUTP_DP;
+		outp->info.dp.aux = args.dp.aux;
+		outp->info.dp.mst = args.dp.mst;
+		outp->info.dp.increased_wm = args.dp.increased_wm;
+		outp->info.dp.link_nr = args.dp.link_nr;
+		outp->info.dp.link_bw = args.dp.link_bw;
+		break;
+	default:
+		WARN_ON(1);
+		nvif_outp_dtor(outp);
+		return -EINVAL;
+	}
+
+	outp->info.heads = args.heads;
+	outp->info.ddc = args.ddc;
+	outp->info.conn = args.conn;
+
 	outp->or.id = -1;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index b35fae96d855..a109348bd63b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -639,7 +639,7 @@ nvkm_dp_new(struct nvkm_disp *disp, int index, struct dcb_output *dcbE, struct n
 	struct nvkm_bios *bios = device->bios;
 	struct nvkm_i2c *i2c = device->i2c;
 	struct nvkm_outp *outp;
-	u8  hdr, cnt, len;
+	u8  ver, hdr, cnt, len;
 	u32 data;
 	int ret;
 
@@ -667,6 +667,9 @@ nvkm_dp_new(struct nvkm_disp *disp, int index, struct dcb_output *dcbE, struct n
 
 	OUTP_DBG(outp, "bios dp %02x %02x %02x %02x", outp->dp.version, hdr, cnt, len);
 
+	data = nvbios_dp_table(bios, &ver, &hdr, &cnt, &len);
+	outp->dp.mst = data && ver >= 0x40 && (nvbios_rd08(bios, data + 0x08) & 0x04);
+
 	mutex_init(&outp->dp.mutex);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 3ec7318d9144..ebd2f499b4b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -35,6 +35,8 @@ struct nvkm_outp {
 		struct {
 			struct nvbios_dpout info;
 			u8 version;
+			bool mst;
+			bool increased_wm;
 
 			struct nvkm_i2c_aux *aux;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index ad52d9ed594a..e4279f1772a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -606,10 +606,60 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	ret = -EBUSY;
 	spin_lock(&disp->client.lock);
 	if (!outp->object.func) {
+		switch (outp->info.type) {
+		case DCB_OUTPUT_ANALOG:
+			args->v0.type = NVIF_OUTP_V0_TYPE_DAC;
+			args->v0.proto = NVIF_OUTP_V0_PROTO_RGB_CRT;
+			args->v0.rgb_crt.freq_max = outp->info.crtconf.maxfreq;
+			break;
+		case DCB_OUTPUT_TMDS:
+			if (!outp->info.location) {
+				args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
+				args->v0.tmds.dual = (outp->info.tmdsconf.sor.link == 3);
+			} else {
+				args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
+				args->v0.tmds.dual = 0;
+			}
+			args->v0.proto = NVIF_OUTP_V0_PROTO_TMDS;
+			break;
+		case DCB_OUTPUT_LVDS:
+			args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
+			args->v0.proto = NVIF_OUTP_V0_PROTO_LVDS;
+			args->v0.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
+			break;
+		case DCB_OUTPUT_DP:
+			if (!outp->info.location) {
+				args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
+				args->v0.dp.aux = outp->info.i2c_index;
+			} else {
+				args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
+				args->v0.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
+			}
+			args->v0.proto = NVIF_OUTP_V0_PROTO_DP;
+			args->v0.dp.mst = outp->dp.mst;
+			args->v0.dp.increased_wm = outp->dp.increased_wm;
+			args->v0.dp.link_nr = outp->info.dpconf.link_nr;
+			args->v0.dp.link_bw = outp->info.dpconf.link_bw * 27000;
+			break;
+		default:
+			WARN_ON(1);
+			ret = -EINVAL;
+			goto done;
+		}
+
+		if (outp->info.location)
+			args->v0.ddc = NVKM_I2C_BUS_EXT(outp->info.extdev);
+		else
+			args->v0.ddc = outp->info.i2c_index;
+		args->v0.heads = outp->info.heads;
+		args->v0.conn = outp->info.connector;
+
 		nvkm_object_ctor(&nvkm_uoutp, oclass, &outp->object);
 		*pobject = &outp->object;
 		ret = 0;
 	}
+
+done:
 	spin_unlock(&disp->client.lock);
 	return ret;
 }
-- 
2.41.0

