Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF52C9DDA6
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0E10E71E;
	Wed,  3 Dec 2025 06:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i+VuiOBr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6FA10E71A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niPlXn3p5wRK35QQIHWUspRNX9/i1YWunCvZKxdFPxQOS79vhJilf5VWsa/JsOJqRl9VVblK8QPvduGCDG3V5h2XYWlfxUAiGD6Goldl/BHb3KiwhopA47UYvzWLNjO+RMFyrD8duN0ZtTDoUI8bujDRWGSHyUflm6EYj+nnElIytG5ftctyAzZaSqK5P5BTqOqn52JTiuXZwap35cJY9q4atUL1MIOKKqCXqd2fxLqyN749X3oSat94T2VT5+tvvlvX1UbGOrNjrddzfcHcpMqAtsjTOlMTgTL9m8jW7a0MVkLKvbZTVj/y+zuKJegAiguEiEDm/a4mrHrF3Q8JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIzypWxlBy/eRYQxSyokpeT9JffE7985eh//3Unmy4k=;
 b=tkZyIGcbYHIrozVGmxOmLCvyaS5W0oF8tWHy8SvGS9l15KtJCHM5ScRrf8ikXYe4HJa7NQ0Gn9hfeJOqgns2t/npxFgR4TCmWBbyTKIDJEI9xzX29eRf/XDDqvXQ0RBhlL+6ygd1+gP9HEZBTxw+4A94eOl9HLkIIYGy1ARSu5iUILGh/nSOEIm2bI2PESHqwIZOZRvSW9Ft7wUmkf/6s3w28WJJg12VX5k3OBI//VVNWFQBNccrYL0wgCyLym9QM3+jiGrbTcTfiYhk6LpAUzyW9t/s5bcjYqZ8yPRnTkyTZ1eHSf170rF9eW8gFMCIRRq5duqiM5cVsP05pHWtlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIzypWxlBy/eRYQxSyokpeT9JffE7985eh//3Unmy4k=;
 b=i+VuiOBrELqae4oUXX2YlM4D6asf9mPSYLNFJegWAkfCvK57PyQxkHV5jj9qk65yKEaeHe3QRwZDJeKEx0hGRGW6qQejO/BWz2xBLWWpITI9Sw0FMsf1+c6cwmgk8xmfBLB1Es2kdYFlS109JPP2nok4MBRxl+wmoG1Bv8QhmR8RfHSuu7m8+7KEQ8fZdQ/uq3qfjLHPfH51na6BWvmgKuPhveYmZl+rY6e5Icd+ZD0/mb6z4kjVHLqHIP1BzC+rmvYO6xmnbnfWpx5Q04UyyNZ+dP5xbuMeSVtYCgKCi9voryaOBFmMZNQSkIGNKl+l5OtJeBPv1/A6AVbTXZOmAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:55 +0000
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
Subject: [PATCH 21/31] gpu: nova-core: Hopper/Blackwell: add FMC signature
 extraction
Date: Tue,  2 Dec 2025 21:59:13 -0800
Message-ID: <20251203055923.1247681-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ff6408-1fb1-4022-3048-08de32312eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cFKC5d82iL8frGobtbLBspnFCfFihBDVNrfheQhNFmtSpvKVLteli+o7Dd7x?=
 =?us-ascii?Q?XFZN7T2/ISL68C/tMxFd00UBTMJuZHzQQw6ko4bzi0vH0j9vZtKp0+Vkwpmv?=
 =?us-ascii?Q?76UsnjW5ZOQu3eSv6Oh7kWwmqhPaCgwl3sHXtYmyj8qZwqzOdz3wN8qF4pM9?=
 =?us-ascii?Q?vWJiP9FRsYFyKXhaOW+yo/NPD+YI5dJAERMiEFC4iUq1qE6ePGay7qqKJqCL?=
 =?us-ascii?Q?ZpmFv48kg9DTxG+GkMQu5q13O1m7fahLLbc6eN4JzNeOsEezyodRT87SACWy?=
 =?us-ascii?Q?pgoQvbjs7ekrpXvogakJyxeARSvLF9rEfnl82ThzzuO/a838vkLJCYgPC5H+?=
 =?us-ascii?Q?FMrfOVKKaAtWmPfbUANz5wnr88dC2PteFVDLFHUusERH12EHehKJeGfu0pJO?=
 =?us-ascii?Q?yPQnNDWJYFt2+zXtISK21i5GjZTrBqb2TuM6d+V7E59hPEgy/Al3luT84Ktu?=
 =?us-ascii?Q?8+iuKr1xE7UKjdYrBhhw0VuHqBtVcCN3Fz3kPfPgUQDlMO+gIZn64nRuaHb2?=
 =?us-ascii?Q?wIW49JIJ+PuOt2f10LYg/bmKk45e2iGlykqQONa3c45zGEZpR3J6vN3bbMQL?=
 =?us-ascii?Q?co37T/W3IrrvUb+yjNmk1S4GrbxihpSHxb0VgljGIZPjhmG/SRu7mJDarJ5V?=
 =?us-ascii?Q?COLLX0aJsjQr0pnzYOynQVpqq4GLQ/VUelHlMlgEyoFe+QmKXzBm8IFlyewt?=
 =?us-ascii?Q?bvTheDtMm3Qigww3zmgftbMXte6R5Rx4/ZefS4YIAjpeoVLOABHK/UpjB+1R?=
 =?us-ascii?Q?7vquHeLoV0tGTkv/vgUmuZNzLzLEvlaX0GY9vyMdJbr4RPcCrMy8vdrOcudM?=
 =?us-ascii?Q?/EtIBHI7zj4mwF14MWu1mo8+oiQV6FfrvJwKHwcQB2xJorZ2SoAuMcRUUi24?=
 =?us-ascii?Q?LIfBYIsxSarQOfynaEW6yToirFbQwKIOONjnyvxaD4r1PYooEz4y4kvrsRq8?=
 =?us-ascii?Q?JEXzMO1sKge9OPwm/Jp6stihUvao5qxbizClzAizelmVbdCOHpjupCV9c7/E?=
 =?us-ascii?Q?mU/7lKOYDKeC4tGIgmxQ+lMcZGIc8kV8LIj726V4Dhcz8AXA+BpvddmBXl7H?=
 =?us-ascii?Q?e9ZDbuQ7Gcr9gxpv4OstjazGAHfmOKnn5w789EjbklIhQD7NZy4jaPPCsXqb?=
 =?us-ascii?Q?Xp5Jnq28v3QeFpoy/NmxaV5e5VqVl2EVAE9LOzOtFukw1LMaDp9JH1tKIlTt?=
 =?us-ascii?Q?4zVdk1ZidAYDSVK6xmWdg+JnRlgmPRPdBjOjoUsg/CXbP3Mr1tVqzxgP+EMJ?=
 =?us-ascii?Q?7bmQ9o+M9jsdfFG2Gj1t6JBOkJ+E3+jYw+2IOiO66TsCj10vR8N6EzuJxGT7?=
 =?us-ascii?Q?lSGELQ3JPZTTHduTQUP6snbU17C3NK2Gev61mJ642dAXnx5YQebl/VQeztZB?=
 =?us-ascii?Q?sG2ZuWwj5IBvAGT13Nu8YJp9jgjPULKWsD0FJL2fd2n20HeP+EWzJZYhCAbn?=
 =?us-ascii?Q?13iNh6GFMJQQAIdzxgxAmvpvog7DuACm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ns5xxXCHG6a/w7+Tnzd1eAcnjINGE3wXJgLdwkCwU9KQDOeTpJb1seP8DlD5?=
 =?us-ascii?Q?DNnpuJeSXCUi8jOv36z9nps1AxCYcJAoxT2UGA31FnHuiLxDBx4R0hEBs3gP?=
 =?us-ascii?Q?ciABN/IAc17L93XavIQftQ1rcXVKkjb7StGY1myfDeHcMat3UTx4YJF8kf4B?=
 =?us-ascii?Q?uh712EGtzrex0LanQP2uFAvVAnhqwEn4CXx2YPX07zDVVxNBR6fwxfkCMRui?=
 =?us-ascii?Q?vQ3We7B5Dxfp1OrHc8ImAP6dPsiIY/Uo+Hk/64egaaiv707w1LkHpMeVQcs1?=
 =?us-ascii?Q?p+6Tl0A/y5sG83sTvUUxeUzUoWxYUcTrUkxfZSbYkCs4W53tikd7kILPQAsA?=
 =?us-ascii?Q?aSzAMU/+GPucN2UL8WKAQc3kqk+SvAomJeGTW5iX99XOC2vGvIpbFAiAklrS?=
 =?us-ascii?Q?bwarxet7Ktao0p6LzryadeJmXOD/LHlX1X4qpgja8D/aoeOtbrPop4vu5HyY?=
 =?us-ascii?Q?+uCe6fjyoVag8tMou4BSDG23FrVEQhWJmz5o0/cNqi2Mx2BADzTUKKghhzcs?=
 =?us-ascii?Q?ArHddA40hJGQ2IHYTiamdoo/SskoNPKDbkb75HVUnamPTt+e61eARIVfTJcV?=
 =?us-ascii?Q?uwuROR18U4GTf2fWv0UqueMRMuJNvUvLr+Hi6mwbO/XgdFkPHVU5JgMwfxiI?=
 =?us-ascii?Q?45NPQgD+0baixIbK6IeWOmEZ4q8d3i+JkyMNdx7f8SaQDD3Lbcgicmx9HhwQ?=
 =?us-ascii?Q?KTN7FaaDzGmyONhtOGHt8S8SEpmc9S3Up9nmD8/xqZO8Raa6u0OCiyvNIagQ?=
 =?us-ascii?Q?r65LdIZ4wxrlFg2VH/kmmots7dAo3ARZAg1ldP7xRKoz2jfzaqNXCF4vboh1?=
 =?us-ascii?Q?k60jdiol1Ru91pIksePfRcmc/SOfQaH/E+QNv6VzTVSgjYtQfoEr1mw79HM/?=
 =?us-ascii?Q?2JbHuygnf1a3RmnAkl6mLfByiCB8XHEmvgu/9dVBJ2lH9wXTp/KvNY/CBBvN?=
 =?us-ascii?Q?HQBogTNTWubAy9O37Tk07NISSHcgUR+aTEGXCem17fM+RTYFrUTJYuZi01ys?=
 =?us-ascii?Q?nQR+/YGvLDNTkU+HKVP+wZ36jJBsnrBqJPhOgKVTxN0+Vp/+MxDKZUxWIXe2?=
 =?us-ascii?Q?LvUp1fzNP9BW00wk6eZqyzczvXpWoQJABgkRT0EU2hZate5VZ3oK/sYsvTzw?=
 =?us-ascii?Q?T0U2Fh5y4s/TH8OYazHqVuN73JwL1U4fn9TDVw9icy2F7gRiXL/BpX/zw9rx?=
 =?us-ascii?Q?OqYL0jB4s/nNxVRh6fYx0/NWA5AsCE33B+5TbmzYqWkbFJztfCWW9NNXnPvc?=
 =?us-ascii?Q?er2tdUmcuNm4DmWxvSsZt910DDVbatSbmW+HzxMvS1SvNIRk8n6pki7J+QcO?=
 =?us-ascii?Q?EI0pZGnYjky5fJzFLtvfdblHAbCgu2eVR4vZ5gQNriWS+v0ZFTvTXiG0LQGp?=
 =?us-ascii?Q?i+oN11iRoMZ449LeSRTLbmf3IhG0g7a9ImzmHzhYHVT5L3uGCCTGyfXxtuBK?=
 =?us-ascii?Q?n+YHZnyZTaUqBPuw1S7ix6dTP8p7iff5C52/JoysAcgvlqdw8qwOyrFcRVHy?=
 =?us-ascii?Q?gJb3LoReXZRSli/mB/UNJXIHY8mkCWA+tvqS3SOvMYoSCNx7VM+56CP3BCw0?=
 =?us-ascii?Q?ONHs888IuEI+ko7zmY1Zh+7EgtWnHhympECHNJq1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ff6408-1fb1-4022-3048-08de32312eb5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:55.7667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ydXihKMqoO9X/DNx0J0SZOqxnG3UoUbj0j+jGNW6+5n5ihjl5c9LyUrSoKHiXuF+vcQImkC1okn5Zy3y9tngQ==
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

Add extract_fmc_signatures_static() to parse cryptographic signatures
from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
public key, and signature needed for Chain of Trust verification.

Also exposes the elf_section() helper from firmware.rs for use by FSP.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |   4 +-
 drivers/gpu/nova-core/fsp.rs      | 104 ++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 5cbb8be7434f..7f8d62f9ceba 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -23,6 +23,8 @@
     },
 };
 
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -419,7 +421,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 389c43bfd538..311b6d4c6011 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -256,4 +256,108 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    pub(crate) fn extract_fmc_signatures_static(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        dev_dbg!(dev, "FMC firmware size: {} bytes\n", fmc_fw_data.len());
+
+        // Extract hash section (SHA-384)
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        // Extract public key section (RSA public key)
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        // Extract signature section (RSA signature)
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        dev_dbg!(
+            dev,
+            "FMC ELF sections: hash={} bytes, pkey={} bytes, sig={} bytes\n",
+            hash_section.len(),
+            pkey_section.len(),
+            sig_section.len()
+        );
+
+        // Validate section sizes - hash must be exactly 48 bytes
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Public key and signature can be smaller than the fixed array sizes
+        if pkey_section.len() > FSP_PKEY_SIZE * 4 {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE * 4
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE * 4 {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE * 4
+            );
+            return Err(EINVAL);
+        }
+
+        // Allocate signature structure on heap to avoid stack overflow
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        // Copy hash section directly as bytes (48 bytes exactly)
+        // SAFETY: hash384 is a [u32; 12] array (48 bytes), and we create a byte slice of
+        // exactly FSP_HASH_SIZE (48) bytes. The pointer is valid and properly aligned.
+        let hash_bytes = unsafe {
+            core::slice::from_raw_parts_mut(
+                signatures.hash384.as_mut_ptr().cast::<u8>(),
+                FSP_HASH_SIZE,
+            )
+        };
+        hash_bytes.copy_from_slice(hash_section);
+
+        // Copy public key section (up to 388 bytes, zero-padded)
+        // SAFETY: public_key is a [u32; 96] array (384 bytes), and we create a byte slice of
+        // FSP_PKEY_SIZE * 4 bytes. The pointer is valid and properly aligned.
+        let pkey_bytes = unsafe {
+            core::slice::from_raw_parts_mut(
+                signatures.public_key.as_mut_ptr().cast::<u8>(),
+                FSP_PKEY_SIZE * 4,
+            )
+        };
+        pkey_bytes[..pkey_section.len()].copy_from_slice(pkey_section);
+
+        // Copy signature section (up to 384 bytes, zero-padded)
+        // SAFETY: signature is a [u32; 96] array (384 bytes), and we create a byte slice of
+        // FSP_SIG_SIZE * 4 bytes. The pointer is valid and properly aligned.
+        let sig_bytes = unsafe {
+            core::slice::from_raw_parts_mut(
+                signatures.signature.as_mut_ptr().cast::<u8>(),
+                FSP_SIG_SIZE * 4,
+            )
+        };
+        sig_bytes[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.52.0

