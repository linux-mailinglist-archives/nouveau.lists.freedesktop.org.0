Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB98A78D5
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525FA112F26;
	Tue, 16 Apr 2024 23:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Va4S5Zpp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE093112F1F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG15Rj0waGuVsInE4umEMgy3xMgS1BWBbH9SDmQ8/SZbkoBtcJKlH8GPWyIt71rDIKyDIYTeubgFSMlMkd7YBAnUW4+KhkfcqcKalxApl05nfqq0VqKJR87x29bQEVk4Xt2UBe371LjLZNaz01+5zycOZpNYv0p2ee1dObTy8YXrSdewhUa6Ylwq1B/71VYKzPCo0fo2odQLeay8EBM/6oxaWN6ei+FVo0eNO+VLE/D4cuZDqHRoycG65yOKFl73/sAbIDk7VIaWkVG+5uKGwJDi8GMz+M/kMzRdbZhTLh1qOWF578gdvYreQOB6z+M8d9Fnr8d7KJGdP7FBjn3pEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtYdEnKTm00cxcn0P2Lu2WDnEwR/FAPiDtOhkBvl03Y=;
 b=jDWKrqLCviGLW7FnM1aeIwL20NzGtUncBXGRIwefLe9l2At573Z+Tq1FdAVwAplBOulfxlOH2EMG+U8P8J0QU5uQECrqQtcXuR3t2OFNu++Cu/x9/1IIVRtg0yJpWYRV4mZY1IuDjvO2Qn5+cta+MuR8Y/4b3Iw3DLnpWo0P+x5KySqWb9XwxG0v492fMgPgQM3XjqNp/7uuhUEEHdBMsSOV+d5HopQYQnEl4srT91SNtIV0XR6L8TZKQrDwTDRFcC5NxdVHbsPk2/8uH19ksdhMMiTtfub8iQflmQYnIYufCqz2QxRHwdBC0P+R+k3sFmnf3IRnE8oVmouP7aVa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtYdEnKTm00cxcn0P2Lu2WDnEwR/FAPiDtOhkBvl03Y=;
 b=Va4S5ZppUW9tXSUbFxt8DQYUBPkpjcUw/rWU2Unsl7YW80lo71sH7EQLbCB5Hp9r9UKyTidePU0oSBATyrn1zCZoHvJfPkovr8wwvBParrXnkfmAJMENUjtuI5RGPIxYmKFztjKdygsLQw3mv6otLrZKDFZuFnibwAfuGasXH4Lt+WXqkw0qj3uY37Ahts6VMxNwscAkGjVxY6s+e4vBa9igO4djNxzkBW0awczc+l7FIpCBJxhoaOmez/WwoKKwQ2MCZCqEUvWsM3nEhzziyHVlrU57vXNxqvztRpBaDgNtcZa7M38rXYsfjzDjmgRe89v1FsvpRSzYy9982yX0CQ==
Received: from DS7PR03CA0005.namprd03.prod.outlook.com (2603:10b6:5:3b8::10)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:40 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::1) by DS7PR03CA0005.outlook.office365.com
 (2603:10b6:5:3b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:22 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 045/156] drm/nouveau/nvkm: rename struct nvkm_uvmm
Date: Wed, 17 Apr 2024 09:38:11 +1000
Message-ID: <20240416234002.19509-46-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: 20291a82-c861-41bb-9891-08dc5e6ec3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcWLDft2ywTgGXS1O63GS3zvrJvo38qLNlouAXHclRY8mGOPnUzW2SJ9CHGgQVoKXn7aQa/i+ltfzbVGmcbzfy42RBVymqO0SpRBARcQjfCxfIW+AT4Xs+tWZHsPbMwxyrORmRs1mDuN0KGhQx3yz5jtCE5ceZ4SEEkh8balOnqC3zrRIAv8q3tFeGPRbRvz3GEaOmt7qNRNn+ZB8Fx4kQJxEF6b2gRZjB2Rsk7+OHoVifsOqyeO2Xm42Og/qeDVL9+mVnlq3kww0CoZz/AdBroLfHe0aGW3jok4U66Aq00bftZSE5SrONNEyZGLjjG3jW1mZTm4+TANGwZGw1+c/Yoz6CzndOqlhh3dlyqZebNZMTGatWM9YzTeMinqHr0ZJUq/PYcwwKom5vkXt08tqbj2A+NpTUH/DbnTATlxDUPK1U/19A2jtn/idojrVs52IvAAC6o1fM/QfGEXcbXLQUHMLh2J/0wVC856k9nrV0/ZNsWAVXIpV1UXhn/klQOmp6keQ3KuY51h4MG0rb4KvJiY3fmL4S4+Pf0Vrpa+APm00lDgRN0MyDttrUv3aSNxdg3T4CcCpyDJTgz0WrWgOqXfAKdHrdlAZAm4ABs6+eurkVLOEzKsb95zE8pdsru/HQUz6dZWeh1G5Z13D3pe2NUTNDNfCfSQSbz99tGX288k0xvVv0AwtX2+7LxnuuCkiTDXIsX3r48li7j+ovezQ5sA2RePadyK4/L1lFEFl0oyXnkCceAsHKLJA0PPZTie
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:40.0250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20291a82-c861-41bb-9891-08dc5e6ec3a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036
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

- preparation for upcoming patches
- open-code current nvkm_uvmm() macro
- alias remaining use of nvkm_uvmm to nvif_vmm_priv, removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 18 +++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h |  7 -------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index bd51cdb1c578..6f261f81a2ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -29,6 +29,13 @@
 #include <nvif/if000c.h>
 #include <nvif/unpack.h>
 
+#define nvkm_uvmm nvif_vmm_priv
+
+struct nvif_vmm_priv {
+	struct nvkm_object object;
+	struct nvkm_vmm *vmm;
+};
+
 static const struct nvkm_object_func nvkm_uvmm;
 struct nvkm_vmm *
 nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
@@ -39,7 +46,7 @@ nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
 	if (IS_ERR(object))
 		return (void *)object;
 
-	return nvkm_vmm_ref(nvkm_uvmm(object)->vmm);
+	return nvkm_vmm_ref(container_of(object, struct nvif_vmm_priv, object)->vmm);
 }
 
 static int
@@ -327,7 +334,7 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static inline int
-nvkm_uvmm_page_index(struct nvkm_uvmm *uvmm, u64 size, u8 shift, u8 *refd)
+nvkm_uvmm_page_index(struct nvif_vmm_priv *uvmm, u64 size, u8 shift, u8 *refd)
 {
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	const struct nvkm_vmm_page *page;
@@ -491,7 +498,7 @@ nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 static int
 nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
-	struct nvkm_uvmm *uvmm = nvkm_uvmm(object);
+	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
 	case NVIF_VMM_V0_PAGE  : return nvkm_uvmm_mthd_page  (uvmm, argv, argc);
 	case NVIF_VMM_V0_GET   : return nvkm_uvmm_mthd_get   (uvmm, argv, argc);
@@ -517,7 +524,8 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 static void *
 nvkm_uvmm_dtor(struct nvkm_object *object)
 {
-	struct nvkm_uvmm *uvmm = nvkm_uvmm(object);
+	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
+
 	nvkm_vmm_unref(&uvmm->vmm);
 	return uvmm;
 }
@@ -538,7 +546,7 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		struct nvif_vmm_v0 v0;
 	} *args = argv;
 	const struct nvkm_vmm_page *page;
-	struct nvkm_uvmm *uvmm;
+	struct nvif_vmm_priv *uvmm;
 	int ret = -ENOSYS;
 	u64 addr, size;
 	bool managed, raw;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
index 71dab55e18a9..cf0172a320c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
@@ -1,14 +1,7 @@
 #ifndef __NVKM_UVMM_H__
 #define __NVKM_UVMM_H__
-#define nvkm_uvmm(p) container_of((p), struct nvkm_uvmm, object)
-#include <core/object.h>
 #include "vmm.h"
 
-struct nvkm_uvmm {
-	struct nvkm_object object;
-	struct nvkm_vmm *vmm;
-};
-
 int nvkm_uvmm_new(const struct nvkm_oclass *, void *argv, u32 argc,
 		  struct nvkm_object **);
 #endif
-- 
2.41.0

