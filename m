Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89847AA3CA1
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1194110E5A8;
	Tue, 29 Apr 2025 23:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="haUHPaYy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20A410E5A7
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3Zf9N1dQCjTvX0kNdKJRiqkBM6Ak1Rip4l6nMrnZnTkCjMBgNH9HpfDFRToPasR7LBg6Xuuva+Cd3mZetYxW9uCGI+qI8YnZb6D+uKxjbsptzp110kmBN3cD/bOSBsXVb+F4qMXaE1wZyfDAzbmvc4W1/T3IyKmSlpcTiNTwlFzFn8lFZzwCAcdxuBUzLVTxC5qP5E+/JaPlZ8AJKp4Gv+f3iL0rbsEzKEk3LYqVkavEdoV8HBX6UM85bOpUlPpF1F/x72fl8UVeIssbkkTfXAEWBPdAIeqPZdiah3jp18MLp8XAwPhBf9JvBzyjFX8Kpj+9cRHllf3mXSdVRK/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0tJ4SfVGOdHT+wFKBz/N3j77uhaG3ZLO52TY3SkPjY=;
 b=sIeX3MPDA4lldW7NejwQoUub7Bytpfo9d9eNW9PuLU/cbIu+FULIFqZ7cAmH4J+1HZpjFYKdCmVxlgxvLarxXZiWdvsB/m/RLB00ZDb6o8DSaE/JGCCnbqhZ2INDoPpNSzr3ryEFLQ9lf4rvXi8uaEpfYQj4qRBxa7T0KTUe3nckYbepmdnN1vaMhxCWTtPhsjSE1Xku9M/n8a3/NkHfaucwQDxx2VA3RNluglpfM3ffkNyFlq0/twYT5kU0dmCp3ndK6HdFKh+SL2U8UK8wg9bfbzAiktTfBInbzNNAyyisZdf60fqfpyhhpE/jyYX8JLvXEWPU6EqZwQVPQMOA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0tJ4SfVGOdHT+wFKBz/N3j77uhaG3ZLO52TY3SkPjY=;
 b=haUHPaYyinyET4PEh4mi3OqP6Etvk/wkXhTBy7Xi6D5T5WqUouDqgcIvNcLeWCiQarK/Vki68wr/M0Fa5VYg1QmSTFOWDNDVn9wG0DdduZAPyWCq9iMznAbbRlCc4M8gl/XuGM2zFJpycByu8Y0BYKNCFf1Aw6UU37hn+fzK59kL7gT3DHPRs6YSdTGT5oSuPpwl3lnp7bpSursLQtziSVk9bMoxYN/UY2RQREYJzIc9AfvbpZVjVfWaS7K26A3yLHiduvo8XkYDq/sDLs1qppp2IxKyfVIWk5sJfUMO/ksA25KStN3042SEo1yYfct6cFSQ8olH64895Bw9HBzhZQ==
Received: from SA1P222CA0033.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::6)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:40:50 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::1f) by SA1P222CA0033.outlook.office365.com
 (2603:10b6:806:2d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:35 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 46/60] drm/nouveau/instmem: add hal for set_bar0_window_addr()
Date: Wed, 30 Apr 2025 09:39:14 +1000
Message-ID: <20250429233929.24363-47-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9237f69e-e0d7-429c-f400-08dd87774643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4y0e3lEuwqy05aGg1GpIvkyEtwt53CNRKyWKSP0RZ10MemUSfe2h5d8DN3+j?=
 =?us-ascii?Q?VMwti41eZyhz+obHeTgRGsNuP1iXsBmOJXGab05EtLrreCiNaIcwJYgUUGVG?=
 =?us-ascii?Q?J0hElmF2AkSWpyF/7Ylvs8Szi45fAVkkZo4U7HtaVgiqsMJtHwiWbaYQFr+Q?=
 =?us-ascii?Q?c6Q9n15t+sKY0PoQFr0jMsrlb3Ra6zJcXg9JYvVI9jVsxSxqAGWlWl/HthFT?=
 =?us-ascii?Q?Cj3tfnyBm+sQzm97CHEW+MFClZ29382AoyZ2BsCB60E9dH4dzi4KkKW2CoSt?=
 =?us-ascii?Q?Hdf6xqZ5lU/OunL8cvyMCTVxY2O+C9LBG43X7CMzlf7nFYXsS1JF57y1M+cQ?=
 =?us-ascii?Q?nP5yJKTOVEyVqj0nUa4x66q877PsaBIUWz0wNtwK8ZTYj7pTiKDHEvkT4oqI?=
 =?us-ascii?Q?NP/6tDO6sXOTXJQtdtwIKCzyO41/vgU0FqiUDCxOwbZ3HqrUgNvBOvxVjlt3?=
 =?us-ascii?Q?R5stCTDnYipMucfP5ZMWQxqBjUwCzkhxGE4rHrjQ3rEh8r/4PW3UeFFV1TcT?=
 =?us-ascii?Q?GQtm/Naru/oCVkKkpe74yF61I1dDvNEZipQ8bbDS7zelclu9WsU3Xz5ZFY+R?=
 =?us-ascii?Q?W8PUyXZuhQ94m2+m0hjhr2CN+jNCMVkuAhNOHKLf/rLM4cm1RU11BJRszkaV?=
 =?us-ascii?Q?o+SkH86OIKKY0y618ys2HrETDx/XrxeeBnE8aCVIiSqRaLhvoe5Q/5754CzY?=
 =?us-ascii?Q?BwjZV0zcaByc0GwerEl+QAs+yNvQTNTlxDBvYF+eS4yiY/xWfbx9Puh6ZAl7?=
 =?us-ascii?Q?JvqFJxcMnwvunDWaXOKD+abFEHM8dKM/5TQwMuoj5/oHeqwuDQaagnw3bA9Q?=
 =?us-ascii?Q?DF96ytP6FkFSKEQ9OBDlwtT8+gIQvN/jz54dAd+sERe6YSh+v/AaxgX/nVtn?=
 =?us-ascii?Q?xNZgGWY1PiSsbo46/126MTIwK1NIR7+KoaTrX2UKV6hop/nmS2pG6ZiySSTM?=
 =?us-ascii?Q?plKT+acPYqJsnOVqdF9OBPawcHh9X4F6Ug/D2sgcRLUFEX6RoJljMpU0lrVv?=
 =?us-ascii?Q?EPwPNpcCQkeVQIvwM66IbJOck2XLWvJTxFX0iDpux3aw7VRbdsVfG6hjIMpA?=
 =?us-ascii?Q?ztaEUl2qNHJ6nJwHRFyDQg3Z0l1K0REjpv6nwn9rwJViufTsVjfvoTsGTcYp?=
 =?us-ascii?Q?UiJTJ1s4Au3i6MAHcakAag1y/fuIsmZccuHZnU33cJXvWG9w22JucxMipA6n?=
 =?us-ascii?Q?cw+2yt7pEMAbR4IjBx9/LKHBNuV2Bf1Z1GUuv65phwcef81n97I3wjYEd4dO?=
 =?us-ascii?Q?4jXkGPBR5YzJG+k7HqQ+iHSIMrtRTCeYrDRpJ2ZoUE1HaG+9ky0RzFfCAYJd?=
 =?us-ascii?Q?QaVZcADY2vSkJ8TaK+CXzUs+z4kQXSBuvelS/o7xBa8tQ/DMbfolLjOEX9+h?=
 =?us-ascii?Q?oyf1zouCjhJVBQk/qnrsZOybSLQ9pV9Cn+5qkdPzdR2tIOKX7WGveJblBJiK?=
 =?us-ascii?Q?FfMkcJpPbUZ5bhHbrLfcMPBxr5mYWgw48XfcmVbnAaZPwiPJ6D5GX+h/iMw8?=
 =?us-ascii?Q?xyyjlIe6nftUIZq2Obqnh1n8x0FfXP0jKYfn?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:50.5074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9237f69e-e0d7-429c-f400-08dd87774643
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
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

GH100/GBxxx have moved the register that controls where in VRAM the
the BAR0 NV_PRAMIN window points.

Add a HAL for this, as the BAR0 window is needed for BAR2 bootstrap.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c    | 11 +++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h    |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 1976d0030d17..150e22fde2ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -317,6 +317,7 @@ r535_instmem_new(const struct nvkm_instmem_func *hw,
 	rm->memory_new = hw->memory_new;
 	rm->memory_wrap = hw->memory_wrap;
 	rm->zero = false;
+	rm->set_bar0_window_addr = hw->set_bar0_window_addr;
 
 	ret = nv50_instmem_new_(rm, device, type, inst, pinstmem);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index dd5b5a17ece0..0ef66d7d5e51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -65,7 +65,7 @@ nv50_instobj_wr32_slow(struct nvkm_memory *memory, u64 offset, u32 data)
 
 	spin_lock_irqsave(&imem->base.lock, flags);
 	if (unlikely(imem->addr != base)) {
-		nvkm_wr32(device, 0x001700, base >> 16);
+		imem->base.func->set_bar0_window_addr(device, base);
 		imem->addr = base;
 	}
 	nvkm_wr32(device, 0x700000 + addr, data);
@@ -85,7 +85,7 @@ nv50_instobj_rd32_slow(struct nvkm_memory *memory, u64 offset)
 
 	spin_lock_irqsave(&imem->base.lock, flags);
 	if (unlikely(imem->addr != base)) {
-		nvkm_wr32(device, 0x001700, base >> 16);
+		imem->base.func->set_bar0_window_addr(device, base);
 		imem->addr = base;
 	}
 	data = nvkm_rd32(device, 0x700000 + addr);
@@ -394,6 +394,12 @@ nv50_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
  * instmem subdev implementation
  *****************************************************************************/
 
+static void
+nv50_instmem_set_bar0_window_addr(struct nvkm_device *device, u64 addr)
+{
+	nvkm_wr32(device, 0x001700, addr >> 16);
+}
+
 static void
 nv50_instmem_fini(struct nvkm_instmem *base)
 {
@@ -415,6 +421,7 @@ nv50_instmem = {
 	.memory_new = nv50_instobj_new,
 	.memory_wrap = nv50_instobj_wrap,
 	.zero = false,
+	.set_bar0_window_addr = nv50_instmem_set_bar0_window_addr,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index 4c14c96fb60a..d5b5fcd9262b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -16,6 +16,7 @@ struct nvkm_instmem_func {
 			  bool zero, struct nvkm_memory **);
 	int (*memory_wrap)(struct nvkm_instmem *, struct nvkm_memory *, struct nvkm_memory **);
 	bool zero;
+	void (*set_bar0_window_addr)(struct nvkm_device *, u64 addr);
 };
 
 int nv50_instmem_new_(const struct nvkm_instmem_func *, struct nvkm_device *,
-- 
2.49.0

