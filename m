Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9492AD4C
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8497A10E234;
	Tue,  9 Jul 2024 00:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WSllYROO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A9F10E44E
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQDJrI5Gv6K0SozpqMeyiSfZueLf1LgDcedgoKRbGU24jA3Ig9vpMWmOWuiQGPvBll35wSj2OhYvJ6jpP/4+nHHjj4XXIkZLP0MoO9TbvV36306qmlKTPh1ZfTEb+j9ye5lIyetHD+NVqh1nNQKg6M590+Z9izwC8WZRGWjKUnhg/PsfCuDWjsAilKLSqMIq9QM191Sa6HAS/D8VYxx7ZylhL3mp6hbzODtD6HU1OeLBK0gL/EtY15aSMDaNr9+6M+A+U32bBNUbZjo/toGLN6b4j9MW20UblAYMzv/m4tmQ9iIK2OifSLtVRjb3KEEppZFdl/dlYiaZRZL9bSOKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzdxpQHShVBcf/v/Jcx7G+IXQ1hDQ4tI325it3vG5y8=;
 b=QhDOyqojUK6aYl6Fnkn3W7pl84AL61JydyqU/KPqc5U0lKPRrb+/ASSbqOlSdKjtVRrXi2ZSLzsg0+Hm6iUKbnY8P1v/L9Koj2D4pjMNaRwND64ia5VaoPVqeVqpbpqmMPhYDuhGIWXbpc7nBkq81zuTzvO6WS/ETuN3VPR6WWORbtFSwNfBebugRt9NL+YzFMDBAyMYtLNFBfODYPKjPTfadBl8N2/yXn1OWXIK3BTnog/HkbmwYaYi7ZiRaPGVz369UfNhbcTa5d5EjZIkawL6gG6zd2+3YHpYYh32d708wbniwv7gjzf9Pcn8PmvNYwm/JosIjo5sKS8QkGAQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzdxpQHShVBcf/v/Jcx7G+IXQ1hDQ4tI325it3vG5y8=;
 b=WSllYROOspQiaSihtin2uzlPy6Hm/QT+W2B9r5ocJFm7Kk/ueWWaeEXpkpYj/SCUZMcTVVecxkjWCNtSMtwfxHQNz3VnXPshIoWOsS+ULuinO3QHPWj3nMCFWYc2zdqf/YkzJpYXGgqBCXjFgMCqrzpK8F0xHlOCGRXRs3mGohA43Wx7+Yx1RS23AY/aODAIy5bpcziZ++/6kth9sR57JlvbTvqdVuGVTCiPAVjmVZZpCJ2/yiaS/Fhoh0wbMMrag8034PArq4CqYnajXkIHch21978jhMKOR/5w45VtyEuxZan1KibqkGH/0WJTnDUdTv1jGoKXa5nTYugh16c5jQ==
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:07 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::66) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:06 +0000
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
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:55 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 06/37] drm/nouveau: move allocation of root client out of
 nouveau_cli_init()
Date: Fri, 5 Jul 2024 04:36:50 +1000
Message-ID: <20240704183721.25778-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d31064-9594-4426-9c4c-08dc9fb1c68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jvu/slrSaf58oRCBl/YB77+2mYKJPvZ/GLErCllcBc+/uYzskfySEQDyK5Hw?=
 =?us-ascii?Q?JAWSlEmEVH+++RgmG2Bw5W/X4zObHoxNLapWHxEzbSSZvLo4TM/M/ATjKmE8?=
 =?us-ascii?Q?VzOUohKoQMsH+NUHtbMlct+1x98yThYb/ANyRQgYqEapE8y8IDhE3rmCde37?=
 =?us-ascii?Q?mQP9bD5pj+xR3k9ZM+zvNQDpos9zfwzVZ2WEzOb31gnQOcHXT29GmOInPRpw?=
 =?us-ascii?Q?kG6O4wBWQnvUbdSRo2HEcNiVgWtizqkZbQ0eXU/ZUczW1GU1/JBvNPE8vvPV?=
 =?us-ascii?Q?JBjldwm2KLoAmPdnS1PFq50kE7xECnWGf1RhstCGAhbQFd5OGMBKZlrFsdr6?=
 =?us-ascii?Q?n+n/zlARPt5Z0+xfScmz8PY3zqf6rvYK+yEk1cDZoWaCuAcedkGXcTfKuLRF?=
 =?us-ascii?Q?Mk60H2bg+X40WWsjd/9PawL+tMRThyBLCo665ZDAUsyEWtJNQwGQ8VLATynI?=
 =?us-ascii?Q?+VMvrmMbObP3LdzoMKgg99H6av9sOzaRpto5zGixTB95DmujB5N0SQ515YMg?=
 =?us-ascii?Q?lmcvvLbJiQ9Hsugvnd8JYtW+dh77HG+Y4e1GvM7iQcfajDpksy76cc8bxBW+?=
 =?us-ascii?Q?TrZRHg65L+oxe6PZqLMJ+9o37JrcOdgfh7qGtOh130ITUEkddhD/a7lfqAB2?=
 =?us-ascii?Q?84cQEqFWvfDRttKG3HRAUwLCe9GYpS1aVrysKjg+oq3N3J2aGaLpzMvbI07H?=
 =?us-ascii?Q?+LHdNR9usrKAM1HamgJ+WfpwEshlesWEuPuhxWJF0noRiSBisRXd+wfa3t+a?=
 =?us-ascii?Q?mhx0YMF3cJtNwQDG9OqBwl10oqD0k3oZeJQSQuAOPMh7QpBoPh3FWVTo0oeU?=
 =?us-ascii?Q?ba1NC4iotLWdwSKuL5j62qbOmONp8KWbzbQMg89uyE0LmQu4cxO+YZsXyfQR?=
 =?us-ascii?Q?LW3iOVSP6DC1yen4cZr/9p/XggxaHuD7Wl266J24TLHzqhun3hYpksmcd+PP?=
 =?us-ascii?Q?svDcJQ8dChDCZLnSFH4NktOmZYi/881POi+OWPSfg7ttzS7LZGBc8e+kdRyc?=
 =?us-ascii?Q?M3icXleDD2jt8I0WMJf3dkJCeSpy63BmSBguMZBdooHUAOvcq2PTSs7ybxPW?=
 =?us-ascii?Q?BOhJ0qO9Y0kp/xNpynKLGKVCQogL4wvwqBLfLURCO/yZior/m6IxEclzqX8P?=
 =?us-ascii?Q?DSTnTR0BWjIOx8a063xdDrdc9CEAO6xdunIZcsd+WUxLvtZfn30HC+71FLdF?=
 =?us-ascii?Q?JvY4kbMIwvfhTcJ5//M/BeKCaVPYea4YpmOnKqbmwN17Drl+nho7x9kYMSIp?=
 =?us-ascii?Q?uNXzyVG8Q5cVQsyf9RePzp+zxij8FlkSLtAvLJU1nkDgc2SEKLXXwcmylgPq?=
 =?us-ascii?Q?Z4M1KH/vDEq+eQAIiL3DX/dnC9CZYbiq0gU17U0UTPSi40hUrWJFR5wasL2d?=
 =?us-ascii?Q?zPLBu5CZskEkOqn7b55NlU7gly1q16/ss9O73bh2GBWUaKuR0unJHHJy451i?=
 =?us-ascii?Q?18ZpsFlYV+jRbUTVMrAt7NJjsgr4DJGO?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:06.7533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d31064-9594-4426-9c4c-08dc9fb1c68f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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

drm->master isn't really a nouveau_cli, and is mostly just used to get
at an nvif_mmu object to implement a hack around issues with the ioctl
interface to nvkm.

Later patches in this series will allocate nvif_device/mmu objects in
nouveau_drm directly, removing the need for master.

Another patch series will remove the need for the above-mentioned hack
entirely.

The only other member of drm->master that's needed is the nvif_client,
and is a dependency of device/mmu.  So the first step is to move its
allocation out of code handling nouveau_cli init.

v2:
- modified slightly due to the addition of tegra/pci cleanup patches

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 46 ++++++++++++++-------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 140e27af0d64..a942d2c03d44 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -129,12 +129,12 @@ nouveau_platform_name(struct platform_device *platformdev)
 }
 
 static u64
-nouveau_name(struct drm_device *dev)
+nouveau_name(struct device *dev)
 {
-	if (dev_is_pci(dev->dev))
-		return nouveau_pci_name(to_pci_dev(dev->dev));
+	if (dev_is_pci(dev))
+		return nouveau_pci_name(to_pci_dev(dev));
 	else
-		return nouveau_platform_name(to_platform_device(dev->dev));
+		return nouveau_platform_name(to_platform_device(dev));
 }
 
 static inline bool
@@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
 	nvif_device_dtor(&cli->device);
-	mutex_lock(&cli->drm->master.lock);
-	nvif_client_dtor(&cli->base);
-	mutex_unlock(&cli->drm->master.lock);
+	if (cli != &cli->drm->master) {
+		mutex_lock(&cli->drm->master.lock);
+		nvif_client_dtor(&cli->base);
+		mutex_unlock(&cli->drm->master.lock);
+	}
 }
 
 static int
@@ -241,7 +243,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{ NVIF_CLASS_VMM_NV04 , -1 },
 		{}
 	};
-	u64 device = nouveau_name(drm->dev);
+	u64 device = nouveau_name(drm->dev->dev);
 	int ret;
 
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
@@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	if (cli == &drm->master) {
-		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
-				       cli->name, device, &cli->base);
-	} else {
+	if (cli != &drm->master) {
 		mutex_lock(&drm->master.lock);
 		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
 				       &cli->base);
@@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
-	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 }
 
@@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	int ret;
 
-	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
-
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
-	if (!drm->sched_wq) {
-		ret = -ENOMEM;
-		goto fail_alloc;
-	}
+	if (!drm->sched_wq)
+		return -ENOMEM;
 
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
 	if (ret)
@@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	nouveau_cli_fini(&drm->master);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
-fail_alloc:
-	nvif_parent_dtor(&drm->parent);
 	return ret;
 }
 
@@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	if (drm->dev)
 		drm_dev_put(drm->dev);
 
+	nvif_client_dtor(&drm->master.base);
+	nvif_parent_dtor(&drm->parent);
+
 	kfree(drm);
 }
 
@@ -753,6 +747,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 
 	drm->nvkm = device;
 
+	nvif_parent_ctor(&nouveau_parent, &drm->parent);
+	drm->master.base.object.parent = &drm->parent;
+
+	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
+			       nouveau_name(parent), &drm->master.base);
+	if (ret)
+		goto done;
+
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
-- 
2.45.1

