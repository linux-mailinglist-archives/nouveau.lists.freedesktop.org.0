Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3CABA722
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E3B10EBD4;
	Sat, 17 May 2025 00:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LIAB8x0f";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760F10EBD7
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUYNWtVpCZ1mcSkFQoJFM9SeSNzPU3/khQCl+X//KAS3Unb0YLmiPtGEv3xrYBlvApq+KwCKeUlKMx9Qj+s6ZwTr/uqdSmPKGc3UimasVN3t0pk1haBZqeEHw8YyEq3gtREo+qvyWubLwG1ui08Rul/40urAomIL2EbX0HyKZtP5YdVCVZRKsczaF8w122rEfMbJDfWoE87q20mO4/S08BNZea+6qdcD43vbR0hAFdBrKHpKFLpO1Kv/AkUzyG4x3o8ypgPvm0pdZ8HH8dribwvCCw+KrkciVQu0rydS7nlj8OKvgrjSAsmc+FyhNojJZp7EJT0OaCJqtATH/yOrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bGUro1mgNqIHwTc9cA/Rn7nhPbKea+Kpjy82ol89w8=;
 b=Ho+mlT3Mv3KkFP+uv0ubT2NDRHSjoUi7Muy6YaSgJWJT5H/ZI1hXR1j8IqCd1fTgZ0Fa/tlkv6DBVwuTHUr0pL2Fp2s/SJF+mYWlvBjSKAt7W0fRWjxCZ/TgawD58WWLzisAjVhIcqk/cgusm5D10BlcSI+ec6qk0XWQzk1GnBvbkSFc3I4j4D99vO2Pj2JQ7RZUIu/zCeyUJa/PSYcxuC8vN+hJGl1vNz/VqcVBJ5FAFFzyuvn7h4beLkI2+m28BtaPTa87wdRoivwOTjmWkZzgEU7aw/2699+N0kmCjBMaBQNfiY6kmscGiMPRQJSFNQoYextB/BQODQQ78i1EiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bGUro1mgNqIHwTc9cA/Rn7nhPbKea+Kpjy82ol89w8=;
 b=LIAB8x0fpiL/fMmeQ25Qj5Dbf84Ax+d0Sn5Fp/LuC2gxmQcAhHU45x97kA2S+qnPyMqjfjssfdEuujSPC3p+NnaJu4dxylLt0Sc/xXlvAN2+0mpBNKD0NSAFipMQ8HSEqyCSE6FAh/ADB5VcToMWqXvseyvzlGgRZErITF2BeoxCNrlPZRvQWp/nWv5/n+Ok2hCta/hQ/pWPg6iVvnqXS2yuL9xyRp/MD8XilSx732Evjay3LJDk8+7drvcKteo2FF4Ov1MgR1WiuiddDQjjExoglmJ6snY8ppHChefwUvKUc7otyHRdCjLBNOmutfyNsihZbbNwLTnCXw7Fp5MraA==
Received: from CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:26 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::96) by CH0PR04CA0102.outlook.office365.com
 (2603:10b6:610:75::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Sat,
 17 May 2025 00:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:11 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 43/62] drm/nouveau/gsp: add hal for gsp.sr_data_size()
Date: Sat, 17 May 2025 10:09:35 +1000
Message-ID: <20250517000954.35691-44-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MN2PR12MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c4f199-1df8-4fdb-3382-08dd94d75d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XCGuWzgceH10LM7D9nHrhAtpU+4RYGnP1p8eLTA83UXVv1oCVEOExyTqaEU6?=
 =?us-ascii?Q?uFYvgRVDnH7lcvtmfCYMyuWcCCejEu7TA+N9SFU6Z8BPkF91qEPPdcF1YZey?=
 =?us-ascii?Q?yiUW+QmmTfa29epAsbmAdW64i3WkjnVeRNle6m5smM3DzYjAHmSeej2XJRuV?=
 =?us-ascii?Q?IU/IbXJhx0dc1MFzae3qGVkefxRrftFpue8xIJ2F18fmYqDP6imWUMzEOW3h?=
 =?us-ascii?Q?fz4t9nU7ksQz5LkT9CpVkZfjnsxd0V5lsiuAR4JzE1bF6Tmog4N+qLOBXHlf?=
 =?us-ascii?Q?Ch+G0YZ3nYT4JePHlcZ9JrwlOYHMGosNCB+cTYsu4LHh9jFcFOB8f770+ba6?=
 =?us-ascii?Q?ik7YGK4OUzCL0tU/sBO9ei/i5lhjnOdONIdaa0I4t8Uyfak74r7zGU7IqOfQ?=
 =?us-ascii?Q?Pm8++/9QwBuaukdHEm8zV5QiVgLJrM5Onq61UiebVV8tjCqsLMXfdxjste0f?=
 =?us-ascii?Q?RgjsxvTaeeektNrzpl6HuhGjtQWgCaaxZhkXIs0J2wQN0Rviu9wzIbF+m6W5?=
 =?us-ascii?Q?z7DJTCFEG/plb4GtE1JxlW2hC2A4o6HnDz4pusD2lJy7B+CYpon5mllA1Ywj?=
 =?us-ascii?Q?xZFJdc6qJ8li0iZ8YMPzylEwWTnvS/G02n+WQFiCxOIvxPFNkKXdqLCU3IXP?=
 =?us-ascii?Q?YkFKzh76ZcOHiqZNBOFHGn9IuG615A5QRPxxFAzuhkT84kUMJnM/5gFdCoNN?=
 =?us-ascii?Q?q51/9fKTU7NyO6se3F9Pk/EaR/P2L58MOlk+XNWqnM9BupmmudrBQqD2VPfb?=
 =?us-ascii?Q?+n/Rkz09YK/ILhfQZ6IaH7B++WFIxFZM99HhBvJqwSbEGF2GWC5ifrIX6RPg?=
 =?us-ascii?Q?naOx0/VJ5NFR0wvUxwE9aXjumCNQ1Tikq8xxbeiPjiIdfen28SNmUsGCGOqk?=
 =?us-ascii?Q?VGezX7EIM/a+gQNXfA98/z45xSolc4esjdk9ArD7MmHMiRwaSpw19H+hZu91?=
 =?us-ascii?Q?qGzyXxbtHaDZRQSAnPIx5nUr3t7YbkkDRohD/kiMFfhGH3wZiz2xdJm8y0us?=
 =?us-ascii?Q?3HZz9QEnMd1OiPIO+Eot60g1qOgxqMDThLcOIMGww03VGIvOOzC9R1uqVR6e?=
 =?us-ascii?Q?NddW1iGGUsa+Y9bXu2cN84RzHOV9ZL2vNtSUa6Rp9uwHuedKwAK1By3RY9k5?=
 =?us-ascii?Q?T6PdYc14JlPS2zOywOZ2FDbbrijRjrWgMoUdcKm0nrp7NzLUndsnlW49vQmi?=
 =?us-ascii?Q?Mpxl+O8+s+x5RLF9c7hrGY1qXQ4lwHhayPzOrjmt1uAOdeLESAgZzUFYfwnV?=
 =?us-ascii?Q?htn5HewfBPM/6lJmpD+FBNJX00eL+IGAyp1z2efkxMjNHAIXXKLSnihDb8HK?=
 =?us-ascii?Q?4I+TMDrUNu1uaOD7n6tcBrsOliNDAfJwAy3+cg7ymwuF3jRUNpZ2BePVtc5p?=
 =?us-ascii?Q?aDJcjQdPeYYRoyKh/86IAEPq9N0NRpg6RUc0uLDQ02ZRgjbtyOKd7gr+MyRo?=
 =?us-ascii?Q?nw8Af7y+OrrK+Yn4NpGfaQi6MWhzomEAEPte72py5hjINUpx88qZpBYgw9qb?=
 =?us-ascii?Q?zU1F7i67UQi6Gtt24HQvk3KCUWDEOjCCOyqi?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:25.8134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c4f199-1df8-4fdb-3382-08dd94d75d3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

570.86.15 uses a slightly different calculation for the size of the
sysmem buffer needed to store GSP-RM's vidmem data across suspend.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c    | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h      |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index b7c2a785bc58..85eb838d2a09 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1700,6 +1700,14 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 	return ret;
 }
 
+static u32
+r535_gsp_sr_data_size(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta = gsp->wpr_meta.data;
+
+	return meta->gspFwWprEnd - meta->gspFwWprStart;
+}
+
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
@@ -1707,8 +1715,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 	int ret;
 
 	if (suspend) {
-		GspFwWprMeta *meta = gsp->wpr_meta.data;
-		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
+		u32 len = rm->api->gsp->sr_data_size(gsp);
 		GspFwSRMeta *sr;
 
 		ret = nvkm_gsp_sg(gsp->subdev.device, len, &gsp->sr.sgt);
@@ -2167,4 +2174,5 @@ r535_gsp = {
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
+	.sr_data_size = r535_gsp_sr_data_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7aed7cd72e85..eb018b73d26f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -34,6 +34,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
+		u32 (*sr_data_size)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

