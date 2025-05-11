Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D8AB2B7C
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E4810E28B;
	Sun, 11 May 2025 21:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aNEJVkjp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545A110E28B
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfBAEmNTcVDbyr7xgZOid3+I9McYq82OMPFVT7n5nMg2E/1yLDznw8+tWryPk97un0Tp+LmsdgZa14Ze4kSmkDi3oNGIhOki0yJn21AInB1TjQMGGNTqMjzue0xJvLgMOawReTUqIUAS5bbUhjxWfAoeiadtCfvzjIJ+NZUktaFWUDXOMm5deW6XAtqLpR6lg/TgZ5GN/IVlge1YzFZwJxmJIA11ubKwZ86UrJUBsUh6ui2UM4cA0/D0nXIg/EW/IZYqdxUlXp/BIbhJsopYGEQ1NZz/9HZgYoNleabJYfU14bOlIyQTYLvV9Ow/7EKkgBHD74yPPbG85neeyLQGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdwRm8vblOS6fW6NYP89/GYJq/zBv0Lyv+rpWF3CX68=;
 b=gwWblIxOnbZWn6YatJ4sgatn1ksJle9FnAuXiYnvAnCQQA/OR1nRni7bCKyzpfPndikJB4K3ALwlL7HdgArMc1X0BH5mPrfKMCGPVyDqjNcjs2sQhehgEwouKImPYa3LPuhD5bJTE1WaFZUKl8oweJAvZKoUYgWQciI6zDGEwtrTfEVt3tjReGo48vF+kgrMEXHFxkQNvsKhZDj7zvcB6ijsuudGXX1Rxc8quMCGRK7U3QqhI+2gmM2b68+psXhPAtitPmK+R9gcChjAB/lpilA0ichtryP/qLysUxyO5HAgRKZq0u9xGWP2EWJGSVzUZgBzzgbJjfcKjUeb0ETJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdwRm8vblOS6fW6NYP89/GYJq/zBv0Lyv+rpWF3CX68=;
 b=aNEJVkjptyq/V6un2LtTdXxshz7yrz8PK3HHAPWKPPqBlNhlpY+VMCOVFEXsz2mCU2Gkqf1c2rU8uIjfJto0F4/OU3ORC88PEJ/A+C9HAO0IPvx3UpGQkPqBf3xa7M8wGl7ktZzKeKhYyq9NY3YbzOhG86/+IORd0d8i7ryfM5Cy8o7vhmc62RQHkX7x5m8pq7I1C3KuCmsqlhyqxOYZBdPsTg7s6ptP46CZWWXuxTGeoKHHUehiuhHbIa/hWU1wAHN0cpv2xYmS22trfBvbNAfE4FiO4K0dToK07kGCDjt7mqbGKXgci25xTJL8mYJuGKPBQmPt2WYxlcc57EpHMQ==
Received: from DM6PR02CA0106.namprd02.prod.outlook.com (2603:10b6:5:1f4::47)
 by BL4PR12MB9507.namprd12.prod.outlook.com (2603:10b6:208:58d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Sun, 11 May
 2025 21:09:47 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::d1) by DM6PR02CA0106.outlook.office365.com
 (2603:10b6:5:1f4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Sun,
 11 May 2025 21:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:33 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 53/62] drm/nouveau: improve handling of 64-bit BARs
Date: Mon, 12 May 2025 07:07:13 +1000
Message-ID: <20250511210722.80350-54-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BL4PR12MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f3ceaa-a318-43f5-258d-08dd90d02933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SrpPKPPSTcYHEYBUVgoaW95A+YTcaFshwKxJQgz5mqQefEOqyNJjPfxAYpzM?=
 =?us-ascii?Q?rTZi/WW/mp6jlz0B19JDa7kcWxO6O8+jt4j3BA/9uO2vPDvzJ9dFJ6E/bLhl?=
 =?us-ascii?Q?xVp5XQzvVtsMEL5XasuT2U7Kv8c0K+eMDyPn5/PhZRN9GpPMGzewNePJmA2W?=
 =?us-ascii?Q?dgo3LQD/Q013BtSlRtxjaNLRpfyuOBd5LUBdUOGG7Ag8GbyiqYiNusbqCyDJ?=
 =?us-ascii?Q?kzy7OHoELpLnnS+CPJe9ETwsKfZHC9gJMflyz9rIjnpY9KGosQ+3qyp8v/sa?=
 =?us-ascii?Q?t87LZwLnsSKuUYAXBvJFtiKIBsZ7o0t9VA4xEzEjcPfLV6Wxkrk5AsNz6g1k?=
 =?us-ascii?Q?fcjGQ+EwNgsuuAiS9re+ee4u9aWyyev5LXqVweuIA3bhk0u/M7eHWIpC/QnI?=
 =?us-ascii?Q?rWDNVJierjJhLqie5o3XRb2cpdol+CoAYDKOd5NgMoxYJb2NB2ytwJROSWS8?=
 =?us-ascii?Q?FfaSc9vwutR7liA/wOuENORp9lgLK9WdzVVUr9h1fmrI1STNP4vC1cKi1oL+?=
 =?us-ascii?Q?LTI2BZJANIE7BGsUfRDbFuwEVhfYpL5FCaXtEJ5noKTlSUZEu6sG4dtpPs7o?=
 =?us-ascii?Q?CLdDUQi+/GX//Y/Lpz65OROfFn1R6XY0+65oUjxdWgvtUtEdzAoSYf+qYWDt?=
 =?us-ascii?Q?IVuuoI6UPTJt/2QT3GUD1mF+/ehyLtzkv6DkF0BNzpH9NJuElLhEoquJS77j?=
 =?us-ascii?Q?KKw7DbhrU0byPf9J7pZ5M9WCt1JoDeuu5yG0L7wLcLBnxszJ9KEKO1Jj1JT4?=
 =?us-ascii?Q?nqxMH2yF/CTce7bjmnE39T6Pb0+KdjgiAJWknymvWEQ/glzE6Ol509xTsgrI?=
 =?us-ascii?Q?UTAVRhuOfd5RU87OSl/nlu+d1481rHNM/yiF5OFPiRFZCYfeDck8n6U2MAZq?=
 =?us-ascii?Q?5dRnoSRTv2bk+gu0RQ+/zYz3DNIJMOJvBHcLcpORxtRYOWyO+OEmc8N9d8TR?=
 =?us-ascii?Q?/xJ7bfYP4zvrKqlERGCYz1p19J+rPEZyEC1r8HW0kSg9aow9118h+yXYAtyA?=
 =?us-ascii?Q?IuIyLTF/S29XTx44r70+qJjrXMlfLQx2iG0pf20Q6b8BCtjTLKgrqU3GbO65?=
 =?us-ascii?Q?U2eFAvEM0TlOWcD94aGbzYGT8pWyCcnnNlEEHJtvBphyqQDjJLdreZkb24nD?=
 =?us-ascii?Q?lNiFT5lBVDv7bXZCkWPvM77n7JQVr000ewzw1g7DSukDJ8QGwbuZXMW75Zq1?=
 =?us-ascii?Q?ZQZJbmaWCc5VvM5CnE01tit00SMv2aWPq1RNeqKschWNoFJ2YfuGwAtowSZ/?=
 =?us-ascii?Q?Ggk4Fg7GNvI8k+9sS9q3OhF0dwXkN3mz5h27bYEGuHGxgSVwsJyMqXk2zcZZ?=
 =?us-ascii?Q?7bmaPoroNu61ZZAxz/gWkP9SoMhkLwdf+BbEv3Q6WEsxKR2DwroUPJKYC7dQ?=
 =?us-ascii?Q?9OsWbLURr71SRi7akDMpCG6FkoAUKm95T0W33cC8/O3V3rSc+tUDnNRYnSxs?=
 =?us-ascii?Q?7h6wdgs8zkGK03U4vDZrYf6lwyM1CiIM5GFnaysHMzAZgsS2OwVZkjovThmW?=
 =?us-ascii?Q?5ykD5E7O3Kt1QAhm2B1PBsvHeVkwVDibO13p?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:47.3902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f3ceaa-a318-43f5-258d-08dd90d02933
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9507
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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
index a3c070d41923..730dcb645cca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -153,9 +153,9 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
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

