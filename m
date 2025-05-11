Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75EAB2B50
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4668310E0DE;
	Sun, 11 May 2025 21:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UkoSttEL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462610E14A
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzxqWezjyTGhxwXivXDh1DMdkt4cGi7pvfyPDMvtM02oalLX5nVMEMJVTl9TPbgTcfx/BctlCSq2M6ArKpt0cqAEWIcKgsm7/+2V1boGUO8a+ui9VejUOzPQkmr7YN2tZZocyc7gECza7x8FSsaiqy0VVI5bf4jyCkuSA1ybfom0WkIVRd9yMXLcfaF3naU4AB9PNu3PH5QeXm7MNxl3AS3jl/P8l1QLQCKxs2ycddyvbvhybHVWhITn70LmaIrkdH/ILsSIcJgc9N6Qd2op8iwGVSALNmdCswJprahU1CwDJ66aCEnr4jY5s0q4TbsXr2Im/9juw+fLeH9eOd1V5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz3O8jjojCPrm0BobminIfAtomb+1V7ACKKCavrMM7s=;
 b=SIta06AxWw14yPSp0PiNh6ofrk614yMHDsfPGQGci6/3TyF8OqeOXQ0OO97nkozhUtO8wpi3s5zbMBiazso3Kexp9QJKutCxtD5MxQ4BsxJcGu337SOHLhal1JE2ybah9euEHIWB2C0Gn+YG5kfdPjIQ/hYXmw6htUP5EtqoXVrzhgWrWlJfQzd/NhsFOic0K2QS6buNbg1u+2+pNAKuChw+P0L5dxZHKli0iJrzjAOLmj5NRUyfIn2B77GO2BEOS+GwreaDH2BtaTepBqzKfSNh7CtQL/YuC3KDXFemhIQqDkhPif1/hTxRXDH9gu9JSsTCTFiE+Sy0YI++RmmGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz3O8jjojCPrm0BobminIfAtomb+1V7ACKKCavrMM7s=;
 b=UkoSttELcYTd2oQa0vSye2m+XRCUOl1ZTyy4+oVRMEMXt6nPsy9PmOp4fDMDO8LRyN5u0fCk68EnjXaojufxVeNGrWUyevuJ9bVw5wqXHircMOkcO/Hrd3yWJdnamSGlSNe4oXPDUv5g/z3BhDXxWvrsef0h5+xCwWJwSyyzolNiSmCU8VEIIERHHToer4fyZ2Q+Ysd31lZFrKDdwOgOWhm1e/L7DJ3gOeUD3Mc0lD99hgFlIXwXxr0cL1+CfVn4f/uccacD36/J3KFozntfZzWdFxbtZbk0aBo2RuTMtkfTAqrAqKjjeth0p5uUV6ZcMe3MDhVD0g1hY2BAERMgGQ==
Received: from DM5PR07CA0096.namprd07.prod.outlook.com (2603:10b6:4:ae::25) by
 DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.25; Sun, 11 May 2025 21:08:20 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::46) by DM5PR07CA0096.outlook.office365.com
 (2603:10b6:4:ae::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:09 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 05/62] drm/nouveau/gsp: split rpc handling out on its own
Date: Mon, 12 May 2025 07:06:25 +1000
Message-ID: <20250511210722.80350-6-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: e7acb692-5ad0-412f-f233-08dd90cff4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fP3VnoWzo5Yy1eBXIZ5SMEQGtsMlxX/W6zHCckiZY0GrwOtODszQGAw7hr4G?=
 =?us-ascii?Q?ZwL7hTQEDsyxKnWDYFg6TdvQn63Ukfw26QFCz5d3YgnVfsUDarNHoi87uEzB?=
 =?us-ascii?Q?HzS0XtMZcyxMxA2UxYl7kSuYnqYGBTzsWINoUvHaMaKk5e98ATIi/+7tkmIu?=
 =?us-ascii?Q?tdn3nbIfa7zGS1ZzEfUuYX78McSHm8iaCh4kAgjhBH5+7Za8l4GAFVaRzIKF?=
 =?us-ascii?Q?0FPfxwXLlIxG11+huZG3FS0BDP49n7/Iv54cbYtNpdGIXj09a4Hd3IbusOxX?=
 =?us-ascii?Q?zOyKHCE9oab04nJBhPu0TAt979fvr0672zrhHW26zo0rVCq84/OUIxDn+qm/?=
 =?us-ascii?Q?afXYomcAwl+lcGFnA/g6TTgngCyyzaetqv3KV5HqEG/0wIldza0r2vrrGPx+?=
 =?us-ascii?Q?kXpd7P1yDNwZQSwDTUoSrrUO5Xv9UigR94fyH+NOGIh0lkjbhDPKnQR0ACcB?=
 =?us-ascii?Q?2+Z9+s5xFPv/w4lQfAVw+hANeHhoTZbQe1zsGmiyrdWVO/p39IFJCgQP2Ipm?=
 =?us-ascii?Q?uvJGcfuXjcnrjLgbx5IFJ1e+RUJOeyS3uBqDrKcTOUjmmRQEJPS1edu5pF+t?=
 =?us-ascii?Q?EZDSecq7sFHWsgYwK0Ssg+Iwt55fSaKZth938WTaj7Y16GiQEmaI73ZGOLlX?=
 =?us-ascii?Q?2FSD6uWvKDJXYwgueIz7fvKVk23PaL+lA5Eei8EHU24AnkPOHEJCzE8Ie/wP?=
 =?us-ascii?Q?lISFFV0Tgl3rZKOu51sQlIwtAfJnWxwncMWkbk5UTy9G+ntew5PaE3IlwPno?=
 =?us-ascii?Q?D01ywXYG1jbf79aDyXqNxR+6LKVTNBEYzO0KdHI6emdGY9rH1j+rryg+tz7q?=
 =?us-ascii?Q?c84nbNPJWYa7pxp7+TxnoJOr8W2OIyZSAUFc0BmRXYklMjzB+NLgEyrA6aOI?=
 =?us-ascii?Q?PoyxP46dgKzwROqrWE7akNZW3/LlhiP6ZWAD2QPP4sqBW9K6npX0Zn2DIzPR?=
 =?us-ascii?Q?+0Tu8irJntk+WikY4WtR7MJX9QKRV6FqsZnTm27ltA8jubmBdrO1dN6RhK8D?=
 =?us-ascii?Q?lLDwFqEmMMgifS02cUsRyGFNdZpgm9Nh+wlcWpCuyZgOILLp3vDt3OEI8xQA?=
 =?us-ascii?Q?WV6+XY9mND5l1HZ9EekFlhRbs/SnB1AXT4t+XDK/lH/pROx/WutoNpXBH39/?=
 =?us-ascii?Q?brnFF1NRddOKSTbKHkxLkOPXABqgjUliKrnEf4Q94oA9SfV/chqy20eCleDj?=
 =?us-ascii?Q?zPqp6KLxDMhSD6pQ8B36N/mKBBbpQzV1WUp9zQDQppLRhGZkmLIoWPuEfwfq?=
 =?us-ascii?Q?aF2R5j9kJRY1Ad+RFFem0+pqqICgMWanubhBk15G3VlfyuTWIZO9arLuJ54F?=
 =?us-ascii?Q?cbjPzhYxtAf16S4BmMqJBUMBOSZoHMZazAJar1cUz04u1ZKhoQUfZZIvRHna?=
 =?us-ascii?Q?aQ+fSrteNIiPpEjK5IwRE0rBmNGSZ8BABtvJzIopMT2lZwReOSkzXVl+i46d?=
 =?us-ascii?Q?fhqAbG5LcEnnQuV9ZelCONT4wScuTR+yhBrjEB+H5IYPN1qZU8z5aGz0/zkg?=
 =?us-ascii?Q?flHqQDd0U8ezalSwqqWbytkzdTzo9n9rRbhPrx693mAzplndT2DscXYJyQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:19.7738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7acb692-5ad0-412f-f233-08dd90cff4fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
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

Later patches in the series add HALs around various RM APIs in order to
support a newer version of GSP-RM firmware.  In order to do this, begin
by splitting the code up into "modules" that roughly represent RM's API
boundaries so they can be more easily managed.

Aside from moving the RPC function pointers, no code change is indended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild                |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 665 +----------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |   5 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |   6 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  10 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 692 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  20 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h  |  18 +
 10 files changed, 762 insertions(+), 670 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 7b863355c5c6..0759ba15954b 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -2,6 +2,7 @@
 ccflags-y += -I $(src)/include
 ccflags-y += -I $(src)/include/nvkm
 ccflags-y += -I $(src)/nvkm
+ccflags-y += -I $(src)/nvkm/subdev/gsp
 ccflags-y += -I $(src)
 
 # NVKM - HW resource manager
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 1c12854a8550..b543c31d3d32 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -210,10 +210,7 @@ struct nvkm_gsp {
 	} gr;
 
 	const struct nvkm_gsp_rm {
-		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
-		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv,
-				  enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
-		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
+		const struct nvkm_rm_api *api;
 
 		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
 		int (*rm_ctrl_push)(struct nvkm_gsp_object *, void **argv, u32 repc);
@@ -272,17 +269,19 @@ nvkm_gsp_rm(struct nvkm_gsp *gsp)
 	return gsp && (gsp->fws.rm || gsp->fw.img);
 }
 
+#include <rm/rm.h>
+
 static inline void *
 nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 {
-	return gsp->rm->rpc_get(gsp, fn, argc);
+	return gsp->rm->api->rpc->get(gsp, fn, argc);
 }
 
 static inline void *
 nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv,
 		  enum nvkm_gsp_rpc_reply_policy policy, u32 repc)
 {
-	return gsp->rm->rpc_push(gsp, argv, policy, repc);
+	return gsp->rm->api->rpc->push(gsp, argv, policy, repc);
 }
 
 static inline void *
@@ -311,7 +310,7 @@ nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv,
 static inline void
 nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 {
-	gsp->rm->rpc_done(gsp, repv);
+	gsp->rm->api->rpc->done(gsp, repv);
 }
 
 static inline void *
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index 16bf2f1bb780..af6e55603763 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -10,3 +10,5 @@ nvkm-y += nvkm/subdev/gsp/ga102.o
 nvkm-y += nvkm/subdev/gsp/ad102.o
 
 nvkm-y += nvkm/subdev/gsp/r535.o
+
+include $(src)/nvkm/subdev/gsp/rm/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 64b58efd3132..53a4af001039 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -19,6 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#include <rm/rpc.h>
 #include "priv.h"
 
 #include <core/pci.h>
@@ -60,578 +61,6 @@
 
 extern struct dentry *nouveau_debugfs_root;
 
-#define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
-#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
-
-/**
- * DOC: GSP message queue element
- *
- * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/535/src/nvidia/inc/kernel/gpu/gsp/message_queue_priv.h
- *
- * The GSP command queue and status queue are message queues for the
- * communication between software and GSP. The software submits the GSP
- * RPC via the GSP command queue, GSP writes the status of the submitted
- * RPC in the status queue.
- *
- * A GSP message queue element consists of three parts:
- *
- * - message element header (struct r535_gsp_msg), which mostly maintains
- *   the metadata for queuing the element.
- *
- * - RPC message header (struct nvfw_gsp_rpc), which maintains the info
- *   of the RPC. E.g., the RPC function number.
- *
- * - The payload, where the RPC message stays. E.g. the params of a
- *   specific RPC function. Some RPC functions also have their headers
- *   in the payload. E.g. rm_alloc, rm_control.
- *
- * The memory layout of a GSP message element can be illustrated below::
- *
- *    +------------------------+
- *    | Message Element Header |
- *    |    (r535_gsp_msg)      |
- *    |                        |
- *    | (r535_gsp_msg.data)    |
- *    |          |             |
- *    |----------V-------------|
- *    |    GSP RPC Header      |
- *    |    (nvfw_gsp_rpc)      |
- *    |                        |
- *    | (nvfw_gsp_rpc.data)    |
- *    |          |             |
- *    |----------V-------------|
- *    |       Payload          |
- *    |                        |
- *    |   header(optional)     |
- *    |        params          |
- *    +------------------------+
- *
- * The max size of a message queue element is 16 pages (including the
- * headers). When a GSP message to be sent is larger than 16 pages, the
- * message should be split into multiple elements and sent accordingly.
- *
- * In the bunch of the split elements, the first element has the expected
- * function number, while the rest of the elements are sent with the
- * function number NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD.
- *
- * GSP consumes the elements from the cmdq and always writes the result
- * back to the msgq. The result is also formed as split elements.
- *
- * Terminology:
- *
- * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
- *   payload)
- * - gsp_rpc(rpc): GSP RPC (RPC header + payload)
- * - gsp_rpc_buf: buffer for (GSP RPC header + payload)
- * - gsp_rpc_len: size of (GSP RPC header + payload)
- * - params_size: size of params in the payload
- * - payload_size: size of (header if exists + params) in the payload
- */
-
-struct r535_gsp_msg {
-	u8 auth_tag_buffer[16];
-	u8 aad_buffer[16];
-	u32 checksum;
-	u32 sequence;
-	u32 elem_count;
-	u32 pad;
-	u8  data[];
-};
-
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
-#define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
-
-#define to_gsp_hdr(p, header) \
-	container_of((void *)p, typeof(*header), data)
-
-#define to_payload_hdr(p, header) \
-	container_of((void *)p, typeof(*header), params)
-
-static int
-r535_rpc_status_to_errno(uint32_t rpc_status)
-{
-	switch (rpc_status) {
-	case 0x55: /* NV_ERR_NOT_READY */
-	case 0x66: /* NV_ERR_TIMEOUT_RETRY */
-		return -EBUSY;
-	case 0x51: /* NV_ERR_NO_MEMORY */
-		return -ENOMEM;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
-{
-	u32 size, rptr = *gsp->msgq.rptr;
-	int used;
-
-	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
-			    GSP_PAGE_SIZE);
-	if (WARN_ON(!size || size >= gsp->msgq.cnt))
-		return -EINVAL;
-
-	do {
-		u32 wptr = *gsp->msgq.wptr;
-
-		used = wptr + gsp->msgq.cnt - rptr;
-		if (used >= gsp->msgq.cnt)
-			used -= gsp->msgq.cnt;
-		if (used >= size)
-			break;
-
-		usleep_range(1, 2);
-	} while (--(*ptime));
-
-	if (WARN_ON(!*ptime))
-		return -ETIMEDOUT;
-
-	return used;
-}
-
-static struct r535_gsp_msg *
-r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
-{
-	u32 rptr = *gsp->msgq.rptr;
-
-	/* Skip the first page, which is the message queue info */
-	return (void *)((u8 *)gsp->shm.msgq.ptr + GSP_PAGE_SIZE +
-	       rptr * GSP_PAGE_SIZE);
-}
-
-/**
- * DOC: Receive a GSP message queue element
- *
- * Receiving a GSP message queue element from the message queue consists of
- * the following steps:
- *
- * - Peek the element from the queue: r535_gsp_msgq_peek().
- *   Peek the first page of the element to determine the total size of the
- *   message before allocating the proper memory.
- *
- * - Allocate memory for the message.
- *   Once the total size of the message is determined from the GSP message
- *   queue element, the caller of r535_gsp_msgq_recv() allocates the
- *   required memory.
- *
- * - Receive the message: r535_gsp_msgq_recv().
- *   Copy the message into the allocated memory. Advance the read pointer.
- *   If the message is a large GSP message, r535_gsp_msgq_recv() calls
- *   r535_gsp_msgq_recv_one_elem() repeatedly to receive continuation parts
- *   until the complete message is received.
- *   r535_gsp_msgq_recv() assembles the payloads of cotinuation parts into
- *   the return of the large GSP message.
- *
- * - Free the allocated memory: r535_gsp_msg_done().
- *   The user is responsible for freeing the memory allocated for the GSP
- *   message pages after they have been processed.
- */
-static void *
-r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
-{
-	struct r535_gsp_msg *mqe;
-	int ret;
-
-	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	mqe = r535_gsp_msgq_get_entry(gsp);
-
-	return mqe->data;
-}
-
-struct r535_gsp_msg_info {
-	int *retries;
-	u32 gsp_rpc_len;
-	void *gsp_rpc_buf;
-	bool continuation;
-};
-
-static void
-r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
-
-static void *
-r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
-			    struct r535_gsp_msg_info *info)
-{
-	u8 *buf = info->gsp_rpc_buf;
-	u32 rptr = *gsp->msgq.rptr;
-	struct r535_gsp_msg *mqe;
-	u32 size, expected, len;
-	int ret;
-
-	expected = info->gsp_rpc_len;
-
-	ret = r535_gsp_msgq_wait(gsp, expected, info->retries);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	mqe = r535_gsp_msgq_get_entry(gsp);
-
-	if (info->continuation) {
-		struct nvfw_gsp_rpc *rpc = (struct nvfw_gsp_rpc *)mqe->data;
-
-		if (rpc->function != NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD) {
-			nvkm_error(&gsp->subdev,
-				   "Not a continuation of a large RPC\n");
-			r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
-			return ERR_PTR(-EIO);
-		}
-	}
-
-	size = ALIGN(expected + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
-
-	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
-	len = min_t(u32, expected, len);
-
-	if (info->continuation)
-		memcpy(buf, mqe->data + sizeof(struct nvfw_gsp_rpc),
-		       len - sizeof(struct nvfw_gsp_rpc));
-	else
-		memcpy(buf, mqe->data, len);
-
-	expected -= len;
-
-	if (expected) {
-		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
-		memcpy(buf + len, mqe, expected);
-	}
-
-	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
-
-	mb();
-	(*gsp->msgq.rptr) = rptr;
-	return buf;
-}
-
-static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
-{
-	struct r535_gsp_msg *mqe;
-	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*mqe);
-	struct nvfw_gsp_rpc *rpc;
-	struct r535_gsp_msg_info info = {0};
-	u32 expected = gsp_rpc_len;
-	void *buf;
-
-	mqe = r535_gsp_msgq_get_entry(gsp);
-	rpc = (struct nvfw_gsp_rpc *)mqe->data;
-
-	if (WARN_ON(rpc->length > max_rpc_size))
-		return NULL;
-
-	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
-	if (!buf)
-		return ERR_PTR(-ENOMEM);
-
-	info.gsp_rpc_buf = buf;
-	info.retries = retries;
-	info.gsp_rpc_len = rpc->length;
-
-	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
-	if (IS_ERR(buf)) {
-		kvfree(info.gsp_rpc_buf);
-		info.gsp_rpc_buf = NULL;
-		return buf;
-	}
-
-	if (expected <= max_rpc_size)
-		return buf;
-
-	info.gsp_rpc_buf += info.gsp_rpc_len;
-	expected -= info.gsp_rpc_len;
-
-	while (expected) {
-		u32 size;
-
-		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
-		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
-			return rpc;
-		}
-
-		info.gsp_rpc_len = rpc->length;
-		info.continuation = true;
-
-		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
-		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
-			return rpc;
-		}
-
-		size = info.gsp_rpc_len - sizeof(*rpc);
-		expected -= size;
-		info.gsp_rpc_buf += size;
-	}
-
-	rpc = buf;
-	rpc->length = gsp_rpc_len;
-	return buf;
-}
-
-static int
-r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
-{
-	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
-	struct r535_gsp_msg *cqe;
-	u32 gsp_rpc_len = msg->checksum;
-	u64 *ptr = (void *)msg;
-	u64 *end;
-	u64 csum = 0;
-	int free, time = 1000000;
-	u32 wptr, size, step, len;
-	u32 off = 0;
-
-	len = ALIGN(GSP_MSG_HDR_SIZE + gsp_rpc_len, GSP_PAGE_SIZE);
-
-	end = (u64 *)((char *)ptr + len);
-	msg->pad = 0;
-	msg->checksum = 0;
-	msg->sequence = gsp->cmdq.seq++;
-	msg->elem_count = DIV_ROUND_UP(len, 0x1000);
-
-	while (ptr < end)
-		csum ^= *ptr++;
-
-	msg->checksum = upper_32_bits(csum) ^ lower_32_bits(csum);
-
-	wptr = *gsp->cmdq.wptr;
-	do {
-		do {
-			free = *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr - 1;
-			if (free >= gsp->cmdq.cnt)
-				free -= gsp->cmdq.cnt;
-			if (free >= 1)
-				break;
-
-			usleep_range(1, 2);
-		} while(--time);
-
-		if (WARN_ON(!time)) {
-			kvfree(msg);
-			return -ETIMEDOUT;
-		}
-
-		cqe = (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
-		step = min_t(u32, free, (gsp->cmdq.cnt - wptr));
-		size = min_t(u32, len, step * GSP_PAGE_SIZE);
-
-		memcpy(cqe, (u8 *)msg + off, size);
-
-		wptr += DIV_ROUND_UP(size, 0x1000);
-		if (wptr == gsp->cmdq.cnt)
-			wptr = 0;
-
-		off  += size;
-		len -= size;
-	} while (len);
-
-	nvkm_trace(&gsp->subdev, "cmdq: wptr %d\n", wptr);
-	wmb();
-	(*gsp->cmdq.wptr) = wptr;
-	mb();
-
-	nvkm_falcon_wr32(&gsp->falcon, 0xc00, 0x00000000);
-
-	kvfree(msg);
-	return 0;
-}
-
-static void *
-r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
-{
-	struct r535_gsp_msg *msg;
-	u32 size = GSP_MSG_HDR_SIZE + gsp_rpc_len;
-
-	size = ALIGN(size, GSP_MSG_MIN_SIZE);
-	msg = kvzalloc(size, GFP_KERNEL);
-	if (!msg)
-		return ERR_PTR(-ENOMEM);
-
-	msg->checksum = gsp_rpc_len;
-	return msg->data;
-}
-
-static void
-r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
-{
-	kvfree(msg);
-}
-
-static void
-r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
-{
-	if (gsp->subdev.debug >= lvl) {
-		nvkm_printk__(&gsp->subdev, lvl, info,
-			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
-			      msg->function, msg->length, msg->length - sizeof(*msg),
-			      msg->rpc_result, msg->rpc_result_private);
-		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
-			       msg->data, msg->length - sizeof(*msg), true);
-	}
-}
-
-static struct nvfw_gsp_rpc *
-r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
-{
-	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvfw_gsp_rpc *rpc;
-	int retries = 4000000, i;
-
-retry:
-	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
-	if (IS_ERR_OR_NULL(rpc))
-		return rpc;
-
-	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
-	if (IS_ERR_OR_NULL(rpc))
-		return rpc;
-
-	if (rpc->rpc_result) {
-		r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
-		r535_gsp_msg_done(gsp, rpc);
-		return ERR_PTR(-EINVAL);
-	}
-
-	r535_gsp_msg_dump(gsp, rpc, NV_DBG_TRACE);
-
-	if (fn && rpc->function == fn) {
-		if (gsp_rpc_len) {
-			if (rpc->length < gsp_rpc_len) {
-				nvkm_error(subdev, "rpc len %d < %d\n",
-					   rpc->length, gsp_rpc_len);
-				r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
-				r535_gsp_msg_done(gsp, rpc);
-				return ERR_PTR(-EIO);
-			}
-
-			return rpc;
-		}
-
-		r535_gsp_msg_done(gsp, rpc);
-		return NULL;
-	}
-
-	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
-		struct nvkm_gsp_msgq_ntfy *ntfy = &gsp->msgq.ntfy[i];
-
-		if (ntfy->fn == rpc->function) {
-			if (ntfy->func)
-				ntfy->func(ntfy->priv, ntfy->fn, rpc->data,
-					   rpc->length - sizeof(*rpc));
-			break;
-		}
-	}
-
-	if (i == gsp->msgq.ntfy_nr)
-		r535_gsp_msg_dump(gsp, rpc, NV_DBG_WARN);
-
-	r535_gsp_msg_done(gsp, rpc);
-	if (fn)
-		goto retry;
-
-	if (*gsp->msgq.rptr != *gsp->msgq.wptr)
-		goto retry;
-
-	return NULL;
-}
-
-static int
-r535_gsp_msg_ntfy_add(struct nvkm_gsp *gsp, u32 fn, nvkm_gsp_msg_ntfy_func func, void *priv)
-{
-	int ret = 0;
-
-	mutex_lock(&gsp->msgq.mutex);
-	if (WARN_ON(gsp->msgq.ntfy_nr >= ARRAY_SIZE(gsp->msgq.ntfy))) {
-		ret = -ENOSPC;
-	} else {
-		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].fn = fn;
-		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].func = func;
-		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].priv = priv;
-		gsp->msgq.ntfy_nr++;
-	}
-	mutex_unlock(&gsp->msgq.mutex);
-	return ret;
-}
-
-static int
-r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
-{
-	void *repv;
-
-	mutex_lock(&gsp->cmdq.mutex);
-	repv = r535_gsp_msg_recv(gsp, fn, 0);
-	mutex_unlock(&gsp->cmdq.mutex);
-	if (IS_ERR(repv))
-		return PTR_ERR(repv);
-
-	return 0;
-}
-
-static void *
-r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
-			  enum nvkm_gsp_rpc_reply_policy policy,
-			  u32 gsp_rpc_len)
-{
-	struct nvfw_gsp_rpc *reply;
-	void *repv = NULL;
-
-	switch (policy) {
-	case NVKM_GSP_RPC_REPLY_NOWAIT:
-		break;
-	case NVKM_GSP_RPC_REPLY_RECV:
-		reply = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-		if (!IS_ERR_OR_NULL(reply))
-			repv = reply->data;
-		else
-			repv = reply;
-		break;
-	case NVKM_GSP_RPC_REPLY_POLL:
-		repv = r535_gsp_msg_recv(gsp, fn, 0);
-		break;
-	}
-
-	return repv;
-}
-
-static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
-		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
-{
-	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	u32 fn = rpc->function;
-	int ret;
-
-	if (gsp->subdev.debug >= NV_DBG_TRACE) {
-		nvkm_trace(&gsp->subdev, "rpc fn:%d len:0x%x/0x%zx\n", rpc->function,
-			   rpc->length, rpc->length - sizeof(*rpc));
-		print_hex_dump(KERN_INFO, "rpc: ", DUMP_PREFIX_OFFSET, 16, 1,
-			       rpc->data, rpc->length - sizeof(*rpc), true);
-	}
-
-	ret = r535_gsp_cmdq_push(gsp, rpc);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return r535_gsp_rpc_handle_reply(gsp, fn, policy, gsp_rpc_len);
-}
-
 static void
 r535_gsp_event_dtor(struct nvkm_gsp_event *event)
 {
@@ -936,99 +365,9 @@ r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_siz
 	return rpc->params;
 }
 
-static void
-r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
-{
-	struct nvfw_gsp_rpc *rpc = container_of(repv, typeof(*rpc), data);
-
-	r535_gsp_msg_done(gsp, rpc);
-}
-
-static void *
-r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
-{
-	struct nvfw_gsp_rpc *rpc;
-
-	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + payload_size,
-					   sizeof(u64)));
-	if (IS_ERR(rpc))
-		return ERR_CAST(rpc);
-
-	rpc->header_version = 0x03000000;
-	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';
-	rpc->function = fn;
-	rpc->rpc_result = 0xffffffff;
-	rpc->rpc_result_private = 0xffffffff;
-	rpc->length = sizeof(*rpc) + payload_size;
-	return rpc->data;
-}
-
-static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
-		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
-{
-	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
-	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*msg);
-	const u32 max_payload_size = max_rpc_size - sizeof(*rpc);
-	u32 payload_size = rpc->length - sizeof(*rpc);
-	void *repv;
-
-	mutex_lock(&gsp->cmdq.mutex);
-	if (payload_size > max_payload_size) {
-		const u32 fn = rpc->function;
-		u32 remain_payload_size = payload_size;
-
-		/* Adjust length, and send initial RPC. */
-		rpc->length = sizeof(*rpc) + max_payload_size;
-		msg->checksum = rpc->length;
-
-		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
-		if (IS_ERR(repv))
-			goto done;
-
-		payload += max_payload_size;
-		remain_payload_size -= max_payload_size;
-
-		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
-		while (remain_payload_size) {
-			u32 size = min(remain_payload_size,
-				       max_payload_size);
-			void *next;
-
-			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
-			if (IS_ERR(next)) {
-				repv = next;
-				goto done;
-			}
-
-			memcpy(next, payload, size);
-
-			repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
-			if (IS_ERR(repv))
-				goto done;
-
-			payload += size;
-			remain_payload_size -= size;
-		}
-
-		/* Wait for reply. */
-		repv = r535_gsp_rpc_handle_reply(gsp, fn, policy, payload_size +
-						 sizeof(*rpc));
-	} else {
-		repv = r535_gsp_rpc_send(gsp, payload, policy, gsp_rpc_len);
-	}
-
-done:
-	mutex_unlock(&gsp->cmdq.mutex);
-	return repv;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
-	.rpc_get = r535_gsp_rpc_get,
-	.rpc_push = r535_gsp_rpc_push,
-	.rpc_done = r535_gsp_rpc_done,
+	.api = &r535_rm,
 
 	.rm_ctrl_get = r535_gsp_rpc_rm_ctrl_get,
 	.rm_ctrl_push = r535_gsp_rpc_rm_ctrl_push,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
new file mode 100644
index 000000000000..1c07740215ec
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+
+include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
new file mode 100644
index 000000000000..21c818ec0701
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+
+nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
new file mode 100644
index 000000000000..f28b781abc5c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include <rm/rm.h>
+
+const struct nvkm_rm_api
+r535_rm = {
+	.rpc = &r535_rpc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
new file mode 100644
index 000000000000..ffb4104a7d8c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -0,0 +1,692 @@
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
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+
+#define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
+#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
+
+/**
+ * DOC: GSP message queue element
+ *
+ * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/535/src/nvidia/inc/kernel/gpu/gsp/message_queue_priv.h
+ *
+ * The GSP command queue and status queue are message queues for the
+ * communication between software and GSP. The software submits the GSP
+ * RPC via the GSP command queue, GSP writes the status of the submitted
+ * RPC in the status queue.
+ *
+ * A GSP message queue element consists of three parts:
+ *
+ * - message element header (struct r535_gsp_msg), which mostly maintains
+ *   the metadata for queuing the element.
+ *
+ * - RPC message header (struct nvfw_gsp_rpc), which maintains the info
+ *   of the RPC. E.g., the RPC function number.
+ *
+ * - The payload, where the RPC message stays. E.g. the params of a
+ *   specific RPC function. Some RPC functions also have their headers
+ *   in the payload. E.g. rm_alloc, rm_control.
+ *
+ * The memory layout of a GSP message element can be illustrated below::
+ *
+ *    +------------------------+
+ *    | Message Element Header |
+ *    |    (r535_gsp_msg)      |
+ *    |                        |
+ *    | (r535_gsp_msg.data)    |
+ *    |          |             |
+ *    |----------V-------------|
+ *    |    GSP RPC Header      |
+ *    |    (nvfw_gsp_rpc)      |
+ *    |                        |
+ *    | (nvfw_gsp_rpc.data)    |
+ *    |          |             |
+ *    |----------V-------------|
+ *    |       Payload          |
+ *    |                        |
+ *    |   header(optional)     |
+ *    |        params          |
+ *    +------------------------+
+ *
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
+ * Terminology:
+ *
+ * - gsp_msg(msg): GSP message element (element header + GSP RPC header +
+ *   payload)
+ * - gsp_rpc(rpc): GSP RPC (RPC header + payload)
+ * - gsp_rpc_buf: buffer for (GSP RPC header + payload)
+ * - gsp_rpc_len: size of (GSP RPC header + payload)
+ * - params_size: size of params in the payload
+ * - payload_size: size of (header if exists + params) in the payload
+ */
+
+struct r535_gsp_msg {
+	u8 auth_tag_buffer[16];
+	u8 aad_buffer[16];
+	u32 checksum;
+	u32 sequence;
+	u32 elem_count;
+	u32 pad;
+	u8  data[];
+};
+
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
+#define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
+
+#define to_gsp_hdr(p, header) \
+	container_of((void *)p, typeof(*header), data)
+
+#define to_payload_hdr(p, header) \
+	container_of((void *)p, typeof(*header), params)
+
+int
+r535_rpc_status_to_errno(uint32_t rpc_status)
+{
+	switch (rpc_status) {
+	case 0x55: /* NV_ERR_NOT_READY */
+	case 0x66: /* NV_ERR_TIMEOUT_RETRY */
+		return -EBUSY;
+	case 0x51: /* NV_ERR_NO_MEMORY */
+		return -ENOMEM;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
+{
+	u32 size, rptr = *gsp->msgq.rptr;
+	int used;
+
+	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
+			    GSP_PAGE_SIZE);
+	if (WARN_ON(!size || size >= gsp->msgq.cnt))
+		return -EINVAL;
+
+	do {
+		u32 wptr = *gsp->msgq.wptr;
+
+		used = wptr + gsp->msgq.cnt - rptr;
+		if (used >= gsp->msgq.cnt)
+			used -= gsp->msgq.cnt;
+		if (used >= size)
+			break;
+
+		usleep_range(1, 2);
+	} while (--(*ptime));
+
+	if (WARN_ON(!*ptime))
+		return -ETIMEDOUT;
+
+	return used;
+}
+
+static struct r535_gsp_msg *
+r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
+{
+	u32 rptr = *gsp->msgq.rptr;
+
+	/* Skip the first page, which is the message queue info */
+	return (void *)((u8 *)gsp->shm.msgq.ptr + GSP_PAGE_SIZE +
+	       rptr * GSP_PAGE_SIZE);
+}
+
+/**
+ * DOC: Receive a GSP message queue element
+ *
+ * Receiving a GSP message queue element from the message queue consists of
+ * the following steps:
+ *
+ * - Peek the element from the queue: r535_gsp_msgq_peek().
+ *   Peek the first page of the element to determine the total size of the
+ *   message before allocating the proper memory.
+ *
+ * - Allocate memory for the message.
+ *   Once the total size of the message is determined from the GSP message
+ *   queue element, the caller of r535_gsp_msgq_recv() allocates the
+ *   required memory.
+ *
+ * - Receive the message: r535_gsp_msgq_recv().
+ *   Copy the message into the allocated memory. Advance the read pointer.
+ *   If the message is a large GSP message, r535_gsp_msgq_recv() calls
+ *   r535_gsp_msgq_recv_one_elem() repeatedly to receive continuation parts
+ *   until the complete message is received.
+ *   r535_gsp_msgq_recv() assembles the payloads of cotinuation parts into
+ *   the return of the large GSP message.
+ *
+ * - Free the allocated memory: r535_gsp_msg_done().
+ *   The user is responsible for freeing the memory allocated for the GSP
+ *   message pages after they have been processed.
+ */
+static void *
+r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	struct r535_gsp_msg *mqe;
+	int ret;
+
+	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
+
+	return mqe->data;
+}
+
+struct r535_gsp_msg_info {
+	int *retries;
+	u32 gsp_rpc_len;
+	void *gsp_rpc_buf;
+	bool continuation;
+};
+
+static void
+r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
+
+static void *
+r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
+			    struct r535_gsp_msg_info *info)
+{
+	u8 *buf = info->gsp_rpc_buf;
+	u32 rptr = *gsp->msgq.rptr;
+	struct r535_gsp_msg *mqe;
+	u32 size, expected, len;
+	int ret;
+
+	expected = info->gsp_rpc_len;
+
+	ret = r535_gsp_msgq_wait(gsp, expected, info->retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
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
+	size = ALIGN(expected + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
+
+	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
+	len = min_t(u32, expected, len);
+
+	if (info->continuation)
+		memcpy(buf, mqe->data + sizeof(struct nvfw_gsp_rpc),
+		       len - sizeof(struct nvfw_gsp_rpc));
+	else
+		memcpy(buf, mqe->data, len);
+
+	expected -= len;
+
+	if (expected) {
+		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
+		memcpy(buf + len, mqe, expected);
+	}
+
+	rptr = (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
+
+	mb();
+	(*gsp->msgq.rptr) = rptr;
+	return buf;
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	struct r535_gsp_msg *mqe;
+	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*mqe);
+	struct nvfw_gsp_rpc *rpc;
+	struct r535_gsp_msg_info info = {0};
+	u32 expected = gsp_rpc_len;
+	void *buf;
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
+	rpc = (struct nvfw_gsp_rpc *)mqe->data;
+
+	if (WARN_ON(rpc->length > max_rpc_size))
+		return NULL;
+
+	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	info.gsp_rpc_buf = buf;
+	info.retries = retries;
+	info.gsp_rpc_len = rpc->length;
+
+	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
+	if (IS_ERR(buf)) {
+		kvfree(info.gsp_rpc_buf);
+		info.gsp_rpc_buf = NULL;
+		return buf;
+	}
+
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
+	return buf;
+}
+
+static int
+r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
+{
+	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
+	struct r535_gsp_msg *cqe;
+	u32 gsp_rpc_len = msg->checksum;
+	u64 *ptr = (void *)msg;
+	u64 *end;
+	u64 csum = 0;
+	int free, time = 1000000;
+	u32 wptr, size, step, len;
+	u32 off = 0;
+
+	len = ALIGN(GSP_MSG_HDR_SIZE + gsp_rpc_len, GSP_PAGE_SIZE);
+
+	end = (u64 *)((char *)ptr + len);
+	msg->pad = 0;
+	msg->checksum = 0;
+	msg->sequence = gsp->cmdq.seq++;
+	msg->elem_count = DIV_ROUND_UP(len, 0x1000);
+
+	while (ptr < end)
+		csum ^= *ptr++;
+
+	msg->checksum = upper_32_bits(csum) ^ lower_32_bits(csum);
+
+	wptr = *gsp->cmdq.wptr;
+	do {
+		do {
+			free = *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr - 1;
+			if (free >= gsp->cmdq.cnt)
+				free -= gsp->cmdq.cnt;
+			if (free >= 1)
+				break;
+
+			usleep_range(1, 2);
+		} while(--time);
+
+		if (WARN_ON(!time)) {
+			kvfree(msg);
+			return -ETIMEDOUT;
+		}
+
+		cqe = (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
+		step = min_t(u32, free, (gsp->cmdq.cnt - wptr));
+		size = min_t(u32, len, step * GSP_PAGE_SIZE);
+
+		memcpy(cqe, (u8 *)msg + off, size);
+
+		wptr += DIV_ROUND_UP(size, 0x1000);
+		if (wptr == gsp->cmdq.cnt)
+			wptr = 0;
+
+		off  += size;
+		len -= size;
+	} while (len);
+
+	nvkm_trace(&gsp->subdev, "cmdq: wptr %d\n", wptr);
+	wmb();
+	(*gsp->cmdq.wptr) = wptr;
+	mb();
+
+	nvkm_falcon_wr32(&gsp->falcon, 0xc00, 0x00000000);
+
+	kvfree(msg);
+	return 0;
+}
+
+static void *
+r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
+{
+	struct r535_gsp_msg *msg;
+	u32 size = GSP_MSG_HDR_SIZE + gsp_rpc_len;
+
+	size = ALIGN(size, GSP_MSG_MIN_SIZE);
+	msg = kvzalloc(size, GFP_KERNEL);
+	if (!msg)
+		return ERR_PTR(-ENOMEM);
+
+	msg->checksum = gsp_rpc_len;
+	return msg->data;
+}
+
+static void
+r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
+{
+	kvfree(msg);
+}
+
+static void
+r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
+{
+	if (gsp->subdev.debug >= lvl) {
+		nvkm_printk__(&gsp->subdev, lvl, info,
+			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
+			      msg->function, msg->length, msg->length - sizeof(*msg),
+			      msg->rpc_result, msg->rpc_result_private);
+		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
+			       msg->data, msg->length - sizeof(*msg), true);
+	}
+}
+
+struct nvfw_gsp_rpc *
+r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvfw_gsp_rpc *rpc;
+	int retries = 4000000, i;
+
+retry:
+	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
+
+	rpc = r535_gsp_msgq_recv(gsp, gsp_rpc_len, &retries);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
+
+	if (rpc->rpc_result) {
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+		r535_gsp_msg_done(gsp, rpc);
+		return ERR_PTR(-EINVAL);
+	}
+
+	r535_gsp_msg_dump(gsp, rpc, NV_DBG_TRACE);
+
+	if (fn && rpc->function == fn) {
+		if (gsp_rpc_len) {
+			if (rpc->length < gsp_rpc_len) {
+				nvkm_error(subdev, "rpc len %d < %d\n",
+					   rpc->length, gsp_rpc_len);
+				r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
+				r535_gsp_msg_done(gsp, rpc);
+				return ERR_PTR(-EIO);
+			}
+
+			return rpc;
+		}
+
+		r535_gsp_msg_done(gsp, rpc);
+		return NULL;
+	}
+
+	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
+		struct nvkm_gsp_msgq_ntfy *ntfy = &gsp->msgq.ntfy[i];
+
+		if (ntfy->fn == rpc->function) {
+			if (ntfy->func)
+				ntfy->func(ntfy->priv, ntfy->fn, rpc->data,
+					   rpc->length - sizeof(*rpc));
+			break;
+		}
+	}
+
+	if (i == gsp->msgq.ntfy_nr)
+		r535_gsp_msg_dump(gsp, rpc, NV_DBG_WARN);
+
+	r535_gsp_msg_done(gsp, rpc);
+	if (fn)
+		goto retry;
+
+	if (*gsp->msgq.rptr != *gsp->msgq.wptr)
+		goto retry;
+
+	return NULL;
+}
+
+int
+r535_gsp_msg_ntfy_add(struct nvkm_gsp *gsp, u32 fn, nvkm_gsp_msg_ntfy_func func, void *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&gsp->msgq.mutex);
+	if (WARN_ON(gsp->msgq.ntfy_nr >= ARRAY_SIZE(gsp->msgq.ntfy))) {
+		ret = -ENOSPC;
+	} else {
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].fn = fn;
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].func = func;
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].priv = priv;
+		gsp->msgq.ntfy_nr++;
+	}
+	mutex_unlock(&gsp->msgq.mutex);
+	return ret;
+}
+
+int
+r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
+{
+	void *repv;
+
+	mutex_lock(&gsp->cmdq.mutex);
+	repv = r535_gsp_msg_recv(gsp, fn, 0);
+	mutex_unlock(&gsp->cmdq.mutex);
+	if (IS_ERR(repv))
+		return PTR_ERR(repv);
+
+	return 0;
+}
+
+static void *
+r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
+			  enum nvkm_gsp_rpc_reply_policy policy,
+			  u32 gsp_rpc_len)
+{
+	struct nvfw_gsp_rpc *reply;
+	void *repv = NULL;
+
+	switch (policy) {
+	case NVKM_GSP_RPC_REPLY_NOWAIT:
+		break;
+	case NVKM_GSP_RPC_REPLY_RECV:
+		reply = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
+		if (!IS_ERR_OR_NULL(reply))
+			repv = reply->data;
+		else
+			repv = reply;
+		break;
+	case NVKM_GSP_RPC_REPLY_POLL:
+		repv = r535_gsp_msg_recv(gsp, fn, 0);
+		break;
+	}
+
+	return repv;
+}
+
+static void *
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
+{
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
+	u32 fn = rpc->function;
+	int ret;
+
+	if (gsp->subdev.debug >= NV_DBG_TRACE) {
+		nvkm_trace(&gsp->subdev, "rpc fn:%d len:0x%x/0x%zx\n", rpc->function,
+			   rpc->length, rpc->length - sizeof(*rpc));
+		print_hex_dump(KERN_INFO, "rpc: ", DUMP_PREFIX_OFFSET, 16, 1,
+			       rpc->data, rpc->length - sizeof(*rpc), true);
+	}
+
+	ret = r535_gsp_cmdq_push(gsp, rpc);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return r535_gsp_rpc_handle_reply(gsp, fn, policy, gsp_rpc_len);
+}
+
+static void
+r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
+{
+	struct nvfw_gsp_rpc *rpc = container_of(repv, typeof(*rpc), data);
+
+	r535_gsp_msg_done(gsp, rpc);
+}
+
+static void *
+r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
+{
+	struct nvfw_gsp_rpc *rpc;
+
+	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + payload_size,
+					   sizeof(u64)));
+	if (IS_ERR(rpc))
+		return ERR_CAST(rpc);
+
+	rpc->header_version = 0x03000000;
+	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';
+	rpc->function = fn;
+	rpc->rpc_result = 0xffffffff;
+	rpc->rpc_result_private = 0xffffffff;
+	rpc->length = sizeof(*rpc) + payload_size;
+	return rpc->data;
+}
+
+static void *
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
+{
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
+	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
+	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*msg);
+	const u32 max_payload_size = max_rpc_size - sizeof(*rpc);
+	u32 payload_size = rpc->length - sizeof(*rpc);
+	void *repv;
+
+	mutex_lock(&gsp->cmdq.mutex);
+	if (payload_size > max_payload_size) {
+		const u32 fn = rpc->function;
+		u32 remain_payload_size = payload_size;
+
+		/* Adjust length, and send initial RPC. */
+		rpc->length = sizeof(*rpc) + max_payload_size;
+		msg->checksum = rpc->length;
+
+		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
+		if (IS_ERR(repv))
+			goto done;
+
+		payload += max_payload_size;
+		remain_payload_size -= max_payload_size;
+
+		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
+		while (remain_payload_size) {
+			u32 size = min(remain_payload_size,
+				       max_payload_size);
+			void *next;
+
+			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
+			if (IS_ERR(next)) {
+				repv = next;
+				goto done;
+			}
+
+			memcpy(next, payload, size);
+
+			repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
+			if (IS_ERR(repv))
+				goto done;
+
+			payload += size;
+			remain_payload_size -= size;
+		}
+
+		/* Wait for reply. */
+		repv = r535_gsp_rpc_handle_reply(gsp, fn, policy, payload_size +
+						 sizeof(*rpc));
+	} else {
+		repv = r535_gsp_rpc_send(gsp, payload, policy, gsp_rpc_len);
+	}
+
+done:
+	mutex_unlock(&gsp->cmdq.mutex);
+	return repv;
+}
+
+const struct nvkm_rm_api_rpc
+r535_rpc = {
+	.get = r535_gsp_rpc_get,
+	.push = r535_gsp_rpc_push,
+	.done = r535_gsp_rpc_done,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
new file mode 100644
index 000000000000..7a0ece979167
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include <subdev/gsp.h>
+#ifndef __NVKM_RM_H__
+#define __NVKM_RM_H__
+
+struct nvkm_rm_api {
+	const struct nvkm_rm_api_rpc {
+		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
+		void *(*push)(struct nvkm_gsp *gsp, void *argv,
+			      enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
+		void (*done)(struct nvkm_gsp *gsp, void *repv);
+	} *rpc;
+};
+
+extern const struct nvkm_rm_api r535_rm;
+extern const struct nvkm_rm_api_rpc r535_rpc;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h
new file mode 100644
index 000000000000..4431e33b3304
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_RPC_H__
+#define __NVKM_RM_RPC_H__
+#include "rm.h"
+
+#define to_payload_hdr(p, header) \
+	container_of((void *)p, typeof(*header), params)
+
+int r535_gsp_rpc_poll(struct nvkm_gsp *, u32 fn);
+
+struct nvfw_gsp_rpc *r535_gsp_msg_recv(struct nvkm_gsp *, int fn, u32 gsp_rpc_len);
+int r535_gsp_msg_ntfy_add(struct nvkm_gsp *, u32 fn, nvkm_gsp_msg_ntfy_func, void *priv);
+
+int r535_rpc_status_to_errno(uint32_t rpc_status);
+#endif
-- 
2.49.0

