Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4212AB2B73
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2925510E263;
	Sun, 11 May 2025 21:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DvFTX5SU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80A10E25D
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUn/xdaljE80PEp9TzX0/AqZ1mAUQfpuUozOs4kTE8hDheVripxBqdJcse0SWGtIbcaECN7X6S2CT5rdJ65NC1VyYTwEq6cvNnruUS+n/PEkS0yE3mP9RCDWq3bkNrY4jKmGU5/20UZO7l27iDJy20lLl3InXM5fQXXOjs+8cy/wl3D8lIIr+BecqQn+42q5q/kSR2InHwNHfMt8zw4NSzSNuX7id2EA9p+s4UfhNUwwFhob6hzKSatfckAmlpGuTY70aAgrO7fuV6uche1wAM+adhvNOVRSck+6W/UHqEJmvwdDh6/i9ndTNafdWZKZV3ZkvX5FB9NdfUHPpgfPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhcGJZT8iBV0nxwLpN5XMyZWgFovIshJq4reTOfUzWM=;
 b=qcHh0CkvCPAQGT2jSOol8TGJbyo++n/HvLXFWXKOHcIiFgBr0texpJr10SV+K80Bdkn8WVE8SUZG6lwgrRtzGcs0Gh2nTQ3K/jnplVI5Ncl22ENNNRnPO/XCgXHbM/t3V/l0E4CdvGY0FCu1fvjilJ2qNA0YFYUcjBqgdTI7xbA+s+fsy+S/KgbmqWRATbwMVgi1vCX238XaWKU58JC43DbMk9r9Km6mfPeyMdxXfrpcsG4OCKAVvTddPv7fYe9DUGC/hUgZ8FogmBwV/F/uvdDmuqpMSy44UDebcLefGAeWXnxVU6ufpqL8iRDtYgJRBQxzUMUaCIRqBZsSaU6GXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhcGJZT8iBV0nxwLpN5XMyZWgFovIshJq4reTOfUzWM=;
 b=DvFTX5SUtD0h5Vlhy0OEOpRf8ZY7pSk5v0BNQqWG4Oskv2T/aLAIpEQqMvcwLYZTMqawLPM+AYe+VHOuQYc5AjGCvnBt7JazcRa7W7ZETkPw0UHUY893P2KqibhRw2w38MUTrHXUyiLlCL36c/vUngUcXG9Zrxw5vvFt+IoJkaMugf6+Jy6+FuKdg3dAmHhRGgOdGwtjCCUxjZlb0S2DffdWVJLi9PPzfAHf6OxV13pPfetHiCS3/tStKGsarLsfM3vIj7cMaIFZ0DtPb1QZF+L0pMwMjLONgTBi27lVsL9TWC4jvaq7wshytjfshqwCAMbdv049b7RJml0kxxapXw==
Received: from DS0PR17CA0017.namprd17.prod.outlook.com (2603:10b6:8:191::28)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:32 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::31) by DS0PR17CA0017.outlook.office365.com
 (2603:10b6:8:191::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:23 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 47/62] drm/nouveau/instmem: add hal for
 set_bar0_window_addr()
Date: Mon, 12 May 2025 07:07:07 +1000
Message-ID: <20250511210722.80350-48-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b99923b-d82d-40f2-89af-08dd90d02080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GH8pBrtlsIvyNcyLZgeOMvqamhIIcWRduZzVd9ME62+OhGLJ1tlEsoCbN62A?=
 =?us-ascii?Q?k3hHTLmKOCkbkPatZFg0fHVpWUjAKdOzoGU8GSPLfI993UzVMtcsCBQUfdi6?=
 =?us-ascii?Q?0cfRg7/QBmuCWe7OU9oqXIlOehERNYxp8b7UBpC0eUD+pIxNf+ELdXXsi9yL?=
 =?us-ascii?Q?xMF1M7XnUr7kFyE5szY7Sh0JbFU9Q0UARjzjHWx8rwDwyEvYJr5GI5rmJeKz?=
 =?us-ascii?Q?UpOXAQhyMk/MzPsOcxpcG3qqWIFfrrrvFRph75BOsAkFoGGFMgVs5ATI6Cy8?=
 =?us-ascii?Q?6UEslXSDwk6c1uNjBCUJfSmlDhaeO7x+YfBU2X0+J1eTDoS7NrrvA4Hj5IBK?=
 =?us-ascii?Q?WevyI8DUHElwsOwFuFfFRA75iTal/MdL9kNl8GdVwjVyXcRuxl/tzb3M347H?=
 =?us-ascii?Q?3EU/4lks8T9ggFKh8B5aOAvQmmepiLsXhoXppTf8egj+F2ytVs4VvYO/Kjos?=
 =?us-ascii?Q?kCUrBTAhfHM7NjJqev9JkoSG1z6Fzg5f0o2OQ4mjquXNDD/im1k9WmIWU3F/?=
 =?us-ascii?Q?qzMicP8MxOUix/NoPXH96rdjHBhokrtQp34tUq8XAnnTyQ5iqrKz7nfHdkx6?=
 =?us-ascii?Q?pRWk257p6LB35AuT1KaAPPn3uDRtEYcw22O8kGmZAyFizbNWf//hLveqGQnr?=
 =?us-ascii?Q?jPfkTRTm5KaC27FUEBamp8utPMrlp0KeUUUsQSgHKpRfmIxiSBxyDXc/oR1a?=
 =?us-ascii?Q?romTcUU4wBe9aC/CmT05ttTa5mL9fudgsnMBBvfdI21sEap088bq+ZsFUbBi?=
 =?us-ascii?Q?SkayeuaCokQBDQHaILFkBdveHwTdVOf9YbVacwTcVy6G14XtfXgcPD7dNl6k?=
 =?us-ascii?Q?bYDqnbCwG8PsfAXs297MRmvqcoNbYBa4uQCjvkjZFXbEQfpRpkyuyoWIoCNS?=
 =?us-ascii?Q?0+B9gr4gtN5c/hkbFvGsUpQYhzxaZHaobS+vQ4dg8hfaAxB4LaqADysOcftq?=
 =?us-ascii?Q?LTdpygRzxVsraNPKsT09AfdI2WsNXvGUwaXtblXtN5G/3iZN8iL0UHYMa7w1?=
 =?us-ascii?Q?s8BXdc7yPn4pj8tE3QW/0UZW9xKHJyWgDwawJNdOhHqN/e6uULgPr3hFNf6m?=
 =?us-ascii?Q?Q55xLlMOHBJfbhiKa73WC0uwiqtCzMCoe3NAOFkbVAV0q53vgptOmTt57IPu?=
 =?us-ascii?Q?Dbw+zOiLrXSDfkNMuwDwc99mck6yzKWAGDlILEAaFItdwgLmZo+PDyq+6uYH?=
 =?us-ascii?Q?Qzmt0JrTdg6xMfTCRJwUTy+R8wczknjhvBEocckhC702rVR3VrV2KP/N8CP+?=
 =?us-ascii?Q?vzH0MpViDdVJWCbacGFJsac0hKEIpglZLFs5Cknp+rc7Zr6QaiSyAwDNGvVG?=
 =?us-ascii?Q?XgbV+x0AmUWpcjp2Fiy09sUyi2NIgAcWHJC8j8fkVRVAGRFm1f4dOkUfM47M?=
 =?us-ascii?Q?MwpebPF2kv1A0vZkxrqAjLzPAeNvmqlSRvDQFMV8i+hUpk329qj0aWd8v/45?=
 =?us-ascii?Q?ZJgL5DFrCanBXzybC7oFD4HtWnqMFkTAO8Kmun3y1w/1IPEXmN4wxZ2dCzBc?=
 =?us-ascii?Q?3yVb5DijRN08t8h5XSoQ1oEJrJAxIMvzYmwO?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:32.8328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b99923b-d82d-40f2-89af-08dd90d02080
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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

