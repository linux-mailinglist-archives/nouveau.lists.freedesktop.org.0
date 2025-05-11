Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9634AB2B6E
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA4710E24E;
	Sun, 11 May 2025 21:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ucTfXnKA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA47A10E255
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGyejx4h4jkzuPZ/rWM/LlnSaihxXL1BAPVpCYKfWuepzODlLncJDnR236Oiw69UhIFp2/RRIwqh6mvDg3XAwUQwAfusa8XL3BzK4fr/78b06m+qncoScQDM2gskCsE+tnWvhZuIcqp8UabrdRuhM8MnnhODdTY5QWeChjynaEf18JH6rpvP5sCBEocZh+8SzVWhoIIsIn2DpFLexl6RM27kWd8IN6kBIMGN9k+fYANT6H3Bda5FeIaVP8AlEoTfILvlXd+ZVC9sKejzfY2fkMDQ9Ts0hHPtvEGA0yqaduHqqNUarRv544s+tPlse3j2uPn9QcvbwIPXy7LgnfHLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP4IvwGbyMuLvMswYFiwvqYXOFQW3pdLe2ZpWV0oOdE=;
 b=u90Zwcx7goDqIZXkliwc7dZzOJIb5MPuwWKKgzPlaf/r2pYjT6MF9X71QKCll2WRcUzAQ8eCoJ+3m9cJr0yS+uZmS8or4roAU60Qx2MBXS5xiTSWDFt/a+4jFl3qIfaD4TwodnH9401ZIdv5QjdQmZcsXFHIb5NNjsQnq2Yw8ue/4qzkijvujcImfCobEmDVMIHtfoZmtlwhbLR1ClsNPckvKAsXCEm4ccI/JTdx/U4sBO3cOGd4hi7CKobjoTuwqFooamtr5Guu5V096OUldGPyCmKO7UMF0A8EiV/oQdHiaCsbYmKQfKZSDAzR6937982SLyRxkgsqCHwIdnKScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP4IvwGbyMuLvMswYFiwvqYXOFQW3pdLe2ZpWV0oOdE=;
 b=ucTfXnKAhLgoLe2DK3wBUsMp1NxCcrDT8OogI7g0zXZ61546fhPbAtrXA9j1oKbF9wrgRHAc01qmzl4Z6BngSv3BWkAiA87J/sWUkTsIK4un2KhKjNZdeWI8wD9kLXyPvM7OYle0oIyZWRHTIWrhy91xTJyi8eR+Z9BXNnx1dp7L5nD/03s5bQGnW+fjQESljfPxbex2fMnwII9kg6/i7UKvlMBwIvwDecVxkDR6TooRh/Hf/yrQx3F8ih1b/lQl/PLW2zBGhNvXi5bGtiuwPgzjq2SKBm8AkK9ASDC8OmCnNU3ismCHFoxItq0Q1Kf7TMEvcvhUKok3c0SpkqkP5A==
Received: from DM6PR07CA0060.namprd07.prod.outlook.com (2603:10b6:5:74::37) by
 PH7PR12MB7212.namprd12.prod.outlook.com (2603:10b6:510:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 11 May
 2025 21:09:21 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::68) by DM6PR07CA0060.outlook.office365.com
 (2603:10b6:5:74::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Sun,
 11 May 2025 21:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:12 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 41/62] drm/nouveau/gsp: add hal for fifo.rsvd_chids
Date: Mon, 12 May 2025 07:07:01 +1000
Message-ID: <20250511210722.80350-42-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH7PR12MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: bb516eea-5c96-434f-2afc-08dd90d019a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SWWVVX5Sf02ZtXUGWHfSJnV4T8Fe1vWh06LoFJ6xAEqc6bQN3KcYAMC2bOS5?=
 =?us-ascii?Q?IuDMm2IF2r4Z7njoPHREipX/n2DVgFHtMJ0WfZYITwiZOEYj4Grz8NlbBa9M?=
 =?us-ascii?Q?QSNwBD5Q+eyP+EVwT4j1lWOfv8U4EFErrQPGiHGEE9aJLO6GXSUvrVcPgNIB?=
 =?us-ascii?Q?keloCfa5+Ulz/0YqlWLrh6ZGyvrDOdUYoBahprjvbRVoyNpWkRVjHkzF0tVe?=
 =?us-ascii?Q?QjyJgWWaFTsCuBIcAcThDlBpZOTWEEcPWLYxTkJaFAJoe3+H0ZHKlW3kZxAS?=
 =?us-ascii?Q?AdYxtmwwWHan65cr4Pf+BoZjwAoNBsVjdw3NUF5l1YWDXvYBqKO+KIcHVEzT?=
 =?us-ascii?Q?pBzwXAGoq9/FiUTBUJnf+J4kO/e0AS/27Np846cyeKbGPGHNORKu7SrOxX7G?=
 =?us-ascii?Q?/e/udJ7usXD/IKW4tg9swDyEjqNbAkLEFaL+e7SRG9j7dqbBckRAXRK0nstK?=
 =?us-ascii?Q?ceXk7IOE1DAB2CCWxvHc7IkvjfWiDT19QRcGBchkE11Kxg60x19bQElB9zNC?=
 =?us-ascii?Q?Ub/CltKr1I0Tkelyn8TQiaHBvSaY/XwvNqJ8t97voc1emk4VN4udieDrcHmN?=
 =?us-ascii?Q?lSgxXY6dQMZ48VzSeVNkwljVdz3uGo2xprAEwoQ7IKEe3Of7IZA4/3t0cQm9?=
 =?us-ascii?Q?U1h2YUqCQyNzmDh7d8hGPIxK0JMQtAuTF7YNbJPheAczI9dJ++YrCrfGNkQn?=
 =?us-ascii?Q?uXvRLb/zJPBMpRtzpcJZlnzTmUL16kDamnCa12XjGWk330jkS7bw9hZYJkzd?=
 =?us-ascii?Q?A3ZDtnrH70lG6m+6vk5KR/yLRzjO0As+lJgypqZu+V6HUwVApFcyOkXyZOh4?=
 =?us-ascii?Q?26yWNRRgCKtlTVokLgTzfSPYvlSERu4j00GRFGjbTkAPRfBgkJHwyo1P6ec8?=
 =?us-ascii?Q?5xy4QWRWSglRRsvcNzBS5XGrP0B5dCLRx+6QC+/vkOSgd2mUmklBaA2QVBTg?=
 =?us-ascii?Q?7j5byfpR/LcWcv2K4wg5ODZL4pVhui0NjmItWjM3eUg68CELSotLeMBGDGta?=
 =?us-ascii?Q?/blUcEjpuUq/jhjj4hePVwhkpWi1Om16dU0ACGc+cRthJ0dHri0paZQmqU9h?=
 =?us-ascii?Q?keBLC2arG/SMqeGKWNDxrXs/bvao28WOf9G0EYDwiFEcs27c7ndm3aobB++j?=
 =?us-ascii?Q?fsSVp1Nm6BhtlCgxWtZrWa0CexPHlA2no5Z3M9z3YvqrIksKIeEzqnEwCkAf?=
 =?us-ascii?Q?qlubotTfhPG80BUb6px2o6Xut5Gu1faCgk1bg5TtgjnzcsxHuEZmY0X8RU5t?=
 =?us-ascii?Q?IPGlqlZfmGqEYLScmQuLbNBq0DNzun+xJDH3KjWUy1VTCdSJUQjXis6wdt/m?=
 =?us-ascii?Q?ES34xz30ppwRShA2W1tdD2bVHD+s9rhAMqcbAPK4G/NeYYPw74LKfuQ90B5V?=
 =?us-ascii?Q?+jHQcBJJV1cfWhmvYGa2PsbPz+c6SnwB/2dvDa75mHG513vC19XJHZ62/MVR?=
 =?us-ascii?Q?TUh5C3tmB3w+dPfOf3Jx/jY4HsEDGn9Sv0Y0oyEuBJNIUgNi8qsZnPaQy/ei?=
 =?us-ascii?Q?Iq3LmKhiB9tHje5Oa8Gp+JZAMfIHuQsMACSp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:21.3085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb516eea-5c96-434f-2afc-08dd90d019a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7212
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

555.42.02 reserves some CHIDs for internal use.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 7 ++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index a9d3979de4b1..ed57d311bac4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -542,13 +542,14 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 	struct nvkm_rm *rm = gsp->rm;
 	struct nvkm_runl *runl;
 	struct nvkm_engn *engn;
-	u32 cgids = 2048;
 	u32 chids = 2048;
+	u32 first = rm->api->fifo->rsvd_chids;
+	u32 count = chids - first;
 	int ret;
 	NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
 
-	if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, cgids, 0, cgids, &fifo->cgid)) ||
-	    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, 0, chids, &fifo->chid)))
+	if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, first, count, &fifo->cgid)) ||
+	    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, first, count, &fifo->chid)))
 		return ret;
 
 	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index b86c5012f6ad..1ef2919ced9d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -298,7 +298,8 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	ret = rm->api->fifo->chan.alloc(&gsp->internal.device, NVKM_RM_CHAN(0), 1, 0, true, 0,
+	ret = rm->api->fifo->chan.alloc(&gsp->internal.device, NVKM_RM_CHAN(0),
+					1, 0, true, rm->api->fifo->rsvd_chids,
 					nvkm_memory_addr(golden.inst),
 					nvkm_memory_addr(golden.inst) + 0x1000,
 					nvkm_memory_addr(golden.inst) + 0x2000,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 29663dbe99e1..a370beda3c71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -101,6 +101,7 @@ struct nvkm_rm_api {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
+		unsigned rsvd_chids;
 		struct {
 			int (*alloc)(struct nvkm_gsp_device *, u32 handle,
 				     u32 nv2080_engine_type, u8 runq, bool priv, int chid,
-- 
2.49.0

