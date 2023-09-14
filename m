Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D079FEE5
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C1110E53F;
	Thu, 14 Sep 2023 08:48:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E30110E545
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:14 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68fb98745c1so526228b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681293; x=1695286093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VsbNvPr/jq2xOb0Z6L4rT1XDcMq8s4ihlonFd0eOZMw=;
 b=ns24eB7uK4u4LtfAD21RZjy5lAha9QZYPjCcPI3ussZijKzZChotWDMWsewCU0ApSl
 WyoyeJmC8pm7ANOTOEC+OJ4IELyoZFQodyQxJmNYRD6E9eHz3oAwEwGdybw4HdLODAXh
 +sH1w8sSi/omtW5BVm9HxiwHncg/O2DpP0Wm+uAViqULtAeqYXkJVYcuh1cvbYcsJ6WU
 mqZTH6yvBoLxchLQE5eC8mGYsZyDsUzaboMJtkkjJI0Y7A+Tuy1HEca25rUOo8NpFJeP
 oTWzGatsFpK1fuoO9/VElrcXvN0FxtOLt2jk3uFT6qrKAD3x5zaNfrSs3COa+QQAh58f
 GeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681293; x=1695286093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsbNvPr/jq2xOb0Z6L4rT1XDcMq8s4ihlonFd0eOZMw=;
 b=SyL76VVomItWCS7vFoeZ/6SlV1iMwqDnMeeNawe66KP1h3AKpcONXoU/+p6jv2qxaz
 ymOUrZZtgtIXLqwNwDOICTuMiFCvDAYxR9XMtnPC/V2mU5sTK5nO/5kcX0HxOMGmOz36
 Y1z12jioGDV0eSkLvtoXyGXQHPdty+4INUkI2W2HQhA39OO+GREV8yRak0DmUdbvZD6B
 r44nAhEtrXRQGzVuPw2qJFzR1+iEtrcXOTxlaV8yLXEGdlyKhe81z04UD1+DYelJN4wQ
 xu6VT7VGhItOQPrnqZhICiLjEJ1LV+CVd/JoVj7za2uuGXezz3Vh75piT761vIs/xKGm
 GWFQ==
X-Gm-Message-State: AOJu0Ywk3AxJqxuCE4TbEFE6t9O1JpsKY7JtuvXMG4RI8uKzJAP7G5Fg
 rtW0gBPUP/7D1/pkXkOngz/VpyT03QI=
X-Google-Smtp-Source: AGHT+IGMyYAcXYYITL64XFt5CCOCNy68o/JGTDYbznPqDV0f9GBQwkeeeJfhsxm5yZVQeNh0p6sdnw==
X-Received: by 2002:a05:6a00:b93:b0:68f:d35d:217e with SMTP id
 g19-20020a056a000b9300b0068fd35d217emr5749907pfj.2.1694681293085; 
 Thu, 14 Sep 2023 01:48:13 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:12 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:15 +1000
Message-ID: <20230914084624.2299765-36-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 34/44] drm/nouveau/disp: add support for post-LT
 adjust
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

- fixes regression from previous commit

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 +++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 72 ++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 16 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 17 +++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 14 ++++
 7 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 14972b942be7..00ce0a46c152 100644
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
index 9a78483e0289..b4f97fabecbd 100644
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
index cd03c29c1063..7de7707ec6a8 100644
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
 
+	if ( (outp->dp.dpcd[DP_MAX_LANE_COUNT] & 0x20) &&
+	    !(outp->dp.dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED))
+	    post_lt = true;
+
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
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7ffd57d82f89..5fe5523587e6 100644
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
index 6f08ff8b1fba..77a91d42b977 100644
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
@@ -454,6 +456,20 @@ nvkm_dp_train_init(struct nvkm_outp *outp)
 	}
 }
 
+static int
+nvkm_dp_drive(struct nvkm_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
+{
+	struct lt_state lt = {
+		.outp = outp,
+		.stat[4] = (pe[0] << 2) | (vs[0] << 0) |
+			   (pe[1] << 6) | (vs[1] << 4),
+		.stat[5] = (pe[2] << 2) | (vs[2] << 0) |
+			   (pe[3] << 6) | (vs[3] << 4),
+	};
+
+	return nvkm_dp_train_drive(&lt, false);
+}
+
 static int
 nvkm_dp_train(struct nvkm_outp *outp, bool retrain)
 {
@@ -597,6 +613,7 @@ nvkm_dp_func = {
 	.dp.aux_pwr = nvkm_dp_aux_pwr,
 	.dp.aux_xfer = nvkm_dp_aux_xfer,
 	.dp.train = nvkm_dp_train,
+	.dp.drive = nvkm_dp_drive,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 014b95b0f561..cda17941de89 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -108,6 +108,7 @@ struct nvkm_outp_func {
 		int (*aux_xfer)(struct nvkm_outp *, u8 type, u32 addr, u8 *data, u8 *size);
 		int (*rates)(struct nvkm_outp *);
 		int (*train)(struct nvkm_outp *, bool retrain);
+		int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index a256b35ce79c..b634e76c2a9b 100644
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
@@ -447,6 +460,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

