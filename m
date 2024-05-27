Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8968D11F3
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7E10F5A7;
	Tue, 28 May 2024 02:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FMAwZnjj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30F310E1D0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JP+RxnAlIX94QhAmaTBPY1kRkRtL2Ma79p/u1SpqT6f022VLkALjq4Ic8gojqe97dWFdLPMgn0rBQWnczL/TYPy0yRhVytkb3RYbjESl8bS6lFXnC6iD3U8adRHIvRdG+kZuIof+54QUi0nyxa+8d93vMCih+bWiqbQVxgjEOQRhyJ9jsY5VDiXHzImABsHA6hKCxt7YuCrBo3t8b9QcWsLVFkU91QrUuzr2/5fO0oib52Iu+blTTFa3Jlxqs1mnjCHOKsg8SRax0+P/S4trxMCmZC7AsGcipE8drTQN8YsXm3nsxbSfqiMjOx9T67rBMZBFyVBlaZLwR6q+M+Uezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFTq01MZ/hEbUMlqSeYSv/EKhSN8KsBZtiO2Yh/KYUc=;
 b=HnQdBPtdDEwNPYi61m0wlol1mzcJ40cI2LeSU05823Py1QBVwWlZ+C/jQG6KQfzuuiPdpUOIpRjksW772CnL68y1JNVZqb8Zsy6M47rraYpqfJz8i9R+OEEqH8/AsQcKi3+BTgKnd1E4JxMj64FqY4Z9ykGf7NdtopMrttfao+kP8pcuu3F79hV25Lr6LyzRzJjYr9gpe5b57Bne1BEpTFhtoJsYaHtl4VsB5/y4Jnt9Nq5rDE//wIZT/dLvlyReBr3GthNEhSoxa6x4MkcLUoMAcjE182HB/wXkyTeqjHg9WmpQ/k6t95hl8vH3H+cawJSzs8de1gdaHlCPHQBVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFTq01MZ/hEbUMlqSeYSv/EKhSN8KsBZtiO2Yh/KYUc=;
 b=FMAwZnjjYNLIEtmdp+gKViBZ3IKDKOFcN2bEzN/ILW1MzdwGbG1pPKBAk9on+/rVMkF3o429LHDGbKEv4GfgeRbeXNJ3U3rLpRiBJ7WOd0KCLqbK3QdlYJPPXwCARSZ05UjSF0i+KnK5JpUnZod85x9X2zTEO5ZgBOk2d8i/MwitSpTZrPCp3LPO8upFp0wfsOSUTMQXblYG2QGg+GnNEnO0hEUNya8y9zRaQ3LjAHQrx82ZM5EK/w19Qh00xBtInFenD6xwXbhiT1eAsBa+r5IX3OIs6TSnUVBhMFIpaobmw2VuqPk0RQqXC2cH2IErHFVn0uvbgN2xOeIH8B2c0Q==
Received: from SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9)
 by PH7PR12MB6695.namprd12.prod.outlook.com (2603:10b6:510:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:04 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::c6) by SJ0PR05CA0034.outlook.office365.com
 (2603:10b6:a03:33f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:04 +0000
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
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:51 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 04/34] drm/nouveau: add nouveau_cli to nouveau_abi16
Date: Tue, 28 May 2024 00:19:29 +1000
Message-ID: <20240527141959.59193-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|PH7PR12MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 0149e302-3e7f-452e-7292-08dc7ebd1a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T9Sdi4ZBrvIt7SfFz3FdLBhfKVGbh41w72Mx6PjzCYrgWLyHjvXhAse7LfHY?=
 =?us-ascii?Q?ymfuaCldQw1WbChlnxLBQsPYWp9jrRLEsqSpEUU+wsd9modRtzE0cYlmUzsL?=
 =?us-ascii?Q?VtOLikibpNZXNqW6opXTINi8WImHiuDDP2JublzwCzOoHnJ6KAw9jgUU+TGi?=
 =?us-ascii?Q?YIYUXq4epQt+2iFSdbvEtQfPTAWZFf5xlwMUlRtz53sT9X28AsREluXCTH9H?=
 =?us-ascii?Q?eAhaEu0hHiYs7wL5kTscEOzHd8VBTw7bjvBlX6nZf+m9X2wDGRDP+/CXGhGx?=
 =?us-ascii?Q?qEfds+8Wj6fGgxo+6K8H0OyfT4DIi8kkATlkJkiig4A6SaPKGE676uVX6RDy?=
 =?us-ascii?Q?oS3FkDrdehtNKTvYgRUSWyE8MgL7gi+JplyEPeWD6K8EAm5hE9WWi0vDC+mR?=
 =?us-ascii?Q?XQWsE9AQQ8CQs/UsO/isFkGXCvJUutKgmuBGN4EPEVhnRMw+kcSxeKnQi3Ie?=
 =?us-ascii?Q?VAszlDkp/V8MUR5dDOe4zmodIswGD94X3cWfM3kJVuJwju26G5VkQIVlOkMk?=
 =?us-ascii?Q?sF9e6TtFP23rmSMJmiBSq37QgHg3FE5grfiq+5gOrFxWMFzS4MPOziFvvxfR?=
 =?us-ascii?Q?f6J17Ye+DaTNGy88EM8adcVKTAHEtKtarHyx0E9WQPVtwvYiez/k1d2Ihsnp?=
 =?us-ascii?Q?TxsDfUiqlJebgJ2B186q3gbCRhhWAUwsoT4mfRXDjclS8wFqTpp9NFa9p24A?=
 =?us-ascii?Q?oVJ4oxy+eGNCNZSlsrXEBnKoPZRQUaFTe83DaF6rAMKLkW0EEqltK/u4NZq4?=
 =?us-ascii?Q?MTHA4eP7KMw81uaKetddzG2epeSa8wnBj/51/Wf24XprHnpWbGroYJbCw9uQ?=
 =?us-ascii?Q?e8XYrZ9wA3rbnAAgDWcM6bT0MhK55xlv6diFYuNG9DA/lo3Q5Rcj9Yg1ULeq?=
 =?us-ascii?Q?shjpnp0s6xJ6pfA18PzzX4uo6X7Gw7pnEjaMsgfvmIV5DDXke/OL1k2H0RUP?=
 =?us-ascii?Q?5tMkEEw/4JoSQtQLv78LoUORHvOdbfTApPEsJNbjrOc55dGKDFno5w3LkLWL?=
 =?us-ascii?Q?mWZCMhHon9Cf8WLmLke72l7XYBccjBjSA1GwF/fM5glT62cYz+ewdn22Ufa9?=
 =?us-ascii?Q?rKDuYF4BhVbDJcKk1Vu50wc+BVnEEfyznPb65NWccalf5EfBzYQ3rzdxyBZX?=
 =?us-ascii?Q?TYDquekQUw/FO88AhNozKsgn3iHTdVa7QaP2AiBNsvgiGR/vThMiNnptCga3?=
 =?us-ascii?Q?fPTTBIbS8exsKSIhHiFnHQYDOy9Pk31xtai3Hrk+RXGgZ/rcS5VQZhl7K4NY?=
 =?us-ascii?Q?l6aBmOgLfOiZY2AFYiIel5TUCGxP0G0rC8ZolS+/hL9h+HbyRe9kMT58iY9T?=
 =?us-ascii?Q?sD24wjncg/HxuCylccopI/SIQCjJ/uyGw+ooSa0o0QzQj4bKZa6zGEawYaGK?=
 =?us-ascii?Q?XhB6y/r9mPOFL4NOWCqY3gW/5ZJ6?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:03.8176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0149e302-3e7f-452e-7292-08dc7ebd1a91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6695
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

Removes some dubious void casts.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f465fe93b1f7..d5fda5e3a4f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -50,6 +50,7 @@ nouveau_abi16(struct drm_file *file_priv)
 				.device = ~0ULL,
 			};
 
+			abi16->cli = cli;
 			INIT_LIST_HEAD(&abi16->channels);
 
 			/* allocate device object targeting client's default
@@ -82,7 +83,7 @@ nouveau_abi16_get(struct drm_file *file_priv)
 int
 nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
 {
-	struct nouveau_cli *cli = (void *)abi16->device.object.client;
+	struct nouveau_cli *cli = abi16->cli;
 	mutex_unlock(&cli->mutex);
 	return ret;
 }
@@ -164,7 +165,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 void
 nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 {
-	struct nouveau_cli *cli = (void *)abi16->device.object.client;
+	struct nouveau_cli *cli = abi16->cli;
 	struct nouveau_abi16_chan *chan, *temp;
 
 	/* cleanup channels */
@@ -526,7 +527,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	if (init->handle == ~0)
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = abi16->device.object.client;
+	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, init->channel);
 	if (!chan)
@@ -620,7 +621,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	/* completely unnecessary for these chipsets... */
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = abi16->device.object.client;
+	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, info->channel);
 	if (!chan)
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 661b901d8ecc..0a9121e63143 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -30,6 +30,7 @@ struct nouveau_abi16_chan {
 };
 
 struct nouveau_abi16 {
+	struct nouveau_cli *cli;
 	struct nvif_device device;
 	struct list_head channels;
 	u64 handles;
-- 
2.44.0

