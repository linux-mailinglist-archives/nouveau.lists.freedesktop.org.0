Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF89B76D3
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F810E857;
	Thu, 31 Oct 2024 08:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cN1qIRK1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715CD10E845
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXAHAe/Clg2CpbvrGI5uuCU2BCALRXcTHNzZvEESso9B6zz8z30dA+Fz7Sqft+4O6iYOieFX0aS0opjJP6Z1PX1LUUdhw/tltXT3Tpyzvl37b1xdU8EHq5igO10E6a8TQp7h2YuRozEH2MBHeg/xZU7VF5jgYfYwPt5LETpjn+6Mx6AacVEBJD4yXZr8wgLcnFTFsd0qqC36ZF3kcChcCskjdGILuxKyH48QCa1L5fbOlQaHSiO9xjVgNgokO3jQ/IxN3Qbu5Ipd1h10f8QUOH/ALs3vDgv6whjgiGcBN6YKbAeVcsJBj+a+nrW+z4i62AD5fVK6WmluYpLniw7e9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qm0Erc/9U3A9f6GytbWxmi86zagUgPcpUSIUWUj+7Q=;
 b=FR4AtUjVbeDLo6Qzwso6kBZCrTgE4zvy799bm6jL9vkkhwkt+oqh6n3vGwRuWcN/RfxpE6Y/4E/Yta8N0hN1c22TGAZnmArOCU8e72Djzqfuby+Qf4wdt+dvw8MKUoy9noM5yQfEX569gYf3yZ9fxZg3XnhbW/PIccyVIrb/gXDyPagyoW4qgKNn9mSD2lMMLDLpmYOCwN5zlo8KKicdHwbtxoafODEs+Pnl/PyKcM6b1oc3DD/OAj3Feyjahe6zp1sEXmMUDI1ByYkLywIBuGu+UODF9TRVBnSwBd0ZWzo4V/9XHPkvbZPT4ofYKoWiN46e/8vV4gVLB5BHbn/uVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qm0Erc/9U3A9f6GytbWxmi86zagUgPcpUSIUWUj+7Q=;
 b=cN1qIRK15cMVT187RqVABOSQzhRw9JtE+IXMBxn9OR8vw8P0hsouJTHcf3i6mMArM+DF84ZUXtZhn9y8gtxPgAj5wBxd2qK6TicNW+nXeVtZ2eMk/24sETuWCgTiOdMmROWjUDJOEIdOyvfXucerPUJ9Voqwq5Ene6Rgk5uYq5K1/VQZ9qjzJFP4MHhch+LMGhD0xHtI6mWN2ERifDOM7MbiQNQD6ro3nepfS5MOMwDZMNAIHpcJ1xTQHvEhapZSdh/it6Ui2z5KZMUTWnuWEIz/t9xLG/I+nsBbjgIB5CgL3qlalhT1RYKlfRLXG81lDol2RrAFlOR1PAvuz7LIUA==
Received: from BL1PR13CA0315.namprd13.prod.outlook.com (2603:10b6:208:2c1::20)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Thu, 31 Oct
 2024 08:53:33 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::c9) by BL1PR13CA0315.outlook.office365.com
 (2603:10b6:208:2c1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.7 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:33 +0000
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
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:18 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:18 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:17 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 15/15] nvkm: consume the return of large GSP message
Date: Thu, 31 Oct 2024 01:52:50 -0700
Message-ID: <20241031085250.2941482-16-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: d3abad1d-2fbe-411e-0b7e-08dcf9898001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcN4uiAv/BVtc3o78SyxF8KuvTiRQAxaQFDw/KIemK6TzHDk0BJ8qcfTptJr?=
 =?us-ascii?Q?vTr8zKlj0U4B3GfDpvxiVaelO2R8slZl6dd/zmQLKJR70loMogzpTh2BFhTA?=
 =?us-ascii?Q?f5cWwxWkzdpObRJGHQlvH+SCvwXw269g0OswK7wWo5+1aUf6CSj8hqe0AyGl?=
 =?us-ascii?Q?a7EIPkr8xmoYPNbpgu1N3p7il5T1DzEPJGGsXj+AfD6ERS94pVHaPaWLLO3N?=
 =?us-ascii?Q?Glz4BzXZ5khCNpVuTzRLC428xD7rPLYqqb769nDOW57bC2efaH6pF4XUiRIA?=
 =?us-ascii?Q?9toQsn392A1neSjsP9ShUBGeQFN+iuOzv3PiEnfSNrMtazOl+l6KSwab9eiA?=
 =?us-ascii?Q?3nTrK31hGsZfHHS36R24cOpw2Dv8IJeYswAtLfVWxA/lrdxLny8sHe1AOFoT?=
 =?us-ascii?Q?mY0xp5W2bk7HLkCWfvVGc7zZGpPyasjSDwWbFTjWl3GqW3wLRz/RUgo0c/dd?=
 =?us-ascii?Q?xXAkJJXjvFw/4N0rTIrslcaCxUMIRe5ExK5vTt7o6wuzMqP1sYwMrIMMz6f1?=
 =?us-ascii?Q?icoJG7BLCyyPLsx7pXOwDmgkksidQiNDOgRNgCX5RkR4m1QDYbNg6kSq/jXy?=
 =?us-ascii?Q?PbNU/HiM9dckEPEAcsw+aQVhC5w/I2212jqxDFOF1rzaQblFem2P+Va73Q8p?=
 =?us-ascii?Q?GlnPIc76lXa0G/rtQNun8tIZuxMeI7ezR4tXidTAtEjXG6E7lU0eUQOKqhVl?=
 =?us-ascii?Q?i5qG9vrEgzfbvhWkSKmALO7Uzc8QvJvE9yy5p5RTq0xiIfGHKI/T3n+Nomwl?=
 =?us-ascii?Q?LUq67UKp3ALErtuqWsljU5FkB9a9Mk5oHX/Ez7jdYrsmzxAhXIu5LCo312mI?=
 =?us-ascii?Q?02YGH4BXb/7lP833I9VSfrnxpkiZJFVJOPz8uSPeY0/kjJszu/vYkVD52SCG?=
 =?us-ascii?Q?11zE+yeZ47TalqEJm2OmImy4jOzuRp3AvdlChnrao5Lq8LRJhRPh+9/s2BeN?=
 =?us-ascii?Q?P7sTFSaDns4N470NM1Jq0StvJnMgCxPaMtpDbMottuiF24UE3jZSwos+ndb3?=
 =?us-ascii?Q?R62jFYA8xFh66qxl86I+SrjAIn+KvHd6Ksq+p6QBYGNSb1Z+E5ut0lzYaM/p?=
 =?us-ascii?Q?onxG6xxVeMxo/4UFZBTsGNombDTDMgtZLwBL60VBLPTVx7GMtGWR64GKPc1G?=
 =?us-ascii?Q?C18+WUMEjZWIIJa89f141XEL2wBBBAmom5Iu85iJO/PdaALf3TBXn0wXwNFL?=
 =?us-ascii?Q?ujubmv4DJix9rJhH/GHd4tn4GKUXUF/sJjAO96wCw4bwuJD2427qXL2trtFw?=
 =?us-ascii?Q?DqZpzWVLjSMgndulG7SuOXNK7avBQGKKmKifbdWmhZmx5E//atPhfT8kuEeA?=
 =?us-ascii?Q?53uwWdoiBXW2AFpPVP5PKAuNkNL7gZYLPAQGY9emtPfMRCoHZobcSuPb+jCa?=
 =?us-ascii?Q?cwxd32Oso8hH0Ymq9Es74+PrTg2feCyTSQoG/RxckjhLBG+rfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:33.1280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3abad1d-2fbe-411e-0b7e-08dcf9898001
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 41da8c72d618..5a9c7ffa635c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -483,10 +483,9 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 
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
@@ -932,6 +931,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 	mutex_lock(&gsp->cmdq.mutex);
 	if (payload_size > max_payload_size) {
 		const u32 fn = rpc->function;
+		u32 remain_payload_size = payload_size;
 
 		/* Adjust length, and send initial RPC. */
 		rpc->length = sizeof(*rpc) + max_payload_size;
@@ -942,11 +942,12 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
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
@@ -962,19 +963,21 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
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
+			if (wait)
 				repv = rpc->data;
-			else
-				repv = rpc;
-		} else {
-			repv = NULL;
-		}
+			else {
+				nvkm_gsp_rpc_done(gsp, rpc);
+				repv = NULL;
+			}
+		} else
+			repv = wait ? rpc : NULL;
 	} else {
 		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
 	}
-- 
2.34.1

