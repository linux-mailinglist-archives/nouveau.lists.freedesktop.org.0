Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89ACCA2D0
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C83C10E609;
	Thu, 18 Dec 2025 03:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQMIkPLs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 94E6944B0F;
	Thu, 18 Dec 2025 03:23:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028181;
 b=DM4Ex3JI+vctXHBGQbYY/oP+s0pqn7xRVEv6JvKk6WBS+nn5gm7Y1+n7LE+tV99pT03yW
 Op4Y8jIkAl1DdVLen+1tHvEAYsB3oSVytM9C0p34ieEV7oWu4fC5xccVdvVkzV/8xkma0lx
 sI5+xQ727ErM5MNVFVTIMHkWhfkBeQE/+U8owYMex8TVdfHEbi+tU+DqSTG8EPvJs/dPFXg
 jstYwRsTcFytS/LQcUgAC3eBMKrnqxbHZIeUVXX4B8nxOaut15FtG00CL1A1wgB1QBUZzyA
 YWuyD1NDjEw7q4YkENecut78c+PxxWqq9oEfpTgOHFUZM0s3ws2hLBGaIBHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028181; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=t2JivV81saXOoMXtGiEtRvIF3AcsxlFPbwgEGpnuCgo=;
 b=dIhoWkO1MlVKEOF5V1GhE9mXe/M9mc7Fba+Gpr3/ei1fum7lXsX7PwhO2BfE9z7XM2E7E
 YOmkM3Bh2eafrEVAOFtpMIRlAWAr6mX96hH5XTfJw938s2fXgCqh5aNjFCL+yi2eE81LkRN
 PsPngHVUS+9ZU6OH2nuP04ndOtFiHPa9/pReM/Fwk2xqM5tutG2E3TuJUG8LfS0lN3RJd0N
 +gdP272CxaKzfMvGSXwTuL3Nb6JlWgkww1IoSYawvfpRIdk0YjKEga2rrY5zRqI2AU9KkR4
 XWzTI9yuVyOgl6Xe7D7EhSuc8nGyK9yCd3oI77L9CoaAwOwvMsU6E5Vd+Vdg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D2BBB44B0B
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:22:58 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011029.outbound.protection.outlook.com
 [40.93.194.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0716910E4E9
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXoH9KO2qKo1alGCZnhsS00V9OiOrAbLBT4t8mR7HggZSKJbTSLMIbUPLPzIA+fls269SiyMbOWFPckLN0mZuX3lgbUbekzz1ng/FVCHDVLW7lx9weH8zegEugwm/DSHV5+1S+D5NdYYsZMRwOtk27u0oQphq18+EmvivZBe35EjVVd/nbAmWKntxGHhzA6148hRMNzVhbu2Q1TXaLMwwmkmuhZCPF1yg6EfLaCk3lddFSQlPaAoWJRyc2j+o7hHatpLIYX3o22FWQZZtBQpc0bSBYptffBXL2M0ujRFmCGq1cJc6ELRTa+/kTLc89Ge447TxQaSX2RMLlV6QIw3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2JivV81saXOoMXtGiEtRvIF3AcsxlFPbwgEGpnuCgo=;
 b=pyDB4DC8orwDXpguZKp35PNx8kGOlFbE4VfKlMh/MUnvmsWrr5JujDpOvOAXsxWxgADC/sHgjV9+yYnzsUKy+2wJSGoqFJ3Ogrl1RY45vEpEMnhp7j+Uyxsbx2g9ZKi53pQ9ckma/UsqNwhEOSoay3ZyC445aYoMtfV+HcVKJ4g+w4gBHbDMgn68zlgsrqmJLPJVdpz5HZdC8AcfjALC14ywQnOUN9J4/diD/ST//vROSpLsde5AllZdFKHF0QjHfEFDhi+hw5V13DIlokd9vSIU9ehsfNXYuTyc9CM4dSE3QqL96UM7t87LJJ9JYdUt1XcGOFA+EagXvY0TfWj7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2JivV81saXOoMXtGiEtRvIF3AcsxlFPbwgEGpnuCgo=;
 b=sQMIkPLsrZPHz5dXoTfafxw1UmqPJ/EsVSWeLemlN6rAR1YEHQ4g5EZyKb9eioAVZYDdQqNlOjdeqcIwOmDSMVVx4Ca5SjQlndkRS1t5tXbc/qj6dCGogsFbzMy4t2yjkB86DmihLo2ai+S+K2xa5IZAphnQ9XCUOH082v3PpLjxbpRhZ7q6cwhY1vGMx2O+gv8UISzebwlr9mNhh/b+TA9//jXjx6TOgN4DIjt2NiW/32fcU4QkTbcUIOXxzIYb9tGiKlqbttkCN3UHliJ1skVufPH/OPPf3UC1ymZ3nPA20QFTAwGRAWfVCjEaXSJp64SA8S9jFFyOUwmkjgLhCw==
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 03:30:23 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::c3) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 03:30:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:07 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
Date: Wed, 17 Dec 2025 21:29:46 -0600
Message-ID: <20251218032955.979623-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: d43dd7ed-06b5-4031-36b3-08de3de5c71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3OZV3DorH7mSSDyonGv7J87ZFk1VIMfF/sZjxeUyoPOvCuzZIY+Wki70fcW3?=
 =?us-ascii?Q?sje2KotocMj7mY+5VMNqoIESOkN2m1gAKf5h6i74/6kWDe2iDpgRhdK08rLb?=
 =?us-ascii?Q?cgo7NiGTsyJCKfVUODtssLu/rqBKyEsuBMAom8rHFs2hK6AnW3LHTNnaEnt+?=
 =?us-ascii?Q?RkfHi+VpG25CsV45iG5R0RcbfuY90u6wT0FYZMq8AV0WQ1nbXrKKxsDCtBdc?=
 =?us-ascii?Q?DOqrNaKYWwp7Jv0W1HwZRwuimsbYuYEIPjLOh6rIUa1IotQA4GpaXMgc7WYe?=
 =?us-ascii?Q?ke5HML9olX0i8E+6aDC+Hl9Ih6uoi+aBgX84J4l9MmcT2JJoKDLp5MSnfqgV?=
 =?us-ascii?Q?sYtSRh68d9SGryd1wVtP9OZuyXfTJy34bkm7CTV0NhUl2EEpC1nFgwiD2iKg?=
 =?us-ascii?Q?Q/enV4xPfwwVVZazhJwTpbjFSAppkLGeAjSezkBEUxaYxId/8KDtZDhzkixb?=
 =?us-ascii?Q?CKl9KtgWP/vJae0/PQlhdb6uXsSlVLOC7B4Uzv8t2z8NhMAyfnjeIeXJXG1y?=
 =?us-ascii?Q?f6cvDRwDaboVlh9roMti858A/a8JTqDx6cZuZeCAsKoFimYoszy3Myx0j/Sq?=
 =?us-ascii?Q?2PC5Fp8G3vkIsCPaaVohqOs5NEH+WAMnajaYgYH64VxIKp2mocjIPZRAwsMM?=
 =?us-ascii?Q?8ESqqzHBIqh7484svYTHah//JY73if0NeIa+XRinhTRBUZcxtqFrkoaLwmEr?=
 =?us-ascii?Q?lrtVV1zrLg8PU/gjOonr3/9fkK+n1rdEnJVbbXDtqsbTxbcnEYLsx/Z5i1Tu?=
 =?us-ascii?Q?s0iYFPZQtfJkBvsk4x9KWFPEXxZd8k124OlocbEM67uIVsyaivKr/uLAalvw?=
 =?us-ascii?Q?nDJ4WB81vqi29pwB6Kf+hQ4+5UMn7P7gQZgoXw94LEw5RIAyY8WP+HcH9+Nu?=
 =?us-ascii?Q?ilWXtTQZzj1iDNT8KpAuErn0k2Lfhdui5GZB47H128zgVzxQluzCgrzQz/iW?=
 =?us-ascii?Q?d35elw3GQCdNtW2p6uwxKz25xmiU6YKw9dvchpSiOuwwhTl/BqA+VHuJ86rV?=
 =?us-ascii?Q?MingyMy+3sZa+mErgEsCKdctu9nQqBDWLBwGO0GdI72ulsJYO4iYw6/ExtfN?=
 =?us-ascii?Q?UsfEPUzSBHF8c5WCipoCvHKBu1hqASRoezDKGh1Gi2lnl2ySzAK1q2xD9pNg?=
 =?us-ascii?Q?F8nGhY+bSjnN0VS8vnHrDS1lrGmwbICCpDW3rbFNn7/pddc3un4psx47s1ro?=
 =?us-ascii?Q?XGrggJ+lwtte9Az6AeU/9fK25/qCcoYMkfx3A3/7uAKQQ9UOCyoy8tGnAL/W?=
 =?us-ascii?Q?vGf7zycauCQXLb1iSj5hyuzlQmkG/hMge/W33Rq2bE+nTKyVWQp94NSc1aTS?=
 =?us-ascii?Q?7fC6pIytkVFmnck2r96Yd74Tpjo33vVSV608UrTDQykk/V6ll3j1AbFf3Yhw?=
 =?us-ascii?Q?vNVRywJU9s0bNC2iulIj7lB5u2q62X0mKxEIw35OfXL2cJ4nBOwKejBKNgKC?=
 =?us-ascii?Q?SH4BcWnaq3vszbuY2DZOVEla4JZA1PzF+Jm/zo3nF09TiZjJf41+U9zGEBR8?=
 =?us-ascii?Q?LoH4iUy/mxkGAQiojP2lJKERdIRvKombMiHeRCZFyrsKTdwFN3CQOo3nXKg5?=
 =?us-ascii?Q?JbI8JNaHpry4d2DU8Aw=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:23.0085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d43dd7ed-06b5-4031-36b3-08de3de5c71b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968
Message-ID-Hash: GHQUAYF5GXWMSY5ZF7ANST3CBDKPLNOA
X-Message-ID-Hash: GHQUAYF5GXWMSY5ZF7ANST3CBDKPLNOA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GHQUAYF5GXWMSY5ZF7ANST3CBDKPLNOA/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 20 ++++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0965cb50568b..b92152277d00 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
+    /// Non-Secure Instruction Memory.
+    ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
@@ -348,6 +350,10 @@ pub(crate) trait FalconLoadParams {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
+    /// Returns the load parameters for Non-Secure `IMEM`,
+    /// used only on Turing and GA100.
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
 
@@ -457,7 +463,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                (load_offsets.src_start, fw.dma_handle())
+            }
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +516,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -552,6 +560,14 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         )?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
+        if let Some(nmem) = fw.imem_ns_load_params() {
+            // This code should never actual get executed, because the Non-Secure
+            // section only exists on firmware used by Turing and GA100, and
+            // those platforms do not use DMA.  But we include this code for
+            // consistency.
+            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?;
+        }
+
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
         // Set `BootVec` to start of non-secure code.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 096cd01dbc9d..1b98bb47424c 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
     imem_sec_load_target: FalconLoadTarget,
+    // Load parameters for Non-Secure `IMEM` falcon memory,
+    // used only on Turing and GA100
+    imem_ns_load_target: Option<FalconLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -359,6 +362,8 @@ pub(crate) fn new(
                 dst_start: 0,
                 len: app0.len,
             },
+            // Exists only in the booter image for Turing and GA100
+            imem_ns_load_target: None,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        self.imem_ns_load_target.clone()
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         self.dmem_load_target.clone()
     }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 6a2f5a0d4b15..e4009faba6c5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         }
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Only used on Turing and GA100, so return None for now
+        None
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
-- 
2.52.0

