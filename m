Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03990ABA720
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9710EBD6;
	Sat, 17 May 2025 00:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h9daBQOj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E11D10EBD3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xENNOJaygU1ToAt9kTML74YLubIoclybjS9a9bAi5tGGs0ptZ3YuTneQ1jbyJQTi9P7we5bAcapHKwJTWo19lLN8hit2a9slKuu50PFfPIjkWWXvO6brGSSkmRxCd3ber7cZsLclunJ90M67nnJN8bBIA7Rbsb4XuYJL8lURYNyNMxJG6JJ1pjJwnC9h4WxoEBZgl2oZshHNEvJaSxBDmsGBq3qdy9vr9HdeYXs4C7HsZC9JK7XUR6px6SVUcox8+ZgdVZpLHkXkRnX/Ptv309zaFsEDSA7LxTJk/5COrzB5uR1XDFxSKR25jq4nw7zQRgpcvqoYtu72z9NTaDcHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt5k/TQX5KGIJZ1EtVBgxRcxi8M4BqbbplIGOEL0FFw=;
 b=Mcvf3OtTWqVrY1iHVHls5CVEVHVm4wAp/584cll3CS7LygmhiGeV1GQIyIQrNch1eOKZy1p5HCgGj2hmR5VBPidk/jLOieNU7ADAUG3vl8ALqh5zoro4KSc87hnkelmbM2ldqvcHxrud8YrpgAOMISmR2rcQuGszoIXG+yz67r3t7qKctCX7mL+jYPuy490F8fbdx3vnN3BffODEkhCTu9LNNaQ6iPFjAGP4ZDdl+JxclJMrwiNLtNA/z9GfaZSshAn0vFxLUNGGmd3VkyayBQ2tDdCh3Vr1Q5icIYn0qL4YK2qcXrN+6aCfJVRvJbGMpBOAEqeiPjKJwu81n0sKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt5k/TQX5KGIJZ1EtVBgxRcxi8M4BqbbplIGOEL0FFw=;
 b=h9daBQOjk0x3aNSjUuZtuujNRV4ZGGCMn2X+8A5mMOY3Pis4GJtifPteI9cVvOtqfHteOPDg/zSLJAzr9bb4P5sPKdjumdR1r9PHktSVZCKkJnGrOAKf/uXG6QyhXcehSL97bBPCn/UC8NQjICTX4XdyHvelfaytUfocTJ1xmGreptTkkW4cKBQiAFqwJ0ptWjaOuddEd+y1uuJMSiFwzjp+GXEk/dhvVcrqMCqU/Z8UkdPuReBFbnvSlxNP6rWgxvO3PCGvAfD1mJEgH64tkR8n+xtFUZOqgJGVno9TjB4gDqH3xK3rknybj/Csgxe5u56UpqltnKJGGEAcATn5ig==
Received: from CH0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:610:cd::29)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:11:21 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::48) by CH0PR03CA0114.outlook.office365.com
 (2603:10b6:610:cd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Sat,
 17 May 2025 00:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:07 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 40/62] drm/nouveau/gsp: add hal for fifo.rsvd_chids
Date: Sat, 17 May 2025 10:09:32 +1000
Message-ID: <20250517000954.35691-41-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9c8c53-90e0-4d93-4e9f-08dd94d75a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gwEmTnAmV7nMRnZF6mglFpHlIneFMNkb086IYjYwVP5vvnWQbO9k3+F1KS7t?=
 =?us-ascii?Q?/LZPFb7Y1Fw4a067nNInKfQ/x6qvkkUoEvNtzjtndrntG8uwzc5j7qQj5qyZ?=
 =?us-ascii?Q?a5EOvsKY/S0mpxmfqLRuqmZyfVJun5bwjXe/KSVS12G5WEIuYrrARZ8LlmRV?=
 =?us-ascii?Q?yA1ejd7qyh/v03LZp6cyX5ref8wZUK7iTyTU42Mt8buzoPyY0cHgkXbkOyDG?=
 =?us-ascii?Q?LgAaDq6Ll5AhIe8AuJlmL47R6EtKXIzcQNHjlKnqYKsYDCSLtVr1D6wtmi/X?=
 =?us-ascii?Q?e4HjcN3XOMrOwoY2NNt8BTPqHMTstmvh3uUqp+Rx8RfA6mx1BtDDGFOVlca5?=
 =?us-ascii?Q?5gH38Ys3B2+8++6WMLIx7Qn/eg45RuKUGGMJGH5X0z2kzM3rrRndSr4q55TX?=
 =?us-ascii?Q?RV8ve7jp4+s0Q+jmsmtSeL//qQoBk7/ZVLQ6TfNQm0RbC5j23aMcEO4EYc/U?=
 =?us-ascii?Q?x201EeFVwn2xu4Ne56RaTjToldMRqyXiv2twG8WKzi5ZRJADF9S0AecoD7FQ?=
 =?us-ascii?Q?nHfHDpv397SBcUSgECup09LPS+a5aqIVmognhD+DVFXhXUvBP9PCs0s2BdW5?=
 =?us-ascii?Q?VPlPITn+yd4juSNYVT5cFFvyCb8hSlXZ5jOasbPfouhkDsixiJlQiAGm/nU6?=
 =?us-ascii?Q?4fti+R+/A2SVVjIoYKYSGKwovwL9P07RvKwKPwBMFGZ1rDBqlId5koBPgH3k?=
 =?us-ascii?Q?dUvKk1MaCScndngEVcF1MY3JDWf99ui/+t9Smbh/bwYY0Q+OiiJIyk4lVsSq?=
 =?us-ascii?Q?ixcECcy4W+syhh3uTGEDVfwcy6v75SHcaRUo03yJYDJ8lqM/rwOl2G/IpGpo?=
 =?us-ascii?Q?5NX1dZK+13/+YRcdL3ZxYv7w8RU7zHjlZyKsN3nZ/FUE/iQ1m09n/h06d761?=
 =?us-ascii?Q?vCdF5a54qT1L8U+HadR+f1EQgeNn+eYwGNPNo9ZB8DXBJDr36BWiHxjn/wIk?=
 =?us-ascii?Q?VCKBb1OeWlXMvaP2i7cXQg+0JPq+/yEAPnirHmQReFsXl5OPeDAN3WVsS/e8?=
 =?us-ascii?Q?D0oNEMmGbZj52MwIqWEXZSnfmdBECPIYnPPEvCGl8cDON8dP1B3uytrYbiCK?=
 =?us-ascii?Q?3seP2w2I8CIOra50EotRPbRh5PSu40ZwZftShFFHT0qP3SQmb93cZXTxCpOs?=
 =?us-ascii?Q?FfDDB9PWs/AFgixlN2B/x14hSxynW6GwCDu59IB1oTH+T1/wf//+Os0THfOn?=
 =?us-ascii?Q?fzFn8rkI4XYX27EoYYtsph8C6kB9ErOzmvP58FR6t6buiXJflvtl7Dj28TzC?=
 =?us-ascii?Q?LGuT/qGey36Zi2gOFZL2Lv7lRkd5A7hIGvPaBJL+8e+TIhdw7dSZukCBczrl?=
 =?us-ascii?Q?+T3v/+ZArAGBdy/xBUFGwA1yaNvRtQcsCSBxhqxEqN5GN/BrmS754a5Rt9PW?=
 =?us-ascii?Q?zIBNWukxfwxzNQ3luNSjwhZL8qCx/tfesa+p386mEENNwYwvWS+OoVzkVr54?=
 =?us-ascii?Q?7Saabq2gQJKOwuOBNBkA2fAT44Zg5TJS5LykcHcVpmQCWFcYPEtlE2KM7Mf3?=
 =?us-ascii?Q?+hS9m9VxmKybxU/WLUrd6MDMYtxq+mfnbwXG?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:20.8882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9c8c53-90e0-4d93-4e9f-08dd94d75a4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362
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
index 645706179913..a480c1a5686d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -427,13 +427,14 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
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
index cc28de66cfa3..9e97b7b1a0fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -298,7 +298,8 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	ret = rm->api->fifo->chan.alloc(&golden.vmm->rm.device, NVKM_RM_CHAN(0), 1, 0, true, 0,
+	ret = rm->api->fifo->chan.alloc(&golden.vmm->rm.device, NVKM_RM_CHAN(0),
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

