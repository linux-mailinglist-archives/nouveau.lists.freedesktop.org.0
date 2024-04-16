Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D788A78F3
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CB3112F70;
	Tue, 16 Apr 2024 23:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rye/2LYR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D4112F6F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Omi/qUxpVAf4VWJUj/JL5jhxvW0SrvH/DnXvWtVQzgxLkvFyr7scWeBZM+mstx4We7APSgHH3Va7L0z21Gub6QTcVmoNBn1WCqTX1wW7SsQr/u4wKP1fquMRG0WSGsubYq6iuo76zcFv1WnX1pHdSjuoME8+5t7n9axedQKYbBRY4T/eWjCMXkuApa52gjnx9MV3/tyfGvb6B+Zi+QMZPYmVEeh5xyGTbTywI2l2dTk2Fd/HUcteF8aQ70YIjcwLW0I59+O6wVGPYiIfqvIQ33diHnBzL27uLEfw4moRaEYfjlefXxJXyAAU5HjpPMCpcEGhYV6lc66pW0W3/8AfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp7rZ7/8Amtr2jWjG+4oi/AMa2kV1rceDMms9pLXm/A=;
 b=aNSQ6l0yuxI6TT8YTRHGOlgoyEfd3W0VVlJnuqbVeeCurmJ1/9USmnxlawuEZADzbJsg7Rxh5ndE0esaaA2FZHFQyJJV+7zIzI+J/+jVYPWN7AaI193Kk4F1xBGydAKGbwUkPjU74zJoOFQz4Bbpk1rJP0WWQEC7o7m4gyJPFKYL5dc0HNOA7hOKf7KKLCnNTGsycA/QC1DXmch95UBkm1MRWbiB2h1FYtS6Kq7C2KvyofQTZz03rKAfdvx/+MWpYgqc9huu9aIa9EHKq5XfLy8CfZCHYpR8BHmd05lWWExuLM3ZHsQTt53PewzMN7zenGno7S9oRLIkLyjMxj0whw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp7rZ7/8Amtr2jWjG+4oi/AMa2kV1rceDMms9pLXm/A=;
 b=rye/2LYRKmUs+g9AXFDufNE7MnORs1U9lyCsUwsoFqRYnG7UuJ7p6w+KSwJYmw/tfm+b1zLlbFDR7YfhlS8fxTvIH3XsMCNb3DlFSI1gt7oLToLepXSWsAglXLLZmF4Y3FCpnu3TtveUFDVrvHw4Y7jR+a0kKBU60+BC8Pi67uKYqav3u5K0IMgpOWhZhe1S28TUDf/0VZrhuvna4TWQiuTQPkK78jG0UEf1aYn/4H0GDBKdTkpIIBmrvqDGmHs61CVx2SY/brAgrr+kCjkNQsB90tIkbRSqTCqoFWywtKEj/+qww24y74P9XCya7qU25M7jR1H7YIRYsSE55cjp8g==
Received: from DM6PR12CA0011.namprd12.prod.outlook.com (2603:10b6:5:1c0::24)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:08 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::20) by DM6PR12CA0011.outlook.office365.com
 (2603:10b6:5:1c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:47 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 067/156] drm/nouveau/nvif: rework device "info v0" api
Date: Wed, 17 Apr 2024 09:38:33 +1000
Message-ID: <20240416234002.19509-68-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9038f0-95a9-485c-a643-08dc5e6ed419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sisxq0NzdT8et7QwtxOU8z9/e833KX5PNRH/rsJkf/+y/0sGGmg1bZ+B3Qsmdr41p6yC6NTsLRd2KFD2YMo26mIlkIpUjXRK3j8iyaUqIlN6fHCbBe5Zg8Q3na+fzwHFm+7H0xp7Uo4BKrj+zW0NUTkOrO7pZW3KCwpfoQjsoniEEgkYd5gpkobBeSqoGfyXBBWkPsSW0HuodTEPM4Pz6KYMI+CxXnhz0YX2H+8+5aJfrDurYqL1P2z8X8fTVtln+KMuABMYkf5PJHTvlVlvou0HSuGQl8ayEFSfZxBMgMQUSNjfP1+vY1N40YC9qIXzpXkjQByPfMVco/s/CJ66wqBoCxgIDmFw/LrxdIDS+bPV8ZybHgWEUpWAROuonV/yWSm0ZTHybiBKgtYQnoY7C7aMmpAn89PoF/tn7JidW9lTlNbYvlt2Sjd/qORRHqfep7pf0+J/mbGu6HU7gmYINWKEoksC2Xhfvu7sdEPlAXqVPRI+3I0xEOSkZ1WqVgJn6GN0PTRBIiWHsheEuLdINZt3y6yzjYm6gyChDuXrR0vnPkX/PgwjKz9Kzurk4FF/oHRV1Wg9WallNGSeeWV7MYSW81e7VY/geJde3coexrQMjEJdajHPHtLJVktypT7fPPbs31H6mOlHPfQbJhEZPPHX6IiK9Ob+PLG7YYuLJxDBtBuhJHtniDd2Yv/9PcrbUcnaNTUBgAnIcSJxcdyvbu8BuW/wzJNnqXZPiBFWeEum1wrh2QNAyjK9NLnJQunb
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:07.6225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9038f0-95a9-485c-a643-08dc5e6ed419
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  34 +++++
 drivers/gpu/drm/nouveau/nvif/device.c         |  11 +-
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 135 ++++++++----------
 3 files changed, 106 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 03c4803f6492..6152eabd4352 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -27,6 +27,40 @@ struct nvif_device_impl {
 
 	struct nvif_mapinfo map;
 
+	enum {
+		NVIF_DEVICE_IGP = 0,
+		NVIF_DEVICE_PCI,
+		NVIF_DEVICE_AGP,
+		NVIF_DEVICE_PCIE,
+		NVIF_DEVICE_SOC,
+	} platform;
+
+	u16 chipset; /* from NV_PMC_BOOT_0 */
+	u8 revision; /* from NV_PMC_BOOT_0 */
+
+	enum {
+		NVIF_DEVICE_TNT = 1,
+		NVIF_DEVICE_CELSIUS,
+		NVIF_DEVICE_KELVIN,
+		NVIF_DEVICE_RANKINE,
+		NVIF_DEVICE_CURIE,
+		NVIF_DEVICE_TESLA,
+		NVIF_DEVICE_FERMI,
+		NVIF_DEVICE_KEPLER,
+		NVIF_DEVICE_MAXWELL,
+		NVIF_DEVICE_PASCAL,
+		NVIF_DEVICE_VOLTA,
+		NVIF_DEVICE_TURING,
+		NVIF_DEVICE_AMPERE,
+		NVIF_DEVICE_ADA,
+	} family;
+
+	char chip[16];
+	char name[64];
+
+	u64 ram_size;
+	u64 ram_user;
+
 	struct {
 		s32 oclass;
 	} usermode;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index a0bc047ae28d..7c28f9764936 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -81,9 +81,16 @@ nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_devic
 	device->object.priv = device->priv; /*FIXME: used by nvxx_device() */
 
 	if (ret == 0) {
+		/*FIXME: remove after moving users to device->impl */
 		device->info.version = 0;
-		ret = nvif_object_mthd(&device->object, NV_DEVICE_V0_INFO,
-				       &device->info, sizeof(device->info));
+		device->info.platform = device->impl->platform;
+		device->info.chipset = device->impl->chipset;
+		device->info.revision = device->impl->revision;
+		device->info.family = device->impl->family;
+		device->info.ram_size = device->impl->ram_size;
+		device->info.ram_user = device->impl->ram_user;
+		strscpy(device->info.chip, device->impl->chip, sizeof(device->info.chip));
+		strscpy(device->info.name, device->impl->name, sizeof(device->info.name));
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 229245b03719..589cb31853e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -80,10 +80,7 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 {
 	struct nvkm_object *object = &udev->object;
 	struct nvkm_device *device = udev->device;
-	struct nvkm_fb *fb = device->fb;
-	struct nvkm_instmem *imem = device->imem;
 	union {
-		struct nv_device_info_v0 v0;
 		struct nv_device_info_v1 v1;
 	} *args = data;
 	int ret = -ENOSYS, i;
@@ -98,78 +95,9 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 			return 0;
 		}
 		return -EINVAL;
-	} else
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "device info vers %d\n", args->v0.version);
 	} else
 		return ret;
 
-	switch (device->chipset) {
-	case 0x01a:
-	case 0x01f:
-	case 0x04c:
-	case 0x04e:
-	case 0x063:
-	case 0x067:
-	case 0x068:
-	case 0x0aa:
-	case 0x0ac:
-	case 0x0af:
-		args->v0.platform = NV_DEVICE_INFO_V0_IGP;
-		break;
-	default:
-		switch (device->type) {
-		case NVKM_DEVICE_PCI:
-			args->v0.platform = NV_DEVICE_INFO_V0_PCI;
-			break;
-		case NVKM_DEVICE_AGP:
-			args->v0.platform = NV_DEVICE_INFO_V0_AGP;
-			break;
-		case NVKM_DEVICE_PCIE:
-			args->v0.platform = NV_DEVICE_INFO_V0_PCIE;
-			break;
-		case NVKM_DEVICE_TEGRA:
-			args->v0.platform = NV_DEVICE_INFO_V0_SOC;
-			break;
-		default:
-			WARN_ON(1);
-			break;
-		}
-		break;
-	}
-
-	switch (device->card_type) {
-	case NV_04: args->v0.family = NV_DEVICE_INFO_V0_TNT; break;
-	case NV_10:
-	case NV_11: args->v0.family = NV_DEVICE_INFO_V0_CELSIUS; break;
-	case NV_20: args->v0.family = NV_DEVICE_INFO_V0_KELVIN; break;
-	case NV_30: args->v0.family = NV_DEVICE_INFO_V0_RANKINE; break;
-	case NV_40: args->v0.family = NV_DEVICE_INFO_V0_CURIE; break;
-	case NV_50: args->v0.family = NV_DEVICE_INFO_V0_TESLA; break;
-	case NV_C0: args->v0.family = NV_DEVICE_INFO_V0_FERMI; break;
-	case NV_E0: args->v0.family = NV_DEVICE_INFO_V0_KEPLER; break;
-	case GM100: args->v0.family = NV_DEVICE_INFO_V0_MAXWELL; break;
-	case GP100: args->v0.family = NV_DEVICE_INFO_V0_PASCAL; break;
-	case GV100: args->v0.family = NV_DEVICE_INFO_V0_VOLTA; break;
-	case TU100: args->v0.family = NV_DEVICE_INFO_V0_TURING; break;
-	case GA100: args->v0.family = NV_DEVICE_INFO_V0_AMPERE; break;
-	case AD100: args->v0.family = NV_DEVICE_INFO_V0_ADA; break;
-	default:
-		args->v0.family = 0;
-		break;
-	}
-
-	args->v0.chipset  = device->chipset;
-	args->v0.revision = device->chiprev;
-	if (fb && fb->ram)
-		args->v0.ram_size = args->v0.ram_user = fb->ram->size;
-	else
-		args->v0.ram_size = args->v0.ram_user = 0;
-	if (imem && args->v0.ram_size > 0)
-		args->v0.ram_user = args->v0.ram_user - imem->reserved;
-
-	snprintf(args->v0.chip, sizeof(args->v0.chip), "%s", device->chip->name);
-	snprintf(args->v0.name, sizeof(args->v0.name), "%s", device->name);
 	return 0;
 }
 
@@ -347,6 +275,69 @@ nvkm_udevice_new(struct nvkm_device *device,
 	udev->impl.map.handle = device->func->resource_addr(device, 0);
 	udev->impl.map.length = device->func->resource_size(device, 0);
 
+	switch (device->chipset) {
+	case 0x01a:
+	case 0x01f:
+	case 0x04c:
+	case 0x04e:
+	case 0x063:
+	case 0x067:
+	case 0x068:
+	case 0x0aa:
+	case 0x0ac:
+	case 0x0af:
+		udev->impl.platform = NVIF_DEVICE_IGP;
+		break;
+	default:
+		switch (device->type) {
+		case NVKM_DEVICE_PCI  : udev->impl.platform = NVIF_DEVICE_PCI; break;
+		case NVKM_DEVICE_AGP  : udev->impl.platform = NVIF_DEVICE_AGP; break;
+		case NVKM_DEVICE_PCIE : udev->impl.platform = NVIF_DEVICE_PCIE; break;
+		case NVKM_DEVICE_TEGRA: udev->impl.platform = NVIF_DEVICE_SOC; break;
+		default:
+			WARN_ON(1);
+			ret = -EINVAL;
+			goto done;
+		}
+		break;
+	}
+
+	udev->impl.chipset  = device->chipset;
+	udev->impl.revision = device->chiprev;
+
+	switch (device->card_type) {
+	case NV_04: udev->impl.family = NVIF_DEVICE_TNT; break;
+	case NV_10:
+	case NV_11: udev->impl.family = NVIF_DEVICE_CELSIUS; break;
+	case NV_20: udev->impl.family = NVIF_DEVICE_KELVIN; break;
+	case NV_30: udev->impl.family = NVIF_DEVICE_RANKINE; break;
+	case NV_40: udev->impl.family = NVIF_DEVICE_CURIE; break;
+	case NV_50: udev->impl.family = NVIF_DEVICE_TESLA; break;
+	case NV_C0: udev->impl.family = NVIF_DEVICE_FERMI; break;
+	case NV_E0: udev->impl.family = NVIF_DEVICE_KEPLER; break;
+	case GM100: udev->impl.family = NVIF_DEVICE_MAXWELL; break;
+	case GP100: udev->impl.family = NVIF_DEVICE_PASCAL; break;
+	case GV100: udev->impl.family = NVIF_DEVICE_VOLTA; break;
+	case TU100: udev->impl.family = NVIF_DEVICE_TURING; break;
+	case GA100: udev->impl.family = NVIF_DEVICE_AMPERE; break;
+	case AD100: udev->impl.family = NVIF_DEVICE_ADA; break;
+	default:
+		WARN_ON(1);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	snprintf(udev->impl.chip, sizeof(udev->impl.chip), "%s", device->chip->name);
+	snprintf(udev->impl.name, sizeof(udev->impl.name), "%s", device->name);
+
+	if (device->fb && device->fb->ram)
+		udev->impl.ram_size = udev->impl.ram_user = device->fb->ram->size;
+	else
+		udev->impl.ram_size = udev->impl.ram_user = 0;
+
+	if (device->imem && udev->impl.ram_size > 0)
+		udev->impl.ram_user = udev->impl.ram_user - device->imem->reserved;
+
 	if (device->vfn) {
 		udev->impl.usermode.oclass = device->vfn->user.base.oclass;
 	}
-- 
2.41.0

