Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618893CD3C
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BE910E31F;
	Fri, 26 Jul 2024 04:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="emp355tS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15BD10E246
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHG6nxfbta8HLP8ngrYqUJbZooG05gdy5x3/qYrVb0Gg8D6qfsABm0lRfKlQOuVL7Yq9J1CzyGFJ1xIsvKS4bll+R1AefE8L/oU6uY2YCQ0MXipMcJyVX2VC8hvwUEXGPrgSbR6Zu58S+RSwFlRhzwdLKYsH6qd2XMQks9wKTPXXvMsHROvmn6ukSm0TFe15cLjlKu9bQp3ng5lz2sJkvBwlqBs7Pm8DBmHWI0iY3us61DgxYsSSwjplrv4KiyCJ3O2EqXAmVcXrb1QaN9NzrM05ahm9JAqpv9uz2CX0OgHJ6wD5OWl0+21lbE974xYIC8XP9tMDZcsGGakxRMmYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g387plSCF3zlZh0dmrfbgETIEWdlMBCoRWVsnVJsKw=;
 b=I3TbjR739s6Qin7cYmI464bYjdmAweDvKxok35G2HO3bmYHHypyPGlT4vipf5srKZDMLC3m9sJr22QTFRZqNUIzA5vAmFIaJEGuwWb+wF0ToA7ECUaR8sPGy8osJ3f2He8Ncu4G37y/vZ5A6d9JiE+TAVEhqlUvZ+yVUWYF1Pv4P3gNmmyAH5n9YXGoJ6qCpmVIwXzYu2GDvPTlXmA1uGVahg/cCQ4E07R3mDHYEcqNPXAjwV52H3tOnb3sMJUK1yvr27+iULbgSnvFxx6K/udzzBFC6KI7+AIcMqnNclq11+e9HrlrbXaGtheb737wfo1KrjsWq40/DugTmhXqoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g387plSCF3zlZh0dmrfbgETIEWdlMBCoRWVsnVJsKw=;
 b=emp355tSgmYRapbPi2fhxKzTc3ISM7PYGmMwI6BTpZd+jXc5/6+DBVAesekFHkz/q4t6s2mnRiQPzrDxV+q9lMPf3wIhAOG9Z9hNTbFcylGUFsr+noBviffWNUswGYC7A3sAAlQFQleN62uvpALFLsJCfEiSU8Xk9rzYESrWzgtNEk96Bb51viDJWwF43Wqq8zmV1z0mTAdSt3KNSYpajI94Koi2fwJ+qhktZFn9VGfjkKBS3WumslhEjIG7tDH+0mRio7dgCByeMIQsoD6F28fu7ONTCkzwgWS3ozs69pZe3s1ZRfrKVZ0caMg9n1+uTvABg6uRvMyZF/QS/sJC9A==
Received: from DM6PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:100::46)
 by MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 26 Jul
 2024 04:39:02 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::53) by DM6PR03CA0069.outlook.office365.com
 (2603:10b6:5:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:02 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:54 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 06/37] drm/nouveau: move allocation of root client out of
 nouveau_cli_init()
Date: Fri, 26 Jul 2024 14:37:57 +1000
Message-ID: <20240726043828.58966-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 21370033-b7a8-4403-e396-08dcad2cdfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CjwPjDoOMzzH2FWlbFRsqyAJhodqDb+3D8W3b0TyKOM9BR2Y9NLzQgFrGujw?=
 =?us-ascii?Q?alklmSHzhcMBKPdqrT3wkWkKWZL9iMI6rWIt0EhcRJIswUE441LDR85PHE+7?=
 =?us-ascii?Q?4SX7uPMdEEElB68lKXCWxIxojlRHkia19+YbOnGkUuG5OchmHE1oG/9n7c5r?=
 =?us-ascii?Q?ZVF0j5MYICXTmXFQmaAyASpdx7kn/Usp51kx3VB3jQoDreJ9JUuIgHXyqIVW?=
 =?us-ascii?Q?ffPIzNFCvzml/Th0ZpkeIqxT/DiAw2zPSZjqvzSO+oVmRZ1UzfQq66bL0nNH?=
 =?us-ascii?Q?iGu1lijRKw62y4RkHRPQ9yMJv3r+m8HzPVQmTXEtR0lOyCNuT/4u213CVmAS?=
 =?us-ascii?Q?wrqlkBKFF03Pk5MixvPArTyHlZDCRBvW06Q7jRBXPnsizn4A+g1poKilTrfU?=
 =?us-ascii?Q?CcIUORF1ar1MO0/VqnUg2OG+g8cRDeZe1Oav2DH0ccaUanYLT9TGYd9SkF6q?=
 =?us-ascii?Q?OSVURcePlY4f49wBHCaXNVksyV6A6Gx39+rlVj4ePOAy9F4JRmhSp7n6l/DQ?=
 =?us-ascii?Q?qmE1eDam93Ohe/3mWU1cnB1ruqvTmNOrvyM8kaiud9qeVyna+GagNTGahv7z?=
 =?us-ascii?Q?T+EqrXhLmY4UbkliHlxpahLLlgxDK4dYR/Kriy7Aao6ZI49bciLXB9z6nIDw?=
 =?us-ascii?Q?h9hFCXTVbo5Zf9ZCKJ6ly3dhkNh7N4h4w8+9ITrAE2vm8Sou+kaeXWQPt8RU?=
 =?us-ascii?Q?/MfXLttS0E1Tf8ULCCcKSjiRRC21Cz0rPngKEEO7en9sVkQ9hh2gEexUI/xc?=
 =?us-ascii?Q?mKA9uk9LZ6FKMc7DLQEVNiOd1gU4BNoVvEcVRg6VTU7TXVU9tqfxCDLjFEh8?=
 =?us-ascii?Q?o7irwdna/DeyJWX828nNcteUACxAhBxH+W8RU/2wu+CDvdik8+HNQ3xQDoGA?=
 =?us-ascii?Q?ftW1vFTA4cqawKdKtPbx7t0zdPIARva2LnmV1e1RifYa7c/fh7LFs9hkSwXs?=
 =?us-ascii?Q?GF44tOEWwmUzVesLBDkHzCugnd4i0KhlKGaN8aFmSceRcJDwxVnUSVXZp6Fk?=
 =?us-ascii?Q?MKwXKe11agcYvp6oAgwlDjCysJ4SMV+y1agxrmzBn41Vg0SrOrTgVC6SFvCh?=
 =?us-ascii?Q?0uZ4C7CSCohPW69cHo28HO3/Xj2CXqL0ZvozPQ/g3/JjabyA9tcfp5LZt4k9?=
 =?us-ascii?Q?L8xCLZ5ND1YpWQv7fIZlv3jxbB1E0jKiNhm/MzIre7MaxqzdSTaBEDLAEoha?=
 =?us-ascii?Q?DSREV12xMlrXUvrPeuTfP6NLKbZFwNrXQcbaFH6RQ+KUwQGlKtNmkpHeyTPc?=
 =?us-ascii?Q?fQyAXeJs0T+p5F+A/fFbdfQvgGx7kKK+BFakSaVLTb7kOkAqT3pCp2osEuH3?=
 =?us-ascii?Q?xpWZLNlRr5v+NnHD7J3gy8gDnv9Q+oPQiElf7M72K0OptKyc2zMS4dSQdUxL?=
 =?us-ascii?Q?oCDodrZ1mmFaxUNaN1f1VFx2ty/3I2P/p8lpGG7g71G0wuMv9ZW8e8+/Utar?=
 =?us-ascii?Q?I0/4UkP75oxSJ/OEv2c1TPnSj/Hrxqu/?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:02.3904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21370033-b7a8-4403-e396-08dcad2cdfd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238
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

drm->master isn't really a nouveau_cli, and is mostly just used to get
at an nvif_mmu object to implement a hack around issues with the ioctl
interface to nvkm.

Later patches in this series allocate nvif_device/mmu objects in
nouveau_drm directly, removing the need for master.

A pending series to remove the "ioctl" layer between DRM and NVKM
removes the need for the above-mentioned hack entirely.

The only other member of drm->master that's needed is the nvif_client,
and is a dependency of device/mmu.  So the first step is to move its
allocation out of code handling nouveau_cli init.

v2:
- modified slightly due to the addition of tegra/pci cleanup patches
v3:
- move nvif init below drm_dev_alloc() to avoid changing nouveau_name()

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 36 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 140e27af0d64..eb154b44c154 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
 	nvif_device_dtor(&cli->device);
-	mutex_lock(&cli->drm->master.lock);
-	nvif_client_dtor(&cli->base);
-	mutex_unlock(&cli->drm->master.lock);
+	if (cli != &cli->drm->master) {
+		mutex_lock(&cli->drm->master.lock);
+		nvif_client_dtor(&cli->base);
+		mutex_unlock(&cli->drm->master.lock);
+	}
 }
 
 static int
@@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	if (cli == &drm->master) {
-		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
-				       cli->name, device, &cli->base);
-	} else {
+	if (cli != &drm->master) {
 		mutex_lock(&drm->master.lock);
 		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
 				       &cli->base);
@@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
-	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 }
 
@@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	int ret;
 
-	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
-
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
-	if (!drm->sched_wq) {
-		ret = -ENOMEM;
-		goto fail_alloc;
-	}
+	if (!drm->sched_wq)
+		return -ENOMEM;
 
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
 	if (ret)
@@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	nouveau_cli_fini(&drm->master);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
-fail_alloc:
-	nvif_parent_dtor(&drm->parent);
 	return ret;
 }
 
@@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	if (drm->dev)
 		drm_dev_put(drm->dev);
 
+	nvif_client_dtor(&drm->master.base);
+	nvif_parent_dtor(&drm->parent);
+
 	kfree(drm);
 }
 
@@ -762,6 +756,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	drm->dev->dev_private = drm;
 	dev_set_drvdata(parent, drm);
 
+	nvif_parent_ctor(&nouveau_parent, &drm->parent);
+	drm->master.base.object.parent = &drm->parent;
+
+	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
+			       nouveau_name(drm->dev), &drm->master.base);
+	if (ret)
+		goto done;
+
 done:
 	if (ret) {
 		nouveau_drm_device_del(drm);
-- 
2.45.1

