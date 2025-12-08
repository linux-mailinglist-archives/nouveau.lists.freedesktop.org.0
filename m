Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C20CAE682
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1515510E452;
	Mon,  8 Dec 2025 23:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rBb/sBw6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CF110E452
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvOBqvsGtBG2gcEgTabjmYcnOfI4Yed/7BxSd7460/lJpRFUYuEBp9Z0P7KlZTbdH5kAH08yFcXiMoTMJf/1HPRuRhus/nDOKCSuRe+Rto8wDd2Pv1Zdl0G1nz3AWX+tGbsDdKAIPmDUckI4uE4d6mLjV32TRuNGMR6p2mQ0nAnOpMDcF9X499Z7FN8+D3COZ3WlUjDvgkANF53r65OF5vJ2p62qq9sDv7YSppqfZcJoxGucx2jwSq8Eti+J57S/PcXvZW/Dte4Yba7gjCzteQ1taZ5oL1aEDmbSDFKh4M536eOEzgVIH6QT96TEf1ZylIX7J2/vl8xpJIn/ztlYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FyAlzLg4eiUMmNjs0iVfJGVtcLxw5qLpo6zkpnsvvg=;
 b=vomyJzeE5Q1jTPZk5w96EUwQ/A5BrGbco9ttdhWUe6ClUwUZT77tg+JqVT6xJL+Pw4pHs9/rIYO8GCEc3Moyw9mkk3ThwS9M1zznoE5ypCBAM5LB6/G/7TFSO2gUjJuuMq08pki06nn6VhHxCxCzhs4Jrx7agfBCbw8DS/7V1c7YRUctSyvc38otvGV88lRYufaE5ViMRRZGUA5Yi4G6RFuL8jlLNSPT1RsBJX/ik9iVxisiS+UupTk33l6XzZy3197BmoG1MzNoBJce5I+CxpoVGWmyGys5JjyCicujYxSSX0hzMW8UhWa8SmvpB0S6F35uL+yXl+sHbgBZ4dwbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FyAlzLg4eiUMmNjs0iVfJGVtcLxw5qLpo6zkpnsvvg=;
 b=rBb/sBw6QSe554fMLA5+Z3S+SXlZlqGgEcvR0EML+WHDYwsQn9izcBUNd2j+AhTh2kfoXfv5648FQmAO2bud0fZx3XJ+O9yrilr16qMtOkImhcYKrg6jkSvXW9ObJFceU4r830cM2jd2CZhA7SorS+lJXERVvKV8HjVEUpRbAvcepZMahitB7yxKWauwKPy1XselEJ+GGke5inztqSQDP6mJfqCynIjHnfImSHzEs0VppkxFGmEdauTJAW4xrG4gOzrmgy1bL8CvMMC3+QMa3RlQj9I5pIqb1sPsYkV4+pStfJLa0g+Vdp6pWYqSmGUT/psNpyWzAXVoeo1GPqoayg==
Received: from DM6PR18CA0001.namprd18.prod.outlook.com (2603:10b6:5:15b::14)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:40 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::d5) by DM6PR18CA0001.outlook.office365.com
 (2603:10b6:5:15b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:23 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 12/12] gpu: nova-core: add PIO support for loading firmware
 images
Date: Mon, 8 Dec 2025 17:18:01 -0600
Message-ID: <20251208231801.1786803-13-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e03bed-f188-4211-387b-08de36b01f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zAPXGu3nVr1dcPi2bbviiXti4PwmVzi5m9yHPVCA6bbT5MWyFQstB4WwWYVq?=
 =?us-ascii?Q?aAzqwJxYkVVaLvm+0aYO5KhXtgJux5TejhVyZ6xMIL1hDBlUCpXJBQEiLsTw?=
 =?us-ascii?Q?k5zRqAkjTbxmGDOvwiRDYUxRD6cwayHcTZslMDJjrTgHlMZabXwmJ3der8Pp?=
 =?us-ascii?Q?/uN2fNaTdbB0jE/ktfZAUGMbFwJPAxX8mAwivchM1BXppK/IiwMtgIuDFYhp?=
 =?us-ascii?Q?5cj3pbGrlakicbAnuau8zMfrtmdnDFaRZgvZpcm4bnHvQgTD4YwDVNAHIkNH?=
 =?us-ascii?Q?BuDopcaqZbuSezZRAff9I3j9tW3d7OTLpYUttKwxXk2165Yn0WjQbuER2J3h?=
 =?us-ascii?Q?C3LMOKWCsKgSvUfbnpRPXX6bpyK8idIXXKGvmbaXaYQq2SPuRGnUsiJv7GB4?=
 =?us-ascii?Q?/uHtq4Cj7AaWXI2J2UprTlmkquidxlzYlpSyAyozZ+dDFxMFW5VscCZERkLQ?=
 =?us-ascii?Q?KJKhIeJDwd5gSpf0XvyFmCxIcwLdixR99HvY7PIh10QuX+476Y91EX7V9/w1?=
 =?us-ascii?Q?b16MKMhImKm4aJ03ynSAU8pSFSzKkUS6U8s22/p/R83oaAnRwBILfap2Dn1M?=
 =?us-ascii?Q?lToa/lsAoJ1rK4lOheufZThpmcnmUrQbNiOotHpnrufM5qawPghnK5ZuuxvT?=
 =?us-ascii?Q?TyVjtmMGk/cvPo0WIDi66bk7145qrCByf/OQmys94XVxsQYrFOTSM8RewKnV?=
 =?us-ascii?Q?+CIdvpYCEzlrNGrPBogylCvyTKM9UgnrpxAf0JVsbE2J3kNN0sYknUg4wth9?=
 =?us-ascii?Q?VSC9Yt1b6l3ucegAS1SMpNoON7ORABR8kyO2/pD/ZuedzZygjKsEwVpgMk5M?=
 =?us-ascii?Q?tgigCgt8/fEv027Mh2av4NalCB1n/YUxDybCpTfLMPPadGNNOqubbiLyrkMQ?=
 =?us-ascii?Q?nk1EwXCiBLA315E2+PzGS49CaN/hOUIAt1Fv0CZBIu7gHWfX1b7YvmaSep5o?=
 =?us-ascii?Q?jbEj1UzLFYFq0O2cagRoJV6aTCblzaS0FDar6CR/OHOr5mI5xjK9WkMc8FFD?=
 =?us-ascii?Q?ZB4VeDLHMqndjDt4As3AEqRqqo82m81QJ+PWdtP1CfRRt2z54gECMfuLdKj6?=
 =?us-ascii?Q?g+ArdDB1+BZz96asyo5Pwhsd2YnJkNvO51r5Fm0Exs5D8Vz5J5MDX3f+zVMl?=
 =?us-ascii?Q?YihIlcfLjObhjdGv//sFgSiZNBoPwatg6S3meFUDTaykx0LmzUNfmfqCbg9T?=
 =?us-ascii?Q?x3c++vHK0mEvgiMhGOdX2sRf3YhAhT5QioTL5JKwrPWapds2jf0pLOX+8TOR?=
 =?us-ascii?Q?E+oqn5Kn2SOa9DYVivwY8nfK6gLQdFHTU3V8JVOFRntJd/npyIM/jqkZZf+0?=
 =?us-ascii?Q?FjKmSkaLFF4OGeVJ9hTZhXQeh3sI/U2kIrYzb8pTeWCk5Z2LwyFy4m34bEa9?=
 =?us-ascii?Q?Xkm81NauPUmaD91ae698Fr1FA+WG3GEeS1eVDXrsjyZM/gN+XaMHPvnlA30p?=
 =?us-ascii?Q?8dze1uTx9RCwHeZjikEzc/2B4nVoVGSO28FKgLZr3XctSoT16F9EQB9Yw586?=
 =?us-ascii?Q?9g75d8GiTPfpLfm3GkZX0g8yhY4A4PV0EaxghFxhMKeQmaLmTPdmA8uqJuug?=
 =?us-ascii?Q?NNQLfZ2XYkcvkamTO0E=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:40.0365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e03bed-f188-4211-387b-08de36b01f5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
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

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

A new firmware called the Generic Bootloader (as opposed to the
GSP Bootloader) is used to upload FWSEC.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         | 157 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs       |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 142 ++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
 4 files changed, 304 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2770d608a2cf..a303ebfca390 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,11 +15,16 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -406,6 +411,158 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Write a byte array to Falcon memory using programmed I/O (PIO).
+    ///
+    /// Writes `img` to the specified `target_mem` (IMEM or DMEM) starting at `mem_base`.
+    /// For IMEM writes, tags are set for each 256-byte block starting from `tag`.
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_bytes(
+        &self,
+        bar: &Bar0,
+        img: &[u8],
+        mem_base: u16,
+        target_mem: FalconMem,
+        port: u8,
+        tag: u16
+    ) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if img.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let port = usize::from(port);
+
+        match target_mem {
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                regs::NV_PFALCON_FALCON_IMEMC::default()
+                    .set_secure(target_mem == FalconMem::ImemSecure)
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                let mut tag = tag;
+                for block in img.chunks(256) {
+                    regs::NV_PFALCON_FALCON_IMEMT::default()
+                        .set_tag(tag)
+                        .write(bar, &E::ID, port);
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                    tag += 1;
+                }
+            },
+            FalconMem::Dmem => {
+                regs::NV_PFALCON_FALCON_DMEMC::default()
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                for block in img.chunks(256) {
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_DMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                }
+            },
+        }
+
+        Ok(())
+    }
+
+    fn pio_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        target_mem: FalconMem,
+        load_offsets: &FalconLoadTarget,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        let start = usize::from_safe_cast(load_offsets.src_start);
+        let len = usize::from_safe_cast(load_offsets.len);
+        let mem_base = u16::try_from(load_offsets.dst_start)?;
+
+        // SAFETY: as_slice() ensures that start+len is within range
+        let data = unsafe { fw.as_slice(start, len).map_err(|_| EINVAL)? };
+
+        self.pio_wr_bytes(bar, data, mem_base, target_mem, port, tag)
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>
+    ) -> Result {
+        let imem_sec = fw.imem_sec_load_params();
+        let imem_ns = fw.imem_ns_load_params().ok_or(EINVAL)?;
+        let dmem = fw.dmem_load_params();
+
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default()
+            .write(bar, &E::ID);
+
+        // If the Generic Bootloader was passed, then use it to boot FRTS
+        if let Some(gbl) =  gbl {
+            let dst_start = u16::try_from(0x10000 - gbl.desc.code_size)?;
+            let data = &gbl.ucode[..usize::from_safe_cast(gbl.desc.code_size)];
+            let tag = u16::try_from(gbl.desc.start_tag)?;
+
+            self.pio_wr_bytes(bar, data, dst_start, FalconMem::ImemNonSecure, 0, tag)?;
+
+            // This structure tells the generic bootloader where to find the FWSEC
+            // image.
+            let dmem_desc = BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: fw.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: fw.dma_handle() + u64::from(dmem.src_start),
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            };
+
+            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+
+            self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0, 0)?;
+        } else {
+            self.pio_wr(bar, fw, FalconMem::ImemNonSecure, &imem_ns, 0,
+                u16::try_from(imem_ns.dst_start >> 8)?)?;
+            self.pio_wr(bar, fw, FalconMem::ImemSecure, &imem_sec, 0,
+                u16::try_from(imem_sec.dst_start >> 8)?)?;
+            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0, 0)?;
+        }
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, &E::ID);
+
+        Ok(())
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
     /// `target_mem`.
     ///
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 81ca2429ccc2..6c9597dfb17d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -31,7 +31,7 @@
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
-fn request_firmware(
+pub(crate) fn request_firmware(
     dev: &device::Device,
     chipset: gpu::Chipset,
     name: &str,
@@ -285,7 +285,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
 /// Header common to most firmware files.
 #[repr(C)]
 #[derive(Debug, Clone)]
-struct BinHdr {
+pub(crate) struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
     /// Version of the header.
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 36ff8ed51c23..159aedd221e8 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,12 +40,15 @@
         FalconLoadTarget, //
     },
     firmware::{
+        FIRMWARE_VERSION,
+        BinHdr,
         FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
     },
+    gpu::Chipset,
     num::{
         FromSafeCast,
         IntoSafeCast, //
@@ -213,6 +216,72 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+	/// Starting tag of bootloader.
+	pub start_tag: u32,
+	/// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+	pub dmem_load_off: u32,
+	/// Offset of code section in the image.
+	pub code_off: u32,
+	/// Size of code section in the image.
+	pub code_size: u32,
+	/// Offset of data section in the image.
+	pub data_off: u32,
+	/// Size of data section in the image.
+	pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+	/// Reserved, should always be first element.
+	pub reserved: [u32; 4],
+	/// 16B signature for secure code, 0s if no secure code.
+	pub signature: [u32; 4],
+	/// DMA context used by the bootloader while loading code/data.
+	pub ctx_dma: u32,
+	/// 256B-aligned physical FB address where code is located.
+	pub code_dma_base: u64,
+	/// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+	pub non_sec_code_off: u32,
+	/// Size of the non-secure code part.
+	pub non_sec_code_size: u32,
+	/// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+	pub sec_code_off: u32,
+	/// Size of the secure code part.
+	pub sec_code_size: u32,
+	/// Code entry point invoked by the bootloader after code is loaded.
+	pub code_entry_point: u32,
+	/// 256B-aligned physical FB address where data is located.
+	pub data_dma_base: u64,
+	/// Size of data block (should be multiple of 256B).
+	pub data_size: u32,
+	/// Arguments to be passed to the target firmware being loaded.
+	pub argc: u32,
+	/// Number of arguments to be passed to the target firmware being loaded.
+	pub argv: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDmemDescV2 {}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +290,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -275,7 +346,19 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        0
+        match &self.desc {
+            FalconUCodeDesc::V2(_v2) => {
+                // On V2 platforms, the boot address is extracted from the
+                // generic bootloader, because the gbl is what actually copies
+                // FWSEC into memory, so that is what needs to be booted.
+                if let Some(ref gbl) = self.gen_bootloader {
+                    gbl.desc.start_tag << 8
+                } else {
+                    0
+                }
+            },
+            FalconUCodeDesc::V3(_v3) => 0,
+        }
     }
 }
 
@@ -376,6 +459,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -432,9 +516,49 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)
+        } else {
+            Err(ENOENT)
+        };
+
+        let gbl = match gbl_fw {
+            Ok(fw) => {
+                let hdr = fw.data()
+                    .get(0..size_of::<BinHdr>())
+                    .and_then(BinHdr::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let desc_offset = usize::from_safe_cast(hdr.header_offset);
+                let desc = fw.data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = usize::from_safe_cast(hdr.data_offset);
+                let ucode_size = usize::from_safe_cast(hdr.data_size);
+                let ucode_data = fw.data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader {
+                    desc,
+                    ucode,
+                })
+            },
+            Err(_) => None,
+        };
+
         Ok(FwsecFirmware {
-            desc: desc,
+            desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -449,9 +573,17 @@ pub(crate) fn run(
         falcon
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
-        falcon
-            .dma_load(bar, self)
-            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+
+        // If the Generic Bootloader was found, then upload it via PIO , otherwise
+        if let Some(ref gbl) = self.gen_bootloader {
+            falcon
+                .pio_load(bar, self, Some(gbl))
+                .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+        } else {
+            falcon
+                .dma_load(bar, self)
+                .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+        }
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..fda01afda9ed 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -48,6 +48,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -65,6 +66,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -147,7 +149,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -186,7 +188,11 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        if sec2_falcon.supports_dma() {
+            sec2_falcon.dma_load(bar, &booter_loader)?;
+        } else {
+            sec2_falcon.pio_load(bar, &booter_loader, None)?;
+        }
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
-- 
2.52.0

