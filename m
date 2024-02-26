Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3986825E
	for <lists+nouveau@lfdr.de>; Mon, 26 Feb 2024 22:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A701A10E7D1;
	Mon, 26 Feb 2024 21:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rHmRDC5t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876E10E7D1
 for <nouveau@lists.freedesktop.org>; Mon, 26 Feb 2024 21:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD0hSk5lfiZdN/eBHiKYk75M5tq51QsJu1LgOKkKJTJLmbSL2Valq+WXev0XuWxD/qpaBR+kWjI2/LZE4W2wI/H5vNuH1ZNOMDFMIOLttQNkfoM9VMq7jygwgxcn4nj28e/oLHzWmnXKyE4UalIsyh0TbJX/8aLSDWPpzKEF5b7qAKkmkl1C4SYXXajQVksYAtdwkPbRW/NB/BtiXS2DgokJgo1buZ9XLQVP9oEep6MKv4bDZ6Yq+1pY1Izy2eiM5Swln6WCEsxCEWmQg6PBkMndgGcaQrPGYQdhB+23/GfIDxNaKtTeedeP3yYhgDYUO9CUD8Wb167K1KhucDXfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/rui0SSVHJH/vFVb5gsVfrZmr8SFxwAw69dxZie5w4=;
 b=bbiUBRvRFE9m5CtScs4WsGgZhrSV4AjLde6NGMJ2TXPNx13ufiKe6TgZDWG4hJuXEjGtyNUWILXMu5ojPnfKcJB02zyCzsceIhQWNeLAf64eqDnEiKw4M2wdKFoeYB04bQBMRYMK6iTHU31glaO9+43aVWVTSWZ4hcL17akGL7A0mW0lIwAyAfm22kPKH0kM8ZcDz9VGIZOkqaj/es0Twlm6ZEuT718LdwdDL8+ZguZ6F5M35Cex88h8HwbbU9Fxv2H5aR6NyGD6lmt3MLxy+mNw8//bUEf22GhMKi66eUChqLx27ZwazJZkHwVd22OjJVDt7e3602Zi44LMZbms4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/rui0SSVHJH/vFVb5gsVfrZmr8SFxwAw69dxZie5w4=;
 b=rHmRDC5t6QrUSvw4KOWtOPplKncypDKT3zxGHClCXD0jddRq1R/WHJUfnbecsXP0L/7zjJxbKpK3ifgZbWvj6CMVGmZ8CTwuhvEZXpSXOcCGaN2Ccs98tFpS4N88/3twiKkZ+o3VDUZ1lvzgtTXV/Tr5RJ7oeZHzaBrxVyzrkYmtvwkQH1EhhbBTwI8grhlINwQI+LmtRubr5A2LJ6kSGRg5NuHlAlCXwWOsR16CDFI34sP8VCda6xR/Q1sketNYrsRg1ohwC2BpSVuRSSmavlMg8e+xgPqdDHJwfafjcrA3bl5XU/YTOnQUfMJf7ZefWMriInHEFcWcH4MgY34s4g==
Received: from DM6PR17CA0010.namprd17.prod.outlook.com (2603:10b6:5:1b3::23)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:04:35 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::cb) by DM6PR17CA0010.outlook.office365.com
 (2603:10b6:5:1b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:04:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 26 Feb
 2024 13:04:11 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 26 Feb
 2024 13:04:10 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1258.12 via Frontend Transport;
 Mon, 26 Feb 2024 13:04:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, Lyude Paul <lyude@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: retain device pointer in nvkm_gsp_mem object
Date: Mon, 26 Feb 2024 15:04:08 -0600
Message-ID: <20240226210408.4022992-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 99906522-6001-4322-4211-08dc370e88e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zt79/OT/1gEskaGS/PH0FFpc2hO8HeDimMlYGh89IP0Y2yT2UTHLp09fvogGPn04QXdAL4XuxqvVhz/qafLW2vNwGSoeWiNKPDKaFv5TpbzbPeeekToJ2Gyuygt3452Bw176cchDhnhNVw251gpUWUh3c4ZX+qkzkbv+HuwkNEghDClDgnLHSgPehSKg15tN+7AJ3D3rcm5mqzRjJ5VUjsw47LksFtOknJhK3u9oAAJrPvkJFwXCqSDZFuTK1v1GmbDsKOlmWobbFYBlrakwWvc1YE7WvZw/1Sld3eKPjAmiLkanrXVPXjwFlEp/mAeHVpHfRIeUVViTjuoPfkrO5T8XjFXD5IfGJwbMFmTsA6BSMbmLXwoUDwtENFIz20ky4v09a6WshVPrs0Inf1KzRkqF+sg/s2VXX08rJ6rAtDbWwrGseGmZZTVqNyitSUmWcf/utQQzhRnaZKhkjPEV0KSWG6mAfuK03IA+h5zDuRhUcf4WwJG4XOppSZNf8moCOLcKL/muWWCqNdz3DyS13hB86fi1qYTJHqlwHn7IkH50/gbeHbFS5Ip0k9ZNFf5V1iAHH5vFeKXbSOdZk/y6EOQuR7wxBb76IBqchAycKMLV8ZZ5jGNSP9F0tUK0w/tFsBP8tChd/3oU4xYeVojCmU62Cn2QAFETidDlpyLLldBeuC9pXcHdz6l9ObsIWUtceXsMJb8ddR/86rrz05OZ4upbbb/aWLgsTJhQGaT10ayhTvS55aAN5/Dlz2VvNLXI
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:04:34.3794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99906522-6001-4322-4211-08dc370e88e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 30 ++++++++++---------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fbc57b16a05..a9be0d86e412 100644
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
index 40757a21e150..1eb1bc5df39a 100644
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
 
@@ -1054,10 +1056,10 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 	nvkm_wr32(device, 0x110004, 0x00000040);
 
 	/* Release the DMA buffers that were needed only for boot and init */
-	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
-	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
-	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
-	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
+	nvkm_gsp_mem_dtor(&gsp->boot.fw);
+	nvkm_gsp_mem_dtor(&gsp->libos);
+	nvkm_gsp_mem_dtor(&gsp->rmargs);
+	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
 
 	return ret;
 }
@@ -2249,7 +2251,7 @@ static void
 nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 {
 	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--)
-		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
+		nvkm_gsp_mem_dtor(&rx3->mem[i]);
 }
 
 /**
@@ -2407,7 +2409,7 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
-		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
+		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
 		return ret;
@@ -2488,7 +2490,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->client_id.mutex);
 
 	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
-	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
+	nvkm_gsp_mem_dtor(&gsp->sig);
 	nvkm_firmware_dtor(&gsp->fw);
 
 	nvkm_falcon_fw_dtor(&gsp->booter.unload);
@@ -2499,10 +2501,10 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 
 	r535_gsp_dtor_fws(gsp);
 
-	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
-	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+	nvkm_gsp_mem_dtor(&gsp->shm.mem);
+	nvkm_gsp_mem_dtor(&gsp->loginit);
+	nvkm_gsp_mem_dtor(&gsp->logintr);
+	nvkm_gsp_mem_dtor(&gsp->logrm);
 }
 
 int
-- 
2.34.1

