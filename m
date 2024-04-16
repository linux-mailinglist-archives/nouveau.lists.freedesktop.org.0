Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B68A7931
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396C112FA1;
	Tue, 16 Apr 2024 23:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IUwghSnR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB393112FCA
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9wy349bcdS7UFXq5mHtspVqvRvRQWrnixyXS96a8NgzLPMT27ore2Rf6w2Mig0IdeurX03IuBckSei/efhpzgEaoeNAReGVEQmD6yXtpjNRvrzVwFhhLTdJZL/3WYIlzo9LXeb1NOTKwt7q/bJuu/3BtoVOt/pPj8iPZogTnZuA3Kt3i5z8+o8FSpE4qvkWYkha6kLYQ9PKmI2TNSAelqG/dKlC2rcCip45F2Qod3mxsiGrFbdbmhLSuRY7uhaVpes3uUm6OKFibDiVJtEIBVzF3gOt8tSyeHWhWC4ZHxrgtpWo2IipIsLQLHCZkN8E/nb0NMZ+WfsRaWtBfbpbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ownQteWd5NPgBS9NP3xvG4ne4EPl47IZ5leuapQJkH4=;
 b=LApsyvcd+tJnF/PPtNAKti1IoVtIcN4W07JesCf8AcJjD2j1/suC5S90XloSRT4Vhq2Cdhy3NVjJdY0NaZwz4TOVcJhXA8mLpfF+SSBL/1pVlXMZxHBlVUXfIqN732EDjtl3s2Tt4FmqiAWVZcHX7Ea3iwSJiGc01ZkLyv7LuW2xGdnWgvlG2rthKgRJXPK7Mva88wZuxYLvjthAuh5lOSnMXX4eOOh2OrhqDv1lq9vK+RaOm8fJhDNumnY2brUbTPRYTu6aBqaISX/OfmkkbhzrlNfmxOPeu7lCzovuhcgK1Tt9tFsYORMsyMa070UdlDH9LAEXsy/VpGdTi3dQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ownQteWd5NPgBS9NP3xvG4ne4EPl47IZ5leuapQJkH4=;
 b=IUwghSnRf5yxBIj7de1aV/9lcWpZ04nsnfZlWfNJgpI8Mfw26FZIfJnCCDYJy5njZBdJN7One/gXFGuW8a4HWgZh4daxXX9wzMkL0LkONHOIKa/cJdA4bYmrCvxQXIe9KTAyYFUKDesVA1l5kCsrAu8Vrziik1NYiD1twnS2/YoKRpeFc+gKgOUgZ/fuYxyn7xWdqCBODDNjriArL0rmwaMsPhyTFyOsLab6jFW9oFrr6wiHCcBCK925HS4rlAXmOpwjrdz6vxpkzaqLpn7qbyAjwvDsvGgg1xUJ2gqPGkywa6ecRtiIrCKh8SJoIvxwEJwyBWHOm5DTmVlUYqNt4w==
Received: from DM6PR06CA0082.namprd06.prod.outlook.com (2603:10b6:5:336::15)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:21 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::8e) by DM6PR06CA0082.outlook.office365.com
 (2603:10b6:5:336::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:03 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 134/156] drm/nouveau/nvif: rework device "new cgrp" api
Date: Wed, 17 Apr 2024 09:39:40 +1000
Message-ID: <20240416234002.19509-135-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN2PR12MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: f88b1af9-327c-4c49-7d93-08dc5e6f000a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mw+3VFrjaqAf3a570uVY0sWSeVHg7iKN8huBdQ5YcHkBdIl6WI5VQ6dnM67HyRpYs8vRGBJ2MsTVxbd72AIwitLo5mCHXZdWt86MfhdCTDECa9ZWsH3qct7XkbKHhawMgZsf9RiZ6Jc6RWsW6pkNWJ5vDaMj3d+tx9w85mFa+Et0TZ8zBVeerEXMYTmoorNE8ZKI336aaoSAMr5M/JmH/daoT74h68BroQfrfUsV4T6nFKa9hTg0t7BMPsFvGvxnE5gAXq28Fshk7hOY9sP0EHMq0sqGkefx5WJ8ik4WgrZeXwpRwOHvEAKK0TvWLMTgBPfFW69Ag8Jou+5UGGKNuuFfX3gyVscpQ12LvvkUoSWXizovKPW9jY+NrpGL1WxeYXeN2/9PWpChz48pBWgiAPz8qUsG73XlZyvBQ8y3hTbCEkOjKg5bUi0Mj2/auzxVHqIsj98q48qqRxHnMd9HaaMC4H4/NAQXzE7jYA0QKBo1JKuK2reQMN75VqqPQZsszxkMfvy7QSqjqfPo64bj2fjm1cCdwBApwJs6oaWnSy/yp2rHTd1QbeP4cxECSKGIg2xTRMAXVEA6PHjxXxsW0RxGI/KAPhAkDuNgQgnXGYVDBdUlagMkCWLVNUYcAPffvAkntmtwW/vsek2YvCP9EB7dfOzaQgvmzziCT3Z8HP6AmELTg/OmuZ3iWDqbNZcj8O9ryXED0/qZJ/5aAVrb9AsMYm+ADg9Kn0fJStg1G9PF2mLppGScaUzNBYlvpNkx
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:21.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f88b1af9-327c-4c49-7d93-08dc5e6f000a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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
 drivers/gpu/drm/nouveau/include/nvif/cgrp.h   | 17 +++++
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 10 +++
 drivers/gpu/drm/nouveau/include/nvif/if0021.h | 16 -----
 drivers/gpu/drm/nouveau/nvif/Kbuild           |  1 +
 drivers/gpu/drm/nouveau/nvif/cgrp.c           | 52 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 19 ++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 14 ----
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c  | 67 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h  |  9 +++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  9 +++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |  1 +
 12 files changed, 163 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/cgrp.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0021.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/cgrp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cgrp.h b/drivers/gpu/drm/nouveau/include/nvif/cgrp.h
new file mode 100644
index 000000000000..337ba67c7695
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/cgrp.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVIF_CGRP_H__
+#define __NVIF_CGRP_H__
+#include <nvif/object.h>
+#include <nvif/driverif.h>
+struct nvif_device;
+struct nvif_vmm;
+
+struct nvif_cgrp {
+	const struct nvif_cgrp_impl *impl;
+	struct nvif_cgrp_priv *priv;
+	struct nvif_object object;
+};
+
+int nvif_cgrp_ctor(struct nvif_device *, struct nvif_vmm *, int runl, struct nvif_cgrp *);
+void nvif_cgrp_dtor(struct nvif_cgrp *);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 6161a29fb07f..75168621427a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -19,6 +19,7 @@ struct nvif_outp_priv;
 struct nvif_head_priv;
 struct nvif_disp_chan_priv;
 struct nvif_ctxdma_priv;
+struct nvif_cgrp_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -430,6 +431,12 @@ struct nvif_disp_impl {
 	} chan;
 };
 
+struct nvif_cgrp_impl {
+	void (*del)(struct nvif_cgrp_priv *);
+
+	u16 id;
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -546,6 +553,9 @@ struct nvif_device_impl {
 
 		struct {
 			s32 oclass;
+			int (*new)(struct nvif_device_priv *, u8 runl, struct nvif_vmm_priv *,
+				   const char *name, const struct nvif_cgrp_impl **,
+				   struct nvif_cgrp_priv **);
 		} cgrp;
 
 		struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0021.h b/drivers/gpu/drm/nouveau/include/nvif/if0021.h
deleted file mode 100644
index 5013def90455..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0021.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0021_H__
-#define __NVIF_IF0021_H__
-
-union nvif_cgrp_args {
-	struct nvif_cgrp_v0 {
-		__u8  version;
-		__u8  namelen;
-		__u8  runlist;
-		__u8  pad03[3];
-		__u16 cgid;
-		__u64 vmm;
-		__u8  name[];
-	} v0;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvif/Kbuild b/drivers/gpu/drm/nouveau/nvif/Kbuild
index 8e3ed36df6b3..50489933655c 100644
--- a/drivers/gpu/drm/nouveau/nvif/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvif/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: MIT
 nvif-y := nvif/object.o
 nvif-y += nvif/client.o
+nvif-y += nvif/cgrp.o
 nvif-y += nvif/conn.o
 nvif-y += nvif/device.o
 nvif-y += nvif/disp.o
diff --git a/drivers/gpu/drm/nouveau/nvif/cgrp.c b/drivers/gpu/drm/nouveau/nvif/cgrp.c
new file mode 100644
index 000000000000..1e968d0c0d5a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/cgrp.c
@@ -0,0 +1,52 @@
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
+#include <nvif/cgrp.h>
+#include <nvif/device.h>
+#include <nvif/vmm.h>
+
+void
+nvif_cgrp_dtor(struct nvif_cgrp *cgrp)
+{
+	if (!cgrp->impl)
+		return;
+
+	cgrp->impl->del(cgrp->priv);
+	cgrp->impl = NULL;
+}
+
+int
+nvif_cgrp_ctor(struct nvif_device *device, struct nvif_vmm *vmm, int runl, struct nvif_cgrp *cgrp)
+{
+	int ret;
+
+	if (!device->impl->fifo.cgrp.new)
+		return -ENODEV;
+
+	ret = device->impl->fifo.cgrp.new(device->priv, runl, vmm->priv, "nvifCgrp",
+					  &cgrp->impl, &cgrp->priv);
+	if (ret)
+		return ret;
+
+	nvif_object_ctor(&device->object, "nvifCgrp", cgrp->impl->id,
+			 device->impl->fifo.cgrp.oclass, &cgrp->object);
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 6a3b41004abd..f76861945cd0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -35,6 +35,7 @@
 #include <engine/disp/priv.h>
 #include <engine/disp/udisp.h>
 #include <engine/fifo/ufifo.h>
+#include <engine/fifo/ucgrp.h>
 
 struct nvif_device_priv {
 	struct nvkm_object object;
@@ -94,6 +95,22 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 	return nvkm_timer_read(udev->device->timer);
 }
 
+static int
+nvkm_udevice_cgrp_new(struct nvif_device_priv *udev, u8 runl, struct nvif_vmm_priv *uvmm,
+		      const char *name, const struct nvif_cgrp_impl **pimpl,
+		      struct nvif_cgrp_priv **ppriv)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_ucgrp_new(udev->device->fifo, runl, uvmm, name, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	nvkm_object_link(&udev->object, object);
+	return 0;
+}
+
 static int
 nvkm_udevice_disp_new(struct nvif_device_priv *udev,
 		      const struct nvif_disp_impl **pimpl, struct nvif_disp_priv **ppriv)
@@ -338,6 +355,8 @@ nvkm_udevice_new(struct nvkm_device *device,
 	if (device->fifo) {
 		if (!WARN_ON(nvkm_subdev_oneinit(&device->fifo->engine.subdev))) {
 			nvkm_ufifo_ctor(device->fifo, &udev->impl.fifo);
+
+			udev->impl.fifo.cgrp.new = nvkm_udevice_cgrp_new;
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 6bd464da1c96..1894a2075079 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -75,9 +75,6 @@ nvkm_fifo_class_new(struct nvkm_device *device, const struct nvkm_oclass *oclass
 {
 	struct nvkm_fifo *fifo = nvkm_fifo(oclass->engine);
 
-	if (oclass->engn == &fifo->func->cgrp.user)
-		return nvkm_ucgrp_new(fifo, oclass, argv, argc, pobject);
-
 	if (oclass->engn == &fifo->func->chan.user)
 		return nvkm_uchan_new(fifo, NULL, oclass, argv, argc, pobject);
 
@@ -94,20 +91,9 @@ static int
 nvkm_fifo_class_get(struct nvkm_oclass *oclass, int index, const struct nvkm_device_oclass **class)
 {
 	struct nvkm_fifo *fifo = nvkm_fifo(oclass->engine);
-	const struct nvkm_fifo_func_cgrp *cgrp = &fifo->func->cgrp;
 	const struct nvkm_fifo_func_chan *chan = &fifo->func->chan;
 	int c = 0;
 
-	/* *_CHANNEL_GROUP_* */
-	if (cgrp->user.oclass) {
-		if (c++ == index) {
-			oclass->base = cgrp->user;
-			oclass->engn = &fifo->func->cgrp.user;
-			*class = &nvkm_fifo_class;
-			return 0;
-		}
-	}
-
 	/* *_CHANNEL_DMA, *_CHANNEL_GPFIFO_* */
 	if (chan->user.oclass) {
 		if (c++ == index) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index a0f3277605a5..d1386d00fc36 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -208,6 +208,4 @@ extern const struct nvkm_chan_func ga100_chan;
 
 int nvkm_uchan_new(struct nvkm_fifo *, struct nvkm_cgrp *, const struct nvkm_oclass *,
 		   void *argv, u32 argc, struct nvkm_object **);
-int nvkm_ucgrp_new(struct nvkm_fifo *, const struct nvkm_oclass *, void *argv, u32 argc,
-		   struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
index 7c9a151b03a3..8acfd85cee53 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
@@ -19,17 +19,18 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include "ucgrp.h"
 #include "cgrp.h"
+#include "priv.h"
 #include "runl.h"
 
-#include <subdev/mmu.h>
-
-#include <nvif/if0021.h>
+#include <subdev/mmu/uvmm.h>
 
 struct nvif_cgrp_priv {
 	struct nvkm_object object;
 	struct nvkm_cgrp *cgrp;
+
+	struct nvif_cgrp_impl impl;
 };
 
 static int
@@ -61,6 +62,19 @@ nvkm_ucgrp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *ocl
 	return -EINVAL;
 }
 
+static void
+nvkm_ucgrp_del(struct nvif_cgrp_priv *ucgrp)
+{
+	struct nvkm_object *object = &ucgrp->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_cgrp_impl
+nvkm_ucgrp_impl = {
+	.del = nvkm_ucgrp_del,
+};
+
 static void *
 nvkm_ucgrp_dtor(struct nvkm_object *object)
 {
@@ -77,30 +91,24 @@ nvkm_ucgrp = {
 };
 
 int
-nvkm_ucgrp_new(struct nvkm_fifo *fifo, const struct nvkm_oclass *oclass, void *argv, u32 argc,
+nvkm_ucgrp_new(struct nvkm_fifo *fifo, u8 runi, struct nvif_vmm_priv *uvmm, const char *name,
+	       const struct nvif_cgrp_impl **pimpl, struct nvif_cgrp_priv **ppriv,
 	       struct nvkm_object **pobject)
 {
-	union nvif_cgrp_args *args = argv;
 	struct nvkm_runl *runl;
 	struct nvkm_vmm *vmm;
 	struct nvif_cgrp_priv *ucgrp;
+	struct nvkm_engine *engine;
 	int ret;
 
-	if (argc < sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	argc -= sizeof(args->v0);
-
-	if (args->v0.namelen != argc)
-		return -EINVAL;
-
 	/* Lookup objects referenced in args. */
-	runl = nvkm_runl_get(fifo, args->v0.runlist, 0);
+	runl = nvkm_runl_get(fifo, runi, 0);
 	if (!runl)
 		return -EINVAL;
 
-	vmm = nvkm_uvmm_search(oclass->client, args->v0.vmm);
-	if (IS_ERR(vmm))
-		return PTR_ERR(vmm);
+	vmm = nvkm_uvmm_ref(uvmm);
+	if (!vmm)
+		return -EINVAL;
 
 	/* Allocate channel group. */
 	if (!(ucgrp = kzalloc(sizeof(*ucgrp), GFP_KERNEL))) {
@@ -108,17 +116,32 @@ nvkm_ucgrp_new(struct nvkm_fifo *fifo, const struct nvkm_oclass *oclass, void *a
 		goto done;
 	}
 
-	nvkm_object_ctor(&nvkm_ucgrp, oclass, &ucgrp->object);
-	*pobject = &ucgrp->object;
+	engine = nvkm_engine_ref(&fifo->engine);
+	if (IS_ERR(engine)) {
+		ret = PTR_ERR(engine);
+		goto done;
+	}
 
-	ret = nvkm_cgrp_new(runl, args->v0.name, vmm, true, &ucgrp->cgrp);
-	if (ret)
+	ret = nvkm_cgrp_new(runl, name, vmm, true, &ucgrp->cgrp);
+	if (ret) {
+		nvkm_engine_unref(&engine);
 		goto done;
+	}
+
+	nvkm_object_ctor(&nvkm_ucgrp, &(struct nvkm_oclass) { .engine = engine }, &ucgrp->object);
 
 	/* Return channel group info to caller. */
-	args->v0.cgid = ucgrp->cgrp->id;
+	ucgrp->impl = nvkm_ucgrp_impl;
+	ucgrp->impl.id = ucgrp->cgrp->id;
+
+	*pimpl = &ucgrp->impl;
+	*ppriv = ucgrp;
+	*pobject = &ucgrp->object;
 
 done:
+	if (ret)
+		kfree(ucgrp);
+
 	nvkm_vmm_unref(&vmm);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h
new file mode 100644
index 000000000000..97f3d9eafdfc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UCGRP_H__
+#define __NVKM_UCGRP_H__
+#include <engine/fifo.h>
+#include <nvif/driverif.h>
+
+int nvkm_ucgrp_new(struct nvkm_fifo *, u8 runl, struct nvif_vmm_priv *,  const char *name,
+		   const struct nvif_cgrp_impl **, struct nvif_cgrp_priv **, struct nvkm_object **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index d8e7888410c3..5fac19738815 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -33,6 +33,15 @@ struct nvif_vmm_priv {
 	struct nvif_vmm_impl impl;
 };
 
+struct nvkm_vmm *
+nvkm_uvmm_ref(struct nvif_vmm_priv *uvmm)
+{
+	if (uvmm)
+		return nvkm_vmm_ref(uvmm->vmm);
+
+	return NULL;
+}
+
 static const struct nvkm_object_func nvkm_uvmm;
 struct nvkm_vmm *
 nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
index 51c639cd0ce0..fb2deeb01d56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
@@ -6,4 +6,5 @@
 int nvkm_uvmm_new(struct nvkm_mmu *mmu, u8 type, u64 addr, u64 size,
 		  void *, u32, const struct nvif_vmm_impl **, struct nvif_vmm_priv **,
 		  struct nvkm_object **);
+struct nvkm_vmm *nvkm_uvmm_ref(struct nvif_vmm_priv *);
 #endif
-- 
2.41.0

