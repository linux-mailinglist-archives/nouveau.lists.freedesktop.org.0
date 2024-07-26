Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F793CD43
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9E810E8E5;
	Fri, 26 Jul 2024 04:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNXLvMr6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D2410E2AB
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAlAtn3KiZqbvHHwWuUnhJLyiY1OC0tsGrWF6mBQYz4hLOtRbttdXR9DDjxY0hHh+XxcFrB4mFTYVtoU6kDDQWRjC/IlweK7kSDJMf1SGSu+iRhmNHQexUh70o4LuZCIamiLNzz/vKvTIY0qMYV7SFrDfMddRMXh6JLKFwRHEUvU/L7/wOlZfGulvPcJvU8voEc1QXa2qtY1iZYBHVj9BNwW2ILZtfBGrt7WXeblFxIj05Es1h4MynYoxFrd6fAT5abYG/jnkApQX3qL/1nR3RF4pOQezPaZANZDS7qB9D/E7tcxHXd/j4lABX8wNGoEaLnb7cJeV0hY+sk9vR3MSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EemyxgoJ+lG935uMT7QtJRCsZDy6EzVc526xixgZ6m4=;
 b=FYAA8k8igCTNc5X97OZ4bjXLp0RMO/4mpTkYQVKQnbWqgBBPii0pxhq0jSa749BYp4PXtyVUryy+dluV0HpH0zhjbZkju/TsGJ4EHkZFVOzCGWeia18xBxLi25zCTWCa3L6Dwj4wGqnYu2cusjz5MB4G+IyBLWQGNizOCoWlCgOGlI2rkVTfcIkQfbk+528x2wLZo9pC57AVorhOqHuDf3ih5sqIAGJEkw1TyOUAbOdc3PRUk5p1rol6mmGmdiVtn5AV6DogSmTZQo3Ls3y7bXEYCVlBQTxTqUHJY6rw4eUUeMdONoxKOSfjK08VRyOHKkxlJMcc9tbLnhCOQ3lxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EemyxgoJ+lG935uMT7QtJRCsZDy6EzVc526xixgZ6m4=;
 b=eNXLvMr6nqyCa8tF2WKnN55CN4CNAfM0Ib18EWyadCIUjkcCMpuqiaLEO4a2LtnhjEF5W0G/7cOvfDX21bjBzzRGvDb7f3A3femsspQ/e2cRFmHN1n0W86RlvfxYZpj3LtjiXm7xqluT0y9jCOU8sfj0MtGG6k5U1IF3FFdNzGLKicbU02Q+QFoeFiriDdwYocNioqDsmHHFYeRT1XGKn3oGaspUbfrrt60h99rGnncdjC9vvPX51kvV/5KHxJANVpgezWLkbpptfDJdh4+q0DlFXiRPcC/ACUdo/KfwP7KEUrRTjqlAQid6obCgmtssr9+VhQpgsoq4zyxvt56k8Q==
Received: from DM6PR08CA0055.namprd08.prod.outlook.com (2603:10b6:5:1e0::29)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 26 Jul
 2024 04:39:17 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::67) by DM6PR08CA0055.outlook.office365.com
 (2603:10b6:5:1e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:08 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 16/37] drm/nouveau/nvif: remove nvxx_object()
Date: Fri, 26 Jul 2024 14:38:07 +1000
Message-ID: <20240726043828.58966-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a4a213-bbd0-452a-eaee-08dcad2ce8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CLO5haA5XmRjjZhbkb6BbwQp8XLaGU15o/1M9P+sEIERKQz3Pzf203xYWgwu?=
 =?us-ascii?Q?LkikiW5U9m2yWNCGMRQrzm69ZufzXw3LfyS4czsqK2Tv+6ymMJPHJ8PykbZQ?=
 =?us-ascii?Q?iN5/Wxmgiac1f6aHL2ssJxPzU8L1+Gx5JCfnyPYo0dLt4SluEG3CtAIi/OaA?=
 =?us-ascii?Q?Ud0H6iiHy3nkxffNkOgc+XxbgD6RHl3aoiE+T4yuAerRCcd4kHzs9LtNuzfy?=
 =?us-ascii?Q?o4gAflVLf91agw0Pn4t2eAEPhzvnTxuNB9N6F3u4JusixrpzOhH2E21ELHk4?=
 =?us-ascii?Q?5KQVNQRwA0f1Ka2/BiawQaby9czf78E8U/QgLeYSgQJXbqawFN8smpj/X8wo?=
 =?us-ascii?Q?q4R6aZ32xM8IVV8VqzvZTEgoMt+3SVy2VoWfyCpHIqpvEilr9tHkGvqQH69E?=
 =?us-ascii?Q?P/vwA2oLD+WImcVHrZ6M/K1OVmaCJiTnFzLadmJBZiBGSfoqg7yJ9FLATr5G?=
 =?us-ascii?Q?zwNVygoTiuxkDRvEUNxJz4J+XwcXFXsMW67Zhq8G5mmFELcPK6KMm9jrPYMz?=
 =?us-ascii?Q?6/5aNbrPQzTZX1ORLaOM57/0yfLoVBXHtB1/66VFIsISNAGvjRNd4uIkICK/?=
 =?us-ascii?Q?ULbWNRWS6issEWZ1uy/ahUEfbUcbYk3rxVUJOYxs1OeEd0eWzGpukpRpf8K8?=
 =?us-ascii?Q?XpyiTVZsA57whTTIv4tHrYoqe6+mTxqf+c7IHahqSrv8XF4XE7F9CKh+9w5M?=
 =?us-ascii?Q?7UwYnlT+jx7YnXlWJtooMe4pk/S+ETwT7PFlno2or0GZJbVi8tkPmCEbm6BO?=
 =?us-ascii?Q?03GL9L0ZPpicYl7smauSoeOq42sbfANoLq+7Zc3n8XmK72CUenczfycQ1cyZ?=
 =?us-ascii?Q?7Gu70rIoSBwwZeSA0WWQnM7rKdd+1jrrpdjFjFAAclVQbJP6lcKXwURVU3kK?=
 =?us-ascii?Q?fmkwVpII76rLmm6edRopPWbX701SzOppHEw6PbSagzWoKjegdtid+m4bOeMU?=
 =?us-ascii?Q?cDFQ5/yJoAnCYh2d3vSXKPtHtP8uMu7MB+ug2QeqrsP9fS3S80uSZ5pF/Ver?=
 =?us-ascii?Q?Jxwec63mWUqhqn+2kb00xpDQwo6fToL6H9JhPdzaO7dHLCEkYWYdhJC+sHpY?=
 =?us-ascii?Q?c7xq0HLmw072m2N17Equ/2Sq/XkvhiP7nCYQMNL15LJ6ut43lzapPe6YNdmR?=
 =?us-ascii?Q?aCFSV/kr9XDnC7yV9tmWpiLws32AIsIr18F6BK5ijrLAQ2Z9QFNstfrLZ9xB?=
 =?us-ascii?Q?vi0PrzCh3MA44SDN9FLQxveQql/Om9cSs0YQ1fjQL3j1MAq9jTrpRsmXZD3Y?=
 =?us-ascii?Q?DjQ7zwMAkfK7AOLpRmbB+xEhdh6wZHi3FVfMX4hnjdQh7hANKDlLRuNoFP8b?=
 =?us-ascii?Q?6Mv1eyhLh5V6a4XEQG3zL6jV7HIv0L71Fx++HGF+XSC2Eqo4RWvbqRT9InBT?=
 =?us-ascii?Q?KDlNO0JMp23aj1DTDiwIGZP6ABOp+fIPkL3MnzXsvkIUjRq0O0yRCE9Wjgz4?=
 =?us-ascii?Q?zidPEuvfY6tmJCu8ybv6qjGPkP7Qy5sW?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:17.4967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a4a213-bbd0-452a-eaee-08dcad2ce8d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

This hasn't been used in a while.

Moves io accessors from nvkm/core/os.h to nvif/os.h at the same time to
fix a compile issue that results from <nvkm/core/object.h> no longer
being included.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/object.h |  7 -------
 drivers/gpu/drm/nouveau/include/nvif/os.h     | 19 +++++++++++++++++++
 .../gpu/drm/nouveau/include/nvkm/core/os.h    | 19 -------------------
 3 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index f52399caee82..478cbb8f2dfe 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -134,11 +134,4 @@ struct nvif_mclass {
 #define NVIF_MR32(p,A...) DRF_MR(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
 #define NVIF_MV32(p,A...) DRF_MV(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
 #define NVIF_MD32(p,A...) DRF_MD(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
-
-/*XXX*/
-#include <core/object.h>
-#define nvxx_object(a) ({                                                      \
-	struct nvif_object *_object = (a);                                     \
-	(struct nvkm_object *)_object->priv;                                   \
-})
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/os.h b/drivers/gpu/drm/nouveau/include/nvif/os.h
index 429d0106c123..a2eaf3929ac3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/os.h
@@ -34,4 +34,23 @@
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
+
+#ifdef __BIG_ENDIAN
+#define ioread16_native ioread16be
+#define iowrite16_native iowrite16be
+#define ioread32_native  ioread32be
+#define iowrite32_native iowrite32be
+#else
+#define ioread16_native ioread16
+#define iowrite16_native iowrite16
+#define ioread32_native  ioread32
+#define iowrite32_native iowrite32
+#endif
+
+#define iowrite64_native(v,p) do {                                             \
+	u32 __iomem *_p = (u32 __iomem *)(p);                                  \
+	u64 _v = (v);                                                          \
+	iowrite32_native(lower_32_bits(_v), &_p[0]);                           \
+	iowrite32_native(upper_32_bits(_v), &_p[1]);                           \
+} while(0)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 3fd5c007a663..9b05612e6490 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -3,25 +3,6 @@
 #define __NVKM_OS_H__
 #include <nvif/os.h>
 
-#ifdef __BIG_ENDIAN
-#define ioread16_native ioread16be
-#define iowrite16_native iowrite16be
-#define ioread32_native  ioread32be
-#define iowrite32_native iowrite32be
-#else
-#define ioread16_native ioread16
-#define iowrite16_native iowrite16
-#define ioread32_native  ioread32
-#define iowrite32_native iowrite32
-#endif
-
-#define iowrite64_native(v,p) do {                                             \
-	u32 __iomem *_p = (u32 __iomem *)(p);				       \
-	u64 _v = (v);							       \
-	iowrite32_native(lower_32_bits(_v), &_p[0]);			       \
-	iowrite32_native(upper_32_bits(_v), &_p[1]);			       \
-} while(0)
-
 struct nvkm_blob {
 	void *data;
 	u32 size;
-- 
2.45.1

