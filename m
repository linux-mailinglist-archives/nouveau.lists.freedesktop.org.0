Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D88A7917
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45755112FA5;
	Tue, 16 Apr 2024 23:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOPKVNVq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1912112F37
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbynerOspo1i5Irwe1rL1EoQUeXqtmpqlKh+g/fBQ65ypKkxvewWRIwcBz/wDRWXZaNOGm5L6qkmSLb7Qznlt1TJ8Sc7xaB0IKnD30I4qEqtRXfqB33kSVT775j7icPjoP/qi6ozPzFTp8fv3vG9YCovrwqSWR1r7Z5YbszYLp4LJpoEGkmvjarZEw5f1EmJQ62YDG97xBsCqnidjnNXpLf5okqkzTomQQqH3wGKl2deYVWkMuKy51U91p95GTrmMRgej3Z2ErnYozU9I51q+VAlSAaFGY8K7iMIUu56HBtxyWx4htCpYVpTBt8kvMnU2XOzDkk0/wVxjYLjqMAcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sijLQl5OCOMkFb9X90bM+vdDu8fVO9SDYvj3HISFii4=;
 b=UkbHTvZ0RJwquZl5ep3BaOPGOYbV7GRuE09WlDrXz0a6hAwo4i4sJubmem4mxWs4G4VMrTiCD9Ht8K1VfoWSRK5JmT+u4adu/ZC9n6j/9SyW6A5FIS3O7m95jg8BGwVybeASV8mxVMYDHCwThNEM+VYHz26HhfVqduQ0Y9pVU4mrcmY1i3yZihPYlIGVSfp/IQ7Exl2bMMR58Eli6kXyx/fq4kMRFPIj0A2iYUWTHqvJpIZZRiKbbYwe2HtFeBmIbXoHXbTdPUReRjYaGLtvzLf3xB96JOFOT88+UvyHX0qcmDFwjaPdXnpDwe75CZ4cLQRC75CjsGlHth47TBriIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sijLQl5OCOMkFb9X90bM+vdDu8fVO9SDYvj3HISFii4=;
 b=EOPKVNVqQkJjKpk+6okMvwLxhcYtRC3yt4XY/WGbcxQQqKmstqNAA0/BCATpZYrPMBunar32rUhetby1/NO62nr95b9sfhMt5BafYL0Rne0z5aH5tia3pmTtleZUj5pFZWPIFjtdPTH9GU1UXJtvYkeolqr+023n6otEEcGoqyV7EXw/qnUWno7cNv7xZmwzNg5AAXZ4FW3/7SmuYMab8ATt7b1xqOZl2B5hssAkJvexqFfC+uSzCPca8JbNp04oVz51zL/Ts/KBhcB3Tz3MH9vaTyVYLvaRBU94EFfAN8EIaHErNAmUUZrOSOvTeCLChOQT48QgAuIF+VuU4haneA==
Received: from DS7PR03CA0112.namprd03.prod.outlook.com (2603:10b6:5:3b7::27)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:51 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::c5) by DS7PR03CA0112.outlook.office365.com
 (2603:10b6:5:3b7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:30 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 105/156] drm/nouveau/nvif: rework disp "new outp" api
Date: Wed, 17 Apr 2024 09:39:11 +1000
Message-ID: <20240416234002.19509-106-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c11d019-3345-4272-b2c2-08dc5e6eee69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7j/9Rd6GmjkG82jBOZjAC08gEUgg8hV8y/XXEyEZix8lGRCT2MbPmTZCwQNawLKle9Pu1WASZe2U3ZlJpkzEo8p+Avr1n0KsU39EZJ5+e/O4Le5cARe5hea23F8aS98Mtuhe8gWQrJKjDXUa45GOebYT6fZSzuEo13/mZDLZZqLhCTgai4FmhHDPzHfVdc9cxBTjogtHm9E4EUjEacrS3PdFSdwrgEurpxNZZJIdc5QdvGDFxq1s4RjGbfBCskVv3heDJQEuQwFgMgN7FugRICVFXqqhUNJcV0R3nLKWveKYlnHHXieH3tI3nx64mKH9bdIMQLba3VOuojUWhC2mHzhwUk7fSNs2t+CXzRWA614GLRwV00B6Ssqyj+TiylUEec6A6X/yJsxZwzI2MxdoabJrPHcf4lFl3UcRMma23iqHTLjJQwtrHQ9rG5JJIGEERTwMHoTNZFCdmzUXxCGabA85a/S81c+C7EXqoTLNeuWF+lGvnMP4Ew0rIFe+QTxHWejMjhjib1J3tK3za5Mz+PdPenoFhLWz8lQpf/Ud/t0V4mfkqw+KFdKCIpvDmW8X0dGHC7PAIlnGYGpXS/vHL2uG1tu/292wKQYLGPKMbOqmB2e9Q0crj+eyhNW18HdP5/nHZIRwQzPrctVUI/QNPFVOIl6HTthsTYQmZmxbDLkcudzFpZbubAQayyD0vyD9+/QeeVExVPPf06P4rIXCS9nQbpyMP2/5xzNoXwiG/y3n6zPIWJzSebjqWmJE+Vb
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:51.7679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c11d019-3345-4272-b2c2-08dc5e6eee69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
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

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 40 ++++----
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 47 ++++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 37 --------
 drivers/gpu/drm/nouveau/include/nvif/outp.h   | 43 +--------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 59 ++----------
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  1 -
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 24 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 92 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.h  |  3 +
 9 files changed, 152 insertions(+), 194 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 802dccace624..e2d71916326f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1608,7 +1608,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
 	u64 NumBlankingLinkClocks;
 	u32 MinHBlank;
 
-	if (outp->outp.info.dp.increased_wm) {
+	if (outp->outp.impl->dp.increased_wm) {
 		watermarkAdjust = DP_CONFIG_INCREASED_WATERMARK_ADJUST;
 		watermarkMinimum = DP_CONFIG_INCREASED_WATERMARK_LIMIT;
 	}
@@ -1822,7 +1822,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	}
 
 	if (head->func->display_id)
-		head->func->display_id(head, BIT(nv_encoder->outp.id));
+		head->func->display_id(head, BIT(nv_encoder->outp.impl->id));
 
 	nv_encoder->update(nv_encoder, nv_crtc->index, asyh, proto, depth);
 }
@@ -1906,7 +1906,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 			nv_encoder->i2c = &nv_connector->aux.ddc;
 		}
 
-		if (nv_connector->type != DCB_CONNECTOR_eDP && nv_encoder->outp.info.dp.mst) {
+		if (nv_connector->type != DCB_CONNECTOR_eDP && nv_encoder->outp.impl->dp.mst) {
 			ret = nv50_mstm_new(nv_encoder, &nv_connector->aux,
 					    16, nv_connector->base.base.id,
 					    &nv_encoder->dp.mstm);
@@ -1914,7 +1914,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 				return ret;
 		}
 	} else
-	if (nv_encoder->outp.info.ddc != NVIF_OUTP_DDC_INVALID) {
+	if (nv_encoder->outp.impl->ddc != NVIF_OUTP_DDC_INVALID) {
 		struct nvkm_i2c_bus *bus =
 			nvkm_i2c_bus_find(i2c, dcbe->i2c_index);
 		if (bus)
@@ -2037,12 +2037,12 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 
 	switch (dcbe->type) {
 	case DCB_OUTPUT_TMDS:
-		bus  = nvkm_i2c_bus_find(i2c, nv_encoder->outp.info.ddc);
+		bus  = nvkm_i2c_bus_find(i2c, nv_encoder->outp.impl->ddc);
 		ddc  = bus ? &bus->i2c : NULL;
 		type = DRM_MODE_ENCODER_TMDS;
 		break;
 	case DCB_OUTPUT_DP:
-		aux  = nvkm_i2c_aux_find(i2c, nv_encoder->outp.info.dp.aux);
+		aux  = nvkm_i2c_aux_find(i2c, nv_encoder->outp.impl->dp.aux);
 		ddc  = aux ? &aux->i2c : NULL;
 		type = DRM_MODE_ENCODER_TMDS;
 		break;
@@ -2897,14 +2897,14 @@ nv50_display_create(struct drm_device *dev)
 			continue;
 		}
 
-		connector = nouveau_connector_create(dev, outp->outp.info.conn);
+		connector = nouveau_connector_create(dev, outp->outp.impl->conn);
 		if (IS_ERR(connector)) {
 			nvif_outp_dtor(&outp->outp);
 			kfree(outp);
 			continue;
 		}
 
-		outp->base.base.possible_crtcs = outp->outp.info.heads;
+		outp->base.base.possible_crtcs = outp->outp.impl->heads;
 		outp->base.base.possible_clones = 0;
 		outp->conn = nouveau_connector(connector);
 
@@ -2912,24 +2912,24 @@ nv50_display_create(struct drm_device *dev)
 		if (!outp->dcb)
 			break;
 
-		switch (outp->outp.info.proto) {
+		switch (outp->outp.impl->proto) {
 		case NVIF_OUTP_RGB_CRT:
 			outp->dcb->type = DCB_OUTPUT_ANALOG;
-			outp->dcb->crtconf.maxfreq = outp->outp.info.rgb_crt.freq_max;
+			outp->dcb->crtconf.maxfreq = outp->outp.impl->rgb_crt.freq_max;
 			break;
 		case NVIF_OUTP_TMDS:
 			outp->dcb->type = DCB_OUTPUT_TMDS;
-			outp->dcb->duallink_possible = outp->outp.info.tmds.dual;
+			outp->dcb->duallink_possible = outp->outp.impl->tmds.dual;
 			break;
 		case NVIF_OUTP_LVDS:
 			outp->dcb->type = DCB_OUTPUT_LVDS;
-			outp->dcb->lvdsconf.use_acpi_for_edid = outp->outp.info.lvds.acpi_edid;
+			outp->dcb->lvdsconf.use_acpi_for_edid = outp->outp.impl->lvds.acpi_edid;
 			break;
 		case NVIF_OUTP_DP:
 			outp->dcb->type = DCB_OUTPUT_DP;
-			outp->dcb->dpconf.link_nr = outp->outp.info.dp.link_nr;
-			outp->dcb->dpconf.link_bw = outp->outp.info.dp.link_bw;
-			if (outp->outp.info.dp.mst)
+			outp->dcb->dpconf.link_nr = outp->outp.impl->dp.link_nr;
+			outp->dcb->dpconf.link_bw = outp->outp.impl->dp.link_bw;
+			if (outp->outp.impl->dp.mst)
 				has_mst = true;
 			break;
 		default:
@@ -2937,11 +2937,11 @@ nv50_display_create(struct drm_device *dev)
 			continue;
 		}
 
-		outp->dcb->heads = outp->outp.info.heads;
-		outp->dcb->connector = outp->outp.info.conn;
-		outp->dcb->i2c_index = outp->outp.info.ddc;
+		outp->dcb->heads = outp->outp.impl->heads;
+		outp->dcb->connector = outp->outp.impl->conn;
+		outp->dcb->i2c_index = outp->outp.impl->ddc;
 
-		switch (outp->outp.info.type) {
+		switch (outp->outp.impl->type) {
 		case NVIF_OUTP_DAC : ret = nv50_dac_create(outp); break;
 		case NVIF_OUTP_SOR : ret = nv50_sor_create(outp); break;
 		case NVIF_OUTP_PIOR: ret = nv50_pior_create(outp); break;
@@ -2952,7 +2952,7 @@ nv50_display_create(struct drm_device *dev)
 
 		if (ret) {
 			NV_WARN(drm, "failed to create encoder %d/%d/%d: %d\n",
-				i, outp->outp.info.type, outp->outp.info.proto, ret);
+				i, outp->outp.impl->type, outp->outp.impl->proto, ret);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e59d2a4ec4d0..8d00ed58323f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -13,6 +13,7 @@ struct nvif_faultbuf_priv;
 struct nvif_disp_priv;
 struct nvif_disp_caps_priv;
 struct nvif_conn_priv;
+struct nvif_outp_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -243,6 +244,50 @@ struct nvif_conn_impl {
 		     const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
+struct nvif_outp_impl {
+	void (*del)(struct nvif_outp_priv *);
+
+	u8 id;
+
+	enum nvif_outp_type {
+		NVIF_OUTP_DAC,
+		NVIF_OUTP_SOR,
+		NVIF_OUTP_PIOR,
+	} type;
+
+	enum nvif_outp_proto {
+		NVIF_OUTP_RGB_CRT,
+		NVIF_OUTP_TMDS,
+		NVIF_OUTP_LVDS,
+		NVIF_OUTP_DP,
+	} proto;
+
+	u8 heads;
+#define NVIF_OUTP_DDC_INVALID 0xff
+	u8 ddc;
+	u8 conn;
+
+	struct {
+		u32 freq_max;
+	} rgb_crt;
+
+	struct {
+		u8 dual;
+	} tmds;
+
+	struct {
+		u8 acpi_edid;
+	} lvds;
+
+	struct {
+		u8 aux;
+		u8 mst;
+		u8 increased_wm;
+		u8 link_nr;
+		u32 link_bw;
+	} dp;
+};
+
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
@@ -260,6 +305,8 @@ struct nvif_disp_impl {
 
 	struct {
 		u32 mask;
+		int (*new)(struct nvif_disp_priv *, u8 id,
+			   const struct nvif_outp_impl **, struct nvif_outp_priv **, u64 handle);
 	} outp;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index bde9bfae8d11..d1e2f0ff8965 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,43 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-union nvif_outp_args {
-	struct nvif_outp_v0 {
-		__u8 version;
-		__u8 id;	/* DCB device index. */
-#define NVIF_OUTP_V0_TYPE_DAC  0x00
-#define NVIF_OUTP_V0_TYPE_SOR  0x01
-#define NVIF_OUTP_V0_TYPE_PIOR 0x02
-		__u8 type;
-#define NVIF_OUTP_V0_PROTO_RGB_CRT 0x00
-#define NVIF_OUTP_V0_PROTO_TMDS    0x01
-#define NVIF_OUTP_V0_PROTO_LVDS    0x02
-#define NVIF_OUTP_V0_PROTO_DP      0x03
-	        __u8 proto;
-	        __u8 heads;
-	        __u8 ddc;
-	        __u8 conn;
-		union {
-			struct {
-				__u32 freq_max;
-			} rgb_crt;
-			struct {
-				__u8  dual;
-			} tmds;
-			struct {
-				__u8  acpi_edid;
-			} lvds;
-			struct {
-				__u8  aux;
-				__u8  mst;
-				__u8  increased_wm;
-				__u8  link_nr;
-				__u32 link_bw;
-			} dp;
-		};
-	} v0;
-};
-
 #define NVIF_OUTP_V0_DETECT        0x00
 #define NVIF_OUTP_V0_EDID_GET      0x01
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index bc122a5ba7df..56bfbc41a576 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -2,52 +2,15 @@
 #ifndef __NVIF_OUTP_H__
 #define __NVIF_OUTP_H__
 #include <nvif/object.h>
+#include <nvif/driverif.h>
 #include <nvif/if0012.h>
 #include <drm/display/drm_dp.h>
 struct nvif_disp;
 
 struct nvif_outp {
+	const struct nvif_outp_impl *impl;
+	struct nvif_outp_priv *priv;
 	struct nvif_object object;
-	u32 id;
-
-	struct {
-		enum {
-			NVIF_OUTP_DAC,
-			NVIF_OUTP_SOR,
-			NVIF_OUTP_PIOR,
-		} type;
-
-		enum {
-			NVIF_OUTP_RGB_CRT,
-			NVIF_OUTP_TMDS,
-			NVIF_OUTP_LVDS,
-			NVIF_OUTP_DP,
-		} proto;
-
-		u8 heads;
-#define NVIF_OUTP_DDC_INVALID 0xff
-		u8 ddc;
-		u8 conn;
-
-		union {
-			struct {
-				u32 freq_max;
-			} rgb_crt;
-			struct {
-				bool dual;
-			} tmds;
-			struct {
-				bool acpi_edid;
-			} lvds;
-			struct {
-				u8   aux;
-				bool mst;
-				bool increased_wm;
-				u8   link_nr;
-				u32  link_bw;
-			} dp;
-		};
-	} info;
 
 	struct {
 		int id;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 6daeb7f0b09b..a8012a71a50c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -492,68 +492,25 @@ nvif_outp_detect(struct nvif_outp *outp)
 void
 nvif_outp_dtor(struct nvif_outp *outp)
 {
-	nvif_object_dtor(&outp->object);
+	if (!outp->impl)
+		return;
+
+	outp->impl->del(outp->priv);
+	outp->impl = NULL;
 }
 
 int
 nvif_outp_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_outp *outp)
 {
-	struct nvif_outp_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.id = id;
-
-	ret = nvif_object_ctor(&disp->object, name ?: "nvifOutp", id, NVIF_CLASS_OUTP,
-			       &args, sizeof(args), &outp->object);
+	ret = disp->impl->outp.new(disp->priv, id, &outp->impl, &outp->priv,
+				   nvif_handle(&outp->object));
 	NVIF_ERRON(ret, &disp->object, "[NEW outp id:%d]", id);
 	if (ret)
 		return ret;
 
-	outp->id = args.id;
-
-	switch (args.type) {
-	case NVIF_OUTP_V0_TYPE_DAC : outp->info.type = NVIF_OUTP_DAC; break;
-	case NVIF_OUTP_V0_TYPE_SOR : outp->info.type = NVIF_OUTP_SOR; break;
-	case NVIF_OUTP_V0_TYPE_PIOR: outp->info.type = NVIF_OUTP_PIOR; break;
-		break;
-	default:
-		WARN_ON(1);
-		nvif_outp_dtor(outp);
-		return -EINVAL;
-	}
-
-	switch (args.proto) {
-	case NVIF_OUTP_V0_PROTO_RGB_CRT:
-		outp->info.proto = NVIF_OUTP_RGB_CRT;
-		outp->info.rgb_crt.freq_max = args.rgb_crt.freq_max;
-		break;
-	case NVIF_OUTP_V0_PROTO_TMDS:
-		outp->info.proto = NVIF_OUTP_TMDS;
-		outp->info.tmds.dual = args.tmds.dual;
-		break;
-	case NVIF_OUTP_V0_PROTO_LVDS:
-		outp->info.proto = NVIF_OUTP_LVDS;
-		outp->info.lvds.acpi_edid = args.lvds.acpi_edid;
-		break;
-	case NVIF_OUTP_V0_PROTO_DP:
-		outp->info.proto = NVIF_OUTP_DP;
-		outp->info.dp.aux = args.dp.aux;
-		outp->info.dp.mst = args.dp.mst;
-		outp->info.dp.increased_wm = args.dp.increased_wm;
-		outp->info.dp.link_nr = args.dp.link_nr;
-		outp->info.dp.link_bw = args.dp.link_bw;
-		break;
-	default:
-		WARN_ON(1);
-		nvif_outp_dtor(outp);
-		return -EINVAL;
-	}
-
-	outp->info.heads = args.heads;
-	outp->info.ddc = args.ddc;
-	outp->info.conn = args.conn;
-
+	nvif_object_ctor(&disp->object, name ?: "nvifOutp", id, 0, &outp->object);
 	outp->or.id = -1;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 890cfb23da77..0163660f215d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -89,6 +89,5 @@ void nv50_disp_chan_uevent_send(struct nvkm_disp *, int);
 extern const struct nvkm_event_func gf119_disp_chan_uevent;
 extern const struct nvkm_event_func gv100_disp_chan_uevent;
 
-int nvkm_uoutp_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uhead_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 65e8b3fec655..678121ab469f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -24,7 +24,7 @@
 #include "chan.h"
 #include "uconn.h"
 #include "head.h"
-#include "outp.h"
+#include "uoutp.h"
 
 #include <nvif/class.h>
 
@@ -33,12 +33,6 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 {
 	struct nvkm_disp *disp = container_of(object, struct nvif_disp_priv, object)->disp;
 
-	if (index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_OUTP };
-		sclass->ctor = nvkm_uoutp_new;
-		return 0;
-	}
-
 	if (index-- == 0) {
 		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_HEAD };
 		sclass->ctor = nvkm_uhead_new;
@@ -90,6 +84,21 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 	return -EINVAL;
 }
 
+static int
+nvkm_udisp_outp_new(struct nvif_disp_priv *udisp, u8 id,
+		    const struct nvif_outp_impl **pimpl, struct nvif_outp_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_uoutp_new(udisp->disp, id, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+}
+
 static int
 nvkm_udisp_conn_new(struct nvif_disp_priv *udisp, u8 id,
 		    const struct nvif_conn_impl **pimpl, struct nvif_conn_priv **ppriv)
@@ -133,6 +142,7 @@ static const struct nvif_disp_impl
 nvkm_udisp_impl = {
 	.del = nvkm_udisp_del,
 	.conn.new = nvkm_udisp_conn_new,
+	.outp.new = nvkm_udisp_outp_new,
 };
 
 static void *
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 8d39dad73a40..b585b781e928 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -31,6 +31,8 @@
 struct nvif_outp_priv {
 	struct nvkm_object object;
 	struct nvkm_outp *outp;
+
+	struct nvif_outp_impl impl;
 };
 
 static int
@@ -568,6 +570,19 @@ nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	return ret;
 }
 
+static void
+nvkm_uoutp_del(struct nvif_outp_priv *uoutp)
+{
+	struct nvkm_object *object = &uoutp->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_outp_impl
+nvkm_uoutp_impl = {
+	.del = nvkm_uoutp_del,
+};
+
 static void *
 nvkm_uoutp_dtor(struct nvkm_object *object)
 {
@@ -586,20 +601,15 @@ nvkm_uoutp = {
 	.mthd = nvkm_uoutp_mthd,
 };
 
-#include "udisp.h"
 int
-nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimpl,
+	       struct nvif_outp_priv **ppriv, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_outp *outt, *outp = NULL;
-	union nvif_outp_args *args = argv;
 	struct nvif_outp_priv *uoutp;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
 	list_for_each_entry(outt, &disp->outps, head) {
-		if (outt->index == args->v0.id) {
+		if (outt->index == id) {
 			outp = outt;
 			break;
 		}
@@ -608,56 +618,62 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	if (!outp)
 		return -EINVAL;
 
+	uoutp = kzalloc(sizeof(*uoutp), GFP_KERNEL);
+	if (!uoutp)
+		return -ENOMEM;
+
+	nvkm_object_ctor(&nvkm_uoutp, &(struct nvkm_oclass) {}, &uoutp->object);
+	uoutp->outp = outp;
+	uoutp->impl = nvkm_uoutp_impl;
+	uoutp->impl.id = id;
+
 	switch (outp->info.type) {
 	case DCB_OUTPUT_ANALOG:
-		args->v0.type = NVIF_OUTP_V0_TYPE_DAC;
-		args->v0.proto = NVIF_OUTP_V0_PROTO_RGB_CRT;
-		args->v0.rgb_crt.freq_max = outp->info.crtconf.maxfreq;
+		uoutp->impl.type = NVIF_OUTP_DAC;
+		uoutp->impl.proto = NVIF_OUTP_RGB_CRT;
+		uoutp->impl.rgb_crt.freq_max = outp->info.crtconf.maxfreq;
 		break;
 	case DCB_OUTPUT_TMDS:
 		if (!outp->info.location) {
-			args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-			args->v0.tmds.dual = (outp->info.tmdsconf.sor.link == 3);
+			uoutp->impl.type = NVIF_OUTP_SOR;
+			uoutp->impl.tmds.dual = (outp->info.tmdsconf.sor.link == 3);
 		} else {
-			args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
-			args->v0.tmds.dual = 0;
+			uoutp->impl.type = NVIF_OUTP_PIOR;
+			uoutp->impl.tmds.dual = 0;
 		}
-		args->v0.proto = NVIF_OUTP_V0_PROTO_TMDS;
+		uoutp->impl.proto = NVIF_OUTP_TMDS;
 		break;
 	case DCB_OUTPUT_LVDS:
-		args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-		args->v0.proto = NVIF_OUTP_V0_PROTO_LVDS;
-		args->v0.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
+		uoutp->impl.type = NVIF_OUTP_SOR;
+		uoutp->impl.proto = NVIF_OUTP_LVDS;
+		uoutp->impl.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
 		break;
 	case DCB_OUTPUT_DP:
 		if (!outp->info.location) {
-			args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-			args->v0.dp.aux = outp->info.i2c_index;
+			uoutp->impl.type = NVIF_OUTP_SOR;
+			uoutp->impl.dp.aux = outp->info.i2c_index;
 		} else {
-			args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
-			args->v0.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
+			uoutp->impl.type = NVIF_OUTP_PIOR;
+			uoutp->impl.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
 		}
-		args->v0.proto = NVIF_OUTP_V0_PROTO_DP;
-		args->v0.dp.mst = outp->dp.mst;
-		args->v0.dp.increased_wm = outp->dp.increased_wm;
-		args->v0.dp.link_nr = outp->info.dpconf.link_nr;
-		args->v0.dp.link_bw = outp->info.dpconf.link_bw * 27000;
+		uoutp->impl.proto = NVIF_OUTP_DP;
+		uoutp->impl.dp.mst = outp->dp.mst;
+		uoutp->impl.dp.increased_wm = outp->dp.increased_wm;
+		uoutp->impl.dp.link_nr = outp->info.dpconf.link_nr;
+		uoutp->impl.dp.link_bw = outp->info.dpconf.link_bw * 27000;
 		break;
 	default:
 		WARN_ON(1);
+		kfree(uoutp);
 		return -EINVAL;
 	}
 
 	if (outp->info.location)
-		args->v0.ddc = NVKM_I2C_BUS_EXT(outp->info.extdev);
+		uoutp->impl.ddc = NVKM_I2C_BUS_EXT(outp->info.extdev);
 	else
-		args->v0.ddc = outp->info.i2c_index;
-	args->v0.heads = outp->info.heads;
-	args->v0.conn = outp->info.connector;
-
-	uoutp = kzalloc(sizeof(*uoutp), GFP_KERNEL);
-	if (!uoutp)
-		return -ENOMEM;
+		uoutp->impl.ddc = outp->info.i2c_index;
+	uoutp->impl.heads = outp->info.heads;
+	uoutp->impl.conn = outp->info.connector;
 
 	spin_lock(&disp->user.lock);
 	if (outp->user) {
@@ -668,8 +684,8 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	outp->user = true;
 	spin_unlock(&disp->user.lock);
 
-	nvkm_object_ctor(&nvkm_uoutp, oclass, &uoutp->object);
-	uoutp->outp = outp;
+	*pimpl = &uoutp->impl;
+	*ppriv = uoutp;
 	*pobject = &uoutp->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
index 37ecd2891a1a..3455aedd7bbe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
@@ -2,5 +2,8 @@
 #ifndef __NVKM_UOUTP_H__
 #define __NVKM_UOUTP_H__
 #include "outp.h"
+#include <nvif/driverif.h>
 
+int nvkm_uoutp_new(struct nvkm_disp *, u8 id, const struct nvif_outp_impl **,
+		   struct nvif_outp_priv **, struct nvkm_object **);
 #endif
-- 
2.41.0

