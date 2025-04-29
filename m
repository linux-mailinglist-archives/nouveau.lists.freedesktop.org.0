Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898BAA3C84
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A3710E57F;
	Tue, 29 Apr 2025 23:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sacfo0dc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2710E56A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfZ5XZCagEmmIVz+VTVgu6ILL/FRvTAu3bC9RRR22wuqMIleUyyyRv2AjxJUfM/PqyPBT5icjzSaJqsi0oPQgD3WYGJahcYRCik6m0k22ZaOrK++brPtsIIv3vTNnXqXWkB4yAD0cJFOtSfCSUV9W610tUTtbukE+LG0B7ACgYPiqiwamyLtUnHGRaB1RO8nkJucBV/x15YcSRx60tvYDrSRCFn+Yd8RyWqQHc5rduawuh145Vd82JZuSJuOcLlAUmhcKSAQu+L7O20MqbiPl08xA9+GWdvh+n80g+zGQKuoYiH31JYtfUdaFmPlglIA4PFKsKsx4ODbEZsItfpM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLO1315ejplHCC/9l+fhdojjTIVFT19xyOnROfj6MzQ=;
 b=El2ffQvjB1IhnAYW2vHkGgU6s6D+tei2rfDKLT0lCuiBBY6P1HsnCbIWy2v7sK5uIwTEcVHpPSWALJCf9YAFrB2p4lNpPTWRYTLpjvAUHkOwOhCGqFmYgAGhl07lhS708hxWOxFGnh/XGVBPHe+33FDuGsssijUT6XpxSk4FJlyV05qqb8ri0i42Mu67gvh/r6GkIiL5BvkXQpLXkZUlAg+XfGY1lnxBsPlvsoQFrt0KC7Kr46fex1zCIQyIR9o3clDjJAdvSixA5++W8OUdZoC9pA6VPD06Vy4eXCdkrlsM9dHrex5HPOSdTAlmGVYN4b9O8FvtVizSRqmny8+hgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLO1315ejplHCC/9l+fhdojjTIVFT19xyOnROfj6MzQ=;
 b=Sacfo0dcazoyYIYtTT34nxYtPk8xaBIyBNaluUcqnMIvOWXygg/J++7qd/tNZbb33yCCUHQEV3hJttbl31BnnsTQ28hsZzjq+vdNBKpZPPNolS01+/bRSObP6TrA+qMsiHI5T/R87u5DMcsMAOoZvLEw2+Y26PHWfPp3HEOCk2B7GRchNPKBoFivC4S24X2CwvwLQq0kvkdeWIrhFly97OZipxH0NF3jXmUDAY55mIkyJOcP9c1TEp/3afsPZuu/CQoyLLMMolomvjSAjtOIa3Y0qGA6HemQEiWxV+04A1PerdxTyw3iemJhGDMiVUeNHr6ItMvF3pcV0YQtORKYlw==
Received: from SJ0PR03CA0141.namprd03.prod.outlook.com (2603:10b6:a03:33c::26)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:15 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::80) by SJ0PR03CA0141.outlook.office365.com
 (2603:10b6:a03:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:02 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:01 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 18/60] drm/nouveau/gsp: add common code for engines/engine
 objects
Date: Wed, 30 Apr 2025 09:38:46 +1000
Message-ID: <20250429233929.24363-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd1dfc0-f86e-4b07-0cfa-08dd87773128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dvog+B+TpT4QUY6NTHLn/gQ1kxg0ue5v785QCWZgJ2AkkxXrdZYFmTyCUq3M?=
 =?us-ascii?Q?tYolIiEqb23CJGCiM+rCeJ0jBQTo8BC+TZKoWCrB4H3ruud0UiNtQxYKJD0R?=
 =?us-ascii?Q?NpAQ3GWcvZaRNBoYUTe2ZxUWad4IC8R8BGMh78afyh90oblA+LB/R11cwMjG?=
 =?us-ascii?Q?QQKfRJ9KT5AefejqJFSajtIrco04HLy9jyJokas8JrIl+ZXeMj9/zb+gWNoK?=
 =?us-ascii?Q?8jN0n6mimG/FgRO0seZ+b8+jekbDJnpyVbCOly+T/sP7YOhQQwhQ5qZJNePf?=
 =?us-ascii?Q?1E/f8C7AGnAsjblx4kSeGPsXOc3chl77Bo20vN4IroAtYkNv6+4aU0fxZEWZ?=
 =?us-ascii?Q?pOfOM0uMxsScuhMhDFCtqIGqqeitSg4khpCKcPMe7TLzlTEXurU8CMONVHJY?=
 =?us-ascii?Q?M+ekv4BXq+H1+lJjAvlUKgXDJFG+qxUsHQ1Q/NwC3HviJXVmdFhWNVCcQlNM?=
 =?us-ascii?Q?GbkjNsk6I6In8ck+eBIc+wgjR20Xtp3eqgssjzIicbJUe8D4QoB9kzFBeyxw?=
 =?us-ascii?Q?jzzu6Q2aj9mN1mmj0+PxvU1xF9miXZBbWKwBlP38T+nPdLVZuYwE4hji1aWq?=
 =?us-ascii?Q?wiz133C5b+iP1la3/luJbHwBByi1biqiWk4AkCSI6Nyk+rAAf5t7E8Ld9lRo?=
 =?us-ascii?Q?p7bE/04/f5IGJL7CXe3FPpLiI074/zR3VFp3NnXlKRuGvTOGYcy7zm+nd/wy?=
 =?us-ascii?Q?NQNF6r03BpvZf32anKa8UrmqQmJEEFjsUAWjzgzwKAAV5gDLlaLuJ+4XaZfs?=
 =?us-ascii?Q?ri9sz51bZsvRyQQ8KJt4zq/bTsjStUbYgf8IB1lohFLk0tRmkCkR7PZDSzzr?=
 =?us-ascii?Q?YxQTiyjqAwUQfcYIUOJIG3RwjEvEA8d6rN/3iybru5azPIEBAavL9DHmScbP?=
 =?us-ascii?Q?vZPXtK/OutEXLhnG9IH1TGTXRft2AZwtNSYBF5l8tIlX8PxOBoPHrb11dcXS?=
 =?us-ascii?Q?3DIePddjUO0hqsc3p2y0hoAzMLioOregA2VSxqESpyB4G3YPgVMaFRD6O1I5?=
 =?us-ascii?Q?SQR3QSgp9IW4jt6PiILDG2s8iXP2jNrG6QnIB9jviWgfsKyirV0jqQDMzItc?=
 =?us-ascii?Q?AgMVhs2NHFuHXtBVjsdAiQqZWhVbSob03bg7/OwS8fucLLqL459y+WB1HYkd?=
 =?us-ascii?Q?WCUyD9qvqXPXdLDH4SAUTtxI0rK+dth+q8xzmfqhn8DeL0nmaiB/kcw/Ekmu?=
 =?us-ascii?Q?mYl4k0qp91MyQcwsKIVSwjgveoPKV2t7bexeFY9RG0cGRCm0XFB3+3WLA7ty?=
 =?us-ascii?Q?d+uiVZwUSYV3neUHOO66pm8v3hfj8Fy3y2ltFJtLfufMKtSi6trKgoPXdxgj?=
 =?us-ascii?Q?/hyrNBFmC+6xYPJ0pKeF+SF06C+y2zL5CrzejxuqlZtli4VECbtz4wQPjxxv?=
 =?us-ascii?Q?xTt9AR6X/S1AJtnXVBVoevwA8gAS4noTLkg6SPQEmJDbiVpxw5pfteBq9dxb?=
 =?us-ascii?Q?UfBkgpxcxp0Oma4JO7BI4OUTMs41crrZ8yEc7pIS9w82RZucqeUuCHj3C2dC?=
 =?us-ascii?Q?rozq06cHPppBV/8bCkOFxtjE1Imks2LklBHn?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:15.0709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd1dfc0-f86e-4b07-0cfa-08dd87773128
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693
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

With minimal to no direct HW programming required, most nvkm_engine
implementations are nearly identical when running on top of GSP-RM.

Add a common implementation of the boilerplate, and use nvkm_rm_gpu to
expose the correct class IDs.

As they're now handled by common code, and there's no support for them
prior to GSP-RM support - this deletes the GA100 NVDEC/NVJPG/OFA HALs,
the GA102 NVENC/OFA HALs, and the AD102 GR/NVDEC/NVENC/NVJPG/OFA HALs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   2 +
 .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |   1 -
 .../drm/nouveau/include/nvkm/engine/nvdec.h   |   2 -
 .../drm/nouveau/include/nvkm/engine/nvenc.h   |   2 -
 .../drm/nouveau/include/nvkm/engine/nvjpg.h   |   8 -
 .../gpu/drm/nouveau/include/nvkm/engine/ofa.h |   9 -
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   2 -
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/tu102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  38 ----
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   2 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild |   1 -
 .../gpu/drm/nouveau/nvkm/engine/gr/ad102.c    |  46 ----
 .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |   2 -
 .../gpu/drm/nouveau/nvkm/engine/gr/tu102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |   2 -
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c |  12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/priv.h  |   3 -
 .../gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c |  12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |   2 -
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvenc/priv.h  |   3 -
 .../gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c |  12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild  |   3 -
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h  |   8 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/Kbuild    |   4 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/ad102.c   |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga100.c   |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga102.c   |  44 ----
 .../gpu/drm/nouveau/nvkm/engine/ofa/priv.h    |   8 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |   4 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    |  11 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/engine.c   | 206 ++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/engine.h   |  20 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga100.c    |   9 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    |  11 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |  29 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c   |  73 +++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h   |  38 ++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c    |  50 +++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c    |  50 +++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c  |  81 +------
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  14 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  | 112 +---------
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c   |  84 +------
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c   |  84 +------
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c   |  81 +------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c |  80 +------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   5 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  15 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    |  10 +
 58 files changed, 607 insertions(+), 1050 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 824e052dcc25..71a2a53bff7f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -189,6 +189,7 @@
 
 #define TURING_A                                      /* cl9097.h */ 0x0000c597
 
+#define AMPERE_A                                                     0x0000c697
 #define AMPERE_B                                      /* cl9097.h */ 0x0000c797
 
 #define ADA_A                                         /* cl9097.h */ 0x0000c997
@@ -246,6 +247,7 @@
 #define PASCAL_COMPUTE_B                                             0x0000c1c0
 #define VOLTA_COMPUTE_A                                              0x0000c3c0
 #define TURING_COMPUTE_A                                             0x0000c5c0
+#define AMPERE_COMPUTE_A                                             0x0000c6c0
 #define AMPERE_COMPUTE_B                                             0x0000c7c0
 #define ADA_COMPUTE_A                                                0x0000c9c0
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
index 8145796ffc61..a2333cfe6955 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
@@ -55,5 +55,4 @@ int gp10b_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int gv100_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
 int tu102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
 int ga102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
-int ad102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
index 8d2e170883e1..ca83caa55157 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
@@ -13,7 +13,5 @@ struct nvkm_nvdec {
 
 int gm107_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 int tu102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
-int ga100_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 int ga102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
-int ad102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
index 018c58fc32ba..1f6eef13f872 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
@@ -13,6 +13,4 @@ struct nvkm_nvenc {
 
 int gm107_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
 int tu102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
-int ga102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
-int ad102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
deleted file mode 100644
index 80b7933a789e..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_NVJPG_H__
-#define __NVKM_NVJPG_H__
-#include <core/engine.h>
-
-int ga100_nvjpg_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
-int ad102_nvjpg_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
deleted file mode 100644
index e72e2115333b..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_OFA_H__
-#define __NVKM_OFA_H__
-#include <core/engine.h>
-
-int ga100_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
-int ga102_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
-int ad102_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
index 2e48b0816670..ddcf8782d6b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
@@ -17,8 +17,6 @@ include $(src)/nvkm/engine/msppp/Kbuild
 include $(src)/nvkm/engine/msvld/Kbuild
 include $(src)/nvkm/engine/nvenc/Kbuild
 include $(src)/nvkm/engine/nvdec/Kbuild
-include $(src)/nvkm/engine/nvjpg/Kbuild
-include $(src)/nvkm/engine/ofa/Kbuild
 include $(src)/nvkm/engine/sec/Kbuild
 include $(src)/nvkm/engine/sec2/Kbuild
 include $(src)/nvkm/engine/sw/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
index 9427a592bd16..1c0c60138706 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
@@ -90,7 +90,7 @@ ga100_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_ce_new(&ga100_ce, device, type, inst, pengine);
+		return -ENODEV;
 
 	return nvkm_engine_new_(&ga100_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
index ce56ede7c2e9..9359c5e7aa3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
@@ -44,7 +44,7 @@ ga102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_ce_new(&ga102_ce, device, type, inst, pengine);
+		return -ENODEV;
 
 	return nvkm_engine_new_(&ga102_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
index 7c8647dcb349..67d0545cf902 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
@@ -40,7 +40,7 @@ tu102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_ce_new(&tu102_ce, device, type, inst, pengine);
+		return -ENODEV;
 
 	return nvkm_engine_new_(&tu102_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index aa929d3b2941..0cd20d0f8782 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2529,9 +2529,6 @@ nv170_chipset = {
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
-	.nvdec    = { 0x0000001f, ga100_nvdec_new },
-	.nvjpg    = { 0x00000001, ga100_nvjpg_new },
-	.ofa      = { 0x00000001, ga100_ofa_new },
 };
 
 static const struct nvkm_device_chip
@@ -2561,8 +2558,6 @@ nv172_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
-	.nvenc    = { 0x00000001, ga102_nvenc_new },
-	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2593,8 +2588,6 @@ nv173_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
-	.nvenc    = { 0x00000001, ga102_nvenc_new },
-	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2625,8 +2618,6 @@ nv174_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
-	.nvenc    = { 0x00000001, ga102_nvenc_new },
-	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2657,8 +2648,6 @@ nv176_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
-	.nvenc    = { 0x00000001, ga102_nvenc_new },
-	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2689,8 +2678,6 @@ nv177_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
-	.nvenc    = { 0x00000001, ga102_nvenc_new },
-	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2712,11 +2699,6 @@ nv192_chipset = {
 	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
-	.gr       = { 0x00000001, ad102_gr_new },
-	.nvdec    = { 0x0000000f, ad102_nvdec_new },
-	.nvenc    = { 0x00000007, ad102_nvenc_new },
-	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
-	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2738,11 +2720,6 @@ nv193_chipset = {
 	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
-	.gr       = { 0x00000001, ad102_gr_new },
-	.nvdec    = { 0x0000000f, ad102_nvdec_new },
-	.nvenc    = { 0x00000007, ad102_nvenc_new },
-	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
-	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2764,11 +2741,6 @@ nv194_chipset = {
 	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
-	.gr       = { 0x00000001, ad102_gr_new },
-	.nvdec    = { 0x0000000f, ad102_nvdec_new },
-	.nvenc    = { 0x00000007, ad102_nvenc_new },
-	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
-	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2790,11 +2762,6 @@ nv196_chipset = {
 	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
-	.gr       = { 0x00000001, ad102_gr_new },
-	.nvdec    = { 0x0000000f, ad102_nvdec_new },
-	.nvenc    = { 0x00000007, ad102_nvenc_new },
-	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
-	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2816,11 +2783,6 @@ nv197_chipset = {
 	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
-	.gr       = { 0x00000001, ad102_gr_new },
-	.nvdec    = { 0x0000000f, ad102_nvdec_new },
-	.nvenc    = { 0x00000007, ad102_nvenc_new },
-	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
-	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index e42b18820a95..8da5e896dd74 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -43,8 +43,6 @@
 #include <engine/msvld.h>
 #include <engine/nvenc.h>
 #include <engine/nvdec.h>
-#include <engine/nvjpg.h>
-#include <engine/ofa.h>
 #include <engine/sec.h>
 #include <engine/sec2.h>
 #include <engine/sw.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
index 487fcc14b9a9..b5418f05ccd8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
@@ -41,7 +41,6 @@ nvkm-y += nvkm/engine/gr/gp10b.o
 nvkm-y += nvkm/engine/gr/gv100.o
 nvkm-y += nvkm/engine/gr/tu102.o
 nvkm-y += nvkm/engine/gr/ga102.o
-nvkm-y += nvkm/engine/gr/ad102.o
 
 nvkm-y += nvkm/engine/gr/ctxnv40.o
 nvkm-y += nvkm/engine/gr/ctxnv50.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
deleted file mode 100644
index 7bfa6240d283..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "gf100.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct gf100_gr_func
-ad102_gr = {
-	.sclass = {
-		{ -1, -1, FERMI_TWOD_A },
-		{ -1, -1, KEPLER_INLINE_TO_MEMORY_B },
-		{ -1, -1, ADA_A },
-		{ -1, -1, ADA_COMPUTE_A },
-		{}
-	}
-};
-
-int
-ad102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_gr_new(&ad102_gr, device, type, inst, pgr);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index d285c597aff9..2b51f1d0c281 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -352,7 +352,7 @@ int
 ga102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_gr_new(&ga102_gr, device, type, inst, pgr);
+		return -ENODEV;
 
 	return gf100_gr_new_(ga102_gr_fwif, device, type, inst, pgr);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
index b0e0c9305034..54f686ba39ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -445,6 +445,4 @@ void gp108_gr_acr_bld_patch(struct nvkm_acr *, u32, s64);
 
 int gf100_gr_new_(const struct gf100_gr_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gr **);
-int r535_gr_new(const struct gf100_gr_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
-		struct nvkm_gr **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index b7a458e9040a..bda8054c6b59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -219,7 +219,7 @@ int
 tu102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_gr_new(&tu102_gr, device, type, inst, pgr);
+		return -ENODEV;
 
 	return gf100_gr_new_(tu102_gr_fwif, device, type, inst, pgr);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
index 5cc317abc42c..37b0cdc760c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
@@ -2,6 +2,4 @@
 nvkm-y += nvkm/engine/nvdec/base.o
 nvkm-y += nvkm/engine/nvdec/gm107.o
 nvkm-y += nvkm/engine/nvdec/tu102.o
-nvkm-y += nvkm/engine/nvdec/ga100.o
 nvkm-y += nvkm/engine/nvdec/ga102.o
-nvkm-y += nvkm/engine/nvdec/ad102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
deleted file mode 100644
index d72b3aae9a2b..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ad102_nvdec = {
-	.sclass = {
-		{ -1, -1, NVC9B0_VIDEO_DECODER },
-		{}
-	}
-};
-
-int
-ad102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_nvdec **pnvdec)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvdec_new(&ad102_nvdec, device, type, inst, pnvdec);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
deleted file mode 100644
index 932934227b9c..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga100_nvdec = {
-	.sclass = {
-		{ -1, -1, NVC6B0_VIDEO_DECODER },
-		{}
-	}
-};
-
-int
-ga100_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_nvdec **pnvdec)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvdec_new(&ga100_nvdec, device, type, inst, pnvdec);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
index 022a9c824304..eea6368adae2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
@@ -23,16 +23,6 @@
 
 #include <subdev/gsp.h>
 
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga102_nvdec_gsp = {
-	.sclass = {
-		{ -1, -1, NVC7B0_VIDEO_DECODER },
-		{}
-	}
-};
-
 static const struct nvkm_falcon_func
 ga102_nvdec_flcn = {
 	.disable = gm200_flcn_disable,
@@ -67,7 +57,7 @@ ga102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst
 		struct nvkm_nvdec **pnvdec)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvdec_new(&ga102_nvdec_gsp, device, type, inst, pnvdec);
+		return -ENODEV;
 
 	return nvkm_nvdec_new_(ga102_nvdec_fwif, device, type, inst, 0x848000, pnvdec);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
index f506ae83bfd7..f8d43e913093 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
@@ -20,7 +20,4 @@ extern const struct nvkm_nvdec_fwif gm107_nvdec_fwif[];
 
 int nvkm_nvdec_new_(const struct nvkm_nvdec_fwif *fwif, struct nvkm_device *,
 		    enum nvkm_subdev_type, int, u32 addr, struct nvkm_nvdec **);
-
-int r535_nvdec_new(const struct nvkm_engine_func *, struct nvkm_device *,
-		   enum nvkm_subdev_type, int, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
index 808c8e010b9e..fe95b6e22f21 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
@@ -23,22 +23,12 @@
 
 #include <subdev/gsp.h>
 
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-tu102_nvdec = {
-	.sclass = {
-		{ -1, -1, NVC4B0_VIDEO_DECODER },
-		{}
-	}
-};
-
 int
 tu102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_nvdec **pnvdec)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvdec_new(&tu102_nvdec, device, type, inst, pnvdec);
+		return -ENODEV;
 
 	return nvkm_nvdec_new_(gm107_nvdec_fwif, device, type, inst, 0, pnvdec);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
index 3d71f2973dab..6dcb20d1d156 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
@@ -2,5 +2,3 @@
 nvkm-y += nvkm/engine/nvenc/base.o
 nvkm-y += nvkm/engine/nvenc/gm107.o
 nvkm-y += nvkm/engine/nvenc/tu102.o
-nvkm-y += nvkm/engine/nvenc/ga102.o
-nvkm-y += nvkm/engine/nvenc/ad102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
deleted file mode 100644
index 1b4619ff9e8e..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ad102_nvenc = {
-	.sclass = {
-		{ -1, -1, NVC9B7_VIDEO_ENCODER },
-		{}
-	}
-};
-
-int
-ad102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_nvenc **pnvenc)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvenc_new(&ad102_nvenc, device, type, inst, pnvenc);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
deleted file mode 100644
index 6463ab8e5871..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga102_nvenc = {
-	.sclass = {
-		{ -1, -1, NVC7B7_VIDEO_ENCODER },
-		{}
-	}
-};
-
-int
-ga102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_nvenc **pnvenc)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvenc_new(&ga102_nvenc, device, type, inst, pnvenc);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
index 7917affc6505..b097e3f2867b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
@@ -18,7 +18,4 @@ extern const struct nvkm_nvenc_fwif gm107_nvenc_fwif[];
 
 int nvkm_nvenc_new_(const struct nvkm_nvenc_fwif *, struct nvkm_device *, enum nvkm_subdev_type,
 		    int, struct nvkm_nvenc **pnvenc);
-
-int r535_nvenc_new(const struct nvkm_engine_func *, struct nvkm_device *,
-		   enum nvkm_subdev_type, int, struct nvkm_nvenc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
index 933864423bb3..8a436b398749 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
@@ -23,22 +23,12 @@
 
 #include <subdev/gsp.h>
 
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-tu102_nvenc = {
-	.sclass = {
-		{ -1, -1, NVC4B7_VIDEO_ENCODER },
-		{}
-	}
-};
-
 int
 tu102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_nvenc **pnvenc)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvenc_new(&tu102_nvenc, device, type, inst, pnvenc);
+		return -ENODEV;
 
 	return nvkm_nvenc_new_(gm107_nvenc_fwif, device, type, inst, pnvenc);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
deleted file mode 100644
index 1d9bddd68605..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: MIT
-nvkm-y += nvkm/engine/nvjpg/ga100.o
-nvkm-y += nvkm/engine/nvjpg/ad102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
deleted file mode 100644
index 62705dc6494c..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ad102_nvjpg = {
-	.sclass = {
-		{ -1, -1, NVC9D1_VIDEO_NVJPG },
-		{}
-	}
-};
-
-int
-ad102_nvjpg_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_engine **pengine)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvjpg_new(&ad102_nvjpg, device, type, inst, pengine);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
deleted file mode 100644
index f550eb07da5a..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga100_nvjpg = {
-	.sclass = {
-		{ -1, -1, NVC4D1_VIDEO_NVJPG },
-		{}
-	}
-};
-
-int
-ga100_nvjpg_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		struct nvkm_engine **pengine)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_nvjpg_new(&ga100_nvjpg, device, type, inst, pengine);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
deleted file mode 100644
index 1e80cf70033a..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_NVJPG_PRIV_H__
-#define __NVKM_NVJPG_PRIV_H__
-#include <engine/nvjpg.h>
-
-int r535_nvjpg_new(const struct nvkm_engine_func *, struct nvkm_device *,
-		   enum nvkm_subdev_type, int, struct nvkm_engine **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
deleted file mode 100644
index 3faf73b35f5a..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: MIT
-nvkm-y += nvkm/engine/ofa/ga100.o
-nvkm-y += nvkm/engine/ofa/ga102.o
-nvkm-y += nvkm/engine/ofa/ad102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
deleted file mode 100644
index 7ac87ef26aec..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ad102_ofa = {
-	.sclass = {
-		{ -1, -1, NVC9FA_VIDEO_OFA },
-		{}
-	}
-};
-
-int
-ad102_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-	      struct nvkm_engine **pengine)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_ofa_new(&ad102_ofa, device, type, inst, pengine);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
deleted file mode 100644
index ef474f61a1b5..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga100_ofa = {
-	.sclass = {
-		{ -1, -1, NVC6FA_VIDEO_OFA },
-		{}
-	}
-};
-
-int
-ga100_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-	      struct nvkm_engine **pengine)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_ofa_new(&ga100_ofa, device, type, inst, pengine);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
deleted file mode 100644
index bea255529993..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * Copyright 2023 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "priv.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_engine_func
-ga102_ofa = {
-	.sclass = {
-		{ -1, -1, NVC7FA_VIDEO_OFA },
-		{}
-	}
-};
-
-int
-ga102_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-	      struct nvkm_engine **pengine)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_ofa_new(&ga102_ofa, device, type, inst, pengine);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
deleted file mode 100644
index caf29e6bddb4..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_OFA_PRIV_H__
-#define __NVKM_OFA_PRIV_H__
-#include <engine/ofa.h>
-
-int r535_ofa_new(const struct nvkm_engine_func *, struct nvkm_device *,
-		 enum nvkm_subdev_type, int, struct nvkm_engine **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 841b690c0c0a..e5d5f8880d31 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: MIT
 #
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+nvkm-y += nvkm/subdev/gsp/rm/engine.o
+nvkm-y += nvkm/subdev/gsp/rm/gr.o
+nvkm-y += nvkm/subdev/gsp/rm/nvdec.o
+nvkm-y += nvkm/subdev/gsp/rm/nvenc.o
 
 nvkm-y += nvkm/subdev/gsp/rm/tu1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ga100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index 3f99826466b2..8b26c92c40c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -39,4 +39,15 @@ ad10x_gpu = {
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
 	},
+
+	.ce.class = AMPERE_DMA_COPY_B,
+	.gr.class = {
+		.i2m = KEPLER_INLINE_TO_MEMORY_B,
+		.twod = FERMI_TWOD_A,
+		.threed = ADA_A,
+		.compute = ADA_COMPUTE_A,
+	},
+	.nvdec.class = NVC9B0_VIDEO_DECODER,
+	.nvenc.class = NVC9B7_VIDEO_ENCODER,
+	.ofa.class = NVC9FA_VIDEO_OFA,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
new file mode 100644
index 000000000000..7ad7c82e0d90
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
@@ -0,0 +1,206 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "engine.h"
+#include "gpu.h"
+
+#include <core/object.h>
+#include <engine/fifo/chan.h>
+
+struct nvkm_rm_engine {
+	struct nvkm_engine engine;
+
+	struct nvkm_engine_func func;
+};
+
+struct nvkm_rm_engine_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void*
+nvkm_rm_engine_obj_dtor(struct nvkm_object *object)
+{
+	struct nvkm_rm_engine_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+nvkm_rm_engine_obj = {
+	.dtor = nvkm_rm_engine_obj_dtor,
+};
+
+int
+nvkm_rm_engine_obj_new(struct nvkm_gsp_object *chan, int chid, const struct nvkm_oclass *oclass,
+		       struct nvkm_object **pobject)
+{
+	struct nvkm_rm *rm = chan->client->gsp->rm;
+	const int inst = oclass->engine->subdev.inst;
+	const u32 class = oclass->base.oclass;
+	const u32 handle = oclass->handle;
+	struct nvkm_rm_engine_obj *obj;
+	int ret;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return -ENOMEM;
+
+	switch (oclass->engine->subdev.type) {
+	case NVKM_ENGINE_CE:
+		ret = rm->api->ce->alloc(chan, handle, class, inst, &obj->rm);
+		break;
+	case NVKM_ENGINE_GR:
+		ret = nvkm_gsp_rm_alloc(chan, handle, class, 0, &obj->rm);
+		break;
+	case NVKM_ENGINE_NVDEC:
+		ret = rm->api->nvdec->alloc(chan, handle, class, inst, &obj->rm);
+		break;
+	case NVKM_ENGINE_NVENC:
+		ret = rm->api->nvenc->alloc(chan, handle, class, inst, &obj->rm);
+		break;
+	case NVKM_ENGINE_NVJPG:
+		ret = rm->api->nvjpg->alloc(chan, handle, class, inst, &obj->rm);
+		break;
+	case NVKM_ENGINE_OFA:
+		ret = rm->api->ofa->alloc(chan, handle, class, inst, &obj->rm);
+		break;
+	default:
+		ret = -EINVAL;
+		WARN_ON(1);
+		break;
+	}
+
+	if (ret) {
+		kfree(obj);
+		return ret;
+	}
+
+	nvkm_object_ctor(&nvkm_rm_engine_obj, oclass, &obj->object);
+	*pobject = &obj->object;
+	return 0;
+}
+
+static int
+nvkm_rm_engine_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+			struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+
+	return nvkm_rm_engine_obj_new(&chan->rm.object, chan->id, oclass, pobject);
+}
+
+static void *
+nvkm_rm_engine_dtor(struct nvkm_engine *engine)
+{
+	kfree(engine->func);
+	return engine;
+}
+
+int
+nvkm_rm_engine_ctor(void *(*dtor)(struct nvkm_engine *), struct nvkm_rm *rm,
+		    enum nvkm_subdev_type type, int inst,
+		    const u32 *class, int nclass, struct nvkm_engine *engine)
+{
+	struct nvkm_engine_func *func;
+
+	func = kzalloc(struct_size(func, sclass, nclass + 1), GFP_KERNEL);
+	if (!func)
+		return -ENOMEM;
+
+	func->dtor = dtor;
+
+	for (int i = 0; i < nclass; i++) {
+		func->sclass[i].oclass = class[i];
+		func->sclass[i].minver = -1;
+		func->sclass[i].maxver = 0;
+		func->sclass[i].ctor = nvkm_rm_engine_obj_ctor;
+	}
+
+	nvkm_engine_ctor(func, rm->device, type, inst, true, engine);
+	return 0;
+}
+
+static int
+nvkm_rm_engine_new_(struct nvkm_rm *rm, enum nvkm_subdev_type type, int inst, u32 class,
+		    struct nvkm_engine **pengine)
+{
+	struct nvkm_engine *engine;
+	int ret;
+
+	engine = kzalloc(sizeof(*engine), GFP_KERNEL);
+	if (!engine)
+		return -ENOMEM;
+
+	ret = nvkm_rm_engine_ctor(nvkm_rm_engine_dtor, rm, type, inst, &class, 1, engine);
+	if (ret) {
+		kfree(engine);
+		return ret;
+	}
+
+	*pengine = engine;
+	return 0;
+}
+
+int
+nvkm_rm_engine_new(struct nvkm_rm *rm, enum nvkm_subdev_type type, int inst)
+{
+	const struct nvkm_rm_gpu *gpu = rm->gpu;
+	struct nvkm_device *device = rm->device;
+
+	switch (type) {
+	case NVKM_ENGINE_CE:
+		if (WARN_ON(inst >= ARRAY_SIZE(device->ce)))
+			return -EINVAL;
+
+		return nvkm_rm_engine_new_(rm, type, inst, gpu->ce.class, &device->ce[inst]);
+	case NVKM_ENGINE_GR:
+		if (inst != 0)
+			return -ENODEV; /* MiG not supported, just ignore. */
+
+		return nvkm_rm_gr_new(rm);
+	case NVKM_ENGINE_NVDEC:
+		if (WARN_ON(inst >= ARRAY_SIZE(device->nvdec)))
+			return -EINVAL;
+
+		return nvkm_rm_nvdec_new(rm, inst);
+	case NVKM_ENGINE_NVENC:
+		if (WARN_ON(inst >= ARRAY_SIZE(device->nvenc)))
+			return -EINVAL;
+
+		return nvkm_rm_nvenc_new(rm, inst);
+	case NVKM_ENGINE_NVJPG:
+		if (WARN_ON(inst >= ARRAY_SIZE(device->nvjpg)))
+			return -EINVAL;
+
+		return nvkm_rm_engine_new_(rm, type, inst, gpu->nvjpg.class, &device->nvjpg[inst]);
+	case NVKM_ENGINE_OFA:
+		if (WARN_ON(inst >= ARRAY_SIZE(device->ofa)))
+			return -EINVAL;
+
+		return nvkm_rm_engine_new_(rm, type, inst, gpu->ofa.class, &device->ofa[inst]);
+	default:
+		break;
+	}
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h
new file mode 100644
index 000000000000..5b8c9c3901d4
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_ENGINE_H__
+#define __NVKM_RM_ENGINE_H__
+#include "gpu.h"
+
+int nvkm_rm_engine_ctor(void *(*dtor)(struct nvkm_engine *), struct nvkm_rm *,
+			enum nvkm_subdev_type type, int inst,
+			const u32 *class, int nclass, struct nvkm_engine *);
+int nvkm_rm_engine_new(struct nvkm_rm *, enum nvkm_subdev_type, int inst);
+
+int nvkm_rm_engine_obj_new(struct nvkm_gsp_object *chan, int chid, const struct nvkm_oclass *,
+			   struct nvkm_object **);
+
+int nvkm_rm_gr_new(struct nvkm_rm *);
+int nvkm_rm_nvdec_new(struct nvkm_rm *, int inst);
+int nvkm_rm_nvenc_new(struct nvkm_rm *, int inst);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index 1031ec26eb47..b17cf2f59523 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -30,4 +30,13 @@ ga100_gpu = {
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
 	},
+
+	.ce.class = AMPERE_DMA_COPY_A,
+	.gr.class = {
+		.i2m = KEPLER_INLINE_TO_MEMORY_B,
+		.twod = FERMI_TWOD_A,
+		.threed = AMPERE_A,
+		.compute = AMPERE_COMPUTE_A,
+	},
+	.nvdec.class = NVC6B0_VIDEO_DECODER,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index e4f83cf5be7c..50cb89460836 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -39,4 +39,15 @@ ga1xx_gpu = {
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
 	},
+
+	.ce.class = AMPERE_DMA_COPY_B,
+	.gr.class = {
+		.i2m = KEPLER_INLINE_TO_MEMORY_B,
+		.twod = FERMI_TWOD_A,
+		.threed = AMPERE_B,
+		.compute = AMPERE_COMPUTE_B,
+	},
+	.nvdec.class = NVC7B0_VIDEO_DECODER,
+	.nvenc.class = NVC7B7_VIDEO_ENCODER,
+	.ofa.class = NVC7FA_VIDEO_OFA,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 4aeeb4b32dc8..a256be42ab6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -27,6 +27,35 @@ struct nvkm_rm_gpu {
 			u32 class;
 		} chan;
 	} fifo;
+
+	struct {
+		u32 class;
+	} ce;
+
+	struct {
+		struct {
+			u32 i2m;
+			u32 twod;
+			u32 threed;
+			u32 compute;
+		} class;
+	} gr;
+
+	struct {
+		u32 class;
+	} nvdec;
+
+	struct {
+		u32 class;
+	} nvenc;
+
+	struct {
+		u32 class;
+	} nvjpg;
+
+	struct {
+		u32 class;
+	} ofa;
 };
 
 extern const struct nvkm_rm_gpu tu1xx_gpu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c
new file mode 100644
index 000000000000..45f89da0d47e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c
@@ -0,0 +1,73 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "gr.h"
+
+#include <engine/fifo.h>
+#include <engine/gr/priv.h>
+
+static int
+nvkm_rm_gr_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		    struct nvkm_object **pobject)
+{
+	struct r535_gr_chan *chan = container_of(oclass->parent, typeof(*chan), object);
+
+	return nvkm_rm_engine_obj_new(&chan->chan->rm.object, chan->chan->id, oclass, pobject);
+}
+
+int
+nvkm_rm_gr_new(struct nvkm_rm *rm)
+{
+	const u32 classes[] = {
+		rm->gpu->gr.class.i2m,
+		rm->gpu->gr.class.twod,
+		rm->gpu->gr.class.threed,
+		rm->gpu->gr.class.compute,
+	};
+	struct nvkm_gr_func *func;
+	struct r535_gr *gr;
+
+	func = kzalloc(struct_size(func, sclass, ARRAY_SIZE(classes) + 1), GFP_KERNEL);
+	if (!func)
+		return -ENOMEM;
+
+	func->dtor = r535_gr_dtor;
+	func->oneinit = r535_gr_oneinit;
+	func->units = r535_gr_units;
+	func->chan_new = r535_gr_chan_new;
+
+	for (int i = 0; i < ARRAY_SIZE(classes); i++) {
+		func->sclass[i].oclass = classes[i];
+		func->sclass[i].minver = -1;
+		func->sclass[i].maxver = 0;
+		func->sclass[i].ctor = nvkm_rm_gr_obj_ctor;
+	}
+
+	gr = kzalloc(sizeof(*gr), GFP_KERNEL);
+	if (!gr) {
+		kfree(func);
+		return -ENOMEM;
+	}
+
+	nvkm_gr_ctor(func, rm->device, NVKM_ENGINE_GR, 0, true, &gr->base);
+	rm->device->gr = &gr->base;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
new file mode 100644
index 000000000000..c6d82dc94e05
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_RM_GR_H__
+#define __NVKM_RM_GR_H__
+#include "engine.h"
+
+#include <core/object.h>
+#include <engine/gr.h>
+
+#define R515_GR_MAX_CTXBUFS 9
+
+struct r535_gr {
+	struct nvkm_gr base;
+
+	struct {
+		u16 bufferId;
+		u32 size;
+		u8  page;
+		u8  align;
+		bool global;
+		bool init;
+		bool ro;
+	} ctxbuf[R515_GR_MAX_CTXBUFS];
+	int ctxbuf_nr;
+
+	struct nvkm_memory *ctxbuf_mem[R515_GR_MAX_CTXBUFS];
+};
+
+struct r535_gr_chan {
+	struct nvkm_object object;
+	struct r535_gr *gr;
+
+	struct nvkm_vmm *vmm;
+	struct nvkm_chan *chan;
+
+	struct nvkm_memory *mem[R515_GR_MAX_CTXBUFS];
+	struct nvkm_vma    *vma[R515_GR_MAX_CTXBUFS];
+};
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c
new file mode 100644
index 000000000000..81eef43df8b0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c
@@ -0,0 +1,50 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "engine.h"
+#include <engine/nvdec.h>
+
+static void *
+nvkm_rm_nvdec_dtor(struct nvkm_engine *engine)
+{
+	return container_of(engine, struct nvkm_nvdec, engine);
+}
+
+int
+nvkm_rm_nvdec_new(struct nvkm_rm *rm, int inst)
+{
+	struct nvkm_nvdec *nvdec;
+	int ret;
+
+	nvdec = kzalloc(sizeof(*nvdec), GFP_KERNEL);
+	if (!nvdec)
+		return -ENOMEM;
+
+	ret = nvkm_rm_engine_ctor(nvkm_rm_nvdec_dtor, rm, NVKM_ENGINE_NVDEC, inst,
+				  &rm->gpu->nvdec.class, 1, &nvdec->engine);
+	if (ret) {
+		kfree(nvdec);
+		return ret;
+	}
+
+	rm->device->nvdec[inst] = nvdec;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c
new file mode 100644
index 000000000000..5dc9774b5bee
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c
@@ -0,0 +1,50 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "engine.h"
+#include <engine/nvenc.h>
+
+static void *
+nvkm_rm_nvenc_dtor(struct nvkm_engine *engine)
+{
+	return container_of(engine, struct nvkm_nvenc, engine);
+}
+
+int
+nvkm_rm_nvenc_new(struct nvkm_rm *rm, int inst)
+{
+	struct nvkm_nvenc *nvenc;
+	int ret;
+
+	nvenc = kzalloc(sizeof(*nvenc), GFP_KERNEL);
+	if (!nvenc)
+		return -ENOMEM;
+
+	ret = nvkm_rm_engine_ctor(nvkm_rm_nvenc_dtor, rm, NVKM_ENGINE_NVENC, inst,
+				  &rm->gpu->nvenc.class, 1, &nvenc->engine);
+	if (ret) {
+		kfree(nvenc);
+		return ret;
+	}
+
+	rm->device->nvenc[inst] = nvenc;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
index d60003231e6d..2d1ce9db2dcf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
@@ -19,89 +19,28 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/ce/priv.h>
-
-#include <core/object.h>
-#include <subdev/gsp.h>
-#include <engine/fifo.h>
+#include <rm/engine.h>
 
 #include "nvrm/ce.h"
 #include "nvrm/engine.h"
 
-struct r535_ce_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_ce_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_ce_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_ce_obj = {
-	.dtor = r535_ce_obj_dtor,
-};
-
 static int
-r535_ce_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
+r535_ce_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+	      struct nvkm_gsp_object *ce)
 {
-	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
-	struct r535_ce_obj *obj;
 	NVC0B5_ALLOCATION_PARAMETERS *args;
 
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_ce_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
-				     sizeof(*args), &obj->rm);
+	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), ce);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
 	args->version = 1;
-	args->engineType = NV2080_ENGINE_TYPE_COPY0 + oclass->engine->subdev.inst;
+	args->engineType = NV2080_ENGINE_TYPE_COPY0 + inst;
 
-	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+	return nvkm_gsp_rm_alloc_wr(ce, args);
 }
 
-static void *
-r535_ce_dtor(struct nvkm_engine *engine)
-{
-	kfree(engine->func);
-	return engine;
-}
-
-int
-r535_ce_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
-	    enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
-{
-	struct nvkm_engine_func *rm;
-	int nclass, ret;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_ce_dtor;
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_ce_obj_ctor;
-	}
-
-	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
-	if (ret)
-		kfree(rm);
-
-	return ret;
-}
+const struct nvkm_rm_api_engine
+r535_ce = {
+	.alloc = r535_ce_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 4459bebcccdf..eb1531c3eabd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -31,7 +31,7 @@
 #include <subdev/vfn.h>
 #include <engine/gr.h>
 
-#include <rm/gpu.h>
+#include <rm/engine.h>
 
 #include <nvhw/drf.h>
 
@@ -345,7 +345,7 @@ r535_engn_nonstall(struct nvkm_engn *engn)
 }
 
 static const struct nvkm_engn_func
-r535_ce = {
+r535_engn_ce = {
 	.nonstall = r535_engn_nonstall,
 };
 
@@ -578,9 +578,17 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			continue;
 		}
 
+		ret = nvkm_rm_engine_new(gsp->rm, type, inst);
+		if (ret) {
+			nvkm_runl_del(runl);
+			continue;
+		}
+
+		engn = NULL;
+
 		switch (type) {
 		case NVKM_ENGINE_CE:
-			engn = nvkm_runl_add(runl, nv2080, &r535_ce, type, inst);
+			engn = nvkm_runl_add(runl, nv2080, &r535_engn_ce, type, inst);
 			break;
 		case NVKM_ENGINE_GR:
 			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index ab941d808e24..c7d1d6081eae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -19,12 +19,13 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/gr/gf100.h>
+#include <rm/gr.h>
 
 #include <core/memory.h>
 #include <subdev/gsp.h>
 #include <subdev/mmu/vmm.h>
 #include <engine/fifo/priv.h>
+#include <engine/gr/priv.h>
 
 #include <nvif/if900d.h>
 
@@ -34,72 +35,6 @@
 
 #define r535_gr(p) container_of((p), struct r535_gr, base)
 
-#define R515_GR_MAX_CTXBUFS 9
-
-struct r535_gr {
-	struct nvkm_gr base;
-
-	struct {
-		u16 bufferId;
-		u32 size;
-		u8  page;
-		u8  align;
-		bool global;
-		bool init;
-		bool ro;
-	} ctxbuf[R515_GR_MAX_CTXBUFS];
-	int ctxbuf_nr;
-
-	struct nvkm_memory *ctxbuf_mem[R515_GR_MAX_CTXBUFS];
-};
-
-struct r535_gr_chan {
-	struct nvkm_object object;
-	struct r535_gr *gr;
-
-	struct nvkm_vmm *vmm;
-	struct nvkm_chan *chan;
-
-	struct nvkm_memory *mem[R515_GR_MAX_CTXBUFS];
-	struct nvkm_vma    *vma[R515_GR_MAX_CTXBUFS];
-};
-
-struct r535_gr_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_gr_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_gr_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_gr_obj = {
-	.dtor = r535_gr_obj_dtor,
-};
-
-static int
-r535_gr_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
-{
-	struct r535_gr_chan *chan = container_of(oclass->parent, typeof(*chan), object);
-	struct r535_gr_obj *obj;
-
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_gr_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	return nvkm_gsp_rm_alloc(&chan->chan->rm.object, oclass->handle, oclass->base.oclass, 0,
-				 &obj->rm);
-}
-
 static void *
 r535_gr_chan_dtor(struct nvkm_object *object)
 {
@@ -203,7 +138,7 @@ r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 	return nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.subdevice, ctrl);
 }
 
-static int
+int
 r535_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *chan, const struct nvkm_oclass *oclass,
 		 struct nvkm_object **pobject)
 {
@@ -227,7 +162,7 @@ r535_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *chan, const struct nvkm
 	return 0;
 }
 
-static u64
+u64
 r535_gr_units(struct nvkm_gr *gr)
 {
 	struct nvkm_gsp *gsp = gr->engine.subdev.device->gsp;
@@ -235,7 +170,7 @@ r535_gr_units(struct nvkm_gr *gr)
 	return (gsp->gr.tpcs << 8) | gsp->gr.gpcs;
 }
 
-static int
+int
 r535_gr_oneinit(struct nvkm_gr *base)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
@@ -455,7 +390,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 
 }
 
-static void *
+void *
 r535_gr_dtor(struct nvkm_gr *base)
 {
 	struct r535_gr *gr = r535_gr(base);
@@ -466,38 +401,3 @@ r535_gr_dtor(struct nvkm_gr *base)
 	kfree(gr->base.func);
 	return gr;
 }
-
-int
-r535_gr_new(const struct gf100_gr_func *hw,
-	    struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
-{
-	struct nvkm_gr_func *rm;
-	struct r535_gr *gr;
-	int nclass;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_gr_dtor;
-	rm->oneinit = r535_gr_oneinit;
-	rm->units = r535_gr_units;
-	rm->chan_new = r535_gr_chan_new;
-
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_gr_obj_ctor;
-	}
-
-	if (!(gr = kzalloc(sizeof(*gr), GFP_KERNEL))) {
-		kfree(rm);
-		return -ENOMEM;
-	}
-
-	*pgr = &gr->base;
-
-	return nvkm_gr_ctor(rm, device, type, inst, true, &gr->base);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
index 05d0916d199e..a8c42ec0367b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
@@ -19,91 +19,27 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/nvdec/priv.h>
-
-#include <core/object.h>
-#include <subdev/gsp.h>
-#include <engine/fifo.h>
+#include <rm/engine.h>
 
 #include "nvrm/nvdec.h"
 
-struct r535_nvdec_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_nvdec_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_nvdec_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_nvdec_obj = {
-	.dtor = r535_nvdec_obj_dtor,
-};
-
 static int
-r535_nvdec_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
+r535_nvdec_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+		 struct nvkm_gsp_object *nvdec)
 {
-	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
-	struct r535_nvdec_obj *obj;
 	NV_BSP_ALLOCATION_PARAMETERS *args;
 
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_nvdec_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
-				     sizeof(*args), &obj->rm);
+	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvdec);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
 	args->size = sizeof(*args);
-	args->engineInstance = oclass->engine->subdev.inst;
+	args->engineInstance = inst;
 
-	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+	return nvkm_gsp_rm_alloc_wr(nvdec, args);
 }
 
-static void *
-r535_nvdec_dtor(struct nvkm_engine *engine)
-{
-	struct nvkm_nvdec *nvdec = nvkm_nvdec(engine);
-
-	kfree(nvdec->engine.func);
-	return nvdec;
-}
-
-int
-r535_nvdec_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
-	       enum nvkm_subdev_type type, int inst, struct nvkm_nvdec **pnvdec)
-{
-	struct nvkm_engine_func *rm;
-	int nclass;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_nvdec_dtor;
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_nvdec_obj_ctor;
-	}
-
-	if (!(*pnvdec = kzalloc(sizeof(**pnvdec), GFP_KERNEL))) {
-		kfree(rm);
-		return -ENOMEM;
-	}
-
-	return nvkm_engine_ctor(rm, device, type, inst, true, &(*pnvdec)->engine);
-}
+const struct nvkm_rm_api_engine
+r535_nvdec = {
+	.alloc = r535_nvdec_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
index dcf80d1f1e9e..acb3ce8bb9de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
@@ -19,91 +19,27 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/nvenc/priv.h>
-
-#include <core/object.h>
-#include <subdev/gsp.h>
-#include <engine/fifo.h>
+#include <rm/engine.h>
 
 #include "nvrm/nvenc.h"
 
-struct r535_nvenc_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_nvenc_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_nvenc_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_nvenc_obj = {
-	.dtor = r535_nvenc_obj_dtor,
-};
-
 static int
-r535_nvenc_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
+r535_nvenc_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+		 struct nvkm_gsp_object *nvenc)
 {
-	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
-	struct r535_nvenc_obj *obj;
 	NV_MSENC_ALLOCATION_PARAMETERS *args;
 
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_nvenc_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
-				     sizeof(*args), &obj->rm);
+	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvenc);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
 	args->size = sizeof(*args);
-	args->engineInstance = oclass->engine->subdev.inst;
+	args->engineInstance = inst;
 
-	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+	return nvkm_gsp_rm_alloc_wr(nvenc, args);
 }
 
-static void *
-r535_nvenc_dtor(struct nvkm_engine *engine)
-{
-	struct nvkm_nvenc *nvenc = nvkm_nvenc(engine);
-
-	kfree(nvenc->engine.func);
-	return nvenc;
-}
-
-int
-r535_nvenc_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
-	       enum nvkm_subdev_type type, int inst, struct nvkm_nvenc **pnvenc)
-{
-	struct nvkm_engine_func *rm;
-	int nclass;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_nvenc_dtor;
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_nvenc_obj_ctor;
-	}
-
-	if (!(*pnvenc = kzalloc(sizeof(**pnvenc), GFP_KERNEL))) {
-		kfree(rm);
-		return -ENOMEM;
-	}
-
-	return nvkm_engine_ctor(rm, device, type, inst, true, &(*pnvenc)->engine);
-}
+const struct nvkm_rm_api_engine
+r535_nvenc = {
+	.alloc = r535_nvenc_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
index 8a8d7becba93..fbc4080ad8d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
@@ -19,88 +19,27 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/nvjpg/priv.h>
-
-#include <core/object.h>
-#include <subdev/gsp.h>
-#include <engine/fifo.h>
+#include <rm/engine.h>
 
 #include "nvrm/nvjpg.h"
 
-struct r535_nvjpg_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_nvjpg_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_nvjpg_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_nvjpg_obj = {
-	.dtor = r535_nvjpg_obj_dtor,
-};
-
 static int
-r535_nvjpg_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		    struct nvkm_object **pobject)
+r535_nvjpg_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+		 struct nvkm_gsp_object *nvjpg)
 {
-	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
-	struct r535_nvjpg_obj *obj;
 	NV_NVJPG_ALLOCATION_PARAMETERS *args;
 
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_nvjpg_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
-				     sizeof(*args), &obj->rm);
+	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvjpg);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
 	args->size = sizeof(*args);
-	args->engineInstance = oclass->engine->subdev.inst;
+	args->engineInstance = inst;
 
-	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+	return nvkm_gsp_rm_alloc_wr(nvjpg, args);
 }
 
-static void *
-r535_nvjpg_dtor(struct nvkm_engine *engine)
-{
-	kfree(engine->func);
-	return engine;
-}
-
-int
-r535_nvjpg_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
-	       enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
-{
-	struct nvkm_engine_func *rm;
-	int nclass, ret;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_nvjpg_dtor;
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_nvjpg_obj_ctor;
-	}
-
-	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
-	if (ret)
-		kfree(rm);
-
-	return ret;
-}
+const struct nvkm_rm_api_engine
+r535_nvjpg = {
+	.alloc = r535_nvjpg_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
index 4bd84ff04702..2156808cba4f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
@@ -19,88 +19,26 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include <engine/ofa/priv.h>
-
-#include <core/object.h>
-#include <subdev/gsp.h>
-#include <subdev/mmu.h>
-#include <engine/fifo.h>
+#include <rm/engine.h>
 
 #include "nvrm/ofa.h"
 
-struct r535_ofa_obj {
-	struct nvkm_object object;
-	struct nvkm_gsp_object rm;
-};
-
-static void *
-r535_ofa_obj_dtor(struct nvkm_object *object)
-{
-	struct r535_ofa_obj *obj = container_of(object, typeof(*obj), object);
-
-	nvkm_gsp_rm_free(&obj->rm);
-	return obj;
-}
-
-static const struct nvkm_object_func
-r535_ofa_obj = {
-	.dtor = r535_ofa_obj_dtor,
-};
-
 static int
-r535_ofa_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
+r535_ofa_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+	       struct nvkm_gsp_object *ofa)
 {
-	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
-	struct r535_ofa_obj *obj;
 	NV_OFA_ALLOCATION_PARAMETERS *args;
 
-	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
-		return -ENOMEM;
-
-	nvkm_object_ctor(&r535_ofa_obj, oclass, &obj->object);
-	*pobject = &obj->object;
-
-	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
-				     sizeof(*args), &obj->rm);
+	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), ofa);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
 	args->size = sizeof(*args);
 
-	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+	return nvkm_gsp_rm_alloc_wr(ofa, args);
 }
 
-static void *
-r535_ofa_dtor(struct nvkm_engine *engine)
-{
-	kfree(engine->func);
-	return engine;
-}
-
-int
-r535_ofa_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
-	     enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
-{
-	struct nvkm_engine_func *rm;
-	int nclass, ret;
-
-	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
-
-	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
-		return -ENOMEM;
-
-	rm->dtor = r535_ofa_dtor;
-	for (int i = 0; i < nclass; i++) {
-		rm->sclass[i].minver = hw->sclass[i].minver;
-		rm->sclass[i].maxver = hw->sclass[i].maxver;
-		rm->sclass[i].oclass = hw->sclass[i].oclass;
-		rm->sclass[i].ctor = r535_ofa_obj_ctor;
-	}
-
-	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
-	if (ret)
-		kfree(rm);
-
-	return ret;
-}
+const struct nvkm_rm_api_engine
+r535_ofa = {
+	.alloc = r535_ofa_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 37b3963629f6..e61775c8237f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -28,6 +28,11 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.ce = &r535_ce,
+	.nvdec = &r535_nvdec,
+	.nvenc = &r535_nvenc,
+	.nvjpg = &r535_nvjpg,
+	.ofa = &r535_ofa,
 };
 
 const struct nvkm_rm_impl
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 41d4ed70fc10..bda22703690a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -53,6 +53,11 @@ struct nvkm_rm_api {
 			void (*dtor)(struct nvkm_gsp_event *);
 		} event;
 	} *device;
+
+	const struct nvkm_rm_api_engine {
+		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
+			     struct nvkm_gsp_object *);
+	} *ce, *nvdec, *nvenc, *nvjpg, *ofa;
 };
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
@@ -62,4 +67,14 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
+extern const struct nvkm_rm_api_engine r535_ce;
+void *r535_gr_dtor(struct nvkm_gr *);
+int r535_gr_oneinit(struct nvkm_gr *);
+u64 r535_gr_units(struct nvkm_gr *);
+int r535_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *, const struct nvkm_oclass *,
+		     struct nvkm_object **);
+extern const struct nvkm_rm_api_engine r535_nvdec;
+extern const struct nvkm_rm_api_engine r535_nvenc;
+extern const struct nvkm_rm_api_engine r535_nvjpg;
+extern const struct nvkm_rm_api_engine r535_ofa;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index e3ce8c9b0172..3ad3153ffe58 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -39,4 +39,14 @@ tu1xx_gpu = {
 	.fifo.chan = {
 		.class = TURING_CHANNEL_GPFIFO_A,
 	},
+
+	.ce.class = TURING_DMA_COPY_A,
+	.gr.class = {
+		.i2m = KEPLER_INLINE_TO_MEMORY_B,
+		.twod = FERMI_TWOD_A,
+		.threed = TURING_A,
+		.compute = TURING_COMPUTE_A,
+	},
+	.nvdec.class = NVC4B0_VIDEO_DECODER,
+	.nvenc.class = NVC4B7_VIDEO_ENCODER,
 };
-- 
2.49.0

