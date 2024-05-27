Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4428D11EE
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3191210F0C2;
	Tue, 28 May 2024 02:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VuavOBW2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3168E10E1D0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCapk1qBwlZHArsa3963pvwxThQGYfqFeelm8K7KU2TzP7tZBwy2Nae+i79yvl8nNXa/GQleUpNR/aVeDQ+CzkncuOWVnrPXh7M3I2Zj8Z9NeRPlQNyFm5TFBhB6YyBca1PUPVFg5ySJoS+pmSI2tsT4tL1TJ/aHggVF40FseNxIjukp6wGdbAa8EPbxGP55aDppzrDJuonok0qukOtmo+2uS6b5+0z+kLj+FrGneukE00UByJxciirkS2Yfdt/Sqrh2f0R3xhrs7VzWxrmPISMgqGEaOTUU1dafJTTKN+jpvql3Iu7TRpRrU9EQOQpqXxQL6aPNjofaEWyjfjJ2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw60D+lA32nM6TLv8RXb1bU0eu0t0jI2xH5tyjkyfII=;
 b=Ss89ZyDkDSHAHHnujH6In1OOPuMRCBcLhERmDi8bXse4Twd3zUIKYWwUFzqvJ711m7AOq8+TeYefGeOtB6+8A3jbBM9InsdP22h+yta2cANeZdy4bm5d0O+cDz6sFX/0zczqyKMOce10Yhy7JIVK2gIN9nttStJWHiC5tvFtr8YTSy2DL99M2f7LOlhH/C91CRt1F7JKWnX7cZ+L7fJgvldn28TANQrvJSCI83TCnvzZzUfk4dgjPcaowGSbI6dow0F+iC+P+8LvMVV6dBh5dB/SlHCJFJKDiSl6/a+/PxRp6TH/TUC1zFovFI7nui+MnfbV/Nf2QeaNib2u5G3X6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw60D+lA32nM6TLv8RXb1bU0eu0t0jI2xH5tyjkyfII=;
 b=VuavOBW2pyUrw/ft20zAIHts+bnu+MTaavb2Z+bMTBtIcC0x7RTqUWqKaw1SryNUOLJNKFuqWQxLCTDZmFBZ2ZlESlahioH5CCrJ9Y+9sLh1o6gGQWI2+h6b1eEFvtDhOb1RfzwvA/s9odXBCNZjZsGcv5kthPZ0x0ky3jH/bkPVrEd5Qud7ATnb0R1SKUe+tZRoI4w38Ktosi126Hfv934UUAoymBpMBp+nKeleEjG5Tq/KL2+Uwj2qx3WzD28XuYFTdUbv9OgH2Pe+IJrwy9o+bTefQK8Da4kbfJZxGHXSDXvOo/DBBBHE/dOidbprCB5NHP62JFBadkfNdsoaJg==
Received: from SN7PR04CA0159.namprd04.prod.outlook.com (2603:10b6:806:125::14)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Tue, 28 May
 2024 02:23:05 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::31) by SN7PR04CA0159.outlook.office365.com
 (2603:10b6:806:125::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:55 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 06/34] drm/nouveau: remove abi16->device
Date: Tue, 28 May 2024 00:19:31 +1000
Message-ID: <20240527141959.59193-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2d1568-6a78-4f40-bee9-08dc7ebd1b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OYHBeLGFUaJaRSofR7ZOFsBAoWUeOnQpZzZnVi20/TJB4Lrv0fu7Sl+Hz8K0?=
 =?us-ascii?Q?e+wv4hSmmhMwRChAd7/nln0GPqi9O0CQPlsPpRcWyaACwpZATOAEQnqvoTw3?=
 =?us-ascii?Q?E6AmJQX++PmrGAFT3YADfEIuCgKmz4uUL5b8Ni+Au6Ai0cBN25uFggEwApPA?=
 =?us-ascii?Q?XGzINnAQOni27PmlLV8Juh5mjmn+C9oM2uRDnRQaF1MlVv/lFlWKoQySuuX5?=
 =?us-ascii?Q?NdH737q7t0XrIEuJWbXbpTHh2+vstUsug2MzUmeKMywX86DPI3I3hQVtSy0X?=
 =?us-ascii?Q?59n6CMJ01p8pKUa19Utt9V01ZhRY6KgjjXfykFxWV/edqjbRjDo40bBvNSO8?=
 =?us-ascii?Q?eCeeuPUOu7q6UK3UecBtMmYxpm7vaesXujHk3hKpqNN3GfYw4sB9qD1TzpJi?=
 =?us-ascii?Q?B7tVR2dzGvgXWHRvlVelmoLdXI/FdF3cAM57qWXyLPA83GxnrdyeIwyi6dYA?=
 =?us-ascii?Q?njbSMlHFw6ZxhXI8u8/0MhVqMaausTrhgxXAuaflLnJYVIlYdTkfQYmIdVKa?=
 =?us-ascii?Q?j7nk2Cdt7fpxk1GMmJD+WEL9Y2EwZ008aPfvTSQuDYeZUVMkGAC+ak8VjYp+?=
 =?us-ascii?Q?ub3NrvBnv5JYs5ZtSIpAnwMaAYdwovaHZ/hP+zEV5R9MMWkNqvyhzBk2grRQ?=
 =?us-ascii?Q?iNosLM2znIBGK486pByUJ79EITgP0pTVkp04Rbj9HtmKiFbM6yishETR/EO8?=
 =?us-ascii?Q?O4+CEaiij7zqkXmfmxbeKfiQ/Bmu+E2RMMM88gq1DDEtNtMMaZAwK3lEKKA6?=
 =?us-ascii?Q?LLKmF+zHlSf8S++56nImMNXMAOfvsuQNYVlfmhGL/T7hmSW/JxdVQ6NqGjgy?=
 =?us-ascii?Q?AqNIsTjHNRzsobMbia6Sc+JLDDNuh490svYdG1DFFwCw+Jc8oIXsZ6sY2ImS?=
 =?us-ascii?Q?2e0x8B40s3MJQKkX4+IqAgC6ohJj/E5nUGjncv/uWm6uPjjpdnev6uPkBtRq?=
 =?us-ascii?Q?6KpFkbRKBu1R+3TqINS0bxPvrtlbPuN0ss/CaCbGJ9T0nV9nvQ5+ZDGJ5Jsg?=
 =?us-ascii?Q?ugdK0YX/UCtVVRob270PEH4oBANNCyFY8s3XGasEadFE3SGAFZlUDd4xF1qo?=
 =?us-ascii?Q?Qwea6Rogj/wmMhFpmmc6MtnIMy8tbEIWKqjKy6i3VFxGh4H9xaWowDJftwok?=
 =?us-ascii?Q?nGQuqT8v31uoYkqYgSyw3SpUXie8OA50KHOsh1mSarVivveHsypxrWubOl+w?=
 =?us-ascii?Q?FxhMouBk3s0uM3VYpLxWOeEf2PpUCk4JwBj1FJ1SaiVwtG9tqJXQ+hVq+20w?=
 =?us-ascii?Q?/9264GT2aRtk/22J1znenkAclAczSfEzRwpwH4E01YS6sbcbwKDsNRpfcHUF?=
 =?us-ascii?Q?Y0Xg9JnCxUzw4NIARXMKk5L/omvQBiBAqZ8tGjYqKIWHD019jUXduvDf7Ekg?=
 =?us-ascii?Q?RCRNWoP1Hcg7AvUAV9q4uJwcxW62?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:05.1343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2d1568-6a78-4f40-bee9-08dc7ebd1b5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890
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
index aac923b3cb89..daa82b333309 100644
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
@@ -235,9 +219,6 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
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
2.44.0

