Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D73CB9D08
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1310E964;
	Fri, 12 Dec 2025 20:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YirfsENC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B1C10E963
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLPugT779SkKxd+hwGBZNQGbinlE17yUCBjQGliYd2iPyfmJQx6JbBA79wYLisxnXiKSpJZwreDRG0LjvWcetzqjsOeTl4UVq+QadtjnbLthRwGWPPMDLxVPARZImTlJfH/vrzqgkzNpGUNebH9v1MPJfgo3fE4yTUv/6dgwtiB7au8PTHkxCPdJcijQ5fIBIl+FDeFjC5ZGio+1KoIamA14EVb7Rxmg2SD9z7l1KdtpIe/xeu0TQdrQya79LCvPHouqjm4Fx/dU7VrETYKJdLyz1tM8C16nQBBZYdAGdXcaKE3JgHvL0gTAHiIgO8HGDQv4InilpE1Z3UMTuMA2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lviXF/4HDxSL242p6Adx5nmtKWX8jBpxBhVtLzmXeLI=;
 b=ywS+9YLnyPdvVXj37wKCwqszs4tOXe9PmDrPoX1mqCE7Fw+XD/5FGjJW5HrbBMiHxfp2xyctYFgr/IfmYaUlk+O3lIR/SRvY26c0s4lRvx/V3Io3qLmgW8dp9PNgZRaDHRsXi2N7mn+DrUWAxVoYLu6e3jeLYJ5tT5YegLMqQGRJR0IRQszfE/oiOg+KsZh5QpJq1crrCkokXMV98nzSFQ5VAF/7/w+5j+P6DKM/Ycf5mw5hiWaaLBx4S4dzXBk3OSpt+7ZdPrCRQvg5O/Y6IPnP9DKTW7dBdf4HBISQ9Ni71D+pi9XGYMp8pCSAVa8V2YYeegpKcf8nHgQIrd6MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lviXF/4HDxSL242p6Adx5nmtKWX8jBpxBhVtLzmXeLI=;
 b=YirfsENC/mF+y+8xvLz7/bR5mad+MvH7c/I7UNmvZGGPLcdEffbpjKDN6z0Hf9DcRHLXt4hLZ/NuE8o26MArJo5jXFhH6KxpDpHl7SrM3sR7T+CL4m6HvL2TushP08sALFQGPLWOG3pKu/xEJtxAQZ1nU4WbkNRtxvqPOWJlE5JXqygu4jl4COrjuP3isgc0Or8I34inD+WF9o7rdpp4yN7niuLr6Mr2ciob477gnlvE4Uatdaj+LBxvRhdw5CV9CwtCyLg0ZRThpojZPwR+jbNSW+BwFrmHS9Nn9TM5Ksm4vDaKxYWUMX4jhA22ldQ1UMRWtGYdmqWftid2QkeJxQ==
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 12 Dec
 2025 20:50:28 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::91) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 20:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:06 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init closure
Date: Fri, 12 Dec 2025 14:49:48 -0600
Message-ID: <20251212204952.3690244-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab9e724-beb9-44f6-c42f-08de39c014c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vFEBF9WmvWIaI1jR1idzK6nFiwyfWThOQwCPAVzad88uTarUQNOXWuOyGQCX?=
 =?us-ascii?Q?ACnyFf2bUOMPHe3Df1XE8bf9+p+G51CvJ1yxU6MFt/8g1DaZGhQYD527ziJt?=
 =?us-ascii?Q?yJhUgXxYnZQPS+wUJKlc0ui9PNOBIz11BUc45Wj98jrD6LyPiH1PQ+YUcIrI?=
 =?us-ascii?Q?d+PZETXdYwCqdaXRcoJp58i6Odr8MOKLzxyF2vThWwIO58MpuKbN/DJ54ZOl?=
 =?us-ascii?Q?/8W1EPAk6A4DohI3LUugx+W8qI+O7FZY5/8FLoS5zhinNk2xkLziI3IH3RNV?=
 =?us-ascii?Q?E8HDywyiIjvGHyohfbap4cRC4XOJcoP/9D+cPJU8d3KOG4w6sWlhqfJ8Oxh5?=
 =?us-ascii?Q?gMnFWt2d2J9XJl+Gt2YI/UnM0iKROyTQn+e9WZclvoJuY/sIk2LS22+viXPg?=
 =?us-ascii?Q?YqErxfoL2GLspNwwfnQIwWy7DUcbUxLilDckRcTBr7c4yoFvBY8/jYMa3YAX?=
 =?us-ascii?Q?MkvipdSq9sOxInmsm6XbznDher/2huXHv2gC1M5RdF0LZLji+rOuOSuwFdgo?=
 =?us-ascii?Q?S0z2VTbe6WhY3+AdiYi/OGMQ9LM5r8QlsRcuPjjHFm6l/KrtrZkY1ukoEn+v?=
 =?us-ascii?Q?kNKxGVSmO1FwpHX8EEgq5mnVWUPM8I0eHufyO4gxxxJU75oe//5Nbm4onPhk?=
 =?us-ascii?Q?78q+eZT+OT/FTDk2kIrcgrKOLvsGZ7/UKe65s3E2ElWM3ARm5BhpBReoLQ9C?=
 =?us-ascii?Q?Ev/imEPqrRjo9NZiY+LvoWHPKdo8uaQpxvXDwDxDeQTK2d0y7yjSYhtiQFlG?=
 =?us-ascii?Q?m00Jg3J3huhv8N2YBBeD8qVsw0LjaTUvNaqxj4//HJOyvdfKz+gokGjK9qak?=
 =?us-ascii?Q?CFDJPx7SdTv3kZ0jmPDBEmMuUAp0CVESrSoncnRvIMEVGAT2FDnIb5q2huO8?=
 =?us-ascii?Q?5hzwFkwqqKNxRuQuxPbkDBtfJkTa52QLRsyVHSwoqcX4VBBgLjBxpU+5C5+X?=
 =?us-ascii?Q?XrdreOoUiguTr6cmXugYVZIwFoQ0aOSYW4+ueCG+7C9Apxx5j4SBAiDRRRo+?=
 =?us-ascii?Q?9B8a3RTP4oWSqFJsgIposoDN3TT2UqguwyUAhHRKh376M/kY+EvNvHHM2lf9?=
 =?us-ascii?Q?t8xXGOhLRDvnDfmJ8YLkceKausTTIFZcQKqD9XFrSChD906fBBWG3Tr6yeIy?=
 =?us-ascii?Q?r4CNspo3n+nKRIEchva9fWsTVTcU+YgfOqlnAa2Ho3Aosf/V6aEZImeVIBs0?=
 =?us-ascii?Q?ycdEYKeu/H08YH86YkvUkeiFfF6dXTB4MZBoUYfNCA24XzVRRWvQ7Bog2IVZ?=
 =?us-ascii?Q?Te/Yu4o/J89eUi1k4TsaUWqbjy1rWFXIlkuKmUBdPkL2OdfwABmizjOSoIgD?=
 =?us-ascii?Q?IlZ77NadbC3RnSsWb1yR1GxVIXGGNQgHYTvX3h62t2Jw3lokkT4oCH+oCUF/?=
 =?us-ascii?Q?l9VBjUTMhVUNdE426OMi2ltijBHcjgdQNSvLg82yWXwm7G+DUGtUo+8PYA8N?=
 =?us-ascii?Q?iJQVwO1/f9XVH1RxhRg+buxuancMDjCk5znrBE67+7Cn/l7hctvYhdy5ICLe?=
 =?us-ascii?Q?xvEb9jexax7X8NNU+0Kpueegz3rlKbNxT2ekj/UBZTZiS4AkANL+gTItpDXz?=
 =?us-ascii?Q?/JrXnAadiM7lGT74CTw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:27.7088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab9e724-beb9-44f6-c42f-08de39c014c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 7d7b75650b04..591edede4376 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,7 +2,7 @@
 
 //! Nova Core GPU Driver
 
-use kernel::{error::Error, pci, prelude::*, InPlaceModule};
+use kernel::{error::Error, pci, prelude::*, InPlaceModule, debugfs::Dir};
 use pin_init::{PinInit, pinned_drop};
 
 #[macro_use]
@@ -24,6 +24,8 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
+static mut DEBUGFS_ROOT: Option<Dir> = None;
+
 #[pin_data(PinnedDrop)]
 struct NovaCoreModule {
     #[pin]
@@ -33,6 +35,13 @@ struct NovaCoreModule {
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("NovaCore GPU driver loaded\n");
+
+        let dir = Dir::new(kernel::c_str!("nova_core"));
+
+        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
+        // `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = Some(dir) };
+
         try_pin_init!(Self {
             _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
         })
@@ -42,6 +51,9 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
 #[pinned_drop]
 impl PinnedDrop for NovaCoreModule {
     fn drop(self: Pin<&mut Self>) {
+        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
+        // `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = None };
     }
 }
 
-- 
2.52.0

