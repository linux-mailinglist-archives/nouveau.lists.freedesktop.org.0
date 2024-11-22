Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCC9D5F64
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6F10EB82;
	Fri, 22 Nov 2024 12:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VckHz1Yk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EB610EB81
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZRgcfTaNjYOoFw+XJCV7bDhocjJxm/qCsL406hQQqwWdmrVvREiHCIaYe1SN8mJVSvr7XlLq8XQLS2w2OanGDjGLLVzaSsUs3RkqP649RIrrQdy+3oYS4qTH1Uab0paQJ/iy03mQ5MYA3kf/Guut5/S+aa9pSBX6agGSxizHt1rPSiV2VjrRRVyqcHEFeiJS1w+BG1U6pnwgqMaL0qaaSFdIgxyxG3JnMy191CGNIKm6xHn7MYrrjpXqTsWW+u1BQWiuSP+ptjBSvmO5ZERLfUp9ba5tdW0JqvPU6VnuBSE5EGj6G6Ti/DKAzqh+PO/0UnMxskmZCuDR1FcN65l+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7925a4CuHS6LoOClZ+8lZoneLIkSHJ3gPR0MA0lGEM=;
 b=a37sGpYnvHB+oCJP89NWRZa7IcECovsq+691f+sJKA4E0GlCxcXgGKAK3ZB45sYXdxfP7fO2OR+VzsmFu2DimBf8/P2etKPQQzj6yvsBgzOQMBWcL7oPHqbRmG9vOtEPXTj3rvZ7W1gPBY5i4ma0Y+zhzAanPhrNBwOymq8ItXlQGlqAFkwmpS8qpoXd7CGuvGo2PhqO+sQ1IoLyyD+rbv4f1kzDtWkEoMqAAnlbKcDEdp6lrgTKq5npuQky2WQuB0WmtDXMr8DaErh3enkpbMH+rhFgoziq/KsDJsO9xcwHqHw9ehFZ7zMWQpOjafCXXkyMZmQY9RFSz+kqX8neFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7925a4CuHS6LoOClZ+8lZoneLIkSHJ3gPR0MA0lGEM=;
 b=VckHz1Yk43iTwgXzTO1iMFmMphW4rR5XDbOvmH17n6Ni0dlb9xEa+CC1V2SiSjCKt+e4yAEoMUJDxyb8mZ2qqv8n5b87WUH47k6JiAhsFQaCZnKoNH5gk0eV3DNPGRg0UiVfEwye5iF1CSFt6UA9A3b0iUunCCFDnf54KCpCeB6MhJ2gg2cAwpI2kw9nKs1TgWLeqThZvnsCBdQEhZIyfYYNppRKE1wcM6orB2DkuJSQd57hAzsQ5PL91A12ELcpm2QNxoADvoXqsyDprKaUH6g42H5E/+G7nYcU/KZThqkgjkL7QynbJcIjwZLSG+NhZd6HtEX58Agj2NtrJCv92w==
Received: from CH5P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::8)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Fri, 22 Nov
 2024 12:57:30 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::fa) by CH5P223CA0013.outlook.office365.com
 (2603:10b6:610:1f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:30 +0000
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
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:29 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:29 -0800
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
Subject: [RFC 6/8] drm/nouveau: override the WPR2 heap size when SRIOV is
 supported on Ada
Date: Fri, 22 Nov 2024 04:57:10 -0800
Message-ID: <20241122125712.3653406-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: eac46029-a78a-49f8-17ef-08dd0af53952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0gYUu81v+K5/ibkSX+xNOUKgdN9QXI2UB/OrILMD9wPNe/n3NrJts2jzQ6IK?=
 =?us-ascii?Q?nE6yINLl5kvR5CU5fytwOAphLIhPFSX5bSEPRCa6MbNtVwfz8nj1SEv00s5Q?=
 =?us-ascii?Q?FMYUc7jKunYY5XAxgrHfNmD+BLmFhzY7Njd6EMW+/Ibvwi/OOrAG2uQhmskc?=
 =?us-ascii?Q?tJ/vfUnGdLzwu+TFLDt5eWC284pMd/Rese28S+mAblozdUr+UajxGxj/8l4a?=
 =?us-ascii?Q?P/fNEZJvUhBvrYUL1fMqqiDdP1NeFuCfGtBYmY8r/jtfx/MtH+g0Z1r5hLJ9?=
 =?us-ascii?Q?F/02z4yOC7bYVvxJb1SU/B7pCtNhsNhufSG9BAhmSmLEuzRDhcbEJ1XpDBHf?=
 =?us-ascii?Q?vRlazKn5cD75fnDsnxdFfcnkFGry9VH8qfeyLKrQLElmtZPrb6PxIriLC4Ud?=
 =?us-ascii?Q?vCZ7MJDY53qBh1poZfomsOHTI2s7+DgVqb22vezLtU7GVZCevjNPa1H68OJe?=
 =?us-ascii?Q?kyqQVu/CcvgkZItYFXKllBhf9oaOTuMiLNRWkDWDs+iNjqr4RBEOu/wgYi4j?=
 =?us-ascii?Q?CGdINgOW5FcJi/DqHHCLKMt5H+g+2dG/ITmX2opZJec1jFjH239HEmCO1P+w?=
 =?us-ascii?Q?bLPPuVpR4FCzSBJK9cbRriQNb1QJsZt+4x+3E+IRWHF+bl2oYex8Hqv9dMyb?=
 =?us-ascii?Q?808XGAdYABeU9U+vXb54VOULBCCDETHEbUy/AgijVZ1a+/fYaJtfzcG2mi8j?=
 =?us-ascii?Q?JmVWutAs6coWil3AbHfV0vLkrnGgN1rg6/otw/sV9Um0unlIzuJqwEQTh4Ci?=
 =?us-ascii?Q?NL94OZmUoRGqX+3HRl9P3V4fjRMAu6u9wmBNO/fDpicvrdGpXeZO06be6oAQ?=
 =?us-ascii?Q?c6vgkUx64qLhEZXFZMc3WCWhniGHpBCcQoKoZifMVof8yQWwMp/6Z5Zr23Uq?=
 =?us-ascii?Q?B3xPsJ3n4+LS0Jowsgm42XmdhQhGhmWAEhuahUiFrQkYabM1w30adirLTMIK?=
 =?us-ascii?Q?EKlPMPQ24+fjDuQ2b+iLx13w65fsKYWoRPbjy2AwcpevbRuGRZJdxGNiWasH?=
 =?us-ascii?Q?Z1EPA3TX/1WSJJf2QLx5lnvXK20XF/odLfLBEjsJb+vwyAga6ZdY2onF4Jj0?=
 =?us-ascii?Q?oTf0R4AxO3eO8aiGaomIE6XfYwOZdpmKTqSPQL0SVWp5ZehaOAVkDA6jI/R0?=
 =?us-ascii?Q?X+G6vKmN6kR9Q3oBe5Z2ouFZ4T5MLPBnnOciq/+YHcofBqdlJmiXDDDlVm6m?=
 =?us-ascii?Q?eMdMFCA9boC1G5DKWkxV73hLtDfTyZtUzx4ipslQe9r3f6qefVIaO0Ege80r?=
 =?us-ascii?Q?DTE1XfDdT9nr17phcCxuP6WXYmhVQgqW5au7o9hYbjlKBq4qz+nQTPfmpAr/?=
 =?us-ascii?Q?jDV7dgiwXZYIdqUA1nVesjGdsH6G7IHHTAUdQzn+FK461csF/gKf4rb/MFEi?=
 =?us-ascii?Q?vkNhrzsf/uFU2bnx9uOh3LFCW5/cgCSxksoDwXkVQa3KCBmSBpTiTV0EQsir?=
 =?us-ascii?Q?2K32JDW4r01+VQoiPtDO4ZUNRUvKTceO?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:30.0331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eac46029-a78a-49f8-17ef-08dd0af53952
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614
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
WPR2 heap size is required. On Ada with SRIOV supported, the size should
be set to at least 549MB. By setting the WPR2 heap size up to 549MB, the
scrubber ucode image is required to scrub the FB memory before any other
ucode image is executed.

Override the default WPR2 heap size on Ada when SRIOV is supported. Set
the WPR2 heap size up to 576MB when SRIOV is supported on Ada.

Cc: Milos Tijanic <mtijanic@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 3ba67eab08d7..1e403dbd7323 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <core/pci.h>
 #include <engine/sec2.h>
 #include "priv.h"
 
@@ -58,9 +59,18 @@ ad102_execute_scrubber(struct nvkm_gsp *gsp)
 static int
 ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 {
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_device_pci *device_pci = container_of(device,
+			typeof(*device_pci), device);
+	int num_vfs;
 	int ret;
 
-	nvkm_gsp_init_fw_heap(gsp, 0);
+	num_vfs = pci_sriov_get_totalvfs(device_pci->pdev);
+	if (!num_vfs)
+		nvkm_gsp_init_fw_heap(gsp, 0);
+	else
+		nvkm_gsp_init_fw_heap(gsp, 576 * SZ_1M);
 
 	if (gsp->fb.wpr2.heap.size <= SZ_256M)
 		return 0;
-- 
2.34.1

