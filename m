Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7B8A790B
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580F3112F8A;
	Tue, 16 Apr 2024 23:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R2gg9Fk1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77F4112F8A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVQPHSggsVgNW3DYMUXh6b4dt8hG1Bk2CrYfK6EtP6KxY3IKZl8KpA+9sfJvjvqL0/COGN610vliEyir7SVJNFr3TVapGy1Vxij5lCQjpkPTtk0t1YCoNWAASWigIc6BOX3hCwOq2A3iZFvfWOi78SkmYBBF4wAU8CFCCfkBOm5ZBlQUuK+QrTtwcpSnTJty9ot438x5yWa+zHVm8TvmU7aI7gCQQPf/npJnVXo8SA+CMvs+0UuLg1wDYSCrDa9JpJq9KFX14HKm5DT7fLoUIKgwaapco/HkrMd4rosLTxabIha5bE08u3lsTPzk1s8tZdyUO1buxJ+lnyoSmfGcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+OGrE8dDdbP1zSUeP4QnyHTuvnDCx5d6gbtqbg2xAE=;
 b=dt5Kx+fiD9qxflOxhOu1SziBckSpftmyHnarEsAI7STK7IDA02odRL7ImOPfpC1Xds7vDvshRhS8GuDjlZeWg2ryNgEpGlw14uf2Npq+mcfugqRNf6FT5WawYyEs53F4txlv77l7KRYh57dL5LxB/+EeeUBALNnWmwsvzGwUkHp23nArheyyPS+ywxCh6BNXrbSCxy6z5JaZOUoqXOwV8TPn2yP6tmHGCDaqVT61Z9JMEtX6/3U1v7L6Z1p1SyMHK8EyA1qadqZYq0M36HJQpyhqpNai0s4q4l5gEpR5HgOdmFVagl3v7jjFUMbFrKD4Gtvg1731m3gKjcBPkQawGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+OGrE8dDdbP1zSUeP4QnyHTuvnDCx5d6gbtqbg2xAE=;
 b=R2gg9Fk1dxYd3yYwvFPr0trxVTGGQN+KGpSPsOq4okx4MrrGshekQI4y+r1sn6Cjw0FudtXNFIUqTClkOk6DWR9ZYxfWUzIYdRHFskGgDEwL8tzAg4RFzXHDl0nO5h1HYGsl7bMJ7yQbcMqR1FkysZaFepPmtRq3ZlOM5ue6nAPQkLZYw+8qKnd1PhgslDIktupKCUcha3x/XROceb6PpgXIsx3MvLBqPHOTMljf8WySyCK5qvuZ7Hs/zGTqEzRGeeqduQLfQEACiFEbSFgWdCw9EoO9c1e14YRBFT7qqPA5DAMGK3ZrxGi3BZF0OKhZ51Ma0g2RSJq3DkUOzgjMyA==
Received: from DS7PR03CA0104.namprd03.prod.outlook.com (2603:10b6:5:3b7::19)
 by MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:36 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::67) by DS7PR03CA0104.outlook.office365.com
 (2603:10b6:5:3b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:21 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 097/156] drm/nouveau/nvif: rework fault buffer "new event" api
Date: Wed, 17 Apr 2024 09:39:03 +1000
Message-ID: <20240416234002.19509-98-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MW6PR12MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b39f838-908d-47f9-5a0c-08dc5e6ee531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJU20AR89ILK8M1e8T2ZPASvvk8GSKYNwnXF+QcytLJ3OF+WJj6NFMR5fo3PSvqPfhnxmeMGKa8iOchveLv7mzbVEhxXWZsY7lBWBthaHhvlkYBufLfHK0xYIiaR3XaEtutWnGaM5qB4eJfWcICljCx1U7O2MmylNKSgKvnr3RuEiZ6VVI31uj2XJ0T9Nd4FqRxSDit31C+mUNUB0O/PNjssgqBQxSZzVbnl+IPZrDQlL3/omcsR3iM6laiTvX2f7cGMuAbDnCgp0QW5+PG0JCPHA6FMxsm9ZJIbdMgVbC8d0JnMJLhCEcsYmemn8eObpYgxXNpIp0Xq2G0w+6I5OePUraI6yJxwr4JHdEU2n/XHLzZjkXQisS5n/3MizP/f76kvZSpVj1zWO3XYkIwr74g7Args3GnJ6sPDofXZ0F6hg92MO3XbfKDpXoM0JkNDF4cp3qkdR59fYmndyckPZQZtQ3K+VDiLG4cOy2s3oVDNPcVFOxPiUDw87zJ8VvIMKVYXwTc7l+YKwDRBv04lHWq3qFEnwz4iAI0KySfqL7SYmLOsrP3AjMmuwq9U1/8NRq4szmXDIkY4pydiIJ9IvC9xJeEndkzOSaZo2U9QTBRK8GS2mhBWa8RRAvSLAfa7okGqbB7xyssLtqgW2edOk5tKtbq9kuSGoPy7kyvwZjnJ9/2j+i+whj8pjPvbuMPBD7W476HiT0Mx0EE1izTQ7lHozB3KsiCRR/DJ8cJGheQGlFuGcF6BKIj54P4az38q
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:36.2835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b39f838-908d-47f9-5a0c-08dc5e6ee531
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8733
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
 drivers/gpu/drm/nouveau/include/nvif/clb069.h |  8 ---
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 12 ++++
 drivers/gpu/drm/nouveau/include/nvif/event.h  |  3 +
 .../gpu/drm/nouveau/include/nvkm/core/event.h |  9 ++-
 drivers/gpu/drm/nouveau/nouveau_svm.c         |  8 ++-
 drivers/gpu/drm/nouveau/nvif/event.c          | 33 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    | 65 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  | 20 ++----
 8 files changed, 126 insertions(+), 32 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clb069.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/clb069.h b/drivers/gpu/drm/nouveau/include/nvif/clb069.h
deleted file mode 100644
index 67bf579ced18..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/clb069.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef __NVIF_CLB069_H__
-#define __NVIF_CLB069_H__
-
-union nvif_clb069_event_args {
-	struct nvif_clb069_event_vn {
-	} vn;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index ba987233ec74..81375819c787 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVIF_DRIVERIF_H__
 #define __NVIF_DRIVERIF_H__
+struct nvif_event_priv;
 struct nvif_client_priv;
 struct nvif_device_priv;
 struct nvif_control_priv;
@@ -19,6 +20,12 @@ struct nvif_driver {
 	void (*unmap)(struct nvif_client_priv *, void __iomem *ptr, u32 size);
 };
 
+struct nvif_event_impl {
+	void (*del)(struct nvif_event_priv *);
+	int (*allow)(struct nvif_event_priv *);
+	int (*block)(struct nvif_event_priv *);
+};
+
 struct nvif_mapinfo {
 	enum nvif_map_type {
 		NVIF_MAP_IO,
@@ -202,6 +209,11 @@ struct nvif_faultbuf_impl {
 	u32 entries;
 	u32 get;
 	u32 put;
+
+	struct {
+		int (*new)(struct nvif_faultbuf_priv *, u64 token,
+			   const struct nvif_event_impl **, struct nvif_event_priv **);
+	} event;
 };
 
 struct nvif_device_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/event.h b/drivers/gpu/drm/nouveau/include/nvif/event.h
index 1683e138c7f8..338082bdc67c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/event.h
@@ -10,7 +10,10 @@ struct nvif_event;
 typedef int (*nvif_event_func)(struct nvif_event *, void *repv, u32 repc);
 
 struct nvif_event {
+	const struct nvif_event_impl *impl;
+	struct nvif_event_priv *priv;
 	struct nvif_object object;
+
 	nvif_event_func func;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
index 460459af272d..f31f0f30732a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/event.h
@@ -4,7 +4,6 @@
 #include <core/os.h>
 struct nvkm_object;
 struct nvkm_oclass;
-struct nvkm_uevent;
 
 struct nvkm_event {
 	const struct nvkm_event_func *func;
@@ -72,6 +71,12 @@ void nvkm_event_ntfy_block(struct nvkm_event_ntfy *);
 
 typedef int (*nvkm_uevent_func)(struct nvkm_object *, u64 token, u32 bits);
 
+struct nvif_event_impl;
+struct nvif_event_priv;
+int nvkm_uevent_new_(struct nvkm_object *parent, u64 handle, struct nvkm_event *event,
+		     bool wait, int id, u32 bits, nvkm_uevent_func,
+		     const struct nvif_event_impl **, struct nvif_event_priv **);
 int nvkm_uevent_new(const struct nvkm_oclass *, void *argv, u32 argc, struct nvkm_object **);
-int nvkm_uevent_add(struct nvkm_uevent *, struct nvkm_event *, int id, u32 bits, nvkm_uevent_func);
+int nvkm_uevent_add(struct nvif_event_priv *, struct nvkm_event *, int id, u32 bits,
+		    nvkm_uevent_func);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 43218da5d0f3..382f886e4130 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -29,7 +29,6 @@
 #include <nvif/vmm.h>
 
 #include <nvif/class.h>
-#include <nvif/clb069.h>
 #include <nvif/ifc00d.h>
 
 #include <linux/sched/mm.h>
@@ -998,11 +997,14 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 
 	INIT_WORK(&buffer->work, nouveau_svm_fault);
 
-	ret = nvif_event_ctor(&buffer->object, "svmFault", id, nouveau_svm_event, true, NULL, 0,
-			      &buffer->notify);
+	ret = buffer->impl->event.new(buffer->priv, nvif_handle(&buffer->notify.object),
+				      &buffer->notify.impl, &buffer->notify.priv);
 	if (ret)
 		return ret;
 
+	nvif_event_ctor(&buffer->object, "svmFaultEvent", buffer->id, nouveau_svm_event,
+			&buffer->notify);
+
 	buffer->fault = kvcalloc(buffer->entries, sizeof(*buffer->fault), GFP_KERNEL);
 	if (!buffer->fault)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nvif/event.c b/drivers/gpu/drm/nouveau/nvif/event.c
index 61ff4d6eba9f..5b8ec641703b 100644
--- a/drivers/gpu/drm/nouveau/nvif/event.c
+++ b/drivers/gpu/drm/nouveau/nvif/event.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <nvif/event.h>
+#include <nvif/driverif.h>
 #include <nvif/printf.h>
 
 #include <nvif/class.h>
@@ -28,29 +29,51 @@
 int
 nvif_event_block(struct nvif_event *event)
 {
-	if (nvif_event_constructed(event)) {
+	int ret;
+
+	if (!event->impl && nvif_event_constructed(event)) {
 		int ret = nvif_mthd(&event->object, NVIF_EVENT_V0_BLOCK, NULL, 0);
 		NVIF_ERRON(ret, &event->object, "[BLOCK]");
 		return ret;
 	}
-	return 0;
+
+	if (!event->impl)
+		return 0;
+
+	ret = event->impl->block(event->priv);
+	NVIF_ERRON(ret, &event->object, "[BLOCK]");
+	return ret;
 }
 
 int
 nvif_event_allow(struct nvif_event *event)
 {
-	if (nvif_event_constructed(event)) {
+	int ret;
+
+	if (!event->impl && nvif_event_constructed(event)) {
 		int ret = nvif_mthd(&event->object, NVIF_EVENT_V0_ALLOW, NULL, 0);
 		NVIF_ERRON(ret, &event->object, "[ALLOW]");
 		return ret;
 	}
-	return 0;
+
+	if (!event->impl)
+		return 0;
+
+	ret = event->impl->allow(event->priv);
+	NVIF_ERRON(ret, &event->object, "[ALLOW]");
+	return ret;
 }
 
 void
 nvif_event_dtor(struct nvif_event *event)
 {
-	nvif_object_dtor(&event->object);
+	if (!event->impl) {
+		nvif_object_dtor(&event->object);
+		return;
+	}
+
+	event->impl->del(event->priv);
+	event->impl = NULL;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
index 900814c9a6bd..d922eebb689c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -22,6 +22,7 @@
 #include <core/event.h>
 #include <core/client.h>
 
+#include <nvif/driverif.h>
 #include <nvif/if000e.h>
 
 struct nvif_event_priv {
@@ -71,6 +72,38 @@ nvkm_uevent_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	return -EINVAL;
 }
 
+static int
+nvkm_uevent_block(struct nvif_event_priv *uevent)
+{
+	nvkm_event_ntfy_block(&uevent->ntfy);
+	atomic_set(&uevent->allowed, 0);
+	return 0;
+}
+
+static int
+nvkm_uevent_allow(struct nvif_event_priv *uevent)
+{
+	nvkm_event_ntfy_allow(&uevent->ntfy);
+	atomic_set(&uevent->allowed, 1);
+	return 0;
+}
+
+static void
+nvkm_uevent_del(struct nvif_event_priv *uevent)
+{
+	struct nvkm_object *object = &uevent->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_event_impl
+nvkm_uevent_impl = {
+	.del = nvkm_uevent_del,
+	.allow = nvkm_uevent_allow,
+	.block = nvkm_uevent_block,
+};
+
 static int
 nvkm_uevent_fini(struct nvkm_object *object, bool suspend)
 {
@@ -154,3 +187,35 @@ nvkm_uevent_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	uevent->ntfy.event = NULL;
 	return parent->func->uevent(parent, &args->v0.data, argc - sizeof(args->v0), uevent);
 }
+
+int
+nvkm_uevent_new_(struct nvkm_object *parent, u64 handle, struct nvkm_event *event,
+		 bool wait, int id, u32 bits, nvkm_uevent_func func,
+		 const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
+{
+	struct nvif_event_priv *uevent;
+	int ret;
+
+	uevent = kzalloc(sizeof(*uevent), GFP_KERNEL);
+	if (!uevent)
+		return -ENOMEM;
+
+	nvkm_object_ctor(&nvkm_uevent, &(struct nvkm_oclass) {}, &uevent->object);
+	uevent->object.object = handle;
+	uevent->parent = parent;
+	uevent->func = NULL;
+	uevent->wait = wait;
+	uevent->ntfy.event = NULL;
+
+	ret = nvkm_uevent_add(uevent, event, id, bits, func);
+	if (ret) {
+		kfree(uevent);
+		return ret;
+	}
+
+	*pimpl = &nvkm_uevent_impl;
+	*ppriv = uevent;
+
+	nvkm_object_link(parent, &uevent->object);
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
index de7a79607eff..cbe1ead00a02 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -26,9 +26,6 @@
 #include <core/event.h>
 #include <subdev/mmu.h>
 
-#include <nvif/clb069.h>
-#include <nvif/unpack.h>
-
 struct nvif_faultbuf_priv {
 	struct nvkm_object object;
 	struct nvkm_fault_buffer *buffer;
@@ -37,18 +34,13 @@ struct nvif_faultbuf_priv {
 };
 
 static int
-nvkm_ufault_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
+nvkm_ufault_event_new(struct nvif_faultbuf_priv *ufault, u64 token,
+		      const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
 {
-	struct nvkm_fault_buffer *buffer = container_of(object, struct nvif_faultbuf_priv, object)->buffer;
-	union nvif_clb069_event_args *args = argv;
-
-	if (!uevent)
-		return 0;
-	if (argc != sizeof(args->vn))
-		return -ENOSYS;
+	struct nvkm_fault_buffer *buffer = ufault->buffer;
 
-	return nvkm_uevent_add(uevent, &buffer->fault->event, buffer->id,
-			       NVKM_FAULT_BUFFER_EVENT_PENDING, NULL);
+	return nvkm_uevent_new_(&ufault->object, token, &buffer->fault->event, true, buffer->id,
+				NVKM_FAULT_BUFFER_EVENT_PENDING, NULL, pimpl, ppriv);
 }
 
 static void
@@ -63,6 +55,7 @@ nvkm_ufault_del(struct nvif_faultbuf_priv *ufault)
 static const struct nvif_faultbuf_impl
 nvkm_ufault_impl = {
 	.del = nvkm_ufault_del,
+	.event.new = nvkm_ufault_event_new,
 };
 
 static int
@@ -96,7 +89,6 @@ nvkm_ufault = {
 	.dtor = nvkm_ufault_dtor,
 	.init = nvkm_ufault_init,
 	.fini = nvkm_ufault_fini,
-	.uevent = nvkm_ufault_uevent,
 };
 
 int
-- 
2.41.0

