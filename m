Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C176E93CD44
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F1B10E8EB;
	Fri, 26 Jul 2024 04:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K1o6nhal";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F78B10E906
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TADfiIGhQZ65rykk1JrLJOKxE7vyDfNmDbROK5AClwZgHIVNJbHVssAk3ptcsibCJEsNNsl3SHprHT+MyibwnYhIPTa67Vl+Ja04foRlvqUXT+jga2e2u1j45fWvG7injYXWIr4SeRoYpjvblJ900GrGYsA0MD3nQ0PgpsFCRtVWDKbiYPbI28V+Fi38KSW1v2MRD6xopEbPkuIgzLdNup57sko3yUISm/LznpzWGWd1pXV+4bLaTRzWuUqcVa36zH3d0BOCIXn6Byg1xFMbFQASoob96eCVq78awFUMkV7tPa+aKKf85uBr6uxg0FsnsPxp3Cm2plzWvSfPY3VeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QD2RdJwSb5ZqDbZnmmmJXACu5J3PTGrIMH9WneKBR4=;
 b=xAdghpyW5icjdyLQTj/x2Cx2b4qeVXgFx5Dr1oNzKZaoC4ToKKyS2IjWfKitP9Kt5WsEI0Fq73aI5UMORcyYf2GAlX/f71MrW45Iis27fyPO61rvE+abrNhpsJatYUWRL2spomUjFqoNLF3cGDVlSPtcCiOy9RWiQMyBdT0pvd5CTeu2v/Lyg7KcgnUMZoTmoETsU1maEY58qXKcE4X3aNONNHYtuELS9KcU2vsygeA1Kr9qb1S2hxcFDUKkXrdedyjif0a2W5tDOb9ucWkqvSmuuMrs5Hp9p+QiPLEw6K2hcmsGMkseSf9BWVz1fZXvcCH3FJbRFi3Za94NWmzIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QD2RdJwSb5ZqDbZnmmmJXACu5J3PTGrIMH9WneKBR4=;
 b=K1o6nhalKiM/C/AzOoH9EO4/aJYqIp7lKmqZkNaaos2IMHkzowynxKw7uQ53DtHRmY0W1DFYJKssG7RbAyaPVbka/LqPoAP2+uZ35bC7TcIayVr/p2DNN5S6Ug6SPXVMTHymCc34aH+yipGi7SEimne6IHXWcy2ynEpN+45n8+l7lXalHHDrRVaaqAJ/Mu7lzNRaG/QLpsKp3mOamkZLJG4IBMqaT/EFXtT5TznOJ6/FSZj3TzVcsjOlQRNHAZuS57Do9SfPFvrg7yuT1elBetwgyMkJDf/LHO/gM5OQXkHR3MDE1A9VfGnERC8MOmTBeEvM1C7Nzutu+iOxLQuZ8A==
Received: from DM5PR07CA0114.namprd07.prod.outlook.com (2603:10b6:4:ae::43) by
 BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:15 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::df) by DM5PR07CA0114.outlook.office365.com
 (2603:10b6:4:ae::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:05 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 14/37] drm/nouveau/nvif: remove support for userspace
 backends
Date: Fri, 26 Jul 2024 14:38:05 +1000
Message-ID: <20240726043828.58966-15-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: 8422b3e5-ba3f-4f38-d7d5-08dcad2ce63b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k1rI40/L7/gPtGd5EahNNbWM1AoTYw7t4DVjJTFgAICSGlO90dazO4LgRNqX?=
 =?us-ascii?Q?xVnkbS188bNQiaFz+f2HTsLFbwqT36RVOe+4aRx8GOI7R2pvKOk36tKIW/QW?=
 =?us-ascii?Q?hcQS6SBRR+EiP7jAI7D15np3DOHZ+uQrQV77pBJveoYifr5z3YUp1T2ZUQjZ?=
 =?us-ascii?Q?Fm9nFUvi6NPKDt3N0cNyBmfP56Hijxm0INGcSGhhDzaMHOgMPMwAYv6RVaqs?=
 =?us-ascii?Q?OPK5OfVLdCxT7GuIX9Xu08I8GpY8DLXjrKoJbseMW/fsQlt88PbCadBSP0j1?=
 =?us-ascii?Q?/7n9R8bOOf1uEn1XqTx1wPPqOeO5XtaTrXieTxTPWDUypzkFOPZ5fjOzX5O5?=
 =?us-ascii?Q?9S7V1GI4MNmZipPCite8/t8rbJb+0Wh/jqIMNURLMKjjHzh2P7ZDQKkGvByZ?=
 =?us-ascii?Q?8/PAHy4i54eQqGugH5AgiO2oQpe4urVCSN9oWEnclaxnQX+c+StaMDPvIjqh?=
 =?us-ascii?Q?zPsAI2FNDErRZHdJojbIZ4QAzwYgY8x+5TMNBUrHErQFhsfi8fHadRXDoNSh?=
 =?us-ascii?Q?N0omBOrb+oyM9z5bEBjy2lxIwPwVmf+2PM1dISgL4W/kNCwPgMEvUMhNkIWm?=
 =?us-ascii?Q?dc3jiHcGLFWBE4sRjENBJ3VXD86fnunGNc4i4ExE/z6IKNrdgXZfGzrjYarO?=
 =?us-ascii?Q?hlFu6hGg671dFHqGFQMGCx6B4T82+Yw+UyjLuc/oOtotY98x0f//zxSnl8Ob?=
 =?us-ascii?Q?YjcY0d68MQ87r1cFzDbbHJTYGeC8FmxYgzP5AQwLk+EQOTi3121/s1mvgtzb?=
 =?us-ascii?Q?YPdLv4nM46O967jeP+lZCnKH/c/M81NDhq4PVsjT4rM06FTXm6l04L5vOLcE?=
 =?us-ascii?Q?tNH3RzFPGtfpFU9FzOlkziCAyHYq+ZdDqaJULP0H06cs8Kv1lndvhf8gCugu?=
 =?us-ascii?Q?ZfSqx2qy0qCzKh0lk5TIOGlBrPajKf06yUZTHKU/9Q8r0BBZtGnZ1XwdVOg+?=
 =?us-ascii?Q?TEOdWyR/FqLWLo5iSomxpYel5BBGi2/RmecNf9J1oUH1gwOUjCTBtWSz8ugc?=
 =?us-ascii?Q?3txLgh7ku/Fp3+2PwP+vRBEcLPxko0R8TYrcvxBpNwwWaWjMXuXhOm4Lvl+0?=
 =?us-ascii?Q?o31YUxCJgenOoSvrhWUDcZMpKt2VvAbYet9Baa89Dn1caT6SaqSW9hyU4a/2?=
 =?us-ascii?Q?oKkTkyj5+1ssY6Xk7J9dWip9JnXxznFJtUsFs4gNr0elIws8IdhBfu+oz9u7?=
 =?us-ascii?Q?Cv/PO7U+iLs29Bj21zAX/oPKn2zltKN17HIf3fyAPZwxtfTQiW5JyKUqzLBL?=
 =?us-ascii?Q?kwO46W1Tt+OlxhskbrQbBkHcqKFZMMC2RY3Yuy5uoC5kLKpg2zS1p3DOs8cg?=
 =?us-ascii?Q?5Io5k0RrGCBrvmzNbtILblVVfVkpz1g31lgMk8MUy2b4FpbJHQh6UCjYMQWj?=
 =?us-ascii?Q?rTont5nW3fUAwZNh7J4FtAfniZvlcpqdeTuA5KrdbDKtd5vcOFEjhEJLAEne?=
 =?us-ascii?Q?cxeTkLUaUzv6cHbvElQD5HJ0aUW+aC6M?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:13.1053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8422b3e5-ba3f-4f38-d7d5-08dcad2ce63b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
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
2.45.1

