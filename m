Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D871FB1A9A5
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 21:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49210E450;
	Mon,  4 Aug 2025 19:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A+75abbw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8310E453
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 19:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fmv9wQCWl1NNhR5xk+6Mk0cynJF3K30V0dy1AzQT8kCFQNx7xOAblwJLimLJQo71EfqSIwjqSSuAA96uZsKMYFgrZbFUhtuEjUaBEhK8v4opZqP5GLEGPaqsnxLG5L7BRc7G0itAQSe2pGh12TromaWIwYzleFo+2LEB2EjDqe4AvPnLH+rTVhCNPx2ofbxlemdWs26FI7bye6pVGUqC8QKjE0zVgrPU390sGnKQKHV35QLkfjFGtzVfnL1l5bqtJ/+jgCsq/ncFTUJMs0Aq0m1tTvgL1N0a87Chh0XzcypCAQg/sTLt1Atp28twl6wnRPNENqkHTOG4n2s8AqSyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9diSkarxErMpqk+ZoOsa1Wr3GvcF9YWdIYkqkEGPIY=;
 b=GD0a4ff8RNSHO8lgtEL44U4Zv0qk5ajEHDzCV6OOLn3ibDzJoN6FP28EzhTt2C0yvRrvluKDntXWhR4/yGyi9n5brF0rk7wVw6aRb9lHbt4cH4dD332FavO6B1/qrDdHh8JFUE/oKCH4hFkuTUsqP4aIao7Gd8Wz+Fq9CifgBqKyTmX9lUc+Tu1+TkR7CYn5hIPiBY9tAhvcK6TwZc2q1VsTAWMaOvg42Qpsxhp5j7LfF8fHBuft5Pd9uhb37YECxmBTIw2hsiBAm78FRrB8EWgypdnUnWfZo20QzusVz7qxCkv+uxImKZBA8/mHHKcnHPTCzqxGsVOlohIFKwH1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9diSkarxErMpqk+ZoOsa1Wr3GvcF9YWdIYkqkEGPIY=;
 b=A+75abbwLzSA+Wjphe3K1CKiaFSWkCAXqa3DnZQuBnV5Vgs/armrv8SXuqg6o4n3RmQTMyYQHKrjz3Lx67qYRg6HWbkm1QBMK/ZaR9xOw+TLZQMYLUJYDz/DuliW0QCuT1p21SuTRP4/Y1ooZWeD5rd7CskhMMENkHTBpoxbcgDfTupGqtwmw7OkKTcZUKXMDvpg78g9rcw90N3cxsg8SEk/TEgYqG3Fx/spiBONmr17ZWheXK7esoNBchSi5bvkYZeGxc/gAbXN1GyEAfLSplBNMpNGgVIfrVqXF2AFfjAxpocAhwjURjyYxOZA7fyARrP1jxMkmvPDpkWVnJf39g==
Received: from BYAPR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:74::20)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 19:26:47 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:74:cafe::90) by BYAPR05CA0043.outlook.office365.com
 (2603:10b6:a03:74::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.12 via Frontend Transport; Mon,
 4 Aug 2025 19:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 19:26:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:11 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/nouveau: remove unused memory target test
Date: Mon, 4 Aug 2025 14:26:00 -0500
Message-ID: <20250804192601.10861-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804192601.10861-1-ttabi@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdc30f7-608c-4e04-d75f-08ddd38cda34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uttL5pGVGB+RuYOWCgNKDSRUQT6LQ0iHN9ca/1Lw/opGZeKV9ZSJu0Wl+1RP?=
 =?us-ascii?Q?v27/3ABVPm1Jy6siOGTZ6UdNSG676PJsTOkxjaP+dCR5zOddr0AL2c6UynN0?=
 =?us-ascii?Q?K544p92rKeZCD/5eFvVvyyZs8hmPrqrsQLr9Rx1AamZC+qUUsN3RWQtFkyWI?=
 =?us-ascii?Q?YkNY9zX5g0oOinSnlPeHoub+yhFzoD06O9BgA0KYcpmtOvHUr8oSHov/9gWE?=
 =?us-ascii?Q?tfrYX/oXNOUwmwQJtv0Mry7KzJm+SpttlhIZuzXmd5d2DuN4qf7SmBY2FqET?=
 =?us-ascii?Q?9h1TYQ4p3ePbxIPGw6RnDZnFhjSoq6LgFsInAE8T3/pZtOU0uT3UqpYpcGHo?=
 =?us-ascii?Q?fnt29keea31TBURpcUQsq0Kro7B8t4mDJHcXuf5I3IMWtoy6clOZ7ahXDh3e?=
 =?us-ascii?Q?VnPTsFEk4b7dUc5MYentPHHXfWwV1VSWUiGPpa0u1NirAOCQha3/YEI3XHq+?=
 =?us-ascii?Q?rD/XXu85NI5y7X8zcI+lE9MbQyim9/qfi/pMcfGORaLsP6yvXdA5i8zIUlWo?=
 =?us-ascii?Q?ZzN0U3yYH+ZQ/yhN4fZKhv426QWBNZfkk6jRmFiHfh2xEU0tZ3SLjilRmEkN?=
 =?us-ascii?Q?9ZEMHU3MeE48IZJrLM8vFJg+XM21YePPWdFPbBJbVoGNRCBV0avtG8EbjGAA?=
 =?us-ascii?Q?QJKqUWSmDbqC7ia3+nIz6Rk+HMRLwMf0q7m1hIEYhaW5yRZJfgCUm6LN6Kbp?=
 =?us-ascii?Q?uGo3WRHIfjAcb/oWqL8s5riklAvYPtLnUbUlznvO4jc7Fig7f6C8u8bKc5aV?=
 =?us-ascii?Q?ofUOCaXHRhkGPf/p1UzQB7G+zzEfG1OOq1U6lrtuf+5aL5WtKxDAoe2KdkN5?=
 =?us-ascii?Q?4CyiJn9kGF63DqPYoce76HKWOmDJ6vJs4ouP/uVy3crnpvEL2fKOC/w+ZdsV?=
 =?us-ascii?Q?aWKqz4GUwNeZa1h8MheUK1A8t3jeiHsILCPGEp2QgGat06yFm4W/+Eln340f?=
 =?us-ascii?Q?rRrICbGX5UqkA8fZuHCQcXEEvKhP1c99Smpb/fxeSbPhsAzZV5XiSTGQ8PEs?=
 =?us-ascii?Q?1wYkvrsxOROD2y9s4quy59LfExbTeAW2jQnBqEZZA9aJBB27xskODhx2L+MY?=
 =?us-ascii?Q?ONh5ZPVd8YUy7MpFUcZ+BNzLOa3B93adrgMSHlPS/sEvYNPCzeaATeRwJQG5?=
 =?us-ascii?Q?C/kaPsZhQJNa2rek9RHzeqojkg/bIkiCemjUBcBImjheQ7NQqapHG+Ee5Qg4?=
 =?us-ascii?Q?jIWvEnEMzhnmg7hRHIT09YXVzbHcu7XHwTeF1FBqiPAWwvMjwfN9tkWlV9Ue?=
 =?us-ascii?Q?PqDx/ag7lgr1ei4CNReWartH2CliT9srLNPyoJNN+tr1CGW5uU4ksef5nviN?=
 =?us-ascii?Q?rW3RKyxOp0fyD271kg+Hw9kAAj8ZVo1BGmC0HItGRdu2z3t7W/wPIiwEqUxS?=
 =?us-ascii?Q?Cawv+x7TOhSbj3Xq+FQOfVnHecmZTz0zcklSthZ/oU22Fj47Hbz8qjRCz/cS?=
 =?us-ascii?Q?7zzq1HgTsxDJX71fP6rp9ETiOwmTA29dwZ/fqKcywqaszkj+iWKR1U+tvytu?=
 =?us-ascii?Q?lAQ9gdGFL6lQSzerlfJUROB5xE8OfeIKzbk7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:26:46.3914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdc30f7-608c-4e04-d75f-08ddd38cda34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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

The memory target check is a hold-over from a refactor.  It's harmless
but distracting, so just remove it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index 6a004c6e6742..7c43397c19e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -249,9 +249,11 @@ int
 gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 {
 	struct nvkm_falcon *falcon = fw->falcon;
-	int target, ret;
+	int ret;
 
 	if (fw->inst) {
+		int target;
+
 		nvkm_falcon_mask(falcon, 0x048, 0x00000001, 0x00000001);
 
 		switch (nvkm_memory_target(fw->inst)) {
@@ -285,15 +287,6 @@ gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 	}
 
 	if (fw->boot) {
-		switch (nvkm_memory_target(&fw->fw.mem.memory)) {
-		case NVKM_MEM_TARGET_VRAM: target = 4; break;
-		case NVKM_MEM_TARGET_HOST: target = 5; break;
-		case NVKM_MEM_TARGET_NCOH: target = 6; break;
-		default:
-			WARN_ON(1);
-			return -EINVAL;
-		}
-
 		ret = nvkm_falcon_pio_wr(falcon, fw->boot, 0, 0,
 					 IMEM, falcon->code.limit - fw->boot_size, fw->boot_size,
 					 fw->boot_addr >> 8, false);
-- 
2.43.0

