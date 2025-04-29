Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27968AA3C8B
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94F10E581;
	Tue, 29 Apr 2025 23:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kkkV1R3i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEFB10E581
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkYjOlnNeZ//j8zrqQmR6E8Yv7Q0CEQ1EaWvyFlCplYxQ4Geq8xT1+DM8aWxsyUlff2rBaHMMbP3ybCCLZ/noYIHlrLVxX7yX1+RSFroi9LXRHLeiE38IoYUhyNeZUKatQO36KEiaLwb32x6eIddOuAY75JMn/jLCe/+uz2dks+YX1lNHa2nbt/i7I/WKUeMiY/PrsG51VXT5YchbKH4PgJUgthSv3s5ugOel+1TV6zehY+TN4N+7VZovZw9vBeT8GRz983Bufg5Fykog16RbfT1TxDFQFHYJ/Gkj7ggZ5UWZ+e9X20dyUbJZN23c2gtzd222hU6W855GpDAE1FfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHbuFEKO19P6sUjLLnVL2k0szYiWBvu1Drim7qI7IAg=;
 b=v6AQQQ7QAyGRhRSnXved/BgFi8wAs2sB9NobZMPeQYBkcpyviDzEUgC6yNjp1GHT0Ho0f8CuowyEVmbY26+bg+wKIFC3DaJj3TZk06tphh5NjEarp00lYHJgZW25sJDN91rGMXlVUevpXG3XjdFmfpnNRLuubJ7231/nW/ZIEQ+e0jI2bwx4gZH4NI3ksvbliea62bexmOKOr9Mz5BHkhLVGR5GTGrZASTxfcaUFSNwoUOxavBsLOzMDixznq+7nGlkHkJt9lXKMajocv8TeJNNByiprenE2R8r8/MBLq74iMiLtKojwFt9aDh7wDlD8EPBjz4Tepho1+N7r5Zv5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHbuFEKO19P6sUjLLnVL2k0szYiWBvu1Drim7qI7IAg=;
 b=kkkV1R3iWx/6Ykcb66b5EN01kPOH2Hio03tAKyJX6g2JiendHHbxhO4oVyB8gigbEW86Ppj28ti8aCM+A0sm2WaaVa66g1EwuHp1Z6MvqaylrM67A3CBCKAbJVmKupvZUD+69zvdV6hqUShP0LVKGIxq/TUfo89IrirDIUJ77vWE0G336Cydo4Icbrl0WT/eho9tkwFBRp9TcBc+8aqhnINOrKQBkPD7iRYRPAq2fHZX8pgNNx1HcSXujVND1njgXjiyoFybUYvaGUXZ+7EI0BGCgIWTV/SM84u1pSaGp1/4ShMMgstnp2G4G216FqiMr5ohNCZZc27Zvs3PzlWWYA==
Received: from BY5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:1e0::15)
 by SN7PR12MB7452.namprd12.prod.outlook.com (2603:10b6:806:299::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:29 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::ac) by BY5PR03CA0005.outlook.office365.com
 (2603:10b6:a03:1e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 23:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:11 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 26/60] drm/nouveau/gsp: add hal for disp.bl_ctrl()
Date: Wed, 30 Apr 2025 09:38:54 +1000
Message-ID: <20250429233929.24363-27-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SN7PR12MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 99179ca1-eb02-4568-9079-08dd87773974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uYmmdA8nysE0Vxrom1URvI30zIeV0kjyZBddryz6gLgOwF9CECHZkc+sPSBL?=
 =?us-ascii?Q?5UfykI+jguAE5sbRHRHh5+LvLK1diaDwEBN7/KM18rk/TL3jG+3nZdXRP5NV?=
 =?us-ascii?Q?z4DHwPGnNCxk2Bx2+ik4yw6wi4xaSvCQ/UF7KtpLrzQtMeZk6xPHrRbFjInf?=
 =?us-ascii?Q?NjM+AMngdQ+S+CmIx0Q+sxQYh90aAzP5cu8F2TiU5kE1pMm3bn7pL0Py+C3/?=
 =?us-ascii?Q?ebsGT2LDZ4lX6s+9uWVuie2QcipqLNjjiTqjsGM1c0r7tAV6EYoF9jPctZLT?=
 =?us-ascii?Q?q+S3mYW6Iuqb4t7miLJAamJPNezBIYe44qBokE0DnIeO+KYAX5xmqWzuGUbL?=
 =?us-ascii?Q?6MZjWKaPYc1Q7bTWSDGhRTcRTvgnC21GLkdkpzFFwXmNUbcCTXDpAmH+m4iC?=
 =?us-ascii?Q?P+bcZDv80yVqJDO3BqW9+S0uJCopl9u3ug3uGSgYKadj8C/r/XGIfMLOvcA8?=
 =?us-ascii?Q?Kr4+wkj8cq3HUaQJrckwQuFXoBL495h/HWeBOz5x7Y8vNBBoov4kDrTROC3l?=
 =?us-ascii?Q?tSkPh0mmiHGob6KethacY7zxljq2rlLRlfKloAjBakDRZbrdtjyhmRaaeaHi?=
 =?us-ascii?Q?FSq0B4ePhL7C/XLwUARuOAKBYnLeNHxqqHaCAl5JlXohKdvRV4aJR2pzvrbf?=
 =?us-ascii?Q?o2KYS3bgLfiIb5bTjCQt/KLVkVWR48O9LG/Hz+L61MVSq5Tk/uFpuS78PHYm?=
 =?us-ascii?Q?q+pjJ3d08r04gR1WmfrwZrnMG6aXAZXTvE270NvHwCfaK+O39mfDNiluUSXh?=
 =?us-ascii?Q?Ga4EJFq0yk3tUbEVKc7Dkt6tnY2guH+97SqGHQSoWHS31yWJNo5cHnVfRW1B?=
 =?us-ascii?Q?QXZYWAnqiXq+1agLQtuTu11UYD1Oy+aZyz6KxTdAgQRcCwJ/GRDnfYYk5h98?=
 =?us-ascii?Q?0qegW88z/GngvRBXG+iPae66NbeChqltS+wgNmxNrf5Q+Z6qrIrzm9wXBmF9?=
 =?us-ascii?Q?TLdpf9fPmEAhqiYMY3BUuyCK9Z2yVz4mflfauVNyZfM0x/CCYHNicnECGbtn?=
 =?us-ascii?Q?WaBAGSjp1e2As2vEYryW3LU4z54MckNh7DSRLRJT2Uw0THLTChINk9CbfLIT?=
 =?us-ascii?Q?FQV82lLGmegSvPBJkv6KAGuI7gJlcPeOeQ4IhHK4DY/l2vN+rvJEOj/dNa36?=
 =?us-ascii?Q?Qx/L7Up2P3mlgYK5Nuvj/z53rU3KRHXIEN5Vv5qVZ8RzEdnLhww8LDOy/1op?=
 =?us-ascii?Q?YISNigV9xDk7LZZrdCMnkul2oCukmLkhpmPQYQtNVVvWXD1h+tVCADgysYtM?=
 =?us-ascii?Q?H9DK8O8YmxVg6Y5J4B+bUaVxks9QBd0sHUZtpu55FaS7Bnx0j4EFQx2h17Aq?=
 =?us-ascii?Q?w+Cv3OvWIxIeYLOaS5ksCBdWzg52f9X5NfGFPx9WjB2jgH7sspedDsdU6qFm?=
 =?us-ascii?Q?IuEpvX+5eG8zQkrcakFsd5QPJvuNYAHLKi2/sbHLiGgr7UloGJMyLbJr6UYV?=
 =?us-ascii?Q?sqtlnUisqWF/kWg/bCdoZfG5RoBkjtmP1MsOXY6kIMOj0Yl0zCLkOoUpmgYl?=
 =?us-ascii?Q?5+orSMk6KQdudjF71++yB51UAx/cz2t6n+ft?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:28.9936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99179ca1-eb02-4568-9079-08dd87773974
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7452
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

545.23.06 has incompatible changes to
NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 57 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++
 3 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 03222631d847..ad79e31e6aac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -252,47 +252,47 @@ r535_core = {
 };
 
 static int
-r535_sor_bl_set(struct nvkm_ior *sor, int lvl)
+r535_bl_ctrl(struct nvkm_disp *disp, unsigned display_id, bool set, int *pval)
 {
-	struct nvkm_disp *disp = sor->disp;
+	u32 cmd = set ? NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS :
+			NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS;
 	NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
+	int ret;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
-				    NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS,
-				    sizeof(*ctrl));
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, cmd, sizeof(*ctrl));
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
-	ctrl->displayId = BIT(sor->asy.outp->index);
-	ctrl->brightness = lvl;
+	ctrl->displayId = BIT(display_id);
+	ctrl->brightness = *pval;
 
-	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret)
+		return ret;
+
+	*pval = ctrl->brightness;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
 }
 
 static int
-r535_sor_bl_get(struct nvkm_ior *sor)
+r535_sor_bl_set(struct nvkm_ior *sor, int lvl)
 {
 	struct nvkm_disp *disp = sor->disp;
-	NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
-	int ret, lvl;
-
-	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
-				    NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS,
-				    sizeof(*ctrl));
-	if (IS_ERR(ctrl))
-		return PTR_ERR(ctrl);
+	const struct nvkm_rm_api *rmapi = disp->engine.subdev.device->gsp->rm->api;
 
-	ctrl->displayId = BIT(sor->asy.outp->index);
+	return rmapi->disp->bl_ctrl(disp, sor->asy.outp->index, true, &lvl);
+}
 
-	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-	if (ret) {
-		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-		return ret;
-	}
+static int
+r535_sor_bl_get(struct nvkm_ior *sor)
+{
+	struct nvkm_disp *disp = sor->disp;
+	const struct nvkm_rm_api *rmapi = disp->engine.subdev.device->gsp->rm->api;
+	int lvl, ret = rmapi->disp->bl_ctrl(disp, sor->asy.outp->index, false, &lvl);
 
-	lvl = ctrl->brightness;
-	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-	return lvl;
+	return (ret == 0) ? lvl : ret;
 }
 
 static const struct nvkm_ior_func_bl
@@ -1717,3 +1717,8 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	mutex_init(&(*pdisp)->super.mutex); //XXX
 	return ret;
 }
+
+const struct nvkm_rm_api_disp
+r535_disp = {
+	.bl_ctrl = r535_bl_ctrl,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 860201d47810..abd3179ccc44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -45,6 +45,7 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.disp = &r535_disp,
 	.ce = &r535_ce,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7a0af26cd7b0..d7233cd34114 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -69,6 +69,10 @@ struct nvkm_rm_api {
 		} event;
 	} *device;
 
+	const struct nvkm_rm_api_disp {
+		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
+	} *disp;
+
 	const struct nvkm_rm_api_engine {
 		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 			     struct nvkm_gsp_object *);
@@ -83,6 +87,7 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
+extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_engine r535_ce;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
-- 
2.49.0

