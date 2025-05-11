Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B834AB2B4F
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D9D10E0F9;
	Sun, 11 May 2025 21:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EMQs0/4s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613510E0E1
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCHDXKU9YC2ahvGQm9uWsFxWOj7vFfgq4UxOOeR7E/DKyFLOKepUTyszykqKcg83XMycKDp51ZeLp1iN9VjzUJ97hJx1NqTTd2s/F98Wfz5pzpatX6p91Iq/KOYqLohM8Vn/sM0vFK64ymJXqwJCjv7FGI+n37Bq5ALNRgSsA70KJcZD5lIe5th5wyoOf01bchFnsqWiM+yX3p+ULV328b9CqRzlTCCcHneuMTngFdBm+07mWyR0LhejqXGcVVCLuOjvqZ+vav2LgUCEafzz0xOwEc3UaxvG1EpJ0ZVggbJ1YszVVTMSc6Gm0X3RlwcHrYZVNRZ/vpE160C9++m7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx6nWbIq1I1DIVUU9NtU/kEPms1v6sRaaXMl49qElrM=;
 b=VZY8y7DYv4wlE7Q8MCphuXKdUdgcvJDQDKOtFOcVKIukyI1t0S/QczokztWewsI+ncN5wAG7z+Saee6rBfvOMXlZGIZvDKFJ06tXtLNGebabQkPbOIkx8iVt24yx3otCHR4bjvzxscD2ySU/Bj5UdcYLqgID94Ba2NukwgzKlHwqJkLQiPIvgVpx99g40r2I5Y1Fmtl/2N3a3LSqKhLoZn+d5opH02bCbl2QZXO+oip9Og5tLe4JbS/VgJFrhaOAyRlp7FPUd8DzyBgQAEftx1c0F9L52eRXj8nlQalquelAJH7L5aGoKo0ykloRkxJYJWnATBDo4NFDPiqpSCbV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx6nWbIq1I1DIVUU9NtU/kEPms1v6sRaaXMl49qElrM=;
 b=EMQs0/4skQG3PnkOO5b5Sc+vkRFUI6VHZLx5dY7RpW0nq5fftWNakcbzdbNZU94jsc7reG9Fbza7Fqgj7UxW4BmHqDJNAe3PIOZmTzNw7gmDruLEk7kZ1mdf1/+lO5UfBQUQ4P/XJi/7Os3YBgh8y8kpeIg+08E6cZFIC/ECin9LxS+3MayiZbgD4qpkNg31h0i5uszY7HZ4qLVVrirVxoQqGw95O2PKNRAsdyRTf2xU04XimrYGWBEaD27H+5Z2GdR/cC8p2yQdGJ+oqnsw2zjNTDTWiJOJtFLAbq37vdEo3rwHqyyx6YY5N9vaawpz63UKdKd6AjpM9NfKWWBERg==
Received: from DM5PR07CA0099.namprd07.prod.outlook.com (2603:10b6:4:ae::28) by
 MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:23 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::11) by DM5PR07CA0099.outlook.office365.com
 (2603:10b6:4:ae::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:17 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 10/62] drm/nouveau/gsp: move firmware loading to
 GPU-specific code
Date: Mon, 12 May 2025 07:06:30 +1000
Message-ID: <20250511210722.80350-11-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a482efc-8056-40ac-b8cd-08dd90cff6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zBsKGUX4wXfusmC8aasUHJ51T1OwzjMcmxzIK//uJ3RjfnFFtJ0ISuZ2cnGH?=
 =?us-ascii?Q?9rAU9TL0Ur+359x0CrhbRM2MgfXykBKr6iQ730owD887bteIEmPRW8OlWUPX?=
 =?us-ascii?Q?T4HscGU/khkx5nI4Zifli6KiuE80JANZLaCm/ujTF9g7NKkknlLKRbQWH/xG?=
 =?us-ascii?Q?f254Hed7As1dpe0e16ix434oSrhYNj1uRLuf3McXY5esTsA83sTYQz1qSewT?=
 =?us-ascii?Q?aPSgfu5ziU0SB7Ull9OUCwbBhIhWhxxwJrLsviJmqMvUNvX6dGeSEqsamDLa?=
 =?us-ascii?Q?AGXmblogYv0d0lCUuZZbHCDQeW+c8y2EI2jA5MKG4B/AeLEeA6KhyE5G+EEQ?=
 =?us-ascii?Q?Czhev2lTWZ99RMlE6NNd4Y074RrIsb7Q0sUkRQfk11SleCtl7/4NacckKh3K?=
 =?us-ascii?Q?7y498zCCzPi0a8xvCPOId+siiS8rJQ7y9rvqc4F7M1LfMM+AipkD1LweTQRp?=
 =?us-ascii?Q?mA0mSv+YUm/l85gc3HYP7j+S/S6Y5cctYGaTWKk5mWh9zkoVcLyfRnRDt/1u?=
 =?us-ascii?Q?+yjT+ZnNunQm7cF/f6X/MBYdi8vzDbyis31OdImB/1sBaCwdD1jaBM4vQcTQ?=
 =?us-ascii?Q?wMAHMQY6ToiiIPcvqclarun8n6b1Tguc0AA/pZBSm90qPyCyDqd5WK1/Z23u?=
 =?us-ascii?Q?lJeZKoYRzcgICdSrtE9rySvwf6QZVvLhx/EPAm6w3QyHucK4SlV59L78irZo?=
 =?us-ascii?Q?gIlRSESQsH6cUGHofRfIiTqSL1kIIcPXnqy1pU8siOFxDx/3LzL8V9b3u85/?=
 =?us-ascii?Q?B1uwhe2FuxFxbQjfVPn2cAFvGJfCQT1Eq4caa4XXp6UKx7uXvexNBK90Nhy+?=
 =?us-ascii?Q?JSt1K8oKphy+K9PDTIe1KhokIYR/DS21Vb9MNEu/PhrPurP6oBFg8oz3qOj6?=
 =?us-ascii?Q?F0L3uQL9aYSFsm8eyVXtJUviUHt4VMxzWpq0ySfKKD1yxY/2kQ71h7G/Q7wY?=
 =?us-ascii?Q?JaQ2eaGc/sZOWrNrWScsn1CRyK8o4KGbHOb3QKrUK+gPFbX+qdyGFeMLj8r/?=
 =?us-ascii?Q?FOHMWRU3UNoaBrd4rioKFaUBjfuRt0GVfKJUPiMG298QlNI6236AGcI3PNlQ?=
 =?us-ascii?Q?V1RP3lwrUVFeSJ0+x3JE21EVTJHY1HVQYgnDMHu3VwYaDtbaqeRJCyGf4yGV?=
 =?us-ascii?Q?5dx4eEE6M/FxdeGh121pufmrE9ANbc+7l6D1Cr3D/nzRp/T6y7ALNqMyH1BM?=
 =?us-ascii?Q?Z0Dc8v87RZT1VXzXkNXeX/TR7dzlz6e1ZHaQFRq5WGK8LX8K1JIepHuSXMmv?=
 =?us-ascii?Q?Sgg/yufcrPWL/tQBPx3B2fMq9czw/uETGAuz7/PYZ2FncshJf2jeBbZZ/0dV?=
 =?us-ascii?Q?hDWk7NW2jSoK4+/wIGTXYJ5Hg7LycQYWvHBhB6vCRCgo0mEjRYeIFfJqxR5s?=
 =?us-ascii?Q?iXe3oDYRZrIoNDWrrxtGYJMrWQhJKKrT7Uvs4kBpegQHw3MmWvONOB1RfRq2?=
 =?us-ascii?Q?vWB4pfETtg62iY7Sl1RBxmCxztVxnCkQ/vZ4nXs6YolVizGX+t6IlyqAO42M?=
 =?us-ascii?Q?YCo5+1PKJrK7UxE2q2H0QoLdzxNPoM3ZPKpO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:22.6701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a482efc-8056-40ac-b8cd-08dd90cff6b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
index 71cdc67e9a9d..45e3fcbabe4f 100644
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

