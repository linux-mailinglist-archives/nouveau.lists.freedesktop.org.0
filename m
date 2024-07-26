Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A543E93CD48
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F27510E90D;
	Fri, 26 Jul 2024 04:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SI/tUKFb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532710E564
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGqAc95tIqMQyGdNQpBupZ3cSzn5Hh8OrHfcZIF6ar3lnxIyuoRweuxeHE0jhpf+xLZuzhnFGLkn3Mq2BJBeZ8khvLU0jxQDoSaCLG+hmnvVO5m7BVq8iemOxlb6ZxXZLokSK+hRhbRvhjno+bO5xZZafNBZ4NWHHTjusnyQ5qcvlBLp0qR1wzFwb5giGP0y8LMO7ZttvYD2l1ah+vpNWCoZhJ7SnbzmNMIQLoaDzxJmRXQGM+dTjjrvP3SmwhIrh5TL9WAjrOEQCundi+aX8PYLE215IzqWq+z/FUdliAFx68X6khBW4RRYsetDSDswKaBV359oTQgJ7DLDSmgLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPItMti5l7YPVnQ4KWdFrH+mTGf+YfLqctKrBQ3WMG0=;
 b=yXk3BjYx/0XfBWFe16wf3mwVerXbfbOTrBJwEDWs0ISoVQJYRqJWdVM4Icc8ozpemVlj01o0k3xoD2ue6z+ccMdBpf+nBSc2Lh0rfS2gHoJH4xuhmGGvO6gWxCuirO+1VUiXuxgLD650ss1THJq/V+gyWb9IN2/K43mq2+yKgo6bYzES/9EMPfGMtSzAjT/jQlZqM0Pdj1A6FlBxzQBxJZP5ouVqV9O9y0RvLLPjM/1wzQ4SSZwBBxtRs195PnPw7T7HQWHacaXnZwc3juY9put1h82MBokcLucjK01x3Q41WIqP2PYzfVHxN7Ad7MriMukaVVLVF7GzZwkXv32dEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPItMti5l7YPVnQ4KWdFrH+mTGf+YfLqctKrBQ3WMG0=;
 b=SI/tUKFbztUR3db6v4VjzfZ42Kr7bKhMXJpfrS1qGiwV2fp+QpATtlArt8l+BtxlispeLQ4nAGjGTDJuo/4WIT97PSZo/zK907EW3uEdX/SrD9Ko8BzAA22em5fAjeiKQC7Z5M4yFcVyGgRhf5UGg+k8o/DkyLKQ0n60deczp95EgsYEL3PCHxW2gaiTmeq6Cz8eOOf1zIEPbfnoT1bqjsTApAHWUr9hgVyOLzDKXOkWZuPY9P4z0aE+Kf2peRVbESgTW+iPoRdh0A/NXqH3xdRaWSovrxQGtKCiKwUQDCcODwwe48hslT6eR3/6H4hpOKA/rwTIW/IndPBJoSBqEA==
Received: from CH3P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::28)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:22 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::91) by CH3P220CA0004.outlook.office365.com
 (2603:10b6:610:1e8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:22 +0000
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
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:13 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 20/37] drm/nouveau/nvif: remove client version
Date: Fri, 26 Jul 2024 14:38:11 +1000
Message-ID: <20240726043828.58966-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c2a160-e9ee-4d42-8ec7-08dcad2ceb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yc9MhT/gNd6oY31ezrCH9XyVmtXDag4dPAJEsclK/ahhyIOf4xSv/dp9zTtC?=
 =?us-ascii?Q?Kt7RzW1YkTNOA/tAfIG45QtwPpfvnEPMAMy7UJKJaOsxnqdM7ol+js9kZlOy?=
 =?us-ascii?Q?nIZFp286jrnCdymTnCRPJn7wQTk7qQaP57Or4/a/Yc/ZjxDK+g7ZTPm+oxth?=
 =?us-ascii?Q?MT+TAvt65cR84cMYk+QUHIqL4PLMiU6u6N2SmtL0Jhf+hQk6969dsH41ELdQ?=
 =?us-ascii?Q?rqKt9A6cT26p2/RUVeenACdxwrYLToDwhwwik46dZvCIrsxULMk30T3oAf0n?=
 =?us-ascii?Q?zSc5PsLoiO54uhGnNCj2Cj5VSuSCnLmepN0a+qxobA/S98W8ptnsWjuwsdme?=
 =?us-ascii?Q?pgW9xxWTmFkTHkZSfD+g7c+25BlqKG9jdzhwFnhxEQHzBnZLjMyt1y8psDir?=
 =?us-ascii?Q?g8lXboeY1yv2+2wzWGauII9UAILJJyvxz/+tY2tdBiQd1+GXx6rVAcmfpC/a?=
 =?us-ascii?Q?nk0nqw09uwL9U3mCsvamQADhspCAbTaY0gPwjSdUr1gSCaTkmLxpGh0FHLo0?=
 =?us-ascii?Q?GjA/Wy+ICY/tb+k6AYYqdw238NR+hnOKb7X5cw72plDda8F9qwsxs7z1h8SI?=
 =?us-ascii?Q?Onb6c+TcyLnhVlcpeUoOSAKKLd5giW6sd1rcPWztQrdr3sefSVIpOZ9VEL84?=
 =?us-ascii?Q?nOPD0+TYEd5eOm3KxCEFU2r0LHJLf/qCZG9eR3NyzQdLM+DYbtUyRxh22EWJ?=
 =?us-ascii?Q?lQXxXG+Y0VsjI0wfvR9WQUA3ywJuOfEoOtMHODIf2hIJt+82dHV1ePGHR0wP?=
 =?us-ascii?Q?xxUqQOjyS67pI4tCkQc1D4qQKGCRmyLjYMUOOKG8NlBNcqNR+J7cCGEVatcP?=
 =?us-ascii?Q?iiHAM2SuvQFXR4HX1MkkCGDIyLkSBkmMDrOjJFh30zz4EzOkh3yaMktkSI1a?=
 =?us-ascii?Q?1DKLVc+c1KsuPGmYazCF2+8fgwI0WR/mU7P8ni3BbRUjB7he6wxSHZ5oks2e?=
 =?us-ascii?Q?sBowpJo8V104mjzxr6xf0btc6LiRpFgCSuIZwaNfTvZZvZQg5Jmo6iu6luIv?=
 =?us-ascii?Q?m0RiVu6jkOdns0yZCYGqDtzhkruO0+IZrgaI5dpYx+tWTQJaTQspW9CKya2Q?=
 =?us-ascii?Q?YaG2k3GdJTa+CAdtx7s790crLaEn25eenfYH8YvOYjNXj3wb3Zmz0pRrcKhH?=
 =?us-ascii?Q?gTb5E3/TdXCZUvzBuvTSngqgptbDCU439mP1cR9+Ir2cta7VPHWn0+NLSwpS?=
 =?us-ascii?Q?GtlwBx9YouF12fWWj2tIHCxJcRDVmfuXnDXf+0I6v6bsncnfOlMY4mHaTW+a?=
 =?us-ascii?Q?6uDsEWi+XPMhm0pdPoUX6JPS94u6y/HfmsINbUfrZk0WXijl7/pN0bv8mL2j?=
 =?us-ascii?Q?npkcBkzodWmZYqxFrhnojah+mVLX8rvfBJurpfwGojAIGj8zp9O6qmnZPN7w?=
 =?us-ascii?Q?y+qWrqw5nyUE3oRirNsoZHMnQIpTwSboflA+qan9Md6hV+4EgU9q3cl4JgSu?=
 =?us-ascii?Q?KW1v73u7LySbxFRPYvhPmDy7rPn3du2o?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:21.5732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c2a160-e9ee-4d42-8ec7-08dcad2ceb45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652
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

This is not, and has never, been used for anything.  Remove it.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h |  2 --
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  7 -------
 drivers/gpu/drm/nouveau/nvif/client.c         | 20 +------------------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 13 +-----------
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 2c8e9bec3f79..03f1d564eb12 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -7,12 +7,10 @@
 struct nvif_client {
 	struct nvif_object object;
 	const struct nvif_driver *driver;
-	u64 version;
 };
 
 int  nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *);
 void nvif_client_dtor(struct nvif_client *);
-int  nvif_client_ioctl(struct nvif_client *, void *, u32);
 int  nvif_client_suspend(struct nvif_client *);
 int  nvif_client_resume(struct nvif_client *);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
index 4e047bb1fc07..1e74245621e0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
@@ -2,11 +2,8 @@
 #ifndef __NVIF_IOCTL_H__
 #define __NVIF_IOCTL_H__
 
-#define NVIF_VERSION_LATEST                               0x0000000000000100ULL
-
 struct nvif_ioctl_v0 {
 	__u8  version;
-#define NVIF_IOCTL_V0_NOP                                                  0x00
 #define NVIF_IOCTL_V0_SCLASS                                               0x01
 #define NVIF_IOCTL_V0_NEW                                                  0x02
 #define NVIF_IOCTL_V0_DEL                                                  0x03
@@ -28,10 +25,6 @@ struct nvif_ioctl_v0 {
 	__u8  data[];		/* ioctl data (below) */
 };
 
-struct nvif_ioctl_nop_v0 {
-	__u64 version;
-};
-
 struct nvif_ioctl_sclass_v0 {
 	/* nvif_ioctl ... */
 	__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index bbfc80fcff43..fdf5054ed7d8 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -29,12 +29,6 @@
 #include <nvif/class.h>
 #include <nvif/if0000.h>
 
-int
-nvif_client_ioctl(struct nvif_client *client, void *data, u32 size)
-{
-	return client->driver->ioctl(client->object.priv, data, size, NULL);
-}
-
 int
 nvif_client_suspend(struct nvif_client *client)
 {
@@ -58,10 +52,6 @@ int
 nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *client)
 {
 	struct nvif_client_v0 args = {};
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_nop_v0 nop;
-	} nop = {};
 	int ret;
 
 	strscpy_pad(args.name, name, sizeof(args.name));
@@ -75,13 +65,5 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_clien
 	client->object.client = client;
 	client->object.handle = ~0;
 	client->driver = parent->driver;
-
-	if (ret == 0) {
-		ret = nvif_client_ioctl(client, &nop, sizeof(nop));
-		client->version = nop.nop.version;
-	}
-
-	if (ret)
-		nvif_client_dtor(client);
-	return ret;
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 39d5c9700867..584fc43c0d75 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -33,18 +33,7 @@ static int
 nvkm_ioctl_nop(struct nvkm_client *client,
 	       struct nvkm_object *object, void *data, u32 size)
 {
-	union {
-		struct nvif_ioctl_nop_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "nop size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "nop vers %lld\n", args->v0.version);
-		args->v0.version = NVIF_VERSION_LATEST;
-	}
-
-	return ret;
+	return -ENOSYS;
 }
 
 #include <nvif/class.h>
-- 
2.45.1

