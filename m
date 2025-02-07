Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BDA2CAA3
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714710EB97;
	Fri,  7 Feb 2025 17:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NXyy/004";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126F410EB90
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtMmUdf27k+nVcKfrRjkaE1GWIevPXEQGYOFhthC0QcLyl6ykrARQJdgBw/hFBdCyxqvZm7rHnGsOXuHdBLHzLnQ5Nv6eT08Skls7YTJu8jquRguBWIPTFipoHfc2xZrepZaGSELtrL6yCXKXI61ZASzwUvB+r79+ueOPh38FBeVYJ9JDMPDcJuAKiobmq2RCoGjERasL7KsJIRHcigI3UvLFPWIQI201+HDGyOjHO7vFJ62kfeOugI3Ywc0WCQRFy9G4qOlQYUYvNnICMNdH5ygl5Co7bIqa0wh1P54dnyyxYq46n0tIDkpQO0b8Ah62vLjL6fwtIaD+C931hvhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dSfxvdAgXghps/buz/9l1IqVMy3owgH3ti8yy5SUNg=;
 b=aV282Qa5ogOSoPXFhuoyffJUBD9nMbyEeq/eBOgDsUfoN2jSSbWFoZvlGNNc6S/eATZYCfHZI/5aK0zb2++F3JYLZH6atlzlvbY2JftuhfpRGCKzyoOQbtP9psuG/jJcc7SXQqBN/gOBnbL+faairXB8p8gcHlgzQHGMZIi+apTYNp3s3gduqlt2AXT3DtMjXMf0Nm8uo8T5dbM1LNUL9k04mhraaU12v4SjGiVijlQJT4iYGeinps1DGVom+yoldQby76IDvXXnNWsbJeI6LZVxhS/T42qT9ghPlnu5HDSkixiGdx3j9K6IzPlJAD9K4Zbrlhg2mHie/ZFHH25M2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dSfxvdAgXghps/buz/9l1IqVMy3owgH3ti8yy5SUNg=;
 b=NXyy/004gXkq40cSqARStA9kHWqxCnuVTi+gY1SXBJkmoEga643S/E/8CORZuI3MLENOf94QB0zQuMhDsuSJ8i3zXAYGhPxpdLI3+mFLTnuY6qyPSihLP1RvfrvtBPSKKd4p/CCfnDQC/upVRVZEe3NOnmUeLXaPaRuEteZ3MK/1DurLplbBqfHb3NEZ3V4f34rRGeH+pDOFeGDKRboreKUhDDoP4kZo/7cBXIOb+lQt3pSwU/9Q+zi+kH0Zxjl66xMQEqIwv93h150sIz2MYs7FvRtlLlB19GbXYek9Mhfqbytkg9EIem/45DErwEouPVcF+Ym9kxvB3J8iLyy/zw==
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 17:58:39 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::92) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 17:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:22 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:22 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:22 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 5/5] drm/nouveau/nvkm: introduce a kernel doc for GSP message
 handling
Date: Fri, 7 Feb 2025 17:58:06 +0000
Message-ID: <20250207175806.78051-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|LV8PR12MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8df42d-1331-4ae5-e2d2-08dd47a10c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?14FDfuW8QeFQRQxoBa+LlXsUm1CSH29/9KL1pNzNjms7xB+LAV0yVKQ/y/iy?=
 =?us-ascii?Q?IWYg+tlRZqfdGsGB3x6PYxR5Ru47g1x+sp7SzZnKBWjJztON/hkdeb9iEaIm?=
 =?us-ascii?Q?EMse6gETdqOyh4lICZAHy6tHY0VfPR6kPfZP1OJ/OSGRBBRj3mi9QR0R67WB?=
 =?us-ascii?Q?QkjrnfQukbHBdT/ICEEBNYaVYHgXWNY9NQHVKOiQP5Fzhd/GJ/VwNOOOZT5P?=
 =?us-ascii?Q?23IQCfDCLeNNs4nP9zzcVCNUPAY61LukswfXpHjUUUL42topVgQzo3LaHY9r?=
 =?us-ascii?Q?FACtx7ikRc0hEBSDkqm7xQIk+CScq6bX+KchglWiiijTue3bK35G7omiJaXa?=
 =?us-ascii?Q?nKqI60iXCuiioxgZ3/RqVB1j4MBKrhNKBBIWFG5XkPQ/ER4vlWCKRzomesUU?=
 =?us-ascii?Q?+LNfsxlvwLtmWmznxwhdAP2fuI0+MHEtLAjJtZ9A49dPpP8VmYutP5i9+cFz?=
 =?us-ascii?Q?wZRzfg5uvkymbQ/9xxrvhe43BfvDp8y2sD1SVDet8RUAxomXqqE/sqg4MrBI?=
 =?us-ascii?Q?q4/t0zYkIzAJi5htT2ldU+a3+0N6NiHHwSMmQQp6dZyEkPBc95pu0beUE6Xh?=
 =?us-ascii?Q?vue8fJg5pt/OpMlQyj55kUNLZNNz4F5WOk17ZfNNtFJxDggNuJcv6eyMlr6X?=
 =?us-ascii?Q?GUSwRmYwi9PXPgVjbhHXvflSyGAWHYlGPIspZ0mugksXkqmRxB/3pLdh9YaI?=
 =?us-ascii?Q?XSyH7ZM1DabQCMnRh4XGJaBrABWHFWoIfF/e9kGWZhKgWKRq8/yZ4a3g7HGy?=
 =?us-ascii?Q?mHn+kQLsybmRAKJVXzPbeDyh73niwMObbolGK/8cmcDyHygXEQDapnSzHDit?=
 =?us-ascii?Q?39DobrLEp4iwn8bg82tw53ggmh41fMWDQKkuMQNWaSrof9QcPZA/mI/pMaXE?=
 =?us-ascii?Q?EqzBC9Ty4hSgb9xuPD9XbROguqPPQ1iRwGZLga6RdW5RmJg384AcMUwEvdSF?=
 =?us-ascii?Q?82VBUibfCnMpm1ALU4eD9G+veTcMHvrKmbf14ItCBtEU6WKl7YvdaEmxmENT?=
 =?us-ascii?Q?FJYWmCftLsoy2Mqr0siThsdzGFOTdL9juPuFh4kYKUwjFPvwfaEZGmTlbrmN?=
 =?us-ascii?Q?Olmhby20qBHGSN1E+gL1z34GjVkj+b8hFn3YQUAXNf6Ixo3wk+nsBOSR2acs?=
 =?us-ascii?Q?S+Namr2akWeQAV/qhIUM3nliH2hScy+kuyc9IBEH8gCCWMyWHOet4+5qKyxT?=
 =?us-ascii?Q?DGQWOv7sLfiPlIHecS4FKipI+dMT82P7nnNHPdK1oaT7/qv+Pe80OiH+e+lH?=
 =?us-ascii?Q?kur7Nsg+U/P4WA2+G0SobVxk5sGyu0x1E/dphYzaXHPDhbdPKtHJgfBs3BOR?=
 =?us-ascii?Q?273Z3F2o49R90ZT6n1UVRZH1z4g4i6knca9/rHCYRbLhKPfzDzM/9j0heSG3?=
 =?us-ascii?Q?05WfIZsKJrRs5goNHKtXPVcPAyYNS9GguNvvF4QGeHLk+VFJyqAd/PEUyIOB?=
 =?us-ascii?Q?/eoW8QJ7MhpGqyrNIirXeDxBi4VPJZ6sOrcxHpuVXQG9Fz/mNvqFhzsTw+yb?=
 =?us-ascii?Q?CwNrTFO7xSZQNRQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:38.2168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8df42d-1331-4ae5-e2d2-08dd47a10c9a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
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

Introduce a kernel doc to describe the GSP message handling policy.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nouveau.rst                   |  3 +++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h   | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index 0f34131ccc27..b8c801e0068c 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -27,3 +27,6 @@ GSP Support
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
    :doc: GSP message queue element
+
+.. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+   :doc: GSP message handling policy
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index bc16510261b8..2d0b80a733d7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -31,6 +31,23 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
 struct nvkm_gsp_event;
 typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
 
+/**
+ * DOC: GSP message handling policy
+ *
+ * When sending a GSP RPC command, there can be multiple cases of handling
+ * the GSP RPC messages, which are the reply of GSP RPC commands, according
+ * to the requirement of the callers and the nature of the GSP RPC commands.
+ *
+ * If none is specified, the policy is the callers don't care. Immediately
+ * return to the caller after the GSP RPC command is issued.
+ *
+ * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire GSP
+ * RPC message after the GSP RPC command is issued.
+ *
+ * NVKM_GSP_RPC_REPLY_POLL - If specified, wait for the specific reply and
+ * discard the reply before returning to the caller.
+ *
+ */
 enum {
 	NVKM_GSP_RPC_REPLY_RECV = 1,
 	NVKM_GSP_RPC_REPLY_POLL,
-- 
2.43.5

