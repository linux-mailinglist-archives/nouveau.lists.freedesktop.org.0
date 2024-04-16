Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017E8A78B0
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B2B112F21;
	Tue, 16 Apr 2024 23:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ni0R/8UZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9432C112F21
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YT7GN/iXG7zOidAdKwyXRpgZVhOYan44bpw6IfyaTWPJvzG9j48AJ3VDJrj1FGj95pV2j8OQew2NgxE1T1RaGg17XA2YNPHjnIb6n+UV/q4viIb4JZChhlRd6B5WQ2a2PvAvWLPtqgtpouVVeDT75b9uqMzBURLvv66QCNjFpeQYmuTB1VF2CITWZ2eEvSTy16QSkXz9K79//WfjFQ0ftn+kbSQG7DhGMwkgYLwIar1k1oKJrcd4b2KGbrptwlUU59UefW7BY8HUwUu7VwceWtE0BsKxoFQZ11BKL7OqqikvYgJL0PvBiA/nTt2SqSFFIPQl8+v2qgBT7+xkUUeqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMYVMLhJ5FCavLwFBeuzowA74lkdSvPIOv5nW+TR5+o=;
 b=EB8N4QADgHsvYyFtt++Tk4kvH2AzPfDhEIIo1lka9cLuJcjxboc3/oRBnYFlE3IY2u0UPsOQajLgoEf43WQrkjotaimbui2pW2771TTRKDJHdo1iqBvUksSBe/D1KfUU7z5RmMLA7g3COxGZe1/ZdO9U2rtwdTCJRkLTYBf+l6ul5n/k5l1LCZGb8KcW2dQSkUWNt5dhRcwDjXJOIA/BGci8WJWxy15FqkPWxyzJeGRRtsid0jLIJREbtB1Q2+1Dw3vp6AmV6+rkG7IDst4id9DVgwM+ZmxfrdUMcC9rXpMJR287W20cwfgh67ASWWV86hbbgmkpzEa2hhopGg4oDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMYVMLhJ5FCavLwFBeuzowA74lkdSvPIOv5nW+TR5+o=;
 b=Ni0R/8UZR++ZiCiaQBfhKfwds9jPazWifpgi5OmB0K3pgJkMCa8S6kIIes44NkYimObPdkeblNrkm4Q5IBNoaPlIPObMZk6kYEmZn/p+1JSFz79rHeLjWZHiZdG1O8yW1AHqJ9LuMnjGskdnWpI0TSDyWolElD6DmIA7LmwPhQghwP+oz+t3GdiVWQjja1eVbVWuMmqGvxrmfPlixSgTEopRaqcYsJiAEI+vAVSdK/yBHNyEDbYhZ02a//5h7pXzfEytJH9gwMiHvz9DoZJ3N2vAGpAWk9rkoeuCCtOi4qHp/gVzNVyJUFJGJ8PWc3NoSKhnvSra/MlLMjocEatK9w==
Received: from CH2PR17CA0009.namprd17.prod.outlook.com (2603:10b6:610:53::19)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:00 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::a2) by CH2PR17CA0009.outlook.office365.com
 (2603:10b6:610:53::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.38 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:00 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:42 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 010/156] drm/nouveau: always map device
Date: Wed, 17 Apr 2024 09:37:36 +1000
Message-ID: <20240416234002.19509-11-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|SA0PR12MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: 72517ae9-8f29-4c5d-3eb3-08dc5e6eab93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEF4Uf+xVsJnjJHiGBzwAmUvLJyGEyinpvza9dIpARZaPh+DtxSYhn9u7nvubInk3Ykw7TqaoUn/RSpIR/7xrt5MAwq/TpGSvZK1LgSiqNDl0or+Bc5vnfmZSeUrpm4mvW0dURw01gqwB6fDLzdnKteaZiAbSifNjlAqX0LpA+tJ7ieBUW3MbO6Yao28vQB54REJpM8lgwWnd8P3GJrqCAKCnT25ct7trnUvx0FOnmzstQLlF2ixEm2K3FOFxiTeL0HjRbenfP/h4hzp1jKjR8yCCN6jWYcmQhVvAVXOdsWJ9VigP06PsFaKcByiJTns9+3OR8VKkXclAYMOsAhDZXwrvkRHkClTJunM2m75NKU/85wQCfrnyj0eMyLIH1jNMBTSa+h13oMacUEbw8liKeIsfH8w9s3ZCN9VxBzWNfCZYHDGkvy/i3ZekSwY5N9rlxZtjNax6m3etwxq7SrHuRZ0HJ7mp0O/m4ZUcX6dD36SPfo9JfCxR5fZIS1t224jFcfi7BiVyC1w8Viozzlrp/y7pkC77DdA2RwG9pGd6KIHy7+KoyTzv/cxlySEFSoLNsyfpXi1uHqh17qiEB5t8mXXS8FvKn20hz8im8OPwkimaiHns+U/x1q52LCPWjqgc+XjekjaDfDzzZlbB+n5xANsScw1Pys/XgHRQo9M3uogShc3dolLEqdMfIx3hUvU3ZE4mvRqAev48qijmWq4Q+1iiVeiHAngxnfNR5tK230CaQ+daE0uaxvBFUGkUXNn
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:59.6016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72517ae9-8f29-4c5d-3eb3-08dc5e6eab93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4478
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

- rd/wr apis are being removed, require device to be mapped

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       | 5 -----
 drivers/gpu/drm/nouveau/include/nvif/device.h | 1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 9 +++++++++
 drivers/gpu/drm/nouveau/nvif/device.c         | 6 ++++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 13705c5f1497..e8b27bb135e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -189,7 +189,6 @@ static void
 nv04_display_destroy(struct drm_device *dev)
 {
 	struct nv04_display *disp = nv04_display(dev);
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_encoder *encoder;
 	struct nouveau_crtc *nv_crtc;
 
@@ -206,8 +205,6 @@ nv04_display_destroy(struct drm_device *dev)
 
 	nouveau_display(dev)->priv = NULL;
 	vfree(disp);
-
-	nvif_object_unmap(&drm->client.device.object);
 }
 
 int
@@ -229,8 +226,6 @@ nv04_display_create(struct drm_device *dev)
 
 	disp->drm = drm;
 
-	nvif_object_map(&drm->client.device.object, NULL, 0);
-
 	nouveau_display(dev)->priv = disp;
 	nouveau_display(dev)->dtor = nv04_display_destroy;
 	nouveau_display(dev)->init = nv04_display_init;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index b0e59800a320..64b8e4defc35 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -21,6 +21,7 @@ struct nvif_device {
 int  nvif_device_ctor(struct nvif_object *, const char *name, u32 handle,
 		      s32 oclass, void *, u32, struct nvif_device *);
 void nvif_device_dtor(struct nvif_device *);
+int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
 
 /*XXX*/
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ad5de7ed48ce..68564c648eda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -208,6 +208,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
+	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
 	mutex_lock(&cli->drm->client_mutex);
 	nvif_client_dtor(&cli->base);
@@ -266,6 +267,8 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
+	cli->device.object.map.ptr = drm->device.object.map.ptr;
+
 	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
 			    &cli->mmu);
 	if (ret) {
@@ -599,6 +602,12 @@ nouveau_drm_device_init(struct drm_device *dev)
 		goto fail_nvif;
 	}
 
+	ret = nvif_device_map(&drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
+		goto fail_nvif;
+	}
+
 	ret = nvif_mclass(&drm->device.object, mmus);
 	if (ret < 0) {
 		NV_ERROR(drm, "No supported MMU class\n");
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 8c3d883f3313..2fef6553a013 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -38,6 +38,12 @@ nvif_device_time(struct nvif_device *device)
 	return device->user.func->time(&device->user);
 }
 
+int
+nvif_device_map(struct nvif_device *device)
+{
+	return nvif_object_map(&device->object, NULL, 0);
+}
+
 void
 nvif_device_dtor(struct nvif_device *device)
 {
-- 
2.41.0

