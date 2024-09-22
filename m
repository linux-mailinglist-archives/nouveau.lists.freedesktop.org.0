Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C009897D3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22AF10E376;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FQrl5Ql9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59D10E0BA
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 13:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2yIy4Ongg/zSsoJCJgFFGfJ/TiB8Mpn5SoFU72vntIkrtBIiCcq9tHc7HeKb+7dO440bpK/YSgkSzIVgYWmCJzT0Xl1iu7dsSuw8ug0DxpqQTOuHQc90DxGsNJm3HPmH0540vOG7Zi0TCslTI7m+VZeVArluq//Bf+8Kcs2NpzXzLzaupoguI7DO5Uzmh8i0Acm3AQj4GW+XLH8e/3bpflB9SRmzkit8qpGbewMEDoqED1uH4g0X4tcUjRWNNxPoWSwXLuL8gLGzWA1kSMeQQmSuq8Rj4yOqKmL39fGXC5WyRziCAqIR88aUDnHplm4TocuHS+3Kz/PYklb7d3HhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbmIKtuNTiP4TloH0LyZq8GVVjqn/Bye7avZ+rfA3Yg=;
 b=vs1lRUU2YCs1znVnQ80K6iwYAbuNmzJoXQEqq63Ygi6uRKNfnpX7oRCgNDzopCQ4ahoRm2BQnRIi158Fnndm+llr9nwHYtB94lYBpxbHIKEDVRhWOODRmzOegJinT9TXIDb+UF3UfBWtygi+QSVMSoIdd9f64n4wPMv0kU47g5MwiynSxgjKwYLTp1PvRWHT+WSe1D53O79dbVcNZ7CpDfji15fIj54TQpyiYDasCuvxtOwU87kG5zU5VCph2jmhPWpJODBjFOVvmiPo7i5WeuV/fadK5VtjLgFmzW9P1YzrvnqcaVKg/g4NnMx331bVaCSOMK6sHMdZpyj7jOxdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbmIKtuNTiP4TloH0LyZq8GVVjqn/Bye7avZ+rfA3Yg=;
 b=FQrl5Ql9EdX5OVKVHJFEAr76JtiQV9rgb86nNoeQ2e2BLpRIU//6CsdKcpeA6u2Q9LQunA7BVSVBRaRB4X8Fm8+Ha2hHNSsnoVWW2IPJG40jaMY2lsQ+ZVarfW2Zb+GHqBxJkC91SYUZyvbSHRxmsGG2Qm1ecrxq18iVDrh9aIfqzXuNhU87m+PxudGwkJx08k5RKDRf96e5afxo23LHqJVOk9pYRrBBZLBcinPIbWnVqzizIr8d8hS1PKqR9UOht7x2rFS6PVXAYjXVC3Bz9HpAhViFSDswAr3ypGb1FCr8P7HgmZQLKdu3Tx3zU+KeG8corPad9GjHH7PPseCO0A==
Received: from BLAPR03CA0037.namprd03.prod.outlook.com (2603:10b6:208:32d::12)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 13:07:32 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::5a) by BLAPR03CA0037.outlook.office365.com
 (2603:10b6:208:32d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Sun, 22 Sep 2024 13:07:31 +0000
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
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 13:07:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:20 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:19 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 06:07:19 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 3/3] nvkm/gsp: handle the return of large RPC
Date: Sun, 22 Sep 2024 06:07:09 -0700
Message-ID: <20240922130709.1946893-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922130709.1946893-1-zhiw@nvidia.com>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: db53c727-7e97-4ce3-f867-08dcdb07849e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AGwfChXkdgLI/5v6moGso2JS9rVLl8N9AhKrLVeUoJCk7g7uJIhKxnT+YB5i?=
 =?us-ascii?Q?0UsuFExzycvOv5+rhUnqQtP0+mOM49wujY0x+D3Ori3SGT0nfj7u299siZWW?=
 =?us-ascii?Q?utMW+UvLCPZvjl0bUOA0UhNay9Q+OQUn7iEhxIV3EwTDdTZ+KIpwf7DW6pYQ?=
 =?us-ascii?Q?yyvE1LfFhBSgZ7p9FR73mz2eOEFZujtYDd9ROEDoenZx0iNfleiuFdCdmvjb?=
 =?us-ascii?Q?P89k8FzIkSUYkcPMVSvxUAB1L+0sN9/dJ9M+Lld55og80XyP3pMzFVtkS+Lc?=
 =?us-ascii?Q?+UlZ788LfRiusLwF9MJLGk7pV2VvjNh1GDshJ7iDZMqFVbUIkREJAIcV+gyr?=
 =?us-ascii?Q?1eiinEi6+9zS5FQfEs6Nrw/fncFXOOgFZO7qGAzPSwjGo28wC0QUNtfuuiwv?=
 =?us-ascii?Q?99YGDBVb8EMxfoREZ9aE5kqyOiciDqAMPMKPCzrE32xnLg4qHo6I6Ebt8R2O?=
 =?us-ascii?Q?6NQ7kBBEneNLtqdMGBZl5ZRv4WV7P7k6qG5YxfsvuolpdC8kTrmkrvDtfQkf?=
 =?us-ascii?Q?DMYTA83luj34s9cCQVv1MUiPXoYo37wrC1UZm8ofx7qwpxKQj7TMRmNycNwp?=
 =?us-ascii?Q?3ibfyrTfWftr1jNh4hLacNKQaNAyoWgt/IBKJg1t3j7+QAXMPHSvV5Wcy6zq?=
 =?us-ascii?Q?DWjOOoWx92DoveHtTuEBC6l4Zq0ZwtDE079wIZ2wdTcWAOEdpVrSefGFWjrr?=
 =?us-ascii?Q?rsMHzvC+exX40OQET+5IEzbLn+u950EquKI9AbZ0UJojPSdmaSFOFUfZEuva?=
 =?us-ascii?Q?0qkkrpoAibCxPIvdevmtqEMusUC/KBl2CKMNuwUjNPdsWQKMvQAehbeFviBw?=
 =?us-ascii?Q?Ogbo0Db+y/8tvdhrdn+ub72Jk0dcGccmVchBmn1NmVmjls10xGHDqj280VsM?=
 =?us-ascii?Q?b/qmYe4pLBIl5MnW2yKFoEjZTui8wUsLqvAjYHaA47UVFG+nYPWwHuLgthKH?=
 =?us-ascii?Q?1SzO4enW/+fTSWS/ipMkK7h87sM3Qr3qkHOUD5rpamiI3Sny/5oQ+nP6al/I?=
 =?us-ascii?Q?sy+/IUBFUfB+aUiANkWtjIYEOEqRVpNzOGfc0ewKm4na/5KqfJH1fYmhbztr?=
 =?us-ascii?Q?6tFjBS3TS1/6M/qFCyeSezHihZOT3qGgKAJGafVC4C89PHKSXljIeZizOHtg?=
 =?us-ascii?Q?l/6+/ZXRSUOVctZuNyLsopA/3mOXCvmWVwoOwPX7VGSsybGfEten1kx4EMzi?=
 =?us-ascii?Q?JUL2xivKBcdcTqWtGDUVD9WeBPDenSLKVT5JOtrEn4gZI+QVNA4Us2oBmDMJ?=
 =?us-ascii?Q?lpPz68z/gnyS8kWhgPpvH2VwoNHjYncvVRbAODZBdrEtDBv8gpxiaNOu5c4x?=
 =?us-ascii?Q?o0SeGriB74cpwG+2Mcdy3z+RcCzCPBfI2MAzj7FoxyL+3Jp9pTrndupkUq1z?=
 =?us-ascii?Q?7emBxhCqFHKlnwOUcNy+werODMYWRjv3wMUtmxi13T2MNVbbhFEV7dFB1Q1/?=
 =?us-ascii?Q?euFCA5g111bB6OGHMtg2FtA1jNIRQOY9?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 13:07:31.4157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db53c727-7e97-4ce3-f867-08dcdb07849e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
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

The max RPC size is 16 pages (including the RPC header). To send an RPC
larger than 16 pages, nvkm should split it into multiple RPCs and send
it accordingly. The first of the split RPCs has the expected function
number, while the rest of the split RPCs are sent with function number
as NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD. GSP will consume the split
RPCs from the cmdq and always write the result back to the msgq. The
result is also formed as split RPCs.

However, NVKM is able to send split RPC when dealing with large RPCs,
but totally not aware of handling the return of the large RPCs, which
are the split RPC in the msgq. Thus, it keeps dumping the unknown RPC
messages from msgq, which is actually CONTINUATION_RECORD message,
discard them unexpectly. Thus, the caller will not be able to consume
the result from GSP.

Introduce the handling of split RPCs on the msgq path. Slightly
re-factor the low-level part of receiving RPCs from the msgq, RPC
vehicle handling to merge the split RPCs back into a large RPC before
handling it to the upper level. Thus, the upper-level of RPC APIs don't
need to be heavily changed.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 172 ++++++++++++------
 1 file changed, 121 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 49721935013b..ec4ab732997a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -72,6 +72,21 @@ struct r535_gsp_msg {
 
 #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
 
+struct nvfw_gsp_rpc {
+	u32 header_version;
+	u32 signature;
+	u32 length;
+	u32 function;
+	u32 rpc_result;
+	u32 rpc_result_private;
+	u32 sequence;
+	union {
+		u32 spare;
+		u32 cpuRmGfid;
+	};
+	u8  data[];
+};
+
 static int
 r535_rpc_status_to_errno(uint32_t rpc_status)
 {
@@ -87,12 +102,12 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 }
 
 static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime,
+		   u8 *msg, bool skip_copy_rpc_header)
 {
 	struct r535_gsp_msg *mqe;
 	u32 size, rptr = *gsp->msgq.rptr;
 	int used;
-	u8 *msg;
 	u32 len;
 
 	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
@@ -123,13 +138,13 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 
 	size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
-	msg = kvmalloc(repc, GFP_KERNEL);
-	if (!msg)
-		return ERR_PTR(-ENOMEM);
-
 	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
 	len = min_t(u32, repc, len);
-	memcpy(msg, mqe->data, len);
+	if (!skip_copy_rpc_header)
+		memcpy(msg, mqe->data, len);
+	else
+		memcpy(msg, mqe->data + sizeof(struct nvfw_gsp_rpc),
+		       len - sizeof(struct nvfw_gsp_rpc));
 
 	repc -= len;
 
@@ -145,10 +160,91 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 	return msg;
 }
 
+static void
+r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
+{
+	if (gsp->subdev.debug >= lvl) {
+		nvkm_printk__(&gsp->subdev, lvl, info,
+			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
+			      msg->function, msg->length, msg->length - sizeof(*msg),
+			      msg->rpc_result, msg->rpc_result_private);
+		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
+			       msg->data, msg->length - sizeof(*msg), true);
+	}
+}
+
 static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
+r535_gsp_msgq_recv_continuation(struct nvkm_gsp *gsp, u32 *payload_size,
+				u8 *buf, int *ptime)
 {
-	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvfw_gsp_rpc *msg;
+	u32 size;
+
+	/* Peek next message */
+	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, ptime, NULL,
+				 false);
+	if (IS_ERR_OR_NULL(msg))
+		return msg;
+
+	if (msg->function != NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD) {
+		nvkm_error(subdev, "Not a continuation of a large RPC\n");
+		r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
+		return ERR_PTR(-EIO);
+	}
+
+	*payload_size = msg->length - sizeof(*msg);
+	return r535_gsp_msgq_wait(gsp, msg->length, NULL, ptime, buf,
+				  true);
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 msg_repc, u32 total_repc,
+		   int *ptime)
+{
+	struct nvfw_gsp_rpc *msg;
+	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
+	const u32 max_rpc_size = max_msg_size - sizeof(*msg);
+	u32 repc = total_repc;
+	u8 *buf, *next;
+
+	if (WARN_ON(msg_repc > max_msg_size))
+		return NULL;
+
+	buf = kvmalloc(max_t(u32, msg_repc, total_repc + sizeof(*msg)), GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	msg = r535_gsp_msgq_wait(gsp, msg_repc, NULL, ptime, buf, false);
+	if (IS_ERR_OR_NULL(msg)) {
+		kfree(buf);
+		return msg;
+	}
+
+	if (total_repc <= max_rpc_size)
+		return buf;
+
+	next = buf;
+
+	next += msg_repc;
+	repc -= msg_repc - sizeof(*msg);
+
+	while (repc) {
+		struct nvfw_gsp_rpc *cont_msg;
+		u32 size;
+
+		cont_msg = r535_gsp_msgq_recv_continuation(gsp, &size, next,
+						      ptime);
+		if (IS_ERR_OR_NULL(cont_msg)) {
+			kfree(buf);
+			return cont_msg;
+		}
+		repc -= size;
+		next += size;
+	}
+
+	msg->length = total_repc + sizeof(*msg);
+	return buf;
 }
 
 static int
@@ -236,40 +332,12 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
 	return cmd->data;
 }
 
-struct nvfw_gsp_rpc {
-	u32 header_version;
-	u32 signature;
-	u32 length;
-	u32 function;
-	u32 rpc_result;
-	u32 rpc_result_private;
-	u32 sequence;
-	union {
-		u32 spare;
-		u32 cpuRmGfid;
-	};
-	u8  data[];
-};
-
 static void
 r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
 {
 	kvfree(msg);
 }
 
-static void
-r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
-{
-	if (gsp->subdev.debug >= lvl) {
-		nvkm_printk__(&gsp->subdev, lvl, info,
-			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
-			      msg->function, msg->length, msg->length - sizeof(*msg),
-			      msg->rpc_result, msg->rpc_result_private);
-		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
-			       msg->data, msg->length - sizeof(*msg), true);
-	}
-}
-
 static struct nvfw_gsp_rpc *
 r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
 {
@@ -279,11 +347,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
 	u32 size;
 
 retry:
-	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
+	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time, NULL, false);
 	if (IS_ERR_OR_NULL(msg))
 		return msg;
 
-	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
+	msg = r535_gsp_msgq_recv(gsp, msg->length, repc, &time);
 	if (IS_ERR_OR_NULL(msg))
 		return msg;
 
@@ -736,6 +804,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	mutex_lock(&gsp->cmdq.mutex);
 	if (rpc_size > max_rpc_size) {
 		const u32 fn = rpc->function;
+		u32 remain_rpc_size = rpc_size;
 
 		/* Adjust length, and send initial RPC. */
 		rpc->length = sizeof(*rpc) + max_rpc_size;
@@ -746,11 +815,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 			goto done;
 
 		argv += max_rpc_size;
-		rpc_size -= max_rpc_size;
+		remain_rpc_size -= max_rpc_size;
 
 		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
-		while (rpc_size) {
-			u32 size = min(rpc_size, max_rpc_size);
+		while (remain_rpc_size) {
+			u32 size = min(remain_rpc_size, max_rpc_size);
 			void *next;
 
 			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
@@ -766,19 +835,20 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 				goto done;
 
 			argv += size;
-			rpc_size -= size;
+			remain_rpc_size -= size;
 		}
 
 		/* Wait for reply. */
-		if (wait) {
-			rpc = r535_gsp_msg_recv(gsp, fn, repc);
-			if (!IS_ERR_OR_NULL(rpc))
+		rpc = r535_gsp_msg_recv(gsp, fn, rpc_size);
+		if (!IS_ERR_OR_NULL(rpc)) {
+			if (wait)
 				repv = rpc->data;
-			else
-				repv = rpc;
-		} else {
-			repv = NULL;
-		}
+			else {
+				nvkm_gsp_rpc_done(gsp, rpc);
+				repv = NULL;
+			}
+		} else
+			repv = wait ? rpc : NULL;
 	} else {
 		repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
 	}
-- 
2.34.1

