Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B41C999E7
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB410E4EA;
	Mon,  1 Dec 2025 23:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="exX9OLqP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C710E4DF
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqhrQAJn3FQ35jIfycdws9dM9UnCkMJIflLy9XEtM7T1mmYbIi7Ooh3TEdr3Q3vd0jy6hBi9UQ9D4b7C6HSv77UCJOa8s5HVowtAbXYiRFaX476qWWOhSF5Krg0arOkcOV8JL6j0YwACAS1NRMCyP6+Eh0fye1iKJUFNY7lgVcKdka87VlcSJGNmzuMpKts1vPDWFn9G//XbGE3BjLZhWRjQkU7t+gCJ4Q1LX9hcLQrH2gEZSAZ9kqrq3BbloC4LdB6JfAZTXg59TqlM1v6aMsP0rkLv0/4ds4Cs08Uxpqn3W2XfVGbyn7EZVcOqFmgWpkJQFF574Hc6fgeStH/XoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsS4tiVgMvcCi9s1HA61+xiWHeaeG8S3wvqWmx8N22U=;
 b=sT/uQYnapmOo+JjVrZTxJfIVVVnxg3oywv73HlGhqIv3oITdpEZZpU5sUKu5OHPLcX8hqmZ9KB/VLmPAiWz1flZYFV4cyTKTG9wD8BzpxmPFeDPvVjY3EIgSH6ONOQ6vvroDLWHg+DkBBBmDE2mCLSixlEmmeg+4+qUmYtafhPXLU8zTDJbII9R906bkDzJWhgSPsbhHFKO69z5tbVaNQ1jOhAbzJK98IsO803rj5wXPTdIeOI31GOOhzJy5NNRSV3ehMesgK73C2tRqDHe/orSicrVu7cybssVitJ60mFokLWvxiMIl2dVXklVV7TDh13oUbAXrdM6IY9rV3WEhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsS4tiVgMvcCi9s1HA61+xiWHeaeG8S3wvqWmx8N22U=;
 b=exX9OLqPV/2HgOgU9J1apHJEUWYWvTzyRoU3yzXu7WKV45SWmzPX5UXLbOY6eOa9Kb53my5DbTW5hWnADnnM2syhn6RywNGyWJD3ODn+wMAFrCNexC+hALI6wuzQVhzxu9bMdzifpZBGoTRLaAKgwx5NSNqCmqaOKFY9bXMtd2e3FTzT+bchYbjgoJ7uSnQab6AppAAxFLpPSmECQlXzUrVxGBBe6laXV5TTY8rMiNqLSgXzU0v5qIgfZhRayxwgJfQCW4Pm7ns/kt0dbVTYqP+ND5/bb2xVDbN9/lG8wJma1LvU20TUX4I3YlQQ2b3g2h1U1hucCYCkAD+BQwdl6w==
Received: from DS7PR03CA0230.namprd03.prod.outlook.com (2603:10b6:5:3ba::25)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:29 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::9c) by DS7PR03CA0230.outlook.office365.com
 (2603:10b6:5:3ba::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.15 via Frontend Transport; Mon,
 1 Dec 2025 23:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:12 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:11 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading firmware
 images
Date: Mon, 1 Dec 2025 17:39:21 -0600
Message-ID: <20251201233922.27218-13-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7d310e-a783-4241-5dee-08de313325a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aNGWV4/d1FJRxs54GrKchZtDPmnxbFm9ZwyQlw8nQ/9fGfMSBL6j9F0RmfVs?=
 =?us-ascii?Q?+ebd8hG4C2W6Tj0yIkN2uiRNQCu/MMIExFVk28Bc/tAPaI40h/YAR9vCZtS8?=
 =?us-ascii?Q?PPY53ZPr5yotlTaBejzp9CYT8HLr7sbs7XZo2LqSpqzs9SlpI/3yK+fikxxa?=
 =?us-ascii?Q?qKqMzvBy3SZm+RykPed+Ff6D2XzM3MImMwZGAw09QkpRKKr7kCvLozsfVKfQ?=
 =?us-ascii?Q?Upq8Lqc5GqfJfh3f0yyRcmuvKR+3I9JYzv2mFWb3GH7txXfKetaMv8fPd1gv?=
 =?us-ascii?Q?kHV4BPUG/05h+1vGXFWENz1LLn8pulBb2skai+FNVBzYdPZ7naFN/KGkSxl5?=
 =?us-ascii?Q?vECch1E/98gqxvERyjsbZAsm2qsdb8DCJsfIZozgohuJ/WbSvocsdlC++XaQ?=
 =?us-ascii?Q?9WKeKc5PuvdGtZ9XW13fSA3Bfau92Kv4GIeRCTsSEyWPDEWkg23OnasZt0TU?=
 =?us-ascii?Q?XSlhg6uY4CgVGGTz5Wm4RONIgEqjzYKsWgrIEUuFkaPRdhqywj7Rom/fI71m?=
 =?us-ascii?Q?1Aq4lXxNvcwavVBvglLcUkgPA0Tb2eHoY+emvNkEue8CZxU0FFyVpDvkoyyy?=
 =?us-ascii?Q?05Lw/dDSc84X1GFrqAKSEVK1lKgsCw7cc/IzI+qkIBQX8vW95vJ3/HHKfecR?=
 =?us-ascii?Q?M0IxVLg5lk7t/NkHmmpbBdItZf7vaqzHccRronBu4cIA1NF8PYavvUJInZTp?=
 =?us-ascii?Q?WxZxBCSZiwixRMQgUZfwi++2QFurRIIuoSmJQOMaqSf4Yewp51XyF/DGKRkm?=
 =?us-ascii?Q?fi8bNtJf/v+wCyMMquH4OaarWcqea4uumAmiOk3YE2ZxmLIdpnre8uVSu2gn?=
 =?us-ascii?Q?SBLhC4QeWc7vhcx4Gug/Hg47DRa2ZcCwfLCKR5HCS4cDeE8JouP4dknOH8oW?=
 =?us-ascii?Q?EGmGvLq05V5UMd80LXzjJIqh0hX+2nmuR2PFv0EDM9gOVD124lqisQFSXRcN?=
 =?us-ascii?Q?ou52wqFnrXTerCXE+KY12XHgyqHJhRZLr12GQBNgDyj7WXTpTKgAshFj81TJ?=
 =?us-ascii?Q?LPd943gKgKVFke/fwNJrHERNNFNdjsZoUJMljQL8kml5F/agRP0jexm5Z9Z8?=
 =?us-ascii?Q?V1WOod18s8ZgflPodfSCLQVrXEBVA7sjYA26n3Ts9s362dHMvMRHwraEAYsG?=
 =?us-ascii?Q?0gAw91D4wHtOLoi0NZ58SmYZwAbfGw/bt8LFugFjwqdZLLglOhWU1prg1auf?=
 =?us-ascii?Q?nwthToLZjlx56N/iB3KSX4qXP7n7CHQpa+oO8pdjtkuc6SCQn2XY3DxuSY94?=
 =?us-ascii?Q?9u8JMhhnVrDgQuN0eK964kFRDkZ7W+vsW3/rq7mVRd5x4NUxuXYXWYoxK/jf?=
 =?us-ascii?Q?2TcVdW9R8PGJcrGklA0zRyBowxJt8jPKd7IT/sO21UVHLcDBi5aS8JENBls1?=
 =?us-ascii?Q?EouLzoxYHcvQ0nvoa8zC0D7PyLys85npCfKy/Hu3XnYMG6EHbfjs9RGY+9Ce?=
 =?us-ascii?Q?BpHHUcQpnYHWW26GNA9vR+Wt4jigqvNLfOnhFOSD85bt+PAanNN7ioa7Aymk?=
 =?us-ascii?Q?U/CO/guSnJ7rsPy0RWAAct0UzHX6hGVxz8XvIvOSpckrmRY567hT3+gLxeiG?=
 =?us-ascii?Q?KY35Y26VafXafroKt8o=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:27.6283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7d310e-a783-4241-5dee-08de313325a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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
 drivers/gpu/nova-core/falcon.rs         | 149 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware.rs       |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 142 +++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
 4 files changed, 293 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2770d608a2cf..88f65ee7805a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -12,14 +12,17 @@
     io::poll::read_poll_timeout,
     prelude::*,
     sync::aref::ARef,
-    time::{
-        Delta, //
-    },
+    time::Delta,
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
@@ -406,6 +409,146 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+
+    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconFirmware
+    fn pio_wr_bytes(
+        &self,
+        bar: &Bar0,
+        img: &[u8],
+        mem_base: u16,
+        target_mem: FalconMem,
+        port: u8,
+        tag: u16
+    ) {
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
+                    for word in block.chunks(4) {
+                        let w = u32::from_le_bytes(word.try_into().unwrap());
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(w)
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
+                        regs::NV_PFALCON_FALCON_DMEMD::default()
+                            .set_data(u32::from_le_bytes(word.try_into().unwrap()))
+                            .write(bar, &E::ID, port);
+                    }
+                }
+            },
+        }
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
+
+        // SAFETY: as_slice() ensures that start+len is within range
+        let data = unsafe { fw.as_slice(start, len)? };
+
+        self.pio_wr_bytes(bar, data, u16::try_from(load_offsets.dst_start)?, target_mem, port, tag);
+
+        Ok(())
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
+        let imem_ns = fw.imem_ns_load_params().unwrap();
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
+            self.pio_wr_bytes(bar, data, dst_start, FalconMem::ImemNonSecure, 0, tag);
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
+            self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0, 0);
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
index 169b07ca340a..3008d18f9313 100644
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
@@ -258,7 +258,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
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

