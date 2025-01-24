Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D5A1BC1A
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADC010EA08;
	Fri, 24 Jan 2025 18:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AWWKhXph";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5625810EA0E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffTv81mWCWBMcSNZZ0NSpaq/z5ChFBQiVC2L8SBMUXVxEvFnmxqYKmG7FKCrhs/fWpu2JIX04zlfqJ/rqZA0+zKFOirNuIHTSRfYjEquEibzjhrcVotx3HN7sz0OLV5TG2lZ7Vu/j9ckBxhnXQZoQ71C9FSJklhzJ3Xl5JYvs0YFgMvdnjLIpBPouYxBMYmYBeXO4jqQJBDqOAorz4t5hHc3HnO1nBRvMpM+LR8NJR6CilAIIVdi+8j6t3P+ncp73HBN3twLVBErhboUrNMgNbpF17LQfZelrPxYu5SaBV8QbAHMT51v/aBa4u3gGQKR2NXnxXxxtmAmGlbaZmtblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Dc78JqtIeMPgrpwZTI4DG+DnHiBIH2oJXgK3jHTGM=;
 b=VYiItMsE44qXMeLAIMTUgZl+gBU11lGD0kjYpD7o4PHFR4P757CshC+hLvY0e8OM2JVnAOTimSPhL80rt+UdyMqkPHtZWt7JJpu64BdE0OTAICH2gzFZfCP233zQ+5WhjUymDYmIDsopc1UMmcYJVSB+huyiObyECa4fkULLTlXyE0h1VoMFaKLOTx7DCTUyXenA/SlK/d1USsLfyU64fMt25hxVt0Rttf5Fg8QHF06fjHH8jdMkaBI6naSxTd+Tkc1UxnxMzBtW4+g7gZ6Xox8qAGK2Mwho0TuQWF5+bYAD+DU2Pv07Jt8riDhZu5om5wiNdo9tNyZdFVU69pDQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+Dc78JqtIeMPgrpwZTI4DG+DnHiBIH2oJXgK3jHTGM=;
 b=AWWKhXphWN9Sk30OcYmiYCldyDDjODuNU3/jJVNCosfzp5C78G1YNGCMa1GC3tQrnsUW7jn3MbLo/Pa+kWlceW4r8bvDQuF6cM5GUosKttaa/jHgzPWyxS6zSfAEkXysEnCo/S+rKRIlUJhAQMC6SRja5nquPMNuCVjXygXxHeG9pqTDFOpFQxoWD21u3+xsZaEsIMLp6z2XA3LRza9FKWBcFItzVQEku6dqEhOtOZoKScrpakhnCryV/16wgeZA1adJ+BjAxZSREun/kECSH5WpMmqdpySuTYn+R9ne/v7D9JvWGZMrhGnNUbsvXBgIQ1bKC+9660oFJdjJzXO3Lw==
Received: from BYAPR05CA0089.namprd05.prod.outlook.com (2603:10b6:a03:e0::30)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Fri, 24 Jan
 2025 18:30:47 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::3d) by BYAPR05CA0089.outlook.office365.com
 (2603:10b6:a03:e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.11 via Frontend Transport; Fri,
 24 Jan 2025 18:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:33 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:32 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:32 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 12/15] drm/nouveau: factor out r535_gsp_msgq_peek()
Date: Fri, 24 Jan 2025 10:29:55 -0800
Message-ID: <20250124182958.2040494-13-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|MW6PR12MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b6b5a2-27cb-44d5-7c0f-08dd3ca53895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SW0w1F4JjrncwhQD4jjr06vaCKDpiNg5GNMOjN/LvYQhnD9dxzvOq5WCX51C?=
 =?us-ascii?Q?UwnZYv5VPYPEp7ZXmcPlOjS/U3nf9yrqgOZExow5zPLzBVk5/MOY9Y2iYUbq?=
 =?us-ascii?Q?HfmO/4VBK50qhVF3xAcAsta+RlxwCcMrkOCBlVHb/auiRMRlU+YGj4McvHu2?=
 =?us-ascii?Q?lS4EuH6L7SAlUns3QtQ0ZGXMor/4LV7mYM8yFIrMNCnAmglv7XEhA3kRWpgu?=
 =?us-ascii?Q?knWHQ8tvAot9DAwEHKGS8/UGw6p7Bpn9fWnpKzTM1rq8hsEjWKeYDgcYTXcj?=
 =?us-ascii?Q?9JypPylEjCVMfsjFbitt0kVNHpHQ/tK1bVtm5iqtmMAVv1BITI6faxvzlk/m?=
 =?us-ascii?Q?s5qo2vSI1A5VWirPpS2L3Zk1rFZGV9ki/8U9Rlb2O0OCqXuwVp6ZBbZQeyVT?=
 =?us-ascii?Q?O4+BMHvlbs6Okr06l3TCJmC6B416cqA/uZPyNjQH9Fo/dTE6Wu5IouieVLK+?=
 =?us-ascii?Q?WirrwugUdwpBhOE7igrkJJNzRsH76VHrsKo3c0bODMdPcJsPez7zxT62rurz?=
 =?us-ascii?Q?Ph2ekQ81yz9UTgP53A8BWgAq6OGJaxmS6850Yg0DpoE5tBR7O2wJb+C9N9Ov?=
 =?us-ascii?Q?vjO5k/WWT1J3V+mY90LjWysRXHiCBE/9NkriOHGXK5lsp6ogDF3g9J+mGvsO?=
 =?us-ascii?Q?DLh44F8NMcEcEtz9T2zbkOTVgQNpg/qOf5ZrIPCyzNxZqjwNh6fhmtCPsdwL?=
 =?us-ascii?Q?5CGMs1LXdkIZC1nhWtmdJVT9JxtidIFnR0MHMcTsf1wupw0SN+iGXv4vGVIw?=
 =?us-ascii?Q?s7GB27sRwBKRrQyVQa+uiaCaftgceDU3qJxwKPsJ0n0v0FW4v6/nfpK73ZWZ?=
 =?us-ascii?Q?BMePuMlf7YWfyk73f7BS+ATOVoj13GePYBMl2NW4cZupFigvHvTTZJWsYotr?=
 =?us-ascii?Q?oY7ZIqggWUnhIThoX4oZOzCLnPnSALvax3oYN/36aAwakvLg5q6B+Ja4rTBJ?=
 =?us-ascii?Q?qUHqnJ9hwBxpcGnsy/Y7zkURYxbsYycTUqsZmXzp6LAIg0KU3MC9X5fcr4B/?=
 =?us-ascii?Q?I9yHYTdPy1G7IYfX1zd/eEd9UHr1Sfehsext06gN6aKhJ1siLMaEHFLMt2Bz?=
 =?us-ascii?Q?2HowHmp4WweG0gAprG/YAZUg8vOG/8ogTpO3M95QSF/doHR0J3XHv9g0A77z?=
 =?us-ascii?Q?WUgdHqLYCzGahWGbJztMh3Y+YzAquy3jsYXppA7LQqWVcmURFrnQw+GrSTIW?=
 =?us-ascii?Q?eLEsemod5FDvkVv6s8k6tZd9yjPrREYN6IEE/sL+MRgCh9hgMrGhG4tw5iu6?=
 =?us-ascii?Q?nLbos+LLlXFnDryq//iqT6m3DkzEcUVAnf1bZBTRjc0l05OQH3pHcji2UpUr?=
 =?us-ascii?Q?h4+KiNIFH7a6P29KhXNB4T6+4+6MEyw5EWmPpqR2NTDsjBBuP8WuXYYXGhCJ?=
 =?us-ascii?Q?yd/uyBpFa//MSXk0rEZZU3xhS6LAo/CD81qU1571o/rBNnXnv2zYDPHBdv21?=
 =?us-ascii?Q?rCXFNbLwTwINVqLQLOLiu9y1bBwmrPZiv1cg26FleftQnlU20ExqnT44LJzG?=
 =?us-ascii?Q?KXidEYbGRsQ7ofg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:47.2757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b6b5a2-27cb-44d5-7c0f-08dd3ca53895
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708
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

To receive a GSP message queue element from the GSP status queue, the
driver needs to make sure there are available elements in the queue.

The previous r535_gsp_msgq_wait() consists of three functions, which is
a little too complicated for a single function:
- wait for an available element.
- peek the message element header in the queue.
- recevice the element from the queue.

Factor out r535_gsp_msgq_peek() and divide the functions in
r535_gsp_msgq_wait() into three functions.

No functional change is intended.

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 89 ++++++++++++++-----
 1 file changed, 66 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 864bacbd0ab9..f603298448f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -148,20 +148,16 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 	}
 }
 
-static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
-		   int *ptime)
+static int
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 {
-	struct r535_gsp_msg *mqe;
 	u32 size, rptr = *gsp->msgq.rptr;
 	int used;
-	u8 *msg;
-	u32 len;
 
 	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
 			    GSP_PAGE_SIZE);
 	if (WARN_ON(!size || size >= gsp->msgq.cnt))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	do {
 		u32 wptr = *gsp->msgq.wptr;
@@ -176,15 +172,69 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
 	} while (--(*ptime));
 
 	if (WARN_ON(!*ptime))
-		return ERR_PTR(-ETIMEDOUT);
+		return -ETIMEDOUT;
 
-	mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
+	return used;
+}
 
-	if (prepc) {
-		*prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
-		return mqe->data;
-	}
+static struct r535_gsp_msg *
+r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
+{
+	u32 rptr = *gsp->msgq.rptr;
+
+	/* Skip the first page, which is the message queue info */
+	return (void *)((u8 *)gsp->shm.msgq.ptr + GSP_PAGE_SIZE +
+	       rptr * GSP_PAGE_SIZE);
+}
 
+/**
+ * DOC: Receive a GSP message queue element
+ *
+ * Receiving a GSP message queue element from the message queue consists of
+ * the following steps:
+ *
+ * - Peek the element from the queue: r535_gsp_msgq_peek().
+ *   Peek the first page of the element to determine the total size of the
+ *   message before allocating the proper memory.
+ *
+ * - Allocate memory and receive the message: r535_gsp_msgq_recv().
+ *   Once the total size of the message is determined from the GSP message
+ *   queue element, allocate memory and copy the pages of the message
+ *   into the allocated memory.
+ *
+ * - Free the allocated memory after processing the GSP message.
+ *   The caller is responsible for freeing the memory allocated for the GSP
+ *   message pages after they have been processed.
+ */
+static void *
+r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	struct r535_gsp_msg *mqe;
+	int ret;
+
+	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
+
+	return mqe->data;
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	u32 rptr = *gsp->msgq.rptr;
+	struct r535_gsp_msg *mqe;
+	u32 size, len;
+	u8 *msg;
+	int ret;
+
+	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
 	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
 	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
@@ -209,12 +259,6 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
 	return msg;
 }
 
-static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
-{
-	return r535_gsp_msgq_wait(gsp, gsp_rpc_len, NULL, ptime);
-}
-
 static int
 r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
@@ -337,15 +381,14 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvfw_gsp_rpc *rpc;
-	int time = 4000000, i;
-	u32 size;
+	int retries = 4000000, i;
 
 retry:
-	rpc = r535_gsp_msgq_wait(gsp, sizeof(*rpc), &size, &time);
+	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &time);
+	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-- 
2.34.1

