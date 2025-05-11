Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7895AB2B59
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9D10E18D;
	Sun, 11 May 2025 21:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TDjA2upX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9702B10E17C
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQCLovKEYbAuRzOhmTN59OFB0lyIVGgfIXBaaGPjA2tACc0h9L1+ZPPeHoTImClFX57/PStZV4f2iNgR+wBXgUbfavDoo1huDsk9VuzAIKK4YVTP1pW5EsbskJs1Ux1LLkCPoFB4PLZRfV2CiHzg9TUUSvXRMgpbBxA655ep7R13G+e2NxxnieZphZoR8VEYip/2idbkH47HXBtsfx504A6kY7LHAqvM37wLayx7hCR1N3FIq7mZ2Y/XrEoom6sbdPr1cp5VsooL3P6mmZsD6o38ghF+2ZoSaQBWmQoQXEjoEiiPHCnslvWYdVk5ZczYC5NWnAd2AHuLWz+Eno2pmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPMCoCcUjVKwZl88bMJ8xZChTRHFfNb+D50ErcEurSw=;
 b=Rn76ugaiLHE7BNntQ76/a7vZvs6LROsgUiHlPeHBkaO5PBcPE2BoNNMV5CpfHYkVift1mB5KahtNvzI6Ss+0C10/8f2z7eS+v+tm8VPTA1u6RrxFUZbH/REC5rnUv/QCYvTsoYRA9OpuoHRv+gbskJIbQx/LHnxOUPSHITAMdANRFM69e/13hLRC2C9oPytoCOQC63K2MV0ISjy3Cx6xd3mjYDEmWsHePDiBal7PnbA0VZTt0PyJyzzClNB9JTr3Bj7HGIQsgbHui11QQWAvfYIiXtGNcZjakaWBAhiLMSzPPnlc7E1nSh+ZzuQPvcHlVpOh9pX3mSzfX4o45vn07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPMCoCcUjVKwZl88bMJ8xZChTRHFfNb+D50ErcEurSw=;
 b=TDjA2upXfvQMi9ilCWsH+ngCktBbwbkt6OAWbAJTJi7Vyfbnt8/3J8UFsZbnWXMj5aZ8Is+VpENA6YI1ZsWa6cax5yXjtzjTINAFz3JzQImT9plPzRVyGBNCkVPVhTyAcHB6T/63GbGPiPjg76yCo/xn2qBprJiEE/d9M8H8iVr3AN3nTgpvquOjz793264HkEKv+ksZ0V/tW8f5oCrHt/6iowO7LinwdZt2nMnp1N3hdiRWOTDecZqG0kPG6dp3JTVeHMHUxf3agUrdQFwnGv3cFVyPtZgIlNPtBOlvtdHeI1jyknGXvaJh01NsP5CMauycfGdA5EFujadwu0QB5Q==
Received: from CH2PR02CA0017.namprd02.prod.outlook.com (2603:10b6:610:4e::27)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:44 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::34) by CH2PR02CA0017.outlook.office365.com
 (2603:10b6:610:4e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:38 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 21/62] drm/nouveau/gsp: use internal.{client, device,
 subdevice} where possible
Date: Mon, 12 May 2025 07:06:41 +1000
Message-ID: <20250511210722.80350-22-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ec3eaa-876a-4a11-e7a3-08dd90d00389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pexW8djV9fbhIgOtBcCx1lieAjauvIJAVBmwLy6bDfUEZfJhGrSDyTRMK/89?=
 =?us-ascii?Q?tZ5LI0w5HJ/Ts96FWW6PKGR1+QOWRtMuRNG4ofP2r5x5OWHEqnnnHpHhd8hu?=
 =?us-ascii?Q?+SwrlVXQvfueJi2A7Cag+4GQA7Ak5xmBkXA43ftWwwgpK+bLdUJsXec+sqkx?=
 =?us-ascii?Q?QbBMywObZFwQq/PKMjikMxnnVsW2RhLqFeixprw1vZx5kVVB0gFYUV6DEV3B?=
 =?us-ascii?Q?DAHIXVF4/BbMEtkoCl4Rspq/3CK2VUDhLqKfUjqJ4JVRTefV4QgtZo1krG0M?=
 =?us-ascii?Q?fgs11fgaeTaJhpCwRp44oV5inGtmtng807lSvl5HqO0addjVcKXeUm/0FqOC?=
 =?us-ascii?Q?Q/A4k3dMuIGJLhYZ8/RUOsDI4k06BNu0aDpbzuIr0cRC3M4LuyLgrjGwUSW/?=
 =?us-ascii?Q?TGRaDUaaeoAg5asdNK1DGJBqjcmzgxsXl89FjGpzI0EBy733xulIGUVISisY?=
 =?us-ascii?Q?mBwpAQ71CpzGKzvqcRnMURs/W9SYBZ2Me+P8snU1WXha1SwGeGSDQJQevF8y?=
 =?us-ascii?Q?+S/VSxyv8RVkE7mMG0Mj+OoF50LVJwHOarGb3gX6vmxBB7V16V+/uODdHKov?=
 =?us-ascii?Q?Mae0rOxeN6vKmNyoO4T621KY0o2WWJIJ9orgwruhwbCaCAJsNQAHxoRhE1ah?=
 =?us-ascii?Q?eLBbsZRHAR7YciCea3F1wsYDnYUq2Hk1b/k46yqDI5eiooSoNXumWQXjykae?=
 =?us-ascii?Q?Sg7Qxq8m44FD3QCOiuXZcezjGXPwVeNo0I3hiKaVzPqA4N6eIfrKQf150Koa?=
 =?us-ascii?Q?2l55GyNiqOfiC8/DsOm3wITn+BtN/5O6JG3MF/MlwL3Gvv+Lqn3dT36qkPQS?=
 =?us-ascii?Q?v9Xr30oZPyuMQw7v1oZkceDChGIlLSRvTCxUyvGi7LlCb6oosMcJrS9dGDJs?=
 =?us-ascii?Q?JqbvBnrhJf6jCOEf55Fd8GSMRgcKBjiZ56zOke3VnFOwmdkeIP2tl4qsCMlK?=
 =?us-ascii?Q?YfOLNu38w/664xoTACR6rybhY75xsTXLUtptiPowxAyBngI9sSvDAMDxEMH+?=
 =?us-ascii?Q?ANTzDOjW621mLl3OMcqiV6TKSh/5xfiQ25XMe0PDDBWG/lZpkkB7pwyradhd?=
 =?us-ascii?Q?h3OB5otsxGByJMtTVIw6ufKv3ukfnaXmbHQEqu1JwobdopWpodVXnAxf0yW9?=
 =?us-ascii?Q?y4AHstg+DGg9/KvlOYJhK0yeP6Qnv0XV9jt0JyKIjK6ylx47Mb+N4rlm49yd?=
 =?us-ascii?Q?1GdBUO4JIZaH7/fIFxm+ogQdAPQHi54T5hJwFVcJl/o555a1zLW2k3tYdLWT?=
 =?us-ascii?Q?d9nsWPjy/UbSKN9fVd1Lm8ZFhSUVmZEzhTyJLWlcLTwtIypy2AGVvFmWxlRD?=
 =?us-ascii?Q?VpZit8VAvKH8f6b525Y7CHL4nyDUkWpvXeC+LR1WjIfzfMpGlU543G7u7vIX?=
 =?us-ascii?Q?toBAeac5loYvc3MvMTBwXVuXt03NyjjwI+WV92nvFSpgS8ZtbwOwWtvdLkd/?=
 =?us-ascii?Q?ZbaPHg376hJExNiJslgee0TY0YXd2kUcYN+y6GXC1o75KhabW45MTz9WK8G2?=
 =?us-ascii?Q?cfyz5VH6KTfJzlc9FEdXW2/VibPISp6v8eUH?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:44.2016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ec3eaa-876a-4a11-e7a3-08dd90d00389
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

As nouveau never directly exposes RMAPI to userspace, there's no real
reason why we need to be creating client/device/subdevice objects for
every client.  Instead, use the object handles provided by GSP during
initialisation.

This prevents 4x RPCs to GSP every time the nouveau FD is opened.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/include/nvkm/engine/disp.h    |  3 --
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  6 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  4 +--
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h  |  2 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 19 ++++-------
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  8 ++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  8 ++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  7 +++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 32 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  7 ++--
 12 files changed, 58 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index 7903d7470d19..48dc7ec42164 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -12,9 +12,6 @@ struct nvkm_disp {
 	struct nvkm_engine engine;
 
 	struct {
-		struct nvkm_gsp_client client;
-		struct nvkm_gsp_device device;
-
 		struct nvkm_gsp_object objcom;
 		struct nvkm_gsp_object object;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 935b1cacd528..5320e15f4fc8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -68,8 +68,6 @@ struct nvkm_vmm {
 	struct {
 		u64 bar2_pdb;
 
-		struct nvkm_gsp_client client;
-		struct nvkm_gsp_device device;
 		struct nvkm_gsp_object object;
 
 		struct nvkm_vma *rsvd;
@@ -148,6 +146,10 @@ struct nvkm_mmu {
 	struct mutex mutex; /* serialises mmu invalidations */
 
 	struct nvkm_device_oclass user;
+
+	struct {
+		struct ida vmm_ids;
+	} rm;
 };
 
 int nv04_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 28adc5a30f2f..02de74b406a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -386,7 +386,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 	outp->disp = disp;
 	outp->index = index;
 	outp->info = *dcbE;
-	if (!disp->rm.client.gsp)
+	if (!disp->rm.objcom.client)
 		outp->i2c = nvkm_i2c_bus_find(i2c, dcbE->i2c_index);
 
 	OUTP_DBG(outp, "type %02x loc %d or %d link %d con %x "
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..f9398c5576ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -102,7 +102,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	u64 bits = 0;
 
 	if (!uevent) {
-		if (!disp->rm.client.gsp && conn->info.hpd == DCB_GPIO_UNUSED)
+		if (!disp->rm.objcom.client && conn->info.hpd == DCB_GPIO_UNUSED)
 			return -ENOSYS;
 		return 0;
 	}
@@ -118,7 +118,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	if (&outp->head == &conn->disp->outps)
 		return -EINVAL;
 
-	if (disp->rm.client.gsp) {
+	if (disp->rm.objcom.client) {
 		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_DPYID_PLUG;
 		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_DPYID_UNPLUG;
 		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_DPYID_IRQ;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
index 66604474e339..0308fb7b9647 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -11,7 +11,7 @@
 #define NVKM_RM_DEVICE              0xde1d0000
 #define NVKM_RM_SUBDEVICE           0x5d1d0000
 #define NVKM_RM_DISP                0x00730000
-#define NVKM_RM_VASPACE             0x90f10000
+#define NVKM_RM_VASPACE(id)        (0x90f10000 | (id))
 #define NVKM_RM_CHAN(chid)         (0xf1f00000 | (chid))
 #define NVKM_RM_THREED              0x97000000
 #define NVKM_RM_ENGOBJ(class,chid) (((class) << 16) | (chid))
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 1ba86e223978..ee4893e3c9b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -150,7 +150,7 @@ r535_dmac_bind(struct nvkm_disp_chan *chan, struct nvkm_object *object, u32 hand
 {
 	return nvkm_ramht_insert(chan->disp->ramht, object, chan->chid.user, -9, handle,
 				 chan->chid.user << 25 |
-				 (chan->disp->rm.client.object.handle & 0x3fff));
+				 (chan->rm.object.client->object.handle & 0x3fff));
 }
 
 static void
@@ -1414,17 +1414,16 @@ r535_disp_fini(struct nvkm_disp *disp, bool suspend)
 		nvkm_event_fini(&disp->rm.event);
 
 		nvkm_gsp_rm_free(&disp->rm.objcom);
-		nvkm_gsp_device_dtor(&disp->rm.device);
-		nvkm_gsp_client_dtor(&disp->rm.client);
 	}
 }
 
 static int
 r535_disp_init(struct nvkm_disp *disp)
 {
+	struct nvkm_gsp *gsp = disp->engine.subdev.device->gsp;
 	int ret;
 
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, disp->func->root.oclass << 16,
+	ret = nvkm_gsp_rm_alloc(&gsp->internal.device.object, disp->func->root.oclass << 16,
 				disp->func->root.oclass, 0, &disp->rm.object);
 	if (ret)
 		return ret;
@@ -1464,11 +1463,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 		return ret;
 
 	/* OBJs. */
-	ret = nvkm_gsp_client_device_ctor(gsp, &disp->rm.client, &disp->rm.device);
-	if (ret)
-		return ret;
-
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, NVKM_RM_DISP, NV04_DISPLAY_COMMON, 0,
+	ret = nvkm_gsp_rm_alloc(&gsp->internal.device.object, NVKM_RM_DISP, NV04_DISPLAY_COMMON, 0,
 				&disp->rm.objcom);
 	if (ret)
 		return ret;
@@ -1491,7 +1486,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	{
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 		NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS *ctrl;
-		struct nvkm_gsp_object *subdevice = &disp->rm.client.gsp->internal.device.subdevice;
+		struct nvkm_gsp_object *subdevice = &gsp->internal.device.subdevice;
 
 		ctrl = nvkm_gsp_rm_ctrl_get(subdevice,
 					    NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD,
@@ -1639,12 +1634,12 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0000, NV2080_NOTIFIERS_HOTPLUG,
+	ret = nvkm_gsp_device_event_ctor(&gsp->internal.device, 0x007e0000, NV2080_NOTIFIERS_HOTPLUG,
 					 r535_disp_hpd, &disp->rm.hpd);
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0001, NV2080_NOTIFIERS_DP_IRQ,
+	ret = nvkm_gsp_device_event_ctor(&gsp->internal.device, 0x007e0001, NV2080_NOTIFIERS_DP_IRQ,
 					 r535_disp_irq, &disp->rm.irq);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 4353cd70811a..663e58b914cd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -101,7 +101,7 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	if (!chan->rm.mthdbuf.ptr)
 		return -ENOMEM;
 
-	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, NVKM_RM_CHAN(chan->id),
+	args = nvkm_gsp_rm_alloc_get(&device->gsp->internal.device.object, NVKM_RM_CHAN(chan->id),
 				     fifo->func->chan.user.oclass, sizeof(*args),
 				     &chan->rm.object);
 	if (WARN_ON(IS_ERR(args)))
@@ -373,10 +373,10 @@ r535_gr = {
 static int
 r535_flcn_bind(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *chan)
 {
-	struct nvkm_gsp_client *client = &chan->vmm->rm.client;
+	struct nvkm_gsp_client *client = chan->rm.object.client;
 	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&chan->vmm->rm.device.subdevice,
+	ctrl = nvkm_gsp_rm_ctrl_get(&client->gsp->internal.device.subdevice,
 				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
@@ -389,7 +389,7 @@ r535_flcn_bind(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan
 	ctrl->engineType = engn->id;
 	ctrl->ChID = chan->id;
 
-	return nvkm_gsp_rm_ctrl_wr(&chan->vmm->rm.device.subdevice, ctrl);
+	return nvkm_gsp_rm_ctrl_wr(&client->gsp->internal.device.subdevice, ctrl);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 4c0df52e8683..d882a400aa88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -64,13 +64,13 @@ r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 	struct nvkm_device *device = subdev->device;
 	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.subdevice,
+	ctrl = nvkm_gsp_rm_ctrl_get(&device->gsp->internal.device.subdevice,
 				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
 	if (WARN_ON(IS_ERR(ctrl)))
 		return PTR_ERR(ctrl);
 
 	ctrl->engineType = 1;
-	ctrl->hChanClient = vmm->rm.client.object.handle;
+	ctrl->hChanClient = chan->client->object.handle;
 	ctrl->hObject = chan->handle;
 
 	for (int i = 0; i < gr->ctxbuf_nr; i++) {
@@ -135,7 +135,7 @@ r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 		ctrl->entryCount++;
 	}
 
-	return nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.subdevice, ctrl);
+	return nvkm_gsp_rm_ctrl_wr(&device->gsp->internal.device.subdevice, ctrl);
 }
 
 int
@@ -205,7 +205,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	{
 		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
 
-		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, NVKM_RM_CHAN(0),
+		args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, NVKM_RM_CHAN(0),
 					     device->fifo->func->chan.user.oclass,
 					     sizeof(*args), &golden.chan);
 		if (IS_ERR(args)) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 5e6cf57a6f70..195dd35393d9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -179,6 +179,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	gsp->internal.client.object.parent = NULL;
 	gsp->internal.client.object.handle = rpc->hInternalClient;
 	gsp->internal.client.gsp = gsp;
+	INIT_LIST_HEAD(&gsp->internal.client.events);
 
 	gsp->internal.device.object.client = &gsp->internal.client;
 	gsp->internal.device.object.parent = &gsp->internal.client.object;
@@ -967,7 +968,11 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
 		   msg->status, msg->eventDataSize, msg->bNotifyList);
 
 	mutex_lock(&gsp->client_id.mutex);
-	client = idr_find(&gsp->client_id.idr, msg->hClient & 0xffff);
+	if (msg->hClient == gsp->internal.client.object.handle)
+		client = &gsp->internal.client;
+	else
+		client = idr_find(&gsp->client_id.idr, msg->hClient & 0xffff);
+
 	if (client) {
 		struct nvkm_gsp_event *event;
 		bool handled = false;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 99af6c19a9a9..d1c5b00df459 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -24,18 +24,15 @@
 #include "nvrm/vmm.h"
 
 static int
-r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
+r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
 {
+	struct nvkm_mmu *mmu = vmm->mmu;
+	struct nvkm_gsp *gsp = mmu->subdev.device->gsp;
 	NV_VASPACE_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = nvkm_gsp_client_device_ctor(vmm->mmu->subdev.device->gsp,
-					  &vmm->rm.client, &vmm->rm.device);
-	if (ret)
-		return ret;
-
-	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, NVKM_RM_VASPACE, FERMI_VASPACE_A,
-				     sizeof(*args), &vmm->rm.object);
+	args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, handle,
+				     FERMI_VASPACE_A, sizeof(*args), &vmm->rm.object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
 
@@ -86,6 +83,25 @@ r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 	return ret;
 }
 
+static int
+r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
+{
+	struct nvkm_mmu *mmu = vmm->mmu;
+	int id, ret;
+
+	id = ida_alloc_range(&mmu->rm.vmm_ids, 0, 0xffff + 1, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = r535_mmu_vaspace_new(vmm, NVKM_RM_VASPACE(id));
+	if (ret) {
+		ida_free(&mmu->rm.vmm_ids, id);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void
 r535_mmu_dtor(struct nvkm_mmu *mmu)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index b67ace7ae93c..eb31c54b53ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -428,6 +428,7 @@ nvkm_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
 	mutex_init(&mmu->mutex);
 	mmu->user.ctor = nvkm_ummu_new;
 	mmu->user.base = func->mmu.user;
+	ida_init(&mmu->rm.vmm_ids);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..0768e5c1fad4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1027,13 +1027,14 @@ nvkm_vmm_dump(struct nvkm_vmm *vmm)
 static void
 nvkm_vmm_dtor(struct nvkm_vmm *vmm)
 {
+	struct nvkm_mmu *mmu = vmm->mmu;
 	struct nvkm_vma *vma;
 	struct rb_node *node;
 
-	if (vmm->rm.client.gsp) {
+	if (vmm->rm.object.client) {
+		unsigned int id = vmm->rm.object.handle & 0xffff;
 		nvkm_gsp_rm_free(&vmm->rm.object);
-		nvkm_gsp_device_dtor(&vmm->rm.device);
-		nvkm_gsp_client_dtor(&vmm->rm.client);
+		ida_free(&mmu->rm.vmm_ids, id);
 		nvkm_vmm_put(vmm, &vmm->rm.rsvd);
 	}
 
-- 
2.49.0

