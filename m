Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0388A7939
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2CE112FAE;
	Tue, 16 Apr 2024 23:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cyk3dj1X";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31082112FDD
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCnVJ7AB2EP+vdwlIab091DnpzWnlP72sXT65mOggkCYN3wZvJ+Gg3DWFs8zOFVxr+nC6onlTL0XftCR30ZqEZWluWd+0Ldd3FKE71GN0/JHXYxppMf+sQn6TM/NN3b0OvX0o4poKWrmzbWg0F/js0Gd/ZmZ/OnoDb7LXwdPiHsxrOMairEzVsb6GswsJul2yZBG/iBKDOlGMwgBXfhCqh5raKxGt/dHaxcOeFGnH20wNrcO+zP5xiwrSDRZfhckVu/QRpkc0PlE2Ec6RSKO6B+kykIE9j2eROmpIO/A5xg/nxLcAC27G9RIqyTbPLEF8dCUrOvLbncfRDWyDXjzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oWk5yfqi8w0WW3k7qcTUgzNfOJoV3FzCtWYLW6ygG8=;
 b=bnATtA5uotPgfnlgXfyoiUZBZfgsmx3ELJPPuIVkdaYJeJ0aw4QhkBI/yjlIXVrV7eR5tLZU4VwyMgbrhumPxwFzJjDP9UbJVTRT+cVoHv55XeFt+XxGKepm3J56ael+38yDz43PRQaAtBDsdTP7xqjp4qVCEBD4L4HNvap0Jtxq7k1VBqoixpIybdE7yU/zCsktfgdFo9YFXwE8MkFfSfNAAb9JDnIKJ3i7w/9dSZIWBmDs57aPP16ad2QIWB7Bi7HwqR6qzDcBZ1tJqied18joTM1av4svmuM+nLQNpoQR/H3VryntDVKEn6W0OGS1jcbuY8vODg2nb/AqWKe1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oWk5yfqi8w0WW3k7qcTUgzNfOJoV3FzCtWYLW6ygG8=;
 b=Cyk3dj1XfrviNYNy40BL9HkVgFJ+i77WSk9HcMKxroqKYDN4tFmk0NYoVRsbLi7OG0It+6RLU/lCOwXVK/78ArEPLuGcsvVEfrSluGJnaa0dUYDADTF2XisjhZdR/mNCqLNAOe31n+23jacQfHE4aiVhVoGzMeNkYi0SA6fWMo/nttRx1bwpmz2NTkGG9x53mL9pmr40WxeutLc2izOGExc6zxu7QryQu4uZAzaHv9IFYTJajf2oCsTDccHw7UYsw4huli5i6ofyy341AGacCuFD4SWgG93Bm70RiaJFTppTthEv3aFgKHe8+m93hfAcRLhRcrWoaMv6ImWVWvZT/Q==
Received: from CH0PR13CA0041.namprd13.prod.outlook.com (2603:10b6:610:b2::16)
 by PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:29 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::d3) by CH0PR13CA0041.outlook.office365.com
 (2603:10b6:610:b2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:05 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 135/156] drm/nouveau/nvif: rework device "new ctxdma" api
Date: Wed, 17 Apr 2024 09:39:41 +1000
Message-ID: <20240416234002.19509-136-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH7PR12MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 010f5cde-b8a3-44d0-25f9-08dc5e6f04b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/cd044v9c6b0ZQR4Qn7/6RZ9WqfzeUNFFCY4PQRrzhjLc+JBry5CGWx+8OB6IUdNuKge/F2X1JEmVqJ+xD4Ufxc2zAlyx/zWrC+SEprW3evYzjo4KGICtiOabkqAKOM7t2w3cmtgJMe1EGnlsRCZ3IxD+JvmY+dZdno38iJ1HeW8Oh9vx6s4UvZWTVkuvvPNKMEdhMLXbRp6AKnwmR5mruxNPdbiQ3O9OPN/sQvLUVOB2mDTVU5gRxb0pDtsdT+ctj5OODfRv6SHP6MoWqa5IMxGKjWJAmfTLRWhelT5gCzGk9X/ZFCBgy1QkEpkH5eBaxtDECXvjUNOf7d4cvr+fGE1FlfecbFvDOW1ALfU9xJMkF97PkmkC/RPwuuNVyq2/Ybh8tt8jhuUPg7V0ksJ5iMQyCTSfySphe17FA689VBQPezItycprHsficIWZ7avAMEfvcUzTU3A6bq0UR7wsTn2S8BfNMJzn6oZBmq/pJ5Lc83Xxt+61ziJcbxDqckd632mu9yRnGrGd4CI/LSCWfBWG0TXvHXrf9EyAVLDzew0ZPxn8tPolm3nh/SkQAkF03+na3tNSCCd1u5ZBV/pPlH+Xq8Qrw/x8OwCnlZkDYiKtXVK6tHHskJZ1NODsi8wy0mbAJqy5atykXn9JWKtJbp1a9DFyj75/mTezP1BtqDz4RIoitohVQ26CA4H1/WnOEWr5oGCiBymNWSAYVqK6UedpHD2w/Ivb4vVaimwfmc3n6El6Ictuc+kJAkCh1Y
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:29.1632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010f5cde-b8a3-44d0-25f9-08dc5e6f04b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587
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
 drivers/gpu/drm/nouveau/include/nvif/device.h |  4 ++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  6 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 11 +++--
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  3 +-
 drivers/gpu/drm/nouveau/nvif/device.c         | 17 ++++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 41 ++++++++++++++++++-
 6 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index fa8402e575da..5fb71e6da7cd 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -5,6 +5,7 @@
 #include <nvif/cl0080.h>
 #include <nvif/driverif.h>
 #include <nvif/user.h>
+struct nvif_ctxdma;
 
 struct nvif_device {
 	const struct nvif_device_impl *impl;
@@ -22,6 +23,9 @@ void nvif_device_dtor(struct nvif_device *);
 int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
 
+int nvif_device_ctxdma_ctor(struct nvif_device *, const char *name, s32 oclass,
+			    void *argv, u32 argc, struct nvif_ctxdma *);
+
 /*XXX*/
 #include <subdev/bios.h>
 #include <subdev/fb.h>
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 75168621427a..c1971b85d927 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -507,6 +507,12 @@ struct nvif_device_impl {
 			   const struct nvif_disp_impl **, struct nvif_disp_priv **);
 	} disp;
 
+	struct {
+		int (*new)(struct nvif_device_priv *, s32 oclass, void *argv, u32 argc,
+			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **,
+			   u64 handle);
+	} ctxdma;
+
 	struct nvif_device_impl_fifo {
 		u8  engine_nr;
 		u8  runl_nr;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 771a4b4b3f1d..7c57bc48a8af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -106,7 +106,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_object_unmap_cpu(&chan->userd.map);
 		nvif_object_dtor(&chan->user);
 		nvif_mem_dtor(&chan->userd.mem);
-		nvif_object_dtor(&chan->push.ctxdma);
+		nvif_ctxdma_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
 		nouveau_bo_unmap(chan->push.buffer);
 		if (chan->push.buffer && chan->push.buffer->bo.pin_count)
@@ -242,9 +242,8 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		}
 	}
 
-	ret = nvif_object_ctor(&device->object, "abi16PushCtxDma", 0,
-			       NV_DMA_FROM_MEMORY, &args, sizeof(args),
-			       &chan->push.ctxdma);
+	ret = nvif_device_ctxdma_ctor(device, "abi16PushCtxDma", NV_DMA_FROM_MEMORY,
+				      &args, sizeof(args), &chan->push.ctxdma);
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
@@ -315,13 +314,13 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	args.chan.devm = BIT(0);
 	if (oclass < NV50_CHANNEL_GPFIFO) {
 		args.chan.vmm = 0;
-		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
+		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma.object);
 		args.chan.offset = chan->push.addr;
 		args.chan.length = 0;
 	} else {
 		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
 		if (oclass < FERMI_CHANNEL_GPFIFO)
-			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
+			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma.object);
 		else
 			args.chan.ctxdma = 0;
 		args.chan.offset = ioffset + chan->push.addr;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 811271ae6fe1..786c929843d1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -2,6 +2,7 @@
 #ifndef __NOUVEAU_CHAN_H__
 #define __NOUVEAU_CHAN_H__
 #include <nvif/object.h>
+#include <nvif/ctxdma.h>
 #include <nvif/event.h>
 #include <nvif/push.h>
 struct nvif_device;
@@ -31,7 +32,7 @@ struct nouveau_channel {
 	struct {
 		struct nouveau_bo *buffer;
 		struct nouveau_vma *vma;
-		struct nvif_object ctxdma;
+		struct nvif_ctxdma ctxdma;
 		u64 addr;
 	} push;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 7d057691600f..555c63e96660 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -23,8 +23,25 @@
  */
 #include <nvif/device.h>
 #include <nvif/client.h>
+#include <nvif/ctxdma.h>
 #include <nvif/printf.h>
 
+int
+nvif_device_ctxdma_ctor(struct nvif_device *device, const char *name, s32 oclass,
+			void *argv, u32 argc, struct nvif_ctxdma *ctxdma)
+{
+	int ret;
+
+	ret = device->impl->ctxdma.new(device->priv, oclass, argv, argc,
+				       &ctxdma->impl, &ctxdma->priv, nvif_handle(&ctxdma->object));
+	NVIF_ERRON(ret, &device->object, "[NEW ctxdma%04x]", oclass);
+	if (ret)
+		return ret;
+
+	nvif_ctxdma_ctor(&device->object, name ?: "nvifDeviceCtxDma", 0, oclass, ctxdma);
+	return 0;
+}
+
 u64
 nvif_device_time(struct nvif_device *device)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index f76861945cd0..fc81d595bdb7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -111,6 +111,42 @@ nvkm_udevice_cgrp_new(struct nvif_device_priv *udev, u8 runl, struct nvif_vmm_pr
 	return 0;
 }
 
+#include <engine/dma/priv.h>
+
+static void
+nvkm_udevice_ctxdma_del(struct nvif_ctxdma_priv *priv)
+{
+	struct nvkm_dmaobj *dmaobj = (void *)priv;
+	struct nvkm_object *object = &dmaobj->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_ctxdma_impl
+nvkm_udevice_ctxdma_impl = {
+	.del = nvkm_udevice_ctxdma_del
+};
+
+static int
+nvkm_udevice_ctxdma_new(struct nvif_device_priv *udev, s32 oclass, void *argv, u32 argc,
+			const struct nvif_ctxdma_impl **pimpl, struct nvif_ctxdma_priv **ppriv,
+			u64 handle)
+{
+	struct nvkm_dma *dma = udev->device->dma;
+	struct nvkm_dmaobj *dmaobj;
+	int ret;
+
+	ret = dma->func->class_new(dma, &(struct nvkm_oclass) { .base.oclass = oclass },
+				   argv, argc, &dmaobj);
+	if (ret)
+		return ret;
+
+	*pimpl = &nvkm_udevice_ctxdma_impl;
+	*ppriv = (void *)dmaobj;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, &dmaobj->object);
+}
+
 static int
 nvkm_udevice_disp_new(struct nvif_device_priv *udev,
 		      const struct nvif_disp_impl **pimpl, struct nvif_disp_priv **ppriv)
@@ -217,8 +253,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	struct nvkm_device *device = udev->device;
 	struct nvkm_engine *engine;
-	u64 mask = (1ULL << NVKM_ENGINE_DMAOBJ) |
-		   (1ULL << NVKM_ENGINE_FIFO);
+	u64 mask = (1ULL << NVKM_ENGINE_FIFO);
 	const struct nvkm_device_oclass *sclass = NULL;
 	int i;
 
@@ -353,6 +388,8 @@ nvkm_udevice_new(struct nvkm_device *device,
 	}
 
 	if (device->fifo) {
+		udev->impl.ctxdma.new = nvkm_udevice_ctxdma_new;
+
 		if (!WARN_ON(nvkm_subdev_oneinit(&device->fifo->engine.subdev))) {
 			nvkm_ufifo_ctor(device->fifo, &udev->impl.fifo);
 
-- 
2.41.0

