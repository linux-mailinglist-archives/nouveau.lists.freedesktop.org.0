Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DBC5F962
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2679510EB40;
	Fri, 14 Nov 2025 23:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I8lUds1Z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65110EB47
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL0oImr8rKLuuwQnK17OB21NUhuUaVPn9BXxuGtOWb/K3dOOjRQT9EOCHdqwFB555zCly0Aew+sw7LZNkH3V4FWyakYzbzuTk1p/fwvHik3HIS0c3+be1B9cQ1iaG0+ZgSYSv4GCSGWuVndBEvERpKeyT+UJvIw/FidKJUq1g2PZ76HK0wbS8VqwdDGjzEegrSENu0Fzs596hRGsUsOskYb3K9jLMIX5SqRRUA6vDUAgFveUA+WtHEr2CARXkYaIx83yyHqdNQ2aR0nkXYEpilVE5XuBx9zBVWBNBHuY7vrdcj6Pxg2+DjQOCX9NMDb3rC9yu8TUSFRqtV9UlR0DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb3oX4/I/AQG351Vco7ZFkfGqFF3AyXvKJelX3sH1Rc=;
 b=rkfnARDzG1t4OsPNd5WK1aJ7GqCs7WhdwYrM3ur7U+o0B64DNoZTAqplh+4anxC6Q/SWxy0h+u6rYuKmW7mDSsYTiJZiduofTbgRfuGDvppSWtIDwqYC/+QzX8/ipxchCEmokslmcgBeK52Rp5d+YITEj/Iy1CccMS8KsYWUCTeAlxs+QqZ6sZ5S4XHqMnf/pyoirBM/di9yWcPUw7pwAi67g4PQMm2qhxIXkebpfOTrs33m3l+UZx4lxgdI98qgB0zTeHWa7WNnhMtzcnkqBnJoPoJG5vDMcliINieQbxHxiT7ObLX6e3OnMqkOqJY535JvzkSJJ9K1J2gTjXOOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb3oX4/I/AQG351Vco7ZFkfGqFF3AyXvKJelX3sH1Rc=;
 b=I8lUds1Zi472fRaFPw60VWBRsMxPbcF7HxHMr9BxtiLd6y+OrM9qugVnjTQYyOARV5yk9HcWcVaBrH/jwKG5jCt8mADy2ksX5TY6bXCmQXQA4jf8Lv64eENmvB98lifu+R9hg7iUt7TT0cKpiIsrBINYKVR0TRUZDsnFo96WBRjYevZdUPeNKVK9QWI+oQsSJUjQ9rvi/krgs53pPMuy2aGdFrg2mtob2++76w5Cih/QQungh7RgtGAZoM0XziC9X1Ht7IW5jhg4nsGxK4lVldSsyQkQXUKGZQHF4j7jZXLh/VhleuWuk43kBvqQF3qLGiiKBsupdmuMg+ALnstbwg==
Received: from CH2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:610:5b::25)
 by CY8PR12MB7756.namprd12.prod.outlook.com (2603:10b6:930:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:21 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::1b) by CH2PR07CA0051.outlook.office365.com
 (2603:10b6:610:5b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:03 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Date: Fri, 14 Nov 2025 17:30:42 -0600
Message-ID: <20251114233045.2512853-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CY8PR12MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d77ebac-8ace-458d-791c-08de23d5eacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/iGAMWH243UsIecVHuVCmuZqPsYLI7UZ/4wD3YlQOd6HEKuruPmFCh8oC5bS?=
 =?us-ascii?Q?PHR7GP50yS4VvCaehxex+96ys36/bkMtQ+tB9yYWtkd8MVflXRXf9nZttF5Q?=
 =?us-ascii?Q?8bbGsuoycdb/rjphH3SW3pcrNr3kAC/7kwb7Oxn32pPTQuNMbu2UfMgTFb5N?=
 =?us-ascii?Q?HYqP6gEpX00zAfe1NKn/xeL1w4Uxf14qAjIuiyJuZOq2+ELiHFbCHzgeq86F?=
 =?us-ascii?Q?yTYIJ1hF0p7jOVCaOf9bUBizphmXZ1Y62mgvlpWa9E5B81/Z6bFh01NnrIfz?=
 =?us-ascii?Q?E64xiUnRvSR42xFjTsc3WLKPGTF1a0Ol953iy+RSZ0tKvXs5ciIQlks84Kvp?=
 =?us-ascii?Q?spTFySNlFyz7nz9v8leqMDI7t1vutxZWQLIywKIltZByAWHPaB9bAcrNW0BK?=
 =?us-ascii?Q?AqvpXtITwt0OcS1WsdkpZXtvwnUrVtHtUEwPdjcg78NoGgGj5Nmq4ajwLAj6?=
 =?us-ascii?Q?O6gnV7d8FtCu/VIAxv+8lUWOhPp57D+rwwtua2HQbm/8fifG5c/gXd+mGWh/?=
 =?us-ascii?Q?FE8XlNga5ju8Pfq2FEFVaQV6SjQ7JSHOKmq5HRAJpJN4MJ+OhD+UQLV43kAu?=
 =?us-ascii?Q?8BAC5mVtLyUEBCQ/OqbyKBvu0oPdxVMUXnIqTY1L/AbbQ2NKaHs9ZP4+wAB+?=
 =?us-ascii?Q?jAL/bq3NHWo2BdfLXz9H/3+/YeEYnsOjfhjoXuXodtvviRnogLQKlCdRgvmQ?=
 =?us-ascii?Q?9m36BDTd2WtAovyLv/RN4MOl3ZIBBGsqr3MzTZ6cgfXQGLBfCKlbgco2VosM?=
 =?us-ascii?Q?Qb6FSDI2Yg9NMBrlHKHNv3tLyVPhjTJiROELi14RePXsYCAQz4cMrJGWHcN4?=
 =?us-ascii?Q?98VBIoJNnMbQKMDHnbHcAmfD/2h53Z9zGqz6owEaaSmnNfgWdPAes5lsEzP+?=
 =?us-ascii?Q?Y8q+tky3U7qz9P3Iwxx9LTY199GTJfGwLD+uZIRhVSQLQW6hajYhy0o3w2P5?=
 =?us-ascii?Q?jeNRKpnhR45APn4VadCob4bzmxGMOrH8HTMLEO2gVzRSEWRcBQtORImuRyE5?=
 =?us-ascii?Q?hYa+DcfusikH6Iak/BePWVF+nElGadTMe0ix0gqk0xBsgjtRAzmZrC71jUSw?=
 =?us-ascii?Q?/8eph4Cc4stRkgMj8pwJeyM+EYoQc81B64cmRMJ5Z4MHl8ILqR39+rKlMvo7?=
 =?us-ascii?Q?LzUBlPzAZ9v2qUUamY8bnef/f6lxIF+oL/NrhZK2siz/pMGyvEV7fO5HI3KD?=
 =?us-ascii?Q?JoGGG3EFqDcAFH9S723pyhsII2QzgKNbPH6kNIkN8SNxE2DZBCn21OpJcK+o?=
 =?us-ascii?Q?JyjhGyFV2t2J8kbcECx9CyHktMpiE8ui/SUsTIDVFyKsTkkhUX8eYnZ+9pGj?=
 =?us-ascii?Q?v1Skyu0mXYspd227HodrwxZJepeo1/TXoMc/e8YSNDOLNFLLuw1sPByLSNLL?=
 =?us-ascii?Q?wPg1v84mQ9itlpqm5SCXlv/AgTzgoffnM3+RGo0euD5PECnJlx/MRouuPNVu?=
 =?us-ascii?Q?koIQmuhKDGdGW2yzx8UYq3vpJz8SOww+y/1i9R2RJ+CHZKA3rtwAoV+K1ZbK?=
 =?us-ascii?Q?RWlM3eFx9ktSk8p9Qm6KWIfJefzcuXkW3HwlgBTbG2VignFOuY88BnvVgenM?=
 =?us-ascii?Q?1aQEgNMh/uLcHt2LLDQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:20.6088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d77ebac-8ace-458d-791c-08de23d5eacc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7756
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
 drivers/gpu/nova-core/firmware.rs       | 108 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++++------
 drivers/gpu/nova-core/vbios.rs          |  74 ++++++++++------
 3 files changed, 202 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..5ca5bf1fb610 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -43,6 +43,43 @@ fn request_firmware(
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
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
@@ -76,13 +113,80 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-impl FalconUCodeDescV3 {
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
+
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
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
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
index abf423560ff4..860d6fb3f516 100644
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
@@ -1024,33 +1017,60 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
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
+        let v2 = unsafe {
+            &*(self
+                .base
+                .data
+                .as_ptr()
+                .add(falcon_ucode_offset)
+                .cast::<FalconUCodeDescV2>())
+        };
+
+        let v3 = unsafe {
             &*(self
                 .base
                 .data
                 .as_ptr()
                 .add(falcon_ucode_offset)
                 .cast::<FalconUCodeDescV3>())
-        })
+        };
+
+        // Return a FalconUCodeDesc structure.
+        //
+        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDesc>` is
+        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
+        // in `BiosImageBase` is immutable after construction.
+        match ver {
+            2 => Ok(FalconUCodeDesc::V2(v2.clone())),
+            3 => Ok(FalconUCodeDesc::V3(v3.clone())),
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
@@ -1066,10 +1086,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
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
2.51.2

