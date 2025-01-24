Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFBA1BC17
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619EA10EA0D;
	Fri, 24 Jan 2025 18:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nuwVkDxr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864F010EA0E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+Ayrk4wxYvWYItofyTELTqtz8/ct/fYcjne1iAHB+u7KsFzTNdO1jTxTkCd3SPhK4ElreD0YpKUVQEN6nsHKcB8HEm3xKmPeoaRtl4UYI2ZludX6/an/keG+pkWdQ56iML2rBC+FWqvkJlHG5Bb9zB0nv8NUBDNK63IiQ2CsI++Uf6OdEr603XO71sZPP2DF2N5/DEj8O/zWyF9i3mNTYv7bZ1jF/Z8X4OexIxdOnzYJXqCdw6xuMo0Vc9Ym+N4b8eDiIwdJFRb7c1DlmkCXIIGCJSiOEs0Nt6lSZ1SNu6WqMI8hh3XqpIaDp6ijQ+qU5eZB8cM9V0aPFsNKyFggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6tzBumifCSZZ/bOmRTkEWECqENX4S1+PQaF15c0tZ4=;
 b=ay67NPBJbzL65oV2IDZMMs4lzjHrxoS+7mrGKYLUPfojjYiBfE8We+bMTgRC5QKBeNYn296aKShE99LRBDKxMVfq00TadO6HK+YU2bkWvO5Y6w5v+1qXu7K4MvM98+V6zOevU7YfzpWSUg1unmBRP7pU8R9I2ZwHbqaJqa54H2cw2PJq9ZwN35m2BJGl9PTVLx3jEHbZy+tjNdzVMvvURPIs2iw+lSljiNEV+d1EvF1waBfwIx4wT67iUUlubfnrkb1IRgM8aQ3VbSr2zq48U+CwrzXAXwUfaAMPVfPkQhc0t5wPVGu1iTU/cla+aRSaz6cPQwOZZ7d5MOSlTc9SPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6tzBumifCSZZ/bOmRTkEWECqENX4S1+PQaF15c0tZ4=;
 b=nuwVkDxrjEIMaxCJuor+NjR7JkfWNboc7nALTA6EoMvFeCZUQeQFrsmXl2w84qdoav7iikCoLO7N1Lr2o/spjHQ0rXnd2xHtpuu72CvBk5QVfkr4PM75GXjz70oRca8ziKD/rx/L7xy75j5gXtBFUuipSs3XMlJGu/0cd5OlSqT0D053KyDws/oW9ObxdBcryw/Q4DBjfskH9mbcxNcXUNubENVno4stoE3DIX1JB82+QDcypzoNIyf/L37UI7tp2XXRsDbk2BGhk8wIv69bNpUdrAqZ4pterh9Iv5OXi8+61L22TQPget2XOzf/LZLl2P2pmWtlHLscaE6g7oCVwg==
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 18:30:42 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::be) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 24 Jan 2025 18:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:26 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:25 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:25 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 02/15] drm/nouveau: rename "repc" to "gsp_rpc_len" on the
 GSP message recv path
Date: Fri, 24 Jan 2025 10:29:45 -0800
Message-ID: <20250124182958.2040494-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8e7209-8d1c-4222-a773-08dd3ca5353d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CTay2aRxTX0mMHcJ0jjMnYpXZDBlqdwzb4v+UMGJYugdkC33nQuqc0hT7Vu3?=
 =?us-ascii?Q?xD0W/UXz9DU6AL3p/WatVGDQvTdbi7sxRrGNXSlfmJH/hcJs3I+0P+XJzg0M?=
 =?us-ascii?Q?Ni3mna7tKsenLbcQF12/uUYjY961W3A7lzf8hRji2gVul/TeRPTPbcvINXOu?=
 =?us-ascii?Q?dzHV64XS2iXoH12DcUwM6HfrAYjn/X3XSug09PL8Dno0yjKggxiEz7j6cnJW?=
 =?us-ascii?Q?tTDkBoIufT/FrzGqXM/CnS8XbIPLpL65DTitb1GrbRXB4azh7Thcfu045xdS?=
 =?us-ascii?Q?uOXgUJP7W9HeJrjVR5qd04aPOSoj4VNMyUXG0KdGj7NbJiTMIqv9uZOlhDVw?=
 =?us-ascii?Q?5cMexMRrhZ8QZfBwlYqwbkTmaFqE2mI1+zcqW+xp9eWvMHkofQNMQP1vGMfp?=
 =?us-ascii?Q?IAPFfC8C/xBxHrQcsNb6M/tzQJDqZ6JlgtckkmW4CYMiIfMTJTO55pUA4JQG?=
 =?us-ascii?Q?LERUUYrQlz23+6VIiqU/Cf20CSQ38ZlTUglfvR82dEML2RF0U6dnmjQzdbub?=
 =?us-ascii?Q?mGpKDbGrK87v89mphCNeG8mRjz9Qa/W8Kzyo+emQEa+7d74P+mG3QrxvMblr?=
 =?us-ascii?Q?/PV9SBFH1cJG42igsjgfmPDIfS34W23762c8kuGgUTKKlRAi3ledCe5zNs6X?=
 =?us-ascii?Q?HgwZEAEf6Kt5QXMofmWTA5nBUmm4bKun7UQZeuJiJ3yE2qifM21VXeTGCDpU?=
 =?us-ascii?Q?kjQ8XIAdxjhF9eaP4l8E4fownvd6MyoBValdYCZWkL6fdybJFNHFndLMs9ks?=
 =?us-ascii?Q?9wQfY63EoBM+SMoI38zPRh98azahWRI4iU5xGhhj72CsKe90TUehS5z2fA1p?=
 =?us-ascii?Q?P5SYub1dYtm6P/p6Cnim7phgOXAf09n+iXfu0MSz61oL6Z1hI6ly7vt8tc43?=
 =?us-ascii?Q?Jdg8UMuogWHIwocQGBzNYSV+f1TDw72OevJNFDZ30AY7iq1OzwmLZSng5j2O?=
 =?us-ascii?Q?yi7cJ8I8Kjn+op4cck/Oyzs3/n1nT9g3koQ36eZvaOejzz/SAoN810xAZdVp?=
 =?us-ascii?Q?n9tN/fL4nY2huJhWxnl30sYvhqc7qavlvo8CZZHr1xtRsupJtjthNr2Iiq4C?=
 =?us-ascii?Q?DK9qPXztAauf0Jus/PyG87zLMzmEKAJpgs6/rvfKc6o0XC8PsBryV8o1sG51?=
 =?us-ascii?Q?8BAUWvUXEE4XrsLoxD4QMfSBRvobGdP9tl8Xh0ZTyMzkbZv3WjCOc9sMadj5?=
 =?us-ascii?Q?ETrTY6Ns0ts+dqAbpSiy4oDu/WN1k3ppfnTj7+tLDznpc94PCu4U65JKV3P7?=
 =?us-ascii?Q?jVUdN71CUFRGbp5aDzgNJErSaYFhjxIh2RX6Hels/Wr7x3kAMlxQGlgYfjxz?=
 =?us-ascii?Q?6XBW5dMDDtWoBIn0dLV3TbLMrRdIx5BzdkhNFNClC5Tg3g2mFK0UMDuK3YmI?=
 =?us-ascii?Q?rCltkNkbKtcatqA4Tn6y4tUIylwTbMsmrXjq0E5DbgsaY+4Pz8yLjgK+jJmo?=
 =?us-ascii?Q?WONDhss2+KAQPmjGmDBkGDC4O91dGeSqI9DF2CV8KETLV8tZrGRzwlbccomZ?=
 =?us-ascii?Q?USEd3ikSgSvo+j8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:41.5419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8e7209-8d1c-4222-a773-08dd3ca5353d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 46 +++++++++++--------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2a315fe55857..3189d5c475f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -106,6 +106,9 @@ extern struct dentry *nouveau_debugfs_root;
  *    |        params          |
  *    +------------------------+
  *
+ * Terminology:
+ *
+ * - gsp_rpc_len: size of (GSP RPC header + payload)
  */
 
 struct r535_gsp_msg {
@@ -135,7 +138,8 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 }
 
 static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
+		   int *ptime)
 {
 	struct r535_gsp_msg *mqe;
 	u32 size, rptr = *gsp->msgq.rptr;
@@ -143,7 +147,8 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
 	u8 *msg;
 	u32 len;
 
-	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + repc, GSP_PAGE_SIZE);
+	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
+			    GSP_PAGE_SIZE);
 	if (WARN_ON(!size || size >= gsp->msgq.cnt))
 		return ERR_PTR(-EINVAL);
 
@@ -169,21 +174,21 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
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
@@ -194,9 +199,9 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
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

