Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F69897EF
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DFD10E3AF;
	Sun, 29 Sep 2024 21:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iPhMcnSf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2710E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOD65ZvI/4PH946GveWOcJGtATeX3XtYbaZKBi+vfOy5a2I/f2MoPMKJj6kzKeOdd45VPoQZA20EmXxaoncyAIWtayZuZjfVh/w8t9UfKHaxFU/976iYemRK1FogspZ8F6CHWMk0dPYzosrlDFBCKizCBrCS7kXVGw3pI9lsrbYJWIHjqjKGRcXRqVe5m2Q9lv9ymUOe1w5+kipW00f0s139Nif32nEw9iriXWvFSH8ymReSZ4HzS4SvzxY6HfzyMflMcaAquGLFYleG9UsH6dymbRCj8G0yXcETwgQwmkGShp+oVXL3q4gu3qOJwUzklBfZLYiikOGgAODou5ikqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=FBffkivL0LVvXao2J97kibre375FXxP8t5txSxEdI1A+fuXG7y4LphGObvrOykUfEW+gVAYtpfXGLAHxzebhsLlh7luKwgZzpKomCvb9L2V+8Gw0gfH3CEsHYTt6NvHMPRSp9eqCYLx5jLdNGUQFgFLoHFrUtiXPgjOU1W0N0G+T5PNxcNjtRPraOEmc3E9Zt+PkMxJ3U99bdu/rLPa5BMXzzXS52bocHKAhn2uWrRCmp0Mo5yNtKLBemY3dgLqFfNaK0T6pE7m+tQolAHqxrtHN8Hg/DKyuRZYvwOmrIB7/dEvC47c1KfdIcC06xILyzPVkLqkDGG2/KDpmhcvpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=iPhMcnSfUuU/9aE91/dFZHpHMk43JLEnYC/2FNJaOt7JATiz78O0e/iSx8YwZPd14c6Qme9p3+6RnFQEJ8zKlBud9AKTjtKJ6XjDya8leB8raEUPbWbDzupCk/vp0QSJYqkf6iS9Qx+WCUHKUzWXFU6Ii2XfaKqb8C8ZTZmAhDKcN44pSiQTfb//P7pcKzW2nKhwj3cGD2Jgs4rlJMd/+d7IdGlY4yLmR5t1IojpzYqv/t0PjUm1F+00b3GfHRNgiKGXfEHCmUyqmZUE8RGl5vaPclSUZ2FTHykZQNM/tgPsW9VD6Cu2l2/1uhc3eCXGDNhjhVgNv5zDN2X8t2INZw==
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 12:09:01 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::9e) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25 via Frontend
 Transport; Sun, 29 Sep 2024 12:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:09:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:09:00 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:08:59 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:08:58 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 0/2] *** drm/nouveau/dmem: BUG Fixes for Nouveau DMEM***
Date: Sun, 29 Sep 2024 15:08:54 +0300
Message-ID: <20240929120856.440950-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 038eb52a-84b9-44af-53b1-08dce07f80ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rR8aqXrn5XYP/EBlcNKrsFc63HS6Ou9eXEWTg77rrTjnrqB7/36bJELsGr1Y?=
 =?us-ascii?Q?PB7h5eVa6NL/9a5RWf/ROxt6nIoUPdKqkM/pP63keu0yf26J46Gfo09fe/nC?=
 =?us-ascii?Q?FPQYGqGExSC5YO5SKZqpmkHidZDaNRpn6ckcyAloCVr95Xc+Wrca4OyfTBzz?=
 =?us-ascii?Q?Ml5/dnYKWZfQg5AihlyYOwNtRD6aGeLoqZipVwkyP6iZVDkwJWr6wACYceWh?=
 =?us-ascii?Q?l+TbDGVJST0D+9Pp+OQVXAcchu407S9ehAa/o2BfGFtHZaOBWEPXhRP+VoON?=
 =?us-ascii?Q?WuxD4U6wueKxo7u5Lhy6o+4kUAmPS2sHMClUKOxAb/jD0aas5bxb+x9wDUo+?=
 =?us-ascii?Q?3fQcpXAqTSurE5QmL1iSSrmWT812Xd8454Qw/TegIu8CzFc6018kmPYHKUhQ?=
 =?us-ascii?Q?UGqwOyxj2p+n27T55aTFFAAV04brQTVUuy7Z8uEkicxfpquZIr793uKo1gAo?=
 =?us-ascii?Q?bOnlEowygrdO1oFPO+OAUyfgTLDxl5WRzjXsr4KorBU/zLNBPWeDeEU84UOo?=
 =?us-ascii?Q?BeAUarU4W3sGieR1US4sZ7ySoHuEiF33TZkdbvZ0NzCPboYGLZJD6bb/8D8K?=
 =?us-ascii?Q?RcfALo9jUvrXaZ+nEMxJnsmNX+fSCsUaT/1kArbIaZ5IULH1DxNUhcaJft5t?=
 =?us-ascii?Q?UNDrsccxtH62aG2FDD/qt1a4HUmHoyCUshj4EFzmp3YbchW9qe2nmhvDeXCF?=
 =?us-ascii?Q?Qy2wjSADmHndQNCX4d3yNAqK/1ukOnNViLglVmN4hOrOWNHnAqysNeeIivyS?=
 =?us-ascii?Q?TIzw9rCZxzBO07i8oX6n2jPDfeBURQaih+7bkR9nZUVFCOd/WzHzDqdPjH8a?=
 =?us-ascii?Q?cwujLbTu4Ymxzkunz04RXbZezTWt5iBF6kDIXwE3d/e9DBr7xcPTqyQoKBme?=
 =?us-ascii?Q?i0k2kjQCHOoas6MTmgGdMf1q1GcKfahNRMU+tYJZXtohcsoIGTUPGwu97HD/?=
 =?us-ascii?Q?2mojoH4abZ2FVsV8HMKTLAFQHAVwNmlbdnX2vul5cEMPIadjzcNb6j3kDELR?=
 =?us-ascii?Q?KE61cMZ9j/YAW7dAwo/eKg+DQObBxPIqOq1JnpeggLgMCmPwYjlTmSCDinFZ?=
 =?us-ascii?Q?9p539V9e5KeNNNtF2Manh3+1lCQH58EJ3vmS4r2vn24DmKJClqVsmwwe76kM?=
 =?us-ascii?Q?fv1xBAEKHKixIJRlBMYs4HRP/62XC992S/R3uVCCMVKzejiEEHG0lwiNUIB7?=
 =?us-ascii?Q?cBx3GyCVxDvHLJDd1/DPlIqDclk9KaePl/5lKMI8J+frLPagioxB7iU/kShy?=
 =?us-ascii?Q?Z4eRebYHrXqNtvbYpLPr9Sjjt3q9fwSiKWhCwEhIW561y0TLRyQFXJdPbo97?=
 =?us-ascii?Q?cfpe/BEiymJ9NTJ/2THbW5OdLuNCzBsvBusselBHiAuzCcgqpgupomU4z7Sl?=
 =?us-ascii?Q?of5ba7IddWh6OzETN+B/kQz78txu?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:09:00.7960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 038eb52a-84b9-44af-53b1-08dce07f80ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
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

This patch series addresses two critical issues in the Nouveau driver related to device channels, error handling and memory leaking.

- Memory Leak in migrate_to_ram - the migrate_to_ram function was identified as leaking memory when a copy push command fails. This results in the function returning a dirty HIGH_USER page, which can expose sensitive information and pose a security risk. To mitigate this vulnerability, the patch ensures that a zero page is allocated for the destination page, thereby preventing memory leaks and enhancing the security of the driver in case of failure.

- Privileged Error in Copy Engine Channel - an error was observed when the nouveau_dmem_copy_one function is executed, leading to a Host Copy Engine Privileged error on channel 1. The patch addresses this by adjusting the Copy Engine channel configuration to permit privileged push commands, thus resolving the error.

Yonatan Maman (2):
  nouveau/dmem: Fix privileged error in copy engine channel
  nouveau/dmem: Fix memory leak in `migrate_to_ram` upon copy error

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

