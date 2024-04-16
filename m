Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C968A78EE
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56F112F67;
	Tue, 16 Apr 2024 23:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBs9rdyS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6372112F62
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdiScv5r8KNsZnj0FMyFbrbNChQCFMgwPKJhYFiUJllXQztHoYfaZSYWnyLWFepVLP1HTvjITpr35UAst4FqKNoshV+KO1EiYz2h8bpEE/T0Xkf1AFrIAVCaXJWkxwLqYDM+bkFYCK5ES7crSQcqoZrLArTsm+8VHuumsQytEyYOjd0clpZfEKRPP+UK0dcNP+zQXwByG1yzkGmdpXFpva4G/O6J6OfH8VuiMGVRUB/5aE2VDhTfXcsI0/cGC9YY0MR1FmUkPRywqbM00NL/+bvfBuMHe9wcuISnmCWQ37RwPHu6Rk7dIDYBzK/KXW9h/YFGfv43xcujnWMyBsC8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t11JSdi3Kd1icJL30f9wZyMMcay38Kq1AMJrjHR70fc=;
 b=inOHnIx3nFO3+9ZmB3omUlM5zVfdfRz4b/QCfWCK16r8twkEMcPW1Xja3GSoHofV9zQ9O9MC/GC4O25PgufmbsfoKn/Q/26Kp2NOSgwLlZVuvJPoupdp5J7RNN8KeLhKxXC+GfsGvNXTXUOapnxGuXC1D4xkQoGEWBxhWAleF3hTE6TubhwLY/U7H31wjyGSqXW+5aLVPbkhDU/ikF9Dv92x1aOzR990u7UpsIu75uU6PgMUetiW0pyl5+UR/3mvcImpnhWJNDXa8mnUsl0/i3zEe3iJJ1JTEUQ+S+SWJkf/7cihdyhC3Tms6UckoX9+xWTDWubXxjMF1Og3kJ/cjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t11JSdi3Kd1icJL30f9wZyMMcay38Kq1AMJrjHR70fc=;
 b=mBs9rdySIS6bnlRTrQU5RTxXGQQbmSKwLhq8MdxPic9cedQWq4UII5Ym3vc13igixwMX59be9Nioq+ryXBk0txMLpRmjstZxEagY1GGv9Cs6Hth+dvN/MmH2ex+itu2ymNcDqggsDlPFGRi9OMTUpvpF1pdIgd4iHrIIyhcmFuaoZFFm2DHgsl632aikRmwUMf8Wt9Cepk/n/5OzL859Yq7SOB0cI5BpfGvAr3LQJh0GCTcEpZuFYgHbufdTBkp+j7YN/CcOMJGkj5NJofi/usBs4sY0o7nWIBWHAhju9mLOqAMByclbv6ygAli7LDHMaz9GAjJ/YJX/QjbDEM5LQQ==
Received: from BN9PR03CA0681.namprd03.prod.outlook.com (2603:10b6:408:10e::26)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:03 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::97) by BN9PR03CA0681.outlook.office365.com
 (2603:10b6:408:10e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:41 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 062/156] drm/nouveau/nvif: rework driver "new client" api
Date: Wed, 17 Apr 2024 09:38:28 +1000
Message-ID: <20240416234002.19509-63-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a39382-1446-4e25-97c2-08dc5e6ed114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OnA2+gznhhphSEOHVNvLUf2t5zJz65m37fmUP/BerfTLDiCs1xA3Vt06xYZ+G4KnWO7cdrjgkDZpd1kidTz/akDXbMKa0AgvAKZCaVmdxU60r8OavnorBrWfGKdxt79iYEXhQ+Gx6QfG5iVHe/YIkIYq7i8w8m8GJEOxxCpNWaRnBFW63yEp8VgfMKwR3XZiLzzyslQydc81wapME1VqETo95x2K1KWOG+jdVzFHNUN3O76JcuQbEKYDjUGPfZdFWUQ3XjQRoJLPwNEqVasRsiayWDKrBeqK5mQrQ5gpeAtqYcJLnD13KjoqYlDjUS0VvFEZ/WZFMlNYIjy/twbZANr5ckoAg7eYKSxZdcFCH0HTLs5JqgJFhySRsZk7NvN2Unwh//7rb/DuMAAZbUlEAP7+e0ua1+vmFaXvQG0W1EQuxRJ0EH9IXjLkBAlKBFwxpp5cgl/Tg7XYDeSBofulMkJxwam1kdW+k5tg9c2rVcfdDO1aMS38RfG5UeBynatAkxfxW8xhnFYqmuoaeK/kFtUSilQYsqk4rxz5vzyApKWTk12fTA3XrjESXD/otVIQ0R/uH1/zQFRQfg2Wj8PzpiraHb4CeaeKNhAiJeUzIpaBTIg1OMhrRZo+QGwRXzAeVD7aDFrnJQlpdU4sGkBsHivkucAYPAxuSdOE9qbvUly70ok/kPUQAoR17oUmFaIT0/RGV4pFTTO7p/Rk7uhnaeUMSeX4YF4gCNTILmuK0euVP1DgsLQuACARx6foO4bf
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:02.4781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a39382-1446-4e25-97c2-08dc5e6ed114
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244
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
 drivers/gpu/drm/nouveau/include/nvif/class.h  |  2 -
 drivers/gpu/drm/nouveau/include/nvif/client.h |  3 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  6 +++
 drivers/gpu/drm/nouveau/include/nvif/if0000.h | 11 -----
 .../drm/nouveau/include/nvkm/core/object.h    | 10 ++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 28 +----------
 drivers/gpu/drm/nouveau/nvif/client.c         | 26 +++--------
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 46 ++++++-------------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 33 +++++++++++++
 9 files changed, 72 insertions(+), 93 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0000.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 824e052dcc25..b6bba7231750 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -3,8 +3,6 @@
 #define __NVIF_CLASS_H__
 
 /* these class numbers are made up by us, and not nvidia-assigned */
-#define NVIF_CLASS_CLIENT                            /* if0000.h */ -0x00000000
-
 #define NVIF_CLASS_CONTROL                           /* if0001.h */ -0x00000001
 
 #define NVIF_CLASS_SW_NV04                           /* if0004.h */ -0x00000004
diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index f8e4e25d6e86..1659e989df52 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -12,8 +12,7 @@ struct nvif_client {
 	const struct nvif_driver *driver;
 };
 
-int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
-		      struct nvif_client *);
+int  nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *);
 void nvif_client_dtor(struct nvif_client *);
 int  nvif_client_suspend(struct nvif_client *);
 int  nvif_client_resume(struct nvif_client *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 655bd389044d..a6f95c8475b1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -14,5 +14,11 @@ struct nvif_driver {
 
 struct nvif_client_impl {
 	void (*del)(struct nvif_client_priv *);
+
+	struct {
+		int (*new)(struct nvif_client_priv *parent,
+			   const struct nvif_client_impl **, struct nvif_client_priv **,
+			   u64 handle);
+	} client;
 };
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
deleted file mode 100644
index 4b31496b37e1..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0000_H__
-#define __NVIF_IF0000_H__
-
-struct nvif_client_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 device;
-	char  name[32];
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index 10107ef3ca49..9ab163d9a4d0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -58,6 +58,16 @@ int nvkm_object_unmap(struct nvkm_object *);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
 
+void nvkm_object_link_(struct nvif_client_priv *, struct nvkm_object *parent, struct nvkm_object *);
+int nvkm_object_link_rb(struct nvif_client_priv *, struct nvkm_object *parent, u64 handle,
+		        struct nvkm_object *);
+
+static inline void
+nvkm_object_link(struct nvkm_object *parent, struct nvkm_object *object)
+{
+	nvkm_object_link_(parent->client, parent, object);
+}
+
 bool nvkm_object_insert(struct nvkm_object *);
 void nvkm_object_remove(struct nvkm_object *);
 struct nvkm_object *nvkm_object_search(struct nvkm_client *, u64 object,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d793afd929c9..5e4c706bf150 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -113,30 +113,6 @@ static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
 
-static u64
-nouveau_pci_name(struct pci_dev *pdev)
-{
-	u64 name = (u64)pci_domain_nr(pdev->bus) << 32;
-	name |= pdev->bus->number << 16;
-	name |= PCI_SLOT(pdev->devfn) << 8;
-	return name | PCI_FUNC(pdev->devfn);
-}
-
-static u64
-nouveau_platform_name(struct platform_device *platformdev)
-{
-	return platformdev->id;
-}
-
-static u64
-nouveau_name(struct drm_device *dev)
-{
-	if (dev_is_pci(dev->dev))
-		return nouveau_pci_name(to_pci_dev(dev->dev));
-	else
-		return nouveau_platform_name(to_platform_device(dev->dev));
-}
-
 static inline bool
 nouveau_cli_work_ready(struct dma_fence *fence)
 {
@@ -234,7 +210,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{ NVIF_CLASS_VMM_NV04 , -1 },
 		{}
 	};
-	u64 device = nouveau_name(drm->dev);
 	int ret;
 
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
@@ -246,8 +221,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	mutex_init(&cli->lock);
 
 	mutex_lock(&drm->client_mutex);
-	ret = nvif_client_ctor(&drm->_client, cli->name, device,
-			       &cli->base);
+	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
 	mutex_unlock(&drm->client_mutex);
 	if (ret) {
 		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 4c4a856ab861..0211fa76431f 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -26,9 +26,7 @@
 #include <nvif/driver.h>
 #include <nvif/driverif.h>
 #include <nvif/ioctl.h>
-
-#include <nvif/class.h>
-#include <nvif/if0000.h>
+#include <nvif/printf.h>
 
 int
 nvif_client_suspend(struct nvif_client *client)
@@ -45,12 +43,6 @@ nvif_client_resume(struct nvif_client *client)
 void
 nvif_client_dtor(struct nvif_client *client)
 {
-	if (!client->impl) {
-		nvif_object_dtor(&client->object);
-		client->driver = NULL;
-		return;
-	}
-
 	client->impl->del(client->priv);
 	client->impl = NULL;
 	client->object.client = NULL;
@@ -58,22 +50,18 @@ nvif_client_dtor(struct nvif_client *client)
 }
 
 int
-nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
-		 struct nvif_client *client)
+nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *client)
 {
-	struct nvif_client_v0 args = { .device = device };
 	int ret;
 
-	strscpy_pad(args.name, name, sizeof(args.name));
-	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
-			       name ? name : "nvifClient", 0,
-			       NVIF_CLASS_CLIENT, &args, sizeof(args),
-			       &client->object);
+	ret = parent->impl->client.new(parent->priv, &client->impl, &client->priv,
+				       nvif_handle(&client->object));
+	NVIF_ERRON(ret, &parent->object, "[NEW client]");
 	if (ret)
 		return ret;
 
-	client->object.client = client;
-	client->object.handle = ~0;
+	nvif_object_ctor(&parent->object, name ?: "nvifClient", 0, 0, &client->object);
+	client->object.priv = client->priv;
 	client->driver = parent->driver;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index fa8d0795805e..b57cc0d5a148 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -28,43 +28,25 @@
 #include <nvif/class.h>
 #include <nvif/driverif.h>
 #include <nvif/event.h>
-#include <nvif/if0000.h>
 #include <nvif/unpack.h>
 
 static int
-nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		 struct nvkm_object **pobject)
+nvkm_client_new_client(struct nvif_client_priv *parent,
+		       const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv,
+		       u64 handle)
 {
-	union {
-		struct nvif_client_v0 v0;
-	} *args = argv;
 	struct nvkm_client *client;
-	int ret = -ENOSYS;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))){
-		args->v0.name[sizeof(args->v0.name) - 1] = 0;
-		ret = nvkm_client_new(args->v0.name, oclass->client->device,
-				      oclass->client->event, &client);
-		if (ret)
-			return ret;
-	} else
+	int ret;
+
+	ret = nvkm_client_new("client", parent->device, parent->event, &client);
+	if (ret)
 		return ret;
 
-	client->object.client = oclass->client;
-	client->object.handle = oclass->handle;
-	client->object.object = oclass->object;
-	client->debug = oclass->client->debug;
-	*pobject = &client->object;
-	return 0;
-}
+	*pimpl = &nvkm_client_impl;
+	*ppriv = client;
 
-static const struct nvkm_sclass
-nvkm_uclient_sclass = {
-	.oclass = NVIF_CLASS_CLIENT,
-	.minver = 0,
-	.maxver = 0,
-	.ctor = nvkm_uclient_new,
-};
+	return nvkm_object_link_rb(parent, &parent->object, handle, &client->object);
+}
 
 static void
 nvkm_client_del(struct nvif_client_priv *client)
@@ -77,6 +59,7 @@ nvkm_client_del(struct nvif_client_priv *client)
 const struct nvif_client_impl
 nvkm_client_impl = {
 	.del = nvkm_client_del,
+	.client.new = nvkm_client_new_client,
 };
 
 static int
@@ -93,8 +76,7 @@ nvkm_client_child_get(struct nvkm_object *object, int index,
 	const struct nvkm_sclass *sclass;
 
 	switch (index) {
-	case 0: sclass = &nvkm_uclient_sclass; break;
-	case 1: sclass = &nvkm_udevice_sclass; break;
+	case 0: sclass = &nvkm_udevice_sclass; break;
 	default:
 		return -EINVAL;
 	}
@@ -120,7 +102,7 @@ int
 nvkm_client_new(const char *name, struct nvkm_device *device, int (*event)(u64, void *, u32),
 		struct nvif_client_priv **pclient)
 {
-	struct nvkm_oclass oclass = { .base = nvkm_uclient_sclass };
+	struct nvkm_oclass oclass = {};
 	struct nvkm_client *client;
 
 	if (!(client = *pclient = kzalloc(sizeof(*client), GFP_KERNEL)))
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 390c265cf8af..d34a8ee1a0ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -247,10 +247,15 @@ void
 nvkm_object_del(struct nvkm_object **pobject)
 {
 	struct nvkm_object *object = *pobject;
+
 	if (object && !WARN_ON(!object->func)) {
 		*pobject = nvkm_object_dtor(object);
 		nvkm_object_remove(object);
+
+		spin_lock_irq(&object->client->obj_lock);
 		list_del(&object->head);
+		spin_unlock_irq(&object->client->obj_lock);
+
 		kfree(*pobject);
 		*pobject = NULL;
 	}
@@ -298,3 +303,31 @@ nvkm_object_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		oclass->base.func ? oclass->base.func : &nvkm_object_func;
 	return nvkm_object_new_(func, oclass, data, size, pobject);
 }
+
+void
+nvkm_object_link_(struct nvif_client_priv *client, struct nvkm_object *parent,
+		  struct nvkm_object *object)
+{
+	object->client = client;
+
+	spin_lock_irq(&client->obj_lock);
+	list_add_tail(&object->head, &parent->tree);
+	spin_unlock_irq(&client->obj_lock);
+}
+
+int
+nvkm_object_link_rb(struct nvif_client_priv *client, struct nvkm_object *parent, u64 handle,
+		    struct nvkm_object *object)
+{
+	nvkm_object_link_(client, parent, object);
+
+	object->object = handle;
+
+	if (!nvkm_object_insert(object)) {
+		nvkm_object_fini(object, false);
+		nvkm_object_del(&object);
+		return -EEXIST;
+	}
+
+	return 0;
+}
-- 
2.41.0

