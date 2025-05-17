Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC01ABA729
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D9010EBDF;
	Sat, 17 May 2025 00:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEAE31NM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40110EBDE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzf20DxMY+CLJ0rpC9Gqevyj0g3lAA7SDwUj1LhBsUZ0VqmCxUoXAq3lGV0BHes/IqwoCRpLnA1I7num0UJn/dl6WhpS7vCr4H1TrYA9MB6QLPtVD5IC8pBoDdBysWToEhuOep0+eHu1TFu1au9DQp7ud3fmvIcHN7DoKHt+D0OuVZKSoEjvdnmvHr03+HlILCmSD8L/ywBbOvqEwBnF2qzSo4O+JHDb0WRg2GeFemBgeKn/QnYWE3d/3pBmmd0EHQ7Fv90do6WE67Yu37gOb2NP9qtQpFXiJRBzE68VWSTHObN2ZE4I2y69snAlLTS5lF3sIbbzLum8b67G3HkmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhcGJZT8iBV0nxwLpN5XMyZWgFovIshJq4reTOfUzWM=;
 b=yihie/gFKfLqGqoUO9woHpSFIJn6dwV4QfkSHkhrQ0DjvvM6pNREwpxXkkFI1d5fh619PfgDYwiYfFbuTaUYsG7xr/lbtqlY9m6R8ND8hvV384bAY0BVCCul4/IVLtrV4SsunZis+mu9RMfENwkQf8D+w2Wq7mK8AcDWIBWZ7jMvlo3TUyGiiqXMlBtmtC2lFYfDTKxIBoWZb5gWBWyzYjaMwl81/rzi3OM6h/Ym84MDNnWAgBxoKoegethxLSPKjTRMWpl5UL5h8p9EU+UxPVMWAMyg5NbZq/24skebSJQ4FQLNW77/Ed13evgdhs5yVXwY55H7vFvqRKK34vPHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhcGJZT8iBV0nxwLpN5XMyZWgFovIshJq4reTOfUzWM=;
 b=kEAE31NMMa5Fcwiu8WGHKjBruGk+abIpx3k7qD2Po0++Xv/p8fUggrcybt+rWV3fxX9ny2LJ5nFOo3W5Sy5t248XOHsniuVNkf41IBLKOsyY+bE1OnoENuhxWhHhE/U6uKVIdxmvj7VwdyCAEZTB2PUgvf6AwWuJkzFKtoJ4yr9sksKaXJmwio68g4Rhi/8buTXw7HraGsbc1zt7imypy81bPSLvTAUhjD02xAqG7owY2xya2623+nw/B6i3c346YQaq/viyf3+F95CS1whqEGrbxSz1uM+v7Cmvtuzt7WFQjOU6wTLfNrC61Q3biMcxQb49jmxnmnaDvI8DIAcw/w==
Received: from PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::29)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:11:32 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::9f) by PH8P221CA0048.outlook.office365.com
 (2603:10b6:510:346::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:18 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 47/62] drm/nouveau/instmem: add hal for
 set_bar0_window_addr()
Date: Sat, 17 May 2025 10:09:39 +1000
Message-ID: <20250517000954.35691-48-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa7bf8d-4fd0-4c99-cd7f-08dd94d760d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aLwElLX+xAL3OVZxv/1J+4MWBp8wZfTId+WNeu/o4vdjahNHKIyO1yAXsiKX?=
 =?us-ascii?Q?Bw2in0j3bVT0dv6KfQTV6gKeyKiBv9+6UzqLcVvPfy4R/rhYAi5o1FSuFF8N?=
 =?us-ascii?Q?LqR0p71u7NX3dB99bY6EBGFIQLxCJVidNvkr1zx5Hux+Jwj/df8ciI8HKvVu?=
 =?us-ascii?Q?1eHUmCawxBKJlUUYK0XAGj+CGgIfUhou4zwVamw0r7sw/L7hWklf8qHdPy/P?=
 =?us-ascii?Q?eMJi16zGIkw4QCAA1zADtZHgbA0GDzXURsns6NcIV4S2wYvQAF8q329CGIUw?=
 =?us-ascii?Q?jmxZHZicN/nT4KOnAb2MpiIaVKIK33JJR2OdKW6KVYRJO7lHBkVhNnnVYjaD?=
 =?us-ascii?Q?FZP0KYL7azh5RneA4sIXp3bXnmW2DlR6/iJ1vDfkwHwhnYyTMCCOmr+3uFnj?=
 =?us-ascii?Q?mQISbHnJ1VE7LiMmd+6ZCp9tpN4ONgke8g1/+4jrE3xA3yMAaHqMcv9SIKjT?=
 =?us-ascii?Q?hmRa9KYMjr/+5937wycG4MQziRrbHykyZaTXKhB8AS7EXiAC85AtrHUquNf/?=
 =?us-ascii?Q?PneTCs6Bb9yAQ9hogPdEikG3nttGOOpmx6VSSckoylwkhhmu4IVSYeLhdobz?=
 =?us-ascii?Q?pa0oiCzL0RD400paArctK6qU49WJw26FocmzxPc4kqIDCwqPZdhPwOWjuFwB?=
 =?us-ascii?Q?N2TpNLVLNItsvW4BcdLzETSc7mv42WRYP/NVGkTCc/NhD1Dn66GGpqOMNDco?=
 =?us-ascii?Q?fGGIm89cCGaz6ueOf8Oeg5VRQpA14mlWhof/gr9pQ7KiQIx2hsixVqTmJyXP?=
 =?us-ascii?Q?C+DVEVCbywsMl9ESTVaxtDnr6Y9sXZIPfQ5smGxMwCPlghzMsoxW+/ceTT/b?=
 =?us-ascii?Q?5xwwK+Q9lkXUTDDUcl9H5E5DrBOLgZ3ao+Qsta9Eervivdfy7EAQYSmM/P2D?=
 =?us-ascii?Q?iPwId+3QTLPCVd0MPiCcWXmhIsLhCesUJVBkPtPVYI+oTV5FKhUn46EjFTUu?=
 =?us-ascii?Q?744vIz9HQv2GwvUEqU4FOAxziqKtBIWg+ARPsrH+nYP3wOitTvtREZ/056tH?=
 =?us-ascii?Q?CaMTn+dAzZfd19z9ZbD1LrMEYoY0QWIev9yhKCKaRb0B1ODMWVviab96pnMa?=
 =?us-ascii?Q?gdLS3vm79vUl2cGo3FwurBpZTmB3nWH7bcgi8vqbn3bwm5RFSlSC6qdLRqFd?=
 =?us-ascii?Q?Qy+SK85imkPTYHfg971YYvsiHBsqiKybHhApRgA8oLXKIjgf26TGmdBoVONp?=
 =?us-ascii?Q?zIlbxdvf0Apeq5Q29fwipa97yzCs4YqosxRnq/0C4FranO7GxbONBMp9p73l?=
 =?us-ascii?Q?geHNwNrZsLq7fIekmcSVDpRPuTY/hZbOy3S+IDyRHzXA37fvhSbjDYsQr6wh?=
 =?us-ascii?Q?ArK6SjG3JOurwUCOJVocDDLCNpRWI9Od1zDOmFOk5LcFHaqaU0K23q98cw0f?=
 =?us-ascii?Q?k9UkyxKAqoL96xePe/VDdLzK4wee7MLOm1v5UySCX0wQXxUQP9BlgIJTaNaR?=
 =?us-ascii?Q?pEzP75sn82xhSA49wpM+Y9SUFUbLK0CEbLVmQLS9/PrhmMWXrG15WjUFphtm?=
 =?us-ascii?Q?eI2okg6blntrmWV8IfZWmASC+ygxmpAx5rHk?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:31.8499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa7bf8d-4fd0-4c99-cd7f-08dd94d760d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

