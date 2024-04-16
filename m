Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34EC8A78C5
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBF2112F40;
	Tue, 16 Apr 2024 23:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Trgpuanz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7D6112F42
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENoL3UsGhQIPDKPjRg+EO2UOVfd1slQWODWz0xTFkRK9in9ks/NIHJcR20gVkSwSlXHQurRoJUtrPGt6ETD8xTBwB4yaXFtTgwHUBh3DKA1LnA21XwvNFvLOzKpjRU06Kr3O4hvb7oY5yGEKfN9ZhmCdZdrKHjT82BSeVxxGN8rG2wcZvMK5Nz6HqLT1YaGNWP/NpP7h7gxFZJF6oc4K2qLyup5C93BkD8pX/lRemLZZZcXJENAkXgkent4qj9GgCffDjf88YQVLlBm4jUpFikIvEQHa/SkXUbcObLwxK9etghcEp6V9YApq9l31ztlRxqwkXbOZmBXfJZt5T0IrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7GSJ+qsPfx2DdZnkf06qLzlacw7/PYSrfeh1Q6KVS8=;
 b=lEah8a1cTMDlbI4q3Pb1oBMaI+f5oQa5qTtenyxXtFfl6SxTxI1ZS8jMuRGQyTk/oQThsAZExrGYqf7NZGy4H54KhmQozE8e2ABb4L15W2ye+s5yEHEXO8eTRNraIqTm7s+yIMH6/lT7/VmOy296WC5uZKcj/759f0f69nXebGl7zncjLIRUlU1NfkxDvyvBK308LdpKcJvC99+eIWBRUYLWEmZTH9Gjz3esFm9sBggXtWuuUSWcRJS8ZDkvTgLOqqefdmexuePUeBgUnLWTDniUxu6XUalLDY7sL0yxZG/8k52c+qaovTgmP5pdzuWiDw7mWwNzVAkTBMwr6wTgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7GSJ+qsPfx2DdZnkf06qLzlacw7/PYSrfeh1Q6KVS8=;
 b=Trgpuanz0UBRZzTGzBV/D6wM5ajZr942w1PqnOn4rzqlgBUogcn4kYb66RHiJ6VZKWLZKgzQ5+AiXzgHRUEF+YwdrMqhzxB05kHnpWWZfbsZMWm+Vxe15kraRG1Otj39x8dcWOkLKQ44yd+o3435ucCOTITM+5QccAbrbIiD5/9EBZzWUWR6C0B9Xl4bEXMWfLEwq4KnS0zDs5bqWcB99QOgnqXWCLU+LTksMm7tBY8s1crozIOPX4piTFRS8RJu9Ozzl/Leeqd4aqI21t6VcDTY4qXb/fyShmEtSUHK8b03+EXHq97TzujyoH53vTJFZHOjcK3ymiylNOJtCfeI9A==
Received: from BN9PR03CA0677.namprd03.prod.outlook.com (2603:10b6:408:10e::22)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:20 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::67) by BN9PR03CA0677.outlook.office365.com
 (2603:10b6:408:10e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:02 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:01 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 027/156] drm/nouveau/nvif: remove support for userspace
 backends
Date: Wed, 17 Apr 2024 09:37:53 +1000
Message-ID: <20240416234002.19509-28-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a306a65-a712-4dd0-62a4-08dc5e6eb7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pky5H1jL/qx0VIvZsfZHPdtl8f9+WVSAsemw5rmn6H4RoWDRZrFrktLwotE2wAnrtmfaE2puz2Qmy6uMrG1IiIzQuZQR0OaAxggKC7AByKjpPJ49UksRrOh74Tvl8SC1gu1J3Pv6stwuyCHiWJ6jGQ9XKpxb0aw/kR1NAIluaq+vdq+jpSqTSP75Pj53A9RYL+ZbQhuyMk465IBPXZ8p4IhrAmwGbqZ16Kkte0tAhbEu/MZP5kF/CCMMjIL8UA46zWH1S/q9xMKCXJAHZAj1PcJS8oiwXd8Pv/b12kcK5j8/PbRG2V7tBb5pjTU5iSGKof02+KiVS6/ASOF27AJaPqY/RiveNRQbbWafrmauPxUikK87GggeplaQyt3z4HvOGM7qWORoO3rWCs6Ws+LrDR8kliXn/Tt96SPM5tB2AtSvW5R1fMAbmn+Db3rM2pW7p9zPofDgJi3nTyfZtY/kYuCWd7uwCuEhVUqXxunIKeZOW9mGO7tcH83dLBHnqz+XFdJP0VQ5VnApHoWbhklwPWuie4jcUc8jdJsHZx5z2nU71sWznhzSO4jBy1LsTCD22srYmSEWDKbV0wdaWO3N1zzaZMq1YklGW9o12tO2JhG/4pU0u/7Xp3uunoLmzFW46emDfr03P6D8H+Nelub0daobwMZ8Oz8ktUAD77gvtis7cPW4/MPGM4uvCSipK7cgYyaN2LLkX1gVdI5jj5CzKglSD1trZ1BVDRbBO3m3xBzBJ1CY9kf0sG5z1Ko3kq1a
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:19.7750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a306a65-a712-4dd0-62a4-08dc5e6eb7a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233
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

- the tools that used libnvkm no longer exist

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h |  3 --
 drivers/gpu/drm/nouveau/nvif/driver.c         | 32 ++++---------------
 2 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index 7a3af05f7f98..8d294ce3cf0a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -21,7 +21,4 @@ int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 		     const char *name, u64 device, struct nvif_client *);
 
 extern const struct nvif_driver nvif_driver_nvkm;
-extern const struct nvif_driver nvif_driver_drm;
-extern const struct nvif_driver nvif_driver_lib;
-extern const struct nvif_driver nvif_driver_null;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index 5e00dd07afed..acb708df2559 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -24,35 +24,17 @@
 #include <nvif/driver.h>
 #include <nvif/client.h>
 
-static const struct nvif_driver *
-nvif_driver[] = {
-#ifdef __KERNEL__
-	&nvif_driver_nvkm,
-#else
-	&nvif_driver_drm,
-	&nvif_driver_lib,
-	&nvif_driver_null,
-#endif
-	NULL
-};
-
 int
 nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 		 const char *name, u64 device, struct nvif_client *client)
 {
-	int ret = -EINVAL, i;
+	int ret;
+
+	client->driver = &nvif_driver_nvkm;
 
-	for (i = 0; (client->driver = nvif_driver[i]); i++) {
-		if (!drv || !strcmp(client->driver->name, drv)) {
-			ret = client->driver->init(name, device, cfg, dbg,
-						   &client->object.priv);
-			if (ret == 0)
-				break;
-			client->driver->fini(client->object.priv);
-		}
-	}
+	ret = client->driver->init(name, device, cfg, dbg, &client->object.priv);
+	if (ret)
+		return ret;
 
-	if (ret == 0)
-		ret = nvif_client_ctor(client, name, device, client);
-	return ret;
+	return nvif_client_ctor(client, name, device, client);
 }
-- 
2.41.0

