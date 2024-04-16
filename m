Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C08A7919
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDD6112FA7;
	Tue, 16 Apr 2024 23:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rgU5fw3p";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9C112F9F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoTiVYiCY6z89a67MUKczPJdSiZCeehef1/5pmblAPNtxTW3Nc/7mj43CJCXsI+UaDioQ2SE3AbIMoRSJc5T2cF1O39tTXkUGunt34JOA2xKFVIOwVeSWHP8oNvqy2LziUaCWEqgrgdl2feCVbJEtZ9jXiDrB4CajdDBrHfY/n70Aa06bTy3pP2AFiVu5pZGqrOvHBqb8v7yrHr19jYU1Io8tS3INzdiw9JwDRuewval4uC93x7MZovm84EI1uhvcHK8u5AINiOdrOP5s9AG7Xr7bBxFyZNRT8kr4cWk+ICiHff6TwCe4id3XVvYB1buD7m4fQdA4siAtkdl21Uspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD4gmWudWmFn/ZAhAq2Dxp8H5FOSqtUwYCUexcb6Al4=;
 b=b4b4/rELQmZyDqqwljMU89183qxb3k1b0UZtQhLiT/sAcc1caQgu4ownq5XUGl0QQc3mHd6mOv1aWr8ZUodSYNxODOUDDbewAMQKFTDsepcv4TUrfW4Rb8Q2g/KuAlwzvlPW1OYCMzseyhXUAaudgK5/erk9RHPFCjjjiGEY/rrpF1NjdeTPZZSyBwTxavuxnr0NL1AYkQKm3PkaRhXGDgf/sAZglEN4p6EfuIc2IAEOaUKZJxAw76GI1cN5jXs114Q24qlpbr3w6akhrRxtF+9yfeenn1DxpsFLAujj5Q68p+abL22VmnbLNhjG+J6PysKCqvDNNwaVas1zO5oPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD4gmWudWmFn/ZAhAq2Dxp8H5FOSqtUwYCUexcb6Al4=;
 b=rgU5fw3phhfjoPA00YuTI0oiImOtaXtEV9spWRkSwfkjX2QJx+k8yiakkwmNJMgfcP8QwKl+2T/o+LllTdKzHhzTfv8PTKk907IqRRxT65mJ/icZ+ZNz9KHct1f41f0ASWU7l42IIlh6aNjpGHlKbikQvy3zq20Am7vfxXYWBJU6OKhuU74ug9wMEMcO1Fq3B4M++HMKZ8rMtpW1oA9zC/F/pHYcGotx5OsC14eiyGXkNfgzlUB3k8brNtE9eSDeZChNUbAiMLU4nUjhyw1yipls6iVyuYXYS3oJZh9HQRp6l0xMAzB+eFoQZ5XBD2DrtfnYZqbhW21OvmzrI/I6mQ==
Received: from CH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::7)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:55 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::e6) by CH5P220CA0001.outlook.office365.com
 (2603:10b6:610:1ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:33 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 107/156] drm/nouveau/nvif: rework outp "edid get" api
Date: Wed, 17 Apr 2024 09:39:13 +1000
Message-ID: <20240416234002.19509-108-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb007fe-1902-40a3-bc9e-08dc5e6ef042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgoRVMNLMJpBf3sXRqjKaQVxh72DD5Bwwmza7b3p+bVaWxNEmjjwquunBIOfhr4UGA1U7J/iKKojcctxIdC88jmvM9hHWo3x8N4Ye5x0gUUL9dIu8nQHZfmAcUXkRQT16C+ENqkc4aoEQ3DXiDZEl9fuSbTmTcKhrYbiHkUamcnkAqGyhpYRtEGjOExem3W9+gqbJvkcD9SBUbF+seQq6vGd9OJnd9Nwctmk0W4RQTpDP4Qoxejkb9rMvG+5wXxTZ8BHFmSBaqx093b3Gfzf6g9gcYAEne0+8tw/hai7q3/NgVMO3wvq3BPusc4w+4mLoc5oQBeuLNSlDCPRqavmPB0CVCpz9KlcqYLHaZkXMlnhR0o9uOc1evOMZe2uc0XlBJn1CE9tleGC+GAAdd+MBH1zvoQAkNSPkIeT4cB/PaBztIm4M1viQkWtKPskHAOgc5gOaFGFokilkec0LVEdJFqzLoX+d9d0y5/WlegudF6IE5FXD9NepP09fDqm7o/td49XvFxNIJN94KyzXAPnaWmM5ZDFHtCnsY3XtjLFoY7etQXgfO/JxfIwx6xUr+aHIpoiZUVeeKUU3SCnOmHg6tuId31GNpMUtfurnPMosWep0df5XCpzQLM8Mp1dW/mnsqha6tivsq9ApXFic9L/VEW5O8/of4L3hJG+1HY+8bWbrxVv2q3ve85mZ5QAXAMXynneqxk7fEitHcn/ZS2tY5p0rnb8NJ4vlYGG3UmJ2ot52H5b7rOLCkgqPRg0NvSo
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:54.8368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb007fe-1902-40a3-bc9e-08dc5e6ef042
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
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
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 -----------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 19 +++++++++----------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 19 +++++++++----------
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index fd05065374fe..966a9bb543d1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -274,6 +274,7 @@ struct nvif_outp_impl {
 	u8 conn;
 
 	int (*detect)(struct nvif_outp_priv *, enum nvif_outp_detect_status *);
+	int (*edid_get)(struct nvif_outp_priv *, u8 *data, u16 *size);
 
 	struct {
 		u32 freq_max;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index c0c13cb64994..80c4da3e8aa5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,8 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_EDID_GET      0x01
-
 #define NVIF_OUTP_V0_INHERIT       0x10
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
@@ -32,15 +30,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_edid_get_args {
-	struct nvif_outp_edid_get_v0 {
-		__u8  version;
-		__u8  pad01;
-		__u16 size;
-		__u8  data[2048];
-	} v0;
-};
-
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index b704886c1bb6..56441763e3da 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -438,29 +438,28 @@ nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 int
 nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
 {
-	struct nvif_outp_edid_get_v0 *args;
+	u16 size = 2048;
+	u8 *data;
 	int ret;
 
-	args = kmalloc(sizeof(*args), GFP_KERNEL);
-	if (!args)
+	data = kmalloc(size, GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
-	args->version = 0;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, args, sizeof(*args));
-	NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args->size);
+	ret = outp->impl->edid_get(outp->priv, data, &size);
+	NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", size);
 	if (ret)
 		goto done;
 
-	*pedid = kmemdup(args->data, args->size, GFP_KERNEL);
+	*pedid = kmemdup(data, size, GFP_KERNEL);
 	if (!*pedid) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	ret = args->size;
+	ret = size;
 done:
-	kfree(args);
+	kfree(data);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 2324549787b6..37521fa2cbfe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -491,17 +491,15 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_edid_get(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_edid_get(struct nvif_outp_priv *uoutp, u8 *data, u16 *size)
 {
-	union nvif_outp_edid_get_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->edid_get)
-		return -EINVAL;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	args->v0.size = ARRAY_SIZE(args->v0.data);
-	return outp->func->edid_get(outp, args->v0.data, &args->v0.size);
+	nvkm_uoutp_lock(uoutp);
+	ret = outp->func->edid_get(outp, data, size);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -551,7 +549,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
 	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
@@ -651,6 +648,8 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 
 	if (outp->func->detect)
 		uoutp->impl.detect = nvkm_uoutp_detect;
+	if (outp->func->edid_get)
+		uoutp->impl.edid_get = nvkm_uoutp_edid_get;
 
 	switch (outp->info.type) {
 	case DCB_OUTPUT_ANALOG:
-- 
2.41.0

