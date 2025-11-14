Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38447C5F94F
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6C10EB44;
	Fri, 14 Nov 2025 23:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qLnr/o/X";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145010EB40
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAdF1FawXhVuYogIacSrsaGJqh5ATCgbCNvwTzlpXOp5WSx9UzpYOa90/7uup3WUsiF9mAtADmy28Z76iF9w23Bj5kbHAZKLCFKIz6jq69KjNga01M0Wn2FF6F7I0cIMNMRsMonMfBevYq4r1LPl22fKGWLg13925+1aFKGJBGuH95MoWKN9tYG8BO83eiTYQj0z//hWCl7T1BCv/W1t//x9+COMnNvQtl+1KUZhRuFCk7rlmhTx4gvzUcum61SPadEfR1xRSBPtS0nX/NXF8pVcL07/wpDTzM0mdxtfhl/+2+rUzkUAbVXpFr2NCLc9iHntN+RJB/VwskMpboA4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5i+Y0vvOZakEe2DSGU2eC0JS+ea5ysi5aSXOoDEzJU=;
 b=cxbSsMe/Yf3bpLONAjKLpkLB5ANtFHdy88lJon+YVGfN2WrO/84QA4j7B8tFWFf5hwhugUQzOOoEIi+JI3MNrkfv9P8PgBfBuuLWGa0uDa0fIq/oVzyjAwBDnGzZnow04miuuzw2cd5uYCLBp3ohRPiY0I5ORN4BmdESofFJBHHYG9QCrpIj5lVPqONpjmREGucsHFsnggh+jdtR6BKMv7a24DssV6zNGNwC6GyzutJkOyKHW6ucIG/Izp+/qysFHFeFSXHRbMfgaYkH7bXHR92Lz8w6ypPp4WnnW5yegylxOXdLzDmR6HRC8LFEBMdB78m488+qojKW3Fyu29SzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5i+Y0vvOZakEe2DSGU2eC0JS+ea5ysi5aSXOoDEzJU=;
 b=qLnr/o/XpUtJGqf7x+xBcfrQilk5QtebZeOCm1Yd9Gh/h9YLPpq8MXyc3OYaN1+rM65LAErTpSsnVpmXwM6Av6bzX5wKAAQjxdrMgOscHmdZ7faDr6sGEhM9RqR+Zl5ZeVcqBkHxn2Nkl7Eu5qGTfO3kD3Hh9V57XjsLdNEKFyOFXjZc/8/mZrnJNOCv/eNdtUOBbqFn739JLQlvJhZAR7UcZ2sGI9gY3HsstY28Y3yU/3/58dCAK6OND61HtCEH2v9a2qzwaSfKTT5CDGLrsb6shQ5ir/R76/F/kOzJhCzSCBarnN6joHL2q+OACEkHow8HX9P7Xzrnj2MV5sxLBg==
Received: from CH0PR03CA0438.namprd03.prod.outlook.com (2603:10b6:610:10e::14)
 by SA5PPF9D25F0C6D.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:10 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::51) by CH0PR03CA0438.outlook.office365.com
 (2603:10b6:610:10e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 23:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:54 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 01/11] gpu: nova-core: rename Imem to ImemSec
Date: Fri, 14 Nov 2025 17:30:34 -0600
Message-ID: <20251114233045.2512853-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA5PPF9D25F0C6D:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fa54fd-199d-42c2-53c9-08de23d5e48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sPdTHRyLhNgFGdH9glM9dl/125BH5PUPrQX9xJAd+sOHXOgKjjTdUlLTpWe6?=
 =?us-ascii?Q?3q2a7h6wgdyxHmS+R7I8K21wP7UzS/8LZeDJSRsCkQdLV33QaVRqKNkDqim+?=
 =?us-ascii?Q?FIjK7Un8BAO/dCWD1bh1uS9+6PdqJxHX2HBaznI9M78D0iQyfYMm305yPUoi?=
 =?us-ascii?Q?mg/Epc4Won8jV8WUoGYBA4iFqp0luuHzPz44SNxmIfl8eXLEnJgViu/ueGmN?=
 =?us-ascii?Q?zzaj/rG8YarryQtrAKGDyJTwW0TyG5NtCRPTEqxmzyD1Rd/7UNsTY9RmGXEy?=
 =?us-ascii?Q?EQF6/bgu8TeiF3fGSj/hteM6Sx+FaiBquOfZohaIpiEcFVzwXWRdgxY3S0VH?=
 =?us-ascii?Q?ryvQs/gBf5xnHrpIK7v49/JKd7jgUuPusovPexvD9Fu6Yvm7lg1ETUujvYET?=
 =?us-ascii?Q?kJ1aUydxa+K8/+G8jG4JQTCgGQGXQOLSKf4GCKbtdln1A+biPeQ3n8oimY+8?=
 =?us-ascii?Q?jy+U9VcCjHrVheRRWTzIhpeNq+MMCe3GyrXwVN83OscqGkdM5r491ZgU4vsv?=
 =?us-ascii?Q?DfvkE50WH2SqCxv1/uMpVfOIZVonPz1K68/ZIVJnJIM0h/kuZY8Zfrtwjgya?=
 =?us-ascii?Q?qiBNLytcHTe9E6CVp8WT3JyAawODuR0JPCULzOnEHCpEBnWnARCbFRYt7KVq?=
 =?us-ascii?Q?znt61Z63KrOgXyEgNRprbfbAkwVgWaonzcL5L1vfXM27JIAOTeQ3/wtuUcE9?=
 =?us-ascii?Q?elI36AELoH+FbMBBQLImctf0aFlh9x9ivy3N4GrXSukx6yOkQ34lgGVeQ9yI?=
 =?us-ascii?Q?pelWRHGuR57aOt3tJ3diH67L/oSO0UhaTsjg480ItEJ3zlcRxKZPCDkgbM/N?=
 =?us-ascii?Q?ljmdt99wZY+/3/ZQQBTx3zjj5DzEAyzR3N7W3BeZOd3SW6a5V5vdyEJM0DJR?=
 =?us-ascii?Q?At3ZsjF65GdqkHbYtpYuvWI1Lp34uuGu5qZ7yx5b9Wcwxr3jjFe0XNvP9mWi?=
 =?us-ascii?Q?rNTvpzyUmizSTkM5nlQcKOHp8QJcXovLdU4kyyxpnjIQLa3BGmIjXaMiTES3?=
 =?us-ascii?Q?eDnVFjNnHu7XD0VHfHeWQc4kvyriktWTqml+ExhAeUJRlldOmscVHeJX805g?=
 =?us-ascii?Q?Bx+LNN+ECgzkMdDVEQhipL3oUKFBtotBATmTAF+XzoEgD/xfnJv+JqS85J4w?=
 =?us-ascii?Q?5+GQWZT6Qp61b66he7sarycPQgQuLsQY59tZpt2kx6FhceolIuE/Ifrzy9pa?=
 =?us-ascii?Q?pSUKm+kiMFfUDUEP79ERyPzv8w9pF05W7vjSdLxgW4rn20xiMNZ4Ml7NGjDU?=
 =?us-ascii?Q?2dIrub0w8LTXv0lXQqOCm1Gv1FWEamOT2+u6SZjlWnJx2EAxV2ETf57eX1Qg?=
 =?us-ascii?Q?5vKWsUbV+FegI2S+ti/IZI0+r2RfiIcpN0vEkThYIU1oOJNv1ltkMjucHhLw?=
 =?us-ascii?Q?k/xvn2aLYK10qdAzF+VJgt9reed5nisAh1adPGUXCHoAMebBKfdbrrTKsRHM?=
 =?us-ascii?Q?lfy0Z3XFreVsjpZscakPq5DbCqM3koq7w8csDLDvvAsIg9uodCgTWSOLD6sp?=
 =?us-ascii?Q?kXZxG9aduUd+1/b5dJxTWk2J3oVBbmoEzEb3bts0Nx6qiFT+/j+L8LdrwEau?=
 =?us-ascii?Q?oCFBSdLU2bBCHpBicEI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:10.1148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fa54fd-199d-42c2-53c9-08de23d5e48f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9D25F0C6D
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

Rename FalconMem::Imem to ImemSec to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can only contain non-secure sections, and so FalconMem needs to support
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
index 05b124acbfc1..0e0935dbb927 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -237,8 +237,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSec,
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
@@ -451,7 +451,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSec => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -502,7 +502,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSec)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -538,7 +538,7 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSec, fw.imem_sec_load_params(), true)?;
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
2.51.2

