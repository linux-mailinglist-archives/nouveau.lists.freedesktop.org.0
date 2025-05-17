Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04488ABA714
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B710EBC7;
	Sat, 17 May 2025 00:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PknQPsXQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418310EBC3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGW+T68x8e7IlgvJ9f9S6EQIXbMAsC27YTF3cpPwfW+1VQ94PMWw3Kr2L1AgMK+Ur2ZhWaazwy76/dEAw1AHfByjBnvQvMqji7gGFbtWjIKalvhO99R/31g9qvz4Y3zNCGxVgDCRmaZq0ocvtRueugzHJbwvKyH8OEQdZK4BLBfcNE6GLHuZQ64F1nhjWB8i6yGYNpzu1FGHTZpPUVdx8pfrpyaYtZQZWjaihWl/xaeZfZA9B7ekjof90FJpNKPPTNaPAONTSWLl2iamU3puTyNZ/26HY/5xf+SaN7x617Zc1a3aSNG89tQ3/3Pgy/ylI7zrFvPTT+vGPzgmWWc/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DqRbjxLTt5hQozuDtRvFpF+v0kqEXI9DIpuLISpxPo=;
 b=SfKTtOWwY13oJTb9XINvnHMkTfoz9QHNHPPCVJD+BRmQ83JWCL67All8Pov5Y3J1R6s2ZcsgVj4iU8lfCc7S4JeO16eGcb+Qg7guJOUD9Y3+bT7k68kcJ5rXCyI0ytebwWiONBMED0aGn3aJ7mrZ3L6m7gMURBXHwIw9/0YnXLVMxT+EKA27ZmG0kGwMTMd0u2w2U+vvYwufywCBDhpBGqN+mv2FOl+y0fPm3Z/dWgV+4kzPutE1V1AeuSpS3twBxhJgNlqh3g8ggsnrb5MPqaC+GEMSld/C4p3ggs76VXAaznp/rgxdPRJRhbshdjyxgYXiZfekZxBf16zYbO6sNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DqRbjxLTt5hQozuDtRvFpF+v0kqEXI9DIpuLISpxPo=;
 b=PknQPsXQh1bKgUK6Yqlxtk44bHOxkLF7BQ7l8NEyDvMKlQu2oITQKd3lh6zqXKZO8XoP37WKhuvbyZ6u6YQKSHpN+fADthXcf8KYT081kD68Gs+gbebZRb+yA3A8Aci+Q1K6ieQBMIUosoMFPOpKdDWLF6vvHTV+evzF6D8kNoDA1HxHdiKc4GxmpiJGaywpxqptBlnk2tvhtTkbSWy/b8ev5T9H8hrFPuYvKEkCvceJrLswnwaGU2h0AaOnO87cpHd7H5IE/Ws8u2vNx95sJl4yXYQBW9p7KqdRleC7UunuFCLoCskVcmcZNOtkO1i0Xm/haYz1yCpUfBSWBBk7JQ==
Received: from CH0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:b0::17)
 by SA1PR12MB7149.namprd12.prod.outlook.com (2603:10b6:806:29c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Sat, 17 May
 2025 00:11:03 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::1a) by CH0PR03CA0012.outlook.office365.com
 (2603:10b6:610:b0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.27 via Frontend Transport; Sat,
 17 May 2025 00:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:50 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 28/62] drm/nouveau/gsp: add hal for disp.get_static_info()
Date: Sat, 17 May 2025 10:09:20 +1000
Message-ID: <20250517000954.35691-29-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SA1PR12MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f6d875-4caa-49dc-1b83-08dd94d74f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iHsdx7VXOsHOlpLkiIRRjLUISjN1ehG8pCmuYhjWaiKulGFlpwFGqtsWqzOB?=
 =?us-ascii?Q?XuMgrX1OrB3MIbRkbx4jpd/r2inZse29NtAM9StuuWRFAntl5JxAXYE/j8rL?=
 =?us-ascii?Q?3hfdmMhZWOeBDe/s3OtdFTxKnKqLiatsja5wSpuaqxVFdMju/pieHurvqIRT?=
 =?us-ascii?Q?c9Xj3F8v/iysfG5L3dL+PWXyYJJGqBiGg683XAbKykpohcXO375a5HCd3i5T?=
 =?us-ascii?Q?z6zUl9vMCaoqz084mKeDpZAZ1S0YyZRrFotVh6XvQTey14rDn2v8uYzasLss?=
 =?us-ascii?Q?NnVNCgUVDhna/Acgm9MVdi14Zma0JmOJi0CtTgVgANzdc8LhYuVK0ZYdD4SE?=
 =?us-ascii?Q?8DlqrYlqZP9cKzCm9hNEM5EtYqhXvJhgk/YtpHzZS1YjPtLN9WG8JQk+B9xs?=
 =?us-ascii?Q?gj7+gWYlmkJRQygc8WnHeSxsVSQ63QfhEc4oXRoGuYvtadgjsnF08c4kqhjf?=
 =?us-ascii?Q?CGKe8M2w2y/pZzW0OwJlmQlgjX0DHJSMKJfKl7rdwGN2/PMZkJQXmu1vkdDO?=
 =?us-ascii?Q?SbNfgJlXD7QXgQBGr+S/ElG7bpOtWlQCUNoJpmI/9dc8LhVbxycmpaAMNoco?=
 =?us-ascii?Q?cAz/vFvbYvFdESe0ug+YwmkFJb2qP6BDMt+c/88keJH5GQafYogn9XsagWv5?=
 =?us-ascii?Q?+k19M5BBHgp6D0YhCB6YslwxALwboNXOk6OOO+vfX6i1+BEjP0qkjFRP9Ncu?=
 =?us-ascii?Q?ZMtmwvAFto3U7X3OzwMWzKsAdfnp+7ozXXXZkB6jJO37ZJ9g8+t9DuEdx9ZQ?=
 =?us-ascii?Q?YrBSFudtpomXgkwOAIeRmTp+w5DNAPpRTjkV1ZL9eV1vp6aE9q5H92/rQ0Wh?=
 =?us-ascii?Q?i7kXllxZac+oygy25tmmoUsPjQ0hLqWIoshsRWir/FCaA+TxYDPZxRUyuN4J?=
 =?us-ascii?Q?sX+BQnYnUGncYvErRdrDQzf3cDrA+eMn42mLSzXqugjekkAEz0O9mw4G/qnO?=
 =?us-ascii?Q?Bad9pNJFe6zP5KfwllRnYYD1XAvUF/zpKcRRfa1pbZs+YZwwwtaAJ/X31n2x?=
 =?us-ascii?Q?LJ/MTmWwYdb5+TneSnbNQny14o6vYBHXuG670HooIjo2fTfKNP3C38l+nUVV?=
 =?us-ascii?Q?hkPBpzrXPtpmrh9dx+17Etb8RdbhABM+/ONBWgDuMhhz9/WnjOTVu9UkmPkr?=
 =?us-ascii?Q?ZiPjteRAy2NZ1YBm1ZMeGnCsds8ilG64KLAGx61V/CtB1WGSU1kfDe8YiXAz?=
 =?us-ascii?Q?u09cG34iInMOgLyPMJp6CVeC8Ob87DRVPOKqWZRDqCAHZaPYGJLXRvEZDRjL?=
 =?us-ascii?Q?y+7gPhxLCMHAV4uiN9+MeAuZCYpkqpNEdPDEXeQ0PbFcIWeSb6+YrgWBiF9Y?=
 =?us-ascii?Q?mY7k4Dayy7MBKYrPAieEiSeu3KOiH2SCO0yAwTbBA6aG8mj5+3+VHVW/KruB?=
 =?us-ascii?Q?gDYjipRc8ayoJufbdyuLLzPyS3SBaABkUuNjNLRiTY545cnC2S/DzaaVjQWj?=
 =?us-ascii?Q?z7k3TFm/c6Q5ds3eB/1IEgHl46mI5BM5pOSaLqRBw6TuBRfDITrT4OlnF7q1?=
 =?us-ascii?Q?ztWNSuO6/7x3IrKltlaUwwmEDznE+8uR/Urh?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:02.6652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f6d875-4caa-49dc-1b83-08dd94d74f6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7149
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

550.40.07 has incompatible changes to
NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 37 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 9eff06e12fca..82fc159ec070 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1440,11 +1440,31 @@ r535_disp_init(struct nvkm_disp *disp)
 	return 0;
 }
 
+static int
+r535_disp_get_static_info(struct nvkm_disp *disp)
+{
+	NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	disp->wndw.mask = ctrl->windowPresentMask;
+	disp->wndw.nr = fls(disp->wndw.mask);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 static int
 r535_disp_oneinit(struct nvkm_disp *disp)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_gsp *gsp = device->gsp;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
 	int ret, i;
 
@@ -1481,19 +1501,9 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	{
-		NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
-
-		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
-					   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
-					   sizeof(*ctrl));
-		if (IS_ERR(ctrl))
-			return PTR_ERR(ctrl);
-
-		disp->wndw.mask = ctrl->windowPresentMask;
-		disp->wndw.nr = fls(disp->wndw.mask);
-		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
-	}
+	ret = rmapi->disp->get_static_info(disp);
+	if (ret)
+		return ret;
 
 	/* */
 	{
@@ -1733,6 +1743,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 
 const struct nvkm_rm_api_disp
 r535_disp = {
+	.get_static_info = r535_disp_get_static_info,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 9df95c5b9961..b9c775aec58e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -72,6 +72,8 @@ struct nvkm_rm_api {
 	} *device;
 
 	const struct nvkm_rm_api_disp {
+		int (*get_static_info)(struct nvkm_disp *);
+
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
 		struct {
-- 
2.49.0

