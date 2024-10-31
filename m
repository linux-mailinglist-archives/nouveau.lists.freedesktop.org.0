Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAEA9B76D1
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9610E84B;
	Thu, 31 Oct 2024 08:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AcufwY+s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82A510E848
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7l5wWF6/FxmAan8EcoQQC6jryzPcoI1DB7mR7Fogu096XuPYhZtJTQz8Ei1TFt2tAq4rv0n7H9KuKR00w6Hr0+ktjYEXNR0Qv0CwBdw4xRNUYqtAxihCaHv1nCdjn0ITPD95tPqUOUAfqAaSwXbyDBjut2zTysR9H0njgoycf68I6JnxRlzTnn9NUpgL86IgpwqCXY2ClGnLiIvLnr0i8jglYfbMfxlYCDhvC4utD0qHPojIpCvcq/dWz/sWZDJmd9cyCxOBGz/gqGJPsCXND3vvvuaCBnuOtfXegZbHicA0GwokHnORoKkD+hG1NVQpcBDRGV+TgqFb7B4/ehcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmYbw5tk4QJwxkE+HGTK3qZt2C0I1qQgf3shZYR6VO8=;
 b=xQ2/r1A93+NGmqXuFzb28EoKd4WLuyP6R0h09pcsarYSQPkHmakPffu3uhlQSDt6+kY5uI9+bLdkabe9wUaQoXruBtqeO1xQMC6yCZg2OTOSEoT6cLrHlBxlBwQHpGTLmnZOlwj0D0vXk9Ymj6XEhf3Txugj/v/Si0XmMeR3MK4kjtMDcqcDNrePBKDlPlN5vvTeVfbseln6qwlhkPw7MWZomMUHwS/+ifhk9i3jiedvh6VroKxTCoQk29oUrFlAM/dXTFIYGw+Wv/nKd7NLmU4ahRaIbBrw0jHcRcOSl8W1p/ASEztDORd7551ZrwGsL/WVt26i/cpxE3HHm6dt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmYbw5tk4QJwxkE+HGTK3qZt2C0I1qQgf3shZYR6VO8=;
 b=AcufwY+sAeW1Ndq89qZE/E4vImw9TmSEX5hzN0pY1Lop5C5cPGaY6Q8g2xP3Imua4JHhST3c+pUsV7CUfRmAqBCjj+VakBb5v6RFDe4RhZM1ooxulxuLxJJaXQ9b5Cg3N7IRFnwlYkAq4opFW4tOak+5EcktfrqbFO8AdA5hoow2clOiZ606RXeKZlMznDxfLmSepFpJ38n6rOpamuy5TtTBcWt+OVigfN9qdiqlOMT5/6IXlz6OIISESAvD3rnMyqeuAK8RtpThiiGVi6/6NYH19yh4/3pQU5T4C4Q+17fnHZRjTHIYB7r2+B+tBtqNxyqsuwqejGWgwOG/7Drlqg==
Received: from BL1PR13CA0319.namprd13.prod.outlook.com (2603:10b6:208:2c1::24)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 08:53:30 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::ca) by BL1PR13CA0319.outlook.office365.com
 (2603:10b6:208:2c1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.14 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:30 +0000
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
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:17 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:17 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:16 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 14/15] nvkm: support handling the return of large GSP
 message
Date: Thu, 31 Oct 2024 01:52:49 -0700
Message-ID: <20241031085250.2941482-15-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d2e0a7-206a-403e-6bd7-08dcf9897e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DNpeS1k13wNLtWQhlCPgcJDvZdnFHD7korsuw2+AbEUOkNHg9PCa7RXIv/DY?=
 =?us-ascii?Q?KVrOP4AVhe98AArsFJrPTl/cerxTroS0jax4cKsb5ZNM136o662gAd7dNlbh?=
 =?us-ascii?Q?nGsOnL39NwsancM07yaiNVe8LJw4R3+tw971p2zh8OVzX6083TAzuZYpsxLo?=
 =?us-ascii?Q?+GrXYm0aJ3+eB5I5bal0pmGq/ZlOzSX6uQOnpLvrTAtGf9GFUmzF9CQp4bLw?=
 =?us-ascii?Q?yLJ23myeNtrRLF8Gd6zznevWqkxsVno2hnCARGB2+lLIewCx7/r45uUqMmRz?=
 =?us-ascii?Q?V6/6iYy6HR8lqCPrMRLnq6OupXMhHIdnU7GSXmnOQXnXxcmc3Rc0fgu2W2Jq?=
 =?us-ascii?Q?cA1La7EXfCPjbhmJqSBuZ6WCFrwes0PBa/ewBGXGa59ECUiFPvJXMKUjLVXA?=
 =?us-ascii?Q?DzJLhwcAzHaXBhqqvmUUPAlgCLIrQ1bX7A4LRNG0nAbKCudwnJhfJSEsFI9a?=
 =?us-ascii?Q?wkBJ+b3Sdwt1tncMT5BNQd4+DA6OKAijsoIm2g1R1hfMibY/iNjSlAL/a+Qr?=
 =?us-ascii?Q?EJM+Z7Tw2PvI8PiVJX5X56VmfRtiAoUylRlvczPOEwtMtU0Z5jg1wurCzYjZ?=
 =?us-ascii?Q?rH3tTaJWmJ+RA4ZxXU9+a9l3L2zxe9k+XpiU40FzpMqHcZJK1CjYfly5khkO?=
 =?us-ascii?Q?GMqWnuPh/NWDrr7v4yG4TjCOAKev9qnXzpXC2ldjxMt/KxzD7gLjf087amSG?=
 =?us-ascii?Q?Z10k+hLA3XOEgmR/j3ktOylv/RD1XPS4hp3SjpP7QOTxuOrQoXugrkhanhkB?=
 =?us-ascii?Q?GimHut/tL1jhTVRjPeR1r5CQWEP0P/InpUvNYSx4XdpTjelSnNDsx5iAGFX4?=
 =?us-ascii?Q?8Q1m+fG+D/ifDpi+SAeA+rdeMFm77gaF2d/6mKoL/ZahEuV4jV/hXo8jY0Cy?=
 =?us-ascii?Q?DQmes+X3NCLABdkL6j/bTGW88cHSW9nDxl1VSvVWH+KBlqJR0s5kivQdfHBG?=
 =?us-ascii?Q?ApxA6eF13Ku5czkYi+VgyCUbIFbSM0zlakURyGOjB8OeXeMvw/9opXnUXkjp?=
 =?us-ascii?Q?leTkJ+/mybsaaK5lqgHesTMHrBFy4SQNpjtCc2iuQTED5n4DgYts9/Rfdvsz?=
 =?us-ascii?Q?idzciLwlsIt66g8yLYNzKPSd2CvvvCa2ksdmSmtDMNNlXiq+lwJFtRBKVGtZ?=
 =?us-ascii?Q?f6QWw4nr1bFj3NwYL2i+ChGSXPP7HotMoAZzJtbPsxBPHwLWBOXI/raIaUKK?=
 =?us-ascii?Q?PRdBegwv6cy/SjJudHKePHpX4Q9zKKeMDTMCvEVlsctLeE/Vyv7uwOQb6uw4?=
 =?us-ascii?Q?KKAGQefOjyvbzsnL4+T6QeA7knVFOkEw6LDxrftEl12gQZICIqPGbIHr0MX5?=
 =?us-ascii?Q?8KY9txEeq3pSOlws9+cSgjg0cNYkFfN6SERBsx7OWd8kb1O6MmdrGwTV9At3?=
 =?us-ascii?Q?tuo5bV5jUaAvNiRvJLbyhOLv6tNv1nyfR6CXtAgKLaVwWCh76g=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:30.5655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d2e0a7-206a-403e-6bd7-08dcf9897e7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
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

The max GSP message element size is 16 pages (including the headers). To
send a message larger than 16 pages, nvkm should split it into multiple
and send them accordingly. The first element has the expected function
number, while the rest are sent with function number as
NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD. GSP consumes the elements from
the cmdq and always writes the result back to the msgq. The result is also
formed as split elements.

However, nvkm is able to split the large GSP message and send them, but
totally not aware of handling the return of the large GSP message, which
are the split elements in the msgq. Thus, it keeps dumping the unknown RPC
messages from msgq, which is actually CONTINUATION_RECORD message,
discard them unexpectly. Thus, the caller will not be able to consume
the result from GSP.

Introduce the handling of the return of large GSP message on the msgq path.
Slightly re-factor the low-level part of msg receiving routines. Merge the
split elements back into a large element before handling it to the upper
level. Thus, the upper-level of GSP RPC APIs don't need to be heavily
changed.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 111 +++++++++++++++---
 1 file changed, 92 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 08a74d8bd06f..41da8c72d618 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -104,6 +104,17 @@
  * |        params          |
  * +------------------------+
  *
+ * The max size of a message queue element is 16 pages (including the
+ * headers). When a GSP message to be sent is larger than 16 pages, the
+ * message should be split into multiple elements and sent accordingly.
+ *
+ * In the bunch of the split elements, the first element has the expected
+ * function number, while the rest of the elements are sent with the
+ * function number NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD.
+ *
+ * GSP consumes the elements from the cmdq and always writes the result
+ * back to the msgq. The result is also formed as split elements.
+ *
  * decoders:
  *
  * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
@@ -125,6 +136,21 @@ struct r535_gsp_msg {
 	u8  data[];
 };
 
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
 #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
 
 #define to_gsp_hdr(p, header) \
@@ -203,8 +229,12 @@ struct r535_gsp_msg_info {
 	int *retries;
 	u32 gsp_rpc_len;
 	void *gsp_rpc_buf;
+	bool continuation;
 };
 
+static void
+r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
+
 static void *
 r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 			    struct r535_gsp_msg_info *info)
@@ -222,11 +252,28 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 		return ERR_PTR(ret);
 
 	mqe = r535_gsp_msgq_get_entry(gsp);
+
+	if (info->continuation) {
+		struct nvfw_gsp_rpc *rpc = (struct nvfw_gsp_rpc *)mqe->data;
+
+		if (rpc->function != NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD) {
+			nvkm_error(&gsp->subdev,
+				   "Not a continuation of a large RPC\n");
+			r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+			return ERR_PTR(-EIO);
+		}
+	}
+
 	size = ALIGN(expected + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
 	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
 	len = min_t(u32, expected, len);
-	memcpy(buf, mqe->data, len);
+
+	if (info->continuation)
+		memcpy(buf, mqe->data + sizeof(struct nvfw_gsp_rpc),
+		       len - sizeof(struct nvfw_gsp_rpc));
+	else
+		memcpy(buf, mqe->data, len);
 
 	expected -= len;
 
@@ -245,16 +292,26 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 static void *
 r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 {
+	struct r535_gsp_msg *mqe;
+	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*mqe);
+	struct nvfw_gsp_rpc *rpc;
 	struct r535_gsp_msg_info info = {0};
+	u32 expected = gsp_rpc_len;
 	void *buf;
 
-	buf = kvmalloc(gsp_rpc_len, GFP_KERNEL);
+	mqe = r535_gsp_msgq_get_entry(gsp);
+	rpc = (struct nvfw_gsp_rpc *)mqe->data;
+
+	if (WARN_ON(rpc->length > max_rpc_size))
+		return NULL;
+
+	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
 	info.gsp_rpc_buf = buf;
 	info.retries = retries;
-	info.gsp_rpc_len = gsp_rpc_len;
+	info.gsp_rpc_len = rpc->length;
 
 	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
 	if (IS_ERR(buf)) {
@@ -262,6 +319,37 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		info.gsp_rpc_buf = NULL;
 	}
 
+	if (expected <= max_rpc_size)
+		return buf;
+
+	info.gsp_rpc_buf += info.gsp_rpc_len;
+	expected -= info.gsp_rpc_len;
+
+	while (expected) {
+		u32 size;
+
+		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
+		if (IS_ERR_OR_NULL(rpc)) {
+			kfree(buf);
+			return rpc;
+		}
+
+		info.gsp_rpc_len = rpc->length;
+		info.continuation = true;
+
+		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
+		if (IS_ERR_OR_NULL(rpc)) {
+			kfree(buf);
+			return rpc;
+		}
+
+		size = info.gsp_rpc_len - sizeof(*rpc);
+		expected -= size;
+		info.gsp_rpc_buf += size;
+	}
+
+	rpc = buf;
+	rpc->length = gsp_rpc_len;
 	return buf;
 }
 
@@ -350,21 +438,6 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
 	return msg->data;
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
@@ -396,7 +469,7 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &retries);
+	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-- 
2.34.1

