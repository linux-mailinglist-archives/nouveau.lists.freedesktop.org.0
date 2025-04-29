Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE147AA3C7D
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BA310E564;
	Tue, 29 Apr 2025 23:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sv0Ndm+K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0610E563
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9tqiiVSrknmFgxbotAV3ZWeMHOlREeLDKrgaAoKxYruNbvBySCweYOIvo1ZuXvj3jiPIve4QbzDyltmREX4cu6ElDvR3fqHvKY5qsDIQ685rJ+rrVi0rcCNK9dBa+j6lH2q1FQNj9qb2+U7FfjftGqLd+Y3Nof+avIjbV38dZ4aClSckKV2MU2E/HpnpQfz6rHl3anp9SqQP3g21M1Qi1fwxbxjrbjXS1L1xxkfwc/nU3bCMsqKieXawK+NqbDxZ8PANWTAM5+Wk/5eROvNeqF6uFGuqbJ9CxdJ9WIdNgeEJLUcWBwbUbd7pUaZ3k7QoyMI6xrEauceie7ZJvJD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myANm265d1vIngpY7mA5FTUUbh3ASYavulKCPqjeVNo=;
 b=qHyJTPvxg2SfjO9gAVnVSLHxUh+sEwZT9WXWkkkVrfeypDWH5zq/EpOAE0Jz1mMO+vmkSvEiuO393nTzpoNQuYp5NWRwUy/pWbErSx299UH2Orr7/w8Dm7QQE8oXDrpzNpD/oFe+CEhzMfzarppWs4qM5wrJfxYUQmqaRJGx+fR88v1oCjmrb4DrdHLDYFYU8lb8xuRySdabqP+z8XZjocrEuhSra3MKkwnkyVvn5JHHKXQmAYCwd7KoMV8+sbBfUdyWl7tQeGycIHmS3y6vDUsBxU19J6PxUX5Gjs8AVNNP5AftidLScIWyx0RSGi9fD+mXCNPl3u2ujAs2DcAtXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myANm265d1vIngpY7mA5FTUUbh3ASYavulKCPqjeVNo=;
 b=sv0Ndm+KGn4RBAt7MSNn/Br9thp5UTU5P430mreImNiGu1LSnkQEa2sFxi1lypP/DKMkUh9WK2S95pjNqJBv4P6u8xDFh4l7PUClgK4EizSp0jtVRcLMegKCKgi+FUNo1zG4SvVTJpFKbBJN/Xs+WmOuvj+cYRjXTj0Gd1zP9aY+dSp9iM4vuvvgWJ4p8gy9QpeP6Yt6Tm8sxEnr3trZ4Rt2C+7ApHQk7LHGxtmni0oHHVQzN0KoI/Fj3tq30jOrHhjP0NUrt308MryKGyOkeWY0j4dLpyDj92FKoWgyYQcM9Vmw4aofR2VKudZvB0XVYlCtee3DUL5FQY/lkx1l6Q==
Received: from BYAPR07CA0020.namprd07.prod.outlook.com (2603:10b6:a02:bc::33)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Tue, 29 Apr
 2025 23:40:08 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::ce) by BYAPR07CA0020.outlook.office365.com
 (2603:10b6:a02:bc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:57 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:56 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 14/60] drm/nouveau/gsp: add gpu hal stubs
Date: Wed, 30 Apr 2025 09:38:42 +1000
Message-ID: <20250429233929.24363-15-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: b7730595-16d2-4914-12ef-08dd87772cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uxV4mTZQuAlrzLLTriCMNrNut7ogHlLSYe7raJMgHbQelI6KAkkTc+LDDi24?=
 =?us-ascii?Q?ernPyIGmutHy0O7uWM57QQMHxKbxIeWpbSC8yR7aFQYEKsWJs2YQe2PJisJO?=
 =?us-ascii?Q?jtPb7VUa9w4IHT6hHAk43kCmQ7z3r2TSMxBetcUhLdwqSHDpN/rl/nuWvHOn?=
 =?us-ascii?Q?EKow+sVAC/ripafNs0HbUq3hpb3qR34we0ETaixJUVyXrqC2CUzNz5tJ6SlH?=
 =?us-ascii?Q?VET5LwOeJfubdCv1LU4SeSbxuje2EbP3h1laGNzTIXIKsjuUR3H7nJGJ8l1A?=
 =?us-ascii?Q?u72WmC1YtUDvao/GR1I+l+T4nXZqPaQir0QbggQhLELYm+qclafp5hGX7Zwe?=
 =?us-ascii?Q?blqQtZegghTV4i6SiabZjfbuqChp+ESmqZf6Nos8FYl1H9r8a49hHHmxyfmQ?=
 =?us-ascii?Q?s5nBIHX8r8MszxeZNXF/few3jPfKZN0y3LRrYnJxkYf778lp4Rj9FNfDkcjd?=
 =?us-ascii?Q?wGh0RAbSUcOia5S6yMzkqb2c2dsmXlYtiPeaGYQHvJso0zGI939udM/zfK/X?=
 =?us-ascii?Q?7J3bcoh0wTKKl4cBVKXh8X7+gCaFowzm0AG6PfI8rG8w78MvHONHeQidy4e0?=
 =?us-ascii?Q?Lf4Rwih5b0s6HOAr/FeI/NT4tPzyXlcQTWx2a2sdO2ttBowwQA3cv45R0RKT?=
 =?us-ascii?Q?2jhgj9A7vnpG0dcyRuu9FU2EXuiYase2pH8MHzTqwmjkUnY22SRsb0o6UyA4?=
 =?us-ascii?Q?aFjpFayhiSnWjEWaiJ5v1b0sY8UDFDnP0vgX/JAnSk8Ampua4islNLTHH74u?=
 =?us-ascii?Q?UfbKzuVIlytoaxKEcnhpizoEpKBdlJZtmOjuy5Al50IG+S980iVtheTOhOL7?=
 =?us-ascii?Q?bOOHX1fDd+5lUZP7dhuJyRYO/qR6Sz+VmC/16ct0BgKxT2jhrdx5BaaO3lwV?=
 =?us-ascii?Q?qiuhzHs+ggBdFvja+2T9uuXzSQRVcH7Z39VwXA3RSmPAu4v3jIpRnpd3WgKD?=
 =?us-ascii?Q?wmosHjPEkJHuOUL3f/sDynywBbgDnzRm9QDEOTGWLswNIcc9kLu62ZaTD6F1?=
 =?us-ascii?Q?LE2dWoznOI7+HoLsxdC0Cga59+JEmzkmewTkJhC7nWFi6LgCg5759LgeG/5y?=
 =?us-ascii?Q?Q6KnabVf8ZPeg7vD3J79bdKyVzHDPpYhjXgLj+v+X4c8jHoc8He6Pp0hpxUR?=
 =?us-ascii?Q?1PS3z6H404JlrpfW6X257DioJlorLtYhczLN/rEDoy2GKAp/fSGuzn/d5kXk?=
 =?us-ascii?Q?p52QZBCobLnveEUUJ8lj7wyIft6DDYWZGTc8xGYCozhxXI/XTLtEQt93AAia?=
 =?us-ascii?Q?FtbRB1Q1Wk5No1I/YA4XkTrv0iPLERyE9OajcSDLFe0Gu5YyuC+31U5DuCL1?=
 =?us-ascii?Q?1giDw0hIrwAFEgH3B1QJ5K6t6FlIFiBBs+oryD4O4n7XQFv4hRb3wMNpgOjN?=
 =?us-ascii?Q?62u9EqI64nGhQP/8skpMt29UEy+sf6Aj71tRCrV8T5OpzLbJ7kn7WRR7QoBy?=
 =?us-ascii?Q?im3aKgnSqKTIsKH2XDkBdwBWJ5R1dVXcdUmhm2LwspayiC0q3SOsE+H471BT?=
 =?us-ascii?Q?IiSbxHlxI1AJsHYzXyT5aUh0ZpAIpj83K7SL?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:07.9351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7730595-16d2-4914-12ef-08dd87772cd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254
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

With GSP-RM handling the majority of the HW programming, NVKM's usual
HALs are more elaborate than necessary, resulting in a fair amount of
duplicated boilerplate.

Adds 'nvkm_rm_gpu' which serves to provide GPU-specific constants and
functions in a more streamlined manner.

This is initially used in subsequent commits to store engine class IDs,
and replace the per-engine/engobj boilerplate with common code for all
GSP-RM supported engines - and is further extended when adding GH100,
GB10x and GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 12 ++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  7 +++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |  5 ++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    | 26 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga100.c    | 26 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    | 26 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  | 16 ++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  5 ----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  | 14 ++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   | 13 +++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    | 26 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  6 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  6 ++---
 17 files changed, 182 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 0d573ac48502..41d77fa0f7ba 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -209,9 +209,7 @@ struct nvkm_gsp {
 		u8 tpcs;
 	} gr;
 
-	const struct nvkm_gsp_rm {
-		const struct nvkm_rm_api *api;
-	} *rm;
+	struct nvkm_rm *rm;
 
 	struct {
 		struct mutex mutex;
@@ -464,7 +462,7 @@ static inline int
 nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
 			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
 {
-	const struct nvkm_gsp_rm *rm = device->object.client->gsp->rm;
+	struct nvkm_rm *rm = device->object.client->gsp->rm;
 
 	return rm->api->device->event.ctor(device, handle, id, func, event);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index ea2821e7a54e..d7933bfc59fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-ad102_gsp_r535_113_01 = {
+ad102_gsp = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -40,12 +40,12 @@ ad102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ad10x_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 0, tu102_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
+	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 78f2a15f0d42..0f8526aa969f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -102,6 +102,7 @@ nvkm_gsp_dtor(struct nvkm_subdev *subdev)
 		gsp->func->dtor(gsp);
 
 	nvkm_falcon_dtor(&gsp->falcon);
+	kfree(gsp->rm);
 	return gsp;
 }
 
@@ -139,7 +140,16 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 		return PTR_ERR(fwif);
 
 	gsp->func = fwif->func;
-	gsp->rm = gsp->func->rm;
+
+	if (fwif->rm) {
+		gsp->rm = kzalloc(sizeof(*gsp->rm), GFP_KERNEL);
+		if (!gsp->rm)
+			return -ENOMEM;
+
+		gsp->rm->device = device;
+		gsp->rm->gpu = fwif->func->rm.gpu;
+		gsp->rm->api = fwif->rm->api;
+	}
 
 	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0x110000,
 				&gsp->falcon);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index d9cdec4810b4..77e3501296c9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -39,7 +39,7 @@ ga100_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga100_gsp_r535_113_01 = {
+ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -56,12 +56,12 @@ ga100_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga100_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
-	{  0, tu102_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 7b8db70f3cb3..709a046d86bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -150,7 +150,7 @@ ga102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga102_gsp_r535_113_01 = {
+ga102_gsp_r535 = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -168,7 +168,7 @@ ga102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga1xx_gpu,
 };
 
 static const struct nvkm_gsp_func
@@ -178,7 +178,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
-	{  0, tu102_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga102_gsp_r535, &r535_rm_ga102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index e6f0e865848a..de274f6426c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_GSP_PRIV_H__
 #define __NVKM_GSP_PRIV_H__
 #include <subdev/gsp.h>
+#include <rm/gpu.h>
 enum nvkm_acr_lsf_id;
 
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
@@ -11,6 +12,7 @@ struct nvkm_gsp_fwif {
 	int version;
 	int (*load)(struct nvkm_gsp *, int ver, const struct nvkm_gsp_fwif *);
 	const struct nvkm_gsp_func *func;
+	const struct nvkm_rm_impl *rm;
 	const char *ver;
 	bool enable;
 };
@@ -51,7 +53,9 @@ struct nvkm_gsp_func {
 	int (*fini)(struct nvkm_gsp *, bool suspend);
 	int (*reset)(struct nvkm_gsp *);
 
-	const struct nvkm_gsp_rm *rm;
+	struct {
+		const struct nvkm_rm_gpu *gpu;
+	} rm;
 };
 
 extern const struct nvkm_falcon_func tu102_gsp_flcn;
@@ -73,7 +77,6 @@ void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
-extern const struct nvkm_gsp_rm r535_gsp_rm;
 int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 1c07740215ec..841b690c0c0a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -2,4 +2,9 @@
 #
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
 
+nvkm-y += nvkm/subdev/gsp/rm/tu1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ga100.o
+nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
+
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
new file mode 100644
index 000000000000..79dc1feee272
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ad10x_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
new file mode 100644
index 000000000000..527dd3cf4066
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga100_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
new file mode 100644
index 000000000000..7e8b52e32b55
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
new file mode 100644
index 000000000000..32d87ce2b77d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_GPU_H__
+#define __NVKM_RM_GPU_H__
+#include "rm.h"
+
+struct nvkm_rm_gpu {
+};
+
+extern const struct nvkm_rm_gpu tu1xx_gpu;
+extern const struct nvkm_rm_gpu ga100_gpu;
+extern const struct nvkm_rm_gpu ga1xx_gpu;
+extern const struct nvkm_rm_gpu ad10x_gpu;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index d1dfc616c9d1..5e6cf57a6f70 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -44,11 +44,6 @@
 
 extern struct dentry *nouveau_debugfs_root;
 
-const struct nvkm_gsp_rm
-r535_gsp_rm = {
-	.api = &r535_rm,
-};
-
 static void
 r535_gsp_msgq_work(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 64982d523901..37b3963629f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -21,11 +21,21 @@
  */
 #include <rm/rm.h>
 
-const struct nvkm_rm_api
-r535_rm = {
+static const struct nvkm_rm_api
+r535_api = {
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
 };
+
+const struct nvkm_rm_impl
+r535_rm_tu102 = {
+	.api = &r535_api,
+};
+
+const struct nvkm_rm_impl
+r535_rm_ga102 = {
+	.api = &r535_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 20841305fa55..41d4ed70fc10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,16 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 
+struct nvkm_rm_impl {
+	const struct nvkm_rm_api *api;
+};
+
+struct nvkm_rm {
+	struct nvkm_device *device;
+	const struct nvkm_rm_gpu *gpu;
+	const struct nvkm_rm_api *api;
+};
+
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
@@ -45,7 +55,8 @@ struct nvkm_rm_api {
 	} *device;
 };
 
-extern const struct nvkm_rm_api r535_rm;
+extern const struct nvkm_rm_impl r535_rm_tu102;
+extern const struct nvkm_rm_impl r535_rm_ga102;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
new file mode 100644
index 000000000000..5b5afd6f67f0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+tu1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 451d3e588d26..fef9c4444017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -268,7 +268,7 @@ tu102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-tu102_gsp_r535_113_01 = {
+tu102_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -285,7 +285,7 @@ tu102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static int
@@ -336,7 +336,7 @@ tu102_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
-	{  0, tu102_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu102_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 1bc806a18010..5f279813626f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-tu116_gsp_r535_113_01 = {
+tu116_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -39,12 +39,12 @@ tu116_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
-	{  0, tu102_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu116_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
-- 
2.49.0

