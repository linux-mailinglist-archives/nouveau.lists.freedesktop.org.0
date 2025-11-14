Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06CC5F958
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ED810EB49;
	Fri, 14 Nov 2025 23:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UzXJj40t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682B10EB46
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKBnuryc9wpF9B+Av096nlnqnsf4xvanzXvJK57TAokw6YyROupP01ZpAWXWEwExpLgPEQhCV/yH6BIeRWUKWXpkuv68xbW7qENL2M+Q4E8wGtZh3W9pMvpjD5G3GEf5RLioG632mP8NcqZYcl40/5iSO0RRUbttAoIPMPemGksxM9e1BF8JmSN732SLoVksiD6eYyhLv8wKsx//ckZEcnt998Tk63uGxfl4MDXyteZk8jlUmf8AYQ8UFrRLmjjvw5B2NhTmzW+I3LoKfo6+Ksh3YYDQsF3hF7Bp6uvfcK29HO9iHoyNjrJUXV8AVwe2XjlZrY6N9TzWXP6juToD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADDbD2X0PPu09BIx06Tll8jV5VaI3onPPq43kb2Cejs=;
 b=HOpwHTX4P0eztISctwCvrBb/vpkz9Yub7HXZb6zwQExl+zKyjXDDBIxqrAZl0InzoYr9kXwftWsR1emYRt0q5QowwZIqE4ovsSi9ZTiVRYpOGxaAcWadNBcJM1Pdd+Uuy49PbDwscoLJwFksbotNC95EQbfSiMlRL0Q3PWlL0JKPjSfSG95mcoooDxrhCsjN9+TsrkN2jrPqjD+C+OVSfGii/K57ov/GNXHQANs7kGkejH2zkemXqpHi/RyUdVL36XQ1HZd2/WMQixhlU+Cls2fKWpZ/x82aEZXyss36D651H7Cq5LZL6gcN4pmgf16Ib/305Fl209L4B9ng5d/WcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADDbD2X0PPu09BIx06Tll8jV5VaI3onPPq43kb2Cejs=;
 b=UzXJj40ttiihzvc51kMCFBoWil9XKd78GS3UVd5SOqjB0l7mys0YXfs0xlPvWRsE2lYiqUO8lE+WnpqOwiAuZciO4JW0nnMjbw1w8GhnnTJdcv35C4/HBpRSgio7tqEogrIAeQ8wpxmkQLaqm82fRWKL61sZoVH+0Qn5ky8dp0EbNEOFD7EtpETkCw5GhGs2JEM8JfksH8MxbSkFkR4nxgVxkS45xoprJqR7aoJUoNaHP7H/aYv7yJSTCsXNAGFevEmIq3DkIBo+PbYc05SErVuAI1Oc8KMbtFchXpkx45Bl+sQ2NvaXX62RVQkrxTQ30KaI7fYaGbdgWQhdOWNLqg==
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by IA1PR12MB6068.namprd12.prod.outlook.com (2603:10b6:208:3ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 23:31:18 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::a3) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:18 +0000
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
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:02 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:31:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 08/11] gpu: nova-core: Add basic Turing HAL
Date: Fri, 14 Nov 2025 17:30:41 -0600
Message-ID: <20251114233045.2512853-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bfd1c0-0442-45ed-e68c-08de23d5e973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kWYS2+qXvTPjy9twPn+8Tr4qXl+kXgOSEEsDH+qNg6agAV15KRVxq7RJ0TiX?=
 =?us-ascii?Q?kit67/bdxaysmY1DqnsfC021wingQxs53+hS3NOyeGLOBuskMrVh/+hvofgC?=
 =?us-ascii?Q?VPGu9sYyNGg7RVZtDnNPWWz1XoLPwFn2/wqsrsUKCDTbp4EHc+U1LXgZhqj2?=
 =?us-ascii?Q?ffPLN3J3QiJCKTs0kwuAxKWz2wdHnNFXtx3m+7Rb6hd5U1efiwXVc+j5xImR?=
 =?us-ascii?Q?BTfIYXFuPhwjg0rfqfd7LcFxmIZSQBiaB6dyrJiztKhDEk2aPyT2AqMqW1Gf?=
 =?us-ascii?Q?hiZBS9ILlElhgO2JJMhbkLT5mWWGY7uudET95Z/5Dkt7xY3AHgOL0xnhlCbI?=
 =?us-ascii?Q?+RITpVL0gwPwOJayyGn95Kpf9CqF1Ks+mLpI/QK3Qa5AUSGnY3kd3zbLa2Em?=
 =?us-ascii?Q?LSzul7oXI6IVdgJCUT1EqythfitbY8zIUCo967PL/IOkz+2w1gYTiSKaDO1F?=
 =?us-ascii?Q?Lc0bd0jJHGG/fdd+J21pZQH2pnOtZU5Tyxwrwqn/6xjgv3V8kyM95JEeLVCe?=
 =?us-ascii?Q?LnGMFBKYq09h6M5oa3WGgkiv4XYwCdl+Xg1s2ue7e9yNhwzLj881HMmeLKk/?=
 =?us-ascii?Q?R4sg7xR76gMnLykhpBX2vIzkMYcpkB/AVO4+fLw84mdIux+Uo6C17qiJuTHm?=
 =?us-ascii?Q?U0IJDNs0MdSOsOEztfbjm9SZDiofx3yOjNjtPYTzXCYP3CY1OHgYqJql1pWF?=
 =?us-ascii?Q?8VQONfaR1klOAfumvBs8UY+Eu3DYdH+r5BmJsEwKJb3nHkPcN8bYMuFYoIYu?=
 =?us-ascii?Q?9dd6jAwomXzQgXkchwCyEspXXtt/DNeoEftXs1LnLTOC2fqtxb62wkzdV8wk?=
 =?us-ascii?Q?hp7abI2N1NRXHA8aOj2+NlXTGOdyaQfccD935cIDnM/B7H9qvcUr+iF+8TAL?=
 =?us-ascii?Q?YQEiCe8vVuv0j1VVvwjBzZiYLV6e3Y292pmNVBxpD2chVwWuZ4FYdMSvIlqa?=
 =?us-ascii?Q?L8SO8V2hrnWMlK8RXuXAAE1Bqar8U5bPR9DLD/uFm/s3A9OPnH9nuv3VgOBy?=
 =?us-ascii?Q?AP1/PNRW8mAAarV15H7iQ61wBoqgopBiKGoA2O4l8iRz6D/s7k4PWxcqijGX?=
 =?us-ascii?Q?ymp+pSB/RBhGU9pSsb7Qu5lTGYhcIp1BIKq5ffGpsmXTWVUOJp1QPIDkuRff?=
 =?us-ascii?Q?CxKeL2Ad6lztcsCjx0tkij3wDNOaApe35guh/sENE/+qsXwdYFZarPfvj/ss?=
 =?us-ascii?Q?bsEmXsny4jmFOAlir780A4v/Zj1kRkxLNdd7A7trGOJOAKQ2eiB+68iHm2E7?=
 =?us-ascii?Q?2h0+bmPGXpp+0z+7mwQcqphQjMHzWCsdJ6X7do2yEw3M2ARTvORpVVCsxu2m?=
 =?us-ascii?Q?J0nnUT+rpjen/dEVNqKeCzpnZm3TeO/CfFdcsD7MvHEYR3z5JAT2gJ0lg4uv?=
 =?us-ascii?Q?cawwzkfbjqq4Ew+VSCgRWBbZW9vaHrHtBn1pK67Vc+HzrG90U+c39E+Fx6IX?=
 =?us-ascii?Q?7aHEMU4kgTgXPM4hKE6WWpYtxdXe24w7Td6IZc3Q9iQeqkZ4alaomhMMfDlu?=
 =?us-ascii?Q?//PKxInF0JZpirtCfMaexaa/XY5Olc0B2sNGq+Yrgr3WNRZMft/1gfLklAnc?=
 =?us-ascii?Q?++BhetNRsRSl7P6a2YE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:18.3620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bfd1c0-0442-45ed-e68c-08de23d5e973
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
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

Add the basic HAL for recognizing Turing GPUs.  This isn't enough
to support booting GSP-RM on Turing, but it's a start.

Note that GA100, which boots using the same method as Turing, is not
supported yet.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  6 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 73 +++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c77a1568ea96..7a6610e9d0a8 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,6 +13,7 @@
 };
 
 mod ga102;
+mod tu102;
 
 /// Hardware Abstraction Layer for Falcon cores.
 ///
@@ -60,9 +61,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        TU102 | TU104 | TU106 | TU116 | TU117 => {
+            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        },
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
-        }
+        },
         _ => return Err(ENOTSUPP),
     };
 
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
new file mode 100644
index 000000000000..edb8447d7263
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+
+use kernel::io::poll::read_poll_timeout;
+use kernel::prelude::*;
+use kernel::time::Delta;
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    Falcon, FalconBromParams, FalconEngine
+};
+use crate::regs;
+
+use super::FalconHal;
+
+pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Tu102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+
+    fn signature_reg_fuse_version(
+        &self,
+        _falcon: &Falcon<E>,
+        _bar: &Bar0,
+        _engine_id_mask: u16,
+        _ucode_id: u8,
+    ) -> Result<u32> {
+        Ok(0)
+    }
+
+    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
+        Ok(())
+    }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(10),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TODO[DLAY]: replace with udelay() or equivalent once available.
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        let _: Result =
+            read_poll_timeout(|| Ok(()), |_| false, Delta::ZERO, Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+}
-- 
2.51.2

