Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51348A7928
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9603D112FC0;
	Tue, 16 Apr 2024 23:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bU1FUa8B";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53824112FB2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByXPcHJnB+orPjn8XD4TWLiZ95AxzXMA4g7e1cCn9ARWUN5oYaPuXs+GvfS2ylAMXrDjYYdCGbYNEWRiWtFnhPTStdALeiQvwAiwpPY2t+uVT9n6AHZu8/mtgi0dPmuCXoRJSGtaLimUXrfEJLVGmyl66BkveSey3SkcwylaUbJKtCkt3iVWacn+QOMOwbq8SgA+BByZKz3lifNfWZkJ0htAtl9wsIvrQngPpICcS1oCA4wdUxCdVBT/31w71BCFlyuqMcgk6MiCeqc49SviQEcpSt9z8sWVuccCMm6BRmXO6dcgEvxYo6TkyZI7aVPTCePp99BXM6JOhspPDRdbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWC9RJls7PBvGwzaxmdfLPlTywl2itcRxZ7opXdb1+s=;
 b=RozOLjRwFvgNMXslWpNp1jV57dUirvbjqO4tOrlf4ROCsw6ioLSw41qFL2IbGf03VGi/YsRs5apLktgb1DbLRsiyYsPZoh6KU3YVTaTXISoGKo+t3pjAv2OPFFXo+t4ls1teCEusKcwjnJuHTiEKFNTv5ZOJdN892ApPXOSUbpbf8v9+KQaykNiTmSn3tU+axhtIAV6AKK57aAIZB+JK+Xy14eK7LdLHLzxh0dzGbE4TDyBfdkl+AvsYhY2joRXBdB7tvCCsDp6e07YTtZIDiDowSLX1b/QlyIPZOrKjIFOzSwgNWdEOxI/pC8Dr08vlf28+A46C3bf7PaEvila/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWC9RJls7PBvGwzaxmdfLPlTywl2itcRxZ7opXdb1+s=;
 b=bU1FUa8BovetJ4q7jQS2cc7ecpWaB1wuiaCwx4ltZG27DNw25hyk0Uz0WU62gn6UqqEtGMvRsI1CxF+QF9F8eLI1DNLgy9gWL8lKrXDUGh0Xaetujs5lVmJiTgaDSvuxSxH4O5NVbVizXm4lJ0l8+exy4wOOzAH9d2IHAVmEBKXN3oxdIxWqZwYGi1nOeJ/tnVywBx6HI0wQEYojW4uk6BgLmT1re7mGHKYIXSdQD1IBeR7fiSFf2UL6qnyopCRecPMwYkRMFVPwhs58aFxS2DKg4dNY83yeJw14FLE4y0TcuhtRlnBPpnKHdSz5nk6Vj9e54gkz8MZTn2rOttLzRg==
Received: from CH0PR03CA0314.namprd03.prod.outlook.com (2603:10b6:610:118::29)
 by LV3PR12MB9141.namprd12.prod.outlook.com (2603:10b6:408:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:05 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::5d) by CH0PR03CA0314.outlook.office365.com
 (2603:10b6:610:118::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:43 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:42 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 116/156] drm/nouveau/nvif: rework outp "hda eld" api
Date: Wed, 17 Apr 2024 09:39:22 +1000
Message-ID: <20240416234002.19509-117-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|LV3PR12MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 77db1d77-e3db-4934-f080-08dc5e6ef676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9V7dGnlJsRXv8k/uK53Y8C7koT1c/wN3NcpPBEk7mxoeeOiUwt8C228Ti6ZcuPPg04dxU9eTDefSpElfcFh2FXF8daqjW3fNyqNy/h3duRZp/Q02y0Q0G1KHlCsYHZ7cDxUPZNSXyxg8ovZg0+ZbNoEiKlomN1DlcbvJ/RdgkuqrB3gbSO7owkG6mOYJOKkGL1gWYxZkCNIm6aMAx40Ri58Q+EYD3i8+WV3ttmDY5wnWZz6+ewJW3mM1e8Ckh1MzVYjF0Dn4SnB9H7Jd8kPYoTIu7afaBxMG3m94GRTV959hMytvDQ+YxXai4iQnSseiO6pNN9HMAKw4OH2wGkoE5qGe+ORn0ic/QOrMvOPfvsgItEDb36jOiUENcT0VVLiB7WyOK+4wq90x1cJdqMpcgjJ8YpyFOD8iAb6g8sZ6zK9pDRoPHJSPb6POtqHmBOeCjsb5zz/t2C4VRPyIM3MN3w2DDeuSDBy8IMQ+ouG5W+3zxR4B5A0VPogTu5xmV8NS5hQBmAOCAQi0SP/V+fkWsC1gQxFT/C7zwdk5jk4hByKYiALWcfL2KjgafNB92om/sg/d9f+ikQkxGyDOFObt+1S0AOEfDvsE1XcjR/VYeTZ+YTS3a+9tF8lKGAMe78Jkj2/TJ/SdZojggkbXgeAS/oq+UHkF7TjtautpSfSBY2rF4nP+T5Jud2T4yjMiqpu/fA/TOMgZRYeWJHhbDlt3rF9lsS8fCta0nJy7fVQLqKgqm0eo7xqTPq/2pn6toxIh
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:05.2608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77db1d77-e3db-4934-f080-08dc5e6ef676
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9141
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  4 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 -----
 drivers/gpu/drm/nouveau/nvif/outp.c           | 13 +-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 45 +++++++++++--------
 4 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index cef19e04f208..742cf0e1678b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -304,6 +304,10 @@ struct nvif_outp_impl {
 				 u8 *data, u8 size);
 	} hdmi;
 
+	struct {
+		int (*eld)(struct nvif_outp_priv *, u8 head, u8 *data, u8 size);
+	} hda;
+
 	struct {
 		u8 acpi_edid;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index a045c66fc1ca..160387dfc2a0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,8 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_HDA_ELD       0x61
-
 #define NVIF_OUTP_V0_DP_AUX_PWR    0x70
 #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RATES      0x72
@@ -16,15 +14,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_hda_eld_args {
-	struct nvif_outp_hda_eld_v0 {
-		__u8  version;
-		__u8  head;
-		__u8  pad02[6];
-		__u8  data[];
-	} v0;
-};
-
 union nvif_outp_dp_aux_pwr_args {
 	struct nvif_outp_dp_aux_pwr_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 4ecdc44eb84a..cf79c56aae0c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -195,20 +195,9 @@ nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 int
 nvif_outp_hda_eld(struct nvif_outp *outp, int head, void *data, u32 size)
 {
-	struct {
-		struct nvif_outp_hda_eld_v0 mthd;
-		u8 data[128];
-	} args;
 	int ret;
 
-	if (WARN_ON(size > ARRAY_SIZE(args.data)))
-		return -EINVAL;
-
-	args.mthd.version = 0;
-	args.mthd.head = head;
-
-	memcpy(args.data, data, size);
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, &args, sizeof(args.mthd) + size);
+	ret = outp->impl->hda.eld(outp->priv, head, data, size);
 	NVIF_ERRON(ret, &outp->object, "[HDA_ELD head:%d size:%d]", head, size);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index a694a43fd495..7184f13f39f5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -208,39 +208,47 @@ nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_hda_eld(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_hda_eld(struct nvif_outp_priv *uoutp, u8 head, u8 *data, u8 size)
 {
-	struct nvkm_ior *ior = outp->ior;
-	union nvif_outp_hda_eld_args *args = argv;
-
-	if (argc < sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	argc -= sizeof(args->v0);
+	struct nvkm_outp *outp = uoutp->outp;
+	struct nvkm_ior *ior;
+	int ret;
 
-	if (!ior->hda || !nvkm_head_find(outp->disp, args->v0.head))
+	if (!nvkm_head_find(outp->disp, head))
 		return -EINVAL;
-	if (argc > 0x60)
+	if (size > 0x60)
 		return -E2BIG;
 
-	if (argc && args->v0.data[0]) {
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
+
+	ior = outp->ior;
+	if (!ior->hda) {
+		nvkm_uoutp_unlock(uoutp);
+		return -EINVAL;
+	}
+
+	if (size && data[0]) {
 		if (outp->info.type == DCB_OUTPUT_DP)
-			ior->func->dp->audio(ior, args->v0.head, true);
+			ior->func->dp->audio(ior, head, true);
 		else
 		if (ior->func->hdmi->audio)
-			ior->func->hdmi->audio(ior, args->v0.head, true);
+			ior->func->hdmi->audio(ior, head, true);
 
-		ior->func->hda->hpd(ior, args->v0.head, true);
-		ior->func->hda->eld(ior, args->v0.head, args->v0.data, argc);
+		ior->func->hda->hpd(ior, head, true);
+		ior->func->hda->eld(ior, head, data, size);
 	} else {
-		ior->func->hda->hpd(ior, args->v0.head, false);
+		ior->func->hda->hpd(ior, head, false);
 
 		if (outp->info.type == DCB_OUTPUT_DP)
-			ior->func->dp->audio(ior, args->v0.head, false);
+			ior->func->dp->audio(ior, head, false);
 		else
 		if (ior->func->hdmi->audio)
-			ior->func->hdmi->audio(ior, args->v0.head, false);
+			ior->func->hdmi->audio(ior, head, false);
 	}
 
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -539,7 +547,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
@@ -676,6 +683,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.proto = NVIF_OUTP_TMDS;
 		uoutp->impl.hdmi.config = nvkm_uoutp_hdmi;
 		uoutp->impl.hdmi.infoframe = nvkm_uoutp_infoframe;
+		uoutp->impl.hda.eld = nvkm_uoutp_hda_eld;
 		break;
 	case DCB_OUTPUT_LVDS:
 		uoutp->impl.type = NVIF_OUTP_SOR;
@@ -692,6 +700,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 			uoutp->impl.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
 		}
 		uoutp->impl.proto = NVIF_OUTP_DP;
+		uoutp->impl.hda.eld = nvkm_uoutp_hda_eld;
 		uoutp->impl.dp.mst = outp->dp.mst;
 		uoutp->impl.dp.increased_wm = outp->dp.increased_wm;
 		uoutp->impl.dp.link_nr = outp->info.dpconf.link_nr;
-- 
2.41.0

