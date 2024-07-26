Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9B93CD4A
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1362D10E90B;
	Fri, 26 Jul 2024 04:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZeL4ZhRl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C383210E564
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1odU9xnkkPsy9Stj0JST0KJiXvHfdx7tfkMU8HcsL0pKrW+ukRrx88XnDesdQn+B+dxP9Gd+7gI+AhMYW6A/87LOr327fu1bsKrvh6Jg2elLGafSYQ9NFG7a6NDkAJ+x35mpWZTw9xRUtTC+iB9PTeotBceIR0XOZvdu/nAletSpfPMgQBa5ISMkVHYO28sNiWcn+rbE18N7J5R+C9GwW43VF8OL2I+4QEixdXhpYjkxhupl2lC31NolyppsEurTd5FVIdOHMN9Ih7CgUdbeNxzll/UAgX6wwDPpGpPCQkJwgo2JJQp8hF1akKqMt+agv2bgWLocsfPfloU6eZEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXdDTr0o+ac8LdqQ8OidmFeW5rH5e/DmyaZbRTROfG4=;
 b=VOLro4NXw3eJuwTTpi0ZzOyBmzqetGE9BCfx1c5C7FZG6yW/AZsW5pRg7R7hU2xJTQDulw8yhPC4NttSM+XAsAxY/2HU/VCfNSIgRg6TR7kvXlidUb66ypVx9SLbN/fj7cR5In9LktU927euUfm5G8uXbL1aXNSs1XvXeWcBuLZG3hha8TU5gmJaCzX95x8uL6CDfaOnoxnEpQkUoJVerttNNDqlTLcQfDdtQxj7GkPplLsTOrd44D8J/vj7zXXEYI4VyPkpC175o1vb7rbcTivCAXUtlD+3Joj7dRp0EZEzDEQBvozef+vaCKtFIza0e3732ZhPF43BKfj1p48qOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXdDTr0o+ac8LdqQ8OidmFeW5rH5e/DmyaZbRTROfG4=;
 b=ZeL4ZhRlXdKMZJii8GhpQ24FOudqiaU403A8Zs/9OIvBHC7EMGikOyavhDUTZELRBgQ0pijAQE1u6SZlTg5bL83yUWNz92m6qM8j9jQ/jnMMj7whwTco/B/7xHYaDJcqD9AI/nVxzOyPij3Qf/ZkDCTk+jp73ltCPcksQQU/AqylMOMKxoRKRkgVGhSyaGlruApbNBMdagi+DLiZ9nZtIo88W0HOrYhVt5lUVXoZrfPElUzqKFL+EekNcFeA6PXr+aweWJ17tYeHC+AcL9amJvug4TziUUMPIWfbpldOGOB4p/JtXaWpqsq+bx+KZzhz+DJqE96mni8t+NSmO3yfRQ==
Received: from DM6PR08CA0058.namprd08.prod.outlook.com (2603:10b6:5:1e0::32)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 04:39:21 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::a5) by DM6PR08CA0058.outlook.office365.com
 (2603:10b6:5:1e0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:11 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 19/37] drm/nouveau/nvif: remove client device arg
Date: Fri, 26 Jul 2024 14:38:10 +1000
Message-ID: <20240726043828.58966-20-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c4efb3-6561-488d-cfdc-08dcad2ceb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ImDLr3We3y6ONhfBdQtGz6DJXm4n67EnG7MbtcSuB1XYFEA71MMmSd2q0ph?=
 =?us-ascii?Q?YNJyyjj+b42yhLdiZG1mO1L+JZIoposKWY2ht2an/MNdgSnjScl61XxxzhV4?=
 =?us-ascii?Q?zZDsaOZAaLYBRP1kFyHOHibQliktzj6Kh9ToKpMecO5ZZov3PsJyQhDd3KnA?=
 =?us-ascii?Q?Bl8tFqqSSNyD1qUJ0uGTTZEZL1uc2TfkRa3Hal9vJbg56bhxQz3clKgqO3ns?=
 =?us-ascii?Q?GwQpDWMmGSDmSdny3XX3be4QDQfnwnBz3JSrwvg30E70uFJc2zyuEiaDu9Uy?=
 =?us-ascii?Q?bjFFheJV2Eo50fHwpyJ0Xww+lu5rfB6eNzH/XtptDth5zQgdrXpL67k0NGQ5?=
 =?us-ascii?Q?ZmvzMrJ/OnFjGelrvmUduj3cKoiYKoJV2Jx6E0mc9L/zjLNjHMqqn6qn4YZl?=
 =?us-ascii?Q?Ti6hT6LFAn9AZDYIxQ+bt69ne1MDoO+eoCjSSU/0B5raBuI5Inbc3GCscQHz?=
 =?us-ascii?Q?ZqZHG2B0S4gGugag3V+CrXPK6yzY+D/F9lvs2mYosYt3qatcVnxIIZrflhBQ?=
 =?us-ascii?Q?yo1Un7SXJP53a2Erd2cu2f15i0tohr6N4cYrJdxtjWjZVB9Bj2jqQSVFeMcS?=
 =?us-ascii?Q?cyTqvD3jxj+ud8naazB3KTb4hSIOYo3bbFlbrgVzsztss262uIGAuOZySJ5O?=
 =?us-ascii?Q?UIgq9+yn9J21qpogDytmL+41Nxu01XUSELbwLmuXK73l2C2utX6V2Cmx4srs?=
 =?us-ascii?Q?G2W/UgcPhz8qwnqKC8349F/L4xl92gIYevUCr85csGGKNSE49l8AreJDDofs?=
 =?us-ascii?Q?qXm88QA+Efo4F90F8Lq15czNx7TVlz0pHx3Cc1GUmKbbi+T1E9EdqUPnUm/t?=
 =?us-ascii?Q?2+u30e8IwXX7X11bx3BX3UBZkDwaj7a6lAD6tCNbc7QPtDr5/52SB49lZ5ee?=
 =?us-ascii?Q?EwmBCuzptkai7JzzNDeWQVQZmoKTMA2TD2PDvy5wVFpd+m8J+IImTAPesMA/?=
 =?us-ascii?Q?QkawLokonRuPJfLVI6CfgTbpjmlrA3pFyVxOZYdNCylDYZIEFO0eiodV0v9u?=
 =?us-ascii?Q?3xQMKUHVNGpbkR8HipEmMjGn+FOGqGBICmFHtAyNKg+SUlro28m4JslK85Rp?=
 =?us-ascii?Q?ZqvhItWySiD2P+lWWiVh2eXypRoL1U1D4XNPj9sivKZDOa9Wz9ZpDddWzGS+?=
 =?us-ascii?Q?cYtvHpdTOMB31y3uUA1wOp0asnKnWQZRJA3PbzQ8WiwGm7LFMl6+FNn8vS3u?=
 =?us-ascii?Q?RaSVmuhwbcZ780dOn+MZPcScN0NGGxzPfMaBzM+qnk3qkhNIVAn7SQNWzdQ9?=
 =?us-ascii?Q?JyUHQO4AbI1zL7AVDue4XCD8BGSWKaOAM797KsiUWO2KqNegnvL69SeVG6GU?=
 =?us-ascii?Q?cit3uI+XaFGW03OIkbmHzzBOBOE8FKOrAp23FwatoRS7w4bWn1yQCYh25Pwp?=
 =?us-ascii?Q?xGNvOQZba0TWcN06Cy7IsXcfG6Gmse3M2/ayGQDRYiIzt30AoZPdPfN8yhw0?=
 =?us-ascii?Q?FZGWPPVCehmal5J51IiDf1xKPIJrnpNp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:21.5592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c4efb3-6561-488d-cfdc-08dcad2ceb45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365
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

This was once used by userspace tools (with nvkm built as a library), as
a way to select a "default device".

The DRM code doesn't need this at all as clients only have access to a
single device already, so inherit the value from its parent.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h | 3 +--
 drivers/gpu/drm/nouveau/include/nvif/if0000.h | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 4 +---
 drivers/gpu/drm/nouveau/nvif/client.c         | 5 ++---
 drivers/gpu/drm/nouveau/nvif/driver.c         | 2 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 2 +-
 6 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 5210007d7669..2c8e9bec3f79 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -10,8 +10,7 @@ struct nvif_client {
 	u64 version;
 };
 
-int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
-		      struct nvif_client *);
+int  nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *);
 void nvif_client_dtor(struct nvif_client *);
 int  nvif_client_ioctl(struct nvif_client *, void *, u32);
 int  nvif_client_suspend(struct nvif_client *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
index f7b8f8f48760..a93f91d56a09 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
@@ -5,7 +5,6 @@
 struct nvif_client_v0 {
 	__u8  version;
 	__u8  pad01[7];
-	__u64 device;
 	char  name[32];
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 526c16f79196..8bcfc1f47a26 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -241,7 +241,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{ NVIF_CLASS_VMM_NV04 , -1 },
 		{}
 	};
-	u64 device = nouveau_name(drm->dev);
 	int ret;
 
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
@@ -254,8 +253,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 
 	if (cli != &drm->master) {
 		mutex_lock(&drm->master.lock);
-		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
-				       &cli->base);
+		ret = nvif_client_ctor(&drm->master.base, cli->name, &cli->base);
 		mutex_unlock(&drm->master.lock);
 	}
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 85ad5091e8e2..bbfc80fcff43 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -55,10 +55,9 @@ nvif_client_dtor(struct nvif_client *client)
 }
 
 int
-nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
-		 struct nvif_client *client)
+nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *client)
 {
-	struct nvif_client_v0 args = { .device = device };
+	struct nvif_client_v0 args = {};
 	struct {
 		struct nvif_ioctl_v0 ioctl;
 		struct nvif_ioctl_nop_v0 nop;
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index acb708df2559..78706e97a6a2 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -36,5 +36,5 @@ nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 	if (ret)
 		return ret;
 
-	return nvif_client_ctor(client, name, device, client);
+	return nvif_client_ctor(client, name, client);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 95cbb5b682f2..6baa3a4fa0a4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -42,7 +42,7 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))){
 		args->v0.name[sizeof(args->v0.name) - 1] = 0;
-		ret = nvkm_client_new(args->v0.name, args->v0.device, NULL,
+		ret = nvkm_client_new(args->v0.name, oclass->client->device, NULL,
 				      NULL, oclass->client->event, &client);
 		if (ret)
 			return ret;
-- 
2.45.1

