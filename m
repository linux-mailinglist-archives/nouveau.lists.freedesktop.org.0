Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DBB23CFA
	for <lists+nouveau@lfdr.de>; Wed, 13 Aug 2025 02:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC510E673;
	Wed, 13 Aug 2025 00:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2tdB3eC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E02910E673
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 00:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2jdW3DQKQ0EgzXx+kG4yFYjktC7/WV96UMZDhP6XZRVmt9JAh/ows7Q2t0ChHMHTRtFxKY8GY47v5Ol0E3ZsiaWydpRDktLkiNgdizhGzZwMw8ZkOBYnr3Z8UAUTLkGwe/toQ1cB9stHKycW6zY6r9JL4v4rQKesI5SILhjCl6ZZZvxVbJzdkelnyuOJAkt2Z1FeNN3GG6atnfomqNhhhSuWk3QioETuSeOruUQjGDmDoFMuftQDQMr1P7Tb7xQru87bGjBcO4iyjU9zosVi9ARVZl16P7dj9th+NphJN5oQtxgEL44Clm25EH1nRTN/FsMpTGe3Et/7Wg7rQnsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukEgyrDs4ni1HpyFZB1HO+HDHcyPhWgY10PSf2m1ci0=;
 b=XBnM15je5pPDkD36Z7z15W21IiFWu/miY0zwaFQFnjZY+FsuDwhNFRuHZqAa8ilryVb1O6bV32TJ9T8uzawd8dfFMoKqZD1pZr3ELX/e2bh5q8dFZTmFLxjWvHV2g9ftN6rI21IWz5Tt/a/TEMCH+/J5ZkIXl4SMRum89R/5AWppSWswPMpxVIfbY8q8r0pO0Wu4LEza34jhAm/WsWkZxkmQj0gTzhtDV4XHnycBt9L5Ipe7T6QK9rxK6KZeLOXu7TpyT/58RzMPHS8+fosAldlXxFV4sU12aeaIde1zRajHWue9coiE7mTj+ln1SpmbNhDoaUjTANXsRp9buRachA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukEgyrDs4ni1HpyFZB1HO+HDHcyPhWgY10PSf2m1ci0=;
 b=H2tdB3eCq3nXjM2LKlpaiL8+nvckYw79rKSzjjYAiPAO9z1udcDy34nCVg4moMPfZDvYvLtMGkRTMNLhgCTWOTIAtt8CgDCeTwU4FM99dWs65xf7mFhSy/c9FiMhla5o6v3b4XgPov+TfxkaaUiBHQFWR2pdt3v5/+ZYYPHn828j8t+1EOWK2UO5v0JWrLtiALHTQeA3NbgoLgXrRXW0qee4oVznmfcakpEVaTgOO5JoVOaK7EgvqwMIfeE66C9PeFPxBcuk1THLWtPitgey/JZRD/EUPvcNqLUvkF8HFyDdeSXn+DVm0wW5q8pfvd6IgVX9D8EjPD7FLEQ1Gp4kDQ==
Received: from BY5PR17CA0068.namprd17.prod.outlook.com (2603:10b6:a03:167::45)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Wed, 13 Aug
 2025 00:11:41 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::1f) by BY5PR17CA0068.outlook.office365.com
 (2603:10b6:a03:167::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 00:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 00:11:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:22 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:21 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm/nouveau: remove unused increment in
 gm200_flcn_pio_imem_wr
Date: Tue, 12 Aug 2025 19:10:03 -0500
Message-ID: <20250813001004.2986092-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813001004.2986092-1-ttabi@nvidia.com>
References: <20250813001004.2986092-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfcae3e-96a5-4f68-40f7-08ddd9fdfa78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eete1W0k5zbAuOy2Mjifu9f0DO4G5Ezn9asmdpUd2GYqj+zPKrJWwKvJhqda?=
 =?us-ascii?Q?Ee3pKov/7paBlvKJAtPGT0mGuDk63oJZx4Ba8MttDacZo22YAvFUcbBmNijV?=
 =?us-ascii?Q?jdHjFDTWldXJ79uM8xl+9fapKT8RgF12nMKSMfyr8f/vPod1b77bkoMRC802?=
 =?us-ascii?Q?YYs3i1+4/ilnxNRGc3W6vfZtHvx9eKxqEagoFI1oXXwrO7NSY92jB2QEsDf2?=
 =?us-ascii?Q?Z1J+eM7onoWJ6rCC3RJifyJcGZLUl6i6wt98X1zHi/volYyaLyuJqgDSLvYy?=
 =?us-ascii?Q?o4bUXiAQwJ8iSS6OUhIWx6NS9etIIvTPO0LBVwBQ3da/owcjB/DHBabTy/CI?=
 =?us-ascii?Q?9TtAG8T9dCVTdieVsT53jhrjZFPQGHEXnpqERkkLtd/uVPrf6RtIvcmLzaHu?=
 =?us-ascii?Q?TyA0qTP5Cu+b7IdfodBdPiTdyzR+qx0BJbHjOQU511yVZJTclUsFccFFSqfC?=
 =?us-ascii?Q?7yRYGM6PdYg9rStXtK0UGoIAC4XoNa6AgkQhyCO333PW7NAloU0gqygPUOvf?=
 =?us-ascii?Q?iOSv1PEAFkaGgeJxm7ds+I4l65fGFxp521GF8x56oAfN/C8tL+tj36QOWLVM?=
 =?us-ascii?Q?dCzdmEmo+9bBk0+SuMqNbPS3AFw84Ln6zSX2ofiQbRQJ6DyzPOlGeq0w8R7a?=
 =?us-ascii?Q?WN50/OBhSzuXiU/bgs2iQbhvJMM1j+NTaSTjcNlHoYELbD0xMMWPi0vdLqR/?=
 =?us-ascii?Q?k2fKuLVlB/8fdLStT3/IblC4MfshnvrupgPGRe3+GoFUeJci9/ou5vKWJGHX?=
 =?us-ascii?Q?dUF4XdSXlXs2+LSty0XsXaVf70bMyUBna8t2V/kTbYGcpaqThAZ/rNHTQR4m?=
 =?us-ascii?Q?lZMTXU/BXXRjOcmwqUKIcZNGkRXV6O/qwDouXwrs0V/gQ5rqI57fJOU9iVMj?=
 =?us-ascii?Q?+PmGKb5gJNqhQb9kRhNDXbuh/g4rcMYV9kz6qEmC9LpyQTCwSDbjH0DRNKFa?=
 =?us-ascii?Q?KP8hUYu3OGJBsqO68hXANMPuQQqTEgL3AZnAiVmiFRlCo8Lz37o1YDhL74ad?=
 =?us-ascii?Q?7iN7P/JDIbYuxsGs/LBTkDhuYJ05K0rF1ljN7BgeapLKw8snu+gxYRbIyy6X?=
 =?us-ascii?Q?Pq1WFTtfvB7njR55pL4r5Dveaehkb7+pQD60DCRmVmqYbC07wYJYvgzqptAb?=
 =?us-ascii?Q?Z1BfuwrM0a4XresWQxm7RYrkINfKemL9SZovS3nHfHULfT13xvwWODmhroad?=
 =?us-ascii?Q?N61K1/oxBIs+vGq21Vol3YgP+M7lpD4kXEYN4M5Zw78pJ3Csxb4Gdzt+R/yF?=
 =?us-ascii?Q?t4gJtqvrdtR9siZZC937Nv2XLKdwwoDtgLyibBHMmCQV82HjCQ2mjZYzko8H?=
 =?us-ascii?Q?h/Avcuw+XQjfEOyJi6NUHmn5tbolsapG+eOJV9DsgSeAmyHobegGsEn1vR6A?=
 =?us-ascii?Q?v0fxI1CsYA16amJ8q2Pu4zCPObciEFzdDkwu/oaak6/1WH8CiuyM0m9BpdLg?=
 =?us-ascii?Q?PmCMbI/rP1BCMCe1iuQCNz3eEkSFDCQENZZ8Vrc6reJFNdHNSUolTbbDHa/F?=
 =?us-ascii?Q?7OTW7jvIAqTRZnhIsCQRhp7270rvquyLkmDr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 00:11:40.7251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfcae3e-96a5-4f68-40f7-08ddd9fdfa78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484
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

Fixes: 0e44c2170876 ("drm/nouveau/flcn: new code to load+boot simple HS FWs (VPR scrubber)")
Reviewed-by: Philipp Stanner <phasta@kernel.org>
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

