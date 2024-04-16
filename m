Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F28A78B6
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DA5112F23;
	Tue, 16 Apr 2024 23:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FrMnyvfF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F742112F23
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLpiHPUcW2KTTFFNBHWU4RYUNiYPDL7bVGfVx2r3vSCFBNB2gWNwPJ2lW5Ki1ZI+uFoYtb//zPIIy0lLY3EAFd97qxT29ONPtddVHo8nbIFydYrQu/23hymXPAuDIa5R3PAX4z/L+XXiuk4LwtDr+NKkNhHa6J1dOy52eFUNhIvCuT3nwcYm3FlR355qMciuKu5OkHWRS4kyQpjSTeeT6cG5tae3PHG0YSCw7dtz5bNNDEZTlQikjc8btxUC1SB5zTOvqB+BI6D2P8ZqczsvAvCaSw/zR5QQXg+0OAvQ3pazt9VxqS7YcvvY/ZPeeu6bY4UIR49IHA4I0lR7HJT7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO8frZkQhnTh70/FSgFR9YRj9Jaeyz3kaxHuqFjHlc4=;
 b=AtxxF+zUH0q5KFDnyILEYaxwFw/j6C0ylfV/cVO5zvpZk3amk5fMXujGR5EXaoWnNTP5WF5JZ6Gmm2m/Jk3NmR/mXjioIAcAnC0BxdL2A+i2InXw3J2+TRzQRp1Rl0g8yAjr0mN19nKyFb0Yco+aok4HhTNzaIHUJIplt1Gy71PdGrvuxLBx//lBnq6O4UE61jTmQA1O7cMKlgKmIQPrkQQBOUzWoJNEFLZ43rg4gERGoitXK0RcfGIfXN51Y29yD0FLqYxwJccXFxKWzaOvKjFkUXBlfMTjJmEJAxRvtRSXNgV9z1GpMRPbnvlX5E3KJZBfEvZVa8Dtob32tZjn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO8frZkQhnTh70/FSgFR9YRj9Jaeyz3kaxHuqFjHlc4=;
 b=FrMnyvfFWNILCIsHksd7u7QUuEGau5cF6ZGDEaFJsg9oQgD931tedpWz9GCZAzY8mdb2ZCfZISfI2UYdiTsRhVuNi4O8TkdPtl86DHJCsqRqqdrqdEJHh+PYFrarhk+3s5QDU3/VTvwG2PuaP5XWfovzYZ4SMyKXwk+IO7htQqBNa3scTDi3XnBZmtbnzgnQF/SPiwId/74l9bY7pNUOQrs2UF+Y5i5MtmGrCf3P7zpjf7QdWFk8rYJnP+mpd88xOrLFGIgt6Zi1KJ1sgFE2Til2VYIUQRP3U41REQRtjoHjcz7iGX3VlnZ8C7Vc/+sVDcT+sKeW/ml6u98nNJBpZg==
Received: from MN2PR16CA0052.namprd16.prod.outlook.com (2603:10b6:208:234::21)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:04 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::ad) by MN2PR16CA0052.outlook.office365.com
 (2603:10b6:208:234::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:44 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 012/156] drm/nouveau: handle limited nvif in abi16
Date: Wed, 17 Apr 2024 09:37:38 +1000
Message-ID: <20240416234002.19509-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: d76023cf-3602-4f63-9d9a-08dc5e6eae29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d5ReFBWpn0k1h7vsdOEbhoSamqP0JWVVjrqUxqho0ad6LVkF8GEGvjjm/FzmeifK14toee2uVKtzecU+ALwre1t09cYMcA1oGr7dD0AQxlhB/WwOw1q0MVlCB23f81BLyIzX333cCHdkOVO9+m8s3KAAAfm9yrdAnQ8XGM0BLX385rkgwmoNzfPnwczW6LxKe+vz4wShsBoqhBMBy9cFm2KVCrUNVq8fsfa2AqCEFt3SCjdtiYa+qZ2e9jLROaXBgl1LsCWc01BHluTSXEQ4jhZB2M9Z2UHveROQu9wKqx7YYdD59TOmxOD/Kb5HDZfyU6HdXvSnx+DflYTsnv/U+vPOCfesGcmzeLEJyROZiBqwElvr39Bj+h6TD49Bdzc1mxILi/GnUIcjPuGR+1zHKHmh/x0EJ28IEYQb3/raBoPCLxJKiwTO5BfJJ6eLyaSgf/3dEgi6NuqXJnQ0xwcG+rv8lErhDeDpbOAcbuK5kiNNGnH7xGG4TQTISrRJaIsn8R1pWdLwP7pid4ePw9jaGnXiem85XSJqlSY6ozTWZfG4mwqHqsdVlrOhClHYrY379HqwCFN5sEqGnYi2bFHKJd9JYuCKYMe5Y/gulLZwg8VDhiH1O1KmHhokZMzLk8+sIhDqjX0R3oOZ6HBHOSFg3UCsn+7RNe7zRv/5ENtLkYwUIeAzJv374t64Dqpzrf1L3rrXN+trQuyfRQFoUxhwOvcwlFYml7GhQm0byZeSsebhnU1IVxjXZCJ43KzgWprr
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:03.8800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76023cf-3602-4f63-9d9a-08dc5e6eae29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

nouveau_usif.c was mostly been stripped right back already a couple of
years ago, but now the NVKM side of these interfaces are being removed.

Fortunately, userspace only ever ended up using a fraction of the APIs,
so I've reimplemented those in a more direct manner, and return -EINVAL
to userspace for everything else.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild          |   1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 277 ++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h |   3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   5 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c  |   1 -
 drivers/gpu/drm/nouveau/nouveau_usif.c  | 194 -----------------
 drivers/gpu/drm/nouveau/nouveau_usif.h  |  10 -
 7 files changed, 242 insertions(+), 249 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index cf6b3a80c0c8..c3223ec97aff 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -27,7 +27,6 @@ nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
 nouveau-y += nouveau_nvif.o
 nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
-nouveau-y += nouveau_usif.o # userspace <-> nvif
 nouveau-y += nouveau_vga.o
 
 # DRM - memory management
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 440d92d93acd..5341d96ffc85 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -52,6 +52,7 @@ nouveau_abi16(struct drm_file *file_priv)
 
 			abi16->cli = cli;
 			INIT_LIST_HEAD(&abi16->channels);
+			INIT_LIST_HEAD(&abi16->objects);
 
 			/* allocate device object targeting client's default
 			 * device (ie. the one that belongs to the fd it
@@ -88,6 +89,61 @@ nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
 	return ret;
 }
 
+struct nouveau_abi16_obj {
+	enum nouveau_abi16_obj_type {
+		DEVICE,
+		ENGOBJ,
+	} type;
+	u64 object;
+
+	union {
+		struct {
+			struct nvif_object object;
+		} engobj;
+	};
+
+	struct list_head head;
+};
+
+static struct nouveau_abi16_obj *
+nouveau_abi16_obj_find(struct nouveau_abi16 *abi16, u64 object)
+{
+	struct nouveau_abi16_obj *obj;
+
+	list_for_each_entry(obj, &abi16->objects, head) {
+		if (obj->object == object)
+			return obj;
+	}
+
+	return NULL;
+}
+
+static void
+nouveau_abi16_obj_del(struct nouveau_abi16_obj *obj)
+{
+	list_del(&obj->head);
+	kfree(obj);
+}
+
+static struct nouveau_abi16_obj *
+nouveau_abi16_obj_new(struct nouveau_abi16 *abi16, enum nouveau_abi16_obj_type type, u64 object)
+{
+	struct nouveau_abi16_obj *obj;
+
+	obj = nouveau_abi16_obj_find(abi16, object);
+	if (obj)
+		return ERR_PTR(-EEXIST);
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->type = type;
+	obj->object = object;
+	list_add_tail(&obj->head, &abi16->objects);
+	return obj;
+}
+
 s32
 nouveau_abi16_swclass(struct nouveau_drm *drm)
 {
@@ -167,6 +223,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 {
 	struct nouveau_cli *cli = abi16->cli;
 	struct nouveau_abi16_chan *chan, *temp;
+	struct nouveau_abi16_obj *obj, *tmp;
+
+	/* cleanup objects */
+	list_for_each_entry_safe(obj, tmp, &abi16->objects, head) {
+		nouveau_abi16_obj_del(obj);
+	}
 
 	/* cleanup channels */
 	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
@@ -455,44 +517,6 @@ nouveau_abi16_chan(struct nouveau_abi16 *abi16, int channel)
 	return NULL;
 }
 
-int
-nouveau_abi16_usif(struct drm_file *file_priv, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_v0 v0;
-	} *args = data;
-	struct nouveau_abi16_chan *chan;
-	struct nouveau_abi16 *abi16;
-	int ret = -ENOSYS;
-
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		switch (args->v0.type) {
-		case NVIF_IOCTL_V0_NEW:
-		case NVIF_IOCTL_V0_MTHD:
-		case NVIF_IOCTL_V0_SCLASS:
-			break;
-		default:
-			return -EACCES;
-		}
-	} else
-		return ret;
-
-	if (!(abi16 = nouveau_abi16(file_priv)))
-		return -ENOMEM;
-
-	if (args->v0.token != ~0ULL) {
-		if (!(chan = nouveau_abi16_chan(abi16, args->v0.token)))
-			return -EINVAL;
-		args->v0.object = nvif_handle(&chan->chan->user);
-		args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
-		return 0;
-	}
-
-	args->v0.object = nvif_handle(&abi16->device.object);
-	args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
-	return 0;
-}
-
 int
 nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS)
 {
@@ -702,3 +726,180 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
 
 	return nouveau_abi16_put(abi16, ret);
 }
+
+static int
+nouveau_abi16_ioctl_mthd(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
+{
+	struct nouveau_cli *cli = abi16->cli;
+	struct nvif_ioctl_mthd_v0 *args;
+	struct nouveau_abi16_obj *obj;
+	struct nv_device_info_v0 *info;
+
+	if (ioctl->route || argc < sizeof(*args))
+		return -EINVAL;
+	args = (void *)ioctl->data;
+	argc -= sizeof(*args);
+
+	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
+	if (!obj || obj->type != DEVICE)
+		return -EINVAL;
+
+	if (args->method != NV_DEVICE_V0_INFO ||
+	    argc != sizeof(*info))
+		return -EINVAL;
+
+	info = (void *)args->data;
+	if (info->version != 0x00)
+		return -EINVAL;
+
+	info = &cli->drm->device.info;
+	memcpy(args->data, info, sizeof(*info));
+	return 0;
+}
+
+static int
+nouveau_abi16_ioctl_del(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
+{
+	struct nouveau_abi16_obj *obj;
+
+	if (ioctl->route || argc)
+		return -EINVAL;
+
+	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
+	if (obj)
+		nouveau_abi16_obj_del(obj);
+
+	return 0;
+}
+
+static int
+nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
+{
+	struct nvif_ioctl_new_v0 *args;
+	struct nouveau_abi16_chan *chan;
+	struct nouveau_abi16_obj *obj;
+	int ret;
+
+	if (argc < sizeof(*args))
+		return -EINVAL;
+	args = (void *)ioctl->data;
+	argc -= sizeof(*args);
+
+	if (args->version != 0)
+		return -EINVAL;
+
+	if (!ioctl->route) {
+		if (ioctl->object || args->oclass != NV_DEVICE)
+			return -EINVAL;
+
+		obj = nouveau_abi16_obj_new(abi16, DEVICE, args->object);
+		if (IS_ERR(obj))
+			return PTR_ERR(obj);
+
+		return 0;
+	}
+
+	chan = nouveau_abi16_chan(abi16, ioctl->token);
+	if (!chan)
+		return -EINVAL;
+
+	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
+			       NULL, 0, &obj->engobj.object);
+	if (ret)
+		nouveau_abi16_obj_del(obj);
+
+	return ret;
+}
+
+static int
+nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
+{
+	struct nvif_ioctl_sclass_v0 *args;
+	struct nouveau_abi16_chan *chan;
+	struct nvif_sclass *sclass;
+	int ret;
+
+	if (!ioctl->route || argc < sizeof(*args))
+		return -EINVAL;
+	args = (void *)ioctl->data;
+	argc -= sizeof(*args);
+
+	if (argc != args->count * sizeof(args->oclass[0]))
+		return -EINVAL;
+
+	chan = nouveau_abi16_chan(abi16, ioctl->token);
+	if (!chan)
+		return -EINVAL;
+
+	ret = nvif_object_sclass_get(&chan->chan->user, &sclass);
+	if (ret < 0)
+		return ret;
+
+	for (int i = 0; i < min_t(u8, args->count, ret); i++) {
+		args->oclass[i].oclass = sclass[i].oclass;
+		args->oclass[i].minver = sclass[i].minver;
+		args->oclass[i].maxver = sclass[i].maxver;
+	}
+	args->count = ret;
+
+	nvif_object_sclass_put(&sclass);
+	return 0;
+}
+
+int
+nouveau_abi16_ioctl(struct drm_file *filp, void __user *user, u32 size)
+{
+	struct nvif_ioctl_v0 *ioctl;
+	struct nouveau_abi16 *abi16;
+	u32 argc = size;
+	int ret;
+
+	if (argc < sizeof(*ioctl))
+		return -EINVAL;
+	argc -= sizeof(*ioctl);
+
+	ioctl = kmalloc(size, GFP_KERNEL);
+	if (!ioctl)
+		return -ENOMEM;
+
+	ret = -EFAULT;
+	if (copy_from_user(ioctl, user, size))
+		goto done_free;
+
+	if (ioctl->version != 0x00 ||
+	    (ioctl->route && ioctl->route != 0xff)) {
+		ret = -EINVAL;
+		goto done_free;
+	}
+
+	abi16 = nouveau_abi16_get(filp);
+	if (unlikely(!abi16)) {
+		ret = -ENOMEM;
+		goto done_free;
+	}
+
+	switch (ioctl->type) {
+	case NVIF_IOCTL_V0_SCLASS: ret = nouveau_abi16_ioctl_sclass(abi16, ioctl, argc); break;
+	case NVIF_IOCTL_V0_NEW   : ret = nouveau_abi16_ioctl_new   (abi16, ioctl, argc); break;
+	case NVIF_IOCTL_V0_DEL   : ret = nouveau_abi16_ioctl_del   (abi16, ioctl, argc); break;
+	case NVIF_IOCTL_V0_MTHD  : ret = nouveau_abi16_ioctl_mthd  (abi16, ioctl, argc); break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	nouveau_abi16_put(abi16, 0);
+
+	if (ret == 0) {
+		if (copy_to_user(user, ioctl, size))
+			ret = -EFAULT;
+	}
+
+done_free:
+	kfree(ioctl);
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 0a9121e63143..75a883a44e04 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -34,13 +34,14 @@ struct nouveau_abi16 {
 	struct nvif_device device;
 	struct list_head channels;
 	u64 handles;
+	struct list_head objects;
 };
 
 struct nouveau_abi16 *nouveau_abi16_get(struct drm_file *);
 int  nouveau_abi16_put(struct nouveau_abi16 *, int);
 void nouveau_abi16_fini(struct nouveau_abi16 *);
 s32  nouveau_abi16_swclass(struct nouveau_drm *);
-int  nouveau_abi16_usif(struct drm_file *, void *data, u32 size);
+int nouveau_abi16_ioctl(struct drm_file *, void __user *user, u32 size);
 
 #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 68564c648eda..c0d74be4c47b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -63,7 +63,6 @@
 #include "nouveau_abi16.h"
 #include "nouveau_fence.h"
 #include "nouveau_debugfs.h"
-#include "nouveau_usif.h"
 #include "nouveau_connector.h"
 #include "nouveau_platform.h"
 #include "nouveau_svm.h"
@@ -200,7 +199,6 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	flush_work(&cli->work);
 	WARN_ON(!list_empty(&cli->worker));
 
-	usif_client_fini(cli);
 	if (cli->sched)
 		nouveau_sched_destroy(&cli->sched);
 	if (uvmm)
@@ -241,7 +239,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
 	cli->drm = drm;
 	mutex_init(&cli->mutex);
-	usif_client_init(cli);
 
 	INIT_WORK(&cli->work, nouveau_cli_work);
 	INIT_LIST_HEAD(&cli->worker);
@@ -1278,7 +1275,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
 	case DRM_NOUVEAU_NVIF:
-		ret = usif_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
+		ret = nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
 		break;
 	default:
 		ret = drm_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nouveau_nvif.c
index 1d49ebdfd5dc..9a7e3f64b79f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
@@ -35,7 +35,6 @@
 #include <nvif/ioctl.h>
 
 #include "nouveau_drv.h"
-#include "nouveau_usif.h"
 
 static void
 nvkm_client_unmap(void *priv, void __iomem *ptr, u32 size)
diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c b/drivers/gpu/drm/nouveau/nouveau_usif.c
deleted file mode 100644
index 002d1479ba89..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_usif.c
+++ /dev/null
@@ -1,194 +0,0 @@
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
-
-#include "nouveau_drv.h"
-#include "nouveau_usif.h"
-#include "nouveau_abi16.h"
-
-#include <nvif/unpack.h>
-#include <nvif/client.h>
-#include <nvif/ioctl.h>
-
-#include <nvif/class.h>
-#include <nvif/cl0080.h>
-
-struct usif_object {
-	struct list_head head;
-	u8  route;
-	u64 token;
-};
-
-static void
-usif_object_dtor(struct usif_object *object)
-{
-	list_del(&object->head);
-	kfree(object);
-}
-
-static int
-usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc, bool parent_abi16)
-{
-	struct nouveau_cli *cli = nouveau_cli(f);
-	struct nvif_client *client = &cli->base;
-	union {
-		struct nvif_ioctl_new_v0 v0;
-	} *args = data;
-	struct usif_object *object;
-	int ret = -ENOSYS;
-
-	if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
-		return ret;
-
-	switch (args->v0.oclass) {
-	case NV_DMA_FROM_MEMORY:
-	case NV_DMA_TO_MEMORY:
-	case NV_DMA_IN_MEMORY:
-		return -EINVAL;
-	case NV_DEVICE: {
-		union {
-			struct nv_device_v0 v0;
-		} *args = data;
-
-		if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false)))
-			return ret;
-
-		args->v0.priv = false;
-		break;
-	}
-	default:
-		if (!parent_abi16)
-			return -EINVAL;
-		break;
-	}
-
-	if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
-		return -ENOMEM;
-	list_add(&object->head, &cli->objects);
-
-	object->route = args->v0.route;
-	object->token = args->v0.token;
-	args->v0.route = NVDRM_OBJECT_USIF;
-	args->v0.token = (unsigned long)(void *)object;
-	ret = nvif_client_ioctl(client, argv, argc);
-	if (ret) {
-		usif_object_dtor(object);
-		return ret;
-	}
-
-	args->v0.token = object->token;
-	args->v0.route = object->route;
-	return 0;
-}
-
-int
-usif_ioctl(struct drm_file *filp, void __user *user, u32 argc)
-{
-	struct nouveau_cli *cli = nouveau_cli(filp);
-	struct nvif_client *client = &cli->base;
-	void *data = kmalloc(argc, GFP_KERNEL);
-	u32   size = argc;
-	union {
-		struct nvif_ioctl_v0 v0;
-	} *argv = data;
-	struct usif_object *object;
-	bool abi16 = false;
-	u8 owner;
-	int ret;
-
-	if (ret = -ENOMEM, !argv)
-		goto done;
-	if (ret = -EFAULT, copy_from_user(argv, user, size))
-		goto done;
-
-	if (!(ret = nvif_unpack(-ENOSYS, &data, &size, argv->v0, 0, 0, true))) {
-		/* block access to objects not created via this interface */
-		owner = argv->v0.owner;
-		if (argv->v0.object == 0ULL &&
-		    argv->v0.type != NVIF_IOCTL_V0_DEL)
-			argv->v0.owner = NVDRM_OBJECT_ANY; /* except client */
-		else
-			argv->v0.owner = NVDRM_OBJECT_USIF;
-	} else
-		goto done;
-
-	/* USIF slightly abuses some return-only ioctl members in order
-	 * to provide interoperability with the older ABI16 objects
-	 */
-	mutex_lock(&cli->mutex);
-	if (argv->v0.route) {
-		if (ret = -EINVAL, argv->v0.route == 0xff)
-			ret = nouveau_abi16_usif(filp, argv, argc);
-		if (ret) {
-			mutex_unlock(&cli->mutex);
-			goto done;
-		}
-
-		abi16 = true;
-	}
-
-	switch (argv->v0.type) {
-	case NVIF_IOCTL_V0_NEW:
-		ret = usif_object_new(filp, data, size, argv, argc, abi16);
-		break;
-	default:
-		ret = nvif_client_ioctl(client, argv, argc);
-		break;
-	}
-	if (argv->v0.route == NVDRM_OBJECT_USIF) {
-		object = (void *)(unsigned long)argv->v0.token;
-		argv->v0.route = object->route;
-		argv->v0.token = object->token;
-		if (ret == 0 && argv->v0.type == NVIF_IOCTL_V0_DEL) {
-			list_del(&object->head);
-			kfree(object);
-		}
-	} else {
-		argv->v0.route = NVIF_IOCTL_V0_ROUTE_HIDDEN;
-		argv->v0.token = 0;
-	}
-	argv->v0.owner = owner;
-	mutex_unlock(&cli->mutex);
-
-	if (copy_to_user(user, argv, argc))
-		ret = -EFAULT;
-done:
-	kfree(argv);
-	return ret;
-}
-
-void
-usif_client_fini(struct nouveau_cli *cli)
-{
-	struct usif_object *object, *otemp;
-
-	list_for_each_entry_safe(object, otemp, &cli->objects, head) {
-		usif_object_dtor(object);
-	}
-}
-
-void
-usif_client_init(struct nouveau_cli *cli)
-{
-	INIT_LIST_HEAD(&cli->objects);
-}
diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.h b/drivers/gpu/drm/nouveau/nouveau_usif.h
deleted file mode 100644
index dc90d4a9d0d9..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_usif.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NOUVEAU_USIF_H__
-#define __NOUVEAU_USIF_H__
-
-void usif_client_init(struct nouveau_cli *);
-void usif_client_fini(struct nouveau_cli *);
-int  usif_ioctl(struct drm_file *, void __user *, u32);
-int  usif_notify(const void *, u32, const void *, u32);
-
-#endif
-- 
2.41.0

