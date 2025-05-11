Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F5AB2B4A
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9010E098;
	Sun, 11 May 2025 21:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gS9gCstX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9210E097
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKDUvS4NMJ/KrkspxDFzG4dL5M4cITXkrOecyslw5iL3HsQzVudjUIVG/IJIe/dNCknb5APzkqAUeAU86cYV1k0sGPkbVdQH8shBsfxbByxobduSPzAUXhrR2WCs86pI2Q2J3rzfrUNZZzxQAAyPkTWeXfMtXGjQr2d7PvpEB6tSv/R3hkMwvj9KS1aUrhxvFwpOz7HMsuDGYVw4b8pekdzmKXRn5KFH+B8PT7IPv+CDCcyK8gp/ArqzZzFow+WiPDaNS3vJ26WTQyi643TOuq1mes1ilFt/nV8yDAU3MAtYc2PFrPK8jbaAc3Lo/44HGzTPHNcS4Tv7XYY1+tiY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1epugEAI3b8Y1JiOUOXEXGMeAoy6+p7jK/7HONH0ZY=;
 b=W1pDfoccOanNq8YzBO8/YBIeMQm6HYwWUTepEHTY3M7vZB81fbceNINwyfrOg8ixKKIkbHrxo9VvY7ViI/QoI9dAQFM8icaYIcixoQjNpNlJhZZ1MXOavXAOZNQk3QZ/ixbnUZIowk2oZp+oX1rFDrWWDKnjskuBHgtY6Ksfzb0OEtFtfP9HFVbviufrcL3e0dIa/eOGZvt8ICnOaQOjwC4MRmCLHe2qnU0iM/331r7OLxMFZ3+dPSruQYgco6W2D+JCMBTvHqB4XJz095sDAxFn3H5BAyYGMq3heX49TqtRhIDs1zcOfw5oUJhjPTpyHrgRcXQ1CXT6ZeiPJX9ToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1epugEAI3b8Y1JiOUOXEXGMeAoy6+p7jK/7HONH0ZY=;
 b=gS9gCstX+Yka5x0fuaZ1b3Q8zbHQfriDfq8XbAX81RGbEzXkY+OTMns1pa+bsYQb5LMmZdbt/B55DdNFDsbNUJSou3u/AqP+ubtmOVFkc68ItocJL1i/L/iGTgk3cp5+QMwLTQjOdL39jtqW6Ra0eyWWAtoGMOeJFaWJBCYkzFzdPXZmjsYD/z0kTt6ThInR5qsc8lgVXEJ5+bKApiSLsosK6RF4kLtMPW5fTcn49eDEUqWk6ELAbsnZ7B3xDMT+tMnZJRMhBxXv43GPOK1e1Gdy0WcRGu9Yd9U9zehJCZTXLtvvEav+BY4DnvgHQaf+ZHYKAjaPnxWVZR056IfxMQ==
Received: from DS7PR03CA0360.namprd03.prod.outlook.com (2603:10b6:8:55::33) by
 CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:08:13 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::2e) by DS7PR03CA0360.outlook.office365.com
 (2603:10b6:8:55::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:03 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 02/62] drm/nouveau/ce: bump max instances to 20
Date: Mon, 12 May 2025 07:06:22 +1000
Message-ID: <20250511210722.80350-3-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ba259b-3035-45b0-45e4-08dd90cff10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HTFtAoYhkQZRrUfBdZmKvi3e1uMmZ7aQZJ2/cJetl7Wc1UG08dEtV3+6XVcL?=
 =?us-ascii?Q?CnZguxqdsRaHvN+DlKb0bN/TNN/KwHmnqw0vqCEBRHrpR9zdODhHIgZvxUJ9?=
 =?us-ascii?Q?oWgiMh0a10lVsVsMgKBGZENJ6z/HGcpFv/xhGkt+3XZSxWIaqeY9AVIKgINC?=
 =?us-ascii?Q?p2gxOOVZotfEedV9yWgfG9Mc1r0TbORya0uyjm0ghgowoh0600SLhEon4AGN?=
 =?us-ascii?Q?edFb5vrXYM5PSQhBGwaSIc4WIiGwzTsf5U7Ze6HtmrsSO3xz3u2mi1kaMa5G?=
 =?us-ascii?Q?zQZZpvpyLL4S1EiU/AA2PHzICx0jruNeJnx/MY7BqP9/lbOS5rntNXyaOnBM?=
 =?us-ascii?Q?1/4CxoQNyfBMpYqxbXDFqzlNphgr2TjqIK4TWeKYm24SWOjVxa1Km4ktbnpl?=
 =?us-ascii?Q?lxT3Pk/KnoLeiTsy4MCj2v9PEhIMEQDQ3V8yN+Uz/TwKNqNH97D88tXOarMp?=
 =?us-ascii?Q?U6DzRcM9JMpJydu+mRP9Z+8Tvw1iaLSkTBFlIYiWawjHU0musPAkSVoAcxKR?=
 =?us-ascii?Q?FSsbxZxzXJEBazr1NXekt4kKKT/5oJaoMHqqvobg8LqInmn0OIZDUEiw0yhV?=
 =?us-ascii?Q?M+BEIN9Alz5tuseMQMD3tCox+F/yYJiPjGcZ+AjQYJTb+Bl3UCBP1SPL3UK2?=
 =?us-ascii?Q?kaj+8ITsbaNETOBSfaKlnSp+5D9W6OnUpsxhNR7Y2UTByAg0DkNJ6Ivg8nV0?=
 =?us-ascii?Q?0c48CEtaZDHbHhInQ8iPm/XzHZBrxNJkAUWk5xkbiCrsVM0HkmcJf+BXMFa0?=
 =?us-ascii?Q?p77PA8BVgzSGZw3XX+K6LVyN4NIX0ZbLJUghRgWI/ozgF3qW9NWD3q1pb9hH?=
 =?us-ascii?Q?mnnTec6I8FzE/xZFpkPhdVE7fG4/ctm/sUZ/2FVNsTIPvuHDEm1bUPt2rEVi?=
 =?us-ascii?Q?wpOKytJLbYLm/MQIKF3fb5VNiROLbIMzGFy5TK1NPfEBzLHvcEsmsP5Jadb9?=
 =?us-ascii?Q?MAEMuEfEb7ca/VHUX4cyGSMs2Thsv/MzXT9oRIAW7SXj/QFiYS6CA3+l26H+?=
 =?us-ascii?Q?jUPhYPgpBVoSRX1W8znrb5BYGFzpwLiUp+GuWKlgoBGANjdXyHGLZRVBeHwz?=
 =?us-ascii?Q?RbBKVevAjx0Mwz8Y1Z38a76lh1YgcXIqCzB1XVm9b8fM1/o6RIVbJOQujCjj?=
 =?us-ascii?Q?kVQWymIAqbUDRsr8Q7f4sjKVuc3e8ISFHtpVHDVeX/IK215GyKsrvHXYv4Qm?=
 =?us-ascii?Q?y2PSHlLhq5e6U/r+JsFI6+FSE6abmRJbIPe2wc4kUsXD7NAdk65utypqHqob?=
 =?us-ascii?Q?ONsqQQ8/Cu4KcEzXsMiONV1be8lTSc9SZgR9o+8NcPWcQsoJ9bOGqpYqeb7V?=
 =?us-ascii?Q?PA7s+UEZNGW+NVEU65fuULDshYliD2eYcwbgLG3P/D2YGGWKinzcaeiG7hAY?=
 =?us-ascii?Q?ZgSocTXo44kHczdrppknI7sampG/HqIQ0mhxkfnjb/TQ8WnayhZ9ASV8KPNp?=
 =?us-ascii?Q?xMG19lIFWlwx5KfOZMISXv2J+BU7mG3k9v6FC/sA2n5OS6XA9zDx5Ysfm/kb?=
 =?us-ascii?Q?jY7AuERRUL0NKg5EjN9k/mwA3ptYINMDk9SQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:13.1847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ba259b-3035-45b0-45e4-08dd90cff10e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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

