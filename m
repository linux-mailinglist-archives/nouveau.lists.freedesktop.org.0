Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F217992AD5F
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B9710E463;
	Tue,  9 Jul 2024 00:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eqVlaayl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1F010E46C
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQh5AA/cSpQlxv9GC3z3bmCP3OhpwgFbbP88vu9mTgoRCC82iOCT3s2Ohjv4jBooVAPxpNoHSkad4f3RTwSDojFJGHpvH1eg7kV0lhP5tTm/rlHmQ+s807/zb9qnuXhu5Zbf7+4SZEX9/VpjTzXrmDTI5OoRZSw16G8E9CNBj31X1lmGXAbBMjaj+O/FF57v1hppkCdjdraQhZqutyYpTNg33s2NteRkLWYho0wqKNavY9voUCPv2beQZ9K20DlYbEfl+Ksq51gCcfkFt2LzN6n4K/ESM81+zZlJZkVpPGs+qSnK+kO1/C5hFrytmIMHOyNFCE6x8l4o+JX/8xp3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKaYqWI1Qoim1eQ2wf5rh/JMSii/ucmskWtVHvvW45c=;
 b=BW9emgWRKfKWgEMKUAHhj+3pQCeH5c8/NOOuSdht0OC2aWYnEstMEwiu5QqipdJgCiezi2Y+aR2SLnm63kihdpCJUIF2BQyxziJUu8lOXOWzPNpMpcRckDFno0Ru80r5UKOl+dNLkZjMVRbxEOsv2tUCTh5hIC13hImeWB9a/pGDUbj8ha5SLDNO6nh4nAYbUPUK2qjxX0RzB28WZzUZMSLixlcCimF4Va25rHBIblBKV83w2gO97yogBlp3gsJMoJ2OwnlDk/PMkqsrM1CpLg7Bl8ciJzyEg//EdlDsnVhVcjNniy6/RnvQYWJXHkVO+jDvSIBG+EWFGXORRy6wQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKaYqWI1Qoim1eQ2wf5rh/JMSii/ucmskWtVHvvW45c=;
 b=eqVlaayl2P9Mt74v57ZkncE7ZgqPsaAyu7lya75eWdmY5MiXt8N6yhOIS6iPLQzhec30dy42h72eTwW5FYT4lkbG9PYedvRTBQ2QHXEu52gDl5WS4PnSZmaoudkuvtBk9O2jHZtBmJZiVck11T6sTK9m69NXDrExBIu1dWxQdn+FvbhURKee8gcdmq++PyW9hBEakEc+Po0Lsh2uhyL4f8funQn2PLJYrDDs3Ip2M0S6NvD/QY6nL9zku5O7V2QvvqFfgGLoQxVne26KInqWC63rHDgBMGc6EcGDcKzagD+kKRilRdySTtVivgZ+T7CI7H0yptud57OqSJK0jbEmwg==
Received: from CH0PR03CA0201.namprd03.prod.outlook.com (2603:10b6:610:e4::26)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 00:55:34 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::b) by CH0PR03CA0201.outlook.office365.com
 (2603:10b6:610:e4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:33 +0000
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
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:20 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 24/37] drm/nouveau: always map device
Date: Fri, 5 Jul 2024 04:37:08 +1000
Message-ID: <20240704183721.25778-25-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c12f73-8bf2-4a32-a2b9-08dc9fb1d66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wQf6WZPGO4QmLbtP5FEJxRnJUz+dKWvQDIsNqXLa/5CFS/C7nqFwtl9Uop1I?=
 =?us-ascii?Q?cWlCv3qfid5aScKW5CP+jydv2YKGH6bZ2toczTbgcn5oGEx44ZvtF+VBxsRU?=
 =?us-ascii?Q?V93E/POM7CM3BWZk+5ZxZpnFXy4t6U4bfn4SJPDg/LTmwAwLMCJ/tn9aSFkW?=
 =?us-ascii?Q?M+smM/F0MoglxZcqvDozLNLYF7mNvOv+013wKr6Vjai5kn3Ywu3xEKcQwTrF?=
 =?us-ascii?Q?0qH2ds5yzd08YxOKfA2L6mjtvfxwxSBE5et1C4J742fDeUm6YTOA6A8u+l2b?=
 =?us-ascii?Q?esG/i6t4zd6WDFB78KKd4uoQh0C7LNHt1fL4nlODinHRNstGkQUC+xYWsWC7?=
 =?us-ascii?Q?j0SJC67m0r1SHgkyKxurP/HLOOTaPBoKYaPDk3BaelVmhrt+GHh1mlKor5VS?=
 =?us-ascii?Q?V5qi6o1315MHSQGzFPgaruZYFpjTcD0iLXzGmyPGPHctsSd5CEvu0gSqp2p3?=
 =?us-ascii?Q?TxT5A1jUSEyP2bRfPN4VWeFQ+ZgEKHSS/9I5VnYhLmTvzqVYvBl9JdlvYXrC?=
 =?us-ascii?Q?NuJUrZnXKDCN3NBROBQvPSldq0rkztTM0XC7oiqAcPR6J6dtFJkMX+UShnWA?=
 =?us-ascii?Q?kKgXskn6doS40Q12TPUmW84db6V8iRZiUeif8QoH9qsQgCKZuioYFRMjXHRv?=
 =?us-ascii?Q?MUdPcvoqOjzKL0NWSIfbKinPUncpMhU15Snb16HbmacKyEkOgF2jy4MHF/8T?=
 =?us-ascii?Q?bEXNav97XXQZmyqftzoCMZZcoqbIGjS90e1KV4EvaQA6AYnWhXVj7I8rL8Kt?=
 =?us-ascii?Q?hNKo2IadsW4S1PIfLbXKBoxgv63hV6Tle99h8B1K1R0hVq8Zej7Ax2G6+Vd6?=
 =?us-ascii?Q?LszcJiSc3H75Z5AR8EaxCoKS5aov5NvsnvoCjdeKgBBD1gRMEdMgtOK9IgUs?=
 =?us-ascii?Q?81thT4iXE67NNAV9GbULipuTy3AV625EElANLiNLdUF2YcrtOfOcdssREUet?=
 =?us-ascii?Q?LhSCGC79gDFlwJ0HOYSdY5t13wB8c1D+sTJW8S8xiUyPC80PuQC7t856tKL0?=
 =?us-ascii?Q?UPHok0IrJ7IxmJSl3kc5th64n3WxLc23dC2mwavMQ2ka9Whelaxmj2av1+KR?=
 =?us-ascii?Q?M84qTaUAEsJyFCS2BSfKjPlzqKFRJKRjQn3idicXlY6Bi3NkNmM2mOq/ZCn1?=
 =?us-ascii?Q?ulEXgJw6fu8o45R1BuTJX5Q6+HQfeEA2gbQHu9kTazgWCwBZ1zBPEMNAGZKJ?=
 =?us-ascii?Q?8B8/iE+6WrebA1Jzau1mK6ysoDoYwFrnLrGUwaZ4XZyFCLnRYh9wFgG1HBbc?=
 =?us-ascii?Q?uavfOsa19z4neAYWf8nxXAVHbMRscgHphZ5e5Cwki8ZisGWqeNcBdOINZ+yk?=
 =?us-ascii?Q?ww9pU5i+twBUR9Y3NidKDPoJWHtOBo5oPbQRo6MGc9Bd9NBavffs01atH7MT?=
 =?us-ascii?Q?HDeU3MruKvemQZu7gJm+64SGoyTPkLDpFv3v4mjRPfZGTYSLY6KR34EBQwuY?=
 =?us-ascii?Q?25c00tY8gWHLgRX+T15WR5tsNutBz2pa?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:33.3898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c12f73-8bf2-4a32-a2b9-08dc9fb1d66d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962
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

The next commit removes the nvif rd/wr methods from nvif_device, which
were probably a bad idea, and mostly intended as a fallback if ioremap()
failed (or wasn't available, as was the case in some tools I once used).

The nv04 KMS driver already mapped the device, because it's mostly been
kept alive on life-support for many years and still directly bashes PRI
a lot for modesetting.

Post-nv50, I tried pretty hard to keep PRI accesses out of the DRM code,
but there's still a few random places where we do, and those were using
the rd/wr paths prior to this commit.

This allocates and maps a new nvif_device (which will replace the usage
of nouveau_drm.master.device later on), and replicates this pointer to
all other possible users.

This will be cleaned up by the end of another patch series, after it's
been made safe to do so.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  5 -----
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 ++
 drivers/gpu/drm/nouveau/nvif/device.c         |  6 ++++++
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 13705c5f1497..e8b27bb135e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -189,7 +189,6 @@ static void
 nv04_display_destroy(struct drm_device *dev)
 {
 	struct nv04_display *disp = nv04_display(dev);
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_encoder *encoder;
 	struct nouveau_crtc *nv_crtc;
 
@@ -206,8 +205,6 @@ nv04_display_destroy(struct drm_device *dev)
 
 	nouveau_display(dev)->priv = NULL;
 	vfree(disp);
-
-	nvif_object_unmap(&drm->client.device.object);
 }
 
 int
@@ -229,8 +226,6 @@ nv04_display_create(struct drm_device *dev)
 
 	disp->drm = drm;
 
-	nvif_object_map(&drm->client.device.object, NULL, 0);
-
 	nouveau_display(dev)->priv = disp;
 	nouveau_display(dev)->dtor = nv04_display_destroy;
 	nouveau_display(dev)->init = nv04_display_init;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index f7c1b3a43c84..fec76f4733a4 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -20,6 +20,7 @@ struct nvif_device {
 
 int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device *);
 void nvif_device_dtor(struct nvif_device *);
+int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
 
 /*XXX*/
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0beeff8552a2..936eb32fc8c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -206,6 +206,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
+	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
 	if (cli != &cli->drm->master) {
 		mutex_lock(&cli->drm->master.lock);
@@ -267,6 +268,8 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
+	cli->device.object.map.ptr = drm->device.object.map.ptr;
+
 	ret = nvif_mclass(&cli->device.object, mmus);
 	if (ret < 0) {
 		NV_PRINTK(err, cli, "No supported MMU class\n");
@@ -715,6 +718,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	if (drm->dev)
 		drm_dev_put(drm->dev);
 
+	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
 
@@ -742,6 +746,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (ret)
 		goto done;
 
+	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
+		goto done;
+	}
+
+	ret = nvif_device_map(&drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
+		goto done;
+	}
+
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e7d072a9a477..80ffe15ba76b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,6 +203,8 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
+	struct nvif_device device;
+
 	struct nouveau_cli master;
 	struct nouveau_cli client;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index b14bccb9a93f..24880931039f 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -38,6 +38,12 @@ nvif_device_time(struct nvif_device *device)
 	return device->user.func->time(&device->user);
 }
 
+int
+nvif_device_map(struct nvif_device *device)
+{
+	return nvif_object_map(&device->object, NULL, 0);
+}
+
 void
 nvif_device_dtor(struct nvif_device *device)
 {
-- 
2.45.1

