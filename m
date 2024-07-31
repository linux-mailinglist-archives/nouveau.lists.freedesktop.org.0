Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004219897C9
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594F710E366;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QrNdhpNd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAB110E15B
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix3/Iz4jIOMKJYrAb/aTWMFPm1ubwpSs+B8LEeHgOC0lnK3y35dkEA3MaYuvAiAA/pl9OuSDHPeDcbgYW4nExHviZo3BRm6Cu32ua1HBjXJ2fncXmgxQdAebUt9qs8ZBe1fTaGHnOEwEpxJipUgMhmX2M/H6vzwHwB7w+VErxYCOfFZlph0dY2kDpNnhCTW7gcAXizLKCisyaRYjSZNqllnujSZ9QWvEquM7QzxmN5gkoOt4SD52jLCJcbud4TkJGMSq9yAszcDCUMXNQ1QMri9nf8NeCg4SYdW35H527DG10ar/hl5GfmO2Z8ApOYHEoQsFyqM9O80pNzMyt05v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKo+r1MQGge2SmCQk23EOACf8k7OkutYdKS3nQBJO/Y=;
 b=yLPOY/t0H+E0RGZG85Jqjsn6fTyTPE2dLcGM+ku8VOS3IxGOlxw12Yrb+yKEoLw8E6zoOPAAMG1WxMEiyR2LVL7g1K4i4zX8f3FJCwzHQ5F5PIVLtq+hG15XITSMVqCx+fffEg92WGGBYqyQt8Mqx+K1nBSkmcK9M+kTwTucV4k25Cn99psz9OUCfZPHEs4qH//agIeW1BaEWNCH+8OFY89pUzNtstOnSVjVcIHp8b2Ai+Evy7lp5R0/AoX5s765pS2mIvanxKcrImKtipOSxyfvtQ4b3tb3qi6SA6tFOdr7UNsRW5RxNS0heDwx6AvygKLCei49b0M6CtzeJPJYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKo+r1MQGge2SmCQk23EOACf8k7OkutYdKS3nQBJO/Y=;
 b=QrNdhpNdGbde5VtIcNDpZtvekovUXVAAqvJ1o0/dJVXKhYhlp5oXyi4X07P5L9UtwfnhIZbvWLoSFK/VIcXkeZOz0F4kiSnZWALr5i8ay0Lo/xb354IqsmzQpf1fKicv/FitNwEfF1HEyMw15l6UGV8aPC7CaRtyMWWGNym40LC9477HOFYbcfMCCJATCN0pK3ehzmU2hde/gim5jdNceWfuYrt+W4JmFSUmhC/2a35poRKAxh/VMxOpRrFiL3SuUJtQU1y+3L/nz/4Mrujp+4IGzEakBcN57YbCjD6S94hPY4ywjsDuUbNp2DazK9KX9HFkU3gosXHxTMiKu/3DFg==
Received: from PH8PR05CA0021.namprd05.prod.outlook.com (2603:10b6:510:2cc::9)
 by SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 11:20:54 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::c8) by PH8PR05CA0021.outlook.office365.com
 (2603:10b6:510:2cc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 11:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:20:54 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:20:43 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 04:20:42 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 04:20:41 -0700
Date: Wed, 31 Jul 2024 14:20:41 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 10/37] drm/nouveau: remove abi16->handles
Message-ID: <20240731142041.00004aeb.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-11-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-11-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c837b0-9a44-4f8e-c9fc-08dcb152d783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZ44Fvz60BLqb/HOxwIkuWyrFhO+loPOEYsu8XA1qjBZ3WcCQnOBnXg2+CaS?=
 =?us-ascii?Q?XfNh2fN6KOxMuT5fIMnfJBJsLnOefIxj2R+i1HA+8MQkj1+rwYi7oGwouM8F?=
 =?us-ascii?Q?FZUTJ3tQUIWoVQtR8nw4m6XOUQsr5lWkTzMnKyrqdt1JCeyc6K4P4ykaPNwA?=
 =?us-ascii?Q?Xwkh78/by0Y5YVQ0zfemrKp8PMIQKiW6Legs/VILu7ed6Pvc9WHAkDPttJJQ?=
 =?us-ascii?Q?6ELdIXjcj6gOxQ4GS4XsH6xFfBrHse3k7BzOp2bh9GlRZlyfn1EZDbePCxAt?=
 =?us-ascii?Q?GP7nV5wCb9F2tDhyJQ87ZHK/JsjxX4r5VCji4JMTqqlaa/10spfMpLmWqF1m?=
 =?us-ascii?Q?DrhgPYM8hCLsS6/Oe0pZ32TrJd9A1PYXOHdDYQAy1bIqidhJ/qOzN3WKN/ek?=
 =?us-ascii?Q?RMGNoZJelRm87WsSErbiT7aFI0UXuNSmrTUCursG1PX3XmqMRLdHVS8U9lB7?=
 =?us-ascii?Q?TU/cOV202iMGRArIlRdUec1wVulr9iLjx4USTZZXStohpqM66Rpkq7p2RonF?=
 =?us-ascii?Q?O2odDhFDdsG3XTljXfRVH4VdYk958dUewTl2UmyBvm+8c+cI731gVu37yvnR?=
 =?us-ascii?Q?Npd+Y4GyPrPvMSIEc7V09WlJtJfFWk4p3aguFdA64m7gUM2MECqoqBJmV8oD?=
 =?us-ascii?Q?0f1UrkCGKeH8cBbo1gA1oYgv2TI9dAYsOE7CFTu/+NEZ9lJNf5VCYKvtp0qB?=
 =?us-ascii?Q?U68iC1B6LPw4gvnwDr3FJWMxTSeWYAA1miV5UqiFAh6iX0bPgQfjsTMLMZ31?=
 =?us-ascii?Q?ljVEUFC707M2R2BBmz5RRVqtAVNslkI9vrUDhDcQWya9A+oYj4oaIozOiB6M?=
 =?us-ascii?Q?SS24LLWLT6ROTGqYTTUxTFOIFpjP6HX1EBT8KT6lTv6S5+ShLTpyuQaCggRI?=
 =?us-ascii?Q?jaiVnqJXOGVms+7GI2CuGlWZIwpyDdfoIU0/UvcE/02/L/0EyrRNnbZBJG0O?=
 =?us-ascii?Q?tMvXbOUgpHJAuLIo6yIEf9s0MOd6108OjUEsjbMbzmpMxzWqKOMAPc2IjhII?=
 =?us-ascii?Q?1ZER1/y77rmEz/K2b7aGZFMpLExZVghrwp6KNJBiZW5ftViN7+scgXLiI6bO?=
 =?us-ascii?Q?XbNK4s+rJ1Y5wAJNm+zF9cPmHeuZ8uzV1QrH1uSPD8mbtf32onPdzc27dWX4?=
 =?us-ascii?Q?GVIEuty2tzRVJKPOPQWvMhGDRK34RGH38ky5XGWXsXulG1WnkhX4s/LBU74k?=
 =?us-ascii?Q?h+svIg75qoyzg/j9XY59dm5lDZcmCBq5RqT4C1ju2eN23HqN3KwgZukHX+c9?=
 =?us-ascii?Q?yEVZtOZzcdVGvcH5zx1uCbNbuoywjiHoD4NGJ4RF/wTNS0fj+3DbSVy0Sa3+?=
 =?us-ascii?Q?JOBmrxphAW7UUv6OFsn/G2otGKzsZy+yiCI3z6S2MAnfp3UuhtiUNWZihJsa?=
 =?us-ascii?Q?QqaVXTozHdJGCBSWs8g9imCk7jTx5e5YJzX2lLRzWIBCjjJtmpVNZMUOdZOD?=
 =?us-ascii?Q?iHAYjgZDN+EZ6h7cGEXAJRwHIcnRflkK?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:20:54.0003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c837b0-9a44-4f8e-c9fc-08dcb152d783
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:50 +0000
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

On Fri, 26 Jul 2024 14:38:01 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Hasn't been needed since 2015...
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h index
> 4743459ea14c..af6b4e1cefd2 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.h +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h @@ -32,7 +32,6 @@ struct
> nouveau_abi16_chan { struct nouveau_abi16 {
>  	struct nouveau_cli *cli;
>  	struct list_head channels;
> -	u64 handles;
>  	struct list_head objects;
>  };
>  

