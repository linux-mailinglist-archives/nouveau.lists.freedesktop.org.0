Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04706C08811
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808FD10EB4A;
	Sat, 25 Oct 2025 01:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gilKKDST";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7758B10EB4A
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsw9nJAgyQ2fCJ7cqYf951nVTxWdlRSeiz0zkz8LfxQ1uQb4JENJfpQyRTJatIoXLq1vhBdK7RByU2m0HMQtrz0Yhl1cqIthj6YWaIiA+8tjv32dPKeJE4ksCz/Lxe7BEUkntH+jTY0izH/qsmC0iLn/auFFw8wGvVSalNRbzVIxPq2jjaqoAwOwGPRAZtVHDFc55dI3cdJcRXAYbgTjJ2FJhk40o90vScoSKwrDayZ/nC/PSJE9d3pfk2RQXu+WZSy4gSaYfDS0cbHqKOyjbd6xlxRmgxOiGmceuHalcwZjOmjrPx81h3y2XFabuMtqmIFztOiZS6ykyMaapceeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlWeWdJvnXpzB6IQhpwaKkhjrilpmhdyE07UoRtbnMs=;
 b=Hmh9BXtiXx/znrmxpxj57STNBTsHGf6W5NcrXZjth01+nJfmKDolNWtXX2zOmvfBNBFRRM9PZMGsxminyvsmCpchrG03NpSbNs3p3GRs8Hw/RSuT3ULdyL2YNvNPCPTYiKTQzK2W67HQOGbMnb19GqrVdI3a6ZSEODSe67T0oCqsIeJvdfJVXeVRhlSuVQnYXNkKqVPUBsRC/XmYQ8WE6QF4RdYGYSyX1pfxRX3jg2Rgik1nDR3d99omSQ5uOF1jm1t3EwwoMH1hVUhvlsE7JW/Xo4Lp1RcDb8k+STt54eGKgDZJah7qzpif5C3H1dvs5nXNMT3Cmh+MiH/UNewLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlWeWdJvnXpzB6IQhpwaKkhjrilpmhdyE07UoRtbnMs=;
 b=gilKKDST2ZSbjM+khrplpckIvDalqevWUD5lG5HiLSik2ud+uSqHY8bCb9KxaxCpLzzhaNPoyUhqHQwMqLVFFN2ZLxXfRPkXwHOw1s9Za4LqBVd/Lfg9RZBOogMmzTj3LGiQrJIaZo2i3D+PojL9CAF7JmCHvsYsVR/7plkj36psWduFVce8rOyy8Bbsm40HAiZ5wIDu1kgjx39euLYzowvxrsUnx7m8lC10AQq+rfqDylhXvkoSqp21ix9d7Oip3Rms8iMMsFxyERTUCzNgvPRYJyuxEDEJ6rGfS8AkBlynx3x3DcS0hqxfT4+NZP8j/fCHH8ngWYsEltuw+7Jr1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:40:53 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:40:53 +0000
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
Subject: [PATCH 2/2] nova-core: remove unnecessary need_riscv, bar parameters
Date: Fri, 24 Oct 2025 18:40:50 -0700
Message-ID: <20251025014050.585153-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025014050.585153-1-jhubbard@nvidia.com>
References: <20251025014050.585153-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 557260ee-6282-41cd-ec18-08de136788e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vQ1QGy7djT/RXsJIGGsqwua6cO+1sw+QCRFhP3nQw2c4JeNWkXFILIFG5ZP6?=
 =?us-ascii?Q?QIvuLX1qJWF7BiOJnEBEiA7ndssahKz32vG9Uf20PT2UhlqyQRVpXuv802UU?=
 =?us-ascii?Q?D56Cx1HSHN4c8kY04ZcwsIGNr2XSn808tEy02OC865As90V1XBj6jgrgKWMy?=
 =?us-ascii?Q?aXr72nkJ+q6VKeAUEtB5dgTXmb7B8KyB5D+OyLQEwD4jTZ3BDLD7T+A4Q4BV?=
 =?us-ascii?Q?ZXODWM/QOwxJKr0pTVZbTY2Kyte6lbF/dMLMQZO5gBEaKxfx0z9Oi6fyHRCV?=
 =?us-ascii?Q?6Kl5GnhGx/Vzm95P1GJUUGhScML2cwDLIXkdyF9g/RgkZzPc11ud7J4oIXRi?=
 =?us-ascii?Q?dUfF0QVBYCSm1rch5uM/S02FcP2aSDdkXCQpThtqnfStFnEGuWLdLkFq5Gi3?=
 =?us-ascii?Q?R4y0m7Q0iS6JhNvcU8CdDzUl/69fH9yc0mnrUxqzYR2xjIUMB+3Tvi0dvXvC?=
 =?us-ascii?Q?H0fn5mstmAbXk4pmme8++qA+NlrH7ar6vP1NPK6B7dV2Iz1/ZVQhJKNyvE0X?=
 =?us-ascii?Q?V4MkbKHhlSE1ZUNGhgj2/U4TztqSKAxYic2JNdBnS27oDwVLlGXqJAIS0rpZ?=
 =?us-ascii?Q?N6NNhbDTSApLDtRrWki8pd3Jw1+s1EE5gB0hlehT4KiLQ6KOSjLHx7Xn4OGP?=
 =?us-ascii?Q?LiiYjRlDb6hZ5O7E/Ej0r+K91otNhDSYucM59psl7kHiprlqIpWublqSPiYW?=
 =?us-ascii?Q?SnoqZN788kaaa2Vl71EcJN5bHlW6110g1knYGTLzutlB7QcHsVqy0SdecIEQ?=
 =?us-ascii?Q?VydmK3XXx9t1LruFg5T3LRmMin8jbhe5vhVnqzeg439E1eiCSo5r1wzDzEq4?=
 =?us-ascii?Q?HNC7YMymZzTzboSOU4UzGuCbBhXFhtZihdCfECDgfqB1GgbCCdjKHjbYUfEk?=
 =?us-ascii?Q?LxRBkRGRHArQT3cJrEfFEwahIZTRSKPBOdpJBVCg7cEenNMPIC3JSNZSespN?=
 =?us-ascii?Q?oYrHl8BOsV0CWAc4K5HKcgZQY+PQmtTx19yNlZ/jBs0EVWB2wY+VFwb0QZBM?=
 =?us-ascii?Q?eI0Ti9ysvESTwhCXAtRTqyqDDUtIaJgSWqr6fGcKPkecsKOQ+qE+XFc6w9k0?=
 =?us-ascii?Q?kfAvNPEq9MKx7Iq/OvWpDGP7WZZic9SnrdiAfBCgS7j4Cc1O26fNBNEbf+XK?=
 =?us-ascii?Q?r6Eks1OHI4nFIyjCTpZm1TF848TWNdfq15hCP17pYCUNUXg3worpo0p1bkTP?=
 =?us-ascii?Q?4Vz1oJooOEljrzzR6Z02v5twCMgMBUkMP/gak9CYbVJiV5ycHkHSWYgoO23l?=
 =?us-ascii?Q?naFaYl0TegV5y7z1aTpDR+zejMlVxaUz2GvNmuIGNOGJVIwAgw4r0lw9SmGY?=
 =?us-ascii?Q?D2q/ahyotQssOguuzoodTfil4VHO+m6WV6LTZbDdUc+aHJ3saz2sxuRZ6YRU?=
 =?us-ascii?Q?QRQS6mZwgqXsFCqOoZUV5UVumDOJqseWT+XRgnnjJzo06iSfmuJUtUHbJl7K?=
 =?us-ascii?Q?7nGj48hbAmOtJgjprpDdtQ6ULXhIT+KK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwhqD2KIEeIZPdZzdT3M4kV8/w4pMypIH5Z3HjvYcwTYaxeokaM61ZPnapLq?=
 =?us-ascii?Q?NuYa1xGIpOZG0IvtizPdRJ70wAWH00LWBz6SCsYoYZMM8kQ9agWvMMUmRefz?=
 =?us-ascii?Q?c4c7BnqeiTLmBRafCRS27qXDiNdSNYtZ/U40gZNoCLaXdSz1jjoIgoKak/Cl?=
 =?us-ascii?Q?X7UHSTX0veGgxLNS7DDdUi+dmjYhjSgSAm9GriMP5HMLl/rWu+OR7k6SOowv?=
 =?us-ascii?Q?YlY5evSUJ79imxQnh5X9ewacZgRDsXRez9uXXTHd+yUQUwo8ZIggzN4R0nXq?=
 =?us-ascii?Q?rTSjGvnfvsP/SQK8Vc/v8XOOPjbXab4PIrDSZWWYFjbfomXSjfMX8qKwpvVa?=
 =?us-ascii?Q?yniZpUTx4l+EsNdTarWDU3Szmi0JTk2azpoIkgQ5fcAnR1Fs/pkgyobxzR54?=
 =?us-ascii?Q?PtRhpX8jaNrEKrYV7w20IA8Nfw/+10jCVBL0xhOo8w6fAgSD/rsB4ghhuVxv?=
 =?us-ascii?Q?9feYomYw9B+h1MkT8J7ZY2Kz6B8vxJs3RT0C8CqjQX3N1tJcvM7iJ1iJLf3y?=
 =?us-ascii?Q?wKePkNd/xVGUlxeom9DvMJnKty7Q9fQwNPIjIpOWQG3hyRRD/Vsp7SNEwPxW?=
 =?us-ascii?Q?gKVeCo0+C/k7sfJjyaI4o9T4YAx8S2I7cT7fatcTSNqrf+FNCTnoSO560dyR?=
 =?us-ascii?Q?mhpRV2o+nSmjodnAZYvUoufBDT504F52vZM6v4l36s6PLGyesSVaWUsWVvG3?=
 =?us-ascii?Q?Gg35k7/PSohOiQ6o/Inv2HWbBi2J4YhN1A3DUa8yrPmyYLuy6CKP9geNurua?=
 =?us-ascii?Q?eHSQSYxEFijHIIfNxLKA3whU0Kj0f8oVA5HIWDd1qggvu7hL9nePsJ1my3Yl?=
 =?us-ascii?Q?Xol9ewsK6HdhJRcpp3AoclMWXxo+SmwCciobpYe7qU70EFJHVp587BIoPZc3?=
 =?us-ascii?Q?OsxHCw1K4zMlnEnH/HKjA8luXKklb71HE07tLklhZNr/b2IOzYxASX3oFchN?=
 =?us-ascii?Q?b0fuVO6w6csaOAU2wrtfIhShFA8S2NRsI8LgTIrCKJNphXlONInHBBg4prF2?=
 =?us-ascii?Q?Lz1yxZKuvUV4sXN+YXmYcSYZvVhLtGm0ab8/l+J8VJvZeNQG47OZtLOcYaNV?=
 =?us-ascii?Q?0LlqYGQYdKWJdBAgiMQAo6wswFyjn48/y9MCDm9kkDesIr87XBipB6SrrDwQ?=
 =?us-ascii?Q?qa+b/TTC+pN6fqyciYrAChpMu2hUm6bezoPPsFpuvu5+aVkcjmQkPqe0nQHl?=
 =?us-ascii?Q?KHdjZh2CO86kURcnC6wxyycPF+jqj6rbGIktpQj9b/NH12OeSv5g871B2IZZ?=
 =?us-ascii?Q?1E0v3AtVw/GeSjg6aDKtAEbHfAbZvomsOGbliY0fLbX5yjfQgsRogvRpWo+/?=
 =?us-ascii?Q?XSjpunCQhU9bJ2qnGrBkBsJp6QFnCMm2IolKaJAPHbbhjYyWSsmgQKkCTdM7?=
 =?us-ascii?Q?vfk3ZehXXNGduG9n9C86mjdX0nsMk2HpB3RV5kLzsQ6uUxPz7popCEFqEssM?=
 =?us-ascii?Q?dh6keOdztBDrp2QD6M6oNnodU/QeZNfS/dhDBRMBhH1j/oDuxsIFpQpE7Kla?=
 =?us-ascii?Q?sADoEDLGGWFRH/0ACJwcIfc7rsyBn4IDqtz1OU8RNo86a4MKSCQIBq7EWT9D?=
 =?us-ascii?Q?X2laGAhmNpoAAgMtsFyvDmUaO9Xo0mnDrW/U4Nge?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557260ee-6282-41cd-ec18-08de136788e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:40:53.3806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhU5VD/DIBpQygih/ZlhQzLNcT2vF81lxlqt7wLH6Z3xvzBp3Y9olUdBIAaUPZdAKS/3R5MirHclJOaIHdZCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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

The need_riscv parameter and its associated RISCV validation logic are
are actually unnecessary for correct operation. Remove it, along with
the now-unused bar parameter as well.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 21 +--------------------
 drivers/gpu/nova-core/gpu.rs    |  4 +---
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index ac55cbc5ac1e..d745afacfc40 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -362,26 +362,7 @@ pub(crate) struct Falcon<E: FalconEngine> {
 
 impl<E: FalconEngine + 'static> Falcon<E> {
     /// Create a new falcon instance.
-    ///
-    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
-    /// controller.
-    pub(crate) fn new(
-        dev: &device::Device,
-        chipset: Chipset,
-        bar: &Bar0,
-        need_riscv: bool,
-    ) -> Result<Self> {
-        if need_riscv {
-            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-            if !hwcfg2.riscv() {
-                dev_err!(
-                    dev,
-                    "riscv support requested on a controller that does not support it\n"
-                );
-                return Err(EINVAL);
-            }
-        }
-
+    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         Ok(Self {
             hal: hal::falcon_hal(chipset)?,
             dev: dev.into(),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index af20e2daea24..9d182bffe8b4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -213,12 +213,10 @@ pub(crate) fn new<'a>(
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
                 spec.chipset,
-                bar,
-                spec.chipset > Chipset::GA100,
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
             gsp <- Gsp::new(),
 
-- 
2.51.1

