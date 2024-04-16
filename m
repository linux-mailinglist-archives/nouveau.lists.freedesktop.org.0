Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A779A8A78B5
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FF3112F29;
	Tue, 16 Apr 2024 23:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sKtuOOco";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5AC112F2A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYdC4bCTJLSyN5LecvLgd4tlb3WTmXm+TxfpRUXNY+IPmqJozssUoP8y/D3wfe/SRH1DNO9uK+2m24w8cgpIOzRZYD6hmqVq+zfiJ3XKm4Bviu5jvCUq2O5eL7XDivdyFeKShNZ7osh5QsrUelzBTu1jYQ1FUxdohxJiYYOtz24qGMD3U7Bvs9ulsPTqHwzOO9sfmyWRJTuuQUmdFdxZqF9enLt4IZSX5pMpOlC2iw3eHR9iGYa4FsN1hIS1VZVIw49dDmOaNsRqPQWQbFfVDWGVdSJL6WsBjeE6piVpelFqydFWmaKf1fLZPHCaUkDdO11vn+hP/SZsYdBmhV4vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0aBrJPwpJlqyuzCoc04UosdEdL1e/BqBCBdVQKvr8I=;
 b=FpyO3SOiEljUv62LWhkJ3qf7u3SFp3zF2t2E2YTj0IwZtePkVO+h7ayy2+H+ft3EGpJ+cXx5TDBjzGDA2Ptm1Z7amVfukajNr8wl+IfsGAJl1BsUA8GgueKBk0OvYthnES+reRgdk9Yehc3E+ka+wbGS7RyUhy9JgEfhWOJ+zXDh5kLax3z53MZnRSPxTvr8CDKYB7f23RHZb5BjoDVJeq7rgqtdWxTrDfNHWCej7gpbYUl5skwi2yG8I7IYE2xG5KAny7vqqt2rPvO0HH57i41gqu2VVsaEzxzLbi6WCSLNSfeJddXLl+7HPbn1XWKUOPfAhMD0x/QdU67bf83C2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0aBrJPwpJlqyuzCoc04UosdEdL1e/BqBCBdVQKvr8I=;
 b=sKtuOOcoZfCVZ5132UYWc8GSCIeh+72sLkXSvs0LS/wGCGWhpCt3dqJWOYlwvLR4wBvyG5eK9oRgv/MADMr4CVMzhS5e63vJJZJJZNr6IjUrqF1Z8Oej3Od1H9nSOyMDBP35YhGzwH6w3WbQ/fqEspMOGmypwvwgfmOpQa740VWntEc4oaJdEPQVGKW4WokYDFJmhwceTAsEploUfQ/uJjRg2N2QyAnFyP9mEcUvAZv5B3e7YHiqMdl4JK5R9lhJOWEIprz+ZwzQy2VsekBFaRYfSNb+RSWc5EXUcl8M9cx83ISCOkeN8zuVXaVjKj1J+AzxNiAPEi5TdpOtFvcY0g==
Received: from MN2PR16CA0064.namprd16.prod.outlook.com (2603:10b6:208:234::33)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Tue, 16 Apr
 2024 23:41:05 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::e0) by MN2PR16CA0064.outlook.office365.com
 (2603:10b6:208:234::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:05 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:45 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 013/156] drm/nouveau: remove abi16->device
Date: Wed, 17 Apr 2024 09:37:39 +1000
Message-ID: <20240416234002.19509-14-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 11598014-2731-4ee8-d055-08dc5e6eaede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWtjQR2J2vzWD0alTMmJ0pCqwL1g8ZSPWlJnbcyzl40D5LYQVDzFBsxoZMHVM/6VgiJMVcqnHztLRxyN7nOHv0vHV2TdOR000/3HoMfgWc8rn1qj//tNvFZdMGVNG5zUhhULSl3Tq6qfNJzeqj56M4jLfiuDyvWEG/iv68MZBBN8ODoH51PgnCx4jlZXXU7GqtlH/NiDG/B/W0hOSI0EmCdM9LLyK0oik2IBFP8GSQXdfizSLVLFQxSnA57ciH5rBbuOMBXbTL+A8509PJVjeB5Fay6i3Em4cElqXk7RLkgeU/wykscjy5n1pyxHOvspp6ynWjTUtYmyncBF72ktypzq/NmrG8ksxFaT7hfwUv5POdYdp+Y43TDQbJfoH2/Y6Ko/FlGQC9Hx2D7T9EQvQ3xGsaHI2g53MIzgjHk+4+TGAY1G7Tyh7nuoOReClaoigqqN8LizhWZZHX2TI9JI5BRnwYO9EUA4vWQM53v/DI+ZXJlsxnUA8M4pCGcAotMRxGMoR1sfkAO+P+uFMRoyhbmCYEVHxKgX4ggrzXCdcwhVIqJn88BBRlP+godKq5Kg9pT5wvvB4M4codiSbURIqpqUhFJ+EQC4SN4MdALAROMuOYH+OEQqKbOLk4UKz/ITdNQAo7rOOr0cMpfRXURCAkOjQSKGMOv1kWzQSI9mEl84Kt+g2sJ8QiUsA8NRzbxfW12XIjRYS0lOBbbPgmjfHTdcUitr6qKPx0Tt1ApRWZW2uKlWm+B5q5G7rvlxkbD7
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:05.0987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11598014-2731-4ee8-d055-08dc5e6eaede
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941
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

- not used anymore other than device info, use drm->device instead

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 24 ++----------------------
 drivers/gpu/drm/nouveau/nouveau_abi16.h |  1 -
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 5341d96ffc85..5ebd19ece13b 100644
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
+	struct nvif_device *device = &drm->device;
 	u64 engine, runm;
 	int ret;
 
@@ -368,7 +349,6 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	__nouveau_cli_disable_uvmm_noinit(cli);
 
-	device = &abi16->device;
 	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
 
 	/* hack to allow channel engine type specification on kepler */
@@ -634,7 +614,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
-	struct nvif_device *device = &abi16->device;
+	struct nvif_device *device = &drm->device;
 	struct nvif_client *client;
 	struct nv_dma_v0 args = {};
 	int ret;
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
2.41.0

