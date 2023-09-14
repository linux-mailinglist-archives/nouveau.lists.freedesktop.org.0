Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7979FEE6
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6B510E548;
	Thu, 14 Sep 2023 08:48:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32610E542
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:16 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6903a452dfaso42595b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681295; x=1695286095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4vFewtBo7PSqWaoXqHAoQoyHmVb0uQFw5R3kjrf+e0=;
 b=WUT9PTH0hVOKhfQTjM4MbOsfi7OypH4nXAUS7CET0ZCbWwmJWPIcVei/GJXzaE7i1m
 xnaN4y6uxk0cjhaCeBVMhtHfjLUCnPpShMco5KQeW07KwTngJZ3YDnPLefnQeQjz5Enn
 KoXXYvR7kglhg0PwLvzl3YdjY5pOedWN8Q5H/+CJa12D5Ccv/iU6EyHWtH8/sFCx4B7a
 y1XABgqu9ZXqiuE1e1sFqyvNkF9KrAmsuJxVZQyV7nlSet7MTVqD/wb9jsc82+CEhDRF
 LpqMvdudCoAOxgrdzrixAeudI3lS7RhsvqNh+QFX43Zf1jyISF4DGbBoCqqMO6sWzK0G
 cbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681295; x=1695286095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4vFewtBo7PSqWaoXqHAoQoyHmVb0uQFw5R3kjrf+e0=;
 b=Kx2MW5sBEvwrxjTlFK1wVuD/ZxTVqmkHQ7GKKEXOdz6h+Qgt7ylDIcpc39/fP8bcxE
 ublu2C9l36w4AUt8hA8nOZdegrk8AjUvxS4zZ/WvXr5qlgRErQUHRg5zTbxwOXSAVv/g
 GYWSPC/dfcB/NNEcBEqSmIO1PLqXglPsfcvuShBK4LEd6+nUCks5xxbynib4jjCiVy0d
 TcQgxs4cMtrtJEcs3DzN+nzm9dt9TeHWPEav1H9yy35ogeigC1FuLn43ecr2HZ1P5yQw
 lVNYC8Izh1NNqvjKj2TBT2DMIP1IfgmjOScOlzl1d/hUerTyrUOBPe4i0wYs1WNlZeiy
 VLZg==
X-Gm-Message-State: AOJu0Yz7/jDnrBBuL4MSyO6Tff6aXlwvheP8I72zeozThYvOvII6vS7Q
 oR2sOeaEjVhKeqbY4AWhirvZqY2Ea/A=
X-Google-Smtp-Source: AGHT+IFZq920f0QcrRDMNbc+5VK4J/SneQgeJRVTxL3V3+JHsk7OTObmHTfsL0Dmdz6Q42yqQbeSeQ==
X-Received: by 2002:a05:6a00:1489:b0:68e:3f55:742 with SMTP id
 v9-20020a056a00148900b0068e3f550742mr5427609pfu.30.1694681295220; 
 Thu, 14 Sep 2023 01:48:15 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:14 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:16 +1000
Message-ID: <20230914084624.2299765-37-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 35/44] drm/nouveau/disp: add dp sst config method
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

This is presently unused on HW, we read a bunch of regs and calculate
the watermark during the second supervisor interrupt.

I don't want to change this yet as I need to re-remember how older HW
works exactly, but RM wants this info via RPC.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 +++++++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
 drivers/gpu/drm/nouveau/nvif/outp.c           | 18 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 21 +++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 00ce0a46c152..6fb297b65ae8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -36,6 +36,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
+#define NVIF_OUTP_V0_DP_SST        0x75
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -222,6 +223,17 @@ union nvif_outp_dp_drive_args {
 	} v0;
 };
 
+union nvif_outp_dp_sst_args {
+	struct nvif_outp_dp_sst_v0 {
+		__u8  version;
+		__u8  head;
+		__u8  pad02[2];
+		__u32 watermark;
+		__u32 hblanksym;
+		__u32 vblanksym;
+	} v0;
+};
+
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index b4f97fabecbd..881cbed5f0ee 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -68,6 +68,7 @@ int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
 		       bool retrain);
 int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
+int nvif_outp_dp_sst(struct nvif_outp *, int head, u32 watermark, u32 hblanksym, u32 vblanksym);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 5fe5523587e6..952103aa93b7 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -46,6 +46,24 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 	return ret;
 }
 
+int
+nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym, u32 vblanksym)
+{
+	struct nvif_outp_dp_sst_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.head = head;
+	args.watermark = watermark;
+	args.hblanksym = hblanksym;
+	args.vblanksym = vblanksym;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_SST, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object,
+		   "[DP_SST head:%d watermark:%d hblanksym:%d vblanksym:%d]",
+		   args.head, args.watermark, args.hblanksym, args.vblanksym);
+	return ret;
+}
+
 int
 nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 8686e5c044a5..9beb9d1e8633 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -84,6 +84,8 @@ struct nvkm_ior_func {
 		void (*pattern)(struct nvkm_ior *, int pattern);
 		void (*drive)(struct nvkm_ior *, int ln, int pc,
 			      int dc, int pe, int tx_pu);
+		int (*sst)(struct nvkm_ior *, int head, bool ef,
+			   u32 watermark, u32 hblanksym, u32 vblanksym);
 		void (*vcpi)(struct nvkm_ior *, int head, u8 slot,
 			     u8 slot_nr, u16 pbn, u16 aligned);
 		void (*audio)(struct nvkm_ior *, int head, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index b634e76c2a9b..225f88fbdae0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -45,6 +45,26 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_sst_args *args = argv;
+	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_ior *ior = outp->ior;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	if (!ior->func->dp || !nvkm_head_find(disp, args->v0.head))
+		return -EINVAL;
+	if (!ior->func->dp->sst)
+		return 0;
+
+	return ior->func->dp->sst(ior, args->v0.head,
+				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
+}
+
 static int
 nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -461,6 +481,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

