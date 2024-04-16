Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5878A78F5
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D07112F6E;
	Tue, 16 Apr 2024 23:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TnujIfDc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4606F112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0YWtoDIkawV83/2sA0JkxALMU9fUf1QEsAvQcIJd/WxXT9JklK5emx7eD4klmhCXNPMUIAwVqrreAKSRnLIC6RC6qMt7LP2Cao3X5yTd0PN0Mk0vEwXETqIefF4cl3lPCp30dxlDNhOPNpxiDUddG0bw3cmFwONQd6pbfVO1s8ADdET7QMjgFV2kxzkrBn0BmotHNeaJJ6nhGhZ02Faf1HKxQRAPSwOTLDbKVJMdMvNCnP02+BN/DTsP2DgeSUhiWPx5FU1POfjSy5Iwi/RaA3gHF6LWbYoikQ/m+BmRBjWpiLQ0HG6mZJa4Exe18fU/75+1IfP4Ani88QhMBD3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGc1BLGzSRHhdB5DU4c4GEhATPg/Knz4eUkYZRexP6w=;
 b=ifGH6AZyN8pyA5HTrVFBrgWwInNt2V5cr6Ee4etbUeb6XbIFF+Lg/PHw4LnkYf+wvJN2RohbVYMu8T/0IfzzjV8PfmfPHnqEnZ5BGcSjyINwmePwuIRLKweO0CoyqRtEIxdUt7hHH/xFs5n8xR92fiSPu15wQpw0hGW1uRWfbYe+A0i9HocCVzifOKxVYAtdZXpuRHB5D0YP86vi8lHSrpmKQySZ+kqsIh4bL0jBMxPO4h4Gzwz/Sfuv9gVwQDpGWyZjGlZ099p2atzLTp/ZqXC6k4QdOnN+yW0DDQaXBVeAaHAv1PPEzALEhNpGRPhz8uviCk//M+TUzO9uoD1JOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGc1BLGzSRHhdB5DU4c4GEhATPg/Knz4eUkYZRexP6w=;
 b=TnujIfDcRisUeY2cphImipKYSnH4jmwrJQOLUYrXCsBpJtOaJdwZeStsQ/22Ka0gJsqnQFMTxmARvDU22/itIPKDDUmLzTDPUSVE8Zo0k+mDB7wNmqdRgwrfdQF/hBAs7UlV2uQAgjxqydDbc+d7f2XJzHUIsGnp+7nc2MXJWprg26TnojOKwj0PLSfJ740nUBJyoUXskoP4mzEYmW5rZbz+hKnP629Yf5U9PkHGRNdfIJvjZKnhD2SdJH3UaVbErGgsU704BZq0yL4E1VdDg1xAeHErmwevstFhejZJM/MtheP2Y66IsjvrX/mUbHQgK9wr7zofpyh6lvjAbVcHIg==
Received: from DM6PR12CA0016.namprd12.prod.outlook.com (2603:10b6:5:1c0::29)
 by CY8PR12MB7612.namprd12.prod.outlook.com (2603:10b6:930:9c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:09 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::56) by DM6PR12CA0016.outlook.office365.com
 (2603:10b6:5:1c0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:09 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:49 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 069/156] drm/nouveau/nvif: rework device "time" api
Date: Wed, 17 Apr 2024 09:38:35 +1000
Message-ID: <20240416234002.19509-70-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY8PR12MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: c23405e2-7fd4-4825-0074-08dc5e6ed4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72weU14qam6kv6wn3byGhU8dlvZDV83fSvyZeir6OnrLg9lflFyiMdiGEGRVqVrqwSiAknBZA9IzzPgH+gO2kRWrxaqk0OdwewgtSOosBVezix+GhV21vo46JqKHHwuxoflx/dGX6z/4FqLvKH/zQ7aREQBxR1fV7ficnId2jvASHl7pzK3ZdsBoEervoQ5CQN5JWjAr2gaML/uE8UAbwzJJZkZRUogaMgcJvWgLPPCYTm8w86qNPqxUqZL39Bu170+3kEOPleLkkPr5Qfso8lIuv2axHKQ3fRwjro4tHYAVfHOtL+zqFNGFV/nJDqiRC59GmH5Z8SIgZDL9BpNMonY+/vVDtZi2ICR4gf1sI4VArlr2MDsJb2LcIyyRiF0d0vrrD9TJvV1b94xWqLEzuNhtfCdpfZgSYpdIW8e0LvmdXA+QO9Nw6NxZ1g0eZ1QUDF1iDXW/VVNx6aWSUh1vfMdGksWh0fb6M9sEpS4+AaWHRgMVgKzj8dHBbph4PbUqEAcV0mQPmcXvTUH/B6ZihO/Han6LjNHfT30aJ4Bn5+Mzc0uOQNLm0T3Z2wmD4bSa7HLcOqRgqEmI5TtKaM+4rYRtHll88RJ1SgBVKvtJb/ykd8DthxpYQmnNOT1DYTO3YlkHkt+6kNyi2r0ALMcClNCDOuihQLGcbFWxqoyq+VjDHXZXqsR2FiryVT8zkmhMibwfFRsWCJaSayu3Fksq2IVSnk0da6N+XsfetpTsyOm1Jq005HNPKpwj+gwDkhOY
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:08.8413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23405e2-7fd4-4825-0074-08dc5e6ed4d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7612
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
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  7 ----
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 +
 drivers/gpu/drm/nouveau/nvif/device.c         |  9 +---
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 41 ++-----------------
 4 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index f1684dbd8e3b..db096a41dc4f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -3,7 +3,6 @@
 #define __NVIF_CL0080_H__
 
 #define NV_DEVICE_V0_INFO                                                  0x00
-#define NV_DEVICE_V0_TIME                                                  0x01
 
 struct nv_device_info_v0 {
 	__u8  version;
@@ -36,10 +35,4 @@ struct nv_device_info_v0 {
 	char  chip[16];
 	char  name[64];
 };
-
-struct nv_device_time_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 time;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 54446d38cb91..44064b5da897 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -61,6 +61,8 @@ struct nvif_device_impl {
 	u64 ram_size;
 	u64 ram_user;
 
+	u64 (*time)(struct nvif_device_priv *);
+
 	struct {
 		s32 oclass;
 	} usermode;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index d4d00a757cd0..7d057691600f 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -28,13 +28,8 @@
 u64
 nvif_device_time(struct nvif_device *device)
 {
-	if (!device->user.func) {
-		struct nv_device_time_v0 args = {};
-		int ret = nvif_object_mthd(&device->object, NV_DEVICE_V0_TIME,
-					   &args, sizeof(args));
-		WARN_ON_ONCE(ret != 0);
-		return args.time;
-	}
+	if (!device->user.func)
+		return device->impl->time(device->priv);
 
 	return device->user.func->time(&device->user);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 26ce50fc2aac..b37c857863b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -32,12 +32,6 @@
 #include <engine/disp/priv.h>
 #include <engine/fifo/ufifo.h>
 
-#include <nvif/class.h>
-#include <nvif/cl0080.h>
-#include <nvif/unpack.h>
-
-#define nvkm_udevice nvif_device_priv
-
 struct nvif_device_priv {
 	struct nvkm_object object;
 	struct nvkm_device *device;
@@ -45,23 +39,10 @@ struct nvif_device_priv {
 	struct nvif_device_impl impl;
 };
 
-static int
-nvkm_udevice_time(struct nvkm_udevice *udev, void *data, u32 size)
+static u64
+nvkm_udevice_time(struct nvif_device_priv *udev)
 {
-	struct nvkm_object *object = &udev->object;
-	struct nvkm_device *device = udev->device;
-	union {
-		struct nv_device_time_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "device time size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "device time vers %d\n", args->v0.version);
-		args->v0.time = nvkm_timer_read(device->timer);
-	}
-
-	return ret;
+	return nvkm_timer_read(udev->device->timer);
 }
 
 static void
@@ -76,22 +57,9 @@ nvkm_udevice_del(struct nvif_device_priv *udev)
 static const struct nvif_device_impl
 nvkm_udevice_impl = {
 	.del = nvkm_udevice_del,
+	.time = nvkm_udevice_time,
 };
 
-static int
-nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
-	nvif_ioctl(object, "device mthd %08x\n", mthd);
-	switch (mthd) {
-	case NV_DEVICE_V0_TIME:
-		return nvkm_udevice_time(udev, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static int
 nvkm_udevice_fini(struct nvkm_object *object, bool suspend)
 {
@@ -190,7 +158,6 @@ static const struct nvkm_object_func
 nvkm_udevice = {
 	.init = nvkm_udevice_init,
 	.fini = nvkm_udevice_fini,
-	.mthd = nvkm_udevice_mthd,
 	.sclass = nvkm_udevice_child_get,
 };
 
-- 
2.41.0

