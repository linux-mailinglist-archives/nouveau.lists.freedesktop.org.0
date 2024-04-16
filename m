Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B368A7949
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FDD112FF6;
	Tue, 16 Apr 2024 23:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gDTvNKRY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C662112FEF
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXRvxIybKJGQWsetCmgKqhejy8SRTr8/uAjov2gDd/ZkVvO+fbqTMFb4du/PXo3My8EEMQz6fiUZgEMSk9CjM4n/L9raf/Har/H0Db35kI/GnA7XsEONx145S+380cSWqGlQBTY10Sjh/itcHQR1+qQFGQfj9Dia2sffZvayVErEDs+9As/3wjIJmxLapM1hqYmH0GlRyX7r3BA4KNzGEJ2f/JVuZoRsoeVNYGkBWUx+Zx/NQxM4n0KMFIfTHEzblIemwL6ldq6x0E1WI+vcj043ok1DcA/LubsVeXylISufD2eD9ROwDdwVVIhp119stOM8CPcrdzl+UtJAU6Aoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXDM4AcmsYygvujo9B+q3PpNk2K8BLkUYkZiLbyvmO4=;
 b=Y+VcERsSA1c4WnhPQj4wqoxA2k0NBwrZ7NTZEPMFP+2dPc4Z01nplt4C7Ahc7ylq/xN/jyiTFCQOGowcuT2gYiOcUPQamdWVA+0ADt0JcJkx+zlXHeTbvpExV9zOuzWEEbnVLXEwOm+xGfcGXS2wqnlR2NlYbH+TpJx/fShHI9CzQ6sH8tMb3duNfVrGeWj9nm6PhxDDF2qgPAPY4HmuasVDwsQ/4JBMNwDE1P9d/KGKsh5gLqrVbwiOaOKDeGm860C5JAACCeCW4nFuEZqf5nvEdRKgrH93NngnY9quRbk42mAQrhVUqREi1qPr2n9wUlF2lDpU1gMCWx5Weet6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXDM4AcmsYygvujo9B+q3PpNk2K8BLkUYkZiLbyvmO4=;
 b=gDTvNKRYBXdXQ9A/S64cPdCwDWe/C3M4Xtvmf9LJpQrmsWjUbpHCtcggY2ySHUenmdTH6vButOYzzcUAEeaRX8O24eK1EszhcGbhcSdgN5d+/JqEMZLRwgtngNRDNMnUD3S8nJH77iC1uBIu59J2y+r4naa/yCSNaIivUp4c8CL/GhJTewZlT9An2TxunGHK5L1KmND+QuUzkKW4kDMca8jVhboQYoWVjZYc0RZuCRb06Kin7acclx1YL6jhFYU+oMX19w3NLFGQJi+v+tTBvHAt+PrNtYQkQ4O2UWMJopueQRNtVcb+fK0pNcyF+S5ViO6Y1xfqjBn/UFVo5/45BQ==
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by SJ2PR12MB8719.namprd12.prod.outlook.com (2603:10b6:a03:543::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:49 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::2) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:20 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 149/156] drm/nouveau/nvif: remove engobj from object rb
Date: Wed, 17 Apr 2024 09:39:55 +1000
Message-ID: <20240416234002.19509-150-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SJ2PR12MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 09256c12-5ea5-4a26-66c8-08dc5e6f1035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wAaGuckztWlf7peqgOmuL8vl2EbSN1jblVdn85mpgOi8X6+eYbjPJpARf5lHz/Zwq3FmHAd9tCMLY6MyedYVMme5dV6LBelsaQeIa1QsZ2l7ofLUlGZksA3+wKu35k6pO1XDgc9XQ80IZ2fMRgT4AUWhOdXkf404z+3JkSuPvwIIcFwZn78egZk1rsCzi+F36Y3MrREYJIgfbvxloKpj3t9FgQL474cB+trlBLYtYC0a/bpEneivRdm903pODBtTk2JHnD5B7kRvDIszmMaJWhEImdVY2WfifRriz6xj7nokyFUVk0K2KDQgrX0iKWVaGgZDgeyIb5tWzUeo6YRrF5LrtXOGYDQbziJvAlW6FgyGAs7T4SmZLnkbZtkZGRoDCLf4BsWpUYEGy8NgkjL83DxxrMQ/jrn+/tQKg5jhy8MWvldKVtZ8Q7bs+qdJlQsytb5EpREe4J3PwfHIWrnSfJqYsY6R5ZFHEzOp/f0YHEhwHeJ4ieGVFIHyDzprlqbiiK7Kz/ZW9PIRnWRXf02mirwy2MVb5BSrRJykEewKKKB+EcAuMQw1O04DOcAnMxHcOcFpD+xmxKHPAmI5vYqf/1PRPKBeAYhpK2T+Bj6q+jz3F31D3ZMaJEDrjVe4hIXhw1Bx9t98hRCJBUMBO2pclpm6On29jBzrKxYwI9luVpmeUhVVqjni7bol/nz/CRcLHP4n8kNkK0FLDsQrbN/NKTORklJIvUbEIqTiUGXfyoFM8ZkmnARgZbmTOjCHmUq
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:48.4521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09256c12-5ea5-4a26-66c8-08dc5e6f1035
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8719
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |   4 +-
 drivers/gpu/drm/nouveau/include/nvif/object.h |  13 +-
 .../drm/nouveau/include/nvkm/core/client.h    |   1 -
 .../gpu/drm/nouveau/include/nvkm/core/ioctl.h |   8 -
 .../drm/nouveau/include/nvkm/core/object.h    |   8 -
 drivers/gpu/drm/nouveau/nvif/chan.c           |   2 +-
 drivers/gpu/drm/nouveau/nvif/client.c         |   1 -
 drivers/gpu/drm/nouveau/nvif/driver.c         |   1 -
 drivers/gpu/drm/nouveau/nvif/object.c         |  78 +------
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |   1 -
 drivers/gpu/drm/nouveau/nvkm/core/driver.c    |   8 -
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 196 ------------------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    |  92 --------
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |   7 +-
 14 files changed, 8 insertions(+), 412 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 244024c19206..04d488eb3ad5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -27,7 +27,6 @@ struct nvif_driver {
 	const char *name;
 	int (*suspend)(struct nvif_client_priv *);
 	int (*resume)(struct nvif_client_priv *);
-	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
 	void __iomem *(*map)(struct nvif_client_priv *, u64 handle, u32 size);
 	void (*unmap)(struct nvif_client_priv *, void __iomem *ptr, u32 size);
 };
@@ -474,8 +473,7 @@ struct nvif_chan_impl {
 
 	struct {
 		int (*new)(struct nvif_chan_priv *, u32 handle, u8 engi, s32 oclass,
-			   const struct nvif_engobj_impl **, struct nvif_engobj_priv **,
-			   u64 object);
+			   const struct nvif_engobj_impl **, struct nvif_engobj_priv **);
 	} engobj;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 98a8bba8f0ee..94722ded1d68 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -28,18 +28,9 @@ nvif_object_constructed(struct nvif_object *object)
 	return object->client != NULL;
 }
 
-int nvif_object_ctor_0(struct nvif_object *, const char *name, u32 handle,
-		       s32 oclass, void *, u32, struct nvif_object *);
-void nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
-			struct nvif_object *);
-
-#define nvif_object_ctor_(A,B,C,D,E,F,G,IMPL,...) IMPL
-#define nvif_object_ctor(A...) nvif_object_ctor_(A, nvif_object_ctor_0, \
-						    nvif_object_ctor__, \
-						    nvif_object_ctor_1)(A)
-
+void nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
+		      struct nvif_object *);
 void nvif_object_dtor(struct nvif_object *);
-int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
 int nvif_object_map_cpu(struct nvif_object *, const struct nvif_mapinfo *, struct nvif_map *);
 int nvif_object_unmap_cpu(struct nvif_map *);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index e35aea7a751f..21d75783c258 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -36,5 +36,4 @@ extern const struct nvif_client_impl nvkm_client_impl;
 #define nvif_debug(o,f,a...) nvif_printk((o), DEBUG, INFO, f, ##a)
 #define nvif_trace(o,f,a...) nvif_printk((o), TRACE, INFO, f, ##a)
 #define nvif_info(o,f,a...)  nvif_printk((o),  INFO, INFO, f, ##a)
-#define nvif_ioctl(o,f,a...) nvif_trace((o), "ioctl: "f, ##a)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h b/drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h
deleted file mode 100644
index f52918a43246..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_IOCTL_H__
-#define __NVKM_IOCTL_H__
-#include <core/os.h>
-struct nvkm_client;
-
-int nvkm_ioctl(struct nvkm_client *, void *, u32, void **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index de8bf1cc95d8..18d56fd3de72 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -17,7 +17,6 @@ struct nvkm_object {
 	struct list_head head;
 	struct list_head tree;
 	u64 object;
-	struct rb_node node;
 };
 
 struct nvkm_object_func {
@@ -50,17 +49,10 @@ int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
 
 void nvkm_object_link_(struct nvif_client_priv *, struct nvkm_object *parent, struct nvkm_object *);
-int nvkm_object_link_rb(struct nvif_client_priv *, struct nvkm_object *parent, u64 handle,
-		        struct nvkm_object *);
 
 static inline void
 nvkm_object_link(struct nvkm_object *parent, struct nvkm_object *object)
 {
 	nvkm_object_link_(parent->client, parent, object);
 }
-
-bool nvkm_object_insert(struct nvkm_object *);
-void nvkm_object_remove(struct nvkm_object *);
-struct nvkm_object *nvkm_object_search(struct nvkm_client *, u64 object,
-				       const struct nvkm_object_func *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index ff4485ed0e89..79c40bb2cbb6 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -66,7 +66,7 @@ nvif_engobj_ctor(struct nvif_chan *chan, const char *name, u32 handle, s32 oclas
 		return ret;
 
 	ret = chan->impl->engobj.new(chan->priv, handle, engi, oclass, &engobj->impl,
-				     &engobj->priv, nvif_handle(&engobj->object));
+				     &engobj->priv);
 	NVIF_ERRON(ret, &chan->object, "[NEW engobj handle:%08x oclass:%08x]", handle, oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 6b3c7b28b212..2a66b23c9d1d 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -60,7 +60,6 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_clien
 		return ret;
 
 	nvif_object_ctor(&parent->object, name ?: "nvifClient", 0, 0, &client->object);
-	client->object.priv = client->priv;
 	client->driver = parent->driver;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index 95515f2023f4..54263ff7c7e6 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -34,7 +34,6 @@ nvif_driver_ctor(struct nvif_parent *parent, const struct nvif_driver *driver, c
 	client->object.client = client;
 
 	nvif_object_ctor(&client->object, name ?: "nvifDriver", 0, 0, &client->object);
-	client->object.priv = priv;
 	client->driver = driver;
 	client->impl = impl;
 	client->priv = priv;
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 3379580463e6..6044634f20b8 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -25,26 +25,6 @@
 #include <nvif/object.h>
 #include <nvif/client.h>
 #include <nvif/driverif.h>
-#include <nvif/ioctl.h>
-
-int
-nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
-{
-	struct nvif_client *client = object->client;
-	union {
-		struct nvif_ioctl_v0 v0;
-	} *args = data;
-
-	if (size >= sizeof(*args) && args->v0.version == 0) {
-		if (object != &client->object)
-			args->v0.object = nvif_handle(object);
-		else
-			args->v0.object = 0;
-	} else
-		return -ENOSYS;
-
-	return client->driver->ioctl(client->object.priv, data, size, hack);
-}
 
 int
 nvif_object_unmap_cpu(struct nvif_map *map)
@@ -95,23 +75,15 @@ nvif_object_map_cpu(struct nvif_object *object,
 void
 nvif_object_dtor(struct nvif_object *object)
 {
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_del del;
-	} args = {
-		.ioctl.type = NVIF_IOCTL_V0_DEL,
-	};
-
 	if (!nvif_object_constructed(object))
 		return;
 
-	nvif_object_ioctl(object, &args, sizeof(args), NULL);
 	object->client = NULL;
 }
 
 void
-nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
-		   struct nvif_object *object)
+nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
+		 struct nvif_object *object)
 {
 	object->parent = parent->parent;
 	object->client = parent->client;
@@ -122,49 +94,3 @@ nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle, s32
 	object->map.ptr = NULL;
 	object->map.size = 0;
 }
-
-int
-nvif_object_ctor_0(struct nvif_object *parent, const char *name, u32 handle,
-		   s32 oclass, void *data, u32 size, struct nvif_object *object)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_new_v0 new;
-	} *args;
-	int ret = 0;
-
-	object->client = NULL;
-	object->name = name ? name : "nvifObject";
-	object->handle = handle;
-	object->oclass = oclass;
-	object->map.ptr = NULL;
-	object->map.size = 0;
-
-	if (parent) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
-			nvif_object_dtor(object);
-			return -ENOMEM;
-		}
-
-		object->parent = parent->parent;
-
-		args->ioctl.version = 0;
-		args->ioctl.type = NVIF_IOCTL_V0_NEW;
-		args->new.version = 0;
-		args->new.object = nvif_handle(object);
-		args->new.handle = handle;
-		args->new.oclass = oclass;
-
-		memcpy(args->new.data, data, size);
-		ret = nvif_object_ioctl(parent, args, sizeof(*args) + size,
-					&object->priv);
-		memcpy(data, args->new.data, size);
-		kfree(args);
-		if (ret == 0)
-			object->client = parent->client;
-	}
-
-	if (ret)
-		nvif_object_dtor(object);
-	return ret;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
index 7d111a5481d3..50ff041ecdf0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
@@ -7,7 +7,6 @@ nvkm-y += nvkm/core/event.o
 nvkm-y += nvkm/core/firmware.o
 nvkm-y += nvkm/core/gpuobj.o
 nvkm-y += nvkm/core/intr.o
-nvkm-y += nvkm/core/ioctl.o
 nvkm-y += nvkm/core/memory.o
 nvkm-y += nvkm/core/mm.o
 nvkm-y += nvkm/core/object.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index ea00b8724f24..37d7fa8f9760 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -28,7 +28,6 @@
 #include <core/client.h>
 #include <core/driver.h>
 #include <core/event.h>
-#include <core/ioctl.h>
 
 #include <nvif/driverif.h>
 #include <nvif/event.h>
@@ -45,12 +44,6 @@ nvkm_driver_map(struct nvif_client_priv *client, u64 handle, u32 size)
 	return ioremap(handle, size);
 }
 
-static int
-nvkm_driver_ioctl(void *priv, void *data, u32 size, void **hack)
-{
-	return nvkm_ioctl(priv, data, size, hack);
-}
-
 static int
 nvkm_driver_resume(struct nvif_client_priv *client)
 {
@@ -80,7 +73,6 @@ nvkm_driver = {
 	.name = "nvkm",
 	.suspend = nvkm_driver_suspend,
 	.resume = nvkm_driver_resume,
-	.ioctl = nvkm_driver_ioctl,
 	.map = nvkm_driver_map,
 	.unmap = nvkm_driver_unmap,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
deleted file mode 100644
index 50e9a6d51c05..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ /dev/null
@@ -1,196 +0,0 @@
-/*
- * Copyright 2014 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs <bskeggs@redhat.com>
- */
-#include <core/ioctl.h>
-#include <core/client.h>
-#include <core/engine.h>
-
-#include <nvif/unpack.h>
-#include <nvif/ioctl.h>
-
-static int
-nvkm_ioctl_nop(struct nvkm_client *client,
-	       struct nvkm_object *object, void *data, u32 size)
-{
-	return -ENOSYS;
-}
-
-#include <nvif/class.h>
-
-static int
-nvkm_ioctl_sclass_(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
-{
-	if (object->func->sclass)
-		return object->func->sclass(object, index, oclass);
-
-	return -ENOSYS;
-}
-
-static int
-nvkm_ioctl_sclass(struct nvkm_client *client,
-		  struct nvkm_object *object, void *data, u32 size)
-{
-	return -ENODEV;
-}
-
-static int
-nvkm_ioctl_new(struct nvkm_client *client,
-	       struct nvkm_object *parent, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_new_v0 v0;
-	} *args = data;
-	struct nvkm_object *object = NULL;
-	struct nvkm_oclass oclass;
-	int ret = -ENOSYS, i = 0;
-
-	nvif_ioctl(parent, "new size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(parent, "new vers %d handle %08x class %08x object %016llx\n",
-			   args->v0.version, args->v0.handle, args->v0.oclass,
-			   args->v0.object);
-	} else
-		return ret;
-
-	if (!parent->func->sclass) {
-		nvif_ioctl(parent, "cannot have children\n");
-		return -EINVAL;
-	}
-
-	do {
-		memset(&oclass, 0x00, sizeof(oclass));
-		oclass.handle = args->v0.handle;
-		oclass.object = args->v0.object;
-		oclass.client = client;
-		oclass.parent = parent;
-		ret = nvkm_ioctl_sclass_(parent, i++, &oclass);
-		if (ret)
-			return ret;
-	} while (oclass.base.oclass != args->v0.oclass);
-
-	if (oclass.engine) {
-		oclass.engine = nvkm_engine_ref(oclass.engine);
-		if (IS_ERR(oclass.engine))
-			return PTR_ERR(oclass.engine);
-	}
-
-	ret = oclass.ctor(&oclass, data, size, &object);
-	nvkm_engine_unref(&oclass.engine);
-	if (ret == 0) {
-		ret = nvkm_object_init(object);
-		if (ret == 0) {
-			list_add_tail(&object->head, &parent->tree);
-			if (nvkm_object_insert(object)) {
-				client->data = object;
-				return 0;
-			}
-			ret = -EEXIST;
-		}
-		nvkm_object_fini(object, false);
-	}
-
-	nvkm_object_del(&object);
-	return ret;
-}
-
-static int
-nvkm_ioctl_del(struct nvkm_client *client,
-	       struct nvkm_object *object, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_del none;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "delete size %d\n", size);
-	if (!(ret = nvif_unvers(ret, &data, &size, args->none))) {
-		nvif_ioctl(object, "delete\n");
-		nvkm_object_fini(object, false);
-		nvkm_object_del(&object);
-	}
-
-	return ret ? ret : 1;
-}
-
-static struct {
-	int version;
-	int (*func)(struct nvkm_client *, struct nvkm_object *, void *, u32);
-}
-nvkm_ioctl_v0[] = {
-	{ 0x00, nvkm_ioctl_nop },
-	{ 0x00, nvkm_ioctl_sclass },
-	{ 0x00, nvkm_ioctl_new },
-	{ 0x00, nvkm_ioctl_del },
-};
-
-static int
-nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
-		void *data, u32 size)
-{
-	struct nvkm_object *object;
-	int ret;
-
-	object = nvkm_object_search(client, handle, NULL);
-	if (IS_ERR(object)) {
-		nvif_ioctl(&client->object, "object not found\n");
-		return PTR_ERR(object);
-	}
-
-	if (ret = -EINVAL, type < ARRAY_SIZE(nvkm_ioctl_v0)) {
-		if (nvkm_ioctl_v0[type].version == 0)
-			ret = nvkm_ioctl_v0[type].func(client, object, data, size);
-	}
-
-	return ret;
-}
-
-int
-nvkm_ioctl(struct nvkm_client *client, void *data, u32 size, void **hack)
-{
-	struct nvkm_object *object = &client->object;
-	union {
-		struct nvif_ioctl_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "size %d\n", size);
-
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(object,
-			   "vers %d type %02x object %016llx owner %02x\n",
-			   args->v0.version, args->v0.type, args->v0.object,
-			   args->v0.owner);
-		ret = nvkm_ioctl_path(client, args->v0.object, args->v0.type,
-				      data, size);
-	}
-
-	if (ret != 1) {
-		nvif_ioctl(object, "return %d\n", ret);
-		if (hack) {
-			*hack = client->data;
-			client->data = NULL;
-		}
-	}
-
-	return ret;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 8ad1aff9b8c7..5645dd51abd5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -25,79 +25,6 @@
 #include <core/client.h>
 #include <core/engine.h>
 
-struct nvkm_object *
-nvkm_object_search(struct nvkm_client *client, u64 handle,
-		   const struct nvkm_object_func *func)
-{
-	struct nvkm_object *object;
-	unsigned long flags;
-
-	if (handle) {
-		spin_lock_irqsave(&client->obj_lock, flags);
-		struct rb_node *node = client->objroot.rb_node;
-		while (node) {
-			object = rb_entry(node, typeof(*object), node);
-			if (handle < object->object)
-				node = node->rb_left;
-			else
-			if (handle > object->object)
-				node = node->rb_right;
-			else {
-				spin_unlock_irqrestore(&client->obj_lock, flags);
-				goto done;
-			}
-		}
-		spin_unlock_irqrestore(&client->obj_lock, flags);
-		return ERR_PTR(-ENOENT);
-	} else {
-		object = &client->object;
-	}
-
-done:
-	if (unlikely(func && object->func != func))
-		return ERR_PTR(-EINVAL);
-	return object;
-}
-
-void
-nvkm_object_remove(struct nvkm_object *object)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&object->client->obj_lock, flags);
-	if (!RB_EMPTY_NODE(&object->node))
-		rb_erase(&object->node, &object->client->objroot);
-	spin_unlock_irqrestore(&object->client->obj_lock, flags);
-}
-
-bool
-nvkm_object_insert(struct nvkm_object *object)
-{
-	struct rb_node **ptr;
-	struct rb_node *parent = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&object->client->obj_lock, flags);
-	ptr = &object->client->objroot.rb_node;
-	while (*ptr) {
-		struct nvkm_object *this = rb_entry(*ptr, typeof(*this), node);
-		parent = *ptr;
-		if (object->object < this->object) {
-			ptr = &parent->rb_left;
-		} else if (object->object > this->object) {
-			ptr = &parent->rb_right;
-		} else {
-			spin_unlock_irqrestore(&object->client->obj_lock, flags);
-			return false;
-		}
-	}
-
-	rb_link_node(&object->node, parent, ptr);
-	rb_insert_color(&object->node, &object->client->objroot);
-	spin_unlock_irqrestore(&object->client->obj_lock, flags);
-	return true;
-}
-
 int
 nvkm_object_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
@@ -232,7 +159,6 @@ nvkm_object_del(struct nvkm_object **pobject)
 
 	if (object && !WARN_ON(!object->func)) {
 		*pobject = nvkm_object_dtor(object);
-		nvkm_object_remove(object);
 
 		spin_lock_irq(&object->client->obj_lock);
 		list_del(&object->head);
@@ -255,7 +181,6 @@ nvkm_object_ctor(const struct nvkm_object_func *func,
 	object->object = oclass->object;
 	INIT_LIST_HEAD(&object->head);
 	INIT_LIST_HEAD(&object->tree);
-	RB_CLEAR_NODE(&object->node);
 	WARN_ON(IS_ERR(object->engine));
 }
 
@@ -296,20 +221,3 @@ nvkm_object_link_(struct nvif_client_priv *client, struct nvkm_object *parent,
 	list_add_tail(&object->head, &parent->tree);
 	spin_unlock_irq(&client->obj_lock);
 }
-
-int
-nvkm_object_link_rb(struct nvif_client_priv *client, struct nvkm_object *parent, u64 handle,
-		    struct nvkm_object *object)
-{
-	nvkm_object_link_(client, parent, object);
-
-	object->object = handle;
-
-	if (!nvkm_object_insert(object)) {
-		nvkm_object_fini(object, false);
-		nvkm_object_del(&object);
-		return -EEXIST;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 281994235c5f..e691853000fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -214,8 +214,7 @@ nvkm_uchan_object_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 static int
 nvkm_uchan_engobj_new(struct nvif_chan_priv *uchan, u32 handle, u8 engi, s32 oclass,
-		      const struct nvif_engobj_impl **pimpl, struct nvif_engobj_priv **ppriv,
-		      u64 _handle)
+		      const struct nvif_engobj_impl **pimpl, struct nvif_engobj_priv **ppriv)
 {
 	struct nvkm_chan *chan = uchan->chan;
 	struct nvkm_runl *runl = chan->cgrp->runl;
@@ -285,9 +284,7 @@ nvkm_uchan_engobj_new(struct nvif_chan_priv *uchan, u32 handle, u8 engi, s32 ocl
 	*pimpl = &nvkm_uchan_object_impl;
 	*ppriv = (void *)container_of(object, struct nvkm_uobj, oproxy.base);
 
-	ret = nvkm_object_link_rb(uchan->object.client, &uchan->object, _handle, object);
-	if (ret)
-		nvkm_object_fini(object, false);
+	nvkm_object_link(&uchan->object, object);
 
 done:
 	if (ret)
-- 
2.41.0

