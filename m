Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DF9A1B8C
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAD310E7AD;
	Thu, 17 Oct 2024 07:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HK7EhGg5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19710E7AB
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 07:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYABTn1mrCCvZDBQOU1IXPc3WU/A0fKixKU6mSxzahhfHBMr5QuTWyLdxq+GQIEANI6NnaGxWk12zb7kgbkbHdSiI9XEkf/4jSDx0T7BdvRTpnnJahgMV1YGfkyrKR4SS4Io3Xilif11Mww4X39rf3RvmoTPxHfz3wbu1wwaUAKgLa74tyDXK2JQXQUM+e4/7mH+xX3yrhdGXf3dGA1Z255myVjUiQL7GLUnsr5MtPK22mbZ5HcxKM5/flPgAvpMe6rBifdGWjwplGHKHtrOTbvhHW+DYB9vVImxzWtZsIuVZN79js/6fLR2qxg9UWztKqyIY6fG3N9f16rrp+bWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnR5fbUToGj5/1afpfQmcmrh7jHxGAJRDCqnBVKG2BM=;
 b=DpeNB81gOYaeFWqkJVi6f+tqIpS+Qmf0G5hpQHIoYsLD/vdJDBQ6nUFUKI3W+z/PMLrNGxiU8aPC4JkYBXV82gP+URUqyFcqbe7RrfqjXVVIS30X82YRjQJue9yDugicnJ0DTYp3P4sy4eonrcu6RAjF68ooVH0sCMgAejiWNP129EJQRFG2f2FeL8dw12qlWR7s8mrWr3UXZR7frmQiGdiKefhv09ADuuoEF0YvGM5mI/6Bqc+mzjEIDgQJ7saglg7JAGhtoYGyo9P+g6Hkcd4ysdBarhJGUz4GoZR+EtYFbLSOtodFGLvdd278f3kNl2KJv7rL1PrdtacA4s0FJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnR5fbUToGj5/1afpfQmcmrh7jHxGAJRDCqnBVKG2BM=;
 b=HK7EhGg55yh7uZisshKoNqNmT8fpzV+x+9/AybVsmqOp22nb1hNu5pRVQ+7PvoVSxOU4VrobQ+dW3h3SBMTKcNJh15KAm5Wjekqqq/VG84IxDNdR/hRRwKzotugMc55nmC9+GfxCbdnRvxQVFE61x06Ax7oHvob3DjxodU3UdVbhjwKTewmFJXqs0TALmGGD1ck0Z8eyi0fmytckzM95UB2X6UOo4Bx2RYuXKNHOfnWBgGt8jef/VjhtrA1su6USCkf4ggNBGgVg/m/mBcNJ/hDUrD/+pbFynUIaphvkvFQxC9KGMckLIIsX2LaiwmLcvcYGO+MSmPwkN+YPy1Q3Pw==
Received: from MW4PR03CA0355.namprd03.prod.outlook.com (2603:10b6:303:dc::30)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 07:19:42 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:dc:cafe::e9) by MW4PR03CA0355.outlook.office365.com
 (2603:10b6:303:dc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 07:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.1 via Frontend Transport; Thu, 17 Oct 2024 07:19:42 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:29 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:28 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 17 Oct 2024 00:19:28 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 3/3] nvkm: handle the return of large RPC
Date: Thu, 17 Oct 2024 00:19:22 -0700
Message-ID: <20241017071922.2518724-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017071922.2518724-1-zhiw@nvidia.com>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0c604f-91ef-4433-8ffd-08dcee7c11d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Epn4HRdK3XsNbtzgituPLzoBHGznEHY6F+A//bie7WRQE3LtEIvkJIRdzRWC?=
 =?us-ascii?Q?mFORY0H4d1Ozrj/rTzo6WdCwIY3sc3reGrX9AXmvlvORTN/uEyJPwdQLvoff?=
 =?us-ascii?Q?gHiSMIVIt7gcl5KQASSqI6pp0GWZJwAgEvD3ATPR8VFQlMWLi41F4H68htgB?=
 =?us-ascii?Q?f3NbqMvpiBq7WQUGp9jKj/0z4LRns/c/YWbxvJev/CKohks3JS1RllKs/Cuj?=
 =?us-ascii?Q?Iyu9FhWhebj3E+36eo/7WrRz0oHMn4t6iJiH5XikYR5KFGlhXHrr/owgV0tS?=
 =?us-ascii?Q?dSXjE6c4v3U/rJ+zXiGFshstQaF63c1YYz0/+l9dqx6wwFS8nH4gIMq3Kwyb?=
 =?us-ascii?Q?BCvP1rbeeG4OBshhIVCrmo/KFdEENm2cFiCep1x6OOF207eHPkOUtVH6kaV1?=
 =?us-ascii?Q?Puxc5DNW2Nf4ZfWJWn9IWoZZ2fiShvUSnS8X0VAUctYhjCf3c6DdwbJp9rBb?=
 =?us-ascii?Q?1GgkaGSsfEeEfvBNMtfTNeaEIoTAI14euIt1iP5Tva8rtvxqTk1CrtNiBAw2?=
 =?us-ascii?Q?h9UjWT+r9Wrc9DEAEo5TCgjPOMEgOfK71TBem0Sc2M5lDGSTWI5L3RenghTt?=
 =?us-ascii?Q?weBW2O+tgbgDp6bwdbseNCl3Y7d7bAfRNcqi8kgHSSBGrcbz4KAH8DENKkYy?=
 =?us-ascii?Q?5jyFG2v58HdUyd2cKjlo3QEgTkggOQg9aYr40YWGehqGZFsVWyJqwoapegZx?=
 =?us-ascii?Q?At2P8ef+opt4VQ8wW28nvhrdgcqS78136vjTlzsieyUfU9R6YwB0898oN65G?=
 =?us-ascii?Q?vNgJZUO/5wCxlkl0+fh5NWxHvvrekAUtP+9oGVURg1XHwn6uBQzJchUfu7C8?=
 =?us-ascii?Q?7I8x/MDuSRjhSPcNtWbkO7iSEnTqMxAtQaIx67S6klbTajDQ7yqrcFi0Poh2?=
 =?us-ascii?Q?e696ohp/s+c/82f2/mjpR5PoY2yRxHqXN2Q4prvJI8BF4shgDihjQvT4CoHl?=
 =?us-ascii?Q?EyjlYmDBOBINepB6Ld97XgE50Pag4L7v4QmuKFivMDZx4CZwWUw6tyJtUplr?=
 =?us-ascii?Q?+gAdzebVC5U0FrvDz01rmBLweq4Hwc3FcPVRv0yV/WHdbqdlkT0834KhFj2j?=
 =?us-ascii?Q?Kph8VhNYUoqyI1W7PRCQ9JWRMjANlw1NK+qZwQ7K5YeLOfvWHtImxVUYE3b5?=
 =?us-ascii?Q?O9OYEm0pYwrg2NV0RX3o5OOvZ+/lYeegLqEsWxZeQK4M7BEW88s6wGhx/Sam?=
 =?us-ascii?Q?d+smoA3i9D6Q9+iMFIRvrtM2uTPht87wUWC72HY6BvGdnciUlThE+hIBAhEe?=
 =?us-ascii?Q?1uXl7kkOWOeRR2pJD05duK5sK5KqPIVrtJkKwj/LceBDHRRPXJLY6LirrrhX?=
 =?us-ascii?Q?/rgAnBIEn1meqJsk+R8j11UTZTgPnxq+AUeISLCHyfM+PlPTJmvdIoZ4FmWw?=
 =?us-ascii?Q?gIIVbAY2cI8s8a4sfDeIgjBc3/+8RPsNZPkDJz5EdzzQlnTUyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:19:42.0703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0c604f-91ef-4433-8ffd-08dcee7c11d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 237 +++++++++++++-----
 1 file changed, 177 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 50ae56013344..9c422644c9e7 100644
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
@@ -86,16 +101,34 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 	}
 }
 
+struct gsp_msgq_recv_args {
+	/* timeout in us */
+	int time;
+	/* if set, peek the msgq, otherwise copy it */
+	u32 *prepc;
+	/*
+	 * the size (without message header) of message to
+	 * wait(when peek)/copy from the msgq
+	 */
+	u32 repc;
+	/* the message buffer */
+	u8 *msg;
+	/*
+	 * skip copying the rpc header, used when handling a large RPC.
+	 * rpc header only shows up in the first segment of a large RPC.
+	 */
+	bool skip_copy_rpc_header;
+};
+
 static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
+gsp_msgq_recv(struct nvkm_gsp *gsp, struct gsp_msgq_recv_args *args)
 {
 	struct r535_gsp_msg *mqe;
-	u32 size, rptr = *gsp->msgq.rptr;
+	u32 rptr = *gsp->msgq.rptr;
 	int used;
-	u8 *msg;
-	u32 len;
+	u32 size, len, repc;
 
-	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
+	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + args->repc, GSP_PAGE_SIZE);
 	if (WARN_ON(!size || size >= gsp->msgq.cnt))
 		return ERR_PTR(-EINVAL);
 
@@ -109,46 +142,149 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 			break;
 
 		usleep_range(1, 2);
-	} while (--(*ptime));
+	} while (--(args->time));
 
-	if (WARN_ON(!*ptime))
+	if (WARN_ON(!args->time))
 		return ERR_PTR(-ETIMEDOUT);
 
 	mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
 
-	if (prepc) {
-		*prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
+	if (args->prepc) {
+		*args->prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
 		return mqe->data;
 	}
 
+	repc = args->repc;
 	size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
-	msg = kvmalloc(repc, GFP_KERNEL);
-	if (!msg)
-		return ERR_PTR(-ENOMEM);
-
 	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
 	len = min_t(u32, repc, len);
-	memcpy(msg, mqe->data, len);
+	if (!args->skip_copy_rpc_header)
+		memcpy(args->msg, mqe->data, len);
+	else
+		memcpy(args->msg, mqe->data + sizeof(struct nvfw_gsp_rpc),
+		       len - sizeof(struct nvfw_gsp_rpc));
 
 	repc -= len;
 
 	if (repc) {
 		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
-		memcpy(msg + len, mqe, repc);
+		memcpy(args->msg + len, mqe, repc);
 	}
 
 	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
 
 	mb();
 	(*gsp->msgq.rptr) = rptr;
-	return msg;
+	return args->msg;
+}
+
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
+static void *
+r535_gsp_msgq_recv_continuation(struct nvkm_gsp *gsp, u32 *payload_size,
+				u8 *buf, int time)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvfw_gsp_rpc *msg;
+	struct gsp_msgq_recv_args args = { 0 };
+	u32 size;
+
+	/* Peek the header of message */
+	args.time = time;
+	args.repc = sizeof(*msg);
+	args.prepc = &size;
+
+	msg = gsp_msgq_recv(gsp, &args);
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
+
+	/* Recv the continuation message */
+	args.time = time;
+	args.repc = msg->length;
+	args.prepc = NULL;
+	args.msg = buf;
+	args.skip_copy_rpc_header = true;
+
+	return gsp_msgq_recv(gsp, &args);
 }
 
 static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 msg_repc, u32 total_repc,
+		   int time)
 {
-	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
+	struct gsp_msgq_recv_args args = { 0 };
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
+	/* Recv the message */
+	args.time = time;
+	args.repc = msg_repc;
+	args.prepc = NULL;
+	args.msg = buf;
+	args.skip_copy_rpc_header = false;
+
+	msg = gsp_msgq_recv(gsp, &args);
+	if (IS_ERR_OR_NULL(msg)) {
+		kfree(buf);
+		return msg;
+	}
+
+	if (total_repc <= max_rpc_size)
+		return buf;
+
+	/* Gather the message from the following continuation messages. */
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
+						      time);
+		if (IS_ERR_OR_NULL(cont_msg)) {
+			kfree(buf);
+			return cont_msg;
+		}
+		repc -= size;
+		next += size;
+	}
+
+	/* Patch the message length. The caller sees a consolidated message */
+	msg->length = total_repc + sizeof(*msg);
+	return buf;
 }
 
 static int
@@ -234,54 +370,33 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
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
 	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct gsp_msgq_recv_args args = { 0 };
 	struct nvfw_gsp_rpc *msg;
 	int time = 4000000, i;
 	u32 size;
 
 retry:
-	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
+	/* Peek the header of message */
+	args.time = time;
+	args.repc = sizeof(*msg);
+	args.prepc = &size;
+
+	msg = gsp_msgq_recv(gsp, &args);
 	if (IS_ERR_OR_NULL(msg))
 		return msg;
 
-	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
+	/* Recv the message */
+	msg = r535_gsp_msgq_recv(gsp, msg->length, repc, time);
 	if (IS_ERR_OR_NULL(msg))
 		return msg;
 
@@ -734,6 +849,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	mutex_lock(&gsp->cmdq.mutex);
 	if (rpc_size > max_rpc_size) {
 		const u32 fn = rpc->function;
+		u32 remain_rpc_size = rpc_size;
 
 		/* Adjust length, and send initial RPC. */
 		rpc->length = sizeof(*rpc) + max_rpc_size;
@@ -744,11 +860,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
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
@@ -764,19 +880,20 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
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

