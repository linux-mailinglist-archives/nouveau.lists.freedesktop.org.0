Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C045FC999DE
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FFB10E4E0;
	Mon,  1 Dec 2025 23:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IkNJCt3C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23A10E4E7
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIIdySaCEPlbs/YEpO8+IjbKY5DsOicLf0KdZrLYz/yum7BkI5N/SWge0JIiztMemV9krdpBgRnIjPitR+p85wvfpFB4eNYLFQovp41EhFWRGlLEL5EBKXdBfFisS9CoSIKYdqDidAKl8Ig5ckHVZ3ENV8iPUqVo57TNg0B8Mo5cws0bz/C2wye6FgbnjBhuBDUyN8SOn16oU07vlsy+wXU2RhfPJz/Wp2RyMHtYuyL0JRKVN+YsOFAhtygoewJH2boQQ5EpfPXnBYTteTdapUOQYlyveBSLRfsuz7LukNp95wjVMylp57IGXElyWNVHFWcd5erNgEov48RsVnqhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+adXkGZytkMnQpYirdO30G/nTbHy29nenLLQkto/9s=;
 b=Ng1l/GoXg5pHTkLPwlXQVeqaXkV5MaEOT0f6HHq6hgaHQ6HC7VZIdyJpEMqVXZZmPAEKAo7ffza+t+4bnlmGL+gxGBr5+SGnzk9VGXT+H8Byuw4M8vVCgbafbqiTFwmavUhGHEdPVQH555hdU/ZyFZtvPm6uWb38XpxFz8XnHOQZDiG88f9G98y/0ps0VArFkVDhrUE94KykAYTnmqpLRdt2cspF/b7QPwN3APBgpsMnI05/ul1TN3/8JhCSyy23qfSQUH2gi89lQq3kY9Y+N+NGe+L5gGZX8G3TJqICLML3fFdUgM7WxSwcStZzd8BJLnsc6Vtara7NRuwpim+lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+adXkGZytkMnQpYirdO30G/nTbHy29nenLLQkto/9s=;
 b=IkNJCt3Ct+g63r+7w0pkyOX0yQwNMGjgxPHyIT6oIx8Dnhs6kfCt+UXAUHF62VR3Pe5uoUlhV5YGHguy4Yu8vi5vtTu03c/oFDkBXV2Ld+r0pM0QgA0UAxNjIsSfEEanI24MoE6UfBSkPwZlEX4sfisPC5MogG/Kb/watZv8it/pJ841AQMO5oiIgmCM/rTJz8e3WRktLE+zGW/ybhEsWzAD2TqUggLLOzVZhdpBHckvB1hF6pNTXXDOiEX3A0/PxVhU2P9W645IQPP/2KmrZ03ivcTnWvYvt9kIHf6XXZHDPO+0/L8vhiGwbuB/19jiMAPdDYSeeSn94WxOMXZaaw==
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:24 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::c2) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 23:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:10 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:09 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 10/13] gpu: nova-core: add FalconUCodeDescV2 support
Date: Mon, 1 Dec 2025 17:39:19 -0600
Message-ID: <20251201233922.27218-11-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DM6PR12MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4214fa-6606-48d3-13e1-08de3133235d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x1H3bMn7gnJGUYjPYT0iP7B/0Cm8c7T+Z03nGEpk7g2zHTBsHvZ2gSrw+6fJ?=
 =?us-ascii?Q?lMap0tOIGqE+5duWsuUnGxous3Ht7hZY5JEzWN+U0B3i5UuYol/4CoEdYpTU?=
 =?us-ascii?Q?3SWDKhr/KtJAQtJ30NoNlVHSfH+tnOKlfyZMqffFau0M79tvpoOFk0RKWzmm?=
 =?us-ascii?Q?+f2FFpH3EPB4fBwm0fcbhA7kGQdiShpZN51SoyeSo2oZEvs5eaDTf1K+iDC2?=
 =?us-ascii?Q?+VuSmu4IPtUgJCvKMr6+IlvfmAzp8b6KglCB97gfnjRdg6mUlsfjaJZyCRcI?=
 =?us-ascii?Q?LGi1Agy6a01dGbXQNi1NlSDvqk8tE/8qQrbjiH4B7bxe+MOTaXCI4MmazFYJ?=
 =?us-ascii?Q?Z+b2+0Enstw+23dPI4V+EvYjroRwZqOciu66gFQJrYjhq/jGBWeANg6HsSfG?=
 =?us-ascii?Q?66lBJLeIte0B7py9kHCseY0AP/ebrUJCm3JW89nXtGmjLn31SaDIlMLyuELn?=
 =?us-ascii?Q?2zm8xkJYUMLUizx1BKkCW6cPDYk9eW5s1EwgNV6HARb4t8aWyxS+eIY6cXsI?=
 =?us-ascii?Q?3YChu70QbXSXz7YvnvJCgj7GnHOET0eEUwDuV+9vSXPGH+qcx8Do+MDlHIrM?=
 =?us-ascii?Q?EtcKxOudfCgUa0nD0NQiLLRNN7XTfuYod/1sxf7kpZ0OK0qwG/+j2bic5pjI?=
 =?us-ascii?Q?CQk7T2Dz/6XECPW6ADl2O1EstY/HJZ89RvPlZMXgqREagP/FUoYAR6Q2tYo8?=
 =?us-ascii?Q?/8s7DFiDyvaxVC+Dsnt8sMRPz5HUWo0boFZsKKwJSVjBkZoIgKlFnrjRjY2R?=
 =?us-ascii?Q?9FoezIxZC+XQMeVIoCGKKn4o4dOdUXaVveyUVt4Zh4xDI7L/MFp2nBFtJj9c?=
 =?us-ascii?Q?8nJsa/a7evlYDtMzlEPfa3q3oolwHdU9UKSH9UNa867w58OokkUyEdluy3Nt?=
 =?us-ascii?Q?m5AsvitMhNgiOBB3ZdK9rnHpYWAHHwBeZoItnYRf7SeYPpREuI6WrD1yav2D?=
 =?us-ascii?Q?6TL3a+Z2W04aXew7lylxFAt93I3EbVBYXcVMRe32kN1R0700IMouFYq4DTve?=
 =?us-ascii?Q?TfcXyAG7ofLG21KoFgsX3GwCpEaieoKQD4ulu/6GDdQJkGHlNZ9TPdVfvGzw?=
 =?us-ascii?Q?9PDzOVIHwLn205nI/Gq1RCdWbKkq5VR3vXdEj9aFXAV8alFc+rxgx1OFEU88?=
 =?us-ascii?Q?oJmx0gT8kDKbPT7AUhR0bKw5bBRQr2gk+fkx9oaaHzDx49ze/l9IG6heu8Z6?=
 =?us-ascii?Q?FesezR2ORXibrCoSuYBxrQAkHQUlh9eDQlxxjmuP13jLWJ0y6fp/oiyv3xFa?=
 =?us-ascii?Q?oAwoe/akPHg14nq0aM3vq+Wq1GqFGwSdSjDv2zFQX7ZwyPM16FbosmTBg8MB?=
 =?us-ascii?Q?S2XYMlozYlrD4YRuAg5oGTz71E7mXR/yM6/kaqtnYToM46HN0Nod2MzgoWge?=
 =?us-ascii?Q?5QI/dhKKi+AnysjFHFUJRw0mwuF0n7UuKQRDSqSoeiXgcxoikGffczTt0KHu?=
 =?us-ascii?Q?QyvzYin+xQl8rrHG8QWNMdKPKnKSnlX8hSXg/NU33eGtT7WBGM8u1ZWIy78l?=
 =?us-ascii?Q?eRUu0JAO1Pklv7vK1DpIz9FLzmSbB5lqwBW6OHDgexnKkrZ2D+FoPSQA/b+C?=
 =?us-ascii?Q?PFBGM5Vx63ThU/eXFyc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:23.7974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4214fa-6606-48d3-13e1-08de3133235d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
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

The FRTS firmware in Turing and GA100 VBIOS has an older header
format (v2 instead of v3).  To support both v2 and v3 at runtime,
add the FalconUCodeDescV2 struct, and update code that references
the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
encapsulates both.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 114 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  72 +++++++++------
 drivers/gpu/nova-core/vbios.rs          |  73 ++++++++-------
 3 files changed, 201 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..169b07ca340a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -43,6 +43,46 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV2 {
+    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header, compressed or uncompressed
+    stored_size: u32,
+    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
+    /// is not compressed.
+    pub(crate) uncompressed_size: u32,
+    /// Code entry point
+    pub(crate) virtual_entry: u32,
+    /// Offset after the code segment at which the Application Interface Table headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into 'IMEM'.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into 'IMEM'.
+    pub(crate) imem_load_size: u32,
+    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Virtual address of secure IMEM segment.
+    pub(crate) imem_sec_base: u32,
+    /// Size of secure IMEM segment.
+    pub(crate) imem_sec_size: u32,
+    /// Offset into stored (uncompressed) image at which DMEM begins.
+    pub(crate) dmem_offset: u32,
+    /// Base address at which to load the data segment into 'DMEM'.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into 'DMEM'.
+    pub(crate) dmem_load_size: u32,
+    /// "Alternate" Size of data to load into IMEM.
+    pub(crate) alt_imem_load_size: u32,
+    /// "Alternate" Size of data to load into DMEM.
+    pub(crate) alt_dmem_load_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV2 {}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
@@ -76,13 +116,83 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-impl FalconUCodeDescV3 {
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV3 {}
+
+#[derive(Debug, Clone)]
+pub(crate) enum FalconUCodeDesc {
+    V2(FalconUCodeDescV2),
+    V3(FalconUCodeDescV3),
+}
+
+impl FalconUCodeDesc {
     /// Returns the size in bytes of the header.
     pub(crate) fn size(&self) -> usize {
+        let hdr = match self {
+            FalconUCodeDesc::V2(v2) => v2.hdr,
+            FalconUCodeDesc::V3(v3) => v3.hdr,
+        };
+
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
+        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    }
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    pub(crate) fn imem_load_size(&self) -> u32 {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2.imem_load_size,
+            FalconUCodeDesc::V3(v3) => v3.imem_load_size,
+        }
+    }
+
+    pub(crate) fn interface_offset(&self) -> u32 {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2.interface_offset,
+            FalconUCodeDesc::V3(v3) => v3.interface_offset,
+        }
+    }
+
+
+    pub(crate) fn dmem_load_size(&self) -> u32 {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2.dmem_load_size,
+            FalconUCodeDesc::V3(v3) => v3.dmem_load_size,
+        }
+    }
+
+    pub(crate) fn pkc_data_offset(&self) -> u32 {
+        match self {
+            FalconUCodeDesc::V2(_v2) => 0,
+            FalconUCodeDesc::V3(v3) => v3.pkc_data_offset,
+        }
+    }
+
+    pub(crate) fn engine_id_mask(&self) -> u16 {
+        match self {
+            FalconUCodeDesc::V2(_v2) => 0,
+            FalconUCodeDesc::V3(v3) => v3.engine_id_mask,
+        }
+    }
+
+    pub(crate) fn ucode_id(&self) -> u8 {
+        match self {
+            FalconUCodeDesc::V2(_v2) => 0,
+            FalconUCodeDesc::V3(v3) => v3.ucode_id,
+        }
+    }
+
+    pub(crate) fn signature_count(&self) -> u8 {
+        match self {
+            FalconUCodeDesc::V2(_v2) => 0,
+            FalconUCodeDesc::V3(v3) => v3.signature_count,
+        }
+    }
+
+    pub(crate) fn signature_versions(&self) -> u16 {
+        match self {
+            FalconUCodeDesc::V2(_v2) => 0,
+            FalconUCodeDesc::V3(v3) => v3.signature_versions,
+        }
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index e4009faba6c5..36ff8ed51c23 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,7 +40,7 @@
         FalconLoadTarget, //
     },
     firmware::{
-        FalconUCodeDescV3,
+        FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
@@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
-    desc: FalconUCodeDescV3,
+    desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: 0,
-            dst_start: self.desc.imem_phys_base,
-            len: self.desc.imem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_sec_base,
+                len: v2.imem_sec_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v3.imem_phys_base,
+                len: v3.imem_load_size,
+            }
         }
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        // Only used on Turing and GA100, so return None for now
-        None
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_phys_base,
+                len: v2.imem_load_size - v2.imem_sec_size,
+            }),
+            // Not used on V3 platforms
+            FalconUCodeDesc::V3(_v3) => None,
+        }
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: self.desc.imem_load_size,
-            dst_start: self.desc.dmem_phys_base,
-            len: self.desc.dmem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: v2.dmem_offset,
+                dst_start: v2.dmem_phys_base,
+                len: v2.dmem_load_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: v3.imem_load_size,
+                dst_start: v3.dmem_phys_base,
+                len: v3.dmem_load_size,
+            }
         }
     }
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset,
-            engine_id_mask: self.desc.engine_id_mask,
-            ucode_id: self.desc.ucode_id,
+            pkc_data_offset: self.desc.pkc_data_offset(),
+            engine_id_mask: self.desc.engine_id_mask(),
+            ucode_id: self.desc.ucode_id(),
         }
     }
 
@@ -273,10 +294,10 @@ impl FalconFirmware for FwsecFirmware {
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(desc)?;
+        let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
+        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -303,7 +324,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_base).into_safe_cast(),
+                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
                 )
             }?;
 
@@ -317,7 +338,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
+                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
                 )
             }?;
 
@@ -364,11 +385,12 @@ pub(crate) fn new(
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
-        let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
-            let desc_sig_versions = u32::from(desc.signature_versions);
+        let ucode_signed = if desc.signature_count() != 0 {
+            let sig_base_img =
+                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
-                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
             dev_dbg!(
                 dev,
                 "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
@@ -402,7 +424,7 @@ pub(crate) fn new(
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
             let signature = bios
                 .fwsec_image()
-                .sigs(desc)
+                .sigs(&desc)
                 .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
 
             ucode_dma.patch_signature(signature, sig_base_img)?
@@ -411,7 +433,7 @@ pub(crate) fn new(
         };
 
         Ok(FwsecFirmware {
-            desc: desc.clone(),
+            desc: desc,
             ucode: ucode_signed,
         })
     }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index abf423560ff4..8144079f64f3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -19,6 +19,8 @@
     driver::Bar0,
     firmware::{
         fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDesc,
+        FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
@@ -1004,19 +1006,10 @@ fn build(self) -> Result<FwSecBiosImage> {
 
 impl FwSecBiosImage {
     /// Get the FwSec header ([`FalconUCodeDescV3`]).
-    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
+    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         // Get the falcon ucode offset that was found in setup_falcon_data.
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
-        // Make sure the offset is within the data bounds.
-        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
-            dev_err!(
-                self.base.dev,
-                "fwsec-frts header not contained within BIOS bounds\n"
-            );
-            return Err(ERANGE);
-        }
-
         // Read the first 4 bytes to get the version.
         let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
             .try_into()
@@ -1024,33 +1017,47 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
         let hdr = u32::from_le_bytes(hdr_bytes);
         let ver = (hdr & 0xff00) >> 8;
 
-        if ver != 3 {
-            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
-            return Err(EINVAL);
+        let hdr_size = match ver {
+            2 => core::mem::size_of::<FalconUCodeDescV2>(),
+            3 => core::mem::size_of::<FalconUCodeDescV3>(),
+            _ => {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
+                return Err(EINVAL);
+            }
+        };
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + hdr_size > self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "fwsec-frts header not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
         }
 
-        // Return a reference to the FalconUCodeDescV3 structure.
-        //
-        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
-        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
-        // in `BiosImageBase` is immutable after construction.
-        Ok(unsafe {
-            &*(self
-                .base
-                .data
-                .as_ptr()
-                .add(falcon_ucode_offset)
-                .cast::<FalconUCodeDescV3>())
-        })
+        let data = self.base.data
+            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
+            .ok_or(EINVAL)?;
+
+        match ver {
+            2 => {
+                let v2 = FalconUCodeDescV2::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V2(v2.clone()))
+            }
+            3 => {
+                let v3 = FalconUCodeDescV3::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V3(v3.clone()))
+            }
+            _ => Err(EINVAL),
+        }
     }
 
     /// Get the ucode data as a byte slice
-    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
+        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
 
         // Get the data slice, checking bounds in a single operation.
         self.base
@@ -1066,10 +1073,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
+        let hdr_size = match desc {
+            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
+            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
+        };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_count = usize::from(desc.signature_count);
+        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_count = usize::from(desc.signature_count());
         let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
-- 
2.52.0

