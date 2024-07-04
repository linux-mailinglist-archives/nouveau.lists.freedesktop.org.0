Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366492AD5B
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DA610E21F;
	Tue,  9 Jul 2024 00:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DjO7pFY3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7376810E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXKUuvvP0pW0+oNnyqrJPukih6eJfFd/4mWwoELrzbn3g3whUNp56d1OKfNba6fRYFkzeJdLuwVvxONDiIPcUc9pV62IXj2/EQGxkJ6RL5rGMHqLQ4EkkB+pgbGVLBOOYBgL3IIf4j4mSh+zNA9C/8NWItd9ePiahyIxaFqmP3tl8m5p22S/dhak+dBykmfu5NWzLW5PpHtOwilg9BJo6pEkOsQm870fd081CLhKJ7M+12DfXDuT2Tf28wQMt2I1QnklIAgBv7jDR2n79BK06fmjOXMubjSfGdamxTsDX4VoVuVqOOoGr5GOyOKgAvFfTBhpxHpwX3j0QXpeBL8lEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2QWZbkbL09G0giUYBPcF3UNwpuK3CNjG09fV4eNjRA=;
 b=PFxntlfuADxfdKeL5k/vWJ3pG5JT32sJ1zsQz/j7A4hV1sho+mferEaEsBB9baEge4496FgG2oXY4iTTlGr7aZwe5zFQ5j+AnaSm7R3r205BSetX44xpau1/yl+S5MKNRkddlYnzDnrvZC2xA7yq8edAuJsZqs8las+xAQVfXQD7Yg9/zxPvxYP/fib9zKg8HD7oMW9NIEDeFQsTN6wdVfJhZhFd1Qx6/w/QJSapf6rIiij6LmDsmJRPXdHoIsvhu1r7VO5AbF4Xr47yppkxNwF8m2E4BXjAmbD73gCIPh1XkN4bHYu1vnVM824rJ09OmiH0fgDzkgGlOuuMCMW3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2QWZbkbL09G0giUYBPcF3UNwpuK3CNjG09fV4eNjRA=;
 b=DjO7pFY33UOJunnQHRveQEkE3ZcH1RHclbGniQhTJAZlRDb1iG+r4S6QIqC/VJOap1jh++zTZkTR7Fy6nhYplNizaIFxNAfyUJ5K/wdLGpFvggHTYN29JBLzbm6zN/k6XZRTcEXL5Y1w1knFBJM9tpRsyNNkGSYIhbEZu28Fs/2V+UA7rGipoPGQQEQLPcn3UYArroBUOFBa9/7lWGHeA8mUeRYE41PDnl7ZDB+I8rWsEnzWl2Wdh+5jnk3isLlGY/3OApZghL8v2t8gV1XBQ0wr9lcImeCI/IZUGzupyOpFE1SQcUMwPe617BAZ24x87eD4HpKTE0LBgPsvHJEpqA==
Received: from BN9PR03CA0220.namprd03.prod.outlook.com (2603:10b6:408:f8::15)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:26 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::f2) by BN9PR03CA0220.outlook.office365.com
 (2603:10b6:408:f8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:14 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 19/37] drm/nouveau/nvif: remove client device arg
Date: Fri, 5 Jul 2024 04:37:03 +1000
Message-ID: <20240704183721.25778-20-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: bd57673a-2e4e-4255-4999-08dc9fb1d217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lIUZigU6qP89YDZwwXmAy9WobjBJg+7CwFyBHtVOJZq7twS2hSJ0oVvDIsav?=
 =?us-ascii?Q?gES/gVt4RGIXp8yOPeXsIozpY9YmM5dnAeTtnglqFWzvrOgtrRIG/Ojgh4eD?=
 =?us-ascii?Q?C7Mx0XsbWrOpHRpXBAyHsyQ8VLtu5TU933Wa4ogqmjf6didg6ds0VNtbYFqT?=
 =?us-ascii?Q?EL2dKiuJYHigOIXg4UF0d1/dd/dDP7Rg+k6P8C+SyrBL4WqvaBeG5qifRN5l?=
 =?us-ascii?Q?bA5moX5TApp26WRjVd0nNTAGoSUOikrnlJ6ZRjdNdu7b8UMfDMNNixggiuc6?=
 =?us-ascii?Q?0aamNRkhRiC47zUzAvUqIVnNzBM1XDkxhVlPqwnjMCcBm0+g6eAcDvZ7Afz+?=
 =?us-ascii?Q?4+BItxhf/Xs/co44h22JlwXNwX7CONnUXnw1+2p4e5eMTFGjEK/X5T7CE+eK?=
 =?us-ascii?Q?/SWcDgkM8kVO/oiEr2TX/Ftc/JlN3bfgcHpIBIxnLxriTOawk1t/rPuxE7VI?=
 =?us-ascii?Q?6b52+hy1zdsHA86nBBgUZnsthVViMWiSA+mZJ5Yckt03W2yfgGgWf6G6NF0k?=
 =?us-ascii?Q?QuyeYpCShoTd7lbMpkA9XiPvbWLd+3+oyW74VQIiqnr6Fu6DQPG/+H+PSa3k?=
 =?us-ascii?Q?3kShTyXSWL+gwjMXz7SCAsVspIGioFs66lLRr/+gLpqtvS2VO142EVH03XGd?=
 =?us-ascii?Q?Kbon11iNSvaupj2v+Cc+cSPzbRes7dVYJuieh70MuaojGlw6SCvJiji1UaLn?=
 =?us-ascii?Q?fVBtuSCjvd4zpKCpVLH70sSn5R8XaBsxYZ2nANjW+aXRTaPdJxqvscmB4AZl?=
 =?us-ascii?Q?QSUU4W9tHbik5SWj/PJEQ5DmackCAFIh1FQJiC80gmfcrb27R1Chs2cZG6NA?=
 =?us-ascii?Q?rB3x9bQ8kVjF+p/X22+dNzECMTskfNsbuoyRgrftSw4t9xeYB8vatl4tMNj/?=
 =?us-ascii?Q?QCPVauV1HJ4DSiNDLGu6woezXtTPj+GSfkoYnK5uUPlvB/t1r4PcBuU2FYEV?=
 =?us-ascii?Q?0WQDJc2T5ES5mQcab41aev/+UI/M/gK71i1DaUnC7hBVrtaxUGfpp9bOGAtt?=
 =?us-ascii?Q?0CSN6z8vNdqBb1HueA1g4DZo8PLGezX7hrOifmUbfecMBi+h+uM7iBiQv1sV?=
 =?us-ascii?Q?JU1pUcFY3P5OsqI/ew5V+lO/3NupQ6ddpumEBndjBrFmVcvnFlA4WZGV4Vhe?=
 =?us-ascii?Q?sm0sWyoVn+9tJrsUCw/t+/iYkHfzKLNGpUpA520mHfsSVi+z2bV7J81Rr398?=
 =?us-ascii?Q?UatshjcuGhuPH1xcWOYQRjTOwvfyjfzoKUJ05kGLZraoq/4/DiQ1U9gP3oAu?=
 =?us-ascii?Q?viJWfqCv1VMaTcLQ6DM8vUuLAb/UD0h6F+xXTapQI1ZOIwIH/CbYju3Z7Z/9?=
 =?us-ascii?Q?OVpI23geAZQ6XwtP2bRpz7vavUziBkH6ntzV1OXEmzehr8kw573jxbx56CI8?=
 =?us-ascii?Q?QkHZkqiSGC7e4ANzo19F3pTMLrBzjpfn/D1esaiTq/5gRjzIoYuFWRO0b5uv?=
 =?us-ascii?Q?DcbdTlXUI+TuEwQzeMMY8lqqgOA8LWlO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:26.0505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd57673a-2e4e-4255-4999-08dc9fb1d217
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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
single device already, so the value can be inherited from its parent.

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
index e0e1fcfcab1e..8951a0805239 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -241,7 +241,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{ NVIF_CLASS_VMM_NV04 , -1 },
 		{}
 	};
-	u64 device = nouveau_name(drm->dev->dev);
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

