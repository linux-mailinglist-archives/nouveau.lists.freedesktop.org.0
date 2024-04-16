Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961398A7916
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823A112FA3;
	Tue, 16 Apr 2024 23:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EKO1phV1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA946112FA3
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsCoA8SM4aRu+kzOo4sQLcK/pO2NnopVAnOs04+f3M0CbIRMxX5V/wNG990dGkbKsRnqVSqHRwZLVB7oSlD6XtLGGPqUBQ40aFMlyqzO9esyJZ2H1V3SDcm37h27MFG4AKJWYzR7TlPOMLl5QEI8CKeewLYRWYguwJG3Kbfue564F3y4WNgb7AQT1gdUiu/pIxvsA8nDKM/0eJYRcKbGKmA0GULHCmfoFsuE2ktuptc8vt4UKLn3si1sYSnTI3RcygANYbfktUdkbzhXidyhGdt59K2wdXEst+KgIrOZ5aKnAKIePiluxSXnlUtxiMNIZJGrqrQj2P0/u1SHDQMWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElJ488Z5SfJ0L3OatyG2X+9sRd8IvCPtWl5nU7cFMp4=;
 b=Qque14K8CpOE32PB2I0LEwFpaFCEw1Ri9gNqaEKb5KS0rneb1mrDk0vHKmfAB3wd1LBrVltxDnHDkTNeRQvLVdlXEme4urZRnU62ID00CJw9MnddinlDTNqq/gV8HfznVLuA7vHBJuvjb2eW2LzvcyEyrIOdjP/1/kj0zhzNW2RH4MGZPIqB7zpkUHrqroVcs2WDh79Qt2uL7t6UytavOxQu23SxbXAwBQ3fAhMQZeYT7j6S70i/uiaQkoxkzPX/01XIjOqlyaSz/TH5v8ERVzKxXOHVsY+4a+ide2jghjxdWwAC1w3MFTtHLS+gW5+D7uKkeEHYOqLLbbeXtVLBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElJ488Z5SfJ0L3OatyG2X+9sRd8IvCPtWl5nU7cFMp4=;
 b=EKO1phV1ITMz96AiVJvVcDfT25wBBo80EDlzbHVQIwCbaPqs2Mg7tp7sp0U8m1gHxjFePhifpna8mfY9kfA2K2vzx5vlRvoWsgWOlsa1tPltNwiNNtmVN27fXuog1HpeL60NelKEg70ITXtGHCmKo2j1g3sgBD+BXpRHUDZJsVfPzGjXdjambdipAXSp/ip2vgKTtPlnF/7mqeO+IRW2y1yKEiOHwUVDJ50wd30bfbF4gqY1Pfa5j/Y5q9Y+6okVZr6JXqmfzfLu10ha+74FlVHBiXZWGl6yEzc7n6pjYlP0bmjrn0G4+RykAie4saUnQQFs5K2ACgtnYpZVekmenQ==
Received: from DS7PR03CA0114.namprd03.prod.outlook.com (2603:10b6:5:3b7::29)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:51 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::3b) by DS7PR03CA0114.outlook.office365.com
 (2603:10b6:5:3b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:51 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:29 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 104/156] drm/nouveau/nvif: remove conn from object rb
Date: Wed, 17 Apr 2024 09:39:10 +1000
Message-ID: <20240416234002.19509-105-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 1398d7ae-4640-4547-68cf-08dc5e6eedfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJ0ejaHC7pTZNA+7bDp1+LvNBvqO/cxNNTfwQQg8g/NemRQB3rLkeTcrkzOTL2Qhr68//m5ICB22wMrWpVZLu0yi2P++1VmkGCHZu81Q6HqrpWB1pyhUlmCMoO9458aClWN5rrIL5ojRSrjsCMAB3ztOovTFgp7on0m/AjW7P+gQoS+jTcpqCAv/EOAViEkz7PbVGAPTpPYEGhH1FU4mFFgUabn9jrBCJlYhAX0rOIb5EVjCHSyV0gYydpIMYfWn5Os15BL21AQeHJkam/8VckoJ5hHCrsyh/BIONWUaoRDxdYKsetjBjKJVue5AnmdfhSzkoNn+ZWUrmMqMPS/cp4smDKPdjEfkwotsij3F8xxqiaHdMsKQ8b81GAVdJNMJwktarZOvT1SxcsxY10Dt3QpHEXJg1jY7wu2FtPQrO+M8AMG/g45LweuW7S6+UzjEMfOtP8hzmRf8sRwGHVBY4rRjr+YSBunXQl2PlvfBCgVVJb/NJpOdfgx8EY9I2YtDZkZ3DY3sx6eIjt1kfwYnro6HMCjQZaq3WZjmLEiiL1iE4pertoKpbLUSd/cKJ4srt787GrFgQQqQK1dj3rAe5Ti2iZsMMMvF256oATZqblQtmH9CtXQnSehe3k7cWpHIyy5cAGnEbVCmuPxGYUNLKj5v2P0eWSo94aWDp/iEJlWhrjTAQXoiTBHVShLJpE96LQPyujamJL5Z59A9LY5AMrOt47ZdnHqpUJAbwb4ms59EiWavnD20rLF39++nYDp/
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:51.0648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1398d7ae-4640-4547-68cf-08dc5e6eedfe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  | 3 +--
 drivers/gpu/drm/nouveau/nvif/conn.c              | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 489f50d6ee00..e59d2a4ec4d0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -255,8 +255,7 @@ struct nvif_disp_impl {
 	struct {
 		u32 mask;
 		int (*new)(struct nvif_disp_priv *, u8 id,
-			   const struct nvif_conn_impl **, struct nvif_conn_priv **,
-			   u64 handle);
+			   const struct nvif_conn_impl **, struct nvif_conn_priv **);
 	} conn;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index d4e9f0275d1e..8894f65d6028 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -57,8 +57,7 @@ nvif_conn_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_con
 {
 	int ret;
 
-	ret = disp->impl->conn.new(disp->priv, id, &conn->impl, &conn->priv,
-				   nvif_handle(&conn->object));
+	ret = disp->impl->conn.new(disp->priv, id, &conn->impl, &conn->priv);
 	NVIF_ERRON(ret, &disp->object, "[NEW conn id:%d]", id);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 01333ded466b..65e8b3fec655 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -92,8 +92,7 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 
 static int
 nvkm_udisp_conn_new(struct nvif_disp_priv *udisp, u8 id,
-		    const struct nvif_conn_impl **pimpl, struct nvif_conn_priv **ppriv,
-		    u64 handle)
+		    const struct nvif_conn_impl **pimpl, struct nvif_conn_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -102,7 +101,8 @@ nvkm_udisp_conn_new(struct nvif_disp_priv *udisp, u8 id,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+	nvkm_object_link(&udisp->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

