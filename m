Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A593CD36
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D5F10E16D;
	Fri, 26 Jul 2024 04:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ldBkdSAa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC010E16D
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTBmExYxoKpkBvKooQvhJf6olbCx5SfjghkIRl9TNelqZ0yrcLRkQo2GqikY0c4XCb1x5fbS0HDeWjdf6zZhp/1SG5d+UbqozNhjIDmEry8C3DZg8Ap9c4++kvVH3eppjINxiNCnsYSVnahfepp/voJ+gVTIe+Y2TAI3wc9obrQMskRcNfxlZPcKWBwwIa0M2mdCr8VmFyTkBHo9LbYDi4KYAnebyBtGUAPRtKycN+k28i1EAzVHmm1geHkp5Ja+tJybYoqDHQaZVZ/4ly/Ikkx2pU5nzJwc4qcycQIuNQSu03GKqs4oGdgfWrEzueydtCGwhzYzfs7f1dThap+boA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9b6Xp/sp/oVzQ0onuPQR0X1zAfr35Sq6OTDk+fI0Cg=;
 b=OMtDKaWuZ3ODmTB/mq7MgsWtgjEhyQ57rKAqcSRVLrNXYQJwfFCD0/RKzchO9iJqsUfq0SmA1b05KGsEer9EbijnFRemBk5pu07ISHBERHGkCYEcUqjvmqPKxf6rhGDScdo1yizq+oW9q2z+cDjj0bpMabNC0nBVlK4DczxXxQa2MBtx6HCMi6crMFBp2RImAmPu/x1/PTzVQpO/MgVVA/B5QP6O4G4eGUF2JympI5yryXbHwrUHIiV5zORKPeoVy0NIMHDc0Dj3woGposixdOxp1gMM/LAma/jW0UrRBTddZ6QuB2Bk+0u94TTP3mF5sNKPl3AGNKY+b19UgnG6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9b6Xp/sp/oVzQ0onuPQR0X1zAfr35Sq6OTDk+fI0Cg=;
 b=ldBkdSAarccLAIAV2eEo3jl/TbHrjk8b6qbui93YT94hLeRjQbpKY6IGbOsnOeJ9LUXKGnYBZsFS4JeSDkjkTkrxvKMzoLecUUlONhk+06jjObtaJSnet+siL+YKym6hnHqaFaFmGyWG/bUntWNw5UC8fn3J4mW08W7zeckA8X8s5VA8q1KjZE78QU+LT3hgQolsw5TuPSXSZgVZkUnSHdMgcIu//GzE8CcSEWjlNV6Ze1JTMKoT4Pl9aieREjuOldz9Eu+DlMQ2ObX5pxQ3hiuTRmPW3HF9SqMm6uUHSDX2ik8Lo5DsE8PW1uuy6LbICTyP90A2CLTJAu9RwPUXaQ==
Received: from DM6PR08CA0039.namprd08.prod.outlook.com (2603:10b6:5:1e0::13)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 04:38:54 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::da) by DM6PR08CA0039.outlook.office365.com
 (2603:10b6:5:1e0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:38:54 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:38:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:46 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 01/37] drm/nouveau: move nouveau_drm_device_fini() above
 init()
Date: Fri, 26 Jul 2024 14:37:52 +1000
Message-ID: <20240726043828.58966-2-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ad6cb9-2fe3-4092-701f-08dcad2cdb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GX18U1xR8s8X8ZfEPUUgFTE+akJ4+xMsRx6Q3mcZzQstltcSgYEFOlck9lKO?=
 =?us-ascii?Q?yr1rxeW4yAx3pit+UGDtqGmEQOWKrPKPDbRXK5vzMSyit2ZrMaBVj5LmLHwA?=
 =?us-ascii?Q?51nRJzhXYk4D47ua8i4uhgJCKiVMJAaZcNNCt4negd7CZP5bVLZ578QEdCI6?=
 =?us-ascii?Q?b4ji3tJY2PBEo0krQe3Bz8B8PJsrx3HKc5K0eabH3EI1GXA1eOfqGj5zkZF0?=
 =?us-ascii?Q?eSwbqtgDRP90HQGjhe+72QsWDDpgnL4cpNsenb5HPo7VdkRuD7CXffBmYp8Q?=
 =?us-ascii?Q?Mw2MjXoyjHq57RB83PWeEWMwGzi7kEAp68a1HWlnAEf3UOELdsv6fP3RQm8h?=
 =?us-ascii?Q?9A8D45bZKXu7pyhCt36pmZOvuQqJ7WJTvNpboUUj0gIkOOolBecFldiMAcBz?=
 =?us-ascii?Q?a995Kt719s88WHfskELYX0vlppRa9i80cuttGu1blPprgkeOu3gsBN3eoPJw?=
 =?us-ascii?Q?DUMb/O1aya6OUKpepWKQVciDCm8FBhdAFsLhe4zJPyybkCXsSs6jpS1CDSyA?=
 =?us-ascii?Q?IyXObkF+Mek7Q9B9me+LGXWvyecL6QfnWlJ3sNp9/qh5SuWN4+xKnLjOUu+N?=
 =?us-ascii?Q?NG0C2qxcRsZyXrSZ1SE6rK4GIItQDIspAfcBm8y82YdSY3Ku+rzFMBVvXg41?=
 =?us-ascii?Q?j2uWAL8TEnOyyrM+veD+qXg2BsDpzYHIN9D6odOx1ImcmpnhkVBsb6ISCiC2?=
 =?us-ascii?Q?1PvOcUkbyZ6KyhsXbMTojdWSJy82k0IW1cRX4vHycHpTLpnHd1nVHYwPhdaH?=
 =?us-ascii?Q?KSi5byGnJ/JVs/QWFBhSk2lpzmoj4gUWxKiRHArVy1JwxntLWBkoH29vEJfm?=
 =?us-ascii?Q?llZcRVGbSbn6ts1DnaT9/fbuLWbXt3iyQd1Iyb3xF0nUrtlH+mCYtVXYwscj?=
 =?us-ascii?Q?FWBk7Zy7szUudm2ZFmB6h75G18RPfVy0kTGcnXlgmuNv1DHQhcWGzqAH5RxO?=
 =?us-ascii?Q?JBOwlkCP0v9y0kEYHcWaW2so2va+SVBzS6GkEtHys3AYrTFj4AGwaYhri4Sy?=
 =?us-ascii?Q?rkVgtooywFq/Lt1exJXxJ2MY/+QrOGm25kuScIXn4NOwv2m+2A46Na4UGKuu?=
 =?us-ascii?Q?w8jY3ROp+0all5xFi2pvDwMHQB7FZUynRmz8YL0TSAyh2AW+FT4Ey2l4ickv?=
 =?us-ascii?Q?3xQzdfrN3/X+4xpHLdsQphqNpoS4es7HZHNWnDYcDtDz8HzpbmIsSyBPOu5J?=
 =?us-ascii?Q?WSflaED0ojWZ6nGYVf165JEvu1ug95VZdgzF+wqE18P+meYEnCw+ENsGTwQ2?=
 =?us-ascii?Q?SbvMDWxcxh8fWBGCmoG66zhx2tNl3W5qWI6YcjAlzXHv2vwvu73+cWXsbZ8k?=
 =?us-ascii?Q?NkN10/vjKQY5diIysqrtbukAvpFZtwRDtmF0LF5NR47dBjya0b9X/9tx/4ip?=
 =?us-ascii?Q?zUBF0yy9riwivlchgGuatSMw33Fu0xjkVpnDRxcMz3FVNdw54mgagNWt8MDp?=
 =?us-ascii?Q?T3gAKhdG0LpEd5qjAvT21t86kEjOgk3q?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:38:54.4339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ad6cb9-2fe3-4092-701f-08dcad2cdb18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262
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

The next commit wants to be able to call fini() from an init() failure
path to remove the need to duplicate a bunch of cleanup.

Moving fini() above init() avoids the need for a forward-declaration.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 106 +++++++++++++-------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..eae48c87e3d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -578,6 +578,59 @@ nouveau_parent = {
 	.errorf = nouveau_drm_errorf,
 };
 
+static void
+nouveau_drm_device_fini(struct drm_device *dev)
+{
+	struct nouveau_cli *cli, *temp_cli;
+	struct nouveau_drm *drm = nouveau_drm(dev);
+
+	if (nouveau_pmops_runtime()) {
+		pm_runtime_get_sync(dev->dev);
+		pm_runtime_forbid(dev->dev);
+	}
+
+	nouveau_led_fini(dev);
+	nouveau_dmem_fini(drm);
+	nouveau_svm_fini(drm);
+	nouveau_hwmon_fini(dev);
+	nouveau_debugfs_fini(drm);
+
+	if (dev->mode_config.num_crtc)
+		nouveau_display_fini(dev, false, false);
+	nouveau_display_destroy(dev);
+
+	nouveau_accel_fini(drm);
+	nouveau_bios_takedown(dev);
+
+	nouveau_ttm_fini(drm);
+	nouveau_vga_fini(drm);
+
+	/*
+	 * There may be existing clients from as-yet unclosed files. For now,
+	 * clean them up here rather than deferring until the file is closed,
+	 * but this likely not correct if we want to support hot-unplugging
+	 * properly.
+	 */
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
+		list_del(&cli->head);
+		mutex_lock(&cli->mutex);
+		if (cli->abi16)
+			nouveau_abi16_fini(cli->abi16);
+		mutex_unlock(&cli->mutex);
+		nouveau_cli_fini(cli);
+		kfree(cli);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	nouveau_cli_fini(&drm->client);
+	nouveau_cli_fini(&drm->master);
+	destroy_workqueue(drm->sched_wq);
+	nvif_parent_dtor(&drm->parent);
+	mutex_destroy(&drm->clients_lock);
+	kfree(drm);
+}
+
 static int
 nouveau_drm_device_init(struct drm_device *dev)
 {
@@ -679,59 +732,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	return ret;
 }
 
-static void
-nouveau_drm_device_fini(struct drm_device *dev)
-{
-	struct nouveau_cli *cli, *temp_cli;
-	struct nouveau_drm *drm = nouveau_drm(dev);
-
-	if (nouveau_pmops_runtime()) {
-		pm_runtime_get_sync(dev->dev);
-		pm_runtime_forbid(dev->dev);
-	}
-
-	nouveau_led_fini(dev);
-	nouveau_dmem_fini(drm);
-	nouveau_svm_fini(drm);
-	nouveau_hwmon_fini(dev);
-	nouveau_debugfs_fini(drm);
-
-	if (dev->mode_config.num_crtc)
-		nouveau_display_fini(dev, false, false);
-	nouveau_display_destroy(dev);
-
-	nouveau_accel_fini(drm);
-	nouveau_bios_takedown(dev);
-
-	nouveau_ttm_fini(drm);
-	nouveau_vga_fini(drm);
-
-	/*
-	 * There may be existing clients from as-yet unclosed files. For now,
-	 * clean them up here rather than deferring until the file is closed,
-	 * but this likely not correct if we want to support hot-unplugging
-	 * properly.
-	 */
-	mutex_lock(&drm->clients_lock);
-	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
-		list_del(&cli->head);
-		mutex_lock(&cli->mutex);
-		if (cli->abi16)
-			nouveau_abi16_fini(cli->abi16);
-		mutex_unlock(&cli->mutex);
-		nouveau_cli_fini(cli);
-		kfree(cli);
-	}
-	mutex_unlock(&drm->clients_lock);
-
-	nouveau_cli_fini(&drm->client);
-	nouveau_cli_fini(&drm->master);
-	destroy_workqueue(drm->sched_wq);
-	nvif_parent_dtor(&drm->parent);
-	mutex_destroy(&drm->clients_lock);
-	kfree(drm);
-}
-
 /*
  * On some Intel PCIe bridge controllers doing a
  * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
-- 
2.45.1

