Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3DAB2B7E
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E478510E293;
	Sun, 11 May 2025 21:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pHxe+Mti";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234B910E28B
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMF80goz9UARwLYfv0vTKYy9XsnhNeCSvkyLnMsVsqIm7RexrOXCLcthDEa9kAWI9bR05lxauFDA+7xsowonDiyQgTulmjanq7qN/nONyND+GLFl50ByiQewfrH+kGpLHnKTQIRteN5g7kE7Q7LUYtg/6ucjcK0mxjVmOIRKE2h4Yj452tQhViZtsUoxFf6shtk9mPyND/AwwCwUT65FQWdzhI3x/35VI1gwbfbL56uRevD6splxYYPBo7BDYnioHuK04bl0ICCpqOccr3qO5KkktIKD58bWypXg/hGrUmZcZ4M+210vrqE6Be67S7u+URChwZcum4qnuDSeCZ5+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4elXbH1K0miLKfenD9YD1ZfQeVDDWYMOMK/mBQ4abWU=;
 b=uMNQmy1c/MWmOQKD1mmQRSyAcufQX/uGxTgRxjZhH+NOVzyKOsiAIZMFI+NQs//wrywEigQhEsS600SC8UxVGJiQzNiQRcqZC/eZiiXprAHjbpcs720rzr9ypX7KGZHeWivK1hYrkZrgtJ9WYHpB1RCzF7IMf9xHrW4/AIqQ6Cojj8RicAf0Ui/SQo+XvPcGrjwm2TfVIQQpFROiHR1OREptgtJwJugu23jFEzO9rLjnfh1EwShcSckUgN67y5fKIt5zuMPiAuQ4beXGFVdq12a/olsrY6JzbHRceVnyPEppgCsZwTEhfIqo+1xnIOlviO5vVM3yui3shR6RpHF0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4elXbH1K0miLKfenD9YD1ZfQeVDDWYMOMK/mBQ4abWU=;
 b=pHxe+MtiBTP0MiibV3ljMoe278Kjp9PkMHreK6GV/t8lxAb1MbIoXAQP70DA2yIdSbRRQHnQFpJKJcRlw6iE6uzKZe+zg4JkixWZtV/ZXBrA1UmIqa8CKGFWAtDCJ2thFfZdUlXxfIwebPB0ZONHrfaPMtngtWaFYRIO0SIuuMTkPJwpyHf8s1ecOlXIxRXutajy4qJ4Kuc8XTORY5UOnxCVMtdCxRt8SlL6k9RTuyl/3+4rA8nFBAufr5xiypIHoMqyFpXZMwb4/N6ihCrOuHKfcdOvOhxcfH0puDfsgwnLiV7LhkOO8XkvysOJh5OHRfK0DWj4ZVri30lDGSeCTw==
Received: from DM6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:5:1f4::22)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Sun, 11 May
 2025 21:09:53 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::2f) by DM6PR02CA0081.outlook.office365.com
 (2603:10b6:5:1f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Sun,
 11 May 2025 21:09:53 +0000
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
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:43 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:42 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 59/62] drm/nouveau/gsp: add hal for
 fifo.chan.doorbell_handle
Date: Mon, 12 May 2025 07:07:19 +1000
Message-ID: <20250511210722.80350-60-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: d4286b3a-2557-41d8-bd9f-08dd90d02c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vB/6XfKqpIqwjZmo+sgTwk4w8TXNktnXgysOogOBGIFfnEvopNiQLBXvHG4n?=
 =?us-ascii?Q?bL+KB4A5XIZ1vx/MGO0Jh7eqViC/XQFg28Rx5jmVChJsQPonUUyB5Hq9AXs7?=
 =?us-ascii?Q?LaOeHOBfdmJ4QRCM2tFfoAqRIqlCuuZ3ydEOUoQro+x8hjU4PnGsa/HC3l2s?=
 =?us-ascii?Q?KPOcUbwRVQZNYBWPDsGwc4MQSPfDtwiEwNqSQoEZvYO2NQMPTzkmzbxsB/Kj?=
 =?us-ascii?Q?8f7t1Fmijt96kVZ/rSY0u4SN308vJ7OEifzrn5YoUUPQbhGmgg1pLCDzN8KF?=
 =?us-ascii?Q?GWQFt8Lq5JTk0d33Kald6FpDQRvEkYVeUfzmi4Z7MLsFg9Ca/MBVijDlbuJ7?=
 =?us-ascii?Q?zVsWSPUjZvQ+6Xh38XHJyK+8PWsLwFVMQkicOFqehqxyCdT6R2fakoItrXHk?=
 =?us-ascii?Q?y7PGS7dlWpPzhwlT9M00fPfk4jEIV7e9VaDaV8Jd6l/8ryImilHGxbQZRKuz?=
 =?us-ascii?Q?jH7XRRNbCuD7MnhZmgKNcx26Ofnypk2rd+hvB3CEDuvxSvm84Kmlcf5DspAg?=
 =?us-ascii?Q?uUh6WCEE/w7Od4XI/w74yQkjEqssjZkLrXqTsJ9GpcSimbcDU9CRnZTvvjYO?=
 =?us-ascii?Q?Wu6TH6RjLbeh2eFXyFIvDfcg1YqbFRHe/Fml3ZccDC+XKLRkgaipmfBEA39H?=
 =?us-ascii?Q?TvVBmZxwzhsyMkMzDYVZ69XFvKyKbbszg1ZOlSnawHckStH4pS6YLPy2gTez?=
 =?us-ascii?Q?jF2+YzNjr1VL4h8oTzdSvxidoDUVkrItB7zVGW/RvH00NkAU2VGQGI/MRigY?=
 =?us-ascii?Q?1wGFQI+xz8TLX7R9tm6iAg+dukt9xGORereom+xGQTZRtxxA4DxQyDDb+u34?=
 =?us-ascii?Q?yAhL7fqHaFwhEZV37WGnVp8Udk1XnVbKlKnkV2zSS2SFSjIu2yPO2y4BqLyG?=
 =?us-ascii?Q?rT+n8n0Alet3INDEPPJcVcOa1GKsxYlXmDjry8GmoQ/ZizNacOHVJ4rXSXAs?=
 =?us-ascii?Q?JJ5wMsvdMV37shaRifutqLBP2Z5mmwmA8jqcMCzFBtSLfYzcy1n55FURA7dA?=
 =?us-ascii?Q?0H2FpG0C4D3xr0k72IPBe189MmNCs+YgLktsda5NjtHu+M5Ak/W47IME8mwe?=
 =?us-ascii?Q?Uxc4xPnsUxnxhsbwgaHcNvb4IaxtTlxEEs2+mqPDS6m53gcXtR3vhMCv3aCG?=
 =?us-ascii?Q?PN6N+mjvVZm6ONdVVJRtCcsQ4XcAHVsyGZfjT/gJz5S1RY2lYkopv/hvcQRV?=
 =?us-ascii?Q?4DVGMo+Sj6SV4hxtpf6oFotIIrQVw8ztm1aiWhlUI39I8KOFIksrVd8j3xhi?=
 =?us-ascii?Q?tM5rXT/5N9Vcdy+0E7gLZthNUkYqvlVb6rhiqHWqVFd2oIo7kdgWdwtIvW+F?=
 =?us-ascii?Q?PYoVT8Hq78U7lef692+fpv8HUENAH01yoP/v2bS4Nk+/Ah+FUyca8mnohchf?=
 =?us-ascii?Q?9Ht53dxzPLOx+IIPLCgoekbKHq2WDYisZROu2MV2RA1bp0aWeEAHUIbYlyGZ?=
 =?us-ascii?Q?UoNvMQvq2yRLzZyqXRb59XalKrHGRoXTP+TGw32Mr5xRLpUEQhflqxKad75N?=
 =?us-ascii?Q?k0l4oTkOVKXrcsild2gD8zSP0eEleGYcx6QO?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:53.0237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4286b3a-2557-41d8-bd9f-08dd90d02c88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
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

The doorbell register on GB20x GPUs has additional fields.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h        | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h       | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c     | 3 +++
 10 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index a0f3277605a5..9ebb35c31db0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -6,6 +6,7 @@
 #include <core/enum.h>
 struct nvkm_cctx;
 struct nvkm_cgrp;
+struct nvkm_chan;
 struct nvkm_engn;
 struct nvkm_memory;
 struct nvkm_runl;
@@ -195,6 +196,7 @@ extern const struct nvkm_chan_func_ramfc gv100_chan_ramfc;
 
 void tu102_fifo_intr_ctxsw_timeout_info(struct nvkm_engn *, u32 info);
 extern const struct nvkm_fifo_func_mmu_fault tu102_fifo_mmu_fault;
+u32 tu102_chan_doorbell_handle(struct nvkm_chan *);
 
 int ga100_fifo_runl_ctor(struct nvkm_fifo *);
 int ga100_fifo_nonstall_ctor(struct nvkm_fifo *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 1d39a6840a40..c5a03298e88c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -31,7 +31,7 @@
 
 #include <nvif/class.h>
 
-static u32
+u32
 tu102_chan_doorbell_handle(struct nvkm_chan *chan)
 {
 	return (chan->cgrp->runl->id << 16) | chan->id;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index d699c386adec..e1ce6355c35f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -21,6 +23,7 @@ ad10x_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_B,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index 5e7f18dbf18b..a48c6134075d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -12,6 +14,7 @@ ga100_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_A,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index 61525d23aaa0..50536ad7f85d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -21,6 +23,7 @@ ga1xx_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_B,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
index 3a296d8fd2e0..2f517dcd721a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -12,6 +14,7 @@ gb10x_gpu = {
 
 	.fifo.chan = {
 		.class = BLACKWELL_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = BLACKWELL_DMA_COPY_A,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
index 088250559e12..49e2c54e1aa8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -12,6 +14,7 @@ gh100_gpu = {
 
 	.fifo.chan = {
 		.class = HOPPER_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = HOPPER_DMA_COPY_A,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index e84376c85e99..77aa7b13a3af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -25,6 +25,7 @@ struct nvkm_rm_gpu {
 	struct {
 		struct {
 			u32 class;
+			u32 (*doorbell_handle)(struct nvkm_chan *);
 		} chan;
 	} fifo;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 1d0ab4392c2e..2a41b2ed347c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -41,7 +41,9 @@
 static u32
 r535_chan_doorbell_handle(struct nvkm_chan *chan)
 {
-	return (chan->cgrp->runl->id << 16) | chan->id;
+	struct nvkm_gsp *gsp = chan->rm.object.client->gsp;
+
+	return gsp->rm->gpu->fifo.chan.doorbell_handle(chan);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index 883b9eddbfe6..423502f870db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -4,6 +4,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -21,6 +23,7 @@ tu1xx_gpu = {
 
 	.fifo.chan = {
 		.class = TURING_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = TURING_DMA_COPY_A,
-- 
2.49.0

