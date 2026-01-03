Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D4CEFAFB
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D810E322;
	Sat,  3 Jan 2026 05:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YX4ab7Am";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02E9C44C81;
	Sat,  3 Jan 2026 04:51:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415917;
 b=N2l0MURpRg2C8CPQBjj0VZ9BTZB0r3wCb8wy7fx/HonvVYVaCgFSQFxGPl9qDkTdcXSJk
 KsVfgFkOG4GhL0lokXKv5pQh/+qu/UAbf1S/OzoIJVH9BXGIAcB6YAySpIHjW5EGc9ttf1f
 fLMReEFrx4RXEWHHZ46faHE7ghWi9INffq/wBzHFqErniRfOvM0LKT3gqOcpLN7/yAHNvFv
 09ThDrmaD6qnSbQDsZd7GbqVW4Ks9tHKcR8afxIS0m3lsUamXVTZN0GbrJyoUvsDdVMWF/S
 BFx9QTtPpJuI0w0bj8YlMYxGep95t84u3ymEDVFYsYmFG09OO7pUZHOQN4PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415917; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/i3lRtgCiFKSCiA/qq68ODVyTp5BHm/z/oOZO/zF1z0=;
 b=Sk04DkqVIcDgYCdezYxVnbstS2l1eSM313xrsxW473f7RxndC6ynkCee6Dxg1y2tXljZh
 0ApHhns52PX1rSImjJ0YwRWFem9V+NCQ/Vnt3EkSo9bmLXUzPCDSKpVMDsEyTC5jTk0dkER
 yj9uvZtaB6vDUBuKCO1jU2gGaHB0Yr3QuxqA1UmuhFzFAjZLqko7WOIcwetnPqSeEH9Gm8A
 0ic0MCcSG9DmLN3TukJ5s+BjlDvsXPQ5DAimJECXUX6npg1pZWxNVHjlJJhNNPJzKD7Zvc2
 Ex/faStrDyMBCnVJANTJR+UVug/234bw2A3jDZhMCc8MGtJWYQuYA9VKDkVw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ED37844C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:54 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5462510E322
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD5+Go/3wultsQT1EzXHBmt5wRJoK6fTqU2FEUcIHP8zB6h6B2dhd5iaIPJeu/JgOIkyvGD4rXvJXbAHZS5gJt/2+wQsIqgWoA85BH1SPpnGmVmtF7Po4ZwTqeUhip/mTBVl+jgHgIhkaOgo5SNW0pGMuwxmdCieRbeudzgoRohYy8BvMwIyqG+Inmmi/gYHl9QxTUCkfmIx6nDoOUBeSAD74j1QHgPhbtcJB+dIohnZuIXVQPCLIr3DkqPPSKUIu6B2lswKGTse6mrlfbz+CvEK5YLStPrQl2X0woOtQFKv6XOzHBrbWzx8DyIooh0q4D9+N6SoRxOYDW0NUCpzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i3lRtgCiFKSCiA/qq68ODVyTp5BHm/z/oOZO/zF1z0=;
 b=jT+jVj8VYLGwjDw1uwUCJ7z1uQSVeARRiS1ihueJrTrbpvYqZAOACLM+nRJPN1NpGrEzq20x9je23cXuzwqZOjBk4AzqVCx5dRZdgJuC7AwbojNC0V+vQS/INnrraQfomQGAlgritPeEyQYoP8Y3cvhN4w1VoaZKaTzk+JVkIdpr7fYPU0g7+woJRXPpNXXy4nurd1yI4EimX3TyVD2fqXdrQjFm20JQnYLFrQzZzHFqxI5CZj+7Btf2Z/CCNeUnW6zP48gUOu5QbeKVuDYWm8wKR8plFMIThhBo8NbFGgE+ecdL2AarvRh++zEdzGUOA3rpNxg+2f//MCJ9F9FAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i3lRtgCiFKSCiA/qq68ODVyTp5BHm/z/oOZO/zF1z0=;
 b=YX4ab7AmmrzxU4YBeXDKYMgUPeQFJWr3e8y5nwcyGmxsuJAieM69FRC67FSzK0Uxq25zQDkDZ8BMIiYYo+BMVCxRz2xr1ZlZ0Q0abIeUwR9jBIvTg/lfTn/Xvf7LV6YDKDM5NK0knowi9HENtKgmGoi7RFtIvfukZwPtOyxHJKKmQBaIIBcg2h3EtfGev5iowLVAateM0QGLN/blEBHcWG7ot/1TJCx8z4JHyqUfjAjum84E4ecSpXWdbjFG42IQdrg5knLUgvI8ig2aRQvfIQ74AayDO/heVtkv0VD8IS6UylZtP/gOpOtu8IVLi5bdFz1VJfgO/9Yx9tAiWSvNFQ==
Received: from SN7PR04CA0164.namprd04.prod.outlook.com (2603:10b6:806:125::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:54 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::10) by SN7PR04CA0164.outlook.office365.com
 (2603:10b6:806:125::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:46 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:45 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
Date: Fri, 2 Jan 2026 22:59:25 -0600
Message-ID: <20260103045934.64521-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f14295e-aee1-421f-b0c9-08de4a84ef4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?leqkImFT4xN7gHAYbeXgtkx5uxYJ4y5gmQPtXp1yjWzNg2X+ndvtgikYABmz?=
 =?us-ascii?Q?Isc9AaMkL5cieGc0b3AFT2LqZmG+bCAcT8wbZq7Qp/q/Lsv6lWFiQ1IQO3eY?=
 =?us-ascii?Q?E+oamFaCpnMmGsnVWqbDZLVmZmNV+OK49QZoVxwcPM4bOEWTrP7x/Nw6+NHg?=
 =?us-ascii?Q?HCDGFzfED1zDyuo0s4v1S21w0RGe0JZgXauWA3G56SWOQ3YqqK3AzkwoZdL9?=
 =?us-ascii?Q?0qq+8NvsOpmevyt5dSRJDOUIxBxgpJpSO/EpATROybJADeIOeKqsJt6AoJvx?=
 =?us-ascii?Q?uZYtuwtT1W0cvoTEqn43MaXFT1HgVO0c2+g3q4LNW8XAi0cNls5lydUL3oOb?=
 =?us-ascii?Q?gp3/VaTRPCpVgFpODBDV/8oQdYyL8OBZUicE239G2edrTJhCoaAq/pskHeb1?=
 =?us-ascii?Q?0tl7CmpOeEjv9ZZvIxjDPinzxUykwY0UXg5AbD0REHzOrsA9CkPN/wfz7qPG?=
 =?us-ascii?Q?AwnkPl5VzfWjTXLPLdYf7JDgztOgPU3F7raypakVR2959IIX/T5+Jz/pcTIB?=
 =?us-ascii?Q?zMgipUddXNPlN17sl1TUQKRPyrWVw8P6oCacRAGaZTyLIFsOlj2bI9qoFMCp?=
 =?us-ascii?Q?hcbI4Yw9MIk1mEGcQrl5N4NzLx4jShfwvIjMIxa4rh12QgWY9pQDrcPk9gDD?=
 =?us-ascii?Q?yYpPx8wY0Ae8mxbkyTxR16u6GKI0THS5ZHjhSNbJ0XxDqHFxQO9olChHnYRa?=
 =?us-ascii?Q?mcTbTgrsK1T5fxTO1uPwhPjA1Wx2tJZcAhBxysaPw/7Af19JfG9tEwUMBU+4?=
 =?us-ascii?Q?HjBAzVX3rPWkNjkuY3KQWgqLtSfgu0nfeHc/AnRUjYHARcKGDf2ARdC65TeN?=
 =?us-ascii?Q?YKWOPfaQK3qj9Wi3pOFtxVbvL0LfxFTGn5fHY7gcbPs/thyJG9P+EbupMQid?=
 =?us-ascii?Q?B+kdAt+F505tP/ihdtFNTcL1pP+8b7pYpCjhGKjD9OsYW7c5g7MIugfLHlpT?=
 =?us-ascii?Q?da8CumyexZq9PV9WFt3raCv7cl8DFoTojc+MO6L8MTR1aep9JcsR+pEURFC6?=
 =?us-ascii?Q?gARMMizckHISeXd8vq2mKg9RQRyhcIcWipU3k2BjhGSK1eph3K0w40GrtTja?=
 =?us-ascii?Q?KeJapRMhM+vM1KV9lYZ5DNAUF96c4w7L3lbnQoare4k+e96D7LJgKPzXMbUz?=
 =?us-ascii?Q?c5kq6SpBuQC9q5ER8cui+bi/IdnyoVpeRAM9o+vdqYGbrwF9HEtcWmt+KEhE?=
 =?us-ascii?Q?sk4LqkIEBbvNuH5ahO0cWFuzb8nDhXL7Fj5JQyQCNZYueFhMrQOwW24myJCH?=
 =?us-ascii?Q?4SvGPNypbPEO/jYIh9OyEbIUioLaG0JANVC3dnvIzSPKneGw849fk0TuWKyZ?=
 =?us-ascii?Q?DBF9iBq6tLvgA+EkZ8eF77mF/YquOcSfnWm1svWJ6UyxbA0+plhM9fwWkbmb?=
 =?us-ascii?Q?5ZvGKrFIGMvN0ByiT3U5a/+cNCLPGmCw7uTwvcopcU2kNB8kKs23xMUEUMWJ?=
 =?us-ascii?Q?VAnV7DBAKQCqEsElakUVPr5O6ZWFiZKQbZCEKKE7oyFHB5qmQrBfCR5nC92R?=
 =?us-ascii?Q?Gx6O8/ovKK26hV8moLCiLnZP39MEhMt5/ym7nzc0alqKgjRQTZRgX77hkNaq?=
 =?us-ascii?Q?D30l9FaXL/FEOXfhuhc=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:54.2557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f14295e-aee1-421f-b0c9-08de4a84ef4a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
Message-ID-Hash: PHMYHHTGXUKJSSJY6PUOULT4IPBTWTPI
X-Message-ID-Hash: PHMYHHTGXUKJSSJY6PUOULT4IPBTWTPI
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PHMYHHTGXUKJSSJY6PUOULT4IPBTWTPI/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 19 +++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0965cb50568b..974abc2de649 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
+    /// Non-Secure Instruction Memory.
+    ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
@@ -348,6 +350,10 @@ pub(crate) trait FalconLoadParams {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
+    /// Returns the load parameters for Non-Secure `IMEM`,
+    /// used only on Turing and GA100.
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
 
@@ -457,7 +463,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                (load_offsets.src_start, fw.dma_handle())
+            }
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +516,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -537,6 +545,13 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+
+        // The Non-Secure section only exists on firmware used by Turing and GA100, and
+        // those platforms do not use DMA.
+        if fw.imem_ns_load_params().is_some() {
+            return Err(EINVAL);
+        }
+
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 096cd01dbc9d..1b98bb47424c 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
     imem_sec_load_target: FalconLoadTarget,
+    // Load parameters for Non-Secure `IMEM` falcon memory,
+    // used only on Turing and GA100
+    imem_ns_load_target: Option<FalconLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -359,6 +362,8 @@ pub(crate) fn new(
                 dst_start: 0,
                 len: app0.len,
             },
+            // Exists only in the booter image for Turing and GA100
+            imem_ns_load_target: None,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        self.imem_ns_load_target.clone()
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         self.dmem_load_target.clone()
     }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 6a2f5a0d4b15..e4009faba6c5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         }
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Only used on Turing and GA100, so return None for now
+        None
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
-- 
2.51.0

