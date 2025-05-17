Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D182FABA6FA
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B19010E0AD;
	Sat, 17 May 2025 00:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PoOB94ge";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D258110E0AD
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmXowUChAysE6EVnMx2uYsJvAm9OKyVdCxOEkkyn0nW92iioRxolInbTRs2KYCrCmjwpkq1Fze/WUdZX5+QOc7Xj0ZrxbUmjVnQC5tTqKoUbb7zkQ2s5f2sxg61wMQhb12AoDIm6R4ZykyVc00ueLr0iHxB/CI8cPWm57jC4RhktxXeKnIjxJVNeJCHeB4SqTEISdekeLmV+K9Ryhbvk6fqW50QlQSRVV33TfD1dm3MS/RN/wT0e3OnuGZt5KgNpj9kbByvDIWjqXfEf/W5w2xfZaxJbJh6J0Ix411PhoyX/K+SoE1noaboov2PBugn4B7c2jF+YzWBOJzv11gm0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS86kIrUd+AAOrRcoHWCAy8ovMZMVSKrS3vXlkSl9bk=;
 b=DDr69HVB8QPqfLlQDsYY9IMTT96bsTGUSEK6ghR9L2SneOkgof/95ZIJwST3d+LSeHFtsz2FNuvx2rbtc/R1TVQ1KTY6e/wE0H00tzJjp1gMhmGiNSOVNFeJgqI2MN2Ditexy1R/BB1xvH3Pwa5HJAsKmFvR0sZaxgqJAANLfRvj2sUCmAgRtqYO8Vt5NuhqergVYO6BGABsvieOkbvUBZPz9RMFgnWkXF009oKTP1rZ3BRLv1zSo3JokKXHXebof7etqBP+GVTZZY2o5D7Db2zmo4tYBaP+z3aJQqAivIRA/HouYKqTRVXz9Ra9Z+iZWq+myo2MXriitv+7jCBqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS86kIrUd+AAOrRcoHWCAy8ovMZMVSKrS3vXlkSl9bk=;
 b=PoOB94genQCyL0NkqN3wZxfzeREwwIqZyD6oAjWMNX2r/TAMCgpEv4CcFPYbReQoo8OH8wyALvlHZcv1hj5j7GXnaH+9U2bbxOr+cIi50nMxg5tmQEDDUhk4JFsTl5v5Yt4uQjIC+1KL1cb4ojY4iN2U/5cR/R5gymJReXW9tvpiunzkD8hQidhAqFWOWnL6crGjfCCafiHg8jTvYrE9TSRZjYri9H4BRi234V1m6L+RdZvBWSdWS4ISPi8Kx67K5umiPJ0fYB05zxxIVct8oQLe8QlYgNbK0AxIMweLGoG3nMhYHWDy3p5NdvfHnv+1sv0L0PtNkGINv/uiRpcHAw==
Received: from CH0PR04CA0114.namprd04.prod.outlook.com (2603:10b6:610:75::29)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:24 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::51) by CH0PR04CA0114.outlook.office365.com
 (2603:10b6:610:75::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:10 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:08 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 01/62] drm/nouveau/gsp: fix rm shutdown wait condition
Date: Sat, 17 May 2025 10:08:53 +1000
Message-ID: <20250517000954.35691-2-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 6641aada-856d-45fc-7575-08dd94d737d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DU7A3Dh8UX98mbZazQ7vikCAcCJOD7P/i76qTIYoiNVf+9dRzBI/PHFmfxGi?=
 =?us-ascii?Q?bUYo2XZUZ+R8KSl+qYpOWMxVaoW9bOwfJoGZYbpbjDpZXAwu2BZ01Oy/pSps?=
 =?us-ascii?Q?31ye8gxv/yf1XI/J2YsrVsfZseoIbtzbHtzR2Wox6F6BfjmjW8nWaKc3udW0?=
 =?us-ascii?Q?1nu7An1Fy822KFkqsrtRfG749cCRW8IWv0ik7qvcF4N7qvC3gnu61rtPImoB?=
 =?us-ascii?Q?te/RQ+uTYMnkfFzo7WNy/gcbfinIE5VqHLHY5aXA2zIIG0ouQt9bDUnLnZ9X?=
 =?us-ascii?Q?J3LJQsC2PMxCUZXdiml0WuGz2zhPo4Qmv5X/ZIEO1S/gn8vX7tJAO/ZicVJ/?=
 =?us-ascii?Q?lzQ4KIWQqWEtc5VuBptaFbx5TmnfMoz3iYA/gm5O7p17jBYFLJ3RPGHolVDf?=
 =?us-ascii?Q?t8iX/byt/m+6RwlY7EaZGuOO0Wgh3HpytjEHgPOp6yAUcVkb/6INVnDGkmfe?=
 =?us-ascii?Q?obnrZ1kwcjmI4yQyssW7WHjI2ljhz7qG0eWqIPi4mcXGFsWRKEnuG46ErpLq?=
 =?us-ascii?Q?SLwwasr8DXzDxk4fYF2vldTOQLpYSEWXdzx71ClSWTwGAQ4Jn9CHrXdLfo8X?=
 =?us-ascii?Q?NYRdzhLhxjZGKifEtaB3T93i5Na06LBNOnzDwxZoqONoc568Tflm9PQQzWqw?=
 =?us-ascii?Q?f8jOMeyUykvU+YnV0nauLy3N11MSDHwfEUjq2y9je5uymde1ZtSQ3tWQiNEe?=
 =?us-ascii?Q?U3ExVG6nbSQrTw5Mgb2Nah578tAxvPApBYuEPXbXox2OnDMGLk1xedC4ffaS?=
 =?us-ascii?Q?Lpkhp3u/MQ/S/fNdZSe4hPL+ip5Z2O8mysdE4/C637orGlkBpYmauli72+7C?=
 =?us-ascii?Q?9dmlAgwWLno58bAbCqapj07Ikc7El8PY/jLQwn/0+9CHaFvwXr0z6jzKYF8k?=
 =?us-ascii?Q?wQWgIyIpMnSz/AeG6IqZ/aCxsauci7PUgz5evT3y7e9bM6IwB6ZhHUA9RAPf?=
 =?us-ascii?Q?/C7cVbdSbkJ9qF83NDAxssJp3gWG+siTKBy3qo3Fa6lHALaAE7zL+fKdeaP5?=
 =?us-ascii?Q?Qu+SD9ENqbQIa9ChRr0d7eWM9FINF1aklO0JXEaAhOpXXPFNxDu+SS8SqJry?=
 =?us-ascii?Q?SBRMH656516XwPrahS/ukm2cMNVfatTW6ZADMKE3LKtDIdAjVRoLWIlF8w1L?=
 =?us-ascii?Q?M9sPWehPiG+H439oxWTUeG2AEz89Mcs7X4f7G7o3vf3dmrguATRp8BHIV5F/?=
 =?us-ascii?Q?mpkg56uD9UMoS4td9AMGEJBBibJqgTaGy53rMydVGPZWduW6QoAZ3f/B7mPn?=
 =?us-ascii?Q?Eow8SrF7G9ukaxk/XlAnFWwYmL9o5781C3o0a5gs2P19N+JwQQRzKkO9qenR?=
 =?us-ascii?Q?SUiohLgsonfif197q5KzaGBDoTttqKZOY2T+M1NC6n3cbHGmFNls3JqTeQTw?=
 =?us-ascii?Q?cDD0GvwHxFiWXT4VYMtq57dj2BT3Wggc7TrnrSf64QOdMmq4Tr+TH0P5u/Hp?=
 =?us-ascii?Q?COpg5FbLmND6T+Luo8MNpJtvovC1jdBs6sktYgYRFNQYwsDwJ2ImHmun+Ujn?=
 =?us-ascii?Q?KAFVCulP1jcWxTcZYyDHEk2CCEwSf8NFxhOZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:23.0363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6641aada-856d-45fc-7575-08dd94d737d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198
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

Though the initial upstreamed GSP-RM version in nouveau was 535.113.01,
the code was developed against earlier versions.

535.42.02 modified the mailbox value used by GSP-RM to signal shutdown
has completed, which was missed at the time.

I'm not aware of any issues caused by this, but noticed the bug while
working on GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 969f6b921fdb..64b58efd3132 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2844,7 +2844,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		return ret;
 
 	nvkm_msec(gsp->subdev.device, 2000,
-		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000)
+		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) == 0x80000000)
 			break;
 	);
 
-- 
2.49.0

