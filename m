Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6735E8A78FC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9E10EDBB;
	Tue, 16 Apr 2024 23:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEt6WyFJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F90112F49
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcxpvjJat3GmD3yUOXaxHfXn7MrOgABIQEbZQXIRTy3Ddm4M1vYCPZITC+F0VARwDxTkcwk8m+C1uXgvuzT2IXBlcb2c1GMDdai9s3fZW8kh/GZ3pwaONq55fHIvQPtyPR6BpjihYlRVL/NBfKd6PB/Kf/jlE+KenXODvRtlPzBYuX9jJ/yUnIpvGFIBy6ciE3Y5j7WvNAnKG28eRvhVfvXH9TyyhqFLolyMCNFc5cKeULZK2pifbHfECHccSL6p6efGQ4Lt3qfyiMYyl6mC52C4c9VErkkTU0Zr0SjOeKonzwx8pWmorS1LX4noIuULrYWpi1YvCEaOBuhnanb+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zgFn3hI4nAX5L/pqKcr2mRlRJpX5Rkz52glZRudK4I=;
 b=DqKI9Z2sdzliTFopQlTyWxNgqvI2kJ3BNxRkx2s9GNVRwt5xjFbleQOZHbeJ7aF9Xm0tgO2roy8GSyT7Zl7I8r0oKiuArtZLo5bqStISYM/K7OG2Y9NNVB85RSWUcSHOcbpp3tyeJCQNO58UBg+OGV1Ag4Ba4K1903W7jQ/QKrxcDuWmJIu9xUsoRBxblaFPIbAfP8mU4+8uECT8HBIiQPSOOBsqfrAftzad9sG+9eLC2Fuwzhvn7Tn/LuL9aA7iVjIlGi8rWN8w6sttQwbFkgiNrWwXHxNU4NCUZyGwr1xmWvhea5zdydoAQxKIhAKnVAYkqdj2MX07iJYSonW/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zgFn3hI4nAX5L/pqKcr2mRlRJpX5Rkz52glZRudK4I=;
 b=kEt6WyFJ06HOHkb5DnEY8OPUXUwc792DV+V289fZGN12uPa8x2lJ6bK203tnb59PRnUZ9Vbne5HYe94SUGMFdZcbRZSII9TlQ2W386vqTDcz9hg3OnYfcKoOyz5IbFprCCgFy3hQb2pifuu7Ei9K1FvjkZ54A5Kf0Amz54Tnw+iBTs22E1PuflBCnAA6lN17fz74J+AzsdohL1JmCTRu3r1aM+zm+swKbx9cDRbzCEf4A6jpzaspRWMAt97jpjGC8g/SMAcXk7LS/aSJmZ9FB2e0I3McLE4h+G85/wqLCnLdiFHrTXRtx2gLE+7cQvdCrx2f7b+sEvlnDrox8qy7aQ==
Received: from CH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::26)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:17 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::1e) by CH5P222CA0011.outlook.office365.com
 (2603:10b6:610:1ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:57 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:56 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 076/156] drm/nouveau/nvif: rework usermode "map" api
Date: Wed, 17 Apr 2024 09:38:42 +1000
Message-ID: <20240416234002.19509-77-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce72336-7156-42d8-b6e5-08dc5e6ed9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYhhBocmB9cbBPwskl+NoAUxmY8MpFXcUAdx9rAoE3GzkpZjPPnXpbq74dLvkbG+398BZfjyyxBPqhHvjCOikG1kqHY7H18pLI8SBIKWfDKLVsVXZ2CRS6InTPmH4zNghfW0q52YIIKu1g4gmYgPo6Y+LBmLK46FCGW7IqrnVC31oLssWhd6Vk76E8jyA9bLI9rHTz0vfTKoKWUPcu27TCUglADiTkQjO/gqOUWvuFDqWGpdq1xKyALrHdQJKcGamafImhpQ196r+vN1wOn1TpewnTUtay9+w78nzvypYD4T22gHAnOgAGBiRoNBFN8IpPEtkAr3t+TmhaslNIqZYywiTgjLnA6rGcqO3rLqoVFHloCnFi0/227VNZ2oSc6nIWOIS6EVVZuXr3MWwOunfXJHuiSWLR9EnzgDqCOw22+cNuFoJITzjfpUCn2zSnW/e7EChE/7PpDEQzXUhcJq1ofNQwv91vfXIRxnYkyHXtzdkWg0WuK0h4KlXA8oY3ZrhU30TRTlUn/rwcaERDW90+a8PAvvpxMgajps5P8zNONrv8X6cNHD8JfsL8TKhOtVg4nLNrshJ6BjpYy7BAYiFMbns/IyWX03xs8rYSVVfgmpg3Veb+2ZeiTWr2ZX9fzBKwTsjCoZ/LpmBSfZA9ADLIVRdRILcAMECIKfWLN6qFgCaLSeibrfE2UY0r4HA7HNFZjsJATaCL1J3zD+SBER68e4VMpBFiMihiw5SofyQsQuavicJLpwoNShfsEvwIJE
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:16.9921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce72336-7156-42d8-b6e5-08dc5e6ed9b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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
 .../gpu/drm/nouveau/include/nvif/driverif.h    |  1 +
 drivers/gpu/drm/nouveau/include/nvif/user.h    |  1 +
 drivers/gpu/drm/nouveau/nvif/user.c            |  9 ++++++++-
 drivers/gpu/drm/nouveau/nvif/userc361.c        |  8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c | 18 ++++--------------
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 35a5869eb036..3f481d19e7c6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -72,6 +72,7 @@ struct nvif_control_impl {
 
 struct nvif_usermode_impl {
 	void (*del)(struct nvif_usermode_priv *);
+	struct nvif_mapinfo map;
 };
 
 struct nvif_device_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/user.h b/drivers/gpu/drm/nouveau/include/nvif/user.h
index 51104955c1e3..4214492b617b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/user.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/user.h
@@ -7,6 +7,7 @@ struct nvif_user {
 	const struct nvif_usermode_impl *impl;
 	struct nvif_usermode_priv *priv;
 	struct nvif_object object;
+	struct nvif_map map;
 
 	const struct nvif_user_func *func;
 };
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index 878883aff9c5..dbeae9f1e6d2 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -30,6 +30,8 @@ void
 nvif_user_dtor(struct nvif_device *device)
 {
 	if (device->user.impl) {
+		nvif_object_unmap_cpu(&device->user.map);
+
 		device->user.impl->del(device->user.priv);
 		device->user.impl = NULL;
 		device->user.func = NULL;
@@ -64,6 +66,11 @@ nvif_user_ctor(struct nvif_device *device, const char *name)
 	nvif_object_ctor(&device->object, name ?: "nvifUsermode", 0, oclass, &device->user.object);
 	device->user.func = func;
 
-	nvif_object_map(&device->user.object, NULL, 0);
+	ret = nvif_object_map_cpu(&device->user.object, &device->user.impl->map, &device->user.map);
+	if (ret) {
+		nvif_user_dtor(device);
+		return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/userc361.c b/drivers/gpu/drm/nouveau/nvif/userc361.c
index 1116f871b272..2431b162b3c9 100644
--- a/drivers/gpu/drm/nouveau/nvif/userc361.c
+++ b/drivers/gpu/drm/nouveau/nvif/userc361.c
@@ -27,9 +27,9 @@ nvif_userc361_time(struct nvif_user *user)
 	u32 hi, lo;
 
 	do {
-		hi = nvif_rd32(&user->object, 0x084);
-		lo = nvif_rd32(&user->object, 0x080);
-	} while (hi != nvif_rd32(&user->object, 0x084));
+		hi = nvif_rd32(user, 0x084);
+		lo = nvif_rd32(user, 0x080);
+	} while (hi != nvif_rd32(user, 0x084));
 
 	return ((u64)hi << 32 | lo);
 }
@@ -37,7 +37,7 @@ nvif_userc361_time(struct nvif_user *user)
 static void
 nvif_userc361_doorbell(struct nvif_user *user, u32 token)
 {
-	nvif_wr32(&user->object, 0x90, token);
+	nvif_wr32(user, 0x90, token);
 }
 
 const struct nvif_user_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
index 6b0ddeb1f568..f00490e5aa7b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
@@ -31,19 +31,6 @@ struct nvif_usermode_priv {
 	struct nvif_usermode_impl impl;
 };
 
-static int
-nvkm_uvfn_map(struct nvkm_object *object, void *argv, u32 argc,
-	      enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvkm_vfn *vfn = container_of(object, struct nvif_usermode_priv, object)->vfn;
-	struct nvkm_device *device = vfn->subdev.device;
-
-	*addr = device->func->resource_addr(device, 0) + vfn->addr.user;
-	*size = vfn->func->user.size;
-	*type = NVKM_OBJECT_MAP_IO;
-	return 0;
-}
-
 static void
 nvkm_uvfn_del(struct nvif_usermode_priv *uvfn)
 {
@@ -59,13 +46,13 @@ nvkm_uvfn_impl = {
 
 static const struct nvkm_object_func
 nvkm_uvfn = {
-	.map = nvkm_uvfn_map,
 };
 
 int
 nvkm_uvfn_new(struct nvkm_device *device, const struct nvif_usermode_impl **pimpl,
 	      struct nvif_usermode_priv **ppriv, struct nvkm_object **pobject)
 {
+	struct nvkm_vfn *vfn = device->vfn;
 	struct nvif_usermode_priv *uvfn;
 
 	if (!(uvfn = kzalloc(sizeof(*uvfn), GFP_KERNEL)))
@@ -75,6 +62,9 @@ nvkm_uvfn_new(struct nvkm_device *device, const struct nvif_usermode_impl **pimp
 	uvfn->vfn = device->vfn;
 
 	uvfn->impl = nvkm_uvfn_impl;
+	uvfn->impl.map.type = NVIF_MAP_IO;
+	uvfn->impl.map.handle = device->func->resource_addr(device, 0) + vfn->addr.user;
+	uvfn->impl.map.length = vfn->func->user.size;
 
 	*pimpl = &uvfn->impl;
 	*ppriv = uvfn;
-- 
2.41.0

