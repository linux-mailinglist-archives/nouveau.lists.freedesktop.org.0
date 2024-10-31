Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F819B76D8
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582010E843;
	Thu, 31 Oct 2024 08:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k4ZY7whq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378E510E848
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpk7cn4RhE6oa509vWZU13sxVJj0b5WFERDMfEZWjrEF1Xzj9PwbxmP/bMInW51VSb5ALykM9fuiCur/gRUWOdm/yGJ/GmcUDVhXpnWWIV2f9x+TOMuYcxV/wpoWfEMaIEA1TKUd6Ksu4oYtG3E02UmYizjPFZ81jVZEvQw7/bZMZk5GmiucWD4IT7XDm4LZd0ioeb36Y98ryqSqVeCdIUj0CgJ98//8m9RSOCajnnBMG4kGnz3EGo7UK4xYs9H9ablCzR1JPO16WyGNVfgNyAnZJu2/sP+6tMjMMLh9DiM7C3qTOavXIuKkvmuuOvyMn7VrS6mAKsYKUHFBJbWVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3heggTHRPKAKVmUn2V8Y8mYN0xhwqgXHm5Y4r/gIo0=;
 b=gV/ZmtjLeGWWhgpJDIgD8izixGMlsY/HnmMh+0GyNpdm0s1LlKzJF5DyoPz5ZWdeDJM+9vK1YAir+sEKnA+61D6LilzYnjsJWqz+Vj5+6HlgaMCcYY6VB1sQ+AOugF2dk2NLNsIpfsgfNpG5Pudda0mlLOa2tikZTMEMirBYk4FoxzA2E3oissr2gER1SjYb7mrH4YFtYH0GR2vZSgOhSkCoT6Ip7RncY4HvVFCXaa1RpuiUNtSp6p+GfWm1QrjUBoTXJ95WbbLxsCaF0cb3R9LFFfMcyP8DdCFJZ98dmQIUffLo23Ta02McnTX7UVjUoBEFmJSqQ4IGsoq5ARuDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3heggTHRPKAKVmUn2V8Y8mYN0xhwqgXHm5Y4r/gIo0=;
 b=k4ZY7whqnwMCc9KqSikaHf0uvfU5nTHvCeofg4dLmLh3CSmB8AYDcWcBmvXDLM1hToPWhoYWoU1hNBKqtry3XyaEQE6OwmglcPKwvceUrd8PUUcWV2HdSjkVtNPWxq97tVwKI4z+UOVSCTX99WUH/yNtOCbCO2rV5hLiBvFyipYRhM5dEARgjO45hU0hURgjegfzTGM9gIQt2NuCnWnSGZhBaHxrE5+CHGYHJv0LhE74dnrrtwxP3E4K0cKdmuWAcur1Du/zpnxoZAJIDKbQBwHZAalzCfV8x6XfqReVMvJLkvn5GJMs/6oOE2CWgYJRMvcktcEZy4P5y35agWXTFg==
Received: from BY5PR16CA0005.namprd16.prod.outlook.com (2603:10b6:a03:1a0::18)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:38 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::c2) by BY5PR16CA0005.outlook.office365.com
 (2603:10b6:a03:1a0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:38 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:13 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:12 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:12 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 09/15] nvkm: refine the variable names in
 r535_gsp_rpc_push()
Date: Thu, 31 Oct 2024 01:52:44 -0700
Message-ID: <20241031085250.2941482-10-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a31cb9-3efc-4cfa-974e-08dcf9898328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SPRJVKqT2/I/XJ0/lh/QVSlZKE3lVTSN+GuHh/P627/xNNCDoTdmi2FdwJYs?=
 =?us-ascii?Q?caq+fMR0ul43coaLmr30pisalU9uzDPoBpqsK+cOXGfZx946z/57Vqmd06w9?=
 =?us-ascii?Q?8adNMZARe4zHLVp4RZN8SuE919jQtI+ScvaeKNa8oqg3ZLADk0gWf7Y8ixva?=
 =?us-ascii?Q?7OCDkc2bBdPYUPUD8gcq7+PCzbHSxGX2LwRZsFFAi1lrNz0QMawYXp38MjCf?=
 =?us-ascii?Q?pN8m9InEXlA0crKOzbLtaSPlcyjy7Iq4VaznI7CvC6hFIySrW81/YrT3KitA?=
 =?us-ascii?Q?PG1h9DaqNAcyxmBtdTpjv8EScm5IrM0JiIvMgkN2/IdsIL3NVtmki4u2+DMB?=
 =?us-ascii?Q?F7IyB7Pl4A/Hfkjekbkq2BbIXP84ODFr3G96qD2FW8our4oqeFiE8j+Z6M/x?=
 =?us-ascii?Q?FcqIEKFTmFi7qMQfWaTMFnOncRBdc84izZFRy0NuQXWgql/2U96umiH7EMUX?=
 =?us-ascii?Q?lTYumZZ+WLbJrFRw+quOImS7LH3bIcJDUtkQStX1nTBBNE54ORcHuxEyEW1y?=
 =?us-ascii?Q?Gr4iwQ8NNAJb3BjBl7qKTZhXyfBzObtzJLJWImKz0LpVEd1L492BjQ0PPGhl?=
 =?us-ascii?Q?M1CTiu9nLCwfj5oacB+baN99q1d/T4Lmqmr9kbB1JIwk1ixGkCV+lMO6dsmh?=
 =?us-ascii?Q?RUnThlixKQz2bzGiVYEL5dHP4NHqyUfzyhw6H9NKDCyaVEYtUOB5fhs3LXUN?=
 =?us-ascii?Q?YxzV8pLmp6LXyewSSTsip9oLdPu9hgOvjnc7IgwhezR3T3gQFORK5cF09Ti6?=
 =?us-ascii?Q?r8pH4rAg0Xy1f/2m2T8nP8KFB3uEMp7JmREZ0MafiRRQqx5BAK7FteKYq0yv?=
 =?us-ascii?Q?Ub/f7BA0fHC+JBpgO2ASCU9FMlbuN4IoD20+R1AuntG39llB+Imw7Xu+by7u?=
 =?us-ascii?Q?DgMPOt8bbFFM3tTomS+3fPe5yTGIaxk4H36APVrSuFCjClkYWU+GeeoOGPdh?=
 =?us-ascii?Q?m146LgAiSwZr4qyG2rkMFldXWWPxsYv+87ieCMpHZERChcVr+fdrMV5cygYS?=
 =?us-ascii?Q?a21C9pvbp4pWaiSURUxWNpVsfpuoqE4WNhuGxECWZGTZYCgmWY90BK7MwwHy?=
 =?us-ascii?Q?KquHfx2zdEOwu/W6A2OznyjX496mPdMD1DQk9J5fh2q1e5qFvlCU7kWYd8dF?=
 =?us-ascii?Q?2tjkDTODtVyOUceVTNAeCIqPZbay0rGIs3gQzkhVUDqGeOlA8eGnEgbvduPQ?=
 =?us-ascii?Q?ZrktHsBcfByUklzPVONM0q1m0xgkgyjeZU7dwKp5woQciEASOmQLHxWgQysx?=
 =?us-ascii?Q?V2LzwNJclVObWtjcmqr7pHlQHi8N0Yt6eOHi4r4uyprykqSnU97yaXLFAfFT?=
 =?us-ascii?Q?Dt4vx7GEoe82JZM40TT7Nb57p3xy82zVnK76ewCFDg1puJNiStnTUlSub4A7?=
 =?us-ascii?Q?EErF3mC8uM9HWn0J73VKASWI5BDn8MlCL7Z/o7nIon+JajbyzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:38.5297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a31cb9-3efc-4cfa-974e-08dcf9898328
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332
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

The variable names in r535_gsp_rpc_push() are quite confusing and some
of them are not representing what they really are.

Update the names and explanations in the decoder section of the
kernel doc. Refine the names to align with the terms in the kernel doc.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 5bc56a9ba3f8..2ac0868eb30c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -106,6 +106,9 @@
  *
  * decoders:
  *
+ * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
+ *   payload)
+ * - gsp_rpc(rpc): GSP RPC (RPC header + payload)
  * - gsp_rpc_len: size of (GSP RPC header + payload)
  * - params_size: size of params in the payload
  * - payload_size: size of (header if exists + params) in the payload
@@ -795,30 +798,30 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
-	const u32 max_msg_size = GSP_MSG_MAX_SIZE - sizeof(*cmd);
-	const u32 max_rpc_size = max_msg_size - sizeof(*rpc);
-	u32 rpc_size = rpc->length - sizeof(*rpc);
+	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
+	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*msg);
+	const u32 max_payload_size = max_rpc_size - sizeof(*rpc);
+	u32 payload_size = rpc->length - sizeof(*rpc);
 	void *repv;
 
 	mutex_lock(&gsp->cmdq.mutex);
-	if (rpc_size > max_rpc_size) {
+	if (payload_size > max_payload_size) {
 		const u32 fn = rpc->function;
 
 		/* Adjust length, and send initial RPC. */
-		rpc->length = sizeof(*rpc) + max_rpc_size;
-		cmd->checksum = rpc->length;
+		rpc->length = sizeof(*rpc) + max_payload_size;
+		msg->checksum = rpc->length;
 
 		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
 		if (IS_ERR(repv))
 			goto done;
 
-		payload += max_rpc_size;
-		rpc_size -= max_rpc_size;
+		payload += max_payload_size;
+		payload_size -= max_payload_size;
 
 		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
-		while (rpc_size) {
-			u32 size = min(rpc_size, max_rpc_size);
+		while (payload_size) {
+			u32 size = min(payload_size, max_payload_size);
 			void *next;
 
 			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
@@ -834,7 +837,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 				goto done;
 
 			payload += size;
-			rpc_size -= size;
+			payload_size -= size;
 		}
 
 		/* Wait for reply. */
-- 
2.34.1

