Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C16C5F946
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6510EB3D;
	Fri, 14 Nov 2025 23:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EvazpQFI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80BC10EB3F
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHCjmU0zw3VPklT28srDYzoZFrhW8/zJXk13R2lk+pruYabd+eauMGWyHho8NJi0JTOi/FeKYWfgrKMfpqalYX6EwVo6QZn6J6P0N97U42mnRt1/xnACbEd+r6LzhKP4RBDcj8Ttu0dH9x2/2S+pBnYpmUpLy8JnFw6XIEJggcB/NhrWYCAMoHOrKxEq3Yh5PUucsVccO2zyzcU0naQagCFk5XKnDywlOZQIQ02u1ELmfn1fbYNw35S5i6CX/vkx9dVNObFZQJir6TCJbyaNMmq0HydGUjlQVn9XoMwGCrOIkKPTqdn/bfWs4JVM9A7tAIciQoNKQXTwepj11PBt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a00sBCh/cT42D3jASi5xwMgiGLACGCLMk5dJM9uwRBo=;
 b=vf99ZE2HMwsximnPW1cWCCEV/CZiCzV9RaaZpVo8bPG+5rukQfhW7qroevRH1+IlErN4oXb4ClAtBoO5Rnrb3lmVhBNiHUHopQ9aL8N+XrwZVanhnd1ECPpXKh0iW+66B54PYeciTAWyD19BWWldrimoej2+Qh67ang5b3k42Q9tt1xJsa6eigu6hwpZS1t82wMYd/VN/7qdj+izvthg4q4DyWD+Ofx6y2tQur5pRMBZ0OGOi1SoiDfxRhMO1pEVOK6mKaZi0em4qZXtucMRuF6sdFYu3qXvj6RnuE3e8lGNozkkra4U495fq62MgoqwuD1tsAr3I7m3fvxGPlDrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a00sBCh/cT42D3jASi5xwMgiGLACGCLMk5dJM9uwRBo=;
 b=EvazpQFI2+N4Gq3IVCcLcLhu4L8/QjqZZvRagegZiVSx0QejYi5dmsNpiz0h4uqHzJFSJIJUWQkvaWqW96/1DUqMqp4C9wO2qxtqu5vE156q4Y3PXtWNawNQT5r0llKGj4r/4aGQQrNVUuADOERFDTOmCyI+TqA4L0TQ9Kd32EB9w1f0rMNN8k+fMyQmC3/FUFg9Wk8LlmTto5Ya5Xp6pXjgU0/l7ZGcWXR20QpOfVVxQhlpul1h1uE14WMJb08fyS8aWMU/3d4BwBReg1Zgw0sHbw47GX/mvU00lIJFRs9DLwXGIjeIM9w3eiSx2esg2hP+94IJFY/AYMsSoSW4cQ==
Received: from DS7PR03CA0178.namprd03.prod.outlook.com (2603:10b6:5:3b2::33)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 23:31:10 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::6e) by DS7PR03CA0178.outlook.office365.com
 (2603:10b6:5:3b2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 23:31:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:55 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:54 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Date: Fri, 14 Nov 2025 17:30:35 -0600
Message-ID: <20251114233045.2512853-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b2a729-5fe1-4fc7-8e88-08de23d5e49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l3qwcfeWgCj5eEQFO3LgZsUj8Yla6bC/HWYGeBfGyyr1MZxjcIIxa69srxqK?=
 =?us-ascii?Q?U5/nvjgSxWRllDd+Jhg65eRuY+Z5oDaRqVEdBmYdXkZhAPFRyBcedyirjKot?=
 =?us-ascii?Q?/ych5lcVgAH3Wz651/lqKdSAaVLTAoPRCpC3KoTCtXJPBb2n1INAIvfopu2M?=
 =?us-ascii?Q?XnFhMmgQlxs0oQbwEf2EiDY9WfsOG4JubcE/vmb6zX/q45sNfRHYw1ISNptP?=
 =?us-ascii?Q?1pVj1siQHpfLiFXERtsOkBhadmP17zokhw/IhOINcJGK9w2kYNGmIxY2elGv?=
 =?us-ascii?Q?0xR4AWyFTLco9KhJCXpsQp2phOiasQ8wbAh+syjJ95/oAsDMZHoc7LSsiezO?=
 =?us-ascii?Q?5KTaA5nuQJzh9GD2O7J4Bf+uc53+SudcetokYTJwrcszkllw+trLpyiPEkNU?=
 =?us-ascii?Q?DNUUAXpKyRwHhMn6SdSaUjp3G4beWWb9HlOtnh5ckUviUtwsSTD3fi82GotQ?=
 =?us-ascii?Q?elv5DF6JquNsGT1Q3piOByqJCxO0KoqeBqCvJgXseG1W5UoWOySKl4fUCRkx?=
 =?us-ascii?Q?ggiiwetgfZ9SKwkXpEz9qDXhchuEWrqkeO/JG5ltWjTO6RMPXddLH8uTYwnr?=
 =?us-ascii?Q?7xWY/JeVvaX436Cdu6f50Ssu6xj0e9w1HEpRYsGbsLz+md9Tj/7hsb3zwv9l?=
 =?us-ascii?Q?yd9PJJxKsyE6VSX7XF05gQ1ni8OB/A8ZHS8U2j1bfsdBzq+bVACqtIn5hWhC?=
 =?us-ascii?Q?S5Q5Um6iQm64zxIxY44vZmTC/S/TR1nvMmnxTbkpmiJYNUy7TOu4Qb5hVpdV?=
 =?us-ascii?Q?wVoiRZe0BANDFPAHcqZJZwFsTOPurZcJHSNPKLzruwjCgQgIH30SvIA9c2eU?=
 =?us-ascii?Q?Bqm7iUULgvu8XOVH1+kr9ugqoftxv9W3S1paJQyDar7VGsZxD8h0zIRTH5jt?=
 =?us-ascii?Q?IMH+vz/+VaY66gmCYTYD/CppcW2jj9V+AcUAl2X38jxzLwTxNmuBP48kctvR?=
 =?us-ascii?Q?6PMAU5bLAgscOS+x4o2lN3HzHZs2ojqSe/R6ztb6P/FsMkFWOGeDAMOauk6p?=
 =?us-ascii?Q?ZweK29LZiJGjfOgdImqKzV5UoveCkW0/3Xo0pbCM2zsxjqmEeOhUpU75ncJk?=
 =?us-ascii?Q?XrzLOUU2LOenoxqM/0HDvt5HkF9QIOBDdyjKa5gWl0suHEHVBU2/6AxDq0OU?=
 =?us-ascii?Q?ZCsLCvQhsyGudUsZhhU5FXZ50zC6HFh8ICjDHMIDtWJnuKC1DREmUvj8RsqE?=
 =?us-ascii?Q?iM/g8yZMAAvDqz9+fE4rp6bAa0YIhgerIaOEoZ8MytQYuS0Q8b3cShjSTjfZ?=
 =?us-ascii?Q?P1RZQXAZ8kujj6tZL74aUgl8a7e4ny8EX2tK1/ZUR61Brz0J3/BbtQnevyX5?=
 =?us-ascii?Q?Mpc9qZNpl9Iy36FlkyNnXGcKFKRdtz41o7YehW/80hPyjU2E59B9LYCAQZB+?=
 =?us-ascii?Q?b05ZBOyJwkiRSlKsDXj2ItJeUxzt9i4qOilTziSXlZ2R1JM4iGsEurwa7yYU?=
 =?us-ascii?Q?DcKZhFtsfbdfu2rkJE7Fnx4X6w/BcFf/mCiEUeywmkQ92O5OWnIaAIoV99Gb?=
 =?us-ascii?Q?GGrN0bZBGvCdf2TTf+gzFp1MZpQ4cs/ny92g0E1LdN1ukY0t/5Rt/QRv0W09?=
 =?us-ascii?Q?F+iSdeCKlZ5Pt+dbD20=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:10.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b2a729-5fe1-4fc7-8e88-08de23d5e49a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346
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
section called ImemNs, which is non-secure IMEM.  This section must
be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0e0935dbb927..ece8b92a627e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSec,
+    /// Non-Secure Instruction Memory.
+    ImemNs,
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
 
@@ -451,7 +457,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSec => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSec | FalconMem::ImemNs => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -502,7 +508,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSec)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -541,6 +547,14 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         self.dma_wr(bar, fw, FalconMem::ImemSec, fw.imem_sec_load_params(), true)?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
+        if let Some(nmem) = fw.imem_ns_load_params() {
+            // This code should never actual get executed, because the ImemNs
+            // section only exists on firmware used by Turing and GA100, and
+            // those platforms do not use DMA.  But we include this code for
+            // consistency.
+            self.dma_wr(bar, fw, FalconMem::ImemNs, nmem, false)?;
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
2.51.2

