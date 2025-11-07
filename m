Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69618C3E372
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 03:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782A10E021;
	Fri,  7 Nov 2025 02:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jlkqh9Rm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2036110E021
 for <nouveau@lists.freedesktop.org>; Fri,  7 Nov 2025 02:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN92Nx49RN1TY+wjo8aGlb1W5TSU6EFcklyStq5o7QEUEEMpNbAFTQmQa6LG7EqKbbLW68MRguIaiXGVnzDJJjoHD8Av9fvp16w+xJKHN0Sp26saa6Jn+j9YDpRtODBMrxEqN7Y46wNJRkXCLMhcATfUId1m2hkOmC5d7Wa6kQ/F6HK5aZWq1HvG9TFDDTFK9G9qlm/+MsoREHoVO8TKU6vFb0k2dWJnX36qzlTSWJVd42feQ5XjmJNcz3OnbkzZhDQUol9ggq9PpCmqLsokAiwfXgCjCHfVML6Oaj5XWsfNChrKrbYDssZgW7LU4Uw3kZFjK6zK3tM2UsgFu7W2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxMNX6+8vls1JPpRI0sQsxFxa1P8uMU7jfDegqYf4Kw=;
 b=DwbKn36rQ+IJEgz6kIyJIfnzdREQnnrfB0Q7P5DAHGH/rlkbtW2Jp8WysPATEPPZA1Im/quH7RU9KEQFkX3/yJY4FIfue9BZOT+W9xijKm8LkKjQhPHDE8JUcCq4UBt+s7U1+/wNwUH/Abfp2JyQqUCcFHHIm4BrrzT8y2CidQAj3RYC8XikEDMhZbf+UjAaiulz/wKULlQw/jQ5+Z2U+7GpLvzdZcr99ACgsZWVUV8FuoTyMnHTj97WJlwt8hVADfOEHIeOK1sQuH3sUJZEPLsiRGgRv7648OkbHTTQir0D1yUsErDgqxvM/zrf9riANlElZjJTIQ7lAzbD2YJWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxMNX6+8vls1JPpRI0sQsxFxa1P8uMU7jfDegqYf4Kw=;
 b=jlkqh9Rm3QdMutY9Rz5WY19Br4OOMdkwRpzJdoCkfLMzFkiN4r5aDMm33yKBJ/42PqxGV1IbQjBNLvy1N5sgQ7+bW7tyK4B/Fw2cRjOPFx7BuhmN7v00kCxxF9QDDvACgfPqSgTkMmftP7iLY957BB42KUJ5HBHz96hApMkLSqyYgv7AlZfHTaWADc+/Z71IxJc3ORLnUPxAYstkUOX5mmjFGCY83SxTrY8yjgN1OrkYbfvYgBbLqpccEMfbiVcaMV40gKr3iLcG7lEY2PDM205i8vqMzPNDouuvbNX6kpsOEiQ4jHYhrmKsQWv7uL+puDfLqSn5h7qhXWpEzXTjdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 02:10:09 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 02:10:09 +0000
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
Subject: [PATCH] gpu: nova-core: apply the one "use" item per line policy
Date: Thu,  6 Nov 2025 18:10:06 -0800
Message-ID: <20251107021006.434109-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bd5259-81a6-4638-58ea-08de1da2c70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n1pOkmCJCR8v+nAxzWI3vQtYuyRU6JLvPFteOogsYiEfyqG+NOe7kLyjIJk3?=
 =?us-ascii?Q?zJMEZgvcJFqvEqy92TP3LwRNTWOfBRLOonyPtQkuTWiQaB7HcNjmJ4KNYvGC?=
 =?us-ascii?Q?GX5uifve+DC7w0g+Bcad/iK2SXjNVZJ18mnE5bGveaX8QdErE4xjJPpW1EQO?=
 =?us-ascii?Q?WxeIBexyPsksbwG0zZiCNLXplmSLVc00VSKOH93dmqIWotgRXx64Ve5gB4LB?=
 =?us-ascii?Q?WYMqtVnM2v3Q9ryogk+v6kDXuivXTCByy6ZhPhwrm7K5vcrPytSVINw7ZY56?=
 =?us-ascii?Q?3kwVwolM8z3okm8UB8seMFI7mGuIJLf+VLo1xdjuvHW20inLKZWOvSgkfGeU?=
 =?us-ascii?Q?MXFoOVqWbieLA+cweAZDQaYU8NmQ2Zs7ygGNTXi+nUny2doyw39XOs6mWDlk?=
 =?us-ascii?Q?r6HXOYWUoG8pnbohhPgI4A6ARswUrI9/mizVVTczWr4kqHYu/FOS4TDxFsd1?=
 =?us-ascii?Q?/vv6BvJo6APQhQJ/yVPkuTPLF5HsqQZ+s4ELLTv97Jr9Jdg8zQIAr0eM+25C?=
 =?us-ascii?Q?tONf7294S0RUxYvbZzyL+86WhvThPzc3L5sBve/iZaYTGB9NP1D4kmu5Jk5R?=
 =?us-ascii?Q?QxuYyKDE8B1F5p7eKUwzRnfPR3G1raffVvE6ruoS60pzeBfbDFMpaX1QAmEi?=
 =?us-ascii?Q?ckuvtAczCztVgfjM0PBGShaV1SJUV3KqTvdoxfjqTxtlolR+TPR13MRjFDwi?=
 =?us-ascii?Q?xVHdGUyn08IWJbhpi6d4S7XhhJTJFpiSw6QeffPWytVKbLFL3R1GSM5WwRye?=
 =?us-ascii?Q?5yLyotERRPNdri9P+iFT3/yqAdcNNg8ysduWwrQ5o49R9y/YLoh4qdKjMKRE?=
 =?us-ascii?Q?0Pq2sJnYgaaSkWkcJOgyVCE+sH0HQqKdXzH0yA2aAFFj5HNkokTQxVlcP/9m?=
 =?us-ascii?Q?LZ1/vKOLbQj1WcQ/OfkFeMgLYmWIWQvL2C/lwliQcTmAY32I0d28MiLJMats?=
 =?us-ascii?Q?69OtSbK1RMTBSplqwMVZr65HB0UbtWC6TsP04++LYwJZjsheu+wL0YutPToi?=
 =?us-ascii?Q?fdKw4MRSje4RSDsD4ArQ6OvSWR873ndpCT2n+F4VceFyCOg3P7l3PGjTNejq?=
 =?us-ascii?Q?ts4QN3DYwbFfskY8i8Gq99WryVEx05CZx75vFsyO22qBkedEH2ep8gqiiDu1?=
 =?us-ascii?Q?hVyTmZDwJSkiBgOnXDs0hXif+C10v8P/Yu9zLdeVv0NVG215AzvoSVDoa43/?=
 =?us-ascii?Q?5fOo8yCumI+uiAn6B/brZAbiLXaKFofGddziQnTkT7hYZoec9nm20oR+T6dg?=
 =?us-ascii?Q?Vi9a/uiGmTlLn6TyFERAbleZxg/NcNqdgwoXmW3uRGKf1qfw8Bic3pT11mUX?=
 =?us-ascii?Q?Gc+/MYBNj194YP+t92M7XM+xQ80v23ETKHvmijYjIjc0tKaWmnsC7tQB+laQ?=
 =?us-ascii?Q?YH/7HdfIUiTDfSQMSdHvHQdPWN0ll//xhksOK1XfxSA9lHNEtJsA8rksLZWz?=
 =?us-ascii?Q?uDrhZ8TabqxpRJek2kM+RqqSNyive2yzQduPuwJ382xEdKXxZ0uLdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?glcvTwbA4f1dU3Eh9K4a9jXvjfEKN23h7Cys3CUTUA82b+QW5WGr3Hu2OyR4?=
 =?us-ascii?Q?i6o290c6dVwBAYssrDKxq6fpbQbMGAej/sTBofU0KZHdgyfu2KpGfnOWwvyu?=
 =?us-ascii?Q?ej0TvdB/4mXw3tftljkl5du0cSRSaWtKqUtV1ohLnODIQPQXEis8DbmptNr4?=
 =?us-ascii?Q?aWMoImXsCW40ElQ8rJS32NIn8ME0T0+7koROjN+SUI9zdndNpdfdDfYk+GWV?=
 =?us-ascii?Q?l+f6vucEcy+3SlCjPUmX6SxT5tNhk1FeqjmVjLB9FZMGJv1JhiZnJxFolBjl?=
 =?us-ascii?Q?NfyaZ5SetDvhRHPjaRUvP8eBpgha2ctRh5ewLb324Mtf0lTIomfgpGrE5ThU?=
 =?us-ascii?Q?Pus6fKBxVOSqnOMoKcLbqTf/hKZFfI1XQ9Td3LllG8AWtWGVSAYZKNKFn3Ul?=
 =?us-ascii?Q?ds7YN3GjY6I5iMrQ0uqBLel4errMa8gi8+mTSkyjUtQ0fPLJ4L+0kqO8TavN?=
 =?us-ascii?Q?Ic9zdKjNkYxZLXCoRz9G80OrJfkN70Y1dSRTtIQLAIR5yvtr8EmNmQ6CIJ/b?=
 =?us-ascii?Q?1nAbJ5ztPhcL4rprH1puoUd46/eqUwCu5Q39b/Nu3nb/JSX+meXZvcpePK7y?=
 =?us-ascii?Q?t9ZyjiW8TqGBBnjfEYI2tnwam9qbt7swl2op1cbX9DYrgsef6XxbuZgWO9GZ?=
 =?us-ascii?Q?0C352IjJoHs8MiC4npaGt0unygAPza9WPsmPCesw7A+AAMJW5/JdR9L+U5L6?=
 =?us-ascii?Q?e9ioHl634VNKv7BD8MZosaHoh2/3SQVWoaxmqbQt5NBo8ie8kTSNoLM+JXPC?=
 =?us-ascii?Q?Uq5iADY3YAVtFnkye9aAHoiRtK1OSupX+7eKWwzzFLTrHE/wxMFe/RqKsL9G?=
 =?us-ascii?Q?xWfsqceytHwKpG0/SJHt7g1q/c+53NHoc5dmthpxijvMvFucQhL0SmyY1e/u?=
 =?us-ascii?Q?usDNORr+C15DUUd0pqEPPFIT0MzsmDe3K873h7Cozbqu+/Yfsu5u0nQwxJ8M?=
 =?us-ascii?Q?xJsJgCdwUckAOo9MzVwPkoD/hFW40dzI9wP1JbGsLTA5emoBW0GrDOuGyGzT?=
 =?us-ascii?Q?s8tRbfFMu4RjyHcxyNhjfwAyDIIxKgE4lLmMoJMhk4yXRzHSlUf3BvUB4Cf2?=
 =?us-ascii?Q?we/R/FVxk7ZnmDySKT5t7MaWscTP8iwhCCk5RdCkQdYnVnv4UDqLGw0CpkPi?=
 =?us-ascii?Q?v9sTPySNrCuvcrazPdJ98tCoVU4n2Qh4amgntByj+zy2ZCMX2IdT4t97GX80?=
 =?us-ascii?Q?pxFV8BjUM1lOquIPC32Is1KtpZFDAUCLkAt4qGAkWriqwHTjSuHwwwgPbaA2?=
 =?us-ascii?Q?6VPeuOccPjqMsA2q/KZCWrHaX+1BihyL5DDcRFle8Q5vWB5IyG8d0BI2QuGP?=
 =?us-ascii?Q?BTihHPaleziFaT2xl8Ld4LGV3+pu+5qCkLHmqUOGh/MCWUnKAdQacZs6FxRq?=
 =?us-ascii?Q?1NBmRXuZxwV/6o+fbbMoPq5tlqruNKLktr3Zvld8xkWa5Si1yOhYLUJg6gnx?=
 =?us-ascii?Q?SZ0aGnfmbcSzudwPmnkKPdSiZuAQl0M0jfkcNcH4Hv/aikZvIgTcr+pl2f5F?=
 =?us-ascii?Q?zqc1yv1MV/eB5IH0efVP39LvV6MKhBjg1EvRRcreH/0VW3xjfl8oIX7yZ/od?=
 =?us-ascii?Q?NXRD4iAOaV7DvZS2vJzuAMkQuHF9h/HrY65cYwd/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bd5259-81a6-4638-58ea-08de1da2c70f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 02:10:09.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgXdSHOj0VHB3qlUINvHCh23bNE5pgDQSPmLeZFo/UZ/ISV1u7JdWEogwVPN0if4jmA9jQ7g6rVHosFLeWQZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for the entire nova-core driver.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Tested on Ampere: GA104 (bare metal).

thanks,
John Hubbard

 drivers/gpu/nova-core/dma.rs              | 17 +++++---
 drivers/gpu/nova-core/driver.rs           | 11 +++--
 drivers/gpu/nova-core/falcon.rs           | 34 +++++++++------
 drivers/gpu/nova-core/falcon/gsp.rs       | 12 +++++-
 drivers/gpu/nova-core/falcon/hal.rs       | 12 ++++--
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 26 ++++++++----
 drivers/gpu/nova-core/falcon/sec2.rs      | 10 ++++-
 drivers/gpu/nova-core/fb.rs               | 28 +++++++-----
 drivers/gpu/nova-core/fb/hal.rs           |  6 ++-
 drivers/gpu/nova-core/fb/hal/ga100.rs     | 12 +++---
 drivers/gpu/nova-core/fb/hal/ga102.rs     |  8 ++--
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  9 ++--
 drivers/gpu/nova-core/firmware.rs         | 30 +++++++------
 drivers/gpu/nova-core/firmware/booter.rs  | 46 ++++++++++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs   | 52 +++++++++++++++++------
 drivers/gpu/nova-core/firmware/gsp.rs     | 33 +++++++++-----
 drivers/gpu/nova-core/firmware/riscv.rs   | 16 ++++---
 drivers/gpu/nova-core/gfw.rs              | 14 +++---
 drivers/gpu/nova-core/gpu.rs              | 30 +++++++++----
 drivers/gpu/nova-core/gsp/boot.rs         | 44 ++++++++++++-------
 drivers/gpu/nova-core/regs.rs             | 24 ++++++++---
 drivers/gpu/nova-core/vbios.rs            | 29 +++++++++----
 22 files changed, 344 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..5b117aefdb15 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,12 +2,17 @@
 
 //! Simple DMA object wrapper.
 
-use core::ops::{Deref, DerefMut};
-
-use kernel::device;
-use kernel::dma::CoherentAllocation;
-use kernel::page::PAGE_SIZE;
-use kernel::prelude::*;
+use core::ops::{
+    Deref,
+    DerefMut, //
+};
+
+use kernel::{
+    device,
+    dma::CoherentAllocation,
+    page::PAGE_SIZE,
+    prelude::*, //
+};
 
 pub(crate) struct DmaObject {
     dma: CoherentAllocation<u8>,
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index edc72052e27a..2509f75eccb9 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,13 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    auxiliary, c_str,
+    auxiliary,
+    c_str,
     device::Core,
     pci,
-    pci::{Class, ClassMask, Vendor},
+    pci::{
+        Class,
+        ClassMask,
+        Vendor, //
+    },
     prelude::*,
     sizes::SZ_16M,
-    sync::Arc,
+    sync::Arc, //
 };
 
 use crate::gpu::Gpu;
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fb3561cc9746..9d46dc3f8c5e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -3,20 +3,28 @@
 //! Falcon microprocessor base support
 
 use core::ops::Deref;
+
 use hal::FalconHal;
-use kernel::device;
-use kernel::dma::DmaAddress;
-use kernel::io::poll::read_poll_timeout;
-use kernel::prelude::*;
-use kernel::sync::aref::ARef;
-use kernel::time::delay::fsleep;
-use kernel::time::Delta;
-
-use crate::dma::DmaObject;
-use crate::driver::Bar0;
-use crate::gpu::Chipset;
-use crate::regs;
-use crate::regs::macros::RegisterBase;
+
+use kernel::{
+    device,
+    dma::DmaAddress,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    sync::aref::ARef,
+    time::{
+        delay::fsleep,
+        Delta, //
+    }, //
+};
+
+use crate::{
+    dma::DmaObject,
+    driver::Bar0,
+    gpu::Chipset,
+    regs,
+    regs::macros::RegisterBase, //
+};
 
 pub(crate) mod gsp;
 mod hal;
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..12a6dee0f29e 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -2,8 +2,16 @@
 
 use crate::{
     driver::Bar0,
-    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::{self, macros::RegisterBase},
+    falcon::{
+        Falcon,
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::{
+        self,
+        macros::RegisterBase, //
+    }, //
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c6c71db1bb70..a8c8ae5ee323 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -2,9 +2,15 @@
 
 use kernel::prelude::*;
 
-use crate::driver::Bar0;
-use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
-use crate::gpu::Chipset;
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconBromParams,
+        FalconEngine, //
+    },
+    gpu::Chipset, //
+};
 
 mod ga102;
 
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index afed353b24d2..1c63e2bd4621 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -2,16 +2,24 @@
 
 use core::marker::PhantomData;
 
-use kernel::device;
-use kernel::io::poll::read_poll_timeout;
-use kernel::prelude::*;
-use kernel::time::Delta;
-
-use crate::driver::Bar0;
-use crate::falcon::{
-    Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconBromParams,
+        FalconEngine,
+        FalconModSelAlgo,
+        PeregrineCoreSelect, //
+    },
+    regs, //
 };
-use crate::regs;
 
 use super::FalconHal;
 
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 815786c8480d..ab1195a758f5 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,7 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
-use crate::regs::macros::RegisterBase;
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase, //
+};
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347..53e718510568 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -2,16 +2,24 @@
 
 use core::ops::Range;
 
-use kernel::prelude::*;
-use kernel::ptr::{Alignable, Alignment};
-use kernel::sizes::*;
-use kernel::sync::aref::ARef;
-use kernel::{dev_warn, device};
-
-use crate::dma::DmaObject;
-use crate::driver::Bar0;
-use crate::gpu::Chipset;
-use crate::regs;
+use kernel::{
+    dev_warn,
+    device,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::*,
+    sync::aref::ARef, //
+};
+
+use crate::{
+    dma::DmaObject,
+    driver::Bar0,
+    gpu::Chipset,
+    regs, //
+};
 
 mod hal;
 
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 2f914948bb9a..aba0abd8ee00 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -2,8 +2,10 @@
 
 use kernel::prelude::*;
 
-use crate::driver::Bar0;
-use crate::gpu::Chipset;
+use crate::{
+    driver::Bar0,
+    gpu::Chipset, //
+};
 
 mod ga100;
 mod ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033a..dae392c38a1b 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,15 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
-struct Ga100;
-
 use kernel::prelude::*;
 
-use crate::driver::Bar0;
-use crate::fb::hal::FbHal;
-use crate::regs;
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
 
 use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
 
+struct Ga100;
+
 pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
     u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index a73b77e39715..734605905031 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -2,9 +2,11 @@
 
 use kernel::prelude::*;
 
-use crate::driver::Bar0;
-use crate::fb::hal::FbHal;
-use crate::regs;
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
 
 fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 32114c3b3686..eec984f4e816 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::Bar0;
-use crate::fb::hal::FbHal;
-use crate::regs;
 use kernel::prelude::*;
 
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
+
 /// Shift applied to the sysmem address before it is written into `NV_PFB_NISO_FLUSH_SYSMEM_ADDR`,
 /// to be used by HALs.
 pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 = 8;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4179a74a2342..895309132ae0 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -3,18 +3,24 @@
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
 
-use core::marker::PhantomData;
-use core::mem::size_of;
-
-use kernel::device;
-use kernel::firmware;
-use kernel::prelude::*;
-use kernel::str::CString;
-use kernel::transmute::FromBytes;
-
-use crate::dma::DmaObject;
-use crate::falcon::FalconFirmware;
-use crate::gpu;
+use core::{
+    marker::PhantomData,
+    mem::size_of, //
+};
+
+use kernel::{
+    device,
+    firmware,
+    prelude::*,
+    str::CString,
+    transmute::FromBytes, //
+};
+
+use crate::{
+    dma::DmaObject,
+    falcon::FalconFirmware,
+    gpu, //
+};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index b4ff1b17e4a0..4d2a6502a879 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -4,20 +4,38 @@
 //! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
 //! (and optionally unload it through a separate firmware image).
 
-use core::marker::PhantomData;
-use core::mem::size_of;
-use core::ops::Deref;
-
-use kernel::device;
-use kernel::prelude::*;
-use kernel::transmute::FromBytes;
-
-use crate::dma::DmaObject;
-use crate::driver::Bar0;
-use crate::falcon::sec2::Sec2;
-use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
-use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
-use crate::gpu::Chipset;
+use core::{
+    marker::PhantomData,
+    mem::size_of,
+    ops::Deref, //
+};
+
+use kernel::{
+    device,
+    prelude::*,
+    transmute::FromBytes, //
+};
+
+use crate::{
+    dma::DmaObject,
+    driver::Bar0,
+    falcon::{
+        sec2::Sec2,
+        Falcon,
+        FalconBromParams,
+        FalconFirmware,
+        FalconLoadParams,
+        FalconLoadTarget, //
+    },
+    firmware::{
+        BinFirmware,
+        FirmwareDmaObject,
+        FirmwareSignature,
+        Signed,
+        Unsigned, //
+    },
+    gpu::Chipset, //
+};
 
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ce78c1563754..ae3ae72f74d9 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,20 +10,44 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
-use core::marker::PhantomData;
-use core::mem::{align_of, size_of};
-use core::ops::Deref;
-
-use kernel::device::{self, Device};
-use kernel::prelude::*;
-use kernel::transmute::FromBytes;
-
-use crate::dma::DmaObject;
-use crate::driver::Bar0;
-use crate::falcon::gsp::Gsp;
-use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
-use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
-use crate::vbios::Vbios;
+use core::{
+    marker::PhantomData,
+    mem::{
+        align_of,
+        size_of, //
+    },
+    ops::Deref, //
+};
+
+use kernel::{
+    device::{
+        self,
+        Device, //
+    },
+    prelude::*,
+    transmute::FromBytes, //
+};
+
+use crate::{
+    dma::DmaObject,
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp,
+        Falcon,
+        FalconBromParams,
+        FalconFirmware,
+        FalconLoadParams,
+        FalconLoadTarget, //
+    },
+    firmware::{
+        FalconUCodeDescV3,
+        FirmwareDmaObject,
+        FirmwareSignature,
+        Signed,
+        Unsigned, //
+    },
+    vbios::Vbios, //
+};
 
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 24c3ea698940..c5175434f6e4 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -2,16 +2,29 @@
 
 use core::mem::size_of_val;
 
-use kernel::device;
-use kernel::dma::{DataDirection, DmaAddress};
-use kernel::kvec;
-use kernel::prelude::*;
-use kernel::scatterlist::{Owned, SGTable};
-
-use crate::dma::DmaObject;
-use crate::firmware::riscv::RiscvFirmware;
-use crate::gpu::{Architecture, Chipset};
-use crate::gsp::GSP_PAGE_SIZE;
+use kernel::{
+    device,
+    dma::{
+        DataDirection,
+        DmaAddress, //
+    },
+    kvec,
+    prelude::*,
+    scatterlist::{
+        Owned,
+        SGTable, //
+    }, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::riscv::RiscvFirmware,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 /// Ad-hoc and temporary module to extract sections from ELF images.
 ///
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index afb08f5bc4ba..196dedb96aeb 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -5,13 +5,17 @@
 
 use core::mem::size_of;
 
-use kernel::device;
-use kernel::firmware::Firmware;
-use kernel::prelude::*;
-use kernel::transmute::FromBytes;
+use kernel::{
+    device,
+    firmware::Firmware,
+    prelude::*,
+    transmute::FromBytes, //
+};
 
-use crate::dma::DmaObject;
-use crate::firmware::BinFirmware;
+use crate::{
+    dma::DmaObject,
+    firmware::BinFirmware, //
+};
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index 23c28c2a3793..9121f400046d 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -18,12 +18,16 @@
 //!
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
-use kernel::io::poll::read_poll_timeout;
-use kernel::prelude::*;
-use kernel::time::Delta;
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
 
-use crate::driver::Bar0;
-use crate::regs;
+use crate::{
+    driver::Bar0,
+    regs, //
+};
 
 /// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds timeout.
 ///
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..de87efaf09f1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,13 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::*, sync::Arc};
-
-use crate::driver::Bar0;
-use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Falcon};
-use crate::fb::SysmemFlush;
-use crate::gfw;
-use crate::gsp::Gsp;
-use crate::regs;
+use kernel::{
+    device,
+    devres::Devres,
+    error::code::*,
+    fmt,
+    pci,
+    prelude::*,
+    sync::Arc, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp as GspFalcon,
+        sec2::Sec2 as Sec2Falcon,
+        Falcon, //
+    },
+    fb::SysmemFlush,
+    gfw,
+    gsp::Gsp,
+    regs, //
+};
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 2800f3aee37d..0997036b7d1d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,21 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::device;
-use kernel::pci;
-use kernel::prelude::*;
-
-use crate::driver::Bar0;
-use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
-use crate::fb::FbLayout;
-use crate::firmware::{
-    booter::{BooterFirmware, BooterKind},
-    fwsec::{FwsecCommand, FwsecFirmware},
-    gsp::GspFirmware,
-    FIRMWARE_VERSION,
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp,
+        sec2::Sec2,
+        Falcon, //
+    },
+    fb::FbLayout,
+    firmware::{
+        booter::{
+            BooterFirmware,
+            BooterKind, //
+        },
+        fwsec::{
+            FwsecCommand,
+            FwsecFirmware, //
+        },
+        gsp::GspFirmware,
+        FIRMWARE_VERSION, //
+    },
+    gpu::Chipset,
+    regs,
+    vbios::Vbios, //
 };
-use crate::gpu::Chipset;
-use crate::regs;
-use crate::vbios::Vbios;
 
 impl super::Gsp {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..a080520472a9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,13 +7,27 @@
 #[macro_use]
 pub(crate) mod macros;
 
-use crate::falcon::{
-    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
-    FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
-};
-use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
 
+use crate::{
+    falcon::{
+        DmaTrfCmdSize,
+        FalconCoreRev,
+        FalconCoreRevSubversion,
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconModSelAlgo,
+        FalconSecurityModel,
+        PFalcon2Base,
+        PFalconBase,
+        PeregrineCoreSelect, //
+    },
+    gpu::{
+        Architecture,
+        Chipset, //
+    }, //
+};
+
 // PMC
 
 register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index aec9166ffb45..b4711126038b 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,16 +2,27 @@
 
 //! VBIOS extraction and parsing.
 
-use crate::driver::Bar0;
-use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
-use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
-use kernel::device;
-use kernel::error::Result;
-use kernel::prelude::*;
-use kernel::ptr::{Alignable, Alignment};
-use kernel::transmute::FromBytes;
-use kernel::types::ARef;
+
+use kernel::{
+    device,
+    error::Result,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    transmute::FromBytes,
+    types::ARef, //
+};
+
+use crate::{
+    driver::Bar0,
+    firmware::{
+        fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDescV3, //
+    }, //
+};
 
 /// The offset of the VBIOS ROM in the BAR0 space.
 const ROM_OFFSET: usize = 0x300000;

base-commit: ade19c5060dfa39b84a9475a4a6b05e2a8a2b3ac
-- 
2.51.2

