Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BEE92AD4D
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BEC10E456;
	Tue,  9 Jul 2024 00:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MjWW2CV9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860AF10E234
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgz5xB4Ybh3JNTEGEzEDZaLAFTmTH4fsVYjx700zKs8cnI/4hAdAq0n0uIjNIP8DnPUPM2ffPGt6XkFeg2dEFPr5tyE3caCa8KZMwTXMJgexQhoKwBsxteJywNkMKVrC84FsKbXUL92ozzXRFfouA3Qf4Fc9SHFBaV8D1y5XxhrQ9C2/ERVmk4T9qyhd5VN3JQTTW01UZMRnKiIaPpSvHKFa2FZQK3HappdnVKFbtGit+Ie4VrF5i6JBmWTfPWjkFuk0UVGTjYBMK9AQbNn0NreJ2DLAaawNNv7ma2nCNp/VRGXwHzV0fkNHnZC/vC8mfduIcFULf3aojjpi1DQWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XInLsnKs8F54xOf8gLaxO3F1atVScfOsZwQsDv/XWEg=;
 b=LAIsv9mG6DBVYk2YnOxzHjHIIq116QuUfhDzX92eE4hJzCBOfNnX4U0lVEZw+3rinzID91I4qrPtko1WLXQZi189SwgnYnEHsIMPwJV8ACUlCFFWfoji4wJ2WA6kxX9+7biUUXRW1UkICfOiHxLhxRX+edwBEUcuwLrsAhFdOoK47Jw1pRNCCTyERfcUob4diGTBsgVrOt8XF9D2qSZ8CEynjBxo5jeMhpouNgtUqurDmtzxG0KY0YfGIHfXapAqBk5O5fXPGDLAu/d60cRJi6CPmgS3z7XI9YKEqgJZe4tVyScy1CmIci2NG8FsnftdxFpbpqFBYBE+zZAJH/QsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XInLsnKs8F54xOf8gLaxO3F1atVScfOsZwQsDv/XWEg=;
 b=MjWW2CV9y2Ev9US470CUpwZmTnEvjLU46rZvy4IFjOKraZ2gEMYZvbQ943eqQqzdnr41R6WCb4fVvJd3kKRAlxn3EAQ0iPaWkr2XhQwzay3C3QXkN5WM+od9yH5a2fAzkFp8UDBvmVkyFf47LhYdbtKIbHYLvNhL/JYFe06uJbDsGmxQbnAAx75FnBOJdUjxQMlHidnm5VJesy/gRGsPru0LeM9V1wbE1ouC7lf8n28RYwEazBW2uomR/sbDM35GuA7C5QPmJ6pgUGGbVRTPkOsJfPhmhioANRQaUapxRRrO7e4qyBNc6pzJDtAl+KXfQkoKVgnWFtIcbV7Buu3JzQ==
Received: from CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:08 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::b3) by CH2PR10CA0006.outlook.office365.com
 (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:58 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 08/37] drm/nouveau: handle limited nvif ioctl in abi16
Date: Fri, 5 Jul 2024 04:36:52 +1000
Message-ID: <20240704183721.25778-9-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9fdfc7-e904-438e-096f-08dc9fb1c797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ce7vHRdMpiH7Sf9d36mCxHD7a/ofW6Tq0llbYYYSd3Z5i/Xe/B+uqytWsXZJ?=
 =?us-ascii?Q?Z8+BhjOuzK+mw6n+DiaSK2xW5PRaS4DjaX6k58LV75HJe1y5VHQHnaex83iM?=
 =?us-ascii?Q?isnbOCGOkXRgGarUpfKqXE5Pskh/FZowWGefMD9crmC2l8JVzwCrW3O6Iqd4?=
 =?us-ascii?Q?HOIzw5WgSHLPNI2oXI2JtajKdaFUkce6S2pyofdOp8m3yc2IDWAE+DDaifm4?=
 =?us-ascii?Q?wCSXurAdMzKzkCHI4De1/ffSX3xD32aZsqVHe2PuHHlaUmTm+99xiyaoraGl?=
 =?us-ascii?Q?2xICDR9kGMwM1gIGoESO+3Ifp+APWaa6Co/Zp/wJcsm57E9LTri7xx9Jksls?=
 =?us-ascii?Q?roVbJ4ZnNrZqGATWUcJepuk7CV8UI6J6XT2kVs08zXEr1pQBW95ROj1w0tar?=
 =?us-ascii?Q?Bsn5s1Q6Y+gZerV739bOPvk4lmBeYKBtohSoiYWb9bk75jdoRO+vQYP5n7pZ?=
 =?us-ascii?Q?fPFXdcSKKKKjyS6Ee9Z1MRigzPy0qPc+xo56aeV5rU/I6kozpfnKDdAZxurp?=
 =?us-ascii?Q?+SeGVmAPMV2EEnnYo5RQIi4jvdH6R279kLV9/AV5U1PvxJxFiz/XWUH8AH2k?=
 =?us-ascii?Q?BvpM7a6Q6P08tnueaI7Im13wPpOJeOQtnx1ljZVk9zmknULg/3Cd3rJDJBo/?=
 =?us-ascii?Q?Fbc2DLEKERCJMrvnlxdwWqMYQbsPNR8HQO1+Ej5cIIJCtPHTKW83imIViv4z?=
 =?us-ascii?Q?Uf3/BgD5IXO+wHoqAzs0cge9xyriccWXYNXpcMKd9F0x1Gtka/MJI5qEaSt/?=
 =?us-ascii?Q?BAYj5aWC672mwJoaNmUwGtV6644LT7yi96DzH69yVxVm+Gp6pZWdiREfails?=
 =?us-ascii?Q?dukaLgeH45Sz+jxGPDI97IaOHbDe7kViH+RS3EcVA83bkbZzxhoj+sfqyGq/?=
 =?us-ascii?Q?UU9RkAtf3lmivvoao4WHPFlURKOL+4KGIPk30V/H/dr5J7K8yErSRlUkne34?=
 =?us-ascii?Q?RdpTzxt/gPE34ecd4sDH4vw4I0Z24MaBnj7d0NRzKmTKDeG9XKCt0YowhG/y?=
 =?us-ascii?Q?IIbu839ndoBFORjeaDfRPTKbvEk9Bo1zlJmHiiFM9VD3lFnzKX4KlRDgCkdh?=
 =?us-ascii?Q?JEWnXSVj82ZRgMrHYS8iPZounb+RqvzdziXoFCUK04DTAd8zHjO+QSoXtDrW?=
 =?us-ascii?Q?leHHOmSiA0Q9zhmRqBf0/+j4EKb56LQKrbb8zQj47KkqOrfIf5N5XDh0vUDI?=
 =?us-ascii?Q?dro1x5Fr1ORHtRcLUl7fAvScARvudE9vRzImEgFHzjPViGcWSxRVnRaRfjSW?=
 =?us-ascii?Q?DkKGvpkYykKibxd8bYgWfFM89Sb3o+B/lO4Fbk5wKdwmoBPthPCmMR7gVHX0?=
 =?us-ascii?Q?v7T+X1bUe2VJbGs7xJgYSznxD/RZHmjNdjyMSCKTEjmVyjmZVSLvVHtYknJb?=
 =?us-ascii?Q?Y7hZkyD22BeTU635gO1d8klL6T05NlY5xvBXXC4ZNfNNmL7CdZqF5W1sh2IZ?=
 =?us-ascii?Q?Apoe7dxWM6M9I3HfUB8bNfvEHtvC6ik8?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:08.5109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9fdfc7-e904-438e-096f-08dc9fb1c797
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935
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

nouveau_usif.c was already stripped right back a couple of years ago,
limiting what userspace could do with it, and now I'd like to remove
the nvkm side of these interfaces entirely, in order to make it less
of a nightmare to add/change internal APIs in the future.

Unfortunately.  Userspace uses some of this.

Fortunately, userspace only ever ended up using a fraction of the APIs,
so I've reimplemented those in a more direct manner, and return -EINVAL
to userspace for everything else.

v2:
- simplified struct nouveau_abi16_obj
- added a couple of comments

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
index c32c01827c1d..7b863355c5c6 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -25,7 +25,6 @@ nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
 nouveau-y += nouveau_nvif.o
 nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
-nouveau-y += nouveau_usif.o # userspace <-> nvif
 nouveau-y += nouveau_vga.o
 
 # DRM - memory management
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index ac50c300d2eb..f80d777cee5d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -52,6 +52,7 @@ nouveau_abi16(struct drm_file *file_priv)
 
 			abi16->cli = cli;
 			INIT_LIST_HEAD(&abi16->channels);
+			INIT_LIST_HEAD(&abi16->objects);
 
 			/* allocate device object targeting client's default
 			 * device (ie. the one that belongs to the fd it
@@ -88,6 +89,58 @@ nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
 	return ret;
 }
 
+/* Tracks objects created via nvif_ioctl_v0 APIs. */
+struct nouveau_abi16_obj {
+	enum nouveau_abi16_obj_type {
+		DEVICE,
+		ENGOBJ,
+	} type;
+	u64 object;
+
+	struct nvif_object engobj;
+
+	struct list_head head; /* protected by nouveau_abi16.cli.mutex */
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
@@ -167,6 +220,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
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
@@ -458,44 +517,6 @@ nouveau_abi16_chan(struct nouveau_abi16 *abi16, int channel)
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
@@ -705,3 +726,183 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
 
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
+	info = &cli->device.info;
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
+	if (obj) {
+		if (obj->type == ENGOBJ)
+			nvif_object_dtor(&obj->engobj);
+		nouveau_abi16_obj_del(obj);
+	}
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
+			       NULL, 0, &obj->engobj);
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
index a942d2c03d44..6726f463d2d3 100644
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
@@ -249,7 +247,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
 	cli->drm = drm;
 	mutex_init(&cli->mutex);
-	usif_client_init(cli);
 
 	INIT_WORK(&cli->work, nouveau_cli_work);
 	INIT_LIST_HEAD(&cli->worker);
@@ -1267,7 +1264,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
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
2.45.1

