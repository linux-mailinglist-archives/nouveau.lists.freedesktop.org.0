Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6FAAA3C74
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D1810E548;
	Tue, 29 Apr 2025 23:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iaSICk0y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F8110E522
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAPjlapFJQ4FyLwL9Ls4b8X1wQ2txEa6qcwx/EM3bqzp7vaKSmWZWTlhgzMwveXkVTHqc5LBwqemxBYgoornn2+JISg4hwfTYS9/vdfwjO11IECJFoX8+102LUmEFnRKXj4xrzlmsk8XbaO7tQ0w9yQpXt9WJH3NI67r0EcTrOGB/+qiJbpQry+0yeYd7mwZQ8/rfvADTgHHYDmq/9oMjk9zELqDf748UmzSXXYP8YayHxk3W3xnrH5a2q4bZBoobRGTcaG2lD6h/fFMkXOB7AbdGIHmfpZcU5bl2GDiJPZBI93h440YMo3ejV7L+aTzK1ul08wndeyG1vY4ObhQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jHKDoGtDPX4MJ8ZY2Dk1s6buBVtu/4OSIisuiGG5qQ=;
 b=rSCIpUk/NE8yz5j989aholHm+WgZiH8b/53btOFzGn/3nEIuflY6JZk2jwxeuuIBaZneYLsJg26gxcUQD5mts5U2mTL/H6aXSrIdTG2VMyjk7P3vduYvKpmhGWUPBYljZqUvg3UffjygVnsarPopa6VWzYcBn03VDyLQk/gcDLfIGEIfAZU+3tFYhkWcTzQJXJZBhfQT5bZWMyPL7YB4AM4NKvv1O2faeSfFn/Lv9r29mDmQTUh1k2yzYVFJv7i3zKxrsio/cPn2v85zMRXoAKEkK2CVv6hQhAwmbs7MPqJ9Td+VK9MzQgqZUe6tatr0j3EwTnJLZyNNIo3ox7txhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jHKDoGtDPX4MJ8ZY2Dk1s6buBVtu/4OSIisuiGG5qQ=;
 b=iaSICk0y5w8fwf8xgIL9sSjoMdtNvaETaTiKvanidRy2wSSMjIjAWeT81rBsvIGLnPRIpe0Wq4udh4wLtr4vU2Fo4Gu1qASfaXYHZTyYQby19W6tB3RJQh08SVPHSjIpQAl0qdHBYDKwi32gJL9/Q86z8LF4pl2+ixJ0SRZymrUpqqqDNR3d4UE7l9v8QV+1FM1CjiCRETr0o1nkbzEV6LUjchg55W0qJeuKToE2jVY7XmD03+qzXwUK/I5KpBgMmlfRFim+rg06ekcWjtn3QGWVWiM1stzVWND70nwMhafMLRKhEkhj31tB/oxp6j3k4zhNkJOKuB1/2XJpEm/XrQ==
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:40:04 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::cc) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:03 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:51 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 10/60] drm/nouveau/gsp: move firmware loading to GPU-specific
 code
Date: Wed, 30 Apr 2025 09:38:38 +1000
Message-ID: <20250429233929.24363-11-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: bb30c17a-59db-46f2-2e0e-08dd87772a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tQNtNDMbh+oWqZsolQVEsehtsQRL/xAj5pAsKCwMvpkdaA3ZWJb2Ko3KR8Eg?=
 =?us-ascii?Q?mVFzUl/RV/eZhZGE0m6zGyXwNbOPDP2F9HlITGlq5aM2w61ThJsNwHfaJTjK?=
 =?us-ascii?Q?MExlpB3VvodmtmJcCcZwwogq3PneMBbDlDtX0q3GNubD1OJLqLXcbEMwyj2Q?=
 =?us-ascii?Q?hjHTQkvTxzrVVqSJMXcMgyKfOl4Nf8lKldax83kzj6hP4haty1s09yRrMrah?=
 =?us-ascii?Q?dXF5JOqCngz/aSReV+DlIfLPJQ9XdpkRcc0SdRVU2PpYAieL9eGa5wrXdIPB?=
 =?us-ascii?Q?93IWzv9c6Ubg6zPz8qtw2toJ02ldyt1xosFA1qkMr2ducJ0NbveYxMi8u3Co?=
 =?us-ascii?Q?jozBXBywZaYqazLHiXUWUFKqnnuhrjTrfnY+6PCuOURl7r0wu7hP2vT6LXwv?=
 =?us-ascii?Q?LsWvMWIm3bURo00QjES6h3VXSD01wlKqD130ukU6qgvB2PwXLfTND4R94JGP?=
 =?us-ascii?Q?6raYSVqZra8gI+DW70U7gTbuLhVh7oD2hETJecP9NxPTgW2vgndR/VAcumpe?=
 =?us-ascii?Q?3ye+SvF2r9jx57dPChxX/OWji2jZk8aFrioOPXQ7LT0BZ28EyLUgW7BvXPie?=
 =?us-ascii?Q?GmqfTtd0NGSGOIQd1TZb6z7CtW4/oy9c0fbLoW+DIeZBap8eq5oVdsKsxK1G?=
 =?us-ascii?Q?OkoH/nxqE8EviUuKXXyfUl42/tYUoXMj7N/5+Kx6AOS9FsudA0w+1E3rG03W?=
 =?us-ascii?Q?L0j98MKFU9dvDmcYMgh4rF49NGizRW/PlkGhU4XB1FSpD/PXlX4vOePbEhtp?=
 =?us-ascii?Q?HHXgtxS07hErIKaNC2oCbVVZtg5Q0ePzrHi+5kYXn+ThvARKg7i9U1tPKbdA?=
 =?us-ascii?Q?CuV+6+UkcEBQjLBvbNh6QKch++lJNguM2vqlh2rOdbvXcJyGwiCp+r5nh1rx?=
 =?us-ascii?Q?5DramSg5RejIf6SK8qfcg9ps80nCnRM1h/XFe4wvJh4a7gZhncu9xJeDsFQL?=
 =?us-ascii?Q?lmUQDiljoixR3m131TfbUPbznATlRvZqpldkZUSDPAc/gOcJb+VCE1qF+IDY?=
 =?us-ascii?Q?kXWnN3qPPzStR6EQJial2Y+MQc9daoen1y3WOa8eZZz06heM+hdsUccZ7ZVm?=
 =?us-ascii?Q?CnTKzjSJbcIrPH0Z+hGV1jb1NClmgI3kshmJ+bk9Zr+APXnTqoUnXLZeRL4A?=
 =?us-ascii?Q?pNqalIbtpdO1cltd47MyIA3eOxTneE78JMQtmSo+h+7RlU9bt7KE16PM8qg0?=
 =?us-ascii?Q?gzugyUJXHW9Lop1CnQ34biBxwPLmbzSH6tTmZ+DvIxZZiGQMS7wpzIw9wq5k?=
 =?us-ascii?Q?4Qg0CsZRgo6S+vK2KlcZAg9B9KBVdVKXdZQest0lh8keaD8vaX0WV7N/Ts1I?=
 =?us-ascii?Q?4cPcWvaPGc2sHGo7yYkx/iLgu1JBprEP/DLKG373lS7l+wCG/s90BWCDps9x?=
 =?us-ascii?Q?vxTypc6l3UDtyVHZmBsp0l73Rb+laLYrYQ7xTQrOcRrYk1+njRm+T76r8nRa?=
 =?us-ascii?Q?wW8kgsj7E1k4zy0oOWzqoyZ7ziISbEb0L4VvDFWIfn3rlYqbuIXjcDKkxM80?=
 =?us-ascii?Q?WTzeTshxMdssfWU6at29Z62L90FPIGZneeQI?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:03.6974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb30c17a-59db-46f2-2e0e-08dd87772a55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644
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

