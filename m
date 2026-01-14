Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DAD210AF
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86E10E69C;
	Wed, 14 Jan 2026 19:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BOPFhXzf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E96B644CAF;
	Wed, 14 Jan 2026 19:22:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418529;
 b=p+HmzybVLFbsWRM/22UnIT2/nnjEF8zdu8wDSswN+UKlzjypewL8L+2ShDyOx7TJb8FRZ
 lvaK1ibqpNw/+YbaWHFYwaRHJZv2OaT2FAnH7pYSttpe7zATNdYN4HNDVIdZEij2p3O9JV/
 QnEagzTDdQ8VQ5MzGCpQRhgbMcWwXi4dK3lIpI9prekljSXvvuPaTuI997oZ1YEJRpsWh5q
 GvmTfePSXKhtghAdiV4LL5AMaHdcHUR3TN8042julYxg+ny4sroIXjGToXo74ChF4UMawIS
 dfxrpwSCgGBN02WdxJnoajJ+T1QrSkkmVO+tGLVKsJWTerHYlgtSFUTu3QTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418529; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+GhiQk2iN6BV6SF3yZ8yhVxVt7M37ob+tNGEjVw+fe8=;
 b=N38sakiIfom0tK7xNXr+KphxtRCtqb8RqPQjM91+WzQL4bE/pEdEKNiS0mXlvlxywAsoZ
 z31FIyAzBFgOody2j+KhbiVVw9Mrg0xlfmdZ1omFYO8Kat8yeY9N4qvUOzJCvBroFqsGZTq
 fDLVTE5litNavMzBFqanG9soGwW+qu85w4XOSVf6sEAdL8sjUQ7YxQ1xLhN/rtLaehqholL
 +Wc0aL3Qo8iYdDK1isU/619KK0hkb575o7E67Y0Zt54PKsCk9t9Zx6tW5n8f6NgFCboitiP
 hcITJptwoXMmQM7Lr7/VtKx27R3TKgBb0SRacoOp6dXrVUlN/AHgiHjbuAYQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 49A8044CAF
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:06 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A882810E68C
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKW2H/WQ5sFSkiZG+S13Rd1QJ2M8+QCnVisSONh6bH+GYUS+1khTj6fZoJ23LTjfV4LeTah3XQsMT0889El9C2umCSMzaofpKbEUMfFqNwJXPGWYpS3JRPs51N1oFvPgbkz1BsRoliHtccq9eHyb9jubCAc+dEz1zN6U2eJKkGOr2hQldQ3Crl+Lxw8+b6/OXQS40JoouDEb719653F38VLPqgkfvKC1k8914zbd+BeUpC3vDC9RJWDkpxpHJVT06BNLB4xm1nHq2IiHGBpq1+Cg1YwGgwILFp0wwM5l1+sPsR+xxYoCOV9NyNG4cPbrGJvMX6tQEBcJa/2B60qSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GhiQk2iN6BV6SF3yZ8yhVxVt7M37ob+tNGEjVw+fe8=;
 b=ACIO+EGsuxmBlxHfpWu6weebJGgxAsKdxJHmcK23j0zmD60jSRoikWBHcie7alTdnK5nToZCqun2bgCi5WfHhcP2bPhI43PzcnzEJljyrXSUm51coGPubDpc2t2tfD4Jzb/YjB0V9JuvzbcYCJqvBgtXOA82ETO/Lxc2THMXdZ0KPJ6I5Ot6ku4TYXRld4XlOkTYnZdKXUcFyLFotvQtlZdaErM6jfbmv5OiJa3rb2fjW+MUBD4uoFRE2IVMt/Qz+BsW1hjIcyRyuz1K44Kgr3etfAnIzs0k9sCkIWRAEDcFxLNGVWVLV4oc2g1ixh7pqNYRzn2geIwcRwb5QAXZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GhiQk2iN6BV6SF3yZ8yhVxVt7M37ob+tNGEjVw+fe8=;
 b=BOPFhXzf1rhJcrZd4G3GCflOoKvyDfKNqXGp2b8Ct8k7AnotcEomr4wrAEyuV83muyD4lzKjAlprEM9imIOkzOYv3jzi1mONbYaA7Oy5C99etBi0ePdf8QgJkbM6I5S0KjBPEu9fwg5OAsxLLYgvQEJBniP9cnRmySWItmRi6lI1jyS8oUB+eXJgXmFbxsbraA5vFaU0mVaawo2IDfyMoTFC8itwu+znBLi9KgOHjNL3xnLbfiH3ZcL4rHuUD27/SvJj3qIsMkaycLGrEUWK/RVk9gh4mMpgq+i9lWDQo1XRn7Lq7siHAhxdxA6OrURlUZeo9whQxGn8UQ7dWU0/XQ==
Received: from MN2PR06CA0015.namprd06.prod.outlook.com (2603:10b6:208:23d::20)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:32 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::27) by MN2PR06CA0015.outlook.office365.com
 (2603:10b6:208:23d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 19:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:30:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:08 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 10/11] gpu: nova-core: align LibosMemoryRegionInitArgument
 size to page size
Date: Wed, 14 Jan 2026 13:29:49 -0600
Message-ID: <20260114192950.1143002-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 7568a0bc-99a2-404d-20e2-08de53a360e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5rkVtGBcXt2SzYnRbtsdYDQCjNixmuoIVVnM4sA8hKyWqZK8pyfY5B0qFvb/?=
 =?us-ascii?Q?8rtZPLgXRxzwgchySziUM98BsepDvxW923FyZmoxyUS3IMK1ofWrMkq/lbH9?=
 =?us-ascii?Q?90x60AVg4b1n1zWmGWAVg1ob/GtnhOCsJuGbG/gJreqaN41QfN1HdTAIyrQg?=
 =?us-ascii?Q?4R56I455GyGhit3kBDuZi8Je1lnjMaW/RLH7MqokvyMIirFikmQyQwzkRdhQ?=
 =?us-ascii?Q?dGyEkNLYH8dVNFvNxRhmDUnPMpBZ8GlFENyYdrKIgeFaQIpHrXeG3pH0ilWA?=
 =?us-ascii?Q?W1rGmtAlZ+2uMqg37H6XSXcbM4cIYyxNJk/lbkWDg9nW6ktZ8FYsISN0Nhor?=
 =?us-ascii?Q?CphpgEU0VlHRAH1bMvrtmJPLPmU4i/PLfIs+2vYOz9dzzpEWvqcWyc7YlSHN?=
 =?us-ascii?Q?pXnnAUxpbcj5oG6ZtPWOhICqSUX/jKb+noEUQvoKbrSCoj4VYBGaNyNsUmRZ?=
 =?us-ascii?Q?7HNhZ1QHW+FfVug9SplOqT10CHgKMqIww2NW2Bgm8viqSyGBcjY2dGHNcVLV?=
 =?us-ascii?Q?rYN30jDv3DDClLkVlmDvnPvU2PqkW5QVIN8fpIz2xgTMCfgngsikLAQ4ktWl?=
 =?us-ascii?Q?7HJYgzA5B3x1w3uA6rmMYXrOa0IoBLRclARFlZ3nsq+5UEf0GgeO+Khyb8Jm?=
 =?us-ascii?Q?oTibb9WPKgQ3WNgf1rRBstmnFZVldPofDQJC5VOvTho6eBWELpQc0z0p4nEC?=
 =?us-ascii?Q?5pMk44i2iy6hVA81rXGGO6tUht5ugEL97OveSdWdSDnY2RVe/mEsJsEMxGLH?=
 =?us-ascii?Q?TT0j2p0O/H5OXMKQUpCsg+OTYoICIkFFxO4xE/cyeIrKDtVLc6Gxrff4Qto+?=
 =?us-ascii?Q?Z5rQ/yWgmGmn3JLWaDHfweb2/bivTodxgK69joa68xTeLNznoYHNsVVU3nU9?=
 =?us-ascii?Q?3lWwiBb+WPxXQZkuDpfRmK7ZfPZhfa1fXazGGk20QsXOiNZvtde0IUXAX8BX?=
 =?us-ascii?Q?xDTxpaTTIPeFBFvg4XCwN6NhuUEJIg7eyh268iKfIdkSRyq1/pbdw64oiVEZ?=
 =?us-ascii?Q?PEd98VDIPajfiqxMiZhuACONjY6qjRZoOhZxXl7q5qlB4liQc+Hs7zkXgDKN?=
 =?us-ascii?Q?SNMV1aeBOQj8OZaY0JlJ1TXAxdCJsmymSTZLjBIy3uBeotq2ZHu/I9cbRxNl?=
 =?us-ascii?Q?3OI5r9EncHV37wTpOTAaURMzK4xz3j1q9ywYSXZAASz2KArcIj9mVNVGnBrT?=
 =?us-ascii?Q?TfhX7C72Wkdrw2dRKsZGMxUsn5wiOYDoBj/+CLUtea4qYhs4CvVvcSBGXk6I?=
 =?us-ascii?Q?uzmMJYQDFycstWA+0uVVt5K3yOsw3UNcHYzZ37a5pI6eZDefdudH2j82Wtcr?=
 =?us-ascii?Q?J9+ekS6DwmCWUGEm7tatdN32f5Kh+V7Lb2s3exMm7Yh+n4Yp9jIyI33kTlqy?=
 =?us-ascii?Q?Uhl1YlUA7X1bjGyV/HJtCcyWup8Bf2oFs83lzP1jHmBzeDZ/nW+T7/vNpLOI?=
 =?us-ascii?Q?kYMzobFlwcAOgjk1iLCFzzGZzDEoxW6Md01CZbdIzjjJTjdYurfRg0N1pQh8?=
 =?us-ascii?Q?xvoOZdZN2k8x8vAOhsdSye0ZGUHeOtl1HLpphUk1ZAj9uqusMVlEY85vFZZg?=
 =?us-ascii?Q?IKR/eJXXjFdZkHPz1v1XK87itgKdbUv8OE/Lx2UWUczhifDyVr12ZhWxbniS?=
 =?us-ascii?Q?D1N2Xbtn1IslW7GTHjQmdht1cKHXUIPYE/Z3SK74FqfqO1yjU3lgGtJi5laI?=
 =?us-ascii?Q?4anAZg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:30.1579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7568a0bc-99a2-404d-20e2-08de53a360e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
Message-ID-Hash: UHBSMVKALU44TQJQPXSKZNKIKMJLPQY2
X-Message-ID-Hash: UHBSMVKALU44TQJQPXSKZNKIKMJLPQY2
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UHBSMVKALU44TQJQPXSKZNKIKMJLPQY2/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-11-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Alexandre Courbot <acourbot@nvidia.com>

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs    |  8 ++++----
 drivers/gpu/nova-core/gsp/fw.rs | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 766fd9905358..bcf6ce18a4a1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,7 +27,7 @@
 use crate::{
     gsp::cmdq::Cmdq,
     gsp::fw::{
-        GspArgumentsCached,
+        GspArgumentsAligned,
         LibosMemoryRegionInitArgument, //
     },
     num,
@@ -114,7 +114,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentAllocation<GspArgumentsAligned>,
 }
 
 impl Gsp {
@@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
-                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc_coherent(
                     dev,
                     1,
                     GFP_KERNEL | __GFP_ZERO,
@@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..15ca9c183ae1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -906,9 +906,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsCached {}
 
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsAligned {
+    pub(crate) inner: GspArgumentsCached,
+    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsAligned {}
+
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
-unsafe impl FromBytes for GspArgumentsCached {}
+unsafe impl FromBytes for GspArgumentsAligned {}
 
 /// Init arguments for the message queue.
 #[repr(transparent)]
-- 
2.52.0

