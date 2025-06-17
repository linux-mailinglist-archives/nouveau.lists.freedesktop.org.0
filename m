Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F9ADC00E
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 06:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3C10E0CC;
	Tue, 17 Jun 2025 04:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4z0RRfh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA310E0CC
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 04:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkJm4fqcXXOgT3Q5++B1PBI6CgFN/tVvuMKwd5uuX/kauYDcN9RS2SxDc/NAjp8Wd7IrmOas40hDuV2MSUV7AFfeYAH3My8mNtuej199s4fCb3hKKlXRojcjCDO7H5HZY6daagNVr5KcZOrlSRdV64PJgjhjElwZIMqA8XjPjB+nmN+jdiizUlgpgLXDye2C+6tHPk9omebIU4vlolzZx4wJPdlhdPOh1gR5YsDdsS7V2XJkONDJ2tJswYgQWrEpKLoHkjeSuGv7RNchi2rthcO/wpYy5RPw0p7Cb7JHocYdzx4qE06ZNLojQeiXI5Brv903CR6wlFHM0krtEr/Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61GiV97qxJymJ+ixc/ya3OZmSbEccAp/CzKaRjd5/Xo=;
 b=xH9S8XIF9ymJJSfA8YSsOdmwlwAdXqjr+v96npfqSstVgWFwNckTI5ryvdmfjZB1FTkN0Q/h4AflyvgGrPQ7niSFtO7D7CmxQybRpU9tHfof80thJfr6Txtm1j4cYuJ8H4H9NW+zhVa6UUMLG0LSJGBHy4/0D2AriZYAk0WiMXrBuDDmmcosAETS1B+LyzBPjptGuFANhFYEvfdj2yxZc0Cx+Vv+TPmUoZGmYPrcT461w4ya+GKBnaOB1sTK4PZbUyvRtL4XehnKdL2FmoJ6pL2kYYQKODBjrUc8XJyVMegBiBjMNZSag3UwtCHE9yazf7pMOuHwUBvnigHLG13WKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61GiV97qxJymJ+ixc/ya3OZmSbEccAp/CzKaRjd5/Xo=;
 b=X4z0RRfhRdToDJrz0/4LfHDSZxoX8Bs7ePfWE01MK9OwyWnpYs4uJwGLQEnzjMhoc7tYUclxB3BPu6fqtXPMNlmw9jtiKoFymRs6shnDYsich4JvtGB526m1xJ4bhJIJEmSHDZ5QrzeazSNQHyaQh8O/KEdYdY6sUwCQ7RPFcOpjMEbQmNd0s5AswJvKRqfH7I9A+EoaAsYIOqHRA1hMX315bUIuuZmW2QpGXko4IfM8XR1SSXwg4YmpiEsunLq0QqtHmxCeK4PNlx3pd5UTPtewCSQELLqWgnZyZi5VZKyoF8FRmxzlbh68+30Cv2w+3g6aMaczhYddXuMlhripXg==
Received: from MN0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::22)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:01:21 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::8e) by MN0P220CA0005.outlook.office365.com
 (2603:10b6:208:52e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Tue,
 17 Jun 2025 04:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:01:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Jun
 2025 21:01:03 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 16 Jun 2025 21:01:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/gsp: fix potential leak of memory used during
 acpi init
Date: Tue, 17 Jun 2025 14:00:36 +1000
Message-ID: <20250617040036.2932-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bb9a1d-53a4-4271-225d-08ddad539e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E4KKv/0srcO1kPJGM0x5pwMbZOcKxtuTXhspBINoXWJ3ZSRYAHsXk5ll6naC?=
 =?us-ascii?Q?8yPpADTEQ5St8ilLEXG3sfe+qshmq71WAXuxbd3ncIFZiqWrgf06DdAg4HkH?=
 =?us-ascii?Q?3keA3RDBZH7PnOSKck5iTV4MMkVj6jDLVRPbZMEk++rjTe436EwW7nEXwTqc?=
 =?us-ascii?Q?ZgHXZC0WI56dOKN/06cjobGmaNDImrS/eOskTN3x2ACrqAKu/3rPPEkAszYO?=
 =?us-ascii?Q?pe/zIuIxhMAuGFC252LE8/2mks4cKa6U40cNZjRFdm9u2vhUmTsxlChVkAWm?=
 =?us-ascii?Q?VDzc8Rv5Y1tR87j280d4u27K94LDDyD19SfPb7EypTqd+y+9ljBjx99t4tWR?=
 =?us-ascii?Q?ejv5lufFk9njYtnhz6LOtL6WYSwiZc+1sYCl0yKNq0RhpN/CxRwZKvARwfLr?=
 =?us-ascii?Q?I6k4Z7NnmYL6uR6Md7P1ByjW0GMPrlXvl/Yrf3742fx5bKSS9CHThS5VyUFR?=
 =?us-ascii?Q?8Vm/6sntTsi4WYLp4PZOcsxV4RS2NJNNMT9Gev1SLU4GxboW8SDYDO6zboL+?=
 =?us-ascii?Q?NfeOA2aV6eaMCu5vSXn2M61veN+Kql2IuF3WQbJCT6rBh4bbVfuBqUEOeyWF?=
 =?us-ascii?Q?dG2TohOAQpx+c7/hPg5dOcLIKuh22TBr0OHfnjI0tWAeo9+vWY16zouB8xaZ?=
 =?us-ascii?Q?sKaHPzh4ePTjkjQd8IU9vS4rW8j7lthkbBgpF7+JoSM31eTheZW33seu668x?=
 =?us-ascii?Q?B/RQwIbxfXpxz6vAxboelzb/ZXewjjJbxZtyCqCnwgNHILxcRdo5eS13n6W3?=
 =?us-ascii?Q?KDdnEK5pGT9UKB4tvfQV1XSLGld3LisynrHVzbzxfUYjzgDjMNOWT//hVprJ?=
 =?us-ascii?Q?Lzu2TDN1NE0vqAnYfZoRniJg1NIjsHMkmtA9kCnkLJzSucp+JA6S+lAW7JFC?=
 =?us-ascii?Q?KMg5bKZGpV1FKra+shurVZhsFsnrt9/YL0s9NelHgzKzcWbz6VPbQATy3MtJ?=
 =?us-ascii?Q?9pdlXk12zZaCUTahtbPXaqBfiPh/kXmyJu6q8t5Sxvu7zON/Ajs2i7qQpc7I?=
 =?us-ascii?Q?75zCDdPZgWscn4pfVp4bZ8SAde7KOYO7t2oGMj2H9Pc8Tmb09WUyry29Y/3y?=
 =?us-ascii?Q?spuhaLp49jjptbfdZqiIbrKRfEqUdP7O77rmJ70uS8uc2KHCJR89gboQDR11?=
 =?us-ascii?Q?5AXnbaY9yRvSxSJwJXuwSQrxeN2tQH0v7gLpyD7aCkPCHMA6Vpj5y0ALQtqq?=
 =?us-ascii?Q?JKaR9ELu5aamcPcnrCz98WKMYRi0g9CVqagFV/HOLmQcfcAr9zq9px90Pd/H?=
 =?us-ascii?Q?TzsUXwnYbrwV5BtLwWVPpdt3mFycQaFXQc1pl15ELMeBGboLfBJNjtJXGxiy?=
 =?us-ascii?Q?SHfm8PY0XQoyJ+TeENJlrhqJDCpowvsCC6WOUWEbKlua4RdruVMiqy/UOmLb?=
 =?us-ascii?Q?GxZcUKGpV1ouushKMeijppIjQg2ukuE7kRIKlWvKbFcQuLbxB+mhvsSA83Lq?=
 =?us-ascii?Q?ftZrPWsJHo9AO/JloniieZYa/SeBAmwG7sY0XtksJOYmNpafLUiEEp/j0B3j?=
 =?us-ascii?Q?h6hC/KvdJYx8dqvbvU8LZpFEfcdxzh9KRhiZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:01:20.5007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bb9a1d-53a4-4271-225d-08ddad539e5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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

If any of the ACPI calls fail, memory allocated for the input buffer
would be leaked.  Fix failure paths to free allocated memory.

Also add checks to ensure the allocations succeeded in the first place.

Reported-by: Danilo Krummrich <dakr@kernel.org>
Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index baf42339f93e..b098a7555fde 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -719,7 +719,6 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DATA *caps)
 	union acpi_object argv4 = {
 		.buffer.type    = ACPI_TYPE_BUFFER,
 		.buffer.length  = 4,
-		.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
 	}, *obj;
 
 	caps->status = 0xffff;
@@ -727,17 +726,22 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DATA *caps)
 	if (!acpi_check_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, BIT_ULL(0x1a)))
 		return;
 
+	argv4.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL);
+	if (!argv4.buffer.pointer)
+		return;
+
 	obj = acpi_evaluate_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, 0x1a, &argv4);
 	if (!obj)
-		return;
+		goto done;
 
 	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
 	    WARN_ON(obj->buffer.length != 4))
-		return;
+		goto done;
 
 	caps->status = 0;
 	caps->optimusCaps = *(u32 *)obj->buffer.pointer;
 
+done:
 	ACPI_FREE(obj);
 
 	kfree(argv4.buffer.pointer);
@@ -754,24 +758,28 @@ r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *jt)
 	union acpi_object argv4 = {
 		.buffer.type    = ACPI_TYPE_BUFFER,
 		.buffer.length  = sizeof(caps),
-		.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
 	}, *obj;
 
 	jt->status = 0xffff;
 
+	argv4.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL);
+	if (!argv4.buffer.pointer)
+		return;
+
 	obj = acpi_evaluate_dsm(handle, &JT_DSM_GUID, JT_DSM_REV, 0x1, &argv4);
 	if (!obj)
-		return;
+		goto done;
 
 	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
 	    WARN_ON(obj->buffer.length != 4))
-		return;
+		goto done;
 
 	jt->status = 0;
 	jt->jtCaps = *(u32 *)obj->buffer.pointer;
 	jt->jtRevId = (jt->jtCaps & 0xfff00000) >> 20;
 	jt->bSBIOSCaps = 0;
 
+done:
 	ACPI_FREE(obj);
 
 	kfree(argv4.buffer.pointer);
-- 
2.49.0

