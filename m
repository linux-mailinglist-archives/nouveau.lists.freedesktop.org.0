Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9E8A792A
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1A6112FBF;
	Tue, 16 Apr 2024 23:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BT6CrFpY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA5D112FB8
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmF981NByzHM2VHs2k86qs7jUT5d0Q562tx6AXTRxD4sNQFksyQE5c6SoEQ/TG2a0G1KgOSbniyWrea9ldK9EVd+AKPDhD92HP1YAvT4aefQq5uaEExFTL/vc1KtcxucWX5L9Tqkw0F1yZP3lFzStXEHE85DhGMHrQAJaiIlIZWY1AU54MRG0FmW1JbhkEvo+euLPqdGpVIrMpl4idP7qwFnn5f+Q/5bkMfQQRW6ucIxEMOGTrkKhcgyZVfO0uhBuHEnSZTZ9/mzbTKrnKFpHb4YYb8TxomSBmNKsIVYYwNBI1CQW5ejjVxyVeoiKwYu5Lk7JbrG1nN+pqbOu0jP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9WCZME+fQ+vz6/bg9fEkcjGJ+QnGrWFk7e20rfWgVM=;
 b=JwouXlKnMwoAEOMIShdvbb9VukpPXT34CPIioo4ll84Vopwn1WJECJ5rB4Gbv06NdH8q25nVhTwmzq19OJWHmi91K/Ctnc/6zhUUXrdRMXibEa4pRjMr5HFR0LmclXZYyBUnDJJ3DQj0ttHRiXYuNqwBbyIqb8oEXDjxlKRsqmaepBkjEHU92hDU96+gWdgc0z2tsuGy9VVNb6nprijQWm2bycedeFEu5EQe/1xeviK6X4VkoAOQ35iDlunQvuVLA6fAmj1zIppHHNG8Z3uV334bnrvWrPUUnD5wN5D+hOQjWflPTdB9+QkPKg2JxUeCoE70ztBbjXUIO+94XEKAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9WCZME+fQ+vz6/bg9fEkcjGJ+QnGrWFk7e20rfWgVM=;
 b=BT6CrFpYFcsZWSelUVTyfrAFVPJeJyZBJC7uco5ZCUO4jhNC6q5DV2V+6xvGilUstv5Bo1JiIU90UvcmJMe396AbVlbSYaImJQa6slq1ZUXPGh6BJx9akzQm2u0ObgqU1HUP+beCY12y3ZI/NMlPiVY3UmkvSAZvF20DZyN+xXfKq/Nzhp+TY2Rzsukf9ERdCvDL4locD9jlZHMQhukNF9qx6fUm3iThZyE7MnSyOzMxDpaW8+aFCue2KzC4qRyBF+qDd6TdYoFGewiGcK0PpJKRsE/fTW8Y6ng/3/qfhugpAlKtI8gcdjNotwO5y1nNuQbSfegkn0fqjIkutf9C3g==
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:06 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::7b) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:50 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 122/156] drm/nouveau/nvif: rework outp "dp sst" api
Date: Wed, 17 Apr 2024 09:39:28 +1000
Message-ID: <20240416234002.19509-123-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc1a6f4-7148-419e-7017-08dc5e6ef68e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuOSwbEnZ7bIOLnbxBQ7IsZXmbXpo0ILNy7STKO0efd3cR8VPP1xyVNCjQNuDhHC5Nz7/lks+O0ErdRydWZc16oLf+em6WlRQzUe2kk2K05ewioSa3ilgm3b1oE+pUUBFu3Rjqn7xdcZVk0P3270+jEmAgw4QOjxi3TCwdg7I5vozafsjmrQPO6UGV5Y6gs50cfzhgH+rl7GVZktVE9i6CE2zUZQP4w5T9ZZOBvIgOVal0zpC04aIsfDUYd/6AwLLdkzi8kOul8r6IO2p8AG7djfBaKofA+tm1Bem37qGoeRWsZYAmy//GZQfQA6g9FkMXrTQ61c5fms50CIWS9Bt/fkCV8Bh6SZbAmfuO0aHTvB/fshAE77qPsRPFMO+flrkDBABqPHYiTirewS7pXYggKi8MDpt4UAkQPGnhlQJFaapwz5iPrSlj3HlqgTFYUO7O4jVHJT+iy4Cva9w4ZuW3CmA2kZ6A/P3IpqAvTPhqNa8ikS5PecMK2mSHRmQYy7oK7rzmnEF62/wQHS4JLJIsE6nYkG5mYeMYxAB1lXYgI7lL/VpHuHVvHX9ELuv7KQXo6EKXcNgXcex/7mMqbc95W3QsTVoiVOB11IfurnnuC9NZsVzGqbdgWZJWgzB8cosmXGonyCzgw2kLldmE8i9SKGX+B1JJiwfhgfC0UxQow3U1Q16Vdi917RHY0aoR1zlq4wQcRTMRThZGA6d2URF9fUicHOYyb0FJmPS+CVSxYdQVNl61OcxKnXjnjss34M
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:05.4148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc1a6f4-7148-419e-7017-08dc5e6ef68e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 -------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 10 ++----
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 34 ++++++++++++-------
 4 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index db6fb1347b72..dc103d2a20a9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -339,6 +339,8 @@ struct nvif_outp_impl {
 		int (*train)(struct nvif_outp_priv *, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
 			     u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain);
 		int (*drive)(struct nvif_outp_priv *, u8 lanes, u8 pe[4], u8 vs[4]);
+		int (*sst)(struct nvif_outp_priv *, u8 head,
+			   u32 watermark, u32 hblanksym, u32 vblanksym);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 8b0f90327187..92c4988101eb 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -2,22 +2,10 @@
 #ifndef __NVIF_IF0012_H__
 #define __NVIF_IF0012_H__
 
-#define NVIF_OUTP_V0_DP_SST        0x75
 #define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_sst_args {
-	struct nvif_outp_dp_sst_v0 {
-		__u8  version;
-		__u8  head;
-		__u8  pad02[2];
-		__u32 watermark;
-		__u32 hblanksym;
-		__u32 vblanksym;
-	} v0;
-};
-
 union nvif_outp_dp_mst_id_put_args {
 	struct nvif_outp_dp_mst_id_put_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 3d4461e3a2cd..f56485c2ad2c 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -78,18 +78,12 @@ nvif_outp_dp_mst_id_get(struct nvif_outp *outp, u32 *id)
 int
 nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym, u32 vblanksym)
 {
-	struct nvif_outp_dp_sst_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.head = head;
-	args.watermark = watermark;
-	args.hblanksym = hblanksym;
-	args.vblanksym = vblanksym;
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_SST, &args, sizeof(args));
+	ret = outp->impl->dp.sst(outp->priv, head, watermark, hblanksym, vblanksym);
 	NVIF_ERRON(ret, &outp->object,
 		   "[DP_SST head:%d watermark:%d hblanksym:%d vblanksym:%d]",
-		   args.head, args.watermark, args.hblanksym, args.vblanksym);
+		   head, watermark, hblanksym, vblanksym);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 3d5b6cee97bc..cfa386c1bbeb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -103,23 +103,31 @@ nvkm_uoutp_mthd_dp_mst_id_get(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_sst(struct nvif_outp_priv *uoutp, u8 head,
+		  u32 watermark, u32 hblanksym, u32 vblanksym)
 {
-	union nvif_outp_dp_sst_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	struct nvkm_disp *disp = outp->disp;
-	struct nvkm_ior *ior = outp->ior;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	struct nvkm_ior *ior;
+	int ret;
 
-	if (!ior->func->dp || !nvkm_head_find(disp, args->v0.head))
+	if (!nvkm_head_find(disp, head))
 		return -EINVAL;
-	if (!ior->func->dp->sst)
-		return 0;
 
-	return ior->func->dp->sst(ior, args->v0.head,
-				  outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
-				  args->v0.watermark, args->v0.hblanksym, args->v0.vblanksym);
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
+
+	ior = outp->ior;
+
+	if (ior->func->dp->sst) {
+		ret = ior->func->dp->sst(ior, head,
+					 outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP,
+					 watermark, hblanksym, vblanksym);
+	}
+
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -550,7 +558,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_ID_PUT: return nvkm_uoutp_mthd_dp_mst_id_put(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
@@ -690,6 +697,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.rates = nvkm_uoutp_dp_rates;
 		uoutp->impl.dp.train = nvkm_uoutp_dp_train;
 		uoutp->impl.dp.drive = nvkm_uoutp_dp_drive;
+		uoutp->impl.dp.sst = nvkm_uoutp_dp_sst;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

