Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0DE8A7948
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4335112FF3;
	Tue, 16 Apr 2024 23:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UXgc2w42";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3753112FE9
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1AIEDniYnVLMwUDSI17rNjXuPPeKyfa65Vyfxkc5CFZnEgbamw8s/d6lDxR1YQtRchCl9XUW6L8PtThDFKmITh2q3/acpscAz3z9oANi5COBdvOsbzDDq5NXyJCS51jVYnxUYjkQ8NFpMi7gNnqSHBIoCjKjEXx2ry9TzSmsi2zyO8j9ZM6I48mcc0fhmeSMuGVBKB+Uneqim1q30cRPFgZdkE73sy0nblTowMb1yCmPgYt1SHvfqmvL2KhOhbpRDitebhW8f6oWsWS0SCwChl8MrGk9WMy3ev3lDbcrvN3NPHpj8aiZNGd83BMaUgLUI6XjbF6fiNl0rv36X8DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFkaM+xgyYmrDjZH2f2xhWE7t7EdVXjoKWYUOq/1HZc=;
 b=X8CTpYK6eiow+llb0LlJF/0aMtC9pxEE34bmbqEVJCi73QPxp9IYy1kBAhFyz83CES7e9TbjcWWHTy7iikq16jzIkWxKP4qOCN3+pZRKJaL8UHB01xZzHBhnlgz2zCvGa35MTs5880wyI16UTAzD6NVTvzEYOilcv8c0RGEyYv9LpDTgGsoEBSZ6cTVUD1Uj2esff9FiTTPAy0IzvHjv0mkiTlInqEq1at18LHSZ8YkAskWfA9WexH9JgT4WEONd+GtNXNvr7OsOfGI99xWTnomXqXgy/GnPX7BJXH/7psLkEWDHA/nsW3H072UVDpFRQjktct7/rRhcMggdnLrpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFkaM+xgyYmrDjZH2f2xhWE7t7EdVXjoKWYUOq/1HZc=;
 b=UXgc2w42dGqtn+JFjUA9/iw9UqoC35Qwp3sS0Avfi22r6N8w673HqxvYUI9fYo5uoC4TDLThLJug+Mvb6eVzglAApnzgIKAiMl4lQDD4Mk/TjOcXezG/pWiwlqI8C6FpLrv8w339x1Q/e/Ws7yiUIkv8L0chZvHCGYrskJwfEL7S7RXqyntp0Ov0vWS8jR+8iEo/3ZeZXZw2G70+bMDY2WxCLMf/M13j/dK4Xwp06Z1VJJcY8rdlzy/wtMbiz2Qf5g88Wen0LQJX1UpgHsCxfGq9Q+b0zwtzuje0l1RFo79xhIuTt9nmLKe3hu2wxMaaTaerPxVBlqCM1SGHOFukzA==
Received: from CH2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:610:50::36)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:47 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::4b) by CH2PR16CA0026.outlook.office365.com
 (2603:10b6:610:50::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:18 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 147/156] drm/nouveau/nvif: rework engobj "mthd" api
Date: Wed, 17 Apr 2024 09:39:53 +1000
Message-ID: <20240416234002.19509-148-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: c120307b-cbdc-4638-4b14-08dc5e6f0f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWFhX0tALglP+Rs/y/0PGnZ3U90Ba90xyy5LOIHSqgn60EzV5vAzNbi9/5r5d4IUfktWaN+0IPh43SxEgXbKfuBFXqYb7nqJOsK5kLy5z6OWPlp2TUFIUk+k8t7oP7me11NZhH32rOj8Kp+UIyVwtyKvADJ64fTu+Sz9RusowFl+7TrTtGb76nlfVz+jY4RX8UJZo7fTC+QO9y6Hq81gWaNhT0hK8YIZgKm/vTnEJIdN4HksRoS4JWlE3ol3SNjwLhHH/Hh9ul5cF7Ky5TCaTOShKMe5jmy95aiGtXjePUZ70nwxrSnq/gvUNF2vJoRA2jk+s7Hibvq3fu+Nn9RTGBhh8IKJgpbOwcSewNuBz0C1DgrV+ahQPCmMqoMFkbzBLRPRLc4d6EMEz6kaGoZyreyJYr7XFMA41fiXVsXGj9fDtHunk4AfpqdKl6XzvY8RGxaDoZOjfAedgNOWqkASc3WkV8RwNbkbauspPGVVJeq4rvrh1i/qNIzd19v+MUrBUSDhwV0Fm1AFcWvnmKWqJzP8rLwz9KvIt3yFRRROvtMuxP1Yotuza0FfQlmQsU06O5KaWO2wzvS39I/NQfzxWEW1bJCSOAEvk0b3EQPgseNEF4PmwMCXqoe5wzA1WMjlshSDLm5BkBCgjcZaQYL61bAS8vNm+mGW8IQa7BNP0vMHuewXpasWk8drVQ/ZeRfMT4voQGrKoQ/ATKRIZyvF011xX6EZTaR10pDaeKcN/ppaxWOVp61xM1Kec4Qa+4ez
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:46.7646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c120307b-cbdc-4638-4b14-08dc5e6f0f36
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  | 1 +
 drivers/gpu/drm/nouveau/nv04_fence.c             | 7 +++++--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c | 9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   | 1 -
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index b25c91542e66..d8a30af9eae7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -434,6 +434,7 @@ struct nvif_disp_impl {
 
 struct nvif_engobj_impl {
 	void (*del)(struct nvif_engobj_priv *);
+	int (*mthd)(struct nvif_engobj_priv *, u32 mthd, void *argv, u32 argc);
 };
 
 struct nvif_chan_impl {
diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index 802a051428e2..45398b3a825e 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -59,8 +59,11 @@ static u32
 nv04_fence_read(struct nouveau_channel *chan)
 {
 	struct nv04_nvsw_get_ref_v0 args = {};
-	WARN_ON(nvif_object_mthd(&chan->nvsw.object, NV04_NVSW_GET_REF,
-				 &args, sizeof(args)));
+	int ret;
+
+	ret = chan->nvsw.impl->mthd(chan->nvsw.priv, NV04_NVSW_GET_REF, &args, sizeof(args));
+	WARN_ON(ret);
+
 	return args.ref;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 6e5a0d980446..6682245e4928 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -46,6 +46,14 @@ struct nvkm_uobj {
 	int hash;
 };
 
+static int
+nvkm_uchan_object_mthd(struct nvif_engobj_priv *priv, u32 mthd, void *argv, u32 argc)
+{
+	struct nvkm_uobj *uobj = (void *)priv;
+
+	return nvkm_object_mthd(&uobj->oproxy.base, mthd, argv, argc);
+}
+
 static void
 nvkm_uchan_object_del(struct nvif_engobj_priv *priv)
 {
@@ -59,6 +67,7 @@ nvkm_uchan_object_del(struct nvif_engobj_priv *priv)
 static const struct nvif_engobj_impl
 nvkm_uchan_object_impl = {
 	.del = nvkm_uchan_object_del,
+	.mthd = nvkm_uchan_object_mthd,
 };
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 986e8d547c94..8ecc53ff6487 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -230,7 +230,6 @@ gf100_fermi_mthd_zbc_depth(struct nvkm_object *object, void *data, u32 size)
 static int
 gf100_fermi_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
-	nvif_ioctl(object, "fermi mthd %08x\n", mthd);
 	switch (mthd) {
 	case FERMI_A_ZBC_COLOR:
 		return gf100_fermi_mthd_zbc_color(object, data, size);
-- 
2.41.0

