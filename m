Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B6847A90
	for <lists+nouveau@lfdr.de>; Fri,  2 Feb 2024 21:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007D910E720;
	Fri,  2 Feb 2024 20:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PsBN0T5M";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426510E720
 for <nouveau@lists.freedesktop.org>; Fri,  2 Feb 2024 20:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFd64hswWEwL7JhFibamMB62wl/cTyyn2Vsp92LyqJvl25vYnhXZvOIyS8wEOX4pwUllqbwYDnC/qcUtY48iycKqFzkGTjUxOWxmjFPQXTTcGzRqoG5OEyHbchBxD40IuIqA2gm/SaerHeennUN/TuRs1vS5Pdps3YQ5LVK2nXnTTYPqaDOvZ9RybDC33F8nGFgX1+rqVfiXcbTPMOhmF1+O6e0oGqBMw+faXewP0KRNu6vzOSzjggLVhG2TM/hsp/EvI9kQfNEAloyIwIs91Q8GHlXeOHmhIqmDl62GwpZW7A3nxSMWdH4oHfK1aBhz2zjTObnwIP9YczihT4Xlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY5vfBwdYVscIr5pcZX9+1WsRAcfwfO40GgcAQ0QIH4=;
 b=lXr1r/BrgEFv9jDWEvRzUw3Uy1E8yGYmzdRg2pKX+5c5K3P6JPiNpbWoiLhJeenC1eID2vXr2rcdaqTRqrp59pFpuSGl20x7nKZDnT49dQ2mTxdoxR8DTUr1Ve2mBkC+GKrh4ubhdVV27afIbkl0l8AY3pkmB8ZrAfUd41Ze9KDO/ho3Br9mr/i6dSdNMq8gkxLPPpd4ieh7+k0j4/fS3oPhB4A0r+xSHtV2Yue/XvFLxG8LOSoSLTi2KspU63DnI+VhShCFJLBlcJogbIzUyeH2JdgTybjn+qoDoIWYnQd4O1C3arsyTwROaQ7uNs16VOw3BWdUWMlRSdnxrVYQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY5vfBwdYVscIr5pcZX9+1WsRAcfwfO40GgcAQ0QIH4=;
 b=PsBN0T5MWX+V52HdpVQoOxngTc5/Di8eMT5X0Jny9PlvBStNamyX4ZN7njoBYRRAp2hBUT6x4sqAsGiivp2qjpR69Z42nW0PJ/EalVS0jIrZ0+L006FBqhmW6vFnRynmKA0R1W6Mef6reNgQ2Q3AK62kUYNCp6C/Td4eILwpP7w+D+BqwUTcfpJjXrc4WSiAONOM6yq7hW6Eq9CfT9ZeK4noJvq4AnP7sPJfChW974uI2kyhYzjhQ6U8ocUZHueeljW9yse2W0gaQWmQs78r8rogy1jqt8v5ZMz/Ad6O02Y8/tA9H0msFeEOB95d6QX5DsBeG5ScpeTti7e4ilJeCg==
Received: from BN0PR04CA0210.namprd04.prod.outlook.com (2603:10b6:408:e9::35)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.8; Fri, 2 Feb
 2024 20:38:45 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::25) by BN0PR04CA0210.outlook.office365.com
 (2603:10b6:408:e9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31 via Frontend
 Transport; Fri, 2 Feb 2024 20:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 20:38:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 12:38:29 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 12:38:29 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Fri, 2 Feb 2024 12:38:28 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] [v2] drm/nouveau: fix several DMA buffer leaks
Date: Fri, 2 Feb 2024 14:38:27 -0600
Message-ID: <20240202203827.1947038-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df249b7-6ae1-49a2-ee35-08dc242ef3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGwJORDridJhKoiT9sQdllna1rWdck+ZyFo35g3QlmTfjciJS2/Fww9gG0ucHGFWmNIoem8eS48iQ1WN0dtSkLwTu2mb6B6dbZo7v/TehM0jf4Rq4rMm6qYYMGP1F6hKk4c/64OPvtIWp2mCS+haAClWBMG3PXcpuxniUTmunqs/FseY+qcqtYX/6MoOLiP75hVOeQmWrhdHcVGDAH1WUwakjWslxeYDlBwLUWYMofp7wpMqnxsSYl/j+o14PCnSSuWS+uvyEXs92mmWE260ZrRZYeKeGsC8EDWDaHCpbrSXUtcqyg6xJwyw+2UixyZXXVSJRwe0O4D06sLpb4931hqZcUdw/r59V+cyee0qL3jAY3UUGGFmA2N1DjlSk1grecsmwey7ESORfGJwBOwcqxSGYob0PId0pjP7CgJSTVM7F5eaxru+ILNDrGwkJ+a6XbQ/mNktdnSVrLGt0jDJvbp5HNmZrwYX82m2v78gNP63PN3FC9FvEowxlvU4s8vBSwh34qiS2X+elcHwA7zkkDqRPCxGmyEEbj+PLwf2C8oS1iX/qyd089iVDM58Oo75j+SkWFnBBw/lsMyuK1pG9j7q0AQWHBl112owsjBHUY3+I6B/V5Rr73yD4io3BW3xiiVU9D5CckdLetijZFKqfIqgVQglzuWroxd5+pKrTrZIzuX+b25Xu3qme7OWKnQfLGx6W80EnsQd9uoYsrl3lRXxG6ZFVETOP/onjjGgSi6Ff1XDzeBGUsbEvt1d4Pwi
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(47076005)(36860700001)(41300700001)(82740400003)(110136005)(70206006)(8676002)(2906002)(66899024)(8936002)(70586007)(86362001)(5660300002)(36756003)(7696005)(83380400001)(316002)(356005)(478600001)(7636003)(426003)(336012)(2616005)(1076003)(40480700001)(40460700003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 20:38:45.5977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df249b7-6ae1-49a2-ee35-08dc242ef3d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 59 ++++++++++++-------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9ee58e2a0eb2..2e2774ffdc34 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -997,6 +997,32 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
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
@@ -1024,6 +1050,13 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 
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
 
@@ -1532,27 +1565,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
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
@@ -2150,6 +2162,11 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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

