Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96EABA6FF
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37510E10D;
	Sat, 17 May 2025 00:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jt7MMStq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DF510E119
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZ6dzoiGQzYOpOS9pd1QMyuq+6+cIOXK9Mdeey/q0NqCQAIOKi4PMggIC21bG/Fhb5m9k36lcKmlBAQHELz+F/bpg9fsnvFJZGfOfXKfeJkzbYa5Lf43xU20iEKoChXCy53J6QTSpOXh+MUrjenBEvunb5+n4JVkQaPhj9zvQ/CW49uZRjIkmatQu8WTrN5Z/LJzlc9ZSeO2P1zjugYkRyM9br6QQzUrUReiWiMSu3tXeZUBTihfsF27Kez+8eaMvC8nOeBm2TBRARrdxbD2muBYmhbuOHGslg9w7qr4I0xTRt+dPLDBY0rYVPQaLfBuf22SLhxqwT36JNWuZCJWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl0Wl21ed743iQNgQ7iPhARQiQSdqU9SVt/9NL9itrc=;
 b=Eybz2HTn9474wDbBpA2u2BOtTYEhpXEKaypUQ7L8eLwT29AjPSU61mFrytaB9XWLR/WXraWcdLeztLarm6JuUlh6Vf1L+D9HYMwa/kCkS2oYIRjm8wuvvoONzqzhCijN43nEiKHnY1z1Xc0AkJXzT/p4dGmSH6uXNmhKg+5eoouAYKi4vQC8XVl6h2ZVGIsyePcfuLrjmGkfPsVbFJGhkEY1a3u1S9CLOAhLZa+knPZVebYq4nZP9lfAp+6GT89dTSAD7FKh9UZE5nHX3vX0j4zJRXBPTX6hIPWjo9S7q10M4FJjw6Edvwj11fbQYk6uuYndWCsxnGDv87VWQKwNcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl0Wl21ed743iQNgQ7iPhARQiQSdqU9SVt/9NL9itrc=;
 b=jt7MMStqs9V1N9InYhKt8LOYPlxoRkW6PJ7JYqsGJ27iviZ9XOJWRddVgLzLgViV2iAuP0R77QHQuywbobsDFEvHx8o1zey7nAzSvaa02h3+BEMGKakmTNWjWmL3cUVTbbZcShRYjvQ6g4GAcefKoeXiS4hhHwFuZ/zyZbHxjIiWIZZs4US5yer9pmsOZaYouFo/7p/kGFwvLtds2GEsH8USOhxQDPVK0qTrzKLPi+9EQR5g33cWR/pe42NFhA9V1wGfFtWypRJkiIgIiVNW7avjeEF4lX9LX+Ymspbpm9Q1nhG4Wj2cOyEE6UXmjP1MGbgX2/LVry/xofvBA0Sz6A==
Received: from SJ0PR03CA0277.namprd03.prod.outlook.com (2603:10b6:a03:39e::12)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:10:32 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::f0) by SJ0PR03CA0277.outlook.office365.com
 (2603:10b6:a03:39e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Sat,
 17 May 2025 00:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:18 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 07/62] drm/nouveau/gsp: split rm ctrl handling out on its
 own
Date: Sat, 17 May 2025 10:08:59 +1000
Message-ID: <20250517000954.35691-8-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: d32377c0-09be-4904-b9cf-08dd94d73d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3CApb5xpn7C1+sCEFhhjMi0tiuCovt4GVL9hJW6HP3tunYo7p/jLp6+J589W?=
 =?us-ascii?Q?z8py+Kq81Gi9giAauZwmgZRS3/mkv0Bt15BOxZ+150gdFop864IJp9J89QYV?=
 =?us-ascii?Q?3jrsNjO7aBTeq9doEjw4cnliZSAFNRWcySp2GDP/YC4zTQESGlNdI/tv6XR9?=
 =?us-ascii?Q?bL/oIs4mwpJg32ceVoUPqPfIrSm0zWxyAIAUwcK3G2x+z83Ed/OZt5osn48C?=
 =?us-ascii?Q?49DBo6khqoPc7eXYSB2y4zywuktwac6ubow5t+4VW8ET85eEaSvINYWJjMDI?=
 =?us-ascii?Q?HaTWKhRuFoS1NumzW3/Q0p3UD9650T3WuSY1PIoR7PvnIGgzA/8BpQ8l4LQD?=
 =?us-ascii?Q?BOS5ZJVi53fIO8IeqVnyX34vO7w+7ESALQkw0ASdHHeZxpy3TlE3KdXqhvF7?=
 =?us-ascii?Q?2LKUiFVugqoP04QSZ6gp/ikesXFEZ9zW/w8qZsvgPnMXXzb2K06/644MuQSp?=
 =?us-ascii?Q?eYWnE4O6JomT+JG66pnCF3BkP4Jui7+4mmWRp7v3kwNqcRECVfQvBnokiKMj?=
 =?us-ascii?Q?x+tLZGPOMOKcmyqkgT9MBWxEzn5GNyiiBVh7cp03QNmVSkhE7nJs2QAmLhrF?=
 =?us-ascii?Q?gupj6qJNib8cBbwErpGsjJh7qmcrbVG9ZVMzpl7QHyHAXA/U8S4ugsob91Rj?=
 =?us-ascii?Q?Djv2o1gIk84/c/+TcUFqxOQoOOIJ3AxqQhzYu2FtC7P6wtL8dXht/ceO+Fju?=
 =?us-ascii?Q?gBGH1KA8XfaYH1k4bcfMX7x1qymeMRCjdvYA/gRM4WuJjdcS2Pj1050Kn14o?=
 =?us-ascii?Q?d+lY1fkDMXeo61Av20d3VnAQCUfs3sNX0i6AW2yGigq2tVPTICVc0P6SgCBw?=
 =?us-ascii?Q?+XHy8n+5ur2EJFIsIkIyDQ4nQ3IiRb562inuUO6AHbzksebvdT268lnIrx1U?=
 =?us-ascii?Q?CiXLh/zN0u3S75d/8y36ZIGkNS3eNX2JTlFd+7ce4tKbUFsaftnJ/eZwKu4+?=
 =?us-ascii?Q?fgFf4jXWnyxu/SUJvZNc2V2PwtA266YJ1XW3WtEMTFot3GSPc2+LqNBpk08f?=
 =?us-ascii?Q?2CanCGxqUGw/CuDecgV2meJc08vnmEjSAlaTS/g4PiOXL8TYwPR8W94Y0JAw?=
 =?us-ascii?Q?4C2bW5VYyfQobOiMqQGJtNt6xCN366yn1lxGcMpesTIs8r6u4Xi53KhpKswN?=
 =?us-ascii?Q?IeVT9xp8oY7JIxz8GIydbZysPy40zspRcD8NXumNUztvzUbdotRaS+yNXSul?=
 =?us-ascii?Q?HDZfsVwostasfKD09bYeKhnUxXuKHjoUG5STULI/XpAoPIV9uOmIisqjf7hZ?=
 =?us-ascii?Q?mdVSPWCQOtZ25JTB5Iqc5+ZVOfg1IWZHk0CKl9SiYnaNCuxrUKh7iv/xBzcv?=
 =?us-ascii?Q?K+3kqhfi+7AhJXo4idhf78mgJ2xHJAdRn0TFygeMxpqTN61vrn+ewtBMgqHC?=
 =?us-ascii?Q?1kctezNgEY48YOvdM0XzQYCZvB1dRgrpO7nQXFeTrRrjjT8SF1pkgjAx9Obv?=
 =?us-ascii?Q?v4nQcFLlr3OzPE/mU8SHjogNzf51eyev883SxWSkHMuBTn9tHiM7lAVwSmWx?=
 =?us-ascii?Q?LBJpqJfCcIKdzrdhLicdtcGlh9GmlmJ/yemq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:32.5078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32377c0-09be-4904-b9cf-08dd94d73d69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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

Split base RM_CONTROL handling out into its own module.

Aside from moving the function pointers, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 10 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 66 +------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |  1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c    | 94 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  7 ++
 6 files changed, 107 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index b543c31d3d32..bc2cf837aa9f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -212,10 +212,6 @@ struct nvkm_gsp {
 	const struct nvkm_gsp_rm {
 		const struct nvkm_rm_api *api;
 
-		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
-		int (*rm_ctrl_push)(struct nvkm_gsp_object *, void **argv, u32 repc);
-		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
-
 		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
 		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv);
 		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
@@ -316,13 +312,13 @@ nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 static inline void *
 nvkm_gsp_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
 {
-	return object->client->gsp->rm->rm_ctrl_get(object, cmd, argc);
+	return object->client->gsp->rm->api->ctrl->get(object, cmd, argc);
 }
 
 static inline int
 nvkm_gsp_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
 {
-	return object->client->gsp->rm->rm_ctrl_push(object, argv, repc);
+	return object->client->gsp->rm->api->ctrl->push(object, argv, repc);
 }
 
 static inline void *
@@ -353,7 +349,7 @@ nvkm_gsp_rm_ctrl_wr(struct nvkm_gsp_object *object, void *argv)
 static inline void
 nvkm_gsp_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
 {
-	object->client->gsp->rm->rm_ctrl_done(object, repv);
+	object->client->gsp->rm->api->ctrl->done(object, repv);
 }
 
 static inline void *
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 745d43586bad..4797a92708e9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <rm/rpc.h>
+
 #include "priv.h"
 
 #include <core/pci.h>
@@ -304,75 +305,10 @@ r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass,
 	return rpc->params;
 }
 
-static void
-r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
-{
-	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
-
-	if (!params)
-		return;
-	nvkm_gsp_rpc_done(object->client->gsp, rpc);
-}
-
-static int
-r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
-{
-	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
-	struct nvkm_gsp *gsp = object->client->gsp;
-	int ret = 0;
-
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
-	if (IS_ERR_OR_NULL(rpc)) {
-		*params = NULL;
-		return PTR_ERR(rpc);
-	}
-
-	if (rpc->status) {
-		ret = r535_rpc_status_to_errno(rpc->status);
-		if (ret != -EAGAIN && ret != -EBUSY)
-			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
-				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
-	}
-
-	if (repc)
-		*params = rpc->params;
-	else
-		nvkm_gsp_rpc_done(gsp, rpc);
-
-	return ret;
-}
-
-static void *
-r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_size)
-{
-	struct nvkm_gsp_client *client = object->client;
-	struct nvkm_gsp *gsp = client->gsp;
-	rpc_gsp_rm_control_v03_00 *rpc;
-
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x params_size:%d\n",
-		   client->object.handle, object->handle, cmd, params_size);
-
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-			       sizeof(*rpc) + params_size);
-	if (IS_ERR(rpc))
-		return rpc;
-
-	rpc->hClient    = client->object.handle;
-	rpc->hObject    = object->handle;
-	rpc->cmd	= cmd;
-	rpc->status     = 0;
-	rpc->paramsSize = params_size;
-	return rpc->params;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
 	.api = &r535_rm,
 
-	.rm_ctrl_get = r535_gsp_rpc_rm_ctrl_get,
-	.rm_ctrl_push = r535_gsp_rpc_rm_ctrl_push,
-	.rm_ctrl_done = r535_gsp_rpc_rm_ctrl_done,
-
 	.rm_alloc_get = r535_gsp_rpc_rm_alloc_get,
 	.rm_alloc_push = r535_gsp_rpc_rm_alloc_push,
 	.rm_alloc_done = r535_gsp_rpc_rm_alloc_done,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index 21c818ec0701..c8d7419b754f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -4,3 +4,4 @@
 
 nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
new file mode 100644
index 000000000000..f3f0fcd22cac
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -0,0 +1,94 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rpc.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+
+static void
+r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
+
+	if (!params)
+		return;
+	nvkm_gsp_rpc_done(object->client->gsp, rpc);
+}
+
+static int
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
+	struct nvkm_gsp *gsp = object->client->gsp;
+	int ret = 0;
+
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
+	if (IS_ERR_OR_NULL(rpc)) {
+		*params = NULL;
+		return PTR_ERR(rpc);
+	}
+
+	if (rpc->status) {
+		ret = r535_rpc_status_to_errno(rpc->status);
+		if (ret != -EAGAIN && ret != -EBUSY)
+			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
+				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
+	}
+
+	if (repc)
+		*params = rpc->params;
+	else
+		nvkm_gsp_rpc_done(gsp, rpc);
+
+	return ret;
+}
+
+static void *
+r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_size)
+{
+	struct nvkm_gsp_client *client = object->client;
+	struct nvkm_gsp *gsp = client->gsp;
+	rpc_gsp_rm_control_v03_00 *rpc;
+
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x params_size:%d\n",
+		   client->object.handle, object->handle, cmd, params_size);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+			       sizeof(*rpc) + params_size);
+	if (IS_ERR(rpc))
+		return rpc;
+
+	rpc->hClient    = client->object.handle;
+	rpc->hObject    = object->handle;
+	rpc->cmd	= cmd;
+	rpc->status     = 0;
+	rpc->paramsSize = params_size;
+	return rpc->params;
+}
+
+const struct nvkm_rm_api_ctrl
+r535_ctrl = {
+	.get = r535_gsp_rpc_rm_ctrl_get,
+	.push = r535_gsp_rpc_rm_ctrl_push,
+	.done = r535_gsp_rpc_rm_ctrl_done,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index f28b781abc5c..a3ee277a999d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -7,4 +7,5 @@
 const struct nvkm_rm_api
 r535_rm = {
 	.rpc = &r535_rpc,
+	.ctrl = &r535_ctrl,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7a0ece979167..9558fbb59ae4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -13,8 +13,15 @@ struct nvkm_rm_api {
 			      enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
 		void (*done)(struct nvkm_gsp *gsp, void *repv);
 	} *rpc;
+
+	const struct nvkm_rm_api_ctrl {
+		void *(*get)(struct nvkm_gsp_object *, u32 cmd, u32 params_size);
+		int (*push)(struct nvkm_gsp_object *, void **params, u32 repc);
+		void (*done)(struct nvkm_gsp_object *, void *params);
+	} *ctrl;
 };
 
 extern const struct nvkm_rm_api r535_rm;
 extern const struct nvkm_rm_api_rpc r535_rpc;
+extern const struct nvkm_rm_api_ctrl r535_ctrl;
 #endif
-- 
2.49.0

