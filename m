Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA288A7932
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B55112FCD;
	Tue, 16 Apr 2024 23:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PO4Ms4gw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83A1112FCC
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlsQjptEey3jRWLd2YJ1qp0vQKr2g4IvfVj1zp4B9nyMok1hs5K9/nwVGRsodoOCs08G3HSgp5KPzSo6M050SohlaFSMmfrQIOfVBIH929Ur/yueWR6DrXIm5RkqOufqqJ2H+37lTc2hcx1llnDUs28lPSAS5JiFE+NAThCm6f3d6DoGigygUoMiBTk0OcJvDF6iTEqHHvFjFGcn+KnTpTfhl7Is432YO2WvDmwyzUPCh8xrj7OEjEhITNsMQDtOpC5xmagJSRDusxtE4ILQos7DCURIkoDWGAxgCxhrjJh5gWqVibZ5XHEIGzrtpMeqp4fBSEHdQ77QI5oOtZit8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WczBSx3gEQ0LMOhNuIS7j7zX9YOEbg0VUGYQ+FYHwkY=;
 b=DN246Jm1LJs2zEGyKex45m0YevREWnNCfb5GRZ6tKEOuO9r++ZlTyle4T5OZyNWJKyco5nJiSlS4M8i8a1kJD5/SsFt8sBTlEV/TNmoD8MOIfKbLts/rAA4Ja9DzvDFe9ZGgAaQPc3U/pZ94MI+rr6C5+SRQEMR7obIB1Mh73FdLQEdgSWX+hZ1Xu9DUc87PBSeFiWidLfCcgfOdsdLAqZbq3/aadPF1bwkSLVpLXMFNKCiZEhaHNdxDJEVWOIlmXemqgRfaXsMuXRzSqa+dL2IZCkH4G9vpuV713hNM8d7LEB9USvBh9avmNVFHy+tKJBxgXU+jDVoC2uqIE+k0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WczBSx3gEQ0LMOhNuIS7j7zX9YOEbg0VUGYQ+FYHwkY=;
 b=PO4Ms4gwbuY6Sevhs5PFULWth7xh/PRgpWfk5B2ZwXQWr6gVk3hXECQi0uAUMAAGTUTvQVV9iW/pUxgoDsoxhYbBGYNPF7Q/ddGDSy1trhURiuDUMKZK5I1LiYxIxPcY76biNlKEYkeNi6uoDvTKjvKJ/8zIOGLB5opUa6H+DYwu6yRjRVkxZW77QWwtCCSBPF2VqAuvnJT6um8ptK8mRIn0LEU3bB+0hjQh6YDqmrWzMFv1E1EzurbePKfTTFla/Z0fBzXkrbS+qCmHh14eLR3suBSf0sECZGuWVJkE6xk2Yxsfeq5flMlCGii3vEmcmc5nH5XTN/7WJF9lYGpPdw==
Received: from DM6PR06CA0101.namprd06.prod.outlook.com (2603:10b6:5:336::34)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:25 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::f6) by DM6PR06CA0101.outlook.office365.com
 (2603:10b6:5:336::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:10 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 140/156] drm/nouveau/nvif: remove device from object rb
Date: Wed, 17 Apr 2024 09:39:46 +1000
Message-ID: <20240416234002.19509-141-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1054e6-952f-4bf6-26b7-08dc5e6f0289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXTsaKthBr7N6FlSshqtesho9ERwe1kMel3xw9jomBPkZ6pG2csRYRNH2qSAD6jWYjw23TVRguc+jXMlQyuT2uVWohK0IvWt6EtOhpDzjc1Ot6lSkKTBrjRfSFRk8YjZ0pxCRNsAbJi0AKB9qI27cLsMw9/pOdnLL2Kh9sYxPl+V3pJoMnZyW3sOLbsZrAXq8yoBe0JJxOfY145jLDmPV7sHF6tPn+NpKPs3QTbPHl0Nea5JKkjA1vlEJ/RM1XloUogJpBakethDn/3I18QppVwqs2UfihZpkF7dUoGq7xWy2JGEDGZa7rGkAuZKS68fCEklf0nUuzJvs47UHEc2Ek0kHQA++PvvVtea2QqAsRIfxBbcBGovRwFziJOnB+4rzFCFNtqh/0KfJit7ruMP8obO95DWsELGClemYBu/zJayysKZeOXn1XXT0/0aOmLTsuv6MGc20bCu+hjdlqwOfD65v5COuAEXrx95rcqi1vj+YRatJMmBH6Ab6RYvAi8NB9S9OTVMaYK5KSpJOtvGE3oW8yChCnF5uZxHw4KvHd+L9+hjxy6o3sOGB2Pj5uu5pRcR/y0Ch38kgd2GstMOibsowUtI+jw4tvrHCTC2RgTwyvc2eG9+3y+ea5HahUaSDb0/RHJczpoUmbO732bYE8IFgi+N0RZ6xBMqL5UxSFnYADzRarxB73gNx6i2MJzz1v5lp2081i50Zq0M6sPescPeYNK6oXhYS42sQHQ2P+Wzt9YN8+gT3HMwLRmhJB+8
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:25.5128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1054e6-952f-4bf6-26b7-08dc5e6f0289
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264
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
 drivers/gpu/drm/nouveau/nvif/device.c           | 3 +--
 drivers/gpu/drm/nouveau/nvkm/core/client.c      | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index fac23a6ddc6d..7dd2b187e6d6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -609,8 +609,7 @@ struct nvif_client_impl {
 
 	struct {
 		int (*new)(struct nvif_client_priv *,
-			   const struct nvif_device_impl **, struct nvif_device_priv **,
-			   u64 handle);
+			   const struct nvif_device_impl **, struct nvif_device_priv **);
 	} device;
 };
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 40bb0dd518e9..480034b5563b 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -78,8 +78,7 @@ nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_devic
 
 	device->user.func = NULL;
 
-	ret = client->impl->device.new(client->priv, &device->impl, &device->priv,
-				       nvif_handle(&device->object));
+	ret = client->impl->device.new(client->priv, &device->impl, &device->priv);
 	NVIF_ERRON(ret, &client->object, "[NEW device]");
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index a77014b342c0..bcd375a8bc2a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -33,8 +33,7 @@
 
 static int
 nvkm_client_new_device(struct nvif_client_priv *client,
-		       const struct nvif_device_impl **pimpl, struct nvif_device_priv **ppriv,
-		       u64 handle)
+		       const struct nvif_device_impl **pimpl, struct nvif_device_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -43,7 +42,8 @@ nvkm_client_new_device(struct nvif_client_priv *client,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(client, &client->object, handle, object);
+	nvkm_object_link_(client, &client->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

