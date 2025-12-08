Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC9CAE661
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B563B10E3B0;
	Mon,  8 Dec 2025 23:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BHkMMHl6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1DF10E3B0
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkjwPUzjHhf7IK3HbcGRrU/i132T6okEL5TegM5iZUrqBb5tPTK1XQxV9ClxS3cv/I/YgCmzxOWy1T1fvzHe4P5Nlq8brvpU/EqoYE4Erbg3XxznceUH7opi/qmWuREZmuwXEsw93rhwiMcajNU2jtEraFcxLtOZGANsZjmc5JQwWdYVsYMCIdBDwq6AwhS68Sb5olqAQrKsMW5nNQrArBxQsli6hXMNvpeUMXr20g3Zunmv29hpbeHDWegepRiCd9ifq7xd1tmTfOVmXlKU6gTQK759WgihoofFwMvVE5OBulzWqZ652ZRI6JIBq1v2dR1rkVp2VB/A8/qw/m5TNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSMFSgfJYfP4c+9lYKZ0RgoMApvWgJuWWI2W3oePRrQ=;
 b=pxIAdmJYGNI1ANfFywCnbJRVlCmUTfWYT2lxpIxdEqZ5sDheEyBjNCUEZ0xQ7za5H8PQfdbNhYgL906p0WHVDYhwhZlE95lcthHTLr6xdTNGplgzxJS/CAqlG1sa76lPkIJJ36RS+tYEtw0nCczEbsm2uQbByvOoBjCRaJILleFuHI3fivqMy0RSc4Um+L3dOzSGQWzn5/sRjaP/e10zr5R4hikA2dsS91d9rty5w0YyxhQyKex0TkswPH5Haq1hnMAiGupCh/SF8oKm+ktITU+7Qs5DRTZb6bTswPHk4NYjqoBJB2SieNxuvaZq81ZHdBFYtlmQFfS7ikoUjybYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSMFSgfJYfP4c+9lYKZ0RgoMApvWgJuWWI2W3oePRrQ=;
 b=BHkMMHl6B0djiA16hbOMVKy9ulnRcQ/IscrGGRGOXY9+FkQ7cWLTzEiMoOtzaTrtc1O1dCH1lKQWJeJy8VLc0Etq07+BGDj+zsPN8iDa6RUr746B4dGAkmLMvI01ypXNYVuc7g5NHzKLW2d8Lj2u4Wrpste2fPC4yF3aJopNFZLhpMg3qukYRpnXtM4AEezkVlIE2px/MarqbvN0F91vmhtYYhrCZE04U5zYqMH9FfeZEey7c9Q4DqvcYmHg6nAaw1NjzOR+R10n5xRpxydZIUnpxfw2utTgxL/10KNDTv8SQr1uGVnTUu72YHoufXCyNb3w98R/GlxZfolBV8QBzw==
Received: from PH8PR15CA0002.namprd15.prod.outlook.com (2603:10b6:510:2d2::29)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:27 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::a2) by PH8PR15CA0002.outlook.office365.com
 (2603:10b6:510:2d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:10 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:09 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 00/12] gpu: nova-core: add Turing support
Date: Mon, 8 Dec 2025 17:17:49 -0600
Message-ID: <20251208231801.1786803-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: e01c1164-cdc5-40a9-4d7d-08de36b017bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9TZow127Ncp7rmzHg1FGHrkQudb7w4Bmcti4AaRxUq2vz3+YVHlRZTwfffoU?=
 =?us-ascii?Q?/Ts3YnBLA1eou/Ku0050cOHWSDpIFmwnL9zn185LS96+IIG5qNj5MFUiCeRh?=
 =?us-ascii?Q?HG6SuzoB6QIheCdFktdu3IqBfqsCINr2Ps6Kc+eDU/ubAQ9nm4JAhAWR1H/1?=
 =?us-ascii?Q?Nx0HF58PnznY07PRLUfUeILl0qT6E5/UPZw+Q7W5DR1CDAoIj7qydusm2Wt2?=
 =?us-ascii?Q?SjNnSAXl0cyxRCM9q5nA3fUPFNnVnvbz+i6TxNqfQrYdDmNBfPM44z6deO3e?=
 =?us-ascii?Q?nEsH2Ui6DDZaTYLMuafIPOkOHt2r/0FiolQ0fed2ABZRV6KOel/d/zejcWaw?=
 =?us-ascii?Q?nC2kXZlZ6kbtlLWWrRCQafzCeytp4nW89tLoHlfMTGi36X5fPi/jmgMpMvTA?=
 =?us-ascii?Q?zGQiRKbnvxsGBv8NYslYb60NqBRYKoj89asnPc9k65kvgYT/DEnCl6eDmpTl?=
 =?us-ascii?Q?9gbSQ9l0+I8fKR1L07Jj6U7b6lMXdKKELa9NM2BmT2VIUfttdUhcom+VmFKZ?=
 =?us-ascii?Q?aeY5voggkcAR63ybRvab/t4eTvTa2MerkRXuZ2nrrXU03QOrlq4JFt3H2GMo?=
 =?us-ascii?Q?kTWH1ac6Jp1ussr6c1sbpGHBxyGEx4GEPoR/YxjLttCzfh3dfOhivpTKJnL1?=
 =?us-ascii?Q?MfR50hNZDSk1RSJEPJBYZs48YYvYZb8id1qA+etHeoYqUxrbSi0UimM9Ku7x?=
 =?us-ascii?Q?tDJg9S88Hn8WnBYFmMZS502B3o/lh0T8Y+XhfIexUTBlwMYAG9KOJAXNcFzE?=
 =?us-ascii?Q?vnRT7wRV0bkoMS+tK/kfeSQjVYmFy9GS2XULeEoKMCkyKtcGkWlPPlMfc34d?=
 =?us-ascii?Q?XwragvgEGGVqmeHNRUGfbXiYY8DZjYaZGkrO6BFbit6576kNmQCjqCw+pL8t?=
 =?us-ascii?Q?e2KJpvM+2cP0NjNjvZ0bE2oLZkK7xr8hnu+qZCYJglvaRu1L+EWeBhTzyrw2?=
 =?us-ascii?Q?dcHorLVCzHRfNYsSst4K+nsR99ageV0A7nyjHdpBSnMtBhTh0lgB9W7PFhFe?=
 =?us-ascii?Q?xIuxHPzLMMcVPnYbq6koDNjOK+cz+TFPQ7pj+nWNO1Vjwt863myDbe8mkaLO?=
 =?us-ascii?Q?nd3viXPrdIbCfqtn+L8hCMaedtxSXZFRO920VkbnQY7kvFKxCWcA4zA+KDC/?=
 =?us-ascii?Q?xfYNbSf6UVhe3vsNsuKIWiaHeAhmEHbOrOf5shsb8c4ofhaCoFWUxOxWq/3v?=
 =?us-ascii?Q?yMuveD4cyB1ocbBxUysb6Rwsz5+4mMlDKO32+F3Fm/5mHBhCPBMB0uXDk/Bk?=
 =?us-ascii?Q?Tie1LKiKTsNnsJi2SHe2qS4dKGYmmgDkxzCyATU4SorbkVO3VZUjBPEE5vMI?=
 =?us-ascii?Q?sYAEvSRIlHXvfLPEYw/i1jzWtm+kmxropme12xc5P/+Y3WvV5IqlyQFzdzCh?=
 =?us-ascii?Q?akRF+fNBa92gaRDmVIyttF0zHPvG/gYTKE4qzgwkEHQMviXsFqxGDHCEz0Jr?=
 =?us-ascii?Q?LRqdINUCdHfkPp9l1t0fRQKF5EaFvAtjwBN8w8qxiN+bvhSTceeZppB2yTTa?=
 =?us-ascii?Q?K1YbMmIlvOhEm5WB+t/iZo2uel/c087eHI7QUcWiM672nb0DWErTIdFySGLM?=
 =?us-ascii?Q?LG3eG/VloNjG27JT1SI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:27.2241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01c1164-cdc5-40a9-4d7d-08de36b017bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
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

This patch set adds basic support for pre-booting GSP-RM
on Turing.

There is also partial support for GA100, but it's currently not
fully implemented.  GA100 is considered experimental in Nouveau,
and so it hasn't been tested with NovaCore either.

That latest linux-firmware.git is required because it contains the
Generic Bootloader image that has not yet been propogated to
distros.

Summary of changes:

1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
is used.
2. Because of non-secure IMEM, Turing booter firmware images need some of
the headers parsed differently for stuff like the load target address.
3. Add support the tu10x firmware signature section in the ELF image.
4. Add several new registers used only on Turing.
5. Some functions that were considered generic Falcon operations are
actually different on Turing vs GA102+, so they are moved to the HAL.
6. The FRTS FWSEC firmware in VBIOS uses a different version of the
descriptor header.
7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
aligned to 4KB.  So pad the struct to make it 4K.
8. Turing Falcons do not support DMA, so PIO is used to copy images
into IMEM/DMEM.

Changes from v2:
1. Added trait object for FalconUCodeDescriptor.
2. Replacing libos args size round-up with padding in struct.
3. Changed pio_wr_bytes to parse 32-bit words without panicking.
4. Depends on Alex's inline(always) for the I/O functions to avoid
clippy errors.

Changes from v1:
1. Replaced pointer/length with slice in PIO code.
2. Added RFC patch to implement trait object FalconUCodeDescriptor .
3. Added comments to new registers, structs, and other places.
4. Fixed all CLIPPY complaints.
5. Added supports_dma() method for Falcon HAL
6. Renamed ImemSec and ImemNs to ImemSecure and ImemNonSecure
7. Several other miscellaneous fixes based on review comments.

Timur Tabi (12):
  gpu: nova-core: rename Imem to ImemSecure
  gpu: nova-core: add ImemNonSecure section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: add Turing boot registers
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add Falcon HAL method supports_dma()
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
  gpu: nova-core: add PIO support for loading firmware images

 drivers/gpu/nova-core/falcon.rs           | 236 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  19 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  78 +++++++
 drivers/gpu/nova-core/firmware.rs         | 145 ++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  46 ++++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 215 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  24 ++-
 drivers/gpu/nova-core/regs.rs             |  73 +++++++
 drivers/gpu/nova-core/vbios.rs            |  73 ++++---
 12 files changed, 843 insertions(+), 132 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
prerequisite-patch-id: a3e23917ec535263604af95194422382f14c2f21
-- 
2.52.0

