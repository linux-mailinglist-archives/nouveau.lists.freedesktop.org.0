Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD2AB2B71
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5DB10E25B;
	Sun, 11 May 2025 21:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sk7ZWnxa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B698110E25D
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGU6p9QK70o80+wfbnKVc6f08d9AK0fcWWr70Oj9v7Wm/t6Uae49pvGQlHDRRnILBXXDCC2IeRZjz1ZWUXmXVozQh/VKaZtcL7Mg0X86g7NoddmVPfVlUNRjoGp9ObQcLBwobmqy4GheGA5FAwY2N+pDhgk+uPYomWkSHcHVX8HGrufyUk0PxIrjGY4D50ueNhBVmL2fxYcJY3zE3lLhtIsEUxbmvW6K30ySN+tp4u4PLKzPkkt31pLB/ISAm6Wa05ZVctriy9FsqVsgtxuBKuuN15DarUzHzvDcAYe3BcdR0cpQKbL/Iy+ZZuVnfgRBTbBIpycmknHdFTXTtgG8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecPXjfGCgsk6RaOqEfOLFjFswWQzq7fC2HmQX15VlJE=;
 b=bX/DO/JybK27J/vfs3K6ny32BvEGR8T0b3P20P7BJFn1PGbyCqYW9/N2RhWBpooqgyabN3RqijVpF47RpEesDnLJ/reso9fRSSUpJJUYXdS4ar/Du/P60uwXIxoOL0xhcmHgV+yb5Z3+5diNETdtgAZr76lv69D2Zv5Xa3pDsNBx13ysm/nt+++wyE0hMwf54CnHmQ9bV8/xFvMIPdIlmVxHExOCrnOqO7rlSMOro8Y+9Zl5c7023vCZU/TMnk+b75fFttnBbei5xiSiVIMF93HTPvIi+7a5sURfIki9JqxsTJ2FOoG+jtFiFf+CN82ZfHZqmEJpOpvhG8/2sogyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecPXjfGCgsk6RaOqEfOLFjFswWQzq7fC2HmQX15VlJE=;
 b=Sk7ZWnxaXUP1VwJ69EXdqdJY5Yg+tA2pBJkrwSYaNhLmUI1Kunel3lfYHpnnJ+ifdE3pYiWWmUfX33AhIlhILi5+oSevBp5HJ99ln1rX/lh59oDxnJBA/qyHFU1HG4mJn1YcvN1NMGJHtxwlXqHsjqq120FnZuylATYME1lJZPwCtaCgHxEnikfLNP3JdO1ENhE1y6K8zrMi37iBFg4RbNafXt6QpZdXP5yYD8W7x17bQRoxHBP086jDVWg+392x1nUUAsFKUwxZ9ZPIgsn1gkR2TTOsdrIW9S5ON44LvyDaX43VOOK2hY7hFwj7uywKCIwzPt1oAhKp2pNaQNIsEA==
Received: from DS7PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:3bb::12)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:26 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::6) by DS7PR03CA0067.outlook.office365.com
 (2603:10b6:5:3bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Sun,
 11 May 2025 21:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:17 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 44/62] drm/nouveau/gsp: add hal for gsp.sr_data_size()
Date: Mon, 12 May 2025 07:07:04 +1000
Message-ID: <20250511210722.80350-45-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb3fc1e-9f77-41c3-1426-08dd90d01c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?31Ag2NWsjD3K85wbg9tDoPxH0jC/hiXOD5cHyruKEV5AUnnYWvs9UT8ZMy/7?=
 =?us-ascii?Q?2PnPvtD+sbUB7R6kDyjXOlhl4CzdS84HN/63KhHvCAYU67nYQbSg+08ah7rj?=
 =?us-ascii?Q?TVTnn6/EdWAtqrqO0DiQ5RhC4v81sKL09ntI+pzOI1AJfo7dw4bJC7qR6qhz?=
 =?us-ascii?Q?JamAYp5ljWOptDtq8klPcGwcuGwcBz5VES1f15GNbQKqdNL7vlSMAL/H/OsA?=
 =?us-ascii?Q?DtBnA07YqpCMOmZtq/zbWUOiVvS3nR54ee/poBhEDY2qEkvtuV5sRyJNpURO?=
 =?us-ascii?Q?FxPH6Bl7LURhJxZy5aGVEVg2bmZbKgpcTnoReUMXv3nM8aggcaXH63EHwZgU?=
 =?us-ascii?Q?x8X0JV1hZPck41hiWxA+EFDYKZQRzH3kfaZZ/bLB/fhfQNUOsETyrrgbtKNT?=
 =?us-ascii?Q?Xf5NwNfz3NIq2nQ+Xt0bQws074M3SWpMI+mXhUmWw5z4L8X5OcFbcs9+eLiI?=
 =?us-ascii?Q?mEEGkKQxc7mB7gSqScGgh1C8tHqwrS602a0akujb5eAMSTE8R6g3wBSX/3IO?=
 =?us-ascii?Q?AKcYYSHX7CQXdjnDMhnae0aKngv2bMa1RRKq7yA/HIo9Fi74ca8aUWI138X9?=
 =?us-ascii?Q?CYD+DPo9gFaizVbQRmG9Q9wYN7wJw2+r6ig2jIrlXzrijN6hEEGocKiTStyC?=
 =?us-ascii?Q?d5j+fSLHNDV1XTJSc9/+MDf5lK3Ae0c4a3RiFTV0G+1BBASTiXdF/lMDPY4f?=
 =?us-ascii?Q?Uus5o8dephXT6ORAkBqefQSNn5PzlO0ejKyb+9Zzwz3a19wK4Pg0IgbJ6lmP?=
 =?us-ascii?Q?2Z0ZOpCLGZyV9PdGywjJN2pCbCZazlE4bBy9HSqhZ3lnGsEaS+oR0vz1pPD5?=
 =?us-ascii?Q?5eCt/WdxCCwQwuDOsl5DheZNP0wjjZHw301WWBwrmyR91Dc1NmvZ+HowyilH?=
 =?us-ascii?Q?u+CVt8Ly8h+SJx2nYlLWXlVJqnn5rM5pA/EKwd3vM7kZ16fPlKnTrJiYUHBC?=
 =?us-ascii?Q?eHG8kcJmRbiZqUcG6ba01CDhQTsuF+S5qnEnUsL+WwxnEwPl88m2HAQys/m5?=
 =?us-ascii?Q?UaU+EEvbWZQVU0XlwwWQSlyL+a5Bv+ahN52E5W4PUiV2y8XBIdZNkPA/rVWc?=
 =?us-ascii?Q?eZaon2DdvcmxQ4HhhFVqMJVZgH0jCdiSOQft2WtCPzHSNnTzJ1tQjFoWanzD?=
 =?us-ascii?Q?XrlQXpBtz0W3Y1/yFtoeQttBgFH3YcFHv8ztt/ZYnitSjSUvnWGkBlzMAh0u?=
 =?us-ascii?Q?kx/KS1mqj56WxQvJFvu4Gcr8jnVv0H3AD6iFecQJFWK7faXEeX7eagcuRAYt?=
 =?us-ascii?Q?gyqejvVUQz6qAsWXbkm910mqhRYGerOVu+6egZ97DOaFJ4CcJbq63MVaSCN1?=
 =?us-ascii?Q?5PYhdUlMb79epb30rewbzU1UkEzKgIg8E+hBxNiOrBNpUj2VCNUxLbfAUKv0?=
 =?us-ascii?Q?qMqFQZNOfbeWrF9LCzF0d8GQbldEk/HuX5iQdXaI0Mb6CbZyoxME3/J4hUQ7?=
 =?us-ascii?Q?cl36WMwxG/4RjWhQBXBkXW2H3gApx9Tez1dgCuhgrCnRWi4phQJbrqmmz7VM?=
 =?us-ascii?Q?IS2xM0VAIPmjOnY/S8gAU+Amo27P4XctgJaB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:26.1987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb3fc1e-9f77-41c3-1426-08dd90d01c93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

570.86.15 uses a slightly different calculation for the size of the
sysmem buffer needed to store GSP-RM's vidmem data across suspend.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c    | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h      |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 94c3c55eb314..57eee1c5ae88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1705,6 +1705,14 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 	return ret;
 }
 
+static u32
+r535_gsp_sr_data_size(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta = gsp->wpr_meta.data;
+
+	return meta->gspFwWprEnd - meta->gspFwWprStart;
+}
+
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
@@ -1712,8 +1720,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 	int ret;
 
 	if (suspend) {
-		GspFwWprMeta *meta = gsp->wpr_meta.data;
-		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
+		u32 len = rm->api->gsp->sr_data_size(gsp);
 		GspFwSRMeta *sr;
 
 		ret = nvkm_gsp_sg(gsp->subdev.device, len, &gsp->sr.sgt);
@@ -2172,4 +2179,5 @@ r535_gsp = {
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
+	.sr_data_size = r535_gsp_sr_data_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7aed7cd72e85..eb018b73d26f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -34,6 +34,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
+		u32 (*sr_data_size)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

