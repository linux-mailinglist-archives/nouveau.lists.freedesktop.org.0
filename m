Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE6AB2B6F
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A610E252;
	Sun, 11 May 2025 21:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RPuMBNtK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF05810E252
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl3XrtkGD/GXuniI6M2gfYfe1g/uT+ycrLk0IarSZE6n78iheLCIygjW9Tmw5uQKvHJxZH0QrXuzelSufePiiA5yTgnmg+U+/loF5MZwXvV8W6Ads+eEmdbacefckWmg3ycjzdfMRaHLZZ7PnKUV7RO4gwFKY47K/oPIuCGAREXVUmQwwav+C/4mFClRLyjUiEtl+VHrwVmTBQhInuDd1fDKRUA2IpLo3Z5ug0v78PuYUSVymSOTdBP9llUoBVw/X1OYyf8hAPbHMOoNVgk2b2ct/KHwvO3dIQrfXPl0R55vcnC3N1b2UXh0wM1RnB3InPlnrHTyE82TUqSIT0wrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPw5ecKSr0F5kyNaetc/xr7tFWqNRbXGuNV917Qdgjg=;
 b=h7eRL7ZQ7Fm82Pci/t+frqwh07A/TGA6qLhfn4yxKJNrJ4rAA2PLgDWmi+hPyBnlJ5T1xfVPlbXUlnQueRbdmAsB1znwt1t+9+dcNQlD+0JH+nx2nqgm5OOzdgW7qBfgOLVv/aWKoayV/VMsNah1CuWjNL/Bkoj/SEbPUdeaJXxTDuo+/adTzd9rFbjwcuuAcbKqVc27vtzv4I97tW37nQwZkBPE6h7twc0JEeXU3MGlmxF8qxK+53CCB/0T9SP9Ddq1ETb/xE7J/j9cIpmmrtw5eoUhrBYRPZ3qbcRqJZRaajvmFXa8LTERm7W+JB55rAWAXK9QZEvU92Qmx3YuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPw5ecKSr0F5kyNaetc/xr7tFWqNRbXGuNV917Qdgjg=;
 b=RPuMBNtKSWgm8HQvG3umg/Xk6HoIhDXYhJTFZbBqi5ZlRKhkDtodkuTy61KZmLMl/DaDvQzoZyuXpk2HZzEb4tLzRWDTgvQjIoOLst/5z20SvNrZqAI4as25jKgCbMqbE9k7zwqZQGZgdrHUj8iaZDdzq5tMe3vVIPUp8vTNOgQWXdOMMuZpMs0esFRlN66zd6eixGqOVFyKrNWc63wDZ4FuJZaOIQl6VMKGyljjVVGk+jFuHX0dgvM2Cu2qrcyszP/mQfnMfSyXEzCUOKvfgtfQsGXNLMTenLtnH8av99WTZpFvtDy8ajO31WKXPidM2HHQmatp5/1JLfYbiW8Ckg==
Received: from DM6PR07CA0038.namprd07.prod.outlook.com (2603:10b6:5:74::15) by
 CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.28; Sun, 11 May 2025 21:09:24 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::df) by DM6PR07CA0038.outlook.office365.com
 (2603:10b6:5:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:14 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 42/62] drm/nouveau/gsp: add hal for fifo.rc_triggered()
Date: Mon, 12 May 2025 07:07:02 +1000
Message-ID: <20250511210722.80350-43-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|CH2PR12MB4134:EE_
X-MS-Office365-Filtering-Correlation-Id: af2a1d73-3f69-4f65-9907-08dd90d01b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KjH0w7udip3Vi+lZH1HfuQ+9StgoIdh1tLqUqAEenVmHZoOIHSr5kPhv0sZ7?=
 =?us-ascii?Q?6RikbGOA/2gnIJZOwAa8/h1JkN83yKrRL5z+GIG4XgCzZw7AbV/6F6pn3Tge?=
 =?us-ascii?Q?3Jn61/s3BNTeVIiZUxJdd6t7HnWbdMThSTSOluiOxIMnTGCbbyiZXzHz5jls?=
 =?us-ascii?Q?p2Ds5JFb4vsfvRJGLPaFqfcEJn4o3UmUKoa+mlJqN0MjvXZXeFZzk5ryengM?=
 =?us-ascii?Q?OIT/dHHhO+ROnpZaJJ9CickUV+X0JPjf+wjd1Wpqv+hIJMbnUMVibEd8HROT?=
 =?us-ascii?Q?sNPxfwpeJiLWYL/LpJKe8JBzLdiPRzUApoi75ziNcVP6XSkGUJV1ttlTLuSE?=
 =?us-ascii?Q?YdLAg5RTPmfz0aT+kiUVRFM1LOnumIQKeXPKnt0k6OTfJ1u+yKwO3mHpUi1b?=
 =?us-ascii?Q?4Efm8N/CDQmz5cyrfXoS/DAG2viL2vofsgn/AoUnBxauhbYh2GVRZDGxuVqb?=
 =?us-ascii?Q?d+YFf3A8mgr8db4QZ0iUDnj0WJg4k4yeMm3busquBszJByj1/1VKjQRZDtUX?=
 =?us-ascii?Q?8GEuI1srcvHpOAM0+ABd2DWAFgT7dTMRagN0OUGRfS2jelY5QKU852KW5BW4?=
 =?us-ascii?Q?hvaqxj1OFWCiw2TiiEVMeI6X15OYs+1S5QtcAxELRD7D2LQO3eqZJJlwwHMu?=
 =?us-ascii?Q?+JEqjImtD3FgDiLMibNZRktpU54D7Xh3nCKDuSiP76+PUn4SFg1qhTy+2WxG?=
 =?us-ascii?Q?x1O6hzmNzVljqhxnQupDFRBOMhoxmdzNdTJACTe4CzwztRBj+P3zPfTkWEj1?=
 =?us-ascii?Q?dFM+pEkj+Hdpf9TLB/U1pTATlNwSrO4Uu21142nXZyn5YYLLVrH5Bar7PlHB?=
 =?us-ascii?Q?UN6Rgshf+NmyOXKJpceo8TLqecVQJ5xxOtxmeWPUWhmPHw/7J45xDUABJG8g?=
 =?us-ascii?Q?sxOCK6InKTnjDqFeP6Xh2vzxBh5kzYOiNRYrOEiLOLisCBy0PSmlnzhsq9LC?=
 =?us-ascii?Q?omuh2Jy/mYMn0GXQeqXKqp5NgcRBwpy5TRRxxOwJUg5CShmJ5TTPYB07l4zx?=
 =?us-ascii?Q?umQ4luP7fuUTODHQAQ7EbjIRDkliZesZCB6g6J4iMxQ1/tTQ48Tm+2+pxCvI?=
 =?us-ascii?Q?9pY9bBdrS7fdzerKn4JHRAZAuB7END5h76EpUnqlLtcjIQm+WLF3yU2uuEW4?=
 =?us-ascii?Q?zTcnCFDNiIvLSI/3SSHHo8drRKMNw0DfAVAy9R+hKT+Q8NbWO+p5y84QoUyJ?=
 =?us-ascii?Q?mFpdnvj6RapFVAQRhWBA2p5W5qjGrF/evPQv0BkVgVUFleoGdITIKjvs9Zn8?=
 =?us-ascii?Q?BLeHAKrswSp7S7Po2z4S7deB2NDUEoHuPXjVMRAxV7iMzMYV/n05KGtcKFce?=
 =?us-ascii?Q?0DYg3U8Rk8fwILDGXVeembT/UHa8+8Ct8cItQLpl2QI80H/BqcMsxx3jwSYt?=
 =?us-ascii?Q?05dQ+39Yr+g3ilaMKBeGDgz0ZtJvtt8IZHhdJpN+BgitXB64HILX+Q4Tc+cf?=
 =?us-ascii?Q?FIcjvxXxUEp72niw8F73dx5doDPdiJIaxsWsFYyxgzOfhmY0UHRVQq7EmTVg?=
 =?us-ascii?Q?hqh3y46GtlfygG6H1Yru9uH5e3JwsRd0rC6p?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:23.8172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af2a1d73-3f69-4f65-9907-08dd90d01b23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 34 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 30 +---------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 3 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index ed57d311bac4..70a2024cac5b 100644
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
index a370beda3c71..1ca5b025eeb4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -102,6 +102,7 @@ struct nvkm_rm_api {
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
 		unsigned rsvd_chids;
+		int (*rc_triggered)(void *priv, u32 fn, void *repv, u32 repc);
 		struct {
 			int (*alloc)(struct nvkm_gsp_device *, u32 handle,
 				     u32 nv2080_engine_type, u8 runq, bool priv, int chid,
-- 
2.49.0

