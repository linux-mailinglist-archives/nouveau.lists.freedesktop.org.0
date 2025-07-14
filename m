Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1DAB034B1
	for <lists+nouveau@lfdr.de>; Mon, 14 Jul 2025 05:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A3A10E1E2;
	Mon, 14 Jul 2025 03:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c/kXbnZW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F63310E1D6
 for <nouveau@lists.freedesktop.org>; Mon, 14 Jul 2025 03:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqMTQdGnYLwVvqs796mB952faLKucFxruOswPTaMmgzMhAPrXLtqRi7TNSZFZgiN7nMFhEvtvzIRsMR7iOct5JbTldokPdX1eeEwXaoX0Yx98FZBaLB3m8YQ7i0uYf9CkiC81PeBQuUCcqffVhbSuVt6rOl2ykCWvCJG2kQ200lYGzY7abyBTiZeiypZ2QkWFmSHWihRnubRTSqojryT/s/1D7ZVKSwxS9zfYQlLgZdQVUaym3OQPoktmrZ0hSG3k/q4miKkKWTh0dU4fCmsyWZfVbb02e1ACh8FEJMDlqTgio+pmZcKoiXE9/X71Lg4zh1sD1GCf24HaTV3zpYGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9R57iOP1TeGYvT6Lbmv4vXRMdTGJ2XP0OBZuwIez1Q=;
 b=s0Xim7vJjJJB+8E87KwvJxOLJvZQg9Y+dADvV03iYzTKewQiitZqwtC/K8OVCmBFlp1A3qySppXMy9NFJI4cVxrTHQqdYXC46QbbhlgKGovF+KCxHJn0Yszc5UB3l7CTJVK/JTPZMpaZJDDNVvispWtaakGk9ZecTOypuPo1cYAziBDmg2VqqqHefGUGUnJ9oHvXwd+E9Igv0P7F4BUGdL+hR0N9DLTzLNDpCb7tHDB8284krEQwsGD21OzPY1ygvbZo3mEvR9nOIFaQGKuz2/GPTqV1G14btIwTdtoWGHRTgwCj6fvHcAig7TU4Y0Sk2EwQrnRHXbkhFt9LhPYd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9R57iOP1TeGYvT6Lbmv4vXRMdTGJ2XP0OBZuwIez1Q=;
 b=c/kXbnZWQqPpFkGIRBmLGy01zJ7dMBp6h7nmA+WmAJfrZfGRKPnXpfwirxmokqGUIIpzYwQm0T7TzmuwgXBT9+tGbfp0F4if7piXhB8EbyCm7c0dkV4KXmh3/H7zUy2yRDi8eQz2j6i4AqUjOJKyjzcMmUWdIvTVuzLmuICCm74ahYpEzwcgB8Syjf6gEX4b2EfmEq7RCwAd09pVpcToyFj28kogiKQXmwUWGMh2VJ0nWUe9lPodzjYlNGkev4PdVs7dZYzu16s7wUUPdhojDyZnvvGjs/2mXaFZ9jDh/2mzBjeOgAyYfQsNPLu8248LxzJydio9fzzfUTRUkuy/UA==
Received: from MW3PR06CA0012.namprd06.prod.outlook.com (2603:10b6:303:2a::17)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 02:59:59 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::2a) by MW3PR06CA0012.outlook.office365.com
 (2603:10b6:303:2a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 02:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 02:59:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 13 Jul
 2025 19:59:42 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 13 Jul 2025 19:59:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Jamie Heilman
 <jamie@audible.transient.net>, Rui Salvaterra <rsalvaterra@gmail.com>
Subject: [PATCH] drm/nouveau/nvif: fix null ptr deref on pre-fermi boards
Date: Mon, 14 Jul 2025 12:59:23 +1000
Message-ID: <20250714025923.29591-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: e65b67d4-bdd1-4791-8123-08ddc282851e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qjQU48mz0oLCcAdg4jHwN9IIivBtAqaV0NzHxc73Jv/wRiBgki0UCncjyQF0?=
 =?us-ascii?Q?Wu4e2fw/wsOw/wTA2993rXFDA+awqNDjZVbBhfDrX1F55HJpHTUv3DMO0wsz?=
 =?us-ascii?Q?cYVSWfEjjtaJo/SqPU+A39yzCQMIT3+twDDDNysW5V3xmYkMd50HhTeVrijG?=
 =?us-ascii?Q?SvjmXJKOagl5kjvrvpISm3H9C/WibEfLihRhi1Sxpp9xo0yPCKfspFQpCwve?=
 =?us-ascii?Q?DVY0v97uU0nsN/FiprzopqrD1+yoNr+MsSHrvBbD/Jhj8jYB645V6MlMh0Sy?=
 =?us-ascii?Q?NCof1UHSgHMfyArGYVBYPioOUb8B3hZiL7s1MZf/ZoPUBZ83TrmDx+AKivPj?=
 =?us-ascii?Q?Hb0AYX0d9GbkPdAx251HOcF0HyZYl3EkNFD/Sx3G+6p5ChXWSnAB9YJF1Vhq?=
 =?us-ascii?Q?+seSIVhQ7jVTZeRWVCsvyU0lcVZ0afyQrjqslWpeqS+zXsGnXrVqphxZqfco?=
 =?us-ascii?Q?R5kMVnfZ6fWaB7mteEGRhrGdZTA8ncajgpa9nYa9EWpyArbGi3JFi2Vp36Gy?=
 =?us-ascii?Q?GBltfSkg7QFCGmqwcqucPndX4HyXTJJJM4jUU+S9pOPL3WvGxhypZ/LIBBIZ?=
 =?us-ascii?Q?Mjxgv/Q0e+L/IoFH5as+07vjgyTN/WHF2Qq5occ8tZRDuBolaoarcYllAG+a?=
 =?us-ascii?Q?xsyWv8QlsrpaU507rVVbHnkoe2LV5WLk/7t+ZS9CH/4hl6ZODy6dn+bxD1Nc?=
 =?us-ascii?Q?qJihc/w+Cr0K+uhjJTaUp4XTbqAVDvqmK32HJbufJWc5UmFs8tCKCHd8gmfM?=
 =?us-ascii?Q?JVBp1YBrQ1tZQRHXANtt+hCYxzVQbV7RW89nOTXWp8eOhaG9SGwlgGNhvksg?=
 =?us-ascii?Q?hZLW9rZHRW1v93TtpWxViIJC7sec/tCIHWQoqMV/S1dNg+zNMBrJuoMPF900?=
 =?us-ascii?Q?oJqh+QNjpMZl+CW79Ul3M5hNt/FRphk2NGQJ/F0+rUJBTkTbX4M/drco5Us2?=
 =?us-ascii?Q?SSD/V0S0CaJWrI6bKT8VEDcOQzJ8Mr3+EUWKUSyEi0uT6D+JkHpJ2FUopmhG?=
 =?us-ascii?Q?Ic81eK4PkClP4IcxJFdNvtEXyqXbjDNXDS4bGAkLc2IwDpvIKk0sOml9YSr7?=
 =?us-ascii?Q?/LIaXlq2Eio1gzOGCLPUiMJQzCzMT5cnsnMUqY9bxW8GxwBpWyFjGW5PRJXo?=
 =?us-ascii?Q?bv1ocLiWgu15QOqkRyQ4ot2iSETg952EIkA4rE8xyX1L7dadBZKDq51+JaUQ?=
 =?us-ascii?Q?NfT1niBwLD+FmjnILG8L4+n+WWKHG2iagr7VGmhrXB+tew0LZ6LcllxYve2v?=
 =?us-ascii?Q?wkxo7241W9t93yj9WUqcoFWAlZlZSSlVB0ZLALM0/wgJV3fh2mBtPkJbivmO?=
 =?us-ascii?Q?X8PqF5URETJhhEtfyXjLckRLL0znFbHruv/037hz3fuSFtWb6jLRVZpWuKb/?=
 =?us-ascii?Q?GxDdH5wU901ml5xuP5fXX4kMzPhpvYZnb915GYidTzw/lXYgXFVivtvyWmaE?=
 =?us-ascii?Q?eMv3qEmC4vdbiVTe9KCWWkhTVEUnbPQubkcXtuhd87C9kQetyjTVub73sBUk?=
 =?us-ascii?Q?WxdsfgJOw3hlqI7yVqYfIRjE8ULcgHK+QhcU?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 02:59:59.0113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65b67d4-bdd1-4791-8123-08ddc282851e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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

Check that gpfifo.post() exists before trying to call it.

Fixes: 862450a85b85 ("drm/nouveau/gf100-: track chan progress with non-WFI semaphore release")
Reported-by: Jamie Heilman <jamie@audible.transient.net>
Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
Tested-by: Rui Salvaterra <rsalvaterra@gmail.com>
Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvif/chan.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index baa10227d51a..80c01017d642 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -39,6 +39,9 @@ nvif_chan_gpfifo_post(struct nvif_chan *chan)
 	const u32 pbptr = (chan->push.cur - map) + chan->func->gpfifo.post_size;
 	const u32 gpptr = (chan->gpfifo.cur + 1) & chan->gpfifo.max;
 
+	if (!chan->func->gpfifo.post)
+		return 0;
+
 	return chan->func->gpfifo.post(chan, gpptr, pbptr);
 }
 
-- 
2.49.0

