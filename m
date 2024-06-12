Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49696905F72
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2024 01:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EE710E0BF;
	Wed, 12 Jun 2024 23:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d7pZ3WzU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95A310E0BF
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jun 2024 23:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJszYS+mEkW+KpBYSR/fYYlnO1pL9LKidC2b0WcXTzvuCp7W004JQnzQzjWiCkLg8hQ0c/9jU2tavrq4c7JO6klgBTYlMPeYrjaBgsDM+9Hk/Ipww64adFtw9ArmxrbGSJyYN0ebjiXTDg900UOmFAe6MbJLtwV2/nyISmb2Du3KcWTko4qEVa5+k0NoPaopPohMlmmrrs4xAZby026y7Uj0pWlcVCZy3cOd69I7aK/4DGdQjbV6Era/74eJn0AXREZjYfQKwqvAEwsZKK4hTpFHBNO9sB+9I7YTChIxa3WvN/wW+8Le1LHZAgfCHs6dc7mHLaEF7JkJFh7SiUHnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfoWGMkEg566QxcbBHBVIKjdcMZ7xxWeqd0/Lk9oYvc=;
 b=C1IksqhfmSpiC4PtyJCOdQi4cydFYcl1kVanEe5LJSRiP97A2bu58lGn8T6/GKdAh9QxEo+fS66MJombXKQykNKtSIZDRWaxYbw2ZTYu5FR4GqoFkjJgancI1xuBtknaas1CPGlAwuz0N8JRwHrwD186MouqEw7h4LIKETWxJz2ayIAQNrY/QODA3W+kY5C7cjd6l8LC37ofN2TBHOPbco1oTYMkrU1lZ+U+Ltk5yfkPZnyo8W4gp+yP1lrhwRE6rpYFOaA20mAgfsPzPnBQoEGpHmY0qNYFytP5fAvWf+NvAFniWtg4+SED5k+JvH07WbmAOD5BHTjg3lWpVAVeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfoWGMkEg566QxcbBHBVIKjdcMZ7xxWeqd0/Lk9oYvc=;
 b=d7pZ3WzUXK7d3KpjBjPPqyl2rSSFnKgbttlpM36+H+80p17GEf9ND3SXuwlteyOX1VcYQVlU05MLOS6tLltLUi+qYSDHUmdDCLGJYCqFvRVeaXLR/FhFwn2RT1KuKMUQyBoFjh7QkVLUDMZ+5CLb6O+NrkoqeKOdvO3O299wCYzEHri4QNB2btdGEC3Bk4PsHrrW2DvsbsqQpGYShSFntjfplnITZ2lBqZqbXzYP8rWDqBdHhDdinKNWMsBWuijOaKk7YYIqLCF1oeqTqH/J0X296vnxp9BoZeIfOCyfEgW9igM3KlxVxNaY4l9WfhzyfS3cbt5K6Tj9c5ma0XHvjQ==
Received: from SJ0PR05CA0113.namprd05.prod.outlook.com (2603:10b6:a03:334::28)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 23:53:25 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::41) by SJ0PR05CA0113.outlook.office365.com
 (2603:10b6:a03:334::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 23:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 23:53:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 16:53:10 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 16:53:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in nvkm_gsp_mem
 object
Date: Wed, 12 Jun 2024 18:52:52 -0500
Message-ID: <20240612235253.1624004-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a1fb41-98a2-4f31-d66b-08dc8b3ad9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cxTiKWVtf2eL5Ahs36rs5EX0KvuQ02WrO4Kg95738ABw3dO8VqJRwm6NL+cm?=
 =?us-ascii?Q?E27R0zRjaV3ZBUEycRaAVU3S6t73WXPshG9o7Rm/GSNkjTfta+rCQnTAd8/Z?=
 =?us-ascii?Q?5PxuZfj6o7u1Nby4Ad+Dvb0C4kC6GdMFFqnfF8xfRMDFUVtNkiaVdsko4I0G?=
 =?us-ascii?Q?InEwbm9KM6mJKQ2s2fC/H6WwDNJvGtNYscuOacFgKGVuh3Vn9jBbp7R/CXmy?=
 =?us-ascii?Q?d0Pxwz21/Q4eX0MJSiMhFvGJmKbee+fLNSHKvmZKeTgehV3c8R/1eIrHYDu6?=
 =?us-ascii?Q?AQErc66Ft9Cfkx5VYh+ScdffvUscODgM3dUCRn9G2ZV7DmsW6FuvFOxbJzKC?=
 =?us-ascii?Q?TWIcMGWd5MbI5fXnJQZl3E9x6yqVGOD1fHsNO4H+56AY8Gs/aJgQkrpJt3nT?=
 =?us-ascii?Q?xP1kHn95LkPQtxeY8vKgArUrJLYbX+V8KWnHOZLQwRZbHjcjUYBLlXyF2cdD?=
 =?us-ascii?Q?oTjpkGitLTbwzFkE576SruvTx8wdSndmX8UoqKHcvHH5+1FPzRmIDBjjRFx0?=
 =?us-ascii?Q?/nZC92zDeFynMEvEAIKGpjajWouNbHjDGinSQ/+jIRov1/1RO5ULDfV4+J4y?=
 =?us-ascii?Q?a5EbQn9UUavPej02YO8ZlbIWWu++RJHjeIRUO/k7bBzl2kCspEcVtX9KPW8N?=
 =?us-ascii?Q?LRWfXGdFnry9I+nlTLkU6rSJ27rHwhYGERUcK1Ur4x7xigUp1oPULhV9jS5E?=
 =?us-ascii?Q?UqSMUOb/lkmWTJnui9qLjFzJef+vDTEpZD+qh3Gc/oeX1lkKxBzIzbnb+Lcu?=
 =?us-ascii?Q?2om2qSP1u8lKp6Jx4pXyjVQHYhK23sZFPsD8x/qUSiplRucBw6jVPVl3INEV?=
 =?us-ascii?Q?31kGlkKuiSzOhOUtXb+NEzV1hzkIAhcmRiACzFQgxZpGE3mLOw9/s/Oume8p?=
 =?us-ascii?Q?wlRuFqzdspYafaTJH0VO3/JBfcUI1iuz3FCg7dBPtbDn3zXRr5e/s8fw9Aac?=
 =?us-ascii?Q?1qwWSbhERQKteP8sRrcehlNx7idKvE+iEUMx5wQvec4n9uekWrXsB6nRyfGs?=
 =?us-ascii?Q?GwUjLIjdrbYJizF0MLMt2v9NggGg5Wn1CQz3PuoaZM0nn4QB1iFhLbFJHOux?=
 =?us-ascii?Q?Q2NmqmKyt6JCQWTEdHpItT27e9wIUzbMoEIyYLvU2zGnVxpMbnmkpulgeRf7?=
 =?us-ascii?Q?NZ3fzOn7ZTZZFbyczL3Zoj57A17XmBJ4hXmS4Pwf7PsyMZuRpXyiMAKSmDOo?=
 =?us-ascii?Q?YlAvk/lNZ3cRoFVX55uexlYxvV8ta40sjNKVXc5VF9Fu2gPx1eVpXdapuoZW?=
 =?us-ascii?Q?3Qgq1RdoTDRC6thJuBJ5PaY32FY8nH1n/XGknGuu00CBwX81VWY7WIWEsImo?=
 =?us-ascii?Q?d7209xOvf7gQOJUp/EJ3jjUlDIADKKL0CYZmADBlwDmp2zsN+9fgBsx9Ec9P?=
 =?us-ascii?Q?ZM0Yj1CojOBzQq5VeyTFQ9rr7LMeN6phUNDd8w0K+lCdFo3IIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 23:53:25.5429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a1fb41-98a2-4f31-d66b-08dc8b3ad9b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291
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
v2: rebased to drm-misc-next

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 36 ++++++++++---------
 2 files changed, 20 insertions(+), 17 deletions(-)

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
index cf58f9da9139..bbab6d452aa2 100644
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
@@ -1009,7 +1009,7 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
 		 */
 		memset(mem->data, 0xFF, mem->size);
 
-		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
+		dma_free_coherent(mem->dev, mem->size, mem->data, mem->addr);
 		memset(mem, 0, sizeof(*mem));
 	}
 }
@@ -1017,11 +1017,13 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
 static int
 nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
 {
-	mem->size = size;
 	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
 	if (WARN_ON(!mem->data))
 		return -ENOMEM;
 
+	mem->size = size;
+	mem->dev = gsp->subdev.device->dev;
+
 	return 0;
 }
 
@@ -1054,8 +1056,8 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 	nvkm_wr32(device, 0x110004, 0x00000040);
 
 	/* Release the DMA buffers that were needed only for boot and init */
-	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
-	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
+	nvkm_gsp_mem_dtor(&gsp->boot.fw);
+	nvkm_gsp_mem_dtor(&gsp->libos);
 
 	return ret;
 }
@@ -2234,8 +2236,8 @@ static void
 nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 {
 	nvkm_gsp_sg_free(gsp->subdev.device, &rx3->lvl2);
-	nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
-	nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
+	nvkm_gsp_mem_dtor(&rx3->lvl1);
+	nvkm_gsp_mem_dtor(&rx3->lvl0);
 }
 
 /**
@@ -2323,9 +2325,9 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 
 	if (ret) {
 lvl2_fail:
-		nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
+		nvkm_gsp_mem_dtor(&rx3->lvl1);
 lvl1_fail:
-		nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
+		nvkm_gsp_mem_dtor(&rx3->lvl0);
 	}
 
 	return ret;
@@ -2417,7 +2419,7 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
-		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
+		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
 		return ret;
@@ -2498,7 +2500,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->client_id.mutex);
 
 	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
-	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
+	nvkm_gsp_mem_dtor(&gsp->sig);
 	nvkm_firmware_dtor(&gsp->fw);
 
 	nvkm_falcon_fw_dtor(&gsp->booter.unload);
@@ -2509,12 +2511,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 
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

base-commit: a13aaf157467e694a3824d81304106b58d4c20d6
prerequisite-patch-id: 1428f57d0b137672ec09da08e76c5d3069b35432
-- 
2.34.1

