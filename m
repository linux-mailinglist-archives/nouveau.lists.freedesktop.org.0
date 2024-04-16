Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21428A7918
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9E112F7A;
	Tue, 16 Apr 2024 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YLJ0mX3C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B34C112FA6
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1fnbf6NXM+KGI1I1ZAUtdrDqxjRkBO/9BlOzlojXdu8F16qVzIuaU1kqr9legrI3huovicVedX36YAcIJWU7Kctapgt5RcRG0s2R3v3C9Sw+eift3hZpI8nO2Q8gV4R0pNeQ5+b4F9k7CPLAzUbBHGUR8O8AlZml3SgV+b/TIKpkB2juRkvp+itOaooD8llpwYdKPRqP5dGhe6hf+8mNkF5jZwGlJZ89VtQR7ckWRQY+BQ610eOh5UdMa6FOn7SIrHaeBF+vCYiELucFtgjeHZ+Wuz0x3JvXmrGsU5Xgj+VmFf8yJfqhJq7MnO37XZghR/sIY2tmUN4+KSw/fQX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcHL6g5/Qj2qASJnPWvA/cWLuGKYU1YODUuzTVP+ox8=;
 b=AWl1hnhj15UBq1T+SdsShw3k0i97KmJRjOIU1jkSew/NLIfyhO6gYv1G3rMLiZBnjehnM0e76LawR0MGrV2Ylu6vW//8H7+hsz8uw1wdaeCFy8bGgEBgULIPk+NCXrKrgl8zTgF/fQWbt8cdhaDI1VTY8e3Mj9SxlfphAv1K8XcM8eZ8x6K7e+zV5yt01o3q6Xpti8vtQdP7p/11TvlDJzcuOwlTV03T135dhGcjYTWoeiljJQG/3XajfztvubunnrQNnt9ZmF4hWegAsC7fyNlMJ8ilUiDmJ0R/mS5n9wgkUwrOOIgQZihSZt2pZvEQ1hl7OWW2q/SUHrNa8JBwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcHL6g5/Qj2qASJnPWvA/cWLuGKYU1YODUuzTVP+ox8=;
 b=YLJ0mX3C7mQdTmBoWDaZj5l/Xt/zFPWS7nxh4tUBlMLgtkrm3zc73YpmxeOn8S0lhblyYhTKBsosi36YVMkiR28cpXMd9X0uSwFHslo5rFdJtASr6injFFaJQ1tQ1LW58w+2zwlZnCYd/OM8MYCBjBvv9LUEi6ZNkoeZrYssAUrRmUqcV+iyCeRpGmJ7x+oRBeb6OA7bqSRxsJELHDQ7CUl6VQAKNQoCxWzX29HVpDVmV+PJcxSgKT0PypkgEtejqimHfK1EeBu2x9ypdPRCuV6OJYXSrohRjAaJHXzWbJfqBj+8ijAwwB+7qvmySThikRK5/wfekYg3+mTFhM3Nkg==
Received: from DM6PR02CA0053.namprd02.prod.outlook.com (2603:10b6:5:177::30)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:54 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::99) by DM6PR02CA0053.outlook.office365.com
 (2603:10b6:5:177::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:34 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 108/156] drm/nouveau/nvif: rework outp "load detect" api
Date: Wed, 17 Apr 2024 09:39:14 +1000
Message-ID: <20240416234002.19509-109-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aad769d-e861-44f8-505b-08dc5e6eefa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8sdBSYKiH2fZ3JL+Zub4YFWnXoYkymmv+uaXeu0RiLjff/FBu7RBG8fpWz7eeB0Yj7alYTSsnNIes/ITDDTUh5C27i+7eM8YA78/vQaniExxj2+NPpTNIerGwfgWtuqRWJ7Cnl88WBt+pYmxzDQaF+KAPEu/+Hv3uXqwbIFBj8YcRlx29G/BUKffVeU97V29WxF/FfR/rKX/BOmIFhqp+pIL/npQMhXZoMXzUdhQqpvJ6Bi++aZqdYMljRAQ2ODDoWlueGHRnuH855759CGDeqjGf8fE//QRlsU+TJR20iY38kqecSTneEGW84TgxRtdfK8TjJ6TM5NnAWvuyYBT89uSe76CCHX7rBFlqVv5du1DJgAPDMA/GMF4iOgNTJ37bM7IdHb67OZNX4ftK8Igwxt6rLbN0LunPh0P/bMW07EcEdlnXKmmQm+AC1SsEZtQmSDa4RWUlasYt3sJ8xeYQdG3HlfUtAYwoG3UOz21UTKBA75egbtiCqmNlAMk6ihcI/OJblR7HLffOBnveKx3pBpyfyPzWZZyHg2/Z+8l2MeiZkozWIDaXIe1HXGQOVQusUnToFfjXKz8BYJbvx8d/KVe3iMT2w9txOkrjbp2lB0FBO6M1afwGRf9pzWUbz/M2Mlb8/qHx9TbNHqe0VBul5j5nx7AEXGebXbgdn4dPgIUTTzCXZTOF5Lu5NV9y8GXHjt3tcufW9HQIromAkpSexRG9ZNTZ51gfOPcGIXYmUrybx1Rxx5Ue1LVqOs0NY9
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:53.8429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aad769d-e861-44f8-505b-08dc5e6eefa6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  |  2 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 11 -----------
 drivers/gpu/drm/nouveau/nvif/outp.c              | 11 ++++-------
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 15 ++++++++-------
 4 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 966a9bb543d1..39b0e8d002f8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -276,6 +276,8 @@ struct nvif_outp_impl {
 	int (*detect)(struct nvif_outp_priv *, enum nvif_outp_detect_status *);
 	int (*edid_get)(struct nvif_outp_priv *, u8 *data, u16 *size);
 
+	int (*load_detect)(struct nvif_outp_priv *, u32 loadval, u8 *load);
+
 	struct {
 		u32 freq_max;
 	} rgb_crt;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 80c4da3e8aa5..586b44fa8814 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -8,8 +8,6 @@
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
-#define NVIF_OUTP_V0_LOAD_DETECT   0x20
-
 #define NVIF_OUTP_V0_BL_GET        0x30
 #define NVIF_OUTP_V0_BL_SET        0x31
 
@@ -30,15 +28,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_load_detect_args {
-	struct nvif_outp_load_detect_v0 {
-		__u8  version;
-		__u8  load;
-		__u8  pad02[2];
-		__u32 data; /*TODO: move vbios loadval parsing into nvkm */
-	} v0;
-};
-
 union nvif_outp_acquire_args {
 	struct nvif_outp_acquire_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 56441763e3da..59499eebc5ac 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -424,15 +424,12 @@ nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out)
 int
 nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 {
-	struct nvif_outp_load_detect_v0 args;
+	u8 load;
 	int ret;
 
-	args.version = 0;
-	args.data = loadval;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_LOAD_DETECT, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[LOAD_DETECT data:%08x] load:%02x", args.data, args.load);
-	return ret < 0 ? ret : args.load;
+	ret = outp->impl->load_detect(outp->priv, loadval, &load);
+	NVIF_ERRON(ret, &outp->object, "[LOAD_DETECT data:%08x] load:%02x", loadval, load);
+	return ret < 0 ? ret : load;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 37521fa2cbfe..d3f69d6a10f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -468,25 +468,25 @@ nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_load_detect(struct nvif_outp_priv *uoutp, u32 loadval, u8 *load)
 {
-	union nvif_outp_load_detect_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	nvkm_uoutp_lock(uoutp);
 
 	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
 	if (ret == 0) {
 		if (outp->ior->func->sense) {
-			ret = outp->ior->func->sense(outp->ior, args->v0.data);
-			args->v0.load = ret < 0 ? 0 : ret;
+			ret = outp->ior->func->sense(outp->ior, loadval);
+			*load = ret < 0 ? 0 : ret;
 		} else {
 			ret = -EINVAL;
 		}
 		nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
 	}
 
+	nvkm_uoutp_unlock(uoutp);
 	return ret;
 }
 
@@ -551,7 +551,6 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	switch (mthd) {
 	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
-	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
@@ -651,6 +650,8 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 	if (outp->func->edid_get)
 		uoutp->impl.edid_get = nvkm_uoutp_edid_get;
 
+	uoutp->impl.load_detect = nvkm_uoutp_load_detect;
+
 	switch (outp->info.type) {
 	case DCB_OUTPUT_ANALOG:
 		uoutp->impl.type = NVIF_OUTP_DAC;
-- 
2.41.0

