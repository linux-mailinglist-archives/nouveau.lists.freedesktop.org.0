Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC38A78B7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DDD112F2F;
	Tue, 16 Apr 2024 23:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EYXiW9mK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2D0112F23
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX4Y3Tw67trywspSugd9VDAprVEpqB94Kxghyi97XVAUZ8CuNF2Kpt9gwOEC5W98QII8dPcOirQNVe600myuu1HE1AuajBFHTzZZz60a1zVjk+r8zCg9Pmb6vLPu+5NfizTGTL6ZhJilMlcbXh/tpzeoHyX7J01B2Mn/O8WmWz+rpl4VkLMt3DT/bU61QmxSy4hebuLj8QClm1NAsvlOwC5TSW1f6g+Fag1BBzszWMx0Jqtq3fp8S7itUFYS8cziGtBcuiNjPQwZwsCSrTZSb8FZm7ae1bBt1D0Xqv0EFWVH9fpAaDcPZW+6a9xesehJcJn2SyQdL5nLEu9EAnQYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHv3jfOrCh/4lSh5CjTSEu+asGXNPzIyNgRqh74Ks+w=;
 b=WObV5Jq8JPaAJJ5NPybc1ar0kKs5BKe37RdBZq8sPmvasMljsNKXHkrILh0Y4CcfYUKrJfzg4xqqHdeqeNgqGbu9bocYvqISSce6Lolb0soaVmpUW/tdlKml4PphuX5MH4dJIReMfBul3PJWZNZmOdUFdhQFXjCUSYXeq2AkKObyLEYtdXFafBp50/4Gd1kWgoGXaNUc8wfDz7X/yGbWlJMD1MgYmdPuMi+S1cR062tixkMO0+OqTsHnqIL/vct3WyjrtNndY25m85YRYIBIT3I67ZWb94/dCrq6VGETZAah6gzouthE7fKz371ohivreG4D1R0dPw3zijIwV86siQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHv3jfOrCh/4lSh5CjTSEu+asGXNPzIyNgRqh74Ks+w=;
 b=EYXiW9mK0NFbcI6SYU4SZm5hMOGoX1KJncisBVJEnXybnb//QBJemPB0H7xyVu8091TyE5e2+yl/uiKD59h6nhax5bATnPyy/IsH8iGqH4TrK0x7DMlieYWxE+tM9mtnN9ToHohVDallaqSx+4LumPzJLpaJ15bKDeY6ReiZxRwoziEuKMOmL5QCJbeN3mAxU7dgru8Gx8EfCibKMn9XLkvZ3wYBIuvKFDMaspqcHJtTac3RHwTPfcWxy0hQsZhn3/NB8c7eD39yub+NKIgKsxCl7Vs/ZhkeIBL0PKWaGtys0erc7HFjPGhw3pSG2mO1KiSpjfRuNMGIoWQ0AroPyA==
Received: from BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:08 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::cb) by BN9PR03CA0064.outlook.office365.com
 (2603:10b6:408:fc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:07 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:49 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 016/156] drm/nouveau: create pci device once
Date: Wed, 17 Apr 2024 09:37:42 +1000
Message-ID: <20240416234002.19509-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b1a85d-320d-44f2-f3d0-08dc5e6eb066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q66yBBUJSdVTmIT1QqzBIZZTDTGSlsyBpTOObM2o1IVBlI4E2s81YRbF+muW8L/Geu4uFxTk1JFcZMf0Uz3rI13d4SMRglBrHPx4rM+Dnqmy6ZcFDO7JmSPH9p/CdH9A4LfOZvWaXHDLoxV+b//hyypvr8tluhgh39VCLurP2PU5e3qL4nK7uzb1y3D2jSGTk3/BOufJP1Arbsswx18jFSaryaJBlgxSU4tAdicIuhU7dobebXErjyVCYw7+xSGgilT+/IAUhSukLwUFayZhMFIV8HxqQuNed57N7dKimG1Ool8qja95C+ISY2FbmwA8P8Xr9vbTrO/JjXPMREGqUimOCMq35eSWjmW30l6FNh3n/i2Jn1qQU/K+KTSrcqZyX5u2QvrlfA7r84kGUk8ilE6v88a1sP9QsBnK/yVdd/A+W+9/AOv3XIY+wRY9Lczu5UOs1/Ns9cN1sCZMHUEkbbIVTtuheOX0XG67MIlpePG7nVmTFogmmUZH+ZtwiejJk5kLkj7YUyFUWCKfBp1gbsWtWYCW+mJAnJrRcBbOnh3n+TJxVbDnxW6WURuGN+Miv5H1KJMEqyv4STaimPo9jOXcaBJHkPgRGLjCv5q13KCN02re9RQME+7zTGJ+j5z6vPBNXZ9qo1o1F2kGbqNHRvAckj/cNv58gknGli2qdd0F4rHoWRB8QWou05kESf8LCmOirhspyooRF4yZ4ESOQWSjer4uD77KvDu/cUydBmBgxfDJGBN4d5qr4dbNRFD3
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:07.6687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b1a85d-320d-44f2-f3d0-08dc5e6eb066
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015
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

HW isn't touched anymore (aside from detection) until the first
nvif_device has been allocated, so we no longer need a separate
probe-only step before kicking efifb (etc) off the HW.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8d34a4cf2900..9a4f2b0a8463 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -830,23 +830,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
-				  true, false, 0, &device);
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
+				  true, true, ~0ULL, &device);
 	if (ret)
 		return ret;
 
-	nvkm_device_del(&device);
-
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
 		return ret;
 
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
-	if (ret)
-		return ret;
-
 	pci_set_master(pdev);
 
 	if (nouveau_atomic)
-- 
2.41.0

