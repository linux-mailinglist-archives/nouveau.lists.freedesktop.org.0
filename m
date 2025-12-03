Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6FC9DD88
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CE10E70B;
	Wed,  3 Dec 2025 05:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hB53tjWo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58010E0EA
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSbXDr2vywCPwUoKuAtReA51rjJbYx54aOzpDA1XXVvwnO+dj5MjE61OPI8LGkxunkCQ5QREdO12OSvkQVdsUR0KCH/8E+1IFVh/ZMFDZlHcoS0CZt4gzZy8bB2QyoHDZPwIASqiEectgtyb0Z7FVI3sEmL9F33qYcQlI97op1D92VWkalic/4l/gN3s54E62y2dpTL0X6T48WGKDrOFosJHMn/ykrPPzd4I0x7j272e754esjFOOnOHzs2j8cssTt58vrlk8GKbozKScHmpmjZoo1VuinPVTW0cx6W0y6MzUCPEBoOv/miiHPQaHHX7xxzS1moYxjlWLvZKqp9Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2W7M3cAIjXVKJTMCPeml/9b4P0A6sOaa33d+65U6l0=;
 b=NOFPHbbtpS77EcOhnpJtCRJLJniNdNq5UMGBHq/XXsX63HkUsPSWg63OWxAiaRmmaHJquQXpj0mp1pb3YYL2HKocuiUzyeDWwgbBeKfFDoNqejZkAm5zxtns55FKmZjrAwX2iCGrUYj3r72WElhflkQiu6q1hZrRxFJjqGkW5+9epHi83niR3NIFaQ6b+0t0XlhCI6tnA74XGbAQieNWzT5OrmfKzKsrDlPnq4aAFWzD9kznpmdiYHbA7OIqBjtUn/Q/tnKffEuMnc7ANa17f0ZtPr0C6psB4skZwKOE+BWFEfF7f5uedtte91w4PRS0bCwB1MhyJiUqcFTJ7SzyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2W7M3cAIjXVKJTMCPeml/9b4P0A6sOaa33d+65U6l0=;
 b=hB53tjWox3mG8ReAiBbU8j+TreVcmRrmGsCnATyXzC1IHy/L2lXc39ynQjrb3TwQSzqLeJEHVnQh/JnMxqTxrzdmNVWlghTY/pQ94U+ZO9BfmFwyWzaLfnFwQ/t0L0Oz0UWUEZRMqo8dLwtHFzUF8Bddy4heO7BL6d8VmUFTvBzJ5X8zIZcIo7XfSZa1xhMjyVDhkscv+JF+be/0IAF2XdWySJDPyFOaf6I1Pj6CuxepqFXeERifEa3u2Jqf/1OOE7lB6i1qnOkCFbfJ5ewCKj8aGoEDFvOMJz02qi0XerzW1oPpHicxh8iP1zHL/Lj2HVdT6pUGSI+rwHEBkG08fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:43 +0000
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
Subject: [PATCH 12/31] gpu: nova-core: add auto-detection of 32-bit,
 64-bit firmware images
Date: Tue,  2 Dec 2025 21:59:04 -0800
Message-ID: <20251203055923.1247681-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd1b16d-122a-4fbe-14e9-08de3231276e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2BBnHZbdPdWeG+jLPdhA4lf3T1YSJXBqtTNFIQCTeKt3WEUv5HKqpSX+QUd6?=
 =?us-ascii?Q?Z14D9r4hNdtZeFdCunRM15ELd+diJxefB4mFx9bpMHmkHCV4rNheLLv4olFc?=
 =?us-ascii?Q?L230bipMNOtSECg0BCUzbtD9m9D7SWEDzZz/haWT0t+axtY03ZMI+qeIiPpC?=
 =?us-ascii?Q?ckAVbhNv6w6kxyrTax1oKU/+yQbueZHkU0grDMLUf1+YEacAJsLAoeCSZoZc?=
 =?us-ascii?Q?ztAz4pi54o/r5ykICB2ptnMcaNz6NVgf2aF/6EyjMy8XKs+2Fg8fHsfkEFWs?=
 =?us-ascii?Q?hql10CbjldlV7sOa6mObO37HAAzB4wM3j3P0zLn2iqhdubHS2nySTxl8pfFK?=
 =?us-ascii?Q?O/05ShjJpsAaKwtlCiYNqJhSQESBNYZQBIeyCdFoLj2trIpI8D+kC+vjnzM/?=
 =?us-ascii?Q?NW/BATwMzUi1uaT/uJ2VH4ccm1Lg9a2wcBVRIrp4I7iXrTzwzCZx1zNw8swl?=
 =?us-ascii?Q?AZcHY/4MAHMdTHY79h5K4H6aTKfFG7GiMR/hn14FxSoD7m3QUVHRC3sRGRFU?=
 =?us-ascii?Q?+o2XMUfmaBW2SiQCOr+cIrPVQXVOsfsD/BLyGUVJABZ3u7LTO1EWUZwq2iP/?=
 =?us-ascii?Q?rveZG9Xkk94TsPafPhTiwiONk7VLHYFZySxAzI+VEkJpaSDzLXTpaOud2fPb?=
 =?us-ascii?Q?a7qL/Z3crA6vTNNK72pdXp8j30kK5EaVDNMWCzVsYu0dLS0MXTTkiVaa75RM?=
 =?us-ascii?Q?vW9OkAEpIefMEnvxYg3mt/BHObv5nysUFLwtNIQY9XmnT9pnB9Op74T9s44J?=
 =?us-ascii?Q?u3yEUCmN9dhWrKkWGh/Gq5dRWEdCMsBjQtAABoNa+j/wVUPPIINbAiShwTW0?=
 =?us-ascii?Q?PKtiGdV4vXN+kketZqlZ6z2d34feZUzez2hYeUMvjux87c4rZAaemJV1yyU8?=
 =?us-ascii?Q?8YG5RvyEPaslae3+4nP+AZ2e5j1u4K1+Yvf0sqqBB1xFmLOFw/1Iu2ebnzVr?=
 =?us-ascii?Q?1yStYxjaX/h237g9ilj4ZrdyEjzqbYfD3VdRLsACBPU1M785xUUDe55yT9d8?=
 =?us-ascii?Q?W3mu2DicvzFR/u8uMPozvRYQiz7T4pks9Z6cWOaAsHDLAp4Qu7E8MEtIFi0r?=
 =?us-ascii?Q?/E1uZ41y5p7N/oaGXSzVPRlpPlvyFBKhl0lw7ozyxWL+yFtyCn9yKLethKgj?=
 =?us-ascii?Q?LTLTeqFmZO8x1BL2bzERonSKHkew0SWwRl7Knb+UGqBqtTk3kkMCGTYm/zGx?=
 =?us-ascii?Q?UAxjW0zz23p4yRII7yXO8cuvHm9X9EQpYN6YD9rc61f/fUBGUq+O6iZeS+QZ?=
 =?us-ascii?Q?YEYjb9UTZlq9N+ZXRRROonFdXUwU8u9Ce5X2jt9ne4WbAgKh8N/6Fz2/e231?=
 =?us-ascii?Q?nSPSFd0eChxvasKZ85F8/TOUdJLWOry8xd0O+z2rk3uwGN5XAWYUmRHPa/LY?=
 =?us-ascii?Q?0Gxt5pkhGMZ/62Ue3N9qmt4UbqA9MLsM7mp8pFFupVXN1cQ8oJh+FXxxcTst?=
 =?us-ascii?Q?vT4EH6jXdD29xYBjKVNJp97v1PBb2+Cn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XFXxOFOqljcErR8kyyYGI03xmZmuz8+a4fXpG0mwVmEgmjo5ZeyZEC75JRsD?=
 =?us-ascii?Q?ZSvfGWpcunvzt3bzckMr/c1qM+U4LMJuABY2GQ8gwFlJa6yft9Ui8P6Qbx5j?=
 =?us-ascii?Q?Uwf5iB8suf3hM8XbxRBkKpBin9RoGcEJgyZ3JvsFO9XX3wAfLymbY/UZ/WUk?=
 =?us-ascii?Q?5q90017WhShJfWHx9gkrdPDdBnynmUovAkgrx6ozPN5zOYEOC2mIQuFMfTAi?=
 =?us-ascii?Q?dNDT44E7KG9vSF10lY3i8vAJUx1K66TuZxLVHEwjV4/zkkKs9/briBBYotk5?=
 =?us-ascii?Q?f1YyUrvlhXgL5RtYXJvQjpWIUtYkrJy94dTRRTteaneGexQMMRuy1lMtBZ0V?=
 =?us-ascii?Q?aYLxaQ655AivdY9EYiLhf1Id/AUxHNnUplk6WJL3gzjSbCQaTFcw4Icd51gd?=
 =?us-ascii?Q?75L+fqOR+1UnjPEGnTI7RVH1CiZHi+4ndFSiTnKMGEXG0DS5XuyoXrIMKI2I?=
 =?us-ascii?Q?PsRbWEiKythoWPr9kLTYvyj8PLzi5ukbkd8YX6DcWeu4jctyOUdnKmw2Ml03?=
 =?us-ascii?Q?zSWVJXzEfSSupHMurmpjnhtpHF0J8s4LMnN0F9qnt32djM/gfE2cbkkklJ0r?=
 =?us-ascii?Q?tg3TprZugp6MNeJatTDegLrufyZ1n7hpcNiRfzPhnBdm1Ze4PSWuq1Q5TjEm?=
 =?us-ascii?Q?6oqPesidMd+TxqgesJWQbRVbkNGMwYeTQsjKIlX6IfuBjCogaRJ+BOSVIxVT?=
 =?us-ascii?Q?VFh1yKAIuIg3AAxQc3kwjmmQjUBF4skskaS8tIDonwOBk1mb6RYkqZUatW7v?=
 =?us-ascii?Q?1hVcfeXxGnJfo5/YUPbIWUFNtZh3I7Z9WP8+dXhNIBpGe2y5RvArOEryfJqn?=
 =?us-ascii?Q?13ZocmttP6vL5WakMT0w5TBUP1Q4kcj2x+Rom1zN2BJSmwWvQjvGl7FwUahE?=
 =?us-ascii?Q?N601r/7HpbNQVjlTc++TF5VocPdvLulE3I4ZLRs09+KxwgVzOrlf8aEOrZdP?=
 =?us-ascii?Q?4eALL/RQ3yr+laE88Dh8z4OqCz5MWjfciRbOqcFqTgC9s1ALCuwISQJfigok?=
 =?us-ascii?Q?oROxF++ozG/4niNT7OLCXgtnSHRFZzM4xEozcKBi0iuw9NN8+GHWn+rDpZy/?=
 =?us-ascii?Q?4qFLsCw9TkcHkveJm5U+p9Di1Y2B9YuSjAOWt7JngBqskguX43CKHt9q/Sqe?=
 =?us-ascii?Q?P6gB+2y2r6GnLFe4P5EY7/1t5IuvUiS7/t1GbxYk6U5BNpKyQmEUlqpT7IBv?=
 =?us-ascii?Q?+ia2WoUz+vrjD58NBterXyPn9AjgF1ikl6VImtXW8FHEVnAEqsEAd3ZM1Azy?=
 =?us-ascii?Q?QNf6slJAXHyTNUIz9Yu+mXGw2o4TtNur/iaBSMf6gjxt7sFG/I8py/4dTIog?=
 =?us-ascii?Q?sY06Jt3EUX7UuVlFTEp/6rq8ARCJvkkq6Xrss0LNQfN9XueQKbIVH4j0Rs+B?=
 =?us-ascii?Q?L7uJit9xN0W5eRN1Bf3xsBU9vUoNT8Dvf6oh8ndfeJkj4Aob3RYKJLoSWdBY?=
 =?us-ascii?Q?gTk62Rp6XYa0H1ps4kOuuMgwr+yiR4WSQC8sF1VJOblsKkcDRYDeF6/zLTgV?=
 =?us-ascii?Q?Q8Fgo4K6itpYBwMec1vxtEXAvI05lwoaVli5wGgdasq7UxlgIQrfG743NMr5?=
 =?us-ascii?Q?tNZTBH2oHSaNq/0vy7mL0NaXs48MCz0senFYrBKy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd1b16d-122a-4fbe-14e9-08de3231276e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:43.1532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssy+ReoXDBtTNxQva2cp7IBpIEU1/l41aZNTH9qXxwHeAsxbtf1QJ0Pr20jacOiHekxxTZvZxqICJ4UmPvFzSg==
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

Add elf_section() which checks the ELF magic and class byte to
automatically dispatch to elf32_section() or elf64_section().

Update existing callers to use elf_section() instead of calling
elf64_section() directly.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 20 +++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index c355e0d7e407..e45b91bb45a3 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -408,13 +408,27 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     }
 
     /// Extract the section with name `name` from the ELF64 image `elf`.
-    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
 
     /// Extract section with name `name` from the ELF32 image `elf`.
-    #[expect(dead_code)]
-    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
     }
+
+    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
+    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        // Check ELF magic.
+        if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
+            return None;
+        }
+
+        // Check ELF class: 1 = 32-bit, 2 = 64-bit.
+        match elf.get(4)? {
+            1 => elf32_section(elf, name),
+            2 => elf64_section(elf, name),
+            _ => None,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 4d84bd049d9c..1f473e73a428 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -98,10 +98,10 @@ pub(crate) fn new<'a, 'b>(
     ) -> Result<impl PinInit<Self, Error> + 'a> {
         let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+        let fw_section = elf::elf_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = Self::get_gsp_sigs_section(chipset)?;
-        let signatures = elf::elf64_section(fw.data(), sigs_section)
+        let signatures = elf::elf_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
             .and_then(|data| DmaObject::from_data(dev, data))?;
 
-- 
2.52.0

