Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47F8A7912
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DED112F62;
	Tue, 16 Apr 2024 23:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ka+vc9XE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BE1112F66
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN7d0vYM3GjJDufjslVnfEGUQ0T4p1e2cDmJzO9XgAGlhHT2RUcCiOVYPpvDrFtX2zKmGZgoTN0UzZT0wE8FhhJpNQybJ4REYuy/BL/jy2lfW8NlpaV6XUtT1WIQE3zOexeD6OmkHsoEy6jhkzjQnv2V0+F54pTMSJb2XBnfW6dkN46K5zFj8gH2XB6xcVN8qgH6jYRsHH7hf+yLscH2/CLZzjcuhXNV4M1LGlT5TdGxJvrUAJH/0Rwq99HnJfinJ+o0M0STFg+b2YRINfimzm8mn9/jA38MqEDmQRIJkwlkKYEI5jlirpe4VAj6tOaQzGcTgUt//uOwahxx3JrP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAQbLRjYByh4Xqqd9YVKxwqIkh1deXpSK9/GlTkqZCo=;
 b=WX2n6HFEWPoGX0Oajb4T8Jlyz/g/3nSMr8juXo/OFYB+ynN0KD5nJfYNEBPQat4ZXv3TtqTzNq4CHrGSlC6aIW3V6hobS+e9xoHzcct+soRPXOrL9ckOUYwqVaWv0tfvOoP0uv+1TrTJ5I3O2xmw7kNZ2MW7+25KdikxHhakKzrF2JvEQBk01pRxNgCjRqB33v0u6tW5ZQ65G0bZxHGZmK/YP9Cd/+vw4WfQk1L9CnVjBRRjy5kJJGCMJQQUlLwEAtIo2gOQ7JQA8kkv0cRBL6UrOmSnhJBiGxNI1bhTO3o8EF9b9yzkmtCCxV+DVB65X8UihzpYDWD90VWf+hPlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAQbLRjYByh4Xqqd9YVKxwqIkh1deXpSK9/GlTkqZCo=;
 b=Ka+vc9XERZ1r8CLR8i3fYertZ71ejDypn6dgLlQXGQzCn9wg6k5w1lXEAf5UrWupp0AiwRI/IcUAvMfe1gt0sLZAHtFOpc/K84IUn0u8Bhih3EMlI0/dvfjtc3GldvbQdquCJ/7j5135JDo8dAMEzZN94L7feEFonB8BObnkWRtW3bSJQXoEKCuM1s6zkVbKOS5VHzY6JrrT6sy6bKM8kfw//hEzv4ylXBg1q7wgNm13uPvuXwKv6FpEZcMiEd+488I6uwHAbvBVrF2W4X7hp2Pg3RRJipHMn6EfJOwsBFN6b5lv+m7BrIKTrJPwhNaV3IuFSd5lVZhq31m0JtWB2Q==
Received: from CH0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:610:b1::27)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:41 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::2b) by CH0PR13CA0022.outlook.office365.com
 (2603:10b6:610:b1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:24 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 099/156] drm/nouveau/nvif: rework device "new disp" api
Date: Wed, 17 Apr 2024 09:39:05 +1000
Message-ID: <20240416234002.19509-100-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: ac393a4a-0777-437f-972c-08dc5e6ee7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bGMsWlcX8fPRQ0Jurg/GG2uB6IiAdeYzXHj0gM/tsrX9aUgCW+q0ou3CH8iYhqB83Dh2lQ0mpvFwN1Qq+of2MJ51SR17xZdCDsNAM6OdyvKnRaiTYjnHjSws73mAg8/vXBI7NrDnnlJYiEuVExcEjfcZ18FyKLkeLMNWapxmwfXHDV3Sd7MjzlUibY7Wh4KfUxxBkYwxv2tGxrLTqXnVK//W0XJWgeC7vM6miH6RS31S0UoklP6m/CIUuyP2K016H7fgEbikqBzFJF3MraUd8xKVxBSFYK50jk2RRWD1080p7IF51oTlXHHui3O6lfdjdMNj+3/JNstuKV6W5+IRuYrHSGHWhhPIL6939Rt+OEhARud8dQJ9W85XnKQDSUKQtAPXrt1qJxB77e4+6umklN1R8ImbUcKBqKCMbOBMB4tcaBo11Jo9RRe+uAHj70tFO3hJZk+XLI49xRKdFyEW9sDDVowWe0RH7SV68QqmiL8AkIbT+h0Akdzdd6KmyZmSKxqHjB3OZs/xluQBU5tlbkuRfsngIVxVE387GkXv8kqzzU0ZeZk010UGq/ZOkm+L2qSPWn9NiuBgLN3wzCbrRw/ROcS/UOeunUgbhLRKhXnqspOQxCXUgbLgn5CMijV7yIECFaIteSBfS/cnd7ONU89d5GyjdW/HAOxmMidsEOufyyKjRsPO+kAL7hRdRLR/BeYarSaBrnJc/1LQMN0DvlIxzavi2sLzID30TMfG0v4DByAR5hhIgzMrHEWC7N6
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:40.7456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac393a4a-0777-437f-972c-08dc5e6ee7dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
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
 drivers/gpu/drm/nouveau/include/nvif/disp.h   |  5 ++
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 20 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0010.h | 14 -----
 drivers/gpu/drm/nouveau/include/nvif/object.h | 16 ------
 drivers/gpu/drm/nouveau/nvif/disp.c           | 26 +++++-----
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 20 +++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   | 27 ----------
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  1 -
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 51 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.h  |  6 +++
 10 files changed, 97 insertions(+), 89 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0010.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/disp.h b/drivers/gpu/drm/nouveau/include/nvif/disp.h
index c4f428f268ea..06f56cc63893 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/disp.h
@@ -4,7 +4,12 @@
 struct nvif_device;
 
 struct nvif_disp {
+	const struct nvif_disp_impl *impl;
+	struct nvif_disp_priv *priv;
 	struct nvif_object object;
+
+	struct nvif_device *device;
+
 	unsigned long conn_mask;
 	unsigned long outp_mask;
 	unsigned long head_mask;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 42e6324ddfe3..e479e8114605 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -10,6 +10,7 @@ struct nvif_mmu_priv;
 struct nvif_mem_priv;
 struct nvif_vmm_priv;
 struct nvif_faultbuf_priv;
+struct nvif_disp_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -216,6 +217,22 @@ struct nvif_faultbuf_impl {
 	} event;
 };
 
+struct nvif_disp_impl {
+	void (*del)(struct nvif_disp_priv *);
+
+	struct {
+		u32 mask;
+	} conn;
+
+	struct {
+		u32 mask;
+	} outp;
+
+	struct {
+		u32 mask;
+	} head;
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -282,6 +299,9 @@ struct nvif_device_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_device_priv *,
+			   const struct nvif_disp_impl **, struct nvif_disp_priv **,
+			   u64 handle);
 	} disp;
 
 	struct nvif_device_impl_fifo {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0010.h b/drivers/gpu/drm/nouveau/include/nvif/if0010.h
deleted file mode 100644
index 4c835bbe6fe3..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0010.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0010_H__
-#define __NVIF_IF0010_H__
-
-union nvif_disp_args {
-	struct nvif_disp_v0 {
-		__u8 version;
-		__u8 pad01[3];
-		__u32 conn_mask;
-		__u32 outp_mask;
-		__u32 head_mask;
-	} v0;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index b3e66425f310..819ae1c9729d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -111,22 +111,6 @@ struct nvif_mclass {
 	ret;                                                                   \
 })
 
-#define nvif_sclass(o,m,u) ({                                                  \
-	const typeof(m[0]) *_mclass = (m);                                     \
-	s32 _oclass = (u);                                                     \
-	int _cid;                                                              \
-	if (_oclass) {                                                         \
-		for (_cid = 0; _mclass[_cid].oclass; _cid++) {                 \
-			if (_mclass[_cid].oclass == _oclass)                   \
-				break;                                         \
-		}                                                              \
-		_cid = _mclass[_cid].oclass ? _cid : -ENOSYS;                  \
-	} else {                                                               \
-		_cid = nvif_mclass((o), _mclass);                              \
-	}                                                                      \
-	_cid;                                                                  \
-})
-
 #define NVIF_RD32_(p,o,dr)   nvif_rd32((p), (o) + (dr))
 #define NVIF_WR32_(p,o,dr,f) nvif_wr32((p), (o) + (dr), (f))
 #define NVIF_RD32(p,A...) DRF_RD(NVIF_RD32_,                  (p), 0, ##A)
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 875c63877468..f3c425daf7d5 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -24,23 +24,23 @@
 #include <nvif/printf.h>
 
 #include <nvif/class.h>
-#include <nvif/if0010.h>
 
 void
 nvif_disp_dtor(struct nvif_disp *disp)
 {
-	nvif_object_dtor(&disp->object);
+	if (!disp->impl)
+		return;
+
+	disp->impl->del(disp->priv);
+	disp->impl = NULL;
 }
 
 int
 nvif_disp_ctor(struct nvif_device *device, const char *name, struct nvif_disp *disp)
 {
 	const u32 oclass = device->impl->disp.oclass;
-	struct nvif_disp_v0 args;
 	int ret;
 
-	disp->object.client = NULL;
-
 	switch (oclass) {
 	case AD102_DISP:
 	case GA102_DISP:
@@ -65,18 +65,16 @@ nvif_disp_ctor(struct nvif_device *device, const char *name, struct nvif_disp *d
 		return -ENODEV;
 	}
 
-	args.version = 0;
-
-	ret = nvif_object_ctor(&device->object, name ?: "nvifDisp", 0,
-			       oclass, &args, sizeof(args), &disp->object);
+	ret = device->impl->disp.new(device->priv, &disp->impl, &disp->priv,
+				     nvif_handle(&disp->object));
 	NVIF_ERRON(ret, &device->object, "[NEW disp%04x]", oclass);
 	if (ret)
 		return ret;
 
-	NVIF_DEBUG(&disp->object, "[NEW] conn_mask:%08x outp_mask:%08x head_mask:%08x",
-		   args.conn_mask, args.outp_mask, args.head_mask);
-	disp->conn_mask = args.conn_mask;
-	disp->outp_mask = args.outp_mask;
-	disp->head_mask = args.head_mask;
+	nvif_object_ctor(&device->object, name ?: "nvifDisp", 0, oclass, &disp->object);
+	disp->device = device;
+	disp->conn_mask = disp->impl->conn.mask;
+	disp->outp_mask = disp->impl->outp.mask;
+	disp->head_mask = disp->impl->head.mask;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index eb33ab81d7e1..3c7c0d1e6adb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -33,6 +33,7 @@
 #include <subdev/mmu/ummu.h>
 #include <subdev/vfn/uvfn.h>
 #include <engine/disp/priv.h>
+#include <engine/disp/udisp.h>
 #include <engine/fifo/ufifo.h>
 
 struct nvif_device_priv {
@@ -93,6 +94,21 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 	return nvkm_timer_read(udev->device->timer);
 }
 
+static int
+nvkm_udevice_disp_new(struct nvif_device_priv *udev,
+		      const struct nvif_disp_impl **pimpl, struct nvif_disp_priv **ppriv,
+		      u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_udisp_new(udev->device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static int
 nvkm_udevice_mmu_new(struct nvif_device_priv *udev,
 		     const struct nvif_mmu_impl **pimpl, struct nvif_mmu_priv **ppriv)
@@ -185,8 +201,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 	struct nvkm_device *device = udev->device;
 	struct nvkm_engine *engine;
 	u64 mask = (1ULL << NVKM_ENGINE_DMAOBJ) |
-		   (1ULL << NVKM_ENGINE_FIFO) |
-		   (1ULL << NVKM_ENGINE_DISP);
+		   (1ULL << NVKM_ENGINE_FIFO);
 	const struct nvkm_device_oclass *sclass = NULL;
 	int i;
 
@@ -317,6 +332,7 @@ nvkm_udevice_new(struct nvkm_device *device,
 
 	if (device->disp) {
 		udev->impl.disp.oclass = device->disp->func->user.root.oclass;
+		udev->impl.disp.new = nvkm_udevice_disp_new;
 	}
 
 	if (device->fifo) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 6850c703ff2d..dab603f17e2d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -65,32 +65,6 @@ nvkm_disp_vblank(struct nvkm_disp *disp, int head)
 	nvkm_event_ntfy(&disp->vblank, head, NVKM_DISP_HEAD_EVENT_VBLANK);
 }
 
-static int
-nvkm_disp_class_new(struct nvkm_device *device,
-		    const struct nvkm_oclass *oclass, void *data, u32 size,
-		    struct nvkm_object **pobject)
-{
-	return nvkm_udisp_new(oclass, data, size, pobject);
-}
-
-static const struct nvkm_device_oclass
-nvkm_disp_sclass = {
-	.ctor = nvkm_disp_class_new,
-};
-
-static int
-nvkm_disp_class_get(struct nvkm_oclass *oclass, int index,
-		    const struct nvkm_device_oclass **class)
-{
-	struct nvkm_disp *disp = nvkm_disp(oclass->engine);
-	if (index == 0) {
-		oclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.root.oclass };
-		*class = &nvkm_disp_sclass;
-		return 0;
-	}
-	return 1;
-}
-
 static void
 nvkm_disp_intr(struct nvkm_engine *engine)
 {
@@ -222,7 +196,6 @@ nvkm_disp = {
 	.init = nvkm_disp_init,
 	.fini = nvkm_disp_fini,
 	.intr = nvkm_disp_intr,
-	.base.sclass = nvkm_disp_class_get,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 82b16cc9212a..324a7971a0eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -90,7 +90,6 @@ void nv50_disp_chan_uevent_send(struct nvkm_disp *, int);
 extern const struct nvkm_event_func gf119_disp_chan_uevent;
 extern const struct nvkm_event_func gv100_disp_chan_uevent;
 
-int nvkm_udisp_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uconn_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uoutp_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uhead_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 750db6a1eb44..06e465edf3e9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -26,7 +26,6 @@
 #include "outp.h"
 
 #include <nvif/class.h>
-#include <nvif/if0010.h>
 
 static int
 nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *sclass)
@@ -102,15 +101,32 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 	return -EINVAL;
 }
 
+static void
+nvkm_udisp_del(struct nvif_disp_priv *udisp)
+{
+	struct nvkm_object *object = &udisp->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_disp_impl
+nvkm_udisp_impl = {
+	.del = nvkm_udisp_del,
+};
+
 static void *
 nvkm_udisp_dtor(struct nvkm_object *object)
 {
 	struct nvif_disp_priv *udisp = container_of(object, typeof(*udisp), object);
 	struct nvkm_disp *disp = udisp->disp;
+	struct nvkm_engine *engine = &disp->engine;
 
 	spin_lock(&disp->user.lock);
 	disp->user.allocated = false;
 	spin_unlock(&disp->user.lock);
+
+	nvkm_engine_unref(&engine);
 	return udisp;
 }
 
@@ -121,46 +137,51 @@ nvkm_udisp = {
 };
 
 int
-nvkm_udisp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_udisp_new(struct nvkm_device *device, const struct nvif_disp_impl **pimpl,
+	       struct nvif_disp_priv **ppriv, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = nvkm_disp(oclass->engine);
+	struct nvkm_disp *disp = device->disp;
 	struct nvkm_conn *conn;
 	struct nvkm_outp *outp;
 	struct nvkm_head *head;
-	union nvif_disp_args *args = argv;
 	struct nvif_disp_priv *udisp;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	struct nvkm_engine *engine;
 
 	udisp = kzalloc(sizeof(*udisp), GFP_KERNEL);
 	if (!udisp)
 		return -ENOMEM;
 
+	engine = nvkm_engine_ref(&disp->engine);
+	if (IS_ERR(engine)) {
+		kfree(udisp);
+		return PTR_ERR(engine);
+	}
+
 	spin_lock(&disp->user.lock);
 	if (disp->user.allocated) {
 		spin_unlock(&disp->user.lock);
+		nvkm_engine_unref(&engine);
 		kfree(udisp);
 		return -EBUSY;
 	}
 	disp->user.allocated = true;
 	spin_unlock(&disp->user.lock);
 
-	nvkm_object_ctor(&nvkm_udisp, oclass, &udisp->object);
+	nvkm_object_ctor(&nvkm_udisp, &(struct nvkm_oclass) {}, &udisp->object);
 	udisp->disp = disp;
-	*pobject = &udisp->object;
+	udisp->impl = nvkm_udisp_impl;
 
-	args->v0.conn_mask = 0;
 	list_for_each_entry(conn, &disp->conns, head)
-		args->v0.conn_mask |= BIT(conn->index);
+		udisp->impl.conn.mask |= BIT(conn->index);
 
-	args->v0.outp_mask = 0;
 	list_for_each_entry(outp, &disp->outps, head)
-		args->v0.outp_mask |= BIT(outp->index);
+		udisp->impl.outp.mask |= BIT(outp->index);
 
-	args->v0.head_mask = 0;
 	list_for_each_entry(head, &disp->heads, head)
-		args->v0.head_mask |= BIT(head->id);
+		udisp->impl.head.mask |= BIT(head->id);
 
+	*pimpl = &udisp->impl;
+	*ppriv = udisp;
+	*pobject = &udisp->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
index 2918ecbca5d3..5baf1fe35f88 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
@@ -3,9 +3,15 @@
 #define __NVKM_UDISP_H__
 #include <core/object.h>
 #include "priv.h"
+#include <nvif/driverif.h>
 
 struct nvif_disp_priv {
 	struct nvkm_object object;
 	struct nvkm_disp *disp;
+
+	struct nvif_disp_impl impl;
 };
+
+int nvkm_udisp_new(struct nvkm_device *, const struct nvif_disp_impl **, struct nvif_disp_priv **,
+		   struct nvkm_object **);
 #endif
-- 
2.41.0

