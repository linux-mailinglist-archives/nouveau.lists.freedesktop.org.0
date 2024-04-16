Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E78A792C
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83329112FC3;
	Tue, 16 Apr 2024 23:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ivLKSw3i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA35112FC3
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLHYlpywC92jCsXFo9f5Y08/biNAWTQf7e7det5S5cL0mG3a5lDubLnImQ9kk/eIoCnc3PJJNk8nh4wZmx3zzSXFJBZFOR7xbWCVY58jcCxwnfqW76Cp5ZPAeHCJWYwl928a+m+7bBN29lUhng6KBzVRu8S20Mnd9r+EfOvbTOKtYH+jL0N0av/OxwN0hotYtRUB89IBxWac2KkyN8/hSrpwqUPleZ+auR+a4Jbrns5XZy4D31SSB1qAfprQYZcL+9ciaeQTyid3mRicNJxrTeEW+E2rhPZmmiOj1oBuwUy0+z09OhbbaacIhTiknmH7fFlVUQsHLUTajuSPNolQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+wbSD9FAYPWOO9JUBk2Ql3GnkYxRshILt6xf6SNJKc=;
 b=GH00fkbHQFg1Ac/Ex4Pe7Bm8u87yJbPNlCgFgDT820MbEmNhPYSRh1TXX0GWv9FwFPqSOWLLmzjf+lIQ2zV0mVdUvPLXv1GQzzMtDF4Nu9XW0XxulXG26nS24icg8ZGRejHM9m9aYRgPWHJ8gcyusOOZCE7Pslif+Xe8fFFa+Y+1gpW7HXR39/rUb07zAjVmTaRO1xeBcLvjUM45uIDnvNYtnlDj8A8uyB53OI6jwo3EsJXmbrrsGviPB0FrKB0t2+TKuVKr1+2qSaXmzpmyXWtcWIPporvfNY/8oB/G0uPWVStDuwwgqVHTjczGsDybU0E3BDkvZptC/lPJOSComw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+wbSD9FAYPWOO9JUBk2Ql3GnkYxRshILt6xf6SNJKc=;
 b=ivLKSw3i4tpLBlASpkduo8dcgHGUPa96OhGAn9Y04pul0RynZoJ8SAwq63gDwMMEQndg4KpOYyWeWPPgbCE+AltnuoGe485UEUsOaIya8rbSqWxvbTa+5IeflEVPW+s65DO5fj1u8FSZeIWtUk8MaD5/J0wxP8Cgh1QQv9zP+ANNIkCLOdp+4qZtKhiHJdTcUXDZyd3v3CsGTv+6M80uujoFSJ7nPRMKZurL8DS+rPV2+BksxPREAn4MKeR7WhsgjvhZ8we0XkGU8BQyMGytH9mjAftuSe7Fz+JLcwrjSmu8iosuUN+QRstpURCewpljdsV6j8bMawBskOQob483OQ==
Received: from DS7PR03CA0107.namprd03.prod.outlook.com (2603:10b6:5:3b7::22)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:15 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::49) by DS7PR03CA0107.outlook.office365.com
 (2603:10b6:5:3b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:00 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 131/156] drm/nouveau/nvif: remove disp from object rb
Date: Wed, 17 Apr 2024 09:39:37 +1000
Message-ID: <20240416234002.19509-132-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 3948596c-f6c5-498d-5a56-08dc5e6efca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAw2T6fSXlbMawvwirSnYayWr9CchAN9D6CvVTiShStE8b2AzXd5jeWUAcreo+XgBcq/LBIuGUMh//lcmOIIBRrns2WK98N5y92YsrGAm+awTT7AG6JIP6HVk5T9C8Y8D/63WaEDzTd8/o/GVhYaPp5pKnewDP2052jnDt2981hOvlVpjZhFHaooEXWooVYJLjXv6iECVZIX/6PD1axK0vNGTJAtGZZnxX2bbp6CPW2dfeP4AJyRYkOy5WJtzGznYUlUXRTauqsXaAx7QJTp+6eYJXoRel9QQTdWcOBL9G8GdLGYIcYeeTiNbnz2Ok7o/9rjFgtCK3IOjbJ1rH2+uk8CfFvIocIEcC1ojQ/BQGqglF8ThJK1IVANG6HsIrBxmATrbOT5R9r6krYMsmXjxbRf9iBYxaaI/sk63/rc8m+1XzZDYHpWmKQu14Na6ZyNJsNg44vpRFa7A6w/9fnwQNnZi94XcD4VQAE4xskersv08VkEm2YlGl2SiWrvYL2op156bajtjAnEtTqipfovDgiuceZm7+NoAxT+7HHM/+DHZmlwH9RrccInNeeNqTdPPjLqv9Dw5P3FsGyknFtbpYEOnCqORjFlPKFS7Wnom5qC190B7tP7t5L0Rt+F6fpBx7ESI9DwrEYfCyb9cQ+6oYN7UU9QPlykU2qyHExM9ONitXJvlctA2m3KI7QDtpPe2kMtPdW4vzuTswdPmBZ4lcTaMCdvo8nM7rY4yc06N3RPYOP3nhsHFxZK2AjKNRJY
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:15.6273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3948596c-f6c5-498d-5a56-08dc5e6efca2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nvif/disp.c             | 3 +--
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 60a3529a6594..d317fcd29091 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -484,8 +484,7 @@ struct nvif_device_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_device_priv *,
-			   const struct nvif_disp_impl **, struct nvif_disp_priv **,
-			   u64 handle);
+			   const struct nvif_disp_impl **, struct nvif_disp_priv **);
 	} disp;
 
 	struct nvif_device_impl_fifo {
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index d2824e4d29f8..b0c4fae39b18 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -97,8 +97,7 @@ nvif_disp_ctor(struct nvif_device *device, const char *name, struct nvif_disp *d
 		return -ENODEV;
 	}
 
-	ret = device->impl->disp.new(device->priv, &disp->impl, &disp->priv,
-				     nvif_handle(&disp->object));
+	ret = device->impl->disp.new(device->priv, &disp->impl, &disp->priv);
 	NVIF_ERRON(ret, &device->object, "[NEW disp%04x]", oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 3c7c0d1e6adb..6a3b41004abd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -96,8 +96,7 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 
 static int
 nvkm_udevice_disp_new(struct nvif_device_priv *udev,
-		      const struct nvif_disp_impl **pimpl, struct nvif_disp_priv **ppriv,
-		      u64 handle)
+		      const struct nvif_disp_impl **pimpl, struct nvif_disp_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -106,7 +105,8 @@ nvkm_udevice_disp_new(struct nvif_device_priv *udev,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

