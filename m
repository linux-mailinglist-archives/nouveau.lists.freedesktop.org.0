Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB668A78E4
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDD0112F53;
	Tue, 16 Apr 2024 23:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="okeAPFa0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A35112F52
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7sY8InYkT27hp2vaNDZl21c2p2IxBAzyK/XdwjP1WshgI46HbzksOs72PAR8UACuYQ2Os8LPpOiZe3nFxr6oeXhwDAtioSRSSuQ/840H4a8uxMAkJ9qOV1Se9GqyQO4n3yIgw3JZQ9W3XwSgFpY79Nm+QPGKBHiT3hcBhx36dXJ2UYDBTUQLHWEpg8gjuKCNvAOlbIZzKFjbZrKwRUEOAAkEN4T8Z2Zvs65ScEsAcLdUTP34fwCTtueXSIHLpNqxhDr5nLoih3v+8j/yXlzEbWtqNX56V7sWPVx0nv6XfC8Tcybd5KSQNAHO0kW61o+/22zfH695OnmmDK+nU0SRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wwvt9u5xkQ3C4MB2obEflsWk8iFFcq8jMb55NRVq3bM=;
 b=mlrzJczWqMkid2SPLSM9dKWEyUkwx+Bs++LvI8M/kacg1uz6W1mx107GAlXFXDHOfSAABTkQo6Ex/rgu3FL3Dv+8Rwy8ZQ4yoc1c99IBcNscNcIAm9WImKSrrEV0BcYdLY4+Vxw9MFB2t27fgYDmuqPLxeG/wMfoqNp1C4gNt3AoKIadmsIkcaWVnh/je1J+uUWQqkpujZloroYgzdo+bU/cWUcfvHMUnHgFqeMJnTgbBXIehrZN/MLS5/FWDk+sJVkMNYXcQ4/VfNQj8yM8r7wceJxSaeIevxgKe0MtSnX1cro0xdtpI4nG10Li1qizPrgilRIWXnwYA1xuQO3IMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wwvt9u5xkQ3C4MB2obEflsWk8iFFcq8jMb55NRVq3bM=;
 b=okeAPFa0MwqVR1RZPHumB8RIw/I/q+JYLPAMzWBmLH0FcBWPvcegM8h0L5jqZk8uFFNCpDBGr9j2SwwDby8dmMfMW/kDcmvTK42bLJWXYY0VT4w1wTjExpdr+XOZ6p6wlWjnm2I3m1vZVvbZOCX3ZmUmA7A5YgRNRm6Elr2QjMqbIn55GePWmZT0lw8Xf75SIzlOBexBYkNhqbq9nGaWJLIclaT/r3qf9kgwBNi8AdKBUZqlceJGpcO3d3IAUsM1WvMFSS0nQzCd0xFC9oYko9EvaO4XXpsGc8ZiP5RR1gb5N/nTTsdNa3r1UBFMa9EahgNvSZeV5EBr8eoHYRsE/w==
Received: from MN2PR16CA0045.namprd16.prod.outlook.com (2603:10b6:208:234::14)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:48 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::62) by MN2PR16CA0045.outlook.office365.com
 (2603:10b6:208:234::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:23 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 046/156] drm/nouveau/nvkm: detach user handling from
 nvkm_fault_buffer
Date: Wed, 17 Apr 2024 09:38:12 +1000
Message-ID: <20240416234002.19509-47-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c4c46e-1cf2-41df-1745-08dc5e6ec861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvE2y1gRqE0HDCVy2Y9TApLATWpigTQLMyA3Cb4sH85T068gNAoGKvhUVYm93kGAP57YrDMviTr02TCtu5IFCssZQPaKvuwFWbyMbTf37RSYcxgmLSYTdIFmM0I4WTUSsJ+WI1629SXno48zwWcEqnL+73Qk7qKmQD+E3ewE6PxvaeXnuPl8OCn3SMAWV00VZJ/nRkrPPneBHToipYM4UohPdM1WYyOw+a3OfiQqT2isJYUin9FNgOsLdAykPv2YdtCYkG6+vEP0HK8FdGkq++qxNCaFhWAdQoT+TquWmMQRiQMOBJ67QB+9DUYCWPRHoODMuvMAvwAhKD5yX5TvcsnBoPjOpeI4fRcyLvRJM/zvoXWn8Tf0NQZMQIeystTK0aQJo33M2VvIFBGz/k3kCzv0EAWql1FwVkCilg41pSEMaPYB1kyB/KgbcgHBv3IZK43NM7tuAA+ITEorFE0kyyHRfaBN8RfyoM3NdFqqV3GglqFmZkrtD58BkgJTfUWDteaAsJfXQAqkh3Y2X2/G01iVPgVtNw9VUueV1heIgLU6hEC4i93iHrVtbxnsfLgmNR1p8/oymn98JDlPo1XsI04ypqsMPQRU3J4GyQW4VQOeAVvtCwaKnj5dMUkKGc4uijB3lhp3mWU8qUp2Gx8lONyMLYk/SV3Jfg6sQVYjGE/8JBOsf2fll/F74RfF57ncCSuH1FQAaAEKdmQzOK+xgRIlbisbgYhB69BIHg8WgJCuCPuCAgunP64DciufEs8l
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:47.8956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c4c46e-1cf2-41df-1745-08dc5e6ec861
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
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
- open-code current nvkm_fault_buffer() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  |  2 --
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  | 30 ++++++++++++++-----
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
index a5510332c402..3c26e76d1d3c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h
@@ -1,6 +1,5 @@
 #ifndef __NVKM_FAULT_PRIV_H__
 #define __NVKM_FAULT_PRIV_H__
-#define nvkm_fault_buffer(p) container_of((p), struct nvkm_fault_buffer, object)
 #define nvkm_fault(p) container_of((p), struct nvkm_fault, subdev)
 #include <subdev/fault.h>
 
@@ -8,7 +7,6 @@
 #include <core/object.h>
 
 struct nvkm_fault_buffer {
-	struct nvkm_object object;
 	struct nvkm_fault *fault;
 	int id;
 	int entries;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
index c123e5893d76..6c3ede8b0321 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c
@@ -28,10 +28,15 @@
 #include <nvif/clb069.h>
 #include <nvif/unpack.h>
 
+struct nvif_faultbuf_priv {
+	struct nvkm_object object;
+	struct nvkm_fault_buffer *buffer;
+};
+
 static int
 nvkm_ufault_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
-	struct nvkm_fault_buffer *buffer = nvkm_fault_buffer(object);
+	struct nvkm_fault_buffer *buffer = container_of(object, struct nvif_faultbuf_priv, object)->buffer;
 	union nvif_clb069_event_args *args = argv;
 
 	if (!uevent)
@@ -47,7 +52,7 @@ static int
 nvkm_ufault_map(struct nvkm_object *object, void *argv, u32 argc,
 		enum nvkm_object_map *type, u64 *addr, u64 *size)
 {
-	struct nvkm_fault_buffer *buffer = nvkm_fault_buffer(object);
+	struct nvkm_fault_buffer *buffer = container_of(object, struct nvif_faultbuf_priv, object)->buffer;
 	struct nvkm_device *device = buffer->fault->subdev.device;
 	*type = NVKM_OBJECT_MAP_IO;
 	*addr = device->func->resource_addr(device, 3) + buffer->addr;
@@ -58,7 +63,9 @@ nvkm_ufault_map(struct nvkm_object *object, void *argv, u32 argc,
 static int
 nvkm_ufault_fini(struct nvkm_object *object, bool suspend)
 {
-	struct nvkm_fault_buffer *buffer = nvkm_fault_buffer(object);
+	struct nvif_faultbuf_priv *ufault = container_of(object, typeof(*ufault), object);
+	struct nvkm_fault_buffer *buffer = ufault->buffer;
+
 	buffer->fault->func->buffer.fini(buffer);
 	return 0;
 }
@@ -66,7 +73,9 @@ nvkm_ufault_fini(struct nvkm_object *object, bool suspend)
 static int
 nvkm_ufault_init(struct nvkm_object *object)
 {
-	struct nvkm_fault_buffer *buffer = nvkm_fault_buffer(object);
+	struct nvif_faultbuf_priv *ufault = container_of(object, typeof(*ufault), object);
+	struct nvkm_fault_buffer *buffer = ufault->buffer;
+
 	buffer->fault->func->buffer.init(buffer);
 	return 0;
 }
@@ -74,7 +83,7 @@ nvkm_ufault_init(struct nvkm_object *object)
 static void *
 nvkm_ufault_dtor(struct nvkm_object *object)
 {
-	return NULL;
+	return container_of(object, struct nvif_faultbuf_priv, object);
 }
 
 static const struct nvkm_object_func
@@ -94,6 +103,7 @@ nvkm_ufault_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 		struct nvif_clb069_v0 v0;
 	} *args = argv;
 	struct nvkm_fault *fault = device->fault;
+	struct nvif_faultbuf_priv *ufault;
 	struct nvkm_fault_buffer *buffer = fault->buffer[fault->func->user.rp];
 	int ret = -ENOSYS;
 
@@ -104,7 +114,13 @@ nvkm_ufault_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 	} else
 		return ret;
 
-	nvkm_object_ctor(&nvkm_ufault, oclass, &buffer->object);
-	*pobject = &buffer->object;
+	ufault = kzalloc(sizeof(*ufault), GFP_KERNEL);
+	if (!ufault)
+		return -ENOMEM;
+
+	nvkm_object_ctor(&nvkm_ufault, oclass, &ufault->object);
+	ufault->buffer = fault->buffer[fault->func->user.rp];
+
+	*pobject = &ufault->object;
 	return 0;
 }
-- 
2.41.0

