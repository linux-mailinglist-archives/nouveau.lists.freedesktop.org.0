Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034279B76D4
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23CC10E3FE;
	Thu, 31 Oct 2024 08:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DXYz49tk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86D610E845
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmy7CuqwrJcjkCEqLMaQL3SsY4bPR4Mu+Wv2U6jZIIHAm1ZxyXkos/eVNiTmMnA1s4XNIoakDnoTr50AGgL8KibnKtZBXzip9nbYoFA9m0Cj0kEGVQGaVBHyknLBzLXOsgxaZVNTTPv6kY7jQQX0aiG6I8od76dNrdgq1FshbT75bthGbC+AeunaPwgFo/BRGbVH6e/dqCCVKhD/EzWfLpUAcnRWvIvQYvejlfZhj4wLt9QRx8ywfXsBFWfmydKSAYkUhalecRjmYQdpLKPiYJMlHsktA0VXDFvvYEuDOvAUi9fEg8dVBSva/gKdW0jrtA/4j3FMKg16m/i/c/nCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbapWS0LB2Dbd+r62L3Q/V8hRTBdxJIcWuoVgWx2khs=;
 b=mei0Vpbj0U62tfoqXkyskQ9NZYwCBi0nxYV5NMoFkMEozg4kbN3a6EKomeWkWXMzfHhzNKFgA08y9bjMOwxBvi0v/LOxM5R/u8ujjvzSs67I4xGh9O0tjWBChgwtJ3TL1qo8/yt8xJozrDymBG7XPXIhC6e+fDOjpOGZIvlaFjgosvx2z8aBzVaSQjHYAH6GtQyGaQoGo4EdQ3WwZUZrmEqELQJtzD2yRU8EnSXCUwmGmWL+ZQ/DIaQudmjkOXDx5Bbq26silq6oXwX6/zAimsoyoyzZj09Lq+EUYctKkY02KXvKt9cdEnXDbSywWa1tqqk0Tm6l8dwrbHeHDNSTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbapWS0LB2Dbd+r62L3Q/V8hRTBdxJIcWuoVgWx2khs=;
 b=DXYz49tkcngQUnLSt7zDjoDLy47ldJYwQAL3FSD0uV4TzkjCUu0+vrpAyPRSGEZ0bsljwakKFdSv1MnegUqHmig/odRqNhqqNLIwQkQQJA9+8RKmvo7AuChmCzIbjQ8bI+rM0TFdRs+BNFMGKkUeGQd9D5m/6Fm2GMrww8AM/Gqu9e3+QhsQ27WnXUk9NtAvUM74HLdmX6EFyrQweFGD4z54Gsz1jZIf4yWnkx2P87L8pJC15D6Zy0SloTjNQh7QVuiq5iS5pFGyFJbihtIX9X7h4tU5iYnkKo9KpLZlf565kT0loYvGa1hHXFTjVNig2dlfOSxRBsy3b0AIlHXiXg==
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:33 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::9a) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:06 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:06 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:05 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 02/15] nvkm: rename "repc" to "gsp_rpc_len" on the GSP
 message recv path
Date: Thu, 31 Oct 2024 01:52:37 -0700
Message-ID: <20241031085250.2941482-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c78cd03-7ccd-498c-3b00-08dcf9897f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ydcI6UgQFm1KyTEW05fj50lEKsqMPQaVb1icIOI6l1a4I4v/RXQf1QnZgh1w?=
 =?us-ascii?Q?aO3Jtp/wZq/bcw+KkaskZvYBN1btfWWUBibWNk8W54wT6E+3osMlofVa20v7?=
 =?us-ascii?Q?m+x+352pT0rJPFMDXdGir8DaPErg4k8Aj8AU/cBPt26UHes1wQYAB3E7y6N1?=
 =?us-ascii?Q?fnOXjxEM3VVWX1FQQXTPNlNHp6gzrjrkyXqcmsCspTxwTqJj6xYCbduN0NKb?=
 =?us-ascii?Q?pIU/B9tMt27sRbUjmnSgU45Nf84ULzrkjYJIhtnC7ib4vIjSmSeUsHg3J+yQ?=
 =?us-ascii?Q?QAKnkysFxcZPtZpGGe/1Nzq+Now4ebdCp46BK/UTNSy69HdJmBTAq60HCx9q?=
 =?us-ascii?Q?IUKU6+VWE5IDQYTgRwEjEBO5ntn4ugjTRzi+etCj2R8EYcIEcNCydBQPoYjk?=
 =?us-ascii?Q?p5z9zMSNhzvAMZRlRFnMDqPgW4LnAidMEHvcNbbv6YTb6q3jkFDEPOvplXLC?=
 =?us-ascii?Q?JiliLjQrH9AXBkzOekxDaka9fIbkTGU/22Az+QX95Jj3rZiA5Z4ptVhp0q4h?=
 =?us-ascii?Q?lMSp7zs4zG07Oo9QPZd9m0nK6HXj8Ob1gS4njJ0ZbQjcrmHmGX54E/UD8cNR?=
 =?us-ascii?Q?bTii51euvgI7HayWiSvuFygJc8UE5IOQtu6MOZ2Q112EulVTN90UN/u8ZirG?=
 =?us-ascii?Q?dTNEWuKVtpQS7ZrbIyNGpU3b6F/4QzgyoJv6lB7VKlXILtJ3nkEL2MkDh8er?=
 =?us-ascii?Q?hHKNXRF31R4vYKScc266aBAfy1qp7YnYsO4j9XGByErpgKMxbsaWyIjns2mB?=
 =?us-ascii?Q?CqLbkxC8JgTYIQwLqCvoPNVQ+TSMHmB9l9qXitNXr6gcmaWr4p/XiquKjbFV?=
 =?us-ascii?Q?emA3SJysIoxuTJlzqXpQZif/USMrFVVzigd0eTZ9bUsvm/psaHcpkx8XYPSK?=
 =?us-ascii?Q?m0ObS7o193RTSQgV6Yq8FptbcRPT+LCqHp5BNotoSegnm9hRVCV0LMVNUnX5?=
 =?us-ascii?Q?rBxW8jaMJoOrt0aBTrTFKvzKb2Ywd0hUDvA5tEJ4gFPwi0dJfnJpCwkwKiPs?=
 =?us-ascii?Q?9D4HKBJkAQkpAH91fw2WU6mUqlQ4MbkjL4nV6fVZlusYS9273sunHmxZRVjU?=
 =?us-ascii?Q?mRcuPOzKzozdDcO3DkCKD2gR/oN3YXxYnCNwsm25v78Ii28SnUHikPtWIhZa?=
 =?us-ascii?Q?sRUwURXB3O/oMwIYb4r0DLr7HRdZeLSeAhENp3gIc1p5xVeMYX97d2rmToWb?=
 =?us-ascii?Q?djinW7kKkzyMC6gK/P2Z6jOZFqTIKedOEbgte2B3MtZYvRL1cSSwHv46CsbM?=
 =?us-ascii?Q?n6dmYuIt2LhNhj6fm4y6KW025Zulx4ynizNXmM/bFNZwqGEsjPYdiHPGk86U?=
 =?us-ascii?Q?XnFYSe5k02Xlgo8/+RaHcLISHc0V7m7awDNbxI6LfmIIfQDOZ6YB7W13mXfo?=
 =?us-ascii?Q?IMsruZewJ2WP4fieHphgjR0Qr/3xCgl1pkobK0UKFJbRYluFqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:32.2490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c78cd03-7ccd-498c-3b00-08dcf9897f6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

The name "repc" has different meanings in different contexts.

To improve the readability, it's better to refine it to a name that
reflects what it actually represents.

Rename "repc" to "gsp_rpc_len" in the GSP message recv path. Add an
section in the doc to explain the terms.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 46 +++++++++++--------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 1a07c0191356..f6ed51921e50 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -104,6 +104,9 @@
  * |        params          |
  * +------------------------+
  *
+ * decoders:
+ *
+ * - gsp_rpc_len: size of (GSP RPC header + payload)
  */
 
 struct r535_gsp_msg {
@@ -133,7 +136,8 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 }
 
 static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
+		   int *ptime)
 {
 	struct r535_gsp_msg *mqe;
 	u32 size, rptr = *gsp->msgq.rptr;
@@ -141,7 +145,8 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 	u8 *msg;
 	u32 len;
 
-	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
+	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
+			    GSP_PAGE_SIZE);
 	if (WARN_ON(!size || size >= gsp->msgq.cnt))
 		return ERR_PTR(-EINVAL);
 
@@ -167,21 +172,21 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 		return mqe->data;
 	}
 
-	size = ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
+	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
-	msg = kvmalloc(repc, GFP_KERNEL);
+	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
 	if (!msg)
 		return ERR_PTR(-ENOMEM);
 
 	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
-	len = min_t(u32, repc, len);
+	len = min_t(u32, gsp_rpc_len, len);
 	memcpy(msg, mqe->data, len);
 
-	repc -= len;
+	gsp_rpc_len -= len;
 
-	if (repc) {
+	if (gsp_rpc_len) {
 		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
-		memcpy(msg + len, mqe, repc);
+		memcpy(msg + len, mqe, gsp_rpc_len);
 	}
 
 	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
@@ -192,9 +197,9 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 }
 
 static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 {
-	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
+	return r535_gsp_msgq_wait(gsp, gsp_rpc_len, NULL, ptime);
 }
 
 static int
@@ -317,7 +322,7 @@ r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
 }
 
 static struct nvfw_gsp_rpc *
-r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
+r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvfw_gsp_rpc *msg;
@@ -342,10 +347,11 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
 	r535_gsp_msg_dump(gsp, msg, NV_DBG_TRACE);
 
 	if (fn && msg->function == fn) {
-		if (repc) {
-			if (msg->length < sizeof(*msg) + repc) {
+		if (gsp_rpc_len) {
+			if (msg->length < sizeof(*msg) + gsp_rpc_len) {
 				nvkm_error(subdev, "msg len %d < %zd\n",
-					   msg->length, sizeof(*msg) + repc);
+					   msg->length, sizeof(*msg) +
+					   gsp_rpc_len);
 				r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
 				r535_gsp_msg_done(gsp, msg);
 				return ERR_PTR(-EIO);
@@ -414,7 +420,8 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait,
+		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
 	struct nvfw_gsp_rpc *msg;
@@ -434,7 +441,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 		return ERR_PTR(ret);
 
 	if (wait) {
-		msg = r535_gsp_msg_recv(gsp, fn, repc);
+		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
 		if (!IS_ERR_OR_NULL(msg))
 			repv = msg->data;
 		else
@@ -770,7 +777,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
+		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
 	struct r535_gsp_msg *cmd = container_of((void *)rpc, typeof(*cmd), data);
@@ -817,7 +825,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 
 		/* Wait for reply. */
 		if (wait) {
-			rpc = r535_gsp_msg_recv(gsp, fn, repc);
+			rpc = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
 			if (!IS_ERR_OR_NULL(rpc))
 				repv = rpc->data;
 			else
@@ -826,7 +834,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 			repv = NULL;
 		}
 	} else {
-		repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
+		repv = r535_gsp_rpc_send(gsp, argv, wait, gsp_rpc_len);
 	}
 
 done:
-- 
2.34.1

