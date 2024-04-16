Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A419B8A78E1
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B3112F58;
	Tue, 16 Apr 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dmzl5rQ2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C034C112F51
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7ZCYEmyKXzA8Qo/DCGlnPFaxTj0JaMQK/g3XfWGTQkXHXi3vl6Jb1nj1cGbTMIW5VYlr3UjT1yGAmS9O1+E2OQ2lAX4Bl2PEtfJ5OV7pielnIpuFfN1zTw603imL2PXPJngAvaXrCLRefGVRUWWdFxX1XBg3gd207xH1cx6XkEVW+X9JmlCMnaTSFNzGicyXFlHQhEMEcL6RU3kQzFH2jUdqgiRz2PIR5k1XC57EraRTogLFzGeSPJ1iQT41Q1ZgV7we9P0ZExNbqcTvZ6E7zkEFO2fNoJZYmM9KZefta1SaRtOQ41eqPGc/SwsfamNy+zf9D/HR8ekeQMtEp27hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTYuv3wDPvdr0l4s/eVsZleUewMsXJC5i4g27HYUSeE=;
 b=LDtsaOiWNa6SZzMLTb9hk/RXAWQ4X25MY8SoekaaX34Jf0wisEGRitjv7VrUQH+yG0rGK08PHYNLohEKC6CDLJLQHsrS74NOXxKn6POk5rIDAipHn66Fes8lqkjWCyATnyICZ6uOw0KvLiiEmWz3EVOYToh6L3O8J6FMEvBbNhYYL0sb4MI6DswwTk1sQ+B8jbKhRfURMEFNjnGU5CRcCK1pZDhscKPgLHlW3nUpr1Teg9zmVcR/s7GbGgVica0TnYXSQoIvi8/xeeOIX0cvj5ULAwtW7AcZL5ms22ow9mF0JknJhJenBLk+Yeu2lCVKo2jthbxIPTYRY7mgGyVOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTYuv3wDPvdr0l4s/eVsZleUewMsXJC5i4g27HYUSeE=;
 b=Dmzl5rQ2NyKr7vmWH1zkLAwhNczuDCR6+RVcOInrMs+rRL1aMFzqpt+8u7JXiZDRZ0VKOP+nVerFnusEmbLr0D7L1vrSMRxvt0ZSaYvgHFbM20EJPGPVM3rhOcGl+w53gTKqN2He7zfWgVXn6zG60QydkqjvoToJvy/XAgqEnBhkvQqi7U1MidWzQhOsZiqpdTGC/6OTSYjtyyTtFbZRczWiY/FRCwFZ+/nxLZeCFGy6wga73GglE90KMOcp6/gpPTFep7wmUfLqkbzedOYa2qxdqbMnxWXFBoqNzS9ViqTa9zmLYSMgeMuGOf/hzVfA5i3xsDoxBSiet7ye5b6pbA==
Received: from DM6PR02CA0046.namprd02.prod.outlook.com (2603:10b6:5:177::23)
 by DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:45 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::14) by DM6PR02CA0046.outlook.office365.com
 (2603:10b6:5:177::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:29 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 051/156] drm/nouveau/nvkm: detach user handling from
 nvkm_disp_chan
Date: Wed, 17 Apr 2024 09:38:17 +1000
Message-ID: <20240416234002.19509-52-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: efbc15fd-81e1-4262-6ea9-08dc5e6ec6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wol1MFbAvk2IgeCeKfwTUcdXUyw2dM+xEpRkgRauggBTzh4AP6JDwJAq2bDoXtKRMQ2QZbWkkuY9tyJZ5/tZFiXe+BBGRta1fONLaBBFVokN3B8otWipecbVyqjNWQKI+oC8NbS0e4HeW+n3X1YDI6WxkQ2pI10frFv4MOWh/IXD6unSOC8+Yl/d45/3Kztl6N1DHtGdFQDauGnpAxkpIpoULpUKRb+QIPwNO2v3PZABuJl1zIncjQ4UGT0lPsnnvrhjST8jtBVo82XM9xBeziiR6EKjlwzWfv1haTixvNIj856WvKITeK1OaDkuZAf5WkrqdwOGc5u3yv8vRStajd1MPhi27tGAZWzRADF0/LEPyqlf0m0KC+nmNWugyX+H3FF4uJ43S7ZgFdnmhsQJk6oSjGcZuF35dzu+vE508laS5/kcmGGhy72SVLM12Knv62G0GgnETHcCV3/TyblXUwmMyP4tX+DhxCJOgxqnjXS60u7aH4TnZe8tGwQ4orbWjxoovK1E+8tQdAhlk2iEQF3xcn0BrRc0J91CoiBOZxavzTEBxUsoZi9268F9Mqetknwk0PFpVh017fflkzwac6Ce15AlOoBVbt2oQNRaA9u6kNCawbh/ejo4uGBjKX8WLm/dZD+HliCW8SCpmZJARr8zDJaFgcJWushprolrR7o3P1OBiHFUT1Og76Jp9LxVrQ+K/oo/kqz1pdVeQviP4Couzd5JWYX2LaN3GNyq9LSFWFG+iFV4lrdVdawH3sUS
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:45.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efbc15fd-81e1-4262-6ea9-08dc5e6ec6d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
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
- open-code current nvkm_disp_chan() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 63 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   | 11 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |  7 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 20 +++---
 4 files changed, 58 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index 25fe9946957f..b34615dcc8eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -23,14 +23,20 @@
 
 #include <core/oproxy.h>
 #include <core/ramht.h>
+#include <subdev/mmu.h>
 
 #include <nvif/if0014.h>
 
+struct nvif_disp_chan_priv {
+	struct nvkm_object object;
+	struct nvkm_disp_chan chan;
+};
+
 static int
 nvkm_disp_chan_ntfy(struct nvkm_object *object, u32 type, struct nvkm_event **pevent)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
-	struct nvkm_disp *disp = chan->disp;
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp *disp = uchan->chan.disp;
 
 	switch (type) {
 	case 0:
@@ -47,7 +53,8 @@ static int
 nvkm_disp_chan_map(struct nvkm_object *object, void *argv, u32 argc,
 		   enum nvkm_object_map *type, u64 *addr, u64 *size)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 	struct nvkm_device *device = chan->disp->engine.subdev.device;
 	const u64 base = device->func->resource_addr(device, 0);
 
@@ -79,7 +86,8 @@ static int
 nvkm_disp_chan_child_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 			 struct nvkm_object **pobject)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(oclass->parent);
+	struct nvif_disp_chan_priv *uchan = container_of(oclass->parent, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 	struct nvkm_disp *disp = chan->disp;
 	struct nvkm_device *device = disp->engine.subdev.device;
 	const struct nvkm_device_oclass *sclass = oclass->priv;
@@ -106,7 +114,8 @@ nvkm_disp_chan_child_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 static int
 nvkm_disp_chan_child_get(struct nvkm_object *object, int index, struct nvkm_oclass *sclass)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 	struct nvkm_device *device = chan->disp->engine.subdev.device;
 	const struct nvkm_device_oclass *oclass = NULL;
 
@@ -130,7 +139,8 @@ nvkm_disp_chan_child_get(struct nvkm_object *object, int index, struct nvkm_ocla
 static int
 nvkm_disp_chan_fini(struct nvkm_object *object, bool suspend)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 
 	chan->func->fini(chan);
 	chan->func->intr(chan, false);
@@ -140,7 +150,8 @@ nvkm_disp_chan_fini(struct nvkm_object *object, bool suspend)
 static int
 nvkm_disp_chan_init(struct nvkm_object *object)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 
 	chan->func->intr(chan, true);
 	return chan->func->init(chan);
@@ -149,16 +160,17 @@ nvkm_disp_chan_init(struct nvkm_object *object)
 static void *
 nvkm_disp_chan_dtor(struct nvkm_object *object)
 {
-	struct nvkm_disp_chan *chan = nvkm_disp_chan(object);
+
+	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
+	struct nvkm_disp_chan *chan = &uchan->chan;
 	struct nvkm_disp *disp = chan->disp;
 
 	spin_lock(&disp->user.lock);
-	if (disp->chan[chan->chid.user] == chan)
-		disp->chan[chan->chid.user] = NULL;
+	disp->chan[chan->chid.user] = NULL;
 	spin_unlock(&disp->user.lock);
 
 	nvkm_memory_unref(&chan->memory);
-	return chan;
+	return uchan;
 }
 
 static const struct nvkm_object_func
@@ -176,6 +188,7 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 		    void *argv, u32 argc, struct nvkm_object **pobject)
 {
 	const struct nvkm_disp_chan_user *user = NULL;
+	struct nvif_disp_chan_priv *uchan;
 	struct nvkm_disp_chan *chan;
 	union nvif_disp_chan_args *args = argv;
 	int ret, i;
@@ -195,11 +208,12 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 	if (args->v0.id >= nr || !args->v0.pushbuf != !user->func->push)
 		return -EINVAL;
 
-	if (!(chan = kzalloc(sizeof(*chan), GFP_KERNEL)))
+	uchan = kzalloc(sizeof(*uchan), GFP_KERNEL);
+	if (!uchan)
 		return -ENOMEM;
-	*pobject = &chan->object;
+	chan = &uchan->chan;
 
-	nvkm_object_ctor(&nvkm_disp_chan, oclass, &chan->object);
+	nvkm_object_ctor(&nvkm_disp_chan, oclass, &uchan->object);
 	chan->func = user->func;
 	chan->mthd = user->mthd;
 	chan->disp = disp;
@@ -207,19 +221,28 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 	chan->chid.user = user->user + args->v0.id;
 	chan->head = args->v0.id;
 
-	if (chan->func->push) {
-		ret = chan->func->push(chan, args->v0.pushbuf);
-		if (ret)
-			return ret;
-	}
-
 	spin_lock(&disp->user.lock);
 	if (disp->chan[chan->chid.user]) {
 		spin_unlock(&disp->user.lock);
+		kfree(uchan);
 		return -EBUSY;
 	}
 	disp->chan[chan->chid.user] = chan;
+	chan->user.oclass = oclass->base.oclass;
 	spin_unlock(&disp->user.lock);
+
+	*pobject = &uchan->object;
+
+	if (chan->func->push) {
+		chan->memory = nvkm_umem_search(uchan->object.client, args->v0.pushbuf);
+		if (IS_ERR(chan->memory))
+			return PTR_ERR(chan->memory);
+
+		ret = chan->func->push(chan);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
index 020290510157..8c212dde036f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVKM_DISP_CHAN_H__
 #define __NVKM_DISP_CHAN_H__
-#define nvkm_disp_chan(p) container_of((p), struct nvkm_disp_chan, object)
 #include <core/object.h>
 #include "priv.h"
 
@@ -16,8 +15,6 @@ struct nvkm_disp_chan {
 	} chid;
 	int head;
 
-	struct nvkm_object object;
-
 	struct nvkm_memory *memory;
 	u64 push;
 
@@ -26,6 +23,10 @@ struct nvkm_disp_chan {
 	struct {
 		struct nvkm_gsp_object object;
 	} rm;
+
+	struct {
+		s32 oclass;
+	} user;
 };
 
 int nvkm_disp_core_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
@@ -33,7 +34,7 @@ int nvkm_disp_chan_new(const struct nvkm_oclass *, void *, u32, struct nvkm_obje
 int nvkm_disp_wndw_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 
 struct nvkm_disp_chan_func {
-	int (*push)(struct nvkm_disp_chan *, u64 object);
+	int (*push)(struct nvkm_disp_chan *);
 	int (*init)(struct nvkm_disp_chan *);
 	void (*fini)(struct nvkm_disp_chan *);
 	void (*intr)(struct nvkm_disp_chan *, bool en);
@@ -45,7 +46,7 @@ void nv50_disp_chan_intr(struct nvkm_disp_chan *, bool);
 u64 nv50_disp_chan_user(struct nvkm_disp_chan *, u64 *);
 extern const struct nvkm_disp_chan_func nv50_disp_pioc_func;
 extern const struct nvkm_disp_chan_func nv50_disp_dmac_func;
-int nv50_disp_dmac_push(struct nvkm_disp_chan *, u64);
+int nv50_disp_dmac_push(struct nvkm_disp_chan *);
 int nv50_disp_dmac_bind(struct nvkm_disp_chan *, struct nvkm_object *, u32);
 extern const struct nvkm_disp_chan_func nv50_disp_core_func;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 03a5f88a4b99..682628fe5b20 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -37,7 +37,6 @@
 #include <subdev/bios/pll.h>
 #include <subdev/devinit.h>
 #include <subdev/i2c.h>
-#include <subdev/mmu.h>
 #include <subdev/timer.h>
 
 #include <nvif/class.h>
@@ -681,12 +680,8 @@ nv50_disp_dmac_init(struct nvkm_disp_chan *chan)
 }
 
 int
-nv50_disp_dmac_push(struct nvkm_disp_chan *chan, u64 object)
+nv50_disp_dmac_push(struct nvkm_disp_chan *chan)
 {
-	chan->memory = nvkm_umem_search(chan->object.client, object);
-	if (IS_ERR(chan->memory))
-		return PTR_ERR(chan->memory);
-
 	if (nvkm_memory_size(chan->memory) < 0x1000)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 027867c2a8c5..f94858bc64f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -53,7 +53,7 @@
 static u64
 r535_chan_user(struct nvkm_disp_chan *chan, u64 *psize)
 {
-	switch (chan->object.oclass & 0xff) {
+	switch (chan->user.oclass & 0xff) {
 	case 0x7d: *psize = 0x10000; return 0x680000;
 	case 0x7e: *psize = 0x01000; return 0x690000 + (chan->head * *psize);
 	case 0x7b: *psize = 0x01000; return 0x6b0000 + (chan->head * *psize);
@@ -111,9 +111,9 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 		ctrl->limit = nvkm_memory_size(chan->memory) - 1;
 	}
 
-	ctrl->hclass = chan->object.oclass;
+	ctrl->hclass = chan->user.oclass;
 	ctrl->channelInstance = chan->head;
-	ctrl->valid = ((chan->object.oclass & 0xff) != 0x7a) ? 1 : 0;
+	ctrl->valid = ((chan->user.oclass & 0xff) != 0x7a) ? 1 : 0;
 
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
@@ -129,8 +129,8 @@ r535_curs_init(struct nvkm_disp_chan *chan)
 		return ret;
 
 	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
-				     (chan->object.oclass << 16) | chan->head,
-				     chan->object.oclass, sizeof(*args), &chan->rm.object);
+				     (chan->user.oclass << 16) | chan->head,
+				     chan->user.oclass, sizeof(*args), &chan->rm.object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
 
@@ -182,8 +182,8 @@ r535_dmac_init(struct nvkm_disp_chan *chan)
 		return ret;
 
 	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
-				     (chan->object.oclass << 16) | chan->head,
-				     chan->object.oclass, sizeof(*args), &chan->rm.object);
+				     (chan->user.oclass << 16) | chan->head,
+				     chan->user.oclass, sizeof(*args), &chan->rm.object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
 
@@ -194,12 +194,8 @@ r535_dmac_init(struct nvkm_disp_chan *chan)
 }
 
 static int
-r535_dmac_push(struct nvkm_disp_chan *chan, u64 memory)
+r535_dmac_push(struct nvkm_disp_chan *chan)
 {
-	chan->memory = nvkm_umem_search(chan->object.client, memory);
-	if (IS_ERR(chan->memory))
-		return PTR_ERR(chan->memory);
-
 	return 0;
 }
 
-- 
2.41.0

