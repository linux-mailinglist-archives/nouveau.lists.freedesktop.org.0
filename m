Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5E9D388EF
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7B510E277;
	Fri, 16 Jan 2026 21:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fH/MIc1M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 11B7144C8A;
	Fri, 16 Jan 2026 21:42:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599732;
 b=kNP8El0zqb+MnouvTBCfQwRC7TbUw9DGyt1COua4tCCIMtAiIGphzL2J/SsI4P/FDeatv
 izPuHukjWuHzek4JZPoAH/dYoOquVE9VtH6m+VID/aOQ4z02SFrh3Y19HV5oW7/eiB5rahk
 OxRh2N+w152/oFuU8VKsX+K8kySyBuSq8RSCdwxnikUY3uBSEoRLzw6qH87DkHGAUnQT8VL
 0jup8BOU3wNYGDTR0VkCtWv2CUxL2ymdNvN13gkLLbshoUl4QjPVeBvbWWHfAdWvd3jdvDU
 RZbs2qBiNscP+LwjhRe2j3BUGvugxwz/MAWVSolk5LL6y6xo/Y+Tt75VpCCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599732; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XYFEgFEGF9ZM5gfQryZ2UH2fuoFtyaFIClmJfSlwaCA=;
 b=c7rRLsLHwW9/alE83Qys03lVdYDHUnRRKaJV82SpTn33XogeSjijvY6rrkd7bCxmf7cRq
 dkbsgnYne7+HkOmx8mu+iAAqGBRatbujYIRRkHyB99zQDKwjqBHzlVkn3NSdkZbddfV044l
 6eopBnYmLbdCmLgXslkDZoBQ0+fjR3r1KOXDgNgDtJIcdpCnraoJDjw8nBa8uHVG8SLOFWP
 OlULqoS7TvSIvbKg4Bw+YttNsAhYuzjrxpVcjQf+sQ+itYUkkGhEF1tyWjqG5XHAGjimJsY
 h6qOehTK0assAe1eLaGXq1T9GIkfl//4nIs8H9G4CHbd358NLnBjK0hcoFVQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B4F5440744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:09 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012051.outbound.protection.outlook.com
 [40.93.195.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDBE710E27C
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbmut/dLsrl79lIvlwB8+WuCvzfgFzUBrWzTA/g587Zc57SBEt6QBNPihXT9bjis1sBgLHMXQyhgWOC0V89okPYxowTur+kiY5gVs/0xDIgqmtMpIA+zAqhK7TsGt31UOnxn3vaxEkRPOqCcMCmMPKJEPCmpEouZxW+fPWEmWRGl6027KVVj0iBOTN+19pbnEMYs0bcmIOgZUAFDKx1ZkNAEr1GquE1PEm+9bkcno1HkNCr1EOv9DmFp4WvzmcWkf9X/hDIu5zoV15tQ8Ipj8kkWuzUqGUu8V1mGfxkhGz6RynZFeYpEe23Xg1z4shQoTS2C53s33g6OrCGmTqZ7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYFEgFEGF9ZM5gfQryZ2UH2fuoFtyaFIClmJfSlwaCA=;
 b=nqTk0EcHx7RIRZxOtYN7qwAff/gzqnp3qDtfGPIT0Y5d7k9VGDfhU51O3fvpjOQh6BkePJYSUkvI7/nCYzZMgJ6JPjuVO8zk9PL+0PopeL2G50P+kht0iNgT0OlvBZ5sdEsX+DybkuKO5xKl8SDNslbjEci78iO/7DmkPaovP88S3lT9h2Qq7wIsQU5ZnAPHtKSLK8Fc6Ep6BIdytdo8GcwF8ZWk9zeBvOixTZeYFH9sikUpytCcwbcdY/xWtnlzcVBMisHjNzdx926Fy6Uwpp9JzWsYupgH9fHtURv/zCUpsD7fWCq6E9lj1iOEfuFSnpHZ6CGwsvMNGhTWAKYAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYFEgFEGF9ZM5gfQryZ2UH2fuoFtyaFIClmJfSlwaCA=;
 b=fH/MIc1MpXzw1hr5PzaKC9nBHCE6s+MDwXYEfc9su3O2VNApmKBil+GZs/K4y1eJes65OCHkVoA000oJKLbZfRnYvTb8WCcvBV24RIXzYoKwXPW/HIPb3+oUKAJuB8MlkQwGGQq379Dk6FnH+WMVZNdqyzj9IW477O9P4L6/bS4+P/f3pMLKONX+1+afzMmhd3yRkdW2VPet27ZHZZZVoxwXvFduPzmcCBv81V2gvlRFd+c9lwTOnetdAeuuW+EII/7QDTSkgR4qxIMJ1rjgaEmePsOv/zZctMlc7banq+Vfl7CCI8Sru0sr7ba3o+g5p22DkkAh4Hymlj97bVtwig==
Received: from SA9PR13CA0125.namprd13.prod.outlook.com (2603:10b6:806:27::10)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:50:41 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::71) by SA9PR13CA0125.outlook.office365.com
 (2603:10b6:806:27::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Fri,
 16 Jan 2026 21:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:20 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 8/8] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Fri, 16 Jan 2026 15:49:59 -0600
Message-ID: <20260116214959.641032-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: 134cb0ae-c60e-4ed8-afd3-08de55494b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xQYTrHbThAZP8Fv2jSzQvl2Bcyg7D5cEB+uX/4Rr/ApfBaomAeKd5Qj+LiFY?=
 =?us-ascii?Q?rG0fDc9crsMbeKljqY707V4TqqcLrDmuDmft96+bgdAOHGLBasfG5Fk46RUE?=
 =?us-ascii?Q?0bQ+OVXK++Ueg+DocB3XPnOpEiYHYqJcWEqt61Z30iZtP0iqyalCb2yTHcDU?=
 =?us-ascii?Q?SmFWRwx+J0Cc8JWhS8O3Hs6oBJwso3+vTa//hn0NEo/DSZyD7YLl7BAZHfKd?=
 =?us-ascii?Q?SBM+6xeAnoge4YRNQV7RjcS03wABLjDIo8pLe3OuKg4gnzFLMBDM/j7SwLso?=
 =?us-ascii?Q?c2xTTO0aKO0koj1tNKnhVB4tkjE1nTc0x5Kuctjlj3btABsWrLN9RtmqlQb1?=
 =?us-ascii?Q?HQ+82+c4SZi92yBSx/v8kDPjbLk0c1tvuiCmUVykg1kwB5YlMSpLfOMfvEEz?=
 =?us-ascii?Q?tXd3kIHse9boAyq58+DLVgxgWsx0ACMRqWnUDhksArLCzWhcjVDfhv/trgE/?=
 =?us-ascii?Q?9PyvvmoYFeFQHMutE/RVPdDSdXaV7/8GdOEKG8PnvpMaxIoh7MzLsMrzePLm?=
 =?us-ascii?Q?qOzaF7AqWJLer9hqLA+/E0XkbzQ8IaK4LqID0ml6c7/zlQQkJtvFPgUpc7uI?=
 =?us-ascii?Q?eL9C5pLgCZNiD5W+oBMhFJZ8Jyf4uKDt9kuH0xwGiPyvIuDVyaMRBCz/98Z3?=
 =?us-ascii?Q?dbmuRrnm+z2ZhrcKPLZa2lO6hcS9nGSuyzwHAYc68Tl2g8HTdwToKPU3cGCJ?=
 =?us-ascii?Q?4JUHQ1mEtF53j4le06tl0tAJuKFsv/ZNsVhqW6BSTj4P9G7d7Luc3+6ZfIOn?=
 =?us-ascii?Q?8Zucq1HoiqS5CG4jYIl05rVNl43JXhCEZEXASas7poXe1/kWp+vNrevz78RK?=
 =?us-ascii?Q?REVCZm2XrjxYt7v2+RPK/P/DIoEDSuxH9/7gZ0muETQ6GI5u76lLJ4LqPUsa?=
 =?us-ascii?Q?GNWeZGhKeFntVsvV13o8NOTMMP99Lb50Uxk/usVhNMWYholIik/u4RhIJZ2s?=
 =?us-ascii?Q?GgeVYFfMaQFW139i4+77z72fw41SPk97Yn8asGbuIu/qogeifG0N/i/LS89h?=
 =?us-ascii?Q?ZK+v/Jr0bUszxQw/krbSn+kZSeoHiFIePdq0JT9hE518VMZycZz+dGiQ4rbq?=
 =?us-ascii?Q?ngS+oStsr7VWO6s6wBQnNdCTkggIRWuAlHSzybcPGMoIZwPukbeOJOh9eGh6?=
 =?us-ascii?Q?FL8dxK957/rzvd2BXuuUoIHK4++/Jspr479Dl3IgAt8/RGxZ/l8EZv4BPcfi?=
 =?us-ascii?Q?bKcZ5S640BzQsFpHWTBzng+bkL+qEFriHMECAToSU0klZhfN2B8kRBFB7hxf?=
 =?us-ascii?Q?HX1dkkgE+MzmI4TQHOMS91/UCkO9DSV3gkQe14WURVqemH3exUUG04py4a+m?=
 =?us-ascii?Q?JevqTyRFo9y1EmEhmqwGCBtkR9Z6/05Y06Q1qfWG6L9VoK1Z/qX2bzfeD7yb?=
 =?us-ascii?Q?w/UjR2g64bzbjRF5IngiY0ME6bpuqvXaAriVSaVtf6e6QUv+oqSnUrZPTnsR?=
 =?us-ascii?Q?E6udzYjLUDQL3M6LjafyFkR3dmP6IOPoMzDxusDe90wIN7eRyVodEqWp4bqp?=
 =?us-ascii?Q?n7sCRyWBykHMXAEGoHWp4X7C+Uceqp3MdkpTJ+FCFBGKrRof0GL5Tqgp8+eF?=
 =?us-ascii?Q?4CZPGBOKrmjCGiet7cWCGS2nT9sVm5pT2umk9ShWtmBAt7XEMFPIR1LAqSSL?=
 =?us-ascii?Q?LXDtthqXKEU7IAZvQlFVtbhYemFGTJEoc7+JyGMA/NMAjK+0yZWZRxwONL9y?=
 =?us-ascii?Q?QDHgvQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:41.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 134cb0ae-c60e-4ed8-afd3-08de55494b07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096
Message-ID-Hash: VOSPWC43TFIFXAWA3WG33KAER4F5XZ3M
X-Message-ID-Hash: VOSPWC43TFIFXAWA3WG33KAER4F5XZ3M
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VOSPWC43TFIFXAWA3WG33KAER4F5XZ3M/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-9-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 45 +++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 273327c33aa7..4b194bb805b4 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    c_str,
     debugfs,
     device,
     dma::{
@@ -101,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
-/// GSP runtime data.
-#[pin_data]
-pub(crate) struct Gsp {
-    /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+/// Log buffers used by GSP-RM for debug logging.
+struct LogBuffers {
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Log buffers, optionally exposed via debugfs.
+    #[pin]
+    logs: debugfs::Scope<LogBuffers>,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
@@ -163,15 +171,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            // Create log buffers before try_pin_init! so they're accessible throughout
+            let loginit = LogBuffer::new(dev)?;
+            let logintr = LogBuffer::new(dev)?;
+            let logrm = LogBuffer::new(dev)?;
+
             Ok(try_pin_init!(Self {
                 libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
                     dev,
                     GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
                     GFP_KERNEL | __GFP_ZERO,
                 )?,
-                loginit: LogBuffer::new(dev)?,
-                logintr: LogBuffer::new(dev)?,
-                logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
                 rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
                     dev,
@@ -192,6 +202,25 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
+                logs <- {
+                    let log_buffers = LogBuffers {
+                        loginit,
+                        logintr,
+                        logrm,
+                    };
+
+                    #[allow(static_mut_refs)]
+                    // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is
+                    // safe to create a shared reference to it.
+                    let debugfs_root = unsafe { crate::DEBUGFS_ROOT.as_ref() }
+                        .unwrap_or_else(|| debugfs::Dir::empty());
+
+                    debugfs_root.scope(log_buffers, dev.name(), |logs, dir| {
+                        dir.read_binary_file(c_str!("loginit"), &logs.loginit);
+                        dir.read_binary_file(c_str!("logintr"), &logs.logintr);
+                        dir.read_binary_file(c_str!("logrm"), &logs.logrm);
+                    })
+                },
             }))
         })
     }
-- 
2.52.0

