Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F392C999D8
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AA510E4E5;
	Mon,  1 Dec 2025 23:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O4oOcWPz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012015.outbound.protection.outlook.com
 [40.93.195.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247C10E4E0
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0q4wIB+3H6u04obwHYh06jVtMA6Jbjiap3uyetdv7bqkF4VWsOk9ZBU2PnWOeww3MpmyE9qg2mv77CJ/lymOuKKBQHsGB2jVQCd5qvtqLPhoEuwdwbacaoBDJUV5zHVDU4Co2bJe/ZO3XapVKjJ3wOJQ1EUOM87anVX3psfQ/XfZ/0iSIg88TP1oXWAjNE8AKl6VJfmQ4+pa01l3u8NzviesbKIwgQj+mfoTCcZ9U0gL/7ZzsEzf57DP6Ufn74C7gN+3pZitZnX17jcGAEwWWPJmAz7s8w1+7YbMO01cMLPourCkkVm+WApmctomz46/gQ1CJXl9StUcpDe2NEuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlX2H+RiKfogV+Nc2Dwt0Supo+QHPFtV9XZjIop0ueE=;
 b=RbGoqESNoIFkyb6cxYMsKWHMCh5qHqY2cXw6HRdCfVlvneIYE+9ZmhoGdo+OIoAQNNPqDyMFutnNaFWN3MoCY22wQRTAGqvfwgilN3rNxQcsHgEbI/Lhrl4FR+L4u1BPEM0M+R1kFquggoqq6V00Rv2UVRWuO55xNwKETRF4sXhNKxTGA5c1G4V0NuKMvnUFZ6W6kHmPgyzQpw+9korkyf12XBSqP6eMXODDVCsWEsw1rMXWilBbKNaoD99egvovSDWWLMdAIEikJhVC2Yccrm4YqZ/ZvVczi1LeCYQYTcuqCkSR0xd+kbA4vt91DpiIT0TtJznZm/FRDRONcRAMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlX2H+RiKfogV+Nc2Dwt0Supo+QHPFtV9XZjIop0ueE=;
 b=O4oOcWPzTGntMXiVGVA9cS8bqTBfqKtLhZXn8e4aJ33KQbRFDoAyOZM6IfEe/2+CM2Qm/HiCPM+Jw/Lt/+h5DMl/+u3PFh9pSVQrv/I+NXFknb0Q3Z9oqDHjtw9fueY3y+EmKmr+x6/A/LIJZa+uOYDBHJj4441wJo5YUtvD9+I+Qjc5TISAb0gLCV/8shGj/H+0TJ0bP7PXoGrPCH6FJ+EHpp1GRVzabxL45/xxKJ8yO/IDT/W0Bk7iZeg1kH9HvrhbQIgQ9DZgsh3sGvtxw9xbluvLjqRs/4av7XKLnF6A1dTdHjwqZi55qOaPyrFlM5I1lRX+v0xmysjskR0zUA==
Received: from SN6PR16CA0068.namprd16.prod.outlook.com (2603:10b6:805:ca::45)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:23 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::db) by SN6PR16CA0068.outlook.office365.com
 (2603:10b6:805:ca::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:06 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 06/13] gpu: nova-core: add Turing boot registers
Date: Mon, 1 Dec 2025 17:39:15 -0600
Message-ID: <20251201233922.27218-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 8775bb2e-00d5-4c60-aa6a-08de313322d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bg8PjKyyIGOcFdAVpPUJNV4Rm4qCCKTCt8xlwji/wyNJTcBNx1S13v+S1LLd?=
 =?us-ascii?Q?kwqyLREizeOW+KZpuDqIxn9E3RDYVkucMdbVJ4k2y7ixtVGZTs/FR5YXb3YJ?=
 =?us-ascii?Q?t9RTOEDtTbJ9vgwhVKArXONwgdckyKuTLSlwCW6h515FYdY456v6BrfVJxga?=
 =?us-ascii?Q?fVJ46PBbbb+LFIbjF7btv24TLVOMLgLBUNyMHQ/MW1S/4s+2p4CsZ/QV5WPj?=
 =?us-ascii?Q?KsJz9DjCva3rqiXICny9aDQf1QvuF7YkkKDrQ9Wjo4Nx6hQCJOCEDO/imK/U?=
 =?us-ascii?Q?+NsmxJaJ09PyGax+uIRpbPluWkteRIuimmwXpwVcFi0netYGKetkyNtviiDK?=
 =?us-ascii?Q?kDOrit2aPDbnKAp9Wppshb8FTNOxfjpVkwAzsxQwXwAm29l621kGQDVotbW1?=
 =?us-ascii?Q?0jM4DKkIxF79SHUG6d8BkkxVdTEvRuYlp3mahAntMDrQEx8YVPQiOcaHmHCc?=
 =?us-ascii?Q?V12Zhg99CyUaLA2+6YeqnDl5gJ8a0d61k2RnkW+qMEqK5iE8DI0m82TaP+3N?=
 =?us-ascii?Q?RHjFp2GqBiMZ2FheEsWPlDcG6g4M50mcd+x9cbTL2hDjZQqq7dxHfIpoWmsP?=
 =?us-ascii?Q?ie19QDyWnM24LUTfcobMhd2shjKArUqECNkIUNijD/OmMqsOngS40xxU2QGJ?=
 =?us-ascii?Q?/1/fqPOktdtAdobStwOVBLzmuksbgYt4eXRIj4YW0KxLhPBHwOl/OvHVUXVu?=
 =?us-ascii?Q?9somCAzb1thMRVyc4EgPPJ6LAn53xTq2QO6tTqnIhJYnXKHunwlCICWEuvRV?=
 =?us-ascii?Q?mt4okix9XxYouErz2mz4gpxGlov2rGSNbGtDGCmV4qzY+ML+qb7bdCCol9YQ?=
 =?us-ascii?Q?jHvTIWR+pZEML/3IpeuDTSk2Yp+v8QBaAz70mcVmZzdWRVisnIHlGXaBtb9A?=
 =?us-ascii?Q?M8djc76lZ+kVosrxakqmws4OSspNZkhcmipviw5kUloQmaotIMvrnfM1cTYs?=
 =?us-ascii?Q?VNRDI3SEaCIHjclijsh9R6DPPAqk8YhkT+hkDge8crkNZYzMfIOnZ0uC9y3M?=
 =?us-ascii?Q?mBGrHj8SMII1oykM74xoT3U9okv3VLWj1yq4x08sgN0j0BQuvaYIvFYJlcmh?=
 =?us-ascii?Q?BwuCrpLzTlsijmd20kQvh79QM4XLdnZp28+kxtKCCasyQfx/D1ZBNPy5l0v4?=
 =?us-ascii?Q?Ng55ZgiIl9Dlp9BrzRT6B/NfIq5pybMblLu4+cRPHQUJibGXIDITM6TIGbla?=
 =?us-ascii?Q?5WHg6Z/+mPxR2vlEY2YhbD6/w+Oa41wia95elTnSfxIAeX9WPc5CCd5UJPua?=
 =?us-ascii?Q?/TQ2J7WAt/bwoS69yZ1ZxnhiYPKFR9wva4sCx2uY3r4F4QPUUiHRvxO4HLuo?=
 =?us-ascii?Q?60L9yRgmHLF8qovk+cau1PR/uzdG172twoadeOVwpf3zdOQXngtGtYuMZgKs?=
 =?us-ascii?Q?/m9P/asWbFz6claixgnVnoWI820McavaowRhRId+0OZ7bFt3RcZBWb8IsEb1?=
 =?us-ascii?Q?55fBmn3Pm/9hrBHjsUuS9yY/hZezjZvysrKIZMavBvHb5uc+eBXsYP8EtBOU?=
 =?us-ascii?Q?c3JPbmtmerddoGIRfwA7FWBsnRPQHQ3GQtbQGzoDacan7fAYgYJyG+gddLd6?=
 =?us-ascii?Q?Kw5zFED3dh7h5ktwfr0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:22.8987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8775bb2e-00d5-4c60-aa6a-08de313322d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346
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
 drivers/gpu/nova-core/regs.rs | 63 +++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88bec1d4830b..2143869d27ba 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -258,6 +258,11 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     6:6     swgen0 as bool;
 });
 
+// Interrupt mask clear register. Writing 1 to a bit clears the corresponding interrupt mask.
+register!(NV_PFALCON_FALCON_IRQMCLR @ PFalconBase[0x00000014] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
     31:0    value as u32;
 });
@@ -266,6 +271,14 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Interface enable register.
+register!(NV_PFALCON_FALCON_ITFEN @ PFalconBase[0x00000048] {
+    0:0     ctxen as bool, "Context interface enable";
+    1:1     mthden as bool, "Method interface enable";
+    2:2     postwr as bool;
+    4:4     secwl_cpuctl_alias as bool;
+});
+
 // Used to store version information about the firmware running
 // on the Falcon processor.
 register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
@@ -307,6 +320,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
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
@@ -353,6 +373,42 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// Config memory base address. Specifies the upper address bits that must be matched
+// to access the config aperture. The base may not be zero as that would conflict with DMEM.
+register!(NV_PFALCON2_FALCON_CMEMBASE @ PFalcon2Base[0x00000160] {
+    31:18     value as u16;
+});
+
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
@@ -390,6 +446,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// RISC-V status register for debug (Turing and GA100 only).
+// Reflects current RISC-V core status.
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool, "RISC-V core active/inactive status";
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.52.0

