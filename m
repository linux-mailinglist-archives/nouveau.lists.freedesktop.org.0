Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D68D11FA
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7BE10F684;
	Tue, 28 May 2024 02:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E5Rtrmqh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009210F933
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqmJQ2KP9BOQoAyc3Vm8KMRiwQ1IoR65DvT6Es17V2V4idUe8UWWJyGbxtG9hcZiQxIfk8qHZm2lxvGTiLkEATzGIgk6FZNtLDalwa26oRyupiMgmHnyOqDpi1uUAMTcX9JpwCk3MyUuMGvutxVNleYmnyfbbHcW1L33RCkVYPwvUP+s0GWmYlln9DZS1d0IusK4qYc8FxcJingEdhGIWp78k7hlSWFPQ07msF0EVJX1zRqk2znTfenhH00wjW+1u5P2oWWuj8jcggkbOgOBePGLRFWj41WNFXlUDmAoUs/AbU4qWCpFTaCUKrIwY6KeUtVhOB90Xmr4udlDei8hrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRHWTWusvzzm6a7tAjFOf22Dm4IKaYo9tgxNZT9XIz0=;
 b=BddrRXvob7lYC3B4N4VPIiT3Y7Ofb6PgUhsdXc1eVo5x0X0axnasu5/5x2TtCFq9xEDCgQ2JMbUzsjYccse9aiDnVJsQY2Ysh5wZtwtnEh+KMGlDidsIN+rWVXBaoqShWUts/JKUNjSaj+NR3b+YjKtTdhllCv7mU/KdKlC/VbnaEb6HjP/Q1/P5dgUFP7dFQGobXBvWm2MlTrKXPeCX/6hKd7rZLZN7rubVuMSebqtehBGhydo7rNeydOMdqScPiF5Y9OLFOnWxPOBlJd7U/j+/xCO3IyGZPWluVB0LHc84h00tm6TlhlFIOTBcF6H9Ze/lqMy/6gjCicdstI2/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRHWTWusvzzm6a7tAjFOf22Dm4IKaYo9tgxNZT9XIz0=;
 b=E5RtrmqhgFAH5NB6cnXjhWebsGtsMcbc/UaFk0H8ELAML9W6xtL1udkPkXmPyMu0LWCo4mOBJChpciCpVB0zZHrZeK2Yeq3qb/RE5AB6fDQhEhfveJjvLWgkwvbFtXLMcpO8h51PkbMBGw1jUv/CKGng+R2x8JdPsJy/y7gzZ44tc+aDJy/AHNstQhAWnE7C51INpY2GPSXJEhl0HnU6WzUTOHfezQyT5SgulpaaB+W0FAsucLJztp1H79xWrLJnlzsN7eqMgFtRc4ey8w8IR3H/wonpjXcTS/duJK3jDQTRhx3QBCCF3CPtX20sNSrss7IkNI1BoJOoX1Ykcc3JHA==
Received: from PH0PR07CA0113.namprd07.prod.outlook.com (2603:10b6:510:4::28)
 by DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:32 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::ef) by PH0PR07CA0113.outlook.office365.com
 (2603:10b6:510:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:20 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 21/34] drm/nouveau: always map device
Date: Tue, 28 May 2024 00:19:46 +1000
Message-ID: <20240527141959.59193-22-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 01922485-cd00-4e33-56ce-08dc7ebd2b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mfV+Tr+YxtG49kAxFG9CYbJuPhyIK/KjVXt9JVoxAb5b6XkHGIfwFtrsq5He?=
 =?us-ascii?Q?eINQOMZDXNCyYDBHHRJG3cDEZNgcKZkACGtheAxxanJ/uTUar1cml+O6cEyY?=
 =?us-ascii?Q?HjR/O5OUtMfZetbs1YgoNWeU6u5+gwCDiHbzUvHKUrGIN7RY7YprG2rQqy2U?=
 =?us-ascii?Q?OjV+KMQRiuUjhWy12JvSoGKEa5GTqSMQ24N+dn5CpgeuD2A+HJJabxhIybCz?=
 =?us-ascii?Q?Xrn8FTd44/lsOmOEm4QERoLotnkjwbEty/bWQ0aZclv8RnYmvp60IvU8CO+w?=
 =?us-ascii?Q?AaYI3oiY73SvmVgRnhRbXLG0H2K1MnLreXensjZNYi2G0Syq/cA5l2AdXUMg?=
 =?us-ascii?Q?ulnqxjQunagdT/q/zU4jbEC7ZgBcIxzQqxAI3aUP12uRLwLEOtugzlutaFVl?=
 =?us-ascii?Q?SAgFiKfALjWIXpzBc0sba9+rPYua2a00RLliZV8/sWR0qaDv7ohTQ5ol5hAa?=
 =?us-ascii?Q?swTg29QADLYqRHOq4wf+p8mtVdqMQRf9enokhQnz5Uo5FxMy87WBGEEJqhHR?=
 =?us-ascii?Q?pvkTnELQmzPIztkzDGJLkOnME8pymFa6YEYkel6RiOeBYPe+S0ivsxrgBVfU?=
 =?us-ascii?Q?wr16wujgDOEgkMyFbsFO7q6xgpRy43aOwXA0l+XP0ilLT8q/DVQmGwjKS6iI?=
 =?us-ascii?Q?tMB058LqjVhiz/jKHhwHyvkbJ8DGx8WW+H+y0P9SoWIEEe04/LIWPMRf8qH2?=
 =?us-ascii?Q?aivIk3wrXpzr4fK8UafoQQB8pitvbpyqX4xp9ex/jzW+sX+M174rW/HLzATE?=
 =?us-ascii?Q?GSdVlaTV8d9aaVbTMT06D1eQkawMselZU30LeVaqF+SGF9WQRx2rlFNKRdBq?=
 =?us-ascii?Q?VJmybBY6Ri1SGSlY8ttW9ITib9wwh+rek2LZvUFVTCZWOsQjwXMyZs7lJrSD?=
 =?us-ascii?Q?SqUUx5ql19jP5YOmtQmfhQMqLUgfVloJgPaUkf+e06um+kj2mssrWfubRM5c?=
 =?us-ascii?Q?V2FO2EV4X7YCC08Majv9JqCV+ukcWIZtUSe9Dgq0YB01GPIQ7ZhasOIqHsxr?=
 =?us-ascii?Q?/9Lvp8Gx4Jr4jXHMC6agCfaSIfhechKWuPjzin/OKQzfkBqf1Dtycoc0scrF?=
 =?us-ascii?Q?j+ad2h83//+Q+ambO7tjjB2E9+fvmM69Vy5dEp/u9Jx74JPTIsyjdOJidnFc?=
 =?us-ascii?Q?J4ZUkwmETeEo/49cJh0UWJU4JcACSINUnnz/Od/o5c+at1wXuUY5hBU82SG6?=
 =?us-ascii?Q?s4gG0/oeMQBLTtMGlnC/N2XBml1joSyIZsxJYyStLGDieNd9CRpQMwwJXmNi?=
 =?us-ascii?Q?YU9kKIyGcODrAcst5v2AzJCD8mLF54d1S2yPqdD+gsFqlFZ7rRboK7POh+TW?=
 =?us-ascii?Q?9i1pE2M9GUD1F57Kg8i39FL1sY2XyITFtQe8eCYtT8/k9/bG+c5KqpZctFPe?=
 =?us-ascii?Q?D7uyuc8QZAmsUCMub4eUFHn+QuhN?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:31.6253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01922485-cd00-4e33-56ce-08dc7ebd2b29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629
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
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 17 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 ++
 drivers/gpu/drm/nouveau/nvif/device.c         |  6 ++++++
 5 files changed, 26 insertions(+), 5 deletions(-)

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
index dd0c211ec602..a939aa5eed82 100644
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
@@ -587,6 +590,18 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	if (ret)
 		goto fail_alloc;
 
+	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
+		goto fail_nvif;
+	}
+
+	ret = nvif_device_map(&drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
+		goto fail_nvif;
+	}
+
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq) {
@@ -666,6 +681,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
 fail_nvif:
+	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
@@ -721,6 +737,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
+	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b711e994407b..e030e3a18f42 100644
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
2.44.0

