Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3CABA6FC
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B3110E101;
	Sat, 17 May 2025 00:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VzJLqjId";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9C610E070
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOPU2Abd3MaqMeCS0+aKIDUPSR8L0tNrNnChysNrok9Fj8I44inKicmeZWCG9O/Mu20B2qs3ckiibGQq7GJnyPZ10KzGORVYPV4uuiQrRy3zJMvUdiDEAW8YA077s6JY5QCAZUaupADLlqJ/LxtCEXAP5+VMvLSE2ffT4uW+5rbDfF/nTyvr7UlmrCsLUyeK+hjbqnKTuE4I9lHPiM7frCXCuk1dADoABuWg6qAFFNb890HgMlnRDgJsJqu2WdonGeeYaB/S4yScmWBLGLveQ0hA5VTjdTUGIYsNc+WyWDstSY+iL1MNnLct+eNEDxYAbBUtqjBLuWYxXCwu6/sYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIymB4PtdD/p06d/ng8uRJWn6HpRHD91RM22VygyfB4=;
 b=i+XpTuEdhGX0HkBklLY6PhsjL9WqOdLsUG2zDYNFZMho+voGyrMqF8RIdfvvf80HuoLe2ZOOJW+3V5YMllwVswZP2gDbOxmw9PNdH3rASfNzDdn5O6KYiUBWtLPM4J87cA10DS0GcVjLtR5VwSqSdX93EWgu8ygq3sErz2sNLDkn7Xelf89flj/u/TxDSifLnLm2tfmYGXZOhm/z/2qgRAIXQ3WliHHRBOULZYu8aFVTka/t9cmqipCYdaPZUg/krRVYMe9jMbY/QrxHADQYwPilqUAbKR1SJFYjhMLZr3ssUJHh1kkyPEn2jPRxzBRG0NhEdmyTzFhdu+PMP+zyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIymB4PtdD/p06d/ng8uRJWn6HpRHD91RM22VygyfB4=;
 b=VzJLqjId6Y3ptgKl3WEnCNpIkzMWDFBndzRusB/JHf3xJ/11MvCLmnbltkUMIkCVAbZagkUqf3CVUK0LIj0e7agszYB851LAQl5DArlRhxKI6shUfu1FhCNaRrfdeOMEAuwJm/ew8NZN2pTWxsK9mKVyBjiSxOgCFsYuet/wUbRcqxzoQHzpqlNe2Ggr+e19Q1rOwQtuI4S7WT+Qsx9lIZoS38Awm0uGCxDQ54uzaQJ/U7VwwAOOKKPfurqaq9tQ3ERSDkTr8SviMIg8m2XHR+sR9YbNPKBXQH27uRDnhAjSV6UXpp0o+CtzsH17fmjvI5HnB4gDeQlsybNxs/Zt2g==
Received: from SJ0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:a03:39e::8)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:23 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4e) by SJ0PR03CA0273.outlook.office365.com
 (2603:10b6:a03:39e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Sat,
 17 May 2025 00:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:08 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 00/62] add support for Hopper and Blackwell GPUs
Date: Sat, 17 May 2025 10:08:52 +1000
Message-ID: <20250517000954.35691-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a089b1-84fe-450e-cfcb-08dd94d7374a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wuARZ+glf0B4rzTR6ABY1RcHKmM3o9ro3EPTZ1IPYVzPjgSvnzsfGC+sh2Zq?=
 =?us-ascii?Q?xTctsiKpaijY4jqe0HE1PT/hn0ExQLgp6ZMRST4SK5aFKzyWb6+r9IPAgT8B?=
 =?us-ascii?Q?Cn5loJYwSKgPI9t605Prf2IQ/aBf3X3CJmxAetJ8xXAvujh6am0M7jcIDA1c?=
 =?us-ascii?Q?7CbAagDydLRReQNGPauLTVXds1UK06tVk8oOeYD7GP/XW9GEaSD/Gy2U0HDL?=
 =?us-ascii?Q?At29wVkxsSNb74NEcD/NujNvIxaOSSWle8g0fS2T9jgdm4a3DIdpdJiF4HcZ?=
 =?us-ascii?Q?hLl+qajGv2YIBFXkvNsUEwro1eIaHIz5YRjAdQv5o4paVi1VeArG96RKnCKs?=
 =?us-ascii?Q?4sgFc4+82Hus1a9EfgBciyH4U1Lqh4sM8hOxuRnElCx3hQalNi8Un4gSdvGA?=
 =?us-ascii?Q?zKHmFoEaKTEMecHKPkYK82LJyzFycnS8TVfBIAQll+OVMH2XAL1vhm+xL3XV?=
 =?us-ascii?Q?UB4SeZZKC2H1X542dDIwkCODr2XmD6OjvC8YFdDiBDJ8JfsmXpz7Iy/ZOPsf?=
 =?us-ascii?Q?12izw9z371YHuGKqyJtcn4cWVxHruAaYwtTjHbZ3CkZ4g0db4dWkQMa+Vug3?=
 =?us-ascii?Q?7a+1oxZBh/48fpXg5X7Gcpsy2amhzryOYTTYtlPuKIs7ABXnGzzq6K0RzPOE?=
 =?us-ascii?Q?gKbE1ZjVg+qNXNLCr6rFWCYb8bagLwKxqsCWuApH/DuGN5qOJhZGXxa4C7kM?=
 =?us-ascii?Q?utvf/8/Om9COWNrFRfArrBxySRaXXoUmVS7uOxOidX+ccH6ndk3YGegoN+Me?=
 =?us-ascii?Q?HZUQWHeNWZYg542L2QfbDNHTNFlxO9g1Ipprkl6bBBj424QDsbqh71BTUIa1?=
 =?us-ascii?Q?avLiRTO4OjZt84gm3HtWxbN2/qVcdwXgylwb98w6d6JCale03aEy2sL+6gbL?=
 =?us-ascii?Q?eC3Xu7i4XbgpHDdUl7u6s8sMMQL3or/Tj45DR2IkKvx4+mEH0J6XvJZmhiOX?=
 =?us-ascii?Q?wfaojlm2HBJ0huaHfP2nsK9QUtsKghjGYgzTts/fhzjoAX7KYnyJ5d4PkNcj?=
 =?us-ascii?Q?D1eQEcSOFkGMvrRzeSzYGRrwJQiZHroXyKJU+WwnOxgT5TxW6r0ltzXmQw3K?=
 =?us-ascii?Q?JBgxbhDlIq3OizchYusxAiAiedSFjVVJ93wX+0yi/hQBUCWcrQcr8Jz9y9LE?=
 =?us-ascii?Q?ExqEhm61nrK3EA8P9Dj4psMMGqjAsBsZwxih2RJTu+CPYcbVkztCWLsJRiO5?=
 =?us-ascii?Q?Z51AhpYsgqhe5VB5sUYiBDB8R8TbyjZoLPEU5VIrZ3Ub3CfkDMW0aH3T72yM?=
 =?us-ascii?Q?ilwpWdNr+ljsbfwxGTlpSlO3tY/0ZX4hJAZpNKfQwBUFHxHniMrNxQvEYhH3?=
 =?us-ascii?Q?CPKV68CUqjckRS2gKSZFrG7Bx5ivLeUhvJq4Gh+JiptlDB3dwYu80aasF+CP?=
 =?us-ascii?Q?JwLQbR9zM3AUi7gbdW1z18VLJyTK91+ymMPZKa92PknIO1tHGQhrL17Sd7nW?=
 =?us-ascii?Q?+OdtssXZTu7SwzwBD2eR8UAfONESu6rJn5qruujuSPNcH7NPTiredl95SJSQ?=
 =?us-ascii?Q?qFRykPrc1EKh05LrHwD05lan0NQWin4TaLG3AdvcdS9A5d+2BWq2VplAjg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:22.1950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a089b1-84fe-450e-cfcb-08dd94d7374a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
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

This series implements support for booting GSP-RM firmware version
570.144, and adds support for GH100, GB10x, and GB20x GPUs.

A tree containing this series is available here[1], and a temporary
linux-firmware tree here[2].  Timur will send an official patch to
the linux-firmware tree once this series is closer to being merged.

The series is broken down as follows:

Patches 1-2 are simple fixes for both the RM shutdown wait condition,
and chid allocation.  Neither are known to fix any pressing issues,
but kept separate in case they need to be backported.

Patches 3-5 bump up the maximum instance counts of various engines to
support those available on r570 / newer HW.

Patches 6-14 split up the GSP-RM code into modules (roughly) around RM
API boundaries, and move all the r535-specific code and headers under
nvkm/subdev/gsp/rm/r535 to make it easier to contain version-specific
code.

Patches 15-20 reduce the amount of boilerplate needed to implement
engines and engine objects when running on GSP-RM by adding a common
implementation which can be used for all engine types.

Patches 21-45 add a bunch of simple HALs around the RMAPI calls that
change between r535 and r570, and, finally, adds support for 570.144.

Patches 46-54 add support for GH100 Hopper GPUs

Patches 55-58 add support for GB10x Blackwell GPUs

Patches 59-62 add support for GB20x Blackwell GPUs

More details on the various changes are in the specific commit messages.

v2:
- switch to shorter spdx headers on source files
- minor adjustments to some comments
- fix tu10x regression with r570

v3:
- fixes for a couple of gsp-rm heap leaks

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>

Ben Skeggs (61):
  drm/nouveau/gsp: fix rm shutdown wait condition
  drm/nouveau/gsp: remove gsp-specific chid allocation path
  drm/nouveau/ce: bump max instances to 20
  drm/nouveau/nvenc: bump max instances to 4
  drm/nouveau/ofa: bump max instances to 2
  drm/nouveau/gsp: split rpc handling out on its own
  drm/nouveau/gsp: split rm ctrl handling out on its own
  drm/nouveau/gsp: split rm alloc handling out on its own
  drm/nouveau/gsp: split client handling out on its own
  drm/nouveau/gsp: split device handling out on its own
  drm/nouveau/gsp: move firmware loading to GPU-specific code
  drm/nouveau/gsp: move booter handling to GPU-specific code
  drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
  drm/nouveau/gsp: switch to a simpler GSP-RM header layout
  drm/nouveau/gsp: add gpu hal stubs
  drm/nouveau/gsp: add display class ids to gpu hal
  drm/nouveau/gsp: add usermode class id to gpu hal
  drm/nouveau/gsp: add channel class id to gpu hal
  drm/nouveau/gsp: add common code for engines/engine objects
  drm/nouveau/gsp: add defines for rmapi object handles
  drm/nouveau/gsp: add hal for wpr config info + meta init
  drm/nouveau/gsp: add hal for gsp.set_system_info()
  drm/nouveau/gsp: add hal for gsp.get_static_info()
  drm/nouveau/gsp: add hal for gsp.xlat_mc_engine_idx()
  drm/nouveau/gsp: add hal for gsp.drop_send_user_shared_data()
  drm/nouveau/gsp: add hal for disp.bl_ctrl()
  drm/nouveau/gsp: add hal for disp.dp.set_indexed_link_rates()
  drm/nouveau/gsp: add hal for disp.get_static_info()
  drm/nouveau/gsp: add hal for disp.chan.set_pushbuf()
  drm/nouveau/gsp: add hal for fifo.xlat_rm_engine_type()
  drm/nouveau/gsp: add hal for fifo.ectx_size()
  drm/nouveau/gsp: add hal for gr.get_ctxbufs_info()
  drm/nouveau/gsp: add hal for gsp.set_rmargs()
  drm/nouveau/gsp: add hals for fbsr.suspend/resume()
  drm/nouveau/gsp: add hal for disp.get_supported()
  drm/nouveau/gsp: add hal for disp.get_connect_state()
  drm/nouveau/gsp: add hal for disp.get_active()
  drm/nouveau/gsp: add hal for disp.dp.get_caps()
  drm/nouveau/gsp: add hal for fifo.chan.alloc
  drm/nouveau/gsp: add hal for fifo.rsvd_chids
  drm/nouveau/gsp: add hal for fifo.rc_triggered()
  drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
  drm/nouveau/gsp: add hal for gsp.sr_data_size()
  drm/nouveau/gsp: add common client alloc code
  drm/nouveau/gsp: add support for 570.144
  drm/nouveau/pci: add PRI address of config space mirror to
    nvkm_pci_func
  drm/nouveau/instmem: add hal for set_bar0_window_addr()
  drm/nouveau/mmu: bump up the maximum page table depth
  drm/nouveau/gsp: fetch level shift and PDE from BAR2 VMM
  drm/nouveau/gsp: init client VMMs with
    NV0080_CTRL_DMA_SET_PAGE_DIRECTORY
  drm/nouveau/gsp: support deeper page tables in
    COPY_SERVER_RESERVED_PDES
  drm/nouveau/gv100-: switch to volta semaphore methods
  drm/nouveau: improve handling of 64-bit BARs
  drm/nouveau: add support for GH100
  drm/nouveau: add helper functions for allocating pinned/cpu-mapped bos
  drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from
    CHANNEL_DMA
  drm/nouveau/gf100-: track chan progress with non-WFI semaphore release
  drm/nouveau: add support for GB10x
  drm/nouveau/gsp: add hal for fifo.chan.doorbell_handle
  drm/nouveau: add support for GB20x
  drm/nouveau/kms: add support for GB20x

Dave Airlie (1):
  drm/dp: add option to disable zero sized address only transactions.

 drivers/gpu/drm/display/drm_dp_helper.c       |   39 +-
 drivers/gpu/drm/nouveau/Kbuild                |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |   22 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild       |    4 +
 drivers/gpu/drm/nouveau/dispnv50/core.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/core.h       |    6 +
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |    1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |    3 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |    2 +
 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c   |  122 ++
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |    4 +
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c    |   98 +
 drivers/gpu/drm/nouveau/dispnv50/curs.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   30 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/head.h       |    5 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c   |  297 ++++
 drivers/gpu/drm/nouveau/dispnv50/wimm.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   25 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h       |    3 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |    1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c   |  209 +++
 drivers/gpu/drm/nouveau/gv100_fence.c         |   93 +
 .../drm/nouveau/include/nvhw/class/clc36f.h   |   52 +
 .../drm/nouveau/include/nvhw/class/clc97b.h   |   22 +
 .../drm/nouveau/include/nvhw/class/clca7d.h   |  868 +++++++++
 .../drm/nouveau/include/nvhw/class/clca7e.h   |  137 ++
 .../include/nvhw/ref/gb100/dev_hshub_base.h   |   28 +
 .../include/nvhw/ref/gb10b/dev_fbhub.h        |   18 +
 .../nouveau/include/nvhw/ref/gb202/dev_ce.h   |   12 +
 .../include/nvhw/ref/gb202/dev_therm.h        |   17 +
 .../include/nvhw/ref/gh100/dev_falcon_v4.h    |   20 +
 .../nouveau/include/nvhw/ref/gh100/dev_fb.h   |   15 +
 .../include/nvhw/ref/gh100/dev_fsp_pri.h      |   28 +
 .../nouveau/include/nvhw/ref/gh100/dev_mmu.h  |  173 ++
 .../include/nvhw/ref/gh100/dev_riscv_pri.h    |   14 +
 .../include/nvhw/ref/gh100/dev_therm.h        |   17 +
 .../include/nvhw/ref/gh100/dev_xtl_ep_pri.h   |   10 +
 .../include/nvhw/ref/gh100/pri_nv_xal_ep.h    |   13 +
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |   76 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |    2 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   35 +
 drivers/gpu/drm/nouveau/include/nvif/object.h |    2 +-
 drivers/gpu/drm/nouveau/include/nvif/push.h   |   14 +-
 .../gpu/drm/nouveau/include/nvif/push906f.h   |    1 +
 .../gpu/drm/nouveau/include/nvif/pushc97b.h   |   18 +
 .../drm/nouveau/include/nvkm/core/device.h    |   17 +-
 .../drm/nouveau/include/nvkm/core/layout.h    |    7 +-
 .../drm/nouveau/include/nvkm/engine/disp.h    |    1 -
 .../drm/nouveau/include/nvkm/engine/fifo.h    |    3 -
 .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |    1 -
 .../drm/nouveau/include/nvkm/engine/nvdec.h   |    2 -
 .../drm/nouveau/include/nvkm/engine/nvenc.h   |    2 -
 .../drm/nouveau/include/nvkm/engine/nvjpg.h   |    8 -
 .../gpu/drm/nouveau/include/nvkm/engine/ofa.h |    9 -
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |    3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fsp.h |   24 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  100 +-
 .../drm/nouveau/include/nvkm/subdev/instmem.h |    6 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |    4 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |    1 +
 .../common/sdk/nvidia/inc/class/cl0000.h      |   38 -
 .../common/sdk/nvidia/inc/class/cl0005.h      |   38 -
 .../common/sdk/nvidia/inc/class/cl0080.h      |   43 -
 .../common/sdk/nvidia/inc/class/cl2080.h      |   35 -
 .../nvidia/inc/class/cl2080_notification.h    |   62 -
 .../common/sdk/nvidia/inc/class/cl84a0.h      |   33 -
 .../common/sdk/nvidia/inc/class/cl90f1.h      |   31 -
 .../common/sdk/nvidia/inc/class/clc0b5sw.h    |   34 -
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073common.h |   39 -
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h    |  166 --
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h |  335 ----
 .../inc/ctrl/ctrl0073/ctrl0073specific.h      |  216 ---
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |   65 -
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h    |   48 -
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |   31 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h   |   40 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h |   35 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080event.h  |   41 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |   51 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h   |   52 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |  100 --
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |   41 -
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  162 --
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h     |   95 -
 .../nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h |   42 -
 .../common/sdk/nvidia/inc/nvlimits.h          |   33 -
 .../535.113.01/common/sdk/nvidia/inc/nvos.h   |  148 --
 .../common/shared/msgq/inc/msgq/msgq_priv.h   |   97 -
 .../uproc/os/common/include/libos_init_args.h |   52 -
 .../nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |   79 -
 .../nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  |  170 --
 .../arch/nvalloc/common/inc/rmRiscvUcode.h    |   82 -
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h |  100 --
 .../nvidia/generated/g_allclasses.h           |   33 -
 .../nvidia/generated/g_chipset_nvoc.h         |   38 -
 .../535.113.01/nvidia/generated/g_fbsr_nvoc.h |   31 -
 .../535.113.01/nvidia/generated/g_gpu_nvoc.h  |   35 -
 .../nvidia/generated/g_kernel_channel_nvoc.h  |   62 -
 .../nvidia/generated/g_kernel_fifo_nvoc.h     |  119 --
 .../nvidia/generated/g_mem_desc_nvoc.h        |   32 -
 .../535.113.01/nvidia/generated/g_os_nvoc.h   |   44 -
 .../nvidia/generated/g_rpc-structures.h       |  124 --
 .../nvidia/generated/g_sdk-structures.h       |   45 -
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h     |   74 -
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h   |   86 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h   |   33 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h |   57 -
 .../inc/kernel/gpu/gsp/gsp_static_config.h    |  174 --
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   57 -
 .../nvidia/inc/kernel/gpu/nvbitmask.h         |   33 -
 .../nvidia/inc/kernel/os/nv_memory_type.h     |   31 -
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |   51 -
 .../nvidia/kernel/inc/vgpu/sdk-structures.h   |   40 -
 .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |    2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   84 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h          |    7 +
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   99 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |   16 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |    2 +
 drivers/gpu/drm/nouveau/nouveau_dma.c         |  103 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h         |   13 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |   18 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |    7 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   12 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h       |    1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   10 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   12 +-
 drivers/gpu/drm/nouveau/nv10_fence.c          |    6 +-
 drivers/gpu/drm/nouveau/nv17_fence.c          |   15 +-
 drivers/gpu/drm/nouveau/nv50_fence.c          |   15 +-
 drivers/gpu/drm/nouveau/nv84_fence.c          |   19 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |    6 +
 drivers/gpu/drm/nouveau/nvif/chan.c           |  156 ++
 drivers/gpu/drm/nouveau/nvif/chan506f.c       |   72 +
 drivers/gpu/drm/nouveau/nvif/chan906f.c       |   93 +
 drivers/gpu/drm/nouveau/nvif/chanc36f.c       |   77 +
 drivers/gpu/drm/nouveau/nvif/disp.c           |    1 +
 drivers/gpu/drm/nouveau/nvif/user.c           |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |    2 -
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/gb202.c    |   16 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c |  108 --
 .../gpu/drm/nouveau/nvkm/engine/ce/tu102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  189 +-
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   32 +-
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |    3 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   18 +-
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |    7 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |    3 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |   52 -
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |    7 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   50 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |    5 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gb202.c  |   14 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/gf100.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |    4 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gv100.c  |    1 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv40.c   |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv50.c   |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |    4 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild |    3 -
 .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |    2 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c |  508 ------
 .../gpu/drm/nouveau/nvkm/engine/gr/tu102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |    4 -
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c |   12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/priv.h  |    3 -
 .../gpu/drm/nouveau/nvkm/engine/nvdec/r535.c  |  110 --
 .../gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c |   12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |    4 -
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c |   44 -
 .../gpu/drm/nouveau/nvkm/engine/nvenc/priv.h  |    3 -
 .../gpu/drm/nouveau/nvkm/engine/nvenc/r535.c  |  110 --
 .../gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c |   12 +-
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild  |    5 -
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c |   44 -
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c |   44 -
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h  |    8 -
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c  |  107 --
 .../gpu/drm/nouveau/nvkm/engine/ofa/Kbuild    |    6 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/ad102.c   |   44 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga100.c   |   44 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga102.c   |   44 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/priv.h    |    8 -
 .../gpu/drm/nouveau/nvkm/engine/ofa/r535.c    |  107 --
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild    |    1 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/Kbuild    |    2 -
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |   14 +-
 .../gpu/drm/nouveau/nvkm/subdev/bar/nv50.c    |    4 +-
 .../drm/nouveau/nvkm/subdev/devinit/fbmem.h   |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |    3 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fb/gb100.c    |   34 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/gb202.c    |   30 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/gh100.c    |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild    |    8 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/base.c    |   66 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c   |   24 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c   |   45 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c   |  275 +++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/priv.h    |   29 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |    5 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   27 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   42 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   17 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |   27 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c   |   35 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c   |   38 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c   |  358 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   41 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |   19 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    |   39 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/client.c   |   49 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/engine.c   |  189 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/engine.h   |   20 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga100.c    |   28 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    |   39 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c    |   30 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c    |   44 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gh100.c    |   30 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |   70 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c   |   87 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h   |   55 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h  |   18 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c    |   33 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c    |   33 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |   25 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/alloc.c   |  112 ++
 .../subdev/{bar/r535.c => gsp/rm/r535/bar.c}  |   41 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c  |   46 +
 .../ga100.c => subdev/gsp/rm/r535/client.c}   |   35 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c    |   93 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/device.c  |  148 ++
 .../disp/r535.c => subdev/gsp/rm/r535/disp.c} |  394 ++--
 .../{instmem/r535.c => gsp/rm/r535/fbsr.c}    |   58 +-
 .../fifo/r535.c => subdev/gsp/rm/r535/fifo.c} |  417 ++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  356 ++++
 .../nvkm/subdev/gsp/{r535.c => rm/r535/gsp.c} | 1581 ++---------------
 .../ad102.c => subdev/gsp/rm/r535/nvdec.c}    |   35 +-
 .../gr/ad102.c => subdev/gsp/rm/r535/nvenc.c} |   37 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c   |   45 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/alloc.h      |   36 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/bar.h        |   29 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h |   15 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/client.h     |   20 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h       |   21 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/device.h     |   30 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/disp.h       |  741 ++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/engine.h     |  260 +++
 .../nvkm/subdev/gsp/rm/r535/nvrm/event.h      |   47 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h       |  106 ++
 .../nvkm/subdev/gsp/rm/r535/nvrm/fifo.h       |  350 ++++
 .../subdev/gsp/rm/r535/nvrm/gr.h}             |   64 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        |  825 +++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h      |   53 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h      |   17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h      |   17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h      |   17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/ofa.h        |   16 +
 .../subdev/gsp/rm/r535/nvrm/rpcfn.h}          |   55 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/vmm.h        |  132 ++
 .../ad102.c => subdev/gsp/rm/r535/ofa.c}      |   34 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   52 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c |  691 +++++++
 .../subdev/{mmu/r535.c => gsp/rm/r535/vmm.c}  |  118 +-
 .../nouveau/nvkm/subdev/gsp/rm/r570/Kbuild    |    9 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/client.c  |   28 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/disp.c    |  263 +++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    |  149 ++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fifo.c    |  217 +++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c  |  191 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  216 +++
 .../nvkm/subdev/gsp/rm/r570/nvrm/client.h     |   21 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/disp.h       |  355 ++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/engine.h     |  318 ++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |   19 +
 .../subdev/gsp/rm/r570/nvrm/fifo.h}           |  241 +--
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h |   79 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  634 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h      |   57 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/ofa.h        |   17 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h      |  249 +++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c |   28 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |   99 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  191 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h  |   18 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    |   38 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  271 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   20 +-
 .../drm/nouveau/nvkm/subdev/instmem/Kbuild    |    3 +-
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |    8 +-
 .../drm/nouveau/nvkm/subdev/instmem/gh100.c   |   28 +
 .../drm/nouveau/nvkm/subdev/instmem/nv40.c    |   10 +-
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |   17 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |    6 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c   |   25 +
 .../drm/nouveau/nvkm/subdev/mmu/memgf100.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    7 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgh100.c    |  306 ++++
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |    3 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |    2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |    1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c |    5 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/gf100.c   |    5 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/gf106.c   |    5 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/gh100.c   |   30 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/gk104.c   |    5 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/gp100.c   |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv04.c    |   25 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv40.c    |   25 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv46.c    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c    |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/priv.h    |   11 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/r535.c    |   11 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c    |    2 +-
 include/drm/display/drm_dp_helper.h           |    5 +
 343 files changed, 14630 insertions(+), 8101 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/headca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
 create mode 100644 drivers/gpu/drm/nouveau/gv100_fence.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_therm.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_therm.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/pushc97b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclasses.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-structures.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-structures.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan506f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan906f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chanc36f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{bar/r535.c => gsp/rm/r535/bar.c} (82%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvdec/ga100.c => subdev/gsp/rm/r535/client.c} (69%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
 rename drivers/gpu/drm/nouveau/nvkm/{engine/disp/r535.c => subdev/gsp/rm/r535/disp.c} (86%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{instmem/r535.c => gsp/rm/r535/fbsr.c} (84%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/fifo/r535.c => subdev/gsp/rm/r535/fifo.c} (65%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/gsp/{r535.c => rm/r535/gsp.c} (61%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvenc/ad102.c => subdev/gsp/rm/r535/nvdec.c} (68%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/gr/ad102.c => subdev/gsp/rm/r535/nvenc.c} (68%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/alloc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/bar.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/disp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/event.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fifo.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h => nvkm/subdev/gsp/rm/r535/nvrm/gr.h} (56%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ofa.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h => nvkm/subdev/gsp/rm/r535/nvrm/rpcfn.h} (83%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvdec/ad102.c => subdev/gsp/rm/r535/ofa.c} (70%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{mmu/r535.c => gsp/rm/r535/vmm.c} (50%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/client.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/client.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h => nvkm/subdev/gsp/rm/r570/nvrm/fifo.h} (62%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c

-- 
2.49.0

