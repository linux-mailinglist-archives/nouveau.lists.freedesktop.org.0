Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06893CD56
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94010E916;
	Fri, 26 Jul 2024 04:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ssGoMW4k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC810E91A
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQz+3FDZgrPfiSC/fUELTluX+7Q9kmUVecsrNGjvTOBNM6Z1aIxSvWRDYfDOd9A3zja8WTDVtiYUKgClu+82ePi9LntNC2D7FOBssFFhNF9iyW0YjZhImtwqeum2PC5Nvq/EfaBEtLO7JAjNMmZ1DqQCaY5BNW3SaaAnC4ZOG7Ywis2LbvmQxePGlyRW4v+r8h3dxz3CW3lGPK092uMUXKBpFt6mYaF4q0cLNtAGArvmyEGQnI14nDzxJzoPJj+2rVQYQj1K5WagJTsouyPu0NzxfMtlUDqmryI1g390i2lNF/K1D8omCEZ4/xFiEoToR280uYuAdxdhigeB33RbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5Bf/MLIYHCkOlgseCc6IdGj37DyWEnrqO745pVmeFk=;
 b=Z+NidRKTM9b4WMh75wFycHFZJQWZlDKkLcFRM+VqgZaRrxUWQg/Sl0ouE6fDL8TplVOAtF5epSmVFTB3/w0gBkcEeBWJ+KFi7/QVwiFfi0KQiGymoZV65V0O/MOAtNeZVpVuPGmPrpXiXZk/zxhVWToSLbKHBb+bBs9D5gZvESZCOQaP2WqWDcifivg5Km6ZmJNKXe2NsnAbnHzuzC9VD0sgmgvEf9CPNibpHtz3kSy2OKN6jzh98qiLSBNo7ovOV/z9qil8A0Eq+DyOgFlL0xGaMvoU3WxokvHYlOGQmnx/IO7pU/NowcTLv2kXw2pTt4ZkD5otCh5JUjJj5Dk60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5Bf/MLIYHCkOlgseCc6IdGj37DyWEnrqO745pVmeFk=;
 b=ssGoMW4kGisSjbGVF2EUE8wk+3D1yz0+CnvaU3Bhi1lt4wISSnwUb+feVyRJ+UX3x8YYD14gHG/bYEeu+DVNNHbFSsUI1a7iAzEM4DNNdHIgqD+2sYyTUTdEOOLJL1vqY6dfMzQR1WxDu2ZMncWGk4Rs+IXXmytpjCvp6fl7IlcClfRKQ7hf3brl9cP8pDZCja0DJphUJHLwQrUbSrq8yKrYxOq4PLLzQbpam9oZeQzHHns+Gy5vtV1g9bixhvxREZ4BmNvuJ+ZC6MHG8tnBede0KYinpLVtO3aJ2cuR+KRNkYxzwalzSs9b9hkXavzXegKnv2IYsC2IsHBRdtBSTg==
Received: from DS7PR03CA0353.namprd03.prod.outlook.com (2603:10b6:8:55::13) by
 CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Fri, 26 Jul 2024 04:39:42 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:8:55:cafe::99) by DS7PR03CA0353.outlook.office365.com
 (2603:10b6:8:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:29 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 32/37] drm/nouveau: remove nouveau_chan.device
Date: Fri, 26 Jul 2024 14:38:23 +1000
Message-ID: <20240726043828.58966-33-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0951dfa0-333c-402b-1de7-08dcad2cf7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wkfG+xhwe4B925B0N87pQmj8aDRzfMbwAHoUQDZHaRUejriGebpNqB/U9fy2?=
 =?us-ascii?Q?Icf7osmQ7I0xjD/Xwb16CbGBZ6swhwE9VR3gFmFki74Gt1lfzCAynOSmaReH?=
 =?us-ascii?Q?A9kuWeBisTXNVcE8yfcl4pdbwSTtPA40hGLIg+yZmwcS7Spxno8q19N2D1Ff?=
 =?us-ascii?Q?5feiSiUIwAUirKEl3r/9mXxRovNVsdz/A6A3KCf2F2TXC6igjCDjZQ7TgGvg?=
 =?us-ascii?Q?bUYPBOfAH9lwUL7LJsoxsiVqTx0Uwi4gl2JHcU5+2wiuJNoENbkdD6bBcjnx?=
 =?us-ascii?Q?vuOjKNKKMFS8aGkdlFJzYmbJYKrdnd23x9AiScFSGO4CjT5n0mtc2Sl7Fgcn?=
 =?us-ascii?Q?9hL8b+rrc+1cFTM0c2PR3u4u4Dz7olrEHeWRDynZ5fQn1dlce8Hn6YIsrb2B?=
 =?us-ascii?Q?80dkOtnPKbwdri8vTnST21ktISuRYVYqJXQ3+wwRWHQadcWfkA8XmWOkCh+C?=
 =?us-ascii?Q?40dDXsZnZuVk7qEV0yWXK3S9ILAM/W8DVynhbAYSSTO/sJOpzL2LxqBdjUJ+?=
 =?us-ascii?Q?L7r1bz3TKZIz4pfioPPwCWsv3pqOWs325rQQPbS3p32bb6kbtFoQA+DDAUrP?=
 =?us-ascii?Q?Og1QK2FGLWoWV/+xRm0v1mNiIGcLv2DaFK+ZqV6RSnK/Y7K1htkndwYKwvV3?=
 =?us-ascii?Q?L/n+2UT6+6qSbfMI+JwijMKJszNwzcR279Aiz1NSgBMKpi51KyZnxDWasID2?=
 =?us-ascii?Q?2Xp2jKIvJ7Oq1pIzrGdYDXoNCo9NXnRAqgVu3OryYBqKqhJBBhpBH2M8C6Hy?=
 =?us-ascii?Q?4nYFNfn90ugdKt2Ips6SAvcU+X0YhyxJRLU4Bv+xUPG013ocjz05XGvAW/YL?=
 =?us-ascii?Q?Ys6eOcEtZhXvYLTxP9LEwyjvzJEQ/BLOfz8OoxVP3KQzru896g9mO17+3Ab+?=
 =?us-ascii?Q?/vM87CpY/3ERmBlW8ZO7sjXPTNwrYZaCjWhAoIHb9UHknakoXw+rMsG8M88b?=
 =?us-ascii?Q?g1zMG/9dIkZ71qhCKy2NZO/KKG+CXdk5PtyL/oxhy6vOCyDnRA+KQScyAusj?=
 =?us-ascii?Q?PEAhqlNkBU4gCcSOfbLmYOhSSjUaR46XI7rI+rM/zowUWzU864+908w3NrN+?=
 =?us-ascii?Q?DE1LIUT7hNMAYJCP4WFd2uvoV0+oWD/7FTZPBeNeMi357EJJtKdqabS5MHu4?=
 =?us-ascii?Q?dPLN6zzLYh/VK8Go4DrXWOtBTzSURJeH5XiGDhgbDi5LfvPcbeh8bXclI3jN?=
 =?us-ascii?Q?lQa9QC1+cSztwWAi5cRzy99uSzjFodvAuDcUn2iYkkKPDExH8bwHBuu9UCJ4?=
 =?us-ascii?Q?Nuuw1nJm1I7ebS0SZLiDo/WCfPq1o1a+SBHGNVtMArq5bA9S/8aROTIdQ98T?=
 =?us-ascii?Q?yQgNb/3KPiu4YJPBUUBEtpWFAACttVi3svs0u53icbdAOT2wQ6cslk34J+sE?=
 =?us-ascii?Q?zAt/gSH0eLgs8r63dlhRQrV8keZahYitakgD1FdMxO0qSM8Sa1z9IKoYzR1S?=
 =?us-ascii?Q?QIeYZfrdNcOkn32tPUpxkUSaWnpmTfrQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:42.4016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0951dfa0-333c-402b-1de7-08dcad2cf7b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
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

nouveau_chan.device is always the same as nouveau_chan.cli.device,
so there's no need to store it separately.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e18a80fda2ca..127bd518030d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -157,7 +157,6 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		return -ENOMEM;
 
 	chan->cli = cli;
-	chan->device = device;
 	chan->drm = drm;
 	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
@@ -364,8 +363,9 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 static int
 nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 {
-	struct nvif_device *device = chan->device;
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_cli *cli = chan->cli;
+	struct nouveau_drm *drm = cli->drm;
+	struct nvif_device *device = &cli->device;
 	struct nv_dma_v0 args = {};
 	int ret, i;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 260febd634ee..18a9cbfef8ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -13,7 +13,6 @@ struct nouveau_channel {
 	} chan;
 
 	struct nouveau_cli *cli;
-	struct nvif_device *device;
 	struct nouveau_drm *drm;
 	struct nouveau_vmm *vmm;
 
-- 
2.45.1

