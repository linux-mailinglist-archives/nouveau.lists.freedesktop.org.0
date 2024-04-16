Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122728A78A6
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8FF112F12;
	Tue, 16 Apr 2024 23:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uTIwWfbf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346A4112F12
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuQba2RavLWu/YHVjnFzO4Mx1lLTuC5zY4NWOYOBcGPABfcBe0Cs70l0v7M8ur18jzahcu+6mqLeCRwUlxVDsWIlOP/vVD5Sg4n/oLdLXqXIv2Sb8F6oqMHFANdnKn0Os88JKrGTaAV8Tr0L4yqEE70SAK+WkQ/lYXOExjow8k8IX1EqJjsmAqOKu9+TCQUzCIa4NPDlXUO0Kkj5RMS3H0zR0AjiE+h3uKMbWPckM9k+G/JK0kTauWSkf9vbNYEjDNEdjD23gG8oe+01DDwMoWv7TCqmIhsirYNcJbuvcu5GylW1ttJjcWTNRqZTxj6Dk870mVc0FtYK7z6Tqh2adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xfetq6/3IyhuwpAmr7GfG92IlvW9+B0wvKm8hvjypk=;
 b=JosHv1VySP6Dz0HtOE9WeKe2/deuuVk+9tgRsmDQgQKZTSFgYqfPa0L8lwg8EgqHD4GEj2bdqZ8sJp0RRq9L3xwCAWWF72kipod6asnUP8pSJ6cOKEaatxUUzvCTarPpKFW0XYsB/QjLrRMzJMpb2UBraKN07Av7BW9VDAmhbABlLuLrpUR7zczU18GQCbUnKvKHXEJAuw/Bf0BUuDcujIxJdyBz278it7pIiSCedqpTu3+tw7lWDdqwI+91K6KOtzUwdm7e4QwftMbKunq0Pp3OcfXmoXUWpORNM0npzdMWBG3Dvn3V4uMzyKKiz4k9KvBhY+qicFrXo7uvXt2EGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xfetq6/3IyhuwpAmr7GfG92IlvW9+B0wvKm8hvjypk=;
 b=uTIwWfbfDpAQdiLBz7PILVT9STUNjXgJ7Y4G3kEJseQKmtlr3hXPzw5fzAGBwYrnBaBBtvXet75SgnJ9oj9l0RQRMPqiWLkzJdjgISM0hWeu1X/izKJ0thKtP3wZJyEG0ZqJUQRycIuKGOVP8bImZFNg8Dz4IkO7/xhUtiCTU6NoWffb2bTqLtgXwjaQ3ZHNcdcuk9jwlTwq4Jso3IV4g3Yq08q4s6TJMFpVZEaIHfXJuldgQoEgk6ZfHqairubssmLqwEAc5XUNd/M8KBOoMI/DAGCS1LuRl/bTN1KTdJO8WHSTiHcyiNfZNtazl9o4FbdAE/GCmly2+VUydjWNCQ==
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:48 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::3d) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:48 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:33 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 002/156] drm/nouveau: alias nouveau_drm.client to
 nouveau_drm.cli
Date: Wed, 17 Apr 2024 09:37:28 +1000
Message-ID: <20240416234002.19509-3-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: d177e840-dddb-4142-6634-08dc5e6ea49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxGHLGO+TI9VoP3sQePRXHUAlPJyGtr+AzSxzj/13FFhvkQFnToTA01ManStKzLtG9t5ZOMFK4dgxF7lF8Eeh5KsjruEPzI5lD1LRmnSiUroxG3h2GbnA26X0Z/tBpeFrzJ9ypmr06PXcAxctLEgdqQ7z/fYuovJmKtKFKUNTFYLcaas5GBUCX393q8wDFAL6zZIsPZ4RMNTCo87E6E4nY8tyqKGOAqo0xI0XONgHNXi/OLyx1mD4TMR9VrNWECpttxzdeYhHa0IhnijwchJat2zKWz1+cwas+7Er97KKJBmUXTaBL1fkPNe56JwWKpfa6dWyr43sRrGW4uzQB1jgWRhflDrpPz+iTwBpbsnobClrFWJzd3s8I9+aeZE3C0bCNjrtdRenC/nj85OdTU491iZjJABqJZF6DHdO/ytNIX3c34whVxO8DT00RuvyS7T4JKPBIpGiuZoQxG9fAbbW1qHrqvJb6/XqRadXVKXwp+jgeAyXtuQ5mE0NW9jwWOaUUA/WAQlWl0u3/4Ierc1KN7FUjRCXeCMSxgWnL/SrydqwHJrKnBIpIWiyg9Ak2jDqrisqiKEyw55JSxnuHVRGLItcLfIp0RQcg+FX7e5xqX44iT5nSsZoLOW/rTKsGYXMc3KO3faKbtl/hZVoZhVjmUYV1g2qwngGKF/Gjauydx7VbjAhBVtEttw5vYsp+6Ir3clKPLrYKtPMCVZ0oLcW4UBf2wcijMnENgkTf5W4nr6/6nkV8LWOUkbQ3I4izYW
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:47.9397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d177e840-dddb-4142-6634-08dc5e6ea49d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
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

- first part of a rename
- later patches remove remaining usage

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7e651779751d..be9088ed273e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -621,7 +621,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		goto fail_nvif;
 	}
 
-	ret = nouveau_cli_init(drm, "DRM", &drm->client);
+	ret = nouveau_cli_init(drm, "DRM", &drm->cli);
 	if (ret)
 		goto fail_nvif;
 
@@ -686,7 +686,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_ttm_fini(drm);
 fail_ttm:
 	nouveau_vga_fini(drm);
-	nouveau_cli_fini(&drm->client);
+	nouveau_cli_fini(&drm->cli);
 fail_nvif:
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
@@ -745,7 +745,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	}
 	mutex_unlock(&drm->clients_lock);
 
-	nouveau_cli_fini(&drm->client);
+	nouveau_cli_fini(&drm->cli);
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
 	nouveau_cli_fini(&drm->master);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index a7079efe42f3..8f04f3630936 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -206,7 +206,10 @@ struct nouveau_drm {
 	struct nvif_mmu mmu;
 
 	struct nouveau_cli master;
-	struct nouveau_cli client;
+	union {
+		struct nouveau_cli client;
+		struct nouveau_cli cli;
+	};
 	struct drm_device *dev;
 
 	struct list_head clients;
-- 
2.41.0

