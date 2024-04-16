Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F98A790F
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9D112F3A;
	Tue, 16 Apr 2024 23:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lD5Mfuv3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F384112F86
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU9H9hqcgWjuZdKQpo5GSawd3upbK2LocYVv2o4YZ9eS84MNADYpeK1xooiufxq7V0UTenZCgXTYgmCxyIQEckT+htev32c0VuPMxXzDeOlucuIPJoPbwYADV/hxwdoBZn+x87bp8ZwvON3WlxpnG4XLVIjX6zZZBQ/m//vt6oqsoI7J4hBOz6sndNhCVqCUB4lqU3rlQ24nlbc2/EXLGBAaBWo4BlzVBWy4e0/kjWFOfmXTWbkB0kSZS4jyI6LeuEBGSR+LF4y8mepG/NyhpAIApN//bjHV42GDcxyKH4aGf++M/9lVIqj91jtvAErMOv1otOWj/XqC87F3oXQAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5AR5LIQwqtMpQ/QvWNW+NN6jnIAjs9dYSOO0Vcb6/M=;
 b=GyoAng3ZM2LSlPC2gXGxAPHC0I3YdGGjocVL9mruSlBkeKhAasCBWUpMOtt9iN8uifrNkVlCshuuI7rDjSfEffJXejwgOkLRxVU8siETfzHiXPOqv+glpH2pfP0+1YDEBbyWlRwZQNm7oxueRm3OwxddoohfHd0MFIHNosAy6X+jx0naK61QXHADMv8iYFw1/++kJdObD5m6ZNjo6IaLNzVifazY3zvnhBI5g3FR+8a8btH0Hus/rkmAkIck6sWzYB76nDEELgXSw8xV0NomE8go5MfRq1lE09P+Iq3VO4rwhMQTmnmAl1kJGoeHLDXQqIW9PAs8hbKPbJmufKJTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5AR5LIQwqtMpQ/QvWNW+NN6jnIAjs9dYSOO0Vcb6/M=;
 b=lD5Mfuv34yVmX40mf7+0dIY6Ph2PdieYeMjPUmbla6M7uvr8VLYG5GvtcZCzUkHjJ0540G+YYUZilWuGfdRDCv3pub16+EMVn6bhmFIEzb9R+Kky+XUqLgFFqotZvh57vqboi051joMdmATQJCh8Bwml1aWey7y+xq1MjzG5FPFlr3fijw/CgiOr1SdTLpEqbMSUB6vv4kSHSmKYiBSS8nTnc4MYj3jC+BBR6Cj1VJlJIBOvMt8XQkDupF1aGgtTLx29F6BVkRYA9QSXrGMHVwr+TMh203/nbWmtJymFs3Mbs13fM5HiCfkEe02JfPueKtjSViBy4QtAhA2FIjNb9Q==
Received: from DS7PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:3bb::29)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:34 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::4a) by DS7PR03CA0084.outlook.office365.com
 (2603:10b6:5:3bb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:17 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 093/156] drm/nouveau/nvif: rework vmm "raw sparse" api
Date: Wed, 17 Apr 2024 09:38:59 +1000
Message-ID: <20240416234002.19509-94-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f85dbcd-b8c4-4512-5e82-08dc5e6ee3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2Klo4+V5bHiqbqSzv0v0yR5a1uZS0pAxVVEQ8IwqE8l3qFGDyE4md1TlL98dlfgClQmjIGOnIS14yvwNYJ6Lz3ejnTEqcNomFL1dpGPgeUrA3wLqkr2btc0YO5Evzlkj8nbm4ER330qt/gfq4h4nnloVdOHoFVu/hlXmK6pjMyAxEHUH1lql+Ymnz2pNHCqCRnJD8703XqRrzdPxUra2rMVxunJDIHvmehN9DODj/+mgaTMjkt+Aqp5VKHuwz/kZWRNoc17Wx7jZawBKkbexZucCwxwCuL+C7+9oP8E2+vJsJjI+SCDJylRZVi6T+6l1erpkUTMCnC7dxfvbFWcNrfL7rvUPaHWoBI8i3jeRLiDsdBbr94aeuQntYBkLwGf0WrdcRwDWFQ2Ls4Ul8Tk5yEn8S93ZBCCXlspxF+ZRWD5bQujqnKa+96Y0xWpa6kvZfii+nlKVwVtBNC9uql1b23ymsN0UIlQ/Wfsp3UtLWvvhIMhVXuJo9kS6vDn3P5ItgSs6Dr2OKYnbWZVy5uJoyDWOO92nl+/RQusEbdGCm91O2TrtsJ9Q4+L2r2VHw5h9W0JZP6j8txKQEa+Xt+b5KEcWkPmHcAdvrd/8wGij+DyqTs2NGoYUrE8p2YMMZB7fqb/BrlIDKTxbuQXJHSyoMPwFFaG1F3sefxuow7JuN4w52pl0HT63eM1WkUXGOzLM+fYauxZlDff+b3/+qGw90edJ9KXzE558US5fZlVdmce22TgMi0E7ruLI6j5lEhQ
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:33.9964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85dbcd-b8c4-4512-5e82-08dc5e6ee3d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609
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
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 16 ----------
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 11 +------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 32 +++----------------
 4 files changed, 6 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 1cea0a07b2e8..da5760df9e20 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -142,6 +142,7 @@ struct nvif_vmm_impl {
 		int (*map)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size, void *, u32,
 			   struct nvif_mem_priv *, u64 offset);
 		int (*unmap)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size, bool sparse);
+		int (*sparse)(struct nvif_vmm_priv *, u64 addr, u64 size, bool ref);
 	} raw;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 232cc1142798..61a12396e996 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,22 +1,6 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
 
-#define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
-struct nvif_vmm_raw_v0 {
-	__u8 version;
-#define NVIF_VMM_RAW_V0_SPARSE	0x4
-	__u8  op;
-	__u8  sparse;
-	__u8  ref;
-	__u8  shift;
-	__u32 argc;
-	__u8  pad01[7];
-	__u64 addr;
-	__u64 size;
-	__u64 offset;
-	__u64 memory;
-	__u64 argv;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 16c6aaa81326..c3005f16a32e 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -94,16 +94,7 @@ nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 addr, u64 size,
 int
 nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref)
 {
-	struct nvif_vmm_raw_v0 args = {
-		.version = 0,
-		.op = NVIF_VMM_RAW_V0_SPARSE,
-		.addr = addr,
-		.size = size,
-		.ref = ref,
-	};
-
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
-				&args, sizeof(args));
+	return vmm->impl->raw.sparse(vmm->priv, addr, size, ref);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 7c8a7a5dc3f9..079ebaa64668 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -29,8 +29,6 @@
 #include <nvif/if000c.h>
 #include <nvif/unpack.h>
 
-#define nvkm_uvmm nvif_vmm_priv
-
 struct nvif_vmm_priv {
 	struct nvkm_object object;
 	struct nvkm_vmm *vmm;
@@ -348,36 +346,14 @@ nvkm_uvmm_raw_unmap(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size, bo
 }
 
 static int
-nvkm_uvmm_mthd_raw_sparse(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+nvkm_uvmm_raw_sparse(struct nvif_vmm_priv *uvmm, u64 addr, u64 size, bool ref)
 {
 	struct nvkm_vmm *vmm = uvmm->vmm;
 
-	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
-		return -EINVAL;
-
-	return nvkm_vmm_raw_sparse(vmm, args->addr, args->size, args->ref);
-}
-
-static int
-nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
-{
-	union {
-		struct nvif_vmm_raw_v0 v0;
-	} *args = argv;
-	int ret = -ENOSYS;
-
-	if (!uvmm->vmm->managed.raw)
+	if (!nvkm_vmm_in_managed_range(vmm, addr, size))
 		return -EINVAL;
 
-	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true)))
-		return ret;
-
-	switch (args->v0.op) {
-	case NVIF_VMM_RAW_V0_SPARSE:
-		return nvkm_uvmm_mthd_raw_sparse(uvmm, &args->v0);
-	default:
-		return -EINVAL;
-	};
+	return nvkm_vmm_raw_sparse(vmm, addr, size, ref);
 }
 
 static int
@@ -385,7 +361,6 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
-	case NVIF_VMM_V0_RAW   : return nvkm_uvmm_mthd_raw   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MTHD(0x00) ... NVIF_VMM_V0_MTHD(0x7f):
 		if (uvmm->vmm->func->mthd) {
 			return uvmm->vmm->func->mthd(uvmm->vmm,
@@ -420,6 +395,7 @@ nvkm_uvmm_impl = {
 	.raw.put = nvkm_uvmm_raw_put,
 	.raw.map = nvkm_uvmm_raw_map,
 	.raw.unmap = nvkm_uvmm_raw_unmap,
+	.raw.sparse = nvkm_uvmm_raw_sparse,
 };
 
 static void *
-- 
2.41.0

