Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DE8A793C
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82981112FDE;
	Tue, 16 Apr 2024 23:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S1Utrtum";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94C112FDD
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGVc1cALovA2H+8o59Ax6MtVQ9/71vZBzthLoiN2C6pGR0p7NafsM2RS81Qo0dVObAnb8VgOOPQF1Xapx9JNC7s02QzL4bUGP68MldXvmC65r/+j8qmWUIevCSIoNhyUWm/ibqgty0b5t53vIdXtk7MXvmt6Gmca0Tlg1YdNSHX7wo7Ph5yZP4HUKCbRHY2ANlTPxZDBYsdYyd0SRfCZGFnEkiVuLlxd3BVKFgf0d6NhJbju1Jr84j1742XyOwyBRL79OqCoT7fgDbzzQyWmwBvh+o2VysTA7n4afMOqEeUnoZkpg0L4GPcbYmY5I2KeE+FWL+C/SLZ0iw5CMwhxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NacdPtQJF3UJYMTny9SJVt3u+x3fop+69OHDA5V4t4=;
 b=F81VcQeGQwAwUQe8JZXwWTq2NqPX1LY6ng6b7Dfh8Zo9XCTLDOQ6kwVUZextlElpDEnbdcXl0UBOHouCR+x82NSdDAyRLoUKytu/WKhuTNQzAOBmIKjNpk1KQ0ILA3VNe2YOyS3PgaMbl6H+RuvHS37Sl6S8FV1e/zSf3zdhoUXeZ7szfjs5wQmH92W2AqWCw41VBOvTKuYPiod63ptzJo4Ero6ymQb1uhwA5ytNMroB7gvCcqlD/qWL1AnPPxL2JwQyj1CSGeeQBj0hT6qc4Ay32uhluaiTySXNLa9PNFjsKpZ0ajsiBwOsHbPHAasR4VJCUiy1doGsY4hX6vcCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NacdPtQJF3UJYMTny9SJVt3u+x3fop+69OHDA5V4t4=;
 b=S1UtrtumTHR7bWXHQfwOdRXKLVK4XLkNGbmwBLV47bW9PPPqA3Ro7lHa46K5ubi3syBhshHIESLSo2Yirb6EdVePWlVrrdaZi8hSvJjzLrRPV7soao00jN4p+blIrln0KYX+FxJF/fNWmgWlP3hyUAt6WHSbkNW9slh3wpDFGSLzlINkMvvbpiTd8gEg5L7l3dymBp1NRWhexvqb/KXw7i0XsfRlVRV1wy3eaBf9h6lwY9pHYqqraqdXqirv/B1FSlw93EI5NypnF5SGxjJLyrggNmmtNHYeZCzbYKhjDAb8wq77rFZe9pYn3B/V9wQK/cSlLh0MFF2oJ3+71HoZ+Q==
Received: from CH0PR03CA0402.namprd03.prod.outlook.com (2603:10b6:610:11b::23)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:35 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::19) by CH0PR03CA0402.outlook.office365.com
 (2603:10b6:610:11b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:20 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 148/156] drm/nouveau/nvif: rework engobj "new event" api
Date: Wed, 17 Apr 2024 09:39:54 +1000
Message-ID: <20240416234002.19509-149-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4030ca-e319-449f-e41e-08dc5e6f07f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaLWeDqQ14I/GJViqKBt00uNnPI9XbPmN2CUPi2ORGPrzq0aZhrMkFI1VsA9W1fZVsNFVeJsjCeIcP+mUzpRi9UBofYxkoVEB8Qzugg/y5W1yy4iiin2wMnbco//AxeZL3GbVzNyZyj/9dALbgb4+519/VALnqTZ1twaw2WcdIRNPPf10aHzgl08cRec8TRIqA5yItmDyc4Q0ySPf+zt57ddcAKR2B1l6nmyyzRG3urct5zJwsKsn68rA7SivhRcwgJZ33RsSxE0XBHt1oQjvtDRAH7BmxLaqjJlxQxY4JAx6fc3PmVKU+y3XKDsELL78mArwSuEaobEELRY+uTrndLPzbZ5m9EgEOlsHnd1a+iWcSNwSphewvI5sn6ymMCinMHeQNgnLr91JzWEpDJPgIvtuXniwGudAS0NfVcOOjd7Dqt29DXrj+SiI+JfMfU2fNBZJNtxLhtzY76R+2vtdUY3e7Wqhr9TO/E14hamOYjdpcHWffTvxJVDgJACDtdr6wPgGiOM9akaWu4aye/fpq6isTWE5hf5B0B9NPTK8jjw4JCtaczJ4wbdhmXB4co4pW4wyZ4zIanlA9i3atvZqwbMuHDPUdr/sQDEAEoCZhQl30su7h3Uu1A6qYiuejsq1Y/M/IbeuW0v6Y7y48WwnlWLOaaUTvXUfNWZspWvbcCEjd0HX4KT+56I9Gd2gzntDEfSJRp+f0pcVSNxwgfncfruWEt2wKhBrVi9030XjbKNxoJdg+cTS5BOSU8kk9S+
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:34.6181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4030ca-e319-449f-e41e-08dc5e6f07f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
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
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  8 ++-
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  5 ++
 drivers/gpu/drm/nouveau/include/nvif/event.h  | 21 +------
 drivers/gpu/drm/nouveau/include/nvif/if000e.h | 26 --------
 drivers/gpu/drm/nouveau/include/nvif/object.h |  3 -
 .../gpu/drm/nouveau/include/nvkm/core/event.h |  1 -
 .../drm/nouveau/include/nvkm/core/object.h    |  6 +-
 .../gpu/drm/nouveau/include/nvkm/core/os.h    |  1 -
 drivers/gpu/drm/nouveau/nvif/event.c          | 46 +-------------
 drivers/gpu/drm/nouveau/nvif/object.c         | 29 ---------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 32 +---------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 13 ----
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    | 62 -------------------
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 13 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c | 14 ++---
 15 files changed, 36 insertions(+), 244 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000e.h

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 3e10ba2ed20f..3d564512b0f6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -236,10 +236,14 @@ nv04_display_create(struct drm_device *dev)
 
 	/* Request page flip completion event. */
 	if (drm->channel) {
-		ret = nvif_event_ctor(&drm->channel->nvsw.object, "kmsFlip", 0, nv04_flip_complete,
-				      true, NULL, 0, &disp->flip);
+		ret = drm->channel->nvsw.impl->event.new(drm->channel->nvsw.priv,
+							 nvif_handle(&disp->flip.object),
+							 &disp->flip.impl, &disp->flip.priv);
 		if (ret)
 			return ret;
+
+		nvif_event_ctor(&drm->channel->nvsw.object, "kmsFlip", 0, nv04_flip_complete,
+				&disp->flip);
 	}
 
 	nouveau_hw_save_vga_fonts(dev, 1);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index d8a30af9eae7..244024c19206 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -435,6 +435,11 @@ struct nvif_disp_impl {
 struct nvif_engobj_impl {
 	void (*del)(struct nvif_engobj_priv *);
 	int (*mthd)(struct nvif_engobj_priv *, u32 mthd, void *argv, u32 argc);
+
+	struct {
+		int (*new)(struct nvif_engobj_priv *, u64 token,
+			   const struct nvif_event_impl **, struct nvif_event_priv **);
+	} event;
 };
 
 struct nvif_chan_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/event.h b/drivers/gpu/drm/nouveau/include/nvif/event.h
index 338082bdc67c..42c2d0b5f66b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/event.h
@@ -2,7 +2,6 @@
 #ifndef __NVIF_EVENT_H__
 #define __NVIF_EVENT_H__
 #include <nvif/object.h>
-#include <nvif/if000e.h>
 struct nvif_event;
 
 #define NVIF_EVENT_KEEP 0
@@ -23,30 +22,14 @@ nvif_event_constructed(struct nvif_event *event)
 	return nvif_object_constructed(&event->object);
 }
 
-int nvif_event_ctor_(struct nvif_object *, const char *, u32, nvif_event_func, bool,
-		     struct nvif_event_v0 *, u32, bool, struct nvif_event *);
-
-static inline int
-nvif_event_ctor_0(struct nvif_object *parent, const char *name, u32 handle, nvif_event_func func,
-		  bool wait, struct nvif_event_v0 *args, u32 argc, struct nvif_event *event)
-{
-	return nvif_event_ctor_(parent, name, handle, func, wait, args, argc, true, event);
-}
-
 static inline void
-nvif_event_ctor_1(struct nvif_object *parent, const char *name, u32 handle,
-		  nvif_event_func func, struct nvif_event *event)
+nvif_event_ctor(struct nvif_object *parent, const char *name, u32 handle,
+		nvif_event_func func, struct nvif_event *event)
 {
 	nvif_object_ctor(parent, name ?: "nvifEvent", handle, 0, &event->object);
 	event->func = func;
 }
 
-#define nvif_event_ctor__(A,B,C,D,E,F,G,H,IMPL,...) IMPL
-#define nvif_event_ctor(A...) nvif_event_ctor__(A, nvif_event_ctor_0, \
-						   nvif_event_ctor__, \
-						   nvif_event_ctor__, \
-						   nvif_event_ctor_1)(A)
-
 void nvif_event_dtor(struct nvif_event *);
 int nvif_event_allow(struct nvif_event *);
 int nvif_event_block(struct nvif_event *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000e.h b/drivers/gpu/drm/nouveau/include/nvif/if000e.h
deleted file mode 100644
index 90a936cb1766..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if000e.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF000E_H__
-#define __NVIF_IF000E_H__
-
-union nvif_event_args {
-	struct nvif_event_v0 {
-		__u8 version;
-		__u8 wait;
-		__u8 pad02[6];
-		__u8 data[];
-	} v0;
-};
-
-#define NVIF_EVENT_V0_ALLOW 0x00
-#define NVIF_EVENT_V0_BLOCK 0x01
-
-union nvif_event_allow_args {
-	struct nvif_event_allow_vn {
-	} vn;
-};
-
-union nvif_event_block_args {
-	struct nvif_event_block_vn {
-	} vn;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 56308333ef86..98a8bba8f0ee 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -40,7 +40,6 @@ void nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle
 
 void nvif_object_dtor(struct nvif_object *);
 int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
-int  nvif_object_mthd(struct nvif_object *, u32, void *, u32);
 int nvif_object_map_cpu(struct nvif_object *, const struct nvif_mapinfo *, struct nvif_map *);
 int nvif_object_unmap_cpu(struct nvif_map *);
 
@@ -67,8 +66,6 @@ int nvif_object_unmap_cpu(struct nvif_map *);
 	_data;                                                                 \
 })
 
-#define nvif_mthd(a,b,c,d) nvif_object_mthd((a), (b), (c), (d))
-
 #define NVIF_RD32_(p,o,dr)   nvif_rd32((p), (o) + (dr))
 #define NVIF_WR32_(p,o,dr,f) nvif_wr32((p), (o) + (dr), (f))
 #define NVIF_RD32(p,A...) DRF_RD(NVIF_RD32_,                  (p), 0, ##A)
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
index f31f0f30732a..76e05c8da979 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
@@ -76,7 +76,6 @@ struct nvif_event_priv;
 int nvkm_uevent_new_(struct nvkm_object *parent, u64 handle, struct nvkm_event *event,
 		     bool wait, int id, u32 bits, nvkm_uevent_func,
 		     const struct nvif_event_impl **, struct nvif_event_priv **);
-int nvkm_uevent_new(const struct nvkm_oclass *, void *argv, u32 argc, struct nvkm_object **);
 int nvkm_uevent_add(struct nvif_event_priv *, struct nvkm_event *, int id, u32 bits,
 		    nvkm_uevent_func);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index 69972b0836e4..de8bf1cc95d8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -4,7 +4,8 @@
 #include <core/oclass.h>
 struct nvkm_event;
 struct nvkm_gpuobj;
-struct nvkm_uevent;
+struct nvif_event_impl;
+struct nvif_event_priv;
 
 struct nvkm_object {
 	const struct nvkm_object_func *func;
@@ -28,7 +29,8 @@ struct nvkm_object_func {
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
 	int (*sclass)(struct nvkm_object *, int index, struct nvkm_oclass *);
-	int (*uevent)(struct nvkm_object *, void *argv, u32 argc, struct nvkm_uevent *);
+	int (*uevent)(struct nvkm_object *, u64 token,
+		      const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
 void nvkm_object_ctor(const struct nvkm_object_func *,
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 9d16413239d4..056f182d9b0b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -31,6 +31,5 @@ nvkm_blob_dtor(struct nvkm_blob *blob)
 #define nvkm_list_foreach(p,h,m,c)                                                           \
 	for (p = nvkm_list_find(p, (h), m, (c)); p; p = nvkm_list_find_next(p, (h), m, (c)))
 
-#define nvkm_uevent nvif_event_priv
 #define nvkm_client nvif_client_priv
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/event.c b/drivers/gpu/drm/nouveau/nvif/event.c
index 5b8ec641703b..2974ec8e13af 100644
--- a/drivers/gpu/drm/nouveau/nvif/event.c
+++ b/drivers/gpu/drm/nouveau/nvif/event.c
@@ -23,20 +23,11 @@
 #include <nvif/driverif.h>
 #include <nvif/printf.h>
 
-#include <nvif/class.h>
-#include <nvif/if000e.h>
-
 int
 nvif_event_block(struct nvif_event *event)
 {
 	int ret;
 
-	if (!event->impl && nvif_event_constructed(event)) {
-		int ret = nvif_mthd(&event->object, NVIF_EVENT_V0_BLOCK, NULL, 0);
-		NVIF_ERRON(ret, &event->object, "[BLOCK]");
-		return ret;
-	}
-
 	if (!event->impl)
 		return 0;
 
@@ -50,12 +41,6 @@ nvif_event_allow(struct nvif_event *event)
 {
 	int ret;
 
-	if (!event->impl && nvif_event_constructed(event)) {
-		int ret = nvif_mthd(&event->object, NVIF_EVENT_V0_ALLOW, NULL, 0);
-		NVIF_ERRON(ret, &event->object, "[ALLOW]");
-		return ret;
-	}
-
 	if (!event->impl)
 		return 0;
 
@@ -67,38 +52,9 @@ nvif_event_allow(struct nvif_event *event)
 void
 nvif_event_dtor(struct nvif_event *event)
 {
-	if (!event->impl) {
-		nvif_object_dtor(&event->object);
+	if (!event->impl)
 		return;
-	}
 
 	event->impl->del(event->priv);
 	event->impl = NULL;
 }
-
-int
-nvif_event_ctor_(struct nvif_object *parent, const char *name, u32 handle, nvif_event_func func,
-		 bool wait, struct nvif_event_v0 *args, u32 argc, bool warn,
-		 struct nvif_event *event)
-{
-	struct nvif_event_v0 _args;
-	int ret;
-
-	if (!args) {
-		args = &_args;
-		argc = sizeof(_args);
-	}
-
-	args->version = 0;
-	args->wait = wait;
-
-	ret = nvif_object_ctor(parent, name ?: "nvifEvent", handle,
-			       NVIF_CLASS_EVENT, args, argc, &event->object);
-	NVIF_ERRON(ret && warn, parent, "[NEW EVENT wait:%d size:%zd]",
-		   args->wait, argc - sizeof(*args));
-	if (ret)
-		return ret;
-
-	event->func = func;
-	return 0;
-}
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 9887241c5200..3379580463e6 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -46,35 +46,6 @@ nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
 	return client->driver->ioctl(client->object.priv, data, size, hack);
 }
 
-int
-nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_mthd_v0 mthd;
-	} *args;
-	u8 stack[128];
-	int ret;
-
-	if (sizeof(*args) + size > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
-			return -ENOMEM;
-	} else {
-		args = (void *)stack;
-	}
-	args->ioctl.version = 0;
-	args->ioctl.type = NVIF_IOCTL_V0_MTHD;
-	args->mthd.version = 0;
-	args->mthd.method = mthd;
-
-	memcpy(args->mthd.data, data, size);
-	ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
-	memcpy(data, args->mthd.data, size);
-	if (args != (void *)stack)
-		kfree(args);
-	return ret;
-}
-
 int
 nvif_object_unmap_cpu(struct nvif_map *map)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index b34ed158aa63..50e9a6d51c05 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -24,7 +24,6 @@
 #include <core/ioctl.h>
 #include <core/client.h>
 #include <core/engine.h>
-#include <core/event.h>
 
 #include <nvif/unpack.h>
 #include <nvif/ioctl.h>
@@ -41,15 +40,6 @@ nvkm_ioctl_nop(struct nvkm_client *client,
 static int
 nvkm_ioctl_sclass_(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
 {
-	if ( object->func->uevent &&
-	    !object->func->uevent(object, NULL, 0, NULL) && index-- == 0) {
-		oclass->ctor = nvkm_uevent_new;
-		oclass->base.minver = 0;
-		oclass->base.maxver = 0;
-		oclass->base.oclass = NVIF_CLASS_EVENT;
-		return 0;
-	}
-
 	if (object->func->sclass)
 		return object->func->sclass(object, index, oclass);
 
@@ -82,7 +72,7 @@ nvkm_ioctl_new(struct nvkm_client *client,
 	} else
 		return ret;
 
-	if (!parent->func->sclass && !parent->func->uevent) {
+	if (!parent->func->sclass) {
 		nvif_ioctl(parent, "cannot have children\n");
 		return -EINVAL;
 	}
@@ -142,25 +132,6 @@ nvkm_ioctl_del(struct nvkm_client *client,
 	return ret ? ret : 1;
 }
 
-static int
-nvkm_ioctl_mthd(struct nvkm_client *client,
-		struct nvkm_object *object, void *data, u32 size)
-{
-	union {
-		struct nvif_ioctl_mthd_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "mthd size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(object, "mthd vers %d mthd %02x\n",
-			   args->v0.version, args->v0.method);
-		ret = nvkm_object_mthd(object, args->v0.method, data, size);
-	}
-
-	return ret;
-}
-
 static struct {
 	int version;
 	int (*func)(struct nvkm_client *, struct nvkm_object *, void *, u32);
@@ -170,7 +141,6 @@ nvkm_ioctl_v0[] = {
 	{ 0x00, nvkm_ioctl_sclass },
 	{ 0x00, nvkm_ioctl_new },
 	{ 0x00, nvkm_ioctl_del },
-	{ 0x00, nvkm_ioctl_mthd },
 };
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 690131104d7b..890532836c03 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,18 +55,6 @@ nvkm_oproxy_sclass(struct nvkm_object *object, int index,
 	return oproxy->object->func->sclass(oproxy->object, index, oclass);
 }
 
-static int
-nvkm_oproxy_uevent(struct nvkm_object *object, void *argv, u32 argc,
-		   struct nvkm_uevent *uevent)
-{
-	struct nvkm_oproxy *oproxy = nvkm_oproxy(object);
-
-	if (!oproxy->object->func->uevent)
-		return -ENOSYS;
-
-	return oproxy->object->func->uevent(oproxy->object, argv, argc, uevent);
-}
-
 static int
 nvkm_oproxy_fini(struct nvkm_object *object, bool suspend)
 {
@@ -142,7 +130,6 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
-	.uevent = nvkm_oproxy_uevent,
 };
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
index d922eebb689c..365e41134f3d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -23,7 +23,6 @@
 #include <core/client.h>
 
 #include <nvif/driverif.h>
-#include <nvif/if000e.h>
 
 struct nvif_event_priv {
 	struct nvkm_object object;
@@ -35,43 +34,6 @@ struct nvif_event_priv {
 	atomic_t allowed;
 };
 
-static int
-nvkm_uevent_mthd_block(struct nvkm_uevent *uevent, union nvif_event_block_args *args, u32 argc)
-{
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-
-	nvkm_event_ntfy_block(&uevent->ntfy);
-	atomic_set(&uevent->allowed, 0);
-	return 0;
-}
-
-static int
-nvkm_uevent_mthd_allow(struct nvkm_uevent *uevent, union nvif_event_allow_args *args, u32 argc)
-{
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-
-	nvkm_event_ntfy_allow(&uevent->ntfy);
-	atomic_set(&uevent->allowed, 1);
-	return 0;
-}
-
-static int
-nvkm_uevent_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvif_event_priv *uevent = container_of(object, typeof(*uevent), object);
-
-	switch (mthd) {
-	case NVIF_EVENT_V0_ALLOW: return nvkm_uevent_mthd_allow(uevent, argv, argc);
-	case NVIF_EVENT_V0_BLOCK: return nvkm_uevent_mthd_block(uevent, argv, argc);
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
 static int
 nvkm_uevent_block(struct nvif_event_priv *uevent)
 {
@@ -138,7 +100,6 @@ nvkm_uevent = {
 	.dtor = nvkm_uevent_dtor,
 	.init = nvkm_uevent_init,
 	.fini = nvkm_uevent_fini,
-	.mthd = nvkm_uevent_mthd,
 };
 
 static int
@@ -165,29 +126,6 @@ nvkm_uevent_add(struct nvif_event_priv *uevent, struct nvkm_event *event, int id
 	return 0;
 }
 
-int
-nvkm_uevent_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		struct nvkm_object **pobject)
-{
-	struct nvkm_object *parent = oclass->parent;
-	struct nvif_event_priv *uevent;
-	union nvif_event_args *args = argv;
-
-	if (argc < sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	if (!(uevent = kzalloc(sizeof(*uevent), GFP_KERNEL)))
-		return -ENOMEM;
-	*pobject = &uevent->object;
-
-	nvkm_object_ctor(&nvkm_uevent, oclass, &uevent->object);
-	uevent->parent = parent;
-	uevent->func = NULL;
-	uevent->wait = args->v0.wait;
-	uevent->ntfy.event = NULL;
-	return parent->func->uevent(parent, &args->v0.data, argc - sizeof(args->v0), uevent);
-}
-
 int
 nvkm_uevent_new_(struct nvkm_object *parent, u64 handle, struct nvkm_event *event,
 		 bool wait, int id, u32 bits, nvkm_uevent_func func,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 6682245e4928..281994235c5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -46,6 +46,18 @@ struct nvkm_uobj {
 	int hash;
 };
 
+static int
+nvkm_uchan_object_event_new(struct nvif_engobj_priv *priv, u64 token,
+			    const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
+{
+	struct nvkm_uobj *uobj = (void *)priv;
+
+	if (!uobj->oproxy.object->func->uevent)
+		return -ENODEV;
+
+	return uobj->oproxy.object->func->uevent(uobj->oproxy.object, token, pimpl, ppriv);
+}
+
 static int
 nvkm_uchan_object_mthd(struct nvif_engobj_priv *priv, u32 mthd, void *argv, u32 argc)
 {
@@ -68,6 +80,7 @@ static const struct nvif_engobj_impl
 nvkm_uchan_object_impl = {
 	.del = nvkm_uchan_object_del,
 	.mthd = nvkm_uchan_object_mthd,
+	.event.new = nvkm_uchan_object_event_new,
 };
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c
index f5affa1c8f34..6786882b5f7f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c
@@ -27,17 +27,11 @@
 #include <nvif/if0004.h>
 
 static int
-nvkm_nvsw_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
+nvkm_nvsw_uevent(struct nvkm_object *object, u64 token,
+		 const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
 {
-	union nv04_nvsw_event_args *args = argv;
-
-	if (!uevent)
-		return 0;
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-
-	return nvkm_uevent_add(uevent, &nvkm_nvsw(object)->chan->event, 0,
-			       NVKM_SW_CHAN_EVENT_PAGE_FLIP, NULL);
+	return nvkm_uevent_new_(object, token, &nvkm_nvsw(object)->chan->event, true, 0,
+				NVKM_SW_CHAN_EVENT_PAGE_FLIP, NULL, pimpl, ppriv);
 }
 
 static int
-- 
2.41.0

