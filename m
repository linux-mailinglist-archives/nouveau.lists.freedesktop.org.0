Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC389897F2
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005110E3BE;
	Sun, 29 Sep 2024 21:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kpIeOlbW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E4310E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXv+Nrh7AbH+VyqRgTQVh8S/2sfLYA65eE1C0zLEN34Z6/VcqYjQgdjlTKp8eeRuzEXUrVPnQJ63l2FfHGdgZWZd/Op5vBIBx2qatiovoxib0NXye9CEdbPKPZfNwX1+L5WragSCpILKrp24REdz2vtNpfEToaQzine5TqXNymeBf1mGq3QPpe4scpb8W6tUbzYgI54OXoN20uNgyYyUFVI5GHj912clhgBbW4TTARAViyzgqn86mDC1ZWSL0VsnVDIklMLInQTidHfYzXqaNFpjLjDLUs20Scd60F2vFoIGF8DVBBQGQ3HHdzC/JU21qkBlXSFCnRwwHdCnVqsmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=bcS6p6fWCLw9YfkypnCp1unoMfxFsd5uatZ8I9fpCjSKGPe7HDA6mkKgf6DRkpHybTqekgYYMCsQh0cDbhsCZJDbuHNZ41sdc2oS5QIGsH77Lhgjnmp/bbsdhsjxNh5XXUv5Ec/zD3snr2ObKHY86A8FJqbJUnkiGAa4osgD7qMq8+Ylpw8mxHkYOt3qs8qCpIVzV5wJwFneTDjYgW2mMu8NKAlGfS3NUSFyJ6nCnH3wg5iBbK/2GFN37zb7QquPXa5CLIbgX7cLSI9uyJgw5tfs5Nnc2M45gYnDNupsveyVuWP1gk3pkBbWPrhLDPvsY0Wdd8/Q72OyRsIw8KKGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=kpIeOlbW2FB899HRuYcD/9f8lrK4HNI+bAVqU6dFkhy71hpHIEzr+w8g0YBVV19UcPuJ3+lGyCj0dNxgMrXxYHYuLW/tEUq7bwDtB2tew/yH713ex06rHRCdDyx6Ejcz5oXngtV76enMhrXutWs7rQ65q8Ohj8gQNSbbXUNkDUnEyCpcPSx/qVmsXx9iKXkgRQuAtxsyNZDX6XPPemHnFascszznans1X1vMXwsEhaxvVrZMEe2Te8zsMrNYeAiYUmmEzGrExhTniDc9xb+n7gW3G9nMMrSP2Q1AG1cZoy+O7ceO6gW79zv6qNcN676fCIqC6HPFF+SF2hThCZ8ibw==
Received: from SJ0PR03CA0148.namprd03.prod.outlook.com (2603:10b6:a03:33c::33)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 12:31:45 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::e7) by SJ0PR03CA0148.outlook.office365.com
 (2603:10b6:a03:33c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25 via Frontend
 Transport; Sun, 29 Sep 2024 12:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:31:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:36 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:35 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:31:34 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <apopple@nvidia.com>,
 <bskeggs@nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Sun, 29 Sep 2024 15:30:53 +0300
Message-ID: <20240929123053.441096-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929123053.441096-1-ymaman@nvidia.com>
References: <20240929123053.441096-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c247fc-87bb-4132-4c99-08dce082ada6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gycOCRRxdokDu3nq7y+nqNp5QV3dYwom+Yf0pwm06J3/OBH24ypriTfMEhMQ?=
 =?us-ascii?Q?TQ9flE15awzNVLOD4qDHTg/HNB97AtWyryJjg+CS0f2LG2jOeDNpbd61xuFm?=
 =?us-ascii?Q?uy6i63obdoZg1RyPQgYvNyyJchEEzpiua4VSjZMDysG/JbJm0ib2iK8MeOTC?=
 =?us-ascii?Q?6zdhr3eFtYqz3L8M47Z9SE0WVFPL4vnG7xDRPFREIgCH8GOhEmtuDE2IGU/8?=
 =?us-ascii?Q?8xWXjw02Xt6YNMZZQfLe2P4DepjzyBRqDQzw3X8b+24cKacAHzZ7alfUemJm?=
 =?us-ascii?Q?msi3ufSMuFFVBsgIdH8ReI+I+tvjnGRGt0njF9vsDbhlpIfHijTM/CDVblvR?=
 =?us-ascii?Q?7z/39z1ivtoXpZtH5d9GoSdGN8ocMq5nCcdfg4Spo+ePmKT0WWshZfRBRC+5?=
 =?us-ascii?Q?ucxmALERpNpvtHo5S3k6LeLA/OTpzW7nilkuHXoUm+/ISbe4d5IihA8DrATx?=
 =?us-ascii?Q?OKyNt/UXH2zny8US64vQzk+N2pC+Hj6uYrnfD0EkVDYW0Dh62zCxoHwtkAL/?=
 =?us-ascii?Q?kAvt5o83xJfB0uUTtTqIIUI+H4BVLsPHb9cfhmZdXR2Dw80Nz0jiS9tmE9bN?=
 =?us-ascii?Q?xoJIGjzAMD3mEFUpYlyVcAT81T0MTLpzFq7g6+pUPFU3VhsVZA5ytgiV4R9h?=
 =?us-ascii?Q?UJBk9axhSLpZRJGljH6IxGFRJbLUz4Z/KqjwElXGKTXHuhOtPDGZ1KSTSLM4?=
 =?us-ascii?Q?l0cBqxPHKQDm3+PbhVbrPD7cB2PXM31LesTgOjxPUlz1/Mrbv9ouwrg6a33D?=
 =?us-ascii?Q?9zgzYOWHPKSzDjOIMjdF9ThyzwO0mXLHoPbJj6rS2GMY2Dd4ctBmIYRCVT5v?=
 =?us-ascii?Q?5YpYsKs6ejtqMFc7tnwb9xzs0OSdZNSYdj8Gi9SwFLLO0+8Nu4/uXA+QG/0d?=
 =?us-ascii?Q?fmPpGR2gLjcJDHr74i+EpWn8l+aCb1LR49z8om2SLgRp3Ej4tMe8aLfmzLMd?=
 =?us-ascii?Q?H5lILvIOICiO4hXka3oFLrfa4g6p8YZLwILPDNGAQ4IM63my19lIuTKvunlK?=
 =?us-ascii?Q?6WAc8nG2M1QzVcxcGwV75gCjimUyh9EwfRq8ihgzyDOhlCEZwhOrhGfkoK6n?=
 =?us-ascii?Q?gcvbr25HHXhDvm0mBFG4tjd3JnYj4yeNmSdyFHKvnRP9tGHjcjeVl8EDgRcO?=
 =?us-ascii?Q?ZTuOhaECz8wyZTdik32iese49mcPfP0K7TZzKb4s7NJ3tmwsyOGo8FWGC6BO?=
 =?us-ascii?Q?h431SaUmuIqrkwIjYLPXaSzyFViQNi9kYQtEolLnr7SHntrDx7ZFpy194sWJ?=
 =?us-ascii?Q?aWql7FI92kioC3l86DMWXSQsCmj3TV0DmygkKtsmQQaAO+/89h0/jjSpaXsh?=
 =?us-ascii?Q?qx+tSxCZT0kdeCB9Bb9Qte8M3Azh/ez9tKfPWhmu1CQ/r1aVfNfTaJwHE9SE?=
 =?us-ascii?Q?3TVfAoYJdoCzKT7k95IriN31ex1J9TSL1mHhPrA1fyjJ/oD+wM241sw98A+s?=
 =?us-ascii?Q?HdgjxP4giVoP26Dfo0ccOUzaRS9WsGU2?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:31:44.2557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c247fc-87bb-4132-4c99-08dce082ada6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

A copy push command might fail, causing `migrate_to_ram` to return a
dirty HIGH_USER page to the user.

This exposes a security vulnerability in the nouveau driver. To prevent
memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
page for the destination page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

