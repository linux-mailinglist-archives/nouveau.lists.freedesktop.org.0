Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B603FAB2B6C
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830EA10E24C;
	Sun, 11 May 2025 21:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pmfGuArt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66F910E230
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heUYLYZ1xrk9VydBivf1r7H/KTiNkBqDBviKcXFD7AdT92og7ZVd5twZiauq8YOGv9oj3QC/9ss5EvBTPjjJY0R5zPLhiaOww/Os7COeQKKY3uQTyqlHbdZhoHF5V2V6Dgtk/MGphK4/v6R5DyO0PklfCtGKtzW1J8XzmOzYJTFkvFkk6ovG1pInbflBvXsvt+xGC+iEpN1YGA+C61Np53B7VH+ikbFrvua8MlFIgyq7xX85YdKWAanpjh2LHsGDmf6JLlp0VqDLOOQvznyDqlDz8qyvRxWGeIWdOpz7WRU/G6OoHBXRAdR+0wI8xpb21EbV7/WSEYOcIdy3RtjEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6koEAij0/zRvqlg3pg1Sb6dgGBknjRH7g7pjT9aug=;
 b=acSyYu/IRAKrH1JNvlMICxoGfduJO0haMWDgxeimrWO2PQlzODFzNOd9RzAwf1i2zoNw2V7K0Yv+4jbYiJ0KGSXrJ0M7Blpv3DXk4Wt0t+Gfa8E2i9fmBC2ZnE3pZkJ6QrwrwzLZ0l3dtMa/x+VdNjQ2cRJnlMRwC9HSS0F2qGpV9ssNLTV8MeKeA12a8RsrFt11ff6+gmcku2o/eFlKuo2gEUlrSWKRudAzhuutfyvU/e3CWlT3PN5TvpxRax28Xo0OdvL82JkNV7/vJBr7iAzrfM17X0YceiJ2xIQqkTDyBM6JxJTN4rIjak0QA6TTWdcP6HvSDP4mwL5AdtMALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh6koEAij0/zRvqlg3pg1Sb6dgGBknjRH7g7pjT9aug=;
 b=pmfGuArtA1ObIMVFDuVAn8B4QgOodCMmCE2fiAg1oyq/u3AEDUlstfu9OpJUnV63h6uc0vC5qTZ/x/pjjEK0mMmJGn4TN/j7z/SvKhz2BH7tK1OLLulIs3s68J5rqXwI6Hv2gMnHbrXPOwAA3hTXyzkmd99hVvcPim6Pp5B3/jrPO2EgtAbMzW9AwmoB0bhEuE+pY4Lr9KsIL4ClqS55s1gWdn4Ha/SlMZy6wWB5NBrvximlYcrjq0tfmhhnMx485lgIL7EnUyE1D5elmp2dDI8pIcddgFFHSvXxIxgVRCiVQchTIyN6ogqzAlUtDvaXIP68VVfGkbko0EwbIggl3A==
Received: from CH2PR10CA0002.namprd10.prod.outlook.com (2603:10b6:610:4c::12)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:18 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::2c) by CH2PR10CA0002.outlook.office365.com
 (2603:10b6:610:4c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:10 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 40/62] drm/nouveau/gsp: add hal for fifo.chan.alloc
Date: Mon, 12 May 2025 07:07:00 +1000
Message-ID: <20250511210722.80350-41-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c009ddd-2fb2-4515-f158-08dd90d017ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GxQQzqYpXYFZk6BPu6pGNuJ98+l55YeZM01z93cF67Xo3f97Q6Qrq37+NzKJ?=
 =?us-ascii?Q?BVje5E4DfaENYNxXtnnpApn29JIRWjiwB4upfrw5W4JvUnpxEIvGaAleEL5k?=
 =?us-ascii?Q?j8C0vR3NEVKRgTLHbe43kssO5xtt12FzYitY7KgGi8rf8Ft4wvPp6gI9g8/9?=
 =?us-ascii?Q?KLDXrODxxWnUXHe08TOcs9y7bX42RVPpkZydz+wLIy5nHpIQMM/dtgmFzWi+?=
 =?us-ascii?Q?/7Q7i4i9t6IWPUM0IiKXeEestV9suF8YMMT88B5lEVMfK8Kh/7CnFTA/heFm?=
 =?us-ascii?Q?bTJRa9KxiH7JWBODTuUVBGgpvUpIMEpnzTTxFz2tGs0MFJIcLY5fLpEzWZeN?=
 =?us-ascii?Q?y1CqHI7gHyvOZ/ckbUkp6Huj5HTYAM50Ko+9OvCof8buVh0L8BdpUm47J53s?=
 =?us-ascii?Q?ibQPdwscTklLMslu9myviDPGA/S5T6YZPh5uQ98tJB9EXmWMUwGVRP7S5yzM?=
 =?us-ascii?Q?l3GAfJW6tVaUXZ7RaFBUbci16UI93YmB0GwwsKe+h3wSPUtda94O5YDP5ZdH?=
 =?us-ascii?Q?vS+GGA0+4/c2ZzBZLIRK3TCmrT3QtHivSdRDFKAtenuyNDKVjI0KvXEPpDLC?=
 =?us-ascii?Q?VHvZ0zz0jTGiEUan4RCAuTIb99GTTpVh8bXmVVhH3eSJfjndKSz+uVn0GcGi?=
 =?us-ascii?Q?sXLL9128+zaLBrMkEZsue8b2VY8fPApxH+wkKXqDOsxP3EzDMqTninJ+C8df?=
 =?us-ascii?Q?s5ModOljCOURwkosDOg11gFfi8o8nc/3yVAEft1omSHZUWVDy+ir6GKyAPYV?=
 =?us-ascii?Q?lNXdGvSEeD8udPDEwZL36t8z9r0zDSdTlcxaead0RPe4GfD3uEtGGSVWE5fY?=
 =?us-ascii?Q?OQqM9XeO03TwY3aeq/QunayWfv/svU1P0oPVwM5GSxemMXX5ui8amf/KhN/A?=
 =?us-ascii?Q?DYv9utMCQFqklrxVV8iKzYyEE24fEomG1QsI4N1h37KvxpnSn+WrMjWyIUJ3?=
 =?us-ascii?Q?7JIgoiGvOtrplsAv+QSt+w8Oz9tYEz5ljXG5xQdso2VLcgJ0O8Va1iVd5L00?=
 =?us-ascii?Q?COPNbP/GG35or5M8eui8H098zabafm1BSapCY7bdgXxhX7FuPPWEY7AmzyzB?=
 =?us-ascii?Q?w6QbriRHHlNNwv70Dv01asbeQJchxd/wIlW3koRPtKF0T5s2ZQGDEVULYwbJ?=
 =?us-ascii?Q?kqneLLJTpjFl19mdDE1jXQiEUCeXmiUeM2s7AjpeEoYqzj3xsqcuhPIJ4wc4?=
 =?us-ascii?Q?JP24Do8Vj9vuDnIsLICfrZOCOpVV2HAYQ9qF9RUpGxTp4Kap2ZIKdQD26Bsk?=
 =?us-ascii?Q?7TtnRWxZ0PWhBJqu3hdhE7Sc+Zg9XGSerCyR+WZ/Nw6hFTEa52fvkQ/VJh9m?=
 =?us-ascii?Q?1I/PyuNolQmjxyTqWymMFZKaDuBRQi90r8cNC1osm+70TV1hOWORYEWZo7uD?=
 =?us-ascii?Q?UcN/usVHk/RAWysidx/iYU7ePbL9Y/D7ug1IgvNju3HcYcWrC6hxFvATWSsA?=
 =?us-ascii?Q?u7KXujnCzDB6126A+IZwIGLTWGb86/5xjwXx2pYuY+TJNgtCIJCVAyw6BTE9?=
 =?us-ascii?Q?/uClmJFAwGjNUQGpmpYdGU+MziOzUbAJqoV1?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:18.4241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c009ddd-2fb2-4515-f158-08dd90d017ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
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
index 3d320788d45a..a9d3979de4b1 100644
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
-	args = nvkm_gsp_rm_alloc_get(&device->gsp->internal.device.object, NVKM_RM_CHAN(chan->id),
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
+	ret = rmapi->fifo->chan.alloc(&device->gsp->internal.device, NVKM_RM_CHAN(chan->id),
+				      eT, chan->runq, priv, chan->id, chan->inst->addr,
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
index d6f41498c321..b86c5012f6ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -298,74 +298,20 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	{
-		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
-
-		args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, NVKM_RM_CHAN(0),
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
+	ret = rm->api->fifo->chan.alloc(&gsp->internal.device, NVKM_RM_CHAN(0), 1, 0, true, 0,
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

