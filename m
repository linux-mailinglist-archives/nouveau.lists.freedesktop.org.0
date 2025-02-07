Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8FA2CA9E
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EB310E111;
	Fri,  7 Feb 2025 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ziya+rtV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D0110E111
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTr5XofUSvSdPeIxGJ7ToRmJHeL6m1lkXZdrfgPdC/JL/iaM6ix4a+6jmGhVGHNJP9Lnn1cxCVUiigr1onZyqOcjmLHu9niH3Rumy4L7PtodPS9ufKJmyk/ANGnY4JLdt0REk2CrNx4mLlYIW8rKlOtifgpj4GOvK3Suw1kw0J/UXtGYUcuqrmOp2Nf49DGTDSfc+q4/xqcFoC2ouC6zlCQUBoVpB7UDDZwvvOmf99OMPaHuyV8MzD9T5VWuI7Ap4wHwhbK7HzxCTJp9ka9uiHRliRwBwNiXFLzarvnAHhuLNqSy/KXqLVTLCIlmU7Xc31jv2R0Y5dFvxg/+yqlpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt2ih+rSTx1cV4AYym6B21p0mqWmmFY45XKffFM8ZxY=;
 b=SW9wfuj8eOd0aD2/wDM1780Cj3mFUQyk5slLIsVVmEiizxzSIqES2RrSzztHu6ec9jxTYnBuLeqT4gZmPTRABYuYIqwNhMoOW6b9vAXYATN+5h8dFbraqXt20zkotmlJW//O9NFh0q997x3gV4EJH3zEjTrs9VuGne14WBMmpVN/N999fpC5rAGiRXBoDerT42DHN8BSr+zngTkBwv6qTtfwhB77ukT3IHF2ogQjtyy/LcDFR1nXRekUbqsYZD+znsKGGbkcDpCdxq2xNO7hn5k1IWPGUb3nttXd6GrrPbEAWP/k6JDygGNj3AZF76xisBaWts3nSmTh/HfBIOHKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt2ih+rSTx1cV4AYym6B21p0mqWmmFY45XKffFM8ZxY=;
 b=Ziya+rtV94lyunaWTnwgC+SSV6yhVUPu6rE3vbtXSdVPczQGWA3HLNpOQXNokUw4KbOKvas8ngNOnjflWMkqTLgxsOvhJTBPwd2DMWEHQ0TvlAM/MFXg0FloVMPvQ0l6WSU8dyWZchOXa1V6zFOR+BIXZcUGYkqV1z/PkQaQW+Gq0sLTaPJAgh8qh/ZPhnXT9kH6LIKP63mufsXJd4nGZzg1qEMFmXtwUya4X9YCk7A0lF+DKOF1/LSHzZvChym74so75+axJm213LJg745X/ym0AH2cEyNKPs9Ezts+wAsK5NTF8CcQQqHPJAnL+zrSb05aqrJfd4leO6L3Djpbgg==
Received: from PH7P220CA0173.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::6)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 17:58:36 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::c2) by PH7P220CA0173.outlook.office365.com
 (2603:10b6:510:33b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Fri,
 7 Feb 2025 17:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:20 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:20 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:20 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 1/5] drm/nouveau/nvkm: factor out r535_gsp_rpc_handle_reply()
Date: Fri, 7 Feb 2025 17:58:02 +0000
Message-ID: <20250207175806.78051-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: b65ff764-f266-4585-3c7a-08dd47a10ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AmS6nfQNHR2p8nj0crxNelBQRmaN2B2VzeEnlUnBcl5EdYOT+DfrJ3FPVULU?=
 =?us-ascii?Q?Lc+mBRpwXaTh2IHQEVma/TkFKX5dtv6Cz/r6Rx2ixvlkIrJrWtkebjiV7OhY?=
 =?us-ascii?Q?cKiztsgtTXrdc/Xcjlfbko5IfofehU/ej4ucmDjVnNNiwhZLEO2dDj9O8jfr?=
 =?us-ascii?Q?fBHMeN0fJwYYTF4cCXyj/YGcHQXTWGEQ9Y0kCrFibhIuptOb1SVi8kGhfLgU?=
 =?us-ascii?Q?q62t2fmMHNeeQWz/ToMrj0aDhbn+5xxdUEXlM0tmplVi3IDTxcq7xQ7EdGXQ?=
 =?us-ascii?Q?lz9DM8WnlrhARmLQc7HrZYN54iBlAB47U/YPhpy14QXBnUU95o3XpdbTEy35?=
 =?us-ascii?Q?koGWvHWlL0h5Pi3jgaQ5Y3QVfRpui7PTjir36bVQoSU1WHE4Nqrpc1D5s919?=
 =?us-ascii?Q?EWiuGkC5H/240U/1pJ4V2gSG/p+YJ6nf+wJ5HuZ9tiC2fBCBMVxs04ADiGkk?=
 =?us-ascii?Q?FLKXoFFLMwGuwcTS7eeuVEBf8yZCPQaIJqI51TCNtORmz/Zh4k2UgjQ8IjUT?=
 =?us-ascii?Q?T1JONm60T8th5vbyDe3VuJUnxoDH7SgfttnB0yq1c6u73R6nRETliD6Er4uF?=
 =?us-ascii?Q?fa1sQcp2oUfWabivfrQTSNf1jjdqWYfOPtabKGmcJ9DtRNxftUotzcLPIipy?=
 =?us-ascii?Q?OgVP61twSbDMzA8EAIq7H30D84nqc7Q21/lI9lTb1fLD7NsgZQTV8JkqnU72?=
 =?us-ascii?Q?4lFBV1XUi+XzE/biJtvSaBYh0PtJVr/VMdV5k6HtCJPYAxCwAKVJEExhNlOb?=
 =?us-ascii?Q?h0x/ujJznurTwcILaQaa0CRMsznJMVfBaiqwmItGM5wFqz+AEg0x76okPDGG?=
 =?us-ascii?Q?7Fi14nlQSAyyuu6GWE1fYMpsc743Devdvnxu2EUTA7VROiJAyGhRpbS4xxK0?=
 =?us-ascii?Q?C+xIIaE2bTDHRoE3mkp2ss04eEXrXZBh4nQZO9uhRGGzzOtJQbq6AVTIkOtU?=
 =?us-ascii?Q?hf7/mVq5TUvss6sXhyLck9cdfb9EWU8lc2cZoiT3y3NF9ZUsSmwFOFWF4lVd?=
 =?us-ascii?Q?IUeRgzBAT2OtttqnDZ54XW11iyJhsCcMzIPlyI7Dai5sChNE6KDkBk7fgUKP?=
 =?us-ascii?Q?x9d0kaxkUIrpot2DGOzgzOR3uq+9mO1mDCA8rpffnFEUHYonPFLwPLjXuy99?=
 =?us-ascii?Q?8xLRvacvi5qiz4ycRDcbHPV46+QOuBVcf2sysEn/2DioIl/yE68Q4BaGDeh2?=
 =?us-ascii?Q?HQo8TdCO5iFaFhBKSO77/FsVR6GLqbl59vjbAvJBK+trGIFQGS8cogHzAo8f?=
 =?us-ascii?Q?baHJlS9O6pI3pySDKLAxj0T3FaeEt/neqeCyMIVp1g89QgCjvj6ieqzLFygm?=
 =?us-ascii?Q?0cwfSxN8KwZ0SIe/VqGoNnDYf0ddYpibYpyJra8MS3eXlQ11E+g1DpyIKq38?=
 =?us-ascii?Q?3JGmPTAI06nUG4cvSMV0yRg+mUZdPi1WoG1UQ+dl1jJWHLo5/1XMepIK9v1C?=
 =?us-ascii?Q?V0w2W7izkdU7tIkMv4HxH+a5KadFKBR03qaIiF7w7jxx4oea51PEpANU0VB2?=
 =?us-ascii?Q?hV14AI/lL+NFYjk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:35.2715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b65ff764-f266-4585-3c7a-08dd47a10ade
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105
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

There can be multiple cases of handling the GSP RPC messages, which are
the reply of GSP RPC commands according to the requirement of the
callers and the nature of the GSP RPC commands.

To support all cases, first, centralize the handling of the reply in a
single function. Factor out r535_gsp_rpc_handle_reply().

No functional change is intended for small GSP RPC commands. For large GSP
commands, the caller decides the policy of how to handle the returned GSP
RPC message.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2075cad63805..1ed7d5624a56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -583,14 +583,30 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 	return 0;
 }
 
+static void *
+r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, bool wait,
+			  u32 gsp_rpc_len)
+{
+	struct nvfw_gsp_rpc *msg;
+	void *repv = NULL;
+
+	if (wait) {
+		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
+		if (!IS_ERR_OR_NULL(msg))
+			repv = msg->data;
+		else
+			repv = msg;
+	}
+
+	return repv;
+}
+
 static void *
 r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	struct nvfw_gsp_rpc *msg;
-	u32 fn = rpc->function;
-	void *repv = NULL;
+	u32 function = rpc->function;
 	int ret;
 
 	if (gsp->subdev.debug >= NV_DBG_TRACE) {
@@ -604,15 +620,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (wait) {
-		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-		if (!IS_ERR_OR_NULL(msg))
-			repv = msg->data;
-		else
-			repv = msg;
-	}
-
-	return repv;
+	return r535_gsp_rpc_handle_reply(gsp, function, wait, gsp_rpc_len);
 }
 
 static void
@@ -996,18 +1004,10 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		}
 
 		/* Wait for reply. */
-		rpc = r535_gsp_msg_recv(gsp, fn, payload_size +
-					sizeof(*rpc));
-		if (!IS_ERR_OR_NULL(rpc)) {
-			if (wait) {
-				repv = rpc->data;
-			} else {
-				nvkm_gsp_rpc_done(gsp, rpc);
-				repv = NULL;
-			}
-		} else {
-			repv = wait ? rpc : NULL;
-		}
+		repv = r535_gsp_rpc_handle_reply(gsp, fn, wait, payload_size +
+						 sizeof(*rpc));
+		if (IS_ERR_OR_NULL(repv))
+			repv = wait ? repv : NULL;
 	} else {
 		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
 	}
-- 
2.43.5

