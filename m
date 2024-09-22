Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C999897D2
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324E610E37D;
	Sun, 29 Sep 2024 21:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cUBmuKbW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BA410E0BA
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 13:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwNYRNt8oPiTlQ6Rc4JoQRa0cfLsp3oGfR75Ia7zqW50TBoqmdYY64xYLgYNfhEFKDrRN+OZkeliZnG7tUCxRF3yKlFN89IiKs9RzQhz5d+zzKH9SojjzBp+LbeovgnAvGsxX5Be2fq1ICqDQfRVhmGPDBa//w8SKoBv/tnS8ag/hmO3fLN701OaqafeyE6mKcLiSLSim3LYyZRyOy6JHv54NpcZImrhWvv5NWIw5SuAchBgPj6xrUDz/qlrjgmkG+8MCL23Ru3mYhXzT6GM42ihiBCl5BO8tGXRR0H0hLsfTacNmunLFtEGkvOuw/w1qoyam+dMGW/BYVIPwxI0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9nIFrNKfVI69GUHDw1rgvKARuBqh5WGMqTPWqan3LA=;
 b=sit9m/jIP9r/pyh/uvmJbZEEsJ+kGQywHWdOlxkiTD/igH53t+eVkxDGwYeg7yW2fBLVcv+cq05tx6PXtjVyCkX17hYkTggEix5oO2no+l8nfbNQ2YvGWtflYMElRShiRfHrys8teICPmrdm20cKzb69cFyWRzZZpkcA4Wj9hrZMpiAJlHI3OZYFEY0zb+WMbwCEbmsIXOxEXrO4ZzNasfZaYLjw08g9YPIMzZ/N8fxeFRHn8ghtasUUJ1sN9nAQZ+lr8FYaMwkH1OlVpL4eSbWWpo1EMuW13wq/9A9ZNee3ZWSKhuNQVo7JZ/55E/W93NH/eqa5CbY1o17CTiKNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9nIFrNKfVI69GUHDw1rgvKARuBqh5WGMqTPWqan3LA=;
 b=cUBmuKbWAERHvmR5gLEWZ1OCX74A3S80eid8VAG/FwHZxN8mjANRfM7OvoyzW3EOBhHjF9gg26fbnws7Uib+kOlO+XzHiflmrAJMjXAuLRkAuz48CXyip69SNv+kpzad3r7FuyzrFxJX/arNo6cN1hj7koOkLZVHG/kFYmDBojum4o/kPxxoNhQx1x0aeJcjFMKXBscHLFO7/jHcFy5cpBFHWwrmSY3lAIsL+tg5c8KxhujCZ5aFNhkSren0AD/Hz+bxkuEZGDE9pfzxu6FoE9ncifCYGA5kyAsLot1bERE2l50d1/Ydp8Jw7iSvOgBdYkExwY2m+fGuBWSoDkAxog==
Received: from BLAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:208:32d::6)
 by CY8PR12MB8214.namprd12.prod.outlook.com (2603:10b6:930:76::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 13:07:30 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::4) by BLAPR03CA0031.outlook.office365.com
 (2603:10b6:208:32d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Sun, 22 Sep 2024 13:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 13:07:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:18 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 06:07:18 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/3] nvkm/gsp: correctly calculate the available space of the
 GSP cmdq buffer
Date: Sun, 22 Sep 2024 06:07:08 -0700
Message-ID: <20240922130709.1946893-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922130709.1946893-1-zhiw@nvidia.com>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|CY8PR12MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: b12f0be7-c0b0-48d5-5179-08dcdb0783b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ij3f0sakAem7XKVMoRCU1P3aZ9/Z/1zTi6mhRPPJBwitkSDxkQXPq6rJp5vL?=
 =?us-ascii?Q?KXf8YC0ya5uAzFF7vsWzQ2kEU1u9jI/SVrB17G/QJ9SjAEeZkQiThPQxDG0s?=
 =?us-ascii?Q?YEdh5yJFHY9gw+LRcxQ8Xs9cYBU6+y9ZKTiTG3VHBkPty2eFMY1QUy3FBSPd?=
 =?us-ascii?Q?bfm9ZmURZxuYjrEikN0KjcoeP5Hwf/QnrwmOyaV3lH8dX8cHe1N4UNhDiglo?=
 =?us-ascii?Q?a62YZovjjkFx+Z++tsn4aRUlDjzE3zvv0tnz7MPwYN+Vu9Qa9DpJjYAI1zLi?=
 =?us-ascii?Q?rtL86CaTzhPgwKqxq8fUW9iygI/TTOsxVZIq+EPmzVhx2kMKlALwA3VbXrbD?=
 =?us-ascii?Q?r4BPEaV9INPn8zdt1GPmP5md7C+Hbb2cj3zcFfrm176KIaLg0qm0ls5DeTMV?=
 =?us-ascii?Q?d1P5b3LocrhR0j6d73aqokNVYj41H2VVh4uHT74KexwEeHUXhREnLlroHI1o?=
 =?us-ascii?Q?J1uGceiym2IGRNBfjbc7ekdTNrvf2Fb9m8XuRpsniyqoU82XsB//wMMFyrsp?=
 =?us-ascii?Q?J+ytSqTRpfmBozMAgRNiLNB1onTCTBtLFNaRud5QdWMs08/rPcSQDoh9ADOl?=
 =?us-ascii?Q?TtSVhiRzQDlhSWNa6ykXGfaUExhfclZihEWLAwM6VcjC7+qeZk4Spi1Ww1Pe?=
 =?us-ascii?Q?732umm791syUzWjMJ8zc8CUyT64swI0XYr+cAX4Y00ZH5uyDmuEh7Q6VhWsT?=
 =?us-ascii?Q?qJOqyvgeVYmHfyohiRDR9w2gCPy0gUsfaHCM2Z5BCLvYRmf56FOPCOnL8NLo?=
 =?us-ascii?Q?wJvArqKR8syvDV47Gv6A76XhB9q8JN6mH9pYtKoGG8lmLanxnuyKbfA1yMbf?=
 =?us-ascii?Q?4WfYWa/F9ImCu03OJuRJf7T2oX9bdOQWZv65ZT/ET6CEbL11K+ljo4Z8ZaVB?=
 =?us-ascii?Q?BnpAbPatjwKkQHSkSVuIUDqineaYxyYMNA4nMAlk4gairr25MVczOIWKmK6n?=
 =?us-ascii?Q?3/pMGBsAmZe2oNAFuP92a2210HONcrEPmxs5Lf8M0xygRLZFlGrIpYGtIZLh?=
 =?us-ascii?Q?hmzECTc6sVMfYBcHgo820vjD8drZt1ERsOqsTA4Q+9QDj39Dt89R5Z7bxov/?=
 =?us-ascii?Q?NhSW460/Jonu9YMAw7rdg8xLhD7uCIlrcyvljE3+TtDUK4I7A+A89jP6eC6y?=
 =?us-ascii?Q?GEB4G8Mj6safKaITqj2W7hyr6Yda1pi6xjWw89xA/TF/SOusbafA3IWFomPz?=
 =?us-ascii?Q?0qX+6ceYU+gPnXPcc9nnpO20WMhM9nCDoQBZ+5pjVMVXPQr1VSGXDJyZkaeF?=
 =?us-ascii?Q?0y4RHtGuVxVedG8I8Rda+KgCtnflNy1ZLGAEMKlwv1RGghWC+8c881DadvBa?=
 =?us-ascii?Q?3RfMTcQYPQHI9enVB3XOx3wSSfu8lHIA9DBJDzZkYw0yxFFcCBwmv3HnWB2t?=
 =?us-ascii?Q?7KO+Ty7JP+M9PyNSOcETWVf2zMtBOqy4nMqN9fwjtfuHFT7FlX6/lja/1vth?=
 =?us-ascii?Q?pw0ICnK5mTo24czH/xS8al4aGQnr3oKs?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 13:07:29.8845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12f0be7-c0b0-48d5-5179-08dcdb0783b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8214
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:51 +0000
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

r535_gsp_cmdq_push() waits for the available page in the GSP cmdq
buffer when handling a large RPC request. When it sees at least one
available page in the cmdq, it quits the waiting with the amount of
free buffer pages in the queue.

Unfortunately, it always takes the [write pointer, buf_size) as
available buffer pages before rolling back and wrongly calculates the
size of the data should be copied. Thus, it can overwrite the RPC
request that GSP is currently reading, which causes GSP hang due
to corrupted RPC request:

[  549.209389] ------------[ cut here ]------------
[  549.214010] WARNING: CPU: 8 PID: 6314 at drivers/gpu/drm/nouveau/nvkm/su=
bdev/gsp/r535.c:116 r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
[  549.225678] Modules linked in: nvkm(E+) gsp_log(E) snd_seq_dummy(E) snd_=
hrtimer(E) snd_seq(E) snd_timer(E) snd_seq_device(E) snd(E) soundcore(E) rf=
kill(E) qrtr(E) vfat(E) fat(E) ipmi_ssif(E) amd_atl(E) intel_rapl_msr(E) in=
tel_rapl_common(E) mlx5_ib(E) amd64_edac(E) edac_mce_amd(E) kvm_amd(E) ib_u=
verbs(E) kvm(E) ib_core(E) acpi_ipmi(E) ipmi_si(E) mxm_wmi(E) ipmi_devintf(=
E) rapl(E) i2c_piix4(E) wmi_bmof(E) joydev(E) ptdma(E) acpi_cpufreq(E) k10t=
emp(E) pcspkr(E) ipmi_msghandler(E) xfs(E) libcrc32c(E) ast(E) i2c_algo_bit=
(E) crct10dif_pclmul(E) drm_shmem_helper(E) nvme_tcp(E) crc32_pclmul(E) ahc=
i(E) drm_kms_helper(E) libahci(E) nvme_fabrics(E) crc32c_intel(E) nvme(E) c=
dc_ether(E) mlx5_core(E) nvme_core(E) usbnet(E) drm(E) libata(E) ccp(E) gha=
sh_clmulni_intel(E) mii(E) t10_pi(E) mlxfw(E) sp5100_tco(E) psample(E) pci_=
hyperv_intf(E) wmi(E) dm_multipath(E) sunrpc(E) dm_mirror(E) dm_region_hash=
(E) dm_log(E) dm_mod(E) be2iscsi(E) bnx2i(E) cnic(E) uio(E) cxgb4i(E) cxgb4=
(E) tls(E) libcxgbi(E) libcxgb(E) qla4xxx(E)
[  549.225752]  iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi(E=
) scsi_transport_iscsi(E) fuse(E) [last unloaded: gsp_log(E)]
[  549.326293] CPU: 8 PID: 6314 Comm: insmod Tainted: G            E      6=
.9.0-rc6+ #1
[  549.334039] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS L3.12=
E 09/06/2022
[  549.341781] RIP: 0010:r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
[  549.347343] Code: 08 00 00 89 da c1 e2 0c 48 8d ac 11 00 10 00 00 48 8b =
0c 24 48 85 c9 74 1f c1 e0 0c 4c 8d 6d 30 83 e8 30 89 01 e9 68 ff ff ff <0f=
> 0b 49 c7 c5 92 ff ff ff e9 5a ff ff ff ba ff ff ff ff be c0 0c
[  549.366090] RSP: 0018:ffffacbccaaeb7d0 EFLAGS: 00010246
[  549.371315] RAX: 0000000000000000 RBX: 0000000000000012 RCX: 00000000009=
23e28
[  549.378451] RDX: 0000000000000000 RSI: 0000000055555554 RDI: ffffacbccaa=
eb730
[  549.385590] RBP: 0000000000000001 R08: ffff8bd14d235f70 R09: ffff8bd14d2=
35f70
[  549.392721] R10: 0000000000000002 R11: ffff8bd14d233864 R12: 00000000000=
00020
[  549.399854] R13: ffffacbccaaeb818 R14: 0000000000000020 R15: ffff8bb298c=
67000
[  549.406988] FS:  00007f5179244740(0000) GS:ffff8bd14d200000(0000) knlGS:=
0000000000000000
[  549.415076] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  549.420829] CR2: 00007fa844000010 CR3: 00000001567dc005 CR4: 00000000007=
70ef0
[  549.427963] PKRU: 55555554
[  549.430672] Call Trace:
[  549.433126]  <TASK>
[  549.435233]  ? __warn+0x7f/0x130
[  549.438473]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
[  549.443426]  ? report_bug+0x18a/0x1a0
[  549.447098]  ? handle_bug+0x3c/0x70
[  549.450589]  ? exc_invalid_op+0x14/0x70
[  549.454430]  ? asm_exc_invalid_op+0x16/0x20
[  549.458619]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
[  549.463565]  r535_gsp_msg_recv+0x46/0x230 [nvkm]
[  549.468257]  r535_gsp_rpc_push+0x106/0x160 [nvkm]
[  549.473033]  r535_gsp_rpc_rm_ctrl_push+0x40/0x130 [nvkm]
[  549.478422]  nvidia_grid_init_vgpu_types+0xbc/0xe0 [nvkm]
[  549.483899]  nvidia_grid_init+0xb1/0xd0 [nvkm]
[  549.488420]  ? srso_alias_return_thunk+0x5/0xfbef5
[  549.493213]  nvkm_device_pci_probe+0x305/0x420 [nvkm]
[  549.498338]  local_pci_probe+0x46/0xa0
[  549.502096]  pci_call_probe+0x56/0x170
[  549.505851]  pci_device_probe+0x79/0xf0
[  549.509690]  ? driver_sysfs_add+0x59/0xc0
[  549.513702]  really_probe+0xd9/0x380
[  549.517282]  __driver_probe_device+0x78/0x150
[  549.521640]  driver_probe_device+0x1e/0x90
[  549.525746]  __driver_attach+0xd2/0x1c0
[  549.529594]  ? __pfx___driver_attach+0x10/0x10
[  549.534045]  bus_for_each_dev+0x78/0xd0
[  549.537893]  bus_add_driver+0x112/0x210
[  549.541750]  driver_register+0x5c/0x120
[  549.545596]  ? __pfx_nvkm_init+0x10/0x10 [nvkm]
[  549.550224]  do_one_initcall+0x44/0x300
[  549.554063]  ? do_init_module+0x23/0x240
[  549.557989]  do_init_module+0x64/0x240

Calculate the available buffer page before rolling back based on
the result from the waiting.

Fixes: 176fdcbddfd28 ("drm/nouveau/gsp/r535: add support for booting GSP-RM=
")
Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 736cde1987d0..49721935013b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -161,7 +161,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
 	u64 *end;
 	u64 csum =3D 0;
 	int free, time =3D 1000000;
-	u32 wptr, size;
+	u32 wptr, size, step;
 	u32 off =3D 0;
=20
 	argc =3D ALIGN(GSP_MSG_HDR_SIZE + argc, GSP_PAGE_SIZE);
@@ -178,11 +178,13 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
 	cmd->checksum =3D upper_32_bits(csum) ^ lower_32_bits(csum);
=20
 	wptr =3D *gsp->cmdq.wptr;
+
 	do {
 		do {
 			free =3D *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr - 1;
 			if (free >=3D gsp->cmdq.cnt)
 				free -=3D gsp->cmdq.cnt;
+
 			if (free >=3D 1)
 				break;
=20
@@ -195,7 +197,9 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
 		}
=20
 		cqe =3D (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
-		size =3D min_t(u32, argc, (gsp->cmdq.cnt - wptr) * GSP_PAGE_SIZE);
+		step =3D min_t(u32, free, (gsp->cmdq.cnt - wptr));
+		size =3D min_t(u32, argc, step * GSP_PAGE_SIZE);
+
 		memcpy(cqe, (u8 *)cmd + off, size);
=20
 		wptr +=3D DIV_ROUND_UP(size, 0x1000);
--=20
2.34.1

