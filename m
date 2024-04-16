Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F68A78C2
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447C1112F3F;
	Tue, 16 Apr 2024 23:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nGQOzAml";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4188D112F3D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sdws+45X/NNKubdzm9IXjB9GqT2/k9ra+Q27xfL2a5gMBW9A4zZmP0Ig2aLFbz7QlBni6MbcTcCaAFz2rJJSl8F96J/SrXIE04hWA63l2W8R0nkTlSC9GPKClk/fUq/5fd4dmknOgHcTwM557Gm3r/O5NV6PEXyka8n16CwPWwFtTLBzQXGyYfzLbZWS1K7Jppz+eqnxZ8vaowCwIVX3GK3hJ7tXH58TNAFBKWnrujyAHTTbNuz70MnGkSJnvnufYNE+wEDyg+8bG/w9tRSKDT4MoPtIVU/rmpwHAmNi76Pq5s5tZAkXJtnXTs7E38M+gSVAJXbZy3qhmW5GSEwRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vPsH+KId2mG3WptNueF71Dll/esjqud5lEKUR+cHm8=;
 b=RgKufp1Fs/fMaD1uHZqIuHAhaZ3wBSr0rVdP4joLRpsB+BQxWsFgylp8v41fbckck8llrSQARKySPsrf+T/Ywstx6gVCuK/BSghg/btHIFIEewJHucj5szZm2gxxHy69CVo64boyU6i8JgtZCapaDaxFriVeYhREg5FewkEqU5xk2E06AYd/jsSmIZIZX5Xxb02X0bPjGr3N8j9itLrznRzvzC/DofGIFxUdkZ+wMohqjOJhePwdXo1474KTpKGyqQQ13fxvtV3Nh7LVRoKJ8mVh/7MTBFqOgt5lSHPykfZCuYDkEBAtwzxPZdjUD1bndZnd6hXk7WbXAYrEXf666A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vPsH+KId2mG3WptNueF71Dll/esjqud5lEKUR+cHm8=;
 b=nGQOzAmlxRX/Tz9cWzcTDSYOCQ5evKYuvdgFBk8DGhGc8QnSUrrBj77ImUI/q/QSHyXqOc6iJ/YJW27jm9NPANjJpV5XMc5oNclOb+j5wFeSrz0T8vt/cNfZWQe0Ie0qza2oyLeys8gmjZ1LZHIgAGNtVu3jQYISYNBQiowAjsDQcJMTfhnwIGEiDskD9atdGZ7EOsiCTabXUWpDfVg2KQt8qapWJWKEyiF8iMsnqjenbJPgwL6mUNiWkKskC3R9WI/4TxBz6eczq/emufdzY/Tg1fFOzBXsIxx+N90gq1wj6W7soGgir8H5wJ/hTf0q01hEyHL0OweuL9dNhr15vg==
Received: from DS7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:3b8::35)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:19 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::1e) by DS7PR03CA0030.outlook.office365.com
 (2603:10b6:5:3b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:04 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 029/156] drm/nouveau/nvif: remove nvxx_object()
Date: Wed, 17 Apr 2024 09:37:55 +1000
Message-ID: <20240416234002.19509-30-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 70917791-f557-49b9-f7b6-08dc5e6eb6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T9/dpAWq/rBM9vRJZtyepwQZwlpsg8AEb8qzyJZIyz1iiB0EeGw+ahd/Vht4?=
 =?us-ascii?Q?y/9vzqiReQi/bpmy7I1HsAmO/Su6BOloczZh3RBlz3CJt6T/OAQcfQgN26nu?=
 =?us-ascii?Q?STGcXMe+E5NOB8H/fxdsOaSCZtrT7aEBvsVVj/esrKpoeiQc9tKiZe5mKJbS?=
 =?us-ascii?Q?d5uqmbJ+TrxTDxeGpaVGXnX+F6AYeNIDe+EeqsB2riolsk0e7u2Y+COL9p84?=
 =?us-ascii?Q?VyCBmMdWY8cJso9XdUpUvfddh+wq//hP4QC/oJTNy8m0Ckk+jqHur6CPG/a+?=
 =?us-ascii?Q?E6rY6rp7cMruwLFAOoEPFy02vXQtuHFAD3ooEcTBkoBYMLUZR7tFK+yfysjg?=
 =?us-ascii?Q?DyklZS5JKqmMCtxaeu7pY00DBDKZbDta482U6bpODmP4gVq6vsME8RvICwqb?=
 =?us-ascii?Q?KsLno1DxT+tSQca6/KxtIHvuTBCHtgHq/qQJWEyhXSt67xqw8dKtxjVSlDso?=
 =?us-ascii?Q?JW3kKM2NiN7BKWhq3B0DmYfn1lMmLyRa6qSO9YdICnlkp79+Rmnc2N+FjBYQ?=
 =?us-ascii?Q?ZuUoJ7JEPGkIi/nLnr0p4HUJrJlyTTCI18pn81kX6f6ihho6QSjEilPOgsjJ?=
 =?us-ascii?Q?DpMxhLbvEQASep7C/boqOJeUWw1XmRDD2d8598UE6lg17NMMgmNfQCxpaVwl?=
 =?us-ascii?Q?YRmahbsmfaD9mQGLGogsGekx+htRC85kfBshPxlQP59NXMTwV888gPK/6Xot?=
 =?us-ascii?Q?BtFKAgr/SUbVr3ao5Q0W2KsOH3rgOhNo0pRWxP+UeyOlqKuxqDxbG+Bc4LYD?=
 =?us-ascii?Q?Xz3HRNTsAffjac1tIR9AA4wdI7TE+GRbj3KaOq60yh/6ysEax6nEtxklUva9?=
 =?us-ascii?Q?W/xatkc/jfe9eD0/arXAiInG9HPzrLBR/llehneFeaICF2ypCsfqnm/mB0ga?=
 =?us-ascii?Q?ggLi7NIlCnoe3268CD7gPFG4kkzkSuKjtMoFAqM/jaXE52FXr34CTwhN+wTO?=
 =?us-ascii?Q?mxEW+7il5C5TpbmoDcYTxpoDGgXe+EPsdSSQcWUEpksWDsNp6BZIWjggSyYj?=
 =?us-ascii?Q?omg463+g4RO2T9ako3+lN4XL5nSh5gB3rlFN2QWkMAt2L03OZF52EzQbjxRY?=
 =?us-ascii?Q?x9IJIMa6Clmli04MlKmwe/i6wshIb43pKq9fjq/bfSnl5k/R16typC3xzVKh?=
 =?us-ascii?Q?eRP+9Or8mhAz0aA7ZnNaIqfRN42ZRZ6HbcKcrvMzHgDB5fvzE5tJ5wzTOAcZ?=
 =?us-ascii?Q?lxQzcQTs4HHPHOcAYHJW5fbKsMRB6M9Ctedkmckid2hN1f0qkz/k1s59qPsV?=
 =?us-ascii?Q?vZEv1jhgB/Hmkr6H1L3fOmjIr7PmQgSlrYqkxwPrkXnMxR83EhUEPbrjvBuy?=
 =?us-ascii?Q?bUmnRpl4BuAHXe9QybNYZMI/dq4kJs2Idc54193hfocKZjwP15oQp9mpm2v/?=
 =?us-ascii?Q?+gRw5yPmfwUf3os7DJWXtJO3WbqC?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:18.7126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70917791-f557-49b9-f7b6-08dc5e6eb6f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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

- no longer used

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
2.41.0

