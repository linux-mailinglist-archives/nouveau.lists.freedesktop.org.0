Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86C88A794F
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D080112FC7;
	Tue, 16 Apr 2024 23:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IPPg1TW4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E505A112FC7
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPmeLHN/y9eVlH8CB5hmNctw9B2H2E1ODH3YTC1ICpJruG/3Fo3QE9Gpl1I9meELUWpvAqG7IBwHhqmqLcvs2F2Y269BDbibXFHHRB96Jk0b8dPw5gbUDtgQaF5NCDiL+9mRyrDTkaX+Oirwz0ptluJosg6TwP2218YIeWU7i92tbNEApFxIjmE6p2YYo4GBo6kARheEztzEXG5+Rr3HuP2TUoXriGiu85i+02N8vQLmiXpj1gdUp9A5KUxw7S5Mtqa6O6KgggxfztugKBMf3MVHjDprmjDN4cJ0E16z+i/8XZ/lUlZimnzkTwsuCcXRIAWcKo3jKSmKQaieCB/2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwklVsHrh1KUYMrjb2WvkeTywiGv1li70paC10wBSbs=;
 b=bwJVG5r0mec0LnI9n9cYG6GAcZM3wfd2LDaB3mcSUaUSnHd2FyjDUcJl5xmT+gltWXr4rhzyI7HottC21O5TFGwf/3+rDdKyQMhR1f/w+zGSuD41/vkx5bh01sE0RGJHdcCEpWmjFAbRpBBSgeV2s7WB8TOpu3YhJTPyXIAHj6IJ7pVCNIV4NVK/9PooxFUePgvQiGoE8s6fDcvQ+JchnOH45w7yn+D83KHWzns/lCrOX9J20I9qXxNOAinC7H8SBW6te+M6FVrJZKobWeO6aNBXBH6GMKNqUeQfx1kcWwwLgfxZdnuBQ8thPWfGjMEgUE9tif8ENkmRdvi8Pg5kEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwklVsHrh1KUYMrjb2WvkeTywiGv1li70paC10wBSbs=;
 b=IPPg1TW4WV5MazOUfAJxs8wdUNRbXlsecu7HMZYQ2n+f32NLkcXApDRfzdOvIeFed4NWHP2XO3McJ7l5PyjgDHDZv9c1DFitGwpu4SegGkQAkMSaZURTrmtmzIfYZHIA9ckIrz+KJyEGtJlN5Tt7Z9cMxUO22cuh2lKfVkhT5VcsULPovQLmEzHNkX2Pb2cvoUaLK30gderGTmmgKAQwwPWexSGq1sDM4McnnNhFPJpHyYOP7oMFfeDwbkK8KSJpWNDl0AemX3pYzdGvL/hT1EEyUu7ejiQmatJ/rHmfCyzFkW+QDWmspXuxEcqOrP5C7aQ2nduq7VHmw4fxCA/OHg==
Received: from CH0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:610:b2::18)
 by DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:44:01 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::7) by CH0PR13CA0043.outlook.office365.com
 (2603:10b6:610:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.19 via Frontend
 Transport; Tue, 16 Apr 2024 23:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:44:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:28 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 155/156] drm/nouveau: remove remaining usage of
 nvif_device.object.map
Date: Wed, 17 Apr 2024 09:40:01 +1000
Message-ID: <20240416234002.19509-156-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: aa295d60-3ee6-4559-bb06-08dc5e6f17ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26IqW5CVJ050WG/z0L+ceXph5Z1bboEo9OorTMx+dTSSQyHQERBeT6+HkzUZvX3RJtNU4MRGfr3XNdtSPkNicfHSZ5qJdZ4OABVWN3yqX+AR5ScD6DH2BqTDNrqRVX1B1Lbb/9UGrhnxpOJiF6eJED8+RoX8gMYtKUPoNPkFmadf6tlereMVBUX3DsN3GaGuZaepRdA5bhlP9A+pfvslw94WiIccbw6IXUKnp5z/jbD6eN1tEiUTDoW5Exh1/YtLsoEQVSG7bugGoq1taeXiD6MSW53nlczCZrqca08hnhPjf2t47XscgW+feTqVKjGi1zZGYGe5piN6zNYRI/x8mT5+1JuCSxAJFCKX92pbEhQ+Q/Sh2C4OjGGCm346VqFbyuW2UzX0URWh9Y1Ry+vejuPqhoU7NNn5IEOCw8vMS3zst3tGlG7DHqI5g3DCtTTw9uDIkMZ+syL76BNNdvfLSgYVE3liF5VLbiY7Oc+nvJzZXdJZ66FJ4e8dbK57PesP784JKReD9+3o0T0PnyQD0EpDiwUCkN6CqnG+ekkXCNnMzK330DRZJxRJGcwIcuRDiSd3lmHfRaAr+Ubh17H0gklSgxTva7UGGyni9l6G4jJBjTACMV6+rO2WLDFYcpuTFR1O/8Jqtrm9QdD1JvL9DNW936u4UYRPhGcL8mtbxrjouW1XBgxT7FwWGtekaF3M4KdQ/KvpUnWV5MQS/vYGKBBLzRgHpMg7Ps59xuzZchXy2J1D03/NDV4Typ8jcsqn
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:44:00.9913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa295d60-3ee6-4559-bb06-08dc5e6f17ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
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

- accesses to PRI are now via nvif_device.map

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/dac.c        | 10 +++++-----
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c         |  8 ++++----
 drivers/gpu/drm/nouveau/dispnv04/hw.h         | 20 +++++++++----------
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  8 ++++----
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.h     | 10 ++++++----
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/object.h | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  8 +++-----
 drivers/gpu/drm/nouveau/nouveau_bios.c        |  6 +++---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  8 ++------
 drivers/gpu/drm/nouveau/nouveau_led.c         |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         |  4 ++--
 drivers/gpu/drm/nouveau/nvif/dispchan.c       |  4 ++--
 drivers/gpu/drm/nouveau/nvif/object.c         |  4 ----
 17 files changed, 51 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index 4d8e34274c4e..c68e94de7b37 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -66,7 +66,7 @@ int nv04_dac_output_offset(struct drm_encoder *encoder)
 static int sample_load_twice(struct drm_device *dev, bool sense[2])
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	int i;
 
 	for (i = 0; i < 2; i++) {
@@ -80,19 +80,19 @@ static int sample_load_twice(struct drm_device *dev, bool sense[2])
 		 * use a 10ms timeout (guards against crtc being inactive, in
 		 * which case blank state would never change)
 		 */
-		if (nvif_msec(&drm->client.device, 10,
+		if (nvif_msec(device, 10,
 			if (!(nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 1))
 				break;
 		) < 0)
 			return -EBUSY;
 
-		if (nvif_msec(&drm->client.device, 10,
+		if (nvif_msec(device, 10,
 			if ( (nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 1))
 				break;
 		) < 0)
 			return -EBUSY;
 
-		if (nvif_msec(&drm->client.device, 10,
+		if (nvif_msec(device, 10,
 			if (!(nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 1))
 				break;
 		) < 0)
@@ -133,7 +133,7 @@ static enum drm_connector_status nv04_dac_detect(struct drm_encoder *encoder,
 						 struct drm_connector *connector)
 {
 	struct drm_device *dev = encoder->dev;
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	uint8_t saved_seq1, saved_pi, saved_rpc1, saved_cr_mode;
 	uint8_t saved_palette0[3], saved_palette_mask;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index da2a759dbaab..0eff4235cdf1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -487,7 +487,7 @@ static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
 {
 #ifdef __powerpc__
 	struct drm_device *dev = encoder->dev;
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	/* BIOS scripts usually take care of the backlight, thanks
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index ab240df4d85c..316d4b5265d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -746,11 +746,11 @@ nv_load_state_ext(struct drm_device *dev, int head,
 		if (device->impl->family < NVIF_DEVICE_KELVIN) {
 			/* Not waiting for vertical retrace before modifying
 			   CRE_53/CRE_54 causes lockups. */
-			nvif_msec(&drm->client.device, 650,
+			nvif_msec(device, 650,
 				if ( (nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 8))
 					break;
 			);
-			nvif_msec(&drm->client.device, 650,
+			nvif_msec(device, 650,
 				if (!(nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 8))
 					break;
 			);
@@ -776,7 +776,7 @@ static void
 nv_save_state_palette(struct drm_device *dev, int head,
 		      struct nv04_mode_state *state)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	int head_offset = head * NV_PRMDIO_SIZE, i;
 
 	nvif_wr08(device, NV_PRMDIO_PIXEL_MASK + head_offset,
@@ -795,7 +795,7 @@ void
 nouveau_hw_load_state_palette(struct drm_device *dev, int head,
 			      struct nv04_mode_state *state)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	int head_offset = head * NV_PRMDIO_SIZE, i;
 
 	nvif_wr08(device, NV_PRMDIO_PIXEL_MASK + head_offset,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.h b/drivers/gpu/drm/nouveau/dispnv04/hw.h
index b565cd34ed67..4a051b676a58 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.h
@@ -59,7 +59,7 @@ extern void nouveau_calc_arb(struct drm_device *, int vclk, int bpp,
 static inline uint32_t NVReadCRTC(struct drm_device *dev,
 					int head, uint32_t reg)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	uint32_t val;
 	if (head)
 		reg += NV_PCRTC0_SIZE;
@@ -70,7 +70,7 @@ static inline uint32_t NVReadCRTC(struct drm_device *dev,
 static inline void NVWriteCRTC(struct drm_device *dev,
 					int head, uint32_t reg, uint32_t val)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	if (head)
 		reg += NV_PCRTC0_SIZE;
 	nvif_wr32(device, reg, val);
@@ -79,7 +79,7 @@ static inline void NVWriteCRTC(struct drm_device *dev,
 static inline uint32_t NVReadRAMDAC(struct drm_device *dev,
 					int head, uint32_t reg)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	uint32_t val;
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
@@ -90,7 +90,7 @@ static inline uint32_t NVReadRAMDAC(struct drm_device *dev,
 static inline void NVWriteRAMDAC(struct drm_device *dev,
 					int head, uint32_t reg, uint32_t val)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
 	nvif_wr32(device, reg, val);
@@ -119,7 +119,7 @@ static inline void nv_write_tmds(struct drm_device *dev,
 static inline void NVWriteVgaCrtc(struct drm_device *dev,
 					int head, uint8_t index, uint8_t value)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	nvif_wr08(device, NV_PRMCIO_CRX__COLOR + head * NV_PRMCIO_SIZE, index);
 	nvif_wr08(device, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE, value);
 }
@@ -127,7 +127,7 @@ static inline void NVWriteVgaCrtc(struct drm_device *dev,
 static inline uint8_t NVReadVgaCrtc(struct drm_device *dev,
 					int head, uint8_t index)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	uint8_t val;
 	nvif_wr08(device, NV_PRMCIO_CRX__COLOR + head * NV_PRMCIO_SIZE, index);
 	val = nvif_rd08(device, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE);
@@ -191,14 +191,14 @@ static inline void NVWritePRMVIO(struct drm_device *dev,
 
 static inline void NVSetEnablePalette(struct drm_device *dev, int head, bool enable)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	nvif_rd08(device, NV_PRMCIO_INP0__COLOR + head * NV_PRMCIO_SIZE);
 	nvif_wr08(device, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE, enable ? 0 : 0x20);
 }
 
 static inline bool NVGetEnablePalette(struct drm_device *dev, int head)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	nvif_rd08(device, NV_PRMCIO_INP0__COLOR + head * NV_PRMCIO_SIZE);
 	return !(nvif_rd08(device, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE) & 0x20);
 }
@@ -206,7 +206,7 @@ static inline bool NVGetEnablePalette(struct drm_device *dev, int head)
 static inline void NVWriteVgaAttr(struct drm_device *dev,
 					int head, uint8_t index, uint8_t value)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	if (NVGetEnablePalette(dev, head))
 		index &= ~0x20;
 	else
@@ -220,7 +220,7 @@ static inline void NVWriteVgaAttr(struct drm_device *dev,
 static inline uint8_t NVReadVgaAttr(struct drm_device *dev,
 					int head, uint8_t index)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	uint8_t val;
 	if (NVGetEnablePalette(dev, head))
 		index &= ~0x20;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 103b6dddfac4..c367f292cfef 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -192,7 +192,7 @@ static int
 nv10_disable_plane(struct drm_plane *plane,
 		   struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_device *dev = &nouveau_drm(plane->dev)->device;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 
@@ -216,7 +216,7 @@ nv_destroy_plane(struct drm_plane *plane)
 static void
 nv10_set_params(struct nouveau_plane *plane)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->base.dev)->client.device.object;
+	struct nvif_device *dev = &nouveau_drm(plane->base.dev)->device;
 	u32 luma = (plane->brightness - 512) << 16 | plane->contrast;
 	u32 chroma = ((sin_mul(plane->hue, plane->saturation) & 0xffff) << 16) |
 		(cos_mul(plane->hue, plane->saturation) & 0xffff);
@@ -368,7 +368,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		  uint32_t src_w, uint32_t src_h,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_device *dev = &nouveau_drm(plane->dev)->device;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 	struct nouveau_bo *cur = nv_plane->cur;
@@ -443,7 +443,7 @@ static int
 nv04_disable_plane(struct drm_plane *plane,
 		   struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_device *dev = &nouveau_drm(plane->dev)->device;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.h b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.h
index 29773b325bd9..38599435169c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.h
@@ -130,14 +130,16 @@ void nv17_ctv_update_rescaler(struct drm_encoder *encoder);
 static inline void nv_write_ptv(struct drm_device *dev, uint32_t reg,
 				uint32_t val)
 {
-	struct nvif_device *device = &nouveau_drm(dev)->client.device;
-	nvif_wr32(&device->object, reg, val);
+	struct nvif_device *device = &nouveau_drm(dev)->device;
+
+	nvif_wr32(device, reg, val);
 }
 
 static inline uint32_t nv_read_ptv(struct drm_device *dev, uint32_t reg)
 {
-	struct nvif_device *device = &nouveau_drm(dev)->client.device;
-	return nvif_rd32(&device->object, reg);
+	struct nvif_device *device = &nouveau_drm(dev)->device;
+
+	return nvif_rd32(device, reg);
 }
 
 static inline void nv_write_tv_enc(struct drm_device *dev, uint8_t reg,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 97905ec648d0..6d1395b8c597 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -223,7 +223,7 @@ static void nv50_crc_wait_ctx_finished(struct nv50_head *head,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	s64 ret;
 
-	ret = nvif_msec(&drm->client.device, 50,
+	ret = nvif_msec(&drm->device, 50,
 			if (func->ctx_finished(head, ctx)) break;);
 	if (ret == -ETIMEDOUT)
 		NV_ERROR(drm,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 58bfaf036bbb..bf46bca8a149 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -33,7 +33,7 @@
 bool
 curs507a_space(struct nv50_wndw *wndw)
 {
-	nvif_msec(&nouveau_drm(wndw->plane.dev)->client.device, 100,
+	nvif_msec(&nouveau_drm(wndw->plane.dev)->device, 100,
 		if (NVIF_TV32(&wndw->wimm, NV507A, FREE, COUNT, >=, 4))
 			return true;
 	);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 7a90eab48eec..4a60156f0229 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -9,10 +9,6 @@ struct nvif_object {
 	const char *name;
 	u32 handle;
 	s32 oclass;
-	struct {
-		void __iomem *ptr;
-		u64 size;
-	} map;
 };
 
 struct nvif_map {
@@ -37,11 +33,13 @@ int nvif_object_unmap_cpu(struct nvif_map *);
 #define nvif_object(a) (a)->object
 
 #define nvif_rd(a,f,b,c) ({                                                    \
-	u32 _data = f((u8 __iomem *)(a)->map.ptr + (c));                       \
+	struct nvif_map *_map = &(a)->map;                                     \
+	u32 _data = f((u8 __iomem *)_map->ptr + (c));                          \
 	_data;                                                                 \
 })
 #define nvif_wr(a,f,b,c,d) ({                                                  \
-	f((d), (u8 __iomem *)(a)->map.ptr + (c));                              \
+	struct nvif_map *_map = &(a)->map;                                     \
+	f((d), (u8 __iomem *)_map->ptr + (c));                                 \
 })
 #define nvif_rd08(a,b) ({ ((u8)nvif_rd((a), ioread8, 1, (b))); })
 #define nvif_rd16(a,b) ({ ((u16)nvif_rd((a), ioread16_native, 2, (b))); })
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 925856f3b21b..3d63c90247a0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -65,8 +65,7 @@ nv40_get_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
-	int val = (nvif_rd32(device, NV40_PMC_BACKLIGHT) &
+	int val = (nvif_rd32(&drm->device, NV40_PMC_BACKLIGHT) &
 		   NV40_PMC_BACKLIGHT_MASK) >> 16;
 
 	return val;
@@ -77,7 +76,7 @@ nv40_set_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	int val = bd->props.brightness;
 	int reg = nvif_rd32(device, NV40_PMC_BACKLIGHT);
 
@@ -99,9 +98,8 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 		    const struct backlight_ops **ops)
 {
 	struct nouveau_drm *drm = nouveau_drm(encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
 
-	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
+	if (!(nvif_rd32(&drm->device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
 		return -ENODEV;
 
 	props->max_brightness = 31;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index c9c68416d558..6623aab96e25 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -218,7 +218,7 @@ int call_lvds_script(struct drm_device *dev, struct dcb_output *dcbent, int head
 	 */
 
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	struct nvbios *bios = &drm->vbios;
 	uint8_t lvds_ver = bios->data[bios->fp.lvdsmanufacturerpointer];
 	uint32_t sel_clk_binding, sel_clk;
@@ -638,7 +638,7 @@ int run_tmds_table(struct drm_device *dev, struct dcb_output *dcbent, int head,
 	 */
 
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	struct nvbios *bios = &drm->vbios;
 	int cv = bios->chip_version;
 	uint16_t clktable = 0, scriptptr;
@@ -1925,7 +1925,7 @@ static int load_nv17_hwsq_ucode_entry(struct drm_device *dev, struct nvbios *bio
 	 */
 
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	uint8_t bytes_to_write;
 	uint16_t hwsq_entry_offset;
 	int i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 0c744a72aff2..213a01914746 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -58,7 +58,7 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	}
 
 	seq_printf(m, "0x%08x\n",
-		   nvif_rd32(&drm->client.device.object, 0x101000));
+		   nvif_rd32(&drm->device, 0x101000));
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
 	pm_runtime_put_autosuspend(drm->dev->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6c4469f31c53..26a89ab6d462 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -183,7 +183,6 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
-	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
 	nvif_client_dtor(&cli->base);
 }
@@ -214,8 +213,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
-	cli->device.object.map.ptr = drm->device.object.map.ptr;
-
 	ret = nvif_mmu_ctor(&cli->device, "drmMmu", &cli->mmu);
 	if (ret) {
 		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
@@ -578,7 +575,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	 * better fix is found - assuming there is one...
 	 */
 	if (drm->device.impl->chipset == 0xc1)
-		nvif_mask(&drm->client.device.object, 0x00088080, 0x00000800, 0x00000000);
+		nvif_mask(&drm->device, 0x00088080, 0x00000800, 0x00000000);
 
 	nouveau_vga_init(drm);
 
@@ -1037,7 +1034,6 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvif_device *device = &nouveau_drm(drm_dev)->client.device;
 	int ret;
 
 	if (!nouveau_pmops_runtime()) {
@@ -1059,7 +1055,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	}
 
 	/* do magic */
-	nvif_mask(&device->object, 0x088488, (1 << 25), (1 << 25));
+	nvif_mask(&drm->device, 0x088488, (1 << 25), (1 << 25));
 	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
 
 	/* Monitors may have been connected / disconnected during suspend */
diff --git a/drivers/gpu/drm/nouveau/nouveau_led.c b/drivers/gpu/drm/nouveau/nouveau_led.c
index ac950518a820..0a6a247a42e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_led.c
+++ b/drivers/gpu/drm/nouveau/nouveau_led.c
@@ -38,7 +38,7 @@ nouveau_led_get_brightness(struct led_classdev *led)
 {
 	struct drm_device *drm_dev = container_of(led, struct nouveau_led, led)->dev;
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	u32 div, duty;
 
 	div =  nvif_rd32(device, 0x61c880) & 0x00ffffff;
@@ -55,7 +55,7 @@ nouveau_led_set_brightness(struct led_classdev *led, enum led_brightness value)
 {
 	struct drm_device *drm_dev = container_of(led, struct nouveau_led, led)->dev;
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 
 	u32 input_clk = 27e6; /* PDISPLAY.SOR[1].PWM is connected to the crystal */
 	u32 freq = 100; /* this is what nvidia uses and it should be good-enough */
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 55895e746003..5b94f6e3a39d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -711,7 +711,7 @@ nouveau_svm_fault(struct work_struct *work)
 {
 	struct nouveau_svm_fault_buffer *buffer = container_of(work, typeof(*buffer), work);
 	struct nouveau_svm *svm = container_of(buffer, typeof(*svm), buffer[buffer->id]);
-	struct nvif_object *device = &svm->drm->client.device.object;
+	struct nvif_device *device = &svm->drm->device;
 	struct nouveau_svmm *svmm;
 	struct {
 		struct nouveau_pfnmap_args i;
@@ -935,7 +935,7 @@ static int
 nouveau_svm_fault_buffer_init(struct nouveau_svm *svm, int id)
 {
 	struct nouveau_svm_fault_buffer *buffer = &svm->buffer[id];
-	struct nvif_object *device = &svm->drm->client.device.object;
+	struct nvif_device *device = &svm->drm->device;
 
 	buffer->get = nvif_rd32(device, buffer->getaddr);
 	buffer->put = nvif_rd32(device, buffer->putaddr);
diff --git a/drivers/gpu/drm/nouveau/nvif/dispchan.c b/drivers/gpu/drm/nouveau/nvif/dispchan.c
index 03738de5d791..9b84dab6b625 100644
--- a/drivers/gpu/drm/nouveau/nvif/dispchan.c
+++ b/drivers/gpu/drm/nouveau/nvif/dispchan.c
@@ -58,9 +58,9 @@ nvif_dispchan_kick(struct nvif_push *push)
 		if (chan->push.mem.type & NVIF_MEM_VRAM) {
 			struct nvif_device *device = chan->disp->device;
 
-			nvif_wr32(&device->object, 0x070000, 0x00000001);
+			nvif_wr32(device, 0x070000, 0x00000001);
 			nvif_msec(device, 2000,
-				if (!(nvif_rd32(&device->object, 0x070000) & 0x00000002))
+				if (!(nvif_rd32(device, 0x070000) & 0x00000002))
 					break;
 			);
 		}
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 8d4d7a93b92f..ce2f8c30f98a 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -67,8 +67,6 @@ nvif_object_map_cpu(struct nvif_object *object,
 	map->object = object;
 	map->impl = impl;
 	map->ptr = ptr;
-
-	object->map.ptr = map->ptr; /*FIXME: needed by nvif_rd/wr */
 	return 0;
 }
 
@@ -90,6 +88,4 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle, s32 o
 	object->name = name ?: "nvifObject";
 	object->handle = handle;
 	object->oclass = oclass;
-	object->map.ptr = NULL;
-	object->map.size = 0;
 }
-- 
2.41.0

