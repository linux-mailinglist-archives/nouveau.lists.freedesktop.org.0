Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC58D11FF
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B980810F736;
	Tue, 28 May 2024 02:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HA47fb+a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC18610F748
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncGerdcCxFL8uv1GhTPqvHqiacyVRsRy9RbHhm4aRylc4yaCecfmkJNuEo/eLTIqnc0MGzmpNRLssN6tSqq1GS4JUPMmWNJuoklcOR+KqMY3AMY6KQvaauxu5pRKfEDKPV6qwk43YSSHKU4knxi+VAIekb5UJ9SV6v2tYR307ERoxl83xb/Mavkk/n0BZipfo7/QehkJtFT0JSF2xKTfL2+PuON41xgSSl31/owQCUEUKe9T/8VPBTsJwoKy42EBN1cTV9l9WtMh0fzoisaEeCCuG6613jxAs/kx/wZGEeRSFyFxK6l754qs4Q3Ad9TKkquL4R3SyeJrvU9RQFMS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh0TknI2T6GK+btHn73zqJh8ezQTBzAXca6dYF+xKSE=;
 b=BE/rGmj2IicGPvZXNcyrsJXRPQ3ufCcZxHPUSChNKY0ijk+pHaYRQAPdrU02/IHHz9ryzeGlUcBOwU9tBBMHCpGJtHekxDA2FfTJmQWd/rWpQPMFweiTOQR1KkeEQZcnN3cZqn6HrEhXArcGfI7poiTQd4pkhz6jAkZhIoIV485J8HJ3sbCWCwsO8DHId7fRpX6i6MAAk0cejlNst8vI//NXQzhFxS+/CoVb7kSxdqMk8b2v0rCeUClVz02HNQVzuuPwxlS0mpDkwzSI8bBdFaJVgtzzsGSlaNAG09ycBvsWo8j71nMtm7z0y+FQA8N/+Nil3xc6tl6ohtpJ8oXZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh0TknI2T6GK+btHn73zqJh8ezQTBzAXca6dYF+xKSE=;
 b=HA47fb+amcgzXfAY77PEOZ9WcvamXSamtevcxzm8XZ2rKorm36WcA65xa9NoXFaQc2I0rYzqOa8+3bVCCfLNJjFvMonfpNnbzXKCV1nnxqsOLIdjx+UpuiKloF8NwQWMXzwKClmgZTvwO2XoV2cXvZ+P17j9LUIrHn5EPunrna75eEGc/fWP4FsHrPS2WaBR627gSCHr2hKC0qD+qYMV1y6cRDuNMnD0Ax6bz5Y0qpd5yS052tDWfIOO0aWGMOq1yY6fcFwMBal59kIW/+LAYakdW/ObyfbK8g2yDK7JRY++wNSdSjn1myBiKvgF6rrFw93R21WyKVW6ZMFD3UD8QQ==
Received: from PH8PR20CA0013.namprd20.prod.outlook.com (2603:10b6:510:23c::27)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:26 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::1d) by PH8PR20CA0013.outlook.office365.com
 (2603:10b6:510:23c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37 via Frontend
 Transport; Tue, 28 May 2024 02:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:13 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 17/34] drm/nouveau/nvif: remove client version
Date: Tue, 28 May 2024 00:19:42 +1000
Message-ID: <20240527141959.59193-18-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SJ0PR12MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c86b267-109c-4c67-3d72-08dc7ebd2801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IXoWNB2R9iMgdX521EoE1s5pO85XbaAjUkU72tN28oqBLy/U2n+CjNn7ytX/?=
 =?us-ascii?Q?C7q5vlIKAXL+3MSQ4gnFCIka9HNk760Nevl62FlaaV27zB9nxTgoSEdoHpyz?=
 =?us-ascii?Q?SvBeWXIbkir3DQjH42W3BP/2oLqdnELO315VHnb34OBCgXhnzSoWb3z3mBzx?=
 =?us-ascii?Q?3HGp+hQCF0PhxJKLwdkxVWypnYiDGW3W3skx4P0ySsJAloATzpnYxlAp9xkO?=
 =?us-ascii?Q?RS6gX69tY7X4i/Ngu2lcrYxlsyrzzctFYN+1/TYfG4wHXRxmpAoyhp5+fTHf?=
 =?us-ascii?Q?Eb6USpW9XhOZXSQUrIQzS6KsqXfG6ak/qx0rj6JxZl78IF295vUNdbcWrT8j?=
 =?us-ascii?Q?Jf/hV90LNaPkuGt0B+dHWbQOxt2mvFnReUV5zaHSsyGoWrhHYALwFwTQA8JN?=
 =?us-ascii?Q?lWIfg0G42DFr/8Oql0kiWzhIbgh4YJKAG8gv4hX6+CNz0gVVOM3oEOQBb85W?=
 =?us-ascii?Q?EvXwlIbbFvcNLADQGILewT2KFrjHm7HfwzkMaVlFMTxwuvuZphv8YkWd/KFf?=
 =?us-ascii?Q?T7fon0Euwu3C3Fs9lB2HPnyH8XgWdNtf6KVyiyn0qRDmlCN4sT1EJt0Wti/3?=
 =?us-ascii?Q?nSbQy25hu5lFw8LJZHJoHspOEwjDufyhFZOsY3pVyQo7BAQgQHXaq3VJNR6R?=
 =?us-ascii?Q?5/cs5vVk1FqKw2NZT++n8PbgYYFMXGxUF/+pN5C9JyVSbHuY8eTi/wJHz/Xz?=
 =?us-ascii?Q?vFCzbA9zYGubKlHYUsehFcjSfshc0txSkS0nendm81+Fq1qeHyDcOfhcpjt6?=
 =?us-ascii?Q?dJ3soqEKBwoILHXKabiOIPEtEDGMcjthulzrEdl6xEZoDtQ9IFeBnIzAg2at?=
 =?us-ascii?Q?RO1jSVnxefELO0UgYrvkEcyMiGQbaadqJXLKNdAIp4rqEXMnnv/dCXAtW2Lu?=
 =?us-ascii?Q?cy8mibCmVwMa+1rkoXbG6FFtPx3nZiOdaJ+JPfepm0jiVt+lhywQhRSKZ55t?=
 =?us-ascii?Q?Xb0Jmlgpi5fqcjCYn4OdGTt3nbsYipmnCzVDCrxI2hZuf/U94emZ5zOdgNR8?=
 =?us-ascii?Q?t23lMk1MI9QvxPHzH12qThFNX1OjaTbsJuYyPdAhh8DLqhysVoIRhcVA+Lm2?=
 =?us-ascii?Q?P36lJfOOVUBP+SXtKyQGTGYISxEnH//ECXeBcbWNR2/irg3IFkwHCn0YdBVs?=
 =?us-ascii?Q?ab4wZmpoi7RtfyPGbLe037OzEv8lHcVCqRTae5Yv+LmjYStf0TSF8lh7/iHE?=
 =?us-ascii?Q?wCRZsDaVt2bRZqj8UMC0RSWt+JfMtBS72tD6Km6bnReSrJNo36PI0Mo1E76x?=
 =?us-ascii?Q?hk+cnrHpu9mJoezwijV1onxycvAzZhG7lBXtAptby8M1XrT9Z0hsuTtBIrj2?=
 =?us-ascii?Q?HdFVz6euSx5k6Fru/7BZduYYzxlVBM7BtDeNRgMct056IpMVpdZVq3TrZqkR?=
 =?us-ascii?Q?9uHlbsFftNgUzYrED4Fn86v1wOfF?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:26.3450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c86b267-109c-4c67-3d72-08dc7ebd2801
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709
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
2.44.0

