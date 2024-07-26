Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC493CD3A
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E449710E2E3;
	Fri, 26 Jul 2024 04:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lmC88VzK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC410E2AB
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJ8DlKryobITh/hWIPdSNnUIge21dk7DSqEAa4tSCuUzqaNn8HMYRVmA97sBg/OMcUnJUvWfIMrRNh96Re+BdD3HCgIc8HKrkR/zxjk7K3Ab5LOmG8PQBINPWX5RJVwP9zLPp1vQv+gYh2Oe79Tl5sLNy8E8q0Bo4lGMkeLWC4OsS0IZm1+cMgqC6f44rG8KqL1zgzdFwhF9C9E7TZ7vnNFqrJo3WGYf3BTub4j+Q6vOPp+yZbSyozKWJg51CXEgGjWwsuM9RG6Mz/4pXKA5v7Wy1yGpihk12NIDQd4GH0PGKzVoeN9BodVph/FGGyCVnwbX/dlCsGPhw9B1wAFBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SNvodKsCEkV5jwtISy1FahPNjX3uEVzAExwQBkoFpg=;
 b=nCwHE1gP9WHlagbOF2r9zB5nHoUgv48fmy1R9vUklLtXY2XMygI0rqWTEo0ZaxaD2emAwcch8s6D+NkIHbQyFc7Ll51ZQ1cwKfpZoq3yHrPG6tRh2heDbGNv80u27hwuH8cn0vSrYZAY+K+X+d0SjLKPUn/EV+SKhF3F56k8+8kM01HUfGyI9B5wm6BosVQryAp/XAyEmC6MupjuotVWZSVaRwL8AZ2fc6JOWQA4seYVCzzs/nSi9Omhy6JDGUKQ2eFdPz+JWK7V0pu62/p/lsz0FPr7mo3oMaK1aYD0Z3ivbgpv2TbbW9zydTa73S8fkahKGBSS+Fwxhfdf7PT0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SNvodKsCEkV5jwtISy1FahPNjX3uEVzAExwQBkoFpg=;
 b=lmC88VzKVbXbYnwiugYr2KsReHt06eBeO10cNRkDkJrU5OZMDLy9eYLS+WAYCJ41PqmKeGhAGp00WTbCv5UalNUBp5spUe3hWU4aE/djTuAD7h0wtJOKObL/Hz86WKlWlYe46QSLrxdZM6PoPDEujGnkvBF8F2nSUUMMh1VzovDyf48rY3psbAQHX/TByMjBL30NQWyOPo9t81OFqDDs3QRYw1kWZeBawmx2QZIAno3ufZ+WNl+pa3GWQfFa6NSnzkXzHSu9JGNt5YQOsQAn0Rq5lNtsvERli6Qao8zqBXVe4rqba1sU+c2fs9U+n9bJkNgP0poVhGFAMyDwWN8U1g==
Received: from DM6PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:100::37)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.20; Fri, 26 Jul 2024 04:38:59 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::5c) by DM6PR03CA0060.outlook.office365.com
 (2603:10b6:5:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:38:59 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:38:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:51 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 04/37] drm/nouveau: create pci device once
Date: Fri, 26 Jul 2024 14:37:55 +1000
Message-ID: <20240726043828.58966-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 643dfd0b-ffc8-4cb5-bcc7-08dcad2cde2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ewIS1TbS5QEf26MH16GQddK/0k810PNLuFdFCk/buVi4WjKgrqFnE39GYTOP?=
 =?us-ascii?Q?7kJPNZLldMvpSI0gVBdXmzJLmQzIl6U4P3bhmFRSzHCryuEAShd/w6/Rkp5P?=
 =?us-ascii?Q?zXrlIY+vun7gkcynhHnymTRMHC9V7lRlEI9gQR8z9KfT1lbP9mJUslIkh1Hs?=
 =?us-ascii?Q?PemGXAzUF06nZahidhmGV8PrjC2rgH9Pz8TrUKxr/pcuQ4qID4s3lgjyQTvI?=
 =?us-ascii?Q?K6fmwSDizMPti5A+RVJxtj2UiaaqfY8WgSA5Yg0WL3bQwmUEqAYEC+JAPPSj?=
 =?us-ascii?Q?4G6zKLbWqXh7Wl8UNZoApCpCPICqJdSumz0nc1iQUGR2FZs7M/CX4hgtHY31?=
 =?us-ascii?Q?oymBve5Rk95uszgtMqFDaax+BAmznlMumc/EO4wpI/IsUB23Tn0cuyuW+9UL?=
 =?us-ascii?Q?nfmyyDAs4S3f8nXVQKESsewYGxDmMHL2sAWg+dCej3I9rTHjee0cmQnzBCiT?=
 =?us-ascii?Q?EVqQPvqxHmEM4BCV16F/OslN9s9GJqOV43v0Io8GN7K0zGLHqg4ZzwjqVByN?=
 =?us-ascii?Q?GK4GQTb3SRVqLe2a6FLuYV/0ScPUIY7NCgLk6+la8j4ayh+puBcVm72FqI9M?=
 =?us-ascii?Q?8PYqDIBOv/ud67MpiHJyQmK9HbxJ7u+Jz0yhtTnZb8/2+7RGMMVPcglGy6wj?=
 =?us-ascii?Q?5rNeFGH7R75JN28VFEnfEfewEJogDxpn4yPCcKVZsR1b+Fx1F3FHy/MPWkVv?=
 =?us-ascii?Q?EGC1Ak5GVKXe/bZxsBRXgsZOr6R78zLi1pbkMtn/d+CPif1cvD6iFhqIAIR9?=
 =?us-ascii?Q?awMjlyYXLN+sNkTD8xGL5y3JTEGlswRAfBKmXnl9qCtJwrwdrBInGoTdJ3oV?=
 =?us-ascii?Q?91z1xqCfx+FZPyAZfeL5WRsU/5kIzX62UkqJs2jbSmQj63XOvYY0fE6cKd9L?=
 =?us-ascii?Q?Klq1C8/Pwgp9Z49uY5xK7XI+p+UDcAXMpVJz409SARTXcNa+Z5OXN32xw1Ua?=
 =?us-ascii?Q?5vdp0/EwLf5uICusC4oPOh6j1tDtA87buhAPrBKuMWOSIrC5x3ZSdG+3EcpL?=
 =?us-ascii?Q?YmLtVHwxbExwRDVSTa7qT3yWgka8yT2tXNeX66JFxPKTawE7K0DKCJLIfhET?=
 =?us-ascii?Q?jDp6yKdhpm1xecLmuXWPAuZzCQLUB37ORvMdSiZhkko4CwmKkXHi7IepRmBe?=
 =?us-ascii?Q?F+6mCUYXyVQ2wLYRgB0i74WCjmKXlS0PfuP81rGeG7AF81VKH5sjc4gInv0U?=
 =?us-ascii?Q?kWI3wxLmyFUwemCaim+bdZvEQUyUmionevXyC9hVo5+g5jvNjzTMUbdutsyR?=
 =?us-ascii?Q?FtLS5fYf/ZieKrqaf3HZuVldmabuY8Eviy6NRzsWXHfCSngAVqr6+JXB3V6l?=
 =?us-ascii?Q?9la81dgH4jKjmqAKSfDGFb0xHWvwAeoNWGZPOd2UMEVOQQ+P+biuV+xcl+cc?=
 =?us-ascii?Q?hRPixbAZCdvLCKqNwqvenCXTUfoR1AHv+6YWgHaiTGSxrzojkx2ncesfbxgr?=
 =?us-ascii?Q?Gll578A5wVzexuCGkmJBDLPTvKfJFb4K?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:38:59.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643dfd0b-ffc8-4cb5-bcc7-08dcad2cde2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
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

HW isn't touched anymore (aside from detection) until the first
nvif_device has been allocated, so we no longer need a separate
probe-only step before kicking efifb (etc) off the HW.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0687bc59d486..f372bf2954aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -839,23 +839,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
-				  true, false, 0, &device);
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
+				  true, true, ~0ULL, &device);
 	if (ret)
 		return ret;
 
-	nvkm_device_del(&device);
-
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
 		return ret;
 
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
-	if (ret)
-		return ret;
-
 	pci_set_master(pdev);
 
 	if (nouveau_atomic)
-- 
2.45.1

