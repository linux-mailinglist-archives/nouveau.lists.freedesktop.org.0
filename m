Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3892AD66
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BED810E470;
	Tue,  9 Jul 2024 00:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ts8CgDvS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FD110E472
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRTpVRQuCTdpgOA1SzHJs03XY+M+9FisiTao/p7HHHzbxZDDs0Ac4Y8p/r92QLXjH2vHYVyJUKT5sfKEQRXZzEzypu1J08wguJcnlGcab9qGZj4B3IxZoi6OaOrAmGrik2bixXrwOmFwbD5flDKdPVneQKh7/8DcgmEvenRQbsner3kkGQp2dHRPgCwi2lRRj3Wt0BgCpLPZw8o55f4/vhYDF/TNpaYypd4c0r/Z+cLDKBHaflb5WyKtlKfNgWgksQM8g6+PV4r4zPUsxLkBw6RA8vZOXGMwtT77U2XVmjHXk4btkqkQmzC8N81LJ168mFqflsFCBkxuxFLLAOuKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQv/92oXu/WayFkLHNJZdxPYZjMIkDn+qm2sYac7EwA=;
 b=Sc442p5V/prpXyfyKm4g2gfXIXjP9HkiVWBOWKLpPPKJwoTy2jLdp3JWbmkZ6FNVqvcfy3LhKiBDQEfx1Urt5pyeSOqT6FXyStR7uRqhnDwqxcxCsbBD2vKHbmolcKbVf7CAaSfpe16jHaezo/UPfcUTtDMb3vTrfPLwOR8L3FrYUNMKgbS3S102G0HITu4RNMnNI6yP9/o3qSma471GBjV+N6/j5Ys2v7JReKKtb2h7qjxhMw/iTg4IqPqP3+5X7H2KhvZR+ppaagPbM9H070II7wA4fA1PikLLn/PHTpK2TAuuwfibv69TEBp/ME09ffuPDrNsLLlfYqzXcX9wyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQv/92oXu/WayFkLHNJZdxPYZjMIkDn+qm2sYac7EwA=;
 b=ts8CgDvSoBBMjl2t6q0dikHg3pGWNK/t/iyegysjWbO/GIwy/UkpJDL8u2250yuEBNVmi0dhZ54EF305lBTiUpO2nDmE3Kq8PnMWTyb0xXmXnKMJ5MjKPYVWSEFTPjVKzSvFO9UUqicY68Y0587I42D7mrb+LyHIUiDDnjDe0DmYb23x2rAybRUdZDHSfwB2GIsd9VgX4bzst+UmG7Bm/FZFs1VVhp1c8Mb9iY5ftI8HCjvrMr6wrHxLK3Jxsay9G85XD7kZ6cDT1MY9Z6UZaWmFqDBAIxnILl8wwer9k2UngdJFv4hM6V5pKcj+um43m6gC6VJGVOfqOC7aJ7jYnQ==
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:45 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::16) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:45 +0000
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
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:30 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 32/37] drm/nouveau: remove nouveau_chan.device
Date: Fri, 5 Jul 2024 04:37:16 +1000
Message-ID: <20240704183721.25778-33-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: da7619ff-4fab-41d1-63a9-08dc9fb1dda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EzRNSc9rO05B7fX3sChG3rk5KDifMNoFyDj+R4n2mrYRV4XS0PG2IgJvZINi?=
 =?us-ascii?Q?FBfCfNhNbRbyu3qFUxUOyjcvcSNwnjmH8RSd8ZlDFsKBUCE+w5iXlEO7AEQV?=
 =?us-ascii?Q?Q/3X22H+Oxam0Fahti5k1RQA4uT5ZDyu0PCQB0v1J5+ORqH9Tl84jdJ7G4HM?=
 =?us-ascii?Q?dUkN9sTPycQ14rHJ/wnfN6szhMl97Z5FrLunczQwmvxNMey6LHqVAtNbS4Rt?=
 =?us-ascii?Q?OvAs1h3qupIAf4vRK3lmte0Ndevn9uLDxAQEXiITkexHpou06f22FEtF5k0d?=
 =?us-ascii?Q?sfMk29Um/pTxeN5OUtYUx2oGd9OmSQL470sfvs4KLlfcP657T+shazbAtCn4?=
 =?us-ascii?Q?3uCbzvueCtjQ7sfNTHlyOdxmKN4n1FqF9TSXvFnVTZVQ7FPjkl6SGhkzdHwQ?=
 =?us-ascii?Q?/rmI+hf/8XeTYLv8XQOBg2V412rgSqQhTVV55moO9ukODjthFVZ3OvjemA4M?=
 =?us-ascii?Q?P5G3L4cKhsinLWYYRfwBApD9tVEOgfgSsnB7NSQx6YQV4FzE0JQkZs8uIRgw?=
 =?us-ascii?Q?5Io6yW8tXSAtpIDGc8MCTgL9AKlJl0lROz1TlgyZUh7qrwayGsCf80EIvzqO?=
 =?us-ascii?Q?GEFpeDTD5pOuw1Gh8WHRMH3stTQplZCpTvIJiBOUvqPKNrw8zqCREkLLFz3o?=
 =?us-ascii?Q?zFJqkpVBafVHoluHTh77z8HMCNkmKv4wby3WNVEbCqOoGaOjE1N0fu/c/Uwq?=
 =?us-ascii?Q?wGfvBWcuPrVdf6rpmfAB3aBiY6Ntdzz+FSo+n3qhSvvo9kP8K9uLNbBesKUT?=
 =?us-ascii?Q?444Zz+/8KLedV849K6va7YYgopE7E2t4sXy/cC9DFO1HpkRDgI0tRLSsu1jF?=
 =?us-ascii?Q?murfNubkb3R4+Leyw5gRb7XUvuGYKD1b1FOq7o8dOLfVAcOVIaJnFQ5H0i3g?=
 =?us-ascii?Q?/w22RP/3qMq1Hc0qRsBTDvPpyP55ueIoEMlElcW2ENgIPV4phkFaNL7b2M89?=
 =?us-ascii?Q?8PNOmUcveKtzCjpCx14uxOwYn3irazkbB3/8d2YN9UDnOUP0DQhuLKx1BJ1a?=
 =?us-ascii?Q?5vLQGs3UyDDcplotw/OYuSvF3jM3Kt8r6FvDURk29YKofQI0jiQ8N/5m9YSa?=
 =?us-ascii?Q?T1AASc7PvZU2/lnomJwN8VcFcMr1hHRlJwYMrjGrAic9I349wuAUKT8otxxF?=
 =?us-ascii?Q?p/YuBsr42fJDsHTsBa0Rf99uIwgtmL1bemCVQAfe1CJIwpT0WsIzoavPxZPj?=
 =?us-ascii?Q?BXAm7jxVZ5rc836iMTmv3BdoOTb/0NtFXHvyuYzRWM/6kcXGjQuIuMXNt3fj?=
 =?us-ascii?Q?kS3C1tSws8LzjSskr7+kzagQwvQtAS44PIGJpvHq7qglaX2/4r9Re/HwzLpI?=
 =?us-ascii?Q?1ugrLMq4bg0ZYG/+KVDU3qiRjyInUIHLr+87EKBxt09+hRBtyk6VA5xBhO1s?=
 =?us-ascii?Q?MEr+eY9Ko++h23zL19vghN7fskCow6+r8DED68t3XNM9/rRnitKi3BHaWORZ?=
 =?us-ascii?Q?L+Xmo79zmwblcv7DV8IUxjRZOTeJx6S1?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:45.4236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da7619ff-4fab-41d1-63a9-08dc9fb1dda3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
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

nouveau_chan.device is always the same as nouveau_chan.cli.device,
so there's no need to store it separately.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e5c0d8526e46..b01535ea4ea3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -157,7 +157,6 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		return -ENOMEM;
 
 	chan->cli = cli;
-	chan->device = device;
 	chan->drm = drm;
 	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
@@ -364,8 +363,9 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 static int
 nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 {
-	struct nvif_device *device = chan->device;
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_cli *cli = chan->cli;
+	struct nouveau_drm *drm = cli->drm;
+	struct nvif_device *device = &cli->device;
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
2.45.1

