Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDEAB2B55
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887510E175;
	Sun, 11 May 2025 21:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j3yXDTR6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2D110E0E1
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du602vtaHxjz/2uIOp2dvwZO1oENyRFl5TTahewQ1Nfrs0SXNwDShZDK7ajouB8nHT4Q37DBz6htuQgQ75c9L+fU4vdmHfjX50mDnaT1MkyZsbx52HNBPos1hvuyKNA/C3bQDCVdQSrq+166/q7jQYiYLOsNjgk5k51vReO8PcCOH/NgOPtH1G+V8QG0DI+FwsORioLg/wuimLBH2zprwCeVHJp3xQCjEHx4YId9HL/d/krOQAui1x/+0Rdkol++YiFwtenDTgsh+RT8X0Bjvf/yPmuuDOir0dyAOaWiSKDSD3tJpvIfb5A3J2EspQBAMrCgMdqke5VyWuYOZUY7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nexZMeas19AZ/4/89snozhPE146uA6TTOK0QAZtps5Q=;
 b=DbU27aRQlM4ACMhcahYK7cCyB++PTpvwYmh5FP5T+Z7MBKaQgq/XrCYLyGQsaSHLa98G/fC5Nab/VKw6PFD8H8pIJbwtVntH1BFR2NBQx4iTCtyMUEBpZ+un/1qlWzcpaLs1IqAkaERRu5hwIIJloD2btU0cDJKO0PPuetTd5dqfm64WsIyVy6UueIYeqiUml9BjyVoplAgacumfxC8466iQj5Wkgd9iGced10TwALikVNyyDFwMdiyAL/Uuzqe2DqjBjIFKtp5zg/hwkP7MvfWrshtVTlGl2ZXxDOawgI/KabFod7TeAraIWiO3ST0xEkvADtT97k3Emv5C8jaJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nexZMeas19AZ/4/89snozhPE146uA6TTOK0QAZtps5Q=;
 b=j3yXDTR6rrecBlTNE529rrB52HguKmqY0LoHDAqppYPDuIy1rKSBsKZvUyFHjF/AGzcsmVcRdivKB0tHJICEelpg43P1M0KLBQZw76wwJ6GZE16OYPohfceGU2frzXL3Z1BwT223OYHT48QOLKwGJvPuHnvshFs7RU5gsH5dhzTc53gtZI80CYSbzWKraLWnqpjc4t4YLv5JNViS7ptRUgRqrRCag7CKvGqDkqlvIC+nv/7ZxEdkTU9y6ZkTEKKmpiTRqAeab1yZWdED2ZSHUqbOhPct9j8cCrmwIHPQGYK1JADoR6MTE7Ja2yhxtG4OK8wbYBkparc0mmieSgMAoQ==
Received: from CH2PR10CA0010.namprd10.prod.outlook.com (2603:10b6:610:4c::20)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:35 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::55) by CH2PR10CA0010.outlook.office365.com
 (2603:10b6:610:4c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sun,
 11 May 2025 21:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:29 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 16/62] drm/nouveau/gsp: add usermode class id to gpu hal
Date: Mon, 12 May 2025 07:06:36 +1000
Message-ID: <20250511210722.80350-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e7c8ac-b6ee-4c21-7fe4-08dd90cffe24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xVs+Ms6KSMTExzdptF7JGnNUX5mGEqPH9Vt3OLjfKuEwFXjztu7U26+7Qfrj?=
 =?us-ascii?Q?w74TFA3k2EKQB5+DHWfZ0wicIQA3PMPkh14WpqaZ5g564DIlfT0LwoGayefm?=
 =?us-ascii?Q?ynCaejQBz9ew0QUUn9RiFUYPgzgJYE+scZBKG85xl6TmQGuUgLEDbsIUdmBQ?=
 =?us-ascii?Q?p4/at1Fydo5I1OMKwyyvdmH5ETeEIunYYGpVHDpd2+VmQHixU6ptwLvbVbxk?=
 =?us-ascii?Q?rUl6EqlyN9UHFr3HW1TDO+JH7Q6Cjf+zDNG4lEamtYcpNIsPyEyp+TxCeLba?=
 =?us-ascii?Q?UCKYz1zU0plwdp84BKcD4ix+AeVnyllo46p4MDuA0BXSIsBrIgA6kSX1v10w?=
 =?us-ascii?Q?f6I6Ivh5hHDtCBVOBpZMuO+yhtO6PBaLLCmbtMtQF/Kaw0m1SpacCg+gvTh4?=
 =?us-ascii?Q?8gZ9uDewGg0Tfe9HoAgNQD/JImhETa+mwkn/BU3OK2wzgVugJs571VgfQG/r?=
 =?us-ascii?Q?ytND/R9DSym/o3rdN89v4GNNX2VU1y16a/t6FA+DtkZ7zVXpZqkSiWjv6i1c?=
 =?us-ascii?Q?cGqTcBQecajHEMcg3aE//n8oz6fAe4PmP28OO+cgpGSjuNSouhvLNRY13KX1?=
 =?us-ascii?Q?lBxkGagaPIYFCGXNEcoGst5KarpFC2j/xa+NSXsXX32EaBMJcZUwAOhFywDP?=
 =?us-ascii?Q?zkDgmDDB/sxnphoVzxomB4b8ywd6vQDVRb++Ph/FASNL0ICmF0edEGxR05I6?=
 =?us-ascii?Q?r9V1C2fAnq7b/N57Yc9mik6cG16+8+CJ/olQ6kOQ9KCIs/yejAVcSONL74vG?=
 =?us-ascii?Q?ztVv/VGoMv0HBI/izJ3HzqC1mCaCFodVyEScyr0gyjkOmnbYfJJjODgnkXNs?=
 =?us-ascii?Q?7a2C0qiWDcqjNVmV2Q0xf6RU5gndlX6aT1d8LC7z30Z5Ee1NIfvl4n3g/+8v?=
 =?us-ascii?Q?GvDSFJ9HzKHocZRfdCGuCn03+TsLzk2GsX0PJLmorN+dfOJewS80OjGnz8e1?=
 =?us-ascii?Q?Jmf80koVHsZM9dzKsZNT8aGP/UHwV9J9wSTXTBRXltEwz3F98QPNT/Thx8ue?=
 =?us-ascii?Q?z7MdkDpzFduK0g0d60lESzxMn/oXmHeoxrG+u+BlgR98eHveZwElrrwjYHqq?=
 =?us-ascii?Q?Q1+/5gvvKJFsWlAw15lHN/9u7v3xUQfgYrkaJqVr4Bf/D2dotdafTx/40/j8?=
 =?us-ascii?Q?rTNmfy1h9yYLMNfSi4npZ21+AZNEDQNXzR9eaAYk4VRpZi4cUdoYKxqu2KGQ?=
 =?us-ascii?Q?XaLFfLcikS3ZnnTE+RNNrEWDzsXL8y6o/c5aw70bADN4QfTPxjjYVVJgTVSS?=
 =?us-ascii?Q?JBUGmtmyWz/fSRVPNMq9OV2OHm2hIXQI/p4XNp55kgkLXpEBz/Q50LDInBWG?=
 =?us-ascii?Q?YaYbTUZ9751pfs94PMrJuQWuGDttRpCb9uIOxjyiy4EQNoKKQiBHJsQ8S6o/?=
 =?us-ascii?Q?oCHBS26eMMN2w6r3Jn+fUxlp+NgC4GIyC4jy5hJ0tBNc1Czu2fZBXnLivaMm?=
 =?us-ascii?Q?ezAWWKnJz3YR9QZjAEqwzmo455fdCFxrmQo329bWDx1fofyFAdCLshBAC4w8?=
 =?us-ascii?Q?441HgZLmPlQeIpFfi93UUiuDt7PEKnxi4J4W?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:35.1514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e7c8ac-b6ee-4c21-7fe4-08dd90cffe24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456
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

Use usermode class ID from nvkm_rm_gpu, instead of copying it from the
non-GSP HALs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c |  3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h   |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     | 11 +++++++++--
 6 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index bdeaffbb1077..170264d2a61b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -16,4 +16,6 @@ ad10x_gpu = {
 		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = GA102_DISP_CURSOR,
 	},
+
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index b10e6ff9e9b6..164f46e0a93b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -4,6 +4,9 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 ga100_gpu = {
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index d4b67ccac608..f1d4778c4bc3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -16,4 +16,6 @@ ga1xx_gpu = {
 		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = GA102_DISP_CURSOR,
 	},
+
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 7f3b5f3fd32b..7d005f73326e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -17,6 +17,10 @@ struct nvkm_rm_gpu {
 			u32 curs;
 		} class;
 	} disp;
+
+	struct {
+		u32 class;
+	} usermode;
 };
 
 extern const struct nvkm_rm_gpu tu1xx_gpu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index add98b2f3b6d..7aea54dd89ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -16,4 +16,6 @@ tu1xx_gpu = {
 		.wimm = TU102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = TU102_DISP_CURSOR,
 	},
+
+	.usermode.class = TURING_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
index dce337306cab..9446049642e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <rm/gpu.h>
+
 static void
 r535_vfn_dtor(struct nvkm_vfn *vfn)
 {
@@ -32,6 +34,7 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 	     struct nvkm_device *device, enum nvkm_subdev_type type, int inst, u32 addr,
 	     struct nvkm_vfn **pvfn)
 {
+	const struct nvkm_rm_gpu *gpu = device->gsp->rm->gpu;
 	struct nvkm_vfn_func *rm;
 	int ret;
 
@@ -39,8 +42,12 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 		return -ENOMEM;
 
 	rm->dtor = r535_vfn_dtor;
-	rm->intr = hw->intr;
-	rm->user = hw->user;
+	rm->intr = &tu102_vfn_intr,
+	rm->user.addr = 0x030000;
+	rm->user.size = 0x010000;
+	rm->user.base.minver = -1;
+	rm->user.base.maxver = -1;
+	rm->user.base.oclass = gpu->usermode.class;
 
 	ret = nvkm_vfn_new_(rm, device, type, inst, addr, pvfn);
 	if (ret)
-- 
2.49.0

