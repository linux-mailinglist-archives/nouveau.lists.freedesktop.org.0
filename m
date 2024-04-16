Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FE8A7925
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF9C112FB3;
	Tue, 16 Apr 2024 23:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rd/5tJrQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D123710E206
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4kYLy6cTF/lrnhqhw0WmaF17nw6lWJR3fiHu4YAlKbYoiCkEnXdqamLqAO4EtSNnZoNYzoAP1aIXqroD2w3kEwx/ITPBTCCpTMF86Mqvr0moF9Q6FBJYmPHzeV5T6SM93/PEWel3XUDi//kr/qVdkH51QvzUvBk7G6KEtVbDnw4N4AyzXOdkrNVqBwd2P3n3wZICMiWHhFIMywA6YZHcO1NN4Mt7ipYoJOP9T39iUBEALxgYrHWV8HY3SN83kPDpYbVpR74MpZ/fixUqZZIXUuUSziTQKEw+ZNRMjt3Uyy/+NuocSZSTDo+e6Tekve3to7vGbg8hVynT+nEVXRf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKsMksZ5upc2s6//XI1dnaq91SUbbgfC3xXN1QyVFkc=;
 b=EcbgJgYacj4bAQrq/3NVQ7pwgYSH7eEWRDwPwjyQ6ejsYb3OUBLWkPKbrekTuMUw/mlvfI7KQ1b+NPH2Z5OnPbxq7NA21guD0OXYGRI/KaRiWaJ2PADPheKvrCkqmhanHC4pHW/FHRgaOXAc1UdwyT51NLcjSL29Wb0nKmDgzVwshl6Nz2vXgGM9ekFMTOLdwGrVqHh3VH3o5Bs/t3m//jx6wNX+UBbHI7mwUCsdlExZPs/K9zUmBdBSeXBH1x11TANNdzMtwrdPA9wLlwqXNPwDZyRngRkiP795dpgsgp604lYd8Rtrl2uQEUbtC30LMDRHewYwvfdzpdzwg2ePEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKsMksZ5upc2s6//XI1dnaq91SUbbgfC3xXN1QyVFkc=;
 b=rd/5tJrQiYMsKFOdNks/NgZAMUQpXrrquvphMVq5Zd1+4JeJHgq8rMqL8mDzu89GGZrO1A4igAtj4hMSaqpKvcApoE+koPmkB5kAFCX8mfxLyRHhL4MCmeIzfWMeDnqjz8qKlTgrBFT6MHFVMtRdEbr3P6iKLC7tX2GocEEh1fLGXJbpbi5IKyXvZbKeLQrB43cQMVHoyb+HJHniYE3WLjJTKmRBaXfDAxhGq0IPYxlAh3CnhGSQmyqGIFzrJJAZSOJQ25/b60KydlYXEGkg1br6/o3+KjEGkrPm/PMt6r7z1G/gOVoZGEoYbo7UqOcARYv14lmoCnz81gakUcGn1w==
Received: from DM6PR02CA0048.namprd02.prod.outlook.com (2603:10b6:5:177::25)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:59 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::12) by DM6PR02CA0048.outlook.office365.com
 (2603:10b6:5:177::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:42 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 115/156] drm/nouveau/nvif: rework outp "infoframe" api
Date: Wed, 17 Apr 2024 09:39:21 +1000
Message-ID: <20240416234002.19509-116-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: bacd0b0d-8dd3-494d-f429-08dc5e6ef273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpLjT0Teeatr0HSkIkYvrjFKjJWzS4Bb8DJTavUEB7RGesZp6z11dgUVoJpjFzG6njtyX3CdLG5b965XRxm9oIVEdoa6+i1E4z6rX2Mrp0jZ1eTn89QZLn6WoX6K6e0WCXIS36eHTESvUpMWBom2Kumza/vpwEwlOMDtjofAT53+2sHGwVkNP6jGOFPy9wIrrKKF+kEW5MXX5sDg2fJz7vdUi1frSCKzR3ucsUdsInZg3KuFyHlLvRk+wb8V3HnmJCvrXS2EIqwloc99YjvUgLyHHjfyPSDIcZ+z70f86/Q9PgygnzHF0WJEaeTbd5keQVWpUoHd1lEibxcyILVrMzzdKrlP/TltML0nvaQE4XP1dHHcKEy9oPFBFUpAu4PTvDbGQ6cfrvCdg7gcEPxVIV7P4r21YNa4XKd9UN5T8cJc9riG+aVlcptg1MqJ2KlmlZ7oGARDDKjfwHGzwWihrPL/aMSfcd9iWryaJmZ3sftFhCxKXMgeO/adIeyBkIO1ELVGa4UIg+92an9VZLfg04LfgYs0qA/xcABXtkIvzawmSMvEfYFT+GDg+9IBmv+oomKkD8AwEWNa+PPi/Zy5QvyGnT29QdAluLeUSy/jvISXccjhK8LgrwBj5nGtowV+eSDynm1NLO5W4sl7nFmdPjrldmd96Vm7NcUTydnPamJ6RFcDt6sd3v/mR47Zhw+h8qrDOKUWTGHcvLnpTAi2NMPupCX3EOW4JG/vMP2r44fRBXUpKdUuUHVmgft6ZO9w
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:58.5460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bacd0b0d-8dd3-494d-f429-08dc5e6ef273
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 18 +++------
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  7 ++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 13 -------
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  3 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           |  7 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 38 +++++++++++--------
 6 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e2d71916326f..0bac0e813184 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -755,10 +755,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	union hdmi_infoframe infoframe = { 0 };
 	const u8 rekey = 56; /* binary driver, and tegra, constant */
 	u32 max_ac_packet;
-	struct {
-		struct nvif_outp_infoframe_v0 infoframe;
-		u8 data[17];
-	} args = { 0 };
+	u8 data[17] = {};
 	int ret, size;
 
 	max_ac_packet  = mode->htotal - mode->hdisplay;
@@ -795,29 +792,26 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		return;
 
 	/* AVI InfoFrame. */
-	args.infoframe.version = 0;
-	args.infoframe.head = nv_crtc->index;
-
 	if (!drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi, &nv_connector->base, mode)) {
 		drm_hdmi_avi_infoframe_quant_range(&infoframe.avi, &nv_connector->base, mode,
 						   HDMI_QUANTIZATION_RANGE_FULL);
 
-		size = hdmi_infoframe_pack(&infoframe, args.data, ARRAY_SIZE(args.data));
+		size = hdmi_infoframe_pack(&infoframe, data, ARRAY_SIZE(data));
 	} else {
 		size = 0;
 	}
 
-	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, &args.infoframe, size);
+	nvif_outp_infoframe(&nv_encoder->outp, nv_crtc->index, NVIF_OUTP_INFOFRAME_AVI, data, size);
 
 	/* Vendor InfoFrame. */
-	memset(&args.data, 0, sizeof(args.data));
+	memset(data, 0, sizeof(data));
 	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
 							 &nv_connector->base, mode))
-		size = hdmi_infoframe_pack(&infoframe, args.data, ARRAY_SIZE(args.data));
+		size = hdmi_infoframe_pack(&infoframe, data, ARRAY_SIZE(data));
 	else
 		size = 0;
 
-	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
+	nvif_outp_infoframe(&nv_encoder->outp, nv_crtc->index, NVIF_OUTP_INFOFRAME_VSI, data, size);
 
 	nv_encoder->hdmi.enabled = true;
 }
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 6f1ec831b4d7..cef19e04f208 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -244,6 +244,11 @@ struct nvif_conn_impl {
 		     const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
+enum nvif_outp_infoframe_type {
+	NVIF_OUTP_INFOFRAME_AVI,
+	NVIF_OUTP_INFOFRAME_VSI,
+};
+
 enum nvif_outp_detect_status {
 	NVIF_OUTP_DETECT_NOT_PRESENT,
 	NVIF_OUTP_DETECT_PRESENT,
@@ -295,6 +300,8 @@ struct nvif_outp_impl {
 		int (*config)(struct nvif_outp_priv *, u8 head, bool enable, u8 max_ac_packet,
 			      u8 rekey, u32 khz, bool scdc, bool scdc_scrambling,
 			      bool scdc_low_rates);
+		int (*infoframe)(struct nvif_outp_priv *, u8 head, enum nvif_outp_infoframe_type,
+				 u8 *data, u8 size);
 	} hdmi;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index c2a3af721116..a045c66fc1ca 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_INFOFRAME     0x60
 #define NVIF_OUTP_V0_HDA_ELD       0x61
 
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
@@ -17,18 +16,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_infoframe_args {
-	struct nvif_outp_infoframe_v0 {
-		__u8 version;
-#define NVIF_OUTP_INFOFRAME_V0_AVI 0
-#define NVIF_OUTP_INFOFRAME_V0_VSI 1
-		__u8 type;
-		__u8 head;
-		__u8 pad03[5];
-		__u8 data[];
-	} v0;
-};
-
 union nvif_outp_hda_eld_args {
 	struct nvif_outp_hda_eld_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 7a64a7d2ac97..8be799c88aff 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -49,7 +49,8 @@ int nvif_outp_lvds(struct nvif_outp *, bool dual, bool bpc8);
 int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet, u8 rekey, u32 khz,
 		   bool scdc, bool scdc_scrambling, bool scdc_low_rates);
 
-int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
+int nvif_outp_infoframe(struct nvif_outp *, int head, enum nvif_outp_infoframe_type,
+			u8 *data, u8 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 99a1e0073166..4ecdc44eb84a 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -214,13 +214,12 @@ nvif_outp_hda_eld(struct nvif_outp *outp, int head, void *data, u32 size)
 }
 
 int
-nvif_outp_infoframe(struct nvif_outp *outp, u8 type, struct nvif_outp_infoframe_v0 *args, u32 size)
+nvif_outp_infoframe(struct nvif_outp *outp, int head, enum nvif_outp_infoframe_type type,
+		    u8 *data, u8 size)
 {
 	int ret;
 
-	args->type = type;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_INFOFRAME, args, sizeof(*args) + size);
+	ret = outp->impl->hdmi.infoframe(outp->priv, head, type, data, size);
 	NVIF_ERRON(ret, &outp->object, "[INFOFRAME type:%d size:%d]", type, size);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 325af91075ab..a694a43fd495 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -245,29 +245,35 @@ nvkm_uoutp_mthd_hda_eld(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_infoframe(struct nvif_outp_priv *uoutp, u8 head,
+		     enum nvif_outp_infoframe_type type, u8 *data, u8 size)
 {
-	struct nvkm_ior *ior = outp->ior;
-	union nvif_outp_infoframe_args *args = argv;
-	ssize_t size = argc - sizeof(*args);
+	struct nvkm_ior *ior;
+	int ret;
 
-	if (argc < sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!nvkm_head_find(outp->disp, args->v0.head))
+	if (!nvkm_head_find(uoutp->outp->disp, head))
 		return -EINVAL;
 
-	switch (ior->func->hdmi ? args->v0.type : 0xff) {
-	case NVIF_OUTP_INFOFRAME_V0_AVI:
-		ior->func->hdmi->infoframe_avi(ior, args->v0.head, &args->v0.data, size);
-		return 0;
-	case NVIF_OUTP_INFOFRAME_V0_VSI:
-		ior->func->hdmi->infoframe_vsi(ior, args->v0.head, &args->v0.data, size);
-		return 0;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
+
+	ior = uoutp->outp->ior;
+
+	switch (ior->func->hdmi ? type : 0xff) {
+	case NVIF_OUTP_INFOFRAME_AVI:
+		ior->func->hdmi->infoframe_avi(ior, head, data, size);
+		break;
+	case NVIF_OUTP_INFOFRAME_VSI:
+		ior->func->hdmi->infoframe_vsi(ior, head, data, size);
+		break;
 	default:
+		ret = -EINVAL;
 		break;
 	}
 
-	return -EINVAL;
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -533,7 +539,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
@@ -670,6 +675,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		}
 		uoutp->impl.proto = NVIF_OUTP_TMDS;
 		uoutp->impl.hdmi.config = nvkm_uoutp_hdmi;
+		uoutp->impl.hdmi.infoframe = nvkm_uoutp_infoframe;
 		break;
 	case DCB_OUTPUT_LVDS:
 		uoutp->impl.type = NVIF_OUTP_SOR;
-- 
2.41.0

