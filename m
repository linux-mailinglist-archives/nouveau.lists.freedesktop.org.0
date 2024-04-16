Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284BB8A7934
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5DD112F9A;
	Tue, 16 Apr 2024 23:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ABbaYrLS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24428112FCD
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeSxS7T2iquDoPHz9S8P+uoPF6OpGf6cKER0E2In7vwk4hJ5E7WpIaF1C8a0zbvcjTu8XMn3TnDNuCfXhgNcMRRn554Pcsr744JugYzU4pPPAl7L6dKp+Qw9jJxSBSJh1nTL38KMEwNk197midM42Vnwri1k+04JdRoWtcuroAVyAeBQ4HYKmWK5/eLCjjfmEsYm6Aby547oPzbxlVaafb+s9TdgxQeSx0+cji+3fWVQ+XPPdQu+wbKhHuJouZPpRsEHIEv1Tezzes+gTPsep06y4PMI7jGm4keIl8TtNt7thlNokoy8gYtYwJGW/nxOX+8sF4KbufYxioL43qcI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53B4qBleiPc0pNDMByxd+Ic+PiswicNmBGuY19us22o=;
 b=BdrqXCwzO4QN1Ks8uURDHO2beoOth7TLvsGAXBybLRdq1GfmFzt/SpXPnEAv6ioUmXZwercsC1dFTjdVya0v5ZACQDWUVTK5asc808wc9n1x/6WqHjm4eJV3Ia1ke/Z+GmxJ8JBEKPkbaPrZ3QVKr/cXNwDRIzSA0EiLA6Cvn5pg2Prl7EBStKWon7yN4WYEksWcNulRVkKhIQS8WnBHcSWNM5MzxSFVJjEZjzi3FEiOdm82bP9Bql0y+WgO5X+tcfucABA0BBknT5bBnE1lrqti0LqRGrAGT+4Pww5es6OF7cu5eioMO1ZLmPqdf0rc/pSwd0DOjkoNtqfdJ7AQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53B4qBleiPc0pNDMByxd+Ic+PiswicNmBGuY19us22o=;
 b=ABbaYrLS6dbbUlHovyyhLOaNjkhUskj5fCGBfX0aOI10lcAICmZ3SSJ1PkaRWctBn9ssBspSe9PqgbiC1bz5hxf3P/b18Qn1too78jpKQPkPz6d2ZAgnMS0Ps6HPriWCoDM7tnRkDrPZwTQ9bMlL8nUbZYil19JKQR5ul8NfW89HZVdia4jjZ0KosEPFgPCdIyG9NOfnthCkp0rTJOxCGsPnqYT8TOfuPjYylvEruTT1GNh8FcTSpoF1N2+3tLlJMzufTPZa1+aYCPD74hlnh2aNwBRexl2F6nnjJV5q+SSroOkCZsLgBHr89iS04PGunEY7VAgLym33AEdJG8JxZg==
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:22 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::73) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:59 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 130/156] drm/nouveau/nvif: rework disp "new chan" apis
Date: Wed, 17 Apr 2024 09:39:36 +1000
Message-ID: <20240416234002.19509-131-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 791b73f9-4ae8-49f2-e1fd-08dc5e6f00cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EvuOYXfhmP1O/TOM5ICfdctlAnw6EQD29lsiJXhqTQGvSKnUVwbETmUYr3xuUlTUeUr3/THX1W2VfrIkqXtEdiCt+XMwRe0zupW06cVWAbMt4pfdQkL/ChYhaNSHHWP4lK1mZs4wXC0BIsr+pGXcYLn9IndkqQyTinIHxW0q/OC2zVHaSfewFhdZlfwJNTu1tfzEHUDUibNjLimK1vRE8QZ/0LQducXq26wLONRnIRrUlI5jmQW5DEiLJg/yR7e74ikvUxOoH5dt/DFWTW28C+X3iLhDfgp9x+2B7L2Bq8S21ctxDckUL9m6ZVe3JIdnkiZrKql8xEzZ83dyx5TgGrnDafYty7wDQTzyLpAGr6/iUTTjiwqaQLstER7eUmkuQhUwwltqVVvjeMQboeVrfuon76vl8Zn6ji+ZC695IrjtZ9P85FiT830nved2N6A0kJzWtXTagt4A3W6bYM8dpWXmsNmHduMESBKVCRY17FB0WDCZ6G4wQ3wjBbQoduawQApeGZEn6Ewyy3B8FhRvmDRBq+r5L4X6OFjsObYZaW10vCPyJgAwI3rTE+rk7SivYXPHRslb9QGXzDKMpiQy1/F1q4CelmnNrW25FOCJe8SL/5PBOfNsju56QC1i0f6Smp+CaOOLWE8zjOJmff6+pLfw3UvNi1kEhGdwfVk2zU9VQG89LKSW7qzywnEZet99107GIN+AGc1gQteIV3IojaAx8YPDt1TicKY8AIZvBTGANypHpNFic39/nWIAVlK
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:22.6013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791b73f9-4ae8-49f2-e1fd-08dc5e6f00cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  21 +-
 drivers/gpu/drm/nouveau/dispnv50/core.c       |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/core.h       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |  27 ++-
 drivers/gpu/drm/nouveau/dispnv50/core907d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  33 +--
 drivers/gpu/drm/nouveau/dispnv50/cursc37a.c   |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 217 +-----------------
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  18 --
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c   |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  21 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  14 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h       |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  21 +-
 .../gpu/drm/nouveau/include/nvif/dispchan.h   |  21 ++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  15 ++
 drivers/gpu/drm/nouveau/include/nvif/if0014.h |  13 --
 drivers/gpu/drm/nouveau/include/nvif/push.h   |   5 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   3 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |   1 +
 drivers/gpu/drm/nouveau/nvif/dispchan.c       | 205 +++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 132 ++++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   |   4 -
 .../gpu/drm/nouveau/nvkm/engine/disp/uchan.h  |  10 +
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 139 +++++++----
 27 files changed, 528 insertions(+), 468 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/dispchan.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0014.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/dispchan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 0b6fb663d78e..875c013c39b0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -21,7 +21,6 @@
  */
 #include "base.h"
 
-#include <nvif/if0014.h>
 #include <nvif/push507c.h>
 #include <nvif/timer.h>
 
@@ -304,10 +303,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	      struct nouveau_drm *drm, int head, s32 oclass, u32 interlock_data,
 	      struct nv50_wndw **pwndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = head,
-	};
-	struct nv50_disp *disp50 = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	struct nv50_wndw *wndw;
 	int ret;
 
@@ -317,9 +313,18 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(drm,
-			       &oclass, head, &args, sizeof(args),
-			       disp50->sync->offset, &wndw->wndw);
+	ret = nvif_dispchan_ctor(disp, "kmsChanBase", head, oclass, &drm->mmu, &wndw->wndw);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.base.new(disp->priv, head, wndw->wndw.push.mem.priv,
+					&wndw->wndw.impl, &wndw->wndw.priv,
+					nvif_handle(&wndw->wndw.object));
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wndw);
+done:
 	if (ret) {
 		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index 7d5438355715..98ccb67fc95b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -34,7 +34,7 @@ nv50_core_del(struct nv50_core **pcore)
 	if (core) {
 		nvif_object_dtor(&core->sync);
 		nvif_object_dtor(&core->vram);
-		nv50_dmac_destroy(&core->chan);
+		nvif_dispchan_dtor(&core->chan);
 		kfree(*pcore);
 		*pcore = NULL;
 	}
@@ -75,7 +75,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
+	ret = nvif_object_ctor(&core->chan.object, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
@@ -87,7 +87,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
+	ret = nvif_object_ctor(&core->chan.object, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index a967c66dc7a2..1343a1d224c0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -5,9 +5,11 @@
 #include "crc.h"
 #include <nouveau_encoder.h>
 
+#include <nvif/dispchan.h>
+
 struct nv50_core {
 	const struct nv50_core_func *func;
-	struct nv50_dmac chan;
+	struct nvif_dispchan chan;
 
 	struct nvif_object vram;
 	struct nvif_object sync;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index c6eee88ae99a..dab9fb984765 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -22,7 +22,6 @@
 #include "core.h"
 #include "head.h"
 
-#include <nvif/if0014.h>
 #include <nvif/push507c.h>
 #include <nvif/timer.h>
 
@@ -115,7 +114,7 @@ core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 	if (ret < 0)
 		return ret;
 
-	time = nvif_msec(core->chan.base.device, 2000ULL,
+	time = nvif_msec(core->chan.disp->device, 2000ULL,
 			 if (NVBO_TD32(bo, NV50_DISP_CORE_NTFY,
 				       NV_DISP_CORE_NOTIFIER_1, CAPABILITIES_1, DONE, ==, TRUE))
 				 break;
@@ -157,8 +156,7 @@ int
 core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 	      s32 oclass, struct nv50_core **pcore)
 {
-	struct nvif_disp_chan_v0 args = {};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	struct nv50_core *core;
 	int ret;
 
@@ -166,15 +164,22 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 		return -ENOMEM;
 	core->func = func;
 
-	ret = nv50_dmac_create(drm,
-			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->offset, &core->chan);
-	if (ret) {
+	ret = nvif_dispchan_ctor(disp, "kmsChanCore", 0, oclass, &drm->mmu, &core->chan);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.core.new(disp->priv, core->chan.push.mem.priv,
+					&core->chan.impl, &core->chan.priv,
+					nvif_handle(&core->chan.object));
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&core->chan);
+done:
+	if (ret)
 		NV_ERROR(drm, "core%04x allocation failed: %d\n", oclass, ret);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core907d.c b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
index 8564d4dffaff..0bff54ca5ba1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
@@ -44,7 +44,7 @@ core907d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 	if (ret < 0)
 		return ret;
 
-	time = nvif_msec(core->chan.base.device, 2000ULL,
+	time = nvif_msec(core->chan.disp->device, 2000ULL,
 			 if (NVBO_TD32(bo, NV50_DISP_CORE_NTFY,
 				       NV907D_CORE_NOTIFIER_3, CAPABILITIES_4, DONE, ==, TRUE))
 				 break;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 9482e69c3647..72ce4ada284f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -507,7 +507,7 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.base.user, "kmsCrcNtfyCtxDma",
+	ret = nvif_object_ctor(&core->chan.object, "kmsCrcNtfyCtxDma",
 			       NV50_DISP_HANDLE_CRC_CTX(head, idx),
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 7292d1554dba..8017cd0bd636 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -23,7 +23,6 @@
 #include "core.h"
 #include "head.h"
 
-#include <nvif/if0014.h>
 #include <nvif/timer.h>
 
 #include <nvhw/class/cl507a.h>
@@ -35,7 +34,7 @@ bool
 curs507a_space(struct nv50_wndw *wndw)
 {
 	nvif_msec(&nouveau_drm(wndw->plane.dev)->client.device, 100,
-		if (NVIF_TV32(&wndw->wimm.base.user, NV507A, FREE, COUNT, >=, 4))
+		if (NVIF_TV32(&wndw->wimm, NV507A, FREE, COUNT, >=, 4))
 			return true;
 	);
 
@@ -46,10 +45,10 @@ curs507a_space(struct nv50_wndw *wndw)
 static int
 curs507a_update(struct nv50_wndw *wndw, u32 *interlock)
 {
-	struct nvif_object *user = &wndw->wimm.base.user;
-	int ret = nvif_chan_wait(&wndw->wimm, 1);
+	struct nvif_dispchan *chan = &wndw->wimm;
+	int ret = nvif_chan_wait(chan, 1);
 	if (ret == 0) {
-		NVIF_WR32(user, NV507A, UPDATE,
+		NVIF_WR32(chan, NV507A, UPDATE,
 			  NVDEF(NV507A, UPDATE, INTERLOCK_WITH_CORE, DISABLE));
 	}
 	return ret;
@@ -58,10 +57,10 @@ curs507a_update(struct nv50_wndw *wndw, u32 *interlock)
 static int
 curs507a_point(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_object *user = &wndw->wimm.base.user;
-	int ret = nvif_chan_wait(&wndw->wimm, 1);
+	struct nvif_dispchan *chan = &wndw->wimm;
+	int ret = nvif_chan_wait(chan, 1);
 	if (ret == 0) {
-		NVIF_WR32(user, NV507A, SET_CURSOR_HOT_SPOT_POINT_OUT,
+		NVIF_WR32(chan, NV507A, SET_CURSOR_HOT_SPOT_POINT_OUT,
 			  NVVAL(NV507A, SET_CURSOR_HOT_SPOT_POINT_OUT, X, asyw->point.x) |
 			  NVVAL(NV507A, SET_CURSOR_HOT_SPOT_POINT_OUT, Y, asyw->point.y));
 	}
@@ -170,10 +169,7 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	      int head, s32 oclass, u32 interlock_data,
 	      struct nv50_wndw **pwndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = head,
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	struct nv50_wndw *wndw;
 	int ret;
 
@@ -183,14 +179,21 @@ curs507a_new_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nvif_object_ctor(&disp->disp->object, "kmsCurs", 0, oclass,
-			       &args, sizeof(args), &wndw->wimm.base.user);
+	ret = nvif_dispchan_ctor(disp, "kmsChanCurs", wndw->id, oclass, NULL, &wndw->wimm);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.curs.new(disp->priv, wndw->id, &wndw->wimm.impl, &wndw->wimm.priv);
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wimm);
+done:
 	if (ret) {
 		NV_ERROR(drm, "curs%04x allocation failed: %d\n", oclass, ret);
 		return ret;
 	}
 
-	nvif_object_map(&wndw->wimm.base.user, NULL, 0);
 	wndw->immd = func;
 	wndw->ctxdma.parent = NULL;
 	return nv50_wndw_ctor(wndw);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/cursc37a.c b/drivers/gpu/drm/nouveau/dispnv50/cursc37a.c
index e39d08698c63..e2c28c5716a6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/cursc37a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/cursc37a.c
@@ -27,20 +27,20 @@
 static int
 cursc37a_update(struct nv50_wndw *wndw, u32 *interlock)
 {
-	struct nvif_object *user = &wndw->wimm.base.user;
-	int ret = nvif_chan_wait(&wndw->wimm, 1);
+	struct nvif_dispchan *chan = &wndw->wimm;
+	int ret = nvif_chan_wait(chan, 1);
 	if (ret == 0)
-		NVIF_WR32(user, NVC37A, UPDATE, 0x00000001);
+		NVIF_WR32(chan, NVC37A, UPDATE, 0x00000001);
 	return ret;
 }
 
 static int
 cursc37a_point(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_object *user = &wndw->wimm.base.user;
-	int ret = nvif_chan_wait(&wndw->wimm, 1);
+	struct nvif_dispchan *chan = &wndw->wimm;
+	int ret = nvif_chan_wait(chan, 1);
 	if (ret == 0) {
-		NVIF_WR32(user, NVC37A, SET_CURSOR_HOT_SPOT_POINT_OUT(0),
+		NVIF_WR32(chan, NVC37A, SET_CURSOR_HOT_SPOT_POINT_OUT(0),
 			  NVVAL(NVC37A, SET_CURSOR_HOT_SPOT_POINT_OUT, X, asyw->point.x) |
 			  NVVAL(NVC37A, SET_CURSOR_HOT_SPOT_POINT_OUT, Y, asyw->point.y));
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5e12de0aabb6..7762469af47b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -50,7 +50,6 @@
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
 #include <nvif/event.h>
-#include <nvif/if0014.h>
 #include <nvif/timer.h>
 
 #include <nvhw/class/cl507c.h>
@@ -68,220 +67,6 @@
 #include "nouveau_fence.h"
 #include "nv50_display.h"
 
-/******************************************************************************
- * EVO channel
- *****************************************************************************/
-
-static int
-nv50_chan_create(struct nvif_device *device, struct nvif_object *disp,
-		 const s32 *oclass, u8 head, void *data, u32 size,
-		 struct nv50_chan *chan)
-{
-	struct nvif_sclass *sclass;
-	int ret, i, n;
-
-	chan->device = device;
-
-	ret = n = nvif_object_sclass_get(disp, &sclass);
-	if (ret < 0)
-		return ret;
-
-	while (oclass[0]) {
-		for (i = 0; i < n; i++) {
-			if (sclass[i].oclass == oclass[0]) {
-				ret = nvif_object_ctor(disp, "kmsChan", 0,
-						       oclass[0], data, size,
-						       &chan->user);
-				if (ret == 0) {
-					ret = nvif_object_map(&chan->user, NULL, 0);
-					if (ret)
-						nvif_object_dtor(&chan->user);
-				}
-				nvif_object_sclass_put(&sclass);
-				return ret;
-			}
-		}
-		oclass++;
-	}
-
-	nvif_object_sclass_put(&sclass);
-	return -ENOSYS;
-}
-
-static void
-nv50_chan_destroy(struct nv50_chan *chan)
-{
-	nvif_object_dtor(&chan->user);
-}
-
-/******************************************************************************
- * DMA EVO channel
- *****************************************************************************/
-
-void
-nv50_dmac_destroy(struct nv50_dmac *dmac)
-{
-	nv50_chan_destroy(&dmac->base);
-
-	nvif_mem_unmap_dtor(&dmac->push.mem, &dmac->push.map);
-}
-
-static void
-nv50_dmac_kick(struct nvif_push *push)
-{
-	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
-
-	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.map.ptr;
-	if (push->hw.put != push->hw.cur) {
-		/* Push buffer fetches are not coherent with BAR1, we need to ensure
-		 * writes have been flushed right through to VRAM before writing PUT.
-		 */
-		if (dmac->push.mem.type & NVIF_MEM_VRAM) {
-			struct nvif_device *device = dmac->base.device;
-			nvif_wr32(&device->object, 0x070000, 0x00000001);
-			nvif_msec(device, 2000,
-				if (!(nvif_rd32(&device->object, 0x070000) & 0x00000002))
-					break;
-			);
-		}
-
-		NVIF_WV32(&dmac->base.user, NV507C, PUT, PTR, push->hw.cur);
-		push->hw.put = push->hw.cur;
-	}
-
-	push->bgn = push->cur;
-}
-
-static int
-nv50_dmac_free(struct nv50_dmac *dmac)
-{
-	struct nvif_push *push = &dmac->push;
-	u32 get = NVIF_RV32(&dmac->base.user, NV507C, GET, PTR);
-	if (get > push->hw.cur) /* NVIDIA stay 5 away from GET, do the same. */
-		return get - push->hw.cur - 5;
-	return push->hw.max - push->hw.cur;
-}
-
-static int
-nv50_dmac_wind(struct nv50_dmac *dmac)
-{
-	struct nvif_push *push = &dmac->push;
-
-	/* Wait for GET to depart from the beginning of the push buffer to
-	 * prevent writing PUT == GET, which would be ignored by HW.
-	 */
-	u32 get = NVIF_RV32(&dmac->base.user, NV507C, GET, PTR);
-	if (get == 0) {
-		/* Corner-case, HW idle, but non-committed work pending. */
-		if (push->hw.put == 0)
-			nv50_dmac_kick(&dmac->push);
-
-		if (nvif_msec(dmac->base.device, 2000,
-			if (NVIF_TV32(&dmac->base.user, NV507C, GET, PTR, >, 0))
-				break;
-		) < 0)
-			return -ETIMEDOUT;
-	}
-
-	PUSH_RSVD(&dmac->push, PUSH_JUMP(&dmac->push, 0));
-	push->hw.cur = 0;
-	return 0;
-}
-
-static int
-nv50_dmac_wait(struct nvif_push *push, u32 size)
-{
-	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
-	int free;
-
-	if (WARN_ON(size > push->hw.max))
-		return -EINVAL;
-
-	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.map.ptr;
-	if (push->hw.cur + size >= push->hw.max) {
-		int ret = nv50_dmac_wind(dmac);
-		if (ret)
-			return ret;
-
-		push->cur = dmac->push.map.ptr;
-		push->cur = push->cur + push->hw.cur;
-		nv50_dmac_kick(push);
-	}
-
-	if (nvif_msec(dmac->base.device, 2000,
-		if ((free = nv50_dmac_free(dmac)) >= size)
-			break;
-	) < 0) {
-		WARN_ON(1);
-		return -ETIMEDOUT;
-	}
-
-	push->bgn = dmac->push.map.ptr;
-	push->bgn = push->bgn + push->hw.cur;
-	push->cur = push->bgn;
-	push->end = push->cur + free;
-	return 0;
-}
-
-MODULE_PARM_DESC(kms_vram_pushbuf, "Place EVO/NVD push buffers in VRAM (default: auto)");
-static int nv50_dmac_vram_pushbuf = -1;
-module_param_named(kms_vram_pushbuf, nv50_dmac_vram_pushbuf, int, 0400);
-
-int
-nv50_dmac_create(struct nouveau_drm *drm,
-		 const s32 *oclass, u8 head, void *data, u32 size, s64 syncbuf,
-		 struct nv50_dmac *dmac)
-{
-	struct nvif_device *device = &drm->device;
-	struct nvif_object *disp = &drm->display->disp.object;
-	struct nvif_disp_chan_v0 *args = data;
-	u8 type = NVIF_MEM_COHERENT;
-	int ret;
-
-	/* Pascal added support for 47-bit physical addresses, but some
-	 * parts of EVO still only accept 40-bit PAs.
-	 *
-	 * To avoid issues on systems with large amounts of RAM, and on
-	 * systems where an IOMMU maps pages at a high address, we need
-	 * to allocate push buffers in VRAM instead.
-	 *
-	 * This appears to match NVIDIA's behaviour on Pascal.
-	 */
-	if ((nv50_dmac_vram_pushbuf > 0) ||
-	    (nv50_dmac_vram_pushbuf < 0 && device->info.family == NV_DEVICE_INFO_V0_PASCAL))
-		type |= NVIF_MEM_VRAM;
-
-	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000,
-				&dmac->push.mem, &dmac->push.map);
-	if (ret)
-		return ret;
-
-	dmac->push.wait = nv50_dmac_wait;
-	dmac->push.kick = nv50_dmac_kick;
-	dmac->push.bgn = dmac->push.map.ptr;
-	dmac->push.cur = dmac->push.bgn;
-	dmac->push.end = dmac->push.bgn;
-	dmac->push.hw.max = 0x1000/4 - 1;
-
-	/* EVO channels are affected by a HW bug where the last 12 DWORDs
-	 * of the push buffer aren't able to be used safely.
-	 */
-	if (disp->oclass < GV100_DISP)
-		dmac->push.hw.max -= 12;
-
-	args->pushbuf = nvif_handle(&dmac->push.mem.object);
-
-	ret = nv50_chan_create(device, disp, oclass, head, data, size,
-			       &dmac->base);
-	if (ret)
-		return ret;
-
-	if (syncbuf < 0)
-		return 0;
-
-	return ret;
-}
-
 /******************************************************************************
  * Output path helpers
  *****************************************************************************/
@@ -2088,7 +1873,7 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 	core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
 	core->func->update(core, interlock, true);
 	if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
-				       disp->core->chan.base.device))
+				       disp->core->chan.disp->device))
 		NV_ERROR(drm, "core notifier timeout\n");
 
 	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 39aaa385cd6a..db9e4e5070a3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -1,8 +1,6 @@
 #ifndef __NV50_KMS_H__
 #define __NV50_KMS_H__
 #include <linux/workqueue.h>
-#include <nvif/mem.h>
-#include <nvif/push.h>
 
 #include "nouveau_display.h"
 
@@ -54,17 +52,6 @@ void corec37d_ntfy_init(struct nouveau_bo *, u32);
 
 void head907d_olut_load(struct drm_color_lut *, int size, void __iomem *);
 
-struct nv50_chan {
-	struct nvif_object user;
-	struct nvif_device *device;
-};
-
-struct nv50_dmac {
-	struct nv50_chan base;
-
-	struct nvif_push push;
-};
-
 struct nv50_outp_atom {
 	struct list_head head;
 
@@ -81,11 +68,6 @@ struct nv50_outp_atom {
 	} set, clr;
 };
 
-int nv50_dmac_create(struct nouveau_drm *,
-		     const s32 *oclass, u8 head, void *data, u32 size,
-		     s64 syncbuf, struct nv50_dmac *dmac);
-void nv50_dmac_destroy(struct nv50_dmac *);
-
 /*
  * For normal encoders this just returns the encoder. For active MST encoders,
  * this returns the real outp that's driving displays on the topology.
diff --git a/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c b/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
index 752318cf3cf1..05b0d42c85c6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/oimm507b.c
@@ -21,26 +21,28 @@
  */
 #include "oimm.h"
 
-#include <nvif/if0014.h>
-
 static int
 oimm507b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	       s32 oclass, struct nv50_wndw *wndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = wndw->id,
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	int ret;
 
-	ret = nvif_object_ctor(&disp->disp->object, "kmsOvim", 0, oclass,
-			       &args, sizeof(args), &wndw->wimm.base.user);
+	ret = nvif_dispchan_ctor(disp, "kmsChanOvim", wndw->id, oclass, NULL, &wndw->wimm);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.oimm.new(disp->priv, wndw->id, &wndw->wimm.impl, &wndw->wimm.priv);
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wimm);
+done:
 	if (ret) {
 		NV_ERROR(drm, "oimm%04x allocation failed: %d\n", oclass, ret);
 		return ret;
 	}
 
-	nvif_object_map(&wndw->wimm.base.user, NULL, 0);
 	wndw->immd = func;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 4e109c5b5a1b..458c6f9e63f0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -25,7 +25,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
-#include <nvif/if0014.h>
 #include <nvif/push507c.h>
 
 #include <nvhw/class/cl507e.h>
@@ -145,10 +144,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	      struct nouveau_drm *drm, int head, s32 oclass, u32 interlock_data,
 	      struct nv50_wndw **pwndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = head,
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	struct nv50_wndw *wndw;
 	int ret;
 
@@ -159,9 +155,18 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(drm,
-			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->offset, &wndw->wndw);
+	ret = nvif_dispchan_ctor(disp, "kmsChanOvly", wndw->id, oclass, &drm->mmu, &wndw->wndw);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.ovly.new(disp->priv, wndw->id, wndw->wndw.push.mem.priv,
+					&wndw->wndw.impl, &wndw->wndw.priv,
+					nvif_handle(&wndw->wndw.object));
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wndw);
+done:
 	if (ret) {
 		NV_ERROR(drm, "ovly%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index 7985da61aaac..2f4f0ad89b5e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -23,7 +23,6 @@
 #include "atom.h"
 #include "wndw.h"
 
-#include <nvif/if0014.h>
 #include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc37b.h>
@@ -68,14 +67,21 @@ static int
 wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	       s32 oclass, struct nv50_wndw *wndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = wndw->id,
-	};
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	int ret;
 
-	ret = nv50_dmac_create(drm,
-			       &oclass, 0, &args, sizeof(args), -1,
-			       &wndw->wimm);
+	ret = nvif_dispchan_ctor(disp, "kmsChanWimm", wndw->id, oclass, &drm->mmu, &wndw->wimm);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.wimm.new(disp->priv, wndw->id, wndw->wimm.push.mem.priv,
+					&wndw->wimm.impl, &wndw->wimm.priv,
+					nvif_handle(&wndw->wimm.object));
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wimm);
+done:
 	if (ret) {
 		NV_ERROR(drm, "wimm%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 6fb6d2252e15..9cab8d20bc68 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -118,7 +118,7 @@ nv50_wndw_wait_armed(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 	if (asyw->set.ntfy) {
 		return wndw->func->ntfy_wait_begun(disp->sync,
 						   asyw->ntfy.offset,
-						   wndw->wndw.base.device);
+						   wndw->wndw.disp->device);
 	}
 	return 0;
 }
@@ -644,11 +644,11 @@ nv50_wndw_destroy(struct drm_plane *plane)
 		nv50_wndw_ctxdma_del(ctxdma);
 	}
 
-	nv50_dmac_destroy(&wndw->wimm);
+	nvif_dispchan_dtor(&wndw->wimm);
 
 	nvif_object_dtor(&wndw->vram);
 	nvif_object_dtor(&wndw->sync);
-	nv50_dmac_destroy(&wndw->wndw);
+	nvif_dispchan_dtor(&wndw->wndw);
 
 	nv50_lut_fini(&wndw->ilut);
 
@@ -702,10 +702,10 @@ nv50_wndw_ctor(struct nv50_wndw *wndw)
 	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
 	int ret;
 
-	if (!nvif_object_constructed(&wndw->wndw.base.user))
+	if (!wndw->wndw.impl)
 		return 0;
 
-	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
+	ret = nvif_object_ctor(&wndw->wndw.object, "kmsWndwSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
@@ -717,7 +717,7 @@ nv50_wndw_ctor(struct nv50_wndw *wndw)
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwVramCtxDma", NV50_DISP_HANDLE_VRAM,
+	ret = nvif_object_ctor(&wndw->wndw.object, "kmsWndwVramCtxDma", NV50_DISP_HANDLE_VRAM,
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
@@ -754,7 +754,7 @@ nv50_wndw_prep(const struct nv50_wndw_func *func, struct drm_device *dev,
 	wndw->interlock.type = interlock_type;
 	wndw->interlock.data = interlock_data;
 
-	wndw->ctxdma.parent = &wndw->wndw.base.user;
+	wndw->ctxdma.parent = &wndw->wndw.object;
 	INIT_LIST_HEAD(&wndw->ctxdma.list);
 
 	for (nformat = 0; format[nformat]; nformat++);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 66a06e20a6a0..68092e6445fa 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -5,6 +5,8 @@
 #include "atom.h"
 #include "lut.h"
 
+#include <nvif/dispchan.h>
+
 struct nv50_wndw_ctxdma {
 	struct list_head head;
 	struct nvif_object object;
@@ -25,8 +27,8 @@ struct nv50_wndw {
 
 	struct nv50_lut ilut;
 
-	struct nv50_dmac wndw;
-	struct nv50_dmac wimm;
+	struct nvif_dispchan wndw;
+	struct nvif_dispchan wimm;
 
 	struct nvif_object vram;
 	struct nvif_object sync;
@@ -104,9 +106,9 @@ extern const struct nv50_wimm_func curs507a;
 bool curs507a_space(struct nv50_wndw *);
 
 static inline __must_check int
-nvif_chan_wait(struct nv50_dmac *dmac, u32 size)
+nvif_chan_wait(struct nvif_dispchan *chan, u32 size)
 {
-	struct nv50_wndw *wndw = container_of(dmac, typeof(*wndw), wimm);
+	struct nv50_wndw *wndw = container_of(chan, typeof(*wndw), wimm);
 	return curs507a_space(wndw) ? 0 : -ETIMEDOUT;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 5029dfd98443..17751110edae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -25,7 +25,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <nouveau_bo.h>
 
-#include <nvif/if0014.h>
 #include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc37e.h>
@@ -350,10 +349,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	      enum drm_plane_type type, int index, s32 oclass, u32 heads,
 	      struct nv50_wndw **pwndw)
 {
-	struct nvif_disp_chan_v0 args = {
-		.id = index,
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 	struct nv50_wndw *wndw;
 	int ret;
 
@@ -363,9 +359,18 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(drm,
-			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->offset, &wndw->wndw);
+	ret = nvif_dispchan_ctor(disp, "kmsChanWndw", wndw->id, oclass, &drm->mmu, &wndw->wndw);
+	if (ret)
+		goto done;
+
+	ret = disp->impl->chan.wndw.new(disp->priv, wndw->id, wndw->wndw.push.mem.priv,
+					&wndw->wndw.impl, &wndw->wndw.priv,
+					nvif_handle(&wndw->wndw.object));
+	if (ret)
+		goto done;
+
+	ret = nvif_dispchan_oneinit(&wndw->wndw);
+done:
 	if (ret) {
 		NV_ERROR(drm, "qndw%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/dispchan.h b/drivers/gpu/drm/nouveau/include/nvif/dispchan.h
new file mode 100644
index 000000000000..b1d3503e054c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/dispchan.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVIF_DISPCHAN_H__
+#define __NVIF_DISPCHAN_H__
+#include "disp.h"
+#include "push.h"
+
+struct nvif_dispchan {
+	const struct nvif_disp_chan_impl *impl;
+	struct nvif_disp_chan_priv *priv;
+	struct nvif_object object;
+	struct nvif_map map;
+
+	struct nvif_disp *disp;
+	struct nvif_push push;
+};
+
+int nvif_dispchan_ctor(struct nvif_disp *, const char *name, u32 handle, s32 oclass,
+		       struct nvif_mmu *, struct nvif_dispchan *);
+int nvif_dispchan_oneinit(struct nvif_dispchan *);
+void nvif_dispchan_dtor(struct nvif_dispchan *);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e66d29b3db63..60a3529a6594 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -17,6 +17,7 @@ struct nvif_disp_caps_priv;
 struct nvif_conn_priv;
 struct nvif_outp_priv;
 struct nvif_head_priv;
+struct nvif_disp_chan_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -360,6 +361,11 @@ struct nvif_head_impl {
 		      const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
+struct nvif_disp_chan_impl {
+	void (*del)(struct nvif_disp_chan_priv *);
+	struct nvif_mapinfo map;
+};
+
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
@@ -390,14 +396,23 @@ struct nvif_disp_impl {
 	struct {
 		struct nvif_disp_impl_core {
 			s32 oclass;
+			int (*new)(struct nvif_disp_priv *, struct nvif_mem_priv *,
+				   const struct nvif_disp_chan_impl **,
+				   struct nvif_disp_chan_priv **, u64 handle);
 		} core;
 
 		struct nvif_disp_impl_dmac {
 			s32 oclass;
+			int (*new)(struct nvif_disp_priv *, u8 id, struct nvif_mem_priv *,
+				   const struct nvif_disp_chan_impl **,
+				   struct nvif_disp_chan_priv **, u64 handle);
 		} base, ovly, wndw, wimm;
 
 		struct nvif_disp_impl_pioc {
 			s32 oclass;
+			int (*new)(struct nvif_disp_priv *, u8 id,
+				   const struct nvif_disp_chan_impl **,
+				   struct nvif_disp_chan_priv **);
 		} curs, oimm;
 	} chan;
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0014.h b/drivers/gpu/drm/nouveau/include/nvif/if0014.h
deleted file mode 100644
index be0362805106..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0014.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0014_H__
-#define __NVIF_IF0014_H__
-
-union nvif_disp_chan_args {
-	struct nvif_disp_chan_v0 {
-		__u8  version;
-		__u8  id;
-		__u8  pad02[6];
-		__u64 pushbuf;
-	} v0;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push.h b/drivers/gpu/drm/nouveau/include/nvif/push.h
index 8817947a2ea0..275bade7fab9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push.h
@@ -42,7 +42,7 @@ struct nvif_push {
 	u32 *end;
 
 	int (*wait)(struct nvif_push *push, u32 size);
-	void (*kick)(struct nvif_push *push);
+	int (*kick)(struct nvif_push *push);
 };
 
 static inline __must_check int
@@ -62,8 +62,7 @@ PUSH_WAIT(struct nvif_push *push, u32 size)
 static inline int
 PUSH_KICK(struct nvif_push *push)
 {
-	push->kick(push);
-	return 0;
+	return push->kick(push);
 }
 
 #ifdef CONFIG_NOUVEAU_DEBUG_PUSH
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 27c477ed6b9b..771a4b4b3f1d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -117,13 +117,14 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 	*pchan = NULL;
 }
 
-static void
+static int
 nouveau_channel_kick(struct nvif_push *push)
 {
 	struct nouveau_channel *chan = container_of(push, typeof(*chan), chan.push);
 	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur - chan->chan.push.bgn);
 	FIRE_RING(chan);
 	chan->chan.push.bgn = chan->chan.push.cur;
+	return 0;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvif/Kbuild b/drivers/gpu/drm/nouveau/nvif/Kbuild
index b7963a39dd91..8e3ed36df6b3 100644
--- a/drivers/gpu/drm/nouveau/nvif/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvif/Kbuild
@@ -4,6 +4,7 @@ nvif-y += nvif/client.o
 nvif-y += nvif/conn.o
 nvif-y += nvif/device.o
 nvif-y += nvif/disp.o
+nvif-y += nvif/dispchan.o
 nvif-y += nvif/driver.o
 nvif-y += nvif/event.o
 nvif-y += nvif/fifo.o
diff --git a/drivers/gpu/drm/nouveau/nvif/dispchan.c b/drivers/gpu/drm/nouveau/nvif/dispchan.c
new file mode 100644
index 000000000000..fc4f50da1a43
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/dispchan.c
@@ -0,0 +1,205 @@
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved.
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
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <nvif/dispchan.h>
+#include <nvif/device.h>
+#include <nvif/driverif.h>
+#include <nvif/push507c.h>
+#include <nvif/timer.h>
+
+#include <nvif/class.h>
+#include <nvhw/class/cl507c.h>
+
+static int
+nvif_dispchan_kick(struct nvif_push *push)
+{
+	struct nvif_dispchan *chan = container_of(push, typeof(*chan), push);
+
+	push->hw.cur = push->cur - (u32 __iomem *)chan->push.map.ptr;
+	if (push->hw.put != push->hw.cur) {
+		/* Push buffer fetches are not coherent with BAR1, we need to ensure
+		 * writes have been flushed right through to VRAM before writing PUT.
+		 */
+		if (chan->push.mem.type & NVIF_MEM_VRAM) {
+			struct nvif_device *device = chan->disp->device;
+
+			nvif_wr32(&device->object, 0x070000, 0x00000001);
+			nvif_msec(device, 2000,
+				if (!(nvif_rd32(&device->object, 0x070000) & 0x00000002))
+					break;
+			);
+		}
+
+		NVIF_WV32(chan, NV507C, PUT, PTR, push->hw.cur);
+		push->hw.put = push->hw.cur;
+	}
+
+	push->bgn = push->cur;
+	return 0;
+}
+
+static int
+nvif_dispchan_free(struct nvif_dispchan *chan)
+{
+	struct nvif_push *push = &chan->push;
+	u32 get;
+
+	get = NVIF_RV32(chan, NV507C, GET, PTR);
+	if (get > push->hw.cur) /* NVIDIA stay 5 away from GET, do the same. */
+		return get - push->hw.cur - 5;
+
+	return push->hw.max - push->hw.cur;
+}
+
+static int
+nvif_dispchan_wind(struct nvif_dispchan *chan)
+{
+	struct nvif_push *push = &chan->push;
+
+	/* Wait for GET to depart from the beginning of the push buffer to
+	 * prevent writing PUT == GET, which would be ignored by HW.
+	 */
+	u32 get = NVIF_RV32(chan, NV507C, GET, PTR);
+	if (get == 0) {
+		/* Corner-case, HW idle, but non-committed work pending. */
+		if (push->hw.put == 0)
+			nvif_dispchan_kick(&chan->push);
+
+		if (nvif_msec(chan->disp->device, 2000,
+			if (NVIF_TV32(chan, NV507C, GET, PTR, >, 0))
+				break;
+		) < 0)
+			return -ETIMEDOUT;
+	}
+
+	PUSH_RSVD(&chan->push, PUSH_JUMP(&chan->push, 0));
+	push->hw.cur = 0;
+	return 0;
+}
+
+static int
+nvif_dispchan_wait(struct nvif_push *push, u32 size)
+{
+	struct nvif_dispchan *chan = container_of(push, typeof(*chan), push);
+	int free;
+
+	if (WARN_ON(size > push->hw.max))
+		return -EINVAL;
+
+	push->hw.cur = push->cur - (u32 __iomem *)chan->push.map.ptr;
+	if (push->hw.cur + size >= push->hw.max) {
+		int ret = nvif_dispchan_wind(chan);
+		if (ret)
+			return ret;
+
+		push->cur = chan->push.map.ptr;
+		push->cur = push->cur + push->hw.cur;
+		nvif_dispchan_kick(push);
+	}
+
+	if (nvif_msec(chan->disp->device, 2000,
+		if ((free = nvif_dispchan_free(chan)) >= size)
+			break;
+	) < 0) {
+		WARN_ON(1);
+		return -ETIMEDOUT;
+	}
+
+	push->bgn = chan->push.map.ptr;
+	push->bgn = push->bgn + push->hw.cur;
+	push->cur = push->bgn;
+	push->end = push->cur + free;
+	return 0;
+}
+
+void
+nvif_dispchan_dtor(struct nvif_dispchan *chan)
+{
+	if (chan->impl) {
+		chan->impl->del(chan->priv);
+		chan->impl = NULL;
+	}
+
+	nvif_mem_unmap_dtor(&chan->push.mem, &chan->push.map);
+}
+
+int
+nvif_dispchan_oneinit(struct nvif_dispchan *chan)
+{
+	int ret;
+
+	ret = nvif_object_map_cpu(&chan->object, &chan->impl->map, &chan->map);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int
+nvif_dispchan_ctor(struct nvif_disp *disp, const char *name, u32 handle, s32 oclass,
+		   struct nvif_mmu *mmu, struct nvif_dispchan *chan)
+{
+	u8 type = NVIF_MEM_COHERENT;
+	int ret;
+
+	/* PIO channels don't need a push buffer. */
+	chan->push.mem.impl = NULL;
+	chan->impl = NULL;
+	if (!mmu)
+		goto done;
+
+	/* Pascal added support for 47-bit physical addresses, but some
+	 * parts of EVO still only accept 40-bit PAs.
+	 *
+	 * To avoid issues on systems with large amounts of RAM, and on
+	 * systems where an IOMMU maps pages at a high address, we need
+	 * to allocate push buffers in VRAM instead.
+	 *
+	 * This appears to match NVIDIA's behaviour on Pascal.
+	 */
+	if (disp->device->impl->family == NVIF_DEVICE_PASCAL)
+		type |= NVIF_MEM_VRAM;
+
+	ret = nvif_mem_ctor_map(mmu, "nvifDispChanPush", type, 0x1000,
+				&chan->push.mem, &chan->push.map);
+	if (ret)
+		return ret;
+
+	chan->push.hw.cur = 0;
+	chan->push.hw.put = 0;
+	chan->push.hw.max = 0x1000/4 - 1;
+	chan->push.bgn = chan->push.map.ptr;
+	chan->push.cur = chan->push.bgn;
+	chan->push.end = chan->push.bgn;
+	chan->push.wait = nvif_dispchan_wait;
+	chan->push.kick = nvif_dispchan_kick;
+
+	/* EVO channels are affected by a HW bug where the last 12 DWORDs
+	 * of the push buffer aren't able to be used safely.
+	 */
+	if (disp->object.oclass < GV100_DISP)
+		chan->push.hw.max -= 12;
+
+done:
+	nvif_object_ctor(&disp->object, name ?: "nvifDispChan", handle, oclass, &chan->object);
+	chan->disp = disp;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index 86938c633272..3a0366420248 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -19,17 +19,17 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "chan.h"
+#include "uchan.h"
 
 #include <core/oproxy.h>
 #include <core/ramht.h>
 #include <subdev/mmu.h>
 
-#include <nvif/if0014.h>
-
 struct nvif_disp_chan_priv {
 	struct nvkm_object object;
 	struct nvkm_disp_chan chan;
+
+	struct nvif_disp_chan_impl impl;
 };
 
 static int
@@ -49,20 +49,6 @@ nvkm_disp_chan_ntfy(struct nvkm_object *object, u32 type, struct nvkm_event **pe
 	return -EINVAL;
 }
 
-static int
-nvkm_disp_chan_map(struct nvkm_object *object, void *argv, u32 argc,
-		   enum nvkm_object_map *type, u64 *addr, u64 *size)
-{
-	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
-	struct nvkm_disp_chan *chan = &uchan->chan;
-	struct nvkm_device *device = chan->disp->engine.subdev.device;
-	const u64 base = device->func->resource_addr(device, 0);
-
-	*type = NVKM_OBJECT_MAP_IO;
-	*addr = base + chan->func->user(chan, size);
-	return 0;
-}
-
 struct nvkm_disp_chan_object {
 	struct nvkm_oproxy oproxy;
 	struct nvkm_disp *disp;
@@ -136,6 +122,20 @@ nvkm_disp_chan_child_get(struct nvkm_object *object, int index, struct nvkm_ocla
 	return -EINVAL;
 }
 
+static void
+nvkm_disp_chan_del(struct nvif_disp_chan_priv *uchan)
+{
+	struct nvkm_object *object = &uchan->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_disp_chan_impl
+nvkm_disp_chan_impl = {
+	.del = nvkm_disp_chan_del,
+};
+
 static int
 nvkm_disp_chan_fini(struct nvkm_object *object, bool suspend)
 {
@@ -179,42 +179,20 @@ nvkm_disp_chan = {
 	.init = nvkm_disp_chan_init,
 	.fini = nvkm_disp_chan_fini,
 	.ntfy = nvkm_disp_chan_ntfy,
-	.map = nvkm_disp_chan_map,
 	.sclass = nvkm_disp_chan_child_get,
 };
 
-static int
-nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oclass,
-		    void *argv, u32 argc, struct nvkm_object **pobject)
+int
+nvkm_disp_chan_new(struct nvkm_disp *disp, const struct nvkm_disp_func_chan *func, u8 id,
+		   struct nvkm_memory *memory, const struct nvif_disp_chan_impl **pimpl,
+		   struct nvif_disp_chan_priv **ppriv, struct nvkm_object **pobject)
 {
-	const struct nvkm_disp_func_chan *chans[] = {
-		&disp->func->user.core,
-		&disp->func->user.base,
-		&disp->func->user.ovly,
-		&disp->func->user.wndw,
-		&disp->func->user.wimm,
-		&disp->func->user.curs,
-		&disp->func->user.oimm,
-	};
-	const struct nvkm_disp_chan_user *user = NULL;
+	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvif_disp_chan_priv *uchan;
 	struct nvkm_disp_chan *chan;
-	union nvif_disp_chan_args *args = argv;
-	int ret, i;
-
-	for (i = 0; i < ARRAY_SIZE(chans); i++) {
-		if (chans[i]->oclass == oclass->base.oclass) {
-			user = chans[i]->chan;
-			break;
-		}
-	}
-
-	if (WARN_ON(!user))
-		return -EINVAL;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (args->v0.id >= nr || !args->v0.pushbuf != !user->func->push)
+	if (!memory != !func->chan->func->push)
 		return -EINVAL;
 
 	uchan = kzalloc(sizeof(*uchan), GFP_KERNEL);
@@ -222,13 +200,13 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 		return -ENOMEM;
 	chan = &uchan->chan;
 
-	nvkm_object_ctor(&nvkm_disp_chan, oclass, &uchan->object);
-	chan->func = user->func;
-	chan->mthd = user->mthd;
+	nvkm_object_ctor(&nvkm_disp_chan, &(struct nvkm_oclass) {}, &uchan->object);
+	chan->func = func->chan->func;
+	chan->mthd = func->chan->mthd;
 	chan->disp = disp;
-	chan->chid.ctrl = user->ctrl + args->v0.id;
-	chan->chid.user = user->user + args->v0.id;
-	chan->head = args->v0.id;
+	chan->chid.ctrl = func->chan->ctrl + id;
+	chan->chid.user = func->chan->user + id;
+	chan->head = id;
 
 	spin_lock(&disp->user.lock);
 	if (disp->chan[chan->chid.user]) {
@@ -237,48 +215,36 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 		return -EBUSY;
 	}
 	disp->chan[chan->chid.user] = chan;
-	chan->user.oclass = oclass->base.oclass;
+	chan->user.oclass = func->oclass;
 	spin_unlock(&disp->user.lock);
 
 	*pobject = &uchan->object;
 
+	uchan->impl = nvkm_disp_chan_impl;
+	uchan->impl.map.type = NVIF_MAP_IO;
+	uchan->impl.map.handle = device->func->resource_addr(device, 0);
+	uchan->impl.map.handle += chan->func->user(chan, &uchan->impl.map.length);
+
 	if (chan->func->push) {
-		chan->memory = nvkm_umem_search(disp->engine.subdev.device->mmu, uchan->object.client, args->v0.pushbuf);
-		if (IS_ERR(chan->memory))
-			return PTR_ERR(chan->memory);
+		chan->memory = nvkm_memory_ref(memory);
 
 		ret = chan->func->push(chan);
-		if (ret)
+		if (ret) {
+			nvkm_object_del(pobject);
 			return ret;
+		}
 	}
 
-	return 0;
-}
-
-#include "udisp.h"
-int
-nvkm_disp_wndw_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		   struct nvkm_object **pobject)
-{
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
-
-	return nvkm_disp_chan_new_(disp, disp->wndw.nr, oclass, argv, argc, pobject);
-}
-
-int
-nvkm_disp_chan_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		   struct nvkm_object **pobject)
-{
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
+	ret = nvkm_disp_chan_init(&uchan->object);
+	if (ret)
+		goto done;
 
-	return nvkm_disp_chan_new_(disp, disp->head.nr, oclass, argv, argc, pobject);
-}
+	*pimpl = &uchan->impl;
+	*ppriv = uchan;
 
-int
-nvkm_disp_core_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		   struct nvkm_object **pobject)
-{
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
+done:
+	if (ret)
+		nvkm_disp_chan_del(uchan);
 
-	return nvkm_disp_chan_new_(disp, 1, oclass, argv, argc, pobject);
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
index 8c212dde036f..b7d7c435b1e2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
@@ -29,10 +29,6 @@ struct nvkm_disp_chan {
 	} user;
 };
 
-int nvkm_disp_core_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
-int nvkm_disp_chan_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
-int nvkm_disp_wndw_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
-
 struct nvkm_disp_chan_func {
 	int (*push)(struct nvkm_disp_chan *);
 	int (*init)(struct nvkm_disp_chan *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h
new file mode 100644
index 000000000000..f682d2d5e6d3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UDISP_CHAN_H__
+#define __NVKM_UDISP_CHAN_H__
+#include "chan.h"
+#include <nvif/driverif.h>
+
+int nvkm_disp_chan_new(struct nvkm_disp *disp, const struct nvkm_disp_func_chan *, u8 id,
+		       struct nvkm_memory *, const struct nvif_disp_chan_impl **,
+		       struct nvif_disp_chan_priv **, struct nvkm_object **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index dc23fad17b81..bc15fe149a86 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -21,61 +21,112 @@
  */
 #include "udisp.h"
 #include "ucaps.h"
-#include "chan.h"
+#include "uchan.h"
 #include "uconn.h"
 #include "uhead.h"
 #include "uoutp.h"
+#include <subdev/mmu/umem.h>
 
-#include <nvif/class.h>
+static int
+nvkm_udisp_chan_new(struct nvif_disp_priv *udisp, const struct nvkm_disp_func_chan *func,
+		    u8 nr, u8 id, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_memory *memory = NULL;
+	struct nvkm_object *object;
+	int ret;
+
+	if (id >= nr)
+		return -EINVAL;
+
+	if (umem)
+		memory = nvkm_umem_ref(umem);
+
+	ret = nvkm_disp_chan_new(udisp->disp, func, id, memory, pimpl, ppriv, &object);
+	nvkm_memory_unref(&memory);
+	if (ret)
+		return ret;
+
+	if (handle)
+		return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+
+	nvkm_object_link(&udisp->object, object);
+	return 0;
+}
 
 static int
-nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *sclass)
+nvkm_udisp_oimm_new(struct nvif_disp_priv *udisp, u8 id,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv)
 {
-	struct nvkm_disp *disp = container_of(object, struct nvif_disp_priv, object)->disp;
+	struct nvkm_disp *disp = udisp->disp;
 
-	if (disp->func->user.core.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.core.oclass };
-		sclass->ctor = nvkm_disp_core_new;
-		return 0;
-	}
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.oimm, disp->head.nr, id, NULL,
+				   pimpl, ppriv, 0);
+}
 
-	if (disp->func->user.base.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.base.oclass };
-		sclass->ctor = nvkm_disp_chan_new;
-		return 0;
-	}
+static int
+nvkm_udisp_curs_new(struct nvif_disp_priv *udisp, u8 id,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv)
+{
+	struct nvkm_disp *disp = udisp->disp;
 
-	if (disp->func->user.ovly.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.ovly.oclass };
-		sclass->ctor = nvkm_disp_chan_new;
-		return 0;
-	}
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.curs, disp->head.nr, id, NULL,
+				   pimpl, ppriv, 0);
+}
 
-	if (disp->func->user.curs.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.curs.oclass };
-		sclass->ctor = nvkm_disp_chan_new;
-		return 0;
-	}
+static int
+nvkm_udisp_wimm_new(struct nvif_disp_priv *udisp, u8 id, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_disp *disp = udisp->disp;
 
-	if (disp->func->user.oimm.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.oimm.oclass };
-		sclass->ctor = nvkm_disp_chan_new;
-		return 0;
-	}
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.wimm, disp->wndw.nr, id, umem,
+				   pimpl, ppriv, 0);
+}
 
-	if (disp->func->user.wndw.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.wndw.oclass };
-		sclass->ctor = nvkm_disp_wndw_new;
-		return 0;
-	}
+static int
+nvkm_udisp_wndw_new(struct nvif_disp_priv *udisp, u8 id, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_disp *disp = udisp->disp;
 
-	if (disp->func->user.wimm.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.wimm.oclass };
-		sclass->ctor = nvkm_disp_wndw_new;
-		return 0;
-	}
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.wndw, disp->wndw.nr, id, umem,
+				   pimpl, ppriv, handle);
+}
+
+static int
+nvkm_udisp_ovly_new(struct nvif_disp_priv *udisp, u8 id, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_disp *disp = udisp->disp;
+
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.ovly, disp->head.nr, id, umem,
+				   pimpl, ppriv, handle);
+}
+
+static int
+nvkm_udisp_base_new(struct nvif_disp_priv *udisp, u8 id, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_disp *disp = udisp->disp;
+
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.base, disp->head.nr, id, umem,
+				   pimpl, ppriv, handle);
+}
+
+static int
+nvkm_udisp_core_new(struct nvif_disp_priv *udisp, struct nvif_mem_priv *umem,
+		    const struct nvif_disp_chan_impl **pimpl, struct nvif_disp_chan_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_disp *disp = udisp->disp;
 
-	return -EINVAL;
+	return nvkm_udisp_chan_new(udisp, &disp->func->user.core, 1, 0, umem, pimpl, ppriv, handle);
 }
 
 static int
@@ -173,7 +224,6 @@ nvkm_udisp_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_udisp = {
 	.dtor = nvkm_udisp_dtor,
-	.sclass = nvkm_udisp_sclass,
 };
 
 int
@@ -227,17 +277,24 @@ nvkm_udisp_new(struct nvkm_device *device, const struct nvif_disp_impl **pimpl,
 
 	if (disp->func->user.core.oclass) {
 		udisp->impl.chan.core.oclass = disp->func->user.core.oclass;
+		udisp->impl.chan.core.new = nvkm_udisp_core_new;
 		udisp->impl.chan.curs.oclass = disp->func->user.curs.oclass;
+		udisp->impl.chan.curs.new = nvkm_udisp_curs_new;
 
 		if (!disp->func->user.wndw.oclass) {
 			/* EVO */
 			udisp->impl.chan.base.oclass = disp->func->user.base.oclass;
+			udisp->impl.chan.base.new = nvkm_udisp_base_new;
 			udisp->impl.chan.ovly.oclass = disp->func->user.ovly.oclass;
+			udisp->impl.chan.ovly.new = nvkm_udisp_ovly_new;
 			udisp->impl.chan.oimm.oclass = disp->func->user.oimm.oclass;
+			udisp->impl.chan.oimm.new = nvkm_udisp_oimm_new;
 		} else {
 			/* NVDisplay (GV100-) */
 			udisp->impl.chan.wndw.oclass = disp->func->user.wndw.oclass;
+			udisp->impl.chan.wndw.new = nvkm_udisp_wndw_new;
 			udisp->impl.chan.wimm.oclass = disp->func->user.wimm.oclass;
+			udisp->impl.chan.wimm.new = nvkm_udisp_wimm_new;
 		}
 	}
 
-- 
2.41.0

