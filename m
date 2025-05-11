Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B4AB2B67
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423110E20F;
	Sun, 11 May 2025 21:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZzekFbU8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C07910E200
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHAVZqTpWnUfENjzKElbi45w8xtIBlBLmZ1aTr1UjUKIyFwVwTJ+Y5a90L85djtc33A1VRSyG7m+pfJP8DB0lv6Y37qX+r78MLZYaUCceu4E1qQs+jDzsX8IfskZUWDsn/ScQg7yCREwvTiyJmBgGq0Lvp15ikemAXfVVsCfcfm2WT3MywhnAlxxX/bdmtQCA76lgoadmcQ3nQ2CofMBZy1tgEH36e61SdTgIYcLOAToEAzbi5+G3TXX/JO2fdTtZ02KZ1AK+NJQILMaGbdMoo0Y788jPPPqhguZw1CfSWtfa0f7tstqlvtPTAyYaLOCKK7rUAzNQDTsWf0qIqNG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX0dLQ6N+yevRXsvmaDxQ1UVDWQyBPP2X0MljXbecwQ=;
 b=EgxVc1IFQKoNhciJizusDMHhiqH9yx6+n0o7gM+7HH8IHTXGD/NWmt1RMwPgcnW54ywKDTk4e+Pdk1zBLcmP/PPPwc2O9o4UBV3KZvuy2/oNwKYGfsoYo524rFUCYInDga5A4CzJKHHaVAHuiVFB53IMhoDa6yCUix9YPLRBZWilX8THTfkfWSV+LAYYc5ZolGhrcEwviqwzXZeIkOmriEXGenOCRFm3ZaBcAGKFL1T8HsQvKfhXGT44GSiTG/FKmvexWyEsUheTzUS9fYxuR587SsVlHGTJIqdavOYc3oTX8vi2yTxlVP4GPrMnGLYv1gnPHQs+I21URf7JNexd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX0dLQ6N+yevRXsvmaDxQ1UVDWQyBPP2X0MljXbecwQ=;
 b=ZzekFbU8Xou/0G3lyAWLYalGaENgRWeGkmGDd80DGJTE2srB8LhCCpWCr/FBZeFOSFuP+cjsmIbylffOml0SknyTMDhbL6xoCu12y+La6owleB7iuwWTp322oGq+P0EcsXFS4mbYWQ0uHljEbamBuT32hXIMPI0oI0LIEHhLZlWIS/eJd/b+9inspkUu3CkABbj7ofrqeUmnReysCLsqmAhyg2RA6PX7a8D8QC+Sjjm8F6wudD3nWBCkFc6y3nFf3dpuf94eOXqnpzr83Hpk9Z5BfP3pH2Kf0AD2GuhS6AnV/B4Cw/4XMfKG8bU1MAi3bZDTPp8Fe5sMh0HJyDEG4w==
Received: from DM6PR07CA0063.namprd07.prod.outlook.com (2603:10b6:5:74::40) by
 LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:06 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::24) by DM6PR07CA0063.outlook.office365.com
 (2603:10b6:5:74::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Sun,
 11 May 2025 21:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:58 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 33/62] drm/nouveau/gsp: add hal for gr.get_ctxbufs_info()
Date: Mon, 12 May 2025 07:06:53 +1000
Message-ID: <20250511210722.80350-34-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc84fa9-92f5-40c9-a37b-08dd90d010a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7h4ceFhOfAMs9vjttKsnY7RRF2h96OY1CYsCByoCVuJJZmVWQRmbKKSBODzh?=
 =?us-ascii?Q?yeWcMTYBKQBahuaUxJx4k3lZA6VfcLcX/xsk26XczXwWxtkBstOjNTFMANr+?=
 =?us-ascii?Q?kIKFcxKwF9iRd9oorWs2mO3omMbIcqKYD88lZFm+7kTJ8+M08YOj7ltM2fJJ?=
 =?us-ascii?Q?Zg61Jrtk8YYUprpeiBUI+Mg22PR9PX40pYGSqHmLzi3kSIQTw74T7CUlinjf?=
 =?us-ascii?Q?ZxQI20x7wuTHEJQYBtX7F8mAko1xveVuMskR1QGcSri3PqMhnIqxAjeycMAI?=
 =?us-ascii?Q?h3nERvQUzPh7YbMUgydEPiYJny0ReTn/OWEcEBSMA/6rTonoCQX/va+F8xEH?=
 =?us-ascii?Q?YqsBcEdVvZnat8reQkaYGNTM6tcECWfQBmz9/dpgUdeGSXr3TkkhZkzGIncT?=
 =?us-ascii?Q?Cyv+p6k2yU5sV0vh5I5pwG4DzfFhEsrLVl0Ew6F5E3TZFTrOOPZsIKRYMoYS?=
 =?us-ascii?Q?R4qFzDS5t44CiF58BtUAEnkG15AzjEH9WstPQpyu4G56Csd/++tgdmaNHkTK?=
 =?us-ascii?Q?tyXuB6oC5xM0twlfwrI6RkWMTbH/XuQ7SWWZcpBuT9Q9UCqzaWDmGBF9Sz03?=
 =?us-ascii?Q?65Q9f957TwkOLszqbI0uf+lkUi3ACQ60a5XZkfV8YN/C98moN1NyBK5GU7Cc?=
 =?us-ascii?Q?jLf5LO3FbR9XBvw2N8xmB/bmDKO47Z+FXsy/DsJJlCwuvTeISJ/AHBarodcI?=
 =?us-ascii?Q?O68iZ2j45O5n/WgFpp7PNbK9ALl6glrlvFR+fVq8WOFN6aIE0ojbLaBW6r2/?=
 =?us-ascii?Q?rCx79P6vjPy/L85nKZvug8YZ9OijcxOGzHO368KQJhh7U2q/5eS0roiHJIKg?=
 =?us-ascii?Q?1ZfpSZ4sv5D8wueax9jWlX16ypzkBDK9L6LZ9VKTAdMjlTMF9KMSVrOBn/bR?=
 =?us-ascii?Q?zP6SXW97qnfC3UK44++rzkBSmjUzK4WhpfS5dH0ZVtpTr9Pb/9lvQjqnjlTa?=
 =?us-ascii?Q?dqI+Q8HZ5nChtsndUFZ7TOsaTHcj+/WAArvcvDDU91snzw5/1qTVb9kJBpoT?=
 =?us-ascii?Q?2mN7Qzeu4kKoZECQXQNFl/ZH9j1jpOaf4iue3a3580ltjMGk6eeWAKjb0A2L?=
 =?us-ascii?Q?XrguKaBKuCYk7wS2CjhDFjTQeaXDHEraWbEF5j2fEKHwocu60TpECszcdVz/?=
 =?us-ascii?Q?VJS1Pm7RcRxiXxjydHhdME4CaUIqwGCa/XJnXdXG6FFU8EJDkWE2m/RNiXkv?=
 =?us-ascii?Q?ayEnqXnw0oVpUE2ChmyDWuK5TfyS841Atslg5M1z5pmZtNJW/bkVcziP6+ql?=
 =?us-ascii?Q?H+01eqB/xgr2gLrg83EJj11/aDcBmmTKEI9F4yRdCXinPV0U4HDsze5ntW+U?=
 =?us-ascii?Q?j1G9azBHIqiSv4tXwS0p/NclVodXAWoln2l8Hkg/TiZHj/4WnzF3+a4iQ3rF?=
 =?us-ascii?Q?xMOhKjKwWqaaDX2gjkBZj43u8DB7ZHwwhlTIupPXgxmoks3v3pvQ7jQ5LHTC?=
 =?us-ascii?Q?rSgJQLQGwN4gcAUzyW5mj/xw9Jd0aS26AnVn2KZferQdMHlq2wyogoyIpWhi?=
 =?us-ascii?Q?/IJr15/xlgHefj4fVzP45RRcAqJKY147t8xp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:06.2353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc84fa9-92f5-40c9-a37b-08dd90d010a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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
index 125e6faaa94b..3d320788d45a 100644
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
index d882a400aa88..d6f41498c321 100644
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

