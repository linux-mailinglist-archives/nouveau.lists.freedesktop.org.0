Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE84C9DD79
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77510E70D;
	Wed,  3 Dec 2025 05:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GdtK8AT6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FFE10E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDQBIv0W1/bnIfrJJcivVJ82kv/FXXmRsWaY++Bty0J7oeWNGu5C/H1I18CBkHhxoI1VhAvc/EGdag1TNzap4+/z8lx5I0ra0gq1BaW3vWvuvZeRaMfvU+Bui5fRPNRygVUDGF5KbM0btGnfshTuD2MOb25nYZtaUttP9XTaLN/+y/FeiwBDEDWfSM6mWCZc4wBh1+WP3jJhon8Fd2cjRWTtoFOp5uiE5dnPpvy+4nHKfezQGhAXbBQEeG0iqr6ULP2mrDahEVgVvbseadS/BODZPUvblceKXiwgcTYYkizLzZQl4GpCH88Ws2w76YQKCwtw67Jo8Y8VP4Opx6WHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2IvaBWElYRRLcJAkpG/hLw0oSx6ROwVQEwhwjLkX8g=;
 b=XFPMHbvFZSqUjGXV1gYr3A1RZ1NW0HXnSwGo2vBHNbxPgP9HADOtQWA2rRi0fVkuWfmqvDOUr+m5HGa6tYMCZh3zEcGX4oS0S1gTkNNxRr6pbfapp+5lhGXus3/Th//Ws6wbITyDLc5QBGKphrssk1oiWmlo6GhfLlNIVDYl+SnWI5ZMI45I4HKa+hRiMbvT3c1UTEuO0T5FCo2QRojO4wtBy9JuC8I7MmZSFi+tokxsHX/QMFDl4iiiBZfLxrCariIy4D/vWNzGQJM9BMrReREtJlbvCwCAQwXOBqB01vLUG01bWLFK7PkYq+Q4dZ2ahpT6h9PWdynEpep0xaovkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2IvaBWElYRRLcJAkpG/hLw0oSx6ROwVQEwhwjLkX8g=;
 b=GdtK8AT6RtffN0wGD4K77jcgeLHdSYjYNoxyjfmsc226sydskmsQ/SNfBSa/08f7SRkcCBa999i9xPF2VJH29xW5tu+ZdPT6D0QHy+ynq4Ml+GmChewbsc0amKF7Wmbn0dVvsG/GOoNfTqvIJmVjZAFVmRbDlNV79obVCYyiY7EweMJeX8GBQp0v2pQ2U3IkV9vhonNA9iT0rH/zjpqChjuL1P3B/ql3xaTWc8fEDrZveLcCMT+qWIoRPuknkAckMY1yVpJquj7uXHKXTfJu+MQvy1yALWxhSD4uo7FAmFu1cvSYOCAYlqpw3KThGwXRxoGvEzX0HVqkxRNnLvdIRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:36 +0000
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
Subject: [PATCH 07/31] gpu: nova-core: set DMA mask width based on GPU
 architecture
Date: Tue,  2 Dec 2025 21:58:59 -0800
Message-ID: <20251203055923.1247681-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7332443d-dbee-4753-3cc8-08de323123a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wBqesaMus+hTFUQNa9xpB/qnHK0pxX7IO9YML+zNoy0ULJXhyf4ryqUcSwm0?=
 =?us-ascii?Q?O/XqVXC03kWZuYfMGE5s6DaY94D2jNH3wLHp6Lby6vLNADS25sV7DiLWSgBJ?=
 =?us-ascii?Q?CuZg73S7zgYnZoZtEST6zGoo4UIdmvRU+BbBZifpLSZ4W3vIFu5973wortLS?=
 =?us-ascii?Q?OOKV5ud/THAgiai509AEyw/2TCyLnhXyinJsoZjsCkn4kqfhlSI07vKH8Ir5?=
 =?us-ascii?Q?KetIPiXr6gN8Vx+8M4QcNQmGBh6rIo5+/ENbhPwwNQMC9FfW1LYiQF54jFqB?=
 =?us-ascii?Q?geEk9l/Mo1c12m14zVH1SDbfeFG7hLl/OMTtNe52lI3Fi1XlQiuCLa8SZ0S4?=
 =?us-ascii?Q?klNbFU/saPBdTwE46HF0Bn2ckz7VWTRe6U4xnYSJi6s/8pNqu7yPPAKKk5aV?=
 =?us-ascii?Q?y3zdL2XAFkNXTMt2ehen36Yw6VzGU3w7yGBj3K/uXJXurSREf1hkQ2exIj9A?=
 =?us-ascii?Q?cdkEOxBkkSk7b9qSd0N7HNP+YWuCmoHCAQHPLBZb0mG7ehFtc4ufaJAFZsge?=
 =?us-ascii?Q?jFrZIsX+YeFpICQYqujvrQpBOl4X4/2VoJk5G/PVvORhzX+uyyOQ9iZ3sMMk?=
 =?us-ascii?Q?4XFoW4P/5LIyvqiZIMPeI+JBBj+5mKDadAuZaU46XtX0FRbFGRr2te5Mkzwu?=
 =?us-ascii?Q?aWCkJV54IjpbrwGiw5gOYiQ+5IlRbhgFucvfEZHIbdF2YcIW0wmhbYiq4mwN?=
 =?us-ascii?Q?JXBlS2aBeowKWE6sFMugVhh7SIwNkL+LzUFIHs+59dg1l9TpURIPG87OZZje?=
 =?us-ascii?Q?I/TIFnzpFn/sxqpqlleCki+cEia7s/G2Sn4doHF+TY9sNytapB9hxvMqMkGC?=
 =?us-ascii?Q?KMvpjqbS8s96fOC3mtYfuN9yKi+Uxo0s9Ul4DO7HjIiuXpG/U8g0n2oIoWmk?=
 =?us-ascii?Q?xARRIbSNsubEOd0NNjOD/YeOOJG/3F5PqCCv8Tt6bznE3d6Ji5R5ws7RTHQA?=
 =?us-ascii?Q?1O7xx8r5dZcbJLXnPYKtx4ww+u3t6qVEWFbslegJIYPkaqxwOu6gsWy/DIgd?=
 =?us-ascii?Q?UM+nBwz2WClk/sNVOzDohcMjvMwLkgwEs8MaaNDKwgfCOTY1TbHFd7Yv/Gy9?=
 =?us-ascii?Q?HweOT+8arpJnc+q3Zt2WFIA4ctOkW3RKvcwO5oQIqidWkr1KOGE0ssrAFSbR?=
 =?us-ascii?Q?OfsvXOHRLyQtW31t41Cw3KocL5gebghUYR4RACxEOcsGb4rH+ckwgWcCHVJR?=
 =?us-ascii?Q?L/soYUa4Nqi7kDi32A4Nm2EF5IDT4f15R4IzZrEo1UAbwTmNlMfbeQDSnZ7a?=
 =?us-ascii?Q?JqH756l9j+c5kZA+BMAhAbMznZKHnTqEiO0Wt9m1qEB9vHhHIWmIbpXOxTRU?=
 =?us-ascii?Q?vIijJjaz74mFOXpu+1SjIIVyS3q+wiMjXIcenYWOPDUCAZ32PGFoaagU7tOS?=
 =?us-ascii?Q?9+9vmIMIuuLwYcR8yYnthHFrcWzhGe55qRhUnb9it7UBW3GPAmC4d/iQc8JN?=
 =?us-ascii?Q?bBuTKnYOCqo1yIQ64LGcrj18wloST/PA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYgSITWQY6qYHmM5nn70TWfMEmEhMtKEUoyBx/ryFW3zI10ONKNbtUsOwcSL?=
 =?us-ascii?Q?t3JFZwOwgVI5Tvw2t5aAdpOm/rDlGldQ96TRVpvBY3J77SgYRUd1FNSs1Qmj?=
 =?us-ascii?Q?Wz6gyjRSHCdOiPatjrOu0QTOryysn0vCHDS3QfrH9s3BgPUo7aZ2ARGSzNZI?=
 =?us-ascii?Q?WP4HTypHHiaGvx1dZUGN/MxVBISRmq55K3s/yoAlYLcrC064rpKpiLv+TLzH?=
 =?us-ascii?Q?fHW12inZb0ABOVpEQYuffMUbLkjGmt1Zf5IHwpRGIq1LH255xkpC/lrJFvZs?=
 =?us-ascii?Q?ZQpABwdD1D4MyNx6FGm0wrGRIm6i3ykw+UPnLhPWStuWMI1mMeXmST5z4mMa?=
 =?us-ascii?Q?mYI5Iy4pdLVS9wHN27NdCw+2CIvWoaFeipRqq9wgoonA2x0C/KV6NaqWc4CC?=
 =?us-ascii?Q?pczRkX4wSZqIVDWSQp6sDLCdQQ1RxidiQlkntMynDnsAGhHn5auaebWLRPin?=
 =?us-ascii?Q?vABOHSOVmHb1r8wIgF8QLRINHfl5pS1j1AG8kk9YsOp4kkN+ehffsbASSS9v?=
 =?us-ascii?Q?nO7U6929ZzTlVU58kNerjcAOqczkpPvF3bWpu9NDpxNTHItXmavGgJwrGYm1?=
 =?us-ascii?Q?kIoqEshrzK/W2Mn8SGziX/MLPAyvJimxgfssOBQLgrfOKxsWgRY07M+OEsnZ?=
 =?us-ascii?Q?3l02LkqrF1Ztno6VyEV49pXaPDuImiUf107QyRW7Y0VXT7j4bv6x2lIQtg8Y?=
 =?us-ascii?Q?hGNrH3cFu6YwWLkaRLERQoe/a5Ys+8BrpGpMZOh3IA9U5Fln/C7IvByReuZj?=
 =?us-ascii?Q?PxsKydSybKidDrnRll7QsV6Z7MtHA1rr1NBaRZOlr+Gb/LIAOOdqbpFfYW/i?=
 =?us-ascii?Q?GzqCapYPkvLtS1RTdowMvSxqvTKCpi03PhmfKls3KGdopCAqwsWi0l8YbRsz?=
 =?us-ascii?Q?HW4K5/vZMYN1P0SbERIa79mmKMq7qJkc+wy1jHU3XKSTSz1g+2SOSo5i0Zwn?=
 =?us-ascii?Q?koJhWO6FH2GBmEplv8m5uzJrH+C3WZ8ypFjxyv/sTD3RB255o64SQtWFUZcA?=
 =?us-ascii?Q?HFN4fQoAQYSoAxDywFk/LOsWs1ii5QUXSVq3wv9BVJ3hQ6CPrGva3dsUTshC?=
 =?us-ascii?Q?N0RHaJG88qFbPJovkWUVKdrT9lG17KTaPHXPhA8w58CubPIeU50aNqb0kkpv?=
 =?us-ascii?Q?lfSYY7IkiB+VObgTAlj2fCvtwMw8WKvcyOEiXgMzLyfoA/K2JlzcMRoVu/Tq?=
 =?us-ascii?Q?3rmEj/71xgZuO+N7R5j/u5aQK4tq6uOuqopVf+nItckpSqXh+2EHjRbtlcBx?=
 =?us-ascii?Q?JCGb0AicwZLxXBF4vvtlnDt5PEwxuBuCr0GpWh7KqQqcqqu/N9bQUxDXn649?=
 =?us-ascii?Q?c6z1EqaLE/ybaZLo2WVkHtbQbZsffVgh25vAwiigzH3C5F5hv5Ji0ZdUez3K?=
 =?us-ascii?Q?cOYYncz9ukjMvyCd8ElS2iWrRvubt6yKrJjYo57/02BwQ5ZVKRCJeLKx+wr+?=
 =?us-ascii?Q?uPUkxqjwLoK8S4a619/Xx2n9HaiJT2X8lAGIJEsKtgXfij37QmKqL99thfWV?=
 =?us-ascii?Q?Hix41hL8H9fepvgpUjPRXmlNWEgNR2zr7xz/rDirZMI7ZjnekNvl6FhyMxHs?=
 =?us-ascii?Q?Cbrr/nJRDhIlQVGB2aB4ZJLKog0gDTzrXLY68vXT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7332443d-dbee-4753-3cc8-08de323123a4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:36.7301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5k4Dp4VdI94TaNty2R6mkECvZaXA7WihKINGdKaSqw7lIZoyYvQ/AGcO7qGKsFN33QpocEMZMkSSAi4tcPMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

This removes a "TODO" item in the code, which was hardcoded to work on
Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
early read of boot42, in order to pick the correct value.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 33 +++++++++++++++++----------------
 drivers/gpu/nova-core/gpu.rs    | 29 ++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d91bbc50cde7..3179a4d47af4 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -4,8 +4,10 @@
     auxiliary,
     c_str,
     device::Core,
-    dma::Device,
-    dma::DmaMask,
+    dma::{
+        Device,
+        DmaMask, //
+    },
     pci,
     pci::{
         Class,
@@ -17,7 +19,10 @@
     sync::Arc, //
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    read_architecture,
+    Gpu, //
+};
 
 #[pin_data]
 pub(crate) struct NovaCore {
@@ -28,14 +33,6 @@ pub(crate) struct NovaCore {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -73,11 +70,6 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        // SAFETY: No concurrent DMA allocations or mappings can be made because
-        // the device is still being probed and therefore isn't being used by
-        // other threads of execution.
-        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
@@ -88,6 +80,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         let bar_clone = Arc::clone(&devres_bar);
         let bar = bar_clone.access(pdev.as_ref())?;
 
+        // Read the GPU architecture early to determine the correct DMA address width.
+        // Hopper/Blackwell+ support 52-bit DMA addresses, earlier architectures use 47-bit.
+        let arch = read_architecture(bar)?;
+
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(arch.dma_addr_bits())?)? };
+
         let this = KBox::pin_init(
             try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, devres_bar, bar),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c21ce91924f5..624bbc2a54e8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -102,7 +102,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(&self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
@@ -155,6 +155,19 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+impl Architecture {
+    /// Returns the number of DMA address bits supported by this architecture.
+    ///
+    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier architectures
+    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
+    pub(crate) const fn dma_addr_bits(&self) -> u32 {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => 47,
+            Self::Hopper | Self::Blackwell => 52,
+        }
+    }
+}
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -203,6 +216,20 @@ pub(crate) struct Spec {
     revision: Revision,
 }
 
+/// Reads the GPU architecture from BAR0 registers.
+///
+/// This is a lightweight check used early in probe to determine the correct DMA address width
+/// before the full [`Spec`] is constructed.
+pub(crate) fn read_architecture(bar: &Bar0) -> Result<Architecture> {
+    let boot0 = regs::NV_PMC_BOOT_0::read(bar);
+
+    if boot0.is_older_than_fermi() {
+        return Err(ENODEV);
+    }
+
+    regs::NV_PMC_BOOT_42::read(bar).architecture()
+}
+
 impl Spec {
     fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
-- 
2.52.0

