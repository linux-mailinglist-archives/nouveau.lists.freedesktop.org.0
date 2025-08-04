Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E463B1A9A2
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 21:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C87E10E220;
	Mon,  4 Aug 2025 19:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bdQtCC2x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2B010E37D
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 19:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZgMIxrv62c1azSOVvw8UwfqLVTd/6NCAE8dAv+TtL/LKV894Eugjpi8/KxWmPGHoPSQs0kGfZnlrYgg8w8VqpII2widbPUEpPIHWW9VxL+se73lugbK9ED4dklIbfFUYMOu6L4zeW6hofStkueywZ01uCTktRso+A/Uzo01GpWj2JTYmao+h8HFY2Vrd4HsmE3FvuAp6y1ig8w3mhig0PO38b2+DWN/B1GUKEQTpdwJJg5KkpJhoS2li3oq21w4SohQC4oDo57TjPES7bJgK30Jpo61suHII0hHnbzIi834sGbigwlXjzySdj1vxxmLCHCHlihpuo353/aKWAtolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/QYR4zdjvi50NCHAht6LMRDpBqqZHB08m4eMf43Z9c=;
 b=Eb3vTCPUvLjsBx9ftbZ934TIqnQqkNMtjG/jUt/J3SSwxK63WMdZ4Tc6tv4J2dhb1K+UfRvDvYnBRZJBeyPPT2IAPUcYXAwQrAYmuSxwPL1LoY1kBfwDPNChXTF7rw/t/cWTUiVT4ym4E5mAMZNqM0X1xhfs1Pk166EGW4ixd5tb+M58oRJY7LWuxn4BEMoMP6DWCxkKviAzxqWoeB4bHn5NPowXeCtd6gRa9ixzKE1guqo2EusLH6KI1ig3m7s/F2Hz8iG4yULAzcyZ9mEx+nyvXThogLNxJIe0cPmZM9savFPmEsYj9it9ihZSZjwAiZBwzRILE0tnCypLwYd3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/QYR4zdjvi50NCHAht6LMRDpBqqZHB08m4eMf43Z9c=;
 b=bdQtCC2xPqwI1PVif6fGKom8OP9ZO86aH1RGVUbFr2nQPPYk696/W+HZnnkcIMQSY2ivZb6PNQKZuxD4TcSm4GKIw1NxUJt5PLaWIuFsf7oZHX5iquTfumEtCPGGV05T0CzX4b5bAYlUIjDYBfu6RKzznk3HWfeKRida4W/Rzz6r+eKj+BjfsLKhLwQjmpF8+r4XseaGv7Hs0jO74Ibg1JRY6Y76JsZ8vYPxRXoH7NJ8uWHbvTwKyBZGRtTvVEfdOjxtnm0NaDyn2cg/Rqd+PvLW7ir1mBugQh1UJPIiJUOEWjLTnuEs8FQsQcCpB/tneBss2fyNmiAes+Z8VuWO3g==
Received: from MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 19:26:33 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::5) by MW4PR04CA0095.outlook.office365.com
 (2603:10b6:303:83::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 19:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 19:26:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:11 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Date: Mon, 4 Aug 2025 14:25:58 -0500
Message-ID: <20250804192601.10861-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a78a16-6b3b-4761-c861-08ddd38cd1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1p9qpqFKFdVC3S/KNRaBpd3hDPrfR1BX+Zi5na4nwcKM/hdsPpj5v77uNpLC?=
 =?us-ascii?Q?IUmuBc35wIqCC/xcTCeAdxl7LdM+NimGXbmniq+qENbGqfmcJ1FC+NF5H+Br?=
 =?us-ascii?Q?H6LscKc/b7WP8WGK6TNJD8Ygx8bJ/9P1hkHE6pvy3ZLokb1EnimUqIKeWp2m?=
 =?us-ascii?Q?4zLhbEmkwksn9HRKknfMWGAhdu6hEkqw5FUUGVKez8x5brSwU9DioEBP/JTZ?=
 =?us-ascii?Q?OcyvpcVRPYiHKjk3355aBCbeaa3wpR+ZH3c0nacJblIP2XCP9KvJ3KkydkC1?=
 =?us-ascii?Q?yLx0ou1a5S6Sb4R/OTlEIOW9E5S7lMMlnfDT3FueEt1OD7QvbVTybM4DLjRV?=
 =?us-ascii?Q?jWccO/L8eSWgX2FZbSzkZqT7E5KEWRhgpu/92Wr7Pte0gxjXoioYlEzWMLn6?=
 =?us-ascii?Q?mQFhpRso+IT9Vh2duSYa9FpxTqVf76KzUOUGdbuRpTjJkmkWwHzPxneSTEtu?=
 =?us-ascii?Q?yqjj7n3+q4KW9+CH6rZQ3iD4KDwCGDQZd7LsN8fOMdHpY4HnULSIbZg/bJC1?=
 =?us-ascii?Q?PzW3MDBgw7RwQ5ohcDBMok9Exl6jgZ4/ly+TaZcJmva0vF3AEy/KNIAsKE6v?=
 =?us-ascii?Q?+k9kcb1JuhGmk/EsjgEpAsxVKXizr+f8Kiv4j/p98OT/eM+BKyY6WyY+7kxQ?=
 =?us-ascii?Q?DA1gVvzksFkhAMIC2jC0Db9ely7Xm0koCueVNmgYa8mqoAgNO7uElDuWZ/6Z?=
 =?us-ascii?Q?muLY9nz8fEeioWOi6AzEalEGM6wwYrSik/GOitPeRArOq5XX0Xf2Zxq0T2cI?=
 =?us-ascii?Q?JFqZTq1IQRXfbhIPnWxagm5iku4KKVgCGIgq3lxATT01YBBh0ek7KlcSZy0q?=
 =?us-ascii?Q?e8+acy4HZWNHJt8VuAeheV/tUKENC9Cy8srTCFIV9sdutmHMprXG3Di6rIc7?=
 =?us-ascii?Q?p8W73pUP9zB1GxlgVFFRvZsJXWlVVEtu6iIk5PCHMkK6NrNt+S+wYzXqWO4s?=
 =?us-ascii?Q?5uNkPGVXUeWtxp4DoQyP4kmQY82sW8laPWyHP+sDYF89WgvuDIyBqaZhUvRs?=
 =?us-ascii?Q?dr8hl1dVjT4R05s2RmnJhbcU62UB/offRdgiZA5GcsWd6ywIgHeshjL6zZEp?=
 =?us-ascii?Q?Bz7kfKFrOV/MSmP89EnC1IUnkW9hbifahwX6jakXn8wHe2O3b/Bdejlvcg8d?=
 =?us-ascii?Q?7rb0wHh8QNZVFPc/qLhICWcCOLq1FGHgWi4N7aOmD5hg/uY+Cj4Hrqdy7Ey6?=
 =?us-ascii?Q?PahAh/R6z8fjm6oXM/e6qYQToeeUZVezXfr2Mtg08/mZOo/8MANwdq8bGQhm?=
 =?us-ascii?Q?C+UKZMZKEUtEjmvNIC52LwzlKTmA7Ghnzcm5Yn8H6EVW8Orvt8GfqRfJI6w9?=
 =?us-ascii?Q?t1U51db+a/J+1MnUyyRcsJXgC0OIdAXzFhf8ih0Ue6xmWQuR4w4qioLpFznz?=
 =?us-ascii?Q?na6VKxJUJsrLe7WlD2BhTh0RTsJxI3YMIDi1qxmARxdc1Azvh4LdjFtVl4mZ?=
 =?us-ascii?Q?eygtXG805g1F4VrH4z8Dj219KlnxLWtW0Y+qrJG84i5CG97932QmNS/9cSIS?=
 =?us-ascii?Q?xUewaGgpW1W0wF4biSKB55q9VJQpLdFYYl2U?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:26:32.5901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a78a16-6b3b-4761-c861-08ddd38cd1eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
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

Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails, but
it never uses or returns 'ret' after that point.  We always need to release
the firmware regardless, so do that and then check for error.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 52412965fac1..5b721bd9d799 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -209,11 +209,12 @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
 	fw->boot_addr = bld->start_tag << 8;
 	fw->boot_size = bld->code_size;
 	fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
-	if (!fw->boot)
-		ret = -ENOMEM;
 
 	nvkm_firmware_put(bl);
 
+	if (!fw->boot)
+		return -ENOMEM;
+
 	/* Patch in interface data. */
 	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
 }
-- 
2.43.0

