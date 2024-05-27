Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A88D11EC
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B00B10E8D9;
	Tue, 28 May 2024 02:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TGxm4yz+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B910E227
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnlHmp8h6qLPEK2hvV8y45xrhvW7IeDDJ9DlMmYqq6n0jBfCkgtV3sSVCT9oCj7Kda3rLQ4IhW8hx3VCYb2UYqiTP+R/9+NDN+b+7Pfyb+dJtRxvNQggnSgUyI2E0Gc0PouiveaTA349zip1tmk9kadNJcmP6xblMjpOANR2lUOIZbe4krY1FXEZiYUAuxxTzcAsQA/wc1o7PMYbkPLwXRr5XdmVTP2UrnYtizi5hlDcEqpmShjSVF4kun+LYVv6GScmzM56hwY7FkMq5uFYR+rWJERBLZcW92Re3V06FYuaxYmQ/RhHGyQEW7X+XgofBtm6CE6x2zFuH8bu9guB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLcPm+5jdzC18I7JUxmE+D+slsi+KM3PEAc/Dks1UtY=;
 b=KTxxME/Wueq+Mj0RONXaBepaJdbYWNo5Dpxq1dv7/j0UoDMAnnA8qqNiAKUoXf6oPipvBk5LhSG901Yh9STXC+QIpb9sGgtrR9DwR4jKl+czuSEB1pTjUxygWaSi+WvAqefzr2VW0+iMaw8a58sI0g6j7fnHYDfwJdIy1x2yoBPDypA97id1rIUo8BYGjErCj2VKuHaG292z4ONnmZbsy5jSnnB7k3/DmeJDNFlsvryxydh3Uoxo0n/6J2wm0KAf3AeojLbpnczlS0PynKGKis2WCnP3z3leX2QSScJ/KbrmpE8QkAR/HOgPCFkwXnl0jnn2E5bjwA1fmqmHa78BEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLcPm+5jdzC18I7JUxmE+D+slsi+KM3PEAc/Dks1UtY=;
 b=TGxm4yz+Y2CDOYk/QdWOs2pse3cV2WwB3B+PJ2/9VQPzp/iSndVaUYqu/ab5hH+79LgbsvUR7lwa7/Nvcx+ByR17DIgDyEAG6Vl/ZZP8nE74/7Nlg7ltxvMyZVcrCCRJ3Uk8hbvpU3TXWDYXqO7nLu5p5lszmV1Et40UKw/KSSbim/Nmuq6tGPzoxcIJJm9Lmj952oqWsuJmKtLf7FdWxxMhKVctvs1FYrXjfcHS9VLat1aWMOrgdLEFvjMUqkzxcnlKIYQWNpCIKmkw76Mu8wEe6RnZEWRadgnXkor3k8/S6TWMTb8WpPo7XDEPEdSRP2a4q+JnBuwEpfuO99Ja9Q==
Received: from SJ0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:33b::24)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:22:59 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::26) by SJ0PR05CA0019.outlook.office365.com
 (2603:10b6:a03:33b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17 via Frontend
 Transport; Tue, 28 May 2024 02:22:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:22:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:49 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 03/34] drm/nouveau: move allocation of root client out of
 nouveau_cli_init()
Date: Tue, 28 May 2024 00:19:28 +1000
Message-ID: <20240527141959.59193-4-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 25eb43ef-0fd2-48d6-1d68-08dc7ebd176e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t3DTn7pAfpa6gcyFQo9xqbQU06NVaDbEtQqjK0gXTZFT4GbzmH+r1q7cQeOv?=
 =?us-ascii?Q?ULdfrV4f1jHq90GvGiXa8Fw8xHK9q3bi6Slf9jW8t28t1mjmuHgupjzvPWt5?=
 =?us-ascii?Q?XiwyuV3l4GV3y2neC2AyXq/YeY+E2J+9olpY0w8tTdAnVfNgcaa+ryidI/6g?=
 =?us-ascii?Q?g9KIIcCMj2VZmHuSyjt+PLP6fndcmCdIQzcHnynPQ7EO1TGYoMSn/sXpbqP6?=
 =?us-ascii?Q?1LHEx2JDtji8436UUCLbCNPG6hTNP17eHmkGAPOghu9CreAwWcWtnfUn4C41?=
 =?us-ascii?Q?Qw60dhXd8tQDkF4Ry3vl2y0AnvlaBxoNOzp58gCc0FJoXCun/OLbyc80+i8Z?=
 =?us-ascii?Q?vvEBo+uSeJMYuqqdOsMeqomV0RP1/Jk42azUwMOpj2yY2I6/RFoMcwTjLfTR?=
 =?us-ascii?Q?1bJrrzh9d64GjUHV2gPJhgcEBeQk44F6A8Uz8aQtgcpsEPwFpyXOqIq6I317?=
 =?us-ascii?Q?Xo9kjS6DcAJ6qcMjfS+mlPWmWEnmVOYe/kf0GhG5UA6TwBfvF6y9FhsY2HLm?=
 =?us-ascii?Q?5c63UKPPLFdnRLUO2mupx2DU56IyNRUmGAuETnybOvghRqOm2qzNpsqh5l5s?=
 =?us-ascii?Q?WTP89Yadgcr4YB3bUZT6BzF7joAkO69gQSBRyfbdzqUY8WzruraPqZhB+tSw?=
 =?us-ascii?Q?SoBZ/vdcQGGw/HBVWAWFsYTPXgDXVCyM2PHMx3LU+3d7RdkZ6KbFddFBUjIJ?=
 =?us-ascii?Q?3TthGSIqCevRy/YJC4uWTPkOWHFV5vUtUlewzgLEdTdlr2rBC7Liwo2yoNXQ?=
 =?us-ascii?Q?J62PptFaepNhXtw2yYJ7Gf2yr5E6I2PenQaEt2MZBEOpyCc6ezEKszvag4Xi?=
 =?us-ascii?Q?b8qCc3zaE1mK76zOJCTA5AcncJkyoo20HnKvzYNlcaRKw4JB/hUwRItagDNZ?=
 =?us-ascii?Q?hzP7hP9rIl44sC2IEDbFFKgPhRBG5ushSPDjYNe8KQ0z4FIiAxF+tiUrXcoj?=
 =?us-ascii?Q?1uzbpaKaIeYqv5f5aNGbYgmzWGghAVUw6vlXcQmeUgpjuFKXSvyXsVjSZjIC?=
 =?us-ascii?Q?jcV88JUNNTYgPQmH57pCb0hif7JQZugG5XwbQwotc14LL5ZYrXfz+lG/ETOr?=
 =?us-ascii?Q?M0Q+NBCoiHnPrB1auapKCDdJ0dyIs1Ln+R6OEjwPQN3w6oz3boGfE0crqhTQ?=
 =?us-ascii?Q?SmSi/Ml+vaj5wPLf8wq3b9/RbX1vjyiJYfwe+aWfTQpcB9o2Vyh+dw6c6QKd?=
 =?us-ascii?Q?38R0JzhLJivi/zL9HdX9YxXMtlwQov8h1gz+o31fsZ1bGfzmmb6/Bv+1qyoW?=
 =?us-ascii?Q?zIUX4THprk2CTaRaFhjCZkhci85ZCzKWPlDJ7Ar+5rn5ReJPBAd7qaUYkieh?=
 =?us-ascii?Q?dSGshvm6yYKk7pvB6hnrpbTOyy6H/IaKPYQ8j0CuSUTXalGudNYNsAOkVIvW?=
 =?us-ascii?Q?M7VyvdE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:22:58.5528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25eb43ef-0fd2-48d6-1d68-08dc7ebd176e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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

Later patches in this series will allocate nvif_device/mmu objects in
nouveau_drm directly, removing the need for master.

Another patch series will remove the need for the above-mentioned hack
entirely.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e6ed68dcef78..25b9c3b19bc0 100644
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
@@ -593,11 +592,16 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
 
+	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
+			       nouveau_name(dev), &drm->master.base);
+	if (ret)
+		goto fail_alloc;
+
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq) {
 		ret = -ENOMEM;
-		goto fail_alloc;
+		goto fail_nvif;
 	}
 
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
@@ -674,6 +678,8 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	nouveau_cli_fini(&drm->master);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
+fail_nvif:
+	nvif_client_dtor(&drm->master.base);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
@@ -728,6 +734,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
+	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
-- 
2.44.0

