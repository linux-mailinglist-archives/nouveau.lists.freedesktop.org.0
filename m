Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCEC5F955
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3210EB4A;
	Fri, 14 Nov 2025 23:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e23Wrz9T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010057.outbound.protection.outlook.com
 [52.101.193.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1A10EB46
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/5FCL8VjJI7WgQ7ur0cpGaVZyb6GddJIY9/Rd4RmSZ8JYLHxFCQIXDWJFV7yv8HnTdAXnqoz/Et2u867pG3/pIstah6Xphr4dq7Anf0UjoiMdhfW3Tevdl9CvRwdZ5d1kLZwo8N0979xlTqWwrAiVQ5VfDeggHdhl2M/KrQh8O54MoWM/Gk3wEBq3vLJUIuB/Rldr6dihB8oIOLHNtxz5nSrBuejVrQ8Y2lDFe35SwwXgy7snlLFIaV64j7Qu5knlHNQ4eyoTffBtulGQKBMELd+tCITMr5KEeO4B+0CILw2MVuMWgoChhI/7Hwf1n0spsgkHHrbPO7HUQIuQhVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maNhrYCPSWaERLYXbHkRObYvdHCzWx2eu497cjh0gkM=;
 b=kUzGfbPkdE91EeVbLN71bO6ZNKd0grj2HPNrfvKPcNZM2F9lj4HSvQ44u7bLZAxSGBo+vP7xTV3c52FSSr09y64/tF1lLqF/JQVOYqufyYY7wS24wUx2YZ0oYLxoMuuKFAmivPUmVuR6DUKVQTWoWNefeXbSl73xLZ4cdTUiH5xTN3DFVCXMHSMJkNH230HMyy4NbqDvTJ0pfv6gmUK9Jh/M88ODH91YzwqkHnlnFTMuWouLkYgpIHMscTsyP9HvQz8isIVnpte7nNsiHB5DwcpjuIS/Ud154EfbjhkuB7/OiMieXjWGZMbAnKl+gNPJlLMvkB4is+2DqCLS81hxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maNhrYCPSWaERLYXbHkRObYvdHCzWx2eu497cjh0gkM=;
 b=e23Wrz9TxIQ49cZBAj3UsTll+4PPxRrqaJc6y9XeCN6OGr4PIWSmDTx+YqJFpoqTFWiS5lx7/fLKBPHemiPNBtnR8LOV0y6w5IlS3h9wSMg4sRxuMA1T2Itb+phgzagqycd3jV+TilfIW3ZcTsVLoB633nGc8AeMr2yBzzFEgr7kQ6Kf62ALHF8ruuiakfq77agto64jwfuUYrw/d+mAEMvy6O2lCEIom6Sd3LeBehQ11YNBPgYicB2swaW6b76YTjD7fyvROUyy8XfkLQWEWtfP+DTi/BakME/PZsOx2N2Btn3FVrDNtCuFDcUAYouPv4okKs+b5tfm+1GC0hC6gQ==
Received: from CH2PR07CA0038.namprd07.prod.outlook.com (2603:10b6:610:5b::12)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 23:31:16 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::43) by CH2PR07CA0038.outlook.office365.com
 (2603:10b6:610:5b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:15 +0000
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
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:00 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:58 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 06/11] gpu: nova-core: add Turing boot registers
Date: Fri, 14 Nov 2025 17:30:39 -0600
Message-ID: <20251114233045.2512853-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: fde82436-af30-4b43-5cc0-08de23d5e7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L2LtWFwjMhhDwfv0ofbiZ4p5UvuBZeHXocHqNz36H9bSqLGlgpyRUsPBc5qe?=
 =?us-ascii?Q?HMfkGvaVR8YVDvYNnvlzbRQYdEYGPH0X49fR38WREPNTCvGlOenzsQkbw/X4?=
 =?us-ascii?Q?ioRGwsF0ZxThDQB8LZG4pKil8ZxCDLIMYuCWBd8c70cQ8Hovr9PZ9aOpPpVh?=
 =?us-ascii?Q?Wuy14dIsQHETleF0PuIwoUYaBtlF6jXosHE1FNfct7r0mABcHQEg3n3T4Rb8?=
 =?us-ascii?Q?cAfVezuSP3Kjce4VpFDnVIW1+o7+AoKPlQzmAQv6F+J5QI0TWkS4CG4AAaKk?=
 =?us-ascii?Q?Klt+Io5fki9HRh3BGLwVLC8+y2h/xCFMFp3ZYmDsdMvl6UhsFdEQtjs7F7qJ?=
 =?us-ascii?Q?F/dw8G//yraxRsXMqvglHnh5g2W9O4DfDH1ZdQoO5+fcHZ8O6P666sQstSDL?=
 =?us-ascii?Q?9HjJuca+8h1yeDP0heBpTKqzoYQ9i+4ob07pqySCX6G8HN9OFrO3yU5Id124?=
 =?us-ascii?Q?aaK5DV/u6HDtcBs249eHFNjfjT1w3q2YIvXJoEHQU4vJNNa9gmrwVJDlbHgJ?=
 =?us-ascii?Q?aikpSRw2SIENzmORt3rYD43fjv4ty4jQ9/WpwLyEzIA33iGc16Dz93P8mLEa?=
 =?us-ascii?Q?pWGFaiQS11eTCwPu0uRgqLszz5W38JPhX3Lnhu9J/fU1PhevrI1eS5d1YpFH?=
 =?us-ascii?Q?HJembplu1NOY45oYA/0vCaCMP63/0QM25YSROaKAX0TicKeA81ZW1XKdWChh?=
 =?us-ascii?Q?bMHo4U+JJZBiB0U6BPCaj3y8uzQ1ePDVr84DPiIFx//pXuLJn6r/OMLsipu7?=
 =?us-ascii?Q?iuf6qP38HuqhKnXv/1ibS4fMklZRfGGD7Ji5yCdT2WQLsma/67h9w03KWrwg?=
 =?us-ascii?Q?Pa3y50DqD1IU31By3uoiUO35WUpuOHVjLvvL5yeqrOWjKXiMicevF7ihDGGT?=
 =?us-ascii?Q?WujZAuwn1C+69xhIsw2YM9KRHQ1QT7bF0zgeIzsjyjkTl8ZPL/sHI3+4KNxY?=
 =?us-ascii?Q?NqLoiB6pQLFLXhdx7tfL5NHrX2mqQARcjxxgdyAq2OUSlk0CBLfKTXMvbzP+?=
 =?us-ascii?Q?ryKgv/qWE2BQReZ0DV81LozC11tj8ZbxTzcJVBV+zaTv/gigK4F5JgtaeG9Z?=
 =?us-ascii?Q?GCCev1U1A4a5xIdpOpzre4pYcY+WwIUazzgDZ2n6b5OFdvQsLfTtqfK7hwTd?=
 =?us-ascii?Q?F3IMEcFKUppWRjd1GVJifd7nLSN6lq5E3mwtiAaE7N6LZmXxKvDDj2Bl4yB/?=
 =?us-ascii?Q?GPR/oLjAcORwsTqm8r79jv60gNCwXArLuV0/RO/Rv1pfqm+8jfPL1qQIMGY8?=
 =?us-ascii?Q?L+vNEK5TXyjb5OcJjhYpohw1DXB2OSoKo0v9bVSbh7b0F6FMkkwaq/lsnZPD?=
 =?us-ascii?Q?KKfNT/3pxea8KZZjbYrM9JP6qXfAt/0y+v4M/YbBcKDqn0R78Hg8cFxBQksc?=
 =?us-ascii?Q?ZOWGDqwg76L4EqAhAp8KhwknuJmuAFe8nDbNbbv8oIwNChX7HyPK0bVAEOXo?=
 =?us-ascii?Q?MPvhcel+slhjEwxY0tCF2ksGqNKkWpUJ/H73psqh7/BxUSJxmiiaaLxKxf8S?=
 =?us-ascii?Q?/twkVqOmSRTMkqXYZo1O/dqiM0b2gecjtowyok2YFj1+5Iz46RLp5QbV71p8?=
 =?us-ascii?Q?30NVBgkceb/GSjrbDic=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:15.6868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde82436-af30-4b43-5cc0-08de23d5e7df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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

Define some more GPU registers used to boot GSP-RM on Turing and GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f79c7fdae6d9..c5389db1d98d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -223,6 +223,10 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     6:6     swgen0 as bool;
 });
 
+register!(NV_PFALCON_FALCON_IRQMCLR @ PFalconBase[0x00000014] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
     31:0    value as u32;
 });
@@ -231,6 +235,13 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+register!(NV_PFALCON_FALCON_ITFEN @ PFalconBase[0x00000048] {
+    0:0     ctxen as bool;
+    1:1     mthden as bool;
+    2:2     postwr as bool;
+    4:4     secwl_cpuctl_alias as bool;
+});
+
 // Used to store version information about the firmware running
 // on the Falcon processor.
 register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
@@ -272,6 +283,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
+impl NV_PFALCON_FALCON_DMACTL {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.dmem_scrubbing() && !self.imem_scrubbing()
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
@@ -318,6 +336,33 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+register!(NV_PFALCON2_FALCON_CMEMBASE @ PFalcon2Base[0x00000160] {
+    31:18     value as u16;
+});
+
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16;
+    24:24     aincw as bool;
+    28:28     secure as bool;
+});
+
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16;
+    24:24     aincw as bool;
+});
+
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
@@ -355,6 +400,12 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// Turing and GA100 only
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool;
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.51.2

