Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAECABA71A
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03C10EBCF;
	Sat, 17 May 2025 00:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AzymnuUJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0306C10EBCE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsvPfbcwvy/9l6CaAb56BH3+HyUxB+iIm32gauYfmX1Jt73tQGsJZQRceR6lTudyLHgfajGgZM4SzTdHHuecsTM5E/L8ZZWeCrkShuFrYtL7TXnuAV5yI9P6XWjcv9KFCOt/QdHt9jala9XkXwg2jxbHL4JfBhDEPNTRxg4Wnigm5KtE8fqjawcbH4huLSQYWtTKRhrgjeI6NIX+sUAKk8dmJektmIPgdrh073i2mpTTVq8ANzzl29aw6Ah7Zm305JMr7baUqafb8a+IPfZwtX2eRmyqf0bbONyDyPyxefwlHc+Slesptrbo7ABO2k34Jfxv8ZkxS9j06hd/XM0HBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1tnRmkvx6B8m9LVU4yBiB0PhA8sKROzT2/7R+HfjKk=;
 b=S/DCX2Vt7Y1gSwARZGGKcmeLyidDMs71RVyUAaER5qacBJqZVIzUu6sAUQy/cXwLpqOJn1vya4sosihssOg3axXv2JTkKYc6Nh8UGCl32XtnrNqNMRmkWWKLiviKnft2lYVJhjlIrDSqrLGPGxvpCsCLm4+DSOyjeoqrFNBzHcTRVCNZ3WdMShIKtxJApcGEjwjtgfbVLnzYnk++v7p4wd4NeP7DPtAHYz0TSLArg12ecryyXjyfgVyr5OxQh0bnmnCxR0AD6H2gq/nrO286ITFg7DJ7XYhAXOxu1MbMUKvwU1zIWWH2PFdJY0Wml9SosJOCBFJ66VwVneJWf4ub4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1tnRmkvx6B8m9LVU4yBiB0PhA8sKROzT2/7R+HfjKk=;
 b=AzymnuUJ6d91ZZC48yj7ATBDBrMwVmVZ7VcRckx3TiSjHYIzGPOS7zAGLfHsTAgiH5zxPPfEU/xwrRT9qiGoWDRzEXRb1o/so4TQKNRoFqFJHlRgW7S6RVtKw6FlyV+kgE/HFizhlZBB/IDubTUBdSTKg91kgmoV9MArn6md1S9uvwt12yT6YnkA9xGMAj3u7XHDVdmlLlfeX+0ELs9Gq+zMjd8miFcDR/NLRykRCmBLTHyaJvEqCOqQf4tBE4Yjq1WEWISmeeLpXhslvLjocTRy6K1hxido6IAt6TpLBWSzU2BKUwqXQry/xDEKApAyqgBF+ZkmkuHxiI2WajAnPg==
Received: from PH7PR10CA0020.namprd10.prod.outlook.com (2603:10b6:510:23d::18)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:11 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::df) by PH7PR10CA0020.outlook.office365.com
 (2603:10b6:510:23d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.21 via Frontend Transport; Sat,
 17 May 2025 00:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:56 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 32/62] drm/nouveau/gsp: add hal for gr.get_ctxbufs_info()
Date: Sat, 17 May 2025 10:09:24 +1000
Message-ID: <20250517000954.35691-33-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5690f7-fa15-4e9d-df85-08dd94d7540e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U6b7ivPVtxIGszavYSWucEutlj534OWKhvrBm/PllZlIzupsj9qvxzmn+ySB?=
 =?us-ascii?Q?rsp9fk8PQMLi4iulbJ5aovTAjRAvAeqX0jAFJKmxwmQBX8R5S7dCCEjPBlFW?=
 =?us-ascii?Q?awSdre4jh8QxPG7GKAakvP4WqYRKH7iM3xtHehphbSTUgLe4OGV/9YJTcZcJ?=
 =?us-ascii?Q?NTXfSUrGq4O+j3I3TtlOFdph+Mw1IQM26Ioct1XpzQoSUDnyIV31m8IxikkF?=
 =?us-ascii?Q?j32pbdnmNfl1VBYNbGtD+va1w6OrWqDwMlC32erkosUqvxdMMj2ki8jNByuA?=
 =?us-ascii?Q?VjYux6eOoR+NKz/uNshbf0eQOyeRyYZV8rrADWX7i5kzO48PHigQEeLMo8Xj?=
 =?us-ascii?Q?180i8HGrW4yFtfRt2eRsKT3ok5BlhwMh0Fdhcow/8UtEyJH4Vv1sN0eFPkwk?=
 =?us-ascii?Q?sd34oamXf4SL1Ux7ofKatPrpLUA6xoXfnmruk6x7pCNqX6JlWe3eglt4gsBb?=
 =?us-ascii?Q?rCV6+H9J5blvu/AZzWmiscouZ5k1txH561Tmwuo+Xhrk8gn+J7+wHk11rI+/?=
 =?us-ascii?Q?k6DyiuTplUTT/itkWDddubGO6Gw3fWbfZEr4Ey5GVR/lgmhoFmBRTd5r09cp?=
 =?us-ascii?Q?qYiTNzPfMzbtxR/rtrp4cm8K7mrF5AR9O1ItBNZFrPoMrlIfKUitQQOnVhFv?=
 =?us-ascii?Q?vvm496FOe05eRMlfiAwX2J9c1VvCXTD6oNJtqavHnwbuKh+Vvm1bD72o2xT4?=
 =?us-ascii?Q?KvGh0G/DRnZpPu7ZbUovC11EIGaOG1bEY9sXYtLjANvRZFsZbKKwm42e+JP+?=
 =?us-ascii?Q?CWiI9IwdPfiNTkvmdIrR0J8P/UlObRA93ogH6+Aj81Uq7CYgzpH50BP5dZFe?=
 =?us-ascii?Q?0921+KUbjOeTDiQL4pMCCXeoalwWUi8CchGtiL4jNRFDso29m3KDUOvhceqP?=
 =?us-ascii?Q?5ZzwF8vIZaj3btgr6N0GZPBfjo+o1F2eC7C9aOBTT8gqs7T2jXcNPrPmfsvO?=
 =?us-ascii?Q?EnwHmPdpsJtJpagI+fpmnU1d5d3Wailj8pc0v7fLjQeJ1MeIN2+G3yak/zbv?=
 =?us-ascii?Q?uB4KmHIra4r6HJ/SX3Ej5Z4HXDQRJv9o2agp41NJ5Nu9xvyh3hHzZi8ij8TH?=
 =?us-ascii?Q?NHPGuSC0Hq+Lw/93c80q2evpUrNo82yNlDm53GCMyXNgziItYZBs1VLYvwko?=
 =?us-ascii?Q?tucy0ijwf+09j+RNeSu4i7mA3XBeE1oB6FrnHHFBrXMU8JLpqb4yeQcNqQvh?=
 =?us-ascii?Q?AOephk84hlHyTH7YZcbCvrQ1jUs+dTTJYvrkrmTjLI7NXOI3z+Q7/cffZQVY?=
 =?us-ascii?Q?UQ2jP2LFj1UcgN6YDuRzVx2qd6zzgPRxySQHtmPb1HcMN6JNXFgKMEy/Ta/B?=
 =?us-ascii?Q?X80eN8siuyeJAniCD/Kg1C8oMgHm6ocGhgnncHVvBxwtNynilTeUOxSmd5sY?=
 =?us-ascii?Q?uGKZWVEZY1E1KgCMgT34nJMGVg9NrLT5ySVg09L0htmEap0o0T/5PELkf7SN?=
 =?us-ascii?Q?KvkoCE8ujBRQsWbxnrWizfLx7HTd1WFd1O52E98TSW7MHtFETtDC1S9mQ9zM?=
 =?us-ascii?Q?febWcz0Rg6pMdwfByMC1GGLCOUj+1ZAWCx0B?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:10.4501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5690f7-fa15-4e9d-df85-08dd94d7540e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |   4 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  | 186 ++++++++++--------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   7 +
 4 files changed, 114 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 55022ad67208..58a47c62690a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -250,7 +250,7 @@ r535_gr_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *c
 }
 
 static const struct nvkm_engn_func
-r535_gr = {
+r535_engn_gr = {
 	.nonstall = r535_engn_nonstall,
 	.ctor2 = r535_gr_ctor,
 };
@@ -468,7 +468,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			engn = nvkm_runl_add(runl, nv2080, &r535_engn_ce, type, inst);
 			break;
 		case NVKM_ENGINE_GR:
-			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
+			engn = nvkm_runl_add(runl, nv2080, &r535_engn_gr, type, inst);
 			break;
 		case NVKM_ENGINE_NVDEC:
 		case NVKM_ENGINE_NVENC:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 4c0df52e8683..e0fa88aa608f 100644
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
@@ -269,88 +365,9 @@ r535_gr_oneinit(struct nvkm_gr *base)
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
@@ -385,3 +402,8 @@ r535_gr_dtor(struct nvkm_gr *base)
 	kfree(gr->base.func);
 	return gr;
 }
+
+const struct nvkm_rm_api_gr
+r535_gr = {
+	.get_ctxbufs_info = r535_gr_get_ctxbufs_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 8d41df85fb19..43cf44bf3abb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -31,6 +31,7 @@ r535_api = {
 	.disp = &r535_disp,
 	.fifo = &r535_fifo,
 	.ce = &r535_ce,
+	.gr = &r535_gr,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
 	.nvjpg = &r535_nvjpg,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 8783c21af0e7..f085e25e4e08 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -7,6 +7,7 @@
 #define __NVKM_RM_H__
 #include "handles.h"
 struct nvkm_outp;
+struct r535_gr;
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_wpr *wpr;
@@ -96,6 +97,11 @@ struct nvkm_rm_api {
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
@@ -109,6 +115,7 @@ extern const struct nvkm_rm_api_device r535_device;
 extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
+extern const struct nvkm_rm_api_gr r535_gr;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
 u64 r535_gr_units(struct nvkm_gr *);
-- 
2.49.0

