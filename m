Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B7AB2B5B
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313F110E18E;
	Sun, 11 May 2025 21:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i3wmFSaC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0261710E190
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM/HSUBDH5MfJ2qD0pTGP1aare5DHIGFaL76/5rVilKRH3HXD5LZwZYb7s8QFlzmcniQxUnq804e9z3WtnWkwsqj6Yja8c+lzPyRyfzI5tIA2H/HMjj2khtErJVip6Gby+nrS2FAjqxjTVNv5ernFv5i5a03uzWmnPELAJ4BnvGd/w1FzTO9V/7Rgqgn/hv49JQAetw6vp954nAVkE1NcS41EJ4Yr9qf+3fy1GjjNHpxm1WVARXsY3JAaMEAiFHQwMOtUa1RVmqxX6ErbMqCRWCFUDO6FUudLHHOlJ3ZMX30aFVYUpn8zV1cwZ+H/1ylubs2i0vHocw2cuyQyviZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW0Fkm3oEME+zky8uwgwFDItcGe/FoBbHWYexbcTf3w=;
 b=aLeMJ01VjO1T/4Q4hzlmKfWPXW2Y7ogCM+RDO4AGhLp5UvdzeydY4REz3dq9TWkHRON3u3QxMfyVXn23u5c7H05kFXc3IyywEatDeWdcreixh9xQOuLRczgsDy/FCMR2RkaRS5k5fH/R68n/fAXhuufCHr3iPnxRpkPGPF+OiAbGEzFljL0tWxYL/+d5U7bMrc2fD7tiYT903YHlc9pHVQY54PWOVhXRjSwfc6mxCyHu40P+WS/nO9q+B7jDdkQ3oNDyVE7VO8bptMZ5Rrm2aDJjuPQWZS9uibQO+LJWFqhCrJZ4YSPk1PI7K68sjaeE1QIbOANkM58I1pT0wp8inA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW0Fkm3oEME+zky8uwgwFDItcGe/FoBbHWYexbcTf3w=;
 b=i3wmFSaCHRgkK8WeWStflqq7OHjE68L0fU8/kFhovNga6VVFnjGFSdV733aYqsP0GXnmFKCzU62dsH4MCquFOcw8prF9OelJUD3Q/R9W6YVBuImCSnR+4wIDlann+dwrGip8D5x6NzfCS75srzVWxJfNqeNDN8gksBjjafd79HxSLHLh2GVagZR104xvdwxJj1wkcA4oBYfgY0VTHjbcgyNYKkZ4SKXQxp2UrB52rlTtUWPmJwkoco6tI9dHd6VFhR/TROrw5jpagj+H1Tw9eTiPdx75/bDVHghKVtRstyi1zWIywhoYlEA2GkhPqZHIwoaL2XyKbrB8jM3cHMULgw==
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:50 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::af) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:41 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 23/62] drm/nouveau/gsp: add hal for gsp.set_system_info()
Date: Mon, 12 May 2025 07:06:43 +1000
Message-ID: <20250511210722.80350-24-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: e7119913-a3a5-4cec-8745-08dd90d0074c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EIPpf/dPoBzR39rid4RFVmhNuG++KQeprpboET/V8BsyXxHBE4D/iqE6ZpSp?=
 =?us-ascii?Q?79oD/HZHRExNbk6VZ6NEksX9+o84lJVePdVsevbJzxWsllb2GbLIV2u5r0Jl?=
 =?us-ascii?Q?MvJc8rfggqSAZbgvEs2s1CYBp0UcG73k/A+eg6i5ycmk6yNqUJpY5x7JnvX1?=
 =?us-ascii?Q?J2oGPoWpXgX/oDqQOzD/AAd//hy4sYMYzqvPnPS/mlWXe3sXKSFr17qXniTH?=
 =?us-ascii?Q?gMfHygINhE49ByoItILgRymX5eaISSpQBW/H0Kpt1QEH02iCtdzFNqMiN95L?=
 =?us-ascii?Q?0BfbhqW5FFDsUD5e/NrQvbiT/vCV87r8b1NhbOXJRoKMe/FS/sY2CZ+Za2mJ?=
 =?us-ascii?Q?9vrkP2ePKej1KqoyFYzeNOdhu9/MH7gX4ly0MQQCLe3JmUOiTabmkQjWAX2V?=
 =?us-ascii?Q?KVfMHQyS06FjBqgxiBwPDktGdUpxMOmY+SJk+KC/+uAUFZhpaxSRXHoUDcl9?=
 =?us-ascii?Q?/9jMupBHTimTuwPY4obu+xP9tq5d2Q7RvJu7d0J23MAD2ljNmSeR2aNxORhT?=
 =?us-ascii?Q?fKRZhkqECQMvE/TN2SHqHTHFcNLBP90sIdmEQiful+yqxZ+5OYWbHl1DFgBF?=
 =?us-ascii?Q?n1FqsUv4+XV7/hdBCFZhOmjIyv89UV4hxG70n3psV6J3TdyuuFiuEmqrnSQn?=
 =?us-ascii?Q?uk1PiMHoc1ZvOjLBPYQZ87WFZW/jGzobXD2wW2gqRgPVyd+96wq8UtLXmFsq?=
 =?us-ascii?Q?ysNNHya+V/rXt7nGwzgvwdjlB4nhi4kPC/o8BY7xWN2zqdSAjk7O053/EUFE?=
 =?us-ascii?Q?9/+tQ+1KaydQCFXPksNDgFhz2er5RzfOTm85uZJXgNiwn3i0FPggHGiUY78S?=
 =?us-ascii?Q?ErO/Va6IGQ8gMc1gX8WZXdoNcx2x//gpbDpwPqJdhl8CRIfFVd2hVPsvkvI1?=
 =?us-ascii?Q?h63US4yPMgitLrO8QYm6d1zQ47uDizXwvyDBziEZRYKXwQELByUQxC7RhAdo?=
 =?us-ascii?Q?kGwGC8KKf8fmA2ZQn9rBWqcyct4dCHvKp0xMVkS8rnA4hnvCFFb11XOz6QI6?=
 =?us-ascii?Q?fkK2Y0jhQlmU2icIf0WYXXfwvcwprPsxjagp4U/dG8ym6klF0mm4XVFNAfoo?=
 =?us-ascii?Q?lQ6/inFILhrDFHnp13vXEaeglPHaZvEcun32P6wgRAilVyI76H7ahUlgJ4jB?=
 =?us-ascii?Q?cZhaktLUla+icneA4RJxzbShd/tGmgWTiSjWYNNplntaYlB9wI2Dx6htmNYD?=
 =?us-ascii?Q?0wcLbU59CUlWbScwnZFwnMBOnJpdxWrkOHXqZ4F4Ua6tDvB1jDMsoOItL4Rk?=
 =?us-ascii?Q?9Q/PMtnXuMZE3JpFBNFLfSckRpDWtjrLjzE4i8C9Rp3qIZGyBrozWThBsHm3?=
 =?us-ascii?Q?fxx564mwDBJ2puSV268OkC8+N0tS9eTEC3LwXE9oux6wodA0bQmBcCvembfM?=
 =?us-ascii?Q?esuOHzJHGmPgprai8D9/MncSLCCKRIBcdud+/LJxog2+HzBN3FYhW5X11+fV?=
 =?us-ascii?Q?E+2XXaWFjyiMxb1Z7vZ+tslkEy5/dHPXzQUiPofkBoB9ammeE+td7Yhkpq5i?=
 =?us-ascii?Q?9st8/NXAJIA2EfUc9YAMPDsx+B+guBuW2B0C?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:50.5106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7119913-a3a5-4cec-8745-08dd90d0074c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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

545.23.06 has incompatible changes to GspSystemInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index bf8fc82b0360..b225dd06d490 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -872,7 +872,7 @@ r535_gsp_acpi_info(struct nvkm_gsp *gsp, ACPI_METHOD_DATA *acpi)
 }
 
 static int
-r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
+r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
 	struct nvkm_device_pci *pdev = container_of(device, typeof(*pdev), device);
@@ -2085,6 +2085,7 @@ int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	const u8 *data;
 	u64 size;
 	int ret;
@@ -2139,7 +2140,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = r535_gsp_rpc_set_system_info(gsp);
+	ret = rmapi->gsp->set_system_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2151,3 +2152,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	idr_init(&gsp->client_id.idr);
 	return 0;
 }
+
+const struct nvkm_rm_api_gsp
+r535_gsp = {
+	.set_system_info = r535_gsp_set_system_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 60e8678b7913..efedd387fcc5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -22,6 +22,7 @@ r535_wpr_libos3 = {
 
 static const struct nvkm_rm_api
 r535_api = {
+	.gsp = &r535_gsp,
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 1a2fec3935a4..4a37904f7f9c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -26,6 +26,10 @@ struct nvkm_rm_wpr {
 };
 
 struct nvkm_rm_api {
+	const struct nvkm_rm_api_gsp {
+		int (*set_system_info)(struct nvkm_gsp *);
+	} *gsp;
+
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*push)(struct nvkm_gsp *gsp, void *argv,
@@ -71,6 +75,7 @@ struct nvkm_rm_api {
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
 extern const struct nvkm_rm_impl r535_rm_ga102;
+extern const struct nvkm_rm_api_gsp r535_gsp;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
-- 
2.49.0

