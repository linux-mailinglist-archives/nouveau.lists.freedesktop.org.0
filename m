Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D912C999E1
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F65210E4E8;
	Mon,  1 Dec 2025 23:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rd6+q1JU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFE110E4DF
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEEy32FVBW2DZYJVRy9oPNBWhWdlGye3P6khczaOrr+zH+xR6wrdHn5vk4tL31z2mYM3obRPcseYjG2Zj+Pd8XmaTQm9LYEUu2DoDRwXeFPJR1QPfWV1DAyirsoiMr16dG/iTMbdBF048WVWN3no2iD3s0YbAwKu0UdUZWsJyLlpdbOBTvMoZgFC6VnU5qc1kBQ/DnmLM0SHUhla24qfOxCETT374+eIkGKqsoGZs29i0+ktAbVR40T3gzOQJOmkq1X+X/1M/gZHRl5QNgfavNXDPNDPHCX84iUVXRLNKLgwN3FIKAto06QAr0R077VyfWCSp0W3LZ0+BeprnkyvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ha2J9orRUI0LTavALskIOVNQKq00h1weUHi74oIzVY=;
 b=VTTLiX3M4T5jY9xQ43p4xKkYzKScGoN5rScYd6WXBkwr+Tj14sGPz/nmX5F8K/aW8vyBkvxhVgBD+LcrnsQMSAS69wV5nPkw6kWF96KDL3oVmximrZyBOYego007iXxIiEUZ9a8UEwEwNbRz6HoyPLNII0N4tkNTTtuxdToG/Xv1p0T6yskC9yT0LSUibNmxg6+E8chADsaX9Tm+xQtPKE9N6CbV43N+UE9X1BOTezy8Mee2DDH4Tas9TokfKB8MaPBl3laKLmMHk3B9Vhm46c0oKCJ1HAJT9lytdPYSAjNPZw/9bJYh8aayQdLMirZS3rYn7IjofnnIgi7HZLaCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ha2J9orRUI0LTavALskIOVNQKq00h1weUHi74oIzVY=;
 b=Rd6+q1JUyHoIp8uyrwho/tBwXXcObdvK/uNo3M9fbU+dGacDhOGrJfLpW3FSYjnGZuiAnHqLWj15OkP75wsHAiIUeU8xb2S+iidM8CMCVR3/G7GTRg3bNmjRqPREYuf3ZpVg9ajNGX8RM1EIC0AVaVs3E6nueWBqXnJurQ+FzTzk+TfjERDZZuFMCLqtxhq3CGqGL56FDpUj8YeV3eQpGV2a6sd7rKq8utYraIVdSbvgfyO+A3kBp+CeOeY6oWeh9Gm2vqcTaig50lI26Hfvm6OoJ2bGYo1LV5sRmZmiDLOm7zP6I9se8qXB3WjHa+EjWAHUS0gi2ca1rV2u8hlavw==
Received: from SA1PR03CA0001.namprd03.prod.outlook.com (2603:10b6:806:2d3::12)
 by SA5PPF50009C446.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:31 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::28) by SA1PR03CA0001.outlook.office365.com
 (2603:10b6:806:2d3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 09/13] gpu: nova-core: add Falcon HAL method supports_dma()
Date: Mon, 1 Dec 2025 17:39:18 -0600
Message-ID: <20251201233922.27218-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: 986a9aa0-b673-4d58-b0cf-08de3133263a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hUwY/cgxhSUN66rjd55O5F1zHoOiuj4Jj844D/fdatyOlE5MM5CEyROFv9tR?=
 =?us-ascii?Q?kbc/AtPPatHfxWMZqKaMOXoGJJQNkGXafWFHrvlLkkjhWPvpPz5z6qr5Okr1?=
 =?us-ascii?Q?stK993LhbRLhUjaKPt+NYJlFaXswqiWxObodSrnNXoo3nbFyhZEB7SOyiSt2?=
 =?us-ascii?Q?o3sLWJ2ZqYCa5roCZR/SHRLCK7wAdRpOwGNxCG9qGYnM2O1jtag6qikBDigf?=
 =?us-ascii?Q?lgoqLP7AtE5IxYrjJD7nIUU7Q3iMcYyEbFamW7x7iHqPzJ9JktXKJ+JaVkwX?=
 =?us-ascii?Q?YH0dXdYFdz2pVwVHpM2c9I2PPhSoaxboiguOsYDYC0LBkKWeAte/I5Z/bCLs?=
 =?us-ascii?Q?o6PuB/A1r+idgi/PnMUKSnPghkQzJsMXDAkWlKfHrsitBHBbPfNTMIca7BYb?=
 =?us-ascii?Q?wDrjetvrXfCOTkEqsBiySrMb+lfQbZ1fK2hXgkh0ipFKn9CdxSd3SZixO/jw?=
 =?us-ascii?Q?ahjzUGXuESMhgJrrbvPTZlDRNZVs4acpPCLebG7dKIdcViHclWOkegOUXi6a?=
 =?us-ascii?Q?8KNbFRnBYwf/TJ/Zn81nsGU2+g30IHbdYuDNw2vtEGn1/0Ert00Ov/m6ABmT?=
 =?us-ascii?Q?oaIM8hxkIs03Dx5v2UbxwTLiwIif29gVGL5UbJduH8SR8tJP/LssLIczXGA7?=
 =?us-ascii?Q?458H+jNbc5o+Z3p3NglRKUJBPRaD+NVLg6EBqR7TI/2UBOfFmffPw3pzAnkH?=
 =?us-ascii?Q?lMhyGRRfaR94u700J5zk4J5aa6gS1ksiAfptHrtg7E60049MsbdsVUCRfZVA?=
 =?us-ascii?Q?L2+6toX1KwUu98MBos9GxnzAyt3ny47fltbULZpHcjchExbIvMq3qq9znCZf?=
 =?us-ascii?Q?SWFv7ocUVfa6q0NfA0wqjaC7NUiGXB/xMDqfTZ5WGB9GMgfKWRNF9UOphVNU?=
 =?us-ascii?Q?jjxk7YALn3K7rm5nVzxg5+Z/SGGErpXz522WUt+MWIqHTlGPO3vkRfC4KL57?=
 =?us-ascii?Q?a13afYFVDn7MqsHi1ZO6SVgejQb31FH26uykAutAoedfALruPlDBlhGNX5wA?=
 =?us-ascii?Q?OsTe3AqotLn+8WC/tNsb21dpjwpp7xbuNmVaDT8oZSxm/Jt8fTFJtkVAjavG?=
 =?us-ascii?Q?Oi18yJG8VqcPnRbk4amP4YnEHGXJToW3MSSi+D9OQlAK5x3jXdT6rw6tIGEU?=
 =?us-ascii?Q?cnMpmfeWWXXREpUhpoeZGkJORzSW9J1GSlESxVVarQGwbaetLkk+DWKTKjFh?=
 =?us-ascii?Q?b6ZsejRcoFSGDyRi8E0ybHI4FuYRRzOIK7JTE3recnU6wi9hXWx2zI8dRgPh?=
 =?us-ascii?Q?Ix8O0QUtvX3H4lK10U3KKoxOF5Q30dbYbvhJGd1MvPv7ICLOkm13g6dP0lfC?=
 =?us-ascii?Q?8DrAx+kk27JMQQS5yujIpAdYzkN0OxK3E0ce0QLGtZrJQXgS1EwyqXkXOjiM?=
 =?us-ascii?Q?ubFjjxWXc4NsF9ws9QJCstIEe8h3XUOBFpo3pH8RSwldgDPj/PGFNe5ke1t1?=
 =?us-ascii?Q?z7IlBKOtO791ozOmNJZIcMYj5+hCF3baT/S1s0hKwvK8TVYVsi/9Q+Kiuc3d?=
 =?us-ascii?Q?ZdnP4QJQ/gLd3ciwAf/UoD9CRV83QPT2ZmQld1FJv/FpM40LWx2l13sIqCjI?=
 =?us-ascii?Q?c7EOh9X115gXJfaaRWM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:28.6029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 986a9aa0-b673-4d58-b0cf-08de3133263a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446
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

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 7 +++++++
 drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index f2da6a4a9d36..2770d608a2cf 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -631,6 +631,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    /// Check if this Falcon supports DMA for loading firmware.
+    ///
+    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
+    pub(crate) fn supports_dma(&self) -> bool {
+        self.hal.supports_dma()
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7a6610e9d0a8..a760620221c3 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -48,6 +48,9 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
+    fn supports_dma(&self) -> bool;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 232d51a4921f..684ca72b7cfe 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -160,4 +160,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        true
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 19a8b49ca2cd..d8ec914bd3f8 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -71,4 +71,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        false
+    }
 }
-- 
2.52.0

