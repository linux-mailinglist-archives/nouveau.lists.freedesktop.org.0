Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CA9D5F60
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA610E203;
	Fri, 22 Nov 2024 12:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q/NqYf1u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9B10E203
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuEf+VU13MusrlN5F8+lsj3Npdh6QvhqzWI/rzCMRwI7IpNAYQQUyLk7zDX2RDhqr0ULdVgQooXSiH9yYpbxCvXyv5xEt8m5Cjf+04L7p1rstGnVCmKwSP0GKpw+ZKKUVLX7C9bnywC1hcRDbzh+sO3t1PdRqVkltRFPpOPhhfHtJoKvWDRKPWJs6ZOV+n4oRwcJhmZgpfa6A0xzy0quOZDdW+cupuk12CPUMGu/uYqWE8RkUMv5Ai+xATfiWfDWMH7LeVtm/EKjqHmXbf8qac9JJ2OPGutOEXo6/4UETerEdkAXip/gEDj+mAvuUAqhYijQ/mLMlfQtnVJT9VaRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEi7ipy9CFtQOXrlv2IKDDH5CmTJNWVw36usHx536nM=;
 b=LuyZDO50qJcnTFyIMLI7QLt6qwBlF/ioi8Rz8gITgaTn9IWMAJyl+epCksqoQ0mbrq0QO0J1FQGizNjV5R/vtgSPYFLFD7cZfLU93eJK4KPGFJ4tNOv7WWYtivXXB5U29Dsn29t4OyKHubanGgklWSnvS0vxwJqfNOkNNGnqSfM89OK4KGElIM2J9tvQA30j5WP8pJmD1cKuSauPLBkfANGntcvUy0Jj3OM8aP738ltolMYskUsYZMKX/4W47Xlg+z+cNk/im5fjTMXeqtmGuFoUpFwynp2u1mXyReVGVwNFqpYjiRLMp1K1HXCjFa+fXxwyIaz25Bx2OY7T6gObJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEi7ipy9CFtQOXrlv2IKDDH5CmTJNWVw36usHx536nM=;
 b=Q/NqYf1uNX+l59D3G//Y/IneTJog0DTxk2iCywJ8ZzjzXvwrBic4gAMZ2KDfM7G8pmkYpr5pclAKGKBZkq/5X8AMHy/Tvo7LMOWaYUczW4zOuzFafm9y0ycMgi8jrkrv3XHMYKwRQXBTPGMNR5Nmy+6SirjxuMhhuhP4Xu6gUI2PDxM18dC9Ax91QHvP2JiKrp5hlV/wXPPvmzVbE+r8n3INJ0H+zTVeeingiQghFo+160zIcWxKWhJCxushpuYiHhs81mre5reHcz4YDvbKBJXS7J35lFH/1HcqUODtM+Xop3r7nFbs4lQjcMwNiQcj8LzNIQIZd3QWYFcSIDekpg==
Received: from CH5P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::27)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 12:57:26 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::e6) by CH5P223CA0001.outlook.office365.com
 (2603:10b6:610:1f3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:24 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:23 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:23 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 1/8] drm/nouveau: factor out nvkm_gsp_init_fw_heap()
Date: Fri, 22 Nov 2024 04:57:05 -0800
Message-ID: <20241122125712.3653406-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0910f110-9b41-486c-0dad-08dd0af536df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UvjZIZaVRQBdW02sErFWLdpdrLT1Nb979x0l9L09YBylpgDZ76ME0kxmvyj?=
 =?us-ascii?Q?HTFMpYBnHPqvt+4edGpFst8hI6k1yMuBr9KIHDG95zipIlUJFC6W4BDn8KiH?=
 =?us-ascii?Q?XaWgwoI9SEYQMzbbL42Qrk5P1WSd4pwpFog415M0kVDaKH8GX5qwIpH+SOJE?=
 =?us-ascii?Q?RZPctiJke6T8/sdEaRUXCjDgGwbm9HvDEKAbyjq16nBXRcvz5umv4WReGXx4?=
 =?us-ascii?Q?VkK05dfEG133R/yUz9iCANd1qG3nMhqIpx7y1X0KAwTxg1hAsJYRCQn1VB4K?=
 =?us-ascii?Q?0vgGeGSw4jOjUWlvy22XL8jR/zdcNceaaPtTPePWq5bKFUsTccNi6ZjSl2iK?=
 =?us-ascii?Q?lJZwwKuHLFlmEX4aQhauV7YE+RNtL/yk7s8cKoFlr6X3B5x6tIw4RJJrOll4?=
 =?us-ascii?Q?2U+tvvvK+ijJih1yp5K7HOu3oNPZI44bGra9+y0MqSi+mUAdDt/jqxeJP3xR?=
 =?us-ascii?Q?89tgSos3FDoixdVZm1vrBlLQ9HqdbKemn19uf1OtYa02N3NdqEo2zcHCWs4J?=
 =?us-ascii?Q?NGCKtgIf8buiUkm0c2UyRyPoKSllstvzwYJ260A6At4mplJWHPSQzi9iiTv5?=
 =?us-ascii?Q?eMxRoQX4PKK//AiDsUJoDSZJwckCle/9Z1/4ZT6b8rRUmUCOaEa1QVEoMbpM?=
 =?us-ascii?Q?UMjqmZ7V3JH2SIIg2nn48Wwb7AgFfnyQAyOD1jgpyj04U7F/eBJAoaeHVRfr?=
 =?us-ascii?Q?j1qrkpzpE+smzcsl1I2uAjMfi9RJzM6DLUuRyyu1rPap6cdsUiDI9RFMAyQ0?=
 =?us-ascii?Q?3PKo/XgtEAis/SjAU70lRRBumgJcRpEjh5XHxvdIMfu5mvi6DFXI7EB1exIS?=
 =?us-ascii?Q?3DT/UOW5D2/dUWeoNSuEDY3LKQ0JolDoAqJZpmYnlDhLVuK30vxZ3B8qe8OM?=
 =?us-ascii?Q?a7kLcS5zyeth3u8NeHMAV7BLb0wM2ia6r9VXu8FA1wXhPTGkEQyh8F1syFWy?=
 =?us-ascii?Q?UHKK1LlcqTzlNZdFk7lmk9EBocMquerX6aMER8oh0P58gZsgGjC+1b4bWach?=
 =?us-ascii?Q?yKdyEv8d+dfubGE/lEdZXRXdf2xbRqvzHu1mLhwHshJ42noYBWbS2L8j4rBc?=
 =?us-ascii?Q?aPPOvEoWtMU3S3LP4045gXo6Ogjo0jymaNTuoLUlm2EuvDg9VvKpgoZy2DX+?=
 =?us-ascii?Q?uRENCSRCCcINlu1vTzxB5w3FJNLGH5TNUJygEojpuDUjF6ByJIvEO86mVLNU?=
 =?us-ascii?Q?gBKMLSqwZtxT1JLCS3o+I4vGJI9jbbMj6H+EB4VCc2/IPTvfGbzKfzYUv1uD?=
 =?us-ascii?Q?Vsm7puAx1Axcs3iT3DpNAWJTGc/1NfkcRayUUbNf/4YLbA+GXL10yDjghX/H?=
 =?us-ascii?Q?Pn/3QXffzMjikdhglmVRXEuZ8qenmwzMbBl43PnpFKD8aQYI9lfL0gnubQM4?=
 =?us-ascii?Q?gwFg3KpHkkdqitS8EPrHfJIMWj7LcE99RrQs0EY3u3MjG100mlLvc6CgIk5K?=
 =?us-ascii?Q?77QfwGyuGvfWhKuR4C4zs/QungV4FYdO?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:25.8925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910f110-9b41-486c-0dad-08dd0af536df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344
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

To support the per-SKU GSP WPR2 heap initialization, first, factor out the
common routine for all the SKUs.

Factor out nvkm_gsp_init_fw_heap(). Adjust some indent to make
checkpatch.pl happy.

No functional change is intended.

Cc: Milos Tijanic <mtijanic@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 69 +++++++++++--------
 2 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 9f4a62375a27..579d83048164 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -58,6 +58,7 @@ int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware
 int ga102_gsp_reset(struct nvkm_gsp *);
 
 void r535_gsp_dtor(struct nvkm_gsp *);
+void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index cf58f9da9139..6f2319845322 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2517,6 +2517,44 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
 }
 
+void nvkm_gsp_init_fw_heap(struct nvkm_gsp *gsp)
+{
+	/* Calculate FB layout. */
+	gsp->fb.wpr2.frts.size = 0x100000;
+	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
+
+	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
+	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size,
+					    0x1000);
+
+	gsp->fb.wpr2.elf.size = gsp->fw.len;
+	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size,
+					   0x10000);
+
+	{
+		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
+
+		gsp->fb.wpr2.heap.size =
+			gsp->func->wpr_heap.os_carveout_size +
+			gsp->func->wpr_heap.base_size +
+			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
+			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
+
+		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
+	}
+
+	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size,
+					    0x100000);
+	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr,
+					    0x100000);
+
+	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
+	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
+
+	gsp->fb.heap.size = 0x100000;
+	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
+}
+
 int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
@@ -2581,36 +2619,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	/* Release FW images - we've copied them to DMA buffers now. */
 	r535_gsp_dtor_fws(gsp);
 
-	/* Calculate FB layout. */
-	gsp->fb.wpr2.frts.size = 0x100000;
-	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
-
-	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
-	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size, 0x1000);
-
-	gsp->fb.wpr2.elf.size = gsp->fw.len;
-	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
-
-	{
-		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
-
-		gsp->fb.wpr2.heap.size =
-			gsp->func->wpr_heap.os_carveout_size +
-			gsp->func->wpr_heap.base_size +
-			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
-			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
-
-		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
-	}
-
-	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size, 0x100000);
-	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr, 0x100000);
-
-	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
-	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
-
-	gsp->fb.heap.size = 0x100000;
-	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
+	nvkm_gsp_init_fw_heap(gsp);
 
 	ret = nvkm_gsp_fwsec_frts(gsp);
 	if (WARN_ON(ret))
-- 
2.34.1

