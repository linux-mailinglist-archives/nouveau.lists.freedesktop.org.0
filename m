Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5F8D11FD
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C517610F88C;
	Tue, 28 May 2024 02:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QsflggCM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555A510F88C
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI5CeGTso+i4oD/IzL7TZfg2q9UZREr12MJ+wJvjib2XFDFXDV/utNHgodKpuB3JaHdBfeBoSam3Mr8UmVq07GqLVtIqP9OaOQqx8imq9IDaNLTOQBSUmnv5n4u8416CJQ00z7RoHFT8BtghBddptqjc4eN8ZB12ARIGCV3zPoI2OgVGOeXTSmBfXfES0rRYMQRYNkrYj4KEAceEjMdNjlrUcKIOQBD5Q5HdknR04w2K0XfYWp5BY6jPyFQ9Aq32alSAk/dsaXoK2BRzi2UzI+Sm94M9WozlsdglTFTqklQ3dXEAkBOmQsx3isKbqEKw1o0UyLQSX6SUXR814qaxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZSRB/ntXjc3m7NOjakd17jDvOswUMjLRRtob08nYqo=;
 b=nofCD9s6MPF46n7icl5k7SoTqU5io3GhKnAP61JrOtCxrcSjEoRMExjPLHsfnTJJTDYXGuT2JRtEryKFnajqjLlYKgeb7DxM1PhTS8KF40VZB/GYx02zEiCvd/LRSyBnditqL6Qlva8XwGEVuJ5/wr0jIJ4p3W3bZssCJ1y7/AYAWQLdwvFYOiAU8FuweAo5iAEiEoA5yI7GClEYQL1PV16peaeexZXEqsNH7dumIg7P5jCwZVBTPjySaWBfTMyV766TDbXAEgBcmmMxfxYYFNtVYAYk02dqK6IFoGg74xP7QMf9VieEEdakFG0oswlDQz+B6y4tcWrBNzBH9Yc7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZSRB/ntXjc3m7NOjakd17jDvOswUMjLRRtob08nYqo=;
 b=QsflggCMExOZPpEZKMmEJ2Et2sQvcaBpEoCAJnI8ji2yZuyK3GyaZCgyX2obA2s9tDuvCAeoLfbj91IwXDf9z6DCge3t1gbXKMR63sNfEj8urFrLZH/vWGDBBvm7Yfwc1udtW35Ze8tk1+7nBGzQ7A5p90+cAkC9dW7Is9fuwkspudgbuCw9dVWs0ji5BCq7fCPv9iIse2xlQrh7LQOn1GErQ6ymkNjaUSE3ekkgQ6xQI7E9huPOZsGqi2Gt3lb47IZvXHYhxhjBomYK2uEbMoZYgz0e5ILgZbF1vqFsEKwALL9HCvHN5LnRhYkYsEaIp9LSXdNs2UO2cF9cYPO5Yg==
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:27 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9b) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:15 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 18/34] drm/nouveau/nvif: remove client devlist
Date: Tue, 28 May 2024 00:19:43 +1000
Message-ID: <20240527141959.59193-19-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc29fd2-9b55-495b-f546-08dc7ebd28ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PBSYjJ7W8z+n5co6gO/4pv54vPCWKkIBHh2YjsjH/s2fXlZehzfTs9W3Zmoo?=
 =?us-ascii?Q?b7Vqfd9PIh2rjYZs2qNIZspmMOsp+7jqKRW7AKJethtgUj0A10AmQ9gnzUA8?=
 =?us-ascii?Q?4znR9UOtwxG4LUp0eQ5c103KZQfH7HA/b7DJbjcRIw2YFo7qGsEVf6rkRD5L?=
 =?us-ascii?Q?vjVuxuFFhjCN6zSafpKzQejBeh0hR63ofGZCZ7w4CWqdR/OfzCZ514mC8uOi?=
 =?us-ascii?Q?TQHg7QQL5gaiqH150PJt+krlx9aKWrhCU0IPcN36e9Xfs2gnnk0+NdGVcyRi?=
 =?us-ascii?Q?kIDnSI3t4cI6yT5g5KL7ArsGibj2jvuK4vcIr+tBWfwl0P82A8zDr4xrA05t?=
 =?us-ascii?Q?szNaEmnwTVYsGHw8l/6ZoF/JF5SKSEGGXBrjWneILpXjRW1/5gfWYAb2VkQI?=
 =?us-ascii?Q?mzGvrlb1urbCPkeLQ87MmTqZY4v3finK2jCFkCxx/norzu6oFYhP/ty0BhaR?=
 =?us-ascii?Q?dzqpVi9KsqeXBE9np0AD9dvMV4ZjRL40TppsL4la3llObLUoFuFaYcgFMToC?=
 =?us-ascii?Q?IIcv4cLQ9vRb/acFOcvoFVqEaAQXVyR8H3aoDJ14Qb37Hf9CNYdZRTHYh4I/?=
 =?us-ascii?Q?00+K6675Y68CAMFddv/7c1zU5h3DCfqPL1Pb6jx3yfx05KLkIYgGpARmFXQM?=
 =?us-ascii?Q?VjiNqUQdMxdgXeMh+0H7tX0y/jAA99DKpuP7JzWebSD6OXeryEAsnDs/BCw3?=
 =?us-ascii?Q?pemBzEwY97vq1k17QNtjVOKs+Wkq309jf5LUEUQ2M2Qb/YyTKjKT4i1jRKue?=
 =?us-ascii?Q?YJcZXM9i281RV/yueXvrCNGg1xSsSlIhUKPzAVPvCc38jgVGJtD4n4q2b41u?=
 =?us-ascii?Q?bAvS+/uJ4FaHhLt7k2iPRsEWDCO+8AL7/6HeiBqQoqv11uZTcBN3BpEcfpFg?=
 =?us-ascii?Q?S7Dgo8/O6P2NC99ZMgGLQ8qiqlly+eoJmZY7LmTCekuwt7B68mKjayfcD0E2?=
 =?us-ascii?Q?R84puejADH2zdJT8fWhdfzVFqnwEdODEWDiUnPvpnUqfvyOgrifhEglJ5wTW?=
 =?us-ascii?Q?Dc0ms1vXPHLoTzg4/wBHJAZ/2SCIlIO24Np9BL27gKibv2Me1ZksstW82Rbf?=
 =?us-ascii?Q?9bNPnr51sjTtsVahDZrTswrKV/G8bXIo0pTJtQaCQr9/6QYJipmGs/WhGdWH?=
 =?us-ascii?Q?qKhPxNGMzPKFOO7eHpDzPpWLFPO0Lu32cQpqGR0/x6B6ho+4o4F9eYwkNsv5?=
 =?us-ascii?Q?2+wJMdESG45YVJ0h/Je2GeQChbFUqtaRbjG2mt77jz+WaRqPRwR4bRb1+H9X?=
 =?us-ascii?Q?ZT5wtpZe04GL54zCDc9zT6HuD2bu3lbRxS7fk/8/FfqZWcwjqU4020vdZ0nl?=
 =?us-ascii?Q?+DVTuKZD5bxDXfB0/MqhdC24zLLxMbOYL3oS+e+g7xbq8BUNT0LdTR2d+nb8?=
 =?us-ascii?Q?qb68SwkVvUW1ShswI/u1t2o0xdlF?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:27.6669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc29fd2-9b55-495b-f546-08dc7ebd28ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740
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
2.44.0

