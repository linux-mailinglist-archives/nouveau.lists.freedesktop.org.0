Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7099A1B8A
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 09:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661A810E7AA;
	Thu, 17 Oct 2024 07:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g+9Rb43i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1F10E1D7
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 07:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+yd4xdiiCnOKDNEB2Nk3bRlxkZcncRo0tPU0wZ1iLeV3djEeiO2D9Pa7UvRUp8FHH1sZ6v69+H7smZ8gkSEBp+FPolbLnLXtOVlob0pWOFUl8Bp0VRdURMHNYyaoolC7nfYvlRGEc2d/KxPrDanNPiHWH3d8lv0MOKZg3o9H1E8DiKD5jZC9QnfM54XbbofWeVHaITzB/phOKpwAFjzXLEOhBDmEC0TDAXhhlOK8JVJL2fhHSztk7+fGxG+3FO/oLKvwGgsoiTtpJW2uabHivNaW0NA/66eAphEei7olKm6uEpVsiypnaRtuOvSztXEG6T22IqlgRDgsbuyMef55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1ubfkvZGlA/zDI2pdELtvcxaXFqSX75T19/P51CfDY=;
 b=vW6zypyb9Iix1Yio3u9SVWDN2TWgymJkIf3RFUBgFQ6rs8orrWB4jKigMuNHvWSg0R/bc3YOhqt//iAW/b6euaeI6CjtZiUs9m2ondSQe0ZgRPOOWFaqiVh4VVUC+EZQVRiCOM5KP80MJA5roNjNcPWZKtZ2jbcttEb+2RR6c9PKoXyAGmlUl7iSgMdij2b8/l2Zs7N84EayZ332DRA53ifzeSODRDitG9w1x27vb2zVG6kT1EWdnapRcB/wsTngbF7erCLXClcaScs5A9OBbPGujUBWGj+ObMQvi9FnhSvbLkMk3cYFd/6admrF19PkJDbEsx8ToWKP13bSJnboSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1ubfkvZGlA/zDI2pdELtvcxaXFqSX75T19/P51CfDY=;
 b=g+9Rb43id+jMoOhX4FcgV9vcVFnRokGgfNSgDIXTxqaNUqmk3WSPnB6U7P74p/ZcKtKwh5a6LWphXACPRHX/baq4JuDMwz4+oJrkFtiXIcigIbvDmprqMy15no78QD+DTBlj52qhm/9DW9sdmfWW80lqA/Ew5WL9Nd7jPWAR9i96uzoLrf46F5nNkE49SZFDHqW2CiPjD2DA/10HZlhnq/VBTswP7+V0w7ZhEU51j9i78Qf0oVdcgO9pxn93Qe+Y2OH0QZgI5WBp9aWSbakBylACZPYWJTxYij04YacUK0NrImsgf6YrKoFLcdrLlGx/7qLQJ4UubvEalJZ2jhKNjQ==
Received: from BY5PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:180::30)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 07:19:39 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:180:cafe::b4) by BY5PR13CA0017.outlook.office365.com
 (2603:10b6:a03:180::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 07:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.1 via Frontend Transport; Thu, 17 Oct 2024 07:19:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:26 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 00:19:26 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 17 Oct 2024 00:19:25 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 0/3] NVKM GSP RPC fixes
Date: Thu, 17 Oct 2024 00:19:19 -0700
Message-ID: <20241017071922.2518724-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CY5PR12MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b677fed-2bb7-44e7-9e6b-08dcee7c0f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y9nYwnku8+fgNXzvfCjpMqojiV3oVdHfHCLTTKty2SdOSTQWxRL2eSSiVlDK?=
 =?us-ascii?Q?edd2xciQX+TBYwnxzB2hA3lLbK8JF1bLopnxGnn4B0Ugri0uU9FgamlcyYjy?=
 =?us-ascii?Q?lXbzuyq+6oeioe3DUTblKA2FqJkqNcXIi0By0NAjlWdRzlZkYhv5yf+w/nRD?=
 =?us-ascii?Q?u7mDBoHKx4MVqKgR995ZwCGSiuRmkex3G2rX4UNjsnimc0jhVOZBhVVui6r9?=
 =?us-ascii?Q?Odnu1+nwrGNTmEZdv+LoXfCHOTMNkgdE20ZdFm/nVABPVLj9YJdh8XzKxzMD?=
 =?us-ascii?Q?k154GjSVcfS1MjyeyLt5XqlS82asX6yFhEvOeWDJ1zc7K7ZDJwn7aIKzNNSE?=
 =?us-ascii?Q?lsJrZo2C6OWnFasWfzEfceADArzVLBcxprhwVRqjRe/WbB231ie129uZXZ5Y?=
 =?us-ascii?Q?662DO7BYKEdDH26vEqanlKGLKU5s8DviN8zGQ3TdqczGRUB4PQ3DDtlaCGOR?=
 =?us-ascii?Q?/cVTtFb7ChCvWvxLl50i8rM4y5XY3jGR/+ksJkQ7I3A/p2vW8exCuoRt2x4p?=
 =?us-ascii?Q?VYhoRi3ItLfuHsGim6Ib4gBeYlORjfygwjZf96NgxyLG+sXkC1X2eFL8t10H?=
 =?us-ascii?Q?OU5eZFpLMsF8ebd0XemUBOEIjX6av0xHL3cjxDcHwS8nbjcr9RZWZzCrZkvO?=
 =?us-ascii?Q?8EqvaBYU556c5xcgR0Fhel2K8OuB5k8udckBoNt76sdK7xCYBQn4e0eS2f1N?=
 =?us-ascii?Q?OX2g91mAbkawqnllVrifhqNbCJ6JTRY0G0QwWYheBF+KbLwYw76+nnKOtCNl?=
 =?us-ascii?Q?bdOBsTa5x3891VnNjk5tSea7U/M29/J3HPnHsUat/6Mcq8aC5o/QdmsLz9UV?=
 =?us-ascii?Q?GVcT+yhd5ERpGlh31KwUJfOzfLL96yftVxGrM1vzkDmY1IWvZhDcgSwfAgNW?=
 =?us-ascii?Q?LKIzNnUa61aZ9A0YIHaPk8DLPoKdKih0qn/epZrpxdrv9UdW8DFSd0erQs1o?=
 =?us-ascii?Q?EbnTvJabbe5RX8LUQtnqB0e6LAitX7FhxmtZr62+aW7od/Bwn+YfU8itzXVt?=
 =?us-ascii?Q?GyKLoy5c7NHP2JamHC0GBRx6MksCRfXTZLOyw+XMQaXJ47xEzTudMAgtzsE2?=
 =?us-ascii?Q?s9km6REacvMxyTGRSSza2IO4b27suECfSBSewq90Lc3pXme+QYVEkd/sLEVo?=
 =?us-ascii?Q?7wqnL56dDck8/Uq499maZSLo/08rPN2P8mGaKfyiIadep+p5/eH/tsZA+/5K?=
 =?us-ascii?Q?2u/QP8tdvuPYf2zWMnFLRcA1fHCmntp3BzJ6OA9MNA4Mt3RSj0YLgG3RWVeT?=
 =?us-ascii?Q?nDco5dUJAkhfnsIJr3BeAJQuTSilBF/65uvF1Ypq9FIjggEx/KKfl2uh2h38?=
 =?us-ascii?Q?jlOvPITJNu+ZMSftqPKkGRPy45jU3ZOi/DxDnKctLBdAc2yUMmisoMjrFjnj?=
 =?us-ascii?Q?OOHvouPkYW5MK5D7dbokpN1H9xjHCZ8WHouD4dIq5s+sdERxwjktUQNpe693?=
 =?us-ascii?Q?uJ4jJ/Quhic=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:19:38.2041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b677fed-2bb7-44e7-9e6b-08dcee7c0f86
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372
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

Hi folks:

Here are some fixes of weird bugs I encountered when I was enabling vGPU [1] on
core-driver aka NVKM. They are exposed because of the new RPCs required by
vGPU.

For testing, I tried to run Uniengine Heaven[2] on my RTX 4060 for 8 hours and
the GL CTS runner[3] (commandline: ./cts-runner --type-gl40) from Khronos
without any problem.

v2:

- Remove the Fixes: tags as the vanilla nouveau aren't going to hit these bugs. (Danilo)
- Test the patchset on VK-GL-CTS. (Danilo)
- Remove the ambiguous empty line in PATCH 2. (Danilo)
- Rename the r535_gsp_msgq_wait to gsp_msgq_recv. (Danilo)
- Introduce a data structure to hold the params of gsp_msgq_recv(). (Danilo)
- Document the params and the states they are related to. (Danilo)

[1] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t
[2] https://benchmark.unigine.com/heaven
[3] https://github.com/KhronosGroup/VK-GL-CTS

Zhi Wang (3):
  nvkm/gsp: correctly advance the read pointer of GSP message queue
  nvkm: correctly calculate the available space of the GSP cmdq buffer
  nvkm: handle the return of large RPC

 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 251 +++++++++++++-----
 1 file changed, 184 insertions(+), 67 deletions(-)

-- 
2.34.1

