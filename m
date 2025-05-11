Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233AAB2B46
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398C610E08A;
	Sun, 11 May 2025 21:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SuU4y6bG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56010E09F
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO7riYfVjgRYkmXuFnklxva/4VEY8PXDfiijQhzx+GNbgHJ4HDiFda2NYvu0I9CLSEw3UbRtqOpjtrbCq/TgivcdUbmYg+GN5zQEUjdaxyzM1SL+WzwygE07ysjJ+Rsp3VGk37p83EjcTPmlpLRzxmjI/KvjeBKJjNFF/Tr8vxtC8G6utR1fgx0YngikIwsE1rHXSuaP/iV/LYeJKgSG2hCF7RMgTOIo3Hev2ePVyeMIBBzLbBQGGzrVoP6T2DZeKH0u0uj3GQGUrjKXMHWtf6Wk8IdKb/EEJSPSOO41Wzf90KfJK4ajDq0+YmVCtc2ZZ9yFH+4OP05ENAtccVtItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFQYYClua75TJopiXEZ41vbN1I3mmQtxRLz06Tr94Dg=;
 b=HBnsOBkKHx/dJKkYdqpAU+geo5155VvjopqP3/KMk2Na8S8nmVdXW4uAp3RXCQgTkBh3QACdCF++duSI7TfdgB7dHUofIqWbFCCPK3GwknzRiB4tjwTnXcEoK+9DVXB5QYjlmcYA+K//1XPOQolLOHCGbPGePRpq9Ql4pyGdwDP1NlKr8XXAQPCPhUrCm/pkLMb2buR34DdDhZc5+ILqjlxV4jinwiPOkzazLmXETIDDfN52cDaOitnNTfhrVZi7pwu0qzuD2urSwa3J6Xl4VHd+9hryyyu6fA4+ui2oVSAb1IDTr7iuDjnonDY3Po6psAGzRCYfHgmvs1cJPBh40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 216.228.117.160)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=temperror action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFQYYClua75TJopiXEZ41vbN1I3mmQtxRLz06Tr94Dg=;
 b=SuU4y6bGtWncpViCfaMTo7qs2qWa5rpD13gxOAQqS9ArGvd/0IApmkbh/y/05/kobmfkdZpd+simV5ZBUzsL7sKBOTkXaxbmKjLsZUtH1XEkfSgn8Ih0m61TuApA65Nspsy0tpekpG/VQouGqD91K/LpCPZIp0kAUg1M63qC0rNgHu//RXexn9uVOtVxOj+wYAsvd7bsdL76l2Qcj5i6ipMPdl3/d0k9h0OPNgWPi81Gs7FhBRXpAW9IPRmynob4PALRJTL2ZxqSJ596V9k4hLACjBpQT8jhFxuD3CEJfcwz7rl3MkXM4WvoJYbceaFZ1eH0r860+jyXFMaV0mNy3w==
Received: from DM5PR07CA0058.namprd07.prod.outlook.com (2603:10b6:4:ad::23) by
 PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:17 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::f3) by DM5PR07CA0058.outlook.office365.com
 (2603:10b6:4:ad::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=nvidia.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nvidia.com: DNS Timeout)
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:05 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 03/62] drm/nouveau/nvenc: bump max instances to 4
Date: Mon, 12 May 2025 07:06:23 +1000
Message-ID: <20250511210722.80350-4-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: a910b4e5-00e4-4a43-1d83-08dd90cff27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C6BX8HB+NpAtasHwp01v+hRjSAGJdF/i0i/4KxF/znGmdXDeVPtJPz3WPsbK?=
 =?us-ascii?Q?awJPh0AiMhKTC6WfnQ13y9guH4hdym9Nhvsp3ETuR7qsZ+fYQK4J/zH+oqWu?=
 =?us-ascii?Q?jiB+FtxRXR1vHewwIT+Sk3CkC+o9sxVkl5+J0koDxTzUBN953vY/aie4Xijh?=
 =?us-ascii?Q?71yNmjznF8+5vIKTS6T8hNRu6LpjHHXCS+8UwhCa9k4uEppfMgMeXmT/gZaE?=
 =?us-ascii?Q?eanQk3OivZXPPQl9XONGBzmv29oVQ4TyqAtYzQsObIwAVApJ9EIN8eDSOMLd?=
 =?us-ascii?Q?YjT5P6Mb1BCLH18EONsuw4AjV3LmVrAWWUUTMNHcEqJkYSdvnTasbDMN0ZL+?=
 =?us-ascii?Q?lFGneYhoMPIHyUUEd9abViwdLENfmlyqT44Ua8R+qQwaksZgqmE5l2dA10qy?=
 =?us-ascii?Q?VjIfueBCJRW1J+zJ25oSgXz5yIfPdymgA0tuMDRIzvFmZBB7UulTuwZuRVFB?=
 =?us-ascii?Q?+VK4OiLMCs8TsRD8uxqH5Ai0gwgS00orr0QK7BN69gHaFz1zlbrg0vW2LhEo?=
 =?us-ascii?Q?4h09MS3HtQU/f5avdiq4qdg1AQ0jdaXoOCS8ePz2/pV1y1SxhNDPwxlCLgg7?=
 =?us-ascii?Q?7nxuBjQagNIjL5PFU4eWIhaRoggkRwQKMICQEBCuXrfHZPcMooz3fSFnsV8g?=
 =?us-ascii?Q?vSkSOIbC3z8DeS13vzEjsGzM5J19CUcpPVWuJxu+RmwEaq08cHXdycoEQ+/6?=
 =?us-ascii?Q?cyiS2U2GrnCzRqc2H6XZ8BLB7fBj8fBNTNkkFGKejIMjphXZY4qcOA26ramd?=
 =?us-ascii?Q?82EDsLgovAnEhf1xqK3gFgJahncZ15KdTRKeOGcpP+qiZUBJvBbCEnk5WOwF?=
 =?us-ascii?Q?Tvy/qdTUEgUxB1+TH+iQ/D3zDo+GIcZfBEUwbXcicDlt9yNq1eN1yc2BZ1Ut?=
 =?us-ascii?Q?jrEhArMcnDdddi/SblN754uuL+zoeqQVB21I7Zgb5C8MHpW+gfjSo1V+X9Qd?=
 =?us-ascii?Q?fuIyPSLaQ5rxTVpLoA/kTJSLK/4t7u3GvCBhA4fYL5HMs+WK9mSpfcWToZkU?=
 =?us-ascii?Q?rQj4iNMCBEyu9/bTwO8bOimw9GqIDk8z84YnZyr8P8DrEZcsamXOZp5EzEsL?=
 =?us-ascii?Q?+kzJo0U9Q641j6p80dAMa1fSiOlb8AGfhT2bJ8rn/IvbmhQRz4Mtv5EiJwhK?=
 =?us-ascii?Q?iCKgeu3WrCmHxhjH4GXByw48emJ19TWtWaIZj09VyGsywc9GTL6Djm9OecCf?=
 =?us-ascii?Q?OYFt3pxsNSj38bq8Mtyru2fuZR40mmrWXpJ04iAkUnHYjYP0fUOngyEqk3IO?=
 =?us-ascii?Q?hWTPsSMIQm8ejvfcw5qXTnZ2oOtf7KT8FGOxS17TLBsLSUYyIwRJb5o9aVmK?=
 =?us-ascii?Q?SZnDGqNmohgtKyUcRovvXdsbIJi2+EiOOOlGX9tj9f5RPRMFEGT1VXjPGMWz?=
 =?us-ascii?Q?AHxZ7XLW9IijR8Bjx7dJcGXWujQTPDel75xDUB5WCl794pN9Ymlah9jwbm9O?=
 =?us-ascii?Q?2t0AaewyQwOJACVqf6Cu4U7Be90Rgwfnc+Yf0GlesISTs3gmmRxkr7ooE7rO?=
 =?us-ascii?Q?Xy+gVLLZaMJNtWTnzThT2Fhq809paSIRcxw4?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:15.5649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a910b4e5-00e4-4a43-1d83-08dd90cff27b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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

570.86.16 supports more NVENC instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 4e027c5b00c3..33e3bc519b9b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -43,7 +43,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPDEC  , struct nvkm_engine  ,   mspdec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct nvkm_engine  ,    msppp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
-NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
+NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 4)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
-- 
2.49.0

