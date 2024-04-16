Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D38A793E
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A361A112FE6;
	Tue, 16 Apr 2024 23:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ht1wJdwU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D59010F546
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvPuKqPNI9gM4jBZCu1f+mHAlRf2VO69vri/fto3QWdD4kAQn7rOpKQn4e6aDakIwSV5wPAh1/zNC4cRpIsMvMsCSzVF88H4sG+S+4VoAVjE22iljySPByynaiI0tquLxdY+3s7Exh/Co5/xvltzHO+0nOkG2oaNJ3V2izSEUrjrW2jZI6UZbrREAmffJSXhJUb/5SQ1KyyjeId/lC0VZHET0h6nu95ypzr13d5DTC1yBrWqqFbg7LTsTfR2XWBajOmqyKRQQ6vJwWsyt3LhfnaL4P0g7vt1d2EtBUEe8RmfbKhh+LkAZr5uEaZlXno7zvEsxKgpdLKkvuVE4b0z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6cOrIeh0icPvtZJRbvvu1qaaws6v138UTNMjiUOhIc=;
 b=DzY0+rS+6ohmtDSDdK5EKih20rKiyvU5TbceMHeIpLmKbNFdJeUNBYRHocOQT4CsWOwajjLfrmMXwhdZCzVUqnFLGFmHvva6HsHe/YI3RrBAxCjEG0tweKwSVktma5SoQcMp58SHsnyUVkBBWFeH1P1TfK/IfHkaQf4Cc+8HF+345dZwqJv9hA2UmEO2eEsSGuS8PMtahveolagsa9t5OPVJw721hJdhnv+9KsPdYdyCjMNbWpch9rkGQxTviEePSde7FCoROhDav4m22/5cAMoaLcgIDaBvN07j7OLR5v51mnGGtno4EWxAO+h7j44zYAgKkJt3u0ffJCUWktgEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cOrIeh0icPvtZJRbvvu1qaaws6v138UTNMjiUOhIc=;
 b=ht1wJdwU1cknGWshVjNlo1G4vgt7RQoQ16rV4sdsmRrx9e0zWj6LMARwqAE8zL4X5Xv66aTMJCFbDQSTPJg8sF5RIxUYQoulGP3J3G1npjhQEL0Del0ZQWbywE4vdY6QVDBMg2HBdux6W/80XTW9AfHFvO9wxgZ++DRAVhZ73pTX9cWKFrhYGy+XVbw3VaDIrMtNSjH6ahCKrxCjlk6x3lOlx2b4Pl888xn9amXdvQH2viD48kjNhBF5ZAXiVCC4Hxg/4WWBjBS70s2ow9l9O12IildA3pcNBTYEbm+qy8oqbbVYfaRrhrvXmlvKfd3hZu2dpF22nw9WeRtLdDHeIg==
Received: from DM6PR01CA0014.prod.exchangelabs.com (2603:10b6:5:296::19) by
 IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:38 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::18) by DM6PR01CA0014.outlook.office365.com
 (2603:10b6:5:296::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:37 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:22 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 150/156] drm/nouveau/nvkm: switch nvkm_object to non-irqsafe
 spinlock
Date: Wed, 17 Apr 2024 09:39:56 +1000
Message-ID: <20240416234002.19509-151-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edcf2f2-4ebc-41fc-bdd5-08dc5e6f09ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +hEkE3YEs3PBRXC/B5iUsMedeQR6VA5gux9uSEQeQfY3Up5Qy2ZTXOj8aXFNIRXqaPQxct9+4T2CadrhHijBZ7vRNfe0rCehNePl9+EdYMWMtabo+5890LbYa3yz7VwzwzuvLOwnjjNorG0VYGu5y3ZHX2jX5lAdBYRN4DgNwxr7KVML22SyarKXK6ZuyNpBlr4t3QCtnku9nbeAZvXjDN5cUqJSD4qDs68EmuGkCWJPNei9qHf5qEXDyfnlIqahmDa504FPAusXYyu0pBnvQDum60MIcjBnIgXrqMl8J0u/5vtHHEYRdOv6LXCiyCk7BPMrZCatBX+eE03AABmXf29E13jvh2h77EFDtk1x4UMhT87PHbpll8x3afPfrq4mAobHyMbGW9+iaRFWAQdpUt4vAQpbVcFLQQKFDSxVDIhv/8vijjQdxs/qV8OZFWJ3qYGvXqOSg8DGqmoScOsWFwZSD/twTeefGxg78vsY3xnpM7M/nFT9bPIktk1dR5ApKWqQwRyaRlmPBmN05uWTHUWizxdjf6QbTti/kMFuwcKgtCuO3GuBmUTD6j+GTLESGftjY9rWdOVhaR6rfugLALDngW96nr0F79Uav9uR2vv02HOzLGC6pjNG6BsGLd3bjVMula/AhSbijYw62ra1cRgQ+R8QHCQJilRJ3LKSYYwIAz90hKXGee5L0OjGrPNKOWbjv1Mu1L9uHLd9EDVLGa3eJFuwptXG6lc6WPa9sL7p4lQprk6Vib4RRAonIJq4
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:37.6867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edcf2f2-4ebc-41fc-bdd5-08dc5e6f09ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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

- nvkm_object_search() no longer exists to be called from irq context

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/object.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 5645dd51abd5..f3cf39fb3567 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -160,9 +160,9 @@ nvkm_object_del(struct nvkm_object **pobject)
 	if (object && !WARN_ON(!object->func)) {
 		*pobject = nvkm_object_dtor(object);
 
-		spin_lock_irq(&object->client->obj_lock);
+		spin_lock(&object->client->obj_lock);
 		list_del(&object->head);
-		spin_unlock_irq(&object->client->obj_lock);
+		spin_unlock(&object->client->obj_lock);
 
 		kfree(*pobject);
 		*pobject = NULL;
@@ -217,7 +217,7 @@ nvkm_object_link_(struct nvif_client_priv *client, struct nvkm_object *parent,
 {
 	object->client = client;
 
-	spin_lock_irq(&client->obj_lock);
+	spin_lock(&client->obj_lock);
 	list_add_tail(&object->head, &parent->tree);
-	spin_unlock_irq(&client->obj_lock);
+	spin_unlock(&client->obj_lock);
 }
-- 
2.41.0

