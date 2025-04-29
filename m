Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92079AA3C9E
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49410E5A4;
	Tue, 29 Apr 2025 23:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aBL0zU8x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F31510E5A0
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sU4KsxUuJNIe3ZX9QSK2rAQYFnD+yCSjmdg0Z3/+rgnpSP1bq+rS+blwYKvT2KLr4uzh2nSC6u1RkwP6WVH1QbHKSUQAPDagrA0ebJ3Jko/qgF1Rw7OetRRulpT7Ea9C+cf/Mp//NNT00yZyWVhhNxjtZ0RupXJ2hswXJa4/NHKsVKS8whEKvVheamVzzBH6DhQUVrQa3zOS3ziBbapUuxgaz8TZeyZ6ILpq1jEwRZ9dJMWLN0pk2QmN/MP6aNqtPMiguUbJ+mn97d5yEX6Eu65aMGLFJyi6HXCTK+v5C9ysxSjIHGgyhy0W0lNi9V8X3GpW0UDs8c7KhoLQ1CDQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/CyonurvTsNd0APzY5vSTa2bcIObOQ2SMtYhw/Egmc=;
 b=gSCj2xeTOrIzHSumNtGrF3EBli4Z3HY/08muNn3Nm/0G5VLR2IArgIyj1pTVcLb9uAWnUbQkbEXT0lnZJhE0riwK2ChmJTwibbCvuCROmo1P8/o1RgafiBr6gtr5WBt8aEpBUrynOkK9hvUBljcQ7tgbaBlzpwpMF69MisyczJBQmalX+Tp3joYwOoQioFfueOAFsJvMMdFCSxcMGHi3Jg0K6t1pqM828AcysKF3FalzkbgPfn0MXEerdAsmo2ysdgiS+QhAbBBO4aDKwFGYBbFsmV12uiLsR5MwD63WpU2gb4FQtcYKhdX06vxlXCVoetqd6/EtWNvD56MobX0z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/CyonurvTsNd0APzY5vSTa2bcIObOQ2SMtYhw/Egmc=;
 b=aBL0zU8xpw37ZfQIf+iLBCS2fG1SMXgadAWCaPNgMLZ5sYaph5wdZ4+JU9DvbyleiIAdgGWXIPWyINdqYqHX1h0A4eiyNG7kYUULjkSngy8eiFjS0HHNsx9qaxfGD1Fp/ZFgIPtM3EcKL09zDZYvJgLUpcsWrB3CSZGl1rKxcOQHtvhjEmp5kON5JN5/0yvY9h59Lc024gaZl4da155RL9Chgw15dQpjzRvL+R7KobKDONPoDO0Wj5MlsMzIlq14rFE5+JWkUVtt78twHh+y1ZCmS3/O5Jnx8JHnW2OluLyORv1NC40RPaySdj+LX+PPtzZUY23LWVlR/NO5ecbdMA==
Received: from PH7P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::26)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:45 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::37) by PH7P221CA0031.outlook.office365.com
 (2603:10b6:510:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:45 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:31 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 43/60] drm/nouveau/gsp: add hal for gsp.sr_data_size()
Date: Wed, 30 Apr 2025 09:39:11 +1000
Message-ID: <20250429233929.24363-44-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: fd29bada-5523-4166-fd67-08dd8777434b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?txjGnNUuy3fTESBQ3xxYfzKathWDkhcQ/K5Gm6HueB3ZJalCHEP9Btfx+m/A?=
 =?us-ascii?Q?Q8HEGk4kdAZlueCUS7dmrOK4ZVDTE9KmBHontr0CrPCHfr8D25s2piQS7xPA?=
 =?us-ascii?Q?9oDZG7mISMJcAVRyzG7pBha3qqbvZMdxPv+0CsCOe6vfNPexiwwXZin286jJ?=
 =?us-ascii?Q?l1w8nhRz5bxAfVaAxktXKndm3DJP3q7ajPGMQZnkhiLs+O77mestWfikVy2t?=
 =?us-ascii?Q?BNE6Sqxor/6cgUyI3IkN627jB4RMJUqViDd7SMUIDX0LjgB1y4UKD/eNvsZ4?=
 =?us-ascii?Q?NdwzTlU7R6eBAakMDuqCSVUkCP5++SU4FmPjaMG5XCB0tBAJOCa/V4je4VLx?=
 =?us-ascii?Q?NpY5Fyra0TDe3hYbO91ZinAZv3mQ3BznIcnMRL0OZ1Hmd6XV68tVB2GajmMQ?=
 =?us-ascii?Q?hUoFpQ/wrRvdLtPSv5cGAUR2jtFEsF98dJtSZoY0fh2iz0OC5HI3VH8G/Ukw?=
 =?us-ascii?Q?AuNSn5lCXJFgvZV7oj9Nzo8YjjXCAwyoYDxEiEQ1t3ATWa2wGm40XUJ/EPkw?=
 =?us-ascii?Q?WbiXS7nrgUoREXtA/to4dqDl0881FQRRx0FZc1oRm/zEy3AAkWvsjsMHf4no?=
 =?us-ascii?Q?GI6lyKNQuXg9cNFkhzUAIJ6SiUYr/7XztgYWGK2JyVd9jEEuF/vZoGk1B+Nz?=
 =?us-ascii?Q?GN5Kw7C6kUTV9hXia7KbHJ9TcZZQhxipQpaHnCtnkAT+tixV6g8suh79OCHP?=
 =?us-ascii?Q?RIhdS89fGHRtZRJdRDS/rH7pbOV12N0dRdGEF445DBz6MWMAs6a46O/s5vMJ?=
 =?us-ascii?Q?ZLv+sxbdRnmjWoFCN1qZPtvGX+liq6sPELSKVgTGKag7zsaJ4vSEmI0U8Um0?=
 =?us-ascii?Q?P09w6wgIx4/OM5KpsY8CIK4YlonGFANlbtrG0Ia66t360Hx6YuVl2BbiYO5D?=
 =?us-ascii?Q?Cs61Kufxd8NtNxbmuug7nhjQmsuZJREEkdFcjbQVu1jJU8AyRW2Klb7X4Hvm?=
 =?us-ascii?Q?xnyVYoFe6dRchj0rgIW3/7QiCsTYrtoVKBHwvzx34gt+aWMRrlGe5Y/oB6dW?=
 =?us-ascii?Q?2ECoIN+aNA2elTSL1QUd1WMIQcZP5AihI2UQ4NqAqXDKALaQ2k7+sXz/Qzkr?=
 =?us-ascii?Q?ExClgF5Ljj3upRaQaxbofCNgtSEOPvCyGHXSBck1r46XNWHLPhssYtOROMz9?=
 =?us-ascii?Q?ktE5jPE2rz83uMnD8X11Ps65Vu0mdZaooU5djN5Km8CaK+ms7/3tVMPBBkcr?=
 =?us-ascii?Q?ExfJI5mkGqmWHRGhlFsv41vOb/8VMqHUBXfjDNH4i3Nv7AqDLf7fDKKYUC0k?=
 =?us-ascii?Q?0OqbKHfj2VuMddEMae9twGSRlR1w8Xu6Yv3nAjkxfAuacsokd96D2Jw6izMb?=
 =?us-ascii?Q?Ts9IVneZTPJ/sjisIxYYBvCs0J1IuZAX75OKb1b1B1j35DatpXBM/zbTMFKm?=
 =?us-ascii?Q?rFrYpPgMxc1ESqutlf4fLMVQXzLOsV0pDAFMwBSOUsgTIsejlSLtIGlHBLGr?=
 =?us-ascii?Q?rxb5VA/UlKs0uZPx6+ocUYOTPuB1tHor0tAS7NH/xBCGYhFnD/WlQ75uM0ae?=
 =?us-ascii?Q?n3MlGmiJI1KceVL3u5zbx1Wvlsnw3gq2phsk?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:45.5032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd29bada-5523-4166-fd67-08dd8777434b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073
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
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c    | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h      |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 94c3c55eb314..57eee1c5ae88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1705,6 +1705,14 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
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
@@ -1712,8 +1720,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 	int ret;
 
 	if (suspend) {
-		GspFwWprMeta *meta = gsp->wpr_meta.data;
-		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
+		u32 len = rm->api->gsp->sr_data_size(gsp);
 		GspFwSRMeta *sr;
 
 		ret = nvkm_gsp_sg(gsp->subdev.device, len, &gsp->sr.sgt);
@@ -2172,4 +2179,5 @@ r535_gsp = {
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
+	.sr_data_size = r535_gsp_sr_data_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index a115d24f02cf..9e162769cf3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -33,6 +33,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
+		u32 (*sr_data_size)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

