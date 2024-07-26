Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D893CD3F
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE7B10E838;
	Fri, 26 Jul 2024 04:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bMXZZ1ku";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8010E246
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDL1Ay375qqIKiFtMktje8Vs1wQjprrl2JqGnqrqk54uJ8/la//WwNW5S4znOhDmI0BVc5UAkS5BcrZh40Ro5paur8xqsKWBdvOtuXpjcHQDzCKgab0AAfwYM49Q/5rq0EfxqVw4kZFTjkPLDzonYprx4CuncWKt7CK5FU3yBIVhSoifG6jyFa5jR4X5ncpr49f3SRVKApd68vfM75X0L01pSsmwsEt6fahNlteQ6hPiQLsIwF0jKJM8MdRQXvFW8IoKNcSD7EJWE7seXEBTK2MxNNE6dttMscp4VhGy7fsWRq35UpvLR2p1sptFpBBGJS+6C07kpBCjcdAr57dgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO1YVmY80tZfFiVxeYpJi7dtkLHGdd+ZxP/JwcKWf0=;
 b=MnzLnXZc2LngTpaY/yIH3eyXzdMiI6hRzAMH6CVPRynlmyth2TyL47ZTajeK8RjnQbbPfw/+YENAGkOb97cCXhTfDne1ofHcan/YFM7+O2GvawIN/1xtvWkg4gVWG9RWmYV7P9vmD313aYjpbVip5A3vefSIiLl1Tdpj+fkFsf3Rd0ELs+tIzP0T22BrUKpVd29zuZIbiPyGPwH/iBczDyQIvYGRRSEx+HGa+Q0Ye7n85f39+Z1Upt2Wye/4N37nyx6jpuW40Se3nHw0+bNK6lgkD93Re4Byef03PMdOtYCifEC2iirPebITskSrvrSGFhI6QcuU0DsOFaaIoGXoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO1YVmY80tZfFiVxeYpJi7dtkLHGdd+ZxP/JwcKWf0=;
 b=bMXZZ1kuFVPtOB8IPe7/Jy2+RU80pNmJNqLcrphzNl/HFT80kc+RHTL5ZquZ78zHSWKiwaKKBEY9hEIGWcvM43o5/9OmVP3ZjwXzqWFGRVHzsNi74p4Fc6qV8pdypWMn7GpDpyRP8VuFdRWNtD0BREXZmrnMshx7l4kW0Mlz8Lys1W9pI5Tclcr7rSmMSREQc5XkCHgsuu+9blR3iMq+s3K4dceJYEZKX5Rd2PkX6chea61xDNIEhIu5T0GaxrM2X+8hm19ZUXDiiid5WepuzFSbgrAv9v4zVHFvaBuFaXhXy/rm/Ec5iJc3cfV0rzU5aabzwJtOwBZLZfS5BQGwLA==
Received: from DS7PR03CA0102.namprd03.prod.outlook.com (2603:10b6:5:3b7::17)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 04:39:03 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::69) by DS7PR03CA0102.outlook.office365.com
 (2603:10b6:5:3b7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:55 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 07/37] drm/nouveau: add nouveau_cli to nouveau_abi16
Date: Fri, 26 Jul 2024 14:37:58 +1000
Message-ID: <20240726043828.58966-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9dbe8e-082f-4752-2851-08dcad2ce080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?syTvwk+S0/YiThmqUunMMXfwssuLY7AZmpIRD4VCgpB+u8IAefBjBxHTLNZt?=
 =?us-ascii?Q?4aN/tpiWaTlteQ3RvVPDP1E9v/ZbGFElZTR1VuJ6J4TCzLU1pExzx4hS8mAh?=
 =?us-ascii?Q?o9bHMHuhxyr4QOO+iZCKb4MSzARD8dCWiLwL82Id0cG34oh95xA+TNb5ZQYu?=
 =?us-ascii?Q?X+COUVjFBdPuch/rA+dh/mUFBfiS4w6b9UJM1w392xqEAYXZXLfv8DgqwUn0?=
 =?us-ascii?Q?QPftn8MAnpZkC3xDe0ZcCA044KPe4Bnf7xPTXn+kUKgLk6nBF5wA+5Z/BBsD?=
 =?us-ascii?Q?MEcVM7ZSRCP6+V+MC+V7wi9zW2KB/I1dqy6GETmmyRZ1U88WrV091QJUTYfy?=
 =?us-ascii?Q?Py9pfIgbQClPEunDLP9LXsYpFSzV0tLM1FQYcU9ynw/N7dVF3/DqZ1ZSTJF2?=
 =?us-ascii?Q?ho4gDzz8MvusGJ4jupVQ5P16qh2nKE9xxd/D4XUaIwtS4drXWK/DHvwE/Lvq?=
 =?us-ascii?Q?6xg0k6rZ1QefAr6OYQowSYznLlIEk2MyI+Dd7hnQBB0JFBvOb6JzbX5Od/4e?=
 =?us-ascii?Q?1k+SRvKuVqXSToP5lnY9MunKT8A8JQLWQoY8UUn1gCxJE9k5558r89fv6WXc?=
 =?us-ascii?Q?kMqL+suK9pqyJ2msoY4NyhFt0t0hzu7PmOudGo64KwYz/d5z1so25Zfdu9jL?=
 =?us-ascii?Q?bozr0KtuGLbs3Ea+mFKk8ZrKN1If8muBLU58Z4NzywkSBCYHwjWMVODUgTlJ?=
 =?us-ascii?Q?K4MYeU2qBobhXTPhaF7mn9HnwV3hSn3qw7i95J8jT9uV6QiGOq0TPo4Kmw2x?=
 =?us-ascii?Q?zXCfFUB//b+hd6szN5KZH+YaEHmPgPgzmR1SKSRJMKsCmNQictJu/Fsn46jf?=
 =?us-ascii?Q?tinlsTdIk+kJNtBqQsT+IEGvEuGkAkJT1/yPYfjpuk86GvjwcnSMaHbmls70?=
 =?us-ascii?Q?gsHcFH/pPXSC9jJB2jieHIcpwiJH6RaKp0rIVqOMmtL/eBJdwamL7XBYZPdW?=
 =?us-ascii?Q?tVzLmVTQiOGABuArqjyA5eE5wOCih6hoHdBRzHv53Ctcn+6bFhx2JAxocWvu?=
 =?us-ascii?Q?BthB24MmUpme8PGr94N7yCntD15M7MF3M6GbPjogz2lYj9w0UpHjXY+eQKdl?=
 =?us-ascii?Q?zALizgw6O5BVJIjLFhIGdC6REotUHi2qQDOOelQ3POglLgnK9Q8zN+ZAluf3?=
 =?us-ascii?Q?Vcigj+uhoMCbz8FtnCXFoQdgfZr+linFHInazRbSvi48JrtINbl5di2s4chN?=
 =?us-ascii?Q?RJj5GDJVIanM9cO6gLMtOfbXgsGe/uxf93/kdOKwBQxbwpRfpIAwpPoqf2SY?=
 =?us-ascii?Q?7to+vXvpraa1dcy65l1GeVoFtutcUn6tso+pk3CZCHDGnVSFlwMFQt+yjfgl?=
 =?us-ascii?Q?hrYyuXw6cyJ3Kl025NSz81dN1zbkxTOm/FjOD4TC79/wn56QAkM1nFk9stgf?=
 =?us-ascii?Q?f2Kj8fzRDKs7ntFPuWCvRg2q8nSXdBazAYud7CZspTF6hJ/hDSWFNU2j7XZI?=
 =?us-ascii?Q?AmWw1e/bdGkwTOIsLy1l4gPToP+gpFtv?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:03.4866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9dbe8e-082f-4752-2851-08dcad2ce080
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
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

Store a pointer to struct nouveau_cli in struct nouveau_abi16 to
avoid some dubious void casts.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index d56909071de6..ac50c300d2eb 100644
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
@@ -529,7 +530,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	if (init->handle == ~0)
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = abi16->device.object.client;
+	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, init->channel);
 	if (!chan)
@@ -623,7 +624,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
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
2.45.1

