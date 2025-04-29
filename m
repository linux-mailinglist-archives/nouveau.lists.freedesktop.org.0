Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E29AA3CB1
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A435510E5C0;
	Tue, 29 Apr 2025 23:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OdXc+Js4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C3510E5C0
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YupV2PIWgYrSRnai7/4ovdBlcf37Z+NfWhXz5CJl8M+Kz04wt7k+z9wdIYo3I4GnTa7/oGKCHE7o6pTGRUlHc85QyvQ2x6RSVVvzX2MrICK+QV98EP9dkqY4yflqv7YrBErMZA+RE/78+kPYOyFFt+gDTAN0sUc+blQ2Wzt/KBBiaHiiogVH7f8EbtoL8WBDPQUMC7xqSGe/btr9pHRaBXy3dEs+GrfH8Z0uBgMwLXAo7lFVRkjlULLLOiYW7OLMQGL5oBa9Elhg8PvxNTlgJ43lRx74N7KyRbS/OJHWyRduEfoIbpT0HqvVUWSf9aQAaKmXIv2SABRBy9onOOiLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N21VF8o0T06Ep3WmJi3FWyeV6BoQjcJCml0F4A2xfT4=;
 b=dgVbGpocrmXDiRGh3tOaxOWRmSxdxP6E4KRtkd0Qw9gPuuyu1LnQNcCzNf6B5arVSFUSBE69hnso+sTvG7Vq4GMgck47ue4BnCGR2TuzGPYIVEHAkzIJUTQVCfSn2hcLHGIyNRqmNEopqadY5MaQ9lZRwbLBugG6IQRqFGkWP0r8I2yz+okRJwj+QCiOBwUGL9ndShgRGSgbWUjcsSX/o7chtk4EcIeGyQR605zsQOFGUndDdCHs3aCNf8Z6LppiZZDjGrCK6DK7tUKZ9+0pXUJgmAts+n76oeXrU2C/1VZhtFDBQ3Ml1GgGJUlgsnBBTjGKo03KwDHlABYWosik5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N21VF8o0T06Ep3WmJi3FWyeV6BoQjcJCml0F4A2xfT4=;
 b=OdXc+Js4DTbDZ9KGvYLG0Qo4oepFUzwkPrYUkmQknmI0yg/pof0rjSE7uUqJhbz6Sx/BJmK4TlVdGhw8PMvQHebZr77XDzhvf3pOb7XkxfMjjKJdQegTlmqYMTJHFEE4EEVWh+NwX5OWly3nBSLTaYPTuWdmsurs4PwbUtFFcCnyVDH1NXxNhdFGk5xaJQuydgEwhimjmzYwfNW/ISXrfz93BPCCeChZFyj3IiFilx866kiR4kYa/MhytuDtXyAJ/C1DI9CsN5kSU6e9xP+sYyu0DHrCvDC2iy5OqKqqBGT0HtprPPWH0QO6BMaIEYwbkZSe8klRcc9wxYtRmQ/F7A==
Received: from SN7PR04CA0221.namprd04.prod.outlook.com (2603:10b6:806:127::16)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 23:41:03 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::93) by SN7PR04CA0221.outlook.office365.com
 (2603:10b6:806:127::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 23:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:41:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:48 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 57/60] drm/nouveau/gsp: add hal for fifo.chan.doorbell_handle
Date: Wed, 30 Apr 2025 09:39:25 +1000
Message-ID: <20250429233929.24363-58-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ0PR12MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a8474f-0ca7-4bf5-062a-08dd87774dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0PGkGtLjANSjlO05EosStURep1f2IcsHuJgnyPf7mkLSEzlxMCJqnyxoDSg5?=
 =?us-ascii?Q?jfLOYzancCLHCZzywAcJdS0+dLvPrZPmgY+hfAVqksHTbQ1lpPlnV847xyuC?=
 =?us-ascii?Q?ThDStUOhqTYIxjr5Rc2PBnfq8Ta3Y5Ab4zf8pzGKx/IIjNEFaBIfA7utRr75?=
 =?us-ascii?Q?J3R432n80sN4BQabsWdc3bPF/LgySgUFA3nmADVvp5bJvU1Z675PhMUzMii2?=
 =?us-ascii?Q?padNSx5RD1al16iVHeDa7DNX0PKTRfYq8oEmwrhk5/cJFGpYZ3nOfEg4s/Oy?=
 =?us-ascii?Q?46n5fBjpIvmJpfPKtJCXgaIEEKXP+JsOqN6zG0pB6MogWfEJeqzjfYGxsJIq?=
 =?us-ascii?Q?V3g2dgCw24A3nOEcXDvp8JQ4CfqTIuM0y4Mb2WKsJWecqa/JaVUvZPwzRghB?=
 =?us-ascii?Q?0XQf/lcCQSDUYfBmgPmBen2RjisYNwA5Kzy6/Z4+t6mfmmv6XsTdTld1nw/1?=
 =?us-ascii?Q?N1deAjNtyKIlPNhbX3KNcTXJPXc3PYK3M0QOeqSUI7VIWXz/to0Hx5TSqSl0?=
 =?us-ascii?Q?guj02pQBH+EwF7VMC0Rioj7lVdcFMcp0HkQJLLEyXzpCaizRIHatF72g7uNM?=
 =?us-ascii?Q?JBpYT3k0rdNBrv5c4BEpwtLXu6pcZL6tPfGzQ5UPUEnUhyqzt5hdEZB1yFW/?=
 =?us-ascii?Q?/IyJgU0h73oxKmfbndLQoAo8w6yAMVf1vTiCqS4scbnyKMaisMLH07AkwJp+?=
 =?us-ascii?Q?JvlXgKzO/2LpWOpc2ll1KBuBL8rS03ewfJssZS52pWN08mFEmnqiIyyY76m8?=
 =?us-ascii?Q?TeCyVS19KqGmzZ9MC8bQGdPv+KNU9/L6MeiaK07mLpAwfFvl2v3lFwdTJyUc?=
 =?us-ascii?Q?Ty5o4cnRzEMgNFI/2fntPmhSrVUvhWm3iWEPU042AI+7NAjAQIX2hEVHUXQi?=
 =?us-ascii?Q?Uyuf6LrRTZJddcSMuIOqKK9rMsKaSUTUaslWd5K1+OX+F9iHzyqIUOjR6TV4?=
 =?us-ascii?Q?8bitMxPkTEeci52u3beQ8Zdus4ilP5FhH5Qh01t5w04gJuiP7SZqyEirUCxk?=
 =?us-ascii?Q?UyjZv7fNRhUsbvFv5N9dvYzK52tpQNKWBdmoaBEwfIvL2kVgaF3omSWtMc+l?=
 =?us-ascii?Q?J8XDEa+0IfG62aZN1encpHs1YnnzZtEtGoXMpsuwn8Gv+VmkCyeNexThkQoV?=
 =?us-ascii?Q?scsxJIcRh3O5oL65lVQuiYf52/wvHxfXgmLV+B7PqzhXz5LZJB+YDoG4fiSG?=
 =?us-ascii?Q?3qzcNPbmWNh3zDNzE8afEUQ5AmVeqKH+AA8UuKywcFWtEz5zC0VzlpeeEAf1?=
 =?us-ascii?Q?BVPFCeeXXLv7s/dbWXmnqUgh2hhNvoNJ41k9hPA7J5kl3kE6vT+XF84KMmuq?=
 =?us-ascii?Q?lFWxdhjCu1feR/Y+mKoOESAQA5a+MrDqimQZn22mceYk3vobC0F8tI9HsLSy?=
 =?us-ascii?Q?h3iJxL+YIqcN/g4MPMZ55hig+wUOLubwafMDxVmBiGSy+Ii8z1CZHpf9Zv3S?=
 =?us-ascii?Q?jf418CbIMjhRjlJDzByucbRqHGuj3Qf+5rvPu3wswGpmODGa7nEZqyM3R5Ex?=
 =?us-ascii?Q?2qoNtnOu2ik1LbmebjlDz/T+ZRiDJnJu/gDA?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:41:03.1068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a8474f-0ca7-4bf5-062a-08dd87774dca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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
index 8b26c92c40c0..dfa3d235f9b9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -38,6 +40,7 @@ ad10x_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_B,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index b17cf2f59523..787135208098 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -29,6 +31,7 @@ ga100_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_A,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index 50cb89460836..1ef65db971de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -38,6 +40,7 @@ ga1xx_gpu = {
 
 	.fifo.chan = {
 		.class = AMPERE_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = AMPERE_DMA_COPY_B,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
index f549daa0068d..00f060b63ed6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -29,6 +31,7 @@ gb10x_gpu = {
 
 	.fifo.chan = {
 		.class = BLACKWELL_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = BLACKWELL_DMA_COPY_A,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
index c2d865f73014..0cb8ee1b8824 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -29,6 +31,7 @@ gh100_gpu = {
 
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
index 608d8210299d..3f0aba55f48e 100644
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
index 3ad3153ffe58..1b0ecc0f0e0e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -21,6 +21,8 @@
  */
 #include "gpu.h"
 
+#include <engine/fifo/priv.h>
+
 #include <nvif/class.h>
 
 const struct nvkm_rm_gpu
@@ -38,6 +40,7 @@ tu1xx_gpu = {
 
 	.fifo.chan = {
 		.class = TURING_CHANNEL_GPFIFO_A,
+		.doorbell_handle = tu102_chan_doorbell_handle,
 	},
 
 	.ce.class = TURING_DMA_COPY_A,
-- 
2.49.0

