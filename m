Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046D847CE5
	for <lists+nouveau@lfdr.de>; Sat,  3 Feb 2024 00:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303F10F16B;
	Fri,  2 Feb 2024 23:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLMadH+N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C9010F166
 for <nouveau@lists.freedesktop.org>; Fri,  2 Feb 2024 23:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxlZzJM0Jp8FxJ/XDqpYf3ExQPRED2T8y+m2vbAUkCQS0/mou0TdY8Bm5VyCb9B5u/7qIdJi3LAZbZIEputQd/5WNsJNAF3RUoGiaO5R6/p35SqBebhfyttiYzTX2vcpDqgGsiz0SMCgSkv1dr6zHLY98hYkNokctxYA9WZvYWeMu9QrLHF8IBcwQ5OZVj7VQCbnAy+Z1WReGPL+wRhNU5mciksIJ186Ur9F//3fCroByapO7u+kHO3iofNUBuxlKDmGaiUKRBVZXb97TgBblU4pEmnR87RjbCpU3hFesceAm8D8Cj4zze0IrmT4hCCsstvM11S5qM9ALMcFOJACRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9gpSm771QF9s5AdmHavbaxTM3LmM1cEi06H34IMbKk=;
 b=nim5bdl0qN0fMzMHJz3LFaoYuR+VDL0NCgQD8C3IJt+PkmSs+2UO0ZtuC0SkpcOSwMk3uwgicqPV+P3oWROoxA6ZAgeldstog/Sw+M0ZkWX92b6trzLLSJa0lNUGxKZPQjM2pSF67PFkF5HSTI6qSl3pdWX82dbRpwj/WeqoGVN574bMcJqJHH1AgvTe28p9w+/jftlY2B3rzahboskHHcZLHgBcu/aHpjEJHeTohVml8Y7AOwcJNkiPP31FQbG95BW0C3Xafcg+9eqI0EiuhHz4LyXNmLRzKqAMZXKBe8ANHUqpHdp+nZQSF9LLq4B0R3aycGHLXM3RuehPSuMKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9gpSm771QF9s5AdmHavbaxTM3LmM1cEi06H34IMbKk=;
 b=MLMadH+Nj73dBciyhCHXSqAVEQsqEwUTgaWv90ZMtR9l7cVxtVF4bTWmyxvqxRoKnz3ziWcNzCDqkGPP9aFOmOuqkDXYrml1XqSAjwTRVbp6AeB8hZS+LYruqnIMMr4/By8N8JEBiTomCQOc2K7m9zxzleLGwkm/gZmW9NUBSbszNYHaPpHaRWnxkq0b/UDLiQAigJvscpEPBvXaNkkv5G2jM7y+Ulr4okj8h1j5WjeYAX//6haGijlNvJRL77RYs+gqVPvyMGYobU1IH8Anp5z/2iu0VmjFRXI3nzkt5kGwcdI/qIOTtYAVKPcu/pMBeVsRgtgaOQ2xSKWx3DMv2g==
Received: from SJ0PR13CA0122.namprd13.prod.outlook.com (2603:10b6:a03:2c6::7)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 23:06:27 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::9e) by SJ0PR13CA0122.outlook.office365.com
 (2603:10b6:a03:2c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Fri, 2 Feb 2024 23:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 23:06:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 15:06:11 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 15:06:10 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Fri, 2 Feb 2024 15:06:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] [v3] drm/nouveau: fix several DMA buffer leaks
Date: Fri, 2 Feb 2024 17:06:07 -0600
Message-ID: <20240202230608.1981026-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 61400f18-5817-4fee-21c4-08dc24439554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUoN3X7OrDi7C7PjntKUuv376KvOfHG/XD9eEhFi33/5o8zxVJmbJCq8sMfXFFHB5CMRxF+qw2LZaYWqUUHqBOu5SQzktkgL9cIavxSHD+UWJ1/C3IkrUf2mFbSIw2Rd93uGGF1JfWM84XxbKOOUea38VAB7AmEopnD7hslr2NqSO/ajn8HM7izmlWFCq5yx7rZMSR+7y/rlTgUiPxTzQ7/FJ2pajmXYslJ24tzId15HDVXGI3Cp5WZMkR9OppnweLoK/s+k+dLTvg1w4ztp38V9xBr5ZxhDV/zzdytuHCb5UDnDOmcyBQC0fJrt2ESNRQB82Fs3ss0j2bWtvy4/LwHW5+tFe7CX8IXf0Gl6k1ZS43ZyG4BSEhk5v1ciaDsEill8vP5GTUJFRFeGlYyY2a+lgBMvCAjAj/1/tQ2CT1SPmW+Oxez0qYaFnBzSpfkVp8Jj8La3CorXXAS/VBp3Uxr1ZYdgTHnlGoZqtnhvhLzx4qpCzsHVECHdhuOzNJVELLnHz0Yltx59vyhXp7Mmy31FuGMlr0lf+kWGt7FNCjNn2JCx9K3u7qED4xI5zMVFq6LuhkJdBcFxZBPvAXaviXSErUjRnPd7YQxcZK80/4dPDITBUXGayDTcJfNrKvmxezLGp3RLKgc37PYapVrXdnZe2nIKQW9zt/dAJ50TTGqbRycYrUfLlsuGgBajtIPeY9uDVYda7tufwknGBl3W0bYilFuGhb8HjGUWb8oUq2yaI5M8SFO6k8xjeOsnnR7w
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(1076003)(6666004)(336012)(2616005)(40480700001)(40460700003)(41300700001)(36860700001)(26005)(426003)(83380400001)(7636003)(47076005)(478600001)(36756003)(7696005)(356005)(316002)(82740400003)(66899024)(70206006)(86362001)(5660300002)(8936002)(110136005)(70586007)(2906002)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 23:06:26.5089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61400f18-5817-4fee-21c4-08dc24439554
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141
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

Nouveau manages GSP-RM DMA buffers with nvkm_gsp_mem objects.  Several of
these buffers are never dealloced.  Some of them can be deallocated
right after GSP-RM is initialized, but the rest need to stay until the
driver unloads.

Also futher bullet-proof these objects by poisoning the buffer and
clearing the nvkm_gsp_mem object when it is deallocated.  Poisoning
the buffer should trigger an error (or crash) from GSP-RM if it tries
to access the buffer after we've deallocated it, because we were wrong
about when it is safe to deallocate.

Finally, change the mem->size field to a size_t because that's the same
type that dma_alloc_coherent expects.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
v3: use size_t
v2: add buffer poisoning

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 59 ++++++++++++-------
 2 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 5c6b8536e31c..3fbc57b16a05 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -9,7 +9,7 @@
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
 struct nvkm_gsp_mem {
-	u32 size;
+	size_t size;
 	void *data;
 	dma_addr_t addr;
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 17fc429ee50b..a9030eb83b4d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -999,6 +999,32 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	return 0;
 }
 
+static void
+nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
+{
+	if (mem->data) {
+		/*
+		 * Poison the buffer to catch any unexpected access from
+		 * GSP-RM if the buffer was prematurely freed.
+		 */
+		memset(mem->data, 0xFF, mem->size);
+
+		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
+		memset(mem, 0, sizeof(*mem));
+	}
+}
+
+static int
+nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
+{
+	mem->size = size;
+	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
+	if (WARN_ON(!mem->data))
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int
 r535_gsp_postinit(struct nvkm_gsp *gsp)
 {
@@ -1026,6 +1052,13 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 
 	nvkm_inth_allow(&gsp->subdev.inth);
 	nvkm_wr32(device, 0x110004, 0x00000040);
+
+	/* Release the DMA buffers that were needed only for boot and init */
+	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
+	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
+	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
+	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
+
 	return ret;
 }
 
@@ -1760,27 +1793,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
-static void
-nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
-{
-	if (mem->data) {
-		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
-		mem->data = NULL;
-	}
-}
-
-static int
-nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
-{
-	mem->size = size;
-	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
-	if (WARN_ON(!mem->data))
-		return -ENOMEM;
-
-	return 0;
-}
-
-
 static int
 r535_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
 {
@@ -2378,6 +2390,11 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->cmdq.mutex);
 
 	r535_gsp_dtor_fws(gsp);
+
+	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
+	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
+	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
+	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
 }
 
 int
-- 
2.34.1

