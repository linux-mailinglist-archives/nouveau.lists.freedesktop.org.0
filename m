Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F157AC999CC
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D2110E4DE;
	Mon,  1 Dec 2025 23:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LcXrPd+1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A525110E4DE
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0741RGJc958fmj8g6YmsocGwokn0a1BNplctFmQcifxZY1zPRBNJc1kPz0i/0vFO4Ie9F05WbSimV9h6FrffWgOiGyB7uGAWsc+zo/zb0ad01xbDI/aJZlxeNjQR+MVcupdeHqL4AD81zZXZ7JGPdMnfa5ZbqBdpLwznoVY92n4SDqJocOTBJQpLTlrbLho4/IlW6WXJtOf8t6gJxfeDFNOEraqHYzImrE12TJeGut/YVqIjuMy5LgyOp0Y/y4A5H07wfWN8rXJaIOUopUO+dcF465Ixa7O25Qokk5EmjV1FHHfH1qwE2XIrBscJy9B6QoHOLB3rlRvL7bT5+hNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biZ6hGGY36YbjpnreQIhKrzShK8td0ctOfrpbz5MveY=;
 b=XxvtVceg93hnoj8T2qK/BNyaqLTZbwvO3/Nkf6UIALQg4SHmxBg+LKG0B8P6u24HbWfHZdpi8oUZL5vX3ExDxSXdQ8bzoLqcrubajWPsRU3QU7Del8EvPjSvunNzai0GbU9rtXsqoBWHUoAS7g3vgTthkHzxjzhFdIu/TzKZL2Px/fKtCEG14pImILinFcRQjiMemP1WMSa9e8ssiG/TWfKOfRA+DqmFH5ur/1ebVBjz0534lH/56JT8nuf/lcKc893XxhDmA2Y1bKcsc4IEabq6QWK2oR3MGlMVydoQBPdoq4j3OoBNR+eDT3gZXk56LDWot+zr6Qby3dWXlS+wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biZ6hGGY36YbjpnreQIhKrzShK8td0ctOfrpbz5MveY=;
 b=LcXrPd+1yqR607CbvGqX96aejejvVBcnXFBFUQ3nLGuFTcAj9e+g8JsVdVqI1+TRSxYKunoig5iJMyGkyVknXm7GKkVYlAeArQTSGo9gyTFV/fZ+Yz6XlFxfiLCxtqXxG9SedNpWjILE2DkqU2YmJu781NWysq/rX+/iPVXrybWIg2KMs4GTTvNqcFR4D95hCMRXbzLMgwmqk0sjL0AZUYcg7/wQRAgHIf6a0QD3iLasLVYCKv3+FEEkVyaUDT0sJ1USf77sqADpMkM4APfgGPlEiU6/HgWycXx10nC4RaacRT8kCWs0eUfus/ouBPlY/Eyv4VXn2Pn+WTQxndiwLw==
Received: from SA0PR11CA0120.namprd11.prod.outlook.com (2603:10b6:806:d1::35)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:20 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::dc) by SA0PR11CA0120.outlook.office365.com
 (2603:10b6:806:d1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:40:47 +0000
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
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:05 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 05/13] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Mon, 1 Dec 2025 17:39:14 -0600
Message-ID: <20251201233922.27218-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0265b4-fb50-4e29-69e8-08de31332191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T9WSfq6tbzh75CU/VJveorfCIZ23gxbbls4am8Nxob61jy4gLW0JoMQbOISi?=
 =?us-ascii?Q?RQb5uwUyUJvmbw2aIJ7285gGtEJfOe5wqt7oFCRzxbNrCYfA18NJG1lbt16G?=
 =?us-ascii?Q?hNZY47ky+P4fCxuArdD7ttOSc9PIBUWwhNKh/9XUzZ1MOjvwTkgMz8L6ZSKy?=
 =?us-ascii?Q?U7MPkR/vYgXIi8r0bDbQxaW3dIOmt0cqgJ0clSPx9z4qaXga9SAEBdr5VA3d?=
 =?us-ascii?Q?autBSY9uHXu9aB9q+spC9cb+Zh3fdhzH52P+Xes2TFUAsxqey6hj/jCjC/LZ?=
 =?us-ascii?Q?+rPDa+Tb2Ig/fBaatJTE3rYaNKFuQ9VBMKn9ozyT0AK5zH1Jq5exRzufUUKZ?=
 =?us-ascii?Q?pmuVNzo0kDQa+6JzmXYm09e+og5qFr8dRZXPrFzOuZnnCTs/zrSAKt7Rw8lW?=
 =?us-ascii?Q?yUqD6BsSSnn3VuxqlmBwNFLF56a8CvrMybIC+vAwvVqkKeKJtsx7ALpEQ0xD?=
 =?us-ascii?Q?p33K1lqNHTMnCG/qsDZSt9O3mV/GlhTTCBMTMsu/U8Y1UEbAkGMmYZeRtDqC?=
 =?us-ascii?Q?I0u3cuq14zipCZfzO5g64Pdmlpe0G1eItdDvHmDJg4JOvzCDaTz50DfFDdm1?=
 =?us-ascii?Q?9Mt5XC7fUPldjxezYySGItExy60eeH0b3lUyC5ZCUlcIcuv+9jLW+B0VS79u?=
 =?us-ascii?Q?mHFdIaK54Yyz4IuAy78NdECy/EMce8AqG/26k8m2Oyn6t63WllePvnNoK8xJ?=
 =?us-ascii?Q?DsLPF5ETaYkIjIgJdjAoAW481RNceEEQFCNcc1coi6Iyw26z5X78LsqyROCC?=
 =?us-ascii?Q?JMYIOFNN9LWVh559S0Cn8wpKmgzbY0IfhHr7Ipy7uUNWMvuy6pNMkV9IfCao?=
 =?us-ascii?Q?qPecrOe4rE+8crao1NKSPf5oz51SaMjhRAvSwV4pZVYS4CW2Jp8CrlPaTWr2?=
 =?us-ascii?Q?3IxUtv9Bb98pC07OS5RkmsVFAUrgZw7OfXAOoh1AMM5utDb6QezwMUKm+CYg?=
 =?us-ascii?Q?8EtQlgY/ZxxToEkRQRLKCOWQEkZbKER5Y6eWtqNhDYuvl5EudgmdAqHZkfe0?=
 =?us-ascii?Q?ihhlbrf6w/Wo/Z68IOxJ0lAhZ/zJAREqXS2owCymVwCU38UYCExjxvn4xFLi?=
 =?us-ascii?Q?P1dyP1ZEILxVXAgyTctY2VxxInuG6VuRE/vpxamb/QEoOq9ljW+NcPomDqwd?=
 =?us-ascii?Q?3RfWnVNpc0u3zW/bZCDcykTGlxJzgmeyY5fgPDuZw8/QJkl0TVJLdw8X3Xe0?=
 =?us-ascii?Q?6J+XpUfcPqxD9+LmTD60mlJzhfuo1sY5DI51kFbxkc/kdxWZkib8JjqHoyKw?=
 =?us-ascii?Q?EyT7ONU2iw72vbsz/J+iqCDxunF2+iW6cZkAAGxffINO8v1mkU57V/QokfYT?=
 =?us-ascii?Q?9seEOOfPPi2mnoUVfotR1Q6piKa2v2Pu5ZOO6ZxQCpT6flfYOjMQ9CvGPCN/?=
 =?us-ascii?Q?mnj5fUG/JSGzHrY66TmrAMMOCi5tcr+6qeOmeJlgxT0bHP6Oc5Yva8rHZenL?=
 =?us-ascii?Q?g1+APRh9k2aTuXmEbi6ZyqMPjo9qE8TrX352+0AKJC8DkPYMjf3y5WTSldIe?=
 =?us-ascii?Q?hGRG5FH6/zG8f1412CC9tAkXvjpTGqZDcGeGPxQ60RMVB+9QolNY0HhTLhsz?=
 =?us-ascii?Q?AoUDY7+mldY0+9n6yjY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:20.8106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0265b4-fb50-4e29-69e8-08de31332191
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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

