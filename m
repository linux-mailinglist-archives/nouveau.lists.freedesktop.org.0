Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E3AB2B4D
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3627E10E0AE;
	Sun, 11 May 2025 21:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSeLnmJn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEEA10E098
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVliJZdImlbYz7b0aKv9Zswb1/QrLelrhfZwBAIB0LAIRhOh4BodD6n7tDDUNyaIxkgsGC7dJ36FlxdsmJQMvgH43FEjhZwN6mkUre6K+5Hme1Bj5rNeto/xEexOo9OLfrpFaILXLoho7EBT91PIw6nx7pOeupnKzFohaE/V8z9U19Kp2/xIzNyxOBsIazKA/hAMbX7XnDPTzAjIuYsVYPy3/k7dgbXwmyDknvOCYZLGidjcpN6crfHOTU6amE5n5BI5MNi4+yXhiAucL9UB9moQyowkSTsvLqqP7p0rpS35klV5WSs1Dx34PtMGS6kWaF99bqUoF6aCTX9/4e/YrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eusgyroLcLWpaIN7qUYvFkMPkqMKG3bm7W1+1aonh0=;
 b=TLaHhMgwfsfnE6znM4J6+xP2arM6W/bnWw3RMDUJ/kuAv8L1ZF4OZM0UwJmLG27//tdA5IoLrW8WDioYXs5KLfT3+mVAp3YSXBIuDaaYIsncqaPoQYCBxIG1PYaBFzXTUauBuIzDJdouB4aasS940QUdL604iwUpbuDHmBT7nGM+/kGPAjYaHCZURPf0wL760tNpAuTdK808AChv14ZeVbVH7SkAD06i6XjzEXkHY6ZX39zrcfus6cXpKmeGUEq2AX5ek8nN2lvHgxsRlchLemTQqGgSz5ImwNb2XgCUxxg68Q+PUNzExcrWRMvu2+KQvvNCNf9jCgMIrjWPeUGOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eusgyroLcLWpaIN7qUYvFkMPkqMKG3bm7W1+1aonh0=;
 b=pSeLnmJn3mh9rze+8Vdj1SV6X/OdFvYLT00QuWIY8Uf9eAklaP2FjiuTd0jkDFipVkYLRDNo6nDuz+ECl7fL287aorv043MlY74X2oJmYHxr9qjChUVrk8mgpWsJQ6LzNwA65q9dgHULP4FWxGuK3Iac8Y2wxFEE5ESioV7AjwE5uvKh7RCV0uK5B/NJzrcrxz0CLEF6dwWP9bu+lLjCNVQSm8I0NdbrZm7HVa9js/iG0Hz7Fbd6vTSRvepl6gd5S/9Ajzxa51L0RtskzbC6IkEjNIKWgG1xszNmps7OU7vLMTkUphxe8HZTyzbwLa6fiJJDPoegOH9cdv0ook8HIA==
Received: from DS0PR17CA0003.namprd17.prod.outlook.com (2603:10b6:8:191::17)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:18 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::b3) by DS0PR17CA0003.outlook.office365.com
 (2603:10b6:8:191::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:10 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 06/62] drm/nouveau/gsp: split rm ctrl handling out on its
 own
Date: Mon, 12 May 2025 07:06:26 +1000
Message-ID: <20250511210722.80350-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: e3447c17-3e09-4c97-1d24-08dd90cff410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kxabVhf3BwY1dWWJHsZgEtvGgk22/zFmjRO7sYRmB+YPFY+vfa0xpvETMFYX?=
 =?us-ascii?Q?y8Rlt+VG2Nfodg2TXyqIkGKhO3LvLepgnmOrHzJpntJ5zU0qXsvwRh2e0+/s?=
 =?us-ascii?Q?v+ryyEZc1Lkv8tAjEDMI9+gIr168Ab8HbXrDcSiHGz4J50R5/+7vnWI/yqnX?=
 =?us-ascii?Q?r7u7DoiM36Bbamge8LH18PFizPzjEsLhpslsk5WgpKNgnD2M9M+aXXx/t96d?=
 =?us-ascii?Q?GltVvMbquEPKRavsuMv4j2mSGhLRJvpaWycGP08UFRcSNwxJdooeO3KoYP62?=
 =?us-ascii?Q?hzKSslcRgFXBStr0xO/0aUqrUcmTDrlZB+9FOfRV8GCvHrI1IkWzIqTu6+OI?=
 =?us-ascii?Q?kSUAkcST94Nij6+5QDrheCcfdRDHN3nVWrPQO/0qbByebxllMPz7L3bddtqT?=
 =?us-ascii?Q?j6CiGwBNKoCsvT3uoheZpbijypCAAzEX4TJpkPaKKPD1pDutoAK1p6hL4Btc?=
 =?us-ascii?Q?+rgqtlKcBsI2PO33pimZ7Xia0OSOayJfthCXFMg6H2k9wc8wx1g74fTsZeqa?=
 =?us-ascii?Q?INr7SEjhamASInXBPEcoedjIsuUGqNyvv4n/cjnv0hHwYSwQCcmrCeCB0c+P?=
 =?us-ascii?Q?bed2VC+BpDrMeQnoWCFxpivZcnyOL7k4inHFFwrrzg4Pisqqepr4wQWbYoCb?=
 =?us-ascii?Q?cCeJise1EHf8Rmpq1ZIXUIck8vedxdtzvW+Li1l5IQBUIeqRanwNcoxi2FXG?=
 =?us-ascii?Q?f0DAxhoqRHFUpMAnCVg/I6sdHl8ha+uD7IblFya2bbQhGDvsG/ltTIt+NblI?=
 =?us-ascii?Q?oyCbqO/naC2TXDw8z0f7U8mELSMMyzTZkasfNJqOE35jh4+jVmVjzvTEAVM1?=
 =?us-ascii?Q?D3hy+nIjldHpFhTcK56WeLFH1uvnV0tgnoxrkUESa/2I2JUgKzcWvLf079Fu?=
 =?us-ascii?Q?di1qrWO8oWn17ikqnHs5AOipCrDMwurWf7+cbhYT65yU1SHqNOawa3jAgQJQ?=
 =?us-ascii?Q?u4F9Ss7nxEkrDNh2MzxFJhggqY4LwLYoDg/yaMCSbCFhzBFAjctVZdfsX0qs?=
 =?us-ascii?Q?VUvkj85CejkmHJJhkAhJYBc84y9b2Ii8tP5GheuN/oJahOMWGaYnyyBOEzlH?=
 =?us-ascii?Q?jjHR/FPwu3GwNAB7rS1P9posrBSnQbNAgdkgu4fT+7jgOn7Z7pjL+iocITPn?=
 =?us-ascii?Q?Xf/GZWR/ETUCYQ2taWWLSbLJh4g+Z4QbThM2M6w/PAFqK0pfuQdUdDbYRPxc?=
 =?us-ascii?Q?QvwQB6iSaEXZsBHpUk0mcx3QWPBFckYPu1YKss8s3UVr0Nj2qMAVw00rwz0W?=
 =?us-ascii?Q?SeTlXij2tShyHkhvrWFoNdBvwCaoPneehdJyVU+WWr/O1bjtIdkq9ffoP9Cg?=
 =?us-ascii?Q?HgsLrQT1Hchvt6SJSE4j62KXOfnR7mhfzsAdt231FXXM8+QZmPdfU1vCkjlh?=
 =?us-ascii?Q?JWBWTrvESBGFu/jcQQVC010nFvr5sF6NEG4F2gzBWkmzU3HNQb56PUbZX4K5?=
 =?us-ascii?Q?0eLZZWZ3nwNBSrGqhNQlKkMPuwpbC+EUwCDAzprTaqxfETQg+r2Y7rJKikuq?=
 =?us-ascii?Q?K1897pGM7b+GkgAW2x/ZaOgfGFWX+tnYjTWe?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:18.2349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3447c17-3e09-4c97-1d24-08dd90cff410
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235
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
index 53a4af001039..24d90910cee0 100644
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

