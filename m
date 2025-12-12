Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8406CB9CF9
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFBA10E367;
	Fri, 12 Dec 2025 20:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AenZDqyQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C7510E367
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBy20j7ZxHJadRCtwBHLRQpv2V06tyd2d2vQn81oAe9zjKgjgMBHBqPu0YOFlYIYPKaFUfb/TPZIZU4+SSfvsrIcoxziE0fOo3U2RJo0SZxe06dkaiqw9hVpvhbe0EXEMtySp12oF6c6TsHcEx4UiDmuM/EEAP917IIJYMQxgVVZODPEPZ3gP4CbP8dx47p3msUaWetFNe7fTV6wxdFEmfHt4Svl3C0fqmJlZk7LvidMCTOJtL+13K4PYNbMyt/X+TRQuKm8E1/fyCvFGULnxXnvhj9O6M+gGXGbovacoSCIBs57pzXJ8dgasWI4SXqy8HWMYpdZPNU9mKUBlXeIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMX22OEnCWZ8eq0PrR+heBOjVjb6hgKUURVDqVAx87o=;
 b=rVa/F9/5bTEFPfh+s7OOKciBQ3af2aDk+p2cDSvGoZxwOerJ4basvrVboGOUsl7YdZ2ffaJtxr/TFRX7MJXyE/s0FZ0HcCw45Q6qxLU79l5u81LUO5J16vxEOvO2fu6ixtOnaizQ/So0MQo5U7Y8khSqnmnlmjVEQwHtgiUuZkwxYOBba7M/WavCfuBDNFGOfv+6h9pJMppETDrc/WOtu5jys/gefqO8gsdCSPtwnXNbmSwuzEnoj4xjN2cK2bnMg2f9dKC5tcdKyjW08Zut2k00JvrKeeof1FvyUu2N/FbsEo3479RB/nyPrj/frqYhgXH/CYZGWPGDX51WeC/VFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMX22OEnCWZ8eq0PrR+heBOjVjb6hgKUURVDqVAx87o=;
 b=AenZDqyQSELLvWKMyWZAX7y/YVOW2N0edojfiCzSBHu7yYlbccbUEDkxkwUcBjy4Qefd4RCjG0ALxtpzbMP28WO6qIsiub4VSb9EH2gghb59+8j57T/U+C19rKh/Ca5VOV8hVkJOz2XvKTBTSW90Za/UC7T24ROjHUJk5MNgCdxKBx0GKCKzMa2DW/w7wFmKzKAgJkW4kqBj6uX1ZcX/VSZGuUqK9HGyM/ixKnQSBlLVAHOiSEmuDV62NWKBwzn6ifZHaeCBMK6RVvbZELtdbyUebH3Ll1TwMXDAQN701VItBjsmkWlQnomsu3v3a5H8WhfomG4WcQxoP3x4Xl1yIA==
Received: from SA1P222CA0054.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::29)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 20:50:17 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::fa) by SA1P222CA0054.outlook.office365.com
 (2603:10b6:806:2d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 20:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:05 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 2/7] gpu: nova-core: Replace module_pci_driver! with explicit
 module init
Date: Fri, 12 Dec 2025 14:49:47 -0600
Message-ID: <20251212204952.3690244-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212204952.3690244-1-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbfa027-0a3f-41b0-b470-08de39c00e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?et97B19n938VMmfuHHtYQA5H5BYRFPOjfVIreEVSH8icqyEOcM5FTO88YFxy?=
 =?us-ascii?Q?DMoqAn2JaDTsRDMqBOKJBQD0LPcPrMGKNuCtU91g6/xVZ6xbSPgFl8E84Wmm?=
 =?us-ascii?Q?7Uw4IMbq3YyEVDSZYPSVJjg80RcgMvRi22iptNYfujce6PKzbZkU54LtJLHD?=
 =?us-ascii?Q?ixZt9PgnTtcCm8vkeFziIF0lOlEV5UPpU7ViVbYh+VsrfKigENBEujxpasgU?=
 =?us-ascii?Q?uYziklDUnWJGjai2QIMDyTaBvJx5cjR0OBw0P15xO34eas9imS5U07TtSDYj?=
 =?us-ascii?Q?qhA98tuUn2Saia/KolML/NYVxY2xlPfgPgVLiQz3lKJCK4XlU7vfFCmH2FYQ?=
 =?us-ascii?Q?DvtzUaqFQ9jHPldM8nkRUcGO9J1hnDd+EivnaVH5abEbrWFiNeAlmAUzE7fz?=
 =?us-ascii?Q?HeKMQjXPz221nVMCe/FVswitmgwZDnFJmlGJFQCPmQEwCeTYVYLt6sbWxGRu?=
 =?us-ascii?Q?yGHI9KxuM3iKPZoUxoX+8S6rdj4IdkiSq6OJiijLWfdAAA8F3Muh/abloBp9?=
 =?us-ascii?Q?Fs9OrLyOhZNfYHQu5BE9Rs7bwPkJFlGm5E7V6yF+LNtnqT63aX9vubTXo5Dg?=
 =?us-ascii?Q?3yWEYpJBCXZdKLkcpqzr44FlZIhVoERCZ4wXtLgJ3PoY9veN1Qtvz+vMNvKp?=
 =?us-ascii?Q?NYCSpK/AG1wfS64ReJZrQIaBhP8FqoTPBqCMJ0+6KJPAQtQaLBY6V2N5TgQV?=
 =?us-ascii?Q?1FdHWQZTGRmvya+6rdflT2pNlwM1f5LMnaZxG91OdbKU7FpONYXIn1Ju+7ok?=
 =?us-ascii?Q?sq9ZFsK1wXq7NLjrEwCC02P0+2MzSgzP55c5sZVD+8qjatRB/2eIEFig5z9+?=
 =?us-ascii?Q?tjaDmlZ6AGREk/iiNJMhbYhe1UKVbVgXQu4iP7c8quwv6XZlDR5t10QLgumV?=
 =?us-ascii?Q?ZYu8vsNNt97+SmLD0TBDYOLXvDUdIgjCXUjRgccHCOiCFD7sQcR1Y8u7K6rH?=
 =?us-ascii?Q?Qf7Me+t8E4xQHpImMI+rvwR9SOhow2xmvYOEZkDuWbWMo9ndW72LkycPh+bd?=
 =?us-ascii?Q?nPqFi4en0/td9Kbm4kD4svKqDuhw5cPaqZ6EzXDsADkV3hylrMATc64xoyPD?=
 =?us-ascii?Q?mDSi+R4f0ze8X+ZIsO//BbgbD7OpWl2SPN6+jfTrqsL6KW4AXiYjD6cF5Gmn?=
 =?us-ascii?Q?zdvOizo42TML7FdL4U8YIzkwra5p1jlu7IHrdqe/IrhtJnd5VoyFfILV38qt?=
 =?us-ascii?Q?mA+hTc9RIv/ygwwTJpgk2YtDwZ1dptePRJ8KClheyzJCxc/B0GnzBsxKUP1L?=
 =?us-ascii?Q?9gPizbx5a9W7e/L9M9udJ/AfVI1n5GnhcAxqGCb0ZIQ4t4t84O7cDQoF5qJs?=
 =?us-ascii?Q?bVwM6f+FDoDe5VJRZcS1cgyu1aXwZz6MrT49P2tvY39dhq9grHhdt1QJwR6z?=
 =?us-ascii?Q?V0uJYfGvpGrZOhJQcWVgqxRquhGuKkiOKPSh5kA4PS6lI1HNs+qn/ZUGid1B?=
 =?us-ascii?Q?GfGv6g1WSPu6ab3JA2EiDIEweNSUeer9+6j7gfqXMcrzeNfb8nQkhp2AE/wy?=
 =?us-ascii?Q?BbXzFLG5/6n8FaTGEcuuA9NLBWEmdXDs4kpR5vjUhA4Dg/lO0E1TbNwhBcAn?=
 =?us-ascii?Q?LikV2uJu95BmBbcektE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:17.0572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbfa027-0a3f-41b0-b470-08de39c00e71
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723
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

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

Also add a no-op module exit function as a template.

This change is necessary so that we can create a top-level "novacore"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..7d7b75650b04 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,9 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{error::Error, pci, prelude::*, InPlaceModule};
+use pin_init::{PinInit, pinned_drop};
+
 #[macro_use]
 mod bitfield;
 
@@ -21,13 +24,33 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data(PinnedDrop)]
+struct NovaCoreModule {
+    #[pin]
+    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        pr_info!("NovaCore GPU driver loaded\n");
+        try_pin_init!(Self {
+            _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for NovaCoreModule {
+    fn drop(self: Pin<&mut Self>) {
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-    firmware: [],
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.52.0

