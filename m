Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA293CD51
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26810E917;
	Fri, 26 Jul 2024 04:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GWE41HBi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FDB10E916
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihD+3jZth1IsHgUtk9pHq1v8G3G8EMVPR3PynbnD3xhWcFa1OF4PdUp1gmmHF1tih3x9UyfPziMzcnDJGqaTo6vvKLMtEOQTl3Nq/26Pca9EgAOtp4akzlHWDqNuE1+h07DQjlhHdJQxr2NA8WlMA8ofDJhO6CGtddeOEZOcNbMWP/HAziKwZWEO8W3xvPFLaJLt1oP+PchCmU0fqSNRE+TZYRqGgr+XL+H1Fuk+Rz9YgCtpfXVUGHzp/aJMMhMDW7BlfvJL4oS2J4FFl2dLieCRk7Dykq1bwROAwtE+JPXjGrfuTCww2GiQEgiKN1m0niGtQmafe3vtAJV3FKyA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF7PZ+4FoAVUSBhzp0Gg+sbk2RzGdyQZOZ85r/py25s=;
 b=orR+QKIRGkq3UcK2fW7jWDnJ+OY0QajxzSfAp8eabJMBywZflIvNHsyNZ0Ml8IySsnk5Y2sAyvo2NOBW+dUr5u4/6/F7MSZR1RAaDlAU02FDoqErHSzCjHs2BBN5JkHkgh8H0O1DJYfiudsQMUSioiFIrf0+2jcKgyzYWw37l8xXLgHaPNDQarmCSOOWP1nL1wvmNQDUKnIP+8KfAn1qmnbMhl4iP4RPHc/p8yELDEgqj+gYRBYMeGSVuecZOCTLOV3E5AVUR1trA7uUxuF311wMGRbn2IMj7ueR3m6Z4w6qNKpct4+7BQt1dFX3x3D7f/nz8JLwUKj1VmHZi8orWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF7PZ+4FoAVUSBhzp0Gg+sbk2RzGdyQZOZ85r/py25s=;
 b=GWE41HBiZ16vuQfuoZt3IeOy/GFf1K7r89Eg8GIb1JTPb7IDO4qVUJgMEEvVM9nX+v4mMstz5MxTCDnd87KhLvWBZE9h8jkWUqXJ3n6j23dEAxFS36TAmzt+a1CAhEFkO7gzABmZ5qS+/YgdVQSVXcvs1n+a+oVdGi09xJhNrAE1oDpCPY9fEk9ytgkjNWY2B5Z5+YTKi3YXWO525P5fgG9tHqOq5i2TDhrhyPMQHPkWaIErKPkvH2z0yAUH81YE5Q5HChUSgw7eDwSPj+cBPtNArJC1nMEwJe5fwMbyDNwHviyX2CUSfvoP9wx/Ch0ppbZlCFYjdwn/mW9vlW7wFA==
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 04:39:30 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::65) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:29 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:21 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 26/37] drm/nouveau/nvif: remove disp chan rd/wr
Date: Fri, 26 Jul 2024 14:38:17 +1000
Message-ID: <20240726043828.58966-27-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: bedab392-ea3c-4258-1436-08dcad2cf01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C5CB4Lyttg1MKLKwGWeaRiFb0TX6UXnUxql6WEz8BeYzrROaf3pcBnwL2Lqr?=
 =?us-ascii?Q?IkVLWWwd3RtGT/VgJLV34axAZQxmfXrRMG/AgW9/kW8jvmM8aoj2ms+wyx+j?=
 =?us-ascii?Q?HeR4a3UtFnNoe/D1OGiDGRA8e62FLhBEKQtpgXTAQNjfia6qGvP2AcoHh7IM?=
 =?us-ascii?Q?kAzD+Ofc+M1Mhlli+jGHbCqS6Pjg/2TIcyaXg99t/gTejhIMQRQslqxq4gPl?=
 =?us-ascii?Q?FS5FCPD+GEMVt2adeUP0IZ48HQrU+0IVCWuMu8byRDsF4UJ0lFXn2fZnL3Cl?=
 =?us-ascii?Q?fFg+pqul1Q4QUslCQ2C//NlQyrvxD7t8q7YR+pAieDlWfEdMsDwdZ6ajRtL3?=
 =?us-ascii?Q?ANQ7qy0gaj2kozO4IZC534/+O7ETmEatb9MGj2KRN+5cg1KKubyf72/fWF6T?=
 =?us-ascii?Q?txGwgDLgLMqZoRFNDgE84sSl6gMp+VfDPTZsQ3jt4mHkbdwf5keHyzTLkuy0?=
 =?us-ascii?Q?jppraijt5wcKa+BRF2rY1M1JHJkSEKwUPl5vW032Q5WMesOJIrJg+TbUrHKf?=
 =?us-ascii?Q?D7QfjeJgtPyjHklhG1zcBKNCtfjNGp0fRxfE0DlixGlaNWYLkDC6RSqv62qN?=
 =?us-ascii?Q?wfTNwX3M1dBt8uCZIPvlbyWPtFPdgGWGM2rcLZ+eRXoUUQ/kK855KrMMu8bg?=
 =?us-ascii?Q?xz/KGK1NqD8ivocGmhXbBPdqy0oRrO62KCCORsPk63dBiVDpecqYJnD3Wef1?=
 =?us-ascii?Q?1YCzv5nxGdljeYyOvE2+ckOW2jtxpb5zTBNx6x3hMftA81lnyF9WqhIGxoNR?=
 =?us-ascii?Q?4db9bpGrNu9luTNu1iZXJG0KTqceO3e+aLzkoy90MTZ+54kSHbCQa7lxz9Z6?=
 =?us-ascii?Q?+SI58FSaok89qGGlkqu8BgjvxEKCvStDq9ISNnOI2Lw+Sg7F5hMnqSh0k32i?=
 =?us-ascii?Q?toWxJf2xM1H1H+JWnY6KvgOCpabw4yQRpK/rPxFb+xVjuDVNL+QR28I4vG0Q?=
 =?us-ascii?Q?C6RcWEwcyexVpswWIluhFozBkn1IUVQZyniAdPZJcCHDT38YGmI6NTAgF5Yg?=
 =?us-ascii?Q?egaZM+5O63x9m2dcbjBKOXqeGNMvCcJ6P2saB0fbKroGfN5nfHUndbw74AAA?=
 =?us-ascii?Q?hgJX6bzWMqCdWSrLIyUacExzCsPzSIs5lZnmCROv6YR6q94jTBNVA3xWY8lu?=
 =?us-ascii?Q?Kd9pI5eSLFrksqOP9ISHS2RmR9WW8o8+uenZLxNzHkt8iEAGD/eEvx9oqRPK?=
 =?us-ascii?Q?jSw1vFmCJl6jbJxKgzcBmQSpkB7u+aCbuINK15nhu83OfyAxcS8I17VvEeKb?=
 =?us-ascii?Q?UMXZAFgV6jA3hVnS7UK5FSkGa2rjGmReRq1Atv4PX8/PKRh92wlJv6OAwEQA?=
 =?us-ascii?Q?27znOjnI/5tMnRh7iRglIbb7pClJ0LVuZavsSNPC0Iikbuv/P5NoiAP5111Y?=
 =?us-ascii?Q?9KP57WqJ5oIcM2ouo4NwHFUKlJ4EeYQW/1ty7bpUwn1UoZRMxmnzYwkYIlbZ?=
 =?us-ascii?Q?EbvzLarm1fdIDUrQyy2Wkhb6gBBFdTfa?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:29.6743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedab392-ea3c-4258-1436-08dcad2cf01c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
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

There's no good reason the ioremap() that results from nvif_object_map()
should fail, so add a check that the map succeeded, and remove the rd/wr
methods from display channel objects.

As this was the last user of rd/wr methods, the nvif plumbing is removed
at the same time.

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
index 58c986528ff6..b5508c3ab1d8 100644
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
2.45.1

