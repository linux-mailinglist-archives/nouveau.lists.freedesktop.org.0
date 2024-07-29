Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770E8940184
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2024 01:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E110E135;
	Mon, 29 Jul 2024 23:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bIwqvDBy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0210E135
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 23:07:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILhooycRRYTEW/JWk8hhUtxCclbPr9hDC/cGH+fNsD8h2gKDnGNX+hMFtWvBEJDZrpUPF50j4TxKvnI0e4Mc4ioIMlYlrVNsrT922J2tIfhIgVpL+hSlhJTlYVB3tE7FOGkXFqB0giFyd1kFlDVdDHOSWP2TNK/l2bA22DCU0ebY3ztbByFl4vXB4u534+p+9o7XipBlbF8htJXPPQ+o6Hj5DSNnGB82VPORAl8QGkJwcWfh2ix/ihC67C7mcXam+iZF54LHIEyoOIPzPZbMTN5l4cXGaDme0qTLWVq5tIwHU3D6SJWZsmfQYtWAt0LNlcpFCrhITu3JNyI1h82riA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+nJv/mQ+UGFkd29xUGI68VPOrRZScMLhh9mJad1Grk=;
 b=SUQOEsnDz7VRlgifY7Dwul7OSvzpQrUqHAwD/AJhe6ugkiNuC9cw3RuSpnjI1h9ESW1pQxbn/M81ZQWPJKjyRLQDUPIbQeZbng+s+pnYZXxwZ9t6nKELDjIhSTRmklFRKGxp2XHbjOJgUgMV2BNYXK3tnlf9qjFNhYuyhJtDbaxUmmtB2UJQq2l2iz9AmgLkrEIycGhC5tUPBtHwx9D5vIe91h2i3wwDWY4lL7H2Et15KviV2ZCGVQb5pRPGU46bd7QBbN/X0ju7iNhHxzctLpkq5sNGseOFvn/fen8Zz0i7RdOFwXbGO46MLIReFCp1CRSHBvsqpFroHE3x4+pEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+nJv/mQ+UGFkd29xUGI68VPOrRZScMLhh9mJad1Grk=;
 b=bIwqvDByTYUeYZXAbOBICKpKPCwF/D05mL/vbSv72JZXAZuyFvXlhjBTLeN4Owky3BHQ/ELGuuFvmdQaBzvSnwLUOp6TELmJlw8aPICxACwC5VHMoNNVKmYaY4PWfM1DSi0DurY6SHb9tI/4wpicVEccmlJz3SOHHZKOLWVAE+wKgiiL2XQTifRdS1kmd2jRtM4ENUPIS6bRgsaCTHST/SCKOrBBPel51IXF6b+gPKmy15iBpdSbOMtnsBTK+FYtFs6Xewd67JK8AbGJgMrK6a/Xj9DHQsBs9JuHe/hPDV7/4mQ1LP0ar1J/jASxgozRPnUJr3OnlL14QTFTLVUZbQ==
Received: from CH2PR18CA0028.namprd18.prod.outlook.com (2603:10b6:610:4f::38)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 23:07:45 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::94) by CH2PR18CA0028.outlook.office365.com
 (2603:10b6:610:4f::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Mon, 29 Jul 2024 23:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 23:07:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Jul
 2024 16:07:30 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Jul
 2024 16:07:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in nvkm_gsp_mem
 object
Date: Mon, 29 Jul 2024 18:07:19 -0500
Message-ID: <20240729230720.1305760-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: f7892569-d11d-4c40-e8c4-08dcb02341d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zHKLIuvxJS2APjK9G75IcANF4ZX9Y5IKrdv/cpCW6fSDuzTmN3jgQX8shR/E?=
 =?us-ascii?Q?QAtpM9RaqOM8k85+v+R0XY8Xk58Kz1QVaQ5cWoHKAeJbgrHpPExgemzK/DQZ?=
 =?us-ascii?Q?Yq7+HHXT4UnGeE9czCosGCfHsaH/XY6QPnEJigH3NOqV66/ZEtCVLQvmNTuW?=
 =?us-ascii?Q?0l6hcImiidn//rKO/EO8NRjR1S9qTgyexG1Qd8ZD4PERx9uzHU2KzVMcYJU/?=
 =?us-ascii?Q?NWSuM//zZFODuigjvL92b+tdv2PCyZKjBBSrzlIuTGQgEQHkjul5llNbQgdd?=
 =?us-ascii?Q?C4VIe+6j6yvrybT4+lm1iWu4+63T6yZ547mrhRvOuXURnnorEuwiw9xgqkTr?=
 =?us-ascii?Q?h2c9kJbdluwHCx92wH9NR072HuZJIz5VeerxigtShu9+p8ByoTS/8Zz0jQc9?=
 =?us-ascii?Q?gUkwpJqaH64x2oIEhlav4m+kndNS2w/p8GHYSDKxNd61YQKB7e3kuU7uE1NO?=
 =?us-ascii?Q?LSvxMSpAMQ1tbgVkGYBqarkOKZHR0bhwdDLIY5EQxn4hI0vCl1bJ7mcATdNQ?=
 =?us-ascii?Q?3N2p7Yj3rszvrTXgq+4CcdYt/LgEtwyj+OkFpLfEcWjbQlbIP7sGVCmSoa8c?=
 =?us-ascii?Q?Fd3oKNSw6z/o4E9fxvNu07URe3xCCqgcV9/lSL79fuyktxcZryw1rHlUTgJe?=
 =?us-ascii?Q?JKNZDg3qsXx4fbcjHElz9qt1ah8nt4YAtVXD/FfclxmyiNqFms0M+vPvxhT3?=
 =?us-ascii?Q?GG4pjRnVA184Du7jXo2S1Qv0ybzewnkCCjh6ObyHSAwmLP48wtbeuJCis1Nr?=
 =?us-ascii?Q?zurlL5Psy+hjGvxCQSCnzGXcYg+lS4o27uzCwUsprSi/8CyCXuHts/QDGIsq?=
 =?us-ascii?Q?mBGVsFQisa+/yUUBRqRPghnS1bXquAf4EkqMBFGk+Qfl5UwG0hRtjbX2bWml?=
 =?us-ascii?Q?8vBX2Y6auITGTP2Fg2OzK0WicARJSjp7IiXFjd67R+TmUZXahvUnPC4UbBMZ?=
 =?us-ascii?Q?e1QZKJhMWmr+nLXxkw1SDB5/NCVX97Ez+EuujCn3KMlIhCkIxGkGdsr5QKGA?=
 =?us-ascii?Q?nhXvpWdTImSOhYL+3JodyI8tjpgIN9Fpfr0XYXMOM3sbRht8unouy4vNcllc?=
 =?us-ascii?Q?RcGhLAd8SSHZDSyIFRKH+1yXNbHRaBkahlZdvN9LpZpIrsS2rbe+7J+Ym5co?=
 =?us-ascii?Q?3qKYiwTrTBW7WqTmzN6CoYdohMHbM9IQGUqxFFqdVXUhf+LFOy9MoDW7rGXg?=
 =?us-ascii?Q?D7gGo5jrA5CHru9kWBspAa+f764qcMFzHLwhj/OAQ9IaWW5LAje33K2OJUuN?=
 =?us-ascii?Q?h0RzTGZUr6/XGpu7kekOg2vOiPVz2hYGkj/2ysG2TyJ1YgRF5d2I/3SdHFox?=
 =?us-ascii?Q?phWH0KLj+IZI1M0kFo+Ho0HOMZ/3ultDn+pC+HVr1eMg/SsbVuumDLWGxWfC?=
 =?us-ascii?Q?Nxx1zjy2Weqga8dDZmhMadI0FoOwPIeyxUsOBo9ORlxaDIZSe0b4igP2wIuJ?=
 =?us-ascii?Q?BvMOw4DHaYrAkOgmdlQ/iOdgC3xryByx?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 23:07:45.3439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7892569-d11d-4c40-e8c4-08dcb02341d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
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

v2:
added get/put_device calls
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

base-commit: 7214da0ed2220a2b9ad22aa77a5974cdd2a62799
prerequisite-patch-id: 1428f57d0b137672ec09da08e76c5d3069b35432
-- 
2.34.1

