Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FE9897F3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB510E3A0;
	Sun, 29 Sep 2024 21:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iLGVY/OS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8B910E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBm24lz5MAggQn+R0XOcU+An+MQCVzt01INgdW5U+MfGG8JCWKx6x8NPW6G09s78CKpzD1uKaBCNe4Y0DhOibYOL2Z/l1IjXQM4f8sJ+9/R6sBs/Yl0xzTHAC9bCEpsVoKeGfvDqoX9b86inrhs+LOU0zutI7IqxaWeRIGhODFqaqMzoClB9uoo/MAcCI3QLr9AYG32izWKqqy8KJnx9ngpjNXUnkbNuR4uQGNdmU1WXo3Hkn4ZqndJtUuo/BQ1K/atEqSAwPqNE3E/mFRoZZ3ZBEH1kYRkePCPFOwFBPPXH5aXAh5eCZWwTN9wBr18d+uwNvr920MPZLi3kKinA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=VOVfFoVaGZ5g572pSjRkCmFCBvtL6dttyr8FOnc7DVtJdSS/uatUL4Aol+poFzqBlsvCKJW27EIKy2MAtcjHOZJ4O72nMqDjc+nqrR41n6G0lg9yCPNt3BH1D740lmM336E9PZMb7XfDKcYRViIj+wqRR8UEvq78YZYxyu4jsSvP0VuCIEGzOtAtntpPUGE/vf5j+UiNsya0FzhbWn+Hf4p5879nfvxS06MPGYNTcMeThxpQYXI1HQJuzRtw3OjmTlofuaTiuCzvkq7l+ublWb55JskwFl+/uvPqJSv+T+iAVxekJC7Phb11xDDQpOgTsqN+zdNk7cK/anxnhhHEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=iLGVY/OSA/U+DBjTui/f82hryMnRzwBEV+VSv/uYA2WIsT0pS90T6AU9Kyj94c5Fxm3aQ1ShFPRoarGlAYWqgQWggRJ5Qc4xFpi/ZmXQdIwPDCkSwogu5tJrAoz8BX/hCs2ZNbv9wmfl0ircTxVq/GR6vWZiy0gjVLcOM4P+lYcLg98c0RgleFQFj/sHTswM2kYKU8bfOLodjjQ+itw67dZaX2V+Ss8kEMimJYYQdU/gQB/FkidCnKvCbQ3WRSj7cUwS99Y7C6iMZcIVMQKjQIxdhx4Fltgr/BxoxCSrnTucqggOwxtRdKP4fhOw5KGFB2In3utuj7wl4vDtg4cqaQ==
Received: from BN9PR03CA0628.namprd03.prod.outlook.com (2603:10b6:408:106::33)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 12:17:03 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::ec) by BN9PR03CA0628.outlook.office365.com
 (2603:10b6:408:106::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 12:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:17:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:51 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:16:50 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Sun, 29 Sep 2024 15:16:32 +0300
Message-ID: <20240929121632.441007-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929121632.441007-1-ymaman@nvidia.com>
References: <20240929121632.441007-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afa3d20-75c9-46d0-ae16-08dce080a097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rYDHMVjuHPCezeifLTz+sbpJ0X6o4yFY5fbq5ruzF7xlgHSCf0Ki0/FBu4Ki?=
 =?us-ascii?Q?tZVuDGcQS6/lsDXrLLEghQay00vse8jrS1ZvbSMvTQ0BDqa+HkY156a8Zjqh?=
 =?us-ascii?Q?+sUUPx7zLhKX2rQ+HNAsj5XLcD64bCpcPL+DamX5n0ibmXE1xa0UdDtRjX9m?=
 =?us-ascii?Q?DufYyYOpdH5roEcLa2jMfo3RK/ULBLYAdWPRH/R4m3W2tpTM7p2bIBgirIyj?=
 =?us-ascii?Q?bpTj0leyUyXDk3kAdaCjYqPIWwHbT0L6xaFkVQZwP3/poS1m0ukM+S3elH4K?=
 =?us-ascii?Q?Yd9a1WhV6KvKu/8DMpsciE37+tUeKIWtG0/6KrbVYAquyfIcqyeLPNReS8KN?=
 =?us-ascii?Q?wa9XyTO3mLZ1Alu1Jb4z3JLFJWAVZ9V3R8L62jsnt/RXTJ/ONJXLbhVZ6sA6?=
 =?us-ascii?Q?qWMBVKYFcHmnol0W8upYIcCgFz5oCS+5JnomTyseCgbGjNSF24i/XtUB4b/p?=
 =?us-ascii?Q?o/V71RDbsuyRF8OD2TC2lgdgHLcnPl5FI6M6HMk3peyYpvWijoJqrmBzcTzQ?=
 =?us-ascii?Q?lhjZnGQOoJaXFTF4MezmVj4eT38cDSR1mXUiV4rw50kVVXAaE7elhLHgW0oC?=
 =?us-ascii?Q?QMI3auusGHuhl9COHodqIZDPBokQdvX/30aadB9G3O9TYGLuOpGqPpRy8HCo?=
 =?us-ascii?Q?xLNrdKFm/s+xqhC8KxOcoz9b9DJmu8kknfckkHULb95buVfKADNMmqUv1Nvc?=
 =?us-ascii?Q?hYMklAAYlkPe4lAEYP/mIvItyW5r4wi2riJmilXZHTOnJcYRJ/u435o+/O7c?=
 =?us-ascii?Q?QxPL4EvMckawo2XDbm8GhZXw+nBQefx9LkwwMJwYUQUJxZoGVnbZeT5YrjfZ?=
 =?us-ascii?Q?4AagjIdokfmMjKqzofmkIs82nHACLzHb/T4i0T8iwgunGJn3o1daX6tjfX5t?=
 =?us-ascii?Q?eradXYYEd2wtfhl3bChma7gzwDAVfhvcFq9Qk1VhE6lpDSRZijEDGiDa/cln?=
 =?us-ascii?Q?iiuQYclp/0s24BFvgg3A+NVVcKmVA3IAJxRYpr+FzTCKePwlZUuHAxaDKfwQ?=
 =?us-ascii?Q?cEMp8FaS5lbGtHE2Ms/FPiA28HwiXNzfeV2viMF8kBR4adEPyrGbAGC8ZZpf?=
 =?us-ascii?Q?ewpV0jXjb6iUWmPGkeyO/XAqhz6QEY9tKwb0eup4pqes4uQGR8HuXcxNL7cP?=
 =?us-ascii?Q?7RzX7KB6O9x/BfZ9Aj4fXM8kayCea6l8sJAuugyd1tYBP3K1Rp2JFPxVXeMF?=
 =?us-ascii?Q?HpB35a5sPJj5PZZL8LA6zfLoMoTYrDE0bNFEXykMe+Ff46JurF2mppkURHIy?=
 =?us-ascii?Q?vji9UearH+LpHok6QtRNkgAVPnxdnMgW45TYsg5x4u3MsqhFvQStBaZz9ZLM?=
 =?us-ascii?Q?fNsLcWp98wObX4ntKjrTjqa8IqACx/5BJaOGukPWtrnPaOukCN/tte3c04g8?=
 =?us-ascii?Q?2LQ7AmEkhrCdLY6Bor1NI4xmoir/MZEukIqdQHEzhmcRC90LpUEX5ywyNvFr?=
 =?us-ascii?Q?qh1Fd5Wpg8k9uZcUYevf/X6D0+Y7Kxwv?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:17:03.2467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa3d20-75c9-46d0-ae16-08dce080a097
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
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

