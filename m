Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D58A78EA
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970A112F60;
	Tue, 16 Apr 2024 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jhwo42xQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A48112F2B
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpzlGCXxJ/0WpKUaGzi+mcX6UJT9yCsUgkhrRAczOOz+1M5gyCVs4I6eS6bZlIk6t+rhlj+U0j8V4QUex+YdVjSPn2oPScR+jn26w8Z4euBh04LoB706QnuPVgfgAoofKYyiSIXzJBSXyjhyoBdC4Z0ScCRwZogwdI7h9ESdpO9RLWwSoP2ypjPC4qNNozxAl0TtCpcoefE9Qq0mVhQg8MwxCje17huDkUh7y7iIP1/jWuhccIw8pGOkrhZmacvNAhv5JnBl2YguVB/uCBHd3qRTNyz91QSCOtPSy4FKv1Gd63+DIlfDYCbQ8am/7sFFhVoWtdyfSqi4EjEj0akkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIJzOVlpR8krxa4yxffH4BHlSJDTpHU2nrs9cLCnFEg=;
 b=c6iC8Irwfd/YpFBq3rNOXn99AYiwUokm9+XazxYl9VH+ZaZfjrJIm7qe43jMaoR+BPC0HM/Ipb9W8z7ZGjbgzOpS9WEW69P/+yuJyhhIGmbNoTtjq4lVEbuM+yUN4V4CzkFr1d5Ow6i/YC2CB8PYweBlYA/CF51pqSo2dXW4Bw0hLkuXWUE2wde30IXRe4wEDKcDl3cYlpN15r0aOmNVZGuWOpid9u82lXffEgZMzvBWD7EL/TRQuZPTr6lph/08w1sN2U7e3Hy3OSUSqJWO1ihO4ftbHMYTyFk5rva/OwH/UeOFHhQbsvoJAmojRQZFjKeNoTbVyJQBijWVCujWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIJzOVlpR8krxa4yxffH4BHlSJDTpHU2nrs9cLCnFEg=;
 b=Jhwo42xQmrKiHWWQdEeRBy7O2erQEyPuhR70K4s0DbcWYX8t2eI1m2QUixxFv2syX9JDAZMrlxkuU27m6ioQStWqYUFySv7MlPGgECW4LtSeaVpZms4YIUijcnu0KSRUhJTcm/6mXMTGQguP8m2Bwo1e4fgerL9bQCPWGAIL8D58VhfCVUuprFa1We9B/CkPoFNlZWubY+fHt52miLZah0ITVTfSsSv+y8z/5EA7lXvnj9E9a5SBbNa1FcHd1y/4hn2zwWJsWocaY4sVXY5hf/iNgG/iQRZoRdX5rsZHkMiLH31VJ16JzWcc22wXM9kpkzeZ4nUjsnHeZju7VtKIGw==
Received: from DM6PR02CA0060.namprd02.prod.outlook.com (2603:10b6:5:177::37)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:01 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::56) by DM6PR02CA0060.outlook.office365.com
 (2603:10b6:5:177::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:44 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 064/156] drm/nouveau/nvif: remove client from object rb
Date: Wed, 17 Apr 2024 09:38:30 +1000
Message-ID: <20240416234002.19509-65-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: ec35710d-924f-4760-4a59-08dc5e6ed092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvBhoxr9gh0E1NWgISAX86nN6M8TrpF9y7L2b41F3h/1s6ayhIGx4o/RcHHv3g3uNjVIadhMJJ0TsMpVsutFNTov21RAaPEiAhXlztuXaHu7bWbDP6KunwUAhyy5bgKzU9aVB8bircUUgZViK0BtuDy/85DTnVkMxJn1Seu3TPQ+7PWuhMyYQkW0+gBXdtlHtH4qvJoYLGuVhcEc203IVPYYZ9/3hmrqNhR5gmRyaOzfqE00F/NMB9G6ISuBvFXPEyR51HbZHMOXk2Tvth9OVaEvAaRV6J2tv+Y/jWMdE5rICqx7VPj7rY/FbPZ3SFtK4FvMJUwQw9Q/VT37HwH98lEwbX+ZUp+MUl90AHDWMWirTNtSh8FIDF4VRLsxpFdYOuC+JLL9zXFO5xQNpN2xAxmxPadPBM0AQof7+MWfR/u+cWqTixaJPfn6L86UEWAxliLjWPvIaG2HTykW7MwiRn8WwVpLAj3ipbGZxKctLUcUaz+FrsW5lKP8/NylLUKNq9vQYyDmr4mDH0gf56TWmSho2e5KbTePvATmGbyFlthkrBWbaAXR09uX6NFllYNNBUhgDtKxDI4KeXUeoegYb4ftm9zJC9/ChdVHYS9ON0gvRJprjA60dxEijTPRF66ItlcvxGKA9ePs3xH4baIWesn7qD+NHrL+N2ophDmu60498ZCOSPds606JPs16m0J5vGu8Z1AbYcFZQo24FKkNOKOBKE8YmWlfdBlB4QbkYz/LK47Rv0a3+MfhYhQn1pyE
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:01.6866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec35710d-924f-4760-4a59-08dc5e6ed092
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nvif/client.c           | 3 +--
 drivers/gpu/drm/nouveau/nvkm/core/client.c      | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 8f56798d6509..39e965a184fd 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -22,8 +22,7 @@ struct nvif_client_impl {
 
 	struct {
 		int (*new)(struct nvif_client_priv *parent,
-			   const struct nvif_client_impl **, struct nvif_client_priv **,
-			   u64 handle);
+			   const struct nvif_client_impl **, struct nvif_client_priv **);
 	} client;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 0211fa76431f..6b3c7b28b212 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -54,8 +54,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_clien
 {
 	int ret;
 
-	ret = parent->impl->client.new(parent->priv, &client->impl, &client->priv,
-				       nvif_handle(&client->object));
+	ret = parent->impl->client.new(parent->priv, &client->impl, &client->priv);
 	NVIF_ERRON(ret, &parent->object, "[NEW client]");
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 1763e863115c..a77014b342c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -48,8 +48,7 @@ nvkm_client_new_device(struct nvif_client_priv *client,
 
 static int
 nvkm_client_new_client(struct nvif_client_priv *parent,
-		       const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv,
-		       u64 handle)
+		       const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv)
 {
 	struct nvkm_client *client;
 	int ret;
@@ -61,7 +60,8 @@ nvkm_client_new_client(struct nvif_client_priv *parent,
 	*pimpl = &nvkm_client_impl;
 	*ppriv = client;
 
-	return nvkm_object_link_rb(parent, &parent->object, handle, &client->object);
+	nvkm_object_link_(parent, &parent->object, &client->object);
+	return 0;
 }
 
 static void
-- 
2.41.0

