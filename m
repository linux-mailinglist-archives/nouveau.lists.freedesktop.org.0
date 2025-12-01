Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C1BC999C9
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5C510E4DD;
	Mon,  1 Dec 2025 23:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="otl4IPtJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8715810E4DF
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPetbm5Fafu+71dKUy1hBvS/W7f8nD8mpoaZgXZzJCYmM30txgIch1+B23ppdGIEQrDH81Dri+emEoJmIh+iAv4IE9481sKbfs/nFi5+bsouEkb2H3TtgRhoKo80DTyhWfUsQn+PvYe2dY2vqxIlOQHEL7hpbNNH6o+irg1N9179GBPQqIq/nlsfjGXX5pfiCi0ya2ZXe+7gn19JeDrThcquInFMpRm8eSq6cwdZz3VoNdKRHQx8Qb32cZ3L7JCZlxw8v7CXFQJsxWJfvULpcuTHFISbeFhdjs6v2M1zB5qJtoSWzyPcxf4LExQt4xVYvLBFMCCTt44XLTiK26N4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otgDxsOMrZmAz2Ow82zxyGsPR4zNqBxzAk32TZ4mo2Y=;
 b=qc96Iut5KGB0tJdxHYjyq0LVsy8h/w3Fjvc69hgzRpeF4+T+++jkNjaDDTa/8fLSZ0J3/BzNsrDv0V6Rs1Qzb0cqmYYzO57+z5OMosYwQWNjDAl86k2rbKLr8ZGJdp/X5X5CTJUoK7bvF2xW40lk1AxpZ1xEmEbrcLz7vkDNRDBqIkY1hOEzW7i9hVPV7CAb2ywwh911r+trK0KCLPwCIMSoMd4flpHehFcFH+ZYT09XPiQgQ5ESNaziAsfzehhK/UC9edY2A8OBMl24RjFMq130X1N1Y1YUTNSvz4+0kGK8b00GqZ37T5F2+01tlZz8W33SV5we+XPN9vsLXrJDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otgDxsOMrZmAz2Ow82zxyGsPR4zNqBxzAk32TZ4mo2Y=;
 b=otl4IPtJ3skxZ3sxQVl8QpCNO2DDqwfEq0WLCOZB6wpTVI9hl2vWBbJU175Kiv9FxDD/1v9Z/1umplX3rTfJ8Boc+u8+4Wza80it+TKjYS/UUeyDFSGdyNm5eTJBbNKlxp7EaxU0LGWZdKHjpptqG0XmWSRwTdlUounrJP7fcsfrwuiwqYKTY2QvIIDSAMXDmBBmT8+Lnat8hLhauvni5tOsN9GZehMGBoxgaK+V5B/bZvEhJaiuOy6i73/1pNiTq4ls9Lu1Uo63c5K3DVSSxQIWYfGWlEfCdUtKGXhvXiqjBQ4fqgeozoos4SnmpW/bjLHkBYZOPKdeBgCSKVemeQ==
Received: from SA0PR11CA0118.namprd11.prod.outlook.com (2603:10b6:806:d1::33)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:18 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::dc) by SA0PR11CA0118.outlook.office365.com
 (2603:10b6:806:d1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:01 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:00 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 01/13] gpu: nova-core: rename Imem to ImemSecure
Date: Mon, 1 Dec 2025 17:39:10 -0600
Message-ID: <20251201233922.27218-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4a9ef4-65eb-47d3-8845-08de31331ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zaS+zotueadQ/nu5vPwIoKI8iSi/pujvoHSAG8oXKyqkvJwAgAd9EEZtTN11?=
 =?us-ascii?Q?LyspXMB4nEaP1HfWFopfkdC4Zz+foFn6wce3oJOa1KsPk1BTNh8Omfk1yV9y?=
 =?us-ascii?Q?1MzkLypnfO3ZZKLZd7XUxNHHll8fbFOCpIplWBbe0qg2HXJRcboS5mkbLT4/?=
 =?us-ascii?Q?aNr9dhQ3WRE2aJE9si9acsdxusfCC3ojWv1e27/WkuRL9d2KTXLxEW3Q9Lkd?=
 =?us-ascii?Q?WdEy1Jy/ZZnzvqmMPRk0JHvwzO71DVOv3bKr6B1mpmWOB3t22Y0khmP6Igpe?=
 =?us-ascii?Q?FrHpbpEx8tW4Oz8z5E5a4G+p3+8ctFworSnvg+9hNsa5uVqUl0zJmbsxkipm?=
 =?us-ascii?Q?VgC5vclooTfohEWdHMp7PBmaYuCXtKQBgEfyk0REDf3aIQsJMnFPosQ5tQs8?=
 =?us-ascii?Q?mV3aZ33QQp+wMGdMWKVgEbOFPPLjJPL/hJfEHlLQLYximlPrt4MdoPd+cBqa?=
 =?us-ascii?Q?AYY8q3e3HFQjDKRxhsG2TAW+Z7ddf5fKeuTUmjHulv62wTgbGEzn+c3GsVkj?=
 =?us-ascii?Q?avnCRvkvgt9/ksaEJML1RAajSixdNTauH25L7z3dFkWcIwbYgY4AL7sCdUeh?=
 =?us-ascii?Q?Zn0LLtBCxzeQGRnVAlMy1iXz4EZy3I5VSwSrJziRmQKZe35qvgUhWe03w92s?=
 =?us-ascii?Q?UnMK+rK1/9Y+qHFd9ZON9C93O3YEkMT2SU2aA7xsGTS13QGADkOVJIGjI3x6?=
 =?us-ascii?Q?kKohZoBQ49ONdNaCsYisJ7BZ1EyJFLnOhgyY+9KCECf6QoxdyLiKsN6rNayG?=
 =?us-ascii?Q?jcW7TW9hkOCqWIJwmDys08gjtbyVNGZNHms2i2TzdcYDe0HTQqcYqSS6QVsP?=
 =?us-ascii?Q?Ek6lsoFFPvxvdtW6LLaQ3pJj2o5lrM37Jmdi+Vcrrkw6+tgDln9kLlvWioAE?=
 =?us-ascii?Q?4L5j//gOUddudur9ZCYsdGVxspJvnUGu/WkRWBedGWyrPJJv5CgZ1okBGgW0?=
 =?us-ascii?Q?RVuePnuO88vbVfS2VHu7IGDPFZlF2Mn+rQSk7EAdX06UzARCT0s7xZmAuyrV?=
 =?us-ascii?Q?FcU8lrgu+BuwMvw5jXvKp2qIrQLLez/xLrayH180Mtcl/3yQ+s1jFjXfwsEZ?=
 =?us-ascii?Q?lPMq8mif2HNUu6M+/ha6Y2kyi5p0i76NaTa5fAxxod/Tc2XbO5UaMplhSiW7?=
 =?us-ascii?Q?px04/HYHR1UIodH1jCJwmkOznTBrSa5sjo0QMeJJXHwuNrXnUtsEMBug0Eeo?=
 =?us-ascii?Q?6sPVhjKQTmVa/3U7Q7NTPQvoIW9b6zlffK3a/ySSsk3mw9kN2qXtQGqzvgkJ?=
 =?us-ascii?Q?Bu2Gwl2qz4LXAN/tOnUOlr8sWN6+HSaN2K3VkR6/5O/xByfTpOnqsQ2CWMC2?=
 =?us-ascii?Q?V7jAmRSGW5PvINTGjeeWLYvD+AG9e0CqzBkPJcoP3/Z30JI3/wVxquGq8CcT?=
 =?us-ascii?Q?SlHibQzi3ne5n+5X220Bw/2p1LL5qmaFiKgdtHsQO0pjwt75hEigd8UV5nm/?=
 =?us-ascii?Q?f7NUXblqe4q4FbcPxrgAnpA8UpFgtU7nR30Qvi5W6G48eS/hkQUWs4GoxtY9?=
 =?us-ascii?Q?/SpO/GsMmX7oImskBvgU9blqcB97TJYekWb0/3hQuY6Q0zQbUsMGMGo4sjBR?=
 =?us-ascii?Q?ntvisu/+hQ0ZBBnaCw4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:18.1351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4a9ef4-65eb-47d3-8845-08de31331ffc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
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

