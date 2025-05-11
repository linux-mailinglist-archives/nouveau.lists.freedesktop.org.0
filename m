Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C517AB2B60
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB1410E1AA;
	Sun, 11 May 2025 21:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pEjtK56q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89EE10E1AA
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8fuM2HndjHLyLkarfrDk5x/Ng72LHF05rcF+RjTPuyRAl/LR+u0E4SRaWRxLR3Si5wslqeUY3Q6RUAdopZGMjx1g1LbtPXgzpMKVm++kC8yaiwmQLGMI9uQD2mD3tcL/iw+JrcN8x/UhB4Ff8a2EhbjDbNdvqEtXUZ3dlhuss9KD+WPxMP3RC+PfIa2qsQltpGunlfe1sEnipd7s3e+V94QIJ33RvggZaUycBPk5NrVLIiMFq0egRxKUSDp6g/l5lQcwxaBocxPaHiB9ARU4JMmHcQWWj2L4++Uot1KhvNd33W6LdEsuV/hB70WYg26qn7Ve4l/lkbBg6To1Ax9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xzb0jAE4ya7s+26RIEGONuZ2w6jM8K4STecjOE2YGs=;
 b=SnBS33jvctaYeAE7nnYUC07YF0OwlIMMzjZiXeVY9NHOcusAUf0Cj6YXVRwGcX37Yx1eqGhY8gQUYoRat/QqG9XLmVaRK3OzzDzm9JSXPVYQ+A+dEvm6CUu+KuSW/6kWM83Qc0Y5soOhekEBzLLj+f7Gh0BIjmVsOZ6k1p8T2nqtHUk/15oosF7M33wqPOaMeCnsHIpPRLwR1rCjKvtDpqJqpcRuQnOXBBBjLs+S3c0ZykbuT5TsLnP4nvxqyC2qDJ/UbdOYD5lKhmY6FOf1rgoq5bpTGAR251eZy3TpX5f/teE9fdahMAm7yPvdiJmAiBDEd5/EeTNLqUe6aX3jXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xzb0jAE4ya7s+26RIEGONuZ2w6jM8K4STecjOE2YGs=;
 b=pEjtK56qG8IvLItYFOq6CXDzZ+iKlanylQ2jMe4Wt1EJcw5NtkyO1nE79ObcRE5Gf1LPKeB4XidVP5OOBXBpqo5UGz8INaTK5VP3WpXVuw+gxdotu+3j9GxH/oQU4Shq5SbYkPs9nBAlaTJXLLEt1lI4g6hvt4vRHhCjHo0//PG8g1q9A8cJLjk6zJTwy356wXVY49PUDGyonovq1h71va/WGXK7pbVf898iawQ9vhMG77w9ugQ6AY8ShneMGCGKYyKleFk7fFEJrj9k0jYi6Z8NpXCkyJZ/bx3aeYJT6k5PQB0NHgqM2f0lEPmqaXscs2wYfMT3kYoks0AFO3Of2A==
Received: from DM6PR07CA0041.namprd07.prod.outlook.com (2603:10b6:5:74::18) by
 PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Sun, 11 May
 2025 21:08:54 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::bd) by DM6PR07CA0041.outlook.office365.com
 (2603:10b6:5:74::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:48 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 27/62] drm/nouveau/gsp: add hal for disp.bl_ctrl()
Date: Mon, 12 May 2025 07:06:47 +1000
Message-ID: <20250511210722.80350-28-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffe92dc-256f-4181-c14d-08dd90d00942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZrnJRxN8a4GNLPCB6fa45ZBiECZO7wAW6nfwP/s8WIZxLzuJm6yY8vYgITEb?=
 =?us-ascii?Q?6cma+ZZR1DNWOChfRePow2VooNwb9gNwKFCFFHa/1pARNTjqlnPVmziVka97?=
 =?us-ascii?Q?ykLE8YFbrunTaFabbe0agoxLBt/lPWogJr4EIXEXCsiJvydv2nxqYGPjmufo?=
 =?us-ascii?Q?LjduHnHsqFxtHzTcT2pOmyioQyYVZTqx9+4UWrwHl5Eqhpq/pP/dwKbf/Npc?=
 =?us-ascii?Q?9k6TovUhgzWR6ICcQov7KrhIi3ts3105b25KtpGFnHamPLYNlf+XFF0IOuup?=
 =?us-ascii?Q?uTkrjLhaOBa9sxwUpF/aTUMzBfl91s3OB/BTgseltm4kUG37jUQosJ5j+qZZ?=
 =?us-ascii?Q?X6WIyKOrA0ki5T1pwaF5FrFrQiNc9OEXndlDCtrd0hQBpbDJ9x+W1kZ2GJSN?=
 =?us-ascii?Q?vhApIs937RrVj4S5Jv1eISQW6P4pAFpfTSm1h94wnI0HLe8KN3jP5CiEXSWR?=
 =?us-ascii?Q?87PTwsuHJICOtnpSMbDsQ2s00rUHyXtpVWcylKrmBDNqBeOyJK5WOyPNpgov?=
 =?us-ascii?Q?sNkJk6V/1PRcLN0BLqBHy1FF2D1rryse4HAuhvlcLacjgud4CVCNHvbqtdYP?=
 =?us-ascii?Q?vlbA0PPL40JdALj4b3dEyV1PxgeuMW+mlZBRPtWlkADsZC0mSxdcrHrA+hvL?=
 =?us-ascii?Q?2zex17RbwF6FnwtVqndmrQTHJDn5xkG9ATKPf12HpZ+JLWca/bt1fJNpPSo3?=
 =?us-ascii?Q?46stLpca4uvPCBmiHNEGI3OEB/96+7fbjGOOi/IS6ltTWOvI388//ozajvPD?=
 =?us-ascii?Q?N9Hvf/spHXDk2XuSk6DFGkfbog5WyEwy5BZfeIiHUMrjG8NtHUsD46cgQPbf?=
 =?us-ascii?Q?tdEoZtTkhAwj3oGdP+f5IA8qyMkAV8F1LNCLCLDhlHBB6j3P5gm6jR6hQaTU?=
 =?us-ascii?Q?hlqAeJSWxp0spLhtQ1u0CD50C+B2wea3oWOsEzx2Mgg8ICg1QFr6hNLFgaHa?=
 =?us-ascii?Q?mvqVsbc/qmAyQUUw8c5q8tf6fZueh+dlwqHSexuU2TchB4yzkrYZUjmfewhB?=
 =?us-ascii?Q?cEHfa+L+iPUi/8uoDQlggwvVXKfkQobOjqwyz5BfHpnoAME4NaRo6+yzM2q0?=
 =?us-ascii?Q?j6xDXlT2JXpvLr7HfIyOTWeoCD6NR39r97bL1g8vAwYXW2F/MDb6iP4uOQk8?=
 =?us-ascii?Q?rEIgEKAryyuGZ1qSm/lr63qZYsUm6L4uFHa85xtjqBD039lsc5FWoYtT3v8/?=
 =?us-ascii?Q?EcWtfvTK+hGtoA/wncZA5TZ9tq32EZDxB3hP3ojzI6zSn/C3GjLSItRwKyZb?=
 =?us-ascii?Q?Hg4Ilo9IcCrEXBud5XKuYnpx5/VhLATIKFaH5vd98VCjKG1Z/ILItpu/7KF7?=
 =?us-ascii?Q?1Nq3uFV9NpBGDSc8ZyANh1hyVq1M2hSjDFBLdE8zypSbgpqC9X31NAaJCCv6?=
 =?us-ascii?Q?9Orsu+bip82yzprpHS9TbA1T0c/Da2JeqAYv3Z8Q+xN+DKobGx59cWbvCBMs?=
 =?us-ascii?Q?FNzKO8Yb75IRaFjX/Sqe8+62beOiLVbrr+81ZwOycajFvZzL9pbwXbEvg9fV?=
 =?us-ascii?Q?Sjnv9yZSJyLqSXX8VLFzF5FksJ7U54Ts7TzK?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:53.7998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffe92dc-256f-4181-c14d-08dd90d00942
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866
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
index ee4893e3c9b1..25079029f8c9 100644
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

