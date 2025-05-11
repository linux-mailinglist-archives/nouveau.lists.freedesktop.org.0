Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8DCAB2B4C
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5A10E0A8;
	Sun, 11 May 2025 21:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kOoBig/8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699DE10E098
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiifYnFB8L9VK0CB61z5EmAdo6wrd6lLAFRmbAKbkr9JjQ165QI96UJwINJWHIFQzAMPlkHwEHAP2ol3swELSPL6XVrofbuPboJ6Altxsf+UeP8A2LbEjP+IEHefqKT+8FqjrjpKyCA+GCKu2MNc5LYxtWS7cLa4UwQsVFWOPEAPPoEXzjjo9yVj8Vz/taqONrhaPq+WTCSjAXbcUqwCy6lMRJSieYcpwKVofOLbgrY7h7feIWI9H90+XPILFM8UktHsQz70XMIc26XGDQALxrzgb51XD3YDMzzHMa5joGOnJjoQZx0P53FyIoCZ1RR7iu8SH5Cbtk5Gw8G6GbXYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baUQ4sRpkHnZ88MAUxlnU6V44elgSPw8VoUxtvcFUvA=;
 b=r9t2AurlSSCldhsmHCyfueurU8sfYsW+sRQznYJtJBaxDMeV7FHkmqu8pVDkiFsHeVFKI+QWUyl18kpBFso8Pna6azAgvcAhu8rNUMLYWZ9RUo9V3anJTdGaefLbIxtmmxOcNaRdFri9UanbBFNNa/Z47ZdEwQioIyscYHxzGivdeDIfIi9JV5qW0xnU30PSrDJks7/R0wICcMZ6S6f6eGJFEQOZQNzK5t2kvChBF08L7i84Hp6QhO+ZK45lcCewVKv4Sx7jLsqVQZ4ZEJjxWdMPQ92oWgk78K7BRpUFo/jHZtWYV3jL0RlcPjVgbVnzUa3SQACuj8okASc8XEaMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baUQ4sRpkHnZ88MAUxlnU6V44elgSPw8VoUxtvcFUvA=;
 b=kOoBig/8Wlf0IK5yNvavKnbNWKf14PL6vebwluHquYfKkqQBYHm1LUj7mF7d5vAl4T1rkLDAW1SIX8B7S7x+CAtttT1bcJlw/v6wpW+lntGEgbMMTsDQV2ykb//YEhlwbzdcyl6OhBCzOvqYAh9HX8s1Fja/DYRDedGqzuaV6pQfgHj7T8rzTx5MZFZbYYvzJR/sQZJi9JTXOfVvvICmBPm9hT6YJisDGk9rjJ4gWQRWIpw0I3sXcBF1/JuUjDR1AVFIHOKtHjClfl8NMfhpjcS3vZJSQ2aid5Z0jXRorOUOh+9rjRRkrhyOFUQkvAsiYKtTv/eJ22fwlm9mLrzwiA==
Received: from DS0PR17CA0018.namprd17.prod.outlook.com (2603:10b6:8:191::18)
 by DS0PR12MB8477.namprd12.prod.outlook.com (2603:10b6:8:15b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:20 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::a1) by DS0PR17CA0018.outlook.office365.com
 (2603:10b6:8:191::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:14 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 08/62] drm/nouveau/gsp: split client handling out on its own
Date: Mon, 12 May 2025 07:06:28 +1000
Message-ID: <20250511210722.80350-9-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DS0PR12MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4d2a5e-f07f-4c07-05da-08dd90cff590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jciKk6ple6EvxrWmsGQj4giQl6FpwIRLj5OQ7wadwIaggx+1YtZXJEQg+LeQ?=
 =?us-ascii?Q?ar9jJt02bmG+GZR16xzni60PAbPOpFB52tQpVEwmHtqInfDh3TbpVgvphMoJ?=
 =?us-ascii?Q?kjQtpN/lFxuVHpfNM0F8RVm14CiQ6G63wj8LWZn+oDOVETzGMo9oDin56BhC?=
 =?us-ascii?Q?ypFDL/GD4Kw4aLYd3kKsrsVYP5tVv9TcAbMeWSgO80umKpb9XNEtV2fJgDr9?=
 =?us-ascii?Q?KFpEdJYqvbbMQZZUYBSe4ZqMmicX71rzOgbik2prLuncVDIT0I5lVnoPO3Vx?=
 =?us-ascii?Q?Jazkce8RzArWqvysXIW+sJJwmvSuDazYS1vC2O6YGC8gBEjak132I4kOziRN?=
 =?us-ascii?Q?xc4Cx5/cH6hmRtuQ3pBrQdCTMbJ6EKKQdzdsOlboztlFuwMbvK/IeTXB5wkE?=
 =?us-ascii?Q?tebydboY0Qa3nrSEF72ADQA61cFNhBWbemkglpO/UsPDiI1A66k3opaf/nGL?=
 =?us-ascii?Q?UdyGRznfS+/oZIOkH4+o4aWePHrf6zEMZoAPrBxgsfJcnBdSgt064K6nfR99?=
 =?us-ascii?Q?KEiuRZXRW/dagPUM1vqWRne9zsJMHiMUZWhG7Do8LPdFHgAAfwPbCgjOzSVF?=
 =?us-ascii?Q?AN2xUDwyFBYqH53JG5OqoJg3ZdJ12+lgZMJrukGkMg5NBRY3LLMsu02Z2Ra8?=
 =?us-ascii?Q?oAHRgC5offp81mPQajL6xoLdpewlbpZIZ8Kzf7Maqgx1OIZ95klobmKItU/t?=
 =?us-ascii?Q?b1DpfgP3Q5jHV1AD5/LC+z0YbesykXiyhOEZcOtpRRc3/f7cjJXPckQvnAi+?=
 =?us-ascii?Q?BDEz5nrCgmUFcw97uCfiApRkOgtb3Gb4lC9xop8Ark3tm0C1PZsCLjYYQoGG?=
 =?us-ascii?Q?HDUTicdVRVyrXdyCG1eB5d02Z0xej0AjZkLcSE5RixBjtHx92CZbVDzNrViY?=
 =?us-ascii?Q?OQ2D+Gcx46/1dyf0eoJo0mEW39e6UnUcnZIRKzP/aA5xTf+NH6rs41fqx/JJ?=
 =?us-ascii?Q?FT0pdrZ18OBamsU3c3ohgpHGRojbxW8mkFKZ9+0Mwu4lnkAABDYhxsUt7/Z3?=
 =?us-ascii?Q?PBv1mZXQ1Xl8hpDk1WrcDsa/+7qr7CqqJEePf+V9sQvGgGCXZ699EjFUHzLq?=
 =?us-ascii?Q?/9X8txBRvg8IkHfYmtmrGeEmXg5Zwch42VHKLel2/IhpaWSwaoLRTNoxDF67?=
 =?us-ascii?Q?IjSaTVzLt4C7pBohNerOiMmIIAJC1T9WLzALP4irI+Dhuh6uVivAax5QqmYn?=
 =?us-ascii?Q?kABfvzZRYKRr6U454Ga2hxJekdBzhyI5DlDzAk89hBylBEeNp7MulqzGPpgK?=
 =?us-ascii?Q?sA0/ZJ/y0kSA1kZZbrTYBvY60FH5S1SHavb/ncC1/cHq4IrAMOXCwzXyeqAV?=
 =?us-ascii?Q?bK3icNKV/WdaegdqkJ3GHsduWcKmqKgblz1k81e16Atl7+KUjpfWWW4z1T7G?=
 =?us-ascii?Q?iA7Dd45wIfMu/yPhNchWCqCYac0tK5iqaP7YkAm89sVfWPkUhD3egt/Wfd2Q?=
 =?us-ascii?Q?cTZdiqk1zj3NKejvovKOh2CMICximVldELENIMz7Pc1A8Z8d/DYBPociHxHw?=
 =?us-ascii?Q?abaeaxxpQ8oEBus3ROyY8TZWK0eVMAAzMVz1?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:20.7559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4d2a5e-f07f-4c07-05da-08dd90cff590
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8477
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
index 407777d67431..e78b7d041eac 100644
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

