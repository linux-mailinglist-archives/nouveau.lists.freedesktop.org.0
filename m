Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A38A78C7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B1112F3C;
	Tue, 16 Apr 2024 23:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7OEyPzu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D969112F3C
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7pCFZH8KzRPAm/jwqUWxpe4cvflVzHr9K+ivsHcJiF0HuRsZhbb/ogszIoJgzqUus0nMRkiciVRh1sfTwHXO1yFODclXhVw6DqSFuKHybjVqSulkz3gFLCk80+SxxeXLLNovaeSaY4cisN6OwHCVdpnSa5M7+hd8GEsgdl7pzUeuoMwI8OUWxwZTLqCgXoxvoBXU7eH+ojjRIGupCX4s25oIIkW1CPlanAgAiHdmxs1nrZv+VY7ecJhulai85M7aU1d3AL1Apv90XXm81WbWzmK2akU94uvZSq+enP18UfFrTuGzh5uW1edSSwLdXyNCa28au082oros+QaMYL0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YA1nZyLZK62wHQnACux7Bj5Gg2/XkZaY+gzeKeCoTE=;
 b=hIeEtV+AwKh2PIYElxugvWPmd6+DfgWHEZawyWLqLu/ATXATF/0nUPXz/bEENnlCQIN+QtE5E3QnMFd7wjmQe2y72iP9G0jvoPUMVTVcVzfDWxMJFeSbhkVmozeJJdHBvUQVJtkKQLfexfvSfrdB50GOYaMh7eYTSyTtlvSRy5/2+O73Kzly3+9X4J3+772yB4YuNLFAY0l1B10vaPmq7KCpqKTLJtOZg+JYrt64mAQWc9AqsvEJZ4xzJlP1ukh3FhdOKz4d44J42G190LCCR2fc8ugCKMiQry6L4xUyn/MGRo6V76HdLAmzJh9mZi2UuR3x7S7W4QLDefDtJ3mOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YA1nZyLZK62wHQnACux7Bj5Gg2/XkZaY+gzeKeCoTE=;
 b=L7OEyPzuQXVTGNGiVc5J2zmBOaoah4o4rZaVG5u4eh2rGxAExdhE4J2RLWjy4ZZUoTApAVp0VWgTOs2SAaU9a8icrm7xr0ML+TKIGzvj8p5pfLmIO1vOJ8UkTWyGXrro725HNL3R3OekYFWMf0ioYObo54NLd/KUwWZLKUYoCmdolvXp/cJl3B/bYzDhWC62FVxvZk8aunmhdMTyPLoNnOGfPwXnpTisLJXYW2NHhTxxbjV/N6rsN5GmUNaIVJpG63qHG4NebKTfKRZFtx41cUVgIh12SJjX4BaeF6h3AiaoCbAbQecxyuX1Fc2x4XOoQiWZSJbJxkSjKw1uxwhDRA==
Received: from BN9PR03CA0489.namprd03.prod.outlook.com (2603:10b6:408:130::14)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:25 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::dd) by BN9PR03CA0489.outlook.office365.com
 (2603:10b6:408:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:06 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 031/156] drm/nouveau/nvif: remove driver keep/fini
Date: Wed, 17 Apr 2024 09:37:57 +1000
Message-ID: <20240416234002.19509-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7302b9-e979-4723-26d2-08dc5e6ebab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sbri2i+EInI1munFg7Ay0KTNZ4v+JVAe5hcdCteAC5GI6tuzueCohjZu/xUt4SXKt+Xu48enHqALe6Z8B1Z9+0NtizLIGVhSP6mcQQ7vadfJtibI2/f8dXcn3WFeHKqfJg4dTerc5dVzYE5aBIG9tnft1v75kfYcYFcQSGlWUAg8eZxMjoeaRQb+KSycZgvjRma9SiOqk9Io3vpSivw9sXilWBcEUmZyRkOHZMorwAaKfxVPa5bSQ2D+CVKTDAu9W8mSfITZwT/PmiCLqH14r8wSP20Bs5RUOGr2ZBF12cgT+y0tIEIOsye3LJa//H38vVfMcEeWMIkpHjlmcyYu9XGbkCLWfsBbc+B84XGJxTypXGgeFyTd6PS2t7zGzWDC7oiYr1W27lelOjD5eTeTRMbnypqKy24MVsmq7fu8j1vC8x1ODaXzlMocQQApkq5HtYncAYS0untlSgIGyiosukALbxxxGkshUEQdF8dOTvkw3W5CXWXm8hcs1wrTo5Gd5BSY3uEX9YT+MfojSEp/Vbkv6XUiXPye8Us3G2lrrke+jS/njW2WOpecraqT+YwzxyYoojutkVvw/gPDq2IGnFBer1WVo2/T9bahMpefN1FRUKem+CfER0fkyqtICRKSfXVLYliZmKWOEmTqzKJzsyEJf75sFDjBxQQCXqzzrHcPw58U8YXUc4vdGYNj8w0XxQRij0CNa6yvO7sD1/jxJfWjFjbu4JHyeW+Q7jfe3IVQtgTGCd38dVzx7WyLYzNK
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:24.9649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7302b9-e979-4723-26d2-08dc5e6ebab6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558
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

- no longer used

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h | 2 --
 drivers/gpu/drm/nouveau/nvif/client.c         | 6 +-----
 drivers/gpu/drm/nouveau/nvkm/core/driver.c    | 1 -
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index 8d294ce3cf0a..7b08ff769039 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -8,13 +8,11 @@ struct nvif_driver {
 	const char *name;
 	int (*init)(const char *name, u64 device, const char *cfg,
 		    const char *dbg, void **priv);
-	void (*fini)(void *priv);
 	int (*suspend)(void *priv);
 	int (*resume)(void *priv);
 	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
 	void __iomem *(*map)(void *priv, u64 handle, u32 size);
 	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
-	bool keep;
 };
 
 int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index cd5439b73ac7..85ad5091e8e2 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -51,11 +51,7 @@ void
 nvif_client_dtor(struct nvif_client *client)
 {
 	nvif_object_dtor(&client->object);
-	if (client->driver) {
-		if (client->driver->fini)
-			client->driver->fini(client->object.priv);
-		client->driver = NULL;
-	}
+	client->driver = NULL;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index 3494002b40cd..1f5273ff2225 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -95,5 +95,4 @@ nvif_driver_nvkm = {
 	.ioctl = nvkm_driver_ioctl,
 	.map = nvkm_driver_map,
 	.unmap = nvkm_driver_unmap,
-	.keep = false,
 };
-- 
2.41.0

