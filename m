Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41592AD54
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53610E45F;
	Tue,  9 Jul 2024 00:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m6rCsg95";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86BD10E45E
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFTiZ0VCgVCG+z7mvGtofK80n/pasgG+08gC+aZTGHl3S+2prptsIOuA1Q6yBgdk4R5xqpkrCbWqt1VEDCG/iuvhHc6X3aImBjNhSa4Yp7b6wwFdH3V2uQykBQSdoB74XHiPzBu2NBrWzR9qJqsbUnkotUPB9fwZoe1XbNstsUCntau6RnR/9GOpiP1TY0HIHhBbIwZ0AlB0S5FpKdzpaY2BN0T5KBkq8WaAU8X35WU8sxoO4KvxgD0Ea9/VCRn0wiy1SE6Uu8lR5zLNz4LnoOYs+zd1TbdOVgSBJsh5/vbEwww4Lqzj6moENaIkeE6qUxSGexozyCQkRqOYJ1wSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QD2RdJwSb5ZqDbZnmmmJXACu5J3PTGrIMH9WneKBR4=;
 b=bLYG3adlcuHLlBlr13l/CnSM0QWAvVoOSwAfVnTxngef65VP65nHRIGlSstWrO3HH+gQo4DyNPxp9FCZYdQ0BqluJQ8JyHQz1j4rmoOmI+JOYBy50TDvs7tVBCeJkWlpIFrStY0icrONGQms/RvASA45PvENHc3qm8IwyRQ7PiwWuoRrMeE1pwGwxW6MPzoH/ED263Ua+DVXPOrUUsp4xrHQkygh/utZgSERFKnWBp2tcvgeLyC7tNX85Pdtj8bltEt7o9Ro8073cxCg52NhFQ9vVw1mYj1eAPclXyiGqiiJbz7wA5TA4X71pYsHBe08jyW1UcyQHeFmzrOeQKeWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QD2RdJwSb5ZqDbZnmmmJXACu5J3PTGrIMH9WneKBR4=;
 b=m6rCsg95rP8DnNpP9hbYK6Gn5VHaWltONmdwPCNFePYdgyQV9xEZqYJofdLnhFPajBXDDqY/OSO+E7KCha2w0rfj6Ip7/GI3O1k4Aemq2vdaU6OSS+JNYYYSN9Tf50tP9iQJTbe8L5DXzfpT05wPPEg2P1H5wpp5Ww+r9BkP3i9MXgbomRqaBIgvBpkOT7SonNrESxi5uCVdL7KKaFI+j/gU9JNwOw+e254JsZSWaCdfCCMdv8L/x8rmbKB9UxK6pIXt9QuaV539FDUIBYNaI9cBFghL/ZT6KqwLgFzqZ2Krya1XYIxjVvr6+T2YrLpdcErO4q7MRoHK5dLUTWUS3Q==
Received: from CH5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:1f1::15)
 by SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Tue, 9 Jul
 2024 00:55:18 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::8f) by CH5PR03CA0021.outlook.office365.com
 (2603:10b6:610:1f1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:07 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 14/37] drm/nouveau/nvif: remove support for userspace
 backends
Date: Fri, 5 Jul 2024 04:36:58 +1000
Message-ID: <20240704183721.25778-15-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ff761d-ba1c-4a96-1e3a-08dc9fb1cd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTSOV+cbgRsnCuBcB4GSEm6zsHGfWL51CfnKIrWd0ZeaFRa89I9/xm0In0t4?=
 =?us-ascii?Q?kNFP7bZA0R/kkVvrFetgMl9LB68tHofTGbcoQ7DNjeEvua2AuMBDJ44CtLIv?=
 =?us-ascii?Q?3GmGQ8pZrvbDpeHhSmCakGEaFFYugqlCuPvzG5H7/HP65O8blUXjilGnYtz0?=
 =?us-ascii?Q?DnyuipETqpI3kh644ZUUWl8luqk2AQTxK2tGUvQwwvIproYU/KaxqYJfcdGq?=
 =?us-ascii?Q?SJCeJ1q2lNQxMoK0W3ycoKFzaJNrT2FwxddWT6yTQaHRAafcxU5teFbwYspS?=
 =?us-ascii?Q?AjC88OuoBn99kYvCrscOLKhHuehkwrLfZwuU5HjUlwnrt4grc95iGnrP5Qir?=
 =?us-ascii?Q?5uEGn48YRwByAct4Mcwhv0RpXZviSm12naPmgnMVKoH9kXspilTEMr7HQPFs?=
 =?us-ascii?Q?nnaRi4bPquN1wzjx2TozxaIBhqBhH29uuB7k1V+PRajQFrJU+gcOGjcxrmC7?=
 =?us-ascii?Q?KSj6/5D8DjjC6AoVqhbT4dxB7qIbO+vr3kM7IAROdeUr1eEvMQ91njr+ZXVx?=
 =?us-ascii?Q?K8lUGhz9/cpAgrbaAvu1vbC5AD40b2v/il6MsJTzc+yomxGsuHGgJ7kgA6Fa?=
 =?us-ascii?Q?uPK0E9JQsxChDlnX7fJJQu/jVd1JwvFk4M25qMyXBOAGRMIeMmpn+hqcMIyl?=
 =?us-ascii?Q?C/dSI0uwnSAzaWBYJVcoAdWjDwlbM0XLY0yX4/WlzCcW/QV1XOyyOgINIdPx?=
 =?us-ascii?Q?vbxvw8JFGABxkJC9ddlnGuSreDsBs9eJiu8iXUsV3qJpEDpzCQjTHrlRJAeE?=
 =?us-ascii?Q?WeKfE9c00/UnadSpjCPMFodWES3YbzR/cc3mP0z9oz+RxjFhtHril7Jk6SuM?=
 =?us-ascii?Q?Kp+Kt15b7y4hrzWusLYlr10RjA9zCmsrI8PxU27/xyjS5i9jLGzsmhmHIstM?=
 =?us-ascii?Q?DlnFmbgYE5uPxWe3z6KcuFJrltg7Z9qdpvhvAf5Mln8uEUd2exjee5gOsNDZ?=
 =?us-ascii?Q?XTfDG311CmnPeB0HykfO0BSUmCj10wWCT467z/syI9KhCkxRgi1bywwF3zO/?=
 =?us-ascii?Q?VNJQQTAZ69bDiYyn6fWfEaBCf8QMGfOUiYI4J9jzlWKzTw9yMxKvILJRyVDl?=
 =?us-ascii?Q?jj5fCYtsKRsx9nYYit+QF3Pt1aKV1/ka5Hd9pQb0l7DW44mF4h5zq8X/IgQH?=
 =?us-ascii?Q?ccY+onb00LRRHuY5pqU0iVslreM0VMDVkPd5QcoIO0G3NXJtuaeHr4d0Smi2?=
 =?us-ascii?Q?2za3lNymP0BJf0p1SW+RC72xmGMXiEnQZ7e2SDsQriCcSvBTUOYocXaWuAOf?=
 =?us-ascii?Q?7/4ZegPN8UpR5Og0IxF04tgFkajeaPppiRWLdZdlqHRSyVCdSbsgZuH48Wu2?=
 =?us-ascii?Q?a/gyDwNGb8lEAmt5GKaNymCe6dDOtC+tKTKFGh+Q2UOce4KM0xsiz3W6m2If?=
 =?us-ascii?Q?EcIXrlmsqPmJ4hmXsL8Zt+IkSFE7r8PrYsfZXnhA/1Gzlf1MTMKhYI2+PJEV?=
 =?us-ascii?Q?YEOdpNSREJUf+CzdDfCVMQUGIt+uU78J?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:17.6381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ff761d-ba1c-4a96-1e3a-08dc9fb1cd0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834
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

