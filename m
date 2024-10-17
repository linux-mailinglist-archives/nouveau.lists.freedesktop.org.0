Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F69A20DA
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 13:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8696C10E316;
	Thu, 17 Oct 2024 11:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="osQgCT3z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A7010E316
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 11:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byYEqDMMofiD212VHTG5hidIbc13aD3xlGgYA9r3lBNvtSCEysw9Nf/eBCEa6BM89TMojctBkSlyCNQvIoEbkB+Tf8dpi0TOdBuWLxc9+Mn5hfxEwTlq/H8bOfQ34uok8UooZ0EZa1bn5W5Ppyk+TlkoLwXlZOWlCirghOk8aFMOIr9r6rR5EHhV621G7exK+Ypg1m5Q4ANJbMV8lpo2zwmRwbvF1rqaEaMxJrAAkuKZULub9J8T/33XM4yUA2m14e8Zdb+qc+q7BbgyJF7Y2YXcEPYCCSAZUfNsWyiWomei9mTcniZC8hXQ9iIRj/8xkOp0aFClDL3KW+ycKt4EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUMZol1IaOkATSCjpgwE5IMPAR3HdJLRsu42limWc/c=;
 b=PEjLNYheukk+UQH8+kmws1HspEwuA2yVXdbNL22CaDPacsAN6tsKEDZciy99vC0iRYe0SPKesJ9rtXEqKS8/ZvvVswtZKmRcYhwEp+7oZ1V6SlPikw+xcfuJf87lpIfCoksmZCRgAXSSUrr3fpoMTxanNn5QoTNzE7W8vPq5k5bvfSBwMrGyYh2rPG0ZUbCnwZv0WZS5zh6AMn2kN041Tp8doXnm1pTdlbTsQijRP5r30vJP2qGKydFThZQTHeh4lb8UNvwb2A+FR1+94ZJzoCY7WYCovFvdyOtbQ1WM42qU1Qd/LickBcB18Mn9IpN8oYKQAUclgUXsBUIR8a4j+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUMZol1IaOkATSCjpgwE5IMPAR3HdJLRsu42limWc/c=;
 b=osQgCT3zf6kFQL2g8+ALnGeGnjnvrtl1Qn/JbBM/X0jTXAWLqr5T6LIoTgktM473798DV0DqNaQHcp4Tv0R2cWZ6AlsNC/2OSSV+NlhUYjyz3CbkkojJBopZBvUWfx58g9o9tCMnDOXo2Y/oZ0ZMyIo/dqoSWHTxrzK9wcjk2uotHKI7E/nalWZjBSNtC+Pev496qJrLVl+rU9buf6oOi3CdHVVGtFqPTer22WGENweD41FeOcnpi0ciZb0KrG6R35QlrO+dhhdSMvGmORwQ/A39Whrmv+rkUxynHSm2OM5HV3hu44lT5nctpnSRed6j7ONlQyZejO+cKXcGNtFj7Q==
Received: from MW4PR03CA0202.namprd03.prod.outlook.com (2603:10b6:303:b8::27)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 11:25:16 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:b8:cafe::55) by MW4PR03CA0202.outlook.office365.com
 (2603:10b6:303:b8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 11:25:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 11:25:16 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 04:25:04 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 17 Oct 2024 04:25:03 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 17 Oct 2024 04:25:03 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <greg@kroah.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [PATCH] drm/nouveau/nvkm: refine the device SKU enum
Date: Thu, 17 Oct 2024 04:24:54 -0700
Message-ID: <20241017112454.2524588-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f4a566-3489-488a-9b03-08dcee9e5ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mM9nKyDAAq033gy2jBccnKQClWLiQ6QUe4TCqYmbvXDBIIO05h++RJx3dxHV?=
 =?us-ascii?Q?pFaF1xPjDySS7U8E8Fu/L3srjJpsMgTSZyF5UXjOz4vk4sTUhF8NuYw9IeX4?=
 =?us-ascii?Q?m1S3elbMVlanT5DoXz/NT/U22ZZOtAE93iZmqippVijnYi5/qAqCwsjpQMrW?=
 =?us-ascii?Q?q5KdDY96GYeNDEgmr4NX1x1aneC8sWp89Q8+1wfhk17NAcr2Oa19MxFgIFy+?=
 =?us-ascii?Q?GXwWj7Ib9+w22AJ16t3KXuVg+KE805ngElAzgiZjoQbZKQdpPCbwoLz6gYxm?=
 =?us-ascii?Q?TRxmggif1Mj+dR0XwnxaCxl8vQVWxfP9q6BYDlg8ZszsqWOGB1pLBCuA8l1e?=
 =?us-ascii?Q?mB9XQZ9UICOyIcXXtYo4uZfNVpQmdtsQllKEf1Lmy3ewMpuOTzPq6fFrU46h?=
 =?us-ascii?Q?dqgVUzuzdRvKlXHY0HNG34D3adOg6qAZoFbh4H5a24HP7T4FeaElHqQxjh/s?=
 =?us-ascii?Q?6UKabEZm/a+eVasOaJ2f0TLa3+H5sMlXc8PZhLfVRkLIkFDgPsI0qpqOFsEM?=
 =?us-ascii?Q?SEgW6jGrT3eN62mESpYM1YkdGPpPHBQt42o/TPyIV2tTPsOQbmA2wF0sSA5/?=
 =?us-ascii?Q?p+5Nelc4ODksxERAL6hoRnIWQqkf3L0DopEgcKwJUt8LXW7JcKv1KFgSPOVA?=
 =?us-ascii?Q?9nYgEThXjHOZTA9R1paXNoZeAku17zrrOWWQ2QWEj5LI7XV4vxiFYzmIqHqR?=
 =?us-ascii?Q?EvMb3XKi78pmYGbWM3rhYbxRs9c4Et4Ohb8nUOKINUKvLsI8FBk7JBY6EqXX?=
 =?us-ascii?Q?mcEMYA48PyursK3zh5k/PsVUexl0NgNs1i6Oet95gdRVVQXZiTZDlcdHhBm2?=
 =?us-ascii?Q?YpG0kJQx+aNboy73Sy5qopbEHDC4+yNH5/BENB3hNu7Ol4P223rn91jpvZWe?=
 =?us-ascii?Q?iZNsCUzDBAM/93SCl0pr2Kgo1kPQ/WILcTJYJdtmeo1YoG2xCRH83VVTzzF3?=
 =?us-ascii?Q?hDotzan/dfAgZLu9ajRrJ4HFJ5MTnY/+LAVkR9MJxdz2EsQzAOoMSgB4SgRx?=
 =?us-ascii?Q?DYzRt0cZ7ExoQMW7daAiJrr7FDEXaD1p/l0PVPa5bbfruIxq7sdjEGABjqNx?=
 =?us-ascii?Q?LiqHlECE++Edi4fd7sKkwud+br3z/b3JiH1ie7ViRCYhdefR++RBi6S4CK06?=
 =?us-ascii?Q?ToIljJAQuhTSXvRr+U/VGvwoNpC/2USs8/H7cWFtUbQ843c2wFJSAC51WzQ2?=
 =?us-ascii?Q?COv/FChnbT3xUjGdWu9dNagT603T60LT4olAfD3NBMpykJ/sYAJHbhoH5RAv?=
 =?us-ascii?Q?0aLdU4d6Alx0Oymei4gB6sUdO/zQld/3InYa6GDrit+NNWM0sER9Yfb/+vHV?=
 =?us-ascii?Q?TMrj0ff+r+TKr5TCoRyKP5RRJeHcecslPvqDs/muJUDuYv0yyJcirAJvE3fE?=
 =?us-ascii?Q?2bCa07/7unqMAcTWO7fZ40kWdNIfHR8eAL8YkBxEiO7Y+Gp7Mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 11:25:16.1620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f4a566-3489-488a-9b03-08dcee9e5ffc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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

NVKM uses a enum called "card_type" to represent the device SKU in the
code. Within the enum, each device SKU is represent like NV_10, AD100, etc.

Many concerns were raised due to over-short SKU enums can conflicts with
other local enums and a prefix is also required as an identifier of
namespace of a driver.

Rename enum "card_type" to "sku". Add the prefix NVKM_DEVICE_ before each
device SKU inside the enum and some other coding format tweaks to make
checkpatch.pl happy.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/device.h    | 32 +++++-----
 drivers/gpu/drm/nouveau/nvkm/core/ramht.c     |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 58 ++++++++++++------
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 60 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/vga.c    | 14 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |  6 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |  4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c |  8 +--
 .../gpu/drm/nouveau/nvkm/subdev/bios/dcb.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  8 +--
 .../gpu/drm/nouveau/nvkm/subdev/bios/pll.c    | 16 ++---
 .../nouveau/nvkm/subdev/bios/shadowramin.c    | 13 ++--
 .../drm/nouveau/nvkm/subdev/bios/shadowrom.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/therm.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/devinit/nv10.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  8 +--
 19 files changed, 147 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 46afb877a296..1cfb83122a11 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -32,22 +32,22 @@ struct nvkm_device {
 
 	const struct nvkm_device_chip *chip;
 	enum {
-		NV_04    = 0x04,
-		NV_10    = 0x10,
-		NV_11    = 0x11,
-		NV_20    = 0x20,
-		NV_30    = 0x30,
-		NV_40    = 0x40,
-		NV_50    = 0x50,
-		NV_C0    = 0xc0,
-		NV_E0    = 0xe0,
-		GM100    = 0x110,
-		GP100    = 0x130,
-		GV100    = 0x140,
-		TU100    = 0x160,
-		GA100    = 0x170,
-		AD100    = 0x190,
-	} card_type;
+		NVKM_DEVICE_NV_04    = 0x04,
+		NVKM_DEVICE_NV_10    = 0x10,
+		NVKM_DEVICE_NV_11    = 0x11,
+		NVKM_DEVICE_NV_20    = 0x20,
+		NVKM_DEVICE_NV_30    = 0x30,
+		NVKM_DEVICE_NV_40    = 0x40,
+		NVKM_DEVICE_NV_50    = 0x50,
+		NVKM_DEVICE_NV_C0    = 0xc0,
+		NVKM_DEVICE_NV_E0    = 0xe0,
+		NVKM_DEVICE_GM100    = 0x110,
+		NVKM_DEVICE_GP100    = 0x130,
+		NVKM_DEVICE_GV100    = 0x140,
+		NVKM_DEVICE_TU100    = 0x160,
+		NVKM_DEVICE_GA100    = 0x170,
+		NVKM_DEVICE_AD100    = 0x190,
+	} sku;
 	u32 chipset;
 	u8  chiprev;
 	u32 crystal;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ramht.c b/drivers/gpu/drm/nouveau/nvkm/core/ramht.c
index 8162e3d2359c..b26ed5db7bdb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ramht.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ramht.c
@@ -79,7 +79,7 @@ nvkm_ramht_update(struct nvkm_ramht *ramht, int co, struct nvkm_object *object,
 		}
 
 		if (data->inst) {
-			if (ramht->device->card_type >= NV_50)
+			if (ramht->device->sku >= NVKM_DEVICE_NV_50)
 				inst = data->inst->node->offset;
 			else
 				inst = data->inst->addr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 9093d89b16f3..c97448e0c48e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3114,32 +3114,56 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		switch (device->chipset & 0x1f0) {
 		case 0x010: {
 			if (0x461 & (1 << (device->chipset & 0xf)))
-				device->card_type = NV_10;
+				device->sku = NVKM_DEVICE_NV_10;
 			else
-				device->card_type = NV_11;
+				device->sku = NVKM_DEVICE_NV_11;
 			device->chiprev = 0x00;
 			break;
 		}
-		case 0x020: device->card_type = NV_20; break;
-		case 0x030: device->card_type = NV_30; break;
+		case 0x020:
+			device->sku = NVKM_DEVICE_NV_20;
+			break;
+		case 0x030:
+			device->sku = NVKM_DEVICE_NV_30;
+			break;
 		case 0x040:
-		case 0x060: device->card_type = NV_40; break;
+		case 0x060:
+			device->sku = NVKM_DEVICE_NV_40;
+			break;
 		case 0x050:
 		case 0x080:
 		case 0x090:
-		case 0x0a0: device->card_type = NV_50; break;
+		case 0x0a0:
+			device->sku = NVKM_DEVICE_NV_50;
+			break;
 		case 0x0c0:
-		case 0x0d0: device->card_type = NV_C0; break;
+		case 0x0d0:
+			device->sku = NVKM_DEVICE_NV_C0;
+			break;
 		case 0x0e0:
 		case 0x0f0:
-		case 0x100: device->card_type = NV_E0; break;
+		case 0x100:
+			device->sku = NVKM_DEVICE_NV_E0;
+			break;
 		case 0x110:
-		case 0x120: device->card_type = GM100; break;
-		case 0x130: device->card_type = GP100; break;
-		case 0x140: device->card_type = GV100; break;
-		case 0x160: device->card_type = TU100; break;
-		case 0x170: device->card_type = GA100; break;
-		case 0x190: device->card_type = AD100; break;
+		case 0x120:
+			device->sku = NVKM_DEVICE_GM100;
+			break;
+		case 0x130:
+			device->sku = NVKM_DEVICE_GP100;
+			break;
+		case 0x140:
+			device->sku = NVKM_DEVICE_GV100;
+			break;
+		case 0x160:
+			device->sku = NVKM_DEVICE_TU100;
+			break;
+		case 0x170:
+			device->sku = NVKM_DEVICE_GA100;
+			break;
+		case 0x190:
+			device->sku = NVKM_DEVICE_AD100;
+			break;
 		default:
 			break;
 		}
@@ -3149,7 +3173,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			device->chipset = 0x05;
 		else
 			device->chipset = 0x04;
-		device->card_type = NV_04;
+		device->sku = NVKM_DEVICE_NV_04;
 	}
 
 	switch (device->chipset) {
@@ -3269,7 +3293,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	/* vGPU detection */
 	boot1 = nvkm_rd32(device, 0x0000004);
-	if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
+	if (device->sku >= NVKM_DEVICE_TU100 && (boot1 & 0x00030000)) {
 		nvdev_info(device, "vGPUs are not supported\n");
 		ret = -ENODEV;
 		goto done;
@@ -3279,7 +3303,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	strap = nvkm_rd32(device, 0x101000);
 
 	/* determine frequency of timing crystal */
-	if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
+	if (device->sku <= NVKM_DEVICE_NV_10 || device->chipset < 0x17 ||
 	    (device->chipset >= 0x20 && device->chipset < 0x25))
 		strap &= 0x00000040;
 	else
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index d7f75b3a43c8..862c665b75b9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -132,22 +132,50 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 		break;
 	}
 
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
+	switch (device->sku) {
+	case NVKM_DEVICE_NV_04:
+		args->v0.family = NV_DEVICE_INFO_V0_TNT;
+		break;
+	case NVKM_DEVICE_NV_10:
+	case NVKM_DEVICE_NV_11:
+		args->v0.family = NV_DEVICE_INFO_V0_CELSIUS;
+		break;
+	case NVKM_DEVICE_NV_20:
+		args->v0.family = NV_DEVICE_INFO_V0_KELVIN;
+		break;
+	case NVKM_DEVICE_NV_30:
+		args->v0.family = NV_DEVICE_INFO_V0_RANKINE;
+		break;
+	case NVKM_DEVICE_NV_40:
+		args->v0.family = NV_DEVICE_INFO_V0_CURIE;
+		break;
+	case NVKM_DEVICE_NV_50:
+		args->v0.family = NV_DEVICE_INFO_V0_TESLA;
+		break;
+	case NVKM_DEVICE_NV_C0:
+		args->v0.family = NV_DEVICE_INFO_V0_FERMI;
+		break;
+	case NVKM_DEVICE_NV_E0:
+		args->v0.family = NV_DEVICE_INFO_V0_KEPLER;
+		break;
+	case NVKM_DEVICE_GM100:
+		args->v0.family = NV_DEVICE_INFO_V0_MAXWELL;
+		break;
+	case NVKM_DEVICE_GP100:
+		args->v0.family = NV_DEVICE_INFO_V0_PASCAL;
+		break;
+	case NVKM_DEVICE_GV100:
+		args->v0.family = NV_DEVICE_INFO_V0_VOLTA;
+		break;
+	case NVKM_DEVICE_TU100:
+		args->v0.family = NV_DEVICE_INFO_V0_TURING;
+		break;
+	case NVKM_DEVICE_GA100:
+		args->v0.family = NV_DEVICE_INFO_V0_AMPERE;
+		break;
+	case NVKM_DEVICE_AD100:
+		args->v0.family = NV_DEVICE_INFO_V0_ADA;
+		break;
 	default:
 		args->v0.family = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index a109348bd63b..a391f7af77d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -39,7 +39,7 @@
  * the x86 option ROM.  However, the relevant VBIOS table versions weren't modified,
  * so we're unable to detect this in a nice way.
  */
-#define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
+#define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->sku >= NVKM_DEVICE_GA100)
 
 static int
 nvkm_dp_mst_id_put(struct nvkm_outp *outp, u32 id)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c
index 8bff95c6343f..bf2b3d413f49 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c
@@ -26,7 +26,7 @@
 u8
 nvkm_rdport(struct nvkm_device *device, int head, u16 port)
 {
-	if (device->card_type >= NV_50)
+	if (device->sku >= NVKM_DEVICE_NV_50)
 		return nvkm_rd08(device, 0x601000 + port);
 
 	if (port == 0x03c0 || port == 0x03c1 ||	/* AR */
@@ -37,7 +37,7 @@ nvkm_rdport(struct nvkm_device *device, int head, u16 port)
 	if (port == 0x03c2 || port == 0x03cc ||	/* MISC */
 	    port == 0x03c4 || port == 0x03c5 ||	/* SR */
 	    port == 0x03ce || port == 0x03cf) {	/* GR */
-		if (device->card_type < NV_40)
+		if (device->sku < NVKM_DEVICE_NV_40)
 			head = 0; /* CR44 selects head */
 		return nvkm_rd08(device, 0x0c0000 + (head * 0x2000) + port);
 	}
@@ -48,7 +48,7 @@ nvkm_rdport(struct nvkm_device *device, int head, u16 port)
 void
 nvkm_wrport(struct nvkm_device *device, int head, u16 port, u8 data)
 {
-	if (device->card_type >= NV_50)
+	if (device->sku >= NVKM_DEVICE_NV_50)
 		nvkm_wr08(device, 0x601000 + port, data);
 	else
 	if (port == 0x03c0 || port == 0x03c1 ||	/* AR */
@@ -59,7 +59,7 @@ nvkm_wrport(struct nvkm_device *device, int head, u16 port, u8 data)
 	if (port == 0x03c2 || port == 0x03cc ||	/* MISC */
 	    port == 0x03c4 || port == 0x03c5 ||	/* SR */
 	    port == 0x03ce || port == 0x03cf) {	/* GR */
-		if (device->card_type < NV_40)
+		if (device->sku < NVKM_DEVICE_NV_40)
 			head = 0; /* CR44 selects head */
 		nvkm_wr08(device, 0x0c0000 + (head * 0x2000) + port, data);
 	}
@@ -129,7 +129,7 @@ nvkm_lockvgac(struct nvkm_device *device, bool lock)
 {
 	bool locked = !nvkm_rdvgac(device, 0, 0x1f);
 	u8 data = lock ? 0x99 : 0x57;
-	if (device->card_type < NV_50)
+	if (device->sku < NVKM_DEVICE_NV_50)
 		nvkm_wrvgac(device, 0, 0x1f, data);
 	else
 		nvkm_wrvgac(device, 0, 0x3f, data);
@@ -161,7 +161,7 @@ nvkm_lockvgac(struct nvkm_device *device, bool lock)
 u8
 nvkm_rdvgaowner(struct nvkm_device *device)
 {
-	if (device->card_type < NV_50) {
+	if (device->sku < NVKM_DEVICE_NV_50) {
 		if (device->chipset == 0x11) {
 			u32 tied = nvkm_rd32(device, 0x001084) & 0x10000000;
 			if (tied == 0) {
@@ -187,7 +187,7 @@ nvkm_rdvgaowner(struct nvkm_device *device)
 void
 nvkm_wrvgaowner(struct nvkm_device *device, u8 select)
 {
-	if (device->card_type < NV_50) {
+	if (device->sku < NVKM_DEVICE_NV_50) {
 		u8 owner = (select == 1) ? 3 : select;
 		if (device->chipset == 0x11) {
 			/* workaround hw lockup bug */
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
index fd5ee9f0af36..21970bdcc698 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
@@ -262,7 +262,7 @@ nvkm_falcon_init(struct nvkm_engine *engine)
 	/* upload firmware bootloader (or the full code segments) */
 	if (falcon->core) {
 		u64 addr = nvkm_memory_addr(falcon->core);
-		if (device->card_type < NV_C0)
+		if (device->sku < NVKM_DEVICE_NV_C0)
 			nvkm_wr32(device, base + 0x618, 0x04000000);
 		else
 			nvkm_wr32(device, base + 0x618, 0x00000114);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
index 674faf002b20..36a742a3808a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -317,7 +317,7 @@ nv04_fifo_intr_cache_error(struct nvkm_fifo *fifo, u32 chid, u32 get)
 	 */
 	ptr = (get & 0x7ff) >> 2;
 
-	if (device->card_type < NV_40) {
+	if (device->sku < NVKM_DEVICE_NV_40) {
 		mthd = nvkm_rd32(device, NV04_PFIFO_CACHE1_METHOD(ptr));
 		data = nvkm_rd32(device, NV04_PFIFO_CACHE1_DATA(ptr));
 	} else {
@@ -365,7 +365,7 @@ nv04_fifo_intr_dma_pusher(struct nvkm_fifo *fifo, u32 chid)
 
 	chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
 	name = chan ? chan->name : "unknown";
-	if (device->card_type == NV_50) {
+	if (device->sku == NVKM_DEVICE_NV_50) {
 		u32 ho_get = nvkm_rd32(device, 0x003328);
 		u32 ho_put = nvkm_rd32(device, 0x003320);
 		u32 ib_get = nvkm_rd32(device, 0x003334);
@@ -439,7 +439,7 @@ nv04_fifo_intr(struct nvkm_inth *inth)
 		nvkm_wr32(device, NV04_PFIFO_CACHE1_PULL0, 1);
 	}
 
-	if (device->card_type == NV_50) {
+	if (device->sku == NVKM_DEVICE_NV_50) {
 		if (stat & 0x00000010) {
 			stat &= ~0x00000010;
 			nvkm_wr32(device, 0x002100, 0x00000010);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 060c74a80eb1..67036999ca9f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -414,7 +414,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 	if (ret)
 		return ret;
 
-	if (device->card_type < GP100) {
+	if (device->sku < NVKM_DEVICE_GP100) {
 		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb, NULL, 0);
 		if (ret)
 			return ret;
@@ -1627,7 +1627,7 @@ gf100_gr_intr(struct nvkm_inth *inth)
 		chid = chan->id;
 	}
 
-	if (device->card_type < NV_E0 || subc < 4)
+	if (device->sku < NVKM_DEVICE_NV_E0 || subc < 4)
 		class = nvkm_rd32(device, 0x404200 + (subc * 4));
 	else
 		class = 0x0000;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
index ca822f07b63e..f8a19d2cdd69 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
@@ -1214,7 +1214,7 @@ nv04_gr_idle(struct nvkm_gr *gr)
 	struct nvkm_device *device = subdev->device;
 	u32 mask = 0xffffffff;
 
-	if (device->card_type == NV_40)
+	if (device->sku == NVKM_DEVICE_NV_40)
 		mask &= ~NV40_PGRAPH_STATUS_SYNC_STALL;
 
 	if (nvkm_msec(device, 2000,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
index 92ef7c9b2910..b6b19642ec40 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
@@ -890,7 +890,7 @@ nv10_gr_load_context(struct nv10_gr_chan *chan, int chid)
 	for (i = 0; i < ARRAY_SIZE(nv10_gr_ctx_regs); i++)
 		nvkm_wr32(device, nv10_gr_ctx_regs[i], chan->nv10[i]);
 
-	if (device->card_type >= NV_11 && device->chipset >= 0x17) {
+	if (device->sku >= NVKM_DEVICE_NV_11 && device->chipset >= 0x17) {
 		for (i = 0; i < ARRAY_SIZE(nv17_gr_ctx_regs); i++)
 			nvkm_wr32(device, nv17_gr_ctx_regs[i], chan->nv17[i]);
 	}
@@ -916,7 +916,7 @@ nv10_gr_unload_context(struct nv10_gr_chan *chan)
 	for (i = 0; i < ARRAY_SIZE(nv10_gr_ctx_regs); i++)
 		chan->nv10[i] = nvkm_rd32(device, nv10_gr_ctx_regs[i]);
 
-	if (device->card_type >= NV_11 && device->chipset >= 0x17) {
+	if (device->sku >= NVKM_DEVICE_NV_11 && device->chipset >= 0x17) {
 		for (i = 0; i < ARRAY_SIZE(nv17_gr_ctx_regs); i++)
 			chan->nv17[i] = nvkm_rd32(device, nv17_gr_ctx_regs[i]);
 	}
@@ -1021,7 +1021,7 @@ nv10_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 	NV_WRITE_CTX(0x00400e14, 0x00001000);
 	NV_WRITE_CTX(0x00400e30, 0x00080008);
 	NV_WRITE_CTX(0x00400e34, 0x00080008);
-	if (device->card_type >= NV_11 && device->chipset >= 0x17) {
+	if (device->sku >= NVKM_DEVICE_NV_11 && device->chipset >= 0x17) {
 		/* is it really needed ??? */
 		NV17_WRITE_CTX(NV10_PGRAPH_DEBUG_4,
 			       nvkm_rd32(device, NV10_PGRAPH_DEBUG_4));
@@ -1148,7 +1148,7 @@ nv10_gr_init(struct nvkm_gr *base)
 	nvkm_wr32(device, NV04_PGRAPH_DEBUG_2, 0x25f92ad9);
 	nvkm_wr32(device, NV04_PGRAPH_DEBUG_3, 0x55DE0830 | (1 << 29) | (1 << 31));
 
-	if (device->card_type >= NV_11 && device->chipset >= 0x17) {
+	if (device->sku >= NVKM_DEVICE_NV_11 && device->chipset >= 0x17) {
 		nvkm_wr32(device, NV10_PGRAPH_DEBUG_4, 0x1f000000);
 		nvkm_wr32(device, 0x400a10, 0x03ff3fb6);
 		nvkm_wr32(device, 0x400838, 0x002f8684);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
index 8698f260b988..a8bf4903132f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
@@ -31,7 +31,7 @@ dcb_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 	struct nvkm_device *device = subdev->device;
 	u16 dcb = 0x0000;
 
-	if (device->card_type > NV_04)
+	if (device->sku > NVKM_DEVICE_NV_04)
 		dcb = nvbios_rd16(bios, 0x36);
 	if (!dcb) {
 		nvkm_warn(subdev, "DCB table not found\n");
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index b54f044c4483..022d33e755c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -156,7 +156,7 @@ init_nvreg(struct nvbios_init *init, u32 reg)
 	/* GF8+ display scripts need register addresses mangled a bit to
 	 * select a specific CRTC/OR
 	 */
-	if (init->subdev->device->card_type >= NV_50) {
+	if (init->subdev->device->sku >= NVKM_DEVICE_NV_50) {
 		if (reg & 0x80000000) {
 			reg += init_head(init) * 0x800;
 			reg &= ~0x80000000;
@@ -242,7 +242,7 @@ init_wrvgai(struct nvbios_init *init, u16 port, u8 index, u8 value)
 	struct nvkm_device *device = init->subdev->device;
 
 	/* force head 0 for updates to cr44, it only exists on first head */
-	if (device->card_type < NV_50) {
+	if (device->sku < NVKM_DEVICE_NV_50) {
 		if (port == 0x03d4 && index == 0x44)
 			init->head = 0;
 	}
@@ -253,7 +253,7 @@ init_wrvgai(struct nvbios_init *init, u16 port, u8 index, u8 value)
 	}
 
 	/* select head 1 if cr44 write selected it */
-	if (device->card_type < NV_50) {
+	if (device->sku < NVKM_DEVICE_NV_50) {
 		if (port == 0x03d4 && index == 0x44 && value == 3)
 			init->head = 1;
 	}
@@ -1635,7 +1635,7 @@ init_io(struct nvbios_init *init)
 	 * needed some day..  it's almost certainly wrong, but, it also
 	 * somehow makes things work...
 	 */
-	if (bios->subdev.device->card_type >= NV_50 &&
+	if (bios->subdev.device->sku >= NVKM_DEVICE_NV_50 &&
 	    port == 0x03c3 && data == 0x01) {
 		init_mask(init, 0x614100, 0xf0800000, 0x00800000);
 		init_mask(init, 0x00e18c, 0x00020000, 0x00020000);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
index 2ec84b8a3b3a..8166fa5795b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
@@ -116,16 +116,16 @@ static struct pll_mapping *
 pll_map(struct nvkm_bios *bios)
 {
 	struct nvkm_device *device = bios->subdev.device;
-	switch (device->card_type) {
-	case NV_04:
-	case NV_10:
-	case NV_11:
-	case NV_20:
-	case NV_30:
+	switch (device->sku) {
+	case NVKM_DEVICE_NV_04:
+	case NVKM_DEVICE_NV_10:
+	case NVKM_DEVICE_NV_11:
+	case NVKM_DEVICE_NV_20:
+	case NVKM_DEVICE_NV_30:
 		return nv04_pll_mapping;
-	case NV_40:
+	case NVKM_DEVICE_NV_40:
 		return nv40_pll_mapping;
-	case NV_50:
+	case NVKM_DEVICE_NV_50:
 		if (device->chipset == 0x50)
 			return nv50_pll_mapping;
 		else
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
index 023ddc7c5399..37235a23710e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
@@ -60,18 +60,17 @@ pramin_init(struct nvkm_bios *bios, const char *name)
 	u64 addr = 0;
 
 	/* PRAMIN always potentially available prior to nv50 */
-	if (device->card_type < NV_50)
+	if (device->sku < NVKM_DEVICE_NV_50)
 		return NULL;
 
 	/* we can't get the bios image pointer without PDISP */
-	if (device->card_type >= GA100)
+	if (device->sku >= NVKM_DEVICE_GA100)
 		addr = device->chipset == 0x170; /*XXX: find the fuse reg for this */
-	else
-	if (device->card_type >= GM100)
+	else if (device->sku >= NVKM_DEVICE_GM100)
 		addr = nvkm_rd32(device, 0x021c04);
-	else
-	if (device->card_type >= NV_C0)
+	else if (device->sku >= NVKM_DEVICE_NV_C0)
 		addr = nvkm_rd32(device, 0x022500);
+
 	if (addr & 0x00000001) {
 		nvkm_debug(subdev, "... display disabled\n");
 		return ERR_PTR(-ENODEV);
@@ -81,7 +80,7 @@ pramin_init(struct nvkm_bios *bios, const char *name)
 	 * important as we don't want to be touching vram on an
 	 * uninitialised board
 	 */
-	if (device->card_type >= GV100)
+	if (device->sku >= NVKM_DEVICE_GV100)
 		addr = nvkm_rd32(device, 0x625f04);
 	else
 		addr = nvkm_rd32(device, 0x619f04);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
index 39144ceb117b..8a2a148f9632 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
@@ -48,7 +48,7 @@ static void *
 nvbios_prom_init(struct nvkm_bios *bios, const char *name)
 {
 	struct nvkm_device *device = bios->subdev.device;
-	if (device->card_type == NV_40 && device->chipset >= 0x4c)
+	if (device->sku == NVKM_DEVICE_NV_40 && device->chipset >= 0x4c)
 		return ERR_PTR(-ENODEV);
 	nvkm_pci_rom_shadow(device->pci, false);
 	return device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
index 5babc5a7c7d5..8a91a91b78e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
@@ -203,7 +203,7 @@ nvbios_therm_fan_parse(struct nvkm_bios *bios, struct nvbios_therm_fan *fan)
 	}
 
 	/* starting from fermi, fan management is always linear */
-	if (bios->subdev.device->card_type >= NV_C0 &&
+	if (bios->subdev.device->sku >= NVKM_DEVICE_NV_C0 &&
 		fan->fan_mode == NVBIOS_THERM_FAN_OTHER) {
 		fan->fan_mode = NVBIOS_THERM_FAN_LINEAR;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c
index a6aa8786d610..06044bc42d44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c
@@ -40,7 +40,7 @@ nv10_devinit_meminit(struct nvkm_devinit *init)
 	struct io_mapping *fb;
 	int i, j, k;
 
-	if (device->card_type >= NV_11 && device->chipset >= 0x17)
+	if (device->sku >= NVKM_DEVICE_NV_11 && device->chipset >= 0x17)
 		mem_width_count = 3;
 	else
 		mem_width_count = 2;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
index b13ba9b2f6be..30edd0fa8fe6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
@@ -40,14 +40,14 @@ nvkm_fanpwm_get(struct nvkm_therm *therm)
 	struct nvkm_fanpwm *fan = (void *)therm->fan;
 	struct nvkm_device *device = therm->subdev.device;
 	struct nvkm_gpio *gpio = device->gpio;
-	int card_type = device->card_type;
+	int sku = device->sku;
 	u32 divs, duty;
 	int ret;
 
 	ret = therm->func->pwm_get(therm, fan->func.line, &divs, &duty);
 	if (ret == 0 && divs) {
 		divs = max(divs, duty);
-		if (card_type <= NV_40 || (fan->func.log[0] & 1))
+		if (sku <= NVKM_DEVICE_NV_40 || (fan->func.log[0] & 1))
 			duty = divs - duty;
 		return (duty * 100) / divs;
 	}
@@ -59,7 +59,7 @@ static int
 nvkm_fanpwm_set(struct nvkm_therm *therm, int percent)
 {
 	struct nvkm_fanpwm *fan = (void *)therm->fan;
-	int card_type = therm->subdev.device->card_type;
+	int sku = therm->subdev.device->sku;
 	u32 divs, duty;
 	int ret;
 
@@ -72,7 +72,7 @@ nvkm_fanpwm_set(struct nvkm_therm *therm, int percent)
 	}
 
 	duty = ((divs * percent) + 99) / 100;
-	if (card_type <= NV_40 || (fan->func.log[0] & 1))
+	if (sku <= NVKM_DEVICE_NV_40 || (fan->func.log[0] & 1))
 		duty = divs - duty;
 
 	ret = therm->func->pwm_set(therm, fan->func.line, divs, duty);
-- 
2.43.5

