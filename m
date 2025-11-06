Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46CC38B2A
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 02:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4988510E7DA;
	Thu,  6 Nov 2025 01:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aMaFBXG3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6440E10E7DD
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 01:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LA4/VLHpP2gEJXfMlVwEELWxbwGweagbzpnAihamY+RFruTNMgYFIS/LcQ6RRa1eg3sWE3s4kOhV6Dh4l3AkbxiowPoXHPesY+bBXrdCYLKMLIhToE54KlhJ+3YA8HsAmo0GTMgpmM9QVXZHQ4gWZuUbsQKmGXlqdK2Dgsa0QLadi2w0/TWcMMgs9ZwziJGpvfRf2xVxkynWd++7qm1B5SJUG4KAoDaZ4EWN2sPjIm430DjMagHG/xGEnIaEF/tuQNl2lyGymcbfBvhhD7zrftJmizbuJJDSJQepaqxH9qMwmhS9Js+79hz+BR32bSMwYfChGf29nr8OvtRcziUQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSi85Z994vmM5rpfQJAhfAXaMtEfMGUbv2ap+QFS+QA=;
 b=MMoUlUjhGrAnWpW5J+W0+iT7QKr38oHXJUODhzMvfomcRJ7qZuDvjsVpu8+H2DSrJxDsgLZ3/CtrFUGVdw3pM+8IfZCQr9RCcZYtxJbUAYncIVwacwXrDnFKVbrbXWn5zf7CicTWPFmh1SdG7WXPFaLaTWH0+gRZj8MWOIL1ecpuyKTdnABA80CMDLwBXHbjZbozvNVfypgL6XYid64Y7H4NSUMY+2sDdWpLY5evIRWDL/qECRy8olLdHrRDDy7cHfxUTlnRLfibJOu8Rp0edvyueBElguIIlfT/EmRvnCXsznrlbEXudLWqZ/rmQ805xomJSsUAFurnv4Jy6wLFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSi85Z994vmM5rpfQJAhfAXaMtEfMGUbv2ap+QFS+QA=;
 b=aMaFBXG3e7xxg/uJq9IxcBIpYag2b2Z1lqV3GQ4Mfy/xIwg1a85T3RZp7Uu28sMcrVKUbqOjd0JJIJApNQw2NerdEUffAZgHi62WDu2s33tW2U3d+rNdLpl9TG/jhuxgHh5G5zR76SevaXb3stdL/jwIA/LWn+Df01Xu+Rf2aIjjME8/ds2Z2f/bZJf5eJJ89ehAqy/Hk88VYovKykGhJINsCgOSq2qN/GXahQYe7YBxwHpxMHqkpKNPCURS3NBdJ7QdzhGPlxCs4oLcHRzATi90IIJr/0JrcZkz193Guse5ZDpSyJCRtW47o8JzTENJZghEoMDLVGzc1IP5/OW1Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 01:28:01 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 01:28:01 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 3/3] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Wed,  5 Nov 2025 17:27:54 -0800
Message-ID: <20251106012754.139713-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106012754.139713-1-jhubbard@nvidia.com>
References: <20251106012754.139713-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df5f08e-7765-4838-dc65-08de1cd3b99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Eflm48VJWXpdtY4bDDJ19ETzXXH0PyiFinUDTEtEUGJK1v0azmgWz+2mjXH?=
 =?us-ascii?Q?3HTAe5XhQM4jc1cQHMfMNhHZeTAabyn+TfMwIMY6hJr3IoTlfcoeXcGLqLW3?=
 =?us-ascii?Q?icZeit7VrusXU5ycnEhw8/kbvK50vjJ8xHSmHgmhCzTi9uHJF0+Bf9fxmFks?=
 =?us-ascii?Q?iRBqtw1BZQC6fjh68hkp2B/YqZMRBja6pkKH9fdIjeq9Atdd+8V4uUNm0oqg?=
 =?us-ascii?Q?9QV2aWYcjUE49ab5OKVcUUoQLyN04RSgsNW0asoOrOJlbrM8KlB0uDZwJo7a?=
 =?us-ascii?Q?NC8WxJ+Z2bO+A8ujWYwz18UwXuGO5D/TUAfeFsFHF8dpYeqICYp+bz14BX5p?=
 =?us-ascii?Q?zdcrVIm6X10t95YamqxYlZSUz5X+7bLUOyc43DXxiaej2Owc9iQ3a3oiNVR6?=
 =?us-ascii?Q?qD8r2DaYYVEM2nPHJrtBVriKH1gf7qG3guBJ/SWM6kIKqHnTxm2YqYDkLBSN?=
 =?us-ascii?Q?9ujySSIjvYq6NNPKd/LV4J0QGJAgDLoLN8S+RBIT6uZDfl/xgq3ttEsS7Aal?=
 =?us-ascii?Q?uVimGweWrHMjyrVO+666Slot9+k8d+4W7uGhtPJwb6TughPBksed/DmdwNoP?=
 =?us-ascii?Q?EwoyMKQOe/QWspcQ2RE+3i9TKnADNKhrNbjopwDNWxu7mMeCWAErRiu1/hXu?=
 =?us-ascii?Q?DdCrrR3yZ/U2HcyQ9nLmsrQ0dAXxsxGlFCxzhAtv1luEN9HLJbISVynD9WIH?=
 =?us-ascii?Q?yJGsNQ9GMeOUb6d+az4zcJb9tKL9XJQEiiO7J6ez4CC4WoPm/soKBeNfO2cc?=
 =?us-ascii?Q?3YGsIDM7Col5TMPgVsR2JEHDiUkG8FrT8XYXhFqFnPjZ2REiE8w5fFi3g+Y+?=
 =?us-ascii?Q?0LK6UB5znwzwld5zp5coC3mNX8spoFjLV0QxogFB8kOWSzTGQxwhYawIXGzC?=
 =?us-ascii?Q?TsblI7jaTrWiI0tBhqUD1HZ78vY9JaOYdt13+s34+e86Ft3XIP5NMlQ2s5UP?=
 =?us-ascii?Q?0hmU2kO4TtcBMorKs2X1cbg35XLEgnYA00zBLA8L4jTkyAkTV0t3AHZew2rK?=
 =?us-ascii?Q?rBd02PcJCl/7LxRnU1CjpBYxr/mK5oogS5xrIyYxdR0Wpoqipd2b550kS3+6?=
 =?us-ascii?Q?uGTxqIO47/nsnCyITST1vp5osbKYdl2JuSxFBZuxqugzxL2TAUxRJH5O4Y3o?=
 =?us-ascii?Q?C66r18SnFYKgLBPQMJcACHvSCudAmcRgCpIpdVTs4qNqPfmt9K18ldgel2FY?=
 =?us-ascii?Q?nDxFWsbT98FLn9/Dp7bfo01qgU5ghuUDTGQ4EeVmf1Rq1xkAcdDleRfamkqY?=
 =?us-ascii?Q?eHyN5PmS4SggCbEZXAuUgGGg//GnxPWCSTLRcXjMR4PoFw6SFtuiTBLN6wNr?=
 =?us-ascii?Q?CFlotSKd6Yn1t9XbLs7x2x7ZCxcsitN1MqUniLblS37f1DMR83NuM/ZtcpUX?=
 =?us-ascii?Q?9MLJUaYz+SWwkgaYprMKp91MteC5kvmViuw9qXrjCXh8it+EpnUXMiqcx/7Q?=
 =?us-ascii?Q?7360UAG4/E4bmyfkfEIA8lArZ7JN4cm7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bRmNbY5UQEHbdSFjYrjpEJ5nngtrfOOKGHB6l3JA7R2DQhhTc9d7NVvh28+M?=
 =?us-ascii?Q?SLF1nSD8vhLHNhibvjPQKlDuavn5Ux/kRh40p5YMZJkynDfxSGvAc56C2m5Q?=
 =?us-ascii?Q?Sxo1ITck6L3OENFaZUolp1w8tn4c0Y4I5d5teZiox9a2GstYG28ea2O6E+eh?=
 =?us-ascii?Q?4dFGr7M4hcVwdLGBHOWdYaRQJ1dMH4nwZYc0gEA41TFrHSIROKZ+RWQlcPmK?=
 =?us-ascii?Q?8qEUHMUHhZ8ngiRVMeA7EHWwkAn2/WSDUVv0qF06xK0td0iaek6Io79GLX8r?=
 =?us-ascii?Q?f4j9RrfSunpUh1n3wz2ORti42ngvIu6t+vT0ao5/4gcBlAIb9FscLGSxhwTt?=
 =?us-ascii?Q?qaIjQ0jZZrMMM8gGrO1LcHyfbFCVIwtxYBUV0jqU2KKMcCA+n1yK/yFD3pF7?=
 =?us-ascii?Q?ol8SzI6AJSs1IAq81aIcNgX3qloYADfy6LZz/rPQZlK8QD1CLYBo3H0Umpis?=
 =?us-ascii?Q?epbiyvf0/VcwXW9Hm52eadDY69OSrwffyNpiXXHQoUqIzQNnLDD54n1ufkQM?=
 =?us-ascii?Q?eBjkC3E7lTqs1QgpDgzjG6eyndq2h2/q6wjmHT73Zr6wGR7qj0P9zBKiV/hM?=
 =?us-ascii?Q?YPDQlXQqT0nKgTw9ZboiYDdHa9DWXZd4y6wV62Iollmk9m8N8osSgDHHn73h?=
 =?us-ascii?Q?yhtXTZBCl8UpGzIaLE8MchdTQKjT2GIOgKUzkbByt4KQpwyHxJ8oxGK+8zKc?=
 =?us-ascii?Q?EfCG8a3IDSGtfvcAGQeibkFU8gf6+uWzmc3Mq3x9AEErcGN60PfcYuM3XvQf?=
 =?us-ascii?Q?R2i3qx+nGSwCFFjq9VAUG7HFIRMbnV6OBB/ue6hyluiw+bgRK4FYJ8xqcMhj?=
 =?us-ascii?Q?T/uanGTFCkR7J4shxI9DyiPwQG0rwR128aNHh/AENVpOt4FBv58C10T8H9tZ?=
 =?us-ascii?Q?hjNttz4VsHk+V+ssueZ6O+zgxXTgqMNUh4KVlpEY+27zH1D75issAtgEhpgH?=
 =?us-ascii?Q?oYHzzXB9rFvg+BQx7rVkTz8QkXhBkBbWSzGKTEJGbKZhPD6Mp0kvn5axQkXi?=
 =?us-ascii?Q?cu9tthrWfyY3pPew2/rRS/jwYoE0IoRwOzhNZJSITcEMcYMa4YZBkL1Y7BUb?=
 =?us-ascii?Q?aPS9FfhIfgO5PJ+sWc+wObAyrlNh2mUZI+3bpl1xtrgzIK6T7edhtFG2/2BF?=
 =?us-ascii?Q?YmQuNZSU66HGwDyT/6vm6Ai14nAUDScYxQPhrG8EnCdSogQWKiPMXQYlakcs?=
 =?us-ascii?Q?HH3GGf+Wp1YXS9O2fA2LmzW7hx3S2tk5NdBEetMKh8eZ628FxfOPhbLSG9EF?=
 =?us-ascii?Q?v/puLJJezwP3PVN/aTe/BxQ8haWC7sb5gjyu7fguNvhcO5mtqrHYAAVrSnct?=
 =?us-ascii?Q?5wED/SZGQTmoOWyMcn7G6Pqfvy3CH3YzbZ79b4z25kE8fcexEhp2jtofrSX6?=
 =?us-ascii?Q?tNxvSEGIHlPb7Xyz/EktsRQdiKV15nKJpB7uxHaEAEa0XhlNOaZ18Ow4X5qy?=
 =?us-ascii?Q?OwRdOGEUBKQpBvXsFoqQP5fYKthfRhvJUWXqvwk7VYNjtKuCgKZJclyr3jfu?=
 =?us-ascii?Q?KD7r5z7uCgUciMAuiXCjcUKuzoK8rP/xGDqvmFvpCK5F5U+0Qw2gjdNtUuQ4?=
 =?us-ascii?Q?KkdNO1i4NHyIeVw9zKGUcJsdPnsSQ5Xvc2zR5U4y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df5f08e-7765-4838-dc65-08de1cd3b99d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 01:28:01.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyR5/xtULhd6g17LXGOzRVju4vY6RdlpNfWltAcAeJTmnAaDtrt/qpdO/7OmGG6JcOCN89vH0BPfntrA8L7aJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values
that will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 38 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs | 33 ++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 27b8926977da..8d2bad0e27d1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -154,6 +154,17 @@ fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
     }
 }
 
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
+    type Error = Error;
+
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
+        Ok(Self {
+            chipset: boot42.chipset()?,
+            revision: boot42.revision(),
+        })
+    }
+}
+
 impl fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
@@ -169,9 +180,34 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through Volta:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.
+        //
+        // Turing through Blackwell:
+        //
+        //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient to
+        //     identify these GPUs. boot42 exists on these GPUs but we don't need to use it.
+        //
+        // Rubin:
+        //
+        //     Only supported by Nova. Need to use boot42 to fully identify these GPUs.
+        //
+        // "Future" (after Rubin) GPUs:
+        //
+        //    Only supported by Nova. NV_PMC_BOOT's ARCH_0 (bits 28:24) will be zeroed out, and
+        //    ARCH_1 (bit 8:8) will be set to 1, which will mean, "refer to NV_PMC_BOOT_42".
+
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Spec::try_from(boot0)
+        if boot0.use_boot42_instead() {
+            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
+        } else {
+            Spec::try_from(boot0)
+        }
     }
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 207b865335af..8b5ff3858210 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -25,6 +25,13 @@
 });
 
 impl NV_PMC_BOOT_0 {
+    pub(crate) fn use_boot42_instead(self) -> bool {
+        // "Future" GPUs (some time after Rubin) will set `architecture_0`
+        // to 0, and `architecture_1` to 1, and put the architecture details in
+        // boot42 instead.
+        self.architecture_0() == 0 && self.architecture_1() == 1
+    }
+
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -51,6 +58,32 @@ pub(crate) fn revision(self) -> crate::gpu::Revision {
     }
 }
 
+register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
+    7:0     implementation as u8, "Implementation version of the architecture";
+    15:8    architecture as u8 ?=> Architecture, "Architecture value";
+    19:16   minor_revision as u8, "Minor revision of the chip";
+    23:20   major_revision as u8, "Major revision of the chip";
+});
+
+impl NV_PMC_BOOT_42 {
+    pub(crate) fn chipset(self) -> Result<Chipset> {
+        self.architecture()
+            .map(|arch| {
+                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
+                    | u32::from(self.implementation())
+            })
+            .and_then(Chipset::try_from)
+    }
+
+    /// Returns the revision information of the chip.
+    pub(crate) fn revision(self) -> crate::gpu::Revision {
+        crate::gpu::Revision {
+            major: self.major_revision(),
+            minor: self.minor_revision(),
+        }
+    }
+}
+
 // PBUS
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
-- 
2.51.2

