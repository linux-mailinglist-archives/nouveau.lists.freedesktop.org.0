Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECA92AD56
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B9D10E462;
	Tue,  9 Jul 2024 00:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G/pe7FN/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734B310E462
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQuE0P+MzZJVpLOt5OoA2RoOfmyV6dA9r6KlQUK6b3UXBo04uPINesC6h3dq0/mU+i97A4U8hsvg2PIEgB4BlDWcegPbLcwGndzZVY7H6XiuH6bQWewYOm+CiCAVR9S4TVhD8haRtgG4HTOLyKXjSo8/LRUG3lHXG6XjaA76Ow41dIPfsGU1vs6QOy5n5AJQT99EawGbX7/0y04SVM2p5+3Jbr+4gIBYAI8VH/2CGiZWARcu/ck76zaJXHF6fdLWcT4JaMIRDuxmUYmr5hnxNQFjiyK37F42XB7nj6AHkBs7a1L3/VduuLAYT9DZWDhmhsTGjm+KOCDbz0uhKjDl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9wYnM8KTjRqmlvbOBs1dq+JskbknDp4xydFGSkYMyY=;
 b=SMAVxIGaChJuXWG8O+tCp/tAuk/qtziTMbr9SGeBHcNE5GS4YyXPRvV9RP4WOqWIiXqAuMQPH0/VgEg0T6XoiI71n5LeG71nZ3vfC2TZTpZCesW7W2jwSniqMP2mOD4er3CTnNHkOXG5EKWExZS7oqRpVxCBBK0laMGJ68n4zg2hBxSzADT9Ge+tkzvZpHCZZ/jKHN0U/sgjUYv+Ssc0rvi3ov7Qf7VvlVbwbloetQLQNnDnZSVyq8/aLlwVdLaTGlHN7opp/NaYotOmGLu0QaR5oIDYllEhn7zByARJ/hYSg2+IlKFTniA3ZnsGD7xBXiHZUAL9TGS71bTGmisAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9wYnM8KTjRqmlvbOBs1dq+JskbknDp4xydFGSkYMyY=;
 b=G/pe7FN/1eN7PY12z/TcHhcABFj23eiq2yhLafm7QHWwP0fNUG2zfKB3GBMA7a+6WYS1trH9xk5WgIgnna2mQWltK/r5WXIR4Kd6uF8rDOV8WITA/AI9BOGg/1tF56GDFArdHKy5yxQ8HVJjiCm0JQn4d+pMdERAocV7TSdrQFXnHN4tyOmPPjIiM3QpPlYIxgG/TXTkrte1WP7b/11oV8TaXsb1G95QkalWew/FOz7VkELfWr2UT3xiYWQfRv9YSmrAQlUjZcn6FHam+uup5gVFPO8z3stzSkXvYmTcf9pZQ98kvsu76/STNYVRUmI96Bj+0cH80h5h2jvvhp3vFA==
Received: from BN9PR03CA0878.namprd03.prod.outlook.com (2603:10b6:408:13c::13)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 00:55:22 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::e1) by BN9PR03CA0878.outlook.office365.com
 (2603:10b6:408:13c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:10 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 16/37] drm/nouveau/nvif: remove nvxx_object()
Date: Fri, 5 Jul 2024 04:37:00 +1000
Message-ID: <20240704183721.25778-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eb6f3c-bc0d-46bc-00ad-08dc9fb1cfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hwQUpfOVv7Z4CWzQMUbttxmj+0LcVkmS0sn4wI34zOTRAiZq6LmFONgJ93ik?=
 =?us-ascii?Q?woRhqDAa8qElGTcARGq0hcZ7XrCbGx7cHV/TMginLp6510sFCS55lCeMFY0q?=
 =?us-ascii?Q?UJIn1yT1zlGozX6jwazKTeyflTa+pR92FAZFRmcjbw20k8VDWe4Q1HcqG69v?=
 =?us-ascii?Q?14lnJthc+WXCicwFbJw7du4t+K9Hpkbf7mlT6Lfu3MC62WeTBTa+c0YT6N0g?=
 =?us-ascii?Q?we3Fveo+StjCohVz65qBEaAA4k7kYOjC5gxynWWRBkRhcd4pHcbSmEJkMKuo?=
 =?us-ascii?Q?d0yVnARArZkIM9yTE6HtMHMOl00EgUBIHlJEz7q1NOTnJbg7sOKrhDGycRe9?=
 =?us-ascii?Q?OXeiOTnw2XfauomquDrtTLPNNVpI2JJr7RjgfotwmbgeOLbPzQ8oaSfbc/oJ?=
 =?us-ascii?Q?SexpXy0WVussSeflAWoVITT9Eqxfzs2dYd0hiZGgPd+s7OMle6BN2sfs0Ucc?=
 =?us-ascii?Q?93rSICYRNp9JmO9/gjgv9UjS5/vIFLtsV8lFBF9WmqAHSy0ohM1tIAQ/qRrM?=
 =?us-ascii?Q?TC7AWu4HHJU40ZA3oj5dAXdEI0QWUzmO+Os8leX5RLKGRo+l6n/+M61pqP8G?=
 =?us-ascii?Q?jLjnjD29Y3GLcIh5PYfcbS/80bq505pUd8+j8Wz2meSV8YjqzD2lsqbYYQDb?=
 =?us-ascii?Q?TXO/ZcUhNJZg/qoTtqyIm1CRSNU0BOPNoLbUSw95sn/ceRKh7TKymVRPooBN?=
 =?us-ascii?Q?flHtgZJNk3aWiBuNEGabImatXZwVDQSYH5GNDVOMpXzho8MCoEsL9WJ7NdRm?=
 =?us-ascii?Q?hmwV3+NCkNrwh5FmkbZscPg6mf1ISgnHu3YDmayHuh+1CQ2lIuJRgMmPGXNz?=
 =?us-ascii?Q?3MiKzWi9r+nMJ9i5Jj3Itq64eEOHFrkIwwx3VeHfSqoNDdS9HBZjvn4rtXcs?=
 =?us-ascii?Q?E9JpfaOjhbLchRWj1L3sb64BVqfbaguBrCl4n8+4/q3WWGDHPz422X1eUN5U?=
 =?us-ascii?Q?2gKhAvdDsmUP4qKlbtp5u+FonUDJ4fDvVwN+dGq5w9YKAb2jKU8esBuRRQuB?=
 =?us-ascii?Q?RiB7eGyi/Usl7bcFq0gtLj9pXiKQow4IRhZoGgQGbvUSxv0MkJwUKhdeaIAq?=
 =?us-ascii?Q?8OFgJrTIKAlPRl44SZJA6Rswa4W0d7IY9SPk3Oa5c9UxqPypoDnf3TAuW8cB?=
 =?us-ascii?Q?Kz+qbjejt87a1KbR3xRY5oRcHp4jSawoSb8J2dkvrg8vIxZmwLBQF2W4yseU?=
 =?us-ascii?Q?5OzrK4ApLlFN+JRxwWyhclIpz6v5l82trN86e2QgBL3VslmdEjjloTx50vBm?=
 =?us-ascii?Q?mUE0lzNH4mbhOmHR8O7Ac7F4UDNX/WgpAGgs16YYLrHoIbiEbZGYJQIz6GD5?=
 =?us-ascii?Q?4eAzQ/vc4+eBrppcjhwCVDz0TuBaj3jAhsHwDVXyg1el+LgIxK+y9uCbURH/?=
 =?us-ascii?Q?fQp0fc9o1T4F2IuOOvO7kYS3MbKKQj777/NVqIobpZyxqFJ3lMwAO/0H/9Z6?=
 =?us-ascii?Q?YXtC5vz+6ilQPXLlv0fTUIuSoDE8TZNm?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:22.1730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eb6f3c-bc0d-46bc-00ad-08dc9fb1cfca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
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

Moves some io accessors to another include at the same time to
fix a compile issue that resulted from <nvkm/core/object.h> no
longer being included.

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

