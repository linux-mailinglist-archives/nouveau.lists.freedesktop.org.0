Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213A92AD50
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157310E317;
	Tue,  9 Jul 2024 00:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hii96X/h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74CA10E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue0E0GUJYr0ZP03kTd3c0uX7eKrCiDCnJHmCP3e8s0GR+fa4pm4Slsd39s2UvTu9LA4bM06ZyVjRL5b0pS2foPAIPqCj0ACDThc/WPMk9IcO0GsDPLUPowMk4xs3Aw4Tzitc8rRToCkcJZPw3yoJPzyEW8ZCXa+kv2J1jau9R13wm1IbvYtzb/dDzDYhxTAj2vy2x1oVbfaPw05WVi3ixnOGwY8RM3yklMai/WnGVKQHXsg2UNW9vW0PgNpVnUA+HOI8M6GbyMvylprEtU/LW2xXXnA0SWJR0zeCP0NmBDTUi9z1OalvPUaQS/VyK+SWw9v7zDmpiqykDoshtQUp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z60dyGeFGYSS1dEfnESqMFUa6baquLquFOn7h9w4ss4=;
 b=RzQB4YNMFNb2fvDIqxErd7Xdxrvh0YWhv8ved97R6Hqt7A3pz5xSWEFTRKeZ5GCLMLeyomW4lJUsE6/8fozztUQMTFLqYD5Qr2Jr6y7IKGeykaxb0VPmCqid5zvFL8zbJhR9EUtSQIQWuw/TJcLpZA4IaHOg+HvydoiWni7hy2VYtsHGQs4DPYiBMddfo+ro/y08/bCZ4bASVqDV/CAtCC3MTShCEJ3ItShyLtu4EnB9zpVrTNjNlTRE3nYRlKluHB6MuT/Sh6QZrD61rMUJY6b9litqj7y/FZ3B3d5xSxpjQ91CxZ78uzxlG9wcRnO0xefummBMxiuj9LYkce29sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z60dyGeFGYSS1dEfnESqMFUa6baquLquFOn7h9w4ss4=;
 b=Hii96X/hKEYwFmJgr1aTNu280SGejpkCB8eJe52zXtXYrzENBO7bJebxF0gxWsMo77Wc3gE0efUi+2K7HhuahC33vFOyf2zYV66lWCgp9cY5M5mJ3UFiiF7j1VJpvwk3x6mDqRlteDSuwOTmT1pMP3V17rvI3Bbf8Mf6UgAcghkHW0T6PXVfANVe4PL8yuLpRas012R6T5WdnEbrhB+bTf6+fREWzCb061wIqvv4ANsZdyUz4EOISKoBZFQscwHiU6U0B48ElMFzLW3B915b10Vs/ZCyevaw91R8pb6vKPJW9Y2CD6iN/1nrsFnDlhIjjcQKorHAhJ6Lhn9PV14Mnw==
Received: from DS7PR06CA0013.namprd06.prod.outlook.com (2603:10b6:8:2a::13) by
 MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:07 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::20) by DS7PR06CA0013.outlook.office365.com
 (2603:10b6:8:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:57 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:56 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 07/37] drm/nouveau: add nouveau_cli to nouveau_abi16
Date: Fri, 5 Jul 2024 04:36:51 +1000
Message-ID: <20240704183721.25778-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 261cbd1b-6220-4db6-ab09-08dc9fb1c6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BptOG0phHokJ1BDDmq9LJ45T1dzjis0FU7LNpSMDo//tIxQZO1YC353ov5lP?=
 =?us-ascii?Q?0yBi7qb9cwlsNccypPb3VXjNbMRS1pm8ZhRO8wKTYI367gQWxERnLiCxn41W?=
 =?us-ascii?Q?6bU937nnY90ZFu/T1EsS93aY6dbCKhztB7HzvJlW05nXSTZ9wMbVT0GDsrUj?=
 =?us-ascii?Q?JrDapnqEUD1AXsqXbiSf8E9l8x/OeFm52cseIxZo7ZTToIi7U4eoM0bxQ6TM?=
 =?us-ascii?Q?doxhOXN5R+W6AWd+Tha5LaVvpmc9oAuBwC+rVJRSPqQJ2rZtN7cIAsIaXuaW?=
 =?us-ascii?Q?GIhrBtl3/aQKWQfTwcHpdUYSAobL9i4GL3wvQKB22o3v/iwoYjIBgkfSaU4d?=
 =?us-ascii?Q?B/CGdof5Vxsn21Jo/PlyNbpi6++UQnJpICogzLmgXRu+lmywhZYGK+l+ss0b?=
 =?us-ascii?Q?YkGItKZJHyNSXNmM4e+YJoTWHbOlwP2xHVpk+qBtcA9uO5Fbe21q/jG0J1Em?=
 =?us-ascii?Q?rT8eqxLFC86SKfQityLc9WjwTgS8JYy3EJqoXwg2TzyZ7YlbJHMNaPCfD0fa?=
 =?us-ascii?Q?L3DCQN02imRh5CFQbHui4EEX35wGkunir5WmLQSKV8gARj7rYFp/JWOqA34F?=
 =?us-ascii?Q?udiGZkCguU8OpaTvIycf88Ar3L+wWnxqNVrYi+NkuvY6OZgy2jTAP1RUS7E8?=
 =?us-ascii?Q?TqiSKBiG4/ETWZEkIbDFUfg2doMuXUn7LpS7MEeS2g5gqsEuB7N2JJOJTUC6?=
 =?us-ascii?Q?dBFPJHBmXGbboxYo3hAGbuHmc5EnrW5rF/oYK0C5R9oQsbd5nQ82AjktPrhT?=
 =?us-ascii?Q?V7RRYqkRJgMbftqlheodTs/QFW+Te+DoMQV3FBMj3hCTgijxNypdmAb1GWNC?=
 =?us-ascii?Q?vY8fTQaT1GNVOHFlG0fwsqfpOrR+4ucjB74O4bKwim1miTAsGj8FTwezQZUI?=
 =?us-ascii?Q?4EvKtDMkrrsTAW2OV4Hu2SYJFp9j4om8tqED3+neqMe8SJUdLWhRRgOsbWwp?=
 =?us-ascii?Q?78PjZg6tnPHetITlsHW+KJXGc3gui6ytz5vzLl3UG49A9Ls1Yto3CrJ28HKd?=
 =?us-ascii?Q?/LUvmi3TPghca1b5g3IGZLE3m8wLmYm/pS/jvKDU4LN/h+e40vL+vzYNGPCz?=
 =?us-ascii?Q?JFgelh8y7dCM0DjvHo1EKuDi5jSk1ID4n0HEFaDd+9vS+l/Q7CnsuBS24fn3?=
 =?us-ascii?Q?R7lQZmTSuDak/M03CJHVQPHaaLV1LQxLoYbr+ZXjTTHFPgwOELoLNQIpPLUU?=
 =?us-ascii?Q?w5Fepl7xFfIOJGULib1KCKV5pda38PhfZybtjyMmW9SrkX9AXvNd36LCyEwG?=
 =?us-ascii?Q?f+Sm77JMtEsDvZ8/hI/+5rfG8FpNmmyPBSUHFAJrvueLC3KYfXL/Y9z0TwTz?=
 =?us-ascii?Q?p9KjkdaH7QWeOdUpszKZ2TuT3mFgnJEd+AiyXAKeQwif9KQQkBi143uhdHv5?=
 =?us-ascii?Q?j6V7DXbRboNBPXBmWc8WKvoymWXwsUNQYPoS1bNR3pxZtg2SeD7e1Es4+bYB?=
 =?us-ascii?Q?MpHAMevCAHzbKnDuPShO84Wfnlb47dn3?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:07.4877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 261cbd1b-6220-4db6-ab09-08dc9fb1c6ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734
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

