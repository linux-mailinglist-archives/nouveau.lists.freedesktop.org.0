Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CA69B269
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 19:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786F10E403;
	Fri, 17 Feb 2023 18:37:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F210E3E3
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 18:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCG7GzQgrqEPbXi26WRPnm3+4dvniawTkgIJiXxBwNJ+3b7MuIBcgPQ6wihC3nFrpQaX+LvHQcgnSZulqZzwqRNsPXY/GwJCmOElW9B5S/Pp9x/H8+M89ZP9LLkuLfYkL4xSKKuJq7eF0Nwep+qB1u9wCBNp4alb1hRk2XmAyPVNkT5l57Ya0zrcQYeeKQ/bVOLptnD3oEe2Z3yE6H3z7vuoYnFzqpmdzvK1WAO9jxjfEAbU0uHXcLXxMxz38ARTw2gkISwru285Mf7tFFn3dhC+rECuLvKaxJo48ZFCEQba6OlTnqO6Vz6vB+MRLoKy11BQQaPdODEAo8ztuUTOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHG05rNpenSWJ8pgSKouuI3c3mq7vI252a5+iXQln2I=;
 b=igsyoDwRSE+1lFA8FxPCk1kSoMzdq2J/Pvuzdj67/MtNZqUGb6zgEuX/qw0g74VCxckQKKFywRlB37+stcUq8s2boc2ID1C0H95x0gxyA4Ns+bGP+rvOhxyg9YiKVu/c5XFvtKqx+dX92Z5Nfr1TMB11jGmgjzQm5vIjvWW1vdLUtu1wE1x/TiN0HhQ04HfRwl2nWiughnr4MeoSzLYoMQfb2dktK37MXQV6o+B9pX7tGsPNS7dK6ZqxfXzLBCwTe1Gn/hCjYX7dPAwaQOl0XIU7Lbuap0Pez6xD0fidft7oM/2Jp0VoVl0U0vW2yYM/flDpnvZfid/2yJ+8QrG3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHG05rNpenSWJ8pgSKouuI3c3mq7vI252a5+iXQln2I=;
 b=dmtV++tLZVagsLxS+4U1gpZdJJvE6yeYe516smGKJivgoTS8WoPXnxBmkzYGut2ew223cAWcJO37hiTg8V84t0PlV1FrDt+vGB7cld6FB2gFRDP+8uRTrvw/oF6DDbh6pUWlcPFtnqWwAXWF+OA4wrtKgAzuybwqTp+aKUoIzCYxuMhT8e/6TLibrCMiPW/vo4Pvoy2bSIL33nEh1mYagv4RYtQ3UQALUTa4NbpPoAFK3jZCHBILbv94Ui/srtKymAJmBT9Z69Y31PjjtnIvYpYIUYn1nXSGCt+/3d+tcJsP40lNMhMqWWitOzNtvnaH60guAyl9r6hTIw9qeMeyxw==
Received: from BN9PR03CA0278.namprd03.prod.outlook.com (2603:10b6:408:f5::13)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 18:37:19 +0000
Received: from BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::f9) by BN9PR03CA0278.outlook.office365.com
 (2603:10b6:408:f5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Fri, 17 Feb 2023 18:37:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT111.mail.protection.outlook.com (10.13.177.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.15 via Frontend Transport; Fri, 17 Feb 2023 18:37:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 17 Feb
 2023 10:37:16 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 17 Feb 2023 10:37:15 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 17 Feb 2023 10:37:15 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <jim.cromie@gmail.com>,
 <nouveau@lists.freedesktop.org>
Date: Fri, 17 Feb 2023 12:37:12 -0600
Message-ID: <20230217183712.2247870-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT111:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: b16a0a17-916c-45f9-7fbd-08db11160019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +QOzFmIzagnte2zTY9HLdCs5CgpBnAScvimOs61zwDfhPJ0j7OM5iviKzKhyiM2yalt/Uyo66eozTBihYp2NiLqrV0M4c7ITKMUhSyyX3LWD2qlG1JqWeTNp5CPQq1EO0/uT7m99Mcwb2al+VrI7/Wyo2utxSzLY03Usr3B02eWkdFCJ/McmGJEIULRWDCpXwzNlKJ6HzKBG9nyI/apwyVhH2wXT2rAcpvKAhDoKwqYy8UQprRVWZBh0+OY8VA54t67fviLuJ5xfso+oqXxjxbOu5/z3MU9SrK7j4JTYWK5oKkHftMjEaNWdKIxLwX9INSgMAixpSf5fFcUopYVcRH2nD6+XhsZZBxloMR8jom9oXv2HsoLq/pnTcFgKiK6o6ESsCgTN97WgmOKkcBvfNZ44Pk8JPUqUKDTy2f/6JZtBymea2kiRcyL3m1TOv3YkNw3nuwIgpoY6CIg4dMnL4RAFp45nXQCOyLk4h2gfxzcG8vcxu40ogRlkZThmgJLlGffKVFE1feHIrsDzpbhdRkf+K55jHsA1Dq5QL/pxHX5pwtPOexc791qZ223iUf17OS9o35ntjpBl5Inr/vO17hy8Ovck/HPb2E7uc+PUvQFzek6wmMoH9P2DF+0C0QR4yRIFnMjktSrEwgbmeDSSGwlthkq/2MlNW2E9ltNfHXyW5LrGDmGuwEGC6u0OWvZMpR18rceuCh5RbadNlfSspA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(40470700004)(36840700001)(46966006)(8936002)(6666004)(40460700003)(41300700001)(82310400005)(36860700001)(336012)(40480700001)(8676002)(478600001)(86362001)(5660300002)(2616005)(70586007)(7696005)(70206006)(82740400003)(316002)(2906002)(186003)(356005)(26005)(110136005)(36756003)(47076005)(426003)(7636003)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 18:37:18.9649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b16a0a17-916c-45f9-7fbd-08db11160019
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844
Subject: [Nouveau] [PATCH] drm/nouveau: NV_DEBUG and NV_ATOMIC should call
 __drm_debug_enabled
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

Commit 6ce6fae84536 ("drm_print: optimize drm_debug_enabled for
jump-label") changed drm_debug_enabled() to print a warning debug
message every time it's called:

	todo: is this frequent enough to optimize ?

Because the Nouveau macros NV_DEBUG and NV_ATOMIC call
drm_debug_enabled(), this message can appear hundreds of times
when the driver is loaded with debug messages enabled.

To avoid this, these macros should call __drm_debug_enabled()
instead.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index d6dd07bfa64a..5b4f87055202 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -260,11 +260,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
+	if (__drm_debug_enabled(DRM_UT_DRIVER))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
+	if (__drm_debug_enabled(DRM_UT_ATOMIC))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
-- 
2.34.1

