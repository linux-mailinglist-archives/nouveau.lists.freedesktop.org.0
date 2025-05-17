Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354EABA705
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA910EBA8;
	Sat, 17 May 2025 00:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="apf3z3up";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808310EBAD
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJvVWJ8wJHNZU6aknk7t1IqYnp8CXYYUpY+3zZao+N3gpd0BYwAnCMk8ZZldq7gQZSp2jyUIGGmibpF6xrMxcMnZsiEtWx2Je49y9b5XM7aiHDKGqXCNZSVFT5eCZx5xs6DEAuy+3guhAYH1bIhvQQBqpR/FWHRZno2hRHMYq/puxciTRB5aOTeuha8V6Ux0VwRg+XzKoddzTo5QX0BRMgyF8VRe11kOQjVsYFkraM9LJWxdxO5EF8CddzwFVl4F4AOh9ZowCWpdL9bEu6HRp7CCgXianXZ1eeYgf48y6EihhRU98tDFFKUJc4zymh5j2L3UeHVyDNUW6q00+LdAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejOSBdiNHcxyozUFCoURWkdxOBFgyE5T0y+JrDKa93o=;
 b=n0VvmCkNn/QIEiK2hJaTpLE9RjNPYzUko7pn0V/Ru44nI/AhyEEanVLBWAVVRJu4DUaRMc2eMVIiUy1QNl95a7+JjOg18/VrraViTKU8rPM3DrjsNSLVyUwHD14/lDJ+rw/JsUxvjU4Iz1BeSXPbgkqi9F56HYXTiizyg8r+QEKBhLYYLIZu/vqMt+W/OSfVHyTsc8xkz3wpGN8Dk90OcZbVHX75cacKhI3S8egRMz1YS3x3Wwau3IVoteZ3Y2dED6C/ywiX4Uv1lk9sSdy9Kjm1XJg0nv4sAAoPVH6Ez88ZNjG0xcbgaP+/iDaNyB6js3Zj8NZ2MSTIfzL0bfcnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejOSBdiNHcxyozUFCoURWkdxOBFgyE5T0y+JrDKa93o=;
 b=apf3z3upaxaguNfw1NKzLxCZSBaR9JFVDm7WJfPPy7F0QZb7XlrmLUFjMyGyxCe/HpfybCVDrbqWx6ZA893X+TCAVotdnRn4B9ksx6+KI1isSw/b/i47gPvi0L0J623NXbVI3uxknjMTbf3N0Fs7nN5dcIb5/NHJh91ZNx5EwCJtGh8/WkmKVLdX0Ewn6WuWd1eJIZ560rm0kY+wgiwJt3+F5koNgSiSCaIuD8jkTrFknmIac/hvTKCqg2bMAk1ERTIIY8tfvnnsFQW3A8jlAnOkeKntPRSE89nOYSZzAzutp7ia/rldzhIdeyCFgWClTgPPhCMfxMbpsp5ByQ22uA==
Received: from CH0PR03CA0370.namprd03.prod.outlook.com (2603:10b6:610:119::11)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:10:37 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::cc) by CH0PR03CA0370.outlook.office365.com
 (2603:10b6:610:119::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:10:37 +0000
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
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:24 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 11/62] drm/nouveau/gsp: move firmware loading to
 GPU-specific code
Date: Sat, 17 May 2025 10:09:03 +1000
Message-ID: <20250517000954.35691-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 20884102-32f5-429a-8d3d-08dd94d74052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m/lNhcQiGR6HVYnozc9KQAPuWCA0Ay5p0R+CH/io6w8t6S+lGbpSSLV3eueP?=
 =?us-ascii?Q?UKUBOaLYYLWOfiXLa36a9iXdKiDedMWVohCzNNvElaboOpSxxCUW/hYQvCGr?=
 =?us-ascii?Q?P0kULBrmbOLYgEEwr9mj/r31Fd2HBl7fWoS09uuudXQUx/PrHy+4XLLTfJEy?=
 =?us-ascii?Q?cWHzPneseMLdMk/+0RKwICjrG4RsQJXX3DjZSpx+v8yQaZMhvPcO/s93CKCk?=
 =?us-ascii?Q?BxVMclS/A+3tXhirXWvJBIRqrKQRV1YJyn5ML2c2fcyvqIt5I1dbvv8c9pVK?=
 =?us-ascii?Q?cGBS2YuDGOjLqgdkHmtExSPFWTu6yyrxTZiH0kKKIo54gRdl41xeuO2JCqbj?=
 =?us-ascii?Q?slS7xQDswYLnVhKXTQDNwwHx9937hDpPjaJgMCxKQO37NlrEO+sbgRvY2wOO?=
 =?us-ascii?Q?kCYOPDi6JEx7Tc1pxowXzBWGEoGcvKF44gBIAavIy6l8Jz5Q+tLCDyoOpbTt?=
 =?us-ascii?Q?3CCuB4GBOqoXwuG6+Z6V2AvVut1cgjXuETc2u2PSM44RPxpcTpDe2Z/v4TvZ?=
 =?us-ascii?Q?sTljQpPHj+7tpN+M/PD5RMwzGgt69NDP+dnfdPam8PP+fL1L4Y9j3HVHyKKI?=
 =?us-ascii?Q?e6DuL35Z053s4mdDAIp3w7g5DvHp93GukMWvnw3Im0UWStnQopjG+M+nrlUJ?=
 =?us-ascii?Q?DDpfpTLNX3wbrE96n0gtStUvXLnU/D7oHnlxvN3oXpBZCeP6uitAv46IhWb1?=
 =?us-ascii?Q?6bMcQBHGGi0L/K1TmN3eAFpbASO7xsyQDYyJjjfoPe6uvRQ7NIj05AKnS7Mh?=
 =?us-ascii?Q?vEVMbvralo3bURGTDGVUduqDS8/wTvTU47ZftR+RxIYamTv2xuI4MKL9XXv3?=
 =?us-ascii?Q?xO/H+eisijhc+xG0lP0MxEBw11XncdSCWR9QJ50wa+ACdVR8j4ytD+nY/7/W?=
 =?us-ascii?Q?9opPuJkHyL2YzJo9Z3kPODWLglrG83Uw8HVhdkYhEorRTX8hl2bkrMUCTD55?=
 =?us-ascii?Q?anwoMJ0W3G0tJVZD1Sj+bE8yoZHwMnFeVkxy4o5VmlbCeVd90aCoGYnnKShS?=
 =?us-ascii?Q?1nTSC6CJm7LZ9RfPdlYts3zKi63ii3J/KibJ3Z83d7KGHeqzGJsHtYEAyhnT?=
 =?us-ascii?Q?gh1PuoQ4+ZiRJQtHcHiK/0+zF8f10Lz5hp39lSiAXBW5k7XKjsQPRoHgF2ju?=
 =?us-ascii?Q?8m36PXEGLdJ+HrC/7rxUCIvwbcO3u/3fN0ULJ3TlqpKCe9CxoCWTUSjGs3vs?=
 =?us-ascii?Q?HKBFcbV2aP4T8Q7BDS6HK3ZaTKyvHxg0o+1U/Lj2wEVUEICpq8FyYr2bBAJy?=
 =?us-ascii?Q?0yKAfyXfK0RlvTNgGKabUhFvnZ4lir1VQYiFJlhZImuPx4P36WX5JCPr6PZ4?=
 =?us-ascii?Q?BoX7V1n1tzNRFuCumDnCJciaA3PYwu6AfL40WXEhcLkc5/pH0PDcvl8j14BE?=
 =?us-ascii?Q?VOxpgeGbtzy5z490UOL0NSpqmiNoBSQimvMDavprrHIgdlhWyyFQ09vpVNiN?=
 =?us-ascii?Q?5brBo7HmLEr3aUp5JrMY7N6bBTRXdxQGu33Hf9ypRgtb40jLlR0BRXmVebtb?=
 =?us-ascii?Q?EHYf+wbuYgp2vvu7itfyfRfsaS/fa8IuXXPO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:37.3276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20884102-32f5-429a-8d3d-08dd94d74052
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223
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

GH100/GBxxx use a slightly different set of firmwares to boot GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 23 ++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 12 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 78 +------------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 52 ++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  5 +-
 8 files changed, 108 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index c849c6299c52..221ea0fd8a51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -45,7 +45,7 @@ ad102_gsp_r535_113_01 = {
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 0, r535_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
+	{ 0, tu102_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
 	{}
 };
 
@@ -55,3 +55,9 @@ ad102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 {
 	return nvkm_gsp_new_(ad102_gsps, device, type, inst, pgsp);
 }
+
+NVKM_GSP_FIRMWARE_BOOTER(ad102, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ad103, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ad104, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ad106, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ad107, 535.113.01);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index da1bebb896f7..fe1cef1b6324 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -80,6 +80,19 @@ nvkm_gsp_oneinit(struct nvkm_subdev *subdev)
 	return gsp->func->oneinit(gsp);
 }
 
+void
+nvkm_gsp_dtor_fws(struct nvkm_gsp *gsp)
+{
+	nvkm_firmware_put(gsp->fws.bl);
+	gsp->fws.bl = NULL;
+	nvkm_firmware_put(gsp->fws.booter.unload);
+	gsp->fws.booter.unload = NULL;
+	nvkm_firmware_put(gsp->fws.booter.load);
+	gsp->fws.booter.load = NULL;
+	nvkm_firmware_put(gsp->fws.rm);
+	gsp->fws.rm = NULL;
+}
+
 static void *
 nvkm_gsp_dtor(struct nvkm_subdev *subdev)
 {
@@ -100,6 +113,16 @@ nvkm_gsp = {
 	.fini = nvkm_gsp_fini,
 };
 
+int
+nvkm_gsp_load_fw(struct nvkm_gsp *gsp, const char *name, const char *ver,
+		 const struct firmware **pfw)
+{
+	char fwname[64];
+
+	snprintf(fwname, sizeof(fwname), "gsp/%s-%s", name, ver);
+	return nvkm_firmware_get(&gsp->subdev, fwname, 0, pfw);
+}
+
 int
 nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_gsp **pgsp)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 223f68b532ef..c3be72d3390a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -61,7 +61,7 @@ ga100_gsp_r535_113_01 = {
 
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
-	{  0,  r535_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
@@ -72,3 +72,5 @@ ga100_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 {
 	return nvkm_gsp_new_(ga100_gsps, device, type, inst, pgsp);
 }
+
+NVKM_GSP_FIRMWARE_BOOTER(ga100, 535.113.01);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 4c4b4168a266..d7385d3989f1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -178,7 +178,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
-	{  0,  r535_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
 };
@@ -189,3 +189,9 @@ ga102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 {
 	return nvkm_gsp_new_(ga102_gsps, device, type, inst, pgsp);
 }
+
+NVKM_GSP_FIRMWARE_BOOTER(ga102, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ga103, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ga104, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ga106, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ga107, 535.113.01);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 9f4a62375a27..601dd5d503bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -15,8 +15,18 @@ struct nvkm_gsp_fwif {
 	bool enable;
 };
 
+int nvkm_gsp_load_fw(struct nvkm_gsp *, const char *name, const char *ver,
+		     const struct firmware **);
+void nvkm_gsp_dtor_fws(struct nvkm_gsp *);
+
 int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
-int  r535_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+int tu102_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+
+#define NVKM_GSP_FIRMWARE_BOOTER(chip,vers)                      \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-"#vers".bin");   \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-"#vers".bin"); \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-"#vers".bin");    \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-"#vers".bin")
 
 struct nvkm_gsp_func {
 	const struct nvkm_falcon_func *flcn;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index c292f5a4e1ec..9d5b77b3cb2f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1960,19 +1960,6 @@ r535_gsp_elf_section(struct nvkm_gsp *gsp, const char *name, const u8 **pdata, u
 	return -ENOENT;
 }
 
-static void
-r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
-{
-	nvkm_firmware_put(gsp->fws.bl);
-	gsp->fws.bl = NULL;
-	nvkm_firmware_put(gsp->fws.booter.unload);
-	gsp->fws.booter.unload = NULL;
-	nvkm_firmware_put(gsp->fws.booter.load);
-	gsp->fws.booter.load = NULL;
-	nvkm_firmware_put(gsp->fws.rm);
-	gsp->fws.rm = NULL;
-}
-
 #ifdef CONFIG_DEBUG_FS
 
 struct r535_gsp_log {
@@ -2209,7 +2196,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->msgq.mutex);
 	mutex_destroy(&gsp->cmdq.mutex);
 
-	r535_gsp_dtor_fws(gsp);
+	nvkm_gsp_dtor_fws(gsp);
 
 	nvkm_gsp_mem_dtor(&gsp->rmargs);
 	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
@@ -2284,7 +2271,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 		return ret;
 
 	/* Release FW images - we've copied them to DMA buffers now. */
-	r535_gsp_dtor_fws(gsp);
+	nvkm_gsp_dtor_fws(gsp);
 
 	/* Calculate FB layout. */
 	gsp->fb.wpr2.frts.size = 0x100000;
@@ -2349,64 +2336,3 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	idr_init(&gsp->client_id.idr);
 	return 0;
 }
-
-static int
-r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name, const char *ver,
-		 const struct firmware **pfw)
-{
-	char fwname[64];
-
-	snprintf(fwname, sizeof(fwname), "gsp/%s-%s", name, ver);
-	return nvkm_firmware_get(&gsp->subdev, fwname, 0, pfw);
-}
-
-int
-r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
-{
-	struct nvkm_subdev *subdev = &gsp->subdev;
-	int ret;
-	bool enable_gsp = fwif->enable;
-
-#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
-	enable_gsp = true;
-#endif
-	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", enable_gsp))
-		return -EINVAL;
-
-	if ((ret = r535_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm)) ||
-	    (ret = r535_gsp_load_fw(gsp, "booter_load", fwif->ver, &gsp->fws.booter.load)) ||
-	    (ret = r535_gsp_load_fw(gsp, "booter_unload", fwif->ver, &gsp->fws.booter.unload)) ||
-	    (ret = r535_gsp_load_fw(gsp, "bootloader", fwif->ver, &gsp->fws.bl))) {
-		r535_gsp_dtor_fws(gsp);
-		return ret;
-	}
-
-	return 0;
-}
-
-#define NVKM_GSP_FIRMWARE(chip)                                  \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-535.113.01.bin");   \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-535.113.01.bin"); \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-535.113.01.bin");    \
-MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-535.113.01.bin")
-
-NVKM_GSP_FIRMWARE(tu102);
-NVKM_GSP_FIRMWARE(tu104);
-NVKM_GSP_FIRMWARE(tu106);
-
-NVKM_GSP_FIRMWARE(tu116);
-NVKM_GSP_FIRMWARE(tu117);
-
-NVKM_GSP_FIRMWARE(ga100);
-
-NVKM_GSP_FIRMWARE(ga102);
-NVKM_GSP_FIRMWARE(ga103);
-NVKM_GSP_FIRMWARE(ga104);
-NVKM_GSP_FIRMWARE(ga106);
-NVKM_GSP_FIRMWARE(ga107);
-
-NVKM_GSP_FIRMWARE(ad102);
-NVKM_GSP_FIRMWARE(ad103);
-NVKM_GSP_FIRMWARE(ad104);
-NVKM_GSP_FIRMWARE(ad106);
-NVKM_GSP_FIRMWARE(ad107);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 59c5f2b9172a..e7396344cfdf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -183,9 +183,55 @@ tu102_gsp_r535_113_01 = {
 	.rm = &r535_gsp_rm,
 };
 
+static int
+tu102_gsp_load_rm(struct nvkm_gsp *gsp, const struct nvkm_gsp_fwif *fwif)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	bool enable_gsp = fwif->enable;
+	int ret;
+
+#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
+	enable_gsp = true;
+#endif
+	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", enable_gsp))
+		return -EINVAL;
+
+	ret = nvkm_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_load_fw(gsp, "bootloader", fwif->ver, &gsp->fws.bl);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int
+tu102_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
+{
+	int ret;
+
+	ret = tu102_gsp_load_rm(gsp, fwif);
+	if (ret)
+		goto done;
+
+	ret = nvkm_gsp_load_fw(gsp, "booter_load", fwif->ver, &gsp->fws.booter.load);
+	if (ret)
+		goto done;
+
+	ret = nvkm_gsp_load_fw(gsp, "booter_unload", fwif->ver, &gsp->fws.booter.unload);
+
+done:
+	if (ret)
+		nvkm_gsp_dtor_fws(gsp);
+
+	return ret;
+}
+
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
-	{  0,  r535_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
@@ -196,3 +242,7 @@ tu102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 {
 	return nvkm_gsp_new_(tu102_gsps, device, type, inst, pgsp);
 }
+
+NVKM_GSP_FIRMWARE_BOOTER(tu102, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(tu104, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(tu106, 535.113.01);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 04fbd9ed28b1..a8c9480b8024 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -44,7 +44,7 @@ tu116_gsp_r535_113_01 = {
 
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
-	{  0,  r535_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
@@ -55,3 +55,6 @@ tu116_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 {
 	return nvkm_gsp_new_(tu116_gsps, device, type, inst, pgsp);
 }
+
+NVKM_GSP_FIRMWARE_BOOTER(tu116, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(tu117, 535.113.01);
-- 
2.49.0

