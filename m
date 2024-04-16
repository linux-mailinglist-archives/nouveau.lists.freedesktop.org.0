Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0898A78B3
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769C2112F2A;
	Tue, 16 Apr 2024 23:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fb7xOS5u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A428F112F23
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/bjI0wJkOCqalitogb47ekkDev0uL1p44R5K4vS1WrrxgFUbSor2oNQorMZrHJ345HuCiSqL1MY780SKj7QHDW2cS0BoKxtVjpbiZLyVMm1yf4Ap0k5o6d/YdSpStr8iAmsu7GveGZbDRb2WYEM2uwxcTQZ336wGlQXPIXh+Q3W3r2tnZlZmi/CLCkQ13hq5p7NlBP34qg4YIflLwXEFb2P47/RtTyFyR/Bgw9wOT8wUos/5aq86dLW0XkjJnL67BROCtIZDE0Z7Me4h6jxhslPKLhrKzb/1emX8i/hDZlB8P9R4dApG4J5yzhtwkhas3pYR5N4O8xO9VFy22zzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dguv4sLRPV1pIOwilf/jEKCEXx4CjGqbjgGfqRjrBu4=;
 b=CU4NOnmncmBXiktrz/rz6C2/bfMB2GHlgNduQ04NMDqUGDTXmd4yuOm9u1ee+SZEhr15EYVU+B2Td/v9gDtrrs4Ihi/egRb9ZaRDJCev5Cd7dSdbWp47eF44Wh+rbDV9hH4qyoBrg3kH7o8yj6/2sxDkZCPOOwdwcSIZsE0V55VOUw92LEi2jWj8YERHdRH+xPDJldaKtDSEG1b+A4iuwwXn3AJWl/E/jGsEVW30g0WjsbrEV5pk5pwZuvy+CmAdI1Xx29gHMhPipOsyG2H3hlAGfi5kb0x56kStTYs2/7k3d725BPrWplDZEBNvU6NLlVi9eAuZBHUiAeuKr6ssqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dguv4sLRPV1pIOwilf/jEKCEXx4CjGqbjgGfqRjrBu4=;
 b=Fb7xOS5ujaVHeVMqIsFh05zEw9kjSPWYEHBV0pChXKn7SdkjJ9JgWqDbM3yiXIcH+GfUq3QExmKIMFxrTarjpgy6Pp7qR8aR3zX+O6A+20OTesHjuxxipr7sNFwKY7k49VWGaAYfYMtNAHvCbFSeYfAxSHiINVoxsvmYPAi5Fho0EaFZkDEaq43lIX2ha7RyNUBnaIFhP32MUveNHL/tHTxmSEKp1X0GYp4pPxEf22TgKjqavBytzDWgO0UvaPdqvsRRef+7CcYWVKI5yCmRLxGMOLJYGV99nL/kMXxD5fAN6cERdVltRC1HIkwsYtAFimZm9tx06q6qJpVb8JdQMw==
Received: from DM6PR07CA0044.namprd07.prod.outlook.com (2603:10b6:5:74::21) by
 CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:02 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::15) by DM6PR07CA0044.outlook.office365.com
 (2603:10b6:5:74::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:46 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 014/156] drm/nouveau: remove abi16->handles
Date: Wed, 17 Apr 2024 09:37:40 +1000
Message-ID: <20240416234002.19509-15-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e660d2-9dfc-4453-3040-08dc5e6eacfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TB5z+VsqkfKMcu4XTUjCoHf6oCjOoovwtskwh0MiV64HaZV6qAOnYXhGfcpO0C2W4cu5+dWzCKz0dc+NcBfLeHwCAQdL1OHiZjHngHILAkCatWMsuBoCKntDW2oyUjiRSoCya77sN0NCTQfcKgw5ikkLNQJNs+tuaVwLNv/XBr0W4r7bSmL2mG1siTCDe6qQWK6kt65tihXU3ZLD4qN2jhMVtZqezKMTe9mPSqr8keAjlPOnNkvXpuHMLpx1AIzY06/ETrwJw5I2XaWdKCg4MW+FJ/m0/dizy6FgnF9d9ul/mEKGSaI3l2fOtsf+MbA4YiJsidr8JNZUOoCRoUdY8/+jstAAiulHKH81whsb/TZK04BpfBnqkcYqTKB/kwwmIkIPkGHtmSYZR4OHwnzfBbft8yG+1s5T1Bm9FVVTFiZu3jNf9KYH9u0/OYUsmoB4jWN/jI/Nz3f3UqzRWW2KQRUbzlKw+vYDYMFT7dqkCF3vAjB8sepzciQezeBQRGxRSSQSRW7oNABTS2cfMn2wzY0Bc0dXgu6ht1xo6kgZKb+9FaZI6vUXLBceDadMPic+dVsX/QdxcLWvPooQpeVDvLgxSCMebqaaWCXkZZnOvSwxiFAzFyEB4vQvp6p4RmOK3g5ypngOd0pEYXFCJtCx+DVcWzTwRQJDuJflM2JqSAzu2FqD6fK+blmpLxU9JGKjt577E9IKdv3q+CVV2iR1SfqlLsklGD8muI5tH2TpsMUP6nWq/T80E3cUVcZ2NFHK
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:01.9489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e660d2-9dfc-4453-3040-08dc5e6eacfe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
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

- hasn't been needed since 2015...

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 4743459ea14c..af6b4e1cefd2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -32,7 +32,6 @@ struct nouveau_abi16_chan {
 struct nouveau_abi16 {
 	struct nouveau_cli *cli;
 	struct list_head channels;
-	u64 handles;
 	struct list_head objects;
 };
 
-- 
2.41.0

