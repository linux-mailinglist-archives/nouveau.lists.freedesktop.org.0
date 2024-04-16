Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FF8A78F1
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5D4112F69;
	Tue, 16 Apr 2024 23:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLnrDat4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532C112F69
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzajmN40H4ip62mz4IVtDqn8rnwFTNAFSctB2npUkbKiSsNZExC79PjJu3eFiltyqrrSIS+Epj4ODGEicc/CX0FN31hYQCr4PP6LyiI7SqnkIDbkoqwN0RM6Lcy1n5oNu9v44hNJWz90tMwp1iJqn7AhZzYrpxYR77anQN+Tk8WR6MIp/jXvLEmZ/1k7MSSnoLMRi8o1RcJ+NYe0U52TEcHlP54yTUwC5/za2dQBg94M2OfR3h2k5AvzHCpTP0vgnOZTZqLXDW/cTJGfjLHrOKLSV3YJgfOLptgbcEryA9/G1bzkd+gdmq8su2RN9d3k7dz9p2qXVHJJaEkCmkcsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUuCpq2S8lBQ2GjcVw1A4LXOYhqbhL1WRvoBfRCc7sY=;
 b=d4aYwTQT5gN8ZwEDo3K29uRkKyoQmd905g5RjwpOUzbMEMtl5l/5zvaKticEuNr/VTKBn0gDW14tmt4o+eRZyntudrHNdM2HQu2G8ZYmLiYp51qAJH6Tco1VLr0Ki8W6/hu/KlrJ64jblu5Pxf2mjRajhGRzUGim89ATRY23CDdnB4ILlVjtDhuFvuXR6Vkj6CtNYn50FYTciLpZvVGT2A4BYldDulDfwX21eucFxzuxcgrYOKDCioEweNyqLOVu9cwFV6C5LFESVdzu03elwHhYoNfjA+Tv5wP1A2/HzHdVqc9vIH492oz+diqnm5kCmHeFYhEXFUEEHXPgFVVGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUuCpq2S8lBQ2GjcVw1A4LXOYhqbhL1WRvoBfRCc7sY=;
 b=MLnrDat4C38BxbBiGrx9kd/tcR8oeftCq6k55cQvGyNPi3sZhsi72kFgumKsmapqzLVsmEk7wf+9DLl+w9G8OukGqQXlR/aW5nlQ4n4dXKUCJLC4lMzhMMOKPPxCf63EnRti7tLZ6TkwNlzN7955bV82xWegXP8tilhEUa2mF8VqcXcgDUuOLcxWG7xHuVcxusfzgMDzzU9xDq3YfG8Qn8v3r2rtgWMEAfxH0ZX5ITp7TeG5z0tuO2LbsdF9QrvGyPBQUiwlazlTrULKbLsxHf/jc8Tdr0QxR5+M0AUydqN6fEs4QmRml5Po9Hvd0DB1xXO+3MSHy1Eo6xMENC/AdQ==
Received: from DS7PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:3bb::12)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:08 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::a3) by DS7PR03CA0067.outlook.office365.com
 (2603:10b6:5:3bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:45 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 065/156] drm/nouveau/nvif: rework device "sclass" api
Date: Wed, 17 Apr 2024 09:38:31 +1000
Message-ID: <20240416234002.19509-66-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ad8f51-ef37-4848-26f5-08dc5e6ed42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7xjhCbdjcVmxvAt73icvENcU8LxTkxHLMxsaIaL+WBbdHSPAQg+wP3vw3PzEh5wd/4S+2f89RJKGoRnzjIgRUAsasjnC6Wp0jJ59WtCQ72IqiKEwWHYVowg7652y+visL6eXMB//yL3+UoA3T5jUNgIWQpzVyZV5mk+d6rpsKjUmuaYznxCwbUO9n0vdxt3dC7JhBQ6wubFUhQ6kJ2fB5+j0fPNl74j+B+nff672qwjB7Wj9j5UdJvE0elhc2Tf8Dggz90H5zWtLi41EMvhpqV9XkwnjLrJdeg73/08gJINKHHq243d/oqlZQHmVNDIxV2DdjLEVn3I5Dqi4n7Jb8kGzVKb8UGWs6Y2NlUmkz0ys1cphMk1L46OIO2PrKBrmtb8ebnXFFmUn1xD9zWGuJV4CNI2ANeygGCl/IrDQGjk9pNXiyvBht3RZuqliuRSDdWXpKK/plf/QEoFh0GOQUltQmaXRLDUj43H8a/pgjppij0+FmxG2FEecfg3e9yFGlfEMunR7dTl9yVhD/ZYKedcMpgv84VnO7ql/YMrXX2VFJTnHC8t9C4vdcLVevlAzPF/j/u7ECS+2oTISXKRPC0mc4H1FwIcxIJZBikN/J06Jv73AvCtF9wgvMfxAxxk7xI2uDxqMw8O3+lpV7qetY9xRKkLeQajCkfN28UvHt+2zbsOzuEtmZuqvbfM0z36o6HiW6nWkqsDltuW+wUdpbSnbMy8rjDNjzpibY50ai4KzC1H4MHLxtNSoMx+w6LT
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:07.6682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ad8f51-ef37-4848-26f5-08dc5e6ed42a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/disp.h   |  3 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 26 +++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 19 +---
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 57 +++++------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 96 ++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 23 ++---
 drivers/gpu/drm/nouveau/nvif/disp.c           | 54 +++++------
 drivers/gpu/drm/nouveau/nvif/user.c           | 30 +++---
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 24 +++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c  | 30 ++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h  |  8 ++
 13 files changed, 217 insertions(+), 156 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/disp.h b/drivers/gpu/drm/nouveau/include/nvif/disp.h
index 56eb7293e01c..c4f428f268ea 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/disp.h
@@ -10,7 +10,6 @@ struct nvif_disp {
 	unsigned long head_mask;
 };
 
-int nvif_disp_ctor(struct nvif_device *, const char *name, s32 oclass,
-		   struct nvif_disp *);
+int nvif_disp_ctor(struct nvif_device *, const char *name, struct nvif_disp *);
 void nvif_disp_dtor(struct nvif_disp *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 39e965a184fd..9ac4857714c7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -15,6 +15,32 @@ struct nvif_driver {
 
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
+
+	struct {
+		s32 oclass;
+	} usermode;
+
+	struct {
+		s32 oclass;
+	} mmu;
+
+	struct {
+		s32 oclass;
+	} faultbuf;
+
+	struct {
+		s32 oclass;
+	} disp;
+
+	struct nvif_device_impl_fifo {
+		struct {
+			s32 oclass;
+		} cgrp;
+
+		struct {
+			s32 oclass;
+		} chan;
+	} fifo;
 };
 
 struct nvif_client_impl {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2648e42e0496..23f8b448a30a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -223,20 +223,6 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 	cli->abi16 = NULL;
 }
 
-static inline int
-getparam_dma_ib_max(struct nvif_device *device)
-{
-	const struct nvif_mclass dmas[] = {
-		{ NV03_CHANNEL_DMA, 0 },
-		{ NV10_CHANNEL_DMA, 0 },
-		{ NV17_CHANNEL_DMA, 0 },
-		{ NV40_CHANNEL_DMA, 0 },
-		{}
-	};
-
-	return nvif_mclass(&device->object, dmas) < 0 ? NV50_DMA_IB_MAX : 0;
-}
-
 int
 nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 {
@@ -303,7 +289,10 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = nvkm_gr_units(gr);
 		break;
 	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
-		int ib_max = getparam_dma_ib_max(device);
+		int ib_max = 0;
+
+		if (device->impl->fifo.chan.oclass >= NV50_CHANNEL_GPFIFO)
+			ib_max = NV50_DMA_IB_MAX;
 
 		getparam->value = nouveau_exec_push_max_from_ib_max(ib_max);
 		break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 7977bb353c92..f9592eb0a47b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -253,42 +253,43 @@ static int
 nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
-	const struct nvif_mclass hosts[] = {
-		{  AMPERE_CHANNEL_GPFIFO_B, 0 },
-		{  AMPERE_CHANNEL_GPFIFO_A, 0 },
-		{  TURING_CHANNEL_GPFIFO_A, 0 },
-		{   VOLTA_CHANNEL_GPFIFO_A, 0 },
-		{  PASCAL_CHANNEL_GPFIFO_A, 0 },
-		{ MAXWELL_CHANNEL_GPFIFO_A, 0 },
-		{  KEPLER_CHANNEL_GPFIFO_B, 0 },
-		{  KEPLER_CHANNEL_GPFIFO_A, 0 },
-		{   FERMI_CHANNEL_GPFIFO  , 0 },
-		{     G82_CHANNEL_GPFIFO  , 0 },
-		{    NV50_CHANNEL_GPFIFO  , 0 },
-		{    NV40_CHANNEL_DMA     , 0 },
-		{    NV17_CHANNEL_DMA     , 0 },
-		{    NV10_CHANNEL_DMA     , 0 },
-		{    NV03_CHANNEL_DMA     , 0 },
-		{}
-	};
+	struct nvif_device *device = &cli->device;
+	const u32 oclass = device->impl->fifo.chan.oclass;
 	struct {
 		struct nvif_chan_v0 chan;
 		char name[TASK_COMM_LEN+16];
 	} args;
-	struct nvif_device *device = &cli->device;
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
 	const u64 ilength = 0x02000;
 	char name[TASK_COMM_LEN];
-	int cid, ret;
+	int ret;
 	u64 size;
 
-	cid = nvif_mclass(&device->object, hosts);
-	if (cid < 0)
-		return cid;
+	switch (oclass) {
+	case  AMPERE_CHANNEL_GPFIFO_B:
+	case  AMPERE_CHANNEL_GPFIFO_A:
+	case  TURING_CHANNEL_GPFIFO_A:
+	case   VOLTA_CHANNEL_GPFIFO_A:
+	case  PASCAL_CHANNEL_GPFIFO_A:
+	case MAXWELL_CHANNEL_GPFIFO_A:
+	case  KEPLER_CHANNEL_GPFIFO_B:
+	case  KEPLER_CHANNEL_GPFIFO_A:
+	case   FERMI_CHANNEL_GPFIFO  :
+	case     G82_CHANNEL_GPFIFO  :
+	case    NV50_CHANNEL_GPFIFO  :
+	case    NV40_CHANNEL_DMA     :
+	case    NV17_CHANNEL_DMA     :
+	case    NV10_CHANNEL_DMA     :
+	case    NV03_CHANNEL_DMA     :
+		break;
+	default:
+		NV_PRINTK(err, cli, "No supported host channel class (0x%04x)", oclass);
+		return -ENODEV;
+	}
 
-	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO)
+	if (oclass < NV50_CHANNEL_GPFIFO)
 		size = plength;
 	else
 		size = ioffset + ilength;
@@ -306,14 +307,14 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	args.chan.runq = 0;
 	args.chan.priv = priv;
 	args.chan.devm = BIT(0);
-	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO) {
+	if (oclass < NV50_CHANNEL_GPFIFO) {
 		args.chan.vmm = 0;
 		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
 		args.chan.offset = chan->push.addr;
 		args.chan.length = 0;
 	} else {
 		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
-		if (hosts[cid].oclass < FERMI_CHANNEL_GPFIFO)
+		if (oclass < FERMI_CHANNEL_GPFIFO)
 			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
 		else
 			args.chan.ctxdma = 0;
@@ -324,7 +325,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	args.chan.ouserd = 0;
 
 	/* allocate userd */
-	if (hosts[cid].oclass >= VOLTA_CHANNEL_GPFIFO_A) {
+	if (oclass >= VOLTA_CHANNEL_GPFIFO_A) {
 		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD", NVIF_CLASS_MEM_GF100,
 				    NVIF_MEM_VRAM | NVIF_MEM_COHERENT | NVIF_MEM_MAPPABLE,
 				    0, PAGE_SIZE, NULL, 0, &chan->mem_userd);
@@ -342,7 +343,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	get_task_comm(name, current);
 	snprintf(args.name, sizeof(args.name), "%s[%d]", name, task_pid_nr(current));
 
-	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
+	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, oclass,
 			       &args, sizeof(args), &chan->user);
 	if (ret) {
 		nouveau_channel_del(pchan);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index f28f9a857458..27b69032fd9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -725,7 +725,7 @@ nouveau_display_create(struct drm_device *dev)
 	drm_kms_helper_poll_disable(dev);
 
 	if (nouveau_modeset != 2) {
-		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0, &disp->disp);
+		ret = nvif_disp_ctor(&drm->device, "kmsDisp", &disp->disp);
 		/* no display hw */
 		if (ret == -ENODEV) {
 			ret = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5e4c706bf150..a37e08f0fd77 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -422,9 +422,8 @@ nouveau_accel_fini(struct nouveau_drm *drm)
 static void
 nouveau_accel_init(struct nouveau_drm *drm)
 {
-	struct nvif_device *device = &drm->client.device;
-	struct nvif_sclass *sclass;
-	int ret, i, n;
+	struct nvif_device *device = &drm->device;
+	int ret;
 
 	if (nouveau_noaccel)
 		return;
@@ -434,48 +433,40 @@ nouveau_accel_init(struct nouveau_drm *drm)
 	if (ret)
 		return;
 
-	/*XXX: this is crap, but the fence/channel stuff is a little
-	 *     backwards in some places.  this will be fixed.
-	 */
-	ret = n = nvif_object_sclass_get(&device->object, &sclass);
-	if (ret < 0)
-		return;
-
-	for (ret = -ENOSYS, i = 0; i < n; i++) {
-		switch (sclass[i].oclass) {
-		case NV03_CHANNEL_DMA:
-			ret = nv04_fence_create(drm);
-			break;
-		case NV10_CHANNEL_DMA:
-			ret = nv10_fence_create(drm);
-			break;
-		case NV17_CHANNEL_DMA:
-		case NV40_CHANNEL_DMA:
-			ret = nv17_fence_create(drm);
-			break;
-		case NV50_CHANNEL_GPFIFO:
-			ret = nv50_fence_create(drm);
-			break;
-		case G82_CHANNEL_GPFIFO:
-			ret = nv84_fence_create(drm);
-			break;
-		case FERMI_CHANNEL_GPFIFO:
-		case KEPLER_CHANNEL_GPFIFO_A:
-		case KEPLER_CHANNEL_GPFIFO_B:
-		case MAXWELL_CHANNEL_GPFIFO_A:
-		case PASCAL_CHANNEL_GPFIFO_A:
-		case VOLTA_CHANNEL_GPFIFO_A:
-		case TURING_CHANNEL_GPFIFO_A:
-		case AMPERE_CHANNEL_GPFIFO_A:
-		case AMPERE_CHANNEL_GPFIFO_B:
-			ret = nvc0_fence_create(drm);
-			break;
-		default:
-			break;
-		}
+	switch (device->impl->fifo.chan.oclass) {
+	case NV03_CHANNEL_DMA:
+		ret = nv04_fence_create(drm);
+		break;
+	case NV10_CHANNEL_DMA:
+		ret = nv10_fence_create(drm);
+		break;
+	case NV17_CHANNEL_DMA:
+	case NV40_CHANNEL_DMA:
+		ret = nv17_fence_create(drm);
+		break;
+	case NV50_CHANNEL_GPFIFO:
+		ret = nv50_fence_create(drm);
+		break;
+	case G82_CHANNEL_GPFIFO:
+		ret = nv84_fence_create(drm);
+		break;
+	case FERMI_CHANNEL_GPFIFO:
+	case KEPLER_CHANNEL_GPFIFO_A:
+	case KEPLER_CHANNEL_GPFIFO_B:
+	case MAXWELL_CHANNEL_GPFIFO_A:
+	case PASCAL_CHANNEL_GPFIFO_A:
+	case VOLTA_CHANNEL_GPFIFO_A:
+	case TURING_CHANNEL_GPFIFO_A:
+	case AMPERE_CHANNEL_GPFIFO_A:
+	case AMPERE_CHANNEL_GPFIFO_B:
+		ret = nvc0_fence_create(drm);
+		break;
+	default:
+		WARN_ON(1);
+		ret = -ENODEV;
+		break;
 	}
 
-	nvif_object_sclass_put(&sclass);
 	if (ret) {
 		NV_ERROR(drm, "failed to initialise sync subsystem, %d\n", ret);
 		nouveau_accel_fini(drm);
@@ -534,13 +525,6 @@ nouveau_parent = {
 static int
 nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 {
-	static const struct nvif_mclass
-	mmus[] = {
-		{ NVIF_CLASS_MMU_GF100, -1 },
-		{ NVIF_CLASS_MMU_NV50 , -1 },
-		{ NVIF_CLASS_MMU_NV04 , -1 },
-		{}
-	};
 	struct nouveau_drm *drm;
 	const struct nvif_driver *driver;
 	const struct nvif_client_impl *impl;
@@ -576,13 +560,17 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		goto fail_nvif;
 	}
 
-	ret = nvif_mclass(&drm->device.object, mmus);
-	if (ret < 0) {
-		NV_ERROR(drm, "No supported MMU class\n");
+	switch (drm->device.impl->mmu.oclass) {
+	case NVIF_CLASS_MMU_GF100:
+	case NVIF_CLASS_MMU_NV50:
+	case NVIF_CLASS_MMU_NV04:
+		break;
+	default:
+		NV_ERROR(drm, "No supported MMU class (0x%04x)\n", drm->device.impl->mmu.oclass);
 		goto fail_nvif;
 	}
 
-	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
+	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", drm->device.impl->mmu.oclass, &drm->mmu);
 	if (ret) {
 		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
 		goto fail_nvif;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index b4da82ddbb6b..477336672652 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -1044,11 +1044,6 @@ nouveau_svm_fini(struct nouveau_drm *drm)
 void
 nouveau_svm_init(struct nouveau_drm *drm)
 {
-	static const struct nvif_mclass buffers[] = {
-		{   VOLTA_FAULT_BUFFER_A, 0 },
-		{ MAXWELL_FAULT_BUFFER_A, 0 },
-		{}
-	};
 	struct nouveau_svm *svm;
 	int ret;
 
@@ -1059,6 +1054,15 @@ nouveau_svm_init(struct nouveau_drm *drm)
 	if (drm->client.device.info.family > NV_DEVICE_INFO_V0_PASCAL)
 		return;
 
+	switch (drm->device.impl->faultbuf.oclass) {
+	case   VOLTA_FAULT_BUFFER_A:
+	case MAXWELL_FAULT_BUFFER_A:
+		break;
+	default:
+		NV_DEBUG(drm, "No supported fault buffer class\n");
+		return;
+	}
+
 	drm->svm = svm = kzalloc(struct_size(drm->svm, buffer, 1), GFP_KERNEL);
 	if (!drm->svm)
 		return;
@@ -1067,14 +1071,7 @@ nouveau_svm_init(struct nouveau_drm *drm)
 	mutex_init(&drm->svm->mutex);
 	INIT_LIST_HEAD(&drm->svm->inst);
 
-	ret = nvif_mclass(&drm->client.device.object, buffers);
-	if (ret < 0) {
-		SVM_DBG(svm, "No supported fault buffer class");
-		nouveau_svm_fini(drm);
-		return;
-	}
-
-	ret = nouveau_svm_fault_buffer_ctor(svm, buffers[ret].oclass, 0);
+	ret = nouveau_svm_fault_buffer_ctor(svm, drm->device.impl->faultbuf.oclass, 0);
 	if (ret) {
 		nouveau_svm_fini(drm);
 		return;
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 14da22fa3b5b..875c63877468 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -33,43 +33,43 @@ nvif_disp_dtor(struct nvif_disp *disp)
 }
 
 int
-nvif_disp_ctor(struct nvif_device *device, const char *name, s32 oclass, struct nvif_disp *disp)
+nvif_disp_ctor(struct nvif_device *device, const char *name, struct nvif_disp *disp)
 {
-	static const struct nvif_mclass disps[] = {
-		{ AD102_DISP, 0 },
-		{ GA102_DISP, 0 },
-		{ TU102_DISP, 0 },
-		{ GV100_DISP, 0 },
-		{ GP102_DISP, 0 },
-		{ GP100_DISP, 0 },
-		{ GM200_DISP, 0 },
-		{ GM107_DISP, 0 },
-		{ GK110_DISP, 0 },
-		{ GK104_DISP, 0 },
-		{ GF110_DISP, 0 },
-		{ GT214_DISP, 0 },
-		{ GT206_DISP, 0 },
-		{ GT200_DISP, 0 },
-		{   G82_DISP, 0 },
-		{  NV50_DISP, 0 },
-		{  NV04_DISP, 0 },
-		{}
-	};
+	const u32 oclass = device->impl->disp.oclass;
 	struct nvif_disp_v0 args;
-	int cid, ret;
+	int ret;
 
-	cid = nvif_sclass(&device->object, disps, oclass);
 	disp->object.client = NULL;
-	if (cid < 0) {
+
+	switch (oclass) {
+	case AD102_DISP:
+	case GA102_DISP:
+	case TU102_DISP:
+	case GV100_DISP:
+	case GP102_DISP:
+	case GP100_DISP:
+	case GM200_DISP:
+	case GM107_DISP:
+	case GK110_DISP:
+	case GK104_DISP:
+	case GF110_DISP:
+	case GT214_DISP:
+	case GT206_DISP:
+	case GT200_DISP:
+	case   G82_DISP:
+	case  NV50_DISP:
+	case  NV04_DISP:
+		break;
+	default:
 		NVIF_DEBUG(&device->object, "[NEW disp%04x] not supported", oclass);
-		return cid;
+		return -ENODEV;
 	}
 
 	args.version = 0;
 
 	ret = nvif_object_ctor(&device->object, name ?: "nvifDisp", 0,
-			       disps[cid].oclass, &args, sizeof(args), &disp->object);
-	NVIF_ERRON(ret, &device->object, "[NEW disp%04x]", disps[cid].oclass);
+			       oclass, &args, sizeof(args), &disp->object);
+	NVIF_ERRON(ret, &device->object, "[NEW disp%04x]", oclass);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index b648a5e036af..d8d37c1c8169 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -21,6 +21,7 @@
  */
 #include <nvif/user.h>
 #include <nvif/device.h>
+#include <nvif/printf.h>
 
 #include <nvif/class.h>
 
@@ -36,32 +37,29 @@ nvif_user_dtor(struct nvif_device *device)
 int
 nvif_user_ctor(struct nvif_device *device, const char *name)
 {
-	struct {
-		s32 oclass;
-		int version;
-		const struct nvif_user_func *func;
-	} users[] = {
-		{ AMPERE_USERMODE_A, -1, &nvif_userc361 },
-		{ TURING_USERMODE_A, -1, &nvif_userc361 },
-		{  VOLTA_USERMODE_A, -1, &nvif_userc361 },
-		{}
-	};
-	int cid, ret;
+	const u32 oclass = device->impl->usermode.oclass;
+	const struct nvif_user_func *func;
+	int ret;
 
 	if (device->user.func)
 		return 0;
 
-	cid = nvif_mclass(&device->object, users);
-	if (cid < 0)
-		return cid;
+	switch (oclass) {
+	case AMPERE_USERMODE_A: func = &nvif_userc361; break;
+	case TURING_USERMODE_A: func = &nvif_userc361; break;
+	case  VOLTA_USERMODE_A: func = &nvif_userc361; break;
+	default:
+		NVIF_DEBUG(&device->object, "[NEW usermode%04x] not supported", oclass);
+		return -ENODEV;
+	}
 
 	ret = nvif_object_ctor(&device->object, name ? name : "nvifUsermode",
-			       0, users[cid].oclass, NULL, 0,
+			       0, oclass, NULL, 0,
 			       &device->user.object);
 	if (ret)
 		return ret;
 
 	nvif_object_map(&device->user.object, NULL, 0);
-	device->user.func = users[cid].func;
+	device->user.func = func;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index a46d448dc244..f55088849a0c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -29,6 +29,8 @@
 #include <subdev/fb.h>
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
+#include <engine/disp/priv.h>
+#include <engine/fifo/ufifo.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0080.h>
@@ -355,6 +357,28 @@ nvkm_udevice_new(struct nvkm_device *device,
 
 	udev->impl = nvkm_udevice_impl;
 
+	if (device->vfn) {
+		udev->impl.usermode.oclass = device->vfn->user.base.oclass;
+	}
+
+	if (device->mmu) {
+		udev->impl.mmu.oclass = device->mmu->user.base.oclass;
+	}
+
+	if (device->fault) {
+		udev->impl.faultbuf.oclass = device->fault->user.base.oclass;
+	}
+
+	if (device->disp) {
+		udev->impl.disp.oclass = device->disp->func->user.root.oclass;
+	}
+
+	if (device->fifo) {
+		if (!WARN_ON(nvkm_subdev_oneinit(&device->fifo->engine.subdev))) {
+			nvkm_ufifo_ctor(device->fifo, &udev->impl.fifo);
+		}
+	}
+
 	*pimpl = &udev->impl;
 	*ppriv = udev;
 	*pobject = &udev->object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
index aff92848abfe..fa61bb128885 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
@@ -28,5 +28,6 @@ nvkm-y += nvkm/engine/fifo/ga102.o
 
 nvkm-y += nvkm/engine/fifo/r535.o
 
+nvkm-y += nvkm/engine/fifo/ufifo.o
 nvkm-y += nvkm/engine/fifo/ucgrp.o
 nvkm-y += nvkm/engine/fifo/uchan.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
new file mode 100644
index 000000000000..3f0bd70f614e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
@@ -0,0 +1,30 @@
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "ufifo.h"
+#include "priv.h"
+
+void
+nvkm_ufifo_ctor(struct nvkm_fifo *fifo, struct nvif_device_impl_fifo *impl)
+{
+	impl->cgrp.oclass = fifo->func->cgrp.user.oclass;
+	impl->chan.oclass = fifo->func->chan.user.oclass;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h
new file mode 100644
index 000000000000..778e81052502
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UFIFO_H__
+#define __NVKM_UFIFO_H__
+#include <engine/fifo.h>
+#include <nvif/driverif.h>
+
+void nvkm_ufifo_ctor(struct nvkm_fifo *, struct nvif_device_impl_fifo *);
+#endif
-- 
2.41.0

