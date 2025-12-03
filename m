Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150EC9DDBE
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022210E72A;
	Wed,  3 Dec 2025 06:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdlsvUmB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BE110E729
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4ThFDSWq7k3B7k+9KBgshAgWL2ai5+/7P8hRb+qDd7uyQi5L0nqFKbaTon2G/85arVpCcMZ6F47thhiTyfSnZW4qLLePfg56hERvjtAvivhjaecdDzIocohMCcJhxF7FKv6XQNQcDNzdtPdgBBLOrfizOvNHuclRNaEGtTiDciJbRb5Ez1PJVRGqyEMw2MDCJ9RRuXpQBU6QBDAPXmDNahNeI3pmYvDf0rXyxcxBZ5Iy3AotGQQFGEJfGvB/RYdR6J81DN8Re9WamSesLVuwelaOgVAoeiGqz61uSbn3YRoQF78TKssbuvZ+O+T4ykpKyZc0DGrM/J9/MisrKo0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ds3pPW94/UVgw5QSyfr0Ccf9B8ZeZ1o74I7+sJqJ9SY=;
 b=GwvLDVCCImaLV9khatdd7S9JLB0QR1fYUOi7MlcP0LNi17Jpq6McYvGNluhdzt1YYy7tzzEtlAPkYEF79Y7UcBcL+mwtj3aLuCrwonR6PHuwQzOO0+FBFuI6JWLWpQRPBwv+8F9TT9H1d4xAYs1lQwdb81VRXz8ivWv7dfAtQL0wpYiPylKC7hOlwE70MmJEVO+LUfA1nHkbOscJ+NwGifvAJQCK9Uenfs2eC9VaVGIwdrGcD0VZjqXEzjqXjW/rgc8yrLr1bshROsJBRj7rBedU+WIJMzH7UldjVS24cNZZHULoCgUqZSQt1ZV6zXN5T/x1jRwOXTLMUr/vHVYKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ds3pPW94/UVgw5QSyfr0Ccf9B8ZeZ1o74I7+sJqJ9SY=;
 b=XdlsvUmByd7gqKaHtOZzRTM9n8x3FGHteZ7b2xFB9hIWtpiOkbEZHO8eGODlJVHe9Jyv9E7FzehTLM1lnwVNuahwrVE992FZTVlY0pyJhNT2+Hb2MsO5qjFpNANyMbcF5gg9FJMbfbpPxPiQ7BDYrXmJqVTflYcM+lhxIdxHjm7yXj+KF8PXh22ZXPcV3JzfwaztPcFlDSr6xvp3F2GrXe+Bwh6TCx1qbdd5Pm33QCG3ZoheIw6pLpUlgYvyEcBi7YO7TZnats5RL+Lb5TmwiOSw5QB2tGNPRm4Qwi4laOqkplkFmU/T6j8TkfRwEXSpQlcHd3Hy+n6X3qd1HzB1dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:06 +0000
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
Subject: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot path
Date: Tue,  2 Dec 2025 21:59:21 -0800
Message-ID: <20251203055923.1247681-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: af083640-cb5f-4563-d95f-08de32313524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/EcNs43Os2FpBUsaY3TPFu0pELlaVtKw8ydMWb4B5tCOnVdFy4CCSZuf7pUs?=
 =?us-ascii?Q?IejqbIXaSVeCC2RUWV4GhGkZdlKdvQut5DVkEuw9TvACn+yb4/Tvs9cYMfX4?=
 =?us-ascii?Q?Kbb8AHxacBo/3dd2eKoNkQO81NkISGiwZgu1/EJQCLSChYkK5fHR8WoWL7Ak?=
 =?us-ascii?Q?BciqWe2C5/ceM9u5Yn1qU66mjQoHWuP7hiPdIjSHaM/U8T74mY8NMg4ikRAr?=
 =?us-ascii?Q?ECQGPjUvrMekDWwsCQq/BLr8ctgb6ei/KT6QaqUl2oO80oHM7//JvXMHhjAb?=
 =?us-ascii?Q?L9FBjBFY9dTyi64X9KuMWg5y3OVebaYxDv4vYkluQxj2e0I3Fn/E9MPGt7/R?=
 =?us-ascii?Q?funyJNs3fYGkCj/r5J3NqidZ+YQGJj6/CJdTGVJHtr24sxx+CXjndTObxFMh?=
 =?us-ascii?Q?aiyZkjk6lexsgvFmkB6UIzbU1DfihaLrSCX9bPARobv2U6TFkYBhfCDrdWUu?=
 =?us-ascii?Q?efq6DBgFG/HZFt0akBvl0y2VJDAdGXEwJvxPnZpO416EcLhx58oXkNrGbzPS?=
 =?us-ascii?Q?XSq4oLGpXWl+QigbqnH5TokbcHGRLBb1bl8SRoT916dI/58OTforfS+zplWE?=
 =?us-ascii?Q?em9dIFTziIGrpE+GoIX3wZSlkWSg2H0PrBvM1/+FL9Ii/bz7SUZeOkHuj4NB?=
 =?us-ascii?Q?ETDWpizNQtxG/lSD5Yf12n6y29ss16yX6cvW0RFZH4GnJHQEB1PXqTD0/h+O?=
 =?us-ascii?Q?twYVjbdCqO2B4FpZ/wJ6CDfqIAcx4nsZDEjRjG2a9TwgKI43yZMKjeiwpBzK?=
 =?us-ascii?Q?uZLnYYcX4BwntibMnVUsweZP9qEnleVHvIIYFyW1MVEEB+c2GCa/u0oBChxe?=
 =?us-ascii?Q?2Gr0RMFITaLs3WIyKvxpS5rptobPVKU2ehHTsUp7Cp1eZdCLoD1wsW2g653H?=
 =?us-ascii?Q?zkJLA/sfa2Z7+VrCNpOlaXNiC4z6gwH4xVz+MEK5Nz0fFZ5GODZxaby6lKZ8?=
 =?us-ascii?Q?yCl6V7f9hjY6goWrlbqH8Gi2afCtV+jPTSw+4jOm99Y3N7qrxDANatjnSoLA?=
 =?us-ascii?Q?P9/2liio7F97+3MNIm/GO7S8TH3HNWQknm43LbpkBe606sffnDxoILOJdVFW?=
 =?us-ascii?Q?ug1foufCpJPA90Fcq3DDb2n4qpQlCmCHgdirvhIYc+RyN1EAdtZGloaEfKOb?=
 =?us-ascii?Q?E/4Zt9lnSNvQzsid1i/hHhtMfoi9XYeRNuIkwxb0cnzGrHCmLs2XHUVGjbwi?=
 =?us-ascii?Q?2R5tYdoKysz3wSFl+kVMsjgvFBri5jlg6i8YqECY60tsC3lqHAg3drbLUt1G?=
 =?us-ascii?Q?CLZus26adR6K+Ydi5/BZRtH/uqThUjs3rrbFGG+eR2rQ34hkKgaO8+t5E9K4?=
 =?us-ascii?Q?+8dnWTY9unRyGyant8zk/fYf4Xg5yCo5RPVEwDzmBXNW1PC1BKfDvftO3g09?=
 =?us-ascii?Q?PEW6bje65wGeqpST7t1DW7aJthBcmcqA73USV4SrKOqDledwPPAW1ewMByos?=
 =?us-ascii?Q?pnC1CrTJSQ1sW17NBE+EYqQAvmptl5oD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HCWUF+bHOis+k6VVllaLIrC7BF5eFZxHLbaq0NRf2AxU9KX7+M1wUPVW55nA?=
 =?us-ascii?Q?EpbPJOGxOO7Bq39qESQ6fIGI3qzGuBiD7IKsAWwRwf0JWO/BygmmZfiLvDbG?=
 =?us-ascii?Q?KQE4/fwyJDKS1aNjPCHRjqQygHzgC6UCMpoXsQGBVy2onvik+TNqrLrPpeBi?=
 =?us-ascii?Q?rTRE+c8ltYwOcGXb/hfAhQnVdo5PWfea+j41tlSKuBBvjs9X9GYCcCtWbYlf?=
 =?us-ascii?Q?q3kUwFEfk28wfGLi2Nmi0m4n3HrX5jWrjAeOWdkihBOgu8T2rUkquclseCHE?=
 =?us-ascii?Q?bCRvG2sG5kdF+fsmHUQlUR7fjIxUAVFvpbYm+Ulk5oarxZd+F8fxF++Ug9AK?=
 =?us-ascii?Q?4uYEzy2DgvxTsLhdoYoHsf9KdlJmiBH6jPhabDOdlq7XQ+KrxSWfoJ8x4Lvj?=
 =?us-ascii?Q?xfY10DBtzQYnV/1K6FfwD/+1nyqaGAcah8oq/id8/2hRjMS1Dgo7F/PQUyc8?=
 =?us-ascii?Q?jyx5R0+9Nr7i28VoZbl3yLk7dGTNS4+V4j/enPQsiEkTcHkJB/0x+0Q9VEaw?=
 =?us-ascii?Q?FAqGHuu5fcIkTuBwBq8Njdg/ayz58Velcntg55bIvKxzmnfZX9ztlyix81/B?=
 =?us-ascii?Q?8kezJZCSwniUL8Ipi+UTexFaIUnI/yyUefpgY0+0DYpm0kno7v5kNQVL1e7v?=
 =?us-ascii?Q?3Y0WYOyViZczXSSu1LPCj9kvwKoRcCI5y+eP78Sf1TwekL3TWC2r1Log0+8V?=
 =?us-ascii?Q?q1QxXtstF6/0pkC3m6Hikf9IzcfW9wTN7TqZFykOUbdRrPG2bwiiYb9a+P7J?=
 =?us-ascii?Q?q49Tl2tOMqMZbqPPAKWNRInd1hfvaoMKcxpOqpB3QEPXD7G7F1DniA9A/JgT?=
 =?us-ascii?Q?UsS3ANdobaE+FiFSZPOSjeTQg9aBnaSvkgSUk9jDc2zfd1mt+3rv41EtnsvO?=
 =?us-ascii?Q?fBIViCION9pcuZpCfI+1YPjDXVsQmjxWJzTmp11fcmJbgEn6A/iMKrD8/kjx?=
 =?us-ascii?Q?/GIlJTVDmuVXKsecBkfZ0LWFnHoFrTf5xqfS8rJqXFNkZCEipQSOtX//mMdp?=
 =?us-ascii?Q?E7t8cD8AfnYsz2JLtq1Zgsl6WyNskXZdThb4HeSH/o/oYIz40I2EHKfXPWfd?=
 =?us-ascii?Q?rA+ulef5jCaEIrV0oscf+YJUwdqS3b1DSR5WLLg6xdb5hSPi8uwWpE4+dQp3?=
 =?us-ascii?Q?bY7sk4CgbUkNXl4FixQrOre+gItUVaGs2At0bUzQd/KI4e3j1tiiH8V4Lh58?=
 =?us-ascii?Q?B6Dk8DQRkmDiD8rEq6WmfAUNZWoMGZQQ2P6uAoxG0WkFHGgnOl5fs7JoeTC0?=
 =?us-ascii?Q?QqC3KP5UcEs2MFfbsishrxdF8Hdvs9QqpiDIADKJ92Jrolao7l2FlbbXxGyH?=
 =?us-ascii?Q?9Y8+5hAA8Z2FaSKRX8R6q3sE6HgGVStS/SVX/PlgkMMGpaXIjWtxjRUy3Lty?=
 =?us-ascii?Q?BYmF9PDEril7RhgWBeQunQFKHGblGDChjop+b4hVgSGrL0NiwLtr30tWZfJw?=
 =?us-ascii?Q?v2Vx96C8tbyXBUd3zjjGlzMsXud00pOvbKfas/tRDlM9gXAjt6xykveaoeWV?=
 =?us-ascii?Q?i+EMyM+d02YoptZT6HlSf2btth5qOlbDYdbWGFTg2JIZ3yCi7fcemR50E/6k?=
 =?us-ascii?Q?WBFww2e/9d8pgHBmADTMMT22+mMx6bc49ccZmtI2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af083640-cb5f-4563-d95f-08de32313524
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:06.0905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiOvBLr9hDDMvkORgJ4pYedoSBDM/f0dEYdA9Besj5kzmSGOLdXgSwRqR5mug33c6eDljd9Z8JOdnN/oGFe/aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Add the FSP-based boot path for Hopper and Blackwell GPUs. Unlike
Turing/Ampere/Ada which use SEC2 to load the booter firmware, Hopper
and Blackwell use FSP (Firmware System Processor) with FMC firmware
to establish a Chain of Trust and boot GSP directly.

The boot() function now dispatches to either run_booter() (SEC2 path)
or run_fsp() (FSP path) based on the GPU architecture. The cmdq
commands are moved to after GSP boot, and the GSP sequencer is only
run for SEC2-based architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |   6 +-
 drivers/gpu/nova-core/fsp.rs          |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs     | 159 ++++++++++++++++++++------
 3 files changed, 126 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 80401b964488..d88c7a91e2bc 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -13,16 +13,14 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the .image section)
-    fmc_image: DmaObject,
+    pub(crate) fmc_image: DmaObject,
     /// Full FMC ELF data (for signature extraction)
-    fmc_full: DmaObject,
+    pub(crate) fmc_full: DmaObject,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 7d46fbcc7abd..9c11ceb6ab4d 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// TODO: remove this once the code is fully functional
-#![expect(dead_code)]
-
 //! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
 //!
 //! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
@@ -11,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
     ptr::{
@@ -381,8 +379,6 @@ pub(crate) fn create_fmc_boot_params(
         wpr_meta_size: u32,
         libos_addr: u64,
     ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
-        use kernel::dma::CoherentAllocation;
-
         const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
         const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 4d04135a700e..0fbaa73eb55c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             FwsecCommand,
             FwsecFirmware, //
@@ -31,9 +33,11 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::Fsp,
+    gpu::{Architecture, Chipset},
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -155,6 +159,59 @@ fn run_booter(
         Ok(())
     }
 
+    fn run_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        fb_layout: &FbLayout,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        // SAFETY: fmc_full is a valid DmaObject with a contiguous allocation of size() bytes
+        // starting at start_ptr(). The slice is only used for signature extraction within this
+        // function scope while fsp_fw remains valid.
+        let fmc_full_data = unsafe {
+            core::slice::from_raw_parts(fsp_fw.fmc_full.start_ptr(), fsp_fw.fmc_full.size())
+        };
+        let signatures = Fsp::extract_fmc_signatures_static(dev, fmc_full_data)?;
+
+        // Create FMC boot parameters
+        let fmc_boot_params = Fsp::create_fmc_boot_params(
+            dev,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+        )?;
+
+        // Execute FSP Chain of Trust
+        // NOTE: FSP Chain of Trust handles GSP boot internally - we do NOT reset or boot GSP
+        Fsp::boot_gsp_fmc_with_signatures(
+            dev,
+            bar,
+            chipset,
+            &fsp_fw.fmc_image,
+            &fmc_boot_params,
+            u64::from(fb_layout.total_reserved_size),
+            false, // not resuming
+            &fsp_falcon,
+            &signatures,
+        )?;
+
+        // Wait for GSP lockdown to be released
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+        let _mbox0 =
+            Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Check if GSP lockdown has been released after FSP Chain of Trust
     fn gsp_lockdown_released(
         dev: &device::Device,
@@ -192,7 +249,6 @@ fn gsp_lockdown_released(
     }
 
     /// Wait for GSP lockdown to be released after FSP Chain of Trust
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device,
         bar: &Bar0,
@@ -255,8 +311,6 @@ pub(crate) fn boot(
     ) -> Result {
         let dev = pdev.as_ref();
 
-        let bios = Vbios::new(dev, bar)?;
-
         let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
@@ -265,36 +319,58 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let bios = Vbios::new(dev, bar)?;
+            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // For SEC2-based architectures, reset GSP and boot it before SEC2
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            gsp_falcon.reset(bar)?;
+            let libos_handle = self.libos.dma_handle();
+            let (mbox0, mbox1) = gsp_falcon.boot(
+                bar,
+                Some(libos_handle as u32),
+                Some((libos_handle >> 32) as u32),
+            )?;
+            dev_dbg!(
+                pdev.as_ref(),
+                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+                mbox0,
+                mbox1
+            );
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+            dev_dbg!(
+                pdev.as_ref(),
+                "Using SEC2 to load and run the booter_load firmware...\n"
+            );
+        }
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
+            }
 
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+                &fb_layout,
+            )?,
+        }
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
@@ -312,16 +388,27 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // Now that GSP is active, send system info and registry
+        self.cmdq
+            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let libos_handle = self.libos.dma_handle();
+            // Create and run the GSP sequencer.
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: pdev.as_ref().into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
-- 
2.52.0

