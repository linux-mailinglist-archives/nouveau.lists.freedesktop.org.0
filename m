Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3394AA3C95
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4010E598;
	Tue, 29 Apr 2025 23:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PzGfVTSe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C508010E58D
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aknPtrvT5vUSflPOzjx2G+CZOV6yh08UoodNKEnPiDp6Hyk0QCJ/7/4wer7/CSSM/YKEWe8BIzHWiPtwCkLH8qSt4g/1DsBglRFoG/NSzypda3IlQ+YtPVUL1nBNCT27IoMgE+cETupfG0wzs7BK4SsLntrUlvL1zrR9T+lbDQu3OZG8oIo/uh9QqQLF88en+JXFuB1herkcfDhHBvkFVpqLKK/DWrDwURExIDd6pEBcRQ+nj4X8BLB+BoiKdKmBgWWdICCy2GFArgAtPmqbgA+k/j1FvUjPaK1pidBvHlfY2M14qmoCTYGrhiFNa06JTuhyuGqYz5yVpzIxfXd7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0I+IvMI5pzxmvXsRFXQbeZ+jLDF8pLmeMcnmtug6ec=;
 b=sIp6Q6JWwx4filxqI5lfMrgblSgYNNPQa7bQ0PZx5MGaJSdzDTq05MoNAvoBCVWVGFwZZDDEyk9g8Zv/NuPh6siBKfa/gKyBZVR4UyKM23GNbW4BpMwOKDqr4feX94SH4+vmuWAJeVu+ovhzNChjQ3aKmg0KVPIMQX6jIzk0STg995KHX+SaomFnhRku7uXpm9EyL80rb5s79APyWVh6D4sr3cfNEtF273P+qgYRrtNnrgEz+58H0gmGT93hNYv+mRtFkqTFvMSS7tHP7pBXxpCkQESrz1HE9Xqukt/HqE8RpuJbdYm+ER+Ddqad2hwEUc4+GCNtkjXZNlqAEM5Xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0I+IvMI5pzxmvXsRFXQbeZ+jLDF8pLmeMcnmtug6ec=;
 b=PzGfVTSePuOlKes+zaUSN7waH9MWPTzlhsS1qmMYHkv94Mhf620AX9OXRr15Regh95shyNzJiurOokyMywFNqp52FvFzoLCnzvdSXqb6n1quV/+RnjcZA5MVMf7jvElUBIhxJqCnnq4sCnV8cG7ENLpBi/u91Hh6XfUw1AXBNmOavZa8Y5FBI4Es8X65Rqf8H4PFsfJ3V2RAbHv9mSMOV1BaBV9mWjpDISGGVc1K3CgaYxDPhzEKLdTM0ICg2P6y4uX1cwueu0Fh0aPj1xQzUw5A4qWkbVBhUulCK+XwoCZGKkRs7JUlAn2tnZSOuPvcZ493xc242QC7ditT+uVcag==
Received: from PH7P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::14)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:33 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::a9) by PH7P221CA0044.outlook.office365.com
 (2603:10b6:510:33c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:18 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 32/60] drm/nouveau/gsp: add hal for gr.get_ctxbufs_info()
Date: Wed, 30 Apr 2025 09:39:00 +1000
Message-ID: <20250429233929.24363-33-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: ac93dd8f-0101-42ab-7f28-08dd87773bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IdwJhH42tLz5SiEBEhz2YdWUOm75Y67ey4cuaI2yUxWyfrrW30enpvWG7AXu?=
 =?us-ascii?Q?Qla6bBKh3G7202M3E+grc1bPQuyQ7/FFqGBEDL+oCtKMGU7/wqcVveYoTsRU?=
 =?us-ascii?Q?ULLKp0fiffgZ2SEMUw4trsoVOP1/QgpzUtc6XvVy+6eIAgZS0S1qGhFxRJN7?=
 =?us-ascii?Q?C4SQ8qzUeOhPByC/zX/eDQyLI0cp5fUwrF3dYZU0v1EWV+JkN+CsuuHfbEE+?=
 =?us-ascii?Q?4af2CB24KwI9YWzV1L1aLeGB5aEie1s5gqmNUR0/TnFhCij8yGmk9zX2TMgj?=
 =?us-ascii?Q?K4ImnMwbDElCWusuWwsGfKuNwc2hyeKrlY0lIeU5dsD1oalj00ZTJTvisA2D?=
 =?us-ascii?Q?vEHtPIS2jNfFFuuiev0wWQwYy+VYA3C1rsyhHS3BT2xYBrqdAH1a0vN82gZa?=
 =?us-ascii?Q?A2YEIuliniepcFPBcGY1YigzakRPstdbqZa7GcSBz5b9kCeUBOy9KStJSrk9?=
 =?us-ascii?Q?Yy/BdhxFtHXiZyD8iQShg0iPABHfw078/Qe3mJs45Ue87TOrknKDfMAI+RoP?=
 =?us-ascii?Q?QM6Aj7xGrXw4PKWIEDEy8+zf91jZ5EnCbhvi6a0azWDEYxpxZRFrVLkh37vO?=
 =?us-ascii?Q?8QqM42XhqplM9u1N9/iySXx0cW+t7Af/mbIfirfGqeZbBTWJ+eHS1iGmzq1h?=
 =?us-ascii?Q?hLzs1IUbgEISAzrczdc/HbZosYcjgcx6rZ14eU1r2U/dfMHeItXuSOoFvLg0?=
 =?us-ascii?Q?MEYs0mifVHaTE++eOrx16CgU3k9cZIu3hfJpSyyokxcWKyNq20b13BjldeDU?=
 =?us-ascii?Q?+bniPu+7otBEXHxGnMlDzxWtVf+bYtDUp/gR/dARmWbmD1JgeM3G2Z0827Uv?=
 =?us-ascii?Q?wI6cUwHgU0XOQ96XdvyQzpK6AKjOs6fQXFGDVw3pQEWYkcN5IrYOdfMj56XI?=
 =?us-ascii?Q?P8S2yRJedhb36IHLFUoUjZO9PlmAmjq71Zt3D57BfYjs2d890wWhK4hQ3JrK?=
 =?us-ascii?Q?TMwmY3UApchOcpKzAmIcF0p4+V/KVn1QKFTgA5+NSFfWfqRQKB5QLN1jmume?=
 =?us-ascii?Q?M3tQEaRypx7Ao3tM837lY8Z+b0cdLbEt9l5DQ9G2RSUOlkgVg22wGt3pZ8Ah?=
 =?us-ascii?Q?0dz/cnd+ftCXMP3RFGsr90eqgse1cdNy//numtffk1LUO7ho4VaQ/UqJSB9/?=
 =?us-ascii?Q?NNAYU99yKsAOZNqKV/htrVdoxm5MancCr/ljOkuvaGb8+xmmFtWOTR58doDv?=
 =?us-ascii?Q?18qMumiO3pU4rTlODw505gq/Ru6bE9WUQM4Ba1jWN/NP8jpjq6rVRNpFhFix?=
 =?us-ascii?Q?1uscCd0aueKsZWKrjsG8R6tw2RQK9juRvv7fsFOTXGjB2JsxFuNoys20mn+l?=
 =?us-ascii?Q?o7wY5cCdr/wIdYp0seOMExTypC302Bj3ZdOu+heAhan9jFNLncy0HIoJl99M?=
 =?us-ascii?Q?jNNH5j2LoTb/DsSqtJKAGn7Dputv2KMUIOZY/JVOjl+l8mbD0okYCjamOqVh?=
 =?us-ascii?Q?gzrRLlGdVfNUCAUPR/tPxp9/1QM/Q0Yop73lqlRtzQdrcaN5RPnq+g1X3xlW?=
 =?us-ascii?Q?FlSUcFayRJF5eowmPNlqdMb1lmbQRpDILmu1?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:32.8197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac93dd8f-0101-42ab-7f28-08dd87773bbd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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

NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO has
incompatible changes in 550.40.07.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |   4 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  | 186 ++++++++++--------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   7 +
 4 files changed, 114 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index b763e6a59349..79c19f0682ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -365,7 +365,7 @@ r535_gr_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *c
 }
 
 static const struct nvkm_engn_func
-r535_gr = {
+r535_engn_gr = {
 	.nonstall = r535_engn_nonstall,
 	.ctor2 = r535_gr_ctor,
 };
@@ -583,7 +583,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			engn = nvkm_runl_add(runl, nv2080, &r535_engn_ce, type, inst);
 			break;
 		case NVKM_ENGINE_GR:
-			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
+			engn = nvkm_runl_add(runl, nv2080, &r535_engn_gr, type, inst);
 			break;
 		case NVKM_ENGINE_NVDEC:
 		case NVKM_ENGINE_NVENC:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index e9d3082309ce..48e415c185f0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -170,10 +170,106 @@ r535_gr_units(struct nvkm_gr *gr)
 	return (gsp->gr.tpcs << 8) | gsp->gr.gpcs;
 }
 
+static void
+r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
+			struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO *info)
+{
+	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
+	static const struct {
+		u32     id0; /* NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID */
+		u32     id1; /* NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID */
+		bool global;
+		bool   init;
+		bool     ro;
+	} map[] = {
+#define _A(n,N,G,I,R) { .id0 = NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_##n, \
+		.id1 = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_##N, \
+		.global = (G), .init = (I), .ro = (R) }
+#define _B(N,G,I,R) _A(GRAPHICS_##N, N, (G), (I), (R))
+		/*                                       global   init     ro */
+		_A(           GRAPHICS,             MAIN, false,  true, false),
+		_B(                                PATCH, false,  true, false),
+		_A( GRAPHICS_BUNDLE_CB, BUFFER_BUNDLE_CB,  true, false, false),
+		_B(                             PAGEPOOL,  true, false, false),
+		_B(                         ATTRIBUTE_CB,  true, false, false),
+		_B(                        RTV_CB_GLOBAL,  true, false, false),
+		_B(                           FECS_EVENT,  true,  true, false),
+		_B(                      PRIV_ACCESS_MAP,  true,  true,  true),
+#undef _B
+#undef _A
+	};
+	u32 size = info->size;
+	u8 align, page;
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(map); id++) {
+		if (map[id].id0 == i)
+			break;
+	}
+
+	nvkm_debug(subdev, "%02x: size:0x%08x %s\n", i,
+		   size, (id < ARRAY_SIZE(map)) ? "*" : "");
+	if (id >= ARRAY_SIZE(map))
+		return;
+
+	if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN)
+		size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
+
+	if      (size >= 1 << 21) page = 21;
+	else if (size >= 1 << 16) page = 16;
+	else			  page = 12;
+
+	if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB)
+		align = order_base_2(size);
+	else
+		align = page;
+
+	if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
+		return;
+
+	gr->ctxbuf[gr->ctxbuf_nr].bufferId = map[id].id1;
+	gr->ctxbuf[gr->ctxbuf_nr].size     = size;
+	gr->ctxbuf[gr->ctxbuf_nr].page     = page;
+	gr->ctxbuf[gr->ctxbuf_nr].align    = align;
+	gr->ctxbuf[gr->ctxbuf_nr].global   = map[id].global;
+	gr->ctxbuf[gr->ctxbuf_nr].init     = map[id].init;
+	gr->ctxbuf[gr->ctxbuf_nr].ro       = map[id].ro;
+	gr->ctxbuf_nr++;
+
+	if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP) {
+		if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
+			return;
+
+		gr->ctxbuf[gr->ctxbuf_nr] = gr->ctxbuf[gr->ctxbuf_nr - 1];
+		gr->ctxbuf[gr->ctxbuf_nr].bufferId =
+			NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
+		gr->ctxbuf_nr++;
+	}
+}
+
+static int
+r535_gr_get_ctxbufs_info(struct r535_gr *gr)
+{
+	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
+	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
+	struct nvkm_gsp *gsp = subdev->device->gsp;
+
+	info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
+				   sizeof(*info));
+	if (WARN_ON(IS_ERR(info)))
+		return PTR_ERR(info);
+
+	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++)
+		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+	return 0;
+}
+
 int
 r535_gr_oneinit(struct nvkm_gr *base)
 {
-	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
 	struct r535_gr *gr = container_of(base, typeof(*gr), base);
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_device *device = subdev->device;
@@ -267,88 +363,9 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	 *
 	 * Also build the information that'll be used to create channel contexts.
 	 */
-	info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
-				   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
-				   sizeof(*info));
-	if (WARN_ON(IS_ERR(info))) {
-		ret = PTR_ERR(info);
+	ret = gsp->rm->api->gr->get_ctxbufs_info(gr);
+	if (ret)
 		goto done;
-	}
-
-	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
-		static const struct {
-			u32     id0; /* NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID */
-			u32     id1; /* NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID */
-			bool global;
-			bool   init;
-			bool     ro;
-		} map[] = {
-#define _A(n,N,G,I,R) { .id0 = NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_##n, \
-			.id1 = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_##N, \
-			.global = (G), .init = (I), .ro = (R) }
-#define _B(N,G,I,R) _A(GRAPHICS_##N, N, (G), (I), (R))
-			/*                                       global   init     ro */
-			_A(           GRAPHICS,             MAIN, false,  true, false),
-			_B(                                PATCH, false,  true, false),
-			_A( GRAPHICS_BUNDLE_CB, BUFFER_BUNDLE_CB,  true, false, false),
-			_B(                             PAGEPOOL,  true, false, false),
-			_B(                         ATTRIBUTE_CB,  true, false, false),
-			_B(                        RTV_CB_GLOBAL,  true, false, false),
-			_B(                           FECS_EVENT,  true,  true, false),
-			_B(                      PRIV_ACCESS_MAP,  true,  true,  true),
-#undef _B
-#undef _A
-		};
-		u32 size = info->engineContextBuffersInfo[0].engine[i].size;
-		u8 align, page;
-		int id;
-
-		for (id = 0; id < ARRAY_SIZE(map); id++) {
-			if (map[id].id0 == i)
-				break;
-		}
-
-		nvkm_debug(subdev, "%02x: size:0x%08x %s\n", i,
-			   size, (id < ARRAY_SIZE(map)) ? "*" : "");
-		if (id >= ARRAY_SIZE(map))
-			continue;
-
-		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN)
-			size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
-
-		if      (size >= 1 << 21) page = 21;
-		else if (size >= 1 << 16) page = 16;
-		else			  page = 12;
-
-		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB)
-			align = order_base_2(size);
-		else
-			align = page;
-
-		if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
-			continue;
-
-		gr->ctxbuf[gr->ctxbuf_nr].bufferId = map[id].id1;
-		gr->ctxbuf[gr->ctxbuf_nr].size     = size;
-		gr->ctxbuf[gr->ctxbuf_nr].page     = page;
-		gr->ctxbuf[gr->ctxbuf_nr].align    = align;
-		gr->ctxbuf[gr->ctxbuf_nr].global   = map[id].global;
-		gr->ctxbuf[gr->ctxbuf_nr].init     = map[id].init;
-		gr->ctxbuf[gr->ctxbuf_nr].ro       = map[id].ro;
-		gr->ctxbuf_nr++;
-
-		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP) {
-			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
-				continue;
-
-			gr->ctxbuf[gr->ctxbuf_nr] = gr->ctxbuf[gr->ctxbuf_nr - 1];
-			gr->ctxbuf[gr->ctxbuf_nr].bufferId =
-				NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
-			gr->ctxbuf_nr++;
-		}
-	}
-
-	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
 
 	/* Promote golden context to RM. */
 	ret = r535_gr_promote_ctx(gr, true, golden.vmm, gr->ctxbuf_mem, golden.vma, &golden.chan);
@@ -401,3 +418,8 @@ r535_gr_dtor(struct nvkm_gr *base)
 	kfree(gr->base.func);
 	return gr;
 }
+
+const struct nvkm_rm_api_gr
+r535_gr = {
+	.get_ctxbufs_info = r535_gr_get_ctxbufs_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 588a1c344826..2f24e1a62f54 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -48,6 +48,7 @@ r535_api = {
 	.disp = &r535_disp,
 	.fifo = &r535_fifo,
 	.ce = &r535_ce,
+	.gr = &r535_gr,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
 	.nvjpg = &r535_nvjpg,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index f8ae1853f95a..85c100ab9cb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,7 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 struct nvkm_outp;
+struct r535_gr;
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_wpr *wpr;
@@ -95,6 +96,11 @@ struct nvkm_rm_api {
 		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 			     struct nvkm_gsp_object *);
 	} *ce, *nvdec, *nvenc, *nvjpg, *ofa;
+
+	const struct nvkm_rm_api_gr {
+		int (*get_ctxbufs_info)(struct r535_gr *);
+	} *gr;
+
 };
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
@@ -108,6 +114,7 @@ extern const struct nvkm_rm_api_device r535_device;
 extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
+extern const struct nvkm_rm_api_gr r535_gr;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
 u64 r535_gr_units(struct nvkm_gr *);
-- 
2.49.0

