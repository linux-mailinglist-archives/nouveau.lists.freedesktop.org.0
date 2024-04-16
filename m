Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5958E8A7920
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAE910FDD6;
	Tue, 16 Apr 2024 23:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cCzzVtbC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0BF10F546
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hxhamq62R72qMV/YENHPy9aHzG06h10JK8HdDdgPy59qzDiZT3xDV6AZE7P9LPRWpeQLvOiEvb5fyqs+T90I2p9I+6pDaeN+y+xmrh36zepnCGYMngB6ODD+2ge3OT2iLhf3qIOgudkn0QhAvlYdGrbOuwdDdKrtTaStqFcaZuQogeJYqovMK2o5gNOsfJA9bO9+iODHDK2U4kVtf7O8QYijIKaY33DG5aLnDnY0grLPbr6g3ILqJpOKlxUskvKWzWp/TPE51MKRglHzvBseJGrX0rKIPqldvYjVHkIqLSpqMlEuOAxdJ3lwoSSJ/brya4APdAg9F+kGmcPR2MdWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnoMO82xIRVnu4IhGQFBXedCnJhmvuoUukoPgVRPMPs=;
 b=UnM2IkycJacqJQiC2nwMIJOYS88HyB2onwD5n5zXd26Nv6906x0e0bzAS2zAnW6ivJGpdP1+aVhuEZGmRTv1t7+6Ny+B0RfxCo76KJD+R5VsCgaXovARdrYM8guqhsF4qojJ3bMVswyOKqqwYL15e7VmEBDFi92TU+6AEVJG63T82Yw3AZgahEhUEPquL2S2/sYy0xBKZacO+YRVxG7T4bmTZ6dx5EHpsjhbgMOGFJ+BXIXZ/Qix6//WAipCgnxqKgC9LNDKz8+wK/6o5LSMdBmoyZ3q438hTKoA3b8KKlzF/av8jFR3pLrcYDlY5tntfWQC4/zQlamPwG4wmTN0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnoMO82xIRVnu4IhGQFBXedCnJhmvuoUukoPgVRPMPs=;
 b=cCzzVtbC7m1qanUqHZuROpwtu+Nc40A8Jay01IYaOt2s33e8N7nI3oW7H2cKrJaHZ4/EtjCwF8/s5+cF/r5g6SKTaA1IZ7yhIv4YlUUWkHWu3F/OGJq9tNKNftbYIqZXTmlUxX7IUJW5sVSaSmSv6GX59WLuZowgJTI03wUnRfnSsbskXKfQhFW4UnJfs3kz8qChgu00QMyZJziP4GMStjHG8J9oAJN7oXnAggOs+PwHUYE1ayvF0dk8eESLbo9ZKOjHAKGsQkZo+b5hipK2QsfJ//HiWbvn6ffs+tuhh72YI+Dr2ptwG2tGJ2nBT8n3em2XORJ1uH2gJ4FyKhROKA==
Received: from CH0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:610:e6::35)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:03 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::64) by CH0PR03CA0300.outlook.office365.com
 (2603:10b6:610:e6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:41 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 114/156] drm/nouveau/nvif: rework outp "hdmi config" api
Date: Wed, 17 Apr 2024 09:39:20 +1000
Message-ID: <20240416234002.19509-115-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: db0c8096-a541-4b9d-14c5-08dc5e6ef4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rygGiqkD/15pd8EkfWkKtmxQ9kF4Ai9oAE6McFd717YSNOLGY4JVxiliaqmbDxNaV41UL+OlBswumD2GdEgz4qNZTHIbPfTjKgR54flmW1TZFQQrlI/CLg7KS45IMJWq/JjQPNmVEBovdQnCUKN4rfIx97TSK2exoBRqwGt5cbqObJ5tnwALzI3k/bVZbb9waez0Jl4HbMfVkbEMy9x5Q7u9LAEexv8f08FQNGRj4raKy0MwuqI+/qYVG/uYLmCYILhOIXHBYK4uchlw/6h9HOjQgbnYYsE5t8Q1LP3cR4TrPRFYUvhh+r05/n9DQHhWl65vxUWdSSQTrhgYrKS1pD1rlso1fmyMquFyyVtg8hDf/fBt9OzL9GRtBDJIrtxbqOZTlZaclCOd9hYNX6ObgMMNMPWNLEAuKpuIQHO8tZorYSzjyBHJMBsObpjdXdnEFJw4J/pz63Hc4vb47O0WFlqg58mmFNXlPXpiZcxojYG2dE6s7r2Dmz/IeLwcDMqvMRccX/da6YcGMYHx4izg0X5huVOxMLfw+YeSVk3HJwxGUPyU4/GhHI5b0ybq/qMlRrPgFoJPWK/+J24fn2hsZOtx0Ya2wSWYkjscES/l3J1rltYp53DYqbCIuIHvghprnz5+IZIETt6bvRaa791uqx0aPMTSC86C1gjqZFsxMkQ7OsDOt+asGmQMySKrQZHE8cDJ73oClHgrHn3evHBeWvK2g4meI0boSCCzBD2ibJvdnvkpHglyrHAaR7DE0Rfn
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:02.4961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0c8096-a541-4b9d-14c5-08dc5e6ef4d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  6 +++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 16 -------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 18 ++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 47 ++++++++++++-------
 4 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 1eec40976a70..6f1ec831b4d7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -291,6 +291,12 @@ struct nvif_outp_impl {
 		u8 dual;
 	} tmds;
 
+	struct {
+		int (*config)(struct nvif_outp_priv *, u8 head, bool enable, u8 max_ac_packet,
+			      u8 rekey, u32 khz, bool scdc, bool scdc_scrambling,
+			      bool scdc_low_rates);
+	} hdmi;
+
 	struct {
 		u8 acpi_edid;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index d8c6e84cf5ae..c2a3af721116 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,8 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_HDMI          0x50
-
 #define NVIF_OUTP_V0_INFOFRAME     0x60
 #define NVIF_OUTP_V0_HDA_ELD       0x61
 
@@ -19,20 +17,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_hdmi_args {
-	struct nvif_outp_hdmi_v0 {
-		__u8 version;
-		__u8 head;
-		__u8 enable;
-		__u8 max_ac_packet;
-		__u8 rekey;
-		__u8 scdc;
-		__u8 scdc_scrambling;
-		__u8 scdc_low_rates;
-		__u32 khz;
-	} v0;
-};
-
 union nvif_outp_infoframe_args {
 	struct nvif_outp_infoframe_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index edcb5598efac..99a1e0073166 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -229,25 +229,15 @@ int
 nvif_outp_hdmi(struct nvif_outp *outp, int head, bool enable, u8 max_ac_packet, u8 rekey,
 	       u32 khz, bool scdc, bool scdc_scrambling, bool scdc_low_rates)
 {
-	struct nvif_outp_hdmi_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.head = head;
-	args.enable = enable;
-	args.max_ac_packet = max_ac_packet;
-	args.rekey = rekey;
-	args.khz = khz;
-	args.scdc = scdc;
-	args.scdc_scrambling = scdc_scrambling;
-	args.scdc_low_rates = scdc_low_rates;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDMI, &args, sizeof(args));
+	ret = outp->impl->hdmi.config(outp->priv, head, enable, max_ac_packet, rekey, khz,
+				      scdc, scdc_scrambling, scdc_low_rates);
 	NVIF_ERRON(ret, &outp->object,
 		   "[HDMI head:%d enable:%d max_ac_packet:%d rekey:%d khz:%d scdc:%d "
 		   "scdc_scrambling:%d scdc_low_rates:%d]",
-		   args.head, args.enable, args.max_ac_packet, args.rekey, args.khz,
-		   args.scdc, args.scdc_scrambling, args.scdc_low_rates);
+		   head, enable, max_ac_packet, rekey, khz,
+		   scdc, scdc_scrambling, scdc_low_rates);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 93de3990554e..325af91075ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -271,36 +271,47 @@ nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_hdmi(struct nvif_outp_priv *uoutp, u8 head, bool enable, u8 max_ac_packet, u8 rekey,
+	        u32 khz, bool scdc, bool scdc_scrambling, bool scdc_low_rates)
 {
-	union nvif_outp_hdmi_args *args = argv;
-	struct nvkm_ior *ior = outp->ior;
+	struct nvkm_outp *outp = uoutp->outp;
+	struct nvkm_ior *ior;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	if (!(outp->asy.head = nvkm_head_find(outp->disp, args->v0.head)))
+	if (!(outp->asy.head = nvkm_head_find(outp->disp, head))) {
+		nvkm_uoutp_unlock(uoutp);
 		return -EINVAL;
+	}
+
+	ior = outp->ior;
 
 	if (!ior->func->hdmi ||
-	    args->v0.max_ac_packet > 0x1f ||
-	    args->v0.rekey > 0x7f ||
-	    (args->v0.scdc && !ior->func->hdmi->scdc))
+	    max_ac_packet > 0x1f ||
+	    rekey > 0x7f ||
+	    (scdc && !ior->func->hdmi->scdc)) {
+		nvkm_uoutp_unlock(uoutp);
 		return -EINVAL;
+	}
 
-	if (!args->v0.enable) {
-		ior->func->hdmi->infoframe_avi(ior, args->v0.head, NULL, 0);
-		ior->func->hdmi->infoframe_vsi(ior, args->v0.head, NULL, 0);
-		ior->func->hdmi->ctrl(ior, args->v0.head, false, 0, 0);
+	if (!enable) {
+		ior->func->hdmi->infoframe_avi(ior, head, NULL, 0);
+		ior->func->hdmi->infoframe_vsi(ior, head, NULL, 0);
+		ior->func->hdmi->ctrl(ior, head, false, 0, 0);
+		nvkm_uoutp_unlock(uoutp);
 		return 0;
 	}
 
-	ior->func->hdmi->ctrl(ior, args->v0.head, args->v0.enable,
-			      args->v0.max_ac_packet, args->v0.rekey);
+	ior->func->hdmi->ctrl(ior, head, enable,
+			      max_ac_packet, rekey);
 	if (ior->func->hdmi->scdc)
-		ior->func->hdmi->scdc(ior, args->v0.khz, args->v0.scdc, args->v0.scdc_scrambling,
-				      args->v0.scdc_low_rates);
+		ior->func->hdmi->scdc(ior, khz, scdc, scdc_scrambling,
+				      scdc_low_rates);
 
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -522,7 +533,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
@@ -659,6 +669,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 			uoutp->impl.tmds.dual = 0;
 		}
 		uoutp->impl.proto = NVIF_OUTP_TMDS;
+		uoutp->impl.hdmi.config = nvkm_uoutp_hdmi;
 		break;
 	case DCB_OUTPUT_LVDS:
 		uoutp->impl.type = NVIF_OUTP_SOR;
-- 
2.41.0

