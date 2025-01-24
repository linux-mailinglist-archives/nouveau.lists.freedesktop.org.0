Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ECDA1BC1F
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E387A10EA15;
	Fri, 24 Jan 2025 18:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZZNEbLXH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DBB10EA15
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wClVGUz8TFHdZACmLuImsWVY/y6nIGWpuy0IK87+R2+uXY+UJBAQlNecTlVeLNuYLdxh8WOGD0x1836etLWouqR+NV3A+AxjC28PdVGYI1Y+dAQLfrezSEsltBDT0O+nzlWmSO5mf2U0gq1SqGmsBllSG/7IstKQAJkdDDrIy3xlRyQIW24wZ3O4MXLXLcqvLGq5YchiZ9lOfEwlhb6EE/yf/Dyygum77Q+8dRKnxYIgmFteQnxhWZ9XKkkn+qE1YKWuVn2UjcgUnYD3IZxZSz1C0fjOAgnZfcTyKGKe8IJNcJ7XWaEAyI1IjaW9jAYoEQ+Qkd6rnyswkKrMKcnvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfPpORvEsOpRxwUra4wgH99W/Ltb4W5Zx88gpCfmp5M=;
 b=hvhNfcG04uyU8Uz9ntDkuuB0AZ4xgRqzY5pai/jhIK3P0OniUmVNTFbYyVNUzQavoAKOFvpnPtDOKPWiR4KGw/P6W//6L2nKrWrET/Wh+PFHbzUxPrEaVR0I8TtnqzRk7KvphIb+URQtGSeoWrvC5GEKPzyx5374CLWFXPmaW1izrxOCHFpOBttPLynR77QvkN08itDd+C9x5sudGlRDZ0b131tgRz5i9+q8uBTZQZOmodnD4t8U3TH7Xx87qmbfDDd8NA3DwTBI534VSPveFBBY+oty6N5Zg2Aej3E3z9tB2aAiMR0WkjvLVC/PZqID6skl5Pc8BsfC0i/6cfZnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfPpORvEsOpRxwUra4wgH99W/Ltb4W5Zx88gpCfmp5M=;
 b=ZZNEbLXHIN0TmQJvU83g9BjrNaOCW2lEz8rVLeOSP7DrkPtRNwM9lh63huogK31E5uhRjLPvadk53G9y8LU7s0jmPDxT1FW+sUZj6it4WqHy4S7s6G9ZhphKntmXSWA8W6LMOAWr6LpAggX4CXjH8V92bguc1jKGsEisHpsW+5gMLisiGdvNA4muGOTKgmHStc3b/PFBE3TvaBlACmSxvznStqK29O5IqmeHZH2D4Ahn/cW6cV5i66GxFegxf9IZgJHVYYtpeaj51ARKlf/E7Tn8mqUaNdyccAwyEoRaenoxhEOlZoRHL25DYG0Rs47iCfiOFJr04ft04fhCRyPcLQ==
Received: from SJ0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:2c0::27)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 18:30:47 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::76) by SJ0PR13CA0022.outlook.office365.com
 (2603:10b6:a03:2c0::27) with Microsoft SMTP Server (version=TLS1_3,
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
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:33 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:33 -0800
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
Subject: [PATCH v4 13/15] drm/nouveau: factor out r535_gsp_msgq_recv_one_elem()
Date: Fri, 24 Jan 2025 10:29:56 -0800
Message-ID: <20250124182958.2040494-14-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|PH7PR12MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f34c09-2623-4f05-5c8d-08dd3ca5388d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kcERS8gkmq4v8XSduYVGa/hphVt7c/nzhLVi14qqqQZjg3KF2n+HzfSPvAEw?=
 =?us-ascii?Q?LHHmGYGqNSse3Nea2sJ7lktosMeFKcFpkqzblDWnnuN1VCrcAeVtPxnBGEDp?=
 =?us-ascii?Q?SyPXWWYllSJ6VtjIUszQveLt3C10U0SsYmDfjau/UeYhrX7M+FicVIB4BeY/?=
 =?us-ascii?Q?2VMj3NaRleyfEs5pOoEzmXuDBNpODLP+PmzK/CxpAYTHTZ0d1piyF5LOant7?=
 =?us-ascii?Q?VZY5s/vA0S/Ej1Sex/ctUXUun7yAF2dTx4dYm60eOAhwtKGasAsxCdJQJ1yP?=
 =?us-ascii?Q?PJ2WSNLo+dBxBO5zAJcpGtlnGl0DDFc++hafMdbbrTpkrJvGFiUmV/1DRF6U?=
 =?us-ascii?Q?IDYb8kjuT0AXfnP8awMxmWm9bhsiZHRVzcKfDhoWomNL4vMEhmo3Y7OpkqO1?=
 =?us-ascii?Q?bQ+198QnOFxeiVwSxiCNxzLagkQkNY5D4/dKq/nDvR/iroIil+pSUd3lLFd+?=
 =?us-ascii?Q?LgyoRaShRQLKyicmI15J72DLlcD699wVRt3czvHbmwOOc+/OWTiVHWEteLTC?=
 =?us-ascii?Q?GkVkIY7iPfQim7a96dHFlKzRPTTL4eLxfsQfHHuOmyFgbYef0MCVbPO1jSDo?=
 =?us-ascii?Q?tBOdeEjpYor4Ma+h0eeaWF9vgL7Q1PqiyVTQPjG6FtghqAZ1gvcLwp2WLu7A?=
 =?us-ascii?Q?S2+eGBW6qeeEmAxCMrfJSvghQh5/3U0XiJVhjCgJ5VEHJuhAhXp/e/sF6Utj?=
 =?us-ascii?Q?2Bmka9TVgJxVclbwCOpaLgTdXZqj4y2LxwGWyJaGgy0ektll1olX5+IZGFHy?=
 =?us-ascii?Q?MLpBZtEv+PvFMckDDcUZKjwwML3wuIRXkaC2MJk1sn2p0xNWtwXm+mN1Rzht?=
 =?us-ascii?Q?JpR37E84ALgq5w7SX/zpS5ItZ3fGROZfMwaaHSWu6W+5T5AKQYo7/MN4MOR4?=
 =?us-ascii?Q?wU9orwWcw+nuHeGSKCZru18w4b++kmqqJ28Xa/xgiCWygXPtQ0LDIsqDkZAf?=
 =?us-ascii?Q?mwT3AACu2XJuoYI6PBnHGvX8FRXsssF7H5gl+Lf8ur5HpTUOObdR2xmserwB?=
 =?us-ascii?Q?6b5+PISwbUDDvrtu1vHYaHWkQGYkXQiUsljZNDDf2+56NUSgReUdaiQ4xPim?=
 =?us-ascii?Q?I8/pKgwaHh1r2Lx9Kuxb4LKXN0yT9Am/XCU8kylKDpG4UVF3iWkRmobg7LnV?=
 =?us-ascii?Q?z245FcB0t75ED5qL4KNWKBmkAVjWgqzhWFiPTf3sFoUb9cTjL7kVWCQHMpJK?=
 =?us-ascii?Q?mEIv1yq2OnvwSPWBHRNHC7/PpwCWkx+8/t+/A7Inc7CY6MZiFvZEjI7Unk6H?=
 =?us-ascii?Q?ALrCgnEQFZNiEA9K71h+8tqQ0524b6Yje4jKY8fGxXB6epUnpHT4DwQMIcmn?=
 =?us-ascii?Q?vrBAlVrHwNizQoDEkpLYAoL0jbvL2RLKXXygxVi+gOp74Kr11A7rGQrefJn/?=
 =?us-ascii?Q?+F5XVIFd06Sg7MCNk5/u7UZBX64Vx5j595HaGW0SO6Emgy+mOI2sLRcykWRd?=
 =?us-ascii?Q?xavWc4F5mZg92JyvVIaPltddXAfV/1zGQ9RfGcJp25J3LzkxRW16TPlbeohM?=
 =?us-ascii?Q?ew0+2oFGc7JAcE4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:47.1912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f34c09-2623-4f05-5c8d-08dd3ca5388d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443
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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 72 +++++++++++++------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index f603298448f6..d1ff038b0d95 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -111,6 +111,7 @@ extern struct dentry *nouveau_debugfs_root;
  * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
  *   payload)
  * - gsp_rpc(rpc): GSP RPC (RPC header + payload)
+ * - gsp_rpc_buf: buffer for (GSP RPC header + payload)
  * - gsp_rpc_len: size of (GSP RPC header + payload)
  * - params_size: size of params in the payload
  * - payload_size: size of (header if exists + params) in the payload
@@ -197,13 +198,16 @@ r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
  *   Peek the first page of the element to determine the total size of the
  *   message before allocating the proper memory.
  *
- * - Allocate memory and receive the message: r535_gsp_msgq_recv().
+ * - Allocate memory for the message.
  *   Once the total size of the message is determined from the GSP message
- *   queue element, allocate memory and copy the pages of the message
- *   into the allocated memory.
+ *   queue element, the caller of r535_gsp_msgq_recv() allocates the
+ *   required memory.
  *
- * - Free the allocated memory after processing the GSP message.
- *   The caller is responsible for freeing the memory allocated for the GSP
+ * - Receive the message: r535_gsp_msgq_recv().
+ *   Copy the message into the allocated memory. Advance the read pointer.
+ *
+ * - Free the allocated memory: r535_gsp_msg_done().
+ *   The user is responsible for freeing the memory allocated for the GSP
  *   message pages after they have been processed.
  */
 static void *
@@ -221,42 +225,70 @@ r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
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

