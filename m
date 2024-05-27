Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0268D11F2
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52F10F41F;
	Tue, 28 May 2024 02:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pHaIoGw+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D2C10F41F
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1jM+G1p+OP4hPRyUv1aS7FxfcbB5mu1FTfFmhfxPYTFvBTRkpvg3hH/tbBkRVIuJFN9ebV6YkOog7OzLjUkP/9tTFB8uVkmbk8L1pXUQrIJaFl+FGApOsQCb4vrP27RAwx3XASvyZg5AkK7bw7/jsBYQ+pyAuuj6WoNEYcmvHbWgqAnvX8Kc222DAxcpvdNsNqY7KYbyvb4P3LZQS5JI37ofsDbQdOg16gmsW3U4sMNbKrSo++FS5pRZnMC45YzHiDS2tgi39Qw1zV6ooziz6yzqyd+UkpqRzSWcziqr5fP+52uUAdx65c5CcKxWHidRFyNEhpbgbW1aoerc3xMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqxEYAU9Qmye78siaE1XDKZanqlKmI9P7yurEAelVE4=;
 b=gheVhnMeEm891wgixnpgwl6hrlK60Bdz9pW4/SwvN+AY3wcI9mtWyGAiuZ0OQ2f5n7tq8kwnSr3rLqxTdYtLuaPiGTRWSZdkTnt0IcuxM/cAoNE2iao9ReS8Klix2+c/mLjSOiiiCyKC7t+zE/70d8k1n2T4VtFF3sKsfS62yRm+lr2l89D01l7lg0NiPqWqA1LrharsIbTXU84XgHQPc4s5h3aMrUrJN2K6Y2H3+Q5TSQ45jWQzlByGJyoIfgklcGpxlgPDLMdKm1rSuqIN0mOJjtaZIrW2TbLtC0VUkEwYiRZ6emZ2doMQTUMca5WUSLuLKr73F9hHQJQgVNJ8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqxEYAU9Qmye78siaE1XDKZanqlKmI9P7yurEAelVE4=;
 b=pHaIoGw+RCMynyjCHjbHKnWgqr1wBJ3WnGZdNbtCbI419XlyZ9FEETOJjbr4zK6uNB/+UK6YpOVtoBJTQlcqxpXWXB1YdOFxTPqwzT4PftSZymX023XlMEi9CHym4fv+E6TCtv8G1Slny/zlg9sHGQipGkShdBb9OreVjgMVG8C3nJwM0W/QqHKFWFHLxXei1ZkAU4Aw242cLfGvDDGmeWNS0EJZTIltAKT5MjQXTN/CDTcMbSZJRPeeBpGW/cKAjtV/1uEMvlWz/9Fczja9lgsanH+KHwHlnLhuzjRQmi9XWwywrroiMuvuDlWXmVq6MJ8WYaneqzu4r+J/3AG8oA==
Received: from PH1PEPF0001330A.namprd07.prod.outlook.com (2603:10b6:518:1::19)
 by CYYPR12MB8869.namprd12.prod.outlook.com (2603:10b6:930:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:12 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90d::) by PH1PEPF0001330A.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:04 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 11/34] drm/nouveau/nvif: remove support for userspace backends
Date: Tue, 28 May 2024 00:19:36 +1000
Message-ID: <20240527141959.59193-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CYYPR12MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 3101ecc2-eed6-479f-3603-08dc7ebd1fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CsnSVw8RM+tAmT8dDx9VRlB+SRC8SBSotBHMu4cNHWQ/vpDSP9ZZUbT26jHB?=
 =?us-ascii?Q?dZlsgiAqtEOssxOxYnpLLB645hNzW6tTQbOn5M/a0CXhxY34z5XlCoMUB2Aa?=
 =?us-ascii?Q?wRIWNXZlQoU7Q94I3egNisBFicK4LCTUlVIAkpkpv2JGuxFWi87Vs6Mr6mAP?=
 =?us-ascii?Q?WAji8tWv774SBAhCyrReLHAcHkMJBD1btBEbTgdSRnN0NUOaCde0MF/KhVor?=
 =?us-ascii?Q?NCeDNWEJtnGCxjFzloQxkRClcpNJhdmcZO+AyaTXmJoww48TGpSTq7KMK4C1?=
 =?us-ascii?Q?W3/vkQvNHD8BpIpl9ERuIxfFoVfL8n2+mRnGqZ/kVKZI2OhqIOC2PKu6hUlU?=
 =?us-ascii?Q?daw/yak1EtjQYA4ySnQ3o2lWY1LtIrbJTSm3QFJPGKVoLi5WDEALgqWERKME?=
 =?us-ascii?Q?3XwRSk79NuN4uVMziK/B1zN23Sz87oau3fMRzgn7rgSe+j3c3AvOebQtZyiY?=
 =?us-ascii?Q?LVM4YfIzZ+7uli7prDBdoXKWHPQLfntgyiC5QvwuIHYhCeH6ss4nzwzkcJrb?=
 =?us-ascii?Q?gqJ30xuHyavch4/vC12jias2djaaxmlvlNuOJNQK3DXqc17kDJ5EkJTtxAQS?=
 =?us-ascii?Q?j/d0h5T7ez7AK9DHHVwn/YBKsN/cDAabKekmTojGjqqoReQjbIPnMmWUr5hy?=
 =?us-ascii?Q?uIsBSPjbTYwbuHgNA1a3xKsSlniWPEuXn0LwKL/Y6FpWAyKKt0aBvLD5g7Lg?=
 =?us-ascii?Q?kLHqtgwMCHuubfVQ51G70wSpnisv9d74rHNke5JY5quW5XdNDOKPLH1swX7F?=
 =?us-ascii?Q?NDxG3MvK/R5kym+yReeT+NWjHtU7Jf8V0cykS8SJSoPDN0nF9WZ9XqNQPZKR?=
 =?us-ascii?Q?NxFVHGAJpDwHrjyVd/iLhxrimXQsGAvi4sSLeSn8FR1p10VJQzd7lHukradY?=
 =?us-ascii?Q?CSxf+c5O8tHDFsVW1DXF/0Oq08U8mjGnAW6zcmW0g8zR6qILbPB82B9dbJI9?=
 =?us-ascii?Q?fve1oN+cYi5FjqkvrTMv7/Umt16u+EC5IggMCP5bhqtkI03QN7xaXQ9cBL8/?=
 =?us-ascii?Q?DF8g0dQVwrY5yFfIyPU19pHkUW9/5Ml2/Jl/87mbYlc7sXVJR4+XqyL+WgBw?=
 =?us-ascii?Q?SyQDMNWsH2kLiZWhmX2L1heGjq5NIqPwju6HZ/CudWiqB6xtF8yazjQQlC7b?=
 =?us-ascii?Q?/X0JnMLjmEi8DzNF2IfMJx89Wk3qWKdxs4QfeeTe6hgj2g7uwF779h4CnbbE?=
 =?us-ascii?Q?BWnZHN2reRFTn4Dx2pTKDppQR3TQCLpaxN8jnFVStlDOrbOUvYupTBcIPdrX?=
 =?us-ascii?Q?ZulNWtni9iOoywYk+jpBmS0okekp4Ef1TNlhT24v6/aemsx6Qd6ti0VohSSI?=
 =?us-ascii?Q?G0Jv/g317CbZpZo0UlL3W/F3ikpSqqP/vbgDxBNSY2Njt+mQzbpRxAhN9+Hw?=
 =?us-ascii?Q?kWgMxjg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:12.3896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3101ecc2-eed6-479f-3603-08dc7ebd1fb2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8869
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

The tools that used libnvkm no longer exist.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h |  3 --
 drivers/gpu/drm/nouveau/nvif/driver.c         | 32 ++++---------------
 2 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index 7a3af05f7f98..8d294ce3cf0a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -21,7 +21,4 @@ int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 		     const char *name, u64 device, struct nvif_client *);
 
 extern const struct nvif_driver nvif_driver_nvkm;
-extern const struct nvif_driver nvif_driver_drm;
-extern const struct nvif_driver nvif_driver_lib;
-extern const struct nvif_driver nvif_driver_null;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index 5e00dd07afed..acb708df2559 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -24,35 +24,17 @@
 #include <nvif/driver.h>
 #include <nvif/client.h>
 
-static const struct nvif_driver *
-nvif_driver[] = {
-#ifdef __KERNEL__
-	&nvif_driver_nvkm,
-#else
-	&nvif_driver_drm,
-	&nvif_driver_lib,
-	&nvif_driver_null,
-#endif
-	NULL
-};
-
 int
 nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 		 const char *name, u64 device, struct nvif_client *client)
 {
-	int ret = -EINVAL, i;
+	int ret;
+
+	client->driver = &nvif_driver_nvkm;
 
-	for (i = 0; (client->driver = nvif_driver[i]); i++) {
-		if (!drv || !strcmp(client->driver->name, drv)) {
-			ret = client->driver->init(name, device, cfg, dbg,
-						   &client->object.priv);
-			if (ret == 0)
-				break;
-			client->driver->fini(client->object.priv);
-		}
-	}
+	ret = client->driver->init(name, device, cfg, dbg, &client->object.priv);
+	if (ret)
+		return ret;
 
-	if (ret == 0)
-		ret = nvif_client_ctor(client, name, device, client);
-	return ret;
+	return nvif_client_ctor(client, name, device, client);
 }
-- 
2.44.0

