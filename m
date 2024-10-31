Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9E9B76D9
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAFE10E851;
	Thu, 31 Oct 2024 08:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oSHOpOWt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39110E853
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzMecMyAO4e4ttB05Y6Xqhpool5ZM0c788dheBLeHIV/Wqir9EeAuMspPTgYCV0uCnm3LsGCJQY4H/kF+rHXaJQmXpUQj3MC1N4WJ5S824pm2GFtZTmisjB7mC2EdBFzmmRz5pDCS42SnAbsyuzZJTLYM3eGUvqyLyegkZTwTK9zqQIMmMzkPn0N6B0aLkIDsNM6bARKuBbCsWut8pwvaV9iSAAZIHhkIu6DCK66AFjYhE+5RDoQANNesTN/WuCCEWxeMoB3RvWhlwcRU/YYJX+CkvQt+Gfo+7JenUyKytV6wLzUZVU0IPVn4a4d+tdbmTcWZ0hsm0aqrxevlZMRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwNAmMFe8UHBGdVtkaJNahOnmhwk2mQG6c7grpv4YLI=;
 b=PZH4f4TDI8zofY3TubRjQZFLz9RAtZZMXB33muh6dMGDJBNCEDyrjnhnGfaTGgRZb8cPgnL8yM7KEjxu+vgaU30sIoUhxeeZB8BPM6EoX3grZFiI86qRYsu0i2APGvQDDadBiPXPHWAJMyAOgy29zpN3NIm2lWrq2PNn7MtnSNtNzb1RzKc+oWwyf9fxuFSQ5uMkDlKm+mXFIBH16KVkqrR+X1q/JJMupZGZfE32e+j4qRmsGYhwIk+cUDGiSi69p8zjRQHHhHHo83/Bo0Sb1/CqwRZERKi+l1KSxUVl1Yt4TRhAOSd7BDrHYy9+TTc2xA4uD8plZNwHX8xFhSCWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwNAmMFe8UHBGdVtkaJNahOnmhwk2mQG6c7grpv4YLI=;
 b=oSHOpOWtNc7M+65Zn2A9LN1wWnQiXNd5uILyS4wVgMDMfZHiLZtonplW6m5r2Mf+4qQuRqIZUIf4VjlK4dz6qXWptSjZYieLAW3L7lEVYxUWp19NwL+YfZRrjs7M34IJOEvMBU2vA+ddVF6teKcJQUg1BH4qHKwUqMr+Na4oTODsIk3TIfmZfKeEng4mYDZVoqMMiB1OVpffvSEFta5G1Ja65DwqgQKfNUHV9wVMUgaO1sa2QGPwXYVwy/2R+2px0KCBM9sdlvXwHfDDjgHL9BvuzVl4mvPjh1jAY1Qlun8VlU4Rs4nWz3SGiLgk/s0PONPait75pkD/oj4nZFI//w==
Received: from MW4PR04CA0073.namprd04.prod.outlook.com (2603:10b6:303:6b::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:39 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::1e) by MW4PR04CA0073.outlook.office365.com
 (2603:10b6:303:6b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:39 +0000
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
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:14 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:13 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:13 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Date: Thu, 31 Oct 2024 01:52:45 -0700
Message-ID: <20241031085250.2941482-11-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6ed8bd-cbc6-4e7c-d417-08dcf98983ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ccO2+ktsYQEHnSadEHWAcLR5o4lsUpeUYbQM9LMeyYYk8RjPDxm89cL5RvVb?=
 =?us-ascii?Q?A2efEj3tjotiAJRMzTfgI26HqrQRoT3yWee1xKs6L8c6HJlbkXWs0r0Td774?=
 =?us-ascii?Q?OckM6r6BLm1OhwifVHWo6T94n0sWr12q1U1KM7/lgbjY+ygMeY73IStMiMTR?=
 =?us-ascii?Q?TLb01APvVxJkupHdX8CtJbmsoxbmVj2EscqYD0I9XE9fhwpmggkGHM0WoohS?=
 =?us-ascii?Q?mxEQ/76HZVYzeKkkAGOZgJPS5OQrAvdTUKcSjOlKEoFVj6IXrZ+OUr9eNa8M?=
 =?us-ascii?Q?M116x1Fti5AaGwd58uRDtahW1JBFWac0m6pcL7yFCy/CX1sFNr7x8WFhHjEh?=
 =?us-ascii?Q?BY40zTetrpU5NRJCM2dF9yu+FS6YllHMrp/LbVqGJXzHx1nfCd384Xc2knom?=
 =?us-ascii?Q?XsqN0UtwWRUrkdEnAssblekh0GGsBXJsJhzGrtlSmc9b1dQ+y0TusLg5DB5J?=
 =?us-ascii?Q?jhuOURLGY5WnYZmIsRS+fxLO7nPDkdHSTzpnI75eDFVihzMzmTd62U9k9VBD?=
 =?us-ascii?Q?TiqQTHWt99bqUVqDC2i+Ccww/I8ArtBMFhAOIOuu1dqfAg8FJu5OtWQ5vitt?=
 =?us-ascii?Q?/bLDjfR+Wh8sGzLZKmcG0en7JHlcyQBNXJ+NXO10H1moVZnp55yVlUFbRwk+?=
 =?us-ascii?Q?iy/VSP7llTG4g5GUEAg0HoKn9N2s9JTNZZH5j0isbcVhl+fZsmo3hha/F/4B?=
 =?us-ascii?Q?nSv7ea+gKJfUZvwOFL0YRI7a9v8E8jCHoV/PWh22jcwKEhSymIBSIHhQaIxA?=
 =?us-ascii?Q?O1/WpsBBAcOGAHM8cHvRiM/iR7vpJDoIlwDVWXukzPqK0XbvKdCzujfUaNHn?=
 =?us-ascii?Q?kCztIS8AMwHE4wKa4HhrsFaF/esrq3/93t+mdjKkMMj9Rd3Waqjze5rEQnlD?=
 =?us-ascii?Q?vgYbEyfASiuvKPnHtv/Oj74LDAjmxcxnm7A8aPvC73q/klCWZJ/C+MoDX4E5?=
 =?us-ascii?Q?UL2djrxEb8jm/3M1PhFNvkpP6A0tjWWEDiB3vKO13LC8bba4RgTUnzRE5ehA?=
 =?us-ascii?Q?6RiIPl5ux5D6pmW/nSwsNNZyaBaTOElBpHim4NzMcCZD8pMTqsqp1Yab4tVB?=
 =?us-ascii?Q?a+2HbHOkb93dxxtHOjNs31EJPTKNEWagvYmEl+opwDb6Ui1Lyp4POc9874aV?=
 =?us-ascii?Q?3XEe5jIHnpY9Hz8Yap5OX6lYdf7CTJglCfY/7LmEmVeQ+ydI1y48W2qL0osx?=
 =?us-ascii?Q?HoUnwDO1ekPF/3qdXkSn9qJp4zPj+2Soxlwa8J2hPeoEnYZ47IW5NEldToFy?=
 =?us-ascii?Q?ODkeVHRAKQ6H0ehG2OmX++gx5vJFSPVQZp+enjEvrilkYDH2zveVU+yXtLch?=
 =?us-ascii?Q?x8FVuSI/yxA/NBcDpmQa7KN7vbn4vvwlRleLzmIbh+GW4NfP3oFcbovaRr9v?=
 =?us-ascii?Q?+ZxmVj97gp9yvr5QdpUsOOhLEQ5MZPq8Ib+iTN2lQS1wLnM7Bw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:39.3586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6ed8bd-cbc6-4e7c-d417-08dcf98983ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

The variable "msg" in r535_gsp_msg_recv() actually means the GSP RPC.

Refine the names to align with the terms in the kernel doc.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2ac0868eb30c..c4164d79240c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -336,59 +336,60 @@ static struct nvfw_gsp_rpc *
 r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvfw_gsp_rpc *msg;
+	struct nvfw_gsp_rpc *rpc;
 	int time = 4000000, i;
 	u32 size;
 
 retry:
-	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
-	if (IS_ERR_OR_NULL(msg))
-		return msg;
+	rpc = r535_gsp_msgq_wait(gsp, sizeof(*rpc), &size, &time);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
 
-	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
-	if (IS_ERR_OR_NULL(msg))
-		return msg;
+	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &time);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
 
-	if (msg->rpc_result) {
-		r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
-		r535_gsp_msg_done(gsp, msg);
+	if (rpc->rpc_result) {
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+		r535_gsp_msg_done(gsp, rpc);
 		return ERR_PTR(-EINVAL);
 	}
 
-	r535_gsp_msg_dump(gsp, msg, NV_DBG_TRACE);
+	r535_gsp_msg_dump(gsp, rpc, NV_DBG_TRACE);
 
-	if (fn && msg->function == fn) {
+	if (fn && rpc->function == fn) {
 		if (gsp_rpc_len) {
-			if (msg->length < sizeof(*msg) + gsp_rpc_len) {
-				nvkm_error(subdev, "msg len %d < %zd\n",
-					   msg->length, sizeof(*msg) +
+			if (rpc->length < sizeof(*rpc) + gsp_rpc_len) {
+				nvkm_error(subdev, "rpc len %d < %zd\n",
+					   rpc->length, sizeof(*rpc) +
 					   gsp_rpc_len);
-				r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
-				r535_gsp_msg_done(gsp, msg);
+				r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+				r535_gsp_msg_done(gsp, rpc);
 				return ERR_PTR(-EIO);
 			}
 
-			return msg;
+			return rpc;
 		}
 
-		r535_gsp_msg_done(gsp, msg);
+		r535_gsp_msg_done(gsp, rpc);
 		return NULL;
 	}
 
 	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
 		struct nvkm_gsp_msgq_ntfy *ntfy = &gsp->msgq.ntfy[i];
 
-		if (ntfy->fn == msg->function) {
+		if (ntfy->fn == rpc->function) {
 			if (ntfy->func)
-				ntfy->func(ntfy->priv, ntfy->fn, msg->data, msg->length - sizeof(*msg));
+				ntfy->func(ntfy->priv, ntfy->fn, rpc->data,
+					   rpc->length - sizeof(*rpc));
 			break;
 		}
 	}
 
 	if (i == gsp->msgq.ntfy_nr)
-		r535_gsp_msg_dump(gsp, msg, NV_DBG_WARN);
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_WARN);
 
-	r535_gsp_msg_done(gsp, msg);
+	r535_gsp_msg_done(gsp, rpc);
 	if (fn)
 		goto retry;
 
-- 
2.34.1

