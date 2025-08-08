Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FBB1EECB
	for <lists+nouveau@lfdr.de>; Fri,  8 Aug 2025 21:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4733D10E975;
	Fri,  8 Aug 2025 19:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qh/BT/os";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D04D10E98A
 for <nouveau@lists.freedesktop.org>; Fri,  8 Aug 2025 19:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmaGhlutJGzVctYbGLyweZ7GhdaoBp4oW4jg9bveWdo9nEjVpFQZUho6dbWxflT+lcbwp/fvshZuuXYsyCpiNZhXcIQNMIYCN5EevpeTe3zVq9URIVvg4uWsaCiLitGR/5FZ2swqugUktTvh4B1h9R16ZLzn9xPGixHvjXxAKEmj19m3LgvhOsqUZXqB46xsp5GrM4CEBmR/wAeqQ8mjCOpbTI+H4tMqxtOGCmyOJHGHhT+NkipbfkogsjOfKEE1u3mWEoeeS/joyZNLAxA6cAbAeEsC5BPmCgyVUufLe9fdwYm7oM+zsldI+c8fPAB2sElOQT5m88vgexvaFzVNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzzBQt5BJNmEJ7lKVLbVlBX5t5jfeHTyQ2/SbUNJ6OM=;
 b=SLxWxhv5IjIBv9B+i2eFXMwkpU+wzSZkqQXQsZdMvvBOny3QrGPc91cS8MpSdjxajPPJw9p++dR2E0fqyEsdmZ0UhUc07WjtAEtQQMkU5DuxaxhL78ZH0IOQXHX/w+w/RwQJ1zrLvjiKU62/mkPAwTVak2L4iMkiIrUYmRot5fBdP73izLg7QQhFcc+wecBnd+KMUCmOTjrFRdG35JJwqqnG0jyuLKF4gkQPXMyIVc7Y7Vr0AjUkqqO9dx6gbtP+3AAmo+Sm7CNsTUuUchVWJAOWLAXgx6Y+MiT7iDmhJkCQl893DWPTadC0M+srD9ZMnTNULqa0hQh8PUaL4eAZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzzBQt5BJNmEJ7lKVLbVlBX5t5jfeHTyQ2/SbUNJ6OM=;
 b=qh/BT/osQ/AhZ4lC18txaKGFDhSjOGJNdh5CAOqbcDrzU5Xb3SrZUHOJMiTpO7f6EVpVyb0OKEDcB5VyY2x+Ij6NoPYEkw50fGfkiYkawq0de9ZkBFHKjXUDWw3aFlMyyumDX1iiJ+jccODHI5F5xJ3zQceucgYHv7hi/T0yRfWrLEXMASX7ilefqka8dI6A02WyaVg5wU1srlcmwdpKmArqX14GyYsGtopJr9RpJx0gPuNNipcnEmTCU5kHwiEwuWh7IQ7mk7bCTi/H3RNPMZrdh7EC0CZVZuWchTc/SCOW/DM1GUSH2uIsOg58ys6QSgPQAiUefjRpjKjH4uybXg==
Received: from BLAPR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:36e::28)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 19:15:08 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::ee) by BLAPR05CA0013.outlook.office365.com
 (2603:10b6:208:36e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.8 via Frontend Transport; Fri, 8
 Aug 2025 19:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 19:15:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 8 Aug
 2025 12:14:51 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 8 Aug
 2025 12:14:50 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
Date: Fri, 8 Aug 2025 14:13:40 -0500
Message-ID: <20250808191340.1701983-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc14087-3b16-4512-c01f-08ddd6afe354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5kWBH7DW/WUV0LSaT4RiXzYSxF9/WPbFdCjy1H68TXaQ8zM/+ycdDF3JKOYy?=
 =?us-ascii?Q?ZGzlw8wxIIcggOeAcA5jBMgBTncHZo6wUH+1aFERGTiABR83RIgc4wxKWPpp?=
 =?us-ascii?Q?Zl0t6uIn4NqF1YXv6s/pKWTsA6MHb3z53SPYFlmdjM1LJrRhtJuA8Ff5WrkQ?=
 =?us-ascii?Q?nUiCni4Cn4ucG8SWNLtA6FLBO46lInAkwEEdp3ODBMpCUoQRQd4XYD0aBBkk?=
 =?us-ascii?Q?0YV2W3uNYC4Rz5q9OGXRDLF1jnLzt+E4eZYta0lJKOxj8+qIi+c5t/7YxzOY?=
 =?us-ascii?Q?5fsFFrn4l/+ckLValhGQr9UQBvPjBWHHCFoB83uryIKcqt3i0ulNXJ5md8c1?=
 =?us-ascii?Q?HQF36mw0GU1VchSHKq+L/jvF/8sH7vJoZO0NAFgO6j2ahgbSWNe5pxoiIwX8?=
 =?us-ascii?Q?g6aycfWNK3CAceonZS9a6t3ovJzM7gk/5d1Vch2plQ/YWdImmsm8LVjIZjA9?=
 =?us-ascii?Q?VORRY4Br7BP2VrQ+d5wPI3maqGvs3GoYUfiSVHU4Ow8rSGr9to6NasRpyhFq?=
 =?us-ascii?Q?QW6KouPu3NUTt/NZKyRMCPiCmCGzrtSzSe84y+yKsg1DsdoWa5zcKPukCvWy?=
 =?us-ascii?Q?t7sjpA1h/C5uoZXTJ9hzROtggmPlSO1PhTm1VaPb4L5IQpwG+1L5YfT1ZuSw?=
 =?us-ascii?Q?ko7mkVt/Yc2eF75T7lOnA1piZ00zWi8jZZxCNDbQnXn51o7nhDga8+egPykE?=
 =?us-ascii?Q?nNImWl4ogq0lh+2D0E8ovt+ObcyxMerGH1UecTskcE+ka2flrk1xx8B35f+K?=
 =?us-ascii?Q?/bPaZZoaAvECYrJ1IsbWUu1lY8TaUG+d5Hwla/Olh5NEyDMjvpltQiVgQy8I?=
 =?us-ascii?Q?8Dbb0q8iRKk2pUldcUw6qx+CjHXIbWV8lnzu7pKRToWlV/MyaDb+lyN933YH?=
 =?us-ascii?Q?7fRW20dK3u4beVAYxtQFgPgPPJLduB7GPaLvKxO4ReAeYmH+mshxv19oIjq3?=
 =?us-ascii?Q?kTkhpl5IwtwM4UC1J2seNx3jyoXo7NIWJSyaUKYotLf9DZnopyupn5AubIP4?=
 =?us-ascii?Q?hWB0uCFdK1339WZN0rwXDwXKEAMem9SLLFpm/P+1SeabyMnlhnaXboZoJ8tA?=
 =?us-ascii?Q?YkgGk22GgAYoulmrdehXORg85+vih7VWgHXOBKyfcpOd2iJO8LaZ+eEui+Fm?=
 =?us-ascii?Q?Yqp70M+SGlCxRVEY3TS9pAi3+d4XUpSLLV+/QKM1Hhbc5ZHU+saYXdWqCpy1?=
 =?us-ascii?Q?S9fStrN4q4Kk1H7Uaj2jDvJsj1lRBlLo1HqTiaww+xyxGp8AA7Vt5Jh2bvuG?=
 =?us-ascii?Q?8khHKLjoj44RW3X593f0QhHuQpLeFF/qq5O/Jw/MVpagUPQBc76DLBl326mh?=
 =?us-ascii?Q?dqMQBqgD31LvVyVyQd2MREiwwCsUu2FKnH4bvCo71lWuKxZizQSarm44ZQ4K?=
 =?us-ascii?Q?Hy9EiMgJP+DlJaHpPyqhBoqp7/MJPVsyvFS9zyotdq32YKRoOzPFDmBB8i2f?=
 =?us-ascii?Q?p2XiQvhgBBHsvBixzlfr0BJuqDZ8fiTz2Am/eX7zChtrBw97KaOmwls5kIM2?=
 =?us-ascii?Q?/FZ1J24geNJ+IBCAehhS+PQuccKyppbDyJP0?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 19:15:07.6168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc14087-3b16-4512-c01f-08ddd6afe354
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
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

Always set the RMDevidCheckIgnore registry key for GSP-RM so that it
will continue support newer variants of already supported GPUs.

GSP-RM maintains an internal list of PCI IDs of GPUs that it supports,
and checks if the current GPU is on this list.  While the actual GPU
architecture (as specified in the BOOT_0/BOOT_42 registers) determines
how to enable the GPU, the PCI ID is used for the product name, e.g.
"NVIDIA GeForce RTX 5090".

Unfortunately, if there is no match, GSP-RM will refuse to initialize,
even if the device is fully supported.  Nouveau will get an error
return code, but by then it's too late.  This behavior may be corrected
in a future version of GSP-RM, but that does not help Nouveau today.

Fortunately, GSP-RM supports an undocumented registry key that tells it
to ignore the mismatch.  In such cases, the product name returned will
be a blank string, but otherwise GSP-RM will continue.

Unlike Nvidia's proprietary driver, Nouveau cannot update to newer
firmware versions to keep up with every new hardware release.  Instead,
we can permanently set this registry key, and GSP-RM will continue
to function the same with known hardware.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index baf42339f93e..259d83ba595e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -582,10 +582,13 @@ struct nv_gsp_registry_entries {
  * RMSecBusResetEnable - enables PCI secondary bus reset
  * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
  *   registers on any PCI reset.
+ * RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID
+ *   is not found in the internal product name database.
  */
 static const struct nv_gsp_registry_entries r535_registry_entries[] = {
 	{ "RMSecBusResetEnable", 1 },
 	{ "RMForcePcieConfigSave", 1 },
+	{ "RMDevidCheckIgnore", 1 },
 };
 #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
 
-- 
2.43.0

