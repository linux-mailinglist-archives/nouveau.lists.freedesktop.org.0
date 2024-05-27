Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A38D1200
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9B810FD69;
	Tue, 28 May 2024 02:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cvBsWSBK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32010F88B
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUOcASq2lGw4e92LGZzOJO5bnLQSVlyQ2HGTCk0v9hhjO+BfZx/u/Jhk/KO3Y5gSu2yy7ypLDgWAbYKy61LkdkuM9fEC2upZK1O4YfL4Z+4HcqxuX4VDGu/NBT0h2vMZ8OoDYlf/U7NkrtuQ7rLjqRDLUj2io6jjmlQrI3fBvupXshga+rkcyyPuLxRMZxaijyHMEi+ThhgJOx/8Epr6LMjWXVD0yHocQjBZOolHbdUkFnAiLwaNJkTsMA5HwsHvb+xUj66CbS6Kyn9rh/qOB1CUR4XSHebS1GYrxk3vGMAKqXHS2wCMsFcFoafpQSyoykREUdCc+c6a433wsWgqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOWYG309oO0PHVe3mIOuPgy0e1WJ0Uo4rcq2EzJs/cM=;
 b=c65sp46j+RsxOjYVdRcRY1XoEomur8xf0cZvcQhiTuASPOpZSHm1qa/Mth7n5NEqhymv+aBsctsK6po2XU5aAlWKUAcKTx+Q1Ik1HL7IMv3/S11vLEYBRA5yMlO/j25WEMevzCj58IqZmLIXj3oIHuRm3KTB6gzNGn1fHrCimqjAqkDrrut85CY2uFtfGkanZmPc1mr3CdLOVTQflAnuu20k1ZWrT83Lz+MJyZbFkKstd8A1ptbM1DamSNYEuZddza4ihuGFzg2pL1HnrumVZW6eT8c7UicqcDE0ww2/gPHA1eb6sUUkI9/mAoq6lGSS6ETlsaoL4/eet3n6wsLukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOWYG309oO0PHVe3mIOuPgy0e1WJ0Uo4rcq2EzJs/cM=;
 b=cvBsWSBKXKhxvUOe5uc/LiZ0uTFcwmVnnF0t9OWYJ4cFLwZJ7BAa1Tb7iujB80ahuHqaA3PuwhOhg9IN0Esk9ZTh320VzLls00Ru3TA51dku/M6EkAsy5OXpAnQ60OLlSnEFw+W6R9Bg+4oNdX8GLUxN1tKMjmH7qiYZNtq6lCmWMMp+xUgZSOtlJHWFMVP4w3Djpro86tR5hZkhSGSpNxnCDvCa/vfp6VpQKcQU/eGaT2xUZHc7Whz8/qPyFd8o5wNRTqoFmp8ORAmLrwMBgjEiFB5DFy4PI5bLSZd0qFDStL5R5fA/N0jfWtE17Y6wXhjj2e3UvZ+w73ApL+OFzg==
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:28 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::dc) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:17 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 19/34] drm/nouveau/nvif: remove client fini
Date: Tue, 28 May 2024 00:19:44 +1000
Message-ID: <20240527141959.59193-20-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: fffa9e7f-59e7-4655-1118-08dc7ebd28bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ou0HVm6YQL7MUBwGgdaSTuEH2p99h/Sz8LpNWRorrPij7PQ2QlW2q1aLMe6?=
 =?us-ascii?Q?M5FSzzckol1YreY4QMF+fAUP97javM1KNAa2lMsklM/l6EPdEOfACErA5IoD?=
 =?us-ascii?Q?srEeThEySsEl25agmOcW87QBH3DYhbOTQEdqen6zezspkuxwF0jDJj3kbXme?=
 =?us-ascii?Q?bCbfXdu7MdImj9Wipxy8kQEygqO3FWAfO4pQX8DbVx08tbdqVUZ0skarjpvG?=
 =?us-ascii?Q?GXQ9iM0BdiczgdRLqGi8esBmaMM0VtTUWd3uxCovwPX4edIEAbemnIN04FfC?=
 =?us-ascii?Q?dK/l0LBH7M8umjgOmS5HyAQ7/qS39UKMPTpAENrNzjZkgC81IwSpt+nZME8L?=
 =?us-ascii?Q?x2iLZ8I8yWlNMm2KsfZS3MGkzDK+Zy+LGzjYf9yM2B9yh95MdnIEOFARheBw?=
 =?us-ascii?Q?buVJBrT1nGhT8g8tWZD5ntUWFsToRKU4f/lzcXRTuB/fVKHhiXOLnqGGpGaW?=
 =?us-ascii?Q?K0CLY8kRwrz37HYQzoaH5nKFZu2FHqyZbj17Y70g7w4B3fv/XwoCG06lCRPI?=
 =?us-ascii?Q?s12TVxtPOodHM/PGDa3Jmxn2DTnSPHBLt6OzBEWI5ID+b1ymd0A8B4RdL1Xd?=
 =?us-ascii?Q?3ccg2ip3m2yDAAd2KCXaInBiLCBrfL6oT/nlc+/QoCORlFEhNnb9pFXmPi78?=
 =?us-ascii?Q?Af/b+8YDoCu5QDc4PY4h+uozBQfByu0UUslMSVRCKFbw0lMztSIAjLRbVSfK?=
 =?us-ascii?Q?N8rO40MeuCQUp199LWivVEwAn9CVbcWpnXo8Zr6AzBa5mbBT5GHYA3Hfbxuh?=
 =?us-ascii?Q?wGcJV7KFW/v4LRta0jBEcy1Wuo245pf4zOe2OxkmPCx3EPB3AuJ1SC6TRl5u?=
 =?us-ascii?Q?QjM4lj1GtjoEvlzB5O804/F8TQZfBaGntfEFKM6ChYaiaWjI2uk7vvB4ARIx?=
 =?us-ascii?Q?dyGvMPeV4suGLExPUwzbekIx7ar21W6cUX0AcTVfT4AbfRr8KgL/L3WkcOf3?=
 =?us-ascii?Q?Nv7ZoV+3jPp0ohjZ6u9zwKWbIg5UPmZXvK/mQTCKRkTrSDDonrZK3CN/HN/e?=
 =?us-ascii?Q?396Ez9BTjWKz4/5jhwsSQLraUlmA5elyQE3GzE1LYDqqNfbdYCMTpjieGjXh?=
 =?us-ascii?Q?x0kBep3a+BudveIgGEf2QZIhoGmyD3Dc+fvyHWIsTW+lEWg9iOfkGWb6IA1K?=
 =?us-ascii?Q?cB1UPlqznVAcrDTVJTMg9ln32BvQ2kHV4bpD52BJN+QM+058Il4ilNo46gl8?=
 =?us-ascii?Q?Er9Q9BlYfNoObaetN22+8+W6bhuDAdSFk827tAV8C/ggkSJByWYEuOoCKLxZ?=
 =?us-ascii?Q?dsNfXjSXIKrIGYL+Qid7qFyf0e1Bw+bn9mWsv6tSBeJgy0XPf6nSPTURVp+Z?=
 =?us-ascii?Q?1xnBZyIO4jIEwQ/8jCMX965wlUdzAMAx7kKoZDGapzXFo7QcBwVMwGIrbE+V?=
 =?us-ascii?Q?37UZ4sR+tXCgZFh4fqySjHDOwFXp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:27.5472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffa9e7f-59e7-4655-1118-08dc7ebd28bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537
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

Does nothing.  Remove it.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/client.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 5c87146b8508..72c88db627a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -90,12 +90,6 @@ nvkm_client_child_get(struct nvkm_object *object, int index,
 	return 0;
 }
 
-static int
-nvkm_client_fini(struct nvkm_object *object, bool suspend)
-{
-	return 0;
-}
-
 static void *
 nvkm_client_dtor(struct nvkm_object *object)
 {
@@ -105,7 +99,6 @@ nvkm_client_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
-	.fini = nvkm_client_fini,
 	.sclass = nvkm_client_child_get,
 };
 
-- 
2.44.0

