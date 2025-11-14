Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176BC5F961
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00BB10EB47;
	Fri, 14 Nov 2025 23:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hcwtjRbi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD5310EB47
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaieFUltbuALC9sUsvS2iAneixU1vAbaNc/SfgR0P2qJIsk2yrRAnkDkb72Tk2sEjoYTsbCVmXZ25f2oWUMGVRzqNPf5KKRTA5m3nsbuu3hMx6+tZsIS1CHbaDQMGS0quWIT8mRkudHlH66g1clm+RpcV3wR1PDe+eXsrQ3kurxiwQOgKyrJ8I4c/V6gqRRLu1dZppSAtVLSLhHoyXeTcdKCWKVhMiCRyy649428ZnzR8hozuuNW5qrZOhnUCBdaORZ3kMvcmH9S2upJ/fuDwFuo44bqXtsYGCyyi/Oi9l2QBRM+T+isT/Ryf+AryYQqvYAFt5nkc0SeI5d4dn3Fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn1mE4tog84N7jqV2iq9Zg3OXO1T5QHwfN5MlZjNYDk=;
 b=iSw8qkQTD8smk0LyODAtRK0N5pU1v1Zgeo28J/RHsN+9Dxk4It6rw0WpcoU8uNn3hBP+xKh0x1wVsjAJakRtDv2jnyQzy0Ij/YA1wEAom+juo7Vrcfw3xlLby8M4hHIZOV7h5+IzpBFk3EGtfBngMmKnGzB+sdTTvP0yAayxUN3QQ14j93K19PUuClJTop1ca+dMEKbEsLapob0uOOCorBitytXqPEZHLcso0KixejgqA/5RQrgosOs4onTqAKJsXnPhJoAZlCzz+D92/vkOy2e9FjoZy8im1q3lmBYIxQ3nF4MMHl/OgliqYHnKnJ2fgehnDWsMa7aJXSd3KUYDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn1mE4tog84N7jqV2iq9Zg3OXO1T5QHwfN5MlZjNYDk=;
 b=hcwtjRbiNINH/IIkcTpE3lncZC57NnSJ3dakYpI8/G++V5ns6mhqFaHR9Aumj7pgutye0h3KGYeSVZI2od70I8h0le6HmWrpPmeheinPPoWFU6M8rPjRKSIpujIBiUqG8Upd5/KJXEjYcsdOYZNwcTV7f696E0fsPC3WshNVciM+8T4hrmZSJcJjMRs21gV5nO2zT6jgzcR2B6D2S5HDieBAH3tgSNeVSRnoBDX6x5tSNso5EOfw2hClOys0toBl8q49k782lyh7A/fTbni4ClADh2IgcYyXiQN3fqI1KeGaOQaHybBfjOlArwXwjOdvotDF5t1NW993rkTc6IZ5Ow==
Received: from CH2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:59::26)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:24 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::e3) by CH2PR03CA0016.outlook.office365.com
 (2603:10b6:610:59::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:05 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 11/11] gpu: nova-core: add PIO support for loading firmware
 images
Date: Fri, 14 Nov 2025 17:30:44 -0600
Message-ID: <20251114233045.2512853-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: d0370e90-fe37-49a8-b3f3-08de23d5ec91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kz9om/NibAr7knuImbvJTf42fBOJkcCW8V+Nudth3zZIk/ZsZOHJpoRYT3qz?=
 =?us-ascii?Q?d5YanmeLPuce9MBzkxYgsWjH1pJYvoJLs3ZGuT7PxDdKbRwJYRGsbQ3niBwF?=
 =?us-ascii?Q?5H7ZPiU+GoDQQUs4fVlxMu05+01HZkDmKCDicKC4dEJvdclWkfnWvIcgCN0x?=
 =?us-ascii?Q?hc5Nnqpf1WAc9NVVzbpAvRc1SU8tk4AyH3S3duLKd18s+/VfOwSLW4SXlqHt?=
 =?us-ascii?Q?wp8dIzpcQLfyYOMz+a/os1t0Ogk+CLQvzII5fmbi/rdMTU6Ko1DsTQnbN+PB?=
 =?us-ascii?Q?hw+oVHAthyxlza8EfrOoEQWqCQQzoRHDYYkNaPMnMc1k2s/Eo2nXDpqn/rOj?=
 =?us-ascii?Q?myk2GIFk+7SR292qMh8wBCAmsWxWwdLLYRUk9TytZouGeyKaYzYkbaqL1E/K?=
 =?us-ascii?Q?CDjMD84u0Gpny/tB0f6SSbSGPgpWIirdfvQMQvovJuaIO2MeAl0Lb1K+gXil?=
 =?us-ascii?Q?8ruJPlGKG2wfM7r8FYjzAfdcsrh3iO8CH5alyz6gEdJds/hR05mTaklcMSEL?=
 =?us-ascii?Q?jz2JLD5+2FbR/iFjzwTgKwmDJmWZVvFSdEvJ/PKOkZImZtGHiSx8ft2PtuEu?=
 =?us-ascii?Q?Yh1WGco5mbd7x38Puxv3PcVZ7ctr/FBo4AnFaJw/p35oQCEyO1VhF3qb8CVD?=
 =?us-ascii?Q?pLbMSq1mjKU1DNN5FqzsmFCdyHh9lanTdDHD3LV2N+eR3o0IaDEZd8hutMGi?=
 =?us-ascii?Q?rAheKGCieiK7qpD9aZSUWV/GEmLpv9NI4eGAprX9tA1QqroWqOqdgvLMxe7I?=
 =?us-ascii?Q?XC6sj/8xxP/V0cg1gjwRA9HfHLIQ8r3L/Ti0ZYSthxYOIUQt0s4xEVOYmMdT?=
 =?us-ascii?Q?qegdRV8wH3UVmei9RL4CEtptxtyHV4rTSh4tW7rg9/T0o9ChTWqJNGIV/AMN?=
 =?us-ascii?Q?0crqBeFu1WvbiYn7R6EwiggS9+kY6FReqeZrWNcWZENSoXJ/u+FL5FVKDtYN?=
 =?us-ascii?Q?Tv/MRm57zd0TfMkvQ+3p/k/IYiAAe8OsKdAHAtnlvjxeZ+lZ5Av/dKAvyaBI?=
 =?us-ascii?Q?C2xFqZ+2ytgJ3KJGRsNUjaD98fgN5zEiQ1MoNAgTxRsxLiUh3U8sOiqjU0z2?=
 =?us-ascii?Q?b/IisFloNH6zqCuFjB/CYJ055liVlvlPwgkZ2edslN9tUoAIzGFevRQmMKM3?=
 =?us-ascii?Q?JMqpp7lxEsHnARhA8wavb7hwesIffsBNl6241uFAkwojAtclozUSGDrk0/9y?=
 =?us-ascii?Q?Fv3ufDrW+wToZckqhtlLxwh0WuXy9rXaQJ9E0/2UtA85BDstqdPGQExcDp+i?=
 =?us-ascii?Q?lgwXwZFWd+zMKa+EThThSdd333oWHoWb3JElD1gZUW0Pe6401ceP1vYFjGk7?=
 =?us-ascii?Q?gbDv70v72f/6J0ZY7/nPpArGAxXNvH/xOen3ekoLvOV8o89fPjAOWLrpN4OZ?=
 =?us-ascii?Q?TEnuJ7eYQsdLSYaW/hrM1P/lDIlQ2kgfcf/C4jRDqW/8cgF9EOV/84xboC4b?=
 =?us-ascii?Q?wRsF3IfwzwG0GUnJsLYX0T+peFQoLVVbLkJLSGqDwuow59Z1VvlgAmAzBpwb?=
 =?us-ascii?Q?kOOTh/1dw+gVnMf5SrMqPUcSGsYc1+XofQd2VkhtjJxoB6Bvxni2rbcL9kiI?=
 =?us-ascii?Q?Rz66UCseD73Y/HFh8TI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:23.5744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0370e90-fe37-49a8-b3f3-08de23d5ec91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586
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
 drivers/gpu/nova-core/falcon.rs         | 181 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs       |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 112 ++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
 4 files changed, 299 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7af32f65ba5f..f9a4a35b7569 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -20,6 +20,10 @@
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
@@ -400,6 +404,183 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+
+    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconFirmware
+    fn pio_wr_bytes(
+        &self,
+        bar: &Bar0,
+        source: *const u8,
+        mem_base: u16,
+        length: usize,
+        target_mem: FalconMem,
+        port: u8,
+        tag: u16
+    ) -> Result {
+        // To avoid unnecessary complication in the write loop, make sure the buffer
+        // length is aligned.  It always is, which is why an assertion is okay.
+        assert!((length % 4) == 0);
+
+        // From now on, we treat the data as an array of u32
+
+        let length = length / 4;
+        let mut remaining_len: usize = length;
+        let mut img_offset: usize = 0;
+        let mut tag = tag;
+
+        // Get data as a slice of u32s
+        let img = unsafe {
+            core::slice::from_raw_parts(source as *const u32, length)
+        };
+
+        match target_mem {
+            FalconMem::ImemSec | FalconMem::ImemNs => {
+                regs::NV_PFALCON_FALCON_IMEMC::default()
+                    .set_secure(target_mem == FalconMem::ImemSec)
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port as usize);
+            },
+            FalconMem::Dmem => {
+                // gm200_flcn_pio_dmem_wr_init
+                regs::NV_PFALCON_FALCON_DMEMC::default()
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port as usize);
+            },
+        }
+
+        while remaining_len > 0 {
+            let xfer_len = core::cmp::min(remaining_len, 256 / 4); // pio->max = 256
+
+            // Perform the PIO write for the next 256 bytes.  Each tag represents
+            // a 256-byte block in IMEM/DMEM.
+            let mut len = xfer_len;
+
+            match target_mem {
+                FalconMem::ImemSec | FalconMem::ImemNs => {
+                    regs::NV_PFALCON_FALCON_IMEMT::default()
+                        .set_tag(tag)
+                        .write(bar, &E::ID, port as usize);
+
+                    while len > 0 {
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(img[img_offset])
+                            .write(bar, &E::ID, port as usize);
+                        img_offset += 1;
+                        len -= 1;
+                    };
+
+                    tag += 1;
+                },
+                FalconMem::Dmem => {
+                    // tag is ignored for DMEM
+                    while len > 0 {
+                        regs::NV_PFALCON_FALCON_DMEMD::default()
+                            .set_data(img[img_offset])
+                            .write(bar, &E::ID, port as usize);
+                        img_offset += 1;
+                        len -= 1;
+                    };
+                },
+            }
+
+            remaining_len -= xfer_len;
+        }
+
+        Ok(())
+    }
+
+    /// See nvkm_falcon_pio_wr
+    fn pio_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        target_mem: FalconMem,
+        load_offsets: &FalconLoadTarget,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        // FIXME: There's probably a better way to create a pointer to inside the firmware
+        // Maybe CoherentAllocation needs to implement a method for that.
+        let start = unsafe { fw.start_ptr().add(load_offsets.src_start as usize) };
+        self.pio_wr_bytes(bar, start,
+            load_offsets.dst_start as u16,
+            load_offsets.len as usize, target_mem, port, tag)
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
+            let load_params = FalconLoadTarget {
+                src_start: 0,
+                dst_start: 0x10000 - gbl.desc.code_size,
+                len: gbl.desc.code_size,
+            };
+            self.pio_wr_bytes(bar, gbl.ucode.as_ptr(),
+                load_params.dst_start as u16, load_params.len as usize,
+                FalconMem::ImemNs, 0, gbl.desc.start_tag as u16)?;
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
+                data_dma_base: fw.dma_handle() + dmem.src_start as u64,
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
+            self.pio_wr_bytes(bar, &dmem_desc as *const _ as *const u8, 0,
+                core::mem::size_of::<BootloaderDmemDescV2>(),
+                FalconMem::Dmem, 0, 0)?;
+        } else {
+            self.pio_wr(bar, fw, FalconMem::ImemNs, &imem_ns, 0,
+                u16::try_from(imem_ns.dst_start >> 8)?)?;
+            self.pio_wr(bar, fw, FalconMem::ImemSec, &imem_sec, 0,
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
index 5ca5bf1fb610..ecab16af0166 100644
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
@@ -252,7 +252,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
 /// Header common to most firmware files.
 #[repr(C)]
 #[derive(Debug, Clone)]
-struct BinHdr {
+pub(crate) struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
     /// Version of the header.
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 36ff8ed51c23..39fe23dab4bf 100644
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
@@ -213,6 +216,44 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+	pub start_tag: u32,
+	pub dmem_load_off: u32,
+	pub code_off: u32,
+	pub code_size: u32,
+	pub data_off: u32,
+	pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+	pub reserved: [u32; 4],
+	pub signature: [u32; 4],
+	pub ctx_dma: u32,
+	pub code_dma_base: u64,
+	pub non_sec_code_off: u32,
+	pub non_sec_code_size: u32,
+	pub sec_code_off: u32,
+	pub sec_code_size: u32,
+	pub code_entry_point: u32,
+	pub data_dma_base: u64,
+	pub data_size: u32,
+	pub argc: u32,
+	pub argv: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl kernel::transmute::FromBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +262,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -275,7 +318,19 @@ fn brom_params(&self) -> FalconBromParams {
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
 
@@ -376,6 +431,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -432,9 +488,49 @@ pub(crate) fn new(
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
+                let desc_offset = hdr.header_offset as usize;
+                let desc = fw.data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = hdr.data_offset as usize;
+                let ucode_size = hdr.data_size as usize;
+                let ucode_data = fw.data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader {
+                    desc: desc,
+                    ucode: ucode,
+                })
+            },
+            Err(_) => None,
+        };
+
         Ok(FwsecFirmware {
             desc: desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -449,9 +545,17 @@ pub(crate) fn run(
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
index eb0ee4f66f0c..ff53d58c1df6 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -44,6 +44,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -61,6 +62,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -143,7 +145,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -182,7 +184,11 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        if chipset > Chipset::GA100 {
+            sec2_falcon.dma_load(bar, &booter_loader)?;
+        } else {
+            sec2_falcon.pio_load(bar, &booter_loader, None)?;
+        }
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
-- 
2.51.2

