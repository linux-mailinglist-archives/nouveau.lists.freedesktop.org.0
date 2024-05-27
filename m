Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75448D11FC
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B7310F88B;
	Tue, 28 May 2024 02:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U1HLEXeb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CC10F5B3
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0Q+zbN1LqIR4Hx3sG2hIPAIfdYRZzj1x5L3RYbv+wqEUldzobZ5hj3ESBvSeORbUZi7wY7FVuRB/26rPQ7zXM/iFh0lVlD4RoZ6cYE4FoAQxpetv/TqfdNbnecAq47DL1icIR8/AzDVVpqn+a9Ro2sNb0S/P+j0iU0dosqHsryPd/0viAHy4cAKpnDnbjN8ePNqV5m+7jdijsOH9PudhjsDD3ys4Nvc8BZekZ6FBLwJqJjhqTWuyZe1KJaWhwZ2JdqTpJRZZo5+5vKl64mi1K7ZXNLpOgZqLAz+dP9Lf0BVWZxXtGI9po7wfFnptV4Covp1JaJWnzj2lUC5RBAMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJG49FvD2oLuvE9svf6VItxa7xy+e3S5se884n88HCg=;
 b=jx5esA5Rle/gLDlcHxaP4s2jCHhkcuTIJ9AOHk0NdDDO52OGHLzjLS7kmEvcTz+mCH5fmQIbXtTJCOJW1xOqtkUW2uJbMsxiZaCuqI4QQ1IXrBBk8PelImSFV/3tMUnUEBZllyurtZXdSy8I10g96y6ZZChNr5afS56k9SB1esx9cdgDydt7dPU/rVqAy1FYI5YSxwYZgz10BcIXAAGxQb+4dVWMD7IvGR99MJmwQ0jheBPByye1DGmYIeMLK4p3P1OaJjNQZNjUXNyEFP3ZBAwaLdNUZov50lHGUHHIScLq9Dx1RooLnI0DQUEnw3uc+DHHo2TGRdd1j0eYIou16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJG49FvD2oLuvE9svf6VItxa7xy+e3S5se884n88HCg=;
 b=U1HLEXebx+VMn6/iEvDxBDRvxQeA1EGKA88ZqA/NPyEun4bp5SV39OMsh5xN9X8I2zEn1bfCVzJDACTgkQ1v8tYP6Ko2avyL7iIQ0xHgoMGGANnyeCOyr5x3+5/HZx4S+jR042oZdWwEpAdmt8b41SCBxsvhlsy1W97xksAW3pVtH9vC37q6S1no07Kldw46QfuXgQ6pPqvc95LnH8ZCvtz+aatFWCI5vTl6uYX9/AX8snXzx+2gxNQofg7RY6/R45VxG3NBps2i0QxVbKIfKgKtT8ngZ/mVYnltvUrKy+8YT4KPOI382UbUWZN2SV0Rg6TThXBPYojW6o3sE1mIVQ==
Received: from PH0PR07CA0118.namprd07.prod.outlook.com (2603:10b6:510:4::33)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:24 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::48) by PH0PR07CA0118.outlook.office365.com
 (2603:10b6:510:4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:10 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 15/34] drm/nouveau/nvif: remove driver keep/fini
Date: Tue, 28 May 2024 00:19:40 +1000
Message-ID: <20240527141959.59193-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: ca39ac4b-10b4-4367-54c1-08dc7ebd2656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aHkrwavHSN+Q5Ra2tE9GY+f7aOWTkY5A7IFvHRy6Ly7lggvSPCRT9faosxFv?=
 =?us-ascii?Q?OG8IcGWA5Ni0KeMjJd4Gr4/QJ5DnTIW2wekaMGGn5IDTBYs4ogYVKr9nMKA5?=
 =?us-ascii?Q?dVTPCmAP654C7UuebZXIYZPzh0sQO81S3d0+Kg09zCTN2fPu/mk1qy+wwP6O?=
 =?us-ascii?Q?AHK5Bs8b1hCuJ7iA5lpV8jgYyLxm4f9s8XAbmA1vghfTGLWFO00OREbMrLMb?=
 =?us-ascii?Q?hYg/ig5gV24RNeuttnkOpKhY25Y1rGAzHQpKlmRCIsqVqIBc4J6d7IKj9Mvz?=
 =?us-ascii?Q?3H4j5pHsB6oWYnMmw1ep1lxeRh5/2e6MShylRpfIZjK0YbG6PTzwH13pygoB?=
 =?us-ascii?Q?mNqy0IWs320bwd4ENO0eUnq4dG7ZzyiTj4jrbxQMyaTMqalQmNYeDxpIlLcb?=
 =?us-ascii?Q?qBT0trqoXyhl/+r3o7NVG8ilEYjOESNxzwm66eIozDu+2Zeihd+0Mj1IZ63k?=
 =?us-ascii?Q?J6A4yNtOqd9rn8DOCuoByWQKFG1/IPetDVcR2VgwyduoPt3MTPYAsFDSpy2J?=
 =?us-ascii?Q?gCdf/Q3h02+R6Q2QJiMPsKN5YMmIe1BqQUKY1eNoWZW1MY4qNdGLIjjGRS8n?=
 =?us-ascii?Q?XlIGf/oNaUAEy9lS8Dmi0h16NBqeLgPCtiaT/qGq94mYDbFRURuk6KjNNStT?=
 =?us-ascii?Q?QHQPYxM8KlTKy8pLdjlJClLIzjCZjF1xy0TVVu1ZSRax4mdsnO6oTJTwmdQ0?=
 =?us-ascii?Q?+OcKuiPA+guEF2IYIMN9LslgSUh45SD6UnvuyuXMkZ+tP9hpKVt03BrRCbHC?=
 =?us-ascii?Q?y2Oc+m+nO7h4jRXOIyk1YIhFXjA5resoN2udMCy4p0xNYXCLmXsxqPfV1stB?=
 =?us-ascii?Q?jMGFdtk2tQIfwit1YSzJQWTxvLjnVA3cF2I1OSGIVuU1E7p9rI83HunL73US?=
 =?us-ascii?Q?Qyb+v+pBdBH8C186c/RA8+kEPX/xcCBBuRAsCeMHTrHrgxXv1e6A60mfLp5p?=
 =?us-ascii?Q?8RnD8hKlooS0xsaarMaHUK8jRh1+bjjkQM/Do3c26jE77ynF8jOhU04t9pCm?=
 =?us-ascii?Q?wSTFlR3WF81bY121b7QH41I68a6XEUZXEQrU6LIz9wcfMGxayqPu//MjDYKM?=
 =?us-ascii?Q?vH3EzdkrcmnvlwpklX7KqHM+6z5tVHz6P0bdsS9jg63S/wvHq4lLTRbVxLv2?=
 =?us-ascii?Q?ZvuLXC2VTh9QPlOw0Jmwlz5r+0oT5r5eIIPxCh68sJOafwnHgMy83NyknJJG?=
 =?us-ascii?Q?t5BKu4KxrVnY+1CnFM6qSWoExJwmAsOj1E9+D9pPUOMlXDdpKjkbBgoFKsiV?=
 =?us-ascii?Q?1o0Sbdq1m3RS4Yk3oAaZK49uTUTve8tCaT8zCSL/MQajdMtYmbUsdzhbePOD?=
 =?us-ascii?Q?NvyQGnsya+7gVaNdOdluMj/oOLZlg2B+n5dGEZW/FT9pHAlX8Axn2I95OusF?=
 =?us-ascii?Q?KRT/VUuZAlnZlKqO0XqH3hRWJf6c?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:23.5472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca39ac4b-10b4-4367-54c1-08dc7ebd2656
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
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

These are remnants of code long gone.  Remove them.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h | 2 --
 drivers/gpu/drm/nouveau/nouveau_nvif.c        | 1 -
 drivers/gpu/drm/nouveau/nvif/client.c         | 6 +-----
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nouveau_nvif.c
index 9a7e3f64b79f..adb802421fda 100644
--- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
@@ -97,5 +97,4 @@ nvif_driver_nvkm = {
 	.ioctl = nvkm_client_ioctl,
 	.map = nvkm_client_map,
 	.unmap = nvkm_client_unmap,
-	.keep = false,
 };
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
-- 
2.44.0

