Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98AABA6FE
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DED10EBA3;
	Sat, 17 May 2025 00:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jhacTZu2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DD10E10D
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcDteWmm08/n5Qpb0c2JiE8aUOKrU3n4N6i/zBteH1vbG7uNEhZ5jfhkZFc7B+QQIbRu7l28dpDkvpkc3FTq3+xM/Mk8FmNOa9bzsVWhRu3vrt0vlL18Ed8mNlssmfxEuFvB+XHVnfTbjLteKW9MdcgOw/y8Laa2zcxXs4/XE22BLP3gSeqr/SpXy0gtUnhWnfNc0UMyHAnpPlt4AexINBOk1Hq8eqL4f36bnwN3g5MmIURC61prB6VmPsSp/vhQzgiVKIwNBMpNWD2LknZkFi3gqF7yfZgGloFmN/9zEbQXW35+lNej7AqDunmy43SUDoYy7lWfLQsHS+nxZ+l8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KoiuivbyNhTQFkwjhZgRsdOMDHaf3W1+cLPk5thxpQ=;
 b=igGDNYeQkmqwywG6p0NpjN7TKPkFi957kKgG6qNN5onZ2MFRl/J9z2JAg83YGhl7hSKoHRHGAh/gHTcflNiUInX9x0yTICHLRGX8OO9TyX/cdPZXl5oTUKRVlBEz4FnTw6s7xrr+/uGfLRLsf7IEaUTYObN+VqR95YMde6r6G9Pxre1ugtaA3Gj5HsuyWN63aeEz/H1XM61cbz2Gwngh616+yX2qtgq+sth204ux4MqNtRRSZjsr4uGfB08apuyhdEXuNotcWuZBa13xoVwu1d5yfDEK64kMHUmuSLL151rnGtKC43Cgp1tlV22D4o8eJwLD7H1n611hAnlz+qu48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KoiuivbyNhTQFkwjhZgRsdOMDHaf3W1+cLPk5thxpQ=;
 b=jhacTZu2P4/+ZJCdrpa0gkVwZu4cxuEv9xU9UVjn64G9DUqa8XrUCo2YFCHQwslnxZTxvbnWXLeyymzDwA27EKEetrzNRQowXvLKJB0cJbDb0V0lDgmz5GZch/T6mC7s7OmO3+Av1rkDgUdwTkeY6g37NXr9rh8J4kfpZjGTeBCFc2N4RHNWHGzrLvBJqhQTl1pM6hZROEsQOIrl5mqjOqhElP7/sXvbdh6aJkIkNMAAcBq7WT5xJer1lPhJSwwGPBxou3J4J0xE9W643VQ59qnbz+XOuqg2v/WKLVkZf3+2PRk6rb7bv8cEDZGUZbt0AT1NU0H2XdPgY9ZR2Jxp/g==
Received: from CH0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:610:119::19)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:10:30 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::b8) by CH0PR03CA0371.outlook.office365.com
 (2603:10b6:610:119::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Sat,
 17 May 2025 00:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:15 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 05/62] drm/nouveau/ofa: bump max instances to 2
Date: Sat, 17 May 2025 10:08:57 +1000
Message-ID: <20250517000954.35691-6-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: b77c1b09-de84-463c-f0f5-08dd94d73b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MWhjOeIAOwipLGiwVdMS41u+hl1FMXE3KuZMvnSp6R3csraD9mww/n9jcuMI?=
 =?us-ascii?Q?SmX17YSjMOxUVMYO2xaSgipQxGC++7P+NsDeHJcjjHY+te/Ju5oANT+Kmj5/?=
 =?us-ascii?Q?zTeDa/dZ4JpV9m5v36E/ksZuhbftd2w65JnmeEbL9MHqQgCPxKR9IWuru4Jr?=
 =?us-ascii?Q?oi8HnTroPkvkChbXwIe8pindFsQRtxmM51dwqKVk00aqJeJypW6RRjoOv++J?=
 =?us-ascii?Q?GLgIwWByZ5mscN/Z2rJIoKU4TieF0R04NU85WC7omAizAL00RownPkpiVq/z?=
 =?us-ascii?Q?RxuOvo4BTdLJvDmCx3Im+9gflv24zEVseOPPKmXxyt1IiHddk+V3u3BuWBzP?=
 =?us-ascii?Q?QQi/+QgZbbU5b2fycygxfFGUhIfuEahQ6BpLhQOlB8bhDKEsoVvxBQao7HVE?=
 =?us-ascii?Q?nvdcrPzKy1J1SjxGL/s1SnRffIUAJk0KPWx9Hb3uwoFNmv9o8Sbjnh//BJQs?=
 =?us-ascii?Q?l2X/466JbvrQQkdxcYSyOIYV/XkZAjsQhdIzbbqDV5Fa5gf3bBFavHSakj70?=
 =?us-ascii?Q?WdMbjxB+jiPms+DaB60YRa+JGhzWLwqhHVHZfkK9mvGbztOMgun987miN3Go?=
 =?us-ascii?Q?pGIKbS7KCTzBlYSYO8sfD2wkqV13nNidlnwh0KpHiEdvVztadlyahpk5dKbB?=
 =?us-ascii?Q?0HZIOApOq0aRvNq8+hHkqkWFjej8QVZJ6kTAQSZLXmybLMHi2A229Dwfv2My?=
 =?us-ascii?Q?Jb2e7J5cIRNZqNjhXnZBa3Ztamwm0JPIadZ3hRJYHp30p0qX8uOdc37dhbfk?=
 =?us-ascii?Q?k1y7kEABpD8/khN4aupIjRocykvpdWs+V3jmuVzV+L51hQh/Vp69ay4+e5jZ?=
 =?us-ascii?Q?JwMZ4KT3UWf4kYDRqhzLHC3lTLvIahki4ILJxTJPwp58wiO/sjh/t3plR6Zo?=
 =?us-ascii?Q?WCrowXg+uHmnGQxmriDMXe2CMCWjd1KMLEiNK8kPuZhO1VJ0m7VPCNeSKaQ2?=
 =?us-ascii?Q?CHi+L4wSVDN5Z0MGRdz9ip54bjh/+V0t5yX41zdx7Cn6sY8xY2VyTYAkdaHt?=
 =?us-ascii?Q?S5cZkR98Pr4jOPqsvr0lTTV18Pw4BAYOos0ajJwbF5PVVIAfKoNfAjklWtFE?=
 =?us-ascii?Q?jx8O9MgW5ahfY0o426YQtZ2Ixy+4SMi4cjSslHP/bEk1bxywFeJ+4GtV5sYN?=
 =?us-ascii?Q?05oNsd/HtuBwZxlaMycnxghizGF+cFg5yN6SXWdHmegFLgD2Q/YFGO1eoWvb?=
 =?us-ascii?Q?Mw89+nMk7r090zQNOXq0cgYCKk97h1d0xkF5DTFG145kJrRNOUx4VlZEHQVJ?=
 =?us-ascii?Q?WFOOHULkCa4SOkr3pWrxHEq3JvYwPRZ3MawvGFIwwhE2+Vm6VXputFMch/8w?=
 =?us-ascii?Q?MwV3+ShFEQUR9CSKg6BhvjG1uw7Rxm3D6G7taPr2zNJdKFZ9RtWN6dsIFp/6?=
 =?us-ascii?Q?90+/EbvVAWpHS4PnOGzUAcJukRx9wX3fcoVkav9RAmTKBSvNt0RpCJ0uLobJ?=
 =?us-ascii?Q?CeWdgJ4KN8IXiOVaTeZoQ1Ah+Q269m4zIXiovC79DMcspHf6HBuEWLXxgFXl?=
 =?us-ascii?Q?zuetizhD4QkAJFa1Ob2+DDayVTRzS2Ajfhxr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:29.3401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b77c1b09-de84-463c-f0f5-08dd94d73b93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
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

560.28.03 supports more NVENC instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 33e3bc519b9b..2debef27bd95 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -45,7 +45,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 4)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
-NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
+NVKM_LAYOUT_INST(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa, 2)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC2    , struct nvkm_sec2    ,     sec2)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SW      , struct nvkm_sw      ,       sw)
-- 
2.49.0

