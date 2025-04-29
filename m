Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9ADAA3C99
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B71510E599;
	Tue, 29 Apr 2025 23:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uw7Nvx/S";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD62E10E59B
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEHsdCLwPXreb1GD60KspAUeDzc+ijCkbVZG3A1e7NbxHlm4uY/CZ7zfzYwTDjDQQZeD85uu2IfrZ5ncbletvSXTCrEo1BPbkGJLV3DIYAAGXKDu+Bl1b4h5mbThRiIrKBg/FyN5BX4DczXCqCCGiEPf+4jiAKveOzLMD4+F18fG/PUVMCIKOCOcJ/IYzChOYMZiOOj5uJabSJUaHVV7dp4naUnkn6wPzgQzK2Atl3EgaUIaZazg9OeN4PvQFQxVLcCOycbNiBrdKsl3ZMl0qGUjG8/1CtvZWwR520EF7ml1YNCohAvNoNGNfKcu6g+HHu0r7rAjZRHC8puVFnO9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxYCFVCS/h7H6XRATMQqGWafAPeOEDbsJjT0DE8ycuk=;
 b=VbgQ0X9lRH0I0cmgLAnpMt/0y3xRy7rAa1P6fHOuTlxb9Wt68kPb27ng7pi4sfxarLK72rWX2I2VV0dm+buZh6W4o2pC93HQUW5oRwh5uiQ9sbhZfS0BEitjjNqtReSMGN1DGfUGK5PTKAdCyb5ZVVTORvdqe6YKUZAnldeDkjzjX3hXTZWpbgjWDx+iUqv5LtKQdEsvFfruekvppKQywKhfKTenTaMWIlj0E5EizfjCUzvlt81aJ3VTOQ76d0SKu6nWOePlT3nPQ0d7TJ7eJlGGhtx5FVmX6OfSOo59uX0PjBVR+fe9nNvhhFk8Ww6sl8O1A2bIvyAXlYdGAl242Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxYCFVCS/h7H6XRATMQqGWafAPeOEDbsJjT0DE8ycuk=;
 b=Uw7Nvx/SIcTKjFV4pSJAKMGAI+0n0/gp/s0nlwWckR8bhehEr/NPZ1DQVcx00vvyVXCZAa9M2bGa22w8gN1ms6BVHkvxJTgPbXPOHX6dl7kTu7paxyYFmEoo07pDIxsa/zFK0K6XuWErr+n2xFgnqzrjUr25ca9454HWbjhAxE3hdLtjayw6dH1UFy3uNNwG9B7W6aAwxHl9rcuOVA1HCIZwRiq89mjW0/mG0WYwrq7IBcSM66tjBu0BBkKZlmY2FfM+kSDaP2FOFH8zHonrCCsETZcgAOs+x92OQM0BxwgqfO6vLRbs1/uZ3ppXLuSGcMCSbJ6EH7RhoI/2zK8DBA==
Received: from PH7P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::31)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:40 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::ef) by PH7P221CA0043.outlook.office365.com
 (2603:10b6:510:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:24 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 37/60] drm/nouveau/gsp: add hal for disp.get_active()
Date: Wed, 30 Apr 2025 09:39:05 +1000
Message-ID: <20250429233929.24363-38-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a681158-184c-4ee3-e7e8-08dd87773fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o6sCBwa1xZ+YgIGNC4s0GZb+kNaw2JSnXkaW1AkwAttKyryrHjDKHn8yUFsF?=
 =?us-ascii?Q?L5y1Z6ycm1d8orwCSu9elb5nyqpsgx9d2dhLm7waN7YoYDgDBgcWUoa0vIZe?=
 =?us-ascii?Q?kk4aQcBnPo8iRRfxOoVeGkOAXZinNGTUAAclsO/+zJuViGGbRcXaEOfYC9Sf?=
 =?us-ascii?Q?LEKiUYQdqHbi77YaM/iT7jvWOhvrQk8VvzwgepO0ks4Gdhdi4aAQ+33SrcNm?=
 =?us-ascii?Q?KdZWCRPzlipWbuQx1qd9f5M73ZCAGYMsPS+v/8pL9Dl8wcsIakHOan3ag0Fd?=
 =?us-ascii?Q?MDMPTftsrFBY1mujR1ZM0SJC1pveVaPw24BSPLb7qEIE+CUpS8XhdiA42JTX?=
 =?us-ascii?Q?ZbfFoHbCZFGeT4jFDvTvnKkRatkAGm+bQrEOtpCix5m//zRUTnmUtD62IFrv?=
 =?us-ascii?Q?//OhoF8lmJE7YxYWp4vM1X09yYdhW2zQB4QxZrBubxdEHNIv5HWku1IBiRXO?=
 =?us-ascii?Q?EOwDRDJ1N45qNKNJ32K4h2AkLC5FiCR/MDzoCQWjC2DZE1mMFQaQ3vfs2Q8W?=
 =?us-ascii?Q?WnSJ6YnfXNUu5qkGJg/hyVhVW9ORcKVOQlyQmmvBD0KZ1iNfgNgcl+owkxp9?=
 =?us-ascii?Q?DO8/67xPHRJAMtJsUfuW4r8DcXmq6cohvFgUTaBQzQ6lp9sZU172QajuXUuu?=
 =?us-ascii?Q?ytjUctRKV8J44fNp1Bcf1GibHr2Lzpby9tUIQ/6DtnpsnvLr99bTbeFKKHZ4?=
 =?us-ascii?Q?pgr/WrZbuSq9Od4VMlf6sJlogD/Wg7JzDhyEfnsUAfTDX+rzdVrK7/Pv0w2Z?=
 =?us-ascii?Q?sUERSg1QyD9RWGJfxY2lV7TdFB2KrEplnIVKwqhNyID9rt7eX2KntBK/KGNY?=
 =?us-ascii?Q?J36mJG6C+HRpygMdg8GizHga1yFiE6gDBm0a1f+USVlt4sk1PH+St0HR3o3K?=
 =?us-ascii?Q?Orcdb36bQO3I5hleAl+vCd4remrMFfJdvwdTTdmBCZIs0ekht52sfC/XWi5b?=
 =?us-ascii?Q?Vf55lmJGS8ERe2JoDvNX+PLZ1psvjjFryNEgplghoR+iP+3SKvG8n7kM8yL5?=
 =?us-ascii?Q?DdRZpM4d+vEHggg5FRMESwBtu1SZf2ySAQLauwC2jnAhFLIuB3PAOz0rZ765?=
 =?us-ascii?Q?MHmlzqZ9op/EdztPMBqjcAPfyI517RdPcn0cH2ys4OnPKRA/52Yx7aMh9FZ/?=
 =?us-ascii?Q?0c/c6CCph6tRCkyYMWUYR5l2RnGTYlENmVQhO9cMMveCgywSOxLE1znyF84w?=
 =?us-ascii?Q?KEnsL2JjwaPRkWpHy3iHWCrl4++sJlK+5aQ7uC72PNeBKRv0j+IqVKwtrYVK?=
 =?us-ascii?Q?sGnPZgsCqJHnE+7TSZxm7gykBJHNQzo0J3SQvnu5o9c/sMq+s3Jgzod6iDcw?=
 =?us-ascii?Q?0lndS576FweVnYPHZPNtw/eAn40IHvfvqCqVJt+rlqvUi0ODBPibirYczGLr?=
 =?us-ascii?Q?yjxNcSwiui6BYA7dq+9LbdW4oYOABxy+l1HtMEOSXsqwzDRJhsbpRy0uIuaW?=
 =?us-ascii?Q?n6MZYxBBW8AFj1aaiZWU9Mg44lvGknXdyjvJSUlXDqIVo4wZ4P3qFOdZVoX6?=
 =?us-ascii?Q?0h+m0IMKv6lr+tZ6PY9LhiXm2CRlnAsfgzmc?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:39.4925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a681158-184c-4ee3-e7e8-08dd87773fb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530
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

555.42.02 has incompatible changes to NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 7 +++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index b055aa37edcf..769a05578f04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -724,7 +724,7 @@ r535_outp_acquire(struct nvkm_outp *outp, bool hda)
 }
 
 static int
-r535_disp_head_displayid(struct nvkm_disp *disp, int head, u32 *displayid)
+r535_disp_get_active(struct nvkm_disp *disp, unsigned head, u32 *displayid)
 {
 	NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS *ctrl;
 	int ret;
@@ -757,7 +757,9 @@ r535_outp_inherit(struct nvkm_outp *outp)
 	int ret;
 
 	list_for_each_entry(head, &disp->heads, head) {
-		ret = r535_disp_head_displayid(disp, head->id, &displayid);
+		const struct nvkm_rm_api *rmapi = disp->rm.objcom.client->gsp->rm->api;
+
+		ret = rmapi->disp->get_active(disp, head->id, &displayid);
 		if (WARN_ON(ret))
 			return NULL;
 
@@ -1753,6 +1755,7 @@ r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
 	.get_supported = r535_disp_get_supported,
 	.get_connect_state = r535_disp_get_connect_state,
+	.get_active = r535_disp_get_active,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 138e7c77b0c5..f025ebcc7d69 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -81,6 +81,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_disp *);
 		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
 		int (*get_connect_state)(struct nvkm_disp *, unsigned display_id);
+		int (*get_active)(struct nvkm_disp *, unsigned head, u32 *display_id);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

