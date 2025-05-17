Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C97ABA710
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A616C10EBBF;
	Sat, 17 May 2025 00:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M3QDvHf4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2B10EBBA
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsbsB8CvrQPbyHxFFcKKNVGt3wGIKbRe4BYb9ZPwPX4vu91WP3/AVg/J4oBwMtIGdhIsJxJuknNcuKYr/Qu6ua6s3CmFiaZjI1EAgOh7p8dap5ATd0NDyhyAY4JCScN9c1JjKsmdJA+CJIWobkAdBOAKjzq5BWbQljGzcv29YiBAMIaXzn/Jh5xjZZ5hLNezQOGN8faJ+GZuF5v6ku100optSZILE00Liv1E1rD/qeAlap5y8wLXhzyx6VjSGuHG86/znaMwBMh8GuO7jTN6mpHrtUql5oVGrY6IkcmzFmz6Wq4OUYUuHv8CGkH9WDy6PfEw7apyMyQ/acYCMJNJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eotsiiALlVF1VenbCwKR/zTo2nRzvvIxL7UVIpNgBc0=;
 b=WAS7qgDIwlsvFPjfwiKyDOmPS+WYjNlcXf3YtpVFOuoTRuEwxDczp9w/rCzhfJKjL2gbzoJxlFMvFs6MJ7v5ek/45hioV+kK9/b1VBYGdHlStKZmGQ100hfGVqu3jzlSx26IvVqhS9AF/BV6ilTXE/ioI5ORF/RyH3mupTcGZAf0jnomWwbZNytW8Br5MgzrK16QtfqBUuxgczuMSLncsQSzLJAihG5MF9mNwj9Ls8FxCw0lfsuuSEIBl8/zszTye3pKAeHpxA+hKbk1HpB1mAH4ylLKEMxCQZP0s0M4OrAYt7FoGE/PPcB+CBxCzG1q90g6UkieMFKIMGD/4611JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eotsiiALlVF1VenbCwKR/zTo2nRzvvIxL7UVIpNgBc0=;
 b=M3QDvHf4H0dPOQGocEc9FVlDLWWdIG6fqLD7VKEI2dvUlSFbleyNFvgMHRl3OfwpcjrSMWrhPcywpEASQQjXGIiTYIQRREflSwEGdhBvOMbBc+N9NzuK98XG/Eu9N7VN4jOXidnSFffdb/iSHEAytTFxnkclJOV1fPOZ90blcR+9pl+E4s/MccdacAZLPvT6lGgVX07lwWChvvONxvOhN++aHgeMWhHn7XmjY6Kn8X6G6VAJcVMvKwAu3u3gPHWAeVXw0ygTMEFMoHujNWcKJwVGO9XZAkEySdS3jK2xo/ghnUvsZkflKfuWKduDZwV/y+KD3ZChL4cn+iIGcqpFew==
Received: from SJ0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:a03:39e::30)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:10:55 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::2b) by SJ0PR03CA0295.outlook.office365.com
 (2603:10b6:a03:39e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.31 via Frontend Transport; Sat,
 17 May 2025 00:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:40 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 21/62] drm/nouveau/gsp: add hal for wpr config info + meta
 init
Date: Sat, 17 May 2025 10:09:13 +1000
Message-ID: <20250517000954.35691-22-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e028cca-00e6-4387-9164-08dd94d74a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UAG1gAd0Bmma1ywTkHNevkjoaui5DkHXzPMcDjtxF3I0DcMa3XX4FQhpPNnI?=
 =?us-ascii?Q?4pzIoSzYjWF59H8bCpexBpb8TS8VyQVnqfQ1uY170/vmuzyG38dFpkR4aiQd?=
 =?us-ascii?Q?9sLIHHdFDm/g7A0N05xXlUpiS68/CiamCYuVfIU6DEMIRSiWQiMHmXwu1/IK?=
 =?us-ascii?Q?0ChbWMpDlpeJC0a/Hb2YrFzI41uMZYx7GHAQw9aGUIxf09tdEvmZLBwDt1yJ?=
 =?us-ascii?Q?Tm14hvnMa698HwjAncW0qvYhcpXTQ8A1W9LEr0xjs1SG+5w/Y+y5Scwb5neN?=
 =?us-ascii?Q?hOGfHHVNVt2Th5QlX3TCC2wuw5/L7my8WJBSmSh8ejhnIxekLFQ1kdJc8l9D?=
 =?us-ascii?Q?XS9zCnkx4o4p4W3BcHYnbB+3xhsi65FNWxILIUqMcBNP7EImrtNA8XmjU1AN?=
 =?us-ascii?Q?ZVDS83fE4jkEVlCPelRUlML3WX3TSO8w1+YjX0U8TkxegemWe3eeiPk09N6M?=
 =?us-ascii?Q?F3mEenOTFSsxijy2iQh7R3sXociO82Mr2ZeHhgIySelBFirb1MpA2Sc6Cn8e?=
 =?us-ascii?Q?CNOGiYXvjWzpyzd8gUYDO+T1aV2IBk8tTaPI72gkqBy50k2zhy8+i3bejX3u?=
 =?us-ascii?Q?hmQsgmbmC1uZMh4OzGXslf6esR2gxWG9fgAhAW26FSlVeh1AVVBwKDCIFF4F?=
 =?us-ascii?Q?KbT+BP8nC7p/WpAEiJcinPcPr+GvdegppNJa4G+s5TFjmZ5Vxy271httC+bL?=
 =?us-ascii?Q?OOfSA+so9OFhYuO9Bb5vgDR8vaOZCnfVJuSK97kt75Nz/AY1cvOlkrZICssj?=
 =?us-ascii?Q?rCw2tpSv5yz4zLnbbuY967ERt8T/RJXz7aYre2OEY63oHldsQB3DBoWA/WPm?=
 =?us-ascii?Q?DZxhv4ee3N4ROlkmJe/EgESoXa5iiOAH1mJMy+z2HoyPMe7Voqn+3z41vm8u?=
 =?us-ascii?Q?oHRSb8ktH2QXXfcxrXYHucXcBTjJiahy5PSv3iNKCqtD+74RJB1eLWgq8Cqv?=
 =?us-ascii?Q?WNLgUMSEjPCxbQf8nfJ/4NG3jkVEH/5JoP/3fuaZLlUD/1+q1F5ZIXG/OgDH?=
 =?us-ascii?Q?T83Qbwp3AqhFREASJX0UpILPW0O3vQbiA7dGDCzqJhEOoxAAOSV42dSyDoTb?=
 =?us-ascii?Q?n2reJnU4Zc5Lz8lOTzH3gojIqYyoEseTGPGqHAwrLnFSSaSogS1rb5Nu3YEs?=
 =?us-ascii?Q?YkxLFwFz+tHZRwWFpBYo6iwUXgU3W9C0RWL3d2pUMM3fjWg04nMbn60ZM6EM?=
 =?us-ascii?Q?sTII84h+VQo34TBKrDlJZbnRbhyVtgSRgbGEzO/7fCHPdw05w2dG8YYJpS38?=
 =?us-ascii?Q?tsKH0ppYzZtlSbsHinTOFzukIO0wP42x71e3Bsu/3hpI8KTpuP2dvIExmjU9?=
 =?us-ascii?Q?STseBt0Mu5e47tWSB3iIBJTJeZ3xHiHjaFkYQNJuQe24CFJTmsvfxT+IA1xk?=
 =?us-ascii?Q?W5ukrfhe3g68XGpLA1AQOQukYivsQv7HY0JIYlQhTguFBzVtzjJdiBiqXh3C?=
 =?us-ascii?Q?FqMxHowoZZCC9Cc2lfVB9jle1w8XogmUqZEORRmgIeF4hQKD/ruxTnNQmYfc?=
 =?us-ascii?Q?UKdVhpSDOcwRIvC71zEnL2uobTA2FfcccZFI?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:54.6213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e028cca-00e6-4387-9164-08dd94d74a9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
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

545.23.06 increases the libos3 heap size requirements, and GH100/GBxxx
will need their own implementation entirely.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  3 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  4 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  4 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  6 --
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 92 +-----------------
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        |  8 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  | 18 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  8 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 97 ++++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 -
 12 files changed, 134 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index eeaf72f6add3..ef781c4ca11f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -17,6 +17,9 @@ struct nvkm_gsp_mem {
 	dma_addr_t addr;
 };
 
+int nvkm_gsp_mem_ctor(struct nvkm_gsp *, size_t size, struct nvkm_gsp_mem *);
+void nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *);
+
 struct nvkm_gsp_radix3 {
 	struct nvkm_gsp_mem lvl0;
 	struct nvkm_gsp_mem lvl1;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index d7933bfc59fd..8ab02d683c90 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -28,10 +28,6 @@ ad102_gsp = {
 
 	.sig_section = ".fwsignature_ad10x",
 
-	.wpr_heap.os_carveout_size = 20 << 20,
-	.wpr_heap.base_size = 8 << 20,
-	.wpr_heap.min_size = 84 << 20,
-
 	.booter.ctor = ga102_gsp_booter_ctor,
 
 	.dtor = r535_gsp_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 0f8526aa969f..be6bbf06d58b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -148,6 +148,7 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 
 		gsp->rm->device = device;
 		gsp->rm->gpu = fwif->func->rm.gpu;
+		gsp->rm->wpr = fwif->rm->wpr;
 		gsp->rm->api = fwif->rm->api;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 77e3501296c9..a6836a85b2ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -45,9 +45,6 @@ ga100_gsp = {
 
 	.sig_section = ".fwsignature_ga100",
 
-	.wpr_heap.base_size = 8 << 20,
-	.wpr_heap.min_size = 64 << 20,
-
 	.booter.ctor = tu102_gsp_booter_ctor,
 
 	.dtor = r535_gsp_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 709a046d86bf..202b5bdc3980 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -156,10 +156,6 @@ ga102_gsp_r535 = {
 
 	.sig_section = ".fwsignature_ga10x",
 
-	.wpr_heap.os_carveout_size = 20 << 20,
-	.wpr_heap.base_size = 8 << 20,
-	.wpr_heap.min_size = 84 << 20,
-
 	.booter.ctor = ga102_gsp_booter_ctor,
 
 	.dtor = r535_gsp_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index de274f6426c1..d42ae235d2f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -36,12 +36,6 @@ struct nvkm_gsp_func {
 
 	char *sig_section;
 
-	struct {
-		u32 os_carveout_size;
-		u32 base_size;
-		u64 min_size;
-	} wpr_heap;
-
 	struct {
 		int (*ctor)(struct nvkm_gsp *, const char *name, const struct firmware *,
 			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 8ca0f99ccbac..ec69fdb9492a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -231,7 +231,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static void
+void
 nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
 {
 	if (mem->data) {
@@ -260,7 +260,7 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
  * so we take a device reference to ensure its lifetime. The reference is
  * dropped in the destructor.
  */
-static int
+int
 nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
 {
 	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
@@ -1129,55 +1129,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
-static int
-r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
-{
-	GspFwWprMeta *meta;
-	int ret;
-
-	ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->wpr_meta);
-	if (ret)
-		return ret;
-
-	meta = gsp->wpr_meta.data;
-
-	meta->magic = GSP_FW_WPR_META_MAGIC;
-	meta->revision = GSP_FW_WPR_META_REVISION;
-
-	meta->sysmemAddrOfRadix3Elf = gsp->radix3.lvl0.addr;
-	meta->sizeOfRadix3Elf = gsp->fb.wpr2.elf.size;
-
-	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
-	meta->sizeOfBootloader = gsp->boot.fw.size;
-	meta->bootloaderCodeOffset = gsp->boot.code_offset;
-	meta->bootloaderDataOffset = gsp->boot.data_offset;
-	meta->bootloaderManifestOffset = gsp->boot.manifest_offset;
-
-	meta->sysmemAddrOfSignature = gsp->sig.addr;
-	meta->sizeOfSignature = gsp->sig.size;
-
-	meta->gspFwRsvdStart = gsp->fb.heap.addr;
-	meta->nonWprHeapOffset = gsp->fb.heap.addr;
-	meta->nonWprHeapSize = gsp->fb.heap.size;
-	meta->gspFwWprStart = gsp->fb.wpr2.addr;
-	meta->gspFwHeapOffset = gsp->fb.wpr2.heap.addr;
-	meta->gspFwHeapSize = gsp->fb.wpr2.heap.size;
-	meta->gspFwOffset = gsp->fb.wpr2.elf.addr;
-	meta->bootBinOffset = gsp->fb.wpr2.boot.addr;
-	meta->frtsOffset = gsp->fb.wpr2.frts.addr;
-	meta->frtsSize = gsp->fb.wpr2.frts.size;
-	meta->gspFwWprEnd = ALIGN_DOWN(gsp->fb.bios.vga_workspace.addr, 0x20000);
-	meta->fbSize = gsp->fb.size;
-	meta->vgaWorkspaceOffset = gsp->fb.bios.vga_workspace.addr;
-	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
-	meta->bootCount = 0;
-	meta->partitionRpcAddr = 0;
-	meta->partitionRpcRequestOffset = 0;
-	meta->partitionRpcReplyOffset = 0;
-	meta->verified = 0;
-	return 0;
-}
-
 static int
 r535_gsp_shared_init(struct nvkm_gsp *gsp)
 {
@@ -2179,49 +2130,10 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	/* Release FW images - we've copied them to DMA buffers now. */
 	nvkm_gsp_dtor_fws(gsp);
 
-	/* Calculate FB layout. */
-	gsp->fb.wpr2.frts.size = 0x100000;
-	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
-
-	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
-	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size, 0x1000);
-
-	gsp->fb.wpr2.elf.size = gsp->fw.len;
-	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
-
-	{
-		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
-
-		gsp->fb.wpr2.heap.size =
-			gsp->func->wpr_heap.os_carveout_size +
-			gsp->func->wpr_heap.base_size +
-			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
-			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
-
-		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
-	}
-
-	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size, 0x100000);
-	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr, 0x100000);
-
-	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
-	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
-
-	gsp->fb.heap.size = 0x100000;
-	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
-
-	ret = nvkm_gsp_fwsec_frts(gsp);
-	if (WARN_ON(ret))
-		return ret;
-
 	ret = r535_gsp_libos_init(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = r535_gsp_wpr_meta_init(gsp);
-	if (WARN_ON(ret))
-		return ret;
-
 	ret = r535_gsp_rpc_set_system_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
index 085a7dac0405..b6683a5bf870 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
@@ -814,4 +814,12 @@ typedef struct GSP_MSG_QUEUE_ELEMENT
     NvU32 elemCount;                 // Number of message queue elements this message has.
     NV_DECLARE_ALIGNED(rpc_message_header_v rpc, 8);
 } GSP_MSG_QUEUE_ELEMENT;
+
+#define GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2                   (0 << 20)   // No FB heap usage
+#define GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3                  (20 << 20)
+
+#define GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X               (8 << 20)   // Turing thru Ada
+
+#define GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB                (64u)
+#define GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB      (84u)
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 6de7d1a91119..60e8678b7913 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -4,6 +4,22 @@
  */
 #include <rm/rm.h>
 
+#include "nvrm/gsp.h"
+
+static const struct nvkm_rm_wpr
+r535_wpr_libos2 = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB,
+};
+
+static const struct nvkm_rm_wpr
+r535_wpr_libos3 = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+};
+
 static const struct nvkm_rm_api
 r535_api = {
 	.rpc = &r535_rpc,
@@ -20,10 +36,12 @@ r535_api = {
 
 const struct nvkm_rm_impl
 r535_rm_tu102 = {
+	.wpr = &r535_wpr_libos2,
 	.api = &r535_api,
 };
 
 const struct nvkm_rm_impl
 r535_rm_ga102 = {
+	.wpr = &r535_wpr_libos3,
 	.api = &r535_api,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 4d9e5ea3b2fa..1a2fec3935a4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -8,15 +8,23 @@
 #include "handles.h"
 
 struct nvkm_rm_impl {
+	const struct nvkm_rm_wpr *wpr;
 	const struct nvkm_rm_api *api;
 };
 
 struct nvkm_rm {
 	struct nvkm_device *device;
 	const struct nvkm_rm_gpu *gpu;
+	const struct nvkm_rm_wpr *wpr;
 	const struct nvkm_rm_api *api;
 };
 
+struct nvkm_rm_wpr {
+	u32 os_carveout_size;
+	u32 base_size;
+	u64 heap_size_min;
+};
+
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index fef9c4444017..a07f59e5ef7a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -24,6 +24,8 @@
 #include <subdev/fb.h>
 #include <engine/sec2.h>
 
+#include <rm/r535/nvrm/gsp.h>
+
 #include <nvfw/flcn.h>
 #include <nvfw/fw.h>
 #include <nvfw/hs.h>
@@ -195,6 +197,69 @@ tu102_gsp_init(struct nvkm_gsp *gsp)
 	return r535_gsp_init(gsp);
 }
 
+static int
+tu102_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta;
+	int ret;
+
+	ret = nvkm_gsp_mem_ctor(gsp, sizeof(*meta), &gsp->wpr_meta);
+	if (ret)
+		return ret;
+
+	meta = gsp->wpr_meta.data;
+
+	meta->magic = GSP_FW_WPR_META_MAGIC;
+	meta->revision = GSP_FW_WPR_META_REVISION;
+
+	meta->sysmemAddrOfRadix3Elf = gsp->radix3.lvl0.addr;
+	meta->sizeOfRadix3Elf = gsp->fb.wpr2.elf.size;
+
+	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
+	meta->sizeOfBootloader = gsp->boot.fw.size;
+	meta->bootloaderCodeOffset = gsp->boot.code_offset;
+	meta->bootloaderDataOffset = gsp->boot.data_offset;
+	meta->bootloaderManifestOffset = gsp->boot.manifest_offset;
+
+	meta->sysmemAddrOfSignature = gsp->sig.addr;
+	meta->sizeOfSignature = gsp->sig.size;
+
+	meta->gspFwRsvdStart = gsp->fb.heap.addr;
+	meta->nonWprHeapOffset = gsp->fb.heap.addr;
+	meta->nonWprHeapSize = gsp->fb.heap.size;
+	meta->gspFwWprStart = gsp->fb.wpr2.addr;
+	meta->gspFwHeapOffset = gsp->fb.wpr2.heap.addr;
+	meta->gspFwHeapSize = gsp->fb.wpr2.heap.size;
+	meta->gspFwOffset = gsp->fb.wpr2.elf.addr;
+	meta->bootBinOffset = gsp->fb.wpr2.boot.addr;
+	meta->frtsOffset = gsp->fb.wpr2.frts.addr;
+	meta->frtsSize = gsp->fb.wpr2.frts.size;
+	meta->gspFwWprEnd = ALIGN_DOWN(gsp->fb.bios.vga_workspace.addr, 0x20000);
+	meta->fbSize = gsp->fb.size;
+	meta->vgaWorkspaceOffset = gsp->fb.bios.vga_workspace.addr;
+	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
+	meta->bootCount = 0;
+	meta->partitionRpcAddr = 0;
+	meta->partitionRpcRequestOffset = 0;
+	meta->partitionRpcReplyOffset = 0;
+	meta->verified = 0;
+	return 0;
+}
+
+static u64
+tu102_gsp_wpr_heap_size(struct nvkm_gsp *gsp)
+{
+	u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
+	u64 heap_size;
+
+	heap_size = gsp->rm->wpr->os_carveout_size +
+		    gsp->rm->wpr->base_size +
+		    ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
+		    ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
+
+	return max(heap_size, gsp->rm->wpr->heap_size_min);
+}
+
 static u64
 tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 {
@@ -241,6 +306,35 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
+	/* Calculate FB layout. */
+	gsp->fb.wpr2.frts.size = 0x100000;
+	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
+
+	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
+	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size, 0x1000);
+
+	gsp->fb.wpr2.elf.size = gsp->fw.len;
+	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
+
+	gsp->fb.wpr2.heap.size = tu102_gsp_wpr_heap_size(gsp);
+
+	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size, 0x100000);
+	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr, 0x100000);
+
+	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
+	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
+
+	gsp->fb.heap.size = 0x100000;
+	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
+
+	ret = tu102_gsp_wpr_meta_init(gsp);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_fwsec_frts(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
 	/* Reset GSP into RISC-V mode. */
 	ret = gsp->func->reset(gsp);
 	if (ret)
@@ -274,9 +368,6 @@ tu102_gsp = {
 
 	.sig_section = ".fwsignature_tu10x",
 
-	.wpr_heap.base_size = 8 << 20,
-	.wpr_heap.min_size = 64 << 20,
-
 	.booter.ctor = tu102_gsp_booter_ctor,
 
 	.dtor = r535_gsp_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 5f279813626f..9e897bdcb647 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -28,9 +28,6 @@ tu116_gsp = {
 
 	.sig_section = ".fwsignature_tu11x",
 
-	.wpr_heap.base_size = 8 << 20,
-	.wpr_heap.min_size = 64 << 20,
-
 	.booter.ctor = tu102_gsp_booter_ctor,
 
 	.dtor = r535_gsp_dtor,
-- 
2.49.0

