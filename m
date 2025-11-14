Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34EDC5F95B
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC3F10EB4B;
	Fri, 14 Nov 2025 23:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XcA3yRge";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011022.outbound.protection.outlook.com
 [40.93.194.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857E10EB4B
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY0g2SeU4nLg5IN2WXRlnBjPHzypiw4TgRjYffvvVlZtHU7MMFrZ35ttUZ/awsqrNGbfZLWbHYhc0+OFDnDL8CWIcFbi+sbMjCcIlyjShdVudMnNRbcr6Fb0ppvPCMyON5VJEFzq2UQv/IBz7mIDQs7PHKoiY4cEzvyDhA22rnzaAH0In/pKAjIdOcxl/6PUN37WsrTAsOCLrqrCoYshxUAaxFaABI3t0Qn/X/2K2SH1/Ok4YQAUb1ojrAguyr+5mzsvehmeuO6exnxH3F5XSkDKv2RsZwuzEuiaSYJeQVmeqM4AvYa7LtpAmP3P89CpRezjrbrWHgm4mdpwOoT39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8dTR/rNbBXgyxZTEzD5FLH9eWPLvjkTQ7/gA8vCqW0=;
 b=JoF3m7gy7u1LDEq2bklPD+uQudYr4AmbvLh1jKW/RLgv0u0PyQ3eiSf5vKFotqYCviySzNDuGT4m3A9ALZG4s88EgTPO89rVEqDdg4e+PwzXSPdpZ+wH0aPIxEMHuuy4LTkeKR3I1sHBqC0zBH0o4VvimLglqvgXiZtvWY5Z4bwz2gfvE+vxtnT63XfeD03JnidGSFTDXnmiJL7LoP6CvjbujgViKAVxM4x5NcQwOMzsalQMWiaKy+P9MLVJ+o6EMH1vjQuaLKwHyhT7xBdAA4c5CKEQ99OrUVLd7MDCaIBeehKNgYphkjvd/aPd/orbooB8vRp+M5anLyVxtIWO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8dTR/rNbBXgyxZTEzD5FLH9eWPLvjkTQ7/gA8vCqW0=;
 b=XcA3yRgebiBMUNfkQjxc/g+lGGFt4/uexdJB5rcLxtIa9HxgV35s/fPYYJgK50YzTICdzzs5UnN8eQeS/EfXcKwf5c2WrxBA/sffpHYXgo10p6e0s2/bLM2XYaE3x+cyYXO3FEWbWXGDMnBrobIr+2BvcZAPbck4xDlU4zh2RP3ZMjXj84xWa1TSOtlwCDtHcXOX4p10+x3GzqLTy+qzZcglApQNd6B7SjJpHSW8kac8Wj2n2+Ju4wbzyqR7L3FmvUQgYfv4nxomO1sZlU4WrXfGQPQQercm7AhOd/l8ezy2jFWGqBl7+gZgm3LAOjgkydIqAlTiH7bFlmx8IUK/Bw==
Received: from CH2PR07CA0043.namprd07.prod.outlook.com (2603:10b6:610:5b::17)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:17 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::bd) by CH2PR07CA0043.outlook.office365.com
 (2603:10b6:610:5b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:30:50 +0000
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
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:01 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:00 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 07/11] gpu: nova-core: move some functions into the HAL
Date: Fri, 14 Nov 2025 17:30:40 -0600
Message-ID: <20251114233045.2512853-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f14d3a6-5b96-48d0-b221-08de23d5e87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4GzLC+S7PCtihCMbwY6mQwvdjgSpmz9FjQ8XYSfvpPnCgHznFPX3DWUdQ2SY?=
 =?us-ascii?Q?deh6YuiPfUduBmgOhSOw4HnKsmRQHc6ofLC/COG7zI/vP4lOnBNK8PuVE3CD?=
 =?us-ascii?Q?PGxNUWSDsc8TtBneKyKue8Eg25rk3CNJZdh8jIWvRTFP8ipBMHkFw9zsJJPa?=
 =?us-ascii?Q?kIKWJqC1BWfkepCRQEIyk3UxxmBMADN9gVtUEb1+nYU6p11vF+4+nahGFW54?=
 =?us-ascii?Q?tXn7Fg2vznFelp5OrUf60IXAZ+mu71ZESebA+HSc+DId4RWbMnE/c9uGE50a?=
 =?us-ascii?Q?xXbQ4BVJ0nM1I7ro3oJiF0ucEjUMikfPzMLCHyGzM2qbRLUUE8uHeQDC4e0c?=
 =?us-ascii?Q?xgcwMilHPo2BVRhnkFyNUdN3vEoQiuKN02vHC5X8JTWI+7oGgtIHAYBkQYTH?=
 =?us-ascii?Q?+b2KXDTKEW/dDEHUHU071p8NsX5/lEizhW824dSUTrpFu+km3xv5YyiGfo0D?=
 =?us-ascii?Q?Qp7XI3V+h7zsUAsV6J8G8vdDoTwEY7cosuIHZ8q9aWMXlx+OxmCMaFf12Xud?=
 =?us-ascii?Q?9CkHH6FUVpxEnRNNVcRU2Lg5vQilXBArGL0+Ah5Uxt19fdtLOwzgE+r3zWkf?=
 =?us-ascii?Q?r/+VVJSi76UJEbzYoiHT9N8heOaaMvuv3epFUTj/m1u3Ucjv4lVcnXl5A2Fd?=
 =?us-ascii?Q?AbhrmO6N5yz6i2W/E9RTy762vUFW3DUPuhknKWcbG455iUhilqXL8Ih7VeTO?=
 =?us-ascii?Q?FSP79qs0BYNU+4Oy6kATdaGdEV1E/zNVw666rJwmIApBhxn/hpWrANY8KZ0C?=
 =?us-ascii?Q?VmrMaz/v8j+eCvWwEEqL/7JqRc7dlVr9j505vReXGyqwmEAhbRMnJagj7XVk?=
 =?us-ascii?Q?OsyPRUdA6siHgIeg4lzA6gAE0kJzO2kzjB8nVwQ781Of8vjAdIzGtaHHLCPW?=
 =?us-ascii?Q?YLz6itPRpjbaYZLj84AU8b+2jDo+Bap922iRk+s5G9DaN9Nye24yVGalC85q?=
 =?us-ascii?Q?lBl3pxRBRM8LxQo3lxGCmM8+KzlpYHOM2j8X5AtuuKNky8iqL+9eO0PLR71M?=
 =?us-ascii?Q?l+Ah+XxzOCQWdyoPKOA4v3iLNWAiSV20F4Tge9qtnarsE1xOgTbsHwL0Xnv1?=
 =?us-ascii?Q?82MQ0OZud+nt9pnatfTehhw6KJqzylmSrd0R+zrGzYXmhAAg/hr7l5+qgUsa?=
 =?us-ascii?Q?iggGK5sJdkfnaZqlUjhwF2l9qwZEUBCpZS8b5fy/ETdFeBCH9Czpp65bO5Nf?=
 =?us-ascii?Q?OXCQYGlIMQ7oadauylenYy975N6W2sctOct49vVkQuxESu2nSlFHsmBEwbv3?=
 =?us-ascii?Q?Wj2fZpTHi1z/L5rPUXhLLkp49PzU5WicoDl1onxIfemgV7qyN+IZd/h5BqR9?=
 =?us-ascii?Q?yLDryExywy07TXKh5F8XX/4QshtGXvjMwW0OweVFn3b5w8i4f3rmqSxgS2KQ?=
 =?us-ascii?Q?7yUSd7K21/Lkh8JAgRE9JrdLY/gr8lxoaw5dW8OEzCHrDOxiD7aikVaw97Pb?=
 =?us-ascii?Q?Rnz7O4siqJg/Nbj3Lp6L7mIIk6KIYK6LzrO8j51/9s5uUoMpjVBdD7lrJCpr?=
 =?us-ascii?Q?tsqhyHWILr5E0IXq+WXMEmhlqk7V2xercLfJBFgmNsDsdUWBY8ihi1tQie7X?=
 =?us-ascii?Q?kBAKcar3zBjB/QokLeQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:16.6964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f14d3a6-5b96-48d0-b221-08de23d5e87a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

A few Falcon methods are actually GPU-specific, so move them
into the HAL.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
 drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 43 ++++++++++++++++++++++
 3 files changed, 56 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1867d3727582..7af32f65ba5f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -13,7 +13,6 @@
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
         Delta, //
     },
 };
@@ -388,48 +387,11 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         })
     }
 
-    /// Wait for memory scrubbing to complete.
-    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
-        // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.mem_scrubbing_done(),
-            Delta::ZERO,
-            Delta::from_millis(20),
-        )
-        .map(|_| ())
-    }
-
-    /// Reset the falcon engine.
-    fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-
-        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
-        // RESET_READY so a non-failing timeout is used.
-        let _ = read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.reset_ready(),
-            Delta::ZERO,
-            Delta::from_micros(150),
-        );
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
-        self.reset_wait_mem_scrubbing(bar)?;
-
-        Ok(())
-    }
-
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self, bar: &Bar0) -> Result {
-        self.reset_eng(bar)?;
+        self.hal.reset_eng(bar)?;
         self.hal.select_core(self, bar)?;
-        self.reset_wait_mem_scrubbing(bar)?;
+        self.hal.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
@@ -629,8 +591,7 @@ pub(crate) fn signature_reg_fuse_version(
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
-        cpuctl.active_stat()
+        self.hal.is_riscv_active(bar)
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..c77a1568ea96 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
 
     /// Program the boot ROM registers prior to starting a secure firmware.
     fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+
+    /// Check if the RISC-V core is active.
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    fn is_riscv_active(&self, bar: &Bar0) -> bool;
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..232d51a4921f 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,6 +6,7 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -117,4 +118,46 @@ fn signature_reg_fuse_version(
     fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
         program_brom_ga102::<E>(bar, params)
     }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(20),
+        )
+        .map(|_| ())
+    }
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.reset_ready(),
+            Delta::ZERO,
+            Delta::from_micros(150),
+        );
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        fsleep(Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
 }
-- 
2.51.2

