Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5261ABA711
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEE410EBBB;
	Sat, 17 May 2025 00:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G5YtI/xc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A0B10EBBB
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXWQjVqWNUyp9sRMwbM7/sIJrsbjbhIcUQiakJJnDinUO87w733+nRz+KceMWxyR8BSqByJa87e54tdoNoVcCLLF76tKW7TR63bsyXWy+p/0lrlz9IRIyHn494bNRa4haYuhMWEuiF1oqrWic5VhvUASPfxBLSFsjb2ply/ZMnWYevGIcI9wPnvdZgSce25NM+gWm3BjdGLkNlZsQhlg82CEP5I5nPXOImr6BsfBNJGan0FoZP0wTt5HZAZfaWwqvAepeVLxWgGvshYBb3mI0ijNImn3YhjLqfsjwQJ6itdRya1wgXqmVJfHtoJi5AhvIvh3pgNFAj/TPcw1qwZa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVJoxEgl7rge/OUyNkT+7EwqP3vMVP6vstIlkK5Hfgc=;
 b=ApU/40hIDfVNd3wIAGzCQF6RZNJqSL9IgNnR+QyzOcs+Il4D5pFaKzI5F1wlV7pvyBrT1l8HJHeL3P8gP8MlKdH8rbNuGW2gVXn+EWdsz3VIPqbsGln1TM/XE8lmrOeWynEtI6hx5libo7OM7JeAcV4Rh1L8e+p98vdDPK14dCQtPcfaYrNKDm+C7kNRjaxPPISjeL22K0BT78UgmEvt9zdNeTtpxt28h3etFsq7Ce3p71EPMcOYQdTh+7Hzcvuaj6N0nbYYLhG1gMu9pYe0ekk50P9E/EM8bL0E5YCPQleS7OgXPSJUNmHHqYDgrys3I2b8eVmIhyrFnGoVIdE81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVJoxEgl7rge/OUyNkT+7EwqP3vMVP6vstIlkK5Hfgc=;
 b=G5YtI/xcKPgbOzLSQjvmKsptkyrAHY59E1jEFbpCNu+83igpEHL1VRTAV+9NNNqulEJueCxxnS2XqkRPBKN8L3+idBOA0qkvrh2IQg21M728xS0vTvcYvJrWVAPa9ySB3XXF+8BkMacPMUuGejtnS9lrw2hk1bYqn2ThZXr0YIYBmOggkAITqsD98tn2A57lOQrGA+UihjvTDPVeNOQ+XN43A5TTFvT4p21dZFjGUZ9/AQC1VB7aM083ShxqsKFIOJL2U9LOzcJD3QkkrvyGjPWiUAjvZAcD0udIIOLBCDPCStCBTHtCZJtFbxde+QbOpwwjJbCS7UBSM9hniSA0PQ==
Received: from BYAPR06CA0049.namprd06.prod.outlook.com (2603:10b6:a03:14b::26)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:00 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::83) by BYAPR06CA0049.outlook.office365.com
 (2603:10b6:a03:14b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:10:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:47 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 26/62] drm/nouveau/gsp: add hal for disp.bl_ctrl()
Date: Sat, 17 May 2025 10:09:18 +1000
Message-ID: <20250517000954.35691-27-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cecbd74-a9b6-45a2-50ac-08dd94d74d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GsjJszWa2Xky4JXa/OTDKeaoYr3vGyVcxO+LgnYFczVhkpk88HXWcfVSpx8f?=
 =?us-ascii?Q?b/Fk59J7mDMoHCpTe3QYVXfX7s/qGfj4y0Kgip1r845i5cb+m/r5FAjDlLDB?=
 =?us-ascii?Q?AVY+gASOu3AHdUD5FkWnfR0UUnCSx8O5Ac0vo4ds/24LoZoc4POFHCIC8ZA3?=
 =?us-ascii?Q?8PILzX4tddfhd7x2Dr8UQuiF/xbBcOpj+ETRG1AQMqQMp8UdV7M0z2BEI/MP?=
 =?us-ascii?Q?FIHxjcU1nAxDKaAyqX1/OzVoJGZuZmM2kvH4gdZfzv3ZGWSMOO1rMQEYnypg?=
 =?us-ascii?Q?5GkqYFwS5Q2A4XU1zMTiB2lIyzFuemaAoimUJB6OyFX7/12gk6x3t2HJpuPx?=
 =?us-ascii?Q?ZAkYfaytVdsaW2rKfmLhKBB8vKRoSSjvLKBpXFy6816hf29Q3HE+gQk73jXm?=
 =?us-ascii?Q?BNgo65noGuMVbIEN39jPKfiDbINkNbPccWOtrgI69K1Pkkz+idSZgd+dkIjs?=
 =?us-ascii?Q?0JOYJriPu6FlA3GelJ0YtUlDZV3vTBgqFgCbQmvXckqkDdNmE6ElQk9FB7pY?=
 =?us-ascii?Q?jb9kyCwUlyy/uI+ovX2Q2iCmaJ+uuobDQklV6ZnazveoVIE9UoxaKxSOnTXB?=
 =?us-ascii?Q?Aq1RajpjfHX3o/2BSSI/ntuNnUEmWxsuRsjtQ1dBB/hHTYoj8k6sp7DiL8Hn?=
 =?us-ascii?Q?Z1IH7sFV3/TtwgIVzR4kSvz58sKukdiBYJEQWfD4v1hBm2TVOLzIVhFjiuVG?=
 =?us-ascii?Q?GsGG4cEA9YqHDBCT790j3gN+5DYJpldmnWDNwmifl4O+zO8Ut1QnziuiCG3J?=
 =?us-ascii?Q?puh3+UwBXXhF0t/pvsx0MLXP9ad2cxkrdSfK1X8ZfcUflAP3o5Layy245UN1?=
 =?us-ascii?Q?0yfVwFNf1JOsSSb+Lve/4MUyCX3kZrhhHzYzU17tv6qwMBDSVojq8os3VZUZ?=
 =?us-ascii?Q?+bWJhvVTPec3J1tVkGFCZAQWSi7BVeOzOUBZItEa4TXJUus1czdzuwVeuEFW?=
 =?us-ascii?Q?XUm0Kma6MkOdWeI7gSDmiRCQZFLzg2Ux9zfwYYfJ8dDH5Uf/WufEqAkTxnyU?=
 =?us-ascii?Q?b55XHni1PO6ATJysq9tMcExismNI5pk2j/Ot4q4hxChdnppOYaEVZW/sdG19?=
 =?us-ascii?Q?8mFV1y7GX81dKb+iao+xfCJ5xwIq1V0URubALPlvxsL1TXPkpQtSwdh1ZZ5L?=
 =?us-ascii?Q?nFgs8Gk2q6SnIMP+VqIUVH+dC9jsZWLL2i1swNUKRl0XeWKjDwAsP4u0w19Y?=
 =?us-ascii?Q?y6BHeevJSyhZTtFgvrBv03s5MSSAHgB0DjUjUBYZeDVJjQkEKhY4A/fHd0A/?=
 =?us-ascii?Q?yY68IT2zN88xoYXa6S7hEEYQVcpk2GR6e3UMrAr1tvmhaoz0hWcsYMMsMloo?=
 =?us-ascii?Q?6euHdS6VTNT0cEH4O9KWaiyknl49YDOT2EXDplAMQZK+PUFsRCp2wM2SUlW1?=
 =?us-ascii?Q?DyXOqmb9ClBhGwbB5AkUzbAjRyaMOJBxX7QNpRsy24O4h58NyV3yY+EXVWk2?=
 =?us-ascii?Q?B0cFOlIJ+H/qEQwRQSFbcVHiPlzrZuVU2gdprBDXysvEGLK41+UBpjg2W4uM?=
 =?us-ascii?Q?yLUVQ0bNU6k0l9QSLtNyAIhn3WUDtYDEi3WL?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:59.4027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cecbd74-a9b6-45a2-50ac-08dd94d74d78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 57 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++
 3 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 1ba86e223978..1e9bbfd402d3 100644
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
@@ -1722,3 +1722,8 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	mutex_init(&(*pdisp)->super.mutex); //XXX
 	return ret;
 }
+
+const struct nvkm_rm_api_disp
+r535_disp = {
+	.bl_ctrl = r535_bl_ctrl,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index efedd387fcc5..9eff944f6c39 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -28,6 +28,7 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.disp = &r535_disp,
 	.ce = &r535_ce,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 4a27e8bfafcc..2386e419be62 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -70,6 +70,10 @@ struct nvkm_rm_api {
 		} event;
 	} *device;
 
+	const struct nvkm_rm_api_disp {
+		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
+	} *disp;
+
 	const struct nvkm_rm_api_engine {
 		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 			     struct nvkm_gsp_object *);
@@ -84,6 +88,7 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
+extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_engine r535_ce;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
-- 
2.49.0

