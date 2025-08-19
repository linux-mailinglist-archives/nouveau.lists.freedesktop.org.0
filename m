Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B1B2B769
	for <lists+nouveau@lfdr.de>; Tue, 19 Aug 2025 05:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C8310E51E;
	Tue, 19 Aug 2025 03:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hr968pqz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3D10E523
 for <nouveau@lists.freedesktop.org>; Tue, 19 Aug 2025 03:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3B/9Dfv9WNwlPdcUw/fVbUN7fA4qBwzrouTX2oIxGMY2ivVHqWQ8d9fZa6ucunnua8cB3iwPdS7qXOr8yv073GywfzHlyDZd3/czedMGBHLiYjW3Z+GiBHUbFM9kDhMXju4Fa6mMrKzmQHaX5pRiOW4bfdIVqmEM0+Mqdij2kYyWLFfpsuNrOQYgpwydGOhqibs3867cbELvuWjHZWEBtqvd/a0I7RVdOiZi4nPQdiXt89407+/9NVeqSwik1PpFHplaIXNp2gxXZDiyZmEVB6zEC0pwzS7CtmFpEP2S995RAwG1f60uS43UH8XHaYoLZKpSgWLJpaiVA3RV8evhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSadA84QtXMaGcntPYMSVgujr1eb9SXi5RGlHL5VYao=;
 b=nwNxzevNFlRDY8ruY1yg3TLbRObj6njO+ddDoHY49uuUPZivbrCrHKbXzV4g5tn03ym2OgyuQen0kPGyMUFLudE0i6TMBMKzf5Izl9YPsz/uZOljPWVkykTtfd42lQYL/HM9DX4MeRVDXfR+qcKImDP8nBYlyliTwsJGqi+KyR+p3hQb+KLVh9huexZIH3Npg3qVfvUgtN44z0GApQ/BpM0n8uFZWebYuKUBECGp5kls7z76LhACcW2OCw8bsBmpl368gFQb+kzxEB0SW+3vy5pHX2tWfLJymyetug9pEI3wcQt8DCvlWPLwJyD0rMWEKv0+VvEJkqxXIwhaTU4Z3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSadA84QtXMaGcntPYMSVgujr1eb9SXi5RGlHL5VYao=;
 b=hr968pqzPFTWGm4RBYDFdLzJ0+yRcPvW3z1nehgxiL/5ET7jnK10BfrNvE9rshuLidWLcW7Cey+yvv4sjyWrqFxuL0kBF+4725pA5/yuMofeaasaUyMYH5YnJnkudLIKzYVH7Jfc1yBDGRDayHFV0eHt5WjfVH0YTHoyGUvhbHT6lb85LwmW05l/rBshbH88Vndbp+yXGfaHk6ysQqIH/3pqi73kdJfV2cA98jWQMWLb2a5bMaLGgO2NSgAM+Ak5gv3T0eKmhFQmtIkaunGi2jM1BHIs3ItdOlix2Fpv9/OiMevFFiLqfxav8NMOpWgQC4iwNoDHSNZxZfd7Dm8i9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SA1PR12MB8095.namprd12.prod.outlook.com (2603:10b6:806:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 03:11:23 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 03:11:23 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 2/3] gpu: nova-core: avoid probing non-display/compute PCI
 functions
Date: Mon, 18 Aug 2025 20:11:16 -0700
Message-ID: <20250819031117.560568-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819031117.560568-1-jhubbard@nvidia.com>
References: <20250819031117.560568-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SA1PR12MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: a89d1938-2dd0-4f88-32f2-08dddece13e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gb7rp1wApeFUR9eRbIhbVH+HRivqRzOdfwve9hpuM4WJzGt+mNAcRMCGycz7?=
 =?us-ascii?Q?xgtSVBfWtrUoz0/Y3PGERBbOpqYsDMB5aWYgpaiQcLh0W3U5VMUHljEmH8AO?=
 =?us-ascii?Q?MTRO7WMsS2N8pb/7VxEihnJAbD0fUBG92GvhiIH/ky2zpPWh0pdSfOUnYDia?=
 =?us-ascii?Q?fW09fvFPTp3Y3GkoHDkYzwiSZhCtIPHRxLfHripjq67QeCrpfImr5FceY8Nm?=
 =?us-ascii?Q?7xyAVAQUc+GqOrNxjz1coWuIF3SSAK6v/nAJ9zCXAdJ5pLsTD8IP2+PWGTlr?=
 =?us-ascii?Q?e9cnaUGVC+XgCi2a2ZYjYLijO1V7SlzAGtbFyoFWToIs3LDzwIk0j28I8mxH?=
 =?us-ascii?Q?CSTJE2Krr2tyS7x7dX8CP7WVMPnxysflXyZkpqpMrljqllDK+RRtRpdqrEky?=
 =?us-ascii?Q?SZaJRHnuZS+bPHc25qdClaB0MlYMns+iZ59A5vrehRm7Uz6qODllXsDX30au?=
 =?us-ascii?Q?cmNJ6e4QyeLFDIo4QKa2PkO1MjHUN9WmQd7VOrJZHMvhknFDccBkpSGSZQLT?=
 =?us-ascii?Q?hm5AeSKh8ej7FlnWtwy1PRbNvdt1L/9L1BC2N98SoZSQIwHgwqxKZB1CD8jM?=
 =?us-ascii?Q?0AV8IueumnziOYlFoOwi1HQMljLYEzfe1sUkTx3ODPYoRYnZIBA9AxAIbCPQ?=
 =?us-ascii?Q?RjVRUpVwVKdTaYroYEjbjf2rse8lhdizEYaygkNcXR4udBA4vPyxtHvfvHiO?=
 =?us-ascii?Q?/dNcEulGUOzrgg8f6LD1ztB5ve0pQH/aqX38427JtIzglYqUPE02vxAR6vu5?=
 =?us-ascii?Q?P8SXvgSvcOIezM/ObeM7kyAWz60DbVsaiqH/keOIX2k5S3XFWGD9OZmpSmap?=
 =?us-ascii?Q?YaUfkt+S5mspK0d1ci8zXL8i/SO70rnvSfkTv/Z8DDwWeGkOA+86ksmyDo6U?=
 =?us-ascii?Q?lryrwzaf/mPk3+4IQAJlAkMUm0j/ZB/Bo6cAUmx/7ey+PCB/BObkR6flUIMc?=
 =?us-ascii?Q?5Oj0i7ccUA39OojjT4Y3AiPOY5y896lbn/+aZMJIZxlPz7nVOP6dUI8jqIuI?=
 =?us-ascii?Q?LzEIvigB1V1d0zGUHos+fI84AT3dhjEh+qdz94xLDQJqw8PiaPDmQ6nqektl?=
 =?us-ascii?Q?v2af85JuiGHeQTv3vuiMOrDVprERzEBziNTHIDYlbsYi3tvwsCWnW8diBk+R?=
 =?us-ascii?Q?IpNekjadMAe5QojbHs/hucpBcU8Nr/WjPonpLCJd6LJla/DfZe+E8kNJCNXc?=
 =?us-ascii?Q?JbiscqQGUNzZQ51GdJbn4mlzMBNDDffl2MR4oo4UI3SctjhQgQaQPKeaCULt?=
 =?us-ascii?Q?e0zL3eLEHaz8jttZ0tUG8UWRwrLI5Iaq6MWnB6buawrTejzBDHfkI9uPDrzC?=
 =?us-ascii?Q?71l3Sb0Ktf4oVxfLMwKjLtfUh6cPqppJoZG+HNSpYnObSLLMQDnVhV8l13Ci?=
 =?us-ascii?Q?zxTCQk4qqeTYpNKNamMj4Mrpqct6sAgUVMeIPdbc0/4ZJxZVMD5zI8qYgjwc?=
 =?us-ascii?Q?NNvtbTtuTzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiDICWhpDKYs4qkBSF2oVT3fg6kb0wpcHVepbseSkBBI3T+MUnIqRg3bPk7Q?=
 =?us-ascii?Q?tIACfLKtXgm2TYbKY52N30VCfZKzvxtOd1NHkmppOG6pxJLx/5/VhPMArcsm?=
 =?us-ascii?Q?fFjRv4sR4RTKSesGAed6K2l9YE/6IFOwIh7nJDW/RRVbe2PvUGuBtYiENYyc?=
 =?us-ascii?Q?HmjAikp0uxqMdLEGn4IzX7Ea/tCJ2fgWAyuF4wZxafoWPzd8NhcKR4K044gg?=
 =?us-ascii?Q?Ro64TV9WeTs7+TVy9NtgIZwdf7ReIJg/xLcLlz5YIFe9u31Xryjy4ejtHQel?=
 =?us-ascii?Q?vLq6xLWIOCKdsXb6YYoJ2uHIQzb8TBjXuO2xxUW5dSOS5G1OVAuXXvtT7Hyo?=
 =?us-ascii?Q?Vw/Db+DMcbkbAtagW51FCWy2pDMimug1Z0qmhPXDt5Uqs/AOssXtXUIn7bjC?=
 =?us-ascii?Q?4KgPuA7SA+h4yz5EAMbYrh8OQiFtUUOI5tunmNRDxi0TLr03tLFfYI7iVPII?=
 =?us-ascii?Q?D+LHAF0VmFF7QH9/1dJlFIGV74u4bTMx9KMd+YDN8E0WJ9oBgvY9EiYjqfuX?=
 =?us-ascii?Q?Y64l6PRde0pqgctFwa/pdKDcb/MvuaAlqBt7vXs/1tMM3tn9daZUH/rB3Cvg?=
 =?us-ascii?Q?KeDloatb9DcN0MNu6DIFf4/oD4Y3FzopCSGi+kqW5ZejA/nRHJECZsmZ/Y+R?=
 =?us-ascii?Q?h94HtcAfype2hQwoV6Cg+EjwDC0gIcKeXDgGjyrpPcBfmh5GtfIdiEO8tnoU?=
 =?us-ascii?Q?EIeY6F8Y6y/nr4RbedjY1K4jqLcQYwC5vWUeJJBondCPF4WEIWgexzdTPfI8?=
 =?us-ascii?Q?5FY9QmXazypQoE4aPhf6Qx89qZzdBnNdLoh+PDwgc9nu6ofCiU/SqSdX35f3?=
 =?us-ascii?Q?mtEu0g8tB9qHPBO+9gudHdE0h7P9Qzc7xC3q+bVRoldhjMsuBPmxZc/vCm12?=
 =?us-ascii?Q?sAR/wwKMJcqk/NALdGaMABo2oHICTSLlA3SAq1GEw8uVfpp5OKN7G0OnzJNp?=
 =?us-ascii?Q?8p25UK1mza4pyPikOJJeP7DbrUfUTGC39htB/oHyAarLknYMig/OZ4qnubOl?=
 =?us-ascii?Q?Eb5eOESRLdE3WXXracQLZjWGR+pbBY01aF7cF9G19Ta/DGB19+rAHaujCXcm?=
 =?us-ascii?Q?NLcSVNt64AVoixMNsLTzJ1z2HCLUDgEIn7GtLNRnZoNovd2FvUyPyzsIKRpP?=
 =?us-ascii?Q?kJchWHxHwEYbJljZmEPjYmDHYqj8t/qqB2ap9Zgj8mQTZ3Qc8Ed34F8aTLJz?=
 =?us-ascii?Q?BUShKNFbsk9bP1q/n/a2ffzQAUd0Usy6UrgamDNSTvVSujpAWx+PoT2RIhNc?=
 =?us-ascii?Q?tyOM7i/1kuz7E0xCv3l3bYylw0zSPmqhEw2il981zMujUvWAszjjwnfwtX4J?=
 =?us-ascii?Q?qKoz6cxTuFKJ7K8iKop2/IIjDypzQ+3Wc8BEODSfYA7OvsC77zSHkDbZZfMz?=
 =?us-ascii?Q?/mBwrPBPRzXGc2fCM09ztPc92ZSyAAXMW4lS8l5Mw57MUfdg5enJ+B98+48o?=
 =?us-ascii?Q?tsFGuEO25GhUDNW87O1mEzjzg11oKzlc80vs+0WcpMYe05B54kYWaCLU0Y5b?=
 =?us-ascii?Q?VGh1C41+BFD9G8z9zrC3wG0Q6veiwyRuliZ59SNEi0E9Db2w076o4g73+tnr?=
 =?us-ascii?Q?ruOKHyafTQjAZPgLo6MJgrh+A4HBSzKS+BVnfyDH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89d1938-2dd0-4f88-32f2-08dddece13e5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:11:23.5981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCK17wPKNEQ+TL1ZNN3ddWLZQ3liNByNYcYsI3RE2588bwBW7qzWxr8vMQ9dl+hUzeqpB2ZgPTemTomK3cPbvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8095
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

NovaCore has so far been too imprecise about figuring out if .probe()
has found a supported PCI PF (Physical Function). By that I mean:
.probe() sets up BAR0 (which involves a lot of very careful devres and
Device<Bound> details behind the scenes). And then if it is dealing with
a non-supported device such as the .1 audio PF on many GPUs, it fails
out due to an unexpected BAR0 size. We have been fortunate that the BAR0
sizes are different.

Really, we should be filtering on PCI class ID instead. These days I
think we can confidently pick out Nova's supported PF's via PCI class
ID. And if not, then we'll revisit.

The approach here is to filter on "Display VGA" or "Display 3D", which
is how PCI class IDs express "this is a modern GPU's PF".

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 274989ea1fb4..4ec5b861a345 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
+use kernel::{
+    auxiliary, bindings, c_str, device::Core, pci, pci::Class, prelude::*, sizes::SZ_16M, sync::Arc,
+};
 
 use crate::gpu::Gpu;
 
@@ -18,10 +20,25 @@ pub(crate) struct NovaCore {
     PCI_TABLE,
     MODULE_PCI_TABLE,
     <NovaCore as pci::Driver>::IdInfo,
-    [(
-        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as u32),
-        ()
-    )]
+    [
+        // Modern NVIDIA GPUs will show up as either VGA or 3D controllers.
+        (
+            pci::DeviceId::from_class_and_vendor(
+                Class::DISPLAY_VGA,
+                Class::MASK_CLASS_SUBCLASS,
+                bindings::PCI_VENDOR_ID_NVIDIA
+            ),
+            ()
+        ),
+        (
+            pci::DeviceId::from_class_and_vendor(
+                Class::DISPLAY_3D,
+                Class::MASK_CLASS_SUBCLASS,
+                bindings::PCI_VENDOR_ID_NVIDIA
+            ),
+            ()
+        ),
+    ]
 );
 
 impl pci::Driver for NovaCore {
-- 
2.50.1

