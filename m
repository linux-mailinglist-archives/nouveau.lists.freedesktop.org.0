Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C4CAE66D
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB5310E3F0;
	Mon,  8 Dec 2025 23:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qqNxBnIj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013021.outbound.protection.outlook.com
 [40.107.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E403910E3F0
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F93qYPZcRqpPo5G++ETryUNIHLRqpCPOwT0ulm/ul5YMMuF9GxPT9Smn6skGq2qm3neLNsYd7XN7HyCBA2r/8KLD+kPu9rlPgfczwG2TogT6zIWGY+35tEJ2sH2Ke8fQExn6xSjLKT13x+YBVVlQDeEnDSOhp87e5yZwWOQBIMSl+D3n77yCkfyNf0HM94jyhriWYXj8Yx/a/z9NdxT0OC2jH5O9m7wilpmO2u+QrJ1kYz+WL9eyXHGxxhHBYdm4X28eRZknpjZAf9R9HL4f4nEQo0AsFLpvz5dMV40PJFfrEbqEpMSQRlli0oVQZgAVxaemKYtVTXdRsPYp2IVRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjQ3pNAsBwXHDZ1IfvZKhsfMs2iNyJq/6Ba3UT1Lx5o=;
 b=S1zNA1CU5TbVsw2L7Fjh+5rjv79Hv8Nk7eEcro7+rWPGb4H4Jm8tCpidfdc8zryX0QBnBkaPFOpNJ+uzKeQgP9OhQoay0rey3d7Cng2AznDHdKt3Yp6Jit310xyi/IaYzNrA+ujQvGqcPPKw1Ky4U9hZozMo7emBlfKw5TYt+wxVrvwai4FVR3IHz+HovHoVCEdr7GIaFoO2yjHwE1zxjHHzLHe8TwzySbiRfKAAsRYxi3eKiVA20WfpeMuT4jlbo5CvLkKGIx4H195su4rYPhcEIpxPNEZ3mp+qgo69PzBs+iBOv3CyRunQ8/x7L97th1mzLJShbdTMclRuSGBe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjQ3pNAsBwXHDZ1IfvZKhsfMs2iNyJq/6Ba3UT1Lx5o=;
 b=qqNxBnIjtWUHLgJqCr7ixUbsewjht0u2J4QU0a8tbeODH1nksbOhDugrDjaOK0SimrTnPWVIon+QoewFnm17NPdnuOqwWL/idNSRJi95wKvid46/vkgDffJct9yaQEXQPO9YPEMz0wje5192Gy3qrKc7RTYfSgYIYP6iyE+FGHg8pBscahga+OgrNpRKYwX8xqkHNOVnrjWQIWVfzL+E3gsGz5h8Zl2bCTlQWpL1q+i4GzkuR/2FnWQCQRQfGOT8KjwmZlQsiyw+BvdyxDTg9gYFoZfIXWICM86f4U1MgSiFsPkfK3mYHcyReJfPUVXHJK5t6i18/pYrazHWFFbFZQ==
Received: from DS7PR03CA0286.namprd03.prod.outlook.com (2603:10b6:5:3ad::21)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:31 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::f8) by DS7PR03CA0286.outlook.office365.com
 (2603:10b6:5:3ad::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:13 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:11 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 02/12] gpu: nova-core: add ImemNonSecure section
 infrastructure
Date: Mon, 8 Dec 2025 17:17:51 -0600
Message-ID: <20251208231801.1786803-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d81c88-8bfe-4a19-5ff9-08de36b019bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yNLhdshH1CjS+O8WARe/OpbMH1HcFvd3xKGAtRUo8lc0Vx2Sr3AkwhGHgwP3?=
 =?us-ascii?Q?/xS57AYq61ZFot+FhDxT4C/d9es6q05WVb5TwX/GhGt1R8KRD3FUsUPH29Wl?=
 =?us-ascii?Q?ovWHn2aOVsV1BJa3GNG/CC/0IIsNzXx5CwBRty/RoUeFBMCz9077E9/pqi3a?=
 =?us-ascii?Q?xQOFWKGgcvT1jc1acxHhK+lDiIxk9wHTEGGH3dALc97mi6+qVFAOohg1oth8?=
 =?us-ascii?Q?6XxHaZk5/b0FpcOPQALBHNb9QOTmxO8ewlwN/b/vStzV0V+wZk7q0NJ+YWY4?=
 =?us-ascii?Q?NJn8vhRSLnm6+sCByI7JPcPYBpmI4VGA/jXXmUR2sjn2cLDpOUcCRx3j5PsR?=
 =?us-ascii?Q?MxU0Y0eY4KO3t81cES1OR+XHWNSrPpUxIM1x2lkpHKn4xMrGAYm84ousG/Qv?=
 =?us-ascii?Q?sFvkzY9aIIOUxkm/sQRq14nxAs/Bk24V5ZMqVZUJ31tqFUGZV8V96kC1I3Lg?=
 =?us-ascii?Q?9j3xRulvNqGWFUkm0VIMeAMxrN0/xtzPChJwCZQ3IccuD6ekBNcpLWuw4rjc?=
 =?us-ascii?Q?iz2ibKysWVm++0vpd8QldhgV+Fx8d6W0sXhuaR/HYtUeAtGAtvPRfxHEC1Zg?=
 =?us-ascii?Q?BD7PbRlffLcrVo8bLU+cSlSZgE6w2nbPKtHYNjAHSBzp7UohULo5fFFcQE3d?=
 =?us-ascii?Q?G1I89SFJyI5x1CH8v7/qCCUdwUKyGRKzfNVoY+jc3WJ2fKwrLKosHEScvXaF?=
 =?us-ascii?Q?DNo0IGqSm6FJzTwXjHtX7YfANV5s+VhXvU7Q9fnlUi/4ePc/1kSRu8Rq1GGp?=
 =?us-ascii?Q?1CdVJzKmMHW2kg5vc/bTrOzwvwYA4Pt/6ttNWJsYY9rXMuFqwO/NGKuYCnqj?=
 =?us-ascii?Q?4UnVMTkoHlggMOa0SJYO3rmBArmfmfHd5iGj+Hzg7s+YZ7EAFdw2g1so23Ds?=
 =?us-ascii?Q?aGmksYFYGfRN92wCogI8M9IlGfji3dokSFwU2bty/RgJimP3jhCSXR9oQ7Pf?=
 =?us-ascii?Q?yMa1f4PObefPSL5xzrrWUGQacige2IVAGVpfYqMn2WOqm3/QazEhzs3hEllg?=
 =?us-ascii?Q?jT1J7bF1BSmJls5fwnVqtE6WypxOoutIU2Er3U0KyhVBEsCuVls0+ssB92A1?=
 =?us-ascii?Q?vstY1qCHLSfkJeJ3lnFvOJLufT/rSWvtLYUJfUrKrnXrP+EoHTl6SzPyEzJK?=
 =?us-ascii?Q?xCRpbykMF40M5+SL1iFoC3OuEdzJrEEGhQeakDCYemi59XBuRM7W79KWq9TV?=
 =?us-ascii?Q?v4reV26VX+cgidJw/HqWvswzIaL+S82BszDydgztvyNG+PYgeYIDtmKU6Lxf?=
 =?us-ascii?Q?HXGx2tp1nI6IMKcOSF36KXjkVxn1m3FrSD/NgsZMxKx7f0nGAQ9DURi8VYhr?=
 =?us-ascii?Q?S0tlPSTmXh0RGvZ61JhRghHqyEpHHalbAZ1krjWuPlfTTWFQD1tLpzdhgtho?=
 =?us-ascii?Q?CLXy+D/lPnXxp8li7cb7O7pJ2/NvQk8YyIfWO37jiYSudvShnGuwqscWDUsM?=
 =?us-ascii?Q?tKc+2PgBF2AF/Sg2W3szMdQWx6Aus0kfbwDYwJ+NSqf9JKBEg9RS8znya3t2?=
 =?us-ascii?Q?h4VlVCYhZsnoIorm1oPa7fO2QhkAokad7A1Sdn+ZJkR2J56/pploU8OSTu07?=
 =?us-ascii?Q?SgbO57avZbKIQwIrpjA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:30.5738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d81c88-8bfe-4a19-5ff9-08de36b019bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
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

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 21 +++++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 618e3962d83a..fed597a29fa4 100644
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
 
@@ -457,7 +463,10 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (
+                load_offsets.src_start,
+                fw.dma_handle()
+            ),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +517,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -546,6 +555,14 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params(), true)?;
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

