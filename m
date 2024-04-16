Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17508A78F0
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7B1112F33;
	Tue, 16 Apr 2024 23:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q1ja8o9T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA6E112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKRExUU3Acd8G+jxnVMpCwohORpAMIRntaB3fo2KP0sKl/bnbYcMpXgZ5AFC6X6J+T9P+ieVnnAI8rfxdb8woyXCWzAF7G8c+KuKMgFF/8D60jV+k7MvgbyzpsPMHMwy91RFPuXyeyAu0R0iod8Ii6f3Qkdo0xsCgEwr0Vg/LjnL39HcfesBEt0eeKEMgOsd0XrE2NmGO0DBtn107FmPl6wYqFAqK83pCWO3nQVporucG4k5AGWnLlrDxIujC5GSx/GlVlJnilfgT7ZdaqMryi9jAre5nh92ZrJNE4wQzX9ZiZ39KEr0bJ+M97X/jvL5QZ9c3fj7rgjfvyAsy3ioDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGpU44rIB9Xd8bK8Kys9Ni5Hxxjxyxs13KT1XvCnUAY=;
 b=dU+jluVzT+c801O24uJfNMCRnSL6n5afwG744ePMtu/TAtT61jAFe0tw4arM66HxiyS7rB0VoS11guB3yuiXMZNKEGw7b0kdZUjppN9TMILUapWDDRc6btLemuEeNtodzDpBX/NTw107sEjOZbLGJpbJ7pTVT0eUEgI5AOGO3WP92hQsLZN7xd3W2eP1sjhR9Q7T+95nk6xxAV8G8dhCXwAkqQIJEK693OyWRkSMZHavaIvXvwNszJIMVXr52QP5XlzilZsmMoq1IvjfN+J5BBXJHhSM/mQ/3+gOBPqR5gyouRvuVTBaaauCrUpTHwZQ2xAWnEf8fzssrFVeznH9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGpU44rIB9Xd8bK8Kys9Ni5Hxxjxyxs13KT1XvCnUAY=;
 b=Q1ja8o9TCUHoHnM3yIcqVj/MtaC7Nkkafr6/YDW57NK47lFxTsqGHzdABN35k04w4144h+48PESToxRi+umGwLCL3NaYaS9xZOWSwPIfcAeLiLSk79+XnL2oaonO3I97ujWKk+OqUHMXu7cx/ZxxJ6UOSNLnug85HZPHNMpTSuw1TNnX6j6fVdxfQM5DCckt3vKCNG4IRL8Lg6mo0GdcpQUyHhxMcvFnU/prd5GuFo7SEKAEnmCsLGp9cZh8SURymvURp8FALN8mYf/Fm8SOUOAZXc2/sHwBRvmDo5C5XugcazNRpG2+4en0Qs44J8Uc/XVrfMPOLPUk+gNEMXwxtg==
Received: from DM6PR12CA0021.namprd12.prod.outlook.com (2603:10b6:5:1c0::34)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:06 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::d3) by DM6PR12CA0021.outlook.office365.com
 (2603:10b6:5:1c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:46 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 066/156] drm/nouveau/nvif: rework device "map" api
Date: Wed, 17 Apr 2024 09:38:32 +1000
Message-ID: <20240416234002.19509-67-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c5b071-b349-44f2-99cd-08dc5e6ed36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: As0C8LHhEUow/lOV/S2I8aJMXvjDe0t6kfpIsGLZD93D7HsJoOVteoO2VcctTSx8Ciu5vdUkQdF+g+ErBlQcLO7XhAeSFRH6A8b2VstJMp/ifP6ojCFFifAq9QfXzcaLzVUaWej2xZOjBLONKbB6O81zGwFREE/sbdGQXl1wOGN9qn0jxFsJTDDqdLuGtvjMv1ok3EpoNe2V8054rJG0z0rNNPBvPX049nI0zThgfUpxILlBundphI7F/JVOL4sPVp5gRe6ewDEJm3CW16JE4RcnCTlc/9+c2GlFlitE+tvjv82l8z8ws28L6QOs3CqiN72x/Bi1bH//GmlhvpdzI1hPOfKbI+gWMtHZeJSnIDw3CB9QWo4H/3VshGaPG8EpTBkkpe+1jAD7zvIfqyjzxO1w/jk2As/kx6kWlCmYwzq2FT0FhUcXxZuWR1Y82OBnRr96DxONcHUYdsSSeJEZT1r2gcPWyOZyZcw5eqFFGy7c2W7IGqc8rUD8bzZT9hU9Q1jPBXyFMliq77wbW/IFs1Pv33M2J0JK3wXNR9XAwZsmrC5T3v/8vS/j9S5SvBz4+Xu+xctC5LxxhP7B3a/IALhn/INdStx7qem8GYg2Bw+bMEcVarwaJYUTEIDZiBhjSJ0MvgSkLsc2QFMgKsUpku3xqkfrmMY+67nkBpFBU+AipCLHX3kEND4KsUUR8x4E5Q00+9vr8aQy+lpALsHkcMvkzCqu0nm/fEYhCfgMYkZgIGzHNj87r++Mta5YNptp
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:06.4663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c5b071-b349-44f2-99cd-08dc5e6ed36b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
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
 drivers/gpu/drm/nouveau/include/nvif/device.h |  2 +
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 11 +++++
 drivers/gpu/drm/nouveau/include/nvif/object.h |  8 ++++
 drivers/gpu/drm/nouveau/nvif/device.c         |  5 +-
 drivers/gpu/drm/nouveau/nvif/object.c         | 46 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 16 ++-----
 6 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index c0f8920f0e08..27526d5811cf 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -10,6 +10,8 @@ struct nvif_device {
 	const struct nvif_device_impl *impl;
 	struct nvif_device_priv *priv;
 	struct nvif_object object;
+	struct nvif_map map;
+
 	struct nv_device_info_v0 info;
 
 	struct nvif_fifo_runlist {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 9ac4857714c7..03c4803f6492 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -13,9 +13,20 @@ struct nvif_driver {
 	void (*unmap)(struct nvif_client_priv *, void __iomem *ptr, u32 size);
 };
 
+struct nvif_mapinfo {
+	enum nvif_map_type {
+		NVIF_MAP_IO,
+		NVIF_MAP_VA,
+	} type;
+	u64 handle;
+	u64 length;
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
+	struct nvif_mapinfo map;
+
 	struct {
 		s32 oclass;
 	} usermode;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index a84cdb423471..b3e66425f310 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -22,6 +22,12 @@ struct nvif_object {
 	} map;
 };
 
+struct nvif_map {
+	const struct nvif_mapinfo *impl;
+	struct nvif_object *object;
+	void __iomem *ptr;
+};
+
 static inline bool
 nvif_object_constructed(struct nvif_object *object)
 {
@@ -43,6 +49,8 @@ int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
 int  nvif_object_sclass_get(struct nvif_object *, struct nvif_sclass **);
 void nvif_object_sclass_put(struct nvif_sclass **);
 int  nvif_object_mthd(struct nvif_object *, u32, void *, u32);
+int nvif_object_map_cpu(struct nvif_object *, const struct nvif_mapinfo *, struct nvif_map *);
+int nvif_object_unmap_cpu(struct nvif_map *);
 int  nvif_object_map_handle(struct nvif_object *, void *, u32,
 			    u64 *handle, u64 *length);
 void nvif_object_unmap_handle(struct nvif_object *);
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index bb95e80f1c81..a0bc047ae28d 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -42,7 +42,7 @@ nvif_device_time(struct nvif_device *device)
 int
 nvif_device_map(struct nvif_device *device)
 {
-	return nvif_object_map(&device->object, NULL, 0);
+	return nvif_object_map_cpu(&device->object, &device->impl->map, &device->map);
 }
 
 void
@@ -52,9 +52,12 @@ nvif_device_dtor(struct nvif_device *device)
 		return;
 
 	nvif_user_dtor(device);
+
 	kfree(device->runlist);
 	device->runlist = NULL;
 
+	nvif_object_unmap_cpu(&device->map);
+
 	device->impl->del(device->priv);
 	device->impl = NULL;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index f172f632979b..d0f4ddca085e 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -178,6 +178,52 @@ nvif_object_unmap(struct nvif_object *object)
 	}
 }
 
+int
+nvif_object_unmap_cpu(struct nvif_map *map)
+{
+	struct nvif_client *client;
+
+	if (!map->ptr || map->impl->type == NVIF_MAP_VA)
+		return 0;
+	if (map->impl->type != NVIF_MAP_IO)
+		return -EINVAL;
+
+	client = map->object->client;
+	client->driver->unmap(client->priv, map->ptr, map->impl->length);
+	map->ptr = NULL;
+	return 0;
+}
+
+int
+nvif_object_map_cpu(struct nvif_object *object,
+		    const struct nvif_mapinfo *impl, struct nvif_map *map)
+{
+	struct nvif_client *client = object->client;
+	void *ptr = NULL;
+
+	switch (impl->type) {
+	case NVIF_MAP_IO:
+		ptr = client->driver->map(client->priv, impl->handle, impl->length);
+		break;
+	case NVIF_MAP_VA:
+		ptr = (void **)(unsigned long)impl->handle;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	if (!ptr)
+		return -EFAULT;
+
+	map->object = object;
+	map->impl = impl;
+	map->ptr = ptr;
+
+	object->map.ptr = map->ptr; /*FIXME: needed by nvif_rd/wr */
+	return 0;
+}
+
 int
 nvif_object_map(struct nvif_object *object, void *argv, u32 argc)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index f55088849a0c..229245b03719 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -222,18 +222,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static int
-nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
-		 enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
-	struct nvkm_device *device = udev->device;
-	*type = NVKM_OBJECT_MAP_IO;
-	*addr = device->func->resource_addr(device, 0);
-	*size = device->func->resource_size(device, 0);
-	return 0;
-}
-
 static int
 nvkm_udevice_fini(struct nvkm_object *object, bool suspend)
 {
@@ -333,7 +321,6 @@ nvkm_udevice = {
 	.init = nvkm_udevice_init,
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
-	.map = nvkm_udevice_map,
 	.sclass = nvkm_udevice_child_get,
 };
 
@@ -356,6 +343,9 @@ nvkm_udevice_new(struct nvkm_device *device,
 		goto done;
 
 	udev->impl = nvkm_udevice_impl;
+	udev->impl.map.type = NVIF_MAP_IO;
+	udev->impl.map.handle = device->func->resource_addr(device, 0);
+	udev->impl.map.length = device->func->resource_size(device, 0);
 
 	if (device->vfn) {
 		udev->impl.usermode.oclass = device->vfn->user.base.oclass;
-- 
2.41.0

