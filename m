Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA23523A71
	for <lists+nouveau@lfdr.de>; Wed, 11 May 2022 18:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D76710FED4;
	Wed, 11 May 2022 16:37:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F75210FED4
 for <nouveau@lists.freedesktop.org>; Wed, 11 May 2022 16:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5ia5Gw3SZgexukBHGkuqnA2wLg/KHrr5GDAqDkoQOT5PlZ29MJOBU9WlYeUwu/Va/OLAGRnHYdsPTnkSC2n3oAkUaqYZoXvqFAUV8xZeOgc6II0rXY7hbNLDc89/yNyl4TTxCfe+v0zzhKUYIzjM8eFGBFRs2NLprm5Hjm7DHc67I9f8S/t51rPyBy9WnTSw7ya9DYie8MOJ1EzyDC1SDdESOaZMLviYF2/4GKxD0loLSL2oLZHsWdWvFaFkDBa7oe7WoeEgcXxYnpMLXH5swYvUwc1/gWolXQPTKoqpdODAybubbkT5jMMt1ax6EpKcyZOnUpatheunsjMm4GPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Kqm5MxEvEAo/ZdB9TUyDCbo9xshQj+6BAHDlbBBZ3E=;
 b=M5nGlNRAi819LAIhOaKeNQzDcL21ee1tRFBNDzH4X2Lod1vlC73SJ8DvAyN5g11JPxjD5N1JONnvClInmm6DNQA2vJjcgyO9WjpBLHbtj8Cu8uTn+wDBDhcvyHBdS2W952O6Kf/TJ8uIv91/0lSPaCbHY0DMX2pxWJr1UUcrE7gX+31AS9xlWDdh+zhoOXUSHv42pZqdgCBrqBHLqNWxBOCkgZo7kLwQFD3gaTJ6cojydxXGXSuim+ZXYSHC7JXYzWZzBJRJUZjpNwryCT/JqUHtYLEjgRqT7gn36LwkqlJN08efqjpSH8QGqeMRQtNvZtYfZYKJ91ppWRI3AvxdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=glowingmonkey.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Kqm5MxEvEAo/ZdB9TUyDCbo9xshQj+6BAHDlbBBZ3E=;
 b=Y8YvDMUiKBxtgIePgQPRKlF2HOrWowY00TUNXJiDQ+nXrV6c0LrK/OswiXhcfYKmelE9plEE0nvx/maI9dC9I8tdU1z5srPaVGvtZs2mcr9tc7/tq1oduApJAD5osWm+5TQWNb+M4E8PoGVFoNhHGjaVuWJVVK3CIqur1eeft1vbpp45ZdDNnb7WXjDzdcfpEmk4zgh0pJ9X44jNaqq61op+I5/qAouUaeToU7EqfLSRHONkQFsb0u8WNC1hMKhO7fo685OdLB9rOGtKqAKxVieLv6BR3d18UlpIhSUDufLJms5axejCGlOp3F+qs8cmqSA5nIaMmUynkzGQmolGxA==
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 16:37:25 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::4) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 16:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 16:37:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 11 May 2022 16:37:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 09:37:24 -0700
Received: from ttabi.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 11 May 2022 09:37:23 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, "Nick
 Lopez" <github@glowingmonkey.org>, <nouveau@lists.freedesktop.org>
Date: Wed, 11 May 2022 11:37:16 -0500
Message-ID: <20220511163716.3520591-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56849ac6-6d4b-4d93-6ec9-08da336c87a7
X-MS-TrafficTypeDiagnostic: CH2PR12MB4165:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB41656343FA9F87346C83E4CDC2C89@CH2PR12MB4165.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Pzq4Je0HLNBXAm5UPNYQZFfZ6UORsYcCVCKmFvnbTZCDOveygvLmFCov207k8CVaOq06UWvuwOQIAJ3j7160KbjBtxnQLXI6VlHfyvqB8/wMYuiYYd6zSYUI+Qvi+5ZOeUh6s8hvO32dQxUqKon9CgqoWTJaLj7+vwyi/3FSL0C3ziX/K7+7KcSxaqmkmNZy97fZ99H12I99mrxywDb9cygUpwpetrWgczWyfT1Sqfxf4JSnMJ/rn+OhtAq1aqVjo6kcwyh/qRGOM2H/24ivWqWW/5hiSi0itZvG7+sbdoAg6L9YvxCIwC8vfGKq1b5kmO02sZPGH5qhOCIvoYurVTS4E1at0AoQyFcoe7cXeruMiw2Fwrir1fzSj4R3toxZITP5UGolluhxC/aMVN3s6EfU49cTLne+haDND+E7ShsI/55IB0UFRg6tUk2Q65ORz6wY4biQ88RVmu4ADg1l1R63oqLjxIuOJyh9x7+IiSGyIJHjj2gF73FipjACQVf6ZnxswAas+SLS3XA/TYwdnV7Soh4ffWGIfTVsmFZJO9fRnauKSPS2FDDz4ZVQEzPGZ5nJzBGJCV0BZnUQki5zOVJ85b8MBJ925crWRRuRdHf3fCdwKMdE1YknnULNmly20a6NTohzILuhbbuVRQSY4oRZZdpn0Njk9lioW0c9aqO+CE30xyd8McEFxbZpN3ndH1JGQ33ECXWr2lAJjQ3gQ==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(8936002)(40460700003)(36756003)(2906002)(336012)(4744005)(36860700001)(356005)(426003)(5660300002)(508600001)(47076005)(1076003)(83380400001)(70206006)(186003)(70586007)(8676002)(2616005)(82310400005)(316002)(110136005)(7696005)(6666004)(86362001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 16:37:25.0478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56849ac6-6d4b-4d93-6ec9-08da336c87a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
Subject: [Nouveau] [PATCH] drm/nouveau: fix another off-by-one in nvbios_addr
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

This check determines whether a given address is part of
image 0 or image 1.  Image 1 starts at offset image0_size,
so that address should be included.

Fixes: 4d4e9907ff572 ("drm/nouveau/bios: guard against out-of-bounds accesses to image")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
index 64e423dddd9e..6c318e41bde0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
@@ -33,7 +33,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
 {
 	u32 p = *addr;
 
-	if (*addr > bios->image0_size && bios->imaged_addr) {
+	if (*addr >= bios->image0_size && bios->imaged_addr) {
 		*addr -= bios->image0_size;
 		*addr += bios->imaged_addr;
 	}
-- 
2.36.0

