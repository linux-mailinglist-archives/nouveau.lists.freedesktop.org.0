Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A78D1203
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31A910FBF3;
	Tue, 28 May 2024 02:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TiCTbIRm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CFE10F684
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq5ZA9Qx9XJc9SbVr+WNcOBnFpighrQ0j/CslD0LPodJwTy9u9mjICwZnovOA97CQI54jj3NW05ipyy0TSQP33VF1UcvefMuRx/at0n6NudOJF7oLF7DZqD8KlBKcXX9nbHtm76g6XmuCSupgk4L8ZHDtTwQVJ0SVUVcF0UY9p00a+1pAdyqos0xiUEr06Ko3pRISJTI7bF46NveoOz5FRDfwDBUi0whajd96t55Gp+ifTnJayRX0gqdQ7eulk1E+T25Py0e/viDvBCffsJkPU+g9LPBKAhU7raLBAq8Qmgok8sn9LcCQWMAS3I1FY89A+fSz9NUuObmL3PeMscg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziYRhS5iFRf++ixXCkU+ti82ik5phGFBY03OS9Wq4KY=;
 b=LauNqJ3+23jfCLIYMpiAl5KjY+PCqRnfeOjz2OQS1LUIYi9lzuryk+AA4IGAwtshX7PgiZpgbY1I6fI2nd7jsfTaD6RTI1RkeNSY5Fm4zKVR5ju24jnbBQs00nOLJaGYjbno4gXTb8G9qvnwXpQphE0LckVYeCOd0fHV7pux+65q9eQodmVOvzLvdIAJwXshjat6JECtJRAkVko6Dv9mXCBM3yNuXZgx1c2TjhI4LvtpJly/zxRMConh/HtWEwikjXT6lXIPRw8ybHh8QJeo7uSoLuO1Eyri56j0T6ccym18dnmDoWoMPpv3H+/XnAFRobqBVQehqb/bm4UkCmH2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziYRhS5iFRf++ixXCkU+ti82ik5phGFBY03OS9Wq4KY=;
 b=TiCTbIRm/0/BBYQv6ZlntBpwcTYPXiFymKZ39rP5XlBVuKpXZtyvZ1TQcEi4RZYmyvG8REeLkBGMMNVqRdvxk/RgdTfkhr0PlMVXGCR4Bs8q9yE8BPqCHGN9UgsVt1yrQODonin60sxe/gbLfvHmqxJVV6+S2/fYn6kr4SxZ912tBFMRFgwDJ1OOy+qoURsHgtPqE4xWtRRAjktKU3O1liTbO57Dsym6We0kaH+8wcT1XmNAeeGizxvH0TNyxFiPDlV0/YammMHfZVu2Rk6TRMfkBvEEH9D311yR75VObRLnt6CXjl7EGQW8ESCppPqCdXJj8x7OiYsGp352A5TBvw==
Received: from SJ0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:a03:333::29)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:32 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::54) by SJ0PR03CA0114.outlook.office365.com
 (2603:10b6:a03:333::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:23 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 23/34] drm/nouveau/nvif: remove disp chan rd/wr
Date: Tue, 28 May 2024 00:19:48 +1000
Message-ID: <20240527141959.59193-24-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1789e0-830d-4873-8efb-08dc7ebd2b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sMwfc5gX8TPrvfkTYbCa9gVWPcef1Dm9rTpgj6t9pSVrEkNTIbqFdVviOzWg?=
 =?us-ascii?Q?COQc8AzrQLnTfYv76+0o+JlDIZHNuPNNz8NsqmId6gwfbMoFDeOrwqqKs1Pe?=
 =?us-ascii?Q?l+ZnVVS8AiZ7Z2+ZQvjJxXO7ddo3QIefmm0WDFqb8rXDzAdBD3NhF8uOCLjP?=
 =?us-ascii?Q?AICdm3qWrG0qflnxmzKK4R/RzpKSc+5PWcRpAEIVgKRyP3TtaMpzjf1BkHPH?=
 =?us-ascii?Q?+/qw0GXe+QuNAhEJiQW4dGIf65sZaKxAzqLzpP/PF717xEQDQGQLYUBSFXlA?=
 =?us-ascii?Q?/yg5SG3TZ6N1YgLhb5N1gbg5u+r9BfPrxzeS2c/8tCoqNSl2zOtBgImdbK/u?=
 =?us-ascii?Q?2ot88BAmX4lTsHDf0ciM5T2bpDUFJftVklqezAQv1Fh9vJ/12IFPxwshhHhV?=
 =?us-ascii?Q?0wayBZiI9kNHQziidcmp3Hw/MJ73GxQubG1YweCXlAAeKsXjr3A1iz2tCF10?=
 =?us-ascii?Q?W6G3Bm1286+YzCfRqXH08WuWBlH6wLVOP3yTlPN00tXRDoPuBdB0RivtWAfH?=
 =?us-ascii?Q?pLxE8u8wB7E4E0HIieXcWtbQGiLzOYz+pT7i7HuQGGXDsslgstTFm30t0R7R?=
 =?us-ascii?Q?2tT5KpcuGaCt/QzvyXsAjr+UqhrRy18+/+cfMgWNKPlK1q7XYd1ffMg220kE?=
 =?us-ascii?Q?Rd8xTpli0cJ6R2tBTKBZHI3qjxphKEmSTL79qkikGHROViOlZgEhdlgSTG4p?=
 =?us-ascii?Q?uvQOwJxf4vvjfNgLOC8rmAIt9CR5qt7cSM7vr6tfdJmdwh1feMBnzNUp9YjU?=
 =?us-ascii?Q?X3Q0oNBWaMmwHvPxM2upY/lP3xdndXsO2DPQARtJmStqZq/KDI5MqLcvVbUc?=
 =?us-ascii?Q?SSs6NqBHsZFRABPaGgVimoIayb3XvoCBJqZDS7PYvSE9Pvpf1JockM5pe+yY?=
 =?us-ascii?Q?c+nsF1klzwPBiiSkT7DgPELGNZa/Kuo/n1zFF91zhoeJmGlmhXr8WW6GeJPS?=
 =?us-ascii?Q?LBFzoLOwDt1v65PCPLev7u0KBpGwlbagWbwIBUT1GdUdd53xBWHsaZCBNddR?=
 =?us-ascii?Q?LkydZRF69QP0nWX587WuaqkPRisHvyNPY/idE519ZjO6SdyFM1h8lUpBdBxf?=
 =?us-ascii?Q?AQiZadPAF70aS5n3e0Os3pL6BuU9Ml36k1sYr+Ql7y48dA5hrKB9RThiTplM?=
 =?us-ascii?Q?XIFTJSRm3xELeyWmBruPlbWlZyWFDTfu4cveTLAQUK1G4wL6HkmLLk/h6Yw3?=
 =?us-ascii?Q?AA2eGNSyecXClEhDBJn+ocR6ndbueo5nlpSXvtMZyYmUYvwaSOwqeskGky+x?=
 =?us-ascii?Q?3pZINudwH53NBGd7M9Xmjtu1B7GJLz3RFfIeEzPTezTtrn8KJz7N6a7kxbQ7?=
 =?us-ascii?Q?xTMKJx52cYCh4kWepulhNiKsq8hW2A+EI4tGqqg29BrmDROmLjh6tK5DCwy5?=
 =?us-ascii?Q?oiZWo+8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:32.2060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1789e0-830d-4873-8efb-08dc7ebd2b7f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343
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
index ac9657d7e92d..7119cbde3f01 100644
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
2.44.0

