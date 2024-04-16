Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524398A78AF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05E5112F22;
	Tue, 16 Apr 2024 23:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4PWwoHt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20063112F1E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE3zkymfXFPaz85+RDZL1CF89TXDICf0tSwj9nk7uLOT1don/q2k/wPzvXYIwttWzQ1sq4ClWrk3ct28goo8CTNNAO9FIhcJjt5QEu751QlcqstPKupgHyWWzYR+jNeanQ0O7oM1QvbkdAnHY8BU7uX4C6WTS8Ndunb9HUpK1LhUo1QY0aSnTXHA6CzpD83FTNnnnTovVTXp9md3dHoDHp7bt9mPnxJBINVRcD6YTgLwGREQW/AuTP5EwQ4Z/T/rojJrzkbnaco3tmxH8NXBZDBeQ6arwGAcGk3FwKlXkF/8MfX+x7IFaujNOhlRIckXaQl5CryFyqBowrUlVDoljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utAhcKgv3xVFbVynNnb7mg9qE4GKsCYuJDLi0lLJp3o=;
 b=EPYk3Y3sL//houG370xMPLCZxVGq9gDKjGsu5UPzdZw4CEsaB4keqoUHFeMjpgpS/52OQGFmKx9vJWO30pAz3Oj0Yiv9jW4CL+A8eKUpXzWlpWqBJzaOY8sSzNCPuDWg3+S7kEvtvsLHpqGCfoPcOMzOs4rXpO8ZqTLBqkVIiAd8SYB3bN/ELSSQysfgi+5ioa+wNACtfkoDGHRXBsryG9G/muUmFU0w25PdBI+yZT0+Wq4mscbEsblA6z/erAa/OYC9XOzGLd8cK2+mFoyg18cwnLP+Op+/13i2Y/56AKFzdq1F0OHKY7qnB16ncF/VdjsjWmcZdFGKtChCirdHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utAhcKgv3xVFbVynNnb7mg9qE4GKsCYuJDLi0lLJp3o=;
 b=E4PWwoHte0OUpRVwShfVdqItogm86blvT6VtGQzePUP/gyYZ1iQ/sIDlo/LFoORng9PZAdMP8G69nB4LYUrFCgb08iq6iYYZ47FBevJI//LYmi6vwCKMx/ITF/o4cViM7mByiDQ7y4Q+tvRzpRbF4MtZL20L0Z+3vS82RUKDyKZwzfIbcURgmrDxXD8jVWwvQhiDV/LY9MoBoetyjAyzROVbxWgIUmLp2/c3kBEEnuXdMPZH8PaxcwInLIDL9Ne01+B7d/R5O+qtucE7IZrE3TsR3XlaQtVow9gUzBaA5mupn5YQqu95R1PCxHu59BmF3+AeSMYjhS4qxNNQAI7yAQ==
Received: from BN9PR03CA0080.namprd03.prod.outlook.com (2603:10b6:408:fc::25)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:57 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::2b) by BN9PR03CA0080.outlook.office365.com
 (2603:10b6:408:fc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:37 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 006/156] drm/nouveau: remove nouveau_chan.device
Date: Wed, 17 Apr 2024 09:37:32 +1000
Message-ID: <20240416234002.19509-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d0e7c2-5e36-4eb2-73e5-08dc5e6eaa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k636PEZXWBxxbk66e8cdpeG5ieedaBwXJtw9eUcKkiMJ84cRyBaOaZM/uWN6RLGhvbu9pOpo/0YdhrrmnCTPcTAD6eD7Wk7T7FAQ9b5bzO7Yt6RZMm3ZBun98lbYQaHzWjd/WvWu19dnPVt00zcgn0NhMVr6mZGD5Kucp6rqibO02Up0VpfcfV+yuzcrn/GB6BL8H4+xYGU2dl0KedkuuUge+rI1rpxInuXGD1GCHwdD/XPTvhFb5keMBXMJTQ8/BC7qS8ssZ9PfFTM1KjxxaGKVxVsvtFaUOdCXYupphnyCvABbg/X8AkoGVUsjQl8adiPZleKyLmEKrAMVia7ZQUoeuE00qzYL7Ea5401Okw8G2D8Dd/4N3yPrumriSiucqqvr64kswLoBCcByrv9PZg05s3FBvRxvrwx7NE3b0wRJO7c6gpB/l6aKKmvXDlPrLtkflsIhR9CkhaHuPbuhny0iagtipnxAe256Aanmrf9A4Ej2rsPo9DN9fyGA4GakhDs4RkJ6SQ/7jEQmb+8EpIm+8OB7SwngE8x80mM2GMaB04+qsh2lZh3wnk6Zq81rQ/qlVSqg6bVLirroIr+TFLVNnLWiRVHIHHzN7NsAYuSt1huZEu75fk/zndb8KU0QLiQJNRy2iG1CoF4ivaJGcECJ48PPy3wMB6+hX+8tv1jnnJg6tUWNaxnVsHSzLgcZsJDpVZB71XKSGiGsOFlajBmcAAIu6a94JyAzw+qZ7NpgIA9WVCQWjol4bw7lW1o5
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:57.4967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d0e7c2-5e36-4eb2-73e5-08dc5e6eaa54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

- not required for anything

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 3 +--
 drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 290523522717..e4065b7f1f9f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -157,7 +157,6 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		return -ENOMEM;
 
 	chan->cli = cli;
-	chan->device = device;
 	chan->drm = drm;
 	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
@@ -365,8 +364,8 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 static int
 nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 {
-	struct nvif_device *device = chan->device;
 	struct nouveau_drm *drm = chan->drm;
+	struct nvif_device *device = &drm->device;
 	struct nv_dma_v0 args = {};
 	int ret, i;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 260febd634ee..18a9cbfef8ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -13,7 +13,6 @@ struct nouveau_channel {
 	} chan;
 
 	struct nouveau_cli *cli;
-	struct nvif_device *device;
 	struct nouveau_drm *drm;
 	struct nouveau_vmm *vmm;
 
-- 
2.41.0

