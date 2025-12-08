Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E4CAE65E
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0928710E0C2;
	Mon,  8 Dec 2025 23:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cTtuhseW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDD10E0C2
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaYxhqKkdY9VuiPkvO6zKNChP+biEH3K2nJC7h6NADePc1ETcirME04mNW0yzzTFfuT5s2JrIP9QIWL/v1yRwbaMBsUvKwgM7LoPUJtBKv0l45f5ZUhf3EGNCz/T7yeEyHDEgMM02pYtr0eLDH4NAjn5fdDzdFHbb/2F3dO4n+MSOIKw4whOhgnMq83sj1dK1lfeYqMSzYrEhR/1Dyt83UcWAwzM1t5OuZJb2wVpFrxvpir+GsRTZwtk52X7QDQeBfOqqOxQV7tbbWM80qF6sqWnF6ppEpXfEVhyxwHg3efnGeRU1IYM7BZt0qspaicLzD5tpiCLgDNrZGdAXAclNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otgDxsOMrZmAz2Ow82zxyGsPR4zNqBxzAk32TZ4mo2Y=;
 b=Psh8Ujf020T+GPqX+1jdmBGywfTr1K+EbpfsRQGNhgwuYdNtLGv59cJUEMDRloaG7MoR0IGc3SNhLkyk0QPL2XzT0W/UOX8+uwzkbcdyfH/R5iuX6KQ5VVCo7E85jNnBuKPvMeQtS3OWCjrtgH4T4brEjGCxk7biPCwivQ0lM/Jl7IuD/aoDxtoLZa9915V+NdwU6SMMZA2OdB0jpKlK3PkfcFe42+ZRbUty8oTWoTO4ef4FlfPONd5cwkcafPWB3vCTNJyGEFuU7SO/+8Z/4RaVLwtPBG4u3Sv7p5FBDoIs5SkBHDX06+JgO8+GNP9lmoE/VWQmc7+FrHk0QTACXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otgDxsOMrZmAz2Ow82zxyGsPR4zNqBxzAk32TZ4mo2Y=;
 b=cTtuhseWbu/iw2wLrIxi4O7GQor6w4EKnjTaHw//RB5Fs2r+q4nmPQOIXGvDtkiKPvTVnF5qz/vkHjDYF1Xkq69CjeG1D4gRmFgEpTmX2Dp/VdjiOCWc0LcD5XQ6m1zrYt4y1+ml7wgB74Qx6U1Zdh7O5e/lOZF73TyY3otSh634ovWVonMTTtC71x0NOQd7lmXNlDEECuX4kux63ky6dca5o482vdabnqEGFn3TKf8/Q6qijwgB/bNF4p6Dw7r7+EoUqRHBE5QlGObkCcDIhf2TG3cqDhBtA+TfYnQaM28avBMqfmO7pVX7Fc7tbUPRfuXDmz4+LJvDuyhbG+83XQ==
Received: from DM6PR06CA0066.namprd06.prod.outlook.com (2603:10b6:5:54::43) by
 MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:27 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::da) by DM6PR06CA0066.outlook.office365.com
 (2603:10b6:5:54::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:11 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 01/12] gpu: nova-core: rename Imem to ImemSecure
Date: Mon, 8 Dec 2025 17:17:50 -0600
Message-ID: <20251208231801.1786803-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d188b62-29ff-4cba-75a4-08de36b01775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M9DCS4vaSp+m2aT5LKRHrK5CEdLpMmuKfgkVdwJCGM9+jt3cUoIlWiKEzYQf?=
 =?us-ascii?Q?4eVE8mZpyTjzdL+Kuc2Sg6getGNnMSz0zZSpJnpSJPDzybaeRQXEi97QNus7?=
 =?us-ascii?Q?/KD4KoFl5PUwDb2HrUYwyJTUurRWgYVAdD+51h53t+AFLDrhjxrfSmWaOWss?=
 =?us-ascii?Q?+ZVKEXHtX9caanfrTrkqzqOqbE+ls11WQFY2BOG3C7ayCBQDYrCYy/sPDenE?=
 =?us-ascii?Q?CXsl5PIGppnaAJOThJE2YlAj89wDcyr5AR/zl2f+xhpc9VnPdlLSsTi5JKpH?=
 =?us-ascii?Q?k7c16cX/P1lMeG9+8x86CKQnNWgOVbxcVp34OIkpmIa+NnBQ2OS1fjLTtIpe?=
 =?us-ascii?Q?wW14J5cIlLA1PDMrLw6FFv2DfOp0mErhMsbWrt3av489UcklAZGOxw9KmAng?=
 =?us-ascii?Q?5E4Vt/qcpKUaQMtaU9VAW2Y42BFTGIs50yVbT+cIS13q2nAqWczHZozR+l2E?=
 =?us-ascii?Q?yifRma66Jh37tJED6vDz7TmBTV1Afi8WI6Vbw45+QnX2mSaKWs4UTmpbjUVL?=
 =?us-ascii?Q?B597EHUzmjTpl0IIOqTALNfguts6mpH/UB88P6yLkheks029GTHiSTWzuD3g?=
 =?us-ascii?Q?LdLX7il+Xt07798zH9fRn+v6ou5wFz8GdurJIHYIOPjfP7ub5oTm+94BJr4d?=
 =?us-ascii?Q?sT7P/YH1rJCU2RhG6a7R6s8xvUaZ+Pp26B0QYdV+JMcEGd+E0M+Z0WFKK+7v?=
 =?us-ascii?Q?ZPwZx/gFwVHh59IwgpYGaZaTWBRbtTHuk5WsTep6IXbCsH7Ek0NqNRy9KChO?=
 =?us-ascii?Q?u95nyX1smC/oFLnK/HRghrSKoug0bcD1JrT5X41uTPkd/CzgJnj4bsArvo6p?=
 =?us-ascii?Q?TNxbvCYG3e1P2yYVHUq0FjIWVqYwAkibiuvTOyCkuV6O8uTl+Zpg3Ukf1mT1?=
 =?us-ascii?Q?rpW8MIsZ3aXMS/zXsHCbwmwE/3+UVNrVLLUPP1b+po3wSWsHW/HmUDkKaCqb?=
 =?us-ascii?Q?n9iXN2ktvdh8dBb935rW3SYIu9MQ8JCDBsQjv1hovzWFKVbTL0hdTO4x4OxG?=
 =?us-ascii?Q?jKpFSPCArfNz8KBStPOGmf5Yr6sbgQ9CqBhoc7FzNddvTcEHdGqmnRS0WTkZ?=
 =?us-ascii?Q?ZxtU6yCosTmwtk6xAyWe4PYOvHLdcl8eL67Av0opCdaklnjoGxI+gqUe3rat?=
 =?us-ascii?Q?9JulaziRGU4+RJ3gkMCZzU/zMAqq8c6vOmvbF3BxRFKaCfHdmPy1pQRoOTSR?=
 =?us-ascii?Q?zK0A5q+4uIbXuQ7lAuPy1Tyr72glmoo+FC9wCxPTAGeTV9e/nFjU2IZOvDfD?=
 =?us-ascii?Q?hRDU95TQLaZo//Z8lRUq65OUBs6sMsqd9QqH4m4jVrJh68RKLiqk0To+Ajmm?=
 =?us-ascii?Q?c5CMInF2YRN2ICNAzgT7PzrzNWUTZV9l6+egxbRvnNMoEM/VCmcU/JPorySR?=
 =?us-ascii?Q?aDqRO6c2CUC3tk+5XYd0HtINJmRI3Ofa3COv2rwcwvt77UbwcEYRRQfq5njV?=
 =?us-ascii?Q?XanfTPIAINIMXiNvqNAtOroeU+m7TK4hHSsFYGPJXCnhNTqVszGf7disSTZg?=
 =?us-ascii?Q?2HZACHGThHAy2HDQcHmk90lpaFNL8rtVKQQCsaAvIDa8/37Fpq0o0eQW+gsi?=
 =?us-ascii?Q?mOoXqG1JL7ihFDu4BA8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:26.7784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d188b62-29ff-4cba-75a4-08de36b01775
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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

Rename FalconMem::Imem to ImemSecure to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can also contain non-secure sections, and so FalconMem needs to support
that.  By renaming Imem to ImemSec now, future patches for Turing support
will be simpler.

Nouveau uses the term "IMEM" to refer both to the Instruction Memory
block on Falcon cores as well as to the images of secure firmware
uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
instead, and uses "IMEM" just to refer to the physical memory device.

Renaming these terms allows us to align with OpenRM, avoid confusion
between IMEM and ImemSec, and makes future patches simpler.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 14 +++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..618e3962d83a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -237,8 +237,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSecure,
     /// Data Memory.
     Dmem,
 }
@@ -345,8 +345,8 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
-    /// Returns the load parameters for `IMEM`.
-    fn imem_load_params(&self) -> FalconLoadTarget;
+    /// Returns the load parameters for Secure `IMEM`.
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
@@ -457,7 +457,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +508,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSecure)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -543,7 +543,7 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params(), true)?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..096cd01dbc9d 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
-    // Load parameters for `IMEM` falcon memory.
-    imem_load_target: FalconLoadTarget,
+    // Load parameters for Secure `IMEM` falcon memory.
+    imem_sec_load_target: FalconLoadTarget,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -354,7 +354,7 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
                 dst_start: 0,
                 len: app0.len,
@@ -371,8 +371,8 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
-        self.imem_load_target.clone()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        self.imem_sec_load_target.clone()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
@@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_load_target.src_start
+        self.imem_sec_load_target.src_start
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..6a2f5a0d4b15 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
 }
 
 impl FalconLoadParams for FwsecFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: 0,
             dst_start: self.desc.imem_phys_base,
-- 
2.52.0

