Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F198A7935
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0B6112F92;
	Tue, 16 Apr 2024 23:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo80ICu2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D487112FA1
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXK5XCsFAYZGcwxrledJy/sMyBo4AbX0GgePlVNx1MrGgyzELxfDXjwUuZCNQWWgnNUrHxIfzkyevnYPkinSZnz0Ee9A6yAGqJ9yCu2cSb2NzrpYFRbVjv/gkJsGD0Rb11HdQ43tgz6itjK5oMAQZsh+kx8gjphd/TYWhmLdBfsrMRrjYKuSj7Q5jZonF7HKZ8ZLibe3I/ZEv9R/oqS0iRgRgxPxHlAcbXxwv8SOUXoEGxSxtqMhTc5KkazXGxQqByCZvMRN0HQxNAGYnCpZrvV206m1RtzkCAA/0iHiy+eBcyhau8jCKX0Wsrrn4qE7rFdoVhmTS8hIB177Wk1ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq1hvCrec3YqHABD5VA5JEkUEijyeOfU5s8UNvmkFhc=;
 b=CIp/S04vJjw0P4VJPil8pZ+DzGEDtboFqqLsC7K7RJC34qQXjagbs6X7A6Ci4PQb4LKMN+iXwigszA/37iuuYdO0P21EB2St5kKbdjMdFTcUuwYink1GOpFBWETO91yHpbHFi43zerwtfziUX3HPIKLKcnqimdTm/TAiXU2TcWPhedsT5o/P6E1MtYZUaxJGKmE6MVdoGeoT9GxlAYvcXSL25ZWQ773ChojT61I+KQMbc8myWb4dD55glStaDPv2nDhX4pUQ6XO5u/AidWsRxXrslOImsoVvxWNTTEIKHbEQS0/rEJ6cFeXqON6kXIl5iUIkDqR5p7HVTGNLm3rEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq1hvCrec3YqHABD5VA5JEkUEijyeOfU5s8UNvmkFhc=;
 b=uo80ICu25LmbQM+hHK8yMPGextDENJsOHudS2KzjpKtTb4zlddwras0htobjzZkbpQOHLy7kUTLIvAXX8uV4f/fMpsTxOVA3wQLSlLCdzazllGAHxYNzgqgTabQreiCHZSmhokuE0eO/f3MTkwg00Ip8l57vIdb02fKxSwiBsPztXS9IGBchyAXoXNsGqJAR9rDyh/Nac/3MAGv0SZNI50kEmxm0GuKW5GTNjHC3bS0Sv+nNCvztaX4V1ZBYhUPhHolduKVg97HjE/nCzQVVfdTZ8ro7WfAJhbTAcmLZd7wRUzBkxALtg1zQOjOTMsgPnmEkB1g5Nl3RUnabtc9I9g==
Received: from CH0PR13CA0038.namprd13.prod.outlook.com (2603:10b6:610:b2::13)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:21 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::c) by CH0PR13CA0038.outlook.office365.com
 (2603:10b6:610:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.19 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:58 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 129/156] drm/nouveau/nvif: remove head from object rb
Date: Wed, 17 Apr 2024 09:39:35 +1000
Message-ID: <20240416234002.19509-130-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7a06ce-6d37-4458-8821-08dc5e6effc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soViHTvElOqTlskncQg8Ela5N8imA/1Aaq8ZZaf6pAX0EEphIbsgHZh8XfKA9hvWazc3smot7mERizmqtf1ogeCodMdhn3BHsaMHj5iNZeV48zCoDKAhoUbeHqbu1TWRS2WUHm9Ytl+l6cvDDqGnrGK5tlh8KSKjtb2BL71SpF7pwQ/GSBOXoHDTGiwUdvdtkG5y7pD8pjJ1TH913MeupD2F85PV0n0v2q8eyKsj5O8XNrPgLbsYn211VCRGA9k0hU0XgyqXiktFxeC3jH1Vg9saimpHqmDviC9DwObUYABZodfmWfIIcpWtJ5xZPT0Cp/ZCWxOX84nNSBhnO/fUiLfU9DI6v205C85IHTn3tPi9VcuqwEedTmd6VeHttadvFIjN2KVy4ottnA6TPkbKrT9nPxRVQsr7rGuenQGyWX+04sBn3SZg6IAuVsLSZfKK85LGG5D/9LkccrmLn4K4HmsZ97UHHL+vh3SevNnxTQaXVxq1+05RxOFhHFzBwVqUlLGMX94e2NoV5XCt3rP3W+6hC7HDRSlR4mlebM2DpLwQTal12fpr+EHQ+GhTDZJCFBfmTFnJOknGAeRrE3IsAWpUGKqTGFIjhQ7uf69vCCWqbJv0PTEeCJ0PNFJpGRoZ4NVv2nc95Jsdio83bFdvVHp19rWSF94NGN8n+d6zzIuhbS//0h6gBwPbanslU2BVelBpJKAS795+UDArFBz2BzmREmDlmLfXfm0t4hRw+LYCZ+M6LBswD6QpCa7tMUi+
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:20.8663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7a06ce-6d37-4458-8821-08dc5e6effc6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  | 3 +--
 drivers/gpu/drm/nouveau/nvif/head.c              | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 7aa44e4fe729..e66d29b3db63 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -384,8 +384,7 @@ struct nvif_disp_impl {
 	struct {
 		u32 mask;
 		int (*new)(struct nvif_disp_priv *, u8 id,
-			   const struct nvif_head_impl **, struct nvif_head_priv **,
-			   u64 handle);
+			   const struct nvif_head_impl **, struct nvif_head_priv **);
 	} head;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/head.c b/drivers/gpu/drm/nouveau/nvif/head.c
index 05f56169e6c3..0800eebb920a 100644
--- a/drivers/gpu/drm/nouveau/nvif/head.c
+++ b/drivers/gpu/drm/nouveau/nvif/head.c
@@ -55,8 +55,7 @@ nvif_head_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_hea
 {
 	int ret;
 
-	ret = disp->impl->head.new(disp->priv, id, &head->impl, &head->priv,
-				   nvif_handle(&head->object));
+	ret = disp->impl->head.new(disp->priv, id, &head->impl, &head->priv);
 	NVIF_ERRON(ret, &disp->object, "[NEW head id:%d]", id);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 6a65b3bffc19..dc23fad17b81 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -80,8 +80,7 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 
 static int
 nvkm_udisp_head_new(struct nvif_disp_priv *udisp, u8 id,
-		    const struct nvif_head_impl **pimpl, struct nvif_head_priv **ppriv,
-		    u64 handle)
+		    const struct nvif_head_impl **pimpl, struct nvif_head_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -90,7 +89,8 @@ nvkm_udisp_head_new(struct nvif_disp_priv *udisp, u8 id,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+	nvkm_object_link(&udisp->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

