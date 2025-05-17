Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3933ABA72E
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B710EBE2;
	Sat, 17 May 2025 00:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GKYCk0Ew";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB4210EBE0
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0vEKlsBQocMZqu3LZYBCISxB9G38AppG/KmRdQXDa//xBMYquur0sF/7hqRACNvcTBCNwl4eBq/0bi+GQMzj1WKCKp76OaWakdbrSS9NlOJeunZlhpunjlmRSr8izGiftsgArsRzSfyw+LfcR87LvNv9hK3VYTVw6rUn4xj3f0+90ogmJjruGgdBIxV42tqFpIzOP8SwMSfqKXTgelwcbmLumdWyPmGX6pWrxTNPSlXHNLDlpZAKZlSqHwLW40tP5xKeeSBMDIXa6b1/6VBSopXegSbWmgGT09DXhCZLvKja2Ugg9qQsSoO8NSPW61dVCAjDDc0cixJiU8mJnjv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wuPpDyyYWbIzh3+RGiUPV7jQ3Ii1+145lfhVAKpMv0=;
 b=pH9LKuXZTZBVFyQuShh2np5+0jF7xXlIUBDDamdQAWw5K82puajRfEMv+444co8U+yEMFWUEh+M2/Nllrdn6ZfgHuWXIPABauwpdNL304gRMM3U9ojvM99fKkUYrboJhdbwFb6puYBoT3pl9sdmpbZNFPMvdxpfgWG7ru/zMRNJGNOK0qygUYeTIvE3rOIM2E/Er1e+VpKeW2ACmiXeQwcUSPgQs69pUrD0Tkp0LFjVzMGY0+qsCgZ3H4p0WDzr21yz+y/GLS4STlppyVWuqKegOK9sZ7lVmA0LkS+e0mwTIBTt3G3+9iWXraoS88GqYkWS+AX/Sv841C9QtgmaeCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wuPpDyyYWbIzh3+RGiUPV7jQ3Ii1+145lfhVAKpMv0=;
 b=GKYCk0EwyILMpNukeYLxXDksKxRGzWCk5R126I/dE4a4KCDQjL3PmLgMZuIpU0oUU107oQ5taq+xdj6pcYMD4RS9pag5mMDh+XEefYLLq5zN6F/g0LuCusK+pfX51w+k2F4ogodN6WJGI9mrNl6TdCk0nNyvCp2XouHi/+QM0kvRCwxH36jWIHo5eRvg0+LAzfZuRK7YBb7HSGjOgbwQaUUzxLGqR5rmEs9r0YxjaJ5HBx2Yy65LaxEt7V4Cp1+xRC9NDv+j+dmyoZ730BF5cJqESFA02ghD+fjZ+gS9ISGX6KKs38i3Gckvo8R7qf3yDIEXqcG9tJtR0zRZ1c6O3g==
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:11:39 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::1f) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.10 via Frontend Transport; Sat,
 17 May 2025 00:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:23 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 51/62] drm/nouveau/gsp: support deeper page tables in
 COPY_SERVER_RESERVED_PDES
Date: Sat, 17 May 2025 10:09:43 +1000
Message-ID: <20250517000954.35691-52-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a78b03-aef8-4ab4-346c-08dd94d76482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bLcX6qsNTNvCH5s9UKXzo6V0l0q0er05CiNJ2q66c0CXb1MScd6XfEBSRhke?=
 =?us-ascii?Q?RpDy0BqI7WSUYuyX9omH/b79/g6o8WQ2O6YaAMIHuJbhx6TiMWvfqOp7QPhC?=
 =?us-ascii?Q?yS3q35neEJ0rQyX/5VjqVurAowfIEIULpndc2qdRxApOpIpDBlCAVrDfdnOv?=
 =?us-ascii?Q?yPbRNKlr+7zfUMIk+GMJ4XE2Bw1kQ0HAvvR1kqX/l71RMAt0WuIuMgRogE0Y?=
 =?us-ascii?Q?U0N2426TMorEUoQo/z6wwaSQ8LNsRc4ZzyEe7mwxgyA8IpIAAoke1YDHy6wX?=
 =?us-ascii?Q?Ezmkh51tn6eLGIzs4AJ8ukzrwQvCe7wmN26gxQnLiIlN19cY0iYvzfat0itQ?=
 =?us-ascii?Q?CRIil/dBhmnqIHjd6S8EEqNzzakwpRNsFYNaFTUUo88yShGBDMHeINy0BaP1?=
 =?us-ascii?Q?Z7hIgUXe07LzOLHJfY+K4VvUueWcLwQ/fBwR6OPF7SRBYpf4OzM8fxizefRX?=
 =?us-ascii?Q?vsJe66gHtgfiCqKzT8pocqpdKuJeZUqMvsUr9+DdZ9+nib/8/diQoUQtKqPh?=
 =?us-ascii?Q?HKrRDCNORP9tD0Wn+nQnRIqWWrW1Ey3KEBTPZokz8fhyhzThUaZMH3QlcAlT?=
 =?us-ascii?Q?E1AeqviuySMddIUCzhF8FuufPg6Ej6CihjoMbn9J/pUQjxrgI2xh5b1ro+Jw?=
 =?us-ascii?Q?uiOgGD2+DfAgSMt0xVfTMV7BOQMyRDLLY3K24xYdzWFNvN4S6eraiauKcXEM?=
 =?us-ascii?Q?pZMKY3+jSzL0OpXrcW8FyiXrS7JFIWh86xBgtkz4VRaq7+B5FQGuQnzEiTic?=
 =?us-ascii?Q?QIBI+BeOofr2ZhhG5peBFfpP5Is1jLBQXAVJR5d3wQBe4sC2aj/4vnQqRXU2?=
 =?us-ascii?Q?Feg3ZhpLO9HGGrxSQUb3N1DAY2kdpkSQDYcTuMn9Yv7YsWKWTADVXICpzf2c?=
 =?us-ascii?Q?jaIalGtby2o6/QLtDl4jrNxhhBlnlAa+9ufA0An/x2W+IdGuCRVhXKmOchcs?=
 =?us-ascii?Q?T7lGvCGaVjEzsnIc7/fLmVsH/JHF1P0lE2jX2PbEOJRXIV9pmWw/PWzhyGZb?=
 =?us-ascii?Q?KY9d7yGmiK0N1bp3MGzxlMX/GPcqYe5BujwhVJ3tmc1kWCqXlLrWjIq2FQJU?=
 =?us-ascii?Q?uRXBdsUZVIQDRywbPYgSt7ozBMxUuD1/BVY3OTSJijMvcnm+d49HuQWobK9p?=
 =?us-ascii?Q?89QbASjI17AWAwlCLSB5Y2Z22ESlwiVGWqH0qjQQBxH6+kPB/95fN55PyQpY?=
 =?us-ascii?Q?t30HmoP/z3tKawUJ4GOsqoxA89wVnJ0ATBXjeBV8IiVpYAWvk642O7qIMoPL?=
 =?us-ascii?Q?zONRP0D4pPjYwajADtZKNZhhM+cJgFm4eFFmpfsqSx8JLQmhLDut1DH3uSp5?=
 =?us-ascii?Q?JCk8nj18pZ47nKtJqG4OFOecFTVAaIutk0PCTFdT8XNOaEGDEE3gTAoSHnO7?=
 =?us-ascii?Q?igaGq9GRYS+8H3JDobGupmKfXr3gz5wD21wc4Jy8xN2rwVbrjbzXaeroGTcT?=
 =?us-ascii?Q?kyK822Ls2Bo7AtOBnAPKwsLYxk1b8p6pPKDwi2Wm1b2tjKeTpCkPerzOxdl8?=
 =?us-ascii?Q?QXE0Hr9ps9zvfFN4A+iwKYnuuVp9OLnV8wco?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:38.0481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a78b03-aef8-4ab4-346c-08dd94d76482
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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

Use data from 'struct nvkm_vmm_page/desc' to determine which PDEs need
to be mirrored to RM instead of hardcoded values for pre-Hopper page
tables.

Needed to support Hopper/Blackwell.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 47 +++++++++++++------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index dbddc5cc333d..52f2e5f14517 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -75,9 +75,22 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 
 	if (!external) {
 		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
+		u8 page_shift = 29; /* 512MiB */
+		const u64 page_size = BIT_ULL(page_shift);
+		const struct nvkm_vmm_page *page;
+		const struct nvkm_vmm_desc *desc;
+		struct nvkm_vmm_pt *pd = vmm->pd;
+
+		for (page = vmm->func->page; page->shift; page++) {
+			if (page->shift == page_shift)
+				break;
+		}
+
+		if (WARN_ON(!page->shift))
+			return -EINVAL;
 
 		mutex_lock(&vmm->mutex.vmm);
-		ret = nvkm_vmm_get_locked(vmm, true, false, false, 0x1d, 32, 0x20000000,
+		ret = nvkm_vmm_get_locked(vmm, true, false, false, page_shift, 32, page_size,
 					  &vmm->rm.rsvd);
 		mutex_unlock(&vmm->mutex.vmm);
 		if (ret)
@@ -94,22 +107,26 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 		if (IS_ERR(ctrl))
 			return PTR_ERR(ctrl);
 
-		ctrl->pageSize = 0x20000000;
+		ctrl->pageSize = page_size;
 		ctrl->virtAddrLo = vmm->rm.rsvd->addr;
 		ctrl->virtAddrHi = vmm->rm.rsvd->addr + vmm->rm.rsvd->size - 1;
-		ctrl->numLevelsToCopy = vmm->pd->pde[0]->pde[0] ? 3 : 2;
-		ctrl->levels[0].physAddress = vmm->pd->pt[0]->addr;
-		ctrl->levels[0].size = 0x20;
-		ctrl->levels[0].aperture = 1;
-		ctrl->levels[0].pageShift = 0x2f;
-		ctrl->levels[1].physAddress = vmm->pd->pde[0]->pt[0]->addr;
-		ctrl->levels[1].size = 0x1000;
-		ctrl->levels[1].aperture = 1;
-		ctrl->levels[1].pageShift = 0x26;
-		ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
-		ctrl->levels[2].size = 0x1000;
-		ctrl->levels[2].aperture = 1;
-		ctrl->levels[2].pageShift = 0x1d;
+
+		for (desc = page->desc; desc->bits; desc++) {
+			ctrl->numLevelsToCopy++;
+			page_shift += desc->bits;
+		}
+		desc--;
+
+		for (int i = 0; i < ctrl->numLevelsToCopy; i++, desc--) {
+			page_shift -= desc->bits;
+
+			ctrl->levels[i].physAddress = pd->pt[0]->addr;
+			ctrl->levels[i].size = (1 << desc->bits) * desc->size;
+			ctrl->levels[i].aperture = 1;
+			ctrl->levels[i].pageShift = page_shift;
+
+			pd = pd->pde[0];
+		}
 
 		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
 	} else {
-- 
2.49.0

