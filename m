Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710D9D5F65
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0A510EB84;
	Fri, 22 Nov 2024 12:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ssmAEEWL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0FA10EB82
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFQS9cPPaCfh9drknqemNWYuTjs1T6twIyUjnPfBn7Q/cSanbVWFQ6JHXsTWWR2vChxKOcC4uCDUSYW5EZERXTBXyggs2gvUpK1UvTD9F3TekP7pwkmPbXemGAjfUURrhruU7w5Q1wcy3ULmyjizD8x2x1SwnSFQ5xF9vIYLRALT1tW06tr+7GR9LLHg5n54JONBs2D0E536nmsNU3UORa3r07gUg3Lq1Tum2uLJQlTatPoRvYUyni/olpSeLIq1dtPR8aGzi4Qkc9YToAer7XPqBaSty0DIVgm3Aibv5u/cvucd7t571zRW390ONUy7UPQ/d6e8n2IgVBEEm+pv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaTBjcI7SnhByizuJjA/nE8o6IxvRE0YBMRPKqqEWRk=;
 b=wm1Kx6mauXeUJ4QENS9L8qfD9zDN5LLMY/yV5yhtd8XTT6biIxcsCwLTBOR3xT/ACZgK6a/6/9NvJWBL9dq86KrbcIDfmuLiI43gUAYyjiDYMhcqf3987Uri3ncGY2+83t4vxjISeYYqHLBUpkr0JHz5viyqjwdwcSzaNdXhJ5fLgGYXffzVToPsDJpOM++4NIoD3GA57mqIWdHoEGNPqbYfhHaSbGvwxLzb8jEeh7pc2MCRZOKu6KpIWRSIk0pjzjTtOytxJlMTpz5UrSo2gq4uTlnr3W5bp8fZQ/qQ7WifIuh8pT26V/Cw80N8pk3qsEVMAXdRrHwi7+heLUrqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaTBjcI7SnhByizuJjA/nE8o6IxvRE0YBMRPKqqEWRk=;
 b=ssmAEEWLpr1DcBmLykt6A66JLZrhI0o9+iJCQ/6dv9DQeHNm6BHFTf5QrfA4OY1mRcvEsizDqKzqSrS8POKggO9ddQsTXzpa1F0Dvvfr8PPIjVuDsUm0E3gZJJBIBwMLL7ZsQWa8GeXvnt80cAubHuHyXGgxVRpSH6OyZ2s/9PB49AezYJUlI3zMz4MSJvhfPiY+ZuMDO75kEETJRA/OSV1QFb8HHYLOzF0kB6wTnJ0rbDjdsEO2xunXhi9y3Pdl6k5l+yBKm9zV9xX3wlcFoGH9i5PIoZU3jKarWXfzh19LhNd1zm72dRzRFg3EusUQhVmVzRglNSHuUdr+PGtG2A==
Received: from PH8PR15CA0001.namprd15.prod.outlook.com (2603:10b6:510:2d2::13)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 12:57:31 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::3f) by PH8PR15CA0001.outlook.office365.com
 (2603:10b6:510:2d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:28 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:28 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:28 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 5/8] drm/nouveau: support WPR2 heap size override
Date: Fri, 22 Nov 2024 04:57:09 -0800
Message-ID: <20241122125712.3653406-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: e887a830-a9df-412f-1f4b-08dd0af539f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bo/LFY51D9Jd4f4k7MnG0/7Jyu1pxpFm53ngU3esBmQ9YZBI5QBSlyWmpYwv?=
 =?us-ascii?Q?UZLlCQLYoeELv9CYYBSG2Yft1FGXJlcSQ5NrJU1OKrkHgUJBAlMVGRza4k7G?=
 =?us-ascii?Q?6eXabk1cESsFotXoO+haU9GOXoXWw5VS2q3rhVWPKj1olhVQSN54fILqTlAg?=
 =?us-ascii?Q?AC6UkimcvpfbR1/eqQmYyu/q53uRH5JQB6QKEupr0IBYQR3S3zWC0P/74YYl?=
 =?us-ascii?Q?OSHWVTXkZh9RP458VP6di+5RsasQlPV4CbRCz6xxbgYigG/472ia6yz+J3Qt?=
 =?us-ascii?Q?+fxQBZZRH9kno0aTZv93FzDB6w4nD4zw43DR8lqatWNIvyocA+fCUrdw9TkF?=
 =?us-ascii?Q?8bqAZaVguc6h7JB7zBFUtt8oTK79ZHVEFQcAZOMnjxnrm21lsCNRyvVRuzIQ?=
 =?us-ascii?Q?DC1/uprHYabggZPsXox+awN+E9sNQ2wHRzK38vF1dVzi9aZmzeOGN+ZLHjIJ?=
 =?us-ascii?Q?ZhUGZmsQyF2CndmLarUK46CWjCIJCcUV2E0KLrLDVnkFXtmgyQTWF8DhSisg?=
 =?us-ascii?Q?bkzIn41NQfGrYLFiVWEu+bNEYarzVo3+cyonqdO5o8KNshE9KhP34nM2OFdV?=
 =?us-ascii?Q?D9xGyFBiH6/j1sirAXfUdtcobQRaSfmd/2V+ebuOuVlinlWMrps9ag29a0M0?=
 =?us-ascii?Q?etL9mYOALbDxTbpVC5aXgFYHuXOlB8F+gFjwend6hlpqzvW2TbEfYuIqZi+t?=
 =?us-ascii?Q?z9zDccUkYAJt/g9d1jfh7x+Xu0pltawQYc035curQeu234SN75ogLn5pmOza?=
 =?us-ascii?Q?Uy74D+QTc3gi8QhZVlqE8bfQgIhQElGyD/71rZH6qKwT+clZHXfOz/3+v+UG?=
 =?us-ascii?Q?iXPQfHiA+wZ+g8zRUIRx7XXhZqxUcysIpQd5znWq1CWIm2oZLnpsdQLk82M5?=
 =?us-ascii?Q?Dm1+BiX3xN56dl7zqEk/HYKwukTjkNrsDznLOEnI6qu4CzDUTAOf2Wkfe+ST?=
 =?us-ascii?Q?zh1tm+MUgjakVlGzsQMbeaoDMIQl7bdE37qdijrABtgNa4ahFVd2hxBi76gl?=
 =?us-ascii?Q?l6JC8EWqlX9LlRE7UGQzuLho7VP86WQv0nMP/acA4j3kbuweGoISlOyg2gJM?=
 =?us-ascii?Q?+y/k/joTF8WpvSPqk7K2b+vZ8pah7mZdr8zm9Sp3Nry5nITg01d7f/qBfAeF?=
 =?us-ascii?Q?OJ9OxKEEBEl91uwe+FDf28ftMRavUrNPdk1GtQknW/pfCxg9LVOQPw5B79UC?=
 =?us-ascii?Q?bRfEg4W3avfZ7lopbuU5Hpr149ZqSLi1QSimpsfhVAoiLnRaws5PGlYDqdFo?=
 =?us-ascii?Q?KB7u7P9HLt+qR+unPG1lJvZJegZWKNujH/iLEidLljpwpfQLyuKplorq+9dU?=
 =?us-ascii?Q?0dHEsbnXC6NPfN0m0Q+G+QgP65IBAs6Kwrv53yoz1I7+GLnkoYQuW3bTqgrZ?=
 =?us-ascii?Q?DtHQuHObUjWE5QOahkoBditw3Zi+gJjgreUpVKfQVF3lcFyNxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:31.1212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e887a830-a9df-412f-1f4b-08dd0af539f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
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

To support the maximum vGPUs on the device that support SRIOV, a larger
WPR2 heap size is required.

Support WPR2 heap size override when initializing the WPR2 heap memory
layout. If zero, use the default WRP2 heap size.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 7 ++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 596ccd758e66..3ba67eab08d7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -60,7 +60,7 @@ ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 {
 	int ret;
 
-	nvkm_gsp_init_fw_heap(gsp);
+	nvkm_gsp_init_fw_heap(gsp, 0);
 
 	if (gsp->fb.wpr2.heap.size <= SZ_256M)
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index fe56ced9b369..fe2ad4753d5e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -63,7 +63,7 @@ int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware
 int ga102_gsp_reset(struct nvkm_gsp *);
 
 void r535_gsp_dtor(struct nvkm_gsp *);
-void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp);
+void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp, u64 wpr2_heap_size);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index d5d6d0df863e..5a47201bf0c4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2519,7 +2519,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
 }
 
-void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
+void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp, u64 wpr2_heap_size)
 {
 	/* Calculate FB layout. */
 	gsp->fb.wpr2.frts.size = 0x100000;
@@ -2533,7 +2533,7 @@ void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size,
 					   0x10000);
 
-	{
+	if (!wpr2_heap_size) {
 		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
 
 		gsp->fb.wpr2.heap.size =
@@ -2543,7 +2543,8 @@ void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
 
 		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
-	}
+	} else
+		gsp->fb.wpr2.heap.size = wpr2_heap_size;
 
 	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size,
 					    0x100000);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index e279a322704a..eb6081946c13 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -79,7 +79,7 @@ tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmw
 int
 tu102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 {
-	nvkm_gsp_init_fw_heap(gsp);
+	nvkm_gsp_init_fw_heap(gsp, 0);
 
 	return 0;
 }
-- 
2.34.1

