Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B904B9A1B8B
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 09:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430010E1D7;
	Thu, 17 Oct 2024 07:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W90A4R1v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921010E1D7
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 07:19:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4AmdBUj1DUkCCOuHC8otriN4rjyZtG4wojvmbQsUQkKB5OFYS0OpqHn89v2E7vi/y2KFdDT0rQrLYrxc/HwzzpGEgxI8vjCgbj90otYvlSb1qd/xRsi32A6TLcIMJhBD6jQ6hDf8avWf0K/wLvHovdTtdIdjkxcf+5uBK6Yf719LB8869kOY2JMqTsYzRgWJo9p3ewmhhYpdfjFzXLuF9g+OeehVakvrAj7GMWRQSTfl81gxEMWqLumXKSRbqNwr5bl0Hd6BJimk0qZxSFmwTYH3lqftxBXYQMoP6D+xIyXLejUSYAkhGq8r84KKzndvb9pB5kopEtJq3+D+DWl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1+d9RBoeD4B5orYzVRxEQcCpuMLqArhUsUfnZTDrtA=;
 b=DugCwDoN4yW/iyUYpKFKk+nJoHKPtnkxFuhjC00OegB1ObxLDlmqbbd/FIjeHeK4iVv1drvpAWvtUArsBrbw+6OjcEG3x1W8wE01f0N4ELMQwLS/Ct0y8jTmAbM1jyHWSNq+g21Bdjv0YqZYu8coO9PmSUjGy/hjbhB334I/Bt8IrDcDeAvMQV75GZMmGufDvrkawhb26BKIw9dQl4eMpxOb2xWtWxTkScMxgrkjSZJih8oJRrcWRBimlzqQUmJb2ovXGsOooQ0ZrHE90bka5C/Gzb6s8TPv9yZx+iG6UsTSQJJNXk5H3J1LrG5g5n8u93GFW9SKzNmAs/qlKHwQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1+d9RBoeD4B5orYzVRxEQcCpuMLqArhUsUfnZTDrtA=;
 b=W90A4R1viY34294UGOqVtE89sj5Qqjs6+83Nkaj+J8+j+dyzQ/OGcRSWPDO3PHfuzPd+uXY+4H2OVunzTyHGmTEvBtYRCOZM2CGN3GZm+u/Vqgdwzb22+K76lKa52SkGMcYRKJVyrWvqgzVhT7Jiae9OxXRa5t90y5XJRo7d8hG8XZG+FEreL+bqOGGv+GnNdL7tM4b2H+JV9zSsZYiAkdza4kjkCB6RL4WOf/jFLVpSu5SCdGbsTHznOPQ8Fmw2ljx6KqLj7E/txOCZwbZhpub4jTcJXb4ZIruaUuyVoSYUlxZGGF/Cmi4PJH1Hwj1yYf+BccdVDG3SgHOjqXZmqQ==
Received: from BN9PR03CA0665.namprd03.prod.outlook.com (2603:10b6:408:10e::10)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 07:19:38 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::b0) by BN9PR03CA0665.outlook.office365.com
 (2603:10b6:408:10e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 07:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 07:19:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:26 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 17 Oct 2024 00:19:26 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 1/3] nvkm/gsp: correctly advance the read pointer of GSP
 message queue
Date: Thu, 17 Oct 2024 00:19:20 -0700
Message-ID: <20241017071922.2518724-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017071922.2518724-1-zhiw@nvidia.com>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 6525ec4c-d989-420d-c575-08dcee7c0f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+EJKTSnLMSJkQcEy9whAKg4s+1wT3kRa17LTF14sGnILGpEpqvhQ4/hxVcl?=
 =?us-ascii?Q?sl/80XahxRuq0N8YsmlSc6POKhjTpOhM0MDjhAtnMqii6SE8I9yqsKXsUhQd?=
 =?us-ascii?Q?dv9vdGnz01bpbJdNb9nWAWczWjoDSaM+5Dz8qee+eRSdJhDul8/ut8yfu+U/?=
 =?us-ascii?Q?n3TCwEDi28AWi1oIq4j79nAwu7n1Xc2ZgZmuzYjRN2PPMtl2DDdbmZofZh58?=
 =?us-ascii?Q?gLVNCOkaFTULXY2OTqBpqfWVOgjr2NbQldWfe0cpEe1r1bvqqiHYgDS2zrjE?=
 =?us-ascii?Q?b24akLowwqBHOkdzjIJ4A4REjHzlU1xspuEB7xdCoUALQ8slxRGKh2AwoDVD?=
 =?us-ascii?Q?nxIlqj+oMNwjm6/5xhbfQgnlI9OZbQLvLt9vDRGJNwGSv4YOy9eLUhRJvB5q?=
 =?us-ascii?Q?Sf8IthIDZZHnXGEpXR0RdTuiVa4g+TVTHeiRHxpgXoq3JUXRcfIVkpE9TIJ3?=
 =?us-ascii?Q?fOHM7pim1kP2/7bNmfmuu2G3GTbZERPaabGC6kycswTWQmHGkxgPC/Klh6DT?=
 =?us-ascii?Q?oTWQxT040ab9QXEAmfi11yyJzZyPPVGzANtO8x1RV0PJICIOsnyjXjPv20jp?=
 =?us-ascii?Q?vItesjm0TV2YuOLjLZueVGC63tKSzWdrm/qcHQcGjq6mlF+Pf6wVVThfey4v?=
 =?us-ascii?Q?4pOcVr2GHjwCnUE+oRrGXssIEameW63WDRug6NgxUwDJr1DRqL411gZ09aJe?=
 =?us-ascii?Q?nwhRlWKN0Kxh1Th0iMwi3f7yU+IpV9vr57Uv2ibLj4k+mv129qRFvviMuD68?=
 =?us-ascii?Q?dUhiSe0hXqiIymgllwM0ak8TEdL2Gt3ojH7NcyT42ItbFUZgh9wl1+H6mYhL?=
 =?us-ascii?Q?gY6d/UWLtHREw8HZcuqbfGxCyQWi9OjlJ18rf+k9alfMN+eaSfy5c2PSs29p?=
 =?us-ascii?Q?8gGuwGrKSic1LxoKl0ar/aCTQwkxAFkWEgSEoYsfDWpnCPHfRiuzDYSfwYgt?=
 =?us-ascii?Q?uIwPBfKbJsLAAYoc5BVvgVtQBvZ77hdheGvQUEZ29vWQk2zoW6Dhvtn6andC?=
 =?us-ascii?Q?KBgddxjAcH5IG/rEajNUunqQMoUO8OS2EIYTxMavadUY9e1zldfUd2CL1Ifv?=
 =?us-ascii?Q?p7PoqvbnsTa85ZxhIwN7OmdJJSDP9r3UJIFBhHQZpzwKC7h8L9xK3rXotqmp?=
 =?us-ascii?Q?QCz6TMRumKt/TcoUF88u09mkRflo6oropL2V70Wt53TuJfrC10hEreWC1dby?=
 =?us-ascii?Q?rIcy/RPberLcp4Ih4+SJBwgcjh2L/N8swxG0vMq9RCWYUxFY7YxnUmr4MA1E?=
 =?us-ascii?Q?Ds3i6lozENvkCV12AiNxj1ISusDVuu0/TFe5nzejo+22JXKNEhUItDitpQsB?=
 =?us-ascii?Q?xE4t2dgQNWJVhljLrLndc0xjMtdaGN0C1LHDB6Yw6cI7ODhV2tSfrCr1QOm+?=
 =?us-ascii?Q?cdRHavnhSOmL5C/0loSUiMKq1BPvHiJV2RL60Yc/298mDCeKtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:19:38.1975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6525ec4c-d989-420d-c575-08dcee7c0f8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
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

A GSP event message consists three parts: message header, RPC header,
message body. GSP calculates the number of pages to write from the
total size of a GSP message. This behavior can be observed from the
movement of the write pointer.

However, nvkm takes only the size of RPC header and message body as
the message size when advancing the read pointer. When handling a
two-page GSP message in the non rollback case, It wrongly takes the
message body of the previous message as the message header of the next
message. As the "message length" tends to be zero, in the calculation of
size needs to be copied (0 - size of (message header)), the size needs to
be copied will be "0xffffffxx". It also triggers a kernel panic due to a
NULL pointer error.

[  547.614102] msg: 00000f90: ff ff ff ff ff ff ff ff 40 d7 18 fb 8b 00 00 =
00  ........@.......
[  547.622533] msg: 00000fa0: 00 00 00 00 ff ff ff ff ff ff ff ff 00 00 00 =
00  ................
[  547.630965] msg: 00000fb0: ff ff ff ff ff ff ff ff 00 00 00 00 ff ff ff =
ff  ................
[  547.639397] msg: 00000fc0: ff ff ff ff 00 00 00 00 ff ff ff ff ff ff ff =
ff  ................
[  547.647832] nvkm 0000:c1:00.0: gsp: peek msg rpc fn:0 len:0x0/0xffffffff=
ffffffe0
[  547.655225] nvkm 0000:c1:00.0: gsp: get msg rpc fn:0 len:0x0/0xfffffffff=
fffffe0
[  547.662532] BUG: kernel NULL pointer dereference, address: 0000000000000=
020
[  547.669485] #PF: supervisor read access in kernel mode
[  547.674624] #PF: error_code(0x0000) - not-present page
[  547.679755] PGD 0 P4D 0
[  547.682294] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  547.686643] CPU: 22 PID: 322 Comm: kworker/22:1 Tainted: G            E =
     6.9.0-rc6+ #1
[  547.694893] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS L3.12=
E 09/06/2022
[  547.702626] Workqueue: events r535_gsp_msgq_work [nvkm]
[  547.707921] RIP: 0010:r535_gsp_msg_recv+0x87/0x230 [nvkm]
[  547.713375] Code: 00 8b 70 08 48 89 e1 31 d2 4c 89 f7 e8 12 f5 ff ff 48 =
89 c5 48 85 c0 0f 84 cf 00 00 00 48 81 fd 00 f0 ff ff 0f 87 c4 00 00 00 <8b=
> 55 10 41 8b 46 30 85 d2 0f 85 f6 00 00 00 83 f8 04 76 10 ba 05
[  547.732119] RSP: 0018:ffffabe440f87e10 EFLAGS: 00010203
[  547.737335] RAX: 0000000000000010 RBX: 0000000000000008 RCX: 00000000000=
0003f
[  547.744461] RDX: 0000000000000000 RSI: ffffabe4480a8030 RDI: 00000000000=
00010
[  547.751585] RBP: 0000000000000010 R08: 0000000000000000 R09: ffffabe440f=
87bb0
[  547.758707] R10: ffffabe440f87dc8 R11: 0000000000000010 R12: 00000000000=
00000
[  547.765834] R13: 0000000000000000 R14: ffff9351df1e5000 R15: 00000000000=
00000
[  547.772958] FS:  0000000000000000(0000) GS:ffff93708eb00000(0000) knlGS:=
0000000000000000
[  547.781035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  547.786771] CR2: 0000000000000020 CR3: 00000003cc220002 CR4: 00000000007=
70ef0
[  547.793896] PKRU: 55555554
[  547.796600] Call Trace:
[  547.799046]  <TASK>
[  547.801152]  ? __die+0x20/0x70
[  547.804211]  ? page_fault_oops+0x75/0x170
[  547.808221]  ? print_hex_dump+0x100/0x160
[  547.812226]  ? exc_page_fault+0x64/0x150
[  547.816152]  ? asm_exc_page_fault+0x22/0x30
[  547.820341]  ? r535_gsp_msg_recv+0x87/0x230 [nvkm]
[  547.825184]  r535_gsp_msgq_work+0x42/0x50 [nvkm]
[  547.829845]  process_one_work+0x196/0x3d0
[  547.833861]  worker_thread+0x2fc/0x410
[  547.837613]  ? __pfx_worker_thread+0x10/0x10
[  547.841885]  kthread+0xdf/0x110
[  547.845031]  ? __pfx_kthread+0x10/0x10
[  547.848775]  ret_from_fork+0x30/0x50
[  547.852354]  ? __pfx_kthread+0x10/0x10
[  547.856097]  ret_from_fork_asm+0x1a/0x30
[  547.860019]  </TASK>
[  547.862208] Modules linked in: nvkm(E) gsp_log(E) snd_seq_dummy(E) snd_h=
rtimer(E) snd_seq(E) snd_timer(E) snd_seq_device(E) snd(E) soundcore(E) rfk=
ill(E) qrtr(E) vfat(E) fat(E) ipmi_ssif(E) amd_atl(E) intel_rapl_msr(E) int=
el_rapl_common(E) amd64_edac(E) mlx5_ib(E) edac_mce_amd(E) kvm_amd(E) ib_uv=
erbs(E) kvm(E) ib_core(E) acpi_ipmi(E) ipmi_si(E) ipmi_devintf(E) mxm_wmi(E=
) joydev(E) rapl(E) ptdma(E) i2c_piix4(E) acpi_cpufreq(E) wmi_bmof(E) pcspk=
r(E) k10temp(E) ipmi_msghandler(E) xfs(E) libcrc32c(E) ast(E) i2c_algo_bit(=
E) drm_shmem_helper(E) crct10dif_pclmul(E) drm_kms_helper(E) ahci(E) crc32_=
pclmul(E) nvme_tcp(E) libahci(E) nvme(E) crc32c_intel(E) nvme_fabrics(E) cd=
c_ether(E) nvme_core(E) usbnet(E) mlx5_core(E) ghash_clmulni_intel(E) drm(E=
) libata(E) ccp(E) mii(E) t10_pi(E) mlxfw(E) sp5100_tco(E) psample(E) pci_h=
yperv_intf(E) wmi(E) dm_multipath(E) sunrpc(E) dm_mirror(E) dm_region_hash(=
E) dm_log(E) dm_mod(E) be2iscsi(E) bnx2i(E) cnic(E) uio(E) cxgb4i(E) cxgb4(=
E) tls(E) libcxgbi(E) libcxgb(E) qla4xxx(E)
[  547.862283]  iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi(E=
) scsi_transport_iscsi(E) fuse(E) [last unloaded: gsp_log(E)]
[  547.962691] CR2: 0000000000000020
[  547.966003] ---[ end trace 0000000000000000 ]---
[  549.012012] clocksource: Long readout interval, skipping watchdog check:=
 cs_nsec: 1370499158 wd_nsec: 1370498904
[  549.043676] pstore: backend (erst) writing error (-28)
[  549.050924] RIP: 0010:r535_gsp_msg_recv+0x87/0x230 [nvkm]
[  549.056389] Code: 00 8b 70 08 48 89 e1 31 d2 4c 89 f7 e8 12 f5 ff ff 48 =
89 c5 48 85 c0 0f 84 cf 00 00 00 48 81 fd 00 f0 ff ff 0f 87 c4 00 00 00 <8b=
> 55 10 41 8b 46 30 85 d2 0f 85 f6 00 00 00 83 f8 04 76 10 ba 05
[  549.075138] RSP: 0018:ffffabe440f87e10 EFLAGS: 00010203
[  549.080361] RAX: 0000000000000010 RBX: 0000000000000008 RCX: 00000000000=
0003f
[  549.087484] RDX: 0000000000000000 RSI: ffffabe4480a8030 RDI: 00000000000=
00010
[  549.094609] RBP: 0000000000000010 R08: 0000000000000000 R09: ffffabe440f=
87bb0
[  549.101733] R10: ffffabe440f87dc8 R11: 0000000000000010 R12: 00000000000=
00000
[  549.108857] R13: 0000000000000000 R14: ffff9351df1e5000 R15: 00000000000=
00000
[  549.115982] FS:  0000000000000000(0000) GS:ffff93708eb00000(0000) knlGS:=
0000000000000000
[  549.124061] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  549.129807] CR2: 0000000000000020 CR3: 00000003cc220002 CR4: 00000000007=
70ef0
[  549.136940] PKRU: 55555554
[  549.139653] Kernel panic - not syncing: Fatal exception
[  549.145054] Kernel Offset: 0x18c00000 from 0xffffffff81000000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)
[  549.165074] ---[ end Kernel panic - not syncing: Fatal exception ]---

Also, nvkm wrongly advances the read pointer when handling a two-page GSP
message in the rollback case. In the rollback case, the GSP message will
be copied in two rounds. When handling a two-page GSP message, nvkm first
copies amount of (GSP_PAGE_SIZE - header) data into the buffer, then
advances the read pointer by the result of DIV_ROUND_UP(size,
GSP_PAGE_SIZE). Thus, the read pointer is advanced by 1.

Next, nvkm copies the amount of (total size - (GSP_PAGE_SIZE -
header)) data into the buffer. The left amount of the data will be always
larger than one page since the message header is not taken into account
in the first copy. Thus, the read pointer is advanced by DIV_ROUND_UP(
size(larger than one page), GSP_PAGE_SIZE) =3D 2.

In the end, the read pointer is wrongly advanced by 3 when handling a
two-page GSP message in the rollback case.

Fix the problems by taking the total size of the message into account
when advancing the read pointer and calculate the read pointer in the end
of the all copies for the rollback case.

BTW: the two-page GSP message can be observed in the msgq when vGPU is
enabled.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index cf58f9da9139..736cde1987d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -121,6 +121,8 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 =
*prepc, int *ptime)
 		return mqe->data;
 	}
=20
+	size =3D ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
+
 	msg =3D kvmalloc(repc, GFP_KERNEL);
 	if (!msg)
 		return ERR_PTR(-ENOMEM);
@@ -129,19 +131,15 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u3=
2 *prepc, int *ptime)
 	len =3D min_t(u32, repc, len);
 	memcpy(msg, mqe->data, len);
=20
-	rptr +=3D DIV_ROUND_UP(len, GSP_PAGE_SIZE);
-	if (rptr =3D=3D gsp->msgq.cnt)
-		rptr =3D 0;
-
 	repc -=3D len;
=20
 	if (repc) {
 		mqe =3D (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
 		memcpy(msg + len, mqe, repc);
-
-		rptr +=3D DIV_ROUND_UP(repc, GSP_PAGE_SIZE);
 	}
=20
+	rptr =3D (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
+
 	mb();
 	(*gsp->msgq.rptr) =3D rptr;
 	return msg;
--=20
2.34.1

