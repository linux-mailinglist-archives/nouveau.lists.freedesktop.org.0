Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C162692AD4F
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A3D10E45C;
	Tue,  9 Jul 2024 00:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BHzEMq0T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C098B10E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFalQ35e4LGki3YcnbgrVYBv3jsYZDU+DQ+1x7Ce+i2SGfca7iepHsaCeHXqoPDe5+2g8tjqkfYvZBn+ogAIysxMCt7mWQZFtyD6HTZe8VKgTmH88hS7WDV7go0joxNpQeM8y4sl2ERpG7Ty9RAUgGjMZpgu8KzsS/umt25ZkBbm894H3WJbdH1XgU4Y0HcbT8712B5+tCck4F9OvzhD3Yvn13fGZW2B7PHHcEVJNPX/T6BR45c0IHUzGQsM7YMt/YRN+a+xSH4MJRInf5f1mm5RUKH9PAEnnm0PkToN8D2kCOGp6bvWrLt9fcyZCEGTjDnks6Ju5k8IjaL8j3ECoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUoNViAODWyEdBTqUwckft2ZxJRrWOmNpodQePxUH0A=;
 b=CCQdvuHo279u974bROHzdrdRFi/54T9Q3LPbHF6UuM0ZqpIdcyxleAc1iTwKSGQWW142LWMKen9WK/og/wcQ2fmMxnOcCRCr7xJ/cImPVndaBBsg8hnOtb5qNr5EKLPLjBJFaK8DuG50AebSFL1sr/Y8kJPrXedKn+X9bKDVSPeCcv9/crURTm6VqSuf44ggfrw6nRhKB2N6vKDlVvQEHPovuA6HyEt/f3eNU5g3cg/QIme/CISzK/DobbnLyjVAftn+4xfRfP2Hz2wlK1Hmr1bcvDgo0hv1x2dKUKw9Qs5qBjH1mv9QeHCBxmf45htW8aShmOXd5Wrc8e+7BF6+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUoNViAODWyEdBTqUwckft2ZxJRrWOmNpodQePxUH0A=;
 b=BHzEMq0TeLwM8nwMZKKVHINJmH8LCbtBFKY9ZtMr0oHC2HDmVt2p4FWIoM+UQWj8e2S01bZ9i/magmMtd1/H5lZZOKbhzY9hd9PkziVRAUh0XpjrvYbl2p+e9/W9PY8RsZ1D3RXK/PzDs481lHgauE8kz1pU6cGnKsh1tq2CnAXIcZmSE0HyB3TkoUXATkH2AhOs0ePhfuBsRVjjwjNOb21I2omDF1c4aHnJxD6mN0bPQ0JURv/ZmqU6zPQJEEjQgpDVLxebC+Y4yeehTXqdInisGaxAgr8gDxOcNT+nrCK0nZ12IB0QtXDFq5J5bkGITQK9VkTz3h3kVBKfFd1qfQ==
Received: from BN9PR03CA0378.namprd03.prod.outlook.com (2603:10b6:408:f7::23)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:07 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::4d) by BN9PR03CA0378.outlook.office365.com
 (2603:10b6:408:f7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:00 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 09/37] drm/nouveau: remove abi16->device
Date: Fri, 5 Jul 2024 04:36:53 +1000
Message-ID: <20240704183721.25778-10-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf433dc-726d-4908-3b82-08dc9fb1c6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XWtXnhLvwLIHqXTycBrZlc2oLufz5vec1Cj8w/vuCQ/6mRz1JX5Bmxd73D7v?=
 =?us-ascii?Q?zSShFnWaScykBrnQ97qJZkX6LlPPXLiHJVD6wTExo6yRpehFP1IMepn8ldu3?=
 =?us-ascii?Q?YDTkgwl2lcdnN0qq1qzWxPHiNF8wILWJzKxXDbPEJ+ENijqu1c5Dy0ikGi2x?=
 =?us-ascii?Q?bhNkcfL+f7ub9IrZhkfYVtqIOygBU5EtN+vPth5sG7SKbexkMPdAxC8R9u/t?=
 =?us-ascii?Q?nAQiQJ0D3Ptd+c1SnsjqiK26C2ybOCNad2/3b2PYKsCXgEVu8ymK0pZ3exKu?=
 =?us-ascii?Q?BtX0213xKjtMzkTTECy1TwoYV4SN7roZFTLB4PcrYpr3AD/xoX5oTg+FAoSv?=
 =?us-ascii?Q?NeHAMSvNmV4fJ/4AiAZCABX4kyyVBPTdMvHiu30f4ARCbg8dXvim8hAF32qC?=
 =?us-ascii?Q?+a74qSrK1Lwx17Rg9DuJkrbcGuQ0tk/OPHOm1Yx/xC8hmgYR0oX5eWsgksz6?=
 =?us-ascii?Q?Bm1kHNmEb038CIJT3wfS62w15lZa+OrCbjeH40tG/IpC5kxYY/Yga7b7XlhR?=
 =?us-ascii?Q?yN/o2ZBqQiGogegdMFXjrSw5WGf8hxzXo6S61L7nC55nqqGT2Ey5fH4o46Db?=
 =?us-ascii?Q?lksqJGNlN9S/6uHvJbHx9JNVs7hpMrYEyqOxgzwKUcbc1XSVy8xg9hKtYR+d?=
 =?us-ascii?Q?oWY5EsibFZJiibCI+pQVL+a81/IaF/afFG6aDBSl59Dp1AaipCa7wICtpefE?=
 =?us-ascii?Q?ciy224T18r+5BdwrbotNdU69GMxVJif6H0m4CnITQGH+ZnLQ9yxBGrz1hv1W?=
 =?us-ascii?Q?ut25JQGBtpg4OS9tDk7bPhaBqRA23RBi7FvPdm4Kt6HIPVpXW0TE9IWmdzOW?=
 =?us-ascii?Q?j2xBV9StoDtfNeLM5J0YrqjDpcqBNSlJEnWQguyMGXpZMfvnnAsb0yt1p6MI?=
 =?us-ascii?Q?qfEXI9niM/i2SW9DMEhyXZIYoaVoXjWAntdVSpM3OymtYBF3Qt0kQXfSKhpF?=
 =?us-ascii?Q?jy/Rd8eoyesP9rJ+sAcHsd4u859MowfHcpWZBSaV2wFMkRHSqFupUJXoTkkG?=
 =?us-ascii?Q?rxUWJymMNDs4eVkIfTr+JveEX+Dd51Du1TF/wOjtQ63n9tYBiOzdVelhRXZO?=
 =?us-ascii?Q?RJC/NIFrbAiztZYCna0psNoGWK+3rO9w54q6J7847/M8i/+FgH4ka36pNh2Z?=
 =?us-ascii?Q?mG93UodYIcVBy9LSbyBeba1NzfQMDMV7A3i7JyqoEvHto/xCiNlnqH3xS25F?=
 =?us-ascii?Q?5+uSWdw6Zm9AwIOqIS65Ivst+Xnk33j0rbobTs4FJJiZ/ldYlUvHX8WJ2+tY?=
 =?us-ascii?Q?3/qOj0dkN76u/cBi7XA+QHd/U2XZkTYneqoN4AI9i1I5ka/IHwiD8Ljz6XMk?=
 =?us-ascii?Q?o4FSlADS7NJ8OFKoZyaYsZGXWet4zCnipB2F0RoJkKH/NkjxMuECjTDWRi2r?=
 =?us-ascii?Q?uBxDJz3WYR0KpUx56fGVIyWtC3parQ6o4IWIkMiEROMuIe17w2OvL9c0nJwB?=
 =?us-ascii?Q?g5rN2pk3GDuu4y2yBjivRy0CUOdxy1xR?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:06.8612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf433dc-726d-4908-3b82-08dc9fb1c6a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
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
index f80d777cee5d..6f0548e57f9e 100644
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
@@ -232,9 +216,6 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 		nouveau_abi16_chan_fini(abi16, chan);
 	}
 
-	/* destroy the device object */
-	nvif_device_dtor(&abi16->device);
-
 	kfree(cli->abi16);
 	cli->abi16 = NULL;
 }
@@ -351,7 +332,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
-	struct nvif_device *device;
+	struct nvif_device *device = &cli->device;
 	u64 engine, runm;
 	int ret;
 
@@ -368,7 +349,6 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	__nouveau_cli_disable_uvmm_noinit(cli);
 
-	device = &abi16->device;
 	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
 
 	/* hack to allow channel engine type specification on kepler */
@@ -634,13 +614,14 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
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

