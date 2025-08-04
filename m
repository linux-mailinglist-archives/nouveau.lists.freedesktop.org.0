Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D763DB1A9A4
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 21:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD010E380;
	Mon,  4 Aug 2025 19:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GadjGpv2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EEF10E380
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 19:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymSvvlhe3RWgWuoEybwP4tAoWk3hoEHfWsdA4vvCYusg24FIUfNWQv4hqZ2bJyNYJ7ooEdbpZyblxyjNhppb78gzn2tMR9lT/OOfXyuPY5TImQgeqdDRRVT5lUJgg4ypuGGookGiey54R7zMBFx1PUBLkKlYGXpJ4pytXG63vj6HTVZ6hRtMzvSmeT7LJzfKRWOAmBkm4zAo8rtWR/39cnO6tNM2YfmExUrlnKya3rjvMiiRhlLZGJo3VQOsCmQFy2S6zL9IvdOhPxBMXid2j9XNfvExkzuGYGODkOpZeWuOeRWk9T+/6DO2cXPzlb7US32DY8fFpZo72ROOgB+4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wZqWL5t3vmp46sEUkBTB0ebnM8s2Z/Jboog5chISg4=;
 b=ezlfOXciB9fLWKhL9btg507tf5WFFv+q03dVL9tCFVNdKrOQ3LWMy2lmCzKIbdYM4pc7SDk/O5VMIuEVWRFwT2qyQipIIGLz2eIgbWgZ0guxlWK4eFdbZGp00bqU+svpRyIyp8F4gTZZtU1JmRfMiMOO1Es+WjwH++JNj4ecVF8VNfJkHmb3zi2hzG9cvpFQgJsIywj2A7ofmkzABI4evbUs7ur7gM1IEWz+vThNVnMTSR+GZVZhYFJSsmiAnAS5xdKB7tADe1rOVgdeS7cxkB036qG0zdLb4o5vbmkIS0P14BukpEVPAy4zS4iLJkCmMDsY9RnfAxQBm5/tIGcrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wZqWL5t3vmp46sEUkBTB0ebnM8s2Z/Jboog5chISg4=;
 b=GadjGpv2ATV09w4CJKrD9TewYb7nbjsQUN0Df5vc7zcuc2hkNLgs+Cu3WoVV6nLTicFxYAo4z0LDT3XsT1XQ6B2AFJpcSJnc3ftIjidcOFw4IEQvGSGLuPe8Jadr+/6kkPFNP0fDwunuVkXFexSU5UIweGrvJHFA8MTYCACzm9RE4a6sWpxDrIzdJ1aoWMO/pjCh3SQlBg2ZzhiuVgJhcVQtVBKDCuZQjmNx1u8UIcwZ9+jzV2UBVh3P/NY8gl7C51quQin6SMH3UJiTMMfLFPuVp55eYTYOe1lredalQcpkEBUc+XVqOgteZfWycMSaC1TqMtIehUegB1BQh2lgSg==
Received: from SJ0PR13CA0140.namprd13.prod.outlook.com (2603:10b6:a03:2c6::25)
 by IA0PPF8CAB220A1.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Mon, 4 Aug
 2025 19:26:34 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a) by SJ0PR13CA0140.outlook.office365.com
 (2603:10b6:a03:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.12 via Frontend Transport; Mon,
 4 Aug 2025 19:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 19:26:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:11 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:10 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/nouveau: remove unused increment in
 gm200_flcn_pio_imem_wr
Date: Mon, 4 Aug 2025 14:25:59 -0500
Message-ID: <20250804192601.10861-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA0PPF8CAB220A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb6a0c9-930c-42d8-d2b4-08ddd38cd28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xbpZ87wsm54m1Ea9tBUALSGx6bgMseZV6wQU5d7ILEdbeihb6/SItw8EJ2yp?=
 =?us-ascii?Q?3LGo+vQ7ADG2xdOndJrYObMCMEcYeMUyC5J3gbQF0nDhkRa3W/5+d2g4QXEP?=
 =?us-ascii?Q?B+oQoWrpR1XqmKMJ/JW3MKH2yWADbVR3lYTwP42+brWfMzShDfEqhxCys+iG?=
 =?us-ascii?Q?d5TCqA3YNhxndcB8mhBuRvkY1a8s5qvBnWtxhAAXJryLJDCssepYR6rIif6g?=
 =?us-ascii?Q?6CQ3bszui9GuSCBLPRPrU6C68aE3I3BxyPYf5uaMX8pWLGnAKrNPG0GciwdG?=
 =?us-ascii?Q?vHk8xj0tuKVzLNcOYyLF9R3YRSAqxLqzF/JkJIVe21MBntmESRPQQpfcO6Tg?=
 =?us-ascii?Q?kGKs9yRsa2OqP/S0aACx/DA/HWbtMmbDeq3bXQtCxR+diW1Hl1656+/UF8Nt?=
 =?us-ascii?Q?u9dscYzBSE5Doug+A3Bt03/kYwJQuRXg2fT4TSde5skzP+xI1Ejp/p/MryFT?=
 =?us-ascii?Q?DhxHr5pBqzm785DZf6l8Ix6Pfv6s6nfiXsx6pP8pefrTnXTrtESpmwCU8PIN?=
 =?us-ascii?Q?G/hHm+pB8ymAZ1wAEjwPjwUOiFUgIuXC8K8OX4tT2mg5xAEroxcXLOZRgtx0?=
 =?us-ascii?Q?fzHuQMtKgDScIiZjCxlYFkrlfPNatVk+KqTLNXEzWWB8jNwCSVdWWEviYlRT?=
 =?us-ascii?Q?K2u1jU9x8CHgxkVE/+dvtgXTATcfNTvCzbInWUYFaZW5Q/k6uA10swjW1/jq?=
 =?us-ascii?Q?ifP3FLeWbDWBOpkc5lxLcJ/+tGhq6R05iTRwiBytrs2HAAUrQ1E/NXmlSc1B?=
 =?us-ascii?Q?NuY20wlWYXueJedtRHPlmleT597gvuXU7aHdaTFwzLxuQX0tFDnhtEJ7QRiH?=
 =?us-ascii?Q?cHB+2kVA8NY77BBqroL8Q8vVBGAoQOCdTHCbdM7o3RV/R6+r2QTQPFrmx90z?=
 =?us-ascii?Q?CqkRq6tEIj1/F7h4lt+QucDzA5Ft4L/yH7mNpb4CIbWG6/Wnjh5RCVfPGCqW?=
 =?us-ascii?Q?ogGyl6Uyruw/YYSQHv8XPIwrE/eP+Zww2oaWARU8uro+A38jLqlhYkAyz4g+?=
 =?us-ascii?Q?VUThvaqIV+2FBEBJVJ/TvYfBrekU4TCIJgPUGlmBhlcEQY14PsvOvmjO4Qx3?=
 =?us-ascii?Q?/2bS/yPfqkxhNmXqi15d5x/0UV54I5q32tLKalIMTREeHTW22guyANs+e71R?=
 =?us-ascii?Q?9+tKAU6AB1/ip1/avoRXuCh1IMsbrIir/DjPByi2e0C0bt3mQ4KsWyffDzJM?=
 =?us-ascii?Q?cndJtXRjYCk1Z/da6i+r3x8LLQMmnM2l7/8j3XBV3szhGOeHAHAEE/EgDYmY?=
 =?us-ascii?Q?FYCMVC5XmYaFnfonSrXR/uVr/F70UP3SQNp1EBtIEwprskh7aQZvICnEKbTp?=
 =?us-ascii?Q?2JJgqNrz/13eX8E8V4TfAVpCgn94A87abegsj6bP6dodbYNy9W/ayK2Ejifi?=
 =?us-ascii?Q?1DEU/g6oM2yRAM1H3t87lwJ2o+OiZPb8QSrVtNnaQ8n51Jm1F1+K2QMYL3rs?=
 =?us-ascii?Q?XC7+0Xe/DeA77q44M2IcNhYgJN2zpM36s/HNNTz+u45sjGuH70hymVUS4DNW?=
 =?us-ascii?Q?ACv4wMa5aKsvY3JDrVm68lbD2ZG/WimdnNaj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:26:33.5952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb6a0c9-930c-42d8-d2b4-08ddd38cd28d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8CAB220A1
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

The 'tag' parameter is passed by value and is not actually used after
being incremented, so remove the increment.  It's the function that calls
gm200_flcn_pio_imem_wr that is supposed to (and does) increment 'tag'.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index b7da3ab44c27..6a004c6e6742 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -103,7 +103,7 @@ gm200_flcn_pio_imem_wr_init(struct nvkm_falcon *falcon, u8 port, bool sec, u32 i
 static void
 gm200_flcn_pio_imem_wr(struct nvkm_falcon *falcon, u8 port, const u8 *img, int len, u16 tag)
 {
-	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag++);
+	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag);
 	while (len >= 4) {
 		nvkm_falcon_wr32(falcon, 0x184 + (port * 0x10), *(u32 *)img);
 		img += 4;
-- 
2.43.0

