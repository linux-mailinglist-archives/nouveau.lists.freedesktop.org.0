Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E58A791F
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F01910E206;
	Tue, 16 Apr 2024 23:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSHmaenU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BDB10E206
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr3PjVeQfcyHddxYVXmG3kbwF+styr4UV2ZPih8AttHlh6Jh0SSwu1WFT2ue+WvZyaqtI3Zk29v8t7l74RV5aTOUVBT/WcrL4YKB69LXn1RPAumskt6sT5U7Mj4AXGGGM+fbBXpa5VtCWqasr98QUN0jXRbswkg4zZyN1/q9qvIQesx+Gr2H4rrSNhIJDMJFYnK3kW4BhM+3nExWCXcHeEnGFOO0qvHBzEuHmx0JjzwURtcyMvDhtNNbXXSdVJ9upC70EQ+S9nRjWVHONZnEh9uPt4Ong+54mwz8csXCkm9LqcgBqbPCYnY34gnnEcbl8coBAkMsdZbz31V9LOqWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUkUkpnDY0yUWzZFEfhZ5XU+EkKVmwvmVlyhg8Oa2LY=;
 b=lOQ+NwDQ6hLVzqhaPv4Voi0TF+mWsncfV9JJRUYIFhfOjzONdPzLT+fCCimGuVgikvW+Xgs217Etm7TP/ieMtARKb9JZO1NGsadV68gQQoX9zCDxRYHegKf4QJZa3QHsCGCC5fTVZVdTCJhpE5nO5AOy58FrtfI9Fvoi8IrHv3NWzx33wwFWjKj07cECQxOd74n32wdzHvGTvfXajZmPSX61WbcxrP13k8auL+dEiA8XHs2dHJfvSy1YVXF5hCO8lLHqzDZPQk3OClQvNCm/t4suOxrdpHrAVmGdUks7e5nLigE2+l70eK7Bea8uZAuIKkaEl1SuTerk314JZNBIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUkUkpnDY0yUWzZFEfhZ5XU+EkKVmwvmVlyhg8Oa2LY=;
 b=pSHmaenUpLSDTJ6rVGV68t7bqrF1U0zuU218cLzw4G5AXr1WBikJ3wahB7kYBlLttyY0zwqI6tK+Vbq2FoQi51VmQO+CoI4zYJHZBRDXyVaCKMzIG3sr+Ce69m7qb3PtdPSR5R1uwjg8r5qYUpW3Ce1RpqaoVdQsan4si2VCVKblZOAQuvB0pHv4qJpRTQXN441DrVRWGpL/47cUgsUfrb3IJL0+JoIaSGI4SWt6XqDiSLKpxJOLDra4DczEhagGeD4751cJn8Db3MXiVKiYUt5B9ZvpO6/TneSZHWlj+Z513/ucN5OxWB7QYUPvtq5fUw7HrUCqJsMbo5OpQQz8fA==
Received: from CH0PR03CA0392.namprd03.prod.outlook.com (2603:10b6:610:11b::31)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:02 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::d8) by CH0PR03CA0392.outlook.office365.com
 (2603:10b6:610:11b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:02 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:46 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 119/156] drm/nouveau/nvif: rework outp "dp rates" api
Date: Wed, 17 Apr 2024 09:39:25 +1000
Message-ID: <20240416234002.19509-120-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acdfe67-1b5d-4d23-4aff-08dc5e6ef4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2vhddkz74cnw6pgQJMF/wn5zuuYkxqOJQJgMHqP6EOoSOnWxwhtDHTS8Ou9X8CdLy3a8zhxxPZtCNSoZDW3gftzvO+XD4vh4rRwuZwlYzKWjkN/bf4FLVKzLIbSF+HWBxGQ61ug9xIYNmirA7J40R5BgYXn/1Y8Hpe4t2StoFkOjPD1U5hSqtEEZQmvHUalsvXVt61bvwQE62e8kghKPk8jyVrZJ6Vn1trEr+UJFhDo8B+Tj9+qe5GMIH3oM709T4KZIRYtiOS/AyLu623UJMx0qXTkaRcBZ/N3zXyrMsLvHdpdNXAdaG9vOTRcWBXcnEL+TIdl//W0nCOFRCHo2jtGRrAYE0tfZiTfhVz9Stj1ptFkWSwxFVe3D+R93VE/NiQ7RemvusPW43gJ6fQ6rld02J7KiPtmBusYwRIan4k8EvpMGV9o6156vHM8PpiU5IoUHyUlbu6IjhRklDT/EereI4DrUQW0c7mdPrSmWfBzEjdEDFkUsfZaZJGvsecYQWq1+5n53x7xbUJinWtq79iLyCF9BEGyrqHKuUToFFlW/oniLSpqpedX+dcfZqrHWq8BBvEXj74Dt2SD3kUzFYlBVt05Zf9Q20rVjgXSkgBs2coGvfgPeAi7gVYCvtzgdYLJNDtQWrwuAThkn/JmteTXWSxVqTIzj4oa/N8bmHOFPMoA/yjo8FcPA9H4FJngbIjfte2EfyoksrN7tn22Iezfs6BtlQOXkxf5O7kY2rgFPog7GNq+XV1A7jCEj5co
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:02.1961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acdfe67-1b5d-4d23-4aff-08dc5e6ef4a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  6 +++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 13 -------
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  5 ---
 drivers/gpu/drm/nouveau/nvif/outp.c           | 17 ++------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 39 ++++++-------------
 5 files changed, 20 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 2069eedde843..9395ddad65bf 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -255,6 +255,11 @@ enum nvif_outp_detect_status {
 	NVIF_OUTP_DETECT_UNKNOWN,
 };
 
+struct nvif_outp_dp_rate {
+	int dpcd; /* -1 for non-indexed rates */
+	u32 rate;
+};
+
 struct nvif_outp_impl {
 	void (*del)(struct nvif_outp_priv *);
 
@@ -328,6 +333,7 @@ struct nvif_outp_impl {
 
 		int (*aux_pwr)(struct nvif_outp_priv *, bool enable);
 		int (*aux_xfer)(struct nvif_outp_priv *, u8 type, u32 addr, u8 *data, u8 *size);
+		int (*rates)(struct nvif_outp_priv *, struct nvif_outp_dp_rate *, u8 rates);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index b036197aadea..327ff9aa3ae0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_SST        0x75
@@ -12,18 +11,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_rates_args {
-	struct nvif_outp_dp_rates_v0 {
-		__u8  version;
-		__u8  pad01[6];
-		__u8  rates;
-		struct {
-			__s8  dpcd;
-			__u32 rate;
-		} rate[8];
-	} v0;
-};
-
 union nvif_outp_dp_train_args {
 	struct nvif_outp_dp_train_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 8be799c88aff..7f7620ec1487 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -56,11 +56,6 @@ int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
 int nvif_outp_dp_aux_xfer(struct nvif_outp *, u8 type, u8 *size, u32 addr, u8 *data);
 
-struct nvif_outp_dp_rate {
-	int dpcd; /* -1 for non-indexed rates */
-	u32 rate;
-};
-
 int nvif_outp_dp_rates(struct nvif_outp *, struct nvif_outp_dp_rate *rate, int rate_nr);
 int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       u8 lttprs, u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj,
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 602362aa0203..68af891505d1 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -134,23 +134,12 @@ nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 ltt
 }
 
 int
-nvif_outp_dp_rates(struct nvif_outp *outp, struct nvif_outp_dp_rate *rate, int rate_nr)
+nvif_outp_dp_rates(struct nvif_outp *outp, struct nvif_outp_dp_rate *rate, int rates)
 {
-	struct nvif_outp_dp_rates_v0 args;
 	int ret;
 
-	if (rate_nr > ARRAY_SIZE(args.rate))
-		return -EINVAL;
-
-	args.version = 0;
-	args.rates = rate_nr;
-	for (int i = 0; i < args.rates; i++, rate++) {
-		args.rate[i].dpcd = rate->dpcd;
-		args.rate[i].rate = rate->rate;
-	}
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_RATES, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DP_RATES rates:%d]", args.rates);
+	ret = outp->impl->dp.rates(outp->priv, rate, rates);
+	NVIF_ERRON(ret, &outp->object, "[DP_RATES rates:%d]", rates);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index f7226bcb9ef4..00b66d400f68 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -158,25 +158,26 @@ nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_rates(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_rates(struct nvif_outp_priv *uoutp, struct nvif_outp_dp_rate *rate, u8 rates)
 {
-	union nvif_outp_dp_rates_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (args->v0.rates > ARRAY_SIZE(outp->dp.rate))
+	if (rates > ARRAY_SIZE(outp->dp.rate))
 		return -EINVAL;
 
-	for (int i = 0; i < args->v0.rates; i++) {
-		outp->dp.rate[i].dpcd = args->v0.rate[i].dpcd;
-		outp->dp.rate[i].rate = args->v0.rate[i].rate;
+	nvkm_uoutp_lock(uoutp);
+
+	for (int i = 0; i < rates; i++) {
+		outp->dp.rate[i].dpcd = rate[i].dpcd;
+		outp->dp.rate[i].rate = rate[i].rate;
 	}
 
-	outp->dp.rates = args->v0.rates;
+	outp->dp.rates = rates;
 
 	if (outp->func->dp.rates)
 		outp->func->dp.rates(outp);
 
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -557,39 +558,20 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	return -EINVAL;
 }
 
-static int
-nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
-{
-	switch (mthd) {
-	case NVIF_OUTP_V0_DP_RATES   : return nvkm_uoutp_mthd_dp_rates   (outp, argv, argc);
-	default:
-		break;
-	}
-
-	*invalid = true;
-	return 0;
-}
-
 static int
 nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvkm_outp *outp = container_of(object, struct nvif_outp_priv, object)->outp;
 	struct nvkm_disp *disp = outp->disp;
-	bool invalid = false;
 	int ret;
 
 	mutex_lock(&disp->super.mutex);
 
-	ret = nvkm_uoutp_mthd_noacquire(outp, mthd, argv, argc, &invalid);
-	if (!invalid)
-		goto done;
-
 	if (outp->ior)
 		ret = nvkm_uoutp_mthd_acquired(outp, mthd, argv, argc);
 	else
 		ret = -EIO;
 
-done:
 	mutex_unlock(&disp->super.mutex);
 	return ret;
 }
@@ -702,6 +684,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.link_bw = outp->info.dpconf.link_bw * 27000;
 		uoutp->impl.dp.aux_pwr = nvkm_uoutp_dp_aux_pwr;
 		uoutp->impl.dp.aux_xfer = nvkm_uoutp_dp_aux_xfer;
+		uoutp->impl.dp.rates = nvkm_uoutp_dp_rates;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

