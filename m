Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F9ABA6F9
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAC10E070;
	Sat, 17 May 2025 00:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gqmazRTl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D92310E0ED
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xV+QapvBu+anXNJGV1++9/W6k0/uXhm9bftW2iUAyprV30JudN6PTd0Ns6ZzU7D5BYw+pZfxTBzI9s/TtJaC7285Q7nK3t3L2SXTDVYVPQW4bi3deJkGbuTVk0Mg41JPE5sxXG0tdc45niKA2PCbmSoqsDzkSd56d5NwRCA+Y9lDm0q0kc6EqAIPsH2sKAuAb5lYP29r3DbmaoTR0dZ/zv7AB80qjtMZJbnQglYfT9F0NbE9nBX4DPfMDaR9DNZBknWy6QGdnKQPMXFP2cMT7oOeQwIwZo9+y+73FfETc456Lva/WCt0i3HfThOOSOyBEkwygXACmXAD12v7iirgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFQYYClua75TJopiXEZ41vbN1I3mmQtxRLz06Tr94Dg=;
 b=V1ibxTbG8r6PWiCdqkA0GaFebrIJ9UQscBkxrdF6/bJcjyvS59DDB5UYyHBWXJ0R4aVDxnR0ias1az9x0bjRvkSQ3SQ3ZSDPBMGnZlpVM9GEKZDLvCwAybP5ljax2CV7Q9Nl2gy2XnGxw3wCEXjv2WvR4bSj3O3tEH1jSHABJCQGsF7rMtJCvpJGI/zmb0OBu7x4Lwn4MJiCBYIFYyv4EHPfogK73qHMjx5o40TS8G0NSev0HIImFpYPcJ2WRdrP16vA6vcWICv8EOnNf3jdKet51iYoQk5Ayfij3KiF2eFJF8mgjri9XZWr4p7RMepTW/5Cfq6cf8Odp6XE54EKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFQYYClua75TJopiXEZ41vbN1I3mmQtxRLz06Tr94Dg=;
 b=gqmazRTlFlVHr4qwxcsq/9pUh39SxhFpIFBmV22j+UdChiwKD6VB1sThd0ZDzhP2exESriJaJBFC7Wu6ySUS1J6NyoW12nGcfaNDJN9tJI2ZDJHmp2xVOBUIZPA4joVZ20Ps08vcSXq4trkl5DeJWI2400VH9OhWBMD6mF7AReoG9GWLPmioOnxH+2oXqsbjH7dg9MfpijehwPYWcIYZS1P3mNtz4G6x6SbDzFslItGES2U6fkuRN/p2eyhASH/qPRLSQiS3jn2/wcM3YleKxpM3TdXFTmqvO+v8qOCBmRguR69Ovpd+AAtnrYxYm//ryi513V8Yk+q02uy9Z05Lxg==
Received: from SJ0PR03CA0278.namprd03.prod.outlook.com (2603:10b6:a03:39e::13)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:10:27 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::71) by SJ0PR03CA0278.outlook.office365.com
 (2603:10b6:a03:39e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sat,
 17 May 2025 00:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:14 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 04/62] drm/nouveau/nvenc: bump max instances to 4
Date: Sat, 17 May 2025 10:08:56 +1000
Message-ID: <20250517000954.35691-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc3bb30-53c3-4a8b-f0bd-08dd94d73a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q5hvVFiR9zBh0peQYXOgCLpbSt+Roy5FisUR6ZNCRdynKZCl7cC830KehDNb?=
 =?us-ascii?Q?A7mDwtrvtP35YC+JZRSZXpdQQ9cipn8bIQ0uByrlV7QlsrtB89iGaM4zAWU8?=
 =?us-ascii?Q?tx13XYpC2lhtTC3DjqR1ci/aHN8W1ypv0pgNqTy7c+RveMdXvBacnq1JqL3K?=
 =?us-ascii?Q?pzJ3RA6T/QtOAy6W2q7j8PU54Y7uoEb5McjQhbmOvGpAmxKRI67+bFW3QqAv?=
 =?us-ascii?Q?vaXupBfDIH6+lh2T975uFx8SjbMDRRgmbKZjFri5/aZx3AVxta/+dsaZWXr5?=
 =?us-ascii?Q?Q7HMiUFoPYoI2inp6xlw8Ua8gn+IVfGpq91QH7BSOtaFkoxXaOAnNg7bpjE7?=
 =?us-ascii?Q?s7P9lacsDpF+AcOHrqC70sFERBIuGusVUp1H2UX2YTO0m81cJgUge3b/biag?=
 =?us-ascii?Q?WgkDY3SRRpYcksxbjYJvPoNC4D+CSxGVQ8rRSiy37ilBI6KTtkrW4ja59TDM?=
 =?us-ascii?Q?iUw8YfvbaeNp+eZl/s4wZjri6rKqmzPdJPtlhu8XTU2Ie7OkS7zLVZjKIv7T?=
 =?us-ascii?Q?RrKh5RqNxVTZwEKHI5sIAm6MnzznjmKN/9xLJF3W0HACQtpH9B9fBgTUVBOr?=
 =?us-ascii?Q?OAEwLcPgjeeoODqCkA3gl5ZF4jwJ54n6XR1NdaZzPfopq9E8PNlZSKtRetRB?=
 =?us-ascii?Q?b9Pa8EPb2dcNbsUWEVzlhL58myAsqiVzExJdsTB1PUMI0rdkumOtUNCadps5?=
 =?us-ascii?Q?/k0PfwD/c2VG0jTcTxgp8A3OaqXVJdM7UWpZtjAHqVXQWD0OQ2mOYvczXsyu?=
 =?us-ascii?Q?5Na7tvM0ZI76HrYzxOtl35c/lNI0kq2vu+LyisTSmMctk784jWdRNC5rPFhd?=
 =?us-ascii?Q?cC4ZYaOC55vupqpLwq9Jdclg9Ia4ftaQ5NbirQLVxDFVY39njnqUqvoisvnS?=
 =?us-ascii?Q?/BiAuTT6pYqx/p5wXxmR4NI0NXEt/scFK2lZkNJg7fBozH1HVhSYc978WjUK?=
 =?us-ascii?Q?iDwY6ASSSG9hlzLJpvdmz08AWBoJF9I0MK8VKNG+WjrZKQj9JBTUTA1SoOhj?=
 =?us-ascii?Q?o+0cDuo1/aqij/CwI31TObdcHiv3vVZ9nxzAN1AC9uBBR2QFIpiccEapm2kp?=
 =?us-ascii?Q?vRFS+pO9QRKnERNsot4HSSo2LutEYk4/AMSHK5Npv4UFD0P+moR6LasPD2Fy?=
 =?us-ascii?Q?D9RI6h5dBQeuVYjCQvXT8u3/6eZ654zcn/nXR43kK58VgifP+jjJzXoRfx7A?=
 =?us-ascii?Q?ywdj1JMDjZ8I+5PVaDe4AuRFSEmrrbQjT85rvUgaP0JycbP3aIp7E0A+5Qdt?=
 =?us-ascii?Q?cyyoCVS6yRfe1g8Fz90lVjMXnrAEakPpAEI6bTDK7KwA8wFouu5I2VsOrTug?=
 =?us-ascii?Q?oufQl3eGAPLDaWUxTEgRn445wiL5pUW9h4PrxzjiM0j4N8hleI932gRk25IJ?=
 =?us-ascii?Q?4EmljJYUMnIQ4zhGDSHPrxQ+m9okob9TzlqRuZ/5nANdxAgcpjr4cSQ8MSrz?=
 =?us-ascii?Q?RX836cC2vno64mR3ji6xlxW7KK27hxbo8yhw3LptEhBiTLnoEickdx4MEqIi?=
 =?us-ascii?Q?oWcWkxnLFC4j/NhWn4rf7USuHy9DrOouJukZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:27.1699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc3bb30-53c3-4a8b-f0bd-08dd94d73a39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
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

570.86.16 supports more NVENC instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 4e027c5b00c3..33e3bc519b9b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -43,7 +43,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPDEC  , struct nvkm_engine  ,   mspdec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct nvkm_engine  ,    msppp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
-NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
+NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 4)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
-- 
2.49.0

