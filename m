Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF6C42707
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 05:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6943310EBB0;
	Sat,  8 Nov 2025 04:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TNdmOwgk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C48510E345
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 04:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8iYrv/V15hLRFRFF/mHNzC2ipDtd6D7lLwuAyzMn6AvCduLis6NgmcqvF0GcF0poo9JjUtfuba7VS+uHnsk4pLRNJrfGAJHssfS3fM+rJ8J//+m46vM/82A1JblN+BaezCmTrVGCtBdrR9RZyiliIx18ZvDwAQyP2rurCHeKDaMK9nBjmoyCKhoqfzBRNkMndmvO1OL4hwzWS4lsX2rDn0XSKO6bRKAVGbJY/i6pM14Hbk3PavqajhEfsFH9fCv+1NSJQBiLpgzFEWAOmcvoIq7ktLqzZQxAJzLug+AUkMKGO2ZufxGOA0VK3oS+d55ioYlHMFlbJ/cKz5P6aeV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS3/cBVGkJIA4F/uVQpO5c+Qdi9EVo4LPJRotTLqUjU=;
 b=RKbn47KQLHeXPyhnnLxrDuT6NAWWRuIg10z4/hG44VluepJ7flhiBlkYbB3L9pBUBs2HyOrwdP3V5VpEQYPA+FT9xPZWiFmRC+1D3aQT4Ys5zVWIyaF+NMaCwbxKGWrG7i/ubk41uLdVMGLF+E4WwkS1oz6Uk4LX81vEMIP1+8/94A3R3Dn5VFi91rzJD1Tc7sjCuzajp8anfjalZHDt7Rn5g2VS3PuiU0Vq4fqvsM4pZDnANFogVHKYi0ByyRwY5k8Ky4agkcUSloKy9HLUektVQwIHYIS6Ad4MzTbnuhOPhWStQeFWu2bMIdQZaTOgN/nAJfzoU5AnZRh1yUXMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS3/cBVGkJIA4F/uVQpO5c+Qdi9EVo4LPJRotTLqUjU=;
 b=TNdmOwgkYJUC03yDa1YdyHduScJmyBT7pLoYnXa8GfCd6Q3n7MSe5tBxaFDBAgNqSOKBNYjda6OeNLiYQAqUQQd8hFhZ8SA8/9Ob+HgdeV4u25lDhW/iWp1ilmyE7eX+Um4cYobwA04bQ25IErNOzrLC9q5/jFwCXn9qX7JwGwwTSjBSD9eTXpP3V9GF15YrzH890cYWgqyabAKOmbwsU//wZ+VZuRTn38BwsSQLg+dytMUP60pgnjQHmva9wI7ROu4gbWrOgmJFEVGF8AZ27c2qJ6H6EJ5DCUV6tpGUtMmNwLtYBcvJ0zM73kDCG2Emad2Xl6MNQemwZItuLbV4ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:39:50 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:39:50 +0000
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
Subject: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Fri,  7 Nov 2025 20:39:45 -0800
Message-ID: <20251108043945.571266-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108043945.571266-1-jhubbard@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:74::48) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2987230a-4c16-4095-3a69-08de1e80da4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dcr/aZaVAvv4RIb2Oy9L3mzX960cHX7Mvap7TMYHUyEV8F4VP2lxpMEJFj+p?=
 =?us-ascii?Q?kbp5yVe5alzGyzWVm8c74Qf/D69KvRNeqICkJzcNFpzRVznfILFd1qFdSSAj?=
 =?us-ascii?Q?kVFMb9gdEv73O1Potf5BkQxTwflVig5ghiSd1R9UYBxSj4VuaLtjOn+2ET/O?=
 =?us-ascii?Q?SFx6KeWKVJREjqNVnI/RivEVKZOTpau8Q4sO9pa/23+hACFjU5eKL4YJfr0B?=
 =?us-ascii?Q?oRy+D4EX0xbB8X00NpYIEBtpXUosqJ8sV7S3IfLMlkaH5D/RABlYTx9qpO1z?=
 =?us-ascii?Q?veNKBZT2Kve3BqrvFD6PhKZGekzly4vPKVRVTE2zwWY1PMDK0fp908gDLAfa?=
 =?us-ascii?Q?c1q/fpctFoQB+BYonf4z5vRYeyg7pi/CDpPKTxjgMKsQy/l3UIS1aDf4/k7Q?=
 =?us-ascii?Q?Tqd3inoThwiRaZtjZJLHxJ6n/OjzcCy0qk/o3eNRvbA1j/BpZmbyis8/ccoQ?=
 =?us-ascii?Q?3AGwnQCvX4riOGQd2QVJxj0FcLGEz2M1eH+EYNamytGEZcHzjZvlmrfWhNgm?=
 =?us-ascii?Q?paXhDgBpxFtvA3AMBf8QYVOJP8H7guWyI4vHNpg/HS3JGsp065WE9/DwouEc?=
 =?us-ascii?Q?k8y0zbAojAQ6DXScIjhEnhJYCUXdt7u4/4R1hHtj5ogRkXM4pNOzl1M5Bv0m?=
 =?us-ascii?Q?PhYfOR+fUB2YGN9mPLRFc9Fb7vwgeb4xyKg9Jsv1QbA4nuBnYCoq6YNAjCix?=
 =?us-ascii?Q?A3i545ln3943Mk15zQyxaJwLp7Pe4k7NhRy/AT2SNUQQvzR+hvoYiz6Ql/KK?=
 =?us-ascii?Q?PLZVOr775HbuPN2VbIEzTE95ja4KcgRBLgMH9lXxPTT5LSjv5BvMOi245j5J?=
 =?us-ascii?Q?aQ6DBVExhBKTOtuDjMjZyhEmCk3ZTyr7CCOkIBsV7iT5PcURiDkF5INrL3Rj?=
 =?us-ascii?Q?cZQSbAUxOXaSmtgQDmCEBqQmxOZTMI0g1DBM3soiYaDAA0Em33RVmuTB2A6t?=
 =?us-ascii?Q?WRc6YQ98JNfs2YwRg3Kv562zU2I10TDOfLZHkGjqatsin+J8sKNbMt1FvMTK?=
 =?us-ascii?Q?WA0TsjDYMYA0o+9oRiRlrhTRS3evvREtToih+n9iYHV1D7Q+/cg6HjTuRrGx?=
 =?us-ascii?Q?4LCzdURfnmvpol3UGrwZk66c5NkIS2Wj7gx3/cu8MdHtMy+my+QQKOyJIU1v?=
 =?us-ascii?Q?h5zcnWPm5cXlcmmn9+EQEUWyXGwOc62qSUZ5EVRjpw0KfX/z/ajgjWT1NKR9?=
 =?us-ascii?Q?1CA7vsMpt+w3snbZipDBKcP+wF+oKNWTIgiDDi5kUcIAKyYyvcLb4o2ueAxp?=
 =?us-ascii?Q?nFYuK4G9jxHrzgfObGdOM4HXcVeIVW9IxdZEH9p/J8IVxZuGMFF+Paq5sWg/?=
 =?us-ascii?Q?9BlsW0D+8/J+wOFfFvFH75RXESrPwyWmx6+PQ+7tpCBSbbmtj9YHsdbQEuV6?=
 =?us-ascii?Q?CrnaXdTbcVeWUI/tBNTpse03zD/dvvmWM+tb5GYq2WyXy2h2OTnyOWsKKNo5?=
 =?us-ascii?Q?zZd07px7wdzJQ7ceBDNb26FZWQ0xy9I6BRdQxbXZqfqgMGScqJjrvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFSaWxVLlNWrwLE2hI+XNqVzt4MuVpAfjvQvAACJPEGWo25yJgNeQpVVc5Ju?=
 =?us-ascii?Q?YxC0qDtQfQym2yWN//rD0sXgUGeu6Rc/bzApUdoZP9h/Dq7SNmwWA0J8zArl?=
 =?us-ascii?Q?k+CA2McXnJH9eR+AVpnuhAeI9zxpdTYvE+OA9nXxggiQKKt+kFs3vdhOHyD2?=
 =?us-ascii?Q?lJAyyfe+YwjERnpMKZiOdWpqSRVjevKwM8WY4ilLBz0/OvWu2jVaAQP4oWhP?=
 =?us-ascii?Q?hUyBB/cptMmL4miGAGuPwHzQn11yqFaKK+RJYrZ3ao1/DuqhwcFma2pXuMth?=
 =?us-ascii?Q?Gb/uDMlbo3OPDHRXz0J8wTUq3o54Ba+gs5YTi4BVQ1E+BhM/fQtbzOkqnWxR?=
 =?us-ascii?Q?Dp6dgpaDWhQ98lHjnmmkaWq1apeRy3F9R3RlSM3BDzjuzyS9HmriLY3mzkCQ?=
 =?us-ascii?Q?4Q/18oFolQlCdvuncsMRdq2F6jW5ftUWGy3U2Wnjli3SIsX4KuwAFmnjksa0?=
 =?us-ascii?Q?IsYbCk3qLhVSI5laxTZY7v6goNb3Ly4Lc3DTj34iNL1U2CtWnhjv4WJdqUkx?=
 =?us-ascii?Q?qCg1F01gZTpqpaZQ3Mm0uQSOGafov6prCduqZBrHOyHc78zgvvf9Fl6t/Ov/?=
 =?us-ascii?Q?WH25oYIs9X1faVunBQNuKjoKqOMUJjM27/cSrfC12rz4Vqtj9Q7oOZOL19bl?=
 =?us-ascii?Q?w/cU3nn7WJax3vidzgV2+Y3beKIiqJJrehGOWCTvNNA3Ul8twrwkyxbwFUCB?=
 =?us-ascii?Q?HKZG5KGA1fSaHs2qhEwEbkhESbzupEeYzYSx97oPmbykgk0CJRSJ9oEWli3N?=
 =?us-ascii?Q?E/uMq7LDxgtMxdGyNQ953pMx4q9Ic6oanjFzNEBQoL1OIYg2VZpsY1GqbfWg?=
 =?us-ascii?Q?2TZWGZrRGr3n7X0BORFkgBy1ZTBp0o1svMxqQU76/413LZJ8Fc/C2S8bMlCn?=
 =?us-ascii?Q?riSpuS2tgHNUQxWr61HvgIAMYLiFOuEdAGVck3Rb4f7sqbTMPC/iM17z7YyL?=
 =?us-ascii?Q?IywnAwN0kUpAEqHT/aXbEuIlenCzdrxXuQbvVWkQsqQEFQmGkpSXI9ha2ioH?=
 =?us-ascii?Q?jAmz1OSZaYW/OT3E6jKVRKgLe3jhhiSz6/rrNHqniIVHci+JefqEbDKISYQB?=
 =?us-ascii?Q?vtvnHuGo9TtK7ZTk6OUccT9jhWQrUjhTrpcMUSwDI9U8RpPhvUaj9lagq+sT?=
 =?us-ascii?Q?8JhC2vn/euXykQbcwJi1bfp8nPs+cLS5ACbzYpWvkijs3ZzQyaqpqRT5adMg?=
 =?us-ascii?Q?tj8Z8N+PzcTuTzyWs5xbmOkbZUzkuznce5DNOIMadId0FFttE2aV/50cZ7TT?=
 =?us-ascii?Q?uqy+XoC+Kbswjgv32u0NtSnxdf4cafDQHztBhJhRBHOGzNwzsvPH07sIyLyI?=
 =?us-ascii?Q?Y0JoB/lPOtNko0Wct2cNNqHueoMvAGpGqACYQgIyrVhSuNvlKyatXMMiwudX?=
 =?us-ascii?Q?KpR+uUuf5kRI04g2f+sndBeIEtPoTwcFHolJk6Ruhy5K1ibP79qu/SVWbDch?=
 =?us-ascii?Q?j2IoVZHN7e19g9dMe9g4Vh2UsY1pTq0VTXZEiB9gDCWKKM2S4yYv0J63s8nb?=
 =?us-ascii?Q?e0EdCAKH8IHP+TBsynUeKIgm7tKCSH9K6TfxgevP9ZLZiJD0+pGVBXI/22ij?=
 =?us-ascii?Q?Xge9f6T2q/9uh0wjYjTW9jklo2IBpeQUD8mJ3mC9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2987230a-4c16-4095-3a69-08de1e80da4a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:39:50.2332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/S1GthjklF+cMhTO4KlGotp6Nw9AL1Yq3o18mH6nlwgZj/IFihyogoLlKCe9ivY8mcvlcztDwVHqxm8Cung/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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
 drivers/gpu/nova-core/gpu.rs  | 35 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs | 42 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 94a6054bab95..5650c115c613 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -171,9 +171,31 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through NV50:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.
+        //
+        // Fermi through Volta:
+        //
+        //     Not supported by Nova. boot0 is still sufficient to identify these GPUs, but boot42
+        //     is also guaranteed to be both present and accurate.
+        //
+        // Turing and later:
+        //
+        //     Supported by Nova. Identified by first checking boot0 to ensure that the GPU is not
+        //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
+        //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
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
 
@@ -188,6 +210,17 @@ fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
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
 impl fmt::Display for Spec {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8c9af3c59708..5d6397f6450a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -41,6 +41,22 @@
 });
 
 impl NV_PMC_BOOT_0 {
+    fn older_than_fermi(self) -> bool {
+        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+
+        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
+        // GF00, means "older than Fermi".
+        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
+    }
+
+    pub(crate) fn use_boot42_instead(self) -> bool {
+        // For Fermi+ GPUs, boot42 is guaranteed to be both present and accurate, so that's the
+        // point at which we switch over to relying on boot42 for precise identification.
+
+        !self.older_than_fermi()
+    }
+
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -67,6 +83,32 @@ pub(crate) fn revision(self) -> Revision {
     }
 }
 
+register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
+    15:12   minor_revision as u8, "Minor revision of the chip";
+    19:16   major_revision as u8, "Major revision of the chip";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    29:24   architecture as u8 ?=> Architecture, "Architecture value";
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
+    pub(crate) fn revision(self) -> Revision {
+        Revision {
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

