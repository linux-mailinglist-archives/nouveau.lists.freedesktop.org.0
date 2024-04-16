Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B868A78E6
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0C112F5F;
	Tue, 16 Apr 2024 23:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aaVUPFXT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A06112F57
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oapkp0rKqn9JBw4UvexyyBxGeBVqbULAv49sM11PXKAwwIShlY2Cff1zBANHAXv57xHKq1n0g+doKh3+QYGIKPJEsBo/T8yls4uqnIBxF1ylG0MU39gMcEoCDLBG5C6E3MuBV64xZIz82IYSJjzkhAbRXLGkJuuhFi9vRYugKWuQAvXeB+0Ft4LigkJzhwn94v814FTmVKBlJv5bLLQwkY0W2hW4MB5+FJo4d+7WmVKVBMXMeGB6Tuha0upq3PbQeurlXYVikbpAx7A4n7/ftHP4AauFNdt029VXQixFm4HvndCgrKLTSlO73l7sZ9BYKFkJ1GH/Jfx7awI+mqXAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfVpB7OBTXRg3rFGL8VfqFp/0Zm4+29ZqHEOEJhA7iE=;
 b=TnG0WvtBEOm+oGqeiO+Rea7HEWFMhuvcGRstIHvbeNjJ4h19tY6wDb5nZlNC2YAbwSpDCMDCiViaS21YY1Pb6H2W/kHGChcY5z6OuQ8i0OLflRzCz3OPes40lJqrOKlwNy9INeVim1+QUv/A5TBxDkOPBp6ki+dUm/0nH+AZ43GR1Sv7tH1V87yWQYEdKbCNdq/yUejeLJh+0h6k4YACmg/XTo5riuo5Ap61qli9nZClYeSPL50y+diTNb638gVRjgg9aK5BOOcv5II4J+UDfdXzXDYt/r+bd2OXhnG0+f8WkHBTr9oJfsNw48L1fk3pHW1CApLsEg/GAO9dbrg3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfVpB7OBTXRg3rFGL8VfqFp/0Zm4+29ZqHEOEJhA7iE=;
 b=aaVUPFXTNZZd8x06LSejkPodnrPCC+mQXXboZJrszbsFeCO32+edSzOVccdEuiI4Wi2xT/iCvI/TLrOoggtFROaejIRqtas8+LYfSK+vFdBp/Y0mNRGkSJI5NMt+1sU9oGVHD8SU/H5XMLSb+5DqgA+KrczzKtJpV8NnocNZvG4CyCfziup2xnQHApP02SxlPrlxHuOdfZoZ53Ul022cQqS/WLZy+q9yQjMG5STJZl2ZsKQX1bmYmt6vSPsj/6BeuCyo2No0OQ/sxFjEa5T+TswTtpSnXXpVTr6ZDzBJLbd6+Y2qN7AUAjF7VR1BxaVkv2G/CJAo4lXZiiZO/tI5lQ==
Received: from BN9PR03CA0681.namprd03.prod.outlook.com (2603:10b6:408:10e::26)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:57 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::97) by BN9PR03CA0681.outlook.office365.com
 (2603:10b6:408:10e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:35 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 056/156] drm/nouveau/nvif: output oclass id in object dbg
 messages
Date: Wed, 17 Apr 2024 09:38:22 +1000
Message-ID: <20240416234002.19509-57-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 3197a32f-280b-41fb-5f3f-08dc5e6ecd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQ42h5kkv1JtbsjadefpLLKUo97jWvNSE3udQtdjR7Ure3zlvyyf8QM1gtqnFHP38elXOLTX9Je6uLMBFtErDHGYqYGFE791Yhdn8O1CfTtnemABwVdRFXis9SNnXSZ+M6z1xyPkZPqFmIAQQEvetkmCST1FfTXG3jMLsF/5sLxL2cijcbiAtU6teIbMCgto6d1w3+WsdFK3RXETDJKnYytvQGDTUGKeDUxvvRlbxvEYq37ym5PU4Hft03YLMCFEL3Qy9PRzQBlAkvHekjQp8jXTB/f13zJ3Vfb796Q/M29pscOm8fwo4fiOyyRfaFrMLGdTgMrxvrSGtlJDfZLpKEyKjYeSpoi4diR/E95ouw0n5xY1tYLCycFmhOUVH4j3mFz+mNannGVCmK0KUTW46frAqAkdX8I7F7bFYf7uN2bkXVxNIUfjbuk1cLrFeh9VkFewmYAHMsiitdxYYsXDuV+xMRVzS0ige7cE4v+lcVkQCQWIzsBjko3FD7VDMrN7i74KRR+4q/dcOcMpEfbRieU/HZa0vKfjV5Ywnq19JYg2lKgJJCTzkxBWjyAamcuOICUUzEQkh/JW14HoSneofuPiQs7MglrsWxSEA6Zrxg2DCjT1+iDI6nSfWhRUqKEWV1iqsqnYpyCezYUAHDK71j49iO4XQsEwLdiI7J3JnVyLcoUyYwMhjQmah9v1clJuhhFLtB2q+nd4S7I6HC8Tdlty4icZwyhy4tumaZBzsjasgZ0z5vq1816gVQpTyxze
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:56.5875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3197a32f-280b-41fb-5f3f-08dc5e6ecd8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003
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

- useful to know sometimes

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/printf.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/printf.h b/drivers/gpu/drm/nouveau/include/nvif/printf.h
index ec524b2faeae..10d8c8c90fa7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/printf.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/printf.h
@@ -4,10 +4,11 @@
 #include <nvif/client.h>
 #include <nvif/parent.h>
 
-#define NVIF_PRINT(l,o,f,a...) do {                                                                \
-	struct nvif_object *_o = (o);                                                              \
-	struct nvif_parent *_p = _o->parent;                                                       \
-	_p->func->l(_o, "[%s/%08x:%s] "f"\n", _o->client->object.name, _o->handle, _o->name, ##a); \
+#define NVIF_PRINT(l,o,f,a...) do {                                         \
+	struct nvif_object *_o = (o);                                       \
+	struct nvif_parent *_p = _o->parent;                                \
+	_p->func->l(_o, "[%s/%08x:%08x:%s] "f"\n", _o->client->object.name, \
+		    _o->handle, _o->oclass, _o->name, ##a);                 \
 } while(0)
 
 #ifndef NVIF_DEBUG_PRINT_DISABLE
-- 
2.41.0

