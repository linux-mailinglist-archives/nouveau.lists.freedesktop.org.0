Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E978A7930
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9FD112FC4;
	Tue, 16 Apr 2024 23:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OgO/rE+W";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7A7112F96
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrE7UwPXUh9qoUWCSUbqAkeCo0TsCArYfGWG6aXuAG+BzTneAvQLLQ7KcLlR+xrFy4ugdGoPVjf6d4fpw5QQ1BQFHosTv5+H2PrQG1f8RxdjJFf9aaPqZqVX2hpj5Hp8aSGqOaql0AOqXQdgUYFqmly7QvG8WUK3ScMZB32JcQ6euJxMcMOBKSufnl3eJ0dp+IEnkgontsqsI5IeKQsBDdqLV+Zk/Mecx+Ksw63dEmy8KYX/lEMLGhD8oEL8X45V3+VtTaUXTaKpT63ZOY+gJZW0XMYKq81QhlbmO41W7Xp1b1Pz7rG3PzfOVPH4eLSWMr2tLbS5lgqm70uVodSWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PesQHeDUNLi5Jqrg7KaCNDmjOEeyQcOf0R6ssSqonDM=;
 b=SxJw+GIVIoRGvZNYzJiqBJxyuW7/p7r/20lTt1saY2n11YweUYsMlR2hL41RsND1mLFHso5AauTPl0ZyEaSkWGhq0G0IY39InVpEkF0Yn7Gjwny5JSwObBkEEtZVuabEeAB8QfGCzygvU3zESfcmylX0zJHq99ASn1fSZ1TbtEr4okvlOpWZMwosOeKR+pFN6uBecArXI/UTon8DZKMyyvMWfuSYLdI+GSJb6OnKT8P+PkrwkU4Eht/uWwJZ49iDdlimEKJu/eXuBrFbubOm3/JR3/dux5dH8iLHHloGsm4ObIBjbfuBlJaLkRtbB3EYwKm/iQkzpLoEPyCLuDHE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PesQHeDUNLi5Jqrg7KaCNDmjOEeyQcOf0R6ssSqonDM=;
 b=OgO/rE+WOl1/wAo8+inLIRMCEcxOJFFP8Sx26TrPgUDeZUx/HTvOX9mdGRCLxShLBOOs5g6+TylQE//i7whE3FB3zMBZhijd6nBuANfq1vOz61O7yrizQs7bFoCudu69TJXDvb8zO1c4J3vlD1gsVxNf8oRcqQths/cE4pyVLEhRSnvZ878CxbOXNbeJyGw8VwYZA8I1Jp/VxPaB7k3Uw98x6yl8gOUHmEUPOvuW8XvasJgN+lBe3zESQpQ8imuowt1g9VR1z4sSaSHjVzWpcvTV9sGzcf6R8SYGKsvgGqcDyuPg82sR1NFr89M9ITaDnb4ZADkt2Vrnw6075qXLDw==
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:20 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::3d) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:19 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:56 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 128/156] drm/nouveau/nvif: rework head "new event" api
Date: Wed, 17 Apr 2024 09:39:34 +1000
Message-ID: <20240416234002.19509-129-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb84d43-4bc5-4374-f797-08dc5e6efefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: od+WkFvAcrIcowAmladKmDOzlakqgALyQeC6DoysWWDV52rPyev1u10bWAcSM+SRKUYCYbOy3/ff8vUNBzc7QgZUQuEcrtSyx5Rj68CPRWOgOc8nOhZuH34LeM4ZmAQ4hAq7wAB8xk1vADi5GbJUs2fytPQMK7rjzOfeK+8bhE+vd/MuStw6JWZK/I6oEVCAXuVRVjGhUTzw847Nc6yepSvmbs0Q6cft4aDmwTe45cGE5h0mOJRsIleeFhyHWgDNcian7rAGWvkMS+EYkvkNP6Kxh2FHeEveFXfWiMpIXg5eEU44TntL2WJ16qlSS7/kh8QlS3Zid0gdAAde+JW9zjWBthhEyRSuDjWA44tCFQbCqeh2T0nv6vLBje6la657jJzeA3zhqE9zdKmbDy1DCW97tqJ1uXtZVBa06HEmEFtcOL/x3zGnoEx4oqkOALWtOb2AX620l4D0eXeH7V98uzZ+RvBHPMjOSVGcbW0xeupGqqN09pfNktOOsLhWqHLR1o0rbL7zfjlNvgETMm2GaI3O3ZnmZr2JOk11EhZa1eJJX4Ix1tnnKxyzVizDKpJ834DXP1RHMWiEEpENYgIb3aHBDESUoE7yhVlXrJl4KvhkDN+aUy+bqYbETzvtob6JhMlGyaDiHpYRChln/rrDVDeegVG9PmJ+Z8xJN9Xzm+ln0sxGlsi/1GF8StW+IENi8mhuTVCTlqO4oWd8tGvdsqArY5mmNpCsb+CySAkYloRpQEi5xNVL6BpzQFESZvGn
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:19.5544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb84d43-4bc5-4374-f797-08dc5e6efefb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 +++
 drivers/gpu/drm/nouveau/include/nvif/if0013.h |  9 ---------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  1 -
 drivers/gpu/drm/nouveau/nvif/head.c           | 15 +++++++++------
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 19 ++++++-------------
 5 files changed, 18 insertions(+), 29 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0013.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 927d0d75dd29..7aa44e4fe729 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -355,6 +355,9 @@ struct nvif_head_impl {
 	int (*scanoutpos)(struct nvif_head_priv *, s64 time[2],
 			  u16 *vblanks, u16 *vblanke, u16 *vtotal, u16 *vline,
 			  u16 *hblanks, u16 *hblanke, u16 *htotal, u16 *hline);
+
+	int (*vblank)(struct nvif_head_priv *, u64 handle,
+		      const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
 struct nvif_disp_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0013.h b/drivers/gpu/drm/nouveau/include/nvif/if0013.h
deleted file mode 100644
index f2b39f86a9cc..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0013.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0013_H__
-#define __NVIF_IF0013_H__
-
-union nvif_head_event_args {
-	struct nvif_head_event_vn {
-	} vn;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 0d2dae7a94d0..3f75c7f33429 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -42,7 +42,6 @@
 
 #include <nvif/class.h>
 #include <nvif/if0011.h>
-#include <nvif/if0013.h>
 #include <dispnv50/crc.h>
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvif/head.c b/drivers/gpu/drm/nouveau/nvif/head.c
index 777f12f3236f..05f56169e6c3 100644
--- a/drivers/gpu/drm/nouveau/nvif/head.c
+++ b/drivers/gpu/drm/nouveau/nvif/head.c
@@ -24,17 +24,20 @@
 #include <nvif/driverif.h>
 #include <nvif/printf.h>
 
-#include <nvif/class.h>
-#include <nvif/if0013.h>
-
 int
 nvif_head_vblank_event_ctor(struct nvif_head *head, const char *name, nvif_event_func func,
 			    bool wait, struct nvif_event *event)
 {
-	int ret = nvif_event_ctor(&head->object, name ?: "nvifHeadVBlank", nvif_head_id(head),
-				  func, wait, NULL, 0, event);
+	int ret;
+
+	ret = head->impl->vblank(head->priv, nvif_handle(&event->object),
+				 &event->impl, &event->priv);
 	NVIF_ERRON(ret, &head->object, "[NEW EVENT:VBLANK]");
-	return ret;
+	if (ret)
+		return ret;
+
+	nvif_event_ctor(&head->object, name ?: "nvifHeadVblank", nvif_head_id(head), func, event);
+	return 0;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
index ebf72333ae99..0ad97094a8c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
@@ -22,8 +22,6 @@
 #include "uhead.h"
 #include <core/event.h>
 
-#include <nvif/if0013.h>
-
 #include <nvif/event.h>
 
 struct nvif_head_priv {
@@ -32,18 +30,13 @@ struct nvif_head_priv {
 };
 
 static int
-nvkm_uhead_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
+nvkm_uhead_vblank(struct nvif_head_priv *uhead, u64 handle,
+		  const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
 {
-	struct nvkm_head *head = container_of(object, struct nvif_head_priv, object)->head;
-	union nvif_head_event_args *args = argv;
-
-	if (!uevent)
-		return 0;
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
+	struct nvkm_head *head = uhead->head;
 
-	return nvkm_uevent_add(uevent, &head->disp->vblank, head->id,
-			       NVKM_DISP_HEAD_EVENT_VBLANK, NULL);
+	return nvkm_uevent_new_(&uhead->object, handle, &head->disp->vblank, false, head->id,
+				NVKM_DISP_HEAD_EVENT_VBLANK, NULL, pimpl, ppriv);
 }
 
 static int
@@ -86,6 +79,7 @@ static const struct nvif_head_impl
 nvkm_uhead_impl = {
 	.del = nvkm_uhead_del,
 	.scanoutpos = nvkm_uhead_scanoutpos,
+	.vblank = nvkm_uhead_vblank,
 };
 
 static void *
@@ -103,7 +97,6 @@ nvkm_uhead_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uhead = {
 	.dtor = nvkm_uhead_dtor,
-	.uevent = nvkm_uhead_uevent,
 };
 
 int
-- 
2.41.0

