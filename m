Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D038A78AD
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AA2112F19;
	Tue, 16 Apr 2024 23:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bAsn7GE9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08853112F1D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0IMWdMO9xxz3q96U6ZNM5E3Zp45wpU6YuIfSQ0QQXA4TZ0ZpO+xXmoSE8GEX9xpKob7tJik2bQmFqhu4fadBiGGNJh01LKDXt96w0eLj9VsuNff2pBhPDTDayIljofMb8Mb1vzN5+6DcRjmxrHBORWmXdUCz3xCv3y4dU6qzEOp6iuGQexvKlqUWMD9k9REXGEtdSK71RUFM6vSDvW+M3Ef4gKflNC0W7jpaJ4hwB/GtIucFbp3o2oy0lTN1ovCq17hYIzqY63j5UenSOROJ3VLXVHq4iOS9+ysdCedEiNpjvYYujDcOhsNsr8m5W5/IIRdt9IXxm2B3UCe/7kLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhqBCsbMAbjUU5vQ2/3I0Vwlu/AY06oJRMWFlWd1vzQ=;
 b=JnDcDJJr2tPkO/mVbTD0TTrlOzPSNSDVcRZLa9v8Zgu4dIKiAxTF30s16qJzIQrFjncIeHe5GzokZpaOwveIE7sQgESxiaus/xCk66WmU8dSzD8tUaQqhMDnIQRwnIFPJ/JaAdmdVMGAikCb07aZeatUA8WufVzsvcI0lKhjm5ML5IKVaZ9RxRnYz6b1o7kVv6Jc72XLv8KLSF6kjTd26lDudpxohbmP3Yuedd+XOeTc5DQjiYdsImvxE8N0Bi1SHLhfA2FSCOUs31rI/OoxQyVYHUwYRna565XN2Qn0mX9wkcQz8O0ByQXWJ069BUIBvGF1NJpn83E0lyO0Oln9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhqBCsbMAbjUU5vQ2/3I0Vwlu/AY06oJRMWFlWd1vzQ=;
 b=bAsn7GE9qm2xTfc1CoGAGQTmnATjLGc3wyIZLJCTqisUIZl4ksetTpUZcL3p08SrhUXsmi24+s0ItiGnAzMcoFKa8SnD+Z3lL4AUVoj91R1tzMTmPuCgSwrGee4cfR//Ra9uH2Y7dxeWCXOJY68tzj1s/d+LqbfSpmW28ngA56IZRDYXC4FyWPyE6r9bnlRetnXAvv8dhsJ4m2x5+q6dCclBgSbnvCYDYZgqjdmLkeVDJlHE+X0z92xgXFFOfyOu9M435VYZyM13TD+ECrx8vPMcqgBWejgBI4HGVyEtuTA3e8m9EkkRqF0/pEHTRSCqarI/VMuQpBly5t1zhlH4wg==
Received: from MN2PR16CA0061.namprd16.prod.outlook.com (2603:10b6:208:234::30)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:00 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::6e) by MN2PR16CA0061.outlook.office365.com
 (2603:10b6:208:234::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:40 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:39 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 008/156] drm/nouveau: replace some void casts with chan->cli
Date: Wed, 17 Apr 2024 09:37:34 +1000
Message-ID: <20240416234002.19509-9-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: 90081b37-14b3-4d2c-7ac2-08dc5e6eac1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +L9RuhEzj2YiIeGcnuEEANHAhl/TtQfE2L2xedvF4p5CY4D6LAmi4GRWoWpHqZ0xQJeMkW/g9HENtJub9m1cr6ORztsb9hqdqCGUna4iKx4aPxwg3l+bvNOEWZZJ18EqNBDpAYBw5gSJzALuq0LfD3SqyEPkjNEetBDspnCeHqjR3kUTnUCt5G2t+zRRO4umLM0hgcpmxV2z4x4FBuUwvj4A8E1VCv4lcLQ5gGdbWOAOA4VHAeR2E7lph54kgJAgf/2i9GSZmQ+VdBJB1PGU+a0Jz2j5dhXSmKAUa3LD1yvx6bBRn3Hb7auPdC7MwpJLSlU+ZUk5YvN4DAvuWY2oqfkVsoNLK9WJ1KBED7SKnsnY3DKh17oBVSKYaxFqJI0TFe/F8gVEuTbkaUpr+8h26/LFKCEn6Gec01UNeIxvIWJD7gsyrI7Ud//s4or8BIT/o9srvBIgchEtitfA1AsUATz38gf1sv2c+8UPOvhyhXhXpLLC1pZALCDi6FOtc6/T2WLV0+a2FtWRTxUWfrm8s6Ezilee4mPaKgBZQEmlwDVKlbKqRtRYfrrf7j/C6QS8w4LNoWnecYfZmOSDyTsmOP8Hnfhri7UGnk36VeWegObYhfvG3bDUVZ1v5vRjGCRpD0uGxUXIFmzIZspNyRKDb0/qHN3m9nzbjz2YvwGHzkj4FOizu68el0aS2MbOptqJLWUdTPLHLL2qasNq6WhtSEcVjQn6V5CxsJU0afY6OB3z04RDZ/Jl+78cFUadKSUx
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:00.4894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90081b37-14b3-4d2c-7ac2-08dc5e6eac1f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

- probably a touch safer...

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 8f2fd5d9dcb7..3535cf571300 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1157,7 +1157,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	chan = drm->channel;
 	if (!chan)
 		return -ENODEV;
-	cli = (void *)chan->user.client;
+	cli = chan->cli;
 	push = chan->chan.push;
 
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1e2d28fd10dc..e1483fd5d283 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -865,7 +865,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_channel *chan = drm->ttm.chan;
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
 	struct nouveau_fence *fence;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index a5eeb6e76ff1..ea8db569bd1a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -52,7 +52,7 @@ static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_channel *chan = container_of(event, typeof(*chan), kill);
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
 
@@ -66,7 +66,7 @@ int
 nouveau_channel_idle(struct nouveau_channel *chan)
 {
 	if (likely(chan && chan->fence && !atomic_read(&chan->killed))) {
-		struct nouveau_cli *cli = (void *)chan->user.client;
+		struct nouveau_cli *cli = chan->cli;
 		struct nouveau_fence *fence = NULL;
 		int ret;
 
-- 
2.41.0

