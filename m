Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462928A78CA
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F1B112F41;
	Tue, 16 Apr 2024 23:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R/2lbJ+l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BC6112F3C
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx38l3UhhqAU/tIC3daCAEU5UJ1hfwhTA4pu5AzXD/Lq+93zTNWPJynTcC2pAdYQDQLIXwsYRq9sMq5jdVyqFiAjaqzTJuuVup0ao3bvATpEIO+XkGoWYjzulK9YegZv4K05xsUdf6McmqRikfq4CRIjKgNPS+alw55MKv84pd4USclthjultlmbupBdjSV+eYTf/sslK5lzfx0gFSxmQDxyyCSbZNkdJn9Ue++VdrdaZhLZ9RmE5sibXzyNooVTpY7zb4Q3WZAvTPQCwl/YnpRTbFNm//MaCG3Ymh+kz3BvSb25mhAG15aQmaZGD2D/gaXajKZrpgKDbpD5M4KFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjRDLzg4KGP26/OjUx4m2BMpsdO13QQOEkOBu0zN3d4=;
 b=YDu6lz2FychHfuW1R6bhOmB1sm/zof0LI0y74zwjH8D6yoHCzfY0vsk8cdcwRKXGFpba0+yzd3vPkWGOY/NSNXdGoPhrjLnqFFJl8TKH5dMunZPTm3X/BzzL4SXofUx4T0PFWhoEy7fNJSWcpivEzE1ol5pFyTUpjsRdLKBHtB02LthsXJDrxgineEuGpqwYXag5xhsKYRq4nVw714FNqQs3D/VyZOxqAyclQrzPGb4ir8u7X6onbfBsHh5B2RJNod0xcg0A//uV1AGvW4H8rRxM43V+TzGHRxRLsAmB3F7z8ILbevAb0RMkZUR4H11s9kSgwgb7lESW2KjfvG53Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjRDLzg4KGP26/OjUx4m2BMpsdO13QQOEkOBu0zN3d4=;
 b=R/2lbJ+lc4rBsRKsfjw2rm6h1QYlptaC5OLU785xKs/2T3oFnoLL3rlw8k+IZAdK5ebBXBqdCrhOgHivLHZL/06qSsvGPSRT4ZWKkfaf5Wdfv7Aqma2hADWv9Fl8pQyFTA5Cw1vEpfOIqHWNaVdNyQWSTahb24ctNiMfOsGb/0Yj+JjHlJbueakmK0A+3ksOGIIO4tKXv+0xR26okoFUQqro8qt6Hk8XpVxSE2VYD4fLcOTcyA0gJ4qh6QlU8zUOB9eFmmQ28+QmkS6dL0L16S8BMYH5FkiYLQhUQamxMDQKZnrCelK63fbmHMjP9MFeVf6DL16NmXbBhL7Z5XsvOw==
Received: from DM6PR02CA0039.namprd02.prod.outlook.com (2603:10b6:5:177::16)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:21 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::f9) by DM6PR02CA0039.outlook.office365.com
 (2603:10b6:5:177::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:11 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 035/156] drm/nouveau/nvif: remove device args
Date: Wed, 17 Apr 2024 09:38:01 +1000
Message-ID: <20240416234002.19509-36-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: a94b09d7-127f-4f59-79fe-08dc5e6eb88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VizoYdzlx0ojS7bQRgHoTf8VcrrHIZB0OUO8uaSid+bE0XMz9qTopDWCS716dtSCR3A8Kfzt3ppSRkC+0xlrVx+zrkeh83j5a4TPEgw7glHCfR8pV/QrNkH5Jd8Kl86WAxdbn/dAR0wncfTTL4MkOG+LER8cLiODTL37tjyBYD2cJkCDj7oNPsWiPYRYPxvBZbdfGXI566XlP4eKLXCnW1BDlDF3moQu+MsbgYYAEcIXv6XlbgBRiI6zTeDrysl+WqgZzVGBp/FBspw/kR75rknZjTVykn3xdMU4Np6U5Q5Cxv58WnM1siHoCKwq8C+P12Zk0RZkDc3ZIO3Ek1BiipDgFr72XYsfmyysGH9eXtVEBzhLNmRj0CSS7g3L8ZfN37DO+HuVroiRd/bK7uapnDJatDIJVl8NDp+s5U+MJUCb7dqdvL1s1A+1EolJf0yAfunHL+YQ7KsOQ32BIXsdwONkNEymKqujRsJn+D3aXmP4G1eq5G0sUMLujN7bA3TulhIDkCuOnlaxyY9l6RO84bEZWwNBsc9fYWrhN+GanlvMfXmbquLHHvGWxNdui5GGb7HLMeyBDyEOD92ezByBaZC6ZisSVXTykTc5PUf4qUAtvgW5ZeeUPGqcOzEzakN4myJY1dHckidnOzhKzRyyhLPOyAplSFyh2vA1xNYgnV87uEsGDBwygjCxJluaiB/NA08s9Y2IAtfGIv1OE2KlMM0dqHKcpolx6oUdB42lntOkGOGzAdPn4blYtHkdqqUK
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:21.3898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94b09d7-127f-4f59-79fe-08dc5e6eb88d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272
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

- now unused
- pass nvif_client as parent, rather than nvif_client.object

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  7 ----
 drivers/gpu/drm/nouveau/include/nvif/device.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 14 ++------
 drivers/gpu/drm/nouveau/nvif/device.c         |  9 +++--
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 36 ++-----------------
 5 files changed, 10 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index fa161b74d967..ea937fa7bc55 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -2,13 +2,6 @@
 #ifndef __NVIF_CL0080_H__
 #define __NVIF_CL0080_H__
 
-struct nv_device_v0 {
-	__u8  version;
-	__u8  priv;
-	__u8  pad02[6];
-	__u64 device;	/* device identifier, ~0 for client default */
-};
-
 #define NV_DEVICE_V0_INFO                                                  0x00
 #define NV_DEVICE_V0_TIME                                                  0x01
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index 64b8e4defc35..fec76f4733a4 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -18,8 +18,7 @@ struct nvif_device {
 	struct nvif_user user;
 };
 
-int  nvif_device_ctor(struct nvif_object *, const char *name, u32 handle,
-		      s32 oclass, void *, u32, struct nvif_device *);
+int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device *);
 void nvif_device_dtor(struct nvif_device *);
 int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ad2772cf5e23..9caadcdb3c29 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -253,12 +253,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
-	ret = nvif_device_ctor(&cli->base.object, "drmDevice", 0, NV_DEVICE,
-			       &(struct nv_device_v0) {
-					.device = ~0,
-					.priv = true,
-			       }, sizeof(struct nv_device_v0),
-			       &cli->device);
+	ret = nvif_device_ctor(&cli->base, "drmDevice", &cli->device);
 	if (ret) {
 		NV_PRINTK(err, cli, "Device allocation failed: %d\n", ret);
 		goto done;
@@ -590,12 +585,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	if (ret)
 		goto fail_alloc;
 
-	ret = nvif_device_ctor(&drm->_client.object, "drmDevice", 0, NV_DEVICE,
-			       &(struct nv_device_v0) {
-					.device = ~0,
-					.priv = true,
-			       }, sizeof(struct nv_device_v0),
-			       &drm->device);
+	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
 		goto fail_nvif;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 2fef6553a013..24880931039f 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -21,8 +21,8 @@
  *
  * Authors: Ben Skeggs <bskeggs@redhat.com>
  */
-
 #include <nvif/device.h>
+#include <nvif/client.h>
 
 u64
 nvif_device_time(struct nvif_device *device)
@@ -54,11 +54,10 @@ nvif_device_dtor(struct nvif_device *device)
 }
 
 int
-nvif_device_ctor(struct nvif_object *parent, const char *name, u32 handle,
-		 s32 oclass, void *data, u32 size, struct nvif_device *device)
+nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_device *device)
 {
-	int ret = nvif_object_ctor(parent, name ? name : "nvifDevice", handle,
-				   oclass, data, size, &device->object);
+	int ret = nvif_object_ctor(&client->object, name ? name : "nvifDevice", 0,
+				   0x0080, NULL, 0, &device->object);
 	device->runlist = NULL;
 	device->user.func = NULL;
 	if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index d937c54e8dfa..65bd6712bce2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -357,7 +357,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 }
 
 static const struct nvkm_object_func
-nvkm_udevice_super = {
+nvkm_udevice = {
 	.init = nvkm_udevice_init,
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
@@ -371,50 +371,20 @@ nvkm_udevice_super = {
 	.sclass = nvkm_udevice_child_get,
 };
 
-static const struct nvkm_object_func
-nvkm_udevice = {
-	.init = nvkm_udevice_init,
-	.fini = nvkm_udevice_fini,
-	.mthd = nvkm_udevice_mthd,
-	.sclass = nvkm_udevice_child_get,
-};
-
 static int
 nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		 struct nvkm_object **pobject)
 {
-	union {
-		struct nv_device_v0 v0;
-	} *args = data;
 	struct nvkm_client *client = oclass->client;
-	struct nvkm_object *parent = &client->object;
-	const struct nvkm_object_func *func;
 	struct nvkm_udevice *udev;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(parent, "create device size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent, "create device v%d device %016llx\n",
-			   args->v0.version, args->v0.device);
-	} else
-		return ret;
-
-	/* give priviledged clients register access */
-	if (args->v0.priv)
-		func = &nvkm_udevice_super;
-	else
-		func = &nvkm_udevice;
 
 	if (!(udev = kzalloc(sizeof(*udev), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_object_ctor(func, oclass, &udev->object);
+	nvkm_object_ctor(&nvkm_udevice, oclass, &udev->object);
 	*pobject = &udev->object;
 
 	/* find the device that matches what the client requested */
-	if (args->v0.device != ~0)
-		udev->device = nvkm_device_find(args->v0.device);
-	else
-		udev->device = nvkm_device_find(client->device);
+	udev->device = nvkm_device_find(client->device);
 	if (!udev->device)
 		return -ENODEV;
 
-- 
2.41.0

