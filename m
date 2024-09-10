Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A467697451E
	for <lists+nouveau@lfdr.de>; Tue, 10 Sep 2024 23:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C46610E92E;
	Tue, 10 Sep 2024 21:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="utCOh400";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4110E92E
 for <nouveau@lists.freedesktop.org>; Tue, 10 Sep 2024 21:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYizNQL+FJxa6GTZY823CbIMOhOSXpvWLXXKdXOpj5oo+kUj2tJn7JKDlK9TzvfTkIdbECXyPVZMzwXp0IcIn3IrHYQ+cnhw/pSBtmBVO3RDaUg029NAJe+nE4qZFhZXNwOws8/+/K95bb/QYhkgCCSc8xK3jsKYdTnuVZvNwFkpMPHCHfwOXeWF4Xx9nM/gNW45B4P9vmAVT6Z8VBF8seZRRL+vBoa16Lb510ACIciO8SCYd9LrgfpnpW8+5mCFI7PY02mHPh3fn0D2ww9GvwB9DkXlosqUQTSwacfI/t0qh3LggZFJ+6lQYUi97UfqYSpwy2bW9CSyqvPPZp0JLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB0krWy7bJ5U8ICWHeq/GmXsIwtx3wFjOrb/1blDDFM=;
 b=CVN6ZI0bF7U/QmN7pr5Tng4uK4yBq5p9aLnJVckyfgacgWVgfcLZdKoizb52CQfUEBB5pKDa0DQM79AAYlwA7j9L7EdFC5fi+EFU2fVdbpRzXEkoJitxX1dEv6bUiXhQ+I31aDnhwGHquLxix/xgs7LuGIVLYDTadnBI8vpcrCsSnEIryVNUUv9om6P3dNxiRrmqTNoYCk6M+z5WJ6KmmhTkZNk9OAvxxSxY51ohaOdn1UIhJKPV9lIhH37zr+rE0gk3uyf2liOdboo7lzD93majzRQDnIvDLxoFtiM1niUpPzypyQx/PnpdmWmoSdOrkRqpQvd4RVpCeEYGjbN1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB0krWy7bJ5U8ICWHeq/GmXsIwtx3wFjOrb/1blDDFM=;
 b=utCOh400erkB9+iofbccoV/8PKxPPTTrtcYw8An9SSjHDXE7q+JbPFPsZP5AtMdxEKVKQooasj8z4UbNpVl5U60JUHLVoVPnnss9oNc5wFRh/oARKN3KQ7cHUIiFZH9WrOZGmKijA/slRBEIWY0O/BLJzGug9yl3InBNoo7jH9T5RRy8s623F19K63ice9bX7qVT4R7VndvrNGXhVCoOiqOJJTvxb3SmcMXzdwxfl8CuPxH2snQXGX5JXSuGqLzsCXeeg6TC/b/Qiioo/MP6a6bAXXz2tbep6usoeT0jel1ciz2xWm0KME/10m3zzGSi0HrK1nLSota56ZdenhJDww==
Received: from CY5PR17CA0056.namprd17.prod.outlook.com (2603:10b6:930:12::10)
 by SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 21:56:35 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::cc) by CY5PR17CA0056.outlook.office365.com
 (2603:10b6:930:12::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 21:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 21:56:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 14:56:25 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 14:56:24 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in nvkm_gsp_mem
 object
Date: Tue, 10 Sep 2024 16:56:15 -0500
Message-ID: <20240910215616.1516679-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ2PR12MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: d39bcf6f-59b8-4db1-32e9-08dcd1e3705d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oyC0ky3LZQmSkkrImyIAxvV4sVay2FcraVgzUptKbbVhZTTq6TGWcBuXXb8o?=
 =?us-ascii?Q?zrEzL9y9kue+vo7BL+5riBJZNZ2OQ1NO0COMUHWmDLBK2D+mqRvmTBdXpTQ0?=
 =?us-ascii?Q?geUCkk6ZtykoSjqsydGnJBCvrh0i843avFD1fzSLRyZN9YhZgCqSJpXuHIYP?=
 =?us-ascii?Q?dM56pM9SgchvkoMk1bdQ2X2N9MZt4Y93f4YoN7v2wIyVSuxnqnX+aBZ9iEV/?=
 =?us-ascii?Q?uOUggQ5+FrfH3og7k5wPLWFXVFVmae8UiJzyFG8YpXeWZFa018Gc/x4y+FgG?=
 =?us-ascii?Q?Q4g3U892FpsAmM4sc18j1X+Gk/G/hHe5VhwwwwOZGVTo8PGxOSTKuTU1XQW5?=
 =?us-ascii?Q?73K/ORoMpMcJr2mzvObQvQZuvMEQyelN+7MaRv4rTCtixmaJ0leoZJJc+xNc?=
 =?us-ascii?Q?R3MPt2u6G8zU4lc44tQj4x/eQDe0QpZNtaz3sQiHAuz+JTwJ7Fr5ml8h6cLo?=
 =?us-ascii?Q?wvrIWPHhG5SwieGo+P5Gjqs1HCS5m5MTvvLbnziu8uEKKFbM1VYV6DzuT6OE?=
 =?us-ascii?Q?YZBf2RK7fG6pcF8m+MAO6WDLLJwmElRPzqUpn3d9kDvHnP8Av3u5HKK+F1FQ?=
 =?us-ascii?Q?x4QB+dhdD2oRyAy/jMRSB+lWsol99jMDf1fATzy+U2eErfVmLhJbG0RabVWD?=
 =?us-ascii?Q?mT5ub9o1O03GKL75AR9lRsCSIe+YW6lishX8lzw3lTP+AT2bdCR/KpcUWe/5?=
 =?us-ascii?Q?QIA4jX75HIu7owXW2IgBGGj0gLt9iy9DecntkOpInVUlX3es+hSyYDcFPejS?=
 =?us-ascii?Q?WuozddzQVpc0WN3HTfCeRLOukHIbjHFOzkP/KVTfnwK13E3IIsNhlRNKSBEk?=
 =?us-ascii?Q?xPQHg/9Od9jQX2OO0dm41vt1g38t3+SK9OKau6D3xgd4ub5lCi7WBBFkYYuH?=
 =?us-ascii?Q?Oe/J3Y6kkCoS235gcsNw3baXV9yR8LY0u/rAOHRCLGnpskshoeV5bEvqX4dY?=
 =?us-ascii?Q?G3MsrhatILTaEvKKoJLmOJSsQCaialaBCBG9NU7a72tu9oN37nWG5yTUoeTS?=
 =?us-ascii?Q?LH23xBUPGPIiRis/495r99Lqp4SWh8wbZcvT6DtcYJ2SC6T1rQsh6taKY4t8?=
 =?us-ascii?Q?PV8GB1wWqRI5blBX1X3hId0g1iBTOpCBvxLPeWWu69yYHsr8xi/fvwopyiUM?=
 =?us-ascii?Q?CWNdojYdsoEY8NAntpIFVD2HnmwL/8SFk/l6013HwEv86KwvRiFK4lKYK69M?=
 =?us-ascii?Q?ly8vwrRWxN2Enjc9sWaIkiyMxzTS1me9IFl3vkBouQlMwRz1Y8cx7uSjSpxc?=
 =?us-ascii?Q?MwlUWzY3uwbsGih+spPS33TKKWpTguL+e6/MrXSgM8H3PFphWBVmcNu099Sr?=
 =?us-ascii?Q?KVElKArfl+X6zWzG1XzKBB/+ZnXH5ZFXB4npHjnIU7cAD0CbPpcRGyedgUXD?=
 =?us-ascii?Q?XFYr7PMY2TTdLdQxVpM2hfHBUz1EevIr3LAb8SJqPtDOnkEB98aiuE3yfju9?=
 =?us-ascii?Q?ATJHdoPKZZqUoY4xriqVqhxUIWaFnR/n?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 21:56:35.2236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d39bcf6f-59b8-4db1-32e9-08dcd1e3705d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7798
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

base-commit: f327bfdbf6c6d7d8e5402795c7c97fb97c2dcf79
prerequisite-patch-id: 6f7d619f67878dea2a3378e76e28d3c666921fbd
-- 
2.34.1

