Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9FD1EF0C
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEC1D10E62F;
	Wed, 14 Jan 2026 12:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MCkFYjZv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CBDD044CAD;
	Wed, 14 Jan 2026 12:51:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395086;
 b=tjdIe+oLqayfL8yUk4PQTqOcDmpye6kCZ247KQqQu76YAl3RPkQOJXPZGC2UOcN6Dnow7
 A8FuJ+W7xIKgb811bdvDSX2H+HTpONCbHiVwOJDIGyDf4MFnySqIWaq2EumD+PW7HDlqHhZ
 2KrBIIbbFF/KJdm9Syo31blk/B5Z4cdePnT72kESUvnSmxS8BsUhdb+8zq6Xz3kgjYuRVzN
 5LxW+zQNsnqpYhbPhmlF//JwV1t8Bigm8FuAd1y2japhurRAFhVu4BIUxczyziDZHaOgZTw
 MZ+lNKNmMyQm9mghfxM5WzvQ0wKJG+gGRGO/xn1A9TfUelxHjcqgcLySbjTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395086; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=02Q0Qju+6e3FF/2a9WWHhluAjRgyga7UQEYrvBVnvEw=;
 b=HqgN3BFrCAooKhEhuRJbwgfd/fKDfN1C5eOfpHVyGmaiVlEKcuj3qAPYGbzH+tITDoQi/
 jyzWj3pRM2tqzL1Ky+/MtJPm84zHNe4ecRS83/Te5yzx8E34Wx5cje9HqbCxE1ANjpYqjA2
 7T3LpLMSAOaOMcQcEbtXeoTLIX4dAQynktevVKJKXfjnAk8s+HB1+xhF0Q9s9+zR1aaojgG
 zAWFOsk7r/SS+4lxYfYJAhThloSus1AD+GygQbdvcx7UPYdr1IKetxn6wnKzq3HAQhUz/j5
 iK2zs8FyCcj1HYeukUSrZIovJQu6hw3q4ImeVGUV1o0fsHGAuJhHMQYA6nkA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A88E144C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:21 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B558A10E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuvgI7cLTgloXPg0MDubfUeEf3V3qJpy5N99HVhQYwMXqyQeXIAf4ygZHnTtr2sWlZHAzFNZvzJCrrQ21mr9Dvc2du1OOWSrBnLK+whvgSok+h/sLEKBk7NUQghEcLNhgxXoEO44l5/YoIUItaYxcTmbGrGlihi7Uq5FtlB3/l8XwZBSQuegW2Vwqu29uFAYRhBIKPsWnsPBpHwA0syJOk04hnUzayR++jAiw3gstx0nVAjeN+NAUu88M9w2e6YRB83t3WSZ9v6Z8Ppgj0kISW3p1RYxrYkn3mAmjktPHBEQYp/ZAVogYm4NadtNdSazbCJceQt8mn1awz444NvbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02Q0Qju+6e3FF/2a9WWHhluAjRgyga7UQEYrvBVnvEw=;
 b=d1rpPoazmi6RsqqOo5nvJ6FUqOq4VYXOUJLnKrRR6zUe3x3AjqreFusjst0QFfBQ/yxHEEa78eijn4WhLvAQWzqJ3mT91r3ldHAGMGbYldpof2taryIv+Ni582wjipwaS+8/9VJnA3FYB71fWHHs/jHl0T+2+rP4pNh44+tQHTpr3EbP7MJsqTCkCGoUFw6E31N1ZiJABaOhKiYKhLy6Dl5Jy2Z50IIrxVBdXlmi3LrwwI1ZL77Bnp9a8tu7kjWVTAtodTVMhJKmyt9MmxnJek8fzCHvhieG+SN8amFKzCRTr8X1oUtEoluu0e5fVQ0+tAnvqt8ID1LvmKnMLShwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Q0Qju+6e3FF/2a9WWHhluAjRgyga7UQEYrvBVnvEw=;
 b=MCkFYjZvPB3pzCmbVheaT9mGjUCYRrj8DqE0hWTZSmZ1JjCzVoyj8Z4Wf4xfVAor4O8J16hUHv9kFkBMm1xcd/dMq9od6pd3In4Zp/CDbf/ztfIw0K/VDB+GgixJCLEymDaLhafHTexvZS1VFWUa9NHyqeF6OrxfzXOOrLFhi+RkJmx53CRRI9f7tI3f1MF/bt000aM1iyn1OWPTPZojNlHXpvAjp+6/yBjsVFwstN8t/bTNCp8aFq5SDBiaa6WtnjN4PwHD8yqMdhJNOQOXxEx3c5KC8mSTVvQZ9OnEBHt7u85Av92EEsOGC2FOy4GT+WQbzucp4n0Z9tFpK2F9oQ==
Received: from BL1P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::28)
 by CY3PR12MB9631.namprd12.prod.outlook.com (2603:10b6:930:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:54:41 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::72) by BL1P221CA0008.outlook.office365.com
 (2603:10b6:208:2c5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 22:54:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:25 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:24 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 9/9] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Tue, 13 Jan 2026 16:54:08 -0600
Message-ID: <20260113225408.671252-10-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|CY3PR12MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: ff34e37b-1a9c-4d25-fffd-08de52f6bcba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n3D7fncRxM0evkxgG7Cpp5GR5GV7jX74hy9IBgpXh7d72crovGiaYRocsVs8?=
 =?us-ascii?Q?XYEyZwzCpYxJNK/+QdYsvQoCZIJfa4WFrF41JitYf14+BVveSDc1inL79qLC?=
 =?us-ascii?Q?p1CQEpOfUkxJMzs7Z5eI36XSbnI89wOOkOJhd0pQhmE56Eg/WNjW5iqPhR5d?=
 =?us-ascii?Q?WuS8SwoycYArEUhDxTUcrAIu9/tvPaZHIyZW+/FiCWdDMKM+4x4UFuGEGr/a?=
 =?us-ascii?Q?rpXEuEkluVSKcCSoS4u17iSU3OyyD1QEksXp/v0cjFjauMc/81uZ3K8XELqC?=
 =?us-ascii?Q?ppOaR83UIZWjaPVDILjGquZ7IVscNOmPk6cObl8EApyb2xXXtMmdJoqri4Dl?=
 =?us-ascii?Q?pe3i3Brm+nvaIA60FWOQhFNmdZ5nx5Tg1ibEG+xHVyuov48xduChbP0nqwAe?=
 =?us-ascii?Q?iFORPapTZGtumBt9PVHPS0oa7GUN2MDbTbpaRPINN3tKP/SafKim6DR3s3yk?=
 =?us-ascii?Q?68sr2s2CYXh982v5MT1+3dBMUPM/3W/KYHbp5kCG86HOmTnlEqe3vOxiwXHK?=
 =?us-ascii?Q?MvmLYZ23yHzkBqam5ONiXW7sPJI2tC6bUyF7S+5FXLj/RY3fyP6Oz5XCEJLW?=
 =?us-ascii?Q?P0IpchBIj6mFxgPn04hS5ZSiotyVzaPj3X/XUuwVrc34gm7jbHRsEh2xYvTR?=
 =?us-ascii?Q?ZoGz4Ulwx/yioVTwdaUI4QH+0QuhK/vHfLyJXPcXbOuR7Ebcg4mIfRvrvjZq?=
 =?us-ascii?Q?EkOEsNXDToZs7U5Wi13EhCqkhXFS2NmggIaX6dN7W8z+T1arBfCYrNibqQas?=
 =?us-ascii?Q?NBkgz17UARZjZpSSVj2NQYrMIJDT+S/Ve7YKSiiNFzlJLbdeUxrCm8eDKaVp?=
 =?us-ascii?Q?WSNllQKXr4zHE2f/qR21IBrNoVmxGocGhVJy8KSonueHIznoRDjepugnD9bk?=
 =?us-ascii?Q?ZOYtvn26RLGnfIiIHGbCTH2Kl9TNuVhhWDqI4T09nIr+u6vjEuSslppHtR7u?=
 =?us-ascii?Q?q1cyQHKhtGbTJEeZ5vEzIZJmxHLQRy5wfMpCe2/PbrHQq008RSdPgziwtCIG?=
 =?us-ascii?Q?hHjUcBrA2xfUx6N1mjh+glaYnWjBg3eOb+nw9U4vP1/BIp24mJY9vlmYl/52?=
 =?us-ascii?Q?F7bP5Xis0aGsB9D0vEg6yBSuWYQNHH2eYaFurAjXvGnidqCtL0Doj5Tg2YpT?=
 =?us-ascii?Q?svEGOOBGx+dGHPpxHgmC5ZibgJq6zj214dg0vitk0V9E+jIlKuxLBs7MHZgO?=
 =?us-ascii?Q?JltLwaMoEgxYBj5AnltJcdrPN10yRtyhpAaEscPXMQHKINSgHvdNMb0XE3pl?=
 =?us-ascii?Q?SFw6CqwFnZA6TRs1x1GOGp3vZwHCqacGLd4SepcGIN7BKNQeQAAmUyiQK5tP?=
 =?us-ascii?Q?DXroApbqfu0ulbopVSL6L7br+KWRKkicpWsF9U2v9+Ly7izTeGoxvEOrg0T+?=
 =?us-ascii?Q?QRycV3K3iBiftI2kVPtJIHhgSnwsvucwPJOcAsJmIFlNIEzluzay+oCowbU7?=
 =?us-ascii?Q?ijCAzg/VhhpnnpQ+/GY2BEBs1YHAbms5NBobP1Cg2ArtFECCp69trcm8xLkv?=
 =?us-ascii?Q?UkBHKOuJokD17V9tynGQAmMJ39B3lEO0NqCJxe8TR6UhtUej3QbjTcs1/+JZ?=
 =?us-ascii?Q?M4iGZOQOHWM1U5i9wLY=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:41.3178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff34e37b-1a9c-4d25-fffd-08de52f6bcba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9631
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NRZTPD6GICWBC4GHT5CGIX65JDLLENEK
X-Message-ID-Hash: NRZTPD6GICWBC4GHT5CGIX65JDLLENEK
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NRZTPD6GICWBC4GHT5CGIX65JDLLENEK/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-10-ttabi@nvidia.com/>
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
 drivers/gpu/nova-core/gsp.rs | 46 +++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 9b73c96fbd3a..dc4a009862ef 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,7 +3,8 @@
 mod boot;
 
 use kernel::{
-    debugfs,
+    c_str,
+    debugfs::{self, Directory},
     device,
     dma::{
         CoherentAllocation,
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
@@ -147,15 +155,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
@@ -176,6 +186,24 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
+                    // Look up nova_core debugfs directory - only create entries if it exists.
+                    // If nova_core doesn't exist, debugfs_dir will be empty and file creation
+                    // becomes a no-op (data is still stored, just not exposed via debugfs).
+                    let debugfs_dir = debugfs::LookupDir::new(c_str!("nova_core"));
+
+                    debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
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

