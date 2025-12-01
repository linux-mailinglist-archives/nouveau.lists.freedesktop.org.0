Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C83C999D2
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED96D10E4E2;
	Mon,  1 Dec 2025 23:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="owLG4SlL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3FC10E4E2
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6ArYUNuzjQH4aO1877kiF+oX18zm5IcDeW0GJWWPGTWTp6jzkaDuGR4vmV/snHeWqz2grbG2/ygUwcy9EG1VyHj8E5NfQDOuiO5ugPQIOxkESvNgHgG6Mr1LDO8A68xmvQX/jzaZZ/vL0OYqETHT69Rz8UhyKM8kEwRxcUva+il8vhBsdk5rBvtFEZ23qrVafrNwETcNMo/OqCNjr2UiwoVdzOVb8dlobigPkodISqML7Kn2+/u68Rgq8bhNG6Zn08SNTjA0/uksdRuOx7FYrrNip7iCjaUkIOo5UX/P+84ZgBGfWDMaYG7TitVplauWbaV999JnG4kP19+dVJZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjQ3pNAsBwXHDZ1IfvZKhsfMs2iNyJq/6Ba3UT1Lx5o=;
 b=rEqLRanU3cR8RJvW9GQW3nyfNqwakFYAuI2tSjxWFwdpDofpVNfiwWGsP5Qef9UweINID3Tu/Cbbjol7O/9wTXVu2trSqKOlD3BKhZv5VAa49WvihoQRY/3RieqqM6Z6G0AQwYRc0PUi4AvaJCg8D9EbfFJY6vcyn1Xo0oFc+iHK0IMBpVzc3p7KlD1mYoUy+7NqtU1dpIgekxJ7lPRa4856g8AjisuUzZbwvYgWrPkbx4qPMx5p8YwidrRsfE7PnZe8XOwMauW10gnZoDi80CtCsNDCC3K/a6/n3Dn9QA5LmGxaRKz8jXfERh1drd45wKH4ERWSp+nu9aJewwbaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjQ3pNAsBwXHDZ1IfvZKhsfMs2iNyJq/6Ba3UT1Lx5o=;
 b=owLG4SlL+P0uaRWofwpOYm/GhhrwJ/vTQroqvJfD5SIuYIKhgw3osuMk/hGqKGt9o56e5P/Hvenf2iSeBv1a+UTu2Z059Hhd7aXuy1idB7jXOiPn8v1fBkisKFhuwZfA3GXmiY9mZl0EeQ1E9XxhQVMKdMDA3/jTf2OPWR7SrSB0TcO/zya0Ja6X+QkaYrT7aMBm+PWK1ejnFhGg/8d89p5d8Wx6uM8+TRQ2U2dmsebBey1f69DW8HvZ5JlnoPHdYHN/E9nENdCKVl30AA8RhIUsZrar8p7Rwalh3pSA0ZWhJhbUm6za/tWP0J3BE6LoXrRq/9I6dDxX/iicp0mG8Q==
Received: from DM6PR07CA0110.namprd07.prod.outlook.com (2603:10b6:5:330::26)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:15 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::da) by DM6PR07CA0110.outlook.office365.com
 (2603:10b6:5:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:02 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 02/13] gpu: nova-core: add ImemNonSecure section
 infrastructure
Date: Mon, 1 Dec 2025 17:39:11 -0600
Message-ID: <20251201233922.27218-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b69c0a0-cf92-476f-ef2b-08de31331e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HRKYrtja6e4cUoNWkCgVia311lr7Qv3z+YxQilnvF0F3ZDwONxLlFCX5HDKz?=
 =?us-ascii?Q?0Y2Ewb3hfvMTDtZ6NRkXUp7ZXK4A7WEUhqzX1qVhT8zKQPjNCTPEqTzTLWJF?=
 =?us-ascii?Q?RsYRjbmcMFWPh2Wy5fznH82WqbKh4zcQJqqBzE/MmF8hIvaM1iq1hrC3hfiY?=
 =?us-ascii?Q?HzzI48GMZthvQvEx2Lyhbv2hrFZo/uRTCo6G2n14s78qpZjU1JSKMmioNT+l?=
 =?us-ascii?Q?KVp5TyqATYfIrxWlv8YYc8VVOd0Col0uYgD7E3WofztlPcbuJf5R+DMavnzk?=
 =?us-ascii?Q?HKckjbc2FPu6r5U0S5qsC5o6dkmXntduWV3htSDvSfn43W+ZjUhmmrw4C/dS?=
 =?us-ascii?Q?f2fRbs1jL0mX1D4dkkxbglB1G0djsIy1lx7DkrhhcLvisiiEqYMkwj4W00pr?=
 =?us-ascii?Q?v+x0hDNgt6QPjNMWNXLFf4VxCfxLgDRPXp42jKJZxSrEKMU45rSYbLhRI3Bs?=
 =?us-ascii?Q?mTNb96YrZImmY0EAb/dFAN3DWnYk9ccLGgJRX7QwMl7+VrSrNpTAZXuKAg9T?=
 =?us-ascii?Q?qm0SUjnCyyNixcHIFgOsrFLYXIYWwAFpnXrAnlhN6RQjVgvGl3MfT6tYI3ll?=
 =?us-ascii?Q?3hTDu/DmlV27JHJ3B1U4dcc0TTFzSbUK94ScQqLwTbiCN/ZYKETWTTgsumQd?=
 =?us-ascii?Q?pfYXD0pQDXQKmiatLhU47FjpXj0KfNsgWJREnkavAngwAKXidTnRBE4hR6c4?=
 =?us-ascii?Q?xQV5XUNa+bo4h9vqzKgUByq81JsxllMYKLR0IuBdsZI0SljDVZK0c/PZ9Lgm?=
 =?us-ascii?Q?9O28qSG3Az/bjO8qVtUqrWyH08GCopBKOuAKf7t5ObjjIqfhRtZIEA8L9ziJ?=
 =?us-ascii?Q?LLtel4YTCsVeqTgMOK2ADWNB/Xe0PIL5oKZmaBpUHIB1MGjYlgfgjEIBalHh?=
 =?us-ascii?Q?FtclEOZDy3z2AqzfI+dTpfgrvS4iV5jJaR5mGm2jfR//U3DYpLj0AzhYLCt8?=
 =?us-ascii?Q?AGhpVz7ogd7wbbcSNF50xKXPafWlm5vYYewtdaLUDizPjg54SIa34xR10WIc?=
 =?us-ascii?Q?1YBHJWqX/D3oeqoUWCL45bcxGc6jcynrxb0JdWzgbXYMDzafdzPgRM1VkiSo?=
 =?us-ascii?Q?K/HxOH7HYPB2XcNO3mfHKlfvLA+gb9Z/AEhgAiYLxxQSt9KJuh/UEog9PWUz?=
 =?us-ascii?Q?yszm9No99lgr5Ll/Nw7D+y0jBlD9rBGP7sYp+eFZ1CUmZWzP5XzJPySJeQ9y?=
 =?us-ascii?Q?ZsaMpfhoHrJTurjxdU/mD7uvCeixWgzhh1VeL2KMTnBjZxF14C75MGCRSkYT?=
 =?us-ascii?Q?gkFMnZnWBTwLB1vzjVKX8fwV/Kaeg2UARF5BuwB2NTgkzwYmZ33/uTCBH7Ns?=
 =?us-ascii?Q?cy9hN7bqBU8jz070uCKmaIGmNJyO3jrrKIJSW9LKQftl1810t2tLHwZeCiFQ?=
 =?us-ascii?Q?9DVcbcOIM6oXLwgvCAVnXmnuPowfKV0wzKSx6Ku3rGlfvx2I3kyN6xri+Lgy?=
 =?us-ascii?Q?8zsxipcQB/DRNTCOfEDFByu5mV2XCUEAAfdlIVLGI8wEBqrHS+Z8XdQi6aKa?=
 =?us-ascii?Q?GLan7HXsuKd74EF589rkg8jGuVZbv1rS5Hu6bOxwhfMSjKYCp7K8bK2SQOAQ?=
 =?us-ascii?Q?eVfhTZ24Uam0G6GjjL8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:15.2759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b69c0a0-cf92-476f-ef2b-08de31331e45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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

