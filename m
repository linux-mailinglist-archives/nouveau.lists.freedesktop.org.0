Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AD92AD58
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44E10E465;
	Tue,  9 Jul 2024 00:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q+N8WehK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D9D10E450
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lA6uRsjAAgeHS2UDK2MzuFTd1qCjJWGENjDxkqyQ0IqL4MO8HY0Ky+3XJlK8fGBcGzMflz4iNwpYfzGNOVg5jLczrqoz6qICLsn0xESaJNfqsa4hflYZaWAmKVYFkWcOCMbE6aJsOle6qxT36oZQSUj7LJB6wB6P+wRzi4TOh4lp4HeG1zAhGkQwVlO8dnGvvmFeh1f8022CRx7vhsPt+IH5E5hyKbQ4YJsCAKOKxWxRO7S4hbbKxER7BxdkWq4XLAPPC0XNkndaTSoh+SoZEhIExDB+x8TiR5WIN4JmZHVc/hO0p3+KbBtpnC/oXn7ndpGBqx54Ey0i9DG9egE0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBebqD3sBCG5UskDTOpUgDRlpHmFOemem4EkDKSdtBA=;
 b=lNR3LSMd9V6Dwa2W/TTSPFp7MZrJ1LJPr8xD33FJLgxZkWx4ojCHgdjI72i7VCP6wii83689kT0i8ohj0CF02dVVISnW5M0sKBLVryaLSTri+ipKYC30NtFgiqWfEfPJUfM6rL+m07pGLewNnwY1nnBWcm1IHkTUM5i84l17Q8LPyNKfJm7BHwXlbjsy4HpWA22ZpXM/bGmUWUvWljXMBD4ANqCW6DAjGYJtKUDK1lZGsfVD58cLdVHuybq8NZ5/s495fHKpbBGAaPBwkExL+DyflIMKa+L7eS8+8dV69Ltp4gfd05cjJDcjs4MhaTghaKzfKikU32HvXJ6wweYCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBebqD3sBCG5UskDTOpUgDRlpHmFOemem4EkDKSdtBA=;
 b=Q+N8WehKUz5peVGU+kgqW9KBzTJVZm+SrN/XvNWkqK+CtmC6NqaIUaan/SfN2nK+Yq74aYAR1Dj8qyvVJXZaGRZ649WApBqWFRP2l58sJ4iPP0eBpK3x/Eu4jXIwRynU+ui7147/1RpBsaJGjZzaBpOEud6JpI4J4a6ZCb1qYWz+OrAf8GCSBFELtWoF0kkVFtXvqYktf1RLMXOJA2f23m5JnN9TjgEMz+j46XAOE5B8VUYn0IjpQcieW9JibkqkL1jvHQAdiSVqUVxoMIkNsxL+9oLxOFzwjhBrGGVLmNytzO5rPe9PoiYozGHRQo9kBujLMOEKHTU2Nu8fcVFfww==
Received: from CH2PR10CA0002.namprd10.prod.outlook.com (2603:10b6:610:4c::12)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:21 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::2e) by CH2PR10CA0002.outlook.office365.com
 (2603:10b6:610:4c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:11 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 17/37] drm/nouveau/nvif: remove nvxx_client()
Date: Fri, 5 Jul 2024 04:37:01 +1000
Message-ID: <20240704183721.25778-18-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f83d723-3e4c-474b-b634-08dc9fb1cf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bvHDcwXt5VVTll2Cgm+Iuyj14o09OtjddvmGmYBUQ+BBimbPv+ahB6NQpR8/?=
 =?us-ascii?Q?Pq2rgA5hdPYUsu1bPTDvO2jFDAZkKFsmjt797DweJ/BRJFNxherib1X2G0ZZ?=
 =?us-ascii?Q?jzeqQEN3MNcM+y3lvgBX57IMwIJrNURgHhhWdLkU4cmEjykMTzvIuVu2JneF?=
 =?us-ascii?Q?gj/vtU1PZB3T6PXaYvF17Ngpeoas9iUbEN3v44yhenXtRk98zqaIcNmcn6Cw?=
 =?us-ascii?Q?N/lBauYG8VtZAOarQ3M4IbOIykGzr8wI8mI/t6vDxMJMBD3ye/UlhfIwoJsW?=
 =?us-ascii?Q?qK/McsOEFFfR3S0pOf8+eRs1meC+2kXaXI39ti1SSFiNMN6q/UjOnCHqBm/f?=
 =?us-ascii?Q?BrOVEDihCuPj6L35dmezKsui0pVf26noQUTMNKDoVSU8CM3ZBuOCnXDQhIe5?=
 =?us-ascii?Q?eQGGu8gcCHkmgTPKeWNXs8OfG/qdQvq7CxL/kEbsBPPu8F96REuaGCIT3fD9?=
 =?us-ascii?Q?2Td3caXyEVSLgBNsChltjq/HeQIxBUZZbDRn0yD2J6mGqVJdpuDvbv2zeyAq?=
 =?us-ascii?Q?aOJbK4d3en4H60yAEEi48PEg7Trxi+3gSwl/n97py9JnMp9akVvMY4Nj9tTW?=
 =?us-ascii?Q?O5RPN4yneOvAWnU4ei66gLpoH98S8YgQr2FV3ZfMInlf2vWBSgfoHMNENP1O?=
 =?us-ascii?Q?tDtz1xK9JmDoFka/ZtU9wkuUgEWjLZwhE/URHDJdT4cxpZrR65BJasX9UOP4?=
 =?us-ascii?Q?qYLOAiSFF5/5hPVCVcFztZ8/nHONDAkUFAF0/+wSqkjnOeliz4wKrQ05zvJV?=
 =?us-ascii?Q?tPjPdLFL3MW+lcqFCiLABGl2b7n+IxA9sWKZySWuncpufH+ywnA0LRzZwvnM?=
 =?us-ascii?Q?ZNoZHXsFolDc50Ytvk6G0dMgf7g6Lfdpeulp90z+LlK4axQL1khIj7GzvjuJ?=
 =?us-ascii?Q?lWUlcWxRkypCuL3JUSIHVPfPEwhqw/FI9w1JYLgwzsTjSd97o4dyLuiYa6FW?=
 =?us-ascii?Q?j4458y6buETiyllnpHgNT2r0ubQvYDMFUsSAlAVK+QH1eEAhEAvL64Eg4DFa?=
 =?us-ascii?Q?S7ydqO+LdXfcfqhbZuehdLNB7ZfUvwXul4WPLmFOAocGNVbGWR2qosQgJLNI?=
 =?us-ascii?Q?qAtx+GLE9LtSdZ4irH+oXeKt6ZbyqE3fBqfozJfWeVdZ5NM+n0wW64SwM0IL?=
 =?us-ascii?Q?h/DFgiQ4Exb401+Qc+FDqfTsXefU3cfVLEO+jgK/of4mUsFQAuLKy7x9j/UF?=
 =?us-ascii?Q?FCtzmVg/qg3JZwpncEZQB+aupkr+m21gSGAVTl3S+e4y8NMXx42GxjvXQzyb?=
 =?us-ascii?Q?3Vjyr1L1eDyXH7gVfl+5GZFkrH7GJ7C5t8gBTzyK1PGIToeZOCL4/zomyrrp?=
 =?us-ascii?Q?jBuoBkubgw33JswPVLIaes6sMNGNX2uaBqHIgR9ze3y7TbfUOUklwsgjZMVr?=
 =?us-ascii?Q?nXXoAD4SNEPg5LcFp7i9wyrmina6q8siQs6V2AQSnm6PQruhFvygLtSjGd6C?=
 =?us-ascii?Q?fyNbvGiKF7thJvtT2sKd/+e8qDOPOAxr?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:21.2767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f83d723-3e4c-474b-b634-08dc9fb1cf37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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

Make use of nouveau_cli.name instead of nvkm_client.name.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h | 5 -----
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 3 ---
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 2 +-
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 64b033222c56..5210007d7669 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -18,9 +18,4 @@ int  nvif_client_suspend(struct nvif_client *);
 int  nvif_client_resume(struct nvif_client *);
 
 /*XXX*/
-#include <core/client.h>
-#define nvxx_client(a) ({                                                      \
-	struct nvif_client *_client = (a);                                     \
-	(struct nvkm_client *)_client->object.priv;                            \
-})
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 66fca95c10c7..ce04c40e6f8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -78,7 +78,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 
 		if (ret) {
 			NV_PRINTK(err, cli, "failed to idle channel %d [%s]\n",
-				  chan->chid, nvxx_client(&cli->base)->name);
+				  chan->chid, cli->name);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 694df7c050ef..e0e1fcfcab1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -644,9 +644,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	if (ret)
 		goto fail_master;
 
-	nvxx_client(&drm->client.base)->debug =
-		nvkm_dbgopt(nouveau_debug, "DRM");
-
 	INIT_LIST_HEAD(&drm->clients);
 	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ba469767a20f..1450fb8c57c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -200,7 +200,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	else if (chan == chan->drm->channel)
 		strcpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, nvxx_client(&cli->base)->name);
+		strcpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.45.1

