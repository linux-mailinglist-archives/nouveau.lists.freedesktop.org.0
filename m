Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495528A78F6
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DB6112F72;
	Tue, 16 Apr 2024 23:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cjIsXGlc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2702B112F71
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ap7dnL5XvGMldTQO8sKUSHkqMzwN3w1kuAFjCxJlit2+z7l8vWsefEQDrxHBjY2a+fjyrrvNizO7DxsXVVhFgT4Q7HNL15eLta/PU5Oweea51saZ+BLDMRe076eqAVgdVzcgjxrF9csy7OT7JYglzYvcCW2Awe9A/eynZyo/aIXsC9/fEGKFiwNXZV7dkwKJD0LoBih7mH4JrAH1D3THuYiRUtfjtIwu3ATHJCfeFyCRYBu4JMsP3JIIm1xnOyxbJn5EB3TbU+rAWKTSd3zbnTuCCygc+YuQk2wf05iG1xDc86YTt7YdnTM8JekER1bm/KgExQZYxa21Z/BNF/f17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGgWG6t8Km1w7yMEmNXmgFMvSalCnaNTrZYeP3r2wcc=;
 b=MfHFjssdKAP6qbeA6APfz8za0J/yvzU83ADTmMrzgWqzWLbWteJun1ACefBT9G2aBFv5jA9HO6CTu25417PnmocxMkZNyToF+SOB5TDLerPHvccU2tGn91oVoshq6stfjGoXl574UFBgJw8E2m7as4FnZx3cmN/HzCZovBO0Wxy250flai7k7vEhl+/knQfO+N/rxhHVMWi9MVEJNQB91xm74MCgI4hHM5f53Tj0fHOOH6UOHKaBYqahyO91BtQ2iUVBMjIM0ndwcAUelK2ebOfAiAIHTGyvS6Mm3TCjYhgiR+Nqe3zX6JbWnke1h3TTJy7D7F3624NdjgrvWkzWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGgWG6t8Km1w7yMEmNXmgFMvSalCnaNTrZYeP3r2wcc=;
 b=cjIsXGlcvQa09lchla21PqytLutSlAicVwEj0mtGAPD62DDbHmTm4blnjl0f1ODe4bHBKC3avG8yvsZtib7a2nSTPToO+U4HH4vGQiuu5XdKdfQiu8V6PyZMyvq05OFXVgft03Dkfep3XNEA4NlttgX46Mbu8SW01ncZuK4nRo4aLZlx3z62pZofXqVG3DbnC8whAhDWtUxecrZVo83O6BNf1FZ3gLQfx7SXAjLgjng0OWSPvH2HL+UaT2sOPOxKZEXtPccp7mM4K+Is9z7wIRcdB6hTZh9D7/wSaZTnYjqNHujraqK2GjsnaCqt4W7vSDcv5YZUIHok48ZydrEzzA==
Received: from DM6PR02CA0039.namprd02.prod.outlook.com (2603:10b6:5:177::16)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:12 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::38) by DM6PR02CA0039.outlook.office365.com
 (2603:10b6:5:177::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:12 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:56 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 075/156] drm/nouveau/nvif: rework device "new usermode" api
Date: Wed, 17 Apr 2024 09:38:41 +1000
Message-ID: <20240416234002.19509-76-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c46e33d-6c64-4159-eb56-08dc5e6ed6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrp7MN/y4sSfYH01vF918fDm0J8t87+IcLGep8fMztYxfLyQ76KXHLd0RupvFuTCXLfLmwhYvAMvwgMwIMLUUYO3/aj4L0xAT9Kt+7iWC1TVdQjtL6s88/+4BqHQtfvWUGsl97BEs9SNUCcqvNIjlzZNsA4x0N3v4glY5PQexxbw/AYUvFpzvcOWS7UWT1bGt3qbmDYAUGvopMk+7Fr7FZEtRNRZ8rYibhgLHjvrHe3FKrnBbKNqi5+OcTm2o1KqZNhQbvZHhAlpuUuwud+LKONDF8N4W4KxkRO/DmGMP+4WVfe3TB3ZlffPfioqtW/OTEUXx1niSG8QgFsy2lvF7JboNnkmfqVC85tHIg/PIexK7EbJ6xWfd48e2gzsNAH97BZbgeiwWqcSPXHOorB6imii+Lpmxwj45DpTfsTCYquhRe/E164monDavUQvPto+yoLrZja0nm0AfEEhaJWKbjvJ+7qaTF5S/ZYqHkjSoLynqWTnSPVOKjhCy1LBbBo3bci12U4YVtmv0aMCiVwmio1h2Z7PcmtXZamttgh23OSQVOWuHnwve9acUIx+2xgUyptmRgFGzeqW+rayP5EeLZVHd2agjpCnNHDfaMMpWnV3A7Y9B3Bbu5zY31WSIg9uSNXfdtx8z+mKbNZBBGXVoAEoXYWf6HnKzPY5031wczqt647LavpDFR4AEQYr/yDJtj3bjn5gUy4yMgE/i8daX+NQ6DQp1QJ/OgvIooHM1Ed/5XZQ9SxbZTBfl4FjC091
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:12.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c46e33d-6c64-4159-eb56-08dc5e6ed6e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 +++++
 drivers/gpu/drm/nouveau/include/nvif/user.h   |  5 +++-
 drivers/gpu/drm/nouveau/nouveau_dma.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nvif/user.c           | 16 ++++++----
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 19 ++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/vfn/base.c    |  1 -
 .../gpu/drm/nouveau/nvkm/subdev/vfn/priv.h    |  3 --
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c    | 29 +++++++++++++++----
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h    |  9 ++++++
 10 files changed, 73 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 05d69ea0f002..35a5869eb036 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -4,6 +4,7 @@
 struct nvif_client_priv;
 struct nvif_device_priv;
 struct nvif_control_priv;
+struct nvif_usermode_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -69,6 +70,10 @@ struct nvif_control_impl {
 	} pstate;
 };
 
+struct nvif_usermode_impl {
+	void (*del)(struct nvif_usermode_priv *);
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -117,6 +122,9 @@ struct nvif_device_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_device_priv *,
+			   const struct nvif_usermode_impl **, struct nvif_usermode_priv **,
+			   u64 handle);
 	} usermode;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/user.h b/drivers/gpu/drm/nouveau/include/nvif/user.h
index 146986a9fe53..51104955c1e3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/user.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/user.h
@@ -4,8 +4,11 @@
 struct nvif_device;
 
 struct nvif_user {
-	const struct nvif_user_func *func;
+	const struct nvif_usermode_impl *impl;
+	struct nvif_usermode_priv *priv;
 	struct nvif_object object;
+
+	const struct nvif_user_func *func;
 };
 
 struct nvif_user_func {
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index a1f329ef0641..83eb9c9fa67e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -72,7 +72,7 @@ void
 nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
 	      bool no_prefetch)
 {
-	struct nvif_user *user = &chan->cli->drm->client.device.user;
+	struct nvif_user *user = &chan->cli->drm->device.user;
 	struct nouveau_bo *pb = chan->push.buffer;
 	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 76990dde1b6a..a91ad8e65a0f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -474,7 +474,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 
 	/* Volta requires access to a doorbell register for kickoff. */
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_VOLTA) {
-		ret = nvif_user_ctor(device, "drmUsermode");
+		ret = nvif_user_ctor(&drm->device, "drmUsermode");
 		if (ret)
 			return;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index d8d37c1c8169..878883aff9c5 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -21,6 +21,7 @@
  */
 #include <nvif/user.h>
 #include <nvif/device.h>
+#include <nvif/driverif.h>
 #include <nvif/printf.h>
 
 #include <nvif/class.h>
@@ -28,8 +29,9 @@
 void
 nvif_user_dtor(struct nvif_device *device)
 {
-	if (device->user.func) {
-		nvif_object_dtor(&device->user.object);
+	if (device->user.impl) {
+		device->user.impl->del(device->user.priv);
+		device->user.impl = NULL;
 		device->user.func = NULL;
 	}
 }
@@ -53,13 +55,15 @@ nvif_user_ctor(struct nvif_device *device, const char *name)
 		return -ENODEV;
 	}
 
-	ret = nvif_object_ctor(&device->object, name ? name : "nvifUsermode",
-			       0, oclass, NULL, 0,
-			       &device->user.object);
+	ret = device->impl->usermode.new(device->priv, &device->user.impl, &device->user.priv,
+					 nvif_handle(&device->user.object));
+	NVIF_ERRON(ret, &device->object, "[NEW usermode%04x]", oclass);
 	if (ret)
 		return ret;
 
-	nvif_object_map(&device->user.object, NULL, 0);
+	nvif_object_ctor(&device->object, name ?: "nvifUsermode", 0, oclass, &device->user.object);
 	device->user.func = func;
+
+	nvif_object_map(&device->user.object, NULL, 0);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 97d54b812165..aadd0c0956ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -29,6 +29,7 @@
 #include <subdev/fb.h>
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
+#include <subdev/vfn/uvfn.h>
 #include <engine/disp/priv.h>
 #include <engine/fifo/ufifo.h>
 
@@ -39,6 +40,20 @@ struct nvif_device_priv {
 	struct nvif_device_impl impl;
 };
 
+static int
+nvkm_udevice_usermode_new(struct nvif_device_priv *udev, const struct nvif_usermode_impl **pimpl,
+			  struct nvif_usermode_priv **ppriv, u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_uvfn_new(udev->device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static int
 nvkm_udevice_control_new(struct nvif_device_priv *udev,
 			 const struct nvif_control_impl **pimpl, struct nvif_control_priv **ppriv)
@@ -74,6 +89,7 @@ nvkm_udevice_impl = {
 	.del = nvkm_udevice_del,
 	.time = nvkm_udevice_time,
 	.control.new = nvkm_udevice_control_new,
+	.usermode.new = nvkm_udevice_usermode_new,
 };
 
 static int
@@ -154,8 +170,6 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 			sclass = &device->mmu->user;
 		else if (device->fault && index-- == 0)
 			sclass = &device->fault->user;
-		else if (device->vfn && index-- == 0)
-			sclass = &device->vfn->user;
 		else
 			return -EINVAL;
 
@@ -263,6 +277,7 @@ nvkm_udevice_new(struct nvkm_device *device,
 
 	if (device->vfn) {
 		udev->impl.usermode.oclass = device->vfn->user.base.oclass;
+		udev->impl.usermode.new = nvkm_udevice_usermode_new;
 	}
 
 	if (device->mmu) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.c
index 62e81d551f44..2215de6c4803 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.c
@@ -54,7 +54,6 @@ nvkm_vfn_new_(const struct nvkm_vfn_func *func, struct nvkm_device *device,
 			return ret;
 	}
 
-	vfn->user.ctor = nvkm_uvfn_new;
 	vfn->user.base = func->user.base;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
index 3a09781ad032..40245777c600 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
@@ -24,7 +24,4 @@ int nvkm_vfn_new_(const struct nvkm_vfn_func *, struct nvkm_device *, enum nvkm_
 		  u32 addr, struct nvkm_vfn **);
 
 extern const struct nvkm_intr_func tu102_vfn_intr;
-
-int nvkm_uvfn_new(struct nvkm_device *, const struct nvkm_oclass *, void *, u32,
-		  struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
index fe35024d69ba..6b0ddeb1f568 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
@@ -19,6 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#include "uvfn.h"
 #include "priv.h"
 
 #include <core/object.h>
@@ -26,6 +27,8 @@
 struct nvif_usermode_priv {
 	struct nvkm_object object;
 	struct nvkm_vfn *vfn;
+
+	struct nvif_usermode_impl impl;
 };
 
 static int
@@ -41,26 +44,40 @@ nvkm_uvfn_map(struct nvkm_object *object, void *argv, u32 argc,
 	return 0;
 }
 
+static void
+nvkm_uvfn_del(struct nvif_usermode_priv *uvfn)
+{
+	struct nvkm_object *object = &uvfn->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_usermode_impl
+nvkm_uvfn_impl = {
+	.del = nvkm_uvfn_del,
+};
+
 static const struct nvkm_object_func
 nvkm_uvfn = {
 	.map = nvkm_uvfn_map,
 };
 
 int
-nvkm_uvfn_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-	      void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_uvfn_new(struct nvkm_device *device, const struct nvif_usermode_impl **pimpl,
+	      struct nvif_usermode_priv **ppriv, struct nvkm_object **pobject)
 {
 	struct nvif_usermode_priv *uvfn;
 
-	if (argc != 0)
-		return -ENOSYS;
-
 	if (!(uvfn = kzalloc(sizeof(*uvfn), GFP_KERNEL)))
 		return -ENOMEM;
 
-	nvkm_object_ctor(&nvkm_uvfn, oclass, &uvfn->object);
+	nvkm_object_ctor(&nvkm_uvfn, &(struct nvkm_oclass) {}, &uvfn->object);
 	uvfn->vfn = device->vfn;
 
+	uvfn->impl = nvkm_uvfn_impl;
+
+	*pimpl = &uvfn->impl;
+	*ppriv = uvfn;
 	*pobject = &uvfn->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h
new file mode 100644
index 000000000000..23f636eb3b58
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UVFN_H__
+#define __NVKM_UVFN_H__
+#include <subdev/vfn.h>
+#include <nvif/driverif.h>
+
+int nvkm_uvfn_new(struct nvkm_device *, const struct nvif_usermode_impl **,
+		  struct nvif_usermode_priv **, struct nvkm_object **);
+#endif
-- 
2.41.0

