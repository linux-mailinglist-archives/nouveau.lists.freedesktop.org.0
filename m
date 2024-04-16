Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709498A793D
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CFC10F546;
	Tue, 16 Apr 2024 23:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FgmzraQU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3EF112FE0
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSfTFfg0cSCqkgbrHqRfF7rdKaZx7qkjfAJQTuwS/95uk9aPSVmbCqhWBhb4PnyKDTnuWO0Pimia4Fd/lms23KMP2v3rt1XikpoRITEURpm65A2VVGy6HsrTquHIFh70eLsSvjxKFfCbpHuB0sEXOtF55kPI952IaX2H6bOChB/BNI2c8YZQKdv2hMuQ0CR/VZyE68Lu3eCx8h2XxWvO64zsyjYf3MbK/gCYWf1d+YgyKiTDYSfmel5yJpV+YF/gApCSbcH2nELw9XgXrVz9KUCza9Yz5uLxanNGngKFf9mcWIwOs5iUz/PKUNeOkUKvhaIi/LB9fEb4SxJBwcXXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZiX34oJQwf3Dx0eHIFWqEbm6wlnbdu7xJrzLgBtKcU=;
 b=k35vzLkcfUIzHrfnDS02IDHC2s9NLG5YH3fl3kyz8DTdMILdk0aVq8t1ykj4IuSOH9YWI88LuhiyJU3gMlAQtsqxAHy5tHbmwPzWvgoAQiv4qwpT5okXtSUrZK5kLyqcuZvIuRt4kV0fuWdDrI8zvWThT3Fny/jjyzm3GF8nEIKTUkPvUhGpzP7vAWjC+GSEHd8SPRnaB7Ti5j6lIHG2EtPnX27IMemJy+ZXvIYSdEoO4zmsZgTrJXj91HJHplODQkCkEWIPC/AtjJLQn2enYmh24T8qFrqNovz8jimEjoIsxKP7tIJkbs8sKu69cZvpFuXRuWbmhBJn5YPFdxTHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZiX34oJQwf3Dx0eHIFWqEbm6wlnbdu7xJrzLgBtKcU=;
 b=FgmzraQUPZI1C1Axw91pTNMCXUq7h5m3YCNJxBKOIexDaOI0fNqryOo5ZZ8K99KDKp4N7paD5QdaIayZymuhSwnsXYR1a4fDPB6mxr/oRJL16D1hV/qH4+t0LgYRjDqgcA8pV/U/77LmaOKxLBN54L4w36hEUb1LdfobR7dGE6SDRO4nH/OGKSod+3k03pCFfY3mLgqBNKW8mOnbzNPEvcx5ssn2dSjZILMwwkmzoHyqx3/FTt1f+GAF+sE0NazaBDKH+lIAkSMxROCTfw+vM/Q6+8atRy/iRdaa9U2H2/PBdSvx0RIlGusgE56LSd8UjtDVE0ECId0Guv0w+4AIVQ==
Received: from CH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::7)
 by DM4PR12MB6303.namprd12.prod.outlook.com (2603:10b6:8:a3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:43:33 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::f5) by CH5P220CA0001.outlook.office365.com
 (2603:10b6:610:1ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:09 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:08 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 139/156] drm/nouveau/nvif: remove ctxdma from object rb
Date: Wed, 17 Apr 2024 09:39:45 +1000
Message-ID: <20240416234002.19509-140-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM4PR12MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: d055a890-e0b7-438e-749d-08dc5e6f06d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +GG/5uNamz+V3KfFtoHZO7yfNo4m/oQqB6noWrkfQVDW+raEbK7cSfH7kf57lCrcdMm2G5BhF7eyK2d6Mz9ztCtBvcn6qzn7KCKkd3gcDGPk/a5H1EL+MRAc84XED58BgPquWjC+jFPY6ZmmOh3nkdYs/jDZx8h3yKz0eXCuMSJawbnp6z9aDACw/sT0W9Nb4dzwiUSh+aN96D8jNelUCrm4pquBMwHxG6L1pwCcxhf/bkQw//msyzrnguslcmxFOO8cDrNtxQ0ZNo5OwKcjGL8JDSnp0DbUzwVIkUrMiLaUR9Sv/O1HB/7Bvn57MMD+0E9hbHOW6wwcvp/gfQrDS7782fZ/pWjj7ZON5iQWNSoKbhcomuARud2tF/1SLhLU7iI7XnWJUOpKtc12kZhndItBOmPu1UEpwMZpmgF/4B+FlnBfD6ORsaX4nYWoaBvhvx94Nt09jnHRk4E9pPxlJ7N8yMRseRxYioTZgiOz3tNXgkN3Ga35q3qidtbw+EA5EDommTyWGDPtxT9zuo7nXICtNbvwhmM3H7p2jSrkPIW1VrgMGoCLF7UkuX7reAhbWsdHBq/ywDojyMYltjy6HUFhNxr+WX7oPjyhsZ21pNgXFaP/aLmTNrKALGXTBRd0O26dgYFDVOcILb1/2g/uNc7p1cAvcd2qMcXmqXW7ne6KMB/ohhLFyTtf3fX1kyRsdTSvQo+OQXD8T2LFN7ByRhaKesUMPDWt3YBRbYMC3DLUT30mKemz7s3l50reDAYA
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:32.7278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d055a890-e0b7-438e-749d-08dc5e6f06d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6303
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h   |  3 +--
 drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h |  2 --
 drivers/gpu/drm/nouveau/nvif/device.c             |  2 +-
 drivers/gpu/drm/nouveau/nvkm/device/user.c        |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c    | 13 -------------
 5 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index de9c55dea9bf..fac23a6ddc6d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -533,8 +533,7 @@ struct nvif_device_impl {
 
 	struct {
 		int (*new)(struct nvif_device_priv *, s32 oclass, void *argv, u32 argc,
-			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **,
-			   u64 handle);
+			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **);
 	} ctxdma;
 
 	struct nvif_device_impl_fifo {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h
index a003da39fd13..5a7ccdf8ae5c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h
@@ -21,8 +21,6 @@ struct nvkm_dma {
 	struct nvkm_engine engine;
 };
 
-struct nvkm_dmaobj *nvkm_dmaobj_search(struct nvkm_client *, u64 object);
-
 int nv04_dma_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_dma **);
 int nv50_dma_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_dma **);
 int gf100_dma_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_dma **);
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 555c63e96660..40bb0dd518e9 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -33,7 +33,7 @@ nvif_device_ctxdma_ctor(struct nvif_device *device, const char *name, s32 oclass
 	int ret;
 
 	ret = device->impl->ctxdma.new(device->priv, oclass, argv, argc,
-				       &ctxdma->impl, &ctxdma->priv, nvif_handle(&ctxdma->object));
+				       &ctxdma->impl, &ctxdma->priv);
 	NVIF_ERRON(ret, &device->object, "[NEW ctxdma%04x]", oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index c1ccb75db3c1..efa675c8098f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -152,8 +152,7 @@ nvkm_udevice_ctxdma_impl = {
 
 static int
 nvkm_udevice_ctxdma_new(struct nvif_device_priv *udev, s32 oclass, void *argv, u32 argc,
-			const struct nvif_ctxdma_impl **pimpl, struct nvif_ctxdma_priv **ppriv,
-			u64 handle)
+			const struct nvif_ctxdma_impl **pimpl, struct nvif_ctxdma_priv **ppriv)
 {
 	struct nvkm_dma *dma = udev->device->dma;
 	struct nvkm_dmaobj *dmaobj;
@@ -167,7 +166,8 @@ nvkm_udevice_ctxdma_new(struct nvif_device_priv *udev, s32 oclass, void *argv, u
 	*pimpl = &nvkm_udevice_ctxdma_impl;
 	*ppriv = (void *)dmaobj;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, &dmaobj->object);
+	nvkm_object_link(&udev->object, &dmaobj->object);
+	return 0;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
index 463600e4f368..96634f503310 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
@@ -30,19 +30,6 @@
 #include <nvif/cl0002.h>
 #include <nvif/unpack.h>
 
-static const struct nvkm_object_func nvkm_dmaobj_func;
-struct nvkm_dmaobj *
-nvkm_dmaobj_search(struct nvkm_client *client, u64 handle)
-{
-	struct nvkm_object *object;
-
-	object = nvkm_object_search(client, handle, &nvkm_dmaobj_func);
-	if (IS_ERR(object))
-		return (void *)object;
-
-	return nvkm_dmaobj(object);
-}
-
 static int
 nvkm_dmaobj_bind(struct nvkm_object *base, struct nvkm_gpuobj *gpuobj,
 		 int align, struct nvkm_gpuobj **pgpuobj)
-- 
2.41.0

