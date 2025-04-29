Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC2AA3C86
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5D10E56A;
	Tue, 29 Apr 2025 23:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gOxH25oi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76B10E56A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmO0budjdUE4YkS3rYmS9MG5TC1KzdrEdAJaVFEVnqqZ+5165SlQd6WLQOeeRo6f25byXffDofDEGf9R9tb+6mduZF3/MWvgch42CqAFe2EtpMoeRwOEmA61JsrlgBV1fVIW6xmJ9BXB4rZPny5MLe2YQq/neWrmUdEZI4aZm5SiqpMqWIZulK6IKxCN+B6lujDxh7KCcHt4CyVVB16b1h2dPtaxItcOjgmiK6N2Dbwy8nYFxUFp7j6kcwZ8Bh2Rb1bOUB+ZY1HZiC0tmw+81Ydytd0JWjyZGu0yh+R/aliDWRrvsbxLjYBwAv09Gz0TYkJTIlrRZG5SPAZyuSoROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJIM23gayWOGW+YEK5/h/NNKGhyWWh/KPoWTyOnp0KM=;
 b=jknSscO4mfLzFbcLUgBlHBhW9P71ZXH1HpHl+5n9uMfqQCB58xzrfxdYonYyO6TWd71yYSANuDgtczwng9oxX+nmvcrXo+h9wfGz0E9PIxk/fwYV7d5lXDh5GjjfNGUad4WizKkZKkv0BInz4QRTU/ILPmTShtClS2tuz4psB+UFa7pSaTek8nMXSzESXKFz8ig6jTrfg9ni3Doq/sKfC42YVOvTJI0VzhXNOfX2Ns8tOox2/ZYeWPFOCMwX12lFdar1XJG573EfnxAvE5nVnTfIjQedihnSJRlZW0s1NxP7Jn3v8Ze9dUyAAW03pCxJwb3jCdApPS2W6w1TgnXVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJIM23gayWOGW+YEK5/h/NNKGhyWWh/KPoWTyOnp0KM=;
 b=gOxH25oiBcd2KFtBj7/2pI/0DAHsFQar2XJdh2T0LYm4V00txzYK4qQacr5hnGQFgXWfk8nm69VP0yFTIVBjaKZC7fUQBMHzBgYeU5k28kZPgGlmzbH7bgH4aSmcd2xnobWiPlZZxyAUKBq7lWdUUpNSDUqZ0/G7riGhaVWrs/ZS/eR4NNvIxTpg526RphrkqJzNjT8oLlS2uZTa+nt0bs07ZHvzFOyf63V1vFNS41dPbzHszemN1Re8REqDFrYCVp09Cn58gIOKQ53PjDQFvxItrjvVhWeLXxSTE+lBXbndjACwjifIqHSiAhp2A07GFgQDTIbby8wGNm9+przPXw==
Received: from PH0PR07CA0088.namprd07.prod.outlook.com (2603:10b6:510:f::33)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:22 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::a7) by PH0PR07CA0088.outlook.office365.com
 (2603:10b6:510:f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:05 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 21/60] drm/nouveau/gsp: add hal for wpr config info + meta init
Date: Wed, 30 Apr 2025 09:38:49 +1000
Message-ID: <20250429233929.24363-22-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: df2c043d-4b15-4dc8-8e3b-08dd87773523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7rxR66AIw0GTRF8JtEf6XYL57Vh5Xd2L/c2qyGOjqT3Nv4lVk87YZ5zt/dGo?=
 =?us-ascii?Q?pHQ0r3HmzS6I3IN1w0rsHl0Oy7cj7JS+9Ap1zU5L7/6MO2Xj2fRpaolK5NVM?=
 =?us-ascii?Q?JK/ZFpJBLMXeXFUQ7DIAA4fXOOl9YrjP+yODTvdJPOnI2gOonQsu2QqeiVHl?=
 =?us-ascii?Q?vOt3SU47n7j1VW1M7jp5BPZDOeGwd9OtW6WeDAZ78KDzLIO7qkRNxHc+00NX?=
 =?us-ascii?Q?cPB6re6QHVXRc0D0mP2sTEmRTlRdJGTVpd26tTlYenNGB+A+Sro+D+Vmy6q/?=
 =?us-ascii?Q?sgc8LjVkYwBs8io9RLmkqPx+ZjXGuyCKKHcub8LKT3WM4qlrLyevJ0WhaDcQ?=
 =?us-ascii?Q?yHaqpqwPzPu5mPFwa/uZOjq4ruAWhdWa0tlLOGpE3/SQEPJs/gqAY+aTEUa+?=
 =?us-ascii?Q?CGNLTyF0mfC00GY2ygjtlAB9Q1Xgg+TZ27qk0OWuIlVseTP2RPd4TiVEkvxB?=
 =?us-ascii?Q?8NFleEA2UgYwPpLmhj3w7NPWHNPhBrBRmNZb6nYJyBRR/t1cyRvIcQiUuT0S?=
 =?us-ascii?Q?akKpwWxtFG3K/5PtMMzq/q6k752LgQ1zvNzXJLF6s5hLNYTwI+ZBhGNUP5d+?=
 =?us-ascii?Q?p7oNgOK/0mPSydNgQyKhRiG8lO9pqKHq8E+dLTEOIAQATwJx2CrbvyQ94AM5?=
 =?us-ascii?Q?ygk6iM+OJDTOC2ibTC9lHCrvkr9DbmFm5Q6KkmwoPKCbDKxQdiWsAqBqqRax?=
 =?us-ascii?Q?LmZH5jH1ejOLXLnUklhqK0y94YvTBHlhUq17vMsS69S3hncdXJeCU1juuXq7?=
 =?us-ascii?Q?yXOKxeEMOCH8fTNFT1K/KIvZVCtjvg80UX2eKRdGNYweYzp5U8X5mJubKIa3?=
 =?us-ascii?Q?sUNZXVHzuQumc0G+hQQrDf2a7z82H0X9nmMMKCWRF7rD5mGy3e1Y4IIKNaaw?=
 =?us-ascii?Q?cTV2Jgzxxa7mYA2RIkzisTfRPpg3QzUk99kso4cxdhKHhKJtthQT0Os1TDZO?=
 =?us-ascii?Q?CfH7N8+9nJWLBwe2JG1t68EI/GjnnldR25OHzR6Zo9nftp6D4jSNRqzO7q3X?=
 =?us-ascii?Q?lAASin0qsEaEb/J1a0uO98R7ArWfHGMq2xTaF14ZGpFPTr5aFNaahTWXo9f1?=
 =?us-ascii?Q?aTLPfBTYsRNkNlQJEx/AQ0V6oklYMIb8Agu6Bj9r3QJ349W1PRlAVBbueW57?=
 =?us-ascii?Q?kotawmdzhPmz/MzRHrp+DI/jXojQci77xUo/OSnlXh0BshaDd5u3HTW0KE0y?=
 =?us-ascii?Q?bPMSWhwebygZky3Mh+dOmT0qQvJ63YDbECyinFAd06NrcPPhDeuDSoB/pDKU?=
 =?us-ascii?Q?RH7Z4WzQgzkVtCGXJmWvXb43wdjUOCjDB7NoN4CLPXfazgq/q7ozIqpJPoIF?=
 =?us-ascii?Q?Wgyg++UBKbqKsHA6eExDnsCPL3PTrqUeqwpGWkZ6tgRaUPsst609MEDetIOa?=
 =?us-ascii?Q?6BBDw+CoO4Bu4DSLgx2+uQfMx3KRQu/rZXTAEwXh1u4Ws5nk2HKNjjuAcGrE?=
 =?us-ascii?Q?ph49W8wef9v3tloE8tqa125ajsBCPshkkxgC5yB4tIFMRN20uWcGNohAAoWF?=
 =?us-ascii?Q?GvLHsDVFP8XFpenZxh/fUr/rRxwNMNyJASED?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:21.7557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2c043d-4b15-4dc8-8e3b-08dd87773523
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773
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
index 41d77fa0f7ba..6a63abd2af79 100644
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
index 195dd35393d9..bf8fc82b0360 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -232,7 +232,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static void
+void
 nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
 {
 	if (mem->data) {
@@ -261,7 +261,7 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
  * so we take a device reference to ensure its lifetime. The reference is
  * dropped in the destructor.
  */
-static int
+int
 nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
 {
 	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
@@ -1134,55 +1134,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
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
@@ -2184,49 +2135,10 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
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
index e61775c8237f..3355b8be0ee3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -21,6 +21,22 @@
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
@@ -37,10 +53,12 @@ r535_api = {
 
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
index bda22703690a..e2bfcfc611fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -7,15 +7,23 @@
 #define __NVKM_RM_H__
 
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

