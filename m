Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA3BC999D5
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCBE10E4E3;
	Mon,  1 Dec 2025 23:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PstoBxmF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9910E4E4
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6gWJPNyu9natOsjxAMuc5WCmibq2MOeANf3G1KNVNXBjTJisUQ8kQHsH+Rjm99FLoFrar+wLFY1tYKpqWvrq8UzTsNyH0q6X55INk7BVn2ucGsv3KjPGiEGQreKwITSsy86/Qi5hwJsIC7AOMDxcS5qgsczNtD7Xj6zTXZ3SD0VlN9eC/8yTqJvYD1YPbrhlquG1sgwfs2zc+p45ekkgXx85vzwMaiApKsn6P0Z0qMhD3Bz9meoxcCHWHNLfNXXgtKPTw1iWuI+HVyHb0WfeXGZeBMFUu0dR+1zL6LfauzsbGBbB726rRmz9T9KSx9BF8ULJffPpzVtbM3HXBrcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiHslhmACHvHVxGqnK+HtKuAViJM3pq28078TTSgEe4=;
 b=tWhKtP60imNpKpoW2MSnqp9F42AxJigMR7pojU850R1u0ycm4Xsas9xRLSa7AHUIdMKhbvSB6veqyv+YHLasTINYyacj55bH7LXTI/KeSGK/nVcqAY7DHXsoGmIE6bF+3uuBD2eilTz90TFIQZOQnOCFet119Ac4WDm/CrpS2WYRWK5Vh21fW0uu1KlZ8PHXfCEyAPm44ETapvO4guYt3nOrb0XvMf6Xo2631DB0A3EqR2NvktbF/CJGWvuCuHoF5w/sqypgCaqtfPRq/kslyKiKyzdAuAQE5nCgwCO7H5l9WKSE8AN7hd4Jof14FnREbsYxe0MVBCicGp4VdzGx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiHslhmACHvHVxGqnK+HtKuAViJM3pq28078TTSgEe4=;
 b=PstoBxmFatqxXPvp9vavX1zJPRKAUOB49JgaYzTYc7GiNYPYbb/1V8cVntfScZqEh7jbchVOpAQ3qcqi66PA3agZgZlS7Dd/E3fD+ouSWIwO6tCLICbG622xkq3ixbye5rUrjRFUpkk6z2Q6a0X/yRUJG5V3/JHUO4MezJDVXQzIVuGb64VrpNwN49q8r88rz2Ak8FBEzrSVWLUr6OlpLqexCp0qReRW+fh2oZQWvRQiARK2fMvQd3wWWCjE5ViHhyqtBeujZYf6C5MMLqoJElb/yGTy4ejQvKTPoNacCMVF4oerZ13mvM+XbeGpGAQbt/vT3Nj5G23ESRg6H66qDg==
Received: from DM6PR05CA0039.namprd05.prod.outlook.com (2603:10b6:5:335::8) by
 DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 23:41:21 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::b5) by DM6PR05CA0039.outlook.office365.com
 (2603:10b6:5:335::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 23:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:07 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 07/13] gpu: nova-core: move some functions into the HAL
Date: Mon, 1 Dec 2025 17:39:16 -0600
Message-ID: <20251201233922.27218-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: a36b89bb-f306-4c95-60b3-08de313321f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jppqKF/MWc5tLlkdHh7JGOsTPgJ+XBdMKdLqBtjm+Q8OJlN0YE/3FAieXBMP?=
 =?us-ascii?Q?QgQX5xpfFVTtEOIGjtREi9HF8x6KXqjNB8sO7lBlWUoy/az3b1iynuux1McS?=
 =?us-ascii?Q?djsAsClNmLiPvPF96lAfklO2+cTyhOJYtyk5tj7Z03o+Xl1h4BUXX6RiDPpt?=
 =?us-ascii?Q?J5fwZKsA4l15UtytI+Ik9SG1zdCGuk5K/NqtXp2Au3VFt5IyDj46zENRtKaN?=
 =?us-ascii?Q?jFtkqoTS1hBnp6YZQur7uRhsNdbii97+3E0EtmZY3MO0IZud2NuM0Dvtc8v7?=
 =?us-ascii?Q?th3ku4LTcxZUB3P7J4z8758u1LcDi+OopjszYtupc3vffw26GTVzsKeSp5Ow?=
 =?us-ascii?Q?OWI1yC8FuncZGSq5j+Q9bvJoojLrPf9FPoA3FLBL169UfN7WI9NjHSVjT1lP?=
 =?us-ascii?Q?Qj649xxvs7p5MAfmFp7VIpg4wDKjTRggr60Nm0KDuWxnjPt+B3Et8eWA8tgH?=
 =?us-ascii?Q?sdBFdkny6x8HgA0pp5laGGNm3FBJzv/byUsLu1w9KU0KCY2rxqJ1D7Wb+R99?=
 =?us-ascii?Q?pyZcxeRwwX2ufa2+sY/ypB+8+/yDvt/SGR93BWCJGhDC5dvVicDK6vrnPc2i?=
 =?us-ascii?Q?6FYrv8xTwj82riebWxCejome44A8Nle3PkTPEjCjBIRov+hr24wzm7R8ipvh?=
 =?us-ascii?Q?QdYSLSUobEIyDNfRzVfERhvzbMNNNJHu+y7mmfcGAniIaPpgFcOGZPK+9Kac?=
 =?us-ascii?Q?YYQjymtrTMZtCnhl3AiVo1r+I/YC2KqnW32D6T4SNGbk3hVAf52jYtlgVADG?=
 =?us-ascii?Q?5EmAP+vVrerawqwQP7ncHgBKRrIFS1T3mxBDyrvRvc/xqKpr3V/YmCIUXjPr?=
 =?us-ascii?Q?BdAGq5gd/FS/8we0gymbgghygGTMrx5Bv2JsJLmYOSKLR+yMJW9c355cvlDG?=
 =?us-ascii?Q?HKxe5MUWKfZD228X8XQHSnsmtVQLKp3AJFMUcBWPZMTeaYmq33DREPIrtllq?=
 =?us-ascii?Q?gt6TRoZ4sfwXsq/YsLlDBnZylT7+tIN9iC0bzsL9GvBt+B/9zKSaoeB3luQP?=
 =?us-ascii?Q?tfGPyrSaQoqQXCsWlG1ewykUXfvSfxeLLE6T7ZEA1yW3gW4hoeX+HJbmRS3h?=
 =?us-ascii?Q?zJqdQpf+LctrVUF0r35juB2BCUz9GsduNk/fMmTXOb2Lb1pW1Nt9oXZLxbBP?=
 =?us-ascii?Q?zX8EN0adl8yClLVi+fRuboioZDjJ+LyQsN8zcsiE9z9eY/ZepvilTvb5a6oW?=
 =?us-ascii?Q?oOGl/NHgLZ0o4G7y0sLE0l+wTqsTsKutXFuwLj2NdgExkC5Az+WwvtrPaaqW?=
 =?us-ascii?Q?KPNLy0MsbgXuKjwlJpAS4OazogfsmkaLzmsc8/M8ebcO8nAjGlSPCNhrvD1g?=
 =?us-ascii?Q?W1haNxaeyVQpsUF4bgFdZ3w7K5A64xqnoyYMXrCF23uxdm7YHQ3YBavcmS/l?=
 =?us-ascii?Q?we3nEOXPJLWSMfCAcXykBDHlV064xtrHgiabx2Zf03sstIbfBzT0ak+zEK3I?=
 =?us-ascii?Q?UoHD0L0AmESMTOr5a/Hy3xN00MrZ/x9jBtZmrUMIaFI/3YRS2oOhDP5fbVo7?=
 =?us-ascii?Q?KB3vdeGuDOa/UJKM68qL/T8xPeJ6uswfMUXlnX+gnoE37a0CUz2Zarjrd8/p?=
 =?us-ascii?Q?LC1rqtZjw1Hh0EIYjPk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:21.4535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36b89bb-f306-4c95-60b3-08de313321f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915
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

