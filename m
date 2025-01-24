Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D9A1BC20
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2BF10EA1A;
	Fri, 24 Jan 2025 18:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DWjRbwLj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178710EA08
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXnywoa/eTiibam35c4CXR8KEuq78Ih1TxUEgN6eL52bLMQyxVwJ90aEhwvBqU8MrtyjBzfGFc2FeWugbbEz+XbH+tbgZwKa6pJM69b3TmJSFmz15AjfASFiZrGyhLScLmVKeNIXk1VeTD6uPtZMfMTrf1pleEY6qv7nMgHFt6GwvNdtJHR6gMpiAawrHSSv8kztWzltJIldcEVG9WZDWpxOSeAIy4i4j7fZdRHMf7sXf7+toky6TFkP80lR+cjmvDUXWOrSABh5R2QdBgkIZWhsuKWnu9jiMHtlQnhILr7dhvE5ZKAhO6lubW6a9+oQH/sJ+9P8kZ9Xt9+DtCGAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dawjaose7pgWmZ9l5CKgZ1+BW0/gF3D6W/FoegiQE8M=;
 b=SU0eFWw21qcPAGwwXNoi3g6+sIKZNG4mWacHvQB3V5W7XWOSp9Sqqq8NYssBdGvJG555DEYknkB7MtqBa8i+b/YcizDs97cViEd7o0bvKqZY15j46t5V6Q6Cax3t4JdbHgPMWt2W+53UCQzf5CclSNsuLUyY+aDcyyg1CC141EBMyZoAAtRfBRW/A3x0hnzIIhAxpUSxvOjY96mTHv0DCZkUIPZNpkIqqGb/Nfjkxv0Fi2ublEBu/rvaxGf4Vo23kG/rA3Ky06bb1G9qb80z3VxQm+DE0cb3oNmlA1RinPZXeDjYcoQH2+ODFOUPJp5TG7YetShrhl2UVsHWtW5jDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dawjaose7pgWmZ9l5CKgZ1+BW0/gF3D6W/FoegiQE8M=;
 b=DWjRbwLjI9w12rnfH68dlKzht/9A7qPXc0sLZCKjZK3BicWgaa1pmIwFQaTToFygy3EUr13BR18/rcWKL0FMGQGKDPXKXRUxyTqPrScu2taVR2aa/0W2Qi0WpXE/fl+t4zUSVw02h5fVTr6pP1C1LnVdDFCD2WDSFKFctdy2+9OMIEdAsaL8lBzf6B4p7mBMrXThgfccQ3rvGXJ6gYWmr6C1nhMIJatrmaVvBsUnmsSF+aa+LzIRupTw6nAIQBj2/Q6lmrgQ2BadSoAp1hNDL6pnBe92vKY1Qj3Lu5xg1wQAv3rH7YFVDgbMcIgBUJer1aMdvMgCs4pPiLYi/+kpnA==
Received: from DS7PR03CA0031.namprd03.prod.outlook.com (2603:10b6:5:3b5::6) by
 DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.18; Fri, 24 Jan 2025 18:30:49 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::6d) by DS7PR03CA0031.outlook.office365.com
 (2603:10b6:5:3b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Fri,
 24 Jan 2025 18:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:31 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:31 -0800
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
Subject: [PATCH v4 10/15] drm/nouveau: refine the variable names in
 r535_gsp_msg_recv()
Date: Fri, 24 Jan 2025 10:29:53 -0800
Message-ID: <20250124182958.2040494-11-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a489bf-e63d-4127-5a94-08dd3ca539dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AIB7MYmNdxEyYVngJ6fVagbeMwAgDTCgJlHtj+flBpUBl863/+lRYnLza7e2?=
 =?us-ascii?Q?SATDyWy8zgkncITi84TyKrspZrw5qCC7fDrRXkR0SolanE4SQ14rh0ZLwYmK?=
 =?us-ascii?Q?3j60Fov0IuNuQiLpei3D1nB7WVf1+FiONJdCKqhmlWnGuyomCqbPdzG163AY?=
 =?us-ascii?Q?owuq8QaP0zxG6+yWcKfGdzSDy7zjWjoR2w3e6DyUn32n+KWb1CPlU+kHpkKl?=
 =?us-ascii?Q?QOjscDFaRce9pAs65bRXeQtT5GL2IB+zPwAGrI1LOI4G+N4kad/AbfllyFZL?=
 =?us-ascii?Q?6drcrHCMw0PN/kJMfhuVe/kzUs8mP/zTc8udKpoKEuKXPfSBoioLQVALYq1u?=
 =?us-ascii?Q?WptsGEyDuX6rUKb7nDFVmyqj5DfzplrCQTXfkMM02ittsw+hiNnjG6BvHYvu?=
 =?us-ascii?Q?Fj7jZXHPsilhcaxrRGBkAFJw1wRgr8jX4VSsevvqlE03Fs9OILEgs443O7xS?=
 =?us-ascii?Q?9weoRm7nlj+x4mAWOKYLGNRler8OVqClOrFZqcmk1AcsPvac1faZWqsDz0f3?=
 =?us-ascii?Q?YPog69k8qiTYqXkIP9/Xch0UOcfL/6mjLiheoCOzYHkiI62Cid4ZS1iFBr+F?=
 =?us-ascii?Q?oXFgRCPIzRq24l7YF9wqieTtPPEjK9oj8IqZq1Li9D8D4+1QIw72LksbYZY4?=
 =?us-ascii?Q?3hiN0I2LCjYWvqKQRNlLMJk1TsG6A9gGCkn+Ajco1UjLe5TnzlwOzMb6pzgO?=
 =?us-ascii?Q?iApB3MkzVpjvLNP6UpoDE+O8VFT60kLoH49+sMTRYB4ItO78iARcVoC1shCp?=
 =?us-ascii?Q?GjcRLcpJGcjlO9op8fQOQa2dVMuNBmkXY7x0W7+0dGEVrMN/kKkiPBnRIPv9?=
 =?us-ascii?Q?nrQPBwwBkd2ACFBiR7zRTcyUyat6hZ6p/erWOuNiWkrIvb5NipmF+LditsDq?=
 =?us-ascii?Q?NHyMCUWl5WNxbwzct3Q2fiTnPiQSQsFpeVoZ+14yTJyNtaSuPUU/hxYDkVhC?=
 =?us-ascii?Q?BlTx1QglCtt9XqygMnRIozTMSJ7txL5mE61zKCYQAHkpUi2xmOLFgkn87Mp1?=
 =?us-ascii?Q?IR03I+YnMXy1pNHwt6/mIXgpj5g2eai8SSUoocxjMUsXKvRrGgRaoaHm9nbf?=
 =?us-ascii?Q?CDnukttIvh83mQLZjzZzdkQFa7mCeSBlxD1WW1YGxSLmVVKZmfa6IUQIzgOU?=
 =?us-ascii?Q?TY8n9q/rrK04TyydXP3ckuUyBIcYs7TM26zm6oQUrpFcWQaCXgNKBu4zkaTi?=
 =?us-ascii?Q?vAgnGkqGIMB1MJEDbdKqWhp6VudxTk0O6d9SYPrg36BUCzwqmpdB1CGzFdGc?=
 =?us-ascii?Q?6f1qu7Q/sg2efItN+f7biX4FazZnPeSUwtVBfKvZap0A6NaQ/ObfzI6ozi4l?=
 =?us-ascii?Q?E7ziR7NhU0M2UM9+fduVQXYpnu7sDjkdRLTmXX3ofZ3kwKUIxQme8KJayCXp?=
 =?us-ascii?Q?oOTOyiJpmotd++K25gWmT/E5+2z8LHaoK9Jr83eJioU6jqIGr9cLhPNbokAh?=
 =?us-ascii?Q?bDANK0n/IcCDg7GfvENkRcTGCuKDQI8mhxCYT3gsPRShoSbsM5dBKoaS7wtV?=
 =?us-ascii?Q?aeZUqGn8SCL5JQY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:49.3085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a489bf-e63d-4127-5a94-08dd3ca539dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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

The variable "msg" in r535_gsp_msg_recv() actually means the GSP RPC.

Refine the names to align with the terms in the kernel doc.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 49dfc1475973..3b1c648aad46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -336,59 +336,60 @@ static struct nvfw_gsp_rpc *
 r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvfw_gsp_rpc *msg;
+	struct nvfw_gsp_rpc *rpc;
 	int time = 4000000, i;
 	u32 size;
 
 retry:
-	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
-	if (IS_ERR_OR_NULL(msg))
-		return msg;
+	rpc = r535_gsp_msgq_wait(gsp, sizeof(*rpc), &size, &time);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
 
-	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
-	if (IS_ERR_OR_NULL(msg))
-		return msg;
+	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &time);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
 
-	if (msg->rpc_result) {
-		r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
-		r535_gsp_msg_done(gsp, msg);
+	if (rpc->rpc_result) {
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+		r535_gsp_msg_done(gsp, rpc);
 		return ERR_PTR(-EINVAL);
 	}
 
-	r535_gsp_msg_dump(gsp, msg, NV_DBG_TRACE);
+	r535_gsp_msg_dump(gsp, rpc, NV_DBG_TRACE);
 
-	if (fn && msg->function == fn) {
+	if (fn && rpc->function == fn) {
 		if (gsp_rpc_len) {
-			if (msg->length < sizeof(*msg) + gsp_rpc_len) {
-				nvkm_error(subdev, "msg len %d < %zd\n",
-					   msg->length, sizeof(*msg) +
+			if (rpc->length < sizeof(*rpc) + gsp_rpc_len) {
+				nvkm_error(subdev, "rpc len %d < %zd\n",
+					   rpc->length, sizeof(*rpc) +
 					   gsp_rpc_len);
-				r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
-				r535_gsp_msg_done(gsp, msg);
+				r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+				r535_gsp_msg_done(gsp, rpc);
 				return ERR_PTR(-EIO);
 			}
 
-			return msg;
+			return rpc;
 		}
 
-		r535_gsp_msg_done(gsp, msg);
+		r535_gsp_msg_done(gsp, rpc);
 		return NULL;
 	}
 
 	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
 		struct nvkm_gsp_msgq_ntfy *ntfy = &gsp->msgq.ntfy[i];
 
-		if (ntfy->fn == msg->function) {
+		if (ntfy->fn == rpc->function) {
 			if (ntfy->func)
-				ntfy->func(ntfy->priv, ntfy->fn, msg->data, msg->length - sizeof(*msg));
+				ntfy->func(ntfy->priv, ntfy->fn, rpc->data,
+					   rpc->length - sizeof(*rpc));
 			break;
 		}
 	}
 
 	if (i == gsp->msgq.ntfy_nr)
-		r535_gsp_msg_dump(gsp, msg, NV_DBG_WARN);
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_WARN);
 
-	r535_gsp_msg_done(gsp, msg);
+	r535_gsp_msg_done(gsp, rpc);
 	if (fn)
 		goto retry;
 
-- 
2.34.1

