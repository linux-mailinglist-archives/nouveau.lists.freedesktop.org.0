Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF06CAE66A
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BB10E423;
	Mon,  8 Dec 2025 23:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IWoZF6Qz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FE410E423
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg08ZZSj+oLU00cMqtIzfCCa1oM5UuOAWPC7HqGvBN0t9FTY1U/d24w9MtL6HbmAzf6I/pS4gv4MV+B89FUNDeY/kA9qm3jt0ts/XxZ0t8vtLVaHf+xvG7b3hjYpFBDgJmxZi5F2Ba4oEXjDmxtZjwjnIkDSZPr0pTo4/IGdT/XpinJ2Le814Mj46EeeI7eAu7aJ4XhiWwyZ8BIA8JwrGXaE1lI/Owm5K65y6Uw9jVcB5180PxCAuwVpBakqpqSHoLzPHqhS7sJpPhGolmvYandCuv0V9ZKy448agC5ECkG+bnDdGDXxAPdbJ2KmKgQZvtWJXsoyosNu6VBLFJRQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiHslhmACHvHVxGqnK+HtKuAViJM3pq28078TTSgEe4=;
 b=BzIeAg2kotobDP8V8wdFYfJYPPo++X3jWZEUj1gMYZ/732LL5e4kfzQAFbIeFh0/7CVzBIcxiu6NdkiqvWuRe8KaMWNQvFmBm3+eiNnaAu/yE9thDt1LWEBLTc0Md64tCf5bygcHkblwl9H/EirYXZY43D2DCid6XRLeGwl4Er/NHDdSICPUFW/8d4p4/e1yNwwrUPrrvxnNopXf9Wpv7ur3JrSHU8RtVNiLLF1HVZGQBn+Fea/HlQA6Pa8PRqN2oM1AkFlS4sWSMTllBTYH3FAKMJ8Vaab2cSvYCyi2tDVz3olskn2P99C0GmUCN7rshCCk4rqQER9IRM7vGXR7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiHslhmACHvHVxGqnK+HtKuAViJM3pq28078TTSgEe4=;
 b=IWoZF6Qz9JpW8dMcyVMY4ryb1TGnD0qVtWDM4qIeWHL44R7EcnmxVjv6a3n6qNrWX2YciVBNZOH6uGMEnnsraDVJAGXzXoo20mqI51K0kVnQ8udcgxvnmJB1WPXC5cEMHNtZzCDu+pfH3zhRF7ubMtzKX3HQK7asFZgKzlnCY9u9SNuREMTRDTcqB/Xujiif1Fx8FFLidpi/+EwGvpGAo7WX7xfODO7cNoQZE5CcdJQ8jmC5aj/i+ipWQaLlWyDXJ63LBULsgaXIMj/Mn1gE+pkSAveh6OxjXUeQUBimyYt4jVj6Jwx/cEv2cc6yaJkQMHkmZFOcjXr+Mbm9nos4yg==
Received: from DM6PR18CA0014.namprd18.prod.outlook.com (2603:10b6:5:15b::27)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:32 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::b4) by DM6PR18CA0014.outlook.office365.com
 (2603:10b6:5:15b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:17 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:16 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 07/12] gpu: nova-core: move some functions into the HAL
Date: Mon, 8 Dec 2025 17:17:56 -0600
Message-ID: <20251208231801.1786803-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c0e91f-7af4-45d0-f678-08de36b01a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3JJtWhD4GvJ4c1cdzABgBG0QkmmLoOLCCls+HPwMkSogZ+2e0HlQxZkq/FAC?=
 =?us-ascii?Q?Y0716IXwOPJwVs/KDujGI0IZff25u19quC574FFKKMUnfDr/46apIOgYq9DJ?=
 =?us-ascii?Q?fwuxpkmmO5ikWHV8FkpCAh7xUKlnQYQUivViFUCni0bH5tzXKvjyNByfJgWa?=
 =?us-ascii?Q?f85o2cbb3zFgzn8157rCDz3XVbcsUjn09NVVEix/C9YJgoBS7EqREG3+AErU?=
 =?us-ascii?Q?6oX26zDsNp6MsIb3PBZRSwjsF57M9Ou1c5YHhiaLxOP4C7wibU5YQ2pdmmCx?=
 =?us-ascii?Q?VPMO8ANsHGT7GKVT8yBAJvFl6pit5HpVSwRKhNFgysO0m5MqAAZFOcFtzdG+?=
 =?us-ascii?Q?rsRZYnKVJDOmlyf8Tm0VPneWcaaMnVxz1s1j6sQAGgIyErJbJF+C0js7Rtgr?=
 =?us-ascii?Q?xQ5G+bYkKDqtdwpMxOJd7dPvVjgXZJcUseeD0ctYNKyStbe9EN/Vvv7Pc2dA?=
 =?us-ascii?Q?VNv/O4RbIWkgyhWpBW+rd7gAGJLNh8vvCP/111E23ZZ/VE7z8SxcKxh8Bdob?=
 =?us-ascii?Q?r6ir6u/c00lyfV12zKNuZqmqKuK4tCGT+Yi6MFEs3XmsZLh0/v4Mm+YbVl1e?=
 =?us-ascii?Q?H+JFZlZCQWf0okVNrV0I7k3OAznqv17NgbwVc/UvRK8ocSgyGtA/E31nOr5z?=
 =?us-ascii?Q?fPXlTFshY2kOAroj6J8a1ZLdMeqaiJF/D7WitmdnqXIoSyp/OSpPSKAGKNTI?=
 =?us-ascii?Q?crpNJuMR8Js1VsoJVotd8qlSLnWUyJU+9y1hH4PU3DfI47ueQZOQRQQVLNNn?=
 =?us-ascii?Q?e+q7q7e9n5Px/Af0NRVmfrjDO/bb0vZnmi3HTboD4qW/FcxfJejUZ3MVSq/9?=
 =?us-ascii?Q?oU52kTimFAIBKrMQXX0cTg01E4eCODy3xdnp8b6vWau4blqkm26W0p3ajFaR?=
 =?us-ascii?Q?QhkEwN4uTxrJafx8p33WQP2ZpyyLR1V9dw/xHEY982KMZsdXIvAYPZsNUWuD?=
 =?us-ascii?Q?9NlHInladUmVNsz4q7IYWHzVCNdyoOxLTJxP/qPQDtyoAliJaJRznpD4akp1?=
 =?us-ascii?Q?A21FkSuRjCq1rupp9wvtdlNO07h9RKng0+1kwNZRl5caagsNtz92mFK+m6Mq?=
 =?us-ascii?Q?WroDfPmbu982VlxVpuFuTcpmgL59ZfnWnkeS295LCdm/RKL1p8cy2cnkxIu3?=
 =?us-ascii?Q?n4YkmWTnfTdbadDxoX6vELcH1NJXRweI+y4utzSIymdG8rouM5xhTNFUSEkr?=
 =?us-ascii?Q?1teUCzZ5nnXzId45Q+qKjSqPhFvgMWHSKIs51ivvDLCQXd6hymkYhBu0uNO8?=
 =?us-ascii?Q?l61vOBVHE7eROyr1GX7myQPzAbO/GkdX+rjqbAGf6z1EEzz3EScbvf4Jt9W+?=
 =?us-ascii?Q?cZUdZJId7e7m0D5s6d2SkrFYx6mG9yRT6E+o3lBL/V4WVQ2/pt2dN29bWhGJ?=
 =?us-ascii?Q?As5KoRdkJGjsp8OfUj6YkO0ZyywN0ywhCqxVDhBdPK+u2C97hO/FhQ2hKAI1?=
 =?us-ascii?Q?tmH4NH3oJ2IRElXCaZrI9FPWkCcFcKN/eimERXRLHEJl6XGaPfhHhgRwipDx?=
 =?us-ascii?Q?A5CUBqmC/RxpFmA2CGfQs8Sj3zLQDe+Y3arVhNF5pl1qyzpmDeJQMIRwGM75?=
 =?us-ascii?Q?R2VP9fSyU7dHHry+yYg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:31.4825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c0e91f-7af4-45d0-f678-08de36b01a43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121
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
index a480f8bbeb8e..f2da6a4a9d36 100644
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
@@ -394,48 +393,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
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
@@ -666,8 +628,7 @@ pub(crate) fn signature_reg_fuse_version(
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
2.52.0

