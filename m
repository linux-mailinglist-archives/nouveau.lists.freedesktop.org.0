Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F439897EB
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273810E399;
	Sun, 29 Sep 2024 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MwHI4zx/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E226D10E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4gxBPmurH3+yUrAI0KGU7gNKfdSeXxV3YSjaCLIRJ2/ZqE94x0bQ4Up16VrMkU2/JPterCzSPuh+x5dUl5tt0ViBxOLWByKcB7AvNc517vIqOOxpkMwhnZwYSFCRS0ekyxs7pOjsvtrWFg601zpSk6+YNLGVxi1vY4rnNXjc1f4P3d5X3lVWVmiWuqUUJNZqBbpj80LE71FGh5znXFHOffIMqL9kYuSIIhvrIuzvKEeDl1GWBhkyanAXjflG/o2z7Yd/oe27ehb4hWTDuvy8NgpV0vJzhhOeGTis/ha3EkFPSxa0sOZJe4jfgoTNxfOMYUpSU0xgEnnEMFxjdBVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=wIAv/2RtjcUc3SFD+kP//GcxGYGkUTaFZUfKbiyC1eC2M2KAzgaxqGUyoujrtlnlOzYtKfrUgp5LqjdbX94gC6aQ/9UoO5QH/5jGeaaujNvZBFvKCQRT5zQxsupe0gm76RHERaPdSZnLcIi3IsqJuRWVGE+t9KPcO64BZDX4eZkF/XM8sDlxNNBoVt1o5NhAK6ItLxALQdLCxLGwCf0uag/2SlOaCCGsKE9rhKRMx9csgGh05yfxbspVRKTfxdnFurXNSYTJm7JbWHQbM1P95axvGhssRYklNtzgTo+dtzgkp0pJZ8max7mkumXlpRTtak3JljYY8e+k8tb2y1+CnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=MwHI4zx/cbYyo8bzN8f0OztyjOLPmlyhX9io8Zogt+B2lZy6qEoqB6+hmiJHa6xsky076eJaXefyyuSLpCfPQ+AZOjyN1inUR986RW2cHourWTLzYt/keYaZoH3WJ7CAj6V16URR/VVe++jakKjvqRZ5GizIdGt1uDZN4pBCavOn5YT3fdcpemPgLk4vgWJT5ulc28V1pb28y/oltdnvGnyPONtYxUaCu4c7yYtY4SQAyHeTN0mcCMYvOdJFbHxL9U+7kvZcnsxxVIznJy6fqMRv9mVM3ZH5JqNI+03MExI1ozKgid8NDj32FZMqQqsSRCVXsNeASpVRQN9eC0R5Ww==
Received: from CH5P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::24)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sun, 29 Sep
 2024 12:31:47 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::8e) by CH5P221CA0008.outlook.office365.com
 (2603:10b6:610:1f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 12:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:31:47 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:34 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:33 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:31:32 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <apopple@nvidia.com>,
 <bskeggs@nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Date: Sun, 29 Sep 2024 15:30:52 +0300
Message-ID: <20240929123053.441096-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929123053.441096-1-ymaman@nvidia.com>
References: <20240929123053.441096-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc70173-6572-4ea2-7d15-08dce082af86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fVlqhtakxu1n1F3dUCwZaTAQg4VGjnYmwFUIEcMWLmg/C4+IkICx8EUw0uN0?=
 =?us-ascii?Q?5nC0PcBDDkLbxhL/J/szjWiBPU5tqe23MMoRPASt9ZwYOFw46FQJdJB9YvZK?=
 =?us-ascii?Q?tvhX81LK9uj84Pa8lKWgLhWdFo5VpP6rqveg49P0Wyo9sES7PAL3Ms5LNQns?=
 =?us-ascii?Q?+re3oUIIoe4mMGO2U1dO+f9nSmXK1vaJdytHtLYrJ2cDV6RI/EcwGpM4MxFz?=
 =?us-ascii?Q?A0L35nXPEwVEmc0tDnzIzWUlHAGzZ6gxozp37qa0VbjBab1KrluonhHluezH?=
 =?us-ascii?Q?w0glpAbjksqFMRyFK1yPFa8m9mDrsu1sFKoCAUSS+MJdXmnGivpZx9xMbaca?=
 =?us-ascii?Q?Iidx3XpdfuOHT0nLxSxB4gOWkpYgfE40jCgly+bY8WfwRIOS43HWRhGNmfcU?=
 =?us-ascii?Q?vdTbCnwmWQ6dNS6toMu96au/J2WyRTpWqRthYL0WFKQgH2KsIoSn/kyykcKE?=
 =?us-ascii?Q?UDzO/9VGQOUPIkVwivX7rpe7EbjhcwtGocu7L4D2bTDcZ2969BEJniclL6K+?=
 =?us-ascii?Q?nrzTLPG4lqYSi4in8EpUxyTM/L0TjTUrdbKpJL5MAFIe46bZTnbDqbg/tdOa?=
 =?us-ascii?Q?ztdedpZ5fuy/B2bF5FXTSa94PIdV5IZ0zvjepTjwzrZNoLDMPYqDSqvneo8s?=
 =?us-ascii?Q?ktlTNxYPb/LrxsIvCQUoz7u1/aOOja81AOAikelDbtIfr8TIP6+mWGZMuTqe?=
 =?us-ascii?Q?gR/KxIZvRG8+IouzSn+zXt/5DWFpybemwowWOvY96hP9vb+On8Qf617GH35K?=
 =?us-ascii?Q?PRRxH9rjcKWI4irsZFmctrIoV306OtQcnPVLL3gOOqLTnoHb519DWr7xK2gD?=
 =?us-ascii?Q?3/HAcUklK37dFQ56W1cTNTXqutm7mXk/WnUpbVzaqO/j2SwSpVAg+Iz91o0v?=
 =?us-ascii?Q?B9PFsGFgBjTid1Ghrq8/hAlhNu/mzee2u4CR90drmb3s0QhNmxaldOvZuplh?=
 =?us-ascii?Q?lmDuFCUDElOA2dHEFhu6wZ6Wh0a6kYBA3POCHxSS404AmFOhuJHkx5dXacdB?=
 =?us-ascii?Q?IVqsv0sNmLy4cjmroL16KWottC+Ly+rUzL3kbpCzVqZ9lwuqDI9sAaGZfQ+4?=
 =?us-ascii?Q?7N0l3ps519V9w8aEcpQYygONTW2+NhbuVLrz5FfAk5DLRBTfie4GxLxN2Sz4?=
 =?us-ascii?Q?oIU5hvOWxAHwo2WX4uJDfB7Wz2ZQQN5SM8P8c2HX+iiipqvPH7iy+e7vb35T?=
 =?us-ascii?Q?WZUYdsIpPik26dmhJ5kIajGyh/Qhlf1Ylr5OT6MfQ+mDD7jHtlUWkRV2u5PA?=
 =?us-ascii?Q?BHD/5BBpSLQ8SMofeNEIWydcRoPx1mTFJx+H1aeS9Kb63tKaMLz9YSwuBFfc?=
 =?us-ascii?Q?w9vBee81q+7cVVTfFga8ExphzB1XQ16jGz3yA5ysoSnWMnAmhbIBVtDlR0Z+?=
 =?us-ascii?Q?BaaD0RpNLEnnRUeDBFxzGPAIdR9D58pl905QRmsNB6Y88XOQHLbRO0x3b1T7?=
 =?us-ascii?Q?EsuRC42lQGmbbEEQ3URRqdVsjstB86It?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:31:47.2777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc70173-6572-4ea2-7d15-08dce082af86
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5cc
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

