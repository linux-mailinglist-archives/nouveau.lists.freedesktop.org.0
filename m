Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D2AA3C8F
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C087010E589;
	Tue, 29 Apr 2025 23:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qlOo9Grs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825CC10E589
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dggblFr5VFEPxKyRFjbQTVBoZB3CtMreZg8YfDTPteMYHmXU7RsA0ZPjWuYfVdA1gmrWu+ESQqvaJB558bx+AQyzKtlO4rSj+zHU8NYHxH4AppkUTHo8OX33Afp10vi/8LPn0X/jkD2jTvYJW7JWMEyXl6ylaRl91SAYgzF9etktkAxj7WlrGItHFF9oIcCg/aU2NDXYhx7QAa0ka+yKDrfPXj74WjHFUoZB0y7cJerhQN4e1GAl9gYUauj9Rc8PqIkO9y0XDma+CSSJ9V045sr5Ib37jiDzHnJ8zFrb2dRcREtG5oLGokw4lhcJ0tdhB+mlr6EfI1BPYV4jxw+jcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3PAX3L8bnUG63CjA4zPRYg/ZXS1/BzJYUjpbuYE9eg=;
 b=Nxc+6VPklDJt1tKEQ7qSuPZW2fi3J3FkDDxgcLYma8veN5yLkXvNjt94acXQDcpR1eG3O4eYqzhTpDxCl1p3/ejbeXONzlT/PWmjeI/1ggbtlY1y1QfMu+BZxxnwno4h46o4ZqfYzDW/R4JntI3HzeVxPKxO+LTGHGqG1qR5YLSsfnw7AqoCbEs9x23YpCE8Wz2R9Ez+R+SY0pB33WxQJsqg4XM4/wJ+D7Bcwe2W+kUQjgLEV/nJJ6KQqyfcyaKm3nn6fc9Lg4q/0IOfyBB9QOEwwCwYE7gh+o7xGdVXDvhwxVuv67k6vqVmMLG9+ZjNrwd32srHCMhAO2OvzCjufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3PAX3L8bnUG63CjA4zPRYg/ZXS1/BzJYUjpbuYE9eg=;
 b=qlOo9Grs5kAJDnZKmz8inDk/PCq2bBcwq8+DACF5tCUh6O7mOOl7q8VYmb2BQA8fQlnx42KKJQKcH2BJP8Dmsb1ps+wMC4Ey4b72AmmMO65BnTNIqM751gaYX10smWqM7g2yuP3hpAE9WSR9NjoMFb3v1BO+rq3gRYhjQlxnxL1i59lxRgzta2NageihYRU3dgTUn2lzSXsYE9OnTwQ43chxSaUv4AYTLpZeURzGqmLaRrB+KoQ7iKqbROZIyJoZohB+42ZERujxGEXnukWQ9VI9bJDnH0kI8cxLc0Y17bJ6pRDr+Wjk+PMlN5qD/LaW81hMqnbc7HuBBOIVyrcPwQ==
Received: from SJ0PR13CA0155.namprd13.prod.outlook.com (2603:10b6:a03:2c7::10)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:33 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::c0) by SJ0PR13CA0155.outlook.office365.com
 (2603:10b6:a03:2c7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.16 via Frontend Transport; Tue,
 29 Apr 2025 23:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:16 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 30/60] drm/nouveau/gsp: add hal for fifo.xlat_rm_engine_type()
Date: Wed, 30 Apr 2025 09:38:58 +1000
Message-ID: <20250429233929.24363-31-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 557940ea-d313-4189-f2f1-08dd87773bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IP9txORpUaauLlimxDlPgTqdPSnbvC7aHKwKhFn5bR8TY/wK9QNWHsT5VeV6?=
 =?us-ascii?Q?QCO+j4vvySpSeC/VyU9wWOL9AC/cyqFEvaO1k7QAaMHWeoOoJgW8iXoF5Ltw?=
 =?us-ascii?Q?b2sfexaQeNIIQ5bKCqCpfUowoQJErouQcXmMzp/EUZ/Kf4Z/b8Ip0JO0v5uT?=
 =?us-ascii?Q?vt+fyKYA8Wyp1dkygzv0AX6TgypXAbn115VFIb6vqoCJUvzYDDMDQvcM7l2W?=
 =?us-ascii?Q?y26wobgi8at5kU2k+zG3ghZ5yOhJc4NvADHJJClb9zMzgGSe/IVTm7mEx9O7?=
 =?us-ascii?Q?KGFGmoKgzfY9MeKCw6VjSo7A4rPfMbEeMKVTTaaz5K3tXlmeYat3PxQIbUgG?=
 =?us-ascii?Q?J6DNrYad+A5mxGq0iyF9O6ubw2CBQXAieGscEmaDAt0V52bICRQm4cxYEU68?=
 =?us-ascii?Q?5KLMVem4ICAzo75l+EvH5x6Hsu1j9E62Ca4nG5qcZrYlAhNTCclXOwI5wBwg?=
 =?us-ascii?Q?gXGavNB2v0AHV7yNuGZOZPMgXm0kcyUlCdzPNwqg7YhiFRIGGEueklDtBl+X?=
 =?us-ascii?Q?xLs6nPBneouyVrjepohTb8vV4vl4ybxrKLIo+9PE/rQrj3GZYvZCWj8xIk1z?=
 =?us-ascii?Q?/QxxHbu+A4WbOdAmmsZVEzPZgRCIHPsa/MWcpK411eTXlNkbKbzohwODfbqA?=
 =?us-ascii?Q?7xV0aQgp3xFQkI7+KDNLQt2XFTT71/nxXiYLUhRPTyP7L0zZ52Ny4WuqfjH3?=
 =?us-ascii?Q?P/AMMvScRIspTUNstgjDP7LwWufNxgsqdx+INNoF+ro1u0E1y5Oz6zVO/6ye?=
 =?us-ascii?Q?oKkBQpQwQ/bUE0FqCImYOKShvV4fTzfrWs9aM9J9XDL2wevajkw+rG1uF96E?=
 =?us-ascii?Q?aYB8SfwK+yuyNp7b84JZG5ekB+Mx+QQxhQlGZQf+kV0lohdFWdSBRhuxctmB?=
 =?us-ascii?Q?zcxYcc2y8N4kzoM2+YBbrS1H8KQKNIkqtDYIj0B1fci5+Sxk3OaP9WGEaSGK?=
 =?us-ascii?Q?RnU5a3mRFtI3ZLaqcjaxi4ZZ4i3mVXPSymNtUv8r2u0+s4ityjyZRpWnUiSV?=
 =?us-ascii?Q?6sKpKC+LkuoSz5c0iAFFvRNDCZITDiZrkBaJ+RoCne5qUecVDy4qKMWYBXH2?=
 =?us-ascii?Q?dyXk9RnHT0w3/vAW5H1/2s9ktpUrFV2aLq9HaPnA8OKHk1QuQYjqZyJ7Y4vp?=
 =?us-ascii?Q?UgqKrs7BughXa0vGf7gCk/2B0x0LJGeeZqlNQKXqQK0yUbLqzsdPbdUMHNSx?=
 =?us-ascii?Q?lHgv55sWppERBRkKPbImKIQJuUTlJr1V2aPArkHl8/X317hWUI4UQ4bsTK+2?=
 =?us-ascii?Q?xu61O7Zj1SqrBTk8UikRl30jZ230D/MI67bhWa/rs4SiUDYZH0UyWw+galC/?=
 =?us-ascii?Q?T79jvRRiyuXz2bY3i/LnCcMukAHLzEFUuGyl/+5BT3IcnHCXbdRxy1lk7MxG?=
 =?us-ascii?Q?PSYAwc1YN3O36nYkHPolIPzx5YBJBDe81bHfkfX46C9LijD/kcyWhLLa1Pmx?=
 =?us-ascii?Q?3uuWR9dOhu3lQwvAlvpd974S2s/+iFLBroMKO99KhBGdmhxB+QwG6DdTgQ8o?=
 =?us-ascii?Q?+3Hn21YMQmHdY2CGgmyHRl0XhEjiBQyCpBGJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:32.9391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557940ea-d313-4189-f2f1-08dd87773bc6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728
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

550.40.07 has incompatible changes to RM_ENGINE_TYPE defines.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 101 +++++++++---------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   6 ++
 3 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index b4e5112cbad8..21631072926a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -439,56 +439,52 @@ r535_runl = {
 };
 
 static int
-r535_fifo_2080_type(enum nvkm_subdev_type type, int inst)
+r535_fifo_xlat_rm_engine_type(u32 rm, enum nvkm_subdev_type *ptype, int *p2080)
 {
-	switch (type) {
-	case NVKM_ENGINE_GR: return NV2080_ENGINE_TYPE_GR0;
-	case NVKM_ENGINE_CE: return NV2080_ENGINE_TYPE_COPY0 + inst;
-	case NVKM_ENGINE_SEC2: return NV2080_ENGINE_TYPE_SEC2;
-	case NVKM_ENGINE_NVDEC: return NV2080_ENGINE_TYPE_NVDEC0 + inst;
-	case NVKM_ENGINE_NVENC: return NV2080_ENGINE_TYPE_NVENC0 + inst;
-	case NVKM_ENGINE_NVJPG: return NV2080_ENGINE_TYPE_NVJPEG0 + inst;
-	case NVKM_ENGINE_OFA: return NV2080_ENGINE_TYPE_OFA;
-	case NVKM_ENGINE_SW: return NV2080_ENGINE_TYPE_SW;
-	default:
-		break;
-	}
+#define RM_ENGINE_TYPE(RM,NVKM,INST)              \
+	RM_ENGINE_TYPE_##RM:                      \
+		*ptype = NVKM_ENGINE_##NVKM;      \
+		*p2080 = NV2080_ENGINE_TYPE_##RM; \
+		return INST
 
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static int
-r535_fifo_engn_type(RM_ENGINE_TYPE rm, enum nvkm_subdev_type *ptype)
-{
 	switch (rm) {
-	case RM_ENGINE_TYPE_GR0:
-		*ptype = NVKM_ENGINE_GR;
-		return 0;
-	case RM_ENGINE_TYPE_COPY0...RM_ENGINE_TYPE_COPY9:
-		*ptype = NVKM_ENGINE_CE;
-		return rm - RM_ENGINE_TYPE_COPY0;
-	case RM_ENGINE_TYPE_NVDEC0...RM_ENGINE_TYPE_NVDEC7:
-		*ptype = NVKM_ENGINE_NVDEC;
-		return rm - RM_ENGINE_TYPE_NVDEC0;
-	case RM_ENGINE_TYPE_NVENC0...RM_ENGINE_TYPE_NVENC2:
-		*ptype = NVKM_ENGINE_NVENC;
-		return rm - RM_ENGINE_TYPE_NVENC0;
-	case RM_ENGINE_TYPE_SW:
-		*ptype = NVKM_ENGINE_SW;
-		return 0;
-	case RM_ENGINE_TYPE_SEC2:
-		*ptype = NVKM_ENGINE_SEC2;
-		return 0;
-	case RM_ENGINE_TYPE_NVJPEG0...RM_ENGINE_TYPE_NVJPEG7:
-		*ptype = NVKM_ENGINE_NVJPG;
-		return rm - RM_ENGINE_TYPE_NVJPEG0;
-	case RM_ENGINE_TYPE_OFA:
-		*ptype = NVKM_ENGINE_OFA;
-		return 0;
+	case RM_ENGINE_TYPE(    GR0,    GR, 0);
+	case RM_ENGINE_TYPE(  COPY0,    CE, 0);
+	case RM_ENGINE_TYPE(  COPY1,    CE, 1);
+	case RM_ENGINE_TYPE(  COPY2,    CE, 2);
+	case RM_ENGINE_TYPE(  COPY3,    CE, 3);
+	case RM_ENGINE_TYPE(  COPY4,    CE, 4);
+	case RM_ENGINE_TYPE(  COPY5,    CE, 5);
+	case RM_ENGINE_TYPE(  COPY6,    CE, 6);
+	case RM_ENGINE_TYPE(  COPY7,    CE, 7);
+	case RM_ENGINE_TYPE(  COPY8,    CE, 8);
+	case RM_ENGINE_TYPE(  COPY9,    CE, 9);
+	case RM_ENGINE_TYPE( NVDEC0, NVDEC, 0);
+	case RM_ENGINE_TYPE( NVDEC1, NVDEC, 1);
+	case RM_ENGINE_TYPE( NVDEC2, NVDEC, 2);
+	case RM_ENGINE_TYPE( NVDEC3, NVDEC, 3);
+	case RM_ENGINE_TYPE( NVDEC4, NVDEC, 4);
+	case RM_ENGINE_TYPE( NVDEC5, NVDEC, 5);
+	case RM_ENGINE_TYPE( NVDEC6, NVDEC, 6);
+	case RM_ENGINE_TYPE( NVDEC7, NVDEC, 7);
+	case RM_ENGINE_TYPE( NVENC0, NVENC, 0);
+	case RM_ENGINE_TYPE( NVENC1, NVENC, 1);
+	case RM_ENGINE_TYPE( NVENC2, NVENC, 2);
+	case RM_ENGINE_TYPE(NVJPEG0, NVJPG, 0);
+	case RM_ENGINE_TYPE(NVJPEG1, NVJPG, 1);
+	case RM_ENGINE_TYPE(NVJPEG2, NVJPG, 2);
+	case RM_ENGINE_TYPE(NVJPEG3, NVJPG, 3);
+	case RM_ENGINE_TYPE(NVJPEG4, NVJPG, 4);
+	case RM_ENGINE_TYPE(NVJPEG5, NVJPG, 5);
+	case RM_ENGINE_TYPE(NVJPEG6, NVJPG, 6);
+	case RM_ENGINE_TYPE(NVJPEG7, NVJPG, 7);
+	case RM_ENGINE_TYPE(     SW,    SW, 0);
+	case RM_ENGINE_TYPE(   SEC2,  SEC2, 0);
+	case RM_ENGINE_TYPE(    OFA,   OFA, 0);
 	default:
 		return -EINVAL;
 	}
+#undef RM_ENGINE_TYPE
 }
 
 static int
@@ -525,7 +521,9 @@ static int
 r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 {
 	struct nvkm_subdev *subdev = &fifo->engine.subdev;
-	struct nvkm_gsp *gsp = subdev->device->gsp;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_rm *rm = gsp->rm;
 	struct nvkm_runl *runl;
 	struct nvkm_engn *engn;
 	u32 cgids = 2048;
@@ -565,19 +563,13 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		if (!runl)
 			continue;
 
-		inst = r535_fifo_engn_type(rmid, &type);
+		inst = rm->api->fifo->xlat_rm_engine_type(rmid, &type, &nv2080);
 		if (inst < 0) {
 			nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", rmid);
 			nvkm_runl_del(runl);
 			continue;
 		}
 
-		nv2080 = r535_fifo_2080_type(type, inst);
-		if (nv2080 < 0) {
-			nvkm_runl_del(runl);
-			continue;
-		}
-
 		ret = nvkm_rm_engine_new(gsp->rm, type, inst);
 		if (ret) {
 			nvkm_runl_del(runl);
@@ -659,3 +651,8 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 
 	return nvkm_fifo_new_(rm, device, type, inst, pfifo);
 }
+
+const struct nvkm_rm_api_fifo
+r535_fifo = {
+	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index abd3179ccc44..588a1c344826 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -46,6 +46,7 @@ r535_api = {
 	.client = &r535_client,
 	.device = &r535_device,
 	.disp = &r535_disp,
+	.fifo = &r535_fifo,
 	.ce = &r535_ce,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 1a8aa18d2e84..929d66f75ab6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -85,6 +85,11 @@ struct nvkm_rm_api {
 		} chan;
 	} *disp;
 
+	const struct nvkm_rm_api_fifo {
+		int (*xlat_rm_engine_type)(u32 rm_engine_type,
+					   enum nvkm_subdev_type *, int *nv2080_type);
+	} *fifo;
+
 	const struct nvkm_rm_api_engine {
 		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 			     struct nvkm_gsp_object *);
@@ -100,6 +105,7 @@ extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
 extern const struct nvkm_rm_api_disp r535_disp;
+extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
-- 
2.49.0

