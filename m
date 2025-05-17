Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F300BABA709
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06810EBB6;
	Sat, 17 May 2025 00:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z4Z4+qCh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87AA10EBAC
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lATyTO8Tc9iqsUaJKp4PzYt1yyN0ftE5+4DXqxMfJyEM5qXZ5ITGO3DLuWBTTBy8Xdj9wcvnLJp1jdXstYOvHfS9t1at39j/9DUbwz3+TWWLx8pmYkTSl7+J8hRDFVzm6lnS957+N2wN03E/ZPQCSLJ/+io5fNb8ka2NLknvIR6NR3Kc7Ayd2jRw9CqrAKFW6bwpFH0Wx92x2b2Csok1nQcBTkBrpLO0ojWdvK7a3+BXTSQWmNvZMDkh3TwDLyxiIuPxAtf7d2HOHdvPU+rhQYe9vF2kuQVOoOHnvWMWdenMrRJZeT8iDUz1nMe0An2CFoaq61HzhNvopNTbjd4L1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvNFY5nmJ6g5/nMVEvkDVKU3Hgm2lSgKwvIv/q4D7SY=;
 b=kV8m1UUd5r7/bo8AkAWXsUfNvXSlrdiO7bQFJctcKnIod9ChbI9PStQxcFErEeZBO1SaQZ1udlp38FeZU/QBe2xlQxpjMaeQh05tVWoXxW8t/9KU4cPB4ptmavZJiXiujNqJxtYIQ1ddh0mMgHLFsH1qOq1c2oSBqGJxaSgV68Zfp931nItglcJt+iPnkDukn44e9cri2pBtwXk4lmZBAuN8zPQe4tRcCx0eLcWFZIDYbVdYgKI5NOa5F1praX5EKdyfd0h9Xj72x3BBtXjx0oNcJcwqwtMjeAwil6/Odzhq4Vcf9cvBgwuwuVDsfNoL1GmTaVRfICsgetk4OKBhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvNFY5nmJ6g5/nMVEvkDVKU3Hgm2lSgKwvIv/q4D7SY=;
 b=Z4Z4+qChe4YmeTGxX5n4WvIRJ96esO70GuoqX2Bj0bNG1n1zbpJyrK0dtTsgPaJmSleo+B74PnHpDlzLtFTOzMOTHB50DKrHmBAVZWNK2p8PT8pbWBaac5UFO6JrstGp0eiIQfsd9/6jGLZfiSBRyv2lSJU2tYCbMpWnYNTIX7e28swl0PSISGwZmDaxj6OS3fRpAsbWM5lLamLSPW13F4m4s+S8Bl9R4YKJf28LTgHrwQq/TmLntgQmuBxkNxJHIvQg5uVwZXF/5i572nH0AaLD0jhK/d9VS6K1dAWvmnNDZky3D2dq0BpehIax8KBwFA+A36EIrvm27TcSx2jflw==
Received: from SJ0PR03CA0279.namprd03.prod.outlook.com (2603:10b6:a03:39e::14)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:10:48 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::bd) by SJ0PR03CA0279.outlook.office365.com
 (2603:10b6:a03:39e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Sat,
 17 May 2025 00:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:32 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 16/62] drm/nouveau/gsp: add display class ids to gpu hal
Date: Sat, 17 May 2025 10:09:08 +1000
Message-ID: <20250517000954.35691-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 07df0d3f-4061-461e-62bf-08dd94d74640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zMUL6D7pyumsu5VH00IzYQpAgq4vOP9/exryyVttlSuyOIPTVcSY2Mr67MoZ?=
 =?us-ascii?Q?4YrRXrcLHqt6y4eo9lDvB/EbG3RZNkZCVAvaHCExBgTkDDsarK9cWWvr6cGQ?=
 =?us-ascii?Q?oGC6QMjiZPoSk0Kx5QQs2a12Y+QOE65bZykdvij3iuHVC7gdNE7IVcBDbKrJ?=
 =?us-ascii?Q?KNPPPhW8Tku3uCVVmqZpZYePXpY3Ueho9K+gPFvf7FotKNtLzgF5bkuMpOsP?=
 =?us-ascii?Q?7ufBQo5xsmp6B8C9TRG5IkQUwNvwM1Z/sRxJMPMB112uhbidg1e64DHYz+C5?=
 =?us-ascii?Q?pAjSzxRum3sEcdAjGspE7aUouE3BLfwDuifVh90WBzK/Oq/PIe/M1fHMQOqK?=
 =?us-ascii?Q?HGxDOV5wyfmy830J8Xi+fLw/JN/OEQEQdb5Z0gTKCkWctt4ZtM48VEHDwdye?=
 =?us-ascii?Q?MoCh2el5GZajhk6GqKvrqb9lDNTC5EK7n10RFs3Ve8reg7A4bvKYnGU2GlwF?=
 =?us-ascii?Q?3kaZmu/5+8GYmwoz0Y97gQSHPvrs/D/GYcn9Az/FOv89X/N6EEXuo6yKOZ73?=
 =?us-ascii?Q?FVRLOgWOO/pBHE4n0EXL15X0FFCHNv7iaMIi1bkjko1ZhKUEjDzJMxokzKbC?=
 =?us-ascii?Q?YpX2SMJhkaaIZezmyaK08XDhOJiAgzW5mUHoZS1OUjzWhHPiUiBvY4WGiBPc?=
 =?us-ascii?Q?W7fZTfWG57rCj8Xw9Izuz9IzKvQEQGPwKs6xUg7BWlnr7w/SvQSCpN14gIWB?=
 =?us-ascii?Q?jaPQb6fns0iBvfwU74I0L/vjg8X6iiygA0dliEgujtgMqGMJUOEdbpgLhfrq?=
 =?us-ascii?Q?dQzRFaL8udoij/yHx3ZNSjCBGHjuXIBHjxiMfvR3sPB82uA5GPxWlXfIwMyY?=
 =?us-ascii?Q?FPtc3bGVsMzZO9emCP/d+s2WT2yaMHbab+ziOKjSNHUQhFmSbgCRxQrJyola?=
 =?us-ascii?Q?Jpsv1d34u8V4RWaHV89X4lh/B5IkQA1Pwk4Hz/z/ozWDpZoZBhRRKV6RDlkM?=
 =?us-ascii?Q?8kvic8Li11QSoPDpKjMcnjby0qzXPdO6SC8xyHjJu8wn9p21roSTz1KEIwHZ?=
 =?us-ascii?Q?M/f211jz1FNxcoTEhfr1qtmOxjzFez8hrIm9sdniwqTpPCfFd0yeXVCBIYyY?=
 =?us-ascii?Q?FkUKGqrfNvFs+WNaxygAyJj4H4TLvMMXNowkXDrXpIuWl6MqkMDJuLSHyak/?=
 =?us-ascii?Q?lt5bxxRDH25RNZ5nEj62Bpkqhwh5rFpUXF6OAVMEO3iPqxWgykNSbmyTOyM1?=
 =?us-ascii?Q?bpSKvxy5SOWtsy2D13tjlH6SLR+qsmGmFF0aT1/vtYKQwpcYoSPgxNULCT0Q?=
 =?us-ascii?Q?WrBJpX8yst4rOIE2mNUOwPkQrKoj8kBGV1cewKVmOdJVL/fGGIz+0jBjZ8Q1?=
 =?us-ascii?Q?Eyuibdc+ikw4yIrm6FqKVl3t7d3wZ7FqH3qq3DgoBh4qLTr7LHCKvm/KRhIN?=
 =?us-ascii?Q?5Y7KQbPyM2BffL0bbfa3k8Z6M8TAQBe5kHJedcS7S8nG+x8V/dHerfONLz3n?=
 =?us-ascii?Q?fssuW0/MzJMOql5dVpWAP3Xqyk52lm+mjnAw5sj1kbxKZEmp9j/cau3m08ZZ?=
 =?us-ascii?Q?hFiVuUDPVA8SVSC5aZjUhjUWjTMeq8rhX42m?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:47.2923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07df0d3f-4061-461e-62bf-08dd94d74640
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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

