Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C872B92AD49
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8260810E43F;
	Tue,  9 Jul 2024 00:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qfBh9SMy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1510E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/4VZS8FnXoSTMrdI/O9BbJn03jkQCa5hSK7ao9/yCmuQU1bNBUQFWiJl95rq24oc0nWzJSd56IJsbnP5oqb227lsHibJFTsi6yu2vA7BIYqM5mKpSFfeD4G0bbyUXzsU2YF1sDbntrVU9EbDUyPCmSeDz3Kbt/b+wkYhKKMNpnQCFMHwKKWG0Ju9o4jK+8GfbZV6Og1TpbYIojkwHwu1hTnSb5/UxsBOBMTs9SoimdDFxKloY6jPBRIOGQPY3TQs7hF9g060v/J8EK5pC3H/ztDMARpxYbV1ieA8lIMEcQ6mwfB+D57yV+fuDRf5+sS7Yjs1Umm73natRwmQgDi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9b6Xp/sp/oVzQ0onuPQR0X1zAfr35Sq6OTDk+fI0Cg=;
 b=dNxfSsClQdoJ1znqehCLpypqA15uKDkUPw4HdksN+lEAiSDW9D5vInOqTkK0t8v8Po1608HFcIdEbyOToumvNrxm0qwdebHRaOuc/hARY7O+HICPSOT7RLDUTBwzq1zBpEdcsYQGQpjdPJMs1dV81QexOp+l8BlcvcrKnuKNHV9xCEmfAyskKCRP0VGjO1sCM4Yr8kYdlTuwuQkO9K8hhkKD+Q/6ol7/NErSI3ZT6+RRhRAt3v51J+WeO4hWL9eB7q+uCDVIg5ug0/5RPuuEIFg+rZpzlyn2pyDvZDKEdo+NfdNzWRHb2W7/DORuNLdVaOEteqccFiioqF4nfgec2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9b6Xp/sp/oVzQ0onuPQR0X1zAfr35Sq6OTDk+fI0Cg=;
 b=qfBh9SMyOKBTJQyXC32ng5Nm77gWt49SnT6mipuRU1f+vsf7JznfvWMwv0+q+Z9g0w+XBJgGtnZA2+KmAGrcYCErCXmjnX7D08KhMFWX7B1wZf+WLoeLLTmOSf4oaP7GGoWJbB6j/NYMLZ2xczBf/kQ+NsPpbD5OS4BuV26Diqqy5v9a2AUXPxr9zYmbdt3apeWGf/mHYqn17cmHOWIKJJ4HeMhYyHFbhx4X1K8pFBMy2LlwGug5Y/6FFZGzpXG3Y+ebRflnF90EfFiFdZQAJMIAeHqAqk0dXSeJG/Xcqlo8pFv0bP4sqnqCAcnBJvHCEsDoiBzcZExCBcxk/fI1Kg==
Received: from BN7PR06CA0050.namprd06.prod.outlook.com (2603:10b6:408:34::27)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:54:59 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::a4) by BN7PR06CA0050.outlook.office365.com
 (2603:10b6:408:34::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Tue, 9 Jul 2024 00:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:54:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:49 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 01/37] drm/nouveau: move nouveau_drm_device_fini() above
 init()
Date: Fri, 5 Jul 2024 04:36:45 +1000
Message-ID: <20240704183721.25778-2-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d7b13f-2e5c-4223-5633-08dc9fb1c1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j97MefAhWozJvJxuabi3k67AsOvzUNRn7ezDc/IOu5qkKsVOqiKrXBBYGoNI?=
 =?us-ascii?Q?mheN9fl3LssvsTVPDOr0nQGNymmId4RP7chMSED4DyIcmxxSbieonWfG8wQ1?=
 =?us-ascii?Q?er57yaTfBOuUKYvTI5bBX35iGPkSP5x77nAemG5Ua43nQg5jJC22J51kElpD?=
 =?us-ascii?Q?ioSN6xqBFAFDn+wJfKe4qSdnhXDBk4A4mfrBMLk7vbLruPld9PreLNFsf8VN?=
 =?us-ascii?Q?p76kMGzj1CjDc0SN/GWal8lGqhYuTsDlmGfHEQ+LkoYZzMUy1H3ScZazbR5U?=
 =?us-ascii?Q?ipp8CXFZ17w/kolZsKEyyt7RiPNRTr0UUv/3qfnBviFrf6qnImW1CJKPuk9O?=
 =?us-ascii?Q?DoQxKV6vPlhj1xnTrvBFZwfTyrzaQwcI/OwjL293L8wOBcdh01O7GpujMGmi?=
 =?us-ascii?Q?P/rej4zeePM9ah1/SpVmqRqs3MkGRdKTXwKR+dL8oj5iJAsgqJj1b2o8IsIA?=
 =?us-ascii?Q?u43GsbyhjZdScbRH0pGIdtPTvEEk8ptcwu8st9Bu+FeQlIwlHwJCLQWsCNIg?=
 =?us-ascii?Q?Ptsl79CaciJqo3nMkY7jRmI78y3qbOBy4f9KwpahEHwGGjOQawgST2YqxIPT?=
 =?us-ascii?Q?M6HHQR6A6lwV/3WHOqMli4Y6KFSDM4p00MBxXNX8rkno8EPaixk/CTxSjjCg?=
 =?us-ascii?Q?RUWi3ynR4pZsESLcGaBUc3ZasooKgJHvfSR8dCailqGpTSsQVePqwUAr3+3R?=
 =?us-ascii?Q?WSWPsRWE4XQBJTM+/cC3Qi96an923thv78/6rx0Qt5UFsxQokyD1p+5V8Xyg?=
 =?us-ascii?Q?GyHYzHG+ex8fLO6Ve3WfVl1/2ZY98wl0cOOKImGSbGH7QAv6FtdtlQqNmUv/?=
 =?us-ascii?Q?n4G3EvmW93yHmWC33v7tJv1M7u3quNOaeiCybXdxcqRSy1CMFpx3SZXONasd?=
 =?us-ascii?Q?tzVP/SvnxodwkwCO2q+PngbxECZCOSR0cp/c/Ma5cCuEC/5kTxn3OMYwhTI/?=
 =?us-ascii?Q?vz2HlOYuNV4/e6I55VJ0wazROxae2HMm75xaU1qt9/e1i8rx3H0Dr4D+8ndP?=
 =?us-ascii?Q?phCKZ5uLvzzAPw0xWHAnSb9xLcS3VhAXQCwhXTbzGHuFdCRyQEo0zwduKAkP?=
 =?us-ascii?Q?IgWwkELy7lkGCw7kVDWxztggRVNxpHTnjqKBZuKvm6r1L8m1fjfGamFHZxuT?=
 =?us-ascii?Q?BjrBqavMN1xfuAcrQZftW9C6eIb1uF8o96SKDTh6bm5Cgf1HnSWA7nqhkch4?=
 =?us-ascii?Q?Ll8IKCci5JfCBUBvYCcwOsjBd4CovVbs5BLuwZjvZGVsAxUI9h+GtIA9WFud?=
 =?us-ascii?Q?JhnMJvU+e6Tv/qkI94F57kJ5wVTJcP8XgLWQfqf5wKKoGCClaYXxM5wFLbRQ?=
 =?us-ascii?Q?whcjDMCL+VmvFudVQuRtr5Jqd2VgrjXjGo9TWFcrCspDenwvvtOJj+TURIew?=
 =?us-ascii?Q?pEUUD/zONgHBJMCQ2sszEU0bdl/t3jIxPPvb1G0CUjI1Kp/DDc+ASLa5S1qg?=
 =?us-ascii?Q?EtkKoa49WS+71rU9b3rtNZqxIEoZGjDx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:54:58.6936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d7b13f-2e5c-4223-5633-08dc9fb1c1cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
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

The next commit wants to be able to call fini() from an init() failure
path to remove the need to duplicate a bunch of cleanup.

Moving fini() above init() avoids the need for a forward-declaration.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 106 +++++++++++++-------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..eae48c87e3d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -578,6 +578,59 @@ nouveau_parent = {
 	.errorf = nouveau_drm_errorf,
 };
 
+static void
+nouveau_drm_device_fini(struct drm_device *dev)
+{
+	struct nouveau_cli *cli, *temp_cli;
+	struct nouveau_drm *drm = nouveau_drm(dev);
+
+	if (nouveau_pmops_runtime()) {
+		pm_runtime_get_sync(dev->dev);
+		pm_runtime_forbid(dev->dev);
+	}
+
+	nouveau_led_fini(dev);
+	nouveau_dmem_fini(drm);
+	nouveau_svm_fini(drm);
+	nouveau_hwmon_fini(dev);
+	nouveau_debugfs_fini(drm);
+
+	if (dev->mode_config.num_crtc)
+		nouveau_display_fini(dev, false, false);
+	nouveau_display_destroy(dev);
+
+	nouveau_accel_fini(drm);
+	nouveau_bios_takedown(dev);
+
+	nouveau_ttm_fini(drm);
+	nouveau_vga_fini(drm);
+
+	/*
+	 * There may be existing clients from as-yet unclosed files. For now,
+	 * clean them up here rather than deferring until the file is closed,
+	 * but this likely not correct if we want to support hot-unplugging
+	 * properly.
+	 */
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
+		list_del(&cli->head);
+		mutex_lock(&cli->mutex);
+		if (cli->abi16)
+			nouveau_abi16_fini(cli->abi16);
+		mutex_unlock(&cli->mutex);
+		nouveau_cli_fini(cli);
+		kfree(cli);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	nouveau_cli_fini(&drm->client);
+	nouveau_cli_fini(&drm->master);
+	destroy_workqueue(drm->sched_wq);
+	nvif_parent_dtor(&drm->parent);
+	mutex_destroy(&drm->clients_lock);
+	kfree(drm);
+}
+
 static int
 nouveau_drm_device_init(struct drm_device *dev)
 {
@@ -679,59 +732,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	return ret;
 }
 
-static void
-nouveau_drm_device_fini(struct drm_device *dev)
-{
-	struct nouveau_cli *cli, *temp_cli;
-	struct nouveau_drm *drm = nouveau_drm(dev);
-
-	if (nouveau_pmops_runtime()) {
-		pm_runtime_get_sync(dev->dev);
-		pm_runtime_forbid(dev->dev);
-	}
-
-	nouveau_led_fini(dev);
-	nouveau_dmem_fini(drm);
-	nouveau_svm_fini(drm);
-	nouveau_hwmon_fini(dev);
-	nouveau_debugfs_fini(drm);
-
-	if (dev->mode_config.num_crtc)
-		nouveau_display_fini(dev, false, false);
-	nouveau_display_destroy(dev);
-
-	nouveau_accel_fini(drm);
-	nouveau_bios_takedown(dev);
-
-	nouveau_ttm_fini(drm);
-	nouveau_vga_fini(drm);
-
-	/*
-	 * There may be existing clients from as-yet unclosed files. For now,
-	 * clean them up here rather than deferring until the file is closed,
-	 * but this likely not correct if we want to support hot-unplugging
-	 * properly.
-	 */
-	mutex_lock(&drm->clients_lock);
-	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
-		list_del(&cli->head);
-		mutex_lock(&cli->mutex);
-		if (cli->abi16)
-			nouveau_abi16_fini(cli->abi16);
-		mutex_unlock(&cli->mutex);
-		nouveau_cli_fini(cli);
-		kfree(cli);
-	}
-	mutex_unlock(&drm->clients_lock);
-
-	nouveau_cli_fini(&drm->client);
-	nouveau_cli_fini(&drm->master);
-	destroy_workqueue(drm->sched_wq);
-	nvif_parent_dtor(&drm->parent);
-	mutex_destroy(&drm->clients_lock);
-	kfree(drm);
-}
-
 /*
  * On some Intel PCIe bridge controllers doing a
  * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
-- 
2.45.1

