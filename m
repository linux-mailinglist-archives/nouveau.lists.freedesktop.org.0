Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98120A4713E
	for <lists+nouveau@lfdr.de>; Thu, 27 Feb 2025 02:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3AF10E9FA;
	Thu, 27 Feb 2025 01:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TYqkWZXP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400C710E9FA
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 01:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnmecrRnHcKBaSRNNB4t5eFQIiRJYy4VtFw5uMnbktu/ZFCvkMC8N4Yn64l5uqjArJYpv7NJC1sELegkNjCPE41w+7sb86wAy8IqAyA0wAz7Lf4jGYhtBjmdP+EQuQEC5HWnO+rFTBQhmXlWbRF/pTADVoWDezEZLn+RXGvhaIIhzwQcgF3unQi1lYYNPHdob5RkJXby5DsQBxa5rwAgGEIuvb8gm95Gr13Q8stTEa9t2MqBiU6UTtP0vcrJskjWGf0GYvn0F1MQQOIRq8JfJSZzFcxSaWq5HZw6QVuN72HSul5z6uJTyA4EP4q0wglhS7y+b/u69QGmeia7rH8tWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33hntzcu1OrRP7x1T1TgHIz5+jt8wQZq8dptVZ5XW0M=;
 b=H/5qNKzWfqvzxrDutUWFR0h4cVVLi56rr6MB7JSocsHySbIIRs52KeElTSyBD9yz/p/pDtdf+Ilx4Vi+nLXRQOtzQcUpd14ybpegcWeoYfCkPl1KeqXhLyRVgH1cyAdGVe5hEJyx8mLopFGHEcQBu5NM5pvnJfujK/S5qvoZNVm6aGIPP0IfzNWq/H1Fi2Q4Sku8ymOTSRzSHMxvmqzt2V4nI6oQGxPdjFWnetJnoZVBnfVZgi1KY0OY3jU1zs5KOlfpUXsflU0F2fYxNMD/koHl+TCr4/pTWopR+vtslE3e+gsOkovijgu/DIDCO3izQspCXaS8LTG2idqHw5CGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33hntzcu1OrRP7x1T1TgHIz5+jt8wQZq8dptVZ5XW0M=;
 b=TYqkWZXPe89oDkQOWiuOjQYIuH6US3dIhcDd5YQrtGIeb9p9uXC3IFvck6gsQ4sS223QDbG/qFmQL9Xrjk2MSpXaAq0qImwXDWB0A/OAsZjqTPD78MFqfa1ZlkEYZkI1O8NiK4d34IoROCIVOXYL20NOYVCqxfz8vY+Or0qazSDHwjX7/JWcbnxexkxTfTg1hMjFbY94TZ0M21p3CmwEIouXNUvfJueJ2RMC7AQ53TaqR7eewvDrVA4fQjhsAeMwfTI5kmk4qigB8VxCuE0AYXy2Teh/sDP4lSn1h7S9M9JMZy48ZT2IaYEqchXaQMYQsW5nbnaUEA1aVtLsUTOEZg==
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Thu, 27 Feb
 2025 01:36:09 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::17) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 01:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.0 via Frontend Transport; Thu, 27 Feb 2025 01:36:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Feb
 2025 17:35:57 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 26 Feb
 2025 17:35:57 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 26 Feb 2025 17:35:56 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: [PATCH v3 2/2] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Date: Thu, 27 Feb 2025 01:35:54 +0000
Message-ID: <20250227013554.8269-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250227013554.8269-1-zhiw@nvidia.com>
References: <20250227013554.8269-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c672bc4-ad6f-445a-0b52-08dd56cf1cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lkaZJwhj/5KZvpJ9RfmYX3MDL08o/sn2gf8rJ/CZs75xY9RG5jS8hKZTlIGE?=
 =?us-ascii?Q?TKWJdPFgA63l7hTAHnhCymFaIC6o/Ma4ObSiLN09cOdsEtlYFfEaC68v8RNh?=
 =?us-ascii?Q?n/bS0WEc5z1C49Dm3SF7iimxjmybBQ/9d5bysoZ5rIyEvRPshBRqCHhQv3h4?=
 =?us-ascii?Q?DnJnoYuGkXpRofJS3Wp1NAvGPxjn7hdKd4/pDZLe8VZMaKHFH/9a43tDNLEv?=
 =?us-ascii?Q?NwEzfms7kaBgcsPu6kS8ARQmBndZjl6biFBBUomM+7BvfLor2UTiZgija/Uy?=
 =?us-ascii?Q?CIk4RwQaFtlo/EKhZBhegVqSyiBqKKnvRRgIPUZ8hFinmAMCAMysOgrhpO/T?=
 =?us-ascii?Q?+fPj2REIKmhrQarnUMpOATeonzXQNZFkw5XXQECohVTYle2XMAzlEeFbWMCn?=
 =?us-ascii?Q?rZf9F40rnTSG1UK1vaFw9UuiveE4exhmAmoDN8GJrd8Gx1L+/qqiPUywjqVg?=
 =?us-ascii?Q?BfwnkCMYmmLdsidDtAMxtrYDkKbAZpVzlbYuor0OnGUZk82tv/aCQPMZ9FHr?=
 =?us-ascii?Q?8d1K951poO1aHO4SzOdymouzk8TE2CLMoI3xehlU2JcPxORIg+Et4UoyDhGo?=
 =?us-ascii?Q?LVK8Z/QJ7ktM2UuHMQsMfqjuoopRj/GDXD0Wm8JUTCskZ3MHSmq7szUv4TNi?=
 =?us-ascii?Q?Gt5vPRH+0PEA8I97uyGt1F8urbHsIul6/UbMtivcXXoDOtdMkRKV46yo7tUe?=
 =?us-ascii?Q?fWusRPACq6dvrhhdYDtJVMKTDsnPC86WdcutCVSjgVocywX/Gv3YQ+WafRlI?=
 =?us-ascii?Q?KtcnyeTe/BQyyqhrHN0OFJlASaJLWemYC3BjP5JFo2nrcQ/6T961zYbmNesm?=
 =?us-ascii?Q?QISGlZllffxL2SBVYnZOYuuLejMneUPQOZWd9bzUxJ9EbCxGya4fi91NZ3JO?=
 =?us-ascii?Q?T4QGxiCbqQgcVDDTfFrIzz0uYIMeZlRepd95HrMkGvgp7Bp7uB0a/Ey0OBZq?=
 =?us-ascii?Q?oakKR30JzS9MnHb995cEeOX2YvCHFhaStLFRVTHoQxY+ISFUYJ2li9aRek2e?=
 =?us-ascii?Q?Zvt/xMI8xlYm50j7ABLYp7C8SV+pMdxdyWUeKkD8p+78oRkkTtaDJoqm9AKE?=
 =?us-ascii?Q?ziX17bnHZQPyHfrWeovLE69r9q18MC1dNs6VgNFaAcIrDTHwahiFieTFW5Sk?=
 =?us-ascii?Q?BTTWI8CgRzBAes8QPyUibCpy4yNLqOg+OhF+G2gPLPqzivITGyeX15blSjbx?=
 =?us-ascii?Q?kaHNC6p2Siew6SaS7OnksgJSdR5QUgN4jP966yR0QIcy7cVAU2ADkJLzzSqF?=
 =?us-ascii?Q?LjdOUyhymrO3XQRQais4mLgbtXnh7H0QrfwMu2UISGAaUXQD4GxExpGgb4To?=
 =?us-ascii?Q?FUJZOT7a9lvTWUsjqBdPPa+L5N/eeSx8nlPFxYxG+JPAkClIpRufr8dI98kW?=
 =?us-ascii?Q?IlaNGKHtJ87Ye6sghhei5hwWbLB4fNQGGQT3OnNMqk2BWjMrPPcxEP1erAAx?=
 =?us-ascii?Q?MwDSV6XQ/I75R82T6mHOPO928Sr1nfn9nq7v1lfHVvBWbxdKUqtiNiV/KQg0?=
 =?us-ascii?Q?j1+z9Fd7Vki+2XY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 01:36:09.4146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c672bc4-ad6f-445a-0b52-08dd56cf1cae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402
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

Some GSP RPC commands need a new reply policy: "caller don't care about
the message content but want to make sure a reply is received". To
support this case, a new reply policy is introduced.

NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY is a large GSP RPC command. The actual
required policy is NVKM_GSP_RPC_REPLY_POLL. This can be observed from the
dump of the GSP message queue. After the large GSP RPC command is issued,
GSP will write only an empty RPC header in the queue as the reply.

Without this change, the policy "receiving the entire message" is used
for NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY. This causes the timeout of receiving
the returned GSP message in the suspend/resume path.

Introduce the new reply policy NVKM_GSP_RPC_REPLY_POLL, which waits for
the returned GSP message but discards it for the caller. Use the new policy
NVKM_GSP_RPC_REPLY_POLL on the GSP RPC command
NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY.

Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index e5fe44589bbd..1c12854a8550 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -44,10 +44,14 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 rep
  * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire GSP
  * RPC message after the GSP RPC command is issued.
  *
+ * NVKM_GSP_RPC_REPLY_POLL - If specified, wait for the specific reply and
+ * discard the reply before returning to the caller.
+ *
  */
 enum nvkm_gsp_rpc_reply_policy {
 	NVKM_GSP_RPC_REPLY_NOWAIT = 0,
 	NVKM_GSP_RPC_REPLY_RECV,
+	NVKM_GSP_RPC_REPLY_POLL,
 };
 
 struct nvkm_gsp {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index f73dcc3e1c0d..969f6b921fdb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -602,6 +602,9 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
 		else
 			repv = reply;
 		break;
+	case NVKM_GSP_RPC_REPLY_POLL:
+		repv = r535_gsp_msg_recv(gsp, fn, 0);
+		break;
 	}
 
 	return repv;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
index 2789efe9c100..35ba1798ee6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
@@ -105,7 +105,7 @@ fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target
 			rpc->pteDesc.pte_pde[i].pte = (phys >> 12) + i;
 	}
 
-	ret = nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
+	ret = nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_POLL);
 	if (ret)
 		return ret;
 
-- 
2.43.5

