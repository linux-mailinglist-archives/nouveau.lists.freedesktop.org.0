Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F60ABA734
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3510EBE9;
	Sat, 17 May 2025 00:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="stY90rdu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0C910EBE8
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztg2q0iAa8TWf38TIgk2hx6vifLngXmHvif+/EBE0nRn3FSeZjFK1+vewPX7AFNn8b0rHzgAfWpqzpPH1HFDCOEB16dgcHqojqba7aFtlXxxxtoTqSYz3oJ5h0px2VD8j9RwX378zMpepP71oQadUWFAgWM7zAbYQ6CCO5+4T/lNu+oBI/G9TqAP4/ZJdeLrJ8P9t/Kn/4mHKvql946Voj86EpXLoiYhZAgb2bz4d2Ab/5PYyyEMDQ0cggExpb06oBSSImR5/b9UA5GTOoMPd8Vk1UJ87Xsqzw0n/GpRVToAP2vjwijC56DJYkVS5/FgDQNa4BB23ykoTrwcEEsioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq39Gg1ceItrHF7Y9IE1f4sXxik3xGxgy/qxEIY25JE=;
 b=yw13INwqNe/H4BDH7UJA/BxMBvPE+KKIhw7If//XfHS8R/s7W3CDccRxG+YxhqIMAaBgithCy+igdkZFHvYHQp6QTzTNc/tp8vFFl4eXvi583lhdeLOQdzJzUDjaRGaQBOteqX3XjOwSChy1Lmn7PXF4T0zMBQYZI/pBGDFE2/Ipd0lcV52AlfrJIJaJNuZy/qk79CH9MGvTVgKmAV0Ae62TcWo7CUdaat5GzlS0Q1SFnXdZTDJDEXODhyrXchcRs7lgQEztUxo4XKrGdlYTrhV+DixSXhtPAMl3xxcuLq8emTUgvt1nslMjlnA46sWOXrj2DrkCSC2sjHkyjHD1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq39Gg1ceItrHF7Y9IE1f4sXxik3xGxgy/qxEIY25JE=;
 b=stY90rduTZImNTQ2v1m6qI8zNEQrXeugImYx0ojQiQs7yV2ijCKoG050I+tW28cx+4VDXItwolSwPmBEsXe9jxith92ryRhlyvu7wdqmfS+MSYcy8zcSubfLn/Gk6wGxaTe89wUAbhl47vKEJzdzfHQcPodzq5iwBmujuZnm+2X5TNyhl1TqFptCGS/cmOje0+X2ss7bUpsToMBdNu3J18Jls0hYhixVQUT6mZAWALYMB+ru3PtZhi59u8P4TxLu/dc0DFwTsayVuouWWJybZN5cVf8WQfdC2kf3jcbFs5AZgj9jH0yRMmet4FjbPT99EJ7FmoOG1XIRINSQnAhASg==
Received: from CH2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:610:4f::18)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:11:47 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5a) by CH2PR18CA0008.outlook.office365.com
 (2603:10b6:610:4f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Sat,
 17 May 2025 00:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:35 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 59/62] drm/nouveau/gsp: add hal for
 fifo.chan.doorbell_handle
Date: Sat, 17 May 2025 10:09:51 +1000
Message-ID: <20250517000954.35691-60-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fb3d0a-199d-4eba-3602-08dd94d769e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oM0AM9AWmWh/NMS06M493MIkU/9o/aU2Le/EjgrOChQdUl8L1bDkJhgb38m1?=
 =?us-ascii?Q?860q5qKLbrGBeMDryBa2rqIF5xDDE7K8ksbYL6NbA+oMCEnQehafEvxFkCgk?=
 =?us-ascii?Q?VcP4QSkVzIvlstO3PdeIUST4aC2NPOoZVPS4KGgLPp8NRXXbyAHvEkjPZvaF?=
 =?us-ascii?Q?YfuDiAMcmhpLvOPes+fH8J9Ai/rCpUPT0UFSg9Vi6tS97iILDkYNz7L6yAZx?=
 =?us-ascii?Q?Lr+JAKrWm4uLcUU+QrhEDgCdbquulB17CU6YSCbrXOR9yJuITEUoX0d7s/ra?=
 =?us-ascii?Q?GYz75GvEPTMm2roepWRJkjrFORfpLlxzkGD79yLDPbSBlsFY/+bKd8j1h4IB?=
 =?us-ascii?Q?hFF7Qmjh6Nj73RNsJtpxHDe44Pp1VWzCXmJI12ftYy8FnozZ0gGh6uN+95HE?=
 =?us-ascii?Q?EhDRzOdOcyqyTm7ylvHnr7c1Hc12XL3TKaxBdyH9VQJK/oyFkuyXULehfcen?=
 =?us-ascii?Q?2drLeh/pvlQAVVECzbJpN62joG0WU80GiFqQIzQY8//omZYiPORzNKRwIr3U?=
 =?us-ascii?Q?h/Pbv1/VxN3N9kuu72rUxRrBPD3G6USda8mTAeF+DiAJKqh3nRnf2xj2ckjy?=
 =?us-ascii?Q?1t4ZnugVEvADEhub6mlD1OpieaT3clI93BxLZ+LmIh8Zq46uZSRgijFK8Czq?=
 =?us-ascii?Q?3ppq9P2i02jBZ2Vqc95EtRvd9GEcWdxQSJwHwO0pMPQb3DoCXFXedVK25Y+J?=
 =?us-ascii?Q?hy4lOfWupJO/tEFWTB269vaq6GTkoSaaL+DPlg3/4hFZlK/563ZCFIGSIFYF?=
 =?us-ascii?Q?pZPIXFXMEucJwV0bhKNAIHgwDutNgxV3kqEhQ9v1O+lb6IBvXc3eQEuxUoFT?=
 =?us-ascii?Q?Ds05iZyudit3CDh7fEIzyDJxDUpYqrDeQ409Xs0DW04Mq/y4CJtHf4y9gdZr?=
 =?us-ascii?Q?aPEz5/lIcsj243AXJK3u5+cwUhyudELbFzbmMRAwtWoeaqa5vhJeoXxqfBTb?=
 =?us-ascii?Q?jQBTU6iWcP/FluOt/5OcKpvVm1sH/Gv4zNJapSrDd9k07mWkDV78RzHxTz5b?=
 =?us-ascii?Q?E5kUSu5NizX0AcGl+xqOSkDgJCFYOQBSBGXyheuFD6WYafuERmyKTC8zVxKb?=
 =?us-ascii?Q?ZtW1YL/oWa1UULB6ssM8CKO4FDz1LXCMvXzVc0xQw4HiNSZN288qQS4PeT9X?=
 =?us-ascii?Q?VCGwJQHYslFXXgSTu1T2V9Acxd7u/MzF7m+7CC112hAbHe4fTmR6WLqDE7cj?=
 =?us-ascii?Q?gy2Q8oHNKOCWEOWL7taxXGdwzms8O//BqY3J/xQ8+8npf5wXp8Gm3dnGyfY1?=
 =?us-ascii?Q?ejEjiY1ivjJVLSt6UuE8dQXLBeP001+gY0eUBvN3LQAaf4l8ZgFAN29gxxXk?=
 =?us-ascii?Q?8VXledNtP7/aiSUzKHm+R9RHk8WUuOV8naR47+nvUDyhogetbwQuUXnYUwcl?=
 =?us-ascii?Q?OOAJPVCyOryH7/+Bphl6t4WHKfLMe6vzAoQY8MDJeplAjOPch+UBkvc0mmYa?=
 =?us-ascii?Q?c0j6q2MejQNVOAnqaXEpl2d9FQsJPDusyIjIodP7P2qFTFxJ9KXbiWBCl8xH?=
 =?us-ascii?Q?OHZP9fta6c7Zwqib0hoEVM45E2vMBczsEHIQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:47.0605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fb3d0a-199d-4eba-3602-08dd94d769e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637
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
index 4238362ec073..eaba4d50860d 100644
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

