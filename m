Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1C8A78D1
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97637112F4C;
	Tue, 16 Apr 2024 23:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="unO5TFz0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF734112F4E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emr7WnUUAa21keClV1/bWSp+g5k8SDoDxa/K07CY5rjs8XKRDiI/BRxRtsga37g3to/cjtPVVyaZIdsVD7grdC74faImI9wWsXWCmosbwnUw5lhaIlJfRQIIm0Z11UGDoUZtAxo8anZRgwRot7c0xZ02hjkGIZBGgvVsXsTVrnnrzqA+hNs9rn2lBUlNikzLyATvTLJfWQCtTo8I6eP+LTQ1rxwy01gw9o1nxFEMT8s8jGCXD3I5lBGchZeq5CurTFZy4P8D3UslRc6VjnEvkBsHt4iUcH3BY0wsC6gRjxJIFizw8cpfVRspW02MwbnTSwh0HvtFp6Tr+1QgxPj59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqVsJJvQeMl8bJ2HXLh2svx0lIWrb45TCCz5ewqsr5Y=;
 b=Dur1k3St46/MBRi67Qgg3kNzRo9AX2MEF0Jy3/InsZiWq9qZWmrxMlFLC+Rkx0Weri+p3gMTPcI8WIem3Pfotuqky+PyKJm3XylXg5HaFELhrWwgJD0nG4HGEPeShWDCqmvX8SPGbsmkuO+v7L1VvjqM+wqDLVngK6E4/sCAm0vj9a8Fbx2zufTKeYybLcavVGHmPAEsG2REVJhsPtVwhqJVux5ucB3fPfG4/fQV8MMCfajDJ6QxeVmegOJRLuKjoew1Y7i6Aa6ea1O/GgUkwu7RDOqB/c+DGEVEfLAout4ppFvkj0ChHwV65E5evnsbcr+QlOL0Vf8XaG7alLs8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqVsJJvQeMl8bJ2HXLh2svx0lIWrb45TCCz5ewqsr5Y=;
 b=unO5TFz0K6hxTKdHhCoeOLTwV3iQOuK6keyd/SwdPKgQUyydPEfhPp3W6hhN4DLzIYLe59uhI3UYe2MdSV7MGgaCV1ndPdvjjUv39Z8gG6cIGEGIso6ks39qKJ4N+Zhh2rG7xfjn0u9fClHZCvjeawC+fTfA26D8DJFcujb7wvs+G4gLHXinDV4dtgij4pwIsRQLMgg/E4l/GccYmsrmZ+vIlskbRkrr0ah4sL9glgvxIQFdLKrDKtLwKNmvvZIpJKH4PToLRwzPq7Z/szbHbzjptXAZSIcfXn1Op+reKzcS2oD6nkeO7wqeu780NS752eCLu4qgwrddCKLylsW4kQ==
Received: from BN9PR03CA0103.namprd03.prod.outlook.com (2603:10b6:408:fd::18)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:31 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::9b) by BN9PR03CA0103.outlook.office365.com
 (2603:10b6:408:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:15 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 039/156] drm/nouveau/nvkm: remove nvkm_client()
Date: Wed, 17 Apr 2024 09:38:05 +1000
Message-ID: <20240416234002.19509-40-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 60685b2e-92cc-4509-2055-08dc5e6ebe11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yiKqIOEAAtkWiS6kpwK7urGrt3EZ0osPUkgm1uWUc4WR53JtcUphkAGpAusS/z+rmdM23US9zTEqlPyzMO+/s0TiIwVuMDlHGQEVswlSkyd5l/YN0oVBO53EZkG1mVclCMxCBdEYLzl5wOgZfUVYV/AMSIIM8IrAah6lFYw89VQwGzYKyVmD4uf94sG2gspeZuGIGhXHmrT54yI7o29aZZCaMVHO611k1OWqm2P5pBNvOXXHfh/vHBcFUotLkE4+JQYLRl8BFeXxg8Xtrzr5ShP0yBMhydeE6HWJ6sX+6Ced6UTrDeHiLptRRQN0EglOYJCSp/s36wXsF2S7yU+5GEg/cYCcq+FVls191P4e1z5YfvTxafATTiUWvVVzh4aZTOkf9YwzILoEchFdHnNuWPrLL/Azzue9nOGIueuYdajZR4vpv4jmKWK2fUSG6UMgzMmQGummOG6NModnIOpOOKhvuYgRiZ0FoVrT2Yjz6aq08eNL+qEcBg8zhII0mkTHyIlmx8fo2hDr9TKsjtdNglogs/+KQ5rw97BX/zzD0EE4hJC7/8z5AGI/ufxMnjBqp32r0TSyWtJ1XV4bp4f6T8sBjdwce399q2NiVVewUn3mDa9Jh6FcWsapgloZAOZyir+jy2IOIjxPsWAP8h0di4FRcwImJeGyNDktHrdTH4tzCWMx0NpWrkupLhvtlZh9P2LJ1UBm+gPlomHFIHgFXed9nGeYNM47oBoHQeecyiDgrto68IcZQpzVagXRlGqu
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:30.6099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60685b2e-92cc-4509-2055-08dc5e6ebe11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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

- preparation for upcoming patches

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h | 1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 15f27fdd877a..4045b9f5ef4e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVKM_CLIENT_H__
 #define __NVKM_CLIENT_H__
-#define nvkm_client(p) container_of((p), struct nvkm_client, object)
 #include <core/object.h>
 
 struct nvkm_client {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index f73d58eb6de6..b127676078b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -93,7 +93,7 @@ nvkm_client_child_get(struct nvkm_object *object, int index,
 static void *
 nvkm_client_dtor(struct nvkm_object *object)
 {
-	return nvkm_client(object);
+	return container_of(object, struct nvkm_client, object);
 }
 
 static const struct nvkm_object_func
-- 
2.41.0

