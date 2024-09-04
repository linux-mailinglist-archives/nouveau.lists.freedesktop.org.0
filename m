Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51596E1F4
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2024 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443AE10E92E;
	Thu,  5 Sep 2024 18:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NkDRO+bd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECCE10E92F
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2024 18:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd6JgHf57SgvDH36odIVDtwaEwAWiTZZptKgbwDahVUAJFd2E1sAVnpQHJ8Q9yjmzXqFDNZmGKuZPPxMGboLrSX1VWQEEk0EM7LJ+HR4TnhoSQ4PfsaqVRaKH+qVrAuRdHRkp5oKfgn3+2rVQ1dg9HFvkDY8klOEHFqp/3ogO9BpQmuJXr4JwjCpNNxHcEBBhW6WPsNSmv5pk24G4ohMvk5ZDyZpxr+Uf+7vCUYp6NQvGHQhe7QDyw/9AlNEs7m8t7JS0yWiNVAb3ttvPrJ2M7z+xMQadkxLGhtCYta3QqQ6EQlbDm0p/w3ie5TgEEEE51tsOi+vmhvbhbiH9iOFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg3rYjDaI7XbwyFh0o1Jd/6XL1u5w1f4xjTdsDr0ILo=;
 b=ilPJfQGjWkJUTIXvQF0h/+7579230g0C57WbXL13F2thZYV7DNxVJOpwnvedYzxo01xXvAJmKFHcwI45MDqM53DUUupaFwm2VMkNbD6+iHdroR6uy/f/9yHujLnWpTpfvPBiuN8JAaj5ZvGZtRq4rh/IpDXhdHG7aGNhQnp/FobGyZmh0miSSfoDOqTEl/hyWj48jFfcbKrAOjI2F6z5fCiOBf+uf1N/TcY4g+jDNpCI8aTiz1k2wWVUS6+kSJ02BhgxGpxj8f320a0oRejGG4Khj2//BQv1pD6XurdhB+bCWbgTLqyE5UCZlsFqjhHHVVr8NqP7gBakSa3/Lrxa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg3rYjDaI7XbwyFh0o1Jd/6XL1u5w1f4xjTdsDr0ILo=;
 b=NkDRO+bdwDJyRyX5Dk5KottLF5Yv7/MNzknazjZuj6cNhqmG6z0MotUgnG8SHScL6KuBd3zyfesm5yt530ntGII8ZoXswy0dfqACW7ogaVqejFe4MUOOCHEyZU/uTvA2hqkjtscpsI947e2b5NKp4PRK2/WC0keZaBCVcA8Igz+Uh0HXlja74ZkHhetnWFPVMBypLvItlJcAIOYQ7V6u+eA/jm0erLXsefs3nxy+5pszCXcSywdpt0ZRFFR65hCSS9+/Idk/fVDMCG2lLHbOXy4xPJ1yukd/lLGjXlAhUKaK40PrHP5NLjieXC9TwIJQMtblZjnGeF82ilGHMnTikw==
Received: from CH2PR19CA0030.namprd19.prod.outlook.com (2603:10b6:610:4d::40)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 5 Sep
 2024 18:24:53 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::d5) by CH2PR19CA0030.outlook.office365.com
 (2603:10b6:610:4d::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Thu, 5 Sep 2024 18:24:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Thu, 5 Sep 2024 18:24:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 5 Sep 2024
 11:24:33 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 5 Sep 2024
 11:24:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] drm/nouveau/fb: restore init() for ramgp102
Date: Thu, 5 Sep 2024 09:24:18 +1000
Message-ID: <20240904232418.8590-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: d3615dae-2bea-4f59-f4f9-08dccdd80999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IdBmRR+Wh27IScrXKaUsGMPGhjiiBWHRl2u9ZC5t9MFLP6so92GuCTF2I/E0?=
 =?us-ascii?Q?sstX1ePFFYurI8fO0KUEG7NxJkBybOY8FnL0HyclRtb11KFup5Mnqz+xOw5G?=
 =?us-ascii?Q?PpKgTtMAsSXITHFnsBeqmzERILzfLbhz8Lzi12iLGXnLRY3GMY1gxY8k6N2E?=
 =?us-ascii?Q?eMA62PT4r3oTZkL9oREh2732PVY8V0auNyezDHfNf9ojM/2VcCsiNifiREr7?=
 =?us-ascii?Q?pVm+SaSsbxUtwWriTVNf1+5T2Zr/iHnedAyhvkBMGvuAFOQVleGb5nga2tgA?=
 =?us-ascii?Q?j7khp7sH+dLFNuxR9atPWdwQnrWq9BImFhV38C/zJVPhydpiCdp7AXjccxCf?=
 =?us-ascii?Q?kG658XamYwTUzlI5qPoaMfa8kfSVNQmW4BVQAttnxirRDx8nmrgxpD3ztERV?=
 =?us-ascii?Q?5pChczt7mILUvpfMIJLf2shKifZerl2fNMg2L0kF3NrCDOZsfmVfmKptJznh?=
 =?us-ascii?Q?SgYsU+CxNmqa6gHVfxABKbX2FCB/EK2X35CzhDFyZBmBodS2pRJpCsSMe0ct?=
 =?us-ascii?Q?fevU1TnDtrhyug1T2FHhVzeakf4/7eQrNbdNZ/NN3jgYWxf21ZaS5S4sO4r4?=
 =?us-ascii?Q?QudS+sIFoaWnFJbhCfqSBlwXmQafdWG6VE9Z2w0bqbm04q0MAB1rXmRoNKAO?=
 =?us-ascii?Q?RjjVLr3QJ4Itpu42FEDDgBXBPsSWUYOzSiJS5arVSsnCjwengybYBczr5hra?=
 =?us-ascii?Q?5Himd7iRFSdsVl7CiQ4V3YtDu4qLpgBmsCSFhAix5LIpAvcbNl/PgOddy4+Q?=
 =?us-ascii?Q?3tZ0eFpSrv8ebWiHUFCheoolwkSdNqNZPbeas2c+KhbTTlg1qBzrHijCzMT8?=
 =?us-ascii?Q?+jlLA3Yds8Xn/b/G1vKxzkyAjpAo+RhGp7r1Tm/HTv9zCQ55c8pSPW71/z5S?=
 =?us-ascii?Q?A2ezram9fwvdg+h5F+OZA2tNnuiP80pTY3weLx9aki/cPoItr74HZreXnr7S?=
 =?us-ascii?Q?pPpqrAnM0jNmomfcXS5qwzawxLIfU6xThvUjNud0Tv7mFBkrqJsE+Hr3NP5x?=
 =?us-ascii?Q?q2hksDyyVmlt7DBylRrYz6Is8nkltwhUL/nx4WFW7cZyAts2sRRDWiZmU8m/?=
 =?us-ascii?Q?ZZq2aTW9UCjjQIYhwp1LLEFUrWdTtuFM5+tRuNQoWCoVrsu9uc/XsZrHp7MZ?=
 =?us-ascii?Q?GR8yPwlKX/+uiveDPlhpq/qjNbH1MqXzrUdIYSe+8fjoJQ4rVzjGAyZAZiW0?=
 =?us-ascii?Q?3xYd/61ZEdiPAhIMky1Yz0rDOM/y+5csMofcslZesy3XJkwFcV+nlhHK8Cvf?=
 =?us-ascii?Q?AzTgbR1nL+346GJhhDgnFOu1yqTts9BHw5TCQboQVQ0jZYE6dd8ycM3+OLxk?=
 =?us-ascii?Q?cujMJ2DHoFQgr0kuJFmr3lAoWHkKhKams59KpBQ/RMoVBk0HcVcqWLy8eFMd?=
 =?us-ascii?Q?IVE0cJR1kVEMx/7tgYh/bM1Rba4k1QOusdnO/8cHSEjq5MhwWC3BoCu9OK98?=
 =?us-ascii?Q?w0Z5U1pv+UB++Lr4SXQpGK2gORvT/716?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 18:24:53.5919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3615dae-2bea-4f59-f4f9-08dccdd80999
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
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

init() was removed from ramgp102 when reworking the memory detection, as
it was thought that the code was only necessary when the driver performs
mclk changes, which nouveau doesn't support on pascal.

However, it turns out that we still need to execute this on some GPUs to
restore settings after DEVINIT, so revert to the original behaviour.

v2: fix tags in commit message, cc stable

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/319
Fixes: 2c0c15a22fa0 ("drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection method")
Cc: <stable@vger.kernel.org> # 6.6+
Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h      | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
index 50f0c1914f58..4c3f74396579 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
@@ -46,6 +46,8 @@ u32 gm107_ram_probe_fbp(const struct nvkm_ram_func *,
 u32 gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *, u32,
 			       struct nvkm_device *, int, int *);
 
+int gp100_ram_init(struct nvkm_ram *);
+
 /* RAM type-specific MR calculation routines */
 int nvkm_sddr2_calc(struct nvkm_ram *);
 int nvkm_sddr3_calc(struct nvkm_ram *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
index 378f6fb70990..8987a21e81d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
@@ -27,7 +27,7 @@
 #include <subdev/bios/init.h>
 #include <subdev/bios/rammap.h>
 
-static int
+int
 gp100_ram_init(struct nvkm_ram *ram)
 {
 	struct nvkm_subdev *subdev = &ram->fb->subdev;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
index 8550f5e47347..b6b6ee59019d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
@@ -5,6 +5,7 @@
 
 static const struct nvkm_ram_func
 gp102_ram = {
+	.init = gp100_ram_init,
 };
 
 int
-- 
2.45.1

