Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BDACAE670
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246DA10E438;
	Mon,  8 Dec 2025 23:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L0gV9Ryp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AD710E42D
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbtYL9I9X3R+tTJS2Y9kBanWpOrA/BOODlpMWi+eiRngCCfY8VOgbqAmZLXstUD6RCQ3tSoneQ8qbgxjSh6xx2/dxijECptmSfAzpbwsUTkeqyJG3nvrLMF4RszkSgQAQ+AU79tZPNeh/xwN5YyYD4jKZ4e4LORgpGvi6ZYOQ2r2M4qzFl35JzcKDyp38DP4j8filNxUKSWPDT+uabbIcSjSb5phm6JN/Ua5nKQYL1UAXjRW0SyNfbvO/3D6zvvo7v1M4QDfqp49hwp1l0HJJkhJCxLB8xA82ycseXNYR082QTuXnnIee4OWR2xVF1+ov8tf8gt0qW6D82eZm2P99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biZ6hGGY36YbjpnreQIhKrzShK8td0ctOfrpbz5MveY=;
 b=o886KVeqabKyMRPbOp07UN0Gaxvi8Aca86PXL129Bz2QkXfIawPWtHHOaykkRFAWuhZmFuBxtZ400SGnfGvE8vCszHTVk/cC39T+2nrIgkWvGmwM0BFfqaKjYKRs7YMqvHt8dwjuVOlx0gKRh6hNQZpmnrR+g2pgolrhWBDYQDvFaNMK0sbB5wDaPxrB4K3p/DB9CaGZwKJUk+CYWUpcT+orncC8FIL3j6ypzkJxoHugSDiJvf8aaMlG9aCH30b1mbZfP5raiyrGYip77atSg1m2tpybPWLfp6TLTpby5lMhJdrGrUrXFQkSxu48IAxSsjRRE7Ry9caIWx985rnt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biZ6hGGY36YbjpnreQIhKrzShK8td0ctOfrpbz5MveY=;
 b=L0gV9Rypjqzc08ykAA6Az6sDWaE/y1+9qh1ze/rH/z1Qgn30jm79WRgODj/nKPKCdMt427O++dcy6gGI7ZyAEYmDdcmnWseWK2ZY4qzF0ApdXb6JlAFO/QwTA40q0+qLCtoLIqK4ItEOCMsdLAoSsepSkYtki8DGrVXGN8I1CK9uvOfo5bLo6hGvnNpy55QMbBVqOklxHBrjyaZ0YHFco2DTciDF479v6lPWlp/o8lJijm684PP/+Ya31KGWlOMmyzJGaI9f6lHqgpM65KehFb40OXHlePxje9aIgR67euI7WdUFtaS2+ZqU6Cp22MxjpoTYz8ug6opgnfxg7Bys5g==
Received: from DM6PR08CA0021.namprd08.prod.outlook.com (2603:10b6:5:80::34) by
 DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 23:18:35 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::8c) by DM6PR08CA0021.outlook.office365.com
 (2603:10b6:5:80::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:15 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:14 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 05/12] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Mon, 8 Dec 2025 17:17:54 -0600
Message-ID: <20251208231801.1786803-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dafb5e-7f18-4f26-a89e-08de36b01c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6GPpP08ZuvfSqzRNsZ2XUAWx7DSfz8UJwoGxLNxli/kx7Qy0p+piR0L28XHJ?=
 =?us-ascii?Q?RkXBZ16nCdTFlrzC7Agv2OxxYTef5qaeJmf31KMPERjoHHX+iUKl2HLIcqay?=
 =?us-ascii?Q?iMKf1AGZ21EEUXzR7XBSfCTM2f74RPaFCOxDiG11LVG4Ad68d6DUS0KzFCxp?=
 =?us-ascii?Q?wxi5shS8ixxxd7+6Sdw2KV9IbfdQIHLW7YAfrp2FidX5WXxB0ykS4axLyDWk?=
 =?us-ascii?Q?HyZV/OPoYkDkkF8vExcoOfdFqVS2OzYtydU/gn+D4Z0K7ClPsQRA0/8SzYrX?=
 =?us-ascii?Q?fZMfHR6djtgXK5ClnVk8YDa3maSUmz/zI9HumDYS1axuAwWAIUZNlUJPHrNE?=
 =?us-ascii?Q?aFzxMJ4Xl3BmQH3+tSTUkx1aCLY9I5PZ+ZrXs9gDypCE8zorAZIUvGcsMhvS?=
 =?us-ascii?Q?o/tocrNKocd7U9pyBuP3BrSnN86rXxVULuyIfdyvsVqbX1zJ5FIqCwEF+fvn?=
 =?us-ascii?Q?r8GIXi4qEgq1CnjFFsPnoqYN+XYKNLyYLALvUhZD5s40Hm9dDAJ98KQYZkFK?=
 =?us-ascii?Q?cLu08eYBL/eCh8tkTCgAEGu7tySXRTRIUXVUFlbXntQ4Tyr9kYywlihxDVd4?=
 =?us-ascii?Q?hh1oVOjK7Jb2fwQDELZTAjTFrstdKZ/tyKe9o+Kc9wc6sd2gCqbTF1ooPzYt?=
 =?us-ascii?Q?D+LIeb5fL27AFGmbeoYHPrOAKKvw8z1r6n8LlgHfPI0P1xXr8KOdFZh+7Mpo?=
 =?us-ascii?Q?Mn+kQxJykDRyNe1tftxDsAzlCpoBCMAyVe6zdpn8ucl41LCdnhEP8jYyr9Pu?=
 =?us-ascii?Q?f1KUv/xDQf5e5SxijYM+f1t6EZCTmqLMA3OJgAu67VHAUeYDxXYd15/xGfdL?=
 =?us-ascii?Q?Uk4zbG6DT4sQnVuHeDL8ZjT26/PcEATTSR6VXbUuvrl8eU3Qqw9/z5BdeYRW?=
 =?us-ascii?Q?xWl9ghTx7Gp3277xN/qnia7VxHkhi0fs5Vh0uA/cQLBylsY1NqrOX6m6zga3?=
 =?us-ascii?Q?mc9+S8wJ+8w+9n0aYedv60Btr9ShXU1Mh6JEARaGKm4JQq5S+1/8pLYS7Zmw?=
 =?us-ascii?Q?0hcZT1o6PC9sx2fsy0KRfP/ZmijMxqSuDCj+HF4nQXvZC9FAonv3/siCQvUF?=
 =?us-ascii?Q?zvw14Ehp+rpXu/o/4PNqx1jEKcEfyFr6K71KZYgwziPL4BhskflT+HuWddEo?=
 =?us-ascii?Q?zMbhNDYPp3VJGrhY0hKwN7xal8rWdR4tSiI4rgl4/Tegei4qNgyfvbGRHkoJ?=
 =?us-ascii?Q?vd5Vk81N3yP6jCmyiUH3lleBJ0q7HUsQghSEa2jxjWcduHZD/Fa65JTv7+bv?=
 =?us-ascii?Q?Iequ6zoaFpVOAjcGtb38u1xRDEUsJhgeU7f22oK/lxfwpFxqckRzO1b+lfjU?=
 =?us-ascii?Q?R7IuE+GgHTPq82ibMIc41NzlG3mZBjgvU5nlclEXftsE6rUTg6SjIxw9V16h?=
 =?us-ascii?Q?tvvhOgEZ2T6wRdZv0UIbO//wUeIsvsG9aI3XvsBwupCRt54zhmVGvLeot8AU?=
 =?us-ascii?Q?g53OTZf4GlZn6jvw2grDGbHcfsKhi5X0s7OUuWm0BIprG1wQhyLBNNdUGRx8?=
 =?us-ascii?Q?9zTuAY9T6ga8OXoARWn7R+P8FEynM3Tb3bVZKi08Ord4QJVrCjFl2SfoHlu4?=
 =?us-ascii?Q?3dlofCkKsX7lrFHUsPg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:34.8822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dafb5e-7f18-4f26-a89e-08de36b01c4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
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

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 10 ++++------
 drivers/gpu/nova-core/regs.rs   | 10 ++++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fed597a29fa4..a480f8bbeb8e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -454,7 +454,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -517,8 +516,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -552,15 +550,15 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params(), true)?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         if let Some(nmem) = fw.imem_ns_load_params() {
             // This code should never actual get executed, because the Non-Secure
             // section only exists on firmware used by Turing and GA100, and
             // those platforms do not use DMA.  But we include this code for
             // consistency.
-            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?;
+            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem)?;
         }
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..88bec1d4830b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -16,6 +16,7 @@
         FalconCoreRevSubversion,
         FalconFbifMemType,
         FalconFbifTarget,
+        FalconMem,
         FalconModSelAlgo,
         FalconSecurityModel,
         PFalcon2Base,
@@ -325,6 +326,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the 'imem' and 'sec' fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self
+            .set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.52.0

