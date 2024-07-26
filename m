Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08B93CD3E
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3365110E5FE;
	Fri, 26 Jul 2024 04:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qDKWKt9J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0910E246
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzRQ7FLjIS9fMkcgrkdAKUBMX99E02/51+T+ldJ5tT98Ng9kZsX5esQQcEHEaiKQM/ycLb1PoPpJFgvX1EMzupyLvD3S3GuHivEaSsR4OGug2DcdWoYtwqPC2oq1fOrCcZpjN5oO9oVeW6vXN5jwZTGc7E78FVHy8ao4G7i9uzu6eWP9gdYklKY/DlFwH3q05+suu+eOWnxrRkllZBMMR9a9H3jyn7QTC3ahvC4urm4W40dkzHZvGCvySRIoZUdwCYvdyEkQYoW537fieeeDX/aYZWyqqouZGkkQwZYuSUVl1HlRJcm/lsHVTmIlqtC+teikFOEgMfpxuYldq7SNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8I3dJRfgQ4FLo18gAeK+k10FRpFGE/0yDsaaJNRxzzc=;
 b=LRjq3iwaxqM2xbm8JDYTwmdWqrsFW8MW6PN59AuEENTQNIPJQVjNCgpTiXklAOrvQ3hya5ea2rfLR3Z2WKIFRUgqqAw56kSxNhwWp3aw7hziLnF/BgdlzupYMBVmWajYhnJmbOZ54n/2VHgQrnZqLpRnsiN7chofV65c8oLw4RgX6V6e9OIUV1I94/DXOD2H4H+58Ar9nZoSUesFmDgEhS7uR04fbGJ2FhkuvTr+Fu61jsexyntuKb/Lc/qHuJCqiFKPTX1kii9rKXyxYYQVUrilXL1TcBrc0bJEkyq7fo6+6owxi2aju+7I6Wy3vUs904s0wjOZ0iXQMSk1gxsabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8I3dJRfgQ4FLo18gAeK+k10FRpFGE/0yDsaaJNRxzzc=;
 b=qDKWKt9JBejqXNu4qfkZtDYe50qL6AaoBGmC0T+NcUlt8cyfATLhapBgduFyuH4jLwn9pC8mblYpfRZxKprjq1YbdoOam4OzFQ1O1iH6U0CZhYpXDezrUWrvLpXPhApzd3A7c1wZaJTb9Zvb4nDVxnnKX28nzhh5LBb9/qwQG5hYwkQSKRLIJSXB0DwRTbBKxDFTGeThhc/yIEyLVA1nmYbBjeLj8h7xWqa43MB8MQYc8I5X3hTN41f3DuWKPKMg9cfSCcFOvv7GpeOJ5yb3h3x6EbFUNUIhv2TICQE0oc2qVOsZpNcp/wWchsk4MnIcsoMu/Frlu1oQwrKxSG4hAg==
Received: from DM6PR03CA0058.namprd03.prod.outlook.com (2603:10b6:5:100::35)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:05 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::5e) by DM6PR03CA0058.outlook.office365.com
 (2603:10b6:5:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:57 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 08/37] drm/nouveau: handle limited nvif ioctl in abi16
Date: Fri, 26 Jul 2024 14:37:59 +1000
Message-ID: <20240726043828.58966-9-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 485811ef-f5d5-4b98-6d07-08dcad2ce188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qW9Z2fGudq9RWqb0r7kClC43N5C6oaIMqG6P8GuxGyY4fuG27Pi4+1gWmHRu?=
 =?us-ascii?Q?omgc0Te6vPIpimFair+xC5Ex9AeV/GPqDtSWFPUoz3N4p9MrHzNiiEbsE38m?=
 =?us-ascii?Q?kMibd2tbvY4XOtrSCzoZs8fSkufmd19z3FDhSiaualYDeJlTTfeAwBrksOhW?=
 =?us-ascii?Q?S85eHhW6IQsonq6bYa3AaNyqP7wqo39insxkuUH+1bsBI8CkvCyMhM8b3mkp?=
 =?us-ascii?Q?SDOr96QjvVUxPq4v8q445K7SaVAcuGJZW8kgdodeaOCnDX3rmdA+i1MKZxlc?=
 =?us-ascii?Q?DcoxsVPu5wLMS/J4VcC2Pj9hOBXoQ1lrRZo0q4awd7GRSc6kFCXSb7KBfjY7?=
 =?us-ascii?Q?wKg4vSw8uh63NKbr7zx5iI/CU0zI/uTcyb9iTS9uv+e+CPgOZoqlMjDN26pZ?=
 =?us-ascii?Q?209VJ9fl/LigPPwnA6tg8FYSPmqRH9Yc1WNem3++soohuEtMFOqjML4uRYhD?=
 =?us-ascii?Q?tQEspa8Lrcitu3MwISFXA4JtkHCsUS/XcannVAcErzl1/nLh/R8kYWgfDy9V?=
 =?us-ascii?Q?Zzka5YQPUB68fhbbkVJXANB+0Gvyobx2X2PoInpogWK/4rLTAcLVjBjdnjAF?=
 =?us-ascii?Q?A3IJ7F6hPprsujDjVzsRHXQYwdtAIk2hvIPg4Tt1zc/dyoefWSbwJMlqT0u3?=
 =?us-ascii?Q?uwV8QGDAh4EMws3qFpeCAOln7nrxeyjIpqXsHp++1yrWGaz5AxFh38/KWjrS?=
 =?us-ascii?Q?xmWXwh6wUr9vszteRTGwQTkdZ6w6mm7jDk+qefFfN/KOP2gu4EGKkEuJp9js?=
 =?us-ascii?Q?zHedyzhliGVjt7Mq07EeL02FWlN/cpregm4nVEPEHF0ISX3YMHjiPdd6T6nX?=
 =?us-ascii?Q?4GAaK3T1T3hbmiSqcv9Jj2WSHJRNaTOLQ8OIwS1ZySyV6be6D8bucI1EBgdL?=
 =?us-ascii?Q?fRCMuwTtMXj6jCKPg4PNt2zCeuTMr/6yb+F3fe6YQFLoKQl4Bi/hZrEblEC2?=
 =?us-ascii?Q?jQHUHkPYobPTahZHGtvKh3vMH1cTNX+1TGMw3iLJyh/FV5g9TnWS2cw6UAjW?=
 =?us-ascii?Q?ru8La0F0OEHNo4QGwlzn3z4RCVJeM0WfZ42se0xQiv3Cx4yCL0a0aagy6PbK?=
 =?us-ascii?Q?0gYQc0IiLSGYT0n/UQyxvIbGLg0FTaojXgUNq0CF+M7w5WIWzdLP1Z6KK5A+?=
 =?us-ascii?Q?9r2PQOOhcldDcXdASU7NXlMRTWDxUWUM0RWbv70/efvb06WL5w8+4Pqg9dBf?=
 =?us-ascii?Q?nt/ZjHO0c0U/STdtcTNn8q7e5DtSRsgSL4gbv36mNljPpY3Lvzue8za/KSV3?=
 =?us-ascii?Q?rKW8PfvGHTedTeNNQzBs76vJbO6UcRyx5QFL0lXx1DSiwDI/AP/gBpPRbnrx?=
 =?us-ascii?Q?KauxkANeg8s669gyc8YuCTkyAFfINqPRfulTi8L0G0rQabf0K3bbzMFCDs0r?=
 =?us-ascii?Q?oykTFFgyDBnqVXGBvovZzddJzwsDZgFpd57viojiuUOrmljaDxBjPnekuuHB?=
 =?us-ascii?Q?70uDhrpocurO0OVfGuOFmrW+qDg9dfAq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:05.2185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485811ef-f5d5-4b98-6d07-08dcad2ce188
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
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
limiting what userspace could do with it.

A follow-on series removes the nvkm side of these interfaces entirely,
in order to make it less of a nightmare to add/change internal APIs in
the future.

Unfortunately.  Userspace uses some of this.

Fortunately, userspace only ever ended up using a fraction of the APIs,
so those are reimplemened here in a more direct manner, and return
-EINVAL to userspace for everything else.

v2:
- simplified struct nouveau_abi16_obj
- added a couple of comments
v3:
- comment harder

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild          |   1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 286 ++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h |   3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   5 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c  |   1 -
 drivers/gpu/drm/nouveau/nouveau_usif.c  | 194 ----------------
 drivers/gpu/drm/nouveau/nouveau_usif.h  |  10 -
 7 files changed, 251 insertions(+), 249 deletions(-)
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
index ac50c300d2eb..f2f5031d539f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -52,6 +52,7 @@ nouveau_abi16(struct drm_file *file_priv)
 
 			abi16->cli = cli;
 			INIT_LIST_HEAD(&abi16->channels);
+			INIT_LIST_HEAD(&abi16->objects);
 
 			/* allocate device object targeting client's default
 			 * device (ie. the one that belongs to the fd it
@@ -88,6 +89,67 @@ nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
 	return ret;
 }
 
+/* Tracks objects created via the DRM_NOUVEAU_NVIF ioctl.
+ *
+ * The only two types of object that userspace ever allocated via this
+ * interface are 'device', in order to retrieve basic device info, and
+ * 'engine objects', which instantiate HW classes on a channel.
+ *
+ * The remainder of what used to be available via DRM_NOUVEAU_NVIF has
+ * been removed, but these object types need to be tracked to maintain
+ * compatibility with userspace.
+ */
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
@@ -167,6 +229,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
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
@@ -458,44 +526,6 @@ nouveau_abi16_chan(struct nouveau_abi16 *abi16, int channel)
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
@@ -705,3 +735,183 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
 
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
index eb154b44c154..a018b5475478 100644
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

