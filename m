Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49819B76D0
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F4D10E844;
	Thu, 31 Oct 2024 08:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOKNLNGy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92C10E843
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXbdtAuMyQfTLjQvpII+rVEdS8R3BP7vcmqqXkIyXF5OwfpdIFfucNpyhNRIz7XxSJMZ25P4IDEPfsOhM/dek76Qfdpvv6vktVvHQOvQdqEf74Z2lnA1sdV3Jjo3hxlt54Q3zMYL2t6P2fz2I8oVNOBFqfJQ2ixCeVk5pWJqXKBxVL24ozjWZzeW9vrj0Fc2Df4F8NIwMdfDjgVkP0dBB0y65SSLAFVz5R9cNMpP+f2I41YZHXanEfRvyscNc2nolyKJEVDxa34ZwRj/MzfrsxzoOvPKWkrU+rBlTtkV7AiZL89MKoadckvHjPIDQxctvN1BfYkPk1eXAa6L7fqEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58zgVm3CZkT1v3WtwBmnPYVSSswrMdDf2K+cRX6SRvw=;
 b=y2bvp7oNsOO/Qm6heSVC81PQZMNDaNPiPANXow25XKQ2Dh7DDJ7Z7FqEsNJs+T9FaxxLgilbEP/PsUDvzCf/GNtiP6DJ5SL8RYOWKmdye4G10MEY5A+/kzcDX9rDfvrKLv71VauOs2QbFCQNOKHuEZw/43j6dul2On8z6SbBTXmOpS+P2tl1ootLT0fXpfqcGVdiq1UAHNRZsESzpiowDg+Lutdc5U4rjXq09xUDmQ2WXJjNwpejsoZfP41id6ffPvu+G/H+w8b+sa5mKf1Lk96ika6J9GAwNUhepu6PjgEw+yPR6sRo0dZ6rbRsWcEHGomCMwd8lccJTif0xNLABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58zgVm3CZkT1v3WtwBmnPYVSSswrMdDf2K+cRX6SRvw=;
 b=EOKNLNGymGT0sAnDxCuf7ycWPAv0Vpv6PFA8lPf6bgT/P73VZ+f8R7VETwKGywYlB6CZN9UIu0V9B8GcLBeOSpIz3mq5Qtm/LyxC6JlAgkkSxD06do10nsO8EI9T2bAM7LTriPvsW1rdcsMs0ExwAPT9KzyASyJyxe7XzpAlmmvC/XoSNCdC/Gjz2Pc2XfNGYgXk4FHGJDnWBVwbxnzC0ofnUojaA1uCvBne8IRDj6YDcJUpkgUaGhdgV6q3f/BNdvM3w6WK0BX0GnLFu7rYaS/F5mdurX1aKDcXx6iJ1yznDBP8s/0J6jQRHrtwpUbwfyo/xquR0XtNb4HKFGivmQ==
Received: from BL1PR13CA0305.namprd13.prod.outlook.com (2603:10b6:208:2c1::10)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:28 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::33) by BL1PR13CA0305.outlook.office365.com
 (2603:10b6:208:2c1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.8 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:27 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:14 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:14 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:14 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 11/15] nvkm: rename the variable "cmd" to "msg" in
 r535_gsp_cmdq_{get, push}()
Date: Thu, 31 Oct 2024 01:52:46 -0700
Message-ID: <20241031085250.2941482-12-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6181724e-5125-4dc6-1d35-08dcf9897cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V3CCit9Nms6vBJpMxLabT0MMH1b3a7PKFw04oz1Zl1S9dVtD+n9+VUJQavAN?=
 =?us-ascii?Q?zYc7F4LIEBg56O/bb70c70e5RNZ6AEkcegd0AGiR3NDx/oIK5OilybgOts39?=
 =?us-ascii?Q?KbgZ3m1hORHxJmNO01Bw92oxS19+H4SvwuXu3oZRkZR7LoaEvlvCecvh1Axl?=
 =?us-ascii?Q?QLXnYqIyQ7N+nah3jIhLoW+YrOyJ+w4GMb4c4XaMGJd5orYGL5+0lRpIlsiJ?=
 =?us-ascii?Q?wXdUyoZ8MmW3gMxDN6GNnmW4qLAt8PIeVtRA7pIdxSjrWWnMBN9FpPszJw6P?=
 =?us-ascii?Q?El2Lr/9PbkkUZpKIYhM9l53mL18B/6KK5F3whgNn0pUjSlSPF4DZAWGHJmPy?=
 =?us-ascii?Q?fmbnubGeUK6bBjiMQGnj8w93f8FKpKEZBGPRjRHUWTs1ilWHMmxIRF8w2XwK?=
 =?us-ascii?Q?hrXMUqdoECQoQ9I6mAfQiQrW0HU02El8NwKF/l4ybpvIw8Y70hubzXHzIGFP?=
 =?us-ascii?Q?1f15BgakL+/YyQWvXfxGarUHm9AMTXO7k4An6CH1UcI0/sD4+JtJMsa9LeDT?=
 =?us-ascii?Q?rpzosmZ9DJCFa/ercynoEiieMwUUrhqDAxzPJgima5b60nio5ocASgWfmViZ?=
 =?us-ascii?Q?eELtBB5xWPPhS3i0hexSH0BeiPoGAfdF36nxoNZXBv+clgAO7vYiMqh2PEXX?=
 =?us-ascii?Q?XqbGMhsZoqMSQLEdWatnKbAiRaQ17jqrmJlgPiex3XElvp7HlQ26IAumCRiU?=
 =?us-ascii?Q?Ej0TK+1dXSgR8iuaUOtTRGSBo1T0h8o14c5uN70eKIvwPCjF0a6LD2rxYPGg?=
 =?us-ascii?Q?1rqy0iLjmSZrdYjlFFbizcE2K8vLTRpGKWlaXmRG7a7mt3PcUE5jjqKRZ64Y?=
 =?us-ascii?Q?7BQQW5OGtNw33tbJCpmgo3uHvP0c6ujS4Gu89Z8XsHuf8WqyhLMNiOe7GiXv?=
 =?us-ascii?Q?KCmjNFDBI/emkcvTGzbnEbL1KGT4O1wHWQ61Skc11wdUSw1leQ1RwYRKGTDC?=
 =?us-ascii?Q?2qHgrpTyExaTMocfPVXkL7xeFJNdcRRT854t8ZV5ok+M2aHu0agTn4PZHFsU?=
 =?us-ascii?Q?GAbJ2IYqjwSMCWNyvpwQkBk1wXy3UhrPPW7CQVimeGdKbUnnNj42bOlhK5jo?=
 =?us-ascii?Q?pgiRcQbiMaPLnSVDCVVWtXSXXvU3e0js2dRY9A8KoHFXzeleO6RfoGRVX3uw?=
 =?us-ascii?Q?rDZSCYs3XIPTPw5szNu4+R+jugwoyv0koWO/kfrBDR2ZTQiHHIg5OajyEMoq?=
 =?us-ascii?Q?SxaByy5on8S8RHPVk/0yMSV1gytDYVyf4mNA2BS0ZGrNyBkF3WEC+xbKsJQV?=
 =?us-ascii?Q?27hddVohkJV1KvC6F8TR69uCQeLHveMhv/8a1F7ZCH+CwQWaBV+GPvGzQ7Ua?=
 =?us-ascii?Q?hKPjqM64/82eOeODiWv6yaIzjrHIaAc6SKqITiOXRRX65SPx1v8PDcBHv96Y?=
 =?us-ascii?Q?TFp0E82gVD6JfY9CvB53lOFMhK3wfRbAC/mBoebHk9TqgKwDqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:27.7061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6181724e-5125-4dc6-1d35-08dcf9897cc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718
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

Refine the name to align with the terms in the kernel doc.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index c4164d79240c..8b507858a63d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -216,10 +216,10 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 static int
 r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
-	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
+	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
 	struct r535_gsp_msg *cqe;
-	u32 gsp_rpc_len = cmd->checksum;
-	u64 *ptr = (void *)cmd;
+	u32 gsp_rpc_len = msg->checksum;
+	u64 *ptr = (void *)msg;
 	u64 *end;
 	u64 csum = 0;
 	int free, time = 1000000;
@@ -229,15 +229,15 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 	len = ALIGN(GSP_MSG_HDR_SIZE + gsp_rpc_len, GSP_PAGE_SIZE);
 
 	end = (u64 *)((char *)ptr + len);
-	cmd->pad = 0;
-	cmd->checksum = 0;
-	cmd->sequence = gsp->cmdq.seq++;
-	cmd->elem_count = DIV_ROUND_UP(len, 0x1000);
+	msg->pad = 0;
+	msg->checksum = 0;
+	msg->sequence = gsp->cmdq.seq++;
+	msg->elem_count = DIV_ROUND_UP(len, 0x1000);
 
 	while (ptr < end)
 		csum ^= *ptr++;
 
-	cmd->checksum = upper_32_bits(csum) ^ lower_32_bits(csum);
+	msg->checksum = upper_32_bits(csum) ^ lower_32_bits(csum);
 
 	wptr = *gsp->cmdq.wptr;
 
@@ -254,7 +254,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 		} while(--time);
 
 		if (WARN_ON(!time)) {
-			kvfree(cmd);
+			kvfree(msg);
 			return -ETIMEDOUT;
 		}
 
@@ -262,7 +262,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 		step = min_t(u32, free, (gsp->cmdq.cnt - wptr));
 		size = min_t(u32, len, step * GSP_PAGE_SIZE);
 
-		memcpy(cqe, (u8 *)cmd + off, size);
+		memcpy(cqe, (u8 *)msg + off, size);
 
 		wptr += DIV_ROUND_UP(size, 0x1000);
 		if (wptr == gsp->cmdq.cnt)
@@ -279,23 +279,23 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 
 	nvkm_falcon_wr32(&gsp->falcon, 0xc00, 0x00000000);
 
-	kvfree(cmd);
+	kvfree(msg);
 	return 0;
 }
 
 static void *
 r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
 {
-	struct r535_gsp_msg *cmd;
+	struct r535_gsp_msg *msg;
 	u32 size = GSP_MSG_HDR_SIZE + gsp_rpc_len;
 
 	size = ALIGN(size, GSP_MSG_MIN_SIZE);
-	cmd = kvzalloc(size, GFP_KERNEL);
-	if (!cmd)
+	msg = kvzalloc(size, GFP_KERNEL);
+	if (!msg)
 		return ERR_PTR(-ENOMEM);
 
-	cmd->checksum = gsp_rpc_len;
-	return cmd->data;
+	msg->checksum = gsp_rpc_len;
+	return msg->data;
 }
 
 struct nvfw_gsp_rpc {
-- 
2.34.1

