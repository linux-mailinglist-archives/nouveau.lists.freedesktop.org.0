Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C902892AD48
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354710E316;
	Tue,  9 Jul 2024 00:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3T+Wrhg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E037910E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eao4itGX4qoO6DqDpNeSY99p85JNmKV9gyrZQkPHZ/Abey8hIQKMF66nZuXr04rDkYd1Txow0WHgrJAQ+UWuoCnoCfRE25qABnyg3fuLILpwmMNzrmh6Mo/CliNG9LNATS8yDUuho21GQeBPFjYUkznuABVf+ZI+xNZV4pkz2AiLgTlDC2hOn/BkoyGksqUkSwXdEzTZsFpTVfCZUvqhw73YXn9MJtNl51Lk3ukniAMni+7kwg/0mJ25V/ZfIITzI2DZhLuhrfQlM0Wj8ZHvICEEEGK6kAiDt3KDwqd9BQq7bMKr6DETbbTz3WZPkHJ4dKAx+RKhfk4VZc1gKBr3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qspD7Lmd5ZWCAig9ZPY/+leB2Fiv02Aa1gZRlu+DoDc=;
 b=S9X8Tvg4Iff+NgpF0FBUcxoYl8WO5Tee686RVONI2KZFMnTD+HmyijLTCaqMMqUEOINO6u4AjnVLDxkPUoU3uqWKguiap/Rwqla9mPBAhXMfwH60y8gxNLqSGvQS25RXpTOzIJSt8LktNegwGhWiqq+zLM07DoydSEyPTLwKb3SU7AXGnXYOf5pb5eC6X4B2LNowbNKYXh5BMCKRGilemLW+KeHKwwaXpFQTBCz/Fje3vD9UR7Dfs7iIUGiFtauLB8y5KQ0NoIMkuoAg8vXLmMMcs92emK1j7vH8Cp+F0b99F7HSrK4adiJGG7JLm2VIoqxnWnyMFoVA92vmXheDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qspD7Lmd5ZWCAig9ZPY/+leB2Fiv02Aa1gZRlu+DoDc=;
 b=J3T+Wrhgq2WGyKT/5zz6KKux6w7Z+adAY6YDNv5EblX6KAC67GVJhLqTvckrWiSmbd2BbZ/bwUVp3GqBkt5AplyjwwvQ/EbHW2hiFr6gnXCvxzdc0jH+S8nZg8VoVRLvm7haz/T9431ICUI9HRNkjyfklNrl1+IadyfCqUndrP0FWIQInZMeu5X0OZyGqaqj4g5hxgmFbqeFVyw7hKt591mtL8M0Kd0SFoLiFYMAEq89ZbBB6JauBioXtHkxECgJIWVq5wgVOHS9FubdE9eeeUv2zlc+eTZBlm62wfuctiySinz/7UCdLVBx7jvkU36vbeTx+89igK3UIMPQoL3g8A==
Received: from CH0PR03CA0196.namprd03.prod.outlook.com (2603:10b6:610:e4::21)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:54:58 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::21) by CH0PR03CA0196.outlook.office365.com
 (2603:10b6:610:e4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:54:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:50 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Date: Fri, 5 Jul 2024 04:36:46 +1000
Message-ID: <20240704183721.25778-3-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a0c69e-04f3-4448-d354-08dc9fb1c16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nY+wKGHKVplPl+nQVFJFji/OnWErlYji9n/VAetqudIxw/7X5BMaarHjdJma?=
 =?us-ascii?Q?il7/BwpfvuMN8GzDKreDxctDnkx2yamoWqpIFAp0SiPqtpnn5HObTZ4Ung1N?=
 =?us-ascii?Q?sTtUm3fpJuMSukfD9n1hSyIAJkoQjta6CE62NGzvGWCYg5r0Ce3p/9/QwTPs?=
 =?us-ascii?Q?wXaCCDuhtUxG+D2ZdbvMRfFCRwZ/bV632811k4UQtqi4Z53vtzIMWwInhf/x?=
 =?us-ascii?Q?dnONceJ1d7sW0NKuabEAOge7053eHDyE/8yutJG73RFnYt1+fECze+AMAAGN?=
 =?us-ascii?Q?0N410ndzyTl1zrQEQDtYPO99QTzIohOVNkpNHSzkQgL7/4SeTj/kPYzxlOna?=
 =?us-ascii?Q?jeDY5f4xSQmD5tZ8EcNS1wrwL2zaY97Cvmus4i3lP4WQ9qUidE/ymvHvBW7H?=
 =?us-ascii?Q?/zSSeWhQSuRi5yL2sxWurmrqVX4F/bBuDRgkwFGwsHAeVxKROlxvJU4023At?=
 =?us-ascii?Q?aaECLl3zvpL0SIUJG9elmfJsqk79Dppvc4a+xkDDhoPlO1kZuYf706GDGjoB?=
 =?us-ascii?Q?s7/Q0cgarfW0TGmUpKSZ/rsjlc3omoXgtpVYL6Qz6ZP+Daufhd8jf/25Mym3?=
 =?us-ascii?Q?QQAEtu2UijGTIDm+vvhnl4si7wQAJgmt2le6QZMBpn40U0KUrOBfHc+3pnc3?=
 =?us-ascii?Q?U6Oj3EyhbyswYSg0195LSlc9KbXR1ntLyQ4ltu0cioXhFVYhz5yObsq9I4tj?=
 =?us-ascii?Q?DyDTecFHJkOIIj0Dd6B8U7+VNrYWSRH+8jbC5JR78VeNJAqmwPbtaa6TNUqn?=
 =?us-ascii?Q?ftJ40xYVs/CyH7XSEG2y7l6yaxhD8HFRgOjSgUN3Fm+MgbTVDasRlHyDparH?=
 =?us-ascii?Q?jgU9DL/onB7SQY4d9wKjyJgokPu0SIokMTSEOV+QPIQuxXRQiMHhLP0eCRWO?=
 =?us-ascii?Q?ycMPGuwbchPl7b2bH5WMi1SrtdmyqPvZAv5q13gmWPS5B+xhi93kHsRrpSri?=
 =?us-ascii?Q?0+I95cnYRsegUxORexf8S5Bw5MM9BgO9C2A+4bf9K0VG3CAZX6hlA6dBLMLB?=
 =?us-ascii?Q?NrmO1qxz2eLQo6bJt7jSZ1/q2kfGwXu+T0XqmFgJSiKRvr/d7h+hHTz98qvR?=
 =?us-ascii?Q?qV0sh+JRm0qUsimqlhxSDLbU5sUF2bFV7EHbrOnqXKAaVSpdKRweVXC9ns9L?=
 =?us-ascii?Q?SBSQMjcJr0gK4ON2dRUQzWwdWAJ0vKa3l7wqBegGZSW36gm9RsSthoDB3Rcn?=
 =?us-ascii?Q?jpv3AePlVwqZvOXIEjy+Zqb9RG+o4pWYkZ2l25V7Fbd/QMeJEEhWrwbBeuIb?=
 =?us-ascii?Q?0zTT3NWaq7VXB4CH6ktTkGCH1fgVwDB84qPocbzu5rteSqBAhxz7uBUZttk2?=
 =?us-ascii?Q?OXMr2oqUIAmf5H4ShQ4hATyff9J1ho8HpKKA4XnyMqzLYH2uKPoSVQs/7L7q?=
 =?us-ascii?Q?LQsT+w4v6QH5P7vKrNfUO9yM1xYGKamISxprm6YUBT9Z+T0UReK+xIN9EN//?=
 =?us-ascii?Q?6Bxhksu4GkT57ICfbRtPKGZMicfh9AmZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:54:58.1392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a0c69e-04f3-4448-d354-08dc9fb1c16a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
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

The next commit will change the pointer we store via dev_set_drvdata()
to allow simplifying the code using it.

Here we want to unify some more of the PCI/Tegra DRM driver init, both
as a general cleanup, and to enable the dev_set_drvdata() change to be
made in a single place.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 93 ++++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_platform.c |  6 --
 2 files changed, 60 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index eae48c87e3d5..9beff8737617 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -628,20 +628,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	destroy_workqueue(drm->sched_wq);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
-	kfree(drm);
 }
 
 static int
-nouveau_drm_device_init(struct drm_device *dev)
+nouveau_drm_device_init(struct nouveau_drm *drm)
 {
-	struct nouveau_drm *drm;
+	struct drm_device *dev = drm->dev;
 	int ret;
 
-	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
-		return -ENOMEM;
-	dev->dev_private = drm;
-	drm->dev = dev;
-
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
 
@@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
 		pm_runtime_put(dev->dev);
 	}
 
+	ret = drm_dev_register(drm->dev, 0);
+	if (ret) {
+		nouveau_drm_device_fini(drm->dev);
+		return ret;
+	}
+
 	return 0;
 fail_dispinit:
 	nouveau_display_destroy(dev);
@@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
 	destroy_workqueue(drm->sched_wq);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
-	kfree(drm);
 	return ret;
 }
 
+static void
+nouveau_drm_device_del(struct nouveau_drm *drm)
+{
+	if (drm->dev)
+		drm_dev_put(drm->dev);
+
+	kfree(drm);
+}
+
+static struct nouveau_drm *
+nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
+		       struct nvkm_device *device)
+{
+	struct nouveau_drm *drm;
+	int ret;
+
+	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
+	if (!drm)
+		return ERR_PTR(-ENOMEM);
+
+	drm->dev = drm_dev_alloc(drm_driver, parent);
+	if (IS_ERR(drm->dev)) {
+		ret = PTR_ERR(drm->dev);
+		goto done;
+	}
+
+	drm->dev->dev_private = drm;
+	dev_set_drvdata(parent, drm->dev);
+
+done:
+	if (ret) {
+		nouveau_drm_device_del(drm);
+		drm = NULL;
+	}
+
+	return ret ? ERR_PTR(ret) : drm;
+}
+
 /*
  * On some Intel PCIe bridge controllers doing a
  * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
@@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *pent)
 {
 	struct nvkm_device *device;
-	struct drm_device *drm_dev;
+	struct nouveau_drm *drm;
 	int ret;
 
 	if (vga_switcheroo_client_probe_defer(pdev))
@@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (nouveau_atomic)
 		driver_pci.driver_features |= DRIVER_ATOMIC;
 
-	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
-	if (IS_ERR(drm_dev)) {
-		ret = PTR_ERR(drm_dev);
+	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
+	if (IS_ERR(drm)) {
+		ret = PTR_ERR(drm);
 		goto fail_nvkm;
 	}
 
@@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (ret)
 		goto fail_drm;
 
-	pci_set_drvdata(pdev, drm_dev);
-
-	ret = nouveau_drm_device_init(drm_dev);
+	ret = nouveau_drm_device_init(drm);
 	if (ret)
 		goto fail_pci;
 
-	ret = drm_dev_register(drm_dev, pent->driver_data);
-	if (ret)
-		goto fail_drm_dev_init;
-
-	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
-		drm_fbdev_ttm_setup(drm_dev, 8);
+	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
+		drm_fbdev_ttm_setup(drm->dev, 8);
 	else
-		drm_fbdev_ttm_setup(drm_dev, 32);
+		drm_fbdev_ttm_setup(drm->dev, 32);
 
 	quirk_broken_nv_runpm(pdev);
 	return 0;
 
-fail_drm_dev_init:
-	nouveau_drm_device_fini(drm_dev);
 fail_pci:
 	pci_disable_device(pdev);
 fail_drm:
-	drm_dev_put(drm_dev);
+	nouveau_drm_device_del(drm);
 fail_nvkm:
 	nvkm_device_del(&device);
 	return ret;
@@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	device = nvkm_device_find(client->device);
 
 	nouveau_drm_device_fini(dev);
-	drm_dev_put(dev);
+	nouveau_drm_device_del(drm);
 	nvkm_device_del(&device);
 }
 
@@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 			       struct platform_device *pdev,
 			       struct nvkm_device **pdevice)
 {
-	struct drm_device *drm;
+	struct nouveau_drm *drm;
 	int err;
 
 	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
@@ -1377,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
+	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
 		goto err_free;
@@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_put;
 
-	platform_set_drvdata(pdev, drm);
-
-	return drm;
+	return drm->dev;
 
 err_put:
-	drm_dev_put(drm);
+	nouveau_drm_device_del(drm);
 err_free:
 	nvkm_device_del(pdevice);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index bf2dc7567ea4..d0a63f0f54a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -34,12 +34,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	ret = drm_dev_register(drm, 0);
-	if (ret < 0) {
-		drm_dev_put(drm);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.45.1

