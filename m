Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67342846188
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 20:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D2310ECD7;
	Thu,  1 Feb 2024 19:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dIYJv5Tv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5BD10EA56
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 19:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAIuPeMfSJIzbkXsBliAL7b1eiGQqZPndUMgtQ4cJSKMdg4sLJiYGHmcu3gyxGP9KGuU337oLrCeBztDTT+ntNnLscQkiF7etmloRJ76F5YrsIjf+gZ2f2ZF5Pwz3BozulpC5C/rpTSqtHnmHR6lQmhlrfSh+nsQGbnXK1CUVIH2oTlr2lK2w5Hwb/HQUKcQ7+JSJ6vudWJo51yU16ZtwhkyVNUXtljuwEbvEjTDP6lmgH0a74BNCrGgRBzwHJIheBKgIbJTVys4i4dihk7+yQMDTXBaRDt4TgrvWVHKVfJPs3OxqOjq2txSTcsG0QbxnGosOIE5rXhbTSMuV0Hi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0Yh7DXVfomhg72axjaxQjDmAAiuoiE23V9fKRAAEEY=;
 b=d1Ju5Ka5tozBGaCL73xv8J9Qv4XBh1I8+bDl7QdO5tguddkdnV/6ydgrwsWUdgXCWwF5fzBivfuD+ehyk83fwm7r26k5LNj60vDYvDS/vL3MpQ3NneGof009FFZGmQ/S20ekKOu0ooiSX+JmhFVy6TfEtjIy/po7jbT1ztumpmmFbOpA0riwAEKTQYRY9rv9AEiECRuHRXou2fMQLtPNwBA0rC1JnKhLGnZl/rClDWZ7WrygZeEidLBSmPFBWVnYHY4SgsS/3b6UtK9dm5wac0CP+0hF9+pfFrW365tDYOohzjONVWB4RcfNA92EodG8RqTy85sc/uv7NmKC9Nz9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0Yh7DXVfomhg72axjaxQjDmAAiuoiE23V9fKRAAEEY=;
 b=dIYJv5Tvm48x/c4PVtuWcQ4gwJ0KfN2h6T4jD+eEz/M/70vScC0QbNB5cvjhT/CX6xX3q0Urgxth8dYXrN2zliPy0khggHy4sKHkSVzumOGZ1obeIRra9bmVVzURFq2q2Z4XcyiBfVkwml7RmTR9dNYfS9tBEfw4TMrk8Icc74R6Q2rlid3t+/nLDT9txMppQL7R5xBqqXQ36M8xeK3p3kDRGo/jU9UJ4fMZuBKHi6wuwuMvcjAzGE/SayeXRrZjSdsarXATvD6sOkZ3AiWCTpG39z1DUb8/B0f/fXpcIvQHXaYPfYXW36LX1wpCXXPev57jx1XVvMF2j9kXEMM4BA==
Received: from BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::31)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 19:55:21 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::ea) by BN9P221CA0011.outlook.office365.com
 (2603:10b6:408:10a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Thu, 1 Feb 2024 19:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 19:55:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 1 Feb 2024
 11:55:06 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 1 Feb 2024
 11:55:05 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Thu, 1 Feb 2024 11:55:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: fix several DMA buffer leaks
Date: Thu, 1 Feb 2024 13:55:02 -0600
Message-ID: <20240201195502.1706490-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a0fd8d-55aa-4a08-84a8-08dc235fb8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N15FPF73KIEz4mJJdiBnQELUyMJm4HhXqzzqkGdUo9IU80zf/0awFr+4BWilPaQA/tcSf/jtc42o75m/TUDZ3VNSTBt4IQNZCQ//TImsqQyCc2TYs4zdc0NYUZtIKB4QoC/sDGufymIkls3ihibnLea0mPO6x8BgZMz1yWAC8MFpQSY/WWIUhfq9WPBASjznJUS1STc+u0R6ncAOAUxlP9HV9+MSlKI24GXl4qmW+qQwcnWYeVikYJqVSLWcOZCqFKHYKLnT0bXnH3U2OuGn44mT7mc0zBp2kd/dxBfjcEXRv+L9JrlvKaPuAE5NpFgHYrmq8ggZB41CyA1xzRicUNBxfC0Y62i1IIybFjyT6TZ4rJjfDM71q5Fn2tFb/I4yRuo6iqdcfR0W9E+nkc2bdebTBlwHqObBfxfflZASy5C7QNMdA1etAp/jZS0ufPeRZxcRuukwVym1PlOppstuz9QTge9+V/3v8XXnyLlnIB5AOYXD7dVoQCF0p64rYefOZY4OubqZhuJqLqAm0Bn0y7RucztENV6VBu07zW6lv/62+9HJUMQ4qedb00wEw82CkNgdA7hFeBahzSRzRAuP3ZmqoCz7G+0dzz/5wZF+g9PXj/jw6yy+TU9sjb+v3tqHjFdDYLZ39oxM1cYb8l/pxAvt10mp2Xe7ajaGVs9SgTs2CtTU6ln8xG+IaxhpesHX7tRHpOzJydSm8Q0By7PbPsldUH+gT5nRPJayMyX7QERKBlKCZUx/LAOQmZo4ntSH
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(26005)(5660300002)(70206006)(70586007)(478600001)(2906002)(83380400001)(336012)(6666004)(8676002)(7696005)(8936002)(316002)(1076003)(110136005)(2616005)(36860700001)(47076005)(66899024)(356005)(7636003)(82740400003)(426003)(41300700001)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 19:55:21.0158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a0fd8d-55aa-4a08-84a8-08dc235fb8fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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

Nouveau manages DMA buffers with nvkm_gsp_mem objects.  Several of these
buffers used to load and communicate with GSP-RM are allocated
but never dealloced.  Some of them can be deallocated after GSP-RM is
initialized, but the rest need to stay until the driver unloads.

Also futher bullet-proof these objects by clearing mem->addr when
the are deallocated.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 54 +++++++++++--------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9ee58e2a0eb2..463b1c153222 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -997,6 +997,27 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	return 0;
 }
 
+static void
+nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
+{
+	if (mem->data) {
+		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
+		mem->data = NULL;
+		mem->addr = 0;
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
@@ -1024,6 +1045,13 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 
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
 
@@ -1532,27 +1560,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
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
@@ -2150,6 +2157,11 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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

