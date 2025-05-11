Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3CAB2B76
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DF110E271;
	Sun, 11 May 2025 21:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dmyytdrw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6221110E271
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgP0axmVgr3TOkNMkTG2fCzth1kAW9Dy/ZSaj4IIdL6sRFLCypHFAHBpevLgFKOlFySEs/Tky8RKAO4OOili4VhqK5JJAtvdhdHfGoT7IUfEdSUSzX6Zqvpp6lTkoKHnlVG/iCp3ofAwUCVbjlYJelZWdmdBnty1lgzikM/mvvXCZkC/RNP4ZpeU67tP2EbGC/FXsYN3DygQ09ePmoUNSzkezEHqTrp9E5n2GRXJkDBz0Xaz2PMboibCCM1SdIJOEDRSXq3yupXx/oXYCuvI2EOjsHIbKkJlfLqVm1G4w6lDwIwK6d/pskH3zyZDkdDzdHwfbxLp5fhD6A33+ajXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGuX5g3xk4fAjYyiOARNzDQPLBU2MCDatXEDlAn03E0=;
 b=KzA2R86KpyqZRboymdGvjCg3K3NT0mky1ACqXARQqe1oWI+cKie21FZk3R7Bo8wWuP1n+sFEEqxYnory4opfEF6KQXs48R6eZUFxpNYLLeSJONtHVVt5Dh0Jx6aj8lC0KH1pZeitXrJPGJzxjfKOmuqF9BnNV5jWpcQB4+sYbaSP8eHGUIGMAtPL+wPuMWZqo3m4L4xesP1OCTTWY177NnLyqiKgcLQX1gX/S86BwP0K+0QJZf0WEjE7FMAjARSeRLYJc4ikl3cgDBTJNcJ7tYGWZ6i2OXHTFwwBQk/7vmXt7sF9ZZejlHXGuXX66g8VoJT3Sc/p2vpRfW2hDjfdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGuX5g3xk4fAjYyiOARNzDQPLBU2MCDatXEDlAn03E0=;
 b=dmyytdrwkKA/ZjcSS0QGQuIOBzrc8KQNFUweq1mfXE7wYVlhsppj+QET8TFq/Jxm1WBDz6zmtlpujuVAbk47GPB0pFinHW2nkUGJ9FvftygLKAu4KwPg9aMq9YOFuDXuPgHn8ZHZS5D9Yn3ipEp6Wx9kqPAAHU2awuu3NT3IwjUrW267JlOwZsKL0+qsOZylpxDar3+zD/Zaozftba0k4eC8pe21HXslx3oTavRIpR9qfn0hCgUBhIK9M7+qJ2f1roScnjISexKeMxSS8JzkOF6wTrZrISRX2AlMv2kLwJqeSpDer0zwmbL7hcsQTV0QfUOPdskJ8CPGUZnE+naFDA==
Received: from DM6PR10CA0023.namprd10.prod.outlook.com (2603:10b6:5:60::36) by
 DS7PR12MB9549.namprd12.prod.outlook.com (2603:10b6:8:24e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:09:38 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::6c) by DM6PR10CA0023.outlook.office365.com
 (2603:10b6:5:60::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:30 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 51/62] drm/nouveau/gsp: support deeper page tables in
 COPY_SERVER_RESERVED_PDES
Date: Mon, 12 May 2025 07:07:11 +1000
Message-ID: <20250511210722.80350-52-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DS7PR12MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1a3258-e1f8-46fe-be7d-08dd90d023c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6qxFgskfRsRvfPdCwYgzR/HwE27lvAgoL7wqnHKe14HpI47qKRpJJ7/+dxzX?=
 =?us-ascii?Q?vDRuHs6RxF3FBedjg0lFj0wYud1N4N9+cl0IXAo3Ps1wv2HepWhVzJuS3cs+?=
 =?us-ascii?Q?KypEYuyM6jOZUa4jJDX/gephgMmZ3lmo5ieyoX+CqGILwcoqg/aBCaBWnSO7?=
 =?us-ascii?Q?MenHI7x4IMqceRF5U++jCM6snIARwJtBVcROyYE89ZI74uozojeQlXbKsNDq?=
 =?us-ascii?Q?sZE7e1mM8VlLOdVoX2jsSE1ajeZbfsInla+Q8T2/osr2Vndxa32YKQcLG4Sn?=
 =?us-ascii?Q?L/QH2YbnM2wKp0MREvj0gYkKkiTHEJwa2H+9c2apsuAry6/CzDr9Da+qGjby?=
 =?us-ascii?Q?IeYtFjwK6vEyLBIANpiX3dTsr+hqWd4xPFJj/B+kuuS6vD4+Nwmk2sE1t1xe?=
 =?us-ascii?Q?b+cLBGsDH0kydGBENrJhYrdpv2j3hpZ/eapOX9z4s4DJH6ICCjQV6c/YgOCn?=
 =?us-ascii?Q?e34XOXVosYbCIc94tbdPOh8loRoioPvNxitWzRsBkmK1U1KgezPpAJkGsQZi?=
 =?us-ascii?Q?cW6G+dapIbwy5FKBkcfQrQgTrfvlcqCjPytcUqLbr+4J4svrxdHj+wtnP8Lf?=
 =?us-ascii?Q?0GCryPtgLIy0h2hCKYA3B0pJFg3zxebrN7ZN/Dh3pE9NX+KUnvW00HtEHu1o?=
 =?us-ascii?Q?KBbx05cFzYpxt2a+Bf2++XhmTuhpzYH1zndgoc8EzFV6d4cB9WqfC47slDnE?=
 =?us-ascii?Q?KGOBbrDwQmXB2OK4uNWwL2vv2pDruWWSYrn6XcUdcuIQEQFLsr/+aMhXf9wm?=
 =?us-ascii?Q?HdVbJeun1PzMzonZVKRQJT+Zz/ZCozOQtTiVVxhuPcuNTpb2hsCZjkADjmOu?=
 =?us-ascii?Q?JVa3ct3tT2J3vtR+xN4h6dfRVKVsOqiI1vxc8HPFNeQjQcfun9KaHT3LUTSj?=
 =?us-ascii?Q?EsxhUv4zOVkfb7wvlZ46ZVikJhFwBTnufcZcDZt6+QHPSyRBQT1mC7gEmOFW?=
 =?us-ascii?Q?F1Obu/YVJcGpqVBCnkdAsULe+Vkgnh92rLYeX+NJS5BRSNYu8PUcsKVzcDea?=
 =?us-ascii?Q?oLFdT8jXyRHyIqX6HRpDL8ufH9HmLzZMsKVMPh3UT9QZmRd65S1PblgEWtb0?=
 =?us-ascii?Q?RHg9BwS1v4BDWqjrQC1LrTyH56/+0ita255qoWpA2dOTyXmSYeCSy8grDmJU?=
 =?us-ascii?Q?bJJnNShI8aYWjv6HYK49ppkXgUMyzUkkkoy30rLzm+f7/Ck6aumdXWzQVw9M?=
 =?us-ascii?Q?TSn1ey+QKBeyRFTDJlLRSNrye/r0FKu0nq2P6gVRQGKXVPeCiX/7Zb6WAWGJ?=
 =?us-ascii?Q?mXCsrvMj5YtvSCYNHp+O+QYOSEYViroIm4nUG2RGwH7HQNybBKih866O2Uhv?=
 =?us-ascii?Q?Jiv81sKpVrBQSwzHtw8rkeIEKnHs+b1JY5qDv8NiwHMngujbwztSfyQchwYo?=
 =?us-ascii?Q?Fs6SNI8TuNuFkRH/gOnpkisxPljd2YLXtfMOiWSoAuwxXt2M0X4h1ciWgppI?=
 =?us-ascii?Q?jox9o6gJZvU0SCYmHfMWdR8fzGHMvW96F2uPup/Q6d1CbnF1K0964UfNNhKR?=
 =?us-ascii?Q?iBuyZkEAoTxPEYFyYP05VAy8kl3UA7RX2Jzd?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:38.2510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1a3258-e1f8-46fe-be7d-08dd90d023c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9549
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

Use data from 'struct nvkm_vmm_page/desc' to determine which PDEs need
to be mirrored to RM instead of hardcoded values for pre-Hopper page
tables.

Needed to support Hopper/Blackwell.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 47 +++++++++++++------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 0b1b41bf6230..161b66b252ec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -47,9 +47,22 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 
 	if (!external) {
 		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
+		u8 page_shift = 29; /* 512MiB */
+		const u64 page_size = BIT_ULL(page_shift);
+		const struct nvkm_vmm_page *page;
+		const struct nvkm_vmm_desc *desc;
+		struct nvkm_vmm_pt *pd = vmm->pd;
+
+		for (page = vmm->func->page; page->shift; page++) {
+			if (page->shift == page_shift)
+				break;
+		}
+
+		if (WARN_ON(!page->shift))
+			return -EINVAL;
 
 		mutex_lock(&vmm->mutex.vmm);
-		ret = nvkm_vmm_get_locked(vmm, true, false, false, 0x1d, 32, 0x20000000,
+		ret = nvkm_vmm_get_locked(vmm, true, false, false, page_shift, 32, page_size,
 					  &vmm->rm.rsvd);
 		mutex_unlock(&vmm->mutex.vmm);
 		if (ret)
@@ -66,22 +79,26 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 		if (IS_ERR(ctrl))
 			return PTR_ERR(ctrl);
 
-		ctrl->pageSize = 0x20000000;
+		ctrl->pageSize = page_size;
 		ctrl->virtAddrLo = vmm->rm.rsvd->addr;
 		ctrl->virtAddrHi = vmm->rm.rsvd->addr + vmm->rm.rsvd->size - 1;
-		ctrl->numLevelsToCopy = vmm->pd->pde[0]->pde[0] ? 3 : 2;
-		ctrl->levels[0].physAddress = vmm->pd->pt[0]->addr;
-		ctrl->levels[0].size = 0x20;
-		ctrl->levels[0].aperture = 1;
-		ctrl->levels[0].pageShift = 0x2f;
-		ctrl->levels[1].physAddress = vmm->pd->pde[0]->pt[0]->addr;
-		ctrl->levels[1].size = 0x1000;
-		ctrl->levels[1].aperture = 1;
-		ctrl->levels[1].pageShift = 0x26;
-		ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
-		ctrl->levels[2].size = 0x1000;
-		ctrl->levels[2].aperture = 1;
-		ctrl->levels[2].pageShift = 0x1d;
+
+		for (desc = page->desc; desc->bits; desc++) {
+			ctrl->numLevelsToCopy++;
+			page_shift += desc->bits;
+		}
+		desc--;
+
+		for (int i = 0; i < ctrl->numLevelsToCopy; i++, desc--) {
+			page_shift -= desc->bits;
+
+			ctrl->levels[i].physAddress = pd->pt[0]->addr;
+			ctrl->levels[i].size = (1 << desc->bits) * desc->size;
+			ctrl->levels[i].aperture = 1;
+			ctrl->levels[i].pageShift = page_shift;
+
+			pd = pd->pde[0];
+		}
 
 		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
 	} else {
-- 
2.49.0

