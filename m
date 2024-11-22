Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546D9D5F62
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC2B10EB7A;
	Fri, 22 Nov 2024 12:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EE80FSGY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1110EB7A
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu0vAuU3/8zHffULpJB+eMgNAi9LsHI76XO15NmClVzCxpiqcf8/2Qt3gWZNEjim+waZ263KdUs41lZ1texoW42hsFnzLnsGU1wHdHvSn6zYnF5d7EBzHlFP/nemQEGvVJMj+c+nSj93FYNlMvByXlHipsqvzWuy2F1/1nfW0Jwzv1TARBrP/FX3D32in0c1W3brLwPLMGeg5MhIOh9/LGR5oECaj+GCozoAzfWlmFves0Ormtf8DAaASXjcgfXydlMk0ND/U8Jt1mKmKuFIDFh2q8cZHdp+rV2c63sB/M2CGSM0v03UL6pul9DJTcg/oqpfKFC3gGvj11HM6zsGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx23+zZ/Ww0hnpvY5XlB4dH5oUpC0nlZGn8rVvt5cO8=;
 b=BKrH32fZdyMEEY/HqMBJULelOUkzRog7olBfUecbdLCk0aW55KKK+eW661k81mP457ZdKtcRSw3SnoDXRqKEqd0ubEHXPufvfn+J4TreHvU2odzs9XhZzKK3c8k1A+vCRleWWcp+AuSyppfLKlyvpKo5emEJ/JaT3Fv3qdXgtqEzkSpBQeQAYXd+5FM6ptQ7275WH713UTxwSWr0djTclyOl34XH4q/Thxu7NyCXqlqva/rDd+SDUZeKWiiX6UNkC66bLuowXD7xDyB39rdNoFYzzsLYZOkZbV1A3FGk17zQD8T6Oh5yVfxoeYSRi1PUkPDl+kXL2rneHFKqKzCyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx23+zZ/Ww0hnpvY5XlB4dH5oUpC0nlZGn8rVvt5cO8=;
 b=EE80FSGYQ1Ir24xc6muFynlzp8rpl246+fsgBeaVWRBOuDFHBDMTJ/1PMxbWYDFEegpAY1r+TVGHzlZKqZ5slC8PysL7u5dZD7U2IlRPVwI3x4RMJw41T56HZpktMmzqxjbex8BrdGNaoaKce0lvYH3pwXZB2JCZk30o84ZISFr0BwXBaGgvKNZgiBiW1T8DcX7AoDN36L3waQ7BvAyub9EtcCn7hz4hKCzH5rfCcE/oEafPAGVfFOWmXPrC1IYL21LzfV7sxEJ5KnTl0Ayw4RFkEfPN00lSxBxyHU7PUtH49qvVO1rcbUo1ZyAoXkRK/YGJvHjEVdw20gp5q7v6Sw==
Received: from CH5P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::18)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 22 Nov
 2024 12:57:28 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::c5) by CH5P223CA0007.outlook.office365.com
 (2603:10b6:610:1f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:27 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:26 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:26 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 3/8] drm/nouveau: load scrubber ucode image when WPR2 heap size
 > 256MB
Date: Fri, 22 Nov 2024 04:57:07 -0800
Message-ID: <20241122125712.3653406-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 1333420f-990c-4e80-d53d-08dd0af5384b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F73kO2Ox6EL9nJBL6UGj45I2Q9P+MZLvBy8mT+yilDTtWqe/m3El3jX+M37t?=
 =?us-ascii?Q?c3uHVmfagJACoEM9/29Oa4qOjdl2ayz3U4vlKKyHQOZih0BXSKY2xWsY6Se0?=
 =?us-ascii?Q?3fnjmI78N7RdeuUPjMj7VYf/18lOrX8VHcDb3xNtkTgJRmQAejvDfhGiWKbu?=
 =?us-ascii?Q?jODJCMAB51PpuC/97gLLeruAIlm9zJjmoDPLRhZQ8DQnptabbuShVpebb5+S?=
 =?us-ascii?Q?acbR4IEGlBWkW4uGhYz884SFuA+Ml6Brti448be3NjzMwylnhpUH8KH52TE0?=
 =?us-ascii?Q?xg2iuQbb7TSuEiwGTPAlz6ckO5cqw06b/kgW6DdcSH5YpsWpyjebyJpBJpHu?=
 =?us-ascii?Q?CzyV5rRRinbZsRLYMP9sk7W72dZk6IpOvJ0uzza9f2d/g5lBy2Z6Z9gwjiL5?=
 =?us-ascii?Q?4M7TAppecADSW2lBG/UqjhXSiPIHI2DFN0URHTmKEUI6yRCYtPv44R0bRbjU?=
 =?us-ascii?Q?ggnhEOhz2R3lIafNkfG7ax5ZMy7BM4vhVVNr60IzVMg+GD156xJFRFmXTAnJ?=
 =?us-ascii?Q?8PijIRSPcRaHZIVxL4eewpB9iPcSeNoKsLUxSs5illIFS+kNgGyE7t6R+u0d?=
 =?us-ascii?Q?3C49HnI2QBLvb3HLGo7R7GYeOW8TIrc78XPv4sN3lgsqGsfY2gV9FzxhE93g?=
 =?us-ascii?Q?seZ0EPDsYzYnihZP5mjmGkKQIzrx3SnREn2p0yvAQJmnpARl5w36KTmTUuxd?=
 =?us-ascii?Q?YMFgF4z7cnJgUrUEqv1xAlHMniQHzB4w+2hpXdGEtbH6F9YSUi+eBzxWYDFi?=
 =?us-ascii?Q?Ymgtly0MoWAn3A/4Q+jNd5BMwXE5SSN6Vz9CC3rkTmCZxv5u1fEzdyhAULSo?=
 =?us-ascii?Q?vMS4CvdjIimGtbDBnrDzS6Nam5FPprDKrrcq+0BnELq32kzhCPYmElHP2wiJ?=
 =?us-ascii?Q?74rQMe+8MiQ2vccUG0f0dz6o4A/xmZALcDSph9riFONBgg36xKh9CIhpcU1M?=
 =?us-ascii?Q?Xnj+4wMRjIlj6Wq4pWtG/djsXuPsnJaKingflsTIlVqY8f3Rgsfp+IWlYdIL?=
 =?us-ascii?Q?5r1dV4rNBp3N2cL0yaHDaE9O14gRHROm0mdQXIbnTGTgEy4a9Eh2oqVEwxTH?=
 =?us-ascii?Q?fA66P+PBp55f8xAahmBVZ4gVWqdrr+3gtwQK1M23lt5meAL4ouicJesU599f?=
 =?us-ascii?Q?JuJnOVcaxwhlmj72gQFpVUZzhKk51hCCrDyqw1KL1QUsHXUVErapsAmTk290?=
 =?us-ascii?Q?azftzsRsQiWBgdTYYjyhuFpeneiv1o9VXh39U2IUL9bh683+cQF8ygP4eVlG?=
 =?us-ascii?Q?/vPLdC+SnktGRna5pQGgXhNrSUk56/d8u3B681aWDIwBFrm37HYUS8SSXgGA?=
 =?us-ascii?Q?wlJtpj/fvaQdR6FP+YLjdMf01VWiedpm3QbOzYFeIGlVLNkEVUXZBc1GOZso?=
 =?us-ascii?Q?0doyfkPf81fdtCdbnu4yl9YUGMAM741vTEviJ6giomghsGbl/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:28.2831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1333420f-990c-4e80-d53d-08dd0af5384b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
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

When WPR2 heap size > 256MB, the FB memory needs to be scrubbed before
use.

If not, the GSP firmware hangs when booting.

Introduce ad102_gsp_init_fw_heap(). Load scrubber ucode image when
WRP2 heap size > 256MB after the FB memory layout initialization. Save the
fwif in nvkm_gsp for firmware loading in ad102_gsp_init_fw_heap().

Cc: Surath Mitra <smitra@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  3 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 21 ++++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  4 +++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  6 +++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index a2055f2a014a..c6fe2d9d47de 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -33,7 +33,7 @@ struct nvkm_gsp {
 	struct nvkm_subdev subdev;
 
 	struct nvkm_falcon falcon;
-
+	const struct nvkm_gsp_fwif *fwif;
 	struct {
 		struct {
 			const struct firmware *load;
@@ -41,6 +41,7 @@ struct nvkm_gsp {
 		} booter;
 		const struct firmware *bl;
 		const struct firmware *rm;
+		const struct firmware *scrubber;
 	} fws;
 
 	struct nvkm_firmware fw;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 00a7ec875400..bd8bd37955fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -21,6 +21,25 @@
  */
 #include "priv.h"
 
+static int
+ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
+{
+	int ret;
+
+	nvkm_gsp_init_fw_heap(gsp);
+
+	if (gsp->fb.wpr2.heap.size <= SZ_256M)
+		return 0;
+
+	/* Load scrubber ucode image */
+	ret = r535_gsp_load_fw(gsp, "scrubber", gsp->fwif->ver,
+			       &gsp->fws.scrubber);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct nvkm_gsp_func
 ad102_gsp_r535_113_01 = {
 	.flcn = &ga102_gsp_flcn,
@@ -31,7 +50,7 @@ ad102_gsp_r535_113_01 = {
 	.wpr_heap.os_carveout_size = 20 << 20,
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 84 << 20,
-	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
+	.wpr_heap.init_fw_heap = ad102_gsp_init_fw_heap,
 
 	.booter.ctor = ga102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index dfb41be3d677..a89ab7b22263 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -16,7 +16,9 @@ struct nvkm_gsp_fwif {
 };
 
 int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
-int  r535_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+int r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name,
+		     const char *ver, const struct firmware **pfw);
+int r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif);
 
 struct nvkm_gsp_func {
 	const struct nvkm_falcon_func *flcn;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index c56c545f2bdb..ef867eb20cff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2489,6 +2489,8 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
 	gsp->fws.booter.load = NULL;
 	nvkm_firmware_put(gsp->fws.rm);
 	gsp->fws.rm = NULL;
+	nvkm_firmware_put(gsp->fws.scrubber);
+	gsp->fws.scrubber = NULL;
 }
 
 void
@@ -2656,7 +2658,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static int
+int
 r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name, const char *ver,
 		 const struct firmware **pfw)
 {
@@ -2687,6 +2689,8 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 		return ret;
 	}
 
+	gsp->fwif = fwif;
+
 	return 0;
 }
 
-- 
2.34.1

