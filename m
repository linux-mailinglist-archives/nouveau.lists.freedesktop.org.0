Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B08A78C9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8DC112F42;
	Tue, 16 Apr 2024 23:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gPw+zzXV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3885E112F41
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoSjirDLQB95e4jl52kjaAFPVvSrVIenVWagoP1FG4lqe36VQNKa4jdBjfps+4C0gts2KoO10kpnRwYwat+mC1lV3b2n/NN+QGN/0Tck3TWzS/qQF06eUhlCkWS4Cf5nCooT815hIdgVUyUokfa/i/ajYU6J9fRSIebZEFM1DUgJjoa79zuIdcXvz6HXWyWKJ4u6dUkGwWNxGekgH4We/WvGYn/Gemf/85jCu9F+MkEusD6h7mfc7qdB8NUbUafKkveC4PhS8xPwJgQQ/lvGVA1ldpZkjLbx5/8D5Oy6XwrLy5tqRuVUKmKjFr2SQGQcVaABv2DV+w6XLSUnDvqpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmDpJhK83fQj/YNl14gCfsNuUkdQeBDNpBABqWOBdAM=;
 b=MWJth0uLXIxaHURFUfeyqQiLL1s6E6y9CGHqdVWMelYgbqdYaHQ7OGGYoFHYXS5Nl/hk1tQ588YdOmwaj6WfybT2G0cO8NNAGR6HbZKArDH/vgq3gg4tKCfJGIawd9Iro4nPhLObmyz1nq/Lf9lKqL9on/n1QkdD163mQGcOsUqv46DoMMmEerSjyWFRCLSYHtvtFgp5qdoDBnoPwGOOIGlL+Z+7jpNWHr+fy90Eml8sPBUzNxjtPqSSWSVtEFigQVrAFqdE0pzvXF7yIyyKp5t4j9y0TimgoCH6b00Uiu+HjIg2XuB1xo7EigwEpZiPwYN3g8C1f7rVVJQ+ryxPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmDpJhK83fQj/YNl14gCfsNuUkdQeBDNpBABqWOBdAM=;
 b=gPw+zzXVZgTyyztdcbfXxE9bRdBNYfljMAComuyE52eDDTVVfr7alweb1ZBofZNkqDjbdz3FctZ0pOer9t59IxZun2IrZ6kH2/Vi5ECqWuOnf23FO0nyytCsKNyxAnYHn62wjSETGpzMvtuhsclfvey3jfH7paXA/q6eOqgvOU1tzX2fKLzG/R3RdpPqmaEBXzODL2isLbYmkNEqwm7pr+DOQBUfofUoi/Oxjk0xcu4em6hiEHWLq3g7QWlpU5eTB/dvQjD8ESUew+hEuN9g7W/5wnsIsuOiqmiSvR4evPlGk+9m3w2ev/7GH+BIJop+9K1nXJT34Vd8InXr/gBsSg==
Received: from BN9PR03CA0662.namprd03.prod.outlook.com (2603:10b6:408:10e::7)
 by BL1PR12MB5706.namprd12.prod.outlook.com (2603:10b6:208:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:24 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::1d) by BN9PR03CA0662.outlook.office365.com
 (2603:10b6:408:10e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:22 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:05 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 030/156] drm/nouveau/nvif: remove nvxx_client()
Date: Wed, 17 Apr 2024 09:37:56 +1000
Message-ID: <20240416234002.19509-31-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BL1PR12MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a565232-dd5c-423a-62b1-08dc5e6eb94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /t9cabW2enkipBwGmf9cPnFRZa7xMXwe3CxyxVQMeGjLWxSvIuZGlIgB7/HRo2PfRtSk5hzemQ3Od9WtmzSsdsRtBYoVjSMO0NMXb+D+X25SQzoPezeKCZqmezIxS3CChEg1I0kGLSnQJOR7eZ8A2+NVsOZg+Rs4M9CnkUwUtoVP3SsDOT2SDlrGl+7uVyisu4Mo40aU/QymlygKuyiM4ZrWlyQfPFkf1bmXhUd3zzp4AnMnLI20cDQPJmmEWWr2gilpe7eRVSPyh1AeZuegwDj06CP+yP3qYZsZZ0w7DBCPBxh8k1TzP80pGMihO0hemq3AbArxNvM6DVWvjNtu8VH3Qei89o5cSuQfc49YIneJIrdNKurrqM8kHm7Kjoch0tr1Q4uC1MnI0dHY6WvD+haP2fXAcoGFP3/hh1IYbJnXZYlyluorcwZqVjlJlTpahTBNX8XFezb60sN7OTDHzBtHWxUfrkzFMJQxB/Vzw0lcVTfjEhSomQWGiS1qiv9CL2SB7h3B94cPu+lK2YrXrisAkLn22iIGGmppJAhMSJJ9u2ECJ3LYDTD8xb3h+D/1sOj1bvEekEdcMRKwb2VStTGG1yG2VQO0vRLkuO6dYeNOPd7echy0nfF2NzH3PP6DN4IILWwBL8F5NcHxFTVgLyxW+kKaswef56fvnsCptKBLbFw2aUTEokxGiMaSagWRGBnG/56Ne02A6+24/H4yAtj+BZ2IxWXaq0OSFHI7cMeG6P+ZYCrKcfhnVSu3hluZ
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:22.5875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a565232-dd5c-423a-62b1-08dc5e6eb94b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5706
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

- cli->name is a thing
- messages using nvkm_client.debug are being removed, so it's not needed

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h | 5 -----
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 3 ---
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 2 +-
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 64b033222c56..5210007d7669 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -18,9 +18,4 @@ int  nvif_client_suspend(struct nvif_client *);
 int  nvif_client_resume(struct nvif_client *);
 
 /*XXX*/
-#include <core/client.h>
-#define nvxx_client(a) ({                                                      \
-	struct nvif_client *_client = (a);                                     \
-	(struct nvkm_client *)_client->object.priv;                            \
-})
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index db86cca9ea37..7977bb353c92 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -78,7 +78,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 
 		if (ret) {
 			NV_PRINTK(err, cli, "failed to idle channel %d [%s]\n",
-				  chan->chid, nvxx_client(&cli->base)->name);
+				  chan->chid, cli->name);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 33883c4e8221..ad2772cf5e23 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -630,9 +630,6 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	if (ret)
 		goto fail_wq;
 
-	nvxx_client(&drm->client.base)->debug =
-		nvkm_dbgopt(nouveau_debug, "DRM");
-
 	INIT_LIST_HEAD(&drm->clients);
 	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ba25ce1294a6..09686d038d60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -201,7 +201,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	else if (chan == drm->channel)
 		strcpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, nvxx_client(&cli->base)->name);
+		strcpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.41.0

