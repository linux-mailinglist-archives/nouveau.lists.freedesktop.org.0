Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F4AA3C70
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407810E530;
	Tue, 29 Apr 2025 23:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lLqqp2SO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE2D10E530
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9yQaKXpCag8DrWZg3T41gZNUqTB2HuKu0gMbHaokvyU6XqphwBIIEVlxhq8C76bZgcIqcnhmp4309WjfSnSasdHsygFgrhipNwoHdQw6XWCRd1zFHfU2C49YhT1DnOLpkNVhZT1m8LSHPmnll3V9a64dzci7ATzA9ahDpv6w4zc74LgCPK8XPO640YbduCqM1hKUDRAyI6qz+Fdr0BvnSzh+n1zYUKq/7k2gX3tVTLJI/uJw36LtYVaLjWBjCH9s8A7RhENHIRKuNPTOrFvMTV1xu3V3Aq7HNCEMd3+VI1Fsj5mraPzAfsOXJcmPhwEVLacI1medtE7ddZDuc+mCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFX02TPdlErfF2kb3fE+hhzrt1imXHm07EUtVCFafBE=;
 b=dtw7I4U3hVqsAKgiPqD8UQbkBKAv8hajpqKyQCQYU7XzDKtuiTet829si+7IjU5GJPw64LrYmSTRjekQXo4IjAuEgCVbUKVBgnY5nB+st9NLx1+xuZDgiM6MS3KtxtgvW80f1s3hzx8i5czDnq/nwlZxE7W7RPOrDRFrCs18kf6sCkyw22N/lvUJ0BgIU0nuf0y//poUsK7hcWGWaLVn+PuyT0QaVqnw/5w6Am76xVXVjtOi51nxv/2i5iNBOQlHn4X6p8Y5B1qRUG+a1an6dqR4CDXOcVfIog4Ftjv+FFiI6+oasJmEfB4VQoB/h+9bW98qkn543nAJWXG55SajoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFX02TPdlErfF2kb3fE+hhzrt1imXHm07EUtVCFafBE=;
 b=lLqqp2SOVzHdBG1oOKhTWEp4eyhNv7MsbDarU39qDYQ0zNbZqlnqVNAJWN+GJ+nDyS593QjEzFv/4gKoQ7WWRE2HCc2MRDW99NDwBF7zkNu6SPkAoylhFvP+wj7EQTwB9nCfw9DI3mox9FkiT3FVJq0pBHoA14tQl7C9hEUOr5irSiyuJauafqZFG0l1VIjfZkuxQBbRoz83XuHlAk4ST5/5rJVLtNSyw6C07cLnpluQzfCXnV9nrijJXmgWEQv8VLLnuO3h0nEZmy6Ju2F9qL2WwaQxLBRMtPf/DoKnles1fFkUHq5/8gjzg9PUWv5pn5HwgZF1gTfKs5bmi5zW9g==
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:02 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::47) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:49 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 08/60] drm/nouveau/gsp: split client handling out on its own
Date: Wed, 30 Apr 2025 09:38:36 +1000
Message-ID: <20250429233929.24363-9-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 14374136-f0c9-4f87-0b7b-08dd87772942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Xwz8tCOFaml5jIW+V4Dw2VCyrth57pI4t9l0hfhvPD6CgdZpy9HU7F7Iuq1?=
 =?us-ascii?Q?xRKEUIk6w8vfwpDUvykv9WLismSlZHM6liCxe6iQRdSUH5W91V1fzVFrff0x?=
 =?us-ascii?Q?+oGKG6lBNA1vYNftEkvThkobG5rbV+cGM/Bg3EtIfzaT33Sv9IXz0pTm0HSP?=
 =?us-ascii?Q?/b+iS4kAiyL6voqEH4JDWB09YTDtBN1uk7bE9yvgJ844luicKE6dAmzPqeZf?=
 =?us-ascii?Q?V8ojtIuQxaIW9tf5iypc5OPYa9XorzT2Gvur/c3Ak0ID9JfmrQhkqC6aA/G0?=
 =?us-ascii?Q?jTwIaVqAWr42+5e5XbuEOdM8z+tugXjKaFepWpFqIE2D7vz10/AKabp6sMov?=
 =?us-ascii?Q?WHs0UOdwmb+N2mTKpE6vy/C+BDPIWztTypJizoOb39S508ombBrrYd8A8CWU?=
 =?us-ascii?Q?lPZ7DzHjsiMhEGZ8gjBxVFBRbRSHAwGUyU7gdXcTAklYKh5Op/Mxsfe8G3EF?=
 =?us-ascii?Q?JVSzI2b9P1WhNw/E2l5IT7oKdpw8JzAUrsYvre15zHz7cNbmLvb0HmJ8R6xk?=
 =?us-ascii?Q?TgTWDzrnqH3aXKXG9Z+cE/9rPn/RSdKtxAKXHJ/sX9Rz4CYbj28tbTGjY2ao?=
 =?us-ascii?Q?oNfNRgDPLIdvzAtJ/PkFb2P1+R33WEAklrahgblF9q8B0S64Ch4ugz9DxfZE?=
 =?us-ascii?Q?zHMhSyimQBpM1op3kDGV5qdpHgN/qwqvDPYdRV0KtZOUERqI7fgfeh5R1FfL?=
 =?us-ascii?Q?0M63I0ZtR5FfU63nmyUqSAAQHx63bEoB8t57MdZD6BCUpUzJUTS4a97+hB3W?=
 =?us-ascii?Q?TtFpUpsiE5PYteihUZkVDN7+LIsf1+6H/jF3qZvW8FMSp+D/+12J/fCf8u3i?=
 =?us-ascii?Q?a9kthB6ylTFC0VU/BA2LeptuZgxRFN+NzxV6WuEVpVt3rWby1LAp0UwiBNXV?=
 =?us-ascii?Q?rmNyCcBtu/hMbKL0rJc01/eNlk5yT7sthkCKlZO5G7oPxoZPyOfzZ/kjGiXf?=
 =?us-ascii?Q?QtJlANvBQqURuFn3/rj5JwEdvJGt/HwPmYRZFFtW6EahN21YjwArc5HdlNh9?=
 =?us-ascii?Q?Pdx9OGZ3sAn2FxW6wrM2td0RkjcO4wXrLIErg+WQ+4ZVyD7fomYhUY3bbABy?=
 =?us-ascii?Q?XMrNAarKAxU0lTFXbHUmu3VC/b1uRdqFyhYpIk9C9Y16znELqadePiid+u2U?=
 =?us-ascii?Q?jRf2SotqGqJoG9vPakKJypBJ2BURFG7tqu7aLEY6cG8tRmGkeVq49HOu5kym?=
 =?us-ascii?Q?IyRWP64qsxXDbsrFrzYcrVIXK8fbHIvhaut/P2/Cv5R0hpwfq2SyC54rLl/m?=
 =?us-ascii?Q?9vYNF0rjQH4Ngs307qhCZ74GIfAoVjUyyEixo+muwBxtWz/+z6mBv4pNkLdS?=
 =?us-ascii?Q?3ASGEewQJb4HEKX1X0J+vcVjpbd+6iLmLBO/8Pac6hG/484CSYfUmYMsQv6u?=
 =?us-ascii?Q?KBxVS0Hedyqr4mMTJhOkvpfYzn63oFDN3HMNSqoBTkOfUr1t0nLQ/TLS6H4E?=
 =?us-ascii?Q?zXe2Osmyhxmu0gbPPvDm+Esq8ojDMEt5oRGx13gR18CaGIOoC8SvUaQG7+hU?=
 =?us-ascii?Q?QdSFsRKIRxAXzDfngzJeuw3+YyJD1yTTnZOk?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:01.8862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14374136-f0c9-4f87-0b7b-08dd87772942
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
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
index dfe2abc6b3a0..59ebde1f23c3 100644
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
 
@@ -422,14 +419,14 @@ nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
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
index c8694c10cd32..6ab86f96408f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -26,4 +26,5 @@ r535_rm = {
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

