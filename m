Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95B18A78CE
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C330112F44;
	Tue, 16 Apr 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7M1uYR4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE56112F41
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bs2givZEOhpxUXKfjq63eqCnNTEdtyEqB8dycGLE24shDWsfeOo+Mbyb8eeWw2bTwFESehXkMceaUe+n5FVysVCEEwl24vG59/O4p21pHcvF1nB8DOZewGNdQgFMP8B9043ygHdpOEslP+7bfvcqoXlvakH/VUKvaKV/ezlOtPBLegpbNfAcB0G+eauBbBNEdUk4rcGSft26olpGqdu5IYsQswNhLmGx0Ik522/ahfAl4qa5O47Ho6YAIbLq6KpAdYucgVpBQuys0EBQbju7serIymfEF5sRAyzJNWN7Zjm4Tg3+x05wGl6ZLl95+nC0DGgx3V1oTOzRgQ73DOEx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBDjwzC6tmfeHybnPAR9sW4IYNAbWlOd9igrfY6eYkc=;
 b=TVkbUgtZ4P9d+H3Z5NLG8H3nXB89cOMKSAeHIQdAlkMDVBIHJurzKFQQXkbvqccFpqFBl0nUBBNSoOK6Zt84EHaQbG48CDy8zNrQ2FTtfIv85qrmy+e7bSun0l8KI9juq3RTTGjKbokXbXTjR1EadzPIm77AeHeg4HInqyJGmp46zLrkrfI9VP8MQydUhPo8m1IgQegxubFmAUnU15GLADsU60vTj7dEjycMTN0mTTPfg9M3Ee7n8DHWz0eX2qWQZr1/qr+YidcfQBXDsuIoa4nNCFvwnCPsJ73lL9iowe/sVHqBtoyIUxO5zzW52jQX/SPnw15XJ+aJoULdyCpoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBDjwzC6tmfeHybnPAR9sW4IYNAbWlOd9igrfY6eYkc=;
 b=Y7M1uYR4NCIWt9Jvkh/E6hIIZrozBaAtvglbMFvuX41K3mA/AwsZYchqTJ48ssWxvrI4dOU6ShiTQuBYcC6W/YmoutNFiqiyk+EXdwGVTRbxoBQDkMusjKp3TWb7teENSN9X8UHKg0DnW7CCV5nYVQjQraS7Tg9ZdSHajhRFQflqSYt0RgFudADp06a3Wt+AKWao+bwL7i0FCcnz9Mprwr2S0JKfdtYWbiJsH2Eb/rqB2hsjSCBhRjtu47cT8ezNI5t59XS1K/rdxYXmWUYJE1BofDzSgHPN2Bq54/5mOgf/s+0N3+3Xf9uV+X4NCOlT36JvMeNqiwUEIt26bzG3pA==
Received: from DM6PR02CA0058.namprd02.prod.outlook.com (2603:10b6:5:177::35)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:28 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::8c) by DM6PR02CA0058.outlook.office365.com
 (2603:10b6:5:177::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:16 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 040/156] drm/nouveau/nvkm: rename struct nvkm_udevice
Date: Wed, 17 Apr 2024 09:38:06 +1000
Message-ID: <20240416234002.19509-41-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f30f6e-1711-4ab5-7366-08dc5e6ebc74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSi9Z22hwphw12Tf23Ng+QEoOARVTwEYUFmRP64jFbZOfEuR6hatuQpE+ogYuULsNwk5faKylpXXYjMnnWWrLbHX1IrW6az3leyFBSdSepwh9FIVXF3Xb10hqD8xC8jAOUHbvD61pgJPBLASc24o+OIKboAgwhmFkR7IsfYJI8iXrnup/sK7hG5D7DyEJSGobQWAxFelO1yp/0jaOB0lxE33s8oeK4t+Saw0/cNqyDYbHcZeVqSj/PwAMEieRlQQ1HIpi30vZ3m3TWvy3bsW7GRKHc+tQTQT/tcpNRuV0//XG/Gtl+uwxAVvIC/AaO0H2A3wdf1NLPiwqr8qE0JRKdjG/aN64xqLw1F3RVqCdzVdPPsCDykOKxJgaZmCBWQgAtXzCDscUxuit5vnyCHj/1IWOvdMHK23Wr6CYQItPdWW1Pz+o/3+wkccJr9mn4xxpIO5RgFHidBhxJWyi2ItlgOgbEnOeVHZgibAyb26VjFzx+M7hJWALdJ63smIaOXlB/Dq058Fyw9iLucPTY/+RYY6DG4yQlEoJYxJLeSSWlLxeb44h7ARc0a8a8DJFCaard3puy3gxLdl6knp7DjZkGD3U498KQ4bRwycsXS5FU6HLKfWGLsVx9OiP33+7W+m8/FUdZn+xZFo4dR0jJyFplVOxopHwEgQ1yzSwmBulHt+d2QPbhrzI/ov+QZfaCUdSA0EUju8EcH+eVVro7A7NNMBq/wMLk9x6GBuBM78w/e/3zRnbq5pkDts3pXNZv98
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:27.9210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f30f6e-1711-4ab5-7366-08dc5e6ebc74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
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

- preparation for upcoming patches
- open-code current nvkm_udevice() macro
- alias remaining use of nvkm_udevice to nvif_device_priv, removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/device/user.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index d7f75b3a43c8..af5aa9e1e5ea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -21,7 +21,6 @@
  *
  * Authors: Ben Skeggs
  */
-#define nvkm_udevice(p) container_of((p), struct nvkm_udevice, object)
 #include "priv.h"
 #include "ctrl.h"
 
@@ -34,7 +33,9 @@
 #include <nvif/cl0080.h>
 #include <nvif/unpack.h>
 
-struct nvkm_udevice {
+#define nvkm_udevice nvif_device_priv
+
+struct nvif_device_priv {
 	struct nvkm_object object;
 	struct nvkm_device *device;
 };
@@ -189,7 +190,7 @@ nvkm_udevice_time(struct nvkm_udevice *udev, void *data, u32 size)
 static int
 nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(object);
+	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	nvif_ioctl(object, "device mthd %08x\n", mthd);
 	switch (mthd) {
 	case NV_DEVICE_V0_INFO:
@@ -206,7 +207,7 @@ static int
 nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 		 enum nvkm_object_map *type, u64 *addr, u64 *size)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(object);
+	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	struct nvkm_device *device = udev->device;
 	*type = NVKM_OBJECT_MAP_IO;
 	*addr = device->func->resource_addr(device, 0);
@@ -217,7 +218,7 @@ nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 static int
 nvkm_udevice_fini(struct nvkm_object *object, bool suspend)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(object);
+	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	struct nvkm_device *device = udev->device;
 	int ret = 0;
 
@@ -238,7 +239,7 @@ nvkm_udevice_fini(struct nvkm_object *object, bool suspend)
 static int
 nvkm_udevice_init(struct nvkm_object *object)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(object);
+	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	struct nvkm_device *device = udev->device;
 	int ret = 0;
 
@@ -260,7 +261,7 @@ static int
 nvkm_udevice_child_new(const struct nvkm_oclass *oclass,
 		       void *data, u32 size, struct nvkm_object **pobject)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(oclass->parent);
+	struct nvif_device_priv *udev = container_of(oclass->parent, typeof(*udev), object);
 	const struct nvkm_device_oclass *sclass = oclass->priv;
 	return sclass->ctor(udev->device, oclass, data, size, pobject);
 }
@@ -269,7 +270,7 @@ static int
 nvkm_udevice_child_get(struct nvkm_object *object, int index,
 		       struct nvkm_oclass *oclass)
 {
-	struct nvkm_udevice *udev = nvkm_udevice(object);
+	struct nvif_device_priv *udev = container_of(object, typeof(*udev), object);
 	struct nvkm_device *device = udev->device;
 	struct nvkm_engine *engine;
 	u64 mask = (1ULL << NVKM_ENGINE_DMAOBJ) |
@@ -322,7 +323,7 @@ nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		 struct nvkm_object **pobject)
 {
 	struct nvkm_client *client = oclass->client;
-	struct nvkm_udevice *udev;
+	struct nvif_device_priv *udev;
 
 	if (!(udev = kzalloc(sizeof(*udev), GFP_KERNEL)))
 		return -ENOMEM;
-- 
2.41.0

