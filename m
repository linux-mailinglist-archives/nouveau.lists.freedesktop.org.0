Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB978A78DC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330A2112F50;
	Tue, 16 Apr 2024 23:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kqf5/5bE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784F112F4A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds+cwg2pkPJIl9EPX8MHOG1nYr27oZo8j6gvq2/NE0EA/yiEiVHtytIcYHD0tcNKo7/knZbnXXWvjOarUVEd6UD9o+NlQVQZzcIcGgMSRGf0OCmFt0Xnm+fWc+wBD1/BQQigmKVWQr+Z6w+zi5A9cNvz2wZG5uP07aOmPWl5z8GJXFEWCpjJpcxVWnQQYrXrZKJRk+vWgnMDLM+/kxe0SuA0dWANO0nDXpaYw9uh90+w9/3Xhb2N/2RvNho2sHBHIsJQNG/9YP51mCqlhxooL4vrUFVlQe6J4jtqpU1JjOgyvKrtvvmxfws4FcaBTsWm0GKx55iFODXEtLyaxq1ZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOCrCo8Uln/9wLfiPhyxPmo5pELczNp94TKru/yHQX0=;
 b=Db6bd8/tuodsGHk+6kHoWfbYWJiemBvUnMDbRmVLnrb5loIF1jWGpZpMggjEmh+X/J2Dv/U8oTvcZ57mw6n9u/xeStmntDGSBhX1qeDLPNjm55fBfkDaaTtjZFz7A4nyLCYLCZPs/ooZloWROPusJDjybOjbSDfA27oNoRaZN9Oc45x+Su9htL+LpxLOeF1ZJtbc2CRgGRXxY7gFeYKfnTzW9yECcuAfA3z0QuG9Ub/2JkMEzWSpmxkCtMhQPOtKQr1QGvbqx4KkDL3qEqo4xwSHkLV13FJetPv9rDpxbLxg2qxu5k3govzqJlr4YjFLMgb/3vrhK2YPETr+XBvmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOCrCo8Uln/9wLfiPhyxPmo5pELczNp94TKru/yHQX0=;
 b=Kqf5/5bEEg8BihnrR/T2LYCUa5so53JHfWNn/7GSXAbNRgZYpMuBBEdzQaqFvPUKHNPD60Tns0QmeHIeO+lMgncTsIYqvEu44lSFZZbmrj/CVnnCctC6iNeeYlYX+bUE5bxeKTkjs9dTyvGKeoUBI6vVsKYdaRbc/6dLTTioY6p/WGCjbfRAQSX0jJiqRc2nLf4a+Yht10dIa47Kiq6+N4qam7VjVq+kaDsfbdMaRSChC5jeJEiux7mbPy8M/iSgLAnD2fGShfgNGxY6NiD2vYhOHOUxqeHmYIG4mtOo/MOOpF4nQwMKM2v4ckwyeN6ODQqTUsdWQCEf3xLnJuvvnQ==
Received: from DM6PR07CA0050.namprd07.prod.outlook.com (2603:10b6:5:74::27) by
 SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:41:41 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::c) by DM6PR07CA0050.outlook.office365.com
 (2603:10b6:5:74::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:24 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 047/156] drm/nouveau/nvkm: detach user handling from nvkm_disp
Date: Wed, 17 Apr 2024 09:38:13 +1000
Message-ID: <20240416234002.19509-48-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SA1PR12MB8886:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cccd4d6-29c0-4f9f-01ca-08dc5e6ec449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTqpcK+LXheJYzePfxZOD234Y+3dTONbipxBkM6zpj3oL5G3nulDPxkgRXcG?=
 =?us-ascii?Q?pV3FImDzPOmFFFQcO+CFm/1O3+7Ox3Vp1eAD2s/3U2aZaAsRktDCGWayU6Sv?=
 =?us-ascii?Q?JNaylxpVnfeIc9GtOTHGggsNIPKoYzl9mE5g+2lsjkqrd9PPTsr/uAdDL1Un?=
 =?us-ascii?Q?n/dZ4tXCU4X8z9KD6m2A4c/ofiUXggpjL8Brh9Cw16IZPaf3YCUbDnLJqqmE?=
 =?us-ascii?Q?vDvg441XEyflXnr3WQfxn7ephd4ypWMcSwzF05HzuzH+gHN/exo2rig13cka?=
 =?us-ascii?Q?xSxoRa6fAz/ONHLRD98keFwF1eTjOwcGKNm2XfxinyArrYb6gwDTvdIidFco?=
 =?us-ascii?Q?md89WDXyFPOWFjnTi/4PZun7EEdjiOJyaoQwJVu0J/MEPzNhEWNmx0y5M5nJ?=
 =?us-ascii?Q?FCja1Q/4Tzw4hPm3QupPmGUbfT3sBt+qpOmwcs9XRldnvCWzcO3lkRP3dUHr?=
 =?us-ascii?Q?X4GIFxW8JCDlYqXD21srg69PftryegKDf9nu27vzzYMgBzZV9ns/MrypR0Gc?=
 =?us-ascii?Q?m/PS0sPXg5q4cIr2Vm7ab19754QQ20w8ZqgqkAXyyPOjADfyIjA5+01rMMNf?=
 =?us-ascii?Q?wSOd1tyO0tZpz9SOIe4RMJTqeXGriOcZlg57jEYabMxaQyVg7/CDq/fsN8rH?=
 =?us-ascii?Q?LxrO0u9VQAblzJdtEkcGdyuE7gkE2DqqRlKKhewulTcxXlrifLmXUNNVBzOf?=
 =?us-ascii?Q?BIcLvqJvhj4BsdOzQLqZorcyXk1IAlQcGHZZ5SBHNM+yvipbunxnxEhH3gDN?=
 =?us-ascii?Q?w7hQ1wuNoRO9mA7BkrCUHP2w/grnmwrXckEq2Qc3SXNqG5rMPMHmazeamBR1?=
 =?us-ascii?Q?wIKyQruTqBEt0jqMG8GHEWjXsA6pTEf3BUb6hx5ouCJRKDI9EWakL1EfGOWu?=
 =?us-ascii?Q?Qy8hs7jeXhB0QVioBC6q+LcoRZeGoC3rsxr/S5GiyGKN4rh9Kl2Fpy+eyZmt?=
 =?us-ascii?Q?vtN5bUGcg9iIpJNgVa+WoH0NhbHBnmajZycLvIbDy8st0uZRCkRMjRgyz98A?=
 =?us-ascii?Q?+QHYcNRNSEvQBGXL9ljgv1Q/G9/9BspcLLZsFBIhX3gVW6SoOxYQQj8MdnAJ?=
 =?us-ascii?Q?GJd4qzraXFhgN64JaqKYuBORE/gblb87cLuR7vv9Jgt+97Ab8gz52kD9ZYpD?=
 =?us-ascii?Q?PnzSaxoYWWW3CbbdATk4nRGLXM6EPqIExTCsDFH453mQIDp+ZGcbyJbcI9W7?=
 =?us-ascii?Q?XvFsgNwZvjXr5B6AVdv1jZ+tO5iDvxcou5ED4xpbXrwOwePa8itEYUc6JFkO?=
 =?us-ascii?Q?WTOmAIG2mxP73sXJno2iTHHx9Mz1odlYPEEdyaW596dMANSThnZHidXi/NFv?=
 =?us-ascii?Q?1IAfI4XlnYZQg3N2x4/l1ya5t8cUFQTFoPviPv2ROqx+Efl8+zsk3UKc25EZ?=
 =?us-ascii?Q?TdgOCdw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:41.0737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cccd4d6-29c0-4f9f-01ca-08dc5e6ec449
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886
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

- preparation for upcoming patches
- open-code current nvkm_udisp() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/engine/disp.h    |  4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 17 +++++----
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |  3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  1 -
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 11 +++---
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 37 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.h  | 11 ++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 11 +++---
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 11 +++---
 10 files changed, 66 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index 3e8db8280e2a..e954c36630f0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -65,8 +65,8 @@ struct nvkm_disp {
 
 	struct {
 		spinlock_t lock;
-		struct nvkm_object object;
-	} client;
+		bool allocated;
+	} user;
 };
 
 int nv04_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index b24eb1e560bc..e93646d53378 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -240,7 +240,7 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, struct nvkm_device *device,
 	INIT_LIST_HEAD(&disp->iors);
 	INIT_LIST_HEAD(&disp->outps);
 	INIT_LIST_HEAD(&disp->conns);
-	spin_lock_init(&disp->client.lock);
+	spin_lock_init(&disp->user.lock);
 
 	ret = nvkm_engine_ctor(&nvkm_disp, device, type, inst, true, &disp->engine);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index 4e43ee383c34..25fe9946957f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -152,10 +152,10 @@ nvkm_disp_chan_dtor(struct nvkm_object *object)
 	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
 	struct nvkm_disp *disp = chan->disp;
 
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	if (disp->chan[chan->chid.user] == chan)
 		disp->chan[chan->chid.user] = NULL;
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 
 	nvkm_memory_unref(&chan->memory);
 	return chan;
@@ -213,21 +213,22 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 			return ret;
 	}
 
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	if (disp->chan[chan->chid.user]) {
-		spin_unlock(&disp->client.lock);
+		spin_unlock(&disp->user.lock);
 		return -EBUSY;
 	}
 	disp->chan[chan->chid.user] = chan;
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return 0;
 }
 
+#include "udisp.h"
 int
 nvkm_disp_wndw_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		   struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 
 	return nvkm_disp_chan_new_(disp, disp->wndw.nr, oclass, argv, argc, pobject);
 }
@@ -236,7 +237,7 @@ int
 nvkm_disp_chan_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		   struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 
 	return nvkm_disp_chan_new_(disp, disp->head.nr, oclass, argv, argc, pobject);
 }
@@ -245,7 +246,7 @@ int
 nvkm_disp_core_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		   struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 
 	return nvkm_disp_chan_new_(disp, 1, oclass, argv, argc, pobject);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index cfa3698d3a2f..5787fd26e5c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -815,11 +815,12 @@ gv100_disp_caps = {
 	.map = gv100_disp_caps_map,
 };
 
+#include "udisp.h"
 int
 gv100_disp_caps_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		    struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct gv100_disp_caps *caps;
 
 	if (!(caps = kzalloc(sizeof(*caps), GFP_KERNEL)))
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index a3fd7cb7c488..6f0b119dfd90 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVKM_DISP_PRIV_H__
 #define __NVKM_DISP_PRIV_H__
-#define nvkm_udisp(p) container_of((p), struct nvkm_disp, client.object)
 #include <engine/disp.h>
 #include <core/enum.h>
 struct nvkm_head;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..5e44ec977d42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -154,9 +154,9 @@ nvkm_uconn_dtor(struct nvkm_object *object)
 	struct nvkm_conn *conn = nvkm_uconn(object);
 	struct nvkm_disp *disp = conn->disp;
 
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	conn->object.func = NULL;
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return NULL;
 }
 
@@ -166,10 +166,11 @@ nvkm_uconn = {
 	.uevent = nvkm_uconn_uevent,
 };
 
+#include "udisp.h"
 int
 nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_conn *cont, *conn = NULL;
 	union nvif_conn_args *args = argv;
 	int ret;
@@ -188,7 +189,7 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		return -EINVAL;
 
 	ret = -EBUSY;
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	if (!conn->object.func) {
 		switch (conn->info.type) {
 		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
@@ -220,6 +221,6 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		*pobject = &conn->object;
 		ret = 0;
 	}
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 0268d1d75805..272d6a040a51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include "udisp.h"
 #include "conn.h"
 #include "head.h"
 #include "outp.h"
@@ -30,7 +30,7 @@
 static int
 nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *sclass)
 {
-	struct nvkm_disp *disp = nvkm_udisp(object);
+	struct nvkm_disp *disp = container_of(object, struct nvif_disp_priv, object)->disp;
 
 	if (index-- == 0) {
 		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_CONN };
@@ -62,13 +62,13 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 static void *
 nvkm_udisp_dtor(struct nvkm_object *object)
 {
-	struct nvkm_disp *disp = nvkm_udisp(object);
+	struct nvif_disp_priv *udisp = container_of(object, typeof(*udisp), object);
+	struct nvkm_disp *disp = udisp->disp;
 
-	spin_lock(&disp->client.lock);
-	if (object == &disp->client.object)
-		disp->client.object.func = NULL;
-	spin_unlock(&disp->client.lock);
-	return NULL;
+	spin_lock(&disp->user.lock);
+	disp->user.allocated = false;
+	spin_unlock(&disp->user.lock);
+	return udisp;
 }
 
 static const struct nvkm_object_func
@@ -85,18 +85,27 @@ nvkm_udisp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	struct nvkm_outp *outp;
 	struct nvkm_head *head;
 	union nvif_disp_args *args = argv;
+	struct nvif_disp_priv *udisp;
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
 
-	spin_lock(&disp->client.lock);
-	if (disp->client.object.func) {
-		spin_unlock(&disp->client.lock);
+	udisp = kzalloc(sizeof(*udisp), GFP_KERNEL);
+	if (!udisp)
+		return -ENOMEM;
+
+	spin_lock(&disp->user.lock);
+	if (disp->user.allocated) {
+		spin_unlock(&disp->user.lock);
+		kfree(udisp);
 		return -EBUSY;
 	}
-	nvkm_object_ctor(&nvkm_udisp, oclass, &disp->client.object);
-	*pobject = &disp->client.object;
-	spin_unlock(&disp->client.lock);
+	disp->user.allocated = true;
+	spin_unlock(&disp->user.lock);
+
+	nvkm_object_ctor(&nvkm_udisp, oclass, &udisp->object);
+	udisp->disp = disp;
+	*pobject = &udisp->object;
 
 	args->v0.conn_mask = 0;
 	list_for_each_entry(conn, &disp->conns, head)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
new file mode 100644
index 000000000000..2918ecbca5d3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UDISP_H__
+#define __NVKM_UDISP_H__
+#include <core/object.h>
+#include "priv.h"
+
+struct nvif_disp_priv {
+	struct nvkm_object object;
+	struct nvkm_disp *disp;
+};
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
index f072cec16040..89e9b61914d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
@@ -89,9 +89,9 @@ nvkm_uhead_dtor(struct nvkm_object *object)
 	struct nvkm_head *head = nvkm_uhead(object);
 	struct nvkm_disp *disp = head->disp;
 
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	head->object.func = NULL;
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return NULL;
 }
 
@@ -102,10 +102,11 @@ nvkm_uhead = {
 	.uevent = nvkm_uhead_uevent,
 };
 
+#include "udisp.h"
 int
 nvkm_uhead_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_head *head;
 	union nvif_head_args *args = argv;
 	int ret;
@@ -116,12 +117,12 @@ nvkm_uhead_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		return -EINVAL;
 
 	ret = -EBUSY;
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	if (!head->object.func) {
 		nvkm_object_ctor(&nvkm_uhead, oclass, &head->object);
 		*pobject = &head->object;
 		ret = 0;
 	}
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0cef84..75669d5f8a42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -570,9 +570,9 @@ nvkm_uoutp_dtor(struct nvkm_object *object)
 	struct nvkm_outp *outp = nvkm_uoutp(object);
 	struct nvkm_disp *disp = outp->disp;
 
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	outp->object.func = NULL;
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return NULL;
 }
 
@@ -582,10 +582,11 @@ nvkm_uoutp = {
 	.mthd = nvkm_uoutp_mthd,
 };
 
+#include "udisp.h"
 int
 nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_udisp(oclass->parent);
+	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_outp *outt, *outp = NULL;
 	union nvif_outp_args *args = argv;
 	int ret;
@@ -604,7 +605,7 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		return -EINVAL;
 
 	ret = -EBUSY;
-	spin_lock(&disp->client.lock);
+	spin_lock(&disp->user.lock);
 	if (!outp->object.func) {
 		switch (outp->info.type) {
 		case DCB_OUTPUT_ANALOG:
@@ -660,6 +661,6 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	}
 
 done:
-	spin_unlock(&disp->client.lock);
+	spin_unlock(&disp->user.lock);
 	return ret;
 }
-- 
2.41.0

