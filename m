Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE89ABA725
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E133710EBDA;
	Sat, 17 May 2025 00:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XnizHiAq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A010EBDA
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz3iL7mUPGN+VOeEuHcVbaTV9bKb/1S9DwrJ1Er1+y/VOR1NQ6Oem6gchDbh8D1E8bErJZqdUHaatlfg1lhuv9bIwUpMcPnuXXtBcdxRIv3V3ssRRpLnJnlLL6Ve0+Zi/vYqhvw7PF9ifT6h3lnWBIhRpm6tx7cDdvqOB7sQGaZB+1FIM6U+NfsjVkjNEQNvgXilUYnfIEJz4EccFfSobz1ckiehk9L3goz8+3jMVCI09hGdahLvPnNDtRX9bBaxFJ0Wgh/jcMdiaMAmJO3+CkqQGP/FKHh/rq2r6KW30DdEY+G+BdchTRFIKKWPzotxIzre2KB/KusVhenk6sKGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm2TFicGL/kcYSyw5neiEWz/C2ViFD2RYuMO+7/vya4=;
 b=EnpJ9BtwaigE0JvkRbcN+868AGTZJLrvWpqBLzZ0W7SrUsXWjgID/s/ewEwIWLtsQ/ywvWEGjXcMwPGOXw09qbSQgjAGqE2jimOaDLiI6M83EXpIwMPxxfPO7zqF1f5VB5ON6P4gxf12HGHo146EBL4Kb8inGVdT/VT8p8jNZ1KVZFi+QBSyVj1PEnPRYgrWwBqDdzBU8haPrsXAu6p6wStW9TirOxG5DFWHfoiTC9lGH//pyOso5hsC1o/e7T0dcMkZefoDUUz1orm/WFv7/xWcLoBjH0hhvW0MjnLz+oia5kCgdl4HM2leS+pg8zTTTQv2dpuXFMyR5xD6MnC3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm2TFicGL/kcYSyw5neiEWz/C2ViFD2RYuMO+7/vya4=;
 b=XnizHiAq0cC0hfeSQknCNx5UdF2XS9Cncs3m0agfiq1g9uXszr5MzyXJpGkEX/R4TqtdjTkbUvuQK1gQBmBG75lo0wuojmuFdPRQu/rcJcu4Eyyc7da8+dKIoQJ4BRJzxUwZJT/phGQZhFXu4h0IDTZRhDGXC4emAElEFV0ADc24BQeSg/9bfHr+AWqH301c1yuxo9HghHHGo/2IUBi+FwKP7KxuzvJqmQtnriICog+EdVF3tfxIWKvk8OlBqVtR5/t9TdQSuOYaSbzMXSPqkxL2G4fx6ibWw5FnFgDeoKmJLGYU7JOWU3F4i4Lykq8P5II6tIMwb8yvCjze8J1tcw==
Received: from PH7PR10CA0009.namprd10.prod.outlook.com (2603:10b6:510:23d::29)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:11:20 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::de) by PH7PR10CA0009.outlook.office365.com
 (2603:10b6:510:23d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:05 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 39/62] drm/nouveau/gsp: add hal for fifo.chan.alloc
Date: Sat, 17 May 2025 10:09:31 +1000
Message-ID: <20250517000954.35691-40-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 114e6027-d4f3-4509-2876-08dd94d759b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cJ0zH0Cm+hk2KpVBo38XxF+fs0rsuRPsV+/eBg7uTu8cagQjcQwxgPeITGeS?=
 =?us-ascii?Q?kNHES2mU7GJ0nSdtsEn89mdAlZKFqT1EyQ8AlOIc1XgRa7ivfD+hpoOrB22v?=
 =?us-ascii?Q?u4ayOQfzx8EMIElv+O8FFQcfmAUtueHOLQJj0xO+v881B+OLqHMWvHYSPFa8?=
 =?us-ascii?Q?SYaI7+3wmkKPDHCX6p2zeS7I1xR7ZJnTAYgUTRQXCLmukBcxGIp20gBLPquW?=
 =?us-ascii?Q?9aJ4r1V5Xpo04+rr9SU9c8mgqVEGra67em6b5tOlUXnCm+w6MUJ87TkFg3gF?=
 =?us-ascii?Q?XjQTNGiCO0CV4EovYMypTNt9JgMMWHD0Gzt19w3CFxoYu5heunHE/qpTTUtP?=
 =?us-ascii?Q?Glv0bmKS2mcXwX9b8sy/kxbf2oYO9oHaT8WuWNyXZkrwcFkJLqJ+W2dzQnK2?=
 =?us-ascii?Q?HbgfQWgirTsEW4XvPeSS9ARfJpAWJDkNXgitWqvXDtbJlYM/fCi1tQJFoYYt?=
 =?us-ascii?Q?4cW+W4Wlk/4SBeGllI+YQO0bGhGInd9UtxEAC94NWIjM/yPU2pQ7wcE+5RBW?=
 =?us-ascii?Q?5AbU4+NLQaQUtvdUEZdK0sKWJVL/YYlNcYSZsWATvBea1USQNGopTV2FKiE9?=
 =?us-ascii?Q?LcNlidMZOd7RCZcKWQYDCEibLsiOnfiwiDnYPyIfknIwHUwzkadIfudmSA/d?=
 =?us-ascii?Q?ZXGFWIpSwp4ImJKSDuo75MCre3v9h9VdK9ZILehNh0IK2Al4Ny4oIn6cq5TA?=
 =?us-ascii?Q?AQaXmOSdKRciwQIDVlgpcgO3he27lrMnLkEw6z5A89A32JE9SbNdkok5AVB1?=
 =?us-ascii?Q?5T7T+KsMwSX2mE9wdDyVmU0NiS7PyRR99jwFw1cxG83pFLDc1i1v/BpaQ9NF?=
 =?us-ascii?Q?66tTpoZlCElLykfefjVoNwzxjCWsrHe2dUsnK8ED05T3N31zzqSiRF88V6Ir?=
 =?us-ascii?Q?qZJL61K6Rkdgk9R5Yo+LnI+uvSt9WwiDD4hWesTR4JQKj57gLfKbcMRX07RW?=
 =?us-ascii?Q?HHIkFafjcn3OIArX9bm5Iw8Hus7lFRbvC0C2tkV2rEDewIupCq6R+E6tuxn8?=
 =?us-ascii?Q?ojPBdXKcvi89Qm69KuY7rhG2vF9tsKG7OFK1HVqi6RB8HmWkp1udN41IAnbO?=
 =?us-ascii?Q?7xCj0lSJduVHlIFWdrmrYi3bxvdI32ggyfMbhflxq+9+VMm3WUwshrx16wrp?=
 =?us-ascii?Q?b1tb7NUd2Cp7xzBv7ApjF0aRTyUh+YlpM/xdwRNgNOhMXD3Iu2rDGfv9IJVU?=
 =?us-ascii?Q?ps9MslZoKTO0lwKMJT6aK+1s2n5trrlSR4gKQKCRxyGDZ+YpOAXfjlMBDcjp?=
 =?us-ascii?Q?MR9yH8ewZiIzoH+2jRDWSBdJOf12vE14gzrKzi8NfiEB3Fbt6X6dRJMymQ3f?=
 =?us-ascii?Q?NHjgstfavZkMc7b4A8zMrxcONXEwgKJerDLqbT0Jx667OdV/xX0OhxQ3uaMF?=
 =?us-ascii?Q?MZB8vf0px9VrJEi840Ec9HKuNkpscVb0E6htBxLr+F4mkyLtr/wGBRUmTgm0?=
 =?us-ascii?Q?odSauMhUKPJsBM98lq5u7vDRBvMO0wW6T8S6y3TcgaskKegUTr7Rlux/ME8b?=
 =?us-ascii?Q?b+nPq0tDCAj705WvxPKBAGZqPVdkaEtALAu7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:19.9659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 114e6027-d4f3-4509-2876-08dd94d759b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 103 +++++++++++-------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  70 ++----------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   7 ++
 3 files changed, 76 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 58a47c62690a..645706179913 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -70,50 +70,29 @@ r535_chan_ramfc_clear(struct nvkm_chan *chan)
 #define CHID_PER_USERD 8
 
 static int
-r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm, bool priv)
+r535_chan_alloc(struct nvkm_gsp_device *device, u32 handle, u32 nv2080_engine_type, u8 runq,
+		bool priv, int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
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
-	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, NVKM_RM_CHAN(chan->id),
-				     fifo->func->chan.user.oclass, sizeof(*args),
-				     &chan->rm.object);
+	args = nvkm_gsp_rm_alloc_get(&device->object, handle,
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
+	ret = rmapi->fifo->chan.alloc(&chan->vmm->rm.device, NVKM_RM_CHAN(chan->id),
+				      eT, chan->runq, priv, chan->id, chan->inst->addr,
+				      nvkm_memory_addr(chan->userd.mem) + chan->userd.base,
+				      chan->rm.mthdbuf.addr, chan->vmm, offset, length,
+				      &chan->rm.object);
 	if (ret)
 		return ret;
 
@@ -541,4 +557,7 @@ const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
 	.ectx_size = r535_fifo_ectx_size,
+	.chan = {
+		.alloc = r535_chan_alloc,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index e0fa88aa608f..cc28de66cfa3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -298,74 +298,20 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	{
-		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
-
-		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, NVKM_RM_CHAN(0),
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
+	ret = rm->api->fifo->chan.alloc(&golden.vmm->rm.device, NVKM_RM_CHAN(0), 1, 0, true, 0,
+					nvkm_memory_addr(golden.inst),
+					nvkm_memory_addr(golden.inst) + 0x1000,
+					nvkm_memory_addr(golden.inst) + 0x2000,
+					golden.vmm, 0, 0x1000, &golden.chan);
+	if (ret)
+		goto done;
 
 	/* Fetch context buffer info from RM and allocate each of them here to use
 	 * during golden context init (or later as a global context buffer).
 	 *
 	 * Also build the information that'll be used to create channel contexts.
 	 */
-	ret = gsp->rm->api->gr->get_ctxbufs_info(gr);
+	ret = rm->api->gr->get_ctxbufs_info(gr);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 01cb97f1e494..29663dbe99e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -101,6 +101,13 @@ struct nvkm_rm_api {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
+		struct {
+			int (*alloc)(struct nvkm_gsp_device *, u32 handle,
+				     u32 nv2080_engine_type, u8 runq, bool priv, int chid,
+				     u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
+				     struct nvkm_vmm *, u64 gpfifo_offset, u32 gpfifo_length,
+				     struct nvkm_gsp_object *);
+		} chan;
 	} *fifo;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

