Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE693CD4C
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7210E604;
	Fri, 26 Jul 2024 04:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aHJCt4kv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58BA10E913
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7poHfgyHWf+u+Vnm+LD0WiOaQ4Nrkpqolp/X61My7zF8J4D/z9EFSODH4t+HBcToeUhD72GXFHxS8v4aCa7/pog5jWelSrpDvvFQUG4QUXtP9WxaYXGy1t1WFwQDxOeeyymXs2VImxa9tkiOWU9XLg1cFh6gt6dmuEq9sWxxoypg04UoIaivgd7JgxevgitytW7PtW5r2TYnU+Q3LJ/HBFctES2Pxwr2zv92hrbQyn+ChsTKvJ3u/n+aNA40GZ9QnknHsQZ6jRYh88tjpPgoZVh9bPYJQpD4V+BYc9/7SGU0d1qu39+mrnskqyar42BhNpA/8r7d88tK7z9Rq2luQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLzlkRXaxIkw8wHdnFHRxay3krIWqJ4HOzCVVJ8bmes=;
 b=o59eSnoZxl9Yq2zvs3FGQUyHoH+VHGINu71koNXhEanpgO1wfwIhEKagAKPk1yW6oh1QwbhShpLLoTFmmNmhNlgK2E0EmN+CCTEW9gV5zAJA0PdRRhxOqU1v8rYMQj9vXy+wIiRUvfAKLZjCNa7jqzWeF8p4vBIwqo01bP9hbZabcEAF+f8EhWHTHayant9NB9RXFX27WIa5xm8v2IxhYR857R2S3ANd+ioNa3NDIII/EaRQHD2Zedx9EJiYQ6Xy485AbSAOSTPCmva6UbFsZqYMVMLebmtOx16RDoR2Fis/yoYN178M4MdHW0EjQ9PWF62jzRlUF4AYLF8+rVtYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLzlkRXaxIkw8wHdnFHRxay3krIWqJ4HOzCVVJ8bmes=;
 b=aHJCt4kvMVkf6HOegHhAVLFssXmD3QIwd5MvC5Z2eRZoO9UnVJYJ73OTcgYB5fVys/NfmWd2zf8QWmCJ5CACjhqthbEQ49y2CAhvJTNiruQNnxjns3KrWWqMUC8yhVkswECoFO9roVtwTc7RD3H/DO/pTTuvdGUZ4WTPE9fVYElJBizpcszO0oqQ4gCZ6PgrB41xrs5uxPATDOj+yOblqZFe+1SP8tjdGzg5p1teGffDpuspH31GsQf7R9zVOsMh965uKKeBubFFXOHr0hL6phKLkgjDy+l4dkgLaWf83NPWT4J0PxzBji22vhLNcHxPzIBt872i16qPctrAg21hfg==
Received: from CH3P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::33)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 04:39:24 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::dc) by CH3P220CA0026.outlook.office365.com
 (2603:10b6:610:1e8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:23 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:14 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:13 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 21/37] drm/nouveau/nvif: remove client devlist
Date: Fri, 26 Jul 2024 14:38:12 +1000
Message-ID: <20240726043828.58966-22-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f111e53-7ef1-4dbc-8103-08dcad2cec7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?chDDpsBYkFY2H7uCcvMX3RwtlkorJtAvxeRNdEMsAcYPxw4P9ApOuhPT6QL7?=
 =?us-ascii?Q?4ZOIb49uzz32bIjadvawT7jfzqVy1uxR7rcpqpsVPOhbxD7ZTd96yI0xwozH?=
 =?us-ascii?Q?jzLqqAC+Aq8OhrANe0dbtb/lnHzeFo04ZxMETHYON6DW3d6jWVemkjP4N4Ze?=
 =?us-ascii?Q?uB38LA9yuGUzX0oXyqLCKHkOblXxxh7hk2PSp0CDQy3yezEjZq5T5qWv1NbI?=
 =?us-ascii?Q?/VdJ5QmnoSc160V7/+fZ1U16q3Q422YdaaV8NFAuYELX5OtxCrKc/OFLrdq0?=
 =?us-ascii?Q?yK5FS6l/yh6zt9qj83sttKHtdtqNtYEl/23PZ0MLsO4K2DnhuXGZ2dVOE0ec?=
 =?us-ascii?Q?hmD/ImCXIO18uM1kYjBGTAgUfzXIHj+6ZYzsXGWPkmeRICQfuqK7AX0EfIZE?=
 =?us-ascii?Q?b7uwXvQ4ZCWL8AKTzPQIWBP/hNOfbvpjj2yhNXq4ZmBC3xI058S8lmMTYZrJ?=
 =?us-ascii?Q?47ZisFue4Efmt3Zie64VH4+2Yaga+cLphz0/Jh4s6xnrAV4RgS2491ppYdfu?=
 =?us-ascii?Q?L1SRb/eyZM/h2XhKr6KhR496uDALSX6QQlMn+cBZ8lGzcpLibFKGeg5Kqr3L?=
 =?us-ascii?Q?9wG2A4KXrzadEkSt5C7Orl+JogmfnOdrjCKi8ekEHUuL03wZIJZY6CJt0erB?=
 =?us-ascii?Q?GpRMhT8FFS/kfihTqSqEeCQbB9dYDxgTEhZo+uHp/00NE8vXIEdOPuufM52b?=
 =?us-ascii?Q?x2znHwzMQ8TdulhxkNkltVqqR7OmxyhBwttl0aM0JWJbPbccO+3qU8VrMbY9?=
 =?us-ascii?Q?U4EqHGGxQ2BI32dfZaT1I04yaH0SUcDAOa24oAHHpwoJ11eFgX/7VWdmiA3S?=
 =?us-ascii?Q?bIZgxExhaJKazDb5i3qUjlM+gVw69MO8WA6bCWDfFnDe1ZqeP+HjMHctFg9J?=
 =?us-ascii?Q?msbGKZcwNw3njWWFRcwUrtvIOtHJACUnzZFOfeP7tXqaRZ5no2NbtXXPo3zC?=
 =?us-ascii?Q?30NqaOWRzIfQ8bdzbspVhuDa3S481V7vB7JLEFvukrItdRqp2KjSsMvm/JOR?=
 =?us-ascii?Q?jwUONRByjdpQdQH7LtC3wYrlgc2iUNa0AD4PCgt7+lhLkybyARPfrYLsAtCa?=
 =?us-ascii?Q?n5iO2dnVv519s0dAHwN501SAUtJ3pY9UsP/E7GxiROkKQA5peaJL1FVdSLyH?=
 =?us-ascii?Q?uIg+a6qN7P9NuijzkfowtrRCU5/UOKH3mx9OBz9HrBEHtNpBakh6jUUGKiFl?=
 =?us-ascii?Q?ERkyHFo/aZ0/GP4x3tqX/gagbcTVvOIEEquZj3wyszTBcuwzsEDbuEuw689G?=
 =?us-ascii?Q?5huHhA5ioveByma/MOgvyRoJeUBHLJGS2JZjej6CTgTV5CG4PZPUeod4rJcw?=
 =?us-ascii?Q?VyN5KNuFvW1QlTQwPXOHlZQCyHSAytJ90s2AiqyMBGFH18u0XjwtAEl9F8Eb?=
 =?us-ascii?Q?h1P3qK0Wx6tHPvFb+N/dPjqQsixEdXREo/Tk7pAF8vQQ8h2yJTdruVodHhdh?=
 =?us-ascii?Q?kQ58PHs7Q6NtL7y6zTaJWrXIJdX36iiP?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:23.5888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f111e53-7ef1-4dbc-8103-08dcad2cec7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278
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

This was once used by userspace tools (with nvkm built as a library),
but is now unused.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0000.h |  9 -----
 .../drm/nouveau/include/nvkm/core/device.h    |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 40 -------------------
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 14 -------
 4 files changed, 64 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
index a93f91d56a09..c06383835337 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
@@ -7,13 +7,4 @@ struct nvif_client_v0 {
 	__u8  pad01[7];
 	char  name[32];
 };
-
-#define NVIF_CLIENT_V0_DEVLIST                                             0x00
-
-struct nvif_client_devlist_v0 {
-	__u8  version;
-	__u8  count;
-	__u8  pad02[6];
-	__u64 device[];
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index f057d348221e..46afb877a296 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -109,7 +109,6 @@ struct nvkm_device_chip {
 };
 
 struct nvkm_device *nvkm_device_find(u64 name);
-int nvkm_device_list(u64 *name, int size);
 
 /* privileged register interface accessor macros */
 #define nvkm_rd08(d,a) ioread8((d)->pri + (a))
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 6baa3a4fa0a4..5c87146b8508 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -65,45 +65,6 @@ nvkm_uclient_sclass = {
 	.ctor = nvkm_uclient_new,
 };
 
-static int
-nvkm_client_mthd_devlist(struct nvkm_client *client, void *data, u32 size)
-{
-	union {
-		struct nvif_client_devlist_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(&client->object, "client devlist size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(&client->object, "client devlist vers %d count %d\n",
-			   args->v0.version, args->v0.count);
-		if (size == sizeof(args->v0.device[0]) * args->v0.count) {
-			ret = nvkm_device_list(args->v0.device, args->v0.count);
-			if (ret >= 0) {
-				args->v0.count = ret;
-				ret = 0;
-			}
-		} else {
-			ret = -EINVAL;
-		}
-	}
-
-	return ret;
-}
-
-static int
-nvkm_client_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvkm_client *client = nvkm_client(object);
-	switch (mthd) {
-	case NVIF_CLIENT_V0_DEVLIST:
-		return nvkm_client_mthd_devlist(client, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static int
 nvkm_client_child_new(const struct nvkm_oclass *oclass,
 		      void *data, u32 size, struct nvkm_object **pobject)
@@ -145,7 +106,6 @@ static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
 	.fini = nvkm_client_fini,
-	.mthd = nvkm_client_mthd,
 	.sclass = nvkm_client_child_get,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 6ca1a4cb9cee..9093d89b16f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -53,20 +53,6 @@ nvkm_device_find(u64 handle)
 	return device;
 }
 
-int
-nvkm_device_list(u64 *name, int size)
-{
-	struct nvkm_device *device;
-	int nr = 0;
-	mutex_lock(&nv_devices_mutex);
-	list_for_each_entry(device, &nv_devices, head) {
-		if (nr++ < size)
-			name[nr - 1] = device->handle;
-	}
-	mutex_unlock(&nv_devices_mutex);
-	return nr;
-}
-
 static const struct nvkm_device_chip
 nv4_chipset = {
 	.name = "NV04",
-- 
2.45.1

