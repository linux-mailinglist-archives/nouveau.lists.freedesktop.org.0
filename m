Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62437ABA70E
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3492E10EBBE;
	Sat, 17 May 2025 00:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BL1SWGsg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DF410EBBE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6sexcx/xU65elPiayKgaT5/+NTcibCYOgUUz61+zzxcK5aKA1h+3dAERc+O6TMdFJJFO/a8S6GM96hdpykqNZfgLRHIWrVHkQVdc5QFLGjhbQPeIPu/nQ9i3rjQawxuVdnJ6rpZULly7eL+PuPLcMbZLGVaD0XHpMJTHfZU111vfl9ZWTwkpwzV6xFFMNjqQCz1nQ+D/Tm9pOICBBrXqZ4ssUcZ4Q8QE6q+oq/atB2yLkCDyLT0Ban4Eg+HprlbljCSGr1c8alEmGVlU7X9TSz494QHiil9/PRCxTyKzl616S25wIX0KGhmU0lDkYCIFB0SLwAOK71HoFFy4Zutiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dBgiZj01RKOZprbmJ5xtQl+fUcuxTKGDK+c69ywcSg=;
 b=wMexexMceBMo26o3tLkHYhWag7Z3RQIaP7mk/Aa5Iq8aoRuZkYG/TmMVh+j79qKnARGD33uC9fgPL5xc8xDA0dv7889owjn9xd1uLyfzc0BeAxdGZFuXAztwwfX9qQQ66Lfz+UBB6GkQG2euXWOrDpgwyZB5kyjWIOo3lLETSx/ipc3JXz5xU46cog+ON7kfiKPxvXEBbjLv09qE84oH3pujUaI+RG1SIUs1UmXk9AoBlHy3cu5ZQ4csZIiBSKIGlFgVV/BBDRncB2RCKV5LtMV2BCYdLbG4BzfwLT0Xj62X3s/+Cg0SV63l8PCTGOIeS3UGgLhpsIVKTjp2nfZGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dBgiZj01RKOZprbmJ5xtQl+fUcuxTKGDK+c69ywcSg=;
 b=BL1SWGsg6gBZzzBGNmVM1+Diokyz57JGg8N9dRyw+GUEopW1JbdC//aEQrv4b826QNk2lKBc+LcdmdjBwv36WogFTBW2vACxrhIhM3XicR2fvNpUtNVrSGEiEhJPTrvlbZRmh4G34cVVtwsK/09xwmwyCsk+T0s8ziXGfr5etxpJMBsr8wmPxOcEcxrylgRGIcRgU+bRFyGufQz2kOGn4QUW94uJYFcwUYfNkVMKiiIWOwzcw2B9XKO0YrXhZnFkGHjeoChpKsm5Msa0dUwOvvrtQ+1JxYVV3rTjKs2uv4OVU9R7tuiyTnj0lE/Ww2iEn0CuMStxalQSZXHU1kXNAw==
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:10:59 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::90) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:10:59 +0000
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
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:45 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 25/62] drm/nouveau/gsp: add hal for
 gsp.drop_send_user_shared_data()
Date: Sat, 17 May 2025 10:09:17 +1000
Message-ID: <20250517000954.35691-26-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b12d288-53e3-4390-b62d-08dd94d74d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WAqpNbVfXLcjCPyNbEt8n8ng+ALLwCy/o9jv8eGSVX494gwRc/I5EJZOOBK6?=
 =?us-ascii?Q?2vOYwrtSY+fmHBYofN5OVHlIK5yAQKXlH6ueSMo6DPykrKCnWlgowbnnVtHf?=
 =?us-ascii?Q?viXGQoca/TAC2hcC9l5Gqm6DlYHr4tDIsrinEm0AJ7NF9tiKiDP+pcIZqvgW?=
 =?us-ascii?Q?y+mjDszu7RuSioThb5WUd7tTBoPydXdroREWyf7yX/9meNExMKI8BHT0UG3O?=
 =?us-ascii?Q?w9WtweUFd9k6i6VN5S35LXnS6ou3Op/a/jK+X76IWi4i5Or1zBRp4/FLCVJM?=
 =?us-ascii?Q?QqdaNUNTTsERc4QJ5MFbHH4jrF2HgxgF87HKZOFdtUtdLXEfKuuGBl9eqvAD?=
 =?us-ascii?Q?5OUJq9BA1iCthxd1p6MSvKAH4IleC/oNCHb6lksJ5T5umAsgbxZT82fBJK5M?=
 =?us-ascii?Q?npwcAPb54XUafXZUIB0ZsJgMpoW8zoV5RaA63BmadLuKRYFRyUA8NDQDiFYS?=
 =?us-ascii?Q?ZPlj5EUC9fxjq2wdSPEcIPleVClG5gUrUal5rTdoedjkBbdaF4VJcrDV9LMO?=
 =?us-ascii?Q?TH7ibNwyRw/2nHez20Qa03Eh4EiKS4p0Glad3ftvuIXrYYmwOTMDKxCxvK52?=
 =?us-ascii?Q?H26mPkkmSL44jCc95jJDNpTaYtWDlQtvgdL7sn9hs3BjF8RQioLqYaF/qAdR?=
 =?us-ascii?Q?hAdkk6GTcdmnoKjd6JtLkdLQOcKYGjOBtxWHlL5eDJ1QvaAmzbNzSIna2KHv?=
 =?us-ascii?Q?1iGruws2aSZSzMRr9mQzpr0jgIXlVaScnpdntH192XrPk+oRxrRb0daYK0ZZ?=
 =?us-ascii?Q?tm8iV2cnTFlqInjXO1nz3x9ApMROK9wnR2Tg2EoRcfocIp0fP7jHbPZRC2MI?=
 =?us-ascii?Q?tVeng4b9P+mMuJpwCpwYrQBMehe4MT1iUG9FVoHaoq+2lGZqDOKWqWhs/9RM?=
 =?us-ascii?Q?sajXQ3AWrJO5isa9sJk1SZ+mxnsPxOTTcHwTGI9WCDo4xtVrBjUbSb5FVdUD?=
 =?us-ascii?Q?ZhnopvY5usWdSENMnQstrhQUM0AGT1wnRFJvmc5sSUqFjivXTk1KP0GyU8wU?=
 =?us-ascii?Q?8peJEMqUjUqrohyhczAOAc84u9408RtG7DdgIUQcEMjwqyxA/XO+MOyVjIlq?=
 =?us-ascii?Q?33gvgYpJGJ47CHjoexiQ5xLQWkswCqyM9pGnyXFXzUDBQR4yNTXXf0+z3Yyn?=
 =?us-ascii?Q?gRdve+MVZ8yKdpsszSIeNTZ3MM+aC1rF3p8v0sr1cMWtSVNW2uGnQDj6FyXM?=
 =?us-ascii?Q?QHVqgbkdn1eS5UNpOZN2OPSlB/BQVaCDIIaIxKwYhCvm/6xBQB1gXDAunPfK?=
 =?us-ascii?Q?3Ax73jQormsIvqM2NWJxsmQWuqraWgGuSxLeIECC/wIBkvKU4H3kMvYk+bE/?=
 =?us-ascii?Q?TVye6nKqJWzcY8djoLjoliZIVFGDubyYDKwIp9ZjqKhtxl4CRNDBrN7WN1/Y?=
 =?us-ascii?Q?5WnK8b3Lv00YCz9zqIZ7Jm7393FkJGeK9TN8GwCpCYpc6P5mekNiPqy220JH?=
 =?us-ascii?Q?3cK3W6KnOQAzkSSAiYJ2+zzUFh5KlU8OCmEpuryY2oYxfJcb4ibPLs1MOXYw?=
 =?us-ascii?Q?9WLuv9+8SL9i47mNIeaMgbdoUItIkCfqLlRA?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:59.1656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b12d288-53e3-4390-b62d-08dd94d74d58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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

545.23.06 removes NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, but has
another event (NVLINK_FAULT_UP) in its place.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 65640b43f477..f7cc8e03d999 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -2092,6 +2092,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(&gsp->logrm);
 }
 
+static void
+r535_gsp_drop_send_user_shared_data(struct nvkm_gsp *gsp)
+{
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, NULL, NULL);
+}
+
 int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
@@ -2139,7 +2145,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE, NULL, NULL);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NULL, NULL);
-	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, NULL, NULL);
+	if (rmapi->gsp->drop_send_user_shared_data)
+		rmapi->gsp->drop_send_user_shared_data(gsp);
+
 	ret = r535_gsp_rm_boot_ctor(gsp);
 	if (ret)
 		return ret;
@@ -2169,4 +2177,5 @@ r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
+	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index aecb066982d8..4a27e8bfafcc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -30,6 +30,7 @@ struct nvkm_rm_api {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
+		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

