Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EAAA3C88
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6683810E580;
	Tue, 29 Apr 2025 23:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hn8GmDsK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FB510E57E
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C24SLUPyyxDA8vN33AOJg4bRKsX9GK08UWGnLOf2tvOf/lsmAjP58EASZ6VPoABB9aKb8cr/7BzRiQHwZMt84Nq30Ir/2goQZVOXG0VuDNSsq4inCZCPKB2IAd/dgiAFEYLoB/rzk6CmkNzIzLyLiaPe1Hxg0DO7bTi1xd9qCURAwQMOwLrApUUbqKtgH4Wx3VfwGoty8ltO7hsrIYS/Cq+GTLwLahekcT14NaqFMkFs7H+aood0jrd9VbXETo4aV0bLv5yyqMdfw6mbAMrbbD7S7s71kTT0LNTIJWwrhnLKEKaeNV1so1dDR1sx8N1SFMI058nRXEn0ETgiqyC/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BomsfTWndL/D4+780dSNvSAP+Zxz4YznWOOXqv++CX4=;
 b=TDZfKz4lGTp4QWMG5F/7f+1o4oGVik5ReLLUyB1/d/t6/jk0SVmOUIAbSQUVjXi44KqyzrmGhqbKdDGrhTWBcT9SQZ3ZPEH3fU87KKxWpuKfPWYdDoTCNFsyK41y/Alw55YCCmOoOYMge7bPg6etdJ7UXUlzlVxrjX0cR2uQdXYj0cFI+H9S5FZa1MWDERtR3+1M+WzedQr+fqPml8Jcvvc7HT3SVavz3qdlExIB0MoKq+6TEB8r+WJQhbHhRtE+iyWS6SKx6xv3StRyBsfroW6HYgggvdgPLP5ccNCOAR1RVjAf3gXfuPFbQuIEMY2h12X8bofTisdVUXxeHC3y9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BomsfTWndL/D4+780dSNvSAP+Zxz4YznWOOXqv++CX4=;
 b=Hn8GmDsKsOIfgWrccivYt0mulvJv+aWaXQFoldOcr5agYJCFbVL0guq+k9WN1NTF1NngKTsUfgVUaEdQOlmbskL1aShFHoRPHVk2Zzbz7TqopZaGF2739cec9k3iCN9ZPOFBcPRaoQ3yzO7BPxqp6uLtTyBQzjZgQwB/KXjGYwHt6KLXWZnDJdSdRGi4t5ZcCfIEc7rs1/KjFqDtW8+XpeL0iYVTwv1i1dTksGWvMfVS+31Pwt295YjFVgFC5h5CCyFAjnI0hJ3/bIxAiHqwreO3w/ABDDzvJqNk/BFrPBU09Udrauo/ySeUK9Z8/3fp6yi0ncGkjwsJC95e0+C+eg==
Received: from SA1P222CA0031.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::11)
 by MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:26 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::fa) by SA1P222CA0031.outlook.office365.com
 (2603:10b6:806:2d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:10 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 25/60] drm/nouveau/gsp: add hal for
 gsp.drop_send_user_shared_data()
Date: Wed, 30 Apr 2025 09:38:53 +1000
Message-ID: <20250429233929.24363-26-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: b52fe3ee-453a-4068-0627-08dd87773791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+No3C57F0CZlFonLr2fq3N2IRYUHJ/XOzbtEZObC/xmsczqjWAF5LBp22+bd?=
 =?us-ascii?Q?ghOzEBsTRrrR831emUuWgDd3nwmCdAAJwQBoiVHclllNJYKPQ0h4W7V4Bc/x?=
 =?us-ascii?Q?wEi3LH3d9jZ+sP3gbAjmTRkjdGUx0T+v2j0B+SNNExjQys2ba2tAVy735WVf?=
 =?us-ascii?Q?cI3vx43TvHki3cys/CgQhCzef43uQZxzVlfUNGPGRthFfFVhk2gmrrTdWmyB?=
 =?us-ascii?Q?CcgR4dsJs1gJCK4amjxZyqwKRKKqJ7SV8V5vWdm2NedDUMB/svteMRjklJtx?=
 =?us-ascii?Q?/yKVG3PZkBIACQvpDMYZmlT6PcVqQuy8giycAbo6+zGymHlkXCJ7vdjph0CO?=
 =?us-ascii?Q?3EYlensukvBgIFXiNIwKppSmnGwIyVjjM0zGZTId0Loy5teSXodCOa9UdGd3?=
 =?us-ascii?Q?yBakLEJJUoEISc8Me8WG+wJFJaIwt5dMSzV7fYGvPG1bRWDp9wBo64/BwBOI?=
 =?us-ascii?Q?px/5pdvm3J4GWcZx7zE3GOGD/0Du31So0ABzt14WmxImS9vNOpQNDIbtohqi?=
 =?us-ascii?Q?+FhdsPSQAe/PqQeTZVMTzqOMHn5xAhAufO/0uAktW80P/ke6pnps7yf/UipB?=
 =?us-ascii?Q?b94t54BRBh31i+SbIrrgj3d1tEWubCM0fRmLNMA23DnZXhOeud6oKSQJ6pqg?=
 =?us-ascii?Q?er9k80woMtojGiCdpxcxoChclIiMEaxw6vxFVD5W6ErKH5pSWUf+A1Op2RzA?=
 =?us-ascii?Q?IguikSCNPoJ1XdC1nEGVXzjT59u8MEZtZ6yNL0DxT+dieXFxCwSkNhUespwk?=
 =?us-ascii?Q?jNYGKAmvU2XUVl0QI8g2BBsN8Z80u+4iVr4mIknG0mFapTQxVZD5992mfEFP?=
 =?us-ascii?Q?Yq8ZZ1Tsp/Cv6AoXSnbrAM2CM5MW/R1EDbAaLByUudySprhBa/O2Lcbx4280?=
 =?us-ascii?Q?eIT9zA/STu7ElPAAh+EsaMyvSFVnAr5XL6fl9tCW6qOx8Wngh61nY+JJtYyZ?=
 =?us-ascii?Q?5Xx/Zn7cn62Z5LutaPuzVRnP2hl8gvWPbyybhEdtk5gFdALk8HYSfg/GKHPp?=
 =?us-ascii?Q?w4dnby6s7J90jhZ11Bhd/43iXTsORXpvES8K397FBIKFrrQV7MBo9rEdw6rI?=
 =?us-ascii?Q?71nAmUzAEk/RSsOXNtIZ/BfUDhiXLTvyHFR98ZGldUqyf+GCknVysw8ecziy?=
 =?us-ascii?Q?BhrM5D3NlS4xt8gXe66Y01t6XMN9jyLQVsQHOUWbRluT22vDIk7aVFDiIirM?=
 =?us-ascii?Q?1NYaY1OV+gfdGBNYPxvAEqVodY69wQdT8ArYOYqxgozLRjzLhZMMhr64APkp?=
 =?us-ascii?Q?y3jotiTeJ0ANtNvMfhGSZRStV0zojAU8FC01IS9TfiYGqNkXN0CxntUmmw2l?=
 =?us-ascii?Q?GOGFePI4K4N7cd+cFqVl2XJOpHOwlsDkizK+9FIzgbO/zqlHiiMZezivtg6r?=
 =?us-ascii?Q?wUfUBs3/B8PZHES/65rP0XRwHAkNDqiFzYA4xuzPEDI4XeyfoWbhQEok7aOJ?=
 =?us-ascii?Q?eH60mNj5LhdqM2IPH1lxtnKCahVnvke5ggpllcPlhhDrAlg/iFZ74Lb8Taap?=
 =?us-ascii?Q?iQc18/FRexOqHbY9mfe1QmwrSRV3Lx/gMVFN?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:25.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52fe3ee-453a-4068-0627-08dd87773791
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index af93116a0fd8..218a7141ba97 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -2097,6 +2097,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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
@@ -2144,7 +2150,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
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
@@ -2174,4 +2182,5 @@ r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
+	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 3e5c6b369d82..7a0af26cd7b0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -29,6 +29,7 @@ struct nvkm_rm_api {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
+		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

