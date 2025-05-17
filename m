Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6DBABA727
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4B710EBDC;
	Sat, 17 May 2025 00:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ad8XlfOU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043D110EBD7
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s496oNPA4tE4Zw88h3cjyMHe2L7wGXZik8swUS7BzUjuwLThzlXjoil8y7zSCz6wvLFS4Q5yG1tZFv5Pn3GI6HMFUtOWPcTypfuSU902UrUWOO5BrNF2yA2CM5uHULk71W4PA2uJPmMNJin98ruLGR+TBYxFTFhkuDFlqvr/d0Y8+brR+SzJoTgY2/Umieh8CGc685dI0l6YXkUQOc9zaulpvEzToFKavTdopWWowTfY/dSRutYw2tcanf5PiH66Ch5lQ2V+mTuPlEmhppBsbpjvVkph7n4OKqm8xfdyWjAkl9nNUp3Fcp+GJUY72MRYP8O/bQAPjzjVkdc4Q8CfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW8El9wiyP+QzGYMi6198e6LGn9+1dZ58zJgkWYMITw=;
 b=dygwpj4r4E40/v/F65Qbw4LMqkA6X5dGmP7FnO4w+ZoLHoNyg3JgFbVJzDdcY01EA93xTcEAkKucUdOZSdQdwBNfyHXUo4f/Id43unGpZVlCJKkdXPqetDesqtKtTrLq2sst0ampPGwBTseuf6nbHXo4KL/FMZdDlA/fuXtQ1DLxi0by7QyPUn9P9g1bUzS6V5LR2a+UhvTa1QyVddoefCy65ueBkAChnHw5t6dCBhlS4LtGvThFanHodOo/rBylZXrEHkkRr8PMALtJP0JJRNO5hQhDjyp5K7AbfLadSevddLRBZNhq27xGWIi8aEKWID4LSLyMiJMaoDF/IWjySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW8El9wiyP+QzGYMi6198e6LGn9+1dZ58zJgkWYMITw=;
 b=ad8XlfOUeVfYBKcAxQbqjk+Oe+QUDAqETmKZ6I4C8s59Z35XQjkMUs/Pc+UJ7Jche6iKUtHWGqrfTuwM22ORjSmJ2hiFPea6VjmBxdKTbTbZzChvqwdWySdeSv/iVd8btZbA8mjtR/lMA23AiEGW0FPTSbOffXqAh2jMb/SiRXEV0vwBJvUBXan1EJHH7W2e7hJDpVASVwHvJK21pF6O7c80XEqWRZIURZ7v0LnsEwHmfWN4PqikpO21z3GMg0oGv1DyGZ7V9atW5Z6uFD0xWu5IUnX/TbCO8OXn45JDsTPJl5rpYZuTI58ivh+IGXugP38gyot5gmF4cu+Vfovn4g==
Received: from CH0PR03CA0380.namprd03.prod.outlook.com (2603:10b6:610:119::8)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:11:27 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::f4) by CH0PR03CA0380.outlook.office365.com
 (2603:10b6:610:119::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:11:26 +0000
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
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:12 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 44/62] drm/nouveau/gsp: add common client alloc code
Date: Sat, 17 May 2025 10:09:36 +1000
Message-ID: <20250517000954.35691-45-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6c619a-9593-4d3e-84e1-08dd94d75dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ntQ2D8SzVsle0D3wD0NMEkdj+HCNu7CTA2sew8Wp7EXWqZIF3suKAKppSIbM?=
 =?us-ascii?Q?OtEjMezytxS19hoD3utHLW+UivP7zJQZLt5h9/03sAPig1/heBOX9/ohvzec?=
 =?us-ascii?Q?KEZngetaDCrH275EvLWQYsGiegOMAXvbPdJI3GUM7k4OkHvkFwtCDK+placm?=
 =?us-ascii?Q?8OHSXgiBcTqN/IuqIFamJeu6/PYb8K7zqDqW0kF8NPIaOTUHyzpoc9PeiXBH?=
 =?us-ascii?Q?DjeIKRrm5QKbGvFI6aBq6Z4wr0HjtM+xt4najALfpf9iiUKxrU4LdMkd6/Jx?=
 =?us-ascii?Q?e3AfofGAiCgUyiHQx5VpT8DB6ynM9OK36ytNi1m8f580GBnTbOMZnLMSZ9KJ?=
 =?us-ascii?Q?TB8Lc4qv5bRlJx7Fpe/W9VEnLfNHHnR6PkyFaa9k6JetGmNKRXVM0iTqugJf?=
 =?us-ascii?Q?/gUTTlMSBaGlJpslrjaex1LGAY7cJbHCtisRgnxXl0lYE1V/Gj7arwO2+E3O?=
 =?us-ascii?Q?b0oCb++JcT1DLrX8F9QDUOXjT69wopx2Yax1SwGrMRH1IxnywamKqt4x0ezj?=
 =?us-ascii?Q?KQT+QyTI1TQB5V2dck+qX53TYKWzTgHohgz7ATMOqcI3XbvO795HgNELAt/p?=
 =?us-ascii?Q?ZXj1BGnDOe3yX+K+HECvZqMZWJNnnQLXr0aB70tS36cxX71mLo/E08xcbkgG?=
 =?us-ascii?Q?mbkoRN8eDmzSZqMsZpuPucZSGzvd96x1sF91MQff73iLldxZyEUfJ4QvGfyG?=
 =?us-ascii?Q?EbFh3LCn4W6KmzphFispITcGROTx2eQEP/IIEwSDgFmNAYfZpLot7NLC0FWj?=
 =?us-ascii?Q?6JsAU+P5hFdav8YWZPBQ7KCR3xybA98dSjovOx1xK6caNOw+sVUtUqoDQXqM?=
 =?us-ascii?Q?r57RQgsnz1eGsWS9PzASHLbsRlsTS3PIEkENoy66NirKl0gpOz7V6bd88UUF?=
 =?us-ascii?Q?c1w8fcFU1hQm/J7dc9x/uc6tgLKIIIS2bm7zMyMrf9KqQ29oSCcCTefTlEEO?=
 =?us-ascii?Q?UR/ZrZrPedDST8WhLsa9bdj7IWvIQHD9bmTPmoSrhSQ44vVJiWbxE02as+t2?=
 =?us-ascii?Q?yXwYvalQ2FZFdrYfq80Q0VNDh8zqKgSZiDtftxWz6fmFVmDSOg37SVFQ8CfF?=
 =?us-ascii?Q?hf106IqVmIxx7hNrVf7IqIwvdXctX+Ydamv2QcPBM3Q3MjKEE0wVMQEbjFQk?=
 =?us-ascii?Q?Rh3Na9RJ5OBEhFfjnapdRpahR7aZTxA5bAMWcAHPkl66COl8jhLYHt1he/cn?=
 =?us-ascii?Q?TPMiJWzClL/rBQGvr27Q/tHA5DFYpi9xzX4K5X3v058Z/4EUIQBZZeWC39sZ?=
 =?us-ascii?Q?Vg3uD+swj8QhqiEnxoDY7DnSLhlv+A8svxW4IVHwxmHSexRXT4O3W+gpIxvj?=
 =?us-ascii?Q?4qdu5fsBTk3ruETpeCF/rPs9MkSrDDDgr6cVVXb1Lz5b7wCKEgE3fQR0eXHo?=
 =?us-ascii?Q?vDi84hmQl/UOv7Qop9gxz2A5CHeKI1fClcNQgnKKrm9g/HT/SPvqSonF97vz?=
 =?us-ascii?Q?h8Z4kit3q8d5GM1L3bNZaWUMs1O5aE/oCA+ySzj+lWxyuUonZIlmBAa8YABh?=
 =?us-ascii?Q?wMrLecJ7DSL5zGNrPYX+1D6MSp5A5ZN9mCb9?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:26.6636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6c619a-9593-4d3e-84e1-08dd94d75dbd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425
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

570.144 has incompatible changes to NV0000_ALLOC_PARAMETERS.

Factor out the common code so it can be shared.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 17 +------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/client.c   | 49 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h  |  1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c  | 44 ++---------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +-
 6 files changed, 59 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 40e1b5300dff..4ad07f3ced69 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -411,21 +411,8 @@ nvkm_gsp_rm_free(struct nvkm_gsp_object *object)
 	return 0;
 }
 
-static inline int
-nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
-{
-	if (WARN_ON(!gsp->rm))
-		return -ENOSYS;
-
-	return gsp->rm->api->client->ctor(gsp, client);
-}
-
-static inline void
-nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
-{
-	if (client->gsp)
-		client->gsp->rm->api->client->dtor(client);
-}
+int nvkm_gsp_client_ctor(struct nvkm_gsp *, struct nvkm_gsp_client *);
+void nvkm_gsp_client_dtor(struct nvkm_gsp_client *);
 
 static inline int
 nvkm_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index e5d5f8880d31..0eac850d1f33 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: MIT
 #
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+nvkm-y += nvkm/subdev/gsp/rm/client.o
 nvkm-y += nvkm/subdev/gsp/rm/engine.o
 nvkm-y += nvkm/subdev/gsp/rm/gr.o
 nvkm-y += nvkm/subdev/gsp/rm/nvdec.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c
new file mode 100644
index 000000000000..72d3e3ca84c2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "rm.h"
+
+void
+nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
+{
+	const unsigned int id = client->object.handle - NVKM_RM_CLIENT(0);
+	struct nvkm_gsp *gsp = client->gsp;
+
+	if (!gsp)
+		return;
+
+	if (client->object.client)
+		nvkm_gsp_rm_free(&client->object);
+
+	mutex_lock(&gsp->client_id.mutex);
+	idr_remove(&gsp->client_id.idr, id);
+	mutex_unlock(&gsp->client_id.mutex);
+
+	client->gsp = NULL;
+}
+
+int
+nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
+{
+	int id, ret;
+
+	if (WARN_ON(!gsp->rm))
+		return -ENOSYS;
+
+	mutex_lock(&gsp->client_id.mutex);
+	id = idr_alloc(&gsp->client_id.idr, client, 0, NVKM_RM_CLIENT_MASK + 1, GFP_KERNEL);
+	mutex_unlock(&gsp->client_id.mutex);
+	if (id < 0)
+		return id;
+
+	client->gsp = gsp;
+	client->object.client = client;
+	INIT_LIST_HEAD(&client->events);
+
+	ret = gsp->rm->api->client->ctor(client, NVKM_RM_CLIENT(id));
+	if (ret)
+		nvkm_gsp_client_dtor(client);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
index 50f2f2a86b5a..3bdb5ad320d7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -8,6 +8,7 @@
 /* RMAPI handles for various objects allocated from GSP-RM with RM_ALLOC. */
 
 #define NVKM_RM_CLIENT(id)         (0xc1d00000 | (id))
+#define NVKM_RM_CLIENT_MASK         0x0000ffff
 #define NVKM_RM_DEVICE              0xde1d0000
 #define NVKM_RM_SUBDEVICE           0x5d1d0000
 #define NVKM_RM_DISP                0x00730000
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
index 449338da1795..ec71f683e609 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -23,57 +23,23 @@
 
 #include "nvrm/client.h"
 
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
 static int
-r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
+r535_gsp_client_ctor(struct nvkm_gsp_client *client, u32 handle)
 {
 	NV0000_ALLOC_PARAMETERS *args;
-	int ret;
-
-	mutex_lock(&gsp->client_id.mutex);
-	ret = idr_alloc(&gsp->client_id.idr, client, 0, 0xffff + 1, GFP_KERNEL);
-	mutex_unlock(&gsp->client_id.mutex);
-	if (ret < 0)
-		return ret;
 
-	client->gsp = gsp;
-	client->object.client = client;
-	INIT_LIST_HEAD(&client->events);
-
-	args = nvkm_gsp_rm_alloc_get(&client->object, NVKM_RM_CLIENT(ret), NV01_ROOT, sizeof(*args),
+	args = nvkm_gsp_rm_alloc_get(&client->object, handle, NV01_ROOT, sizeof(*args),
 				     &client->object);
-	if (IS_ERR(args)) {
-		r535_gsp_client_dtor(client);
-		return ret;
-	}
+	if (IS_ERR(args))
+		return PTR_ERR(args);
 
 	args->hClient = client->object.handle;
 	args->processID = ~0;
 
-	ret = nvkm_gsp_rm_alloc_wr(&client->object, args);
-	if (ret) {
-		r535_gsp_client_dtor(client);
-		return ret;
-	}
-
-	return 0;
+	return nvkm_gsp_rm_alloc_wr(&client->object, args);
 }
 
 const struct nvkm_rm_api_client
 r535_client = {
 	.ctor = r535_gsp_client_ctor,
-	.dtor = r535_gsp_client_dtor,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index eb018b73d26f..5e9d7351ecc4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -59,8 +59,7 @@ struct nvkm_rm_api {
 	} *alloc;
 
 	const struct nvkm_rm_api_client {
-		int (*ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
-		void (*dtor)(struct nvkm_gsp_client *);
+		int (*ctor)(struct nvkm_gsp_client *, u32 handle);
 	} *client;
 
 	const struct nvkm_rm_api_device {
-- 
2.49.0

