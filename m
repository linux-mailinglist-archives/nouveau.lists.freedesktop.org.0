Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E149B6DAF
	for <lists+nouveau@lfdr.de>; Wed, 30 Oct 2024 21:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5439710E0E3;
	Wed, 30 Oct 2024 20:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FFjVf062";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4610E80B
 for <nouveau@lists.freedesktop.org>; Wed, 30 Oct 2024 20:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIo7V0UMHLPC5wBNUq0MWgIo3WjjCvgiv24HacVk/rxK+20t8rCMaT6mBspz9iYCz4H5LHlZk73JCK4m+1MYSmMEPxkDXH8ZfW8V4/ikadTl0qQq5uGrnY8y+qKYPWHctzMdrw4qLcmdoa1Gi7Db7FCdhP7Lwcyj+5gWFEIonmG7DaEFfIDZBZ0SgTAIHSyxQIRDI/VFl0Fpym7nHfh6e5NIUKKIbmcdRUkXrH5DECwEzVdYlfcmVAFUS4mvScF6wfxopdPNNqd2nkie/+Qw7Em+GbCRjVFhLchb5MfCm6i2rfBMfkl/+JUqyUjJRZGUJNd4Rem12uzvzWNmlYULaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvhcYubYY/RQyyZyjduWBKD8DTtxKgWUttC9Tvc2+Ug=;
 b=iJhor26j0AqNuHiYTDWBPquHpDHIr2BJfQ8qL+1TvVBybbXhUaP/Sm2XCGthgeNiVGpQvz+cyMx/uWlCB2aB60QqRHgdKXnvmQ03ooN6B4Opuni8DEeg/7/eLZ9EhQskyrfrxqbXBeH0lg8CeNpZNMoY2XckAG9IdQ00WCKXJiIlqi8UMeVhBkfgQvtbWc413JrhK4HlSfIgAjUV7mIW8h24Npm/v6dKAqqY0/FvljwWSiiJ6yEMwgnCfUzYEC3OX77883oR73MveTM03t3sKtlROKqoV8XBYK8JZWPrV/ODdl7nLNdX1wOOCGGIZxJHbiqJoq5gisQEx7Wwa1c04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvhcYubYY/RQyyZyjduWBKD8DTtxKgWUttC9Tvc2+Ug=;
 b=FFjVf062lCfFCAHhkZez1n7zv8g87fpqjM46etjFKhglnt/7UNjF5y7yeFvgJF0ggSSU0vd6hYm6PhuXCJNLNiCpt3udWvJsk1HEIkj9dI1gqAoy8Jl8SkHpWARHO64KCgRJEnA/bG4DseDl/CBljelKd+dJHgJEYuFOh0yBK3zLwqwveLZSoVEFG0QO96MQvMbriJTz1wFc6aTVjAHxaE7PSksEtFkfu6ZmEbZCPm3PEWQqaowstDh5SIuv0pW07z0mZPjCXlD5c/r2sDjJML+cy7xrvaSrAtsC9cyAK2VoT/aoO6HA3Pn95Vqtyfkwl0d8HB6sQRQxMQqdo9l0QQ==
Received: from MW2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:907::32) by
 SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Wed, 30 Oct 2024 20:30:21 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::6c) by MW2PR16CA0019.outlook.office365.com
 (2603:10b6:907::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Wed, 30 Oct 2024 20:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 20:30:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 13:30:05 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 13:30:04 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, <bskeggs@nvidia.com>, Dave Airlie
 <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in nvkm_gsp_mem
 object
Date: Wed, 30 Oct 2024 15:29:51 -0500
Message-ID: <20241030202952.694055-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7cefa2-c0b4-4de3-3675-08dcf921ace4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CGxZ/azHTHNXLesuwd7nk5nAGiySvZmR7aEn1Jboe4Z1iXRDGIrev7qH0v50?=
 =?us-ascii?Q?bOCF+6LZXhm4MLT+87rvcsd7byLW6P0S/T265kuGVnyhVoNNv1NZGAvwI3QQ?=
 =?us-ascii?Q?6nfzt1BiOxnjlZUMt1UmYJARFxIplAvgTlAcX3OyMOmn/C5Md0+tHhZLmXb6?=
 =?us-ascii?Q?NC/t0kUj1d0GlwZQKqWMjEL9amw8Nm4pjPmWkt3zaa5UQcJT3x5KSwG63T8A?=
 =?us-ascii?Q?RX/T1QmELjUr/mimF6OcgOM4g0GIi3zkaQfCwAohBv1uFphtUWPn7hwTgjYg?=
 =?us-ascii?Q?sFEqPwJc2qX7K5uJioxq3p0gSEwT/2QVK6nCnk7bWtBC05iwoENKpoSrnhPn?=
 =?us-ascii?Q?b27EEHeywpmLM5AIEBt33itUtJ1efLDRjBw3Y0KGOR/4UcrIOE1WanIRzZTY?=
 =?us-ascii?Q?2p2om6wbbsVtGrpmzNwwS8g9ksHgC9EvS/dEaC9nus5JxOJGA9oS0jWUdS3n?=
 =?us-ascii?Q?Om8cTGT/TcqpQQV0XLBnvzGPDehBfpR+H3ZakPY9Nx/bXebo0FsYg5D5qR4H?=
 =?us-ascii?Q?lJxXg91lbfy/CtqMv5M9lF30rRoLDESKnshfBQE1gzHNjt7TQIuyRdXbm5Tv?=
 =?us-ascii?Q?IYmhY39Hntivemk+VsoKM72bA51idpozYYPYJ+a3L84V1FXbs2vHbsT92c1I?=
 =?us-ascii?Q?VQdPQGUvhwBfQx3ITds5Ygw4taszmpSFlQr+TmlIqR1C1do3Vtico2L90OeR?=
 =?us-ascii?Q?JUJC9R4TRJawwZh94fpESuJogEXRmEU/fAfGqfYaVvpWUUQtANVhVyTSFUSK?=
 =?us-ascii?Q?7QixazZsdV8k6iSHBshx5oAR6L3iIeNK5Bc2RDg+kJivQP2f6Jq2dZA9qWOv?=
 =?us-ascii?Q?lsuEpLYNy2Q9fla+stXpv6PpNz7CstW4M3VyOs08ISsh26g21JzfsyfbFcFA?=
 =?us-ascii?Q?nTReH55axx2CiRlpg2jLOePrDGOPV4YnyrzdYxRMw+JF7HmN/1fokQDAAIBR?=
 =?us-ascii?Q?mVdrdE1+5+mZyclF/nStQp1pbBpY72glTRyGptka5LM/JWA+ujin0z1GLU8y?=
 =?us-ascii?Q?o0cbW2cDy2St5VAdpSTRlxuQkaGg2dQcTB8LlXP03cqBmsXQHyu8842mzER7?=
 =?us-ascii?Q?kEeTtvQtGzHtxLSqcmUdld2J61tDt0IEnff0HzAJiUDogZrseKeEn3VpK9H3?=
 =?us-ascii?Q?6dwZidQIY+WDZ8P77gycQvmv4zWmLxhL1DG8G21hHAWk+4nbRsB4EvuyDGYl?=
 =?us-ascii?Q?z37l0P5qDjYg7bTZKdH+Y5lyXl7g8kJLQQPTVZB8L9w/s1bXeJP+92RCM1DN?=
 =?us-ascii?Q?h9sMHvhU3Fv26MBdCTFJctBqoKwHrmOKOJDpVNEok8oZCY4XHU3C8iwCQo8c?=
 =?us-ascii?Q?moS283yGChhEcbWPq08VZJyKCezhkwdXvUbkao2l5e3KrYtD6LXLgNvRiYsd?=
 =?us-ascii?Q?8FVHRJaOGnlBcyVluNDPlK4eDswBoua9kMNkheQs9doC8Psm4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 20:30:20.8392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7cefa2-c0b4-4de3-3675-08dcf921ace4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767
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

base-commit: 904bc5479896d8da7dcd3e162ce224c32c3dc6c3
prerequisite-patch-id: 6f7d619f67878dea2a3378e76e28d3c666921fbd
-- 
2.34.1

