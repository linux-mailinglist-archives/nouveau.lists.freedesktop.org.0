Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F739897C7
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C66C10E2B3;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ve+LeGzI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0278610E0BA
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 13:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQ+EbRo+1Tqa2rj4uqpUrB/PaX/auGjS821V8JvCk9W3yUA3qEi/PWC9wkOX660D+hchv1pnUL6q+ElbMgL5WYH+kLTD7m1mX7d+rcXGOiU1QQUKv11PTLd44mDBCn0cp3L8R6g4jwaVChuTS+wmyQTnWo8hLgVKg+pTLp0yasa8KYHk1ZAZxwaN9Yk1TcvTSRH1/skpzfKIpZ9IfWyLSSvyOydgw51i4oBGXbT+AUUNEGw5HEmyQc1ZQh/24mYn83dEq1DdMxI8xhMg5JRfLK5B5gEAakdOkAddxcgnQzx+k74kcCgpVesHvfi7m0YFjYNmpHY/ti7c4Zy6ibdstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUla5bQQh+psPQLAGq7iu9wM0rRRxoVFtPFsQ5vfmOQ=;
 b=WglFXL1EE+p4CrhZRtbWlJOmaXoPsb1uUR2DCH/8rzDMOMVhoSwxOlINiyY2+aimq9hdl6qNFaM8Bryt8SbN6BCbSBl22y9no9v5K+NeuH+MfDBm4FApqoUv+SQhfN4uqfuN5CEJXI+NN3IDf4jRXHdnwbcsVDfwIrxcyzKba64atP4v+YDvJfSI6Prcfdj3Ej8akHpjOnwEjFQ6X5vzgDA47g2YyBkMDUaRhqbvCNVcRcxy7ljAZoNWB5QDE8eZ3XV97uuDvNETNAGxo+ehWBlTAzIOVD8sxtY8DJWsGzX0VPwFF9t26zCZT8mVCYpqg21gWG29yZuls+g1VW1B1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUla5bQQh+psPQLAGq7iu9wM0rRRxoVFtPFsQ5vfmOQ=;
 b=Ve+LeGzIpsZqVYhGu9UtqoQEP+6ZNBBAKp8qNRyESqeg7QSRV4BlImIBCGaEA6ufXUNW9i2QsWjvc7QutZ5Nv6HFcGt2O99J5CL0i+j8fJQcTrowYXVRhZH5NewegEx/Oca7lBlq/AfGWxM9ZTcZjHNRVU3dkUP5ryzZ/7JEA3PFCKKntWVYS4Q6ckfp19FyTKk3YwYooVebVsWJLKOIxDHmtDNAKlGDxVElaaCQwC3ZLkoicLoJ9fzyuXYy/enSYd6UA+MWui0hKy8iNNLbpBTe57ZpK0GkqYpBHEZR3gvafWh3eYchDtv6rVPfZRofxUaeLY+fQzK104rR4mjRhg==
Received: from BLAPR03CA0046.namprd03.prod.outlook.com (2603:10b6:208:32d::21)
 by PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 13:07:27 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::a8) by BLAPR03CA0046.outlook.office365.com
 (2603:10b6:208:32d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Sun, 22 Sep 2024 13:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 13:07:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:17 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 06:07:17 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 06:07:16 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 0/3] NVKM GSP RPC fixes
Date: Sun, 22 Sep 2024 06:07:06 -0700
Message-ID: <20240922130709.1946893-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|PH7PR12MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fccd53b-1c45-4625-db9d-08dcdb0781f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h6Zr3vYnEAMDHCweOjWBp7eELBYhcjo15AbvpE20cyGuS1bvSjtOhoSpb0WG?=
 =?us-ascii?Q?g/ep8p9dbuOOsabWeJxiSdFtFi5byGqdOKumiHkIzaCoj3kgU6JNPkPysoBw?=
 =?us-ascii?Q?LjnPvVQX09NWTBw9bCDMwOyD9WUlgGc0zEi8BvBaO27tHatnZGuYi2WCCVnb?=
 =?us-ascii?Q?V2yzKR7QtQkzc+QUlL/J5D+Cip8yHSkSpRbiIyn6cgKkvUAGl+1v1sZFdLMp?=
 =?us-ascii?Q?FvAqNIB2KvCJ1Ne32Nlw2kBvN0bjMnI2s2W0KD3OCne/vbujouWDxRipnlLA?=
 =?us-ascii?Q?f5yIRtLLTeHaDS3etda+C/72E1a0tv3cnpIaJKyKyyYHX0XGcYItNML/unew?=
 =?us-ascii?Q?2o2qmiOMHte4iKa0ydZOL7O91y6cKbJnXLnu2i20b7pGO8kiNsPQbouwQRXq?=
 =?us-ascii?Q?c4dWki7ViYYpCAWhEcZOyCkID9aYbg7a9Gy+bHwqmWK8QGvvKk1CW1bvLM1y?=
 =?us-ascii?Q?kq25aAJGucHM+dML1JpN7QwC4YzRssh1GuXO6PrRoM2asz5m5QwDheS4JiNd?=
 =?us-ascii?Q?M61MrK6uFCWAva6g8mfT/u/3BFwPrNGEOLEVhR7RAzd8vRgVoFzgQUjWOcal?=
 =?us-ascii?Q?PMzgif45MCiRtPFkfj33b1rHQbacfjVV0DewDeqCHtqKvVtvbNHAewRn44Mt?=
 =?us-ascii?Q?5YseWHQrSZHH82O+JnZCooaU3bb5gZLc3BGNrO0J1Hv+IEn3MNB+2C+umD+/?=
 =?us-ascii?Q?GlciPukhH0zIRvDrJfP/lt8ghouCwoSTPooH6wR3frJLCxfsWeL6pxzjYkAR?=
 =?us-ascii?Q?JIiKLijXj6Q0XEQD5/Y7ZhYw34SsEKniLy6qx45hJ7FEfYpTKdxvhwqwaK1u?=
 =?us-ascii?Q?ZZzQByM9+RN5HQbirUTpdfpPTEPQy24mUMwIr5OAVHwEsvUXkJWdHm1ixM9X?=
 =?us-ascii?Q?q/QiBjRW0jdl/0dGag8YsvwFeHsPUQ/G5J0AVHjZqtGXYC5233A22cSwTnD6?=
 =?us-ascii?Q?ugJ7KvjnYpwLqO3xbXib1JhNVtIlgMYdtiUk39N/GfKuwM87LnOaZXFGHTdl?=
 =?us-ascii?Q?Yd/UjSNtorr3aZWPLo/72r4Z8PC0mBEQ/0FR4S7HF8OJ9BIZJeJpU4v5v0oV?=
 =?us-ascii?Q?LyQ0rt1a8onyO1uFnrqnGFqG17VKtuY/zaP7cYpmWyFdQ6DGE1i5pVZTO+Pm?=
 =?us-ascii?Q?u8k2FNXzFFQgQRyZDvDuMRBh16h15g5LXHIgVhj+OR9kcvsZZuMoGGCiML9x?=
 =?us-ascii?Q?ArPIG3MAMA/9cxsGNBytCr5cEd2McYK1AmzcrWomS70+gTUoIjlEt9vg9Uf0?=
 =?us-ascii?Q?7FK7MJOI4CPqD0/vF1mlagx4Z0EgoVJ2wYxpzk/01zpWkngXKFxvQ8BNrLP4?=
 =?us-ascii?Q?jdQe0XQHzEH9pgyEcd6nstWqWNUg1aVMFrjiO4vuo40CAIBp30PIzX6dR94l?=
 =?us-ascii?Q?+rREE2f6no4ixhE+OsL3Ods7UXPGMHdN9q6f9Ru6woaZRwDacpyQ8RG5I0C9?=
 =?us-ascii?Q?Y3grikRy61xxYi70nwEMwarq0ZZsb9Hh?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 13:07:26.9626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fccd53b-1c45-4625-db9d-08dcdb0781f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:51 +0000
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

Here are some fixes of weird bugs I noticed when I was enabling vGPU [1] on
core-driver aka NVKM. They are exposed because of the new RPCs required by
vGPU.

For testing, I tried to run Uniengine Heave on my RTX 4060 for 12 hours and
it is working fine.

You can find the tree [2] I am using for test.

[1] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t
[2] https://github.com/zhiwang-nvidia/linux/tree/zhi/nvkm-fixes

Zhi Wang (3):
  nvkm/gsp: correctly advance the read pointer of GSP message queue
  nvkm/gsp: correctly calculate the available space of the GSP cmdq
    buffer
  nvkm/gsp: handle the return of large RPC

 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 188 ++++++++++++------
 1 file changed, 130 insertions(+), 58 deletions(-)

-- 
2.34.1

