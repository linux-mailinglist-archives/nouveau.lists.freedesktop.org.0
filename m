Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF48A792D
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C25112F91;
	Tue, 16 Apr 2024 23:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kk0eg84k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCD112F97
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiJRrvUoxX9JCISz7FyamCFHOx0enq7mLJIjjSzdeiSC8EuwePblmd8Kg50FXEQrZ9MRMX+amViTF99qsF781dUSdpt7qMnYW7PlmdgABfrU6JANVsrHfriqF0CUvrYGpDkEJt9NtRMzD/WfUjqqKGR7mUQ+L6iCVFNBkTdxXS49YyjsOxkook0FiHQEbhmFfuHEdTwN4W4yzOqtislW5z4p3K/7g3F+bryklXeKH0DgGh3xhApKQGVT98ovJ4RGd9uKX0qh9VCYLPG3zLR8Y9Gna9tcISd0TftS2MVU/driLjYsijNShsbL4pjxKmlfol+aTTs1tdJApVUgVR/RPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSx2jRVbAmABkYWDRnZBy8lGIWvecPXSBrHNQcC9QSA=;
 b=DCN/I+tGT4TVNKogGq313wHxM611ijn6CXI4smi93ZiOT8gam6gvHD81CS1yINkNdDPWDA8Eh3AMegiKbPaW3PfM59iOO+Vl0Kdtxgf+cBRfvyvC1uPMQ47L1kwiVbT/J4GooO2v/F9xpS5xHuQuaWjewkg63aCtQEA4dEvmHOLFqcd/1GXMZe59zFyXnnevUsJkUGhiLj4sZqUUUQeyT2BM+0y7IXcXtvjxU+JW9h0v400Ub3v8nRoNo1ZGHuW/jJnKz/h/ONnpW/EUEAtCLXFi20OdXWILIn6UI65aYJCnB1uaR7u1O2EtYXRJ6n/1vSTPOxLKf6++kjimFvyxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSx2jRVbAmABkYWDRnZBy8lGIWvecPXSBrHNQcC9QSA=;
 b=Kk0eg84krCLZ+59rHoOfv1I6rtLDty8/VqQEvTWbCKdM4UQLKwKDbec1/F77dc2dYd5dsHQozYg4LVg4sBJnSqdPG7+tCXZhhZAaKxLN7ExIZWM4LtlmkPkHISri8BBAduauVb5JIHxFSO01/qtRJqryCah8lxfJrFIHfWej5LQj7gRXBSz8/OH9Lflv4aJEmXBsdWmqTRqaea97S9AQDdzNLiBt5W4GjQjtgAj9xvJgTHl39CeQ9tRc+Tc7qXRVMpjr2ReLg+zJqFvlUHxpGNfzrGEW3tXwBcDDuvq4+nUj1wlIXBvcGwqRIDekggUvvv8W7GrMFyjG8EvpwQ1n1g==
Received: from CH0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::18)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:13 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::76) by CH0P223CA0014.outlook.office365.com
 (2603:10b6:610:116::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:13 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:51 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 123/156] drm/nouveau/nvif: rework outp "dp mst id get"/"dp mst
 id put" apis
Date: Wed, 17 Apr 2024 09:39:29 +1000
Message-ID: <20240416234002.19509-124-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1c3215-7e6a-40bf-2ae6-08dc5e6efb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: knLa2J8hkfftZ3NYi20JsxgHoTR/qZLp4/f/iqVh3B6C9mmWC3WcjZU5xh2GbJTsyMHvhaJbTuV7D+uRKeMIDZIolCXQVG5LCTnC3zM6WWko1l77t0qa1l6o/KpCU3Mrs9ma+tPwos75UolRpHOfLsQV1tK8VMKalJKyAMjpIrfqnHKmxtcb1HeFZdCN8SsDdHRz/mqSmoCEmxnHiPK0VlyvuSb5G/W8JIBrWCByRQ1ntlW7Z2P8TQO4AhGkwF9vHUX3XhwYlzpP6djzNbO61pfDTX0+2bo8pmjiX8KsfY5bO+rK+TJh2XgknEBAvhLegiiBfbiQgzKdI4PwsfZja9foQ+eQfRmnvGgUEhBo/+HT/dcs/tZDOSykiloTcrpwVv3e9eh5B6MFkeESSebi8qBBIaOSubSwKaIKecDW8uGQ0PHv/3wOQzuBR2LrEF6je3FyW1yKmpbqze+Wic+L/JqMAZoHElcvZBO4JtSn5qsCyh6xtKYvTQgBd5gqP8zLnfQacckcH1cIZrD2ndVQ/Hvgz1fMmrTawcEzaT20x1uQwxcdI+hi8UV/QbkEvQg4mU+ZIgsW2brbEsYkWLdGlZ8vFFrUbRPKdBfR8wSY4yVRgrlPEtGUQPWSFN4PZ8u2kceXJC1rWhjReDVKbt85TG6b4NPsj4YupktgCebwlRrAmKKSLaO+n+byuTkTtEVOeVQtAfLpwCx44WSxifSTJ5VGyPMk5UWFLuUrRLTsshYJpoIbHHCevf/YwJJhxs8L
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:13.2617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1c3215-7e6a-40bf-2ae6-08dc5e6efb3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 18 ---------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 19 +++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 38 +++++++++++--------
 4 files changed, 29 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index dc103d2a20a9..e2123ba48fc7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -341,6 +341,8 @@ struct nvif_outp_impl {
 		int (*drive)(struct nvif_outp_priv *, u8 lanes, u8 pe[4], u8 vs[4]);
 		int (*sst)(struct nvif_outp_priv *, u8 head,
 			   u32 watermark, u32 hblanksym, u32 vblanksym);
+		int (*mst_id_get)(struct nvif_outp_priv *, u32 *id);
+		int (*mst_id_put)(struct nvif_outp_priv *, u32 id);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 92c4988101eb..3c74cd17a3a7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -2,26 +2,8 @@
 #ifndef __NVIF_IF0012_H__
 #define __NVIF_IF0012_H__
 
-#define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
-#define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_mst_id_put_args {
-	struct nvif_outp_dp_mst_id_put_v0 {
-		__u8  version;
-		__u8  pad01[3];
-		__u32 id;
-	} v0;
-};
-
-union nvif_outp_dp_mst_id_get_args {
-	struct nvif_outp_dp_mst_id_get_v0 {
-		__u8  version;
-		__u8  pad01[3];
-		__u32 id;
-	} v0;
-};
-
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index f56485c2ad2c..cca1c28671f4 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -49,30 +49,21 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 int
 nvif_outp_dp_mst_id_put(struct nvif_outp *outp, u32 id)
 {
-	struct nvif_outp_dp_mst_id_get_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.id = id;
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_PUT, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_PUT id:%08x]", args.id);
+	ret = outp->impl->dp.mst_id_put(outp->priv, id);
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_PUT id:%08x]", id);
 	return ret;
 }
 
 int
 nvif_outp_dp_mst_id_get(struct nvif_outp *outp, u32 *id)
 {
-	struct nvif_outp_dp_mst_id_get_v0 args;
 	int ret;
 
-	args.version = 0;
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_GET, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_GET] id:%08x", args.id);
-	if (ret)
-		return ret;
-
-	*id = args.id;
-	return 0;
+	ret = outp->impl->dp.mst_id_get(outp->priv, id);
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_GET] id:%08x", *id);
+	return ret;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index cfa386c1bbeb..eead485fe0e2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -77,29 +77,33 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_mst_id_put(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_mst_id_put(struct nvif_outp_priv *uoutp, u32 id)
 {
-	union nvif_outp_dp_mst_id_put_args *args = argv;
+	struct nvkm_outp *outp;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-	        return -ENOSYS;
-	if (!outp->func->dp.mst_id_put)
-	        return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	return outp->func->dp.mst_id_put(outp, args->v0.id);
+	ret = outp->func->dp.mst_id_put(outp, id);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
-nvkm_uoutp_mthd_dp_mst_id_get(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_mst_id_get(struct nvif_outp_priv *uoutp, u32 *id)
 {
-	union nvif_outp_dp_mst_id_get_args *args = argv;
+	struct nvkm_outp *outp;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-	        return -ENOSYS;
-	if (!outp->func->dp.mst_id_get)
-	        return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	return outp->func->dp.mst_id_get(outp, &args->v0.id);
+	ret = outp->func->dp.mst_id_get(outp, id);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -558,8 +562,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
-	case NVIF_OUTP_V0_DP_MST_ID_PUT: return nvkm_uoutp_mthd_dp_mst_id_put(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
@@ -698,6 +700,10 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.train = nvkm_uoutp_dp_train;
 		uoutp->impl.dp.drive = nvkm_uoutp_dp_drive;
 		uoutp->impl.dp.sst = nvkm_uoutp_dp_sst;
+		if (outp->func->dp.mst_id_get) {
+			uoutp->impl.dp.mst_id_get = nvkm_uoutp_dp_mst_id_get;
+			uoutp->impl.dp.mst_id_put = nvkm_uoutp_dp_mst_id_put;
+		}
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

