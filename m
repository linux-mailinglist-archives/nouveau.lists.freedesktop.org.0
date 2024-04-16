Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0D8A78D2
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96464112F4E;
	Tue, 16 Apr 2024 23:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SYKn5NRh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650A5112F4E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcuIrK8FS86aabB7pUfmkkWsETc0XT12ru9z75R7qSFmzLdGaEFWZXl0Zad240J+2Ipj+f2brjzwRgK8jwsQNh7iRFYSRCoc+uRwE87xDfSnNmquws0Dl5o0QlNGYohfvEOEIt4ZRAv1sC1xPot4E2Qq0N4Dqup6q52tVD7CWBegHPxCPVInrGin3IgzewH54A6L8GIyMccT5ddDXMafEzlXoz1RugeGHFAAIXNKXaqDMxILRJx2+6hqsnSi3ye3m+oqq0GX0vnScrIphJAg8fLiu9rZb+xnWgyGDiwZSh+fiMbIbYZSu6k0TdAd9vOwmL2yju1LDFnhE3aLxRwSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAtOC3qncWSfUtmOn5GTP7OetEDTSsnbouHq/ko4WhI=;
 b=F5TvQgMsowi2V93PqE4EM9rXRKM0OSop3jVikMiwL+uCBLLH/aCFYB40u0b+mKsk6E8ay5YUVus53W3VE1oAA1EgHM0GjrKvOqsjdBlh64RAbYH4T5fThIsXMuon8MjYGSDETH9/4B471kKZAyj3VPDZkeVXiMs/zdfTybAucg4JKhUDIzhV/ZUpPONM60hc+y9yALuXU/zpYXJdKoI+vue0X0Hd7HTstIraGqG/3P4dSOWNWRrcEvUbiJLz4nzBqVUgIFZxWnscpOYZq5d2QDW60ip415btEoPOvPuV5YNPEm9WFZzqNvxdmcsiOm+01hHG1P97gZLk0AnaQHuP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAtOC3qncWSfUtmOn5GTP7OetEDTSsnbouHq/ko4WhI=;
 b=SYKn5NRhq+61EGig1UB/g4A/nmqUW6HbzkIvM5U3Xc9WnMl/2h5lU/7GULr/gQ942A2S1wZbBe/FL6GIe2kCsdT90OfUwDS69LiwCPb7A/Be9El8RxUmP1WZU2UHf315swNRDiKRM5zuEz2hE3svMLEERR7R+7NStWPuZWYJjn14QOqaeiHBANX2XCY+nyDDk3L938h1GjihuVulMkiOv5BiYPRD1gR5BsRXTuR8wNe9Xbati7YM4GINyWZhpPlC2st2naC9+B0pYUpIwnsQyiSNQdvXUePPmatVHEnn+O0tE+x0qnva66qCL/v41xzHFZvpogbu0/0arN1KyEfrzA==
Received: from DS7PR03CA0107.namprd03.prod.outlook.com (2603:10b6:5:3b7::22)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:35 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::c8) by DS7PR03CA0107.outlook.office365.com
 (2603:10b6:5:3b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:35 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:18 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 041/156] drm/nouveau/nvkm: rename struct nvkm_control
Date: Wed, 17 Apr 2024 09:38:07 +1000
Message-ID: <20240416234002.19509-42-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 173c5162-c124-4ff6-2e2c-08dc5e6ec0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /g0t7nT2Yf3hzE+T1kdHrIKTqVpVeaF9kt+rqiZdXUsOQPGwpWLMj0Q/8XUYJck7oifeUdMKHY6Np2XHHf8MTgKHreHvPkmWJHA/ACyge65tLzzCNOmzYJ37EOP2M3yZcdIbNuGwgVabT9BCYmHujW2JYYA37dOCeQq5HpWhTprfPRZ2sYpHW6qeLdQo0rxsHy45RS3I8hIn6SIh/D2tquRalIA0RVQMVW2uLayPe0p3F4WHtuMxbtd6rwTnvDyLu+L7NOfZZVgxuLt+UVJkdnm6Wqn9w8tGYdhEUle6jCV7L0GkukGXZEb8fxb5gu1VCcnXM0rxgQabrBb51TcnobI6pYqSCh5dm2thizI8NEa99TSeq23086+ZFDIX7ei/vM0amcnpuRgMinybZvK/HsZQQP6negfclg/4On84io3IHtRg+qDyMhuew1k/Ol/aAIxOOtOb0m6E9nkWYbzo+9aoPJf7GCKBckm/y9K7fpB4FXW172sOK0/lx1dQ/4WNC+fhbMVIc6iWzcRTxoVYdEbo7iVWQHjN/9hsyzkHU4a+Pgaby5ZojWNDgKnPhBqImVi4gsjJVmcOt1+sitMlIuJKyr+3ilzARDYfl9XfZ2BIeubd1T5USCPDK/xIBgCeCBigNdxOkfO9+1942KnpuuK2TJQOpgrYyT6Sqt215evLlM6sYdcUtHjX9qhnLav/fpOM6uvBfzmlnmGms5lN1BMiPR4qHYllvJJ6jLlLuKUGAhFLE/w4GNj7m00MZlK9
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:35.1741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c5162-c124-4ff6-2e2c-08dc5e6ec0c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227
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
- open-code current nvkm_control() macro
- alias remaining use of nvkm_control to nvif_control_priv, removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c | 11 +++++++++--
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
index ce774579c89d..a74fb78ca7ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
@@ -31,6 +31,13 @@
 #include <nvif/ioctl.h>
 #include <nvif/unpack.h>
 
+#define nvkm_control nvif_control_priv
+
+struct nvif_control_priv {
+	struct nvkm_object object;
+	struct nvkm_device *device;
+};
+
 static int
 nvkm_control_mthd_pstate_info(struct nvkm_control *ctrl, void *data, u32 size)
 {
@@ -169,7 +176,7 @@ nvkm_control_mthd_pstate_user(struct nvkm_control *ctrl, void *data, u32 size)
 static int
 nvkm_control_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
-	struct nvkm_control *ctrl = nvkm_control(object);
+	struct nvif_control_priv *ctrl = container_of(object, typeof(*ctrl), object);
 	switch (mthd) {
 	case NVIF_CONTROL_PSTATE_INFO:
 		return nvkm_control_mthd_pstate_info(ctrl, data, size);
@@ -192,7 +199,7 @@ static int
 nvkm_control_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 		 void *data, u32 size, struct nvkm_object **pobject)
 {
-	struct nvkm_control *ctrl;
+	struct nvif_control_priv *ctrl;
 
 	if (!(ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL)))
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
index 9f6d7f23af8d..d241329a1e7a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
@@ -1,13 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVKM_DEVICE_CTRL_H__
 #define __NVKM_DEVICE_CTRL_H__
-#define nvkm_control(p) container_of((p), struct nvkm_control, object)
-#include <core/object.h>
-
-struct nvkm_control {
-	struct nvkm_object object;
-	struct nvkm_device *device;
-};
 
 extern const struct nvkm_device_oclass nvkm_control_oclass;
 #endif
-- 
2.41.0

