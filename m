Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F261CA1BC1C
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4710EA16;
	Fri, 24 Jan 2025 18:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KRDoOauW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547BA10EA10
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIlzEUVQ7+KWoi1z4OHe4mZwieXdC2g3zdOHQn8bIqeQRdMOxm4tIqD6PpHKsBeaXRvO9UZmFfYPLqQAqleVR5sEXbGN6fXmksjaXebe5K0zYj9dFWivqUbzt1czfKd8TflJVxbTvUPRGDHWa3ZBjL7l7PPWaLJU5C2bripEg9knGEdj8xps+EEvfB2lfvWvY4KNFAf7yTcKN49FYo0mAx4zWdpNlDhShVoMoP7U1niX31OkZI2TKYLXveug00wyfzy95fNuwr2SNf3VsDfdpgHYLlzaj49lQG6DYGGbYvGoX26wlQ8u9bewI+v39D1UUGHNnY/AGS+KbEeyaWpNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4gCCJeReRZPav3s7QdjWy/w409HrqzMgiijPeuJNfU=;
 b=Y6iLm7ZXdyM9jY69R92n7C9BC12ZeHkAwPbz6xsgVJQRXXcIcsxLvmHpVwnQftlJWHZyKIAX+XzIy3hWzOo3nDLVjdo5X7vY7BEb/d2FidakJU6v4xCgRByOU/OcennRwDKpCMegVUa8+yecE7DmHf0fL0nd9Jk6gxHWdqm3FOYnQ8J0KtM3jjwCHbhAgnwDluKx9DeMXgKZzIdUBgukdDu8zLdy39PBmI476FLNEzQWgMqrOI8oQUKb6rzPssCws7V7dly0d1QkCmOtY/59g39z204Tl07kh8kmVNq/n8tl+vo4oQwe/Mvo3H9df8Z3QaEjCZfrhk/Vq+CPmeoqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4gCCJeReRZPav3s7QdjWy/w409HrqzMgiijPeuJNfU=;
 b=KRDoOauWLrm52VfP3gAMuz4aYDzOlcBYqG/tW0aLpK35vvXcutPVphryjCrmxY2Cs6mpzp12aGkDmlSzadQ05CrClsAXwIlD7aZvZigKHwj9o2PW6hzlNgAOEd126mgNW8UfOF39O/FX/NHWmxpZouKmKNud7JJH9a8wzq9FV83rfunkFVGJjWMs7hcvFUbLvDgosrB/mMvOkfEk75pH86TIt1gf+GEBH4lCfrnKz41QN/x3Qa+AgbBdvVnPD970yvoa/qF1/u3WPgr/Se063BzBTe2LEN/HRLQ4XYYRSF92HYi0kZvwFW5+X1ZXi35gTnFNwx6X8cVA/Xl8F6YXhw==
Received: from BYAPR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:e0::39)
 by DS0PR12MB8246.namprd12.prod.outlook.com (2603:10b6:8:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 18:30:49 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::8a) by BYAPR05CA0098.outlook.office365.com
 (2603:10b6:a03:e0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.20 via Frontend Transport; Fri,
 24 Jan 2025 18:30:49 +0000
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
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:49 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:34 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:34 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:34 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 15/15] drm/nouveau: consume the return of large GSP message
Date: Fri, 24 Jan 2025 10:29:58 -0800
Message-ID: <20250124182958.2040494-16-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|DS0PR12MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 08657167-3003-4bd9-bbda-08dd3ca539d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jEHQDY/Atzg1yNLk85FtQxzHr4CfQoi8XiFwT+fcA52rTm5q4rDZKK25GDk1?=
 =?us-ascii?Q?/L7ndOHh1ud1YUROtWuWRxQMfZjrWd0hprFWD4qs7BGN6VOVJbW58J5VIpCR?=
 =?us-ascii?Q?PNryKR26jnEfNMc9TlMb626q2AqAVLw0fNBn3KnehQtlB+HmbiDjxOL/Jazv?=
 =?us-ascii?Q?bm13JZiPQz37ka7Lw4QpP8z8YTwTkHSxH3nJ+zO/3h4EMXDAmv2z8NyFWsvl?=
 =?us-ascii?Q?kiOGkrN1pLp0GOtYNLhhEUJtSBhGuV0+40u9V4fhinqzCuYeAeBrtSjM1sQ0?=
 =?us-ascii?Q?YcDjN97hMiq9nHDIEVKt7TBf/+KXcXlB2T1sSjGlWJiRQ/cgqYou9la8RMx1?=
 =?us-ascii?Q?ttgPxWiEIQec43P0LWS/7egwMm7N4Rji+iGaGdvr8vxBDNb14IyOEQ60KJzz?=
 =?us-ascii?Q?WR/vJbIqw2+oLcPv1afMCpx8+tzK9tlpy7ZqMkwsJM5PVGzD9MWU5aEERjVl?=
 =?us-ascii?Q?toaTQFwNkko96U+3YQe3m+hHjmC3XOkDIjprGbj6VE5jsAGlNmlXzLNrWZaI?=
 =?us-ascii?Q?rhbnEHDx+P/7lsWEMwpxRPv7nFOqPL9ON7VlgCenyNKTk3oiasmEc9J/KGiO?=
 =?us-ascii?Q?zjLvmAEqeeR0yOm1UJO/EKMceQLb+4/Po6lT2/f77RsskkCW0ft8GvkhiAWP?=
 =?us-ascii?Q?VXk2sUGaf/Tl66HYzHOTL9Id2/lBLV/xIBaJzUcV3i546PVwW9SMbd5PtrLm?=
 =?us-ascii?Q?WfZrQnDeZNOn57bp36RHhEm2FcIUPNo/Rx+kZqk5YfuBJytdl9C/i9aLIPit?=
 =?us-ascii?Q?mvZPqA4m8ZkXXh+W311omeKr8GK11UNkXRzQGW2zccyur2QJDbaLU6qqk8YR?=
 =?us-ascii?Q?wooFP1Tib+m/2Ihntvzu50OIF7HhXFXQWxlBrqN2y005pCo7Mj6lVjPX3UXy?=
 =?us-ascii?Q?J5djf8/stIAjJ8PV/gfW1bprY7C/kX0n3Ld8y5ra19ANeFI/FkqozWVg6ZhI?=
 =?us-ascii?Q?6MBEkvqEQFKu79Q9PJmIqO4Pxwm53zCcIOJ2O36AOK60Qi2qrPo1iA1jwWOy?=
 =?us-ascii?Q?MGbw5qNcDgr1INa476vqP1PaH8XEUOutGqxft3WGvrkOJlA/aqLqOqHKKVpP?=
 =?us-ascii?Q?vMoGAeOTNgZb+tO952KuBIYTIUnd6JjzcE9J62T5VQRyPlQ6/zYeNqgCbB3q?=
 =?us-ascii?Q?MCcDQp+GrrV/iCjZ6d9mgkoncgB3b50ExtfFxVO/lG+qcHYid6dhzkHymrwA?=
 =?us-ascii?Q?PZGuVy6FiDKv7CWP6SgIuqcgYEPJOSp8YN3y+JecBglEYiv6JBMG5BscmuD2?=
 =?us-ascii?Q?KE3BPsx8P+VvoKxIJYNggKFRyZA4rCip2wfy9Hvzhw4szwCKyT/aJ1DVKrkH?=
 =?us-ascii?Q?0hVEdsPn+9ADT466AfXYt4f4qgqeDVABP4pk77UfaqG6YludZSxlFxhjI15+?=
 =?us-ascii?Q?OU33uGZvoiyocSQh7vcfD8Gi/7hGMlKcInkVeJMXqGy5z1YFaMa75lFCjcQ/?=
 =?us-ascii?Q?EZ4ZWiSNOI2qM+IO9yBGkYaPWJ3oBlN6+mmvirgHlW/XxFU63ci2Dk5zuS3k?=
 =?us-ascii?Q?XWzFqg/oD6CK7U0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:49.4007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08657167-3003-4bd9-bbda-08dd3ca539d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8246
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

As the GSP message recv path is able to handle the return of large GSP
message, consume the return of large GSP message in the sending path.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 40bc3aeb5111..db978ffb3993 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -512,10 +512,9 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 
 	if (fn && rpc->function == fn) {
 		if (gsp_rpc_len) {
-			if (rpc->length < sizeof(*rpc) + gsp_rpc_len) {
-				nvkm_error(subdev, "rpc len %d < %zd\n",
-					   rpc->length, sizeof(*rpc) +
-					   gsp_rpc_len);
+			if (rpc->length < gsp_rpc_len) {
+				nvkm_error(subdev, "rpc len %d < %d\n",
+					   rpc->length, gsp_rpc_len);
 				r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
 				r535_gsp_msg_done(gsp, rpc);
 				return ERR_PTR(-EIO);
@@ -961,6 +960,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 	mutex_lock(&gsp->cmdq.mutex);
 	if (payload_size > max_payload_size) {
 		const u32 fn = rpc->function;
+		u32 remain_payload_size = payload_size;
 
 		/* Adjust length, and send initial RPC. */
 		rpc->length = sizeof(*rpc) + max_payload_size;
@@ -971,11 +971,12 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 			goto done;
 
 		payload += max_payload_size;
-		payload_size -= max_payload_size;
+		remain_payload_size -= max_payload_size;
 
 		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
-		while (payload_size) {
-			u32 size = min(payload_size, max_payload_size);
+		while (remain_payload_size) {
+			u32 size = min(remain_payload_size,
+				       max_payload_size);
 			void *next;
 
 			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
@@ -991,18 +992,21 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 				goto done;
 
 			payload += size;
-			payload_size -= size;
+			remain_payload_size -= size;
 		}
 
 		/* Wait for reply. */
-		if (wait) {
-			rpc = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-			if (!IS_ERR_OR_NULL(rpc))
+		rpc = r535_gsp_msg_recv(gsp, fn, payload_size +
+					sizeof(*rpc));
+		if (!IS_ERR_OR_NULL(rpc)) {
+			if (wait) {
 				repv = rpc->data;
-			else
-				repv = rpc;
+			} else {
+				nvkm_gsp_rpc_done(gsp, rpc);
+				repv = NULL;
+			}
 		} else {
-			repv = NULL;
+			repv = wait ? rpc : NULL;
 		}
 	} else {
 		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
-- 
2.34.1

