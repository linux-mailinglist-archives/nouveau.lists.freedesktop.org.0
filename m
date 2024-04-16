Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DBE8A78B2
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC479112F28;
	Tue, 16 Apr 2024 23:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ncA1KFeX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66180112F21
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkACTytsuOpMlH5wedpcoGXl0ub/1Ju4cpnZOfqo9dKF1JKQrcjZQhhJ01biWjdC7q5TVcxvf2fVB5ECBb3ECI7UElx/A7iXTj3k1xTZWAqJtcKLHJ7kNrhvzWgydC1/5p5cLewNTHbcisYH4mMbOV6OdZB+SRdz4pwPfUCONk2IopSCbRYSc+mDuAn+Dsqamk793Zh0E1dxlI/7VFStzDlthSJMuY7KlXHQQUdpC5sOEX0DZ0/7ZSEgt/Q7qYSNEDWQV/EhSgYOneVCbl32I5QLE3ult8o32LbTrg2jgEYZsdcyP6mDyBSdvJpOOiJdKpt0X/xwHwv25lhOjgkOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D6hg/A6spZ5g5edWHtTetkZTOCM6cffU1Ixc85WDgM=;
 b=Rz4MtQVgmFDK4fIotgaG5KJIRGZz7EBMCUp6APX29QPeUErAXVJae1vorpKLuf2CQFKV46nD+yUxlOHWPO3tnaT25L9yFL1IpoTrbqKGn1fHFYTPBtic3hxF2SZYmclD3beQ1+HCnplCQ0vGwzvOLLCJ3oqPkBwd1U0CTCS0032Xm/M9p2qT+/QlKFuevwaXRUGQrl7jq9UL5ZRfq5B5shakNCFCI8fU/C5EVh75mDohMRzdlQ54JxcbAdjUUSq61YPkItc513T1G8lIqQW3rnc+nG6zHjBy6aL7AUE+SgsL6tycfwKl0CrfziOvaN5+0KwnghnaReUBPlsa6plC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D6hg/A6spZ5g5edWHtTetkZTOCM6cffU1Ixc85WDgM=;
 b=ncA1KFeXdcfAVqYZiRGu1xugOwsbdXhIhxOzOWutgUW382QI0XibXAEh3Zh0iNhuh8r3GWc0+L750k9Rz/fp9KaRFV/qRq7Bg0qDj+jZvnfYfQYbfYS4glbOHcXjgBOFOhEH8F3xwuma+ok4cfsrfsfDIEiSYfx/UlyJK5+JiSlHQ+7rdzFxbgDiLZg3VHua106PBRr1b0cze0CWH4BvxrA5B8jcm9k6oE/ri5qOUk5pXzoVWWc5/t7PjSXHB8zib5I1/Wf3/G0qBQ+87PMJAVW61xqXDjG0t4LClkNr8wWh56EptIhXQQIzB3rJCSsH88zqYcYc4vZx8nBlPHl74g==
Received: from MN2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:208:234::32)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:03 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::42) by MN2PR16CA0063.outlook.office365.com
 (2603:10b6:208:234::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:03 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:43 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:42 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 011/156] drm/nouveau: add nouveau_cli to nouveau_abi16
Date: Wed, 17 Apr 2024 09:37:37 +1000
Message-ID: <20240416234002.19509-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a132eb0-1867-4fcc-0706-08dc5e6ead91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaRXeLxBy5r31CUON009PMZEHab+JHTy3HyYvru7iIcqoYFTWYjRjhKAXecEfgqyYfxOxtQ+HupfeeZtrjESh1jsMGEFyAewGR0B8ZH9YfbdZOnCRgi+cZ8v9IElTebEEdCaKO/UCmIQHOckKQhWyodpoM4yTWAGN/YT0EBVJxnIH3/fvXJzTlNPwta69T+70vCZPMQzSwrZ4QReQVDDrRj/J619YCE1aBH9o/1Ylna3m2beKBd99h0DedghGXQZq4bpxHTZh/vv/R3iyA/mh6syYiPMoJJGX/ppSBhsuySaN8XmghbscuxbZZwQ/Q0Jw6V8elK2eLJJoMr43DZGJDnry2Ucio2rBW3780PPgSH4293rRHoXAsQt48GvjKkJjUDcxR+tEG5pswrrMa0GhCpkjyaw2e0k4plV1lO6bs3U355Llowokch+N2HjrLrM7erXbman+Zyr7Lwdu6OYVZ6tztt9ctAVa75Ood+GO0NG11R/YEaT11sshejIWN4bCbnDGjqrLfTmpUieYm7oNgwwHsZyFRT0i15zGEsHMVN1lGA1nvnP8fr4eva5UfMWcEYDHK3zKxHNn9t+DB+jkATD8Cxrtj0wOS/R84n0j+MsXuksuOOylEWtR51k0eYIAouDptPtr0x+wiHQ0pevvvWxU2k/iytG9daKYFdyCa4vd5CDbQt3xcCeUgpYg30OJUFjXfB3oKBUTTbyMsZfOPcPfGDAllvzIrzOwHHndoc84pU52CNanEYDHRmGBE1i
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:02.8175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a132eb0-1867-4fcc-0706-08dc5e6ead91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

- removes some dubious void casts

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 291107ddc59b..440d92d93acd 100644
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
2.41.0

