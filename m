Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DBA1BC1D
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D910EA10;
	Fri, 24 Jan 2025 18:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VX6+uOlI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5C10EA0E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJbwGDws/1lsBAmrmPP+dNIAM1mewUR6Aqix/vE0erCA6l21/QMqNjud0gbvMCVdAgeN4zW5VfIuO/qBsdJm6WbqDPA9Cuh8eZvUd849s18cAhKe2lybSQ2NfAhLtQG8gNYPkvugu5bciDk9mLEwJNTShN3m8sa0DS7STrwP6mO5OHjKV8gkzXs8B0hE9Sp52S/aemvD9GgdHTZhEoytyGSfLi7K3wT3QbsrAWBaBxPp5Mju1ALAn/BdjhmHHqP9jZazuVKPePfj+gdshduOxwOJEoJECrEfRmm1QQ271L0M/pWEWlZrHvmeddgUJAFXgCcu8ewaoY1dlx6wGToeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cisStOlzp0DO1E1fyakkEFC0rCNVR+/daRuYqwUJc0M=;
 b=JF12VdFq0LOaEHlW1we7JoYuLKm/xCkueSIkrE09Lp+DXiyNRyBa2PcCtNOaQDP3r/o4+FCvaNXJ8kXAOAZzSvLfYPpWvnU0f22QGGg09VN8oLYNudTlw0jPfRLYIcgro/kVnE4aMoS5Lz0DgNNlY76BdCdeyYBCTVP56lrfX3YeDHeU6fYD9KdGb2qaxIjvptNVsusNUQmWf8c9xHgiR+xvOZi+LKx1KROlN1AjgcItglD+kchuCosY7tYcPtFHRLIT3ThjgOj/y3EDCDG5rQddquIsV1lPnGjdYbgvBeKs10Ydb7Wi6kFsiPXfglAPCGftU0dfx3JdFRzpOwxQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cisStOlzp0DO1E1fyakkEFC0rCNVR+/daRuYqwUJc0M=;
 b=VX6+uOlIstof9SLs0FJc/tuxnILCBf9iK3SqldTag4dG21gZt5jLSg2A5q8hMOjUK6/kK0UmxpCvmNEuG5MwnMDHH2JD6IetMeNEhkpVCx1GhzFhCgtWK2rCkf1NFx2Y1+jw5JNXoljs7KGXJl4PbGX8cDGJqqrEEyUoEQGGnt3cjPgaQlqYSSdustWjcvE6U6fkZFVz2UqTBTA66SYveIKvg1bZY+iq+5GGD9txfOD8LvMc/cPJHnS0s1l4aqKIoLEUXhx7AZXEPXft7jyS2khjkPATNMIkRfy2We8Hkfzb5qhPJHFT13UDez5z3lq5ny2aSEgIiuurwPzUBuFciA==
Received: from BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38) by
 SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Fri, 24 Jan
 2025 18:30:49 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::f5) by BYAPR01CA0025.outlook.office365.com
 (2603:10b6:a02:80::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Fri,
 24 Jan 2025 18:30:48 +0000
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
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:34 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:33 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:33 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 14/15] drm/nouveau: support handling the return of large
 GSP message
Date: Fri, 24 Jan 2025 10:29:57 -0800
Message-ID: <20250124182958.2040494-15-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e84a2bc-cef7-4b5b-0ba2-08dd3ca5393b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0dwGo9Jvyl2cd0E0jo8Fk/845+QuEQQeQ4u/GvVRlEc4RdVChMfcQwaBIKvE?=
 =?us-ascii?Q?9lrLQQ54wVaGUlRTiSgVICmx1w7EHFxI/pRw0NPdLQU1V2vuGkLELgB2FLIn?=
 =?us-ascii?Q?0zRf4o4QAz0WwM7J2wiYqQijFsBzU0ip9vylGDuInqhRrHzJC04Qn21EVvfZ?=
 =?us-ascii?Q?kVFKHHDIjjYG8zq3Ye4ZNzBva+lKbUYoS6p/yGCStN7Dpq4UE1gO7hB31byQ?=
 =?us-ascii?Q?bju4cwNgMF0FJpu13fUIXIQHYlfJalUbP0TJoYVh6glJpQQQawJdVLdYbofJ?=
 =?us-ascii?Q?ROdAWvOmqOKufBSkxEgXRkBP4EFdB3iZbViaN3i8DMM+cRH6fPC4QnQbPKmE?=
 =?us-ascii?Q?4C0jLLKt0/QqnwJ88w68xaiviy08RZR+s7Jy1y7+/3zqyL7JmvJKs99KD5mt?=
 =?us-ascii?Q?ecnuBItHsArkYzlm67ZCcRguzm37ZxYcRTy83LYzBOMjghzGNMmNa5yjsZ2f?=
 =?us-ascii?Q?MV8J1WYjMva8X+2e+o1XBPdv+QM7j6+kbhpdg6ebpY+0pYlunHyt7uBbwMFD?=
 =?us-ascii?Q?am1LTvS0zV2p7Y4EJYg+yOo93VxUBETc3BgwTlD4Fd5ErMUhWPtFls0NXEzN?=
 =?us-ascii?Q?Rol4pKlwYAIs+YDKEO5/Z2XNfklfWAe61gsztfqwr792J/KslVyHRry7PvEP?=
 =?us-ascii?Q?QEHKhT69WzEUDE6RVM3OpsFurSBPSL8pqsZKG7dI+vtldJG6Fsl7mdmdgj17?=
 =?us-ascii?Q?DJRZTUP6DrY0xq/t6A1eocdRP2X5gVoQfUpLVsgEigU7kStJ3quZ/k3wr6BI?=
 =?us-ascii?Q?DGAwaG1HmqcgB2jn9cK31g+iGLsGFPgKPNL1N2qVMt6X4f7DqfEfQkb94LAt?=
 =?us-ascii?Q?BzAwuCAGkgV0osEi5e3z9P14jMglC6TkSJyIcwjEOHDFt7v1tLm6P239yg63?=
 =?us-ascii?Q?mvJHW3LGXjxjS+BhCf0cZOxTmjN6PVCPEwFBtATfvORHxfTCzzjP/0PbSERd?=
 =?us-ascii?Q?fAzJwMB4UKgz9RRSD6koOPwE97JqmVvLm/6Cma8Uq0W3aV2sd3yZr0LA3aXS?=
 =?us-ascii?Q?7hZbuD6a2b6LXLQYqmGY1NWGvokUNMZUUJH9lrM3AaeO9Wm0PmcAgumghnsn?=
 =?us-ascii?Q?gMPx7ueiM0L6lOj8ZNlsaRKqvz7Efkt5Qn5bX/I3Wakp3hM7Pr40U9DfrqGm?=
 =?us-ascii?Q?tSyhqmD6OZiZwtE7Z6muJeoZpgFCWJrWeG87qDq7EkHuM7hdMwphYTr8EHLj?=
 =?us-ascii?Q?kSHxf6uautJcJRCF3jOvHWZDW71Ov+WvnZb6JzNw3Pgi6nRhR+2XN4dgN1vn?=
 =?us-ascii?Q?v7FtIhBQE6VFhkJtnF+8Tjclt+dPIv+W5CTI2vEZYhq3ZBUPtKKXNW1Mc1zy?=
 =?us-ascii?Q?rQIim6N3w7QDlxsyk8xq2Gjvnay/rxDCz8z1O7SMMXd1ryS7VtssfMfhnEQD?=
 =?us-ascii?Q?klLShwKjQ4AVDKXhOAehn14UTo50CfAVJm9NrmbLLUn361QD7ZsqhooIjzKZ?=
 =?us-ascii?Q?SzvZbsgwTL75aBhyaJTfUfnS8rXxg54yl3ARur2K3hXJLO2JkCLftiT3E+8j?=
 =?us-ascii?Q?lAGtE0NhblQnOvA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:48.3138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e84a2bc-cef7-4b5b-0ba2-08dd3ca5393b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769
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
discard them unexpectedly. Thus, the caller will not be able to consume
the result from GSP.

Introduce the handling of the return of large GSP message on the msgq path.
Slightly re-factor the low-level part of msg receiving routines. Merge the
split elements back into a large element before handling it to the upper
level. Thus, the upper-level of GSP RPC APIs don't need to be heavily
changed.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 116 +++++++++++++++---
 1 file changed, 97 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index d1ff038b0d95..40bc3aeb5111 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -106,6 +106,17 @@ extern struct dentry *nouveau_debugfs_root;
  *    |        params          |
  *    +------------------------+
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
  * Terminology:
  *
  * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
@@ -127,6 +138,21 @@ struct r535_gsp_msg {
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
@@ -205,6 +231,11 @@ r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
  *
  * - Receive the message: r535_gsp_msgq_recv().
  *   Copy the message into the allocated memory. Advance the read pointer.
+ *   If the message is a large GSP message, r535_gsp_msgq_recv() calls
+ *   r535_gsp_msgq_recv_one_elem() repeatedly to receive continuation parts
+ *   until the complete message is received.
+ *   r535_gsp_msgq_recv() assembles the payloads of cotinuation parts into
+ *   the return of the large GSP message.
  *
  * - Free the allocated memory: r535_gsp_msg_done().
  *   The user is responsible for freeing the memory allocated for the GSP
@@ -229,8 +260,12 @@ struct r535_gsp_msg_info {
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
@@ -248,11 +283,28 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
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
 
@@ -271,16 +323,26 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
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
@@ -288,6 +350,37 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
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
 
@@ -374,21 +467,6 @@ r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
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
@@ -420,7 +498,7 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &retries);
+	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-- 
2.34.1

