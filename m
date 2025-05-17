Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A3ABA701
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320E510E119;
	Sat, 17 May 2025 00:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b3QguN6w";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D42110E119
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn9eRyls+h2pjud0pRGzer20bAxylqVGFXp1LelOWXxfZ7eEyZz0chb+e2v7YKfZfuHnTn58LXpCVlr7rRfHG3FMQudgYz55/cNGWhhDzTQF5QAaz+anOhoW/Y6l4Go6OZpCOHedu3tBqNNQumSc3++y2goNsCsEd+JTQd27Cfmc6pzmWdXMgfsZOv/e+OV5oQtlHS2z8dwxy+73o5Vj+8fJAxpUu17FC/GlTKStk3ZpuxQbuU2daNR2xpGzNwS1dpm09Ns6X5IsONrjyUDyFy0AGyZ+9POMnM5aOceA5iIO7/txBRBDLI2TXHfPLuIka6j6mDidH/pskW1HhOF2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4RR+eX81OlbB8cYmawCw9+GzOiq/wWEZCbA+2QUeUk=;
 b=RtNNhybj7k+zosK4n0fbpHFDzB+BWy0Nibaz4jhf1t7j+0AIt3ban/UhNdkurxhTkIPRym9gNShmeRtM8FQgREpY+sdQVdIhPjkb3KOkgaHz6jQXijbVjxiFbcdKWrU1959RTxO5L1xU5BHNiP72l7eEMPm6wojWx00q1eCRtdCoVtMEh/X78EBBLpl+BmJHvbCAlThk1assrxgi+IYBULKDaa6ex2t7Mc6roE2xp973CIsGing8owOBfQUWdRypzvPFNwuaBoXgwcut/uBC3wxDBMBS9BJtGztrCXzn3ZLXyq3/YbhmY7ZlzC3E8PuPQI1SfwKHi6EWyw5WmUZGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4RR+eX81OlbB8cYmawCw9+GzOiq/wWEZCbA+2QUeUk=;
 b=b3QguN6wd3clCgZC1faRrZn5jbTJ3Ii/iLk76jb0MmvEqRQ8aXLErERius2wn2wCDrpM0Y8H1BCXwNxZiYoDtlYwOBknOeyDJobjmfVCE1EHBdTeuwwRLthD6LnmML0MxZ4a7QsUCiKzndyWqBJ3088nNYnWBYaHdfw91J65s8jw1FKjc6ABdZCt11L7/ucp+pOqHNVkeDpDIORuOLmngGGvvKe9S5wpfz/Eke2Fri9Ui0EmjjcnaSfpnq/c0acCKA/T74F8gjgVSMVk8O+iV1M5kMqMOuhUG4ju0fc4bnH4bz61ubEqHrU6K+/ALG4DHo+uyCwJwrLfMgsNfZ/B3g==
Received: from CH0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:610:119::22)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Sat, 17 May 2025 00:10:36 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::92) by CH0PR03CA0369.outlook.office365.com
 (2603:10b6:610:119::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Sat,
 17 May 2025 00:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:21 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 09/62] drm/nouveau/gsp: split client handling out on its own
Date: Sat, 17 May 2025 10:09:01 +1000
Message-ID: <20250517000954.35691-10-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 017e47e1-6da5-47b3-3f06-08dd94d73f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbE/zrNp8+0/0zOtCS/CmLRDgK51nIpbI+5/HMC9Vzfu8QzIPguOfQIFunRk?=
 =?us-ascii?Q?yPMGHKYb1eEZtsugIcXadgTJ1hqssYsvLwAHIkNI+CGEhdi1iIatVwcbWzub?=
 =?us-ascii?Q?Gy4LpPsN8U7TqI4jKGS0iuG2Fv5otMQAeMTSbaUw9bv7DbOBWtDwIWC5t1S8?=
 =?us-ascii?Q?/F30VozOroGEFaYC2hsoq23vD6cECGQzMsqplHw1OCjW2Or99DE+8vmeY8o+?=
 =?us-ascii?Q?4R12nozxrw8bVfMZ+lMVZ0N4eaUpLyw3+Cs8fj39SfKz3YYCMPSYiX7y0Ost?=
 =?us-ascii?Q?ksfanDCMg6JD8Y6t0iGsrPqwx1U2M//TV9zq0MDzbqguPFqCiA6oyAfF2VCE?=
 =?us-ascii?Q?XFQHH8iP/ScR+kXP4ehCxHoXepWowjQ1Zd2r7a2ixNMe4nd7FZNW06aOYLEJ?=
 =?us-ascii?Q?Ln8TdxEUyA8BVvu/RR6dTN41KEOTXQkm8y/qwsZisStLwh2NcFR78jMvhXMi?=
 =?us-ascii?Q?UK0SyfZ2hvinAfQ4yyfI6IrSrqFKnIOU1rZmOZj6RivVjXakdL8iNYek0wsT?=
 =?us-ascii?Q?uPJSoZxdT/Tejzesxj+jX1l218lie8XzVRogXKEzN5p0jMxB0E3ux8Wpew3p?=
 =?us-ascii?Q?b58EF3/TyBqkwfEi0AEOllk6Y8YphWm7h4DqG6EAZWywwlwZNoAVJwEIjQSM?=
 =?us-ascii?Q?z+q2JVU+RbYeFwUNcJQFPCgvHbYlFj3O3gDgUte/kh6ysUTQnTQcQUCD0h5M?=
 =?us-ascii?Q?Bo54lMtzozKd821J7ASDBRxJFxbwBXOdfWSYg4iJjgH9yWDlGNUFqnrdWRtw?=
 =?us-ascii?Q?7VvWAbryEdyDv0ZRzfSs+2uzkeCGAu2WYYfFxUe3UtBYX6HjUgRKzpvujChT?=
 =?us-ascii?Q?A5Gpoop+uSO4flqBZCsVTe2MCDET2+4Xpu+LPePV7BDGHePkybcvyySA9RuX?=
 =?us-ascii?Q?Z5+z7uhuFfBhQgOXLmdKyqr6XEOYt3bSy40PEeGnBpwdhaei+3XbEjlMyKMw?=
 =?us-ascii?Q?yKvn7dFuipvkWXnu/miRHdIrZQdrIkuzDcQs+4yAbBBDEC89N9loKwUX+Ce8?=
 =?us-ascii?Q?QdW1y3JvYAqiU/pPYd4agRAYGf7Y6k8kAmkZ33MSMZBkSJsovo5UVwblVCFy?=
 =?us-ascii?Q?KUZJm/Gb+Ha389TgjVsRF4Ejk+hw7gdcogq9DwVo/0QQseQLaz1Zz6h4hfZh?=
 =?us-ascii?Q?/s3BEoBfHrV5ikm8zaJUSiHuM1gww+e2d8RHv6M3sWnVMTyl/+VozMhY5rcP?=
 =?us-ascii?Q?D9sZeVpcT6yqy0Ecxro0WoHA6FqLqiwrg4ey3Ew/7YC5b5Pfbv5kLilQqCh8?=
 =?us-ascii?Q?WS/HHwgLkkI9zwIxOTdntLC/EhrXkmf/5d4OxKBNmgN5l+QJIdPpCo6qcOUD?=
 =?us-ascii?Q?iH9kSrrYYhvnITWewsJM4HDyTLm5EiYLL/TXBFr+nyHPW+ZLaepi+yjaTGIc?=
 =?us-ascii?Q?1wm/EfgjxOY/87qXVG6JJILyldvSyPSPtMOjsa8ubRX6PZr1K4IQu1muO9ZF?=
 =?us-ascii?Q?TVVci1zPsrotlTBNpDWLxzHUhdfemWYS9J3vRGmKQchIZmN1mG7cnAWkwaCB?=
 =?us-ascii?Q?pq11ywxFnDoFhcRFxOmkepXyRVfwolCj6q0R?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:35.9307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017e47e1-6da5-47b3-3f06-08dd94d73f81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
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

Split NV01_ROOT handling out into its own module.

Aside from moving the function pointers, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  7 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 53 ------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |  1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c  | 80 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  6 ++
 6 files changed, 90 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 66e3873155f0..2c3d8fd04516 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -212,9 +212,6 @@ struct nvkm_gsp {
 	const struct nvkm_gsp_rm {
 		const struct nvkm_rm_api *api;
 
-		int (*client_ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
-		void (*client_dtor)(struct nvkm_gsp_client *);
-
 		int (*device_ctor)(struct nvkm_gsp_client *, struct nvkm_gsp_device *);
 		void (*device_dtor)(struct nvkm_gsp_device *);
 
@@ -425,14 +422,14 @@ nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 	if (WARN_ON(!gsp->rm))
 		return -ENOSYS;
 
-	return gsp->rm->client_ctor(gsp, client);
+	return gsp->rm->api->client->ctor(gsp, client);
 }
 
 static inline void
 nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
 {
 	if (client->gsp)
-		client->gsp->rm->client_dtor(client);
+		client->gsp->rm->api->client->dtor(client);
 }
 
 static inline int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e9be8c2ef07e..c6fce9541c0e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -33,7 +33,6 @@
 #include <nvfw/fw.h>
 
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h>
@@ -177,62 +176,10 @@ r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *dev
 	return ret;
 }
 
-static void
-r535_gsp_client_dtor(struct nvkm_gsp_client *client)
-{
-	struct nvkm_gsp *gsp = client->gsp;
-
-	nvkm_gsp_rm_free(&client->object);
-
-	mutex_lock(&gsp->client_id.mutex);
-	idr_remove(&gsp->client_id.idr, client->object.handle & 0xffff);
-	mutex_unlock(&gsp->client_id.mutex);
-
-	client->gsp = NULL;
-}
-
-static int
-r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
-{
-	NV0000_ALLOC_PARAMETERS *args;
-	int ret;
-
-	mutex_lock(&gsp->client_id.mutex);
-	ret = idr_alloc(&gsp->client_id.idr, client, 0, 0xffff + 1, GFP_KERNEL);
-	mutex_unlock(&gsp->client_id.mutex);
-	if (ret < 0)
-		return ret;
-
-	client->gsp = gsp;
-	client->object.client = client;
-	INIT_LIST_HEAD(&client->events);
-
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
-				     &client->object);
-	if (IS_ERR(args)) {
-		r535_gsp_client_dtor(client);
-		return ret;
-	}
-
-	args->hClient = client->object.handle;
-	args->processID = ~0;
-
-	ret = nvkm_gsp_rm_alloc_wr(&client->object, args);
-	if (ret) {
-		r535_gsp_client_dtor(client);
-		return ret;
-	}
-
-	return 0;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
 	.api = &r535_rm,
 
-	.client_ctor = r535_gsp_client_ctor,
-	.client_dtor = r535_gsp_client_dtor,
-
 	.device_ctor = r535_gsp_device_ctor,
 	.device_dtor = r535_gsp_device_dtor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index 48b432c9005d..f25b438fa3d9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -6,3 +6,4 @@ nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/alloc.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/client.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
new file mode 100644
index 000000000000..7a2da37af283
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -0,0 +1,80 @@
+/*
+ * Copyright 2023 Red Hat Inc.
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
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h>
+
+static void
+r535_gsp_client_dtor(struct nvkm_gsp_client *client)
+{
+	struct nvkm_gsp *gsp = client->gsp;
+
+	nvkm_gsp_rm_free(&client->object);
+
+	mutex_lock(&gsp->client_id.mutex);
+	idr_remove(&gsp->client_id.idr, client->object.handle & 0xffff);
+	mutex_unlock(&gsp->client_id.mutex);
+
+	client->gsp = NULL;
+}
+
+static int
+r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
+{
+	NV0000_ALLOC_PARAMETERS *args;
+	int ret;
+
+	mutex_lock(&gsp->client_id.mutex);
+	ret = idr_alloc(&gsp->client_id.idr, client, 0, 0xffff + 1, GFP_KERNEL);
+	mutex_unlock(&gsp->client_id.mutex);
+	if (ret < 0)
+		return ret;
+
+	client->gsp = gsp;
+	client->object.client = client;
+	INIT_LIST_HEAD(&client->events);
+
+	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
+				     &client->object);
+	if (IS_ERR(args)) {
+		r535_gsp_client_dtor(client);
+		return ret;
+	}
+
+	args->hClient = client->object.handle;
+	args->processID = ~0;
+
+	ret = nvkm_gsp_rm_alloc_wr(&client->object, args);
+	if (ret) {
+		r535_gsp_client_dtor(client);
+		return ret;
+	}
+
+	return 0;
+}
+
+const struct nvkm_rm_api_client
+r535_client = {
+	.ctor = r535_gsp_client_ctor,
+	.dtor = r535_gsp_client_dtor,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index f6fcd89ec502..dba1d2058b37 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -9,4 +9,5 @@ r535_rm = {
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
+	.client = &r535_client,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 6d0eb8e202ca..c3341631fbd5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -27,10 +27,16 @@ struct nvkm_rm_api {
 
 		int (*free)(struct nvkm_gsp_object *);
 	} *alloc;
+
+	const struct nvkm_rm_api_client {
+		int (*ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
+		void (*dtor)(struct nvkm_gsp_client *);
+	} *client;
 };
 
 extern const struct nvkm_rm_api r535_rm;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
+extern const struct nvkm_rm_api_client r535_client;
 #endif
-- 
2.49.0

