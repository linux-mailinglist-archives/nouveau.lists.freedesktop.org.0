Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2103D8D1205
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506FE10FE2F;
	Tue, 28 May 2024 02:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tC2ep66u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580010F736
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQjN0wCx+f4Nr5HvnArH52dVUmrlkgq7ZAUgz9ifI+6bqsJMZCeS3novJtM9Ru/609B9r1z0AIlbEVRhYJYwaaJWy7JV+RsN75oamtrbEDOrnt6N+LWvgZhgXtDnvS/ks2uxk6TpCmXTZ0uoxzgsDzvq/PwBFUj1dzIHcXBZyGnSvS0fjdjkQnljrunb2wlI1CSvROjelEKpdKOruYYJ/MQ3xo9az+HhxFCJNYxwHOn7sb1hY14rjWVYaJPwS5lIfn918ib/ktNE24FQYY6m1l3epQh72qgXjMPOu2D9ynnI5lDkomoW9TU9kvF0G2qFutI4GnfOyMvtVT+Mu5cB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au9WJm8iLFD/urxMr5hLDRmxPpr9h5NZVazxF+1pyaE=;
 b=MS7jZtjRgX8BBIC26zMXqWfAR9QPP7YAeQFbO3nmr8j03URP4b6NzoDyy7tYjTIj+AVjFTQmXzlgl4sZbfexjYfLkAsBp7u/8KGP9Lz231GAKzvDy0fPD7kqIeayUJsZYvvsMUViaWWLLEN5FGn+n9XxodaIoN0Z1EHVGdKgUUVa/gCadnhPwHT3C6jazTRv8XiHdyQv51G0opolGxXxzuDzGE3samkYOhg09tb4lnLxUruGDZBZtbtI5S7J3M/X1Ta1JqSPWh8P2wIPxpucYhE30aJIRQu88fIbuGNkNg5BxRqWihK1+RheoOtQ10bnx47fBAXL4UofmJOC9gN1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au9WJm8iLFD/urxMr5hLDRmxPpr9h5NZVazxF+1pyaE=;
 b=tC2ep66uI+/jHU1rQW+q/ISiiIsd7HEBELt4NgLjodcQsOfZiecY7ODfcAjDIHNW/lUfWtbK0dmd39Cp8V8uuT1decErlesVsIYP9FXxPNU8o2Hcvj415LUjFk+q05CSfcT1eud9YXlVEbqUn0zak4VRzwzJemXnTiQoLPYA3CWjt5WGik8OPhI78XzC+mC3UhXIM6+Z6/jqYiUn92SjvlwQmzJTYf/slrSjpGwXsbzEe6diuj1lV1vGqXnUP+iRcc99auAoRFb4Y2WFzYUTiT4pinoXkc0QsRjcQr7tBr75ezUFNCPb5VTFs+8jVnbd+h4T+qtneP3n0eTXd2UfBw==
Received: from PH0PR07CA0112.namprd07.prod.outlook.com (2603:10b6:510:4::27)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 28 May
 2024 02:23:33 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::63) by PH0PR07CA0112.outlook.office365.com
 (2603:10b6:510:4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:21 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 22/34] drm/nouveau/nvif: remove device rd/wr
Date: Tue, 28 May 2024 00:19:47 +1000
Message-ID: <20240527141959.59193-23-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: b4384940-e4f9-4f51-8b28-08dc7ebd2bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TbbYhbEbbUsqUjScUHNoytHrp1bRaBN1AjByANzwobhaXaxBy9O2rTW2efAQ?=
 =?us-ascii?Q?tZjTsyL1lDUYcD5aAw45xSSBJSue5cw8tBA+gEECK0ptuC0YFHNCkNt+IaeO?=
 =?us-ascii?Q?NNRe2z0QahepqOF6wqB13rnpAmAKpIAV0nPU3l0uX1zNs9Wx5wuIgpxtjdvS?=
 =?us-ascii?Q?aOSTHwrCnumjEdn7jBa/zURyUHTOXEAKT9ORad9DIZbDs/kUmeAgTA/f+YtI?=
 =?us-ascii?Q?f1sZo4lmod/S0EDe4YU88HF0T8TL30LMOay7ESBtqBfp5wxFdoJ7sBRCio1K?=
 =?us-ascii?Q?ftfnztTD4EtgMsn9+8QQcOSm8vmbHTRzzkJgEtBO/2VYbMjU6ns1N/Y3vDHj?=
 =?us-ascii?Q?IeGNa6756V2IaOYhQbRhBArr2/Jp4ATSg05AwLkSt4a8KlDv27fqqJNhQUmG?=
 =?us-ascii?Q?DET2EqSnd9OG+xzzRDR5PmExGuxly3IivYkeyY2pEACznSsg4SBceNKc9dzC?=
 =?us-ascii?Q?YzkE54bOOisfjuJHpn+aA5rBFQ89rl96cq8WYimirYHH32DCnV8ljvjNWVTU?=
 =?us-ascii?Q?qers37ArjtsuYw6jpMpLss8BbKZ+rJZXBAmy6gKcc376tOzfU7TlQVZZn8QA?=
 =?us-ascii?Q?PO+YyHsobH4c8DaTn1HAdedG9w/sSbFbuFyr/6MQW4M7ZhdfmfhJjwwtUyxy?=
 =?us-ascii?Q?J2h6JhRuxsngJQtyqXLX704yn92TCNuDhOclgyCzCk7TqnR2q5kGVr4gKoRU?=
 =?us-ascii?Q?Q2X8IrmPylvsK4gUMod7LPGbw5LsnW4M88YfDiutsu0HldqSIlFmMzzm9vAb?=
 =?us-ascii?Q?4Vd3DRYiDLm98fzNkJPISU6JB2sX+Xd+2PrRYqEn6W0HsgraY5H5zG4LGaAK?=
 =?us-ascii?Q?eRjSB76Fqd2sy/fdGQX+FADw4ke44tyxEi8oqfVppxTsCZoz8IJES/Kmn1Uj?=
 =?us-ascii?Q?k2Tj9u1WMbUw7xFxRQYq1Esp4cYdCxI2YcGEV5+kXqg/AJN6tFRwvigjQH+D?=
 =?us-ascii?Q?9ZjMqNJ8YV9yPkH60AVNgSKVROG43/1SWXI1gIjVXbANAhWD7jXqRPIWuIrB?=
 =?us-ascii?Q?F9xhGZ0s/10h6/oVhKtLZ0yv2sYpARxBEYIR5G78rIYADP0nVeQ9HTVC8Xhu?=
 =?us-ascii?Q?q1d7zOxeWPGmC5GoHdyuZEMh7FJTeuaRfN67GErHaBTYwVK/WDxnaCYPqrZM?=
 =?us-ascii?Q?fXPV6u5lX4f2dNWOjD1D67xpiJfcxyiMryiH2M5Vy4PipPAW2cTaisabr5/A?=
 =?us-ascii?Q?qdoBWtxCkaadl1ILroAB7ZUVswUZLb/nHukjYWLHe0FsWeiZTx5L4PavDCt/?=
 =?us-ascii?Q?QCLPCp6zcxvrSx0G4rhwLRw+krDRTPmtgIoYc6dUwoXpQhP6PVencY92bwh+?=
 =?us-ascii?Q?XA3hZk2hiQ4BfDwuD4CoU1/4gTsnmawGoTYEh44HHK5gOXi/bQRKVpK246SW?=
 =?us-ascii?Q?TxEw6G5s89MGAhoVMKCk1XdsBNst?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:32.6253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4384940-e4f9-4f51-8b28-08dc7ebd2bbf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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

The device is always mapped now, so these are unneeded.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 54 -------------------
 5 files changed, 132 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index d4f1c964ba31..c91abac44bd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -33,11 +33,7 @@ struct nvkm_object_func {
 	int (*map)(struct nvkm_object *, void *argv, u32 argc,
 		   enum nvkm_object_map *, u64 *addr, u64 *size);
 	int (*unmap)(struct nvkm_object *);
-	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
-	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
 	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
-	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
-	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
 	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
@@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
 		    enum nvkm_object_map *, u64 *addr, u64 *size);
 int nvkm_object_unmap(struct nvkm_object *);
-int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
-int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
 int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
-int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
-int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
 int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 584fc43c0d75..95e9537e1d7c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -206,14 +206,6 @@ nvkm_ioctl_rd(struct nvkm_client *client,
 		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
 			   args->v0.version, args->v0.size, args->v0.addr);
 		switch (args->v0.size) {
-		case 1:
-			ret = nvkm_object_rd08(object, args->v0.addr, &v.b08);
-			args->v0.data = v.b08;
-			break;
-		case 2:
-			ret = nvkm_object_rd16(object, args->v0.addr, &v.b16);
-			args->v0.data = v.b16;
-			break;
 		case 4:
 			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
 			args->v0.data = v.b32;
@@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
 		return ret;
 
 	switch (args->v0.size) {
-	case 1: return nvkm_object_wr08(object, args->v0.addr, args->v0.data);
-	case 2: return nvkm_object_wr16(object, args->v0.addr, args->v0.data);
 	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 580b8c7f25af..913c3bae51f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
 	return -ENODEV;
 }
 
-int
-nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	if (likely(object->func->rd08))
-		return object->func->rd08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	if (likely(object->func->rd16))
-		return object->func->rd16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
@@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return -ENODEV;
 }
 
-int
-nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	if (likely(object->func->wr08))
-		return object->func->wr08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	if (likely(object->func->wr16))
-		return object->func->wr16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 3385528da650..afc10ec256a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,36 +55,12 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
 	return nvkm_object_unmap(oproxy->object);
 }
 
-static int
-nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
 }
 
-static int
-nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
@@ -197,11 +173,7 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.map = nvkm_oproxy_map,
 	.unmap = nvkm_oproxy_unmap,
-	.rd08 = nvkm_oproxy_rd08,
-	.rd16 = nvkm_oproxy_rd16,
 	.rd32 = nvkm_oproxy_rd32,
-	.wr08 = nvkm_oproxy_wr08,
-	.wr16 = nvkm_oproxy_wr16,
 	.wr32 = nvkm_oproxy_wr32,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 65bd6712bce2..d7f75b3a43c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -202,54 +202,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static int
-nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd08(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd16(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd32(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr08(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr16(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr32(udev->device, addr, data);
-	return 0;
-}
-
 static int
 nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 		 enum nvkm_object_map *type, u64 *addr, u64 *size)
@@ -362,12 +314,6 @@ nvkm_udevice = {
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
 	.map = nvkm_udevice_map,
-	.rd08 = nvkm_udevice_rd08,
-	.rd16 = nvkm_udevice_rd16,
-	.rd32 = nvkm_udevice_rd32,
-	.wr08 = nvkm_udevice_wr08,
-	.wr16 = nvkm_udevice_wr16,
-	.wr32 = nvkm_udevice_wr32,
 	.sclass = nvkm_udevice_child_get,
 };
 
-- 
2.44.0

