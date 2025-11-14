Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A816C5F95E
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7A310EB4E;
	Fri, 14 Nov 2025 23:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SHQvQwuj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD110EB4C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5k1de279ae6JNMJNuCm+se9rBF2F1/q3pEr+2C7QmlRcSgXVcNCDgFpc1hKaYHv2L4jl6H/RkhGiMJFCzEzfAKV67nfknGDONinRLGnSaY0yKUjQUSN0DXgvniQhS42O2cnZ0uo1o37/JOFmEKvFuDfsyIHohJndfWtoFxuPNTNXxE+HBDVdGASbfTwvzfKFzA/e0JK1gJZOqfMsBpNm3BZQ44P16EBoLh5au8xtTdgoACx8Bk6QNIdcXj/onelpBDjGayAjqNUp4aGaTxBl6ggE/VqU53w5zd52EcxDS4listOm45O4or5uRpUMXt9K7fGijGzMh8je///HQEyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqiKulT/6V1adddSRUXTq8pdDhL2DrW6QCNICUdbqOI=;
 b=yOt9fME45drJpEk84C7SAl9V9U7MrcwP067x/Jdk9UHbcKWiabtpOtf1hbC88PsVjKbW6jeUbta271NGHIAlpXk6b9l8tDIH2u4BXbXmFfXwbxHng1OcASdNDdijd3Gs1JacEWBPY6vtIYqvH4EIFVBm6nMtRKp+d2/uNjUPL9D9te14UTfRXwY82bm+RSJ+JamkJiciG8t/PA2AHFpUITuWq+9D6m7x9wiwepcDuzEHUuvl4j6Z8tEujX2kB/hQEFLjZmeeq6w23Km0qcgS2e7XL9NcDmzNke8i8agicso3PWLDFwZu1ly7L1uPVHU0haRx9vdKJnR1rgSdu0Fn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqiKulT/6V1adddSRUXTq8pdDhL2DrW6QCNICUdbqOI=;
 b=SHQvQwujl6/WVZaNag/j0k8t2ynI9hmdMfLDeCatt1sOmNUVv7QuVPY1MIGYNznHvzZjTGMLClCxoeCZZLgBtjHQkygW8wXjOufoTuIsFlduPcJhhXZnePGKxttlXfuJHJN1wvS0GkuvKLwBw4QxuDkIUpC+osfPKq4vWEXxwbBexnLTaa+6MSgAVDLw5m72j0ETooE30ROnIk5WQwurNVqqMLFTmEHkU9ZaiDpc+KIdhSJ7nxw/dFiaPFKU5uCiN1H5dwxm7dz2XP6cMJiUYTnlsG7gHG9AKGflJGdv6Sr9BDEKRH0MESLHSbXAHGeT4rI6pGxrG+yZix/JV95crQ==
Received: from CH5PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:1f1::28)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 23:31:22 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::e1) by CH5PR03CA0016.outlook.office365.com
 (2603:10b6:610:1f1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:04 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size must
 be page aligned
Date: Fri, 14 Nov 2025 17:30:43 -0600
Message-ID: <20251114233045.2512853-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114233045.2512853-1-ttabi@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faac296-aa69-4cbf-ce4d-08de23d5eba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zrm5tRrJp+mOmmRuGRpsMfTl1wrV3q0ELFn026PqHBqlcu/asXyO7LxABg8k?=
 =?us-ascii?Q?AdW9kTJmyiva0B+DOwJWb8XM3vxYhnLKWRF5IS3bH0744WARiJlH4UHEv9iO?=
 =?us-ascii?Q?+uhl0BsBaRPzz3BQrxkeJpQuPsmifgw5DTXJ9pmvr+DzUNuE1eSSh7NTbir5?=
 =?us-ascii?Q?d+zdzFHTUCgkrKaZXiJE2RosivtL0+n45xRg62VZE0OWcysbjBtqHFdu87q+?=
 =?us-ascii?Q?PuaQgVOs6Wv/GxRW3UqEh1rcRawVEZV0NVig6GL1/F96NTbhcfIKsMf5Q1KB?=
 =?us-ascii?Q?YX/zA3OviJthK0Ya9+jOpD7kF+Ct9ePDtcweImwex1AUoLLe4eAOa985w4vF?=
 =?us-ascii?Q?4KkZvgcDeHb9Bz0/N+BwbSyLk+cDFCE/wUshe83Pe/+uaAealzs1RZb2e/tW?=
 =?us-ascii?Q?ax8fchfQMYAUkYgeRze56o8p7qSg3yWanp4oX4XCtWzIGx/NYhCiN53cZK8r?=
 =?us-ascii?Q?uGQTX8lRSGhwy3mBGKAZCD/4b3WsluUYdDayBpArq4755SiL7/6KPfnqOcBk?=
 =?us-ascii?Q?PZrQjOMArMwuHfiUh/CSioQiu/CjM99h2ATfQQ19hUoB8FaNAZsefh0jghLr?=
 =?us-ascii?Q?afWgGfapu/vH1GBmFtvpFnKVZTahL3GTVqKn+ovh3P8X6wxgT1A6a2fu+2v+?=
 =?us-ascii?Q?pi4bMXxK8Ml5DTj23SsQwdooLfiTQfNH/bOZRvx5onksR7FehtOgc9G92Lsv?=
 =?us-ascii?Q?4SLQy/Mjb0UipKa7HpBpps4zGs7KWpoENVkGWmUMa16RTGS1D/HVVOyPiNMF?=
 =?us-ascii?Q?47axl9yNXsb8dOP2VuRIkRsGWML2e7KvbhypqjIKe+hlos9r+bsqjkhy1b6A?=
 =?us-ascii?Q?MmG79MB02LWJv7WeUIPgv0gdEmeX2p4njCTrEq+yKz6XOFl7Tl2eGXn1Uetu?=
 =?us-ascii?Q?RJfQs5dS7oPeP7iwn46QsPJS4VLJJInH9wCra0ViFq3TNyeJVAoqSrKv2DeW?=
 =?us-ascii?Q?gMgyxbambFOcpJmkE08xYPrKV4/3gMkfgv33Rqrj7Z0quQsh8xCQZJM1y76x?=
 =?us-ascii?Q?+gI9gvGgX8jvhfW1U4wnTP0wS3x1kukr6caKszgsfip3805hmDUvxecw/o88?=
 =?us-ascii?Q?H/yuOvB/F0GPVum7s5RwhsgxTfQaFQGIdwg0J6Ks9+agRmSVxbXgwmqNn+nY?=
 =?us-ascii?Q?0ulOYwjcVTVAxFb92iMpmA289vDgai/MlkMXQbF/ODy50YrjS7pcGLXCMKZC?=
 =?us-ascii?Q?Ut21uDZD3zyQou67VXfVMH7a6GuHIAvhMwIsOk6wNpjyqGVz1Th8YmhG25C5?=
 =?us-ascii?Q?O6QoL1Wg/jt3IDdRZyzFMPDx3/L8zZ0KtyLF92kGHDEoPzqw/WozP0vNPwub?=
 =?us-ascii?Q?ub5xDIa5Dg5ABFnwD6PfVGXCArZbk9KxA6mtecPnrgDhJbAUwk66Rht/IHLf?=
 =?us-ascii?Q?DYA/yOXSIXvGKnssTYXxJzjSgeFTxwch2+ZcekGcGbdNqbHY2/btWtLUXtsL?=
 =?us-ascii?Q?q9c+8zPg52qbwBhxN9ATPbBnGm+dQZghLV1mFgruRLABZx1kkKCIPN9r0c2L?=
 =?us-ascii?Q?c/Q+clqYtOCIByaYVlQi0E/hdygz8tVzNZWlncx8xLSaHhtZCgq3GCq/gX0V?=
 =?us-ascii?Q?wvXCOwaLGTGVVlaf1Vk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:21.9982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faac296-aa69-4cbf-ce4d-08de23d5eba3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789
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

GSP-RM insists that the 'size' parameter of the
LibosMemoryRegionInitArgument struct be aligned to 4KB.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index cacdfb2d4810..0104395e04d7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -355,7 +355,7 @@ fn id8(name: &str) -> u64 {
         Self(bindings::LibosMemoryRegionInitArgument {
             id8: id8(name),
             pa: obj.dma_handle(),
-            size: num::usize_as_u64(obj.size()),
+            size: num::usize_as_u64(obj.size().next_multiple_of(GSP_PAGE_SIZE)),
             kind: num::u32_into_u8::<
                 { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
             >(),
-- 
2.51.2

