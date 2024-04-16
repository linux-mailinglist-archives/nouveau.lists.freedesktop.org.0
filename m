Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D08A7941
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3689F112FA2;
	Tue, 16 Apr 2024 23:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fREbdwAx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A132112FE7
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm4ttHo07Q6dnflU34/imvKJaZmcqTX31DXLqNHYYfxlsPA+ipaGXWhYFi60syeTt1S52WIeOh9pkHyLipgq4HfW5BMuw//XpiLDUio49ZIzIyRQdd3kWIh3yyTsKaXeHUSl7EqTgQfanzd49E+EN2pEqnJUUlQ8QuL1JSDvIOT1P3CVCho3nmaFHXCpuV6Q1ckcUjnCmF7+c87maT2sQk0OdRplCf/rjfnZ5bZH1n9zFMhK2gfA+IvKdaSBcQKKYeJ8jWc+CwThMFwYjQDE6GkCdTwnKh33hyic7GfPwXOlKyXLvNNvlk9tGvw97hQe9OCjtZwjxsfJR60n1r2JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+loee604LabPN/qj+P3FBaOmLcdh61TYREH67Q2mKU=;
 b=T7SvUb40hGHHbh6vbgejfj3dJFVuCrSNJsTZP9lp3AGEg+/MsraQ3yqQkBbYumm4HSDZigSQe/xd5BrZJDA7RAhLLStbES7v2+FZHiUro977D14f/zqghfkw9sJLaoQPrx3dFyTVciiZ7+riRTOyp7ky7R//5vhBq7lOCPSHo+DdsiI5f7JnPJZiWhtcFIj4RIGX+ls2sloCn2i86Jusq+S6Fhr5a/IjXjHAPG58dF35pqL8x6mjxgPqvBuSY0dzjFT3KR51QP6Nj2K8mhTFSTBbHZSfdcY0k2SQuixDWohW8PhOv0277hGM4wQ5SMsEjcTCCEQXScBL9vc6hyRXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+loee604LabPN/qj+P3FBaOmLcdh61TYREH67Q2mKU=;
 b=fREbdwAxXSTFcpKWdGfssFVgMJLBmoDx8HHT0yuwmIlUBx5bbbtz9YwhsvKoUIZezStXWrtC4E0Gtepb8JnWn5Iv1JhGm5GaORJQcSh30YmNBtXiXEk/95wU5c19/0rOiAHkNKosgOhDjDnMAHevX6KxUlYxmqBlGAmf+2OAfPD/0hgdVK4fyUcKgKk8qJIOwiUL0Y11MeolIjVhCOFfSEX0EYqLG610WcymQVnW01iEZdSgvckIkEhhKfPiuSxOrSinAh7FeQU0tgbmqoee2Ls9JEPtachwbQdXmt2xtAF1IHo0r/A6lYAssPGr6zFyr+YakjL8JGfWiWUozk2W9g==
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:36 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ac) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:12 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 142/156] drm/nouveau/nvif: rework chan "sclass" api
Date: Wed, 17 Apr 2024 09:39:48 +1000
Message-ID: <20240416234002.19509-143-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: fea42425-94ea-4edd-3466-08dc5e6f091e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cXWB81Xk8oHa4i0XKvGi0OeIq++LWMVKdPJ6VS9KKYYJt1FEuzFz5PrU0eOAaFNp0rgY5bh480CRwmYEWYH2ngIvx+FUiETGhluXirVuqv7cKPbtu6cr6Jtd7g/LcvK+86ZdxsGTERduw3XrMJi0vedIQpWUW03sUwW9Zl2wNvEK7StXZitQGXHHjjeMKzl0VBH0OdmxDqP9/AHfHnIWDERrvdW7g5/ZSREqQ8q9iRPawFOqztmwH3rPJrPCUg0xagHC9IS9D6hlVnzUmdHV+zZdCw+oVYBDHCYlFt6ge1N5SZXZPEZocVfbidVCbDd8lOQuTf8N5uL+I3oAkLNFRQ1wEphyeWwaG4ygeenSwO6kotWnWr4EG3Ew75/avv6xP69kH1L9PITqGPyrwio0KtuifWAhyHDliHLC9xZh+Ku/5jp+EUUuLttHEylQK6oR1qjA8FpB2UD1Xgwf7jvWbzUOj3VRQ1wvtK6XCak632eNL8meJlejgHtSSrJnd8Q7Prqn1+D9hDK5a46J6FiFAD3vHSUfOS0ndN0AyGv5jP/Q1x45BCVP+OSOKZOv8Czbf92l6AtKIf6cempCFAQUMkcs7xfE5C9kyAVJMzD5dmQIP/XJxw6NNNgZgEXPaiqIQbr3jnXXIcIG6XDHrGJtGArDOyYSQgSQSB+VELr8dfvZNSuNDN9NCZZK/eXnU91bXsjNkLmcfHvZ/CGWlAHvV6EGudxPm0X/Y36vHGv5q+LgntVUs809k+g6tHAHOY+
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:36.5247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea42425-94ea-4edd-3466-08dc5e6f091e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/fifo.h   |  2 +
 drivers/gpu/drm/nouveau/include/nvif/object.h |  8 --
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 91 +++++--------------
 drivers/gpu/drm/nouveau/nvif/fifo.c           | 13 +++
 drivers/gpu/drm/nouveau/nvif/object.c         | 51 -----------
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 27 +-----
 6 files changed, 40 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/fifo.h b/drivers/gpu/drm/nouveau/include/nvif/fifo.h
index 4e9663848291..1a47cf96509f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/fifo.h
@@ -16,4 +16,6 @@ nvif_fifo_runlist_ce(struct nvif_device *device)
 		runmce = runmgr;
 	return runmce;
 }
+
+s32 nvif_fifo_engine_oclass(struct nvif_device *, enum nvif_engine_type);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index d52d59d9805d..56308333ef86 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -3,12 +3,6 @@
 #define __NVIF_OBJECT_H__
 #include <nvif/os.h>
 
-struct nvif_sclass {
-	s32 oclass;
-	int minver;
-	int maxver;
-};
-
 struct nvif_object {
 	struct nvif_parent *parent;
 	struct nvif_client *client;
@@ -46,8 +40,6 @@ void nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle
 
 void nvif_object_dtor(struct nvif_object *);
 int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
-int  nvif_object_sclass_get(struct nvif_object *, struct nvif_sclass **);
-void nvif_object_sclass_put(struct nvif_sclass **);
 int  nvif_object_mthd(struct nvif_object *, u32, void *, u32);
 int nvif_object_map_cpu(struct nvif_object *, const struct nvif_mapinfo *, struct nvif_map *);
 int nvif_object_unmap_cpu(struct nvif_map *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index d7db5c0eeaea..36cf7b035973 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -131,25 +131,7 @@ nouveau_abi16_obj_new(struct nouveau_abi16 *abi16, enum nouveau_abi16_obj_type t
 s32
 nouveau_abi16_swclass(struct nouveau_drm *drm)
 {
-	switch (drm->client.device.info.family) {
-	case NV_DEVICE_INFO_V0_TNT:
-		return NVIF_CLASS_SW_NV04;
-	case NV_DEVICE_INFO_V0_CELSIUS:
-	case NV_DEVICE_INFO_V0_KELVIN:
-	case NV_DEVICE_INFO_V0_RANKINE:
-	case NV_DEVICE_INFO_V0_CURIE:
-		return NVIF_CLASS_SW_NV10;
-	case NV_DEVICE_INFO_V0_TESLA:
-		return NVIF_CLASS_SW_NV50;
-	case NV_DEVICE_INFO_V0_FERMI:
-	case NV_DEVICE_INFO_V0_KEPLER:
-	case NV_DEVICE_INFO_V0_MAXWELL:
-	case NV_DEVICE_INFO_V0_PASCAL:
-	case NV_DEVICE_INFO_V0_VOLTA:
-		return NVIF_CLASS_SW_GF100;
-	}
-
-	return 0x0000;
+	return nvif_fifo_engine_oclass(&drm->device, NVIF_ENGINE_SW);
 }
 
 static void
@@ -510,9 +492,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
-	struct nvif_sclass *sclass;
 	s32 oclass = 0;
-	int ret, i;
+	int ret;
 
 	if (unlikely(!abi16))
 		return -ENOMEM;
@@ -524,56 +505,25 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	if (!chan)
 		return nouveau_abi16_put(abi16, -ENOENT);
 
-	ret = nvif_object_sclass_get(&chan->chan->chan.object, &sclass);
-	if (ret < 0)
-		return nouveau_abi16_put(abi16, ret);
-
 	if ((init->class & 0x00ff) == 0x006e) {
 		/* nvsw: compatibility with older 0x*6e class identifier */
-		for (i = 0; !oclass && i < ret; i++) {
-			switch (sclass[i].oclass) {
-			case NVIF_CLASS_SW_NV04:
-			case NVIF_CLASS_SW_NV10:
-			case NVIF_CLASS_SW_NV50:
-			case NVIF_CLASS_SW_GF100:
-				oclass = sclass[i].oclass;
-				break;
-			default:
-				break;
-			}
-		}
+		oclass = nvif_fifo_engine_oclass(&abi16->cli->drm->device, NVIF_ENGINE_SW);
 	} else
 	if ((init->class & 0x00ff) == 0x00b1) {
 		/* msvld: compatibility with incorrect version exposure */
-		for (i = 0; i < ret; i++) {
-			if ((sclass[i].oclass & 0x00ff) == 0x00b1) {
-				oclass = sclass[i].oclass;
-				break;
-			}
-		}
+		oclass = nvif_fifo_engine_oclass(&abi16->cli->drm->device, NVIF_ENGINE_MSVLD);
 	} else
 	if ((init->class & 0x00ff) == 0x00b2) { /* mspdec */
 		/* mspdec: compatibility with incorrect version exposure */
-		for (i = 0; i < ret; i++) {
-			if ((sclass[i].oclass & 0x00ff) == 0x00b2) {
-				oclass = sclass[i].oclass;
-				break;
-			}
-		}
+		oclass = nvif_fifo_engine_oclass(&abi16->cli->drm->device, NVIF_ENGINE_MSPDEC);
 	} else
 	if ((init->class & 0x00ff) == 0x00b3) { /* msppp */
 		/* msppp: compatibility with incorrect version exposure */
-		for (i = 0; i < ret; i++) {
-			if ((sclass[i].oclass & 0x00ff) == 0x00b3) {
-				oclass = sclass[i].oclass;
-				break;
-			}
-		}
+		oclass = nvif_fifo_engine_oclass(&abi16->cli->drm->device, NVIF_ENGINE_MSPPP);
 	} else {
 		oclass = init->class;
 	}
 
-	nvif_object_sclass_put(&sclass);
 	if (!oclass)
 		return nouveau_abi16_put(abi16, -EINVAL);
 
@@ -779,10 +729,11 @@ nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl
 static int
 nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
 {
+	const struct nvif_device_impl_fifo *fifo;
+	const struct nvif_device_impl_runl *runl;
 	struct nvif_ioctl_sclass_v0 *args;
 	struct nouveau_abi16_chan *chan;
-	struct nvif_sclass *sclass;
-	int ret;
+	int cnt = 0;
 
 	if (!ioctl->route || argc < sizeof(*args))
 		return -EINVAL;
@@ -796,18 +747,24 @@ nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *io
 	if (!chan)
 		return -EINVAL;
 
-	ret = nvif_object_sclass_get(&chan->chan->chan.object, &sclass);
-	if (ret < 0)
-		return ret;
+	fifo = &chan->chan->cli->drm->device.impl->fifo;
+	runl = &fifo->runl[chan->chan->chan.runl];
+
+	for (int engi = 0; engi < runl->engn_nr; engi++) {
+		const struct nvif_device_impl_engine *engine =
+			&fifo->engine[runl->engn[engi].engine];
 
-	for (int i = 0; i < min_t(u8, args->count, ret); i++) {
-		args->oclass[i].oclass = sclass[i].oclass;
-		args->oclass[i].minver = sclass[i].minver;
-		args->oclass[i].maxver = sclass[i].maxver;
+		for (int clsi = 0; clsi < engine->oclass_nr; clsi++) {
+			if (cnt < args->count) {
+				args->oclass[cnt].oclass = engine->oclass[clsi];
+				args->oclass[cnt].minver = -1;
+				args->oclass[cnt].maxver = -1;
+			}
+			cnt++;
+		}
 	}
-	args->count = ret;
 
-	nvif_object_sclass_put(&sclass);
+	args->count = cnt;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
index 34e6fec0f0a3..6bf2c663583f 100644
--- a/drivers/gpu/drm/nouveau/nvif/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
@@ -21,6 +21,19 @@
  */
 #include <nvif/fifo.h>
 
+s32
+nvif_fifo_engine_oclass(struct nvif_device *device, enum nvif_engine_type type)
+{
+	const struct nvif_device_impl_fifo *impl = &device->impl->fifo;
+
+	for (int i = 0; i < impl->engine_nr; i++) {
+		if (impl->engine[i].type == type)
+			return impl->engine[i].oclass[0];
+	}
+
+	return 0;
+}
+
 u64
 nvif_fifo_runlist(struct nvif_device *device, enum nvif_engine_type type)
 {
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 371a3605f537..9887241c5200 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -46,57 +46,6 @@ nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
 	return client->driver->ioctl(client->object.priv, data, size, hack);
 }
 
-void
-nvif_object_sclass_put(struct nvif_sclass **psclass)
-{
-	kfree(*psclass);
-	*psclass = NULL;
-}
-
-int
-nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
-{
-	struct {
-		struct nvif_ioctl_v0 ioctl;
-		struct nvif_ioctl_sclass_v0 sclass;
-	} *args = NULL;
-	int ret, cnt = 0, i;
-	u32 size;
-
-	while (1) {
-		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
-		if (!(args = kmalloc(size, GFP_KERNEL)))
-			return -ENOMEM;
-		args->ioctl.version = 0;
-		args->ioctl.type = NVIF_IOCTL_V0_SCLASS;
-		args->sclass.version = 0;
-		args->sclass.count = cnt;
-
-		ret = nvif_object_ioctl(object, args, size, NULL);
-		if (ret == 0 && args->sclass.count <= cnt)
-			break;
-		cnt = args->sclass.count;
-		kfree(args);
-		if (ret != 0)
-			return ret;
-	}
-
-	*psclass = kcalloc(args->sclass.count, sizeof(**psclass), GFP_KERNEL);
-	if (*psclass) {
-		for (i = 0; i < args->sclass.count; i++) {
-			(*psclass)[i].oclass = args->sclass.oclass[i].oclass;
-			(*psclass)[i].minver = args->sclass.oclass[i].minver;
-			(*psclass)[i].maxver = args->sclass.oclass[i].maxver;
-		}
-		ret = args->sclass.count;
-	} else {
-		ret = -ENOMEM;
-	}
-
-	kfree(args);
-	return ret;
-}
-
 int
 nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 66f843cac37d..b34ed158aa63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -60,32 +60,7 @@ static int
 nvkm_ioctl_sclass(struct nvkm_client *client,
 		  struct nvkm_object *object, void *data, u32 size)
 {
-	union {
-		struct nvif_ioctl_sclass_v0 v0;
-	} *args = data;
-	struct nvkm_oclass oclass = { .client = client };
-	int ret = -ENOSYS, i = 0;
-
-	nvif_ioctl(object, "sclass size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(object, "sclass vers %d count %d\n",
-			   args->v0.version, args->v0.count);
-		if (size != args->v0.count * sizeof(args->v0.oclass[0]))
-			return -EINVAL;
-
-		while (nvkm_ioctl_sclass_(object, i, &oclass) >= 0) {
-			if (i < args->v0.count) {
-				args->v0.oclass[i].oclass = oclass.base.oclass;
-				args->v0.oclass[i].minver = oclass.base.minver;
-				args->v0.oclass[i].maxver = oclass.base.maxver;
-			}
-			i++;
-		}
-
-		args->v0.count = i;
-	}
-
-	return ret;
+	return -ENODEV;
 }
 
 static int
-- 
2.41.0

