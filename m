Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D88A7937
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A27112FD3;
	Tue, 16 Apr 2024 23:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hFnrCZnA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0FB112FD3
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKnH7sXbTRcMhnnDviTn9KOniLEqc4qraHe9ZvrfegwpbDSAWs1m0fQkn7wjz1xZsFlsmIERU2rxn0aA4aTYwtBvvRHQHKzuHsfXMiQX0Wm1TgQz+QxDyvGFpbT8bY28PHbj9OQ4S96WvLA0CiaQ4MLtF9WkKfek3GJcswyLpFO5RGKSpKz9bqk8l8MLhyxmEDp4nes3lNwxGri0r76edFkzWaT91XOO7jY4Adn9/poMV7C2HtmTM+DXJshTNzSzPJE4EpSOUAuy4UuPGoqbI1jL3fxdQ63HDz5JdYjdqN8uh/3hA9FYE2gX6mROvKzlfkU62Yn/uXYBhanblljHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HH1s9U/mbiwaecJu7FBLj1XOWvXefhgXZtppFjizpMg=;
 b=iwFHs60PGp6uidGZX9dwrEqAOBPDgG2mjGzdwMa9hqGQVGwJgrZz3XDg7DbMgCHwQeGzY98ImSUtbov4gItcFtcPzfbUr2MvWd2GV6WkabyiZjDb0o8W+2ysueRSpoZL/fhUEClQLrKgtBhcWbtFmzQexV3BmXpFVvRAYGjeft/MtujNYX75zRvJ9EuKCy9wdA5n0AQu0SYwPT4ji5lVzfGOg++OdAa9tj3tX4kSotTBbStj+0HoT9wIzfvsXWEXeJdG3l5TgdNtSuyKKHruxSV4brEZ/0r/NhePvFi+s+wx9XVAw1bfZIixIsEaOLQlE3ukAi6q2C9/musOQV8yMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HH1s9U/mbiwaecJu7FBLj1XOWvXefhgXZtppFjizpMg=;
 b=hFnrCZnAQNBfEQXJiFy4yCz9/s+wbp8BgGaDveSySinTczUr7qva1m0JZPMdtIMBu94lG1X0XXUWu3aYdbxaR4SAiRwvBO8JRwySypJ9+kx6SKqY9B4zrsCpx9UjJCWkM9En0F64cYcyE9gJvia+x385VeGmxXN3/tajXcW4Oi6f8bA0T5ZEQ05Sv7FPTSAal/Z+Cfi+6xpMkaTZq4ExIqjea1239Es7SZS5/ojtlIIVLX6yW0ZdcgHj/Hvh6e3bLAhGCi9wR13c6rfkuupskY3CbHPvF8N/8kXt8cXOQKMUPMpR0cHLq/MElZ0fHrJpyM7nN5R2/+T/1IJOjES2Jw==
Received: from DM6PR06CA0087.namprd06.prod.outlook.com (2603:10b6:5:336::20)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:27 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::9d) by DM6PR06CA0087.outlook.office365.com
 (2603:10b6:5:336::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:27 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:11 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 141/156] drm/nouveau/nvif: rework chan "map" api
Date: Wed, 17 Apr 2024 09:39:47 +1000
Message-ID: <20240416234002.19509-142-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0098259a-99bc-40c9-e106-08dc5e6f0358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaKK2NdGFnshIRS4Pmi62AF+gUaNwYkiZuDaHCdT9G6sN9Ak3G5V2WKTziWwAzB98kHIH+TMyyxwhwjjJDTnigkIdpmX8vj6Kd52+eOYYmvhVpv/jcEDZ1kz5rxY91Y3OBcaPFxG3X70gVn+ZGXAlvelWjKwjx6ofJYWjae8RxvWKE+ORkl8flvFzCPT/PYrTQaDasd/ZkqaHgISMsnEf4N00wwGSxMAVnaSTSLDWT9FWngsJhjCegeOgA5v4+cE2NXxsZ4sFKASHUypBS6t9wZn2FEN7bkezwv8hSHqyD4wtyKYJ0qJpNW1Yw3YvmwJL8MwJueo4uehxyI2CsbM1b1Wb5DeDAj9SiXH4yiyLFLCKgWW9fKHn5bUQqJznDYVqVq7siC8ePBC6ZvAb4zbL9vV1pbSLamY+NDofCffzMIYt7qvhmGRH3BAMXdqDt3s1aiBRteowsJAyUdYPVakH57rC2XaPV0WsFLAGnl4d3S/4Ank6ne9X7qU7v58o1dYf3UzVN2NJ7McjhbqJgYkmp49zgvtgNGu/x81PSkBZLcZiO3+itKzId0LDMOeG0JovYfBnx49FbHQOkp4Vuf04rEQoGIeOD16E0DKdP3ZTRxdAF3IvroloPY0U3doykHMB2B2pcWrMFxVFq/4rcJDnl50EQxo/WANsqdGMTpc5FZptEYLneS6xMqObcP7M0MXIBSVUFiWOoMFKfjxZGuT3yKlSJSWM/07shMJ1ususW/Yp6T+j9c/gD0yiySQrTQr
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:26.8586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0098259a-99bc-40c9-e106-08dc5e6f0358
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 +
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  | 17 ----
 drivers/gpu/drm/nouveau/include/nvif/object.h |  5 --
 .../drm/nouveau/include/nvkm/core/object.h    | 11 ---
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  7 +-
 drivers/gpu/drm/nouveau/nvif/object.c         | 77 -------------------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 62 ---------------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 18 -----
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 21 -----
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 26 ++-----
 10 files changed, 12 insertions(+), 234 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 7dd2b187e6d6..75861e0327ac 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -446,6 +446,8 @@ struct nvif_chan_impl {
 		} aper;
 		u64 addr;
 	} inst;
+
+	struct nvif_mapinfo map;
 };
 
 struct nvif_cgrp_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
index e825c8a1d9ca..0eb479695c0a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
@@ -8,8 +8,6 @@ struct nvif_ioctl_v0 {
 #define NVIF_IOCTL_V0_NEW                                                  0x02
 #define NVIF_IOCTL_V0_DEL                                                  0x03
 #define NVIF_IOCTL_V0_MTHD                                                 0x04
-#define NVIF_IOCTL_V0_MAP                                                  0x07
-#define NVIF_IOCTL_V0_UNMAP                                                0x08
 	__u8  type;
 	__u8  pad02[4];
 #define NVIF_IOCTL_V0_OWNER_NVIF                                           0x00
@@ -57,19 +55,4 @@ struct nvif_ioctl_mthd_v0 {
 	__u8  pad02[6];
 	__u8  data[];		/* method data (class.h) */
 };
-
-struct nvif_ioctl_map_v0 {
-	/* nvif_ioctl ... */
-	__u8  version;
-#define NVIF_IOCTL_MAP_V0_IO                                               0x00
-#define NVIF_IOCTL_MAP_V0_VA                                               0x01
-	__u8  type;
-	__u8  pad02[6];
-	__u64 handle;
-	__u64 length;
-	__u8  data[];
-};
-
-struct nvif_ioctl_unmap {
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 10a8f3e1ea81..d52d59d9805d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -51,11 +51,6 @@ void nvif_object_sclass_put(struct nvif_sclass **);
 int  nvif_object_mthd(struct nvif_object *, u32, void *, u32);
 int nvif_object_map_cpu(struct nvif_object *, const struct nvif_mapinfo *, struct nvif_map *);
 int nvif_object_unmap_cpu(struct nvif_map *);
-int  nvif_object_map_handle(struct nvif_object *, void *, u32,
-			    u64 *handle, u64 *length);
-void nvif_object_unmap_handle(struct nvif_object *);
-int  nvif_object_map(struct nvif_object *, void *, u32);
-void nvif_object_unmap(struct nvif_object *);
 
 #define nvif_handle(a) (unsigned long)(void *)(a)
 #define nvif_object(a) (a)->object
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index 9ab163d9a4d0..69972b0836e4 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -19,20 +19,12 @@ struct nvkm_object {
 	struct rb_node node;
 };
 
-enum nvkm_object_map {
-	NVKM_OBJECT_MAP_IO,
-	NVKM_OBJECT_MAP_VA
-};
-
 struct nvkm_object_func {
 	void *(*dtor)(struct nvkm_object *);
 	int (*init)(struct nvkm_object *);
 	int (*fini)(struct nvkm_object *, bool suspend);
 	int (*mthd)(struct nvkm_object *, u32 mthd, void *data, u32 size);
 	int (*ntfy)(struct nvkm_object *, u32 mthd, struct nvkm_event **);
-	int (*map)(struct nvkm_object *, void *argv, u32 argc,
-		   enum nvkm_object_map *, u64 *addr, u64 *size);
-	int (*unmap)(struct nvkm_object *);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
 	int (*sclass)(struct nvkm_object *, int index, struct nvkm_oclass *);
@@ -52,9 +44,6 @@ int nvkm_object_init(struct nvkm_object *);
 int nvkm_object_fini(struct nvkm_object *, bool suspend);
 int nvkm_object_mthd(struct nvkm_object *, u32 mthd, void *data, u32 size);
 int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
-int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
-		    enum nvkm_object_map *, u64 *addr, u64 *size);
-int nvkm_object_unmap(struct nvkm_object *);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 21927b817fa8..60be87d5fd59 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -101,8 +101,6 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_object_dtor(&chan->gart);
 		nvif_object_dtor(&chan->vram);
 		nvif_event_dtor(&chan->kill);
-		if (!chan->userd.map.impl)
-			chan->userd.map.ptr = NULL;
 		nvif_object_unmap_cpu(&chan->userd.map);
 		nvif_chan_dtor(&chan->chan);
 		nvif_mem_dtor(&chan->userd.mem);
@@ -359,11 +357,10 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	int ret, i;
 
 	if (!chan->userd.mem.impl) {
-		ret = nvif_object_map(&chan->chan.object, NULL, 0);
+		ret = nvif_object_map_cpu(&chan->chan.object, &chan->chan.impl->map,
+					  &chan->userd.map);
 		if (ret)
 			return ret;
-
-		chan->userd.map.ptr = chan->chan.object.map.ptr;
 	} else {
 		ret = nvif_mem_map(&chan->userd.mem, NULL, 0, &chan->userd.map);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index d0f4ddca085e..371a3605f537 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -126,58 +126,6 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 	return ret;
 }
 
-void
-nvif_object_unmap_handle(struct nvif_object *object)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_unmap unmap;
-	} args = {
-		.ioctl.type = NVIF_IOCTL_V0_UNMAP,
-	};
-
-	nvif_object_ioctl(object, &args, sizeof(args), NULL);
-}
-
-int
-nvif_object_map_handle(struct nvif_object *object, void *argv, u32 argc,
-		       u64 *handle, u64 *length)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_map_v0 map;
-	} *args;
-	u32 argn = sizeof(*args) + argc;
-	int ret, maptype;
-
-	if (!(args = kzalloc(argn, GFP_KERNEL)))
-		return -ENOMEM;
-	args->ioctl.type = NVIF_IOCTL_V0_MAP;
-	memcpy(args->map.data, argv, argc);
-
-	ret = nvif_object_ioctl(object, args, argn, NULL);
-	*handle = args->map.handle;
-	*length = args->map.length;
-	maptype = args->map.type;
-	kfree(args);
-	return ret ? ret : (maptype == NVIF_IOCTL_MAP_V0_IO);
-}
-
-void
-nvif_object_unmap(struct nvif_object *object)
-{
-	struct nvif_client *client = object->client;
-	if (object->map.ptr) {
-		if (object->map.size) {
-			client->driver->unmap(client->object.priv, object->map.ptr,
-								   object->map.size);
-			object->map.size = 0;
-		}
-		object->map.ptr = NULL;
-		nvif_object_unmap_handle(object);
-	}
-}
-
 int
 nvif_object_unmap_cpu(struct nvif_map *map)
 {
@@ -224,30 +172,6 @@ nvif_object_map_cpu(struct nvif_object *object,
 	return 0;
 }
 
-int
-nvif_object_map(struct nvif_object *object, void *argv, u32 argc)
-{
-	struct nvif_client *client = object->client;
-	u64 handle, length;
-	int ret = nvif_object_map_handle(object, argv, argc, &handle, &length);
-	if (ret >= 0) {
-		if (ret) {
-			object->map.ptr = client->driver->map(client->object.priv,
-							      handle,
-							      length);
-			if (ret = -ENOMEM, object->map.ptr) {
-				object->map.size = length;
-				return 0;
-			}
-		} else {
-			object->map.ptr = (void *)(unsigned long)handle;
-			return 0;
-		}
-		nvif_object_unmap_handle(object);
-	}
-	return ret;
-}
-
 void
 nvif_object_dtor(struct nvif_object *object)
 {
@@ -261,7 +185,6 @@ nvif_object_dtor(struct nvif_object *object)
 	if (!nvif_object_constructed(object))
 		return;
 
-	nvif_object_unmap(object);
 	nvif_object_ioctl(object, &args, sizeof(args), NULL);
 	object->client = NULL;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 45051a1249da..66f843cac37d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -186,64 +186,6 @@ nvkm_ioctl_mthd(struct nvkm_client *client,
 	return ret;
 }
 
-
-static int
-nvkm_ioctl_rd(struct nvkm_client *client,
-	      struct nvkm_object *object, void *data, u32 size)
-{
-	return -ENOSYS;
-}
-
-static int
-nvkm_ioctl_wr(struct nvkm_client *client,
-	      struct nvkm_object *object, void *data, u32 size)
-{
-	return -ENOSYS;
-}
-
-static int
-nvkm_ioctl_map(struct nvkm_client *client,
-	       struct nvkm_object *object, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_map_v0 v0;
-	} *args = data;
-	enum nvkm_object_map type;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "map size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(object, "map vers %d\n", args->v0.version);
-		ret = nvkm_object_map(object, data, size, &type,
-				      &args->v0.handle,
-				      &args->v0.length);
-		if (type == NVKM_OBJECT_MAP_IO)
-			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
-		else
-			args->v0.type = NVIF_IOCTL_MAP_V0_VA;
-	}
-
-	return ret;
-}
-
-static int
-nvkm_ioctl_unmap(struct nvkm_client *client,
-		 struct nvkm_object *object, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_unmap none;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "unmap size %d\n", size);
-	if (!(ret = nvif_unvers(ret, &data, &size, args->none))) {
-		nvif_ioctl(object, "unmap\n");
-		ret = nvkm_object_unmap(object);
-	}
-
-	return ret;
-}
-
 static struct {
 	int version;
 	int (*func)(struct nvkm_client *, struct nvkm_object *, void *, u32);
@@ -254,10 +196,6 @@ nvkm_ioctl_v0[] = {
 	{ 0x00, nvkm_ioctl_new },
 	{ 0x00, nvkm_ioctl_del },
 	{ 0x00, nvkm_ioctl_mthd },
-	{ 0x00, nvkm_ioctl_rd },
-	{ 0x00, nvkm_ioctl_wr },
-	{ 0x00, nvkm_ioctl_map },
-	{ 0x00, nvkm_ioctl_unmap },
 };
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index d34a8ee1a0ae..8ad1aff9b8c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -115,23 +115,6 @@ nvkm_object_ntfy(struct nvkm_object *object, u32 mthd,
 	return -ENODEV;
 }
 
-int
-nvkm_object_map(struct nvkm_object *object, void *argv, u32 argc,
-		enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	if (likely(object->func->map))
-		return object->func->map(object, argv, argc, type, addr, size);
-	return -ENODEV;
-}
-
-int
-nvkm_object_unmap(struct nvkm_object *object)
-{
-	if (likely(object->func->unmap))
-		return object->func->unmap(object);
-	return -ENODEV;
-}
-
 int
 nvkm_object_bind(struct nvkm_object *object, struct nvkm_gpuobj *gpuobj,
 		 int align, struct nvkm_gpuobj **pgpuobj)
@@ -234,7 +217,6 @@ nvkm_object_dtor(struct nvkm_object *object)
 	}
 
 	nvif_debug(object, "destroy running...\n");
-	nvkm_object_unmap(object);
 	if (object->func->dtor)
 		data = object->func->dtor(object);
 	nvkm_engine_unref(&object->engine);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 5db80d1780f0..690131104d7b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -36,25 +36,6 @@ nvkm_oproxy_ntfy(struct nvkm_object *object, u32 mthd,
 	return nvkm_object_ntfy(nvkm_oproxy(object)->object, mthd, pevent);
 }
 
-static int
-nvkm_oproxy_map(struct nvkm_object *object, void *argv, u32 argc,
-		enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvkm_oproxy *oproxy = nvkm_oproxy(object);
-	return nvkm_object_map(oproxy->object, argv, argc, type, addr, size);
-}
-
-static int
-nvkm_oproxy_unmap(struct nvkm_object *object)
-{
-	struct nvkm_oproxy *oproxy = nvkm_oproxy(object);
-
-	if (unlikely(!oproxy->object))
-		return 0;
-
-	return nvkm_object_unmap(oproxy->object);
-}
-
 static int
 nvkm_oproxy_bind(struct nvkm_object *object, struct nvkm_gpuobj *parent,
 		 int align, struct nvkm_gpuobj **pgpuobj)
@@ -159,8 +140,6 @@ nvkm_oproxy_func = {
 	.fini = nvkm_oproxy_fini,
 	.mthd = nvkm_oproxy_mthd,
 	.ntfy = nvkm_oproxy_ntfy,
-	.map = nvkm_oproxy_map,
-	.unmap = nvkm_oproxy_unmap,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
 	.uevent = nvkm_oproxy_uevent,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index f21cd52d5ae3..e9279902c472 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -254,23 +254,6 @@ nvkm_uchan_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *ocl
 	return -EINVAL;
 }
 
-static int
-nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
-	       enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
-	struct nvkm_device *device = chan->cgrp->runl->fifo->engine.subdev.device;
-
-	if (chan->func->userd->bar < 0)
-		return -ENOSYS;
-
-	*type = NVKM_OBJECT_MAP_IO;
-	*addr = device->func->resource_addr(device, chan->func->userd->bar) +
-		chan->func->userd->base + chan->userd.base;
-	*size = chan->func->userd->size;
-	return 0;
-}
-
 static void
 nvkm_uchan_del(struct nvif_chan_priv *uchan)
 {
@@ -329,7 +312,6 @@ nvkm_uchan = {
 	.dtor = nvkm_uchan_dtor,
 	.init = nvkm_uchan_init,
 	.fini = nvkm_uchan_fini,
-	.map = nvkm_uchan_map,
 	.sclass = nvkm_uchan_sclass,
 	.uevent = nvkm_uchan_uevent,
 };
@@ -414,6 +396,14 @@ nvkm_uchan_new(struct nvkm_device *device, struct nvkm_cgrp *cgrp, u8 runi, u8 r
 
 	uchan->impl.inst.addr = nvkm_memory_addr(chan->inst->memory);
 
+	if (chan->func->userd->bar >= 0) {
+		uchan->impl.map.type = NVIF_MAP_IO;
+		uchan->impl.map.handle =
+			device->func->resource_addr(device, chan->func->userd->bar) +
+			chan->func->userd->base + chan->userd.base;
+		uchan->impl.map.length = chan->func->userd->size;
+	}
+
 	*pimpl = &uchan->impl;
 	*ppriv = uchan;
 	*pobject = &uchan->object;
-- 
2.41.0

