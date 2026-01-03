Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE499CEFB13
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDBE210E339;
	Sat,  3 Jan 2026 05:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E0QlDfpB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 174BF44C8C;
	Sat,  3 Jan 2026 04:52:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415931;
 b=CrbZ6rYjxlfjhyEBxdgOdwpkDdcTkOjL1UNYwjSwAspC8Zi5WD8/T6Te/NWRhXxh6m4LB
 AvxdQDfeAD1SqAUGenulDxyNKpa6xhmhB85tGIB0IVql+Jt4d8+MbIIKZdNrN76mwIYIqZX
 eoXh+r6Bo7bsGrBlkRnjMcSwQvezxiR/dzs0z3WSD6bEuYPqpHhdiQKYjm/uFya4LPYS6ja
 Ky/5J240pm0rDvm9CzNbjUHVksjs8FEek38ES8fE7Sh9HXCxEdapyzET9354wi49NUGO//C
 KBy+Z50E6Hp50BWY1/0+gY2C11CXZsc9oHWTB11C2zEdNc5al8vfVhN743rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415931; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gFurSLaEgcmhHVBR+EmMZZloOgmBD4MmCADN8lDqzwM=;
 b=JP7zSUHOp6YqLUe8Qh8TO3G5OVO4ppo0LtFSN7ZbsL2WDjYD2773TMcEQC5YDhMORyZH6
 gFvpwGfemnqR1GGLyW6zopTHzraxqr1lmFTedTcf+rujEskBTU/0UAvWXhGfxCbb2QGuqjX
 CwY3CPtR9bm2W6jJgHXm3kLWEHIQxcegPVM0lPqTaBVZJsZ9vP0OKZ4D6PU9ctU7fVRTGEu
 X5u8a+RhdmzhUECVCwFOvyl2ilgoekzXXk23oD97qWhXe5hH7H9yTVnEU7eTgStzv5qODwD
 YWVrjSkUw1OJgJJNN3TMfVl6hOUwK1PvTneqJ51xUxG3VQQFttbKWJu48T4Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 39C5D44C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:52:09 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4610E196
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBtF+BAIzq/V4InGxFHhYOXgkRb5SA+HtOwoUIXWPJPKcyor6zWkRzzBELs64m3mP6gyiYTFtHTOQfAhJ+ARmBa5t75RY71D5uOfAD2jk6CBDugaD4PFiGftv8WLcxixz8tS3z8yscGjHU/FbX80CuNdX2Yc1dliusBt4kHRm1fZV+zDyZAgLgpvyTH+X8qp3SgPKWBiuqzIPXppmWP3PGmtEarw82bkyg2oijdJKf4ozvGvYIOLiC4IX+rnDILDS5sw1srI2LgBGccxuf8Pxe26kFCWnVNwkKGXMgs11LWokA8JfchXQkwfRl8rI+KxL4pmwOHOOSQddGsMyxtlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFurSLaEgcmhHVBR+EmMZZloOgmBD4MmCADN8lDqzwM=;
 b=EzHUI+WO1SJjjOxhzNJp8exO3DACs6YF214LaE79Cq0RDYXiIhyBUrZ78oXGgT//FYxyyJo5bFi8VXvIOknWOVU1Hn9RqINkBAidlF1IUimUVL41KHDrtA5wdZZ6Czks/LHE4QqcahZa4FV90GmN6rIfOBvMG6ZBM28vjeVSXbYGxwwTkf2b2zHISG9Mxzzw4Bgi+wStUvMKyyI+5cbeWdOkEDrbPplZtllExiBBn17edTaB7JdH+N05LFE1fmd/h3rV8I4zjdaSu7yT+yLhLQ/4AcvBo/Nxc/2MYCOB3Ik1PIxQUI26J6f+Q41D1KxlvZ1s2/MPEtHB20+7FFdPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFurSLaEgcmhHVBR+EmMZZloOgmBD4MmCADN8lDqzwM=;
 b=E0QlDfpBvr8T4mpXQxVt4WEvSyXziI8P3yIpSdU5pbxPvuBUQTq2ZFAhDl9M79yhD7dDCmGYaG3ysAUfBu9Fxd0QYjZvgc/c3Go22gYuA2MtJ45uwJki1+jLw2W25rEqBf4nVB0aZlQtPGHo+g5E30Rwf+n4GQm9zJ3rBTpEPesipQ/S/oRhKBsa5QarsA4Xm8Mp8r+QaLgXwZa8v3FDYHbk1w4CWhvZ9v67ZtT1SgKVVdzvPSF4fFuLD8H1zpi+9eAVJvn7DoPAIr/mBrs4vgEiuBNXEquoNaOVxwHJarcd3OTS1U5DVKecC9V4QcMwnYbPPQKRLTlGImh+CoATqA==
Received: from BL0PR0102CA0009.prod.exchangelabs.com (2603:10b6:207:18::22) by
 LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 05:00:06 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::4e) by BL0PR0102CA0009.outlook.office365.com
 (2603:10b6:207:18::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 05:00:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:57 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:55 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 11/11] gpu: nova-core: add PIO support for loading firmware
 images
Date: Fri, 2 Jan 2026 22:59:34 -0600
Message-ID: <20260103045934.64521-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe616a2-a4e1-441c-6b63-08de4a84f681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v+eETMZye3YYDich+Bmz0c3x7s+v3MhdsHtA23OXZuw38nloOc3jtI5FjHta?=
 =?us-ascii?Q?Uu6UYUuONeWgft6FwB/FjFoiuHh6PTovsqVozRa0HLsvdC2aorNbWMx0QQJq?=
 =?us-ascii?Q?UksE6BlfmWHMpBF2gl++MKDYqdhn+03RGzHl/kvlr6d8dtKoTrE92i1whtZ0?=
 =?us-ascii?Q?wYq+K7UhsSVMKH/9Xf6mdA48nbcuO1Mlpdgkp7Jwfkp6fd+hkmjZYZQZ7W7C?=
 =?us-ascii?Q?rRK3sFWM2ALq0PGY18WdkL/vbi7JSzpJ+q2LXeh6KSocv3cnH4rZ4yo6gkDW?=
 =?us-ascii?Q?8y3Gy4a6KYpv5VQ5M6YgmELjhPPnsNMk6Imslzsv17GO7lvZWWmjR0WLsZKv?=
 =?us-ascii?Q?hMpCP3mEzp1RWaI4Y78Am4Bk8ViNaxq/7j1DEP7rXTdIbtzJzzBVbQ/frqYW?=
 =?us-ascii?Q?C6qfp3aOfYNWVmrULCPdHz2iJBTLLIY/fc28sM2Vnxd9FkBcyGU7SxpoeK/z?=
 =?us-ascii?Q?19Mj4QxNuI7LLMq9u1ur26n6vOKSeqq0nsgNcQFB3p06xaUFuMeX7N08PLlK?=
 =?us-ascii?Q?nxShHGdzdvEh1cIMiQmsjRGRj8rrkMI8kNL8h8CWXiROZZhPX6XZlt8hWRkH?=
 =?us-ascii?Q?nX903O9OlMYlmK6TnQ03TrDNXbcfjflTx4k2CJ/2y+SaS5hBqY+RcOAVINPm?=
 =?us-ascii?Q?kr5Aff+txFVdemvoP7xxDVUOIxU4By2oYzNn11bKFe7ZBjdKODqVf5XhRlwp?=
 =?us-ascii?Q?0nJ18EXjYcy23j76mKBz9mT2tyGd6JK0X/8h4HWVrHX6cjFoyuaHTo7cjY4j?=
 =?us-ascii?Q?cANfY/o9sRTdB9ew6JB7AFKVfqptDGTbM6G03LQh3qNfiXmOFcJ2zlxCPM8P?=
 =?us-ascii?Q?VfUyB/sWnpngU8QgppcZuar8t1QwYYM9HOuR3EEg3gRG+0Ww8rb3IMxNlDsK?=
 =?us-ascii?Q?BN7ZreaOl0aaAAp7S1bUP2/QdeA9fsGPuHaZVwpicuDI2/BoXZGBeSCN4lcq?=
 =?us-ascii?Q?hzKoMzoEqUb7RQubOKtq9T9vC7fcVW4ydDlWe9bYLDDXI/uz/isrQ1G0eGYy?=
 =?us-ascii?Q?FFRmYELIeTmxGPQpSJTuZ1htfx2F0O5QZK1+yPcpN1gYAMFLosPVC48NePxJ?=
 =?us-ascii?Q?6b4d1npd6xTVkL004Pm6GyCYE5Zc6riuK4jIcV7coMcDJFH9lOD5CLYA+bEM?=
 =?us-ascii?Q?ByThyixqt7kmhXrUNJAy/Ro3VVhKCaIF8lVyqnqPFWCL/6jZwWOeF4XoB/2P?=
 =?us-ascii?Q?/XGUUUvKx1Y8LwPaqSsU325yPmbDyXko4gq06O6qwxsBV1DHtljWBjsIEGBC?=
 =?us-ascii?Q?wlDR8chY4lXd3U7l3AareHyDZoZmi0Wcge8/W2hEjgeMDQfXCsDzSK+MWugp?=
 =?us-ascii?Q?PvEWSRQdkGh1JTZWtkOaxbQCLYCufJQIBRSovK+lCRCK/u/Thz60eK75jnN7?=
 =?us-ascii?Q?S4/y4kMCUcDOFkuA8lTcBUiB35DDBCJ0y2Dlo31M+gEIfln3VkEg+anx1eLp?=
 =?us-ascii?Q?D6On38TKhh8TVUZIMU3VB/tPAUY4BmUTC8zwMmPMssOl1M1idV4n18W2UkSb?=
 =?us-ascii?Q?rthRcoWkt4Adg4XwbTqZ8+DSSkhtMYWldOJmzIq3VqnPavPeaBOLpuBkgkgt?=
 =?us-ascii?Q?ISCawy27gEKX991blC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 05:00:06.3055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfe616a2-a4e1-441c-6b63-08de4a84f681
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
Message-ID-Hash: 4RUMARWHYLV6NN5NCHFVEHZK4M3RRIHS
X-Message-ID-Hash: 4RUMARWHYLV6NN5NCHFVEHZK4M3RRIHS
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4RUMARWHYLV6NN5NCHFVEHZK4M3RRIHS/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-12-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

A new firmware called the Generic Bootloader (as opposed to the
GSP Bootloader) is used to upload FWSEC.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 185 +++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal.rs       |   9 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   5 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs |   7 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 124 ++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
 drivers/gpu/nova-core/regs.rs             |  30 ++++
 7 files changed, 350 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 744f513da9cd..be144bd139fb 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,11 +15,17 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    falcon::hal::LoadMethod,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -406,6 +412,169 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Write a byte array to Falcon memory using programmed I/O (PIO).
+    ///
+    /// Writes `img` to the specified `target_mem` (IMEM or DMEM) starting at `mem_base`.
+    /// For IMEM writes, tags are set for each 256-byte block starting from `tag`.
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_bytes(
+        &self,
+        bar: &Bar0,
+        img: &[u8],
+        mem_base: u16,
+        target_mem: FalconMem,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if img.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let port = usize::from(port);
+
+        match target_mem {
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                regs::NV_PFALCON_FALCON_IMEMC::default()
+                    .set_secure(target_mem == FalconMem::ImemSecure)
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                let mut tag = tag;
+                for block in img.chunks(256) {
+                    regs::NV_PFALCON_FALCON_IMEMT::default()
+                        .set_tag(tag)
+                        .write(bar, &E::ID, port);
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                    tag += 1;
+                }
+            }
+            FalconMem::Dmem => {
+                regs::NV_PFALCON_FALCON_DMEMC::default()
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                for block in img.chunks(256) {
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_DMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    fn pio_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        target_mem: FalconMem,
+        load_offsets: &FalconLoadTarget,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        let start = usize::from_safe_cast(load_offsets.src_start);
+        let len = usize::from_safe_cast(load_offsets.len);
+        let mem_base = u16::try_from(load_offsets.dst_start)?;
+
+        // SAFETY: we are the only user of the firmware image at this stage
+        let data = unsafe { fw.as_slice(start, len).map_err(|_| EINVAL)? };
+
+        self.pio_wr_bytes(bar, data, mem_base, target_mem, port, tag)
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
+        let imem_sec = fw.imem_sec_load_params();
+        let imem_ns = fw.imem_ns_load_params().ok_or(EINVAL)?;
+        let dmem = fw.dmem_load_params();
+
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+
+        // If the Generic Bootloader was passed, then use it to boot FRTS
+        if let Some(gbl) = gbl {
+            let dst_start = u16::try_from(0x10000 - gbl.desc.code_size)?;
+            let data = &gbl.ucode[..usize::from_safe_cast(gbl.desc.code_size)];
+            let tag = u16::try_from(gbl.desc.start_tag)?;
+
+            self.pio_wr_bytes(bar, data, dst_start, FalconMem::ImemNonSecure, 0, tag)?;
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
+                data_dma_base: fw.dma_handle() + u64::from(dmem.src_start),
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
+            self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0, 0)?;
+        } else {
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemNonSecure,
+                &imem_ns,
+                0,
+                u16::try_from(imem_ns.dst_start >> 8)?,
+            )?;
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemSecure,
+                &imem_sec,
+                0,
+                u16::try_from(imem_sec.dst_start >> 8)?,
+            )?;
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
@@ -629,11 +798,17 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
-    /// Check if this Falcon supports DMA for loading firmware.
-    ///
-    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
-    pub(crate) fn supports_dma(&self) -> bool {
-        self.hal.supports_dma()
+    // Load a firmware image into Falcon memory
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
+        match self.hal.load_method() {
+            LoadMethod::Pio => self.pio_load(bar, fw, gbl),
+            LoadMethod::Dma => self.dma_load(bar, fw),
+        }
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 49501aa6ff7f..3a882b7d8aa8 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -15,6 +15,11 @@
 mod ga102;
 mod tu102;
 
+pub(crate) enum LoadMethod {
+    Pio,
+    Dma,
+}
+
 /// Hardware Abstraction Layer for Falcon cores.
 ///
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
@@ -49,8 +54,8 @@ fn signature_reg_fuse_version(
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
 
-    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
-    fn supports_dma(&self) -> bool;
+    /// returns the method needed to load data into Falcon memory
+    fn load_method(&self) -> LoadMethod;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index b2857293e653..00a78510b7f1 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -17,6 +17,7 @@
         FalconBromParams,
         FalconEngine,
         FalconModSelAlgo,
+        hal::LoadMethod,
         PeregrineCoreSelect, //
     },
     regs,
@@ -159,7 +160,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
-    fn supports_dma(&self) -> bool {
-        true
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Dma
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 28dc03db8240..5fe578f6667d 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -14,7 +14,8 @@
     falcon::{
         Falcon,
         FalconBromParams,
-        FalconEngine, //
+        FalconEngine,
+        hal::LoadMethod, //
     },
     regs, //
 };
@@ -77,7 +78,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
-    fn supports_dma(&self) -> bool {
-        false
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Pio
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 5d2323b07241..f1f8f921aa43 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,12 +40,15 @@
         FalconLoadTarget, //
     },
     firmware::{
+        BinHdr,
         FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
+        FIRMWARE_VERSION,
     },
+    gpu::Chipset,
     num::{
         FromSafeCast,
         IntoSafeCast, //
@@ -213,6 +216,68 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    pub start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    pub dmem_load_off: u32,
+    /// Offset of code section in the image.
+    pub code_off: u32,
+    /// Size of code section in the image.
+    pub code_size: u32,
+    /// Offset of data section in the image.
+    pub data_off: u32,
+    /// Size of data section in the image.
+    pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    pub non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    pub sec_code_off: u32,
+    /// Size of the secure code part.
+    pub sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub data_size: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub argc: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -275,7 +342,19 @@ fn brom_params(&self) -> FalconBromParams {
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
+            }
+            FalconUCodeDesc::V3(_v3) => 0,
+        }
     }
 }
 
@@ -376,6 +455,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -432,9 +512,49 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            Some(super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?)
+        } else {
+            None
+        };
+
+        let gbl = match gbl_fw {
+            Some(fw) => {
+                let hdr = fw
+                    .data()
+                    .get(0..size_of::<BinHdr>())
+                    .and_then(BinHdr::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let desc_offset = usize::from_safe_cast(hdr.header_offset);
+                let desc = fw
+                    .data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = usize::from_safe_cast(hdr.data_offset);
+                let ucode_size = usize::from_safe_cast(hdr.data_size);
+                let ucode_data = fw
+                    .data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader { desc, ucode })
+            }
+            None => None,
+        };
+
         Ok(FwsecFirmware {
             desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -450,7 +570,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .dma_load(bar, self)
+            .load(bar, self, self.gen_bootloader.as_ref())
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a53d80620468..0127138644b9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -48,6 +48,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -65,6 +66,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -144,7 +146,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -183,7 +185,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        sec2_falcon.load(bar, &booter_loader, None)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cd7b7aa6fc2a..f0129a5f7a7e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -359,6 +359,36 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
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
-- 
2.51.0

