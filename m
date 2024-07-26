Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211193CD3B
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43B810E2B2;
	Fri, 26 Jul 2024 04:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TtMVF71d";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9D10E246
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLjPSr2mRkoYAMOuXaikvOlWZ6csf5uMZ4KxF+Ia7vWROalgy5ZAYOL8ZbatMojVSeOBLLCegNl+l2/tg9Uekn+ResM03Ri0/phUbsnFsvhOFYxZvjsQsc2+WZKm2K8IL4YQlcGw6l9OvG+0SmAACSi3hnXYKHr2Wx0aa/0pafjCvYzdQVL3MGjfXgB/dXYYoueGpUeuJHVK0z9Rl1REBwu3UGoMcqB+RJqGk+H6p5wt8yP8ghLzHMfbd0XBgFa5svok2nwFY0yQHnKILp1n6DpPHhBchFkWrSP2JsROWVW6qL/YHFAFLw0qKfWpUlzbZq/b+325sNIR9JptUQHNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLnm1y8qRdtQrhg7h6HbEovBqNU3gM7iXd5+G7rSr5E=;
 b=YOaQ/sgUCVgLRdgAA+wYmqEAa9a13QFZDHCKni8pr/MvDybQuQDhr71Q7+U1/xOZzbzH2q/8ERdII+BK1pbhH99E3/kdMW8wNx2/uEDth9LyYWUeD4KEQM82ZRX/ep+vokPq34O0y0UHq//WoVNUx9RC+P1dAMmvdRwAu3W/Bxg3Oldje1txCgay6JIERXZuLSQECyeYnHKWaYjXmqx2GbcAl+Oh9FFwmPtY/tLIOnMNV9LIzWgQdyWVxQcck6P6Z32Xn7dDd3qiez73WP1KC09qxkLSr+Xeuyhz1Zrpnvmi3oRLvAWi3SM0fCHFXGv5ir9l7vhTw8wNt30kQDRcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLnm1y8qRdtQrhg7h6HbEovBqNU3gM7iXd5+G7rSr5E=;
 b=TtMVF71dMEcFGENc3PfLSd7GcytvLWBjScXaL+DEZIf5Z0IIacTObiuHszoM5G0ojyGyxst9tWFeNeS+Et15apewhVRJjFW34wcZx965+9dtkdlG5cTSZ66YI1xcrwPaaMSiAzsQUuTbrl0M19VtsYyCd33VNMcx56Foxg9G0/Za4lgZfd4AaqwXxhUFh5XTdO2wQNDtL+V7je5OTI8KPuyho+YZ80hO8cDhPX+NbUL6lJewfbA7g4iuIJwDqVaNR345YHmjdeAMhhIJNsL/xxci0e89/fSG5NHtqxBD3iBmoU9hlRkp6zyxNa2ga5tJo5e9ZmYTtwKFvode2Holwg==
Received: from DM6PR03CA0043.namprd03.prod.outlook.com (2603:10b6:5:100::20)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 26 Jul
 2024 04:39:00 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::6f) by DM6PR03CA0043.outlook.office365.com
 (2603:10b6:5:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:00 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:52 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 05/37] drm/nouveau: store nvkm_device pointer in nouveau_drm
Date: Fri, 26 Jul 2024 14:37:56 +1000
Message-ID: <20240726043828.58966-6-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dab3996-567b-4e84-6a3d-08dcad2cde7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?woHprSNkEOkI/y1Xb/grgc2u9pEF5N3eMzoe6Sb8bsGdpfBc2hFQfqcB4ADO?=
 =?us-ascii?Q?1Os/nhSQHwffCCRhGI+AVia3NB+SEAdlYdiLm/REXoZkS7zkEHfbU1NTOom0?=
 =?us-ascii?Q?JI258NK8ksujsaLdqxTV31XE5zmhOo7wQpEh5CNyz2dlv2SCe52/SGRn78Pm?=
 =?us-ascii?Q?E2Xm6YN7LH7+or8eyLhRQWLrottgPlGqmSSDibnYEtvV2CqnWGL+Cn8DWFdI?=
 =?us-ascii?Q?Zs7fuLeDeo5iopYG2Wcy56id70h85DFLLAMP63mv9Il2xSycC/jyVf+eNrFZ?=
 =?us-ascii?Q?03Mpe5N8UmJLpAUfV1TqUgmyCyoCGj2qKCUzlO9kvkp9pXXmagDOfxF5GPgo?=
 =?us-ascii?Q?AU1W7BEZrZ2A/3maD9aIIf1YCabsvZYH9ZISpvh8r1QbaUKbs+zufu8HyH7a?=
 =?us-ascii?Q?aVW+M2Zp4avhliFMTVv5i5eTjuP5inH+2vVj4dgouzDj6m5n9q40Jbu28RFu?=
 =?us-ascii?Q?W8qWrPjlQoFG6dEqxR4EOuz+o2nDeRFHEbaDEG4z86bRQw+51WkJrmDRzLTX?=
 =?us-ascii?Q?vMJMdaX/p+O29SfjvTG9q5qdD+igaf/bEnWFj4k5TEz/l9kmat0jcLsqaVdF?=
 =?us-ascii?Q?E0jZFlA6dCC2LueqyTMo6OFVqeD4+nd36ji39mXiSJeBd+fXulDtQlrB03hA?=
 =?us-ascii?Q?H9QYpidCHZrArodsqDszhrNzSTDL41xkDNCMlg65RygNkfO6Z0tkwluLnK7A?=
 =?us-ascii?Q?UIErZ6JLZeQL1tvD6M9n2TNiKc9LTEiaDzcTocOdyOktEzMLRh2pkT1iXZ65?=
 =?us-ascii?Q?M+NFIfXp7C7uY7ee3/Cc9CtU7SDTkGNDlGwe54We12hoG0yb68S7MBakmMoc?=
 =?us-ascii?Q?o2k3uqZCsQwOVxItNXsBx2ve8qP7imbz6AtOyKwg940HEl9Ydg6vXLmJ1xF5?=
 =?us-ascii?Q?ZQESMluUvzFZ0Zg/gxtfWiBF4jd6wLIqOVE8IdRnDqdGrtatZ4as2LiRVSIm?=
 =?us-ascii?Q?DiNiC91nQ2VcSPB99+gJISSO6WxMZl9ddVGM7CGzt9wqaT3RB8HPzqUJO2Sd?=
 =?us-ascii?Q?jl+znzJiknOWC8l0n4ylr6GqB9yzboznlo2KWK4/7W4HG8NpyDf0jFCqabQZ?=
 =?us-ascii?Q?scSRQfNaiTMln9FSWnSWxPR/lLUUGaxG1rciGowFgPPg9z9GKBSOP2re7o7C?=
 =?us-ascii?Q?RCZvIr0n+E9HtxZ+vLoaSbkwYv2rZ7/Y65XXnIgFZPPt0KpoFwdIS0zFOnoV?=
 =?us-ascii?Q?Ti6wULBHlJtfztXSnhhMXLD6NhD1fwZtjEQu8PGqVnScJ/Ic01WcB9ebtY6+?=
 =?us-ascii?Q?57G6LAFqR13oEfDHo//cBQn/EEab1LR3Xn8EAHwyzsnMNDvUgROi4bCTUnx7?=
 =?us-ascii?Q?0Lk3/1sUL55mmb0KR2PbnbZvQBQsGaiZujAQ1eycBqrDmmEFz2Jg/w1m5jiB?=
 =?us-ascii?Q?nr3wTgOM8sqF+cT7QU8iBvsdHfOxehw8ylZMsiQLuhMPA9fGgyL0FCQWo3s3?=
 =?us-ascii?Q?Nlm9BF2ThuBvY6RdnPwQbsJ19WOaSHr1?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:00.0936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dab3996-567b-4e84-6a3d-08dcad2cde7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
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

There's various different places in the drm code that get at the
nvkm_device via various creative (and not very type-safe) means.

One of those being via nvif_device.object.priv.

Another patch series is going to entirely remove the ioctl-like
interfaces beween the drm code and nvkm, and that field will no
longer exist.

This provides a safer replacement for accessing the nvkm_device,
and will used more in upcoming patches to cleanup other cases.

v2:
- fixup printk macros to not oops if used before client ctor

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c |  8 +++-----
 drivers/gpu/drm/nouveau/nouveau_drv.h | 16 ++++++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f372bf2954aa..140e27af0d64 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -751,6 +751,8 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
+	drm->nvkm = device;
+
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
@@ -888,14 +890,10 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 void
 nouveau_drm_device_remove(struct nouveau_drm *drm)
 {
-	struct nvkm_client *client;
-	struct nvkm_device *device;
+	struct nvkm_device *device = drm->nvkm;
 
 	drm_dev_unplug(drm->dev);
 
-	client = nvxx_client(&drm->client.base);
-	device = nvkm_device_find(client->device);
-
 	nouveau_drm_device_fini(drm);
 	nouveau_drm_device_del(drm);
 	nvkm_device_del(&device);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 7e624c587fc0..e7d072a9a477 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 #include <nvif/parent.h>
 
 struct nouveau_drm {
+	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct nouveau_cli master;
 	struct nouveau_cli client;
@@ -332,18 +333,21 @@ void nouveau_drm_device_remove(struct nouveau_drm *);
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
 
-#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
-#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
-#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
-#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
+#define NV_PRINTK_(l,drm,f,a...) do {             \
+	dev_##l((drm)->nvkm->dev, "drm: "f, ##a); \
+} while(0)
+#define NV_FATAL(drm,f,a...) NV_PRINTK_(crit, (drm), f, ##a)
+#define NV_ERROR(drm,f,a...) NV_PRINTK_(err, (drm), f, ##a)
+#define NV_WARN(drm,f,a...) NV_PRINTK_(warn, (drm), f, ##a)
+#define NV_INFO(drm,f,a...) NV_PRINTK_(info, (drm), f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
 	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK_(info, (drm), f, ##a);                               \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
 	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK_(info, (drm), f, ##a);                               \
 } while(0)
 
 #define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
-- 
2.45.1

