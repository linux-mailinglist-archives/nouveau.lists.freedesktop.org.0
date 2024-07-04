Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3292AD57
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227D10E464;
	Tue,  9 Jul 2024 00:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AH5FUgy5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EF10E465
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrwpcg/K3ps+X3Yet76iK6mfaIWw9Rpsft1u1d2ImxDI2NP7awUg0R69sHUV43q1YSj+hcSRPc//DRQeSzJCc7X6rfeE1x9MEWZlmXrkAfBt3N5IhjIflQk7Q2538UvWLabvmlO/QPpzQwhheF+rC0dVNiEqnt6D6OjH3/au687wz7N1yE/TQtHZyERjFN482n76n71Y1n3CJKnpyNdulU6drWnGC9JzvyIhsv+kIB7uWdOkOC9Pa4lfUUw57Xth5GiJ/BRAJGTPV8xibgSLhLqwPI8Yg0okg64VMkFgeJXIQetO49KoYDq6Z8o/bNy+Qi51x2eSL3R8LE/RSAJ8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cossGyh3io69xj20ovxiCWy2DWaeFj9y+dssPVcIW8Q=;
 b=dRwW1SkmTa4u3NAbUp1hRP38FPWq1ONPzM/mOmkLKPn6VqG0zeCiiwWGzd/opJvhAOcX0q5EsKMJKyShtsQG6XybGjimUKlon0GLrnKKakO/0BKRSKwBaqHFnyrrPCEWDaednVKCTCJdfeOhVoRr09dX/VvKz1iiIlTD57al9Wau1g4aZXIs4zu4BXVcNQVy92XvtAp2qf9ZBfsx+P6QDzvcUoPKehAlhc3Xd2TcSItePke6itmKi7prTNB5qQy9ILbkMlVfvNgNE2rDOYazmuDuWC7q1CY3yZxX3CQD43LuSHIv6eyUPk2gMgp1PZBiDi77Uh7w+RR89qN0Xid5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cossGyh3io69xj20ovxiCWy2DWaeFj9y+dssPVcIW8Q=;
 b=AH5FUgy5bGcWcaIepdhYSI0BP/K0586wxHDOQhv8u6QlkkfUuXT2d4+jFOUyaBJEdWTgtcDqMomW/oTYO0UceXQ1aAdmwsBlcRX0jVi9OT/bq3zJJLdtII/AOZ8w4sGm0XZ7SdPWrTOvlOJNBNHW7YsSgRj8H3qVXZ3At4qoylzyudYPC1QjX7FXfQRyIKTu6BJXeUoq5DmEwbi2GeYP+dSHTWVfJqHZdJCWnncNZ+VPGXGoeHr0YxM/tD/vI3pgTUFftboMpvUhDWdXCXCokFmM/mvq9JqKkgyUGEp9RrkrxhAmikNsCxCV6FKAMLX5Bso+YNK7ToEO6dax8ruztQ==
Received: from BN0PR04CA0144.namprd04.prod.outlook.com (2603:10b6:408:ed::29)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:24 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::4e) by BN0PR04CA0144.outlook.office365.com
 (2603:10b6:408:ed::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:12 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 18/37] drm/nouveau/nvif: remove driver keep/fini
Date: Fri, 5 Jul 2024 04:37:02 +1000
Message-ID: <20240704183721.25778-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ab4be0-9313-4c98-6077-08dc9fb1d0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V2IsCZc67TchLg3nwZg+2uBg/IBgJ1oaV6w+CmxjnCiaWj0a59rsOdS0fCuv?=
 =?us-ascii?Q?lcWo6GGmoy54r4FWYti+VgYcDrnyA9KsU8WPK9ljZA8O2jy1Fqm7QYyE3cJU?=
 =?us-ascii?Q?ntJDHwdhMA3w8ejKWl13+u6bp/1s//oC9CKQJDJX37TL/oy08X7/PFRW2d3o?=
 =?us-ascii?Q?EjQ1Y/rQNV5DJoRzY9eRIXGyD/TpyslgXqDgM+bCl4XzyPUNA6NO7h0Vsfyf?=
 =?us-ascii?Q?Q46cyWMJCv8bHt4eO6Ro3Mopdc9KQy0J5WLjQTCaemeIl23ASsdL+C1XsBZe?=
 =?us-ascii?Q?wRxUjtmf5ItSqMs4huIKCzb33pz8G95knOLE2GE8Jw+Z9f2qzFJZOiIHv6Et?=
 =?us-ascii?Q?kT2rOqrRCJ38OEZoxsQxgsdiYu1PAFg6LgYHu2cflTGlfkq5hEQzr9BQdwEa?=
 =?us-ascii?Q?BSCk5d4wus06zynvyQqTHwObh0OMW4U1Uc/oec+UWWr93chNE1Q6KfouP1g5?=
 =?us-ascii?Q?BsShjcVvjFH3gyEfLAits8lj253yewXG/UQAlJ00ZtFbx7ncVITnUKb5kVBH?=
 =?us-ascii?Q?FrxITTU9LEno0GMzi2fWZK7Kpwz7n1N+ddKH4J5oj56c73GMU8+3UU5jJsBR?=
 =?us-ascii?Q?D+uQjv7Vu+3cCkO431dDmnxfDp+ZII0IFTHGs1L1FZd1cNuKQa2khG05zrVW?=
 =?us-ascii?Q?QjyysG+1WcllHkouUhtQMevnXiIcJ7lP0qpVzouDJ+588AyYkR5V+MUzNNPe?=
 =?us-ascii?Q?/3fk585GBMhLkonW95SG+QcQSAdkKwPSW7udxGjeNhY5bBioN3pilwFmpKv5?=
 =?us-ascii?Q?QNIQSNxNLc6H0wWdmrwHQvWG2AMlyd9wns1fDlO97g6uLeDWE1r6+Ul1hcQW?=
 =?us-ascii?Q?hlifnn/5WyU6TJWd40uBd+ez/N7jDLvnTDUrgvYrqN5UYB5aYXabARF9XGBP?=
 =?us-ascii?Q?Z2+JTBdHw57ZxIKwoF1GZFuaYw/vCfbxqsVInUUdIuI1TmYGtfsuE0PcDiXI?=
 =?us-ascii?Q?e1PdkBb6biGv64StFjzG084HGmHh9rZChhZFmbFoZmvVIpAPUth8sNT+V8VX?=
 =?us-ascii?Q?ZYpqwa57GbGICuq6irZ+zhVzofHzniEQPJVjIJxMbx8sgB1M9JNkYv1VmIDr?=
 =?us-ascii?Q?s7aTs+z8TueVVt0+j37mU8woyQdvSKGWrdV17BEEf7Rp9y42KyJqjeIo2OxT?=
 =?us-ascii?Q?AJ2z9UFRM48DMWGYBnyEPS+cfZYSN+QW6gknz4QphBkDISZivi1m8VP+lHlr?=
 =?us-ascii?Q?NavNQk1OVqcFQJ6QXwOu1nanID8u8w95wQCfSCS8JzKSzfZc3Dfepr1OeM06?=
 =?us-ascii?Q?K/+/K55w3U4cYO3XnZavuvJViUSUdyusSxPzY3Y3vkMgOoKZU8MmqmmMxgbw?=
 =?us-ascii?Q?ZLwH5AG6WzcswXPdd44Ed858Hs7+7oRE6Q3qQTLZL4krgSq+VJfFYxy1T0M4?=
 =?us-ascii?Q?gho7MQvvYaxcYgbge2AIpknIGM018g9vZ9TJg+2ZIEDkV0zPfQF2xLRld/Wq?=
 =?us-ascii?Q?qsu+ah9kViwb2f59XeLfhwRqS3yypwTD?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:23.9767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ab4be0-9313-4c98-6077-08dc9fb1d0e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
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

These are remnants of code long gone.  Remove them.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h | 2 --
 drivers/gpu/drm/nouveau/nouveau_nvif.c        | 1 -
 drivers/gpu/drm/nouveau/nvif/client.c         | 6 +-----
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index 8d294ce3cf0a..7b08ff769039 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -8,13 +8,11 @@ struct nvif_driver {
 	const char *name;
 	int (*init)(const char *name, u64 device, const char *cfg,
 		    const char *dbg, void **priv);
-	void (*fini)(void *priv);
 	int (*suspend)(void *priv);
 	int (*resume)(void *priv);
 	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
 	void __iomem *(*map)(void *priv, u64 handle, u32 size);
 	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
-	bool keep;
 };
 
 int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nouveau_nvif.c
index 9a7e3f64b79f..adb802421fda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
@@ -97,5 +97,4 @@ nvif_driver_nvkm = {
 	.ioctl = nvkm_client_ioctl,
 	.map = nvkm_client_map,
 	.unmap = nvkm_client_unmap,
-	.keep = false,
 };
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index cd5439b73ac7..85ad5091e8e2 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -51,11 +51,7 @@ void
 nvif_client_dtor(struct nvif_client *client)
 {
 	nvif_object_dtor(&client->object);
-	if (client->driver) {
-		if (client->driver->fini)
-			client->driver->fini(client->object.priv);
-		client->driver = NULL;
-	}
+	client->driver = NULL;
 }
 
 int
-- 
2.45.1

