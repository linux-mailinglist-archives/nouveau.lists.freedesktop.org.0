Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0BABA726
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBA10EBD7;
	Sat, 17 May 2025 00:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DGk+2E8m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0CB10EBD9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHpIEZjwOnsKaIxL8lqT5wjIth13fjqsTWM+nxLDCXb9tpsaewDLXfB8462I4OYrtZ1ambUlAprotIkMNVch5nkhqVlvz6v9y72MTLmjfO3/uCk1bINllo4imdO9OlUL1eIdeJOgutsgXuJjv85TBm2zGcZiFqx4el29OqQgpGVwM3/yN33MGy4gqOwaSuRZ5s4wOC7/ltxoMxF6wOg3ykN4DVtdSbnFYth9QkVjDVohShCYEBfTT5USy4GQ5cdAX76/hl4AO0fQucaWFFS0cigNfQyyLYZmz8C5WiXDFCWgiR72BOEyI/1js3C1/FMUf2Xu4vIvIHFW872uPHJY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKZJCchRF2h1iI4N1Y+On/OdsckWocKeusE/5WuKg+I=;
 b=uJGk6edUBlDa3ht79UIJiJQ9Zo2gjKVhnctotkB9amfvwVORrzzCNQAkn3mnArGkiTWwpyQZLvHJDCrHTc61782GFdj+CcPQqSVQAUDZGjS2FndafL63KEsRJTaex+LJ6ZanNSFuXsbFwSPSoUtDRj7m5r6IzIG9ShdAIH6ewWrhq+50udV6lMT6xSpAJMcVnlXtotRjjDjJXLBUKzgUKZfDSzHtczJabi4ztq95qeNK0ZAALwXFWvGCCag9AovSt04afTRX9ka+r443hStg2fGfv5zYNey2oZzIi0RFDV/wTGXi+3sobZSieiHht8wsP5cqfXs17D7wi1mJcrUZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKZJCchRF2h1iI4N1Y+On/OdsckWocKeusE/5WuKg+I=;
 b=DGk+2E8mzBmDP+4D2qhJxT83/znVTyK7FBBCH7JHD6/PNhpEgE00x+ZRDDPkruszV99IG453TxpaocEQcnAIkXCo7aEuyIP1xNb7KFWJPbJRcFMG/FLztJVP+4Xr/45HCwSM/c1mS4jiQMpy2OHbQkJpwoPi3MWM+HGlDba53MK4fIdmFTDSsNoilPN0B0s314DluGhCzhhsithY/kuQEZqWUqPYCF4WR5B+d1pVj96PUzVRz5R9jPJ7hGaebR4fWk1L7q9Ticq1W86iy2WoMFLcR9YaV5GiTssrxQGbsSnVpvkLFyzlhAxa1+u2AYjINUzR/5TdtuO3cwDfLDWz+A==
Received: from MW4PR04CA0324.namprd04.prod.outlook.com (2603:10b6:303:82::29)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:24 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::ef) by MW4PR04CA0324.outlook.office365.com
 (2603:10b6:303:82::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:08 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 41/62] drm/nouveau/gsp: add hal for fifo.rc_triggered()
Date: Sat, 17 May 2025 10:09:33 +1000
Message-ID: <20250517000954.35691-42-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1ae1ca-276b-4d5d-8172-08dd94d75bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rI9YKPs+iZL7N5tnEZYJRtoLJy4G2y0cfHzGOHSnqXVrZ6vdSX42q2IQqgu9?=
 =?us-ascii?Q?HcJ1yAkb1IvXT1mW58eDvegBoycWCuh+OJFvOm/6uVBnfRZSDrfuYnjoUAsv?=
 =?us-ascii?Q?KyoJ80+xt1o9JC10+KQyJQbkcFuVofID4qlHlLSRIiXQ3xISF7tvhSTiqqqu?=
 =?us-ascii?Q?mjH+uC0NJmgO19OpYDCW+nQxdYZbAjMOp+pDk0Ria0u5I3q6ZjR9egTmF35+?=
 =?us-ascii?Q?h9AYn7WtUmrx6XlGDpHYUKeJ6XpBD63mbGhT7/Qhbr1XFB7NqVUFJoljIO9L?=
 =?us-ascii?Q?aq1ijFdrRlel7K9ppOHIiKa3rNHsy5KLjptgtKNy2YqSvkS0mZc5AYeFUJb7?=
 =?us-ascii?Q?C9yHxbo7WUAGGgQ8ppRfLyz0NJhGVsh41Pd9NzytybKalCDZCZ5vDuszdBgz?=
 =?us-ascii?Q?MPCKuP/KzjJw90Y6JZHOD/iqlNM2V/51I914R8oRiSx8i5Fxs5VRwUT/wNIV?=
 =?us-ascii?Q?qauU1Niw/ibjmNOxiCngf9xAc++dmILNQ/QVMJrPxlMw3/Kmgpuot4CnFm5K?=
 =?us-ascii?Q?cwlx+ZmBsqwqkmFyVZd5tnb2KrQI0z3d2tPdhqmLuLUlzGPjBzELRA+nTw/6?=
 =?us-ascii?Q?c8QwiURURHad2ylnNESxS4kLE/XLGjT4v1mzEf38H14jWVaSzL3PJ21KfwUp?=
 =?us-ascii?Q?h9AFit3G4CBBThkU2zuRs1YQBX56astFdMkNbg1q3md+1+k0V07wsWlrXsQu?=
 =?us-ascii?Q?6LzBSITTLqZXAoUS9UWI++fKPO/DIeGjarDHZa79vAMAIsGjzu9gqNv6QLHd?=
 =?us-ascii?Q?lvBqVnah6qUHshXb9qZnKxPFsj/UGklnwVHeVDzVAgQ8YOKLsxtC0VHORRai?=
 =?us-ascii?Q?WOOwmQPgKz1yOk3CQ0oR6mGP4YzA3aP6fwK5mc/VKfvitfjOEQ+f/0PHrhNB?=
 =?us-ascii?Q?Oc6OkveDwMKp2CNOWbWyhCXQxkmptvlUZGAe4XukZ9cPBqthcgkxH4NrbffT?=
 =?us-ascii?Q?9IlfwoK+HMG12jaIfgJYFjrClWLMovf4JbfgOgLTKbtmvZUyHFoS2i+rJG4s?=
 =?us-ascii?Q?0bpSi5frufxoati8txNmedD5iFA8sJRi+lKi7zpGbQCv7YMOYjzJtxH2Obl1?=
 =?us-ascii?Q?hxSz10+nYB18dJyvoO9iC4AiYoiJoIhhCIiA9LiaXEFfPdjplZ83NO/Ovx15?=
 =?us-ascii?Q?SPftaTEz32jRjYyl3RHT5dJtrCWbhUC9KqRe3h+JACg6l7XKAWQy+bV46ZSK?=
 =?us-ascii?Q?YytIfer5ilamuB5ghz/K5dPCfxrA4bhVORAbSnPQa0yfMUv0WMwjwiBfTDpm?=
 =?us-ascii?Q?tgS+yYX+v3LsjWLlBqZWtnhqa6hPTYZ6oxmj3i09tOXOj+5Wnumsuk5ZaB8P?=
 =?us-ascii?Q?lHq05GHpxSOkj94QVTGaelx0xnj2+Pn9wve3IEz43PWtYny/xGe+q4zoZoXi?=
 =?us-ascii?Q?uS7C0YMCZm0UQFZy3Setvi8sQJ8gU+kDjt7uv86WRgUOZI/dqELazwYxpC5W?=
 =?us-ascii?Q?gy7koS/aBqqCVLKPup88H3Pc/P/xeLdBhDKOtwXMT6xF+isElD0t+vEmlEj5?=
 =?us-ascii?Q?CJtaWoN4ysm/YB56xqVXyYpF1Mn46clfE77d?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:23.8032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1ae1ca-276b-4d5d-8172-08dd94d75bfc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
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
index a480c1a5686d..1561b5a9b6fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -339,6 +339,39 @@ r535_runl = {
 	.allow = r535_runl_allow,
 };
 
+static void
+r535_fifo_rc_chid(struct nvkm_fifo *fifo, int chid)
+{
+	struct nvkm_chan *chan;
+	unsigned long flags;
+
+	chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
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
@@ -558,6 +591,7 @@ const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
 	.ectx_size = r535_fifo_ectx_size,
+	.rc_triggered = r535_fifo_rc_triggered,
 	.chan = {
 		.alloc = r535_chan_alloc,
 	},
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 64e9ecf93441..b7c2a785bc58 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -926,33 +926,6 @@ r535_gsp_msg_os_error_log(void *priv, u32 fn, void *repv, u32 repc)
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
-	chan = nvkm_chan_get_chid(&subdev->device->fifo->engine, msg->chid, &flags);
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
@@ -2154,8 +2127,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
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

