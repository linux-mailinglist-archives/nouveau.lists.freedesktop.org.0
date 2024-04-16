Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D78A78CB
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A020B112F43;
	Tue, 16 Apr 2024 23:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Un7ktovz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7139F112F41
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq6R/u/A45kuIiuOoqRBr49wBXRKx4wetr8GP+328zW0XuVsUZeRf9V6iLWFfHG44+n9QUQcHZpFr7rO/sSoJbldcfwoKhY9QLfb+GvRlAzF0QC40RJNXYV4OSRxtVtKc4VazJj8A8DqAnTVMusASQg3UwbljCqsNGO2qvjAggyxJUJXqnBUjDpPk95ivRvDK9GWPz/n8ehWSkMJFzan8B/31xpYNzpJRJ3IbCraZmfScl0Ug3NfxlurtuF04sYfgrrxGUUzKhCP57Z8/U4KC30UlFeM+y7HadcxgaITPaVc5ehn3KhD8C90nbuxUgvRBdhKE19YRzVjB3UqbCXaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxXT/pQPcfz5zd18nvKIdLt83+qiagnxyhN9uu0b4LM=;
 b=f3BwCHXYM3K2q6O8X6FpwfMtgN3WDRIOXAZ1G9gb+Du1YxUOuo60Oqt1J0x4glqniW4Aln0t9uA5lO/KTaB3urpwzS3P22SArtQ7KnVLURp2nhAL4OGjbtBpE2wTOw3lDUWeJvoAd5eU01VLhCPFIV+cREUDCQzamX9Fk/zLRVlNoScG4hDHRQCK7z0OCyzOjXuywrdY+F8rpbrTBh4fCp3POq1KVojjtqYeu3EqgDgqapYLjrWRNH1iwkqyggdMu9+3GzZ3mXZ5AFsCjZU0nvo1cAH7qaLrGI9Z6kw5q5nxrcVsS3NXXOyh+iw6jiWvz/FMHtXplnEWDhhhK3WTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxXT/pQPcfz5zd18nvKIdLt83+qiagnxyhN9uu0b4LM=;
 b=Un7ktovzlxP9Vqrzgs/rd/myoz3l7/VwSc+NiIN8Ukcb4ZAEubaUd4M72Aw99eca18bH0iakX7z12/KDRv5oKqkidUAJbMUHjMjquOBvjwf2uiqAwalDwEWWDropm1GGuFuSf70SyjYo1odXWAl8mled6Cm0/djlAdUXSBxAtUAmN0Q+xPm1naH8xbcAESEa5FDRcWHwW69+ALD4tZFQyR2iihN3M/1eErYbSL1/5hcxEkFJklIK0XEHctJqLy6l5BaV894QTbVTiDwNDffMin7KuCERI0l72LPXVnAsrBu5LAP4nSlok/aME0S1g6MrHXwZWokr2qfDCzR9X5lXbQ==
Received: from BN9PR03CA0661.namprd03.prod.outlook.com (2603:10b6:408:10e::6)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:28 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::33) by BN9PR03CA0661.outlook.office365.com
 (2603:10b6:408:10e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:28 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:10 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 034/156] drm/nouveau/nvif: remove client fini
Date: Wed, 17 Apr 2024 09:38:00 +1000
Message-ID: <20240416234002.19509-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9e2bde-4985-42bf-c6e3-08dc5e6ebc7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NGLtWpUP9WkqiJtD3xSwPWMEvbTWZ1TT+6Bn708rj2n09YwlXI5fnaXsSVtZIWwmmJRMTzx+Sre7ZnJuH8HJSvfP69CzV3oyHDKDHaTxGqrB1dEGt2B8DzZZkmQdGgcZ8JZC4DcryrdVlbXcF8lwnzlrgIZbOIIO5k0sNFzMudHK1j2NqdqbQ7shHeLnHZcJxT17pNqbUaU4GOCpGNeGdsc7FKz904hqnc67ureo0skZu5YIc0TxLEiNI4uFoT/yc9Qmg+ykq8AMArGyWi20T+niFhCLmie/F7ayTxYbld1spHXXiVIkr1MJzV3kcfmXa63PNaWPyei0iB3At1rF6NxGLUg1T4YLfUvmfIpuD4rjRbSqQl5JkQWjz6msnLv70sSWbbknKYEr8dWlFR414I/c2RT5SIzju33wvMjAHdi8nc7n2fnlIiZ86Zb3AoTZVwfwOfEMzGcwLGr9rSnM+vW+NipfDfcwPrJZ4xjSgbqlEc3PYjLW7VVSxHX0oTSFb3A/cNocuG3xH70B+JviyyOU3171S91JeOrP6dn74rOLz1pjAygt82iOYm7aCGl2Epx/3gnfNtbUAc0hsCgEonKYJWhCIxu7hmEOAFB58xRFC4DSxYv9uxCeVSIXpntdDko+zD36eThNmaPp86FooEDWxNpEjc8svCUfK/IBwFCVVHlYoG/O/UQCXDyOCNEiERjHMYTkiNZk5d8Zogjd2AxTWG4/sSTpwVsxUJsJMeJgQyTV8ZLY3HPD5Mh3HkGd
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:27.7594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9e2bde-4985-42bf-c6e3-08dc5e6ebc7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

- unused

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/client.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 3e7049427b06..f73d58eb6de6 100644
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
2.41.0

