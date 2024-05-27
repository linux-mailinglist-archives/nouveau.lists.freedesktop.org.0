Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CE8D11EA
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E4310E411;
	Tue, 28 May 2024 02:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t0trpl0O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325BA10E1D0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m56jmsbXjXedBdxuug0CQ4TXFwM4XpjmBBBP1MV1hdT/Rrh94EL3RPjUFvR6Zg2b2i0M7fPL21ehgBQ9BHZZfLz4vHf6IX0hni94k3lasASJcYB7OAwWueCrUqx/X7TNubnPgHmTz8+i0C2Uv6eqojAlMT7O1DeBJP5o3M6O/XqZghse92dNcy2uulcv25OdliCtyzInnZV2tj6j4ykIvFoAeI2KlB15PSltcezsz7/Yysw4egyoe95QkL5jZtFTTTgrr+asdca+cEwt2X4YCFURk7D3ncuEQvOn8DOY55NxSjfHtnHUc9AGRqUzU/N89lgpEacYasV/R5fnnh4Ilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywKAsb2Fhl2cvECEqWh8AzBSFg74XNpjAJ+AMziOBTs=;
 b=CVaKGeJsVxZfIEzRHSoJ1WoLZHhAZGq6yGfn87c0MiQmtxNJzvGwaSC3HOocCq9BjegKKneeUdltUghFcZfkWUtvRS8Qrjp5wSvghra3KtF6mQzc4w+oBwkHdPYZ9CwLSVMg2rRLTRUY3HeL7D0mD3hrnijJoU/XpIMRIlF7f3l91dVEbHauS48cFq/TuJZYi31hRT45l8wk1NgmUEmEHn/JJnmq9vZxobzrZP2zFL+kkQyo3VdF36nAsKqztlJQ8upQ/5qzjWxO5iTV++EFdJNSnpO7dn089QOI57vNUryH3vuiEZ6wIJRsKkTa5bfcVXpyE5Szg5VZOMVNnrHfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywKAsb2Fhl2cvECEqWh8AzBSFg74XNpjAJ+AMziOBTs=;
 b=t0trpl0Oa5thxKhv6J4T7+mUx5VrfAMpqN2CzT55+NmKGPnfdS8CMKWEWsAW/FbO0KLexFv2d+ZOXfIldoGdeJ0Pud0HzStus6ox0astqPh+Yo5bvR7ZAv9P84UDspTpNs5oIjZd42Gflcgz8dBUkv13hyVY+Ucvdb0uV0i68rso/L5+P5rW4gvU7w+iYBo4GlzsE2z/vpdGyeu3VrKlr6h50Wvo0bhNSQKy1GkNuO/SctuW13vvxDadaFUhhgkzuc3E/gRrVnmcNRHFPSGgZ03hZz/2l0aB31KMkgXVhhf2knTWHSEm0fWiv7IksHLbhbpt4ZO76s/0jutbUzXUDQ==
Received: from PH7P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::32)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 28 May
 2024 02:22:54 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::c4) by PH7P221CA0017.outlook.office365.com
 (2603:10b6:510:32a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:22:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:44 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 00/34] drm/nouveau: misc. cleanups and removal of unused apis
Date: Tue, 28 May 2024 00:19:25 +1000
Message-ID: <20240527141959.59193-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 950ee90c-b8f0-4886-f310-08dc7ebd1413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|1800799015|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SSQK7+0jwwji6MsnjkOrGlnqTirbG3KUqbFoVmFqeta9OEJP5SVaPL7kOW5M?=
 =?us-ascii?Q?D1GgAgwhdelM1VC6xEnse1gF/zBx3mxaIfEFzcktWAiF+S09imwdIHkVWNsW?=
 =?us-ascii?Q?bKgJ1ZDlLj70vo8S8rlsYCCr2HyU8Qe+AOXct8lUfFDjES1jT+r29eFzWhwx?=
 =?us-ascii?Q?FlDh/DOeSxiiFgRT0gJChaIjPmd3bVcZixDR4/ZC6+VW5acT+qGiJlUFgoI+?=
 =?us-ascii?Q?8/gb8PwhDqCLIjE+9LvKrPdIlCwFbGGrBnyog4kX91+ld+Bq49Q8fNdZtWBD?=
 =?us-ascii?Q?TXEhODCKSUhjO37T7HRPQUhKAMzzeF+PBcq7Mc82gHQf3GuvWMWjMVtG5KUU?=
 =?us-ascii?Q?PUH8BE/K2/6jdC0WuXtPjbiOqq0jfhaDB+ETXjsIG6/IHoj1my5idDYZ+TGu?=
 =?us-ascii?Q?L+ey3VVjq7UkmwN1DvQhP/h7IuRE3BSB+ApqLfUEz3JZMMU3xwULMPDLdEc9?=
 =?us-ascii?Q?cUDiScAt5CpRhhMtIGB/a4SvAcmQdE5pu4BBpph6LpBF3mdyTf9r/nwy7b0r?=
 =?us-ascii?Q?tffx1ZuQKq+ma9KrQIVswBOp+8MDClEtLD8qaa7FVK0ZB+05xeuLQiaPMgsI?=
 =?us-ascii?Q?LGHPCbCPUHAeoWSiMhHzKuahYg0j8SaWNF4j9XOmrzelH6R3Wi6+NzReezml?=
 =?us-ascii?Q?xwPcD6IG0eAngG+6AKUfwGZ0KG1mL9bM0T9cHvzaW/xuIf1j/frQ9BMkc4Tx?=
 =?us-ascii?Q?eJrDvfdrFA0jlpW1PXu+srLA/2uivf0FwMOVXWMgL7FkR2JmvAZpAlAoCcxP?=
 =?us-ascii?Q?g5UfFW295jRtALDpXUiCpPxZwMVpvUfY3zZOdKkjSznGP7pVLFxDwxEB9jYJ?=
 =?us-ascii?Q?jJL7Tf6ENgh51zFWNI+3Xm3J5MGWXdiIwBtFcAkfEOxkpcIPRnrkXAS/YXG2?=
 =?us-ascii?Q?zvH7ngu9hpB2GGwT3Lq40Yd5E+9n7rfCaBXOUwPZgXtHyz6dRuathv5shHqp?=
 =?us-ascii?Q?Ozu5eFaTU3CchZrAjbaP9wH/KUeaiGoBiYJt1h3LXUhEAmIstm6byPJZ/cki?=
 =?us-ascii?Q?MRcRdmj0l6iaYG1tI6oJCGPcAjScKZeeEZpO/R0yFe/lR21YgST6UFKONBOh?=
 =?us-ascii?Q?9S/M4d9IRA4EwxtreBIuN63iAPSKx0zcdlBDKVh0smfrjwaCrJ4uw6a+4pP2?=
 =?us-ascii?Q?GUzqo0/ffVvl93XlFVUPvWCjiOr3A54kD8AxG3LbKaOvzIQ6SI235t4jZP7E?=
 =?us-ascii?Q?uCzviqW4iEvJM2eotcD5aFh9sd+101QX/JdEt5BAbG98AcsV4BC0LksFa2q0?=
 =?us-ascii?Q?Hd3qLlKoBK0QjVxphrDnvIB8BQkPn+RdGd6TahV8JVMAe1SwNDccTkZeEUXN?=
 =?us-ascii?Q?EqawKY5GjXuc+XALz7ca3aOvdOAdQKV5uWF2fcbGw3nSTNHzJoXkGpKlVATw?=
 =?us-ascii?Q?QYo5rZI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:22:52.9131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950ee90c-b8f0-4886-f310-08dc7ebd1413
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
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

This series is a smaller subset of the prior series I posted, that aimed
to remove the ioctl layer between NVKM and the nouveau DRM driver.

Whilst this series doesn't go the full way, it aims to remove a bunch of
internal APIs that aren't useful anymore so they don't have to be ported,
and to cleanup a few paths in the DRM driver that have suffered from bit-
rot over the years to ensure it's safe to remove the ioctl layer next.

There's more details of the specific changes in the relevant commits.

A git tree is available at [1], and the remaining commits that were in
the prior series, but not this one, are available at [2].

[1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
[2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl

Ben Skeggs (34):
  drm/nouveau: create pci device once
  drm/nouveau: store nvkm_device pointer in nouveau_drm
  drm/nouveau: move allocation of root client out of nouveau_cli_init()
  drm/nouveau: add nouveau_cli to nouveau_abi16
  drm/nouveau: handle limited nvif ioctl in abi16
  drm/nouveau: remove abi16->device
  drm/nouveau: remove abi16->handles
  drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
  drm/nouveau/nvkm: remove perfmon
  drm/nouveau/nvkm: remove nvkm_client_search()
  drm/nouveau/nvif: remove support for userspace backends
  drm/nouveau/nvif: remove route/token
  drm/nouveau/nvif: remove nvxx_object()
  drm/nouveau/nvif: remove nvxx_client()
  drm/nouveau/nvif: remove driver keep/fini
  drm/nouveau/nvif: remove client device arg
  drm/nouveau/nvif: remove client version
  drm/nouveau/nvif: remove client devlist
  drm/nouveau/nvif: remove client fini
  drm/nouveau/nvif: remove device args
  drm/nouveau: always map device
  drm/nouveau/nvif: remove device rd/wr
  drm/nouveau/nvif: remove disp chan rd/wr
  drm/nouveau: move nvxx_* definitions to nouveau_drv.h
  drm/nouveau: add nvif_mmu to nouveau_drm
  drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
  drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
  drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
  drm/nouveau: remove nouveau_chan.device
  drm/nouveau: remove chan->drm
  drm/nouveau: remove master
  drm/nouveau: remove push pointer from nouveau_channel
  drm/nouveau/kms: remove a few unused struct members and fn decls
  drm/nouveau/kms: remove push pointer from nv50_dmac

 drivers/gpu/drm/nouveau/Kbuild                |   1 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  14 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h       |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c         |   9 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  21 +-
 drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |   8 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  57 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  14 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  24 +-
 drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  24 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   7 -
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 -
 drivers/gpu/drm/nouveau/include/nvif/client.h |  11 +-
 drivers/gpu/drm/nouveau/include/nvif/device.h |  37 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h |   5 -
 drivers/gpu/drm/nouveau/include/nvif/if0000.h |  10 -
 drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
 drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  27 -
 drivers/gpu/drm/nouveau/include/nvif/object.h |  26 +-
 drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
 .../drm/nouveau/include/nvkm/core/client.h    |   1 -
 .../drm/nouveau/include/nvkm/core/device.h    |   1 -
 .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
 .../drm/nouveau/include/nvkm/core/object.h    |  14 -
 .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
 .../gpu/drm/nouveau/include/nvkm/core/os.h    |  19 -
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
 .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 321 +++++--
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |   6 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  10 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   6 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c      |   6 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  96 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |   8 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 147 ++-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  39 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  17 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  21 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
 drivers/gpu/drm/nouveau/nouveau_led.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  38 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c        |   2 -
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  12 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
 drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
 drivers/gpu/drm/nouveau/nv04_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nv10_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c          |  10 +-
 drivers/gpu/drm/nouveau/nv50_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c          |  12 +-
 drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
 drivers/gpu/drm/nouveau/nvif/client.c         |  32 +-
 drivers/gpu/drm/nouveau/nvif/device.c         |  15 +-
 drivers/gpu/drm/nouveau/nvif/driver.c         |  32 +-
 drivers/gpu/drm/nouveau/nvif/object.c         |  40 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c    |  64 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |  91 +-
 drivers/gpu/drm/nouveau/nvkm/core/object.c    |  50 -
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  42 -
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 -
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 479 +++++-----
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   2 -
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  93 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  24 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867 ------------------
 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  | 165 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
 .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
 124 files changed, 948 insertions(+), 4048 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h

-- 
2.44.0

