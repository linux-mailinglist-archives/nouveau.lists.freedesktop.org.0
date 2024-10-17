Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9C9A1B8D
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 09:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CFD10E7B0;
	Thu, 17 Oct 2024 07:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kx9hpKD3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825CD10E7AC
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 07:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BehYP+dldNSfMuHp/54dYIIX8VdRA6PW+/lAW1MPcec9uEZYgJnmSQcfdrZB8QYJ4HmVNaJ49IwzHJV5L94gAMJm/D3P6VerlIA3U7sWm72CTD7kg4XSo3aUaQVWz2736tfJiqQqaiHapPTRrmmJGCNwj0jO8KAOBv1rCboSIXeIl74QrgVvLaZitBskaAlwgiEL1n4ZKC6hV0PINLLvaXugM2HSuMzKRjQysVqyofrQpXY1wM3wa2GRn5SI5pFWVAGUxPY2oXbng4ZHVyekT5eHPAstkxlrcLzu6FAFikPp0ufXP3UKllJEKvwBbe//FkZ43lRE8PC8LqriuQetwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPZ3Hsia5pF4v6TLygWqpFy2FyzdeGqyykfiIquRvjA=;
 b=nE4nQTugkcg+u/8nG41aJ/Z6Cx6O+uSYP6rEcMx6bVqidAFexFOUR6sdgciC6v8LqcLD4a/8p56y43JCCb/5SoYzvks0IRC6+VJX2UxMc1FsqOxeLaL2iNXoNmBhzyKK4JKRyEwFFYZkPKMSVXBVTeXvpYpYDWr5VozcnbeOPKeh0QacsF/Zu6WVLznQWz/1H6BDjFwMRQERz2BYtcX9tNwNJWdZckgHcRJ/ec4GyYrbzb5oLXnJNfjWlyjQxZ1Hmz3vBfNOZNZh7MLuPMSNptcLObXZGANZMgLd0eBOdLy/2bt2bIgblEzUEo3zVqsuW40X/wLL2J1tqU4VEJIwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPZ3Hsia5pF4v6TLygWqpFy2FyzdeGqyykfiIquRvjA=;
 b=Kx9hpKD3Ys8HyJ7nNs8zUPZUYzxeRxAAFW8mGOQLSaOQGq5SO0gmlpj+GrhjTMRjccAs7Fs9sVkP93UQ+8e+//+odEqBJZkAzGLYmOofsEtXGKOUrVHOT4Fg9oREAyHDJ39F6LlgGM1AuFeKJ9dtxRZ9yChWlczOEa635kacldfdMwWE/Sp/yup0H+AtDtMtZiokCXcEB21s0/3LYzDr7leW78pFzijJ/yzNYO3s/1Q6IaDmspVl4wVhBUCqhrLGTBDlXyCTjl9VfMCvUVnk8XO59XvNxWTS+Ofr8Uqzwg2SXHJb7xOOGcmktXC/4zNLChgYL0rhhycYiigq6g2XSw==
Received: from BN8PR16CA0010.namprd16.prod.outlook.com (2603:10b6:408:4c::23)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Thu, 17 Oct
 2024 07:19:41 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:4c:cafe::54) by BN8PR16CA0010.outlook.office365.com
 (2603:10b6:408:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 07:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 07:19:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:28 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:27 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 17 Oct 2024 00:19:27 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 2/3] nvkm: correctly calculate the available space of the GSP
 cmdq buffer
Date: Thu, 17 Oct 2024 00:19:21 -0700
Message-ID: <20241017071922.2518724-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017071922.2518724-1-zhiw@nvidia.com>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bee80b-6625-4224-441f-08dcee7c116e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uKjz8+1a4hL2XGR4Egxp8EIFdUX346eW99qhA7YUQbtNReTyURnUUNJUCOze?=
 =?us-ascii?Q?QhDj2LXMD2FXV+uk51+ySVS8IL/owYot3uk9ClaJajpueoF2g4a8bUmrrT9C?=
 =?us-ascii?Q?ncS5ZroKpmRrEnNtOWXNKs7TFvROviMLNXXQAiqkI5AIYVYq23JCyFCkU4+z?=
 =?us-ascii?Q?XdJ0MuzV/H0NA8x1xfBPjv5wvuaMixHi0x53a8i/edX/3us62sr0JZoHMt+g?=
 =?us-ascii?Q?YSvf9qB+RrIKHa8xXikGHxG4Uqqq90EFIQeOL47UVLYyz+n45gvwhPEzEjzu?=
 =?us-ascii?Q?q6tRplAlOsLT/ubBKsIVRBd58NH47yOS38eJbxS86fin0fJBCJBC/ziWKiSd?=
 =?us-ascii?Q?8jgRld2tcUFapgoG8XefLKkvS+EDrRAr1GoXbPtMn+8ZriFO5ocwf+SrdcFo?=
 =?us-ascii?Q?HHBMrP8T0xKEBBAmSFGJj8d0vw8wLQF/t9FJje7nn+RxcW/pDRR2Ot9iUk9G?=
 =?us-ascii?Q?3BSX2N5d9U4ADCky7gdDtM6HaT7ruxlW6PJfWIqWUTRuukm/kXrEV7bzv0Qo?=
 =?us-ascii?Q?l2a4pfbfDv7mlRMnlNpx4382n1HY7lCISr3RAnhuglAGUVnNB5CJYxa9mm62?=
 =?us-ascii?Q?bJeXyjxwIP1UAZWI9H51wcQlR9FZ5kF2ta9rumOzZvqntnlyTVA8Y+bDDKRn?=
 =?us-ascii?Q?Dw9BKGiugfjZnzQLqDs8Zg1S018t0rI8fMl5a462L0XdyEyIiU4STDZJWd7I?=
 =?us-ascii?Q?oaxST94nOxE1ospTdJ1OGysFuj6oLPsuN0Ia45jWmE4sXwHHlj0wcHOJjnjZ?=
 =?us-ascii?Q?NLYgNzaw2xf6y7kkdSC98jI++2ElkSTPeFUl5w8dJx5iOxbMPSv6KpvBC867?=
 =?us-ascii?Q?VMEfbnqiFCItltCYU23hboU2dbgYK3bAWvifvL6kXkJ9tx3CGjTqEftZDGC9?=
 =?us-ascii?Q?pqurNcq37UXf7e+BYcN5vVYG8Agp8eB8yXGgHpwvyVzkN1fxxI9p7aIUms4H?=
 =?us-ascii?Q?NSfvFt/UXcLvA1FQ9RW+5cYkS17HkpmGYJcXnrkhfXYlcgDsPmZKK6iorbPV?=
 =?us-ascii?Q?7HH7+Pp2OzS924AnhM2LBkxCBZM0XIOuvCynRZKJFl/SQ2d4fTUQ4jThsLcJ?=
 =?us-ascii?Q?T9QhzzGVBUnLx45ZUy6h2TtIn2Lw6bxmiV0bvBTpu8CbMyL0Sg2AfTcycS0k?=
 =?us-ascii?Q?MM4LI9/8K+B2G3uquSiARI8mSOxo2+E1L0175SayEnl2YFxXHICyB79xUZai?=
 =?us-ascii?Q?5wxxzkszk+z+WcyXgPikLcPxsqu7Ge9FAtFzLRSLQWo8XPTGL+ouInJ3r5DX?=
 =?us-ascii?Q?x41wjAT4ShUVEh5TQ1qmjUlw+Oqu83oQGWOAaFY20zQ6GZZWWcJjHw/NEf2P?=
 =?us-ascii?Q?o48YpWyDM9XhEqC03F2j0GZK8sSvNeulh2jsbo3egBYTLpqoYgFZRhz57fKH?=
 =?us-ascii?Q?3/tRRraRpEn1I2ThbpjzSq2XiPp5yurEzs/Ac4MI8FTYaMZkVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:19:41.3531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bee80b-6625-4224-441f-08dcee7c116e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207
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

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 736cde1987d0..50ae56013344 100644
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
@@ -195,7 +195,9 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
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

