Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20868ABA70B
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1E10EBB8;
	Sat, 17 May 2025 00:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mqdi7MWp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0E310EBB3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYE3dlD+FveL43XxQIcvWUTwjQrRPf69QvBQV/MBv21RgR6ikd62hA7YjQtIUVnZ8D3sWNE/9wY3pvLFPM65lIIsTmQckiqUIAWtv0V679SM0v3BfbTG6FALBZMD0jdkETxe92ytMyEPCKPH4nVemXkOjO0GYyxoPu47aCoCUuO65mdDWYXm6NEPLgga1gia6H5IyyxGerjVLa1g9t/owhuNZB1VIUVWlZJp/m7tzlZILCYhk0w/24svryi6ON/kowLt2nY5j1WJrybMiixmcOaR83d70szLWG+QoRdrcJtS1UPNkqpTn3nUVowm4JS+yLs0JmXjDmkDSD9amc2UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO98VvzOtqEzqwMWmL/X1b9ME89frX9kFHbMYIO3+1I=;
 b=a3Qp3P++BvvToWuCwa8cl+yADOq4K2zOu1Su3PfFdLrhC18xn3wWU8UgcMxSyNY8q62QpcKajyQHRriLHQiiihS6sQH/CKsxN4NThHjAXctt/o8IQDiRS1h9uVMnSNxZf8iCvb0DgxT2AILKhsHoRBFHTbjEsoHmWDVO/vmYqjzKB3jlSEyrxL0pemBQFAVSqr75zgTd2ahvYA0M8mmMEGNNGQLy7qE3uHsDzOr5QlghmYEuGMPGgbZzEZuBOqgDcPLMR1CgvOlkZV3Lp/8HN8PxATjcchy++S0zRgWYu/f9mgBq4jRjYB8TGFWL6kS9E614j5914UUVzUxcN4xZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO98VvzOtqEzqwMWmL/X1b9ME89frX9kFHbMYIO3+1I=;
 b=Mqdi7MWp9/H/dJFBThthR1YnAzqvD1DrS+V3WtiQKHbEssIBH8tudWL8yO+Pz1iQ3Nmq2M0+pez+aB9Wj6efKVW4jyLt2jag7tJaCKjC7OjgFMxPxqXiSgilDqq//izlighz1i4KtaBs1lAX/wVeoaDHi7xCLIVFSHXH1i5/qu2NWhT94WW3xORDRaqIvNOMjx3SMwLe8qHJnxmCjokX0bn6c1LtnlK8XW8X3ZaLNIq+T8/ryN+mrJOAoPopzOOMPLwKKxTfqjxtx0n80dOnwzghVfm0la4cpXT7WJKbP9DsVqAcGHgjynhR3QrLJzPvEuhNa5qykaLAU0rUEvaisA==
Received: from CH0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:610:75::8)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:53 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::24) by CH0PR04CA0093.outlook.office365.com
 (2603:10b6:610:75::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sat,
 17 May 2025 00:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:41 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 22/62] drm/nouveau/gsp: add hal for gsp.set_system_info()
Date: Sat, 17 May 2025 10:09:14 +1000
Message-ID: <20250517000954.35691-23-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: b49a460a-7d24-471e-7cee-08dd94d749f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XX6V4O/F7ar1dtxY+7FTJAXkhXh7G+XEfRUU3dvAXaTPxtS3yrWRxmD6xix1?=
 =?us-ascii?Q?ygZ3+/TNLf2QL9KfULbxXGk/dY55wTU2QNB4ngA1njVtGTJHeprmJmoJCmy/?=
 =?us-ascii?Q?t4N4wDT1rwe9lNyXto4lu5KQBjoBKQbf4C++ZZ2Mpb0/PF8fPExZN2h7ZskT?=
 =?us-ascii?Q?9TP8R7Pm6bsZSk64oZAxyE/tt8XNOs/GARAUD0miYNDXm31h4gE4zUgvXFcj?=
 =?us-ascii?Q?ErUAzCq4E6gzqsLV0KV+UquDtLTgCtCusz7h3r0kBYShu4ipvByex+01yXVX?=
 =?us-ascii?Q?RkSEIwZpLZVhA4nwUcyOLeMkABIOKVnLeesZvJYkHyNTktmdTQQSK9N/H6Z5?=
 =?us-ascii?Q?S8VzQRaYFRpXqsePwq+o31g7DQNShyLCDlB9eKTov+LHu48uUKKj50yHdo+N?=
 =?us-ascii?Q?v+bFgNcEKDPRrHjnxrRt2mpF1mPcaBZYyKl0FFlNxSv5U4uY2rze3RGeSgoO?=
 =?us-ascii?Q?AeYh7LnQgjc4anQn2y3oJ+0IVyvyND+I91sHYwbmvmOLC7S5LoSNPe/K2QOW?=
 =?us-ascii?Q?+X+hPXKu3T0O+KsIxc827/WIIdhUZ647KH/h2fsFF3amvyY+DfVj8xhbrMcN?=
 =?us-ascii?Q?7XEVFL8hDhDyWZ+zwZwxv6zKBYURfNra+aPpgwULCpMBPZUrh8aO963fgVp2?=
 =?us-ascii?Q?eTi4hi4A8KUTHsW93tWHDyL6IuDq8eMr3kvVU0VmLOE2gXgOZoPeb3Y3pp4o?=
 =?us-ascii?Q?RI4nLIJEX4k3jyrZO6RCYSFOvFY086Agzd28R4+vVfaOtxHIccKoAEvJ7KHM?=
 =?us-ascii?Q?ZqDpZoQExarg2FYL+8yRzm9rXr2xLbnUW89N5mQivopoPmmQiJGg+5GE9bTd?=
 =?us-ascii?Q?8FZCxb6QF5Ash9xms9Mq7kndoHaEMT74U+tZ5UirUiPbepARkOTsQogpeUW9?=
 =?us-ascii?Q?wGHgqyLKZkyPV/ByZ2cGbU0GNuc6EyGXKDTPTxIDY9ZrE/B7x1GX+9ofD9hL?=
 =?us-ascii?Q?yM3TgDK91RHQ94aVp5AyHEikje1nXqdV8HjDKoUKFmjN32zJifwO4NbbnZaK?=
 =?us-ascii?Q?FnKh/wE8rybyx+H1yPj2yA7BWSUL1ylKx9SsLbeQ3qVK1gMtIx97u2kYZvcp?=
 =?us-ascii?Q?mmY3FkTIpBORQpgJxZhqBrwegQE1z5tEOllQt7bAK86I+4TzRzN5FC6TA6iD?=
 =?us-ascii?Q?4ydNdJhaAOneJeK13DZizsFQdu9gK1ruLPtse6FFT0QvrqCE8DDi6gb8f/i4?=
 =?us-ascii?Q?k7yXB9fYBlwAwc0Pk+pRSoyQeIluzq2YkhkDzjPuYw6UMFqX1cKrc44Lk06R?=
 =?us-ascii?Q?U2OCkVrXRTgPIULeuG8xz3tRZaiGAHk8wVch5veUmgq6dwQqN4/pDr/ydGA+?=
 =?us-ascii?Q?bK052+lM2GrEOYPnfsrBErWzylHAZCFc2bywD7B2rM3E33SxlcAx09m9LKKe?=
 =?us-ascii?Q?S07gHCekP3rZ1wM3ThpO0m9c9L1lLcRS/+zpH0rHTTaJHSy842rncT5S6amt?=
 =?us-ascii?Q?NDnfN6nvsRCWCDRKavEOc2j+hHky3QXuZnmnozq4T7axk5jsmJR5thYJ435y?=
 =?us-ascii?Q?l6+FLnV26IV29g4XxebXtkKOYbfFp4hM3PTR?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:53.4567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b49a460a-7d24-471e-7cee-08dd94d749f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751
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

545.23.06 has incompatible changes to GspSystemInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index ec69fdb9492a..f574a3ad2082 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -871,7 +871,7 @@ r535_gsp_acpi_info(struct nvkm_gsp *gsp, ACPI_METHOD_DATA *acpi)
 }
 
 static int
-r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
+r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
 	struct nvkm_device_pci *pdev = container_of(device, typeof(*pdev), device);
@@ -2080,6 +2080,7 @@ int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	const u8 *data;
 	u64 size;
 	int ret;
@@ -2134,7 +2135,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = r535_gsp_rpc_set_system_info(gsp);
+	ret = rmapi->gsp->set_system_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2146,3 +2147,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	idr_init(&gsp->client_id.idr);
 	return 0;
 }
+
+const struct nvkm_rm_api_gsp
+r535_gsp = {
+	.set_system_info = r535_gsp_set_system_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 60e8678b7913..efedd387fcc5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -22,6 +22,7 @@ r535_wpr_libos3 = {
 
 static const struct nvkm_rm_api
 r535_api = {
+	.gsp = &r535_gsp,
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 1a2fec3935a4..4a37904f7f9c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -26,6 +26,10 @@ struct nvkm_rm_wpr {
 };
 
 struct nvkm_rm_api {
+	const struct nvkm_rm_api_gsp {
+		int (*set_system_info)(struct nvkm_gsp *);
+	} *gsp;
+
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*push)(struct nvkm_gsp *gsp, void *argv,
@@ -71,6 +75,7 @@ struct nvkm_rm_api {
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
 extern const struct nvkm_rm_impl r535_rm_ga102;
+extern const struct nvkm_rm_api_gsp r535_gsp;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
-- 
2.49.0

