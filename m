Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF4A1BC1E
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24910EA18;
	Fri, 24 Jan 2025 18:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A94QO5br";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788B810EA16
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uho3yVbqeEf0gl9a1rtf0rlffpjQqRNFUAmRVBUrIrn0yng2YO4L9ihLJq/SeN+ItViyvqDf9HhXR1zwt32mD6QusKiI35jfYwMYyCfK06X/F74AFckFDmvyFwSGM0cslKAbspaJj26/2i2P8mj/bSVIym/XPxnSynKViwVeLeA59lYYaXt3y9n6bb6x+IzGxpgwOOJzL/zAoGtqzA2O8lrkoHHvEXdSmREm7THVQS4x46Zta4XnntRX+eJQRcWq644WujKhVYdtnHz1HhtJqm09vqdQ37wfm5Agoe4mqan8FSeELNpnnDrcHLdEj+eE6wwBPCfNqaWYIokFTMln1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCRAZ07Vk078tawIFn6BJUFY9bI+faLiLCu7a1ILs9I=;
 b=L4ZqPc/RrZdhz6St+gWlrhoWkDUOhvMcIMPFAeD/hTIPHijyf4cZBvyKe2Z7RCzv2n1FrI4s7HcFRDCd2kEqbq9shEsOwb5izwqYREZhufFhPjjlv3kBwrEk0cSp9e9uuzo3mES6+F8WSuGWub7c2AiQIlyFNmuzf19+LUu3aBrNitLadOeuPgHMaZufL3T/Lc5TEqr4huD4KaKQRB3ciNft7f3AEEeNjYN+X7CvUC7R9OY4PH3lwX98Zgqs1L5DWWGVtFV8lLAt0NaBEY467+8FzLdFe5ueVhbr17BPFfD8MkQGfUbgQd3RQuX9hfgh23f0JhZXeYZDibU8qCHZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCRAZ07Vk078tawIFn6BJUFY9bI+faLiLCu7a1ILs9I=;
 b=A94QO5brvSKkNs7Fhmg3yAO1hRgUXhHk+0U0OA5dfpI2FWCje/qxf67awWZ/DD3Rrb4PqXL8LdHnaS3rYG1rl39KoUUAzd5uKTeBijoLsEq+PTNDk34Npeuiy9TJSjogHAvVotJ6JQg5FWe1c0NwKOO8Ks0g8cRZSy3LBveaSMSvn8akomIT+A2GSffPJz1+xvZEmF3ySq9vVwyRCGDttuxHwFiTBO18PzWAE3VPORlvlAWQMb67TYK1QPwpECAZAHMDuLqvwcw/MXePd9o36dLiZOoqLWLBt/RNY8EFz7QSGvPjOeK6sIZ048pusbqeRiNCqhWdFVwX5r71roifjg==
Received: from DM6PR07CA0068.namprd07.prod.outlook.com (2603:10b6:5:74::45) by
 SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.18; Fri, 24 Jan 2025 18:30:49 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::d8) by DM6PR07CA0068.outlook.office365.com
 (2603:10b6:5:74::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 24 Jan 2025 18:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:31 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:30 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:30 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 09/15] drm/nouveau: refine the variable names in
 r535_gsp_rpc_push()
Date: Fri, 24 Jan 2025 10:29:52 -0800
Message-ID: <20250124182958.2040494-10-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dfc4ff-2e30-4e36-6b99-08dd3ca539b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mpqpFVnw0b7IoZrsbQGZxLkh9JcHPVnwvRrn10Kb5gGHnfiaRWkV4iJLX7YX?=
 =?us-ascii?Q?o5Rsxwvgk577P+xsmGvNFwBxZed0MxEEqYyONlZsi65Oo4PAKw9r0TW+heVV?=
 =?us-ascii?Q?1sMzLLSYD2dYyQJYtv2/c85hH3bK2f5l9kf9Jg9Rj8Rz1TYd4lYlc6vZkZH9?=
 =?us-ascii?Q?MrTJElzPrvTAEoNNf/hHRyfD7jglk7GHfnhnSbFl2Jk2iqQEGktZzJQ27TML?=
 =?us-ascii?Q?xzBtjHkl/1rn9H+qd/JnBqhGVzDpcbg/yDeg5vuFeMOQdlZZHyJpZBm9JREp?=
 =?us-ascii?Q?LHUFXocT85eERhTw2Iixm9boibzMNPiKEcb9/Z1A0OitwzLWDHYbBOHVc9JY?=
 =?us-ascii?Q?neD9tA6WabGeAUCl9wHQqCb1dZow0pgtfJtqrfnUKO7gwoxVxjocu/vXLpqn?=
 =?us-ascii?Q?Welmyqo1OtZI6pEgAbsZaWyCd9cGX/2gIgdj3xMI7ITeJcMuyevtAcVt33Wf?=
 =?us-ascii?Q?xzQmkpbZmi94Faar2/bfPFgPnwpMg0apnvIR1tAOYDiVvXT5y6shV4JHffrz?=
 =?us-ascii?Q?7yudq8tibBel4wI+FEVDBAuzwrIeVVk++h+L/2fR0E0yx6Fi9YVLadcR/QTS?=
 =?us-ascii?Q?BOOYUp6WJIOGBqDasNsu+XCzXTOWin5Ak+gFTalsnzLj9mPC9OczvuU7frul?=
 =?us-ascii?Q?cRj6TdFiSm5PmVSW+H4pkAe3xN+riMGBBUBF3KeWiG9hj6LbwSdTFol+xY4i?=
 =?us-ascii?Q?7Dr619fs/bLf2M2a32GpOxTwCKvr9BkER4Bl2JdnG9nvzse4baVmQ8Fw3dwx?=
 =?us-ascii?Q?yH9mLsgrVJj09Gg2pE/QZMvAGhZxH2Rgj0/dxqWsQnXxctsiSgyAKRIw1N3l?=
 =?us-ascii?Q?zRxfVrHv18wgohk87SjoANlg7Hgg/nEJt+7fzmxH+bUb5EbUWPq67sclok/W?=
 =?us-ascii?Q?AtNAsL2t2cqCaTvOyWMGgzIdNkg8cfxyjTncmn661UqkiUH7ldPZPXzi8xCs?=
 =?us-ascii?Q?+SsLw6lMhwDsOUd0N6aql8TiiXdMIaLTVQYdhWh7q+ncGDhMj5aX3rzktjuD?=
 =?us-ascii?Q?xexlKZhu5p3nytrBEi91o3Urtz6Ua3yVKyLTbJi7DiAGSHmTGs7Aw99vMN5n?=
 =?us-ascii?Q?B+EprIDWUi+9Pb98J+nfTdln0kFmqbyNXQGXn67IqxoVvLrLHhp3PETWvuem?=
 =?us-ascii?Q?X23XEz7fXIJXUQWP6yQtAaJmkJHRjIK6JPFh9vuat6zAnvp7HO+DtepmVFtT?=
 =?us-ascii?Q?eCmjX1K555LPLLyj+3cq7Hv1rjculI9gvoOiWFUxEcaMlWcYmYJ02SI10ydr?=
 =?us-ascii?Q?5PkN8JptamHm6YIllwywyTOiKmwF0aJFmDUasLsCYiVHLlxMrAVDJLdZ45uf?=
 =?us-ascii?Q?BrdEPG4r4IL1KdwjSif8rMR8vjQTrIzfNhg0ET7s9rLAFnMviIPJTnH8r7WW?=
 =?us-ascii?Q?om4tB+lotnTKr7whvCnqSObAVZMzHtgUxYcKbvI+uclqPvWuBYC5dDm3VHBF?=
 =?us-ascii?Q?8qKDMOi/391XaYONGPPk1wUPB3TP35dDAkPtbw6Y1xUTMQCQBrXoakzdAogW?=
 =?us-ascii?Q?n33jfaDrHO6D3xM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:48.9596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dfc4ff-2e30-4e36-6b99-08dd3ca539b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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
index 442a424d0fed..49dfc1475973 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -108,6 +108,9 @@ extern struct dentry *nouveau_debugfs_root;
  *
  * Terminology:
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

