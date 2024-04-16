Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C18A78BC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516DF112F32;
	Tue, 16 Apr 2024 23:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K3RL9jAg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDE5112F34
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V37z6rBHCup56o+01C/oq+/ld9RFyKUmGsszCI3K17sfPIogfBHE6xgzmbiVAjlCgxRto7w1ZWK5tejqA5dj9BF631LDMy4GBqiAL7jC4mQM9oymfrt+551pVSMOqzRsgzcS7IoGoL18YcdAUk3u76AHyIRtIZs2VDdZAkHFBj2SJ+ZFThzmr3YHcb3aRCbp0uOb/Mq8KpZ+Ru2qFd40JTtRlSIwLXsQ7wYaX+Vt+2yEOKZ2la1CEOj+dsFFuTaLJTY6jR0jzosmSAGBcQ5T8sJoxcC79y1IiyIOtVJa6/3IaO6R+S56O4cDiBsXdCPBGwbcpB0q8iE3PwAQyjXY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQPyYikvNbukXwo2gVPZQKngmpSWGRpjMuHTtBTetKA=;
 b=Fe/CsDbd19t0cqlEBTAx6SNl2RvkBbZFmd3aooxCAPAjjMgZwxNBVnaS/2mG0O1A8c1sr8ODJyi+wfS5QOmAQRwYPidaLBlfr0iPPgQ6RYoi5yiECu4nEBoajF7TAhjMPj1KKyGe7slANDAJKvxFEiAnvz0C7FDk2rztt8ncOrByyNOX/fbacnGusn69elc5BjZ7H3MiKL9aI+Jt9E9jH5I+nGebR6SSH0XLeLsZFhhwVZYH0ebtrJx3BMt9QlMVHXv7g8Qq+aJB56h6BHjyQ48tCzcEx/R9k/lEgIb8YKvw3jMmmf6Y/H5mk1yjhrr64ivkAYOhsPp4PFouClOwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQPyYikvNbukXwo2gVPZQKngmpSWGRpjMuHTtBTetKA=;
 b=K3RL9jAg3K5Vqu7GcZghnjXcBWo+2wsoFkG5IknsXDXYTQERKbb1ljMO/o3wJyGh75E5PKa5SElJFrbmhmyCRPxtRN1r7mT8h9Bl4WrVA0OQ0v5F19HFLEonWR3fmE8MWdLRQUvQ3RZGShQU4jgRl60Pe1qtK517Bui87bv1rlaVYs6+QXWipSlGbrrdIMfwEkLWsnnVtZWEcqUhravzsXcwpF0HivbGcQeyvWz8rTKx9RFkKsGxPeansuvG2QAphLMO4O6UQq2uu7BCjegsPvH2Ypuv4dfHViyoA+m4OrTklBPp7R/Px2s2R/e5wAk3SNlbPN7L9Hp8IUGsyD8bNQ==
Received: from CH0PR04CA0002.namprd04.prod.outlook.com (2603:10b6:610:76::7)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:11 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::6e) by CH0PR04CA0002.outlook.office365.com
 (2603:10b6:610:76::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:55 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 021/156] drm/nouveau/kms: move dmac sync/vram ctxdmas to
 core+wndws
Date: Wed, 17 Apr 2024 09:37:47 +1000
Message-ID: <20240416234002.19509-22-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 817ee9f2-6284-446c-a302-08dc5e6eb235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpRDiSv6A5DygQtc14xTq9t/AKPLOrpmzUaXpoz4vlpUiHEDi0pFsNB7xDmatWh912KaoXxZXcJHjrG3QZ3VZEA4dZNPkbPd92M7yiBxYFJMO+JGTfrpxKLFeKWALHcnEv5SWSHl1scn9r5LQQDoDVqN3rn62mqkF6EJ3nUoDiKJQwKxZtN3UOD7Kx5+GIt65dRLJ2O3DwZRAXkevdVX9jnLvNTZBxtx+TwCdef8srGrqHXMuGtqOKZuY94q/eKH8IE0S+j5WPwLPNSdUlGK5CXAaGqRf6W9h7TCMttn0tah1MWJt/PZe5dhfyJjrMGvdzY7cdF/6UWxSdBjMCCofBnbtSxrPeC1TgpCGlC5N/5LAjgZ9NAfXktWGbzgo9wcXCkWCPTlEjpJt683Hh9+MP1351ljXy9lXmR+4A5457ZZSZxfbujiQIXlmu7u2RrDAsmcEYL3ghZchH3bLVYXk6/2REnyqNd5NUdSJmTQSCh05W0wqJaWObuB7aLqmqVAdDZTzGK0l45r6NggD5hBYXSkNg/ff9zX3ZM+GCffMYmPFWUqBZh/IeWax1D21knoJ3G4+rb9nluWzbEJkEPPzsKa92n4kSOsVdZgOJA6ocv1+LhlcZQo876ZGKGqGGe0l0cXC1WkeOXTe0otyfui20jMbNjdhx6iIXqJ9EZIXn5k2VycXUtg3qxGVvPxqHIBjmz5fzgRN8sMfqSyHz5vhFYPKOqzgD9SbO3Cx3G2rTJQ9fujtNR/RhuXCybGiB14
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:10.7478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817ee9f2-6284-446c-a302-08dc5e6eb235
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553
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

- will help later in the series where display channels apis are modified

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/core.c     | 39 ++++++++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/core.h     |  4 ++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 27 ------------
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  3 --
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 46 +++++++++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     |  6 ++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  4 +-
 15 files changed, 104 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index a431f6c5f6fa..0b6fb663d78e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -311,7 +311,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, DRM_PLANE_TYPE_PRIMARY,
+	ret = nv50_wndw_prep(func, drm->dev, DRM_PLANE_TYPE_PRIMARY,
 			     "base", head, format, BIT(head),
 			     NV50_DISP_INTERLOCK_BASE, interlock_data, &wndw);
 	if (*pwndw = wndw, ret)
@@ -328,7 +328,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	wndw->ntfy = NV50_DISP_BASE_NTFY(wndw->id);
 	wndw->sema = NV50_DISP_BASE_SEM0(wndw->id);
 	wndw->data = 0x00000000;
-	return 0;
+	return nv50_wndw_ctor(wndw);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index f045515696cb..1864f3e3bbc3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -20,14 +20,20 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "core.h"
+#include "handles.h"
+
+#include "nouveau_bo.h"
 
 #include <nvif/class.h>
+#include <nvif/cl0002.h>
 
 void
 nv50_core_del(struct nv50_core **pcore)
 {
 	struct nv50_core *core = *pcore;
 	if (core) {
+		nvif_object_dtor(&core->sync);
+		nvif_object_dtor(&core->vram);
 		nv50_dmac_destroy(&core->chan);
 		kfree(*pcore);
 		*pcore = NULL;
@@ -61,7 +67,9 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		{}
 	};
 	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_core *core;
 	int cid;
+	int ret;
 
 	cid = nvif_mclass(&disp->disp->object, cores);
 	if (cid < 0) {
@@ -69,5 +77,34 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		return cid;
 	}
 
-	return cores[cid].new(drm, cores[cid].oclass, pcore);
+	ret = cores[cid].new(drm, cores[cid].oclass, &core);
+	*pcore = core;
+	if (ret)
+		return ret;
+
+	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
+			       &(struct nv_dma_v0) {
+					.target = NV_DMA_V0_TARGET_VRAM,
+					.access = NV_DMA_V0_ACCESS_RDWR,
+					.start = disp->sync->offset + 0x0000,
+					.limit = disp->sync->offset + 0x0fff,
+			       }, sizeof(struct nv_dma_v0),
+			       &core->sync);
+	if (ret)
+		return ret;
+
+	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
+			       &(struct nv_dma_v0) {
+					.target = NV_DMA_V0_TARGET_VRAM,
+					.access = NV_DMA_V0_ACCESS_RDWR,
+					.start = 0,
+					.limit = drm->device.info.ram_user - 1,
+			       }, sizeof(struct nv_dma_v0),
+			       &core->vram);
+	if (ret)
+		return ret;
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index f75088186fba..a967c66dc7a2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -8,6 +8,10 @@
 struct nv50_core {
 	const struct nv50_core_func *func;
 	struct nv50_dmac chan;
+
+	struct nvif_object vram;
+	struct nvif_object sync;
+
 	bool assign_windows;
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index ce2cb78bbdd3..c6eee88ae99a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -136,7 +136,7 @@ core507d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2)))
 		return ret;
 
-	PUSH_MTHD(push, NV507D, SET_CONTEXT_DMA_NOTIFIER, core->chan.sync.handle);
+	PUSH_MTHD(push, NV507D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
 	return PUSH_KICK(push);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 7f637b8830be..9525fd30c8fc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -134,7 +134,7 @@ corec37d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2 + windows * 5)))
 		return ret;
 
-	PUSH_MTHD(push, NVC37D, SET_CONTEXT_DMA_NOTIFIER, core->chan.sync.handle);
+	PUSH_MTHD(push, NVC37D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
 
 	for (i = 0; i < windows; i++) {
 		PUSH_MTHD(push, NVC37D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(i),
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 421d0d57e1d8..485892c2e775 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -36,7 +36,7 @@ corec57d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2 + windows * 5)))
 		return ret;
 
-	PUSH_MTHD(push, NVC57D, SET_CONTEXT_DMA_NOTIFIER, core->chan.sync.handle);
+	PUSH_MTHD(push, NVC57D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
 
 	for (i = 0; i < windows; i++) {
 		PUSH_MTHD(push, NVC57D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(i),
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index a95ee5dcc2e3..7292d1554dba 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -78,7 +78,7 @@ static void
 curs507a_prepare(struct nv50_wndw *wndw, struct nv50_head_atom *asyh,
 		 struct nv50_wndw_atom *asyw)
 {
-	u32 handle = nv50_disp(wndw->plane.dev)->core->chan.vram.handle;
+	u32 handle = nv50_disp(wndw->plane.dev)->core->vram.handle;
 	u32 offset = asyw->image.offset[0];
 	if (asyh->curs.handle != handle || asyh->curs.offset != offset) {
 		asyh->curs.handle = handle;
@@ -177,7 +177,7 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(&curs507a_wndw, drm->dev, DRM_PLANE_TYPE_CURSOR,
+	ret = nv50_wndw_prep(&curs507a_wndw, drm->dev, DRM_PLANE_TYPE_CURSOR,
 			     "curs", head, curs507a_format, BIT(head),
 			     NV50_DISP_INTERLOCK_CURS, interlock_data, &wndw);
 	if (*pwndw = wndw, ret)
@@ -193,7 +193,7 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	nvif_object_map(&wndw->wimm.base.user, NULL, 0);
 	wndw->immd = func;
 	wndw->ctxdma.parent = NULL;
-	return 0;
+	return nv50_wndw_ctor(wndw);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 125c33ee251a..31b46a62b501 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -119,9 +119,6 @@ nv50_chan_destroy(struct nv50_chan *chan)
 void
 nv50_dmac_destroy(struct nv50_dmac *dmac)
 {
-	nvif_object_dtor(&dmac->vram);
-	nvif_object_dtor(&dmac->sync);
-
 	nv50_chan_destroy(&dmac->base);
 
 	nvif_mem_dtor(&dmac->push.mem);
@@ -280,30 +277,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (syncbuf < 0)
 		return 0;
 
-	ret = nvif_object_ctor(&dmac->base.user, "kmsSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
-			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = syncbuf + 0x0000,
-					.limit = syncbuf + 0x0fff,
-			       }, sizeof(struct nv_dma_v0),
-			       &dmac->sync);
-	if (ret)
-		return ret;
-
-	ret = nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = 0,
-					.limit = device->info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
-			       &dmac->vram);
-	if (ret)
-		return ret;
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index a7a01ae77ff4..9485f8c90cac 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -63,9 +63,6 @@ struct nv50_dmac {
 	struct nv50_chan base;
 
 	struct nvif_push push;
-
-	struct nvif_object sync;
-	struct nvif_object vram;
 };
 
 struct nv50_outp_atom {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 83355dbc15ee..007857ac8542 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -274,7 +274,7 @@ nv50_head_atomic_check_lut(struct nv50_head *head,
 			  size, crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
-	asyh->olut.handle = disp->core->chan.vram.handle;
+	asyh->olut.handle = disp->core->vram.handle;
 	asyh->olut.buffer = !asyh->olut.buffer;
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 7fa1e0279d7d..634f6166f38d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -265,7 +265,7 @@ head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 		asyh->core.w = asyh->state.mode.hdisplay;
 		asyh->core.h = asyh->state.mode.vdisplay;
 	}
-	asyh->core.handle = disp->core->chan.vram.handle;
+	asyh->core.handle = disp->core->vram.handle;
 	asyh->core.offset = 0;
 	asyh->core.format = NV507D_HEAD_SET_PARAMS_FORMAT_A8R8G8B8;
 	asyh->core.kind = NV507D_HEAD_SET_PARAMS_KIND_KIND_PITCH;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 654e506f8431..4e109c5b5a1b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -152,7 +152,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, DRM_PLANE_TYPE_OVERLAY,
+	ret = nv50_wndw_prep(func, drm->dev, DRM_PLANE_TYPE_OVERLAY,
 			     "ovly", head, format, BIT(head),
 			     NV50_DISP_INTERLOCK_OVLY, interlock_data,
 			     &wndw);
@@ -170,7 +170,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	wndw->ntfy = NV50_DISP_OVLY_NTFY(wndw->id);
 	wndw->sema = NV50_DISP_OVLY_SEM0(wndw->id);
 	wndw->data = 0x00000000;
-	return 0;
+	return nv50_wndw_ctor(wndw);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..1dbf0e73b5de 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -181,7 +181,7 @@ nv50_wndw_ntfy_enable(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
 
-	asyw->ntfy.handle = wndw->wndw.sync.handle;
+	asyw->ntfy.handle = wndw->sync.handle;
 	asyw->ntfy.offset = wndw->ntfy;
 	asyw->ntfy.awaken = false;
 	asyw->set.ntfy = true;
@@ -406,7 +406,7 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 	memset(&asyw->xlut, 0x00, sizeof(asyw->xlut));
 	if ((asyw->ilut = wndw->func->ilut ? ilut : NULL)) {
 		wndw->func->ilut(wndw, asyw, drm_color_lut_size(ilut));
-		asyw->xlut.handle = wndw->wndw.vram.handle;
+		asyw->xlut.handle = wndw->vram.handle;
 		asyw->xlut.i.buffer = !asyw->xlut.i.buffer;
 		asyw->set.xlut = true;
 	} else {
@@ -645,6 +645,9 @@ nv50_wndw_destroy(struct drm_plane *plane)
 	}
 
 	nv50_dmac_destroy(&wndw->wimm);
+
+	nvif_object_dtor(&wndw->vram);
+	nvif_object_dtor(&wndw->sync);
 	nv50_dmac_destroy(&wndw->wndw);
 
 	nv50_lut_fini(&wndw->ilut);
@@ -693,7 +696,44 @@ static const u64 nv50_cursor_format_modifiers[] = {
 };
 
 int
-nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
+nv50_wndw_ctor(struct nv50_wndw *wndw)
+{
+	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
+	int ret;
+
+	if (!nvif_object_constructed(&wndw->wndw.base.user))
+		return 0;
+
+	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
+			       &(struct nv_dma_v0) {
+					.target = NV_DMA_V0_TARGET_VRAM,
+					.access = NV_DMA_V0_ACCESS_RDWR,
+					.start = disp->sync->offset + 0x0000,
+					.limit = disp->sync->offset + 0x0fff,
+			       }, sizeof(struct nv_dma_v0),
+			       &wndw->sync);
+	if (ret)
+		return ret;
+
+	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwVramCtxDma", NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
+			       &(struct nv_dma_v0) {
+					.target = NV_DMA_V0_TARGET_VRAM,
+					.access = NV_DMA_V0_ACCESS_RDWR,
+					.start = 0,
+					.limit = drm->device.info.ram_user - 1,
+			       }, sizeof(struct nv_dma_v0),
+			       &wndw->vram);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int
+nv50_wndw_prep(const struct nv50_wndw_func *func, struct drm_device *dev,
 	       enum drm_plane_type type, const char *name, int index,
 	       const u32 *format, u32 heads,
 	       enum nv50_disp_interlock_type interlock_type, u32 interlock_data,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 76a6ae5d5652..66a06e20a6a0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -28,16 +28,20 @@ struct nv50_wndw {
 	struct nv50_dmac wndw;
 	struct nv50_dmac wimm;
 
+	struct nvif_object vram;
+	struct nvif_object sync;
+
 	u16 ntfy;
 	u16 sema;
 	u32 data;
 };
 
-int nv50_wndw_new_(const struct nv50_wndw_func *, struct drm_device *,
+int nv50_wndw_prep(const struct nv50_wndw_func *, struct drm_device *,
 		   enum drm_plane_type, const char *name, int index,
 		   const u32 *format, u32 heads,
 		   enum nv50_disp_interlock_type, u32 interlock_data,
 		   struct nv50_wndw **);
+int nv50_wndw_ctor(struct nv50_wndw *);
 void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
 			 struct nv50_wndw_atom *);
 void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 50a7b97d37a2..5029dfd98443 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -357,7 +357,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	struct nv50_wndw *wndw;
 	int ret;
 
-	ret = nv50_wndw_new_(func, drm->dev, type, "wndw", index,
+	ret = nv50_wndw_prep(func, drm->dev, type, "wndw", index,
 			     wndwc37e_format, heads, NV50_DISP_INTERLOCK_WNDW,
 			     BIT(index), &wndw);
 	if (*pwndw = wndw, ret)
@@ -374,7 +374,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	wndw->ntfy = NV50_DISP_WNDW_NTFY(wndw->id);
 	wndw->sema = NV50_DISP_WNDW_SEM0(wndw->id);
 	wndw->data = 0x00000000;
-	return 0;
+	return nv50_wndw_ctor(wndw);
 }
 
 int
-- 
2.41.0

