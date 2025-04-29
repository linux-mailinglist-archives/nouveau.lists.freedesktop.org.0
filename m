Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85201AA3C9D
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB21210E5A1;
	Tue, 29 Apr 2025 23:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RVQ3r9Yx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E40010E5A0
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYSmSQhdNMPfLshHFZmh6B8W4hSV1zISp/4s7cioUemLR3x0/mC4Y+SZ3Sy/e/DE8OcjYHp18kwi94uT4f2/mjVORr6zz3aYlkkjrAo+n742G2srzOvqiWb7OCPKC6FmIWUO7vo949zkCWJNK+MJ+kt61FpAoQSr4nTbM9FfPUl7zbawccEE+8DaUyt+9J0Nf9aTcsAKQ31oCipNQ0KjbediKqDonQM54a/zIJtcInU0d+wTHye9A4lfu/NdWOCt5pMu2BehUP0ECk8zvVYGIOf7rqvW6bDePnBqj/Lr2I86J80GMiatOaqorMbkQuYm2y5g0wjZjbKIlsyBinDxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUmYDyjp6jxD0urk0g0hqiorLMSgdDwdQPABpMHRt68=;
 b=f57eSKRIhkRZ9GnjHKcBGHXM1nV76Qg6L40Ln4WZQN2JcZfyCKfKNDwdNReRBCrEpSvSxuG/nAO0M3nBFGh4pC8I/ljxchtAjnl0fe6NeBeq7zB3/Lu4Bx9BS7PhvNLwOo6OTlXCcqYuSsJCzZru1vbo1LCIDu2pPxJ3BJ4FQA8BIYqFohpTzJvmjz6ya3Jl1pUzHUeCR4BS750M2dL36parOCQbmEcmHCFYCTaif4fiR3is1PUZjAvLPHWakf7j8ptbBvVKs1DRbeJBpW9ZAHrqhrpjE4Za5hBVbYNeOVchyk/0oSbdTHVDMxZ00P2cpJbFBLrAa1b+FIzMtQqWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUmYDyjp6jxD0urk0g0hqiorLMSgdDwdQPABpMHRt68=;
 b=RVQ3r9YxzHK6fRuUJP9/6t0Z1Ag1YJoUC0bONEgoMpziZjENiWJv+Tso5Wq3xqejpubxmc2ae1rdQW5143J6EzRcJGVe6a4JcGTzUF6F4BwioBLms2EKyp6rRHklv7+/1GHixuY+jibVCwIxfJM1S8ly3ksNmna+xrfCF7+VLofRORV+ahuUfUGBH/cGhBdWWHwI55Lzw/6Q9iOl3BSSEpYWbFYArcGX3Gr/fd895R5sz1qrcAbyvXAtm0itLA1IORrSwEMFHrKHy0X465jFiyOnf4UtChQ83tAjbOgs56o5Luh5xKKlVbRPbJJjvP9Qwr2lF+w3QYAeMV/lHca5XA==
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:40:44 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::37) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 23:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:26 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 39/60] drm/nouveau/gsp: add hal for fifo.chan.alloc
Date: Wed, 30 Apr 2025 09:39:07 +1000
Message-ID: <20250429233929.24363-40-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 639dd0bb-9468-4337-89ca-08dd8777423d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3lhbawqc0Kfzy8E3MzhIox4rEC86oyvxuk7ycH0p/cCSlzh22LxIh8BymcTG?=
 =?us-ascii?Q?6SsMjZxGyVjMt6sOx1vEe+hl8zeshSES1+sWYJeOstztWCD+E7iNKlq/LQc2?=
 =?us-ascii?Q?cRb2T8eKtavDl4JOvOji/m76lLovsMKmJqziZzdY+VeH+qoAWWrlgQgKW421?=
 =?us-ascii?Q?SpWYdaMaszNXnEdBQiN51ot8Z6eHnsHCAKy9cwk4h51G1lU1IetWVoFMKkeG?=
 =?us-ascii?Q?Vrzt9dRy2P4gFILXRSkDd/fFNlN3uws2VXbW9D/zMdirxcPEgWW8cEWmBgjs?=
 =?us-ascii?Q?cjeHN03/KWMMW8OZu46NRyRJ39aK5T7iBbvMYsyC0HxHiDSYgnDLsWK529EP?=
 =?us-ascii?Q?src5Vr+NwKH2KxS5NFl84mXsGGPAjla1PIza+Nc/eloPw7RZoezK6mjQDEsO?=
 =?us-ascii?Q?7uY6nDcpxqZ7Ls8RrdhFyzMze4qV4+qRVI3Ri9LMf5QsyT+BYyRj4W+r2up2?=
 =?us-ascii?Q?zTTyi80RGRJtw2LWPt35mCmY+tmKfC04gFCDt0A3zZZdanKnfW4utiN1XDBP?=
 =?us-ascii?Q?PIkQhPm+ZZf8UTjSM5viSXvFRTQNZJNlcD9XboWLs448c+NDzMh7ds1+NZlZ?=
 =?us-ascii?Q?QkoMf7bbYrkI2+h3Q1y7v1WyEH+oSIuJF8IsAR39xlBVSTBJ30LSUUjQBYNF?=
 =?us-ascii?Q?zJVvPQF7T2Lgt0gHslrAOZKQ9rnin8aS7Uua0ClXnysV2S9ECXdaldiIwVYt?=
 =?us-ascii?Q?rimmwnJ0aWc1yLiHswE2zpoJUCJTzNZlWcSfJE6ajVvevLOLNzcqNmPL5E8s?=
 =?us-ascii?Q?LLkBfTTzUDhfNnBCR/QcUHMwALAL/LNeTWaET3x40AtTOl3OUt296HdItFxN?=
 =?us-ascii?Q?mdABKyL2ku6AnSVz27jaU4zGO5yMTVjAJh4h4hXIfxTMFEyfy5gGuMi7Ga2h?=
 =?us-ascii?Q?+l5ekZNTqxZ2+YiDMS1lH9Y+fKa2uSKdmH+EikGTsSrK66MOyFMQtjMgNjwP?=
 =?us-ascii?Q?X4rzvFf6ojQjbgGEzt/4SZAoIcxL63H1LlnW6wHPyAhma0C4jeJftjql6ouK?=
 =?us-ascii?Q?E2P/HAQV/KQEkpwjqyL1K9z0Qzz1tpXk3VKiPAxr4EZMc4K6VfyZHBV2SYKp?=
 =?us-ascii?Q?/psGA+i0U0Rwx3CV+hhFJKt/tknt68e5sVSEYYFhmbprwzIht9DK5mKRIG27?=
 =?us-ascii?Q?hX4YrPhLGPnZbR3FWs6/0Q27NE4iUKHAdm4IQLY2fTlxc33IX+g5u74bykov?=
 =?us-ascii?Q?nYrKwHAmAWF14OFuHJYz+cqajaW8HWMrSn+/qPcrIu3eeARMZ8LDhOTgu9yB?=
 =?us-ascii?Q?+Zbl1nYhbeiLRCu0gc7taz2pNc7fA4X78TwmoRALPpslOqMwzDsnIK1uu75F?=
 =?us-ascii?Q?JC2/LHmG+4MYHr31xB1zKDbWugcjuMYTmUmLY8wVSTPKR2/npT5i0Reuf6Ak?=
 =?us-ascii?Q?+YwEkG1w8WBk4eOEq3E8aVNLc3QI2Vd05hyu6zuOp+s3PWXKGYfesn6+lnuj?=
 =?us-ascii?Q?RIvhdDA0P/Fe6ppW441VdyqLg5nP9dVG+PDwHG088qPsAyZV0nWzqQLHAAAa?=
 =?us-ascii?Q?R6S2UdiQ23CnwSJJE7a9+Sox4gv8jTOYtv/l?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:43.7204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639dd0bb-9468-4337-89ca-08dd8777423d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
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

570.86.16 has incompatible changes to NV_CHANNEL_ALLOC_PARAMS.

At the same time, remove the duplicated channel allocation code from
golden context init.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 103 +++++++++++-------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  69 ++----------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   6 +
 3 files changed, 75 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 79c19f0682ad..eb54146365bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -70,50 +70,29 @@ r535_chan_ramfc_clear(struct nvkm_chan *chan)
 #define CHID_PER_USERD 8
 
 static int
-r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm, bool priv)
+r535_chan_alloc(struct nvkm_gsp_device *device, u32 nv2080_engine_type, u8 runq, bool priv,
+		int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
+		struct nvkm_vmm *vmm, u64 gpfifo_offset, u32 gpfifo_length,
+		struct nvkm_gsp_object *chan)
 {
-	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
-	struct nvkm_engn *engn;
-	struct nvkm_device *device = fifo->engine.subdev.device;
+	struct nvkm_gsp *gsp = device->object.client->gsp;
+	struct nvkm_fifo *fifo = gsp->subdev.device->fifo;
+	const int userd_p = chid / CHID_PER_USERD;
+	const int userd_i = chid % CHID_PER_USERD;
 	NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
-	const int userd_p = chan->id / CHID_PER_USERD;
-	const int userd_i = chan->id % CHID_PER_USERD;
-	u32 eT = ~0;
-	int ret;
 
-	if (unlikely(device->gr && !device->gr->engine.subdev.oneinit)) {
-		ret = nvkm_subdev_oneinit(&device->gr->engine.subdev);
-		if (ret)
-			return ret;
-	}
-
-	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
-		eT = engn->id;
-		break;
-	}
-
-	if (WARN_ON(eT == ~0))
-		return -EINVAL;
-
-	chan->rm.mthdbuf.ptr = dma_alloc_coherent(fifo->engine.subdev.device->dev,
-						  fifo->rm.mthdbuf_size,
-						  &chan->rm.mthdbuf.addr, GFP_KERNEL);
-	if (!chan->rm.mthdbuf.ptr)
-		return -ENOMEM;
-
-	args = nvkm_gsp_rm_alloc_get(&device->gsp->internal.device.object, 0xf1f00000 | chan->id,
-				     fifo->func->chan.user.oclass, sizeof(*args),
-				     &chan->rm.object);
+	args = nvkm_gsp_rm_alloc_get(&device->object, 0xf1f00000 | chid,
+				     fifo->func->chan.user.oclass, sizeof(*args), chan);
 	if (WARN_ON(IS_ERR(args)))
 		return PTR_ERR(args);
 
-	args->gpFifoOffset = offset;
-	args->gpFifoEntries = length / 8;
+	args->gpFifoOffset = gpfifo_offset;
+	args->gpFifoEntries = gpfifo_length / 8;
 
 	args->flags  = NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL);
 	args->flags |= NVDEF(NVOS04, FLAGS, VPR, FALSE);
 	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE);
-	args->flags |= NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, chan->runq);
+	args->flags |= NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, runq);
 	if (!priv)
 		args->flags |= NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, FALSE);
 	else
@@ -136,25 +115,25 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	args->flags |= NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE);
 	args->flags |= NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
 
-	args->hVASpace = chan->vmm->rm.object.handle;
-	args->engineType = eT;
+	args->hVASpace = vmm->rm.object.handle;
+	args->engineType = nv2080_engine_type;
 
-	args->instanceMem.base = chan->inst->addr;
-	args->instanceMem.size = chan->inst->size;
+	args->instanceMem.base = inst_addr;
+	args->instanceMem.size = fifo->func->chan.func->inst->size;
 	args->instanceMem.addressSpace = 2;
 	args->instanceMem.cacheAttrib = 1;
 
-	args->userdMem.base = nvkm_memory_addr(chan->userd.mem) + chan->userd.base;
+	args->userdMem.base = userd_addr;
 	args->userdMem.size = fifo->func->chan.func->userd->size;
 	args->userdMem.addressSpace = 2;
 	args->userdMem.cacheAttrib = 1;
 
-	args->ramfcMem.base = chan->inst->addr + 0;
+	args->ramfcMem.base = inst_addr;
 	args->ramfcMem.size = 0x200;
 	args->ramfcMem.addressSpace = 2;
 	args->ramfcMem.cacheAttrib = 1;
 
-	args->mthdbufMem.base = chan->rm.mthdbuf.addr;
+	args->mthdbufMem.base = mthdbuf_addr;
 	args->mthdbufMem.size = fifo->rm.mthdbuf_size;
 	args->mthdbufMem.addressSpace = 1;
 	args->mthdbufMem.cacheAttrib = 0;
@@ -166,7 +145,44 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE);
 	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
 
-	ret = nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
+	return nvkm_gsp_rm_alloc_wr(chan, args);
+}
+
+static int
+r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm, bool priv)
+{
+	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
+	struct nvkm_engn *engn;
+	struct nvkm_device *device = fifo->engine.subdev.device;
+	const struct nvkm_rm_api *rmapi = device->gsp->rm->api;
+	u32 eT = ~0;
+	int ret;
+
+	if (unlikely(device->gr && !device->gr->engine.subdev.oneinit)) {
+		ret = nvkm_subdev_oneinit(&device->gr->engine.subdev);
+		if (ret)
+			return ret;
+	}
+
+	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
+		eT = engn->id;
+		break;
+	}
+
+	if (WARN_ON(eT == ~0))
+		return -EINVAL;
+
+	chan->rm.mthdbuf.ptr = dma_alloc_coherent(fifo->engine.subdev.device->dev,
+						  fifo->rm.mthdbuf_size,
+						  &chan->rm.mthdbuf.addr, GFP_KERNEL);
+	if (!chan->rm.mthdbuf.ptr)
+		return -ENOMEM;
+
+	ret = rmapi->fifo->chan.alloc(&device->gsp->internal.device, eT, chan->runq, priv,
+				      chan->id, chan->inst->addr,
+				      nvkm_memory_addr(chan->userd.mem) + chan->userd.base,
+				      chan->rm.mthdbuf.addr, chan->vmm, offset, length,
+				      &chan->rm.object);
 	if (ret)
 		return ret;
 
@@ -656,4 +672,7 @@ const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
 	.ectx_size = r535_fifo_ectx_size,
+	.chan = {
+		.alloc = r535_chan_alloc,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 48e415c185f0..bafe0af60d9c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -281,6 +281,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 		struct nvkm_gsp_object chan;
 		struct nvkm_vma *vma[R515_GR_MAX_CTXBUFS];
 	} golden = {};
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret;
 
 	/* Allocate a channel to use for golden context init. */
@@ -296,67 +297,13 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	{
-		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
-
-		args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, 0xf1f00000,
-					     device->fifo->func->chan.user.oclass,
-					     sizeof(*args), &golden.chan);
-		if (IS_ERR(args)) {
-			ret = PTR_ERR(args);
-			goto done;
-		}
-
-		args->gpFifoOffset = 0;
-		args->gpFifoEntries = 0x1000 / 8;
-		args->flags =
-			NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL) |
-			NVDEF(NVOS04, FLAGS, VPR, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE) |
-			NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, 0) |
-			NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE) |
-			NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE) |
-			NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, 0) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE) |
-			NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, 0) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE) |
-			NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE) |
-			NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE) |
-			NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT) |
-			NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE) |
-			NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
-		args->hVASpace = golden.vmm->rm.object.handle;
-		args->engineType = 1;
-		args->instanceMem.base = nvkm_memory_addr(golden.inst);
-		args->instanceMem.size = 0x1000;
-		args->instanceMem.addressSpace = 2;
-		args->instanceMem.cacheAttrib = 1;
-		args->ramfcMem.base = nvkm_memory_addr(golden.inst);
-		args->ramfcMem.size = 0x200;
-		args->ramfcMem.addressSpace = 2;
-		args->ramfcMem.cacheAttrib = 1;
-		args->userdMem.base = nvkm_memory_addr(golden.inst) + 0x1000;
-		args->userdMem.size = 0x200;
-		args->userdMem.addressSpace = 2;
-		args->userdMem.cacheAttrib = 1;
-		args->mthdbufMem.base = nvkm_memory_addr(golden.inst) + 0x2000;
-		args->mthdbufMem.size = 0x5000;
-		args->mthdbufMem.addressSpace = 2;
-		args->mthdbufMem.cacheAttrib = 1;
-		args->internalFlags =
-			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN) |
-			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE) |
-			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
-
-		ret = nvkm_gsp_rm_alloc_wr(&golden.chan, args);
-		if (ret)
-			goto done;
-	}
+	ret = rmapi->fifo->chan.alloc(&gsp->internal.device, 1, 0, true, 0,
+				      nvkm_memory_addr(golden.inst),
+				      nvkm_memory_addr(golden.inst) + 0x1000,
+				      nvkm_memory_addr(golden.inst) + 0x2000,
+				      golden.vmm, 0, 0x1000, &golden.chan);
+	if (ret)
+		goto done;
 
 	/* Fetch context buffer info from RM and allocate each of them here to use
 	 * during golden context init (or later as a global context buffer).
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 6a6aca0afaad..c0abbcb2908e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -100,6 +100,12 @@ struct nvkm_rm_api {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
+		struct {
+			int (*alloc)(struct nvkm_gsp_device *, u32 nv2080_engine_type, u8 runq, bool priv,
+				     int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
+				     struct nvkm_vmm *, u64 gpfifo_offset, u32 gpfifo_length,
+				     struct nvkm_gsp_object *);
+		} chan;
 	} *fifo;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

