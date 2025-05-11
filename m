Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B6AB2B49
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A14210E09F;
	Sun, 11 May 2025 21:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNrBEo9i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C410E08A
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNi9Dt0GTJGJC3phQmEQdK26Im8b8FoHGK8ACTOEVOuDGwIFN9QUfY7DfE6enZUF0N2Oxs2P964CFIXrhp8v6qvmnlA8uYzistDsNtnICaUFyPqc/gKhh8U0Jp8rRVbQVxLVXSSPDhCgisx4o0rM7bHHcJL0dYNjw1lZSf061hqbQGlGBLcYrfxicqd9+PQ9RXc7TJnd7wUiRkyplW6cqhVwXxjH9/2fr5ymHWAOZ4kCklySTVuediKOxQkbRHzpRA9YUcTzlAUU9PFDWERaFF13M+kR1o0b8PXP5mCjT02ZBVQFYeC6wL+mQwXcseqeHl0ddWhFqrwMCFdCKqk6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS86kIrUd+AAOrRcoHWCAy8ovMZMVSKrS3vXlkSl9bk=;
 b=WTA70QlzFJTLjOXeY8Bwn9bGvV0r/8fi8JIGUBvZUuc7vAh46OIJlQ+gI4dvz3svy6HNnboajDHYmXzT7Py1TZFXq1Nqq/wKBs+5/0jXNkjAJ0eY/jWIpGCF3qiG8xWDn+aCsUfVvdFjAwv3uCPy6zQy5MqXzx81TqwOZRRBy2NFAt7kTLe96E9sLq+zw8Wi8goBhFGHzNyI7lc8kP35iw+JAPRe46bjMw+cieXYe/MjLWqrSnMnOUkmYVnZDW8hTyRfJvndNtBcBRTRT47VhFwnc9BiRdXU+s7Qq6PyRo1ew0swSlzhPwjRYCSJxeONWPq6wbxPNSC5naspUl3uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS86kIrUd+AAOrRcoHWCAy8ovMZMVSKrS3vXlkSl9bk=;
 b=UNrBEo9idbhPe/A+94nZVstno6CIk7USQ91ljso3XalSbGstbp30NPD9bUTJhEqUpMETYNLIXgrTxWRI+LfltHZ21iyDXCaYm84d0cyy0fDoh38CA8Kc89P0Wo39PiXX9/95AM1GlR6lZ8cCCxxSF3TnS/2dcVgyyU5MjIrLdVdWyhwGQdea6oY9Y3+pTiqpXr+TmpbcAwoH0GbSEYDNKERZsOrCYIJD5AnSzV+IrsyoN5pZF8NwjFRhFiKrLMoSp5FSXtI5FWqUmJOaP1kaou8Soe8i3WUOj4q+H7DNg7wRa9WEONjZNOcyANH9B1/xxoCANdKout3LZp8gAOIDJA==
Received: from CH2PR02CA0004.namprd02.prod.outlook.com (2603:10b6:610:4e::14)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Sun, 11 May
 2025 21:08:10 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::5f) by CH2PR02CA0004.outlook.office365.com
 (2603:10b6:610:4e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:02 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 01/62] drm/nouveau/gsp: fix rm shutdown wait condition
Date: Mon, 12 May 2025 07:06:21 +1000
Message-ID: <20250511210722.80350-2-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf31d64-53a7-420b-9414-08dd90cfee97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vTrCldFzbY9wltyYIpdm3d6gy+VJmiOzgIg3rIpSunJYEhfjwuFp1sOIpLgC?=
 =?us-ascii?Q?zRMX7iQBMuZROpfAVCELY48a+N0LvMnMmXtB9TbLKAwxSetwk6qV/2sdOwbc?=
 =?us-ascii?Q?tgyHNZpAQvpUyoDHjC1Iv9lzqcQ1hqU6EPVQnvs3Fcl1p7YXtLTkjx/2Wmdf?=
 =?us-ascii?Q?hVOYOECAq1k0rtFxFlhtShez4GEnU5LakKhIr9UVeZpqTkRoq//UanAUK8If?=
 =?us-ascii?Q?GOo9USilakC61/8VMgWQ/99ftMOcgrtkd34yaFKydqB9f+0swqZWlRf6HwcY?=
 =?us-ascii?Q?8oJJajfGvpnYauXxvRy2ZhuXpQsR/Xxo0A6PCnEZbXZ050Ry2RZryjmcAFJy?=
 =?us-ascii?Q?bCkgppCd3f/j8XhVf5hLSCGM8oUeKWEqvO4gmuA+ABDpVty1MqVzC8JlQ1qK?=
 =?us-ascii?Q?H8D5qIDvFmmw0tSvVhWViSijhM6P2rCC8veHFNedcMY7ndXKH60q7kFYi32n?=
 =?us-ascii?Q?yWKlnflS5LjiaLJ7HmxC5I5ZlH6Kqw2V7xfQSOEvG4jotVcxhVfXnsb0M7VG?=
 =?us-ascii?Q?eROOPWNqYLP5R9INmHPQ9CIZcRCEDMxdq2yenGm5Cah3S20X1F1urTjRoYNb?=
 =?us-ascii?Q?XlqaQAVodGSUAqWRvu96j7s7j1C4+g/izEKACr264M0SUpQoyubSm9u3FL/t?=
 =?us-ascii?Q?4dZd75eLo1kQDV3EF8eAeuA5JMGdf3djKymIsAj0LQPcGv5SaHQHK0xl27+s?=
 =?us-ascii?Q?4avSB0hg/1p3W86hVPcAKsT+oB83KK0hpoYJBFaxdliG1QJWNVSMf1G2EZiX?=
 =?us-ascii?Q?xDdAcU7t61xE1hU0agFdM0MtbOXTYfULDqQDraBhKwawwQabwc/ogaSOC82X?=
 =?us-ascii?Q?w31Q+4wjZ10YrgUUv5HjzRFrnKTCn3jvgrRC29A5assxyTIawxmiHnU41mlg?=
 =?us-ascii?Q?v2OBs1mTM+Q8yyWybz8tQ5NKbJn4tQItf6josSVskeFXgucoEegd6l0Rc/1+?=
 =?us-ascii?Q?Liz4qbIAa8FLCblYkQkxqYu+9pqLRHqaUn89gEyCH6e4h1AuAAt3T+RJ4XnW?=
 =?us-ascii?Q?qYgRWWweeBmtEo2baaH84klrvB/26bN0jXEIm6H5hXeBBo1Tc26LlrxOUR6N?=
 =?us-ascii?Q?LE5nLGwzFhxszavFgGl2GrWQU0NjVIAUgeCOOp8E/LHs0mRUuneNwPoJWD3q?=
 =?us-ascii?Q?hZMoNPF6bBKyuN6B/TghgIrY/XFMng05O/gEIAO0AHeHmn8fFSQgmq9C3DHz?=
 =?us-ascii?Q?QL7v9SV+sP58MiSSuT4e0OrVbk5Px67LbPl6nUId3E7lhyxlZmiHaA2vxNI5?=
 =?us-ascii?Q?2svmNhV6e/89nXCUunfxiAu6aU/Kc6Dt4ZC1+Anj0SaQTpwN/u8sTielcPF0?=
 =?us-ascii?Q?mdXil01FTfKPzMJmCAZ/LizFUzePtXr0jM9ejOweBjOVVMK2nKzmQA2OUISz?=
 =?us-ascii?Q?crtOtwm1RAbix10VtnlYlBf2MY5tSolGBrSSSrZl+C15Cktg+VQ4f70k7NKd?=
 =?us-ascii?Q?qiVFZxuX7X3ohvaTgsi7rPxhNM1gN37Bu42lhlU+ZE74HF8HO9gZ2Dc3bOIW?=
 =?us-ascii?Q?oI/yZFz1HbOMcceMgz8cCgEREUiukyBxm/PY?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:09.0628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf31d64-53a7-420b-9414-08dd90cfee97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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

Though the initial upstreamed GSP-RM version in nouveau was 535.113.01,
the code was developed against earlier versions.

535.42.02 modified the mailbox value used by GSP-RM to signal shutdown
has completed, which was missed at the time.

I'm not aware of any issues caused by this, but noticed the bug while
working on GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 969f6b921fdb..64b58efd3132 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2844,7 +2844,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		return ret;
 
 	nvkm_msec(gsp->subdev.device, 2000,
-		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000)
+		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) == 0x80000000)
 			break;
 	);
 
-- 
2.49.0

