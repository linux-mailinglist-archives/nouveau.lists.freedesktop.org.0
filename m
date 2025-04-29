Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07979AA3C83
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9631C10E57D;
	Tue, 29 Apr 2025 23:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DysuBxfB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1A10E56A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAxt0jY7SOMKw10XiMT4d9wEfqk4wOSgVjaR+EDVfUyBl3Re0ptxSg7g7RY2vwSJKADCypMOdOA+W5fy0NNmeY2tgrH2Lfa812x+Gf1rmCpkJ9pN3Ojh111ihjY7lsEOFedDVYQ9Ft2NRGSoUihTcRoZnkCULLhP9wnv7jiUzv4HYYTmBBr/1kt8ZRhqELoMeW+dGFNnl87wsnOjIz450tyb8xiAN1xotlwel9JIIeKjD0+szIAI8DqvjUrT3ZlFgu82n6cq3hoGtp+71+7WqTj7C37qs316eEH9at5p65AlZNyHM2nwqqmHS0N6bY4+xUqXEoIRbdj/EBgUSWAG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vURZHevoC0yTu6wo7sQOkFIYQ/Ti791e+B21Kzp/Nko=;
 b=X7qnYjcJFvYjGtDNrXA2ZPJxRvEtxfvPyWgM9PnqSc9VQwSBW13hCIJVfWYtzlhGOOuLHp3iEvV+i0p3m3RiBWHqcAh3FN2JeAiX9Qtxwqbno1q/yYBj/50Yp+mIeF8632+1OoxOxeDL3jCHuimRhxs7V1ZuYlQFxq54PGuM9B82N3F7+0dgwaNVHWwywhBR8VewZBOHpjuqxPA/u6Nn836Chtu0jZait7ag9yoNiAF4sNnhwUHbJ+QDyaC9CCP2NU4tNDgLcTLK4UPTZXjM/faiAE/mA8xXq9dN6qKJKgOIFKq9t+fOTmBPvtzRBo+DXOspHJ3n5rqT9YY+pI3MkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vURZHevoC0yTu6wo7sQOkFIYQ/Ti791e+B21Kzp/Nko=;
 b=DysuBxfBEIF6WKvk9VG0S1CrYj7saTVqwmJGSCte23jlqtnVecKKQCx+jub9UMG5qqhYqz1rWsEOlby2Ve5tUb+0AK2qvn3adKOapxGARPaIsY+0gyeIRJPF1BkrFTY1dcQcFtSB0MwwGMR0NxwU0BGwBt9IoeSmxeFMUqYTQRjax1d5Uc2aZ0V6GmsQOJsGUw1mJgIQw11vt0fG/HRdurQ6U3mtH0Gg1rzOpNP2ORKJDSf+YObBHRl/uEVGh8FCMD3ckzPX9E54t0cZP/w2p1b3jZ/0ZEcUxIoF2Mky24R26ufOblURNsCt5LA4DJtE8diG75yC/vcRLO/CEcnVkw==
Received: from SJ0PR03CA0140.namprd03.prod.outlook.com (2603:10b6:a03:33c::25)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 23:40:25 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::89) by SJ0PR03CA0140.outlook.office365.com
 (2603:10b6:a03:33c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 23:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:08 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 23/60] drm/nouveau/gsp: add hal for gsp.get_static_info()
Date: Wed, 30 Apr 2025 09:38:51 +1000
Message-ID: <20250429233929.24363-24-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8466c4-089a-42d2-3f3f-08dd8777372e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5Q5R8fjEn2M2rNdPvwoKKTn/rWiCWhlV/EaJOaHPF4SNl1N5VN9X8r6qB9+?=
 =?us-ascii?Q?4YB+C+RVEY+v29rO4hB8fo7oe51dWcMkXUxnAXU6LvUJDmOULs5yNTsZmDlA?=
 =?us-ascii?Q?YO0BAusmmuyW8eEOTGvp+I3JomKuToCylHT8BPzRwX89o36dlhlal28wKCVJ?=
 =?us-ascii?Q?cARHdScUCtB3RAISNqimXphSw2ow0aO88Vsxv8/SQ0Wkkkzh3YFcgEKMaff0?=
 =?us-ascii?Q?LDmptKp1skoU8JVSeDmaUDq6O/w9E7sbcax4sBpqobJtWV8POm6BQ6zJzsEq?=
 =?us-ascii?Q?v78gyPMKH+S3mp26ONyYxtKpJ1WD+TzX88f+xqB7ZzkNILSdBW4FjkIbf9E3?=
 =?us-ascii?Q?6EbzjMh1568SpT57VonSrxmOB+1tyntlsZI4dO45ki17zY/gDV3LI+HCA2lJ?=
 =?us-ascii?Q?TuB3PiJsknRhNMf3q+DCxyUHJ4ZdbvZ0wAWEilgHkb1KGxN8VIkW8PIFI/Qz?=
 =?us-ascii?Q?Ntlh828aOEvHcySUsfZru4poKKKcyIVtYuN1ywXJGYY2OSTBmkvyII/+tuL7?=
 =?us-ascii?Q?U/1M1rOnHLQmWm1mcfj5bbHwMk1lyuDa0rRMEcHSHb8OGgmk78frXqF7ca8M?=
 =?us-ascii?Q?i3XqHFHMecgGIaIsqBR5JfsSATdbJCxniGERoYaBd6M/Dnu0TArLH4r63zCb?=
 =?us-ascii?Q?+C6Xkxio8S1wNpEi6rZ7sGfHcL7Nor924kgRkoJ7rsodn12FRl6W5NnEM6AV?=
 =?us-ascii?Q?FEHb7jTTwj/BLrygYsYnF1vR+UuHbEIbfQIH2eWViI2p2WnoPeNQY0Kltx7D?=
 =?us-ascii?Q?rmoPagjKfCJr0LKkM6drPbiX0fqm9CztxbRRYLE/kZ5NbN8krxhNQ7hJHb0f?=
 =?us-ascii?Q?AsSauo5L8NrfHsHoNxJwTbD3NQNHW5HPsGxV7Pkay0B+hUwGvAY7s7PxdOFY?=
 =?us-ascii?Q?lssINFBBYS2pJnunLR8vc2ow0w8A1AD49ejdeApUSvUMNv3EKnFP4ASpw8uk?=
 =?us-ascii?Q?aj/wcIwMjQ/tQHByqjUo3eOoT5rIJ0YEBkH61Y64mGVaq9y/wXklSRoLKIWI?=
 =?us-ascii?Q?+OusXOS008B6PJSokjecTehlJK4bhX0MoxyseP5lfgOIQi7xfyfS8l6X/jx4?=
 =?us-ascii?Q?9bJwcgjBImi67Rer/+G/AbhLcX6I4C6qLmh++gMzO9Dv8C2jOXBvAH8zfXOd?=
 =?us-ascii?Q?rA0ria0r/QpMcYor5aRLf3noT70ydQAroVGdFkd9fn67Puh79Qjv3kC4S25B?=
 =?us-ascii?Q?ENeRMHEYd9yldo5wUFdpTBHryrpeEwxL9UuaKGSv4xR6wZuE6r4xPO2SJlRM?=
 =?us-ascii?Q?Zl/pGqce+KFbOUktH1XQCAZmffBfI/dg72LrZnPGhFxguto0JeIfrmtpONqr?=
 =?us-ascii?Q?rtybkCrKPFRwIWt6tbl++HJouxI7UsQvSHij9/kF5FpJ40eXbCWjoGWwBfZU?=
 =?us-ascii?Q?YCGjosmCRpcmjJHjaCi9s8eenR2SzCNE3iqT+oUREuSbYEtxj/mZiq1CDbTG?=
 =?us-ascii?Q?9SUkqCS+ExuOpBz4i2INmlTbWdcd6U4KwLAvxB8O0304O7XG942MxduAd5HU?=
 =?us-ascii?Q?bg45Yf7TG1sDLoINUZiAaADQYwci3vohtDr7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:25.1803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8466c4-089a-42d2-3f3f-08dd8777372e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
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

545.23.06 has incompatible changes to a number of definitions that
impact the layout of GspStaticConfigInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 67 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index b225dd06d490..338201b65930 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -165,36 +165,14 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 	return ret;
 }
 
-static int
-r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
+static void
+r535_gsp_get_static_info_fb(struct nvkm_gsp *gsp,
+			    const struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS *info)
 {
-	GspStaticConfigInfo *rpc;
 	int last_usable = -1;
 
-	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
-	if (IS_ERR(rpc))
-		return PTR_ERR(rpc);
-
-	gsp->internal.client.object.client = &gsp->internal.client;
-	gsp->internal.client.object.parent = NULL;
-	gsp->internal.client.object.handle = rpc->hInternalClient;
-	gsp->internal.client.gsp = gsp;
-	INIT_LIST_HEAD(&gsp->internal.client.events);
-
-	gsp->internal.device.object.client = &gsp->internal.client;
-	gsp->internal.device.object.parent = &gsp->internal.client.object;
-	gsp->internal.device.object.handle = rpc->hInternalDevice;
-
-	gsp->internal.device.subdevice.client = &gsp->internal.client;
-	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
-	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
-
-	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
-	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
-
-	for (int i = 0; i < rpc->fbRegionInfoParams.numFBRegions; i++) {
-		NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO *reg =
-			&rpc->fbRegionInfoParams.fbRegion[i];
+	for (int i = 0; i < info->numFBRegions; i++) {
+		const NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO *reg = &info->fbRegion[i];
 
 		nvkm_debug(&gsp->subdev, "fb region %d: "
 			   "%016llx-%016llx rsvd:%016llx perf:%08x comp:%d iso:%d prot:%d\n", i,
@@ -216,10 +194,39 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	}
 
 	if (last_usable >= 0) {
-		u32 rsvd_base = rpc->fbRegionInfoParams.fbRegion[last_usable].limit + 1;
+		u32 rsvd_base = info->fbRegion[last_usable].limit + 1;
 
 		gsp->fb.rsvd_size = gsp->fb.heap.addr - rsvd_base;
 	}
+}
+
+static int
+r535_gsp_get_static_info(struct nvkm_gsp *gsp)
+{
+	GspStaticConfigInfo *rpc;
+
+	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	gsp->internal.client.object.client = &gsp->internal.client;
+	gsp->internal.client.object.parent = NULL;
+	gsp->internal.client.object.handle = rpc->hInternalClient;
+	gsp->internal.client.gsp = gsp;
+	INIT_LIST_HEAD(&gsp->internal.client.events);
+
+	gsp->internal.device.object.client = &gsp->internal.client;
+	gsp->internal.device.object.parent = &gsp->internal.client.object;
+	gsp->internal.device.object.handle = rpc->hInternalDevice;
+
+	gsp->internal.device.subdevice.client = &gsp->internal.client;
+	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
+	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
+
+	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
+	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
+
+	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
 
 	for (int gpc = 0; gpc < ARRAY_SIZE(rpc->tpcInfo); gpc++) {
 		if (rpc->gpcInfo.gpcMask & BIT(gpc)) {
@@ -278,9 +285,10 @@ static int
 r535_gsp_postinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret;
 
-	ret = r535_gsp_rpc_get_gsp_static_info(gsp);
+	ret = rmapi->gsp->get_static_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2156,4 +2164,5 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 const struct nvkm_rm_api_gsp
 r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
+	.get_static_info = r535_gsp_get_static_info,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index a0ea5f2f0dd2..cdd2e68b0332 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -27,6 +27,7 @@ struct nvkm_rm_wpr {
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
 		int (*set_system_info)(struct nvkm_gsp *);
+		int (*get_static_info)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

