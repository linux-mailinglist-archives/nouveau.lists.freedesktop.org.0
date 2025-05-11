Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329FAB2B68
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CAD10E210;
	Sun, 11 May 2025 21:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YcdI3FtB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8810E221
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIjZ0SSQ1A5iDlt0nZNMwdaB8C9r9Yfr7dO81R7UHX2FWWSGk56QFwthgE//bbAbTO5QCKgmkQ5rqJpDQnFsVRg1DTFIhTkHMtdY49BSfhnWYB6l7r+mvx6qBmhS6ypF5Ys5iB1OZ3GjGrqvuvYAuh31ny9ZKayDvPOox0vHYlfXkN3JwbB73TGK1X6bilUDEsZWffq1Rf5+8gNye+c6hApvgSIzZ+bVlv5LAq0CJaceRhx2VUsbEg2I91tAuilBkiiE4ubMXi+zSxnr7/zAWl6d5hQ+RxJNbAwmg07JllTO6KVnK1iD0+UEuAPulaYJsVIu1HyIWu9vs/+IY0Oemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMUFDwn0bmnHEQpArc9asLawI28G3I9Jy+z39m76tGQ=;
 b=odshKaYh9HNs0mq8HeqTFxOBp1Fej4ggdsK6xYC2wB0h3ToIDto3Xp3DxryNfDArbpPYNGJeRCCpub5ogaUUQTXD8jfMkgzFUiII8j7lyZ7GXZTyLAWRTYL13QK/T0UISNDG+EdMLHByqU5L+A0NVIB5DCfi0enyc073zC42dObuY0Za7euxqUKqESsGwwovdBTyKcH4OZrvpnm//aIp9h2mueIWHSmt41cX2irmicN0O7f9FlKNl35F6J4Cd4vSuo5x+keUj0+ntF7Uv4YSSivq2ky01BX/JXZplV1HQT2SVH/TD43T1EFiDZvKijOgkWT7v5Hyiba73reUUccsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMUFDwn0bmnHEQpArc9asLawI28G3I9Jy+z39m76tGQ=;
 b=YcdI3FtBy88j5X+R7d6znESBPP5dvl5OSSjA6uu0O+7qCkK8XVuCQsRN8fZci5IShh+SQ1GJ3LIVAPrs3A7u4vKZJROc60lLKUBXsfBeIigHKShDJPkkqC7HTLcJ/gBMBL/a93UZla0LdLhY0YAYeMWgos6rvRNUxUCeEMHfKTznRnpcPYGP7IXszGXXLikbuXEZRKIb0kFb0+xuaIsDQL9hGAsjEiuoDMnUv7vUZXPu0DISUQtXcDtcxSggxLdTNsxEgFZAG/CFP8xUfl0qteZDHdRMJg/Jl414mLpgFvcjoQKIbQsHPdpygP9gKdMKo5TcR/+7ngMfaa1w1vA0jQ==
Received: from DM5PR07CA0098.namprd07.prod.outlook.com (2603:10b6:4:ae::27) by
 LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.26; Sun, 11 May 2025 21:09:08 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::a1) by DM5PR07CA0098.outlook.office365.com
 (2603:10b6:4:ae::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:02 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 35/62] drm/nouveau/gsp: add hals for fbsr.suspend/resume()
Date: Mon, 12 May 2025 07:06:55 +1000
Message-ID: <20250511210722.80350-36-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 5646aede-f096-4660-488e-08dd90d01186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RedDuDl6oCIhz57KGASQHbyQDv/LspJzKb39fqTWPpH3kZYi2/+GUSl7d7JV?=
 =?us-ascii?Q?VCyW2Httm7xbVk4tj7JKL3PlZgvZ4c39MpxMv+5tf5UtT+dAmaGsIIw45YGz?=
 =?us-ascii?Q?eW1Krv4qEBS9zIu27fKs2qxZPAZClGwUisucPCPCslQZrqLHEiHfanrr2eEX?=
 =?us-ascii?Q?th1GTveJ3wgdl287/FiHFBZb0ICiNCm/A2Ddfh8fsnV0gmUSF/sMrIZMoLrm?=
 =?us-ascii?Q?OoapJFW1V2OYE89Oo4KR7u6zQcLBxt0OljM0YzJbAep2My1jFU90s4htTe/O?=
 =?us-ascii?Q?Zf2swNZoVAnzpzBtxTz6gQHtFLq28GJaDqpxI1GzANTqvqY52uLIrOONmkmX?=
 =?us-ascii?Q?JFUHBVNlkD3fr7PT9yy7BtJJqRSJZuOGU86HaRkJad+9TyfMTX4RFRlQM36n?=
 =?us-ascii?Q?DHVcl2Etdu3foB18Cp5EK4FSyOJX1qWZ3/KO4E6edKs13+7tPu7btJgGJet1?=
 =?us-ascii?Q?PadSnzbuEpWubueFJAsLTUlWeM+mEHlBEpfu+HdBmkxFfOrkkUk+eROo+XUI?=
 =?us-ascii?Q?9ikbk4HMPdqOarNFaAbAz1C1AjjYG/Irytn+R42YDFRh3MD/agsp/s4dBUzB?=
 =?us-ascii?Q?lpNpXY2ktGlzXPx/OmVGxv35NvkdPUorhKWR68JzEmuJw2UwSktL6T76zD1V?=
 =?us-ascii?Q?gN5GVqah61wkhlYPZ+Aud65XDZq/yjusnUji3JZ/SR2TbSwyGvF24sfV76vJ?=
 =?us-ascii?Q?FBScdh69/7glozm1BBjDqvL9XOb2QzU+5ndsO0KWK5p4OS+ZzfmyyN8uw08L?=
 =?us-ascii?Q?MuNoL/7G1JyqgrSL/haiAQwVUcU11CpTpmHALqTIBZtLGsqI1GOJmnJ1avPJ?=
 =?us-ascii?Q?JQJv0cLviCd2HdfKGjKmsz1qeX/xAcUyzrag1elIACX96c9MQFbXwDbBEuv4?=
 =?us-ascii?Q?+3qQgFu9INP3ofQ3Xpg1y8Qy/MikUwnnNCeCbu+m/sfAQMSRnljQcoLeaK+f?=
 =?us-ascii?Q?s/VkJpyHICpGiY7YfCEMW81D5AAW6tT+ieEfH5zwHt2xH1oay6cOxk7vHOgA?=
 =?us-ascii?Q?JZ8XIqtnK1OhlMJwYU/a1vXT7/RsLY9EgNxSNfiVZ69jTK53vZAae0KWdwjJ?=
 =?us-ascii?Q?XhmUl4C+fwn/ejkSqNGgz5bGiv9vZGrXBSx9SsEa5qLOQoMF4fnN6Gniw47R?=
 =?us-ascii?Q?D3YfymHj1tKjvXeXBpenc1/CEEmA0MbVrPBC6hjqRoYRfSxEbm0Wv+1M/25g?=
 =?us-ascii?Q?FHJpR7lAKPoY3+2HemcFHui3sIFDt5/u/jnDiUk5Oq3rPrvHOj/NEWHMlNrS?=
 =?us-ascii?Q?oebA3AYw2reykP0qKNvtNRftIB85g53imdCgusFsrPOmeglRi+jQQxprtKIx?=
 =?us-ascii?Q?WboHMoz9oBuM4evp4l0gxHQkA2cjCJAxD1/teEH79vQzV6vngZdgsyUt9vC8?=
 =?us-ascii?Q?Wu6IA8FyYERY+s8jF2Ngj9P7ahYEtRVnPcJoJ83mXqxhr8DwhN3rCYce0Hdd?=
 =?us-ascii?Q?NIxktgHO/1Tg0rzpmavQtbnQUzvRxYkhWEYcqtiV+Ta0aZrJtrv6k4G5oAya?=
 =?us-ascii?Q?yPVNaPwShWVV0gX3ZpvdD4mmLYEK0FcAgnwG?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:07.6515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5646aede-f096-4660-488e-08dd90d01186
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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

555.42.02 has incompatible changes to FBSR.

At the same time, move the calling of FBSR functions from the instmem
subdev's suspend/resume paths, to GSP's.  This is needed to fix ordering
issues that arise from changes to FBSR in newer RM versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |  5 ----
 .../nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 29 +++++++++----------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 11 +++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  6 ++++
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |  8 +++--
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index ef781c4ca11f..40e1b5300dff 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -133,6 +133,7 @@ struct nvkm_gsp {
 		struct sg_table sgt;
 		struct nvkm_gsp_radix3 radix3;
 		struct nvkm_gsp_mem meta;
+		struct sg_table fbsr;
 	} sr;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index e10cbd9203ec..7d93c742ee59 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -24,11 +24,6 @@ struct nvkm_instmem {
 	struct nvkm_ramht  *ramht;
 	struct nvkm_memory *ramro;
 	struct nvkm_memory *ramfc;
-
-	struct {
-		struct sg_table fbsr;
-		bool fbsr_valid;
-	} rm;
 };
 
 u32 nvkm_instmem_rd32(struct nvkm_instmem *, u32 addr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index b2f22bd93f4e..0e436c4fb4e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -201,21 +201,18 @@ fbsr_inst(struct fbsr *fbsr, const char *type, struct nvkm_memory *memory)
 }
 
 static void
-r535_instmem_resume(struct nvkm_instmem *imem)
+r535_fbsr_resume(struct nvkm_gsp *gsp)
 {
 	/* RM has restored VRAM contents already, so just need to free the sysmem buffer. */
-	if (imem->rm.fbsr_valid) {
-		nvkm_gsp_sg_free(imem->subdev.device, &imem->rm.fbsr);
-		imem->rm.fbsr_valid = false;
-	}
+	nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.fbsr);
 }
 
 static int
-r535_instmem_suspend(struct nvkm_instmem *imem)
+r535_fbsr_suspend(struct nvkm_gsp *gsp)
 {
-	struct nvkm_subdev *subdev = &imem->subdev;
+	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvkm_device *device = subdev->device;
-	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
 	struct fbsr fbsr = {};
 	struct fbsr_item *item, *temp;
@@ -256,7 +253,7 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	fbsr.size += gsp->fb.bios.vga_workspace.size;
 	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", fbsr.size);
 
-	ret = nvkm_gsp_sg(gsp->subdev.device, fbsr.size, &imem->rm.fbsr);
+	ret = nvkm_gsp_sg(gsp->subdev.device, fbsr.size, &gsp->sr.fbsr);
 	if (ret)
 		goto done;
 
@@ -265,7 +262,7 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	if (ret)
 		goto done_sgt;
 
-	ret = fbsr_init(&fbsr, &imem->rm.fbsr, items_size);
+	ret = fbsr_init(&fbsr, &gsp->sr.fbsr, items_size);
 	if (WARN_ON(ret))
 		goto done_sgt;
 
@@ -276,12 +273,10 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 			goto done_sgt;
 	}
 
-	imem->rm.fbsr_valid = true;
-
 	/* Cleanup everything except the sysmem backup, which will be removed after resume. */
 done_sgt:
 	if (ret) /* ... unless we failed already. */
-		nvkm_gsp_sg_free(device, &imem->rm.fbsr);
+		nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
 done:
 	list_for_each_entry_safe(item, temp, &fbsr.items, head) {
 		list_del(&item->head);
@@ -293,6 +288,12 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	return ret;
 }
 
+const struct nvkm_rm_api_fbsr
+r535_fbsr = {
+	.suspend = r535_fbsr_suspend,
+	.resume = r535_fbsr_resume,
+};
+
 static void *
 r535_instmem_dtor(struct nvkm_instmem *imem)
 {
@@ -313,8 +314,6 @@ r535_instmem_new(const struct nvkm_instmem_func *hw,
 
 	rm->dtor = r535_instmem_dtor;
 	rm->fini = hw->fini;
-	rm->suspend = r535_instmem_suspend;
-	rm->resume  = r535_instmem_resume;
 	rm->memory_new = hw->memory_new;
 	rm->memory_wrap = hw->memory_wrap;
 	rm->zero = false;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2df551d61abb..fc1f4219e624 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1735,6 +1735,7 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
+	struct nvkm_rm *rm = gsp->rm;
 	int ret;
 
 	if (suspend) {
@@ -1759,6 +1760,14 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		sr->revision = GSP_FW_SR_META_REVISION;
 		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
 		sr->sizeOfSuspendResumeData = len;
+
+		ret = rm->api->fbsr->suspend(gsp);
+		if (ret) {
+			nvkm_gsp_mem_dtor(&gsp->sr.meta);
+			nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
+			nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
+			return ret;
+		}
 	}
 
 	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
@@ -1792,6 +1801,8 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
+		gsp->rm->api->fbsr->resume(gsp);
+
 		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 43cf44bf3abb..a4190676e1ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -28,6 +28,7 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.fbsr = &r535_fbsr,
 	.disp = &r535_disp,
 	.fifo = &r535_fifo,
 	.ce = &r535_ce,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 3d677e5bdd2c..ce04ed9e3c27 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -73,6 +73,11 @@ struct nvkm_rm_api {
 		} event;
 	} *device;
 
+	const struct nvkm_rm_api_fbsr {
+		int (*suspend)(struct nvkm_gsp *);
+		void (*resume)(struct nvkm_gsp *);
+	} *fbsr;
+
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 
@@ -113,6 +118,7 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
+extern const struct nvkm_rm_api_fbsr r535_fbsr;
 extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
index a2cd3330efc6..2f55bab8e132 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -182,9 +182,11 @@ nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
 	int ret;
 
 	if (suspend) {
-		ret = imem->func->suspend(imem);
-		if (ret)
-			return ret;
+		if (imem->func->suspend) {
+			ret = imem->func->suspend(imem);
+			if (ret)
+				return ret;
+		}
 
 		imem->suspend = true;
 	}
-- 
2.49.0

