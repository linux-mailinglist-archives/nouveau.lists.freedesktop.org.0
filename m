Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F08A791D
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C17112FAC;
	Tue, 16 Apr 2024 23:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e5a0knK5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B4D112FAE
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egt/ikmj4MdO7a74atgo9FGJUzGXzz0AKMIz9QZWQbn0LhXS91E1u7nlc1uDOIzcQr05fblWAppuTNzFEgREm555yOWYoFM6KewQvEfEB9q8jPKYUoovgbjZVTzJ/teLmR6bvEqeElVqwHYWqeqPxSJ3PqiAUlN4+v59fsFc4gxPcBODvp5oF7B++z8zAiPYorkURSVjWhciPfAch2b7rXH6+pXfc2KDtJzqgrA5A+Aye6mintbTC9VA8nhSryzdXM+BRVEpB07KnJe5wk5c01Zvg8uBfBAHB1CjstATATbGl7rblAGuMcaJYAcqdqcEOTlCsQafs4SHdlR0p/7G5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGS/tD2V3UGSe2mbc5zWNhDTUNNRQky+d6hO442Htcc=;
 b=dpwe3bfVUzXaOpY5M4smO+CPJkMlWeZYa99BhhzPbExIu5JvCi/5EIMgUhYWL6KC45oHJ9kozmGugcKRZRXK/TKoi1UAFvzkdRy7thV3hZHLwMlTSscwX6ovEzb/+6GcE0xorDE1pQ7rxOaffnBg6aAUbP/m9Nemq15mURT4OaUP7L0l/A4vPfX3TUCoy8IdGrmlyyRMq/1FXZwC3EwS2E3sSEpQhuWha87z2aEd361JJ9JahnccJNmdxyYFrzkh4NO4vHO6YKe3NC26emelJVt9nu9s/7Rk1dzvRId35GKHMgfz1Pu/JP4BccFeyrPspASKxeXHI5R9FV8aRjTS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGS/tD2V3UGSe2mbc5zWNhDTUNNRQky+d6hO442Htcc=;
 b=e5a0knK5raUCdROhz1cMxka2fcLr3wwDux3/2UFZVw45YHvDClBesdxIfptFLXgktUeNbullGoSPpw8PM02IrfM5PjF2xodLRgzhZu4iYretCrK8bgpVPjk6O3X0AIfwDNb5YC6ac4CzJc4vshWOKtOEo23C3tlYtp2sVmAttc6W0wbTeBwKM/fAg4ALC446mfVoz2S01nva+g/BZHysNK3pMH6mfnlayeikiNIQgce4IDe33o1LfJ/JjDjyhkijN3th0kL5ddiWnR51IXsRXB8jWWtwhMezfupI/fe9Pt/uGaN/9lTYzxVfD9cPtSMs+bWTr2KyaUhUJ+pZi4zPQA==
Received: from CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 23:43:00 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::df) by CH0PR03CA0290.outlook.office365.com
 (2603:10b6:610:e6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:37 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 111/156] drm/nouveau/nvif: rework outp "release" api
Date: Wed, 17 Apr 2024 09:39:17 +1000
Message-ID: <20240416234002.19509-112-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2645ee-8a01-4977-e7ce-08dc5e6ef39f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYifvedVqZXV/U4n/Jnr5QqS0Sq6cbe+a3VwfJGeJZaIdcBVsVWixhgBSbcfnGkwkXGHeE5UFQEHCqGdDQ8hW1AGY4LxA41y/q2HwAOwejQUEFPi8/P1BhzIXIxOldIDNGXLlWAjG668srnkuHK8zCjgXpJq92k5d3EVVDaMrfUtgS8BURNSMyOKayeGVlsbGq6+hQugRD8D8udqKr8Ivbbw1fZOEjWYAZnhmoq7Ddv8OcGzdrG8QkH876J7t5R2gwYh9p5Gn25NwqMNIUrypNSc4JRy2DhGRQkj/PGsu03BKBnibZcfa6tvqvV2svEbve6KFi+sB+dk32web5u+jUhAgwvBJoK71kd0aS4n6l4qpjaEQ95cumotTKIrYv80J6FpjCBurKPb+u6tNG/DWHJf1SQpIKfJS5Thc+I6Oevsl1eJgjvnMpE0t6FAiSj+ohCjQ4sHLyGMUSNFGBndYeOx/0Ysg6diR0uku69+bsF3iftpMT3AEUKfWrsuzcsGENNPKGnA3x566BMXXW6RFdPn02im8oo60tB32SAx8mZsPB7eNRbVmR4i1pvVmYxSZFd8nnZ+8xlWz4opEnrGWGpu8ZT5wU1lzmDREOOxhRgfIAldAuWz3OuE49MFn+D2FkSRMwVk3M/FxraPmbIgwtPNgCKSHEg0i4oAw0B7V2vzCe+mj+xRdV8bZ6ZWN4o3HBgpx0UWEH6shK5AlRWfL2GkG9XxBVzDt4xyZtDV/X7HC/Xp4bQ1/RWK/eRnm/fn
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:00.4805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2645ee-8a01-4977-e7ce-08dc5e6ef39f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  |  1 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    |  7 -------
 drivers/gpu/drm/nouveau/nvif/outp.c              |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 15 ++++++++-------
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index a2e0423f76c2..2b29ac64e5cd 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -279,6 +279,7 @@ struct nvif_outp_impl {
 	int (*inherit)(struct nvif_outp_priv *, enum nvif_outp_proto,
 		       u8 *or, u8 *link, u8 *head, u8 *proto_evo);
 	int (*acquire)(struct nvif_outp_priv *, enum nvif_outp_type, bool hda, u8 *or, u8 *link);
+	int (*release)(struct nvif_outp_priv *);
 
 	int (*load_detect)(struct nvif_outp_priv *, u32 loadval, u8 *load);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 3cbdb5fc4757..1a8f0720c14a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,8 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_RELEASE       0x12
-
 #define NVIF_OUTP_V0_BL_GET        0x30
 #define NVIF_OUTP_V0_BL_SET        0x31
 
@@ -26,11 +24,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_release_args {
-	struct nvif_outp_release_vn {
-	} vn;
-};
-
 union nvif_outp_bl_get_args {
 	struct nvif_outp_bl_get_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index ddcd2b9d69f3..efdcc1c28874 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -296,7 +296,7 @@ nvif_outp_bl_get(struct nvif_outp *outp)
 void
 nvif_outp_release(struct nvif_outp *outp)
 {
-	int ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_RELEASE, NULL, 0);
+	int ret = outp->impl->release(outp->priv);
 	NVIF_ERRON(ret, &outp->object, "[RELEASE]");
 	outp->or.id = -1;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 46ca915f0206..f5d3b3647dac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -359,16 +359,17 @@ nvkm_uoutp_mthd_bl_get(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_release(struct nvif_outp_priv *uoutp)
 {
-	union nvif_outp_release_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
-	if (!outp->ior)
-		return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
 	outp->func->release(outp);
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -530,7 +531,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_RELEASE      : return nvkm_uoutp_mthd_release      (outp, argv, argc);
 	case NVIF_OUTP_V0_LVDS         : return nvkm_uoutp_mthd_lvds         (outp, argv, argc);
 	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
@@ -602,6 +602,7 @@ nvkm_uoutp_impl = {
 	.del = nvkm_uoutp_del,
 	.inherit = nvkm_uoutp_inherit,
 	.acquire = nvkm_uoutp_acquire,
+	.release = nvkm_uoutp_release,
 };
 
 static void *
-- 
2.41.0

