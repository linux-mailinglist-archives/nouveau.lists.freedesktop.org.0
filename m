Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891728A78F9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15FB112F71;
	Tue, 16 Apr 2024 23:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FgV0pcPc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04577112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQjOwYN7UpSGct48GWGE32XLf6cRB0q3w+iGRNwecnnzQGWUi9sFPJvN5SlA8K5qmdEvEPQF3LhwclNrPCfDTwCKq2jjEg1escEZHSHV0kxaaG1dzh81cJ4JiaIfn+4h3e+3Y8T0CjoOPv9GMIZL+RCke6oVVH6ABeQg3xY1OoWkMkhYwa58tB5d0aBd0Xz3b12MYAJ8/Y/1xXMM2MgX6bmPG/8j8q7PWy2JWiViQjqIErvyhNGVdfQtm9xAENP1Gu3gBjubzjYRzWglhPKP50i7LX2lQGYOKTA2G4OtqzDkgNlHr97nGKd9uGs1yu5FntUSuFNnVE5vqzlnzA+42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+YT/ljQEzuguAgi1rKaBBijV5mbDeJiC0NG3MRZB+o=;
 b=KagcPSL5D5vHsHwn+YJEWCu0zmmeCDiBN5AjHYIwZajsLOQog+hYffYf3d6i59ISTYILgvZttMZNR+swplYWkd6R2jnQbS4Gjpd+W+nKMNxQvy182UESt1WxbieBeW4TAje+acGehn6qDLiyfZ3tdmq3BPs8g6+c6lOtlJrbBFleumQv8f8jIcXGq/5WW4OFHkr2WLQtRFTFpXccXUoEgPYG2f7o5l8NA6Zm9JygZSsDe7DUs0pjHeMwC0WFwJZcKTRabJYDB246LcV9VJI4WwnnXlkPRr2/uu9DXRUE5S4fM3Q4j1cTZ6zT+EFkd31+drmEc+ryzY+bYHl7tKH0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+YT/ljQEzuguAgi1rKaBBijV5mbDeJiC0NG3MRZB+o=;
 b=FgV0pcPcbbp0Kg+n2IA6Zt0KaB0tqF9AzTTZsrB4+YyhpPdJJ1BQ3YcCQCxgWqAMwA8pvNDGkwRczx7hjwUjxY65mwMridrcR3jbpJOe9PFKWuPqbHtTtb2GuuL6JzChpj+A0V6/y9ipKmReH8LtjcV4p5bkPx0YExs5/lxMDOxaynXISnvMVw37J0uqEym0s+2OWOJ6TokgJfQAqeszGPtnbtofMpsTxT3RRq8rna1SeObePATzHmMzKG8dK5c0um0R952iTHBEX7uHS9ybaGMv3hd37/pyHsbCQZAI53LMC+Cd30XI1iF3MER9fov0+oJg5GpJensCWCKsG4LLzw==
Received: from DS7PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:3bb::6) by
 LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:42:11 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::58) by DS7PR03CA0061.outlook.office365.com
 (2603:10b6:5:3bb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:48 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 068/156] drm/nouveau/nvif: rework device "info v1" api
Date: Wed, 17 Apr 2024 09:38:34 +1000
Message-ID: <20240416234002.19509-69-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd2faba-f771-4bea-fc4b-08dc5e6ed625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jDFjH0bLqtjtqz8kGF8lTI37NqcE/2DQnhL2RpSZ6A12XU8PjBIZLnhj9hdv9JXv6f6fGo697nzCzC4mZU3chuQX2ovtX4ujGxuniFW3Uxg62Qvbgob5DFDsIodLXE7dMahmOmxSMAu+xs6BIihzz9RA6+1uAAsYjIeXeo+yo/nu0ASKZFq5HjstzT1+cnrx9XkapYTVk5OW2/mayHOhf2JnH63+ASjNV14aj1U2EZ2+B5dLkyJwqfU62neK8s/JoZ/10+xXYCgaUpbgP+KK6JnSpR88UIqU3BNglOWh0gn7M2gGbvbwtDBDOnChCYD+mbAt1bsyhxZQ2u7ntmRq5YBERNOaS6qG+ORtn/B4uB4lybvPlLqk1cJ7ICYhIP/jXF/MccLzfuge2qAmfTW+2trG+tAoHvS7bZ5ZocZNHKK40D5tOwlcK8B66gzvaRhFe0rzDBQpHOz9kWPnUZ019zkbh9oLRWF4q0ocBcsuaV65cPga2TObOTBJoTXbA1aVTiYGOxsTs2KDexnap/zQOOwgKLHgIU2wZnMU2rRMylcpplPsZ6m6IeLmazqGe4xf07fLTis0ETYKSJGmSWRCl2K3tQbIs9MWKaCMEdu5TrXcx7Cz+jYQgPQAoTG5s1IIlCdPgyi5qR3U1ZfaWmyhMpw0Rf9xaudcrGXDZg3nfHkQS3nNRU+6Dd83IRtuXYiaK/jDMiH8UU5yg0OLLSCVehpAR4yILtslejTDzsRacMjyAPp1gQVaQ7PrphfHSHQ
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:11.0276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd2faba-f771-4bea-fc4b-08dc5e6ed625
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 46 ---------
 drivers/gpu/drm/nouveau/include/nvif/device.h |  5 -
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 43 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/fifo.h   |  9 +-
 .../drm/nouveau/include/nvkm/core/subdev.h    |  2 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 14 +--
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 43 ++------
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  7 +-
 drivers/gpu/drm/nouveau/nvif/device.c         |  4 -
 drivers/gpu/drm/nouveau/nvif/fifo.c           | 65 ++----------
 drivers/gpu/drm/nouveau/nvkm/core/engine.c    | 12 ---
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |  8 --
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 58 -----------
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 73 --------------
 .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c  | 99 +++++++++++++++++++
 15 files changed, 174 insertions(+), 314 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index ea937fa7bc55..f1684dbd8e3b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -37,55 +37,9 @@ struct nv_device_info_v0 {
 	char  name[64];
 };
 
-struct nv_device_info_v1 {
-	__u8  version;
-	__u8  count;
-	__u8  pad02[6];
-	struct nv_device_info_v1_data {
-		__u64 mthd; /* NV_DEVICE_INFO_* (see below). */
-		__u64 data;
-	} data[];
-};
-
 struct nv_device_time_v0 {
 	__u8  version;
 	__u8  pad01[7];
 	__u64 time;
 };
-
-#define NV_DEVICE_INFO_UNIT                               (0xffffffffULL << 32)
-#define NV_DEVICE_INFO(n)                          ((n) | (0x00000000ULL << 32))
-#define NV_DEVICE_HOST(n)                          ((n) | (0x00000001ULL << 32))
-
-/* This will be returned in the mthd field for unsupported queries. */
-#define NV_DEVICE_INFO_INVALID                                           ~0ULL
-
-/* Returns the number of available runlists. */
-#define NV_DEVICE_HOST_RUNLISTS                       NV_DEVICE_HOST(0x00000000)
-/* Returns the number of available channels (0 if per-runlist). */
-#define NV_DEVICE_HOST_CHANNELS                       NV_DEVICE_HOST(0x00000001)
-
-/* Returns a mask of available engine types on runlist(data). */
-#define NV_DEVICE_HOST_RUNLIST_ENGINES                NV_DEVICE_HOST(0x00000100)
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_SW                            0x00000001
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_GR                            0x00000002
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_MPEG                          0x00000004
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_ME                            0x00000008
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_CIPHER                        0x00000010
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_BSP                           0x00000020
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_VP                            0x00000040
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_CE                            0x00000080
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_SEC                           0x00000100
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD                         0x00000200
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC                        0x00000400
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP                         0x00000800
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_MSENC                         0x00001000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_VIC                           0x00002000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_SEC2                          0x00004000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC                         0x00008000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_NVENC                         0x00010000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_NVJPG                         0x00020000
-#define NV_DEVICE_HOST_RUNLIST_ENGINES_OFA                           0x00040000
-/* Returns the number of available channels on runlist(data). */
-#define NV_DEVICE_HOST_RUNLIST_CHANNELS               NV_DEVICE_HOST(0x00000101)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index 27526d5811cf..fa8402e575da 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -14,11 +14,6 @@ struct nvif_device {
 
 	struct nv_device_info_v0 info;
 
-	struct nvif_fifo_runlist {
-		u64 engines;
-	} *runlist;
-	int runlists;
-
 	struct nvif_user user;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 6152eabd4352..54446d38cb91 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -78,6 +78,49 @@ struct nvif_device_impl {
 	} disp;
 
 	struct nvif_device_impl_fifo {
+		u8  engine_nr;
+		u8  runl_nr;
+		u16 chan_nr; /* 0 == per-runlist */
+
+		struct nvif_device_impl_engine {
+			enum nvif_engine_type {
+				NVIF_ENGINE_SW,
+				NVIF_ENGINE_GR,
+				NVIF_ENGINE_MPEG,
+				NVIF_ENGINE_ME,
+				NVIF_ENGINE_CIPHER,
+				NVIF_ENGINE_BSP,
+				NVIF_ENGINE_VP,
+				NVIF_ENGINE_CE,
+				NVIF_ENGINE_SEC,
+				NVIF_ENGINE_MSVLD,
+				NVIF_ENGINE_MSPDEC,
+				NVIF_ENGINE_MSPPP,
+				NVIF_ENGINE_MSENC,
+				NVIF_ENGINE_VIC,
+				NVIF_ENGINE_SEC2,
+				NVIF_ENGINE_NVDEC,
+				NVIF_ENGINE_NVENC,
+				NVIF_ENGINE_NVJPG,
+				NVIF_ENGINE_OFA,
+			} type;
+
+			u8  oclass_nr;
+			s32 oclass[64];
+		} engine[8];
+
+		struct nvif_device_impl_runl {
+			u8  id;
+			u16 chan_nr;
+			u8  runq_nr;
+			u8  engn_nr;
+
+			struct {
+				u8 engine;
+				u8 inst;
+			} engn[8];
+		} runl[64];
+
 		struct {
 			s32 oclass;
 		} cgrp;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/fifo.h b/drivers/gpu/drm/nouveau/include/nvif/fifo.h
index d351ac890ca1..4e9663848291 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/fifo.h
@@ -1,16 +1,17 @@
 #ifndef __NVIF_FIFO_H__
 #define __NVIF_FIFO_H__
 #include <nvif/device.h>
+#include <nvif/driverif.h>
 
-/* Returns mask of runlists that support a NV_DEVICE_INFO_RUNLIST_ENGINES_* type. */
-u64 nvif_fifo_runlist(struct nvif_device *, u64 engine);
+/* Returns mask of runlists that support a NVIF_ENGINE_* type. */
+u64 nvif_fifo_runlist(struct nvif_device *, enum nvif_engine_type);
 
 /* CE-supporting runlists (excluding GRCE, if others exist). */
 static inline u64
 nvif_fifo_runlist_ce(struct nvif_device *device)
 {
-	u64 runmgr = nvif_fifo_runlist(device, NV_DEVICE_HOST_RUNLIST_ENGINES_GR);
-	u64 runmce = nvif_fifo_runlist(device, NV_DEVICE_HOST_RUNLIST_ENGINES_CE);
+	u64 runmgr = nvif_fifo_runlist(device, NVIF_ENGINE_GR);
+	u64 runmce = nvif_fifo_runlist(device, NVIF_ENGINE_CE);
 	if (runmce && !(runmce &= ~runmgr))
 		runmce = runmgr;
 	return runmce;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index bce6e1ba09ea..3bce2077072b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -38,7 +38,6 @@ struct nvkm_subdev_func {
 	void *(*dtor)(struct nvkm_subdev *);
 	int (*preinit)(struct nvkm_subdev *);
 	int (*oneinit)(struct nvkm_subdev *);
-	int (*info)(struct nvkm_subdev *, u64 mthd, u64 *data);
 	int (*init)(struct nvkm_subdev *);
 	int (*fini)(struct nvkm_subdev *, bool suspend);
 	void (*intr)(struct nvkm_subdev *);
@@ -66,7 +65,6 @@ int  nvkm_subdev_preinit(struct nvkm_subdev *);
 int  nvkm_subdev_oneinit(struct nvkm_subdev *);
 int  nvkm_subdev_init(struct nvkm_subdev *);
 int  nvkm_subdev_fini(struct nvkm_subdev *, bool suspend);
-int  nvkm_subdev_info(struct nvkm_subdev *, u64, u64 *);
 void nvkm_subdev_intr(struct nvkm_subdev *);
 
 /* subdev logging */
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 23f8b448a30a..fdbc982ea566 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -338,26 +338,26 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	__nouveau_cli_disable_uvmm_noinit(cli);
 
-	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
+	engine = NVIF_ENGINE_GR;
 
 	/* hack to allow channel engine type specification on kepler */
 	if (device->info.family >= NV_DEVICE_INFO_V0_KEPLER) {
 		if (init->fb_ctxdma_handle == ~0) {
 			switch (init->tt_ctxdma_handle) {
 			case NOUVEAU_FIFO_ENGINE_GR:
-				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
+				engine = NVIF_ENGINE_GR;
 				break;
 			case NOUVEAU_FIFO_ENGINE_VP:
-				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC;
+				engine = NVIF_ENGINE_MSPDEC;
 				break;
 			case NOUVEAU_FIFO_ENGINE_PPP:
-				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP;
+				engine = NVIF_ENGINE_MSPPP;
 				break;
 			case NOUVEAU_FIFO_ENGINE_BSP:
-				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD;
+				engine = NVIF_ENGINE_MSVLD;
 				break;
 			case NOUVEAU_FIFO_ENGINE_CE:
-				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE;
+				engine = NVIF_ENGINE_CE;
 				break;
 			default:
 				return nouveau_abi16_put(abi16, -ENOSYS);
@@ -368,7 +368,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 		}
 	}
 
-	if (engine != NV_DEVICE_HOST_RUNLIST_ENGINES_CE)
+	if (engine != NVIF_ENGINE_CE)
 		runm = nvif_fifo_runlist(device, engine);
 	else
 		runm = nvif_fifo_runlist_ce(device);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f9592eb0a47b..636ca1f284f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -300,10 +300,12 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (ret)
 		return ret;
 
+	chan->runlist = __ffs64(runm);
+
 	/* create channel object */
 	args.chan.version = 0;
 	args.chan.namelen = sizeof(args.name);
-	args.chan.runlist = __ffs64(runm);
+	args.chan.runlist = cli->drm->device.impl->fifo.runl[chan->runlist].id;
 	args.chan.runq = 0;
 	args.chan.priv = priv;
 	args.chan.devm = BIT(0);
@@ -350,7 +352,6 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		return ret;
 	}
 
-	chan->runlist = args.chan.runlist;
 	chan->chid = args.chan.chid;
 	chan->inst = args.chan.inst;
 	chan->token = args.chan.token;
@@ -523,46 +524,18 @@ nouveau_channels_fini(struct nouveau_drm *drm)
 int
 nouveau_channels_init(struct nouveau_drm *drm)
 {
-	struct {
-		struct nv_device_info_v1 m;
-		struct {
-			struct nv_device_info_v1_data channels;
-			struct nv_device_info_v1_data runlists;
-		} v;
-	} args = {
-		.m.version = 1,
-		.m.count = sizeof(args.v) / sizeof(args.v.channels),
-		.v.channels.mthd = NV_DEVICE_HOST_CHANNELS,
-		.v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS,
-	};
-	struct nvif_object *device = &drm->client.device.object;
-	int ret, i;
-
-	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
-	if (ret ||
-	    args.v.runlists.mthd == NV_DEVICE_INFO_INVALID || !args.v.runlists.data ||
-	    args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
-		return -ENODEV;
+	struct nvif_device *device = &drm->device;
+	int i;
 
-	drm->chan_nr = drm->chan_total = args.v.channels.data;
-	drm->runl_nr = fls64(args.v.runlists.data);
+	drm->chan_nr = drm->chan_total = device->impl->fifo.chan_nr;
+	drm->runl_nr = device->impl->fifo.runl_nr;
 	drm->runl = kcalloc(drm->runl_nr, sizeof(*drm->runl), GFP_KERNEL);
 	if (!drm->runl)
 		return -ENOMEM;
 
 	if (drm->chan_nr == 0) {
 		for (i = 0; i < drm->runl_nr; i++) {
-			if (!(args.v.runlists.data & BIT(i)))
-				continue;
-
-			args.v.channels.mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
-			args.v.channels.data = i;
-
-			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
-			if (ret || args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
-				return -ENODEV;
-
-			drm->runl[i].chan_nr = args.v.channels.data;
+			drm->runl[i].chan_nr = device->impl->fifo.runl[i].chan_nr;
 			drm->runl[i].chan_id_base = drm->chan_total;
 			drm->runl[i].context_base = dma_fence_context_alloc(drm->runl[i].chan_nr);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a37e08f0fd77..76990dde1b6a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -295,14 +295,13 @@ nouveau_accel_ce_fini(struct nouveau_drm *drm)
 static void
 nouveau_accel_ce_init(struct nouveau_drm *drm)
 {
-	struct nvif_device *device = &drm->client.device;
 	u64 runm;
 	int ret = 0;
 
 	/* Allocate channel that has access to a (preferably async) copy
 	 * engine, to use for TTM buffer moves.
 	 */
-	runm = nvif_fifo_runlist_ce(device);
+	runm = nvif_fifo_runlist_ce(&drm->device);
 	if (!runm) {
 		NV_DEBUG(drm, "no ce runlist\n");
 		return;
@@ -325,12 +324,12 @@ nouveau_accel_gr_fini(struct nouveau_drm *drm)
 static void
 nouveau_accel_gr_init(struct nouveau_drm *drm)
 {
-	struct nvif_device *device = &drm->client.device;
+	struct nvif_device *device = &drm->device;
 	u64 runm;
 	int ret;
 
 	/* Allocate channel that has access to the graphics engine. */
-	runm = nvif_fifo_runlist(device, NV_DEVICE_HOST_RUNLIST_ENGINES_GR);
+	runm = nvif_fifo_runlist(device, NVIF_ENGINE_GR);
 	if (!runm) {
 		NV_DEBUG(drm, "no gr runlist\n");
 		return;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 7c28f9764936..d4d00a757cd0 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -53,9 +53,6 @@ nvif_device_dtor(struct nvif_device *device)
 
 	nvif_user_dtor(device);
 
-	kfree(device->runlist);
-	device->runlist = NULL;
-
 	nvif_object_unmap_cpu(&device->map);
 
 	device->impl->del(device->priv);
@@ -67,7 +64,6 @@ nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_devic
 {
 	int ret;
 
-	device->runlist = NULL;
 	device->user.func = NULL;
 
 	ret = client->impl->device.new(client->priv, &device->impl, &device->priv,
diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
index a463289962b2..34e6fec0f0a3 100644
--- a/drivers/gpu/drm/nouveau/nvif/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
@@ -21,66 +21,19 @@
  */
 #include <nvif/fifo.h>
 
-static int
-nvif_fifo_runlists(struct nvif_device *device)
-{
-	struct nvif_object *object = &device->object;
-	struct {
-		struct nv_device_info_v1 m;
-		struct {
-			struct nv_device_info_v1_data runlists;
-			struct nv_device_info_v1_data runlist[64];
-		} v;
-	} *a;
-	int ret, i;
-
-	if (device->runlist)
-		return 0;
-
-	if (!(a = kmalloc(sizeof(*a), GFP_KERNEL)))
-		return -ENOMEM;
-	a->m.version = 1;
-	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
-	a->v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS;
-	for (i = 0; i < ARRAY_SIZE(a->v.runlist); i++) {
-		a->v.runlist[i].mthd = NV_DEVICE_HOST_RUNLIST_ENGINES;
-		a->v.runlist[i].data = i;
-	}
-
-	ret = nvif_object_mthd(object, NV_DEVICE_V0_INFO, a, sizeof(*a));
-	if (ret)
-		goto done;
-
-	device->runlists = fls64(a->v.runlists.data);
-	device->runlist = kcalloc(device->runlists, sizeof(*device->runlist),
-				  GFP_KERNEL);
-	if (!device->runlist) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	for (i = 0; i < device->runlists; i++) {
-		if (a->v.runlist[i].mthd != NV_DEVICE_INFO_INVALID)
-			device->runlist[i].engines = a->v.runlist[i].data;
-	}
-
-done:
-	kfree(a);
-	return ret;
-}
-
 u64
-nvif_fifo_runlist(struct nvif_device *device, u64 engine)
+nvif_fifo_runlist(struct nvif_device *device, enum nvif_engine_type type)
 {
+	const struct nvif_device_impl_fifo *impl = &device->impl->fifo;
 	u64 runm = 0;
-	int ret, i;
-
-	if ((ret = nvif_fifo_runlists(device)))
-		return runm;
 
-	for (i = 0; i < device->runlists; i++) {
-		if (device->runlist[i].engines & engine)
-			runm |= BIT_ULL(i);
+	for (int i = 0; i < impl->runl_nr; i++) {
+		for (int j = 0; j < impl->runl[i].engn_nr; j++) {
+			if (impl->engine[impl->runl[i].engn[j].engine].type == type) {
+				runm |= BIT_ULL(i);
+				continue;
+			}
+		}
 	}
 
 	return runm;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/engine.c b/drivers/gpu/drm/nouveau/nvkm/core/engine.c
index 36a31e9eea22..7d59a1d43a5b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/engine.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/engine.c
@@ -86,17 +86,6 @@ nvkm_engine_intr(struct nvkm_subdev *subdev)
 		engine->func->intr(engine);
 }
 
-static int
-nvkm_engine_info(struct nvkm_subdev *subdev, u64 mthd, u64 *data)
-{
-	struct nvkm_engine *engine = nvkm_engine(subdev);
-
-	if (engine->func->info)
-		return engine->func->info(engine, mthd, data);
-
-	return -ENOSYS;
-}
-
 static int
 nvkm_engine_fini(struct nvkm_subdev *subdev, bool suspend)
 {
@@ -157,7 +146,6 @@ nvkm_engine = {
 	.oneinit = nvkm_engine_oneinit,
 	.init = nvkm_engine_init,
 	.fini = nvkm_engine_fini,
-	.info = nvkm_engine_info,
 	.intr = nvkm_engine_intr,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
index 6c20e827a069..d8b6d0f31883 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -42,14 +42,6 @@ nvkm_subdev_intr(struct nvkm_subdev *subdev)
 		subdev->func->intr(subdev);
 }
 
-int
-nvkm_subdev_info(struct nvkm_subdev *subdev, u64 mthd, u64 *data)
-{
-	if (subdev->func->info)
-		return subdev->func->info(subdev, mthd, data);
-	return -ENOSYS;
-}
-
 int
 nvkm_subdev_fini(struct nvkm_subdev *subdev, bool suspend)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 589cb31853e6..26ce50fc2aac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -45,62 +45,6 @@ struct nvif_device_priv {
 	struct nvif_device_impl impl;
 };
 
-static int
-nvkm_udevice_info_subdev(struct nvkm_device *device, u64 mthd, u64 *data)
-{
-	struct nvkm_subdev *subdev;
-	enum nvkm_subdev_type type;
-
-	switch (mthd & NV_DEVICE_INFO_UNIT) {
-	case NV_DEVICE_HOST(0): type = NVKM_ENGINE_FIFO; break;
-	default:
-		return -EINVAL;
-	}
-
-	subdev = nvkm_device_subdev(device, type, 0);
-	if (subdev)
-		return nvkm_subdev_info(subdev, mthd, data);
-	return -ENODEV;
-}
-
-static void
-nvkm_udevice_info_v1(struct nvkm_device *device,
-		     struct nv_device_info_v1_data *args)
-{
-	if (args->mthd & NV_DEVICE_INFO_UNIT) {
-		if (nvkm_udevice_info_subdev(device, args->mthd, &args->data))
-			args->mthd = NV_DEVICE_INFO_INVALID;
-		return;
-	}
-	args->mthd = NV_DEVICE_INFO_INVALID;
-}
-
-static int
-nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
-{
-	struct nvkm_object *object = &udev->object;
-	struct nvkm_device *device = udev->device;
-	union {
-		struct nv_device_info_v1 v1;
-	} *args = data;
-	int ret = -ENOSYS, i;
-
-	nvif_ioctl(object, "device info size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v1, 1, 1, true))) {
-		nvif_ioctl(object, "device info vers %d count %d\n",
-			   args->v1.version, args->v1.count);
-		if (args->v1.count * sizeof(args->v1.data[0]) == size) {
-			for (i = 0; i < args->v1.count; i++)
-				nvkm_udevice_info_v1(device, &args->v1.data[i]);
-			return 0;
-		}
-		return -EINVAL;
-	} else
-		return ret;
-
-	return 0;
-}
-
 static int
 nvkm_udevice_time(struct nvkm_udevice *udev, void *data, u32 size)
 {
@@ -140,8 +84,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	nvif_ioctl(object, "device mthd %08x\n", mthd);
 	switch (mthd) {
-	case NV_DEVICE_V0_INFO:
-		return nvkm_udevice_info(udev, data, size);
 	case NV_DEVICE_V0_TIME:
 		return nvkm_udevice_time(udev, data, size);
 	default:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 22443fe4a39f..6bd464da1c96 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -165,78 +165,6 @@ nvkm_fifo_init(struct nvkm_engine *engine)
 	return 0;
 }
 
-static int
-nvkm_fifo_info(struct nvkm_engine *engine, u64 mthd, u64 *data)
-{
-	struct nvkm_fifo *fifo = nvkm_fifo(engine);
-	struct nvkm_runl *runl;
-	struct nvkm_engn *engn;
-	int ret;
-
-	ret = nvkm_subdev_oneinit(&fifo->engine.subdev);
-	if (ret)
-		return ret;
-
-	switch (mthd) {
-	case NV_DEVICE_HOST_CHANNELS: *data = fifo->chid ? fifo->chid->nr : 0; return 0;
-	case NV_DEVICE_HOST_RUNLISTS:
-		*data = 0;
-		nvkm_runl_foreach(runl, fifo)
-			*data |= BIT(runl->id);
-		return 0;
-	case NV_DEVICE_HOST_RUNLIST_ENGINES:
-		runl = nvkm_runl_get(fifo, *data, 0);
-		if (runl) {
-			*data = 0;
-			nvkm_runl_foreach_engn(engn, runl) {
-#define CASE(n) case NVKM_ENGINE_##n: *data |= NV_DEVICE_HOST_RUNLIST_ENGINES_##n; break
-				switch (engn->engine->subdev.type) {
-				case NVKM_ENGINE_DMAOBJ:
-					break;
-				CASE(SW    );
-				CASE(GR    );
-				CASE(MPEG  );
-				CASE(ME    );
-				CASE(CIPHER);
-				CASE(BSP   );
-				CASE(VP    );
-				CASE(CE    );
-				CASE(SEC   );
-				CASE(MSVLD );
-				CASE(MSPDEC);
-				CASE(MSPPP );
-				CASE(MSENC );
-				CASE(VIC   );
-				CASE(SEC2  );
-				CASE(NVDEC );
-				CASE(NVENC );
-				CASE(NVJPG );
-				CASE(OFA   );
-				default:
-					WARN_ON(1);
-					break;
-				}
-#undef CASE
-			}
-			return 0;
-		}
-		return -EINVAL;
-	case NV_DEVICE_HOST_RUNLIST_CHANNELS:
-		if (!fifo->chid) {
-			runl = nvkm_runl_get(fifo, *data, 0);
-			if (runl) {
-				*data = runl->chid->nr;
-				return 0;
-			}
-		}
-		return -EINVAL;
-	default:
-		break;
-	}
-
-	return -ENOSYS;
-}
-
 static int
 nvkm_fifo_oneinit(struct nvkm_engine *engine)
 {
@@ -365,7 +293,6 @@ nvkm_fifo = {
 	.dtor = nvkm_fifo_dtor,
 	.preinit = nvkm_fifo_preinit,
 	.oneinit = nvkm_fifo_oneinit,
-	.info = nvkm_fifo_info,
 	.init = nvkm_fifo_init,
 	.fini = nvkm_fifo_fini,
 	.base.sclass = nvkm_fifo_class_get,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
index 3f0bd70f614e..46f60eb0f122 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
@@ -20,11 +20,110 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include "ufifo.h"
+#include "chid.h"
 #include "priv.h"
+#include "runl.h"
 
 void
 nvkm_ufifo_ctor(struct nvkm_fifo *fifo, struct nvif_device_impl_fifo *impl)
 {
+	struct nvkm_runl *runl;
+	struct nvkm_engn *engn;
+	int runi = 0;
+
+	nvkm_runl_foreach(runl, fifo) {
+		bool failed_engines = false;
+		int engi = 0;
+
+		nvkm_runl_foreach_engn(engn, runl) {
+			struct nvkm_engine *engine = engn->engine;
+			enum nvif_engine_type type;
+			int i;
+
+			switch (engine->subdev.type) {
+			case NVKM_ENGINE_SW    : type = NVIF_ENGINE_SW; break;
+			case NVKM_ENGINE_GR    : type = NVIF_ENGINE_GR; break;
+			case NVKM_ENGINE_MPEG  : type = NVIF_ENGINE_MPEG; break;
+			case NVKM_ENGINE_ME    : type = NVIF_ENGINE_ME; break;
+			case NVKM_ENGINE_CIPHER: type = NVIF_ENGINE_CIPHER; break;
+			case NVKM_ENGINE_BSP   : type = NVIF_ENGINE_BSP; break;
+			case NVKM_ENGINE_VP    : type = NVIF_ENGINE_VP; break;
+			case NVKM_ENGINE_CE    : type = NVIF_ENGINE_CE; break;
+			case NVKM_ENGINE_SEC   : type = NVIF_ENGINE_SEC; break;
+			case NVKM_ENGINE_MSVLD : type = NVIF_ENGINE_MSVLD; break;
+			case NVKM_ENGINE_MSPDEC: type = NVIF_ENGINE_MSPDEC; break;
+			case NVKM_ENGINE_MSPPP : type = NVIF_ENGINE_MSPPP; break;
+			case NVKM_ENGINE_MSENC : type = NVIF_ENGINE_MSENC; break;
+			case NVKM_ENGINE_VIC   : type = NVIF_ENGINE_VIC; break;
+			case NVKM_ENGINE_SEC2  : type = NVIF_ENGINE_SEC2; break;
+			case NVKM_ENGINE_NVDEC : type = NVIF_ENGINE_NVDEC; break;
+			case NVKM_ENGINE_NVENC : type = NVIF_ENGINE_NVENC; break;
+			case NVKM_ENGINE_NVJPG : type = NVIF_ENGINE_NVJPG; break;
+			case NVKM_ENGINE_OFA   : type = NVIF_ENGINE_OFA; break;
+			default:
+				failed_engines = true;
+				WARN_ON(1);
+				continue;
+			}
+
+			for (i = 0; i < impl->engine_nr; i++) {
+				if (impl->engine[i].type == type)
+					break;
+			}
+
+			if (i == impl->engine_nr) {
+				int clsi = 0;
+
+				if (WARN_ON(i >= ARRAY_SIZE(impl->engine))) {
+					failed_engines = true;
+					break;
+				}
+
+				impl->engine[i].type = type;
+				impl->engine_nr++;
+
+				for (;;) {
+					struct nvkm_oclass oclass = { .engine = engine };
+
+					if (engine->func->fifo.sclass)
+						engine->func->fifo.sclass(&oclass, clsi);
+					else
+						oclass.base = engine->func->sclass[clsi];
+					if (!oclass.base.oclass)
+						break;
+
+					if (WARN_ON(clsi >= ARRAY_SIZE(impl->engine[i].oclass)))
+						break;
+
+					impl->engine[i].oclass[clsi++] = oclass.base.oclass;
+				}
+
+				impl->engine[i].oclass_nr = clsi;
+			}
+
+			engi = impl->runl[runi].engn_nr;
+
+			if (WARN_ON(engi >= ARRAY_SIZE(impl->runl[runi].engn))) {
+				failed_engines = true;
+				break;
+			}
+
+			impl->runl[runi].engn[engi].engine = i;
+			impl->runl[runi].engn[engi].inst = engine->subdev.inst;
+			impl->runl[runi].engn_nr = ++engi;
+		}
+
+		if (failed_engines ||
+		    WARN_ON(runi >= ARRAY_SIZE(impl->runl)))
+			continue;
+
+		impl->runl[runi].id = runl->id;
+		impl->runl[runi].chan_nr = runl->chid->nr;
+		impl->runl[runi].runq_nr = runl->runq_nr;
+		impl->runl[runi].engn_nr = engi;
+		impl->runl_nr = ++runi;
+	}
+
 	impl->cgrp.oclass = fifo->func->cgrp.user.oclass;
 	impl->chan.oclass = fifo->func->chan.user.oclass;
 }
-- 
2.41.0

