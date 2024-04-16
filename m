Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C08A790A
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE7D112F86;
	Tue, 16 Apr 2024 23:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zs4zNjEW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C935112F85
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VivI+zZXRCzj8FAEN/aw426zWWPIJEGd01hlnildC3VM9opmPWQJCwGLSrlQA4VCspDoaeJz8I1AKUJmwqa4yNKNvaG3OUWP+x2Y0aJ9Cq33PivE0nPDJwpatgac7dOsUZUJvS2Q7q78gffUNY9/Us7ZiaWZFMoknow+BpNEqZGD/cvWGd2vm7QSQcAqswUa/zy5V0O6rNErdczlfAhOUsaotzArD8MQ02oO9RPPivdpG+5D0QjO5tUs0eBFxMystJqb33DHKokOMsC8VQt5r8iceJ0QDZnJL7tl9AVrUzPHof/3b/eK2P1qt53NzOfBrwhVKfKyXgCEgvKHh5EXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju7HxrTgXhotL5bPAZMvH4gpy0nig6ZFtxKgEtf46l8=;
 b=AQU/Z5K/aS9SzDUNLHcB38JCc/eAeGjH4wvxOzUaFnAnCQ4lI3R6kMieXTaQ7SOXJIkDHqNd+QZi3VFkZ8yBKdUL6QLES21kemkywRLuphLbTT5IVEflcVHczGxRMwiBdkb+ykcndi0gsam8Zf/RCqo7PDzJaOjNP/dH8mV3BTct+WSIgQGrex3wBU+XpULfpaI8Ba0uxhyHXZPOcK56+0NjPicEmVkxRBIglaCADPw0M+fU/oR/kPVJ6/pdQ8DiIkCRT7UoUd1SRnN/OFdICqHmhr5F71/r8aH0EFp8IQMY9fQHwnniFKmp3UmwptRm5+bifiRXlNLRKBeDPUK/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju7HxrTgXhotL5bPAZMvH4gpy0nig6ZFtxKgEtf46l8=;
 b=Zs4zNjEW813B84tCOUxfcHnfNqs2Vvz/Rb26UFMbSdF+FBsKFydnl3y7fq58hl2pDZSzQQ34bOOhJQQqDNtBvFHK00cIx6P8h+a4KktTNO1wRlKAtby8ybVheacY6vui3OFDTXwo1+OHRkPN1Dba1qIebk7fiXxGzQ2QhTf/P2VmszD1VUL34VPsFuMoLL91OBn74Ypto2f8B4wQfcw3F8QnxqFqG9bgYgm5+Mu9Ccg8KtaRsoCk8tbrK8gdU4riUAsfx7n9Gje2a6i6ZfeK0nX4Fp0daqpND/nNQRHYE8xiXxv45WrvC8GZq+ax0LwWle+R5CXzoTDDjOECHCnuUg==
Received: from CH0PR03CA0397.namprd03.prod.outlook.com (2603:10b6:610:11b::30)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:35 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::f4) by CH0PR03CA0397.outlook.office365.com
 (2603:10b6:610:11b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:19 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 095/156] drm/nouveau/nvif: rework device "new fault buffer" api
Date: Wed, 17 Apr 2024 09:39:01 +1000
Message-ID: <20240416234002.19509-96-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dcd28f-bf54-4b00-b494-08dc5e6ee47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MS66YotPV/KFShA6bWnZjj9FkE5WPTH/r4dO+t7iyygf71tgwMOLL3vAskvQBQIyXWYNFwQjb+2n0WVCANtLqYlXoa1ymSl874gn8ZZoUTbxnEA2b8j1qbgRjyvWpYoXnBCBdYMXeg/MDePbmd3OacmP6VJzMnVAScJgmA7Dx29UWQQN6sl595iCUQb/ngry1U6z8atE4Bu5w68bc6SFZmE77vX/o1aOS8wDFrSIli/nQUdDNtNa/XoyrUevSInt25BRrepC9tqCpRmZLvCtHIOGqHLwITN2Yo9uKu2Ou8rvf+yd/FuixiTcTq/MN8Jntmpcg2g2ReSJAMc0yr/ZV8D8+AU7SLb/CZY+bD/5WoyUbIEAFyAohVXHpkJW4QquGy/1sgReyyLZ5ff6I5npn0P8QF04ktiTxBI191ZVhEyOwLarzm7A2FyaTzSxZ2zueZjps4T/AdV9xqLHKYeDujnRRY0CCHjlskp+Y6PxjQNPOefKKAKGB+X7Qc/PS6aLEBSZcmzWxrRIvwqmvfprxdSHRoWT+eGaeZo8lNRImuYO+rBQCvEN/rjkNm6Ag17OiMl9COcSzGqKDPMh3tn0MmuJkOLZozj1NUyOvOUM2HvYg9XLqEbuA7Wl/4HdvUi9wCPT30dar6cZrECQlw59oVpx/1zfgOIl+6ZEHcr6LHx5/7BpfQA/Qv7NJrZj5XVZliAldChasIGKmwZTfUKapnDNhI9oTm+mkBRKg32Kt8LSiPCFktv8lP7882L2KFKY
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:35.1021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dcd28f-bf54-4b00-b494-08dc5e6ee47a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957
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
 drivers/gpu/drm/nouveau/include/nvif/clb069.h |  7 ---
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 12 +++++
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 27 ++++++----
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 28 +++++++----
 .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  1 -
 .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  |  3 --
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  | 49 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.h  |  9 ++++
 8 files changed, 91 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/clb069.h b/drivers/gpu/drm/nouveau/include/nvif/clb069.h
index d7689de35ab2..67bf579ced18 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/clb069.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/clb069.h
@@ -1,12 +1,5 @@
 #ifndef __NVIF_CLB069_H__
 #define __NVIF_CLB069_H__
-struct nvif_clb069_v0 {
-	__u8  version;
-	__u8  pad01[3];
-	__u32 entries;
-	__u32 get;
-	__u32 put;
-};
 
 union nvif_clb069_event_args {
 	struct nvif_clb069_event_vn {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 425c3184ff14..a1aab5735146 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -8,6 +8,7 @@ struct nvif_usermode_priv;
 struct nvif_mmu_priv;
 struct nvif_mem_priv;
 struct nvif_vmm_priv;
+struct nvif_faultbuf_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -194,6 +195,14 @@ struct nvif_mmu_impl {
 	} vmm;
 };
 
+struct nvif_faultbuf_impl {
+	void (*del)(struct nvif_faultbuf_priv *);
+
+	u32 entries;
+	u32 get;
+	u32 put;
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -254,6 +263,9 @@ struct nvif_device_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_device_priv *,
+			   const struct nvif_faultbuf_impl **, struct nvif_faultbuf_priv **,
+			   u64 handle);
 	} faultbuf;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 07fa00afe5b8..83702a86da1d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -44,8 +44,11 @@ struct nouveau_svm {
 	struct list_head inst;
 
 	struct nouveau_svm_fault_buffer {
-		int id;
+		const struct nvif_faultbuf_impl *impl;
+		struct nvif_faultbuf_priv *priv;
 		struct nvif_object object;
+
+		int id;
 		u32 entries;
 		u32 getaddr;
 		u32 putaddr;
@@ -960,7 +963,11 @@ nouveau_svm_fault_buffer_dtor(struct nouveau_svm *svm, int id)
 	}
 
 	nvif_event_dtor(&buffer->notify);
-	nvif_object_dtor(&buffer->object);
+
+	if (buffer->impl) {
+		buffer->impl->del(buffer->priv);
+		buffer->impl = NULL;
+	}
 }
 
 static int
@@ -968,23 +975,23 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 {
 	struct nouveau_svm_fault_buffer *buffer = &svm->buffer[id];
 	struct nouveau_drm *drm = svm->drm;
-	struct nvif_object *device = &drm->client.device.object;
-	struct nvif_clb069_v0 args = {};
 	int ret;
 
 	buffer->id = id;
 
-	ret = nvif_object_ctor(device, "svmFaultBuffer", 0, oclass, &args,
-			       sizeof(args), &buffer->object);
-	if (ret < 0) {
+	ret = drm->device.impl->faultbuf.new(drm->device.priv, &buffer->impl, &buffer->priv,
+					     nvif_handle(&buffer->object));
+	if (ret) {
 		SVM_ERR(svm, "Fault buffer allocation failed: %d", ret);
 		return ret;
 	}
 
+	nvif_object_ctor(&drm->device.object, "svmFaultBuffer", id, oclass, &buffer->object);
+	buffer->entries = buffer->impl->entries;
+	buffer->getaddr = buffer->impl->get;
+	buffer->putaddr = buffer->impl->put;
+
 	nvif_object_map(&buffer->object, NULL, 0);
-	buffer->entries = args.entries;
-	buffer->getaddr = args.get;
-	buffer->putaddr = args.put;
 	INIT_WORK(&buffer->work, nouveau_svm_fault);
 
 	ret = nvif_event_ctor(&buffer->object, "svmFault", id, nouveau_svm_event, true, NULL, 0,
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index e63462188f2a..b4604ce1fcbb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -26,6 +26,7 @@
 #include "ctrl.h"
 
 #include <core/client.h>
+#include <subdev/fault/user.h>
 #include <subdev/fb.h>
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
@@ -41,6 +42,21 @@ struct nvif_device_priv {
 	struct nvif_device_impl impl;
 };
 
+static int
+nvkm_udevice_fault_new(struct nvif_device_priv *udev,
+		       const struct nvif_faultbuf_impl **pimpl, struct nvif_faultbuf_priv **ppriv,
+		       u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_ufault_new(udev->device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static int
 nvkm_udevice_usermode_new(struct nvif_device_priv *udev, const struct nvif_usermode_impl **pimpl,
 			  struct nvif_usermode_priv **ppriv)
@@ -183,15 +199,8 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 		index -= engine->func->base.sclass(oclass, index, &sclass);
 	}
 
-	if (!sclass) {
-		if (device->fault && index-- == 0)
-			sclass = &device->fault->user;
-		else
-			return -EINVAL;
-
-		oclass->base = sclass->base;
-		oclass->engine = NULL;
-	}
+	if (!sclass)
+		return -EINVAL;
 
 	oclass->ctor = nvkm_udevice_child_new;
 	oclass->priv = sclass;
@@ -303,6 +312,7 @@ nvkm_udevice_new(struct nvkm_device *device,
 
 	if (device->fault) {
 		udev->impl.faultbuf.oclass = device->fault->user.base.oclass;
+		udev->impl.faultbuf.new = nvkm_udevice_fault_new;
 	}
 
 	if (device->disp) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
index b53ac9a2552f..68611f83ab8a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c
@@ -160,7 +160,6 @@ nvkm_fault_new_(const struct nvkm_fault_func *func, struct nvkm_device *device,
 		return -ENOMEM;
 	nvkm_subdev_ctor(&nvkm_fault, device, type, inst, &fault->subdev);
 	fault->func = func;
-	fault->user.ctor = nvkm_ufault_new;
 	fault->user.base = func->user.base;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
index 3c26e76d1d3c..b49b4e3b7660 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
@@ -52,7 +52,4 @@ void gp100_fault_intr(struct nvkm_fault *);
 u64 gp10b_fault_buffer_pin(struct nvkm_fault_buffer *);
 
 int gv100_fault_oneinit(struct nvkm_fault *);
-
-int nvkm_ufault_new(struct nvkm_device *, const struct nvkm_oclass *,
-		    void *, u32, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
index 6c3ede8b0321..e6eb6df1f982 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -19,6 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#include "user.h"
 #include "priv.h"
 
 #include <core/memory.h>
@@ -31,6 +32,8 @@
 struct nvif_faultbuf_priv {
 	struct nvkm_object object;
 	struct nvkm_fault_buffer *buffer;
+
+	struct nvif_faultbuf_impl impl;
 };
 
 static int
@@ -60,6 +63,20 @@ nvkm_ufault_map(struct nvkm_object *object, void *argv, u32 argc,
 	return 0;
 }
 
+static void
+nvkm_ufault_del(struct nvif_faultbuf_priv *ufault)
+{
+	struct nvkm_object *object = &ufault->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_faultbuf_impl
+nvkm_ufault_impl = {
+	.del = nvkm_ufault_del,
+};
+
 static int
 nvkm_ufault_fini(struct nvkm_object *object, bool suspend)
 {
@@ -96,31 +113,33 @@ nvkm_ufault = {
 };
 
 int
-nvkm_ufault_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-		void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_ufault_new(struct nvkm_device *device, const struct nvif_faultbuf_impl **pimpl,
+		struct nvif_faultbuf_priv **ppriv, struct nvkm_object **pobject)
 {
-	union {
-		struct nvif_clb069_v0 v0;
-	} *args = argv;
 	struct nvkm_fault *fault = device->fault;
 	struct nvif_faultbuf_priv *ufault;
-	struct nvkm_fault_buffer *buffer = fault->buffer[fault->func->user.rp];
-	int ret = -ENOSYS;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		args->v0.entries = buffer->entries;
-		args->v0.get = buffer->get;
-		args->v0.put = buffer->put;
-	} else
-		return ret;
+	int ret;
 
 	ufault = kzalloc(sizeof(*ufault), GFP_KERNEL);
 	if (!ufault)
 		return -ENOMEM;
 
-	nvkm_object_ctor(&nvkm_ufault, oclass, &ufault->object);
+	nvkm_object_ctor(&nvkm_ufault, &(struct nvkm_oclass) {}, &ufault->object);
 	ufault->buffer = fault->buffer[fault->func->user.rp];
 
+	ret = nvkm_ufault_init(&ufault->object);
+	if (ret) {
+		nvkm_ufault_del(ufault);
+		return ret;
+	}
+
+	ufault->impl = nvkm_ufault_impl;
+	ufault->impl.entries = ufault->buffer->entries;
+	ufault->impl.get = ufault->buffer->get;
+	ufault->impl.put = ufault->buffer->put;
+
+	*pimpl = &ufault->impl;
+	*ppriv = ufault;
 	*pobject = &ufault->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h
new file mode 100644
index 000000000000..2408aa3ec91c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UFAULT_H__
+#define __NVKM_UFAULT_H__
+#include <subdev/fault.h>
+#include <nvif/driverif.h>
+
+int nvkm_ufault_new(struct nvkm_device *, const struct nvif_faultbuf_impl **,
+		    struct nvif_faultbuf_priv **, struct nvkm_object **);
+#endif
-- 
2.41.0

