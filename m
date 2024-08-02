Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BC94638C
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2024 21:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987F810E06A;
	Fri,  2 Aug 2024 19:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XIfofEtn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2547510E06A
 for <nouveau@lists.freedesktop.org>; Fri,  2 Aug 2024 19:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2bAM0TNQCVbmJn56L+2+2yEv14sl0++SV6VHHjvOMGVjuBAcGgb5BHsxd+TMWc1fs7tyK3yqDq1LdrQTSB8OswmvF3kLkFugtyGHfqRBJefio070vltYzu6/3rCjjWvqdTOH8qW8MPH8d/Ju0vOm8EKhrIrqFOdER91ajf9NOHc+HJKprc1Grpshpzo1jhzu7CfkIEZqD5Tv2B7a1bLrdKTK3rTP1H6nv2tPCd3JjGESZasrxM0QhKOcZG6cQp3+pi0cwgyYPbWUcmi60L7ins0j1/Rk/NqCJQZ2NKSfpzp/nVCEzRiojSvITppSueZ5I0N0GhS9IkxFX4HgJiICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ7GZyR66q8qKE5UCdfUVjrNgJ9QYLIfnHjAtujx5z0=;
 b=mEpjTg7ZUBQULfSZruGWm7VpoAf8jWhJDgUIqVb5IjPu5nLNXMMdjaAyy7XinvTkdBINGekDRhRF7TdyrWHCBLbM/Aia/ZqN0dBP2ZYvXkh5IKsbCBIhEtiVLyBu9nW5WoSXzzHbHPlH9rCwS3b2DGvxWWVeOSsGUTvv2Oq+9vx/6IGKRNqqxDu0hVUgHKvXyGyHjpm9l3SmaxsAq33i6Vev7zI5APRreOJGX9f4JxVNmHmxbKxNbcPrIpf21ZDI9eXe4HT+4Y6xS3NfRI8e07IdA4H8TNm5US1wpIG/5zQ360CF6NdwXxsih+mxRgbnTgoMRLU69p7cTOdVzOX1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ7GZyR66q8qKE5UCdfUVjrNgJ9QYLIfnHjAtujx5z0=;
 b=XIfofEtn1uHLOKVJ8QdEbR1IEM+6vyNRtgfXg4zE06H+x0CzRDlKcErEUAegjorHR/hxAQhOilB1L78UYdegsTnv/Hgj16jMQZ67AdixAoMsxuCMi9t15s2JQOo8//reo+ywEj3KkR9uF+MjUs9wgwT8d1c7LqkL7Le/0kmoO+k5uP99hkJbxaDavWURFM8mvUs17fk5orpsylsrg3iXlLXCQftU843Ig0PxiuJ7hGUX7fUnJhCDsc528/wAThOXgr2/ya0+1ippxVV45k1y5+Fwd0ijWPcxBc4MRipPfVitWm4QvU4PDnBuY5RE8wEqkyS8x32LvVqG6UJXYVOGqg==
Received: from MW4PR04CA0212.namprd04.prod.outlook.com (2603:10b6:303:87::7)
 by CH3PR12MB9026.namprd12.prod.outlook.com (2603:10b6:610:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 19:05:46 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::77) by MW4PR04CA0212.outlook.office365.com
 (2603:10b6:303:87::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 19:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 19:05:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 Aug 2024
 12:05:30 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 Aug 2024
 12:05:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in nvkm_gsp_mem
 object
Date: Fri, 2 Aug 2024 14:05:16 -0500
Message-ID: <20240802190517.2548654-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|CH3PR12MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: f62756dc-9981-4150-1dfc-08dcb3261d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H18bLJUdC4D+c0ifboI8lWdXpeVhGCrRGcmIpifG3QfIpPgbMBFvadRq2sKO?=
 =?us-ascii?Q?WBACg79sh43kjPwL3/u6sI72SUeXLZW4U7DGkcwerjY8RJXKwQtloSU8CebH?=
 =?us-ascii?Q?KcDAlaS+OEf+y5qbefbs45wYYy9dEnMoWBWtBg59bWVnxyyRuy1Kpfq/Jf9L?=
 =?us-ascii?Q?RfjoE1YzU2FJZTp3o/IpjwquiUHAZOzDzbEjqdEALokhIxwr9gIRU55g/XjS?=
 =?us-ascii?Q?8sxG+khtuJbeAzXrWUvyZks9AVAy9FFP2cANcBHs7unCOnlHFr2ZD4Dhm+mT?=
 =?us-ascii?Q?+fSy4vlcc/181phCpe6L/LLR99mCbytdwhCc7I4hxC/q/SKCqF2KP5oZa4pj?=
 =?us-ascii?Q?i/A9pVTLA+9wsu+1Sr2Lf/S0/0BVQJB5MNdAtedz+ycPPTEVi6o2QibJxg5N?=
 =?us-ascii?Q?F+d7f9280WVtnU6DNQViz1s/W9Y/HGyb8X6Hr0LJUilUh/dvkMOkOtiUpBZY?=
 =?us-ascii?Q?vARTkgEz1Qf2VIu/a+zK7nl2hq66My40hwkCdDSvpC+HIgJ6/chu6+rusnsn?=
 =?us-ascii?Q?7/7mT2osW325aE65XCXgMEgmpoDBWBzVFN0klm3VyuBBJizniDq9Htstfq0x?=
 =?us-ascii?Q?d22gNHEHXVqxOSRWv/0tOFk5obQ9tvmzxpJZmM9G9bvS1wQvtpKZvIxjlYA5?=
 =?us-ascii?Q?FozZ1tgPYwqRva4+wVL9FX78Y3/FqS/8dAbA7VNruhSt3MuDduQwX+6lMK+V?=
 =?us-ascii?Q?+gxrJKgY2U4zwy9KswyABeRxnV5auzfUOSEDwLIur49O5k9ZXkmHDe7v6Ddt?=
 =?us-ascii?Q?WJ0F/im/hxtmK5O2lLvDgQNLcOeUUy87em+LjyQ2Y8RPqEEG9K9UqVSUVFzK?=
 =?us-ascii?Q?Ef9OQF50S6IV8QOm6YlUC9hnAKzHY8ltevsGhTN4APxdYgHHfZlKVJ8y3iAN?=
 =?us-ascii?Q?9wfPmMf9Nuc8BXjxCE4iWNUZCrBOM7f2y3W2ybcFQefswznSLFASF/Carze0?=
 =?us-ascii?Q?FC3hiV9dsYw1Ahl0joVC19n9oJ/64/eOFMJgPF2N721n8CQrcWL3kkgiVw47?=
 =?us-ascii?Q?S+lcA668Ta/Bw2lqQuZbJIWPWMjMlGKg0Qly23jfIrIgbm8wZK7VADxxtBMI?=
 =?us-ascii?Q?aszp6xWn6kduJon3iSoV1pb3JRI7S6U7+lH0cPDLYQQ+F9cd2SxJiiDwNsmn?=
 =?us-ascii?Q?u3I6aOPVGr4hY87kgO5LpHKNYrtt0r92MAqmzrssDNN61BrLoNmHPwm+zWxp?=
 =?us-ascii?Q?O0yqpkZDv65oM1ejaTbNFe3YZMW/OPhR9Yks0tBZS2T8iKQnKqzk2VkdFNLC?=
 =?us-ascii?Q?EFmAecpps2A/S+THYHUVS2O+r3f2qXCjE4RbTyznv/1p9K03K2AqQcQMkYcM?=
 =?us-ascii?Q?3f26lwVL520R9p2cYPoM0MfJGq7+FY+Ld4wkaO0hSKvHy/R9avwm9RgDqZnW?=
 =?us-ascii?Q?Xv6PMljuj7s8mJppmfnFN8hLieK5vg1Apyz8sdtks+Vb2AhX0nUh45sotA7g?=
 =?us-ascii?Q?HvRJKU+2RQ4f/bkgmYbutpFR3jyxiVGw?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 19:05:46.1681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62756dc-9981-4150-1dfc-08dcb3261d63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
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

Store the struct device pointer used to allocate the DMA buffer in
the nvkm_gsp_mem object.  This allows nvkm_gsp_mem_dtor() to release
the buffer without needing the nvkm_gsp.  This is needed so that
we can retain DMA buffers even after the nvkm_gsp object is deleted.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---

Notes:
    v2:
    added get/put_device calls

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 50 ++++++++++++-------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 9e6f39912368..a45a4ad843b9 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -9,6 +9,7 @@
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
 struct nvkm_gsp_mem {
+	struct device *dev;
 	size_t size;
 	void *data;
 	dma_addr_t addr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index cf58f9da9139..86450b0cd605 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1000,7 +1000,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 }
 
 static void
-nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
+nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
 {
 	if (mem->data) {
 		/*
@@ -1009,19 +1009,35 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
 		 */
 		memset(mem->data, 0xFF, mem->size);
 
-		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
+		dma_free_coherent(mem->dev, mem->size, mem->data, mem->addr);
+		put_device(mem->dev);
+
 		memset(mem, 0, sizeof(*mem));
 	}
 }
 
+/**
+ * nvkm_gsp_mem_ctor - constructor for nvkm_gsp_mem objects
+ * @gsp: gsp pointer
+ * @size: number of bytes to allocate
+ * @mem: nvkm_gsp_mem object to initialize
+ *
+ * Allocates a block of memory for use with GSP.
+ *
+ * This memory block can potentially out-live the driver's remove() callback,
+ * so we take a device reference to ensure its lifetime. The reference is
+ * dropped in the destructor.
+ */
 static int
 nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
 {
-	mem->size = size;
 	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
 	if (WARN_ON(!mem->data))
 		return -ENOMEM;
 
+	mem->size = size;
+	mem->dev = get_device(gsp->subdev.device->dev);
+
 	return 0;
 }
 
@@ -1054,8 +1070,8 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 	nvkm_wr32(device, 0x110004, 0x00000040);
 
 	/* Release the DMA buffers that were needed only for boot and init */
-	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
-	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
+	nvkm_gsp_mem_dtor(&gsp->boot.fw);
+	nvkm_gsp_mem_dtor(&gsp->libos);
 
 	return ret;
 }
@@ -2234,8 +2250,8 @@ static void
 nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 {
 	nvkm_gsp_sg_free(gsp->subdev.device, &rx3->lvl2);
-	nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
-	nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
+	nvkm_gsp_mem_dtor(&rx3->lvl1);
+	nvkm_gsp_mem_dtor(&rx3->lvl0);
 }
 
 /**
@@ -2323,9 +2339,9 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 
 	if (ret) {
 lvl2_fail:
-		nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
+		nvkm_gsp_mem_dtor(&rx3->lvl1);
 lvl1_fail:
-		nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
+		nvkm_gsp_mem_dtor(&rx3->lvl0);
 	}
 
 	return ret;
@@ -2417,7 +2433,7 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
-		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
+		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
 		return ret;
@@ -2498,7 +2514,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->client_id.mutex);
 
 	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
-	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
+	nvkm_gsp_mem_dtor(&gsp->sig);
 	nvkm_firmware_dtor(&gsp->fw);
 
 	nvkm_falcon_fw_dtor(&gsp->booter.unload);
@@ -2509,12 +2525,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 
 	r535_gsp_dtor_fws(gsp);
 
-	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
-	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
-	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
-	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+	nvkm_gsp_mem_dtor(&gsp->rmargs);
+	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
+	nvkm_gsp_mem_dtor(&gsp->shm.mem);
+	nvkm_gsp_mem_dtor(&gsp->loginit);
+	nvkm_gsp_mem_dtor(&gsp->logintr);
+	nvkm_gsp_mem_dtor(&gsp->logrm);
 }
 
 int

base-commit: 21e97d3ca814ea59d5ddb6a734125bd006b66a60
prerequisite-patch-id: 6f7d619f67878dea2a3378e76e28d3c666921fbd
-- 
2.34.1

