Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766FA2CAA2
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C05510EB9B;
	Fri,  7 Feb 2025 17:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a9sfqQzo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970610EB9A
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTlLYmxmTI4jQ+gpFzdO96En0rE886RVGUjhqjqMGBbBXCBlDYbPtLHEwTWyPRYJ7d6im1RRzQsvymnIWfLoPV+zca7yNVPGfdtUlj6qQeKzB8usEy5r/VTmD71BMSjyFw2knT7oUcK1eXgtS47l9wy9qVSWoWQFdYeziaGy3Rr5G0DEzsE004sF+PlwPTgA3mJBddqEFVz2GFKw3993MluFVN3HB6bOvGhLpOoUz7DdpNArk9AAymXIQm2T5wDfB5udnyG7d6ji+nac42n9L6VNqaWFbHW5WfLRxNKvmvY5kJnTGGQb0XGml9uWAKwxzSruwbGXMdV7d/BWTsnGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhE1IFDLFvqsd4JmSjfk2YE2cQKZ1K5sTo8PwsCJcno=;
 b=radHL0m/qUuvuRWgH02WX105DpJuD1A6PAm9bFPemRJvKZhDqEjzl0+raZ2KhvwXknLB9eSB6c2NqedoDKCPpxPId/m1OG4tRyCiOE7x1vHBwtRmCNhVqf6BNYx/zgw9m8HV41M1+2714FQaoxSLvftc/+2MSb2FcEGfC2mFC1qSWHtRg7QXm6JaYEtsIRi0ByaXsITfnEKvugwJtMcHD0rtcIfO3vgqeAK7oAHebOzSmZt6shwWer+ooFgM4fIuQXFlvx4BhQTjZZPKMMAaB3GyukgUAPyIU3LQ5GnQAuGml1bMIvMKaFQcd7ghxDE9fgAvbvTmsYrRAkoiLvnqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhE1IFDLFvqsd4JmSjfk2YE2cQKZ1K5sTo8PwsCJcno=;
 b=a9sfqQzoPZ4V89Mn5EZxBhA8HfU/CkmLE2j+NmGHWTEeLzhifij/+NlGYkord+LjJgiSz71zaSD2TmwTlmLHF1s3omWu3FfQX3vbR4R2yYwRK3pPQJs21fUOnGYt26NfPvjyPQ/SeNC9NCwpSpedOvSIuJGElFzDH+GWDQC7HltXdA4WaDm3H/uuf954fERZKnqUoL2Clf1c60y8KBaowQOeN4bJeCfGl1Fw3Ho9zDRLKVovZf1SdzjBvF9cD7ORV6nKbFv1I1tdbNKz5Iro4jnuXuoWrISJoZlRyeKBj9Lv28LEDURn8+jpOu2KKUAjX/6K5JQtl22E775M98ctqw==
Received: from SA9PR13CA0139.namprd13.prod.outlook.com (2603:10b6:806:27::24)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 17:58:38 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::a2) by SA9PR13CA0139.outlook.office365.com
 (2603:10b6:806:27::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.8 via Frontend Transport; Fri, 7
 Feb 2025 17:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:22 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:21 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:21 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 4/5] drm/nouveau/nvkm: use the new policy for
 NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY
Date: Fri, 7 Feb 2025 17:58:05 +0000
Message-ID: <20250207175806.78051-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SJ0PR12MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: bb560dea-7add-4cd7-f325-08dd47a10c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9UxxIu70EJArMj3s6fHLIm7/YnAtkTaQWoDvmZriow3gO13Zme+FeJcokr4Y?=
 =?us-ascii?Q?xvD4ts4+eggxiKHgQfHWfM0HbCekLy4jSOk5r60XLhSjbrWb9QDi6KFNrdrv?=
 =?us-ascii?Q?bNEFkX6pMO1DL51fcjn7ICSuVjFLaCAlhdncoggTT+MmjwPYcM8ud2LeMnq0?=
 =?us-ascii?Q?/Dctyi2m4hMBqbtkFojJV9JQS6wQ0bLOjYeSv3v7J+YBBk1oobc9lIwWIcNq?=
 =?us-ascii?Q?CAbvWG2L7fTjCppFkC0J3bU87UTdwnbZag0mNg4yWVv6KdYXin0diua1Prke?=
 =?us-ascii?Q?bn3gItZW1bhkBcefzosNAmdUWrUcx+6LBZ/QmSTKIfs8w1U8+aCjkJ/rNv8V?=
 =?us-ascii?Q?9mnuYpZFEZ9j2AbUCcr7HYLa+bR1f5ASM8TvjqpaGkf8Rn0E7xkjlBYP+nQY?=
 =?us-ascii?Q?EhQI4Bx3v7hnwxjdpbgXJRC9ne7rNNNDi2hTYn3qLfpXDWYFf2PAGEgbEWe6?=
 =?us-ascii?Q?CvQMuPCodXC9TNbb+kSnu1oKulkwDC89kAU+C6HRn2lbiH339xhWBMh68YMR?=
 =?us-ascii?Q?AXjcz6VFph2dWsC1bqIP8tMUiu5pTR0lVULnSmrtvmFbxB3HSgGerMAjIgTG?=
 =?us-ascii?Q?/GeMY8pp+jOO/Yd7WZ7/MjLiTlq3uK0Y4kX78LtmikpPuQihmlmrDnC1Bwlx?=
 =?us-ascii?Q?J6AnYxbNnQ6ra7uiWns4AiiLVG2Vb7kTW4+dc8GbL9ZQhAdoK9su4GrgyBnG?=
 =?us-ascii?Q?49tslwYpiI92Ntxz6WcLox2n8JZxFZbJmsE5JLvWrkkiHm3h5GNp7DzSbqG+?=
 =?us-ascii?Q?rrhsgSUgOonEgrOr5sG5OkD49orgdG+rhDMopXjjxqWxWzJTzgoe8id7h5TX?=
 =?us-ascii?Q?4XIab1GCf2RBLyfLQQZTQEr3B6rZjwPQgXMB7EOY/csAAv2kKwW43ldntOrH?=
 =?us-ascii?Q?SutHgfEazj1z+fJ4H9WXPyXdo5o0//GUOMfBCjVhssaFkHJwvLJ1qJ6VEJ8e?=
 =?us-ascii?Q?r57WRPYRxAM1uxoe3SnWpYdYHpG64dv+EWz5tS2kAflWJL2Nj2KwizjFgZRU?=
 =?us-ascii?Q?/ZyL51/ItsfhnAG/RDoS9yqhnCObRhN8rcPBaagPWnJOl4pNeJ0Y4wRn2sm4?=
 =?us-ascii?Q?44znxo21W8kgVDnQU5PHA1e/62K7AOOg2SJU6WvT342TIlY5IyM+vaCZ/Qsw?=
 =?us-ascii?Q?KVXhqLXfg098E6rMbLH2+VV05IL2V6Wu5AJCwFEoL4sgY/BymcVSoqagaJCv?=
 =?us-ascii?Q?cbHsHill4sJbunprps09hMeLZ/iHAnloIS7DSsTNOcANKYuQZKIunthnN7IB?=
 =?us-ascii?Q?BtBmg/p4r89W9edPgGbN/VGdZ7+PfDbGTwN68Co7GG12I9ytLY+8jWOEE6UT?=
 =?us-ascii?Q?zZy/tRLfkwpVvSOoI87JoCf6j0YbWjp8QOlmnzSrQeFO6l92m7m3sGVZdzzL?=
 =?us-ascii?Q?N0WQaPfJtxFoc5KuLcVse969nhnypOfpzKd98yHyVxpRicMcSXPDeXIRX0zO?=
 =?us-ascii?Q?Mh2VBX1vkSynNDFyyvi1E/ZIEhZtsT99d1wNmlgVVk1HI3wF5QXyXjZLm2rq?=
 =?us-ascii?Q?EdYTVBA9CDQ/rSw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:38.0549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb560dea-7add-4cd7-f325-08dd47a10c86
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758
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

NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY is a large GSP RPC command. The actual
required policy is NVKM_GSP_RPC_REPLY_POLL. This can be observed from the
dump of the GSP message queue. After the large GSP RPC command is issued,
GSP will write only an empty RPC header in the queue as the reply.

Without this change, the policy "receiving the entire message" is used
for NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY. This causes the timeout of receiving
the returned GSP message in the suspend/resume path:

[   80.683646] r535_gsp_rpc_push() - 962: rpc->function 4 gsp_rpc_len 0 payload_size 2c630 max_payload_size ffb0
[   80.704222] r535_gsp_msg_recv() - 501: recv rpc->fn 4, rpc->length 20
[   81.014566] mlx5_core 0000:01:00.1: E-Switch: Disable: mode(LEGACY), nvfs(0), necvfs(0), active vports(0)
[   83.384132] mlx5_core 0000:01:00.0: E-Switch: Disable: mode(LEGACY), nvfs(0), necvfs(0), active vports(0)
[  103.784986] ------------[ cut here ]------------
[  103.789620] WARNING: CPU: 6 PID: 246 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:201 r535_gsp_msgq_wait+0x8c/0xa0 [nouveau]
[  103.801441]  libcxgbi(E) libcxgb(E) qla4xxx(E) iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi(E) scsi_transport_iscsi(E) fuse(E)
[  103.903122] CPU: 6 UID: 0 PID: 246 Comm: kworker/u130:30 Tainted: G            E      6.14.0-rc1+ #1
[  103.912254] Tainted: [E]=UNSIGNED_MODULE
[  103.916193] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS L3.12E 09/06/2022
[  103.923940] Workqueue: async async_run_entry_fn
[  103.928486] RIP: 0010:r535_gsp_msgq_wait+0x8c/0xa0 [nouveau]
[  103.934372] Code: 00 00 49 8b 94 24 e8 08 00 00 8b 12 29 ea 01 d0 0f 43 c2 39 d8 72 c8 41 8b 55 00 85 d2 74 0b 5b 5d 41 5c 41 5d e9 cf 0c 43 e6 <0f> 0b b8 92 ff ff ff 5b 5d 41 5c 41 5d e9 bd 0c 43 e6 66 90 90 90
[  103.953140] RSP: 0018:ffffb81a40baf970 EFLAGS: 00010246
[  103.958381] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 00000000009651f0
[  103.965524] RDX: 0000000000000000 RSI: 0000000055555554 RDI: ffffb81a40baf8c0
[  103.972663] RBP: 000000000000001a R08: 0000000000000001 R09: 0000000000000000
[  103.979805] R10: 0000000000000000 R11: ffff97f70e33424c R12: ffff97d848d40000
[  103.986948] R13: ffffb81a40baf9fc R14: ffff97d848d40000 R15: 0000000000000000
[  103.994090] FS:  0000000000000000(0000) GS:ffff97f70e300000(0000) knlGS:0000000000000000
[  104.002187] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  104.007947] CR2: 00000a8bdc3b8000 CR3: 000000016e738001 CR4: 0000000000770ef0
[  104.015087] PKRU: 55555554
[  104.017809] Call Trace:
[  104.020268]  <TASK>
[  104.022382]  ? __warn+0x84/0x130
[  104.025627]  ? r535_gsp_msgq_wait+0x8c/0xa0 [nouveau]
[  104.030889]  ? report_bug+0x18a/0x1a0
[  104.034561]  ? handle_bug+0x53/0x90
[  104.038061]  ? exc_invalid_op+0x14/0x70
[  104.041910]  ? asm_exc_invalid_op+0x16/0x20
[  104.046109]  ? r535_gsp_msgq_wait+0x8c/0xa0 [nouveau]
[  104.051351]  r535_gsp_msgq_recv+0x13c/0x1e0 [nouveau]
[  104.056588]  r535_gsp_msg_recv+0xa9/0x260 [nouveau]
[  104.061654]  r535_gsp_rpc_push+0x12c/0x1b0 [nouveau]
[  104.066805]  fbsr_memlist+0x13a/0x1c0 [nouveau]
[  104.071564]  r535_instmem_suspend+0x3e4/0x720 [nouveau]
[  104.076997]  ? srso_alias_return_thunk+0x5/0xfbef5
[  104.081807]  ? prb_read+0x6f/0x150
[  104.085225]  ? nvkm_instmem_fini+0x25/0x60 [nouveau]
[  104.090383]  nvkm_instmem_fini+0x25/0x60 [nouveau]
[  104.095371]  nvkm_subdev_fini+0x66/0x150 [nouveau]
[  104.100353]  ? down_write+0xe/0x60
[  104.103765]  nvkm_device_fini+0x94/0x1e0 [nouveau]
[  104.108808]  nvkm_udevice_fini+0x4f/0x70 [nouveau]
[  104.113831]  nvkm_object_fini+0xb8/0x240 [nouveau]
[  104.118814]  nvkm_object_fini+0x6e/0x240 [nouveau]
[  104.123788]  nouveau_do_suspend+0xf9/0x210 [nouveau]
[  104.128997]  nouveau_pmops_suspend+0x39/0x80 [nouveau]

Use the new policy NVKM_GSP_RPC_REPLY_POLL on the GSP RPC command
NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY.

Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
index 2789efe9c100..35ba1798ee6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
@@ -105,7 +105,7 @@ fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target
 			rpc->pteDesc.pte_pde[i].pte = (phys >> 12) + i;
 	}
 
-	ret = nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
+	ret = nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_POLL);
 	if (ret)
 		return ret;
 
-- 
2.43.5

