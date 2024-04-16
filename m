Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885D8A790C
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDEE112F8B;
	Tue, 16 Apr 2024 23:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="emWJFKIV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B3C112F86
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTfvEBXArsdghaUSzbeWHEOLG4ZXRtQcuwx/cbJ+0bn7RGCr0MfDYrgzgVEmQYLxub9OS/2m0lAds9QmjmozYC1+omL+Ric0UuXe5XmeXssHZ/eettGn/1sBOoAaFXUPQwp0Ww2JsOs+oiPxZyDSquGpR3bLAfVR5Fh73zRcXgS1Oq3rmcnjYsBZYw+ghiKEEoKnZLbMuomf9UvbEp2yYSsRVlDcDoeq+igeBs+G5XcmVUvrgrNl5Ub3EtWPQJv1qgIOlHIez3qmIkHwxVd/4QAwYIZXnsyZ/aBFg9AIB2wZ7TZGEGbIKoITkHW80K9of1yOhLesPaSKyN3Vxgfsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzAndIlFSe+DdwCrtGCtdcSeP/MURfJEUz+0vN3UMtE=;
 b=AcOSy5PqD5noWRgjpGCl/zWRKC6hP9hwpNt8U8Ol6WOrdYLU1y7j3tT32b+wUJL60eKIAP79/4kTPYxyQWmtPZtc/aW9KNCCOafW4/t0LiJ8mJFfksnw0tYzLMLBFIqdnX3A8youpgaUgiGg8YvSMUBRTUNUYlvJLSwR1XBfkQbxyUDB3fACdUSN4vMk6/AcjxujDtY3ksYgyOZcXZfvgWVs01MHuh16REDc3N2kpDZ5dOIe2pvj9MW+YTbSsjb6WA7P168t9nz8mVR3sOk7yU9Vsd9yzvXB6/J7d3AffKawp0R0VA/3KeqW0RJj4yMgEwYR5r0/w4xY+nzGRGvW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzAndIlFSe+DdwCrtGCtdcSeP/MURfJEUz+0vN3UMtE=;
 b=emWJFKIVAplb2NU3NbvB0Co0OXxmdWmWM75KRwjoRjMvqZpVaMpIp0a/rRfUB0CLo+x44+66jzHpx7j6+gp3F4/JIOLcuHwlKmb+3Ew+2AgWfYoc1WwLxvTpCcIcH4hdMFfrrYDgULYNplWUcm/S5ktd9C1ox8h+Pb8GYyWSJSpLQG6iBY7qpda3dXBuTXE/xD4dO+3rG2cMGBk6M2LIY6VgwVzAP8ceOrD2iku9rVmqx3Uoks5r6nogr9VIZRfmphYaclYI9sGLCMq4o80eiJQ0GQp5fM0BW2XGYOjbmOaOt58D9VLGZc5WwA7HmOGQmXXJ+kUCyQiDTzZWvPzD1Q==
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Tue, 16 Apr
 2024 23:42:37 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::bf) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:22 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 098/156] drm/nouveau/nvif: remove fault buffer from object rb
Date: Wed, 17 Apr 2024 09:39:04 +1000
Message-ID: <20240416234002.19509-99-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c732906-0be4-4304-9714-08dc5e6ee599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgyggKDMJWTfiVeEXw6ganljGyi0P/Y9Q21HsburtKYM8NqysG4rOrpuO9OnwByGtUAC5DaGUHrpIXdpXj2VXdz4OruUdHvQDXurqb03l6A8ruVRJh5Df33YXvztMAKR/pwd8bYo/8Lzg69K1/0dnB+bn+PvjDgNUA3AuQh58kcQSgXE7TbLVmD74m6qMGcrg4DoW8/WVYcg49NOEq5EVEahNbeXJi2xtFOcmaI/Avhxq9oxnUzBzDuyTRdVHkrPL3z/F3t5OPavmzL7jLi6C76ZeWlhLyZRsDAGPb8FDEO+RtG79L23a241GbbVuO40BeG8glVWwQvfDE9Zk4rvl/2GSUQ/6EajDtzrRDVgxU90kQTqWdOgHVX1jxJQqlIv+CSCiHTXz3y2jviBDfqCTfB8hb4V/13bbJ6VYb1ryM4DMMNQ2hV/sPx/E3KkqnYq6TGY1AbEkcr5CRBDIzcpWvPqopDVrJ9ImmEstKUldN980Da/K8HhiraoROnvvYHniOa7hp+AKG0mELT6baqJwO09TN7P27tQmylMbJKyClml7QKxF7ePjYXNzLdOkZKxZEGXom7o91vx/gmGu7yy/i5Ii1R4qRHUSKqeg/PGY4TGVwZYa0WjCSL84G6tGebCWHj0ditR7mmt5k+Y5LWIMFT21RxIYbrUkOkx48dNE8h1x3PLXkVbA49LeSDhBADmfHq54t7wdZZ0ynjuf6YJ3JW3POPn2bitgk3DZECPi60YUOF76JJBFzLD0pToOz6j
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:36.9823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c732906-0be4-4304-9714-08dc5e6ee599
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nouveau_svm.c           | 3 +--
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 81375819c787..42e6324ddfe3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -277,8 +277,7 @@ struct nvif_device_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_device_priv *,
-			   const struct nvif_faultbuf_impl **, struct nvif_faultbuf_priv **,
-			   u64 handle);
+			   const struct nvif_faultbuf_impl **, struct nvif_faultbuf_priv **);
 	} faultbuf;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 382f886e4130..534448f82daa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -979,8 +979,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 
 	buffer->id = id;
 
-	ret = drm->device.impl->faultbuf.new(drm->device.priv, &buffer->impl, &buffer->priv,
-					     nvif_handle(&buffer->object));
+	ret = drm->device.impl->faultbuf.new(drm->device.priv, &buffer->impl, &buffer->priv);
 	if (ret) {
 		SVM_ERR(svm, "Fault buffer allocation failed: %d", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index b4604ce1fcbb..eb33ab81d7e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -44,8 +44,7 @@ struct nvif_device_priv {
 
 static int
 nvkm_udevice_fault_new(struct nvif_device_priv *udev,
-		       const struct nvif_faultbuf_impl **pimpl, struct nvif_faultbuf_priv **ppriv,
-		       u64 handle)
+		       const struct nvif_faultbuf_impl **pimpl, struct nvif_faultbuf_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -54,7 +53,8 @@ nvkm_udevice_fault_new(struct nvif_device_priv *udev,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

