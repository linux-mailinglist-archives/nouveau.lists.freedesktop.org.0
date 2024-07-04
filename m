Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E992AD46
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2410E217;
	Tue,  9 Jul 2024 00:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uabfN04z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4110E217
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3+qn/WJZX8R1BCXHX+Oe/MFcI2IRYvNT01ImwDL0BUokjHsYdxIrVlt8ArRkIw+acefUtcyKzVezVeFQ0bDht7o7PHo7vJyzZsfMigys0FakxgRDswBFLWU+XhDTztxoC8O6YXXGBt3/RQf31vcJ5Iya1yfI5rSRyT6UNjYsoN3JfHAaSs2irOvczo6uzitpqwqp6xnIo3YJE/fstNGEzUw62cx7hdVnxVRUAU4Jv+jjxGyZWjpFLukxWDlTFIVPmmnG2XCtfVzcoriBDlmMVRFKeix2a37IxjiYRf8o4GRU+k6aTdulcQ56B8Y1B2OIvceh4+nwJ+Ev376ZzKUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewOOi708pFsPtYcxcx2P7/w5/UMUn5dZAC2GPBBXZl8=;
 b=VGP9mQ6g+NvNealu9y+yAVQoXh3HCkKFO72FTCxHlqXNeBrNj8dNiveJKRrd/hq1o/F+g+0pwcQkJiQpW3UufLG7hnHbFzq3599hTsO+WazBrTVXIyDOvaDMHCOMg+LOvlBQDdRbCZfrX7b5bUXg3OOo71Mt9a5PBfoVPRDJ0+cGs04tyZr4RAWvtapZbHC75G5nHWqUNh1zmbBV/EzYg4cDIFTTHYuJjN4adzCe9xnGN3uZX0ICHQ6iw8EP/0rKl5lU9YyDgDA66U17ifP6kCkEOFoSJf0Q8bDi8N1FCe3nFGMEn5GIUnVloHdr4Usj7bCKIqVXla+5lCs43KrDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewOOi708pFsPtYcxcx2P7/w5/UMUn5dZAC2GPBBXZl8=;
 b=uabfN04zJlMt2Qk6yxO5Eq25Ij9LjGirQlz+41XCxhn/NUW/fifZArrOqtTLX6MVH4IgJtJSXjYCr5stD2rQrMbicB84oWF1q9FOEJbSnK6LXAfN4oZxEyb5qqHmqnHv4cRHvgJnFbBPoXzIJgGo7d5urMqtBXc9rONJzLSzDCTI4P5lBJfCezcrmuEqBJMEpG7YuD7JizNW1GArPlDJNnRR4boDimolz6kC7Oj92X2e2TSDxBW7yz36wCI4ymuwICkE7y+iSB2zqCTUMMG5DR0+NEOBC2jaZun3XeHssJLnSZi8AhbIbcRt7zaxJaxW37oJ+nvI+W8OiNiebuUSqA==
Received: from BN7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:408:34::23)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:54:57 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::2d) by BN7PR06CA0046.outlook.office365.com
 (2603:10b6:408:34::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:54:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:48 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 00/37] drm/nouveau: misc. cleanups and removal of unused
 apis
Date: Fri, 5 Jul 2024 04:36:44 +1000
Message-ID: <20240704183721.25778-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: a206dee0-7c4f-4a75-4f23-08dc9fb1c0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5aXYIWs5AL0nZBA1NM0DRwb+QJRPsrjLcCfM8GetAjpa2biVzshyP/HYxSY/?=
 =?us-ascii?Q?8xiUl8mR74KFVNKuVz4l981vtYvkjggtXDuMHJTs5jJZlSuF+K9Q1ct0ve1Z?=
 =?us-ascii?Q?zDJUFMHTP2zPNUdIyntw8jZ0QPpkRg+IZ12ZHnBe5Sr+McCD/HVkSpaSbwz5?=
 =?us-ascii?Q?XONvWECRJfJdch/l79pPMRQOL8VJIrYcwkTuzmidiFXhJh2GCjoZBnjllsBH?=
 =?us-ascii?Q?NGdEsV6BjGOQ3d6IaggZWdBkDW566/jMBb63h8LfQbUKo12NxmtEgHSf5/4+?=
 =?us-ascii?Q?BEG7gG8pWz7koKTExRp2Q31t/Yk34Epfj4VtDbh75ni/Bzj+dQmtsUp+5/kp?=
 =?us-ascii?Q?NQNXQX2PbW3v0nq9/0SAlvbUQVUJ2Bu2PHxmGzmG1/6zSIeXdqndwE+Tr4yG?=
 =?us-ascii?Q?QZ4k2oILg3kRe/6sDCHJh+sHvSRA3RKR06oLaoUT3RGM/kNcazRty+U5eqk2?=
 =?us-ascii?Q?NvnNQ5KBCmi1naOclNbQ1CdAbYYW2s+Y5/3mArKpLrjitsDh97eM99EGc9OC?=
 =?us-ascii?Q?4/UouTjjnEWKgFhqOLmh2ZHsI4jif2fWyQg9Sy0qUtupxoIBShPIeMNTdjnG?=
 =?us-ascii?Q?uj+ocNCEpl586oXDIWyXiXXzDwPXdeiFB7xbXncAOYmIeJL6Yt7b/ArWMgPl?=
 =?us-ascii?Q?OyHhvDP/0EP4u9B9k9tn/s4NneviMh0J6i3EJwxSfgzoBSo+bT5EJ4fHt+Bn?=
 =?us-ascii?Q?hU01cSG/0bSWYy0Uy/Q44+nXhaR/pHR69n0kb9+U845ok/dAjbz7KU75ktpf?=
 =?us-ascii?Q?NIKFQ+PSn7bz0pClCohXOtEzqA40VVlNj9xZkATXYHT22cWvvm+epg6ync5i?=
 =?us-ascii?Q?GzwwgzkraonII7sIqMAakW9kqxkSYWP4bNUU3sH6xtKyc5yLfMEMK1SnM6VB?=
 =?us-ascii?Q?9x3/VU5xJj1ziSO/aurPsrZE/JAZcgAue7jZCORG3LW8DSBX5kh0gKZ5MT1n?=
 =?us-ascii?Q?wIRiLyJM4QBc8Bg331wu2tqrpUA9kd5/2ixa0+AvR3DL0du2qlIwmP71dJg5?=
 =?us-ascii?Q?3fAlPKbyGCe1GxWgmnUHPdBBjhXzTWP01DRTcswWoQpySne5eLJqAkYCwjY2?=
 =?us-ascii?Q?ymwvzBvTn8bwRuPwg0vFk4+aWAXP5XiD7jgm8GECsgm6AGvBwzn0zHetfHJr?=
 =?us-ascii?Q?mw7p5RxoHbF654Z9PUq84bHz2zx4q1P61i8nSoIxd5ki56C/p52iDgrhKy/H?=
 =?us-ascii?Q?ZugvjzxGcURewjJHoMhaT8F3mDeYRGZ0fM7APj8ixZ187XXRQXtsc3a2sv/L?=
 =?us-ascii?Q?QA9HIuJddroZIhb1xOZ9j+65tHbjXHdsn6JVZGJEfozxSu9ViYr8N6R1ibt3?=
 =?us-ascii?Q?7bqQYyl+DdV8suYJ2u3VVgCQYAaBByCOp8TNJxwv+4sPGonZiJHIDSQksDLz?=
 =?us-ascii?Q?k6dbGZ6/LlJOyfgfZIELBN/1yfrHlk3rGARK3GLaHHYJ7Cw3YdUtRSB2thW9?=
 =?us-ascii?Q?PCMS6WSxx6J0shi27DBUYVcMNtZzDRcu?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:54:57.3655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a206dee0-7c4f-4a75-4f23-08dc9fb1c0fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

v2:
- prepended a couple of patches that begin to cleanup pci vs tegra
  paths, addressing some comments about variable naming, more in a
  future series
- rebased on current drm-misc-next
- other changes mentioned in their relevant commits

[1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
[2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl

Ben Skeggs (37):
  drm/nouveau: move nouveau_drm_device_fini() above init()
  drm/nouveau: handle pci/tegra drm_dev_{alloc,register} from common
    code
  drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  74 +-
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
 drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
 drivers/gpu/drm/nouveau/nouveau_display.h     |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 395 ++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  51 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  17 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  21 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
 drivers/gpu/drm/nouveau/nouveau_led.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  38 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c        |   2 -
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  11 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  12 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
 drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
 drivers/gpu/drm/nouveau/nouveau_vga.c         |  14 +-
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
 128 files changed, 1105 insertions(+), 4199 deletions(-)
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
2.45.1

