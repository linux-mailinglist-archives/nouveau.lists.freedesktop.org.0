Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50B9B76DB
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E810E845;
	Thu, 31 Oct 2024 08:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PK95xiog";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E19310E849
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9FpvXPa0R2AXjNyts4y5V4af9mdNd6Ex1doMTlXaK+su9WCOH0SitpIKudlEaOOLETVvi14FBFIWx60mBBCVrF4Eg2fBbpesAKwW/2ggxp3VHQNLR5L4Q0Hzr4QIwXNMjs742erLTCuujydwwxmverY+Iz9OLNo2CbND/t8mE3jp2P+RiO5QPx1B+/w8BDZvBPGL5oA+a8vUHn6gcKdbxiajqgo/fwk8woQV7FwOqT44yrhSCvvG0nDkdnTII41IEDAdlKhKilYTiWQo/n/C52I/KbKvV6HIn6/7+xpY/jjGTymcLIHFLhTL53wdyWaVhiO9sER4fgNDT2zi9Ulmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiiKMfXEYUMLLP+o1gKMEz55E33XyoxpObWakKxHdk4=;
 b=UbI+kwpHGKvxdKIqetBH3SvTX12pYoXnl+lqIc6k+EFKPMpKLhJ8Tv2TBOzb9kKvq60oGz23wTv8YwuPiRmk0IXUQTy5sO0HHCX9GOqRVmO5/qxpS3g6eVFe5Eo74yQxGHGuoGc3Cg7qqdmZvW0VBTb0VH0rPCtup526xulr5f3kRAggUy2dZIPv4GTW/Z2uSTLoFpAiyIBgV46iInXymJ7VdKv+JNFYUSNQ9V457romJ/wZH1RBavUNXknjfhu/qRUdZsYvGw8kyB9F7o2QWAPzw9b6teHbZ8BU/0ICe6XX/T70WTFd6NH/FoB9wq7mp/1J3NVnTfOPngodOcHguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiiKMfXEYUMLLP+o1gKMEz55E33XyoxpObWakKxHdk4=;
 b=PK95xiogAgEoBZ46PDN08yy+rHzICYOSfyG/Xw3sJ4GGw8lGn/dOHcqQgjQxoAaMTA0m8DQA/7U/e8TpFCSz6w1kMeCcepdqRFR+ezKJBUVb6OcOGksxNJGF0DKjkEciT7Kj3lhgtsMAqgW42CyDpxCtexg4ydLAecntmE9uFcrHCVJC9HxyCrp9K45//gMmJ3wrCmG2mdKLOZ0odNSNOFIDE+mI7uk2YaQxAHTnac0yQjuk/v67SUnKTSWm8DSHxD4u29r9hvpR1UsIMeQm2c9S6SAZGFCsfOsNomDN+RXKcjq3+GgGCReJmrmBwGyY2sEm4iZnwXH+XIhTbSLD2A==
Received: from BYAPR11CA0054.namprd11.prod.outlook.com (2603:10b6:a03:80::31)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Thu, 31 Oct
 2024 08:53:45 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::d6) by BYAPR11CA0054.outlook.office365.com
 (2603:10b6:a03:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.31 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:16 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:16 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:15 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 13/15] nvkm: factor out r535_gsp_msgq_recv_one_elem()
Date: Thu, 31 Oct 2024 01:52:48 -0700
Message-ID: <20241031085250.2941482-14-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 90fcbc05-4fe0-4b19-32d0-08dcf989872d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dY5XYo6Rt6DW7nMbK+f+bPFj9MSfDZ1re9tcVz8d79xt5h6DMuCCbnw2pfij?=
 =?us-ascii?Q?TYqOh+SFc4W0xZNk5RkTM4Ikl2kZO/LkhcmrKTC3hzDuS0/iiuBngnSkF669?=
 =?us-ascii?Q?nCh5c4Yh9KsUvmDRSVPezXvWF1wCpIxJ2nlUGlKtd2AUGG/5U08DZsUyshIf?=
 =?us-ascii?Q?v/I+ELt2YfaGg3XkFMBGINYgYlfX7ciUGBDEi4PxUNotzcFi53ETyEQgLIxi?=
 =?us-ascii?Q?4qBWMJPVF00MiBxbMVAJhYAGoI+xVO4MeYaas4aoIYv0LCdzarRMY6j1rqU2?=
 =?us-ascii?Q?oYex1rK+BGgy6Yz7+I3gOBYbQsSUEQa3kczUGhQwFESPHWA+bp0i+QSEhTpU?=
 =?us-ascii?Q?b7LOhO06oldhCdLEhM/Ohp85jGepKv07/64e1kyKp+Dam6UjnqB2elsuWsxE?=
 =?us-ascii?Q?AvwFzf4zjGSW1jZM05JM8DE5myLW3Fqf7w7NQgcjYc9fVkKXqgNevizHmHZy?=
 =?us-ascii?Q?NEb62zfDvsnwdNo6r0MEXgelFb7ljoB6PCJXcNNzc5Pgywni20QGv9TRMD2W?=
 =?us-ascii?Q?Zx5dM4CiI3XuyeCkSoSmRy6fwrnEbUH4F2yN//CxuYk5GlK1Vd32XQxa9CyY?=
 =?us-ascii?Q?u7QynF5TsnV05dUCp1vu3BPks7fpGxvYFa4PZaZIGRaX6eHqllfN3PSsgDZX?=
 =?us-ascii?Q?7mN/rxVxf5gfwDjTAqK7Snf2/gHQ+Yvf16JbSoaa8q631KIp/af3dFOv5oIh?=
 =?us-ascii?Q?VUTzFlLITZ8/ey3DI3TWbSZo5yvQTL9jyYyPO4ni1VCkMPBNTkIN/YOTQJAF?=
 =?us-ascii?Q?nFSgT/M2gjVGTxn3VWvK0PuojS/hjESZL4gogb7AwjlxceUe3cGQFzVJvbyi?=
 =?us-ascii?Q?73GwnNBonUEzW8FJplN+RCO+Ss6aeRDp0MmtY0OHpR45tx/MS9M7zMvm2O4N?=
 =?us-ascii?Q?f8lG0Yca/lCCuqPfkYqh1oYl/cASk9RfThAPcvWHIsgTUryqbOKgxxZaOyht?=
 =?us-ascii?Q?JIg+oNQlwaZMMD2p6d8EXlvo/cCkkNAzPhKedhSRGojmozmg1HVLt0aTnRzt?=
 =?us-ascii?Q?0YZH1gqTr8iDasadA43jgJJqGWSRuga2RdlHAIRl3tXxyRTWCyeKe4A7lBsS?=
 =?us-ascii?Q?BUa3VAC9NPqbd4SkVx7a5mEsgDO6mY2Kgx3jPQCa43J2gaVfVS+CuhLawE9H?=
 =?us-ascii?Q?Xybsw+hw+XaHbRpvceIsL9Sa/70s1w3tGUienkTkI7uOMyEE53psioj8jz6d?=
 =?us-ascii?Q?w9yLMrhOyZB0y/xOokkVKMQz47Dz+v1EbAqb0g3y/ghgPy1AAdAQDxp51dAP?=
 =?us-ascii?Q?O4S52N+n3VhPkUcLDISpvawhAoxWfX/6dmhq1rEp83OiEKoSQ7guIllmpVgv?=
 =?us-ascii?Q?jxp+Q4XsPZuly9q7+3epl0A9WZq2j/9sFkRsghWKL7YjJ8928ahbfiD5XJ4W?=
 =?us-ascii?Q?jX4Ky3dGFjTmYd/x/W17SqxuEm6vmXq/SkIYruPwgIkBORNCtw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:45.2396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fcbc05-4fe0-4b19-32d0-08dcf989872d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
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

Prepare for supporting receive the large GSP RPC message.

Factor out r535_gsp_msgq_recv_one_elem(). Fold its params into a data
structure of params. Move the allocation of the GSP RPC message to its
caller. Refine the variable names in the re-factor.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 7818c0be41f2..08a74d8bd06f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -109,6 +109,7 @@
  * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
  *   payload)
  * - gsp_rpc(rpc): GSP RPC (RPC header + payload)
+ * - gsp_rpc_buf: buffer for (GSP RPC header + payload)
  * - gsp_rpc_len: size of (GSP RPC header + payload)
  * - params_size: size of params in the payload
  * - payload_size: size of (header if exists + params) in the payload
@@ -198,42 +199,70 @@ r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	return mqe->data;
 }
 
+struct r535_gsp_msg_info {
+	int *retries;
+	u32 gsp_rpc_len;
+	void *gsp_rpc_buf;
+};
+
 static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
+			    struct r535_gsp_msg_info *info)
 {
+	u8 *buf = info->gsp_rpc_buf;
 	u32 rptr = *gsp->msgq.rptr;
 	struct r535_gsp_msg *mqe;
-	u32 size, len;
-	u8 *msg;
+	u32 size, expected, len;
 	int ret;
 
-	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	expected = info->gsp_rpc_len;
+
+	ret = r535_gsp_msgq_wait(gsp, expected, info->retries);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
 	mqe = r535_gsp_msgq_get_entry(gsp);
-	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
-
-	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
-	if (!msg)
-		return ERR_PTR(-ENOMEM);
+	size = ALIGN(expected + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
 	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
-	len = min_t(u32, gsp_rpc_len, len);
-	memcpy(msg, mqe->data, len);
+	len = min_t(u32, expected, len);
+	memcpy(buf, mqe->data, len);
 
-	gsp_rpc_len -= len;
+	expected -= len;
 
-	if (gsp_rpc_len) {
+	if (expected) {
 		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
-		memcpy(msg + len, mqe, gsp_rpc_len);
+		memcpy(buf + len, mqe, expected);
 	}
 
 	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
 
 	mb();
 	(*gsp->msgq.rptr) = rptr;
-	return msg;
+	return buf;
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	struct r535_gsp_msg_info info = {0};
+	void *buf;
+
+	buf = kvmalloc(gsp_rpc_len, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	info.gsp_rpc_buf = buf;
+	info.retries = retries;
+	info.gsp_rpc_len = gsp_rpc_len;
+
+	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
+	if (IS_ERR(buf)) {
+		kvfree(info.gsp_rpc_buf);
+		info.gsp_rpc_buf = NULL;
+	}
+
+	return buf;
 }
 
 static int
-- 
2.34.1

