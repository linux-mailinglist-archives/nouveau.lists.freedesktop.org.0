Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BF8A78B1
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A293112F24;
	Tue, 16 Apr 2024 23:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3mPvmgi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A3D112F26
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jyh3EpbB0Kg2WSVu8JGKutielmZfBNIdqIn1O39zHanycdV3/EN9G46FpsalBxihCLfEMvHJxCyljfM3NsvHgAyezCwkqj7FPwodC+7R5FnCVq/h7mrjzJ+d8VlIIK5kmmVtaI50MLwAvkXGMTTwQ/sfBJxlbqqEEwQx9H0jIr+ao9bPTCmjigA6H/7+FENr3k1oVykbG2hhD4xMI0kZ8VMzY4nW556aeJVbHpBtZ9wRMWT34niF1fdKyJTpiz0UpCJBSOMuC+AUVggawg5ukGGEMSoswz4xDgfsGX41waTKz6zrAa+GmmhkcexSizEXeFsgV2rPPre37XiJSiFG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFqPT6ysrpkjjrVNcivdyGAsThNb2+fQPhBq6Nh63vg=;
 b=n1HKhJfCSOJATeVBkh8E53CFSP8wgyfgd8IAdEgZiqKS84zXClmLeW3rHJsAVHFGBjFgBM7wziulzWMZILlkhUIC6y8TiDNHFCWLt54RQqw1mRHRPJQeeaawLtedVOB164HM1SMdcDXf/9R/QbALFEn6WJ7fjSllGQQPeIJDxI3qYMS0E0MILrVNE+TECGkNFACOHc38iSPz9EGALy+dsHxl49wj3e5JLu9fUtbtAFT3/ZChX36xhOSOf4YhBcyE8ZSNQd2Nvtmw0r2V11fz/hjPKFJy2efU6sIOyhTW3UjmpUNqu70IYKiXlSaBO3Nn+ZwLYDt1hgtawT8wD4YjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFqPT6ysrpkjjrVNcivdyGAsThNb2+fQPhBq6Nh63vg=;
 b=I3mPvmgi/vGExIM2EzCuokxfcs51hBkhivGfAygandAgQzY8IsozMAVCCQXTlYoI9e1Y5l9u38UdZt/gKYvD+yem94MGLNkXQhhgzZr35MZ+JC8x5PH5P2ZziUhAuCse94W3rJNZA6WWyi0sS0a4hMgFG6MZhXXVg7AFIvABCQp1o0/Fqq67o8grCehCz9BjWBsd1axamZgQX28OkJ4RrKD7nOiw0zwpEniIRZ9Ffj2NCZQK004j1WTKIxspmFv79PxKuFnf1erWQwdU8X6HFRtMRgQGU9ahUZDAMykr0dMNySqBZDt1gK9563uiCkR81v/WzIxePKGdhTcxsgKP7w==
Received: from DM6PR07CA0064.namprd07.prod.outlook.com (2603:10b6:5:74::41) by
 SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:02 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::49) by DM6PR07CA0064.outlook.office365.com
 (2603:10b6:5:74::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:48 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 015/156] drm/nouveau: store nvkm_device pointer in nouveau_drm
Date: Wed, 17 Apr 2024 09:37:41 +1000
Message-ID: <20240416234002.19509-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a3359c-daea-47f8-dc2c-08dc5e6ead6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ql24m5yeMSqjUOp1mhPzuMrLkC/EpQwGfwRbKVfg0e/MFNQ8rh+yIq2NB/bKwR0v1xKDhVBO1JvGkuLed70BRUh4c8igy22zj3LPDFnTnx8hzS9612rBjgSUWGx48haHxko7c5pQc+XH7BbeizTyXYx6O8oKlHAYpVsXMqa9/APPlZCwGuj4HSWImJ71o4nfnxd1F1qgEe2bK3HJSGNI3/CW9WOVhuHJIqAiYeuFtV5jGe3S/rw59LeeKsDRrUBRV9lICjiClDIf9obaVpJpjEczDbokg34Jt8chSZCvkmvBGkaCWK5v+7OOTbVTSq2KjQQTEqExpRmzSK9+8hPibTqD03Iy7cVtmv5ewEi55vXwVcsdWure3LsoRlzrErOqA1rjZapRvMT4y8uoH1L+O3DF0Lt1vKU/VVUR5WkskabPSWXIoauBjZXcthUDTHfVyOcWJX6KyVLSJYEHRt6er43lMDlkS4h5zbu8pxGJMHgIO/wvwjaQcSOogcP84nPgIdiFz9jdLT/dstDojScltelxVqrlQFckz2Pc8biPzQeBANY7X7Pr3vZoYxFCuGJ5te1f7yGYI0Y7fCJjc08R+B08b24EFqovIvgfLAq6hKKfEIgKLfRDLQhL/6meV4aMXcfiQOfDnBasUmyj7CzanMPolU1BxIMGBJtITNJQ11dhmYCed5sJbiI+2ZiG1uBYyXrr3w+uT1fB78AjVRnpLVaN2hwMf0aegzgBUtyieqw6z2wMt0nrm5kTsZPQbXd
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:02.6677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a3359c-daea-47f8-dc2c-08dc5e6ead6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845
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

- removes the need for a nvkm_device_find(), which is going away
- will be needed later when cleaning up nvif_driver init

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 13 +++++--------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c0d74be4c47b..8d34a4cf2900 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -561,7 +561,7 @@ nouveau_parent = {
 };
 
 static int
-nouveau_drm_device_init(struct drm_device *dev)
+nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 {
 	static const struct nvif_mclass
 	mmus[] = {
@@ -577,6 +577,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		return -ENOMEM;
 	dev->dev_private = drm;
 	drm->dev = dev;
+	drm->nvkm = nvkm;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 
@@ -863,7 +864,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, drm_dev);
 
-	ret = nouveau_drm_device_init(drm_dev);
+	ret = nouveau_drm_device_init(drm_dev, device);
 	if (ret)
 		goto fail_pci;
 
@@ -894,14 +895,10 @@ void
 nouveau_drm_device_remove(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_client *client;
-	struct nvkm_device *device;
+	struct nvkm_device *device = drm->nvkm;
 
 	drm_dev_unplug(dev);
 
-	client = nvxx_client(&drm->client.base);
-	device = nvkm_device_find(client->device);
-
 	nouveau_drm_device_fini(dev);
 	drm_dev_put(dev);
 	nvkm_device_del(&device);
@@ -1409,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 		goto err_free;
 	}
 
-	err = nouveau_drm_device_init(drm);
+	err = nouveau_drm_device_init(drm, *pdevice);
 	if (err)
 		goto err_put;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 683600db4ff9..35dfc95b32ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 #include <nvif/parent.h>
 
 struct nouveau_drm {
+	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct mutex client_mutex;
 	struct nvif_client _client;
-- 
2.41.0

