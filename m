Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAF8A7903
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A861112F7E;
	Tue, 16 Apr 2024 23:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GijiMB23";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796AB112F45
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRun52Zi5O0m3aJ11Ivvxl/edxUL5Ge3/9hsfcj6h4SHX8xdvF3JsBtxUXdy8W4vlOW7Z6n29KUzMVBkk/4gOSESpU+FpkKuR6OjDT6N8xhUstsjaGvf00HZGDcK45I6jAmXpv4yVMrgoyDTyZLaaZYOMaVp1lPwyakaCw29h6NkK/SbL8PSUOMvPPujt1ONXQQppfTfJuwwEm+8hY9o8REnJYDkD2g3fu5g5PYMc9BBnRJzmUfP7cQ5I3a5x+pBa6xFqr/U4UqhPfIHsbLLweT5bTlwuLhBQA+VPrQgaLX3fTI6aKDsX7sogUbIHabADdUQkKqu/ZbA8peuPtkKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3K/AmKyjxBg4gKkWH2TdG5WAELwVth7dVpMwVtDjVQ=;
 b=CVgnGy3d6PsR0+FCLbzmX2qhJlTA46XjdbWBwxLnVzO4Sdk0z6hoc52fP+h2WU2TzTcLedEbxqaf4Zf+oVFzE74AkBPTlrNgauZLzkk6iZ84C3Jg9cvu7FR8SRrhFzAeyWPsVifWLExtoGi1kZJ667qeNuyodL/1UblN61Hww4vfqntjT0/XoUzbiflrYEl7dqwA0PXGaACFcpcs8le+SkeyyS7PxFBF6UltkazaXjtUYv8cM2Qd9GBJyEUFjFGubpl/bW4YbiIPSGGEUKIlYkMICAZ+C2QL5AOvgeUncySZg7DBnCtL4y8lI65sz6SFG+JKF1B+JlCpUG/pjtaz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3K/AmKyjxBg4gKkWH2TdG5WAELwVth7dVpMwVtDjVQ=;
 b=GijiMB23UssYxENjcr2ajF+uOeXb8C3tkqS/OfB0jJv9EdPPGfdkMfsHb0kwj4hH07WqX+BMGNWZUs+oLHNI3yPzwbNiEG+zoWE9mkzFs0JqOcHnFssOVUy8ldATI/WNs5GE76Dpc8TD2NnabBtfeXVsueR7Kz/n9B8x7Uy0Q+Qo3GLbfz5wxrY1CxD0PjB1U3pVlww7cd3S53nMIBZuGmMVsc32QyEolAmdaQJXNTvDRxY7CdW8lOREGByYWURwjFSO1XYggQCyyRuHUiwN6OBjtw6cTXmKr4LXEOKLQzGOdcSoHyt+iefUtd0d/2RxcC6PKEzzbSl8ttsudDd8qw==
Received: from DS7PR03CA0090.namprd03.prod.outlook.com (2603:10b6:5:3bb::35)
 by SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:29 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::fd) by DS7PR03CA0090.outlook.office365.com
 (2603:10b6:5:3bb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:09 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:08 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 086/156] drm/nouveau/nvif: remove mmu from object rb
Date: Wed, 17 Apr 2024 09:38:52 +1000
Message-ID: <20240416234002.19509-87-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA1PR12MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: c639e9cd-fff3-4c1e-701e-08dc5e6ee09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zoc1BDnwy/8IhW1ypGOkp16s9wAe+e2n82SFaKoA16148YZqQjdHUcL1pxX66DeEoOf4SpUNHTMcP6/xpQW5ee8bdbldktknjILry9mB3WWtBt7Oitl9RPI92iBmzJAPOMBid/xvqxP47MGLxjDJ7CTjQmkeVbo3uukTjU6vSVfz6r43x73D/qS0AgIRL3jnjTQ7+MbS7rwTvzLLMzNZW3K49WUUfXXbNhypPOduIwgaCW3FVisU5DjodE63HXbTgyqKjX8cM8hsmDwp7RwyyxylMkNxDDIp2qoyrARNHZ5zcrHWRZdZsLIePOxWQVlHGWC5vXs5NFkrMSnwmcaH1lZO5VQDxDwjyLjUWJnM/RKx+v/nk31KqOAfvxPJarAVdRaMVa3SoQL/I5vcMcdnm7w7KOs6ZAy7MqJ6MikhUoUwn+ScDbsLXGQfYq9QYV88+PfveEr/fRPzIYWRJCJwuWwsYCN5N0boad61na+0siTJoAhDRglWX0vYf+xwQOAqXvaIyKXX4J1/+/m4qA5wC9RwfgwOij67qBasOPSdagSZzVv2LJulwbUDnVE9jmAcnWbTKA0v+qp14Fo2jGeDLjwgGXhX3jQIbfWpyHhGg/Hf48EMmn81LaG2NB3I1Ix62piccfhfSCi3I+vH8TBHkcH2xQO13xoShZAnqu8ZSZbTbL9rufs4Y423ReLvHhyIgnuHvsbWWV7ccvdRIC/wz4c6GKn06hubECiaEu5a4d3hKCDSWUIDn2VJiRoXN8WS
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:28.5745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c639e9cd-fff3-4c1e-701e-08dc5e6ee09b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 2 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c              | 3 +--
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 4d256a3c3fcf..8f1410ab8256 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -201,7 +201,7 @@ struct nvif_device_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_device_priv *, const struct nvif_mmu_impl **,
-			   struct nvif_mmu_priv **, u64 handle);
+			   struct nvif_mmu_priv **);
 	} mmu;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index cf1d27f2678d..b5adf35d9535 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -43,8 +43,7 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 
 	mmu->impl = NULL;
 
-	ret = device->impl->mmu.new(device->priv, &mmu->impl, &mmu->priv,
-				    nvif_handle(&mmu->object));
+	ret = device->impl->mmu.new(device->priv, &mmu->impl, &mmu->priv);
 	NVIF_ERRON(ret, &device->object, "[NEW mmu%08x]", oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index e9486d9da64b..e63462188f2a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -79,8 +79,7 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 
 static int
 nvkm_udevice_mmu_new(struct nvif_device_priv *udev,
-		     const struct nvif_mmu_impl **pimpl, struct nvif_mmu_priv **ppriv,
-		     u64 handle)
+		     const struct nvif_mmu_impl **pimpl, struct nvif_mmu_priv **ppriv)
 {
 	struct nvkm_device *device = udev->device;
 	struct nvkm_object *object;
@@ -90,7 +89,8 @@ nvkm_udevice_mmu_new(struct nvif_device_priv *udev,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static void
-- 
2.41.0

