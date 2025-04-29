Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A77EAA3C6E
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961010E52C;
	Tue, 29 Apr 2025 23:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sc2wN6FA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892710E146
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5cQcNHfLpU48cva8fp/AtL5x4mK4Puu5jE+48T8E40PCYMfXNYCuDxXwe3yAGG1YZZgB/3X8PtwB4WGKtxUKrp1qdqP0CzKyEWp9FHjibvnw/x4ZX2R+08iiF5SCsVB36dUrczc3ASUMWubmKurIuriveqbG/MyHkVHzOsQFnGIr//3mgK7vWcJ0TAAr5Ftc1z8BhbdnhPQkmJMzIknvC5FBh6O1GzLCbt4VUvofGcGGdPwfb3kHwSDAXZf4v/Uq0h5ofrPs0XfMZth3VY0A5f/W+tHM2a0QVWo38VhCm6Lzn3E05Aj9ZRFVDqS82/MKuHVz0+3YDpbjC3uXAEbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDyB8MqHMrnYjSsfR3hXfizznOfdfg3sDLNiax2Ab8g=;
 b=p9a4zU+jhy4xvj1orE0pwAc+o0ZHNeXpkZtO0Nvys2hL4IrAXBBU1depElLr511ME3d9+h2bbO353FibWZsDkzGs9jmk3kJzmVARAm9xf7RaFGxD2Xs21xZURn0Wx3Dpe6N/IkqKWCHQB4X5v+alqsh41Xuz/VOd08AkMKGwYMdnVL5oTrIizpWO9sipyhAqKRqySZx/yesTkHBs7lkJWDlJSV5qxLf3Woh7hF3rl2oCwQnAXMywyeUJti/CJ/UOmNx/+d7HDijkbbSo1q2mrFooMQO40LH8Fq48fQrR2eea5BXrfzvSYdzOda0aHq+tfPas/lbk80H7to39zGZj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDyB8MqHMrnYjSsfR3hXfizznOfdfg3sDLNiax2Ab8g=;
 b=Sc2wN6FAj3SvT3GSFk08ZHggcUmWrNgku7bwZ19g6GGbTN0921j1bXoUbGWNifhj8t/enRtVPu4POzCubVFH+YP2lNcTQPon1IvRM1DaN9b/0ldoki6pNqfhA/AEgLYph4hZJKpjmsUTBBOjdzkTHO7q9zsjhUBoxIt9vXMfixilEsYzdIm+WGMS8piVxA92eNdaD/V7OLO7Yr+kO1AqMaeLkokp0i8+brW9NAi9hM4Lh2EseFv8SeaM1D/hAhsK0DQQudEFVXCXctLSvfFMuhZM9fbEwvl0k7BJV5t37qVdI5dPVlGVz682PdFLjFTyneosQvha8AM+kN704rxYng==
Received: from MW4PR04CA0346.namprd04.prod.outlook.com (2603:10b6:303:8a::21)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:39:56 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::df) by MW4PR04CA0346.outlook.office365.com
 (2603:10b6:303:8a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:39:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:44 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 04/60] drm/nouveau/ofa: bump max instances to 2
Date: Wed, 30 Apr 2025 09:38:32 +1000
Message-ID: <20250429233929.24363-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: d7788963-e731-4b7a-654b-08dd877725c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LohibkO0Py/+da1StMHSwzRfJOiJbnTCO5OJIngDbakgIOIPx4kM7mhG0+MZ?=
 =?us-ascii?Q?idlXx1tH09AbZXr7rhRyWGbnADVkAzfU4GhjH6bmcZvExkqhIRjKSVHjYeL/?=
 =?us-ascii?Q?JtxxXW8e0CNXWYjDUnKXENXAuZm0Y9uF3IUWylQJmm5o1kUpUIehEpR92OiG?=
 =?us-ascii?Q?+vgze02sjjG14IaYLJWarJGOdcKcwSchuPcUrusBd2/0KKejoLW54egTABJr?=
 =?us-ascii?Q?cQHf6MMKtMKi8wwIn52KfSWSDNTjwCIIY8loeAAsLK2u5t4dcdl1C7tdfj8k?=
 =?us-ascii?Q?4EGFXHLfThW2Od74pBeMnDaqKcs7SwokWAp3fAg+7JsvcmE9tGed0YuduKd3?=
 =?us-ascii?Q?jUnol3mvqNhB8r+CITjx/9JyHjzzfMGiSmKBfXbkMgbDnzJhRbpwObKYeyzp?=
 =?us-ascii?Q?RtJWU8SSmD3GL0kEHTX53K+d9PfqNmu2pn211cwk00qjarCNxfil57peYqSi?=
 =?us-ascii?Q?Ids8jUQ+qZ/YinPdCYZ0RjTI8sVtVN1e4rVGNCQftePoAoUzwYhjZOHRfxkf?=
 =?us-ascii?Q?ZT8F9nDngPLacUx5u8oig4fJEPBjWcTPR1kGpVTXaPNV3k7sqjfTcH5+lhUt?=
 =?us-ascii?Q?12jywSW+ll3xylUEQDfiKWiQYA596EDnAb+HbQlqNgWiegZZ63fv8WbccIrC?=
 =?us-ascii?Q?9eZs8SkBBhpIBDKgz3bGH+jXA/NYJTKRWQg3mO8Nf9ZZFT1VAuz+Qp/haJ1C?=
 =?us-ascii?Q?XSHCPn+y1I/9sySoGSeIn2sYtgAhfl9QKNzjdTTmdo/1bR99E/SzTQ5T6ZBy?=
 =?us-ascii?Q?8h3+OXCWzpFaDbO1jYhZfwOvMeU0we90LcyRethThUTD8GNsBYBEh0IcHlZV?=
 =?us-ascii?Q?lknwPx2CetHAJA3WjI2PiHgzcj4G+JjrFDbzIXrgto6ojCiw8fPTJMLELnzL?=
 =?us-ascii?Q?c0xs5QGA8axNb2fCQ2p2asDrYN1Ue7PRY0h4bNDB1ynsLmdsF6wluv5iNRpm?=
 =?us-ascii?Q?Tr7yZXirwuJbja7vwFWUBMjCYDfUIQSv2WmEKgimUeWcqlLUJFD3Gxy5UIXk?=
 =?us-ascii?Q?b/B8FSOSyVcM0NR4Tuv40Yv7uh8V1be2inRdGCu+5DFH9sDKO3hOr7JAw38e?=
 =?us-ascii?Q?qFlY+W/n/DgM/Hln0sGXNFwAvWhhsRWHbdslK46WBPagMyUA3qazkgA8hBdY?=
 =?us-ascii?Q?6M6QWasYVVRbdW2Yl7fBJWSNlWhgNsVy9ZIDUb6+gssqUx0+/ZFMunUj4bpp?=
 =?us-ascii?Q?tur/x+/xJ8EXnLMuOuwmftn9ojZfLJQrwdC398esHyoj8DEynb0Pa2Opbp3h?=
 =?us-ascii?Q?QOVcJCBIZIn/jupwaJ3/Z4TWrzRZbIXeauy6zh5tyBMg/uTOlCg0hLsbz9AF?=
 =?us-ascii?Q?vPW+xQZ4THNdcxvhQ6LqpZQ0aZg9hoYUcKo+FdnRQZ3iNIOJ3xJrFdRpy9Tz?=
 =?us-ascii?Q?/r97/B+FGsetUTiUOIvKhei10epeIu1L4dsdFKus3uEjeA+Eu/nEdYNYVk/y?=
 =?us-ascii?Q?CQ+qSrg/Y/TvF8e/zLbzlyFRRO3XJuHiuQkHeEP355XIvOtjB1auN7PT9zy9?=
 =?us-ascii?Q?BElzI0iDY3Y7Xe2gfDFCzcFzd996Oe66mThb?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:39:56.0484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7788963-e731-4b7a-654b-08dd877725c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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

