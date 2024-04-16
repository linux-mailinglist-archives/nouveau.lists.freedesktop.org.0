Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C264D8A7910
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1548B112F8D;
	Tue, 16 Apr 2024 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kwdJ7QSh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0931112F86
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZY5op138muI3e6UvzcKkRYArpni8IrO1yyv/zajq0St1dfpZwxejr//IUUWI2e+NT/SXP7V/mRa2oASmT7snbvwyypN04/07X0U1LJGf7ijwZ2gHX8xo1dIzIkaqUgtX8I+lWlNGfl4oyEf6gLZw09eWNPgIn+hWr89y70J3zKsarlZaO++FOGrImIk6xVzpgu7Lqkp7n5Qfu5QBtVeRvjL02y4p/qhHxHKHfLNHcWtDbd3EQRlweqywIXI/3l4+XlU9jYUIg9pe4B5JGYlBScvjVZFPsosv/kpxCUHR92RfngZZZioVxK3gXlCouC5t4Ow7Ga6TmhMR3h9FXmbkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buMwtPclc4JqdvobJhl0JJVo2D/lZ+6ErYF/J7VKaD8=;
 b=V5vWIZ83FDhPYjyAbZ0q2D7yO4nkkkjisyhqBuOljP9FtBti4G0tmQZvsfUspLc0aBLU4oKO6CXhpuhlVW3d5lJZz11WSPaq1HUTzbMqtLMqi+MtdJq4z88bpKkAaQtTf/GvPamN5D99WsuK9BKSPdbi6mDk9PWM93QI1qJt/UDk1uZL5Y7arZVkeBiil/xbrabxRkbkGyHXFbmGVWnkWEG7+KRVwmt+zcuguBKDfmvLwJ2bZ0uJlwXsS5LX8SAUscCuWZBnybtmSi16ndgfCniEgEs3CapvhSM/xXBr26IRQvW/C1X1KNbgQnScHA7NQkhgFj6DRm9k62yVkZngyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buMwtPclc4JqdvobJhl0JJVo2D/lZ+6ErYF/J7VKaD8=;
 b=kwdJ7QShczLF4ljf4CLq3KPmSNidok0GBlh6FFeZ1azD1uHF0GVxUCwUZZxj5f4+VunZxhnZB1LB264Wf/pTFiElNHmWIcLS4SM1lFg3PRhYzALdSh1GrfYK2Epy3oLBi+oy2E2KxLSCL2ojDf+fwiPw8f1+4tf9jL2OuzBnQ/n/jJjHRo08DkgqGFa0fAWWevw2yk/RWzpKQeKrjPSk+Q699ojgPcWZAj+ZPTWrfv4tOBrstrb9S/xwzX3zboxEH7b2V4lT5jFohgACVpmA5Z59KgRBEqCZMvltuH2yO0DLwEm+IE/hLN44uCubNV0Vsnyw0U6eN9G39JU1DdO3oQ==
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by CY8PR12MB8409.namprd12.prod.outlook.com (2603:10b6:930:7f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:36 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::ab) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:20 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 096/156] drm/nouveau/nvif: rework fault buffer "map" api
Date: Wed, 17 Apr 2024 09:39:02 +1000
Message-ID: <20240416234002.19509-97-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|CY8PR12MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 93683fe2-563f-4c5b-e7e4-08dc5e6ee4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8r4VgysTbqNkAUIuYs/PSDRKlgMeBxkqep4n0NRS5duIaBLTfs4pD5251DjF6dQbl2c97yplWXWAXu3Pfk21mqUwLgE6QasBsxnOxmg+y+gFu6u1f95kIfHMos1VRP/nOGhQHKjQDEtiAONO9lJwTHghT/aJllbjVtLLT72y1xp6Jzdn9Vw5fvdTn9mjapqLilf+J//wBmdL4K1KBGk4AVxP00R7ccFJke6wyrCMcxKiktnrbl2z/r+Bw7EfbigfcSFYIGOUcfhA+lsXJOpgZ4rD+35w2u+ijaqa9wBOXkRWpknndYIziWGOJOLh4OVEjtPGZXae0n4UgoiCYI4009r2yTkuc4AHCF/isy6D6qolnd+zAe7ep7bLs6/JnSqZqkjsOtpvtZOYdMVwooxWAyA2SIJZyo2NZeE2E0SD3HwymppfWOlOSbHy5ad6SBRzr09zIb7PjsSaAjZDU/CJpW+gD1WmpTf9nZlB0f0RHEOmdxCeIKzPVkeF/SZiXmKmH0LwRLSgAS320iOALlnE2x0IVIe+u9vvd4LD7pSSrXlehb/ZGO7Dddi4SqvX7/M/Vq1mGGWqCBqwMmmRbYpCSUeYvWNbMwTxoArjH2tRuM50jTetANpt6msEqBYCDZSQAQ4e2Fe5v+dvEq/SqVqe5MumcNDf2Foia1Nzyjt5qy3eOhyQ8RA6uQtKK3CrHGn0LC9BI/X/ECpW9UhSOID+oqhQ10EzcQ2n02WUCa3jyasKfiVUIG2QA8BawEbxPWpb
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:35.7366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93683fe2-563f-4c5b-e7e4-08dc5e6ee4dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8409
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 26 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  | 16 +++---------
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index a1aab5735146..ba987233ec74 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -198,6 +198,7 @@ struct nvif_mmu_impl {
 struct nvif_faultbuf_impl {
 	void (*del)(struct nvif_faultbuf_priv *);
 
+	struct nvif_mapinfo map;
 	u32 entries;
 	u32 get;
 	u32 put;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 83702a86da1d..43218da5d0f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -47,6 +47,7 @@ struct nouveau_svm {
 		const struct nvif_faultbuf_impl *impl;
 		struct nvif_faultbuf_priv *priv;
 		struct nvif_object object;
+		struct nvif_map map;
 
 		int id;
 		u32 entries;
@@ -449,15 +450,14 @@ static void
 nouveau_svm_fault_cache(struct nouveau_svm *svm,
 			struct nouveau_svm_fault_buffer *buffer, u32 offset)
 {
-	struct nvif_object *memory = &buffer->object;
-	const u32 instlo = nvif_rd32(memory, offset + 0x00);
-	const u32 insthi = nvif_rd32(memory, offset + 0x04);
-	const u32 addrlo = nvif_rd32(memory, offset + 0x08);
-	const u32 addrhi = nvif_rd32(memory, offset + 0x0c);
-	const u32 timelo = nvif_rd32(memory, offset + 0x10);
-	const u32 timehi = nvif_rd32(memory, offset + 0x14);
-	const u32 engine = nvif_rd32(memory, offset + 0x18);
-	const u32   info = nvif_rd32(memory, offset + 0x1c);
+	const u32 instlo = nvif_rd32(buffer, offset + 0x00);
+	const u32 insthi = nvif_rd32(buffer, offset + 0x04);
+	const u32 addrlo = nvif_rd32(buffer, offset + 0x08);
+	const u32 addrhi = nvif_rd32(buffer, offset + 0x0c);
+	const u32 timelo = nvif_rd32(buffer, offset + 0x10);
+	const u32 timehi = nvif_rd32(buffer, offset + 0x14);
+	const u32 engine = nvif_rd32(buffer, offset + 0x18);
+	const u32   info = nvif_rd32(buffer, offset + 0x1c);
 	const u64   inst = (u64)insthi << 32 | instlo;
 	const u8     gpc = (info & 0x1f000000) >> 24;
 	const u8     hub = (info & 0x00100000) >> 20;
@@ -468,7 +468,7 @@ nouveau_svm_fault_cache(struct nouveau_svm *svm,
 	if (WARN_ON(!(info & 0x80000000)))
 		return;
 
-	nvif_mask(memory, offset + 0x1c, 0x80000000, 0x00000000);
+	nvif_mask(buffer, offset + 0x1c, 0x80000000, 0x00000000);
 
 	if (!buffer->fault[buffer->fault_nr]) {
 		fault = kmalloc(sizeof(*fault), GFP_KERNEL);
@@ -965,6 +965,7 @@ nouveau_svm_fault_buffer_dtor(struct nouveau_svm *svm, int id)
 	nvif_event_dtor(&buffer->notify);
 
 	if (buffer->impl) {
+		nvif_object_unmap_cpu(&buffer->map);
 		buffer->impl->del(buffer->priv);
 		buffer->impl = NULL;
 	}
@@ -991,7 +992,10 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 	buffer->getaddr = buffer->impl->get;
 	buffer->putaddr = buffer->impl->put;
 
-	nvif_object_map(&buffer->object, NULL, 0);
+	ret = nvif_object_map_cpu(&buffer->object, &buffer->impl->map, &buffer->map);
+	if (ret)
+		return ret;
+
 	INIT_WORK(&buffer->work, nouveau_svm_fault);
 
 	ret = nvif_event_ctor(&buffer->object, "svmFault", id, nouveau_svm_event, true, NULL, 0,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
index e6eb6df1f982..de7a79607eff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -51,18 +51,6 @@ nvkm_ufault_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm
 			       NVKM_FAULT_BUFFER_EVENT_PENDING, NULL);
 }
 
-static int
-nvkm_ufault_map(struct nvkm_object *object, void *argv, u32 argc,
-		enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvkm_fault_buffer *buffer = container_of(object, struct nvif_faultbuf_priv, object)->buffer;
-	struct nvkm_device *device = buffer->fault->subdev.device;
-	*type = NVKM_OBJECT_MAP_IO;
-	*addr = device->func->resource_addr(device, 3) + buffer->addr;
-	*size = nvkm_memory_size(buffer->mem);
-	return 0;
-}
-
 static void
 nvkm_ufault_del(struct nvif_faultbuf_priv *ufault)
 {
@@ -108,7 +96,6 @@ nvkm_ufault = {
 	.dtor = nvkm_ufault_dtor,
 	.init = nvkm_ufault_init,
 	.fini = nvkm_ufault_fini,
-	.map = nvkm_ufault_map,
 	.uevent = nvkm_ufault_uevent,
 };
 
@@ -134,6 +121,9 @@ nvkm_ufault_new(struct nvkm_device *device, const struct nvif_faultbuf_impl **pi
 	}
 
 	ufault->impl = nvkm_ufault_impl;
+	ufault->impl.map.type = NVIF_MAP_IO;
+	ufault->impl.map.handle = device->func->resource_addr(device, 3) + ufault->buffer->addr;
+	ufault->impl.map.length = nvkm_memory_size(ufault->buffer->mem);
 	ufault->impl.entries = ufault->buffer->entries;
 	ufault->impl.get = ufault->buffer->get;
 	ufault->impl.put = ufault->buffer->put;
-- 
2.41.0

