Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F778A78CC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D04112F47;
	Tue, 16 Apr 2024 23:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r3f35v3m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640D112F43
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK/vU2N0Y6gJJpleoF24zP+XBziizFg3Fw4u8rO2FSlVc6sZj1H8xsmjNCcvMUpQWyVenLDoXTl+srDbi2qimxq6fLNbs4NoAYue/dgPYxmdQWYNz2sGDH+dHoAOv9sWMEFXzpjq2aUfUwZ/0sWp3NgUDQt6IQwkR7NdcFIN7eKFzpz+33uh1O8ukPAWG7viaTV9kJJQvGE9pPNd2ku2/lF/mnIwhTbv4qvKV01Mv0VA7F/tE4N30tfnoRnOJzfM5EwzhbnHUS8/ps/9x/enoyRkkcUmWF40rTB/xtNLUDqJEqOAHlu1JO4E9a+v7mhubDKDo8dvEsQkGxwL3lSoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=234vLjXca16FVv7dOUnQZkUdjavwTwkDIiqxNog9IfM=;
 b=QQAXACJ7jb4ljONwQtwFYWZYhfajiK4cenXYtHR0ioRk3lTK3MBj68YiFQLHTjEtLz46I+93vgdVVWjZ29rm8XMskry3ArdblOL9mes3J+XW1tqvuiYQze0u21f6Is1Ylr+peadMIHXoPWnBT5QMnKZOtr/ZhYs/cCytjDc4aJ1wB4c6dF1UA5+6fwGQbGNZHE46BXrrItUe9Z6n9bEIA7JxfjKmp8hD2OkGmok/tjr5uRa1mKUyeX8WZS7P6wqQRoOVSjxs7zrN9FNskejoKr6IE2sZyc0BhviXc48Q+QIuplcMpA1zT9MhamHhex4PcNFkLxHFD6WwDo9R+CX4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=234vLjXca16FVv7dOUnQZkUdjavwTwkDIiqxNog9IfM=;
 b=r3f35v3m0x/opNSLZ3gmUWAy33McCMjmZlY3Itkh39Nrrgnc1DXjxZIloQC/tNNBQYjgXphCqDN8aQUph2xSYmFCD/6Y+NEfzIVNJaTyXb3GyPmfOmXQMCqI4vk+clrdqgAvtrDrhMRxRg57J9cDLGmm56A2jdacqjaXlL5navC3XXT4omKoMq4Su/6N/tDvqY43YxC0ojGHHoaMqvslNbryO5b9aBhM71ULvy/ycQqnlSQE8dBLtWFE3fioOHem+7xogOe7u/7DAGZn46HyrQ9yAHZ3m+nwrbLsFO04gFyynihOcY+4omofYKvWrXZUF+ujCevTs54POft2gqqXRw==
Received: from BN9PR03CA0481.namprd03.prod.outlook.com (2603:10b6:408:130::6)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:29 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::7f) by BN9PR03CA0481.outlook.office365.com
 (2603:10b6:408:130::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:13 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 037/156] drm/nouveau/nvif: remove disp chan rd/wr
Date: Wed, 17 Apr 2024 09:38:03 +1000
Message-ID: <20240416234002.19509-38-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba7d5ef-1e02-4f89-9398-08dc5e6ebd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kVBW3ftKsVloKXyfKVDoS7cjr7ZIheCIJ+9V129QiDXsB+EHRgvzriiDyJwlGJh6qp77Y7gDPk3dvQkqdvTNVUH8+EIvFuvQ5Qh8Ne4ZO9VD12/4Uk7NlBYdSbSlxiFde3Vo324oydCSjT/EBR4z3qVMv8wdDCOu5fGjMKntiJ2Uy3c5oYWXytpq4xWZwWhA+NSNBCEDRMNk71Q15r1X/RM2It83aojfa+nxByiACzNP0dIMtgvuml22M4qK+m2oD9V1JSD4pE08ZjLfnYl+QwLjnZW0P/IamqhzzWALeApHpNvUcmdn3MYo+EpAkXVaOly0PqKvBcWnj/pioMLUG491odvL9s/LxgLL6hupd9/XZhSubS9fmjlut27IYClPI1/zBGRMcPUuqI0Jiu5kee7wN2Dp0tylFrBcjhb+b3d8BjaRIGLb1A7YwoZjy3d4YWmMCaKsyq+cCs1G0+6sB6TKOoZ+SFS3nG9G/RgtJoLx1vO+zNuMGhiZqK4aBT8r/LuruVq3WyU78dAoK7ECriYJlg0YHnbYqcVVKuCfQK9GMKa3VPXlyBQwKqf+ht/SHInl7T8L/gdZ1PsgI7r1kdMd0NanBXRZUrwbZnKOS+hDeGhOH4u3DFYMqkNb0uIVOibRkz1NudRsbL/jsaCnDrp4mhIIUbXLP/eI2fdarUTT6LDVW6wdjrKhz4gZpFXA+k7Fznp00zuoJRxqyiGDs1ttq/UwsyRzu1aP4spo5Kxmu2Z1N19d/heGCriyUCkg
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:29.2931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba7d5ef-1e02-4f89-9398-08dc5e6ebd4a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
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

- require display channel allocations to use map() instead

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 ++-
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  | 20 --------
 drivers/gpu/drm/nouveau/include/nvif/object.h | 17 ++-----
 .../drm/nouveau/include/nvkm/core/object.h    |  4 --
 drivers/gpu/drm/nouveau/nvif/object.c         | 37 --------------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 49 +------------------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 16 ------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 14 ------
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 24 ---------
 9 files changed, 10 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 31b46a62b501..4508c24720e2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -93,8 +93,11 @@ nv50_chan_create(struct nvif_device *device, struct nvif_object *disp,
 				ret = nvif_object_ctor(disp, "kmsChan", 0,
 						       oclass[0], data, size,
 						       &chan->user);
-				if (ret == 0)
-					nvif_object_map(&chan->user, NULL, 0);
+				if (ret == 0) {
+					ret = nvif_object_map(&chan->user, NULL, 0);
+					if (ret)
+						nvif_object_dtor(&chan->user);
+				}
 				nvif_object_sclass_put(&sclass);
 				return ret;
 			}
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
index 1e74245621e0..e825c8a1d9ca 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
@@ -8,8 +8,6 @@ struct nvif_ioctl_v0 {
 #define NVIF_IOCTL_V0_NEW                                                  0x02
 #define NVIF_IOCTL_V0_DEL                                                  0x03
 #define NVIF_IOCTL_V0_MTHD                                                 0x04
-#define NVIF_IOCTL_V0_RD                                                   0x05
-#define NVIF_IOCTL_V0_WR                                                   0x06
 #define NVIF_IOCTL_V0_MAP                                                  0x07
 #define NVIF_IOCTL_V0_UNMAP                                                0x08
 	__u8  type;
@@ -60,24 +58,6 @@ struct nvif_ioctl_mthd_v0 {
 	__u8  data[];		/* method data (class.h) */
 };
 
-struct nvif_ioctl_rd_v0 {
-	/* nvif_ioctl ... */
-	__u8  version;
-	__u8  size;
-	__u8  pad02[2];
-	__u32 data;
-	__u64 addr;
-};
-
-struct nvif_ioctl_wr_v0 {
-	/* nvif_ioctl ... */
-	__u8  version;
-	__u8  size;
-	__u8  pad02[2];
-	__u32 data;
-	__u64 addr;
-};
-
 struct nvif_ioctl_map_v0 {
 	/* nvif_ioctl ... */
 	__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 478cbb8f2dfe..8d205b6af46a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -34,8 +34,6 @@ void nvif_object_dtor(struct nvif_object *);
 int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
 int  nvif_object_sclass_get(struct nvif_object *, struct nvif_sclass **);
 void nvif_object_sclass_put(struct nvif_sclass **);
-u32  nvif_object_rd(struct nvif_object *, int, u64);
-void nvif_object_wr(struct nvif_object *, int, u64, u32);
 int  nvif_object_mthd(struct nvif_object *, u32, void *, u32);
 int  nvif_object_map_handle(struct nvif_object *, void *, u32,
 			    u64 *handle, u64 *length);
@@ -47,20 +45,11 @@ void nvif_object_unmap(struct nvif_object *);
 #define nvif_object(a) (a)->object
 
 #define nvif_rd(a,f,b,c) ({                                                    \
-	struct nvif_object *_object = (a);                                     \
-	u32 _data;                                                             \
-	if (likely(_object->map.ptr))                                          \
-		_data = f((u8 __iomem *)_object->map.ptr + (c));               \
-	else                                                                   \
-		_data = nvif_object_rd(_object, (b), (c));                     \
+	u32 _data = f((u8 __iomem *)(a)->map.ptr + (c));                       \
 	_data;                                                                 \
 })
 #define nvif_wr(a,f,b,c,d) ({                                                  \
-	struct nvif_object *_object = (a);                                     \
-	if (likely(_object->map.ptr))                                          \
-		f((d), (u8 __iomem *)_object->map.ptr + (c));                  \
-	else                                                                   \
-		nvif_object_wr(_object, (b), (c), (d));                        \
+	f((d), (u8 __iomem *)(a)->map.ptr + (c));                              \
 })
 #define nvif_rd08(a,b) ({ ((u8)nvif_rd((a), ioread8, 1, (b))); })
 #define nvif_rd16(a,b) ({ ((u16)nvif_rd((a), ioread16_native, 2, (b))); })
@@ -69,7 +58,7 @@ void nvif_object_unmap(struct nvif_object *);
 #define nvif_wr16(a,b,c) nvif_wr((a), iowrite16_native, 2, (b), (u16)(c))
 #define nvif_wr32(a,b,c) nvif_wr((a), iowrite32_native, 4, (b), (u32)(c))
 #define nvif_mask(a,b,c,d) ({                                                  \
-	struct nvif_object *__object = (a);                                    \
+	typeof(a) __object = (a);                                              \
 	u32 _addr = (b), _data = nvif_rd32(__object, _addr);                   \
 	nvif_wr32(__object, _addr, (_data & ~(c)) | (d));                      \
 	_data;                                                                 \
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index c91abac44bd6..10107ef3ca49 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -33,8 +33,6 @@ struct nvkm_object_func {
 	int (*map)(struct nvkm_object *, void *argv, u32 argc,
 		   enum nvkm_object_map *, u64 *addr, u64 *size);
 	int (*unmap)(struct nvkm_object *);
-	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
-	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
 	int (*sclass)(struct nvkm_object *, int index, struct nvkm_oclass *);
@@ -57,8 +55,6 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
 		    enum nvkm_object_map *, u64 *addr, u64 *size);
 int nvkm_object_unmap(struct nvkm_object *);
-int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
-int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
 
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 2b3e05197846..8a2a7bfec2f8 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -97,43 +97,6 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
 	return ret;
 }
 
-u32
-nvif_object_rd(struct nvif_object *object, int size, u64 addr)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_rd_v0 rd;
-	} args = {
-		.ioctl.type = NVIF_IOCTL_V0_RD,
-		.rd.size = size,
-		.rd.addr = addr,
-	};
-	int ret = nvif_object_ioctl(object, &args, sizeof(args), NULL);
-	if (ret) {
-		/*XXX: warn? */
-		return 0;
-	}
-	return args.rd.data;
-}
-
-void
-nvif_object_wr(struct nvif_object *object, int size, u64 addr, u32 data)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_wr_v0 wr;
-	} args = {
-		.ioctl.type = NVIF_IOCTL_V0_WR,
-		.wr.size = size,
-		.wr.addr = addr,
-		.wr.data = data,
-	};
-	int ret = nvif_object_ioctl(object, &args, sizeof(args), NULL);
-	if (ret) {
-		/*XXX: warn? */
-	}
-}
-
 int
 nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 95e9537e1d7c..45051a1249da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -191,59 +191,14 @@ static int
 nvkm_ioctl_rd(struct nvkm_client *client,
 	      struct nvkm_object *object, void *data, u32 size)
 {
-	union {
-		struct nvif_ioctl_rd_v0 v0;
-	} *args = data;
-	union {
-		u8  b08;
-		u16 b16;
-		u32 b32;
-	} v;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "rd size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
-			   args->v0.version, args->v0.size, args->v0.addr);
-		switch (args->v0.size) {
-		case 4:
-			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
-			args->v0.data = v.b32;
-			break;
-		default:
-			ret = -EINVAL;
-			break;
-		}
-	}
-
-	return ret;
+	return -ENOSYS;
 }
 
 static int
 nvkm_ioctl_wr(struct nvkm_client *client,
 	      struct nvkm_object *object, void *data, u32 size)
 {
-	union {
-		struct nvif_ioctl_wr_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "wr size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object,
-			   "wr vers %d size %d addr %016llx data %08x\n",
-			   args->v0.version, args->v0.size, args->v0.addr,
-			   args->v0.data);
-	} else
-		return ret;
-
-	switch (args->v0.size) {
-	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
-	default:
-		break;
-	}
-
-	return -EINVAL;
+	return -ENOSYS;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 913c3bae51f7..390c265cf8af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
 	return -ENODEV;
 }
 
-int
-nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	if (likely(object->func->rd32))
-		return object->func->rd32(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	if (likely(object->func->wr32))
-		return object->func->wr32(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_bind(struct nvkm_object *object, struct nvkm_gpuobj *gpuobj,
 		 int align, struct nvkm_gpuobj **pgpuobj)
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index afc10ec256a7..5db80d1780f0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,18 +55,6 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
 	return nvkm_object_unmap(oproxy->object);
 }
 
-static int
-nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	return nvkm_object_wr32(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_bind(struct nvkm_object *object, struct nvkm_gpuobj *parent,
 		 int align, struct nvkm_gpuobj **pgpuobj)
@@ -173,8 +161,6 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.map = nvkm_oproxy_map,
 	.unmap = nvkm_oproxy_unmap,
-	.rd32 = nvkm_oproxy_rd32,
-	.wr32 = nvkm_oproxy_wr32,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
 	.uevent = nvkm_oproxy_uevent,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index d5e18daed79f..4e43ee383c34 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -26,28 +26,6 @@
 
 #include <nvif/if0014.h>
 
-static int
-nvkm_disp_chan_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
-	struct nvkm_device *device = chan->disp->engine.subdev.device;
-	u64 size, base = chan->func->user(chan, &size);
-
-	*data = nvkm_rd32(device, base + addr);
-	return 0;
-}
-
-static int
-nvkm_disp_chan_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
-	struct nvkm_device *device = chan->disp->engine.subdev.device;
-	u64 size, base = chan->func->user(chan, &size);
-
-	nvkm_wr32(device, base + addr, data);
-	return 0;
-}
-
 static int
 nvkm_disp_chan_ntfy(struct nvkm_object *object, u32 type, struct nvkm_event **pevent)
 {
@@ -188,8 +166,6 @@ nvkm_disp_chan = {
 	.dtor = nvkm_disp_chan_dtor,
 	.init = nvkm_disp_chan_init,
 	.fini = nvkm_disp_chan_fini,
-	.rd32 = nvkm_disp_chan_rd32,
-	.wr32 = nvkm_disp_chan_wr32,
 	.ntfy = nvkm_disp_chan_ntfy,
 	.map = nvkm_disp_chan_map,
 	.sclass = nvkm_disp_chan_child_get,
-- 
2.41.0

