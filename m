Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDEC5F943
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713F610EB3C;
	Fri, 14 Nov 2025 23:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uSBu8W2C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB40110EB3C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkyuUh4iNWE3noqJ7rzAC2maw7b9Nyu0hjxE5cYgcP6X8xS/skKksMK6MphfGQuQFgFUqT2cZJpKkL9MFbVSrS05LQvFbJGDO3kPN8IhrT5m6wNefr6J4IGi4aqtIANVHEg0OaLyggHmySCr0RaMD8QVzPQYRwZVHtnY4yp3FVyj5KixRWeo1rGEMA1qMs9GsUS5sdtipr/BCkzUBs9yrfr5XLwdceEgw/OPk2Yw7tyfYY1J64pew6+gEuKsqyE10JHnJ/oMK8sNwcIXAMBneVVQVpwG0mOyJ9Kcs7qlnZhV09+qJ3p6Ug3SdNR8X4HSxyHDRpSVkOSUTQsGx/R+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laLvh7Ascd+NZka4AlnKb7hDedLKTKn22ekLwvhtCLM=;
 b=ERxHYlGK1xsTUkTpz0GujwbdnWgvXHmhKkZCr+gRdG9WSxQFoXX1FGn/76BQxrUhizG1ZssLvmv9jDBcMMq4eRPUGFl4r/mkQg+M4TejpTRJvWcJ5p06YLJmoIp6S7i8wYxDaGEsmTT8XQQiW/SGHbOpzYc1b/U/ZJpu5xIoxrSkFcxZ/xfCiguGB+00ZMTPiAsHXQG6zqhqf3dSNOJ7zWclfFQ/oczdDrrqPGc1t7vHTSxrasyI00I7+AdrAKVF7inWCc+TF0b2GehM4gRyAIUhUnx0XTt7wmDkWUnKE7VXWRWtvJrK1l3QpyuSFjFTiDChMvahkmogOrgk0r7PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laLvh7Ascd+NZka4AlnKb7hDedLKTKn22ekLwvhtCLM=;
 b=uSBu8W2CmJjl9hfUC0lFrAZvWLcRxG0kvngPoK9BRiaE75mUdvjmZKhzNuidA3hEdf9WSQoZCPRo7XgjxZXWgnKD3ZSKpqHx8F3wK7eNjl1mZZPh1yUCmfRUoYr8jN939LqJyozWLdClu/LLe9xBKkpnD5MHKBeDPch5nR+nAkY5o5LSoVIzm8vMrunzIJupNDkn8NJ5RXAIDBXb78YXuwxItiSkWs5tMjCHOJS/MRFFHggRYo0JnNMMD8yu8sTfYOfgqGIaK2jLZDoG/BpzU4BQTERLdihLjTB/A7BhZfhNTILbvwO1M7s3fwmVKAA1ihpWJRNIgHcz8Bi6w02+ew==
Received: from DS7PR03CA0156.namprd03.prod.outlook.com (2603:10b6:5:3b2::11)
 by PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:07 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::e5) by DS7PR03CA0156.outlook.office365.com
 (2603:10b6:5:3b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Fri,
 14 Nov 2025 23:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:53 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:52 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 00/11] gpu: nova-core: add Turing support
Date: Fri, 14 Nov 2025 17:30:33 -0600
Message-ID: <20251114233045.2512853-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbfa222-187b-4833-36f0-08de23d5e2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OPJEozUQ0cP3nIPSv/Ig47HOXxvdyYOMRszw0NbZOVKzw4Ue0Al2bpYFvBM4?=
 =?us-ascii?Q?H6tDvzldelNkrlws3WKgYYusaBTcXHROv0wi5lozYJYQWr94Q0SRiicYVSJg?=
 =?us-ascii?Q?3jqvhJ5OmlBTGonc/4DyIy1lV/tSvpf64ZVBbUPw42eUbACarK6IRWBYKeBv?=
 =?us-ascii?Q?z1zmt7kK7s89T8nuhtCvMnI0RwIR9x1+MW34FmlACwROh200fTNSqoSl+V6m?=
 =?us-ascii?Q?TsaS6FBhF01N0l9kVvxzr8du9nTNAlmfTAzuTSfIDNhowME2zKuQOK4Ji84G?=
 =?us-ascii?Q?aguuA4jMiG4yg0zOrUxFHJnowIsvIREAEG0A3jcj/lcBCDHPs1Y8XTEB3i35?=
 =?us-ascii?Q?ay954ozEHKYXLSfhD+VyBP0pgtGBZrpVFvT+N1iJQqGwenerwADRtQNXpsWB?=
 =?us-ascii?Q?q2T2kJM8oGY99+pl/b/wQev02n/qfPTI8XwNMwmRZoPH0eMYpjRkV6v9VqwP?=
 =?us-ascii?Q?sJPK2kWrwcLjrS+w/AdDliVXDtX2V9FHpyQz4wuHawVwnZeFT6IYi5Cankee?=
 =?us-ascii?Q?6QBLUyiNay+aBuXRHBzqk5B02PzNG0hfElKZFWvSJHu06mZZALa/t86zmA2y?=
 =?us-ascii?Q?g/zSeD/E4V9KqKil9D1AtaetUIWICRthA1e6qjTzCR/9KiiLEod8i+r1f5yY?=
 =?us-ascii?Q?1fTrRjc/HpA1c9S4qgn4UDbNgplYWT1jxWTJhMl7kNOUeCGU+75EQHC61QXT?=
 =?us-ascii?Q?nMCNeiTBEAR+2WMDhvatqU9d6Bv06h/1r4RePh5tUeUgcN/fSIOfZ1EBiRlu?=
 =?us-ascii?Q?gPjhVqngkN0U0uMjcv+gTd3dKOKyT0Rr/YzecAq7oGd/tZMh+oVihuL38RmI?=
 =?us-ascii?Q?PP3EphqeSW2xYb94TjhoDGIv+DjtRq3kc69T8wN4Q609l1nslAa01aYGSwqO?=
 =?us-ascii?Q?1iSJA4D0cI6BZqrsVreRIPkykv4V72qF7WC6KH/krYCXCPNk4b3Oh27T1O0k?=
 =?us-ascii?Q?aUafB+sZ0ljkc1wI42B9dSolbLh9a4eHRHgP7FQSfYDFp4/CYs2ap6a4knI/?=
 =?us-ascii?Q?7ELNC4Jk2wMEFKrJ98mQ3Gx9oOJxWhHT6+XfmxaXDOZ4fUYcG5cbgxmOTpAl?=
 =?us-ascii?Q?0NznhIKnf3fy8m5zpXIGXlf6f2hwLmK+kRJUDiejMS7rYNaBEwinba+p3PJe?=
 =?us-ascii?Q?nQ/2ZtChB0/bBqpKK032x5Ev7NxtV6SPuKHGF6a9dORoZjWAwRw24FCJAy6i?=
 =?us-ascii?Q?e6TjDGxZjszDtXf2KZqoNHAXByha+YY6W8/BfI1XQEGZnsKUHZX18jBjq4AR?=
 =?us-ascii?Q?k25aHvgp6Hw30C/CNNtLJATx+7yC6cjJlMBr6TbTtSMet/BmoI2RQt5Gtylq?=
 =?us-ascii?Q?L5l36uLRT/lwHZzlEyiePEJxd1IIGv7mnS4/uawbQZfkfxS3FJ4UO56he1b7?=
 =?us-ascii?Q?Xm2LT2KBVfu1RJ9BEk6rh2FecJGIwjtb+YNXSLMdAeAxAqJz6BTgDYlYFVEz?=
 =?us-ascii?Q?zFyBrMKrIbAP17wQtsGP3reJ6zt1UMl0mZOR9MyUWvHO7MkQ5eZQG6zToxB/?=
 =?us-ascii?Q?iWVWsw2+/4Q1RPNLHdaRWy0HA+Cby8D5XD2xnMJgW2uFgipcXR/iBtMYHVhU?=
 =?us-ascii?Q?iq39isVyTPZIOssXNK0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:07.1549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbfa222-187b-4833-36f0-08de23d5e2c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140
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

Timur Tabi (11):
  gpu: nova-core: rename Imem to ImemSec
  gpu: nova-core: add ImemNs section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: add Turing boot registers
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: LibosMemoryRegionInitArgument size must be page
    aligned
  gpu: nova-core: add PIO support for loading firmware images

 drivers/gpu/nova-core/falcon.rs           | 246 ++++++++++++++++++----
 drivers/gpu/nova-core/falcon/hal.rs       |  16 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  43 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  73 +++++++
 drivers/gpu/nova-core/firmware.rs         | 112 +++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  53 ++++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 187 +++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
 drivers/gpu/nova-core/gsp/fw.rs           |   2 +-
 drivers/gpu/nova-core/regs.rs             |  61 ++++++
 drivers/gpu/nova-core/vbios.rs            |  74 ++++---
 12 files changed, 768 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 38b7cc448a5b6772cad2b853a011f507ad95306a
-- 
2.51.2

