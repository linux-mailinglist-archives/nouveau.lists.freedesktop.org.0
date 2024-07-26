Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE993CD47
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBE710E908;
	Fri, 26 Jul 2024 04:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NRe5mCdN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE7F10E564
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEEuXQwTg4v2VeNjqRXzrkKEN++8NpXdiHUl8VFFAf6Z6Eb2qf1jtnH7d1akwDWJsYgbRoyyluHtFsM01BekdvMJ9n45pQo5LtEmZfY16Y0nMYz2jgLyMJN7nNdHcbCLbZOw+Dy3HZKwEEMudKzpr0KE2C4vGF7uFdpTtB6BccY+xnyf8cN171X8vJrw5NkxMg5ZtAwJPYI9aBRLVy1eNaxFp+PRduGS39ZbkH91bSgKHCyhpBGtA1x0em5SrCgWYl9Dmcjsz131KsAptbIZjo7sicrYIkRXKJiq64lY6TJKrCH2arYOyyjnDGDFRkcLYalEaYSaaQ9ovsofhaMVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgLH+ChKuVFllDYkKSZwz0agN94Qq9td3a3XMCfCJBw=;
 b=JgG6Y3YGqJk5L5XqyWPSCWYKnH5IgO+rP6BhjlC9jakUco3us+lhLc+rkvYloX3p0UP41V6WvopBzvIgJXNTiZiiczpnw3G26M0WxJeWdkaiJSa37WK5x55467pTYkXNGOTxTyzmQA+1fsLCchMrh/SGSEsThsCybnFRuYm3ey182gLW9ePcsrNgMXss24evvCrZlyPYCg9VnsIGnFeBAIj72H71WdFW+0agOILYUI4o1M2qQ5SFAoGQuOtzK3vczIJXvJQEq+2WwJUgeEnr4b39SrrXfGcXaYuisTN/H/PRzuKYhrU/rb4SFi23kL+4gHvsakXEYXbGjYbjX0FbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgLH+ChKuVFllDYkKSZwz0agN94Qq9td3a3XMCfCJBw=;
 b=NRe5mCdNodXkLlEMO8tf7230tfLFOHzLltH5QAFXmfivgWClVaWGeijDHFC9LjkWfGrTCcaVUbqpEdbrjxMQXgr4uuyF2DHUpJQqu7XreespdAkTkxvXbDONmjzeJp8h4QYrQ3XYzhNAVsaL6bNt339bQs6k2WYI1nB2scsdRZkhDiI+UaH3FqNPoKTeav6Tyri5lI+pLnUpz2B9I9mMjttD+YfIaF3q9+46gQOQVJYAHKRClSfsRQLMn+wWml+GIt3aECMo5UFVrGTzqG9oUSsv6zs6NEHUq8azu0Q5zc0YENl+jYPQoHxLsRDPXZ1HUAFu4jMHPX+KeKc/igLGnA==
Received: from DM5PR07CA0106.namprd07.prod.outlook.com (2603:10b6:4:ae::35) by
 MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:17 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::25) by DM5PR07CA0106.outlook.office365.com
 (2603:10b6:4:ae::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:09 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 17/37] drm/nouveau/nvif: remove nvxx_client()
Date: Fri, 26 Jul 2024 14:38:08 +1000
Message-ID: <20240726043828.58966-18-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 511215af-dbe1-49bc-5c57-08dcad2ce867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8d3CGUIoTI53dIhNxf0TZ/3Vc6lGwOOqF/XMbSifB0yMuF8mBZ8jjkXJxxrA?=
 =?us-ascii?Q?23qCFgqU8JrKkGkE8l3iGLwrfPIRu9hDtzwEfRMcGg7MpKvi4sHZqTEZLNUh?=
 =?us-ascii?Q?pbLxcDGfu6F93PrnYVNQ1m4qp0xDERnHU13s+mUz6u1Zve/fuNAAZC4soSMB?=
 =?us-ascii?Q?tk26OWiunLV+g2zZ82NDzw09MObH1fIhKeAXvAmPia4YHUyn3onxU6jM7t4r?=
 =?us-ascii?Q?SevDkR5vFoUsVgjDGNjXVq4gpRQ3vBeixvA6o2abf7N32lof8jLCHs9hOpGn?=
 =?us-ascii?Q?bf+hUD3AQpCFOFQtH5eKwX8stFYBSIvHjTy4pkGfQeFZcP/IIFehcOwt4GvV?=
 =?us-ascii?Q?RRwcapuNXJkZmNZiq8TqRFwgqaRl8A/UNeY+QfGjMh8+lBaNnU8A0Xy3GrEA?=
 =?us-ascii?Q?1E05iIEQF0i6M1hEbdxbVbqz0pIBx7E6+c9FdftWs0te++7VxSUgIrQFlJcF?=
 =?us-ascii?Q?CND7IgHOtqlxbDQt/4AzXElhrH8STOuBGXjRn9SZdnt5XDQAW4G24mXvP+7L?=
 =?us-ascii?Q?llbJ6vFhDRKgouj4VEMLFJyEF29AFO+X3cgBqQJfhVGAuq85RGpCI+SV6uVv?=
 =?us-ascii?Q?kTNH69W44yZWFgMAUYrQqn7nQkjyJUNxSnwgDM5f5lE1iJHLQoCzGPEI9QTx?=
 =?us-ascii?Q?ZPtPXlAvBkYuswuQoO6E+MD2XCs3c1kr+J0OHU3icaTITK94/dOYyvGBJVZU?=
 =?us-ascii?Q?5OAuij9mXC7fQ22QgnPGNTU4bUTMGhzcobfpMVHUiczlteqcn9FoFYBcbugB?=
 =?us-ascii?Q?iVj33S5lq5N0bgC3SuqR+a/xHsMfbLSnEx6mStF2zKiyOebJ+95JZ9fwTIVO?=
 =?us-ascii?Q?myP/oiiLKprcS2rh/cAdvHw+GoVVEpWX8yndwViRYYcEkcBByHy96EWR+dx4?=
 =?us-ascii?Q?IBi46AQDX/j4MhWCe/d4qFU7lOSlWDUgf0eOOGexoaCoIsjj8P2qR+6oMrp0?=
 =?us-ascii?Q?Q9d20Unqp9n0ZNIpMRgvxhr3XLEMgts+Ej7OkQnDSScm5dzM4oOyuWGKzeQ6?=
 =?us-ascii?Q?nn2Xx8ZpDoB477xmgS8oPtN+eQf2PxkOOm1jR9kaSWyNHwAUtx0EaH87+ds7?=
 =?us-ascii?Q?kzVXLWxvxFPFrmbXC02K/Px3Cl6gETXRmsiBA7deing67s7zvC7iwoxK/txr?=
 =?us-ascii?Q?20hp46Tqz3dJIOrnnmrPvCTUnNYugY1VDwOEDIhlW/+Kmql3WHg4YGFtG5XG?=
 =?us-ascii?Q?R7SdPaKEA26YenBMKvGD8AOTEhfxf0pxnM+mK54XZX5X/xcPq3yfvIdL/Eeg?=
 =?us-ascii?Q?Dl8dn9WNbXK1k4JOOhH8HBk9nBoklyPxo+Ax/88CamXjhlAdCvN9ViWti6NP?=
 =?us-ascii?Q?s4fQttSCQ+MQn+jMt96uIhKVVjVhmS3lsikf0oAe1HiW2+mWKogaB+N3uJDY?=
 =?us-ascii?Q?JsIp/HzsNigt4jrrGQmC/FObrVPv3CPU6KckHivgAx+m5QYuyQD4SUFvEGPt?=
 =?us-ascii?Q?97bql3Tfyehp3Ad7AKR6BNAy5WMgBH65?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:16.7459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511215af-dbe1-49bc-5c57-08dcad2ce867
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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

Make use of nouveau_cli.name instead of nvkm_client.name.

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
index f568ea251e3b..a58185171db8 100644
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
index 950184b2c1c2..526c16f79196 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -644,9 +644,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	if (ret)
 		goto fail_master;
 
-	nvxx_client(&drm->client.base)->debug =
-		nvkm_dbgopt(nouveau_debug, "DRM");
-
 	INIT_LIST_HEAD(&drm->clients);
 	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ba469767a20f..1450fb8c57c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -200,7 +200,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	else if (chan == chan->drm->channel)
 		strcpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, nvxx_client(&cli->base)->name);
+		strcpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.45.1

