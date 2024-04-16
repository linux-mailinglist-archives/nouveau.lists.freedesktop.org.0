Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E98A78EF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00145112F64;
	Tue, 16 Apr 2024 23:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="imJgNX48";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FD8112F5E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuOCqOFwcxpxTSuqaewlXLgUs7VpSZsl8HolaYD+xhBoJQugdKGOmtAB6P3hVrUIsIKygVerxQoVgRqkgTKLwpbFPrsHN4B3riiGPCn3vsFgkPgF65dhWOPdiehuqBE/ush/ycG6xEMnPCKI2E7+I41Jp2ISqWSGlMViO38UzyxVbedjGtCDP+TZv5h3XmeASBzbTGdVsotBsXJtcWnXAC/cJd6j5eygnrc21tluDvXAtbtCI1sH9XIFAjfyuWTZsE0uG98UfpgxIlH/Ii9TrF/WPgihUbW1DkAzoHuhdP/H7BdM4yPWmDjpW2T9Z9N35WwprHoRXF4keAFBY7rmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSXNa6VBxbl+lPBAQcrK8Hc/i/pbsRfgG4wVexNOtdQ=;
 b=T/24mqpNWsjpfTkBY4SYQYV1w/AMMnDYvXORabZgUE5cM+FFcgCAJ28YBLWWi6p2ck23l2Io3WntSYrhYMhzmlbR6RwqzatB3LT5szEzWVnO4wjN0b2xouQ4OLREiyQ4RgRqg/ibK/ZdfqijW95C3zfRm4uoQSyc3Fxcuj4nGdV0SXblbsfhpJlAb8dKBlShN95RmvRGegKNOlDKKKxT/4tpqEvAEH/BwypR7a94QsRkYBiMga3EG2S03+HxeO0EPmlp1m5FwLs6Unf62QJs17itHFWh1E2ViGzCRuD2lohAHHzuji/n/2anBulcSlZX1qzUxOzK+i505H8t58G21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSXNa6VBxbl+lPBAQcrK8Hc/i/pbsRfgG4wVexNOtdQ=;
 b=imJgNX48bbnBb55jaax+toOOIqQmdnAdsw2ySgWcWzMz/0uZ0J1Fl6a4rD3sWHZZUh3uqYJWg2RDvPzlMAFRo77qs5Ghe/TMm87bYCjUcdL3WqA3EgTcYidmxKePDfjlmQ5GC9IZckG2hr+XBbnFK8ITpw5T9Hmqpj0vgVodxo7BdmhwfsBrIBZf5dQ0qgRmKytNDQ1H5tP6tbPmFAgAB9U6Idvmb0Hkh1wDT0yyBb26NitLMoD/ueAbh4fg3QcJb70Y6/WOeNGjCFWtL3uOTEhxE6WwjBRc2Trszve+lnZ5Zg3MpLQbEp5/boHfocp5Ua70ZYLNTUhePZ1jq3Pptw==
Received: from CH5P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::20)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:01 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::9d) by CH5P222CA0019.outlook.office365.com
 (2603:10b6:610:1ee::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:40 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:39 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 061/156] drm/nouveau/nvkm: remove device list
Date: Wed, 17 Apr 2024 09:38:27 +1000
Message-ID: <20240416234002.19509-62-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bfbd70-d706-40e6-d8b1-08dc5e6ed050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: co5HpNgLSnf+dabku44vWl8tUC4FXQ2WXtJHms/wIiQ9srb3GWXVFDsTxrWEskEA1dg8dI2FVi6/DOkrtbTEMXlhD5x1/TEBztbOSbT91+2ShM1AphkxBmo2Tr/ufcp3IeRQTBK1PNr+L1pp1JdXmH2Jeu1xucU8TVGcWfSEkXK49KwtLSX0WpiIXCVBlCllQZO06vcbRFN/0DhSQEv2mx3gP5vbSYTXzVodnU0y22B4iYpjxud2rhmcnmS+PsTs40oLxgAGrFGozTXD9B0ZTjJ/BpL8rYEUz/Bgf6kIEgF3g/0dO4ZcQesgd3zeP77fbkALfgKiYnlOgg7kbxrmAaVcvx3rsINSfkaUsCLL7JhH0g6R6zReEZlDZVjUS9crebaDFRTPPiL6C2J51AR1HmBbNki+Mf09IN+TF/lXuRtZx+W/V0ijx+vUaxELyCyaxF61kKLAtylALd0j6p+ZIlIZl9C9O7Qn+3CiFt8AE9xDJkH2cqX7T0C06Rny5syMrNvfJkv/O9lY0WPHYFFtYrUgO6vb0wIhhNYGskmldc1LgzoCqcrL0BbqMIbnOLVp/pWKEoiLVi50I4G0Ts4yeu7llCJUhSPT7o6kYVWGQHs1owc111iPuWCsmkFXByd4eYTqzv+HB7iNu4rg+qcyb7jXZJlaiN1gRXOJtKS8IosalM2uyGeTtTE1Y9b/uZ7eqMWLPWz1eonPWsyDgAc9a/YO26EtggEZEbZa/R2RvuegGL3On8fxlcaq6J5qLw9W
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:01.2578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bfbd70-d706-40e6-d8b1-08dc5e6ed050
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283
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

- now unused

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/device.h    |  3 --
 drivers/gpu/drm/nouveau/nvkm/device/base.c    | 34 -------------------
 2 files changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 46afb877a296..efe1a0048328 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -22,7 +22,6 @@ struct nvkm_device {
 	const char *cfgopt;
 	const char *dbgopt;
 
-	struct list_head head;
 	struct mutex mutex;
 	int refcount;
 
@@ -108,8 +107,6 @@ struct nvkm_device_chip {
 #undef NVKM_LAYOUT_ONCE
 };
 
-struct nvkm_device *nvkm_device_find(u64 name);
-
 /* privileged register interface accessor macros */
 #define nvkm_rd08(d,a) ioread8((d)->pri + (a))
 #define nvkm_rd16(d,a) ioread16_native((d)->pri + (a))
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
index 3ce42de55aa9..036106ed09a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/base.c
@@ -29,30 +29,6 @@
 #include <subdev/bios.h>
 #include <subdev/therm.h>
 
-static DEFINE_MUTEX(nv_devices_mutex);
-static LIST_HEAD(nv_devices);
-
-static struct nvkm_device *
-nvkm_device_find_locked(u64 handle)
-{
-	struct nvkm_device *device;
-	list_for_each_entry(device, &nv_devices, head) {
-		if (device->handle == handle)
-			return device;
-	}
-	return NULL;
-}
-
-struct nvkm_device *
-nvkm_device_find(u64 handle)
-{
-	struct nvkm_device *device;
-	mutex_lock(&nv_devices_mutex);
-	device = nvkm_device_find_locked(handle);
-	mutex_unlock(&nv_devices_mutex);
-	return device;
-}
-
 static const struct nvkm_device_chip
 nv4_chipset = {
 	.name = "NV04",
@@ -2946,8 +2922,6 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	struct nvkm_device *device = *pdevice;
 	struct nvkm_subdev *subdev, *subtmp;
 	if (device) {
-		mutex_lock(&nv_devices_mutex);
-
 		nvkm_intr_dtor(device);
 
 		list_for_each_entry_safe_reverse(subdev, subtmp, &device->subdev, head)
@@ -2955,11 +2929,9 @@ nvkm_device_del(struct nvkm_device **pdevice)
 
 		if (device->pri)
 			iounmap(device->pri);
-		list_del(&device->head);
 
 		if (device->func->dtor)
 			*pdevice = device->func->dtor(device);
-		mutex_unlock(&nv_devices_mutex);
 
 		kfree(*pdevice);
 		*pdevice = NULL;
@@ -3010,10 +2982,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	int ret = -EEXIST, j;
 	unsigned chipset;
 
-	mutex_lock(&nv_devices_mutex);
-	if (nvkm_device_find_locked(handle))
-		goto done;
-
 	device->func = func;
 	device->quirk = quirk;
 	device->dev = dev;
@@ -3022,7 +2990,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	device->cfgopt = cfg;
 	device->dbgopt = dbg;
 	device->name = name;
-	list_add_tail(&device->head, &nv_devices);
 	device->debug = nvkm_dbgopt(device->dbgopt, "device");
 	INIT_LIST_HEAD(&device->subdev);
 
@@ -3305,6 +3272,5 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		iounmap(device->pri);
 		device->pri = NULL;
 	}
-	mutex_unlock(&nv_devices_mutex);
 	return ret;
 }
-- 
2.41.0

