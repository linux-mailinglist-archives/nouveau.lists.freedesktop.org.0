Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39692AD4B
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F7C10E44E;
	Tue,  9 Jul 2024 00:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xn4Fhbqo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7138C10E456
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0iLmDRT54T5pfIDu+bu3hxKS7h2UlRoFyN8mhkUzRB/tYzcHThi1EXXpkEwte2RLIV+qUEulqej8Ba8fbvA2MX9Hm/I7EvhprKYvAF38mZTc1yVgG2mIzrRsjFfW5Pt5PKbM730zIxNTAArZWpKjeMsv+8vV187YV+TkttF+aQVzACa04NFL1uAMZ9th1dwJMnu/uzL1ISblU+j0VIVnUNljBRP3L7+UpZ2dl8ouoNwWDTw1CPf4LuI0UrL9+fax44QzQ2oAGhI4lKofKwXNUEbT6BIJ/mqChJYxG1TIe/+RhbPHfgXqRPGYE6YsoZu2ktE9bhq1NRlU/88Lxw3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLnm1y8qRdtQrhg7h6HbEovBqNU3gM7iXd5+G7rSr5E=;
 b=GvCdA3XFjePRLjRZn0vL0WtPER66yf1Bj7dmMez/k0wl0Ho8AUgZvVMvWsbJBT07Cgpis3LZGoNRJJGL8OaxzcpxGC+M+qq0d64j9XgrRtVxouAOY5hcQjDjpJ2mZvqc4kPA8V8y4XFRW4WjGfvqW5AkIOBYgrrhyHTj3zUgi95Bo91cfZH0xs01HgaCjJM2l98i6wauoYjfATZzXRVCLuZ/LlJWXNhT28R2UZ1DWrsI5vd8g1bkBoZNFlEI6FBFIck3/qbVkWRVDMJ4+1SUfyQGheqVUJYNAdjlhmWXI5IZ7wdP4q1+m5FW6bzMPIKycqYZq18M+3pvF7nJlCVWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLnm1y8qRdtQrhg7h6HbEovBqNU3gM7iXd5+G7rSr5E=;
 b=Xn4FhbqoLDFX1Xi4qjsoM8K6Hqm/5u3x5hn6BIq3VQx+/5WZxNMMG8dTNrpbLTKExR1EmBxkAEJhqgTUm98f88ZFuLxFibsQShNjVQ2U8IxsAQqoFXS1NSy3aN3GWh8ymeqTSQePSGbHI5XlcR5jg34ssOYgJNSbKPl4Jo3Cd2pyptFYS6uTUhvPJFQDFPLPeuagBZ6LGwV2nTusIZUXtPmzCgSJ9mlDuV8YoclJv2hFSPREWMNOmYKlM4eEQVEoycJFI/PKugO9tTOuOAyaS00jUQgQ37MhT8K3bVucH7wb9+DfiqpJRW+RlNzgEnoazs/gR3QQ9hXbGemT7eyQ6w==
Received: from DS7PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:2a::12) by
 CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 00:55:05 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::88) by DS7PR06CA0001.outlook.office365.com
 (2603:10b6:8:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:54 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 05/37] drm/nouveau: store nvkm_device pointer in nouveau_drm
Date: Fri, 5 Jul 2024 04:36:49 +1000
Message-ID: <20240704183721.25778-6-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: afc1c451-5421-45ed-468c-08dc9fb1c576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?beERcPpqW9Rv0vtahBFsUZqLyS2XGC8vruZ8uwyGJsmuqSKMpEaOTBQjzfwh?=
 =?us-ascii?Q?qVBxxqc3AxYiOvJ89VE1pAaFwsuOIhKVCcHfkDKXeBEWcOw4cXRmrblaQb5G?=
 =?us-ascii?Q?U/4LB0VK2aQH1snHxmJ8Jt9MaknEKsqcq8JVnGEVNKsZdDT5asMj6P6ID8PD?=
 =?us-ascii?Q?dUxlsREsmeX7AtIDpWCKBxWbp6DtsRf6fClHDkixyySh9BlrzyHvxdT5oYUB?=
 =?us-ascii?Q?3WWa4BunyNoKZEHgpcaVyR2ML5lkmxbAu/4iODj5FVg6kgouL3TNaPLIo23t?=
 =?us-ascii?Q?QPdLzbPuszew0OLdYxQX2NcnM2I6EUHZnIDsG0T1K9L9W8UMBCI35wKattGp?=
 =?us-ascii?Q?xeYi2uHSCOhNlFIx37eSTo5KWRyGKyPfSMqIfEeYMjej8/k8eMnVjfuVx32R?=
 =?us-ascii?Q?2kibSnJ9QIyIWxBJNy+LoKm3+l35vJ62ha8udAqu/BJpR1asLg5S9AvqKRe7?=
 =?us-ascii?Q?kaaNJPiAJeuHvV9YIGIFnAQ9YALnfH2pookDhjTVJwl33gYIp3JlqUii0jLA?=
 =?us-ascii?Q?yagUX04dCx9QvJUGu7f30wRR1kdlhbQnZEm6R+iYupyCV5pLC0zCYsRsmU4c?=
 =?us-ascii?Q?96Ldyu50Z8glWrlTDdVB4fjL9ag+EK8xcBXizTtH6VkBMsDtXV59mXFBFpVB?=
 =?us-ascii?Q?pmqkgSuTuOi3up/dFSCF/z2QOPQ5A2zMAk7TYeEqYT5D4VF/bpCEsDmwaGho?=
 =?us-ascii?Q?XMPEw0/OH6Y7X9w6s+QWiRApwjg2byjiUKriFSZswr5f+Kw+rZr/Z+h/GtBp?=
 =?us-ascii?Q?YPPf+ZmfmYhDeeP5IY5wv6e8CpY5WjpPQXrI8cZHStjCEsYIF1DW5kFIpvde?=
 =?us-ascii?Q?Ulw0q7YltUCI9kiCk+JUH870LBJhAWUwBmeDCegtgQwXtugEN0Tw3BvCj8/a?=
 =?us-ascii?Q?1q14USlMbdK6VcwYJWaNU18sHIeTVR4GzuzONVs6EMqdO6yG8yhnFb5qrV35?=
 =?us-ascii?Q?L4S/U4k9ykY2lL83VooasrXAdVCXmv4yRh6ad//ZPB0XzEFS//G62h/ika6L?=
 =?us-ascii?Q?yI9SaeROTmo+HzxLjbtqkh/DWejF1nOKIcIFEGlgdSFLfdaqLHtIPcTc/9lx?=
 =?us-ascii?Q?sAje5oHKX9IPbkxnT+S7AfIOdbBX8LVQGBhiXLJhPqtBGFVfBPK3/vwxBq/K?=
 =?us-ascii?Q?RVYeG/8K1aa2u67N5bXsjcA+cy3CHXjeRoj0nrhR5EIBm+hI28FIcLzBLoF2?=
 =?us-ascii?Q?2CdID8Z4DX1NkpQru+gPNASmED2wxT7SXa45imTXaa8IcJxEAT1XhTieqETd?=
 =?us-ascii?Q?EdFqu4HBO3Pny9lrRkDTL0yHoJv41m/3L08+N35WxXNnpUEzVxHh8AGx0mLC?=
 =?us-ascii?Q?gss1PrH8584vQYw2O2CHbP+wyfk1ekQZDNOekItCklqm9uWoJAvvP34WdrQy?=
 =?us-ascii?Q?p2SYomcUURsClI5ldBuKfvSJV09XAPc6aFbbu24xmerti0jU94K+pa92UWov?=
 =?us-ascii?Q?O0UYfRXe4GvwMF6xUPF+o2jhgWmXCA8b?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:04.9095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc1c451-5421-45ed-468c-08dc9fb1c576
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
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

There's various different places in the drm code that get at the
nvkm_device via various creative (and not very type-safe) means.

One of those being via nvif_device.object.priv.

Another patch series is going to entirely remove the ioctl-like
interfaces beween the drm code and nvkm, and that field will no
longer exist.

This provides a safer replacement for accessing the nvkm_device,
and will used more in upcoming patches to cleanup other cases.

v2:
- fixup printk macros to not oops if used before client ctor

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c |  8 +++-----
 drivers/gpu/drm/nouveau/nouveau_drv.h | 16 ++++++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f372bf2954aa..140e27af0d64 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -751,6 +751,8 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
+	drm->nvkm = device;
+
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
@@ -888,14 +890,10 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 void
 nouveau_drm_device_remove(struct nouveau_drm *drm)
 {
-	struct nvkm_client *client;
-	struct nvkm_device *device;
+	struct nvkm_device *device = drm->nvkm;
 
 	drm_dev_unplug(drm->dev);
 
-	client = nvxx_client(&drm->client.base);
-	device = nvkm_device_find(client->device);
-
 	nouveau_drm_device_fini(drm);
 	nouveau_drm_device_del(drm);
 	nvkm_device_del(&device);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 7e624c587fc0..e7d072a9a477 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 #include <nvif/parent.h>
 
 struct nouveau_drm {
+	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct nouveau_cli master;
 	struct nouveau_cli client;
@@ -332,18 +333,21 @@ void nouveau_drm_device_remove(struct nouveau_drm *);
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
 
-#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
-#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
-#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
-#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
+#define NV_PRINTK_(l,drm,f,a...) do {             \
+	dev_##l((drm)->nvkm->dev, "drm: "f, ##a); \
+} while(0)
+#define NV_FATAL(drm,f,a...) NV_PRINTK_(crit, (drm), f, ##a)
+#define NV_ERROR(drm,f,a...) NV_PRINTK_(err, (drm), f, ##a)
+#define NV_WARN(drm,f,a...) NV_PRINTK_(warn, (drm), f, ##a)
+#define NV_INFO(drm,f,a...) NV_PRINTK_(info, (drm), f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
 	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK_(info, (drm), f, ##a);                               \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
 	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK_(info, (drm), f, ##a);                               \
 } while(0)
 
 #define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
-- 
2.45.1

