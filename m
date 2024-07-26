Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3E93CD40
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B59C10E58B;
	Fri, 26 Jul 2024 04:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qXOSSgcj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911F10E8E5
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOKvDi60Rn792niVI3cQbDp4OMT78woVBoLAgBDQPJEP+DdG9xYJKEXixG02g2XA58lo35gNsOEr+TxoW3d+QE2IsEwug4DsBzNnkuH9WZJ1Vv/Le54ezMQHbHJnJmY+PfSyvd8UqKGkVLAGBUBTxtOUln1GY47jDQHWexDTKs9Nh0Be8KmsDw7hAeppIM4Ybj8TUDKNzcVAqf/Xtlm+Vd1HkM/ljDuPwMaqzdJh9ftr2P9jXtvyg6u73T2hapkWlpxUNFCDcDSF1OjBr7Sr4xtSLSsAoHSL1XHjmRvxgrAagWEE1jjWZDhXsZrYzieIPJTJ3zRz1I3fTzl/YS9b+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYkBmkrVs2Sr9ZbeHHOqMSlv+EtTuVShqL9w7jm02BE=;
 b=au729K/9mVUljNbruaQNj8Op3Wq6/NcwVtiY1nqH9qG5JXwwSnFC3LcilXmcgdltFM81Rm6QmX/v1/yxJ2Ov4dF2wFg5iK8p3alG1edaSW8KrazDtd0i2n+6dz5gsTn7Jh0WwPJM7GKYtyvGcmhWM9Gwc67Jwi6zWTmcSk2LT/Bjpo0A9W3u1w/8tpMeOpnun423bXDsOdDxzZMartGYy+By31nV1odCLcR/HTcJyEcpJVAt4Nr1Dq1KMmBylgmBCJjlG9Hhen/sSAyTwcS/VQgJSASq72jOBWpqMocOxRRcXkGMDLS7FHowlH2NuopvDIF9NJxB25WmORbV6xVO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYkBmkrVs2Sr9ZbeHHOqMSlv+EtTuVShqL9w7jm02BE=;
 b=qXOSSgcjSb/AzPw0nadJlqZwXNIuUiUSSxAgaSJ8GI+Nr60wVRzeEf4qQED7hcbMEUAZ7hoJgJLegqc2EXf44/0bklYjQbtw6tDd3sbmzvfJ27iyieHJHJiTLPSOqeCQbUaMxcb23wSxvkZh8ViDROQ7vwpGf8OW6ZgTJgaswG4in4faoAFHHS7Vky0PfP2CzbCWDYv/3eugKszEc18v45iWFOnObaBHeJRahcfh/MWhTyjGxfCNTMRf39nYztPrBCGI13N6jj9bZUwtpxuaPItMU/ny7ODdCKGYisB4rffcDja8iVny9E0GX3uf0mI9GjDlehnsTE6G+Bfx37fHvA==
Received: from DM6PR08CA0065.namprd08.prod.outlook.com (2603:10b6:5:1e0::39)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 04:39:09 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::9c) by DM6PR08CA0065.outlook.office365.com
 (2603:10b6:5:1e0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:58 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 09/37] drm/nouveau: remove abi16->device
Date: Fri, 26 Jul 2024 14:38:00 +1000
Message-ID: <20240726043828.58966-10-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: d2107f3b-be1c-4c5e-6458-08dcad2ce3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B9Hidban4v32cvpggMGzLXbMFpFkgx2EyeDsOzxsXAMsFcADdorWuvs/V3b1?=
 =?us-ascii?Q?RmAiQgsgfTkNxNRY+JcVJ+LLFsiUO0GUh9MuCCt0I3BGZtPYv2ROmyrKx9eX?=
 =?us-ascii?Q?abNgJIoszHUr14IzjAQDNmVeTLCTLqy9Kb+8qJcHY3KM6AmeYzD0U+QXSb3P?=
 =?us-ascii?Q?p5O5P7gA1MIT9nVbwsrVqJ1kPzSLFw6IGNSIm5YjQf499X61XmvL5vcT0ntS?=
 =?us-ascii?Q?dI5EtFIM+gdgsNmUre6BDZubQSTpzZx1eJK7W1Q4sz2VI5rQEEwpTbyt92vF?=
 =?us-ascii?Q?tMHFROjv0C4D2SSNFNDWE26wPRXDzpf/BwA5S60Xx5xm2HM4YrRDyfzzqaSR?=
 =?us-ascii?Q?OqG6JqHznHatZsCJFqK4Uz3C+3L6HmYBcTLFh7uoZNxf74h15vrmgomM6M1B?=
 =?us-ascii?Q?YQ1PEBl4IdMzvvULVHY2uhqct/w9oTsuk5iH9ex8ByzUsf3wfH2uIV4Pr1pp?=
 =?us-ascii?Q?NgLbSdcyfk7f/gmSnoFXxagFBbHTiNXdaNE7oa6lFpx9lZcRjrZc3M2GmQ4W?=
 =?us-ascii?Q?I5BVTmOVNrnaya+Zr1Swrw7NA1i9eBkqbbez7L0N18jzQjHRJ1N0C7Sly1HW?=
 =?us-ascii?Q?vVXuECGTihLoom0q8eZgyfx/AzswMRX+p2gSqc5HkGI7p6PmE9ZVLuqC0gEx?=
 =?us-ascii?Q?csKzc0j++wMGSMm2mIYEvcDsapJkseBF8bCrN2SemGxCVABuy+mQxLc/BVbh?=
 =?us-ascii?Q?SKDSGXIrBY/kvK8bF/KFswo5HeBkU9swq2idMnOfMEr24RIgC/KpjtuldW/5?=
 =?us-ascii?Q?Rw8090A0bTIacjJP8xp/kgWQ0ZfNsOmXtzV3FgCp5XHJO23ud6037wiZ8I+4?=
 =?us-ascii?Q?ubIGLT7bKRyTn1gtPhxHxBxnXbBi2/QiXoCYrKgdLPhhfUGvAs09uBmxYPuE?=
 =?us-ascii?Q?AchVlTANsMR1BluP6TTx+e8JjiR6nbUUl0Z284Nu4wK+JLkJsgIAjMUcv3zL?=
 =?us-ascii?Q?WG6KF9PAy+SnLwlbUWSMCQSitxIZTnDchCrq+IxIluk5q1XSVtJndpXg1Qij?=
 =?us-ascii?Q?FrAlG1aM87ZarLae39IoDizK/RtPA5U1l/qlHz1YuYHsmSyZf869Fqc/lXyw?=
 =?us-ascii?Q?kAxYrScV+7zDI14N4HRO+MzJZhjDw4P2IZOgfPbZ6uNCcLFJeAkm9w0LZXoC?=
 =?us-ascii?Q?ohR3MVq/R+XQOZig0oPHomUC7wxg+ruYFbtfeDH1eUg9g0Io547RUGFfWQbH?=
 =?us-ascii?Q?K1zvPcT7a11IW5H55eNy3ikQTENW66f2aCO6FdJoaBvi7uA2wgf1lmZh4ya3?=
 =?us-ascii?Q?ilQ28ssc9Bt8rBsIvHGvRroqCWhTzcHb6ksSkDNshRjMuwC5ZBWNpPeltv6m?=
 =?us-ascii?Q?jiwbVoDrbgsHm0yb0ItgsyCiY5ZizV+rcy/AaGM/UbxU9zbUMpZxu4JXI8le?=
 =?us-ascii?Q?XcnPdH7wJtuqc0XRUX8GA/6wjrLBSPrSl877AOTG7oCmvyUuOUosI2Q1UVJK?=
 =?us-ascii?Q?G9TGYVbMgpK/qXne44W/EeqR8NuSCAzF?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:09.3037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2107f3b-be1c-4c5e-6458-08dcad2ce3f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584
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

The previous commit removes the last remnants of userspace's own nvif
instance, so this isn't needed anymore to hide the abi16 objects from
userspace and we can use nouveau_cli.device instead.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 25 +++----------------------
 drivers/gpu/drm/nouveau/nouveau_abi16.h |  1 -
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f2f5031d539f..a05131920052 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -46,25 +46,9 @@ nouveau_abi16(struct drm_file *file_priv)
 		struct nouveau_abi16 *abi16;
 		cli->abi16 = abi16 = kzalloc(sizeof(*abi16), GFP_KERNEL);
 		if (cli->abi16) {
-			struct nv_device_v0 args = {
-				.device = ~0ULL,
-			};
-
 			abi16->cli = cli;
 			INIT_LIST_HEAD(&abi16->channels);
 			INIT_LIST_HEAD(&abi16->objects);
-
-			/* allocate device object targeting client's default
-			 * device (ie. the one that belongs to the fd it
-			 * opened)
-			 */
-			if (nvif_device_ctor(&cli->base.object, "abi16Device",
-					     0, NV_DEVICE, &args, sizeof(args),
-					     &abi16->device) == 0)
-				return cli->abi16;
-
-			kfree(cli->abi16);
-			cli->abi16 = NULL;
 		}
 	}
 	return cli->abi16;
@@ -241,9 +225,6 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 		nouveau_abi16_chan_fini(abi16, chan);
 	}
 
-	/* destroy the device object */
-	nvif_device_dtor(&abi16->device);
-
 	kfree(cli->abi16);
 	cli->abi16 = NULL;
 }
@@ -360,7 +341,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
-	struct nvif_device *device;
+	struct nvif_device *device = &cli->device;
 	u64 engine, runm;
 	int ret;
 
@@ -377,7 +358,6 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	__nouveau_cli_disable_uvmm_noinit(cli);
 
-	device = &abi16->device;
 	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
 
 	/* hack to allow channel engine type specification on kepler */
@@ -643,13 +623,14 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
-	struct nvif_device *device = &abi16->device;
+	struct nvif_device *device;
 	struct nvif_client *client;
 	struct nv_dma_v0 args = {};
 	int ret;
 
 	if (unlikely(!abi16))
 		return -ENOMEM;
+	device = &abi16->cli->device;
 
 	/* completely unnecessary for these chipsets... */
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 75a883a44e04..4743459ea14c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -31,7 +31,6 @@ struct nouveau_abi16_chan {
 
 struct nouveau_abi16 {
 	struct nouveau_cli *cli;
-	struct nvif_device device;
 	struct list_head channels;
 	u64 handles;
 	struct list_head objects;
-- 
2.45.1

