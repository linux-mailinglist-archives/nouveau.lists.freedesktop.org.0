Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B59897E3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DD610E384;
	Sun, 29 Sep 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XLQC6x/N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA6D10E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 11:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxsnaIOh7UKDqyv8KiMTqjVBVib3y1WZqequ4eb734IxzzSEp09yHESKin/FQVPrsjpmgKmtZd04w6014duSpI2qeBdZqPnpBz4x1UmnP5Ipn+415y3EMgehSenQT4+5UVcJ1KMfdNy4YrcT8HA/UIAxq91mTd0SmNDk9qhCEWyhrP7vVV6VSVt7B26fDECerAG5JB/Vkuclet5fZihlLDYNYdZJXvFktcg9IzPCr1OLiQLZ5JlGKmhRAcqpXNnMt1GN8myNL/YlNXhls0UmDrkXq03gWZWAgY9Y4XRqNYVqZWl5gL80dbwl+UliLNkta31HougrdgWqx1Qx62Z+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=FdGwIc3swQ2lXmN6YjGKijjJHsk7pZO4epCvHX53aGC4uLRkGl01ZGLzYLceWh+PZq5Yw03J5QT0SKBrHnE4DZ33UJDJCdEaAXYcBF/lYqI5cGmYP7lDU/Bf5/RT8HWz74payhLTziBHUdynar7tU5pYW15YLocxxJ8PGSgDOHTzG6rt0Ncj2P0lHBxblRG+k2I/LgO5sBwDMjHWwTFhslA/WQQ9WqBgG4aOrdHH0bM2yANMpz3twbRDyWOg6Yls6uB5gDKPU377SXkJcoAIupd5k1mg6Q2sF97VbiTjKXjrRlmhs5TIsbvmf+VkEv1/X+fQ0IJjGXbe8wVo/eiAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=XLQC6x/NgmlN0MBEgQV3HIrbc6elYFyNmB4fjbry3KH4WwBUSP+qpFNDAO/NYPhryQTDvYiJW5aLG5sVja9h62kuG94f66FRoCG+rTktgOF/s5y4Y/oq+7jcHH5pqvVQHdcIOvNO03xkdjKujDeB6eCI4FlWn1NoMhfkXpSqJmKkLkPW0vWGSrljxL6Zg9j7ALKtJBcMjGBF8DM2wIvfPptuYmdJrI6xGz/8l+WeHMHkXdtXscFdafknrW6/WBHFLDc703CTaJXTwsudy135yLvTPM6KV7L4TrWCcSM2+uWWuBSjuMbH5XPAJPVsfi0tPRwQEUl1QVAkJni+PSxLGQ==
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 11:44:40 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:610:1f0:cafe::c3) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.11 via Frontend
 Transport; Sun, 29 Sep 2024 11:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 11:44:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:24 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:23 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 04:44:22 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Date: Sun, 29 Sep 2024 14:44:15 +0300
Message-ID: <20240929114416.420203-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929114416.420203-1-ymaman@nvidia.com>
References: <20240929114416.420203-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca958c8-71cb-4f07-e440-08dce07c19e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IDRx4rQowWzfe34WywHMKdi2jVevDuliOIUPekAyycAWsX7yLgwbeD4DPJWk?=
 =?us-ascii?Q?sYjksOChNbjdU0NUI1w2ulMy0WYRifwQKgP/A4zw3cJlTeVC+BLBr0cbB9bU?=
 =?us-ascii?Q?uK2YbW6sn+WZOAQrWn2eeZsEOf1TRP839I59EI+TCn58f4ft/Lj7F5ffPgD4?=
 =?us-ascii?Q?Ni48kOtaKY0IPcIwWLZBh+piUBD9ugN5NZsiuwuX3pFcQbWdB2RS9n7wVkzT?=
 =?us-ascii?Q?qZLTgJkCokJwJr0FRgGNmLFyB6uRchW8Vbdjs4buLiKaCVcSbymloiknlW62?=
 =?us-ascii?Q?RhqZe0mTJ88iDg2mL9IXq7Ype0N1WRRLtTzrckwRqTHWmWOXAxjARFBIHWwL?=
 =?us-ascii?Q?atmC7hWK7oFRefIsFBy+uS4TS1E1s1DOSPvIIA5+nWWRUUdFUjolhP5fUbih?=
 =?us-ascii?Q?NRmXKIXeBApZzScwMBhbFxWDT/emzcF8pm5q2fvJe6vja235VJPhZgyUUvR/?=
 =?us-ascii?Q?vB5E8n8l7WDKe4k1QjLcbzIx8paT5pTE6GNBYM9VDQjJWpHpVGHExQ99qleI?=
 =?us-ascii?Q?Nj1f1VjVvcSf7S8pZt8+tRS1OyudotXp+Tp0caX1Baglpdg2JJ6W/bYVlWce?=
 =?us-ascii?Q?oBkQ5UmKoBY3Kpqk3wu5hMQppklUhdWlgpwFySPIR82O3va04yl+KUAWHd+6?=
 =?us-ascii?Q?9cT8YzhZkvlMA8ZzJskn6G4L9mNZLsY3jfDcyI3ESmIC4B/vODzueIqclwMy?=
 =?us-ascii?Q?8ZvinTf5bcSLHKx30lYKtuFP0aYdwNGcvWjKTbi49BvVT1uv06jcu6TbEX3E?=
 =?us-ascii?Q?bfovqWmEvoznyU7/jQTavsFgVgxmbUkZF4vjesy1qg1iNirFRYl2AvSKnUqK?=
 =?us-ascii?Q?YJ9JPy5G3sjtem99hJr2hGAQ6YZ1iL8Uam83vx/aVnfG4ErUOS826U+inB4j?=
 =?us-ascii?Q?XgB9AhXkYr7ob5+sfk/+MZmG80NCfSkKwzz42bmXC5TUNkrZ3HjlCu3i17dT?=
 =?us-ascii?Q?9owQQtoOalNbU5E4rUOtULZA7QedllJpaPGgp9zMVjTOkyY5xFgeD9No5jHA?=
 =?us-ascii?Q?30SWMPZ7BSrEKWwNpcwdECWHSbCbc7f3fces8aWglLrEZVHZTn2wB3E3fmZl?=
 =?us-ascii?Q?IpdnPSPqxhrjThwoY3B76fvgyvWDSa9GjpfcKE4qllrSRe69ru4ZPLU94hOD?=
 =?us-ascii?Q?cWXowxa9jNJs1qedCkY9JA+RpRkdqnAFbsY9GzXn90prA4w78PeMt7l/Pxq9?=
 =?us-ascii?Q?5i5AoD6v2qjfUtGh0HTSO49Pu+zI6/2Um0J7zNK5K61/c68BuAFAc7VHf2Mw?=
 =?us-ascii?Q?jxZLSG73QZx3Dms1yC2Yi3TPxhWMQmmm5L6gOHglCYJ7bSAwSadQuWE+6Iwn?=
 =?us-ascii?Q?QkXryFuFU1dapwcgNKmzg0Y8GeHXAWxO4xkdY2CT4zCPUCdm6Rc36PLhl8O5?=
 =?us-ascii?Q?FPDBZGwWyQY752ZkhxkpEX0ka4iW?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 11:44:39.4271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca958c8-71cb-4f07-e440-08dce07c19e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5cc
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

