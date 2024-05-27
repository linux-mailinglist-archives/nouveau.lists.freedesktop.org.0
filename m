Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54328D11F0
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467910F475;
	Tue, 28 May 2024 02:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JQ5cZCwk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10510EE1B
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZRXpnJqffQflgkkyLBhjhpOH+EZLmvd+cEYlbeN54JUNHQaSSLFStGRGFMGaOGfM7T+klEMLMVZh0Jp9iSqvxiKat/EW3WXIb9Hw+wrqVeRHd/6GWLzHq0MBlRaASATvb7DNA79c2HQVnH3jcoOWMd0d+Gjr684s4WvOkCrxURao3UuWrRBoManFnsFcP++DWZn67A51xafWR8UlgogRxRPM/aOKUWyrtSxrTzlHM65ulJhQawFF6G1F4ZyIjD79HaoKrMBWfaytB5pJTI7yXD+bQ9Wz+66y+n6iDvtugyh4nAZuSZiSrUXE4WJff7cJO2ythQd1V3tU0aIImchJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bppwa6CToIs1czLcrB0JyiP1yHoRdrHmSgwm7OaSrBg=;
 b=XGfjr+jwUXPkdfIQJU5bCCrTxt0fVsbhS4MGDpWrR6bN5rs8dLe52u0vZK0+4+p1ICdaAdJQY8ArtBhdg+lBfyk8fEwXhoIMxGqhAFN7i1Pn6K4dVJfMFkpugt8yr/bgDkQk2k1qJi+1XQAuQGHiSC+vVNm7+HXQQpZWMmffpKTP99GtwgCk65eoECNupUalXr64xzW1R7TdrdOJEEv+BG8i7I/To6vMZOjqkhVJC77Ul6krvL+er7N3N1laZFNsQDvJi3Kk8lEnGNub2kuAoAPmtoUH52FRnzUtivcvykk53PlKss4D9FKHH2CTMeSZqYp2fOvzU4NBaJ9XSKWlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bppwa6CToIs1czLcrB0JyiP1yHoRdrHmSgwm7OaSrBg=;
 b=JQ5cZCwkxPmEaJd3IUMNXLDG5IOb+S/yILhlEhs6umUW8lQgILg1OtBbhdv6pTnw7RTkK3pTd0qZkDrQAI2xx1Bt/Grwy8KiGr1UH/f37+archCTd4Nng+FLnIcIaVE1HhNXOW/kT3HlMRPAvqkkz+Re+2fy/tmUjWhsCcLcjSQn7t7WfiQnUW7GEtVoQ0b3xPw/nchUG8rHhv0Nh7MF2T0UQLj77o46vytPHp3yB5cXM+hrxV6xsZzGC7TPYE0qfbEjHavOiPlVX0RKoaG1c/CS46IGyYLjT6GfJVpEeJmm0LR/0G+m3ufnMYfVZSpO2muLCG0xzBLNxC/OFBCskA==
Received: from SN7PR04CA0169.namprd04.prod.outlook.com (2603:10b6:806:125::24)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:06 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::a7) by SN7PR04CA0169.outlook.office365.com
 (2603:10b6:806:125::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:57 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 07/34] drm/nouveau: remove abi16->handles
Date: Tue, 28 May 2024 00:19:32 +1000
Message-ID: <20240527141959.59193-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 1175a62e-57ea-431c-7993-08dc7ebd1c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ksHCh0Q+yNktb/mzXATgFH2Dyjj9Z6fIOg76ZXM9nC1PHmz8DMmFksM+Z2Ba?=
 =?us-ascii?Q?f5QXslFth2t2SZ0azInvATf2dfIZcL/xQYlPoW1APUw5cAzIjBRRYq8uHYNR?=
 =?us-ascii?Q?lA0aw6jDbfo2WYnXJRULRjXogUfB/s8t97uWT+S8P4CCIQJIH0d9cb6nOSo6?=
 =?us-ascii?Q?zwWTSsBrxzrj0L7m5ff+ltPRSzOMNaFUh2ce2hFR+NMmCo9m1LPN918zxL5d?=
 =?us-ascii?Q?fuRCdMSBBI6wBUBOfDKIAyZiID/azSYvkD8dB3y/DonX9ph2lxlYOxPxTjT6?=
 =?us-ascii?Q?JDPDqmAd7tlFaA2Ha8GeEs7BTmZZynxgpc0Zn9c+khys4gF9kW3zcCMcjn21?=
 =?us-ascii?Q?d+yTbRXLf9+SsaSOWxGZe8xCGFidjZC3hBmWedzBAYRZ+hP9eE5R94aXHqem?=
 =?us-ascii?Q?JGglEbYjV/CcQZDZuC+hVYZitjhoaTtkipPx4FwbCRjhth/U3G2BSOhkyDH+?=
 =?us-ascii?Q?XKdkkFK1ct66TXHgIeiTEXuiXYuoNz401Ft9HNsNJZLpgdSHV2+E8fZ0SmCz?=
 =?us-ascii?Q?NI55epA8n5FBR1iqvv+HOPhnsbC4xWmcX7kaO6+mN6z9hJd87LEfzlceYsqg?=
 =?us-ascii?Q?lqaTnopp2PgbDzq0buKqoSZeaBMNNcDaTi4yeZAAT9cqu+5++5fw4JKXgL4x?=
 =?us-ascii?Q?HMqfdlpPdnGdg4vDjuUgBjF0URm/bI+Dp6RVmmjNG4iLY+EEuHQoxiwsuD0S?=
 =?us-ascii?Q?O/7gjSBYE84RO0EF9xGUMLdn77V2tnacBSiR0ega9s2M4uVp+AHiLHrkaYGp?=
 =?us-ascii?Q?U1n8oNmm3drKlfV8eXZTlNNrQPph8QTDVnC1X1Vxx7uXIYIfSY7MFzsaZLgS?=
 =?us-ascii?Q?oZTL0uLPKWpB0EebIarQnmltA1BExfv8BhiACmRVAV5QFXh6cKI1D+7oFUFW?=
 =?us-ascii?Q?bPym8KH02ZJlkpQuq6xBC30nrHv/4MEtveCXQ3ESrMWnzQDf/FuhBT6Iw/hi?=
 =?us-ascii?Q?ytkFz9aDi2tJLjAzwiOO9GXTGMIvD+xO3Csx62ukbJ/kOtUDmieMMJB+6p27?=
 =?us-ascii?Q?4Qu4oX9ZIuEa81ZtBA6OplwykUnA4UZ0Ks2idCSz1PGuwvZw+NjY1CezdI27?=
 =?us-ascii?Q?lyJ0IR1I9Ja5Vf7pAR8Q43cIoYADyOHpyIWOkEE32620lEwUB4wWmUU9jk8p?=
 =?us-ascii?Q?hpyAMxRM5qV9B0ebw1qRG2+CwWeaHJYJa7VC5dBzaDjd9dusQQoI/jp95G57?=
 =?us-ascii?Q?VNCZBaI/6PX1emS0xrX4kT/Y4DYd6W4NPCwD+s9PriidcgfVi6S9r6hnkSt9?=
 =?us-ascii?Q?rc+enHlpnGoBkbksJXa3m+mboxxXoUHjXrUxFRsu/yjR8U729x2xeE3SVgK1?=
 =?us-ascii?Q?oyQP+o4neDNyhIVpZImXlSTq0sKKr7ZdDl7QDt8V2pUgQitV3+/NgyYcQ9VD?=
 =?us-ascii?Q?yyLw+OSG8U5Xhtfe1LwvWI8D3eXg?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:06.5874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1175a62e-57ea-431c-7993-08dc7ebd1c3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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

Hasn't been needed since 2015...

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
2.44.0

