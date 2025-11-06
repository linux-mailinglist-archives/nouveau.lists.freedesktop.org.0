Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A597C3906C
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026D10E335;
	Thu,  6 Nov 2025 03:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aYLMDg2f";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559FB10E334
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwsFdpm6pR34hwGlYZJffwYL19F0hqJDRCgFnCrlz0iy5ngcNZ9gJiuz+AGSHkIBKvFbCUPoouo7408cuXvsabpdzKpoJLyYA2VPd09m8yYdqIi13bIPgU5e9OetMjVMNmV1pg72bKkCCQeXnO2AO83o4+BwBVoqRk2xLncRhNuK35oPQb/XstOEfp/7VgwChx7pKsvltk5W/uLLyY7bTs5ZzsG843NcI3cr0QKOHMOnAAKaF/Zr4dZVUDdsLiid4QK+ose6VUo1Hq44EVEBNwxmOoULXPIomMSkjHtas1d3JXEzLXLqy52CxHgNyO0F1/8ZssAsSPT99cVP1llqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHEiB8ymmlnCfSaRrXoIsLio9Vt/E48+yOCOlfykoj0=;
 b=aIfh8VYRIIDKaotuiAXbOOGmcp9dv9w80x9W9fwk7D3cvVsjsK2XGUGPooMNH3EX/XbIOFCc2+8Kj4yRicAOYvVpS8HzdgYz8ZAljBTIvRHgfmyHIgcWg3htWhUZXIjPBlXsIQtfqCbdEmhSbHeLNi6cU4Mq6FY0E523mVvn8t8Mgv3/6FeaGzrwCjHwGIDZVXfzWO+LS1yoIZ3sgSHtiPu+JVTUOw+zMytV6oS56o4m0O2+Dn7P21jh+e3IYL1vpllPPleecikeSnRqYVHgMy3f3QDQqlwrWQYvY4gwnZ1DfHrbuN5mgXY5MtjGLzQVIn90Qso1nxDd42RqHyeHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHEiB8ymmlnCfSaRrXoIsLio9Vt/E48+yOCOlfykoj0=;
 b=aYLMDg2ft7FiBVeUDHByZvd8bojE/9H7zg7lC9xIOFylJytTK3ZItHsNRulKC0f8Ix+sd/nctawf2OAWArDijaqpOSsUAEHJAnGTCWTjwRzXV+9x5g/dQ6y/zKTZIYsKze1A7FRmr121HLK4Dg9GnUp2cMQwuMo5c0o4Qwgntba1fT60Pxu/c5qVhHIC3JyqjyIzawCcCp6aCbJnAa+UkBMsx2R+BIJ5QNQmTqYX1XwYgMgfOUHt6W9bNjHqoTNu/irZPD5XlFlbfgk/s0/xu/C5xhw5K5qbylihS3qjENzHIYXBaNo6BCs3p3nYj03gBg1kfzRiRQQV1BP9EU/tqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:38 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:38 +0000
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
Subject: [PATCH 1/6] gpu: nova-core: print FB sizes, along with ranges
Date: Wed,  5 Nov 2025 19:54:30 -0800
Message-ID: <20251106035435.619949-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: bd198c0e-8b57-4644-ad17-08de1ce8355c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YCex8XLGvz/GhQEXQixjuEEmaeE/SohmUSwKwUvV4OSvNYNO7CjqCvNLKk2V?=
 =?us-ascii?Q?vtutAvuE9XS2drWdGpdKeaDvwGPQM+nVxyL/0jqUXWA3JuZeg4lnWfGRAgGS?=
 =?us-ascii?Q?mCuEEF7UGKh2pfZQ4R5/XBeJUvs9B/au3BajiJtOG3/FSKtGx65+bRhsFV+U?=
 =?us-ascii?Q?rMIvLaGvh6gDmoIrTsxAVxrBA+uq1rbYMYBsaOo8jqcr/3IIRv6Ew+Gn/TKD?=
 =?us-ascii?Q?gLT0slOdeNmPbUHz3+ywBHxOtvdXm4P6Q2iY+wNWEpKCtPpe4v3Lj4dQ7PGS?=
 =?us-ascii?Q?Y+581J7qtznAeTFRUEMbMIkul9/u8o6Oj3Lmw6iRiTe4vzP6hLS/7u1R3SR1?=
 =?us-ascii?Q?HNf5BxoYxakz9HYZLNMkM+tE6z/SFULtRx/OIUUFXrXmTaTqOhnrNglV+hWc?=
 =?us-ascii?Q?7nY+QpqaN/D8EllspkXbAnwK5beqhUOHbu4ZJryztHQxBP39gw/B6JJ2g/8r?=
 =?us-ascii?Q?wFjCrnRwq3U3TD7NLzoOs9TusUeNa14j45Yxu7uJkG4bx1dxYlAyxgz6QuHb?=
 =?us-ascii?Q?w98hxBo8RGPCBL7V/nGtTA0hI746aV8Wit6JowaUspnUBRYMHfdYthrD/FyC?=
 =?us-ascii?Q?VMlQd0GXdTPKsu8ZH/fBVE6wcTWOFboPmhnyiRhnRrdW4fbas5rsEMWw2UCg?=
 =?us-ascii?Q?Ir6IAdoeHGQDJN/Kd26viGd2wD92Pi5Hfvrd56xtQxGE0X9pKoxONSFx+60j?=
 =?us-ascii?Q?6JkTL+ulI4kys0VdhzfcgbAotlceTquUarFqArFtM4mx6cg7Bm8SovO/Vsw5?=
 =?us-ascii?Q?xVJNT87yeK1Uyn/3ewOs7K4EHaE1QV1mFfc9x6e321gwB2FjxyBufDkjrkiF?=
 =?us-ascii?Q?fVUkLSIfEji5sb128k34o5i7EfPHG/RkHKF+fhY0l6lAzMNUOx+buW+L50n6?=
 =?us-ascii?Q?fXfofNwRzUuMtbB363qEASh8b/9I8NJqNN0TVLVT6qSNFVoKFHOu5PBC/Li4?=
 =?us-ascii?Q?xP6I9ui83f5X+vPG3x6JSXIyJ5WRfweXH3WNdaWt9k3aAYiZASkng1zVLbRv?=
 =?us-ascii?Q?OvGYeWQ/V/CZHDhRDUVZxlJTYvYzQsqyUAaIrqrjx4+N5N5DMKMZEmOzbsKB?=
 =?us-ascii?Q?wN2gStIHWjkv0nRWgSDbOmZf7FrA/XsVvedmNIZEXYx9jJU/Odt8hQo0pCNb?=
 =?us-ascii?Q?krEBpiCAu/y+PukFNP0JCT6WqoHHp3ErVzjLVduo+YVfY5Ij373w37PGBx0x?=
 =?us-ascii?Q?U22vK92P1x5T4cslBggB7X39gL+oLbYH5uklsd2oi0iIj1imyJBOxx7fL2TF?=
 =?us-ascii?Q?9nq3FlGpZ5Oi/ov2IPWHLzsPcYbtzhoZarmYT8bfdHB8CFgeUyn1Qk6c6/zP?=
 =?us-ascii?Q?wfs61wmAdyPdS/+PHm/ILVnIvJACem/zEILkOaOUOb6t2rtUnIxTTdS96n3I?=
 =?us-ascii?Q?/FzMMwiJAMB0t5H1grfz6VM+j6m+WmlpNZ+e4WAddqlbTJa754W7f4XMONZg?=
 =?us-ascii?Q?dFxIGEbcgZySFRLl2EDI7vc1kOp+oieu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxGTy1A7aZ5uTqOAeU9CGl8hSxaXPbCPcSq51GEG2v8NWweI5FgjQ0LRPYkz?=
 =?us-ascii?Q?6cFHzx6CJzv0/5FJORTsGOjKWYVeGqDXJa4MC9adA+keRcoH6MqbGWPHnG4s?=
 =?us-ascii?Q?TjvAgCuG+1574PWFmtpPZJ70rnF9eee5VAIGSFbHefJLGQ09IiWa1jUvSk6m?=
 =?us-ascii?Q?nyz/v711RTWz1kFPKnfayQ5RJXzl6nceMoYB7jk5BU1ujC569/Ne78nFNgT7?=
 =?us-ascii?Q?rxQKPGcGqnUJncoLLImQI9trsLO24wccBICF0Q9iN6y8Met5ImBfcQ11CmE3?=
 =?us-ascii?Q?KWsEmW24M7Q1NIUicer5fbWs0kkY3uNZb/Lb0RDKPYR/lLYoOx3SGbqikpcp?=
 =?us-ascii?Q?wbypmoA00GNfnfIUcehAttxxqreQkZ83VLHv+dAxTI3e59ucibrVIZBq69Od?=
 =?us-ascii?Q?FKLn7+0TBwT4ZVWCMPw+kMG2C7AYFVbYk/F+kk5zANv6ly5/n2ugksc165s0?=
 =?us-ascii?Q?v5gMcSNGaRX+wu3xw5agXy7r5/l8P5UEKzAHQwC+pTbNu/sCwhDI/vcFR4OF?=
 =?us-ascii?Q?0x0dkOcNvjLAdUjODwKlq+n/Dt6jxb/jDeN/kc5hwFmeDYA0H3ReXVjGKE5+?=
 =?us-ascii?Q?wMIQ8ULvdSZiptJMfOfSMg6OPuTgQVv+QC4ZZmqohDkApioZiSzNzZWQXRCM?=
 =?us-ascii?Q?0TOsXuUN+Ly3M+VmcDJ0Y3hx+YMCCrawaBHkgszjH31J3c/5jG3EDvQRJNjR?=
 =?us-ascii?Q?XDM6FZtxMeAls5uJrnvOsSW0x8qt61jfvxrI5wrC6oidtPE1USiDtN3eN+MM?=
 =?us-ascii?Q?St1/O0NS8joEXAJBkZ5hyNeTk1T2wI0yebhW0YfRFPS1MXedDAmu8hrftchp?=
 =?us-ascii?Q?8IV6OSfXWwgMSL4KReC9ZEIcZCotFiC8rxfo1ALhu9+wWi8ec3hrGefslytx?=
 =?us-ascii?Q?CIZ+E5NsnEjqiOpF+A0QApcmTuuHtK+GZHCJZj6cKK34T7U+jRDxaZ0cU12t?=
 =?us-ascii?Q?eGiYuk/648g8EFUYEjpCdb2I6/JOFrwvJdNZReFKWTJbW9QWg8A710CHMFZq?=
 =?us-ascii?Q?zgGvngWTIGaGkjYfEcD3eigKOpZ6oi0ZKZ/vVJc31OwuaQoboecPfTuF+01W?=
 =?us-ascii?Q?FY9PSbBkJ3wDkc1Ueq0RLeFocFNTXC/AMBiywbSOVoSPnuyH4tT3f55y9ibV?=
 =?us-ascii?Q?TMwFX+s2rckrD7ErSajzu+aKEVqrIS/F4ZOhKYUSVJ8wKeX4ZdBMXg6glDsW?=
 =?us-ascii?Q?13qWT0asMjftwgeUmn2gCBSA18Jw08ySQ0/u2WZr5ex8gawzuzfGm4Yci9IZ?=
 =?us-ascii?Q?aZXX8STFHW9o7SzkfwmjwsXTcYcKndydA5Yg+weI61tBsufCEWrMzTpX8fvo?=
 =?us-ascii?Q?wBRSTlYP6gv832v5KF2hYryoSWi5W3dajan0cZcPYplRBLMZbktGn8wqqFPB?=
 =?us-ascii?Q?kCqzqa6dkxYBs+AYyG/avIG2lEpe/RdgyK2yA8uHvauGrkW+9JlDH0fjv4+J?=
 =?us-ascii?Q?vR6WQPF1fvrb0OL2hAfwDAXa3yz7BNQYAQdn5cFVE8CN/OFDorf1xFYyXzoS?=
 =?us-ascii?Q?nNwH8tyHXav0qzorfIwI8+qefG1ET5f8y+cId1zefpz5C20dRy0ouWtJdxVp?=
 =?us-ascii?Q?RQDafvfsM7Oo4X1hyrtkkwS0X18E1wiaMoZjL/k9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd198c0e-8b57-4644-ad17-08de1ce8355c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:38.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUFdiC2mqCIvTQNpoaKE2opyG9wLVL4ibl6q3U8rB1KCUN6mjooSGbF+HEVI3zyuJSR6DEkUy3UTWiI2B6FHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

For convenience of the reader: now you can directly see the sizes of
each range. It is suprising just how much this helps.

Sample output:

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MB),
    frts: 0x3ff600000..0x3ff700000 (1 MB),
    boot: 0x3ff5fa000..0x3ff600000 (0 MB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MB),
    heap: 0x3f3700000..0x3f3800000 (1 MB),
    vf_partition_count: 0x0,
    rsvd_size: 0x1a00000,
}

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 33 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs |  2 +-
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 10406b6f2e16..004238689f26 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
-#[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
@@ -107,6 +106,38 @@ pub(crate) struct FbLayout {
     pub(crate) vf_partition_count: u8,
 }
 
+struct RangeWithSize<'a>(&'a Range<u64>);
+
+impl core::fmt::Debug for RangeWithSize<'_> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        if self.0.start == 0 && self.0.end == 0 {
+            write!(f, "0x0..0x0")
+        } else {
+            let size_mb = (self.0.end - self.0.start) >> 20;
+            write!(f, "{:#x}..{:#x} ({} MB)", self.0.start, self.0.end, size_mb)
+        }
+    }
+}
+
+impl core::fmt::Debug for FbLayout {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("FbLayout")
+            .field("fb", &RangeWithSize(&self.fb))
+            .field("vga_workspace", &RangeWithSize(&self.vga_workspace))
+            .field("frts", &RangeWithSize(&self.frts))
+            .field("boot", &RangeWithSize(&self.boot))
+            .field("elf", &RangeWithSize(&self.elf))
+            .field("wpr2_heap", &RangeWithSize(&self.wpr2_heap))
+            .field("wpr2", &RangeWithSize(&self.wpr2))
+            .field("heap", &RangeWithSize(&self.heap))
+            .field(
+                "vf_partition_count",
+                &fmt!("{:#x}", self.vf_partition_count),
+            )
+            .finish()
+    }
+}
+
 impl FbLayout {
     /// Computes the FB layout for `chipset`, for running the `bl` GSP bootloader and `gsp` GSP
     /// firmware.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index bd3be366526e..c27a90aa782c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -141,7 +141,7 @@ pub(crate) fn boot(
         )?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
-        dev_dbg!(dev, "{:#x?}\n", fb_layout);
+        dev_dbg!(dev, "{:#?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-- 
2.51.2

