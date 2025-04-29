Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FDAA3C7A
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5C610E55A;
	Tue, 29 Apr 2025 23:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PDZaf1T5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894D010E563
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddPLMMxQAzoQmde2Xv6aMfeRVp1XuTdBfy4rbxrME1qmwa/DHvSFMhHJ2Y6vMzHvlSaY3AxS1on0GOdEvR+RU9zFQbPelHowFIpTZ1mAICX+6HX030a+9Xfy/OyQU8JZ7kOrsBJMrre7+C9isDGa/0tNse4/X80gP8UGWhk+GKEkGO+ocGYdQ3dEQwfEkUQvUtdiS+MyD2qzkPhz5i+4laoiEF3ZqDHkBZWrvtVIJ+HbY5O6n2ZX9PMadRgApw4OeH0Y/xB9OQ86l5YEMj3WLftCWDdHmgFBhzZ7mpVO9xuew/kvDk6KpdVq/W8LZymGMzyVo1MxVd7F99AvLxCZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1QNZSIuax2rOfBmKgwB4FWxIQZV6t1VLnuCVDgEj0A=;
 b=nNb4gRB2IluBroAJxiVXNcmLpr9ypbOflHfVnk/nH4Jf1ic4SUXO/j5ITUaUONQatDdQKrn8ItWuchHXipsQ45IX7BlxdiCVlzsZQhSwASvc4Z8bEMmypAxROApVtJObyqTbjIRXWXx3D40Y+cbxqCgLDm2Jq554dl9rrWDdVVnrOUJvPBT/+flDREk2Z97bgOOog4dnx3VACGs0pFyJgtsN3jMs6y3PXUIIwIuAcUaecSMsqJoCvbargKMyBM2U4avkKrDt0dUNcgCrlnhveD+AwaE3TIDKKOwUJbf78a1ZU6Tc3En6Eqld937V9V4cPvTmaNO7WJ2j5Uuj7hDAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1QNZSIuax2rOfBmKgwB4FWxIQZV6t1VLnuCVDgEj0A=;
 b=PDZaf1T5/wTHLL0b9j2MPKpCZrY4NzbMP4xnkRJn+noh2w4Oul2lHNy5uG1tj4/q59wO94o45KOKmK45eOj2XBnwKfvj4b5MEjioZe+6eEwdtyHENSDpF274VGjJlQu1t0utTDGoJ6LxUsjluUkxY0g+QhL2Md1eKRNFPHMybbWeG2LUHAMDkgnjlwkfuAkqkh5daTqJkqDT1JeGTBjOmgm15N26kDJXK3pYHk97RxgdkcxXGesV2CFP+JjRQ4I7maqWhp3+qkLC5KDw129sn3G72669dhQNjT58VwnpeyDnolo/CyqgVKGHbGapFtLNfLw516NzSlbZI2mp+nZt9Q==
Received: from MW4PR04CA0349.namprd04.prod.outlook.com (2603:10b6:303:8a::24)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:09 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::4f) by MW4PR04CA0349.outlook.office365.com
 (2603:10b6:303:8a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:58 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 15/60] drm/nouveau/gsp: add display class ids to gpu hal
Date: Wed, 30 Apr 2025 09:38:43 +1000
Message-ID: <20250429233929.24363-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb921cc-6406-46b6-663e-08dd87772d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RpwsUtpyxLcKLm2Do0oS3cQgwZhNe9WD9hDmuJiwNPcY7pDfJnVmlkRa89vR?=
 =?us-ascii?Q?lWlt0ZcK9KURdwLCFaqwazgaSKxsw6pe/9GGVoFjbF/+Pe/8nJ9nBlcErqqG?=
 =?us-ascii?Q?8//k2KSpSah42j9gXFtZW6Ay5XtPv4ehlv78y7Am8nMrCn6c+pV03lBA/WnN?=
 =?us-ascii?Q?3lVi3zfVLskx2j8vHvR7YOKjTg0AV1cDmS5KqOrnGWe1Yj4vd6JQl0rX/N63?=
 =?us-ascii?Q?RGm/t2N6dJNYwjvYEP1N+uBMi2T53O3L27dtSEaG/9DBUIZDcU9bLaZvAorF?=
 =?us-ascii?Q?kt2df5ctfg0dGk5YeSD60fp1aBZdlyMgJZjm0bmyLOAR0nv65iFMghQCcQMy?=
 =?us-ascii?Q?xMZhKvpMv6U1lwvZlhFo1tbWcPBnUafZi73I77YGXeAR4KF23++whFGkXqJA?=
 =?us-ascii?Q?X6QvgK2RgK3jx3mad2tqTruoQASxJv0VfIXAxheJjckQLM2i+ElQ+xd/GkP0?=
 =?us-ascii?Q?vDEUQZDyJGTiWlxutESE8NGoFYZ0H2gVvJ/Oa2m1XzHV6plODSgG9TvZ6+8K?=
 =?us-ascii?Q?RxlWYfh+ETjuwmX/M8/Vu6T6iE5UnpG3xoAQscTfMlne1Ha2/Af8kGRU92+Z?=
 =?us-ascii?Q?8vCWZ0Das/c5lZRIpMno4h0PYvC/si6N67T6rMbZL3+N+fCnkYToGSJiSo5c?=
 =?us-ascii?Q?2RJXD3sdBptTpKNnxToNbersvTzRFb35MquRzeX/s8X7WsyfMJc/4neI7NlO?=
 =?us-ascii?Q?FVN765nfcz6mfNVchsXADqixGa5Cz37dZuaU9XgtnGDE2ZqiDsjVpJlqA1wC?=
 =?us-ascii?Q?acALatrZ0a81qMRC9RHblxnkFo+JMXrJmD9szpQsVgfzyDxpXLQ/LPdo3u3X?=
 =?us-ascii?Q?pmvCbR/NGlzdRE/FgUkD+DLDkoXFFvk5jz0sbpW8jvHZkvx1klmo2Ns7LzmY?=
 =?us-ascii?Q?Ik1Tfn9wMP3kW8J//w6tbFBIiwEHS+tTmhKYP1kPjOIS7TNC23XtIV/UOKv1?=
 =?us-ascii?Q?rgrSKtSMp5D17lTgSGQLx/pxYU+sP03XC/7FbOIKplPdSJ/NjyTwjR8u254t?=
 =?us-ascii?Q?N2AxkdiqxT4CixsV8UiC5FyMS8qQwwFqIaOarHw5wEXdoItACGGdYJ5ypFsx?=
 =?us-ascii?Q?3UKe5SpUyDDmR1QDSf/xb5A4eeI2vLMn7oRsSYs/IREoh4vQoPzvo0HKH/rT?=
 =?us-ascii?Q?eouCY+ai3z/Ebne1qiRdT4Wic3FCYfQrQ4gG4G19blROu+YBGzepRB8EuW8i?=
 =?us-ascii?Q?04bV0AUv92X8Z3zQ0Em79ij6g7e4L621Gu0abiRgcFiUZfps9SxLeYCtKLgk?=
 =?us-ascii?Q?NVqjBEVFQ4i/elfaXxOa/ZwaQ3Vog7I1AJQvYYgT5dVUGeNAAbqFhbhATbQy?=
 =?us-ascii?Q?6H9Ww+/ezbv/dYGjbioY+QDLm+WvdjpHBwa4X24b5eLAgrOQOaMQaoNM0YMU?=
 =?us-ascii?Q?hwr+60QT51DFn6+nUkGdkI2yPvJ8IW7BjWaYRmkh5YldX6tbSWGp6d6cyaiV?=
 =?us-ascii?Q?8nfuqc+pgtcIPq/Eg59HnQfgo7EIqomzsxskngg0PwlLrWBCjHXo1EXcavcJ?=
 =?us-ascii?Q?N0scsaVbF6pxWb4GXdg34EJtXYqYJlcIAJKJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:08.6734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb921cc-6406-46b6-663e-08dd87772d48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769
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
index 79dc1feee272..db686911a833 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -21,6 +21,16 @@
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
index 7e8b52e32b55..aedaaceb9127 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -21,6 +21,16 @@
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
index 5b5afd6f67f0..11254bee828e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -21,6 +21,16 @@
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

