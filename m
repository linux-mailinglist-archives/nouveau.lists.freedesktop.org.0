Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC58A78D6
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E37112F20;
	Tue, 16 Apr 2024 23:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cT8EpqQU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28753112F1F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2kqqOgvtde56HgGzGpgqvlYwGzprc9/Z64yrHDbxcRUAvsaPfdtp6K4mh3yMSv+AOH79I1kn6wQHk2ui9SPoED6kDaoMbRgxJckEsIHWv6iODbSza755H/VXH4bHDlSxOLASKRxBZsiVr90I+cubG7UtGMQxyK0xIqfZzIOq9ntOdyC04Oi8Z+V/lWjgYASdpGmxPRYjIjlxKJ31+74BRjPSmAGNMgit4jbe/TTglzPjmEKyYGdfQ9re8ymYrGOOHtIPCP2LlpRzDTsOgAg+yy0mFNAhTnuZbixWX/+z/RwI/gH6XLdxE154TxKdTY+1nx+swByo27wHx36uSXvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W6QFYEdcNSneSkvRs33ingzq/I1rSpYDUCyb1qh9co=;
 b=dhCa4Q7QQWauOEYZ7/RtFouKu6zi5ugtSDyBUa+Efc0ywBZh1YQV7i+hjUkJv6hMV/D/h67Ral8Td2OMXS4s3dh8Z1GuQfBgt68YFC8Y3ujqcRFm/hzfYE788PeOsjPGTyJ429nvWPdalDWNdaGUa32wRPvJJUntb0UYFYB46O/rk2jSyJITLuT+Z9BJB/R2RpvG2uvyTUI0gFF6LrjKqOqjEiGCBn8HCRjhKQaYZEuRNsRfS7zZ0IJzQZdH7y+7MahQqMP43NcpZDmvn/gE1lA9H/vREdvw5jM90TfA+6ZD0LuNncgjtohjE0p+rh+6AQcaZ14nOxOCY4jPP94xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W6QFYEdcNSneSkvRs33ingzq/I1rSpYDUCyb1qh9co=;
 b=cT8EpqQUYEhSXuKU3otMQcvAI3tTJaMG6CCZlvaIyBJprnqxxK0KarKdhyq/t+PzxrF5kjUF9eyxB5+ZiYOVGYiDVr2osrtoKfqRu5U5ReO4MXLUd1V96fi8CRSyhHv631j8RnXPg0p2BjPxcW1/gZ59iFX37WJ0aScZnLAYJVmHwtwsgAtI4hT74B+0K10i5CkieEgL4dSoZn53SBx1ed5FInoDdWZXDD/rSSArYKefLIwO/ZAxRC42GMn//pmJUSXX5IfCQvb6dWmKc0/IprWMszZFUm51RggK8hC+FBqy0S9sl250fUJ78IFwmmYGpsGGrC1EgfTJ+kBmZm3RLA==
Received: from CH2PR17CA0029.namprd17.prod.outlook.com (2603:10b6:610:53::39)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:38 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::7e) by CH2PR17CA0029.outlook.office365.com
 (2603:10b6:610:53::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:21 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 044/156] drm/nouveau/nvkm: rename struct nvkm_umem
Date: Wed, 17 Apr 2024 09:38:10 +1000
Message-ID: <20240416234002.19509-45-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: c536d4ac-698d-43d3-d5a9-08dc5e6ec291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2gZG8TqfJs5Gr8Ec2UJNAzg/9V8BEeNaTCi2WYqhWQ1O0rgS3YG74U9DZ8lXCEZM0442L5BbBzlSJB4dMDo/e0Z06R4Ht+okr5WClxa5rCdA5B94Sf9lOLDJMW88zX5gve3imrHAUzNHM+go4nARV595C1IzG2kPF4+vXx5FDk3ZGWDEE1r61C5n5TCCCcwmEf7O276/7SBzOGUkDW4io8xX6AcbeexAjKyeIXOmWJsTN6Ad8PIuG571Om/OtouuUyqfpEnbzNUj2/AOjGRga9oI9K0ICxh2Se6ctFyj2RfOFFU2GP9jTowODnfe+R99kp+yILcQpXtt5NfDJ5Scuri5PfWbvPnH2RLfPn4XTr5raAZu09xYTnLoyd78RzYf9TPcjdX8FsH5sP5bP6PPv1JNQtKenWE18PZ885T5ibvbiBLCFKN/zc03n1rn9ZOnYqV1Y8Ocvxi9J/3W0cz9OIpdCVftZ6VG5S6LMfasdCCK8xnYDJOVt/HnAh9JHDMpoGhR6gydAF9bMytxHv+6f8XO2GXtIY7KiWtxw2j/zoGAFTDAgGKDxpIlyslyhCZ6WUbJMSGP2sWTw5hdNpX2NOn+xEzYWcYK28SWkWNBjh5iskKTqHOhdQGu6Mvh9TbyIC9gCi8tG2Is3rPPy6sdnLZnG2dyZt+8W7cVkWFktdv49CfCBhKPFcq7gEoLIN7ZTzhnW1Hf2i2vAN6ICQHpYDt8x3rqci/ncNrlKekalrUhDyViRQv9dO949c3X06N
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:38.1956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c536d4ac-698d-43d3-d5a9-08dc5e6ec291
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

- preparation for upcoming patches
- open-code current nvkm_umem() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 29 +++++++++++++++----
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.h    | 18 ------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index 62d69bb7fe90..45ab7e445d58 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -30,6 +30,22 @@
 #include <nvif/if000a.h>
 #include <nvif/unpack.h>
 
+struct nvif_mem_priv {
+	struct nvkm_object object;
+	struct nvkm_mmu *mmu;
+	u8 type:8;
+	bool mappable:1;
+	bool io:1;
+
+	struct nvkm_memory *memory;
+	struct list_head head;
+
+	union {
+		struct nvkm_vma *bar;
+		void *map;
+	};
+};
+
 static const struct nvkm_object_func nvkm_umem;
 struct nvkm_memory *
 nvkm_umem_search(struct nvkm_client *client, u64 handle)
@@ -37,7 +53,7 @@ nvkm_umem_search(struct nvkm_client *client, u64 handle)
 	struct nvkm_client *master = client->object.client;
 	struct nvkm_memory *memory = NULL;
 	struct nvkm_object *object;
-	struct nvkm_umem *umem;
+	struct nvif_mem_priv *umem;
 
 	object = nvkm_object_search(client, handle, &nvkm_umem);
 	if (IS_ERR(object)) {
@@ -52,7 +68,7 @@ nvkm_umem_search(struct nvkm_client *client, u64 handle)
 			spin_unlock(&master->lock);
 		}
 	} else {
-		umem = nvkm_umem(object);
+		umem = container_of(object, typeof(*umem), object);
 		memory = nvkm_memory_ref(umem->memory);
 	}
 
@@ -62,7 +78,7 @@ nvkm_umem_search(struct nvkm_client *client, u64 handle)
 static int
 nvkm_umem_unmap(struct nvkm_object *object)
 {
-	struct nvkm_umem *umem = nvkm_umem(object);
+	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
 
 	if (!umem->map)
 		return -EEXIST;
@@ -86,7 +102,7 @@ static int
 nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 	      enum nvkm_object_map *type, u64 *handle, u64 *length)
 {
-	struct nvkm_umem *umem = nvkm_umem(object);
+	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
 	struct nvkm_mmu *mmu = umem->mmu;
 
 	if (!umem->mappable)
@@ -123,7 +139,8 @@ nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 static void *
 nvkm_umem_dtor(struct nvkm_object *object)
 {
-	struct nvkm_umem *umem = nvkm_umem(object);
+	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
+
 	spin_lock(&umem->object.client->lock);
 	list_del_init(&umem->head);
 	spin_unlock(&umem->object.client->lock);
@@ -146,7 +163,7 @@ nvkm_umem_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	union {
 		struct nvif_mem_v0 v0;
 	} *args = argv;
-	struct nvkm_umem *umem;
+	struct nvif_mem_priv *umem;
 	int type, ret = -ENOSYS;
 	u8  page;
 	u64 size;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
index d56a594016cc..d2012ab625d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
@@ -1,25 +1,7 @@
 #ifndef __NVKM_UMEM_H__
 #define __NVKM_UMEM_H__
-#define nvkm_umem(p) container_of((p), struct nvkm_umem, object)
-#include <core/object.h>
 #include "mem.h"
 
-struct nvkm_umem {
-	struct nvkm_object object;
-	struct nvkm_mmu *mmu;
-	u8 type:8;
-	bool mappable:1;
-	bool io:1;
-
-	struct nvkm_memory *memory;
-	struct list_head head;
-
-	union {
-		struct nvkm_vma *bar;
-		void *map;
-	};
-};
-
 int nvkm_umem_new(const struct nvkm_oclass *, void *argv, u32 argc,
 		  struct nvkm_object **);
 #endif
-- 
2.41.0

