Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C323993CD38
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE90010E1B8;
	Fri, 26 Jul 2024 04:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gRpZRJm+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F04310E1A1
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OULW8f+T/K+nefg0Q3Q5ACR/bPkhfM133QKIIrflwYCj5CDeTfGTflXIjsktE/isKOWKO5kWVMfLOaXfq0HjdfxXKgqCqR1EXuIX/URlhroQzCzppGwkqTyuRlvTRElhVBSt0knQwk7b6O6/fsb3x0K26fCekj4Kebr8mLch0cd9mpfIxybkvkqilDH7lAk3BAHOUowieDV5qYMgD6KniryqzsdLoa8XcAjMNC4jiAipTFg+cVIUxnSPOufRzAL9GBoLZqkqb8VxQ7yHcr5692q3kQtEwROz/2w7pMcx8mw9zxKyChOz5aYpICy20fi1r4F2jVtX00bRebQVTNJdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7+xR3zG7r15ZVTXhPMNWy2CUfIUPms6jgREQYUzFVM=;
 b=Y9fD96CQ9osM4O+jW6m2+WN3ir21I0gW9Enxw2roUx8Qd45tNejzymewilAfDrLngbXSWJnbgAyCVZOziwFfsyYU01cdZ3G46N1j8F5+x2fN7OZ7n0DCMgBPNgQiJw2wJY6ZDcL4RDsc17MpcXqLAUullLdK2hEUefnfTnd1WKSNOKuwF7jr/AmnoYmF25AuCKTDy/CjsHknO6jhzpUomsafKgqvh9v1gsRcF1EVcElBxf6aP4xMIC8lfCu/z1Nqszqjf8o125rJHeWtsn1DdyCHJQCA7PeCDRyfWCwep9kxjV+ofT77OAin0sqsPDyAJLW2Wb2e7vOgX0m6PDA5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7+xR3zG7r15ZVTXhPMNWy2CUfIUPms6jgREQYUzFVM=;
 b=gRpZRJm+YsIFqMRKs6flKIkD/LzGpSI6uqGjP+5wSiv7TZQk/sKsr/8w5XYp+pWVscaxXh7l6G++i9QfvFekeYxpbpK/5yfc3pJGNXuDauk8PNPI5+tF+2vd/tzcQbvsUWWrUthbbTuWLb2PZdszaZ07fmcJmMsoRDsan3CNdmyxSvcfOSSJpnPwq5lr04iuaIfNYQM7nssR2I4EgQ+wzLY0pIBLX2qv/GwU/jqgC7Q16iTHTXgkpecJCbaxV8EV1dNFkQjMed6Kj80MFMViC505WoW+sNd/NGXZQSkgslJ0HZPSUB/2PP8kjx2ijOHZP8b+rLeE01euARptsU7+1A==
Received: from DM6PR08CA0053.namprd08.prod.outlook.com (2603:10b6:5:1e0::27)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Fri, 26 Jul 2024 04:38:55 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::59) by DM6PR08CA0053.outlook.office365.com
 (2603:10b6:5:1e0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:38:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:48 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Date: Fri, 26 Jul 2024 14:37:53 +1000
Message-ID: <20240726043828.58966-3-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 144ddd5a-dc0b-4f07-ccaa-08dcad2cdbd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zg1pxIlWmF85la5SlOls6t/8OEjiwvHu7VWEV54lvniZeerY0BDx2UVXJ8xi?=
 =?us-ascii?Q?DU79d2EjDbz8PVGS7K663xIayowFMNanH9aumTEG8ygkR8yu5eH7GQ9TrvVm?=
 =?us-ascii?Q?sGnd2dFeBvsWR2BrqApuNqtZdvse1RWFxO+gs7IYV4dE+OE2f5VpCqoaayTV?=
 =?us-ascii?Q?r6YCwFSrEM04bXmY2a0OM/dvb4i0dotjONZ0UJkjzG1SmJOgQit8UAsguhr/?=
 =?us-ascii?Q?hvlG0ZJg7Yfvwn9XmFlxZr6oo+0uCgOQ2pO9HSMlovyUS4MJ6jC3qY0iRq9d?=
 =?us-ascii?Q?jogjlK+JT2d6tuI70Vvd9xLNYg/kOiMfc/Q3Ubm44KfbT/G1oXQFtw/CLjWb?=
 =?us-ascii?Q?BeZ9yGGoy3vKVAdqiuKTHs5NXOuj9UBVOgqpW4IQgUeYxu2EG7jDs2GrzP2M?=
 =?us-ascii?Q?lWwcZQJeaCD0Z6TW57/UcMsAWYGRLlFvxTKsmq7v3Mt/iRor/h8pe74Pyoo/?=
 =?us-ascii?Q?j4Tr6GQB8GkUQcCNb4MiJjaLKth8f0K2iV2/bB3kEnEhAJ5mFb5isX7m3MY9?=
 =?us-ascii?Q?JpeCW6OAO4ednUSAhlUc6LRVR6mZijuwOkN3LsrRqXVj3ietZE17IRWEUjdS?=
 =?us-ascii?Q?vvNlG49hB3y3YkvVOIVnuf87tknzbDY3WK8eZG6shmyDkjhfXGZw8X7tEWF5?=
 =?us-ascii?Q?bni/ZeTKnxB+omB4GrZM1zce63RG8xzaY+f3Zb2Nyr8dRHjrw5suUoRTSXIf?=
 =?us-ascii?Q?v0Oq1reU45LlJ+cDKRyYPGRhL9xQKdB8EV9k/HaL+d5PUtscUCVCN7EE1QIU?=
 =?us-ascii?Q?4yd+M0G+6rMW8chHFm8izYxj/JSsDHA8xDgqdvrQ9uFkrekrE9WgQk9uyKO9?=
 =?us-ascii?Q?PX/QBgdsnOSsHp9tbZ0bldaAlZGLO/iT3K516BlH+IVHurJa9/c9EwvrG7LM?=
 =?us-ascii?Q?52ABMICSVTGOWQsirT/jBK9/jeGpPNRFSWrtu21zJ6Met0BiQboQ51hqI6xR?=
 =?us-ascii?Q?lJoQKo2G9jiPitQN5ijdnUVLyLjxJQIKFPBvHbI2iRyO+CHuqjBDhVezk/K2?=
 =?us-ascii?Q?ZAgM/QVH7hOp0V1D7AOhkTOY244NAjn4OfJBjpeAXApeYaaZHkyNlmD5nHrA?=
 =?us-ascii?Q?BEhwJQ0yylIEBoELpF4cBs+hFKm1PhJxFeQB4Cqeq/BjnfDfZuBo91Zk4qsH?=
 =?us-ascii?Q?7eobA+xJftppZvA/CLQdelxHl3u4wQyAHQaWGIj2wI8hWKyiXOGcmsOx1qGU?=
 =?us-ascii?Q?99JGNocsrTSAaVpRBijcbZug6pAX3hTIldVYMd69rImKXtTuEpFqcMfOG4Lu?=
 =?us-ascii?Q?/Xnv+ugO2tzQvv8IT5XvwRTxPEwLhGrW9i82ZHfwyUdF0wFkhVhlmCKBzBYy?=
 =?us-ascii?Q?xlwmW5oH80JFTVanu+/pmDFjITa0J77K89hbWSW5INQY3hwnGeMz5W8F2as1?=
 =?us-ascii?Q?D6upp+/xcdIlAqF+xn7puOmMoqVdJKTG9FxQG69OobxQfKViOAKoHt0Gw236?=
 =?us-ascii?Q?lBXm5oeLqAGr8MB4JkEcOwR+n3nABDYt?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:38:55.6527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144ddd5a-dc0b-4f07-ccaa-08dcad2cdbd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448
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

Unify some more of the PCI/Tegra DRM driver init, both as a general
cleanup, and because a subsequent commit changes the pointer stored
via dev_set_drvdata(), and this allows the change to be made in one
place.

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

