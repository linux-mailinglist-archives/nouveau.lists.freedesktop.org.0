Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC2A1BC14
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D9B10EA09;
	Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uPt+kvp/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ECB10EA04
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoIEnuNbqapWbLJ4LD61ep/v+bLZdPoSZL0qC92DgOT7X0S6kGMDdpGjlhQNCJ6M1R5AUYUowxZRB/jdPNvTDdDI5wC8Qm5hoUmCS7QMe/JFnMbGkmgfME13cDcZi7P5o6DoQvAaVTGAShySDJzQcLJaBSoPX3r8KgChc+IwTpWRF0eGi7MDt8vOFQGeo3ZX5pPIL9bSYa30qZ5RrTEhcpOJ2gYkV+SVw9s1ci1mrJwbcxJwpRH9M64HSd6pWaZuaAv8CbImrXdggYZGkbellyHPyTJAf9/bYORtA6hn9kM1dfMrdzzsS+xIsCIlnkJNaBgNlq7i6P6H4WZd+lypVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0Y64xIQU0b35qAdORwWkif1zMmPSWo51Lcrwu3GZ3M=;
 b=YxsFL+76rbMqwyMYvCCUwwtpc3a3CpJYx962/7dV5JtSYuM2GMM0qP51HNlTmBFXsIKQK6TbfWiBJZLHgzRAyVjkNfDbWF0r/mj5esM8DJJi/1X2V1aVfH4FGqlLgSwPDF39Q47tLY3JjVksNDc0LIA2Fc9714xZh0cc8OWf0vGdeU0/BjZCZmRdZB87jgl6W4AOH8uojND+iSA8DyW3CdbjqrHSq1lE+ARg3KsXgneow4bcaB4vQ+DISvr2eXx3SUJNtlhb3Gb1KZ2QK8Glczb03iLYSFf1Ukuo6bQBy3tXfQtBmhY1hvOAWbpdSZ2H2jX9ZLQQhEWkkumTAmSXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0Y64xIQU0b35qAdORwWkif1zMmPSWo51Lcrwu3GZ3M=;
 b=uPt+kvp/iALX1oNHeqfhtdeMr47fJqApkoJv9eWC/1JFkfOHrxqfE4JdqfM0vV1jLyIxpG15lfBZClnNu1oAKz3tF4EjJNeHotDKCBHFb8OlJYLFpl5x0pEn/Qu871WuFJSZvhSIZzAe4YEYWMcyNjjL7tAUdq7vWMnWOu7b5pnYvF6wEyoSR+UIIojDPRzE/yIAMudrwKoTRg+37HC0LdE/5MnUksebWdifjObPVpNmCQEbJOK5BkxxHjkjoBBomlifXI77Fy37Jr+MRxb8jrhvOnQ2bDvBfpzpg8aPBPrFre5+RHMBrEVpGarNcHXHUDwLSIUmCLboCJgLAkrCQA==
Received: from BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34) by
 MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Fri, 24 Jan
 2025 18:30:45 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::86) by BYAPR01CA0021.outlook.office365.com
 (2603:10b6:a02:80::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Fri,
 24 Jan 2025 18:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:32 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:31 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:31 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 11/15] drm/nouveau: rename the variable "cmd" to "msg" in
 r535_gsp_cmdq_{get, push}()
Date: Fri, 24 Jan 2025 10:29:54 -0800
Message-ID: <20250124182958.2040494-12-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc510a8-79e5-490a-45d4-08dd3ca537af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H0knwMCsZulj5TuGAihpC5ZjJfgYF+LwON8fQi6huueXhCja45bTHNjliEL5?=
 =?us-ascii?Q?48Xvf8g5t7INcU86HIRZOi9r2bRWF8AblyMTVWh49ecInY6qCOqgO11skHkm?=
 =?us-ascii?Q?I7xQOsxBtRllNBNnx5dwUkdrd9EOwsRT2BoYrs3OIxIgBFK3Kb7eAljDJTRR?=
 =?us-ascii?Q?Rz6O0n20XHB5FlRFWjdmXRUB+pO3SF7xt8Qe5vzbLCtAp+2nd8AzF47P3CYc?=
 =?us-ascii?Q?ZmP6qvksrsLqm03NbOWEKpHVdrqgUOXibPT0cFxaeOhJcQF9ZUFYWmj2Fo48?=
 =?us-ascii?Q?LLCM5Ag5ZpMgZTuIlibG3VfcrbCNKkYV3EmUdgTkg3TKmzxxiCUhmjPGj2Bn?=
 =?us-ascii?Q?QDYpqs3w8v64rvDLdz4U07eXFYZu5lVQUf8+AzXgT//hv6Db8TJRLeycsua8?=
 =?us-ascii?Q?B9TXs0G/GSj2uH4f9W4IRJuRq3eBejqojEGLbbZdn+PE9Gv3/IQOdkyaVHZZ?=
 =?us-ascii?Q?VVj2OBUuO0Qsj+IPWGp6LIF796h79V3G74GRbYJK8/NLYz2COADMFuEaQGTI?=
 =?us-ascii?Q?iOO/KLvod41ZfvGzCz7UK2xADYUbSiDj9wAf7+MvnJ7tSyKq8u6oWTcGXX6Z?=
 =?us-ascii?Q?R4liBwJENr0qzUtVVgua/WXeydNzyxtMkx+IYMHSpJ+Q03+0WDQzMUa8ACQc?=
 =?us-ascii?Q?147E39/mWsbzUIlwnzc58w23wpQnJ/AJXQoTCFrANMiNX+ZzDYjtUA3jn8lF?=
 =?us-ascii?Q?JpeH2PuNwhdn3Mc8VjpBgprYgLXK2RxwNLyzSjkzdoBkhm01XZlbQdOGA/n+?=
 =?us-ascii?Q?FuPL1tCeZc9KrlT1W1r/8aeCfb9oJ/gHMkfG+ZoxMj94O/UPpdt9IPkse//I?=
 =?us-ascii?Q?KLqwQ2x2mGZq0JtqYV1pLtYN50yMqesBvA7Sl7NkeSgJ3VUsTFBoGWfL4BSi?=
 =?us-ascii?Q?W6e3Ei69b3kSwTzFtzJ7QgoPrC7jCtuA4/GakyIUFdvUi3UbayW4ii/dVKnm?=
 =?us-ascii?Q?xUUS4CowhEIE7IS/cZQRpzYZx06nm6VnZ0c9rO97eLlHGRxZZUea4TeoA+eY?=
 =?us-ascii?Q?TcqjZMrXh24TRzSOAKxvZtcpabg19/KnBuBjT/AIY9mE8bh+oT7/TE9feemb?=
 =?us-ascii?Q?zbTUqZwBnZcAGPPiyRSGxN4lMmFq7oRotJPseFObA/OqbQr+D0bGVUfJq+Ll?=
 =?us-ascii?Q?b9z2xz3P5CVesAchkBFh5ZZ4RDGflzy5QRXVZgBN0oEHxgkzjpsfuKGg+zli?=
 =?us-ascii?Q?2+G8XY/SG4brTDLhH29jiaFmSTKWbzRUOvjhwZiuysQqtCTb8LJIyHL4qGAk?=
 =?us-ascii?Q?oubighvb1Res2U1pu0joCldPhC1i8xYH41YnVBplQIFDuQVQJDCDKMJAfkuB?=
 =?us-ascii?Q?d3f4wsMb7HPL2zQF3lRSuWJFASr3i0O0l5atMQ5dI0JfOSZayQVmIC2oWRDj?=
 =?us-ascii?Q?D26M6VEJBti8XTV91pO04FuXxQmJwhYdwjfHJxzUsArSlU72wkmnvXFn4wSJ?=
 =?us-ascii?Q?3vzDc+758seamr/B9OBPwxjf+LoQuOfgAe1Nx0Mtwmz0/yAJ60/1dziqOh1X?=
 =?us-ascii?Q?Ph4cQezSBp6s668=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:45.7670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc510a8-79e5-490a-45d4-08dd3ca537af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952
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
index 3b1c648aad46..864bacbd0ab9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -218,10 +218,10 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
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
@@ -231,15 +231,15 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
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
 	do {
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

