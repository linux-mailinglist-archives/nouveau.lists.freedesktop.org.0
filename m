Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBBAA3CA8
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843E310E5B4;
	Tue, 29 Apr 2025 23:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHWSXUFt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFAC10E5B4
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrSTzeJp/+NfexLk0BGo0RoaBGEwVVbsSrSKWy7lQcwrrqW9M/4bJ/1+7TbiouAwiMhusbZlHbASLlGU/saVwm/SRsFGJ/V5/G5Qoq4XmLgToq8otfWYKoPOB0TGLtSODlvqFyNyKN5M8qCu9dNhXJrjpN3Jl9QV6K+EYjGHlq9cH/QN62NAnOKChMACegDcj0u2Y4hR1LWuhHAQ3y/+QzSKrMmAQyylx+aR/AO9Cv/G+VFh2S55XYs/EbN64sAKQK78Gjzbjw3fo5g1H/SE3BijMsWZECyTtuHQIWZxT7RqzzuQGgUU4Gh3bi1C58ACh5SpNSMqCayUmJeG8N1icg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9DMNElVnBdX+uXRD0tTM7wF6ChWLCzGJW9+5uITS0E=;
 b=hC5vREMw7n/9FJF+AevDze1V2oqunVG1el0aJCYVbzh03OQeGo0wB1CtLp8r/F3C/nOxjz4AK3a2JQU6hFft6XVnPtftHKcytYu3wQSp/px23WT46Ih9VZI03hJL21BDLceeVwa3xFiiGKGUFJP5MPuLrejTnMbrsV8AN0WOSrfQ3BfoeDRBjkmDzehozMI+lBHhJqEmSCNv0LGzk4FDVVj/im6fcyu8xFQTe/9csH4aqI4mUPk8FmEPkfYAlXy0mnWIkkBsqc9XsaaZItZJkEX6EyrzEtUdAvW7P8skUqysBMT1McX4MUSpWUyndFns5zP/WDmh1yoDj+sPBFjp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9DMNElVnBdX+uXRD0tTM7wF6ChWLCzGJW9+5uITS0E=;
 b=NHWSXUFtgL9+g8Zpa7shNFoTwyg5UxCpfr7zbRafmz27Abdnbs2dalqoQobIr46aKke7Dod4QN2N446t7eyau0Y6U5gYvUeplGIW8wUCNZ6dhMlrtIAGWlILYE3ihNp8Jc6hb6qvk8TDFP8D7GJkcY00MrJmt6A0Y3DqU7d4u7e7KpmHGHHww+CmpI7pRdHtYX4zkTY0FiPS5RBCBflul1W+RYedU6AxJyGbmawCSVjvJ4HThGi8TUBQrUdeDyBVcyb4yWTYNjKeVvL2ZmnjM6be7XvTRcSb+PTNYRk3XgRBiNhi6dNVYs186qXWW0sSZDpB7DlLD/l5FNEP/DMqJQ==
Received: from SA1P222CA0045.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::22)
 by SN7PR12MB6837.namprd12.prod.outlook.com (2603:10b6:806:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:55 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::96) by SA1P222CA0045.outlook.office365.com
 (2603:10b6:806:2d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:55 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:41 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 51/60] drm/nouveau: improve handling of 64-bit BARs
Date: Wed, 30 Apr 2025 09:39:19 +1000
Message-ID: <20250429233929.24363-52-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SN7PR12MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6724374c-5070-47d1-b715-08dd87774958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BDRPXii8pEnOllHXQDNrVewmCz0bY2ZQTe9Vyhy9CWmW6Hdt5+dHLEY2Ls3u?=
 =?us-ascii?Q?kQxiwyKxHq4LjYP/I2BAd1J+ws05ONOYpahsPkqPt0SGRsdW2tSZVwnwMz0B?=
 =?us-ascii?Q?g4HZ9zkVlAZkeU5DbGv9ix01Lq6LT35jUr/Q0j2ILpZM8wTahI6lUbyvxpwC?=
 =?us-ascii?Q?FDSQEZ5O583Aq6NnxQOGO/f6ma9wRcex52l1wvaJMaUJl105phNTjb3QL+KN?=
 =?us-ascii?Q?g1/pipwqH+4fdfRs6C4+ZlrytMr2Z6Y5R/hk+0El+lg2GLbw1l+I5aJU6nnz?=
 =?us-ascii?Q?QHV48Xq+eOP60NAlWi6NYNLjqGvuzTZo1zBMp7RnXDXj/LKTkGjH4ypVNIhV?=
 =?us-ascii?Q?C8/Gv0zycHuSzw3lOejg4tv7pNhZ5sxjVfV2IL0Ul6Z7CljPPiWX6VrHHgHX?=
 =?us-ascii?Q?Mq7tqXTNWHlDRE1uAMo7u158CEL+d2gFquBUH7v0L/IQpX1iQnPK80tbWnuj?=
 =?us-ascii?Q?AHdKG8Q65BoMIxkL7Sn2xrcMPPv8cOtxuqmu3SswjOT7iCMAPOwiQ5/7Z8H2?=
 =?us-ascii?Q?3BX9EteFgRNNbgcig1cH3C83Cs05Jazxcr2L6B7+tB88TGinfoPNA6iNbb5f?=
 =?us-ascii?Q?VKRdYBDiLzG0jlwe+68h8gV3SdVKvEUbnNpsO172IPRyFESwuJgS+Y0bmB1U?=
 =?us-ascii?Q?Vu8Dh5/KB4MI85c8faBHH3het3olcBzOs6L/9iCYmQnqcp8CDDY5CRMNF5Po?=
 =?us-ascii?Q?byrfTRtKQFGLxuJCgy2FcRF4odmGbZqnRb9rcfddcq60m/TpQUV8uDvCJXBa?=
 =?us-ascii?Q?QiCTCmVc+DhelEt4C6Bx7n3TmrFYHlkLBFaCuN2Vbrx5Wty9HCFCMlcfu6ep?=
 =?us-ascii?Q?wGsk0vbUtl7X9ZmdjJw+z7ZTb4sE69VzlU84J3oQ2PZiavl65UD46WQCNYtv?=
 =?us-ascii?Q?FYXumygkh1mcKC2+DyOJsYZhRGIfxARSJyApLHtfkp03br3R6YuFon7yv+xp?=
 =?us-ascii?Q?S42x8L8Cc9fbdRuR+0YH5KcxyNiimg9OvA4ih50Vta87+0W3C1I0nn8EHcwG?=
 =?us-ascii?Q?xfvvjCjVvPWOziH9jJt/Ric94h3hXBBWhi6lrk2wS8o58zKBFnd8sstuThYS?=
 =?us-ascii?Q?dUBQzfis8TFa3Ig1LBgb61BTKBFaOMDI5rjn4fvHVb6tSTdP7wqeaU2E8FSz?=
 =?us-ascii?Q?pDG35cIYOTduB45ZdS+cx48oA0aR1psWuWJKagDRQxM4L6W9AggjmiE7cdxK?=
 =?us-ascii?Q?Qi40E6Q6IfDRzXZyfKfbjU/KYSW9tPQIsUwl0ndRjs3UJihk/7MfUEsLK/Vf?=
 =?us-ascii?Q?SEuq3gzzTPszL1RbFtnjKANmljvfCeRMu7RoZpnKpy47tK4f1kzPxZJPo09O?=
 =?us-ascii?Q?w7nbEds0iDbNOrz8724uT53Xqn701CpsdSfComvkkiG49rmrOcU0E4Rqe2QU?=
 =?us-ascii?Q?D92uK9QKdlnjpFcOJmBeFajciKVyJsvSdz+JAh4ZZPkGDmR07smAtZ7TZ6Y1?=
 =?us-ascii?Q?XF1kz0an4V4VBIJ6K9DdGtopacSo4m+HUlSE5/0rZVKeohodfnaQEJmAc3eq?=
 =?us-ascii?Q?lHqbknZxEjYPq/06T4kCorHjKfPGjsR9D4WT?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:55.6539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6724374c-5070-47d1-b715-08dd87774958
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6837
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

GPUs exist now with a 64-bit BAR0, which mean that BAR1 and BAR2's
indices (as passed to pci_resource_len() etc) are bumped up by one.

Modify nvkm_device.resource_addr/size() to take an enum instead of
an integer bar index, and take IORESOURCE_MEM_64 into account when
translating to the "raw" bar id.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/device.h    | 11 +++++--
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 +--
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  4 ++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 12 +++----
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  4 +--
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  | 32 ++++++++++++++++---
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 18 ++++++++---
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  4 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  6 ++--
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gf100.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  4 +--
 .../gpu/drm/nouveau/nvkm/engine/fifo/gv100.c  |  1 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv40.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv50.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   | 14 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/bar/nv50.c    |  4 +--
 .../drm/nouveau/nvkm/subdev/devinit/fbmem.h   |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  6 ++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  6 ++--
 .../drm/nouveau/nvkm/subdev/instmem/nv40.c    | 10 ++----
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/mmu/memgf100.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c    |  2 +-
 36 files changed, 109 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 46afb877a296..f50f52d4dc3f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -77,6 +77,13 @@ struct nvkm_device {
 struct nvkm_subdev *nvkm_device_subdev(struct nvkm_device *, int type, int inst);
 struct nvkm_engine *nvkm_device_engine(struct nvkm_device *, int type, int inst);
 
+enum nvkm_bar_id {
+	NVKM_BAR_INVALID = 0,
+	NVKM_BAR0_PRI,
+	NVKM_BAR1_FB,
+	NVKM_BAR2_INST,
+};
+
 struct nvkm_device_func {
 	struct nvkm_device_pci *(*pci)(struct nvkm_device *);
 	struct nvkm_device_tegra *(*tegra)(struct nvkm_device *);
@@ -85,8 +92,8 @@ struct nvkm_device_func {
 	int (*init)(struct nvkm_device *);
 	void (*fini)(struct nvkm_device *, bool suspend);
 	int (*irq)(struct nvkm_device *);
-	resource_size_t (*resource_addr)(struct nvkm_device *, unsigned bar);
-	resource_size_t (*resource_size)(struct nvkm_device *, unsigned bar);
+	resource_size_t (*resource_addr)(struct nvkm_device *, enum nvkm_bar_id);
+	resource_size_t (*resource_size)(struct nvkm_device *, enum nvkm_bar_id);
 	bool cpu_coherent;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index da8efe134f16..df11d085ae24 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -315,7 +315,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		break;
 	}
 	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
-		getparam->value = nvkm_device->func->resource_size(nvkm_device, 1);
+		getparam->value = nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
 		break;
 	case NOUVEAU_GETPARAM_VRAM_USED: {
 		struct ttm_resource_manager *vram_mgr = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2016c1e7242f..9ab8380feb39 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1204,7 +1204,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 		fallthrough;	/* tiled memory */
 	case TTM_PL_VRAM:
 		reg->bus.offset = (reg->start << PAGE_SHIFT) +
-			device->func->resource_addr(device, 1);
+			device->func->resource_addr(device, NVKM_BAR1_FB);
 		reg->bus.is_iomem = true;
 
 		/* Some BARs do not support being ioremapped WC */
@@ -1295,7 +1295,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nvkm_device *device = nvxx_device(drm);
-	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
+	u32 mappable = device->func->resource_size(device, NVKM_BAR1_FB) >> PAGE_SHIFT;
 	int i, ret;
 
 	/* as long as the bo isn't in vram, and isn't tiled, we've got
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1286a664f688..5bcd29809c1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -209,13 +209,15 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 	} else
 	if (chan->push.buffer->bo.resource->mem_type == TTM_PL_VRAM) {
 		if (device->info.family == NV_DEVICE_INFO_V0_TNT) {
+			struct nvkm_device *nvkm_device = nvxx_device(drm);
+
 			/* nv04 vram pushbuf hack, retarget to its location in
 			 * the framebuffer bar rather than direct vram access..
 			 * nfi why this exists, it came from the -nv ddx.
 			 */
 			args.target = NV_DMA_V0_TARGET_PCI;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
-			args.start = nvxx_device(drm)->func->resource_addr(nvxx_device(drm), 1);
+			args.start = nvkm_device->func->resource_addr(nvkm_device, NVKM_BAR1_FB);
 			args.limit = args.start + device->info.ram_user - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VRAM;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index e244927eb5d4..7d2436e5d50d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -312,8 +312,8 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	/* VRAM init */
 	drm->gem.vram_available = drm->client.device.info.ram_user;
 
-	arch_io_reserve_memtype_wc(device->func->resource_addr(device, 1),
-				   device->func->resource_size(device, 1));
+	arch_io_reserve_memtype_wc(device->func->resource_addr(device, NVKM_BAR1_FB),
+				   device->func->resource_size(device, NVKM_BAR1_FB));
 
 	ret = nouveau_ttm_init_vram(drm);
 	if (ret) {
@@ -321,8 +321,8 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		return ret;
 	}
 
-	drm->ttm.mtrr = arch_phys_wc_add(device->func->resource_addr(device, 1),
-					 device->func->resource_size(device, 1));
+	drm->ttm.mtrr = arch_phys_wc_add(device->func->resource_addr(device, NVKM_BAR1_FB),
+					 device->func->resource_size(device, NVKM_BAR1_FB));
 
 	/* GART init */
 	if (!drm->agp.bridge) {
@@ -357,7 +357,7 @@ nouveau_ttm_fini(struct nouveau_drm *drm)
 
 	arch_phys_wc_del(drm->ttm.mtrr);
 	drm->ttm.mtrr = 0;
-	arch_io_free_memtype_wc(device->func->resource_addr(device, 1),
-				device->func->resource_size(device, 1));
+	arch_io_free_memtype_wc(device->func->resource_addr(device, NVKM_BAR1_FB),
+				device->func->resource_size(device, NVKM_BAR1_FB));
 
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 0cd20d0f8782..ebcaf2ecff48 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3027,8 +3027,8 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	device->debug = nvkm_dbgopt(device->dbgopt, "device");
 	INIT_LIST_HEAD(&device->subdev);
 
-	mmio_base = device->func->resource_addr(device, 0);
-	mmio_size = device->func->resource_size(device, 0);
+	mmio_base = device->func->resource_addr(device, NVKM_BAR0_PRI);
+	mmio_size = device->func->resource_size(device, NVKM_BAR0_PRI);
 
 	device->pri = ioremap(mmio_base, mmio_size);
 	if (device->pri == NULL) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
index 3ff6436007fa..8f0261a0d618 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
@@ -1560,18 +1560,42 @@ nvkm_device_pci(struct nvkm_device *device)
 	return container_of(device, struct nvkm_device_pci, device);
 }
 
+static int
+nvkm_device_pci_resource_idx(struct nvkm_device_pci *pdev, enum nvkm_bar_id bar)
+{
+	int idx = 0;
+
+	if (bar == NVKM_BAR0_PRI)
+		return idx;
+
+	idx += (pci_resource_flags(pdev->pdev, idx) & IORESOURCE_MEM_64) ? 2 : 1;
+	if (bar == NVKM_BAR1_FB)
+		return idx;
+
+	idx += (pci_resource_flags(pdev->pdev, idx) & IORESOURCE_MEM_64) ? 2 : 1;
+	if (bar == NVKM_BAR2_INST)
+		return idx;
+
+	WARN_ON(1);
+	return -1;
+}
+
 static resource_size_t
-nvkm_device_pci_resource_addr(struct nvkm_device *device, unsigned bar)
+nvkm_device_pci_resource_addr(struct nvkm_device *device, enum nvkm_bar_id bar)
 {
 	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
-	return pci_resource_start(pdev->pdev, bar);
+	int idx = nvkm_device_pci_resource_idx(pdev, bar);
+
+	return idx >= 0 ? pci_resource_start(pdev->pdev, idx) : 0;
 }
 
 static resource_size_t
-nvkm_device_pci_resource_size(struct nvkm_device *device, unsigned bar)
+nvkm_device_pci_resource_size(struct nvkm_device *device, enum nvkm_bar_id bar)
 {
 	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
-	return pci_resource_len(pdev->pdev, bar);
+	int idx = nvkm_device_pci_resource_idx(pdev, bar);
+
+	return idx >= 0 ? pci_resource_len(pdev->pdev, idx) : 0;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 78a83f904bbd..f7f21d9ed6ef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -186,21 +186,31 @@ nvkm_device_tegra(struct nvkm_device *device)
 }
 
 static struct resource *
-nvkm_device_tegra_resource(struct nvkm_device *device, unsigned bar)
+nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 {
 	struct nvkm_device_tegra *tdev = nvkm_device_tegra(device);
-	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, bar);
+	int idx;
+
+	switch (bar) {
+	case NVKM_BAR0_PRI: idx = 0; break;
+	case NVKM_BAR1_FB : idx = 1; break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
 }
 
 static resource_size_t
-nvkm_device_tegra_resource_addr(struct nvkm_device *device, unsigned bar)
+nvkm_device_tegra_resource_addr(struct nvkm_device *device, enum nvkm_bar_id bar)
 {
 	struct resource *res = nvkm_device_tegra_resource(device, bar);
 	return res ? res->start : 0;
 }
 
 static resource_size_t
-nvkm_device_tegra_resource_size(struct nvkm_device *device, unsigned bar)
+nvkm_device_tegra_resource_size(struct nvkm_device *device, enum nvkm_bar_id bar)
 {
 	struct resource *res = nvkm_device_tegra_resource(device, bar);
 	return res ? resource_size(res) : 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 3651d9bf5655..cc104b684701 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -211,8 +211,8 @@ nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 	struct nvkm_udevice *udev = nvkm_udevice(object);
 	struct nvkm_device *device = udev->device;
 	*type = NVKM_OBJECT_MAP_IO;
-	*addr = device->func->resource_addr(device, 0);
-	*size = device->func->resource_size(device, 0);
+	*addr = device->func->resource_addr(device, NVKM_BAR0_PRI);
+	*size = device->func->resource_size(device, NVKM_BAR0_PRI);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index 4e43ee383c34..9b84e357d354 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -49,7 +49,7 @@ nvkm_disp_chan_map(struct nvkm_object *object, void *argv, u32 argc,
 {
 	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
 	struct nvkm_device *device = chan->disp->engine.subdev.device;
-	const u64 base = device->func->resource_addr(device, 0);
+	const u64 base = device->func->resource_addr(device, NVKM_BAR0_PRI);
 
 	*type = NVKM_OBJECT_MAP_IO;
 	*addr = base + chan->func->user(chan, size);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index cfa3698d3a2f..614921166fba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -805,7 +805,7 @@ gv100_disp_caps_map(struct nvkm_object *object, void *argv, u32 argc,
 	struct gv100_disp_caps *caps = gv100_disp_caps(object);
 	struct nvkm_device *device = caps->disp->engine.subdev.device;
 	*type = NVKM_OBJECT_MAP_IO;
-	*addr = 0x640000 + device->func->resource_addr(device, 0);
+	*addr = 0x640000 + device->func->resource_addr(device, NVKM_BAR0_PRI);
 	*size = 0x1000;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 22443fe4a39f..a3af43c2407b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -303,7 +303,7 @@ nvkm_fifo_oneinit(struct nvkm_engine *engine)
 	}
 
 	/* Allocate USERD + BAR1 polling area. */
-	if (fifo->func->chan.func->userd->bar == 1) {
+	if (fifo->func->chan.func->userd->bar == NVKM_BAR1_FB) {
 		struct nvkm_vmm *bar1 = nvkm_bar_bar1_vmm(device);
 
 		ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, fifo->chid->nr *
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..82d96e0995c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -359,14 +359,14 @@ nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int ru
 	/* Validate arguments against class requirements. */
 	if ((runq && runq >= runl->func->runqs) ||
 	    (!func->inst->vmm != !vmm) ||
-	    ((func->userd->bar < 0) == !userd) ||
+	    (!func->userd->bar == !userd) ||
 	    (!func->ramfc->ctxdma != !dmaobj) ||
 	    ((func->ramfc->devm < devm) && devm != BIT(0)) ||
 	    (!func->ramfc->priv && priv)) {
 		RUNL_DEBUG(runl, "args runq:%d:%d vmm:%d:%p userd:%d:%p "
 				 "push:%d:%p devm:%08x:%08x priv:%d:%d",
 			   runl->func->runqs, runq, func->inst->vmm, vmm,
-			   func->userd->bar < 0, userd, func->ramfc->ctxdma, dmaobj,
+			   func->userd->bar, userd, func->ramfc->ctxdma, dmaobj,
 			   func->ramfc->devm, devm, func->ramfc->priv, priv);
 		return -EINVAL;
 	}
@@ -444,7 +444,7 @@ nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int ru
 	if (!chan->func->id_get) {
 		chan->id = nvkm_chid_get(runl->chid, chan);
 		if (chan->id >= 0) {
-			if (func->userd->bar < 0) {
+			if (!func->userd->bar) {
 				if (ouserd + chan->func->userd->size >=
 					nvkm_memory_size(userd)) {
 					RUNL_DEBUG(runl, "ouserd %llx", ouserd);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
index 013682a709d5..2bb6e4420aab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
@@ -27,7 +27,7 @@ struct nvkm_chan_func {
 	} *inst;
 
 	const struct nvkm_chan_func_userd {
-		int bar;
+		enum nvkm_bar_id bar;
 		u32 base;
 		u32 size;
 		void (*clear)(struct nvkm_chan *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
index 6c94451d0faa..e4a4fad2eafc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -133,7 +133,7 @@ gf100_chan_userd_clear(struct nvkm_chan *chan)
 
 static const struct nvkm_chan_func_userd
 gf100_chan_userd = {
-	.bar = 1,
+	.bar = NVKM_BAR1_FB,
 	.size = 0x1000,
 	.clear = gf100_chan_userd_clear,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index d8a4d773a58c..5655eda52a7b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -113,7 +113,7 @@ gk104_chan_ramfc = {
 
 const struct nvkm_chan_func_userd
 gk104_chan_userd = {
-	.bar = 1,
+	.bar = NVKM_BAR1_FB,
 	.size = 0x200,
 	.clear = gf100_chan_userd_clear,
 };
@@ -745,7 +745,7 @@ gk104_fifo_init(struct nvkm_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->engine.subdev.device;
 
-	if (fifo->func->chan.func->userd->bar == 1)
+	if (fifo->func->chan.func->userd->bar == NVKM_BAR1_FB)
 		nvkm_wr32(device, 0x002254, 0x10000000 | fifo->userd.bar1->addr >> 12);
 
 	nvkm_wr32(device, 0x002100, 0xffffffff);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
index 33066c8cdc64..d7f046c03cfd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
@@ -70,7 +70,6 @@ gv100_chan_ramfc = {
 
 const struct nvkm_chan_func_userd
 gv100_chan_userd = {
-	.bar = -1,
 	.size = 0x200,
 	.clear = gf100_chan_userd_clear,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
index 674faf002b20..c4b8e567d86f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -154,7 +154,7 @@ nv04_chan_ramfc = {
 
 const struct nvkm_chan_func_userd
 nv04_chan_userd = {
-	.bar = 0,
+	.bar = NVKM_BAR0_PRI,
 	.base = 0x800000,
 	.size = 0x010000,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
index e50a94b6d7f8..084ca5561ee1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
@@ -93,7 +93,7 @@ nv40_chan_ramfc = {
 
 static const struct nvkm_chan_func_userd
 nv40_chan_userd = {
-	.bar = 0,
+	.bar = NVKM_BAR0_PRI,
 	.base = 0xc00000,
 	.size = 0x001000,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c
index 954b5f3a7d57..7bf77661157d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c
@@ -124,7 +124,7 @@ nv50_chan_ramfc = {
 
 const struct nvkm_chan_func_userd
 nv50_chan_userd = {
-	.bar = 0,
+	.bar = NVKM_BAR0_PRI,
 	.base = 0xc00000,
 	.size = 0x002000,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 9e56bcc166ed..52420a1edca5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -258,7 +258,7 @@ nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
 	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
 	struct nvkm_device *device = chan->cgrp->runl->fifo->engine.subdev.device;
 
-	if (chan->func->userd->bar < 0)
+	if (!chan->func->userd->bar)
 		return -ENOSYS;
 
 	*type = NVKM_OBJECT_MAP_IO;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
index 02a8c62a0a32..13407fafe947 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
@@ -297,7 +297,7 @@ nv20_gr_init(struct nvkm_gr *base)
 	nvkm_wr32(device, NV10_PGRAPH_SURFACE, tmp);
 
 	/* begin RAM config */
-	vramsz = device->func->resource_size(device, 1) - 1;
+	vramsz = device->func->resource_size(device, NVKM_BAR1_FB) - 1;
 	nvkm_wr32(device, 0x4009A4, nvkm_rd32(device, 0x100200));
 	nvkm_wr32(device, 0x4009A8, nvkm_rd32(device, 0x100204));
 	nvkm_wr32(device, NV10_PGRAPH_RDI_INDEX, 0x00EA0000);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
index a5e1f02791b4..b609b0150ba1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
@@ -386,7 +386,7 @@ nv40_gr_init(struct nvkm_gr *base)
 	}
 
 	/* begin RAM config */
-	vramsz = device->func->resource_size(device, 1) - 1;
+	vramsz = device->func->resource_size(device, NVKM_BAR1_FB) - 1;
 	switch (device->chipset) {
 	case 0x40:
 		nvkm_wr32(device, 0x4009A4, nvkm_rd32(device, 0x100200));
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
index 51070b7dda85..e5e60915029c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
@@ -82,7 +82,7 @@ gf100_bar_bar2_init(struct nvkm_bar *base)
 
 static int
 gf100_bar_oneinit_bar(struct gf100_bar *bar, struct gf100_barN *bar_vm,
-		      struct lock_class_key *key, int bar_nr)
+		      struct lock_class_key *key, enum nvkm_bar_id bar_id)
 {
 	struct nvkm_device *device = bar->base.subdev.device;
 	resource_size_t bar_len;
@@ -93,14 +93,14 @@ gf100_bar_oneinit_bar(struct gf100_bar *bar, struct gf100_barN *bar_vm,
 	if (ret)
 		return ret;
 
-	bar_len = device->func->resource_size(device, bar_nr);
+	bar_len = device->func->resource_size(device, bar_id);
 	if (!bar_len)
 		return -ENOMEM;
-	if (bar_nr == 3 && bar->bar2_halve)
+	if (bar_id == NVKM_BAR2_INST && bar->bar2_halve)
 		bar_len >>= 1;
 
 	ret = nvkm_vmm_new(device, 0, bar_len, NULL, 0, key,
-			   (bar_nr == 3) ? "bar2" : "bar1", &bar_vm->vmm);
+			   (bar_id == NVKM_BAR2_INST) ? "bar2" : "bar1", &bar_vm->vmm);
 	if (ret)
 		return ret;
 
@@ -110,7 +110,7 @@ gf100_bar_oneinit_bar(struct gf100_bar *bar, struct gf100_barN *bar_vm,
 	/*
 	 * Bootstrap page table lookup.
 	 */
-	if (bar_nr == 3) {
+	if (bar_id == NVKM_BAR2_INST) {
 		ret = nvkm_vmm_boot(bar_vm->vmm);
 		if (ret)
 			return ret;
@@ -129,7 +129,7 @@ gf100_bar_oneinit(struct nvkm_bar *base)
 
 	/* BAR2 */
 	if (bar->base.func->bar2.init) {
-		ret = gf100_bar_oneinit_bar(bar, &bar->bar[0], &bar2_lock, 3);
+		ret = gf100_bar_oneinit_bar(bar, &bar->bar[0], &bar2_lock, NVKM_BAR2_INST);
 		if (ret)
 			return ret;
 
@@ -138,7 +138,7 @@ gf100_bar_oneinit(struct nvkm_bar *base)
 	}
 
 	/* BAR1 */
-	ret = gf100_bar_oneinit_bar(bar, &bar->bar[1], &bar1_lock, 1);
+	ret = gf100_bar_oneinit_bar(bar, &bar->bar[1], &bar1_lock, NVKM_BAR1_FB);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c
index 27d8a1be43e4..6a881becb02c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c
@@ -127,7 +127,7 @@ nv50_bar_oneinit(struct nvkm_bar *base)
 
 	/* BAR2 */
 	start = 0x0100000000ULL;
-	size = device->func->resource_size(device, 3);
+	size = device->func->resource_size(device, NVKM_BAR2_INST);
 	if (!size)
 		return -ENOMEM;
 	limit = start + size;
@@ -167,7 +167,7 @@ nv50_bar_oneinit(struct nvkm_bar *base)
 
 	/* BAR1 */
 	start = 0x0000000000ULL;
-	size = device->func->resource_size(device, 1);
+	size = device->func->resource_size(device, NVKM_BAR1_FB);
 	if (!size)
 		return -ENOMEM;
 	limit = start + size;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h
index 6c5bbff12eb4..b918e22df5a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h
@@ -47,8 +47,8 @@
 static inline struct io_mapping *
 fbmem_init(struct nvkm_device *dev)
 {
-	return io_mapping_create_wc(dev->func->resource_addr(dev, 1),
-				    dev->func->resource_size(dev, 1));
+	return io_mapping_create_wc(dev->func->resource_addr(dev, NVKM_BAR1_FB),
+				    dev->func->resource_size(dev, NVKM_BAR1_FB));
 }
 
 static inline void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
index c123e5893d76..cd2fbc0472d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -50,7 +50,7 @@ nvkm_ufault_map(struct nvkm_object *object, void *argv, u32 argc,
 	struct nvkm_fault_buffer *buffer = nvkm_fault_buffer(object);
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	*type = NVKM_OBJECT_MAP_IO;
-	*addr = device->func->resource_addr(device, 3) + buffer->addr;
+	*addr = device->func->resource_addr(device, NVKM_BAR2_INST) + buffer->addr;
 	*size = nvkm_memory_size(buffer->mem);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index 91242f09648e..d06bf95b9a4a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -191,7 +191,7 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	}
 	*pbar = bar;
 
-	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
+	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, NVKM_BAR2_INST), PAGE_SIZE);
 	if (!bar->flushBAR2PhysMode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index c553c415d7b0..04c34f3d2d25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -902,9 +902,9 @@ r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 	if (IS_ERR(info))
 		return PTR_ERR(info);
 
-	info->gpuPhysAddr = device->func->resource_addr(device, 0);
-	info->gpuPhysFbAddr = device->func->resource_addr(device, 1);
-	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
+	info->gpuPhysAddr = device->func->resource_addr(device, NVKM_BAR0_PRI);
+	info->gpuPhysFbAddr = device->func->resource_addr(device, NVKM_BAR1_FB);
+	info->gpuPhysInstAddr = device->func->resource_addr(device, NVKM_BAR2_INST);
 	info->nvDomainBusDeviceFunc = pci_dev_id(pdev->pdev);
 	info->maxUserVa = TASK_SIZE;
 	info->pciConfigMirrorBase = device->pci->func->cfg.addr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 18be95f429c2..8abf64c1d2d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -170,9 +170,9 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
 	if (IS_ERR(info))
 		return PTR_ERR(info);
 
-	info->gpuPhysAddr = device->func->resource_addr(device, 0);
-	info->gpuPhysFbAddr = device->func->resource_addr(device, 1);
-	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
+	info->gpuPhysAddr = device->func->resource_addr(device, NVKM_BAR0_PRI);
+	info->gpuPhysFbAddr = device->func->resource_addr(device, NVKM_BAR1_FB);
+	info->gpuPhysInstAddr = device->func->resource_addr(device, NVKM_BAR2_INST);
 	info->nvDomainBusDeviceFunc = pci_dev_id(pdev);
 	info->maxUserVa = TASK_SIZE;
 	info->pciConfigMirrorBase = device->pci->func->cfg.addr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c
index 6b462f960922..2544b9f0ec85 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c
@@ -239,7 +239,6 @@ nv40_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int ins
 		 struct nvkm_instmem **pimem)
 {
 	struct nv40_instmem *imem;
-	int bar;
 
 	if (!(imem = kzalloc(sizeof(*imem), GFP_KERNEL)))
 		return -ENOMEM;
@@ -247,13 +246,8 @@ nv40_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int ins
 	*pimem = &imem->base;
 
 	/* map bar */
-	if (device->func->resource_size(device, 2))
-		bar = 2;
-	else
-		bar = 3;
-
-	imem->iomem = ioremap_wc(device->func->resource_addr(device, bar),
-				 device->func->resource_size(device, bar));
+	imem->iomem = ioremap_wc(device->func->resource_addr(device, NVKM_BAR2_INST),
+				 device->func->resource_size(device, NVKM_BAR2_INST));
 	if (!imem->iomem) {
 		nvkm_error(&imem->base.subdev, "unable to map PRAMIN BAR\n");
 		return -EFAULT;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 0ef66d7d5e51..9d29e5234734 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -172,7 +172,7 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvkm_vmm *vmm)
 
 	/* Make the mapping visible to the host. */
 	iobj->bar = bar;
-	iobj->map = ioremap_wc(device->func->resource_addr(device, 3) +
+	iobj->map = ioremap_wc(device->func->resource_addr(device, NVKM_BAR2_INST) +
 			       (u32)iobj->bar->addr, size);
 	if (!iobj->map) {
 		nvkm_warn(subdev, "PRAMIN ioremap failed\n");
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c
index d9c9bee45222..160a5749a29f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c
@@ -60,7 +60,7 @@ gf100_mem_map(struct nvkm_mmu *mmu, struct nvkm_memory *memory, void *argv,
 	if (ret)
 		return ret;
 
-	*paddr = device->func->resource_addr(device, 1) + (*pvma)->addr;
+	*paddr = device->func->resource_addr(device, NVKM_BAR1_FB) + (*pvma)->addr;
 	*psize = (*pvma)->size;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c
index 79a3b0cc9f5b..1e3db52de6cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c
@@ -41,7 +41,7 @@ nv04_mem_map(struct nvkm_mmu *mmu, struct nvkm_memory *memory, void *argv,
 	if ((ret = nvif_unvers(ret, &argv, &argc, args->vn)))
 		return ret;
 
-	*paddr = device->func->resource_addr(device, 1) + addr;
+	*paddr = device->func->resource_addr(device, NVKM_BAR1_FB) + addr;
 	*psize = nvkm_memory_size(memory);
 	*pvma = ERR_PTR(-ENODEV);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c
index 46759b89fc1f..33b2321e9d87 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c
@@ -57,7 +57,7 @@ nv50_mem_map(struct nvkm_mmu *mmu, struct nvkm_memory *memory, void *argv,
 	if (ret)
 		return ret;
 
-	*paddr = device->func->resource_addr(device, 1) + (*pvma)->addr;
+	*paddr = device->func->resource_addr(device, NVKM_BAR1_FB) + (*pvma)->addr;
 	*psize = (*pvma)->size;
 	return nvkm_memory_map(memory, 0, bar, *pvma, &uvmm, sizeof(uvmm));
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
index c5460a14c541..4e64d8843373 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
@@ -36,7 +36,7 @@ nvkm_uvfn_map(struct nvkm_object *object, void *argv, u32 argc,
 	struct nvkm_vfn *vfn = nvkm_uvfn(object)->vfn;
 	struct nvkm_device *device = vfn->subdev.device;
 
-	*addr = device->func->resource_addr(device, 0) + vfn->addr.user;
+	*addr = device->func->resource_addr(device, NVKM_BAR0_PRI) + vfn->addr.user;
 	*size = vfn->func->user.size;
 	*type = NVKM_OBJECT_MAP_IO;
 	return 0;
-- 
2.49.0

