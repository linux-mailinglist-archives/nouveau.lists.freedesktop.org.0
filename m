Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7C8A7905
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CF9112F83;
	Tue, 16 Apr 2024 23:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AE+mHCt0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D054B112F7C
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBstpc/75WQrwa3NJUWUG2W6eGmHFoP4S5mNcBlL6yPTUjf16p7aCi2OitZlqszXjjdTZanr63wm9IqrqsbXDy6YLESjtvHkFH+yrsV6ZXOpEPs2S9fH9s2RhuCnJDiCgd74C8JwnZKrNaD7+725u9k2U/cQWNJzZhu3ES4KQNh25XMbPtDl8VyW1aQpNxEqiusT5L9IpDHip1EQEcttxMgHRqaZ5GZH5M17bzdR/ui0JqVv5TdX4/N1nWgCuThT0ZGNJ2ylgvI/2BpUs4Cwx+0UyY0sMhr5pUPcL1ESK2XJKUlSERvsrRKIvg1bO05A5u/u9/LntSo1RLGv5kPIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKJmJdRqSifApwGzbWDYoKg3ekCtO2FoAU+Q/ozzHXE=;
 b=FkJwAu8e95TJXHM0vls0Eso6y8XSgHNatxnuOzO011Mn67r4gVikWY1JviwgciRR7vimU6uk8UI9aRgEmbwQkIbJs/bx/4uc9LWmTxwa7VNnnrRDoMJXRhLWT56sb/uAJjdXxs8y5xk4tZbhuaJXeI2JwslU/JdHoxnoBcEpD1HGVxPOm4rUE0ruSrI013UNsvJiSZQ/MjnlzxMubxl8ncuYPr8GEMUqRekCllUdjXTYKhV+o3Gp2NFyrD1X6VVOn1aDbTxLYqUEu/3WJYoVbNHRxF2whXGjO0GSpeLsFIMiMCGbKtS3zAHZJdZjdk4C6iUnrPdoIvSWNNRj2mPXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKJmJdRqSifApwGzbWDYoKg3ekCtO2FoAU+Q/ozzHXE=;
 b=AE+mHCt0mofQatuJp2XpE4rLwpqVnLpxlTzCMK1T/W609LS/W0npNud7aJVbOhBqlEHI0dNCEhekrFE8OssYDobil4ABMbrqqOtjJnlrIDvTA14RL9+uyIImQj7IkHGDlVkKD8swQCyuw4oSGzyE7pFZqmuSoKiw71qHVp6UetQPfw/FSF6UBaVNG0G7x6SBx8ClEvuNZiKYqqGWdlE4QwizcoBXv//alnjhbxg5IcJ4/6Se57fQdsBkhaXUKWNNDjfhM5/+3bEASFfhMuKgVQ0gcWJJsstaANN5cznW7t5Ks3z70fUpBCET5zLWLe4MmsfXguPZOYWXBCWIBqU3Dw==
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:32 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::e8) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:31 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:13 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 090/156] drm/nouveau/nvif: rework vmm "pfnmap"/"pfnclr" apis
Date: Wed, 17 Apr 2024 09:38:56 +1000
Message-ID: <20240416234002.19509-91-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d1b5a4-0117-491b-dbdc-08dc5e6ee289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6kNBuvjhFNHy4d0vVXRe7yXnUAElBYxXTx8SqiyjGEWW01mrnVbQQBhTyLuCQZi9LTIdTNLyUwV9OMN1xxYkUdva3R6Ro/IW1jhli//o2zcyIwb2cX02iFLdnQJTOqGITR7old2mKcSVBYIbjhPdHpvPXH+aDlT7CeZ3hirCDT/aRGVRZfj6UsLjoCt1cY3+xy8ke+2NthdTgxaKK3rCwpjJ4ZGjw0+0d7W+VMTujbLnWR/qTkT/qfYL10JLFd/SKrwFAD5AznQprTIJDMhc6EKVxu8WjaF7BDV7cf7hvGKskgqwRMJO8xVBuZzcE7geI2xJYh8bUreLrITncbIU7y/7jxgynZAhZXJZJD7WvGE0YwzEnEENYzI33V5cdXZuCumS0Qp4vk5JiEuyCew7ni417MgMgkC1hMDYBDiyRM9zhYgEsHXbR1vDxlDUZLKg6B+MXY+olDWWMMBOIrWyrWMlY4ezM2+exWY6slT+FVCjPsts2xFSOVjgR0CXowYd+94irpfdEEGM93fe12WhWPJ7R4h1pHXsMsFCaZ7PHCtszwz8EnHCpQ0kKdn3Uh4Q6tdIYwTM+X1qQLBLLZd+0r2cBVsgCeMFXJBVBjyR2o3W9zMF3gr+CvvF8JjxG9Vew19rhguqkxm2PxuUkhDBJmZUMDceF3FihAkDxFoohZtYvG2iVAQ04Bhpljw72jv+B0zJTnYr5VWhlltuTDjTzlXsMc9cXMf1iSyDuJGmBgHRv0QTUWYbaGOS399KKy4
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:31.8460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d1b5a4-0117-491b-dbdc-08dc5e6ee289
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 12 ++++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 27 --------
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  8 +--
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 64 ++++++++-----------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 37 ++---------
 5 files changed, 50 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 94d0fb23ed2f..afca57d53c8c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -123,6 +123,18 @@ struct nvif_vmm_impl {
 	int (*map)(struct nvif_vmm_priv *, u64 addr, u64 size, void *, u32,
 		   struct nvif_mem_priv *, u64 offset);
 	int (*unmap)(struct nvif_vmm_priv *, u64 addr);
+
+#define NVIF_VMM_PFNMAP_ADDR       0xfffffffffffff000ULL
+#define NVIF_VMM_PFNMAP_ADDR_SHIFT                    12
+#define NVIF_VMM_PFNMAP_APER       0x00000000000000f0ULL
+#define NVIF_VMM_PFNMAP_HOST       0x0000000000000000ULL
+#define NVIF_VMM_PFNMAP_VRAM       0x0000000000000010ULL
+#define NVIF_VMM_PFNMAP_A          0x0000000000000004ULL
+#define NVIF_VMM_PFNMAP_W          0x0000000000000002ULL
+#define NVIF_VMM_PFNMAP_V          0x0000000000000001ULL
+#define NVIF_VMM_PFNMAP_NONE       0x0000000000000000ULL
+	int (*pfnmap)(struct nvif_vmm_priv *, u8 page, u64 addr, u64 size, u64 *phys);
+	int (*pfnclr)(struct nvif_vmm_priv *, u64 addr, u64 size);
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 9b979fa5c7ac..709837ffea4e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,8 +1,6 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
 
-#define NVIF_VMM_V0_PFNMAP                                                 0x05
-#define NVIF_VMM_V0_PFNCLR                                                 0x06
 #define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
@@ -25,29 +23,4 @@ struct nvif_vmm_raw_v0 {
 	__u64 memory;
 	__u64 argv;
 };
-
-struct nvif_vmm_pfnmap_v0 {
-	__u8  version;
-	__u8  page;
-	__u8  pad02[6];
-	__u64 addr;
-	__u64 size;
-#define NVIF_VMM_PFNMAP_V0_ADDR                           0xfffffffffffff000ULL
-#define NVIF_VMM_PFNMAP_V0_ADDR_SHIFT                                        12
-#define NVIF_VMM_PFNMAP_V0_APER                           0x00000000000000f0ULL
-#define NVIF_VMM_PFNMAP_V0_HOST                           0x0000000000000000ULL
-#define NVIF_VMM_PFNMAP_V0_VRAM                           0x0000000000000010ULL
-#define NVIF_VMM_PFNMAP_V0_A				  0x0000000000000004ULL
-#define NVIF_VMM_PFNMAP_V0_W                              0x0000000000000002ULL
-#define NVIF_VMM_PFNMAP_V0_V                              0x0000000000000001ULL
-#define NVIF_VMM_PFNMAP_V0_NONE                           0x0000000000000000ULL
-	__u64 phys[];
-};
-
-struct nvif_vmm_pfnclr_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 addr;
-	__u64 size;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index b2f20e33bf66..a2369841353d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -645,10 +645,10 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	}
 
 	dpage->zone_device_data = svmm;
-	*pfn = NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
-		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
+	*pfn = NVIF_VMM_PFNMAP_V | NVIF_VMM_PFNMAP_VRAM |
+		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
-		*pfn |= NVIF_VMM_PFNMAP_V0_W;
+		*pfn |= NVIF_VMM_PFNMAP_W;
 	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
@@ -656,7 +656,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
-	*pfn = NVIF_VMM_PFNMAP_V0_NONE;
+	*pfn = NVIF_VMM_PFNMAP_NONE;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index cf5dfbe63e69..ab02bcc034fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -79,9 +79,12 @@ struct nouveau_svm {
 #define SVM_ERR(s,f,a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)
 
 struct nouveau_pfnmap_args {
-	struct nvif_ioctl_v0 i;
-	struct nvif_ioctl_mthd_v0 m;
-	struct nvif_vmm_pfnmap_v0 p;
+	struct {
+		u8 page;
+		u64 addr;
+		u64 size;
+		u64 phys[];
+	} p;
 };
 
 struct nouveau_ivmm {
@@ -239,13 +242,10 @@ nouveau_svmm_join(struct nouveau_svmm *svmm, u64 inst)
 void
 nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit)
 {
-	if (limit > start) {
-		nvif_object_mthd(&svmm->vmm->vmm.object, NVIF_VMM_V0_PFNCLR,
-				 &(struct nvif_vmm_pfnclr_v0) {
-					.addr = start,
-					.size = limit - start,
-				 }, sizeof(struct nvif_vmm_pfnclr_v0));
-	}
+	struct nvif_vmm *vmm = &svmm->vmm->vmm;
+
+	if (limit > start)
+		vmm->impl->pfnclr(vmm->priv, start, limit - start);
 }
 
 static int
@@ -571,14 +571,14 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 	}
 	if (is_device_private_page(page))
 		args->p.phys[0] = nouveau_dmem_page_addr(page) |
-				NVIF_VMM_PFNMAP_V0_V |
-				NVIF_VMM_PFNMAP_V0_VRAM;
+				NVIF_VMM_PFNMAP_V |
+				NVIF_VMM_PFNMAP_VRAM;
 	else
 		args->p.phys[0] = page_to_phys(page) |
-				NVIF_VMM_PFNMAP_V0_V |
-				NVIF_VMM_PFNMAP_V0_HOST;
+				NVIF_VMM_PFNMAP_V |
+				NVIF_VMM_PFNMAP_HOST;
 	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
-		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
+		args->p.phys[0] |= NVIF_VMM_PFNMAP_W;
 }
 
 static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
@@ -592,6 +592,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	struct page *page;
 	unsigned long start = args->p.addr;
 	unsigned long notifier_seq;
+	struct nvif_vmm *vmm = &svmm->vmm->vmm;
 	int ret = 0;
 
 	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
@@ -628,12 +629,12 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 	args->p.size = PAGE_SIZE;
 	args->p.addr = start;
 	args->p.phys[0] = page_to_phys(page) |
-		NVIF_VMM_PFNMAP_V0_V |
-		NVIF_VMM_PFNMAP_V0_W |
-		NVIF_VMM_PFNMAP_V0_A |
-		NVIF_VMM_PFNMAP_V0_HOST;
+		NVIF_VMM_PFNMAP_V |
+		NVIF_VMM_PFNMAP_W |
+		NVIF_VMM_PFNMAP_A |
+		NVIF_VMM_PFNMAP_HOST;
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+	ret = vmm->impl->pfnmap(vmm->priv, args->p.page, args->p.size, args->p.addr, args->p.phys);
 	mutex_unlock(&svmm->mutex);
 
 	unlock_page(page);
@@ -661,6 +662,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		.dev_private_owner = drm->dev,
 	};
 	struct mm_struct *mm = svmm->notifier.mm;
+	struct nvif_vmm *vmm = &svmm->vmm->vmm;
 	int ret;
 
 	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
@@ -699,7 +701,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 
 	nouveau_hmm_convert_pfn(drm, &range, args);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+	ret = vmm->impl->pfnmap(vmm->priv, args->p.page, args->p.addr, args->p.size, args->p.phys);
 	mutex_unlock(&svmm->mutex);
 
 out:
@@ -767,12 +769,6 @@ nouveau_svm_fault(struct work_struct *work)
 	mutex_unlock(&svm->mutex);
 
 	/* Process list of faults. */
-	args.i.i.version = 0;
-	args.i.i.type = NVIF_IOCTL_V0_MTHD;
-	args.i.m.version = 0;
-	args.i.m.method = NVIF_VMM_V0_PFNMAP;
-	args.i.p.version = 0;
-
 	for (fi = 0; fn = fi + 1, fi < buffer->fault_nr; fi = fn) {
 		struct svm_notifier notifier;
 		struct mm_struct *mm;
@@ -850,14 +846,14 @@ nouveau_svm_fault(struct work_struct *work)
 			if (buffer->fault[fn]->svmm != svmm ||
 			    buffer->fault[fn]->addr >= limit ||
 			    (buffer->fault[fi]->access == FAULT_ACCESS_READ &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V)) ||
 			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_W)) ||
 			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_WRITE &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_A)))
 				break;
 		}
 
@@ -902,8 +898,6 @@ nouveau_pfns_alloc(unsigned long npages)
 	if (!args)
 		return NULL;
 
-	args->i.type = NVIF_IOCTL_V0_MTHD;
-	args->m.method = NVIF_VMM_V0_PFNMAP;
 	args->p.page = PAGE_SHIFT;
 
 	return args->p.phys;
@@ -922,15 +916,13 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		 unsigned long addr, u64 *pfns, unsigned long npages)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
+	struct nvif_vmm *vmm = &svmm->vmm->vmm;
 
 	args->p.addr = addr;
 	args->p.size = npages << PAGE_SHIFT;
 
 	mutex_lock(&svmm->mutex);
-
-	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-			  struct_size(args, p.phys, npages), NULL);
-
+	vmm->impl->pfnmap(vmm->priv, args->p.page, args->p.addr, args->p.size, args->p.phys);
 	mutex_unlock(&svmm->mutex);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index dae965fe2977..b1bd1dd3d5dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -52,20 +52,10 @@ nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
 }
 
 static int
-nvkm_uvmm_mthd_pfnclr(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_pfnclr(struct nvif_vmm_priv *uvmm, u64 addr, u64 size)
 {
-	union {
-		struct nvif_vmm_pfnclr_v0 v0;
-	} *args = argv;
 	struct nvkm_vmm *vmm = uvmm->vmm;
-	int ret = -ENOSYS;
-	u64 addr, size;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		addr = args->v0.addr;
-		size = args->v0.size;
-	} else
-		return ret;
+	int ret;
 
 	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
 		return -EINVAL;
@@ -80,25 +70,10 @@ nvkm_uvmm_mthd_pfnclr(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static int
-nvkm_uvmm_mthd_pfnmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_pfnmap(struct nvif_vmm_priv *uvmm, u8 page, u64 addr, u64 size, u64 *phys)
 {
-	union {
-		struct nvif_vmm_pfnmap_v0 v0;
-	} *args = argv;
 	struct nvkm_vmm *vmm = uvmm->vmm;
-	int ret = -ENOSYS;
-	u64 addr, size, *phys;
-	u8  page;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true))) {
-		page = args->v0.page;
-		addr = args->v0.addr;
-		size = args->v0.size;
-		phys = args->v0.phys;
-		if (argc != (size >> page) * sizeof(args->v0.phys[0]))
-			return -EINVAL;
-	} else
-		return ret;
+	int ret;
 
 	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
 		return -EINVAL;
@@ -427,8 +402,6 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
-	case NVIF_VMM_V0_PFNMAP: return nvkm_uvmm_mthd_pfnmap(uvmm, argv, argc);
-	case NVIF_VMM_V0_PFNCLR: return nvkm_uvmm_mthd_pfnclr(uvmm, argv, argc);
 	case NVIF_VMM_V0_RAW   : return nvkm_uvmm_mthd_raw   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MTHD(0x00) ... NVIF_VMM_V0_MTHD(0x7f):
 		if (uvmm->vmm->func->mthd) {
@@ -458,6 +431,8 @@ nvkm_uvmm_impl = {
 	.put = nvkm_uvmm_put,
 	.map = nvkm_uvmm_map,
 	.unmap = nvkm_uvmm_unmap,
+	.pfnmap = nvkm_uvmm_pfnmap,
+	.pfnclr = nvkm_uvmm_pfnclr,
 };
 
 static void *
-- 
2.41.0

