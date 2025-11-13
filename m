Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16005C5A737
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 00:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439A10E1FA;
	Thu, 13 Nov 2025 23:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XYZLjdci";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013008.outbound.protection.outlook.com
 [40.93.201.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDC710E1FA
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 23:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSFXk/bzSdEr/rUI+uscUVJEHrh5LZwv+GPL2I0YMNM2Q0INGWW631sS91ptAt+LUtQsa6hvSUqNy//ZLgyR1bWHbgn0T83Yso6DJlZvfnSU4ETM5IBSuMpr4fxHZJtX8bpaK6S2VYDJnuz8B2s6BIh3UQUf0+WLbQpN3WAWrcmm9DrsOsD4ywQwTZpgTfnms5ykhUw2xiHWuh6hBN11PfiRpQYFYUhoK2sD4fZX+k24uZrhvcY7vwFvEDue6fINP0xmINcbJVJ/iewqAUjI+wyqQqmH+YAZOh4vORHCJSs2+NwMM0s2WQ4eyZM11pq1QT7TSS+EmdZjE69lYfn0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk5Q0v00KzabdYn0Sq5zwcRBGT2AQgxJN+8CVAi3204=;
 b=cthjGPOnJmtv7rhWlx7ySVTiA8Sp60ffpfdgwWzXfPZ/LVRbCevzPkf2pAsn+ho/MipOGmJ4ygESFEo9v4R0rs27gGKr3GwtgGeZClX6vXUZ18UcWt8LzTpIW1REA7MJh49qJLy6oD2XFtavgb9VyqqSolUNZisFx2dUTSoLC/CQhbs+48Dmcrst2TyQ8ehiLXSPohOx9ys4+aUj+dJn5swnwOa+HMEebB/xb7VApd28WHpYB03ztPTwetDpZeqbz99ZjtZnrEvRl+kET3qHotVC4haHt3y7FWOR9tKyUx2Q/Vsm5LxhoFiJCw2GEBwqdtOclwKtrAofdAhps4CQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk5Q0v00KzabdYn0Sq5zwcRBGT2AQgxJN+8CVAi3204=;
 b=XYZLjdci2luvEkCJ3hS+kGnbYRliBTUuBEmTG5aLWcfOMlMyUxFpgiUEbl6u9sVHpDlP/Mx3GJmFXgsYHkYg8enhRWPgvA6x0bN15fDDFhAUjQ5lIEojXzegc8ZQvlujKsVTp9PRJBpeQLgICMIfZUbpDi5rdT+E6JKu48VMOcBOQCY5QgAwaZrGGxDJjlf+O+0G7qfXZCEHKYvqVy9xeeDN9Or125c9hxBFXkw2i2vCiRjoMPN82nswv1KrHDs2Ari2tY8uictvE8Xiy/Az//tHUYXwu0nK9osfHLfZFxFv5DeXP5js88MT7b90djqX9W4bSEFKbaRhvVWGvEWn8g==
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:03:50 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::67) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 23:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 23:03:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 15:03:32 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 15:03:31 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/nouveau: restrict the flush page to a 32-bit address
Date: Thu, 13 Nov 2025 17:03:22 -0600
Message-ID: <20251113230323.1271726-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9ac0c0-c74c-4a77-7a0c-08de2308e87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDxE4GHbdbFSIX0v1soj7fStLs/rYdUz8Nqsia/aSKU+eP69VuEyL8FhIBaB?=
 =?us-ascii?Q?NFsC1nebG9ssFsp046RUjTSk7hVIWGELdLF8Lnio/gqpoalYAZhnycRXTcUG?=
 =?us-ascii?Q?+raJcO8vlrh1hCfs7hDBt7QlMGJNIP+bZWHKHSRYsZCEMcamCF0k6+aUE6L+?=
 =?us-ascii?Q?ZbhDIWbcv7BzW5I4Ll/BqmOHK/JMVffAXXb+hupJCA56kXtja9xL6lC9Uc4C?=
 =?us-ascii?Q?ZqDqy50LBXgtSy/Eg/hnsY00M6K2uUs1AA2ufthMAeVdsHz9gjc4ldi1MyVv?=
 =?us-ascii?Q?3c1X67G6Sw4XvYf354VW/sl0uzuUpytVTS05R3jceOARWOwRSq5gDtikZpr0?=
 =?us-ascii?Q?/qOs9d6v6Cazf/LcpoMHaPHDmmn3D+IgjmHA3JfeAW+Ol1ReV9aFMgcyGlgD?=
 =?us-ascii?Q?ozAhTDkLBaXcpfSL0yP+WLpnNlrSybIQ+zLRvXUhKjfGcC43Q12X3uJREULD?=
 =?us-ascii?Q?jbcslgZ36IAp4c5O7K7Zb81LLHE6ITxBk5JVLqLY86F4z3tkHgkdLKFADcz0?=
 =?us-ascii?Q?g07bHe5K51T3rR1b849Ie2NteISydjtJDZ3ajx4KfnU5SWkbC69z73ZvUyZN?=
 =?us-ascii?Q?VsvUt642pOyKQqEadJ9TDyppf8ZYMpcamiiUJaF1wl4APoCokGt0Wtp5FfEO?=
 =?us-ascii?Q?M/GHtdL6DdjdP/e80Jawb7hLdXjw1TpMm3x7rjWWeTb2OXD1IAc8GQx9CUq9?=
 =?us-ascii?Q?e8fsYgXdxza01yl4uzLh6QVWG9urY5RGJnh2JIUh99fILwg7LXRgUh1Odksm?=
 =?us-ascii?Q?dasfTnSh4gzejzFN/qWJPErKsG+pCXvID1ejWXkveel9XMPbQbRutLFSXIJG?=
 =?us-ascii?Q?2zzyy/duEqxciu0H0z3o5uH98SG38c6envX+LlgB82eNnmPTBgw/wyH32BOV?=
 =?us-ascii?Q?ICkZOHXuCF7DcGxPTdu+H5EQzFrWeM6LfUmmIEyIBv+vdcvQIjoDugW6oIUU?=
 =?us-ascii?Q?j8SDallckO3D3oWGRV0Sj+9PGKQ8Wum7uPd9MmFMDCl8908HajMuCrDwOg/s?=
 =?us-ascii?Q?iNSJ44aaomN4olqsgt796gU5f3N4mshwBdhsSU8q3Wn9OLovQKPCKAHb/Ciq?=
 =?us-ascii?Q?ArJ0OT0D+y1MNiAj9vHVPe+GRb7e7r9N9nr3G4imt7sf9SEZyk6fvV1gxXwD?=
 =?us-ascii?Q?WRnvUrH2X4LTiM/jBni5D3xLeRe3w0lf28bSQFG8SYpUjEAkrdB8wFxZWwXc?=
 =?us-ascii?Q?wDL0SKT/3liOQvnFgq8944QMQwQ3q3na49y+zGvGfSg+lWnXLHX6Ug5656Mn?=
 =?us-ascii?Q?0SINyzZIJwKRnptHzSuAT8aKN1xxNSVTKXba3eLSb8lt9lxU39LENiGEzdZm?=
 =?us-ascii?Q?MNUnvOmqFl8wZtceDL3Wll97X4JAVMQzt5X4sdKQcCM1qp5rTbXAEueECQfz?=
 =?us-ascii?Q?CoBct2BcjVRUCeDzGwCfeRoMK7Zl24+DzVqvy9AycTGXHtlLqmXjD8ZhavVE?=
 =?us-ascii?Q?rLF56joATS37Bi1U0mfBI//S3Od6Hb+hjO2Y6I2fyS8EaYkAX6ThlGJWhMyZ?=
 =?us-ascii?Q?0GDSDlHIFcSebTXkV5ANMxy0xjvNT/aMic0Zp3kDPErhR5mLIoqqLMc6N+7N?=
 =?us-ascii?Q?eC0Vx0rX/Fh21OhK4zY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 23:03:49.9308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9ac0c0-c74c-4a77-7a0c-08de2308e87f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
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

The flush page DMA address is stored in a special register that is not
associated with the GPU's standard DMA range.  For example, on Turing,
the GPU's MMU can handle 47-bit addresses, but the flush page address
register is limited to 40 bits.

At the point during device initialization when the flush page is
allocated, the DMA mask is still at its default of 32 bits.  So even
though it's unlikely that the flush page could exist above a 40-bit
address, the dma_map_page() call could fail, e.g. if IOMMU is disabled
and the address is above 32 bits.  The simplest way to achieve all
constraints is to allocate the page in the DMA32 zone.  Since the flush
page is literally just a page, this is an acceptable limitation.  The
alternative is to temporarily set the DMA mask to 40 (or 52 for Hopper
and later) bits, but that could have unforseen side effects.

In situations where the flush page is allocated above 32 bits and IOMMU
is disabled, you will get an error like this:

nouveau 0000:65:00.0: DMA addr 0x0000000107c56000+4096 overflow (mask ffffffff, bus limit 0).

Fixes: 5728d064190e ("drm/nouveau/fb: handle sysmem flush page from common code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
index 8a286a9349ac..7ce1b65e2c1c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
@@ -279,7 +279,7 @@ nvkm_fb_ctor(const struct nvkm_fb_func *func, struct nvkm_device *device,
 	mutex_init(&fb->tags.mutex);
 
 	if (func->sysmem.flush_page_init) {
-		fb->sysmem.flush_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		fb->sysmem.flush_page = alloc_page(GFP_KERNEL | GFP_DMA32 | __GFP_ZERO);
 		if (!fb->sysmem.flush_page)
 			return -ENOMEM;
 

base-commit: 4ea7c1717f3f2344f7a1cdab4f5875cfa89c87a9
prerequisite-patch-id: c1c0d02765eea952f4658f4f78d18d4842937e11
-- 
2.51.2

