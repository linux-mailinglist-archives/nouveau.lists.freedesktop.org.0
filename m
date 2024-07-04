Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9A92AD5A
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22210E466;
	Tue,  9 Jul 2024 00:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kCNE1ipU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59910E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsYtogJvyVnEjs9sBp7TyWf+DPYLGEKOrOnw3CYnlholzqTBp0zAJA4UvPbGxrgneFuzKwlmUhzMOPUzTlYdcgXjP+IaKRD+BxHvKEzLMZn4u6gcwB6PWqCYKARRaHhs1ltJQYYAoRDDPsL72SxFhsnu+Zn/Z5ym+rQFHR0iNV9PXWH8+L/Y19x//Vrox/PIFPrMDMW/qn7vZ4+uWiqG2mOcg27vbOtlcx343UI6t2QoxwFku/28ioFLaLnZ9wlABq2Ax7q2nCoE2PoBlMkqToms0Z6Ka1IsDj1tJQOxOt2YqFesff9o2DkxOFs4OQV2O7OMHMuUmOetiB7bqEHDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7EdDI3hc+P38Y4y+qdUQHKoBCVqGn8o9cmJgKL5vgc=;
 b=NvyTer/S13G0ciuyIpON8kdpofbEyokYSlnGr/tyoVs5pKUSYZ63reMKkIdpNRx8UAsSUy/JyDKOZ01URZ99zhAqVvRmncGF6DxONXWKV/R+uQsNdUQGJBlOYSg1zsO+N8Fmc7dY7KepxkB+FjkdiEhyBbC+ezX1u9SFP9RJb8/Mi3UDwZvTyugoycUczHBaGa46ZT2aFpUxED3drOrHqOFFBVm0Pzj9WZIRQntecXOebaYgSKiXttPnH3PrCvamE/IbEqfGV0MIoQiyneEjUFvwM/rGdmBV7wtXIICYyJ7v9fGom5KWet6lwpz1aIxiRPmcIZEFU5XIQ6fU0kMY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7EdDI3hc+P38Y4y+qdUQHKoBCVqGn8o9cmJgKL5vgc=;
 b=kCNE1ipUnYQE/RFCXmYrnEVXzSMMihwzi3u8MVYxbcjAw7BEWe1sokhu/URdjUjT62bwcqOLHEDys5owSc2dLeRsmF8W2o3ca3czPyCcXJE7fEM9UBtrgkoaI+iTCQSwm46UNTKi6Pb61JYnC+V3cTFgNjH8z6DzHAZjFYl0Scjiu2tQOiw2pt4hybk6hFCR1TD8JXlGVD7AYBZqKcLMuQBx/1tQWA9XZ7bqFLaNB1/IABsZraN5MKexdtCkU5BU2VarHPWQXzVmbyuW4HLKgzAnbHlJ0fKmh7vEOTEKZGFurJQT85O/KcIGUI9MIouzY4y9TUmqtZKWaBlB4lALIw==
Received: from CH2PR14CA0011.namprd14.prod.outlook.com (2603:10b6:610:60::21)
 by PH0PR12MB7905.namprd12.prod.outlook.com (2603:10b6:510:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:28 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::54) by CH2PR14CA0011.outlook.office365.com
 (2603:10b6:610:60::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:17 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 22/37] drm/nouveau/nvif: remove client fini
Date: Fri, 5 Jul 2024 04:37:06 +1000
Message-ID: <20240704183721.25778-23-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|PH0PR12MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: cda6bdc1-c69d-49fb-4455-08dc9fb1d329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xW3ZZouNM1iCe3mpvb8YttzTTnYMLqr9EfAqPD8QSFHQDtMpzwffJEKx51So?=
 =?us-ascii?Q?fwdP1PWSni7xeSsc6r1n1epxmSeOreM7lAu83FhJVny0TmLk3mhgFvGhQR5y?=
 =?us-ascii?Q?MNuMcHlbmjGnFpa9KEBRLt7Ik5txyubGBS5OukyLn+UfziOkWHD67ueezo5w?=
 =?us-ascii?Q?wXOEkci4HmxGDL2fFz71sbxY145ZjaWF6cSA7E0DbK+/etsarW2br9xCyPrv?=
 =?us-ascii?Q?gDHaeYjuscgPvGgH+juSvoiUs3pwlCaDlybELP+wPld3II2kfMoSyHgkq+oi?=
 =?us-ascii?Q?bSY/ktUtx/MPyycK6SmSeK7ez4fOYQXBlV9xXimlDAyl6FGyxtN5Edi7HHy5?=
 =?us-ascii?Q?IUG/El4xGolTe9uxtyn77BW104Ux/ppqAR9Tpu0xFUbX5opPcWeaebZjvpWS?=
 =?us-ascii?Q?kfpkVe/tX+3EcZV1WY06lRPY0f/XP1gz1UBiQdcWiVIODoeYTYBG1AIELHIb?=
 =?us-ascii?Q?RMpMEE0DEvjMI274qT508ccU18bo1moabOpGjQtRw8QPDGdnzonzauThXsyX?=
 =?us-ascii?Q?Y1etAdRrfFQi+8vifBbqPnazpWPTymVmtF3nCysZa/SGu5uwe+bl0ow/puuE?=
 =?us-ascii?Q?Z50hXrgRpGBN0bhnSSt+2Rpy3xFl8eGEqDKpq9tFnTeoAsY87yQHu0DlebUW?=
 =?us-ascii?Q?VnxVYNxLlXTHpM2E7VZICTEFLiPmlFNfa/EeKtWRVm98fXeZuwcR07hubPEN?=
 =?us-ascii?Q?DXKyrkLnu01AfRjaFyPoAFiCCy0a8XAcoUAQYwlNy40MD4jFc918/u7UnbGe?=
 =?us-ascii?Q?9UyOWddVcSQd2TSmjL8KSmkd08zDXVNoicGY5/C9FW6xLAEUEu/ICMtv76Lu?=
 =?us-ascii?Q?rtv6AQdlCQKOX7iqbzWhLE2jSE6yzqIQP9p6Q8JaCVaBTk7CUweNPx11nw9f?=
 =?us-ascii?Q?wv1a/RTIj1dWT1CAwkDN+FAq65mWUfp7OnfRYM2CUNmRr2bzBEhFgjM+zRLC?=
 =?us-ascii?Q?7FcozHedHijEzbmLAEsSkprNAR1aQJXTjwuAyeln+i0tKGzCyjUCFbVumHp6?=
 =?us-ascii?Q?kAfF/GyVVYk/aiwOXK+AmuEa5K11//SgwOjv4rVA30nOh9n6aLfVKCPcDBol?=
 =?us-ascii?Q?1/BH9n5jaxWOZ3Dfq19sVhf3DmOxZw2Pwfb98+feqhL4v+UQ64XciSot0+zL?=
 =?us-ascii?Q?BC4DmuGFslOGpCCpfT3YbOu9lFTk+v5gcOd4z7VP3tEY1jMlW2l0ryU3ykur?=
 =?us-ascii?Q?hsgUthu5vMP9Hq0Q0ZWs/vrV7WwoN1OgYSfzpKuzqn6vyo1eh3PkUMUWi4w3?=
 =?us-ascii?Q?XNVS149IE13eOpyjrwcPGlGD0pFVULpHBwdhrtHuwgTVH0jY4yaWI7qNMfJO?=
 =?us-ascii?Q?4fShoMEbAXsyDVta5DsNZ75xk2/X4xGQdSKSxz1ELbIWZQKqThjxqfKDsS/u?=
 =?us-ascii?Q?djYmNftA4rD4/fzO4TuE4KFgOMJt8SqLVd9x4fRuQUXRkK1szcLB0VtMlAbY?=
 =?us-ascii?Q?rN6piKKF3uIT2UyQ/+FuC+fPpYkT6G3O?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:27.9398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cda6bdc1-c69d-49fb-4455-08dc9fb1d329
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7905
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

Does nothing.  Remove it.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/client.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 5c87146b8508..72c88db627a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -90,12 +90,6 @@ nvkm_client_child_get(struct nvkm_object *object, int index,
 	return 0;
 }
 
-static int
-nvkm_client_fini(struct nvkm_object *object, bool suspend)
-{
-	return 0;
-}
-
 static void *
 nvkm_client_dtor(struct nvkm_object *object)
 {
@@ -105,7 +99,6 @@ nvkm_client_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
-	.fini = nvkm_client_fini,
 	.sclass = nvkm_client_child_get,
 };
 
-- 
2.45.1

