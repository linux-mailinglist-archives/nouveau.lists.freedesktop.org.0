Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF5AA3C9C
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3E110E5A0;
	Tue, 29 Apr 2025 23:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fDV/zl4f";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5C10E5A5
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvR7sT0IRvoSzqOG2vZ80ojTjs2R5NTXoJaim0nMVnmP5J2hqztc1fQiup2OWLcrYcBPfofbphAC16C2L6q+64Qprx9VJ/t9bPpZT+ec4QumWYhgsR7vqBR6r6MYImbAIScl/Ha/BA6Hgqf6x2+7FBqsV15OZjSirfC4IB0TrZqNJSFCFopA9ijcV4e5cs+e8nOakhc4hMakiRGt4n592suL80Kjfy+ZJPtScGgYvex1v3pQ6y3iHmAPsDk2Ck9/IFOjG6LVkILmJC/95ICWG+NtzgnBFAgvWWpKdza/XlcEk/Rpb6X+XRsb3DDtotUKDtPoA58tYpkjf3LmFIc4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpdHzxpStxSRjODFic8HHCQFpZQM0gMQYlSGQf74GsQ=;
 b=P63uMEmEvXLwacE6o+4ioX9xK8/Cg+xuKQF5N+MKrhwASLmXFItV456oUmmAsAPuDkTAxnaCjU+Sxu3TlIcW30uHU7d98f34ROISolZ36fbvAYtphKdQhiQacRI6t3uCeQudzbHZbPMZzKd90paw5/UBn71WB/32g9R7O9ZuFkS5W9uTZre22aODxL3GNuKKT+IKOo7pGuLQ/NOoiuqb/lIiR30eSA8IT0uJ334bvopKGvzHteCY8mpSUKaY+q2o1lotIFjfSHjejUSPNNksnWXyhW6sTYWcq6aWiVePYxTH3PoKtQQ6G35ohi1pQO8dckvinLDnr/D1jxCzMwsQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpdHzxpStxSRjODFic8HHCQFpZQM0gMQYlSGQf74GsQ=;
 b=fDV/zl4fWqZbl5liIMSnL4/CMOrbcIQ04EHRKEH4V/y/6rJ6zkFbJFebtv6i2CT1j3w0JB4HWZJba8yk3Uim558eYL18EZSqWZPDGRWlfaq70Ae1XyWWFQOh7alNPNYNZJFlvnxEEljosRAHT0MWjzx3PX4lIj8NdOJQbXOmnKpG40zP9lvtSDy0BNbIqM1WaU7vq1SB8T00x03btSGQSmvcBRA2HM7Q7sFb0TqCNhZzYXxbn/TH89jRwd9b+hL8fq6M1kyD/dC+Y2nbbYLryJol+t1lkkTYr5yqRyteycScVwOMh7ivD2z+SULUSsKCLJZWPrdxA3iGMZD22CzNuA==
Received: from PH0PR07CA0076.namprd07.prod.outlook.com (2603:10b6:510:f::21)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 23:40:46 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::92) by PH0PR07CA0076.outlook.office365.com
 (2603:10b6:510:f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:29 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 41/60] drm/nouveau/gsp: add hal for fifo.rc_triggered()
Date: Wed, 30 Apr 2025 09:39:09 +1000
Message-ID: <20250429233929.24363-42-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: deb15fa4-7d11-42af-25f4-08dd87774391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bFehQpYWheLU9gR0JTtVZoC8JxzGN+L9AKEXYmnfseq8Rwqakd6vsCMIYFOE?=
 =?us-ascii?Q?B8IUHswrPngWng4dGj3osmsUSHpjmVlENmnW8pE472VjRLxVZO5lp47qHQwi?=
 =?us-ascii?Q?cbkzado9HlaqJnOfItps7l/Y2G/oRpNu6WLVYP0YOXjB4tfABaYdbYLbc+4b?=
 =?us-ascii?Q?Eg++qKRNn19Yy56FxYU7kh0q8nmEaNfdAVQuQH57NRGfxoH5kunIB6xFMbRf?=
 =?us-ascii?Q?5exYgQbBLtuHNc3xIgCus7V6bvDMuJjO5wSBYLIrlCV564CK1TLPPfEk0f/H?=
 =?us-ascii?Q?AN5VR29RhQQUKmvEslRFJjz5CRQPhbBqBu8tuUB6+WUWaEZfqR9Nkzh+R/zb?=
 =?us-ascii?Q?q1k74Rmluo3E6GABy4BTFMVn3PTgDYQtWTfz5RDi09I5d1DYk+LAYn0GpR0N?=
 =?us-ascii?Q?4mVOVSu20eRl7m7LhwRRmXLlwmyDQ8jDPTl59ljveALoKMGay3k1qSywZq05?=
 =?us-ascii?Q?SKE1bqil0INBE6XWm2AT2hBi/qpuuuzlCSfHbnk1JxbgwO7T/Eh0DA3DKXq7?=
 =?us-ascii?Q?YORTLZB5DKf2/tMpd+lL/9IyqCiZq5sGmlI5F5FAjyfYgjfyH0c74PXp9Bct?=
 =?us-ascii?Q?0ylo4/E8lsz1OkL2mfDuWk5ZYvFJGd67Q9xQkcMn1rbYSxWSm8ORCDeS0fbm?=
 =?us-ascii?Q?ZKWrDq0xbM6zJnISODLKCalsf1vbvq6WzRFJ+LBGJrqON/ZavVJOiOquBRes?=
 =?us-ascii?Q?DPAee4xcOqZ/yCQZHIk1BKMJy6NiDdR5K5Hjm0t7oc5+vKKg2YsnMUWR4/r7?=
 =?us-ascii?Q?s7yzDd/Hm6UWIpOMwkCi4URpMV+j9eJVeHL0ddqOOdxpKIt/aMjG1Zf70AER?=
 =?us-ascii?Q?kgBJllblFJRmNnJmLReh9P7hnYk+P+S/DLFEs/nFDI2HwCSz8CIfcZQlzzMr?=
 =?us-ascii?Q?bz8IbiyFAJ4AykSkprkq+EyRzc1sPEM6KeKjful5t0/V9nCf3HCzCsu5yVu8?=
 =?us-ascii?Q?SyOsVDIecxAaL/28dx0/0/hvdAKU0AgVEKjhMitL1ia8DmRiLZ2rnZAXKNhR?=
 =?us-ascii?Q?KmUd+JfWsZ+XmhYC9szmKGhwu+F60SfIJLVnqka1M8k+LA4skSlNhOZTBgC1?=
 =?us-ascii?Q?Wf1QPx2fkCs0W6eMgBXAeSGbn8GAUI3Ap2D8zsp+hXfZ17QEWBRI3USnQ7Q4?=
 =?us-ascii?Q?nR8JAxzPO1Zdam9SUTiYwiW87Du0XjHC9vI4gGr182PCSV1gGbcZpIG3IkSR?=
 =?us-ascii?Q?cZIf1FDB0AujIFk89kCurPZ7LlGAV23lrjPr5aG2VK8JAeOHwNe6Btbz0RKx?=
 =?us-ascii?Q?6M6iYKuUuKQU7MtjcOgbU25AlPxofjYWRis9EHhd8Y/u63jWuphwdzzvuC8o?=
 =?us-ascii?Q?wh8dWgHFdfS3UYr9yRJTP4BqbfIIUXRUT5py4AHHvh2yRK8KZJG2oASioHaZ?=
 =?us-ascii?Q?dGdGI0D+MFZnMSf4LkfMxU2mJ9FGDfOsxcfE4xFvqsu2VT00JAgioz6p9EAa?=
 =?us-ascii?Q?27MYg38uryIj8TPi5281LQE0Ful3u7ZmBiP9n/ChpvfcCm7eFFTOTH7tyGUB?=
 =?us-ascii?Q?Y93Tvk94ZC6kT3ttiN+Cqs6yQagM9nI8CDxp?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:45.9428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb15fa4-7d11-42af-25f4-08dd87774391
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022
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

565.57.01 has incompatible changes to rpc_rc_triggered_v17_02.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 34 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 30 +---------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 3 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index d6c3f2d01e56..a98e50f74c5c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -454,6 +454,39 @@ r535_runl = {
 	.allow = r535_runl_allow,
 };
 
+static void
+r535_fifo_rc_chid(struct nvkm_fifo *fifo, int chid)
+{
+	struct nvkm_chan *chan;
+	unsigned long flags;
+
+	chan = nvkm_chan_get_chid(&fifo->engine, chid / CHID_PER_USERD, &flags);
+	if (!chan) {
+		nvkm_error(&fifo->engine.subdev, "rc: chid %d not found!\n", chid);
+		return;
+	}
+
+	nvkm_chan_error(chan, false);
+	nvkm_chan_put(&chan, flags);
+}
+
+static int
+r535_fifo_rc_triggered(void *priv, u32 fn, void *repv, u32 repc)
+{
+	rpc_rc_triggered_v17_02 *msg = repv;
+	struct nvkm_gsp *gsp = priv;
+
+	if (WARN_ON(repc < sizeof(*msg)))
+		return -EINVAL;
+
+	nvkm_error(&gsp->subdev, "rc: engn:%08x chid:%d type:%d scope:%d part:%d\n",
+		   msg->nv2080EngineType, msg->chid, msg->exceptType, msg->scope,
+		   msg->partitionAttributionId);
+
+	r535_fifo_rc_chid(gsp->subdev.device->fifo, msg->chid);
+	return 0;
+}
+
 static int
 r535_fifo_xlat_rm_engine_type(u32 rm, enum nvkm_subdev_type *ptype, int *p2080)
 {
@@ -673,6 +706,7 @@ const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
 	.ectx_size = r535_fifo_ectx_size,
+	.rc_triggered = r535_fifo_rc_triggered,
 	.chan = {
 		.alloc = r535_chan_alloc,
 	},
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index fc1f4219e624..94c3c55eb314 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -927,33 +927,6 @@ r535_gsp_msg_os_error_log(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
-static int
-r535_gsp_msg_rc_triggered(void *priv, u32 fn, void *repv, u32 repc)
-{
-	rpc_rc_triggered_v17_02 *msg = repv;
-	struct nvkm_gsp *gsp = priv;
-	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvkm_chan *chan;
-	unsigned long flags;
-
-	if (WARN_ON(repc < sizeof(*msg)))
-		return -EINVAL;
-
-	nvkm_error(subdev, "rc engn:%08x chid:%d type:%d scope:%d part:%d\n",
-		   msg->nv2080EngineType, msg->chid, msg->exceptType, msg->scope,
-		   msg->partitionAttributionId);
-
-	chan = nvkm_chan_get_chid(&subdev->device->fifo->engine, msg->chid / 8, &flags);
-	if (!chan) {
-		nvkm_error(subdev, "rc chid:%d not found!\n", msg->chid);
-		return 0;
-	}
-
-	nvkm_chan_error(chan, false);
-	nvkm_chan_put(&chan, flags);
-	return 0;
-}
-
 static int
 r535_gsp_msg_mmu_fault_queued(void *priv, u32 fn, void *repv, u32 repc)
 {
@@ -2159,8 +2132,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
 			      r535_gsp_msg_run_cpu_sequencer, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_POST_EVENT, r535_gsp_msg_post_event, gsp);
-	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
-			      r535_gsp_msg_rc_triggered, gsp);
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_RC_TRIGGERED, rmapi->fifo->rc_triggered, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
 			      r535_gsp_msg_mmu_fault_queued, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 16eb3492f9db..263513a52bae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -101,6 +101,7 @@ struct nvkm_rm_api {
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
 		unsigned rsvd_chids;
+		int (*rc_triggered)(void *priv, u32 fn, void *repv, u32 repc);
 		struct {
 			int (*alloc)(struct nvkm_gsp_device *, u32 nv2080_engine_type, u8 runq, bool priv,
 				     int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
-- 
2.49.0

