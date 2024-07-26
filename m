Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108293CD45
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2149910E892;
	Fri, 26 Jul 2024 04:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q7hcRlfP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FBC10E564
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1Mj0hR/g7zlhHEKav7kGSKxhPuOREfh6/5iBhFXmFAuD/gu4fgIgbNS7vkrKwZHvxLYwp87imZYgmlaYJ9EuK8RFp6EyrhsoNB57BBeH4E4jk3dAfpefL5CbXvQDxvSQpa12UEjGbG5Wa2m4ThlZYd5rPA/90TN8jyvltkH4tENQWjVVLK7vMHOK8VCdlzQuF02WBbxSNZFkJouRxyzG962CrVQZiu9jTFQlYrYbDqVQRK/7EAOHx9znjPr5Mzfz5IOg5wR1A/ywMUPRm5Lh3hNjzlEsOaGTQ/qIzCBIOPPQB3EL3zDKxSg/pepZR0l1rY79PEkWK3FZDmLX2o7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cossGyh3io69xj20ovxiCWy2DWaeFj9y+dssPVcIW8Q=;
 b=G2uIvSIRb3mlIv8j+InaXhZtVcvYAcoo69g74ajmAGO12tmMUOkfvqktbQb5l5MWhNvfZ0e1lLfdoxyRMvzpZizYE9Bkbjhs102LJQbcyIi/tOOpbuYqYLLJTR2OkOz7oUfsaff4F+CII2fEmRDBgz0nWqtwCIw4L2uKuJRb/NsoT8Sqf+QB1vdJxuFk83TVYX7ZZAQZWXhivMEwIfw52vYoBR9OWbvLq+pFWBtjDj04U5kd9TRIcwytO5+7f7y6n0H39xqGN8bwy6GvYhLmjSoR1ZESy8yMq1s0gSnt7yKyFRs2R/ezFM/cXExXKtVn5fyuM/eA3kaAC0NuxnZy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cossGyh3io69xj20ovxiCWy2DWaeFj9y+dssPVcIW8Q=;
 b=q7hcRlfPNd6RrWZuk0P1RSAAFLAqIGV0q705UV2Qps6BZDmnR4XQqB8NZEAs9L8M55+FMdiA8tPWXDRZQNp5eAAFJ+0rdzt1p9Ql8qzBAGvVCWM1IWvxdYbNwmCrtAHoa9+cDByb3eI36XM8JyadYnF8eTu0wDOF/WESHbiEH/fyUskmfzSAyvB3LRxqAgZoD3Zdi+/jCDdBBiMqdq0+f32tWLFq7Z6x9haiY70MSS7NpMbezLt05qEw8rE+JIql94/UvG9+gV+UnhtUeFtbN9VKhBtX9E8Wft1hv1CL4vZtG/+Qwq4KVwM4RwF55ZtKgwjMtmyQqxlfBAyf0hCI4A==
Received: from DM6PR08CA0052.namprd08.prod.outlook.com (2603:10b6:5:1e0::26)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:19 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::73) by DM6PR08CA0052.outlook.office365.com
 (2603:10b6:5:1e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:19 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:10 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 18/37] drm/nouveau/nvif: remove driver keep/fini
Date: Fri, 26 Jul 2024 14:38:09 +1000
Message-ID: <20240726043828.58966-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a39f8f-f5e8-4796-2fbe-08dcad2ce9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?abwzxHXEGZaHHXIPqfjcZu1EVk+fcXCWIB3Uy5HhjU+rqcb5CYDF4aNl3XaT?=
 =?us-ascii?Q?owhAwV2ezIJRCUJGQHSl12v0A0HvPhLwI8EohGktY8WUnIQjuR+wcIUI5n00?=
 =?us-ascii?Q?v/5PGzVt2F34SgZtO4z0aZFw0DfcoA+CULIJgd2NYk2L5lFA8XwusWHtp3AD?=
 =?us-ascii?Q?t0yRgNXZFv6Guqiema0kLN1rqkBDnS5eD3bODgQCHpPyuVcUL0zA4EQTcerb?=
 =?us-ascii?Q?vZORspgPMwpQNbaQteP+RnNAjouG+Iz2F/dA3RNJ/O2fu6CeC8RoSAjbTbUD?=
 =?us-ascii?Q?0G9AHOQR3gCrQWaoOHF2nzidj1RsSHfrTQeVN39eH49WKCzbCRQBLuQIWHyh?=
 =?us-ascii?Q?ApWJ9pIECN2UdnhyvhWOm70JivwI/+j+079vA69e0RSXn9U5RdMk2LqjhYEa?=
 =?us-ascii?Q?J+B+tIeWthXMEcpoPPf5yPokWCo7sYG7viUZXvqB8+HPS/hYsnF2bHBm8YC9?=
 =?us-ascii?Q?iso8NpCYbSYMbLC8KVTxJhDF5zMqtdaM62+Hl2xVch2xXdbVlBU01TJuMEQO?=
 =?us-ascii?Q?smIkKhjbg/Fc/IJ3lJZeRKu4mwAXWzOw12Kw7Z/OL0YmNtwKYXHedwt0iU2w?=
 =?us-ascii?Q?EW5bhyjAh9jAuC/GXnuZhhBZcp12Pz3X/YjW9JC/UaS3FkyntMCuyvCBJ7wn?=
 =?us-ascii?Q?2bthR9lpHvz+AyvW7yyyClBFpBOWcoahlWCvjj8LJ4ZyWorw/pLXb413mLZa?=
 =?us-ascii?Q?25SeeR8hV5jkVSWrWMr2gvo5Wef9YnTuV8DH1whODqQBJEgCDA/bs0yxmjxj?=
 =?us-ascii?Q?Hlm6fC5RZtrwQHtNLgRfzaYeTKW/tq/hOArIMB1y9fRdWRn8hkJKBHU8jW2E?=
 =?us-ascii?Q?EBlhGixSWb6mhQCe5Mt+udp8wfUhiehwkPJXX0WFUBLOn8D38I6e1wwPN8/e?=
 =?us-ascii?Q?O05MRSiDz6sfGWWbZSiMgINfn2q2TO4qm4QhM0eBXfMOmwVXOvKT5C9NEmwN?=
 =?us-ascii?Q?R6JCdyUfs9+GaYuFbGREOnErwxFvcwzEu05JtFnJVXDvfORCug7J++anL1US?=
 =?us-ascii?Q?fAtu7lr4BalzOICNpTUPF3QDqV9Z5nbNWWG4/NvdN+Vake4vfRp6wVQWDDqL?=
 =?us-ascii?Q?IVN0tjLuPJ5z62+v0ao6A7WvK4yWnRLS8XReicylQez7wdIk6ln5ssqdYu2D?=
 =?us-ascii?Q?lps3W7oILDTOMQi9j5TwdLzaezuhOzoWWkm1JbGqDO3XTVgpCnJTDHBb/hgm?=
 =?us-ascii?Q?26Za3GH7U0nrfCbU6ksS/a23qfWbMtiiEuzeEg14wqKyxQl9UaS9ziLozj3A?=
 =?us-ascii?Q?iLdck+vnfW2aesiwicwGwgPqNkJ7b4VEKv/77e5vxmOQmG1JcWzjNAb0GYd/?=
 =?us-ascii?Q?pQ/gQgtOIQgikYZQpv5/BOiKGvL0ykbYcX17pnG/hZ/ocaaft3oGpQxT1Xc2?=
 =?us-ascii?Q?UuN+mixYY7tUurzTl0aVkkQnM83WOCDLExqsPJ39S28E5kCFplTPw/3Ugk44?=
 =?us-ascii?Q?NJlFr+vhN5zGGAWDmB/Att9++7mydpSD?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:19.0123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a39f8f-f5e8-4796-2fbe-08dcad2ce9c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
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

