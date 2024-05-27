Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1A8D11F9
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CC110F73A;
	Tue, 28 May 2024 02:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aijvP6Rt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31C10E1D0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9v/8kAPu2prJSlgkjpfQx3QTDFRg63wla/odVeEQCl8bJBA6p3Xj+aPyNe/3KPzAcgbMhDE5HVu1J9LKprBedO0FNqMo3hjo3/n6vm+t5Y48YxPWz2U576o3Al+PfBFj/dEqRB9OOIYd4eS+yg+z21+5SOsSrTZz648ZTePBEjXr7/ajkwwmcssj9GmDQbOz/bDMkxbuCKC/InAD9MuLm4nFVwdFyIcALMCaCfRAuzgtQ7ybxr2egT78/ApNx8ExXjhidLSA56uWcTb+XNy/zaEDfp1d9erUUGRkEjv4EHRDFd5xyePAwtUB0EkpeuJcenRWW4cPyM3DWGBTVF0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NByFkNSlxn2vJrTUyEIw+fYBxYebcKxRDVWGEUbfF2s=;
 b=EYnpJl0nPNpupy62CO2pzyNHFwJV63zNXqpVH6kVasCkS8dHH4UTtUvkPwatcATM0O1AXU/N8kwQrnl0MfhsSUJTcooBuhoKTHNnJ3B2Jmc8tagf4WzLFVJpdq5HAk5eTfFsh9p1vb52jZDInYfhF2oRJUEtTrNwROOUyvmyKVmxuOD1Uv0piwQZwaqw8hss4QtSvaRp0qfeWKtFZsBSintBBvyn+jqTlkvY6FcWKXIalUDF7ZE76iwLn5APnaHF5StlfF3hqDiGFp+MmNQDZ9mDWHEh5QpLyrs7hXwR4hqWe3LQkPotZOvSNkznvK2xqFCEQjsuhbABNPP5u6kIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NByFkNSlxn2vJrTUyEIw+fYBxYebcKxRDVWGEUbfF2s=;
 b=aijvP6RtQge1tcb33NOYNKx6KoSwoashkV57ENSt31K4cy3dUWsiPTxmEUr4QtEnjHXK6ez3OWW3X/UZ+1bbMBNzsYeFdkfJFQnbgDjeeOAghiUMteM9gFC9/z7m8pEznDZ+v8WN77NUgEQGsGXE14HQ3ycpUBJAit0JfDMGSiG936IxGOQbpix+fIOj+w5bLhQmtij1RGaTzDhPUiLZbKBResct9nDyNdCl5+VJd3+ao7S83+cvYkqiunU8sngULE9YT6z4Nwmy1pbIRJeVp42ka/MF0xrHh7FnvuNzySkFce/k2BQEAGaYQeP/XI5mRnGM5XqRDc1LN45E0eouGw==
Received: from SJ0PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:33f::15)
 by SA1PR12MB8965.namprd12.prod.outlook.com (2603:10b6:806:38d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 28 May
 2024 02:23:20 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::b9) by SJ0PR05CA0040.outlook.office365.com
 (2603:10b6:a03:33f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:09 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 14/34] drm/nouveau/nvif: remove nvxx_client()
Date: Tue, 28 May 2024 00:19:39 +1000
Message-ID: <20240527141959.59193-15-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|SA1PR12MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: de904575-d7fe-4415-4bd6-08dc7ebd248d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400017|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnlVme06f9KuShy4ZkXOL8DQmmsZHB/KrjuwKar4xEUMEv4ebuPj90D2gFU8?=
 =?us-ascii?Q?6SnUCPSphzP34bhgWolzc4bY1/CwYp3Ba+v88mEiJHQoRcDkyC1aa3zRDYWA?=
 =?us-ascii?Q?uzVODCQgcJYvplM1AszkUPlw+WAzLhORkH2hpBAdVq57SIAVMaQLiBY/sLVn?=
 =?us-ascii?Q?TUi43s6tFru5YR+VntldBbmCZG4Ky1FZbQR0eCFG+Zzmu+oTdcKqkf2sz3nk?=
 =?us-ascii?Q?q/ef0AVO4BQPpsSK3R8s5KUflgijR/D+akRNkybjJiSqGJvXg/YOk29OrULf?=
 =?us-ascii?Q?Af6wna50MUSkFmiTE0Ne5EOQV4QnyaZouMdAqK3rKq4wQzsRu1Gq9CpijPis?=
 =?us-ascii?Q?lghoN2V2IJPDA21lUZ46xSn7V8bEIjRzmwE+WUug/Z8yu4ePbg6Do8+x/VzM?=
 =?us-ascii?Q?bi1RHrH/WPEd0fPxAWlmatx07SuiS6+oYoX8Tlg4V//TxHoSzasaL+zz/O/3?=
 =?us-ascii?Q?uxxn2piyTFxlj6tCj5Mg31c/K7B27iewDMReAHxlWSf00jtOqkgDcLR375it?=
 =?us-ascii?Q?AD6wITsNv4ZZVlLjd80MbsfkGPPqZiLOlkV1NrQNLaHOlCRX7N+zGDUfW9f7?=
 =?us-ascii?Q?CJ7f/WxOtRfBQ7582F4E4fa+95ucLPJNZTSKRI72egorwb/Xj77yx0j+QnSO?=
 =?us-ascii?Q?bmYK/YhMx3ywBJ/oXg6IgmERMpF3qlRKNwzB4TKPfc2FeaXKJ7PXODEpylCi?=
 =?us-ascii?Q?OVyOAB+u5d2GBtBz6lXsZHvNZOxjYcyl+BPJuwSsyY4j0n24VroaOPBp+qdc?=
 =?us-ascii?Q?8yMyvW4hzdxs8xt99de5UflUnqS8MbafABmKVWd4K1XDVbs0juwM7Xr9vVDT?=
 =?us-ascii?Q?2zsvY7zo45YrB79g1ys8oo1KbfcEfN8GcMe0is24iocrRgtDEbCjOHiYmPA1?=
 =?us-ascii?Q?Gg4ZxkqY3gNqjn4H2HfmDbsh+6SqGCv+FigFDUgKJMHswiWhsAR0XsNe2L/r?=
 =?us-ascii?Q?n+/Co/7/JAm/WP4uo1FNdvbH2mlzyDsyrWCyBJyY54mRNOSnVBfdbT1uqgvI?=
 =?us-ascii?Q?h5XTfqkB5BstS3pv+BG5iLELFSyciP0x2t1CjrI0FP/9tPaF5ZQOoKfUX8Lp?=
 =?us-ascii?Q?UOTJlSXgtGV8k0L6Nu8niVsG6gx4yfYsj9KIo/ml74fttcyYx/NRcbm35vyR?=
 =?us-ascii?Q?Sl0vv02xQRETkbrjsQ5JEbQ7rjpxLu1ROOzeEpIAOoRiq+eIdcGVl+pFVcD4?=
 =?us-ascii?Q?uBtt25CLeOxVSpFrzD3yF6B+9jc+aAscOWKP5YTJchOP/Pa09mQqQrm8H1p9?=
 =?us-ascii?Q?ZadTRFgwYC2HbrFIJtqnXRuza9sbOz8pVaLXipwpH+xVQ0OefWzBWhx8DthQ?=
 =?us-ascii?Q?DdEjsxeX168WYkT9cfv4SQMdjBvX7eeROypekS44qiVkTP0Y1JxztDZ+kEmR?=
 =?us-ascii?Q?C7EQ6tg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:20.5676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de904575-d7fe-4415-4bd6-08dc7ebd248d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8965
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

Make use of nouveau_cli.name instead of nvkm_client.name.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h | 5 -----
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 3 ---
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 2 +-
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 64b033222c56..5210007d7669 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -18,9 +18,4 @@ int  nvif_client_suspend(struct nvif_client *);
 int  nvif_client_resume(struct nvif_client *);
 
 /*XXX*/
-#include <core/client.h>
-#define nvxx_client(a) ({                                                      \
-	struct nvif_client *_client = (a);                                     \
-	(struct nvkm_client *)_client->object.priv;                            \
-})
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 7c97b2886807..2e7d3044c186 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -78,7 +78,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 
 		if (ret) {
 			NV_PRINTK(err, cli, "failed to idle channel %d [%s]\n",
-				  chan->chid, nvxx_client(&cli->base)->name);
+				  chan->chid, cli->name);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ce40a0100264..1add85717db7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -609,9 +609,6 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	if (ret)
 		goto fail_master;
 
-	nvxx_client(&drm->client.base)->debug =
-		nvkm_dbgopt(nouveau_debug, "DRM");
-
 	INIT_LIST_HEAD(&drm->clients);
 	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 93f08f9479d8..ff602a0f674d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -200,7 +200,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	else if (chan == chan->drm->channel)
 		strcpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, nvxx_client(&cli->base)->name);
+		strcpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.44.0

