Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D9BBF624
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E94310E54F;
	Mon,  6 Oct 2025 20:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U8f2UDnh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351510EBD1
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpOxzvTHA4hsWGnIvEWXz0G8Nh9v44OPmxC1BOtfXc4FKjd4+RXxiTG3YOmZVIqzUeJUJ4GFTz5mgK2X+Y/AzQYaQx/Md83oh8CTB6DOBZfy2tyNWRY/ez1LqmJat1Ymzk04FlMvz3zvYcXQhwADUVUaux3wiptKGuTMDYBI8/O4nbgHJRD+cfvYYJkv24YcYc6NKX5jlm82Cgyl6zYlS00aI9Jb/krJUdUBAonjHvy0EIK/ylDUakAvy8j4l2h2PnAVdwUl4nG5ljlFvCYNbE1IRf/7xlHDlXStYcfLtYPwFPVp6ez9HmUbw9oRwQN9KX1rUUaV+4MxlO/uLMosjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwi25omJ5J0gUtLo3vpRXBU4YmJjKUkXycc2LBWHTs8=;
 b=KEAlv0lXeQ680wF3w7esj8TGaZIgpJ5iMVXm+Mobzy820/TgHjs2OktcbM7fVBornRs7+EXmnLzljz6qU7n69mIGXPc6X7OLVHdqjThIpznJM/YnHDx/OUCbI28fcDgnP6DB+2pjKYVvQnD5DTS5fj6jB4DrxgvP8g6RbQhjHDZJHw/phMXvcTuO60UB/S81eWq1Y1YC1nfglVF2+z9vBb10kLQKYKAm0irTy7M8UCaj6OqPpJEolZzN6uCjHMK8FSoALQamUWwS0GWfXp8ZcX85CjNDuqdMeHqTLowVwMoBlyBLLRqxrwfWfJLWtinxQFon4nN6YQOvvwiy6MoVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwi25omJ5J0gUtLo3vpRXBU4YmJjKUkXycc2LBWHTs8=;
 b=U8f2UDnhvkWwf6Ecxu+xftrSTXoTNdC+Plh6fCOnPi9GZ5cipBCkSWslVL8Hxtfl6xCT7i2vvFqGUx3RWLIFL09o5Vq7gFEP5iwfOuQUncYf+JeYUTHSYrBdDOoXi/G8272xFqkJ1/NJpi8iFwDtbneWercrZc+laihoziJDff1ipRBIMA6sSaMMiSwFQpaYSCZ4DNo3hKPvzLltYYTY0lXnkjcNM6GbvKm04bF2Bw39++o31AIcTqz4X1Mf8BGaIJbGZ3qnmDF9/5aZWKTtTYVCdsHzxgSjB75EJQzhjRlBvu9WwQGdnL0tGL0nHAGwF+Scea30htw1rpV7QrOF3w==
Received: from CH0PR03CA0113.namprd03.prod.outlook.com (2603:10b6:610:cd::28)
 by PH7PR12MB8595.namprd12.prod.outlook.com (2603:10b6:510:1b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:10:43 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::4c) by CH0PR03CA0113.outlook.office365.com
 (2603:10b6:610:cd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.26 via Frontend Transport; Sat,
 17 May 2025 00:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:30 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 14/62] drm/nouveau/gsp: switch to a simpler GSP-RM header
 layout
Date: Sat, 17 May 2025 10:09:06 +1000
Message-ID: <20250517000954.35691-15-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|PH7PR12MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: 80394a82-ed54-4a34-ae30-08dd94d743c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YveiN8D7iIGFzFwv33R4JtLptItWW5VW2eadBzdn3gKsAvft3uFG9M8JISfH?=
 =?us-ascii?Q?9xXvVdc97UsJB37w3rShZvYd6HQfNEfnAWK9NC7qOHCcnAjhqGT6oXOImZWY?=
 =?us-ascii?Q?B600geL4dz6FGYZinzV2fu0LxbIDyKO9HIGL078PlVF6eotlmeQCm9tuS0QD?=
 =?us-ascii?Q?yUwD8olyJckH7VLSasWcDSGEasUh+kO92dhprFGMAyWIqzSm3r4kJKGotUIE?=
 =?us-ascii?Q?JA2BiktyRGVgyKyofGi7QsEC4sF8ku+/TyW1P+uw+rZKoplPheWS1iEIUMWJ?=
 =?us-ascii?Q?5BQQW9ty5oy0NFmk2TnNDfhCRXffmLE9UQiizdn0i4JNIKdFO9XXtC7+RaTD?=
 =?us-ascii?Q?8N7C8JezM1Ra8xvIFoHI4BizOHrj52F/DZsnk4DFmOoWjp1jgxWSVNo2UimC?=
 =?us-ascii?Q?fjEduwoKUNJap9++K1yFCsCv35tLkrWeJkyMSuH7Kk21nesiDYTJJXnN7wye?=
 =?us-ascii?Q?u1LU4WYHMYR/1C6r7XbfFVvaIQjoua0hocrJL9rrp/ZzZjcnvgFDVhdhSn3w?=
 =?us-ascii?Q?4Vo1SWVrQHI/RRHt4tmtC83vLU2j+4k93Emvhx6pk9Wa1zKoIvpm8el4wDP/?=
 =?us-ascii?Q?qhjgCI9qT7LB3dUWRNUypmpRZsVIltpN7QemEnfWZgj2ulM5KZiSb/Q3rgnQ?=
 =?us-ascii?Q?Ny/QHVUsRgT25PxMumx3Qu6Z2qq99SMAtrAalAx8jolkXyE4i86nXoBSHW9n?=
 =?us-ascii?Q?V0hfSVIQhlG632LTgN1LFVcbTmLzHTi0jpbHtywqsoMpdLozVLXl3K8BkygK?=
 =?us-ascii?Q?TahBKCilCHrEapR8+yJgA3F3BU0YmQuj5aiUfcxV2Ip5gAqBZ0x5MvCoUc8N?=
 =?us-ascii?Q?H+LRP9CbFKUNvZhszhUWcY74POfVGY8e0fgEg5gCZzWalNy0xUn0x27C/OID?=
 =?us-ascii?Q?inxWXc/YHqAV8NfDJx2s0KcAUQw/OwoSplZNYSHr3KywzXoeELZbSVxTXn4V?=
 =?us-ascii?Q?MNvM0bHLLB3rtYK17sqEQ/Y1QKTbgEJlR2J+CldUr3PyHDWqeyHr/tysfMTu?=
 =?us-ascii?Q?q0KxzQvRZ4fB+78qJqTAOTBQSLISXhRJHRLCqCoOQEChvtES1OVVDIiG8bTB?=
 =?us-ascii?Q?ZKFWKfAP2HpPKNAwv9a8d0bodH0fEXffDiJSzf60h2Wlu68iD1oZgp3mizHJ?=
 =?us-ascii?Q?wPdnSN0FsKxrCIaP9ZJeZw/D/pFGtORmODF24xLDVJsNIzPQQnzFvwrHSJEr?=
 =?us-ascii?Q?7i3IwKWOFIkBi7vUaqmVfbpMY9u6VPMvOiDNtYEjMMumWUBZDE5quJzhIhh5?=
 =?us-ascii?Q?xDKtyu9wvJiEkJjRMZG0PhcAVP0MjOsHYjGy8I16WA+EpbGTicgBgqyJD6fq?=
 =?us-ascii?Q?k8jc7DGjWlTDXJLzBIHpwMPpTaBZbqmtIkQAYmpdtHmxr3BDl/kSh8aSbZap?=
 =?us-ascii?Q?1t2/KhZYG0ZeWGF4bth6aKR7JCQR8pjJt86dT6rNJZDuoCt4sHAHHJHE+AMY?=
 =?us-ascii?Q?cH9A4RU6sEmuuFH0VVojefjvLS+ua376iDNFn8y3vsD+K9JEoeO85lrvnL/6?=
 =?us-ascii?Q?93l59EGhluMngjj5BBTFNOHM6NFqfrmS4wWiZNwXCCEXnWEFMy4kQPLrsA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:43.1040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80394a82-ed54-4a34-ae30-08dd94d743c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8595
X-Mailman-Approved-At: Mon, 06 Oct 2025 20:47:07 +0000
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

Rather than using OpenRM's directory structure for headers, move to a
layout that's split roughly around RM API boundaries.

Also move the headers from include/nvrm to subdev/gsp/rm/r535/nvrm,
with the rest of the r535-specific code.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../sdk/nvidia/inc/alloc/alloc_channel.h      | 170 ----
 .../common/sdk/nvidia/inc/class/cl0000.h      |  38 -
 .../common/sdk/nvidia/inc/class/cl0005.h      |  38 -
 .../common/sdk/nvidia/inc/class/cl0080.h      |  43 -
 .../common/sdk/nvidia/inc/class/cl2080.h      |  35 -
 .../nvidia/inc/class/cl2080_notification.h    |  62 --
 .../common/sdk/nvidia/inc/class/cl84a0.h      |  33 -
 .../common/sdk/nvidia/inc/class/cl90f1.h      |  31 -
 .../common/sdk/nvidia/inc/class/clc0b5sw.h    |  34 -
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073common.h |  39 -
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h    | 166 ----
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h | 335 -------
 .../inc/ctrl/ctrl0073/ctrl0073specific.h      | 216 -----
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |  65 --
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h    |  48 -
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |  31 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h   |  40 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h |  35 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080event.h  |  41 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |  51 --
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h   |  52 --
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    | 100 ---
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |  41 -
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      | 162 ----
 .../nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h |  42 -
 .../common/sdk/nvidia/inc/nvlimits.h          |  33 -
 .../535.113.01/common/sdk/nvidia/inc/nvos.h   | 148 ----
 .../common/shared/msgq/inc/msgq/msgq_priv.h   |  97 ---
 .../uproc/os/common/include/libos_init_args.h |  52 --
 .../nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |  79 --
 .../nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  | 170 ----
 .../arch/nvalloc/common/inc/rmRiscvUcode.h    |  82 --
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h | 100 ---
 .../nvidia/generated/g_allclasses.h           |  33 -
 .../nvidia/generated/g_chipset_nvoc.h         |  38 -
 .../535.113.01/nvidia/generated/g_fbsr_nvoc.h |  31 -
 .../535.113.01/nvidia/generated/g_gpu_nvoc.h  |  35 -
 .../nvidia/generated/g_kernel_channel_nvoc.h  |  62 --
 .../nvidia/generated/g_kernel_fifo_nvoc.h     | 119 ---
 .../nvidia/generated/g_mem_desc_nvoc.h        |  32 -
 .../535.113.01/nvidia/generated/g_os_nvoc.h   |  44 -
 .../nvidia/generated/g_rpc-structures.h       | 124 ---
 .../nvidia/generated/g_sdk-structures.h       |  45 -
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h     |  74 --
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h   |  86 --
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h   |  33 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h |  57 --
 .../inc/kernel/gpu/gsp/gsp_static_config.h    | 174 ----
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |  57 --
 .../nvidia/inc/kernel/gpu/nvbitmask.h         |  33 -
 .../nvidia/inc/kernel/os/nv_memory_type.h     |  31 -
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |  51 --
 .../nvidia/kernel/inc/vgpu/sdk-structures.h   |  40 -
 .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |   2 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/alloc.c   |   5 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c |   6 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c  |   5 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c  |   3 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c    |   5 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/device.c  |   9 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  12 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    |  10 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  13 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |   7 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  21 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c   |   3 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c   |   3 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c   |   3 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/alloc.h      |  36 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/bar.h        |  29 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h |  15 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/client.h     |  20 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h       |  21 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/device.h     |  30 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/disp.h       | 741 ++++++++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/engine.h     | 260 ++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/event.h      |  47 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h       | 106 +++
 .../nvkm/subdev/gsp/rm/r535/nvrm/fifo.h       | 350 ++++++++
 .../subdev/gsp/rm/r535/nvrm/gr.h}             |  64 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 817 ++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h      |  53 ++
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h      |  17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h      |  17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h      |  17 +
 .../nvkm/subdev/gsp/rm/r535/nvrm/ofa.h        |  16 +
 .../subdev/gsp/rm/r535/nvrm/rpcfn.h}          |  55 +-
 .../subdev/gsp/rm/r535/nvrm/vmm.h}            |  47 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c |   3 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c |   3 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c |   5 +-
 91 files changed, 2692 insertions(+), 4092 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h
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
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h => nvkm/subdev/gsp/rm/r535/nvrm/vmm.h} (60%)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h
deleted file mode 100644
index 7157c7757698..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h
+++ /dev/null
@@ -1,170 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
-#define __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV_MEMORY_DESC_PARAMS {
-    NV_DECLARE_ALIGNED(NvU64 base, 8);
-    NV_DECLARE_ALIGNED(NvU64 size, 8);
-    NvU32 addressSpace;
-    NvU32 cacheAttrib;
-} NV_MEMORY_DESC_PARAMS;
-
-#define NVOS04_FLAGS_CHANNEL_TYPE                                  1:0
-#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL                         0x00000000
-#define NVOS04_FLAGS_CHANNEL_TYPE_VIRTUAL                          0x00000001  // OBSOLETE
-#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL_FOR_VIRTUAL             0x00000002  // OBSOLETE
-
-#define NVOS04_FLAGS_VPR                                           2:2
-#define NVOS04_FLAGS_VPR_FALSE                                     0x00000000
-#define NVOS04_FLAGS_VPR_TRUE                                      0x00000001
-
-#define NVOS04_FLAGS_CC_SECURE                                     2:2
-#define NVOS04_FLAGS_CC_SECURE_FALSE                               0x00000000
-#define NVOS04_FLAGS_CC_SECURE_TRUE                                0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING                  3:3
-#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_FALSE            0x00000000
-#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_TRUE             0x00000001
-
-#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE                       4:4
-#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_DEFAULT               0x00000000
-#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_ONE                   0x00000001
-
-#define NVOS04_FLAGS_PRIVILEGED_CHANNEL                           5:5
-#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_FALSE                     0x00000000
-#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_TRUE                      0x00000001
-
-#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING                     6:6
-#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_FALSE               0x00000000
-#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_TRUE                0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE                7:7
-#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_FALSE          0x00000000
-#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_TRUE           0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_VALUE                    10:8
-
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED                    11:11
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_FALSE              0x00000000
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_TRUE               0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_VALUE               20:12
-
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED               21:21
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_FALSE         0x00000000
-#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_TRUE          0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV                 22:22
-#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_FALSE           0x00000000
-#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_TRUE            0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER                        23:23
-#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_FALSE                  0x00000000
-#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_TRUE                   0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO                      24:24
-#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_FALSE                0x00000000
-#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_TRUE                 0x00000001
-
-#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL           25:25
-#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_FALSE     0x00000000
-#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_TRUE      0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT                  26:26
-#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_FALSE            0x00000000
-#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_TRUE             0x00000001
-
-#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT                 27:27
-#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_FALSE           0x00000000
-#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_TRUE            0x00000001
-
-#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD                          29:28
-#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_DEFAULT                  0x00000000
-#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_ONE                      0x00000001
-#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_TWO                      0x00000002
-
-#define NVOS04_FLAGS_MAP_CHANNEL                                   30:30
-#define NVOS04_FLAGS_MAP_CHANNEL_FALSE                             0x00000000
-#define NVOS04_FLAGS_MAP_CHANNEL_TRUE                              0x00000001
-
-#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC                          31:31
-#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_FALSE                    0x00000000
-#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_TRUE                     0x00000001
-
-#define CC_CHAN_ALLOC_IV_SIZE_DWORD    3U
-#define CC_CHAN_ALLOC_NONCE_SIZE_DWORD 8U
-
-typedef struct NV_CHANNEL_ALLOC_PARAMS {
-
-    NvHandle hObjectError; // error context DMA
-    NvHandle hObjectBuffer; // no longer used
-    NV_DECLARE_ALIGNED(NvU64 gpFifoOffset, 8);    // offset to beginning of GP FIFO
-    NvU32    gpFifoEntries;    // number of GP FIFO entries
-
-    NvU32    flags;
-
-
-    NvHandle hContextShare; // context share handle
-    NvHandle hVASpace; // VASpace for the channel
-
-    // handle to UserD memory object for channel, ignored if hUserdMemory[0]=0
-    NvHandle hUserdMemory[NV_MAX_SUBDEVICES];
-
-    // offset to beginning of UserD within hUserdMemory[x]
-    NV_DECLARE_ALIGNED(NvU64 userdOffset[NV_MAX_SUBDEVICES], 8);
-
-    // engine type(NV2080_ENGINE_TYPE_*) with which this channel is associated
-    NvU32    engineType;
-    // Channel identifier that is unique for the duration of a RM session
-    NvU32    cid;
-    // One-hot encoded bitmask to match SET_SUBDEVICE_MASK methods
-    NvU32    subDeviceId;
-    NvHandle hObjectEccError; // ECC error context DMA
-
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS instanceMem, 8);
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS userdMem, 8);
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS ramfcMem, 8);
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS mthdbufMem, 8);
-
-    NvHandle hPhysChannelGroup;              // reserved
-    NvU32    internalFlags;                 // reserved
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS errorNotifierMem, 8); // reserved
-    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS eccErrorNotifierMem, 8); // reserved
-    NvU32    ProcessID;                 // reserved
-    NvU32    SubProcessID;                 // reserved
-    // IV used for CPU-side encryption / GPU-side decryption.
-    NvU32    encryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
-    // IV used for CPU-side decryption / GPU-side encryption.
-    NvU32    decryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
-    // Nonce used CPU-side signing / GPU-side signature verification.
-    NvU32    hmacNonce[CC_CHAN_ALLOC_NONCE_SIZE_DWORD];       // reserved
-} NV_CHANNEL_ALLOC_PARAMS;
-
-typedef NV_CHANNEL_ALLOC_PARAMS NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h
deleted file mode 100644
index 7a3fc023072d..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h
+++ /dev/null
@@ -1,38 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl0000_h__
-#define __src_common_sdk_nvidia_inc_class_cl0000_h__
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV01_ROOT        (0x0U) /* finn: Evaluated from "NV0000_ALLOC_PARAMETERS_MESSAGE_ID" */
-
-typedef struct NV0000_ALLOC_PARAMETERS {
-    NvHandle hClient; /* CORERM-2934: hClient must remain the first member until all allocations use these params */
-    NvU32    processID;
-    char     processName[NV_PROC_NAME_MAX_LENGTH];
-} NV0000_ALLOC_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h
deleted file mode 100644
index e4de36d63666..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h
+++ /dev/null
@@ -1,38 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl0005_h__
-#define __src_common_sdk_nvidia_inc_class_cl0005_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV0005_ALLOC_PARAMETERS {
-    NvHandle hParentClient;
-    NvHandle hSrcResource;
-
-    NvV32    hClass;
-    NvV32    notifyIndex;
-    NV_DECLARE_ALIGNED(NvP64 data, 8);
-} NV0005_ALLOC_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h
deleted file mode 100644
index 8868118e47d6..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h
+++ /dev/null
@@ -1,43 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl0080_h__
-#define __src_common_sdk_nvidia_inc_class_cl0080_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV01_DEVICE_0      (0x80U) /* finn: Evaluated from "NV0080_ALLOC_PARAMETERS_MESSAGE_ID" */
-
-typedef struct NV0080_ALLOC_PARAMETERS {
-    NvU32    deviceId;
-    NvHandle hClientShare;
-    NvHandle hTargetClient;
-    NvHandle hTargetDevice;
-    NvV32    flags;
-    NV_DECLARE_ALIGNED(NvU64 vaSpaceSize, 8);
-    NV_DECLARE_ALIGNED(NvU64 vaStartInternal, 8);
-    NV_DECLARE_ALIGNED(NvU64 vaLimitInternal, 8);
-    NvV32    vaMode;
-} NV0080_ALLOC_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h
deleted file mode 100644
index 9040ea5608a0..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h
+++ /dev/null
@@ -1,35 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl2080_h__
-#define __src_common_sdk_nvidia_inc_class_cl2080_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2002-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV20_SUBDEVICE_0      (0x2080U) /* finn: Evaluated from "NV2080_ALLOC_PARAMETERS_MESSAGE_ID" */
-
-typedef struct NV2080_ALLOC_PARAMETERS {
-    NvU32 subDeviceId;
-} NV2080_ALLOC_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h
deleted file mode 100644
index ba659d6477d3..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h
+++ /dev/null
@@ -1,62 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
-#define __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_NOTIFIERS_HOTPLUG                                   (1)
-
-#define NV2080_NOTIFIERS_DP_IRQ                                    (7)
-
-#define NV2080_ENGINE_TYPE_GRAPHICS                   (0x00000001)
-#define NV2080_ENGINE_TYPE_GR0                        NV2080_ENGINE_TYPE_GRAPHICS
-
-#define NV2080_ENGINE_TYPE_COPY0                      (0x00000009)
-
-#define NV2080_ENGINE_TYPE_BSP                        (0x00000013)
-#define NV2080_ENGINE_TYPE_NVDEC0                     NV2080_ENGINE_TYPE_BSP
-
-#define NV2080_ENGINE_TYPE_MSENC                      (0x0000001b)
-#define NV2080_ENGINE_TYPE_NVENC0                      NV2080_ENGINE_TYPE_MSENC  /* Mutually exclusive alias */
-
-#define NV2080_ENGINE_TYPE_SW                         (0x00000022)
-
-#define NV2080_ENGINE_TYPE_SEC2                       (0x00000026)
-
-#define NV2080_ENGINE_TYPE_NVJPG                      (0x0000002b)
-#define NV2080_ENGINE_TYPE_NVJPEG0                     NV2080_ENGINE_TYPE_NVJPG
-
-#define NV2080_ENGINE_TYPE_OFA                        (0x00000033)
-
-typedef struct {
-    NvU32 plugDisplayMask;
-    NvU32 unplugDisplayMask;
-} Nv2080HotplugNotification;
-
-typedef struct Nv2080DpIrqNotificationRec {
-    NvU32 displayId;
-} Nv2080DpIrqNotification;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h
deleted file mode 100644
index 9eb780a1ac72..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h
+++ /dev/null
@@ -1,33 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl84a0_h__
-#define __src_common_sdk_nvidia_inc_class_cl84a0_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV01_MEMORY_LIST_SYSTEM (0x00000081)
-
-#define NV01_MEMORY_LIST_FBMEM  (0x00000082)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h
deleted file mode 100644
index f1d21776e395..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_cl90f1_h__
-#define __src_common_sdk_nvidia_inc_class_cl90f1_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2011 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define FERMI_VASPACE_A                                     (0x000090f1)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h
deleted file mode 100644
index b8f32576cfaa..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h
+++ /dev/null
@@ -1,34 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
-#define __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2014-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NVC0B5_ALLOCATION_PARAMETERS {
-    NvU32 version;
-    NvU32 engineType;
-} NVC0B5_ALLOCATION_PARAMETERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
deleted file mode 100644
index 58b3ba7badf1..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
+++ /dev/null
@@ -1,39 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV0073_CTRL_CMD_DSC_CAP_PARAMS {
-    NvBool bDscSupported;
-    NvU32  encoderColorFormatMask;
-    NvU32  lineBufferSizeKB;
-    NvU32  rateBufferSizeKB;
-    NvU32  bitsPerPixelPrecision;
-    NvU32  maxNumHztSlices;
-    NvU32  lineBufferBitDepth;
-} NV0073_CTRL_CMD_DSC_CAP_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
deleted file mode 100644
index 596f2ea8344e..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
+++ /dev/null
@@ -1,166 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV0073_CTRL_CMD_DFP_GET_INFO (0x731140U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_GET_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_DFP_GET_INFO_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 flags;
-    NvU32 flags2;
-} NV0073_CTRL_DFP_GET_INFO_PARAMS;
-
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL                                       2:0
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_TMDS                       (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_LVDS                       (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_SDI                        (0x00000002U)
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DISPLAYPORT                (0x00000003U)
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DSI                        (0x00000004U)
-#define NV0073_CTRL_DFP_FLAGS_SIGNAL_WRBK                       (0x00000005U)
-#define NV0073_CTRL_DFP_FLAGS_LANE                                         5:3
-#define NV0073_CTRL_DFP_FLAGS_LANE_NONE                         (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_LANE_SINGLE                       (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_LANE_DUAL                         (0x00000002U)
-#define NV0073_CTRL_DFP_FLAGS_LANE_QUAD                         (0x00000003U)
-#define NV0073_CTRL_DFP_FLAGS_LANE_OCT                          (0x00000004U)
-#define NV0073_CTRL_DFP_FLAGS_LIMIT                                        6:6
-#define NV0073_CTRL_DFP_FLAGS_LIMIT_DISABLE                     (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_LIMIT_60HZ_RR                     (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER                                   7:7
-#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_NORMAL                 (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_DISABLE                (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE                                 8:8
-#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_FALSE                (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_TRUE                 (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE                        9:9
-#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_FALSE       (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_TRUE        (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE                         10:10
-#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_FALSE          (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_TRUE           (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE                    11:11
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_FALSE     (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_TRUE      (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE                    12:12
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_FALSE     (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_TRUE      (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED                               14:14
-#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_FALSE                (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_TRUE                 (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT                       15:15
-#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_FALSE        (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_TRUE         (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT                         16:16
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_NONE           (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_PREFER_RBR     (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW                                 19:17
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_1_62GBPS               (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_2_70GBPS               (0x00000002U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_5_40GBPS               (0x00000003U)
-#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_8_10GBPS               (0x00000004U)
-#define NV0073_CTRL_DFP_FLAGS_LINK                                       21:20
-#define NV0073_CTRL_DFP_FLAGS_LINK_NONE                         (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_LINK_SINGLE                       (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_LINK_DUAL                         (0x00000002U)
-#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID                           22:22
-#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_FALSE            (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_TRUE             (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID                              24:23
-#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_NONE            (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_A               (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_B               (0x00000002U)
-#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_GANGED          (0x00000003U)
-#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED                   25:25
-#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_FALSE    (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_TRUE     (0x00000001U)
-#define NV0073_CTRL_DFP_FLAGS_DP_PHY_REPEATER_COUNT                      29:26
-#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE                        30:30
-#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_FALSE         (0x00000000U)
-#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_TRUE          (0x00000001U)
-
-#define NV0073_CTRL_CMD_DFP_SET_ELD_AUDIO_CAPS                         (0x731144U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER                      96U
-
-typedef struct NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 numELDSize;
-    NvU8  bufferELD[NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER];
-    NvU32 maxFreqSupported;
-    NvU32 ctrl;
-    NvU32 deviceEntry;
-} NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS;
-
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD                                     0:0
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_FALSE              (0x00000000U)
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_TRUE               (0x00000001U)
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV                                   1:1
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_FALSE            (0x00000000U)
-#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_TRUE             (0x00000001U)
-
-#define NV0073_CTRL_CMD_DFP_SET_AUDIO_ENABLE                (0x731150U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvBool enable;
-} NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS;
-
-typedef NvU32 NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG;
-
-typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_INFO {
-    NvU32 displayMask;
-    NvU32 sorType;
-} NV0073_CTRL_DFP_ASSIGN_SOR_INFO;
-
-#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR           (0x731152U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS  4U
-
-typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS {
-    NvU32                                 subDeviceInstance;
-    NvU32                                 displayId;
-    NvU8                                  sorExcludeMask;
-    NvU32                                 slaveDisplayId;
-    NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG forceSublinkConfig;
-    NvBool                                bIs2Head1Or;
-    NvU32                                 sorAssignList[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
-    NV0073_CTRL_DFP_ASSIGN_SOR_INFO       sorAssignListWithTag[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
-    NvU8                                  reservedSorMask;
-    NvU32                                 flags;
-} NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS;
-
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO                                      0:0
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_OPTIMAL                    (0x00000001U)
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_DEFAULT                    (0x00000000U)
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE               1:1
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_NO  (0x00000000U)
-#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_YES (0x00000001U)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
deleted file mode 100644
index bae4b1997736..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
+++ /dev/null
@@ -1,335 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV0073_CTRL_CMD_DP_AUXCH_CTRL      (0x731341U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_AUXCH_CTRL_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE 16U
-
-typedef struct NV0073_CTRL_DP_AUXCH_CTRL_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvBool bAddrOnly;
-    NvU32  cmd;
-    NvU32  addr;
-    NvU8   data[NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE];
-    NvU32  size;
-    NvU32  replyType;
-    NvU32  retryTimeMs;
-} NV0073_CTRL_DP_AUXCH_CTRL_PARAMS;
-
-#define NV0073_CTRL_DP_AUXCH_CMD_TYPE                          3:3
-#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_I2C               (0x00000000U)
-#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_AUX               (0x00000001U)
-#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT                       2:2
-#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_FALSE          (0x00000000U)
-#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_TRUE           (0x00000001U)
-#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE                      1:0
-#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE         (0x00000000U)
-#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_READ          (0x00000001U)
-#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE_STATUS  (0x00000002U)
-
-#define NV0073_CTRL_CMD_DP_CTRL                     (0x731343U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_CTRL_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 cmd;
-    NvU32 data;
-    NvU32 err;
-    NvU32 retryTimeMs;
-    NvU32 eightLaneDpcdBaseAddr;
-} NV0073_CTRL_DP_CTRL_PARAMS;
-
-#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT                           0:0
-#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_FALSE                         (0x00000000U)
-#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_TRUE                          (0x00000001U)
-#define NV0073_CTRL_DP_CMD_SET_LINK_BW                              1:1
-#define NV0073_CTRL_DP_CMD_SET_LINK_BW_FALSE                            (0x00000000U)
-#define NV0073_CTRL_DP_CMD_SET_LINK_BW_TRUE                             (0x00000001U)
-#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD                       2:2
-#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_FALSE                     (0x00000000U)
-#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_TRUE                      (0x00000001U)
-#define NV0073_CTRL_DP_CMD_UNUSED                                   3:3
-#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE                          4:4
-#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_SINGLE_STREAM                (0x00000000U)
-#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_MULTI_STREAM                 (0x00000001U)
-#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING                       5:5
-#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_NO                        (0x00000000U)
-#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_YES                       (0x00000001U)
-#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING                         6:6
-#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_NO                          (0x00000000U)
-#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_YES                         (0x00000001U)
-#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING                     7:7
-#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_FALSE                   (0x00000000U)
-#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_TRUE                    (0x00000001U)
-#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING                   8:8
-#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_DEFAULT               (0x00000000U)
-#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_FORCE                 (0x00000001U)
-#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING                      9:9
-#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_NO                       (0x00000000U)
-#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_YES                      (0x00000001U)
-#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED                10:10
-#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_NO                   (0x00000000U)
-#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_YES                  (0x00000001U)
-#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING                     12:11
-#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_NO                        (0x00000000U)
-#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_DONOT_TOGGLE_TRANSMISSION (0x00000001U)
-#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_TOGGLE_TRANSMISSION_ON    (0x00000002U)
-#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER                     13:13
-#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_NO                        (0x00000000U)
-#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_YES                       (0x00000001U)
-#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG                        14:14
-#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_FALSE                        (0x00000000U)
-#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_TRUE                         (0x00000001U)
-#define NV0073_CTRL_DP_CMD_ENABLE_FEC                             15:15
-#define NV0073_CTRL_DP_CMD_ENABLE_FEC_FALSE                             (0x00000000U)
-#define NV0073_CTRL_DP_CMD_ENABLE_FEC_TRUE                              (0x00000001U)
-
-#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST                         29:29
-#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_NO                            (0x00000000U)
-#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_YES                           (0x00000001U)
-#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE              30:30
-#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_FALSE              (0x00000000U)
-#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_TRUE               (0x00000001U)
-#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG                    31:31
-#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_FALSE                    (0x00000000U)
-#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_TRUE                     (0x00000001U)
-
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT                          4:0
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_0                            (0x00000000U)
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_1                            (0x00000001U)
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_2                            (0x00000002U)
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_4                            (0x00000004U)
-#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_8                            (0x00000008U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW                            15:8
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_1_62GBPS                        (0x00000006U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_16GBPS                        (0x00000008U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_43GBPS                        (0x00000009U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_70GBPS                        (0x0000000AU)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_3_24GBPS                        (0x0000000CU)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_4_32GBPS                        (0x00000010U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_5_40GBPS                        (0x00000014U)
-#define NV0073_CTRL_DP_DATA_SET_LINK_BW_8_10GBPS                        (0x0000001EU)
-#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING                  18:18
-#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_NO                     (0x00000000U)
-#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_YES                    (0x00000001U)
-#define NV0073_CTRL_DP_DATA_TARGET                                22:19
-#define NV0073_CTRL_DP_DATA_TARGET_SINK                                 (0x00000000U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_0                       (0x00000001U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_1                       (0x00000002U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_2                       (0x00000003U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_3                       (0x00000004U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_4                       (0x00000005U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_5                       (0x00000006U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_6                       (0x00000007U)
-#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_7                       (0x00000008U)
-
-#define NV0073_CTRL_MAX_LANES                                           8U
-
-typedef struct NV0073_CTRL_DP_LANE_DATA_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 numLanes;
-    NvU32 data[NV0073_CTRL_MAX_LANES];
-} NV0073_CTRL_DP_LANE_DATA_PARAMS;
-
-#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS                   1:0
-#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_NONE    (0x00000000U)
-#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL1  (0x00000001U)
-#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL2  (0x00000002U)
-#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL3  (0x00000003U)
-#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT                  3:2
-#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL0 (0x00000000U)
-#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL1 (0x00000001U)
-#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL2 (0x00000002U)
-#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL3 (0x00000003U)
-
-#define NV0073_CTRL_CMD_DP_SET_LANE_DATA (0x731346U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_LANE_DATA_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_CMD_DP_SET_AUDIO_MUTESTREAM      (0x731359U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 mute;
-} NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID  (0x73135bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvU32  preferredDisplayId;
-
-    NvBool force;
-    NvBool useBFM;
-
-    NvU32  displayIdAssigned;
-    NvU32  allDisplayMask;
-} NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID (0x73135cU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-} NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_CONFIG_STREAM                   (0x731362U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  head;
-    NvU32  sorIndex;
-    NvU32  dpLink;
-
-    NvBool bEnableOverride;
-    NvBool bMST;
-    NvU32  singleHeadMultistreamMode;
-    NvU32  hBlankSym;
-    NvU32  vBlankSym;
-    NvU32  colorFormat;
-    NvBool bEnableTwoHeadOneOr;
-
-    struct {
-        NvU32  slotStart;
-        NvU32  slotEnd;
-        NvU32  PBN;
-        NvU32  Timeslice;
-        NvBool sendACT;          // deprecated -Use NV0073_CTRL_CMD_DP_SEND_ACT
-        NvU32  singleHeadMSTPipeline;
-        NvBool bEnableAudioOverRightPanel;
-    } MST;
-
-    struct {
-        NvBool bEnhancedFraming;
-        NvU32  tuSize;
-        NvU32  waterMark;
-        NvU32  actualPclkHz;     // deprecated  -Use MvidWarParams
-        NvU32  linkClkFreqHz;    // deprecated  -Use MvidWarParams
-        NvBool bEnableAudioOverRightPanel;
-        struct {
-            NvU32  activeCnt;
-            NvU32  activeFrac;
-            NvU32  activePolarity;
-            NvBool mvidWarEnabled;
-            struct {
-                NvU32 actualPclkHz;
-                NvU32 linkClkFreqHz;
-            } MvidWarParams;
-        } Legacy;
-    } SST;
-} NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT                    (0x731365U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS {
-    NvU32 subDeviceInstance;
-} NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID (0x69U)
-
-typedef struct NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS {
-    NvU32                          subDeviceInstance;
-    NvU32                          sorIndex;
-    NvU32                          maxLinkRate;
-    NvU32                          dpVersionsSupported;
-    NvU32                          UHBRSupported;
-    NvBool                         bIsMultistreamSupported;
-    NvBool                         bIsSCEnabled;
-    NvBool                         bHasIncreasedWatermarkLimits;
-    NvBool                         bIsPC2Disabled;
-    NvBool                         isSingleHeadMSTSupported;
-    NvBool                         bFECSupported;
-    NvBool                         bIsTrainPhyRepeater;
-    NvBool                         bOverrideLinkBw;
-    NV0073_CTRL_CMD_DSC_CAP_PARAMS DSC;
-} NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS;
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2                0:0
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_NO              (0x00000000U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_YES             (0x00000001U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4                1:1
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_NO              (0x00000000U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_YES             (0x00000001U)
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE                           2:0
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_NONE                          (0x00000000U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62                          (0x00000001U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70                          (0x00000002U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40                          (0x00000003U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10                          (0x00000004U)
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_RGB                (0x00000001U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_444        (0x00000002U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_422 (0x00000004U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_420 (0x00000008U)
-
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_16           (0x00000001U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_8            (0x00000002U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_4            (0x00000003U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_2            (0x00000004U)
-#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1              (0x00000005U)
-
-#define NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES (0x731377U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES        8U
-
-typedef struct NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS {
-    // In
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU16 linkRateTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
-
-    // Out
-    NvU8  linkBwTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
-    NvU8  linkBwCount;
-} NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS;
-
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE                                   3:0
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_BEGIN     (0x00000000U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHALLENGE (0x00000001U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHECK     (0x00000002U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_BEGIN      (0x00000003U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHALLENGE  (0x00000004U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHECK      (0x00000005U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_RESET_MONITOR            (0x00000006U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_INIT_PUBLIC_INFO         (0x00000007U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_GET_PUBLIC_INFO          (0x00000008U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_STATUS_CHECK             (0x00000009U)
-
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_OK                          (0x00000000U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_PENDING                     (0x80000001U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_READ_ERROR                  (0x80000002U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_WRITE_ERROR                 (0x80000003U)
-#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_DEVICE_ERROR                (0x80000004U)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
deleted file mode 100644
index 954958dcf834..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
+++ /dev/null
@@ -1,216 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV0073_CTRL_CMD_SPECIFIC_GET_EDID_V2         (0x730245U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES 2048U
-
-typedef struct NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 bufferSize;
-    NvU32 flags;
-    NvU8  edidBuffer[NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES];
-} NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA   (0x730250U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_MAX_CONNECTORS                    4U
-
-typedef struct NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 flags;
-    NvU32 DDCPartners;
-    NvU32 count;
-    struct {
-        NvU32 index;
-        NvU32 type;
-        NvU32 location;
-    } data[NV0073_CTRL_MAX_CONNECTORS];
-    NvU32 platform;
-} NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_ENABLE (0x730273U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS {
-    NvU8  subDeviceInstance;
-    NvU32 displayId;
-    NvU8  enable;
-} NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM (0x730275U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS {
-    NvU8  subDeviceInstance;
-    NvU32 displayId;
-    NvU8  mute;
-} NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_GET_ALL_HEAD_MASK (0x730287U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 headMask;
-} NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_OD_PACKET (0x730288U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_SET_OD_MAX_PACKET_SIZE     36U
-
-typedef struct NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvU32  transmitControl;
-    NvU32  packetSize;
-    NvU32  targetHead;
-    NvBool bUsePsrHeadforSdp;
-    NvU8   aPacket[NV0073_CTRL_SET_OD_MAX_PACKET_SIZE];
-} NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS;
-
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE                                     0:0
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_NO                      (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_YES                     (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME                                1:1
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_DISABLE            (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_ENABLE             (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME                               2:2
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_DISABLE           (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_ENABLE            (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK                                 3:3
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_DISABLE              (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_ENABLE               (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE                                  4:4
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_DISABLE              (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_ENABLE               (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT                                  5:5
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_SW_CONTROLLED        (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_HW_CONTROLLED        (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY                        6:6
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_FALSE      (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_TRUE       (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING                   7:7
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_FALSE (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_TRUE  (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE                         9:8
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME0  (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME1  (0x0000001U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE                     31:31
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_NO        (0x0000000U)
-#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_YES       (0x0000001U)
-
-#define NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO (0x73028bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvU32  index;
-    NvU32  type;
-    NvU32  protocol;
-    NvU32  ditherType;
-    NvU32  ditherAlgo;
-    NvU32  location;
-    NvU32  rootPortId;
-    NvU32  dcbIndex;
-    NV_DECLARE_ALIGNED(NvU64 vbiosAddress, 8);
-    NvBool bIsLitByVbios;
-    NvBool bIsDispDynamic;
-} NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS;
-
-#define NV0073_CTRL_SPECIFIC_OR_TYPE_NONE                   (0x00000000U)
-#define NV0073_CTRL_SPECIFIC_OR_TYPE_DAC                    (0x00000001U)
-#define NV0073_CTRL_SPECIFIC_OR_TYPE_SOR                    (0x00000002U)
-#define NV0073_CTRL_SPECIFIC_OR_TYPE_PIOR                   (0x00000003U)
-
-#define NV0073_CTRL_SPECIFIC_OR_TYPE_DSI                    (0x00000005U)
-
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DAC_RGB_CRT        (0x00000000U)
-
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_LVDS_CUSTOM    (0x00000000U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A  (0x00000001U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B  (0x00000002U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS      (0x00000005U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A           (0x00000008U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B           (0x00000009U)
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DSI            (0x00000010U)
-
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DSI                (0x00000011U)
-
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_PIOR_EXT_TMDS_ENC  (0x00000000U)
-
-#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_UNKNOWN            (0xFFFFFFFFU)
-
-#define NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS (0x730291U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS {
-    NvU32  subDeviceInstance;
-    NvU32  displayId;
-    NvU32  brightness;
-    NvBool bUncalibrated;
-} NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS (0x730292U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS (0x730293U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayId;
-    NvU32 caps;
-} NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS;
-
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED                           0:0
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_FALSE       (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_TRUE        (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED                     1:1
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_FALSE (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_TRUE  (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED                                      2:2
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_FALSE                  (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_TRUE                   (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED                              5:3
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_NONE           (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_3G      (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_6G      (0x00000002U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_6G      (0x00000003U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_8G      (0x00000004U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_10G     (0x00000005U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_12G     (0x00000006U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED                                    6:6
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_FALSE                (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_TRUE                 (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED                          9:7
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_NONE       (0x00000000U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_3G  (0x00000001U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_6G  (0x00000002U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_6G  (0x00000003U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_8G  (0x00000004U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_10G (0x00000005U)
-#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_12G (0x00000006U)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
deleted file mode 100644
index d69cef3c01fd..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
+++ /dev/null
@@ -1,65 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV0073_CTRL_CMD_SYSTEM_GET_NUM_HEADS (0x730102U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 flags;
-    NvU32 numHeads;
-} NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS;
-
-#define NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED (0x730120U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 displayMask;
-    NvU32 displayMaskDDC;
-} NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS;
-
-#define NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE (0x730122U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 flags;
-    NvU32 displayMask;
-    NvU32 retryTimeMs;
-} NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS;
-
-#define NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE                (0x730126U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS_MESSAGE_ID" */
-
-typedef struct NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS {
-    NvU32 subDeviceInstance;
-    NvU32 head;
-    NvU32 flags;
-    NvU32 displayId;
-} NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS;
-
-#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
deleted file mode 100644
index 3db099e62364..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
+++ /dev/null
@@ -1,48 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
-    NvU32  totalVFs;
-    NvU32  firstVfOffset;
-    NvU32  vfFeatureMask;
-    NV_DECLARE_ALIGNED(NvU64 FirstVFBar0Address, 8);
-    NV_DECLARE_ALIGNED(NvU64 FirstVFBar1Address, 8);
-    NV_DECLARE_ALIGNED(NvU64 FirstVFBar2Address, 8);
-    NV_DECLARE_ALIGNED(NvU64 bar0Size, 8);
-    NV_DECLARE_ALIGNED(NvU64 bar1Size, 8);
-    NV_DECLARE_ALIGNED(NvU64 bar2Size, 8);
-    NvBool b64bitBar0;
-    NvBool b64bitBar1;
-    NvBool b64bitBar2;
-    NvBool bSriovEnabled;
-    NvBool bSriovHeavyEnabled;
-    NvBool bEmulateVFBar0TlbInvalidationRegister;
-    NvBool bClientRmAllocatedCtxBuffer;
-} NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
deleted file mode 100644
index ed01df925573..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV0080_CTRL_GR_CAPS_TBL_SIZE            23
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
deleted file mode 100644
index b5b7631de99b..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
+++ /dev/null
@@ -1,40 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
-    NvU32 BoardID;
-    char  chipSKU[4];
-    char  chipSKUMod[2];
-    char  project[5];
-    char  projectSKU[5];
-    char  CDP[6];
-    char  projectSKUMod[2];
-    NvU32 businessCycle;
-} NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
deleted file mode 100644
index fe912d2bd183..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
+++ /dev/null
@@ -1,35 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2014-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS {
-    NvU32 size;
-} NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS;
-
-#define NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE (0x20802a08) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_CE_INTERFACE_ID << 8) | NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS_MESSAGE_ID" */
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
deleted file mode 100644
index 87bc4ff92ce1..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
+++ /dev/null
@@ -1,41 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION (0x20800301) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_EVENT_INTERFACE_ID << 8) | NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS {
-    NvU32  event;
-    NvU32  action;
-    NvBool bNotifyState;
-    NvU32  info32;
-    NvU16  info16;
-} NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS;
-
-#define NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT  (0x00000002)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
deleted file mode 100644
index 68c81f9f803c..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
+++ /dev/null
@@ -1,51 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES   17U
-
-typedef NvBool NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES];
-
-typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
-    NV_DECLARE_ALIGNED(NvU64 base, 8);
-    NV_DECLARE_ALIGNED(NvU64 limit, 8);
-    NV_DECLARE_ALIGNED(NvU64 reserved, 8);
-    NvU32                                                  performance;
-    NvBool                                                 supportCompressed;
-    NvBool                                                 supportISO;
-    NvBool                                                 bProtected;
-    NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG blackList;
-} NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO;
-
-#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES 16U
-
-typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
-    NvU32 numFBRegions;
-    NV_DECLARE_ALIGNED(NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO fbRegion[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES], 8);
-} NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
deleted file mode 100644
index bc0f63699b06..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE                 (0x20801112) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_FIFO_INTERFACE_ID << 8) | NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS_MESSAGE_ID" */
-
-#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES         32
-#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES   16
-#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA    2
-#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN 16
-
-typedef struct NV2080_CTRL_FIFO_DEVICE_ENTRY {
-    NvU32 engineData[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES];
-    NvU32 pbdmaIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
-    NvU32 pbdmaFaultIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
-    NvU32 numPbdmas;
-    char  engineName[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN];
-} NV2080_CTRL_FIFO_DEVICE_ENTRY;
-
-typedef struct NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS {
-    NvU32                         baseIndex;
-    NvU32                         numEntries;
-    NvBool                        bMore;
-    // C form: NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
-    NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
-} NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
deleted file mode 100644
index 29d7a1052142..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
+++ /dev/null
@@ -1,100 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_GPU_MAX_NAME_STRING_LENGTH                  (0x0000040U)
-
-#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0            (0x00000000U)
-
-#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
-
-typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY {
-    NV_DECLARE_ALIGNED(NvU64 gpuPhysAddr, 8);
-    NV_DECLARE_ALIGNED(NvU64 gpuVirtAddr, 8);
-    NV_DECLARE_ALIGNED(NvU64 size, 8);
-    NvU32 physAttr;
-    NvU16 bufferId;
-    NvU8  bInitialize;
-    NvU8  bNonmapped;
-} NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY;
-
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN                         0U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PM                           1U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PATCH                        2U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_BUFFER_BUNDLE_CB             3U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PAGEPOOL                     4U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB                 5U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_RTV_CB_GLOBAL                6U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_POOL                    7U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_CTRL_BLK                8U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_FECS_EVENT                   9U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP              10U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP 11U
-#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GLOBAL_PRIV_ACCESS_MAP       12U
-
-#define NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES                        16U
-
-#define NV2080_CTRL_CMD_GPU_PROMOTE_CTX                                    (0x2080012bU) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS {
-    NvU32    engineType;
-    NvHandle hClient;
-    NvU32    ChID;
-    NvHandle hChanClient;
-    NvHandle hObject;
-    NvHandle hVirtMemory;
-    NV_DECLARE_ALIGNED(NvU64 virtAddress, 8);
-    NV_DECLARE_ALIGNED(NvU64 size, 8);
-    NvU32    entryCount;
-    // C form: NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES];
-    NV_DECLARE_ALIGNED(NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES], 8);
-} NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS;
-
-typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
-    NvU32 gpcMask;
-} NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
-
-typedef struct NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS {
-    NvU32 gpcId;
-    NvU32 tpcMask;
-} NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS;
-
-typedef struct NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS {
-    NvU32 gpcId;
-    NvU32 zcullMask;
-} NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS;
-
-#define NV2080_GPU_MAX_GID_LENGTH             (0x000000100ULL)
-
-typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
-    NvU32 index;
-    NvU32 flags;
-    NvU32 length;
-    NvU8  data[NV2080_GPU_MAX_GID_LENGTH];
-} NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
deleted file mode 100644
index 59f8895bc5d7..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
+++ /dev/null
@@ -1,41 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_PAGEPOOL = 2,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_BETACB = 3,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_RTV = 4,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL = 5,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL = 6,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL_CPU = 7,
-    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_END = 8,
-} NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
deleted file mode 100644
index e11b2dbe5288..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
+++ /dev/null
@@ -1,162 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO (0x20800a01) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS {
-    NvU32  feHwSysCap;
-    NvU32  windowPresentMask;
-    NvBool bFbRemapperEnabled;
-    NvU32  numHeads;
-    NvBool bPrimaryVga;
-    NvU32  i2cPort;
-    NvU32  internalDispActiveMask;
-} NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS;
-
-#define NV2080_CTRL_INTERNAL_GR_MAX_ENGINES         8
-
-#define NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT 0x19
-
-typedef struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO {
-    NvU32 size;
-    NvU32 alignment;
-} NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO;
-
-typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO {
-    NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO engine[NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT];
-} NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO;
-
-typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS {
-    NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO engineContextBuffersInfo[NV2080_CTRL_INTERNAL_GR_MAX_ENGINES];
-} NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO (0x20800a32) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO {
-    NvU32 engDesc;
-    NvU32 ctxAttr;
-    NvU32 ctxBufferSize;
-    NvU32 addrSpaceList;
-    NvU32 registerBase;
-} NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO;
-#define NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS     0x40
-
-#define NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO (0x20800a42) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS {
-    NvU32                                        numConstructedFalcons;
-    NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO constructedFalconsTable[NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS];
-} NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM (0x20800a49) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS {
-    NV_DECLARE_ALIGNED(NvU64 instMemPhysAddr, 8);
-    NV_DECLARE_ALIGNED(NvU64 instMemSize, 8);
-    NvU32 instMemAddrSpace;
-    NvU32 instMemCpuCacheAttr;
-} NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER (0x20800a58) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS {
-    NvU32  addressSpace;
-    NV_DECLARE_ALIGNED(NvU64 physicalAddr, 8);
-    NV_DECLARE_ALIGNED(NvU64 limit, 8);
-    NvU32  cacheSnoop;
-    NvU32  hclass;
-    NvU32  channelInstance;
-    NvBool valid;
-} NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_INTR_GET_KERNEL_TABLE (0x20800a5c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS_MESSAGE_ID" */
-
-#define NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE       128
-
-typedef enum NV2080_INTR_CATEGORY {
-    NV2080_INTR_CATEGORY_DEFAULT = 0,
-    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE = 1,
-    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE_NOTIFICATION = 2,
-    NV2080_INTR_CATEGORY_RUNLIST = 3,
-    NV2080_INTR_CATEGORY_RUNLIST_NOTIFICATION = 4,
-    NV2080_INTR_CATEGORY_UVM_OWNED = 5,
-    NV2080_INTR_CATEGORY_UVM_SHARED = 6,
-    NV2080_INTR_CATEGORY_ENUM_COUNT = 7,
-} NV2080_INTR_CATEGORY;
-
-typedef struct NV2080_INTR_CATEGORY_SUBTREE_MAP {
-    NvU8 subtreeStart;
-    NvU8 subtreeEnd;
-} NV2080_INTR_CATEGORY_SUBTREE_MAP;
-
-typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY {
-    NvU16 engineIdx;
-    NvU32 pmcIntrMask;
-    NvU32 vectorStall;
-    NvU32 vectorNonStall;
-} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY;
-
-typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS {
-    NvU32                                            tableLen;
-    NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY table[NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE];
-    NV2080_INTR_CATEGORY_SUBTREE_MAP                 subtreeMap[NV2080_INTR_CATEGORY_ENUM_COUNT];
-} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_FBSR_INIT (0x20800ac2) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
-    NvU32    fbsrType;
-    NvU32    numRegions;
-    NvHandle hClient;
-    NvHandle hSysMem;
-    NV_DECLARE_ALIGNED(NvU64 gspFbAllocsSysOffset, 8);
-    NvBool   bEnteringGcoffState;
-} NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_FBSR_SEND_REGION_INFO (0x20800ac3) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS_MESSAGE_ID" */
-
-typedef struct NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS {
-    NvU32    fbsrType;
-    NvHandle hClient;
-    NvHandle hVidMem;
-    NV_DECLARE_ALIGNED(NvU64 vidOffset, 8);
-    NV_DECLARE_ALIGNED(NvU64 sysOffset, 8);
-    NV_DECLARE_ALIGNED(NvU64 size, 8);
-} NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS;
-
-#define NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD (0x20800ac6) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS_MESSAGE_ID" */
-
-#define NV2080_CTRL_ACPI_DSM_READ_SIZE                   (0x1000) /* finn: Evaluated from "(4 * 1024)" */
-
-typedef struct NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS {
-    NvU32 status;
-    NvU16 backLightDataSize;
-    NvU8  backLightData[NV2080_CTRL_ACPI_DSM_READ_SIZE];
-} NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
deleted file mode 100644
index 684045796232..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
+++ /dev/null
@@ -1,42 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2007-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- * 
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- * 
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NVA06F_CTRL_CMD_GPFIFO_SCHEDULE (0xa06f0103) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS_MESSAGE_ID" */
-
-typedef struct NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS {
-    NvBool bEnable;
-    NvBool bSkipSubmit;
-} NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS;
-
-#define NVA06F_CTRL_CMD_BIND (0xa06f0104) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_BIND_PARAMS_MESSAGE_ID" */
-
-typedef struct NVA06F_CTRL_BIND_PARAMS {
-    NvU32 engineType;
-} NVA06F_CTRL_BIND_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h
deleted file mode 100644
index 5c5a004a8031..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlimits.h
+++ /dev/null
@@ -1,33 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_nvlimits_h__
-#define __src_common_sdk_nvidia_inc_nvlimits_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2017 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV_MAX_SUBDEVICES       8
-
-#define NV_PROC_NAME_MAX_LENGTH 100U
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h
deleted file mode 100644
index 51b5591c603e..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h
+++ /dev/null
@@ -1,148 +0,0 @@
-#ifndef __src_common_sdk_nvidia_inc_nvos_h__
-#define __src_common_sdk_nvidia_inc_nvos_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NVOS02_FLAGS_PHYSICALITY                                   7:4
-#define NVOS02_FLAGS_PHYSICALITY_CONTIGUOUS                        (0x00000000)
-#define NVOS02_FLAGS_PHYSICALITY_NONCONTIGUOUS                     (0x00000001)
-#define NVOS02_FLAGS_LOCATION                                      11:8
-#define NVOS02_FLAGS_LOCATION_PCI                                  (0x00000000)
-#define NVOS02_FLAGS_LOCATION_AGP                                  (0x00000001)
-#define NVOS02_FLAGS_LOCATION_VIDMEM                               (0x00000002)
-#define NVOS02_FLAGS_COHERENCY                                     15:12
-#define NVOS02_FLAGS_COHERENCY_UNCACHED                            (0x00000000)
-#define NVOS02_FLAGS_COHERENCY_CACHED                              (0x00000001)
-#define NVOS02_FLAGS_COHERENCY_WRITE_COMBINE                       (0x00000002)
-#define NVOS02_FLAGS_COHERENCY_WRITE_THROUGH                       (0x00000003)
-#define NVOS02_FLAGS_COHERENCY_WRITE_PROTECT                       (0x00000004)
-#define NVOS02_FLAGS_COHERENCY_WRITE_BACK                          (0x00000005)
-#define NVOS02_FLAGS_ALLOC                                         17:16
-#define NVOS02_FLAGS_ALLOC_NONE                                    (0x00000001)
-#define NVOS02_FLAGS_GPU_CACHEABLE                                 18:18
-#define NVOS02_FLAGS_GPU_CACHEABLE_NO                              (0x00000000)
-#define NVOS02_FLAGS_GPU_CACHEABLE_YES                             (0x00000001)
-
-#define NVOS02_FLAGS_KERNEL_MAPPING                                19:19
-#define NVOS02_FLAGS_KERNEL_MAPPING_NO_MAP                         (0x00000000)
-#define NVOS02_FLAGS_KERNEL_MAPPING_MAP                            (0x00000001)
-#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY                            20:20
-#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_NO                         (0x00000000)
-#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_YES                        (0x00000001)
-
-#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY                          21:21
-#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_NO                       (0x00000000)
-#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_YES                      (0x00000001)
-
-#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY                        22:22
-#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_NO                     (0x00000000)
-#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_YES                    (0x00000001)
-
-#define NVOS02_FLAGS_PEER_MAP_OVERRIDE                             23:23
-#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_DEFAULT                     (0x00000000)
-#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_REQUIRED                    (0x00000001)
-
-#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT                          24:24
-#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT_APERTURE                 (0x00000001)
-
-#define NVOS02_FLAGS_MEMORY_PROTECTION                             26:25
-#define NVOS02_FLAGS_MEMORY_PROTECTION_DEFAULT                     (0x00000000)
-#define NVOS02_FLAGS_MEMORY_PROTECTION_PROTECTED                   (0x00000001)
-#define NVOS02_FLAGS_MEMORY_PROTECTION_UNPROTECTED                 (0x00000002)
-
-#define NVOS02_FLAGS_MAPPING                                       31:30
-#define NVOS02_FLAGS_MAPPING_DEFAULT                               (0x00000000)
-#define NVOS02_FLAGS_MAPPING_NO_MAP                                (0x00000001)
-#define NVOS02_FLAGS_MAPPING_NEVER_MAP                             (0x00000002)
-
-#define NV01_EVENT_CLIENT_RM                                       (0x04000000)
-
-typedef struct
-{
-    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
-                                         // Note that core channel has only one instance
-                                         // while all others have two (one per head).
-    NvHandle hObjectBuffer;              // ctx dma handle for DMA push buffer
-    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors/notifications
-    NvU32    offset;                     // Initial offset for put/get, usually zero.
-    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of UDISP GET/PUT regs
-
-    NvU32    flags;
-#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB                1:1
-#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_YES            0x00000000
-#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_NO             0x00000001
-
-} NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
-                                         // All PIO channels have two instances (one per head).
-    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors.
-    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of control region for PIO channel
-} NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvU32 size;
-    NvU32 prohibitMultipleInstances;
-    NvU32 engineInstance;               // Select NVDEC0 or NVDEC1 or NVDEC2
-} NV_BSP_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvU32 size;
-    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of MSENC?
-    NvU32 engineInstance;             // Select MSENC/NVENC0 or NVENC1 or NVENC2
-} NV_MSENC_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvU32 size;
-    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of NVJPG?
-    NvU32 engineInstance;
-} NV_NVJPG_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvU32 size;
-    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of OFA?
-} NV_OFA_ALLOCATION_PARAMETERS;
-
-typedef struct
-{
-    NvU32   index;
-    NvV32   flags;
-    NvU64   vaSize NV_ALIGN_BYTES(8);
-    NvU64   vaStartInternal NV_ALIGN_BYTES(8);
-    NvU64   vaLimitInternal NV_ALIGN_BYTES(8);
-    NvU32   bigPageSize;
-    NvU64   vaBase NV_ALIGN_BYTES(8);
-} NV_VASPACE_ALLOCATION_PARAMETERS;
-
-#define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
deleted file mode 100644
index 0e32e71e123f..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
+++ /dev/null
@@ -1,97 +0,0 @@
-#ifndef __src_common_shared_msgq_inc_msgq_msgq_priv_h__
-#define __src_common_shared_msgq_inc_msgq_msgq_priv_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-/**
- * msgqTxHeader -- TX queue data structure
- * @version: the version of this structure, must be 0
- * @size: the size of the entire queue, including this header
- * @msgSize: the padded size of queue element, 16 is minimum
- * @msgCount: the number of elements in this queue
- * @writePtr: head index of this queue
- * @flags: 1 = swap the RX pointers
- * @rxHdrOff: offset of readPtr in this structure
- * @entryOff: offset of beginning of queue (msgqRxHeader), relative to
- *          beginning of this structure
- *
- * The command queue is a queue of RPCs that are sent from the driver to the
- * GSP.  The status queue is a queue of messages/responses from GSP-RM to the
- * driver.  Although the driver allocates memory for both queues, the command
- * queue is owned by the driver and the status queue is owned by GSP-RM.  In
- * addition, the headers of the two queues must not share the same 4K page.
- *
- * Each queue is prefixed with this data structure.  The idea is that a queue
- * and its header are written to only by their owner.  That is, only the
- * driver writes to the command queue and command queue header, and only the
- * GSP writes to the status (receive) queue and its header.
- *
- * This is enforced by the concept of "swapping" the RX pointers.  This is
- * why the 'flags' field must be set to 1.  'rxHdrOff' is how the GSP knows
- * where the where the tail pointer of its status queue.
- *
- * When the driver writes a new RPC to the command queue, it updates writePtr.
- * When it reads a new message from the status queue, it updates readPtr.  In
- * this way, the GSP knows when a new command is in the queue (it polls
- * writePtr) and it knows how much free space is in the status queue (it
- * checks readPtr).  The driver never cares about how much free space is in
- * the status queue.
- *
- * As usual, producers write to the head pointer, and consumers read from the
- * tail pointer.  When head == tail, the queue is empty.
- *
- * So to summarize:
- * command.writePtr = head of command queue
- * command.readPtr = tail of status queue
- * status.writePtr = head of status queue
- * status.readPtr = tail of command queue
- */
-typedef struct
-{
-    NvU32 version;   // queue version
-    NvU32 size;      // bytes, page aligned
-    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is minimum
-    NvU32 msgCount;  // number of entries in queue
-    NvU32 writePtr;  // message id of next slot
-    NvU32 flags;     // if set it means "i want to swap RX"
-    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing store.
-    NvU32 entryOff;  // Offset of entries from start of backing store.
-} msgqTxHeader;
-
-/**
- * msgqRxHeader - RX queue data structure
- * @readPtr: tail index of the other queue
- *
- * Although this is a separate struct, it could easily be merged into
- * msgqTxHeader.  msgqTxHeader.rxHdrOff is simply the offset of readPtr
- * from the beginning of msgqTxHeader.
- */
-typedef struct
-{
-    NvU32 readPtr; // message id of last message read
-} msgqRxHeader;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h
deleted file mode 100644
index 83cf1b2c15a3..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef __src_common_uproc_os_common_include_libos_init_args_h__
-#define __src_common_uproc_os_common_include_libos_init_args_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2018-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef NvU64 LibosAddress;
-
-typedef enum {
-    LIBOS_MEMORY_REGION_NONE,
-    LIBOS_MEMORY_REGION_CONTIGUOUS,
-    LIBOS_MEMORY_REGION_RADIX3
-} LibosMemoryRegionKind;
-
-typedef enum {
-    LIBOS_MEMORY_REGION_LOC_NONE,
-    LIBOS_MEMORY_REGION_LOC_SYSMEM,
-    LIBOS_MEMORY_REGION_LOC_FB
-} LibosMemoryRegionLoc;
-
-typedef struct
-{
-    LibosAddress          id8;  // Id tag.
-    LibosAddress          pa;   // Physical address.
-    LibosAddress          size; // Size of memory area.
-    NvU8                  kind; // See LibosMemoryRegionKind above.
-    NvU8                  loc;  // See LibosMemoryRegionLoc above.
-} LibosMemoryRegionInitArgument;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
deleted file mode 100644
index 73213bdfcbda..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
+++ /dev/null
@@ -1,79 +0,0 @@
-#ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
-#define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define GSP_FW_SR_META_MAGIC     0x8a3bb9e6c6c39d93ULL
-#define GSP_FW_SR_META_REVISION  2
-
-typedef struct
-{
-    //
-    // Magic
-    // Use for verification by Booter
-    //
-    NvU64 magic;  // = GSP_FW_SR_META_MAGIC;
-
-    //
-    // Revision number
-    // Bumped up when we change this interface so it is not backward compatible.
-    // Bumped up when we revoke GSP-RM ucode
-    //
-    NvU64 revision;  // = GSP_FW_SR_META_MAGIC_REVISION;
-
-    //
-    // ---- Members regarding data in SYSMEM ----------------------------
-    // Consumed by Booter for DMA
-    //
-    NvU64 sysmemAddrOfSuspendResumeData;
-    NvU64 sizeOfSuspendResumeData;
-
-    // ---- Members for crypto ops across S/R ---------------------------
-
-    //
-    // HMAC over the entire GspFwSRMeta structure (including padding)
-    // with the hmac field itself zeroed.
-    //
-    NvU8 hmac[32];
-
-    // Hash over GspFwWprMeta structure
-    NvU8 wprMetaHash[32];
-
-    // Hash over GspFwHeapFreeList structure. All zeros signifies no free list.
-    NvU8 heapFreeListHash[32];
-
-    // Hash over data in WPR2 (skipping over free heap chunks; see Booter for details)
-    NvU8 dataHash[32];
-
-    //
-    // Pad structure to exactly 256 bytes (1 DMA chunk).
-    // Padding initialized to zero.
-    //
-    NvU32 padding[24];
-
-} GspFwSRMeta;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
deleted file mode 100644
index a2e141e4b459..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
+++ /dev/null
@@ -1,170 +0,0 @@
-#ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
-#define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct
-{
-    // Magic
-    // BL to use for verification (i.e. Booter locked it in WPR2)
-    NvU64 magic; // = 0xdc3aae21371a60b3;
-
-    // Revision number of Booter-BL-Sequencer handoff interface
-    // Bumped up when we change this interface so it is not backward compatible.
-    // Bumped up when we revoke GSP-RM ucode
-    NvU64 revision; // = 1;
-
-    // ---- Members regarding data in SYSMEM ----------------------------
-    // Consumed by Booter for DMA
-
-    NvU64 sysmemAddrOfRadix3Elf;
-    NvU64 sizeOfRadix3Elf;
-
-    NvU64 sysmemAddrOfBootloader;
-    NvU64 sizeOfBootloader;
-
-    // Offsets inside bootloader image needed by Booter
-    NvU64 bootloaderCodeOffset;
-    NvU64 bootloaderDataOffset;
-    NvU64 bootloaderManifestOffset;
-
-    union
-    {
-        // Used only at initial boot
-        struct
-        {
-            NvU64 sysmemAddrOfSignature;
-            NvU64 sizeOfSignature;
-        };
-
-        //
-        // Used at suspend/resume to read GspFwHeapFreeList
-        // Offset relative to GspFwWprMeta FBMEM PA (gspFwWprStart)
-        //
-        struct
-        {
-            NvU32 gspFwHeapFreeListWprOffset;
-            NvU32 unused0;
-            NvU64 unused1;
-        };
-    };
-
-    // ---- Members describing FB layout --------------------------------
-    NvU64 gspFwRsvdStart;
-
-    NvU64 nonWprHeapOffset;
-    NvU64 nonWprHeapSize;
-
-    NvU64 gspFwWprStart;
-
-    // GSP-RM to use to setup heap.
-    NvU64 gspFwHeapOffset;
-    NvU64 gspFwHeapSize;
-
-    // BL to use to find ELF for jump
-    NvU64 gspFwOffset;
-    // Size is sizeOfRadix3Elf above.
-
-    NvU64 bootBinOffset;
-    // Size is sizeOfBootloader above.
-
-    NvU64 frtsOffset;
-    NvU64 frtsSize;
-
-    NvU64 gspFwWprEnd;
-
-    // GSP-RM to use for fbRegionInfo?
-    NvU64 fbSize;
-
-    // ---- Other members -----------------------------------------------
-
-    // GSP-RM to use for fbRegionInfo?
-    NvU64 vgaWorkspaceOffset;
-    NvU64 vgaWorkspaceSize;
-
-    // Boot count.  Used to determine whether to load the firmware image.
-    NvU64 bootCount;
-
-    // TODO: the partitionRpc* fields below do not really belong in this
-    //       structure. The values are patched in by the partition bootstrapper
-    //       when GSP-RM is booted in a partition, and this structure was a
-    //       convenient place for the bootstrapper to access them. These should
-    //       be moved to a different comm. mechanism between the bootstrapper
-    //       and the GSP-RM tasks.
-
-    union
-    {
-	struct
-	{
-	    // Shared partition RPC memory (physical address)
-	    NvU64 partitionRpcAddr;
-
-	    // Offsets relative to partitionRpcAddr
-	    NvU16 partitionRpcRequestOffset;
-	    NvU16 partitionRpcReplyOffset;
-
-	    // Code section and dataSection offset and size.
-	    NvU32 elfCodeOffset;
-	    NvU32 elfDataOffset;
-	    NvU32 elfCodeSize;
-	    NvU32 elfDataSize;
-
-	    // Used during GSP-RM resume to check for revocation
-	    NvU32 lsUcodeVersion;
-	};
-
-        struct
-	{
-	    // Pad for the partitionRpc* fields, plus 4 bytes
-	    NvU32 partitionRpcPadding[4];
-
-            // CrashCat (contiguous) buffer size/location - occupies same bytes as the
-            // elf(Code|Data)(Offset|Size) fields above.
-            // TODO: move to GSP_FMC_INIT_PARAMS
-            NvU64 sysmemAddrOfCrashReportQueue;
-            NvU32 sizeOfCrashReportQueue;
-
-            // Pad for the lsUcodeVersion field
-            NvU32 lsUcodeVersionPadding[1];
-        };
-    };
-
-    // Number of VF partitions allocating sub-heaps from the WPR heap
-    // Used during boot to ensure the heap is adequately sized
-    NvU8 gspFwHeapVfPartitionCount;
-
-    // Pad structure to exactly 256 bytes.  Can replace padding with additional
-    // fields without incrementing revision.  Padding initialized to 0.
-    NvU8 padding[7];
-
-    // BL to use for verification (i.e. Booter says OK to boot)
-    NvU64 verified;  // 0x0 -> unverified, 0xa0a0a0a0a0a0a0a0 -> verified
-} GspFwWprMeta;
-
-#define GSP_FW_WPR_META_REVISION  1
-#define GSP_FW_WPR_META_MAGIC     0xdc3aae21371a60b3ULL
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
deleted file mode 100644
index 4eff473e8990..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
+++ /dev/null
@@ -1,82 +0,0 @@
-#ifndef __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
-#define __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct {
-    //
-    // Version 1
-    // Version 2
-    // Version 3 = for Partition boot
-    // Version 4 = for eb riscv boot
-    // Version 5 = Support signing entire RISC-V image as "code" in code section for hopper and later.
-    //
-    NvU32  version;                         // structure version
-    NvU32  bootloaderOffset;
-    NvU32  bootloaderSize;
-    NvU32  bootloaderParamOffset;
-    NvU32  bootloaderParamSize;
-    NvU32  riscvElfOffset;
-    NvU32  riscvElfSize;
-    NvU32  appVersion;                      // Changelist number associated with the image
-    //
-    // Manifest contains information about Monitor and it is
-    // input to BR
-    //
-    NvU32  manifestOffset;
-    NvU32  manifestSize;
-    //
-    // Monitor Data offset within RISCV image and size
-    //
-    NvU32  monitorDataOffset;
-    NvU32  monitorDataSize;
-    //
-    // Monitor Code offset withtin RISCV image and size
-    //
-    NvU32  monitorCodeOffset;
-    NvU32  monitorCodeSize;
-    NvU32  bIsMonitorEnabled;
-    //
-    // Swbrom Code offset within RISCV image and size
-    //
-    NvU32  swbromCodeOffset;
-    NvU32  swbromCodeSize;
-    //
-    // Swbrom Data offset within RISCV image and size
-    //
-    NvU32  swbromDataOffset;
-    NvU32  swbromDataSize;
-    //
-    // Total size of FB carveout (image and reserved space).  
-    //
-    NvU32  fbReservedSize;
-    //
-    // Indicates whether the entire RISC-V image is signed as "code" in code section.
-    //
-    NvU32  bSignedAsCode;
-} RM_RISCV_UCODE_DESC;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h
deleted file mode 100644
index 341ab0dbeaf2..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h
+++ /dev/null
@@ -1,100 +0,0 @@
-#ifndef __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
-#define __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2019-2020 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum GSP_SEQ_BUF_OPCODE
-{
-    GSP_SEQ_BUF_OPCODE_REG_WRITE = 0,
-    GSP_SEQ_BUF_OPCODE_REG_MODIFY,
-    GSP_SEQ_BUF_OPCODE_REG_POLL,
-    GSP_SEQ_BUF_OPCODE_DELAY_US,
-    GSP_SEQ_BUF_OPCODE_REG_STORE,
-    GSP_SEQ_BUF_OPCODE_CORE_RESET,
-    GSP_SEQ_BUF_OPCODE_CORE_START,
-    GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
-    GSP_SEQ_BUF_OPCODE_CORE_RESUME,
-} GSP_SEQ_BUF_OPCODE;
-
-#define GSP_SEQUENCER_PAYLOAD_SIZE_DWORDS(opcode)                       \
-    ((opcode == GSP_SEQ_BUF_OPCODE_REG_WRITE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_WRITE)  / sizeof(NvU32)) : \
-     (opcode == GSP_SEQ_BUF_OPCODE_REG_MODIFY) ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_MODIFY) / sizeof(NvU32)) : \
-     (opcode == GSP_SEQ_BUF_OPCODE_REG_POLL)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_POLL)   / sizeof(NvU32)) : \
-     (opcode == GSP_SEQ_BUF_OPCODE_DELAY_US)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_DELAY_US)   / sizeof(NvU32)) : \
-     (opcode == GSP_SEQ_BUF_OPCODE_REG_STORE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_STORE)  / sizeof(NvU32)) : \
-    /* GSP_SEQ_BUF_OPCODE_CORE_RESET */                                 \
-    /* GSP_SEQ_BUF_OPCODE_CORE_START */                                 \
-    /* GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT */                         \
-    /* GSP_SEQ_BUF_OPCODE_CORE_RESUME */                                \
-    0)
-
-typedef struct
-{
-    NvU32 addr;
-    NvU32 val;
-} GSP_SEQ_BUF_PAYLOAD_REG_WRITE;
-
-typedef struct
-{
-    NvU32 addr;
-    NvU32 mask;
-    NvU32 val;
-} GSP_SEQ_BUF_PAYLOAD_REG_MODIFY;
-
-typedef struct
-{
-    NvU32 addr;
-    NvU32 mask;
-    NvU32 val;
-    NvU32 timeout;
-    NvU32 error;
-} GSP_SEQ_BUF_PAYLOAD_REG_POLL;
-
-typedef struct
-{
-    NvU32 val;
-} GSP_SEQ_BUF_PAYLOAD_DELAY_US;
-
-typedef struct
-{
-    NvU32 addr;
-    NvU32 index;
-} GSP_SEQ_BUF_PAYLOAD_REG_STORE;
-
-typedef struct GSP_SEQUENCER_BUFFER_CMD
-{
-    GSP_SEQ_BUF_OPCODE opCode;
-    union
-    {
-        GSP_SEQ_BUF_PAYLOAD_REG_WRITE regWrite;
-        GSP_SEQ_BUF_PAYLOAD_REG_MODIFY regModify;
-        GSP_SEQ_BUF_PAYLOAD_REG_POLL regPoll;
-        GSP_SEQ_BUF_PAYLOAD_DELAY_US delayUs;
-        GSP_SEQ_BUF_PAYLOAD_REG_STORE regStore;
-    } payload;
-} GSP_SEQUENCER_BUFFER_CMD;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclasses.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclasses.h
deleted file mode 100644
index 3144e9beac61..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclasses.h
+++ /dev/null
@@ -1,33 +0,0 @@
-#ifndef __src_nvidia_generated_g_allclasses_h__
-#define __src_nvidia_generated_g_allclasses_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2021-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV01_EVENT_KERNEL_CALLBACK_EX            (0x0000007e)
-
-#define NV04_DISPLAY_COMMON                      (0x00000073)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h
deleted file mode 100644
index 6b8921138c7d..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h
+++ /dev/null
@@ -1,38 +0,0 @@
-#ifndef __src_nvidia_generated_g_chipset_nvoc_h__
-#define __src_nvidia_generated_g_chipset_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct
-{
-    NvU16               deviceID;           // deviceID
-    NvU16               vendorID;           // vendorID
-    NvU16               subdeviceID;        // subsystem deviceID
-    NvU16               subvendorID;        // subsystem vendorID
-    NvU8                revisionID;         // revision ID
-} BUSINFO;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h
deleted file mode 100644
index a5128f00225b..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef __src_nvidia_generated_g_fbsr_nvoc_h__
-#define __src_nvidia_generated_g_fbsr_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2009-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define FBSR_TYPE_DMA                                 4   // Copy using DMA. Fastest.
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h
deleted file mode 100644
index 5641a21cacca..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h
+++ /dev/null
@@ -1,35 +0,0 @@
-#ifndef __src_nvidia_generated_g_gpu_nvoc_h__
-#define __src_nvidia_generated_g_gpu_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2004-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum
-{
-    COMPUTE_BRANDING_TYPE_NONE,
-    COMPUTE_BRANDING_TYPE_TESLA,
-} COMPUTE_BRANDING_TYPE;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h
deleted file mode 100644
index b5ad55f854dc..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h
+++ /dev/null
@@ -1,62 +0,0 @@
-#ifndef __src_nvidia_generated_g_kernel_channel_nvoc_h__
-#define __src_nvidia_generated_g_kernel_channel_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum {
-    /*!
-     * Initial state as passed in NV_CHANNEL_ALLOC_PARAMS by
-     * kernel CPU-RM clients.
-     */
-    ERROR_NOTIFIER_TYPE_UNKNOWN = 0,
-    /*! @brief Error notifier is explicitly not set.
-     *
-     * The corresponding hErrorContext or hEccErrorContext must be
-     * NV01_NULL_OBJECT.
-     */
-    ERROR_NOTIFIER_TYPE_NONE,
-    /*! @brief Error notifier is a ContextDma */
-    ERROR_NOTIFIER_TYPE_CTXDMA,
-    /*! @brief Error notifier is a NvNotification array in sysmem/vidmem */
-    ERROR_NOTIFIER_TYPE_MEMORY
-} ErrorNotifierType;
-
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE                       1:0
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_USER                  0x0
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_ADMIN                 0x1
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_KERNEL                0x2
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE             3:2
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_UNKNOWN     ERROR_NOTIFIER_TYPE_UNKNOWN
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_NONE        ERROR_NOTIFIER_TYPE_NONE
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_CTXDMA      ERROR_NOTIFIER_TYPE_CTXDMA
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_MEMORY      ERROR_NOTIFIER_TYPE_MEMORY
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE         5:4
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_UNKNOWN ERROR_NOTIFIER_TYPE_UNKNOWN
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_NONE    ERROR_NOTIFIER_TYPE_NONE
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_CTXDMA  ERROR_NOTIFIER_TYPE_CTXDMA
-#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_MEMORY  ERROR_NOTIFIER_TYPE_MEMORY
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h
deleted file mode 100644
index 946954ac5b3d..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h
+++ /dev/null
@@ -1,119 +0,0 @@
-#ifndef __src_nvidia_generated_g_kernel_fifo_nvoc_h__
-#define __src_nvidia_generated_g_kernel_fifo_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum
-{
-    /* *************************************************************************
-     * Bug 3820969
-     * THINK BEFORE CHANGING ENUM ORDER HERE.
-     * VGPU-guest uses this same ordering. Because this enum is not versioned,
-     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
-     * ************************************************************************/
-
-    // *ENG_XYZ, e.g.: ENG_GR, ENG_CE etc.,
-    ENGINE_INFO_TYPE_ENG_DESC = 0,
-
-    // HW engine ID
-    ENGINE_INFO_TYPE_FIFO_TAG,
-
-    // RM_ENGINE_TYPE_*
-    ENGINE_INFO_TYPE_RM_ENGINE_TYPE,
-
-    //
-    // runlist id (meaning varies by GPU)
-    // Valid only for Esched-driven engines
-    //
-    ENGINE_INFO_TYPE_RUNLIST,
-
-    // NV_PFIFO_INTR_MMU_FAULT_ENG_ID_*
-    ENGINE_INFO_TYPE_MMU_FAULT_ID,
-
-    // ROBUST_CHANNEL_*
-    ENGINE_INFO_TYPE_RC_MASK,
-
-    // Reset Bit Position. On Ampere, only valid if not _INVALID
-    ENGINE_INFO_TYPE_RESET,
-
-    // Interrupt Bit Position
-    ENGINE_INFO_TYPE_INTR,
-
-    // log2(MC_ENGINE_*)
-    ENGINE_INFO_TYPE_MC,
-
-    // The DEV_TYPE_ENUM for this engine
-    ENGINE_INFO_TYPE_DEV_TYPE_ENUM,
-
-    // The particular instance of this engine type
-    ENGINE_INFO_TYPE_INSTANCE_ID,
-
-    //
-    // The base address for this engine's NV_RUNLIST. Valid only on Ampere+
-    // Valid only for Esched-driven engines
-    //
-    ENGINE_INFO_TYPE_RUNLIST_PRI_BASE,
-
-    //
-    // If this entry is a host-driven engine.
-    // Update _isEngineInfoTypeValidForOnlyHostDriven when adding any new entry.
-    //
-    ENGINE_INFO_TYPE_IS_HOST_DRIVEN_ENGINE,
-
-    //
-    // The index into the per-engine NV_RUNLIST registers. Valid only on Ampere+
-    // Valid only for Esched-driven engines
-    //
-    ENGINE_INFO_TYPE_RUNLIST_ENGINE_ID,
-
-    //
-    // The base address for this engine's NV_CHRAM registers. Valid only on
-    // Ampere+
-    //
-    // Valid only for Esched-driven engines
-    //
-    ENGINE_INFO_TYPE_CHRAM_PRI_BASE,
-
-    // This entry added to copy data at RMCTRL_EXPORT() call for Kernel RM
-    ENGINE_INFO_TYPE_KERNEL_RM_MAX,
-    // Used for iterating the engine info table by the index passed.
-    ENGINE_INFO_TYPE_INVALID = ENGINE_INFO_TYPE_KERNEL_RM_MAX,
-
-    // Size of FIFO_ENGINE_LIST.engineData
-    ENGINE_INFO_TYPE_ENGINE_DATA_ARRAY_SIZE = ENGINE_INFO_TYPE_INVALID,
-
-    // Input-only parameter for kfifoEngineInfoXlate.
-    ENGINE_INFO_TYPE_PBDMA_ID
-
-    /* *************************************************************************
-     * Bug 3820969
-     * THINK BEFORE CHANGING ENUM ORDER HERE.
-     * VGPU-guest uses this same ordering. Because this enum is not versioned,
-     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
-     * ************************************************************************/
-} ENGINE_INFO_TYPE;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h
deleted file mode 100644
index daabaee41c87..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#ifndef __src_nvidia_generated_g_mem_desc_nvoc_h__
-#define __src_nvidia_generated_g_mem_desc_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define ADDR_SYSMEM     1         // System memory (PCI)
-#define ADDR_FBMEM      2         // Frame buffer memory space
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
deleted file mode 100644
index 10121218f4d3..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.h
+++ /dev/null
@@ -1,44 +0,0 @@
-#ifndef __src_nvidia_generated_g_os_nvoc_h__
-#define __src_nvidia_generated_g_os_nvoc_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct PACKED_REGISTRY_ENTRY
-{
-    NvU32                   nameOffset;
-    NvU8                    type;
-    NvU32                   data;
-    NvU32                   length;
-} PACKED_REGISTRY_ENTRY;
-
-typedef struct PACKED_REGISTRY_TABLE
-{
-    NvU32                   size;
-    NvU32                   numEntries;
-    PACKED_REGISTRY_ENTRY   entries[] __counted_by(numEntries);
-} PACKED_REGISTRY_TABLE;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-structures.h
deleted file mode 100644
index 8d925e24faea..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-structures.h
+++ /dev/null
@@ -1,124 +0,0 @@
-#ifndef __src_nvidia_generated_g_rpc_structures_h__
-#define __src_nvidia_generated_g_rpc_structures_h__
-#include <nvrm/535.113.01/nvidia/generated/g_sdk-structures.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct rpc_alloc_memory_v13_01
-{
-    NvHandle   hClient;
-    NvHandle   hDevice;
-    NvHandle   hMemory;
-    NvU32      hClass;
-    NvU32      flags;
-    NvU32      pteAdjust;
-    NvU32      format;
-    NvU64      length NV_ALIGN_BYTES(8);
-    NvU32      pageCount;
-    struct pte_desc pteDesc;
-} rpc_alloc_memory_v13_01;
-
-typedef struct rpc_free_v03_00
-{
-    NVOS00_PARAMETERS_v03_00 params;
-} rpc_free_v03_00;
-
-typedef struct rpc_unloading_guest_driver_v1F_07
-{
-    NvBool     bInPMTransition;
-    NvBool     bGc6Entering;
-    NvU32      newLevel;
-} rpc_unloading_guest_driver_v1F_07;
-
-typedef struct rpc_update_bar_pde_v15_00
-{
-    UpdateBarPde_v15_00 info;
-} rpc_update_bar_pde_v15_00;
-
-typedef struct rpc_gsp_rm_alloc_v03_00
-{
-    NvHandle   hClient;
-    NvHandle   hParent;
-    NvHandle   hObject;
-    NvU32      hClass;
-    NvU32      status;
-    NvU32      paramsSize;
-    NvU32      flags;
-    NvU8       reserved[4];
-    NvU8       params[];
-} rpc_gsp_rm_alloc_v03_00;
-
-typedef struct rpc_gsp_rm_control_v03_00
-{
-    NvHandle   hClient;
-    NvHandle   hObject;
-    NvU32      cmd;
-    NvU32      status;
-    NvU32      paramsSize;
-    NvU32      flags;
-    NvU8       params[];
-} rpc_gsp_rm_control_v03_00;
-
-typedef struct rpc_run_cpu_sequencer_v17_00
-{
-    NvU32      bufferSizeDWord;
-    NvU32      cmdIndex;
-    NvU32      regSaveArea[8];
-    NvU32      commandBuffer[];
-} rpc_run_cpu_sequencer_v17_00;
-
-typedef struct rpc_post_event_v17_00
-{
-    NvHandle   hClient;
-    NvHandle   hEvent;
-    NvU32      notifyIndex;
-    NvU32      data;
-    NvU16      info16;
-    NvU32      status;
-    NvU32      eventDataSize;
-    NvBool     bNotifyList;
-    NvU8       eventData[];
-} rpc_post_event_v17_00;
-
-typedef struct rpc_rc_triggered_v17_02
-{
-    NvU32      nv2080EngineType;
-    NvU32      chid;
-    NvU32      exceptType;
-    NvU32      scope;
-    NvU16      partitionAttributionId;
-} rpc_rc_triggered_v17_02;
-
-typedef struct rpc_os_error_log_v17_00
-{
-    NvU32      exceptType;
-    NvU32      runlistId;
-    NvU32      chid;
-    char       errString[0x100];
-} rpc_os_error_log_v17_00;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-structures.h
deleted file mode 100644
index e9fed4140468..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-structures.h
+++ /dev/null
@@ -1,45 +0,0 @@
-#ifndef __src_nvidia_generated_g_sdk_structures_h__
-#define __src_nvidia_generated_g_sdk_structures_h__
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct NVOS00_PARAMETERS_v03_00
-{
-    NvHandle   hRoot;
-    NvHandle   hObjectParent;
-    NvHandle   hObjectOld;
-    NvV32      status;
-} NVOS00_PARAMETERS_v03_00;
-
-typedef struct UpdateBarPde_v15_00
-{
-    NV_RPC_UPDATE_PDE_BAR_TYPE barType;
-    NvU64      entryValue NV_ALIGN_BYTES(8);
-    NvU64      entryLevelShift NV_ALIGN_BYTES(8);
-} UpdateBarPde_v15_00;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h
deleted file mode 100644
index af50b11ec3b4..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h
+++ /dev/null
@@ -1,74 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
-#define __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct DOD_METHOD_DATA
-{
-    NV_STATUS status;
-    NvU32     acpiIdListLen;
-    NvU32     acpiIdList[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
-} DOD_METHOD_DATA;
-
-typedef struct JT_METHOD_DATA
-{
-    NV_STATUS status;
-    NvU32     jtCaps;
-    NvU16     jtRevId;
-    NvBool    bSBIOSCaps;
-} JT_METHOD_DATA;
-
-typedef struct MUX_METHOD_DATA_ELEMENT
-{
-    NvU32       acpiId;
-    NvU32       mode;
-    NV_STATUS   status;
-} MUX_METHOD_DATA_ELEMENT;
-
-typedef struct MUX_METHOD_DATA
-{
-    NvU32                       tableLen;
-    MUX_METHOD_DATA_ELEMENT     acpiIdMuxModeTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
-    MUX_METHOD_DATA_ELEMENT     acpiIdMuxPartTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
-} MUX_METHOD_DATA;
-
-typedef struct CAPS_METHOD_DATA
-{
-    NV_STATUS status;
-    NvU32     optimusCaps;
-} CAPS_METHOD_DATA;
-
-typedef struct ACPI_METHOD_DATA
-{
-    NvBool                                               bValid;
-    DOD_METHOD_DATA                                      dodMethodData;
-    JT_METHOD_DATA                                       jtMethodData;
-    MUX_METHOD_DATA                                      muxMethodData;
-    CAPS_METHOD_DATA                                     capsMethodData;
-} ACPI_METHOD_DATA;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h
deleted file mode 100644
index e3160c60036d..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h
+++ /dev/null
@@ -1,86 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
-#define __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef enum
-{
-    RM_ENGINE_TYPE_NULL                 =       (0x00000000),
-    RM_ENGINE_TYPE_GR0                  =       (0x00000001),
-    RM_ENGINE_TYPE_GR1                  =       (0x00000002),
-    RM_ENGINE_TYPE_GR2                  =       (0x00000003),
-    RM_ENGINE_TYPE_GR3                  =       (0x00000004),
-    RM_ENGINE_TYPE_GR4                  =       (0x00000005),
-    RM_ENGINE_TYPE_GR5                  =       (0x00000006),
-    RM_ENGINE_TYPE_GR6                  =       (0x00000007),
-    RM_ENGINE_TYPE_GR7                  =       (0x00000008),
-    RM_ENGINE_TYPE_COPY0                =       (0x00000009),
-    RM_ENGINE_TYPE_COPY1                =       (0x0000000a),
-    RM_ENGINE_TYPE_COPY2                =       (0x0000000b),
-    RM_ENGINE_TYPE_COPY3                =       (0x0000000c),
-    RM_ENGINE_TYPE_COPY4                =       (0x0000000d),
-    RM_ENGINE_TYPE_COPY5                =       (0x0000000e),
-    RM_ENGINE_TYPE_COPY6                =       (0x0000000f),
-    RM_ENGINE_TYPE_COPY7                =       (0x00000010),
-    RM_ENGINE_TYPE_COPY8                =       (0x00000011),
-    RM_ENGINE_TYPE_COPY9                =       (0x00000012),
-    RM_ENGINE_TYPE_NVDEC0               =       (0x0000001d),
-    RM_ENGINE_TYPE_NVDEC1               =       (0x0000001e),
-    RM_ENGINE_TYPE_NVDEC2               =       (0x0000001f),
-    RM_ENGINE_TYPE_NVDEC3               =       (0x00000020),
-    RM_ENGINE_TYPE_NVDEC4               =       (0x00000021),
-    RM_ENGINE_TYPE_NVDEC5               =       (0x00000022),
-    RM_ENGINE_TYPE_NVDEC6               =       (0x00000023),
-    RM_ENGINE_TYPE_NVDEC7               =       (0x00000024),
-    RM_ENGINE_TYPE_NVENC0               =       (0x00000025),
-    RM_ENGINE_TYPE_NVENC1               =       (0x00000026),
-    RM_ENGINE_TYPE_NVENC2               =       (0x00000027),
-    RM_ENGINE_TYPE_VP                   =       (0x00000028),
-    RM_ENGINE_TYPE_ME                   =       (0x00000029),
-    RM_ENGINE_TYPE_PPP                  =       (0x0000002a),
-    RM_ENGINE_TYPE_MPEG                 =       (0x0000002b),
-    RM_ENGINE_TYPE_SW                   =       (0x0000002c),
-    RM_ENGINE_TYPE_TSEC                 =       (0x0000002d),
-    RM_ENGINE_TYPE_VIC                  =       (0x0000002e),
-    RM_ENGINE_TYPE_MP                   =       (0x0000002f),
-    RM_ENGINE_TYPE_SEC2                 =       (0x00000030),
-    RM_ENGINE_TYPE_HOST                 =       (0x00000031),
-    RM_ENGINE_TYPE_DPU                  =       (0x00000032),
-    RM_ENGINE_TYPE_PMU                  =       (0x00000033),
-    RM_ENGINE_TYPE_FBFLCN               =       (0x00000034),
-    RM_ENGINE_TYPE_NVJPEG0              =       (0x00000035),
-    RM_ENGINE_TYPE_NVJPEG1              =       (0x00000036),
-    RM_ENGINE_TYPE_NVJPEG2              =       (0x00000037),
-    RM_ENGINE_TYPE_NVJPEG3              =       (0x00000038),
-    RM_ENGINE_TYPE_NVJPEG4              =       (0x00000039),
-    RM_ENGINE_TYPE_NVJPEG5              =       (0x0000003a),
-    RM_ENGINE_TYPE_NVJPEG6              =       (0x0000003b),
-    RM_ENGINE_TYPE_NVJPEG7              =       (0x0000003c),
-    RM_ENGINE_TYPE_OFA                  =       (0x0000003d),
-    RM_ENGINE_TYPE_LAST                 =       (0x0000003e),
-} RM_ENGINE_TYPE;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
deleted file mode 100644
index 3abec59f0cc4..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
+++ /dev/null
@@ -1,33 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
-#define __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB                  (96 << 10)   // All architectures
-
-#define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   // Support 2048 channels
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
deleted file mode 100644
index 4033a6f85a76..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
+++ /dev/null
@@ -1,57 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
-#define __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct {
-    RmPhysAddr sharedMemPhysAddr;
-    NvU32 pageTableEntryCount;
-    NvLength cmdQueueOffset;
-    NvLength statQueueOffset;
-    NvLength locklessCmdQueueOffset;
-    NvLength locklessStatQueueOffset;
-} MESSAGE_QUEUE_INIT_ARGUMENTS;
-
-typedef struct {
-    NvU32 oldLevel;
-    NvU32 flags;
-    NvBool bInPMTransition;
-} GSP_SR_INIT_ARGUMENTS;
-
-typedef struct
-{
-    MESSAGE_QUEUE_INIT_ARGUMENTS      messageQueueInitArguments;
-    GSP_SR_INIT_ARGUMENTS             srInitArguments;
-    NvU32                             gpuInstance;
-
-    struct
-    {
-        NvU64                         pa;
-        NvU64                         size;
-    } profilerArgs;
-} GSP_ARGUMENTS_CACHED;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
deleted file mode 100644
index eeab25a5e290..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
+++ /dev/null
@@ -1,174 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
-#define __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
-#include <nvrm/535.113.01/nvidia/generated/g_chipset_nvoc.h>
-#include <nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2019-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-typedef struct GSP_VF_INFO
-{
-    NvU32  totalVFs;
-    NvU32  firstVFOffset;
-    NvU64  FirstVFBar0Address;
-    NvU64  FirstVFBar1Address;
-    NvU64  FirstVFBar2Address;
-    NvBool b64bitBar0;
-    NvBool b64bitBar1;
-    NvBool b64bitBar2;
-} GSP_VF_INFO;
-
-typedef struct GspSMInfo_t
-{
-    NvU32 version;
-    NvU32 regBankCount;
-    NvU32 regBankRegCount;
-    NvU32 maxWarpsPerSM;
-    NvU32 maxThreadsPerWarp;
-    NvU32 geomGsObufEntries;
-    NvU32 geomXbufEntries;
-    NvU32 maxSPPerSM;
-    NvU32 rtCoreCount;
-} GspSMInfo;
-
-typedef struct GspStaticConfigInfo_t
-{
-    NvU8 grCapsBits[NV0080_CTRL_GR_CAPS_TBL_SIZE];
-    NV2080_CTRL_GPU_GET_GID_INFO_PARAMS gidInfo;
-    NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS gpcInfo;
-    NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS tpcInfo[MAX_GPC_COUNT];
-    NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS zcullInfo[MAX_GPC_COUNT];
-    NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS SKUInfo;
-    NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS fbRegionInfoParams;
-    COMPUTE_BRANDING_TYPE computeBranding;
-
-    NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS sriovCaps;
-    NvU32 sriovMaxGfid;
-
-    NvU32 engineCaps[NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX];
-
-    GspSMInfo SM_info;
-
-    NvBool poisonFuseEnabled;
-
-    NvU64 fb_length;
-    NvU32 fbio_mask;
-    NvU32 fb_bus_width;
-    NvU32 fb_ram_type;
-    NvU32 fbp_mask;
-    NvU32 l2_cache_size;
-
-    NvU32 gfxpBufferSize[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
-    NvU32 gfxpBufferAlignment[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
-
-    NvU8 gpuNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
-    NvU8 gpuShortNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
-    NvU16 gpuNameString_Unicode[NV2080_GPU_MAX_NAME_STRING_LENGTH];
-    NvBool bGpuInternalSku;
-    NvBool bIsQuadroGeneric;
-    NvBool bIsQuadroAd;
-    NvBool bIsNvidiaNvs;
-    NvBool bIsVgx;
-    NvBool bGeforceSmb;
-    NvBool bIsTitan;
-    NvBool bIsTesla;
-    NvBool bIsMobile;
-    NvBool bIsGc6Rtd3Allowed;
-    NvBool bIsGcOffRtd3Allowed;
-    NvBool bIsGcoffLegacyAllowed;
-
-    NvU64 bar1PdeBase;
-    NvU64 bar2PdeBase;
-
-    NvBool bVbiosValid;
-    NvU32 vbiosSubVendor;
-    NvU32 vbiosSubDevice;
-
-    NvBool bPageRetirementSupported;
-
-    NvBool bSplitVasBetweenServerClientRm;
-
-    NvBool bClRootportNeedsNosnoopWAR;
-
-    VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS displaylessMaxHeads;
-    VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS displaylessMaxResolution;
-    NvU64 displaylessMaxPixels;
-
-    // Client handle for internal RMAPI control.
-    NvHandle hInternalClient;
-
-    // Device handle for internal RMAPI control.
-    NvHandle hInternalDevice;
-
-    // Subdevice handle for internal RMAPI control.
-    NvHandle hInternalSubdevice;
-
-    NvBool bSelfHostedMode;
-    NvBool bAtsSupported;
-
-    NvBool bIsGpuUefi;
-} GspStaticConfigInfo;
-
-typedef struct GspSystemInfo
-{
-    NvU64 gpuPhysAddr;
-    NvU64 gpuPhysFbAddr;
-    NvU64 gpuPhysInstAddr;
-    NvU64 nvDomainBusDeviceFunc;
-    NvU64 simAccessBufPhysAddr;
-    NvU64 pcieAtomicsOpMask;
-    NvU64 consoleMemSize;
-    NvU64 maxUserVa;
-    NvU32 pciConfigMirrorBase;
-    NvU32 pciConfigMirrorSize;
-    NvU8 oorArch;
-    NvU64 clPdbProperties;
-    NvU32 Chipset;
-    NvBool bGpuBehindBridge;
-    NvBool bMnocAvailable;
-    NvBool bUpstreamL0sUnsupported;
-    NvBool bUpstreamL1Unsupported;
-    NvBool bUpstreamL1PorSupported;
-    NvBool bUpstreamL1PorMobileOnly;
-    NvU8   upstreamAddressValid;
-    BUSINFO FHBBusInfo;
-    BUSINFO chipsetIDInfo;
-    ACPI_METHOD_DATA acpiMethodData;
-    NvU32 hypervisorType;
-    NvBool bIsPassthru;
-    NvU64 sysTimerOffsetNs;
-    GSP_VF_INFO gspVFInfo;
-} GspSystemInfo;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h
deleted file mode 100644
index bd5e01f9814b..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ /dev/null
@@ -1,57 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
-#define __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define MC_ENGINE_IDX_DISP                          2
-
-#define MC_ENGINE_IDX_CE0                           15
-
-#define MC_ENGINE_IDX_CE9                           24
-
-#define MC_ENGINE_IDX_MSENC                         38
-
-#define MC_ENGINE_IDX_MSENC2                        40
-
-#define MC_ENGINE_IDX_GSP                           49
-#define MC_ENGINE_IDX_NVJPG                         50
-#define MC_ENGINE_IDX_NVJPEG                        MC_ENGINE_IDX_NVJPG
-#define MC_ENGINE_IDX_NVJPEG0                       MC_ENGINE_IDX_NVJPEG
-
-#define MC_ENGINE_IDX_NVJPEG7                       57
-
-#define MC_ENGINE_IDX_BSP                           64
-#define MC_ENGINE_IDX_NVDEC                         MC_ENGINE_IDX_BSP
-#define MC_ENGINE_IDX_NVDEC0                        MC_ENGINE_IDX_NVDEC
-
-#define MC_ENGINE_IDX_NVDEC7                        71
-
-#define MC_ENGINE_IDX_OFA0                          80
-
-#define MC_ENGINE_IDX_GR                            82
-#define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h
deleted file mode 100644
index 366447a368bf..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h
+++ /dev/null
@@ -1,33 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_gpu_nvbitmask_h__
-#define __src_nvidia_inc_kernel_gpu_nvbitmask_h__
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h>
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NVGPU_ENGINE_CAPS_MASK_BITS                32
-#define NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX           ((RM_ENGINE_TYPE_LAST-1)/NVGPU_ENGINE_CAPS_MASK_BITS + 1)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h
deleted file mode 100644
index 4a850dad4776..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#ifndef __src_nvidia_inc_kernel_os_nv_memory_type_h__
-#define __src_nvidia_inc_kernel_os_nv_memory_type_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2020 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define NV_MEMORY_WRITECOMBINED      2
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h
deleted file mode 100644
index f14b23852456..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h
+++ /dev/null
@@ -1,51 +0,0 @@
-#ifndef __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
-#define __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2017-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#define MAX_GPC_COUNT           32
-
-typedef enum
-{
-    NV_RPC_UPDATE_PDE_BAR_1,
-    NV_RPC_UPDATE_PDE_BAR_2,
-    NV_RPC_UPDATE_PDE_BAR_INVALID,
-} NV_RPC_UPDATE_PDE_BAR_TYPE;
-
-typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS 
-{
-    NvU32 headIndex;
-    NvU32 maxHResolution;
-    NvU32 maxVResolution;
-} VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS;
-
-typedef struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS 
-{
-    NvU32 numHeads;
-    NvU32 maxNumHeads;
-} VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS;
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h
deleted file mode 100644
index 7801af232dff..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-structures.h
+++ /dev/null
@@ -1,40 +0,0 @@
-#ifndef __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
-#define __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
-
-/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
-
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-struct pte_desc
-{
-    NvU32 idr:2;
-    NvU32 reserved1:14;
-    NvU32 length:16;
-    union {
-        NvU64 pte; // PTE when IDR==0; PDE when IDR > 0
-        NvU64 pde; // PTE when IDR==0; PDE when IDR > 0
-    } pte_pde[]  NV_ALIGN_BYTES(8); // PTE when IDR==0; PDE when IDR > 0
-};
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h b/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
index e6833df1ccc7..af11648ad9c8 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
@@ -21,4 +21,6 @@ typedef NvU64 NvLength;
 typedef NvU64 RmPhysAddr;
 
 typedef NvU32 NV_STATUS;
+
+typedef union {} rpc_generic_union;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
index 968fb7e01b46..46e3a29f2ad7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -21,9 +21,8 @@
  */
 #include <rm/rpc.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include "nvrm/alloc.h"
+#include "nvrm/rpcfn.h"
 
 static int
 r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index ce2c86c159b5..f72e2a7ac6bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -27,10 +27,8 @@
 #include <subdev/instmem.h>
 #include <subdev/mmu/vmm.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_headers.h>
+#include "nvrm/bar.h"
+#include "nvrm/rpcfn.h"
 
 static void
 r535_bar_flush(struct nvkm_bar *bar)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
index 0d73906f4a5a..d60003231e6d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
@@ -25,9 +25,8 @@
 #include <subdev/gsp.h>
 #include <engine/fifo.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/clc0b5sw.h>
+#include "nvrm/ce.h"
+#include "nvrm/engine.h"
 
 struct r535_ce_obj {
 	struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
index 7a2da37af283..c0146c00584d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -21,8 +21,7 @@
  */
 #include <rm/rm.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0000.h>
+#include "nvrm/client.h"
 
 static void
 r535_gsp_client_dtor(struct nvkm_gsp_client *client)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
index f3f0fcd22cac..70b9ee911c5e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -21,9 +21,8 @@
  */
 #include <rm/rpc.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include "nvrm/ctrl.h"
+#include "nvrm/rpcfn.h"
 
 static void
 r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
index 09173ca1c050..094abf7b5f97 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
@@ -21,13 +21,8 @@
  */
 #include <rm/rm.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
+#include "nvrm/device.h"
+#include "nvrm/event.h"
 
 static void
 r535_gsp_event_dtor(struct nvkm_gsp_event *event)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 1aae15167249..475faa35361a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -36,17 +36,7 @@
 
 #include <nvhw/drf.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
-#include <nvrm/535.113.01/nvidia/generated/g_mem_desc_nvoc.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/os/nv_memory_type.h>
+#include "nvrm/disp.h"
 
 #include <linux/acpi.h>
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 6305f3a93810..b2f22bd93f4e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -20,18 +20,12 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <subdev/instmem/priv.h>
-
 #include <subdev/gsp.h>
 
 #include <nvhw/drf.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl84a0.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
-#include <nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h>
-#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include "nvrm/fbsr.h"
+#include "nvrm/rpcfn.h"
 
 struct fbsr_item {
 	const char *type;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 621e5dfe898a..594a6bbb1db2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -33,17 +33,8 @@
 
 #include <nvhw/drf.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080_notification.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h>
-#include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
-#include <nvrm/535.113.01/nvidia/generated/g_kernel_fifo_nvoc.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_engine_type.h>
+#include "nvrm/fifo.h"
+#include "nvrm/engine.h"
 
 static u32
 r535_chan_doorbell_handle(struct nvkm_chan *chan)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 37bde547ae65..ab941d808e24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -30,12 +30,7 @@
 
 #include <nvhw/drf.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
+#include "nvrm/gr.h"
 
 #define r535_gr(p) container_of((p), struct r535_gr, base)
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index f42879b2ea7e..48af5d8d22e8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -32,22 +32,11 @@
 
 #include <nvfw/fw.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h>
-#include <nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h>
-#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h>
-#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h>
-#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
-#include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
-#include <nvrm/535.113.01/nvidia/generated/g_os_nvoc.h>
-#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
-#include <nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/engine_idx.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include "nvrm/gsp.h"
+#include "nvrm/rpcfn.h"
+#include "nvrm/msgfn.h"
+#include "nvrm/event.h"
+#include "nvrm/fifo.h"
 
 #include <linux/acpi.h>
 #include <linux/ctype.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
index 16c1928f6d68..05d0916d199e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
@@ -25,8 +25,7 @@
 #include <subdev/gsp.h>
 #include <engine/fifo.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include "nvrm/nvdec.h"
 
 struct r535_nvdec_obj {
 	struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
index b6808a50c4a8..dcf80d1f1e9e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
@@ -25,8 +25,7 @@
 #include <subdev/gsp.h>
 #include <engine/fifo.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include "nvrm/nvenc.h"
 
 struct r535_nvenc_obj {
 	struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
index 994232b3d030..8a8d7becba93 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
@@ -25,8 +25,7 @@
 #include <subdev/gsp.h>
 #include <engine/fifo.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include "nvrm/nvjpg.h"
 
 struct r535_nvjpg_obj {
 	struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/alloc.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/alloc.h
new file mode 100644
index 000000000000..cbc7e611fbda
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/alloc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_ALLOC_H__
+#define __NVRM_ALLOC_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct rpc_gsp_rm_alloc_v03_00
+{
+    NvHandle   hClient;
+    NvHandle   hParent;
+    NvHandle   hObject;
+    NvU32      hClass;
+    NvU32      status;
+    NvU32      paramsSize;
+    NvU32      flags;
+    NvU8       reserved[4];
+    NvU8       params[];
+} rpc_gsp_rm_alloc_v03_00;
+
+typedef struct NVOS00_PARAMETERS_v03_00
+{
+    NvHandle   hRoot;
+    NvHandle   hObjectParent;
+    NvHandle   hObjectOld;
+    NvV32      status;
+} NVOS00_PARAMETERS_v03_00;
+
+typedef struct rpc_free_v03_00
+{
+    NVOS00_PARAMETERS_v03_00 params;
+} rpc_free_v03_00;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/bar.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/bar.h
new file mode 100644
index 000000000000..60b0b08491ee
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/bar.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_BAR_H__
+#define __NVRM_BAR_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef enum
+{
+    NV_RPC_UPDATE_PDE_BAR_1,
+    NV_RPC_UPDATE_PDE_BAR_2,
+    NV_RPC_UPDATE_PDE_BAR_INVALID,
+} NV_RPC_UPDATE_PDE_BAR_TYPE;
+
+typedef struct UpdateBarPde_v15_00
+{
+    NV_RPC_UPDATE_PDE_BAR_TYPE barType;
+    NvU64      entryValue NV_ALIGN_BYTES(8);
+    NvU64      entryLevelShift NV_ALIGN_BYTES(8);
+} UpdateBarPde_v15_00;
+
+typedef struct rpc_update_bar_pde_v15_00
+{
+    UpdateBarPde_v15_00 info;
+} rpc_update_bar_pde_v15_00;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h
new file mode 100644
index 000000000000..90b0325203d2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_CE_H__
+#define __NVRM_CE_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct NVC0B5_ALLOCATION_PARAMETERS {
+    NvU32 version;
+    NvU32 engineType;
+} NVC0B5_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h
new file mode 100644
index 000000000000..df0e63c0cb6b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_CLIENT_H__
+#define __NVRM_CLIENT_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV01_ROOT        (0x0U) /* finn: Evaluated from "NV0000_ALLOC_PARAMETERS_MESSAGE_ID" */
+
+#define NV_PROC_NAME_MAX_LENGTH 100U
+
+typedef struct NV0000_ALLOC_PARAMETERS {
+    NvHandle hClient; /* CORERM-2934: hClient must remain the first member until all allocations use these params */
+    NvU32    processID;
+    char     processName[NV_PROC_NAME_MAX_LENGTH];
+} NV0000_ALLOC_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h
new file mode 100644
index 000000000000..77f10acd82c9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_CTRL_H__
+#define __NVRM_CTRL_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct rpc_gsp_rm_control_v03_00
+{
+    NvHandle   hClient;
+    NvHandle   hObject;
+    NvU32      cmd;
+    NvU32      status;
+    NvU32      paramsSize;
+    NvU32      flags;
+    NvU8       params[];
+} rpc_gsp_rm_control_v03_00;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h
new file mode 100644
index 000000000000..3933b9ad61ce
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_DEVICE_H__
+#define __NVRM_DEVICE_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV01_DEVICE_0      (0x80U) /* finn: Evaluated from "NV0080_ALLOC_PARAMETERS_MESSAGE_ID" */
+
+typedef struct NV0080_ALLOC_PARAMETERS {
+    NvU32    deviceId;
+    NvHandle hClientShare;
+    NvHandle hTargetClient;
+    NvHandle hTargetDevice;
+    NvV32    flags;
+    NV_DECLARE_ALIGNED(NvU64 vaSpaceSize, 8);
+    NV_DECLARE_ALIGNED(NvU64 vaStartInternal, 8);
+    NV_DECLARE_ALIGNED(NvU64 vaLimitInternal, 8);
+    NvV32    vaMode;
+} NV0080_ALLOC_PARAMETERS;
+
+#define NV20_SUBDEVICE_0      (0x2080U) /* finn: Evaluated from "NV2080_ALLOC_PARAMETERS_MESSAGE_ID" */
+
+typedef struct NV2080_ALLOC_PARAMETERS {
+    NvU32 subDeviceId;
+} NV2080_ALLOC_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/disp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/disp.h
new file mode 100644
index 000000000000..7b7539639540
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/disp.h
@@ -0,0 +1,741 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_DISP_H__
+#define __NVRM_DISP_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM (0x20800a49) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 instMemPhysAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 instMemSize, 8);
+    NvU32 instMemAddrSpace;
+    NvU32 instMemCpuCacheAttr;
+} NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS;
+
+#define NV_MEMORY_WRITECOMBINED      2
+
+#define NV04_DISPLAY_COMMON                      (0x00000073)
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO (0x20800a01) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS {
+    NvU32  feHwSysCap;
+    NvU32  windowPresentMask;
+    NvBool bFbRemapperEnabled;
+    NvU32  numHeads;
+    NvBool bPrimaryVga;
+    NvU32  i2cPort;
+    NvU32  internalDispActiveMask;
+} NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS;
+
+#define NV2080_CTRL_ACPI_DSM_READ_SIZE                   (0x1000) /* finn: Evaluated from "(4 * 1024)" */
+
+#define NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD (0x20800ac6) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS {
+    NvU32 status;
+    NvU16 backLightDataSize;
+    NvU8  backLightData[NV2080_CTRL_ACPI_DSM_READ_SIZE];
+} NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS;
+
+typedef struct NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS {
+    NvU32 subDeviceInstance;
+} NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT                    (0x731365U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_NUM_HEADS (0x730102U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 flags;
+    NvU32 numHeads;
+} NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_ALL_HEAD_MASK (0x730287U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 headMask;
+} NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED (0x730120U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayMask;
+    NvU32 displayMaskDDC;
+} NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS;
+
+#define NV0073_CTRL_MAX_CONNECTORS                    4U
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA   (0x730250U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 DDCPartners;
+    NvU32 count;
+    struct {
+        NvU32 index;
+        NvU32 type;
+        NvU32 location;
+    } data[NV0073_CTRL_MAX_CONNECTORS];
+    NvU32 platform;
+} NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO (0x73028bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  index;
+    NvU32  type;
+    NvU32  protocol;
+    NvU32  ditherType;
+    NvU32  ditherAlgo;
+    NvU32  location;
+    NvU32  rootPortId;
+    NvU32  dcbIndex;
+    NV_DECLARE_ALIGNED(NvU64 vbiosAddress, 8);
+    NvBool bIsLitByVbios;
+    NvBool bIsDispDynamic;
+} NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS;
+
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_NONE                   (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_DAC                    (0x00000001U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_SOR                    (0x00000002U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_PIOR                   (0x00000003U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_DSI                    (0x00000005U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DAC_RGB_CRT        (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_LVDS_CUSTOM    (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A  (0x00000001U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B  (0x00000002U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS      (0x00000005U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A           (0x00000008U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B           (0x00000009U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DSI            (0x00000010U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DSI                (0x00000011U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_PIOR_EXT_TMDS_ENC  (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_UNKNOWN            (0xFFFFFFFFU)
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DSC_CAP_PARAMS {
+    NvBool bDscSupported;
+    NvU32  encoderColorFormatMask;
+    NvU32  lineBufferSizeKB;
+    NvU32  rateBufferSizeKB;
+    NvU32  bitsPerPixelPrecision;
+    NvU32  maxNumHztSlices;
+    NvU32  lineBufferBitDepth;
+} NV0073_CTRL_CMD_DSC_CAP_PARAMS;
+
+typedef struct NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS {
+    NvU32                          subDeviceInstance;
+    NvU32                          sorIndex;
+    NvU32                          maxLinkRate;
+    NvU32                          dpVersionsSupported;
+    NvU32                          UHBRSupported;
+    NvBool                         bIsMultistreamSupported;
+    NvBool                         bIsSCEnabled;
+    NvBool                         bHasIncreasedWatermarkLimits;
+    NvBool                         bIsPC2Disabled;
+    NvBool                         isSingleHeadMSTSupported;
+    NvBool                         bFECSupported;
+    NvBool                         bIsTrainPhyRepeater;
+    NvBool                         bOverrideLinkBw;
+    NV0073_CTRL_CMD_DSC_CAP_PARAMS DSC;
+} NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
+#define NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID (0x69U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2                0:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4                1:1
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE                           2:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_NONE                          (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62                          (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70                          (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40                          (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10                          (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_RGB                (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_444        (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_422 (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_420 (0x00000008U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_16           (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_8            (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_4            (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_2            (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1              (0x00000005U)
+
+#define NV2080_NOTIFIERS_HOTPLUG                                   (1)
+
+typedef struct {
+    NvU32 plugDisplayMask;
+    NvU32 unplugDisplayMask;
+} Nv2080HotplugNotification;
+
+#define NV2080_NOTIFIERS_DP_IRQ                                    (7)
+
+typedef struct Nv2080DpIrqNotificationRec {
+    NvU32 displayId;
+} Nv2080DpIrqNotification;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE (0x730122U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 flags;
+    NvU32 displayMask;
+    NvU32 retryTimeMs;
+} NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS;
+
+#define NV0073_CTRL_CMD_DFP_GET_INFO (0x731140U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_GET_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DFP_GET_INFO_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 flags2;
+} NV0073_CTRL_DFP_GET_INFO_PARAMS;
+
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL                                       2:0
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_TMDS                       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_LVDS                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_SDI                        (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DISPLAYPORT                (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DSI                        (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_WRBK                       (0x00000005U)
+#define NV0073_CTRL_DFP_FLAGS_LANE                                         5:3
+#define NV0073_CTRL_DFP_FLAGS_LANE_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_QUAD                         (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_OCT                          (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT                                        6:6
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_DISABLE                     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_60HZ_RR                     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER                                   7:7
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_NORMAL                 (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_DISABLE                (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE                                 8:8
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE                        9:9
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_FALSE       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_TRUE        (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE                         10:10
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_FALSE          (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_TRUE           (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE                    11:11
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE                    12:12
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED                               14:14
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT                       15:15
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_FALSE        (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_TRUE         (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT                         16:16
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_NONE           (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_PREFER_RBR     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW                                 19:17
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_1_62GBPS               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_2_70GBPS               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_5_40GBPS               (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_8_10GBPS               (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LINK                                       21:20
+#define NV0073_CTRL_DFP_FLAGS_LINK_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID                           22:22
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_FALSE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_TRUE             (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID                              24:23
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_NONE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_A               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_B               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_GANGED          (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED                   25:25
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_FALSE    (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_TRUE     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_PHY_REPEATER_COUNT                      29:26
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE                        30:30
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_FALSE         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_TRUE          (0x00000001U)
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE                (0x730126U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 head;
+    NvU32 flags;
+    NvU32 displayId;
+} NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS;
+
+typedef NvU32 NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG;
+
+typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_INFO {
+    NvU32 displayMask;
+    NvU32 sorType;
+} NV0073_CTRL_DFP_ASSIGN_SOR_INFO;
+
+#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS  4U
+
+#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR           (0x731152U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS {
+    NvU32                                 subDeviceInstance;
+    NvU32                                 displayId;
+    NvU8                                  sorExcludeMask;
+    NvU32                                 slaveDisplayId;
+    NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG forceSublinkConfig;
+    NvBool                                bIs2Head1Or;
+    NvU32                                 sorAssignList[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
+    NV0073_CTRL_DFP_ASSIGN_SOR_INFO       sorAssignListWithTag[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
+    NvU8                                  reservedSorMask;
+    NvU32                                 flags;
+} NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS;
+
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO                                      0:0
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_OPTIMAL                    (0x00000001U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_DEFAULT                    (0x00000000U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE               1:1
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_NO  (0x00000000U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_YES (0x00000001U)
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS (0x730292U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS (0x730291U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  brightness;
+    NvBool bUncalibrated;
+} NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS;
+
+#define NV0073_CTRL_CMD_DFP_SET_ELD_AUDIO_CAPS                         (0x731144U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER                      96U
+
+typedef struct NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 numELDSize;
+    NvU8  bufferELD[NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER];
+    NvU32 maxFreqSupported;
+    NvU32 ctrl;
+    NvU32 deviceEntry;
+} NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS;
+
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD                                     0:0
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_FALSE              (0x00000000U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_TRUE               (0x00000001U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV                                   1:1
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_FALSE            (0x00000000U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_TRUE             (0x00000001U)
+
+#define NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES 2048U
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_EDID_V2         (0x730245U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 bufferSize;
+    NvU32 flags;
+    NvU8  edidBuffer[NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES];
+} NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_ENABLE (0x730273U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS {
+    NvU8  subDeviceInstance;
+    NvU32 displayId;
+    NvU8  enable;
+} NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS (0x730293U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 caps;
+} NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS (0x730293U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS_MESSAGE_ID" */
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED                           0:0
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_FALSE       (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_TRUE        (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED                     1:1
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_FALSE (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_TRUE  (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED                                      2:2
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_FALSE                  (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_TRUE                   (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED                              5:3
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_NONE           (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_3G      (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_6G      (0x00000002U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_6G      (0x00000003U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_8G      (0x00000004U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_10G     (0x00000005U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_12G     (0x00000006U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED                                    6:6
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_FALSE                (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_TRUE                 (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED                          9:7
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_NONE       (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_3G  (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_6G  (0x00000002U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_6G  (0x00000003U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_8G  (0x00000004U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_10G (0x00000005U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_12G (0x00000006U)
+
+#define NV0073_CTRL_SET_OD_MAX_PACKET_SIZE     36U
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_OD_PACKET (0x730288U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  transmitControl;
+    NvU32  packetSize;
+    NvU32  targetHead;
+    NvBool bUsePsrHeadforSdp;
+    NvU8   aPacket[NV0073_CTRL_SET_OD_MAX_PACKET_SIZE];
+} NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS;
+
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE                                     0:0
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_NO                      (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_YES                     (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME                                1:1
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_DISABLE            (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_ENABLE             (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME                               2:2
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_DISABLE           (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_ENABLE            (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK                                 3:3
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_DISABLE              (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_ENABLE               (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE                                  4:4
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_DISABLE              (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_ENABLE               (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT                                  5:5
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_SW_CONTROLLED        (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_HW_CONTROLLED        (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY                        6:6
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_FALSE      (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_TRUE       (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING                   7:7
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_FALSE (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_TRUE  (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE                         9:8
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME0  (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME1  (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE                     31:31
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_NO        (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_YES       (0x0000001U)
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM (0x730275U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS {
+    NvU8  subDeviceInstance;
+    NvU32 displayId;
+    NvU8  mute;
+} NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS;
+
+#define NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE 16U
+
+#define NV0073_CTRL_CMD_DP_AUXCH_CTRL      (0x731341U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_AUXCH_CTRL_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DP_AUXCH_CTRL_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvBool bAddrOnly;
+    NvU32  cmd;
+    NvU32  addr;
+    NvU8   data[NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE];
+    NvU32  size;
+    NvU32  replyType;
+    NvU32  retryTimeMs;
+} NV0073_CTRL_DP_AUXCH_CTRL_PARAMS;
+
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE                          3:3
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_I2C               (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_AUX               (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT                       2:2
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_FALSE          (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_TRUE           (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE                      1:0
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE         (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_READ          (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE_STATUS  (0x00000002U)
+
+#define NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES (0x731377U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES        8U
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS {
+    // In
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU16 linkRateTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+
+    // Out
+    NvU8  linkBwTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+    NvU8  linkBwCount;
+} NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_CTRL                     (0x731343U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_CTRL_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 cmd;
+    NvU32 data;
+    NvU32 err;
+    NvU32 retryTimeMs;
+    NvU32 eightLaneDpcdBaseAddr;
+} NV0073_CTRL_DP_CTRL_PARAMS;
+
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT                           0:0
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_FALSE                         (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_TRUE                          (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW                              1:1
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW_FALSE                            (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW_TRUE                             (0x00000001U)
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD                       2:2
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_FALSE                     (0x00000000U)
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_TRUE                      (0x00000001U)
+#define NV0073_CTRL_DP_CMD_UNUSED                                   3:3
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE                          4:4
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_SINGLE_STREAM                (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_MULTI_STREAM                 (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING                       5:5
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_YES                       (0x00000001U)
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING                         6:6
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_NO                          (0x00000000U)
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_YES                         (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING                     7:7
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_FALSE                   (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_TRUE                    (0x00000001U)
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING                   8:8
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_DEFAULT               (0x00000000U)
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_FORCE                 (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING                      9:9
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_NO                       (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_YES                      (0x00000001U)
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED                10:10
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_NO                   (0x00000000U)
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_YES                  (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING                     12:11
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_DONOT_TOGGLE_TRANSMISSION (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_TOGGLE_TRANSMISSION_ON    (0x00000002U)
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER                     13:13
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_YES                       (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG                        14:14
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_FALSE                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_TRUE                         (0x00000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC                             15:15
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC_FALSE                             (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC_TRUE                              (0x00000001U)
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST                         29:29
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_NO                            (0x00000000U)
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_YES                           (0x00000001U)
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE              30:30
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_FALSE              (0x00000000U)
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_TRUE               (0x00000001U)
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG                    31:31
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_FALSE                    (0x00000000U)
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_TRUE                     (0x00000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE                                   3:0
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_BEGIN     (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHALLENGE (0x00000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHECK     (0x00000002U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_BEGIN      (0x00000003U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHALLENGE  (0x00000004U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHECK      (0x00000005U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_RESET_MONITOR            (0x00000006U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_INIT_PUBLIC_INFO         (0x00000007U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_GET_PUBLIC_INFO          (0x00000008U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_STATUS_CHECK             (0x00000009U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_OK                          (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_PENDING                     (0x80000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_READ_ERROR                  (0x80000002U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_WRITE_ERROR                 (0x80000003U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_DEVICE_ERROR                (0x80000004U)
+
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT                          4:0
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_0                            (0x00000000U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_1                            (0x00000001U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_2                            (0x00000002U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_4                            (0x00000004U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_8                            (0x00000008U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW                            15:8
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_1_62GBPS                        (0x00000006U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_16GBPS                        (0x00000008U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_43GBPS                        (0x00000009U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_70GBPS                        (0x0000000AU)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_3_24GBPS                        (0x0000000CU)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_4_32GBPS                        (0x00000010U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_5_40GBPS                        (0x00000014U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_8_10GBPS                        (0x0000001EU)
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING                  18:18
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_NO                     (0x00000000U)
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_YES                    (0x00000001U)
+#define NV0073_CTRL_DP_DATA_TARGET                                22:19
+#define NV0073_CTRL_DP_DATA_TARGET_SINK                                 (0x00000000U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_0                       (0x00000001U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_1                       (0x00000002U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_2                       (0x00000003U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_3                       (0x00000004U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_4                       (0x00000005U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_5                       (0x00000006U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_6                       (0x00000007U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_7                       (0x00000008U)
+
+#define NV0073_CTRL_CMD_DP_SET_LANE_DATA (0x731346U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_LANE_DATA_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_MAX_LANES                                           8U
+
+typedef struct NV0073_CTRL_DP_LANE_DATA_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 numLanes;
+    NvU32 data[NV0073_CTRL_MAX_LANES];
+} NV0073_CTRL_DP_LANE_DATA_PARAMS;
+
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS                   1:0
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_NONE    (0x00000000U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL1  (0x00000001U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL2  (0x00000002U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL3  (0x00000003U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT                  3:2
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL0 (0x00000000U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL1 (0x00000001U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL2 (0x00000002U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL3 (0x00000003U)
+
+#define NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID  (0x73135bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  preferredDisplayId;
+
+    NvBool force;
+    NvBool useBFM;
+
+    NvU32  displayIdAssigned;
+    NvU32  allDisplayMask;
+} NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID (0x73135cU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+} NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_CONFIG_STREAM                   (0x731362U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  head;
+    NvU32  sorIndex;
+    NvU32  dpLink;
+
+    NvBool bEnableOverride;
+    NvBool bMST;
+    NvU32  singleHeadMultistreamMode;
+    NvU32  hBlankSym;
+    NvU32  vBlankSym;
+    NvU32  colorFormat;
+    NvBool bEnableTwoHeadOneOr;
+
+    struct {
+        NvU32  slotStart;
+        NvU32  slotEnd;
+        NvU32  PBN;
+        NvU32  Timeslice;
+        NvBool sendACT;          // deprecated -Use NV0073_CTRL_CMD_DP_SEND_ACT
+        NvU32  singleHeadMSTPipeline;
+        NvBool bEnableAudioOverRightPanel;
+    } MST;
+
+    struct {
+        NvBool bEnhancedFraming;
+        NvU32  tuSize;
+        NvU32  waterMark;
+        NvU32  actualPclkHz;     // deprecated  -Use MvidWarParams
+        NvU32  linkClkFreqHz;    // deprecated  -Use MvidWarParams
+        NvBool bEnableAudioOverRightPanel;
+        struct {
+            NvU32  activeCnt;
+            NvU32  activeFrac;
+            NvU32  activePolarity;
+            NvBool mvidWarEnabled;
+            struct {
+                NvU32 actualPclkHz;
+                NvU32 linkClkFreqHz;
+            } MvidWarParams;
+        } Legacy;
+    } SST;
+} NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS;
+
+#define NV0073_CTRL_CMD_DFP_SET_AUDIO_ENABLE                (0x731150U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvBool enable;
+} NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_SET_AUDIO_MUTESTREAM      (0x731359U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 mute;
+} NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER (0x20800a58) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS {
+    NvU32  addressSpace;
+    NV_DECLARE_ALIGNED(NvU64 physicalAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NvU32  cacheSnoop;
+    NvU32  hclass;
+    NvU32  channelInstance;
+    NvBool valid;
+} NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS;
+
+#define ADDR_SYSMEM     (1)         // System memory (PCI)
+
+#define ADDR_FBMEM      2         // Frame buffer memory space
+
+typedef struct
+{
+    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
+                                         // All PIO channels have two instances (one per head).
+    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors.
+    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of control region for PIO channel
+} NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS;
+
+typedef struct
+{
+    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
+                                         // Note that core channel has only one instance
+                                         // while all others have two (one per head).
+    NvHandle hObjectBuffer;              // ctx dma handle for DMA push buffer
+    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors/notifications
+    NvU32    offset;                     // Initial offset for put/get, usually zero.
+    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of UDISP GET/PUT regs
+
+    NvU32    flags;
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB                1:1
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_YES            0x00000000
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_NO             0x00000001
+
+} NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h
new file mode 100644
index 000000000000..b26dfc8f8087
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h
@@ -0,0 +1,260 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_ENGINE_H__
+#define __NVRM_ENGINE_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define MC_ENGINE_IDX_NULL                          0 // This must be 0
+#define MC_ENGINE_IDX_TMR                           1
+#define MC_ENGINE_IDX_DISP                          2
+#define MC_ENGINE_IDX_FB                            3
+#define MC_ENGINE_IDX_FIFO                          4
+#define MC_ENGINE_IDX_VIDEO                         5
+#define MC_ENGINE_IDX_MD                            6
+#define MC_ENGINE_IDX_BUS                           7
+#define MC_ENGINE_IDX_PMGR                          8
+#define MC_ENGINE_IDX_VP2                           9
+#define MC_ENGINE_IDX_CIPHER                        10
+#define MC_ENGINE_IDX_BIF                           11
+#define MC_ENGINE_IDX_PPP                           12
+#define MC_ENGINE_IDX_PRIVRING                      13
+#define MC_ENGINE_IDX_PMU                           14
+#define MC_ENGINE_IDX_CE0                           15
+#define MC_ENGINE_IDX_CE1                           16
+#define MC_ENGINE_IDX_CE2                           17
+#define MC_ENGINE_IDX_CE3                           18
+#define MC_ENGINE_IDX_CE4                           19
+#define MC_ENGINE_IDX_CE5                           20
+#define MC_ENGINE_IDX_CE6                           21
+#define MC_ENGINE_IDX_CE7                           22
+#define MC_ENGINE_IDX_CE8                           23
+#define MC_ENGINE_IDX_CE9                           24
+#define MC_ENGINE_IDX_CE_MAX                        MC_ENGINE_IDX_CE9
+#define MC_ENGINE_IDX_VIC                           35
+#define MC_ENGINE_IDX_ISOHUB                        36
+#define MC_ENGINE_IDX_VGPU                          37
+#define MC_ENGINE_IDX_MSENC                         38
+#define MC_ENGINE_IDX_MSENC1                        39
+#define MC_ENGINE_IDX_MSENC2                        40
+#define MC_ENGINE_IDX_C2C                           41
+#define MC_ENGINE_IDX_LTC                           42
+#define MC_ENGINE_IDX_FBHUB                         43
+#define MC_ENGINE_IDX_HDACODEC                      44
+#define MC_ENGINE_IDX_GMMU                          45
+#define MC_ENGINE_IDX_SEC2                          46
+#define MC_ENGINE_IDX_FSP                           47
+#define MC_ENGINE_IDX_NVLINK                        48
+#define MC_ENGINE_IDX_GSP                           49
+#define MC_ENGINE_IDX_NVJPG                         50
+#define MC_ENGINE_IDX_NVJPEG                        MC_ENGINE_IDX_NVJPG
+#define MC_ENGINE_IDX_NVJPEG0                       MC_ENGINE_IDX_NVJPEG
+#define MC_ENGINE_IDX_NVJPEG1                       51
+#define MC_ENGINE_IDX_NVJPEG2                       52
+#define MC_ENGINE_IDX_NVJPEG3                       53
+#define MC_ENGINE_IDX_NVJPEG4                       54
+#define MC_ENGINE_IDX_NVJPEG5                       55
+#define MC_ENGINE_IDX_NVJPEG6                       56
+#define MC_ENGINE_IDX_NVJPEG7                       57
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT              58
+#define MC_ENGINE_IDX_ACCESS_CNTR                   59
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT          60
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT_ERROR        61
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT_ERROR    62
+#define MC_ENGINE_IDX_INFO_FAULT                    63
+#define MC_ENGINE_IDX_BSP                           64
+#define MC_ENGINE_IDX_NVDEC                         MC_ENGINE_IDX_BSP
+#define MC_ENGINE_IDX_NVDEC0                        MC_ENGINE_IDX_NVDEC
+#define MC_ENGINE_IDX_NVDEC1                        65
+#define MC_ENGINE_IDX_NVDEC2                        66
+#define MC_ENGINE_IDX_NVDEC3                        67
+#define MC_ENGINE_IDX_NVDEC4                        68
+#define MC_ENGINE_IDX_NVDEC5                        69
+#define MC_ENGINE_IDX_NVDEC6                        70
+#define MC_ENGINE_IDX_NVDEC7                        71
+#define MC_ENGINE_IDX_CPU_DOORBELL                  72
+#define MC_ENGINE_IDX_PRIV_DOORBELL                 73
+#define MC_ENGINE_IDX_MMU_ECC_ERROR                 74
+#define MC_ENGINE_IDX_BLG                           75
+#define MC_ENGINE_IDX_PERFMON                       76
+#define MC_ENGINE_IDX_BUF_RESET                     77
+#define MC_ENGINE_IDX_XBAR                          78
+#define MC_ENGINE_IDX_ZPW                           79
+#define MC_ENGINE_IDX_OFA0                          80
+#define MC_ENGINE_IDX_TEGRA                         81
+#define MC_ENGINE_IDX_GR                            82
+#define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
+#define MC_ENGINE_IDX_GR1                           83
+#define MC_ENGINE_IDX_GR2                           84
+#define MC_ENGINE_IDX_GR3                           85
+#define MC_ENGINE_IDX_GR4                           86
+#define MC_ENGINE_IDX_GR5                           87
+#define MC_ENGINE_IDX_GR6                           88
+#define MC_ENGINE_IDX_GR7                           89
+#define MC_ENGINE_IDX_ESCHED                        90
+#define MC_ENGINE_IDX_ESCHED__SIZE                  64
+#define MC_ENGINE_IDX_GR_FECS_LOG                   154
+#define MC_ENGINE_IDX_GR0_FECS_LOG                  MC_ENGINE_IDX_GR_FECS_LOG
+#define MC_ENGINE_IDX_GR1_FECS_LOG                  155
+#define MC_ENGINE_IDX_GR2_FECS_LOG                  156
+#define MC_ENGINE_IDX_GR3_FECS_LOG                  157
+#define MC_ENGINE_IDX_GR4_FECS_LOG                  158
+#define MC_ENGINE_IDX_GR5_FECS_LOG                  159
+#define MC_ENGINE_IDX_GR6_FECS_LOG                  160
+#define MC_ENGINE_IDX_GR7_FECS_LOG                  161
+#define MC_ENGINE_IDX_TMR_SWRL                      162
+#define MC_ENGINE_IDX_DISP_GSP                      163
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT_CPU          164
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT_CPU      165
+#define MC_ENGINE_IDX_PXUC                          166
+#define MC_ENGINE_IDX_MAX                           167 // This must be kept as the max bit if
+#define MC_ENGINE_IDX_INVALID                0xFFFFFFFF
+#define MC_ENGINE_IDX_GRn(x)            (MC_ENGINE_IDX_GR0 + (x))
+#define MC_ENGINE_IDX_GRn_FECS_LOG(x)   (MC_ENGINE_IDX_GR0_FECS_LOG + (x))
+#define MC_ENGINE_IDX_CE(x)             (MC_ENGINE_IDX_CE0 + (x))
+#define MC_ENGINE_IDX_MSENCn(x)         (MC_ENGINE_IDX_MSENC + (x))
+#define MC_ENGINE_IDX_NVDECn(x)         (MC_ENGINE_IDX_NVDEC + (x))
+#define MC_ENGINE_IDX_NVJPEGn(x)        (MC_ENGINE_IDX_NVJPEG + (x))
+#define MC_ENGINE_IDX_ESCHEDn(x)        (MC_ENGINE_IDX_ESCHED + (x))
+
+typedef enum
+{
+    RM_ENGINE_TYPE_NULL                 =       (0x00000000),
+    RM_ENGINE_TYPE_GR0                  =       (0x00000001),
+    RM_ENGINE_TYPE_GR1                  =       (0x00000002),
+    RM_ENGINE_TYPE_GR2                  =       (0x00000003),
+    RM_ENGINE_TYPE_GR3                  =       (0x00000004),
+    RM_ENGINE_TYPE_GR4                  =       (0x00000005),
+    RM_ENGINE_TYPE_GR5                  =       (0x00000006),
+    RM_ENGINE_TYPE_GR6                  =       (0x00000007),
+    RM_ENGINE_TYPE_GR7                  =       (0x00000008),
+    RM_ENGINE_TYPE_COPY0                =       (0x00000009),
+    RM_ENGINE_TYPE_COPY1                =       (0x0000000a),
+    RM_ENGINE_TYPE_COPY2                =       (0x0000000b),
+    RM_ENGINE_TYPE_COPY3                =       (0x0000000c),
+    RM_ENGINE_TYPE_COPY4                =       (0x0000000d),
+    RM_ENGINE_TYPE_COPY5                =       (0x0000000e),
+    RM_ENGINE_TYPE_COPY6                =       (0x0000000f),
+    RM_ENGINE_TYPE_COPY7                =       (0x00000010),
+    RM_ENGINE_TYPE_COPY8                =       (0x00000011),
+    RM_ENGINE_TYPE_COPY9                =       (0x00000012),
+    RM_ENGINE_TYPE_NVDEC0               =       (0x0000001d),
+    RM_ENGINE_TYPE_NVDEC1               =       (0x0000001e),
+    RM_ENGINE_TYPE_NVDEC2               =       (0x0000001f),
+    RM_ENGINE_TYPE_NVDEC3               =       (0x00000020),
+    RM_ENGINE_TYPE_NVDEC4               =       (0x00000021),
+    RM_ENGINE_TYPE_NVDEC5               =       (0x00000022),
+    RM_ENGINE_TYPE_NVDEC6               =       (0x00000023),
+    RM_ENGINE_TYPE_NVDEC7               =       (0x00000024),
+    RM_ENGINE_TYPE_NVENC0               =       (0x00000025),
+    RM_ENGINE_TYPE_NVENC1               =       (0x00000026),
+    RM_ENGINE_TYPE_NVENC2               =       (0x00000027),
+    RM_ENGINE_TYPE_VP                   =       (0x00000028),
+    RM_ENGINE_TYPE_ME                   =       (0x00000029),
+    RM_ENGINE_TYPE_PPP                  =       (0x0000002a),
+    RM_ENGINE_TYPE_MPEG                 =       (0x0000002b),
+    RM_ENGINE_TYPE_SW                   =       (0x0000002c),
+    RM_ENGINE_TYPE_TSEC                 =       (0x0000002d),
+    RM_ENGINE_TYPE_VIC                  =       (0x0000002e),
+    RM_ENGINE_TYPE_MP                   =       (0x0000002f),
+    RM_ENGINE_TYPE_SEC2                 =       (0x00000030),
+    RM_ENGINE_TYPE_HOST                 =       (0x00000031),
+    RM_ENGINE_TYPE_DPU                  =       (0x00000032),
+    RM_ENGINE_TYPE_PMU                  =       (0x00000033),
+    RM_ENGINE_TYPE_FBFLCN               =       (0x00000034),
+    RM_ENGINE_TYPE_NVJPEG0              =       (0x00000035),
+    RM_ENGINE_TYPE_NVJPEG1              =       (0x00000036),
+    RM_ENGINE_TYPE_NVJPEG2              =       (0x00000037),
+    RM_ENGINE_TYPE_NVJPEG3              =       (0x00000038),
+    RM_ENGINE_TYPE_NVJPEG4              =       (0x00000039),
+    RM_ENGINE_TYPE_NVJPEG5              =       (0x0000003a),
+    RM_ENGINE_TYPE_NVJPEG6              =       (0x0000003b),
+    RM_ENGINE_TYPE_NVJPEG7              =       (0x0000003c),
+    RM_ENGINE_TYPE_OFA                  =       (0x0000003d),
+    RM_ENGINE_TYPE_LAST                 =       (0x0000003e),
+} RM_ENGINE_TYPE;
+
+#define NV2080_ENGINE_TYPE_NULL                       (0x00000000)
+#define NV2080_ENGINE_TYPE_GRAPHICS                   (0x00000001)
+#define NV2080_ENGINE_TYPE_GR0                        NV2080_ENGINE_TYPE_GRAPHICS
+#define NV2080_ENGINE_TYPE_GR1                        (0x00000002)
+#define NV2080_ENGINE_TYPE_GR2                        (0x00000003)
+#define NV2080_ENGINE_TYPE_GR3                        (0x00000004)
+#define NV2080_ENGINE_TYPE_GR4                        (0x00000005)
+#define NV2080_ENGINE_TYPE_GR5                        (0x00000006)
+#define NV2080_ENGINE_TYPE_GR6                        (0x00000007)
+#define NV2080_ENGINE_TYPE_GR7                        (0x00000008)
+#define NV2080_ENGINE_TYPE_COPY0                      (0x00000009)
+#define NV2080_ENGINE_TYPE_COPY1                      (0x0000000a)
+#define NV2080_ENGINE_TYPE_COPY2                      (0x0000000b)
+#define NV2080_ENGINE_TYPE_COPY3                      (0x0000000c)
+#define NV2080_ENGINE_TYPE_COPY4                      (0x0000000d)
+#define NV2080_ENGINE_TYPE_COPY5                      (0x0000000e)
+#define NV2080_ENGINE_TYPE_COPY6                      (0x0000000f)
+#define NV2080_ENGINE_TYPE_COPY7                      (0x00000010)
+#define NV2080_ENGINE_TYPE_COPY8                      (0x00000011)
+#define NV2080_ENGINE_TYPE_COPY9                      (0x00000012)
+#define NV2080_ENGINE_TYPE_BSP                        (0x00000013)
+#define NV2080_ENGINE_TYPE_NVDEC0                     NV2080_ENGINE_TYPE_BSP
+#define NV2080_ENGINE_TYPE_NVDEC1                     (0x00000014)
+#define NV2080_ENGINE_TYPE_NVDEC2                     (0x00000015)
+#define NV2080_ENGINE_TYPE_NVDEC3                     (0x00000016)
+#define NV2080_ENGINE_TYPE_NVDEC4                     (0x00000017)
+#define NV2080_ENGINE_TYPE_NVDEC5                     (0x00000018)
+#define NV2080_ENGINE_TYPE_NVDEC6                     (0x00000019)
+#define NV2080_ENGINE_TYPE_NVDEC7                     (0x0000001a)
+#define NV2080_ENGINE_TYPE_MSENC                      (0x0000001b)
+#define NV2080_ENGINE_TYPE_NVENC0                      NV2080_ENGINE_TYPE_MSENC  /* Mutually exclusive alias */
+#define NV2080_ENGINE_TYPE_NVENC1                     (0x0000001c)
+#define NV2080_ENGINE_TYPE_NVENC2                     (0x0000001d)
+#define NV2080_ENGINE_TYPE_VP                         (0x0000001e)
+#define NV2080_ENGINE_TYPE_ME                         (0x0000001f)
+#define NV2080_ENGINE_TYPE_PPP                        (0x00000020)
+#define NV2080_ENGINE_TYPE_MPEG                       (0x00000021)
+#define NV2080_ENGINE_TYPE_SW                         (0x00000022)
+#define NV2080_ENGINE_TYPE_CIPHER                     (0x00000023)
+#define NV2080_ENGINE_TYPE_TSEC                       NV2080_ENGINE_TYPE_CIPHER
+#define NV2080_ENGINE_TYPE_VIC                        (0x00000024)
+#define NV2080_ENGINE_TYPE_MP                         (0x00000025)
+#define NV2080_ENGINE_TYPE_SEC2                       (0x00000026)
+#define NV2080_ENGINE_TYPE_HOST                       (0x00000027)
+#define NV2080_ENGINE_TYPE_DPU                        (0x00000028)
+#define NV2080_ENGINE_TYPE_PMU                        (0x00000029)
+#define NV2080_ENGINE_TYPE_FBFLCN                     (0x0000002a)
+#define NV2080_ENGINE_TYPE_NVJPG                      (0x0000002b)
+#define NV2080_ENGINE_TYPE_NVJPEG0                     NV2080_ENGINE_TYPE_NVJPG
+#define NV2080_ENGINE_TYPE_NVJPEG1                    (0x0000002c)
+#define NV2080_ENGINE_TYPE_NVJPEG2                    (0x0000002d)
+#define NV2080_ENGINE_TYPE_NVJPEG3                    (0x0000002e)
+#define NV2080_ENGINE_TYPE_NVJPEG4                    (0x0000002f)
+#define NV2080_ENGINE_TYPE_NVJPEG5                    (0x00000030)
+#define NV2080_ENGINE_TYPE_NVJPEG6                    (0x00000031)
+#define NV2080_ENGINE_TYPE_NVJPEG7                    (0x00000032)
+#define NV2080_ENGINE_TYPE_OFA                        (0x00000033)
+#define NV2080_ENGINE_TYPE_LAST                       (0x0000003e)
+#define NV2080_ENGINE_TYPE_ALLENGINES                 (0xffffffff)
+#define NV2080_ENGINE_TYPE_COPY_SIZE 10
+#define NV2080_ENGINE_TYPE_NVENC_SIZE 3
+#define NV2080_ENGINE_TYPE_NVJPEG_SIZE 8
+#define NV2080_ENGINE_TYPE_NVDEC_SIZE 8
+#define NV2080_ENGINE_TYPE_GR_SIZE 8
+#define NV2080_ENGINE_TYPE_COPY(i)     (NV2080_ENGINE_TYPE_COPY0+(i))
+#define NV2080_ENGINE_TYPE_IS_COPY(i)  (((i) >= NV2080_ENGINE_TYPE_COPY0) && ((i) <= NV2080_ENGINE_TYPE_COPY9))
+#define NV2080_ENGINE_TYPE_COPY_IDX(i) ((i) - NV2080_ENGINE_TYPE_COPY0)
+#define NV2080_ENGINE_TYPE_NVENC(i)    (NV2080_ENGINE_TYPE_NVENC0+(i))
+#define NV2080_ENGINE_TYPE_IS_NVENC(i)  (((i) >= NV2080_ENGINE_TYPE_NVENC0) && ((i) < NV2080_ENGINE_TYPE_NVENC(NV2080_ENGINE_TYPE_NVENC_SIZE)))
+#define NV2080_ENGINE_TYPE_NVENC_IDX(i) ((i) - NV2080_ENGINE_TYPE_NVENC0)
+#define NV2080_ENGINE_TYPE_NVDEC(i)    (NV2080_ENGINE_TYPE_NVDEC0+(i))
+#define NV2080_ENGINE_TYPE_IS_NVDEC(i)  (((i) >= NV2080_ENGINE_TYPE_NVDEC0) && ((i) < NV2080_ENGINE_TYPE_NVDEC(NV2080_ENGINE_TYPE_NVDEC_SIZE)))
+#define NV2080_ENGINE_TYPE_NVDEC_IDX(i) ((i) - NV2080_ENGINE_TYPE_NVDEC0)
+#define NV2080_ENGINE_TYPE_NVJPEG(i)    (NV2080_ENGINE_TYPE_NVJPEG0+(i))
+#define NV2080_ENGINE_TYPE_IS_NVJPEG(i)  (((i) >= NV2080_ENGINE_TYPE_NVJPEG0) && ((i) < NV2080_ENGINE_TYPE_NVJPEG(NV2080_ENGINE_TYPE_NVJPEG_SIZE)))
+#define NV2080_ENGINE_TYPE_NVJPEG_IDX(i) ((i) - NV2080_ENGINE_TYPE_NVJPEG0)
+#define NV2080_ENGINE_TYPE_GR(i)       (NV2080_ENGINE_TYPE_GR0 + (i))
+#define NV2080_ENGINE_TYPE_IS_GR(i)    (((i) >= NV2080_ENGINE_TYPE_GR0) && ((i) < NV2080_ENGINE_TYPE_GR(NV2080_ENGINE_TYPE_GR_SIZE)))
+#define NV2080_ENGINE_TYPE_GR_IDX(i)   ((i) - NV2080_ENGINE_TYPE_GR0)
+#define NV2080_ENGINE_TYPE_IS_VALID(i) (((i) > (NV2080_ENGINE_TYPE_NULL)) && ((i) < (NV2080_ENGINE_TYPE_LAST)))
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/event.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/event.h
new file mode 100644
index 000000000000..057f7220c225
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/event.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_EVENT_H__
+#define __NVRM_EVENT_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV01_EVENT_KERNEL_CALLBACK_EX            (0x0000007e)
+
+typedef struct NV0005_ALLOC_PARAMETERS {
+    NvHandle hParentClient;
+    NvHandle hSrcResource;
+
+    NvV32    hClass;
+    NvV32    notifyIndex;
+    NV_DECLARE_ALIGNED(NvP64 data, 8);
+} NV0005_ALLOC_PARAMETERS;
+
+#define NV01_EVENT_CLIENT_RM                                       (0x04000000)
+
+#define NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION (0x20800301) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_EVENT_INTERFACE_ID << 8) | NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS {
+    NvU32  event;
+    NvU32  action;
+    NvBool bNotifyState;
+    NvU32  info32;
+    NvU16  info16;
+} NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS;
+
+#define NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT  (0x00000002)
+
+typedef struct rpc_post_event_v17_00
+{
+    NvHandle   hClient;
+    NvHandle   hEvent;
+    NvU32      notifyIndex;
+    NvU32      data;
+    NvU16      info16;
+    NvU32      status;
+    NvU32      eventDataSize;
+    NvBool     bNotifyList;
+    NvU8       eventData[];
+} rpc_post_event_v17_00;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h
new file mode 100644
index 000000000000..28786ef013a2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_FBSR_H__
+#define __NVRM_FBSR_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV01_MEMORY_LIST_FBMEM  (0x00000082)
+
+#define NV01_MEMORY_LIST_SYSTEM (0x00000081)
+
+#define NVOS02_FLAGS_PHYSICALITY                                   7:4
+#define NVOS02_FLAGS_PHYSICALITY_CONTIGUOUS                        (0x00000000)
+#define NVOS02_FLAGS_PHYSICALITY_NONCONTIGUOUS                     (0x00000001)
+#define NVOS02_FLAGS_LOCATION                                      11:8
+#define NVOS02_FLAGS_LOCATION_PCI                                  (0x00000000)
+#define NVOS02_FLAGS_LOCATION_AGP                                  (0x00000001)
+#define NVOS02_FLAGS_LOCATION_VIDMEM                               (0x00000002)
+#define NVOS02_FLAGS_COHERENCY                                     15:12
+#define NVOS02_FLAGS_COHERENCY_UNCACHED                            (0x00000000)
+#define NVOS02_FLAGS_COHERENCY_CACHED                              (0x00000001)
+#define NVOS02_FLAGS_COHERENCY_WRITE_COMBINE                       (0x00000002)
+#define NVOS02_FLAGS_COHERENCY_WRITE_THROUGH                       (0x00000003)
+#define NVOS02_FLAGS_COHERENCY_WRITE_PROTECT                       (0x00000004)
+#define NVOS02_FLAGS_COHERENCY_WRITE_BACK                          (0x00000005)
+#define NVOS02_FLAGS_ALLOC                                         17:16
+#define NVOS02_FLAGS_ALLOC_NONE                                    (0x00000001)
+#define NVOS02_FLAGS_GPU_CACHEABLE                                 18:18
+#define NVOS02_FLAGS_GPU_CACHEABLE_NO                              (0x00000000)
+#define NVOS02_FLAGS_GPU_CACHEABLE_YES                             (0x00000001)
+#define NVOS02_FLAGS_KERNEL_MAPPING                                19:19
+#define NVOS02_FLAGS_KERNEL_MAPPING_NO_MAP                         (0x00000000)
+#define NVOS02_FLAGS_KERNEL_MAPPING_MAP                            (0x00000001)
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY                            20:20
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_NO                         (0x00000000)
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_YES                        (0x00000001)
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY                          21:21
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_NO                       (0x00000000)
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_YES                      (0x00000001)
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY                        22:22
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_NO                     (0x00000000)
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_YES                    (0x00000001)
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE                             23:23
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_DEFAULT                     (0x00000000)
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_REQUIRED                    (0x00000001)
+#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT                          24:24
+#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT_APERTURE                 (0x00000001)
+#define NVOS02_FLAGS_MEMORY_PROTECTION                             26:25
+#define NVOS02_FLAGS_MEMORY_PROTECTION_DEFAULT                     (0x00000000)
+#define NVOS02_FLAGS_MEMORY_PROTECTION_PROTECTED                   (0x00000001)
+#define NVOS02_FLAGS_MEMORY_PROTECTION_UNPROTECTED                 (0x00000002)
+#define NVOS02_FLAGS_MAPPING                                       31:30
+#define NVOS02_FLAGS_MAPPING_DEFAULT                               (0x00000000)
+#define NVOS02_FLAGS_MAPPING_NO_MAP                                (0x00000001)
+#define NVOS02_FLAGS_MAPPING_NEVER_MAP                             (0x00000002)
+
+struct pte_desc
+{
+    NvU32 idr:2;
+    NvU32 reserved1:14;
+    NvU32 length:16;
+    union {
+        NvU64 pte; // PTE when IDR==0; PDE when IDR > 0
+        NvU64 pde; // PTE when IDR==0; PDE when IDR > 0
+    } pte_pde[]  NV_ALIGN_BYTES(8); // PTE when IDR==0; PDE when IDR > 0
+};
+
+typedef struct rpc_alloc_memory_v13_01
+{
+    NvHandle   hClient;
+    NvHandle   hDevice;
+    NvHandle   hMemory;
+    NvU32      hClass;
+    NvU32      flags;
+    NvU32      pteAdjust;
+    NvU32      format;
+    NvU64      length NV_ALIGN_BYTES(8);
+    NvU32      pageCount;
+    struct pte_desc pteDesc;
+} rpc_alloc_memory_v13_01;
+
+#define FBSR_TYPE_DMA                                 4   // Copy using DMA. Fastest.
+
+#define NV2080_CTRL_CMD_INTERNAL_FBSR_INIT (0x20800ac2) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
+    NvU32    fbsrType;
+    NvU32    numRegions;
+    NvHandle hClient;
+    NvHandle hSysMem;
+    NV_DECLARE_ALIGNED(NvU64 gspFbAllocsSysOffset, 8);
+    NvBool   bEnteringGcoffState;
+} NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_FBSR_SEND_REGION_INFO (0x20800ac3) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS {
+    NvU32    fbsrType;
+    NvHandle hClient;
+    NvHandle hVidMem;
+    NV_DECLARE_ALIGNED(NvU64 vidOffset, 8);
+    NV_DECLARE_ALIGNED(NvU64 sysOffset, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+} NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fifo.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fifo.h
new file mode 100644
index 000000000000..325fdd8b6090
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fifo.h
@@ -0,0 +1,350 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_FIFO_H__
+#define __NVRM_FIFO_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES         32
+
+#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES   16
+
+#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA    2
+
+#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN 16
+
+typedef struct NV2080_CTRL_FIFO_DEVICE_ENTRY {
+    NvU32 engineData[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES];
+    NvU32 pbdmaIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
+    NvU32 pbdmaFaultIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
+    NvU32 numPbdmas;
+    char  engineName[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN];
+} NV2080_CTRL_FIFO_DEVICE_ENTRY;
+
+#define NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE                 (0x20801112) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_FIFO_INTERFACE_ID << 8) | NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS {
+    NvU32                         baseIndex;
+    NvU32                         numEntries;
+    NvBool                        bMore;
+    // C form: NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
+    NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
+} NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS;
+
+typedef enum
+{
+    /* *************************************************************************
+     * Bug 3820969
+     * THINK BEFORE CHANGING ENUM ORDER HERE.
+     * VGPU-guest uses this same ordering. Because this enum is not versioned,
+     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
+     * ************************************************************************/
+
+    // *ENG_XYZ, e.g.: ENG_GR, ENG_CE etc.,
+    ENGINE_INFO_TYPE_ENG_DESC = 0,
+
+    // HW engine ID
+    ENGINE_INFO_TYPE_FIFO_TAG,
+
+    // RM_ENGINE_TYPE_*
+    ENGINE_INFO_TYPE_RM_ENGINE_TYPE,
+
+    //
+    // runlist id (meaning varies by GPU)
+    // Valid only for Esched-driven engines
+    //
+    ENGINE_INFO_TYPE_RUNLIST,
+
+    // NV_PFIFO_INTR_MMU_FAULT_ENG_ID_*
+    ENGINE_INFO_TYPE_MMU_FAULT_ID,
+
+    // ROBUST_CHANNEL_*
+    ENGINE_INFO_TYPE_RC_MASK,
+
+    // Reset Bit Position. On Ampere, only valid if not _INVALID
+    ENGINE_INFO_TYPE_RESET,
+
+    // Interrupt Bit Position
+    ENGINE_INFO_TYPE_INTR,
+
+    // log2(MC_ENGINE_*)
+    ENGINE_INFO_TYPE_MC,
+
+    // The DEV_TYPE_ENUM for this engine
+    ENGINE_INFO_TYPE_DEV_TYPE_ENUM,
+
+    // The particular instance of this engine type
+    ENGINE_INFO_TYPE_INSTANCE_ID,
+
+    //
+    // The base address for this engine's NV_RUNLIST. Valid only on Ampere+
+    // Valid only for Esched-driven engines
+    //
+    ENGINE_INFO_TYPE_RUNLIST_PRI_BASE,
+
+    //
+    // If this entry is a host-driven engine.
+    // Update _isEngineInfoTypeValidForOnlyHostDriven when adding any new entry.
+    //
+    ENGINE_INFO_TYPE_IS_HOST_DRIVEN_ENGINE,
+
+    //
+    // The index into the per-engine NV_RUNLIST registers. Valid only on Ampere+
+    // Valid only for Esched-driven engines
+    //
+    ENGINE_INFO_TYPE_RUNLIST_ENGINE_ID,
+
+    //
+    // The base address for this engine's NV_CHRAM registers. Valid only on
+    // Ampere+
+    //
+    // Valid only for Esched-driven engines
+    //
+    ENGINE_INFO_TYPE_CHRAM_PRI_BASE,
+
+    // This entry added to copy data at RMCTRL_EXPORT() call for Kernel RM
+    ENGINE_INFO_TYPE_KERNEL_RM_MAX,
+    // Used for iterating the engine info table by the index passed.
+    ENGINE_INFO_TYPE_INVALID = ENGINE_INFO_TYPE_KERNEL_RM_MAX,
+
+    // Size of FIFO_ENGINE_LIST.engineData
+    ENGINE_INFO_TYPE_ENGINE_DATA_ARRAY_SIZE = ENGINE_INFO_TYPE_INVALID,
+
+    // Input-only parameter for kfifoEngineInfoXlate.
+    ENGINE_INFO_TYPE_PBDMA_ID
+
+    /* *************************************************************************
+     * Bug 3820969
+     * THINK BEFORE CHANGING ENUM ORDER HERE.
+     * VGPU-guest uses this same ordering. Because this enum is not versioned,
+     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
+     * ************************************************************************/
+} ENGINE_INFO_TYPE;
+
+#define NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE (0x20802a08) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_CE_INTERFACE_ID << 8) | NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS {
+    NvU32 size;
+} NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS     0x40
+
+typedef struct NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO {
+    NvU32 engDesc;
+    NvU32 ctxAttr;
+    NvU32 ctxBufferSize;
+    NvU32 addrSpaceList;
+    NvU32 registerBase;
+} NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO;
+
+#define NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO (0x20800a42) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS {
+    NvU32                                        numConstructedFalcons;
+    NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO constructedFalconsTable[NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS];
+} NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS;
+
+#define NV_MAX_SUBDEVICES       8
+
+typedef struct NV_MEMORY_DESC_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 base, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+    NvU32 addressSpace;
+    NvU32 cacheAttrib;
+} NV_MEMORY_DESC_PARAMS;
+
+#define CC_CHAN_ALLOC_IV_SIZE_DWORD    3U
+
+#define CC_CHAN_ALLOC_NONCE_SIZE_DWORD 8U
+
+typedef struct NV_CHANNEL_ALLOC_PARAMS {
+
+    NvHandle hObjectError; // error context DMA
+    NvHandle hObjectBuffer; // no longer used
+    NV_DECLARE_ALIGNED(NvU64 gpFifoOffset, 8);    // offset to beginning of GP FIFO
+    NvU32    gpFifoEntries;    // number of GP FIFO entries
+
+    NvU32    flags;
+
+
+    NvHandle hContextShare; // context share handle
+    NvHandle hVASpace; // VASpace for the channel
+
+    // handle to UserD memory object for channel, ignored if hUserdMemory[0]=0
+    NvHandle hUserdMemory[NV_MAX_SUBDEVICES];
+
+    // offset to beginning of UserD within hUserdMemory[x]
+    NV_DECLARE_ALIGNED(NvU64 userdOffset[NV_MAX_SUBDEVICES], 8);
+
+    // engine type(NV2080_ENGINE_TYPE_*) with which this channel is associated
+    NvU32    engineType;
+    // Channel identifier that is unique for the duration of a RM session
+    NvU32    cid;
+    // One-hot encoded bitmask to match SET_SUBDEVICE_MASK methods
+    NvU32    subDeviceId;
+    NvHandle hObjectEccError; // ECC error context DMA
+
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS instanceMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS userdMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS ramfcMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS mthdbufMem, 8);
+
+    NvHandle hPhysChannelGroup;              // reserved
+    NvU32    internalFlags;                 // reserved
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS errorNotifierMem, 8); // reserved
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS eccErrorNotifierMem, 8); // reserved
+    NvU32    ProcessID;                 // reserved
+    NvU32    SubProcessID;                 // reserved
+
+    // IV used for CPU-side encryption / GPU-side decryption.
+    NvU32    encryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // IV used for CPU-side decryption / GPU-side encryption.
+    NvU32    decryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // Nonce used CPU-side signing / GPU-side signature verification.
+    NvU32    hmacNonce[CC_CHAN_ALLOC_NONCE_SIZE_DWORD];       // reserved
+} NV_CHANNEL_ALLOC_PARAMS;
+
+typedef NV_CHANNEL_ALLOC_PARAMS NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS;
+
+#define NVOS04_FLAGS_CHANNEL_TYPE                                  1:0
+#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL                         0x00000000
+#define NVOS04_FLAGS_CHANNEL_TYPE_VIRTUAL                          0x00000001  // OBSOLETE
+#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL_FOR_VIRTUAL             0x00000002  // OBSOLETE
+#define NVOS04_FLAGS_VPR                                           2:2
+#define NVOS04_FLAGS_VPR_FALSE                                     0x00000000
+#define NVOS04_FLAGS_VPR_TRUE                                      0x00000001
+#define NVOS04_FLAGS_CC_SECURE                                     2:2
+#define NVOS04_FLAGS_CC_SECURE_FALSE                               0x00000000
+#define NVOS04_FLAGS_CC_SECURE_TRUE                                0x00000001
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING                  3:3
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_FALSE            0x00000000
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_TRUE             0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE                       4:4
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_DEFAULT               0x00000000
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_ONE                   0x00000001
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL                           5:5
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_FALSE                     0x00000000
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_TRUE                      0x00000001
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING                     6:6
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_FALSE               0x00000000
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_TRUE                0x00000001
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE                7:7
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_FALSE          0x00000000
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_TRUE           0x00000001
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_VALUE                    10:8
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED                    11:11
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_FALSE              0x00000000
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_TRUE               0x00000001
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_VALUE               20:12
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED               21:21
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_FALSE         0x00000000
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_TRUE          0x00000001
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV                 22:22
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_FALSE           0x00000000
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_TRUE            0x00000001
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER                        23:23
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_FALSE                  0x00000000
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_TRUE                   0x00000001
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO                      24:24
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_FALSE                0x00000000
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_TRUE                 0x00000001
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL           25:25
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_FALSE     0x00000000
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_TRUE      0x00000001
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT                  26:26
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_FALSE            0x00000000
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_TRUE             0x00000001
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT                 27:27
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_FALSE           0x00000000
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_TRUE            0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD                          29:28
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_DEFAULT                  0x00000000
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_ONE                      0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_TWO                      0x00000002
+#define NVOS04_FLAGS_MAP_CHANNEL                                   30:30
+#define NVOS04_FLAGS_MAP_CHANNEL_FALSE                             0x00000000
+#define NVOS04_FLAGS_MAP_CHANNEL_TRUE                              0x00000001
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC                          31:31
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_FALSE                    0x00000000
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_TRUE                     0x00000001
+
+typedef enum {
+    /*!
+     * Initial state as passed in NV_CHANNEL_ALLOC_PARAMS by
+     * kernel CPU-RM clients.
+     */
+    ERROR_NOTIFIER_TYPE_UNKNOWN = 0,
+    /*! @brief Error notifier is explicitly not set.
+     *
+     * The corresponding hErrorContext or hEccErrorContext must be
+     * NV01_NULL_OBJECT.
+     */
+    ERROR_NOTIFIER_TYPE_NONE,
+    /*! @brief Error notifier is a ContextDma */
+    ERROR_NOTIFIER_TYPE_CTXDMA,
+    /*! @brief Error notifier is a NvNotification array in sysmem/vidmem */
+    ERROR_NOTIFIER_TYPE_MEMORY
+} ErrorNotifierType;
+
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE                       1:0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_USER                  0x0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_ADMIN                 0x1
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_KERNEL                0x2
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE             3:2
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_UNKNOWN     ERROR_NOTIFIER_TYPE_UNKNOWN
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_NONE        ERROR_NOTIFIER_TYPE_NONE
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_CTXDMA      ERROR_NOTIFIER_TYPE_CTXDMA
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_MEMORY      ERROR_NOTIFIER_TYPE_MEMORY
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE         5:4
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_UNKNOWN ERROR_NOTIFIER_TYPE_UNKNOWN
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_NONE    ERROR_NOTIFIER_TYPE_NONE
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_CTXDMA  ERROR_NOTIFIER_TYPE_CTXDMA
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_MEMORY  ERROR_NOTIFIER_TYPE_MEMORY
+
+#define NVA06F_CTRL_CMD_BIND (0xa06f0104) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_BIND_PARAMS_MESSAGE_ID" */
+typedef struct NVA06F_CTRL_BIND_PARAMS {
+    NvU32 engineType;
+} NVA06F_CTRL_BIND_PARAMS;
+
+#define NVA06F_CTRL_CMD_GPFIFO_SCHEDULE (0xa06f0103) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS_MESSAGE_ID" */
+typedef struct NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS {
+    NvBool bEnable;
+    NvBool bSkipSubmit;
+} NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS;
+
+#define NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES                        16U
+
+typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY {
+    NV_DECLARE_ALIGNED(NvU64 gpuPhysAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 gpuVirtAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+    NvU32 physAttr;
+    NvU16 bufferId;
+    NvU8  bInitialize;
+    NvU8  bNonmapped;
+} NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY;
+
+#define NV2080_CTRL_CMD_GPU_PROMOTE_CTX                                    (0x2080012bU) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS {
+    NvU32    engineType;
+    NvHandle hClient;
+    NvU32    ChID;
+    NvHandle hChanClient;
+    NvHandle hObject;
+    NvHandle hVirtMemory;
+    NV_DECLARE_ALIGNED(NvU64 virtAddress, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+    NvU32    entryCount;
+    // C form: NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES];
+    NV_DECLARE_ALIGNED(NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES], 8);
+} NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS;
+
+typedef struct rpc_rc_triggered_v17_02
+{
+    NvU32      nv2080EngineType;
+    NvU32      chid;
+    NvU32      exceptType;
+    NvU32      scope;
+    NvU16      partitionAttributionId;
+} rpc_rc_triggered_v17_02;
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gr.h
similarity index 56%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gr.h
index 6acb3f73242d..82c5ec727bb4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gr.h
@@ -1,30 +1,31 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_GR_H__
+#define __NVRM_GR_H__
+#include <nvrm/nvtypes.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
 
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2006-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
+#define NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO (0x20800a32) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_INTERNAL_GR_MAX_ENGINES         8
+
+#define NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT 0x19
+
+typedef struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO {
+    NvU32 size;
+    NvU32 alignment;
+} NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO;
+
+typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO {
+    NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO engine[NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT];
+} NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO;
+
+typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS {
+    NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO engineContextBuffersInfo[NV2080_CTRL_INTERNAL_GR_MAX_ENGINES];
+} NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS;
 
 #define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID                          4:0
 #define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS                 (0x00000000)
@@ -54,4 +55,19 @@
 #define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PRIV_ACCESS_MAP (0x00000018)
 #define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT                    (0x00000019)
 
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN                         0U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PM                           1U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PATCH                        2U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_BUFFER_BUNDLE_CB             3U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PAGEPOOL                     4U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB                 5U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_RTV_CB_GLOBAL                6U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_POOL                    7U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_CTRL_BLK                8U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_FECS_EVENT                   9U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP              10U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP 11U
+#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GLOBAL_PRIV_ACCESS_MAP       12U
+
+#include "fifo.h"
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
new file mode 100644
index 000000000000..085a7dac0405
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
@@ -0,0 +1,817 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_GSP_H__
+#define __NVRM_GSP_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES 16U
+
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES   17U
+
+typedef NvBool NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES];
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    NV_DECLARE_ALIGNED(NvU64 base, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NV_DECLARE_ALIGNED(NvU64 reserved, 8);
+    NvU32                                                  performance;
+    NvBool                                                 supportCompressed;
+    NvBool                                                 supportISO;
+    NvBool                                                 bProtected;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG blackList;
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO;
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    NvU32 numFBRegions;
+    NV_DECLARE_ALIGNED(NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO fbRegion[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES], 8);
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
+
+#define NV0080_CTRL_GR_CAPS_TBL_SIZE            23
+
+#define NV2080_GPU_MAX_GID_LENGTH             (0x000000100ULL)
+
+typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    NvU32 index;
+    NvU32 flags;
+    NvU32 length;
+    NvU8  data[NV2080_GPU_MAX_GID_LENGTH];
+} NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
+    NvU32 gpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS {
+    NvU32 gpcId;
+    NvU32 tpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS {
+    NvU32 gpcId;
+    NvU32 zcullMask;
+} NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    NvU32 BoardID;
+    char  chipSKU[4];
+    char  chipSKUMod[2];
+    char  project[5];
+    char  projectSKU[5];
+    char  CDP[6];
+    char  projectSKUMod[2];
+    NvU32 businessCycle;
+} NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS;
+
+typedef enum
+{
+    COMPUTE_BRANDING_TYPE_NONE,
+    COMPUTE_BRANDING_TYPE_TESLA,
+} COMPUTE_BRANDING_TYPE;
+
+#define MAX_GPC_COUNT           32
+
+typedef struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    NvU32  totalVFs;
+    NvU32  firstVfOffset;
+    NvU32  vfFeatureMask;
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar0Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar1Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar2Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar0Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar1Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar2Size, 8);
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+    NvBool bSriovEnabled;
+    NvBool bSriovHeavyEnabled;
+    NvBool bEmulateVFBar0TlbInvalidationRegister;
+    NvBool bClientRmAllocatedCtxBuffer;
+} NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS;
+
+#include "engine.h"
+
+#define NVGPU_ENGINE_CAPS_MASK_BITS                32
+
+#define NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX           ((RM_ENGINE_TYPE_LAST-1)/NVGPU_ENGINE_CAPS_MASK_BITS + 1)
+
+typedef struct GspSMInfo_t
+{
+    NvU32 version;
+    NvU32 regBankCount;
+    NvU32 regBankRegCount;
+    NvU32 maxWarpsPerSM;
+    NvU32 maxThreadsPerWarp;
+    NvU32 geomGsObufEntries;
+    NvU32 geomXbufEntries;
+    NvU32 maxSPPerSM;
+    NvU32 rtCoreCount;
+} GspSMInfo;
+
+typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_PAGEPOOL = 2,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_BETACB = 3,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_RTV = 4,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL = 5,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL = 6,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL_CPU = 7,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_END = 8,
+} NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS;
+
+#define NV2080_GPU_MAX_NAME_STRING_LENGTH                  (0x0000040U)
+
+typedef struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS 
+{
+    NvU32 numHeads;
+    NvU32 maxNumHeads;
+} VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS;
+
+typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS 
+{
+    NvU32 headIndex;
+    NvU32 maxHResolution;
+    NvU32 maxVResolution;
+} VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS;
+
+typedef struct GspStaticConfigInfo_t
+{
+    NvU8 grCapsBits[NV0080_CTRL_GR_CAPS_TBL_SIZE];
+    NV2080_CTRL_GPU_GET_GID_INFO_PARAMS gidInfo;
+    NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS gpcInfo;
+    NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS tpcInfo[MAX_GPC_COUNT];
+    NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS zcullInfo[MAX_GPC_COUNT];
+    NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS SKUInfo;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS fbRegionInfoParams;
+    COMPUTE_BRANDING_TYPE computeBranding;
+
+    NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS sriovCaps;
+    NvU32 sriovMaxGfid;
+
+    NvU32 engineCaps[NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX];
+
+    GspSMInfo SM_info;
+
+    NvBool poisonFuseEnabled;
+
+    NvU64 fb_length;
+    NvU32 fbio_mask;
+    NvU32 fb_bus_width;
+    NvU32 fb_ram_type;
+    NvU32 fbp_mask;
+    NvU32 l2_cache_size;
+
+    NvU32 gfxpBufferSize[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
+    NvU32 gfxpBufferAlignment[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
+
+    NvU8 gpuNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU8 gpuShortNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU16 gpuNameString_Unicode[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvBool bGpuInternalSku;
+    NvBool bIsQuadroGeneric;
+    NvBool bIsQuadroAd;
+    NvBool bIsNvidiaNvs;
+    NvBool bIsVgx;
+    NvBool bGeforceSmb;
+    NvBool bIsTitan;
+    NvBool bIsTesla;
+    NvBool bIsMobile;
+    NvBool bIsGc6Rtd3Allowed;
+    NvBool bIsGcOffRtd3Allowed;
+    NvBool bIsGcoffLegacyAllowed;
+
+    NvU64 bar1PdeBase;
+    NvU64 bar2PdeBase;
+
+    NvBool bVbiosValid;
+    NvU32 vbiosSubVendor;
+    NvU32 vbiosSubDevice;
+
+    NvBool bPageRetirementSupported;
+
+    NvBool bSplitVasBetweenServerClientRm;
+
+    NvBool bClRootportNeedsNosnoopWAR;
+
+    VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS displaylessMaxHeads;
+    VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS displaylessMaxResolution;
+    NvU64 displaylessMaxPixels;
+
+    // Client handle for internal RMAPI control.
+    NvHandle hInternalClient;
+
+    // Device handle for internal RMAPI control.
+    NvHandle hInternalDevice;
+
+    // Subdevice handle for internal RMAPI control.
+    NvHandle hInternalSubdevice;
+
+    NvBool bSelfHostedMode;
+    NvBool bAtsSupported;
+
+    NvBool bIsGpuUefi;
+} GspStaticConfigInfo;
+
+typedef struct rpc_unloading_guest_driver_v1F_07
+{
+    NvBool     bInPMTransition;
+    NvBool     bGc6Entering;
+    NvU32      newLevel;
+} rpc_unloading_guest_driver_v1F_07;
+
+typedef struct PACKED_REGISTRY_ENTRY
+{
+    NvU32                   nameOffset;
+    NvU8                    type;
+    NvU32                   data;
+    NvU32                   length;
+} PACKED_REGISTRY_ENTRY;
+
+typedef struct PACKED_REGISTRY_TABLE
+{
+    NvU32                   size;
+    NvU32                   numEntries;
+    PACKED_REGISTRY_ENTRY   entries[] __counted_by(numEntries);
+} PACKED_REGISTRY_TABLE;
+
+typedef struct
+{
+    NvU16               deviceID;           // deviceID
+    NvU16               vendorID;           // vendorID
+    NvU16               subdeviceID;        // subsystem deviceID
+    NvU16               subvendorID;        // subsystem vendorID
+    NvU8                revisionID;         // revision ID
+} BUSINFO;
+
+#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
+
+typedef struct DOD_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     acpiIdListLen;
+    NvU32     acpiIdList[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+} DOD_METHOD_DATA;
+
+typedef struct JT_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     jtCaps;
+    NvU16     jtRevId;
+    NvBool    bSBIOSCaps;
+} JT_METHOD_DATA;
+
+typedef struct MUX_METHOD_DATA_ELEMENT
+{
+    NvU32       acpiId;
+    NvU32       mode;
+    NV_STATUS   status;
+} MUX_METHOD_DATA_ELEMENT;
+
+#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
+
+typedef struct MUX_METHOD_DATA
+{
+    NvU32                       tableLen;
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxModeTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxPartTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+} MUX_METHOD_DATA;
+
+typedef struct CAPS_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     optimusCaps;
+} CAPS_METHOD_DATA;
+
+typedef struct ACPI_METHOD_DATA
+{
+    NvBool                                               bValid;
+    DOD_METHOD_DATA                                      dodMethodData;
+    JT_METHOD_DATA                                       jtMethodData;
+    MUX_METHOD_DATA                                      muxMethodData;
+    CAPS_METHOD_DATA                                     capsMethodData;
+} ACPI_METHOD_DATA;
+
+typedef struct GSP_VF_INFO
+{
+    NvU32  totalVFs;
+    NvU32  firstVFOffset;
+    NvU64  FirstVFBar0Address;
+    NvU64  FirstVFBar1Address;
+    NvU64  FirstVFBar2Address;
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+} GSP_VF_INFO;
+
+typedef struct GspSystemInfo
+{
+    NvU64 gpuPhysAddr;
+    NvU64 gpuPhysFbAddr;
+    NvU64 gpuPhysInstAddr;
+    NvU64 nvDomainBusDeviceFunc;
+    NvU64 simAccessBufPhysAddr;
+    NvU64 pcieAtomicsOpMask;
+    NvU64 consoleMemSize;
+    NvU64 maxUserVa;
+    NvU32 pciConfigMirrorBase;
+    NvU32 pciConfigMirrorSize;
+    NvU8 oorArch;
+    NvU64 clPdbProperties;
+    NvU32 Chipset;
+    NvBool bGpuBehindBridge;
+    NvBool bMnocAvailable;
+    NvBool bUpstreamL0sUnsupported;
+    NvBool bUpstreamL1Unsupported;
+    NvBool bUpstreamL1PorSupported;
+    NvBool bUpstreamL1PorMobileOnly;
+    NvU8   upstreamAddressValid;
+    BUSINFO FHBBusInfo;
+    BUSINFO chipsetIDInfo;
+    ACPI_METHOD_DATA acpiMethodData;
+    NvU32 hypervisorType;
+    NvBool bIsPassthru;
+    NvU64 sysTimerOffsetNs;
+    GSP_VF_INFO gspVFInfo;
+} GspSystemInfo;
+
+typedef struct rpc_os_error_log_v17_00
+{
+    NvU32      exceptType;
+    NvU32      runlistId;
+    NvU32      chid;
+    char       errString[0x100];
+} rpc_os_error_log_v17_00;
+
+typedef struct rpc_run_cpu_sequencer_v17_00
+{
+    NvU32      bufferSizeDWord;
+    NvU32      cmdIndex;
+    NvU32      regSaveArea[8];
+    NvU32      commandBuffer[];
+} rpc_run_cpu_sequencer_v17_00;
+
+typedef enum GSP_SEQ_BUF_OPCODE
+{
+    GSP_SEQ_BUF_OPCODE_REG_WRITE = 0,
+    GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    GSP_SEQ_BUF_OPCODE_REG_POLL,
+    GSP_SEQ_BUF_OPCODE_DELAY_US,
+    GSP_SEQ_BUF_OPCODE_REG_STORE,
+    GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    GSP_SEQ_BUF_OPCODE_CORE_START,
+    GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+} GSP_SEQ_BUF_OPCODE;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_REG_WRITE;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 mask;
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_REG_MODIFY;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 mask;
+    NvU32 val;
+    NvU32 timeout;
+    NvU32 error;
+} GSP_SEQ_BUF_PAYLOAD_REG_POLL;
+
+typedef struct
+{
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_DELAY_US;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 index;
+} GSP_SEQ_BUF_PAYLOAD_REG_STORE;
+
+typedef struct GSP_SEQUENCER_BUFFER_CMD
+{
+    GSP_SEQ_BUF_OPCODE opCode;
+    union
+    {
+        GSP_SEQ_BUF_PAYLOAD_REG_WRITE regWrite;
+        GSP_SEQ_BUF_PAYLOAD_REG_MODIFY regModify;
+        GSP_SEQ_BUF_PAYLOAD_REG_POLL regPoll;
+        GSP_SEQ_BUF_PAYLOAD_DELAY_US delayUs;
+        GSP_SEQ_BUF_PAYLOAD_REG_STORE regStore;
+    } payload;
+} GSP_SEQUENCER_BUFFER_CMD;
+
+typedef struct
+{
+    // Magic
+    // BL to use for verification (i.e. Booter locked it in WPR2)
+    NvU64 magic; // = 0xdc3aae21371a60b3;
+
+    // Revision number of Booter-BL-Sequencer handoff interface
+    // Bumped up when we change this interface so it is not backward compatible.
+    // Bumped up when we revoke GSP-RM ucode
+    NvU64 revision; // = 1;
+
+    // ---- Members regarding data in SYSMEM ----------------------------
+    // Consumed by Booter for DMA
+
+    NvU64 sysmemAddrOfRadix3Elf;
+    NvU64 sizeOfRadix3Elf;
+
+    NvU64 sysmemAddrOfBootloader;
+    NvU64 sizeOfBootloader;
+
+    // Offsets inside bootloader image needed by Booter
+    NvU64 bootloaderCodeOffset;
+    NvU64 bootloaderDataOffset;
+    NvU64 bootloaderManifestOffset;
+
+    union
+    {
+        // Used only at initial boot
+        struct
+        {
+            NvU64 sysmemAddrOfSignature;
+            NvU64 sizeOfSignature;
+        };
+
+        //
+        // Used at suspend/resume to read GspFwHeapFreeList
+        // Offset relative to GspFwWprMeta FBMEM PA (gspFwWprStart)
+        //
+        struct
+        {
+            NvU32 gspFwHeapFreeListWprOffset;
+            NvU32 unused0;
+            NvU64 unused1;
+        };
+    };
+
+    // ---- Members describing FB layout --------------------------------
+    NvU64 gspFwRsvdStart;
+
+    NvU64 nonWprHeapOffset;
+    NvU64 nonWprHeapSize;
+
+    NvU64 gspFwWprStart;
+
+    // GSP-RM to use to setup heap.
+    NvU64 gspFwHeapOffset;
+    NvU64 gspFwHeapSize;
+
+    // BL to use to find ELF for jump
+    NvU64 gspFwOffset;
+    // Size is sizeOfRadix3Elf above.
+
+    NvU64 bootBinOffset;
+    // Size is sizeOfBootloader above.
+
+    NvU64 frtsOffset;
+    NvU64 frtsSize;
+
+    NvU64 gspFwWprEnd;
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 fbSize;
+
+    // ---- Other members -----------------------------------------------
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 vgaWorkspaceOffset;
+    NvU64 vgaWorkspaceSize;
+
+    // Boot count.  Used to determine whether to load the firmware image.
+    NvU64 bootCount;
+
+    // This union is organized the way it is to start at an 8-byte boundary and achieve natural
+    // packing of the internal struct fields.
+    union
+    {
+        struct
+        {
+            // TODO: the partitionRpc* fields below do not really belong in this
+            //       structure. The values are patched in by the partition bootstrapper
+            //       when GSP-RM is booted in a partition, and this structure was a
+            //       convenient place for the bootstrapper to access them. These should
+            //       be moved to a different comm. mechanism between the bootstrapper
+            //       and the GSP-RM tasks.
+
+            // Shared partition RPC memory (physical address)
+            NvU64 partitionRpcAddr;
+
+            // Offsets relative to partitionRpcAddr
+            NvU16 partitionRpcRequestOffset;
+            NvU16 partitionRpcReplyOffset;
+
+            // Code section and dataSection offset and size.
+            NvU32 elfCodeOffset;
+            NvU32 elfDataOffset;
+            NvU32 elfCodeSize;
+            NvU32 elfDataSize;
+
+            // Used during GSP-RM resume to check for revocation
+            NvU32 lsUcodeVersion;
+        };
+
+        struct
+        {
+            // Pad for the partitionRpc* fields, plus 4 bytes
+            NvU32 partitionRpcPadding[4];
+
+            // CrashCat (contiguous) buffer size/location - occupies same bytes as the
+            // elf(Code|Data)(Offset|Size) fields above.
+            // TODO: move to GSP_FMC_INIT_PARAMS
+            NvU64 sysmemAddrOfCrashReportQueue;
+            NvU32 sizeOfCrashReportQueue;
+
+            // Pad for the lsUcodeVersion field
+            NvU32 lsUcodeVersionPadding[1];
+        };
+    };
+
+    // Number of VF partitions allocating sub-heaps from the WPR heap
+    // Used during boot to ensure the heap is adequately sized
+    NvU8 gspFwHeapVfPartitionCount;
+
+    // Pad structure to exactly 256 bytes.  Can replace padding with additional
+    // fields without incrementing revision.  Padding initialized to 0.
+    NvU8 padding[7];
+
+    // BL to use for verification (i.e. Booter says OK to boot)
+    NvU64 verified;  // 0x0 -> unverified, 0xa0a0a0a0a0a0a0a0 -> verified
+} GspFwWprMeta;
+
+#define GSP_FW_WPR_META_MAGIC     0xdc3aae21371a60b3ULL
+
+#define GSP_FW_WPR_META_REVISION  1
+
+typedef struct
+{
+    NvU32 version;   // queue version
+    NvU32 size;      // bytes, page aligned
+    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is minimum
+    NvU32 msgCount;  // number of entries in queue
+    NvU32 writePtr;  // message id of next slot
+    NvU32 flags;     // if set it means "i want to swap RX"
+    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing store.
+    NvU32 entryOff;  // Offset of entries from start of backing store.
+} msgqTxHeader;
+
+typedef struct
+{
+    NvU32 readPtr; // message id of last message read
+} msgqRxHeader;
+
+typedef struct {
+    RmPhysAddr sharedMemPhysAddr;
+    NvU32 pageTableEntryCount;
+    NvLength cmdQueueOffset;
+    NvLength statQueueOffset;
+    NvLength locklessCmdQueueOffset;
+    NvLength locklessStatQueueOffset;
+} MESSAGE_QUEUE_INIT_ARGUMENTS;
+
+typedef struct {
+    NvU32 oldLevel;
+    NvU32 flags;
+    NvBool bInPMTransition;
+} GSP_SR_INIT_ARGUMENTS;
+
+typedef struct
+{
+    MESSAGE_QUEUE_INIT_ARGUMENTS      messageQueueInitArguments;
+    GSP_SR_INIT_ARGUMENTS             srInitArguments;
+    NvU32                             gpuInstance;
+
+    struct
+    {
+        NvU64                         pa;
+        NvU64                         size;
+    } profilerArgs;
+} GSP_ARGUMENTS_CACHED;
+
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0            (0x00000000U)
+
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
+
+typedef NvU64 LibosAddress;
+
+typedef struct
+{
+    LibosAddress          id8;  // Id tag.
+    LibosAddress          pa;   // Physical address.
+    LibosAddress          size; // Size of memory area.
+    NvU8                  kind; // See LibosMemoryRegionKind above.
+    NvU8                  loc;  // See LibosMemoryRegionLoc above.
+} LibosMemoryRegionInitArgument;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_NONE,
+    LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LIBOS_MEMORY_REGION_RADIX3
+} LibosMemoryRegionKind;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_LOC_NONE,
+    LIBOS_MEMORY_REGION_LOC_SYSMEM,
+    LIBOS_MEMORY_REGION_LOC_FB
+} LibosMemoryRegionLoc;
+
+typedef struct
+{
+    //
+    // Magic
+    // Use for verification by Booter
+    //
+    NvU64 magic;  // = GSP_FW_SR_META_MAGIC;
+
+    //
+    // Revision number
+    // Bumped up when we change this interface so it is not backward compatible.
+    // Bumped up when we revoke GSP-RM ucode
+    //
+    NvU64 revision;  // = GSP_FW_SR_META_MAGIC_REVISION;
+
+    //
+    // ---- Members regarding data in SYSMEM ----------------------------
+    // Consumed by Booter for DMA
+    //
+    NvU64 sysmemAddrOfSuspendResumeData;
+    NvU64 sizeOfSuspendResumeData;
+
+    // ---- Members for crypto ops across S/R ---------------------------
+
+    //
+    // HMAC over the entire GspFwSRMeta structure (including padding)
+    // with the hmac field itself zeroed.
+    //
+    NvU8 hmac[32];
+
+    // Hash over GspFwWprMeta structure
+    NvU8 wprMetaHash[32];
+
+    // Hash over GspFwHeapFreeList structure. All zeros signifies no free list.
+    NvU8 heapFreeListHash[32];
+
+    // Hash over data in WPR2 (skipping over free heap chunks; see Booter for details)
+    NvU8 dataHash[32];
+
+    //
+    // Pad structure to exactly 256 bytes (1 DMA chunk).
+    // Padding initialized to zero.
+    //
+    NvU32 padding[24];
+
+} GspFwSRMeta;
+
+#define GSP_FW_SR_META_MAGIC     0x8a3bb9e6c6c39d93ULL
+
+#define GSP_FW_SR_META_REVISION  2
+
+#define GSP_SEQUENCER_PAYLOAD_SIZE_DWORDS(opcode)                       \
+    ((opcode == GSP_SEQ_BUF_OPCODE_REG_WRITE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_WRITE)  / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_MODIFY) ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_MODIFY) / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_POLL)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_POLL)   / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_DELAY_US)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_DELAY_US)   / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_STORE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_STORE)  / sizeof(NvU32)) : \
+    /* GSP_SEQ_BUF_OPCODE_CORE_RESET */                                 \
+    /* GSP_SEQ_BUF_OPCODE_CORE_START */                                 \
+    /* GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT */                         \
+    /* GSP_SEQ_BUF_OPCODE_CORE_RESUME */                                \
+    0)
+
+typedef struct {
+    //
+    // Version 1
+    // Version 2
+    // Version 3 = for Partition boot
+    // Version 4 = for eb riscv boot
+    // Version 5 = Support signing entire RISC-V image as "code" in code section for hopper and later.
+    //
+    NvU32  version;                         // structure version
+    NvU32  bootloaderOffset;
+    NvU32  bootloaderSize;
+    NvU32  bootloaderParamOffset;
+    NvU32  bootloaderParamSize;
+    NvU32  riscvElfOffset;
+    NvU32  riscvElfSize;
+    NvU32  appVersion;                      // Changelist number associated with the image
+    //
+    // Manifest contains information about Monitor and it is
+    // input to BR
+    //
+    NvU32  manifestOffset;
+    NvU32  manifestSize;
+    //
+    // Monitor Data offset within RISCV image and size
+    //
+    NvU32  monitorDataOffset;
+    NvU32  monitorDataSize;
+    //
+    // Monitor Code offset withtin RISCV image and size
+    //
+    NvU32  monitorCodeOffset;
+    NvU32  monitorCodeSize;
+    NvU32  bIsMonitorEnabled;
+    //
+    // Swbrom Code offset within RISCV image and size
+    //
+    NvU32  swbromCodeOffset;
+    NvU32  swbromCodeSize;
+    //
+    // Swbrom Data offset within RISCV image and size
+    //
+    NvU32  swbromDataOffset;
+    NvU32  swbromDataSize;
+    //
+    // Total size of FB carveout (image and reserved space).  
+    //
+    NvU32  fbReservedSize;
+    //
+    // Indicates whether the entire RISC-V image is signed as "code" in code section.
+    //
+    NvU32  bSignedAsCode;
+} RM_RISCV_UCODE_DESC;
+
+typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY {
+    NvU16 engineIdx;
+    NvU32 pmcIntrMask;
+    NvU32 vectorStall;
+    NvU32 vectorNonStall;
+} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY;
+
+typedef struct NV2080_INTR_CATEGORY_SUBTREE_MAP {
+    NvU8 subtreeStart;
+    NvU8 subtreeEnd;
+} NV2080_INTR_CATEGORY_SUBTREE_MAP;
+
+#define NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE       128
+
+typedef enum NV2080_INTR_CATEGORY {
+    NV2080_INTR_CATEGORY_DEFAULT = 0,
+    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE = 1,
+    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE_NOTIFICATION = 2,
+    NV2080_INTR_CATEGORY_RUNLIST = 3,
+    NV2080_INTR_CATEGORY_RUNLIST_NOTIFICATION = 4,
+    NV2080_INTR_CATEGORY_UVM_OWNED = 5,
+    NV2080_INTR_CATEGORY_UVM_SHARED = 6,
+    NV2080_INTR_CATEGORY_ENUM_COUNT = 7,
+} NV2080_INTR_CATEGORY;
+
+#define NV2080_CTRL_CMD_INTERNAL_INTR_GET_KERNEL_TABLE (0x20800a5c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS {
+    NvU32                                            tableLen;
+    NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY table[NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE];
+    NV2080_INTR_CATEGORY_SUBTREE_MAP                 subtreeMap[NV2080_INTR_CATEGORY_ENUM_COUNT];
+} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS;
+
+#define GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB                  (96 << 10)   // All architectures
+
+#define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   // Support 2048 channels
+
+typedef union rpc_message_rpc_union_field_v03_00
+{
+    NvU32      spare;
+    NvU32      cpuRmGfid;
+} rpc_message_rpc_union_field_v03_00;
+
+typedef rpc_message_rpc_union_field_v03_00 rpc_message_rpc_union_field_v;
+
+typedef struct rpc_message_header_v03_00
+{
+    NvU32      header_version;
+    NvU32      signature;
+    NvU32      length;
+    NvU32      function;
+    NvU32      rpc_result;
+    NvU32      rpc_result_private;
+    NvU32      sequence;
+    rpc_message_rpc_union_field_v u;
+    rpc_generic_union rpc_message_data[];
+} rpc_message_header_v03_00;
+
+typedef rpc_message_header_v03_00 rpc_message_header_v;
+
+typedef struct GSP_MSG_QUEUE_ELEMENT
+{
+    NvU8  authTagBuffer[16];         // Authentication tag buffer.
+    NvU8  aadBuffer[16];             // AAD buffer.
+    NvU32 checkSum;                  // Set to value needed to make checksum always zero.
+    NvU32 seqNum;                    // Sequence number maintained by the message queue.
+    NvU32 elemCount;                 // Number of message queue elements this message has.
+    NV_DECLARE_ALIGNED(rpc_message_header_v rpc, 8);
+} GSP_MSG_QUEUE_ELEMENT;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h
new file mode 100644
index 000000000000..642c13aec325
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_MSGFN_H__
+#define __NVRM_MSGFN_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+#ifndef E
+#    define E(RPC) NV_VGPU_MSG_EVENT_##RPC,
+#    define DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+enum {
+#endif
+    E(FIRST_EVENT = 0x1000)                      // 0x1000
+    E(GSP_INIT_DONE)                             // 0x1001
+    E(GSP_RUN_CPU_SEQUENCER)                     // 0x1002
+    E(POST_EVENT)                                // 0x1003
+    E(RC_TRIGGERED)                              // 0x1004
+    E(MMU_FAULT_QUEUED)                          // 0x1005
+    E(OS_ERROR_LOG)                              // 0x1006
+    E(RG_LINE_INTR)                              // 0x1007
+    E(GPUACCT_PERFMON_UTIL_SAMPLES)              // 0x1008
+    E(SIM_READ)                                  // 0x1009
+    E(SIM_WRITE)                                 // 0x100a
+    E(SEMAPHORE_SCHEDULE_CALLBACK)               // 0x100b
+    E(UCODE_LIBOS_PRINT)                         // 0x100c
+    E(VGPU_GSP_PLUGIN_TRIGGERED)                 // 0x100d
+    E(PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK)       // 0x100e
+    E(PERF_BRIDGELESS_INFO_UPDATE)               // 0x100f
+    E(VGPU_CONFIG)                               // 0x1010
+    E(DISPLAY_MODESET)                           // 0x1011
+    E(EXTDEV_INTR_SERVICE)                       // 0x1012
+    E(NVLINK_INBAND_RECEIVED_DATA_256)           // 0x1013
+    E(NVLINK_INBAND_RECEIVED_DATA_512)           // 0x1014
+    E(NVLINK_INBAND_RECEIVED_DATA_1024)          // 0x1015
+    E(NVLINK_INBAND_RECEIVED_DATA_2048)          // 0x1016
+    E(NVLINK_INBAND_RECEIVED_DATA_4096)          // 0x1017
+    E(TIMED_SEMAPHORE_RELEASE)                   // 0x1018
+    E(NVLINK_IS_GPU_DEGRADED)                    // 0x1019
+    E(PFM_REQ_HNDLR_STATE_SYNC_CALLBACK)         // 0x101a
+    E(GSP_SEND_USER_SHARED_DATA)                 // 0x101b
+    E(NVLINK_FAULT_UP)                           // 0x101c
+    E(GSP_LOCKDOWN_NOTICE)                       // 0x101d
+    E(MIG_CI_CONFIG_UPDATE)                      // 0x101e
+    E(NUM_EVENTS)                                // END
+#ifdef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+};
+#   undef E
+#   undef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+#endif
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h
new file mode 100644
index 000000000000..3a04e702677f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_NVDEC_H__
+#define __NVRM_NVDEC_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;
+    NvU32 engineInstance;               // Select NVDEC0 or NVDEC1 or NVDEC2
+} NV_BSP_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h
new file mode 100644
index 000000000000..203c1d5304d9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_NVENC_H__
+#define __NVRM_NVENC_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of MSENC?
+    NvU32 engineInstance;             // Select MSENC/NVENC0 or NVENC1 or NVENC2
+} NV_MSENC_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h
new file mode 100644
index 000000000000..71fc53889ec7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_NVJPG_H__
+#define __NVRM_NVJPG_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of NVJPG?
+    NvU32 engineInstance;
+} NV_NVJPG_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ofa.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ofa.h
new file mode 100644
index 000000000000..49d81c7673d2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ofa.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_OFA_H__
+#define __NVRM_OFA_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
+
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of OFA?
+} NV_OFA_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/rpcfn.h
similarity index 83%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/rpcfn.h
index 73c57f235f6a..2a037acc6b1e 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/rpcfn.h
@@ -1,5 +1,10 @@
-#ifndef __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
-#define __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_RPCFN_H__
+#define __NVRM_RPCFN_H__
+#include <nvrm/nvtypes.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
 
@@ -209,54 +214,12 @@ enum {
     X(RM, CTRL_SET_HS_CREDITS)                  // 198
     X(RM, CTRL_PM_AREA_PC_SAMPLER)              // 199
     X(RM, INVALIDATE_TLB)                       // 200
+    X(RM, RESERVED_201)                         // 201
+    X(RM, ECC_NOTIFIER_WRITE_ACK)               // 202
     X(RM, NUM_FUNCTIONS)                        //END
 #ifdef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
 };
 #   undef X
 #   undef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
 #endif
-
-#ifndef E
-#    define E(RPC) NV_VGPU_MSG_EVENT_##RPC,
-#    define DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
-enum {
-#endif
-    E(FIRST_EVENT = 0x1000)                      // 0x1000
-    E(GSP_INIT_DONE)                             // 0x1001
-    E(GSP_RUN_CPU_SEQUENCER)                     // 0x1002
-    E(POST_EVENT)                                // 0x1003
-    E(RC_TRIGGERED)                              // 0x1004
-    E(MMU_FAULT_QUEUED)                          // 0x1005
-    E(OS_ERROR_LOG)                              // 0x1006
-    E(RG_LINE_INTR)                              // 0x1007
-    E(GPUACCT_PERFMON_UTIL_SAMPLES)              // 0x1008
-    E(SIM_READ)                                  // 0x1009
-    E(SIM_WRITE)                                 // 0x100a
-    E(SEMAPHORE_SCHEDULE_CALLBACK)               // 0x100b
-    E(UCODE_LIBOS_PRINT)                         // 0x100c
-    E(VGPU_GSP_PLUGIN_TRIGGERED)                 // 0x100d
-    E(PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK)       // 0x100e
-    E(PERF_BRIDGELESS_INFO_UPDATE)               // 0x100f
-    E(VGPU_CONFIG)                               // 0x1010
-    E(DISPLAY_MODESET)                           // 0x1011
-    E(EXTDEV_INTR_SERVICE)                       // 0x1012
-    E(NVLINK_INBAND_RECEIVED_DATA_256)           // 0x1013
-    E(NVLINK_INBAND_RECEIVED_DATA_512)           // 0x1014
-    E(NVLINK_INBAND_RECEIVED_DATA_1024)          // 0x1015
-    E(NVLINK_INBAND_RECEIVED_DATA_2048)          // 0x1016
-    E(NVLINK_INBAND_RECEIVED_DATA_4096)          // 0x1017
-    E(TIMED_SEMAPHORE_RELEASE)                   // 0x1018
-    E(NVLINK_IS_GPU_DEGRADED)                    // 0x1019
-    E(PFM_REQ_HNDLR_STATE_SYNC_CALLBACK)         // 0x101a
-    E(GSP_SEND_USER_SHARED_DATA)                 // 0x101b
-    E(NVLINK_FAULT_UP)                           // 0x101c
-    E(GSP_LOCKDOWN_NOTICE)                       // 0x101d
-    E(MIG_CI_CONFIG_UPDATE)                      // 0x101e
-    E(NUM_EVENTS)                                // END
-#ifdef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
-};
-#   undef E
-#   undef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
similarity index 60%
rename from drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
index 977e59818533..f58edf62e4ae 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
@@ -1,35 +1,31 @@
-#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
-#define __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_VMM_H__
+#define __NVRM_VMM_H__
+#include <nvrm/nvtypes.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.113.01 */
 
-/*
- * SPDX-FileCopyrightText: Copyright (c) 2014-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
- * SPDX-License-Identifier: MIT
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
+#define FERMI_VASPACE_A                                     (0x000090f1)
+
+typedef struct
+{
+    NvU32   index;
+    NvV32   flags;
+    NvU64   vaSize NV_ALIGN_BYTES(8);
+    NvU64   vaStartInternal NV_ALIGN_BYTES(8);
+    NvU64   vaLimitInternal NV_ALIGN_BYTES(8);
+    NvU32   bigPageSize;
+    NvU64   vaBase NV_ALIGN_BYTES(8);
+} NV_VASPACE_ALLOCATION_PARAMETERS;
+
+#define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
 
 #define GMMU_FMT_MAX_LEVELS  6U
 
 #define NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES (0x90f10106U) /* finn: Evaluated from "(FINN_FERMI_VASPACE_A_VASPACE_INTERFACE_ID << 8) | NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS_MESSAGE_ID" */
-
 typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
     /*!
      * [in] GPU sub-device handle - this API only supports unicast.
@@ -91,5 +87,4 @@ typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
         NvU8  pageShift;
     } levels[GMMU_FMT_MAX_LEVELS];
 } NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS;
-
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
index 200201c35f0b..4bd84ff04702 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
@@ -26,8 +26,7 @@
 #include <subdev/mmu.h>
 #include <engine/fifo.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include "nvrm/ofa.h"
 
 struct r535_ofa_obj {
 	struct nvkm_object object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index ffb4104a7d8c..5acb98d137bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -21,8 +21,7 @@
  */
 #include <rm/rpc.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include "nvrm/rpcfn.h"
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 94cad290e17e..c697885c65d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -21,10 +21,7 @@
  */
 #include <subdev/mmu/vmm.h>
 
-#include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl90f1.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include "nvrm/vmm.h"
 
 static int
 r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
-- 
2.49.0

