Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A68D1206
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846E510FE29;
	Tue, 28 May 2024 02:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kVUoZ0KK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3510FE2D
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmFU05flePDRK3NXiXpDhhPS9OAMCIOgktLf0QFtfBbAMmtBYXZncfnccPBxpXa0bdqCWB4winOVb339tvSpB0yKAy5q/PZgZCYzw7BEKI5/7tRYfREjRuLoteqibaE68vCNmIh1jCHpjJmBmU1dkK7HL4XZ0EjQR6k3Mp0e44dHmX5oi66fk9C6vZC6thuJza44/Ao22htlBI7p5Z/Aw+eXs8DLP2xgOK/ktvIcoW+RibWr3NDDaSxxxIMeN6VXaPAJA7c063FqQz5wk6GIk570FNGl35pQ5DUE/fbpF3ddO4JDEU1j2G1j/+UbsEtD6/JAefKKps6A0TCJv9/gaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xE6GAOd1skGchcJPTeapapfNsHSvNnk3bXhmXLP8pw=;
 b=Tmf5k7pU6T/L4RgQkVu5z6arFERSSJS3dP1KFKDrZ1lzAV2FdOL6nDVMflyzcFSmYm1CDvVLlchBOp67glctFBDYyFdlHJT3AOlX/XaND9M7p67/dF65CQ9Anu5N3WjKqCFkg2iY4XlfIIEck322gqJ4VC8BV72BFAItWgDDHxVz0Q+aOFZvFUXDBhpR6sh4zfLn0ojcXzrv01JiUcd8dJ7tginahYDAdRJYN/YUI3vuzpaJpFiAlB5ZZDz1hRruin263FTbHM7MhqGqHGg6AOrb5tA+4ehGHdA/8AP6BsniHhBpHoWYhRUrlWOJI6T3e+ewqrzF7oS5y1S29GMRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xE6GAOd1skGchcJPTeapapfNsHSvNnk3bXhmXLP8pw=;
 b=kVUoZ0KKKTReHPf99wc9fVjjI7/gMHMzHaKoVAW61wSncWOwZiCCX9VloBvnuCZjTObCv1KeJn+1REqMgSA5VjaOXhT5Ymp4QWKJ5LWhEPNf5o3DDRryu3dR8uW0vnQF//xXQVXsEyH/K5FHPHbASWaxCxNeGa/QYHPOCfrlvvgaVwyXTG0w29yGiSUfPosoxfyGZqQ0eZ+2nH08NXwE1G7b/WlpJuLH56QV2gH51K3w1f3etIWS20q087iKAsStIjHFoFXmcG2v0ol0osiAOUsp4pAiXco192GGxKb9S1qVyoQVHO3ZEoT6N7g6riOCdMXonNmwRy9SOeSvmgphoA==
Received: from SA0PR11CA0021.namprd11.prod.outlook.com (2603:10b6:806:d3::26)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:46 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::87) by SA0PR11CA0021.outlook.office365.com
 (2603:10b6:806:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:31 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 29/34] drm/nouveau: remove nouveau_chan.device
Date: Tue, 28 May 2024 00:19:54 +1000
Message-ID: <20240527141959.59193-30-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abd64dd-f023-4f23-2263-08dc7ebd3376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mWGoAx7cKOhv/1L8oXToW+CbaSDWVaQl1U31xHxk6JM95Kl/RYXQLy4YKcvk?=
 =?us-ascii?Q?YQP7Qpm88hIrg4MLbnyIGiqyhkx7vhPjGwE5B7dLm0DIJBQunBciXWjqf1n9?=
 =?us-ascii?Q?NMw8jIEL+iZAw3aEuOwUos30c6ZiYqM7+A7FoyEG8G+kTp0m3KpXH0tx5SQt?=
 =?us-ascii?Q?YJreuWDDAfNtT3/FkKj/Plagzrd/sCjZ+PqqQdTqjnVHS1IdXtwSjPayrUVS?=
 =?us-ascii?Q?QwxzV0Nci4CqzwjJrvBiMFlBwxYClOQJzIoCijGlV2rbLrf/ZeCSyNJ2smyc?=
 =?us-ascii?Q?EyHsc5Kgmb81TRIDh25QTD5qI+iaFTmoHz1O58PHRc9lsB/fzNeeWSVp19Wg?=
 =?us-ascii?Q?P4v+GSsGNDxmc6WhGPnjnnru/gGENAlRGCQQOVG6iMXtTzTOe8DG4p5cx3fK?=
 =?us-ascii?Q?Cpr41KvyDiXQrDi0uhTp4RV5QSNZQByK4J/V4fMN1Sn0fMd/28cfLufbKcv1?=
 =?us-ascii?Q?1S1iQVnpIn5D958WXxB1rvwTH0arGXyyrafH5cpfDAkc7MAI9zI/H1uV+xgz?=
 =?us-ascii?Q?2hg0tTIZyNGPy+SyLJg6lnbZxmlitE1zrR9fY/QaGh617xtxHA3Hl09ydIfI?=
 =?us-ascii?Q?DAkqLLW/ZeZ/Ni0ICoeiwKv+pBTDGnozRBmTnwPGU9aq/S0u9t5wmZ9RT4xi?=
 =?us-ascii?Q?aWfgfdfTMnb+hQ35ilqBkVv2Ro/SakCwrWzR+zXZYmjVawKNOBmrRQ6B5TLL?=
 =?us-ascii?Q?o960l7ywiLjm/6WfNPwuQGikwT0BCZuuLY7w7ZIstbd7WV57ZYcNddW9hCPW?=
 =?us-ascii?Q?Esv/V8mPd5p+k08Yisaog9NIuhPzrgI8VDkbvY+yBRyXxSgOrHdZPky3YmU8?=
 =?us-ascii?Q?WcBm/UVVgeXEtBrAdpeA9C5bOywR44/BkUNCP8xvWm3EdPk75TuSKnGrxyiI?=
 =?us-ascii?Q?huYE30BGsqTO/949fwoHK7lju99CtLBUveyW1AAtBEe70/pu06xBdJsGk+cj?=
 =?us-ascii?Q?Ee0RIOlQBUOz0/HF21qHSCvWhvGBNFk5qvelhqDapl7BdpxhAjwYXQE4m6Y2?=
 =?us-ascii?Q?gRM94Vb0ZIMryBrcZxLPrhhhNMQ2S7X7trnIRoy4Q8Doqg+hAHE2NEmf3gXq?=
 =?us-ascii?Q?Tg0jG64oubeVwSS7I6mBrBmlYZuMBLrqlCYSjUkeBobU93RLnRuf8m/ww6Nc?=
 =?us-ascii?Q?XlFKeZvgpgbB4w3AfGldyrI90/Dw2OOAu+mJOA5jMyyzH4y29Ri8lt7uQpih?=
 =?us-ascii?Q?o2f1GnPj2NS51k3Ygpk237g0SNvcG4yvnlobzGQGoc4PD2CphL72S93nXHvG?=
 =?us-ascii?Q?qQ8wV/1xXdgZHLzQqWWe6qSAq/VNr93BOAQ/7EQGJEkQTsAXehx4G7pjkvRI?=
 =?us-ascii?Q?uYrjFbCt3Q9ypebvQ7VLyUl/phbbDzW2HWABDrh2IExeEHFxOczKPN9FN9+p?=
 =?us-ascii?Q?cYRYN4/dIaJbaXpoNMe1Cm1cluqj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:45.5660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abd64dd-f023-4f23-2263-08dc7ebd3376
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237
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
index 0742fd061e01..88152dbff8ac 100644
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
2.44.0

