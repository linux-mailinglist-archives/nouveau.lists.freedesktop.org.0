Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507892AD5D
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2406110E461;
	Tue,  9 Jul 2024 00:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nL3u3tTD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C18910E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPib/U63K0RzOfl/E1askaSKTf1Ne5kezSnLUN8RxMi0paHcYkVOlx/myDxVimvzb2LdtJ9FT1yzFhG0aYCjcz0H/kinTQzTZU2WV1Ki4krUA4LYkAwX1gh3gjqcv9+gADaU8eJbvqfOiVqa0qhfeRh3Tcg6zm4xynV9EGU8fnCiNY2Xev3cj75JJi3sLFlTgZ3s/psVr8HliMCnG8QWdbQDMHEkw7HtzTPFaa3iJ6Eyp+xcTHxxCRtA9bOsMMF/yJZz0HJplQCrvKzvyGiwBfzQmzvouNNW2VtZEf3XuMbBYIJptA2XJUX3zvfq8wyT8tyH7lzmQnYAjJKvlwqy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPItMti5l7YPVnQ4KWdFrH+mTGf+YfLqctKrBQ3WMG0=;
 b=ZpOh7hr5Vdra/1eDcWEQikdZM7jzOZMLpPM0uJ/0udjMVfwBtGgsX9sDS0ZuwMKjcvZy9uWkupMPCS9OXBBwtXudKwdaBPGLsODRKa2CC5f2teMfvpm2vR4shxJTlxpKbv0b4yIxlAUmNQtkYmMpoD4FkjcMA0zmrNl5yS/zIN+H9CZOb6hQ7XXb19xzM7/oWtH8UMQvbbxa1asjE+WkM3Q10VdjjEirokJxUw/uXgSbu0fjHJu/LHPhAOgZZShT2FZWtfCgxAd8yjbwXIpDp4NaH8GcFkd4ualCyhNZKNxpKLguRhN7IkXUmHanZ29EvuDvGom3wYLLAZ6ne8KjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPItMti5l7YPVnQ4KWdFrH+mTGf+YfLqctKrBQ3WMG0=;
 b=nL3u3tTD9zgj/F6/9gfsviS71cn2fcCRvyTvd1XddnXFhvzAywRd8LxX6Gj93h1f7TwfhwBPAhlPcOmNKDNbVQ+8dITQ2uQLhVOcTwS5iI+NOcfhMYamuaQ1tip9c8ES7XfoK/H4Pgl1VWwOtRgogxFO9bG2jQ6WsKHvK7esumS8Q5h8XGttwgX3mor7n+omaCcNdSiztZmuaiQtza5+Jyb7Vv0jZFfxFExl7Q8fxyHLK44gjOKJySuwiy6M6ScDykDbohq286wl6JbOxQ6HEbzEQcT0xO0hfzTmnZJKPDHBIHOdF+UGJI1WwHbG4pTAfqfG7uoeVKPg9Ed6TVylDA==
Received: from CH2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:610:60::17)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 00:55:24 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::ea) by CH2PR14CA0007.outlook.office365.com
 (2603:10b6:610:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:15 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 20/37] drm/nouveau/nvif: remove client version
Date: Fri, 5 Jul 2024 04:37:04 +1000
Message-ID: <20240704183721.25778-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bfbebc-de46-4ec6-61db-08dc9fb1d09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pgjXaPs3UfTkQMARduvm88ChrDUchnF+YxZ6sco42JyMMecP60aWHihRTAkf?=
 =?us-ascii?Q?G3gdH0qLs02C23ff6gWmo2J6D6SYliHNil3pLSDjbUS6ETj5I86Lo3d5NUuI?=
 =?us-ascii?Q?Hj2XzvvMFtPxwdnODy370mzT6RWeUBlm+TzMK7dtWCtrDteoxtuCnIkO45D2?=
 =?us-ascii?Q?5hHApB/iSJzVNLSTF0gsl30LtuY22g1lyd3Fc8B/jkQ7eeyEkCvRnQdEwHEj?=
 =?us-ascii?Q?I7z7VE+QxVvHz/omkDMdo4agiLypv1ogwtxW8nUv8wEm+8MIBGyvMGtiS9cU?=
 =?us-ascii?Q?JNrb6i/WAmKQtIvblQRvJZG7nM5OiwCBbZkzgkxYfwyChir9WYqqVqhgZpAv?=
 =?us-ascii?Q?HuuMpfrmC3JzDm6L1OBvL5XDjMtE8SevwsiJriHxqPNWJ+to0Vk+6kySGjyY?=
 =?us-ascii?Q?erPSfmDOxkzpbXeX8xC5AgBb6eAR/XPF+DYtGAy1V2N7XplOtE7U1FdCBVbg?=
 =?us-ascii?Q?NlbE7mxNbRcv7kZySaNqNjvMz6O/uEHf7HXQ4o0mt03YYNvA1yViw9rvQ3Nj?=
 =?us-ascii?Q?kpQY/lPzmK+tZJjGuFOffoXolkZN3DxrV2fFgI6D7ES5uMC/AMCjkkHJATZZ?=
 =?us-ascii?Q?fDmuKtZZCcbiwqYfYo/zq/Gm1y08RBsTboelrLU9ao0w4Tw6ze8DP08VVd7R?=
 =?us-ascii?Q?IXsXuhHywX5QNCmp2FbVacFD7EaK7mJrUcMnKcnQmKMl1lvbiFfSfPUpfk37?=
 =?us-ascii?Q?ir1wQsfVJXiJkMzLOBwTp0jCjyNnqmVC1zDTQpJ4Oix+Ngr+WgMAhzz+XLcR?=
 =?us-ascii?Q?qB2cJGCWJaMRXyCmI3z/k5fRS9lhrRnnnLHPGuAvm6DLp/gtm6Js13rUpTHG?=
 =?us-ascii?Q?btEtKfi1lfn3mU2TgmCt34fGVEeoSJsnIx/pbZMjrMNV8MyvRMdAZaNInChC?=
 =?us-ascii?Q?RNYZ0NEkRU6cxc6LQFYweYHc8N1H39K0H0O2EpUaEduZB0NZe+uj8t0kDTTW?=
 =?us-ascii?Q?gxZon6SSvFVxsTeq5KY6Z/Oh6d9OUlEBM6MQmx75h2ZoqXVaw7nrH/Rzwk72?=
 =?us-ascii?Q?WU8/dXcUhxEctUSd295dLeEe0xAL5kk9NsHkISamoYUs5fHSPYnjSXNkVUzC?=
 =?us-ascii?Q?tr8yMDU61huyaUi+9MV2CsYmwMTz4ZrrN8XUcfqbbM2rdQ/UOkaCelMfnqKw?=
 =?us-ascii?Q?82HRrKM0gs7WTwi+yHwb92XO9crwmzcAxId+ytNc2X2CkKQy86o22HutX0wK?=
 =?us-ascii?Q?WePQQssSzINoTGcwQojJAxq/c1EgcXHSdYD/y3EBAiR09+kVK7v+wwO8105u?=
 =?us-ascii?Q?sdIcJ3IVHSPteDWvZJJkWCVU5mKxJBK6mViNdSpFxqYC7Any5Vj+d8BxlLnC?=
 =?us-ascii?Q?+yEne77NAqAQ7VJ5GcA8oi+DSMe1+azUce2jNluuBdy3A9jdMdw+iu+FFo0g?=
 =?us-ascii?Q?x1XNuvwo9enFT1XBLY5PFKt8a4Ol7wX7NoibAg7qtKsuArG60nCoZekgy9fW?=
 =?us-ascii?Q?lC6MYeXa0D/Th+NnW6L5kqwE9/IdQJ7t?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:23.6273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bfbebc-de46-4ec6-61db-08dc9fb1d09e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638
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

