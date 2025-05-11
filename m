Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315BAB2B56
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107CC10E195;
	Sun, 11 May 2025 21:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fD5mRSTU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7AE10E16F
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4XOP6xxM2xcTK8LxFAYgx6bozns4fEOwdeiqlR7JfLKaOz3OrWwGOg9TiyAMIBFFMO74M0mW0Zo1wWknBJb02X6DL+ZHQaI8hRGDbpsC2szxuG3BUg52zfx/iS6epnDZfDg1eJo/xFwSNT+8HqNvFkiIcpOFD4Ka5SCr6iYLcjatOa83Ix7mUB0sXX01CEqcb+zUPkBBPL/OU4KtRtc6KfhsfSPkeWHWNpk8hTGXojGVHg0ON5d/xjyb/+JvwHkF7fdRNZmP6JBfIdsVReSLEb0O4DiAPycF4J7cJi7jsZKeG5dZhS52K4SExC4knSj7/lfaMgaNnIxwPjyFciy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvNFY5nmJ6g5/nMVEvkDVKU3Hgm2lSgKwvIv/q4D7SY=;
 b=u0txRqKkZOn91HTSh08rV/SOj/Lyq+TAC6iKjFmF3Lpw/i+1n7t1TMgbMEdCfNBC5XLaCpPFilk87RT71Jf4e4Vgsj1lSQFiuSoQwmijXBd6nMZGB0GODGy6d1we/uzsLATZaRTi82zbBRkLPay7x4XUbaqYGiI64+hyxBuwH8EnO6QUId8qSoQLW+FJ0UXkzEBETtzCPeC0pYOk1FZhLchiKRIz/TFt88qG+l3R+sHcka+Hv817JDk/J6WajV0vgp4EZvYG2YfyoDU5njd1Zr7v4h0XkJ9Nka+p+riyQIcw2UirXmf1p2MhmpZulgWX3gfgIx1FbDBF7Gry0+95hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvNFY5nmJ6g5/nMVEvkDVKU3Hgm2lSgKwvIv/q4D7SY=;
 b=fD5mRSTU8OO3ZPuStfSJOjgdd74foLuoze971bao4aOerZGItMmjn+1RFMz1nKnT/PiTKKVzjO0MwZfxAaN3JRifihLa2hYQSnOBR8huGt+9BA1nm4f+w7IE1bUEnM+uifKjJrf4jMAy3FY961mN+CEKaxkCnCVg5nqthj+unm+3XY4ZY8FOXYcHC3Anv3O7siCjyqcXwVyu+fBVxUXdybFsC/1KMtj/17iUIPJBdxHcGCO9K5jme3rc0YgabxWFbPi2ZnM4HrmOvF67lE/uw6waaKTPMN0VpFgxGeNKeqDzkvFUQbpnlZMf5STTO11Mk0gnesT2ekYIs9ooEFlnYA==
Received: from DS7PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:3bb::27)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:35 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::28) by DS7PR03CA0082.outlook.office365.com
 (2603:10b6:5:3bb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:27 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 15/62] drm/nouveau/gsp: add display class ids to gpu hal
Date: Mon, 12 May 2025 07:06:35 +1000
Message-ID: <20250511210722.80350-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4770d8fe-0a1c-4309-5fab-08dd90cffdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0J8fqj7CP69QiILi1lLzhGvi/ujuejV0LLlSkrIVkg1gv8bbKjaSembtC8ED?=
 =?us-ascii?Q?oPMAi5uvF0kjIF3pNT7o7db2GdC5VaLM/fMlSaFX8NiGLzYWweZqdFI6uHz2?=
 =?us-ascii?Q?FMr4kLgiZRzol9z5ZGwT1oW+cBkjkCvHCBGRdofLl3FmPz9pS+SAwloORVJR?=
 =?us-ascii?Q?AlkXxttK1Q4M7TcfhVqQLFev+nDif2q/jdz+RVbk0k139/gIyfhIbeQiE3Yy?=
 =?us-ascii?Q?z40VLby6Ivz1h7VhHsxLR79r8hXEqwWjzrSdkIUChK/iSkYrFV8UVQkLSH8K?=
 =?us-ascii?Q?tMCpzignALRisaKBTrPPNdYw5sD6Tou1TLkEMQocSLQvTMPJERXCEDOfkUs7?=
 =?us-ascii?Q?wQFlySjWpGP0dwq7dCT30bgdyf0z4DwpfP97hxPsq9w3Yq6xZdbVOt1tS8Zo?=
 =?us-ascii?Q?8V70wkcCiqn/i+g9u0S7nmXnKKt0/GdkdRdRAaTp+334J+pmjZSwEoT8okE+?=
 =?us-ascii?Q?l7A20Qm082urWs7AESj1igeubhkBGG9nh5YjEesrlKFqj5fv1jz5RNfCq85Z?=
 =?us-ascii?Q?sbpwUyEN9puritaWKm8hHsaFw1ZQn7YKGTvhnUTyFVSnRZjLWLUJQvuYWDFN?=
 =?us-ascii?Q?80S79K6LPTu2UjtoOx03NnZ7pqwVYLflxhSgDh0D3LQFu1klNjFDySjIp44v?=
 =?us-ascii?Q?KUnjTXx6d30Q5OK9d2GRShx8AQ74kxw9LumfoTZkrFCBKIZsxn5N35FDBSZK?=
 =?us-ascii?Q?2O2XPoHL+GmKzp2vPQat7vRB5GKtvAy7auMKOLFjfjUpxaOXEb7NgaK8ee6t?=
 =?us-ascii?Q?PpgUqLQQ2dchpA+tVKl30ZAVn0Si23qEx3dXws1CoYb6fWAWgFgrQUv0vsKH?=
 =?us-ascii?Q?sKzoQVQYI8pdEqMH8kQD+Cavoug/tV897bS/2HKyRjVeAS9chdev59gnl9Ga?=
 =?us-ascii?Q?lzNHI8M4bXxl2deNpS0zTa5Zk039Jdh3WipPbzmeKjyJ1/nkbkdVvY5GeDL1?=
 =?us-ascii?Q?dITil//SubwddpVgRmR0w/P41NRFtj8CslQTbTZ+VIksGBWA75fqqFk7lmAb?=
 =?us-ascii?Q?ZWJxwCUn6Qk9yz3Ty4ycgMid1UP0X1i2I6+SzYEa/K3YSoMHX0LGQ6m6t9Cy?=
 =?us-ascii?Q?IqIevivgS+x0jRLSIARhdJX22tvXAkSRXDmnkwkNDU8wDTIjxlBGf28biu2t?=
 =?us-ascii?Q?bBjoMMqNIR54bLm89K0RX7JdqbP8mFyOcUiOrnHVqRerpEY7uZaTa644V1sY?=
 =?us-ascii?Q?AXUuSDEspzwUwSVvpLMiRG0768wLh8QaAeCelH+SuXRUG0crAvEoImE3f4Wz?=
 =?us-ascii?Q?83sVsFLS3J4ysBTgKUy5ZYGsdKeiwmumeSXOkQqxI0gpjqsNQgQrDm6S/opF?=
 =?us-ascii?Q?80S4zwgkacC82FXE/MZ8q9b15v+Kb+u0weRkxlC0iQ3Ewm+LN5bxroLfyYBd?=
 =?us-ascii?Q?GbdLtuRh8q4N45zywwQ4NyPVkmB1ql+7LNROejWVip39evlNwi1WJQhMOWOC?=
 =?us-ascii?Q?KknOYet/KZY816vxulegmeq4PUYDJl8lvOm5EJwuftDKEtqbOsUE9nxPkiKs?=
 =?us-ascii?Q?JL5K5PjoTq2b8V68fMUafeTxZ9V/m6rKNxUP?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:34.6025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4770d8fe-0a1c-4309-5fab-08dd90cffdd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179
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

Use display class IDs from nvkm_rm_gpu, instead of copying them from the
non-GSP HALs.

Removes the AD102 display HAL, which is no longer required as there's no
support for it without GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/include/nvkm/engine/disp.h    |  1 -
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 10 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |  1 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  | 52 -------------------
 .../drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    | 10 ++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    | 10 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  | 10 ++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 35 ++++++++-----
 .../drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    | 10 ++++
 9 files changed, 67 insertions(+), 72 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index 3e8db8280e2a..7903d7470d19 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -87,5 +87,4 @@ int gp102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct
 int gv100_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 int tu102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 int ga102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
-int ad102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 9093d89b16f3..aa929d3b2941 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2709,7 +2709,7 @@ nv192_chipset = {
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x0000001f, ga102_ce_new },
-	.disp     = { 0x00000001, ad102_disp_new },
+	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
@@ -2735,7 +2735,7 @@ nv193_chipset = {
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x0000001f, ga102_ce_new },
-	.disp     = { 0x00000001, ad102_disp_new },
+	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
@@ -2761,7 +2761,7 @@ nv194_chipset = {
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x0000001f, ga102_ce_new },
-	.disp     = { 0x00000001, ad102_disp_new },
+	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
@@ -2787,7 +2787,7 @@ nv196_chipset = {
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x0000001f, ga102_ce_new },
-	.disp     = { 0x00000001, ad102_disp_new },
+	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
@@ -2813,7 +2813,7 @@ nv197_chipset = {
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x0000001f, ga102_ce_new },
-	.disp     = { 0x00000001, ad102_disp_new },
+	.disp     = { 0x00000001, ga102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
index 23a10e081081..e1aecd3fe96c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
@@ -27,7 +27,6 @@ nvkm-y += nvkm/engine/disp/gp102.o
 nvkm-y += nvkm/engine/disp/gv100.o
 nvkm-y += nvkm/engine/disp/tu102.o
 nvkm-y += nvkm/engine/disp/ga102.o
-nvkm-y += nvkm/engine/disp/ad102.o
 
 nvkm-y += nvkm/engine/disp/udisp.o
 nvkm-y += nvkm/engine/disp/uconn.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
deleted file mode 100644
index 7f300a79aa29..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
+++ /dev/null
@@ -1,52 +0,0 @@
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
-#include "chan.h"
-
-#include <subdev/gsp.h>
-
-#include <nvif/class.h>
-
-static const struct nvkm_disp_func
-ad102_disp = {
-	.uevent = &gv100_disp_chan_uevent,
-	.ramht_size = 0x2000,
-	.root = {  0, 0,AD102_DISP },
-	.user = {
-		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
-		{{ 0, 0,GA102_DISP_CURSOR                }, nvkm_disp_chan_new, &gv100_disp_curs },
-		{{ 0, 0,GA102_DISP_WINDOW_IMM_CHANNEL_DMA}, nvkm_disp_wndw_new, &gv100_disp_wimm },
-		{{ 0, 0,AD102_DISP_CORE_CHANNEL_DMA      }, nvkm_disp_core_new, &gv100_disp_core },
-		{{ 0, 0,GA102_DISP_WINDOW_CHANNEL_DMA    }, nvkm_disp_wndw_new, &gv100_disp_wndw },
-		{}
-	},
-};
-
-int
-ad102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-	       struct nvkm_disp **pdisp)
-{
-	if (nvkm_gsp_rm(device->gsp))
-		return r535_disp_new(&ad102_disp, device, type, inst, pdisp);
-
-	return -ENODEV;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index 1e519bf166dd..bdeaffbb1077 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -4,6 +4,16 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 ad10x_gpu = {
+	.disp.class = {
+		.root = AD102_DISP,
+		.caps = GV100_DISP_CAPS,
+		.core = AD102_DISP_CORE_CHANNEL_DMA,
+		.wndw = GA102_DISP_WINDOW_CHANNEL_DMA,
+		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
+		.curs = GA102_DISP_CURSOR,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index 725ccb2c27dc..d4b67ccac608 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -4,6 +4,16 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 ga1xx_gpu = {
+	.disp.class = {
+		.root = GA102_DISP,
+		.caps = GV100_DISP_CAPS,
+		.core = GA102_DISP_CORE_CHANNEL_DMA,
+		.wndw = GA102_DISP_WINDOW_CHANNEL_DMA,
+		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
+		.curs = GA102_DISP_CURSOR,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 32d87ce2b77d..7f3b5f3fd32b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -7,6 +7,16 @@
 #include "rm.h"
 
 struct nvkm_rm_gpu {
+	struct {
+		struct {
+			u32 root;
+			u32 caps;
+			u32 core;
+			u32 wndw;
+			u32 wimm;
+			u32 curs;
+		} class;
+	} disp;
 };
 
 extern const struct nvkm_rm_gpu tu1xx_gpu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 475faa35361a..e65f9074e94f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -34,6 +34,8 @@
 #include <subdev/mmu.h>
 #include <subdev/vfn.h>
 
+#include <rm/gpu.h>
+
 #include <nvhw/drf.h>
 
 #include "nvrm/disp.h"
@@ -1676,6 +1678,7 @@ int
 r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_disp **pdisp)
 {
+	const struct nvkm_rm_gpu *gpu = device->gsp->rm->gpu;
 	struct nvkm_disp_func *rm;
 	int ret;
 
@@ -1691,20 +1694,26 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	rm->sor.new = r535_sor_new;
 	rm->ramht_size = hw->ramht_size;
 
-	rm->root = hw->root;
+	rm->root.oclass = gpu->disp.class.root;
 
-	for (int i = 0; hw->user[i].ctor; i++) {
-		switch (hw->user[i].base.oclass & 0xff) {
-		case 0x73: rm->user[i] = hw->user[i]; break;
-		case 0x7d: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_core; break;
-		case 0x7e: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wndw; break;
-		case 0x7b: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wimm; break;
-		case 0x7a: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_curs; break;
-		default:
-			WARN_ON(1);
-			continue;
-		}
-	}
+	rm->user[0].base.oclass = gpu->disp.class.caps;
+	rm->user[0].ctor = gv100_disp_caps_new;
+
+	rm->user[1].base.oclass = gpu->disp.class.core;
+	rm->user[1].ctor = nvkm_disp_core_new;
+	rm->user[1].chan = &r535_core;
+
+	rm->user[2].base.oclass = gpu->disp.class.wndw;
+	rm->user[2].ctor = nvkm_disp_wndw_new;
+	rm->user[2].chan = &r535_wndw;
+
+	rm->user[3].base.oclass = gpu->disp.class.wimm;
+	rm->user[3].ctor = nvkm_disp_wndw_new;
+	rm->user[3].chan = &r535_wimm;
+
+	rm->user[4].base.oclass = gpu->disp.class.curs;
+	rm->user[4].ctor = nvkm_disp_chan_new;
+	rm->user[4].chan = &r535_curs;
 
 	ret = nvkm_disp_new_(rm, device, type, inst, pdisp);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index d455a4f19854..add98b2f3b6d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -4,6 +4,16 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 tu1xx_gpu = {
+	.disp.class = {
+		.root = TU102_DISP,
+		.caps = GV100_DISP_CAPS,
+		.core = TU102_DISP_CORE_CHANNEL_DMA,
+		.wndw = TU102_DISP_WINDOW_CHANNEL_DMA,
+		.wimm = TU102_DISP_WINDOW_IMM_CHANNEL_DMA,
+		.curs = TU102_DISP_CURSOR,
+	},
 };
-- 
2.49.0

