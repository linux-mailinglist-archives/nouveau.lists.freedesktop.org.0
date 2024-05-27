Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AD8D11EB
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE210E37D;
	Tue, 28 May 2024 02:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QvcMimtg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF35810E37D
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkmOl7KPzaqIXGcaDoZsrZ0jvFv4FpfBIhLnpc1rrGIjx0NC26T3b4ggnv5AiapjGBpxVs4JsKlPCtk3m+/F8zJl4WVcsusibhFUo2qfa6gWuVM9NFLHgLGoySFVHYk4rRMpfiBqdKI+AXvzYuVSPFrbDt3aqNJH95qz63+glmKZQMLafOdGwiuWkJ97RdOlcqKKgPGN0KtThI+DK9UwGgKHW6jnLNvG08g508gLvo3RrSeJ+9SHAUBm1iNiNC9pJ0dxJwXhkBatkOOK+xLM+iA7jvyAKaTrQqsxEQga+P5NZH06fMDLda6ntuFUAS3eUmCllfTrDtGID7/Y3s6aGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSPFNfNJFW0gj3GLU0aHyS4G6eAfiyLveUR7vZmKgTU=;
 b=KGyaD8FFXOyKjJ+PgRecLrFFSOxQZzP5TBjhBPrsZMnQO0mx2xmxLIJcjXKYTFEHV8/4LlNJgy7rRPgF169NWqosF7kZta5VRn6lzP7bq6iAP9xYk01vWyJNKP0CpBhottmNE82QLRG/ZmRAW71anV7gCQPFkr8TkMGSEYyyhPWAMyxGw4d1dLFiyP8F4lBkKh5w1/KwNzpw29LvTvjq3Su63cNbn1RqIjKqv6kY1GtIkjwfcDc26FwdIyUVDmg7LIbr7c7vrA5rZJIQoeILRjOtyQyygcjVZc2q4xhwHA6gS+Jy9O+LtaI3kIFE+S0iCOY0PG8Gw+2Q+/8m/hIJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSPFNfNJFW0gj3GLU0aHyS4G6eAfiyLveUR7vZmKgTU=;
 b=QvcMimtgGJ9CVRiuNelQDwC4J0NQq63yeDgI+BOzseM1b20xxPWc3fK3HeIBGBcxVuL+n6seIzk4IZfcs3YOxrrg5PCYQ/2SRk0Ni2NJ2n7GbpbqE7GowYcmAEt74CkLtpwvzl3NheP3o3bpcQB9cN04MCbM1oSRg+l91dX7Z0znUnOv5SLkyl0ftEPahBW6DdodR+cXHV28yZPnBsh4dCBkOH3tmMRCDw6Tsi1L3kXAjlgJRCTgQnPa1lA9JSdY6OxJ4BCjm6VNX46K7Yz/T4Y2yTC+eh/fsvEu3j2Qp++6AEcYbwb1/grmG9yB9lmBCAUJp0XVBymo1iy3LOimvQ==
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by CY5PR12MB6382.namprd12.prod.outlook.com (2603:10b6:930:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Tue, 28 May
 2024 02:22:55 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a5) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:22:55 +0000
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
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:22:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:48 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 02/34] drm/nouveau: store nvkm_device pointer in nouveau_drm
Date: Tue, 28 May 2024 00:19:27 +1000
Message-ID: <20240527141959.59193-3-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|CY5PR12MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: d0196777-2291-44ac-2971-08dc7ebd157a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cj9c1V02PJSgMZXaG69VR9frnrcYFCh+VwGCHiDOnOO0sVb3xWquWoyckA6f?=
 =?us-ascii?Q?6kyfciI+WdXhjpqAhAjN3sso2Ydb6ZQOzLh665ioTFKZUSczck8SYkjH/plb?=
 =?us-ascii?Q?RLYQLeTa0Gnk4cvEu3b8UzJTyWdwdx//+zWSLgNPSEXPQgqZyPpllvBYMHMh?=
 =?us-ascii?Q?s6KCR50+pDziNWZ4d5pWgclDeubumpfxChKTrbCj2FU5bBm3Rrmu4UWjmijU?=
 =?us-ascii?Q?QKY9H1vnQSBaI5p4cPgVabu8eRJb6fCl2D3fCcJ5id0S+CLSuoKizn+oQjFz?=
 =?us-ascii?Q?cF2NwkrUVj+SRd9jeOMtoPJyrvRnYza8TfYL2udbl/QpnJhxoTt0U5FSnjSl?=
 =?us-ascii?Q?mPP76GAJVtcgLj4zJ81Uc578hFEyhhZECLvn+lUwSiia48cBEWUo4/n5XJfi?=
 =?us-ascii?Q?HYJIcN4XbYS734l1aA4FyA/xJCy8OuAkGRL9rT+kA96lnRerLr3p8LB9zFNq?=
 =?us-ascii?Q?ezSgOD5WhLOSIeYdPRM3V32TThVikNFzROu8vV//jj2PhqO4CTgC2zi0NhLs?=
 =?us-ascii?Q?V21l4b1p+MLbPROMJWxlhQkfOyPmQzVj2rg1pvkVf8JxAEK8e8CA1DYpHZAe?=
 =?us-ascii?Q?WTPBlKk7cyfKTXmx5rzfOqIZWgdsCFcRCdXnzdiECpn2vphUu26HU3Y1i9QB?=
 =?us-ascii?Q?qcrv1tvHtzgaijDa5tl16ykA8SI/BDWYXydQ7DjHv+fMm2hCHM6leWC0rxxG?=
 =?us-ascii?Q?/JGH44dYdjd4LrceqKzPiWv+wdfbzAOH3dZ6IJhuvr/G0+QtkRYhvWhlIEnY?=
 =?us-ascii?Q?rao5tYcCaUa7+C3/K00COmd5BM1XbvWqnDhmC1ObG2zhubvtZ2aDmSVQP1hL?=
 =?us-ascii?Q?2BBEvt+bFYy27msX4uesSQojobmpuM0izKK7lHf/C4FO4QbuS6GkCzCCg8I9?=
 =?us-ascii?Q?khDcdX3QHapZa21Typ/ChrJMHqVYfv4s5mfKvKHeHjH0+UBMm0w7yec9lxhv?=
 =?us-ascii?Q?x/0fQy+0kF2ooOQZAE2lkP8qVzu27WmaXnayT4qottBMymm02ftSg60AHNe6?=
 =?us-ascii?Q?bgrmThqDsHANRfESbLPevON0rA4BmR/P0OsnDVBfBifDdZmzkFoIiDp1f4CU?=
 =?us-ascii?Q?ThuOWoY//2F1H8ziEW2eJuIFwns0U8kv8phye4XHdg6Lt44f5QQaa2mXdhIs?=
 =?us-ascii?Q?3GCkAu6DpxzueJks5Yttx4YRGNun263bnSJjiPVHtikLi0PzJ0srk0pxrS4h?=
 =?us-ascii?Q?EHPaIEZ4SzLZc2M4ArfiXLcADLYFU1XwGntAHfRrJaWAEOF3belKwB9oV5lw?=
 =?us-ascii?Q?G0hKoXndZpn1sPqbcLSZk8jhniI0Xkg8c+UcN7CTE5aB5UfP2/1MPV6FzDhF?=
 =?us-ascii?Q?7YMpK+E/9Pgz5Qvii8wYH7lKqQXr+Gns94L/KiLQlB+BKdSIR2OzEJ3Ewt2U?=
 =?us-ascii?Q?jd4lHLY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:22:55.2607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0196777-2291-44ac-2971-08dc7ebd157a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6382
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

There's various different places in the drm code that get at the
nvkm_device via various creative (and not very type-safe) means.

One of those being via nvif_device.object.priv.

Another patch series is going to entirely remove the ioctl-like
interfaces beween the drm code and nvkm, and that field will no
longer exist.

This provides a safer replacement for accessing the nvkm_device,
and will used more in upcoming patches to cleanup other cases.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 13 +++++--------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c37798b507ea..e6ed68dcef78 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -579,7 +579,7 @@ nouveau_parent = {
 };
 
 static int
-nouveau_drm_device_init(struct drm_device *dev)
+nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 {
 	struct nouveau_drm *drm;
 	int ret;
@@ -588,6 +588,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		return -ENOMEM;
 	dev->dev_private = drm;
 	drm->dev = dev;
+	drm->nvkm = nvkm;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
@@ -830,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, drm_dev);
 
-	ret = nouveau_drm_device_init(drm_dev);
+	ret = nouveau_drm_device_init(drm_dev, device);
 	if (ret)
 		goto fail_pci;
 
@@ -861,14 +862,10 @@ void
 nouveau_drm_device_remove(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_client *client;
-	struct nvkm_device *device;
+	struct nvkm_device *device = drm->nvkm;
 
 	drm_dev_unplug(dev);
 
-	client = nvxx_client(&drm->client.base);
-	device = nvkm_device_find(client->device);
-
 	nouveau_drm_device_fini(dev);
 	drm_dev_put(dev);
 	nvkm_device_del(&device);
@@ -1376,7 +1373,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 		goto err_free;
 	}
 
-	err = nouveau_drm_device_init(drm);
+	err = nouveau_drm_device_init(drm, *pdevice);
 	if (err)
 		goto err_put;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e239c6bf4afa..b711e994407b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 #include <nvif/parent.h>
 
 struct nouveau_drm {
+	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct nouveau_cli master;
 	struct nouveau_cli client;
-- 
2.44.0

