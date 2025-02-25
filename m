Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242DA4508A
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2025 23:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F13610E815;
	Tue, 25 Feb 2025 22:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iac/Z/Ca";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9F410E814
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2025 22:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygS+WcjthKHqdt6+sBeUNj+tnLp7TbdzWjJWy/9iO0ZmnyQpnDZuQbCBncuTO5AJx9kcjQivYwqzgY19pHIUyB8djAnEHze2++Uw4OYKkJ1eTkghrEaBpP+m/Qlz5paYz9Naq3fsgu6lyvxxkESQOs1GrXtdnU0+0TQOvkDbPA7tHDn0UjkO9gpL1mha31NV9yRqUf216Vv9URiW/krzcOlH/iewm0X+z2vDxOezwun9yPcrLQURsMEvh5G0lFdbE1VFM/yLRddAS8JVws/Vamq83cGSptVuBGbVxehEvs9SK77C+P8YFxbrjvHNjyIxGSkeG+A/m0uT1icWuWz9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTO+C8K3z4w6en4QBpVI5+gi8AeE/NJAYPDw+WAG0rQ=;
 b=dV0fpaIFxlaibw+Mhuo75nUDRcDoSZMr8k6/4AfnkTnBKpGQpcJt/UUtD5Rmf0gEBj+8FymvVZ/fORwXmMmBzN7+gDc2zrSdg+p/FePbM3HWD6BhN6AL68o2Q11vOgtDRkj4eOxOq9f80j5tVe0/AT/WbY5hdgBcZ9VM8Y8qwI/joBrCBQ1ueD1lC9m3CwRmVmNajiVwNLYoc5xDTO3nNbp4e6jpOSVTlB79e92si0gfg53JlYbAD3elNz5t95Cu563cChnFnMyXNo6L02KRejVHHfwRPL4WDw+BOyVX5dWVqDHUloGLDueGfk2MBora9lr2JFA4D3E9ozzr4rMLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTO+C8K3z4w6en4QBpVI5+gi8AeE/NJAYPDw+WAG0rQ=;
 b=iac/Z/Ca3ABby3fjMSDZuuV0Iel4BAObPASomDOAJwflUV7Zlha9oYtZdcX1qC3xQsGX8NCXfLz0Au62ftAUvZ1TsJuFERx01XMXf4erGyGdpWsX2Tou3Ahngs4tssCZHQ8mL2tLwoJE0KhmpfM5T6EB4FecBY0oV/n9OvuGTSq08ToOITOJvDxb41jjdN5W3njL7WmIqKPX50PWawQsWshJeenF0IxlcADn+X64tkUq51nuGXCRODQK8FNXZKvd2tjw083biyt53ZVLJse9hWOI5Ji/FlwnEy71EnQXgWuYqCczJIo40PrirnzWA7p4eR5WC3sEwWZFF1jpmiBc6w==
Received: from PH3PEPF0000409D.namprd05.prod.outlook.com (2603:10b6:518:1::50)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 22:54:14 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF0000409D.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via Frontend Transport; Tue,
 25 Feb 2025 22:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 22:54:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 14:53:55 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:53:55 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 25 Feb 2025 14:53:55 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: [PATCH v2 2/2] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Date: Tue, 25 Feb 2025 22:53:52 +0000
Message-ID: <20250225225353.12642-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250225225353.12642-1-zhiw@nvidia.com>
References: <20250225225353.12642-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e05cd4-8bfd-4d1f-27da-08dd55ef5373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VcF8FWTwzyrHsG6le8Sna5SS2NILxvqrOlmG5rolx1gL/+ZNYDio4NRnrC6M?=
 =?us-ascii?Q?X13uQipDjcACqFbHkKTpFPbdj5cGTqVGbhxyogzo8pUQQyuVH7oZexhK0OJN?=
 =?us-ascii?Q?wsf1ctGsNWsTuC19uKZFnQVYcgvrqs7bs+11TdXnKTL8TqI8rDoSO9o+BDOv?=
 =?us-ascii?Q?H0rvK4KVK6L5+A1kwWEbr6+IE8CSHKpaKYSQeCWr/uBchHwu4IYcnrPOIwkG?=
 =?us-ascii?Q?AFOdos1jQSIPd4Ty2QpWyVrOIuV24wkcz0nIednS4YZBKyocevysE1+i6KFA?=
 =?us-ascii?Q?7J1ujjIr3ERyUXmOiwRh/wiaqnBKiMtAq37BCrtLIcmG0VQ5pU4bbHkgI7A0?=
 =?us-ascii?Q?Tk2buYac8pPhe7g3pKC0LC19doIzVJl84AbDAXBpsEoZ+bGHll8m3SHet4d6?=
 =?us-ascii?Q?bI6U5T/C1UQPN8CE8OIRR/HG4O77u5QwvtiiJROftf6omjVaUyX6h29xTjdb?=
 =?us-ascii?Q?5WlxhbycGaHw3HSvpJeNukR5wIgXaqfC0K7a1utu82Fe8WF/Ezj/oLbohDmr?=
 =?us-ascii?Q?dnq4v/Hxhdgt7O6lRB2C4kvIMeoRya+bTnFNPqL9ThDQYnBJF3WR+1vIBl9u?=
 =?us-ascii?Q?SwebJNq2iCOkd7TbByhJlzkHXihoo15jR0z8vAOex0Abyohn+ncwbkZfrOgD?=
 =?us-ascii?Q?PsoCJFdVh+GETompNDcgGXdKVRFeWc+01IK3YgM/amva19Kbl0myXqZwgRlV?=
 =?us-ascii?Q?tyBoldV6OfcyVS6vVUX2zrIb0IUucNtSwor2bcPpXsRJWnu9yU9HV2i0/3bV?=
 =?us-ascii?Q?QzMNIVejteIPJmjOHDYppe6LYcuJbEJ49f+pPOhrZ4lxHccVqQ9EmYWAuBx+?=
 =?us-ascii?Q?d/EPU4axLKzzSIPXufcJElH61Itoy/ONS3YRxVpHmMlG0ShD2HXfeifZ0ehr?=
 =?us-ascii?Q?MCN8kTD2JoVcApx8HRMLpadd70eUtXMAK3zf0HVrhbKq6IVfG8KuNZqsgb7v?=
 =?us-ascii?Q?tIey6i8APJ5HqW1xACVQ3Ihp/hDVcyzsHC9yTQJdRB66woz7StF3SJM/0k1Q?=
 =?us-ascii?Q?YK7X5ghm8VBWBy1o8vkTcy8JSW+vqB6dNurvTRxgXz9gzVimlk8UmGZNZ7RK?=
 =?us-ascii?Q?1PLuyofSRLqQ/tZp6/XV+VSveh9emzqLd5DsdLX4INgbPXN2RvWtlJsdff1Q?=
 =?us-ascii?Q?oDWrgpsUmeG9NYwR50pk05UZULxQ1me0MWZM3kAyUWKiCI8vYl0s6awMcFFi?=
 =?us-ascii?Q?0HXiZDAk/DzfRYdRXavUM597fLMlp+wKK1n2/pV3dbor39n7acFiDJJb9NQb?=
 =?us-ascii?Q?HRPDSaEb33Cbcj6brYySl+g0eqppMHGQnbndon9X182rkRf+AElQk+Sg48q+?=
 =?us-ascii?Q?X2XCbL6dW/iS7K9yVYWIvEkV38wHvpj9bIL2AKBRIjLIXdiWRsQEE40GbAlz?=
 =?us-ascii?Q?7+DpeMQ6Bm5WAI2csYmzyOQ4O2h1MzPbwxU0Z/mtIs6Iv+WYQ8o7k9CJHfVg?=
 =?us-ascii?Q?/jv6W19rl+n+c1o7ECqvZHXSEJ49oLTJWfj+yTA6FKcMGAcvUahIxpSXUMzk?=
 =?us-ascii?Q?hOoL1Huf4jUsqqo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:54:14.0516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e05cd4-8bfd-4d1f-27da-08dd55ef5373
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
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
index 0465fcece47c..5c2ef50441fe 100644
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

