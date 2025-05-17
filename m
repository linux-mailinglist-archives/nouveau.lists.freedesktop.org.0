Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB76ABA717
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C6E10EBCB;
	Sat, 17 May 2025 00:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EXPQstUD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914D710EBC4
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaSIqOwMP8dGAxJucapux6Su2sEwkS2b+pZ4yFvbdu6lwtkom2upugatMYWLcSsQm4tqLJDMOHkPKRLHP0vuMVN5sUEA6nyQ7Hlzul0KImSsL9PVKAldB1q/ZcV3o5pNT4t9w1pEqovMLhZcKPo1iAEQrvLbg613G6vx0Ld7W4FvbCo+gmClsqkaqRkHN/JhOwjRsZncBE7IvThERQle+cbayyoNRN0gcj7AP0GgS3jQzjTv10EXS0wWnb0nWxhHV/Ie7Dq6m9YaEa8A8oz/tdTMGtb1Ipw0At+OrdMzlXZGtfzLOTi8G8m70mJPct8y5aJ0D37zsOx3OK+cKlcpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzTmT3d4wg3WKRGyE03zJyTcA/NhpE4UiyA/nx294fs=;
 b=XunW+1rnoWIfTEHhiP4Ht8NM8A9UmRAmKDAnfGogJT6w4kh0GhD6i3L9gVaRDg1TOXV7gcNb2SxpRc4CiMKGfsodwCt4jlE49To1B9nq9JrBkIPS6xV9QZhabnCMrHIlRXPJaz6EmqZ6ZMR6P0rFOEOWJyLKyPtBSNIFiuiqrcnt0x9U4auHM/D9fpkq/uLCDZxIlByL1RZysuI7uZBUZN21DWcJUJt/52khQUjG6v3k20QZ32Gevt3aMLn0ceUimHGqiqXrg6LrycL13uYA/7uBDmafRnoOOxE2Ia/w3+oONLWjaz5IcUPYqWdQvsEHoZSIBrCxaXLCcjHMR4jIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzTmT3d4wg3WKRGyE03zJyTcA/NhpE4UiyA/nx294fs=;
 b=EXPQstUDBOOU8NuQeKUUQJ0h6tIMWGuO/44rvhWei7xRF8XelieDe9ZCKOngAO/1v2t6KFwz5NJTRumK3NfUL6PXnk4IfZ2NhC7l+ILWNmCZ8sEKzM5y/FS2mAtt9XRCSRAOzLzDOROkQW6OlPewF+948vjmB0yGYTsOplYF5V+NVpPfJ81n4JEdoyznjGbfk9XZJVJrps0FUXvEm9uMIIikwPKVnfgijbsMdh1oWigwLf6WBr8uuftX5LIIQyLJ+GmZiCbdIM00ACa/tGqDa/yj+1y+1OOeV6ATvAY7GiYW8M4gUMwSlVAoURBkeJQbvcjD2dWBT2or+FxUMCkTvg==
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:11:08 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::8d) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Sat,
 17 May 2025 00:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:54 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 31/62] drm/nouveau/gsp: add hal for fifo.ectx_size()
Date: Sat, 17 May 2025 10:09:23 +1000
Message-ID: <20250517000954.35691-32-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: f5299f1a-3c58-4f10-6982-08dd94d752d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ACJ5b3eQVWYr6BG06PpsnS0RSV+ACFlM1VdgYqai8VtudZtgxDAQQ+UHb0B?=
 =?us-ascii?Q?IEZ2WfzmTGimRHLKJur7iOGV7LA/Xsv6Tlqe8B1lGrBR4bjBmNcZhM6VqQ0G?=
 =?us-ascii?Q?/8+4IxmWNvIidKdlqK4GQrZguSDmWj0vOVlR1bN+kuT0YgPXDjumGyeWm1XY?=
 =?us-ascii?Q?i3SHQfcaKvcO3QDRk8wP9H54DKwXRrYoZdDfHmBolOIBUk2FFNyuW7doSjOa?=
 =?us-ascii?Q?pBkcIKklUclxDdas4ofJgOeCSwQvNIeXg7phc1CBjR4D50v7h6IN8N/lq5r9?=
 =?us-ascii?Q?MQ//6w2Vuy2PsQ5hQkzGvUDH7dmQ3/3fcF/Boz+GfyqU3xfYXr+rVigqvknI?=
 =?us-ascii?Q?OFrBUmdNJoMlC6DzWvDC1dwf5NWgpGa0YulawnGYLqaZTZHWceWvsLr6Ruzi?=
 =?us-ascii?Q?DNFnLZvNvMHVfrl9n4zgQ8WwG90ww4gEnW4G1JyLPqQ5eGHjFi1NEA6Een+a?=
 =?us-ascii?Q?kihJBzc4Q9+Z4EIL+NJOSqmx6/6nED/gRrZB7r+Pn9qLi2SSdlKRjMJ6KZE2?=
 =?us-ascii?Q?vrCWyvQniRQN9FfjveLjwqwRlWuOLZH6Igv1m6HUby1oi0lZY1p28BC+sfbt?=
 =?us-ascii?Q?feWceaS5VB0CukrPmVuxTcbbJYFtZOLuur7pegasM0/Fc4DAgMPInkuZWV2P?=
 =?us-ascii?Q?RWvjsCgevtgLC84lxaTFpgSM1eYyMVk5iBAT8PtiK342Un1kzW/ju0NLhld0?=
 =?us-ascii?Q?O+XcVzQxPlNkTnp2cGJqxdSphDW3HYLfxTL0dlC3QN1iYMYaHyu1e5J+pyC6?=
 =?us-ascii?Q?WeAJmLC2d/wiilJ48Tpk4NGo0wdt6maCsj383M7RlKHSuofsKRwC0CwFKnGL?=
 =?us-ascii?Q?Xq+sQ5ATY4qOTB1xQof7/9g7D/mIJrIGEXvLb3yAw4MC10ylcVQdFMfBK3uH?=
 =?us-ascii?Q?KPRjlgf2sJBi1M7xOykUVwj22PzvEqOgOhh5ProO86xeuEJZvN8KuJXEku1t?=
 =?us-ascii?Q?nxdnVG2vmXJjoS3nrObMBNcYp+B8M/dOVk5ho2JhfHKFJV+/WKB2gCZ/v7PS?=
 =?us-ascii?Q?Nn9faEmG6Dy6GgqSaR/Bj/0p8zONi5aeYoaCHHb0NRiPvYuuvq3n3D1YysDG?=
 =?us-ascii?Q?eBqH6VBGGYZzz/hnPGpOIAcaJSBAU3hX9vFY3Qrh46TEh3AtE21YzEBbSFH4?=
 =?us-ascii?Q?na8dxcqzTGntzCiR3R/XH3JwgnSwbwsspZvnTwwYoeDr5h+EWbmciMRhfMNL?=
 =?us-ascii?Q?ZcwkCFEMSBkYGlp4Z38ioBOr6Sj1gHklnoOLkgXA9BG3tXlJPvWKlWHUWRLC?=
 =?us-ascii?Q?XATHWWQZgfrkDb38Pptzddm9UYdhqq5sjhMOZF1kbioAc2z3VQaK5F6al9b4?=
 =?us-ascii?Q?cMmemQai5y0lrZST6mEqZwtcZtIU4/8n+mzvfXyUucpx9NOPubr5faKrrwOt?=
 =?us-ascii?Q?xXOedQ6P5iSpAKCRu6ED6K7PXl2o8TcqY8Q0KsbBA+g76N/7d7spb+v1sQ8p?=
 =?us-ascii?Q?gzqzSumf3gp1DVpvOtbW7bQVa67Ufam/XMzRxh8zDnGHxU0BL3eaVolDWGC6?=
 =?us-ascii?Q?RZ4/1+TLZ3P0+n7llrdPVRa9B0sU2ho5dGkq?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:08.3394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5299f1a-3c58-4f10-6982-08dd94d752d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482
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

NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO is moved to
NV2080_CTRL_CMD_GPU_GET_CONSTRUCTED_FALCON_INFO in 550.40.07.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 136a64d82973..55022ad67208 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -507,7 +507,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
 	}
 
-	return r535_fifo_ectx_size(fifo);
+	return rm->api->fifo->ectx_size(fifo);
 }
 
 static void
@@ -540,4 +540,5 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
+	.ectx_size = r535_fifo_ectx_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 23a9a2043d9c..8783c21af0e7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -89,6 +89,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_fifo {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
+		int (*ectx_size)(struct nvkm_fifo *);
 	} *fifo;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

