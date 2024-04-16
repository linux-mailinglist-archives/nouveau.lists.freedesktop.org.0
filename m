Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB258A78A8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D536112F1B;
	Tue, 16 Apr 2024 23:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oMjIVSar";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C995112F13
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCydHocln5chywqOOgsVauz7GhVJqgdPTmgVVjLNa5mZzptdrsXD/upfGZgE2ydWSK9DvIeDU1nVqQl3tuhiMUWrcOgBrhYrI7Ez3aaPJ3Pxk4moN0vfq5F8RbTUv8/NoNe1nG0R2NXWOEIAyh/rdykOvXNklOEa21wRYrN775qmVv5vLjPyS6lGKngqgpMhAKaZ8Gljqlq+tAeP+A1gDQJv5u7aeePslHclXNhpT7HC5DmRnM9wzXzyerQLF2jR7yo2qDNSOlq0K9E/UwcR2gwJaKAcLQnkmIzyuJBZe5anyrODFhavmuQXjW9vEsWC3WBHAw9z7hS8NL7T8Fh6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cGc33dQbB7Wxf1BjoJMOsiZG9pm2BGeARIf/nZRYTE=;
 b=gsagUGwgXs4gPGlXtui64b+EYlmCY8tcZsHgL3BdzALcyvXQNthYqwbJhMIR3XvIefSRhqh4agJ3f/g5SrOcfvRqsXWv89al/FmVZrXCDyqi4/LVowy8J9skbyVyFJ1dmGTP4Kxvr09H2vB36x9WBJPqBXk+9G0S+euLmje6PLsQOTN+lmqhYFOzaUQLLKyA9SqAvomcPJiv27S8OJGbtCAGn5axabcnQzHpjtQpaNMYMnacvzJBXMcbRaqo7kv7qLYSWSaWoepfsif2E+VGLXLjOeGEXmlWH1GpFJlEuJwoJa4laiiXtpOBSIQxgLdf1LUSWdK9mWvGKH3SPoAJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cGc33dQbB7Wxf1BjoJMOsiZG9pm2BGeARIf/nZRYTE=;
 b=oMjIVSarNwsB8jY50kUZFW0RZHeLPayOjtIRm0cJTYPmxdKh0t1V4pm/oVkL74UsE/39AeRB/hR781hrHnMs/+7jdoPzRzRx7sVpvJ2SAsz15HnvjjF0UYjdkPeKYnlrGcE7xSpk7p3l/60jwzoMy3kAWIctO6n1MN6gPPbkFO/6M0xup57kwkfFYZHVMMBsKluwWwAeZ/iSl6MtcUE8JhsOtAltmzTsbpW4EJstuPES97i/wyFm1NjihbKUg0lt1V9THS10TWJxf2qvluglvRfoIzkPRUaGV+Ou+1rER6/yzp3KPn/UrV8NmkoytWRinZKRhEJG728uLgSmyZ/MLw==
Received: from BL0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:2d::27)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:51 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2d:cafe::ad) by BL0PR03CA0014.outlook.office365.com
 (2603:10b6:208:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:32 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 001/156] drm/nouveau: add nouveau_drm.device/mmu
Date: Wed, 17 Apr 2024 09:37:27 +1000
Message-ID: <20240416234002.19509-2-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3327a7-c79f-4310-1dba-08dc5e6ea641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DL3bfCOAT9SElagWerkO+xVg+hG/9a/ZA7mDoFZEJvbU41kifQRBhnaS13G3+ISkvBXx7lBnSOSoiI2qBlGnpm+0/gqlPSikS8xE4YE9ZazX0chDTDKoEslELRqnw6Z3/6lAeQrKrVZKfOFaGPLkQ51xgVBnKv2cpwlzsVFMN5OER+OD/ibJ0l4PdGFphpXYYC7JtNoIW35c03Hu3qmFIrdFxSOUf9WPkeg0R1Sh2JfvJzkJJ2LFk7W7qAoyMmkXRVZzUjlH1bPyNhZZ9Jz+jJ1SPHOxWB4Lf2QI0eQwIXGNw0F0uGVGo3s3DpDN+o/M+IlexWpFxlBv8wqgdSjj1m1eocDD9gatVi9MnYUyvvBYmbvwJI4kUXt/+4/w/i5UsDD2VOmWTE+vkmS90r6iM7CyS09f3cH/UBwjLu4ezjgRIKqvWIn8zH4l3atD9D3nREkn+a+9J5rVJGEa7azgLUWHK/gwVB9wbNuKbgQwi7xpMl6KegmQJnQsz17evcxho+DnnrUBzPlc5XTK6j8e1cgEj4NByCylQa/22+uFM9Fxu2QUol6rUa80ZqU5vzVjfwaDPcgxDD8z/E6n4ZOxNWC0SuH9cvFzjZqp3nZWfug0XD4YYuK5h+jLbcB19nsyAurIVXmXaYzE51l1Ov0HhIF8EPBp1XkwZIYvRKk9hd2MltZ2AXKNcEUikJenruyaPdy/5bp1u7/9HyjkmS6ejILh/0/5ZHNd9NMS48YmLtmGzSTRUe3MQpcJVRk2QClx
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:50.6435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3327a7-c79f-4310-1dba-08dc5e6ea641
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
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

- removing nouveau_drm.master, and will transition to these

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309..7e651779751d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -603,9 +603,27 @@ nouveau_drm_device_init(struct drm_device *dev)
 	if (ret)
 		goto fail_wq;
 
+	ret = nvif_device_ctor(&drm->master.base.object, "drmDevice", 0, NV_DEVICE,
+			       &(struct nv_device_v0) {
+					.device = ~0,
+					.priv = true,
+			       }, sizeof(struct nv_device_v0),
+			       &drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
+		goto fail_master;
+	}
+
+	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", drm->master.mmu.object.oclass,
+			    &drm->mmu);
+	if (ret) {
+		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
+		goto fail_nvif;
+	}
+
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
-		goto fail_master;
+		goto fail_nvif;
 
 	nvxx_client(&drm->client.base)->debug =
 		nvkm_dbgopt(nouveau_debug, "DRM");
@@ -669,6 +687,9 @@ nouveau_drm_device_init(struct drm_device *dev)
 fail_ttm:
 	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->client);
+fail_nvif:
+	nvif_mmu_dtor(&drm->mmu);
+	nvif_device_dtor(&drm->device);
 fail_master:
 	nouveau_cli_fini(&drm->master);
 fail_wq:
@@ -725,6 +746,8 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(&drm->client);
+	nvif_mmu_dtor(&drm->mmu);
+	nvif_device_dtor(&drm->device);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
 	nvif_parent_dtor(&drm->parent);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e239c6bf4afa..a7079efe42f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -202,6 +202,9 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 
 struct nouveau_drm {
 	struct nvif_parent parent;
+	struct nvif_device device;
+	struct nvif_mmu mmu;
+
 	struct nouveau_cli master;
 	struct nouveau_cli client;
 	struct drm_device *dev;
-- 
2.41.0

