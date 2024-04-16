Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3A8A78CF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4A9112F4B;
	Tue, 16 Apr 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lEK/yCQm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE022112F48
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQHn+oZqjPG3bqXZAeSSJDqRY19/badLopBZo4fXLlqN8JI13UlD19Q+Bs1QNnROf5SgZWhLPBCDUr3VoNp6OGpSGQiduh2UYCW5z1BltK838GYb5+iJuKSNDbRKEvk89lzUvK/9MalXGG4izMHGphvFL5kzYVXaiVApNph42C1nM19PJJYkBdWld0Rkdd8zySAw3o63RHtpn7ixcuRi1GLUjetShH+a+EU32wmrNke5/t+D6A9YwS2gDzUxlIwZm4tSl9qzLheiXpSP6rv6zoOb2Y6BaVhJvZmeLH8Nyz2ggH65JjoZWmnIxt2CInmK4Q2lG9ZHgFSywnlJFASK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJGkrErL9MQWpDtIaEg6kppvpq0jMpjzGoQbKO7Furs=;
 b=TDPqLmekIU84vQpsQH5+96H+xSwJL1KTIOyoUHptIM9mUV8E6KD1+nWPlRHHwWEawM6Ip/lqzzNRxfJpbfx7FecCJ6eofLnyB4LaaaTWlmW8+bRZc05xOIaxt/SOgsgw9wmG50gcNL2JzWKx4aQyMXzTm2/nRxOYYaUhMd5NhI0+pdYDvmfNuT7dOuLq+sWp/lV7k5fGelx74PCa9UgZH98Kg6PsXTOYu35n7XjdjnxUwf4sP5SdYvwW9ZDhC4b/LAk7aSDCDBOxhmkBUWgGgndE3m1N4SvvniQJnJJa1Z4s0R4uvtzQEQVCD5747ZFOqCkVyUqDFKA2bAVOFa/CAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJGkrErL9MQWpDtIaEg6kppvpq0jMpjzGoQbKO7Furs=;
 b=lEK/yCQmRZFnQHVmG5UhPwt7t/F8oWUEti5b0x3oYUwzplGSqj2t1Nli6SDqvvQSNl+xFjBIO3USKLwM8obNQ2ir5wFXbGiqESwRbIN4Ta2lZzrhdH3Yu1QlgGEbnYNtvk9QXcnvgZWeucOBaPu20y3rKnveAbfTujOhkDS+zgUhqTCR9PBsfwk82M0FLMUAa9GY7+KJafFMgvPC8UsEe5j+gZoVZpuTuwgPRAVTTcFJwZumock8Wh0FI187+bo8/t7QtO/7GLbCXsBSHC7mdmzDmEuOqRmNdATJaEi5BpsVa8a3hj6gMCs7C5dQqzR3FVDi+aTNIfY8PJzoeVp5CA==
Received: from BN9PR03CA0662.namprd03.prod.outlook.com (2603:10b6:408:10e::7)
 by CH3PR12MB8235.namprd12.prod.outlook.com (2603:10b6:610:120::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:29 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::42) by BN9PR03CA0662.outlook.office365.com
 (2603:10b6:408:10e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:12 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 036/156] drm/nouveau/nvif: remove device rd/wr
Date: Wed, 17 Apr 2024 09:38:02 +1000
Message-ID: <20240416234002.19509-37-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH3PR12MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 853ae2f7-1cd0-4be9-5ece-08dc5e6ebcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RcQU52TCrhE9aQxAWV0A83UmBNW4hzmQ9vpjSQ4rfgurFvgXyr3vn+kHWHD7AEeMDLGh1SHuFQ/Mg3k5qdwp9c4f2XBqOofbM9FdmVzM4z4YK+UKyoQl6hve2K4D6zwtZ2t9l+VG3fLKIp5t0rYr9KnAEWfh3W3mIcFCiSo+RRykAVKbMh/v8f7Le9GbeohUEiBADr6iZeYxuX4DiaXAWI6dgDd5VP7ifOsynayhpufGKwVfQbEYIxWE3WBEc4vX223DyXWTO+YAUWvqJiPyxx8ILNKna+Q7lGxFh7PukQMhXRHFBkoPYKZiivv05hgUIhxYyMQpiX7tcmir5MEZws4DciHYjtJ/llIzVZca3ZLm5arRexebtXDunor58FijNGY36/srkzFpdIUkM3mijo9EBDW3lrzJdw1EU5646MRA5JCgNaVc9B//+8M8otL7iYTHBFBsOpvVWL8kHc53MEsnfsEcXFWnwx4ao3dsjouExKKtpT6szoUp0rld/abfJ3243KQ9UWjYioxTlM11A2tKPrtqw1xJcbI/YS5AvQWqf/byJD08sk8U4aIvZerFQRrhOg3n/lCEZ7vlSRhdWj6uDbAWhxo8J3x5TcQUagB1VgzIeuRGIAgPbUjWmP+7LChKxHXCfWxwbeFxG+skiigKTNc8Wsb16wyGDBPzfr32abN0+WBbggoCK8krMlFFTO+sO+RjmSsnV9hBJs43ELb+q0BnDrlVjSYKEBBHMrKhG78DvsBsJQ89NQxiXPRJ
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:28.6812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853ae2f7-1cd0-4be9-5ece-08dc5e6ebcf4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8235
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

- device is always mapped now, these are unneeded

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 54 -------------------
 5 files changed, 132 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index d4f1c964ba31..c91abac44bd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -33,11 +33,7 @@ struct nvkm_object_func {
 	int (*map)(struct nvkm_object *, void *argv, u32 argc,
 		   enum nvkm_object_map *, u64 *addr, u64 *size);
 	int (*unmap)(struct nvkm_object *);
-	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
-	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
 	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
-	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
-	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
 	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
@@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
 		    enum nvkm_object_map *, u64 *addr, u64 *size);
 int nvkm_object_unmap(struct nvkm_object *);
-int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
-int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
 int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
-int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
-int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
 int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 584fc43c0d75..95e9537e1d7c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -206,14 +206,6 @@ nvkm_ioctl_rd(struct nvkm_client *client,
 		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
 			   args->v0.version, args->v0.size, args->v0.addr);
 		switch (args->v0.size) {
-		case 1:
-			ret = nvkm_object_rd08(object, args->v0.addr, &v.b08);
-			args->v0.data = v.b08;
-			break;
-		case 2:
-			ret = nvkm_object_rd16(object, args->v0.addr, &v.b16);
-			args->v0.data = v.b16;
-			break;
 		case 4:
 			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
 			args->v0.data = v.b32;
@@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
 		return ret;
 
 	switch (args->v0.size) {
-	case 1: return nvkm_object_wr08(object, args->v0.addr, args->v0.data);
-	case 2: return nvkm_object_wr16(object, args->v0.addr, args->v0.data);
 	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 580b8c7f25af..913c3bae51f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
 	return -ENODEV;
 }
 
-int
-nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	if (likely(object->func->rd08))
-		return object->func->rd08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	if (likely(object->func->rd16))
-		return object->func->rd16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
@@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return -ENODEV;
 }
 
-int
-nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	if (likely(object->func->wr08))
-		return object->func->wr08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	if (likely(object->func->wr16))
-		return object->func->wr16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 3385528da650..afc10ec256a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,36 +55,12 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
 	return nvkm_object_unmap(oproxy->object);
 }
 
-static int
-nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
 }
 
-static int
-nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
@@ -197,11 +173,7 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.map = nvkm_oproxy_map,
 	.unmap = nvkm_oproxy_unmap,
-	.rd08 = nvkm_oproxy_rd08,
-	.rd16 = nvkm_oproxy_rd16,
 	.rd32 = nvkm_oproxy_rd32,
-	.wr08 = nvkm_oproxy_wr08,
-	.wr16 = nvkm_oproxy_wr16,
 	.wr32 = nvkm_oproxy_wr32,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 65bd6712bce2..d7f75b3a43c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -202,54 +202,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static int
-nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd08(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd16(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd32(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr08(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr16(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr32(udev->device, addr, data);
-	return 0;
-}
-
 static int
 nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 		 enum nvkm_object_map *type, u64 *addr, u64 *size)
@@ -362,12 +314,6 @@ nvkm_udevice = {
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
 	.map = nvkm_udevice_map,
-	.rd08 = nvkm_udevice_rd08,
-	.rd16 = nvkm_udevice_rd16,
-	.rd32 = nvkm_udevice_rd32,
-	.wr08 = nvkm_udevice_wr08,
-	.wr16 = nvkm_udevice_wr16,
-	.wr32 = nvkm_udevice_wr32,
 	.sclass = nvkm_udevice_child_get,
 };
 
-- 
2.41.0

