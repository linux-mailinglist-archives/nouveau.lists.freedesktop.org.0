Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965C8A794B
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944C7112FFE;
	Tue, 16 Apr 2024 23:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O35qewdV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59579112FFA
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZVoi/fmk8V+x61nlO9gotLdDb+cTJUQ4EO1q782fCK34VUuLZjclYJHqzJPgPdaPujKeFj6wj7wJVwFvJgmX/y/STxvmFslzumcpOI0/J0+wBKkb4TEU2pLy9AJI42JTZCKRnmSoz0EX3JRfTDULWm0cy6FrbFmaTk2hW58+PXdPqr8s4x5IVZfN/xt/7A3wtGDbZvgo5yZo1IbKpxdmYzAD7+6yGkK0dtQm6CVb+P10vZyIlY6FxbXxpcySHJONXTzLj3w97EyKO/YvpsdPVFuHAwruDhHA1XxkKQytcAIJIxhJFX3T1t8sbfmTZ0rEkd+iAwSXVjdSaNWonvfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6wfdIQt8ZfCqE76Ws1Cyjsrviq5/D5/7MkiMaNwWTE=;
 b=lhmcU7Gmjfe3xVaUtW4YJx2k9530PkOEoPzCMi2o9/vOC3jlBD0kbQXJFsh149Ql65gSAdaD5moXUXzz3Kn8ObORWMfbhkU21MdrZgulwIigXh7BjAdayWiExRYvr5hVaCxuuj3usdIGLF1I+RR7Ih/tU1APhiNK9tdJlYwYwb32jJs3V4hy4YaLSFTvFmX5a/I9U+UAcEC/y7girxAv0InXbvwTRAWjE8ELH5lqA8YRh3gC/jpZwjswQaHenkl0FpoGu98Hpjm+iyqp7msTWmCfnD9N2UWZtlFOeHZDHgV0MQZXwFJNLp1xFijbp0tv9mKs8flFnzeMPyBL4l9BeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6wfdIQt8ZfCqE76Ws1Cyjsrviq5/D5/7MkiMaNwWTE=;
 b=O35qewdV0HfH/dvl4KEb5Jc6wFII2O6TAmZWxEPkQWRokFFWl+QSD/y0PLQ+AOzEhcBoastO155tTOfUkJ3NiFgd+tNGQbIbir/csYqdHK4X+F4CZM/MmzZVHrqoXfwrXd9iuHpxzaDdHvJgw9nV3lG46wfh2eEXjLIw0UAsUSSmrCO1EVqE4CPyMDyfJX0HRaCruntVwio9e6HcPmPCNrpXL+zXwGvdlvY4OpxcpDsBuwI8jQournRwPK9K2aaC4wdc32KWD/Sedqrj3k7LmD8QP11TU4ouWE3Cr4+yMUL3c6ddZhGiu9aZl+ub4g6yhyLgMaJnKA3WyErSiVZDZQ==
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 23:43:53 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::be) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:24 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 152/156] drm/nouveau: move nvxx_* definitions to nouveau_drv.h
Date: Wed, 17 Apr 2024 09:39:58 +1000
Message-ID: <20240416234002.19509-153-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b0907e-0c4f-4c8c-baf8-08dc5e6f1351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMifgvDEb0ojTSWKhE3RAdXC+kJjqB5xuSU8zqtbgffN8dfvqc5nluHbYwUj51ngSFxqv1ZQFMqhleXRJOPGKiOj5GMZgA0E66lFhIwejFsbR3kygqqXIN5vIyUkJ1kXNoF+RVpxBygKSTQ5uGqdAgu4Donj5qb8zLvd45dMpeZ/vD9Wyu+AKROibSzwQkKsKXdkU8WIzHm3BZR1weaD1lY+q74HRsJ+h6eB5bG1GhTA/Wz3tOQpElVTCuub6HPvQfChODo5NvnRU2Jyb0fHpYL1Ekd32kBi97o9m9wV27jnoKSG6kR1RRvkh/ehqT5JkDUBjjVZI6mcUn01Um7+goi6mSswM31Dl40slcHqKrJcI3Ked8neeNimkaU41FOiS5BTU9cE8aBq3/fzCQV/M2fDkSw8ucPMVTQyV/4T1YZdK6smYvy+WW+FEHlGeAwcmHBwQR2izKa5rCxBHapZNPxlGzg0hJC4nq6oQz1WFYLrtsddwg34nBVPWUVSC/ZZZ/NrheXabLw2FZ/188yBTrHmD/Q7xyjDaWQx2QP0FXIBOwReWt4nkYOHAMn6ABOgCr+3qIoSZ1ekvo2nWVnX04Tl7dqzksvG0Q2sarW/MesrtJPw7MF/xLFRvImR1loQagl0YTd1WwjswkruXKpO61Bw2il7KC7FmiAEEYokBAJ3fO8JGiQ9Qa/Hu02l1+eijAcapXMHlq6ZdjabrCsXP4BxpR6BD45BMTFuJfb/7C47XYRNzqXI5WEvy+c1XEHD
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:53.6710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b0907e-0c4f-4c8c-baf8-08dc5e6f1351
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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

- move out of nvif

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/device.h | 33 -------------------
 drivers/gpu/drm/nouveau/nouveau_bios.h        |  1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h         | 32 ++++++++++++++++++
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index 5fb71e6da7cd..0ec8d80133c7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -25,37 +25,4 @@ u64  nvif_device_time(struct nvif_device *);
 
 int nvif_device_ctxdma_ctor(struct nvif_device *, const char *name, s32 oclass,
 			    void *argv, u32 argc, struct nvif_ctxdma *);
-
-/*XXX*/
-#include <subdev/bios.h>
-#include <subdev/fb.h>
-#include <subdev/bar.h>
-#include <subdev/gpio.h>
-#include <subdev/clk.h>
-#include <subdev/i2c.h>
-#include <subdev/timer.h>
-#include <subdev/therm.h>
-#include <subdev/pci.h>
-
-#define nvxx_device(a) ({                                                      \
-	struct nvif_device *_device = (a);                                     \
-	struct {                                                               \
-		struct nvkm_object object;                                     \
-		struct nvkm_device *device;                                    \
-	} *_udevice = _device->object.priv;                                    \
-	_udevice->device;                                                      \
-})
-#define nvxx_bios(a) nvxx_device(a)->bios
-#define nvxx_fb(a) nvxx_device(a)->fb
-#define nvxx_gpio(a) nvxx_device(a)->gpio
-#define nvxx_clk(a) nvxx_device(a)->clk
-#define nvxx_i2c(a) nvxx_device(a)->i2c
-#define nvxx_iccsense(a) nvxx_device(a)->iccsense
-#define nvxx_therm(a) nvxx_device(a)->therm
-#define nvxx_volt(a) nvxx_device(a)->volt
-
-#include <engine/fifo.h>
-#include <engine/gr.h>
-
-#define nvxx_gr(a) nvxx_device(a)->gr
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 18eb061ccafb..62b5f5889041 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -48,6 +48,7 @@ struct bit_entry {
 
 int bit_table(struct drm_device *, u8 id, struct bit_entry *);
 
+#include <subdev/bios.h>
 #include <subdev/bios/dcb.h>
 #include <subdev/bios/conn.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 046f219328bc..b4069d2b31f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -362,4 +362,36 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 
 extern int nouveau_modeset;
 
+/*XXX*/
+#include <subdev/bios.h>
+#include <subdev/fb.h>
+#include <subdev/bar.h>
+#include <subdev/gpio.h>
+#include <subdev/clk.h>
+#include <subdev/i2c.h>
+#include <subdev/timer.h>
+#include <subdev/therm.h>
+#include <subdev/pci.h>
+
+#define nvxx_device(a) ({                        \
+	struct nvif_device *_device = (a);       \
+	struct {                                 \
+		struct nvkm_object object;       \
+		struct nvkm_device *device;      \
+	} *_udevice = _device->object.priv;      \
+	_udevice->device;                        \
+})
+#define nvxx_bios(a) nvxx_device(a)->bios
+#define nvxx_fb(a) nvxx_device(a)->fb
+#define nvxx_gpio(a) nvxx_device(a)->gpio
+#define nvxx_clk(a) nvxx_device(a)->clk
+#define nvxx_i2c(a) nvxx_device(a)->i2c
+#define nvxx_iccsense(a) nvxx_device(a)->iccsense
+#define nvxx_therm(a) nvxx_device(a)->therm
+#define nvxx_volt(a) nvxx_device(a)->volt
+
+#include <engine/fifo.h>
+#include <engine/gr.h>
+
+#define nvxx_gr(a) nvxx_device(a)->gr
 #endif
-- 
2.41.0

