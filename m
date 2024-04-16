Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28A8A7929
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7E710E7E4;
	Tue, 16 Apr 2024 23:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pPdm3hY9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB04112FBF
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbcWpWZ9X1rqmvIQ4NyRvpi61XgNEqyD21Vz7vfxA6FT12Kfj5rmCCFS9fTfpwI82HZRqa9aYL6VOaJcn8w3X/S4pyzjGw/TKP4dfVzFwM049hqAcG1hKqhAudPSVh6Avo8Y4y35MCcSjeb4B8JcqNNaS+O7ixIZq4FuUsGCAdi+RcINNGmuBoNctdATXQiSgVs9dVqYwAvSNA3tJc13bd4LiRqrLZJ2ojc3qRVvPmeVDsyEohwksWjGXVwlppn0lfLcFOSg5dRIhD6+XZixnnzQddnlFdB18ikNoVMHDHj6xASH9eXhyzAMHB0XwNV1mpJPyJmIqVA/IR7s+taFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsLgZ4/qhgS++IAac2ZC9RviOkMhvrJ1yLgRpq4/brs=;
 b=Pwe+gTCbQRL/kFhzeTuMz5sR7x4vEVQiQF+r+y6aMB2mzTY/+qmqBjamH+pX7v6w6q8AcPAtcHDhuRNIZwRKchUSXt7YNJby5Lyhatxu1I6i/kLVdLDQBdgpL7ogRnfcGm+SUhiCzBLTrJVqHRqlWLqWzNstkoT8AxzmH2uoh9lrBS0Xla+OKimpFvp3xJXCF01OXmH0g9mFcF2VCAaJcYnaKpUvIsPgjRFGypi8elv5v3MctV+WSSLtudQWCV59dhzXZ68RU3+h2t+AiXNihA2qL89nq3Tb5kYcU+YmTFjgHprTcNoGfI4ZrXprd3FAcC4MsNlLTJW/mpJHaaCqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsLgZ4/qhgS++IAac2ZC9RviOkMhvrJ1yLgRpq4/brs=;
 b=pPdm3hY9VEN51lbJ99boxbNVwslnJbGd76qyDXb6Gh0Tnuv6UZXu43SPT40Fr0cNs2dCj803XYSmhoNgs9XgZ+fiKUZ1m7eV1p4acRESdsLQVAzvmZwY9lbxL3OTTTOplHGhZ3OjpiS8vR6eOjtTHG5x/0xc1oC+B/hzmIdnR1SenzxmxWg77BzUDUmfM+89kd8S/ZzgPZavjqhnfAj5ryoZoZdhn9eojgp6tQRH8ne8CBiUoSv1GdqfZklYg83Y9VeLgUeuxBsqq3nyqalhnchzlLCjgNOkgZ7IZU/4utJnY5YeqdKRbwDN2P0VE6Rge48GagvKdg12UkFp8oIT8Q==
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:11 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::b4) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:11 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:52 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 124/156] drm/nouveau/nvif: rework outp "dp mst vcpi" api
Date: Wed, 17 Apr 2024 09:39:30 +1000
Message-ID: <20240416234002.19509-125-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 736c10ff-2b57-44f6-66be-08dc5e6ef9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5tjTLHaLv4ENS8h7smiJ4vLKDTEeazXkyRGKpIBDCOJC3ftLJn8+wAirofB6W6NLR4sRS+tAs+c6r+H/eCU4K3LJbbkpuv9TI8xC2ZxJc17LV1C/6TGXnLBMrYt1AGZhhY4EgdsHO5rRaDhKXG11+Q3WVn4oGMR38dvwXEosL/h72OkRZwIWmvwhl1aEAbLYg+tvxcwow+jZhd8b5AUZTJYTyZkjzIPVGznqtV4WwDvQZ9dzRK4vz/LZxQUqoSZCqsW7rYTKL/UqABLNmtWfv929a/e1JFEEEc/wbaRTo0h/nD+404I6T5bZ/2BZf7xnbscR6u+eHCv2OYpKDmisRMGqT8f9YsdMIHZmRCTSESKD3M+E/pUMkBHaKuhX80hNuvaSzFTZ4/iKQ/1O1MMD9wQ053mfGR2eImuEYQiFHpuxI9VY8HtYurhhdh83Oc2UwuGhlbIOHYHkU6T3pHWIApmhyex9PpO8JtPWI7BpvnwiDVAEEIGooqlCTwfsOS1ATDrovePSVfjETO2SdJxQ9uPDgp1yAAvLSiBH5rni6TjeMAP64rS9ixrYq4qU/NR+X2vDheKKOGAb6nBUTCyjAwoyDpKRqbeltewaO5DmRmCHrPpz0Hxnz9je3xw9lXo8CCkF/gHFWJJSKcBgeESLRGe+u3oafoWFguLhPhskjoCeL6BKWYL1bpq6vOWEW15L8pi/iMRCSbRPY4pLy+h+it9b2RflngmrRPQIjPRUeLrTnkgTU4oUXOJGPn9tre6
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:11.0335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736c10ff-2b57-44f6-66be-08dc5e6ef9e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  1 -
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 17 ------
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 -
 drivers/gpu/drm/nouveau/nvif/outp.c           | 12 +----
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 54 +++++--------------
 6 files changed, 17 insertions(+), 70 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0012.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 0bac0e813184..5e12de0aabb6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -50,7 +50,6 @@
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
 #include <nvif/event.h>
-#include <nvif/if0012.h>
 #include <nvif/if0014.h>
 #include <nvif/timer.h>
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e2123ba48fc7..f7c7a98089b3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -343,6 +343,8 @@ struct nvif_outp_impl {
 			   u32 watermark, u32 hblanksym, u32 vblanksym);
 		int (*mst_id_get)(struct nvif_outp_priv *, u32 *id);
 		int (*mst_id_put)(struct nvif_outp_priv *, u32 id);
+		int (*mst_vcpi)(struct nvif_outp_priv *, u8 head,
+				u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
deleted file mode 100644
index 3c74cd17a3a7..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0012_H__
-#define __NVIF_IF0012_H__
-
-#define NVIF_OUTP_V0_DP_MST_VCPI   0x78
-
-union nvif_outp_dp_mst_vcpi_args {
-	struct nvif_outp_dp_mst_vcpi_v0 {
-		__u8  version;
-		__u8  head;
-		__u8  start_slot;
-		__u8  num_slots;
-		__u16 pbn;
-		__u16 aligned_pbn;
-	} v0;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 7f7620ec1487..ea4d2d4f11f8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -3,7 +3,6 @@
 #define __NVIF_OUTP_H__
 #include <nvif/object.h>
 #include <nvif/driverif.h>
-#include <nvif/if0012.h>
 #include <drm/display/drm_dp.h>
 struct nvif_disp;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index cca1c28671f4..f04154e7a7b4 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -29,20 +29,12 @@ int
 nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 		      u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn)
 {
-	struct nvif_outp_dp_mst_vcpi_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.head = head;
-	args.start_slot = start_slot;
-	args.num_slots = num_slots;
-	args.pbn = pbn;
-	args.aligned_pbn = aligned_pbn;
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_VCPI, &args, sizeof(args));
+	ret = outp->impl->dp.mst_vcpi(outp->priv, head, start_slot, num_slots, pbn, aligned_pbn);
 	NVIF_ERRON(ret, &outp->object,
 		   "[DP_MST_VCPI head:%d start_slot:%02x num_slots:%02x pbn:%04x aligned_pbn:%04x]",
-		   args.head, args.start_slot, args.num_slots, args.pbn, args.aligned_pbn);
+		   head, start_slot, num_slots, pbn, aligned_pbn);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index eead485fe0e2..9d415a71c744 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -26,8 +26,6 @@
 
 #include <subdev/i2c.h>
 
-#include <nvif/if0012.h>
-
 struct nvif_outp_priv {
 	struct nvkm_object object;
 	struct nvkm_outp *outp;
@@ -61,18 +59,22 @@ nvkm_uoutp_lock_acquired(struct nvif_outp_priv *uoutp)
 }
 
 static int
-nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_mst_vcpi(struct nvif_outp_priv *uoutp, u8 head,
+		       u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn)
 {
-	struct nvkm_ior *ior = outp->ior;
-	union nvif_outp_dp_mst_vcpi_args *args = argv;
+	struct nvkm_ior *ior;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!ior->func->dp || !ior->func->dp->vcpi || !nvkm_head_find(outp->disp, args->v0.head))
+	if (!nvkm_head_find(uoutp->outp->disp, head))
 		return -EINVAL;
 
-	ior->func->dp->vcpi(ior, args->v0.head, args->v0.start_slot, args->v0.num_slots,
-				 args->v0.pbn, args->v0.aligned_pbn);
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
+
+	ior = uoutp->outp->ior;
+	ior->func->dp->vcpi(ior, head, start_slot, num_slots, pbn, aligned_pbn);
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -558,36 +560,6 @@ nvkm_uoutp_detect(struct nvif_outp_priv *uoutp, enum nvif_outp_detect_status *st
 	return 0;
 }
 
-static int
-nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
-{
-	switch (mthd) {
-	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
-static int
-nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvkm_outp *outp = container_of(object, struct nvif_outp_priv, object)->outp;
-	struct nvkm_disp *disp = outp->disp;
-	int ret;
-
-	mutex_lock(&disp->super.mutex);
-
-	if (outp->ior)
-		ret = nvkm_uoutp_mthd_acquired(outp, mthd, argv, argc);
-	else
-		ret = -EIO;
-
-	mutex_unlock(&disp->super.mutex);
-	return ret;
-}
-
 static void
 nvkm_uoutp_del(struct nvif_outp_priv *uoutp)
 {
@@ -619,7 +591,6 @@ nvkm_uoutp_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uoutp = {
 	.dtor = nvkm_uoutp_dtor,
-	.mthd = nvkm_uoutp_mthd,
 };
 
 int
@@ -703,6 +674,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		if (outp->func->dp.mst_id_get) {
 			uoutp->impl.dp.mst_id_get = nvkm_uoutp_dp_mst_id_get;
 			uoutp->impl.dp.mst_id_put = nvkm_uoutp_dp_mst_id_put;
+			uoutp->impl.dp.mst_vcpi = nvkm_uoutp_dp_mst_vcpi;
 		}
 		break;
 	default:
-- 
2.41.0

