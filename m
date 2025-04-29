Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70365AA3C6F
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6B10E474;
	Tue, 29 Apr 2025 23:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBmzbTte";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF34D10E519
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO/M27ZurT8EgX4t5gMMSplPgHdhtZR6XB+UiL3P81HVXizc6EC09ztv1Zf1gSJvsdHY3SByrnPj5WeSk4wutWB67Xt+Y5FVBBWn2DvtEYPFLpgQPPZE7tq6HLFZPCXQWmImdRhRF3SykTDx5ie/GbWZ2e2+X8deb/htYm71BsGCef1y6dDNjJ4AcCR830lI0yRJAXG4GIOcmADldTpfLKhG5Z2eWccRMWQUQdH1J9JNSeXrcHtn1Ewu/ASy32TJBAnxJNW3+VRVP/imVtEZNkqW0f0S1NfHYCGzSLvko19snXwciUtE7C1wRMx34GG7bCTu1UPM9A8DdazxEMAkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WGrG+5m+kGiKBOI/D/Esn/ai9PJyjBotLo/PB6rRzs=;
 b=wq2zGQZ9JgbbAQ5ziKnJLY0H2W43ti4EmdWW5eomvgglklDMsxmz9mmHOQbk6yQ5kdxNHBrQxn32ou6QqnVX3lW+HtA+UANxVTobVxdQidXWrkR8C8lVgn9QenqgqcTLnN/QpHrZ1DPtFie2xI83vOFDwpFfx0cvuV9TJTZM3Qwjmb4Ua88tly/FomOzHbOOS4BzQCbwWYPO6pFeV5OIAMg3qNxLoBwvkw9haVZee4xrQYympaiDhT1NwxL74YnSzpy4GkekBsU2+kfX/y+bICQEoOKg93bCHeGQNa3rQphXqMlwb2WeILn+T6Vub1u6omDHemz+zRp7yRiwba+XVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WGrG+5m+kGiKBOI/D/Esn/ai9PJyjBotLo/PB6rRzs=;
 b=RBmzbTteyHk3PyU/aHFMUaRuP4ksQxvr3gc7S6PazeqsdVvOvRre/ziziBfZkx9aQCSqmYPL78BkigrLTGvGPphH25/T/Tw7qeQmz7pf0+Fj2oShj7QLCT3/M/AskQdTRyii7hhWP6rnlStPIf5Vxx8iT0PFvAiitgjAt4EUjxyEj3T554FNWnbQroHSNvxBJmJw8YkeJSiUC+IctHWcQuwMCTZFdKSD9NeRviyQ2mZYtg47Bz5Xnt+9AGT8nd6edHyAayVBLTltwAyHZ5ahMfFvkmEUbaKtji+cntjk5jtoGwxyvs8d5w4WnlTGRW9OC60u5eZ2zauow6hAbXcRuA==
Received: from MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15) by
 CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:39:55 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:907:0:cafe::92) by MW2PR16CA0002.outlook.office365.com
 (2603:10b6:907::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:39:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:41 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 02/60] drm/nouveau/ce: bump max instances to 20
Date: Wed, 30 Apr 2025 09:38:30 +1000
Message-ID: <20250429233929.24363-3-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 387a89d6-20cb-4ac7-bd20-08dd87772597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZO0D4smsZa4i5+wKJxI/C78pwWTIbej/8bozQrD8aD2L68wjv2/bISs6mqGC?=
 =?us-ascii?Q?Zw8NyDkTU5Cxx+7LvpDWrNDdfLjpUKOEyT2Lm3uNqinjdXF1LvPabC8yZIgE?=
 =?us-ascii?Q?jimpb+uzAcO/em/8jxRQ15N1RG9/Ft0w2viRVnlzn0HUpERNufqBb2aIViEl?=
 =?us-ascii?Q?VyTzvepotoqIauLWKaSGWBqqloTHZ5yYRCpG0Z+UUR+RuCT2itPjBEEy5Ch3?=
 =?us-ascii?Q?PaVBHuAsgxRJFF88AngV4BNFDgr2S0rsTVlwETnbmO6Alwa0avoaf2uEtXK5?=
 =?us-ascii?Q?INtKawjTMfb/Gl9KrCRCnPwPcOIMSHi1vXZSjGj9mBBZHBRCTVBLttevT1/1?=
 =?us-ascii?Q?b9E6ExmOWke1Ip9awXnQoEqMQha9IIlABy9NWngqBZdUMcgtqvI0HKLbHwhF?=
 =?us-ascii?Q?XSqL7CGfJ2ylW7KZJ2bPtyr9tEFuIBFHXEflakOc4vX6a5qcSnopnp6E/wvy?=
 =?us-ascii?Q?I9qanhWNkHAJ1A9uMqUDANmuG1khqntR17dZGPP3jwqw+Xzi196wohtoB23/?=
 =?us-ascii?Q?Cf894AXaQUp4E07+hWIS/uT+xwzAWeyfbF6fK+yxEy6TB08+W29GrZR3bEYE?=
 =?us-ascii?Q?haGPCXaAjSY1he7R1zHsPrj0TWI0svlFscwFEspOa8WGRl0kZBefGuNHtOgr?=
 =?us-ascii?Q?hkT8e6sGGSglUu+WNSt+7yQY8UYMF2DmcI1m8/pYZT1AOlH4rka+spF3BBwN?=
 =?us-ascii?Q?HG1DRUw/QTZxF/iIB3DF8fPpF1f38JNxSj24w9AmIgMWHdHc0namVB2WnWSM?=
 =?us-ascii?Q?iT/kbny/j/LvnjwgRuv3IiatRZN36SepPN32SKwXqVCR6b0cSn6KH444nCjy?=
 =?us-ascii?Q?Asogg3ifbaTN+c3APPJQHtQqP73o2e+dtlGBipols0Q04KBGJecslFiPm/X+?=
 =?us-ascii?Q?zkOI9YF8shjC2LrG0D9nALQmyZjNZ1jrTUM7cX8iYpKd7Ujz35zDUcl+ZVAW?=
 =?us-ascii?Q?pPLnirVazI+/AXq6UbcMUPhW+Z8lddvFC9l2dt8h0ooR6zno05ato6gwMA42?=
 =?us-ascii?Q?HbMER3sE9K9XyndO58vJG1EpiIpF5T3mbLcyTAFy5++YfHX52Yfxpd1EWZDu?=
 =?us-ascii?Q?oZ53uigM5lHxYDS3gkvva3T/aF2RCiXRAZ4R1Wxm8lmOMfetLXJPaJwhzaQn?=
 =?us-ascii?Q?rZwT+5OlhGN5iVrCVHclLGwge8lcZ0ag109g/8e3lab06n3cCT6j085eDxkd?=
 =?us-ascii?Q?rtG2c1BwyNv/sWMH9Oy4jXzob3MeJd4cmtnOIRhuUgm3Ak6+fpeA+0sgUcF1?=
 =?us-ascii?Q?xJEQlzBU0ByWAjAwiKVl/3YlKXNoJel2wCwxY3/96K2ZETU5Cfwew+UhUYh4?=
 =?us-ascii?Q?RB8a54VciRLdHEpJH9zerjCgHyKy+zV6fAZJtZw9uRdrs1TPsul/WB7rO1Q/?=
 =?us-ascii?Q?4eRO0K/Fg/ioVltm4kVhb8/gDnFXM4tg33XIVw9gymNPjeagYfxtTmgLZQJn?=
 =?us-ascii?Q?nnTvuSGU6xd+v9NtdzqaclG7C0j4gk1zleHdd6EE3BKm3HJ4eS2r4NK+LKJV?=
 =?us-ascii?Q?yze1t/7vBL7alXNcXO/4yKWRRd9/1AvUQniq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:39:55.6734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387a89d6-20cb-4ac7-bd20-08dd87772597
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305
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

560.28.03 supports more copy engine instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 9d2a1abf64f9..4e027c5b00c3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -29,7 +29,7 @@ NVKM_LAYOUT_INST(NVKM_SUBDEV_IOCTRL  , struct nvkm_subdev  ,   ioctrl, 3)
 NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FLA     , struct nvkm_subdev  ,      fla)
 
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_BSP     , struct nvkm_engine  ,      bsp)
-NVKM_LAYOUT_INST(NVKM_ENGINE_CE      , struct nvkm_engine  ,       ce, 10)
+NVKM_LAYOUT_INST(NVKM_ENGINE_CE      , struct nvkm_engine  ,       ce, 20)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_CIPHER  , struct nvkm_engine  ,   cipher)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_DISP    , struct nvkm_disp    ,     disp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_DMAOBJ  , struct nvkm_dma     ,      dma)
-- 
2.49.0

