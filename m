Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931A8A7933
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB0D112FCE;
	Tue, 16 Apr 2024 23:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r0Nd6FoY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942D0112F91
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmLLZojvuJRlLKgmaU5rJoDzrz1MDKby93C2423MNHORCZ+Y7kPNzU+riJdE8gNaNujq/jiEkDkKkF8Ar/KN9oGAcgy+TQ2JftLgJfgEl//qITWvRRR+ItWCshD+H0li/l5IocXt9EfTFe2sEJKmfHVMsnKJemy4JMCLjhDS/kDZ3JcOAPF0T5bJGOKMk7xprIiSTSPEOqAjb352EqK7TuZ6t3sMsWynP0AwWlsyOtd3TDPQsEGzhWaJmj9HFcLMcrYarTPdGpiiOBS3BqdhrdtkFNGZ1Z9FUSujF4kkziPpQS+EWQGkwGmhKpF/9301QNfiLstIXDjw2ASz2Ioucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2IVORR+DK2j8uTy2nkwuguVJ61wkJff0bkAYqrT5lw=;
 b=i6jtfKl120Zdjzx26bnogyPa1sndp94bSlULLhSGjB5e7KTXeH3Z2WJ2PJfK9//ZD8iq2bRdd6vpiitR5ae+sDqU13FLh/X3WTFm+wufkvpaSakI2Y1+Ywuu8VJrc8TPF8Iq2zt14aFR5TTEGLZOtrBkHBMS6CyT1h3/WPnxfOkmj3oHLwBXHi/XONjsIla7vNrV+608FM3Kgn8CLyAoHRPHVag+NskYYiqFZm4m9iZtOs65SS+Mwj8uFa4UOnX02NgLwbnLfxRa09hJxanPCxfrtwlZue7RW+TA9P99527gh7CJcDKR9g3B9hPSSAAXYqiotO2d7DPIKKJvsAGRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2IVORR+DK2j8uTy2nkwuguVJ61wkJff0bkAYqrT5lw=;
 b=r0Nd6FoYRZCVn32z1yBi6nmpq2DFTIQEfT7a+GtNl+qXFKvOpIdj/4xY4EwtZlbKs9/5eL6/6dPJb8K/wYoYXBynzEhhrREdcCPQHzjXH4wC7QJPkyVWeiI7Z/38cXMu+QzRel9vpP1YMAffdi5b5j+JbiYMpWr1jsf9C7rfQu7DAhp3q3JRXnqsSAQ7w0FrYMaVle9c95gayOOWFCogXDD+v2LYDBQJWJ6/NRc1VD0ej28qrZmUX5aycsDJ3FfiAZblmk4Y38zt8Er9CvuvghCX7qUnvMmIHmB5fOfZCN7yCquIOSgp7P/NUUfBSfioyYopc4Hsl3jBz/nbstDTaw==
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:19 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::3d) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:18 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:54 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 126/156] drm/nouveau/nvif: rework disp "new head" api
Date: Wed, 17 Apr 2024 09:39:32 +1000
Message-ID: <20240416234002.19509-127-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2d2313-258a-4f0a-9b17-08dc5e6efe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hvBBMJaaL015vekAypAXN6OlwrkTWGhDt0VQiup/9SveH/FM6IuKw0uaXk6w1NvvIsne1F6s2S8vGDg/IqTyO/dX2o8YfYOv29T+WCfi6GGwuPLr3XBAhkQA4rnq9tfEtJAUUhguaabE20GBvU8GVd8kFXAoT5EomEGsvLfcj2U4TbsKCgA9IGS8PnpSLXOZQhGyn0ACu5tB2vWUWzaLt3yNRm6trSgsHZH3kxIYVlAN2iBn3UeXbsTCkPubUkZIlgksTX+qo4n4/b8c7JDYvDQCKVcFQwQz2xMi3tcuKjY4glhDmm6Xr2KWkyQ/CtOOv2UDsvbERBgMp03++A33NQqGbOBWZARAQhDGd0rR7eKHVfu9369j4YeIGpTpOm4UP/pvEpj2Ik2XH0tJ1dI7KbzsSPUYBDxxWDRrab72rjJVdL+GUm/wU0L3/Df35oaMmxUH3vR6sPwbzRHqFxC5Yzxa45JfMzDuJSl0lk81l5lzofBjoFOiuTWDEJvtjxtCMBZ8xNeT79Uam3ugfhNh8hoG59NXLXqMbM5HH5ffk3DSewky/0zXw12IAp9tVSBovXWw5eCJhsQh4LZlng8qdFT6yNuTwJFf5EO6QzdX1WYJlKMc0vDAxlO4noTOoLbE64RV/Bbxiktw/TkJC3jnCFL3loh2dlh7NWZKfTocb+g/B/F07CzAiITH6EXaYC70JmlKo9KMQWRb6EntCrV2y9sIJsToKiSeCVBXenxv6aCb1A3ak1P0S5hDxJFjaiM
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:18.6638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2d2313-258a-4f0a-9b17-08dc5e6efe7d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 ++++++
 drivers/gpu/drm/nouveau/include/nvif/head.h   |  2 ++
 drivers/gpu/drm/nouveau/include/nvif/if0013.h |  8 ------
 drivers/gpu/drm/nouveau/nvif/head.c           | 21 ++++++++------
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  2 --
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 24 +++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 28 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.h  |  3 ++
 8 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 57ad5022a534..83acedd108bb 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -16,6 +16,7 @@ struct nvif_disp_priv;
 struct nvif_disp_caps_priv;
 struct nvif_conn_priv;
 struct nvif_outp_priv;
+struct nvif_head_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -348,6 +349,10 @@ struct nvif_outp_impl {
 	} dp;
 };
 
+struct nvif_head_impl {
+	void (*del)(struct nvif_head_priv *);
+};
+
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
@@ -371,6 +376,9 @@ struct nvif_disp_impl {
 
 	struct {
 		u32 mask;
+		int (*new)(struct nvif_disp_priv *, u8 id,
+			   const struct nvif_head_impl **, struct nvif_head_priv **,
+			   u64 handle);
 	} head;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/head.h b/drivers/gpu/drm/nouveau/include/nvif/head.h
index 3ec36999e956..fb25cd60987a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/head.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/head.h
@@ -6,6 +6,8 @@
 struct nvif_disp;
 
 struct nvif_head {
+	const struct nvif_head_impl *impl;
+	struct nvif_head_priv *priv;
 	struct nvif_object object;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0013.h b/drivers/gpu/drm/nouveau/include/nvif/if0013.h
index 6756c7467ae4..751f75bf7e59 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0013.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0013.h
@@ -2,14 +2,6 @@
 #ifndef __NVIF_IF0013_H__
 #define __NVIF_IF0013_H__
 
-union nvif_head_args {
-	struct nvif_head_v0 {
-		__u8 version;
-		__u8 id;
-		__u8 pad02[6];
-	} v0;
-};
-
 union nvif_head_event_args {
 	struct nvif_head_event_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/nvif/head.c b/drivers/gpu/drm/nouveau/nvif/head.c
index f00e01d232db..777f12f3236f 100644
--- a/drivers/gpu/drm/nouveau/nvif/head.c
+++ b/drivers/gpu/drm/nouveau/nvif/head.c
@@ -21,6 +21,7 @@
  */
 #include <nvif/head.h>
 #include <nvif/disp.h>
+#include <nvif/driverif.h>
 #include <nvif/printf.h>
 
 #include <nvif/class.h>
@@ -39,20 +40,24 @@ nvif_head_vblank_event_ctor(struct nvif_head *head, const char *name, nvif_event
 void
 nvif_head_dtor(struct nvif_head *head)
 {
-	nvif_object_dtor(&head->object);
+	if (!head->impl)
+		return;
+
+	head->impl->del(head->priv);
+	head->impl = NULL;
 }
 
 int
 nvif_head_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_head *head)
 {
-	struct nvif_head_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.id = id;
+	ret = disp->impl->head.new(disp->priv, id, &head->impl, &head->priv,
+				   nvif_handle(&head->object));
+	NVIF_ERRON(ret, &disp->object, "[NEW head id:%d]", id);
+	if (ret)
+		return ret;
 
-	ret = nvif_object_ctor(&disp->object, name ? name : "nvifHead", id, NVIF_CLASS_HEAD,
-			       &args, sizeof(args), &head->object);
-	NVIF_ERRON(ret, &disp->object, "[NEW head id:%d]", args.id);
-	return ret;
+	nvif_object_ctor(&disp->object, name ?: "nvifHead", id, 0, &head->object);
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 0163660f215d..d16b47b2a9d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -88,6 +88,4 @@ void nv50_disp_chan_uevent_send(struct nvkm_disp *, int);
 
 extern const struct nvkm_event_func gf119_disp_chan_uevent;
 extern const struct nvkm_event_func gv100_disp_chan_uevent;
-
-int nvkm_uhead_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 0be6b28c79b8..6a65b3bffc19 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -23,7 +23,7 @@
 #include "ucaps.h"
 #include "chan.h"
 #include "uconn.h"
-#include "head.h"
+#include "uhead.h"
 #include "uoutp.h"
 
 #include <nvif/class.h>
@@ -33,12 +33,6 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 {
 	struct nvkm_disp *disp = container_of(object, struct nvif_disp_priv, object)->disp;
 
-	if (index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_HEAD };
-		sclass->ctor = nvkm_uhead_new;
-		return 0;
-	}
-
 	if (disp->func->user.core.oclass && index-- == 0) {
 		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.core.oclass };
 		sclass->ctor = nvkm_disp_core_new;
@@ -84,6 +78,21 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 	return -EINVAL;
 }
 
+static int
+nvkm_udisp_head_new(struct nvif_disp_priv *udisp, u8 id,
+		    const struct nvif_head_impl **pimpl, struct nvif_head_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_uhead_new(udisp->disp, id, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+}
+
 static int
 nvkm_udisp_outp_new(struct nvif_disp_priv *udisp, u8 id,
 		    const struct nvif_outp_impl **pimpl, struct nvif_outp_priv **ppriv)
@@ -143,6 +152,7 @@ nvkm_udisp_impl = {
 	.del = nvkm_udisp_del,
 	.conn.new = nvkm_udisp_conn_new,
 	.outp.new = nvkm_udisp_outp_new,
+	.head.new = nvkm_udisp_head_new,
 };
 
 static void *
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
index 3be82e01a59a..3456e988f9b3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
@@ -87,6 +87,19 @@ nvkm_uhead_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	}
 }
 
+static void
+nvkm_uhead_del(struct nvif_head_priv *uhead)
+{
+	struct nvkm_object *object = &uhead->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_head_impl
+nvkm_uhead_impl = {
+	.del = nvkm_uhead_del,
+};
+
 static void *
 nvkm_uhead_dtor(struct nvkm_object *object)
 {
@@ -106,18 +119,14 @@ nvkm_uhead = {
 	.uevent = nvkm_uhead_uevent,
 };
 
-#include "udisp.h"
 int
-nvkm_uhead_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_uhead_new(struct nvkm_disp *disp, u8 id, const struct nvif_head_impl **pimpl,
+	       struct nvif_head_priv **ppriv, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_head *head;
-	union nvif_head_args *args = argv;
 	struct nvif_head_priv *uhead;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!(head = nvkm_head_find(disp, args->v0.id)))
+	if (!(head = nvkm_head_find(disp, id)))
 		return -EINVAL;
 
 	uhead = kzalloc(sizeof(*uhead), GFP_KERNEL);
@@ -133,8 +142,11 @@ nvkm_uhead_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	head->user = true;
 	spin_unlock(&disp->user.lock);
 
-	nvkm_object_ctor(&nvkm_uhead, oclass, &uhead->object);
+	nvkm_object_ctor(&nvkm_uhead, &(struct nvkm_oclass) {}, &uhead->object);
 	uhead->head = head;
+
+	*pimpl = &nvkm_uhead_impl;
+	*ppriv = uhead;
 	*pobject = &uhead->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
index f19c9ae33707..1291f8c3874e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
@@ -2,5 +2,8 @@
 #ifndef __NVKM_UHEAD_H__
 #define __NVKM_UHEAD_H__
 #include "head.h"
+#include <nvif/driverif.h>
 
+int nvkm_uhead_new(struct nvkm_disp *, u8 id, const struct nvif_head_impl **,
+		   struct nvif_head_priv **, struct nvkm_object **);
 #endif
-- 
2.41.0

