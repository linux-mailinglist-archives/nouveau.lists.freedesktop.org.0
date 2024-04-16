Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBF8A791A
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65918112FA9;
	Tue, 16 Apr 2024 23:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pIMwu+E0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0B112F9F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3i+iW8rPzRqoXR7v2fCSRQ9qMUyZEschGiQDkurrVj7b5C/diJxzVNAwtiYOpA+pZa3qkTXIs0WFarLK5RnEmvLIJT4rG3X3ua/oSX1GApBI7LD8yCMZFocttv7SfJrlLroviJ2aTRYiTlQwISyncJNdpGDGcdgyLBPjaecSXIpBp4NNvheK5ADllAPyRV+DCX/6Wh5zxf/FxUOCm80xytZBOaI3E7GcNT2SOhkshC6gvqVAYw+gVW7b21PGJ3+q43e5tXXJsnKEzxitxIeF8kUkJ/jy9Y+QKYBjaBR6RMD8ZBnfmq2pRNIbOLIjkYODU0eZwqpjmFjyAifCfLl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg5gawDq79ucdFj2qLcEqZT8FgeQyIxbVNhkdUkKZ9Y=;
 b=HqUUn6+fQhNzE8iZVL8E8Hj9fRFHtCGV2YrTE1meNN2FyM/SgqCuJC9KRLz/w5hiOgi96ZtS4JJ6TxzLuxLuIdmxc34Wb3OWPxiFmLP/ggnx38wqtrv3Jmg4Rkt7RRSnzo+G1hsNTgOhZ/yDCYex6sz5IncWAXiCM2EALQFf0Vn+vSJXMJDvEAXxbDIC4KBIMuz2U6nStgEPgmInFWOH+ruttU5afLdwS7XSUjCBIU11dXZYc+8wXXnM6gbngB3So0N7tPS7hpoYSKBvaRY7WEeXZ8Jofrl/mFeQQhBsNnf6x2o/NorAwJj1149xJe4mCJsBnK7lBNMkspXGUu8smw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg5gawDq79ucdFj2qLcEqZT8FgeQyIxbVNhkdUkKZ9Y=;
 b=pIMwu+E0DppyMUiKV+KSInLO7NaUX/I92qtBkBWx/mFgZLGUR+K9JBO8nQTerdqs3YNnQhk3x3liT7YnGkMBJ4hqHGS4Fw7w7jYJc0edSxbrvG445QGKng1rfI/+rU3eF+Xka8hj63Q6K9uhcQlqPUmrrDzYi3H+YqVqwTS/0p/35NANNT104OKNHnAnW/6BSj1CkRclsWNPm/xvIssXyeybHlDBRDAVJd9nPS9JOUUKoB8nIflYr8oSXZ4EUdzWxrwpuMPxuRVRXaWa4eE1xFHPi1dCHpSNEbmOfgAqLorGQj2qjG+zYt2vk2VbeHLTh/9u9ixot76Jv9kIj+gK0Q==
Received: from DM6PR02CA0048.namprd02.prod.outlook.com (2603:10b6:5:177::25)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:50 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::d9) by DM6PR02CA0048.outlook.office365.com
 (2603:10b6:5:177::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:50 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:28 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 103/156] drm/nouveau/nvif: rework conn "new event" api
Date: Wed, 17 Apr 2024 09:39:09 +1000
Message-ID: <20240416234002.19509-104-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0c3d0f-d972-42b7-6a11-08dc5e6eed78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7XT4PRikimK0e/UAFO3dTikvxO6KqFJA+z/Eyd7ZZRdBrsQLnI/X3InxHcbVVjsNoSEgP4gBAuCNeVuGFrlHnL+KnRod+G+VCgA01UPXuAFf3LfYrreZouRkoZNCcD/q0DJkISRWUWoBToXx1rMWvf/QsB/5F+NZCetxptAVErtTrcfWB5h4q4t9vmBkA+FNoQPdfgfW8e609VEfubwBW2zpBQ9LUM8dR3uQkQo5QTvJZk4TI6xAp7UohX96Y45SxlkYhfNSEKInmiTSZD/KNoRjFDABof6Uh/R85KPJf68WHaaHPkQILalQAHPmVQV0gjFr753VH2spnprsRcrExAHaJ1qceoYWPrCW/Qn7pY1ZE2e3hHjEyvEATYWFIVj8NQi2o+NeVrs6+QK8BmAqFnibuUhwiEApZ0H4E5HQTDpd7non3coFmgnZFAfx0i8Z0/l8mtzSZgKBp20v200TEEnHdXDU8bsvFMEr+ohCk4tke9ZbBFVDtxlAGtZNzOpzebc8Xf9YuRoCDTcr9C37V64SFWBg9PrvruAX5w8NjWWvtg7dytelFgFdnksTRaxe6I1FUGjxtUss6gSBr3sb06ZJB7ngy6+AwtlzYxqjBCKB6PZ0AhnChfKoD/7U540k4yqoY6jrwaSDbfLPgcApZMAdJTkyEjSjlGasGHZtbhV9Fb2wPiPVjATSW6TsEhszpMK2zYoUv+4XA+Jx33v8Av6cAbYmOD9ixfNjuSOBQUtzy1uo9xNnak1CkRJCVGg
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:50.1710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0c3d0f-d972-42b7-6a11-08dc5e6eed78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  6 ---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 ++
 drivers/gpu/drm/nouveau/nvif/conn.c           | 22 ++++----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 50 ++++++++-----------
 4 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index 0f0ca002fe47..40c6424d82bf 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -17,12 +17,6 @@ struct nvif_conn {
 int nvif_conn_ctor(struct nvif_disp *, const char *name, int id, struct nvif_conn *);
 void nvif_conn_dtor(struct nvif_conn *);
 
-static inline int
-nvif_conn_id(struct nvif_conn *conn)
-{
-	return conn->object.handle;
-}
-
 int nvif_conn_event_ctor(struct nvif_conn *, const char *name, nvif_event_func, u8 types,
 			 struct nvif_event *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index fb741c7293f6..489f50d6ee00 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -238,6 +238,9 @@ struct nvif_conn_impl {
 		NVIF_CONN_DP,
 		NVIF_CONN_EDP,
 	} type;
+
+	int (*event)(struct nvif_conn_priv *, u64 handle, u8 types,
+		     const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
 struct nvif_disp_impl {
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index 48927282a7ce..d4e9f0275d1e 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -23,25 +23,23 @@
 #include <nvif/disp.h>
 #include <nvif/printf.h>
 
-#include <nvif/if0011.h>
-
 int
 nvif_conn_event_ctor(struct nvif_conn *conn, const char *name, nvif_event_func func, u8 types,
 		     struct nvif_event *event)
 {
-	struct {
-		struct nvif_event_v0 base;
-		struct nvif_conn_event_v0 conn;
-	} args;
 	int ret;
 
-	args.conn.version = 0;
-	args.conn.types = types;
+	if (!conn->impl->event)
+		return -ENODEV;
 
-	ret = nvif_event_ctor_(&conn->object, name ?: "nvifConnHpd", nvif_conn_id(conn),
-			       func, true, &args.base, sizeof(args), false, event);
-	NVIF_DEBUG(&conn->object, "[NEW EVENT:HPD types:%02x]", types);
-	return ret;
+	ret = conn->impl->event(conn->priv, nvif_handle(&event->object), types,
+				&event->impl, &event->priv);
+	NVIF_ERRON(ret, &conn->object, "[NEW EVENT:HPD types:%02x]", types);
+	if (ret)
+		return ret;
+
+	nvif_event_ctor(&conn->object, name ?: "nvifConnHpd", conn->id, func, event);
+	return 0;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 5f72db9276b8..9c7b83c99b80 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -98,24 +98,15 @@ nvkm_connector_is_dp_dms(u8 type)
 }
 
 static int
-nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
+nvkm_uconn_event(struct nvif_conn_priv *uconn, u64 handle, u8 types,
+		 const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
 {
-	struct nvkm_conn *conn = container_of(object, struct nvif_conn_priv, object)->conn;
+	struct nvkm_conn *conn = uconn->conn;
 	struct nvkm_disp *disp = conn->disp;
 	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_outp *outp;
-	union nvif_conn_event_args *args = argv;
 	u64 bits = 0;
 
-	if (!uevent) {
-		if (!disp->rm.client.gsp && conn->info.hpd == DCB_GPIO_UNUSED)
-			return -ENOSYS;
-		return 0;
-	}
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
 	list_for_each_entry(outp, &conn->disp->outps, head) {
 		if (outp->info.connector == conn->index)
 			break;
@@ -125,33 +116,34 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 		return -EINVAL;
 
 	if (disp->rm.client.gsp) {
-		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_DPYID_PLUG;
-		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_DPYID_UNPLUG;
-		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_DPYID_IRQ;
+		if (types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_DPYID_PLUG;
+		if (types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_DPYID_UNPLUG;
+		if (types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_DPYID_IRQ;
 
-		return nvkm_uevent_add(uevent, &disp->rm.event, outp->index, bits,
-				       nvkm_uconn_uevent_gsp);
+		return nvkm_uevent_new_(&uconn->object, handle, &disp->rm.event, true,
+					outp->index, bits, nvkm_uconn_uevent_gsp, pimpl, ppriv);
 	}
 
 	if (outp->dp.aux && !outp->info.location) {
-		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_I2C_PLUG;
-		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
-		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_I2C_IRQ;
+		if (types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_I2C_PLUG;
+		if (types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
+		if (types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_I2C_IRQ;
 
-		return nvkm_uevent_add(uevent, &device->i2c->event, outp->dp.aux->id, bits,
-				       nvkm_uconn_uevent_aux);
+		return nvkm_uevent_new_(&uconn->object, handle, &device->i2c->event, true,
+					outp->dp.aux->id, bits, nvkm_uconn_uevent_aux,
+					pimpl, ppriv);
 	}
 
-	if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_GPIO_HI;
-	if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
-	if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
+	if (types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_GPIO_HI;
+	if (types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
+	if (types & NVIF_CONN_EVENT_V0_IRQ) {
 		/* TODO: support DP IRQ on ANX9805 and remove this hack. */
 		if (!outp->info.location && !nvkm_connector_is_dp_dms(conn->info.type))
 			return -EINVAL;
 	}
 
-	return nvkm_uevent_add(uevent, &device->gpio->event, conn->info.hpd, bits,
-			       nvkm_uconn_uevent_gpio);
+	return nvkm_uevent_new_(&uconn->object, handle, &device->gpio->event, true,
+				conn->info.hpd, bits, nvkm_uconn_uevent_gpio, pimpl, ppriv);
 }
 
 static void
@@ -182,7 +174,6 @@ nvkm_uconn_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uconn = {
 	.dtor = nvkm_uconn_dtor,
-	.uevent = nvkm_uconn_uevent,
 };
 
 int
@@ -244,6 +235,9 @@ nvkm_uconn_new(struct nvkm_disp *disp, u8 id, const struct nvif_conn_impl **pimp
 	nvkm_object_ctor(&nvkm_uconn, &(struct nvkm_oclass) {}, &uconn->object);
 	uconn->impl = nvkm_uconn_impl;
 	uconn->impl.type = type;
+	if (disp->rm.client.gsp || conn->info.hpd != DCB_GPIO_UNUSED)
+		uconn->impl.event = nvkm_uconn_event;
+
 	uconn->conn = conn;
 
 	*pimpl = &uconn->impl;
-- 
2.41.0

