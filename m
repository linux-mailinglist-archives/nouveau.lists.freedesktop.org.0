Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A485EAB2B7F
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397AE10E292;
	Sun, 11 May 2025 21:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gZoT9tn0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0FE10E291
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaBfNIp9i3PuIqGUr+TCqEBZ9VK8eSa81fd/jT9kINrl4RrnmkrDTqqfKd0Lbsh3v8EZVtCG669CNbmaCLiwxjhllGZEy0AFVGysVrTEf4/CV9b8tNLS+3mcIFOzhHckG+8lgLpTLKRlaR+fK/7OlA1vMaObMv8h5PiSamj7LeCxLlNaqfesKkVna6ZWLyDTEJjUjXFMPdc0D/GByaQlp4c9jEdNShFnVM7GcNxjcKdjKJWWvHV68y0oumZ4JrmbxpmTEyc9bekRH2oPN0zp9p1z/kWvXr3pzsFvWv4GqMu9QhK0OpOTeNWrcUadiH82VtRADqLDtI6aMSMoEExUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szj0Zc0MF+pRuFloZgubqmJ+KnXPXyIxDPJUI4r8IkI=;
 b=kSeL3BnHR4b+QmwuWo4QsdBmGvmU2cDPoh3w2QdMMys05UZbVAJpk7EH6m7IdLNx2fclHOQpfkXYRfDZkza2Y7gYKADYl8DWNrrKU3M/1y3tFJ/2wuUCbzOYNAPjBFHwujvGor9ihair3R2z4ppsQIM7RYNo3OdajI+yR20NPoh9+dZf2QCH2UIwvjDDtXxa5DM9zjCv0Ah++bVCUB6gK6YDMJwtbb9HwkINVr62UBkBrVOJYHFqcNe4IAYbrmbL4jBqBT5GFheZzbWaOphlWdheaEgLRwLrVdGNGbECWJPEFHAJeq2VDJ6ZidcDG6TE0IeY2+gN0zL8QmQHxrkwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szj0Zc0MF+pRuFloZgubqmJ+KnXPXyIxDPJUI4r8IkI=;
 b=gZoT9tn0hSOj6/+M4xmi5Z4ibEIPxL2iaKWjfREgjmY60qMO4f0OrTj5SQAitfe/ogDfkZbLGWjsgR/9mDq9V8MWR1QWt+BgPJ0vElHkIHTiwzI1agIirzO7zcCTkPQAGYxLqnEXqRVkCo97eY7mbI9TaQoI+aFY01Mg6e1ZhMQhij00dL9tW24BSZEVZoL3Hj6Pa7QAV9L+4J79BYaUyMnU5Gh3GkPMOqcJO8Sj+O2fU93AND5HDC3TRjb9Xn5MHC3KenwCINj1u7AAEk1+HqV9/mohOSL9NXCBLRHAK2Mgy+UvfYCFJaiDtmM/F906Ow/9dzXkyFV0zyVe1TqMFw==
Received: from DM6PR10CA0013.namprd10.prod.outlook.com (2603:10b6:5:60::26) by
 DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:09:41 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::45) by DM6PR10CA0013.outlook.office365.com
 (2603:10b6:5:60::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:35 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, "Dave
 Airlie" <airlied@redhat.com>
Subject: [PATCH v2 54/62] drm/nouveau: add support for GH100
Date: Mon, 12 May 2025 07:07:14 +1000
Message-ID: <20250511210722.80350-55-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aa6ff0-6baa-4aa5-4745-08dd90d025b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ZoYTOOIkw0K++NTgJ59RBJ3nv/ptVspn0hN5lZWLC2hooFH9IFbmojRyJ6z?=
 =?us-ascii?Q?U20OyE9wfIAD+pF593nNdFGaZjySax7KpFgpTo5iCSks41Ihx30V4LxtqxKh?=
 =?us-ascii?Q?pVWIgo4fLkAS/2U4311xaRiORY+Aq1MaOQAai6WRXV38Sf3q7k+4EjhaAvvQ?=
 =?us-ascii?Q?V7fgtss4Duf7/x4U8eXaQmxK/GRQ2syGZzUZ7K9d8OtqCWiv0eMQYd8zuA2V?=
 =?us-ascii?Q?6m9y5iUmh4c+o1kL1/0hY83fzRXIZ5dTr9TT/a/+tg7kZ4+Nbk2E47ankzbS?=
 =?us-ascii?Q?5J57wPoOdEmvJ4n8Ko9ToL5lVyzKNu+vfLsMy7V9OIUUoRfjifihQys4TrHR?=
 =?us-ascii?Q?KtC4dtIYjSfD37lOdiXzojNaqQgwBPdABdY3bw44lwtKrLnc/WAnRWNh1IoF?=
 =?us-ascii?Q?WUlH5l+4dah2gOiry+wa1ItwWkh9Yxw6OLGWJu3N1l62nWEeO6fOh76b/2If?=
 =?us-ascii?Q?M1m+snPb39z+XKxFVpyqvWLDzH1E3Jf13cgo77b6gDFZ1CWBtPLvjcxQjumY?=
 =?us-ascii?Q?v94GYzlJftRRviLfk9sDK/WLOQ48iWEJz3WUVDoF7Ox661/yRbdvOZI+L2DL?=
 =?us-ascii?Q?C9D37uEqUGpC+BN0UweH7yCdY/lnlaVbcZW1YXBs6kIE2W1oIgxFVtsaF7Bk?=
 =?us-ascii?Q?tqvzQp+r0l9oyZNbj75mUVpLIQHZwpYVgMDEPhScUW7TVVsN/jpxyaImDIMz?=
 =?us-ascii?Q?nAZGudIC4+aAePD8pCmMWGQXdrqxXb+ziPM2C4nHjL3IlPYVhn8ZJsKto9g2?=
 =?us-ascii?Q?jsxhnJbouYwupcqumNFM1VcPGBW1TIRjoiF9I44Rl86IMHGdegcpTl9M0z9b?=
 =?us-ascii?Q?UIz0/q0Dtay3YO6h69/gAASAv221XioFQYlOFiCZM54vXVmiOviICwbFtrUF?=
 =?us-ascii?Q?udz7O5+UD46GfTZG/TbAWjAoe3AqNorfMUB6qw8YHq1r/+27dehAk8EZiia/?=
 =?us-ascii?Q?UOit3V1omelgds/dicpKt4MYTNEf3u2FvuW87niHT1EJUbRFztFUlwwz/+hI?=
 =?us-ascii?Q?dVjqjPOCMjFfE2deZduEWzWHbHIkE3ua/jx9+ADnuD3IV6F8QkDGkPUb759B?=
 =?us-ascii?Q?4BPk2Vj5XY5swGdBUvro2j+IqvLqkMc+sIHMcPZMXYZMEME7R3F01jFMQQz+?=
 =?us-ascii?Q?03DzgDJIWnPiyFOv15jahO3uZaz4vA4QA+6lGkOOPtta4JlmRdb1h1nvKh/5?=
 =?us-ascii?Q?HCb/ys3mpgPyoK+CEAQlDJnXdPIjH+5ypGxWCyMddnsJ2lEplftGQrqf3hyC?=
 =?us-ascii?Q?P12QPiSr7yL9pIr+fubqrfTLp7MP6WT6bPasFHAnzy0nOpg+i2GwQaUV3KhD?=
 =?us-ascii?Q?7yZ+7mBOLrMu9eEt+tklmJX4pqbdcksXo3kMR3W1m1fMrZdy5MizVog/iaLW?=
 =?us-ascii?Q?a+jyP41I0HPsFduVhs0jQqLQXIW+f/VWGl2seWDbbfmc1vDwUL/VfNIBm3rT?=
 =?us-ascii?Q?jkIx6vfv8qiSqDAzTSAtp+jyGiyZsUD51ham3cEBs9UF3fm5W4DblpbE7TJh?=
 =?us-ascii?Q?C43j0VdiAaBLyKQC8Ck+7LIZuYhB5vlC0qlN?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:41.5509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aa6ff0-6baa-4aa5-4745-08dd90d025b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
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

This commit enables basic support for Hopper GPUs, and is intended
primarily as a base supporting Blackwell GPUs, which reuse most of
the code added here.

Advanced features such as Confidential Compute are not supported.

Beyond a few miscellaneous register moves and HW class ID plumbing,
the bulk of the changes implemented here are to support the GSP-RM
boot sequence used on Hopper/Blackwell GPUs, as well as a new page
table layout.

There should be no changes here that impact prior GPUs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Co-developed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../include/nvhw/ref/gh100/dev_falcon_v4.h    |  20 +
 .../nouveau/include/nvhw/ref/gh100/dev_fb.h   |  15 +
 .../include/nvhw/ref/gh100/dev_fsp_pri.h      |  28 ++
 .../nouveau/include/nvhw/ref/gh100/dev_mmu.h  | 173 +++++++++
 .../include/nvhw/ref/gh100/dev_riscv_pri.h    |  14 +
 .../include/nvhw/ref/gh100/dev_therm.h        |  17 +
 .../include/nvhw/ref/gh100/dev_xtl_ep_pri.h   |  10 +
 .../include/nvhw/ref/gh100/pri_nv_xal_ep.h    |  13 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   9 +
 .../drm/nouveau/include/nvkm/core/device.h    |   4 +
 .../drm/nouveau/include/nvkm/core/layout.h    |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fsp.h |  22 ++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   1 +
 drivers/gpu/drm/nouveau/nvif/user.c           |   1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  18 +
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 +
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fb/gh100.c    |  30 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild    |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/base.c    |  66 ++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c   | 275 ++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/priv.h    |  28 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c   | 353 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   8 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |   1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gh100.c    |  27 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |   1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |   6 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  11 +-
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  58 +++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |  15 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   3 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |   4 +-
 .../drm/nouveau/nvkm/subdev/instmem/Kbuild    |   1 +
 .../drm/nouveau/nvkm/subdev/instmem/gh100.c   |  28 ++
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |   6 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   5 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c   |  25 ++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   7 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgh100.c    | 306 +++++++++++++++
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   3 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/gh100.c   |  30 ++
 61 files changed, 1680 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_therm.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h
new file mode 100644
index 000000000000..52171b412aa1
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_falcon_v4_h__
+#define __gh100_dev_falcon_v4_h__
+
+#define NV_PFALCON_FALCON_MAILBOX0                                                                     0x00000040     /* RW-4R */
+#define NV_PFALCON_FALCON_MAILBOX0_DATA                                                                31:0           /* RWIVF */
+#define NV_PFALCON_FALCON_MAILBOX0_DATA_INIT                                                           0x00000000     /* RWI-V */
+#define NV_PFALCON_FALCON_MAILBOX1                                                                     0x00000044     /* RW-4R */
+#define NV_PFALCON_FALCON_MAILBOX1_DATA                                                                31:0           /* RWIVF */
+#define NV_PFALCON_FALCON_MAILBOX1_DATA_INIT                                                           0x00000000     /* RWI-V */
+
+#define NV_PFALCON_FALCON_HWCFG2                                                                       0x000000f4     /* R--4R */
+#define NV_PFALCON_FALCON_HWCFG2_RISCV_BR_PRIV_LOCKDOWN                                                13:13          /* R--VF */
+#define NV_PFALCON_FALCON_HWCFG2_RISCV_BR_PRIV_LOCKDOWN_LOCK                                           0x00000001     /* R---V */
+#define NV_PFALCON_FALCON_HWCFG2_RISCV_BR_PRIV_LOCKDOWN_UNLOCK                                         0x00000000     /* R---V */
+
+#endif // __gh100_dev_falcon_v4_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h
new file mode 100644
index 000000000000..819f09465952
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_fb_h_
+#define __gh100_dev_fb_h_
+
+#define NV_PFB_NISO_FLUSH_SYSMEM_ADDR_SHIFT                       8 /*       */
+#define NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO           0x00100A34 /* RW-4R */
+#define NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR             31:0 /* RWIVF */
+#define NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI           0x00100A38 /* RW-4R */
+#define NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR             31:0 /* RWIVF */
+#define NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_MASK  0x000FFFFF /* ----V */
+
+#endif // __gh100_dev_fb_h_
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h
new file mode 100644
index 000000000000..e9507242cae5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_fsp_pri_h__
+#define __gh100_dev_fsp_pri_h__
+
+#define NV_PFSP             0x8F3FFF:0x8F0000 /* RW--D */
+
+#define NV_PFSP_MSGQ_HEAD(i)                                                                             (0x008F2c80+(i)*8) /* RW-4A */
+#define NV_PFSP_MSGQ_HEAD__SIZE_1                                                                        8              /*       */
+#define NV_PFSP_MSGQ_HEAD_VAL                                                                            31:0           /* RWIUF */
+#define NV_PFSP_MSGQ_HEAD_VAL_INIT                                                                       0x00000000     /* RWI-V */
+#define NV_PFSP_MSGQ_TAIL(i)                                                                             (0x008F2c84+(i)*8) /* RW-4A */
+#define NV_PFSP_MSGQ_TAIL__SIZE_1                                                                        8              /*       */
+#define NV_PFSP_MSGQ_TAIL_VAL                                                                            31:0           /* RWIUF */
+#define NV_PFSP_MSGQ_TAIL_VAL_INIT                                                                       0x00000000     /* RWI-V */
+
+#define NV_PFSP_QUEUE_HEAD(i)                                                                            (0x008F2c00+(i)*8) /* RW-4A */
+#define NV_PFSP_QUEUE_HEAD__SIZE_1                                                                       8              /*       */
+#define NV_PFSP_QUEUE_HEAD_ADDRESS                                                                       31:0           /* RWIVF */
+#define NV_PFSP_QUEUE_HEAD_ADDRESS_INIT                                                                  0x00000000     /* RWI-V */
+#define NV_PFSP_QUEUE_TAIL(i)                                                                            (0x008F2c04+(i)*8) /* RW-4A */
+#define NV_PFSP_QUEUE_TAIL__SIZE_1                                                                       8              /*       */
+#define NV_PFSP_QUEUE_TAIL_ADDRESS                                                                       31:0           /* RWIVF */
+#define NV_PFSP_QUEUE_TAIL_ADDRESS_INIT                                                                  0x00000000     /* RWI-V */
+
+#endif // __gh100_dev_fsp_pri_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h
new file mode 100644
index 000000000000..6707e0e3b96b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_mmu_h__
+#define __gh100_dev_mmu_h__
+
+#define NV_MMU_PTE                                                      /* ----G */
+#define NV_MMU_PTE_APERTURE                           (1*32+2):(1*32+1) /* RWXVF */
+#define NV_MMU_PTE_APERTURE_VIDEO_MEMORY                     0x00000000 /* RW--V */
+#define NV_MMU_PTE_APERTURE_PEER_MEMORY                      0x00000001 /* RW--V */
+#define NV_MMU_PTE_APERTURE_SYSTEM_COHERENT_MEMORY           0x00000002 /* RW--V */
+#define NV_MMU_PTE_APERTURE_SYSTEM_NON_COHERENT_MEMORY       0x00000003 /* RW--V */
+#define NV_MMU_PTE_KIND                              (1*32+7):(1*32+4) /* RWXVF */
+#define NV_MMU_PTE_KIND_INVALID                       0x07 /* R---V */
+#define NV_MMU_PTE_KIND_PITCH                         0x00 /* R---V */
+#define NV_MMU_PTE_KIND_GENERIC_MEMORY                                                  0x6 /* R---V */
+#define NV_MMU_PTE_KIND_Z16                                                             0x1 /* R---V */
+#define NV_MMU_PTE_KIND_S8                                                              0x2 /* R---V */
+#define NV_MMU_PTE_KIND_S8Z24                                                           0x3 /* R---V */
+#define NV_MMU_PTE_KIND_ZF32_X24S8                                                      0x4 /* R---V */
+#define NV_MMU_PTE_KIND_Z24S8                                                           0x5 /* R---V */
+#define NV_MMU_PTE_KIND_GENERIC_MEMORY_COMPRESSIBLE                                     0x8 /* R---V */
+#define NV_MMU_PTE_KIND_GENERIC_MEMORY_COMPRESSIBLE_DISABLE_PLC                         0x9 /* R---V */
+#define NV_MMU_PTE_KIND_S8_COMPRESSIBLE_DISABLE_PLC                                     0xA /* R---V */
+#define NV_MMU_PTE_KIND_Z16_COMPRESSIBLE_DISABLE_PLC                                    0xB /* R---V */
+#define NV_MMU_PTE_KIND_S8Z24_COMPRESSIBLE_DISABLE_PLC                                  0xC /* R---V */
+#define NV_MMU_PTE_KIND_ZF32_X24S8_COMPRESSIBLE_DISABLE_PLC                             0xD /* R---V */
+#define NV_MMU_PTE_KIND_Z24S8_COMPRESSIBLE_DISABLE_PLC                                  0xE /* R---V */
+#define NV_MMU_PTE_KIND_SMSKED_MESSAGE                                                  0xF /* R---V */
+
+#define NV_MMU_VER3_PDE                                                      /* ----G */
+#define NV_MMU_VER3_PDE_IS_PTE                                           0:0 /* RWXVF */
+#define NV_MMU_VER3_PDE_IS_PTE_TRUE                                      0x1 /* RW--V */
+#define NV_MMU_VER3_PDE_IS_PTE_FALSE                                     0x0 /* RW--V */
+#define NV_MMU_VER3_PDE_VALID                                            0:0 /* RWXVF */
+#define NV_MMU_VER3_PDE_VALID_TRUE                                       0x1 /* RW--V */
+#define NV_MMU_VER3_PDE_VALID_FALSE                                      0x0 /* RW--V */
+#define NV_MMU_VER3_PDE_APERTURE                                         2:1 /* RWXVF */
+#define NV_MMU_VER3_PDE_APERTURE_INVALID                          0x00000000 /* RW--V */
+#define NV_MMU_VER3_PDE_APERTURE_VIDEO_MEMORY                     0x00000001 /* RW--V */
+#define NV_MMU_VER3_PDE_APERTURE_SYSTEM_COHERENT_MEMORY           0x00000002 /* RW--V */
+#define NV_MMU_VER3_PDE_APERTURE_SYSTEM_NON_COHERENT_MEMORY       0x00000003 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF                                                                        5:3 /* RWXVF */
+#define NV_MMU_VER3_PDE_PCF_VALID_CACHED_ATS_ALLOWED__OR__INVALID_ATS_ALLOWED               0x00000000 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_CACHED_ATS_ALLOWED                                        0x00000000 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_INVALID_ATS_ALLOWED                                             0x00000000 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_UNCACHED_ATS_ALLOWED__OR__SPARSE_ATS_ALLOWED              0x00000001 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_UNCACHED_ATS_ALLOWED                                      0x00000001 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_SPARSE_ATS_ALLOWED                                              0x00000001 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_CACHED_ATS_NOT_ALLOWED__OR__INVALID_ATS_NOT_ALLOWED       0x00000002 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_CACHED_ATS_NOT_ALLOWED                                    0x00000002 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_INVALID_ATS_NOT_ALLOWED                                         0x00000002 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_UNCACHED_ATS_NOT_ALLOWED__OR__SPARSE_ATS_NOT_ALLOWED      0x00000003 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_VALID_UNCACHED_ATS_NOT_ALLOWED                                  0x00000003 /* RW--V */
+#define NV_MMU_VER3_PDE_PCF_SPARSE_ATS_NOT_ALLOWED                                          0x00000003 /* RW--V */
+#define NV_MMU_VER3_PDE_ADDRESS                                             51:12 /* RWXVF */
+#define NV_MMU_VER3_PDE_ADDRESS_SHIFT                                  0x0000000c /*       */
+#define NV_MMU_VER3_PDE__SIZE                                              8
+
+#define NV_MMU_VER3_DUAL_PDE                                                      /* ----G */
+#define NV_MMU_VER3_DUAL_PDE_IS_PTE                                           0:0 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_IS_PTE_TRUE                                      0x1 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_IS_PTE_FALSE                                     0x0 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_VALID                                            0:0 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_VALID_TRUE                                       0x1 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_VALID_FALSE                                      0x0 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_BIG                                     2:1 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_BIG_INVALID                      0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_BIG_VIDEO_MEMORY                 0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_BIG_SYSTEM_COHERENT_MEMORY       0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_BIG_SYSTEM_NON_COHERENT_MEMORY   0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG                                                                        5:3 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_CACHED_ATS_ALLOWED__OR__INVALID_ATS_ALLOWED               0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_CACHED_ATS_ALLOWED                                        0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_INVALID_ATS_ALLOWED                                             0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_UNCACHED_ATS_ALLOWED__OR__SPARSE_ATS_ALLOWED              0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_UNCACHED_ATS_ALLOWED                                      0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_SPARSE_ATS_ALLOWED                                              0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_CACHED_ATS_NOT_ALLOWED__OR__INVALID_ATS_NOT_ALLOWED       0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_CACHED_ATS_NOT_ALLOWED                                    0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_INVALID_ATS_NOT_ALLOWED                                         0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_UNCACHED_ATS_NOT_ALLOWED__OR__SPARSE_ATS_NOT_ALLOWED      0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_VALID_UNCACHED_ATS_NOT_ALLOWED                                  0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_BIG_SPARSE_ATS_NOT_ALLOWED                                          0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_ADDRESS_BIG                                     51:8 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_SMALL                                 66:65 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_SMALL_INVALID                    0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_SMALL_VIDEO_MEMORY               0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_SMALL_SYSTEM_COHERENT_MEMORY     0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_APERTURE_SMALL_SYSTEM_NON_COHERENT_MEMORY 0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL                                                                      69:67 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_CACHED_ATS_ALLOWED__OR__INVALID_ATS_ALLOWED               0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_CACHED_ATS_ALLOWED                                        0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_INVALID_ATS_ALLOWED                                             0x00000000 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_UNCACHED_ATS_ALLOWED__OR__SPARSE_ATS_ALLOWED              0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_UNCACHED_ATS_ALLOWED                                      0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_SPARSE_ATS_ALLOWED                                              0x00000001 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_CACHED_ATS_NOT_ALLOWED__OR__INVALID_ATS_NOT_ALLOWED       0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_CACHED_ATS_NOT_ALLOWED                                    0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_INVALID_ATS_NOT_ALLOWED                                         0x00000002 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_UNCACHED_ATS_NOT_ALLOWED__OR__SPARSE_ATS_NOT_ALLOWED      0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_VALID_UNCACHED_ATS_NOT_ALLOWED                                  0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_PCF_SMALL_SPARSE_ATS_NOT_ALLOWED                                          0x00000003 /* RW--V */
+#define NV_MMU_VER3_DUAL_PDE_ADDRESS_SMALL                                 115:76 /* RWXVF */
+#define NV_MMU_VER3_DUAL_PDE_ADDRESS_SHIFT                             0x0000000c /*       */
+#define NV_MMU_VER3_DUAL_PDE_ADDRESS_BIG_SHIFT 8 /*       */
+#define NV_MMU_VER3_DUAL_PDE__SIZE                                             16
+
+#define NV_MMU_VER3_PTE                                                      /* ----G */
+#define NV_MMU_VER3_PTE_VALID                                            0:0 /* RWXVF */
+#define NV_MMU_VER3_PTE_VALID_TRUE                                       0x1 /* RW--V */
+#define NV_MMU_VER3_PTE_VALID_FALSE                                      0x0 /* RW--V */
+#define NV_MMU_VER3_PTE_APERTURE                                         2:1 /* RWXVF */
+#define NV_MMU_VER3_PTE_APERTURE_VIDEO_MEMORY                     0x00000000 /* RW--V */
+#define NV_MMU_VER3_PTE_APERTURE_PEER_MEMORY                      0x00000001 /* RW--V */
+#define NV_MMU_VER3_PTE_APERTURE_SYSTEM_COHERENT_MEMORY           0x00000002 /* RW--V */
+#define NV_MMU_VER3_PTE_APERTURE_SYSTEM_NON_COHERENT_MEMORY       0x00000003 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF                                                                        7:3 /* RWXVF */
+#define NV_MMU_VER3_PTE_PCF_INVALID                                                         0x00000000 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_SPARSE                                                          0x00000001 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_MAPPING_NOWHERE                                                 0x00000002 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_NO_VALID_4KB_PAGE                                               0x00000003 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_CACHED_ACE                                    0x00000000 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_UNCACHED_ACE                                  0x00000001 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_CACHED_ACE                                  0x00000002 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_UNCACHED_ACE                                0x00000003 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_CACHED_ACE                                    0x00000004 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_UNCACHED_ACE                                   0x00000005 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_CACHED_ACE                                  0x00000006 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_UNCACHED_ACE                                0x00000007 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_NO_ATOMIC_CACHED_ACE                                 0x00000008 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_NO_ATOMIC_UNCACHED_ACE                               0x00000009 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_NO_ATOMIC_CACHED_ACE                               0x0000000A /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_NO_ATOMIC_UNCACHED_ACE                             0x0000000B /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_NO_ATOMIC_CACHED_ACE                                 0x0000000C /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_NO_ATOMIC_UNCACHED_ACE                               0x0000000D /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_NO_ATOMIC_CACHED_ACE                               0x0000000E /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_NO_ATOMIC_UNCACHED_ACE                             0x0000000F /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_CACHED_ACD                                    0x00000010 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_UNCACHED_ACD                                  0x00000011 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_CACHED_ACD                                  0x00000012 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_UNCACHED_ACD                                0x00000013 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_CACHED_ACD                                    0x00000014 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_UNCACHED_ACD                                  0x00000015 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_CACHED_ACD                                  0x00000016 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_UNCACHED_ACD                                0x00000017 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_NO_ATOMIC_CACHED_ACD                                 0x00000018 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RW_NO_ATOMIC_UNCACHED_ACD                               0x00000019 /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_NO_ATOMIC_CACHED_ACD                               0x0000001A /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_NO_ATOMIC_UNCACHED_ACD                             0x0000001B /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_NO_ATOMIC_CACHED_ACD                                 0x0000001C /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_REGULAR_RO_NO_ATOMIC_UNCACHED_ACD                               0x0000001D /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_NO_ATOMIC_CACHED_ACD                               0x0000001E /* RW--V */
+#define NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_NO_ATOMIC_UNCACHED_ACD                             0x0000001F /* RW--V */
+#define NV_MMU_VER3_PTE_KIND                                           11:8 /* RWXVF */
+#define NV_MMU_VER3_PTE_ADDRESS                                         51:12 /* RWXVF */
+#define NV_MMU_VER3_PTE_ADDRESS_SYS                                     51:12 /* RWXVF */
+#define NV_MMU_VER3_PTE_ADDRESS_PEER                                    51:12 /* RWXVF */
+#define NV_MMU_VER3_PTE_ADDRESS_VID                                     39:12 /* RWXVF */
+#define NV_MMU_VER3_PTE_PEER_ID                63:(64-3) /* RWXVF */
+#define NV_MMU_VER3_PTE_PEER_ID_0                                 0x00000000 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_1                                 0x00000001 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_2                                 0x00000002 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_3                                 0x00000003 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_4                                 0x00000004 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_5                                 0x00000005 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_6                                 0x00000006 /* RW--V */
+#define NV_MMU_VER3_PTE_PEER_ID_7                                 0x00000007 /* RW--V */
+#define NV_MMU_VER3_PTE_ADDRESS_SHIFT                             0x0000000c /*       */
+#define NV_MMU_VER3_PTE__SIZE                                              8
+
+#endif // __gh100_dev_mmu_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h
new file mode 100644
index 000000000000..8ff4663168d2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_riscv_pri_h__
+#define __gh100_dev_riscv_pri_h__
+
+#define NV_PRISCV_RISCV_CPUCTL                                                                         0x00000388     /* RW-4R */
+#define NV_PRISCV_RISCV_CPUCTL_HALTED                                                                  4:4            /* R-IVF */
+#define NV_PRISCV_RISCV_CPUCTL_HALTED_INIT                                                             0x00000001     /* R-I-V */
+#define NV_PRISCV_RISCV_CPUCTL_HALTED_TRUE                                                             0x00000001     /* R---V */
+#define NV_PRISCV_RISCV_CPUCTL_HALTED_FALSE                                                            0x00000000     /* R---V */
+
+#endif // __gh100_dev_riscv_pri_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_therm.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_therm.h
new file mode 100644
index 000000000000..49b4816cb00b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_therm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_therm_h__
+#define __gh100_dev_therm_h__
+
+#define NV_THERM_I2CS_SCRATCH                                                  0x000200bc /* RW-4R */
+#define NV_THERM_I2CS_SCRATCH_DATA                                                   31:0 /* RWIVF */
+#define NV_THERM_I2CS_SCRATCH_DATA_INIT                                        0x00000000 /* RWI-V */
+
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE                                   NV_THERM_I2CS_SCRATCH
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS                                             31:0
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS                               0x000000FF
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_FAILED                                0x00000000
+
+#endif // __gh100_dev_therm_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h
new file mode 100644
index 000000000000..12b49e9894a2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_dev_xtl_ep_pri_h__
+#define __gh100_dev_xtl_ep_pri_h__
+
+#define NV_EP_PCFGM                                                              0x92FFF:0x92000        /* RW--D */
+
+#endif // __gh100_dev_xtl_ep_pri_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h
new file mode 100644
index 000000000000..1a891bd33fa3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gh100_pri_nv_xal_ep_h__
+#define __gh100_pri_nv_xal_ep_h__
+
+#define NV_XAL_EP_BAR0_WINDOW_BASE_SHIFT                                         0x000010
+#define NV_XAL_EP_BAR0_WINDOW_BASE                                                   21:0
+#define NV_XAL_EP_BAR0_WINDOW                                                  0x0010fd40
+
+#endif // __gh100_pri_nv_xal_ep_h__
+
diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index bad124c15a5b..96d6e6aab6ff 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -29,6 +29,7 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_TURING                                           0x0c
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
 #define NV_DEVICE_INFO_V0_ADA                                              0x0e
+#define NV_DEVICE_INFO_V0_HOPPER                                           0x0f
 	__u8  family;
 	__u8  gsp_rm;
 	__u8  pad07;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 71a2a53bff7f..83acf367a65c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -63,6 +63,7 @@
 #define VOLTA_USERMODE_A                                             0x0000c361
 #define TURING_USERMODE_A                                            0x0000c461
 #define AMPERE_USERMODE_A                                            0x0000c561
+#define HOPPER_USERMODE_A                                            0x0000c661
 
 #define MAXWELL_FAULT_BUFFER_A                        /* clb069.h */ 0x0000b069
 #define VOLTA_FAULT_BUFFER_A                          /* clb069.h */ 0x0000c369
@@ -85,6 +86,7 @@
 #define TURING_CHANNEL_GPFIFO_A                       /* if0020.h */ 0x0000c46f
 #define AMPERE_CHANNEL_GPFIFO_A                       /* if0020.h */ 0x0000c56f
 #define AMPERE_CHANNEL_GPFIFO_B                       /* if0020.h */ 0x0000c76f
+#define HOPPER_CHANNEL_GPFIFO_A                                      0x0000c86f
 
 #define NV50_DISP                                     /* if0010.h */ 0x00005070
 #define G82_DISP                                      /* if0010.h */ 0x00008270
@@ -194,8 +196,11 @@
 
 #define ADA_A                                         /* cl9097.h */ 0x0000c997
 
+#define HOPPER_A                                                     0x0000cb97
+
 #define NV74_BSP                                                     0x000074b0
 
+#define NVB8B0_VIDEO_DECODER                                         0x0000b8b0
 #define NVC4B0_VIDEO_DECODER                                         0x0000c4b0
 #define NVC6B0_VIDEO_DECODER                                         0x0000c6b0
 #define NVC7B0_VIDEO_DECODER                                         0x0000c7b0
@@ -228,6 +233,7 @@
 #define TURING_DMA_COPY_A                                            0x0000c5b5
 #define AMPERE_DMA_COPY_A                                            0x0000c6b5
 #define AMPERE_DMA_COPY_B                                            0x0000c7b5
+#define HOPPER_DMA_COPY_A                                            0x0000c8b5
 
 #define NVC4B7_VIDEO_ENCODER                                         0x0000c4b7
 #define NVC7B7_VIDEO_ENCODER                                         0x0000c7b7
@@ -250,12 +256,15 @@
 #define AMPERE_COMPUTE_A                                             0x0000c6c0
 #define AMPERE_COMPUTE_B                                             0x0000c7c0
 #define ADA_COMPUTE_A                                                0x0000c9c0
+#define HOPPER_COMPUTE_A                                             0x0000cbc0
 
 #define NV74_CIPHER                                                  0x000074c1
 
+#define NVB8D1_VIDEO_NVJPG                                           0x0000b8d1
 #define NVC4D1_VIDEO_NVJPG                                           0x0000c4d1
 #define NVC9D1_VIDEO_NVJPG                                           0x0000c9d1
 
+#define NVB8FA_VIDEO_OFA                                             0x0000b8fa
 #define NVC6FA_VIDEO_OFA                                             0x0000c6fa
 #define NVC7FA_VIDEO_OFA                                             0x0000c7fa
 #define NVC9FA_VIDEO_OFA                                             0x0000c9fa
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index f50f52d4dc3f..926542350abc 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -46,6 +46,7 @@ struct nvkm_device {
 		GV100    = 0x140,
 		TU100    = 0x160,
 		GA100    = 0x170,
+		GH100    = 0x180,
 		AD100    = 0x190,
 	} card_type;
 	u32 chipset;
@@ -131,6 +132,9 @@ struct nvkm_device *nvkm_device_find(u64 name);
 	_temp;                                                                 \
 })
 
+#define NVKM_RD32_(p,o,dr) nvkm_rd32((p), (o) + (dr))
+#define NVKM_RD32(p,A...) DRF_RV(NVKM_RD32_, (p), 0, ##A)
+
 void nvkm_device_del(struct nvkm_device **);
 
 struct nvkm_device_oclass {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 2debef27bd95..d92ffd17b729 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: MIT */
+NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FSP     , struct nvkm_fsp     ,      fsp)
 NVKM_LAYOUT_ONCE(NVKM_SUBDEV_GSP     , struct nvkm_gsp     ,      gsp)
 NVKM_LAYOUT_ONCE(NVKM_SUBDEV_TOP     , struct nvkm_top     ,      top)
 NVKM_LAYOUT_ONCE(NVKM_SUBDEV_VFN     , struct nvkm_vfn     ,      vfn)
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index 5b798a1a313d..c114903ce388 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -102,6 +102,7 @@ int gv100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int tu102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int ga100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int ga102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
+int gh100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 
 #include <subdev/bios.h>
 #include <subdev/bios/ramcfg.h>
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
new file mode 100644
index 000000000000..2a8c1d5a65f9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_FSP_H__
+#define __NVKM_FSP_H__
+#include <core/subdev.h>
+#include <core/falcon.h>
+
+struct nvkm_fsp {
+	const struct nvkm_fsp_func *func;
+	struct nvkm_subdev subdev;
+
+	struct nvkm_falcon falcon;
+};
+
+bool nvkm_fsp_verify_gsp_fmc(struct nvkm_fsp *, u32 hash_size, u32 pkey_size, u32 sig_size);
+int nvkm_fsp_boot_gsp_fmc(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool resume,
+			  u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig);
+
+int gh100_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 087a3e1d1811..e2b97c6b9afe 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -68,6 +68,9 @@ struct nvkm_gsp {
 			const struct firmware *load;
 			const struct firmware *unload;
 		} booter;
+
+		const struct firmware *fmc;
+
 		const struct firmware *bl;
 		const struct firmware *rm;
 	} fws;
@@ -113,6 +116,15 @@ struct nvkm_gsp {
 		struct nvkm_falcon_fw unload;
 	} booter;
 
+	struct {
+		struct nvkm_gsp_mem fw;
+		u8 *hash;
+		u8 *pkey;
+		u8 *sig;
+
+		struct nvkm_gsp_mem args;
+	} fmc;
+
 	struct {
 		struct nvkm_gsp_mem fw;
 		u32 code_offset;
@@ -491,5 +503,6 @@ int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_
 int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ga100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ga102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
+int gh100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ad102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index 7d93c742ee59..db835cf7b8ac 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -36,4 +36,5 @@ int nv04_instmem_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nv
 int nv40_instmem_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_instmem **);
 int nv50_instmem_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_instmem **);
 int gk20a_instmem_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_instmem **);
+int gh100_instmem_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_instmem **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 1e461d3b53e6..ced7c3721506 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -167,4 +167,5 @@ int gp100_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct
 int gp10b_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
 int gv100_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
 int tu102_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
+int gh100_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
index 3c103101d5fc..112b674ed9c8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h
@@ -50,6 +50,7 @@ int gf100_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct
 int gf106_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int gk104_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 int gp100_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
+int gh100_pci_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pci **);
 
 /* pcie functions */
 int nvkm_pcie_set_link(struct nvkm_pci *, enum nvkm_pcie_speed, u8 width);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9ab8380feb39..fbe0144927e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -923,6 +923,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 			    struct ttm_resource *, struct ttm_resource *);
 		int (*init)(struct nouveau_channel *, u32 handle);
 	} _methods[] = {
+		{  "COPY", 4, 0xc8b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc7b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "GRCE", 0, 0xc7b5, nve0_bo_move_copy, nvc0_bo_move_init },
 		{  "COPY", 4, 0xc6b5, nve0_bo_move_copy, nve0_bo_move_init },
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 5bcd29809c1e..a14aa6715bb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -255,6 +255,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
 	const struct nvif_mclass hosts[] = {
+		{  HOPPER_CHANNEL_GPFIFO_A, 0 },
 		{  AMPERE_CHANNEL_GPFIFO_B, 0 },
 		{  AMPERE_CHANNEL_GPFIFO_A, 0 },
 		{  TURING_CHANNEL_GPFIFO_A, 0 },
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e7544942791d..5b6bb4c2f78b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -509,6 +509,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		case TURING_CHANNEL_GPFIFO_A:
 		case AMPERE_CHANNEL_GPFIFO_A:
 		case AMPERE_CHANNEL_GPFIFO_B:
+		case HOPPER_CHANNEL_GPFIFO_A:
 			ret = gv100_fence_create(drm);
 			break;
 		default:
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index b648a5e036af..ae470a1fdfb8 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -41,6 +41,7 @@ nvif_user_ctor(struct nvif_device *device, const char *name)
 		int version;
 		const struct nvif_user_func *func;
 	} users[] = {
+		{ HOPPER_USERMODE_A, -1, &nvif_userc361 },
 		{ AMPERE_USERMODE_A, -1, &nvif_userc361 },
 		{ TURING_USERMODE_A, -1, &nvif_userc361 },
 		{  VOLTA_USERMODE_A, -1, &nvif_userc361 },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index ebcaf2ecff48..5082fe5f1966 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2681,6 +2681,22 @@ nv177_chipset = {
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
+static const struct nvkm_device_chip
+nv180_chipset = {
+	.name = "GH100",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fault    = { 0x00000001, tu102_fault_new },
+	.fb       = { 0x00000001, gh100_fb_new },
+	.fsp      = { 0x00000001, gh100_fsp_new },
+	.gsp      = { 0x00000001, gh100_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
 static const struct nvkm_device_chip
 nv192_chipset = {
 	.name = "AD102",
@@ -3101,6 +3117,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x140: device->card_type = GV100; break;
 		case 0x160: device->card_type = TU100; break;
 		case 0x170: device->card_type = GA100; break;
+		case 0x180: device->card_type = GH100; break;
 		case 0x190: device->card_type = AD100; break;
 		default:
 			break;
@@ -3204,6 +3221,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x174: device->chip = &nv174_chipset; break;
 	case 0x176: device->chip = &nv176_chipset; break;
 	case 0x177: device->chip = &nv177_chipset; break;
+	case 0x180: device->chip = &nv180_chipset; break;
 	case 0x192: device->chip = &nv192_chipset; break;
 	case 0x193: device->chip = &nv193_chipset; break;
 	case 0x194: device->chip = &nv194_chipset; break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index 8da5e896dd74..75ee7506d443 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -11,6 +11,7 @@
 #include <subdev/devinit.h>
 #include <subdev/fault.h>
 #include <subdev/fb.h>
+#include <subdev/fsp.h>
 #include <subdev/fuse.h>
 #include <subdev/gpio.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index cc104b684701..a3f6b8f48266 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -148,6 +148,7 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 	case TU100: args->v0.family = NV_DEVICE_INFO_V0_TURING; break;
 	case GA100: args->v0.family = NV_DEVICE_INFO_V0_AMPERE; break;
 	case AD100: args->v0.family = NV_DEVICE_INFO_V0_ADA; break;
+	case GH100: args->v0.family = NV_DEVICE_INFO_V0_HOPPER; break;
 	default:
 		args->v0.family = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild
index 4c2f6fc4ef58..c19ea4ea9bd3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild
@@ -9,6 +9,7 @@ include $(src)/nvkm/subdev/fault/Kbuild
 include $(src)/nvkm/subdev/fb/Kbuild
 include $(src)/nvkm/subdev/fuse/Kbuild
 include $(src)/nvkm/subdev/gpio/Kbuild
+include $(src)/nvkm/subdev/fsp/Kbuild
 include $(src)/nvkm/subdev/gsp/Kbuild
 include $(src)/nvkm/subdev/i2c/Kbuild
 include $(src)/nvkm/subdev/iccsense/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index d1611ad3bf81..f13312934131 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -35,6 +35,7 @@ nvkm-y += nvkm/subdev/fb/gv100.o
 nvkm-y += nvkm/subdev/fb/tu102.o
 nvkm-y += nvkm/subdev/fb/ga100.o
 nvkm-y += nvkm/subdev/fb/ga102.o
+nvkm-y += nvkm/subdev/fb/gh100.o
 
 nvkm-y += nvkm/subdev/fb/r535.o
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
index 25f82b372bca..2819780050d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
@@ -25,7 +25,7 @@
 #include <subdev/gsp.h>
 #include <engine/nvdec.h>
 
-static u64
+u64
 ga102_fb_vidmem_size(struct nvkm_fb *fb)
 {
 	return (u64)nvkm_rd32(fb->subdev.device, 0x1183a4) << 20;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
new file mode 100644
index 000000000000..2d8c51f882d5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gh100/dev_fb.h>
+
+static void
+gh100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
+{
+	const u64 addr = fb->sysmem.flush_page_addr >> NV_PFB_NISO_FLUSH_SYSMEM_ADDR_SHIFT;
+	struct nvkm_device *device = fb->subdev.device;
+
+	nvkm_wr32(device, NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI, upper_32_bits(addr));
+	nvkm_wr32(device, NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO, lower_32_bits(addr));
+}
+
+static const struct nvkm_fb_func
+gh100_fb = {
+	.sysmem.flush_page_init = gh100_fb_sysmem_flush_page_init,
+	.vidmem.size = ga102_fb_vidmem_size,
+};
+
+int
+gh100_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
+{
+	return r535_fb_new(&gh100_fb, device, type, inst, pfb);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
index 35c55dfba23d..ebe996503ab2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
@@ -98,4 +98,6 @@ int gp102_fb_vpr_scrub(struct nvkm_fb *);
 int gv100_fb_init_page(struct nvkm_fb *);
 
 bool tu102_fb_vpr_scrub_required(struct nvkm_fb *);
+
+u64 ga102_fb_vidmem_size(struct nvkm_fb *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
new file mode 100644
index 000000000000..ff04992b181d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+
+nvkm-y += nvkm/subdev/fsp/base.o
+nvkm-y += nvkm/subdev/fsp/gh100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c
new file mode 100644
index 000000000000..e366a980baa9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+int
+nvkm_fsp_boot_gsp_fmc(struct nvkm_fsp *fsp, u64 args_addr, u32 rsvd_size, bool resume,
+		      u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig)
+{
+	return fsp->func->cot.boot_gsp_fmc(fsp, args_addr, rsvd_size, resume,
+					   img_addr, hash, pkey, sig);
+}
+
+bool
+nvkm_fsp_verify_gsp_fmc(struct nvkm_fsp *fsp, u32 hash_size, u32 pkey_size, u32 sig_size)
+{
+	return hash_size == fsp->func->cot.size_hash &&
+	       pkey_size == fsp->func->cot.size_pkey &&
+	        sig_size == fsp->func->cot.size_sig;
+}
+
+static int
+nvkm_fsp_preinit(struct nvkm_subdev *subdev)
+{
+	struct nvkm_fsp *fsp = nvkm_fsp(subdev);
+
+	return fsp->func->wait_secure_boot(fsp);
+}
+
+static void *
+nvkm_fsp_dtor(struct nvkm_subdev *subdev)
+{
+	struct nvkm_fsp *fsp = nvkm_fsp(subdev);
+
+	nvkm_falcon_dtor(&fsp->falcon);
+	return fsp;
+}
+
+static const struct nvkm_falcon_func
+nvkm_fsp_flcn = {
+	.emem_pio = &gp102_flcn_emem_pio,
+};
+
+static const struct nvkm_subdev_func
+nvkm_fsp = {
+	.dtor = nvkm_fsp_dtor,
+	.preinit = nvkm_fsp_preinit,
+};
+
+int
+nvkm_fsp_new_(const struct nvkm_fsp_func *func,
+	      struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_fsp **pfsp)
+{
+	struct nvkm_fsp *fsp;
+
+	fsp = *pfsp = kzalloc(sizeof(*fsp), GFP_KERNEL);
+	if (!fsp)
+		return -ENOMEM;
+
+	fsp->func = func;
+	nvkm_subdev_ctor(&nvkm_fsp, device, type, inst, &fsp->subdev);
+
+	return nvkm_falcon_ctor(&nvkm_fsp_flcn, &fsp->subdev, "fsp", 0x8f2000, &fsp->falcon);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
new file mode 100644
index 000000000000..9f4285af3fed
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
@@ -0,0 +1,275 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gh100/dev_fsp_pri.h>
+#include <nvhw/ref/gh100/dev_therm.h>
+
+#include <nvrm/nvtypes.h>
+
+#define MCTP_HEADER_VERSION          3:0
+#define MCTP_HEADER_RSVD             7:4
+
+#define MCTP_HEADER_DEID            15:8
+#define MCTP_HEADER_SEID            23:16
+
+#define MCTP_HEADER_TAG             26:24
+#define MCTP_HEADER_TO              27:27
+#define MCTP_HEADER_SEQ             29:28
+#define MCTP_HEADER_EOM             30:30
+#define MCTP_HEADER_SOM             31:31
+
+#define MCTP_MSG_HEADER_TYPE         6:0
+#define MCTP_MSG_HEADER_IC           7:7
+
+#define MCTP_MSG_HEADER_VENDOR_ID   23:8
+#define MCTP_MSG_HEADER_NVDM_TYPE   31:24
+
+#define MCTP_MSG_HEADER_TYPE_VENDOR_PCI 0x7e
+#define MCTP_MSG_HEADER_VENDOR_ID_NV    0x10de
+
+#define NVDM_TYPE_COT                   0x14
+#define NVDM_TYPE_FSP_RESPONSE          0x15
+
+#pragma pack(1)
+typedef struct nvdm_payload_cot
+{
+    NvU16 version;
+    NvU16 size;
+    NvU64 gspFmcSysmemOffset;
+    NvU64 frtsSysmemOffset;
+    NvU32 frtsSysmemSize;
+
+    // Note this is an offset from the end of FB
+    NvU64 frtsVidmemOffset;
+    NvU32 frtsVidmemSize;
+
+    // Authentication related fields
+    NvU32 hash384[12];
+    NvU32 publicKey[96];
+    NvU32 signature[96];
+
+    NvU64 gspBootArgsSysmemOffset;
+} NVDM_PAYLOAD_COT;
+#pragma pack()
+
+#pragma pack(1)
+typedef struct
+{
+    NvU32 taskId;
+    NvU32 commandNvdmType;
+    NvU32 errorCode;
+} NVDM_PAYLOAD_COMMAND_RESPONSE;
+#pragma pack()
+
+static u32
+gh100_fsp_poll(struct nvkm_fsp *fsp)
+{
+	struct nvkm_device *device = fsp->subdev.device;
+	u32 head, tail;
+
+	head = nvkm_rd32(device, NV_PFSP_MSGQ_HEAD(0));
+	tail = nvkm_rd32(device, NV_PFSP_MSGQ_TAIL(0));
+
+	if (head == tail)
+		return 0;
+
+	return (tail - head) + sizeof(u32); /* TAIL points at last DWORD written. */
+}
+
+static int
+gh100_fsp_recv(struct nvkm_fsp *fsp, u8 *packet, u32 max_packet_size)
+{
+	struct nvkm_device *device = fsp->subdev.device;
+	u32 packet_size;
+	int ret;
+
+	packet_size = gh100_fsp_poll(fsp);
+	if (!packet_size || WARN_ON(packet_size % 4 || packet_size > max_packet_size))
+		return -EINVAL;
+
+	ret = nvkm_falcon_pio_rd(&fsp->falcon, 0, EMEM, 0, packet, 0, packet_size);
+	if (ret)
+		return ret;
+
+	nvkm_wr32(device, NV_PFSP_MSGQ_TAIL(0), 0);
+	nvkm_wr32(device, NV_PFSP_MSGQ_HEAD(0), 0);
+
+	return packet_size;
+}
+
+static int
+gh100_fsp_wait(struct nvkm_fsp *fsp)
+{
+	int time = 1000;
+
+	do {
+		if (gh100_fsp_poll(fsp))
+			return 0;
+
+		usleep_range(1000, 2000);
+	} while(time--);
+
+	return -ETIMEDOUT;
+}
+
+static int
+gh100_fsp_send(struct nvkm_fsp *fsp, const u8 *packet, u32 packet_size)
+{
+	struct nvkm_device *device = fsp->subdev.device;
+	int time = 1000, ret;
+
+	if (WARN_ON(packet_size % sizeof(u32)))
+		return -EINVAL;
+
+	/* Ensure any previously sent message has been consumed. */
+	do {
+		u32 head = nvkm_rd32(device, NV_PFSP_QUEUE_HEAD(0));
+		u32 tail = nvkm_rd32(device, NV_PFSP_QUEUE_TAIL(0));
+
+		if (tail == head)
+			break;
+
+		usleep_range(1000, 2000);
+	} while(time--);
+
+	if (time < 0)
+		return -ETIMEDOUT;
+
+	/* Write message to EMEM. */
+	ret = nvkm_falcon_pio_wr(&fsp->falcon, packet, 0, 0, EMEM, 0, packet_size, 0, false);
+	if (ret)
+		return ret;
+
+	/* Update queue pointers - TAIL points at last DWORD written. */
+	nvkm_wr32(device, NV_PFSP_QUEUE_TAIL(0), packet_size - sizeof(u32));
+	nvkm_wr32(device, NV_PFSP_QUEUE_HEAD(0), 0);
+	return 0;
+}
+
+static int
+gh100_fsp_send_sync(struct nvkm_fsp *fsp, u8 nvdm_type, const u8 *packet, u32 packet_size)
+{
+	struct nvkm_subdev *subdev = &fsp->subdev;
+	struct {
+		u32 mctp_header;
+		u32 nvdm_header;
+		NVDM_PAYLOAD_COMMAND_RESPONSE response;
+	} reply;
+	int ret;
+
+	ret = gh100_fsp_send(fsp, packet, packet_size);
+	if (ret)
+		return ret;
+
+	ret = gh100_fsp_wait(fsp);
+	if (ret)
+		return ret;
+
+	ret = gh100_fsp_recv(fsp, (u8 *)&reply, sizeof(reply));
+	if (ret < 0)
+		return ret;
+
+	if (NVVAL_TEST(reply.mctp_header, MCTP, HEADER, SOM, !=, 1) ||
+	    NVVAL_TEST(reply.mctp_header, MCTP, HEADER, EOM, !=, 1)) {
+		nvkm_error(subdev, "unexpected MCTP header in reply: 0x%08x\n", reply.mctp_header);
+		return -EIO;
+	}
+
+	if (NVDEF_TEST(reply.nvdm_header, MCTP, MSG_HEADER, TYPE, !=, VENDOR_PCI) ||
+	    NVDEF_TEST(reply.nvdm_header, MCTP, MSG_HEADER, VENDOR_ID, !=, NV) ||
+	    NVVAL_TEST(reply.nvdm_header, MCTP, MSG_HEADER, NVDM_TYPE, !=, NVDM_TYPE_FSP_RESPONSE)) {
+		nvkm_error(subdev, "unexpected NVDM header in reply: 0x%08x\n", reply.nvdm_header);
+		return -EIO;
+	}
+
+	if (reply.response.commandNvdmType != nvdm_type) {
+		nvkm_error(subdev, "expected NVDM type 0x%02x in reply, got 0x%02x\n",
+			   nvdm_type, reply.response.commandNvdmType);
+		return -EIO;
+	}
+
+	if (reply.response.errorCode) {
+		nvkm_error(subdev, "NVDM command 0x%02x failed with error 0x%08x\n",
+			   nvdm_type, reply.response.errorCode);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int
+gh100_fsp_boot_gsp_fmc(struct nvkm_fsp *fsp, u64 args_addr, u32 rsvd_size, bool resume,
+		       u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig)
+{
+	struct {
+		u32 mctp_header;
+		u32 nvdm_header;
+		NVDM_PAYLOAD_COT cot;
+	} msg = {};
+
+	msg.mctp_header = NVVAL(MCTP, HEADER, SOM, 1) |
+			  NVVAL(MCTP, HEADER, EOM, 1) |
+			  NVVAL(MCTP, HEADER, SEID, 0) |
+			  NVVAL(MCTP, HEADER, SEQ, 0);
+
+	msg.nvdm_header = NVDEF(MCTP, MSG_HEADER, TYPE, VENDOR_PCI) |
+			  NVDEF(MCTP, MSG_HEADER, VENDOR_ID, NV) |
+			  NVVAL(MCTP, MSG_HEADER, NVDM_TYPE, NVDM_TYPE_COT);
+
+	msg.cot.version = fsp->func->cot.version;
+	msg.cot.size = sizeof(msg.cot);
+	msg.cot.gspFmcSysmemOffset = img_addr;
+	if (!resume) {
+		msg.cot.frtsVidmemOffset = ALIGN(rsvd_size, 0x200000);
+		msg.cot.frtsVidmemSize = 0x100000;
+	}
+
+	memcpy(msg.cot.hash384, hash, fsp->func->cot.size_hash);
+	memcpy(msg.cot.publicKey, pkey, fsp->func->cot.size_pkey);
+	memcpy(msg.cot.signature, sig, fsp->func->cot.size_sig);
+
+	msg.cot.gspBootArgsSysmemOffset = args_addr;
+
+	return gh100_fsp_send_sync(fsp, NVDM_TYPE_COT, (const u8 *)&msg, sizeof(msg));
+}
+
+static int
+gh100_fsp_wait_secure_boot(struct nvkm_fsp *fsp)
+{
+	struct nvkm_device *device = fsp->subdev.device;
+	unsigned timeout_ms = 4000;
+
+	do {
+		u32 status = NVKM_RD32(device, NV_THERM, I2CS_SCRATCH, FSP_BOOT_COMPLETE_STATUS);
+
+		if (status == NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS)
+			return 0;
+
+		usleep_range(1000, 2000);
+	} while (timeout_ms--);
+
+	return -ETIMEDOUT;
+}
+
+static const struct nvkm_fsp_func
+gh100_fsp = {
+	.wait_secure_boot = gh100_fsp_wait_secure_boot,
+	.cot = {
+		.version = 1,
+		.size_hash = 48,
+		.size_pkey = 384,
+		.size_sig = 384,
+		.boot_gsp_fmc = gh100_fsp_boot_gsp_fmc,
+	},
+};
+
+int
+gh100_fsp_new(struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, struct nvkm_fsp **pfsp)
+{
+	return nvkm_fsp_new_(&gh100_fsp, device, type, inst, pfsp);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
new file mode 100644
index 000000000000..91517f3dedfb
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_FSP_PRIV_H__
+#define __NVKM_FSP_PRIV_H__
+#define nvkm_fsp(p) container_of((p), struct nvkm_fsp, subdev)
+#include <subdev/fsp.h>
+
+struct nvkm_fsp_func {
+	int (*wait_secure_boot)(struct nvkm_fsp *);
+
+	struct {
+		u32 version;
+		u32 size_hash;
+		u32 size_pkey;
+		u32 size_sig;
+		int (*boot_gsp_fmc)(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool resume,
+				    u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig);
+	} cot;
+};
+
+int nvkm_fsp_new_(const struct nvkm_fsp_func *,
+		  struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
+
+int gh100_fsp_boot_gsp_fmc(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool resume,
+			   u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index ba892c111c26..3c6c1309c4b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -7,6 +7,7 @@ nvkm-y += nvkm/subdev/gsp/tu102.o
 nvkm-y += nvkm/subdev/gsp/tu116.o
 nvkm-y += nvkm/subdev/gsp/ga100.o
 nvkm-y += nvkm/subdev/gsp/ga102.o
+nvkm-y += nvkm/subdev/gsp/gh100.o
 nvkm-y += nvkm/subdev/gsp/ad102.o
 
 include $(src)/nvkm/subdev/gsp/rm/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 3a452349afde..d23243a83a4c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -83,6 +83,8 @@ nvkm_gsp_oneinit(struct nvkm_subdev *subdev)
 void
 nvkm_gsp_dtor_fws(struct nvkm_gsp *gsp)
 {
+	nvkm_firmware_put(gsp->fws.fmc);
+	gsp->fws.fmc = NULL;
 	nvkm_firmware_put(gsp->fws.bl);
 	gsp->fws.bl = NULL;
 	nvkm_firmware_put(gsp->fws.booter.unload);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
new file mode 100644
index 000000000000..3ad71696c111
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -0,0 +1,353 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <linux/elf.h>
+#include <linux/crc32.h>
+
+#include <subdev/fb.h>
+#include <subdev/fsp.h>
+
+#include <rm/r570/nvrm/gsp.h>
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gh100/dev_falcon_v4.h>
+#include <nvhw/ref/gh100/dev_riscv_pri.h>
+
+static int
+gh100_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+{
+	struct nvkm_falcon *falcon = &gsp->falcon;
+	int ret, time = 4000;
+
+	/* Shutdown RM. */
+	ret = r535_gsp_fini(gsp, suspend);
+	if (ret && suspend)
+		return ret;
+
+	/* Wait for RISC-V to halt. */
+	do {
+		u32 data = nvkm_falcon_rd32(falcon, falcon->addr2 + NV_PRISCV_RISCV_CPUCTL);
+
+		if (NVVAL_GET(data, NV_PRISCV, RISCV_CPUCTL, HALTED))
+			return 0;
+
+		usleep_range(1000, 2000);
+	} while(time--);
+
+	return -ETIMEDOUT;
+}
+
+static bool
+gh100_gsp_lockdown_released(struct nvkm_gsp *gsp, u32 *mbox0)
+{
+	u32 data;
+
+	/* Wait for GSP access via BAR0 to be allowed. */
+	*mbox0 = nvkm_falcon_rd32(&gsp->falcon, NV_PFALCON_FALCON_MAILBOX0);
+
+	if (*mbox0 && (*mbox0 & 0xffffff00) == 0xbadf4100)
+		return false;
+
+	/* Check if an error code has been reported. */
+	if (*mbox0) {
+		u32 mbox1 = nvkm_falcon_rd32(&gsp->falcon, NV_PFALCON_FALCON_MAILBOX1);
+
+		/* Any value that's not GSP_FMC_BOOT_PARAMS addr is an error. */
+		if ((((u64)mbox1 << 32) | *mbox0) != gsp->fmc.args.addr)
+			return true;
+	}
+
+	/* Check if lockdown has been released. */
+	data = nvkm_falcon_rd32(&gsp->falcon, NV_PFALCON_FALCON_HWCFG2);
+	return !NVVAL_GET(data, NV_PFALCON, FALCON_HWCFG2, RISCV_BR_PRIV_LOCKDOWN);
+}
+
+static int
+gh100_gsp_init(struct nvkm_gsp *gsp)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	const bool resume = gsp->sr.meta.data != NULL;
+	struct nvkm_gsp_mem *meta;
+	GSP_FMC_BOOT_PARAMS *args;
+	int ret, time = 4000;
+	u32 mbox0;
+
+	if (!resume) {
+		ret = nvkm_gsp_mem_ctor(gsp, sizeof(*args), &gsp->fmc.args);
+		if (ret)
+			return ret;
+
+		meta = &gsp->wpr_meta;
+	} else {
+		gsp->rm->api->gsp->set_rmargs(gsp, true);
+		meta = &gsp->sr.meta;
+	}
+
+	args = gsp->fmc.args.data;
+
+	args->bootGspRmParams.gspRmDescOffset = meta->addr;
+	args->bootGspRmParams.gspRmDescSize = meta->size;
+	args->bootGspRmParams.target = GSP_DMA_TARGET_COHERENT_SYSTEM;
+	args->bootGspRmParams.bIsGspRmBoot = 1;
+
+	args->gspRmParams.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM;
+	args->gspRmParams.bootArgsOffset = gsp->libos.addr;
+
+	ret = nvkm_fsp_boot_gsp_fmc(device->fsp, gsp->fmc.args.addr, gsp->fb.heap.size, resume,
+				    gsp->fmc.fw.addr, gsp->fmc.hash, gsp->fmc.pkey, gsp->fmc.sig);
+	if (ret)
+		return ret;
+
+	do {
+		if (gh100_gsp_lockdown_released(gsp, &mbox0))
+			break;
+
+		usleep_range(1000, 2000);
+	} while(time--);
+
+	if (time < 0) {
+		nvkm_error(subdev, "GSP-FMC boot timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	if (mbox0) {
+		nvkm_error(subdev, "GSP-FMC boot failed (mbox: 0x%08x)\n", mbox0);
+		return -EIO;
+	}
+
+	return r535_gsp_init(gsp);
+}
+
+static int
+gh100_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta;
+	int ret;
+
+	ret = nvkm_gsp_mem_ctor(gsp, sizeof(*meta), &gsp->wpr_meta);
+	if (ret)
+		return ret;
+
+	gsp->fb.size = nvkm_fb_vidmem_size(gsp->subdev.device);
+	gsp->fb.bios.vga_workspace.size = 128 * 1024;
+	gsp->fb.heap.size = gsp->rm->wpr->heap_size_non_wpr;
+
+	meta = gsp->wpr_meta.data;
+
+	meta->magic = GSP_FW_WPR_META_MAGIC;
+	meta->revision = GSP_FW_WPR_META_REVISION;
+
+	meta->sizeOfRadix3Elf = gsp->fw.len;
+	meta->sysmemAddrOfRadix3Elf = gsp->radix3.lvl0.addr;
+
+	meta->sizeOfBootloader = gsp->boot.fw.size;
+	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
+	meta->bootloaderCodeOffset = gsp->boot.code_offset;
+	meta->bootloaderDataOffset = gsp->boot.data_offset;
+	meta->bootloaderManifestOffset = gsp->boot.manifest_offset;
+
+	meta->sysmemAddrOfSignature = gsp->sig.addr;
+	meta->sizeOfSignature = gsp->sig.size;
+
+	meta->nonWprHeapSize = gsp->fb.heap.size;
+	meta->gspFwHeapSize = tu102_gsp_wpr_heap_size(gsp);
+	meta->frtsSize = 0x100000;
+	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
+	meta->pmuReservedSize = 0;
+	return 0;
+}
+
+/* The sh_flags value for the binary blobs in the ELF image */
+#define FMC_SHF_FLAGS (SHF_MASKPROC | SHF_MASKOS | SHF_OS_NONCONFORMING | SHF_ALLOC)
+
+#define ELF_HDR_SIZE ((u8)sizeof(struct elf32_hdr))
+#define ELF_SHDR_SIZE ((u8)sizeof(struct elf32_shdr))
+
+/* The FMC ELF header must be exactly this */
+static const u8 elf_header[] = {
+	0x7f, 'E', 'L', 'F', 1, 1, 1, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+
+	0, 0, 0, 0, 1, 0, 0, 0, /* e_type, e_machine, e_version */
+	0, 0, 0, 0, 0, 0, 0, 0, /* e_entry, e_phoff */
+
+	ELF_HDR_SIZE, 0, 0, 0, 0, 0, 0, 0, /* e_shoff, e_flags */
+	ELF_HDR_SIZE, 0, 0, 0, /* e_ehsize, e_phentsize */
+	0, 0, ELF_SHDR_SIZE, 0, /* e_phnum, e_shentsize */
+
+	6, 0, 1, 0, /* e_shnum, e_shstrndx */
+};
+
+/**
+ * elf_validate_sections - validate each section in the FMC ELF image
+ * @elf: ELF image
+ * @length: size of the entire ELF image
+ */
+static bool
+elf_validate_sections(const void *elf, size_t length)
+{
+	const struct elf32_hdr *ehdr = elf;
+	const struct elf32_shdr *shdr = elf + ehdr->e_shoff;
+
+	/* The offset of the first section */
+	Elf32_Off section_begin = ehdr->e_shoff + ehdr->e_shnum * ehdr->e_shentsize;
+
+	if (section_begin > length)
+		return false;
+
+	/* The first section header is the null section, so skip it */
+	for (unsigned int i = 1; i < ehdr->e_shnum; i++) {
+		if (i == ehdr->e_shstrndx) {
+			if (shdr[i].sh_type != SHT_STRTAB)
+				return false;
+			if (shdr[i].sh_flags != SHF_STRINGS)
+				return false;
+		} else {
+			if (shdr[i].sh_type != SHT_PROGBITS)
+				return false;
+			if (shdr[i].sh_flags != FMC_SHF_FLAGS)
+				return false;
+		}
+
+		/* Ensure that each section is inside the image */
+		if (shdr[i].sh_offset < section_begin ||
+		    (u64)shdr[i].sh_offset + shdr[i].sh_size > length)
+			return false;
+
+		/* Non-zero sh_info is a CRC */
+		if (shdr[i].sh_info) {
+			/* The kernel's CRC32 needs a pre- and post-xor to match standard CRCs */
+			u32 crc32 = crc32_le(~0, elf + shdr[i].sh_offset, shdr[i].sh_size) ^ ~0;
+
+			if (shdr[i].sh_info != crc32)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+/**
+ * elf_section - return a pointer to the data for a given section
+ * @elf: ELF image
+ * @name: section name to search for
+ * @len: pointer to returned length of found section
+ */
+static const void *
+elf_section(const void *elf, const char *name, unsigned int *len)
+{
+	const struct elf32_hdr *ehdr = elf;
+	const struct elf32_shdr *shdr = elf + ehdr->e_shoff;
+	const char *names = elf + shdr[ehdr->e_shstrndx].sh_offset;
+
+	for (unsigned int i = 1; i < ehdr->e_shnum; i++) {
+		if (!strcmp(&names[shdr[i].sh_name], name)) {
+			*len = shdr[i].sh_size;
+			return elf + shdr[i].sh_offset;
+		}
+	}
+
+	return NULL;
+}
+
+static int
+gh100_gsp_oneinit(struct nvkm_gsp *gsp)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_fsp *fsp = device->fsp;
+	const void *fw = gsp->fws.fmc->data;
+	const void *hash, *sig, *pkey, *img;
+	unsigned int img_len = 0, hash_len = 0, pkey_len = 0, sig_len = 0;
+	int ret;
+
+	if (gsp->fws.fmc->size < ELF_HDR_SIZE ||
+	    memcmp(fw, elf_header, sizeof(elf_header)) ||
+	    !elf_validate_sections(fw, gsp->fws.fmc->size)) {
+		nvkm_error(subdev, "fmc firmware image is invalid\n");
+		return -ENODATA;
+	}
+
+	hash = elf_section(fw, "hash", &hash_len);
+	sig = elf_section(fw, "signature", &sig_len);
+	pkey = elf_section(fw, "publickey", &pkey_len);
+	img = elf_section(fw, "image", &img_len);
+
+	if (!hash || !sig || !pkey || !img) {
+		nvkm_error(subdev, "fmc firmware image is invalid\n");
+		return -ENODATA;
+	}
+
+	if (!nvkm_fsp_verify_gsp_fmc(fsp, hash_len, pkey_len, sig_len))
+		return -EINVAL;
+
+	/* Load GSP-FMC FW into memory. */
+	ret = nvkm_gsp_mem_ctor(gsp, img_len, &gsp->fmc.fw);
+	if (ret)
+		return ret;
+
+	memcpy(gsp->fmc.fw.data, img, img_len);
+
+	gsp->fmc.hash = kmemdup(hash, hash_len, GFP_KERNEL);
+	gsp->fmc.pkey = kmemdup(pkey, pkey_len, GFP_KERNEL);
+	gsp->fmc.sig = kmemdup(sig, sig_len, GFP_KERNEL);
+	if (!gsp->fmc.hash || !gsp->fmc.pkey || !gsp->fmc.sig)
+		return -ENOMEM;
+
+	ret = r535_gsp_oneinit(gsp);
+	if (ret)
+		return ret;
+
+	return gh100_gsp_wpr_meta_init(gsp);
+}
+
+static const struct nvkm_gsp_func
+gh100_gsp = {
+	.flcn = &ga102_gsp_flcn,
+
+	.sig_section = ".fwsignature_gh100",
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = gh100_gsp_oneinit,
+	.init = gh100_gsp_init,
+	.fini = gh100_gsp_fini,
+
+	.rm.gpu = &gh100_gpu,
+};
+
+static int
+gh100_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
+{
+	int ret;
+
+	ret = tu102_gsp_load_rm(gsp, fwif);
+	if (ret)
+		goto done;
+
+	ret = nvkm_gsp_load_fw(gsp, "fmc", fwif->ver, &gsp->fws.fmc);
+
+done:
+	if (ret)
+		nvkm_gsp_dtor_fws(gsp);
+
+	return ret;
+}
+
+static struct nvkm_gsp_fwif
+gh100_gsps[] = {
+	{ 0, gh100_gsp_load, &gh100_gsp, &r570_rm_gh100, "570.144", true },
+	{}
+};
+
+int
+gh100_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_gsp **pgsp)
+{
+	return nvkm_gsp_new_(gh100_gsps, device, type, inst, pgsp);
+}
+
+NVKM_GSP_FIRMWARE_FMC(gh100, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index c8429863b642..86ec580ba936 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -22,7 +22,9 @@ int nvkm_gsp_load_fw(struct nvkm_gsp *, const char *name, const char *ver,
 void nvkm_gsp_dtor_fws(struct nvkm_gsp *);
 
 int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+
 int tu102_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+int tu102_gsp_load_rm(struct nvkm_gsp *, const struct nvkm_gsp_fwif *);
 
 #define NVKM_GSP_FIRMWARE_BOOTER(chip,vers)                      \
 MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-"#vers".bin");   \
@@ -30,6 +32,11 @@ MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-"#vers".bin"); \
 MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-"#vers".bin");    \
 MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-"#vers".bin")
 
+#define NVKM_GSP_FIRMWARE_FMC(chip,vers)                      \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/fmc-"#vers".bin");        \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-"#vers".bin"); \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-"#vers".bin")
+
 struct nvkm_gsp_func {
 	const struct nvkm_falcon_func *flcn;
 	const struct nvkm_falcon_fw_func *fwsec;
@@ -60,6 +67,7 @@ int tu102_gsp_oneinit(struct nvkm_gsp *);
 int tu102_gsp_init(struct nvkm_gsp *);
 int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
 int tu102_gsp_reset(struct nvkm_gsp *);
+u64 tu102_gsp_wpr_heap_size(struct nvkm_gsp *);
 
 extern const struct nvkm_falcon_func ga102_gsp_flcn;
 extern const struct nvkm_falcon_fw_func ga102_gsp_fwsec;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 83a5e994cd91..44a62d6ec4f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -10,6 +10,7 @@ nvkm-y += nvkm/subdev/gsp/rm/tu1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ga100.o
 nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
+nvkm-y += nvkm/subdev/gsp/rm/gh100.o
 
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
 include $(src)/nvkm/subdev/gsp/rm/r570/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
new file mode 100644
index 000000000000..088250559e12
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+#include <nvif/class.h>
+
+const struct nvkm_rm_gpu
+gh100_gpu = {
+	.usermode.class = HOPPER_USERMODE_A,
+
+	.fifo.chan = {
+		.class = HOPPER_CHANNEL_GPFIFO_A,
+	},
+
+	.ce.class = HOPPER_DMA_COPY_A,
+	.gr.class = {
+		.i2m = KEPLER_INLINE_TO_MEMORY_B,
+		.twod = FERMI_TWOD_A,
+		.threed = HOPPER_A,
+		.compute = HOPPER_COMPUTE_A,
+	},
+	.nvdec.class = NVB8B0_VIDEO_DECODER,
+	.nvjpg.class = NVB8D1_VIDEO_NVJPG,
+	.ofa.class = NVB8FA_VIDEO_OFA,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index a256be42ab6e..443753f3369a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -62,4 +62,5 @@ extern const struct nvkm_rm_gpu tu1xx_gpu;
 extern const struct nvkm_rm_gpu ga100_gpu;
 extern const struct nvkm_rm_gpu ga1xx_gpu;
 extern const struct nvkm_rm_gpu ad10x_gpu;
+extern const struct nvkm_rm_gpu gh100_gpu;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 04c34f3d2d25..bc1953c35dea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -2078,6 +2078,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_falcon_fw_dtor(&gsp->booter.unload);
 	nvkm_falcon_fw_dtor(&gsp->booter.load);
 
+	nvkm_gsp_mem_dtor(&gsp->fmc.args);
+	kfree(gsp->fmc.sig);
+	kfree(gsp->fmc.pkey);
+	kfree(gsp->fmc.hash);
+	nvkm_gsp_mem_dtor(&gsp->fmc.fw);
+
 	mutex_destroy(&gsp->msgq.mutex);
 	mutex_destroy(&gsp->cmdq.mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 730dcb645cca..9d2fa4e66d59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -26,8 +26,10 @@ r570_gsp_sr_data_size(struct nvkm_gsp *gsp)
 static void
 r570_gsp_drop_post_nocat_record(struct nvkm_gsp *gsp)
 {
-	if (gsp->subdev.debug < NV_DBG_DEBUG)
+	if (gsp->subdev.debug < NV_DBG_DEBUG) {
 		r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NULL, NULL);
+		r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE, NULL, NULL);
+	}
 }
 
 static bool
@@ -102,6 +104,13 @@ r570_gsp_get_static_info(struct nvkm_gsp *gsp)
 
 	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
 
+	if (gsp->rm->wpr->offset_set_by_acr) {
+		GspFwWprMeta *meta = gsp->wpr_meta.data;
+
+		meta->nonWprHeapOffset = rpc->fwWprLayoutOffset.nonWprHeapOffset;
+		meta->frtsOffset = rpc->fwWprLayoutOffset.frtsOffset;
+	}
+
 	nvkm_gsp_rpc_done(gsp, rpc);
 
 	ret = r570_gr_gpc_mask(gsp, &gpc_mask);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
index 4685a898fac6..b6075021e74f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -573,4 +573,62 @@ typedef struct
                                     (88u + (BULLSEYE_ROOT_HEAP_ALLOC_RM_DATA_SECTION_SIZE_DELTA) + \
                                     (BULLSEYE_ROOT_HEAP_ALLOC_BAREMETAL_LIBOS_HEAP_SIZE_DELTA))
 
+typedef struct GSP_FMC_INIT_PARAMS
+{
+    // CC initialization "registry keys"
+    NvU32 regkeys;
+} GSP_FMC_INIT_PARAMS;
+
+typedef enum {
+    GSP_DMA_TARGET_LOCAL_FB,
+    GSP_DMA_TARGET_COHERENT_SYSTEM,
+    GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+    GSP_DMA_TARGET_COUNT
+} GSP_DMA_TARGET;
+
+typedef struct GSP_ACR_BOOT_GSP_RM_PARAMS
+{
+    // Physical memory aperture through which gspRmDescPa is accessed
+    GSP_DMA_TARGET target;
+    // Size in bytes of the GSP-RM descriptor structure
+    NvU32          gspRmDescSize;
+    // Physical offset in the target aperture of the GSP-RM descriptor structure
+    NvU64          gspRmDescOffset;
+    // Physical offset in FB to set the start of the WPR containing GSP-RM
+    NvU64          wprCarveoutOffset;
+    // Size in bytes of the WPR containing GSP-RM
+    NvU32          wprCarveoutSize;
+    // Whether to boot GSP-RM or GSP-Proxy through ACR
+    NvBool         bIsGspRmBoot;
+} GSP_ACR_BOOT_GSP_RM_PARAMS;
+
+typedef struct GSP_RM_PARAMS
+{
+    // Physical memory aperture through which bootArgsOffset is accessed
+    GSP_DMA_TARGET target;
+    // Physical offset in the memory aperture that will be passed to GSP-RM
+    NvU64          bootArgsOffset;
+} GSP_RM_PARAMS;
+
+typedef struct GSP_SPDM_PARAMS
+{
+    // Physical Memory Aperture through which all addresses are accessed
+    GSP_DMA_TARGET target;
+
+    // Physical offset in the memory aperture where SPDM payload is stored
+    NvU64 payloadBufferOffset;
+
+    // Size of the above payload buffer
+    NvU32 payloadBufferSize;
+} GSP_SPDM_PARAMS;
+
+typedef struct GSP_FMC_BOOT_PARAMS
+{
+    GSP_FMC_INIT_PARAMS         initParams;
+    GSP_ACR_BOOT_GSP_RM_PARAMS  bootGspRmParams;
+    GSP_RM_PARAMS               gspRmParams;
+    GSP_SPDM_PARAMS             gspSpdmParams;
+} GSP_FMC_BOOT_PARAMS;
+
+#define GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100              (14 << 20)   // Hopper+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
index 3293240df228..07a4beeae2a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -20,6 +20,15 @@ r570_wpr_libos3 = {
 	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
 };
 
+static const struct nvkm_rm_wpr
+r570_wpr_libos3_gh100 = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+	.heap_size_non_wpr = 0x200000,
+	.offset_set_by_acr = true,
+};
+
 static const struct nvkm_rm_api
 r570_api = {
 	.gsp = &r570_gsp,
@@ -49,3 +58,9 @@ r570_rm_ga102 = {
 	.wpr = &r570_wpr_libos3,
 	.api = &r570_api,
 };
+
+const struct nvkm_rm_impl
+r570_rm_gh100 = {
+	.wpr = &r570_wpr_libos3_gh100,
+	.api = &r570_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 14e5bb5ad30e..56d5c5c537ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -25,6 +25,8 @@ struct nvkm_rm_wpr {
 	u32 os_carveout_size;
 	u32 base_size;
 	u64 heap_size_min;
+	u32 heap_size_non_wpr;
+	bool offset_set_by_acr;
 };
 
 struct nvkm_rm_api {
@@ -173,6 +175,7 @@ extern const struct nvkm_rm_api_engine r535_ofa;
 
 extern const struct nvkm_rm_impl r570_rm_tu102;
 extern const struct nvkm_rm_impl r570_rm_ga102;
+extern const struct nvkm_rm_impl r570_rm_gh100;
 extern const struct nvkm_rm_api_gsp r570_gsp;
 extern const struct nvkm_rm_api_client r570_client;
 extern const struct nvkm_rm_api_fbsr r570_fbsr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 97c02aa93d55..58e233bc53b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -246,7 +246,7 @@ tu102_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static u64
+u64
 tu102_gsp_wpr_heap_size(struct nvkm_gsp *gsp)
 {
 	u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
@@ -379,7 +379,7 @@ tu102_gsp = {
 	.rm.gpu = &tu1xx_gpu,
 };
 
-static int
+int
 tu102_gsp_load_rm(struct nvkm_gsp *gsp, const struct nvkm_gsp_fwif *fwif)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
index 06cbe19ce376..fa7a2862dd1f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
@@ -4,3 +4,4 @@ nvkm-y += nvkm/subdev/instmem/nv04.o
 nvkm-y += nvkm/subdev/instmem/nv40.o
 nvkm-y += nvkm/subdev/instmem/nv50.o
 nvkm-y += nvkm/subdev/instmem/gk20a.o
+nvkm-y += nvkm/subdev/instmem/gh100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c
new file mode 100644
index 000000000000..8d8dd5f8a6c7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/ref/gh100/pri_nv_xal_ep.h>
+
+static void
+gh100_instmem_set_bar0_window_addr(struct nvkm_device *device, u64 addr)
+{
+	nvkm_wr32(device, NV_XAL_EP_BAR0_WINDOW, addr >> NV_XAL_EP_BAR0_WINDOW_BASE_SHIFT);
+}
+
+static const struct nvkm_instmem_func
+gh100_instmem = {
+	.fini = nv50_instmem_fini,
+	.memory_new = nv50_instobj_new,
+	.memory_wrap = nv50_instobj_wrap,
+	.set_bar0_window_addr = gh100_instmem_set_bar0_window_addr,
+};
+
+int
+gh100_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		  struct nvkm_instmem **pimem)
+{
+	return r535_instmem_new(&gh100_instmem, device, type, inst, pimem);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 9d29e5234734..4ca6fb30743d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -353,7 +353,7 @@ nv50_instobj_func = {
 	.map = nv50_instobj_map,
 };
 
-static int
+int
 nv50_instobj_wrap(struct nvkm_instmem *base,
 		  struct nvkm_memory *memory, struct nvkm_memory **pmemory)
 {
@@ -373,7 +373,7 @@ nv50_instobj_wrap(struct nvkm_instmem *base,
 	return 0;
 }
 
-static int
+int
 nv50_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
 		 struct nvkm_memory **pmemory)
 {
@@ -400,7 +400,7 @@ nv50_instmem_set_bar0_window_addr(struct nvkm_device *device, u64 addr)
 	nvkm_wr32(device, 0x001700, addr >> 16);
 }
 
-static void
+void
 nv50_instmem_fini(struct nvkm_instmem *base)
 {
 	nv50_instmem(base)->addr = ~0ULL;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index d5b5fcd9262b..87bbdd786eaa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -21,6 +21,11 @@ struct nvkm_instmem_func {
 
 int nv50_instmem_new_(const struct nvkm_instmem_func *, struct nvkm_device *,
 		      enum nvkm_subdev_type, int, struct nvkm_instmem **);
+void nv50_instmem_fini(struct nvkm_instmem *);
+int nv50_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero,
+		     struct nvkm_memory **);
+int nv50_instobj_wrap(struct nvkm_instmem *, struct nvkm_memory *vram,
+		      struct nvkm_memory **bar2);
 
 void nvkm_instmem_ctor(const struct nvkm_instmem_func *, struct nvkm_device *,
 		       enum nvkm_subdev_type, int, struct nvkm_instmem *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
index a602b0cb5b31..ea4848931540 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
@@ -15,6 +15,7 @@ nvkm-y += nvkm/subdev/mmu/gp100.o
 nvkm-y += nvkm/subdev/mmu/gp10b.o
 nvkm-y += nvkm/subdev/mmu/gv100.o
 nvkm-y += nvkm/subdev/mmu/tu102.o
+nvkm-y += nvkm/subdev/mmu/gh100.o
 
 nvkm-y += nvkm/subdev/mmu/mem.o
 nvkm-y += nvkm/subdev/mmu/memnv04.o
@@ -36,6 +37,7 @@ nvkm-y += nvkm/subdev/mmu/vmmgp100.o
 nvkm-y += nvkm/subdev/mmu/vmmgp10b.o
 nvkm-y += nvkm/subdev/mmu/vmmgv100.o
 nvkm-y += nvkm/subdev/mmu/vmmtu102.o
+nvkm-y += nvkm/subdev/mmu/vmmgh100.o
 
 nvkm-y += nvkm/subdev/mmu/umem.o
 nvkm-y += nvkm/subdev/mmu/ummu.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c
new file mode 100644
index 000000000000..2918fb32cc91
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "mem.h"
+#include "vmm.h"
+
+#include <nvif/class.h>
+
+static const struct nvkm_mmu_func
+gh100_mmu = {
+	.dma_bits = 52,
+	.mmu = {{ -1, -1, NVIF_CLASS_MMU_GF100}},
+	.mem = {{ -1,  0, NVIF_CLASS_MEM_GF100}, gf100_mem_new, gf100_mem_map },
+	.vmm = {{ -1,  0, NVIF_CLASS_VMM_GP100}, gh100_vmm_new },
+	.kind = tu102_mmu_kind,
+	.kind_sys = true,
+};
+
+int
+gh100_mmu_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_mmu **pmmu)
+{
+	return r535_mmu_new(&gh100_mmu, device, type, inst, pmmu);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
index e9ca6537778c..90efef8f0b54 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
@@ -53,6 +53,8 @@ const u8 *gf100_mmu_kind(struct nvkm_mmu *, int *count, u8 *invalid);
 
 const u8 *gm200_mmu_kind(struct nvkm_mmu *, int *, u8 *);
 
+const u8 *tu102_mmu_kind(struct nvkm_mmu *, int *, u8 *);
+
 struct nvkm_mmu_pt {
 	union {
 		struct nvkm_mmu_ptc *ptc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
index df662ce4a4b0..7acff3642e20 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
@@ -28,7 +28,7 @@
 
 #include <nvif/class.h>
 
-static const u8 *
+const u8 *
 tu102_mmu_kind(struct nvkm_mmu *mmu, int *count, u8 *invalid)
 {
 	static const u8
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index f9bc30cdb2b3..4586a425dbe4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -143,6 +143,8 @@ struct nvkm_vmm_func {
 	int (*aper)(enum nvkm_memory_target);
 	int (*valid)(struct nvkm_vmm *, void *argv, u32 argc,
 		     struct nvkm_vmm_map *);
+	int (*valid2)(struct nvkm_vmm *, bool ro, bool priv, u8 kind, u8 comp,
+		      struct nvkm_vmm_map *);
 	void (*flush)(struct nvkm_vmm *, int depth);
 
 	int (*mthd)(struct nvkm_vmm *, struct nvkm_client *,
@@ -254,6 +256,8 @@ void gp100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
 
 int gv100_vmm_join(struct nvkm_vmm *, struct nvkm_memory *);
 
+void tu102_vmm_flush(struct nvkm_vmm *, int depth);
+
 int nv04_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 		 struct lock_class_key *, const char *, struct nvkm_vmm **);
 int nv41_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
@@ -296,6 +300,9 @@ int gv100_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 		  struct lock_class_key *, const char *,
 		  struct nvkm_vmm **);
+int gh100_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
+		  struct lock_class_key *, const char *,
+		  struct nvkm_vmm **);
 
 #define VMM_PRINT(l,v,p,f,a...) do {                                           \
 	struct nvkm_vmm *_vmm = (v);                                           \
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c
new file mode 100644
index 000000000000..5614df3432da
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c
@@ -0,0 +1,306 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "vmm.h"
+
+#include <subdev/fb.h>
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gh100/dev_mmu.h>
+
+static inline void
+gh100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes,
+		  struct nvkm_vmm_map *map, u64 addr)
+{
+	u64 data = addr | map->type;
+
+	while (ptes--) {
+		VMM_WO064(pt, vmm, ptei++ * NV_MMU_VER3_PTE__SIZE, data);
+		data += map->next;
+	}
+}
+
+static void
+gh100_vmm_pgt_sgl(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes,
+		  struct nvkm_vmm_map *map)
+{
+	VMM_MAP_ITER_SGL(vmm, pt, ptei, ptes, map, gh100_vmm_pgt_pte);
+}
+
+static void
+gh100_vmm_pgt_dma(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes,
+		  struct nvkm_vmm_map *map)
+{
+	if (map->page->shift == PAGE_SHIFT) {
+		VMM_SPAM(vmm, "DMAA %08x %08x PTE(s)", ptei, ptes);
+
+		nvkm_kmap(pt->memory);
+		while (ptes--) {
+			const u64 data = *map->dma++ | map->type;
+
+			VMM_WO064(pt, vmm, ptei++ * NV_MMU_VER3_PTE__SIZE, data);
+		}
+		nvkm_done(pt->memory);
+		return;
+	}
+
+	VMM_MAP_ITER_DMA(vmm, pt, ptei, ptes, map, gh100_vmm_pgt_pte);
+}
+
+static void
+gh100_vmm_pgt_mem(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes,
+		  struct nvkm_vmm_map *map)
+{
+	VMM_MAP_ITER_MEM(vmm, pt, ptei, ptes, map, gh100_vmm_pgt_pte);
+}
+
+static void
+gh100_vmm_pgt_sparse(struct nvkm_vmm *vmm,
+		     struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	const u64 data = NVDEF(NV_MMU, VER3_PTE, PCF, SPARSE);
+
+	VMM_FO064(pt, vmm, ptei * NV_MMU_VER3_PTE__SIZE, data, ptes);
+}
+
+static const struct nvkm_vmm_desc_func
+gh100_vmm_desc_spt = {
+	.unmap = gf100_vmm_pgt_unmap,
+	.sparse = gh100_vmm_pgt_sparse,
+	.mem = gh100_vmm_pgt_mem,
+	.dma = gh100_vmm_pgt_dma,
+	.sgl = gh100_vmm_pgt_sgl,
+};
+
+static void
+gh100_vmm_lpt_invalid(struct nvkm_vmm *vmm,
+		      struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	const u64 data = NVDEF(NV_MMU, VER3_PTE, PCF, NO_VALID_4KB_PAGE);
+
+	VMM_FO064(pt, vmm, ptei * NV_MMU_VER3_PTE__SIZE, data, ptes);
+}
+
+static const struct nvkm_vmm_desc_func
+gh100_vmm_desc_lpt = {
+	.invalid = gh100_vmm_lpt_invalid,
+	.unmap = gf100_vmm_pgt_unmap,
+	.sparse = gh100_vmm_pgt_sparse,
+	.mem = gh100_vmm_pgt_mem,
+};
+
+static inline void
+gh100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
+		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map, u64 addr)
+{
+	u64 data = addr | map->type;
+
+	while (ptes--) {
+		VMM_WO128(pt, vmm, ptei++ * NV_MMU_VER3_DUAL_PDE__SIZE, data, 0ULL);
+		data += map->next;
+	}
+}
+
+static void
+gh100_vmm_pd0_mem(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
+		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map)
+{
+	VMM_MAP_ITER_MEM(vmm, pt, ptei, ptes, map, gh100_vmm_pd0_pte);
+}
+
+static inline bool
+gh100_vmm_pde(struct nvkm_mmu_pt *pt, u64 *data)
+{
+	switch (nvkm_memory_target(pt->memory)) {
+	case NVKM_MEM_TARGET_VRAM:
+		*data |= NVDEF(NV_MMU, VER3_PDE, APERTURE, VIDEO_MEMORY);
+		*data |= NVDEF(NV_MMU, VER3_PDE, PCF, VALID_CACHED_ATS_NOT_ALLOWED);
+		break;
+	case NVKM_MEM_TARGET_HOST:
+		*data |= NVDEF(NV_MMU, VER3_PDE, APERTURE, SYSTEM_COHERENT_MEMORY);
+		*data |= NVDEF(NV_MMU, VER3_PDE, PCF, VALID_UNCACHED_ATS_ALLOWED);
+		break;
+	case NVKM_MEM_TARGET_NCOH:
+		*data |= NVDEF(NV_MMU, VER3_PDE, APERTURE, SYSTEM_NON_COHERENT_MEMORY);
+		*data |= NVDEF(NV_MMU, VER3_PDE, PCF, VALID_CACHED_ATS_ALLOWED);
+		break;
+	default:
+		WARN_ON(1);
+		return false;
+	}
+
+	*data |= pt->addr;
+	return true;
+}
+
+static void
+gh100_vmm_pd0_pde(struct nvkm_vmm *vmm, struct nvkm_vmm_pt *pgd, u32 pdei)
+{
+	struct nvkm_vmm_pt *pgt = pgd->pde[pdei];
+	struct nvkm_mmu_pt *pd = pgd->pt[0];
+	u64 data[2] = {};
+
+	if (pgt->pt[0] && !gh100_vmm_pde(pgt->pt[0], &data[0]))
+		return;
+	if (pgt->pt[1] && !gh100_vmm_pde(pgt->pt[1], &data[1]))
+		return;
+
+	nvkm_kmap(pd->memory);
+	VMM_WO128(pd, vmm, pdei * NV_MMU_VER3_DUAL_PDE__SIZE, data[0], data[1]);
+	nvkm_done(pd->memory);
+}
+
+static void
+gh100_vmm_pd0_sparse(struct nvkm_vmm *vmm,
+		     struct nvkm_mmu_pt *pt, u32 pdei, u32 pdes)
+{
+	const u64 data = NVDEF(NV_MMU, VER3_DUAL_PDE, PCF_BIG, SPARSE_ATS_ALLOWED);
+
+	VMM_FO128(pt, vmm, pdei * NV_MMU_VER3_DUAL_PDE__SIZE, data, 0ULL, pdes);
+}
+
+static void
+gh100_vmm_pd0_unmap(struct nvkm_vmm *vmm,
+		    struct nvkm_mmu_pt *pt, u32 pdei, u32 pdes)
+{
+	VMM_FO128(pt, vmm, pdei * NV_MMU_VER3_DUAL_PDE__SIZE, 0ULL, 0ULL, pdes);
+}
+
+static const struct nvkm_vmm_desc_func
+gh100_vmm_desc_pd0 = {
+	.unmap = gh100_vmm_pd0_unmap,
+	.sparse = gh100_vmm_pd0_sparse,
+	.pde = gh100_vmm_pd0_pde,
+	.mem = gh100_vmm_pd0_mem,
+};
+
+static void
+gh100_vmm_pd1_pde(struct nvkm_vmm *vmm, struct nvkm_vmm_pt *pgd, u32 pdei)
+{
+	struct nvkm_vmm_pt *pgt = pgd->pde[pdei];
+	struct nvkm_mmu_pt *pd = pgd->pt[0];
+	u64 data = 0;
+
+	if (!gh100_vmm_pde(pgt->pt[0], &data))
+		return;
+
+	nvkm_kmap(pd->memory);
+	VMM_WO064(pd, vmm, pdei * NV_MMU_VER3_PDE__SIZE, data);
+	nvkm_done(pd->memory);
+}
+
+static const struct nvkm_vmm_desc_func
+gh100_vmm_desc_pd1 = {
+	.unmap = gf100_vmm_pgt_unmap,
+	.sparse = gh100_vmm_pgt_sparse,
+	.pde = gh100_vmm_pd1_pde,
+};
+
+static const struct nvkm_vmm_desc
+gh100_vmm_desc_16[] = {
+	{ LPT, 5,  8, 0x0100, &gh100_vmm_desc_lpt },
+	{ PGD, 8, 16, 0x1000, &gh100_vmm_desc_pd0 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 1,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{}
+};
+
+static const struct nvkm_vmm_desc
+gh100_vmm_desc_12[] = {
+	{ SPT, 9,  8, 0x1000, &gh100_vmm_desc_spt },
+	{ PGD, 8, 16, 0x1000, &gh100_vmm_desc_pd0 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 9,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{ PGD, 1,  8, 0x1000, &gh100_vmm_desc_pd1 },
+	{}
+};
+
+static int
+gh100_vmm_valid(struct nvkm_vmm *vmm, bool ro, bool priv, u8 kind, u8 comp,
+		struct nvkm_vmm_map *map)
+{
+	const enum nvkm_memory_target target = nvkm_memory_target(map->memory);
+	const bool vol = target == NVKM_MEM_TARGET_HOST;
+	const struct nvkm_vmm_page *page = map->page;
+	u8 kind_inv, pcf;
+	int kindn, aper;
+	const u8 *kindm;
+
+	map->next = 1ULL << page->shift;
+	map->type = 0;
+
+	aper = vmm->func->aper(target);
+	if (WARN_ON(aper < 0))
+		return aper;
+
+	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn, &kind_inv);
+	if (kind >= kindn || kindm[kind] == kind_inv) {
+		VMM_DEBUG(vmm, "kind %02x", kind);
+		return -EINVAL;
+	}
+
+	if (priv) {
+		if (ro) {
+			if (vol)
+				pcf = NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_UNCACHED_ACD;
+			else
+				pcf = NV_MMU_VER3_PTE_PCF_PRIVILEGE_RO_ATOMIC_CACHED_ACD;
+		} else {
+			if (vol)
+				pcf = NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_UNCACHED_ACD;
+			else
+				pcf = NV_MMU_VER3_PTE_PCF_PRIVILEGE_RW_ATOMIC_CACHED_ACD;
+		}
+	} else {
+		if (ro) {
+			if (vol)
+				pcf = NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_UNCACHED_ACD;
+			else
+				pcf = NV_MMU_VER3_PTE_PCF_REGULAR_RO_ATOMIC_CACHED_ACD;
+		} else {
+			if (vol)
+				pcf = NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_UNCACHED_ACD;
+			else
+				pcf = NV_MMU_VER3_PTE_PCF_REGULAR_RW_ATOMIC_CACHED_ACD;
+		}
+	}
+
+	map->type |= NVDEF(NV_MMU, VER3_PTE, VALID, TRUE);
+	map->type |= NVVAL(NV_MMU, VER3_PTE, APERTURE, aper);
+	map->type |= NVVAL(NV_MMU, VER3_PTE, PCF, pcf);
+	map->type |= NVVAL(NV_MMU, VER3_PTE, KIND, kind);
+	return 0;
+}
+
+static const struct nvkm_vmm_func
+gh100_vmm = {
+	.join = gv100_vmm_join,
+	.part = gf100_vmm_part,
+	.aper = gf100_vmm_aper,
+	.valid = gp100_vmm_valid,
+	.valid2 = gh100_vmm_valid,
+	.flush = tu102_vmm_flush,
+	.page = {
+		{ 56, &gh100_vmm_desc_16[5], NVKM_VMM_PAGE_Sxxx },
+		{ 47, &gh100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
+		{ 38, &gh100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
+		{ 29, &gh100_vmm_desc_16[2], NVKM_VMM_PAGE_SVxC },
+		{ 21, &gh100_vmm_desc_16[1], NVKM_VMM_PAGE_SVxC },
+		{ 16, &gh100_vmm_desc_16[0], NVKM_VMM_PAGE_SVxC },
+		{ 12, &gh100_vmm_desc_12[0], NVKM_VMM_PAGE_SVHx },
+		{}
+	}
+};
+
+int
+gh100_vmm_new(struct nvkm_mmu *mmu, bool managed, u64 addr, u64 size,
+	      void *argv, u32 argc, struct lock_class_key *key,
+	      const char *name, struct nvkm_vmm **pvmm)
+{
+	return gp100_vmm_new_(&gh100_vmm, mmu, managed, addr, size,
+			      argv, argc, key, name, pvmm);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index bddac77f48f0..851fd847a2a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -436,6 +436,9 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return ret;
 	}
 
+	if (vmm->func->valid2)
+		return vmm->func->valid2(vmm, ro, priv, kind, 0, map);
+
 	aper = vmm->func->aper(target);
 	if (WARN_ON(aper < 0))
 		return aper;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 8379e72d77ab..4b30eab40bba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -23,7 +23,7 @@
 
 #include <subdev/timer.h>
 
-static void
+void
 tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
 {
 	struct nvkm_device *device = vmm->mmu->subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
index 174bdf995271..a14ea0f7b1c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild
@@ -13,3 +13,4 @@ nvkm-y += nvkm/subdev/pci/gf100.o
 nvkm-y += nvkm/subdev/pci/gf106.o
 nvkm-y += nvkm/subdev/pci/gk104.o
 nvkm-y += nvkm/subdev/pci/gp100.o
+nvkm-y += nvkm/subdev/pci/gh100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c
new file mode 100644
index 000000000000..42da92d7a5fe
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gh100/dev_xtl_ep_pri.h>
+
+static void
+gh100_pci_msi_rearm(struct nvkm_pci *pci)
+{
+	/* Handled by top-level intr ACK. */
+}
+
+static const struct nvkm_pci_func
+gh100_pci = {
+	.cfg = {
+		.addr = DRF_LO(NV_EP_PCFGM),
+		.size = DRF_HI(NV_EP_PCFGM) - DRF_LO(NV_EP_PCFGM) + 1,
+	},
+	.msi_rearm = gh100_pci_msi_rearm,
+};
+
+int
+gh100_pci_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_pci **ppci)
+{
+	return nvkm_pci_new_(&gh100_pci, device, type, inst, ppci);
+}
-- 
2.49.0

