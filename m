Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDE92AD4A
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA810E321;
	Tue,  9 Jul 2024 00:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tj79i9dA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CEE10E321
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvw2/e0dzxlmbk/qbIciJwTScDn3N0LLPuafkZMPRm8yp6HESnz740GoN3av3ZoEo6mJ1LP0on1f7sBfTS1gabPmlTq8ge+jKl02GIApzaXKQxJE+HO9JY3TkWRk3eEgkgWRwlrOcsB65a642oW/fYEqpjyuyH2xGeBRqVoJP+4/8umASV6BMQXLtchXL+YkPMoILOY5A6qDcY2YFGubVqtYuhkKBu5Ai7PJc299EsjbGj/i5rBj6zwV91Xe/5dp4lv5e6Sbhv8ExxcRB4TbE2rVv1JFFuH/ACvABayfamROnPo3EYibCVh0lndWGCuNW1PfRx39kAebC4QcN4m31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SNvodKsCEkV5jwtISy1FahPNjX3uEVzAExwQBkoFpg=;
 b=YCKSaSMrhZykUwxME4LksEWL4SQHa1wGgV/EUJJX/qarZ7Y4QbnbpkzKB2UrGSv+wIx7Bypmh1obhs/MZDChJNlf+GgvNbsU4rd9MkVYSxlZzMwsux6Mf0Kym9AseJAqhE288eaBXVB2SOPCaLohxdQhddrPZUJcOTn52wbUGYheJsJw+9jx/Xg9hwwC/bK40cDvnDnSIJ01zNScL7viQ3Tgf1qUdjDwvFAHct3jVYrEQzKlkJW+GCV4sT5fVDTAl1BuNdi2chA0P0wbLUpC3D81q+evinNeyEET/uv/+XkqyuoLT0h8/mlFQ1/Lwzfbl9ypwr8lMKnRoVw5xVDHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SNvodKsCEkV5jwtISy1FahPNjX3uEVzAExwQBkoFpg=;
 b=Tj79i9dAHHyuUx8D13plUezcHFtGFhhDK1QihHeI+yBsPV7o1AnfGXzxDUBJYrgYJF1jHpcmhRYqJz4AWM0wJ7Fgl8aLU3mV7MCp5Z5ZzYrKkQ1lQEqu/NBihkjF8SVoa2jkU/JBZeM9YPDitrzav0XukJBNrFGep16KFCob5FtYKAOfks8Sdr1OGYKAN6j4r6Pi667MVbUR2yu2DylTomc7jeUvBfqg6MCb901YLPu7f0yvqXMpEeWkadW25yO8qa4KmzP84DPQrNp67W7YedtAex4oxLm3JAL5SbSwiiMDeU1zMEQBKqKZTZR6YeRwuU772+aVxU8GTnVnIxT7ow==
Received: from DS7PR06CA0016.namprd06.prod.outlook.com (2603:10b6:8:2a::29) by
 DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 00:55:00 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::3d) by DS7PR06CA0016.outlook.office365.com
 (2603:10b6:8:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:53 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 04/37] drm/nouveau: create pci device once
Date: Fri, 5 Jul 2024 04:36:48 +1000
Message-ID: <20240704183721.25778-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c0a1a6-a563-46d3-a24c-08dc9fb1c2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EyYv1JaftLnHSQNaOJ0BFzP7aqbmRHO1H2l+IZqlV2iMYhj3cK8piRYh8OUe?=
 =?us-ascii?Q?RRIhKt4cIdLD4cXg27GKPElZIbbmjH1p6jVVQquOerSMM4sZAVuzNsY9BkIp?=
 =?us-ascii?Q?DEsB7F8iYv8Na5PmqLwwGTNJU90l+iX6lsQqra0DsOVhug1uLQfsle0VALI0?=
 =?us-ascii?Q?01yCPoroliifyScua2muDI4HrnvtPZ8XZaA2FNpfJgvX0byVMy0xX06PqyzA?=
 =?us-ascii?Q?CSk18FZs+8DuPcjPjYzxgLEzVt6grum9DNUgJg6k29vWa7K8njtg7z3x1I9f?=
 =?us-ascii?Q?HmtumGMk07+dGOl2ZH4+rqiFAi7Tb0LUZ49YYMTERegQmUkczkyU3uUnCo9V?=
 =?us-ascii?Q?uOIso/N4jfJEwWk+4J+Ehx8DVCYm6dXL+0V6K2Olv3nXiI3CFZUtHqH5F1u1?=
 =?us-ascii?Q?9O46V6c3jAArLe9mwTBxZPPulJHro4bJiPbUBL2Op+Cha4pP+xBrCobnXH4J?=
 =?us-ascii?Q?wT6qaFrzxgk6D2+NUTrMGhRCgZkY5S1QAfWZ+R1dEWw1pJ/jjFKszNJ6KvJO?=
 =?us-ascii?Q?Bpyj/bH6SkS9b1tNF3s7nkvywHS9PW4ZEimSkhncYqaxQ8ehRjnaPUCU6iyP?=
 =?us-ascii?Q?O1wVpGBPN8OsvvCeKmXYiXpEvezC6VF0MbGiCltcBA6STVP0icQjLH9j3+k/?=
 =?us-ascii?Q?Y/T4OXolvBPfkxzrhk6RxX5LaKu5DiZ9Y+9DeWMJCwIFRoAsJbE5sAUeDbf6?=
 =?us-ascii?Q?GpCAlMFyzBeQgvB793FKW1E7WWbxw2b1H7rYCWp74h4H2DuPzlsyAwd4GPlO?=
 =?us-ascii?Q?HexUkPrVJH/YuSLjflrkH0taL0/i+3dPyoJyzwBhZZ7dXYjLKaNgxCA1IxXI?=
 =?us-ascii?Q?g8y6JIgRobvld6l1RPGP2+BetZNF+ZeFrMp70XkYS1IH0VsnfudSjr6c1NTB?=
 =?us-ascii?Q?V0I+MoCjJTmOzJz/0tuN/xFVby4Ln9vid6RgOcvx0jV8OIfnQf+WsOyOSfyG?=
 =?us-ascii?Q?7t8iWIPSF4NiOR0nU6Bw6wiAYs8gCU37S7togen+UIimjraaUSZf/YkqsFhI?=
 =?us-ascii?Q?YDhlIAKeZPMxV2h/llUrT7PsfkZKWiMgDp5q8JfRUBh3cmvIYE6TBOwAQL3B?=
 =?us-ascii?Q?0S2f2gpzcYtvE9UDL7yEdBIXyGVgnyydxSxF+TeSYlo7rwqxBfjGsMZJ6j8k?=
 =?us-ascii?Q?oqcPwrVUal8h3IucrHBxMZLmwHlznUjJILaHHgZsD6A0+2lIXRPUAkFKAihw?=
 =?us-ascii?Q?LAPsix0DxhAJ/2ygOCpfJyPT2srRrQkh6AjTjzWFem2S8yP9+7QceYenS8pu?=
 =?us-ascii?Q?/vzLsODF2PRaZ5Vy5B34iD4eJ3rMPc3JcmIB+SjQwyvwHouYfWpooZgiqR+f?=
 =?us-ascii?Q?Hq5JL5mnGdT5doEaEEjcKsN7SfwuhFqW/v9RGxPv6PV+8cGCpG90PKBCzD8E?=
 =?us-ascii?Q?fpeZyKidsAd7Qjs+fX+NlZoP2vGGMLk3xSqE/K0e1prrntUlQQU3G1aKG3FO?=
 =?us-ascii?Q?l9CwB8wt+cqatm7r0OPnm3CUaCbL1D3O?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:00.2064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c0a1a6-a563-46d3-a24c-08dc9fb1c2a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
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

HW isn't touched anymore (aside from detection) until the first
nvif_device has been allocated, so we no longer need a separate
probe-only step before kicking efifb (etc) off the HW.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0687bc59d486..f372bf2954aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -839,23 +839,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
-				  true, false, 0, &device);
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
+				  true, true, ~0ULL, &device);
 	if (ret)
 		return ret;
 
-	nvkm_device_del(&device);
-
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
 		return ret;
 
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
-	if (ret)
-		return ret;
-
 	pci_set_master(pdev);
 
 	if (nouveau_atomic)
-- 
2.45.1

