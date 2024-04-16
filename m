Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B38A78C8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EBE112F3D;
	Tue, 16 Apr 2024 23:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uRfjZ35o";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F820112F42
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfEfYXw33wIAP6FHA0Ms2THVpH3gFyaJ4xv6zKcxaoAA9eW7zYV3gJmTIfKkxzlzOKhjpK/6C7EOAbBiiH1nM9Z5EVLs/nQdkjXbA3eG55h+f3GYInlQz9aBmGmXeh1MygBxRFX2LY2i3jnLupajs9ZnTkI3TA5Uct2g66qFde7VXrUD3Z5ZiysGA6Una0vfFAxqHbFmh5Yn2z4CUZUoy9//Ccw2B+CHzk8UiGEmbgx70fWJtfUKDdlfklVEHuYbRUcARbqbe9cbdYaePMpA+bYQs6NkF34VSQ+tfSeiblGZTqMkdIWnzUIV/2Db4WohJx+rluctXPO1Nqzhrvlcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kf4GTwRxfjZ40ErBM03Wtyg4VWWA+/jlH3dk6kLMN7s=;
 b=H23l9M/9Dqx+scfy/Ce64owDj3k3lhDiEtPdpbtkMYut/tduP2NugroMJX/jU4ijn+V+5VUsAc1T3qq3ihTfuPEo8XnFqF90ctDCRJGnoayYocvFmKg2qTdPu7hk2gSoEMczsLxJkVF9HHLtCFQEM02ObLObgQrq8eXc3slrbLtDKWnV6VTgNq64u/HfG4AxCigfTzEGpkTRsaxOiQUlFCdpldyH5ZlGqaF+KXZASbFmItfoFLIBFXF3eE1zajl0IJEBuiaehJGoGfIWeKhbfm+VI3fMJz5Bq/1MrdUoizBfYjecYhmTnJiBcIJdFwwc9CHav/9fCN3WKt/9l63GOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf4GTwRxfjZ40ErBM03Wtyg4VWWA+/jlH3dk6kLMN7s=;
 b=uRfjZ35oa/S5sJmf8l2+F9+Ad12mW6cetslqNGOkXS0w3/i55Td8BOwuSYJnh9DweqAif4A319E670mAYqIl4chIQXDTtJESCQrK+zOAPgDCbUmFZNPmV7REssYXxeMJILzyQItAMNIGHq4LVMqcuL/JhBWYV/51Jk3vevSyB/PwAwghGg5R3CX59xfRn/APpxKu6eCI/YFuuxMkjxfZibfySGo24ri2+vMO/MsTHJw4xdSep4EcP3q6r+0eov00aKHZtQSP46JRONS3erKmcPmFityfPt3kwJNZYAOG9J/9Ib5cdf1SeiIA8ffPpSt7haZ4Flk8NtrX57yMYV5sxA==
Received: from MN2PR16CA0055.namprd16.prod.outlook.com (2603:10b6:208:234::24)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:26 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::74) by MN2PR16CA0055.outlook.office365.com
 (2603:10b6:208:234::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:25 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:07 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 032/156] drm/nouveau/nvif: remove client version
Date: Wed, 17 Apr 2024 09:37:58 +1000
Message-ID: <20240416234002.19509-33-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9395ec3f-cab1-418a-1645-08dc5e6ebb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: it/mJyEeHYRBgbiX1LohsddKbZWwIBCcpyZMcuLIjDEMA7jSYt1+Og+Z3HCgWS3U3Dgfq7kdfVuiucFXw+IYYbY+66nc9XxPtz+4huOiALdh7/8DrP7mfT1w00aa2CptV5eRjQQIVIprxax6hOgaL0Ch2XZQ8E4eFTn9rFAvVAMl2PZEq3cl7P4AcTx9+C3x2M8Gf7dpoIny0LkH++48c/teCNyOBDvqI/j/4Veb4+yB8H2lJWBxAWluIXsc9W/FarmpLpzyR69Xo74z3ZwBSRqYK9YwHIfKSGSmpTALUkd9sOgLsdAJWhqRX7giUfjE09mV6aa4fWTTzVVOeMUI7Kof/5msXbzrn/dIgln7qsyUnvaRGYKs1pK4hNenCcE0j0RQZcOEiDR9VEfLypgHYgutUg16R+IvGv4n1OxcTM80LdJFqh/iEeGI8kYYHaMTglthwPHWoG4Het56MBcAOvHjT/ztUep0wUrJ+Tzm95YEWP5df2lGZ94vb6tZOwzExQ9C6KAYyGF6aqIM6fNGNgPxX8a35dJPYbgh8yQzLqq5G+DzL7ogRWDEW+BEI26EBHAVFRTa+Hm69IHHP3quX07DoM66TgdERxSQKluDWCILS3CO0ZWmPuJpcrv+Fl4LEE7hWKcAuTP+3lrjtz5XSmqH9r913sLbpfif70RhP5UXWp123nj+KbzDuzvup84viz5L41uhWgf5PM8gTzW43+KVBLG0E4NIHXHjOZR+ZhQ//RAIZ0IDAV2zL3fbF0d1
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:25.7706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9395ec3f-cab1-418a-1645-08dc5e6ebb31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868
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

- unused

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h |  2 --
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  7 -------
 drivers/gpu/drm/nouveau/nvif/client.c         | 20 +------------------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 13 +-----------
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 5210007d7669..87dc55f8bde6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -7,13 +7,11 @@
 struct nvif_client {
 	struct nvif_object object;
 	const struct nvif_driver *driver;
-	u64 version;
 };
 
 int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 		      struct nvif_client *);
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
index 85ad5091e8e2..098831d92eac 100644
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
@@ -59,10 +53,6 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 		 struct nvif_client *client)
 {
 	struct nvif_client_v0 args = { .device = device };
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_nop_v0 nop;
-	} nop = {};
 	int ret;
 
 	strscpy_pad(args.name, name, sizeof(args.name));
@@ -76,13 +66,5 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
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
2.41.0

