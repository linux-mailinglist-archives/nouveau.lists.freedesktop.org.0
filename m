Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2ABAA3C7B
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4DA10E563;
	Tue, 29 Apr 2025 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qCm9pcY+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715710E564
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPP5L9x1b5TjEMggTDyYvKTAbDwGyr6vt9k3vkv1hj5sXXCTKMf8YaWxfVhuFgCmJih5BCxdnTToAOZhbpBfaON12bVOL9azJ4tiekO/jiLcppIIU/OeRwzlOtn9YGWhzjnFgDoU6UP4twaFGv9u3TkYHH4+hu4hTTHRMD08aytMNiEP5b8VEY3wreR6vKiMIR9hVWsc4TN2uKeMt7YnGv2E3wcTP6NOMYRHO4H4IKNEDvK1g9CoxX4+1uvx9pE6e4oAkbArVF4QGJYVxWhnNxWlNlyrVdP3iwex7AsqmI62y0VrdicUUFzBF7IJ3T8N7af5Xu99d0xRFQlf1wvM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dyfK6HF1mD5SwrxtAwyKRhOBKzYYzVByEbGZGTEC/M=;
 b=uxrsUuFtgKWdBthpVH8esbP95J/d2w9/M6e+tvSCOMYN56RfE2tUrGYHl1iusN3zrzxSa22I21nG3gJjPB+Wm7gw1FJuU6D+U2U0439k5aYYkDmWbrev0fFWGngr+YjNLP4ucpCReI3xMtCCabu6SSPnCrRRvgRJGoRqIq8dkcpFXGDdoG5F7BkM5MMXtqWHvQ2O2rFyTAB6om2wmrAUebnEKujIR+zQ8qou1iSeOj7sFK5BtsIT94RPFDnVA0PjKVh2rCsweC7sngLbxR7Q2PX6tSlWcITg9vtwG62GDciADva+9bdiNa0WEuBSvSTKtQ/vNnqs7vOKCVtaqTIFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dyfK6HF1mD5SwrxtAwyKRhOBKzYYzVByEbGZGTEC/M=;
 b=qCm9pcY+gjasFjjz7ge1GaT3szw3UItqN17EW44v8O8E8LVrID1YI2GxJHqZ1RngNdDX9+pjJhHAtn1r/3wuVZVG85QRW7n6upxKNDYqbJaahrg2rcNf2YZXkB6dCh7Ihv5oPD23VCvYCGYJEuVW9j7fVolANZFk8L/rDt9IYfo4AZ43UwJ5LLfxm0Qrc9ZZUWsdfEnhcBD+WJ6AjZ/5OvKZagHKMFTariFAaxfHkh1ch0IMuVyeqW7OG1BjOvb+cF16ydREFIVuAA7g6jFTTlBXnu1eAgeiv+BautvegzRr3cZ4CgRvEgw+hr0cmc1/jCcPgSAZcg7XqxGDw8dzHQ==
Received: from BYAPR07CA0017.namprd07.prod.outlook.com (2603:10b6:a02:bc::30)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 23:40:13 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::54) by BYAPR07CA0017.outlook.office365.com
 (2603:10b6:a02:bc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:03 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 19/60] drm/nouveau/gsp: ignore client engine object handles
Date: Wed, 30 Apr 2025 09:38:47 +1000
Message-ID: <20250429233929.24363-20-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 0739df78-84eb-4a71-c458-08dd87772fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LNMvA69Fh0+YpgQ50fbfwpqe12O7lHaJxfBPU4/dtEBuAdAKwsI1uEcN1oKQ?=
 =?us-ascii?Q?djCJPeN/Vc8UphumMXljVrfeaj/66HdVokeEjBbGWpj8cDhNCDSKT54mQCvL?=
 =?us-ascii?Q?cONM6+0v6euz3gyg45vwHqcn9jQMsIGCi/Nlqm4Q1Q5hdCgiR1ej6QQd0z04?=
 =?us-ascii?Q?6OSEJOp7UqJ2LlKMmVzNVpa+93kenHKz7ovPbLNZwTlRVMXewPaYin8xOlza?=
 =?us-ascii?Q?MTfCkcLlR3JgPgw9m+2OLPrKA+nKmFCMqEcLMN3Vh7XuDOtkNNvitrWVvbXM?=
 =?us-ascii?Q?vMibJUujqBx2waqtmhFk/MIizcluLKp5CmWCVD1+KH1pE6y8wo0IxxIVinFY?=
 =?us-ascii?Q?X+vMqcUtmNcFXgKE8shZ780XTxyaoLQFohm1zvPsbn8KYnH/CV93pVLURHWF?=
 =?us-ascii?Q?G3FcmFqT5o8mMFT5eo7FBYgJX4xkuMSiShNYEvzOcimD/EAe9fL0BBBWdk/Q?=
 =?us-ascii?Q?FuqrgduKJbM+A3gWOpqz2B09nAsuJHNA/5hF6YLFaOBYUyliMlIRPFdLvUv6?=
 =?us-ascii?Q?yvskWNW6rOQPmYBxhRymPShPMZsPcagu4kergJGyW2GGtX4ALw6CGsegYR58?=
 =?us-ascii?Q?dxsaiyqXZcQsNYTZYGN3an5GrCpxMFj3IrWh1QUlyu+mcUzRPoV3+qMzG2f1?=
 =?us-ascii?Q?Pl7CHPUtLOftiFd8K/8aWpniFgUh9SteCeBiiheovbuDYSuSV+WFIX+Bc/pN?=
 =?us-ascii?Q?00lgGgu0xujy8SLfz8Fi1aunazbkIDcGsWWVR9Bpz0cMQzsd+MCqH6Jei5XM?=
 =?us-ascii?Q?EF9YUH8s4G5t9R/OYEp3BuW2b37ToWF1b5pAjrs3QTxxgYShZbmxMRFOHJz6?=
 =?us-ascii?Q?CzKq4Bt1amL6X1IrYj4sRjgOmL302TX6CjAu4BP6XOjGJqIfRRkYUJlPQPxM?=
 =?us-ascii?Q?9G/0P9b5/7cj62E/n/3QKZxFgxD7CJCiB5cMcSnwqQylrDAEN8uCJxtNdIIm?=
 =?us-ascii?Q?vES96bEZioRg+CPjHH1SZfG9SAXdZFa6nD0sNkjtvEkNsq1+UlVy8B4eO1M2?=
 =?us-ascii?Q?Ed++ndIAg2ihPw7NSpBQXPcAJbxwMC2LMmDUazqHdnvXtyoRaa3SpqXGopG8?=
 =?us-ascii?Q?1ZUSPm8yLFsDCCjrHnOhyZam2TRlJh4FClUGj7CleEXEsyqNNwH2LG1C8xzR?=
 =?us-ascii?Q?3Vt9VFuhumWbVebwYLTWqXFmWMY7+XoTUexPxzqLLcZlWisICobRPtITmW8h?=
 =?us-ascii?Q?aBmYhLhvYFUrR2DXi7a08lH+cYoNR5iCTF2T2y5AR94zM/SmWGVTCC5sV4Vl?=
 =?us-ascii?Q?1XQdc/TxeyqppV2F/xHz+OPdMoMnTLi4ZzBvShPbashfn9GjutxTJKwczLaI?=
 =?us-ascii?Q?wXZD8/csgw2imgWcA3T0peukPmt+GnJXvaZSwKux5YfPvmCiC9zaKqsvea5X?=
 =?us-ascii?Q?35ahmuNCpIDJWRJNHSqFXOAK6k9uWUjXykL3qNul+Mz/fJzff8U9AmJ2Ao41?=
 =?us-ascii?Q?bz8hQenkEsFfOyhI63E0z0arlGzYGqT2Kq2+RPP0Q5/wtaJlPsy1UQ2u+0VL?=
 =?us-ascii?Q?yt5+0OeiKWr0iRh6nusXlutGt2DNti68btW7?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:13.1186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0739df78-84eb-4a71-c458-08dd87772fed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
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

The next commit moves to using the hInternal{Client,Device,Subdevice}
objects (nearly) everywhere, rather than allocating new ones for each
client.

In order to avoid object handle collisions, generate an object handle
from object class and channel id instead of using the client-provided
handle.

This also effectively means it's not possible to allocate more than a
single object of a given class on a channel, but there's no reason to
do so on recent hardware anyway.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h       |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_abi16.c             | 10 ++++++----
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c   |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c |  2 +-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index ea937fa7bc55..bad124c15a5b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -30,7 +30,8 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
 #define NV_DEVICE_INFO_V0_ADA                                              0x0e
 	__u8  family;
-	__u8  pad06[2];
+	__u8  gsp_rm;
+	__u8  pad07;
 	__u64 ram_size;
 	__u64 ram_user;
 	char  chip[16];
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2a0617e5fe2a..da8efe134f16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -456,10 +456,12 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0, TURING_DMA_COPY_A,
-				       NULL, 0, &chan->ce);
-		if (ret)
-			goto done;
+		if (!device->info.gsp_rm) {
+			ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0,
+					       TURING_DMA_COPY_A, NULL, 0, &chan->ce);
+			if (ret)
+				goto done;
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index d7f75b3a43c8..3651d9bf5655 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -153,6 +153,8 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 		break;
 	}
 
+	args->v0.gsp_rm = nvkm_gsp_rm(device->gsp);
+
 	args->v0.chipset  = device->chipset;
 	args->v0.revision = device->chiprev;
 	if (fb && fb->ram)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
index 7ad7c82e0d90..b2060b380164 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
@@ -57,7 +57,7 @@ nvkm_rm_engine_obj_new(struct nvkm_gsp_object *chan, int chid, const struct nvkm
 	struct nvkm_rm *rm = chan->client->gsp->rm;
 	const int inst = oclass->engine->subdev.inst;
 	const u32 class = oclass->base.oclass;
-	const u32 handle = oclass->handle;
+	const u32 handle = (class << 16) | chid;
 	struct nvkm_rm_engine_obj *obj;
 	int ret;
 
-- 
2.49.0

