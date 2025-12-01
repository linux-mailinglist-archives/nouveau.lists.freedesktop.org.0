Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B6C999C6
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A8810E4DC;
	Mon,  1 Dec 2025 23:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CKuSV9c1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680C010E4D8
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2aZX0FO/YFfAjMwOOJENwvuJLSuRb7ahSJkvkqVUTIQzCa7FIullQoU+Qa8wn5G4fEHDWfuCezrXSe6mUBf13RABiCHUG3SFMAGFR2BF4FvllTz2SAow0/H5RJ6BabASLpvXCIcBuFlf1K+AREakKpfEPtocHEsYj8eveRwcAXqrdLliBt6UHGAVQbBxS7XrZCwjrkOyx8Jcpm3sY8pEKdxpXavFGpq6Sggt42HxnTfOwcvUeVvxiHnDyhg7JDh+TKinhWT8mt6PUC4VT9Zl01qIKaQzyQpa2tMjhy9lMo5c2eYXwJ1cHfvlFTECaKBjJ+I0+hTKDC2Y115g+JOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7c11ko2S7Nc8zNPLZfwEbPC4U7DW8FjMYZNy2xD6Us=;
 b=yHhBCLxpQPzmNvfXS5B50r5SS0P/mgUfbfituwWavy+ikFGA30yuRHQmcEqGWpErJ4PoH/lBAG76vKBGLbfZpNT1kqQc9kH0chipejuPA+yaiRLbNC/AxDkj44lag1heZ1Yb9LnuK8zfPLAi72tE+m7n/Y+p9rlDGnLnkkm/AXw1Ysd8bTl3ybXx3c90ZD+41D09uQ5vraPjB2iXcmppC4j7/9eO+LqR7QU+A6QBegqHj1gpJuzWx9Tg5GnB2hhEzuhx0vAw7VFt+3WTV/xs1GpRJ6YwhXyZlK/UqWjtj4b8Znhnkj8LjX0pNbhDaptuK6tDHDKgA22aYysJUu9EIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7c11ko2S7Nc8zNPLZfwEbPC4U7DW8FjMYZNy2xD6Us=;
 b=CKuSV9c1MBiOgRsak/zIPCpJg6KXionBW2wEB0nBzchXjWjlLBEyE3mK6Sd1j/YlitQn5F/c9p9Ofa6qqgHZHDtNjbzUDNxZZT8l4wjtqb+EP3zO1N3EyuMXJuzWFPakypGxa38UwrXM9m2nbuxsRdoVxVACeZnF7iMebHnLsI3RnRBQnJNWDfKGZyALDN80dBujaLC41GTdabPyECapOaxILJNuA+7rPzYcyoIYAghpFttUusF/OL4xHPgB6ECA+pHpgzZ5BUXQKIGW2dE17k6t5dXHOeu0J4vxhOuHOj4TkP08f93LjXAvAYni1kVejHYNiZxrJcFwZKbn4+IQtQ==
Received: from SA1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:2ce::10)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:16 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::1a) by SA1PR04CA0002.outlook.office365.com
 (2603:10b6:806:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:00 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:40:59 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 00/13] gpu: nova-core: add Turing support
Date: Mon, 1 Dec 2025 17:39:09 -0600
Message-ID: <20251201233922.27218-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|CY1PR12MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f4a201-b3e2-4d6b-0815-08de31331ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+9XoHka91Z4ezej+HaD/xKIGtPZ4eltF7GcPUnvAyPy8pKVOffD8m5k+s/dU?=
 =?us-ascii?Q?5xCdN7kM5IDkIR1DSZXrudpd5JcTFmF2uyuXbbLfLeFRzHpg4PghWANpB/ai?=
 =?us-ascii?Q?qgXvknFWGHlSgLHngZgxJaP8Ba0KlOTTlzCFcwcskMtoH8vTvPYH68EOjMy5?=
 =?us-ascii?Q?yCjYTuWGAlkqgEEEKD8W7c8EI4dvOXdyP8F7fyFv3g70+Iq0Pb13ZZvN+u8M?=
 =?us-ascii?Q?/L13poPk7xdarp6i7DbBwfXr8XcfvYNLy5dcPQceIuzbPWGbZGNlTRxojU0v?=
 =?us-ascii?Q?RzmSGU2VqLcbIpzE8ENgj6uzQYSoFfSkzp+jgLiW1iIyirV/R3st/pdHJfog?=
 =?us-ascii?Q?ZXPc53q/spAqoil1qSfWyQqxGR1ICXGrnSuXutzW1MjQPmhbwwBhk9NwPHzB?=
 =?us-ascii?Q?ErbxcJdo0nvrmOmWYe6Xqz234Mo2r+L2kX3CzxfS1NK9oVxJJf0347MKHsky?=
 =?us-ascii?Q?2NVzZGnmDGTGj86BTp/y5jzi0MFdqvq/ZroOEdXRlVSe368ZqCACUPDyxRqj?=
 =?us-ascii?Q?ZIdo2wdFLDSWiUa3U3EpS0Sy7xyfRzZ01/8X7BwTrtHZ9athjaRR1B/ynwaU?=
 =?us-ascii?Q?77eK8kldbzJzUR3oNWGO5HEUFAEQ6bLgMZzdlgUHPsgpFU9UalNmk/MxzREm?=
 =?us-ascii?Q?2tQ3AofF+1ZV1IphgsmrlKEuX+mXx8Jn+htv82sw8cxJQrNvnNBk3zQPPSw1?=
 =?us-ascii?Q?uD6cFwG7vW36Bd9KCQ9Qt8i5ckMKJDYJQmXvH67zVb95i1d+RF3+bZj1v7wj?=
 =?us-ascii?Q?Equj9kB5dPB4S2aoZPmuyP7BdRiJ0FqJy3tgSjdXeGxsowTVQ+OtqS0QtKoc?=
 =?us-ascii?Q?0LW77uelF6qxWCaAyjAZ9Dpvy7c+PIHzu92oqaM2bbwTUjXM88BYPL2NYXSc?=
 =?us-ascii?Q?Hl3Uj5Q6s/wOolk7yCuYzeEV4mgkGEnH68ljgMGJ3JWdiCtTULuSB6xk0H4f?=
 =?us-ascii?Q?/uFDai9LYa4S8pc9geVTJnwWPiDSP6ip/7eE0UbmJWel+L5wxNuHI+9QyZD6?=
 =?us-ascii?Q?n9VInEEcYfEje/FsdydBtUP4xASb3NsQV1wuvJkAHnzNGBSWPfH6A1zDzv3Z?=
 =?us-ascii?Q?ZJw4+GXluzFowq81CeL6Ocrq+R897mgz3tZ1jItyleeGlrywkiMOKzTbZJJ2?=
 =?us-ascii?Q?IOeTH5s36idanu390XrNU2cDV7qH9owUF41W3lW0lZwDpBuP2bK6iKIHe8K8?=
 =?us-ascii?Q?OzMTplyHi8TpOSRqOr5RrKA7l0SU8RNtR8bIRO5R7Yb3zPhkwedSnFrTT7SG?=
 =?us-ascii?Q?2pLE2hwoXDL0LIzCp1N1BXLyOdRhEYE6N0lVpyrpX3g5b/YNF85xz0LosGek?=
 =?us-ascii?Q?2NaBRdUxySyhrog+QwnnyE93EEaw0tgwH55H0yTY7fHSrrYVrscO8PwsMhBL?=
 =?us-ascii?Q?RuYMoikTfQ8as5RwBVqRprHRft6Sk7Vqhdfj/aiHKsvuxewYrP02veTuAi/D?=
 =?us-ascii?Q?rDTwEZdr9FPi/t7TdsybSfl/Or3CYWzsDgBQuoFq7JuEWYKAmgAvRqieyKJZ?=
 =?us-ascii?Q?31R/q3nhAF6iK2Fijq/JDVxqRGLITVNiBXhth+5fPst8kK3wg6OivOHrnUvr?=
 =?us-ascii?Q?Wvu8BPD+v7B1Wu0tYIQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:16.0932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f4a201-b3e2-4d6b-0815-08de31331ec2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626
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
7. I don't know why this isn't necessary on GA102+, but GSP-RM
LIBOS args struct needs to have its 'size' field aligned to 4KB.
8. Turing Falcons do not support DMA, so PIO is used to copy images
into IMEM/DMEM.

Changes from v1:
1. Replaced pointer/length with slice in PIO code.
2. Added RFC patch to implement trait object FalconUCodeDescriptor .
3. Added comments to new registers, structs, and other places.
4. Fixed all CLIPPY complaints.
5. Added supports_dma() method for Falcon HAL
6. Renamed ImemSec and ImemNs to ImemSecure and ImemNonSecure
7. Several other miscellaneous fixes based on review comments.

Timur Tabi (13):
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
  [RFC] gpu: nova: implement trait object FalconUCodeDescriptor

 drivers/gpu/nova-core/falcon.rs           | 226 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  19 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  78 ++++++++
 drivers/gpu/nova-core/firmware.rs         | 135 ++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  46 ++++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 215 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
 drivers/gpu/nova-core/gsp/fw.rs           |   2 +-
 drivers/gpu/nova-core/regs.rs             |  73 +++++++
 drivers/gpu/nova-core/vbios.rs            |  73 ++++---
 12 files changed, 805 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
prerequisite-patch-id: fcf54aca59a74f7ca677919565b427d18406462c
-- 
2.52.0

