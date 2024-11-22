Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5E9D5F67
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CC810EB87;
	Fri, 22 Nov 2024 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="itxwJk1r";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7F410EB87
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKz/SkmyAySGxLEKjnUz8QP9rHgUE/fHnj4MAxpQTZHzQZWgq72sH2m5jtyW1JIMxaksXqnAjNvX/lqKTuNOVpdcIsCDToKPS06wzkGIhxTgHgNgZEoZIEXFa5Jgrcbh3FTgBdavrfnMSumRWMY8AkjTYxPlsn9IwLVdLad8XAEL+9uyEQNc9YlHCh+3V5+MQueegkiPH+sE6tQHR1WaSVPu7HTj9yoemQZBcULOflc6M6YXWUdzHqFXef8AOc0GYnp5LyWp2BVbHuUXCT9mhmTCp+igk0s5gK0585f/RAuZtoGWRbLip7mmFCbHM+QshEDARRVB5ELseCcSJLS2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsFeiG0DrSmgJfm8BD3ndAwoFQfFzoU044JxRhL5TKk=;
 b=f5P/MKJdR8WwG/moVuuevpU9tkHi4XalnG2kMb4+uZI04UVTTmMIoZRIkMe0VhJbaaH5LWg+Rju2OL4OkrNTUStJt7gHizJgzgojwbuUxaEqFR6qlew39rmComKzgx0DU2Z3rlfuPRa9iEaOt8GFnD8NyVAW7MR4dJ24B9n7BuXwOyjOOeZ4jj+ECrYsTjkeh3Na2Rzs/T7JQBk0DEBJj7McnEVdIqo9/XwHExi0ZwmsgxN24Wzqadn1J8MVGIT8LdFssSYELHj8lBzaPfXMFjevoH1wzTMBbDOb1mSq9G5jSmuRGr4eS6TGmv2WQ3pXElhC62jEW4BlOf4LLQjwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsFeiG0DrSmgJfm8BD3ndAwoFQfFzoU044JxRhL5TKk=;
 b=itxwJk1rLCmFYr9vtR6Zf9Bx4nOJN+wbIUeJlFQePDSrsgOZhHhqebMsPJ0c/Qp3W0qDRfFIxRc/M7As2SfZBR64vrOir0s4/zQXbbp8Bw+jXUd3PwJobEwJ2xUOKoSSsthcF10Hv6CSextuAhXr5OAoI2pHksMhZF+AeNrVPfHJxEpPnz2zBlFsUmy+NKOup5+XVpaJeO+xxGdLO/4BeAZPYGTfFhq1x1wa6Z923rAe7jyAnG7mUoPTnP4HaZOv1943sP7c5bxR6cv8Ly9I7pvN+UkFBjst26h8RtvU94Wqe+hERizZVoQRqU1lhn6q/RNUSKtqyM51xTSG3K6dGg==
Received: from PH8PR15CA0011.namprd15.prod.outlook.com (2603:10b6:510:2d2::28)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 12:57:38 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::e5) by PH8PR15CA0011.outlook.office365.com
 (2603:10b6:510:2d2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:37 +0000
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
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:31 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:30 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:30 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 8/8] drm/nouveau: introduce the scrubber on Ada in a kernel doc
Date: Fri, 22 Nov 2024 04:57:12 -0800
Message-ID: <20241122125712.3653406-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed6a10e-7ade-4311-1c98-08dd0af53da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vV8ZP44kMjNKZ8BMoeuBNuUr67RoDC4WzpyauCsNW/ygwcPlIywvO5IJaf+l?=
 =?us-ascii?Q?I/mMHtprCKxXLPiXCPDk/u58fJGN0juK4hQLpvmd6qVKxnB+JYoYiLlEe+Tn?=
 =?us-ascii?Q?vvf4dzlhuLxNRor4XjD6VF+DEni6BHsJHzm4znptCvJzW4vMaUImY4whjYXi?=
 =?us-ascii?Q?dQ7n85VamQ5qHjE/1hUWLodQZ5AupwOF15KNIzddn+oqgu/koYo/PxNcllV/?=
 =?us-ascii?Q?K5MA51mwadlREha083MFsPO2tG8iirx+Efqe96uUHNCllaDKq4YM19ivpx59?=
 =?us-ascii?Q?6+YKc0AyVupDoNtJrVw/M3nm8kfcOwcVPVRQm+qaK7dIEThJEEY4b6rsd3PZ?=
 =?us-ascii?Q?l2md7ppUTVWLotxvtU2yg0pThL/210Kl+zrjU21PrFOTAyt0h4//62EWY511?=
 =?us-ascii?Q?61+A8wH+Y/x26PYy7ACBoK+e9VMed39C0bXIF5ULYbHV00y1R4Jh6Pef9BKx?=
 =?us-ascii?Q?AexMcgsr+u9zXbqXjw8NAlmd+vXcFQPwNAy/Ozd5kQJNh7v0u0ZNc4N7NRLv?=
 =?us-ascii?Q?wrLakApwxfz6bCIiioHjLQaX8CV4LvqJJkdnZQI8cjkoYwqWMxTfiM2DgDpj?=
 =?us-ascii?Q?bfY6o0sQPFBn7BI8s0rqZyqW1hSatOFQ5Npq8wFeEevFZ6OBJ6E7QvpslK3h?=
 =?us-ascii?Q?LkpSyX2xlgsXtc6fuRF+4eryuw0caR0OEhObyekv5wW6tCrOEve1rVjkfAXt?=
 =?us-ascii?Q?E9VkcxLyF/UqPIvz7RufX1l9x2Rc2/wH37AezGfdr9LwIoWb3+Kv52etrANK?=
 =?us-ascii?Q?Z8vzbAzbdyENvujup5O0QLI9oWj0ndbFvYriUKHzLKV1/U1vevhZsk7yXdqa?=
 =?us-ascii?Q?dyn7iIS6dQI8HZbw576qeHZf4O27AwwsYMaKRUrz6JI2cdTKD7KiWcZ3jh6x?=
 =?us-ascii?Q?rLo05tl4kTI8g83p4ojihFONn4soJZNKB7r/ZFs13Lii818nHKRtM6/7CFp8?=
 =?us-ascii?Q?SSVsMknCTr8Xatw328QVEl5rUhm2QeS+ns/NaTvobdivlOtwTXaXGoaO9rUd?=
 =?us-ascii?Q?zzZjs96NT//LMdNKKIDtRh/TwOfIgGpqEEulC7wTjm0QDJTroAtIpKrKfaFQ?=
 =?us-ascii?Q?GESU5cR00lsWtBk4a5AAlCk20jEOnzkkSQrnTE20cSdCxSz9zvm3Q/p7mMPl?=
 =?us-ascii?Q?khZG4YQiN7kcRyGoq+DeEtQUTIQCoeuOGY2Y01S9X3LDZSc09wCrZJCDR/vD?=
 =?us-ascii?Q?60vXqXrduZKb6rpgACAmLCPn1Oi8M5B9T8SMC0175opm+svZ8Q6oYPE9ljgW?=
 =?us-ascii?Q?m0lSEPJjdYYuwLmpuAsPsp1ln+Jx2C2gOcFfRyWUhxAtHWTao7TP4/zjPAzN?=
 =?us-ascii?Q?c37h+K0j2iAi4qg50urT/eX+R88yekndC68LztvE0umvR9VTrMzxDsLV5wKt?=
 =?us-ascii?Q?5vAwLDlaWmuyGEGdLwUHEPGgihyllp4jJtjTsHJnyfD8kLY+qd4detfGX3AF?=
 =?us-ascii?Q?u141Ek7/qWw6/9MoMN2Hh91gz5VVEGFh?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:37.2775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed6a10e-7ade-4311-1c98-08dd0af53da1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097
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

Introduce a kernel doc to explain the scrubber on Ada.

Cc: Milos Tijanic <mtijanic@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 80d6d73fe352..327e733e3e8b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -24,6 +24,20 @@
 #include <engine/sec2.h>
 #include "priv.h"
 
+/*
+ * DOC: Pre-scrubbed FB memory on Ada
+ *
+ * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/565.57.01/src/nvidia/src/kernel/gpu/gsp/kernel_gsp.c#L3151
+ *
+ * The size of the pre-scrubbed FB memory on Ada is 256MB. When allocating
+ * a GSP WPR2 heap larger than 256MB, the scrubber ucode image is required
+ * to be exeucted before executing any other ucode images. Or, GSP
+ * firmware hangs when booting.
+ *
+ * The large GSP WPR2 heap is required especially by vGPU when supporting
+ * max vGPU count. The required size on Ada is at least 549MB.
+ */
+
 static bool is_scrubber_completed(struct nvkm_gsp *gsp)
 {
 	return ((nvkm_rd32(gsp->subdev.device, 0x001180fc) >> 29) >= 0x3);
-- 
2.34.1

