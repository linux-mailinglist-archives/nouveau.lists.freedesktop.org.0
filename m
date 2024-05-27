Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2988D11FB
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFE810F748;
	Tue, 28 May 2024 02:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H4giuvJ8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2085E10F684
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr1qBuoamEHItBv9QaEYAEMTBxcHdrVfd/sxitO07RvM1WDupPAmgQJUk1zNMFRRzXqtNBHyagpQ9Zio5vLcxwzV8L64OtkzFQSlQ8i8ND+cr58IPGDSlT27iNGba+fGbxSvdUzzvgiBMnUppQKYPQSB+vz4er4BctdTeRll38xK4Qg3Bt/+733nWrFl1C3jHakAPBrxrGKna+0Dp1V1fCdEeLZXcJ7to05aZjRjH9Mf13ZtCZqUDzgGasFNvD7wsV8FGa2iV318j9pK9Hs8UYlfNgoch4NAaoLE1ZR7IUujCAX2I8Au1pXM/sF4gdmtS3kcEsFF/ljPJ5MGXQc6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfacgjpcO5MKVAJxJi6bBwl4k9K7IZy3GwxCGGeo4sk=;
 b=P8mg7ybenlIHE8w7v7yHqxShvJFm3eTChaoLyZGcR2f7eONyJ/wfcfvc4/Wvgx0iGE/B36kH9oToBL3U/9MwtVxa25gfDsIUZddKL5UlNf86FBwdAXoxJl0JvNxvfxEwcjdoQG0bHFGGqtYqlDIbIlOpSFuOM5ULQAmgTBQ2OvH9w49BZ5nHIIb+rRTmStVAX47rPt4ZLO3lvTEmcvZYkf2uelygLyvR3h3u3IEQn9AGy2/8fFm1JBrCoS3lPfAWCHaDo4bxc8kX0tnn6xIPOrApf9kvnozX2ApLt2m/druo+oPOTRegmJBXRHhs4kdBt9/dqyjPvEP/hXimuRi40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfacgjpcO5MKVAJxJi6bBwl4k9K7IZy3GwxCGGeo4sk=;
 b=H4giuvJ8nh4FdoOeG5ae9/Ww+RFEeLjdRDmnbdEnEvUCC8IjN2I2alaDzEPc6gKCWxA805wTlcIJY7j5wxBtzVEQmL5bB6Azvwm+zho4gdYdbmf04kGSCw+WFM8+vz++imemT1BiPJdmbOelBmt227Xoag93keeHKpK0kmNQq8buwKtbiP0I9H24od/TpLVhb8Jv7d4n/zOlaDnBNOmG7rAY7Vd6xkw3IneV+W6NPVJl3G4Ir6NPiLDGmZ7d59cPZumZRSTv8mlkkRjvsuwlIjFTna4HleX3qpzRqGuQO4eZAfUm4Dd5NdEvnmx3dtDIBmckVUa/jb9J48zKq7NZ5w==
Received: from SJ0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:a03:2c2::9)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 28 May
 2024 02:23:24 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::1) by SJ0PR13CA0034.outlook.office365.com
 (2603:10b6:a03:2c2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:12 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 16/34] drm/nouveau/nvif: remove client device arg
Date: Tue, 28 May 2024 00:19:41 +1000
Message-ID: <20240527141959.59193-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e633a4-6a39-4ddd-0af3-08dc7ebd26fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rV1p8GcYtm+0+krGKD4wge7MSgu7pE9xqqPFa/ZAyiwIpCo56XjlBvJN7aSA?=
 =?us-ascii?Q?2ixWuK8OgPMhlpkC2yhC+zsC3z8sriuXvrpKxXs1/fPN6DPen/qthnR49qud?=
 =?us-ascii?Q?Bv84PUz6UF0OirUN2XqZAUjn5iWLoVF1iNIA7MVhXj0jawKmQEJWyjp9qoOd?=
 =?us-ascii?Q?JeQnHHL/NXTUS/lhUxMUYCtJMmRQc4BB7dvYLH+S8jGrbcxDXaCd0O/ejiKL?=
 =?us-ascii?Q?hJGf3AHgKa3MsIMiqdOWH5c1XKYG0seQblWfxUQ2Na7Lga5UjJ7L+JHXPKfz?=
 =?us-ascii?Q?GjeM53fY//CjqBp3wwfw9Bx/GHNnTqbutSCHXxYf+452Jc/d9uis3jZzv1yw?=
 =?us-ascii?Q?KPP28pxEZNmMy3DepgMcUKSE2cU5Ibu8emJVEIzMLwCp0h5rl1LrLIAGY0v6?=
 =?us-ascii?Q?D8ubZhBApJo/TPt57ZvaNi7Ch0QJqXnXvlGkI2ln8FKyr5ejxF9ljbljRNLO?=
 =?us-ascii?Q?tTLC3QkdVKwXfGvoDr51tRRcpZ2aRW5Ni4BhOo+EMLs1gBXqRDGOU+Gqm/Pd?=
 =?us-ascii?Q?R9bc9fPqLMDbNseja4/xeNvKlmrU+/E2HtQPMCZ9lE8ll+OM7AXeGRSB9X76?=
 =?us-ascii?Q?8jx65mzXOPGm5YyOJw73L3nQzUmC12qkN4cYt6RZvgUH6/w3ryfBliDh0JPC?=
 =?us-ascii?Q?IoGlM9po5SRPtMHug/ftn81seMHPj0USlnmleQNv5afQ2A9tTBNA/QqKxT8P?=
 =?us-ascii?Q?bfq09ETxQT4Bcdv+glORV6plV/5pHnT9MrtGPZcKx4fIZksS3EJCRJ5BVDTl?=
 =?us-ascii?Q?z+Cl5HYTRCR3YYwFgvMLDw8GiPCCqkkWd8P63x+J0mEdh+HG2QraH10NkRo7?=
 =?us-ascii?Q?JDX2+hLj6fcTcgtR3yMU9LoZW487LvFL/fYTxbFtzPKvfGsfWdxZSkTQUlcc?=
 =?us-ascii?Q?jTZgUUv7c59tqkCgtQBnkuZSWXvLtLEFABByv/kKMxg2ViWlLC8jluH8iX4U?=
 =?us-ascii?Q?9RR0WpYEUnjqBr1fsgbnNtzMd5+Ic5T9mXoihq0j70Yy5l/cEdC0aVQx011i?=
 =?us-ascii?Q?P0GntFMz3kSMM/4M5HoQKkjjxNksMLQHzZsUui4F/hopHiCytL62FsztLuxS?=
 =?us-ascii?Q?SWbJuafMttd84iMzoMDvohG6E8wKz5ppHss09HMyUFa3jUzAEz2aw+NengW7?=
 =?us-ascii?Q?5D8V8H2qbvPyEFPznn5bFjYXU1ArsZ7vN4h+KPtzQi5RpYo8p/oj+epRtCT+?=
 =?us-ascii?Q?4fpDNLfRNCib91b6nG7i0xmTC0K8T7UOE1E7XvOO0WlFM5F0Br6T9rDWc1wU?=
 =?us-ascii?Q?B1RJ9cJ2TdU+8ukfgFzsxWlMYNt6wKvXnVDCaFq7OorHcHH/EKgZEFOAWcb8?=
 =?us-ascii?Q?Y8UdmqFqh4BsWdjQ61FwEOnQ73at9czwKiAsYjKlMuDygD8cTHdpcDD+SzB6?=
 =?us-ascii?Q?eQrXktLUcyq9N3+SAnKGG4QJqRl6?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:24.6201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e633a4-6a39-4ddd-0af3-08dc7ebd26fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772
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
index 1add85717db7..2f6d15060cef 100644
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
2.44.0

